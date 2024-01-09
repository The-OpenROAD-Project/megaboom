source util.tcl

set sdc_version 2.0

set clk_period 8500

set clk_name  clock
set clk_port_name clock

# Create clocks
create_clock -name clock -period $clk_period [get_ports clock]
create_clock -name serial_tl_0_clock -period $clk_period [get_ports serial_tl_0_clock]
create_clock -name fake_pll_clk -period $clk_period [get_ports fake_pll_clk]

# Define false paths between the clocks
set_false_path -from [get_clocks clock] -to [get_clocks serial_tl_0_clock]
set_false_path -from [get_clocks clock] -to [get_clocks fake_pll_clk]
set_false_path -from [get_clocks serial_tl_0_clock] -to [get_clocks clock]
set_false_path -from [get_clocks serial_tl_0_clock] -to [get_clocks fake_pll_clk]
set_false_path -from [get_clocks fake_pll_clk] -to [get_clocks clock]
set_false_path -from [get_clocks fake_pll_clk] -to [get_clocks serial_tl_0_clock]
