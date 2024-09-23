#!/usr/bin/env bash
#
# Creates and returns a SHA256 for the input files so that we can determine if a new Docker machine
# image needs to be created and pushed to docker hub
#

cd $(dirname $(realpath $0))/../

if [[ "$@" == "-dev" ]]; then
    file_list=(
        "./docker/Dockerfile.dev"
	"./docker/user-bazelrc"
	"./docker/bazelrc"
        "./etc/DockerHelper.sh"
        "./etc/DockerTag.sh"
    )
    cat "${file_list[@]}" | sha256sum | awk '{print substr($1, 1, 6)}'
elif [[ "$@" == "-main" ]]; then
    git describe
else
    echo "Usage: $0 {-dev|-main}"
    exit 1
fi
