source $::env(SCRIPTS_DIR)/load.tcl
load_design 2_floorplan.odb 2_floorplan.sdc

set f [open "$::env(OUTFILE)" w]
set db [::ord::get_db]
set dbu_per_uu [expr double([[$db getTech] getDbUnitsPerMicron])]
set block [[$db getChip] getBlock]
set die_bbox [$block getDieArea]
set scale [expr 1 / $dbu_per_uu]
puts $f "width: [expr [$die_bbox xMax] * $scale]"
puts $f "height: [expr [$die_bbox yMax] * $scale]"

close $f
