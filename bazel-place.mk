# This target does not produce a non-zero exit code if detailed or global
# placement fails. In this case $(RESULTS_DIR)/3_place.odb and $(RESULTS_DIR)/3_place.sdc
# are produced, such that an artifact can be created for inspection purposes.
#
# The check-place target subsequently will fail if
# placement did not complete successfully, because $(RESULTS_DIR)/place.ok
# is set to 0.
#
# This means that build systems, such as Bazel, that require a non-zero
# exit code and the same artifacts to be produced every time, or it
# will not publish the artifacts, can use this target.
.PHONY: bazel-place
bazel-place:
	mkdir -p $(LOG_DIR) $(REPORTS_DIR)
	touch $(LOG_DIR)/3_1_place_gp_skip_io.log
	touch $(LOG_DIR)/3_2_place_iop.log
	touch $(LOG_DIR)/3_3_place_gp.log
	touch $(LOG_DIR)/3_4_place_resized.log
	touch $(LOG_DIR)/3_5_place_dp.log
	echo >$(RESULTS_DIR)/place.ok 0
	$(UNSET_AND_MAKE) do-3_1_place_gp_skip_io do-3_2_place_iop
	@$(UNSET_VARS); \
	$(SUB_MAKE) do-3_3_place_gp; \
	if [ $$? -ne 0 ]; then \
		cp $(RESULTS_DIR)/3_3_place_gp-failed.odb $(RESULTS_DIR)/3_place.odb ; \
		$(SUB_MAKE) do-3_place.sdc ; \
	else \
		$(SUB_MAKE) do-3_4_place_resized ; \
		$(SUB_MAKE) do-3_5_place_dp ; \
		if [ $$? -ne 0 ]; then \
			cp $(RESULTS_DIR)/3_5_place_dp-failed.odb $(RESULTS_DIR)/3_place.odb ; \
			$(SUB_MAKE) do-3_place.sdc ; \
		else \
			$(SUB_MAKE) do-3_place do-3_place.sdc ; \
			echo >$(RESULTS_DIR)/place.ok 1 ; \
		fi ; \
	fi
