import os
from collections import defaultdict

def parse_violations_by_mode(filename):
    violations = defaultdict(list)
    with open(filename, 'r') as f:
        for line in f:
            if line.startswith("Not allowed: "):
                parts = line.strip().split(" in mode ")
                if len(parts) == 2:
                    func_name = parts[0].replace("Not allowed: ", "").strip()
                    mode = parts[1].strip().upper()
                    violations[mode].append(func_name)
    return violations

def read_allowed_functions(mode):
    filepath = f"{mode.lower()}.functions.out"
    if not os.path.exists(filepath):
        print(f"Warning: {filepath} not found.")
        return set()
    with open(filepath, 'r') as f:
        return set(line.strip() for line in f if line.strip())

def main():
    violation_log = "/home/mohsen/rvd-project/RVDefender/profiles/access_violation_direct.log"
    violations_by_mode = parse_violations_by_mode(violation_log)

    for mode, violated_funcs in violations_by_mode.items():
        allowed_funcs = read_allowed_functions(mode)
        missing_funcs = [fn for fn in violated_funcs if fn not in allowed_funcs]

        print(f"\nMode: {mode}")
        if missing_funcs:
            print(f"  Violated functions NOT found in {mode.lower()}.functions.out:")
            for fn in missing_funcs:
                print(f"    {fn}")
        else:
            print(f"  All violated functions are present in {mode.lower()}.functions.out.")

if __name__ == "__main__":
    main()

