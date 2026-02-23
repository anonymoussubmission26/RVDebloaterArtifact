# fnr_per_mode.py

import os

def load_function_set(filename):
    with open(filename, 'r') as f:
        return set(line.strip() for line in f if line.strip())

def calculate_fnr(config_set, executed_set):
    false_negatives = config_set - executed_set  # Functions in config but never executed
    fnr = (len(false_negatives) / len(config_set)) * 100 if config_set else 0.0
    return fnr, len(config_set), len(false_negatives)

def evaluate_modes(modes, config_dir, executed_dir):
    fnr_results = []

    for mode in modes:
        config_file = os.path.join(config_dir, f"{mode}_functions_config.txt")
        executed_file = os.path.join(executed_dir, f"{mode}_functions_executed.txt")

        if not os.path.exists(config_file) or not os.path.exists(executed_file):
            print(f"Skipping mode {mode} (missing files)")
            continue

        config_set = load_function_set(config_file)
        executed_set = load_function_set(executed_file)

        fnr, total, missed = calculate_fnr(config_set, executed_set)

        print(f"\n--- Mode: {mode} ---")
        print(f"Config functions: {total}")
        print(f"Not executed (False Negatives): {missed}")
        print(f"FNR: {fnr:.2f}%")

        fnr_results.append(fnr)

    if fnr_results:
        avg_fnr = sum(fnr_results) / len(fnr_results)
        print(f"\n=== Average FNR across all modes: {avg_fnr:.2f}% ===")
    else:
        print("No valid results found.")

# Example usage
if __name__ == "__main__":
    # List your modes here
    modes = ["AUTO", "CIRCLE", "STABILIZE", "GUIDED", "RTL", "LOITER"]

    # Adjust these paths if needed
    config_dir = "."         # Directory with *_functions_config.txt
    executed_dir = "."       # Directory with *_functions_executed.txt

    evaluate_modes(modes, config_dir, executed_dir)

