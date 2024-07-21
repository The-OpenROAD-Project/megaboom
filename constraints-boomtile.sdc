set sdc_version 2.0

set clk_period 6500
set clk_name  clock
set clk_port_name clock

# Ignore synchronous reset for now.
set_false_path -from [get_ports reset]

source $env(PLATFORM_DIR)/constraints.sdc
