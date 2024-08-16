#!/bin/bash

set -e

target_name=${TARGET:-"tag_array_64x184"}
if [[ -z "$STAGES" ]]; then
  STAGES=("canonicalize" "synth" "floorplan" "place" "cts")
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
    if [[ $stage == "canonicalize" ]]; then
        stages+=("do-yosys-canonicalize")
    else
      if [[ $stage == "synth" ]]; then
          stages+=("do-yosys")
      fi
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
