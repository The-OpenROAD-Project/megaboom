// Standard header to adapt well known macros for prints and assertions.

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

module SystemBus(
  output        auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_ready,
  input         auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_valid,
  input  [2:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_opcode,
                auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_param,
  input  [3:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_size,
  input  [4:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_source,
  input  [32:0] auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_address,
  input  [7:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_mask,
  input  [63:0] auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_data,
  input         auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_corrupt,
                auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_ready,
  output        auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_valid,
  output [1:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_param,
  output [32:0] auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_address,
  output        auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_ready,
  input         auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_valid,
  input  [2:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_opcode,
                auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_param,
  input  [3:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_size,
  input  [4:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_source,
  input  [32:0] auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_address,
  input  [63:0] auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_data,
  input         auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_corrupt,
                auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_ready,
  output        auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_valid,
  output [2:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_opcode,
  output [1:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_param,
  output [3:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_size,
  output [4:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_source,
  output [1:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_sink,
  output        auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_denied,
  output [63:0] auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_data,
  output        auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_corrupt,
  input         auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_valid,
  input  [1:0]  auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_bits_sink,
  input         auto_coupler_to_bus_named_subsystem_l2_widget_out_a_ready,
  output        auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid,
  output [2:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode,
                auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param,
                auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size,
  output [5:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source,
  output [32:0] auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address,
  output [7:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask,
  output [63:0] auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data,
  output        auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt,
                auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready,
  input         auto_coupler_to_bus_named_subsystem_l2_widget_out_b_valid,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_param,
  input  [32:0] auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_address,
  input         auto_coupler_to_bus_named_subsystem_l2_widget_out_c_ready,
  output        auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid,
  output [2:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode,
                auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param,
                auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size,
  output [5:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source,
  output [32:0] auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address,
  output [63:0] auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data,
  output        auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt,
                auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready,
  input         auto_coupler_to_bus_named_subsystem_l2_widget_out_d_valid,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_param,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_size,
  input  [5:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_source,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_sink,
  input         auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_denied,
  input  [63:0] auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_data,
  input         auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_corrupt,
  output        auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid,
  output [1:0]  auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink,
  output        auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid,
  input  [2:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode,
                auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param,
  input  [3:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size,
                auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source,
  input  [32:0] auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address,
  input  [7:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask,
  input  [63:0] auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data,
  input         auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt,
                auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready,
  output        auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid,
  output [2:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode,
  output [1:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param,
  output [3:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size,
                auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source,
  output [1:0]  auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink,
  output        auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied,
  output [63:0] auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data,
  output        auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt,
  input         auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready,
  output        auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid,
  output [2:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode,
                auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param,
  output [3:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size,
  output [5:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source,
  output [27:0] auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address,
  output [7:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask,
  output [63:0] auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data,
  output        auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt,
                auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready,
  input         auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param,
  input  [3:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size,
  input  [5:0]  auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source,
  input         auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink,
                auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied,
  input  [63:0] auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data,
  input         auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt,
  output        auto_fixedClockNode_out_1_clock,
                auto_fixedClockNode_out_1_reset,
  input         auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock,
                auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset,
                auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock,
                auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset,
  output        auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_clock,
                auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_reset
);

  wire        _fixer_auto_out_1_a_valid;
  wire [2:0]  _fixer_auto_out_1_a_bits_opcode;
  wire [2:0]  _fixer_auto_out_1_a_bits_param;
  wire [3:0]  _fixer_auto_out_1_a_bits_size;
  wire [4:0]  _fixer_auto_out_1_a_bits_source;
  wire [32:0] _fixer_auto_out_1_a_bits_address;
  wire [7:0]  _fixer_auto_out_1_a_bits_mask;
  wire [63:0] _fixer_auto_out_1_a_bits_data;
  wire        _fixer_auto_out_1_a_bits_corrupt;
  wire        _fixer_auto_out_1_b_ready;
  wire        _fixer_auto_out_1_c_valid;
  wire [2:0]  _fixer_auto_out_1_c_bits_opcode;
  wire [2:0]  _fixer_auto_out_1_c_bits_param;
  wire [3:0]  _fixer_auto_out_1_c_bits_size;
  wire [4:0]  _fixer_auto_out_1_c_bits_source;
  wire [32:0] _fixer_auto_out_1_c_bits_address;
  wire [63:0] _fixer_auto_out_1_c_bits_data;
  wire        _fixer_auto_out_1_c_bits_corrupt;
  wire        _fixer_auto_out_1_d_ready;
  wire        _fixer_auto_out_1_e_valid;
  wire [1:0]  _fixer_auto_out_1_e_bits_sink;
  wire        _fixer_auto_out_0_a_valid;
  wire [2:0]  _fixer_auto_out_0_a_bits_opcode;
  wire [2:0]  _fixer_auto_out_0_a_bits_param;
  wire [3:0]  _fixer_auto_out_0_a_bits_size;
  wire [3:0]  _fixer_auto_out_0_a_bits_source;
  wire [32:0] _fixer_auto_out_0_a_bits_address;
  wire [7:0]  _fixer_auto_out_0_a_bits_mask;
  wire [63:0] _fixer_auto_out_0_a_bits_data;
  wire        _fixer_auto_out_0_a_bits_corrupt;
  wire        _fixer_auto_out_0_d_ready;
  wire        _system_bus_xbar_auto_in_1_a_ready;
  wire        _system_bus_xbar_auto_in_1_b_valid;
  wire [1:0]  _system_bus_xbar_auto_in_1_b_bits_param;
  wire [32:0] _system_bus_xbar_auto_in_1_b_bits_address;
  wire        _system_bus_xbar_auto_in_1_c_ready;
  wire        _system_bus_xbar_auto_in_1_d_valid;
  wire [2:0]  _system_bus_xbar_auto_in_1_d_bits_opcode;
  wire [1:0]  _system_bus_xbar_auto_in_1_d_bits_param;
  wire [3:0]  _system_bus_xbar_auto_in_1_d_bits_size;
  wire [4:0]  _system_bus_xbar_auto_in_1_d_bits_source;
  wire [1:0]  _system_bus_xbar_auto_in_1_d_bits_sink;
  wire        _system_bus_xbar_auto_in_1_d_bits_denied;
  wire [63:0] _system_bus_xbar_auto_in_1_d_bits_data;
  wire        _system_bus_xbar_auto_in_1_d_bits_corrupt;
  wire        _system_bus_xbar_auto_in_0_a_ready;
  wire        _system_bus_xbar_auto_in_0_d_valid;
  wire [2:0]  _system_bus_xbar_auto_in_0_d_bits_opcode;
  wire [1:0]  _system_bus_xbar_auto_in_0_d_bits_param;
  wire [3:0]  _system_bus_xbar_auto_in_0_d_bits_size;
  wire [3:0]  _system_bus_xbar_auto_in_0_d_bits_source;
  wire [1:0]  _system_bus_xbar_auto_in_0_d_bits_sink;
  wire        _system_bus_xbar_auto_in_0_d_bits_denied;
  wire [63:0] _system_bus_xbar_auto_in_0_d_bits_data;
  wire        _system_bus_xbar_auto_in_0_d_bits_corrupt;
  wire        _fixedClockNode_auto_out_0_clock;
  wire        _fixedClockNode_auto_out_0_reset;
  FixedClockBroadcast fixedClockNode (
    .auto_in_clock    (auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock),
    .auto_in_reset    (auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset),
    .auto_out_2_clock (auto_fixedClockNode_out_1_clock),
    .auto_out_2_reset (auto_fixedClockNode_out_1_reset),
    .auto_out_0_clock (_fixedClockNode_auto_out_0_clock),
    .auto_out_0_reset (_fixedClockNode_auto_out_0_reset)
  );
  TLXbar system_bus_xbar (
    .clock                     (_fixedClockNode_auto_out_0_clock),
    .reset                     (_fixedClockNode_auto_out_0_reset),
    .auto_in_1_a_ready         (_system_bus_xbar_auto_in_1_a_ready),
    .auto_in_1_a_valid         (_fixer_auto_out_1_a_valid),
    .auto_in_1_a_bits_opcode   (_fixer_auto_out_1_a_bits_opcode),
    .auto_in_1_a_bits_param    (_fixer_auto_out_1_a_bits_param),
    .auto_in_1_a_bits_size     (_fixer_auto_out_1_a_bits_size),
    .auto_in_1_a_bits_source   (_fixer_auto_out_1_a_bits_source),
    .auto_in_1_a_bits_address  (_fixer_auto_out_1_a_bits_address),
    .auto_in_1_a_bits_mask     (_fixer_auto_out_1_a_bits_mask),
    .auto_in_1_a_bits_data     (_fixer_auto_out_1_a_bits_data),
    .auto_in_1_a_bits_corrupt  (_fixer_auto_out_1_a_bits_corrupt),
    .auto_in_1_b_ready         (_fixer_auto_out_1_b_ready),
    .auto_in_1_b_valid         (_system_bus_xbar_auto_in_1_b_valid),
    .auto_in_1_b_bits_param    (_system_bus_xbar_auto_in_1_b_bits_param),
    .auto_in_1_b_bits_address  (_system_bus_xbar_auto_in_1_b_bits_address),
    .auto_in_1_c_ready         (_system_bus_xbar_auto_in_1_c_ready),
    .auto_in_1_c_valid         (_fixer_auto_out_1_c_valid),
    .auto_in_1_c_bits_opcode   (_fixer_auto_out_1_c_bits_opcode),
    .auto_in_1_c_bits_param    (_fixer_auto_out_1_c_bits_param),
    .auto_in_1_c_bits_size     (_fixer_auto_out_1_c_bits_size),
    .auto_in_1_c_bits_source   (_fixer_auto_out_1_c_bits_source),
    .auto_in_1_c_bits_address  (_fixer_auto_out_1_c_bits_address),
    .auto_in_1_c_bits_data     (_fixer_auto_out_1_c_bits_data),
    .auto_in_1_c_bits_corrupt  (_fixer_auto_out_1_c_bits_corrupt),
    .auto_in_1_d_ready         (_fixer_auto_out_1_d_ready),
    .auto_in_1_d_valid         (_system_bus_xbar_auto_in_1_d_valid),
    .auto_in_1_d_bits_opcode   (_system_bus_xbar_auto_in_1_d_bits_opcode),
    .auto_in_1_d_bits_param    (_system_bus_xbar_auto_in_1_d_bits_param),
    .auto_in_1_d_bits_size     (_system_bus_xbar_auto_in_1_d_bits_size),
    .auto_in_1_d_bits_source   (_system_bus_xbar_auto_in_1_d_bits_source),
    .auto_in_1_d_bits_sink     (_system_bus_xbar_auto_in_1_d_bits_sink),
    .auto_in_1_d_bits_denied   (_system_bus_xbar_auto_in_1_d_bits_denied),
    .auto_in_1_d_bits_data     (_system_bus_xbar_auto_in_1_d_bits_data),
    .auto_in_1_d_bits_corrupt  (_system_bus_xbar_auto_in_1_d_bits_corrupt),
    .auto_in_1_e_valid         (_fixer_auto_out_1_e_valid),
    .auto_in_1_e_bits_sink     (_fixer_auto_out_1_e_bits_sink),
    .auto_in_0_a_ready         (_system_bus_xbar_auto_in_0_a_ready),
    .auto_in_0_a_valid         (_fixer_auto_out_0_a_valid),
    .auto_in_0_a_bits_opcode   (_fixer_auto_out_0_a_bits_opcode),
    .auto_in_0_a_bits_param    (_fixer_auto_out_0_a_bits_param),
    .auto_in_0_a_bits_size     (_fixer_auto_out_0_a_bits_size),
    .auto_in_0_a_bits_source   (_fixer_auto_out_0_a_bits_source),
    .auto_in_0_a_bits_address  (_fixer_auto_out_0_a_bits_address),
    .auto_in_0_a_bits_mask     (_fixer_auto_out_0_a_bits_mask),
    .auto_in_0_a_bits_data     (_fixer_auto_out_0_a_bits_data),
    .auto_in_0_a_bits_corrupt  (_fixer_auto_out_0_a_bits_corrupt),
    .auto_in_0_d_ready         (_fixer_auto_out_0_d_ready),
    .auto_in_0_d_valid         (_system_bus_xbar_auto_in_0_d_valid),
    .auto_in_0_d_bits_opcode   (_system_bus_xbar_auto_in_0_d_bits_opcode),
    .auto_in_0_d_bits_param    (_system_bus_xbar_auto_in_0_d_bits_param),
    .auto_in_0_d_bits_size     (_system_bus_xbar_auto_in_0_d_bits_size),
    .auto_in_0_d_bits_source   (_system_bus_xbar_auto_in_0_d_bits_source),
    .auto_in_0_d_bits_sink     (_system_bus_xbar_auto_in_0_d_bits_sink),
    .auto_in_0_d_bits_denied   (_system_bus_xbar_auto_in_0_d_bits_denied),
    .auto_in_0_d_bits_data     (_system_bus_xbar_auto_in_0_d_bits_data),
    .auto_in_0_d_bits_corrupt  (_system_bus_xbar_auto_in_0_d_bits_corrupt),
    .auto_out_1_a_ready        (auto_coupler_to_bus_named_subsystem_l2_widget_out_a_ready),
    .auto_out_1_a_valid        (auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid),
    .auto_out_1_a_bits_opcode  (auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode),
    .auto_out_1_a_bits_param   (auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param),
    .auto_out_1_a_bits_size    (auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size),
    .auto_out_1_a_bits_source  (auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source),
    .auto_out_1_a_bits_address (auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address),
    .auto_out_1_a_bits_mask    (auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask),
    .auto_out_1_a_bits_data    (auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data),
    .auto_out_1_a_bits_corrupt (auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt),
    .auto_out_1_b_ready        (auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready),
    .auto_out_1_b_valid        (auto_coupler_to_bus_named_subsystem_l2_widget_out_b_valid),
    .auto_out_1_b_bits_param   (auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_param),
    .auto_out_1_b_bits_address (auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_address),
    .auto_out_1_c_ready        (auto_coupler_to_bus_named_subsystem_l2_widget_out_c_ready),
    .auto_out_1_c_valid        (auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid),
    .auto_out_1_c_bits_opcode  (auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode),
    .auto_out_1_c_bits_param   (auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param),
    .auto_out_1_c_bits_size    (auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size),
    .auto_out_1_c_bits_source  (auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source),
    .auto_out_1_c_bits_address (auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address),
    .auto_out_1_c_bits_data    (auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data),
    .auto_out_1_c_bits_corrupt (auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt),
    .auto_out_1_d_ready        (auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready),
    .auto_out_1_d_valid        (auto_coupler_to_bus_named_subsystem_l2_widget_out_d_valid),
    .auto_out_1_d_bits_opcode  (auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_opcode),
    .auto_out_1_d_bits_param   (auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_param),
    .auto_out_1_d_bits_size    (auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_size),
    .auto_out_1_d_bits_source  (auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_source),
    .auto_out_1_d_bits_sink    (auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_sink),
    .auto_out_1_d_bits_denied  (auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_denied),
    .auto_out_1_d_bits_data    (auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_data),
    .auto_out_1_d_bits_corrupt (auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_corrupt),
    .auto_out_1_e_valid        (auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid),
    .auto_out_1_e_bits_sink    (auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink),
    .auto_out_0_a_ready        (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready),
    .auto_out_0_a_valid        (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid),
    .auto_out_0_a_bits_opcode  (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode),
    .auto_out_0_a_bits_param   (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param),
    .auto_out_0_a_bits_size    (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size),
    .auto_out_0_a_bits_source  (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source),
    .auto_out_0_a_bits_address (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address),
    .auto_out_0_a_bits_mask    (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask),
    .auto_out_0_a_bits_data    (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data),
    .auto_out_0_a_bits_corrupt (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt),
    .auto_out_0_d_ready        (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready),
    .auto_out_0_d_valid        (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid),
    .auto_out_0_d_bits_opcode  (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode),
    .auto_out_0_d_bits_param   (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param),
    .auto_out_0_d_bits_size    (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size),
    .auto_out_0_d_bits_source  (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source),
    .auto_out_0_d_bits_sink    (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink),
    .auto_out_0_d_bits_denied  (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied),
    .auto_out_0_d_bits_data    (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data),
    .auto_out_0_d_bits_corrupt (auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt)
  );
  TLFIFOFixer fixer (
    .clock                     (_fixedClockNode_auto_out_0_clock),
    .reset                     (_fixedClockNode_auto_out_0_reset),
    .auto_in_1_a_ready         (auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_ready),
    .auto_in_1_a_valid         (auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_valid),
    .auto_in_1_a_bits_opcode   (auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_opcode),
    .auto_in_1_a_bits_param    (auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_param),
    .auto_in_1_a_bits_size     (auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_size),
    .auto_in_1_a_bits_source   (auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_source),
    .auto_in_1_a_bits_address  (auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_address),
    .auto_in_1_a_bits_mask     (auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_mask),
    .auto_in_1_a_bits_data     (auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_data),
    .auto_in_1_a_bits_corrupt  (auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_corrupt),
    .auto_in_1_b_ready         (auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_ready),
    .auto_in_1_b_valid         (auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_valid),
    .auto_in_1_b_bits_param    (auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_param),
    .auto_in_1_b_bits_address  (auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_address),
    .auto_in_1_c_ready         (auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_ready),
    .auto_in_1_c_valid         (auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_valid),
    .auto_in_1_c_bits_opcode   (auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_opcode),
    .auto_in_1_c_bits_param    (auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_param),
    .auto_in_1_c_bits_size     (auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_size),
    .auto_in_1_c_bits_source   (auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_source),
    .auto_in_1_c_bits_address  (auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_address),
    .auto_in_1_c_bits_data     (auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_data),
    .auto_in_1_c_bits_corrupt  (auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_corrupt),
    .auto_in_1_d_ready         (auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_ready),
    .auto_in_1_d_valid         (auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_valid),
    .auto_in_1_d_bits_opcode   (auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_opcode),
    .auto_in_1_d_bits_param    (auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_param),
    .auto_in_1_d_bits_size     (auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_size),
    .auto_in_1_d_bits_source   (auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_source),
    .auto_in_1_d_bits_sink     (auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_sink),
    .auto_in_1_d_bits_denied   (auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_denied),
    .auto_in_1_d_bits_data     (auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_data),
    .auto_in_1_d_bits_corrupt  (auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_corrupt),
    .auto_in_1_e_valid         (auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_valid),
    .auto_in_1_e_bits_sink     (auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_bits_sink),
    .auto_in_0_a_ready         (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready),
    .auto_in_0_a_valid         (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid),
    .auto_in_0_a_bits_opcode   (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode),
    .auto_in_0_a_bits_param    (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param),
    .auto_in_0_a_bits_size     (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size),
    .auto_in_0_a_bits_source   (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source),
    .auto_in_0_a_bits_address  (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address),
    .auto_in_0_a_bits_mask     (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask),
    .auto_in_0_a_bits_data     (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data),
    .auto_in_0_a_bits_corrupt  (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt),
    .auto_in_0_d_ready         (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready),
    .auto_in_0_d_valid         (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid),
    .auto_in_0_d_bits_opcode   (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode),
    .auto_in_0_d_bits_param    (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param),
    .auto_in_0_d_bits_size     (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size),
    .auto_in_0_d_bits_source   (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source),
    .auto_in_0_d_bits_sink     (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink),
    .auto_in_0_d_bits_denied   (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied),
    .auto_in_0_d_bits_data     (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data),
    .auto_in_0_d_bits_corrupt  (auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt),
    .auto_out_1_a_ready        (_system_bus_xbar_auto_in_1_a_ready),
    .auto_out_1_a_valid        (_fixer_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode  (_fixer_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param   (_fixer_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size    (_fixer_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source  (_fixer_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address (_fixer_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask    (_fixer_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data    (_fixer_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt (_fixer_auto_out_1_a_bits_corrupt),
    .auto_out_1_b_ready        (_fixer_auto_out_1_b_ready),
    .auto_out_1_b_valid        (_system_bus_xbar_auto_in_1_b_valid),
    .auto_out_1_b_bits_param   (_system_bus_xbar_auto_in_1_b_bits_param),
    .auto_out_1_b_bits_address (_system_bus_xbar_auto_in_1_b_bits_address),
    .auto_out_1_c_ready        (_system_bus_xbar_auto_in_1_c_ready),
    .auto_out_1_c_valid        (_fixer_auto_out_1_c_valid),
    .auto_out_1_c_bits_opcode  (_fixer_auto_out_1_c_bits_opcode),
    .auto_out_1_c_bits_param   (_fixer_auto_out_1_c_bits_param),
    .auto_out_1_c_bits_size    (_fixer_auto_out_1_c_bits_size),
    .auto_out_1_c_bits_source  (_fixer_auto_out_1_c_bits_source),
    .auto_out_1_c_bits_address (_fixer_auto_out_1_c_bits_address),
    .auto_out_1_c_bits_data    (_fixer_auto_out_1_c_bits_data),
    .auto_out_1_c_bits_corrupt (_fixer_auto_out_1_c_bits_corrupt),
    .auto_out_1_d_ready        (_fixer_auto_out_1_d_ready),
    .auto_out_1_d_valid        (_system_bus_xbar_auto_in_1_d_valid),
    .auto_out_1_d_bits_opcode  (_system_bus_xbar_auto_in_1_d_bits_opcode),
    .auto_out_1_d_bits_param   (_system_bus_xbar_auto_in_1_d_bits_param),
    .auto_out_1_d_bits_size    (_system_bus_xbar_auto_in_1_d_bits_size),
    .auto_out_1_d_bits_source  (_system_bus_xbar_auto_in_1_d_bits_source),
    .auto_out_1_d_bits_sink    (_system_bus_xbar_auto_in_1_d_bits_sink),
    .auto_out_1_d_bits_denied  (_system_bus_xbar_auto_in_1_d_bits_denied),
    .auto_out_1_d_bits_data    (_system_bus_xbar_auto_in_1_d_bits_data),
    .auto_out_1_d_bits_corrupt (_system_bus_xbar_auto_in_1_d_bits_corrupt),
    .auto_out_1_e_valid        (_fixer_auto_out_1_e_valid),
    .auto_out_1_e_bits_sink    (_fixer_auto_out_1_e_bits_sink),
    .auto_out_0_a_ready        (_system_bus_xbar_auto_in_0_a_ready),
    .auto_out_0_a_valid        (_fixer_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode  (_fixer_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param   (_fixer_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size    (_fixer_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source  (_fixer_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address (_fixer_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask    (_fixer_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data    (_fixer_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt (_fixer_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready        (_fixer_auto_out_0_d_ready),
    .auto_out_0_d_valid        (_system_bus_xbar_auto_in_0_d_valid),
    .auto_out_0_d_bits_opcode  (_system_bus_xbar_auto_in_0_d_bits_opcode),
    .auto_out_0_d_bits_param   (_system_bus_xbar_auto_in_0_d_bits_param),
    .auto_out_0_d_bits_size    (_system_bus_xbar_auto_in_0_d_bits_size),
    .auto_out_0_d_bits_source  (_system_bus_xbar_auto_in_0_d_bits_source),
    .auto_out_0_d_bits_sink    (_system_bus_xbar_auto_in_0_d_bits_sink),
    .auto_out_0_d_bits_denied  (_system_bus_xbar_auto_in_0_d_bits_denied),
    .auto_out_0_d_bits_data    (_system_bus_xbar_auto_in_0_d_bits_data),
    .auto_out_0_d_bits_corrupt (_system_bus_xbar_auto_in_0_d_bits_corrupt)
  );
  assign auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_clock = auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock;
  assign auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_reset = auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset;
endmodule

