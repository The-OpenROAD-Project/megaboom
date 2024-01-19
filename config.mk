# Hmmm.... PLATFORM can't be passed on the command line as "make PLATFORM=asap7", because
# include of the platform config.mk doesn't see PLATFORM=aspa7.
export PLATFORM=asap7

export WORK_HOME_READ?=$(WORK_HOME)

-include clock_period-bazel.mk
-include orfs-bazel.mk
-include synth-bazel.mk
-include synth_sdc-bazel.mk
-include floorplan-bazel.mk
-include place-bazel.mk
-include cts-bazel.mk
-include grt-bazel.mk
-include route-bazel.mk
-include final-bazel.mk
-include generate_abstract-bazel.mk
