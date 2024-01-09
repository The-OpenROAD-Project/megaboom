# Hmmm.... PLATFORM can't be passed on the command line as "make PLATFORM=asap7", because
# include of the platform config.mk doesn't see PLATFORM=aspa7.
export PLATFORM=asap7

export WORK_HOME_READ?=$(WORK_HOME)

-include bazel-clock_period.mk
-include bazel-orfs.mk
-include bazel-synth.mk
-include bazel-synth_sdc.mk
-include bazel-floorplan.mk
-include bazel-place.mk
-include bazel-cts.mk
-include bazel-grt.mk
-include bazel-route.mk
-include bazel-final.mk
-include bazel-generate_abstract.mk
