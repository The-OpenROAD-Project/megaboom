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

module Arbiter_15(
  input          io_in_0_valid,
                 io_in_0_bits_is_mispredict_update,
                 io_in_0_bits_is_repair_update,
  input  [39:0]  io_in_0_bits_pc,
  input  [7:0]   io_in_0_bits_br_mask,
  input          io_in_0_bits_cfi_idx_valid,
  input  [2:0]   io_in_0_bits_cfi_idx_bits,
  input          io_in_0_bits_cfi_taken,
                 io_in_0_bits_cfi_mispredicted,
                 io_in_0_bits_cfi_is_br,
                 io_in_0_bits_cfi_is_jal,
  input  [63:0]  io_in_0_bits_ghist_old_history,
  input          io_in_0_bits_ghist_new_saw_branch_not_taken,
                 io_in_0_bits_ghist_new_saw_branch_taken,
  input  [39:0]  io_in_0_bits_target,
  input  [119:0] io_in_0_bits_meta_0,
                 io_in_0_bits_meta_1,
  output         io_in_1_ready,
  input          io_in_1_valid,
                 io_in_1_bits_is_mispredict_update,
                 io_in_1_bits_is_repair_update,
  input  [7:0]   io_in_1_bits_btb_mispredicts,
  input  [39:0]  io_in_1_bits_pc,
  input  [7:0]   io_in_1_bits_br_mask,
  input          io_in_1_bits_cfi_idx_valid,
  input  [2:0]   io_in_1_bits_cfi_idx_bits,
  input          io_in_1_bits_cfi_taken,
                 io_in_1_bits_cfi_mispredicted,
                 io_in_1_bits_cfi_is_br,
                 io_in_1_bits_cfi_is_jal,
  input  [63:0]  io_in_1_bits_ghist_old_history,
  input          io_in_1_bits_ghist_new_saw_branch_not_taken,
                 io_in_1_bits_ghist_new_saw_branch_taken,
  input  [39:0]  io_in_1_bits_target,
  input  [119:0] io_in_1_bits_meta_0,
                 io_in_1_bits_meta_1,
  output         io_out_valid,
                 io_out_bits_is_mispredict_update,
                 io_out_bits_is_repair_update,
  output [7:0]   io_out_bits_btb_mispredicts,
  output [39:0]  io_out_bits_pc,
  output [7:0]   io_out_bits_br_mask,
  output         io_out_bits_cfi_idx_valid,
  output [2:0]   io_out_bits_cfi_idx_bits,
  output         io_out_bits_cfi_taken,
                 io_out_bits_cfi_mispredicted,
                 io_out_bits_cfi_is_br,
                 io_out_bits_cfi_is_jal,
  output [63:0]  io_out_bits_ghist_old_history,
  output         io_out_bits_ghist_new_saw_branch_not_taken,
                 io_out_bits_ghist_new_saw_branch_taken,
  output [39:0]  io_out_bits_target,
  output [119:0] io_out_bits_meta_0,
                 io_out_bits_meta_1
);

  assign io_in_1_ready = ~io_in_0_valid;
  assign io_out_valid = io_in_0_valid | io_in_1_valid;
  assign io_out_bits_is_mispredict_update = io_in_0_valid ? io_in_0_bits_is_mispredict_update : io_in_1_bits_is_mispredict_update;
  assign io_out_bits_is_repair_update = io_in_0_valid ? io_in_0_bits_is_repair_update : io_in_1_bits_is_repair_update;
  assign io_out_bits_btb_mispredicts = io_in_0_valid ? 8'h0 : io_in_1_bits_btb_mispredicts;
  assign io_out_bits_pc = io_in_0_valid ? io_in_0_bits_pc : io_in_1_bits_pc;
  assign io_out_bits_br_mask = io_in_0_valid ? io_in_0_bits_br_mask : io_in_1_bits_br_mask;
  assign io_out_bits_cfi_idx_valid = io_in_0_valid ? io_in_0_bits_cfi_idx_valid : io_in_1_bits_cfi_idx_valid;
  assign io_out_bits_cfi_idx_bits = io_in_0_valid ? io_in_0_bits_cfi_idx_bits : io_in_1_bits_cfi_idx_bits;
  assign io_out_bits_cfi_taken = io_in_0_valid ? io_in_0_bits_cfi_taken : io_in_1_bits_cfi_taken;
  assign io_out_bits_cfi_mispredicted = io_in_0_valid ? io_in_0_bits_cfi_mispredicted : io_in_1_bits_cfi_mispredicted;
  assign io_out_bits_cfi_is_br = io_in_0_valid ? io_in_0_bits_cfi_is_br : io_in_1_bits_cfi_is_br;
  assign io_out_bits_cfi_is_jal = io_in_0_valid ? io_in_0_bits_cfi_is_jal : io_in_1_bits_cfi_is_jal;
  assign io_out_bits_ghist_old_history = io_in_0_valid ? io_in_0_bits_ghist_old_history : io_in_1_bits_ghist_old_history;
  assign io_out_bits_ghist_new_saw_branch_not_taken = io_in_0_valid ? io_in_0_bits_ghist_new_saw_branch_not_taken : io_in_1_bits_ghist_new_saw_branch_not_taken;
  assign io_out_bits_ghist_new_saw_branch_taken = io_in_0_valid ? io_in_0_bits_ghist_new_saw_branch_taken : io_in_1_bits_ghist_new_saw_branch_taken;
  assign io_out_bits_target = io_in_0_valid ? io_in_0_bits_target : io_in_1_bits_target;
  assign io_out_bits_meta_0 = io_in_0_valid ? io_in_0_bits_meta_0 : io_in_1_bits_meta_0;
  assign io_out_bits_meta_1 = io_in_0_valid ? io_in_0_bits_meta_1 : io_in_1_bits_meta_1;
endmodule

