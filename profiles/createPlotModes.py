import matplotlib.pyplot as plt
import re
import os

def parse_function_addresses(file_path):
    """Extract function addresses from a given file."""
    addresses = []
    with open(file_path, 'r') as f:
        for line in f:
            match = re.search(r'@ (0x[0-9a-fA-F]+)', line)
            if match:
                addresses.append(int(match.group(1), 16))  # Convert hex to int
    return addresses

def plot_function_permissions(file_paths):
    """Plot function addresses for different modes with distinct markers and colors."""
    mode_names = []
    mode_addresses = []
    markers = ['o', 's', 'D', '^', 'v', '*', 'x', '+']  # Different markers for distinction
    colors = ['blue', 'red', 'green', 'purple', 'orange', 'brown', 'pink', 'gray']
    
    all_addresses = []
    for file_path in file_paths:
        addresses = parse_function_addresses(file_path)
        all_addresses.extend(addresses)
    
    if not all_addresses:
        print("No addresses found in the given files.")
        return
    
    min_address = min(all_addresses)  # Normalize addresses by subtracting the minimum address
    
    for i, file_path in enumerate(file_paths):
        mode_name = os.path.basename(file_path).replace('_functions.txt', '')
        addresses = parse_function_addresses(file_path)
        if addresses:
            mode_names.append(mode_name)
            normalized_addresses = [addr - min_address for addr in addresses]
            mode_addresses.append((normalized_addresses, i))  # Store normalized addresses and y-value
    
    plt.figure(figsize=(12, 6))
    for idx, (addresses, y_value) in enumerate(mode_addresses):
        marker = markers[idx % len(markers)]
        color = colors[idx % len(colors)]
        plt.scatter(addresses, [y_value] * len(addresses), label=mode_names[y_value], marker=marker, color=color, edgecolors='black')
    
    plt.xlabel('Normalized Function Address')
    plt.ylabel('Mode')
    plt.yticks(range(len(mode_names)), mode_names)
    plt.title('Function Addresses vs Modes (Normalized)')
    plt.legend()
    plt.grid(axis='x', linestyle='--', alpha=0.6)
    plt.show()

if __name__ == "__main__":
    file_paths = ["AUTO_functions.txt", "CIRCLE_functions.txt", "LOITER_functions.txt", "RTL_functions.txt", "STABILIZE_functions.txt", "GUIDED_functions.txt", "Common_functions.txt"]  # Add more as needed
    plot_function_permissions(file_paths)

