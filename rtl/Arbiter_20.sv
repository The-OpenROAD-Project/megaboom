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

module Arbiter_20(
  output        io_in_0_ready,
  input         io_in_0_valid,
                io_in_0_bits_valid,
  input  [26:0] io_in_0_bits_bits_addr,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [26:0] io_in_1_bits_bits_addr,
  input         io_in_1_bits_bits_need_gpa,
                io_out_ready,
  output        io_out_valid,
                io_out_bits_valid,
  output [26:0] io_out_bits_bits_addr,
  output        io_out_bits_bits_need_gpa,
  output [1:0]  io_chosen
);

  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
  assign io_out_valid = io_in_0_valid | io_in_1_valid;
  assign io_out_bits_valid = io_in_0_valid ? io_in_0_bits_valid : io_in_1_valid;
  assign io_out_bits_bits_addr = io_in_0_valid ? io_in_0_bits_bits_addr : io_in_1_valid ? io_in_1_bits_bits_addr : 27'h0;
  assign io_out_bits_bits_need_gpa = ~io_in_0_valid & io_in_1_valid & io_in_1_bits_bits_need_gpa;
  assign io_chosen = io_in_0_valid ? 2'h0 : io_in_1_valid ? 2'h1 : 2'h2;
endmodule

