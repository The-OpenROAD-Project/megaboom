#!/usr/bin/env python3
import os
import yaml
import sys
from tabulate import tabulate


def main():
    if len(sys.argv) == 1:
        print("Usage: {} <files>".format(sys.argv[0]))
        sys.exit(1)

    srams = {}
    for filename in sys.argv[1:]:
        with open(filename, "r") as f:
            key = os.path.splitext(os.path.basename(filename))[0].replace("_floorplan", "")
            srams[key] = srams.get(key, {}) | yaml.load(f, Loader=yaml.FullLoader)

    list_of_list_of_all_columns = [list(sram.keys()) for sram in srams.values()]
    all_columns = sorted(
        list(set([item for sublist in list_of_list_of_all_columns for item in sublist]))
    )
    order = ["width", "height"]
    all_columns = order + [col for col in all_columns if col not in order]

    table_data = []

    table_data.append(["Name"] + all_columns)

    for sram, values in srams.items():
        basename_without_ext = os.path.splitext(os.path.basename(sram))[0]
        row = [basename_without_ext] + [
            (
                f"{float(values.get(col, '')):>10.2f}"
                if isinstance(values.get(col, ""), (int, float))
                or values.get(col, "").replace(".", "", 1).isdigit()
                else str(values.get(col, ""))
            )
            for col in all_columns
        ]
        table_data.append(row)

    print(tabulate(table_data, headers="firstrow", tablefmt="pipe"))


if __name__ == "__main__":
    main()
