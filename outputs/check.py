# filenames
file1 = "LOITER_functions.txt"  # functions to check
file2 = "loiter.functions.out"  # functions with addresses

# read file1
with open(file1, "r") as f:
    funcs_to_check = [line.strip() for line in f if line.strip()]

# read file2
with open(file2, "r") as f:
    funcs_in_file2 = [line.strip().split()[0] for line in f if line.strip()]

# check for functions not in file2
not_found = [func for func in funcs_to_check if func not in funcs_in_file2]

# print result
print("Functions not found in file2:")
for func in not_found:
    print(func)

