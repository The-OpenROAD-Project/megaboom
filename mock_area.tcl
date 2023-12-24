read_db $::env(RESULTS_DIR)/../base/2_floorplan.odb
set db [::ord::get_db]
set dbu_per_uu [expr double([[$db getTech] getDbUnitsPerMicron])]
set block [[$db getChip] getBlock]
set die_bbox [$block getDieArea]
set core_bbox [$block getCoreArea]
set scale [expr $::env(MOCK_AREA) / $dbu_per_uu]
#set scale [expr 0.5 / $dbu_per_uu]
puts "export DIE_AREA=\"0 0 [expr $scale*[$die_bbox xMax]] [expr $scale*[$die_bbox yMax]]\""
puts "export CORE_AREA=\"[expr $scale*[$core_bbox xMin]] [expr $scale*[$core_bbox yMin]] \
[expr $scale*([$die_bbox xMax] - ([$die_bbox xMax] - [$core_bbox xMax]))] \
[expr $scale*([$die_bbox yMax] - ([$die_bbox yMax] - [$core_bbox yMax]))]\""
