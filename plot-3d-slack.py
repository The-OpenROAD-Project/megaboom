#!/usr/bin/env python3
import matplotlib.pyplot as plt
import numpy as np
from scipy.interpolate import griddata
import sys
import yaml


def load_data(filename):
    x = []
    y = []
    slack = []

    with open(filename, "r") as file:
        data = yaml.load(file, Loader=yaml.FullLoader)

    for line in data["stats"]:
        parts = line.split()
        if len(parts) == 5:
            s = float(parts[2])
            slack.append(s * pow(10, 12))
            x.append(float(parts[3]))
            y.append(float(parts[4]))

    macros = {}

    for line in data["masters"]:
        parts = line.split()
        if len(parts) == 5:
            macros[parts[0]] = {
                "minx": float(parts[1]),
                "miny": float(parts[2]),
                "maxx": float(parts[3]),
                "maxy": float(parts[4]),
            }

    return np.array(x), np.array(y), np.array(slack), macros


def plot_3d(x, y, z, macros):
    # Create grid data for surface plot
    grid_x, grid_y = np.mgrid[0:2000:100j, 0:2000:100j]
    grid_z = griddata((x, y), z, (grid_x, grid_y), method="linear")

    fig = plt.figure()
    ax = fig.add_subplot(111, projection="3d")
    surf = ax.plot_surface(grid_x, grid_y, grid_z, cmap="viridis")

    ax.set_xlabel("X")
    ax.set_ylabel("Y")
    ax.set_zlabel("Skew")
    fig.colorbar(surf, ax=ax, shrink=0.5, aspect=5)

    for macro in macros:
        minx = macros[macro]["minx"]
        miny = macros[macro]["miny"]
        maxx = macros[macro]["maxx"]
        maxy = macros[macro]["maxy"]

        # Plot a solid rectangle
        ax.bar3d(minx, miny, 0, maxx - minx, maxy - miny, 50, color="red", alpha=0.5)

        # # Add title text on the flat surface of the box
        # ax.text(
        #     (minx + maxx) / 2,  # x-coordinate of the text
        #     (miny + maxy) / 2,  # y-coordinate of the text
        #     0.5,                # z-coordinate of the text (middle of the box height)
        #     macro,              # text to display
        #     color='black',      # text color
        #     ha='center',        # horizontal alignment
        #     va='center',        # vertical alignment
        #     fontsize=12,        # font size
        #     bbox=dict(facecolor='white', alpha=0.5, edgecolor='none')  # background box
        # )

    plt.show()


if __name__ == "__main__":
    filename = sys.argv[1]
    x, y, z, macros = load_data(filename)
    plot_3d(x, y, z, macros)
