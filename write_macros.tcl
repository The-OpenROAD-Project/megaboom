source $::env(SCRIPTS_DIR)/load.tcl

set filename [file join $::env(WORK_HOME) "macro_placement.tcl"]
puts "Macro placement written to $filename"

load_design 2_floorplan.odb 2_floorplan.sdc

write_macro_placement $filename.tmp
set f [open $filename.tmp r]
set content [read $f]
set content [string map {"/" "."} $content]
close $f

set f [open $filename w]
puts -nonewline $f $content
close $f

set db [ord::get_db]
set chip [$db getChip]
set block [$chip getBlock]
set modules [$block getModules]
# get set of names of masters of modules
set masters [dict create]
foreach module $modules {
    #set master [$module getMaster]
    dict set masters [$module getName] 1
}
# get list of names sorted to make it predictable
set masters [dict keys $masters]
set masters [lsort $masters]

set f [open [file join $::env(WORK_HOME) "kept.bzl"] "w"]
puts $f "# buildifier: disable=module-docstring"
puts $f "KEPT_MODULES = \["
foreach master $masters {
    puts $f "    \"$master\","
}
puts $f "\]"
close $f
