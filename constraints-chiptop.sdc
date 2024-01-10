set sdc_version 2.0

set clk_period 8500

set clk1_name  clock_uncore
create_clock -name $clk1_name -period $clk_period -waveform [list 0 [expr $clk_period/2]] [get_ports $clk1_name]
set_clock_uncertainty 10 [get_clocks $clk1_name]

set clk2_name  serial_tl_0_clock
create_clock -name $clk2_name -period $clk_period -waveform [list 0 [expr $clk_period/2]] [get_ports $clk2_name]
set_clock_uncertainty 10 [get_clocks $clk2_name]

set_clock_groups -asynchronous -group [get_clocks $clk1_name] -group [get_clocks $clk2_name]
