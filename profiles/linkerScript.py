import os
import re
from collections import defaultdict

# Directory containing function files
FUNCTIONS_DIR = "./"  # Change if files are in a different directory

# Output linker script
LINKER_SCRIPT = "custom.ld"

# Regex pattern to extract function details
FUNC_PATTERN = re.compile(r"(\S+) @ (0x[0-9a-fA-F]+) \| Size: (0x[0-9a-fA-F]+)")

def parse_function_file(filename):
    """Parse function files to extract function names, addresses, and sizes."""
    functions = []
    total_size = 0

    with open(filename, "r") as f:
        for line in f:
            match = FUNC_PATTERN.match(line.strip())
            if match:
                func_name, addr, size = match.groups()
                addr = int(addr, 16)
                size = int(size, 16)
                functions.append((func_name, addr, size))
                total_size += size

    return functions, total_size

def generate_linker_script():
    """Generate a linker script based on function files."""
    sections = {}
    memory_regions = {}

    # Process function files
    for filename in os.listdir(FUNCTIONS_DIR):
        if filename.endswith("_functions.txt") or filename == "CommonFunctions.txt":
            mode_name = filename.replace("_functions.txt", "").replace(".txt", "")
            filepath = os.path.join(FUNCTIONS_DIR, filename)

            functions, total_size = parse_function_file(filepath)
            sections[mode_name] = functions
            memory_regions[mode_name] = total_size

    # Generate linker script
    with open(LINKER_SCRIPT, "w") as ld_file:
        ld_file.write("MEMORY {\n")
        base_address = 0x20000000  # Example start address, adjust as needed

        # Define memory regions
        for mode, size in memory_regions.items():
            ld_file.write(f"  {mode}_region (RWX) : ORIGIN = 0x{base_address:X}, LENGTH = 0x{size:X}\n")
            base_address += size  # Adjust base address for next section

        ld_file.write("}\n\nSECTIONS {\n")

        # Define sections
        for mode, functions in sections.items():
            ld_file.write(f"  .{mode}_section : {{\n")
            for func_name, addr, size in functions:
                ld_file.write(f"    *({func_name})\n")
            ld_file.write(f"  }} > {mode}_region\n\n")

        ld_file.write("}\n")

    print(f"Generated linker script: {LINKER_SCRIPT}")

if __name__ == "__main__":
    generate_linker_script()

