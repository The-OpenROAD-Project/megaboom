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

module TLBusBypass(
  input         clock,
                reset,
                auto_node_out_out_a_ready,
  output        auto_node_out_out_a_valid,
  output [2:0]  auto_node_out_out_a_bits_opcode,
  output [8:0]  auto_node_out_out_a_bits_address,
  output [31:0] auto_node_out_out_a_bits_data,
  output        auto_node_out_out_d_ready,
  input         auto_node_out_out_d_valid,
  input  [2:0]  auto_node_out_out_d_bits_opcode,
  input  [1:0]  auto_node_out_out_d_bits_param,
                auto_node_out_out_d_bits_size,
  input         auto_node_out_out_d_bits_source,
                auto_node_out_out_d_bits_sink,
                auto_node_out_out_d_bits_denied,
  input  [31:0] auto_node_out_out_d_bits_data,
  input         auto_node_out_out_d_bits_corrupt,
  output        auto_node_in_in_a_ready,
  input         auto_node_in_in_a_valid,
  input  [2:0]  auto_node_in_in_a_bits_opcode,
  input  [8:0]  auto_node_in_in_a_bits_address,
  input  [31:0] auto_node_in_in_a_bits_data,
  input         auto_node_in_in_d_ready,
  output        auto_node_in_in_d_valid,
  output [2:0]  auto_node_in_in_d_bits_opcode,
  output [1:0]  auto_node_in_in_d_bits_param,
                auto_node_in_in_d_bits_size,
  output        auto_node_in_in_d_bits_sink,
                auto_node_in_in_d_bits_denied,
  output [31:0] auto_node_in_in_d_bits_data,
  output        auto_node_in_in_d_bits_corrupt,
  input         io_bypass
);

  wire         _error_auto_in_a_ready;
  wire         _error_auto_in_d_valid;
  wire [2:0]   _error_auto_in_d_bits_opcode;
  wire [1:0]   _error_auto_in_d_bits_size;
  wire         _error_auto_in_d_bits_denied;
  wire         _error_auto_in_d_bits_corrupt;
  wire         _bar_auto_out_0_a_valid;
  wire [2:0]   _bar_auto_out_0_a_bits_opcode;
  wire [127:0] _bar_auto_out_0_a_bits_address;
  wire         _bar_auto_out_0_d_ready;
  TLBusBypassBar bar (
    .clock                     (clock),
    .reset                     (reset),
    .auto_in_a_ready           (auto_node_in_in_a_ready),
    .auto_in_a_valid           (auto_node_in_in_a_valid),
    .auto_in_a_bits_opcode     (auto_node_in_in_a_bits_opcode),
    .auto_in_a_bits_address    (auto_node_in_in_a_bits_address),
    .auto_in_a_bits_data       (auto_node_in_in_a_bits_data),
    .auto_in_d_ready           (auto_node_in_in_d_ready),
    .auto_in_d_valid           (auto_node_in_in_d_valid),
    .auto_in_d_bits_opcode     (auto_node_in_in_d_bits_opcode),
    .auto_in_d_bits_param      (auto_node_in_in_d_bits_param),
    .auto_in_d_bits_size       (auto_node_in_in_d_bits_size),
    .auto_in_d_bits_sink       (auto_node_in_in_d_bits_sink),
    .auto_in_d_bits_denied     (auto_node_in_in_d_bits_denied),
    .auto_in_d_bits_data       (auto_node_in_in_d_bits_data),
    .auto_in_d_bits_corrupt    (auto_node_in_in_d_bits_corrupt),
    .auto_out_1_a_ready        (auto_node_out_out_a_ready),
    .auto_out_1_a_valid        (auto_node_out_out_a_valid),
    .auto_out_1_a_bits_opcode  (auto_node_out_out_a_bits_opcode),
    .auto_out_1_a_bits_address (auto_node_out_out_a_bits_address),
    .auto_out_1_a_bits_data    (auto_node_out_out_a_bits_data),
    .auto_out_1_d_ready        (auto_node_out_out_d_ready),
    .auto_out_1_d_valid        (auto_node_out_out_d_valid),
    .auto_out_1_d_bits_opcode  (auto_node_out_out_d_bits_opcode),
    .auto_out_1_d_bits_param   (auto_node_out_out_d_bits_param),
    .auto_out_1_d_bits_size    (auto_node_out_out_d_bits_size),
    .auto_out_1_d_bits_source  (auto_node_out_out_d_bits_source),
    .auto_out_1_d_bits_sink    (auto_node_out_out_d_bits_sink),
    .auto_out_1_d_bits_denied  (auto_node_out_out_d_bits_denied),
    .auto_out_1_d_bits_data    (auto_node_out_out_d_bits_data),
    .auto_out_1_d_bits_corrupt (auto_node_out_out_d_bits_corrupt),
    .auto_out_0_a_ready        (_error_auto_in_a_ready),
    .auto_out_0_a_valid        (_bar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode  (_bar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_address (_bar_auto_out_0_a_bits_address),
    .auto_out_0_d_ready        (_bar_auto_out_0_d_ready),
    .auto_out_0_d_valid        (_error_auto_in_d_valid),
    .auto_out_0_d_bits_opcode  (_error_auto_in_d_bits_opcode),
    .auto_out_0_d_bits_size    (_error_auto_in_d_bits_size),
    .auto_out_0_d_bits_denied  (_error_auto_in_d_bits_denied),
    .auto_out_0_d_bits_corrupt (_error_auto_in_d_bits_corrupt),
    .io_bypass                 (io_bypass)
  );
  TLError_1 error (
    .clock                  (clock),
    .reset                  (reset),
    .auto_in_a_ready        (_error_auto_in_a_ready),
    .auto_in_a_valid        (_bar_auto_out_0_a_valid),
    .auto_in_a_bits_opcode  (_bar_auto_out_0_a_bits_opcode),
    .auto_in_a_bits_address (_bar_auto_out_0_a_bits_address),
    .auto_in_d_ready        (_bar_auto_out_0_d_ready),
    .auto_in_d_valid        (_error_auto_in_d_valid),
    .auto_in_d_bits_opcode  (_error_auto_in_d_bits_opcode),
    .auto_in_d_bits_size    (_error_auto_in_d_bits_size),
    .auto_in_d_bits_denied  (_error_auto_in_d_bits_denied),
    .auto_in_d_bits_corrupt (_error_auto_in_d_bits_corrupt)
  );
endmodule

