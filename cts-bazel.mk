.PHONY: check-place
check-place:
	grep -q 1 $(RESULTS_DIR)/place.ok

.PHONY: bazel-cts
bazel-cts:
	mkdir -p $(LOG_DIR) $(REPORTS_DIR)
	$(UNSET_AND_MAKE) check-place do-4_1_cts do-4_cts
