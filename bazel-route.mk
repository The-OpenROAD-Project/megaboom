.PHONY: check-grt
check-grt:
	grep -q 1 $(RESULTS_DIR)/grt.ok

.PHONY: bazel-route
bazel-route:
	mkdir -p $(RESULTS_DIR) $(LOG_DIR) $(REPORTS_DIR)
	touch $(REPORTS_DIR)/5_route_drc.rpt
	touch $(LOG_DIR)/5_3_route.log
	$(UNSET_AND_MAKE) check-grt do-5_2_fillcell do-5_3_route do-5_route.sdc do-5_route
