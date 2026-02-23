from collections import defaultdict

def process_file(filename):
    mode_functions = defaultdict(set)  # Store all functions for each mode
    all_functions = set()  # Track all functions encountered
    mode_count = defaultdict(int)  # Count occurrences of each function across modes
    total_modes = 0  # Count total number of modes
    current_mode = None  # Track the current mode
    temp_functions = set()  # Temporarily store functions for the current mode

    # First pass: Collect all functions per mode
    with open(filename, 'r') as file:
        for line in file:
            line = line.strip()
            if not line or line.startswith("Mode: ") or ": " not in line:
                continue  # Skip empty lines and "Mode: " headers
            
            mode, function = line.split(': ', 1)
            function = function.split(' @', 1)[0]  # Extract function name before '@'
            
            if mode != current_mode:
                if current_mode is not None:
                    # Store previous mode's functions before switching
                    mode_functions[current_mode].update(temp_functions)

                current_mode = mode
                total_modes += 1  # Increase mode count when switching
                temp_functions.clear()  # Clear only after storing

            temp_functions.add(function)
            all_functions.add(function)
            mode_count[function] += 1  # Track how many modes use this function

        # Store last mode's functions
        if current_mode is not None:
            mode_functions[current_mode].update(temp_functions)

    # Identify common functions (shared across all modes)
    common_functions = {func for func, count in mode_count.items() if count == total_modes}

    # Save common functions
    with open("Common_functions.txt", "w") as f:
        for function in sorted(common_functions):
            f.write(function + "\n")

    # Save functions specific to each mode
    for mode, functions in mode_functions.items():
        mode_specific_functions = functions
        with open(f"{mode}_functions.txt", "w") as f:
            for function in sorted(mode_specific_functions):
                f.write(function + "\n")

if __name__ == "__main__":
    process_file("mode_profile")

