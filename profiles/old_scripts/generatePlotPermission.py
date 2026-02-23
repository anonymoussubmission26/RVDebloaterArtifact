import matplotlib.pyplot as plt
import re

def parse_function_addresses(file_path):
    addresses = []
    with open(file_path, 'r') as f:
        for line in f:
            match = re.search(r'@ (0x[0-9a-fA-F]+)', line)
            if match:
                addresses.append(int(match.group(1), 16))  # Convert hex to int
    return addresses

def plot_function_permissions(addresses):
    y_values = ['x'] * len(addresses)  # Permissions (execution)
    x_values = sorted(addresses)  # Sort addresses for better visualization
    
    plt.figure(figsize=(10, 5))
    plt.scatter(x_values, [1] * len(x_values), label='Execution (x)', color='blue')
    plt.xticks(rotation=45)
    plt.xlabel('Function Address (Hex)')
    plt.ylabel('Permission Type')
    plt.yticks([1], ['x'])
    plt.title('Function Addresses vs Execution Permissions')
    plt.legend()
    plt.grid(axis='x', linestyle='--', alpha=0.6)
    plt.show()

if __name__ == "__main__":
    file_path = "AUTO_functions.txt"  # Change this to your actual file
    addresses = parse_function_addresses(file_path)
    plot_function_permissions(addresses)

