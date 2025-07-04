Bazel on OpenROAD-flow-scripts(ORFS) with MegaBoom use case
===========================================================

Demonstrates a practical workflow for large designs in a git repository that is not a fork of [OpenROAD-flow-scripts](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts) and that is using its own file layout: similar to a private repository or a large project.

MegaBoom(a RISC-V SoC from Chipyard) has been chosen as a test-case as it is large, familiar and interesting in itself.

Build and view result
---------------------

The build of MegaBoom takes on the order of 24 hours, unless you configure an
[artifact server](#using-the-openroad-project-bazel-artifact-server-to-download-pre-built-results)
to download pre-built results.

Read [OpenROAD-flow-scripts](https://github.com/The-OpenROAD-Project/bazel-orfs) for more details on how to use Bazel to build BoomTile and examine results, but oneliner to build BoomTile and view the results after the CTS(clock tree synthesis stage) in the GUI is:

    bazel run BoomTile_cts $(pwd)/tmp gui_cts

Setup
-----

For running Bazel flow for the ORFS, MegaBoom uses [bazel-orfs](https://github.com/The-OpenROAD-Project/bazel-orfs).
It provides two different Bazel flows for running Physical Design Flow with OpenROAD-flow-scripts.
For the installation and usage guide, please refer to [bazel-orfs's README](https://github.com/The-OpenROAD-Project/bazel-orfs/blob/main/README.md).

Bazel-orfs must be specified in MegaBoom as the external dependency.
It can be pinned to a specific revision of [the upstream repository](https://github.com/The-OpenROAD-Project/bazel-orfs) or the dependency can point to a local bazel-orfs workspace available on disk.
Setup can be modified in [MODULE.bazel](./MODULE.bazel) file.

About the MegaBoom RTL code
===========================

Based on: https://chipyard.readthedocs.io/en/stable/VLSI/Sky130-OpenROAD-Tutorial.html#initial-setup

> **Note:** Chipyard main does not work smoothly with MegaBoom as of writing as Chipyard is mixing SFC and MFC.

Follow https://github.com/ucb-bar/chipyard/issues/1623 for latest updates.

That said, the `rtl/` folder was generated using latest Chipyard + some hacked files locally:

```
make tutorial=sky130-openroad CONFIG=MegaBoomMacroConfig verilog
```

Hammer hacking with ASAP7
-------------------------

Build everything:

```
./build-setup.sh --skip-ctags --skip-conda --skip-toolchain --skip-firesim --skip-marshal --skip-clean
```

Create Verilog code:

```
make CONFIG=MegaBoomConfig tech_name=asap7 VLSI_TOP=ChipTop INPUT_CONFS=example-asap7.yml TOP_MACROCOMPILER_MODE='--mode synflops' verilog
```
