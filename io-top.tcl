source util.tcl

set_io_pin_constraint -region top:* -pin_names [match_pins (io|auto)_.*]
