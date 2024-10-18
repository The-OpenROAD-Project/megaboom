source $::env(SCRIPTS_DIR)/load.tcl
load_design 4_cts.odb 4_cts.sdc

set fp [open $::env(OUTPUT) w]
puts $fp "some: value"
close $fp
