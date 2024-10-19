#!/usr/bin/env python3
import os
import yaml
import json
import sys
from tabulate import tabulate

def read_slack_from_yaml(file_path):
    with open(file_path, "r") as file:
        data = yaml.safe_load(file)
        return data.get("slack", "N/A")

def transpose_table(table_data):
    return list(map(list, zip(*table_data)))


def main():
    if len(sys.argv) != 2:
        print("Usage: python script.py <sweep_file>")
        sys.exit(1)

    sweep_file = sys.argv[1]
    with open(sweep_file, "r") as file:
        sweep_json = json.load(file)
    sweep = sweep_json["sweep"]

    variables = sorted(set(k for v in sweep.values() for k in v.keys()))

    table_data = [["Variant", "Slack"] + variables]
    for variant in sweep:
        slack_file = os.path.join(os.path.dirname(sweep_file), "BoomTile_" + variant + ".yaml")
        slack = read_slack_from_yaml(slack_file)
        table_data.append(([variant, slack] +
        [sweep[variant].get(variable, "") for variable in variables]))

    print("Stage: " + sweep_json["stage"])
    table_data = transpose_table(table_data)
    table = tabulate(table_data[1:], table_data[0], tablefmt="github")
    print(table)


if __name__ == "__main__":
    main()
