# Same as do-place, support for build systems that require a non-zero exit code
# and the same artifacts to be produced every time or no artifacts are published
.PHONY: bazel-grt
bazel-grt:
	mkdir -p $(RESULTS_DIR) $(LOG_DIR) $(REPORTS_DIR)
	echo >$(RESULTS_DIR)/grt.ok 0
	touch $(LOG_DIR)/5_1_grt.log
	touch $(REPORTS_DIR)/congestion.rpt
	cp $(RESULTS_DIR)/4_cts.sdc $(RESULTS_DIR)/5_1_grt.sdc
	@$(UNSET_VARS); \
	$(SUB_MAKE) do-5_1_grt ; \
	if [ $$? -ne 0 ]; then \
		cp $(RESULTS_DIR)/5_1_grt-failed.odb $(RESULTS_DIR)/5_1_grt.odb ; \
	else \
		echo >$(RESULTS_DIR)/grt.ok 1 ; \
	fi
