import subprocess
import re
import sys

# Check command-line arguments
if len(sys.argv) != 3:
    print("Usage: python script.py <binary_file> <custom_ld_file>")
    sys.exit(1)

# Get paths from arguments
binary_path = sys.argv[1]  # Binary file (executable)
ld_file = sys.argv[2]      # custom.ld file with function sections

# Read the custom.ld file to find section names and functions
sections = {}
with open(ld_file, "r") as f:
    current_section = None
    for line in f:
        # Look for section names and function addresses in the LD file
        section_match = re.match(r"\.(\S+)\s*:", line.strip())
        if section_match:
            current_section = section_match.group(1)
            sections[current_section] = []
        elif current_section:
            func_match = re.match(r"\s*\*?\((\S+)\)", line.strip())
            if func_match:
                func_name = func_match.group(1)
                sections[current_section].append(func_name)

# Run objdump to get the symbol table with sizes
objdump_cmd = ["objdump", "-t", binary_path]
result = subprocess.run(objdump_cmd, capture_output=True, text=True)

# Extract function addresses and sizes
function_sizes = {}
for line in result.stdout.split("\n"):
    match = re.match(r"([0-9a-fA-F]+)\s+\w+\s+F\s+\.text\s+([0-9a-fA-F]+)\s+(\S+)", line.strip())
    if match:
        addr, size, func_name = match.groups()
        addr = int(addr, 16)
        size = int(size, 16)
        function_sizes[func_name] = size

# Calculate the total size for each section
section_sizes = {section: 0 for section in sections}

for section, funcs in sections.items():
    for func in funcs:
        size = function_sizes.get(func, 0)
        section_sizes[section] += size

# Generate MEMORY block based on section sizes
memory_block = "MEMORY\n{\n"
start_address = 0x20000000  # Example start address, can be adjusted

for idx, (section, total_size) in enumerate(section_sizes.items()):
    # Calculate region size by rounding up to nearest 0x1000 (4KB)
    region_size = (total_size + 0xFFF) & ~0xFFF  # Round up to 0x1000
    region_name = f"MODE{idx + 1}_REGION" if section != "common_functions" else "COMMON_REGION"
    
    memory_block += f"    {region_name} (rx) : ORIGIN = 0x{start_address:x}, LENGTH = 0x{region_size:x}\n"
    start_address += region_size  # Increment the address for the next region

memory_block += "    // Add other regions as necessary\n}\n"

# Write the MEMORY block and the rest of the custom.ld file
with open(ld_file, "r") as f:
    ld_content = f.readlines()

# Insert MEMORY block on top of custom.ld content
with open(ld_file, "w") as f:
    f.write(memory_block)  # Write the generated MEMORY block
    f.writelines(ld_content)  # Write the rest of the LD content

# Output the section sizes
print("Section Sizes (in bytes):")
for section, total_size in section_sizes.items():
    print(f"{section}: {total_size} bytes")

print(f"Memory block added to {ld_file}")

