#!/bin/bash

set -e

target_name=${TARGET:-"tag_array_64x184"}
flow=${FLOW:-"local_make"}
if [[ -z "$STAGES" ]]; then
  STAGES=("synth_sdc" "synth" "floorplan" "place" "cts" "generate_abstract")
else
  eval "STAGES=($STAGES)"
fi

echo "Build tag_array_64x184 macro"
for stage in ${STAGES[@]}
do
  if [[ -z $SKIP_BUILD ]] ; then
    echo "query make script target"
    bazel query ${target_name}_${stage}_scripts
    bazel query ${target_name}_${stage}_scripts --output=build
    echo "build make script"
    bazel build --subcommands --verbose_failures --sandbox_debug ${target_name}_${stage}_scripts
  fi
  if [[ -z $SKIP_RUN ]] ; then
    echo "run make script"
    ./bazel-bin/${target_name}_${stage}_${flow} "bazel-"${stage}
  fi
done
