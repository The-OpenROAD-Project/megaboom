#!/usr/bin/env python3
#
# Reads a megaboom output log file and creates a summary report with errors and info so that
# it can be included in the summary email sent to the PR owner
#
# Usage: genReport --input_file <bazel_output> --output_file <summary_log>
#
# By default, it reads a "build.log" file in the current directory and writes a
# "report-summary.log" file in flow/reports. These defaults are used when called from Jenkins
#

import re
import os
import sys
import argparse

def write_summary(output_file, summary_data):
    """
    Writes summary to output file and creates any directories in the output_file's path 
    that already don't exist
    """

    summary = "\n"
    summary += "=" * 60 + "\n"
    summary += " " * 26 + "SUMMARY\n"
    summary += "=" * 60 + "\n"

    dir_name = os.path.dirname(output_file)
    if not os.path.isdir(dir_name):
        os.makedirs(dir_name)
    with open(output_file, "w") as out_fh:
        out_fh.write(summary)
        if len(summary_data["errors"]) > 0:
            out_fh.write("Errors:\n")
            out_fh.write("\n".join(summary_data["errors"]))
            out_fh.write("\n\n")
        if len(summary_data["info"]) > 0:
            out_fh.write("Info:\n")
            out_fh.write("\n".join(summary_data["info"]))
            out_fh.write("\n")

def read_log(input_file):
    """
    Reads the build log and extracts any interesting errors or info to include
    in the summary.

    Returns a dictionary with "errors" and "info" as the keys to lists of log file output to
    include in the summary
    """
    
    summary_data = { "errors": [], "info": [] }
    orfs_regex_error = re.compile(r"^\[error ?(\w+-\d+)?\]", re.IGNORECASE)
    regex_hitrate = re.compile(r"^INFO\:\s+\d+\s+processes\:\s+\d+\s+remote\s+cache\s+hit")
    
    with open(input_file, "r") as in_fh:
        for line in in_fh:
            if re.search(orfs_regex_error, line) or line.startswith("ERROR: Build did NOT"):
                summary_data["errors"].append(line.strip())
            elif line.startswith("INFO: Elapsed time") or re.search(regex_hitrate, line) or line.startswith("INFO: Build completed successfully"):
                summary_data["info"].append(line.strip())
    return summary_data

# Define args and defaults
parser = argparse.ArgumentParser(prog="genReport.py")
parser.add_argument("-i", "--input_file", help="Bazel build log", default="build.log")
parser.add_argument("-o", "--output_file", help="Summary log", default="flow/reports/report-summary.log")

args = parser.parse_args()

summary_data = read_log(args.input_file)
write_summary(args.output_file, summary_data)
    

    
