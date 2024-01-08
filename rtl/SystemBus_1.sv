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

module SystemBus_1(
  input         auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_ready,
  output        auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_valid,
  output [2:0]  auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_opcode,
                auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_param,
                auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_size,
  output [3:0]  auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_source,
  output [32:0] auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_address,
  output [7:0]  auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_mask,
  output [63:0] auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_data,
  output        auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_corrupt,
                auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_ready,
  input         auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_valid,
  input  [2:0]  auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_param,
  input  [2:0]  auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_size,
  input  [3:0]  auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_source,
  input         auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_sink,
                auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_denied,
  input  [63:0] auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_data,
  input         auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_corrupt,
  output        auto_fixer_in_a_ready,
  input         auto_fixer_in_a_valid,
  input  [2:0]  auto_fixer_in_a_bits_opcode,
                auto_fixer_in_a_bits_param,
                auto_fixer_in_a_bits_size,
  input  [3:0]  auto_fixer_in_a_bits_source,
  input  [32:0] auto_fixer_in_a_bits_address,
  input  [7:0]  auto_fixer_in_a_bits_mask,
  input  [63:0] auto_fixer_in_a_bits_data,
  input         auto_fixer_in_a_bits_corrupt,
                auto_fixer_in_d_ready,
  output        auto_fixer_in_d_valid,
  output [2:0]  auto_fixer_in_d_bits_opcode,
  output [1:0]  auto_fixer_in_d_bits_param,
  output [2:0]  auto_fixer_in_d_bits_size,
  output [3:0]  auto_fixer_in_d_bits_source,
  output        auto_fixer_in_d_bits_sink,
                auto_fixer_in_d_bits_denied,
  output [63:0] auto_fixer_in_d_bits_data,
  output        auto_fixer_in_d_bits_corrupt,
                auto_fixedClockNode_out_clock,
                auto_fixedClockNode_out_reset,
  input         auto_subsystem_obus_clock_groups_in_member_subsystem_obus_0_clock,
                auto_subsystem_obus_clock_groups_in_member_subsystem_obus_0_reset
);

  wire _fixedClockNode_auto_out_0_clock;
  wire _fixedClockNode_auto_out_0_reset;
  FixedClockBroadcast_1 fixedClockNode (
    .auto_in_clock    (auto_subsystem_obus_clock_groups_in_member_subsystem_obus_0_clock),
    .auto_in_reset    (auto_subsystem_obus_clock_groups_in_member_subsystem_obus_0_reset),
    .auto_out_1_clock (auto_fixedClockNode_out_clock),
    .auto_out_1_reset (auto_fixedClockNode_out_reset),
    .auto_out_0_clock (_fixedClockNode_auto_out_0_clock),
    .auto_out_0_reset (_fixedClockNode_auto_out_0_reset)
  );
  TLFIFOFixer_5 fixer (
    .clock                   (_fixedClockNode_auto_out_0_clock),
    .reset                   (_fixedClockNode_auto_out_0_reset),
    .auto_in_a_ready         (auto_fixer_in_a_ready),
    .auto_in_a_valid         (auto_fixer_in_a_valid),
    .auto_in_a_bits_opcode   (auto_fixer_in_a_bits_opcode),
    .auto_in_a_bits_param    (auto_fixer_in_a_bits_param),
    .auto_in_a_bits_size     (auto_fixer_in_a_bits_size),
    .auto_in_a_bits_source   (auto_fixer_in_a_bits_source),
    .auto_in_a_bits_address  (auto_fixer_in_a_bits_address),
    .auto_in_a_bits_mask     (auto_fixer_in_a_bits_mask),
    .auto_in_a_bits_data     (auto_fixer_in_a_bits_data),
    .auto_in_a_bits_corrupt  (auto_fixer_in_a_bits_corrupt),
    .auto_in_d_ready         (auto_fixer_in_d_ready),
    .auto_in_d_valid         (auto_fixer_in_d_valid),
    .auto_in_d_bits_opcode   (auto_fixer_in_d_bits_opcode),
    .auto_in_d_bits_param    (auto_fixer_in_d_bits_param),
    .auto_in_d_bits_size     (auto_fixer_in_d_bits_size),
    .auto_in_d_bits_source   (auto_fixer_in_d_bits_source),
    .auto_in_d_bits_sink     (auto_fixer_in_d_bits_sink),
    .auto_in_d_bits_denied   (auto_fixer_in_d_bits_denied),
    .auto_in_d_bits_data     (auto_fixer_in_d_bits_data),
    .auto_in_d_bits_corrupt  (auto_fixer_in_d_bits_corrupt),
    .auto_out_a_ready        (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_ready),
    .auto_out_a_valid        (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_valid),
    .auto_out_a_bits_opcode  (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_opcode),
    .auto_out_a_bits_param   (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_param),
    .auto_out_a_bits_size    (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_size),
    .auto_out_a_bits_source  (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_source),
    .auto_out_a_bits_address (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_address),
    .auto_out_a_bits_mask    (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_mask),
    .auto_out_a_bits_data    (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_data),
    .auto_out_a_bits_corrupt (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_corrupt),
    .auto_out_d_ready        (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_ready),
    .auto_out_d_valid        (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_valid),
    .auto_out_d_bits_opcode  (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_opcode),
    .auto_out_d_bits_param   (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_param),
    .auto_out_d_bits_size    (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_size),
    .auto_out_d_bits_source  (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_source),
    .auto_out_d_bits_sink    (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_sink),
    .auto_out_d_bits_denied  (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_denied),
    .auto_out_d_bits_data    (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_data),
    .auto_out_d_bits_corrupt (auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_corrupt)
  );
endmodule

