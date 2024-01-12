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

module Arbiter_14(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [32:0] io_in_0_bits_address,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [32:0] io_in_1_bits_address,
  input         io_out_ready,
  output        io_out_valid,
  output [32:0] io_out_bits_address
);

  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
  assign io_out_valid = io_in_0_valid | io_in_1_valid;
  assign io_out_bits_address = io_in_0_valid ? io_in_0_bits_address : io_in_1_bits_address;
endmodule

