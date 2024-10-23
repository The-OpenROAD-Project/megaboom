# Test this on some simple design in ORFS:
#
# ODB_FILE=results/asap7/base/2_floorplan.odb OUTFILE=blah.txt make run RUN_SCRIPT=~/megaboom/report-wns.tcl
source $::env(SCRIPTS_DIR)/open.tcl

set paths [find_timing_paths -path_group reg2reg -sort_by_slack -group_count 1]
set path [lindex $paths 0]
set slack [get_property $path slack]

report_clock_skew >reports.txt
report_tns >>reports.txt
set fp [open reports.txt r]
set crpr ""
set skew ""
set tns ""
while {[gets $fp line] != -1} {
    if {[regexp {([0-9.]+)\s+CRPR} $line match crpr_value]} {
      set crpr $crpr_value
    }
    if {[regexp {([0-9.]+)\s+setup\s+skew} $line match skew_value]} {
      set skew $skew_value
    }
    if {[regexp {tns (.*)} $line match tns_value]} {
      set tns $tns_value
    }
}
close $fp

set fp [open $::env(OUTFILE) w]
puts $fp "slack: $slack"
puts $fp "crpr: $crpr"
puts $fp "skew: $skew"
puts $fp "tns: $tns"
close $fp

