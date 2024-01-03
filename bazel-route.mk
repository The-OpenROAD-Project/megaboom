# Same as do-place, support for build systems that require a non-zero exit code
# and the same artifacts to be produced every time or no artifacts are published
.PHONY: bazel-route
bazel-route:
	mkdir -p $(RESULTS_DIR) $(LOG_DIR) $(REPORTS_DIR)
	touch $(REPORTS_DIR)/congestion.rpt
	touch $(REPORTS_DIR)/5_route_drc.rpt
	touch $(LOG_DIR)/5_3_route.log
	$(UNSET_AND_MAKE) do-5_2_fillcell do-5_3_route do-5_route.sdc do-5_route
