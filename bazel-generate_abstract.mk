.PHONY: bazel-generate_abstract
bazel-generate_abstract:
	mkdir -p $(RESULTS_DIR) $(LOG_DIR) $(REPORTS_DIR)
	$(UNSET_AND_MAKE) do-generate_abstract

