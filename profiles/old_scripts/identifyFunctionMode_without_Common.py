from collections import defaultdict

def process_file(filename):
    mode_functions = defaultdict(set)  # Store all functions for each mode
    current_mode = None  # Track the current mode
    temp_functions = set()  # Temporarily store functions for the current mode

    with open(filename, 'r') as file:
        for line in file:
            line = line.strip()
            if not line or line.startswith("Mode: ") or ": " not in line:
                continue  # Skip empty lines and lines starting with "Mode: "
            
            mode, function = line.split(': ', 1)
            
            if mode != current_mode:
                # If switching to a new mode, store the previous mode functions
                if current_mode is not None:
                    mode_functions[current_mode].update(temp_functions)
                temp_functions.clear()
                current_mode = mode
            
            temp_functions.add(function)
            mode_functions[mode].add(function)  # Ensure all functions are stored
    
    # Save functions to separate files for each mode
    for mode, functions in mode_functions.items():
        with open(f"{mode}_functions.txt", "w") as f:
            for function in sorted(functions):
                f.write(function + "\n")


def compare_file(filename):
    mode_functions = defaultdict(set)  # Store the first set of functions for each mode
    seen_functions = defaultdict(set)  # Keep track of all seen functions per mode
    current_mode = None  # Track the current mode
    temp_functions = set()  # Temporarily store functions for the current mode

    with open(filename, 'r') as file:
        for line in file:
            line = line.strip()
            if not line or line.startswith("Mode: ") or ": " not in line:
                continue  # Skip empty lines and lines starting with "Mode: "
            
            mode, function = line.split(': ', 1)
            
            if mode != current_mode:
                # If switching to a new mode, save the previous mode functions
                if current_mode is not None and current_mode not in mode_functions:
                    mode_functions[current_mode] = temp_functions.copy()
                temp_functions.clear()
                current_mode = mode
            
            temp_functions.add(function)
            
            if mode in mode_functions and function not in mode_functions[mode]:
                print(f"{mode}: {function}")

if __name__ == "__main__":
    process_file("mode_profile")
