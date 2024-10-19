source $::env(SCRIPTS_DIR)/load.tcl
switch -exact -- $::env(REPORT_STAGE) {
  "floorplan" {
    load_design 2_floorplan.odb 2_floorplan.sdc
  }
  "place" {
    load_design 3_place.odb 3_place.sdc
  }
  "cts" {
    load_design 4_cts.odb 4_cts.sdc
  }
  "grt" {
    load_design 5_1_grt.odb 4_cts.sdc
  }
  "route" {
    load_design 5_2_route.odb 4_cts.sdc
  }
  default {
    puts "Unknown design: $::env(STAGE)"
    exit 1
  }
}

set paths [find_timing_paths -path_group reg2reg -sort_by_slack -group_count 1]
set path [lindex $paths 0]
set slack [get_property $path slack]

set fp [open $::env(OUTFILE) w]
puts $fp "slack: $slack"
close $fp
