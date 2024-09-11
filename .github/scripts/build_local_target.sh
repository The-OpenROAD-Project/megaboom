#!/bin/bash

set -e

target_name=${TARGET:-"tag_array_64x184"}
if [[ -z "$STAGES" ]]; then
  STAGES=("synth" "floorplan" "place" "cts" "grt" "route")
else
  eval "STAGES=($STAGES)"
fi

echo "Build ${target_name} macro"
for stage in "${STAGES[@]}"
do
  if [[ -z $SKIP_BUILD ]] ; then
    echo "[${target_name}] ${stage}: Query dependency target"
    bazel query "${target_name}_${stage}_deps"
    bazel query "${target_name}_${stage}_deps" --output=build
    echo "[${target_name}] ${stage}: Build dependency"
    bazel run --subcommands --verbose_failures --sandbox_debug "${target_name}_${stage}_deps" -- "$(pwd)/build"
  fi
  if [[ -z $SKIP_RUN ]] ; then
    stages=()
    if [[ $stage == "synth" ]]; then
        stages+=("do-yosys-canonicalize")
        stages+=("do-yosys-keep-hierarchy")
        stages+=("do-yosys")
        stages+=("do-synth")
    elif [[ $stage == "grt" ]]; then
        stages+=("do-5_1_grt")
    elif [[ $stage == "route" ]]; then
        stages+=("do-5_2_fillcell")
        stages+=("do-5_3_route")
    else
        stages+=("do-${stage}")
    fi
    for local_stage in "${stages[@]}"
    do
        echo "[${target_name}] ${local_stage}: Run make script"
        build/make "${local_stage}"
    done
  fi
done

if [[ -z $SKIP_BUILD && -z $SKIP_ABSTRACT ]]; then
    echo "query abstract target"
    bazel query "${target_name}_generate_abstract"
    bazel query "${target_name}_generate_abstract" --output=build
    echo "build abstract"
    bazel build --subcommands --verbose_failures --sandbox_debug "${target_name}_generate_abstract"
fi
