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

module CoherenceManagerWrapper(
  input         auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready,
  output        auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid,
  output [2:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode,
                auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param,
                auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size,
  output [7:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source,
  output [32:0] auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address,
  output [7:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask,
  output [63:0] auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data,
  output        auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready,
  input         auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_param,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size,
  input  [7:0]  auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source,
  input         auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_sink,
                auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied,
  input  [63:0] auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data,
  input         auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt,
  output        auto_coherent_jbar_in_a_ready,
  input         auto_coherent_jbar_in_a_valid,
  input  [2:0]  auto_coherent_jbar_in_a_bits_opcode,
                auto_coherent_jbar_in_a_bits_param,
                auto_coherent_jbar_in_a_bits_size,
  input  [5:0]  auto_coherent_jbar_in_a_bits_source,
  input  [32:0] auto_coherent_jbar_in_a_bits_address,
  input  [7:0]  auto_coherent_jbar_in_a_bits_mask,
  input  [63:0] auto_coherent_jbar_in_a_bits_data,
  input         auto_coherent_jbar_in_a_bits_corrupt,
                auto_coherent_jbar_in_b_ready,
  output        auto_coherent_jbar_in_b_valid,
  output [1:0]  auto_coherent_jbar_in_b_bits_param,
  output [32:0] auto_coherent_jbar_in_b_bits_address,
  output        auto_coherent_jbar_in_c_ready,
  input         auto_coherent_jbar_in_c_valid,
  input  [2:0]  auto_coherent_jbar_in_c_bits_opcode,
                auto_coherent_jbar_in_c_bits_param,
                auto_coherent_jbar_in_c_bits_size,
  input  [5:0]  auto_coherent_jbar_in_c_bits_source,
  input  [32:0] auto_coherent_jbar_in_c_bits_address,
  input  [63:0] auto_coherent_jbar_in_c_bits_data,
  input         auto_coherent_jbar_in_c_bits_corrupt,
                auto_coherent_jbar_in_d_ready,
  output        auto_coherent_jbar_in_d_valid,
  output [2:0]  auto_coherent_jbar_in_d_bits_opcode,
  output [1:0]  auto_coherent_jbar_in_d_bits_param,
  output [2:0]  auto_coherent_jbar_in_d_bits_size,
  output [5:0]  auto_coherent_jbar_in_d_bits_source,
  output [1:0]  auto_coherent_jbar_in_d_bits_sink,
  output        auto_coherent_jbar_in_d_bits_denied,
  output [63:0] auto_coherent_jbar_in_d_bits_data,
  output        auto_coherent_jbar_in_d_bits_corrupt,
  input         auto_coherent_jbar_in_e_valid,
  input  [1:0]  auto_coherent_jbar_in_e_bits_sink,
  input         auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock,
                auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset
);

  wire        _binder_auto_in_a_ready;
  wire        _binder_auto_in_d_valid;
  wire [2:0]  _binder_auto_in_d_bits_opcode;
  wire [1:0]  _binder_auto_in_d_bits_param;
  wire [2:0]  _binder_auto_in_d_bits_size;
  wire [7:0]  _binder_auto_in_d_bits_source;
  wire        _binder_auto_in_d_bits_denied;
  wire [63:0] _binder_auto_in_d_bits_data;
  wire        _binder_auto_in_d_bits_corrupt;
  wire        _broadcast_1_auto_out_a_valid;
  wire [2:0]  _broadcast_1_auto_out_a_bits_opcode;
  wire [2:0]  _broadcast_1_auto_out_a_bits_param;
  wire [2:0]  _broadcast_1_auto_out_a_bits_size;
  wire [7:0]  _broadcast_1_auto_out_a_bits_source;
  wire [32:0] _broadcast_1_auto_out_a_bits_address;
  wire [7:0]  _broadcast_1_auto_out_a_bits_mask;
  wire [63:0] _broadcast_1_auto_out_a_bits_data;
  wire        _broadcast_1_auto_out_d_ready;
  TLBroadcast broadcast_1 (
    .clock                   (auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock),
    .reset                   (auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset),
    .auto_in_a_ready         (auto_coherent_jbar_in_a_ready),
    .auto_in_a_valid         (auto_coherent_jbar_in_a_valid),
    .auto_in_a_bits_opcode   (auto_coherent_jbar_in_a_bits_opcode),
    .auto_in_a_bits_param    (auto_coherent_jbar_in_a_bits_param),
    .auto_in_a_bits_size     (auto_coherent_jbar_in_a_bits_size),
    .auto_in_a_bits_source   (auto_coherent_jbar_in_a_bits_source),
    .auto_in_a_bits_address  (auto_coherent_jbar_in_a_bits_address),
    .auto_in_a_bits_mask     (auto_coherent_jbar_in_a_bits_mask),
    .auto_in_a_bits_data     (auto_coherent_jbar_in_a_bits_data),
    .auto_in_a_bits_corrupt  (auto_coherent_jbar_in_a_bits_corrupt),
    .auto_in_b_ready         (auto_coherent_jbar_in_b_ready),
    .auto_in_b_valid         (auto_coherent_jbar_in_b_valid),
    .auto_in_b_bits_param    (auto_coherent_jbar_in_b_bits_param),
    .auto_in_b_bits_address  (auto_coherent_jbar_in_b_bits_address),
    .auto_in_c_ready         (auto_coherent_jbar_in_c_ready),
    .auto_in_c_valid         (auto_coherent_jbar_in_c_valid),
    .auto_in_c_bits_opcode   (auto_coherent_jbar_in_c_bits_opcode),
    .auto_in_c_bits_param    (auto_coherent_jbar_in_c_bits_param),
    .auto_in_c_bits_size     (auto_coherent_jbar_in_c_bits_size),
    .auto_in_c_bits_source   (auto_coherent_jbar_in_c_bits_source),
    .auto_in_c_bits_address  (auto_coherent_jbar_in_c_bits_address),
    .auto_in_c_bits_data     (auto_coherent_jbar_in_c_bits_data),
    .auto_in_c_bits_corrupt  (auto_coherent_jbar_in_c_bits_corrupt),
    .auto_in_d_ready         (auto_coherent_jbar_in_d_ready),
    .auto_in_d_valid         (auto_coherent_jbar_in_d_valid),
    .auto_in_d_bits_opcode   (auto_coherent_jbar_in_d_bits_opcode),
    .auto_in_d_bits_param    (auto_coherent_jbar_in_d_bits_param),
    .auto_in_d_bits_size     (auto_coherent_jbar_in_d_bits_size),
    .auto_in_d_bits_source   (auto_coherent_jbar_in_d_bits_source),
    .auto_in_d_bits_sink     (auto_coherent_jbar_in_d_bits_sink),
    .auto_in_d_bits_denied   (auto_coherent_jbar_in_d_bits_denied),
    .auto_in_d_bits_data     (auto_coherent_jbar_in_d_bits_data),
    .auto_in_d_bits_corrupt  (auto_coherent_jbar_in_d_bits_corrupt),
    .auto_in_e_valid         (auto_coherent_jbar_in_e_valid),
    .auto_in_e_bits_sink     (auto_coherent_jbar_in_e_bits_sink),
    .auto_out_a_ready        (_binder_auto_in_a_ready),
    .auto_out_a_valid        (_broadcast_1_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_broadcast_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_broadcast_1_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_broadcast_1_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_broadcast_1_auto_out_a_bits_source),
    .auto_out_a_bits_address (_broadcast_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_broadcast_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_broadcast_1_auto_out_a_bits_data),
    .auto_out_d_ready        (_broadcast_1_auto_out_d_ready),
    .auto_out_d_valid        (_binder_auto_in_d_valid),
    .auto_out_d_bits_opcode  (_binder_auto_in_d_bits_opcode),
    .auto_out_d_bits_param   (_binder_auto_in_d_bits_param),
    .auto_out_d_bits_size    (_binder_auto_in_d_bits_size),
    .auto_out_d_bits_source  (_binder_auto_in_d_bits_source),
    .auto_out_d_bits_denied  (_binder_auto_in_d_bits_denied),
    .auto_out_d_bits_data    (_binder_auto_in_d_bits_data),
    .auto_out_d_bits_corrupt (_binder_auto_in_d_bits_corrupt)
  );
  BankBinder binder (
    .clock                   (auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock),
    .reset                   (auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset),
    .auto_in_a_ready         (_binder_auto_in_a_ready),
    .auto_in_a_valid         (_broadcast_1_auto_out_a_valid),
    .auto_in_a_bits_opcode   (_broadcast_1_auto_out_a_bits_opcode),
    .auto_in_a_bits_param    (_broadcast_1_auto_out_a_bits_param),
    .auto_in_a_bits_size     (_broadcast_1_auto_out_a_bits_size),
    .auto_in_a_bits_source   (_broadcast_1_auto_out_a_bits_source),
    .auto_in_a_bits_address  (_broadcast_1_auto_out_a_bits_address),
    .auto_in_a_bits_mask     (_broadcast_1_auto_out_a_bits_mask),
    .auto_in_a_bits_data     (_broadcast_1_auto_out_a_bits_data),
    .auto_in_d_ready         (_broadcast_1_auto_out_d_ready),
    .auto_in_d_valid         (_binder_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_binder_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_binder_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_binder_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_binder_auto_in_d_bits_source),
    .auto_in_d_bits_denied   (_binder_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_binder_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_binder_auto_in_d_bits_corrupt),
    .auto_out_a_ready        (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready),
    .auto_out_a_valid        (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid),
    .auto_out_a_bits_opcode  (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode),
    .auto_out_a_bits_param   (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param),
    .auto_out_a_bits_size    (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size),
    .auto_out_a_bits_source  (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source),
    .auto_out_a_bits_address (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address),
    .auto_out_a_bits_mask    (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask),
    .auto_out_a_bits_data    (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data),
    .auto_out_d_ready        (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready),
    .auto_out_d_valid        (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid),
    .auto_out_d_bits_opcode  (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode),
    .auto_out_d_bits_param   (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_param),
    .auto_out_d_bits_size    (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size),
    .auto_out_d_bits_source  (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source),
    .auto_out_d_bits_sink    (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_sink),
    .auto_out_d_bits_denied  (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied),
    .auto_out_d_bits_data    (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data),
    .auto_out_d_bits_corrupt (auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt)
  );
endmodule

