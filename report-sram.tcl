source $::env(SCRIPTS_DIR)/load.tcl
load_design 2_floorplan.odb 2_floorplan.sdc

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
set db [::ord::get_db]
set dbu_per_uu [expr double([[$db getTech] getDbUnitsPerMicron])]
set block [[$db getChip] getBlock]
set die_bbox [$block getDieArea]
set scale [expr 1 / $dbu_per_uu]
puts $f "width: [expr [$die_bbox xMax] * $scale]"
puts $f "height: [expr [$die_bbox yMax] * $scale]"

close $f
