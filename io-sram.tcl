set script_path [ file dirname $::env(IO_CONSTRAINTS) ]
# We expect util.tcl in the same directory as this file
source $script_path/util.tcl

set_io_pin_constraint -region left:* -pin_names [match_pins {(R|W)[0-9]+_.*}]
