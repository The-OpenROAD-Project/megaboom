#!/bin/bash

set -e

target_name=${TARGET:-"tag_array_64x184"}
if [[ -z "$STAGES" ]]; then
  if [[ "$target_name" == L1MetadataArray_* ]]; then
    STAGES=("synth_sdc" "synth" "floorplan" "place" "cts" "grt" "generate_abstract")
  else
    STAGES=("synth_sdc" "synth" "memory" "floorplan" "generate_abstract")
  fi
else
  eval "STAGES=($STAGES)"
fi

echo "Build tag_array_64x184 macro"
for stage in ${STAGES[@]}
do
  if [[ -z $SKIP_BUILD ]] ; then
    echo "query make script target"
    bazel query ${target_name}_${stage}_make
    bazel query ${target_name}_${stage}_make --output=build
    echo "build make script"
    bazel build --subcommands --verbose_failures --sandbox_debug ${target_name}_${stage}_make
  fi
  if [[ -z $SKIP_RUN ]] ; then
    echo "run make script"
    ./bazel-bin/${target_name}_${stage}_make $(if [[ "$stage" != "memory" ]] ; then echo "bazel-" ; fi)${stage}
  fi
done
