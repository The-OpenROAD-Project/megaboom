source $::env(SCRIPTS_DIR)/load.tcl

set filename [file join $::env(WORK_HOME) "macro_placement.tcl"]
puts "Macro placement written to $filename"

load_design 2_floorplan.odb 2_floorplan.sdc

write_macro_placement $filename.tmp
set f [open $filename.tmp r]
set content [read $f]
puts "content: $content"
set content [string map {"/" "."} $content]
puts "content after: $content"
close $f

set f [open $filename w]
puts -nonewline $f $content
close $f
