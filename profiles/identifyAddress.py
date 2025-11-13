import subprocess
import glob
import os

# Get all files matching *_functions.txt
function_files = glob.glob("*_functions.txt")
# elf_file = "arducopter"
elf_file = "arduplane"
# elf_file = "ardurover"
# elf_file = "px4"

# New: file and function to look for
extra_file = "attackfunc.txt"
# extra_function_name = "call_motors_armed_wrapper"  # Change this to your target function name
extra_function_name = "call_motors_shutdown_wrapper"  # Change this to your target function name


# --- Step 1: Build the symbol table once ---
nm_output = subprocess.run(["nm", "--defined-only", elf_file],
                           capture_output=True, text=True).stdout

symbol_table = {}
for line in nm_output.splitlines():
    parts = line.split()
    if len(parts) == 3:  # address type name
        address, _, name = parts
        demangled_name = subprocess.run(["c++filt", name],
                                        capture_output=True, text=True).stdout.strip()
        hex_address = f"0x{int(address, 16):x}"
        symbol_table[name] = hex_address
        symbol_table[demangled_name] = hex_address

# --- Step 2: Process all *_functions.txt files ---
for functions_file in function_files:
    with open(functions_file, "r") as f:
        mangled_functions = [line.strip() for line in f if line.strip()]

    with open(functions_file, "w") as out_file:
        for mangled in mangled_functions:
            address = symbol_table.get(mangled)
            if address:
                out_file.write(f"{mangled} {address}\n")

    print(f"Processed {functions_file}, saved function addresses to {functions_file}")

# --- Step 3: Find and save the extra function ONCE ---
address = symbol_table.get(extra_function_name)
if address:
    with open(extra_file, "w") as ef:  # or "a" if you want to append
        ef.write(f"{extra_function_name} {address}\n")
    print(f"Added {extra_function_name} {address} to {extra_file}")
else:
    print(f"Function {extra_function_name} not found in {elf_file}")
