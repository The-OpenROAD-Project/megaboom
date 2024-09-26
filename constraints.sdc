set sdc_version 2.0

#
# SDC file used during SRAM abstract generation
#
# SRAM Verilog defines separate read and write clocks, R0_clk and WO_clk.
#

# Run at 666 MHz
set clk_period 1500

# Create the read clock
set clk_name  R0_clk
set clk_port_name R0_clk
set clk_port [get_ports $clk_port_name]
create_clock -period $clk_period -waveform [list 0 [expr $clk_period / 2]] -name $clk_name $clk_port

# Create the write clock
set clk_name  W0_clk
set clk_port_name W0_clk
set clk_port [get_ports $clk_port_name]
create_clock -period $clk_period -waveform [list 0 [expr $clk_period / 2]] -name $clk_name $clk_port

# Define non-clock inputs and register outputs to use in setting max delay and
# group paths later
set non_clk_inputs  [lsearch -inline -all -not -exact [all_inputs] *_clk]
set all_register_outputs [get_pins -of_objects [all_registers] -filter {direction == output}]

# Optimization targets: overconstrain by default and
# leave refinements to a more design specific constraints.sdc file.
#
# Minimum time for io-io, io-reg, reg-io paths in macro is on
# the order of 80ps for a small macro on ASAP7.
set max_delay 80
set_max_delay $max_delay -from $non_clk_inputs -to [all_registers]
set_max_delay $max_delay -from $all_register_outputs -to [all_outputs]
set_max_delay $max_delay -from $non_clk_inputs -to [all_outputs]

# This allows us to view the different groups
# in the histogram in the GUI and also includes these
# groups in the report
group_path -name in2reg -from $non_clk_inputs -to [all_registers]
group_path -name reg2out -from [all_registers] -to [all_outputs]
group_path -name reg2reg -from [all_registers] -to [all_registers]
group_path -name in2out -from $non_clk_inputs -to [all_outputs]


