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

module ScratchpadBank(
  input         clock,
                reset,
  output        auto_xbar_in_a_ready,
  input         auto_xbar_in_a_valid,
  input  [2:0]  auto_xbar_in_a_bits_opcode,
                auto_xbar_in_a_bits_param,
                auto_xbar_in_a_bits_size,
  input  [3:0]  auto_xbar_in_a_bits_source,
  input  [27:0] auto_xbar_in_a_bits_address,
  input  [7:0]  auto_xbar_in_a_bits_mask,
  input  [63:0] auto_xbar_in_a_bits_data,
  input         auto_xbar_in_a_bits_corrupt,
                auto_xbar_in_d_ready,
  output        auto_xbar_in_d_valid,
  output [2:0]  auto_xbar_in_d_bits_opcode,
                auto_xbar_in_d_bits_size,
  output [3:0]  auto_xbar_in_d_bits_source,
  output [63:0] auto_xbar_in_d_bits_data
);

  wire        _fragmenter_auto_out_a_valid;
  wire [2:0]  _fragmenter_auto_out_a_bits_opcode;
  wire [2:0]  _fragmenter_auto_out_a_bits_param;
  wire [1:0]  _fragmenter_auto_out_a_bits_size;
  wire [7:0]  _fragmenter_auto_out_a_bits_source;
  wire [27:0] _fragmenter_auto_out_a_bits_address;
  wire [7:0]  _fragmenter_auto_out_a_bits_mask;
  wire [63:0] _fragmenter_auto_out_a_bits_data;
  wire        _fragmenter_auto_out_a_bits_corrupt;
  wire        _fragmenter_auto_out_d_ready;
  wire        _ram_auto_in_a_ready;
  wire        _ram_auto_in_d_valid;
  wire [2:0]  _ram_auto_in_d_bits_opcode;
  wire [1:0]  _ram_auto_in_d_bits_size;
  wire [7:0]  _ram_auto_in_d_bits_source;
  wire [63:0] _ram_auto_in_d_bits_data;
  TLRAM ram (
    .clock                  (clock),
    .reset                  (reset),
    .auto_in_a_ready        (_ram_auto_in_a_ready),
    .auto_in_a_valid        (_fragmenter_auto_out_a_valid),
    .auto_in_a_bits_opcode  (_fragmenter_auto_out_a_bits_opcode),
    .auto_in_a_bits_param   (_fragmenter_auto_out_a_bits_param),
    .auto_in_a_bits_size    (_fragmenter_auto_out_a_bits_size),
    .auto_in_a_bits_source  (_fragmenter_auto_out_a_bits_source),
    .auto_in_a_bits_address (_fragmenter_auto_out_a_bits_address),
    .auto_in_a_bits_mask    (_fragmenter_auto_out_a_bits_mask),
    .auto_in_a_bits_data    (_fragmenter_auto_out_a_bits_data),
    .auto_in_a_bits_corrupt (_fragmenter_auto_out_a_bits_corrupt),
    .auto_in_d_ready        (_fragmenter_auto_out_d_ready),
    .auto_in_d_valid        (_ram_auto_in_d_valid),
    .auto_in_d_bits_opcode  (_ram_auto_in_d_bits_opcode),
    .auto_in_d_bits_size    (_ram_auto_in_d_bits_size),
    .auto_in_d_bits_source  (_ram_auto_in_d_bits_source),
    .auto_in_d_bits_data    (_ram_auto_in_d_bits_data)
  );
  TLFragmenter_7 fragmenter (
    .clock                   (clock),
    .reset                   (reset),
    .auto_in_a_ready         (auto_xbar_in_a_ready),
    .auto_in_a_valid         (auto_xbar_in_a_valid),
    .auto_in_a_bits_opcode   (auto_xbar_in_a_bits_opcode),
    .auto_in_a_bits_param    (auto_xbar_in_a_bits_param),
    .auto_in_a_bits_size     (auto_xbar_in_a_bits_size),
    .auto_in_a_bits_source   (auto_xbar_in_a_bits_source),
    .auto_in_a_bits_address  (auto_xbar_in_a_bits_address),
    .auto_in_a_bits_mask     (auto_xbar_in_a_bits_mask),
    .auto_in_a_bits_data     (auto_xbar_in_a_bits_data),
    .auto_in_a_bits_corrupt  (auto_xbar_in_a_bits_corrupt),
    .auto_in_d_ready         (auto_xbar_in_d_ready),
    .auto_in_d_valid         (auto_xbar_in_d_valid),
    .auto_in_d_bits_opcode   (auto_xbar_in_d_bits_opcode),
    .auto_in_d_bits_size     (auto_xbar_in_d_bits_size),
    .auto_in_d_bits_source   (auto_xbar_in_d_bits_source),
    .auto_in_d_bits_data     (auto_xbar_in_d_bits_data),
    .auto_out_a_ready        (_ram_auto_in_a_ready),
    .auto_out_a_valid        (_fragmenter_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_fragmenter_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_fragmenter_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_fragmenter_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_fragmenter_auto_out_a_bits_source),
    .auto_out_a_bits_address (_fragmenter_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_fragmenter_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_fragmenter_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_fragmenter_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_fragmenter_auto_out_d_ready),
    .auto_out_d_valid        (_ram_auto_in_d_valid),
    .auto_out_d_bits_opcode  (_ram_auto_in_d_bits_opcode),
    .auto_out_d_bits_size    (_ram_auto_in_d_bits_size),
    .auto_out_d_bits_source  (_ram_auto_in_d_bits_source),
    .auto_out_d_bits_data    (_ram_auto_in_d_bits_data)
  );
endmodule

