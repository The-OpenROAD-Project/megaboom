#!/usr/bin/env bash
set -euox pipefail

# Sets up logging to build.log file
exec > >(tee -i build.log)
exec 2>&1

# Check GCP service account entitlements first
test/cred_helper_test.py

bazel build BoomTile_grt
