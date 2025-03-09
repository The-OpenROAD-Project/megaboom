yosys -import

# stdcells are in .v file
read_verilog $::env(RESULTS_DIR)/1_synth.v

tee -q -o keep.txt -s kept ls A:keep_hierarchy=1

set f [open keep.txt]
set lines [split [read $f] \n]
close $f

set lines [lrange $lines 2 end-1]
set lines [lmap line $lines {string trim $line}]
lappend lines $::env(DESIGN_NAME)
set lines [lsort $lines]

set f [open [file join $::env(WORK_HOME) "kept.bzl"] "w"]
puts $f "# buildifier: disable=module-docstring"
puts $f "# asdfsafds"
puts $f "KEPT_MODULES = \["
foreach master $lines {
    puts $f "    \"$master\","
}
puts $f "\]"
close $f
