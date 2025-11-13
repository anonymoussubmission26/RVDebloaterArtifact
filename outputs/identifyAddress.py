import subprocess
import glob
import os

# Get all files matching *_functions.txt
function_files = glob.glob("*.functions.out")
# elf_file = "arducopter"
# elf_file = "arduplane"
elf_file = "ardurover"

for functions_file in function_files:
    # Read all function names from the file
    with open(functions_file, "r") as f:
        mangled_functions = [line.strip() for line in f if line.strip()]

    # Use nm to get all symbols from the ELF binary
    nm_output = subprocess.run(["nm", "-a", "--defined-only", elf_file], capture_output=True, text=True).stdout

    # Create a symbol table {mangled_name -> address}
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

    # Generate output file name (same as input file)
    output_file = functions_file  # Replace input file

    # Find addresses of the given mangled function names and save to file
    with open(output_file, "w") as out_file:
        for mangled in mangled_functions:
            #address = symbol_table.get(mangled, "0x000000")
            address = symbol_table.get(mangled)
            if address:  # Only write if address is found
            	out_file.write(f"{mangled} {address}\n")

    print(f"Processed {functions_file}, saved function addresses to {output_file}")

