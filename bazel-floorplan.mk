.PHONY: bazel-floorplan
bazel-floorplan:
	mkdir -p $(LOG_DIR) $(REPORTS_DIR)
	touch $(LOG_DIR)/2_3_floorplan_tdms.log
	$(UNSET_AND_MAKE) do-2_1_floorplan do-2_2_floorplan_io do-2_3_floorplan_tdms do-2_4_floorplan_macro do-2_5_floorplan_tapcell do-2_6_floorplan_pdn do-2_floorplan
