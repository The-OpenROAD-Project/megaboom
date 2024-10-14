#!/usr/bin/env bash

#
# Executes Megaboom build and test. Captures build messages in build.log file
# consumed by caller.
#

#
# Sets up logging to build.log file
#
__logging()
{
        local log_file="build.log"
        exec > >(tee -i "${log_file}")
        exec 2>&1
}

# Runs cred_helper test to verify that that GCP account has correct
# entitlements
__check_entitlements()
{
    test/cred_helper_test.py
    retVal=$?
    echo "ret code is $retVal"
    if [ $retVal -ne 0 ]; then
        echo "ERROR: cred_helper_test.py failed"
        exit $retVal
    fi
}

#
# Runs the BoomTile build through the grt stage
#
__run_boomtile_build()
{
    bazel build BoomTile_grt
    retVal=$?
    if [ $retVal -ne 0 ]; then
        echo "ERROR: Bazel build failed"
        exit $retVal
    fi
}

# Enable logging
__logging

# Check GCP service account entitlements first
__check_entitlements

# Run BoomTile build
__run_boomtile_build

exit 0
