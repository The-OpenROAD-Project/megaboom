source $::env(SCRIPTS_DIR)/load.tcl
load_design 4_cts.odb 4_cts.sdc

set paths [find_timing_paths -path_group reg2reg -sort_by_slack -group_count 1000]

set db [::ord::get_db]
set block [[$db getChip] getBlock]

# open file
set fp [open $::env(OUTPUT) w]
foreach path $paths {
  set endpoint [get_property $path endpoint]
  set instance [$endpoint instance]
  set name [get_property $endpoint full_name]
  set slack [get_property $path slack]

  # If DFF is in the $name and it ends with /D
  if {[regexp {DFF} $name] && [regexp {/D$} $name]} {
    # remove the /D suffix
    set name [string range $name 0 end-2]
    # replace [ and ] with \[ and \]
    set name [string map { {[} {\[} {]} {\]} } $name]
    set b [$block findInst $name]
    set bbox [$b getBBox]
    puts $fp "$name $slack [$bbox xMin] [$bbox yMin]"
  }
}
close $fp
