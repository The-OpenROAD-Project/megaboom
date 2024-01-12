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

module Arbiter_16(
  output        io_in_0_ready,
  input         io_in_0_valid,
  input  [6:0]  io_in_0_bits_uop_uopc,
  input  [19:0] io_in_0_bits_uop_br_mask,
  input  [6:0]  io_in_0_bits_uop_rob_idx,
  input  [4:0]  io_in_0_bits_uop_stq_idx,
  input  [6:0]  io_in_0_bits_uop_pdst,
  input         io_in_0_bits_uop_is_amo,
                io_in_0_bits_uop_uses_stq,
  input  [1:0]  io_in_0_bits_uop_dst_rtype,
  input         io_in_0_bits_uop_fp_val,
  input  [64:0] io_in_0_bits_data,
  input         io_in_0_bits_predicated,
                io_in_0_bits_fflags_valid,
  input  [6:0]  io_in_0_bits_fflags_bits_uop_rob_idx,
  input  [4:0]  io_in_0_bits_fflags_bits_flags,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [6:0]  io_in_1_bits_uop_uopc,
  input  [19:0] io_in_1_bits_uop_br_mask,
  input  [6:0]  io_in_1_bits_uop_rob_idx,
  input  [4:0]  io_in_1_bits_uop_stq_idx,
  input  [6:0]  io_in_1_bits_uop_pdst,
  input         io_in_1_bits_uop_is_amo,
                io_in_1_bits_uop_uses_stq,
  input  [1:0]  io_in_1_bits_uop_dst_rtype,
  input         io_in_1_bits_uop_fp_val,
  input  [64:0] io_in_1_bits_data,
  input         io_in_1_bits_predicated,
                io_in_1_bits_fflags_valid,
  input  [6:0]  io_in_1_bits_fflags_bits_uop_rob_idx,
  input  [4:0]  io_in_1_bits_fflags_bits_flags,
  input         io_out_ready,
  output        io_out_valid,
  output [6:0]  io_out_bits_uop_uopc,
  output [19:0] io_out_bits_uop_br_mask,
  output [6:0]  io_out_bits_uop_rob_idx,
  output [4:0]  io_out_bits_uop_stq_idx,
  output [6:0]  io_out_bits_uop_pdst,
  output        io_out_bits_uop_is_amo,
                io_out_bits_uop_uses_stq,
  output [1:0]  io_out_bits_uop_dst_rtype,
  output        io_out_bits_uop_fp_val,
  output [64:0] io_out_bits_data,
  output        io_out_bits_predicated,
                io_out_bits_fflags_valid,
  output [6:0]  io_out_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_out_bits_fflags_bits_flags
);

  assign io_in_0_ready = io_out_ready;
  assign io_in_1_ready = ~io_in_0_valid & io_out_ready;
  assign io_out_valid = io_in_0_valid | io_in_1_valid;
  assign io_out_bits_uop_uopc = io_in_0_valid ? io_in_0_bits_uop_uopc : io_in_1_bits_uop_uopc;
  assign io_out_bits_uop_br_mask = io_in_0_valid ? io_in_0_bits_uop_br_mask : io_in_1_bits_uop_br_mask;
  assign io_out_bits_uop_rob_idx = io_in_0_valid ? io_in_0_bits_uop_rob_idx : io_in_1_bits_uop_rob_idx;
  assign io_out_bits_uop_stq_idx = io_in_0_valid ? io_in_0_bits_uop_stq_idx : io_in_1_bits_uop_stq_idx;
  assign io_out_bits_uop_pdst = io_in_0_valid ? io_in_0_bits_uop_pdst : io_in_1_bits_uop_pdst;
  assign io_out_bits_uop_is_amo = io_in_0_valid ? io_in_0_bits_uop_is_amo : io_in_1_bits_uop_is_amo;
  assign io_out_bits_uop_uses_stq = io_in_0_valid ? io_in_0_bits_uop_uses_stq : io_in_1_bits_uop_uses_stq;
  assign io_out_bits_uop_dst_rtype = io_in_0_valid ? io_in_0_bits_uop_dst_rtype : io_in_1_bits_uop_dst_rtype;
  assign io_out_bits_uop_fp_val = io_in_0_valid ? io_in_0_bits_uop_fp_val : io_in_1_bits_uop_fp_val;
  assign io_out_bits_data = io_in_0_valid ? io_in_0_bits_data : io_in_1_bits_data;
  assign io_out_bits_predicated = io_in_0_valid ? io_in_0_bits_predicated : io_in_1_bits_predicated;
  assign io_out_bits_fflags_valid = io_in_0_valid ? io_in_0_bits_fflags_valid : io_in_1_bits_fflags_valid;
  assign io_out_bits_fflags_bits_uop_rob_idx = io_in_0_valid ? io_in_0_bits_fflags_bits_uop_rob_idx : io_in_1_bits_fflags_bits_uop_rob_idx;
  assign io_out_bits_fflags_bits_flags = io_in_0_valid ? io_in_0_bits_fflags_bits_flags : io_in_1_bits_fflags_bits_flags;
endmodule

