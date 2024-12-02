#!/usr/bin/env bash
set -euox pipefail

# Sets up logging to build.log file
exec > >(tee -i build.log)
exec 2>&1

# Check GCP service account entitlements first
test/cred_helper_test.py

bazel build BoomTile_sweep_parallel --keep_going
# If we're not sweeping grt, then we could have
# started wns_report sooner, but at least we're not
# running multiple grt builds in parallel, which makes
# the server fall over.
bazel build --jobs 1 BoomTile_wns_report BoomTile_grt --keep_going
cat bazel-bin/BoomTile_wns_report.md
