.PHONY: bazel-synth
bazel-synth:
	mkdir -p $(LOG_DIR)
	touch $(LOG_DIR)/1_1_yosys_hier_report.log
	$(UNSET_AND_MAKE) do-yosys do-synth
