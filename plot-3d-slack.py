#!/usr/bin/env python3
import matplotlib.pyplot as plt
import numpy as np
from scipy.interpolate import griddata
import sys


def load_data(filename):
    x = []
    y = []
    slack = []

    with open(filename, "r") as file:
        for line in file:
            parts = line.split()
            if len(parts) == 4:
                slack.append(float(parts[1]))
                x.append(float(parts[2]))
                y.append(float(parts[3]))

    return np.array(x), np.array(y), np.array(slack)


def plot_3d(x, y, slack):
    # Create grid data for surface plot
    grid_x, grid_y = np.mgrid[min(x) : max(x) : 100j, min(y) : max(y) : 100j]
    grid_z = griddata((x, y), slack, (grid_x, grid_y), method="cubic")

    fig = plt.figure()
    ax = fig.add_subplot(111, projection="3d")
    surf = ax.plot_surface(grid_x, grid_y, grid_z, cmap="viridis")

    ax.set_xlabel("X Position")
    ax.set_ylabel("Y Position")
    ax.set_zlabel("Slack")
    fig.colorbar(surf, ax=ax, shrink=0.5, aspect=5)

    plt.show()


if __name__ == "__main__":
    filename = sys.argv[1]
    x, y, slack = load_data(filename)
    plot_3d(x, y, slack)
