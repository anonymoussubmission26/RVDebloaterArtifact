import matplotlib.pyplot as plt
import os
import matplotlib.ticker as ticker

# Data (20 missions in total)
x = [2, 4, 6, 8, 10, 12, 14, 16, 18, 20]
# y_arduplane = [00, 00, 00, 00, 00, 00, 00, 00, 00]
# y_arducopter = [328, 150, 147, 139, 135, 118, 112, 71, 0]  # Replace with your actual data "71 == 100"
# y_arducopter = [208, 40, 37, 29, 25, 8, 0, 0, 0]  # Replace with your actual data -110
# y_arducopter = [208, 154, 0, 0, 0, 0, 0, 0, 0]  # manual
# y_arducopter = [116, 108, 37, 29, 25, 8, 0, 0, 0]  

y_arduplane = [2, 0, 0, 0, 0, 0, 0, 0, 0, 0]
y_arducopter = [15, 9, 9, 9, 0, 0, 0, 0, 0, 0]  # For train 20, we used test new 20 ->
y_ardurover = [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]

y_px4 = [9, 6, 4, 0, 0, 0, 0, 0, 0, 0]


# Adjust y-axis to start from 0
y_arduplane = [max(0, value) for value in y_arduplane]
y_arducopter = [max(0, value) for value in y_arducopter]
y_ardurover = [max(0, value) for value in y_ardurover]
y_px4 = [max(0, value) for value in y_px4]


# Different markers and colors for multiple models
markers = ['o', 's', 'D', '^', 'v', '*', 'x', '+']  # Different markers for distinction
colors = ['blue', 'red', 'green', 'purple', 'orange', 'brown', 'pink', 'gray']

# Plot arduplane
plt.plot(x, y_arduplane, linestyle='-', marker=markers[3], color=colors[1], markersize=7.5, label='ArduPlane')

# Plot ArduCopter
plt.plot(x, y_arducopter, linestyle='-', marker=markers[2], color=colors[2], markersize=7.5, label='ArduCopter')

plt.plot(x, y_ardurover, linestyle='-', marker=markers[1], color=colors[3], markersize=7.5, label='ArduRover')

plt.plot(x, y_px4, linestyle='-', marker=markers[0], color=colors[0], markersize=7.5, label='PXCopter')

# Add text labels for each point
for i in range(len(x)):
    if y_arduplane[i] > 0:
        plt.text(x[i] + 0.2, y_arduplane[i] + 0.4, str(y_arduplane[i]), fontsize=9, ha='center', va='bottom', color=colors[1], fontweight='bold')
    if y_arducopter[i] > 0:
        plt.text(x[i] + 0.3, y_arducopter[i] + 0.3 , str(y_arducopter[i]), fontsize=9, ha='center', va='bottom', color=colors[2], fontweight='bold')
    if y_ardurover[i] > 0:
        plt.text(x[i] + 0.3, y_ardurover[i] + 0.5 , str(y_ardurover[i]), fontsize=9, ha='center', va='bottom', color=colors[3], fontweight='bold')
    if y_px4[i] > 0:
        plt.text(x[i] + 0.2, y_px4[i] + 0.3 , str(y_px4[i]), fontsize=9, ha='center', va='bottom', color=colors[0], fontweight='bold')





plt.ylim(0, max(max(y_arduplane), max(y_arducopter), max(y_ardurover), max(y_px4)) + 5)  # Including y_ardudrone
plt.xticks(x) 

# Labels and Title with Bold Font
plt.xlabel('Number of Missions', fontweight='bold', fontsize='large')
plt.ylabel('Missed Functions', fontweight='bold', fontsize='large')
#plt.title('Lost Functions vs X-axis', fontweight='bold')
plt.legend(fontsize='large', frameon=False, prop={'weight': 'bold'})

plt.gca().yaxis.set_major_locator(ticker.MaxNLocator(integer=True))

# Show only horizontal grid
plt.grid(axis='y',alpha=0.4)

# Create directory if not exists
output_dir = "plots"
os.makedirs(output_dir, exist_ok=True)
output_path = os.path.join(output_dir, "lostFunctionsPlot.pdf")

# Save plot as PDF
plt.savefig(output_path, format='pdf')

# Show Plot
plt.show()
