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

module Arbiter_19(
  input        io_in_0_valid,
  input  [5:0] io_in_0_bits,
  input        io_in_1_valid,
  input  [5:0] io_in_1_bits,
  output       io_in_2_ready,
  input  [5:0] io_in_2_bits,
  output [5:0] io_out_bits
);

  assign io_in_2_ready = ~(io_in_0_valid | io_in_1_valid);
  assign io_out_bits = io_in_0_valid ? io_in_0_bits : io_in_1_valid ? io_in_1_bits : io_in_2_bits;
endmodule

