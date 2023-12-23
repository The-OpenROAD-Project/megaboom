.PHONY: bazel-synth
bazel-synth:
	mkdir -p $(LOG_DIR)
	$(UNSET_AND_MAKE) do-yosys do-synth
