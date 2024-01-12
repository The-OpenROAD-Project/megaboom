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

module Queue_20(
  input          clock,
                 reset,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [39:0]  io_enq_bits_pc,
  input          io_enq_bits_preds_0_taken,
                 io_enq_bits_preds_0_is_br,
                 io_enq_bits_preds_0_is_jal,
                 io_enq_bits_preds_0_predicted_pc_valid,
  input  [39:0]  io_enq_bits_preds_0_predicted_pc_bits,
  input          io_enq_bits_preds_1_taken,
                 io_enq_bits_preds_1_is_br,
                 io_enq_bits_preds_1_is_jal,
                 io_enq_bits_preds_1_predicted_pc_valid,
  input  [39:0]  io_enq_bits_preds_1_predicted_pc_bits,
  input          io_enq_bits_preds_2_taken,
                 io_enq_bits_preds_2_is_br,
                 io_enq_bits_preds_2_is_jal,
                 io_enq_bits_preds_2_predicted_pc_valid,
  input  [39:0]  io_enq_bits_preds_2_predicted_pc_bits,
  input          io_enq_bits_preds_3_taken,
                 io_enq_bits_preds_3_is_br,
                 io_enq_bits_preds_3_is_jal,
                 io_enq_bits_preds_3_predicted_pc_valid,
  input  [39:0]  io_enq_bits_preds_3_predicted_pc_bits,
  input          io_enq_bits_preds_4_taken,
                 io_enq_bits_preds_4_is_br,
                 io_enq_bits_preds_4_is_jal,
                 io_enq_bits_preds_4_predicted_pc_valid,
  input  [39:0]  io_enq_bits_preds_4_predicted_pc_bits,
  input          io_enq_bits_preds_5_taken,
                 io_enq_bits_preds_5_is_br,
                 io_enq_bits_preds_5_is_jal,
                 io_enq_bits_preds_5_predicted_pc_valid,
  input  [39:0]  io_enq_bits_preds_5_predicted_pc_bits,
  input          io_enq_bits_preds_6_taken,
                 io_enq_bits_preds_6_is_br,
                 io_enq_bits_preds_6_is_jal,
                 io_enq_bits_preds_6_predicted_pc_valid,
  input  [39:0]  io_enq_bits_preds_6_predicted_pc_bits,
  input          io_enq_bits_preds_7_taken,
                 io_enq_bits_preds_7_is_br,
                 io_enq_bits_preds_7_is_jal,
                 io_enq_bits_preds_7_predicted_pc_valid,
  input  [39:0]  io_enq_bits_preds_7_predicted_pc_bits,
  input  [119:0] io_enq_bits_meta_0,
                 io_enq_bits_meta_1,
  input          io_deq_ready,
  output [39:0]  io_deq_bits_pc,
  output         io_deq_bits_preds_0_taken,
                 io_deq_bits_preds_0_predicted_pc_valid,
  output [39:0]  io_deq_bits_preds_0_predicted_pc_bits,
  output         io_deq_bits_preds_1_taken,
                 io_deq_bits_preds_1_predicted_pc_valid,
  output [39:0]  io_deq_bits_preds_1_predicted_pc_bits,
  output         io_deq_bits_preds_2_taken,
                 io_deq_bits_preds_2_predicted_pc_valid,
  output [39:0]  io_deq_bits_preds_2_predicted_pc_bits,
  output         io_deq_bits_preds_3_taken,
                 io_deq_bits_preds_3_predicted_pc_valid,
  output [39:0]  io_deq_bits_preds_3_predicted_pc_bits,
  output         io_deq_bits_preds_4_taken,
                 io_deq_bits_preds_4_predicted_pc_valid,
  output [39:0]  io_deq_bits_preds_4_predicted_pc_bits,
  output         io_deq_bits_preds_5_taken,
                 io_deq_bits_preds_5_predicted_pc_valid,
  output [39:0]  io_deq_bits_preds_5_predicted_pc_bits,
  output         io_deq_bits_preds_6_taken,
                 io_deq_bits_preds_6_predicted_pc_valid,
  output [39:0]  io_deq_bits_preds_6_predicted_pc_bits,
  output         io_deq_bits_preds_7_taken,
                 io_deq_bits_preds_7_predicted_pc_valid,
  output [39:0]  io_deq_bits_preds_7_predicted_pc_bits,
  output [119:0] io_deq_bits_meta_0,
                 io_deq_bits_meta_1,
  output         io_deq_bits_lhist_0,
                 io_deq_bits_lhist_1
);

  wire         _io_enq_ready_output;
  reg  [633:0] ram;
  reg          full;
  wire         do_enq = ~(~full & io_deq_ready) & _io_enq_ready_output & io_enq_valid;
  assign _io_enq_ready_output = io_deq_ready | ~full;
  always @(posedge clock) begin
    if (do_enq)
      ram <= {2'h0, io_enq_bits_meta_1, io_enq_bits_meta_0, io_enq_bits_preds_7_predicted_pc_bits, io_enq_bits_preds_7_predicted_pc_valid, io_enq_bits_preds_7_is_jal, io_enq_bits_preds_7_is_br, io_enq_bits_preds_7_taken, io_enq_bits_preds_6_predicted_pc_bits, io_enq_bits_preds_6_predicted_pc_valid, io_enq_bits_preds_6_is_jal, io_enq_bits_preds_6_is_br, io_enq_bits_preds_6_taken, io_enq_bits_preds_5_predicted_pc_bits, io_enq_bits_preds_5_predicted_pc_valid, io_enq_bits_preds_5_is_jal, io_enq_bits_preds_5_is_br, io_enq_bits_preds_5_taken, io_enq_bits_preds_4_predicted_pc_bits, io_enq_bits_preds_4_predicted_pc_valid, io_enq_bits_preds_4_is_jal, io_enq_bits_preds_4_is_br, io_enq_bits_preds_4_taken, io_enq_bits_preds_3_predicted_pc_bits, io_enq_bits_preds_3_predicted_pc_valid, io_enq_bits_preds_3_is_jal, io_enq_bits_preds_3_is_br, io_enq_bits_preds_3_taken, io_enq_bits_preds_2_predicted_pc_bits, io_enq_bits_preds_2_predicted_pc_valid, io_enq_bits_preds_2_is_jal, io_enq_bits_preds_2_is_br, io_enq_bits_preds_2_taken, io_enq_bits_preds_1_predicted_pc_bits, io_enq_bits_preds_1_predicted_pc_valid, io_enq_bits_preds_1_is_jal, io_enq_bits_preds_1_is_br, io_enq_bits_preds_1_taken, io_enq_bits_preds_0_predicted_pc_bits, io_enq_bits_preds_0_predicted_pc_valid, io_enq_bits_preds_0_is_jal, io_enq_bits_preds_0_is_br, io_enq_bits_preds_0_taken, io_enq_bits_pc};
    if (reset)
      full <= 1'h0;
    else if (~(do_enq == (full & io_deq_ready & (io_enq_valid | full))))
      full <= do_enq;
  end // always @(posedge)
  assign io_enq_ready = _io_enq_ready_output;
  assign io_deq_bits_pc = full ? ram[39:0] : io_enq_bits_pc;
  assign io_deq_bits_preds_0_taken = full ? ram[40] : io_enq_bits_preds_0_taken;
  assign io_deq_bits_preds_0_predicted_pc_valid = full ? ram[43] : io_enq_bits_preds_0_predicted_pc_valid;
  assign io_deq_bits_preds_0_predicted_pc_bits = full ? ram[83:44] : io_enq_bits_preds_0_predicted_pc_bits;
  assign io_deq_bits_preds_1_taken = full ? ram[84] : io_enq_bits_preds_1_taken;
  assign io_deq_bits_preds_1_predicted_pc_valid = full ? ram[87] : io_enq_bits_preds_1_predicted_pc_valid;
  assign io_deq_bits_preds_1_predicted_pc_bits = full ? ram[127:88] : io_enq_bits_preds_1_predicted_pc_bits;
  assign io_deq_bits_preds_2_taken = full ? ram[128] : io_enq_bits_preds_2_taken;
  assign io_deq_bits_preds_2_predicted_pc_valid = full ? ram[131] : io_enq_bits_preds_2_predicted_pc_valid;
  assign io_deq_bits_preds_2_predicted_pc_bits = full ? ram[171:132] : io_enq_bits_preds_2_predicted_pc_bits;
  assign io_deq_bits_preds_3_taken = full ? ram[172] : io_enq_bits_preds_3_taken;
  assign io_deq_bits_preds_3_predicted_pc_valid = full ? ram[175] : io_enq_bits_preds_3_predicted_pc_valid;
  assign io_deq_bits_preds_3_predicted_pc_bits = full ? ram[215:176] : io_enq_bits_preds_3_predicted_pc_bits;
  assign io_deq_bits_preds_4_taken = full ? ram[216] : io_enq_bits_preds_4_taken;
  assign io_deq_bits_preds_4_predicted_pc_valid = full ? ram[219] : io_enq_bits_preds_4_predicted_pc_valid;
  assign io_deq_bits_preds_4_predicted_pc_bits = full ? ram[259:220] : io_enq_bits_preds_4_predicted_pc_bits;
  assign io_deq_bits_preds_5_taken = full ? ram[260] : io_enq_bits_preds_5_taken;
  assign io_deq_bits_preds_5_predicted_pc_valid = full ? ram[263] : io_enq_bits_preds_5_predicted_pc_valid;
  assign io_deq_bits_preds_5_predicted_pc_bits = full ? ram[303:264] : io_enq_bits_preds_5_predicted_pc_bits;
  assign io_deq_bits_preds_6_taken = full ? ram[304] : io_enq_bits_preds_6_taken;
  assign io_deq_bits_preds_6_predicted_pc_valid = full ? ram[307] : io_enq_bits_preds_6_predicted_pc_valid;
  assign io_deq_bits_preds_6_predicted_pc_bits = full ? ram[347:308] : io_enq_bits_preds_6_predicted_pc_bits;
  assign io_deq_bits_preds_7_taken = full ? ram[348] : io_enq_bits_preds_7_taken;
  assign io_deq_bits_preds_7_predicted_pc_valid = full ? ram[351] : io_enq_bits_preds_7_predicted_pc_valid;
  assign io_deq_bits_preds_7_predicted_pc_bits = full ? ram[391:352] : io_enq_bits_preds_7_predicted_pc_bits;
  assign io_deq_bits_meta_0 = full ? ram[511:392] : io_enq_bits_meta_0;
  assign io_deq_bits_meta_1 = full ? ram[631:512] : io_enq_bits_meta_1;
  assign io_deq_bits_lhist_0 = full & ram[632];
  assign io_deq_bits_lhist_1 = full & ram[633];
endmodule

