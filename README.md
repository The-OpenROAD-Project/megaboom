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

There are many build flows on top of OpenROAD
---------------------------------------------

There are numerous build flows on top of OpenROAD, these are some:

- ORFS. The developers of OpenROAD use this flow
  to test the tool. It has features specifically for reporting bugs and
  is simple to understand for OpenROAD developers as well as novice
  users. It provides a lingua franca in the community to discuss features
  and test cases.
- [Hammer](https://chipyard.readthedocs.io/en/latest/VLSI/Hammer.html) is used with
  Chipyard.
- https://www.zeroasic.com/ has a Python based workflow that supports both
  commercial tools and OpenROAD.

Why Bazel on top of ORFS?
-------------------------

ORFS and OpenROAD is work in progress and one should expect for
large designs to get involved with the community or need a
support contract with Precision Innovations (https://www.linkedin.com/in/tomspyrou/).

Using ORFS directly, instead of modifying it or creating an alternative flow,
makes it easy to get the very latest features and version of OpenROAD and ORFS
as well as having access to the tools, `make issue` and `deltaDebug.py`,
required to articulate familiar and easily actionable github issues for
the OpenROAD and ORFS maintainers.

Challenges with large designs and ORFS that Bazel helps address
---------------------------------------------------------------

- **Long build times**; hours, days.
- **Artifacts** are needed. Synthesis, for instance, can
  be very time consuming and it is useful to share synthesis artifacts
  between developers and CI servers. On a large design with multiple
  developers and many pull requests in flight, it can become error
  prone to manually track exactly what version of built stages that
  are still valid. Ideally one should be able to check out a
  pull request and automatically get the right prebuilt artifacts.
- **Dependencies** in ORFS are at the file level. For instance, synthesis must be
  redone if the clock period changes, but many other changes to .sdc do not require
  resynthesis. With finer grained dependencies, superfluous time consuming
  resynthesis, floor planning, placement, cts and routing can be avoided.
- **Examining failures** for global/detailed place/route, that can take many
  hours to build, is useful. Artifacts for failed stages are needed to
  examine the problem: failed .odb file as well as any reports. This workflow
  always existed for detailed routing: detailed routing succeeds, has exit code 0,
  even if there are DRC errors.
- **Mocking abstracts** when doing initial top-level floorplanning is needed to
  separate concerns. It can be useful to skip one of place, cts, route for
  the macros until one starts to converge on a workable
  top level floorplan. This is supported via `mock_abstract` in `openroad.bzl`
- **Efficient local storage of build artifacts** are needed as .odb files are
  large and they should not exist in duplicates unnecessarily. Bazel
  uses symbolic links. ORFS can not use symbolic links for .odb files because,
  long story short, `make` does not work properly with symbolic links. This becomes
  especially important when working with many branches and pull requests where
  there is a large degree of shared .odb files.
- **Parallel builds** are required for macros.
- **Remote build services** are required for large projects where
  developers machines are powerful enough to examine results, but
  not to run builds.
- **Cross cutting builds** such as completing floor planning for all macros,
  then place, then cts, then route is required to be able to separate concerns.
  When iterating on the concerns, it can be useful to complete placement under
  human supervision to iterate quickly, but to leave routing for CI servers to complete.
- **Select level of detail of artifacts** is useful throughout the
  development process. Initially for a macro, artifacts are useful for inspection
  for synthesis, floorplan, place, cts, route and abstract. Later, for stable macros,
  abstracts are adequate(no .odb file, only .lef, .lib and .gds).

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

For the local `bazel-orfs` it is also required to mount the `bazel-orfs` workspace directory to the docker containers while using the `docker flow`.
In your local `bazel-orfs` apply the changes showcased by the diff:

```
diff --git a/docker_shell.sh b/docker_shell.sh
index db1673c..f933d6a 100755
--- a/docker_shell.sh
+++ b/docker_shell.sh
@@ -83,6 +83,7 @@ docker run --name "bazel-orfs-$uid" --rm \
  -e WORK_HOME=$WORKSPACE_EXECROOT/$RULEDIR \
  -v $WORKSPACE_ROOT:$WORKSPACE_ROOT \
  -v $WORKSPACE_ORIGIN:$WORKSPACE_ORIGIN \
+ -v <path to local bazel-orfs directory>:<path to local bazel-orfs directory> \
  --network host \
  $DOCKER_INTERACTIVE \
  $DOCKER_ARGS \
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
# Build L1MetadataArray macro up to the CTS stage
bazel build L1MetadataArray_test_cts

# View results with OpenROAD GUI
bazel run L1MetadataArray_test_cts_gui
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
