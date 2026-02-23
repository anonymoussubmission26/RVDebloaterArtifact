import os
import re

# Set this to the path of your ArduPilot firmware source
source_root = "/home/mohsen/rvd-project/ardupilot/Rover"

# Add the include statement for dummy.h
dummy_include = '#include "dummy.h"\n'

# Regex to detect a function definition, excluding control flow statements
func_def_pattern = re.compile(r'''
    ^\s*                              # optional leading whitespace
    (?!if|for|while|switch|else)      # skip control flow
    [\w:\<\>\*&\s]+?                  # return type and possible templates
    \s+[\w:~]+                        # function name
    \s*\([^;{}]*\)                    # argument list in ()
    \s*(const)?                       # optional const
    \s*(override|final)?              # optional override/final
    \s*$                              # end of line (function signature ends here)
''', re.VERBOSE)

def instrument_file(filepath):
    with open(filepath, "r") as f:
        lines = f.readlines()

    new_lines = []
    inserted_dummy_include = False  # Flag to check if #include "dummy.h" has been inserted

    i = 0
    while i < len(lines):
        line = lines[i]
        
        # Add #include "dummy.h" after all #includes
        if not inserted_dummy_include and (line.strip().startswith("#include") or not line.strip()):
            new_lines.append(line)
        else:
            # If #include "dummy.h" is not yet inserted and we've passed the #include section
            if not inserted_dummy_include and not line.strip().startswith("#include"):
                new_lines.append(dummy_include)  # Add the dummy include
                inserted_dummy_include = True  # Mark #include "dummy.h" as inserted
                new_lines.append(line)
            else:
                new_lines.append(line)

        i += 1

    # Now process the file to insert __dummy(); inside functions
    new_lines = process_function_calls(new_lines)

    # Write the modified file back
    with open(filepath, "w") as f:
        f.writelines(new_lines)

def process_function_calls(lines):
    new_lines = []
    i = 0
    while i < len(lines):
        line = lines[i]

        if func_def_pattern.match(line):
            new_lines.append(line)

            i += 1
            while i < len(lines) and not lines[i].strip().startswith("{"):
                new_lines.append(lines[i])
                i += 1

            if i < len(lines) and lines[i].strip().startswith("{"):
                new_lines.append(lines[i])  # Add the opening brace `{`
                new_lines.append("    __dummy();\n")  # Insert the dummy call after `{`
        else:
            new_lines.append(line)

        i += 1

    return new_lines

def walk_and_instrument(root):
    for dirpath, _, filenames in os.walk(root):
        for file in filenames:
            if file.endswith((".cpp", ".c")):
                full_path = os.path.join(dirpath, file)
                try:
                    instrument_file(full_path)
                    print(f"✔ Instrumented: {full_path}")
                except Exception as e:
                    print(f"✘ Failed: {full_path} → {e}")

# Start instrumenting
walk_and_instrument(source_root)
