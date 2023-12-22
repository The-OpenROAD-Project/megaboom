# Hmmm.... PLATFORM can't be passed on the command line as "make PLATFORM=asap7", because
# include of the platform config.mk doesn't see PLATFORM=aspa7.
export PLATFORM=asap7

export WORK_HOME_READ?=$(WORK_HOME)

include bazel.mk
