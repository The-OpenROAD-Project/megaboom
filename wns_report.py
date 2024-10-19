#!/usr/bin/env python3
import os
import yaml
import json
import pathlib
import subprocess
import sys
from tabulate import tabulate

def transpose_table(table_data):
    return list(map(list, zip(*table_data)))

def print_log_dir_times(f):
    first = True
    totalElapsed = 0
    total_max_memory = 0
    #print(logdir)

    # Extract Elapsed Time line from log file
    with open(str(f)) as logfile:
        found = False
        for line in logfile:
            elapsedTime = None
            peak_memory = None

            # Example line:
            # Elapsed time: 0:04.26[h:]min:sec. CPU time: user 4.08 sys 0.17 (99%). Peak memory: 671508KB.
            if "Elapsed time" in line:
                found = True
                # Extract the portion that has the time
                timePor = line.strip().replace("Elapsed time: ", "")
                # Remove the units from the time portion
                timePor = timePor.split("[h:]", 1)[0]
                # Remove any fraction of a second
                timePor = timePor.split(".", 1)[0]
                # Calculate elapsed time that has this format 'h:m:s'
                timeList = timePor.split(":")
                if len(timeList) == 2:
                    # Only minutes and seconds are present
                    elapsedTime = int(timeList[0]) * 60 + int(timeList[1])
                elif len(timeList) == 3:
                    # Hours, minutes, and seconds are present
                    elapsedTime = (
                        int(timeList[0]) * 3600
                        + int(timeList[1]) * 60
                        + int(timeList[2])
                    )
                else:
                    print(
                        "Elapsed time not understood in", str(line), file=sys.stderr
                    )
                # Find Peak Memory
                peak_memory = int(
                    int(line.split("Peak memory: ")[1].split("KB")[0]) / 1024
                )

        if not found:
            print("No elapsed time found in", str(f), file=sys.stderr)

        # Print the name of the step and the corresponding elapsed time
        format_str = "%-25s %20s %14s"
        if elapsedTime is not None and peak_memory is not None:
            if first:
                first = False
        totalElapsed += elapsedTime
        total_max_memory = max(total_max_memory, int(peak_memory))

    return totalElapsed




def main():
    if len(sys.argv) != 2:
        print("Usage: python script.py <sweep_file>")
        sys.exit(1)

    sweep_file = sys.argv[1]
    with open(sweep_file, "r") as file:
        sweep_json = json.load(file)
    sweep = sweep_json["sweep"]

    log_dir = os.path.dirname(sorted(pathlib.Path(".").glob("**/*.log"))[0])
    logs = sorted(map(os.path.basename, pathlib.Path(log_dir).glob("*.log")))
    logs_dir = os.path.join(log_dir, "..")

    variables = sorted(set(k for v in sweep.values() for k in v.keys()))

    table_data = None
    for variant in sweep:
        slack_file = os.path.join(os.path.dirname(sweep_file), "BoomTile_" + variant + ".yaml")
        with open(slack_file, "r") as file:
            stats = yaml.safe_load(file)
        names = sorted(stats.keys())
        if table_data is None:
            table_data = [["Variant"] + names + variables + logs]
        table_data.append(([variant] + [stats[name] for name in names] +
        [sweep[variant].get(variable, "") for variable in variables] +
        [print_log_dir_times(os.path.join(logs_dir, variant, log)) for log in logs]))

    print("Stage: " + sweep_json["stage"])
    table_data = transpose_table(table_data)
    table = tabulate(table_data[1:], table_data[0], tablefmt="github")
    print(table)

    print()
    print("Base configuration variables")
    base_keys = sorted(sweep_json["base"].keys())
    print(tabulate([[key, sweep_json["base"][key]] for key in base_keys], ["Variable", "Value"], tablefmt="github"))

if __name__ == "__main__":
    main()
