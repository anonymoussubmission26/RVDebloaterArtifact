import re

# Load first file (list of function names)
with open("auto.functions.out", "r") as f1:
    content1 = f1.read()

# Extract function names from the first file (before any special characters like @ or parentheses)
functions_file1 = set(re.findall(r'"(_Z[\w\d]+)"', content1))

# Load second file (functions with addresses)
with open("AUTO_functions.txt", "r") as f2:
    content2 = f2.read()

# Extract function names from the second file (before '@' symbol)
functions_file2 = set(re.findall(r"(_Z[\w\d]+)", content2))

# Normalize function names by stripping spaces
functions_file1 = {func.strip() for func in functions_file1}
functions_file2 = {func.strip() for func in functions_file2}

# Find missing functions
missing_functions = functions_file2 - functions_file1

# Print missing functions
print("Functions in file2 but not in file1:")
for func in sorted(missing_functions):
    print(func)

