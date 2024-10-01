set sdc_version 2.0

#
# SDC file used during SRAM abstract generation
#

# Run at 666 MHz
set clk_period 1500

# Covers all clock naming types in SRAMs and reg files
set clock_ports [concat [get_ports -quiet *clk] [get_ports -quiet *clock]]

if {[llength $clock_ports] == 0} {
  error "No clock ports found"
}

foreach clk_port $clock_ports {
  set clk_name [get_name $clk_port]
  create_clock -period $clk_period -name $clk_name $clk_port
}

set non_clk_inputs {}
foreach input [all_inputs] {
  if {[lsearch -exact $clock_ports $input] == -1} {
    lappend non_clk_inputs $input
  }
}

set_max_delay [expr {[info exists in2out_max] ? $in2out_max : 80}] -from $non_clk_inputs -to [all_outputs]
group_path -name in2out -from $non_clk_inputs -to [all_outputs]

if {[llength [all_registers]] > 0} {
  set all_register_outputs [get_pins -of_objects [all_registers] -filter {direction == output}]
  set_max_delay [expr {[info exists in2reg_max] ? $in2reg_max : 80}] -from $non_clk_inputs -to [all_registers]
  set_max_delay [expr {[info exists reg2out_max] ? $reg2out_max : 80}] -from $all_register_outputs -to [all_outputs]

  group_path -name in2reg -from $non_clk_inputs -to [all_registers]
  group_path -name reg2out -from [all_registers] -to [all_outputs]
  group_path -name reg2reg -from [all_registers] -to [all_registers]
}
