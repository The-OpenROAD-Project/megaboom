import json
import os
import sys


def format_ram_table_from_json(data):
    formatting = "{:<50} | {:<15} | {:<15} | {:<15}\n"
    table = formatting.format("Name",
                              "Rows",
                              "Width",
                              "Total bits")
    table += "-"*len(table) + "\n"
    for module_name, module_info in data["modules"].items():
        cells = module_info["cells"]
        for memory in cells:
            parameters = cells[memory]["parameters"]
            size = int(parameters["SIZE"], 2)
            width = int(parameters["WIDTH"], 2)
            table += formatting.format(module_name + "." + memory,
                                       size,
                                       width,
                                       size * width)
    return table


if __name__ == "__main__":
    if len(sys.argv) != 2:
        print("Usage: python " + os.path.basename(sys.argv[0]) +
              " file.json")
        exit(1)

    with open(sys.argv[1], 'r') as file:
        json_data = json.load(file)
    formatted_table = format_ram_table_from_json(json_data)
    print(formatted_table)
