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

module FetchTargetQueue(
  input          clock,
                 reset,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [39:0]  io_enq_bits_pc,
  input          io_enq_bits_cfi_idx_valid,
  input  [2:0]   io_enq_bits_cfi_idx_bits,
                 io_enq_bits_cfi_type,
  input          io_enq_bits_cfi_is_call,
                 io_enq_bits_cfi_is_ret,
  input  [39:0]  io_enq_bits_ras_top,
  input  [7:0]   io_enq_bits_mask,
                 io_enq_bits_br_mask,
  input  [63:0]  io_enq_bits_ghist_old_history,
  input          io_enq_bits_ghist_current_saw_branch_not_taken,
                 io_enq_bits_ghist_new_saw_branch_not_taken,
                 io_enq_bits_ghist_new_saw_branch_taken,
  input  [4:0]   io_enq_bits_ghist_ras_idx,
  input  [119:0] io_enq_bits_bpd_meta_0,
                 io_enq_bits_bpd_meta_1,
  output [5:0]   io_enq_idx,
  input          io_deq_valid,
  input  [5:0]   io_deq_bits,
                 io_get_ftq_pc_0_ftq_idx,
  output         io_get_ftq_pc_0_entry_cfi_idx_valid,
  output [2:0]   io_get_ftq_pc_0_entry_cfi_idx_bits,
  output [4:0]   io_get_ftq_pc_0_entry_ras_idx,
  output         io_get_ftq_pc_0_entry_start_bank,
  output [39:0]  io_get_ftq_pc_0_pc,
                 io_get_ftq_pc_0_com_pc,
  output         io_get_ftq_pc_0_next_val,
  output [39:0]  io_get_ftq_pc_0_next_pc,
  input  [5:0]   io_get_ftq_pc_1_ftq_idx,
  output [2:0]   io_get_ftq_pc_1_entry_cfi_idx_bits,
  output [7:0]   io_get_ftq_pc_1_entry_br_mask,
  output         io_get_ftq_pc_1_entry_cfi_is_call,
                 io_get_ftq_pc_1_entry_cfi_is_ret,
                 io_get_ftq_pc_1_entry_start_bank,
  output [63:0]  io_get_ftq_pc_1_ghist_old_history,
  output         io_get_ftq_pc_1_ghist_current_saw_branch_not_taken,
                 io_get_ftq_pc_1_ghist_new_saw_branch_not_taken,
                 io_get_ftq_pc_1_ghist_new_saw_branch_taken,
  output [4:0]   io_get_ftq_pc_1_ghist_ras_idx,
  output [39:0]  io_get_ftq_pc_1_pc,
  input          io_redirect_valid,
  input  [5:0]   io_redirect_bits,
                 io_brupdate_b2_uop_ftq_idx,
                 io_brupdate_b2_uop_pc_lob,
  input          io_brupdate_b2_mispredict,
                 io_brupdate_b2_taken,
  output         io_bpdupdate_valid,
                 io_bpdupdate_bits_is_mispredict_update,
                 io_bpdupdate_bits_is_repair_update,
  output [39:0]  io_bpdupdate_bits_pc,
  output [7:0]   io_bpdupdate_bits_br_mask,
  output         io_bpdupdate_bits_cfi_idx_valid,
  output [2:0]   io_bpdupdate_bits_cfi_idx_bits,
  output         io_bpdupdate_bits_cfi_taken,
                 io_bpdupdate_bits_cfi_mispredicted,
                 io_bpdupdate_bits_cfi_is_br,
                 io_bpdupdate_bits_cfi_is_jal,
  output [63:0]  io_bpdupdate_bits_ghist_old_history,
  output         io_bpdupdate_bits_ghist_new_saw_branch_not_taken,
                 io_bpdupdate_bits_ghist_new_saw_branch_taken,
  output [39:0]  io_bpdupdate_bits_target,
  output [119:0] io_bpdupdate_bits_meta_0,
                 io_bpdupdate_bits_meta_1,
  output         io_ras_update,
  output [4:0]   io_ras_update_idx,
  output [39:0]  io_ras_update_pc
);

  reg          io_enq_ready_REG;
  wire [4:0]   ghist_1_MPORT_1_data_ras_idx;
  wire         ghist_1_MPORT_1_data_new_saw_branch_taken;
  wire         ghist_1_MPORT_1_data_new_saw_branch_not_taken;
  wire [63:0]  ghist_1_MPORT_1_data_old_history;
  wire [71:0]  _ghist_1_ext_R0_data;
  wire [71:0]  _ghist_0_ext_R0_data;
  wire [239:0] _meta_ext_R0_data;
  reg  [5:0]   bpd_ptr;
  reg  [5:0]   deq_ptr;
  reg  [5:0]   enq_ptr;
  reg  [39:0]  pcs_0;
  reg  [39:0]  pcs_1;
  reg  [39:0]  pcs_2;
  reg  [39:0]  pcs_3;
  reg  [39:0]  pcs_4;
  reg  [39:0]  pcs_5;
  reg  [39:0]  pcs_6;
  reg  [39:0]  pcs_7;
  reg  [39:0]  pcs_8;
  reg  [39:0]  pcs_9;
  reg  [39:0]  pcs_10;
  reg  [39:0]  pcs_11;
  reg  [39:0]  pcs_12;
  reg  [39:0]  pcs_13;
  reg  [39:0]  pcs_14;
  reg  [39:0]  pcs_15;
  reg  [39:0]  pcs_16;
  reg  [39:0]  pcs_17;
  reg  [39:0]  pcs_18;
  reg  [39:0]  pcs_19;
  reg  [39:0]  pcs_20;
  reg  [39:0]  pcs_21;
  reg  [39:0]  pcs_22;
  reg  [39:0]  pcs_23;
  reg  [39:0]  pcs_24;
  reg  [39:0]  pcs_25;
  reg  [39:0]  pcs_26;
  reg  [39:0]  pcs_27;
  reg  [39:0]  pcs_28;
  reg  [39:0]  pcs_29;
  reg  [39:0]  pcs_30;
  reg  [39:0]  pcs_31;
  reg  [39:0]  pcs_32;
  reg  [39:0]  pcs_33;
  reg  [39:0]  pcs_34;
  reg  [39:0]  pcs_35;
  reg  [39:0]  pcs_36;
  reg  [39:0]  pcs_37;
  reg  [39:0]  pcs_38;
  reg  [39:0]  pcs_39;
  reg          ram_0_cfi_idx_valid;
  reg  [2:0]   ram_0_cfi_idx_bits;
  reg          ram_0_cfi_taken;
  reg          ram_0_cfi_mispredicted;
  reg  [2:0]   ram_0_cfi_type;
  reg  [7:0]   ram_0_br_mask;
  reg          ram_0_cfi_is_call;
  reg          ram_0_cfi_is_ret;
  reg  [39:0]  ram_0_ras_top;
  reg  [4:0]   ram_0_ras_idx;
  reg          ram_0_start_bank;
  reg          ram_1_cfi_idx_valid;
  reg  [2:0]   ram_1_cfi_idx_bits;
  reg          ram_1_cfi_taken;
  reg          ram_1_cfi_mispredicted;
  reg  [2:0]   ram_1_cfi_type;
  reg  [7:0]   ram_1_br_mask;
  reg          ram_1_cfi_is_call;
  reg          ram_1_cfi_is_ret;
  reg  [39:0]  ram_1_ras_top;
  reg  [4:0]   ram_1_ras_idx;
  reg          ram_1_start_bank;
  reg          ram_2_cfi_idx_valid;
  reg  [2:0]   ram_2_cfi_idx_bits;
  reg          ram_2_cfi_taken;
  reg          ram_2_cfi_mispredicted;
  reg  [2:0]   ram_2_cfi_type;
  reg  [7:0]   ram_2_br_mask;
  reg          ram_2_cfi_is_call;
  reg          ram_2_cfi_is_ret;
  reg  [39:0]  ram_2_ras_top;
  reg  [4:0]   ram_2_ras_idx;
  reg          ram_2_start_bank;
  reg          ram_3_cfi_idx_valid;
  reg  [2:0]   ram_3_cfi_idx_bits;
  reg          ram_3_cfi_taken;
  reg          ram_3_cfi_mispredicted;
  reg  [2:0]   ram_3_cfi_type;
  reg  [7:0]   ram_3_br_mask;
  reg          ram_3_cfi_is_call;
  reg          ram_3_cfi_is_ret;
  reg  [39:0]  ram_3_ras_top;
  reg  [4:0]   ram_3_ras_idx;
  reg          ram_3_start_bank;
  reg          ram_4_cfi_idx_valid;
  reg  [2:0]   ram_4_cfi_idx_bits;
  reg          ram_4_cfi_taken;
  reg          ram_4_cfi_mispredicted;
  reg  [2:0]   ram_4_cfi_type;
  reg  [7:0]   ram_4_br_mask;
  reg          ram_4_cfi_is_call;
  reg          ram_4_cfi_is_ret;
  reg  [39:0]  ram_4_ras_top;
  reg  [4:0]   ram_4_ras_idx;
  reg          ram_4_start_bank;
  reg          ram_5_cfi_idx_valid;
  reg  [2:0]   ram_5_cfi_idx_bits;
  reg          ram_5_cfi_taken;
  reg          ram_5_cfi_mispredicted;
  reg  [2:0]   ram_5_cfi_type;
  reg  [7:0]   ram_5_br_mask;
  reg          ram_5_cfi_is_call;
  reg          ram_5_cfi_is_ret;
  reg  [39:0]  ram_5_ras_top;
  reg  [4:0]   ram_5_ras_idx;
  reg          ram_5_start_bank;
  reg          ram_6_cfi_idx_valid;
  reg  [2:0]   ram_6_cfi_idx_bits;
  reg          ram_6_cfi_taken;
  reg          ram_6_cfi_mispredicted;
  reg  [2:0]   ram_6_cfi_type;
  reg  [7:0]   ram_6_br_mask;
  reg          ram_6_cfi_is_call;
  reg          ram_6_cfi_is_ret;
  reg  [39:0]  ram_6_ras_top;
  reg  [4:0]   ram_6_ras_idx;
  reg          ram_6_start_bank;
  reg          ram_7_cfi_idx_valid;
  reg  [2:0]   ram_7_cfi_idx_bits;
  reg          ram_7_cfi_taken;
  reg          ram_7_cfi_mispredicted;
  reg  [2:0]   ram_7_cfi_type;
  reg  [7:0]   ram_7_br_mask;
  reg          ram_7_cfi_is_call;
  reg          ram_7_cfi_is_ret;
  reg  [39:0]  ram_7_ras_top;
  reg  [4:0]   ram_7_ras_idx;
  reg          ram_7_start_bank;
  reg          ram_8_cfi_idx_valid;
  reg  [2:0]   ram_8_cfi_idx_bits;
  reg          ram_8_cfi_taken;
  reg          ram_8_cfi_mispredicted;
  reg  [2:0]   ram_8_cfi_type;
  reg  [7:0]   ram_8_br_mask;
  reg          ram_8_cfi_is_call;
  reg          ram_8_cfi_is_ret;
  reg  [39:0]  ram_8_ras_top;
  reg  [4:0]   ram_8_ras_idx;
  reg          ram_8_start_bank;
  reg          ram_9_cfi_idx_valid;
  reg  [2:0]   ram_9_cfi_idx_bits;
  reg          ram_9_cfi_taken;
  reg          ram_9_cfi_mispredicted;
  reg  [2:0]   ram_9_cfi_type;
  reg  [7:0]   ram_9_br_mask;
  reg          ram_9_cfi_is_call;
  reg          ram_9_cfi_is_ret;
  reg  [39:0]  ram_9_ras_top;
  reg  [4:0]   ram_9_ras_idx;
  reg          ram_9_start_bank;
  reg          ram_10_cfi_idx_valid;
  reg  [2:0]   ram_10_cfi_idx_bits;
  reg          ram_10_cfi_taken;
  reg          ram_10_cfi_mispredicted;
  reg  [2:0]   ram_10_cfi_type;
  reg  [7:0]   ram_10_br_mask;
  reg          ram_10_cfi_is_call;
  reg          ram_10_cfi_is_ret;
  reg  [39:0]  ram_10_ras_top;
  reg  [4:0]   ram_10_ras_idx;
  reg          ram_10_start_bank;
  reg          ram_11_cfi_idx_valid;
  reg  [2:0]   ram_11_cfi_idx_bits;
  reg          ram_11_cfi_taken;
  reg          ram_11_cfi_mispredicted;
  reg  [2:0]   ram_11_cfi_type;
  reg  [7:0]   ram_11_br_mask;
  reg          ram_11_cfi_is_call;
  reg          ram_11_cfi_is_ret;
  reg  [39:0]  ram_11_ras_top;
  reg  [4:0]   ram_11_ras_idx;
  reg          ram_11_start_bank;
  reg          ram_12_cfi_idx_valid;
  reg  [2:0]   ram_12_cfi_idx_bits;
  reg          ram_12_cfi_taken;
  reg          ram_12_cfi_mispredicted;
  reg  [2:0]   ram_12_cfi_type;
  reg  [7:0]   ram_12_br_mask;
  reg          ram_12_cfi_is_call;
  reg          ram_12_cfi_is_ret;
  reg  [39:0]  ram_12_ras_top;
  reg  [4:0]   ram_12_ras_idx;
  reg          ram_12_start_bank;
  reg          ram_13_cfi_idx_valid;
  reg  [2:0]   ram_13_cfi_idx_bits;
  reg          ram_13_cfi_taken;
  reg          ram_13_cfi_mispredicted;
  reg  [2:0]   ram_13_cfi_type;
  reg  [7:0]   ram_13_br_mask;
  reg          ram_13_cfi_is_call;
  reg          ram_13_cfi_is_ret;
  reg  [39:0]  ram_13_ras_top;
  reg  [4:0]   ram_13_ras_idx;
  reg          ram_13_start_bank;
  reg          ram_14_cfi_idx_valid;
  reg  [2:0]   ram_14_cfi_idx_bits;
  reg          ram_14_cfi_taken;
  reg          ram_14_cfi_mispredicted;
  reg  [2:0]   ram_14_cfi_type;
  reg  [7:0]   ram_14_br_mask;
  reg          ram_14_cfi_is_call;
  reg          ram_14_cfi_is_ret;
  reg  [39:0]  ram_14_ras_top;
  reg  [4:0]   ram_14_ras_idx;
  reg          ram_14_start_bank;
  reg          ram_15_cfi_idx_valid;
  reg  [2:0]   ram_15_cfi_idx_bits;
  reg          ram_15_cfi_taken;
  reg          ram_15_cfi_mispredicted;
  reg  [2:0]   ram_15_cfi_type;
  reg  [7:0]   ram_15_br_mask;
  reg          ram_15_cfi_is_call;
  reg          ram_15_cfi_is_ret;
  reg  [39:0]  ram_15_ras_top;
  reg  [4:0]   ram_15_ras_idx;
  reg          ram_15_start_bank;
  reg          ram_16_cfi_idx_valid;
  reg  [2:0]   ram_16_cfi_idx_bits;
  reg          ram_16_cfi_taken;
  reg          ram_16_cfi_mispredicted;
  reg  [2:0]   ram_16_cfi_type;
  reg  [7:0]   ram_16_br_mask;
  reg          ram_16_cfi_is_call;
  reg          ram_16_cfi_is_ret;
  reg  [39:0]  ram_16_ras_top;
  reg  [4:0]   ram_16_ras_idx;
  reg          ram_16_start_bank;
  reg          ram_17_cfi_idx_valid;
  reg  [2:0]   ram_17_cfi_idx_bits;
  reg          ram_17_cfi_taken;
  reg          ram_17_cfi_mispredicted;
  reg  [2:0]   ram_17_cfi_type;
  reg  [7:0]   ram_17_br_mask;
  reg          ram_17_cfi_is_call;
  reg          ram_17_cfi_is_ret;
  reg  [39:0]  ram_17_ras_top;
  reg  [4:0]   ram_17_ras_idx;
  reg          ram_17_start_bank;
  reg          ram_18_cfi_idx_valid;
  reg  [2:0]   ram_18_cfi_idx_bits;
  reg          ram_18_cfi_taken;
  reg          ram_18_cfi_mispredicted;
  reg  [2:0]   ram_18_cfi_type;
  reg  [7:0]   ram_18_br_mask;
  reg          ram_18_cfi_is_call;
  reg          ram_18_cfi_is_ret;
  reg  [39:0]  ram_18_ras_top;
  reg  [4:0]   ram_18_ras_idx;
  reg          ram_18_start_bank;
  reg          ram_19_cfi_idx_valid;
  reg  [2:0]   ram_19_cfi_idx_bits;
  reg          ram_19_cfi_taken;
  reg          ram_19_cfi_mispredicted;
  reg  [2:0]   ram_19_cfi_type;
  reg  [7:0]   ram_19_br_mask;
  reg          ram_19_cfi_is_call;
  reg          ram_19_cfi_is_ret;
  reg  [39:0]  ram_19_ras_top;
  reg  [4:0]   ram_19_ras_idx;
  reg          ram_19_start_bank;
  reg          ram_20_cfi_idx_valid;
  reg  [2:0]   ram_20_cfi_idx_bits;
  reg          ram_20_cfi_taken;
  reg          ram_20_cfi_mispredicted;
  reg  [2:0]   ram_20_cfi_type;
  reg  [7:0]   ram_20_br_mask;
  reg          ram_20_cfi_is_call;
  reg          ram_20_cfi_is_ret;
  reg  [39:0]  ram_20_ras_top;
  reg  [4:0]   ram_20_ras_idx;
  reg          ram_20_start_bank;
  reg          ram_21_cfi_idx_valid;
  reg  [2:0]   ram_21_cfi_idx_bits;
  reg          ram_21_cfi_taken;
  reg          ram_21_cfi_mispredicted;
  reg  [2:0]   ram_21_cfi_type;
  reg  [7:0]   ram_21_br_mask;
  reg          ram_21_cfi_is_call;
  reg          ram_21_cfi_is_ret;
  reg  [39:0]  ram_21_ras_top;
  reg  [4:0]   ram_21_ras_idx;
  reg          ram_21_start_bank;
  reg          ram_22_cfi_idx_valid;
  reg  [2:0]   ram_22_cfi_idx_bits;
  reg          ram_22_cfi_taken;
  reg          ram_22_cfi_mispredicted;
  reg  [2:0]   ram_22_cfi_type;
  reg  [7:0]   ram_22_br_mask;
  reg          ram_22_cfi_is_call;
  reg          ram_22_cfi_is_ret;
  reg  [39:0]  ram_22_ras_top;
  reg  [4:0]   ram_22_ras_idx;
  reg          ram_22_start_bank;
  reg          ram_23_cfi_idx_valid;
  reg  [2:0]   ram_23_cfi_idx_bits;
  reg          ram_23_cfi_taken;
  reg          ram_23_cfi_mispredicted;
  reg  [2:0]   ram_23_cfi_type;
  reg  [7:0]   ram_23_br_mask;
  reg          ram_23_cfi_is_call;
  reg          ram_23_cfi_is_ret;
  reg  [39:0]  ram_23_ras_top;
  reg  [4:0]   ram_23_ras_idx;
  reg          ram_23_start_bank;
  reg          ram_24_cfi_idx_valid;
  reg  [2:0]   ram_24_cfi_idx_bits;
  reg          ram_24_cfi_taken;
  reg          ram_24_cfi_mispredicted;
  reg  [2:0]   ram_24_cfi_type;
  reg  [7:0]   ram_24_br_mask;
  reg          ram_24_cfi_is_call;
  reg          ram_24_cfi_is_ret;
  reg  [39:0]  ram_24_ras_top;
  reg  [4:0]   ram_24_ras_idx;
  reg          ram_24_start_bank;
  reg          ram_25_cfi_idx_valid;
  reg  [2:0]   ram_25_cfi_idx_bits;
  reg          ram_25_cfi_taken;
  reg          ram_25_cfi_mispredicted;
  reg  [2:0]   ram_25_cfi_type;
  reg  [7:0]   ram_25_br_mask;
  reg          ram_25_cfi_is_call;
  reg          ram_25_cfi_is_ret;
  reg  [39:0]  ram_25_ras_top;
  reg  [4:0]   ram_25_ras_idx;
  reg          ram_25_start_bank;
  reg          ram_26_cfi_idx_valid;
  reg  [2:0]   ram_26_cfi_idx_bits;
  reg          ram_26_cfi_taken;
  reg          ram_26_cfi_mispredicted;
  reg  [2:0]   ram_26_cfi_type;
  reg  [7:0]   ram_26_br_mask;
  reg          ram_26_cfi_is_call;
  reg          ram_26_cfi_is_ret;
  reg  [39:0]  ram_26_ras_top;
  reg  [4:0]   ram_26_ras_idx;
  reg          ram_26_start_bank;
  reg          ram_27_cfi_idx_valid;
  reg  [2:0]   ram_27_cfi_idx_bits;
  reg          ram_27_cfi_taken;
  reg          ram_27_cfi_mispredicted;
  reg  [2:0]   ram_27_cfi_type;
  reg  [7:0]   ram_27_br_mask;
  reg          ram_27_cfi_is_call;
  reg          ram_27_cfi_is_ret;
  reg  [39:0]  ram_27_ras_top;
  reg  [4:0]   ram_27_ras_idx;
  reg          ram_27_start_bank;
  reg          ram_28_cfi_idx_valid;
  reg  [2:0]   ram_28_cfi_idx_bits;
  reg          ram_28_cfi_taken;
  reg          ram_28_cfi_mispredicted;
  reg  [2:0]   ram_28_cfi_type;
  reg  [7:0]   ram_28_br_mask;
  reg          ram_28_cfi_is_call;
  reg          ram_28_cfi_is_ret;
  reg  [39:0]  ram_28_ras_top;
  reg  [4:0]   ram_28_ras_idx;
  reg          ram_28_start_bank;
  reg          ram_29_cfi_idx_valid;
  reg  [2:0]   ram_29_cfi_idx_bits;
  reg          ram_29_cfi_taken;
  reg          ram_29_cfi_mispredicted;
  reg  [2:0]   ram_29_cfi_type;
  reg  [7:0]   ram_29_br_mask;
  reg          ram_29_cfi_is_call;
  reg          ram_29_cfi_is_ret;
  reg  [39:0]  ram_29_ras_top;
  reg  [4:0]   ram_29_ras_idx;
  reg          ram_29_start_bank;
  reg          ram_30_cfi_idx_valid;
  reg  [2:0]   ram_30_cfi_idx_bits;
  reg          ram_30_cfi_taken;
  reg          ram_30_cfi_mispredicted;
  reg  [2:0]   ram_30_cfi_type;
  reg  [7:0]   ram_30_br_mask;
  reg          ram_30_cfi_is_call;
  reg          ram_30_cfi_is_ret;
  reg  [39:0]  ram_30_ras_top;
  reg  [4:0]   ram_30_ras_idx;
  reg          ram_30_start_bank;
  reg          ram_31_cfi_idx_valid;
  reg  [2:0]   ram_31_cfi_idx_bits;
  reg          ram_31_cfi_taken;
  reg          ram_31_cfi_mispredicted;
  reg  [2:0]   ram_31_cfi_type;
  reg  [7:0]   ram_31_br_mask;
  reg          ram_31_cfi_is_call;
  reg          ram_31_cfi_is_ret;
  reg  [39:0]  ram_31_ras_top;
  reg  [4:0]   ram_31_ras_idx;
  reg          ram_31_start_bank;
  reg          ram_32_cfi_idx_valid;
  reg  [2:0]   ram_32_cfi_idx_bits;
  reg          ram_32_cfi_taken;
  reg          ram_32_cfi_mispredicted;
  reg  [2:0]   ram_32_cfi_type;
  reg  [7:0]   ram_32_br_mask;
  reg          ram_32_cfi_is_call;
  reg          ram_32_cfi_is_ret;
  reg  [39:0]  ram_32_ras_top;
  reg  [4:0]   ram_32_ras_idx;
  reg          ram_32_start_bank;
  reg          ram_33_cfi_idx_valid;
  reg  [2:0]   ram_33_cfi_idx_bits;
  reg          ram_33_cfi_taken;
  reg          ram_33_cfi_mispredicted;
  reg  [2:0]   ram_33_cfi_type;
  reg  [7:0]   ram_33_br_mask;
  reg          ram_33_cfi_is_call;
  reg          ram_33_cfi_is_ret;
  reg  [39:0]  ram_33_ras_top;
  reg  [4:0]   ram_33_ras_idx;
  reg          ram_33_start_bank;
  reg          ram_34_cfi_idx_valid;
  reg  [2:0]   ram_34_cfi_idx_bits;
  reg          ram_34_cfi_taken;
  reg          ram_34_cfi_mispredicted;
  reg  [2:0]   ram_34_cfi_type;
  reg  [7:0]   ram_34_br_mask;
  reg          ram_34_cfi_is_call;
  reg          ram_34_cfi_is_ret;
  reg  [39:0]  ram_34_ras_top;
  reg  [4:0]   ram_34_ras_idx;
  reg          ram_34_start_bank;
  reg          ram_35_cfi_idx_valid;
  reg  [2:0]   ram_35_cfi_idx_bits;
  reg          ram_35_cfi_taken;
  reg          ram_35_cfi_mispredicted;
  reg  [2:0]   ram_35_cfi_type;
  reg  [7:0]   ram_35_br_mask;
  reg          ram_35_cfi_is_call;
  reg          ram_35_cfi_is_ret;
  reg  [39:0]  ram_35_ras_top;
  reg  [4:0]   ram_35_ras_idx;
  reg          ram_35_start_bank;
  reg          ram_36_cfi_idx_valid;
  reg  [2:0]   ram_36_cfi_idx_bits;
  reg          ram_36_cfi_taken;
  reg          ram_36_cfi_mispredicted;
  reg  [2:0]   ram_36_cfi_type;
  reg  [7:0]   ram_36_br_mask;
  reg          ram_36_cfi_is_call;
  reg          ram_36_cfi_is_ret;
  reg  [39:0]  ram_36_ras_top;
  reg  [4:0]   ram_36_ras_idx;
  reg          ram_36_start_bank;
  reg          ram_37_cfi_idx_valid;
  reg  [2:0]   ram_37_cfi_idx_bits;
  reg          ram_37_cfi_taken;
  reg          ram_37_cfi_mispredicted;
  reg  [2:0]   ram_37_cfi_type;
  reg  [7:0]   ram_37_br_mask;
  reg          ram_37_cfi_is_call;
  reg          ram_37_cfi_is_ret;
  reg  [39:0]  ram_37_ras_top;
  reg  [4:0]   ram_37_ras_idx;
  reg          ram_37_start_bank;
  reg          ram_38_cfi_idx_valid;
  reg  [2:0]   ram_38_cfi_idx_bits;
  reg          ram_38_cfi_taken;
  reg          ram_38_cfi_mispredicted;
  reg  [2:0]   ram_38_cfi_type;
  reg  [7:0]   ram_38_br_mask;
  reg          ram_38_cfi_is_call;
  reg          ram_38_cfi_is_ret;
  reg  [39:0]  ram_38_ras_top;
  reg  [4:0]   ram_38_ras_idx;
  reg          ram_38_start_bank;
  reg          ram_39_cfi_idx_valid;
  reg  [2:0]   ram_39_cfi_idx_bits;
  reg          ram_39_cfi_taken;
  reg          ram_39_cfi_mispredicted;
  reg  [2:0]   ram_39_cfi_type;
  reg  [7:0]   ram_39_br_mask;
  reg          ram_39_cfi_is_call;
  reg          ram_39_cfi_is_ret;
  reg  [39:0]  ram_39_ras_top;
  reg  [4:0]   ram_39_ras_idx;
  reg          ram_39_start_bank;
  wire [71:0]  _GEN = {ghist_1_MPORT_1_data_ras_idx, ghist_1_MPORT_1_data_new_saw_branch_taken, ghist_1_MPORT_1_data_new_saw_branch_not_taken, io_enq_bits_ghist_current_saw_branch_not_taken, ghist_1_MPORT_1_data_old_history};
  wire         ghist_1_MPORT_1_en = io_enq_ready_REG & io_enq_valid;
  reg  [63:0]  prev_ghist_old_history;
  reg          prev_ghist_current_saw_branch_not_taken;
  reg          prev_ghist_new_saw_branch_not_taken;
  reg          prev_ghist_new_saw_branch_taken;
  reg  [4:0]   prev_ghist_ras_idx;
  reg          prev_entry_cfi_idx_valid;
  reg  [2:0]   prev_entry_cfi_idx_bits;
  reg          prev_entry_cfi_taken;
  reg  [7:0]   prev_entry_br_mask;
  reg          prev_entry_cfi_is_call;
  reg          prev_entry_cfi_is_ret;
  reg  [39:0]  prev_pc;
  wire [7:0]   _GEN_0 = {5'h0, prev_entry_cfi_idx_bits};
  wire [7:0]   _new_ghist_T = prev_entry_br_mask >> _GEN_0;
  wire [7:0]   new_ghist_cfi_idx_oh = 8'h1 << _GEN_0;
  wire [6:0]   _GEN_1 = new_ghist_cfi_idx_oh[6:0] | new_ghist_cfi_idx_oh[7:1];
  wire [5:0]   _GEN_2 = _GEN_1[5:0] | new_ghist_cfi_idx_oh[7:2];
  wire [4:0]   _GEN_3 = _GEN_2[4:0] | new_ghist_cfi_idx_oh[7:3];
  wire [3:0]   _GEN_4 = _GEN_3[3:0] | new_ghist_cfi_idx_oh[7:4];
  wire [2:0]   _GEN_5 = _GEN_4[2:0] | new_ghist_cfi_idx_oh[7:5];
  wire [1:0]   _GEN_6 = _GEN_5[1:0] | new_ghist_cfi_idx_oh[7:6];
  wire [7:0]   _new_ghist_not_taken_branches_T_20 = prev_entry_cfi_idx_valid ? {&prev_entry_cfi_idx_bits, _GEN_1[6], _GEN_2[5], _GEN_3[4], _GEN_4[3], _GEN_5[2], _GEN_6[1], _GEN_6[0] | (&prev_entry_cfi_idx_bits)} & ~(_new_ghist_T[0] & prev_entry_cfi_taken ? new_ghist_cfi_idx_oh : 8'h0) : 8'hFF;
  wire         _new_ghist_new_history_new_saw_branch_taken_T_1 = prev_entry_cfi_idx_valid & prev_entry_cfi_taken;
  wire         new_ghist_cfi_in_bank_0 = _new_ghist_new_history_new_saw_branch_taken_T_1 & ~(prev_entry_cfi_idx_bits[2]);
  wire         new_ghist_ignore_second_bank = new_ghist_cfi_in_bank_0 | (&(prev_pc[5:3]));
  wire         new_ghist_first_bank_saw_not_taken = (|(prev_entry_br_mask[3:0] & _new_ghist_not_taken_branches_T_20[3:0])) | prev_ghist_current_saw_branch_not_taken;
  wire [63:0]  _GEN_7 = {prev_ghist_old_history[62:0], 1'h0};
  wire [63:0]  _GEN_8 = {prev_ghist_old_history[62:0], 1'h1};
  wire [63:0]  _new_ghist_new_history_old_history_T_4 = prev_ghist_new_saw_branch_taken ? _GEN_8 : prev_ghist_new_saw_branch_not_taken ? _GEN_7 : prev_ghist_old_history;
  wire [62:0]  _GEN_9 = {prev_ghist_old_history[61:0], 1'h0};
  wire [62:0]  _GEN_10 = {prev_ghist_old_history[61:0], 1'h1};
  wire [63:0]  _new_ghist_new_history_old_history_T_25 = _new_ghist_T[0] & new_ghist_cfi_in_bank_0 ? {prev_ghist_new_saw_branch_taken ? _GEN_10 : prev_ghist_new_saw_branch_not_taken ? _GEN_9 : prev_ghist_old_history[62:0], 1'h1} : new_ghist_first_bank_saw_not_taken ? {prev_ghist_new_saw_branch_taken ? _GEN_10 : prev_ghist_new_saw_branch_not_taken ? _GEN_9 : prev_ghist_old_history[62:0], 1'h0} : prev_ghist_new_saw_branch_taken ? _GEN_8 : prev_ghist_new_saw_branch_not_taken ? _GEN_7 : prev_ghist_old_history;
  wire         _new_ghist_new_history_ras_idx_T = prev_entry_cfi_idx_valid & prev_entry_cfi_is_call;
  wire [4:0]   _new_ghist_new_history_ras_idx_T_1 = prev_ghist_ras_idx + 5'h1;
  wire         _new_ghist_new_history_ras_idx_T_4 = prev_entry_cfi_idx_valid & prev_entry_cfi_is_ret;
  wire [4:0]   _new_ghist_new_history_ras_idx_T_5 = prev_ghist_ras_idx - 5'h1;
  assign ghist_1_MPORT_1_data_old_history = io_enq_bits_ghist_current_saw_branch_not_taken ? io_enq_bits_ghist_old_history : new_ghist_ignore_second_bank ? _new_ghist_new_history_old_history_T_4 : _new_ghist_new_history_old_history_T_25;
  assign ghist_1_MPORT_1_data_new_saw_branch_not_taken = io_enq_bits_ghist_current_saw_branch_not_taken ? io_enq_bits_ghist_new_saw_branch_not_taken : new_ghist_ignore_second_bank ? new_ghist_first_bank_saw_not_taken : (|(prev_entry_br_mask[7:4] & _new_ghist_not_taken_branches_T_20[7:4]));
  assign ghist_1_MPORT_1_data_new_saw_branch_taken = io_enq_bits_ghist_current_saw_branch_not_taken ? io_enq_bits_ghist_new_saw_branch_taken : new_ghist_ignore_second_bank ? _new_ghist_T[0] & new_ghist_cfi_in_bank_0 : _new_ghist_new_history_new_saw_branch_taken_T_1 & _new_ghist_T[0] & ~new_ghist_cfi_in_bank_0;
  assign ghist_1_MPORT_1_data_ras_idx = io_enq_bits_ghist_current_saw_branch_not_taken ? io_enq_bits_ghist_ras_idx : _new_ghist_new_history_ras_idx_T ? _new_ghist_new_history_ras_idx_T_1 : _new_ghist_new_history_ras_idx_T_4 ? _new_ghist_new_history_ras_idx_T_5 : prev_ghist_ras_idx;
  reg          first_empty;
  reg          io_ras_update_REG;
  reg  [39:0]  io_ras_update_pc_REG;
  reg  [4:0]   io_ras_update_idx_REG;
  reg          bpd_update_mispredict;
  reg          bpd_update_repair;
  reg  [5:0]   bpd_repair_idx;
  reg  [5:0]   bpd_end_idx;
  reg  [39:0]  bpd_repair_pc;
  wire [5:0]   _bpd_meta_T_1 = io_redirect_valid ? io_redirect_bits : bpd_update_repair | bpd_update_mispredict ? bpd_repair_idx : bpd_ptr;
  reg          bpd_entry_cfi_idx_valid;
  reg  [2:0]   bpd_entry_cfi_idx_bits;
  reg          bpd_entry_cfi_taken;
  reg          bpd_entry_cfi_mispredicted;
  reg  [2:0]   bpd_entry_cfi_type;
  reg  [7:0]   bpd_entry_br_mask;
  reg          casez_tmp;
  always @(*) begin
    casez (_bpd_meta_T_1)
      6'b000000:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b000001:
        casez_tmp = ram_1_cfi_idx_valid;
      6'b000010:
        casez_tmp = ram_2_cfi_idx_valid;
      6'b000011:
        casez_tmp = ram_3_cfi_idx_valid;
      6'b000100:
        casez_tmp = ram_4_cfi_idx_valid;
      6'b000101:
        casez_tmp = ram_5_cfi_idx_valid;
      6'b000110:
        casez_tmp = ram_6_cfi_idx_valid;
      6'b000111:
        casez_tmp = ram_7_cfi_idx_valid;
      6'b001000:
        casez_tmp = ram_8_cfi_idx_valid;
      6'b001001:
        casez_tmp = ram_9_cfi_idx_valid;
      6'b001010:
        casez_tmp = ram_10_cfi_idx_valid;
      6'b001011:
        casez_tmp = ram_11_cfi_idx_valid;
      6'b001100:
        casez_tmp = ram_12_cfi_idx_valid;
      6'b001101:
        casez_tmp = ram_13_cfi_idx_valid;
      6'b001110:
        casez_tmp = ram_14_cfi_idx_valid;
      6'b001111:
        casez_tmp = ram_15_cfi_idx_valid;
      6'b010000:
        casez_tmp = ram_16_cfi_idx_valid;
      6'b010001:
        casez_tmp = ram_17_cfi_idx_valid;
      6'b010010:
        casez_tmp = ram_18_cfi_idx_valid;
      6'b010011:
        casez_tmp = ram_19_cfi_idx_valid;
      6'b010100:
        casez_tmp = ram_20_cfi_idx_valid;
      6'b010101:
        casez_tmp = ram_21_cfi_idx_valid;
      6'b010110:
        casez_tmp = ram_22_cfi_idx_valid;
      6'b010111:
        casez_tmp = ram_23_cfi_idx_valid;
      6'b011000:
        casez_tmp = ram_24_cfi_idx_valid;
      6'b011001:
        casez_tmp = ram_25_cfi_idx_valid;
      6'b011010:
        casez_tmp = ram_26_cfi_idx_valid;
      6'b011011:
        casez_tmp = ram_27_cfi_idx_valid;
      6'b011100:
        casez_tmp = ram_28_cfi_idx_valid;
      6'b011101:
        casez_tmp = ram_29_cfi_idx_valid;
      6'b011110:
        casez_tmp = ram_30_cfi_idx_valid;
      6'b011111:
        casez_tmp = ram_31_cfi_idx_valid;
      6'b100000:
        casez_tmp = ram_32_cfi_idx_valid;
      6'b100001:
        casez_tmp = ram_33_cfi_idx_valid;
      6'b100010:
        casez_tmp = ram_34_cfi_idx_valid;
      6'b100011:
        casez_tmp = ram_35_cfi_idx_valid;
      6'b100100:
        casez_tmp = ram_36_cfi_idx_valid;
      6'b100101:
        casez_tmp = ram_37_cfi_idx_valid;
      6'b100110:
        casez_tmp = ram_38_cfi_idx_valid;
      6'b100111:
        casez_tmp = ram_39_cfi_idx_valid;
      6'b101000:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b101001:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b101010:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b101011:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b101100:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b101101:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b101110:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b101111:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b110000:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b110001:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b110010:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b110011:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b110100:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b110101:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b110110:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b110111:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b111000:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b111001:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b111010:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b111011:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b111100:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b111101:
        casez_tmp = ram_0_cfi_idx_valid;
      6'b111110:
        casez_tmp = ram_0_cfi_idx_valid;
      default:
        casez_tmp = ram_0_cfi_idx_valid;
    endcase
  end // always @(*)
  reg  [2:0]   casez_tmp_0;
  always @(*) begin
    casez (_bpd_meta_T_1)
      6'b000000:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b000001:
        casez_tmp_0 = ram_1_cfi_idx_bits;
      6'b000010:
        casez_tmp_0 = ram_2_cfi_idx_bits;
      6'b000011:
        casez_tmp_0 = ram_3_cfi_idx_bits;
      6'b000100:
        casez_tmp_0 = ram_4_cfi_idx_bits;
      6'b000101:
        casez_tmp_0 = ram_5_cfi_idx_bits;
      6'b000110:
        casez_tmp_0 = ram_6_cfi_idx_bits;
      6'b000111:
        casez_tmp_0 = ram_7_cfi_idx_bits;
      6'b001000:
        casez_tmp_0 = ram_8_cfi_idx_bits;
      6'b001001:
        casez_tmp_0 = ram_9_cfi_idx_bits;
      6'b001010:
        casez_tmp_0 = ram_10_cfi_idx_bits;
      6'b001011:
        casez_tmp_0 = ram_11_cfi_idx_bits;
      6'b001100:
        casez_tmp_0 = ram_12_cfi_idx_bits;
      6'b001101:
        casez_tmp_0 = ram_13_cfi_idx_bits;
      6'b001110:
        casez_tmp_0 = ram_14_cfi_idx_bits;
      6'b001111:
        casez_tmp_0 = ram_15_cfi_idx_bits;
      6'b010000:
        casez_tmp_0 = ram_16_cfi_idx_bits;
      6'b010001:
        casez_tmp_0 = ram_17_cfi_idx_bits;
      6'b010010:
        casez_tmp_0 = ram_18_cfi_idx_bits;
      6'b010011:
        casez_tmp_0 = ram_19_cfi_idx_bits;
      6'b010100:
        casez_tmp_0 = ram_20_cfi_idx_bits;
      6'b010101:
        casez_tmp_0 = ram_21_cfi_idx_bits;
      6'b010110:
        casez_tmp_0 = ram_22_cfi_idx_bits;
      6'b010111:
        casez_tmp_0 = ram_23_cfi_idx_bits;
      6'b011000:
        casez_tmp_0 = ram_24_cfi_idx_bits;
      6'b011001:
        casez_tmp_0 = ram_25_cfi_idx_bits;
      6'b011010:
        casez_tmp_0 = ram_26_cfi_idx_bits;
      6'b011011:
        casez_tmp_0 = ram_27_cfi_idx_bits;
      6'b011100:
        casez_tmp_0 = ram_28_cfi_idx_bits;
      6'b011101:
        casez_tmp_0 = ram_29_cfi_idx_bits;
      6'b011110:
        casez_tmp_0 = ram_30_cfi_idx_bits;
      6'b011111:
        casez_tmp_0 = ram_31_cfi_idx_bits;
      6'b100000:
        casez_tmp_0 = ram_32_cfi_idx_bits;
      6'b100001:
        casez_tmp_0 = ram_33_cfi_idx_bits;
      6'b100010:
        casez_tmp_0 = ram_34_cfi_idx_bits;
      6'b100011:
        casez_tmp_0 = ram_35_cfi_idx_bits;
      6'b100100:
        casez_tmp_0 = ram_36_cfi_idx_bits;
      6'b100101:
        casez_tmp_0 = ram_37_cfi_idx_bits;
      6'b100110:
        casez_tmp_0 = ram_38_cfi_idx_bits;
      6'b100111:
        casez_tmp_0 = ram_39_cfi_idx_bits;
      6'b101000:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b101001:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b101010:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b101011:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b101100:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b101101:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b101110:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b101111:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b110000:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b110001:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b110010:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b110011:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b110100:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b110101:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b110110:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b110111:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b111000:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b111001:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b111010:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b111011:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b111100:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b111101:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      6'b111110:
        casez_tmp_0 = ram_0_cfi_idx_bits;
      default:
        casez_tmp_0 = ram_0_cfi_idx_bits;
    endcase
  end // always @(*)
  reg          casez_tmp_1;
  always @(*) begin
    casez (_bpd_meta_T_1)
      6'b000000:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b000001:
        casez_tmp_1 = ram_1_cfi_taken;
      6'b000010:
        casez_tmp_1 = ram_2_cfi_taken;
      6'b000011:
        casez_tmp_1 = ram_3_cfi_taken;
      6'b000100:
        casez_tmp_1 = ram_4_cfi_taken;
      6'b000101:
        casez_tmp_1 = ram_5_cfi_taken;
      6'b000110:
        casez_tmp_1 = ram_6_cfi_taken;
      6'b000111:
        casez_tmp_1 = ram_7_cfi_taken;
      6'b001000:
        casez_tmp_1 = ram_8_cfi_taken;
      6'b001001:
        casez_tmp_1 = ram_9_cfi_taken;
      6'b001010:
        casez_tmp_1 = ram_10_cfi_taken;
      6'b001011:
        casez_tmp_1 = ram_11_cfi_taken;
      6'b001100:
        casez_tmp_1 = ram_12_cfi_taken;
      6'b001101:
        casez_tmp_1 = ram_13_cfi_taken;
      6'b001110:
        casez_tmp_1 = ram_14_cfi_taken;
      6'b001111:
        casez_tmp_1 = ram_15_cfi_taken;
      6'b010000:
        casez_tmp_1 = ram_16_cfi_taken;
      6'b010001:
        casez_tmp_1 = ram_17_cfi_taken;
      6'b010010:
        casez_tmp_1 = ram_18_cfi_taken;
      6'b010011:
        casez_tmp_1 = ram_19_cfi_taken;
      6'b010100:
        casez_tmp_1 = ram_20_cfi_taken;
      6'b010101:
        casez_tmp_1 = ram_21_cfi_taken;
      6'b010110:
        casez_tmp_1 = ram_22_cfi_taken;
      6'b010111:
        casez_tmp_1 = ram_23_cfi_taken;
      6'b011000:
        casez_tmp_1 = ram_24_cfi_taken;
      6'b011001:
        casez_tmp_1 = ram_25_cfi_taken;
      6'b011010:
        casez_tmp_1 = ram_26_cfi_taken;
      6'b011011:
        casez_tmp_1 = ram_27_cfi_taken;
      6'b011100:
        casez_tmp_1 = ram_28_cfi_taken;
      6'b011101:
        casez_tmp_1 = ram_29_cfi_taken;
      6'b011110:
        casez_tmp_1 = ram_30_cfi_taken;
      6'b011111:
        casez_tmp_1 = ram_31_cfi_taken;
      6'b100000:
        casez_tmp_1 = ram_32_cfi_taken;
      6'b100001:
        casez_tmp_1 = ram_33_cfi_taken;
      6'b100010:
        casez_tmp_1 = ram_34_cfi_taken;
      6'b100011:
        casez_tmp_1 = ram_35_cfi_taken;
      6'b100100:
        casez_tmp_1 = ram_36_cfi_taken;
      6'b100101:
        casez_tmp_1 = ram_37_cfi_taken;
      6'b100110:
        casez_tmp_1 = ram_38_cfi_taken;
      6'b100111:
        casez_tmp_1 = ram_39_cfi_taken;
      6'b101000:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b101001:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b101010:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b101011:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b101100:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b101101:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b101110:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b101111:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b110000:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b110001:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b110010:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b110011:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b110100:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b110101:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b110110:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b110111:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b111000:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b111001:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b111010:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b111011:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b111100:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b111101:
        casez_tmp_1 = ram_0_cfi_taken;
      6'b111110:
        casez_tmp_1 = ram_0_cfi_taken;
      default:
        casez_tmp_1 = ram_0_cfi_taken;
    endcase
  end // always @(*)
  reg          casez_tmp_2;
  always @(*) begin
    casez (_bpd_meta_T_1)
      6'b000000:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b000001:
        casez_tmp_2 = ram_1_cfi_mispredicted;
      6'b000010:
        casez_tmp_2 = ram_2_cfi_mispredicted;
      6'b000011:
        casez_tmp_2 = ram_3_cfi_mispredicted;
      6'b000100:
        casez_tmp_2 = ram_4_cfi_mispredicted;
      6'b000101:
        casez_tmp_2 = ram_5_cfi_mispredicted;
      6'b000110:
        casez_tmp_2 = ram_6_cfi_mispredicted;
      6'b000111:
        casez_tmp_2 = ram_7_cfi_mispredicted;
      6'b001000:
        casez_tmp_2 = ram_8_cfi_mispredicted;
      6'b001001:
        casez_tmp_2 = ram_9_cfi_mispredicted;
      6'b001010:
        casez_tmp_2 = ram_10_cfi_mispredicted;
      6'b001011:
        casez_tmp_2 = ram_11_cfi_mispredicted;
      6'b001100:
        casez_tmp_2 = ram_12_cfi_mispredicted;
      6'b001101:
        casez_tmp_2 = ram_13_cfi_mispredicted;
      6'b001110:
        casez_tmp_2 = ram_14_cfi_mispredicted;
      6'b001111:
        casez_tmp_2 = ram_15_cfi_mispredicted;
      6'b010000:
        casez_tmp_2 = ram_16_cfi_mispredicted;
      6'b010001:
        casez_tmp_2 = ram_17_cfi_mispredicted;
      6'b010010:
        casez_tmp_2 = ram_18_cfi_mispredicted;
      6'b010011:
        casez_tmp_2 = ram_19_cfi_mispredicted;
      6'b010100:
        casez_tmp_2 = ram_20_cfi_mispredicted;
      6'b010101:
        casez_tmp_2 = ram_21_cfi_mispredicted;
      6'b010110:
        casez_tmp_2 = ram_22_cfi_mispredicted;
      6'b010111:
        casez_tmp_2 = ram_23_cfi_mispredicted;
      6'b011000:
        casez_tmp_2 = ram_24_cfi_mispredicted;
      6'b011001:
        casez_tmp_2 = ram_25_cfi_mispredicted;
      6'b011010:
        casez_tmp_2 = ram_26_cfi_mispredicted;
      6'b011011:
        casez_tmp_2 = ram_27_cfi_mispredicted;
      6'b011100:
        casez_tmp_2 = ram_28_cfi_mispredicted;
      6'b011101:
        casez_tmp_2 = ram_29_cfi_mispredicted;
      6'b011110:
        casez_tmp_2 = ram_30_cfi_mispredicted;
      6'b011111:
        casez_tmp_2 = ram_31_cfi_mispredicted;
      6'b100000:
        casez_tmp_2 = ram_32_cfi_mispredicted;
      6'b100001:
        casez_tmp_2 = ram_33_cfi_mispredicted;
      6'b100010:
        casez_tmp_2 = ram_34_cfi_mispredicted;
      6'b100011:
        casez_tmp_2 = ram_35_cfi_mispredicted;
      6'b100100:
        casez_tmp_2 = ram_36_cfi_mispredicted;
      6'b100101:
        casez_tmp_2 = ram_37_cfi_mispredicted;
      6'b100110:
        casez_tmp_2 = ram_38_cfi_mispredicted;
      6'b100111:
        casez_tmp_2 = ram_39_cfi_mispredicted;
      6'b101000:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b101001:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b101010:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b101011:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b101100:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b101101:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b101110:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b101111:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b110000:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b110001:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b110010:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b110011:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b110100:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b110101:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b110110:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b110111:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b111000:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b111001:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b111010:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b111011:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b111100:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b111101:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      6'b111110:
        casez_tmp_2 = ram_0_cfi_mispredicted;
      default:
        casez_tmp_2 = ram_0_cfi_mispredicted;
    endcase
  end // always @(*)
  reg  [2:0]   casez_tmp_3;
  always @(*) begin
    casez (_bpd_meta_T_1)
      6'b000000:
        casez_tmp_3 = ram_0_cfi_type;
      6'b000001:
        casez_tmp_3 = ram_1_cfi_type;
      6'b000010:
        casez_tmp_3 = ram_2_cfi_type;
      6'b000011:
        casez_tmp_3 = ram_3_cfi_type;
      6'b000100:
        casez_tmp_3 = ram_4_cfi_type;
      6'b000101:
        casez_tmp_3 = ram_5_cfi_type;
      6'b000110:
        casez_tmp_3 = ram_6_cfi_type;
      6'b000111:
        casez_tmp_3 = ram_7_cfi_type;
      6'b001000:
        casez_tmp_3 = ram_8_cfi_type;
      6'b001001:
        casez_tmp_3 = ram_9_cfi_type;
      6'b001010:
        casez_tmp_3 = ram_10_cfi_type;
      6'b001011:
        casez_tmp_3 = ram_11_cfi_type;
      6'b001100:
        casez_tmp_3 = ram_12_cfi_type;
      6'b001101:
        casez_tmp_3 = ram_13_cfi_type;
      6'b001110:
        casez_tmp_3 = ram_14_cfi_type;
      6'b001111:
        casez_tmp_3 = ram_15_cfi_type;
      6'b010000:
        casez_tmp_3 = ram_16_cfi_type;
      6'b010001:
        casez_tmp_3 = ram_17_cfi_type;
      6'b010010:
        casez_tmp_3 = ram_18_cfi_type;
      6'b010011:
        casez_tmp_3 = ram_19_cfi_type;
      6'b010100:
        casez_tmp_3 = ram_20_cfi_type;
      6'b010101:
        casez_tmp_3 = ram_21_cfi_type;
      6'b010110:
        casez_tmp_3 = ram_22_cfi_type;
      6'b010111:
        casez_tmp_3 = ram_23_cfi_type;
      6'b011000:
        casez_tmp_3 = ram_24_cfi_type;
      6'b011001:
        casez_tmp_3 = ram_25_cfi_type;
      6'b011010:
        casez_tmp_3 = ram_26_cfi_type;
      6'b011011:
        casez_tmp_3 = ram_27_cfi_type;
      6'b011100:
        casez_tmp_3 = ram_28_cfi_type;
      6'b011101:
        casez_tmp_3 = ram_29_cfi_type;
      6'b011110:
        casez_tmp_3 = ram_30_cfi_type;
      6'b011111:
        casez_tmp_3 = ram_31_cfi_type;
      6'b100000:
        casez_tmp_3 = ram_32_cfi_type;
      6'b100001:
        casez_tmp_3 = ram_33_cfi_type;
      6'b100010:
        casez_tmp_3 = ram_34_cfi_type;
      6'b100011:
        casez_tmp_3 = ram_35_cfi_type;
      6'b100100:
        casez_tmp_3 = ram_36_cfi_type;
      6'b100101:
        casez_tmp_3 = ram_37_cfi_type;
      6'b100110:
        casez_tmp_3 = ram_38_cfi_type;
      6'b100111:
        casez_tmp_3 = ram_39_cfi_type;
      6'b101000:
        casez_tmp_3 = ram_0_cfi_type;
      6'b101001:
        casez_tmp_3 = ram_0_cfi_type;
      6'b101010:
        casez_tmp_3 = ram_0_cfi_type;
      6'b101011:
        casez_tmp_3 = ram_0_cfi_type;
      6'b101100:
        casez_tmp_3 = ram_0_cfi_type;
      6'b101101:
        casez_tmp_3 = ram_0_cfi_type;
      6'b101110:
        casez_tmp_3 = ram_0_cfi_type;
      6'b101111:
        casez_tmp_3 = ram_0_cfi_type;
      6'b110000:
        casez_tmp_3 = ram_0_cfi_type;
      6'b110001:
        casez_tmp_3 = ram_0_cfi_type;
      6'b110010:
        casez_tmp_3 = ram_0_cfi_type;
      6'b110011:
        casez_tmp_3 = ram_0_cfi_type;
      6'b110100:
        casez_tmp_3 = ram_0_cfi_type;
      6'b110101:
        casez_tmp_3 = ram_0_cfi_type;
      6'b110110:
        casez_tmp_3 = ram_0_cfi_type;
      6'b110111:
        casez_tmp_3 = ram_0_cfi_type;
      6'b111000:
        casez_tmp_3 = ram_0_cfi_type;
      6'b111001:
        casez_tmp_3 = ram_0_cfi_type;
      6'b111010:
        casez_tmp_3 = ram_0_cfi_type;
      6'b111011:
        casez_tmp_3 = ram_0_cfi_type;
      6'b111100:
        casez_tmp_3 = ram_0_cfi_type;
      6'b111101:
        casez_tmp_3 = ram_0_cfi_type;
      6'b111110:
        casez_tmp_3 = ram_0_cfi_type;
      default:
        casez_tmp_3 = ram_0_cfi_type;
    endcase
  end // always @(*)
  reg  [7:0]   casez_tmp_4;
  always @(*) begin
    casez (_bpd_meta_T_1)
      6'b000000:
        casez_tmp_4 = ram_0_br_mask;
      6'b000001:
        casez_tmp_4 = ram_1_br_mask;
      6'b000010:
        casez_tmp_4 = ram_2_br_mask;
      6'b000011:
        casez_tmp_4 = ram_3_br_mask;
      6'b000100:
        casez_tmp_4 = ram_4_br_mask;
      6'b000101:
        casez_tmp_4 = ram_5_br_mask;
      6'b000110:
        casez_tmp_4 = ram_6_br_mask;
      6'b000111:
        casez_tmp_4 = ram_7_br_mask;
      6'b001000:
        casez_tmp_4 = ram_8_br_mask;
      6'b001001:
        casez_tmp_4 = ram_9_br_mask;
      6'b001010:
        casez_tmp_4 = ram_10_br_mask;
      6'b001011:
        casez_tmp_4 = ram_11_br_mask;
      6'b001100:
        casez_tmp_4 = ram_12_br_mask;
      6'b001101:
        casez_tmp_4 = ram_13_br_mask;
      6'b001110:
        casez_tmp_4 = ram_14_br_mask;
      6'b001111:
        casez_tmp_4 = ram_15_br_mask;
      6'b010000:
        casez_tmp_4 = ram_16_br_mask;
      6'b010001:
        casez_tmp_4 = ram_17_br_mask;
      6'b010010:
        casez_tmp_4 = ram_18_br_mask;
      6'b010011:
        casez_tmp_4 = ram_19_br_mask;
      6'b010100:
        casez_tmp_4 = ram_20_br_mask;
      6'b010101:
        casez_tmp_4 = ram_21_br_mask;
      6'b010110:
        casez_tmp_4 = ram_22_br_mask;
      6'b010111:
        casez_tmp_4 = ram_23_br_mask;
      6'b011000:
        casez_tmp_4 = ram_24_br_mask;
      6'b011001:
        casez_tmp_4 = ram_25_br_mask;
      6'b011010:
        casez_tmp_4 = ram_26_br_mask;
      6'b011011:
        casez_tmp_4 = ram_27_br_mask;
      6'b011100:
        casez_tmp_4 = ram_28_br_mask;
      6'b011101:
        casez_tmp_4 = ram_29_br_mask;
      6'b011110:
        casez_tmp_4 = ram_30_br_mask;
      6'b011111:
        casez_tmp_4 = ram_31_br_mask;
      6'b100000:
        casez_tmp_4 = ram_32_br_mask;
      6'b100001:
        casez_tmp_4 = ram_33_br_mask;
      6'b100010:
        casez_tmp_4 = ram_34_br_mask;
      6'b100011:
        casez_tmp_4 = ram_35_br_mask;
      6'b100100:
        casez_tmp_4 = ram_36_br_mask;
      6'b100101:
        casez_tmp_4 = ram_37_br_mask;
      6'b100110:
        casez_tmp_4 = ram_38_br_mask;
      6'b100111:
        casez_tmp_4 = ram_39_br_mask;
      6'b101000:
        casez_tmp_4 = ram_0_br_mask;
      6'b101001:
        casez_tmp_4 = ram_0_br_mask;
      6'b101010:
        casez_tmp_4 = ram_0_br_mask;
      6'b101011:
        casez_tmp_4 = ram_0_br_mask;
      6'b101100:
        casez_tmp_4 = ram_0_br_mask;
      6'b101101:
        casez_tmp_4 = ram_0_br_mask;
      6'b101110:
        casez_tmp_4 = ram_0_br_mask;
      6'b101111:
        casez_tmp_4 = ram_0_br_mask;
      6'b110000:
        casez_tmp_4 = ram_0_br_mask;
      6'b110001:
        casez_tmp_4 = ram_0_br_mask;
      6'b110010:
        casez_tmp_4 = ram_0_br_mask;
      6'b110011:
        casez_tmp_4 = ram_0_br_mask;
      6'b110100:
        casez_tmp_4 = ram_0_br_mask;
      6'b110101:
        casez_tmp_4 = ram_0_br_mask;
      6'b110110:
        casez_tmp_4 = ram_0_br_mask;
      6'b110111:
        casez_tmp_4 = ram_0_br_mask;
      6'b111000:
        casez_tmp_4 = ram_0_br_mask;
      6'b111001:
        casez_tmp_4 = ram_0_br_mask;
      6'b111010:
        casez_tmp_4 = ram_0_br_mask;
      6'b111011:
        casez_tmp_4 = ram_0_br_mask;
      6'b111100:
        casez_tmp_4 = ram_0_br_mask;
      6'b111101:
        casez_tmp_4 = ram_0_br_mask;
      6'b111110:
        casez_tmp_4 = ram_0_br_mask;
      default:
        casez_tmp_4 = ram_0_br_mask;
    endcase
  end // always @(*)
  reg  [39:0]  bpd_pc;
  reg  [39:0]  casez_tmp_5;
  always @(*) begin
    casez (_bpd_meta_T_1)
      6'b000000:
        casez_tmp_5 = pcs_0;
      6'b000001:
        casez_tmp_5 = pcs_1;
      6'b000010:
        casez_tmp_5 = pcs_2;
      6'b000011:
        casez_tmp_5 = pcs_3;
      6'b000100:
        casez_tmp_5 = pcs_4;
      6'b000101:
        casez_tmp_5 = pcs_5;
      6'b000110:
        casez_tmp_5 = pcs_6;
      6'b000111:
        casez_tmp_5 = pcs_7;
      6'b001000:
        casez_tmp_5 = pcs_8;
      6'b001001:
        casez_tmp_5 = pcs_9;
      6'b001010:
        casez_tmp_5 = pcs_10;
      6'b001011:
        casez_tmp_5 = pcs_11;
      6'b001100:
        casez_tmp_5 = pcs_12;
      6'b001101:
        casez_tmp_5 = pcs_13;
      6'b001110:
        casez_tmp_5 = pcs_14;
      6'b001111:
        casez_tmp_5 = pcs_15;
      6'b010000:
        casez_tmp_5 = pcs_16;
      6'b010001:
        casez_tmp_5 = pcs_17;
      6'b010010:
        casez_tmp_5 = pcs_18;
      6'b010011:
        casez_tmp_5 = pcs_19;
      6'b010100:
        casez_tmp_5 = pcs_20;
      6'b010101:
        casez_tmp_5 = pcs_21;
      6'b010110:
        casez_tmp_5 = pcs_22;
      6'b010111:
        casez_tmp_5 = pcs_23;
      6'b011000:
        casez_tmp_5 = pcs_24;
      6'b011001:
        casez_tmp_5 = pcs_25;
      6'b011010:
        casez_tmp_5 = pcs_26;
      6'b011011:
        casez_tmp_5 = pcs_27;
      6'b011100:
        casez_tmp_5 = pcs_28;
      6'b011101:
        casez_tmp_5 = pcs_29;
      6'b011110:
        casez_tmp_5 = pcs_30;
      6'b011111:
        casez_tmp_5 = pcs_31;
      6'b100000:
        casez_tmp_5 = pcs_32;
      6'b100001:
        casez_tmp_5 = pcs_33;
      6'b100010:
        casez_tmp_5 = pcs_34;
      6'b100011:
        casez_tmp_5 = pcs_35;
      6'b100100:
        casez_tmp_5 = pcs_36;
      6'b100101:
        casez_tmp_5 = pcs_37;
      6'b100110:
        casez_tmp_5 = pcs_38;
      6'b100111:
        casez_tmp_5 = pcs_39;
      6'b101000:
        casez_tmp_5 = pcs_0;
      6'b101001:
        casez_tmp_5 = pcs_0;
      6'b101010:
        casez_tmp_5 = pcs_0;
      6'b101011:
        casez_tmp_5 = pcs_0;
      6'b101100:
        casez_tmp_5 = pcs_0;
      6'b101101:
        casez_tmp_5 = pcs_0;
      6'b101110:
        casez_tmp_5 = pcs_0;
      6'b101111:
        casez_tmp_5 = pcs_0;
      6'b110000:
        casez_tmp_5 = pcs_0;
      6'b110001:
        casez_tmp_5 = pcs_0;
      6'b110010:
        casez_tmp_5 = pcs_0;
      6'b110011:
        casez_tmp_5 = pcs_0;
      6'b110100:
        casez_tmp_5 = pcs_0;
      6'b110101:
        casez_tmp_5 = pcs_0;
      6'b110110:
        casez_tmp_5 = pcs_0;
      6'b110111:
        casez_tmp_5 = pcs_0;
      6'b111000:
        casez_tmp_5 = pcs_0;
      6'b111001:
        casez_tmp_5 = pcs_0;
      6'b111010:
        casez_tmp_5 = pcs_0;
      6'b111011:
        casez_tmp_5 = pcs_0;
      6'b111100:
        casez_tmp_5 = pcs_0;
      6'b111101:
        casez_tmp_5 = pcs_0;
      6'b111110:
        casez_tmp_5 = pcs_0;
      default:
        casez_tmp_5 = pcs_0;
    endcase
  end // always @(*)
  reg  [39:0]  bpd_target;
  reg  [39:0]  casez_tmp_6;
  always @(*) begin
    casez (_bpd_meta_T_1 == 6'h27 ? 6'h0 : _bpd_meta_T_1 + 6'h1)
      6'b000000:
        casez_tmp_6 = pcs_0;
      6'b000001:
        casez_tmp_6 = pcs_1;
      6'b000010:
        casez_tmp_6 = pcs_2;
      6'b000011:
        casez_tmp_6 = pcs_3;
      6'b000100:
        casez_tmp_6 = pcs_4;
      6'b000101:
        casez_tmp_6 = pcs_5;
      6'b000110:
        casez_tmp_6 = pcs_6;
      6'b000111:
        casez_tmp_6 = pcs_7;
      6'b001000:
        casez_tmp_6 = pcs_8;
      6'b001001:
        casez_tmp_6 = pcs_9;
      6'b001010:
        casez_tmp_6 = pcs_10;
      6'b001011:
        casez_tmp_6 = pcs_11;
      6'b001100:
        casez_tmp_6 = pcs_12;
      6'b001101:
        casez_tmp_6 = pcs_13;
      6'b001110:
        casez_tmp_6 = pcs_14;
      6'b001111:
        casez_tmp_6 = pcs_15;
      6'b010000:
        casez_tmp_6 = pcs_16;
      6'b010001:
        casez_tmp_6 = pcs_17;
      6'b010010:
        casez_tmp_6 = pcs_18;
      6'b010011:
        casez_tmp_6 = pcs_19;
      6'b010100:
        casez_tmp_6 = pcs_20;
      6'b010101:
        casez_tmp_6 = pcs_21;
      6'b010110:
        casez_tmp_6 = pcs_22;
      6'b010111:
        casez_tmp_6 = pcs_23;
      6'b011000:
        casez_tmp_6 = pcs_24;
      6'b011001:
        casez_tmp_6 = pcs_25;
      6'b011010:
        casez_tmp_6 = pcs_26;
      6'b011011:
        casez_tmp_6 = pcs_27;
      6'b011100:
        casez_tmp_6 = pcs_28;
      6'b011101:
        casez_tmp_6 = pcs_29;
      6'b011110:
        casez_tmp_6 = pcs_30;
      6'b011111:
        casez_tmp_6 = pcs_31;
      6'b100000:
        casez_tmp_6 = pcs_32;
      6'b100001:
        casez_tmp_6 = pcs_33;
      6'b100010:
        casez_tmp_6 = pcs_34;
      6'b100011:
        casez_tmp_6 = pcs_35;
      6'b100100:
        casez_tmp_6 = pcs_36;
      6'b100101:
        casez_tmp_6 = pcs_37;
      6'b100110:
        casez_tmp_6 = pcs_38;
      6'b100111:
        casez_tmp_6 = pcs_39;
      6'b101000:
        casez_tmp_6 = pcs_0;
      6'b101001:
        casez_tmp_6 = pcs_0;
      6'b101010:
        casez_tmp_6 = pcs_0;
      6'b101011:
        casez_tmp_6 = pcs_0;
      6'b101100:
        casez_tmp_6 = pcs_0;
      6'b101101:
        casez_tmp_6 = pcs_0;
      6'b101110:
        casez_tmp_6 = pcs_0;
      6'b101111:
        casez_tmp_6 = pcs_0;
      6'b110000:
        casez_tmp_6 = pcs_0;
      6'b110001:
        casez_tmp_6 = pcs_0;
      6'b110010:
        casez_tmp_6 = pcs_0;
      6'b110011:
        casez_tmp_6 = pcs_0;
      6'b110100:
        casez_tmp_6 = pcs_0;
      6'b110101:
        casez_tmp_6 = pcs_0;
      6'b110110:
        casez_tmp_6 = pcs_0;
      6'b110111:
        casez_tmp_6 = pcs_0;
      6'b111000:
        casez_tmp_6 = pcs_0;
      6'b111001:
        casez_tmp_6 = pcs_0;
      6'b111010:
        casez_tmp_6 = pcs_0;
      6'b111011:
        casez_tmp_6 = pcs_0;
      6'b111100:
        casez_tmp_6 = pcs_0;
      6'b111101:
        casez_tmp_6 = pcs_0;
      6'b111110:
        casez_tmp_6 = pcs_0;
      default:
        casez_tmp_6 = pcs_0;
    endcase
  end // always @(*)
  reg          REG;
  reg  [5:0]   bpd_repair_idx_REG;
  reg  [5:0]   bpd_end_idx_REG;
  reg          REG_1;
  reg          do_commit_update_REG;
  reg          REG_2;
  reg          io_bpdupdate_valid_REG;
  reg          io_bpdupdate_bits_is_mispredict_update_REG;
  reg          io_bpdupdate_bits_is_repair_update_REG;
  wire [7:0]   _GEN_11 = {5'h0, bpd_entry_cfi_idx_bits};
  wire [7:0]   _io_bpdupdate_bits_br_mask_T_1 = 8'h1 << _GEN_11;
  wire [6:0]   _GEN_12 = _io_bpdupdate_bits_br_mask_T_1[6:0] | _io_bpdupdate_bits_br_mask_T_1[7:1];
  wire [5:0]   _GEN_13 = _GEN_12[5:0] | _io_bpdupdate_bits_br_mask_T_1[7:2];
  wire [4:0]   _GEN_14 = _GEN_13[4:0] | _io_bpdupdate_bits_br_mask_T_1[7:3];
  wire [3:0]   _GEN_15 = _GEN_14[3:0] | _io_bpdupdate_bits_br_mask_T_1[7:4];
  wire [2:0]   _GEN_16 = _GEN_15[2:0] | _io_bpdupdate_bits_br_mask_T_1[7:5];
  wire [1:0]   _GEN_17 = _GEN_16[1:0] | _io_bpdupdate_bits_br_mask_T_1[7:6];
  wire [7:0]   _io_bpdupdate_bits_cfi_is_br_T = bpd_entry_br_mask >> _GEN_11;
  reg          casez_tmp_7;
  always @(*) begin
    casez (io_redirect_bits)
      6'b000000:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b000001:
        casez_tmp_7 = ram_1_cfi_idx_valid;
      6'b000010:
        casez_tmp_7 = ram_2_cfi_idx_valid;
      6'b000011:
        casez_tmp_7 = ram_3_cfi_idx_valid;
      6'b000100:
        casez_tmp_7 = ram_4_cfi_idx_valid;
      6'b000101:
        casez_tmp_7 = ram_5_cfi_idx_valid;
      6'b000110:
        casez_tmp_7 = ram_6_cfi_idx_valid;
      6'b000111:
        casez_tmp_7 = ram_7_cfi_idx_valid;
      6'b001000:
        casez_tmp_7 = ram_8_cfi_idx_valid;
      6'b001001:
        casez_tmp_7 = ram_9_cfi_idx_valid;
      6'b001010:
        casez_tmp_7 = ram_10_cfi_idx_valid;
      6'b001011:
        casez_tmp_7 = ram_11_cfi_idx_valid;
      6'b001100:
        casez_tmp_7 = ram_12_cfi_idx_valid;
      6'b001101:
        casez_tmp_7 = ram_13_cfi_idx_valid;
      6'b001110:
        casez_tmp_7 = ram_14_cfi_idx_valid;
      6'b001111:
        casez_tmp_7 = ram_15_cfi_idx_valid;
      6'b010000:
        casez_tmp_7 = ram_16_cfi_idx_valid;
      6'b010001:
        casez_tmp_7 = ram_17_cfi_idx_valid;
      6'b010010:
        casez_tmp_7 = ram_18_cfi_idx_valid;
      6'b010011:
        casez_tmp_7 = ram_19_cfi_idx_valid;
      6'b010100:
        casez_tmp_7 = ram_20_cfi_idx_valid;
      6'b010101:
        casez_tmp_7 = ram_21_cfi_idx_valid;
      6'b010110:
        casez_tmp_7 = ram_22_cfi_idx_valid;
      6'b010111:
        casez_tmp_7 = ram_23_cfi_idx_valid;
      6'b011000:
        casez_tmp_7 = ram_24_cfi_idx_valid;
      6'b011001:
        casez_tmp_7 = ram_25_cfi_idx_valid;
      6'b011010:
        casez_tmp_7 = ram_26_cfi_idx_valid;
      6'b011011:
        casez_tmp_7 = ram_27_cfi_idx_valid;
      6'b011100:
        casez_tmp_7 = ram_28_cfi_idx_valid;
      6'b011101:
        casez_tmp_7 = ram_29_cfi_idx_valid;
      6'b011110:
        casez_tmp_7 = ram_30_cfi_idx_valid;
      6'b011111:
        casez_tmp_7 = ram_31_cfi_idx_valid;
      6'b100000:
        casez_tmp_7 = ram_32_cfi_idx_valid;
      6'b100001:
        casez_tmp_7 = ram_33_cfi_idx_valid;
      6'b100010:
        casez_tmp_7 = ram_34_cfi_idx_valid;
      6'b100011:
        casez_tmp_7 = ram_35_cfi_idx_valid;
      6'b100100:
        casez_tmp_7 = ram_36_cfi_idx_valid;
      6'b100101:
        casez_tmp_7 = ram_37_cfi_idx_valid;
      6'b100110:
        casez_tmp_7 = ram_38_cfi_idx_valid;
      6'b100111:
        casez_tmp_7 = ram_39_cfi_idx_valid;
      6'b101000:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b101001:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b101010:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b101011:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b101100:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b101101:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b101110:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b101111:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b110000:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b110001:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b110010:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b110011:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b110100:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b110101:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b110110:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b110111:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b111000:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b111001:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b111010:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b111011:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b111100:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b111101:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      6'b111110:
        casez_tmp_7 = ram_0_cfi_idx_valid;
      default:
        casez_tmp_7 = ram_0_cfi_idx_valid;
    endcase
  end // always @(*)
  reg  [2:0]   casez_tmp_8;
  always @(*) begin
    casez (io_redirect_bits)
      6'b000000:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b000001:
        casez_tmp_8 = ram_1_cfi_idx_bits;
      6'b000010:
        casez_tmp_8 = ram_2_cfi_idx_bits;
      6'b000011:
        casez_tmp_8 = ram_3_cfi_idx_bits;
      6'b000100:
        casez_tmp_8 = ram_4_cfi_idx_bits;
      6'b000101:
        casez_tmp_8 = ram_5_cfi_idx_bits;
      6'b000110:
        casez_tmp_8 = ram_6_cfi_idx_bits;
      6'b000111:
        casez_tmp_8 = ram_7_cfi_idx_bits;
      6'b001000:
        casez_tmp_8 = ram_8_cfi_idx_bits;
      6'b001001:
        casez_tmp_8 = ram_9_cfi_idx_bits;
      6'b001010:
        casez_tmp_8 = ram_10_cfi_idx_bits;
      6'b001011:
        casez_tmp_8 = ram_11_cfi_idx_bits;
      6'b001100:
        casez_tmp_8 = ram_12_cfi_idx_bits;
      6'b001101:
        casez_tmp_8 = ram_13_cfi_idx_bits;
      6'b001110:
        casez_tmp_8 = ram_14_cfi_idx_bits;
      6'b001111:
        casez_tmp_8 = ram_15_cfi_idx_bits;
      6'b010000:
        casez_tmp_8 = ram_16_cfi_idx_bits;
      6'b010001:
        casez_tmp_8 = ram_17_cfi_idx_bits;
      6'b010010:
        casez_tmp_8 = ram_18_cfi_idx_bits;
      6'b010011:
        casez_tmp_8 = ram_19_cfi_idx_bits;
      6'b010100:
        casez_tmp_8 = ram_20_cfi_idx_bits;
      6'b010101:
        casez_tmp_8 = ram_21_cfi_idx_bits;
      6'b010110:
        casez_tmp_8 = ram_22_cfi_idx_bits;
      6'b010111:
        casez_tmp_8 = ram_23_cfi_idx_bits;
      6'b011000:
        casez_tmp_8 = ram_24_cfi_idx_bits;
      6'b011001:
        casez_tmp_8 = ram_25_cfi_idx_bits;
      6'b011010:
        casez_tmp_8 = ram_26_cfi_idx_bits;
      6'b011011:
        casez_tmp_8 = ram_27_cfi_idx_bits;
      6'b011100:
        casez_tmp_8 = ram_28_cfi_idx_bits;
      6'b011101:
        casez_tmp_8 = ram_29_cfi_idx_bits;
      6'b011110:
        casez_tmp_8 = ram_30_cfi_idx_bits;
      6'b011111:
        casez_tmp_8 = ram_31_cfi_idx_bits;
      6'b100000:
        casez_tmp_8 = ram_32_cfi_idx_bits;
      6'b100001:
        casez_tmp_8 = ram_33_cfi_idx_bits;
      6'b100010:
        casez_tmp_8 = ram_34_cfi_idx_bits;
      6'b100011:
        casez_tmp_8 = ram_35_cfi_idx_bits;
      6'b100100:
        casez_tmp_8 = ram_36_cfi_idx_bits;
      6'b100101:
        casez_tmp_8 = ram_37_cfi_idx_bits;
      6'b100110:
        casez_tmp_8 = ram_38_cfi_idx_bits;
      6'b100111:
        casez_tmp_8 = ram_39_cfi_idx_bits;
      6'b101000:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b101001:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b101010:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b101011:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b101100:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b101101:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b101110:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b101111:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b110000:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b110001:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b110010:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b110011:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b110100:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b110101:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b110110:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b110111:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b111000:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b111001:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b111010:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b111011:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b111100:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b111101:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      6'b111110:
        casez_tmp_8 = ram_0_cfi_idx_bits;
      default:
        casez_tmp_8 = ram_0_cfi_idx_bits;
    endcase
  end // always @(*)
  reg          casez_tmp_9;
  always @(*) begin
    casez (io_redirect_bits)
      6'b000000:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b000001:
        casez_tmp_9 = ram_1_cfi_taken;
      6'b000010:
        casez_tmp_9 = ram_2_cfi_taken;
      6'b000011:
        casez_tmp_9 = ram_3_cfi_taken;
      6'b000100:
        casez_tmp_9 = ram_4_cfi_taken;
      6'b000101:
        casez_tmp_9 = ram_5_cfi_taken;
      6'b000110:
        casez_tmp_9 = ram_6_cfi_taken;
      6'b000111:
        casez_tmp_9 = ram_7_cfi_taken;
      6'b001000:
        casez_tmp_9 = ram_8_cfi_taken;
      6'b001001:
        casez_tmp_9 = ram_9_cfi_taken;
      6'b001010:
        casez_tmp_9 = ram_10_cfi_taken;
      6'b001011:
        casez_tmp_9 = ram_11_cfi_taken;
      6'b001100:
        casez_tmp_9 = ram_12_cfi_taken;
      6'b001101:
        casez_tmp_9 = ram_13_cfi_taken;
      6'b001110:
        casez_tmp_9 = ram_14_cfi_taken;
      6'b001111:
        casez_tmp_9 = ram_15_cfi_taken;
      6'b010000:
        casez_tmp_9 = ram_16_cfi_taken;
      6'b010001:
        casez_tmp_9 = ram_17_cfi_taken;
      6'b010010:
        casez_tmp_9 = ram_18_cfi_taken;
      6'b010011:
        casez_tmp_9 = ram_19_cfi_taken;
      6'b010100:
        casez_tmp_9 = ram_20_cfi_taken;
      6'b010101:
        casez_tmp_9 = ram_21_cfi_taken;
      6'b010110:
        casez_tmp_9 = ram_22_cfi_taken;
      6'b010111:
        casez_tmp_9 = ram_23_cfi_taken;
      6'b011000:
        casez_tmp_9 = ram_24_cfi_taken;
      6'b011001:
        casez_tmp_9 = ram_25_cfi_taken;
      6'b011010:
        casez_tmp_9 = ram_26_cfi_taken;
      6'b011011:
        casez_tmp_9 = ram_27_cfi_taken;
      6'b011100:
        casez_tmp_9 = ram_28_cfi_taken;
      6'b011101:
        casez_tmp_9 = ram_29_cfi_taken;
      6'b011110:
        casez_tmp_9 = ram_30_cfi_taken;
      6'b011111:
        casez_tmp_9 = ram_31_cfi_taken;
      6'b100000:
        casez_tmp_9 = ram_32_cfi_taken;
      6'b100001:
        casez_tmp_9 = ram_33_cfi_taken;
      6'b100010:
        casez_tmp_9 = ram_34_cfi_taken;
      6'b100011:
        casez_tmp_9 = ram_35_cfi_taken;
      6'b100100:
        casez_tmp_9 = ram_36_cfi_taken;
      6'b100101:
        casez_tmp_9 = ram_37_cfi_taken;
      6'b100110:
        casez_tmp_9 = ram_38_cfi_taken;
      6'b100111:
        casez_tmp_9 = ram_39_cfi_taken;
      6'b101000:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b101001:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b101010:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b101011:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b101100:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b101101:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b101110:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b101111:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b110000:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b110001:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b110010:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b110011:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b110100:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b110101:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b110110:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b110111:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b111000:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b111001:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b111010:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b111011:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b111100:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b111101:
        casez_tmp_9 = ram_0_cfi_taken;
      6'b111110:
        casez_tmp_9 = ram_0_cfi_taken;
      default:
        casez_tmp_9 = ram_0_cfi_taken;
    endcase
  end // always @(*)
  reg          casez_tmp_10;
  always @(*) begin
    casez (io_redirect_bits)
      6'b000000:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b000001:
        casez_tmp_10 = ram_1_cfi_mispredicted;
      6'b000010:
        casez_tmp_10 = ram_2_cfi_mispredicted;
      6'b000011:
        casez_tmp_10 = ram_3_cfi_mispredicted;
      6'b000100:
        casez_tmp_10 = ram_4_cfi_mispredicted;
      6'b000101:
        casez_tmp_10 = ram_5_cfi_mispredicted;
      6'b000110:
        casez_tmp_10 = ram_6_cfi_mispredicted;
      6'b000111:
        casez_tmp_10 = ram_7_cfi_mispredicted;
      6'b001000:
        casez_tmp_10 = ram_8_cfi_mispredicted;
      6'b001001:
        casez_tmp_10 = ram_9_cfi_mispredicted;
      6'b001010:
        casez_tmp_10 = ram_10_cfi_mispredicted;
      6'b001011:
        casez_tmp_10 = ram_11_cfi_mispredicted;
      6'b001100:
        casez_tmp_10 = ram_12_cfi_mispredicted;
      6'b001101:
        casez_tmp_10 = ram_13_cfi_mispredicted;
      6'b001110:
        casez_tmp_10 = ram_14_cfi_mispredicted;
      6'b001111:
        casez_tmp_10 = ram_15_cfi_mispredicted;
      6'b010000:
        casez_tmp_10 = ram_16_cfi_mispredicted;
      6'b010001:
        casez_tmp_10 = ram_17_cfi_mispredicted;
      6'b010010:
        casez_tmp_10 = ram_18_cfi_mispredicted;
      6'b010011:
        casez_tmp_10 = ram_19_cfi_mispredicted;
      6'b010100:
        casez_tmp_10 = ram_20_cfi_mispredicted;
      6'b010101:
        casez_tmp_10 = ram_21_cfi_mispredicted;
      6'b010110:
        casez_tmp_10 = ram_22_cfi_mispredicted;
      6'b010111:
        casez_tmp_10 = ram_23_cfi_mispredicted;
      6'b011000:
        casez_tmp_10 = ram_24_cfi_mispredicted;
      6'b011001:
        casez_tmp_10 = ram_25_cfi_mispredicted;
      6'b011010:
        casez_tmp_10 = ram_26_cfi_mispredicted;
      6'b011011:
        casez_tmp_10 = ram_27_cfi_mispredicted;
      6'b011100:
        casez_tmp_10 = ram_28_cfi_mispredicted;
      6'b011101:
        casez_tmp_10 = ram_29_cfi_mispredicted;
      6'b011110:
        casez_tmp_10 = ram_30_cfi_mispredicted;
      6'b011111:
        casez_tmp_10 = ram_31_cfi_mispredicted;
      6'b100000:
        casez_tmp_10 = ram_32_cfi_mispredicted;
      6'b100001:
        casez_tmp_10 = ram_33_cfi_mispredicted;
      6'b100010:
        casez_tmp_10 = ram_34_cfi_mispredicted;
      6'b100011:
        casez_tmp_10 = ram_35_cfi_mispredicted;
      6'b100100:
        casez_tmp_10 = ram_36_cfi_mispredicted;
      6'b100101:
        casez_tmp_10 = ram_37_cfi_mispredicted;
      6'b100110:
        casez_tmp_10 = ram_38_cfi_mispredicted;
      6'b100111:
        casez_tmp_10 = ram_39_cfi_mispredicted;
      6'b101000:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b101001:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b101010:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b101011:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b101100:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b101101:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b101110:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b101111:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b110000:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b110001:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b110010:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b110011:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b110100:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b110101:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b110110:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b110111:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b111000:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b111001:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b111010:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b111011:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b111100:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b111101:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      6'b111110:
        casez_tmp_10 = ram_0_cfi_mispredicted;
      default:
        casez_tmp_10 = ram_0_cfi_mispredicted;
    endcase
  end // always @(*)
  reg  [2:0]   casez_tmp_11;
  always @(*) begin
    casez (io_redirect_bits)
      6'b000000:
        casez_tmp_11 = ram_0_cfi_type;
      6'b000001:
        casez_tmp_11 = ram_1_cfi_type;
      6'b000010:
        casez_tmp_11 = ram_2_cfi_type;
      6'b000011:
        casez_tmp_11 = ram_3_cfi_type;
      6'b000100:
        casez_tmp_11 = ram_4_cfi_type;
      6'b000101:
        casez_tmp_11 = ram_5_cfi_type;
      6'b000110:
        casez_tmp_11 = ram_6_cfi_type;
      6'b000111:
        casez_tmp_11 = ram_7_cfi_type;
      6'b001000:
        casez_tmp_11 = ram_8_cfi_type;
      6'b001001:
        casez_tmp_11 = ram_9_cfi_type;
      6'b001010:
        casez_tmp_11 = ram_10_cfi_type;
      6'b001011:
        casez_tmp_11 = ram_11_cfi_type;
      6'b001100:
        casez_tmp_11 = ram_12_cfi_type;
      6'b001101:
        casez_tmp_11 = ram_13_cfi_type;
      6'b001110:
        casez_tmp_11 = ram_14_cfi_type;
      6'b001111:
        casez_tmp_11 = ram_15_cfi_type;
      6'b010000:
        casez_tmp_11 = ram_16_cfi_type;
      6'b010001:
        casez_tmp_11 = ram_17_cfi_type;
      6'b010010:
        casez_tmp_11 = ram_18_cfi_type;
      6'b010011:
        casez_tmp_11 = ram_19_cfi_type;
      6'b010100:
        casez_tmp_11 = ram_20_cfi_type;
      6'b010101:
        casez_tmp_11 = ram_21_cfi_type;
      6'b010110:
        casez_tmp_11 = ram_22_cfi_type;
      6'b010111:
        casez_tmp_11 = ram_23_cfi_type;
      6'b011000:
        casez_tmp_11 = ram_24_cfi_type;
      6'b011001:
        casez_tmp_11 = ram_25_cfi_type;
      6'b011010:
        casez_tmp_11 = ram_26_cfi_type;
      6'b011011:
        casez_tmp_11 = ram_27_cfi_type;
      6'b011100:
        casez_tmp_11 = ram_28_cfi_type;
      6'b011101:
        casez_tmp_11 = ram_29_cfi_type;
      6'b011110:
        casez_tmp_11 = ram_30_cfi_type;
      6'b011111:
        casez_tmp_11 = ram_31_cfi_type;
      6'b100000:
        casez_tmp_11 = ram_32_cfi_type;
      6'b100001:
        casez_tmp_11 = ram_33_cfi_type;
      6'b100010:
        casez_tmp_11 = ram_34_cfi_type;
      6'b100011:
        casez_tmp_11 = ram_35_cfi_type;
      6'b100100:
        casez_tmp_11 = ram_36_cfi_type;
      6'b100101:
        casez_tmp_11 = ram_37_cfi_type;
      6'b100110:
        casez_tmp_11 = ram_38_cfi_type;
      6'b100111:
        casez_tmp_11 = ram_39_cfi_type;
      6'b101000:
        casez_tmp_11 = ram_0_cfi_type;
      6'b101001:
        casez_tmp_11 = ram_0_cfi_type;
      6'b101010:
        casez_tmp_11 = ram_0_cfi_type;
      6'b101011:
        casez_tmp_11 = ram_0_cfi_type;
      6'b101100:
        casez_tmp_11 = ram_0_cfi_type;
      6'b101101:
        casez_tmp_11 = ram_0_cfi_type;
      6'b101110:
        casez_tmp_11 = ram_0_cfi_type;
      6'b101111:
        casez_tmp_11 = ram_0_cfi_type;
      6'b110000:
        casez_tmp_11 = ram_0_cfi_type;
      6'b110001:
        casez_tmp_11 = ram_0_cfi_type;
      6'b110010:
        casez_tmp_11 = ram_0_cfi_type;
      6'b110011:
        casez_tmp_11 = ram_0_cfi_type;
      6'b110100:
        casez_tmp_11 = ram_0_cfi_type;
      6'b110101:
        casez_tmp_11 = ram_0_cfi_type;
      6'b110110:
        casez_tmp_11 = ram_0_cfi_type;
      6'b110111:
        casez_tmp_11 = ram_0_cfi_type;
      6'b111000:
        casez_tmp_11 = ram_0_cfi_type;
      6'b111001:
        casez_tmp_11 = ram_0_cfi_type;
      6'b111010:
        casez_tmp_11 = ram_0_cfi_type;
      6'b111011:
        casez_tmp_11 = ram_0_cfi_type;
      6'b111100:
        casez_tmp_11 = ram_0_cfi_type;
      6'b111101:
        casez_tmp_11 = ram_0_cfi_type;
      6'b111110:
        casez_tmp_11 = ram_0_cfi_type;
      default:
        casez_tmp_11 = ram_0_cfi_type;
    endcase
  end // always @(*)
  reg  [7:0]   casez_tmp_12;
  always @(*) begin
    casez (io_redirect_bits)
      6'b000000:
        casez_tmp_12 = ram_0_br_mask;
      6'b000001:
        casez_tmp_12 = ram_1_br_mask;
      6'b000010:
        casez_tmp_12 = ram_2_br_mask;
      6'b000011:
        casez_tmp_12 = ram_3_br_mask;
      6'b000100:
        casez_tmp_12 = ram_4_br_mask;
      6'b000101:
        casez_tmp_12 = ram_5_br_mask;
      6'b000110:
        casez_tmp_12 = ram_6_br_mask;
      6'b000111:
        casez_tmp_12 = ram_7_br_mask;
      6'b001000:
        casez_tmp_12 = ram_8_br_mask;
      6'b001001:
        casez_tmp_12 = ram_9_br_mask;
      6'b001010:
        casez_tmp_12 = ram_10_br_mask;
      6'b001011:
        casez_tmp_12 = ram_11_br_mask;
      6'b001100:
        casez_tmp_12 = ram_12_br_mask;
      6'b001101:
        casez_tmp_12 = ram_13_br_mask;
      6'b001110:
        casez_tmp_12 = ram_14_br_mask;
      6'b001111:
        casez_tmp_12 = ram_15_br_mask;
      6'b010000:
        casez_tmp_12 = ram_16_br_mask;
      6'b010001:
        casez_tmp_12 = ram_17_br_mask;
      6'b010010:
        casez_tmp_12 = ram_18_br_mask;
      6'b010011:
        casez_tmp_12 = ram_19_br_mask;
      6'b010100:
        casez_tmp_12 = ram_20_br_mask;
      6'b010101:
        casez_tmp_12 = ram_21_br_mask;
      6'b010110:
        casez_tmp_12 = ram_22_br_mask;
      6'b010111:
        casez_tmp_12 = ram_23_br_mask;
      6'b011000:
        casez_tmp_12 = ram_24_br_mask;
      6'b011001:
        casez_tmp_12 = ram_25_br_mask;
      6'b011010:
        casez_tmp_12 = ram_26_br_mask;
      6'b011011:
        casez_tmp_12 = ram_27_br_mask;
      6'b011100:
        casez_tmp_12 = ram_28_br_mask;
      6'b011101:
        casez_tmp_12 = ram_29_br_mask;
      6'b011110:
        casez_tmp_12 = ram_30_br_mask;
      6'b011111:
        casez_tmp_12 = ram_31_br_mask;
      6'b100000:
        casez_tmp_12 = ram_32_br_mask;
      6'b100001:
        casez_tmp_12 = ram_33_br_mask;
      6'b100010:
        casez_tmp_12 = ram_34_br_mask;
      6'b100011:
        casez_tmp_12 = ram_35_br_mask;
      6'b100100:
        casez_tmp_12 = ram_36_br_mask;
      6'b100101:
        casez_tmp_12 = ram_37_br_mask;
      6'b100110:
        casez_tmp_12 = ram_38_br_mask;
      6'b100111:
        casez_tmp_12 = ram_39_br_mask;
      6'b101000:
        casez_tmp_12 = ram_0_br_mask;
      6'b101001:
        casez_tmp_12 = ram_0_br_mask;
      6'b101010:
        casez_tmp_12 = ram_0_br_mask;
      6'b101011:
        casez_tmp_12 = ram_0_br_mask;
      6'b101100:
        casez_tmp_12 = ram_0_br_mask;
      6'b101101:
        casez_tmp_12 = ram_0_br_mask;
      6'b101110:
        casez_tmp_12 = ram_0_br_mask;
      6'b101111:
        casez_tmp_12 = ram_0_br_mask;
      6'b110000:
        casez_tmp_12 = ram_0_br_mask;
      6'b110001:
        casez_tmp_12 = ram_0_br_mask;
      6'b110010:
        casez_tmp_12 = ram_0_br_mask;
      6'b110011:
        casez_tmp_12 = ram_0_br_mask;
      6'b110100:
        casez_tmp_12 = ram_0_br_mask;
      6'b110101:
        casez_tmp_12 = ram_0_br_mask;
      6'b110110:
        casez_tmp_12 = ram_0_br_mask;
      6'b110111:
        casez_tmp_12 = ram_0_br_mask;
      6'b111000:
        casez_tmp_12 = ram_0_br_mask;
      6'b111001:
        casez_tmp_12 = ram_0_br_mask;
      6'b111010:
        casez_tmp_12 = ram_0_br_mask;
      6'b111011:
        casez_tmp_12 = ram_0_br_mask;
      6'b111100:
        casez_tmp_12 = ram_0_br_mask;
      6'b111101:
        casez_tmp_12 = ram_0_br_mask;
      6'b111110:
        casez_tmp_12 = ram_0_br_mask;
      default:
        casez_tmp_12 = ram_0_br_mask;
    endcase
  end // always @(*)
  reg          casez_tmp_13;
  always @(*) begin
    casez (io_redirect_bits)
      6'b000000:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b000001:
        casez_tmp_13 = ram_1_cfi_is_call;
      6'b000010:
        casez_tmp_13 = ram_2_cfi_is_call;
      6'b000011:
        casez_tmp_13 = ram_3_cfi_is_call;
      6'b000100:
        casez_tmp_13 = ram_4_cfi_is_call;
      6'b000101:
        casez_tmp_13 = ram_5_cfi_is_call;
      6'b000110:
        casez_tmp_13 = ram_6_cfi_is_call;
      6'b000111:
        casez_tmp_13 = ram_7_cfi_is_call;
      6'b001000:
        casez_tmp_13 = ram_8_cfi_is_call;
      6'b001001:
        casez_tmp_13 = ram_9_cfi_is_call;
      6'b001010:
        casez_tmp_13 = ram_10_cfi_is_call;
      6'b001011:
        casez_tmp_13 = ram_11_cfi_is_call;
      6'b001100:
        casez_tmp_13 = ram_12_cfi_is_call;
      6'b001101:
        casez_tmp_13 = ram_13_cfi_is_call;
      6'b001110:
        casez_tmp_13 = ram_14_cfi_is_call;
      6'b001111:
        casez_tmp_13 = ram_15_cfi_is_call;
      6'b010000:
        casez_tmp_13 = ram_16_cfi_is_call;
      6'b010001:
        casez_tmp_13 = ram_17_cfi_is_call;
      6'b010010:
        casez_tmp_13 = ram_18_cfi_is_call;
      6'b010011:
        casez_tmp_13 = ram_19_cfi_is_call;
      6'b010100:
        casez_tmp_13 = ram_20_cfi_is_call;
      6'b010101:
        casez_tmp_13 = ram_21_cfi_is_call;
      6'b010110:
        casez_tmp_13 = ram_22_cfi_is_call;
      6'b010111:
        casez_tmp_13 = ram_23_cfi_is_call;
      6'b011000:
        casez_tmp_13 = ram_24_cfi_is_call;
      6'b011001:
        casez_tmp_13 = ram_25_cfi_is_call;
      6'b011010:
        casez_tmp_13 = ram_26_cfi_is_call;
      6'b011011:
        casez_tmp_13 = ram_27_cfi_is_call;
      6'b011100:
        casez_tmp_13 = ram_28_cfi_is_call;
      6'b011101:
        casez_tmp_13 = ram_29_cfi_is_call;
      6'b011110:
        casez_tmp_13 = ram_30_cfi_is_call;
      6'b011111:
        casez_tmp_13 = ram_31_cfi_is_call;
      6'b100000:
        casez_tmp_13 = ram_32_cfi_is_call;
      6'b100001:
        casez_tmp_13 = ram_33_cfi_is_call;
      6'b100010:
        casez_tmp_13 = ram_34_cfi_is_call;
      6'b100011:
        casez_tmp_13 = ram_35_cfi_is_call;
      6'b100100:
        casez_tmp_13 = ram_36_cfi_is_call;
      6'b100101:
        casez_tmp_13 = ram_37_cfi_is_call;
      6'b100110:
        casez_tmp_13 = ram_38_cfi_is_call;
      6'b100111:
        casez_tmp_13 = ram_39_cfi_is_call;
      6'b101000:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b101001:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b101010:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b101011:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b101100:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b101101:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b101110:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b101111:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b110000:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b110001:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b110010:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b110011:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b110100:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b110101:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b110110:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b110111:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b111000:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b111001:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b111010:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b111011:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b111100:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b111101:
        casez_tmp_13 = ram_0_cfi_is_call;
      6'b111110:
        casez_tmp_13 = ram_0_cfi_is_call;
      default:
        casez_tmp_13 = ram_0_cfi_is_call;
    endcase
  end // always @(*)
  reg          casez_tmp_14;
  always @(*) begin
    casez (io_redirect_bits)
      6'b000000:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b000001:
        casez_tmp_14 = ram_1_cfi_is_ret;
      6'b000010:
        casez_tmp_14 = ram_2_cfi_is_ret;
      6'b000011:
        casez_tmp_14 = ram_3_cfi_is_ret;
      6'b000100:
        casez_tmp_14 = ram_4_cfi_is_ret;
      6'b000101:
        casez_tmp_14 = ram_5_cfi_is_ret;
      6'b000110:
        casez_tmp_14 = ram_6_cfi_is_ret;
      6'b000111:
        casez_tmp_14 = ram_7_cfi_is_ret;
      6'b001000:
        casez_tmp_14 = ram_8_cfi_is_ret;
      6'b001001:
        casez_tmp_14 = ram_9_cfi_is_ret;
      6'b001010:
        casez_tmp_14 = ram_10_cfi_is_ret;
      6'b001011:
        casez_tmp_14 = ram_11_cfi_is_ret;
      6'b001100:
        casez_tmp_14 = ram_12_cfi_is_ret;
      6'b001101:
        casez_tmp_14 = ram_13_cfi_is_ret;
      6'b001110:
        casez_tmp_14 = ram_14_cfi_is_ret;
      6'b001111:
        casez_tmp_14 = ram_15_cfi_is_ret;
      6'b010000:
        casez_tmp_14 = ram_16_cfi_is_ret;
      6'b010001:
        casez_tmp_14 = ram_17_cfi_is_ret;
      6'b010010:
        casez_tmp_14 = ram_18_cfi_is_ret;
      6'b010011:
        casez_tmp_14 = ram_19_cfi_is_ret;
      6'b010100:
        casez_tmp_14 = ram_20_cfi_is_ret;
      6'b010101:
        casez_tmp_14 = ram_21_cfi_is_ret;
      6'b010110:
        casez_tmp_14 = ram_22_cfi_is_ret;
      6'b010111:
        casez_tmp_14 = ram_23_cfi_is_ret;
      6'b011000:
        casez_tmp_14 = ram_24_cfi_is_ret;
      6'b011001:
        casez_tmp_14 = ram_25_cfi_is_ret;
      6'b011010:
        casez_tmp_14 = ram_26_cfi_is_ret;
      6'b011011:
        casez_tmp_14 = ram_27_cfi_is_ret;
      6'b011100:
        casez_tmp_14 = ram_28_cfi_is_ret;
      6'b011101:
        casez_tmp_14 = ram_29_cfi_is_ret;
      6'b011110:
        casez_tmp_14 = ram_30_cfi_is_ret;
      6'b011111:
        casez_tmp_14 = ram_31_cfi_is_ret;
      6'b100000:
        casez_tmp_14 = ram_32_cfi_is_ret;
      6'b100001:
        casez_tmp_14 = ram_33_cfi_is_ret;
      6'b100010:
        casez_tmp_14 = ram_34_cfi_is_ret;
      6'b100011:
        casez_tmp_14 = ram_35_cfi_is_ret;
      6'b100100:
        casez_tmp_14 = ram_36_cfi_is_ret;
      6'b100101:
        casez_tmp_14 = ram_37_cfi_is_ret;
      6'b100110:
        casez_tmp_14 = ram_38_cfi_is_ret;
      6'b100111:
        casez_tmp_14 = ram_39_cfi_is_ret;
      6'b101000:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b101001:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b101010:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b101011:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b101100:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b101101:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b101110:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b101111:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b110000:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b110001:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b110010:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b110011:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b110100:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b110101:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b110110:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b110111:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b111000:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b111001:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b111010:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b111011:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b111100:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b111101:
        casez_tmp_14 = ram_0_cfi_is_ret;
      6'b111110:
        casez_tmp_14 = ram_0_cfi_is_ret;
      default:
        casez_tmp_14 = ram_0_cfi_is_ret;
    endcase
  end // always @(*)
  reg  [39:0]  casez_tmp_15;
  always @(*) begin
    casez (io_redirect_bits)
      6'b000000:
        casez_tmp_15 = ram_0_ras_top;
      6'b000001:
        casez_tmp_15 = ram_1_ras_top;
      6'b000010:
        casez_tmp_15 = ram_2_ras_top;
      6'b000011:
        casez_tmp_15 = ram_3_ras_top;
      6'b000100:
        casez_tmp_15 = ram_4_ras_top;
      6'b000101:
        casez_tmp_15 = ram_5_ras_top;
      6'b000110:
        casez_tmp_15 = ram_6_ras_top;
      6'b000111:
        casez_tmp_15 = ram_7_ras_top;
      6'b001000:
        casez_tmp_15 = ram_8_ras_top;
      6'b001001:
        casez_tmp_15 = ram_9_ras_top;
      6'b001010:
        casez_tmp_15 = ram_10_ras_top;
      6'b001011:
        casez_tmp_15 = ram_11_ras_top;
      6'b001100:
        casez_tmp_15 = ram_12_ras_top;
      6'b001101:
        casez_tmp_15 = ram_13_ras_top;
      6'b001110:
        casez_tmp_15 = ram_14_ras_top;
      6'b001111:
        casez_tmp_15 = ram_15_ras_top;
      6'b010000:
        casez_tmp_15 = ram_16_ras_top;
      6'b010001:
        casez_tmp_15 = ram_17_ras_top;
      6'b010010:
        casez_tmp_15 = ram_18_ras_top;
      6'b010011:
        casez_tmp_15 = ram_19_ras_top;
      6'b010100:
        casez_tmp_15 = ram_20_ras_top;
      6'b010101:
        casez_tmp_15 = ram_21_ras_top;
      6'b010110:
        casez_tmp_15 = ram_22_ras_top;
      6'b010111:
        casez_tmp_15 = ram_23_ras_top;
      6'b011000:
        casez_tmp_15 = ram_24_ras_top;
      6'b011001:
        casez_tmp_15 = ram_25_ras_top;
      6'b011010:
        casez_tmp_15 = ram_26_ras_top;
      6'b011011:
        casez_tmp_15 = ram_27_ras_top;
      6'b011100:
        casez_tmp_15 = ram_28_ras_top;
      6'b011101:
        casez_tmp_15 = ram_29_ras_top;
      6'b011110:
        casez_tmp_15 = ram_30_ras_top;
      6'b011111:
        casez_tmp_15 = ram_31_ras_top;
      6'b100000:
        casez_tmp_15 = ram_32_ras_top;
      6'b100001:
        casez_tmp_15 = ram_33_ras_top;
      6'b100010:
        casez_tmp_15 = ram_34_ras_top;
      6'b100011:
        casez_tmp_15 = ram_35_ras_top;
      6'b100100:
        casez_tmp_15 = ram_36_ras_top;
      6'b100101:
        casez_tmp_15 = ram_37_ras_top;
      6'b100110:
        casez_tmp_15 = ram_38_ras_top;
      6'b100111:
        casez_tmp_15 = ram_39_ras_top;
      6'b101000:
        casez_tmp_15 = ram_0_ras_top;
      6'b101001:
        casez_tmp_15 = ram_0_ras_top;
      6'b101010:
        casez_tmp_15 = ram_0_ras_top;
      6'b101011:
        casez_tmp_15 = ram_0_ras_top;
      6'b101100:
        casez_tmp_15 = ram_0_ras_top;
      6'b101101:
        casez_tmp_15 = ram_0_ras_top;
      6'b101110:
        casez_tmp_15 = ram_0_ras_top;
      6'b101111:
        casez_tmp_15 = ram_0_ras_top;
      6'b110000:
        casez_tmp_15 = ram_0_ras_top;
      6'b110001:
        casez_tmp_15 = ram_0_ras_top;
      6'b110010:
        casez_tmp_15 = ram_0_ras_top;
      6'b110011:
        casez_tmp_15 = ram_0_ras_top;
      6'b110100:
        casez_tmp_15 = ram_0_ras_top;
      6'b110101:
        casez_tmp_15 = ram_0_ras_top;
      6'b110110:
        casez_tmp_15 = ram_0_ras_top;
      6'b110111:
        casez_tmp_15 = ram_0_ras_top;
      6'b111000:
        casez_tmp_15 = ram_0_ras_top;
      6'b111001:
        casez_tmp_15 = ram_0_ras_top;
      6'b111010:
        casez_tmp_15 = ram_0_ras_top;
      6'b111011:
        casez_tmp_15 = ram_0_ras_top;
      6'b111100:
        casez_tmp_15 = ram_0_ras_top;
      6'b111101:
        casez_tmp_15 = ram_0_ras_top;
      6'b111110:
        casez_tmp_15 = ram_0_ras_top;
      default:
        casez_tmp_15 = ram_0_ras_top;
    endcase
  end // always @(*)
  reg  [4:0]   casez_tmp_16;
  always @(*) begin
    casez (io_redirect_bits)
      6'b000000:
        casez_tmp_16 = ram_0_ras_idx;
      6'b000001:
        casez_tmp_16 = ram_1_ras_idx;
      6'b000010:
        casez_tmp_16 = ram_2_ras_idx;
      6'b000011:
        casez_tmp_16 = ram_3_ras_idx;
      6'b000100:
        casez_tmp_16 = ram_4_ras_idx;
      6'b000101:
        casez_tmp_16 = ram_5_ras_idx;
      6'b000110:
        casez_tmp_16 = ram_6_ras_idx;
      6'b000111:
        casez_tmp_16 = ram_7_ras_idx;
      6'b001000:
        casez_tmp_16 = ram_8_ras_idx;
      6'b001001:
        casez_tmp_16 = ram_9_ras_idx;
      6'b001010:
        casez_tmp_16 = ram_10_ras_idx;
      6'b001011:
        casez_tmp_16 = ram_11_ras_idx;
      6'b001100:
        casez_tmp_16 = ram_12_ras_idx;
      6'b001101:
        casez_tmp_16 = ram_13_ras_idx;
      6'b001110:
        casez_tmp_16 = ram_14_ras_idx;
      6'b001111:
        casez_tmp_16 = ram_15_ras_idx;
      6'b010000:
        casez_tmp_16 = ram_16_ras_idx;
      6'b010001:
        casez_tmp_16 = ram_17_ras_idx;
      6'b010010:
        casez_tmp_16 = ram_18_ras_idx;
      6'b010011:
        casez_tmp_16 = ram_19_ras_idx;
      6'b010100:
        casez_tmp_16 = ram_20_ras_idx;
      6'b010101:
        casez_tmp_16 = ram_21_ras_idx;
      6'b010110:
        casez_tmp_16 = ram_22_ras_idx;
      6'b010111:
        casez_tmp_16 = ram_23_ras_idx;
      6'b011000:
        casez_tmp_16 = ram_24_ras_idx;
      6'b011001:
        casez_tmp_16 = ram_25_ras_idx;
      6'b011010:
        casez_tmp_16 = ram_26_ras_idx;
      6'b011011:
        casez_tmp_16 = ram_27_ras_idx;
      6'b011100:
        casez_tmp_16 = ram_28_ras_idx;
      6'b011101:
        casez_tmp_16 = ram_29_ras_idx;
      6'b011110:
        casez_tmp_16 = ram_30_ras_idx;
      6'b011111:
        casez_tmp_16 = ram_31_ras_idx;
      6'b100000:
        casez_tmp_16 = ram_32_ras_idx;
      6'b100001:
        casez_tmp_16 = ram_33_ras_idx;
      6'b100010:
        casez_tmp_16 = ram_34_ras_idx;
      6'b100011:
        casez_tmp_16 = ram_35_ras_idx;
      6'b100100:
        casez_tmp_16 = ram_36_ras_idx;
      6'b100101:
        casez_tmp_16 = ram_37_ras_idx;
      6'b100110:
        casez_tmp_16 = ram_38_ras_idx;
      6'b100111:
        casez_tmp_16 = ram_39_ras_idx;
      6'b101000:
        casez_tmp_16 = ram_0_ras_idx;
      6'b101001:
        casez_tmp_16 = ram_0_ras_idx;
      6'b101010:
        casez_tmp_16 = ram_0_ras_idx;
      6'b101011:
        casez_tmp_16 = ram_0_ras_idx;
      6'b101100:
        casez_tmp_16 = ram_0_ras_idx;
      6'b101101:
        casez_tmp_16 = ram_0_ras_idx;
      6'b101110:
        casez_tmp_16 = ram_0_ras_idx;
      6'b101111:
        casez_tmp_16 = ram_0_ras_idx;
      6'b110000:
        casez_tmp_16 = ram_0_ras_idx;
      6'b110001:
        casez_tmp_16 = ram_0_ras_idx;
      6'b110010:
        casez_tmp_16 = ram_0_ras_idx;
      6'b110011:
        casez_tmp_16 = ram_0_ras_idx;
      6'b110100:
        casez_tmp_16 = ram_0_ras_idx;
      6'b110101:
        casez_tmp_16 = ram_0_ras_idx;
      6'b110110:
        casez_tmp_16 = ram_0_ras_idx;
      6'b110111:
        casez_tmp_16 = ram_0_ras_idx;
      6'b111000:
        casez_tmp_16 = ram_0_ras_idx;
      6'b111001:
        casez_tmp_16 = ram_0_ras_idx;
      6'b111010:
        casez_tmp_16 = ram_0_ras_idx;
      6'b111011:
        casez_tmp_16 = ram_0_ras_idx;
      6'b111100:
        casez_tmp_16 = ram_0_ras_idx;
      6'b111101:
        casez_tmp_16 = ram_0_ras_idx;
      6'b111110:
        casez_tmp_16 = ram_0_ras_idx;
      default:
        casez_tmp_16 = ram_0_ras_idx;
    endcase
  end // always @(*)
  reg          casez_tmp_17;
  always @(*) begin
    casez (io_redirect_bits)
      6'b000000:
        casez_tmp_17 = ram_0_start_bank;
      6'b000001:
        casez_tmp_17 = ram_1_start_bank;
      6'b000010:
        casez_tmp_17 = ram_2_start_bank;
      6'b000011:
        casez_tmp_17 = ram_3_start_bank;
      6'b000100:
        casez_tmp_17 = ram_4_start_bank;
      6'b000101:
        casez_tmp_17 = ram_5_start_bank;
      6'b000110:
        casez_tmp_17 = ram_6_start_bank;
      6'b000111:
        casez_tmp_17 = ram_7_start_bank;
      6'b001000:
        casez_tmp_17 = ram_8_start_bank;
      6'b001001:
        casez_tmp_17 = ram_9_start_bank;
      6'b001010:
        casez_tmp_17 = ram_10_start_bank;
      6'b001011:
        casez_tmp_17 = ram_11_start_bank;
      6'b001100:
        casez_tmp_17 = ram_12_start_bank;
      6'b001101:
        casez_tmp_17 = ram_13_start_bank;
      6'b001110:
        casez_tmp_17 = ram_14_start_bank;
      6'b001111:
        casez_tmp_17 = ram_15_start_bank;
      6'b010000:
        casez_tmp_17 = ram_16_start_bank;
      6'b010001:
        casez_tmp_17 = ram_17_start_bank;
      6'b010010:
        casez_tmp_17 = ram_18_start_bank;
      6'b010011:
        casez_tmp_17 = ram_19_start_bank;
      6'b010100:
        casez_tmp_17 = ram_20_start_bank;
      6'b010101:
        casez_tmp_17 = ram_21_start_bank;
      6'b010110:
        casez_tmp_17 = ram_22_start_bank;
      6'b010111:
        casez_tmp_17 = ram_23_start_bank;
      6'b011000:
        casez_tmp_17 = ram_24_start_bank;
      6'b011001:
        casez_tmp_17 = ram_25_start_bank;
      6'b011010:
        casez_tmp_17 = ram_26_start_bank;
      6'b011011:
        casez_tmp_17 = ram_27_start_bank;
      6'b011100:
        casez_tmp_17 = ram_28_start_bank;
      6'b011101:
        casez_tmp_17 = ram_29_start_bank;
      6'b011110:
        casez_tmp_17 = ram_30_start_bank;
      6'b011111:
        casez_tmp_17 = ram_31_start_bank;
      6'b100000:
        casez_tmp_17 = ram_32_start_bank;
      6'b100001:
        casez_tmp_17 = ram_33_start_bank;
      6'b100010:
        casez_tmp_17 = ram_34_start_bank;
      6'b100011:
        casez_tmp_17 = ram_35_start_bank;
      6'b100100:
        casez_tmp_17 = ram_36_start_bank;
      6'b100101:
        casez_tmp_17 = ram_37_start_bank;
      6'b100110:
        casez_tmp_17 = ram_38_start_bank;
      6'b100111:
        casez_tmp_17 = ram_39_start_bank;
      6'b101000:
        casez_tmp_17 = ram_0_start_bank;
      6'b101001:
        casez_tmp_17 = ram_0_start_bank;
      6'b101010:
        casez_tmp_17 = ram_0_start_bank;
      6'b101011:
        casez_tmp_17 = ram_0_start_bank;
      6'b101100:
        casez_tmp_17 = ram_0_start_bank;
      6'b101101:
        casez_tmp_17 = ram_0_start_bank;
      6'b101110:
        casez_tmp_17 = ram_0_start_bank;
      6'b101111:
        casez_tmp_17 = ram_0_start_bank;
      6'b110000:
        casez_tmp_17 = ram_0_start_bank;
      6'b110001:
        casez_tmp_17 = ram_0_start_bank;
      6'b110010:
        casez_tmp_17 = ram_0_start_bank;
      6'b110011:
        casez_tmp_17 = ram_0_start_bank;
      6'b110100:
        casez_tmp_17 = ram_0_start_bank;
      6'b110101:
        casez_tmp_17 = ram_0_start_bank;
      6'b110110:
        casez_tmp_17 = ram_0_start_bank;
      6'b110111:
        casez_tmp_17 = ram_0_start_bank;
      6'b111000:
        casez_tmp_17 = ram_0_start_bank;
      6'b111001:
        casez_tmp_17 = ram_0_start_bank;
      6'b111010:
        casez_tmp_17 = ram_0_start_bank;
      6'b111011:
        casez_tmp_17 = ram_0_start_bank;
      6'b111100:
        casez_tmp_17 = ram_0_start_bank;
      6'b111101:
        casez_tmp_17 = ram_0_start_bank;
      6'b111110:
        casez_tmp_17 = ram_0_start_bank;
      default:
        casez_tmp_17 = ram_0_start_bank;
    endcase
  end // always @(*)
  reg          REG_3;
  reg          prev_entry_REG_cfi_idx_valid;
  reg  [2:0]   prev_entry_REG_cfi_idx_bits;
  reg          prev_entry_REG_cfi_taken;
  reg  [7:0]   prev_entry_REG_br_mask;
  reg          prev_entry_REG_cfi_is_call;
  reg          prev_entry_REG_cfi_is_ret;
  reg  [5:0]   REG_4;
  reg          ram_REG_cfi_idx_valid;
  reg  [2:0]   ram_REG_cfi_idx_bits;
  reg          ram_REG_cfi_taken;
  reg          ram_REG_cfi_mispredicted;
  reg  [2:0]   ram_REG_cfi_type;
  reg  [7:0]   ram_REG_br_mask;
  reg          ram_REG_cfi_is_call;
  reg          ram_REG_cfi_is_ret;
  reg  [39:0]  ram_REG_ras_top;
  reg  [4:0]   ram_REG_ras_idx;
  reg          ram_REG_start_bank;
  wire [5:0]   next_idx = io_get_ftq_pc_0_ftq_idx == 6'h27 ? 6'h0 : io_get_ftq_pc_0_ftq_idx + 6'h1;
  reg  [39:0]  casez_tmp_18;
  always @(*) begin
    casez (next_idx)
      6'b000000:
        casez_tmp_18 = pcs_0;
      6'b000001:
        casez_tmp_18 = pcs_1;
      6'b000010:
        casez_tmp_18 = pcs_2;
      6'b000011:
        casez_tmp_18 = pcs_3;
      6'b000100:
        casez_tmp_18 = pcs_4;
      6'b000101:
        casez_tmp_18 = pcs_5;
      6'b000110:
        casez_tmp_18 = pcs_6;
      6'b000111:
        casez_tmp_18 = pcs_7;
      6'b001000:
        casez_tmp_18 = pcs_8;
      6'b001001:
        casez_tmp_18 = pcs_9;
      6'b001010:
        casez_tmp_18 = pcs_10;
      6'b001011:
        casez_tmp_18 = pcs_11;
      6'b001100:
        casez_tmp_18 = pcs_12;
      6'b001101:
        casez_tmp_18 = pcs_13;
      6'b001110:
        casez_tmp_18 = pcs_14;
      6'b001111:
        casez_tmp_18 = pcs_15;
      6'b010000:
        casez_tmp_18 = pcs_16;
      6'b010001:
        casez_tmp_18 = pcs_17;
      6'b010010:
        casez_tmp_18 = pcs_18;
      6'b010011:
        casez_tmp_18 = pcs_19;
      6'b010100:
        casez_tmp_18 = pcs_20;
      6'b010101:
        casez_tmp_18 = pcs_21;
      6'b010110:
        casez_tmp_18 = pcs_22;
      6'b010111:
        casez_tmp_18 = pcs_23;
      6'b011000:
        casez_tmp_18 = pcs_24;
      6'b011001:
        casez_tmp_18 = pcs_25;
      6'b011010:
        casez_tmp_18 = pcs_26;
      6'b011011:
        casez_tmp_18 = pcs_27;
      6'b011100:
        casez_tmp_18 = pcs_28;
      6'b011101:
        casez_tmp_18 = pcs_29;
      6'b011110:
        casez_tmp_18 = pcs_30;
      6'b011111:
        casez_tmp_18 = pcs_31;
      6'b100000:
        casez_tmp_18 = pcs_32;
      6'b100001:
        casez_tmp_18 = pcs_33;
      6'b100010:
        casez_tmp_18 = pcs_34;
      6'b100011:
        casez_tmp_18 = pcs_35;
      6'b100100:
        casez_tmp_18 = pcs_36;
      6'b100101:
        casez_tmp_18 = pcs_37;
      6'b100110:
        casez_tmp_18 = pcs_38;
      6'b100111:
        casez_tmp_18 = pcs_39;
      6'b101000:
        casez_tmp_18 = pcs_0;
      6'b101001:
        casez_tmp_18 = pcs_0;
      6'b101010:
        casez_tmp_18 = pcs_0;
      6'b101011:
        casez_tmp_18 = pcs_0;
      6'b101100:
        casez_tmp_18 = pcs_0;
      6'b101101:
        casez_tmp_18 = pcs_0;
      6'b101110:
        casez_tmp_18 = pcs_0;
      6'b101111:
        casez_tmp_18 = pcs_0;
      6'b110000:
        casez_tmp_18 = pcs_0;
      6'b110001:
        casez_tmp_18 = pcs_0;
      6'b110010:
        casez_tmp_18 = pcs_0;
      6'b110011:
        casez_tmp_18 = pcs_0;
      6'b110100:
        casez_tmp_18 = pcs_0;
      6'b110101:
        casez_tmp_18 = pcs_0;
      6'b110110:
        casez_tmp_18 = pcs_0;
      6'b110111:
        casez_tmp_18 = pcs_0;
      6'b111000:
        casez_tmp_18 = pcs_0;
      6'b111001:
        casez_tmp_18 = pcs_0;
      6'b111010:
        casez_tmp_18 = pcs_0;
      6'b111011:
        casez_tmp_18 = pcs_0;
      6'b111100:
        casez_tmp_18 = pcs_0;
      6'b111101:
        casez_tmp_18 = pcs_0;
      6'b111110:
        casez_tmp_18 = pcs_0;
      default:
        casez_tmp_18 = pcs_0;
    endcase
  end // always @(*)
  reg          io_get_ftq_pc_0_entry_REG_cfi_idx_valid;
  reg  [2:0]   io_get_ftq_pc_0_entry_REG_cfi_idx_bits;
  reg  [4:0]   io_get_ftq_pc_0_entry_REG_ras_idx;
  reg          io_get_ftq_pc_0_entry_REG_start_bank;
  reg          casez_tmp_19;
  always @(*) begin
    casez (io_get_ftq_pc_0_ftq_idx)
      6'b000000:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b000001:
        casez_tmp_19 = ram_1_cfi_idx_valid;
      6'b000010:
        casez_tmp_19 = ram_2_cfi_idx_valid;
      6'b000011:
        casez_tmp_19 = ram_3_cfi_idx_valid;
      6'b000100:
        casez_tmp_19 = ram_4_cfi_idx_valid;
      6'b000101:
        casez_tmp_19 = ram_5_cfi_idx_valid;
      6'b000110:
        casez_tmp_19 = ram_6_cfi_idx_valid;
      6'b000111:
        casez_tmp_19 = ram_7_cfi_idx_valid;
      6'b001000:
        casez_tmp_19 = ram_8_cfi_idx_valid;
      6'b001001:
        casez_tmp_19 = ram_9_cfi_idx_valid;
      6'b001010:
        casez_tmp_19 = ram_10_cfi_idx_valid;
      6'b001011:
        casez_tmp_19 = ram_11_cfi_idx_valid;
      6'b001100:
        casez_tmp_19 = ram_12_cfi_idx_valid;
      6'b001101:
        casez_tmp_19 = ram_13_cfi_idx_valid;
      6'b001110:
        casez_tmp_19 = ram_14_cfi_idx_valid;
      6'b001111:
        casez_tmp_19 = ram_15_cfi_idx_valid;
      6'b010000:
        casez_tmp_19 = ram_16_cfi_idx_valid;
      6'b010001:
        casez_tmp_19 = ram_17_cfi_idx_valid;
      6'b010010:
        casez_tmp_19 = ram_18_cfi_idx_valid;
      6'b010011:
        casez_tmp_19 = ram_19_cfi_idx_valid;
      6'b010100:
        casez_tmp_19 = ram_20_cfi_idx_valid;
      6'b010101:
        casez_tmp_19 = ram_21_cfi_idx_valid;
      6'b010110:
        casez_tmp_19 = ram_22_cfi_idx_valid;
      6'b010111:
        casez_tmp_19 = ram_23_cfi_idx_valid;
      6'b011000:
        casez_tmp_19 = ram_24_cfi_idx_valid;
      6'b011001:
        casez_tmp_19 = ram_25_cfi_idx_valid;
      6'b011010:
        casez_tmp_19 = ram_26_cfi_idx_valid;
      6'b011011:
        casez_tmp_19 = ram_27_cfi_idx_valid;
      6'b011100:
        casez_tmp_19 = ram_28_cfi_idx_valid;
      6'b011101:
        casez_tmp_19 = ram_29_cfi_idx_valid;
      6'b011110:
        casez_tmp_19 = ram_30_cfi_idx_valid;
      6'b011111:
        casez_tmp_19 = ram_31_cfi_idx_valid;
      6'b100000:
        casez_tmp_19 = ram_32_cfi_idx_valid;
      6'b100001:
        casez_tmp_19 = ram_33_cfi_idx_valid;
      6'b100010:
        casez_tmp_19 = ram_34_cfi_idx_valid;
      6'b100011:
        casez_tmp_19 = ram_35_cfi_idx_valid;
      6'b100100:
        casez_tmp_19 = ram_36_cfi_idx_valid;
      6'b100101:
        casez_tmp_19 = ram_37_cfi_idx_valid;
      6'b100110:
        casez_tmp_19 = ram_38_cfi_idx_valid;
      6'b100111:
        casez_tmp_19 = ram_39_cfi_idx_valid;
      6'b101000:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b101001:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b101010:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b101011:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b101100:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b101101:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b101110:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b101111:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b110000:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b110001:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b110010:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b110011:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b110100:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b110101:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b110110:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b110111:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b111000:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b111001:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b111010:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b111011:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b111100:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b111101:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      6'b111110:
        casez_tmp_19 = ram_0_cfi_idx_valid;
      default:
        casez_tmp_19 = ram_0_cfi_idx_valid;
    endcase
  end // always @(*)
  reg  [2:0]   casez_tmp_20;
  always @(*) begin
    casez (io_get_ftq_pc_0_ftq_idx)
      6'b000000:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b000001:
        casez_tmp_20 = ram_1_cfi_idx_bits;
      6'b000010:
        casez_tmp_20 = ram_2_cfi_idx_bits;
      6'b000011:
        casez_tmp_20 = ram_3_cfi_idx_bits;
      6'b000100:
        casez_tmp_20 = ram_4_cfi_idx_bits;
      6'b000101:
        casez_tmp_20 = ram_5_cfi_idx_bits;
      6'b000110:
        casez_tmp_20 = ram_6_cfi_idx_bits;
      6'b000111:
        casez_tmp_20 = ram_7_cfi_idx_bits;
      6'b001000:
        casez_tmp_20 = ram_8_cfi_idx_bits;
      6'b001001:
        casez_tmp_20 = ram_9_cfi_idx_bits;
      6'b001010:
        casez_tmp_20 = ram_10_cfi_idx_bits;
      6'b001011:
        casez_tmp_20 = ram_11_cfi_idx_bits;
      6'b001100:
        casez_tmp_20 = ram_12_cfi_idx_bits;
      6'b001101:
        casez_tmp_20 = ram_13_cfi_idx_bits;
      6'b001110:
        casez_tmp_20 = ram_14_cfi_idx_bits;
      6'b001111:
        casez_tmp_20 = ram_15_cfi_idx_bits;
      6'b010000:
        casez_tmp_20 = ram_16_cfi_idx_bits;
      6'b010001:
        casez_tmp_20 = ram_17_cfi_idx_bits;
      6'b010010:
        casez_tmp_20 = ram_18_cfi_idx_bits;
      6'b010011:
        casez_tmp_20 = ram_19_cfi_idx_bits;
      6'b010100:
        casez_tmp_20 = ram_20_cfi_idx_bits;
      6'b010101:
        casez_tmp_20 = ram_21_cfi_idx_bits;
      6'b010110:
        casez_tmp_20 = ram_22_cfi_idx_bits;
      6'b010111:
        casez_tmp_20 = ram_23_cfi_idx_bits;
      6'b011000:
        casez_tmp_20 = ram_24_cfi_idx_bits;
      6'b011001:
        casez_tmp_20 = ram_25_cfi_idx_bits;
      6'b011010:
        casez_tmp_20 = ram_26_cfi_idx_bits;
      6'b011011:
        casez_tmp_20 = ram_27_cfi_idx_bits;
      6'b011100:
        casez_tmp_20 = ram_28_cfi_idx_bits;
      6'b011101:
        casez_tmp_20 = ram_29_cfi_idx_bits;
      6'b011110:
        casez_tmp_20 = ram_30_cfi_idx_bits;
      6'b011111:
        casez_tmp_20 = ram_31_cfi_idx_bits;
      6'b100000:
        casez_tmp_20 = ram_32_cfi_idx_bits;
      6'b100001:
        casez_tmp_20 = ram_33_cfi_idx_bits;
      6'b100010:
        casez_tmp_20 = ram_34_cfi_idx_bits;
      6'b100011:
        casez_tmp_20 = ram_35_cfi_idx_bits;
      6'b100100:
        casez_tmp_20 = ram_36_cfi_idx_bits;
      6'b100101:
        casez_tmp_20 = ram_37_cfi_idx_bits;
      6'b100110:
        casez_tmp_20 = ram_38_cfi_idx_bits;
      6'b100111:
        casez_tmp_20 = ram_39_cfi_idx_bits;
      6'b101000:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b101001:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b101010:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b101011:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b101100:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b101101:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b101110:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b101111:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b110000:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b110001:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b110010:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b110011:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b110100:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b110101:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b110110:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b110111:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b111000:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b111001:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b111010:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b111011:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b111100:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b111101:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      6'b111110:
        casez_tmp_20 = ram_0_cfi_idx_bits;
      default:
        casez_tmp_20 = ram_0_cfi_idx_bits;
    endcase
  end // always @(*)
  reg  [4:0]   casez_tmp_21;
  always @(*) begin
    casez (io_get_ftq_pc_0_ftq_idx)
      6'b000000:
        casez_tmp_21 = ram_0_ras_idx;
      6'b000001:
        casez_tmp_21 = ram_1_ras_idx;
      6'b000010:
        casez_tmp_21 = ram_2_ras_idx;
      6'b000011:
        casez_tmp_21 = ram_3_ras_idx;
      6'b000100:
        casez_tmp_21 = ram_4_ras_idx;
      6'b000101:
        casez_tmp_21 = ram_5_ras_idx;
      6'b000110:
        casez_tmp_21 = ram_6_ras_idx;
      6'b000111:
        casez_tmp_21 = ram_7_ras_idx;
      6'b001000:
        casez_tmp_21 = ram_8_ras_idx;
      6'b001001:
        casez_tmp_21 = ram_9_ras_idx;
      6'b001010:
        casez_tmp_21 = ram_10_ras_idx;
      6'b001011:
        casez_tmp_21 = ram_11_ras_idx;
      6'b001100:
        casez_tmp_21 = ram_12_ras_idx;
      6'b001101:
        casez_tmp_21 = ram_13_ras_idx;
      6'b001110:
        casez_tmp_21 = ram_14_ras_idx;
      6'b001111:
        casez_tmp_21 = ram_15_ras_idx;
      6'b010000:
        casez_tmp_21 = ram_16_ras_idx;
      6'b010001:
        casez_tmp_21 = ram_17_ras_idx;
      6'b010010:
        casez_tmp_21 = ram_18_ras_idx;
      6'b010011:
        casez_tmp_21 = ram_19_ras_idx;
      6'b010100:
        casez_tmp_21 = ram_20_ras_idx;
      6'b010101:
        casez_tmp_21 = ram_21_ras_idx;
      6'b010110:
        casez_tmp_21 = ram_22_ras_idx;
      6'b010111:
        casez_tmp_21 = ram_23_ras_idx;
      6'b011000:
        casez_tmp_21 = ram_24_ras_idx;
      6'b011001:
        casez_tmp_21 = ram_25_ras_idx;
      6'b011010:
        casez_tmp_21 = ram_26_ras_idx;
      6'b011011:
        casez_tmp_21 = ram_27_ras_idx;
      6'b011100:
        casez_tmp_21 = ram_28_ras_idx;
      6'b011101:
        casez_tmp_21 = ram_29_ras_idx;
      6'b011110:
        casez_tmp_21 = ram_30_ras_idx;
      6'b011111:
        casez_tmp_21 = ram_31_ras_idx;
      6'b100000:
        casez_tmp_21 = ram_32_ras_idx;
      6'b100001:
        casez_tmp_21 = ram_33_ras_idx;
      6'b100010:
        casez_tmp_21 = ram_34_ras_idx;
      6'b100011:
        casez_tmp_21 = ram_35_ras_idx;
      6'b100100:
        casez_tmp_21 = ram_36_ras_idx;
      6'b100101:
        casez_tmp_21 = ram_37_ras_idx;
      6'b100110:
        casez_tmp_21 = ram_38_ras_idx;
      6'b100111:
        casez_tmp_21 = ram_39_ras_idx;
      6'b101000:
        casez_tmp_21 = ram_0_ras_idx;
      6'b101001:
        casez_tmp_21 = ram_0_ras_idx;
      6'b101010:
        casez_tmp_21 = ram_0_ras_idx;
      6'b101011:
        casez_tmp_21 = ram_0_ras_idx;
      6'b101100:
        casez_tmp_21 = ram_0_ras_idx;
      6'b101101:
        casez_tmp_21 = ram_0_ras_idx;
      6'b101110:
        casez_tmp_21 = ram_0_ras_idx;
      6'b101111:
        casez_tmp_21 = ram_0_ras_idx;
      6'b110000:
        casez_tmp_21 = ram_0_ras_idx;
      6'b110001:
        casez_tmp_21 = ram_0_ras_idx;
      6'b110010:
        casez_tmp_21 = ram_0_ras_idx;
      6'b110011:
        casez_tmp_21 = ram_0_ras_idx;
      6'b110100:
        casez_tmp_21 = ram_0_ras_idx;
      6'b110101:
        casez_tmp_21 = ram_0_ras_idx;
      6'b110110:
        casez_tmp_21 = ram_0_ras_idx;
      6'b110111:
        casez_tmp_21 = ram_0_ras_idx;
      6'b111000:
        casez_tmp_21 = ram_0_ras_idx;
      6'b111001:
        casez_tmp_21 = ram_0_ras_idx;
      6'b111010:
        casez_tmp_21 = ram_0_ras_idx;
      6'b111011:
        casez_tmp_21 = ram_0_ras_idx;
      6'b111100:
        casez_tmp_21 = ram_0_ras_idx;
      6'b111101:
        casez_tmp_21 = ram_0_ras_idx;
      6'b111110:
        casez_tmp_21 = ram_0_ras_idx;
      default:
        casez_tmp_21 = ram_0_ras_idx;
    endcase
  end // always @(*)
  reg          casez_tmp_22;
  always @(*) begin
    casez (io_get_ftq_pc_0_ftq_idx)
      6'b000000:
        casez_tmp_22 = ram_0_start_bank;
      6'b000001:
        casez_tmp_22 = ram_1_start_bank;
      6'b000010:
        casez_tmp_22 = ram_2_start_bank;
      6'b000011:
        casez_tmp_22 = ram_3_start_bank;
      6'b000100:
        casez_tmp_22 = ram_4_start_bank;
      6'b000101:
        casez_tmp_22 = ram_5_start_bank;
      6'b000110:
        casez_tmp_22 = ram_6_start_bank;
      6'b000111:
        casez_tmp_22 = ram_7_start_bank;
      6'b001000:
        casez_tmp_22 = ram_8_start_bank;
      6'b001001:
        casez_tmp_22 = ram_9_start_bank;
      6'b001010:
        casez_tmp_22 = ram_10_start_bank;
      6'b001011:
        casez_tmp_22 = ram_11_start_bank;
      6'b001100:
        casez_tmp_22 = ram_12_start_bank;
      6'b001101:
        casez_tmp_22 = ram_13_start_bank;
      6'b001110:
        casez_tmp_22 = ram_14_start_bank;
      6'b001111:
        casez_tmp_22 = ram_15_start_bank;
      6'b010000:
        casez_tmp_22 = ram_16_start_bank;
      6'b010001:
        casez_tmp_22 = ram_17_start_bank;
      6'b010010:
        casez_tmp_22 = ram_18_start_bank;
      6'b010011:
        casez_tmp_22 = ram_19_start_bank;
      6'b010100:
        casez_tmp_22 = ram_20_start_bank;
      6'b010101:
        casez_tmp_22 = ram_21_start_bank;
      6'b010110:
        casez_tmp_22 = ram_22_start_bank;
      6'b010111:
        casez_tmp_22 = ram_23_start_bank;
      6'b011000:
        casez_tmp_22 = ram_24_start_bank;
      6'b011001:
        casez_tmp_22 = ram_25_start_bank;
      6'b011010:
        casez_tmp_22 = ram_26_start_bank;
      6'b011011:
        casez_tmp_22 = ram_27_start_bank;
      6'b011100:
        casez_tmp_22 = ram_28_start_bank;
      6'b011101:
        casez_tmp_22 = ram_29_start_bank;
      6'b011110:
        casez_tmp_22 = ram_30_start_bank;
      6'b011111:
        casez_tmp_22 = ram_31_start_bank;
      6'b100000:
        casez_tmp_22 = ram_32_start_bank;
      6'b100001:
        casez_tmp_22 = ram_33_start_bank;
      6'b100010:
        casez_tmp_22 = ram_34_start_bank;
      6'b100011:
        casez_tmp_22 = ram_35_start_bank;
      6'b100100:
        casez_tmp_22 = ram_36_start_bank;
      6'b100101:
        casez_tmp_22 = ram_37_start_bank;
      6'b100110:
        casez_tmp_22 = ram_38_start_bank;
      6'b100111:
        casez_tmp_22 = ram_39_start_bank;
      6'b101000:
        casez_tmp_22 = ram_0_start_bank;
      6'b101001:
        casez_tmp_22 = ram_0_start_bank;
      6'b101010:
        casez_tmp_22 = ram_0_start_bank;
      6'b101011:
        casez_tmp_22 = ram_0_start_bank;
      6'b101100:
        casez_tmp_22 = ram_0_start_bank;
      6'b101101:
        casez_tmp_22 = ram_0_start_bank;
      6'b101110:
        casez_tmp_22 = ram_0_start_bank;
      6'b101111:
        casez_tmp_22 = ram_0_start_bank;
      6'b110000:
        casez_tmp_22 = ram_0_start_bank;
      6'b110001:
        casez_tmp_22 = ram_0_start_bank;
      6'b110010:
        casez_tmp_22 = ram_0_start_bank;
      6'b110011:
        casez_tmp_22 = ram_0_start_bank;
      6'b110100:
        casez_tmp_22 = ram_0_start_bank;
      6'b110101:
        casez_tmp_22 = ram_0_start_bank;
      6'b110110:
        casez_tmp_22 = ram_0_start_bank;
      6'b110111:
        casez_tmp_22 = ram_0_start_bank;
      6'b111000:
        casez_tmp_22 = ram_0_start_bank;
      6'b111001:
        casez_tmp_22 = ram_0_start_bank;
      6'b111010:
        casez_tmp_22 = ram_0_start_bank;
      6'b111011:
        casez_tmp_22 = ram_0_start_bank;
      6'b111100:
        casez_tmp_22 = ram_0_start_bank;
      6'b111101:
        casez_tmp_22 = ram_0_start_bank;
      6'b111110:
        casez_tmp_22 = ram_0_start_bank;
      default:
        casez_tmp_22 = ram_0_start_bank;
    endcase
  end // always @(*)
  reg  [39:0]  io_get_ftq_pc_0_pc_REG;
  reg  [39:0]  casez_tmp_23;
  always @(*) begin
    casez (io_get_ftq_pc_0_ftq_idx)
      6'b000000:
        casez_tmp_23 = pcs_0;
      6'b000001:
        casez_tmp_23 = pcs_1;
      6'b000010:
        casez_tmp_23 = pcs_2;
      6'b000011:
        casez_tmp_23 = pcs_3;
      6'b000100:
        casez_tmp_23 = pcs_4;
      6'b000101:
        casez_tmp_23 = pcs_5;
      6'b000110:
        casez_tmp_23 = pcs_6;
      6'b000111:
        casez_tmp_23 = pcs_7;
      6'b001000:
        casez_tmp_23 = pcs_8;
      6'b001001:
        casez_tmp_23 = pcs_9;
      6'b001010:
        casez_tmp_23 = pcs_10;
      6'b001011:
        casez_tmp_23 = pcs_11;
      6'b001100:
        casez_tmp_23 = pcs_12;
      6'b001101:
        casez_tmp_23 = pcs_13;
      6'b001110:
        casez_tmp_23 = pcs_14;
      6'b001111:
        casez_tmp_23 = pcs_15;
      6'b010000:
        casez_tmp_23 = pcs_16;
      6'b010001:
        casez_tmp_23 = pcs_17;
      6'b010010:
        casez_tmp_23 = pcs_18;
      6'b010011:
        casez_tmp_23 = pcs_19;
      6'b010100:
        casez_tmp_23 = pcs_20;
      6'b010101:
        casez_tmp_23 = pcs_21;
      6'b010110:
        casez_tmp_23 = pcs_22;
      6'b010111:
        casez_tmp_23 = pcs_23;
      6'b011000:
        casez_tmp_23 = pcs_24;
      6'b011001:
        casez_tmp_23 = pcs_25;
      6'b011010:
        casez_tmp_23 = pcs_26;
      6'b011011:
        casez_tmp_23 = pcs_27;
      6'b011100:
        casez_tmp_23 = pcs_28;
      6'b011101:
        casez_tmp_23 = pcs_29;
      6'b011110:
        casez_tmp_23 = pcs_30;
      6'b011111:
        casez_tmp_23 = pcs_31;
      6'b100000:
        casez_tmp_23 = pcs_32;
      6'b100001:
        casez_tmp_23 = pcs_33;
      6'b100010:
        casez_tmp_23 = pcs_34;
      6'b100011:
        casez_tmp_23 = pcs_35;
      6'b100100:
        casez_tmp_23 = pcs_36;
      6'b100101:
        casez_tmp_23 = pcs_37;
      6'b100110:
        casez_tmp_23 = pcs_38;
      6'b100111:
        casez_tmp_23 = pcs_39;
      6'b101000:
        casez_tmp_23 = pcs_0;
      6'b101001:
        casez_tmp_23 = pcs_0;
      6'b101010:
        casez_tmp_23 = pcs_0;
      6'b101011:
        casez_tmp_23 = pcs_0;
      6'b101100:
        casez_tmp_23 = pcs_0;
      6'b101101:
        casez_tmp_23 = pcs_0;
      6'b101110:
        casez_tmp_23 = pcs_0;
      6'b101111:
        casez_tmp_23 = pcs_0;
      6'b110000:
        casez_tmp_23 = pcs_0;
      6'b110001:
        casez_tmp_23 = pcs_0;
      6'b110010:
        casez_tmp_23 = pcs_0;
      6'b110011:
        casez_tmp_23 = pcs_0;
      6'b110100:
        casez_tmp_23 = pcs_0;
      6'b110101:
        casez_tmp_23 = pcs_0;
      6'b110110:
        casez_tmp_23 = pcs_0;
      6'b110111:
        casez_tmp_23 = pcs_0;
      6'b111000:
        casez_tmp_23 = pcs_0;
      6'b111001:
        casez_tmp_23 = pcs_0;
      6'b111010:
        casez_tmp_23 = pcs_0;
      6'b111011:
        casez_tmp_23 = pcs_0;
      6'b111100:
        casez_tmp_23 = pcs_0;
      6'b111101:
        casez_tmp_23 = pcs_0;
      6'b111110:
        casez_tmp_23 = pcs_0;
      default:
        casez_tmp_23 = pcs_0;
    endcase
  end // always @(*)
  reg  [39:0]  io_get_ftq_pc_0_next_pc_REG;
  reg          io_get_ftq_pc_0_next_val_REG;
  reg  [39:0]  io_get_ftq_pc_0_com_pc_REG;
  reg  [39:0]  casez_tmp_24;
  always @(*) begin
    casez (io_deq_valid ? io_deq_bits : deq_ptr)
      6'b000000:
        casez_tmp_24 = pcs_0;
      6'b000001:
        casez_tmp_24 = pcs_1;
      6'b000010:
        casez_tmp_24 = pcs_2;
      6'b000011:
        casez_tmp_24 = pcs_3;
      6'b000100:
        casez_tmp_24 = pcs_4;
      6'b000101:
        casez_tmp_24 = pcs_5;
      6'b000110:
        casez_tmp_24 = pcs_6;
      6'b000111:
        casez_tmp_24 = pcs_7;
      6'b001000:
        casez_tmp_24 = pcs_8;
      6'b001001:
        casez_tmp_24 = pcs_9;
      6'b001010:
        casez_tmp_24 = pcs_10;
      6'b001011:
        casez_tmp_24 = pcs_11;
      6'b001100:
        casez_tmp_24 = pcs_12;
      6'b001101:
        casez_tmp_24 = pcs_13;
      6'b001110:
        casez_tmp_24 = pcs_14;
      6'b001111:
        casez_tmp_24 = pcs_15;
      6'b010000:
        casez_tmp_24 = pcs_16;
      6'b010001:
        casez_tmp_24 = pcs_17;
      6'b010010:
        casez_tmp_24 = pcs_18;
      6'b010011:
        casez_tmp_24 = pcs_19;
      6'b010100:
        casez_tmp_24 = pcs_20;
      6'b010101:
        casez_tmp_24 = pcs_21;
      6'b010110:
        casez_tmp_24 = pcs_22;
      6'b010111:
        casez_tmp_24 = pcs_23;
      6'b011000:
        casez_tmp_24 = pcs_24;
      6'b011001:
        casez_tmp_24 = pcs_25;
      6'b011010:
        casez_tmp_24 = pcs_26;
      6'b011011:
        casez_tmp_24 = pcs_27;
      6'b011100:
        casez_tmp_24 = pcs_28;
      6'b011101:
        casez_tmp_24 = pcs_29;
      6'b011110:
        casez_tmp_24 = pcs_30;
      6'b011111:
        casez_tmp_24 = pcs_31;
      6'b100000:
        casez_tmp_24 = pcs_32;
      6'b100001:
        casez_tmp_24 = pcs_33;
      6'b100010:
        casez_tmp_24 = pcs_34;
      6'b100011:
        casez_tmp_24 = pcs_35;
      6'b100100:
        casez_tmp_24 = pcs_36;
      6'b100101:
        casez_tmp_24 = pcs_37;
      6'b100110:
        casez_tmp_24 = pcs_38;
      6'b100111:
        casez_tmp_24 = pcs_39;
      6'b101000:
        casez_tmp_24 = pcs_0;
      6'b101001:
        casez_tmp_24 = pcs_0;
      6'b101010:
        casez_tmp_24 = pcs_0;
      6'b101011:
        casez_tmp_24 = pcs_0;
      6'b101100:
        casez_tmp_24 = pcs_0;
      6'b101101:
        casez_tmp_24 = pcs_0;
      6'b101110:
        casez_tmp_24 = pcs_0;
      6'b101111:
        casez_tmp_24 = pcs_0;
      6'b110000:
        casez_tmp_24 = pcs_0;
      6'b110001:
        casez_tmp_24 = pcs_0;
      6'b110010:
        casez_tmp_24 = pcs_0;
      6'b110011:
        casez_tmp_24 = pcs_0;
      6'b110100:
        casez_tmp_24 = pcs_0;
      6'b110101:
        casez_tmp_24 = pcs_0;
      6'b110110:
        casez_tmp_24 = pcs_0;
      6'b110111:
        casez_tmp_24 = pcs_0;
      6'b111000:
        casez_tmp_24 = pcs_0;
      6'b111001:
        casez_tmp_24 = pcs_0;
      6'b111010:
        casez_tmp_24 = pcs_0;
      6'b111011:
        casez_tmp_24 = pcs_0;
      6'b111100:
        casez_tmp_24 = pcs_0;
      6'b111101:
        casez_tmp_24 = pcs_0;
      6'b111110:
        casez_tmp_24 = pcs_0;
      default:
        casez_tmp_24 = pcs_0;
    endcase
  end // always @(*)
  reg  [2:0]   io_get_ftq_pc_1_entry_REG_cfi_idx_bits;
  reg  [7:0]   io_get_ftq_pc_1_entry_REG_br_mask;
  reg          io_get_ftq_pc_1_entry_REG_cfi_is_call;
  reg          io_get_ftq_pc_1_entry_REG_cfi_is_ret;
  reg          io_get_ftq_pc_1_entry_REG_start_bank;
  reg  [2:0]   casez_tmp_25;
  always @(*) begin
    casez (io_get_ftq_pc_1_ftq_idx)
      6'b000000:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b000001:
        casez_tmp_25 = ram_1_cfi_idx_bits;
      6'b000010:
        casez_tmp_25 = ram_2_cfi_idx_bits;
      6'b000011:
        casez_tmp_25 = ram_3_cfi_idx_bits;
      6'b000100:
        casez_tmp_25 = ram_4_cfi_idx_bits;
      6'b000101:
        casez_tmp_25 = ram_5_cfi_idx_bits;
      6'b000110:
        casez_tmp_25 = ram_6_cfi_idx_bits;
      6'b000111:
        casez_tmp_25 = ram_7_cfi_idx_bits;
      6'b001000:
        casez_tmp_25 = ram_8_cfi_idx_bits;
      6'b001001:
        casez_tmp_25 = ram_9_cfi_idx_bits;
      6'b001010:
        casez_tmp_25 = ram_10_cfi_idx_bits;
      6'b001011:
        casez_tmp_25 = ram_11_cfi_idx_bits;
      6'b001100:
        casez_tmp_25 = ram_12_cfi_idx_bits;
      6'b001101:
        casez_tmp_25 = ram_13_cfi_idx_bits;
      6'b001110:
        casez_tmp_25 = ram_14_cfi_idx_bits;
      6'b001111:
        casez_tmp_25 = ram_15_cfi_idx_bits;
      6'b010000:
        casez_tmp_25 = ram_16_cfi_idx_bits;
      6'b010001:
        casez_tmp_25 = ram_17_cfi_idx_bits;
      6'b010010:
        casez_tmp_25 = ram_18_cfi_idx_bits;
      6'b010011:
        casez_tmp_25 = ram_19_cfi_idx_bits;
      6'b010100:
        casez_tmp_25 = ram_20_cfi_idx_bits;
      6'b010101:
        casez_tmp_25 = ram_21_cfi_idx_bits;
      6'b010110:
        casez_tmp_25 = ram_22_cfi_idx_bits;
      6'b010111:
        casez_tmp_25 = ram_23_cfi_idx_bits;
      6'b011000:
        casez_tmp_25 = ram_24_cfi_idx_bits;
      6'b011001:
        casez_tmp_25 = ram_25_cfi_idx_bits;
      6'b011010:
        casez_tmp_25 = ram_26_cfi_idx_bits;
      6'b011011:
        casez_tmp_25 = ram_27_cfi_idx_bits;
      6'b011100:
        casez_tmp_25 = ram_28_cfi_idx_bits;
      6'b011101:
        casez_tmp_25 = ram_29_cfi_idx_bits;
      6'b011110:
        casez_tmp_25 = ram_30_cfi_idx_bits;
      6'b011111:
        casez_tmp_25 = ram_31_cfi_idx_bits;
      6'b100000:
        casez_tmp_25 = ram_32_cfi_idx_bits;
      6'b100001:
        casez_tmp_25 = ram_33_cfi_idx_bits;
      6'b100010:
        casez_tmp_25 = ram_34_cfi_idx_bits;
      6'b100011:
        casez_tmp_25 = ram_35_cfi_idx_bits;
      6'b100100:
        casez_tmp_25 = ram_36_cfi_idx_bits;
      6'b100101:
        casez_tmp_25 = ram_37_cfi_idx_bits;
      6'b100110:
        casez_tmp_25 = ram_38_cfi_idx_bits;
      6'b100111:
        casez_tmp_25 = ram_39_cfi_idx_bits;
      6'b101000:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b101001:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b101010:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b101011:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b101100:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b101101:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b101110:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b101111:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b110000:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b110001:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b110010:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b110011:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b110100:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b110101:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b110110:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b110111:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b111000:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b111001:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b111010:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b111011:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b111100:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b111101:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      6'b111110:
        casez_tmp_25 = ram_0_cfi_idx_bits;
      default:
        casez_tmp_25 = ram_0_cfi_idx_bits;
    endcase
  end // always @(*)
  reg  [7:0]   casez_tmp_26;
  always @(*) begin
    casez (io_get_ftq_pc_1_ftq_idx)
      6'b000000:
        casez_tmp_26 = ram_0_br_mask;
      6'b000001:
        casez_tmp_26 = ram_1_br_mask;
      6'b000010:
        casez_tmp_26 = ram_2_br_mask;
      6'b000011:
        casez_tmp_26 = ram_3_br_mask;
      6'b000100:
        casez_tmp_26 = ram_4_br_mask;
      6'b000101:
        casez_tmp_26 = ram_5_br_mask;
      6'b000110:
        casez_tmp_26 = ram_6_br_mask;
      6'b000111:
        casez_tmp_26 = ram_7_br_mask;
      6'b001000:
        casez_tmp_26 = ram_8_br_mask;
      6'b001001:
        casez_tmp_26 = ram_9_br_mask;
      6'b001010:
        casez_tmp_26 = ram_10_br_mask;
      6'b001011:
        casez_tmp_26 = ram_11_br_mask;
      6'b001100:
        casez_tmp_26 = ram_12_br_mask;
      6'b001101:
        casez_tmp_26 = ram_13_br_mask;
      6'b001110:
        casez_tmp_26 = ram_14_br_mask;
      6'b001111:
        casez_tmp_26 = ram_15_br_mask;
      6'b010000:
        casez_tmp_26 = ram_16_br_mask;
      6'b010001:
        casez_tmp_26 = ram_17_br_mask;
      6'b010010:
        casez_tmp_26 = ram_18_br_mask;
      6'b010011:
        casez_tmp_26 = ram_19_br_mask;
      6'b010100:
        casez_tmp_26 = ram_20_br_mask;
      6'b010101:
        casez_tmp_26 = ram_21_br_mask;
      6'b010110:
        casez_tmp_26 = ram_22_br_mask;
      6'b010111:
        casez_tmp_26 = ram_23_br_mask;
      6'b011000:
        casez_tmp_26 = ram_24_br_mask;
      6'b011001:
        casez_tmp_26 = ram_25_br_mask;
      6'b011010:
        casez_tmp_26 = ram_26_br_mask;
      6'b011011:
        casez_tmp_26 = ram_27_br_mask;
      6'b011100:
        casez_tmp_26 = ram_28_br_mask;
      6'b011101:
        casez_tmp_26 = ram_29_br_mask;
      6'b011110:
        casez_tmp_26 = ram_30_br_mask;
      6'b011111:
        casez_tmp_26 = ram_31_br_mask;
      6'b100000:
        casez_tmp_26 = ram_32_br_mask;
      6'b100001:
        casez_tmp_26 = ram_33_br_mask;
      6'b100010:
        casez_tmp_26 = ram_34_br_mask;
      6'b100011:
        casez_tmp_26 = ram_35_br_mask;
      6'b100100:
        casez_tmp_26 = ram_36_br_mask;
      6'b100101:
        casez_tmp_26 = ram_37_br_mask;
      6'b100110:
        casez_tmp_26 = ram_38_br_mask;
      6'b100111:
        casez_tmp_26 = ram_39_br_mask;
      6'b101000:
        casez_tmp_26 = ram_0_br_mask;
      6'b101001:
        casez_tmp_26 = ram_0_br_mask;
      6'b101010:
        casez_tmp_26 = ram_0_br_mask;
      6'b101011:
        casez_tmp_26 = ram_0_br_mask;
      6'b101100:
        casez_tmp_26 = ram_0_br_mask;
      6'b101101:
        casez_tmp_26 = ram_0_br_mask;
      6'b101110:
        casez_tmp_26 = ram_0_br_mask;
      6'b101111:
        casez_tmp_26 = ram_0_br_mask;
      6'b110000:
        casez_tmp_26 = ram_0_br_mask;
      6'b110001:
        casez_tmp_26 = ram_0_br_mask;
      6'b110010:
        casez_tmp_26 = ram_0_br_mask;
      6'b110011:
        casez_tmp_26 = ram_0_br_mask;
      6'b110100:
        casez_tmp_26 = ram_0_br_mask;
      6'b110101:
        casez_tmp_26 = ram_0_br_mask;
      6'b110110:
        casez_tmp_26 = ram_0_br_mask;
      6'b110111:
        casez_tmp_26 = ram_0_br_mask;
      6'b111000:
        casez_tmp_26 = ram_0_br_mask;
      6'b111001:
        casez_tmp_26 = ram_0_br_mask;
      6'b111010:
        casez_tmp_26 = ram_0_br_mask;
      6'b111011:
        casez_tmp_26 = ram_0_br_mask;
      6'b111100:
        casez_tmp_26 = ram_0_br_mask;
      6'b111101:
        casez_tmp_26 = ram_0_br_mask;
      6'b111110:
        casez_tmp_26 = ram_0_br_mask;
      default:
        casez_tmp_26 = ram_0_br_mask;
    endcase
  end // always @(*)
  reg          casez_tmp_27;
  always @(*) begin
    casez (io_get_ftq_pc_1_ftq_idx)
      6'b000000:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b000001:
        casez_tmp_27 = ram_1_cfi_is_call;
      6'b000010:
        casez_tmp_27 = ram_2_cfi_is_call;
      6'b000011:
        casez_tmp_27 = ram_3_cfi_is_call;
      6'b000100:
        casez_tmp_27 = ram_4_cfi_is_call;
      6'b000101:
        casez_tmp_27 = ram_5_cfi_is_call;
      6'b000110:
        casez_tmp_27 = ram_6_cfi_is_call;
      6'b000111:
        casez_tmp_27 = ram_7_cfi_is_call;
      6'b001000:
        casez_tmp_27 = ram_8_cfi_is_call;
      6'b001001:
        casez_tmp_27 = ram_9_cfi_is_call;
      6'b001010:
        casez_tmp_27 = ram_10_cfi_is_call;
      6'b001011:
        casez_tmp_27 = ram_11_cfi_is_call;
      6'b001100:
        casez_tmp_27 = ram_12_cfi_is_call;
      6'b001101:
        casez_tmp_27 = ram_13_cfi_is_call;
      6'b001110:
        casez_tmp_27 = ram_14_cfi_is_call;
      6'b001111:
        casez_tmp_27 = ram_15_cfi_is_call;
      6'b010000:
        casez_tmp_27 = ram_16_cfi_is_call;
      6'b010001:
        casez_tmp_27 = ram_17_cfi_is_call;
      6'b010010:
        casez_tmp_27 = ram_18_cfi_is_call;
      6'b010011:
        casez_tmp_27 = ram_19_cfi_is_call;
      6'b010100:
        casez_tmp_27 = ram_20_cfi_is_call;
      6'b010101:
        casez_tmp_27 = ram_21_cfi_is_call;
      6'b010110:
        casez_tmp_27 = ram_22_cfi_is_call;
      6'b010111:
        casez_tmp_27 = ram_23_cfi_is_call;
      6'b011000:
        casez_tmp_27 = ram_24_cfi_is_call;
      6'b011001:
        casez_tmp_27 = ram_25_cfi_is_call;
      6'b011010:
        casez_tmp_27 = ram_26_cfi_is_call;
      6'b011011:
        casez_tmp_27 = ram_27_cfi_is_call;
      6'b011100:
        casez_tmp_27 = ram_28_cfi_is_call;
      6'b011101:
        casez_tmp_27 = ram_29_cfi_is_call;
      6'b011110:
        casez_tmp_27 = ram_30_cfi_is_call;
      6'b011111:
        casez_tmp_27 = ram_31_cfi_is_call;
      6'b100000:
        casez_tmp_27 = ram_32_cfi_is_call;
      6'b100001:
        casez_tmp_27 = ram_33_cfi_is_call;
      6'b100010:
        casez_tmp_27 = ram_34_cfi_is_call;
      6'b100011:
        casez_tmp_27 = ram_35_cfi_is_call;
      6'b100100:
        casez_tmp_27 = ram_36_cfi_is_call;
      6'b100101:
        casez_tmp_27 = ram_37_cfi_is_call;
      6'b100110:
        casez_tmp_27 = ram_38_cfi_is_call;
      6'b100111:
        casez_tmp_27 = ram_39_cfi_is_call;
      6'b101000:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b101001:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b101010:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b101011:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b101100:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b101101:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b101110:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b101111:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b110000:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b110001:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b110010:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b110011:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b110100:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b110101:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b110110:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b110111:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b111000:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b111001:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b111010:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b111011:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b111100:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b111101:
        casez_tmp_27 = ram_0_cfi_is_call;
      6'b111110:
        casez_tmp_27 = ram_0_cfi_is_call;
      default:
        casez_tmp_27 = ram_0_cfi_is_call;
    endcase
  end // always @(*)
  reg          casez_tmp_28;
  always @(*) begin
    casez (io_get_ftq_pc_1_ftq_idx)
      6'b000000:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b000001:
        casez_tmp_28 = ram_1_cfi_is_ret;
      6'b000010:
        casez_tmp_28 = ram_2_cfi_is_ret;
      6'b000011:
        casez_tmp_28 = ram_3_cfi_is_ret;
      6'b000100:
        casez_tmp_28 = ram_4_cfi_is_ret;
      6'b000101:
        casez_tmp_28 = ram_5_cfi_is_ret;
      6'b000110:
        casez_tmp_28 = ram_6_cfi_is_ret;
      6'b000111:
        casez_tmp_28 = ram_7_cfi_is_ret;
      6'b001000:
        casez_tmp_28 = ram_8_cfi_is_ret;
      6'b001001:
        casez_tmp_28 = ram_9_cfi_is_ret;
      6'b001010:
        casez_tmp_28 = ram_10_cfi_is_ret;
      6'b001011:
        casez_tmp_28 = ram_11_cfi_is_ret;
      6'b001100:
        casez_tmp_28 = ram_12_cfi_is_ret;
      6'b001101:
        casez_tmp_28 = ram_13_cfi_is_ret;
      6'b001110:
        casez_tmp_28 = ram_14_cfi_is_ret;
      6'b001111:
        casez_tmp_28 = ram_15_cfi_is_ret;
      6'b010000:
        casez_tmp_28 = ram_16_cfi_is_ret;
      6'b010001:
        casez_tmp_28 = ram_17_cfi_is_ret;
      6'b010010:
        casez_tmp_28 = ram_18_cfi_is_ret;
      6'b010011:
        casez_tmp_28 = ram_19_cfi_is_ret;
      6'b010100:
        casez_tmp_28 = ram_20_cfi_is_ret;
      6'b010101:
        casez_tmp_28 = ram_21_cfi_is_ret;
      6'b010110:
        casez_tmp_28 = ram_22_cfi_is_ret;
      6'b010111:
        casez_tmp_28 = ram_23_cfi_is_ret;
      6'b011000:
        casez_tmp_28 = ram_24_cfi_is_ret;
      6'b011001:
        casez_tmp_28 = ram_25_cfi_is_ret;
      6'b011010:
        casez_tmp_28 = ram_26_cfi_is_ret;
      6'b011011:
        casez_tmp_28 = ram_27_cfi_is_ret;
      6'b011100:
        casez_tmp_28 = ram_28_cfi_is_ret;
      6'b011101:
        casez_tmp_28 = ram_29_cfi_is_ret;
      6'b011110:
        casez_tmp_28 = ram_30_cfi_is_ret;
      6'b011111:
        casez_tmp_28 = ram_31_cfi_is_ret;
      6'b100000:
        casez_tmp_28 = ram_32_cfi_is_ret;
      6'b100001:
        casez_tmp_28 = ram_33_cfi_is_ret;
      6'b100010:
        casez_tmp_28 = ram_34_cfi_is_ret;
      6'b100011:
        casez_tmp_28 = ram_35_cfi_is_ret;
      6'b100100:
        casez_tmp_28 = ram_36_cfi_is_ret;
      6'b100101:
        casez_tmp_28 = ram_37_cfi_is_ret;
      6'b100110:
        casez_tmp_28 = ram_38_cfi_is_ret;
      6'b100111:
        casez_tmp_28 = ram_39_cfi_is_ret;
      6'b101000:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b101001:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b101010:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b101011:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b101100:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b101101:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b101110:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b101111:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b110000:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b110001:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b110010:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b110011:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b110100:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b110101:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b110110:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b110111:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b111000:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b111001:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b111010:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b111011:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b111100:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b111101:
        casez_tmp_28 = ram_0_cfi_is_ret;
      6'b111110:
        casez_tmp_28 = ram_0_cfi_is_ret;
      default:
        casez_tmp_28 = ram_0_cfi_is_ret;
    endcase
  end // always @(*)
  reg          casez_tmp_29;
  always @(*) begin
    casez (io_get_ftq_pc_1_ftq_idx)
      6'b000000:
        casez_tmp_29 = ram_0_start_bank;
      6'b000001:
        casez_tmp_29 = ram_1_start_bank;
      6'b000010:
        casez_tmp_29 = ram_2_start_bank;
      6'b000011:
        casez_tmp_29 = ram_3_start_bank;
      6'b000100:
        casez_tmp_29 = ram_4_start_bank;
      6'b000101:
        casez_tmp_29 = ram_5_start_bank;
      6'b000110:
        casez_tmp_29 = ram_6_start_bank;
      6'b000111:
        casez_tmp_29 = ram_7_start_bank;
      6'b001000:
        casez_tmp_29 = ram_8_start_bank;
      6'b001001:
        casez_tmp_29 = ram_9_start_bank;
      6'b001010:
        casez_tmp_29 = ram_10_start_bank;
      6'b001011:
        casez_tmp_29 = ram_11_start_bank;
      6'b001100:
        casez_tmp_29 = ram_12_start_bank;
      6'b001101:
        casez_tmp_29 = ram_13_start_bank;
      6'b001110:
        casez_tmp_29 = ram_14_start_bank;
      6'b001111:
        casez_tmp_29 = ram_15_start_bank;
      6'b010000:
        casez_tmp_29 = ram_16_start_bank;
      6'b010001:
        casez_tmp_29 = ram_17_start_bank;
      6'b010010:
        casez_tmp_29 = ram_18_start_bank;
      6'b010011:
        casez_tmp_29 = ram_19_start_bank;
      6'b010100:
        casez_tmp_29 = ram_20_start_bank;
      6'b010101:
        casez_tmp_29 = ram_21_start_bank;
      6'b010110:
        casez_tmp_29 = ram_22_start_bank;
      6'b010111:
        casez_tmp_29 = ram_23_start_bank;
      6'b011000:
        casez_tmp_29 = ram_24_start_bank;
      6'b011001:
        casez_tmp_29 = ram_25_start_bank;
      6'b011010:
        casez_tmp_29 = ram_26_start_bank;
      6'b011011:
        casez_tmp_29 = ram_27_start_bank;
      6'b011100:
        casez_tmp_29 = ram_28_start_bank;
      6'b011101:
        casez_tmp_29 = ram_29_start_bank;
      6'b011110:
        casez_tmp_29 = ram_30_start_bank;
      6'b011111:
        casez_tmp_29 = ram_31_start_bank;
      6'b100000:
        casez_tmp_29 = ram_32_start_bank;
      6'b100001:
        casez_tmp_29 = ram_33_start_bank;
      6'b100010:
        casez_tmp_29 = ram_34_start_bank;
      6'b100011:
        casez_tmp_29 = ram_35_start_bank;
      6'b100100:
        casez_tmp_29 = ram_36_start_bank;
      6'b100101:
        casez_tmp_29 = ram_37_start_bank;
      6'b100110:
        casez_tmp_29 = ram_38_start_bank;
      6'b100111:
        casez_tmp_29 = ram_39_start_bank;
      6'b101000:
        casez_tmp_29 = ram_0_start_bank;
      6'b101001:
        casez_tmp_29 = ram_0_start_bank;
      6'b101010:
        casez_tmp_29 = ram_0_start_bank;
      6'b101011:
        casez_tmp_29 = ram_0_start_bank;
      6'b101100:
        casez_tmp_29 = ram_0_start_bank;
      6'b101101:
        casez_tmp_29 = ram_0_start_bank;
      6'b101110:
        casez_tmp_29 = ram_0_start_bank;
      6'b101111:
        casez_tmp_29 = ram_0_start_bank;
      6'b110000:
        casez_tmp_29 = ram_0_start_bank;
      6'b110001:
        casez_tmp_29 = ram_0_start_bank;
      6'b110010:
        casez_tmp_29 = ram_0_start_bank;
      6'b110011:
        casez_tmp_29 = ram_0_start_bank;
      6'b110100:
        casez_tmp_29 = ram_0_start_bank;
      6'b110101:
        casez_tmp_29 = ram_0_start_bank;
      6'b110110:
        casez_tmp_29 = ram_0_start_bank;
      6'b110111:
        casez_tmp_29 = ram_0_start_bank;
      6'b111000:
        casez_tmp_29 = ram_0_start_bank;
      6'b111001:
        casez_tmp_29 = ram_0_start_bank;
      6'b111010:
        casez_tmp_29 = ram_0_start_bank;
      6'b111011:
        casez_tmp_29 = ram_0_start_bank;
      6'b111100:
        casez_tmp_29 = ram_0_start_bank;
      6'b111101:
        casez_tmp_29 = ram_0_start_bank;
      6'b111110:
        casez_tmp_29 = ram_0_start_bank;
      default:
        casez_tmp_29 = ram_0_start_bank;
    endcase
  end // always @(*)
  reg  [39:0]  io_get_ftq_pc_1_pc_REG;
  reg  [39:0]  casez_tmp_30;
  always @(*) begin
    casez (io_get_ftq_pc_1_ftq_idx)
      6'b000000:
        casez_tmp_30 = pcs_0;
      6'b000001:
        casez_tmp_30 = pcs_1;
      6'b000010:
        casez_tmp_30 = pcs_2;
      6'b000011:
        casez_tmp_30 = pcs_3;
      6'b000100:
        casez_tmp_30 = pcs_4;
      6'b000101:
        casez_tmp_30 = pcs_5;
      6'b000110:
        casez_tmp_30 = pcs_6;
      6'b000111:
        casez_tmp_30 = pcs_7;
      6'b001000:
        casez_tmp_30 = pcs_8;
      6'b001001:
        casez_tmp_30 = pcs_9;
      6'b001010:
        casez_tmp_30 = pcs_10;
      6'b001011:
        casez_tmp_30 = pcs_11;
      6'b001100:
        casez_tmp_30 = pcs_12;
      6'b001101:
        casez_tmp_30 = pcs_13;
      6'b001110:
        casez_tmp_30 = pcs_14;
      6'b001111:
        casez_tmp_30 = pcs_15;
      6'b010000:
        casez_tmp_30 = pcs_16;
      6'b010001:
        casez_tmp_30 = pcs_17;
      6'b010010:
        casez_tmp_30 = pcs_18;
      6'b010011:
        casez_tmp_30 = pcs_19;
      6'b010100:
        casez_tmp_30 = pcs_20;
      6'b010101:
        casez_tmp_30 = pcs_21;
      6'b010110:
        casez_tmp_30 = pcs_22;
      6'b010111:
        casez_tmp_30 = pcs_23;
      6'b011000:
        casez_tmp_30 = pcs_24;
      6'b011001:
        casez_tmp_30 = pcs_25;
      6'b011010:
        casez_tmp_30 = pcs_26;
      6'b011011:
        casez_tmp_30 = pcs_27;
      6'b011100:
        casez_tmp_30 = pcs_28;
      6'b011101:
        casez_tmp_30 = pcs_29;
      6'b011110:
        casez_tmp_30 = pcs_30;
      6'b011111:
        casez_tmp_30 = pcs_31;
      6'b100000:
        casez_tmp_30 = pcs_32;
      6'b100001:
        casez_tmp_30 = pcs_33;
      6'b100010:
        casez_tmp_30 = pcs_34;
      6'b100011:
        casez_tmp_30 = pcs_35;
      6'b100100:
        casez_tmp_30 = pcs_36;
      6'b100101:
        casez_tmp_30 = pcs_37;
      6'b100110:
        casez_tmp_30 = pcs_38;
      6'b100111:
        casez_tmp_30 = pcs_39;
      6'b101000:
        casez_tmp_30 = pcs_0;
      6'b101001:
        casez_tmp_30 = pcs_0;
      6'b101010:
        casez_tmp_30 = pcs_0;
      6'b101011:
        casez_tmp_30 = pcs_0;
      6'b101100:
        casez_tmp_30 = pcs_0;
      6'b101101:
        casez_tmp_30 = pcs_0;
      6'b101110:
        casez_tmp_30 = pcs_0;
      6'b101111:
        casez_tmp_30 = pcs_0;
      6'b110000:
        casez_tmp_30 = pcs_0;
      6'b110001:
        casez_tmp_30 = pcs_0;
      6'b110010:
        casez_tmp_30 = pcs_0;
      6'b110011:
        casez_tmp_30 = pcs_0;
      6'b110100:
        casez_tmp_30 = pcs_0;
      6'b110101:
        casez_tmp_30 = pcs_0;
      6'b110110:
        casez_tmp_30 = pcs_0;
      6'b110111:
        casez_tmp_30 = pcs_0;
      6'b111000:
        casez_tmp_30 = pcs_0;
      6'b111001:
        casez_tmp_30 = pcs_0;
      6'b111010:
        casez_tmp_30 = pcs_0;
      6'b111011:
        casez_tmp_30 = pcs_0;
      6'b111100:
        casez_tmp_30 = pcs_0;
      6'b111101:
        casez_tmp_30 = pcs_0;
      6'b111110:
        casez_tmp_30 = pcs_0;
      default:
        casez_tmp_30 = pcs_0;
    endcase
  end // always @(*)
  wire         full_wrap = enq_ptr == 6'h27;
  wire [5:0]   _enq_ptr_T = enq_ptr + 6'h1;
  wire [5:0]   _full_T_2 = full_wrap ? 6'h0 : _enq_ptr_T;
  wire         _GEN_18 = ghist_1_MPORT_1_en & enq_ptr == 6'h0;
  wire         _GEN_19 = ghist_1_MPORT_1_en & enq_ptr == 6'h1;
  wire         _GEN_20 = ghist_1_MPORT_1_en & enq_ptr == 6'h2;
  wire         _GEN_21 = ghist_1_MPORT_1_en & enq_ptr == 6'h3;
  wire         _GEN_22 = ghist_1_MPORT_1_en & enq_ptr == 6'h4;
  wire         _GEN_23 = ghist_1_MPORT_1_en & enq_ptr == 6'h5;
  wire         _GEN_24 = ghist_1_MPORT_1_en & enq_ptr == 6'h6;
  wire         _GEN_25 = ghist_1_MPORT_1_en & enq_ptr == 6'h7;
  wire         _GEN_26 = ghist_1_MPORT_1_en & enq_ptr == 6'h8;
  wire         _GEN_27 = ghist_1_MPORT_1_en & enq_ptr == 6'h9;
  wire         _GEN_28 = ghist_1_MPORT_1_en & enq_ptr == 6'hA;
  wire         _GEN_29 = ghist_1_MPORT_1_en & enq_ptr == 6'hB;
  wire         _GEN_30 = ghist_1_MPORT_1_en & enq_ptr == 6'hC;
  wire         _GEN_31 = ghist_1_MPORT_1_en & enq_ptr == 6'hD;
  wire         _GEN_32 = ghist_1_MPORT_1_en & enq_ptr == 6'hE;
  wire         _GEN_33 = ghist_1_MPORT_1_en & enq_ptr == 6'hF;
  wire         _GEN_34 = ghist_1_MPORT_1_en & enq_ptr == 6'h10;
  wire         _GEN_35 = ghist_1_MPORT_1_en & enq_ptr == 6'h11;
  wire         _GEN_36 = ghist_1_MPORT_1_en & enq_ptr == 6'h12;
  wire         _GEN_37 = ghist_1_MPORT_1_en & enq_ptr == 6'h13;
  wire         _GEN_38 = ghist_1_MPORT_1_en & enq_ptr == 6'h14;
  wire         _GEN_39 = ghist_1_MPORT_1_en & enq_ptr == 6'h15;
  wire         _GEN_40 = ghist_1_MPORT_1_en & enq_ptr == 6'h16;
  wire         _GEN_41 = ghist_1_MPORT_1_en & enq_ptr == 6'h17;
  wire         _GEN_42 = ghist_1_MPORT_1_en & enq_ptr == 6'h18;
  wire         _GEN_43 = ghist_1_MPORT_1_en & enq_ptr == 6'h19;
  wire         _GEN_44 = ghist_1_MPORT_1_en & enq_ptr == 6'h1A;
  wire         _GEN_45 = ghist_1_MPORT_1_en & enq_ptr == 6'h1B;
  wire         _GEN_46 = ghist_1_MPORT_1_en & enq_ptr == 6'h1C;
  wire         _GEN_47 = ghist_1_MPORT_1_en & enq_ptr == 6'h1D;
  wire         _GEN_48 = ghist_1_MPORT_1_en & enq_ptr == 6'h1E;
  wire         _GEN_49 = ghist_1_MPORT_1_en & enq_ptr == 6'h1F;
  wire         _GEN_50 = ghist_1_MPORT_1_en & enq_ptr == 6'h20;
  wire         _GEN_51 = ghist_1_MPORT_1_en & enq_ptr == 6'h21;
  wire         _GEN_52 = ghist_1_MPORT_1_en & enq_ptr == 6'h22;
  wire         _GEN_53 = ghist_1_MPORT_1_en & enq_ptr == 6'h23;
  wire         _GEN_54 = ghist_1_MPORT_1_en & enq_ptr == 6'h24;
  wire         _GEN_55 = ghist_1_MPORT_1_en & enq_ptr == 6'h25;
  wire         _GEN_56 = ghist_1_MPORT_1_en & enq_ptr == 6'h26;
  wire         _GEN_57 = ghist_1_MPORT_1_en & enq_ptr == 6'h27;
  wire [7:0]   new_entry_br_mask = io_enq_bits_br_mask & io_enq_bits_mask;
  wire         _GEN_58 = bpd_update_repair & REG_1;
  wire         wrap = bpd_repair_idx == 6'h27;
  wire [5:0]   _bpd_repair_idx_T_6 = bpd_repair_idx + 6'h1;
  wire         bpd_ptr_wrap = bpd_ptr == 6'h27;
  wire [5:0]   _bpd_ptr_T = bpd_ptr + 6'h1;
  wire         do_commit_update = ~bpd_update_mispredict & ~bpd_update_repair & bpd_ptr != deq_ptr & enq_ptr != (bpd_ptr_wrap ? 6'h0 : _bpd_ptr_T) & ~io_brupdate_b2_mispredict & ~io_redirect_valid & ~do_commit_update_REG;
  wire [2:0]   new_cfi_idx = io_brupdate_b2_uop_pc_lob[3:1] ^ {casez_tmp_17, 2'h0};
  wire         _GEN_59 = io_redirect_valid & io_brupdate_b2_mispredict;
  wire         redirect_new_entry_cfi_idx_valid = _GEN_59 | casez_tmp_7;
  wire [2:0]   redirect_new_entry_cfi_idx_bits = _GEN_59 ? new_cfi_idx : casez_tmp_8;
  wire         redirect_new_entry_cfi_taken = _GEN_59 ? io_brupdate_b2_taken : casez_tmp_9;
  wire         _GEN_60 = ~_GEN_59 | casez_tmp_8 == new_cfi_idx;
  wire         redirect_new_entry_cfi_is_call = _GEN_60 & casez_tmp_13;
  wire         redirect_new_entry_cfi_is_ret = _GEN_60 & casez_tmp_14;
  wire         next_is_enq = next_idx == enq_ptr & ghist_1_MPORT_1_en;
  always @(posedge clock) begin
    if (reset) begin
      bpd_ptr <= 6'h0;
      deq_ptr <= 6'h0;
      enq_ptr <= 6'h1;
      prev_ghist_old_history <= 64'h0;
      prev_ghist_current_saw_branch_not_taken <= 1'h0;
      prev_ghist_new_saw_branch_not_taken <= 1'h0;
      prev_ghist_new_saw_branch_taken <= 1'h0;
      prev_ghist_ras_idx <= 5'h0;
      prev_entry_cfi_idx_valid <= 1'h0;
      prev_entry_cfi_idx_bits <= 3'h0;
      prev_entry_cfi_taken <= 1'h0;
      prev_entry_br_mask <= 8'h0;
      prev_entry_cfi_is_call <= 1'h0;
      prev_entry_cfi_is_ret <= 1'h0;
      prev_pc <= 40'h0;
      first_empty <= 1'h1;
      bpd_update_mispredict <= 1'h0;
      bpd_update_repair <= 1'h0;
    end
    else begin
      if (do_commit_update) begin
        if (bpd_ptr_wrap)
          bpd_ptr <= 6'h0;
        else
          bpd_ptr <= _bpd_ptr_T;
      end
      if (io_deq_valid)
        deq_ptr <= io_deq_bits;
      if (io_redirect_valid)
        enq_ptr <= io_redirect_bits == 6'h27 ? 6'h0 : io_redirect_bits + 6'h1;
      else if (ghist_1_MPORT_1_en) begin
        if (full_wrap)
          enq_ptr <= 6'h0;
        else
          enq_ptr <= _enq_ptr_T;
      end
      if (io_redirect_valid | ~REG_3) begin
        if (ghist_1_MPORT_1_en) begin
          if (io_enq_bits_ghist_current_saw_branch_not_taken)
            prev_ghist_old_history <= io_enq_bits_ghist_old_history;
          else if (new_ghist_ignore_second_bank)
            prev_ghist_old_history <= _new_ghist_new_history_old_history_T_4;
          else
            prev_ghist_old_history <= _new_ghist_new_history_old_history_T_25;
          prev_ghist_current_saw_branch_not_taken <= io_enq_bits_ghist_current_saw_branch_not_taken;
          prev_ghist_new_saw_branch_not_taken <= ghist_1_MPORT_1_data_new_saw_branch_not_taken;
          prev_ghist_new_saw_branch_taken <= ghist_1_MPORT_1_data_new_saw_branch_taken;
          if (io_enq_bits_ghist_current_saw_branch_not_taken)
            prev_ghist_ras_idx <= io_enq_bits_ghist_ras_idx;
          else if (_new_ghist_new_history_ras_idx_T)
            prev_ghist_ras_idx <= _new_ghist_new_history_ras_idx_T_1;
          else if (_new_ghist_new_history_ras_idx_T_4)
            prev_ghist_ras_idx <= _new_ghist_new_history_ras_idx_T_5;
          prev_entry_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
          prev_entry_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
          prev_entry_cfi_taken <= io_enq_bits_cfi_idx_valid;
          prev_entry_br_mask <= new_entry_br_mask;
          prev_entry_cfi_is_call <= io_enq_bits_cfi_is_call;
          prev_entry_cfi_is_ret <= io_enq_bits_cfi_is_ret;
          prev_pc <= io_enq_bits_pc;
        end
      end
      else begin
        prev_ghist_old_history <= _ghist_0_ext_R0_data[63:0];
        prev_ghist_current_saw_branch_not_taken <= _ghist_0_ext_R0_data[64];
        prev_ghist_new_saw_branch_not_taken <= _ghist_0_ext_R0_data[65];
        prev_ghist_new_saw_branch_taken <= _ghist_0_ext_R0_data[66];
        prev_ghist_ras_idx <= _ghist_0_ext_R0_data[71:67];
        prev_entry_cfi_idx_valid <= prev_entry_REG_cfi_idx_valid;
        prev_entry_cfi_idx_bits <= prev_entry_REG_cfi_idx_bits;
        prev_entry_cfi_taken <= prev_entry_REG_cfi_taken;
        prev_entry_br_mask <= prev_entry_REG_br_mask;
        prev_entry_cfi_is_call <= prev_entry_REG_cfi_is_call;
        prev_entry_cfi_is_ret <= prev_entry_REG_cfi_is_ret;
        prev_pc <= bpd_pc;
      end
      first_empty <= ~REG_2 & first_empty;
      bpd_update_mispredict <= ~io_redirect_valid & REG;
      bpd_update_repair <= ~io_redirect_valid & (REG ? bpd_update_repair : bpd_update_mispredict | (_GEN_58 | ~(bpd_update_repair & ((wrap ? 6'h0 : _bpd_repair_idx_T_6) == bpd_end_idx | bpd_pc == bpd_repair_pc))) & bpd_update_repair);
    end
    if (_GEN_18)
      pcs_0 <= io_enq_bits_pc;
    if (_GEN_19)
      pcs_1 <= io_enq_bits_pc;
    if (_GEN_20)
      pcs_2 <= io_enq_bits_pc;
    if (_GEN_21)
      pcs_3 <= io_enq_bits_pc;
    if (_GEN_22)
      pcs_4 <= io_enq_bits_pc;
    if (_GEN_23)
      pcs_5 <= io_enq_bits_pc;
    if (_GEN_24)
      pcs_6 <= io_enq_bits_pc;
    if (_GEN_25)
      pcs_7 <= io_enq_bits_pc;
    if (_GEN_26)
      pcs_8 <= io_enq_bits_pc;
    if (_GEN_27)
      pcs_9 <= io_enq_bits_pc;
    if (_GEN_28)
      pcs_10 <= io_enq_bits_pc;
    if (_GEN_29)
      pcs_11 <= io_enq_bits_pc;
    if (_GEN_30)
      pcs_12 <= io_enq_bits_pc;
    if (_GEN_31)
      pcs_13 <= io_enq_bits_pc;
    if (_GEN_32)
      pcs_14 <= io_enq_bits_pc;
    if (_GEN_33)
      pcs_15 <= io_enq_bits_pc;
    if (_GEN_34)
      pcs_16 <= io_enq_bits_pc;
    if (_GEN_35)
      pcs_17 <= io_enq_bits_pc;
    if (_GEN_36)
      pcs_18 <= io_enq_bits_pc;
    if (_GEN_37)
      pcs_19 <= io_enq_bits_pc;
    if (_GEN_38)
      pcs_20 <= io_enq_bits_pc;
    if (_GEN_39)
      pcs_21 <= io_enq_bits_pc;
    if (_GEN_40)
      pcs_22 <= io_enq_bits_pc;
    if (_GEN_41)
      pcs_23 <= io_enq_bits_pc;
    if (_GEN_42)
      pcs_24 <= io_enq_bits_pc;
    if (_GEN_43)
      pcs_25 <= io_enq_bits_pc;
    if (_GEN_44)
      pcs_26 <= io_enq_bits_pc;
    if (_GEN_45)
      pcs_27 <= io_enq_bits_pc;
    if (_GEN_46)
      pcs_28 <= io_enq_bits_pc;
    if (_GEN_47)
      pcs_29 <= io_enq_bits_pc;
    if (_GEN_48)
      pcs_30 <= io_enq_bits_pc;
    if (_GEN_49)
      pcs_31 <= io_enq_bits_pc;
    if (_GEN_50)
      pcs_32 <= io_enq_bits_pc;
    if (_GEN_51)
      pcs_33 <= io_enq_bits_pc;
    if (_GEN_52)
      pcs_34 <= io_enq_bits_pc;
    if (_GEN_53)
      pcs_35 <= io_enq_bits_pc;
    if (_GEN_54)
      pcs_36 <= io_enq_bits_pc;
    if (_GEN_55)
      pcs_37 <= io_enq_bits_pc;
    if (_GEN_56)
      pcs_38 <= io_enq_bits_pc;
    if (_GEN_57)
      pcs_39 <= io_enq_bits_pc;
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h0)) begin
      if (_GEN_18) begin
        ram_0_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_0_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_0_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_0_cfi_mispredicted <= ~_GEN_18 & ram_0_cfi_mispredicted;
      if (_GEN_18) begin
        ram_0_cfi_type <= io_enq_bits_cfi_type;
        ram_0_br_mask <= new_entry_br_mask;
        ram_0_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_0_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_0_ras_top <= io_enq_bits_ras_top;
        ram_0_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_0_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_0_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_0_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_0_cfi_taken <= ram_REG_cfi_taken;
      ram_0_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_0_cfi_type <= ram_REG_cfi_type;
      ram_0_br_mask <= ram_REG_br_mask;
      ram_0_cfi_is_call <= ram_REG_cfi_is_call;
      ram_0_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_0_ras_top <= ram_REG_ras_top;
      ram_0_ras_idx <= ram_REG_ras_idx;
      ram_0_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h1)) begin
      if (_GEN_19) begin
        ram_1_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_1_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_1_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_1_cfi_mispredicted <= ~_GEN_19 & ram_1_cfi_mispredicted;
      if (_GEN_19) begin
        ram_1_cfi_type <= io_enq_bits_cfi_type;
        ram_1_br_mask <= new_entry_br_mask;
        ram_1_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_1_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_1_ras_top <= io_enq_bits_ras_top;
        ram_1_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_1_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_1_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_1_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_1_cfi_taken <= ram_REG_cfi_taken;
      ram_1_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_1_cfi_type <= ram_REG_cfi_type;
      ram_1_br_mask <= ram_REG_br_mask;
      ram_1_cfi_is_call <= ram_REG_cfi_is_call;
      ram_1_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_1_ras_top <= ram_REG_ras_top;
      ram_1_ras_idx <= ram_REG_ras_idx;
      ram_1_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h2)) begin
      if (_GEN_20) begin
        ram_2_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_2_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_2_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_2_cfi_mispredicted <= ~_GEN_20 & ram_2_cfi_mispredicted;
      if (_GEN_20) begin
        ram_2_cfi_type <= io_enq_bits_cfi_type;
        ram_2_br_mask <= new_entry_br_mask;
        ram_2_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_2_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_2_ras_top <= io_enq_bits_ras_top;
        ram_2_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_2_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_2_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_2_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_2_cfi_taken <= ram_REG_cfi_taken;
      ram_2_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_2_cfi_type <= ram_REG_cfi_type;
      ram_2_br_mask <= ram_REG_br_mask;
      ram_2_cfi_is_call <= ram_REG_cfi_is_call;
      ram_2_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_2_ras_top <= ram_REG_ras_top;
      ram_2_ras_idx <= ram_REG_ras_idx;
      ram_2_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h3)) begin
      if (_GEN_21) begin
        ram_3_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_3_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_3_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_3_cfi_mispredicted <= ~_GEN_21 & ram_3_cfi_mispredicted;
      if (_GEN_21) begin
        ram_3_cfi_type <= io_enq_bits_cfi_type;
        ram_3_br_mask <= new_entry_br_mask;
        ram_3_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_3_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_3_ras_top <= io_enq_bits_ras_top;
        ram_3_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_3_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_3_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_3_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_3_cfi_taken <= ram_REG_cfi_taken;
      ram_3_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_3_cfi_type <= ram_REG_cfi_type;
      ram_3_br_mask <= ram_REG_br_mask;
      ram_3_cfi_is_call <= ram_REG_cfi_is_call;
      ram_3_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_3_ras_top <= ram_REG_ras_top;
      ram_3_ras_idx <= ram_REG_ras_idx;
      ram_3_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h4)) begin
      if (_GEN_22) begin
        ram_4_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_4_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_4_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_4_cfi_mispredicted <= ~_GEN_22 & ram_4_cfi_mispredicted;
      if (_GEN_22) begin
        ram_4_cfi_type <= io_enq_bits_cfi_type;
        ram_4_br_mask <= new_entry_br_mask;
        ram_4_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_4_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_4_ras_top <= io_enq_bits_ras_top;
        ram_4_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_4_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_4_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_4_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_4_cfi_taken <= ram_REG_cfi_taken;
      ram_4_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_4_cfi_type <= ram_REG_cfi_type;
      ram_4_br_mask <= ram_REG_br_mask;
      ram_4_cfi_is_call <= ram_REG_cfi_is_call;
      ram_4_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_4_ras_top <= ram_REG_ras_top;
      ram_4_ras_idx <= ram_REG_ras_idx;
      ram_4_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h5)) begin
      if (_GEN_23) begin
        ram_5_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_5_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_5_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_5_cfi_mispredicted <= ~_GEN_23 & ram_5_cfi_mispredicted;
      if (_GEN_23) begin
        ram_5_cfi_type <= io_enq_bits_cfi_type;
        ram_5_br_mask <= new_entry_br_mask;
        ram_5_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_5_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_5_ras_top <= io_enq_bits_ras_top;
        ram_5_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_5_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_5_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_5_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_5_cfi_taken <= ram_REG_cfi_taken;
      ram_5_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_5_cfi_type <= ram_REG_cfi_type;
      ram_5_br_mask <= ram_REG_br_mask;
      ram_5_cfi_is_call <= ram_REG_cfi_is_call;
      ram_5_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_5_ras_top <= ram_REG_ras_top;
      ram_5_ras_idx <= ram_REG_ras_idx;
      ram_5_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h6)) begin
      if (_GEN_24) begin
        ram_6_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_6_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_6_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_6_cfi_mispredicted <= ~_GEN_24 & ram_6_cfi_mispredicted;
      if (_GEN_24) begin
        ram_6_cfi_type <= io_enq_bits_cfi_type;
        ram_6_br_mask <= new_entry_br_mask;
        ram_6_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_6_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_6_ras_top <= io_enq_bits_ras_top;
        ram_6_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_6_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_6_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_6_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_6_cfi_taken <= ram_REG_cfi_taken;
      ram_6_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_6_cfi_type <= ram_REG_cfi_type;
      ram_6_br_mask <= ram_REG_br_mask;
      ram_6_cfi_is_call <= ram_REG_cfi_is_call;
      ram_6_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_6_ras_top <= ram_REG_ras_top;
      ram_6_ras_idx <= ram_REG_ras_idx;
      ram_6_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h7)) begin
      if (_GEN_25) begin
        ram_7_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_7_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_7_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_7_cfi_mispredicted <= ~_GEN_25 & ram_7_cfi_mispredicted;
      if (_GEN_25) begin
        ram_7_cfi_type <= io_enq_bits_cfi_type;
        ram_7_br_mask <= new_entry_br_mask;
        ram_7_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_7_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_7_ras_top <= io_enq_bits_ras_top;
        ram_7_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_7_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_7_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_7_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_7_cfi_taken <= ram_REG_cfi_taken;
      ram_7_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_7_cfi_type <= ram_REG_cfi_type;
      ram_7_br_mask <= ram_REG_br_mask;
      ram_7_cfi_is_call <= ram_REG_cfi_is_call;
      ram_7_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_7_ras_top <= ram_REG_ras_top;
      ram_7_ras_idx <= ram_REG_ras_idx;
      ram_7_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h8)) begin
      if (_GEN_26) begin
        ram_8_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_8_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_8_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_8_cfi_mispredicted <= ~_GEN_26 & ram_8_cfi_mispredicted;
      if (_GEN_26) begin
        ram_8_cfi_type <= io_enq_bits_cfi_type;
        ram_8_br_mask <= new_entry_br_mask;
        ram_8_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_8_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_8_ras_top <= io_enq_bits_ras_top;
        ram_8_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_8_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_8_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_8_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_8_cfi_taken <= ram_REG_cfi_taken;
      ram_8_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_8_cfi_type <= ram_REG_cfi_type;
      ram_8_br_mask <= ram_REG_br_mask;
      ram_8_cfi_is_call <= ram_REG_cfi_is_call;
      ram_8_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_8_ras_top <= ram_REG_ras_top;
      ram_8_ras_idx <= ram_REG_ras_idx;
      ram_8_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h9)) begin
      if (_GEN_27) begin
        ram_9_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_9_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_9_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_9_cfi_mispredicted <= ~_GEN_27 & ram_9_cfi_mispredicted;
      if (_GEN_27) begin
        ram_9_cfi_type <= io_enq_bits_cfi_type;
        ram_9_br_mask <= new_entry_br_mask;
        ram_9_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_9_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_9_ras_top <= io_enq_bits_ras_top;
        ram_9_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_9_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_9_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_9_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_9_cfi_taken <= ram_REG_cfi_taken;
      ram_9_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_9_cfi_type <= ram_REG_cfi_type;
      ram_9_br_mask <= ram_REG_br_mask;
      ram_9_cfi_is_call <= ram_REG_cfi_is_call;
      ram_9_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_9_ras_top <= ram_REG_ras_top;
      ram_9_ras_idx <= ram_REG_ras_idx;
      ram_9_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'hA)) begin
      if (_GEN_28) begin
        ram_10_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_10_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_10_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_10_cfi_mispredicted <= ~_GEN_28 & ram_10_cfi_mispredicted;
      if (_GEN_28) begin
        ram_10_cfi_type <= io_enq_bits_cfi_type;
        ram_10_br_mask <= new_entry_br_mask;
        ram_10_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_10_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_10_ras_top <= io_enq_bits_ras_top;
        ram_10_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_10_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_10_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_10_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_10_cfi_taken <= ram_REG_cfi_taken;
      ram_10_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_10_cfi_type <= ram_REG_cfi_type;
      ram_10_br_mask <= ram_REG_br_mask;
      ram_10_cfi_is_call <= ram_REG_cfi_is_call;
      ram_10_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_10_ras_top <= ram_REG_ras_top;
      ram_10_ras_idx <= ram_REG_ras_idx;
      ram_10_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'hB)) begin
      if (_GEN_29) begin
        ram_11_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_11_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_11_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_11_cfi_mispredicted <= ~_GEN_29 & ram_11_cfi_mispredicted;
      if (_GEN_29) begin
        ram_11_cfi_type <= io_enq_bits_cfi_type;
        ram_11_br_mask <= new_entry_br_mask;
        ram_11_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_11_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_11_ras_top <= io_enq_bits_ras_top;
        ram_11_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_11_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_11_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_11_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_11_cfi_taken <= ram_REG_cfi_taken;
      ram_11_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_11_cfi_type <= ram_REG_cfi_type;
      ram_11_br_mask <= ram_REG_br_mask;
      ram_11_cfi_is_call <= ram_REG_cfi_is_call;
      ram_11_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_11_ras_top <= ram_REG_ras_top;
      ram_11_ras_idx <= ram_REG_ras_idx;
      ram_11_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'hC)) begin
      if (_GEN_30) begin
        ram_12_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_12_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_12_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_12_cfi_mispredicted <= ~_GEN_30 & ram_12_cfi_mispredicted;
      if (_GEN_30) begin
        ram_12_cfi_type <= io_enq_bits_cfi_type;
        ram_12_br_mask <= new_entry_br_mask;
        ram_12_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_12_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_12_ras_top <= io_enq_bits_ras_top;
        ram_12_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_12_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_12_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_12_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_12_cfi_taken <= ram_REG_cfi_taken;
      ram_12_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_12_cfi_type <= ram_REG_cfi_type;
      ram_12_br_mask <= ram_REG_br_mask;
      ram_12_cfi_is_call <= ram_REG_cfi_is_call;
      ram_12_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_12_ras_top <= ram_REG_ras_top;
      ram_12_ras_idx <= ram_REG_ras_idx;
      ram_12_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'hD)) begin
      if (_GEN_31) begin
        ram_13_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_13_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_13_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_13_cfi_mispredicted <= ~_GEN_31 & ram_13_cfi_mispredicted;
      if (_GEN_31) begin
        ram_13_cfi_type <= io_enq_bits_cfi_type;
        ram_13_br_mask <= new_entry_br_mask;
        ram_13_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_13_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_13_ras_top <= io_enq_bits_ras_top;
        ram_13_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_13_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_13_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_13_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_13_cfi_taken <= ram_REG_cfi_taken;
      ram_13_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_13_cfi_type <= ram_REG_cfi_type;
      ram_13_br_mask <= ram_REG_br_mask;
      ram_13_cfi_is_call <= ram_REG_cfi_is_call;
      ram_13_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_13_ras_top <= ram_REG_ras_top;
      ram_13_ras_idx <= ram_REG_ras_idx;
      ram_13_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'hE)) begin
      if (_GEN_32) begin
        ram_14_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_14_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_14_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_14_cfi_mispredicted <= ~_GEN_32 & ram_14_cfi_mispredicted;
      if (_GEN_32) begin
        ram_14_cfi_type <= io_enq_bits_cfi_type;
        ram_14_br_mask <= new_entry_br_mask;
        ram_14_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_14_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_14_ras_top <= io_enq_bits_ras_top;
        ram_14_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_14_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_14_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_14_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_14_cfi_taken <= ram_REG_cfi_taken;
      ram_14_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_14_cfi_type <= ram_REG_cfi_type;
      ram_14_br_mask <= ram_REG_br_mask;
      ram_14_cfi_is_call <= ram_REG_cfi_is_call;
      ram_14_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_14_ras_top <= ram_REG_ras_top;
      ram_14_ras_idx <= ram_REG_ras_idx;
      ram_14_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'hF)) begin
      if (_GEN_33) begin
        ram_15_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_15_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_15_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_15_cfi_mispredicted <= ~_GEN_33 & ram_15_cfi_mispredicted;
      if (_GEN_33) begin
        ram_15_cfi_type <= io_enq_bits_cfi_type;
        ram_15_br_mask <= new_entry_br_mask;
        ram_15_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_15_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_15_ras_top <= io_enq_bits_ras_top;
        ram_15_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_15_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_15_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_15_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_15_cfi_taken <= ram_REG_cfi_taken;
      ram_15_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_15_cfi_type <= ram_REG_cfi_type;
      ram_15_br_mask <= ram_REG_br_mask;
      ram_15_cfi_is_call <= ram_REG_cfi_is_call;
      ram_15_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_15_ras_top <= ram_REG_ras_top;
      ram_15_ras_idx <= ram_REG_ras_idx;
      ram_15_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h10)) begin
      if (_GEN_34) begin
        ram_16_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_16_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_16_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_16_cfi_mispredicted <= ~_GEN_34 & ram_16_cfi_mispredicted;
      if (_GEN_34) begin
        ram_16_cfi_type <= io_enq_bits_cfi_type;
        ram_16_br_mask <= new_entry_br_mask;
        ram_16_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_16_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_16_ras_top <= io_enq_bits_ras_top;
        ram_16_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_16_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_16_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_16_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_16_cfi_taken <= ram_REG_cfi_taken;
      ram_16_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_16_cfi_type <= ram_REG_cfi_type;
      ram_16_br_mask <= ram_REG_br_mask;
      ram_16_cfi_is_call <= ram_REG_cfi_is_call;
      ram_16_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_16_ras_top <= ram_REG_ras_top;
      ram_16_ras_idx <= ram_REG_ras_idx;
      ram_16_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h11)) begin
      if (_GEN_35) begin
        ram_17_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_17_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_17_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_17_cfi_mispredicted <= ~_GEN_35 & ram_17_cfi_mispredicted;
      if (_GEN_35) begin
        ram_17_cfi_type <= io_enq_bits_cfi_type;
        ram_17_br_mask <= new_entry_br_mask;
        ram_17_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_17_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_17_ras_top <= io_enq_bits_ras_top;
        ram_17_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_17_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_17_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_17_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_17_cfi_taken <= ram_REG_cfi_taken;
      ram_17_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_17_cfi_type <= ram_REG_cfi_type;
      ram_17_br_mask <= ram_REG_br_mask;
      ram_17_cfi_is_call <= ram_REG_cfi_is_call;
      ram_17_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_17_ras_top <= ram_REG_ras_top;
      ram_17_ras_idx <= ram_REG_ras_idx;
      ram_17_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h12)) begin
      if (_GEN_36) begin
        ram_18_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_18_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_18_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_18_cfi_mispredicted <= ~_GEN_36 & ram_18_cfi_mispredicted;
      if (_GEN_36) begin
        ram_18_cfi_type <= io_enq_bits_cfi_type;
        ram_18_br_mask <= new_entry_br_mask;
        ram_18_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_18_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_18_ras_top <= io_enq_bits_ras_top;
        ram_18_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_18_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_18_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_18_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_18_cfi_taken <= ram_REG_cfi_taken;
      ram_18_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_18_cfi_type <= ram_REG_cfi_type;
      ram_18_br_mask <= ram_REG_br_mask;
      ram_18_cfi_is_call <= ram_REG_cfi_is_call;
      ram_18_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_18_ras_top <= ram_REG_ras_top;
      ram_18_ras_idx <= ram_REG_ras_idx;
      ram_18_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h13)) begin
      if (_GEN_37) begin
        ram_19_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_19_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_19_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_19_cfi_mispredicted <= ~_GEN_37 & ram_19_cfi_mispredicted;
      if (_GEN_37) begin
        ram_19_cfi_type <= io_enq_bits_cfi_type;
        ram_19_br_mask <= new_entry_br_mask;
        ram_19_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_19_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_19_ras_top <= io_enq_bits_ras_top;
        ram_19_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_19_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_19_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_19_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_19_cfi_taken <= ram_REG_cfi_taken;
      ram_19_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_19_cfi_type <= ram_REG_cfi_type;
      ram_19_br_mask <= ram_REG_br_mask;
      ram_19_cfi_is_call <= ram_REG_cfi_is_call;
      ram_19_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_19_ras_top <= ram_REG_ras_top;
      ram_19_ras_idx <= ram_REG_ras_idx;
      ram_19_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h14)) begin
      if (_GEN_38) begin
        ram_20_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_20_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_20_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_20_cfi_mispredicted <= ~_GEN_38 & ram_20_cfi_mispredicted;
      if (_GEN_38) begin
        ram_20_cfi_type <= io_enq_bits_cfi_type;
        ram_20_br_mask <= new_entry_br_mask;
        ram_20_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_20_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_20_ras_top <= io_enq_bits_ras_top;
        ram_20_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_20_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_20_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_20_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_20_cfi_taken <= ram_REG_cfi_taken;
      ram_20_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_20_cfi_type <= ram_REG_cfi_type;
      ram_20_br_mask <= ram_REG_br_mask;
      ram_20_cfi_is_call <= ram_REG_cfi_is_call;
      ram_20_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_20_ras_top <= ram_REG_ras_top;
      ram_20_ras_idx <= ram_REG_ras_idx;
      ram_20_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h15)) begin
      if (_GEN_39) begin
        ram_21_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_21_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_21_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_21_cfi_mispredicted <= ~_GEN_39 & ram_21_cfi_mispredicted;
      if (_GEN_39) begin
        ram_21_cfi_type <= io_enq_bits_cfi_type;
        ram_21_br_mask <= new_entry_br_mask;
        ram_21_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_21_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_21_ras_top <= io_enq_bits_ras_top;
        ram_21_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_21_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_21_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_21_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_21_cfi_taken <= ram_REG_cfi_taken;
      ram_21_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_21_cfi_type <= ram_REG_cfi_type;
      ram_21_br_mask <= ram_REG_br_mask;
      ram_21_cfi_is_call <= ram_REG_cfi_is_call;
      ram_21_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_21_ras_top <= ram_REG_ras_top;
      ram_21_ras_idx <= ram_REG_ras_idx;
      ram_21_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h16)) begin
      if (_GEN_40) begin
        ram_22_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_22_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_22_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_22_cfi_mispredicted <= ~_GEN_40 & ram_22_cfi_mispredicted;
      if (_GEN_40) begin
        ram_22_cfi_type <= io_enq_bits_cfi_type;
        ram_22_br_mask <= new_entry_br_mask;
        ram_22_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_22_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_22_ras_top <= io_enq_bits_ras_top;
        ram_22_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_22_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_22_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_22_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_22_cfi_taken <= ram_REG_cfi_taken;
      ram_22_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_22_cfi_type <= ram_REG_cfi_type;
      ram_22_br_mask <= ram_REG_br_mask;
      ram_22_cfi_is_call <= ram_REG_cfi_is_call;
      ram_22_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_22_ras_top <= ram_REG_ras_top;
      ram_22_ras_idx <= ram_REG_ras_idx;
      ram_22_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h17)) begin
      if (_GEN_41) begin
        ram_23_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_23_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_23_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_23_cfi_mispredicted <= ~_GEN_41 & ram_23_cfi_mispredicted;
      if (_GEN_41) begin
        ram_23_cfi_type <= io_enq_bits_cfi_type;
        ram_23_br_mask <= new_entry_br_mask;
        ram_23_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_23_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_23_ras_top <= io_enq_bits_ras_top;
        ram_23_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_23_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_23_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_23_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_23_cfi_taken <= ram_REG_cfi_taken;
      ram_23_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_23_cfi_type <= ram_REG_cfi_type;
      ram_23_br_mask <= ram_REG_br_mask;
      ram_23_cfi_is_call <= ram_REG_cfi_is_call;
      ram_23_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_23_ras_top <= ram_REG_ras_top;
      ram_23_ras_idx <= ram_REG_ras_idx;
      ram_23_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h18)) begin
      if (_GEN_42) begin
        ram_24_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_24_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_24_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_24_cfi_mispredicted <= ~_GEN_42 & ram_24_cfi_mispredicted;
      if (_GEN_42) begin
        ram_24_cfi_type <= io_enq_bits_cfi_type;
        ram_24_br_mask <= new_entry_br_mask;
        ram_24_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_24_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_24_ras_top <= io_enq_bits_ras_top;
        ram_24_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_24_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_24_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_24_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_24_cfi_taken <= ram_REG_cfi_taken;
      ram_24_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_24_cfi_type <= ram_REG_cfi_type;
      ram_24_br_mask <= ram_REG_br_mask;
      ram_24_cfi_is_call <= ram_REG_cfi_is_call;
      ram_24_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_24_ras_top <= ram_REG_ras_top;
      ram_24_ras_idx <= ram_REG_ras_idx;
      ram_24_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h19)) begin
      if (_GEN_43) begin
        ram_25_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_25_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_25_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_25_cfi_mispredicted <= ~_GEN_43 & ram_25_cfi_mispredicted;
      if (_GEN_43) begin
        ram_25_cfi_type <= io_enq_bits_cfi_type;
        ram_25_br_mask <= new_entry_br_mask;
        ram_25_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_25_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_25_ras_top <= io_enq_bits_ras_top;
        ram_25_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_25_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_25_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_25_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_25_cfi_taken <= ram_REG_cfi_taken;
      ram_25_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_25_cfi_type <= ram_REG_cfi_type;
      ram_25_br_mask <= ram_REG_br_mask;
      ram_25_cfi_is_call <= ram_REG_cfi_is_call;
      ram_25_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_25_ras_top <= ram_REG_ras_top;
      ram_25_ras_idx <= ram_REG_ras_idx;
      ram_25_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h1A)) begin
      if (_GEN_44) begin
        ram_26_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_26_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_26_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_26_cfi_mispredicted <= ~_GEN_44 & ram_26_cfi_mispredicted;
      if (_GEN_44) begin
        ram_26_cfi_type <= io_enq_bits_cfi_type;
        ram_26_br_mask <= new_entry_br_mask;
        ram_26_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_26_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_26_ras_top <= io_enq_bits_ras_top;
        ram_26_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_26_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_26_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_26_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_26_cfi_taken <= ram_REG_cfi_taken;
      ram_26_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_26_cfi_type <= ram_REG_cfi_type;
      ram_26_br_mask <= ram_REG_br_mask;
      ram_26_cfi_is_call <= ram_REG_cfi_is_call;
      ram_26_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_26_ras_top <= ram_REG_ras_top;
      ram_26_ras_idx <= ram_REG_ras_idx;
      ram_26_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h1B)) begin
      if (_GEN_45) begin
        ram_27_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_27_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_27_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_27_cfi_mispredicted <= ~_GEN_45 & ram_27_cfi_mispredicted;
      if (_GEN_45) begin
        ram_27_cfi_type <= io_enq_bits_cfi_type;
        ram_27_br_mask <= new_entry_br_mask;
        ram_27_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_27_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_27_ras_top <= io_enq_bits_ras_top;
        ram_27_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_27_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_27_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_27_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_27_cfi_taken <= ram_REG_cfi_taken;
      ram_27_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_27_cfi_type <= ram_REG_cfi_type;
      ram_27_br_mask <= ram_REG_br_mask;
      ram_27_cfi_is_call <= ram_REG_cfi_is_call;
      ram_27_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_27_ras_top <= ram_REG_ras_top;
      ram_27_ras_idx <= ram_REG_ras_idx;
      ram_27_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h1C)) begin
      if (_GEN_46) begin
        ram_28_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_28_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_28_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_28_cfi_mispredicted <= ~_GEN_46 & ram_28_cfi_mispredicted;
      if (_GEN_46) begin
        ram_28_cfi_type <= io_enq_bits_cfi_type;
        ram_28_br_mask <= new_entry_br_mask;
        ram_28_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_28_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_28_ras_top <= io_enq_bits_ras_top;
        ram_28_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_28_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_28_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_28_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_28_cfi_taken <= ram_REG_cfi_taken;
      ram_28_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_28_cfi_type <= ram_REG_cfi_type;
      ram_28_br_mask <= ram_REG_br_mask;
      ram_28_cfi_is_call <= ram_REG_cfi_is_call;
      ram_28_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_28_ras_top <= ram_REG_ras_top;
      ram_28_ras_idx <= ram_REG_ras_idx;
      ram_28_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h1D)) begin
      if (_GEN_47) begin
        ram_29_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_29_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_29_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_29_cfi_mispredicted <= ~_GEN_47 & ram_29_cfi_mispredicted;
      if (_GEN_47) begin
        ram_29_cfi_type <= io_enq_bits_cfi_type;
        ram_29_br_mask <= new_entry_br_mask;
        ram_29_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_29_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_29_ras_top <= io_enq_bits_ras_top;
        ram_29_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_29_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_29_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_29_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_29_cfi_taken <= ram_REG_cfi_taken;
      ram_29_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_29_cfi_type <= ram_REG_cfi_type;
      ram_29_br_mask <= ram_REG_br_mask;
      ram_29_cfi_is_call <= ram_REG_cfi_is_call;
      ram_29_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_29_ras_top <= ram_REG_ras_top;
      ram_29_ras_idx <= ram_REG_ras_idx;
      ram_29_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h1E)) begin
      if (_GEN_48) begin
        ram_30_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_30_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_30_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_30_cfi_mispredicted <= ~_GEN_48 & ram_30_cfi_mispredicted;
      if (_GEN_48) begin
        ram_30_cfi_type <= io_enq_bits_cfi_type;
        ram_30_br_mask <= new_entry_br_mask;
        ram_30_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_30_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_30_ras_top <= io_enq_bits_ras_top;
        ram_30_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_30_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_30_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_30_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_30_cfi_taken <= ram_REG_cfi_taken;
      ram_30_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_30_cfi_type <= ram_REG_cfi_type;
      ram_30_br_mask <= ram_REG_br_mask;
      ram_30_cfi_is_call <= ram_REG_cfi_is_call;
      ram_30_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_30_ras_top <= ram_REG_ras_top;
      ram_30_ras_idx <= ram_REG_ras_idx;
      ram_30_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h1F)) begin
      if (_GEN_49) begin
        ram_31_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_31_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_31_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_31_cfi_mispredicted <= ~_GEN_49 & ram_31_cfi_mispredicted;
      if (_GEN_49) begin
        ram_31_cfi_type <= io_enq_bits_cfi_type;
        ram_31_br_mask <= new_entry_br_mask;
        ram_31_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_31_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_31_ras_top <= io_enq_bits_ras_top;
        ram_31_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_31_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_31_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_31_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_31_cfi_taken <= ram_REG_cfi_taken;
      ram_31_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_31_cfi_type <= ram_REG_cfi_type;
      ram_31_br_mask <= ram_REG_br_mask;
      ram_31_cfi_is_call <= ram_REG_cfi_is_call;
      ram_31_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_31_ras_top <= ram_REG_ras_top;
      ram_31_ras_idx <= ram_REG_ras_idx;
      ram_31_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h20)) begin
      if (_GEN_50) begin
        ram_32_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_32_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_32_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_32_cfi_mispredicted <= ~_GEN_50 & ram_32_cfi_mispredicted;
      if (_GEN_50) begin
        ram_32_cfi_type <= io_enq_bits_cfi_type;
        ram_32_br_mask <= new_entry_br_mask;
        ram_32_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_32_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_32_ras_top <= io_enq_bits_ras_top;
        ram_32_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_32_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_32_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_32_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_32_cfi_taken <= ram_REG_cfi_taken;
      ram_32_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_32_cfi_type <= ram_REG_cfi_type;
      ram_32_br_mask <= ram_REG_br_mask;
      ram_32_cfi_is_call <= ram_REG_cfi_is_call;
      ram_32_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_32_ras_top <= ram_REG_ras_top;
      ram_32_ras_idx <= ram_REG_ras_idx;
      ram_32_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h21)) begin
      if (_GEN_51) begin
        ram_33_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_33_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_33_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_33_cfi_mispredicted <= ~_GEN_51 & ram_33_cfi_mispredicted;
      if (_GEN_51) begin
        ram_33_cfi_type <= io_enq_bits_cfi_type;
        ram_33_br_mask <= new_entry_br_mask;
        ram_33_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_33_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_33_ras_top <= io_enq_bits_ras_top;
        ram_33_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_33_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_33_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_33_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_33_cfi_taken <= ram_REG_cfi_taken;
      ram_33_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_33_cfi_type <= ram_REG_cfi_type;
      ram_33_br_mask <= ram_REG_br_mask;
      ram_33_cfi_is_call <= ram_REG_cfi_is_call;
      ram_33_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_33_ras_top <= ram_REG_ras_top;
      ram_33_ras_idx <= ram_REG_ras_idx;
      ram_33_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h22)) begin
      if (_GEN_52) begin
        ram_34_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_34_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_34_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_34_cfi_mispredicted <= ~_GEN_52 & ram_34_cfi_mispredicted;
      if (_GEN_52) begin
        ram_34_cfi_type <= io_enq_bits_cfi_type;
        ram_34_br_mask <= new_entry_br_mask;
        ram_34_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_34_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_34_ras_top <= io_enq_bits_ras_top;
        ram_34_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_34_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_34_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_34_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_34_cfi_taken <= ram_REG_cfi_taken;
      ram_34_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_34_cfi_type <= ram_REG_cfi_type;
      ram_34_br_mask <= ram_REG_br_mask;
      ram_34_cfi_is_call <= ram_REG_cfi_is_call;
      ram_34_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_34_ras_top <= ram_REG_ras_top;
      ram_34_ras_idx <= ram_REG_ras_idx;
      ram_34_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h23)) begin
      if (_GEN_53) begin
        ram_35_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_35_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_35_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_35_cfi_mispredicted <= ~_GEN_53 & ram_35_cfi_mispredicted;
      if (_GEN_53) begin
        ram_35_cfi_type <= io_enq_bits_cfi_type;
        ram_35_br_mask <= new_entry_br_mask;
        ram_35_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_35_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_35_ras_top <= io_enq_bits_ras_top;
        ram_35_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_35_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_35_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_35_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_35_cfi_taken <= ram_REG_cfi_taken;
      ram_35_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_35_cfi_type <= ram_REG_cfi_type;
      ram_35_br_mask <= ram_REG_br_mask;
      ram_35_cfi_is_call <= ram_REG_cfi_is_call;
      ram_35_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_35_ras_top <= ram_REG_ras_top;
      ram_35_ras_idx <= ram_REG_ras_idx;
      ram_35_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h24)) begin
      if (_GEN_54) begin
        ram_36_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_36_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_36_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_36_cfi_mispredicted <= ~_GEN_54 & ram_36_cfi_mispredicted;
      if (_GEN_54) begin
        ram_36_cfi_type <= io_enq_bits_cfi_type;
        ram_36_br_mask <= new_entry_br_mask;
        ram_36_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_36_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_36_ras_top <= io_enq_bits_ras_top;
        ram_36_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_36_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_36_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_36_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_36_cfi_taken <= ram_REG_cfi_taken;
      ram_36_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_36_cfi_type <= ram_REG_cfi_type;
      ram_36_br_mask <= ram_REG_br_mask;
      ram_36_cfi_is_call <= ram_REG_cfi_is_call;
      ram_36_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_36_ras_top <= ram_REG_ras_top;
      ram_36_ras_idx <= ram_REG_ras_idx;
      ram_36_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h25)) begin
      if (_GEN_55) begin
        ram_37_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_37_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_37_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_37_cfi_mispredicted <= ~_GEN_55 & ram_37_cfi_mispredicted;
      if (_GEN_55) begin
        ram_37_cfi_type <= io_enq_bits_cfi_type;
        ram_37_br_mask <= new_entry_br_mask;
        ram_37_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_37_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_37_ras_top <= io_enq_bits_ras_top;
        ram_37_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_37_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_37_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_37_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_37_cfi_taken <= ram_REG_cfi_taken;
      ram_37_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_37_cfi_type <= ram_REG_cfi_type;
      ram_37_br_mask <= ram_REG_br_mask;
      ram_37_cfi_is_call <= ram_REG_cfi_is_call;
      ram_37_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_37_ras_top <= ram_REG_ras_top;
      ram_37_ras_idx <= ram_REG_ras_idx;
      ram_37_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h26)) begin
      if (_GEN_56) begin
        ram_38_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_38_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_38_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_38_cfi_mispredicted <= ~_GEN_56 & ram_38_cfi_mispredicted;
      if (_GEN_56) begin
        ram_38_cfi_type <= io_enq_bits_cfi_type;
        ram_38_br_mask <= new_entry_br_mask;
        ram_38_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_38_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_38_ras_top <= io_enq_bits_ras_top;
        ram_38_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_38_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_38_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_38_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_38_cfi_taken <= ram_REG_cfi_taken;
      ram_38_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_38_cfi_type <= ram_REG_cfi_type;
      ram_38_br_mask <= ram_REG_br_mask;
      ram_38_cfi_is_call <= ram_REG_cfi_is_call;
      ram_38_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_38_ras_top <= ram_REG_ras_top;
      ram_38_ras_idx <= ram_REG_ras_idx;
      ram_38_start_bank <= ram_REG_start_bank;
    end
    if (io_redirect_valid | ~(REG_3 & REG_4 == 6'h27)) begin
      if (_GEN_57) begin
        ram_39_cfi_idx_valid <= io_enq_bits_cfi_idx_valid;
        ram_39_cfi_idx_bits <= io_enq_bits_cfi_idx_bits;
        ram_39_cfi_taken <= io_enq_bits_cfi_idx_valid;
      end
      ram_39_cfi_mispredicted <= ~_GEN_57 & ram_39_cfi_mispredicted;
      if (_GEN_57) begin
        ram_39_cfi_type <= io_enq_bits_cfi_type;
        ram_39_br_mask <= new_entry_br_mask;
        ram_39_cfi_is_call <= io_enq_bits_cfi_is_call;
        ram_39_cfi_is_ret <= io_enq_bits_cfi_is_ret;
        ram_39_ras_top <= io_enq_bits_ras_top;
        ram_39_ras_idx <= io_enq_bits_ghist_ras_idx;
        ram_39_start_bank <= io_enq_bits_pc[3];
      end
    end
    else begin
      ram_39_cfi_idx_valid <= ram_REG_cfi_idx_valid;
      ram_39_cfi_idx_bits <= ram_REG_cfi_idx_bits;
      ram_39_cfi_taken <= ram_REG_cfi_taken;
      ram_39_cfi_mispredicted <= ram_REG_cfi_mispredicted;
      ram_39_cfi_type <= ram_REG_cfi_type;
      ram_39_br_mask <= ram_REG_br_mask;
      ram_39_cfi_is_call <= ram_REG_cfi_is_call;
      ram_39_cfi_is_ret <= ram_REG_cfi_is_ret;
      ram_39_ras_top <= ram_REG_ras_top;
      ram_39_ras_idx <= ram_REG_ras_idx;
      ram_39_start_bank <= ram_REG_start_bank;
    end
    io_ras_update_REG <= io_redirect_valid;
    io_ras_update_pc_REG <= io_redirect_valid ? casez_tmp_15 : 40'h0;
    io_ras_update_idx_REG <= io_redirect_valid ? casez_tmp_16 : 5'h0;
    if (io_redirect_valid) begin
    end
    else if (REG)
      bpd_repair_idx <= bpd_repair_idx_REG;
    else if (bpd_update_mispredict) begin
      if (bpd_repair_idx == 6'h27)
        bpd_repair_idx <= 6'h0;
      else
        bpd_repair_idx <= bpd_repair_idx + 6'h1;
    end
    else if (_GEN_58) begin
      if (bpd_repair_idx == 6'h27)
        bpd_repair_idx <= 6'h0;
      else
        bpd_repair_idx <= bpd_repair_idx + 6'h1;
    end
    else if (bpd_update_repair) begin
      if (wrap)
        bpd_repair_idx <= 6'h0;
      else
        bpd_repair_idx <= _bpd_repair_idx_T_6;
    end
    if (io_redirect_valid | ~REG) begin
    end
    else
      bpd_end_idx <= bpd_end_idx_REG;
    if (io_redirect_valid | REG | bpd_update_mispredict | ~_GEN_58) begin
    end
    else
      bpd_repair_pc <= bpd_pc;
    bpd_entry_cfi_idx_valid <= casez_tmp;
    bpd_entry_cfi_idx_bits <= casez_tmp_0;
    bpd_entry_cfi_taken <= casez_tmp_1;
    bpd_entry_cfi_mispredicted <= casez_tmp_2;
    bpd_entry_cfi_type <= casez_tmp_3;
    bpd_entry_br_mask <= casez_tmp_4;
    bpd_pc <= casez_tmp_5;
    bpd_target <= casez_tmp_6;
    REG <= io_brupdate_b2_mispredict;
    bpd_repair_idx_REG <= io_brupdate_b2_uop_ftq_idx;
    bpd_end_idx_REG <= enq_ptr;
    REG_1 <= bpd_update_mispredict;
    do_commit_update_REG <= io_redirect_valid;
    REG_2 <= do_commit_update | bpd_update_repair | bpd_update_mispredict;
    io_bpdupdate_valid_REG <= bpd_update_repair;
    io_bpdupdate_bits_is_mispredict_update_REG <= bpd_update_mispredict;
    io_bpdupdate_bits_is_repair_update_REG <= bpd_update_repair;
    io_enq_ready_REG <= ~((_full_T_2 == 6'h27 ? 6'h0 : _full_T_2 + 6'h1) == bpd_ptr | (full_wrap ? 6'h0 : _enq_ptr_T) == bpd_ptr) | do_commit_update;
    REG_3 <= io_redirect_valid;
    prev_entry_REG_cfi_idx_valid <= redirect_new_entry_cfi_idx_valid;
    prev_entry_REG_cfi_idx_bits <= redirect_new_entry_cfi_idx_bits;
    prev_entry_REG_cfi_taken <= redirect_new_entry_cfi_taken;
    prev_entry_REG_br_mask <= casez_tmp_12;
    prev_entry_REG_cfi_is_call <= redirect_new_entry_cfi_is_call;
    prev_entry_REG_cfi_is_ret <= redirect_new_entry_cfi_is_ret;
    REG_4 <= io_redirect_bits;
    ram_REG_cfi_idx_valid <= redirect_new_entry_cfi_idx_valid;
    ram_REG_cfi_idx_bits <= redirect_new_entry_cfi_idx_bits;
    ram_REG_cfi_taken <= redirect_new_entry_cfi_taken;
    ram_REG_cfi_mispredicted <= _GEN_59 | casez_tmp_10;
    ram_REG_cfi_type <= casez_tmp_11;
    ram_REG_br_mask <= casez_tmp_12;
    ram_REG_cfi_is_call <= redirect_new_entry_cfi_is_call;
    ram_REG_cfi_is_ret <= redirect_new_entry_cfi_is_ret;
    ram_REG_ras_top <= casez_tmp_15;
    ram_REG_ras_idx <= casez_tmp_16;
    ram_REG_start_bank <= casez_tmp_17;
    io_get_ftq_pc_0_entry_REG_cfi_idx_valid <= casez_tmp_19;
    io_get_ftq_pc_0_entry_REG_cfi_idx_bits <= casez_tmp_20;
    io_get_ftq_pc_0_entry_REG_ras_idx <= casez_tmp_21;
    io_get_ftq_pc_0_entry_REG_start_bank <= casez_tmp_22;
    io_get_ftq_pc_0_pc_REG <= casez_tmp_23;
    io_get_ftq_pc_0_next_pc_REG <= next_is_enq ? io_enq_bits_pc : casez_tmp_18;
    io_get_ftq_pc_0_next_val_REG <= next_idx != enq_ptr | next_is_enq;
    io_get_ftq_pc_0_com_pc_REG <= casez_tmp_24;
    io_get_ftq_pc_1_entry_REG_cfi_idx_bits <= casez_tmp_25;
    io_get_ftq_pc_1_entry_REG_br_mask <= casez_tmp_26;
    io_get_ftq_pc_1_entry_REG_cfi_is_call <= casez_tmp_27;
    io_get_ftq_pc_1_entry_REG_cfi_is_ret <= casez_tmp_28;
    io_get_ftq_pc_1_entry_REG_start_bank <= casez_tmp_29;
    io_get_ftq_pc_1_pc_REG <= casez_tmp_30;
  end // always @(posedge)
  meta_40x240 meta_ext (
    .R0_addr (_bpd_meta_T_1),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_meta_ext_R0_data),
    .W0_addr (enq_ptr),
    .W0_en   (ghist_1_MPORT_1_en),
    .W0_clk  (clock),
    .W0_data ({io_enq_bits_bpd_meta_1, io_enq_bits_bpd_meta_0})
  );
  ghist_40x72 ghist_0_ext (
    .R0_addr (_bpd_meta_T_1),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_ghist_0_ext_R0_data),
    .W0_addr (enq_ptr),
    .W0_en   (ghist_1_MPORT_1_en),
    .W0_clk  (clock),
    .W0_data (_GEN)
  );
  ghist_40x72 ghist_1_ext (
    .R0_addr (io_get_ftq_pc_1_ftq_idx),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_ghist_1_ext_R0_data),
    .W0_addr (enq_ptr),
    .W0_en   (ghist_1_MPORT_1_en),
    .W0_clk  (clock),
    .W0_data (_GEN)
  );
  assign io_enq_ready = io_enq_ready_REG;
  assign io_enq_idx = enq_ptr;
  assign io_get_ftq_pc_0_entry_cfi_idx_valid = io_get_ftq_pc_0_entry_REG_cfi_idx_valid;
  assign io_get_ftq_pc_0_entry_cfi_idx_bits = io_get_ftq_pc_0_entry_REG_cfi_idx_bits;
  assign io_get_ftq_pc_0_entry_ras_idx = io_get_ftq_pc_0_entry_REG_ras_idx;
  assign io_get_ftq_pc_0_entry_start_bank = io_get_ftq_pc_0_entry_REG_start_bank;
  assign io_get_ftq_pc_0_pc = io_get_ftq_pc_0_pc_REG;
  assign io_get_ftq_pc_0_com_pc = io_get_ftq_pc_0_com_pc_REG;
  assign io_get_ftq_pc_0_next_val = io_get_ftq_pc_0_next_val_REG;
  assign io_get_ftq_pc_0_next_pc = io_get_ftq_pc_0_next_pc_REG;
  assign io_get_ftq_pc_1_entry_cfi_idx_bits = io_get_ftq_pc_1_entry_REG_cfi_idx_bits;
  assign io_get_ftq_pc_1_entry_br_mask = io_get_ftq_pc_1_entry_REG_br_mask;
  assign io_get_ftq_pc_1_entry_cfi_is_call = io_get_ftq_pc_1_entry_REG_cfi_is_call;
  assign io_get_ftq_pc_1_entry_cfi_is_ret = io_get_ftq_pc_1_entry_REG_cfi_is_ret;
  assign io_get_ftq_pc_1_entry_start_bank = io_get_ftq_pc_1_entry_REG_start_bank;
  assign io_get_ftq_pc_1_ghist_old_history = _ghist_1_ext_R0_data[63:0];
  assign io_get_ftq_pc_1_ghist_current_saw_branch_not_taken = _ghist_1_ext_R0_data[64];
  assign io_get_ftq_pc_1_ghist_new_saw_branch_not_taken = _ghist_1_ext_R0_data[65];
  assign io_get_ftq_pc_1_ghist_new_saw_branch_taken = _ghist_1_ext_R0_data[66];
  assign io_get_ftq_pc_1_ghist_ras_idx = _ghist_1_ext_R0_data[71:67];
  assign io_get_ftq_pc_1_pc = io_get_ftq_pc_1_pc_REG;
  assign io_bpdupdate_valid = REG_2 & ~first_empty & (bpd_entry_cfi_idx_valid | (|bpd_entry_br_mask)) & ~(io_bpdupdate_valid_REG & bpd_pc == bpd_repair_pc);
  assign io_bpdupdate_bits_is_mispredict_update = io_bpdupdate_bits_is_mispredict_update_REG;
  assign io_bpdupdate_bits_is_repair_update = io_bpdupdate_bits_is_repair_update_REG;
  assign io_bpdupdate_bits_pc = bpd_pc;
  assign io_bpdupdate_bits_br_mask = ({8{~bpd_entry_cfi_idx_valid}} | {&bpd_entry_cfi_idx_bits, _GEN_12[6], _GEN_13[5], _GEN_14[4], _GEN_15[3], _GEN_16[2], _GEN_17[1], _GEN_17[0] | (&bpd_entry_cfi_idx_bits)}) & bpd_entry_br_mask;
  assign io_bpdupdate_bits_cfi_idx_valid = bpd_entry_cfi_idx_valid;
  assign io_bpdupdate_bits_cfi_idx_bits = bpd_entry_cfi_idx_bits;
  assign io_bpdupdate_bits_cfi_taken = bpd_entry_cfi_taken;
  assign io_bpdupdate_bits_cfi_mispredicted = bpd_entry_cfi_mispredicted;
  assign io_bpdupdate_bits_cfi_is_br = _io_bpdupdate_bits_cfi_is_br_T[0];
  assign io_bpdupdate_bits_cfi_is_jal = bpd_entry_cfi_type == 3'h2 | bpd_entry_cfi_type == 3'h3;
  assign io_bpdupdate_bits_ghist_old_history = _ghist_0_ext_R0_data[63:0];
  assign io_bpdupdate_bits_ghist_new_saw_branch_not_taken = _ghist_0_ext_R0_data[65];
  assign io_bpdupdate_bits_ghist_new_saw_branch_taken = _ghist_0_ext_R0_data[66];
  assign io_bpdupdate_bits_target = bpd_target;
  assign io_bpdupdate_bits_meta_0 = _meta_ext_R0_data[119:0];
  assign io_bpdupdate_bits_meta_1 = _meta_ext_R0_data[239:120];
  assign io_ras_update = io_ras_update_REG;
  assign io_ras_update_idx = io_ras_update_idx_REG;
  assign io_ras_update_pc = io_ras_update_pc_REG;
endmodule

