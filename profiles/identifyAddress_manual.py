import subprocess

# Input files
functions_file = "GUIDED_functions.txt"
elf_file = "arducopter"

# Step 1: Read all function names from the file
with open(functions_file, "r") as f:
    mangled_functions = [line.strip() for line in f if line.strip()]

# Step 2: Use nm to get all symbols from the ELF binary
nm_output = subprocess.run(["nm", "--defined-only", elf_file], capture_output=True, text=True).stdout

# Step 3: Create a symbol table {mangled_name -> address}
symbol_table = {}
for line in nm_output.splitlines():
    parts = line.split()
    if len(parts) == 3:  # Format: "address type name"
        address, _, name = parts

        # Demangle the name using c++filt
        demangled_name = subprocess.run(["c++filt", name], capture_output=True, text=True).stdout.strip()
        
        # Store both mangled and demangled names
        hex_address = f"0x{int(address, 16):x}"  # Convert to integer and format as hex
        symbol_table[name] = hex_address
        symbol_table[demangled_name] = hex_address  # Allow lookup by demangled name

# Step 4: Find addresses of the given mangled function names
with open("functions_with_addresses.txt", "w") as out_file:
    for mangled in mangled_functions:
        address = symbol_table.get(mangled, "NOT FOUND")
        out_file.write(f"{mangled} {address}\n")

print("Saved function addresses to functions_with_addresses.txt")

