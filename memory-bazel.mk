.PHONY: memory
memory: $(RESULTS_DIR)/mem.json
	python scripts/mem_dump.py $(RESULTS_DIR)/mem.json

$(RESULTS_DIR)/mem.json: yosys-dependencies
	mkdir -p $(RESULTS_DIR) $(LOG_DIR) $(REPORTS_DIR)
	$(TIME_CMD) $(YOSYS_CMD) $(YOSYS_FLAGS) -c $(shell pwd)/scripts/mem_dump.tcl 2>&1 | tee $(LOG_DIR)/1_0_mem.log
