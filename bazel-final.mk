.PHONY: bazel-final
bazel-final:
	mkdir -p $(RESULTS_DIR) $(LOG_DIR) $(REPORTS_DIR)
	$(UNSET_AND_MAKE) do-6_1_fill do-6_1_fill.sdc do-6_final.sdc do-6_report
	$(UNSET_AND_MAKE) do-klayout_tech do-klayout do-klayout_wrap do-gds-merged
	cp $(GDS_MERGED_FILE) $(GDS_FINAL_FILE)
