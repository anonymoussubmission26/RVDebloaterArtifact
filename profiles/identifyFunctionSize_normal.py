import subprocess
import re
import sys

# Check command-line arguments
if len(sys.argv) != 3:
    print("Usage: python script.py <binary_file> <functions_txt>")
    sys.exit(1)

# Get paths from arguments
binary_path = sys.argv[1]  # Binary file (executable)
functions_file = sys.argv[2]  # TXT file with function names & addresses

# Read function names and addresses
functions = []
with open(functions_file, "r") as f:
    for line in f:
        match = re.match(r"(\S+) @ (0x[0-9a-fA-F]+)", line.strip())
        if match:
            func_name, addr = match.groups()
            functions.append((func_name, int(addr, 16)))

# Run objdump to get symbol table with sizes
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

        # Store the function size if it's the largest found
        if addr not in function_sizes or size > function_sizes[addr]:
            function_sizes[addr] = size

# Update the text file with function sizes
with open(functions_file, "w") as f:
    for func_name, addr in functions:
        size = function_sizes.get(addr, "Not Found")
        size_str = f"0x{size:x}" if isinstance(size, int) else "Not Found"
        f.write(f"{func_name} @ {hex(addr)} | Size: {size_str}\n")
        
print("Function sizes added to", functions_file)
