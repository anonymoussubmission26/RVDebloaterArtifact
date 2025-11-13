import os
import re

def extract_function_and_mode(line):
    match = re.search(r'Not allowed: (\S+) in mode (\S+)', line)
    if match:
        return match.group(1), match.group(2)
    return None, None

def search_function_in_file(function_name, mode):
    filename = f"../../outputs/{mode.lower()}.functions.out"
    if not os.path.exists(filename):
        return f"File {filename} not found."
    
    with open(filename, 'r') as f:
        content = f.read()
        return "FOUND" if function_name in content else "NOT FOUND"

def main():
    input_file = "../../profiles/access_violation_direct_6.log"  # Change to your actual input file
    
    with open(input_file, 'r') as f:
        lines = f.readlines()
    
    for line in lines:
        function_name, mode = extract_function_and_mode(line)
        if function_name and mode:
            result = search_function_in_file(function_name, mode)
            if result == "NOT FOUND":
                print(f"{function_name} in {mode}: {result}")

if __name__ == "__main__":
    main()

