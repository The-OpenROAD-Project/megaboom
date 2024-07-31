#!/bin/bash

set -e

target_name=${TARGET:-"tag_array_64x184"}
if [[ -z "$STAGES" ]]; then
  STAGES=("synth" "floorplan" "place" "cts")
else
  eval "STAGES=($STAGES)"
fi

echo "Build ${target_name} macro"
for stage in "${STAGES[@]}"
do
  if [[ -z $SKIP_BUILD ]] ; then
    echo "query dependency target"
    bazel query "${target_name}_${stage}_deps"
    bazel query "${target_name}_${stage}_deps" --output=build
    echo "build dependency"
    bazel run --subcommands --verbose_failures --sandbox_debug "${target_name}_${stage}_deps" -- "$(pwd)/build"
  fi
  if [[ -z $SKIP_RUN ]] ; then
    echo "run make script"
    build/make "${stage}"
  fi
done

if [[ -z $SKIP_BUILD && -z $SKIP_ABSTRACT ]]; then
    echo "query abstract target"
    bazel query "${target_name}_generate_abstract"
    bazel query "${target_name}_generate_abstract" --output=build
    echo "build abstract"
    bazel build --subcommands --verbose_failures --sandbox_debug "${target_name}_generate_abstract"
fi
