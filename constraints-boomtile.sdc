set sdc_version 2.0

#
# SDC file used by BoomTile top level
#

set clk_period 1200
set clk_name  clock
set clk_port_name clock

# Ignore synchronous reset for now.
set_false_path -from [get_ports reset]

set clk_port [get_ports $clk_port_name]
create_clock -period $clk_period -waveform [list 0 [expr $clk_period / 2]] -name $clk_name $clk_port

set non_clk_inputs [all_inputs -no_clocks]

if {[llength [all_registers]] > 0} {
  set_max_delay [expr {[info exists in2reg_max] ? $in2reg_max : 80}] -from $non_clk_inputs -to [all_registers]
  set_max_delay [expr {[info exists reg2out_max] ? $reg2out_max : 80}] -from [all_registers] -to [all_outputs]

  group_path -name in2reg -from $non_clk_inputs -to [all_registers]
  group_path -name reg2out -from [all_registers] -to [all_outputs]
  group_path -name reg2reg -from [all_registers] -to [all_registers]
}

set_max_delay [expr {[info exists in2out_max] ? $in2out_max : 80}] -from $non_clk_inputs -to [all_outputs]
group_path -name in2out -from $non_clk_inputs -to [all_outputs]
