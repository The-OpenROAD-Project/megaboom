# Test this on some simple design in ORFS:
# make floorplan
# ODB_FILE=results/nangate45/gcd/base/2_floorplan.odb make run RUN_SCRIPT=~/megaboom/report-wns.tcl
source $::env(SCRIPTS_DIR)/open.tcl

set paths [find_timing_paths -path_group reg2reg -sort_by_slack -group_count 1]
set path [lindex $paths 0]
set slack [get_property $path slack]

puts "slack: $slack"
report_tns
report_cell_usage
