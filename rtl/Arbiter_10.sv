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

module Arbiter_10(
  output       io_in_0_ready,
  input        io_in_0_valid,
  input  [5:0] io_in_0_bits_req_0_idx,
  output       io_in_1_ready,
  input        io_in_1_valid,
  input  [5:0] io_in_1_bits_req_0_idx,
  output       io_in_2_ready,
  input        io_in_2_valid,
  input  [5:0] io_in_2_bits_req_0_idx,
  output       io_in_3_ready,
  input        io_in_3_valid,
  input  [5:0] io_in_3_bits_req_0_idx,
  output       io_in_4_ready,
  input        io_in_4_valid,
  input  [5:0] io_in_4_bits_req_0_idx,
               io_in_4_bits_req_1_idx,
  output       io_in_5_ready,
  input        io_in_5_valid,
  input  [5:0] io_in_5_bits_req_0_idx,
  input        io_out_ready,
  output       io_out_valid,
  output [5:0] io_out_bits_req_0_idx,
               io_out_bits_req_1_idx
);

  wire _grant_T = io_in_0_valid | io_in_1_valid;
  wire _grant_T_1 = _grant_T | io_in_2_valid;
  wire _grant_T_2 = _grant_T_1 | io_in_3_valid;
  wire _io_out_valid_T = _grant_T_2 | io_in_4_valid;
  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
  assign io_in_2_ready = ~_grant_T & io_out_ready;
  assign io_in_3_ready = ~_grant_T_1 & io_out_ready;
  assign io_in_4_ready = ~_grant_T_2 & io_out_ready;
  assign io_in_5_ready = ~_io_out_valid_T & io_out_ready;
  assign io_out_valid = _io_out_valid_T | io_in_5_valid;
  assign io_out_bits_req_0_idx = io_in_0_valid ? io_in_0_bits_req_0_idx : io_in_1_valid ? io_in_1_bits_req_0_idx : io_in_2_valid ? io_in_2_bits_req_0_idx : io_in_3_valid ? io_in_3_bits_req_0_idx : io_in_4_valid ? io_in_4_bits_req_0_idx : io_in_5_bits_req_0_idx;
  assign io_out_bits_req_1_idx = io_in_0_valid | io_in_1_valid | io_in_2_valid | io_in_3_valid | ~io_in_4_valid ? 6'h0 : io_in_4_bits_req_1_idx;
endmodule

