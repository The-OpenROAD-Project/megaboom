source $::env(SCRIPTS_DIR)/open.tcl

set paths [find_timing_paths -path_group reg2reg -sort_by_slack -group_count 1000000]

set db [::ord::get_db]
set block [[$db getChip] getBlock]

set fp [open $::env(OUTPUT) w]
foreach path $paths {
  set endpoint [get_property $path endpoint]
  set instance [sta::sta_to_db_inst [$endpoint instance]]
  set port [sta::sta_to_db_port [$endpoint port]]
  set name [get_property $endpoint full_name]
  set obj {NULL}
  if {$port!={NULL}} {
    set obj $port
  } elseif {$instance!={NULL}} {
    set obj $instance
  } else {
    puts "Nothing found for $name"
    continue
  }
  set slack [get_property $path slack]
  set skew [$path clk_skew]
  set bbox [$obj getBBox]
  puts $fp "$name $slack $skew [ord::dbu_to_microns [$bbox xMin]] [ord::dbu_to_microns [$bbox yMin]]"
}
close $fp
