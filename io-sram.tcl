source $::env(SCRIPTS_DIR)/util.tcl
source util.tcl

# By placing the pins at the left edge, then by mirroring on
# X and Y, it is possible to place the pins in 4 significantly
# different orientations. In lieu of being able to rotate a
# macro 90 degrees, this is a good compromise.
set db [::ord::get_db]
set block [[$db getChip] getBlock]
set die_bbox [$block getCoreArea]
set dbu_per_uu [expr double([[$db getTech] getDbUnitsPerMicron])]
set scale [expr 1 / $dbu_per_uu]
#puts $f "width: [expr [$die_bbox xMax] * $scale]"
#puts $f "height: [expr [$die_bbox yMax] * $scale]"
set height [expr [$die_bbox yMax] * $scale]
set width [expr [$die_bbox xMax] * $scale]

set tech [$block getTech]
if {$height > $width} {
  set layer [$tech findLayer $::env(IO_PLACER_V)]
  set pitch [expr [$layer getPitchX] * $scale]
  set edge_length $height
  set edge left
} else {
  set layer [$tech findLayer $::env(IO_PLACER_H)]
  set pitch [expr [$layer getPitchY] * $scale]
  set edge_length $width
  set edge top
}
set pin_names [match_pins {(R|W)[0-9]+_.*}]

log_cmd set_io_pin_constraint -region $edge:0-[expr min($edge_length, $pitch * ([llength $pin_names] + 4) * 1.3)] -pin_names $pin_names
