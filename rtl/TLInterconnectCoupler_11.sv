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

module TLInterconnectCoupler_11(
  input         clock,
                reset,
                auto_fragmenter_out_a_ready,
  output        auto_fragmenter_out_a_valid,
  output [2:0]  auto_fragmenter_out_a_bits_opcode,
                auto_fragmenter_out_a_bits_param,
  output [1:0]  auto_fragmenter_out_a_bits_size,
  output [9:0]  auto_fragmenter_out_a_bits_source,
  output [16:0] auto_fragmenter_out_a_bits_address,
  output [7:0]  auto_fragmenter_out_a_bits_mask,
  output        auto_fragmenter_out_a_bits_corrupt,
                auto_fragmenter_out_d_ready,
  input         auto_fragmenter_out_d_valid,
  input  [1:0]  auto_fragmenter_out_d_bits_size,
  input  [9:0]  auto_fragmenter_out_d_bits_source,
  input  [63:0] auto_fragmenter_out_d_bits_data,
  output        auto_tl_in_a_ready,
  input         auto_tl_in_a_valid,
  input  [2:0]  auto_tl_in_a_bits_opcode,
                auto_tl_in_a_bits_param,
                auto_tl_in_a_bits_size,
  input  [5:0]  auto_tl_in_a_bits_source,
  input  [16:0] auto_tl_in_a_bits_address,
  input  [7:0]  auto_tl_in_a_bits_mask,
  input         auto_tl_in_a_bits_corrupt,
                auto_tl_in_d_ready,
  output        auto_tl_in_d_valid,
  output [2:0]  auto_tl_in_d_bits_size,
  output [5:0]  auto_tl_in_d_bits_source,
  output [63:0] auto_tl_in_d_bits_data
);

  TLFragmenter_4 fragmenter (
    .clock                   (clock),
    .reset                   (reset),
    .auto_in_a_ready         (auto_tl_in_a_ready),
    .auto_in_a_valid         (auto_tl_in_a_valid),
    .auto_in_a_bits_opcode   (auto_tl_in_a_bits_opcode),
    .auto_in_a_bits_param    (auto_tl_in_a_bits_param),
    .auto_in_a_bits_size     (auto_tl_in_a_bits_size),
    .auto_in_a_bits_source   (auto_tl_in_a_bits_source),
    .auto_in_a_bits_address  (auto_tl_in_a_bits_address),
    .auto_in_a_bits_mask     (auto_tl_in_a_bits_mask),
    .auto_in_a_bits_corrupt  (auto_tl_in_a_bits_corrupt),
    .auto_in_d_ready         (auto_tl_in_d_ready),
    .auto_in_d_valid         (auto_tl_in_d_valid),
    .auto_in_d_bits_size     (auto_tl_in_d_bits_size),
    .auto_in_d_bits_source   (auto_tl_in_d_bits_source),
    .auto_in_d_bits_data     (auto_tl_in_d_bits_data),
    .auto_out_a_ready        (auto_fragmenter_out_a_ready),
    .auto_out_a_valid        (auto_fragmenter_out_a_valid),
    .auto_out_a_bits_opcode  (auto_fragmenter_out_a_bits_opcode),
    .auto_out_a_bits_param   (auto_fragmenter_out_a_bits_param),
    .auto_out_a_bits_size    (auto_fragmenter_out_a_bits_size),
    .auto_out_a_bits_source  (auto_fragmenter_out_a_bits_source),
    .auto_out_a_bits_address (auto_fragmenter_out_a_bits_address),
    .auto_out_a_bits_mask    (auto_fragmenter_out_a_bits_mask),
    .auto_out_a_bits_corrupt (auto_fragmenter_out_a_bits_corrupt),
    .auto_out_d_ready        (auto_fragmenter_out_d_ready),
    .auto_out_d_valid        (auto_fragmenter_out_d_valid),
    .auto_out_d_bits_size    (auto_fragmenter_out_d_bits_size),
    .auto_out_d_bits_source  (auto_fragmenter_out_d_bits_source),
    .auto_out_d_bits_data    (auto_fragmenter_out_d_bits_data)
  );
endmodule

