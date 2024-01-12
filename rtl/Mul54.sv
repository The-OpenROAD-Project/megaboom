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

module Mul54(
  input          clock,
                 io_val_s0,
                 io_latch_a_s0,
  input  [53:0]  io_a_s0,
  input          io_latch_b_s0,
  input  [53:0]  io_b_s0,
  input  [104:0] io_c_s2,
  output [104:0] io_result_s3
);

  reg         val_s1;
  reg         val_s2;
  reg [53:0]  reg_a_s1;
  reg [53:0]  reg_b_s1;
  reg [53:0]  reg_a_s2;
  reg [53:0]  reg_b_s2;
  reg [104:0] reg_result_s3;
  always @(posedge clock) begin
    val_s1 <= io_val_s0;
    val_s2 <= val_s1;
    if (io_val_s0 & io_latch_a_s0)
      reg_a_s1 <= io_a_s0;
    if (io_val_s0 & io_latch_b_s0)
      reg_b_s1 <= io_b_s0;
    if (val_s1) begin
      reg_a_s2 <= reg_a_s1;
      reg_b_s2 <= reg_b_s1;
    end
    if (val_s2)
      reg_result_s3 <= {51'h0, reg_a_s2} * {51'h0, reg_b_s2} + io_c_s2;
  end // always @(posedge)
  assign io_result_s3 = reg_result_s3;
endmodule

