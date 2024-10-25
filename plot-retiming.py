#!/usr/bin/env python3
import matplotlib
from matplotlib.backends.backend_pdf import PdfPages
import matplotlib.pyplot as plt
import re
import os
import sys

if len(sys.argv) > 1:
    matplotlib.use("Agg")


def parse_log(log):
    # Define regex pattern to extract data
    pattern = re.compile(
        r"^\s*(\d+|final)\s*\|\s*(\d+)\s*\|\s*(\d+)\s*\|\s*(\d+)\s*\|\s*(\d+)"
        r"\s*\|\s*(\d+)\s*\|\s*([-.\d]+)\s*\|\s*([-.\d]+)\s*\|\s*(\d+)\s*\|"
    )

    # Initialize lists to store extracted data
    iterations = []
    wns = []

    # Split log into lines and parse each line
    got_match = False
    for line in log.strip().split("\n"):
        match = pattern.match(line)
        if match:
            got_match = True
            iter_val = match.group(1)
            if iter_val == "final":
                iter_val = (
                    iterations[-1] + 1
                )  # Increment last iteration value for 'final'
            else:
                iter_val = int(iter_val)
            iterations.append(iter_val)
            wns.append(float(match.group(7)))
        if got_match and line.startswith("-----------------"):
            break

    return iterations, wns


def plot_data(data_series):
    ax1 = plt.gca()

    # Plot each data series
    for iterations, wns, label in data_series:
        ax1.plot(iterations, wns, label=label, marker="o")

    ax1.set_title("WNS against Iterations")
    ax1.set_xlabel("Iterations")
    ax1.set_ylabel("WNS (ns)", color="b")
    ax1.legend(loc="lower right")

    plt.tight_layout()
    return plt


def run():
    if len(sys.argv) == 1:
        # Example log data
        example_log = """
           Iter   | Removed | Resized | Inserted | Cloned |  Pin  |    WNS   |   TNS      |  Viol  | Worst
                  | Buffers |  Gates  | Buffers  |  Gates | Swaps |          |            | Endpts | Endpt
        ---------------------------------------------------------------------------------------------------
                0 |       0 |       0 |        0 |      0 |     0 | -2195.436 | -114289224.0 |  26254 | core/int_issue_unit/io_dis_uops_0_ready_REG$_DFF_P_/D
               10 |       0 |       7 |        0 |      1 |     1 | -1346.351 | -80532448.0 |  26254 | core/int_issue_unit/io_dis_uops_0_ready_REG$_DFF_P_/D
        [WARNING RSZ-0075] makeBufferedNet failed for driver core/rob/_99958_/CON
        [WARNING RSZ-0075] makeBufferedNet failed for driver core/rob/_99958_/CON
        [WARNING RSZ-0075] makeBufferedNet failed for driver core/rob/_99958_/CON
        [WARNING RSZ-0075] makeBufferedNet failed for driver lsu/_716839_/SN
               20 |       0 |       9 |        2 |      2 |     7 | -1300.067 | -77633032.0 |  26254 | core/int_issue_unit/io_dis_uops_0_ready_REG$_DFF_P_/D
        [WARNING RSZ-0075] makeBufferedNet failed for driver core/rob/_99958_/CON
        [WARNING RSZ-0075] makeBufferedNet failed for driver lsu/_716839_/SN
               21 |       0 |       9 |        2 |      2 |     8 | -1297.841 | -77515352.0 |  26252 | core/int_issue_unit/io_dis_uops_0_ready_REG$_DFF_P_/D
            final |       0 |       9 |        2 |      2 |     8 | -1297.841 | -77515352.0 |  26252 | core/int_issue_unit/io_dis_uops_0_ready_REG$_DFF_P_/D
        ---------------------------------------------------------------------------------------------------
        """
        data = [[*parse_log(example_log), "example_log"]]
        plot_data(data)
        plt.show()
        return

    data = []
    for file_path in sys.argv[2:]:
        with open(file_path, "r") as file:
            log = file.read()
        iterations, wns = parse_log(log)
        if len(iterations) == 0:
            continue
        label = "/".join(file_path.split(os.sep)[-4:])
        data.append((iterations, wns, label))
    plot_data(data)
    with PdfPages(sys.argv[1]) as pdf:
        pdf.savefig()


if __name__ == "__main__":
    run()
