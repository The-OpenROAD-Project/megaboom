Bazel on ORFS with MegaBoom use case
====================================

This is a stand-alone project that has a wafer thin Bazel layer on top
of ORFS.

The purpose of this project is to demonstrate and develop a practical workflow
for large designs, such as MegaBoom(a RISC-V SoC from Chipyard), on top of
OpenROAD-flow-scripts.

Why Bazel on top of OpenROAD-flow-scripts(ORFS)?
------------------------------------------------

ORFS and OpenROAD is work in progress and one should expect for
large designs to get involved with the community or need a
support contract with, for instance, Precision Innovations (https://www.linkedin.com/in/tomspyrou/).

Using ORFS directly, instead of modifying it or creating an alternative flow,
makes it easy
to get the very latest features and version of OpenROAD and ORFS as well as having
access to the tools, `make issue` and `deltaDebug.py`,
required to articulate familiar and easily actionable github issues for
the OpenROAD and ORFS maintainers.

This goes both feature request as well as bug reports.

Challenges with large designs and ORFS that Bazel helps address
---------------------------------------------------------------

- Building macros that comprise the top level can take a long time, hours, days.
- There is no built in support in ORFS for artifacts. For instance synthesis can
  be very time consuming and and it would be useful to share synthesis artifacts
  between developers and CI servers.
- Dependencies in ORFS are at the file level. For instance, synthesis must be
  redone if the clock period changes, but many other changes to .sdc do not require
  resynthesis. With finer grained dependencies, superfluous time consuming resynthesis,
  floor planning, placement, cts and routing can be avoided.
- On a large design with multiple developers and many pull requests in flight,
  it can become error prone to manually track exactly what version of built
  stages that are still valid. Ideally one should be able to check out a
  pull request and automatically get the right prebuilt artifacts.
- Upon global/detailed place/route failures that can take many hours, it is useful
  to have artifacts to examine: failed .odb file as well as any reports. This workflow
  always existed for detailed routing: detailed routing succeeds, has exit code 0,
  even if there are DRC errors.
- When doing initial top-level floorplanning, it can be useful to skip one of
  place, cts, route for the macros until one starts to converge on a workable
  top level floorplan. This is supported via `mock_abstract` in `openroad.bzl`
- .odb files are large and they should not exist in duplicates unnecessarily. Bazel
  uses symbolic links. ORFS can not use symbolic links for .odb files because,
  long story short, `make` does not work properly with symbolic links. This becomes
  especially important when working with many branches and pull requests where
  there is a large degree of shared .odb files.
- Macros are not easy to build in parallel with ORFS
- ORFS does not support transparent usage of build servers when working locally
- ORFS does not, out of the box, provide an easy way to do cross cutting builds, such
  as completing floor planning for all macros, then place, then cts, then route.
  When iterating on the issues, it can be useful to complete placement under
  human supervision to iterate quickly, but to leave routing for CI servers to complete.
- The number of artifacts required for a macro or a design varies throughout the
  development process. Initially for a macro, artifacts are useful for inspection
  for synthesis, floorplan, place, cts, route and abstract. Later, for stable macros,
  abstracts are adequate(no .odb file, only .lef, .lib and .gds).

Setup
-----

This setup intentionally does not treat ORFS as a installable versioned tool,
but prefers to rely on ~/OpenROAD-flow-scripts such that it is easy to hack
ORFS and OpenROAD.

- Clone and build OpenROAD-flow-scripts into ~/OpenROAD-flow-scripts. The example `./orfs`
  script in this example assumes this location.
- Install Bazel and Bazelisk https://github.com/bazelbuild/bazelisk

Example of using a Bazel artifact server
----------------------------------------

If you only have a single Google account that you use for Google Cloud locally, you can use
`--google_default_credentials`.

Otherwise, Bazel appears to have some trouble picking the correct account. The workaround is to
use `--google_credentials` where the account can be specified explicitly.

Set up a Google Cloud bucket and add the following to `.bazelrc`:

    build --remote_cache=https://storage.googleapis.com/megaboom-bazel-artifacts --google_credentials=/home/oyvind/Downloads/innate-diode-408109-9c5d0543f9b3.json --remote_cache_compression=true

To create the .json file:

- create a service account. Only service account can have application keys.
- add service account to bucket and give it permissions to read/write/list as appropriate

Tutorial
========

Hello world
-----------

A quick test-build of Bazel:

    bazelisk build ALUExeUnit_generate_abstract

Viewing results from Bazel:

    ./orfs make DESIGN_NAME=ALUExeUnit gui_final

Tweaking aspect ratio of a floorplan
------------------------------------

Notice how the `CORE_ASPECT_RATIO` parameter is associated with
the floorplan and *only* the floorplan stage below.

Bazel will detect this change specifically as a change to the
floorplan, re-use the synthesis result and rebuild from the
floorplan stage. Similarly, if the `PLACE_DENSITY` is modified,
only stages from the placement and on are re-built.

Also, notice that when the aspect ratio is changed back to
a value for which there exists artifacts, Bazel completes
instantaneously as the artifact already exists:

    --- a/BUILD.bazel
    +++ b/BUILD.bazel
    @@ -165,7 +165,7 @@ exeunitsrc =  [ "rtl/ALU.sv",
            stage_args={
                    'floorplan': ['CORE_UTILIZATION=5',
    -                'CORE_ASPECT_RATIO=8',
    +                'CORE_ASPECT_RATIO=6',
                    "RTLMP_FLOW=True"],
                    'place': ['PLACE_DENSITY=0.2000'],

Then run a quick test-build Bazel:

    bazelisk build ALUExeUnit_floorplan

Viewing final results from Bazel:

    ./orfs make DESIGN_NAME=ALUExeUnit gui_floorplan

Creating an issue report
------------------------

This is slightly tricky because we need find and use the variables Bazel passed to
ORFS on the command line.

The TL;DR to create a floorplan.tcl issue is:

  $(cat bazel-bin/build/logs/asap7/ALUExeUnit/base/floorplan.txt) floorplan_issue

bazel-bin/build/logs/asap7/ALUExeUnit/base/floorplan.txt contains a command where you can
pass additional arguments to ORFS make:

  ./orfs make  DESIGN_NAME=ALUExeUnit  RTLMP_FLOW=True  CORE_UTILIZATION=5  ORFS_VERSION=4  DESIGN_CONFIG=config.mk

Fast floorplanning and mock abstracts
-------------------------------------

Let's say we want to skip place, cts and route and create a mock abstract where
we can at least check that there is enough place for the macros at the top level.

    Warning! Although mock abstracts can speed up turnaround times, skipping
    place, cts or route can lead to errors and problems that don't exist when place, cts and route are not skipped.

To do so, we modify `openroad.bzl`:

    --- a/openroad.bzl
    +++ b/openroad.bzl
    @@ -66,8 +66,8 @@ def build_openroad(

        # TODO: This is a hack to get the abstract generation to work. Figure out
        # how to specify this on the bazel command line later.
    -    mock_stage = 3
    -    mock_abstract = False
    +    mock_stage = 2
    +    mock_abstract = True

Then run:

    bazelisk build ALUExeUnit_generate_abstract

Tentative roadmap
=================

- Break out Bazel support into a orfs_rules project that can be imported from example
  projects such as this megaboom example. Perhaps orfs_rules could be hosted inside the ORFS
  repository, or perhaps it should be a standalone repository.
- ORFS and orfs_rules should be independently versioned dependencies
  while it should still be easy to do local hacking of ORFS. There should be a version
  number for the ORFS dependency and orfs_rules separately. It should be possible to
  specify the ORFS version per invocation of orfs_rules such that e.g. macros are not
  rebuilt unless the user wants them to be rebuilt. Some macros can take days to build
  and there could be manual verification involved and hence rebuilding should be
  more controllable than for your typical Bazel build that is reasonably fast(C++, Scala,
  etc.)
- Once a reasonable structure is in place, set up CI for pull requests and invite refinements
  and developments from the community.

Bazel hacking
=============

Run all synth targets
---------------------

    bazelisk build $(bazelisk query '...:*' | grep '_synth$')

Forcing a rebuild of a stage
----------------------------

Sometimes it is desirable, such as when hacking ORFS, to redo a build stage even
if none of the dependencies for that stage changed. This can be achieved by changing
a `PHONY` variable to that stage and bumping it:

    --- a/BUILD.bazel
    +++ b/BUILD.bazel
    @@ -166,7 +166,8 @@ exeunitsrc =  [ "rtl/ALU.sv",
            stage_args={
                    'floorplan': ['CORE_UTILIZATION=5',
                    'CORE_ASPECT_RATIO=8',
    -                "RTLMP_FLOW=True"],
    +                "RTLMP_FLOW=True",
    +                'PHONY=1'],


Staring at logs
---------------

This is surprisingly tricky, you have to go spelunking in ~/.cache/bazel/.

Downloading the immediate dependencies of a target
--------------------------------------------------

  bazel build $(bazel query 'deps(BoomTile_floorplan, 1)' --noimplicit_deps)

MegaBoom RTL code
=================

Based on: https://chipyard.readthedocs.io/en/stable/VLSI/Sky130-OpenROAD-Tutorial.html#initial-setup

    NOTE! Chipyard main does not work smoothly with MegaBoom as of writing as
    Chipyard is mixing SFC and MFC.

Follow https://github.com/ucb-bar/chipyard/issues/1623 for latest updates.

That said, the rtl/ folder was generated using latest Chipyard + some hacked
files locally:

     make buildfile tutorial=sky130-openroad CONFIG=MegaBoomConfig
