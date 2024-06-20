load("@bazel-orfs//:openroad.bzl", "build_openroad")

build_openroad(
    name = "tag_array_64x184",
    io_constraints = "//:io-sram",
    abstract_stage = "floorplan",
    sdc_constraints = "//:constraints-sram",
    stage_args = {
        "synth": [
            "SYNTH_MEMORY_MAX_BITS=12000",
        ],
        "floorplan": [
            "CORE_UTILIZATION=40",
            "CORE_ASPECT_RATIO=2",
        ],
        "place": ["PLACE_DENSITY=0.65"],
    },
    verilog_files = ["rtl/tag_array_64x184.sv"],
)
