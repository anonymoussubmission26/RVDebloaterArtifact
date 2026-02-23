import subprocess
import json

# Input files
functions_file = "auto.functions.out"
elf_file = "arducopter"

# Step 1: Read all function names from the file
with open(functions_file, "r") as f:
    function_data = json.load(f)  # Assuming it's a JSON file

# Flatten the dictionary to get all mangled function names
mangled_functions = []
for mode, functions in function_data.items():
    mangled_functions.extend(functions)

# Step 2: Use nm -C to get all symbols from the ELF binary
nm_output = subprocess.run(["nm", "-C", "--defined-only", elf_file], capture_output=True, text=True).stdout

# Step 3: Create a symbol table {function_name -> address}
symbol_table = {}
for line in nm_output.splitlines():
    parts = line.split()
    if len(parts) == 3:  # Format: "address type name"
        address, _, name = parts
        symbol_table[name] = address

# Step 4: Demangle names and find addresses
with open("functions_with_addresses.txt", "w") as out_file:
    for mangled in mangled_functions:
        # Demangle using c++filt
        demangled = subprocess.run(["c++filt", mangled], capture_output=True, text=True).stdout.strip()

        # Look up the demangled name in the ELF symbol table
        address = symbol_table.get(demangled, "NOT FOUND")

        # Write function name and address to the text file
        out_file.write(f"{demangled} {address}\n")

print("Saved function addresses to functions_with_addresses.txt")

