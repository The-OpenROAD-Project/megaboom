#!/usr/bin/env python3
import os
import json
import re
import pathlib
import sys
from tabulate import tabulate


def transpose_table(table_data):
    return list(map(list, zip(*table_data)))


# slack: 0.039060
# Clock core_clock
#    0.00 source latency ctrl.state.out[0]$_DFF_P_/CK ^
#    0.00 target latency ctrl.state.out[0]$_DFF_P_/CK ^
#    0.00 CRPR
# --------------
#    0.00 setup skew


# tns 0.00
# Cell type report:                       Count       Area
#   Tap cell                                 48      12.77
#   Buffer                                   14      19.95
#   Inverter                                 85      51.34
#   Sequential cell                          35     158.27
#   Multi-Input combinational cell          369     420.55
#   Total                                   551     662.87
def parse_stats(report):
    """Create a dictionary with the values above"""
    stats = {}
    report_start = False
    for line in report.split("\n"):
        if "slack" in line:
            stats["slack"] = float(line.split()[1])
        if "tns" in line:
            stats["tns"] = float(line.split()[1])
        if "setup skew" in line:
            stats["skew"] = line.split()[0]
        # First line is "Cell type report", last line is "Total",
        # fish out the values in between
        if "Cell type report" in line:
            report_start = True
            continue
        if report_start:
            # fish out using regex first number column and use the label as key
            # and the first number as the value.
            #
            # use regex, because split() would get confused by space
            # in the label
            # use regex, but don't get confused by one or more spaces in the label
            #      Sequentialcell                          35     158.27
            #   Tap cell                                 48      12.77
            #      Multi-Input combinational cell          369     420.55
            # some labels have spaces, some don't
            m = re.match(r"\s*(\D+)(\d+)\s+(\d+\.\d+)", line)
            if m:
                stats[m.group(1).strip()] = int(m.group(2))
        if "Total" in line:
            report_start = False
            continue

    return stats


# Extract Elapsed Time line from log file
# Elapsed time: 0:04.26[h:]min:sec. CPU time: user 4.08 sys 0.17 (99%). \
# Peak memory: 671508KB.
def print_log_dir_times(f):
    first = True
    totalElapsed = 0
    total_max_memory = 0

    if not os.path.exists(f):
        return "N/A"

    with open(f) as logfile:
        found = False
        for line in logfile:
            elapsedTime = None
            peak_memory = None

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
                    print("Elapsed time not understood in", str(line), file=sys.stderr)
                # Find Peak Memory
                peak_memory = int(
                    int(line.split("Peak memory: ")[1].split("KB")[0]) / 1024
                )

        if not found:
            print("No elapsed time found in", str(f), file=sys.stderr)

        # Print the name of the step and the corresponding elapsed time
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

    variables = sorted(
        set(k for v in sweep.values() for k in v.get("variables", {}).keys())
    )

    def read_file(variant):
        with open(
            os.path.join(os.path.dirname(sweep_file), "BoomTile_" + variant + ".txt"),
            "r",
        ) as file:
            return file.read()

    stats = {variant: parse_stats(read_file(variant)) for variant in sweep}
    names = sorted({name for stat in stats.values() for name in stat.keys()})
    variable_names = sorted(
        set(k for v in sweep.values() for k in v.get("variables", {}).keys())
    )

    table_data = None

    def previous_stage(previous_stage):
        if len(previous_stage) == 0:
            return ""
        stage, previous = list(previous_stage.items())[0]
        return f"{stage}: {previous}"

    for variant in sweep:
        if table_data is None:
            table_data = [
                ["Variant", "Description"]
                + names
                + variable_names
                + ["dissolve", "previous_stage"]
                + logs
            ]
        variables = sweep[variant].get("variables", {})
        table_data.append(
            (
                [variant, sweep[variant].get("description", "")]
                + [stats[variant][name] for name in names]
                + [
                    (
                        variables.get(variable, "")
                        if sweep_json["base"].get(variable, "")
                        != variables.get(variable, "")
                        else ""
                    )
                    for variable in variable_names
                ]
                + [
                    " ".join(sweep[variant].get("dissolve", [])),
                    previous_stage(sweep[variant].get("previous_stage", {})),
                ]
                + [
                    print_log_dir_times(os.path.join(logs_dir, variant, log))
                    for log in logs
                ]
            )
        )

    print("Stage: " + sweep_json["stage"])
    table_data = transpose_table(table_data)
    table = tabulate(table_data[1:], table_data[0], tablefmt="github")
    print(table)

    print()
    print("Base configuration variables")
    base_keys = sorted(sweep_json["base"].keys())
    print(
        tabulate(
            [[key, sweep_json["base"][key]] for key in base_keys],
            ["Variable", "Value"],
            tablefmt="github",
        )
    )


if __name__ == "__main__":
    main()
