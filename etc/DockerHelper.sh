#!/usr/bin/env bash
#
# Helper script to build and push megaboom-compliant machine images to docker
#
# Adapted from orfs DockerHelper.sh script
#

set -euo pipefail

cd "$(dirname $(readlink -f $0))/../"

baseDir="$(pwd)"
# docker hub organization/user from where to pull/push images
org=openroad

DOCKER_CMD="docker"

_help() {
    cat <<EOF
usage: $0 [CMD] [OPTIONS]

  CMD:
  create                        Create a docker image
  push                          Push the docker image to Docker Hub

  OPTIONS:
  -os=OS_NAME                   Choose between ubuntu22.04 (default) and ubuntu24.04
  -target=TARGET                Choose target for the Docker image:
                                  'dev': os + packages to compile app
  -tag=TAG                      Use as the image tag. Default is git commit sha.
  -username=USERNAME            Username to login at the docker registry.
  -password=PASSWORD            Password to login at the docker registry.
  -ci                           Argument isn't used, but kept since dockerPush.groovy calls the script with the arg (compatibility with ORFS Jenkins)
  -dry-run                      Do not push images to the repository
  -h -help                      Show this message and exits

EOF
    exit "${1:-1}"
}

#
# Sets up image name and tag for the run
#
_setup() {
    case "${os}" in
        "ubuntu22.04")
            osBaseImage="ubuntu:22.04"
            ;;
        "ubuntu24.04")
            osBaseImage="ubuntu:24.04"
            ;;
        *)
            echo "Target OS ${os} not supported" >&2
            _help
            ;;
    esac
    imageName="${IMAGE_NAME_OVERRIDE:-"${org}/megaboom-${os}-${target}"}"
    if [[ "${tag}" != "" ]]; then
        imageTag="${tag}"
    else
        imageTag=$(./etc/DockerTag.sh -dev)
    fi
    case "${target}" in
        "dev" )
            fromImage="${FROM_IMAGE_OVERRIDE:-$osBaseImage}"
            context="."
            ;;
        *)
            echo "Target ${target} not found" >&2
            _help
            ;;
    esac
    imagePath="${imageName}:${imageTag}"
    buildArgs="--build-arg fromImage=${fromImage}"
    file="docker/Dockerfile.${target}"
}

#
# Create the docker image from the dockerfile
# use --no-cache since some weird problems installing bazel have been encountered during testing when using the cache
#
_create() {
    echo "Create docker image ${imagePath} using ${file}"
    echo "${DOCKER_CMD} buildx build --no-cache --file \"${file}\" --tag \"${imagePath}\" ${buildArgs} \"${context}\""
    ${DOCKER_CMD} buildx build \
        --file "${file}" \
        --tag "${imagePath}" \
        ${buildArgs} \
        "${context}"
}

#
# Pushes docker image to dockerhub. Use -dry-run to simulate the push, but don't actually push
#
_push() {
    if [[ -z ${username+x} ]]; then
        echo "Missing required -username=<USER> argument"
        _help
    fi
    if [[ -z ${password+x} ]]; then
        echo "Missing required -password=<PASS> argument"
        _help
    fi
    if [[ "${target}" != "dev" ]]; then
        echo "Target ${target} is not valid candidate for push to Docker Hub." >&2
        _help
    fi

    if [[ "${dryRun}" == 1 ]]; then
        echo "Skipping docker login"
    else
        ${DOCKER_CMD} login --username "${username}" --password "${password}"
    fi

    if [[ "${tag}" == "" ]]; then
        tag=$(./etc/DockerTag.sh -dev)
    fi

    mkdir -p build

    if [[ "${target}" == "dev" ]]; then
        ./etc/DockerHelper.sh create -os=${os} -target=dev -tag=${tag} \
            2>&1 | tee build/create-megaboom-${os}-${tag}.log

        if [[ "${dryRun}" == 1 ]]; then
            echo "[DRY-RUN] ${DOCKER_CMD} push ${org}/megaboom-${os}-dev:${tag}"
        else
            ${DOCKER_CMD} push "${org}/megaboom-${os}-dev:${tag}"
        fi
    fi
}

#
# MAIN
#

# script has at least 1 argument, the rule
if [[ $# -lt 1 ]]; then
    echo "Too few arguments" >&2
    _help
fi

if [[ "$1" == "-h" || "$1" == "-help" ]]; then
    _help 0
fi

_rule="_${1}"
shift 1

# check if the rule is exists
if [[ -z $(command -v "${_rule}") ]]; then
    echo "Command ${_rule/_/} not found" >&2
    _help
fi

# default values, can be overwritten by command line arguments
os="ubuntu22.04"
target="dev"
tag=""
dryRun=0

while [ "$#" -gt 0 ]; do
    case "${1}" in
        -h|-help)
            _help 0
            ;;
        -dry-run )
            dryRun=1
            ;;
        -os=* )
            os="${1#*=}"
            ;;
        -target=* )
            target="${1#*=}"
            ;;
        -username=* )
            username="${1#*=}"
            ;;
        -password=* )
            password="${1#*=}"
            ;;
        -tag=* )
            tag="${1#*=}"
            ;;
        -os | -target | -threads | -username | -password | -tag )
            echo "${1} requires an argument" >&2
            _help
            ;;
        *)
            echo "unknown option: ${1}" >&2
            _help
            ;;
    esac
    shift 1
done

_setup

"${_rule}"
