def count_unique_lines(file_path):
    unique_lines = set()
    
    with open(file_path, 'r', encoding='utf-8') as file:
        for line in file:
            unique_lines.add(line.strip())  # Remove leading/trailing spaces and add to set
    
    print(f"Number of unique lines: {len(unique_lines)}")

# Example usage
file_path = "access_violation_direct.log"  # Replace with the actual file path
count_unique_lines(file_path)

