import matplotlib.pyplot as plt
import numpy as np
from mpl_toolkits.axisartist.axislines import Subplot

# Example 1
# plot() function
# plots a line graph

xpoints = np.array([1, 8])
ypoints = np.array([3, 10])

plt.plot(xpoints, ypoints)
plt.show()

# Output:
# A line graph

# Example 2
# figure() function
# creates a figure

xpoints = np.array([1, 20])
ypoints = np.array([5, 3])

plt.figure()

plt.plot(xpoints, ypoints)

plt.show()

# Output:
# A line graph

# Example 3
# add_subplot() function
# The add_subplot() method figure module of matplotlib library is used to add an Axes to the figure as part of a subplot arrangement.

xpoints = np.array([5, 8])
ypoints = np.array([3, 10])

fig = plt.figure()
plt.plot(xpoints, ypoints)

xpointsSub = np.array([2, 6])
ypointsSub = np.array([3, 10])

ax = fig.add_subplot(2, 2, 2)
ax.plot(xpointsSub, ypointsSub, color='red', marker='o')

plt.show()

# Output:
# A line graph

# Example 4
# scatter() function
# The scatter() method of the matplotlib library is used to draw a scatter plot.

xpoints = np.array([1, 8, 1.5, 8, 1, 8, 3, 5.6, 4.5, 6.8])
ypoints = np.array([3, 10, 4, 8, 5, 11, 4, 4, 3, 7])

plt.scatter(xpoints, ypoints)
plt.show()

# Output:
# A scatter plot

# Example 5
# bar() function
# The bar() method of the matplotlib library is used to draw a bar graph.

xpoints = np.array(["A", "B", "C"])
ypoints = np.array([3, 7, 5])

plt.bar(xpoints, ypoints)

plt.show()

# Output:
# A bar graph

# Example 6
# hist() function
# The hist() method of the matplotlib library is used to draw a histogram.

xpoints = np.array([1, 2, 3, 4, 5, 6, 7, 8, 9, 10])

plt.hist(xpoints)

plt.show()

# Output:
# A histogram

# Example 7
# xlabel() function

xpoints = np.array([1, 8])
ypoints = np.array([3, 10])

plt.plot(xpoints, ypoints)

plt.xlabel('x-axis')

plt.show()

# Output:
# A line graph with x-axis label

# Example 8
# grid() function

xpoints = np.array([1, 8])
ypoints = np.array([3, 10])

plt.plot(xpoints, ypoints)

plt.grid()

plt.show()

# Output:
# A line graph with grid

# Example 9
# title() function

xpoints = np.array([1, 8])
ypoints = np.array([3, 10])

plt.plot(xpoints, ypoints)

plt.title('Line Graph')

plt.show()

# Output:
# A line graph with title