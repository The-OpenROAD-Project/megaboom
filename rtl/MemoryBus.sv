// Standard header to adapt well known macros for prints and assertions.

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// Users can define 'ASSERT_VERBOSE_COND' to add an extra gate to assert error printing.
`ifndef ASSERT_VERBOSE_COND_
  `ifdef ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ (`ASSERT_VERBOSE_COND)
  `else  // ASSERT_VERBOSE_COND
    `define ASSERT_VERBOSE_COND_ 1
  `endif // ASSERT_VERBOSE_COND
`endif // not def ASSERT_VERBOSE_COND_

// Users can define 'STOP_COND' to add an extra gate to stop conditions.
`ifndef STOP_COND_
  `ifdef STOP_COND
    `define STOP_COND_ (`STOP_COND)
  `else  // STOP_COND
    `define STOP_COND_ 1
  `endif // STOP_COND
`endif // not def STOP_COND_

module MemoryBus(
  input         auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_ready,
  output        auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_valid,
  output [2:0]  auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_opcode,
                auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_param,
                auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_size,
  output [3:0]  auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_source,
  output [27:0] auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_address,
  output [7:0]  auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_mask,
  output [63:0] auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_data,
  output        auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_corrupt,
                auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_ready,
  input         auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_valid,
  input  [2:0]  auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_bits_opcode,
                auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_bits_size,
  input  [3:0]  auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_bits_source,
  input  [63:0] auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_bits_data,
  input         auto_coupler_to_bus_named_subsystem_obus_widget_out_a_ready,
  output        auto_coupler_to_bus_named_subsystem_obus_widget_out_a_valid,
  output [2:0]  auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_opcode,
                auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_param,
                auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_size,
  output [3:0]  auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_source,
  output [32:0] auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_address,
  output [7:0]  auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_mask,
  output [63:0] auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_data,
  output        auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_corrupt,
                auto_coupler_to_bus_named_subsystem_obus_widget_out_d_ready,
  input         auto_coupler_to_bus_named_subsystem_obus_widget_out_d_valid,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_param,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_size,
  input  [3:0]  auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_source,
  input         auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_sink,
                auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_denied,
  input  [63:0] auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_data,
  input         auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_corrupt,
                auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_1_clock,
                auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_1_reset,
                auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock,
                auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset,
  output        auto_subsystem_mbus_clock_groups_out_member_subsystem_obus_0_clock,
                auto_subsystem_mbus_clock_groups_out_member_subsystem_obus_0_reset,
                auto_bus_xing_in_a_ready,
  input         auto_bus_xing_in_a_valid,
  input  [2:0]  auto_bus_xing_in_a_bits_opcode,
                auto_bus_xing_in_a_bits_param,
                auto_bus_xing_in_a_bits_size,
  input  [3:0]  auto_bus_xing_in_a_bits_source,
  input  [32:0] auto_bus_xing_in_a_bits_address,
  input  [7:0]  auto_bus_xing_in_a_bits_mask,
  input  [63:0] auto_bus_xing_in_a_bits_data,
  input         auto_bus_xing_in_a_bits_corrupt,
                auto_bus_xing_in_d_ready,
  output        auto_bus_xing_in_d_valid,
  output [2:0]  auto_bus_xing_in_d_bits_opcode,
  output [1:0]  auto_bus_xing_in_d_bits_param,
  output [2:0]  auto_bus_xing_in_d_bits_size,
  output [3:0]  auto_bus_xing_in_d_bits_source,
  output        auto_bus_xing_in_d_bits_sink,
                auto_bus_xing_in_d_bits_denied,
  output [63:0] auto_bus_xing_in_d_bits_data,
  output        auto_bus_xing_in_d_bits_corrupt
);

  wire        _picker_auto_in_1_a_ready;
  wire        _picker_auto_in_1_d_valid;
  wire [2:0]  _picker_auto_in_1_d_bits_opcode;
  wire [2:0]  _picker_auto_in_1_d_bits_size;
  wire [3:0]  _picker_auto_in_1_d_bits_source;
  wire [63:0] _picker_auto_in_1_d_bits_data;
  wire        _picker_auto_in_0_a_ready;
  wire        _picker_auto_in_0_d_valid;
  wire [2:0]  _picker_auto_in_0_d_bits_opcode;
  wire [1:0]  _picker_auto_in_0_d_bits_param;
  wire [2:0]  _picker_auto_in_0_d_bits_size;
  wire [3:0]  _picker_auto_in_0_d_bits_source;
  wire        _picker_auto_in_0_d_bits_sink;
  wire        _picker_auto_in_0_d_bits_denied;
  wire [63:0] _picker_auto_in_0_d_bits_data;
  wire        _picker_auto_in_0_d_bits_corrupt;
  wire        _fixer_auto_out_a_valid;
  wire [2:0]  _fixer_auto_out_a_bits_opcode;
  wire [2:0]  _fixer_auto_out_a_bits_param;
  wire [2:0]  _fixer_auto_out_a_bits_size;
  wire [3:0]  _fixer_auto_out_a_bits_source;
  wire [32:0] _fixer_auto_out_a_bits_address;
  wire [7:0]  _fixer_auto_out_a_bits_mask;
  wire [63:0] _fixer_auto_out_a_bits_data;
  wire        _fixer_auto_out_a_bits_corrupt;
  wire        _fixer_auto_out_d_ready;
  wire        _subsystem_mbus_xbar_auto_in_a_ready;
  wire        _subsystem_mbus_xbar_auto_in_d_valid;
  wire [2:0]  _subsystem_mbus_xbar_auto_in_d_bits_opcode;
  wire [1:0]  _subsystem_mbus_xbar_auto_in_d_bits_param;
  wire [2:0]  _subsystem_mbus_xbar_auto_in_d_bits_size;
  wire [3:0]  _subsystem_mbus_xbar_auto_in_d_bits_source;
  wire        _subsystem_mbus_xbar_auto_in_d_bits_sink;
  wire        _subsystem_mbus_xbar_auto_in_d_bits_denied;
  wire [63:0] _subsystem_mbus_xbar_auto_in_d_bits_data;
  wire        _subsystem_mbus_xbar_auto_in_d_bits_corrupt;
  wire        _subsystem_mbus_xbar_auto_out_1_a_valid;
  wire [2:0]  _subsystem_mbus_xbar_auto_out_1_a_bits_opcode;
  wire [2:0]  _subsystem_mbus_xbar_auto_out_1_a_bits_param;
  wire [2:0]  _subsystem_mbus_xbar_auto_out_1_a_bits_size;
  wire [3:0]  _subsystem_mbus_xbar_auto_out_1_a_bits_source;
  wire [27:0] _subsystem_mbus_xbar_auto_out_1_a_bits_address;
  wire [7:0]  _subsystem_mbus_xbar_auto_out_1_a_bits_mask;
  wire [63:0] _subsystem_mbus_xbar_auto_out_1_a_bits_data;
  wire        _subsystem_mbus_xbar_auto_out_1_a_bits_corrupt;
  wire        _subsystem_mbus_xbar_auto_out_1_d_ready;
  wire        _subsystem_mbus_xbar_auto_out_0_a_valid;
  wire [2:0]  _subsystem_mbus_xbar_auto_out_0_a_bits_opcode;
  wire [2:0]  _subsystem_mbus_xbar_auto_out_0_a_bits_param;
  wire [2:0]  _subsystem_mbus_xbar_auto_out_0_a_bits_size;
  wire [3:0]  _subsystem_mbus_xbar_auto_out_0_a_bits_source;
  wire [32:0] _subsystem_mbus_xbar_auto_out_0_a_bits_address;
  wire [7:0]  _subsystem_mbus_xbar_auto_out_0_a_bits_mask;
  wire [63:0] _subsystem_mbus_xbar_auto_out_0_a_bits_data;
  wire        _subsystem_mbus_xbar_auto_out_0_a_bits_corrupt;
  wire        _subsystem_mbus_xbar_auto_out_0_d_ready;
  TLXbar_6 subsystem_mbus_xbar (
    .clock                     (auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock),
    .reset                     (auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset),
    .auto_in_a_ready           (_subsystem_mbus_xbar_auto_in_a_ready),
    .auto_in_a_valid           (_fixer_auto_out_a_valid),
    .auto_in_a_bits_opcode     (_fixer_auto_out_a_bits_opcode),
    .auto_in_a_bits_param      (_fixer_auto_out_a_bits_param),
    .auto_in_a_bits_size       (_fixer_auto_out_a_bits_size),
    .auto_in_a_bits_source     (_fixer_auto_out_a_bits_source),
    .auto_in_a_bits_address    (_fixer_auto_out_a_bits_address),
    .auto_in_a_bits_mask       (_fixer_auto_out_a_bits_mask),
    .auto_in_a_bits_data       (_fixer_auto_out_a_bits_data),
    .auto_in_a_bits_corrupt    (_fixer_auto_out_a_bits_corrupt),
    .auto_in_d_ready           (_fixer_auto_out_d_ready),
    .auto_in_d_valid           (_subsystem_mbus_xbar_auto_in_d_valid),
    .auto_in_d_bits_opcode     (_subsystem_mbus_xbar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param      (_subsystem_mbus_xbar_auto_in_d_bits_param),
    .auto_in_d_bits_size       (_subsystem_mbus_xbar_auto_in_d_bits_size),
    .auto_in_d_bits_source     (_subsystem_mbus_xbar_auto_in_d_bits_source),
    .auto_in_d_bits_sink       (_subsystem_mbus_xbar_auto_in_d_bits_sink),
    .auto_in_d_bits_denied     (_subsystem_mbus_xbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data       (_subsystem_mbus_xbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt    (_subsystem_mbus_xbar_auto_in_d_bits_corrupt),
    .auto_out_1_a_ready        (_picker_auto_in_1_a_ready),
    .auto_out_1_a_valid        (_subsystem_mbus_xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode  (_subsystem_mbus_xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param   (_subsystem_mbus_xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size    (_subsystem_mbus_xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source  (_subsystem_mbus_xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address (_subsystem_mbus_xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask    (_subsystem_mbus_xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data    (_subsystem_mbus_xbar_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt (_subsystem_mbus_xbar_auto_out_1_a_bits_corrupt),
    .auto_out_1_d_ready        (_subsystem_mbus_xbar_auto_out_1_d_ready),
    .auto_out_1_d_valid        (_picker_auto_in_1_d_valid),
    .auto_out_1_d_bits_opcode  (_picker_auto_in_1_d_bits_opcode),
    .auto_out_1_d_bits_size    (_picker_auto_in_1_d_bits_size),
    .auto_out_1_d_bits_source  (_picker_auto_in_1_d_bits_source),
    .auto_out_1_d_bits_data    (_picker_auto_in_1_d_bits_data),
    .auto_out_0_a_ready        (_picker_auto_in_0_a_ready),
    .auto_out_0_a_valid        (_subsystem_mbus_xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode  (_subsystem_mbus_xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param   (_subsystem_mbus_xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size    (_subsystem_mbus_xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source  (_subsystem_mbus_xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address (_subsystem_mbus_xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask    (_subsystem_mbus_xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data    (_subsystem_mbus_xbar_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt (_subsystem_mbus_xbar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready        (_subsystem_mbus_xbar_auto_out_0_d_ready),
    .auto_out_0_d_valid        (_picker_auto_in_0_d_valid),
    .auto_out_0_d_bits_opcode  (_picker_auto_in_0_d_bits_opcode),
    .auto_out_0_d_bits_param   (_picker_auto_in_0_d_bits_param),
    .auto_out_0_d_bits_size    (_picker_auto_in_0_d_bits_size),
    .auto_out_0_d_bits_source  (_picker_auto_in_0_d_bits_source),
    .auto_out_0_d_bits_sink    (_picker_auto_in_0_d_bits_sink),
    .auto_out_0_d_bits_denied  (_picker_auto_in_0_d_bits_denied),
    .auto_out_0_d_bits_data    (_picker_auto_in_0_d_bits_data),
    .auto_out_0_d_bits_corrupt (_picker_auto_in_0_d_bits_corrupt)
  );
  TLFIFOFixer_4 fixer (
    .clock                   (auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock),
    .reset                   (auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset),
    .auto_in_a_ready         (auto_bus_xing_in_a_ready),
    .auto_in_a_valid         (auto_bus_xing_in_a_valid),
    .auto_in_a_bits_opcode   (auto_bus_xing_in_a_bits_opcode),
    .auto_in_a_bits_param    (auto_bus_xing_in_a_bits_param),
    .auto_in_a_bits_size     (auto_bus_xing_in_a_bits_size),
    .auto_in_a_bits_source   (auto_bus_xing_in_a_bits_source),
    .auto_in_a_bits_address  (auto_bus_xing_in_a_bits_address),
    .auto_in_a_bits_mask     (auto_bus_xing_in_a_bits_mask),
    .auto_in_a_bits_data     (auto_bus_xing_in_a_bits_data),
    .auto_in_a_bits_corrupt  (auto_bus_xing_in_a_bits_corrupt),
    .auto_in_d_ready         (auto_bus_xing_in_d_ready),
    .auto_in_d_valid         (auto_bus_xing_in_d_valid),
    .auto_in_d_bits_opcode   (auto_bus_xing_in_d_bits_opcode),
    .auto_in_d_bits_param    (auto_bus_xing_in_d_bits_param),
    .auto_in_d_bits_size     (auto_bus_xing_in_d_bits_size),
    .auto_in_d_bits_source   (auto_bus_xing_in_d_bits_source),
    .auto_in_d_bits_sink     (auto_bus_xing_in_d_bits_sink),
    .auto_in_d_bits_denied   (auto_bus_xing_in_d_bits_denied),
    .auto_in_d_bits_data     (auto_bus_xing_in_d_bits_data),
    .auto_in_d_bits_corrupt  (auto_bus_xing_in_d_bits_corrupt),
    .auto_out_a_ready        (_subsystem_mbus_xbar_auto_in_a_ready),
    .auto_out_a_valid        (_fixer_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_fixer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_fixer_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_fixer_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_fixer_auto_out_a_bits_source),
    .auto_out_a_bits_address (_fixer_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_fixer_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_fixer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_fixer_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_fixer_auto_out_d_ready),
    .auto_out_d_valid        (_subsystem_mbus_xbar_auto_in_d_valid),
    .auto_out_d_bits_opcode  (_subsystem_mbus_xbar_auto_in_d_bits_opcode),
    .auto_out_d_bits_param   (_subsystem_mbus_xbar_auto_in_d_bits_param),
    .auto_out_d_bits_size    (_subsystem_mbus_xbar_auto_in_d_bits_size),
    .auto_out_d_bits_source  (_subsystem_mbus_xbar_auto_in_d_bits_source),
    .auto_out_d_bits_sink    (_subsystem_mbus_xbar_auto_in_d_bits_sink),
    .auto_out_d_bits_denied  (_subsystem_mbus_xbar_auto_in_d_bits_denied),
    .auto_out_d_bits_data    (_subsystem_mbus_xbar_auto_in_d_bits_data),
    .auto_out_d_bits_corrupt (_subsystem_mbus_xbar_auto_in_d_bits_corrupt)
  );
  ProbePicker picker (
    .clock                     (auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock),
    .reset                     (auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset),
    .auto_in_1_a_ready         (_picker_auto_in_1_a_ready),
    .auto_in_1_a_valid         (_subsystem_mbus_xbar_auto_out_1_a_valid),
    .auto_in_1_a_bits_opcode   (_subsystem_mbus_xbar_auto_out_1_a_bits_opcode),
    .auto_in_1_a_bits_param    (_subsystem_mbus_xbar_auto_out_1_a_bits_param),
    .auto_in_1_a_bits_size     (_subsystem_mbus_xbar_auto_out_1_a_bits_size),
    .auto_in_1_a_bits_source   (_subsystem_mbus_xbar_auto_out_1_a_bits_source),
    .auto_in_1_a_bits_address  (_subsystem_mbus_xbar_auto_out_1_a_bits_address),
    .auto_in_1_a_bits_mask     (_subsystem_mbus_xbar_auto_out_1_a_bits_mask),
    .auto_in_1_a_bits_data     (_subsystem_mbus_xbar_auto_out_1_a_bits_data),
    .auto_in_1_a_bits_corrupt  (_subsystem_mbus_xbar_auto_out_1_a_bits_corrupt),
    .auto_in_1_d_ready         (_subsystem_mbus_xbar_auto_out_1_d_ready),
    .auto_in_1_d_valid         (_picker_auto_in_1_d_valid),
    .auto_in_1_d_bits_opcode   (_picker_auto_in_1_d_bits_opcode),
    .auto_in_1_d_bits_size     (_picker_auto_in_1_d_bits_size),
    .auto_in_1_d_bits_source   (_picker_auto_in_1_d_bits_source),
    .auto_in_1_d_bits_data     (_picker_auto_in_1_d_bits_data),
    .auto_in_0_a_ready         (_picker_auto_in_0_a_ready),
    .auto_in_0_a_valid         (_subsystem_mbus_xbar_auto_out_0_a_valid),
    .auto_in_0_a_bits_opcode   (_subsystem_mbus_xbar_auto_out_0_a_bits_opcode),
    .auto_in_0_a_bits_param    (_subsystem_mbus_xbar_auto_out_0_a_bits_param),
    .auto_in_0_a_bits_size     (_subsystem_mbus_xbar_auto_out_0_a_bits_size),
    .auto_in_0_a_bits_source   (_subsystem_mbus_xbar_auto_out_0_a_bits_source),
    .auto_in_0_a_bits_address  (_subsystem_mbus_xbar_auto_out_0_a_bits_address),
    .auto_in_0_a_bits_mask     (_subsystem_mbus_xbar_auto_out_0_a_bits_mask),
    .auto_in_0_a_bits_data     (_subsystem_mbus_xbar_auto_out_0_a_bits_data),
    .auto_in_0_a_bits_corrupt  (_subsystem_mbus_xbar_auto_out_0_a_bits_corrupt),
    .auto_in_0_d_ready         (_subsystem_mbus_xbar_auto_out_0_d_ready),
    .auto_in_0_d_valid         (_picker_auto_in_0_d_valid),
    .auto_in_0_d_bits_opcode   (_picker_auto_in_0_d_bits_opcode),
    .auto_in_0_d_bits_param    (_picker_auto_in_0_d_bits_param),
    .auto_in_0_d_bits_size     (_picker_auto_in_0_d_bits_size),
    .auto_in_0_d_bits_source   (_picker_auto_in_0_d_bits_source),
    .auto_in_0_d_bits_sink     (_picker_auto_in_0_d_bits_sink),
    .auto_in_0_d_bits_denied   (_picker_auto_in_0_d_bits_denied),
    .auto_in_0_d_bits_data     (_picker_auto_in_0_d_bits_data),
    .auto_in_0_d_bits_corrupt  (_picker_auto_in_0_d_bits_corrupt),
    .auto_out_1_a_ready        (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_ready),
    .auto_out_1_a_valid        (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_valid),
    .auto_out_1_a_bits_opcode  (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_opcode),
    .auto_out_1_a_bits_param   (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_param),
    .auto_out_1_a_bits_size    (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_size),
    .auto_out_1_a_bits_source  (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_source),
    .auto_out_1_a_bits_address (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_address),
    .auto_out_1_a_bits_mask    (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_mask),
    .auto_out_1_a_bits_data    (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_data),
    .auto_out_1_a_bits_corrupt (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_corrupt),
    .auto_out_1_d_ready        (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_ready),
    .auto_out_1_d_valid        (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_valid),
    .auto_out_1_d_bits_opcode  (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_bits_opcode),
    .auto_out_1_d_bits_size    (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_bits_size),
    .auto_out_1_d_bits_source  (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_bits_source),
    .auto_out_1_d_bits_data    (auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_bits_data),
    .auto_out_0_a_ready        (auto_coupler_to_bus_named_subsystem_obus_widget_out_a_ready),
    .auto_out_0_a_valid        (auto_coupler_to_bus_named_subsystem_obus_widget_out_a_valid),
    .auto_out_0_a_bits_opcode  (auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_opcode),
    .auto_out_0_a_bits_param   (auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_param),
    .auto_out_0_a_bits_size    (auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_size),
    .auto_out_0_a_bits_source  (auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_source),
    .auto_out_0_a_bits_address (auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_address),
    .auto_out_0_a_bits_mask    (auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_mask),
    .auto_out_0_a_bits_data    (auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_data),
    .auto_out_0_a_bits_corrupt (auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_corrupt),
    .auto_out_0_d_ready        (auto_coupler_to_bus_named_subsystem_obus_widget_out_d_ready),
    .auto_out_0_d_valid        (auto_coupler_to_bus_named_subsystem_obus_widget_out_d_valid),
    .auto_out_0_d_bits_opcode  (auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_opcode),
    .auto_out_0_d_bits_param   (auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_param),
    .auto_out_0_d_bits_size    (auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_size),
    .auto_out_0_d_bits_source  (auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_source),
    .auto_out_0_d_bits_sink    (auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_sink),
    .auto_out_0_d_bits_denied  (auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_denied),
    .auto_out_0_d_bits_data    (auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_data),
    .auto_out_0_d_bits_corrupt (auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_corrupt)
  );
  assign auto_subsystem_mbus_clock_groups_out_member_subsystem_obus_0_clock = auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_1_clock;
  assign auto_subsystem_mbus_clock_groups_out_member_subsystem_obus_0_reset = auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_1_reset;
endmodule

