source $::env(SCRIPTS_DIR)/synth_preamble.tcl

prep -top $::env(DESIGN_NAME)
memory_unpack

memory -nomap

select t:\$mem*

json -o $::env(RESULTS_DIR)/mem.json
