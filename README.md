Bazel on OpenROAD-flow-scripts(ORFS) with MegaBoom use case
===========================================================

This is a stand-alone project that use a wafer thin Bazel layer on top
of OpenROAD-flow-scripts.

The purpose of this project is to demonstrate and develop a practical workflow
for large designs in a git repository that is not a fork of OpenROAD-flow-scripts
and that is using its own file layout layout: similar to a private
repository for a large project.

MegaBoom(a RISC-V SoC from Chipyard) has been chosen as a test-case
as it is large, familiar and interesting in itself.

Setup
-----

For running bazel flow for the ORFS, megaboom uses [bazel-orfs](https://github.com/The-OpenROAD-Project/bazel-orfs).
It provides two different bazel flows for running Physical Design flow with [OpenROAD-flow-scripts](https://github.com/The-OpenROAD-Project/OpenROAD-flow-scripts).
For the installation and usage guide, please refer to [bazel-orfs's README](https://github.com/The-OpenROAD-Project/bazel-orfs/blob/main/README.md).

`bazel-orfs` must be specified in megaboom as the external dependency.
It can be pinned to a specific revision of [the upstream repository](https://github.com/The-OpenROAD-Project/bazel-orfs) or the dependency can point to a local bazel-orfs workspace available on disk.

### Upstream repository

In `MODULE.bazel` use [git_override](https://bazel.build/rules/lib/globals/module#git_override) to pin `bazel-orfs` version at specific commit:

```
git_override(
    module_name = "bazel-orfs",
    remote = "https://github.com/The-OpenROAD-Project/bazel-orfs.git",
    commit = "<commit hash>",
)
```

### Local workspace

For testing changes made to `bazel-orfs` it is useful to set the dependency to a local bazel-orfs workspace.
In order to do that, in `MODULE.bazel` use [local_path_override](https://bazel.build/rules/lib/globals/module#local_path_override):

```
local_path_override(
    module_name = "bazel-orfs", path = "<path to local bazel-orfs workspace>"
)
```

Example of using a Bazel artifact server
----------------------------------------

If you only have a single Google account that you use for Google Cloud locally, you can use
`--google_default_credentials`.

If you are use multiple google accounts, using the default credentials can be cumbersome when
switching between projects. To avoid this, you can use the `--credential_helper` option
instead, and pass a script that fetches credentials for the account you want to use. This
account needs to have logged in using `gcloud auth login` and have access to the bucket
specified.

To use this feature, copy the snippet below into `.bazelrc` and specify your username by modifying `# user: myname@openroad.tools`:

    # user: myname@openroad.tools
    build --credential_helper=%workspace%/cred_helper.py --remote_cache=https://storage.googleapis.com/megaboom-bazel-artifacts --remote_cache_compression=true

`cred_helper.py` will parse `.bazelrc` and look for the username in the comment.

**NOTE:** To test the credential helper, make sure to restart Bazel to avoid using a previous
cached authorization:

    bazel shutdown
    bazel build ALUExeUnit_floorplan

To gain access to the https://storage.googleapis.com/megaboom-bazel-artifacts bucket,
reach out to Tom Spyrou, Precision Innovations (https://www.linkedin.com/in/tomspyrou/).

Tutorial
========

This tutorial uses the `docker flow` to run the physical design flow with ORFS.
Before starting, it is required to have available in your docker runtime a docker image with `OpenROAD-flow-scripts` installation.
For more information, please refer to the [Requirements](https://github.com/The-OpenROAD-Project/bazel-orfs?tab=readme-ov-file#requirements) chapter of `bazel-orfs`.

---

**Note:**
`orfs_env` rule for downloading and loading the docker image is defined in `bazel-orfs`.
In order to run it in the context of megaboom (the workspace that uses `bazel-orfs` as external dependency), it is required to use correct bazel label to this external target:

```
bazel run @bazel-orfs//:orfs_env
```

---

Hello world
-----------

A quick test-build:

```
# Build L1MetadataArray macro up to the placement stage and generate scripts
bazel build L1MetadataArray_test_place_gui

# View results with OpenROAD GUI
./bazel-bin/L1MetadataArray_test_place_docker gui_place
```

Staring at logs
---------------

In ORFS it is oftentimes useful to view the tail of the single running
stage on a machine, `./out` is in this project to "stare at logs":

```
tail -f $(./out -t)
```

Currently, this script depends on bazel cache residing under `~/.cache/bazel/`.
This directory is scanned for the newest log file which name of gets printed to the standard output.

MegaBoom RTL code
=================

Based on: https://chipyard.readthedocs.io/en/stable/VLSI/Sky130-OpenROAD-Tutorial.html#initial-setup

```
**Note:** Chipyard main does not work smoothly with MegaBoom as of writing as Chipyard is mixing SFC and MFC.
```

Follow https://github.com/ucb-bar/chipyard/issues/1623 for latest updates.

That said, the `rtl/` folder was generated using latest Chipyard + some hacked files locally:

```
make tutorial=sky130-openroad CONFIG=MegaBoomMacroConfig verilog
```

Hammer hacking with ASAP7
=========================

Build everything:

```
./build-setup.sh --skip-ctags --skip-conda --skip-toolchain --skip-firesim --skip-marshal --skip-clean
```

Create Verilog code:

```
make CONFIG=MegaBoomConfig tech_name=asap7 VLSI_TOP=ChipTop INPUT_CONFS=example-asap7.yml TOP_MACROCOMPILER_MODE='--mode synflops' verilog
```
