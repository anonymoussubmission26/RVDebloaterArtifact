from collections import defaultdict

def process_file(filename):
    mode_functions = defaultdict(set)
    all_functions = defaultdict(set)

    with open(filename, 'r') as file:
        for line in file:
            line = line.strip()
            if not line or line.startswith("Mode: ") or ": " not in line:
                continue
            
            mode, function_with_address = line.split(': ', 1)
            # Extract function name without the address (everything before @)
            function = function_with_address.split('@')[0]
            mode_functions[mode].add(function)
            all_functions[function].add(mode)

    # Identify common functions (used in all modes)
    all_modes = set(mode_functions.keys())
    common_functions = {func for func, modes in all_functions.items() if modes == all_modes}

    # Remove common functions from mode-specific lists
    for mode in mode_functions:
        mode_functions[mode] -= common_functions

    return common_functions, mode_functions

def generate_linker_script(common_functions, mode_functions):
    with open("custom.ld", "w") as f:
        f.write("SECTIONS {\n")

        # Place Common Functions in a single region
        f.write("    .common_functions : {\n")
        for function in sorted(common_functions):
            f.write(f"        *({function})\n")
        f.write("    } > COMMON_REGION\n\n")

        # Place each mode's functions in a separate region
        for i, (mode, functions) in enumerate(mode_functions.items(), start=1):
            f.write(f"    .{mode}_functions : {{\n")
            for function in sorted(functions):
                f.write(f"        *({function})\n")
            f.write(f"    }} > MODE{i}_REGION\n\n")

        f.write("}\n")

if __name__ == "__main__":
    common_functions, mode_functions = process_file("mode_profile")
    generate_linker_script(common_functions, mode_functions)
    print("Generated custom.ld with grouped functions.")

