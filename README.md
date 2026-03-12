# MegaBoom: bazel-orfs example for large CPU designs with RAM macros

This project demonstrates a practical [bazel-orfs](https://github.com/The-OpenROAD-Project/bazel-orfs) workflow for a large RISC-V CPU design (MegaBoom from [Chipyard](https://chipyard.readthedocs.io/)) using the ASAP7 open PDK. It shows how to mock RAM macros to get early PPA (power, performance, area) results and refine them iteratively.

The top-level target is `BoomTile`, which synthesizes through routing with 15+ mocked SRAM macros and 2 register files.

## Before you begin

**Prerequisites:**

- [Bazelisk](https://github.com/bazelbuild/bazelisk) (or Bazel 8.3.1+)
- Docker (the ORFS tools run in a container)

**Dependencies:**

The [bazel-orfs](https://github.com/The-OpenROAD-Project/bazel-orfs) dependency and ORFS Docker image are configured in [MODULE.bazel](MODULE.bazel). To pin a different bazel-orfs version, update the `git_override` commit there.

## Quick start

Build the full flow (synthesis through routing):

```bash
bazelisk build BoomTile_route
```

View the design after clock tree synthesis in the OpenROAD GUI:

```bash
bazel run BoomTile_cts $(pwd)/tmp gui_cts
```

Build time is on the order of 24 hours without a pre-built artifact cache.

## Project structure

```
rtl/              RTL source files (.sv, .v) generated from Chipyard
mock/             Mock SRAM implementations (.sv) replacing real SRAM compilers
snapshots/
  kept.bzl        List of modules preserved during hierarchical synthesis
  macro_placement.tcl  Macro placement from hierarchical floorplanning
BUILD.bazel       All Bazel target definitions
MODULE.bazel      Bazel module dependencies (bazel-orfs, Python, etc.)
constraints*.sdc  Timing constraints
io-*.tcl          IO pin placement constraints
util.tcl          TCL utilities for pin matching
```

## How the flow works

### SRAM macros

Real SRAM compilers are typically not available in open PDKs. This project
**mocks** each RAM as synthesizable logic, sized to approximate a real SRAM's
area. This lets you run the full physical design flow and get meaningful PPA
estimates.

Each SRAM is defined in `BUILD.bazel` with parameters:

| Parameter          | Description                                              |
|--------------------|----------------------------------------------------------|
| `mock_area`        | Target area multiplier for the mocked SRAM               |
| `aspect_ratio`     | Width/height ratio of the SRAM block                     |
| `core_utilization` | Cell utilization percentage (alternative to `mock_area`)  |

SRAMs are synthesized through CTS (clock tree synthesis) and abstracted as
macro LEF/LIB for use by the top-level BoomTile flow. To check SRAM metrics:

```bash
bazelisk build sram_report
```

This generates a markdown table comparing each SRAM's dimensions and timing.

### Top-level BoomTile synthesis

BoomTile uses **hierarchical synthesis**: the design is partitioned into ~96
sub-modules (listed in [snapshots/kept.bzl](snapshots/kept.bzl)) that are
synthesized independently, then cleaned with
[najaeda](https://github.com/najaeda/najaeda) (constant propagation and dead
logic elimination) before physical design.

Key settings in `BOOMTILE_VARIABLES`:

- **Die area:** 1000x1000 um
- **Placement density:** 0.40
- **Clock period:** 1200 ps (833 MHz), defined in [constraints-boomtile.sdc](constraints-boomtile.sdc)
- **Timing margins:** Relaxed (`SETUP_SLACK_MARGIN: -2500`) to prioritize completing the flow

The flow generates three variants via `orfs_sweep`:

- **base**: Timing-driven placement with retiming
- **macro**: Provides macro placement for manual tuning
- **hierarchical**: Full hierarchical synthesis

### Iterative PPA refinement

The workflow for tuning the design:

1. **Start with rough SRAM sizing.** Set `mock_area` conservatively. Run
   `bazelisk build sram_report` to compare mocked area against synthesized
   area.

2. **Adjust SRAM parameters.** Tune `mock_area` and `aspect_ratio` to better
   match expected real SRAM dimensions. Smaller SRAMs use `aspect_ratio`;
   larger ones may need `core_utilization` instead.

3. **Tune macro placement.** The hierarchical flow auto-places macros. Extract
   placement with `bazelisk build write_macro_placement`, copy snapshots with
   `bazel run update`, and manually adjust if needed.

4. **Visualize timing.** After CTS, use `bazelisk build xy_stats` and
   `bazel run show_skew` for a 3D visualization of timing slack across the
   chip.

5. **Tighten timing margins.** As the design converges, reduce
   `SETUP_SLACK_MARGIN` and `HOLD_SLACK_MARGIN` for more realistic results.

## Adapting for your own design

To use this project as a template for your own design:

1. **Replace the RTL.** Put your Verilog/SystemVerilog files in `rtl/`.

2. **Identify RAM macros.** Find memories in your design that should be treated
   as macros. Create mock implementations in `mock/` and add them to
   `mock_files` and the SRAM dictionaries in `BUILD.bazel`.

3. **Set up timing constraints.** Create an SDC file with your clock period and
   IO timing. Update the `constraints-*` filegroups.

4. **Set up IO constraints.** Define pin placement in `io-*.tcl` files using
   `set_io_pin_constraint`.

5. **Configure the top-level flow.** Adjust `DIE_AREA`, `CORE_AREA`,
   `PLACE_DENSITY`, and timing margins in `BOOMTILE_VARIABLES` (rename as
   appropriate for your design).

6. **Start coarse, refine iteratively.** Begin with relaxed timing margins and
   generous die area. Tighten as results improve.

## Bazel targets reference

| Target                        | Description                                         |
|-------------------------------|-----------------------------------------------------|
| `BoomTile_route`              | Full flow: synthesis through routing                |
| `BoomTile_synth`              | Synthesis only                                      |
| `BoomTile_cts`                | Through clock tree synthesis                        |
| `BoomTile_cleaned_netlist`    | Hierarchical netlist with naja optimization         |
| `sram_report`                 | SRAM metrics comparison table                       |
| `<sram>_generate_abstract`    | Individual SRAM abstract (LEF/LIB)                  |
| `write_macro_placement`       | Extract macro placement from hierarchical flow      |
| `write_kept`                  | Extract kept module list from hierarchical synthesis|
| `update`                      | Copy generated snapshots to `snapshots/`            |
| `xy_stats`                    | Timing slack position data                          |
| `show_skew`                   | 3D timing slack visualization                       |
| `kpi`                         | Key performance indicators                          |

## About the RTL

The `rtl/` folder was generated from [Chipyard](https://chipyard.readthedocs.io/) using the MegaBoom configuration:

```bash
make CONFIG=MegaBoomConfig tech_name=asap7 VLSI_TOP=ChipTop \
  INPUT_CONFS=example-asap7.yml TOP_MACROCOMPILER_MODE='--mode synflops' verilog
```
