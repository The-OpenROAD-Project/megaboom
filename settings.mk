# Not used by Bazel, only for convenience when
# using ./orfs make for local inspection and testing

export DESIGN_CONFIG?=config.mk
export DESIGN_NAME?=ChipTop
export WORK_HOME?=bazel-bin

.PHONY: elapsed-all
elapsed-all:
	@$(UTILS_DIR)/genElapsedTime.py -d $(shell find bazel-bin/logs/asap7/*/base -type d)

include bazel-memory.mk
