# Same as do-place, support for build systems that require a non-zero exit code
# and the same artifacts to be produced every time or no artifacts are published
.PHONY: bazel-route
bazel-route:
	mkdir -p $(RESULTS_DIR) $(LOG_DIR) $(REPORTS_DIR)
	echo >$(RESULTS_DIR)/route.ok 0
	touch $(REPORTS_DIR)/congestion.rpt
	touch $(REPORTS_DIR)/5_route_drc.rpt
	touch $(LOG_DIR)/5_1_grt.log
	touch $(LOG_DIR)/5_2_fillcell.log
	touch $(LOG_DIR)/5_3_route.log
	@$(UNSET_VARS); \
	$(SUB_MAKE) do-5_1_grt ; \
	if [ $$? -ne 0 ]; then \
		cp $(RESULTS_DIR)/5_1_grt-failed.odb $(RESULTS_DIR)/5_route.odb ; \
		$(SUB_MAKE) do-5_route.sdc ; \
	else \
		$(SUB_MAKE) do-5_2_fillcell do-5_3_route do-5_route.sdc do-5_route ; \
		echo >$(RESULTS_DIR)/route.ok 1 ; \
	fi
