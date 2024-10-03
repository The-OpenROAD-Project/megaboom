source $::env(SCRIPTS_DIR)/load.tcl
load_design $::env(STAGE).odb $::env(STAGE).sdc

set f [open "$::env(OUTFILE)" w]
foreach path_group {in2reg reg2out in2out reg2reg} {
    set paths [find_timing_paths -path_group $path_group -sort_by_slack]
    if {[llength $paths] == 0} {
        set worst "N/A"
    } else {
        set points [get_property [lindex $paths 0] points]
        set worst [get_property [lindex $points [expr [llength $points] - 1]] arrival]
    }
    puts $f "$path_group: $worst"
}
close $f
