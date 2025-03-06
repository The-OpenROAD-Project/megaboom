#!/bin/bash
# store in separate folder to avoid conflict
# with label of generated file
mkdir -p $BUILD_WORKSPACE_DIRECTORY/snapshots
cp --no-preserve=all $@ $BUILD_WORKSPACE_DIRECTORY/snapshots/
