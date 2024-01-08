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

module BoomFrontend(
  input          clock,
                 reset,
                 auto_icache_master_out_a_ready,
  output         auto_icache_master_out_a_valid,
  output [32:0]  auto_icache_master_out_a_bits_address,
  input          auto_icache_master_out_d_valid,
  input  [2:0]   auto_icache_master_out_d_bits_opcode,
  input  [3:0]   auto_icache_master_out_d_bits_size,
  input  [127:0] auto_icache_master_out_d_bits_data,
  input          io_cpu_fetchpacket_ready,
  output         io_cpu_fetchpacket_valid,
                 io_cpu_fetchpacket_bits_uops_0_valid,
  output [31:0]  io_cpu_fetchpacket_bits_uops_0_bits_inst,
                 io_cpu_fetchpacket_bits_uops_0_bits_debug_inst,
  output         io_cpu_fetchpacket_bits_uops_0_bits_is_rvc,
  output [39:0]  io_cpu_fetchpacket_bits_uops_0_bits_debug_pc,
  output         io_cpu_fetchpacket_bits_uops_0_bits_is_sfb,
  output [5:0]   io_cpu_fetchpacket_bits_uops_0_bits_ftq_idx,
  output         io_cpu_fetchpacket_bits_uops_0_bits_edge_inst,
  output [5:0]   io_cpu_fetchpacket_bits_uops_0_bits_pc_lob,
  output         io_cpu_fetchpacket_bits_uops_0_bits_taken,
                 io_cpu_fetchpacket_bits_uops_0_bits_xcpt_pf_if,
                 io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ae_if,
                 io_cpu_fetchpacket_bits_uops_0_bits_bp_debug_if,
                 io_cpu_fetchpacket_bits_uops_0_bits_bp_xcpt_if,
  output [1:0]   io_cpu_fetchpacket_bits_uops_0_bits_debug_fsrc,
  output         io_cpu_fetchpacket_bits_uops_1_valid,
  output [31:0]  io_cpu_fetchpacket_bits_uops_1_bits_inst,
                 io_cpu_fetchpacket_bits_uops_1_bits_debug_inst,
  output         io_cpu_fetchpacket_bits_uops_1_bits_is_rvc,
  output [39:0]  io_cpu_fetchpacket_bits_uops_1_bits_debug_pc,
  output         io_cpu_fetchpacket_bits_uops_1_bits_is_sfb,
  output [5:0]   io_cpu_fetchpacket_bits_uops_1_bits_ftq_idx,
  output         io_cpu_fetchpacket_bits_uops_1_bits_edge_inst,
  output [5:0]   io_cpu_fetchpacket_bits_uops_1_bits_pc_lob,
  output         io_cpu_fetchpacket_bits_uops_1_bits_taken,
                 io_cpu_fetchpacket_bits_uops_1_bits_xcpt_pf_if,
                 io_cpu_fetchpacket_bits_uops_1_bits_xcpt_ae_if,
                 io_cpu_fetchpacket_bits_uops_1_bits_bp_debug_if,
                 io_cpu_fetchpacket_bits_uops_1_bits_bp_xcpt_if,
  output [1:0]   io_cpu_fetchpacket_bits_uops_1_bits_debug_fsrc,
  output         io_cpu_fetchpacket_bits_uops_2_valid,
  output [31:0]  io_cpu_fetchpacket_bits_uops_2_bits_inst,
                 io_cpu_fetchpacket_bits_uops_2_bits_debug_inst,
  output         io_cpu_fetchpacket_bits_uops_2_bits_is_rvc,
  output [39:0]  io_cpu_fetchpacket_bits_uops_2_bits_debug_pc,
  output         io_cpu_fetchpacket_bits_uops_2_bits_is_sfb,
  output [5:0]   io_cpu_fetchpacket_bits_uops_2_bits_ftq_idx,
  output         io_cpu_fetchpacket_bits_uops_2_bits_edge_inst,
  output [5:0]   io_cpu_fetchpacket_bits_uops_2_bits_pc_lob,
  output         io_cpu_fetchpacket_bits_uops_2_bits_taken,
                 io_cpu_fetchpacket_bits_uops_2_bits_xcpt_pf_if,
                 io_cpu_fetchpacket_bits_uops_2_bits_xcpt_ae_if,
                 io_cpu_fetchpacket_bits_uops_2_bits_bp_debug_if,
                 io_cpu_fetchpacket_bits_uops_2_bits_bp_xcpt_if,
  output [1:0]   io_cpu_fetchpacket_bits_uops_2_bits_debug_fsrc,
  output         io_cpu_fetchpacket_bits_uops_3_valid,
  output [31:0]  io_cpu_fetchpacket_bits_uops_3_bits_inst,
                 io_cpu_fetchpacket_bits_uops_3_bits_debug_inst,
  output         io_cpu_fetchpacket_bits_uops_3_bits_is_rvc,
  output [39:0]  io_cpu_fetchpacket_bits_uops_3_bits_debug_pc,
  output         io_cpu_fetchpacket_bits_uops_3_bits_is_sfb,
  output [5:0]   io_cpu_fetchpacket_bits_uops_3_bits_ftq_idx,
  output         io_cpu_fetchpacket_bits_uops_3_bits_edge_inst,
  output [5:0]   io_cpu_fetchpacket_bits_uops_3_bits_pc_lob,
  output         io_cpu_fetchpacket_bits_uops_3_bits_taken,
                 io_cpu_fetchpacket_bits_uops_3_bits_xcpt_pf_if,
                 io_cpu_fetchpacket_bits_uops_3_bits_xcpt_ae_if,
                 io_cpu_fetchpacket_bits_uops_3_bits_bp_debug_if,
                 io_cpu_fetchpacket_bits_uops_3_bits_bp_xcpt_if,
  output [1:0]   io_cpu_fetchpacket_bits_uops_3_bits_debug_fsrc,
  input  [5:0]   io_cpu_get_pc_0_ftq_idx,
  output         io_cpu_get_pc_0_entry_cfi_idx_valid,
  output [2:0]   io_cpu_get_pc_0_entry_cfi_idx_bits,
  output [4:0]   io_cpu_get_pc_0_entry_ras_idx,
  output         io_cpu_get_pc_0_entry_start_bank,
  output [39:0]  io_cpu_get_pc_0_pc,
                 io_cpu_get_pc_0_com_pc,
  output         io_cpu_get_pc_0_next_val,
  output [39:0]  io_cpu_get_pc_0_next_pc,
  input  [5:0]   io_cpu_get_pc_1_ftq_idx,
  output [2:0]   io_cpu_get_pc_1_entry_cfi_idx_bits,
  output [7:0]   io_cpu_get_pc_1_entry_br_mask,
  output         io_cpu_get_pc_1_entry_cfi_is_call,
                 io_cpu_get_pc_1_entry_cfi_is_ret,
                 io_cpu_get_pc_1_entry_start_bank,
  output [63:0]  io_cpu_get_pc_1_ghist_old_history,
  output         io_cpu_get_pc_1_ghist_current_saw_branch_not_taken,
                 io_cpu_get_pc_1_ghist_new_saw_branch_not_taken,
                 io_cpu_get_pc_1_ghist_new_saw_branch_taken,
  output [4:0]   io_cpu_get_pc_1_ghist_ras_idx,
  output [39:0]  io_cpu_get_pc_1_pc,
  input          io_cpu_sfence_valid,
                 io_cpu_sfence_bits_rs1,
                 io_cpu_sfence_bits_rs2,
  input  [38:0]  io_cpu_sfence_bits_addr,
  input  [5:0]   io_cpu_brupdate_b2_uop_ftq_idx,
                 io_cpu_brupdate_b2_uop_pc_lob,
  input          io_cpu_brupdate_b2_mispredict,
                 io_cpu_brupdate_b2_taken,
                 io_cpu_redirect_flush,
                 io_cpu_redirect_val,
  input  [39:0]  io_cpu_redirect_pc,
  input  [5:0]   io_cpu_redirect_ftq_idx,
  input  [63:0]  io_cpu_redirect_ghist_old_history,
  input          io_cpu_redirect_ghist_current_saw_branch_not_taken,
                 io_cpu_redirect_ghist_new_saw_branch_not_taken,
                 io_cpu_redirect_ghist_new_saw_branch_taken,
  input  [4:0]   io_cpu_redirect_ghist_ras_idx,
  input          io_cpu_commit_valid,
  input  [39:0]  io_cpu_commit_bits,
  input          io_cpu_flush_icache,
                 io_ptw_req_ready,
  output         io_ptw_req_valid,
  output [26:0]  io_ptw_req_bits_bits_addr,
  output         io_ptw_req_bits_bits_need_gpa,
  input          io_ptw_resp_valid,
                 io_ptw_resp_bits_ae_ptw,
                 io_ptw_resp_bits_ae_final,
                 io_ptw_resp_bits_pf,
                 io_ptw_resp_bits_gf,
                 io_ptw_resp_bits_hr,
                 io_ptw_resp_bits_hw,
                 io_ptw_resp_bits_hx,
  input  [43:0]  io_ptw_resp_bits_pte_ppn,
  input          io_ptw_resp_bits_pte_d,
                 io_ptw_resp_bits_pte_a,
                 io_ptw_resp_bits_pte_g,
                 io_ptw_resp_bits_pte_u,
                 io_ptw_resp_bits_pte_x,
                 io_ptw_resp_bits_pte_w,
                 io_ptw_resp_bits_pte_r,
                 io_ptw_resp_bits_pte_v,
  input  [1:0]   io_ptw_resp_bits_level,
  input          io_ptw_resp_bits_homogeneous,
  input  [3:0]   io_ptw_ptbr_mode,
  input          io_ptw_status_debug,
  input  [1:0]   io_ptw_status_prv,
  input          io_ptw_pmp_0_cfg_l,
  input  [1:0]   io_ptw_pmp_0_cfg_a,
  input          io_ptw_pmp_0_cfg_x,
                 io_ptw_pmp_0_cfg_w,
                 io_ptw_pmp_0_cfg_r,
  input  [30:0]  io_ptw_pmp_0_addr,
  input  [32:0]  io_ptw_pmp_0_mask,
  input          io_ptw_pmp_1_cfg_l,
  input  [1:0]   io_ptw_pmp_1_cfg_a,
  input          io_ptw_pmp_1_cfg_x,
                 io_ptw_pmp_1_cfg_w,
                 io_ptw_pmp_1_cfg_r,
  input  [30:0]  io_ptw_pmp_1_addr,
  input  [32:0]  io_ptw_pmp_1_mask,
  input          io_ptw_pmp_2_cfg_l,
  input  [1:0]   io_ptw_pmp_2_cfg_a,
  input          io_ptw_pmp_2_cfg_x,
                 io_ptw_pmp_2_cfg_w,
                 io_ptw_pmp_2_cfg_r,
  input  [30:0]  io_ptw_pmp_2_addr,
  input  [32:0]  io_ptw_pmp_2_mask,
  input          io_ptw_pmp_3_cfg_l,
  input  [1:0]   io_ptw_pmp_3_cfg_a,
  input          io_ptw_pmp_3_cfg_x,
                 io_ptw_pmp_3_cfg_w,
                 io_ptw_pmp_3_cfg_r,
  input  [30:0]  io_ptw_pmp_3_addr,
  input  [32:0]  io_ptw_pmp_3_mask,
  input          io_ptw_pmp_4_cfg_l,
  input  [1:0]   io_ptw_pmp_4_cfg_a,
  input          io_ptw_pmp_4_cfg_x,
                 io_ptw_pmp_4_cfg_w,
                 io_ptw_pmp_4_cfg_r,
  input  [30:0]  io_ptw_pmp_4_addr,
  input  [32:0]  io_ptw_pmp_4_mask,
  input          io_ptw_pmp_5_cfg_l,
  input  [1:0]   io_ptw_pmp_5_cfg_a,
  input          io_ptw_pmp_5_cfg_x,
                 io_ptw_pmp_5_cfg_w,
                 io_ptw_pmp_5_cfg_r,
  input  [30:0]  io_ptw_pmp_5_addr,
  input  [32:0]  io_ptw_pmp_5_mask,
  input          io_ptw_pmp_6_cfg_l,
  input  [1:0]   io_ptw_pmp_6_cfg_a,
  input          io_ptw_pmp_6_cfg_x,
                 io_ptw_pmp_6_cfg_w,
                 io_ptw_pmp_6_cfg_r,
  input  [30:0]  io_ptw_pmp_6_addr,
  input  [32:0]  io_ptw_pmp_6_mask,
  input          io_ptw_pmp_7_cfg_l,
  input  [1:0]   io_ptw_pmp_7_cfg_a,
  input          io_ptw_pmp_7_cfg_x,
                 io_ptw_pmp_7_cfg_w,
                 io_ptw_pmp_7_cfg_r,
  input  [30:0]  io_ptw_pmp_7_addr,
  input  [32:0]  io_ptw_pmp_7_mask
);

  wire [39:0]  s0_vpc;
  wire         f1_clear;
  wire         f2_clear;
  wire         f4_clear;
  wire         _f4_io_enq_valid_T_1;
  wire [4:0]   _GEN;
  wire [2:0]   f3_fetch_bundle_cfi_idx_bits;
  wire         f3_br_mask_7;
  wire         f3_mask_7;
  wire [31:0]  inst_5;
  wire         f3_br_mask_6;
  wire         f3_mask_6;
  wire [31:0]  inst_4;
  wire         f3_br_mask_5;
  wire         f3_mask_5;
  wire [31:0]  inst_3;
  wire         f3_br_mask_4;
  wire         f3_mask_4;
  wire         f3_br_mask_3;
  wire         f3_mask_3;
  wire [31:0]  inst_2;
  wire         f3_br_mask_2;
  wire         f3_mask_2;
  wire [31:0]  inst_1;
  wire         f3_br_mask_1;
  wire         f3_mask_1;
  wire [31:0]  inst;
  wire         f3_br_mask_0;
  wire         f3_mask_0;
  wire         _bpd_update_arbiter_io_in_1_ready;
  wire         _bpd_update_arbiter_io_out_valid;
  wire         _bpd_update_arbiter_io_out_bits_is_mispredict_update;
  wire         _bpd_update_arbiter_io_out_bits_is_repair_update;
  wire [7:0]   _bpd_update_arbiter_io_out_bits_btb_mispredicts;
  wire [39:0]  _bpd_update_arbiter_io_out_bits_pc;
  wire [7:0]   _bpd_update_arbiter_io_out_bits_br_mask;
  wire         _bpd_update_arbiter_io_out_bits_cfi_idx_valid;
  wire [2:0]   _bpd_update_arbiter_io_out_bits_cfi_idx_bits;
  wire         _bpd_update_arbiter_io_out_bits_cfi_taken;
  wire         _bpd_update_arbiter_io_out_bits_cfi_mispredicted;
  wire         _bpd_update_arbiter_io_out_bits_cfi_is_br;
  wire         _bpd_update_arbiter_io_out_bits_cfi_is_jal;
  wire [63:0]  _bpd_update_arbiter_io_out_bits_ghist_old_history;
  wire         _bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_not_taken;
  wire         _bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_taken;
  wire [39:0]  _bpd_update_arbiter_io_out_bits_target;
  wire [119:0] _bpd_update_arbiter_io_out_bits_meta_0;
  wire [119:0] _bpd_update_arbiter_io_out_bits_meta_1;
  wire         _ftq_io_enq_ready;
  wire [5:0]   _ftq_io_enq_idx;
  wire         _ftq_io_bpdupdate_valid;
  wire         _ftq_io_bpdupdate_bits_is_mispredict_update;
  wire         _ftq_io_bpdupdate_bits_is_repair_update;
  wire [39:0]  _ftq_io_bpdupdate_bits_pc;
  wire [7:0]   _ftq_io_bpdupdate_bits_br_mask;
  wire         _ftq_io_bpdupdate_bits_cfi_idx_valid;
  wire [2:0]   _ftq_io_bpdupdate_bits_cfi_idx_bits;
  wire         _ftq_io_bpdupdate_bits_cfi_taken;
  wire         _ftq_io_bpdupdate_bits_cfi_mispredicted;
  wire         _ftq_io_bpdupdate_bits_cfi_is_br;
  wire         _ftq_io_bpdupdate_bits_cfi_is_jal;
  wire [63:0]  _ftq_io_bpdupdate_bits_ghist_old_history;
  wire         _ftq_io_bpdupdate_bits_ghist_new_saw_branch_not_taken;
  wire         _ftq_io_bpdupdate_bits_ghist_new_saw_branch_taken;
  wire [39:0]  _ftq_io_bpdupdate_bits_target;
  wire [119:0] _ftq_io_bpdupdate_bits_meta_0;
  wire [119:0] _ftq_io_bpdupdate_bits_meta_1;
  wire         _ftq_io_ras_update;
  wire [4:0]   _ftq_io_ras_update_idx;
  wire [39:0]  _ftq_io_ras_update_pc;
  wire         _fb_io_enq_ready;
  wire         _f4_io_enq_ready;
  wire         _f4_io_deq_valid;
  wire [39:0]  _f4_io_deq_bits_pc;
  wire         _f4_io_deq_bits_edge_inst_0;
  wire         _f4_io_deq_bits_edge_inst_1;
  wire [31:0]  _f4_io_deq_bits_insts_0;
  wire [31:0]  _f4_io_deq_bits_insts_1;
  wire [31:0]  _f4_io_deq_bits_insts_2;
  wire [31:0]  _f4_io_deq_bits_insts_3;
  wire [31:0]  _f4_io_deq_bits_insts_4;
  wire [31:0]  _f4_io_deq_bits_insts_5;
  wire [31:0]  _f4_io_deq_bits_insts_6;
  wire [31:0]  _f4_io_deq_bits_insts_7;
  wire [31:0]  _f4_io_deq_bits_exp_insts_0;
  wire [31:0]  _f4_io_deq_bits_exp_insts_1;
  wire [31:0]  _f4_io_deq_bits_exp_insts_2;
  wire [31:0]  _f4_io_deq_bits_exp_insts_3;
  wire [31:0]  _f4_io_deq_bits_exp_insts_4;
  wire [31:0]  _f4_io_deq_bits_exp_insts_5;
  wire [31:0]  _f4_io_deq_bits_exp_insts_6;
  wire [31:0]  _f4_io_deq_bits_exp_insts_7;
  wire         _f4_io_deq_bits_sfbs_0;
  wire         _f4_io_deq_bits_sfbs_1;
  wire         _f4_io_deq_bits_sfbs_2;
  wire         _f4_io_deq_bits_sfbs_3;
  wire         _f4_io_deq_bits_sfbs_4;
  wire         _f4_io_deq_bits_sfbs_5;
  wire         _f4_io_deq_bits_sfbs_6;
  wire         _f4_io_deq_bits_sfbs_7;
  wire         _f4_io_deq_bits_shadowed_mask_0;
  wire         _f4_io_deq_bits_shadowed_mask_1;
  wire         _f4_io_deq_bits_shadowed_mask_2;
  wire         _f4_io_deq_bits_shadowed_mask_3;
  wire         _f4_io_deq_bits_shadowed_mask_4;
  wire         _f4_io_deq_bits_shadowed_mask_5;
  wire         _f4_io_deq_bits_shadowed_mask_6;
  wire         _f4_io_deq_bits_shadowed_mask_7;
  wire         _f4_io_deq_bits_cfi_idx_valid;
  wire [2:0]   _f4_io_deq_bits_cfi_idx_bits;
  wire [2:0]   _f4_io_deq_bits_cfi_type;
  wire         _f4_io_deq_bits_cfi_is_call;
  wire         _f4_io_deq_bits_cfi_is_ret;
  wire [39:0]  _f4_io_deq_bits_ras_top;
  wire [7:0]   _f4_io_deq_bits_mask;
  wire [7:0]   _f4_io_deq_bits_br_mask;
  wire [63:0]  _f4_io_deq_bits_ghist_old_history;
  wire         _f4_io_deq_bits_ghist_current_saw_branch_not_taken;
  wire         _f4_io_deq_bits_ghist_new_saw_branch_not_taken;
  wire         _f4_io_deq_bits_ghist_new_saw_branch_taken;
  wire [4:0]   _f4_io_deq_bits_ghist_ras_idx;
  wire         _f4_io_deq_bits_xcpt_pf_if;
  wire         _f4_io_deq_bits_xcpt_ae_if;
  wire         _f4_io_deq_bits_bp_debug_if_oh_0;
  wire         _f4_io_deq_bits_bp_debug_if_oh_1;
  wire         _f4_io_deq_bits_bp_debug_if_oh_2;
  wire         _f4_io_deq_bits_bp_debug_if_oh_3;
  wire         _f4_io_deq_bits_bp_debug_if_oh_4;
  wire         _f4_io_deq_bits_bp_debug_if_oh_5;
  wire         _f4_io_deq_bits_bp_debug_if_oh_6;
  wire         _f4_io_deq_bits_bp_debug_if_oh_7;
  wire         _f4_io_deq_bits_bp_xcpt_if_oh_0;
  wire         _f4_io_deq_bits_bp_xcpt_if_oh_1;
  wire         _f4_io_deq_bits_bp_xcpt_if_oh_2;
  wire         _f4_io_deq_bits_bp_xcpt_if_oh_3;
  wire         _f4_io_deq_bits_bp_xcpt_if_oh_4;
  wire         _f4_io_deq_bits_bp_xcpt_if_oh_5;
  wire         _f4_io_deq_bits_bp_xcpt_if_oh_6;
  wire         _f4_io_deq_bits_bp_xcpt_if_oh_7;
  wire [119:0] _f4_io_deq_bits_bpd_meta_0;
  wire [119:0] _f4_io_deq_bits_bpd_meta_1;
  wire [1:0]   _f4_io_deq_bits_fsrc;
  wire         _f4_btb_corrections_io_deq_valid;
  wire         _f4_btb_corrections_io_deq_bits_is_mispredict_update;
  wire         _f4_btb_corrections_io_deq_bits_is_repair_update;
  wire [7:0]   _f4_btb_corrections_io_deq_bits_btb_mispredicts;
  wire [39:0]  _f4_btb_corrections_io_deq_bits_pc;
  wire [7:0]   _f4_btb_corrections_io_deq_bits_br_mask;
  wire         _f4_btb_corrections_io_deq_bits_cfi_idx_valid;
  wire [2:0]   _f4_btb_corrections_io_deq_bits_cfi_idx_bits;
  wire         _f4_btb_corrections_io_deq_bits_cfi_taken;
  wire         _f4_btb_corrections_io_deq_bits_cfi_mispredicted;
  wire         _f4_btb_corrections_io_deq_bits_cfi_is_br;
  wire         _f4_btb_corrections_io_deq_bits_cfi_is_jal;
  wire [63:0]  _f4_btb_corrections_io_deq_bits_ghist_old_history;
  wire         _f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_not_taken;
  wire         _f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_taken;
  wire [39:0]  _f4_btb_corrections_io_deq_bits_target;
  wire [119:0] _f4_btb_corrections_io_deq_bits_meta_0;
  wire [119:0] _f4_btb_corrections_io_deq_bits_meta_1;
  wire         _bpd_decoder_5_io_out_is_ret;
  wire         _bpd_decoder_5_io_out_is_call;
  wire [39:0]  _bpd_decoder_5_io_out_target;
  wire [2:0]   _bpd_decoder_5_io_out_cfi_type;
  wire         _bpd_decoder_5_io_out_sfb_offset_valid;
  wire [5:0]   _bpd_decoder_5_io_out_sfb_offset_bits;
  wire         _bpd_decoder_5_io_out_shadowable;
  wire [31:0]  _exp_inst_rvc_exp_5_io_out_bits;
  wire         _exp_inst_rvc_exp_5_io_rvc;
  wire         _bpd_decoder_4_io_out_is_ret;
  wire         _bpd_decoder_4_io_out_is_call;
  wire [39:0]  _bpd_decoder_4_io_out_target;
  wire [2:0]   _bpd_decoder_4_io_out_cfi_type;
  wire         _bpd_decoder_4_io_out_sfb_offset_valid;
  wire [5:0]   _bpd_decoder_4_io_out_sfb_offset_bits;
  wire         _bpd_decoder_4_io_out_shadowable;
  wire [31:0]  _exp_inst_rvc_exp_4_io_out_bits;
  wire         _exp_inst_rvc_exp_4_io_rvc;
  wire         _bpd_decoder_3_io_out_is_ret;
  wire         _bpd_decoder_3_io_out_is_call;
  wire [39:0]  _bpd_decoder_3_io_out_target;
  wire [2:0]   _bpd_decoder_3_io_out_cfi_type;
  wire         _bpd_decoder_3_io_out_sfb_offset_valid;
  wire [5:0]   _bpd_decoder_3_io_out_sfb_offset_bits;
  wire         _bpd_decoder_3_io_out_shadowable;
  wire [31:0]  _exp_inst_rvc_exp_3_io_out_bits;
  wire         _exp_inst_rvc_exp_3_io_rvc;
  wire         _bpd_decoder0b_io_out_is_ret;
  wire         _bpd_decoder0b_io_out_is_call;
  wire [39:0]  _bpd_decoder0b_io_out_target;
  wire [2:0]   _bpd_decoder0b_io_out_cfi_type;
  wire         _bpd_decoder0b_io_out_sfb_offset_valid;
  wire [5:0]   _bpd_decoder0b_io_out_sfb_offset_bits;
  wire         _bpd_decoder0b_io_out_shadowable;
  wire [31:0]  _exp_inst0b_rvc_exp_io_out_bits;
  wire         _exp_inst0b_rvc_exp_io_rvc;
  wire         _bpd_decoder1_1_io_out_is_ret;
  wire         _bpd_decoder1_1_io_out_is_call;
  wire [39:0]  _bpd_decoder1_1_io_out_target;
  wire [2:0]   _bpd_decoder1_1_io_out_cfi_type;
  wire         _bpd_decoder1_1_io_out_sfb_offset_valid;
  wire [5:0]   _bpd_decoder1_1_io_out_sfb_offset_bits;
  wire         _bpd_decoder1_1_io_out_shadowable;
  wire [31:0]  _exp_inst1_rvc_exp_1_io_out_bits;
  wire         _exp_inst1_rvc_exp_1_io_rvc;
  wire         _bpd_decoder_2_io_out_is_ret;
  wire         _bpd_decoder_2_io_out_is_call;
  wire [39:0]  _bpd_decoder_2_io_out_target;
  wire [2:0]   _bpd_decoder_2_io_out_cfi_type;
  wire         _bpd_decoder_2_io_out_sfb_offset_valid;
  wire [5:0]   _bpd_decoder_2_io_out_sfb_offset_bits;
  wire         _bpd_decoder_2_io_out_shadowable;
  wire [31:0]  _exp_inst_rvc_exp_2_io_out_bits;
  wire         _exp_inst_rvc_exp_2_io_rvc;
  wire         _bpd_decoder_1_io_out_is_ret;
  wire         _bpd_decoder_1_io_out_is_call;
  wire [39:0]  _bpd_decoder_1_io_out_target;
  wire [2:0]   _bpd_decoder_1_io_out_cfi_type;
  wire         _bpd_decoder_1_io_out_sfb_offset_valid;
  wire [5:0]   _bpd_decoder_1_io_out_sfb_offset_bits;
  wire         _bpd_decoder_1_io_out_shadowable;
  wire [31:0]  _exp_inst_rvc_exp_1_io_out_bits;
  wire         _exp_inst_rvc_exp_1_io_rvc;
  wire         _bpd_decoder_io_out_is_ret;
  wire         _bpd_decoder_io_out_is_call;
  wire [39:0]  _bpd_decoder_io_out_target;
  wire [2:0]   _bpd_decoder_io_out_cfi_type;
  wire         _bpd_decoder_io_out_sfb_offset_valid;
  wire [5:0]   _bpd_decoder_io_out_sfb_offset_bits;
  wire         _bpd_decoder_io_out_shadowable;
  wire [31:0]  _exp_inst_rvc_exp_io_out_bits;
  wire         _exp_inst_rvc_exp_io_rvc;
  wire         _bpd_decoder1_io_out_is_ret;
  wire         _bpd_decoder1_io_out_is_call;
  wire [39:0]  _bpd_decoder1_io_out_target;
  wire [2:0]   _bpd_decoder1_io_out_cfi_type;
  wire         _bpd_decoder1_io_out_sfb_offset_valid;
  wire [5:0]   _bpd_decoder1_io_out_sfb_offset_bits;
  wire         _bpd_decoder1_io_out_shadowable;
  wire         _bpd_decoder0_io_out_is_ret;
  wire         _bpd_decoder0_io_out_is_call;
  wire [39:0]  _bpd_decoder0_io_out_target;
  wire [2:0]   _bpd_decoder0_io_out_cfi_type;
  wire         _bpd_decoder0_io_out_sfb_offset_valid;
  wire [5:0]   _bpd_decoder0_io_out_sfb_offset_bits;
  wire         _bpd_decoder0_io_out_shadowable;
  wire [31:0]  _exp_inst1_rvc_exp_io_out_bits;
  wire         _exp_inst1_rvc_exp_io_rvc;
  wire [31:0]  _exp_inst0_rvc_exp_io_out_bits;
  wire         _exp_inst0_rvc_exp_io_rvc;
  wire         _f3_bpd_resp_io_enq_ready;
  wire [39:0]  _f3_bpd_resp_io_deq_bits_pc;
  wire         _f3_bpd_resp_io_deq_bits_preds_0_taken;
  wire         _f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_valid;
  wire [39:0]  _f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_bits;
  wire         _f3_bpd_resp_io_deq_bits_preds_1_taken;
  wire         _f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_valid;
  wire [39:0]  _f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_bits;
  wire         _f3_bpd_resp_io_deq_bits_preds_2_taken;
  wire         _f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_valid;
  wire [39:0]  _f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_bits;
  wire         _f3_bpd_resp_io_deq_bits_preds_3_taken;
  wire         _f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_valid;
  wire [39:0]  _f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_bits;
  wire         _f3_bpd_resp_io_deq_bits_preds_4_taken;
  wire         _f3_bpd_resp_io_deq_bits_preds_4_predicted_pc_valid;
  wire [39:0]  _f3_bpd_resp_io_deq_bits_preds_4_predicted_pc_bits;
  wire         _f3_bpd_resp_io_deq_bits_preds_5_taken;
  wire         _f3_bpd_resp_io_deq_bits_preds_5_predicted_pc_valid;
  wire [39:0]  _f3_bpd_resp_io_deq_bits_preds_5_predicted_pc_bits;
  wire         _f3_bpd_resp_io_deq_bits_preds_6_taken;
  wire         _f3_bpd_resp_io_deq_bits_preds_6_predicted_pc_valid;
  wire [39:0]  _f3_bpd_resp_io_deq_bits_preds_6_predicted_pc_bits;
  wire         _f3_bpd_resp_io_deq_bits_preds_7_taken;
  wire         _f3_bpd_resp_io_deq_bits_preds_7_predicted_pc_valid;
  wire [39:0]  _f3_bpd_resp_io_deq_bits_preds_7_predicted_pc_bits;
  wire [119:0] _f3_bpd_resp_io_deq_bits_meta_0;
  wire [119:0] _f3_bpd_resp_io_deq_bits_meta_1;
  wire         _f3_bpd_resp_io_deq_bits_lhist_0;
  wire         _f3_bpd_resp_io_deq_bits_lhist_1;
  wire         _f3_io_enq_ready;
  wire         _f3_io_deq_valid;
  wire [39:0]  _f3_io_deq_bits_pc;
  wire [127:0] _f3_io_deq_bits_data;
  wire [7:0]   _f3_io_deq_bits_mask;
  wire         _f3_io_deq_bits_xcpt_pf_inst;
  wire         _f3_io_deq_bits_xcpt_ae_inst;
  wire [63:0]  _f3_io_deq_bits_ghist_old_history;
  wire         _f3_io_deq_bits_ghist_current_saw_branch_not_taken;
  wire         _f3_io_deq_bits_ghist_new_saw_branch_not_taken;
  wire         _f3_io_deq_bits_ghist_new_saw_branch_taken;
  wire [4:0]   _f3_io_deq_bits_ghist_ras_idx;
  wire [1:0]   _f3_io_deq_bits_fsrc;
  wire [1:0]   _f3_io_deq_bits_tsrc;
  wire         _tlb_io_resp_miss;
  wire [32:0]  _tlb_io_resp_paddr;
  wire         _tlb_io_resp_pf_inst;
  wire         _tlb_io_resp_ae_inst;
  wire [39:0]  _ras_io_read_addr;
  wire         _bpd_io_resp_f1_preds_0_taken;
  wire         _bpd_io_resp_f1_preds_0_is_br;
  wire         _bpd_io_resp_f1_preds_0_is_jal;
  wire         _bpd_io_resp_f1_preds_0_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f1_preds_0_predicted_pc_bits;
  wire         _bpd_io_resp_f1_preds_1_taken;
  wire         _bpd_io_resp_f1_preds_1_is_br;
  wire         _bpd_io_resp_f1_preds_1_is_jal;
  wire         _bpd_io_resp_f1_preds_1_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f1_preds_1_predicted_pc_bits;
  wire         _bpd_io_resp_f1_preds_2_taken;
  wire         _bpd_io_resp_f1_preds_2_is_br;
  wire         _bpd_io_resp_f1_preds_2_is_jal;
  wire         _bpd_io_resp_f1_preds_2_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f1_preds_2_predicted_pc_bits;
  wire         _bpd_io_resp_f1_preds_3_taken;
  wire         _bpd_io_resp_f1_preds_3_is_br;
  wire         _bpd_io_resp_f1_preds_3_is_jal;
  wire         _bpd_io_resp_f1_preds_3_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f1_preds_3_predicted_pc_bits;
  wire         _bpd_io_resp_f1_preds_4_taken;
  wire         _bpd_io_resp_f1_preds_4_is_br;
  wire         _bpd_io_resp_f1_preds_4_is_jal;
  wire         _bpd_io_resp_f1_preds_4_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f1_preds_4_predicted_pc_bits;
  wire         _bpd_io_resp_f1_preds_5_taken;
  wire         _bpd_io_resp_f1_preds_5_is_br;
  wire         _bpd_io_resp_f1_preds_5_is_jal;
  wire         _bpd_io_resp_f1_preds_5_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f1_preds_5_predicted_pc_bits;
  wire         _bpd_io_resp_f1_preds_6_taken;
  wire         _bpd_io_resp_f1_preds_6_is_br;
  wire         _bpd_io_resp_f1_preds_6_is_jal;
  wire         _bpd_io_resp_f1_preds_6_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f1_preds_6_predicted_pc_bits;
  wire         _bpd_io_resp_f1_preds_7_taken;
  wire         _bpd_io_resp_f1_preds_7_is_br;
  wire         _bpd_io_resp_f1_preds_7_is_jal;
  wire         _bpd_io_resp_f1_preds_7_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f1_preds_7_predicted_pc_bits;
  wire         _bpd_io_resp_f2_preds_0_taken;
  wire         _bpd_io_resp_f2_preds_0_is_br;
  wire         _bpd_io_resp_f2_preds_0_is_jal;
  wire         _bpd_io_resp_f2_preds_0_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f2_preds_0_predicted_pc_bits;
  wire         _bpd_io_resp_f2_preds_1_taken;
  wire         _bpd_io_resp_f2_preds_1_is_br;
  wire         _bpd_io_resp_f2_preds_1_is_jal;
  wire         _bpd_io_resp_f2_preds_1_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f2_preds_1_predicted_pc_bits;
  wire         _bpd_io_resp_f2_preds_2_taken;
  wire         _bpd_io_resp_f2_preds_2_is_br;
  wire         _bpd_io_resp_f2_preds_2_is_jal;
  wire         _bpd_io_resp_f2_preds_2_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f2_preds_2_predicted_pc_bits;
  wire         _bpd_io_resp_f2_preds_3_taken;
  wire         _bpd_io_resp_f2_preds_3_is_br;
  wire         _bpd_io_resp_f2_preds_3_is_jal;
  wire         _bpd_io_resp_f2_preds_3_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f2_preds_3_predicted_pc_bits;
  wire         _bpd_io_resp_f2_preds_4_taken;
  wire         _bpd_io_resp_f2_preds_4_is_br;
  wire         _bpd_io_resp_f2_preds_4_is_jal;
  wire         _bpd_io_resp_f2_preds_4_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f2_preds_4_predicted_pc_bits;
  wire         _bpd_io_resp_f2_preds_5_taken;
  wire         _bpd_io_resp_f2_preds_5_is_br;
  wire         _bpd_io_resp_f2_preds_5_is_jal;
  wire         _bpd_io_resp_f2_preds_5_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f2_preds_5_predicted_pc_bits;
  wire         _bpd_io_resp_f2_preds_6_taken;
  wire         _bpd_io_resp_f2_preds_6_is_br;
  wire         _bpd_io_resp_f2_preds_6_is_jal;
  wire         _bpd_io_resp_f2_preds_6_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f2_preds_6_predicted_pc_bits;
  wire         _bpd_io_resp_f2_preds_7_taken;
  wire         _bpd_io_resp_f2_preds_7_is_br;
  wire         _bpd_io_resp_f2_preds_7_is_jal;
  wire         _bpd_io_resp_f2_preds_7_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f2_preds_7_predicted_pc_bits;
  wire [39:0]  _bpd_io_resp_f3_pc;
  wire         _bpd_io_resp_f3_preds_0_taken;
  wire         _bpd_io_resp_f3_preds_0_is_br;
  wire         _bpd_io_resp_f3_preds_0_is_jal;
  wire         _bpd_io_resp_f3_preds_0_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f3_preds_0_predicted_pc_bits;
  wire         _bpd_io_resp_f3_preds_1_taken;
  wire         _bpd_io_resp_f3_preds_1_is_br;
  wire         _bpd_io_resp_f3_preds_1_is_jal;
  wire         _bpd_io_resp_f3_preds_1_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f3_preds_1_predicted_pc_bits;
  wire         _bpd_io_resp_f3_preds_2_taken;
  wire         _bpd_io_resp_f3_preds_2_is_br;
  wire         _bpd_io_resp_f3_preds_2_is_jal;
  wire         _bpd_io_resp_f3_preds_2_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f3_preds_2_predicted_pc_bits;
  wire         _bpd_io_resp_f3_preds_3_taken;
  wire         _bpd_io_resp_f3_preds_3_is_br;
  wire         _bpd_io_resp_f3_preds_3_is_jal;
  wire         _bpd_io_resp_f3_preds_3_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f3_preds_3_predicted_pc_bits;
  wire         _bpd_io_resp_f3_preds_4_taken;
  wire         _bpd_io_resp_f3_preds_4_is_br;
  wire         _bpd_io_resp_f3_preds_4_is_jal;
  wire         _bpd_io_resp_f3_preds_4_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f3_preds_4_predicted_pc_bits;
  wire         _bpd_io_resp_f3_preds_5_taken;
  wire         _bpd_io_resp_f3_preds_5_is_br;
  wire         _bpd_io_resp_f3_preds_5_is_jal;
  wire         _bpd_io_resp_f3_preds_5_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f3_preds_5_predicted_pc_bits;
  wire         _bpd_io_resp_f3_preds_6_taken;
  wire         _bpd_io_resp_f3_preds_6_is_br;
  wire         _bpd_io_resp_f3_preds_6_is_jal;
  wire         _bpd_io_resp_f3_preds_6_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f3_preds_6_predicted_pc_bits;
  wire         _bpd_io_resp_f3_preds_7_taken;
  wire         _bpd_io_resp_f3_preds_7_is_br;
  wire         _bpd_io_resp_f3_preds_7_is_jal;
  wire         _bpd_io_resp_f3_preds_7_predicted_pc_valid;
  wire [39:0]  _bpd_io_resp_f3_preds_7_predicted_pc_bits;
  wire [119:0] _bpd_io_resp_f3_meta_0;
  wire [119:0] _bpd_io_resp_f3_meta_1;
  wire         _icache_io_resp_valid;
  wire [127:0] _icache_io_resp_bits_data;
  reg          REG;
  wire         _GEN_0 = REG & ~reset;
  wire [39:0]  _GEN_1 = {23'h0, _GEN_0, 16'h0};
  reg  [39:0]  s1_vpc;
  reg          s1_valid;
  reg  [63:0]  s1_ghist_old_history;
  reg          s1_ghist_current_saw_branch_not_taken;
  reg          s1_ghist_new_saw_branch_not_taken;
  reg          s1_ghist_new_saw_branch_taken;
  reg  [4:0]   s1_ghist_ras_idx;
  reg          s1_is_replay;
  reg          s1_is_sfence;
  reg  [1:0]   s1_tsrc;
  reg          tlb_io_sfence_REG_valid;
  reg          tlb_io_sfence_REG_bits_rs1;
  reg          tlb_io_sfence_REG_bits_rs2;
  reg  [38:0]  tlb_io_sfence_REG_bits_addr;
  wire         s1_tlb_miss = ~s1_is_replay & _tlb_io_resp_miss;
  reg          s1_tlb_resp_REG_pf_inst;
  reg          s1_tlb_resp_REG_gf_inst;
  reg          s1_tlb_resp_REG_ae_inst;
  wire         s1_tlb_resp_pf_inst = s1_is_replay ? s1_tlb_resp_REG_pf_inst : _tlb_io_resp_pf_inst;
  wire         s1_tlb_resp_ae_inst = s1_is_replay ? s1_tlb_resp_REG_ae_inst : _tlb_io_resp_ae_inst;
  reg  [32:0]  s1_ppc_REG;
  wire [32:0]  s1_ppc = s1_is_replay ? s1_ppc_REG : _tlb_io_resp_paddr;
  wire [10:0]  _f1_mask_T = 11'hFF << s1_vpc[2:1];
  wire [7:0]   _GEN_2 = _f1_mask_T[7:0] & ((&(s1_vpc[5:3])) ? 8'hF : 8'hFF);
  wire         f1_redirects_0 = s1_valid & _GEN_2[0] & _bpd_io_resp_f1_preds_0_predicted_pc_valid & (_bpd_io_resp_f1_preds_0_is_jal | _bpd_io_resp_f1_preds_0_is_br & _bpd_io_resp_f1_preds_0_taken);
  wire         f1_redirects_1 = s1_valid & _GEN_2[1] & _bpd_io_resp_f1_preds_1_predicted_pc_valid & (_bpd_io_resp_f1_preds_1_is_jal | _bpd_io_resp_f1_preds_1_is_br & _bpd_io_resp_f1_preds_1_taken);
  wire         f1_redirects_2 = s1_valid & _GEN_2[2] & _bpd_io_resp_f1_preds_2_predicted_pc_valid & (_bpd_io_resp_f1_preds_2_is_jal | _bpd_io_resp_f1_preds_2_is_br & _bpd_io_resp_f1_preds_2_taken);
  wire         f1_redirects_3 = s1_valid & _GEN_2[3] & _bpd_io_resp_f1_preds_3_predicted_pc_valid & (_bpd_io_resp_f1_preds_3_is_jal | _bpd_io_resp_f1_preds_3_is_br & _bpd_io_resp_f1_preds_3_taken);
  wire         f1_redirects_4 = s1_valid & _GEN_2[4] & _bpd_io_resp_f1_preds_4_predicted_pc_valid & (_bpd_io_resp_f1_preds_4_is_jal | _bpd_io_resp_f1_preds_4_is_br & _bpd_io_resp_f1_preds_4_taken);
  wire         f1_redirects_5 = s1_valid & _GEN_2[5] & _bpd_io_resp_f1_preds_5_predicted_pc_valid & (_bpd_io_resp_f1_preds_5_is_jal | _bpd_io_resp_f1_preds_5_is_br & _bpd_io_resp_f1_preds_5_taken);
  wire         f1_redirects_6 = s1_valid & _GEN_2[6] & _bpd_io_resp_f1_preds_6_predicted_pc_valid & (_bpd_io_resp_f1_preds_6_is_jal | _bpd_io_resp_f1_preds_6_is_br & _bpd_io_resp_f1_preds_6_taken);
  wire [2:0]   f1_redirect_idx = f1_redirects_0 ? 3'h0 : f1_redirects_1 ? 3'h1 : f1_redirects_2 ? 3'h2 : f1_redirects_3 ? 3'h3 : f1_redirects_4 ? 3'h4 : f1_redirects_5 ? 3'h5 : {2'h3, ~f1_redirects_6};
  wire         f1_do_redirect = f1_redirects_0 | f1_redirects_1 | f1_redirects_2 | f1_redirects_3 | f1_redirects_4 | f1_redirects_5 | f1_redirects_6 | s1_valid & _GEN_2[7] & _bpd_io_resp_f1_preds_7_predicted_pc_valid & (_bpd_io_resp_f1_preds_7_is_jal | _bpd_io_resp_f1_preds_7_is_br & _bpd_io_resp_f1_preds_7_taken);
  reg  [39:0]  casez_tmp;
  always @(*) begin
    casez (f1_redirect_idx)
      3'b000:
        casez_tmp = _bpd_io_resp_f1_preds_0_predicted_pc_bits;
      3'b001:
        casez_tmp = _bpd_io_resp_f1_preds_1_predicted_pc_bits;
      3'b010:
        casez_tmp = _bpd_io_resp_f1_preds_2_predicted_pc_bits;
      3'b011:
        casez_tmp = _bpd_io_resp_f1_preds_3_predicted_pc_bits;
      3'b100:
        casez_tmp = _bpd_io_resp_f1_preds_4_predicted_pc_bits;
      3'b101:
        casez_tmp = _bpd_io_resp_f1_preds_5_predicted_pc_bits;
      3'b110:
        casez_tmp = _bpd_io_resp_f1_preds_6_predicted_pc_bits;
      default:
        casez_tmp = _bpd_io_resp_f1_preds_7_predicted_pc_bits;
    endcase
  end // always @(*)
  wire [39:0]  _f1_predicted_target_T_21 = {s1_vpc[39:3], 3'h0} + {35'h0, (&(s1_vpc[5:3])) ? 5'h8 : 5'h10};
  reg          casez_tmp_0;
  always @(*) begin
    casez (f1_redirect_idx)
      3'b000:
        casez_tmp_0 = _bpd_io_resp_f1_preds_0_taken;
      3'b001:
        casez_tmp_0 = _bpd_io_resp_f1_preds_1_taken;
      3'b010:
        casez_tmp_0 = _bpd_io_resp_f1_preds_2_taken;
      3'b011:
        casez_tmp_0 = _bpd_io_resp_f1_preds_3_taken;
      3'b100:
        casez_tmp_0 = _bpd_io_resp_f1_preds_4_taken;
      3'b101:
        casez_tmp_0 = _bpd_io_resp_f1_preds_5_taken;
      3'b110:
        casez_tmp_0 = _bpd_io_resp_f1_preds_6_taken;
      default:
        casez_tmp_0 = _bpd_io_resp_f1_preds_7_taken;
    endcase
  end // always @(*)
  reg          casez_tmp_1;
  always @(*) begin
    casez (f1_redirect_idx)
      3'b000:
        casez_tmp_1 = _bpd_io_resp_f1_preds_0_is_br;
      3'b001:
        casez_tmp_1 = _bpd_io_resp_f1_preds_1_is_br;
      3'b010:
        casez_tmp_1 = _bpd_io_resp_f1_preds_2_is_br;
      3'b011:
        casez_tmp_1 = _bpd_io_resp_f1_preds_3_is_br;
      3'b100:
        casez_tmp_1 = _bpd_io_resp_f1_preds_4_is_br;
      3'b101:
        casez_tmp_1 = _bpd_io_resp_f1_preds_5_is_br;
      3'b110:
        casez_tmp_1 = _bpd_io_resp_f1_preds_6_is_br;
      default:
        casez_tmp_1 = _bpd_io_resp_f1_preds_7_is_br;
    endcase
  end // always @(*)
  wire         _f1_predicted_ghist_T_10 = casez_tmp_0 & f1_do_redirect;
  wire [7:0]   f1_predicted_ghist_cfi_idx_oh = 8'h1 << f1_redirect_idx;
  wire [6:0]   _GEN_3 = f1_predicted_ghist_cfi_idx_oh[6:0] | f1_predicted_ghist_cfi_idx_oh[7:1];
  wire [5:0]   _GEN_4 = _GEN_3[5:0] | f1_predicted_ghist_cfi_idx_oh[7:2];
  wire [4:0]   _GEN_5 = _GEN_4[4:0] | f1_predicted_ghist_cfi_idx_oh[7:3];
  wire [3:0]   _GEN_6 = _GEN_5[3:0] | f1_predicted_ghist_cfi_idx_oh[7:4];
  wire [2:0]   _GEN_7 = _GEN_6[2:0] | f1_predicted_ghist_cfi_idx_oh[7:5];
  wire [1:0]   _GEN_8 = _GEN_7[1:0] | f1_predicted_ghist_cfi_idx_oh[7:6];
  wire [7:0]   _GEN_9 = {_bpd_io_resp_f1_preds_7_is_br & _bpd_io_resp_f1_preds_7_predicted_pc_valid, _bpd_io_resp_f1_preds_6_is_br & _bpd_io_resp_f1_preds_6_predicted_pc_valid, _bpd_io_resp_f1_preds_5_is_br & _bpd_io_resp_f1_preds_5_predicted_pc_valid, _bpd_io_resp_f1_preds_4_is_br & _bpd_io_resp_f1_preds_4_predicted_pc_valid, _bpd_io_resp_f1_preds_3_is_br & _bpd_io_resp_f1_preds_3_predicted_pc_valid, _bpd_io_resp_f1_preds_2_is_br & _bpd_io_resp_f1_preds_2_predicted_pc_valid, _bpd_io_resp_f1_preds_1_is_br & _bpd_io_resp_f1_preds_1_predicted_pc_valid, _bpd_io_resp_f1_preds_0_is_br & _bpd_io_resp_f1_preds_0_predicted_pc_valid} & _GEN_2 & (f1_do_redirect ? {&f1_redirect_idx, _GEN_3[6], _GEN_4[5], _GEN_5[4], _GEN_6[3], _GEN_7[2], _GEN_8[1], _GEN_8[0] | (&f1_redirect_idx)} & ~(casez_tmp_1 & _f1_predicted_ghist_T_10 ? f1_predicted_ghist_cfi_idx_oh : 8'h0) : 8'hFF);
  wire         _f1_predicted_ghist_new_history_new_saw_branch_taken_T_1 = f1_do_redirect & _f1_predicted_ghist_T_10;
  wire         f1_predicted_ghist_cfi_in_bank_0 = _f1_predicted_ghist_new_history_new_saw_branch_taken_T_1 & ~(f1_redirect_idx[2]);
  wire         f1_predicted_ghist_ignore_second_bank = f1_predicted_ghist_cfi_in_bank_0 | (&(s1_vpc[5:3]));
  wire         f1_predicted_ghist_first_bank_saw_not_taken = (|(_GEN_9[3:0])) | s1_ghist_current_saw_branch_not_taken;
  wire [63:0]  _GEN_10 = {s1_ghist_old_history[62:0], 1'h0};
  wire [63:0]  _GEN_11 = {s1_ghist_old_history[62:0], 1'h1};
  wire [63:0]  _f1_predicted_ghist_new_history_old_history_T_4 = s1_ghist_new_saw_branch_taken ? _GEN_11 : s1_ghist_new_saw_branch_not_taken ? _GEN_10 : s1_ghist_old_history;
  wire [62:0]  _GEN_12 = {s1_ghist_old_history[61:0], 1'h0};
  wire [62:0]  _GEN_13 = {s1_ghist_old_history[61:0], 1'h1};
  wire [63:0]  _f1_predicted_ghist_new_history_old_history_T_25 = casez_tmp_1 & f1_predicted_ghist_cfi_in_bank_0 ? {s1_ghist_new_saw_branch_taken ? _GEN_13 : s1_ghist_new_saw_branch_not_taken ? _GEN_12 : s1_ghist_old_history[62:0], 1'h1} : f1_predicted_ghist_first_bank_saw_not_taken ? {s1_ghist_new_saw_branch_taken ? _GEN_13 : s1_ghist_new_saw_branch_not_taken ? _GEN_12 : s1_ghist_old_history[62:0], 1'h0} : s1_ghist_new_saw_branch_taken ? _GEN_11 : s1_ghist_new_saw_branch_not_taken ? _GEN_10 : s1_ghist_old_history;
  wire         _GEN_14 = s1_valid & ~s1_tlb_miss;
  wire         _GEN_15 = _GEN_14 & (f1_predicted_ghist_ignore_second_bank ? f1_predicted_ghist_first_bank_saw_not_taken : (|(_GEN_9[7:4])));
  wire         _GEN_16 = _GEN_14 & (f1_predicted_ghist_ignore_second_bank ? casez_tmp_1 & f1_predicted_ghist_cfi_in_bank_0 : _f1_predicted_ghist_new_history_new_saw_branch_taken_T_1 & casez_tmp_1 & ~f1_predicted_ghist_cfi_in_bank_0);
  reg          s2_valid;
  reg  [39:0]  s2_vpc;
  reg  [63:0]  s2_ghist_old_history;
  reg          s2_ghist_current_saw_branch_not_taken;
  reg          s2_ghist_new_saw_branch_not_taken;
  reg          s2_ghist_new_saw_branch_taken;
  reg  [4:0]   s2_ghist_ras_idx;
  reg  [32:0]  s2_ppc;
  reg  [1:0]   s2_tsrc;
  reg          s2_tlb_resp_pf_inst;
  reg          s2_tlb_resp_gf_inst;
  reg          s2_tlb_resp_ae_inst;
  reg          s2_tlb_miss;
  reg          s2_is_replay_REG;
  wire         s2_is_replay = s2_is_replay_REG & s2_valid;
  wire         _f3_io_enq_valid_T_2 = s2_tlb_resp_ae_inst | s2_tlb_resp_pf_inst;
  wire         s2_xcpt = s2_valid & _f3_io_enq_valid_T_2 & ~s2_is_replay;
  wire [10:0]  _f2_mask_T = 11'hFF << s2_vpc[2:1];
  wire [7:0]   _GEN_17 = _f2_mask_T[7:0] & ((&(s2_vpc[5:3])) ? 8'hF : 8'hFF);
  wire         f2_redirects_0 = s2_valid & _GEN_17[0] & _bpd_io_resp_f2_preds_0_predicted_pc_valid & (_bpd_io_resp_f2_preds_0_is_jal | _bpd_io_resp_f2_preds_0_is_br & _bpd_io_resp_f2_preds_0_taken);
  wire         f2_redirects_1 = s2_valid & _GEN_17[1] & _bpd_io_resp_f2_preds_1_predicted_pc_valid & (_bpd_io_resp_f2_preds_1_is_jal | _bpd_io_resp_f2_preds_1_is_br & _bpd_io_resp_f2_preds_1_taken);
  wire         f2_redirects_2 = s2_valid & _GEN_17[2] & _bpd_io_resp_f2_preds_2_predicted_pc_valid & (_bpd_io_resp_f2_preds_2_is_jal | _bpd_io_resp_f2_preds_2_is_br & _bpd_io_resp_f2_preds_2_taken);
  wire         f2_redirects_3 = s2_valid & _GEN_17[3] & _bpd_io_resp_f2_preds_3_predicted_pc_valid & (_bpd_io_resp_f2_preds_3_is_jal | _bpd_io_resp_f2_preds_3_is_br & _bpd_io_resp_f2_preds_3_taken);
  wire         f2_redirects_4 = s2_valid & _GEN_17[4] & _bpd_io_resp_f2_preds_4_predicted_pc_valid & (_bpd_io_resp_f2_preds_4_is_jal | _bpd_io_resp_f2_preds_4_is_br & _bpd_io_resp_f2_preds_4_taken);
  wire         f2_redirects_5 = s2_valid & _GEN_17[5] & _bpd_io_resp_f2_preds_5_predicted_pc_valid & (_bpd_io_resp_f2_preds_5_is_jal | _bpd_io_resp_f2_preds_5_is_br & _bpd_io_resp_f2_preds_5_taken);
  wire         f2_redirects_6 = s2_valid & _GEN_17[6] & _bpd_io_resp_f2_preds_6_predicted_pc_valid & (_bpd_io_resp_f2_preds_6_is_jal | _bpd_io_resp_f2_preds_6_is_br & _bpd_io_resp_f2_preds_6_taken);
  wire [2:0]   f2_redirect_idx = f2_redirects_0 ? 3'h0 : f2_redirects_1 ? 3'h1 : f2_redirects_2 ? 3'h2 : f2_redirects_3 ? 3'h3 : f2_redirects_4 ? 3'h4 : f2_redirects_5 ? 3'h5 : {2'h3, ~f2_redirects_6};
  wire         f2_do_redirect = f2_redirects_0 | f2_redirects_1 | f2_redirects_2 | f2_redirects_3 | f2_redirects_4 | f2_redirects_5 | f2_redirects_6 | s2_valid & _GEN_17[7] & _bpd_io_resp_f2_preds_7_predicted_pc_valid & (_bpd_io_resp_f2_preds_7_is_jal | _bpd_io_resp_f2_preds_7_is_br & _bpd_io_resp_f2_preds_7_taken);
  reg  [39:0]  casez_tmp_2;
  always @(*) begin
    casez (f2_redirect_idx)
      3'b000:
        casez_tmp_2 = _bpd_io_resp_f2_preds_0_predicted_pc_bits;
      3'b001:
        casez_tmp_2 = _bpd_io_resp_f2_preds_1_predicted_pc_bits;
      3'b010:
        casez_tmp_2 = _bpd_io_resp_f2_preds_2_predicted_pc_bits;
      3'b011:
        casez_tmp_2 = _bpd_io_resp_f2_preds_3_predicted_pc_bits;
      3'b100:
        casez_tmp_2 = _bpd_io_resp_f2_preds_4_predicted_pc_bits;
      3'b101:
        casez_tmp_2 = _bpd_io_resp_f2_preds_5_predicted_pc_bits;
      3'b110:
        casez_tmp_2 = _bpd_io_resp_f2_preds_6_predicted_pc_bits;
      default:
        casez_tmp_2 = _bpd_io_resp_f2_preds_7_predicted_pc_bits;
    endcase
  end // always @(*)
  wire [39:0]  f2_predicted_target = f2_do_redirect ? casez_tmp_2 : {s2_vpc[39:3], 3'h0} + {35'h0, (&(s2_vpc[5:3])) ? 5'h8 : 5'h10};
  reg          casez_tmp_3;
  always @(*) begin
    casez (f2_redirect_idx)
      3'b000:
        casez_tmp_3 = _bpd_io_resp_f2_preds_0_taken;
      3'b001:
        casez_tmp_3 = _bpd_io_resp_f2_preds_1_taken;
      3'b010:
        casez_tmp_3 = _bpd_io_resp_f2_preds_2_taken;
      3'b011:
        casez_tmp_3 = _bpd_io_resp_f2_preds_3_taken;
      3'b100:
        casez_tmp_3 = _bpd_io_resp_f2_preds_4_taken;
      3'b101:
        casez_tmp_3 = _bpd_io_resp_f2_preds_5_taken;
      3'b110:
        casez_tmp_3 = _bpd_io_resp_f2_preds_6_taken;
      default:
        casez_tmp_3 = _bpd_io_resp_f2_preds_7_taken;
    endcase
  end // always @(*)
  reg          casez_tmp_4;
  always @(*) begin
    casez (f2_redirect_idx)
      3'b000:
        casez_tmp_4 = _bpd_io_resp_f2_preds_0_is_br;
      3'b001:
        casez_tmp_4 = _bpd_io_resp_f2_preds_1_is_br;
      3'b010:
        casez_tmp_4 = _bpd_io_resp_f2_preds_2_is_br;
      3'b011:
        casez_tmp_4 = _bpd_io_resp_f2_preds_3_is_br;
      3'b100:
        casez_tmp_4 = _bpd_io_resp_f2_preds_4_is_br;
      3'b101:
        casez_tmp_4 = _bpd_io_resp_f2_preds_5_is_br;
      3'b110:
        casez_tmp_4 = _bpd_io_resp_f2_preds_6_is_br;
      default:
        casez_tmp_4 = _bpd_io_resp_f2_preds_7_is_br;
    endcase
  end // always @(*)
  wire         _f2_predicted_ghist_T_10 = casez_tmp_3 & f2_do_redirect;
  wire [7:0]   f2_predicted_ghist_cfi_idx_oh = 8'h1 << f2_redirect_idx;
  wire [6:0]   _GEN_18 = f2_predicted_ghist_cfi_idx_oh[6:0] | f2_predicted_ghist_cfi_idx_oh[7:1];
  wire [5:0]   _GEN_19 = _GEN_18[5:0] | f2_predicted_ghist_cfi_idx_oh[7:2];
  wire [4:0]   _GEN_20 = _GEN_19[4:0] | f2_predicted_ghist_cfi_idx_oh[7:3];
  wire [3:0]   _GEN_21 = _GEN_20[3:0] | f2_predicted_ghist_cfi_idx_oh[7:4];
  wire [2:0]   _GEN_22 = _GEN_21[2:0] | f2_predicted_ghist_cfi_idx_oh[7:5];
  wire [1:0]   _GEN_23 = _GEN_22[1:0] | f2_predicted_ghist_cfi_idx_oh[7:6];
  wire [7:0]   _GEN_24 = {_bpd_io_resp_f2_preds_7_is_br & _bpd_io_resp_f2_preds_7_predicted_pc_valid, _bpd_io_resp_f2_preds_6_is_br & _bpd_io_resp_f2_preds_6_predicted_pc_valid, _bpd_io_resp_f2_preds_5_is_br & _bpd_io_resp_f2_preds_5_predicted_pc_valid, _bpd_io_resp_f2_preds_4_is_br & _bpd_io_resp_f2_preds_4_predicted_pc_valid, _bpd_io_resp_f2_preds_3_is_br & _bpd_io_resp_f2_preds_3_predicted_pc_valid, _bpd_io_resp_f2_preds_2_is_br & _bpd_io_resp_f2_preds_2_predicted_pc_valid, _bpd_io_resp_f2_preds_1_is_br & _bpd_io_resp_f2_preds_1_predicted_pc_valid, _bpd_io_resp_f2_preds_0_is_br & _bpd_io_resp_f2_preds_0_predicted_pc_valid} & _GEN_17 & (f2_do_redirect ? {&f2_redirect_idx, _GEN_18[6], _GEN_19[5], _GEN_20[4], _GEN_21[3], _GEN_22[2], _GEN_23[1], _GEN_23[0] | (&f2_redirect_idx)} & ~(casez_tmp_4 & _f2_predicted_ghist_T_10 ? f2_predicted_ghist_cfi_idx_oh : 8'h0) : 8'hFF);
  wire         _f2_predicted_ghist_new_history_new_saw_branch_taken_T_1 = f2_do_redirect & _f2_predicted_ghist_T_10;
  wire         f2_predicted_ghist_cfi_in_bank_0 = _f2_predicted_ghist_new_history_new_saw_branch_taken_T_1 & ~(f2_redirect_idx[2]);
  wire         f2_predicted_ghist_ignore_second_bank = f2_predicted_ghist_cfi_in_bank_0 | (&(s2_vpc[5:3]));
  wire         f2_predicted_ghist_first_bank_saw_not_taken = (|(_GEN_24[3:0])) | s2_ghist_current_saw_branch_not_taken;
  wire [63:0]  _GEN_25 = {s2_ghist_old_history[62:0], 1'h0};
  wire [63:0]  _GEN_26 = {s2_ghist_old_history[62:0], 1'h1};
  wire [63:0]  _f2_predicted_ghist_new_history_old_history_T_4 = s2_ghist_new_saw_branch_taken ? _GEN_26 : s2_ghist_new_saw_branch_not_taken ? _GEN_25 : s2_ghist_old_history;
  wire [62:0]  _GEN_27 = {s2_ghist_old_history[61:0], 1'h0};
  wire [62:0]  _GEN_28 = {s2_ghist_old_history[61:0], 1'h1};
  wire [63:0]  _f2_predicted_ghist_new_history_old_history_T_25 = casez_tmp_4 & f2_predicted_ghist_cfi_in_bank_0 ? {s2_ghist_new_saw_branch_taken ? _GEN_28 : s2_ghist_new_saw_branch_not_taken ? _GEN_27 : s2_ghist_old_history[62:0], 1'h1} : f2_predicted_ghist_first_bank_saw_not_taken ? {s2_ghist_new_saw_branch_taken ? _GEN_28 : s2_ghist_new_saw_branch_not_taken ? _GEN_27 : s2_ghist_old_history[62:0], 1'h0} : s2_ghist_new_saw_branch_taken ? _GEN_26 : s2_ghist_new_saw_branch_not_taken ? _GEN_25 : s2_ghist_old_history;
  wire [63:0]  f2_predicted_ghist_old_history = f2_predicted_ghist_ignore_second_bank ? _f2_predicted_ghist_new_history_old_history_T_4 : _f2_predicted_ghist_new_history_old_history_T_25;
  wire         f2_predicted_ghist_new_saw_branch_not_taken = f2_predicted_ghist_ignore_second_bank ? f2_predicted_ghist_first_bank_saw_not_taken : (|(_GEN_24[7:4]));
  wire         f2_predicted_ghist_new_saw_branch_taken = f2_predicted_ghist_ignore_second_bank ? casez_tmp_4 & f2_predicted_ghist_cfi_in_bank_0 : _f2_predicted_ghist_new_history_new_saw_branch_taken_T_1 & casez_tmp_4 & ~f2_predicted_ghist_cfi_in_bank_0;
  wire         _f2_correct_f1_ghist_T_4 = s1_ghist_old_history == f2_predicted_ghist_old_history & s1_ghist_new_saw_branch_not_taken == f2_predicted_ghist_new_saw_branch_not_taken & s1_ghist_new_saw_branch_taken == f2_predicted_ghist_new_saw_branch_taken;
  wire         _s0_is_replay_T = s2_valid & _icache_io_resp_valid;
  wire         _GEN_29 = s2_valid & ~_icache_io_resp_valid | _s0_is_replay_T & ~_f3_io_enq_ready;
  wire         _GEN_30 = s2_valid & _f3_io_enq_ready;
  wire         _GEN_31 = s1_valid & (s1_vpc != f2_predicted_target | ~_f2_correct_f1_ghist_T_4) | ~s1_valid;
  wire         _GEN_32 = _GEN_30 & _GEN_31;
  wire         _GEN_33 = _GEN_30 & _GEN_31;
  wire         _GEN_34 = reset | f4_clear;
  wire         _f3_io_enq_valid_T_6 = s2_valid & ~f2_clear & (_icache_io_resp_valid | _f3_io_enq_valid_T_2 & ~s2_tlb_miss);
  wire [10:0]  _f3_io_enq_bits_mask_T = 11'hFF << s2_vpc[2:1];
  reg  [4:0]   ras_read_idx;
  wire         _GEN_35 = _f3_io_enq_ready & _f3_io_enq_valid_T_6;
  reg          f3_bpd_resp_io_enq_valid_REG;
  wire         _f3_bpd_resp_io_enq_valid_T = _f3_io_deq_valid & f3_bpd_resp_io_enq_valid_REG;
  wire [7:0]   f3_fetch_bundle_br_mask = {f3_br_mask_7, f3_br_mask_6, f3_br_mask_5, f3_br_mask_4, f3_br_mask_3, f3_br_mask_2, f3_br_mask_1, f3_br_mask_0};
  reg  [15:0]  f3_prev_half;
  reg          f3_prev_is_half;
  wire [31:0]  inst0 = {_f3_io_deq_bits_data[15:0], f3_prev_half};
  wire [31:0]  exp_inst0 = _exp_inst0_rvc_exp_io_rvc ? _exp_inst0_rvc_exp_io_out_bits : inst0;
  wire [31:0]  exp_inst1 = _exp_inst1_rvc_exp_io_rvc ? _exp_inst1_rvc_exp_io_out_bits : _f3_io_deq_bits_data[31:0];
  wire [39:0]  _GEN_36 = {_f3_io_deq_bits_pc[39:3], 3'h0};
  wire [31:0]  bank_insts_0 = f3_prev_is_half ? inst0 : _f3_io_deq_bits_data[31:0];
  wire [2:0]   brsigs_cfi_type = f3_prev_is_half ? _bpd_decoder0_io_out_cfi_type : _bpd_decoder1_io_out_cfi_type;
  wire [39:0]  brsigs_target = f3_prev_is_half ? _bpd_decoder0_io_out_target : _bpd_decoder1_io_out_target;
  assign f3_mask_0 = _f3_io_deq_valid & _f3_io_deq_bits_mask[0];
  wire         _f3_redirects_0_T_1 = brsigs_cfi_type == 3'h3;
  wire         _f3_redirects_0_T = brsigs_cfi_type == 3'h2;
  wire         f3_btb_mispredicts_0 = _f3_redirects_0_T & _f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_valid & _f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_bits != brsigs_target;
  wire [6:0]   _offset_from_aligned_pc_T_4 = {1'h0, f3_prev_is_half ? _bpd_decoder0_io_out_sfb_offset_bits : _bpd_decoder1_io_out_sfb_offset_bits} - {5'h0, f3_prev_is_half, 1'h0};
  wire [38:0]  _GEN_37 = {36'h0, &(_f3_io_deq_bits_pc[5:3]), 2'h0};
  wire [38:0]  _upper_mask_T_3 = {7'h0, 32'h1 << _offset_from_aligned_pc_T_4[5:1]} << _GEN_37;
  wire [6:0]   _GEN_38 = {1'h0, (&(_f3_io_deq_bits_pc[5:3])) ? 6'h18 : 6'h20};
  wire [13:0]  _GEN_39 = _upper_mask_T_3[14:1] | _upper_mask_T_3[13:0];
  wire [12:0]  _GEN_40 = _GEN_39[13:1] | _upper_mask_T_3[12:0];
  wire [11:0]  _GEN_41 = _GEN_40[12:1] | _upper_mask_T_3[11:0];
  wire [10:0]  _GEN_42 = _GEN_41[11:1] | _upper_mask_T_3[10:0];
  wire [9:0]   _GEN_43 = _GEN_42[10:1] | _upper_mask_T_3[9:0];
  wire [8:0]   _GEN_44 = _GEN_43[9:1] | _upper_mask_T_3[8:0];
  wire [7:0]   _GEN_45 = _GEN_44[8:1] | _upper_mask_T_3[7:0];
  wire [6:0]   _GEN_46 = _GEN_45[7:1] | _upper_mask_T_3[6:0];
  wire [5:0]   _GEN_47 = _GEN_46[6:1] | _upper_mask_T_3[5:0];
  wire [4:0]   _GEN_48 = _GEN_47[5:1] | _upper_mask_T_3[4:0];
  wire [3:0]   _GEN_49 = _GEN_48[4:1] | _upper_mask_T_3[3:0];
  wire [2:0]   _GEN_50 = _GEN_49[3:1] | _upper_mask_T_3[2:0];
  wire [1:0]   _GEN_51 = _GEN_50[2:1] | _upper_mask_T_3[1:0];
  wire         _s0_valid_T_11 = _f3_io_deq_bits_xcpt_pf_inst | _f3_io_deq_bits_xcpt_ae_inst;
  wire         _f3_br_mask_0_T = brsigs_cfi_type == 3'h1;
  wire         f3_redirects_0 = f3_mask_0 & (_f3_redirects_0_T | _f3_redirects_0_T_1 | _f3_br_mask_0_T & _f3_bpd_resp_io_deq_bits_preds_0_taken);
  assign f3_br_mask_0 = f3_mask_0 & _f3_br_mask_0_T;
  wire [31:0]  f3_fetch_bundle_exp_insts_1 = _exp_inst_rvc_exp_io_rvc ? _exp_inst_rvc_exp_io_out_bits : inst;
  assign inst = _f3_io_deq_bits_data[47:16];
  wire         valid_1 = f3_prev_is_half | ~(_f3_io_deq_valid & _f3_io_deq_bits_mask[0] & (&(bank_insts_0[1:0])));
  assign f3_mask_1 = _f3_io_deq_valid & _f3_io_deq_bits_mask[1] & valid_1 & ~f3_redirects_0;
  wire         _f3_redirects_1_T_1 = _bpd_decoder_io_out_cfi_type == 3'h3;
  wire         _f3_redirects_1_T = _bpd_decoder_io_out_cfi_type == 3'h2;
  wire         f3_btb_mispredicts_1 = _f3_redirects_1_T & valid_1 & _f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_valid & _f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_bits != _bpd_decoder_io_out_target;
  wire [6:0]   _offset_from_aligned_pc_T_5 = {1'h0, _bpd_decoder_io_out_sfb_offset_bits} + 7'h2;
  wire [38:0]  _upper_mask_T_7 = {7'h0, 32'h1 << _offset_from_aligned_pc_T_5[5:1]} << _GEN_37;
  wire [13:0]  _GEN_52 = _upper_mask_T_7[14:1] | _upper_mask_T_7[13:0];
  wire [12:0]  _GEN_53 = _GEN_52[13:1] | _upper_mask_T_7[12:0];
  wire [11:0]  _GEN_54 = _GEN_53[12:1] | _upper_mask_T_7[11:0];
  wire [10:0]  _GEN_55 = _GEN_54[11:1] | _upper_mask_T_7[10:0];
  wire [9:0]   _GEN_56 = _GEN_55[10:1] | _upper_mask_T_7[9:0];
  wire [8:0]   _GEN_57 = _GEN_56[9:1] | _upper_mask_T_7[8:0];
  wire [7:0]   _GEN_58 = _GEN_57[8:1] | _upper_mask_T_7[7:0];
  wire [6:0]   _GEN_59 = _GEN_58[7:1] | _upper_mask_T_7[6:0];
  wire [5:0]   _GEN_60 = _GEN_59[6:1] | _upper_mask_T_7[5:0];
  wire [4:0]   _GEN_61 = _GEN_60[5:1] | _upper_mask_T_7[4:0];
  wire [3:0]   _GEN_62 = _GEN_61[4:1] | _upper_mask_T_7[3:0];
  wire [2:0]   _GEN_63 = _GEN_62[3:1] | _upper_mask_T_7[2:0];
  wire [1:0]   _GEN_64 = _GEN_63[2:1] | _upper_mask_T_7[1:0];
  wire         _f3_br_mask_1_T = _bpd_decoder_io_out_cfi_type == 3'h1;
  wire         f3_redirects_1 = f3_mask_1 & (_f3_redirects_1_T | _f3_redirects_1_T_1 | _f3_br_mask_1_T & _f3_bpd_resp_io_deq_bits_preds_1_taken);
  assign f3_br_mask_1 = f3_mask_1 & _f3_br_mask_1_T;
  wire         _GEN_65 = f3_redirects_0 | f3_redirects_1;
  wire [31:0]  f3_fetch_bundle_exp_insts_2 = _exp_inst_rvc_exp_1_io_rvc ? _exp_inst_rvc_exp_1_io_out_bits : inst_1;
  assign inst_1 = _f3_io_deq_bits_data[63:32];
  wire         _valid_T_9 = _f3_io_deq_valid & _f3_io_deq_bits_mask[1] & valid_1 & ~f3_redirects_0 & (&(_f3_io_deq_bits_data[17:16]));
  wire         bank_mask_2 = _f3_io_deq_valid & _f3_io_deq_bits_mask[2] & ~_valid_T_9 & ~_GEN_65;
  assign f3_mask_2 = _f3_io_deq_valid & _f3_io_deq_bits_mask[2] & ~_valid_T_9 & ~_GEN_65;
  wire         _f3_redirects_2_T_1 = _bpd_decoder_1_io_out_cfi_type == 3'h3;
  wire         _f3_redirects_2_T = _bpd_decoder_1_io_out_cfi_type == 3'h2;
  wire         f3_btb_mispredicts_2 = _f3_redirects_2_T & ~_valid_T_9 & _f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_valid & _f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_bits != _bpd_decoder_1_io_out_target;
  wire [6:0]   _offset_from_aligned_pc_T_10 = {1'h0, _bpd_decoder_1_io_out_sfb_offset_bits} + 7'h4;
  wire [38:0]  _upper_mask_T_11 = {7'h0, 32'h1 << _offset_from_aligned_pc_T_10[5:1]} << _GEN_37;
  wire [13:0]  _GEN_66 = _upper_mask_T_11[14:1] | _upper_mask_T_11[13:0];
  wire [12:0]  _GEN_67 = _GEN_66[13:1] | _upper_mask_T_11[12:0];
  wire [11:0]  _GEN_68 = _GEN_67[12:1] | _upper_mask_T_11[11:0];
  wire [10:0]  _GEN_69 = _GEN_68[11:1] | _upper_mask_T_11[10:0];
  wire [9:0]   _GEN_70 = _GEN_69[10:1] | _upper_mask_T_11[9:0];
  wire [8:0]   _GEN_71 = _GEN_70[9:1] | _upper_mask_T_11[8:0];
  wire [7:0]   _GEN_72 = _GEN_71[8:1] | _upper_mask_T_11[7:0];
  wire [6:0]   _GEN_73 = _GEN_72[7:1] | _upper_mask_T_11[6:0];
  wire [5:0]   _GEN_74 = _GEN_73[6:1] | _upper_mask_T_11[5:0];
  wire [4:0]   _GEN_75 = _GEN_74[5:1] | _upper_mask_T_11[4:0];
  wire [3:0]   _GEN_76 = _GEN_75[4:1] | _upper_mask_T_11[3:0];
  wire [2:0]   _GEN_77 = _GEN_76[3:1] | _upper_mask_T_11[2:0];
  wire [1:0]   _GEN_78 = _GEN_77[2:1] | _upper_mask_T_11[1:0];
  wire         _f3_br_mask_2_T = _bpd_decoder_1_io_out_cfi_type == 3'h1;
  wire         f3_redirects_2 = f3_mask_2 & (_f3_redirects_2_T | _f3_redirects_2_T_1 | _f3_br_mask_2_T & _f3_bpd_resp_io_deq_bits_preds_2_taken);
  assign f3_br_mask_2 = f3_mask_2 & _f3_br_mask_2_T;
  wire         _GEN_79 = _GEN_65 | f3_redirects_2;
  wire [31:0]  f3_fetch_bundle_exp_insts_3 = _exp_inst_rvc_exp_2_io_rvc ? _exp_inst_rvc_exp_2_io_out_bits : inst_2;
  assign inst_2 = {16'h0, _f3_io_deq_bits_data[63:48]};
  wire         _valid_T_18 = bank_mask_2 & (&(_f3_io_deq_bits_data[33:32])) | (&(_f3_io_deq_bits_data[49:48]));
  assign f3_mask_3 = _f3_io_deq_valid & _f3_io_deq_bits_mask[3] & ~_valid_T_18 & ~_GEN_79;
  wire         _f3_redirects_3_T_1 = _bpd_decoder_2_io_out_cfi_type == 3'h3;
  wire         _f3_redirects_3_T = _bpd_decoder_2_io_out_cfi_type == 3'h2;
  wire         f3_btb_mispredicts_3 = _f3_redirects_3_T & ~_valid_T_18 & _f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_valid & _f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_bits != _bpd_decoder_2_io_out_target;
  wire [6:0]   _offset_from_aligned_pc_T_15 = {1'h0, _bpd_decoder_2_io_out_sfb_offset_bits} + 7'h6;
  wire [38:0]  _upper_mask_T_15 = {7'h0, 32'h1 << _offset_from_aligned_pc_T_15[5:1]} << _GEN_37;
  wire [13:0]  _GEN_80 = _upper_mask_T_15[14:1] | _upper_mask_T_15[13:0];
  wire [12:0]  _GEN_81 = _GEN_80[13:1] | _upper_mask_T_15[12:0];
  wire [11:0]  _GEN_82 = _GEN_81[12:1] | _upper_mask_T_15[11:0];
  wire [10:0]  _GEN_83 = _GEN_82[11:1] | _upper_mask_T_15[10:0];
  wire [9:0]   _GEN_84 = _GEN_83[10:1] | _upper_mask_T_15[9:0];
  wire [8:0]   _GEN_85 = _GEN_84[9:1] | _upper_mask_T_15[8:0];
  wire [7:0]   _GEN_86 = _GEN_85[8:1] | _upper_mask_T_15[7:0];
  wire [6:0]   _GEN_87 = _GEN_86[7:1] | _upper_mask_T_15[6:0];
  wire [5:0]   _GEN_88 = _GEN_87[6:1] | _upper_mask_T_15[5:0];
  wire [4:0]   _GEN_89 = _GEN_88[5:1] | _upper_mask_T_15[4:0];
  wire [3:0]   _GEN_90 = _GEN_89[4:1] | _upper_mask_T_15[3:0];
  wire [2:0]   _GEN_91 = _GEN_90[3:1] | _upper_mask_T_15[2:0];
  wire [1:0]   _GEN_92 = _GEN_91[2:1] | _upper_mask_T_15[1:0];
  wire         _f3_br_mask_3_T = _bpd_decoder_2_io_out_cfi_type == 3'h1;
  wire         f3_redirects_3 = f3_mask_3 & (_f3_redirects_3_T | _f3_redirects_3_T_1 | _f3_br_mask_3_T & _f3_bpd_resp_io_deq_bits_preds_3_taken);
  assign f3_br_mask_3 = f3_mask_3 & _f3_br_mask_3_T;
  wire         _GEN_93 = _GEN_79 | f3_redirects_3;
  wire         f3_fetch_bundle_edge_inst_1 = ~(bank_mask_2 & (&(_f3_io_deq_bits_data[33:32]))) & (&(_f3_io_deq_bits_data[49:48]));
  wire [31:0]  exp_inst1_1 = _exp_inst1_rvc_exp_1_io_rvc ? _exp_inst1_rvc_exp_1_io_out_bits : _f3_io_deq_bits_data[95:64];
  wire [31:0]  exp_inst0b = _exp_inst0b_rvc_exp_io_rvc ? _exp_inst0b_rvc_exp_io_out_bits : _f3_io_deq_bits_data[79:48];
  wire [31:0]  bank_insts_1_0 = f3_fetch_bundle_edge_inst_1 ? _f3_io_deq_bits_data[79:48] : _f3_io_deq_bits_data[95:64];
  wire [2:0]   brsigs_4_cfi_type = f3_fetch_bundle_edge_inst_1 ? _bpd_decoder0b_io_out_cfi_type : _bpd_decoder1_1_io_out_cfi_type;
  wire [39:0]  brsigs_4_target = f3_fetch_bundle_edge_inst_1 ? _bpd_decoder0b_io_out_target : _bpd_decoder1_1_io_out_target;
  assign f3_mask_4 = _f3_io_deq_valid & _f3_io_deq_bits_mask[4] & ~_GEN_93;
  wire         _f3_redirects_4_T_1 = brsigs_4_cfi_type == 3'h3;
  wire         _f3_redirects_4_T = brsigs_4_cfi_type == 3'h2;
  wire         f3_btb_mispredicts_4 = _f3_redirects_4_T & _f3_bpd_resp_io_deq_bits_preds_4_predicted_pc_valid & _f3_bpd_resp_io_deq_bits_preds_4_predicted_pc_bits != brsigs_4_target;
  wire [6:0]   _offset_from_aligned_pc_T_24 = {1'h0, f3_fetch_bundle_edge_inst_1 ? _bpd_decoder0b_io_out_sfb_offset_bits : _bpd_decoder1_1_io_out_sfb_offset_bits} + 7'h8 - {5'h0, f3_fetch_bundle_edge_inst_1, 1'h0};
  wire [38:0]  _upper_mask_T_19 = {7'h0, 32'h1 << _offset_from_aligned_pc_T_24[5:1]} << _GEN_37;
  wire [13:0]  _GEN_94 = _upper_mask_T_19[14:1] | _upper_mask_T_19[13:0];
  wire [12:0]  _GEN_95 = _GEN_94[13:1] | _upper_mask_T_19[12:0];
  wire [11:0]  _GEN_96 = _GEN_95[12:1] | _upper_mask_T_19[11:0];
  wire [10:0]  _GEN_97 = _GEN_96[11:1] | _upper_mask_T_19[10:0];
  wire [9:0]   _GEN_98 = _GEN_97[10:1] | _upper_mask_T_19[9:0];
  wire [8:0]   _GEN_99 = _GEN_98[9:1] | _upper_mask_T_19[8:0];
  wire [7:0]   _GEN_100 = _GEN_99[8:1] | _upper_mask_T_19[7:0];
  wire [6:0]   _GEN_101 = _GEN_100[7:1] | _upper_mask_T_19[6:0];
  wire [5:0]   _GEN_102 = _GEN_101[6:1] | _upper_mask_T_19[5:0];
  wire [4:0]   _GEN_103 = _GEN_102[5:1] | _upper_mask_T_19[4:0];
  wire [3:0]   _GEN_104 = _GEN_103[4:1] | _upper_mask_T_19[3:0];
  wire [2:0]   _GEN_105 = _GEN_104[3:1] | _upper_mask_T_19[2:0];
  wire [1:0]   _GEN_106 = _GEN_105[2:1] | _upper_mask_T_19[1:0];
  wire         _f3_fetch_bundle_shadowable_mask_7_T_4 = _f3_io_deq_bits_pc[5:3] != 3'h7;
  wire         _f3_br_mask_4_T = brsigs_4_cfi_type == 3'h1;
  wire         f3_redirects_4 = f3_mask_4 & (_f3_redirects_4_T | _f3_redirects_4_T_1 | _f3_br_mask_4_T & _f3_bpd_resp_io_deq_bits_preds_4_taken);
  assign f3_br_mask_4 = f3_mask_4 & _f3_br_mask_4_T;
  wire         _GEN_107 = _GEN_93 | f3_redirects_4;
  wire [31:0]  f3_fetch_bundle_exp_insts_5 = _exp_inst_rvc_exp_3_io_rvc ? _exp_inst_rvc_exp_3_io_out_bits : inst_3;
  assign inst_3 = _f3_io_deq_bits_data[111:80];
  wire         valid_5 = f3_fetch_bundle_edge_inst_1 | ~(_f3_io_deq_valid & _f3_io_deq_bits_mask[4] & ~_GEN_93 & (&(bank_insts_1_0[1:0])));
  assign f3_mask_5 = _f3_io_deq_valid & _f3_io_deq_bits_mask[5] & valid_5 & ~_GEN_107;
  wire         _f3_redirects_5_T_1 = _bpd_decoder_3_io_out_cfi_type == 3'h3;
  wire         _f3_redirects_5_T = _bpd_decoder_3_io_out_cfi_type == 3'h2;
  wire         f3_btb_mispredicts_5 = _f3_redirects_5_T & valid_5 & _f3_bpd_resp_io_deq_bits_preds_5_predicted_pc_valid & _f3_bpd_resp_io_deq_bits_preds_5_predicted_pc_bits != _bpd_decoder_3_io_out_target;
  wire [6:0]   _offset_from_aligned_pc_T_25 = {1'h0, _bpd_decoder_3_io_out_sfb_offset_bits} + 7'hA;
  wire [38:0]  _upper_mask_T_23 = {7'h0, 32'h1 << _offset_from_aligned_pc_T_25[5:1]} << _GEN_37;
  wire [13:0]  _GEN_108 = _upper_mask_T_23[14:1] | _upper_mask_T_23[13:0];
  wire [12:0]  _GEN_109 = _GEN_108[13:1] | _upper_mask_T_23[12:0];
  wire [11:0]  _GEN_110 = _GEN_109[12:1] | _upper_mask_T_23[11:0];
  wire [10:0]  _GEN_111 = _GEN_110[11:1] | _upper_mask_T_23[10:0];
  wire [9:0]   _GEN_112 = _GEN_111[10:1] | _upper_mask_T_23[9:0];
  wire [8:0]   _GEN_113 = _GEN_112[9:1] | _upper_mask_T_23[8:0];
  wire [7:0]   _GEN_114 = _GEN_113[8:1] | _upper_mask_T_23[7:0];
  wire [6:0]   _GEN_115 = _GEN_114[7:1] | _upper_mask_T_23[6:0];
  wire [5:0]   _GEN_116 = _GEN_115[6:1] | _upper_mask_T_23[5:0];
  wire [4:0]   _GEN_117 = _GEN_116[5:1] | _upper_mask_T_23[4:0];
  wire [3:0]   _GEN_118 = _GEN_117[4:1] | _upper_mask_T_23[3:0];
  wire [2:0]   _GEN_119 = _GEN_118[3:1] | _upper_mask_T_23[2:0];
  wire [1:0]   _GEN_120 = _GEN_119[2:1] | _upper_mask_T_23[1:0];
  wire         _f3_br_mask_5_T = _bpd_decoder_3_io_out_cfi_type == 3'h1;
  wire         f3_redirects_5 = f3_mask_5 & (_f3_redirects_5_T | _f3_redirects_5_T_1 | _f3_br_mask_5_T & _f3_bpd_resp_io_deq_bits_preds_5_taken);
  assign f3_br_mask_5 = f3_mask_5 & _f3_br_mask_5_T;
  wire         _GEN_121 = _GEN_107 | f3_redirects_5;
  wire [31:0]  f3_fetch_bundle_exp_insts_6 = _exp_inst_rvc_exp_4_io_rvc ? _exp_inst_rvc_exp_4_io_out_bits : inst_4;
  assign inst_4 = _f3_io_deq_bits_data[127:96];
  wire         _valid_T_29 = _f3_io_deq_valid & _f3_io_deq_bits_mask[5] & valid_5 & ~_GEN_107 & (&(_f3_io_deq_bits_data[81:80]));
  wire         bank_mask_1_2 = _f3_io_deq_valid & _f3_io_deq_bits_mask[6] & ~_valid_T_29 & ~_GEN_121;
  assign f3_mask_6 = _f3_io_deq_valid & _f3_io_deq_bits_mask[6] & ~_valid_T_29 & ~_GEN_121;
  wire         _f3_redirects_6_T_1 = _bpd_decoder_4_io_out_cfi_type == 3'h3;
  wire         _f3_redirects_6_T = _bpd_decoder_4_io_out_cfi_type == 3'h2;
  wire         f3_btb_mispredicts_6 = _f3_redirects_6_T & ~_valid_T_29 & _f3_bpd_resp_io_deq_bits_preds_6_predicted_pc_valid & _f3_bpd_resp_io_deq_bits_preds_6_predicted_pc_bits != _bpd_decoder_4_io_out_target;
  wire [6:0]   _offset_from_aligned_pc_T_30 = {1'h0, _bpd_decoder_4_io_out_sfb_offset_bits} + 7'hC;
  wire [38:0]  _upper_mask_T_27 = {7'h0, 32'h1 << _offset_from_aligned_pc_T_30[5:1]} << _GEN_37;
  wire [13:0]  _GEN_122 = _upper_mask_T_27[14:1] | _upper_mask_T_27[13:0];
  wire [12:0]  _GEN_123 = _GEN_122[13:1] | _upper_mask_T_27[12:0];
  wire [11:0]  _GEN_124 = _GEN_123[12:1] | _upper_mask_T_27[11:0];
  wire [10:0]  _GEN_125 = _GEN_124[11:1] | _upper_mask_T_27[10:0];
  wire [9:0]   _GEN_126 = _GEN_125[10:1] | _upper_mask_T_27[9:0];
  wire [8:0]   _GEN_127 = _GEN_126[9:1] | _upper_mask_T_27[8:0];
  wire [7:0]   _GEN_128 = _GEN_127[8:1] | _upper_mask_T_27[7:0];
  wire [6:0]   _GEN_129 = _GEN_128[7:1] | _upper_mask_T_27[6:0];
  wire [5:0]   _GEN_130 = _GEN_129[6:1] | _upper_mask_T_27[5:0];
  wire [4:0]   _GEN_131 = _GEN_130[5:1] | _upper_mask_T_27[4:0];
  wire [3:0]   _GEN_132 = _GEN_131[4:1] | _upper_mask_T_27[3:0];
  wire [2:0]   _GEN_133 = _GEN_132[3:1] | _upper_mask_T_27[2:0];
  wire [1:0]   _GEN_134 = _GEN_133[2:1] | _upper_mask_T_27[1:0];
  wire         _f3_br_mask_6_T = _bpd_decoder_4_io_out_cfi_type == 3'h1;
  wire         f3_redirects_6 = f3_mask_6 & (_f3_redirects_6_T | _f3_redirects_6_T_1 | _f3_br_mask_6_T & _f3_bpd_resp_io_deq_bits_preds_6_taken);
  assign f3_br_mask_6 = f3_mask_6 & _f3_br_mask_6_T;
  wire [31:0]  f3_fetch_bundle_exp_insts_7 = _exp_inst_rvc_exp_5_io_rvc ? _exp_inst_rvc_exp_5_io_out_bits : inst_5;
  assign inst_5 = {16'h0, _f3_io_deq_bits_data[127:112]};
  wire         _valid_T_38 = bank_mask_1_2 & (&(_f3_io_deq_bits_data[97:96])) | (&(_f3_io_deq_bits_data[113:112]));
  assign f3_mask_7 = _f3_io_deq_valid & _f3_io_deq_bits_mask[7] & ~_valid_T_38 & ~(_GEN_121 | f3_redirects_6);
  wire         _f3_redirects_7_T_1 = _bpd_decoder_5_io_out_cfi_type == 3'h3;
  wire         _f3_redirects_7_T = _bpd_decoder_5_io_out_cfi_type == 3'h2;
  wire         f3_btb_mispredicts_7 = _f3_redirects_7_T & ~_valid_T_38 & _f3_bpd_resp_io_deq_bits_preds_7_predicted_pc_valid & _f3_bpd_resp_io_deq_bits_preds_7_predicted_pc_bits != _bpd_decoder_5_io_out_target;
  wire [6:0]   _offset_from_aligned_pc_T_35 = {1'h0, _bpd_decoder_5_io_out_sfb_offset_bits} + 7'hE;
  wire [38:0]  _upper_mask_T_31 = {7'h0, 32'h1 << _offset_from_aligned_pc_T_35[5:1]} << _GEN_37;
  wire [13:0]  _GEN_135 = _upper_mask_T_31[14:1] | _upper_mask_T_31[13:0];
  wire [12:0]  _GEN_136 = _GEN_135[13:1] | _upper_mask_T_31[12:0];
  wire [11:0]  _GEN_137 = _GEN_136[12:1] | _upper_mask_T_31[11:0];
  wire [10:0]  _GEN_138 = _GEN_137[11:1] | _upper_mask_T_31[10:0];
  wire [9:0]   _GEN_139 = _GEN_138[10:1] | _upper_mask_T_31[9:0];
  wire [8:0]   _GEN_140 = _GEN_139[9:1] | _upper_mask_T_31[8:0];
  wire [7:0]   _GEN_141 = _GEN_140[8:1] | _upper_mask_T_31[7:0];
  wire [6:0]   _GEN_142 = _GEN_141[7:1] | _upper_mask_T_31[6:0];
  wire [5:0]   _GEN_143 = _GEN_142[6:1] | _upper_mask_T_31[5:0];
  wire [4:0]   _GEN_144 = _GEN_143[5:1] | _upper_mask_T_31[4:0];
  wire [3:0]   _GEN_145 = _GEN_144[4:1] | _upper_mask_T_31[3:0];
  wire [2:0]   _GEN_146 = _GEN_145[3:1] | _upper_mask_T_31[2:0];
  wire [1:0]   _GEN_147 = _GEN_146[2:1] | _upper_mask_T_31[1:0];
  wire         _f3_br_mask_7_T = _bpd_decoder_5_io_out_cfi_type == 3'h1;
  wire         f3_redirects_7 = f3_mask_7 & (_f3_redirects_7_T | _f3_redirects_7_T_1 | _f3_br_mask_7_T & _f3_bpd_resp_io_deq_bits_preds_7_taken);
  assign f3_br_mask_7 = f3_mask_7 & _f3_br_mask_7_T;
  wire         f3_fetch_bundle_end_half_valid = _f3_fetch_bundle_shadowable_mask_7_T_4 ? ~(bank_mask_1_2 & (&(_f3_io_deq_bits_data[97:96]))) & (&(_f3_io_deq_bits_data[113:112])) : f3_fetch_bundle_edge_inst_1;
  wire [15:0]  f3_fetch_bundle_end_half_bits = _f3_fetch_bundle_shadowable_mask_7_T_4 ? _f3_io_deq_bits_data[127:112] : _f3_io_deq_bits_data[63:48];
  reg  [2:0]   casez_tmp_5;
  always @(*) begin
    casez (f3_fetch_bundle_cfi_idx_bits)
      3'b000:
        casez_tmp_5 = brsigs_cfi_type;
      3'b001:
        casez_tmp_5 = _bpd_decoder_io_out_cfi_type;
      3'b010:
        casez_tmp_5 = _bpd_decoder_1_io_out_cfi_type;
      3'b011:
        casez_tmp_5 = _bpd_decoder_2_io_out_cfi_type;
      3'b100:
        casez_tmp_5 = brsigs_4_cfi_type;
      3'b101:
        casez_tmp_5 = _bpd_decoder_3_io_out_cfi_type;
      3'b110:
        casez_tmp_5 = _bpd_decoder_4_io_out_cfi_type;
      default:
        casez_tmp_5 = _bpd_decoder_5_io_out_cfi_type;
    endcase
  end // always @(*)
  reg          casez_tmp_6;
  always @(*) begin
    casez (f3_fetch_bundle_cfi_idx_bits)
      3'b000:
        casez_tmp_6 = f3_prev_is_half ? _bpd_decoder0_io_out_is_call : _bpd_decoder1_io_out_is_call;
      3'b001:
        casez_tmp_6 = _bpd_decoder_io_out_is_call;
      3'b010:
        casez_tmp_6 = _bpd_decoder_1_io_out_is_call;
      3'b011:
        casez_tmp_6 = _bpd_decoder_2_io_out_is_call;
      3'b100:
        casez_tmp_6 = f3_fetch_bundle_edge_inst_1 ? _bpd_decoder0b_io_out_is_call : _bpd_decoder1_1_io_out_is_call;
      3'b101:
        casez_tmp_6 = _bpd_decoder_3_io_out_is_call;
      3'b110:
        casez_tmp_6 = _bpd_decoder_4_io_out_is_call;
      default:
        casez_tmp_6 = _bpd_decoder_5_io_out_is_call;
    endcase
  end // always @(*)
  reg          casez_tmp_7;
  always @(*) begin
    casez (f3_fetch_bundle_cfi_idx_bits)
      3'b000:
        casez_tmp_7 = f3_prev_is_half ? _bpd_decoder0_io_out_is_ret : _bpd_decoder1_io_out_is_ret;
      3'b001:
        casez_tmp_7 = _bpd_decoder_io_out_is_ret;
      3'b010:
        casez_tmp_7 = _bpd_decoder_1_io_out_is_ret;
      3'b011:
        casez_tmp_7 = _bpd_decoder_2_io_out_is_ret;
      3'b100:
        casez_tmp_7 = f3_fetch_bundle_edge_inst_1 ? _bpd_decoder0b_io_out_is_ret : _bpd_decoder1_1_io_out_is_ret;
      3'b101:
        casez_tmp_7 = _bpd_decoder_3_io_out_is_ret;
      3'b110:
        casez_tmp_7 = _bpd_decoder_4_io_out_is_ret;
      default:
        casez_tmp_7 = _bpd_decoder_5_io_out_is_ret;
    endcase
  end // always @(*)
  reg          casez_tmp_8;
  always @(*) begin
    casez (f3_fetch_bundle_cfi_idx_bits)
      3'b000:
        casez_tmp_8 = (&(bank_insts_0[1:0])) & ~f3_prev_is_half;
      3'b001:
        casez_tmp_8 = &(_f3_io_deq_bits_data[17:16]);
      3'b010:
        casez_tmp_8 = &(_f3_io_deq_bits_data[33:32]);
      3'b011:
        casez_tmp_8 = &(_f3_io_deq_bits_data[49:48]);
      3'b100:
        casez_tmp_8 = (&(bank_insts_1_0[1:0])) & ~f3_fetch_bundle_edge_inst_1;
      3'b101:
        casez_tmp_8 = &(_f3_io_deq_bits_data[81:80]);
      3'b110:
        casez_tmp_8 = &(_f3_io_deq_bits_data[97:96]);
      default:
        casez_tmp_8 = &(_f3_io_deq_bits_data[113:112]);
    endcase
  end // always @(*)
  wire         _f4_btb_corrections_io_enq_valid_T = _f4_io_enq_ready & _f3_io_deq_valid;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (_f4_btb_corrections_io_enq_valid_T & ~reset & _f3_bpd_resp_io_deq_bits_pc != _f3_io_deq_bits_pc) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at frontend.scala:771 assert(f3_bpd_resp.io.deq.bits.pc === f3_fetch_bundle.pc)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire         _f3_predicted_target_T = f3_redirects_0 | f3_redirects_1;
  wire         f3_fetch_bundle_cfi_idx_valid = _f3_predicted_target_T | f3_redirects_2 | f3_redirects_3 | f3_redirects_4 | f3_redirects_5 | f3_redirects_6 | f3_redirects_7;
  wire [2:0]   _f3_predicted_target_T_9 = {2'h3, ~f3_redirects_6};
  assign f3_fetch_bundle_cfi_idx_bits = f3_redirects_0 ? 3'h0 : f3_redirects_1 ? 3'h1 : f3_redirects_2 ? 3'h2 : f3_redirects_3 ? 3'h3 : f3_redirects_4 ? 3'h4 : f3_redirects_5 ? 3'h5 : _f3_predicted_target_T_9;
  reg  [39:0]  casez_tmp_9;
  always @(*) begin
    casez (f3_redirects_0 ? 3'h0 : f3_redirects_1 ? 3'h1 : f3_redirects_2 ? 3'h2 : f3_redirects_3 ? 3'h3 : f3_redirects_4 ? 3'h4 : f3_redirects_5 ? 3'h5 : _f3_predicted_target_T_9)
      3'b000:
        casez_tmp_9 = _f3_redirects_0_T_1 ? _f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_bits : brsigs_target;
      3'b001:
        casez_tmp_9 = _f3_redirects_1_T_1 ? _f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_bits : _bpd_decoder_io_out_target;
      3'b010:
        casez_tmp_9 = _f3_redirects_2_T_1 ? _f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_bits : _bpd_decoder_1_io_out_target;
      3'b011:
        casez_tmp_9 = _f3_redirects_3_T_1 ? _f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_bits : _bpd_decoder_2_io_out_target;
      3'b100:
        casez_tmp_9 = _f3_redirects_4_T_1 ? _f3_bpd_resp_io_deq_bits_preds_4_predicted_pc_bits : brsigs_4_target;
      3'b101:
        casez_tmp_9 = _f3_redirects_5_T_1 ? _f3_bpd_resp_io_deq_bits_preds_5_predicted_pc_bits : _bpd_decoder_3_io_out_target;
      3'b110:
        casez_tmp_9 = _f3_redirects_6_T_1 ? _f3_bpd_resp_io_deq_bits_preds_6_predicted_pc_bits : _bpd_decoder_4_io_out_target;
      default:
        casez_tmp_9 = _f3_redirects_7_T_1 ? _f3_bpd_resp_io_deq_bits_preds_7_predicted_pc_bits : _bpd_decoder_5_io_out_target;
    endcase
  end // always @(*)
  wire [39:0]  f3_fetch_bundle_next_pc = _f3_predicted_target_T | f3_redirects_2 | f3_redirects_3 | f3_redirects_4 | f3_redirects_5 | f3_redirects_6 | f3_redirects_7 ? (casez_tmp_7 ? _ras_io_read_addr : casez_tmp_9) : _GEN_36 + {35'h0, (&(_f3_io_deq_bits_pc[5:3])) ? 5'h8 : 5'h10};
  wire [7:0]   _GEN_148 = {5'h0, f3_fetch_bundle_cfi_idx_bits};
  wire [7:0]   _f3_predicted_ghist_T = f3_fetch_bundle_br_mask >> _GEN_148;
  wire [7:0]   f3_predicted_ghist_cfi_idx_oh = 8'h1 << _GEN_148;
  wire [6:0]   _GEN_149 = f3_predicted_ghist_cfi_idx_oh[6:0] | f3_predicted_ghist_cfi_idx_oh[7:1];
  wire [5:0]   _GEN_150 = _GEN_149[5:0] | f3_predicted_ghist_cfi_idx_oh[7:2];
  wire [4:0]   _GEN_151 = _GEN_150[4:0] | f3_predicted_ghist_cfi_idx_oh[7:3];
  wire [3:0]   _GEN_152 = _GEN_151[3:0] | f3_predicted_ghist_cfi_idx_oh[7:4];
  wire [2:0]   _GEN_153 = _GEN_152[2:0] | f3_predicted_ghist_cfi_idx_oh[7:5];
  wire [1:0]   _GEN_154 = _GEN_153[1:0] | f3_predicted_ghist_cfi_idx_oh[7:6];
  wire [7:0]   _f3_predicted_ghist_not_taken_branches_T_20 = f3_fetch_bundle_cfi_idx_valid ? {&f3_fetch_bundle_cfi_idx_bits, _GEN_149[6], _GEN_150[5], _GEN_151[4], _GEN_152[3], _GEN_153[2], _GEN_154[1], _GEN_154[0] | (&f3_fetch_bundle_cfi_idx_bits)} & ~(_f3_predicted_ghist_T[0] & f3_fetch_bundle_cfi_idx_valid ? f3_predicted_ghist_cfi_idx_oh : 8'h0) : 8'hFF;
  wire         f3_predicted_ghist_cfi_in_bank_0 = f3_fetch_bundle_cfi_idx_valid & ~(f3_fetch_bundle_cfi_idx_bits[2]);
  wire         f3_predicted_ghist_ignore_second_bank = f3_predicted_ghist_cfi_in_bank_0 | (&(_f3_io_deq_bits_pc[5:3]));
  wire         f3_predicted_ghist_first_bank_saw_not_taken = (|({f3_br_mask_3, f3_br_mask_2, f3_br_mask_1, f3_br_mask_0} & _f3_predicted_ghist_not_taken_branches_T_20[3:0])) | _f3_io_deq_bits_ghist_current_saw_branch_not_taken;
  wire [63:0]  _GEN_155 = {_f3_io_deq_bits_ghist_old_history[62:0], 1'h0};
  wire [63:0]  _GEN_156 = {_f3_io_deq_bits_ghist_old_history[62:0], 1'h1};
  wire [62:0]  _GEN_157 = {_f3_io_deq_bits_ghist_old_history[61:0], 1'h0};
  wire [62:0]  _GEN_158 = {_f3_io_deq_bits_ghist_old_history[61:0], 1'h1};
  wire [63:0]  f3_predicted_ghist_old_history = f3_predicted_ghist_ignore_second_bank ? (_f3_io_deq_bits_ghist_new_saw_branch_taken ? _GEN_156 : _f3_io_deq_bits_ghist_new_saw_branch_not_taken ? _GEN_155 : _f3_io_deq_bits_ghist_old_history) : _f3_predicted_ghist_T[0] & f3_predicted_ghist_cfi_in_bank_0 ? {_f3_io_deq_bits_ghist_new_saw_branch_taken ? _GEN_158 : _f3_io_deq_bits_ghist_new_saw_branch_not_taken ? _GEN_157 : _f3_io_deq_bits_ghist_old_history[62:0], 1'h1} : f3_predicted_ghist_first_bank_saw_not_taken ? {_f3_io_deq_bits_ghist_new_saw_branch_taken ? _GEN_158 : _f3_io_deq_bits_ghist_new_saw_branch_not_taken ? _GEN_157 : _f3_io_deq_bits_ghist_old_history[62:0], 1'h0} : _f3_io_deq_bits_ghist_new_saw_branch_taken ? _GEN_156 : _f3_io_deq_bits_ghist_new_saw_branch_not_taken ? _GEN_155 : _f3_io_deq_bits_ghist_old_history;
  wire         f3_predicted_ghist_new_saw_branch_not_taken = f3_predicted_ghist_ignore_second_bank ? f3_predicted_ghist_first_bank_saw_not_taken : (|({f3_br_mask_7, f3_br_mask_6, f3_br_mask_5, f3_br_mask_4} & _f3_predicted_ghist_not_taken_branches_T_20[7:4]));
  wire         f3_predicted_ghist_new_saw_branch_taken = f3_predicted_ghist_ignore_second_bank ? _f3_predicted_ghist_T[0] & f3_predicted_ghist_cfi_in_bank_0 : f3_fetch_bundle_cfi_idx_valid & _f3_predicted_ghist_T[0] & ~f3_predicted_ghist_cfi_in_bank_0;
  wire [4:0]   _ras_io_write_idx_T = _f3_io_deq_bits_ghist_ras_idx + 5'h1;
  wire [4:0]   f3_predicted_ghist_ras_idx = f3_fetch_bundle_cfi_idx_valid & casez_tmp_6 ? _ras_io_write_idx_T : f3_fetch_bundle_cfi_idx_valid & casez_tmp_7 ? _f3_io_deq_bits_ghist_ras_idx - 5'h1 : _f3_io_deq_bits_ghist_ras_idx;
  wire         _f3_correct_f1_ghist_T_4 = s1_ghist_old_history == f3_predicted_ghist_old_history & s1_ghist_new_saw_branch_not_taken == f3_predicted_ghist_new_saw_branch_not_taken & s1_ghist_new_saw_branch_taken == f3_predicted_ghist_new_saw_branch_taken;
  wire         _f3_correct_f2_ghist_T_4 = s2_ghist_old_history == f3_predicted_ghist_old_history & s2_ghist_new_saw_branch_not_taken == f3_predicted_ghist_new_saw_branch_not_taken & s2_ghist_new_saw_branch_taken == f3_predicted_ghist_new_saw_branch_taken;
  wire         _GEN_159 = _f3_io_deq_valid & _f4_io_enq_ready;
  wire         _GEN_160 = s2_valid & s2_vpc == f3_fetch_bundle_next_pc & _f3_correct_f2_ghist_T_4;
  wire         _GEN_161 = _GEN_159 & _GEN_160;
  assign _GEN = _GEN_161 ? f3_predicted_ghist_ras_idx : s2_ghist_ras_idx;
  wire         _GEN_162 = ~s2_valid & s1_valid;
  wire         _GEN_163 = _GEN_162 & s1_vpc == f3_fetch_bundle_next_pc & _f3_correct_f1_ghist_T_4;
  wire         _GEN_164 = s2_valid & (s2_vpc != f3_fetch_bundle_next_pc | ~_f3_correct_f2_ghist_T_4) | _GEN_162 & (s1_vpc != f3_fetch_bundle_next_pc | ~_f3_correct_f1_ghist_T_4) | ~s2_valid & ~s1_valid;
  wire         _GEN_165 = _GEN_160 | _GEN_163;
  wire         _GEN_166 = ~_GEN_159 | _GEN_165 | ~_GEN_164;
  wire         f4_delay = (_f4_io_deq_bits_sfbs_0 | _f4_io_deq_bits_sfbs_1 | _f4_io_deq_bits_sfbs_2 | _f4_io_deq_bits_sfbs_3 | _f4_io_deq_bits_sfbs_4 | _f4_io_deq_bits_sfbs_5 | _f4_io_deq_bits_sfbs_6 | _f4_io_deq_bits_sfbs_7) & ~_f4_io_deq_bits_cfi_idx_valid & ~_f4_io_enq_valid_T_1 & ~_f4_io_deq_bits_xcpt_pf_if & ~_f4_io_deq_bits_xcpt_ae_if;
  assign _f4_io_enq_valid_T_1 = _f3_io_deq_valid & ~f4_clear;
  wire [39:0]  _GEN_167 = {1'h0, io_cpu_sfence_bits_addr};
  assign f4_clear = io_cpu_sfence_valid | io_cpu_redirect_flush;
  wire         _GEN_168 = io_cpu_sfence_valid | io_cpu_redirect_flush;
  assign f2_clear = _GEN_168 | _GEN_159 & ~_GEN_165 & _GEN_164;
  assign f1_clear = _GEN_168 | (~_GEN_159 | _GEN_165 ? _GEN_29 | _GEN_32 : _GEN_164 | _GEN_29 | _GEN_32);
  wire         _GEN_169 = io_cpu_sfence_valid | ~io_cpu_redirect_flush;
  wire         s0_valid = ~io_cpu_sfence_valid & (io_cpu_redirect_flush ? io_cpu_redirect_val : _GEN_166 ? (_GEN_29 ? ~s2_tlb_resp_ae_inst & ~s2_tlb_resp_pf_inst | s2_is_replay | s2_tlb_miss : _GEN_33 ? ~(_f3_io_enq_valid_T_2 & ~s2_is_replay) : _GEN_14 ? ~(s1_tlb_resp_ae_inst | s1_tlb_resp_pf_inst) : _GEN_0) : ~_s0_valid_T_11);
  assign s0_vpc = io_cpu_sfence_valid ? _GEN_167 : io_cpu_redirect_flush ? io_cpu_redirect_pc : _GEN_166 ? (_GEN_29 ? s2_vpc : _GEN_33 ? f2_predicted_target : _GEN_14 ? (f1_do_redirect ? casez_tmp : _f1_predicted_target_T_21) : _GEN_1) : f3_fetch_bundle_next_pc;
  wire         _GEN_170 = _f4_btb_corrections_io_enq_valid_T ? f3_fetch_bundle_end_half_valid : f3_prev_is_half;
  wire         _GEN_171 = _GEN_29 | ~(_GEN_30 & s1_valid & s1_vpc == f2_predicted_target & _f2_correct_f1_ghist_T_4);
  wire         _GEN_172 = ~_GEN_159 | _GEN_160 | ~_GEN_163;
  always @(posedge clock) begin
    REG <= reset;
    if (io_cpu_sfence_valid)
      s1_vpc <= _GEN_167;
    else if (io_cpu_redirect_flush)
      s1_vpc <= io_cpu_redirect_pc;
    else if (_GEN_166) begin
      if (_GEN_29)
        s1_vpc <= s2_vpc;
      else if (_GEN_33)
        s1_vpc <= f2_predicted_target;
      else if (_GEN_14) begin
        if (f1_do_redirect)
          s1_vpc <= casez_tmp;
        else
          s1_vpc <= _f1_predicted_target_T_21;
      end
      else
        s1_vpc <= _GEN_1;
    end
    else
      s1_vpc <= f3_fetch_bundle_next_pc;
    if (_GEN_169) begin
      if (_GEN_166) begin
        if (_GEN_29)
          s1_ghist_old_history <= s2_ghist_old_history;
        else if (_GEN_33)
          s1_ghist_old_history <= f2_predicted_ghist_old_history;
        else if (_GEN_14) begin
          if (f1_predicted_ghist_ignore_second_bank)
            s1_ghist_old_history <= _f1_predicted_ghist_new_history_old_history_T_4;
          else
            s1_ghist_old_history <= _f1_predicted_ghist_new_history_old_history_T_25;
        end
        else
          s1_ghist_old_history <= 64'h0;
      end
      else
        s1_ghist_old_history <= f3_predicted_ghist_old_history;
    end
    else
      s1_ghist_old_history <= io_cpu_redirect_ghist_old_history;
    s1_ghist_current_saw_branch_not_taken <= _GEN_169 ? _GEN_166 & _GEN_29 & s2_ghist_current_saw_branch_not_taken : io_cpu_redirect_ghist_current_saw_branch_not_taken;
    if (_GEN_169) begin
      if (_GEN_166) begin
        if (_GEN_29) begin
          s1_ghist_new_saw_branch_not_taken <= s2_ghist_new_saw_branch_not_taken;
          s1_ghist_new_saw_branch_taken <= s2_ghist_new_saw_branch_taken;
        end
        else if (_GEN_33) begin
          s1_ghist_new_saw_branch_not_taken <= f2_predicted_ghist_new_saw_branch_not_taken;
          s1_ghist_new_saw_branch_taken <= f2_predicted_ghist_new_saw_branch_taken;
        end
        else begin
          s1_ghist_new_saw_branch_not_taken <= _GEN_15;
          s1_ghist_new_saw_branch_taken <= _GEN_16;
        end
        if (_GEN_29 | _GEN_33)
          s1_ghist_ras_idx <= s2_ghist_ras_idx;
        else if (~_GEN_14)
          s1_ghist_ras_idx <= 5'h0;
      end
      else begin
        s1_ghist_new_saw_branch_not_taken <= f3_predicted_ghist_new_saw_branch_not_taken;
        s1_ghist_new_saw_branch_taken <= f3_predicted_ghist_new_saw_branch_taken;
        s1_ghist_ras_idx <= f3_predicted_ghist_ras_idx;
      end
    end
    else begin
      s1_ghist_new_saw_branch_not_taken <= io_cpu_redirect_ghist_new_saw_branch_not_taken;
      s1_ghist_new_saw_branch_taken <= io_cpu_redirect_ghist_new_saw_branch_taken;
      s1_ghist_ras_idx <= io_cpu_redirect_ghist_ras_idx;
    end
    s1_is_replay <= ~_GEN_168 & _GEN_166 & _GEN_29 & _s0_is_replay_T;
    s1_is_sfence <= io_cpu_sfence_valid;
    s1_tsrc <= _GEN_169 ? (_GEN_166 ? (_GEN_29 ? s2_tsrc : _GEN_33 ? 2'h1 : _GEN_14 ? 2'h0 : {2{_GEN_0}}) : 2'h2) : 2'h3;
    tlb_io_sfence_REG_valid <= io_cpu_sfence_valid;
    tlb_io_sfence_REG_bits_rs1 <= io_cpu_sfence_bits_rs1;
    tlb_io_sfence_REG_bits_rs2 <= io_cpu_sfence_bits_rs2;
    tlb_io_sfence_REG_bits_addr <= io_cpu_sfence_bits_addr;
    s1_tlb_resp_REG_pf_inst <= s2_tlb_resp_pf_inst;
    s1_tlb_resp_REG_gf_inst <= s2_tlb_resp_gf_inst;
    s1_tlb_resp_REG_ae_inst <= s2_tlb_resp_ae_inst;
    s1_ppc_REG <= s2_ppc;
    s2_vpc <= s1_vpc;
    if (_GEN_172) begin
      if (_GEN_171)
        s2_ghist_old_history <= s1_ghist_old_history;
      else if (f2_predicted_ghist_ignore_second_bank)
        s2_ghist_old_history <= _f2_predicted_ghist_new_history_old_history_T_4;
      else
        s2_ghist_old_history <= _f2_predicted_ghist_new_history_old_history_T_25;
    end
    else
      s2_ghist_old_history <= f3_predicted_ghist_old_history;
    s2_ghist_current_saw_branch_not_taken <= _GEN_172 & _GEN_171 & s1_ghist_current_saw_branch_not_taken;
    if (_GEN_172) begin
      if (_GEN_171) begin
        s2_ghist_new_saw_branch_not_taken <= s1_ghist_new_saw_branch_not_taken;
        s2_ghist_new_saw_branch_taken <= s1_ghist_new_saw_branch_taken;
        s2_ghist_ras_idx <= s1_ghist_ras_idx;
      end
      else begin
        s2_ghist_new_saw_branch_not_taken <= f2_predicted_ghist_new_saw_branch_not_taken;
        s2_ghist_new_saw_branch_taken <= f2_predicted_ghist_new_saw_branch_taken;
      end
    end
    else begin
      s2_ghist_new_saw_branch_not_taken <= f3_predicted_ghist_new_saw_branch_not_taken;
      s2_ghist_new_saw_branch_taken <= f3_predicted_ghist_new_saw_branch_taken;
      s2_ghist_ras_idx <= f3_predicted_ghist_ras_idx;
    end
    s2_ppc <= s1_ppc;
    s2_tsrc <= s1_tsrc;
    s2_tlb_resp_pf_inst <= s1_tlb_resp_pf_inst;
    s2_tlb_resp_gf_inst <= s1_is_replay & s1_tlb_resp_REG_gf_inst;
    s2_tlb_resp_ae_inst <= s1_tlb_resp_ae_inst;
    s2_tlb_miss <= s1_tlb_miss;
    s2_is_replay_REG <= s1_is_replay;
    f3_bpd_resp_io_enq_valid_REG <= _f3_io_enq_ready;
    if (_f4_btb_corrections_io_enq_valid_T)
      f3_prev_half <= f3_fetch_bundle_end_half_bits;
    if (reset) begin
      s1_valid <= 1'h0;
      s2_valid <= 1'h0;
      ras_read_idx <= 5'h0;
      f3_prev_is_half <= 1'h0;
    end
    else begin
      s1_valid <= s0_valid;
      s2_valid <= s1_valid & ~f1_clear;
      if (_GEN_35)
        ras_read_idx <= _GEN;
      f3_prev_is_half <= _GEN_169 & (_GEN_159 ? ~(_f3_predicted_target_T | f3_redirects_2 | f3_redirects_3 | f3_redirects_4 | f3_redirects_5 | f3_redirects_6 | f3_redirects_7 | f4_clear) & _GEN_170 : ~f4_clear & _GEN_170);
    end
  end // always @(posedge)
  ICache icache (
    .clock                          (clock),
    .reset                          (reset),
    .auto_master_out_a_ready        (auto_icache_master_out_a_ready),
    .auto_master_out_a_valid        (auto_icache_master_out_a_valid),
    .auto_master_out_a_bits_address (auto_icache_master_out_a_bits_address),
    .auto_master_out_d_valid        (auto_icache_master_out_d_valid),
    .auto_master_out_d_bits_opcode  (auto_icache_master_out_d_bits_opcode),
    .auto_master_out_d_bits_size    (auto_icache_master_out_d_bits_size),
    .auto_master_out_d_bits_data    (auto_icache_master_out_d_bits_data),
    .io_req_valid                   (s0_valid),
    .io_req_bits_addr               (s0_vpc[38:0]),
    .io_s1_paddr                    (s1_ppc),
    .io_s1_kill                     (_tlb_io_resp_miss | f1_clear),
    .io_s2_kill                     (s2_xcpt),
    .io_resp_valid                  (_icache_io_resp_valid),
    .io_resp_bits_data              (_icache_io_resp_bits_data),
    .io_invalidate                  (io_cpu_flush_icache)
  );
  BranchPredictor bpd (
    .clock                                         (clock),
    .reset                                         (reset),
    .io_f0_req_valid                               (s0_valid),
    .io_f0_req_bits_pc                             (s0_vpc),
    .io_f0_req_bits_ghist_old_history              (_GEN_169 ? (_GEN_166 ? (_GEN_29 ? s2_ghist_old_history : _GEN_33 ? f2_predicted_ghist_old_history : _GEN_14 ? (f1_predicted_ghist_ignore_second_bank ? _f1_predicted_ghist_new_history_old_history_T_4 : _f1_predicted_ghist_new_history_old_history_T_25) : 64'h0) : f3_predicted_ghist_old_history) : io_cpu_redirect_ghist_old_history),
    .io_f0_req_bits_ghist_new_saw_branch_not_taken (_GEN_169 ? (_GEN_166 ? (_GEN_29 ? s2_ghist_new_saw_branch_not_taken : _GEN_33 ? f2_predicted_ghist_new_saw_branch_not_taken : _GEN_15) : f3_predicted_ghist_new_saw_branch_not_taken) : io_cpu_redirect_ghist_new_saw_branch_not_taken),
    .io_f0_req_bits_ghist_new_saw_branch_taken     (_GEN_169 ? (_GEN_166 ? (_GEN_29 ? s2_ghist_new_saw_branch_taken : _GEN_33 ? f2_predicted_ghist_new_saw_branch_taken : _GEN_16) : f3_predicted_ghist_new_saw_branch_taken) : io_cpu_redirect_ghist_new_saw_branch_taken),
    .io_resp_f1_preds_0_taken                      (_bpd_io_resp_f1_preds_0_taken),
    .io_resp_f1_preds_0_is_br                      (_bpd_io_resp_f1_preds_0_is_br),
    .io_resp_f1_preds_0_is_jal                     (_bpd_io_resp_f1_preds_0_is_jal),
    .io_resp_f1_preds_0_predicted_pc_valid         (_bpd_io_resp_f1_preds_0_predicted_pc_valid),
    .io_resp_f1_preds_0_predicted_pc_bits          (_bpd_io_resp_f1_preds_0_predicted_pc_bits),
    .io_resp_f1_preds_1_taken                      (_bpd_io_resp_f1_preds_1_taken),
    .io_resp_f1_preds_1_is_br                      (_bpd_io_resp_f1_preds_1_is_br),
    .io_resp_f1_preds_1_is_jal                     (_bpd_io_resp_f1_preds_1_is_jal),
    .io_resp_f1_preds_1_predicted_pc_valid         (_bpd_io_resp_f1_preds_1_predicted_pc_valid),
    .io_resp_f1_preds_1_predicted_pc_bits          (_bpd_io_resp_f1_preds_1_predicted_pc_bits),
    .io_resp_f1_preds_2_taken                      (_bpd_io_resp_f1_preds_2_taken),
    .io_resp_f1_preds_2_is_br                      (_bpd_io_resp_f1_preds_2_is_br),
    .io_resp_f1_preds_2_is_jal                     (_bpd_io_resp_f1_preds_2_is_jal),
    .io_resp_f1_preds_2_predicted_pc_valid         (_bpd_io_resp_f1_preds_2_predicted_pc_valid),
    .io_resp_f1_preds_2_predicted_pc_bits          (_bpd_io_resp_f1_preds_2_predicted_pc_bits),
    .io_resp_f1_preds_3_taken                      (_bpd_io_resp_f1_preds_3_taken),
    .io_resp_f1_preds_3_is_br                      (_bpd_io_resp_f1_preds_3_is_br),
    .io_resp_f1_preds_3_is_jal                     (_bpd_io_resp_f1_preds_3_is_jal),
    .io_resp_f1_preds_3_predicted_pc_valid         (_bpd_io_resp_f1_preds_3_predicted_pc_valid),
    .io_resp_f1_preds_3_predicted_pc_bits          (_bpd_io_resp_f1_preds_3_predicted_pc_bits),
    .io_resp_f1_preds_4_taken                      (_bpd_io_resp_f1_preds_4_taken),
    .io_resp_f1_preds_4_is_br                      (_bpd_io_resp_f1_preds_4_is_br),
    .io_resp_f1_preds_4_is_jal                     (_bpd_io_resp_f1_preds_4_is_jal),
    .io_resp_f1_preds_4_predicted_pc_valid         (_bpd_io_resp_f1_preds_4_predicted_pc_valid),
    .io_resp_f1_preds_4_predicted_pc_bits          (_bpd_io_resp_f1_preds_4_predicted_pc_bits),
    .io_resp_f1_preds_5_taken                      (_bpd_io_resp_f1_preds_5_taken),
    .io_resp_f1_preds_5_is_br                      (_bpd_io_resp_f1_preds_5_is_br),
    .io_resp_f1_preds_5_is_jal                     (_bpd_io_resp_f1_preds_5_is_jal),
    .io_resp_f1_preds_5_predicted_pc_valid         (_bpd_io_resp_f1_preds_5_predicted_pc_valid),
    .io_resp_f1_preds_5_predicted_pc_bits          (_bpd_io_resp_f1_preds_5_predicted_pc_bits),
    .io_resp_f1_preds_6_taken                      (_bpd_io_resp_f1_preds_6_taken),
    .io_resp_f1_preds_6_is_br                      (_bpd_io_resp_f1_preds_6_is_br),
    .io_resp_f1_preds_6_is_jal                     (_bpd_io_resp_f1_preds_6_is_jal),
    .io_resp_f1_preds_6_predicted_pc_valid         (_bpd_io_resp_f1_preds_6_predicted_pc_valid),
    .io_resp_f1_preds_6_predicted_pc_bits          (_bpd_io_resp_f1_preds_6_predicted_pc_bits),
    .io_resp_f1_preds_7_taken                      (_bpd_io_resp_f1_preds_7_taken),
    .io_resp_f1_preds_7_is_br                      (_bpd_io_resp_f1_preds_7_is_br),
    .io_resp_f1_preds_7_is_jal                     (_bpd_io_resp_f1_preds_7_is_jal),
    .io_resp_f1_preds_7_predicted_pc_valid         (_bpd_io_resp_f1_preds_7_predicted_pc_valid),
    .io_resp_f1_preds_7_predicted_pc_bits          (_bpd_io_resp_f1_preds_7_predicted_pc_bits),
    .io_resp_f2_preds_0_taken                      (_bpd_io_resp_f2_preds_0_taken),
    .io_resp_f2_preds_0_is_br                      (_bpd_io_resp_f2_preds_0_is_br),
    .io_resp_f2_preds_0_is_jal                     (_bpd_io_resp_f2_preds_0_is_jal),
    .io_resp_f2_preds_0_predicted_pc_valid         (_bpd_io_resp_f2_preds_0_predicted_pc_valid),
    .io_resp_f2_preds_0_predicted_pc_bits          (_bpd_io_resp_f2_preds_0_predicted_pc_bits),
    .io_resp_f2_preds_1_taken                      (_bpd_io_resp_f2_preds_1_taken),
    .io_resp_f2_preds_1_is_br                      (_bpd_io_resp_f2_preds_1_is_br),
    .io_resp_f2_preds_1_is_jal                     (_bpd_io_resp_f2_preds_1_is_jal),
    .io_resp_f2_preds_1_predicted_pc_valid         (_bpd_io_resp_f2_preds_1_predicted_pc_valid),
    .io_resp_f2_preds_1_predicted_pc_bits          (_bpd_io_resp_f2_preds_1_predicted_pc_bits),
    .io_resp_f2_preds_2_taken                      (_bpd_io_resp_f2_preds_2_taken),
    .io_resp_f2_preds_2_is_br                      (_bpd_io_resp_f2_preds_2_is_br),
    .io_resp_f2_preds_2_is_jal                     (_bpd_io_resp_f2_preds_2_is_jal),
    .io_resp_f2_preds_2_predicted_pc_valid         (_bpd_io_resp_f2_preds_2_predicted_pc_valid),
    .io_resp_f2_preds_2_predicted_pc_bits          (_bpd_io_resp_f2_preds_2_predicted_pc_bits),
    .io_resp_f2_preds_3_taken                      (_bpd_io_resp_f2_preds_3_taken),
    .io_resp_f2_preds_3_is_br                      (_bpd_io_resp_f2_preds_3_is_br),
    .io_resp_f2_preds_3_is_jal                     (_bpd_io_resp_f2_preds_3_is_jal),
    .io_resp_f2_preds_3_predicted_pc_valid         (_bpd_io_resp_f2_preds_3_predicted_pc_valid),
    .io_resp_f2_preds_3_predicted_pc_bits          (_bpd_io_resp_f2_preds_3_predicted_pc_bits),
    .io_resp_f2_preds_4_taken                      (_bpd_io_resp_f2_preds_4_taken),
    .io_resp_f2_preds_4_is_br                      (_bpd_io_resp_f2_preds_4_is_br),
    .io_resp_f2_preds_4_is_jal                     (_bpd_io_resp_f2_preds_4_is_jal),
    .io_resp_f2_preds_4_predicted_pc_valid         (_bpd_io_resp_f2_preds_4_predicted_pc_valid),
    .io_resp_f2_preds_4_predicted_pc_bits          (_bpd_io_resp_f2_preds_4_predicted_pc_bits),
    .io_resp_f2_preds_5_taken                      (_bpd_io_resp_f2_preds_5_taken),
    .io_resp_f2_preds_5_is_br                      (_bpd_io_resp_f2_preds_5_is_br),
    .io_resp_f2_preds_5_is_jal                     (_bpd_io_resp_f2_preds_5_is_jal),
    .io_resp_f2_preds_5_predicted_pc_valid         (_bpd_io_resp_f2_preds_5_predicted_pc_valid),
    .io_resp_f2_preds_5_predicted_pc_bits          (_bpd_io_resp_f2_preds_5_predicted_pc_bits),
    .io_resp_f2_preds_6_taken                      (_bpd_io_resp_f2_preds_6_taken),
    .io_resp_f2_preds_6_is_br                      (_bpd_io_resp_f2_preds_6_is_br),
    .io_resp_f2_preds_6_is_jal                     (_bpd_io_resp_f2_preds_6_is_jal),
    .io_resp_f2_preds_6_predicted_pc_valid         (_bpd_io_resp_f2_preds_6_predicted_pc_valid),
    .io_resp_f2_preds_6_predicted_pc_bits          (_bpd_io_resp_f2_preds_6_predicted_pc_bits),
    .io_resp_f2_preds_7_taken                      (_bpd_io_resp_f2_preds_7_taken),
    .io_resp_f2_preds_7_is_br                      (_bpd_io_resp_f2_preds_7_is_br),
    .io_resp_f2_preds_7_is_jal                     (_bpd_io_resp_f2_preds_7_is_jal),
    .io_resp_f2_preds_7_predicted_pc_valid         (_bpd_io_resp_f2_preds_7_predicted_pc_valid),
    .io_resp_f2_preds_7_predicted_pc_bits          (_bpd_io_resp_f2_preds_7_predicted_pc_bits),
    .io_resp_f3_pc                                 (_bpd_io_resp_f3_pc),
    .io_resp_f3_preds_0_taken                      (_bpd_io_resp_f3_preds_0_taken),
    .io_resp_f3_preds_0_is_br                      (_bpd_io_resp_f3_preds_0_is_br),
    .io_resp_f3_preds_0_is_jal                     (_bpd_io_resp_f3_preds_0_is_jal),
    .io_resp_f3_preds_0_predicted_pc_valid         (_bpd_io_resp_f3_preds_0_predicted_pc_valid),
    .io_resp_f3_preds_0_predicted_pc_bits          (_bpd_io_resp_f3_preds_0_predicted_pc_bits),
    .io_resp_f3_preds_1_taken                      (_bpd_io_resp_f3_preds_1_taken),
    .io_resp_f3_preds_1_is_br                      (_bpd_io_resp_f3_preds_1_is_br),
    .io_resp_f3_preds_1_is_jal                     (_bpd_io_resp_f3_preds_1_is_jal),
    .io_resp_f3_preds_1_predicted_pc_valid         (_bpd_io_resp_f3_preds_1_predicted_pc_valid),
    .io_resp_f3_preds_1_predicted_pc_bits          (_bpd_io_resp_f3_preds_1_predicted_pc_bits),
    .io_resp_f3_preds_2_taken                      (_bpd_io_resp_f3_preds_2_taken),
    .io_resp_f3_preds_2_is_br                      (_bpd_io_resp_f3_preds_2_is_br),
    .io_resp_f3_preds_2_is_jal                     (_bpd_io_resp_f3_preds_2_is_jal),
    .io_resp_f3_preds_2_predicted_pc_valid         (_bpd_io_resp_f3_preds_2_predicted_pc_valid),
    .io_resp_f3_preds_2_predicted_pc_bits          (_bpd_io_resp_f3_preds_2_predicted_pc_bits),
    .io_resp_f3_preds_3_taken                      (_bpd_io_resp_f3_preds_3_taken),
    .io_resp_f3_preds_3_is_br                      (_bpd_io_resp_f3_preds_3_is_br),
    .io_resp_f3_preds_3_is_jal                     (_bpd_io_resp_f3_preds_3_is_jal),
    .io_resp_f3_preds_3_predicted_pc_valid         (_bpd_io_resp_f3_preds_3_predicted_pc_valid),
    .io_resp_f3_preds_3_predicted_pc_bits          (_bpd_io_resp_f3_preds_3_predicted_pc_bits),
    .io_resp_f3_preds_4_taken                      (_bpd_io_resp_f3_preds_4_taken),
    .io_resp_f3_preds_4_is_br                      (_bpd_io_resp_f3_preds_4_is_br),
    .io_resp_f3_preds_4_is_jal                     (_bpd_io_resp_f3_preds_4_is_jal),
    .io_resp_f3_preds_4_predicted_pc_valid         (_bpd_io_resp_f3_preds_4_predicted_pc_valid),
    .io_resp_f3_preds_4_predicted_pc_bits          (_bpd_io_resp_f3_preds_4_predicted_pc_bits),
    .io_resp_f3_preds_5_taken                      (_bpd_io_resp_f3_preds_5_taken),
    .io_resp_f3_preds_5_is_br                      (_bpd_io_resp_f3_preds_5_is_br),
    .io_resp_f3_preds_5_is_jal                     (_bpd_io_resp_f3_preds_5_is_jal),
    .io_resp_f3_preds_5_predicted_pc_valid         (_bpd_io_resp_f3_preds_5_predicted_pc_valid),
    .io_resp_f3_preds_5_predicted_pc_bits          (_bpd_io_resp_f3_preds_5_predicted_pc_bits),
    .io_resp_f3_preds_6_taken                      (_bpd_io_resp_f3_preds_6_taken),
    .io_resp_f3_preds_6_is_br                      (_bpd_io_resp_f3_preds_6_is_br),
    .io_resp_f3_preds_6_is_jal                     (_bpd_io_resp_f3_preds_6_is_jal),
    .io_resp_f3_preds_6_predicted_pc_valid         (_bpd_io_resp_f3_preds_6_predicted_pc_valid),
    .io_resp_f3_preds_6_predicted_pc_bits          (_bpd_io_resp_f3_preds_6_predicted_pc_bits),
    .io_resp_f3_preds_7_taken                      (_bpd_io_resp_f3_preds_7_taken),
    .io_resp_f3_preds_7_is_br                      (_bpd_io_resp_f3_preds_7_is_br),
    .io_resp_f3_preds_7_is_jal                     (_bpd_io_resp_f3_preds_7_is_jal),
    .io_resp_f3_preds_7_predicted_pc_valid         (_bpd_io_resp_f3_preds_7_predicted_pc_valid),
    .io_resp_f3_preds_7_predicted_pc_bits          (_bpd_io_resp_f3_preds_7_predicted_pc_bits),
    .io_resp_f3_meta_0                             (_bpd_io_resp_f3_meta_0),
    .io_resp_f3_meta_1                             (_bpd_io_resp_f3_meta_1),
    .io_f3_fire                                    (_f3_bpd_resp_io_enq_ready & _f3_bpd_resp_io_enq_valid_T),
    .io_update_valid                               (_bpd_update_arbiter_io_out_valid),
    .io_update_bits_is_mispredict_update           (_bpd_update_arbiter_io_out_bits_is_mispredict_update),
    .io_update_bits_is_repair_update               (_bpd_update_arbiter_io_out_bits_is_repair_update),
    .io_update_bits_btb_mispredicts                (_bpd_update_arbiter_io_out_bits_btb_mispredicts),
    .io_update_bits_pc                             (_bpd_update_arbiter_io_out_bits_pc),
    .io_update_bits_br_mask                        (_bpd_update_arbiter_io_out_bits_br_mask),
    .io_update_bits_cfi_idx_valid                  (_bpd_update_arbiter_io_out_bits_cfi_idx_valid),
    .io_update_bits_cfi_idx_bits                   (_bpd_update_arbiter_io_out_bits_cfi_idx_bits),
    .io_update_bits_cfi_taken                      (_bpd_update_arbiter_io_out_bits_cfi_taken),
    .io_update_bits_cfi_mispredicted               (_bpd_update_arbiter_io_out_bits_cfi_mispredicted),
    .io_update_bits_cfi_is_br                      (_bpd_update_arbiter_io_out_bits_cfi_is_br),
    .io_update_bits_cfi_is_jal                     (_bpd_update_arbiter_io_out_bits_cfi_is_jal),
    .io_update_bits_ghist_old_history              (_bpd_update_arbiter_io_out_bits_ghist_old_history),
    .io_update_bits_ghist_new_saw_branch_not_taken (_bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_not_taken),
    .io_update_bits_ghist_new_saw_branch_taken     (_bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_taken),
    .io_update_bits_target                         (_bpd_update_arbiter_io_out_bits_target),
    .io_update_bits_meta_0                         (_bpd_update_arbiter_io_out_bits_meta_0),
    .io_update_bits_meta_1                         (_bpd_update_arbiter_io_out_bits_meta_1)
  );
  BoomRAS ras (
    .clock          (clock),
    .io_read_idx    (_GEN_35 ? _GEN : ras_read_idx),
    .io_read_addr   (_ras_io_read_addr),
    .io_write_valid (_ftq_io_ras_update | _GEN_159 & casez_tmp_6 & f3_fetch_bundle_cfi_idx_valid),
    .io_write_idx   (_ftq_io_ras_update ? _ftq_io_ras_update_idx : _ras_io_write_idx_T),
    .io_write_addr  (_ftq_io_ras_update ? _ftq_io_ras_update_pc : _GEN_36 + {36'h0, f3_fetch_bundle_cfi_idx_bits, 1'h0} + {37'h0, casez_tmp_8 ? 3'h4 : 3'h2})
  );
  TLB tlb (
    .clock                         (clock),
    .reset                         (reset),
    .io_req_valid                  (s1_valid & ~s1_is_replay & ~f1_clear | s1_is_sfence),
    .io_req_bits_vaddr             (s1_vpc),
    .io_req_bits_prv               (io_ptw_status_prv),
    .io_resp_miss                  (_tlb_io_resp_miss),
    .io_resp_paddr                 (_tlb_io_resp_paddr),
    .io_resp_pf_inst               (_tlb_io_resp_pf_inst),
    .io_resp_ae_inst               (_tlb_io_resp_ae_inst),
    .io_sfence_valid               (tlb_io_sfence_REG_valid),
    .io_sfence_bits_rs1            (tlb_io_sfence_REG_bits_rs1),
    .io_sfence_bits_rs2            (tlb_io_sfence_REG_bits_rs2),
    .io_sfence_bits_addr           (tlb_io_sfence_REG_bits_addr),
    .io_ptw_req_ready              (io_ptw_req_ready),
    .io_ptw_req_valid              (io_ptw_req_valid),
    .io_ptw_req_bits_bits_addr     (io_ptw_req_bits_bits_addr),
    .io_ptw_req_bits_bits_need_gpa (io_ptw_req_bits_bits_need_gpa),
    .io_ptw_resp_valid             (io_ptw_resp_valid),
    .io_ptw_resp_bits_ae_ptw       (io_ptw_resp_bits_ae_ptw),
    .io_ptw_resp_bits_ae_final     (io_ptw_resp_bits_ae_final),
    .io_ptw_resp_bits_pf           (io_ptw_resp_bits_pf),
    .io_ptw_resp_bits_gf           (io_ptw_resp_bits_gf),
    .io_ptw_resp_bits_hr           (io_ptw_resp_bits_hr),
    .io_ptw_resp_bits_hw           (io_ptw_resp_bits_hw),
    .io_ptw_resp_bits_hx           (io_ptw_resp_bits_hx),
    .io_ptw_resp_bits_pte_ppn      (io_ptw_resp_bits_pte_ppn),
    .io_ptw_resp_bits_pte_d        (io_ptw_resp_bits_pte_d),
    .io_ptw_resp_bits_pte_a        (io_ptw_resp_bits_pte_a),
    .io_ptw_resp_bits_pte_g        (io_ptw_resp_bits_pte_g),
    .io_ptw_resp_bits_pte_u        (io_ptw_resp_bits_pte_u),
    .io_ptw_resp_bits_pte_x        (io_ptw_resp_bits_pte_x),
    .io_ptw_resp_bits_pte_w        (io_ptw_resp_bits_pte_w),
    .io_ptw_resp_bits_pte_r        (io_ptw_resp_bits_pte_r),
    .io_ptw_resp_bits_pte_v        (io_ptw_resp_bits_pte_v),
    .io_ptw_resp_bits_level        (io_ptw_resp_bits_level),
    .io_ptw_resp_bits_homogeneous  (io_ptw_resp_bits_homogeneous),
    .io_ptw_ptbr_mode              (io_ptw_ptbr_mode),
    .io_ptw_status_debug           (io_ptw_status_debug),
    .io_ptw_pmp_0_cfg_l            (io_ptw_pmp_0_cfg_l),
    .io_ptw_pmp_0_cfg_a            (io_ptw_pmp_0_cfg_a),
    .io_ptw_pmp_0_cfg_x            (io_ptw_pmp_0_cfg_x),
    .io_ptw_pmp_0_cfg_w            (io_ptw_pmp_0_cfg_w),
    .io_ptw_pmp_0_cfg_r            (io_ptw_pmp_0_cfg_r),
    .io_ptw_pmp_0_addr             (io_ptw_pmp_0_addr),
    .io_ptw_pmp_0_mask             (io_ptw_pmp_0_mask),
    .io_ptw_pmp_1_cfg_l            (io_ptw_pmp_1_cfg_l),
    .io_ptw_pmp_1_cfg_a            (io_ptw_pmp_1_cfg_a),
    .io_ptw_pmp_1_cfg_x            (io_ptw_pmp_1_cfg_x),
    .io_ptw_pmp_1_cfg_w            (io_ptw_pmp_1_cfg_w),
    .io_ptw_pmp_1_cfg_r            (io_ptw_pmp_1_cfg_r),
    .io_ptw_pmp_1_addr             (io_ptw_pmp_1_addr),
    .io_ptw_pmp_1_mask             (io_ptw_pmp_1_mask),
    .io_ptw_pmp_2_cfg_l            (io_ptw_pmp_2_cfg_l),
    .io_ptw_pmp_2_cfg_a            (io_ptw_pmp_2_cfg_a),
    .io_ptw_pmp_2_cfg_x            (io_ptw_pmp_2_cfg_x),
    .io_ptw_pmp_2_cfg_w            (io_ptw_pmp_2_cfg_w),
    .io_ptw_pmp_2_cfg_r            (io_ptw_pmp_2_cfg_r),
    .io_ptw_pmp_2_addr             (io_ptw_pmp_2_addr),
    .io_ptw_pmp_2_mask             (io_ptw_pmp_2_mask),
    .io_ptw_pmp_3_cfg_l            (io_ptw_pmp_3_cfg_l),
    .io_ptw_pmp_3_cfg_a            (io_ptw_pmp_3_cfg_a),
    .io_ptw_pmp_3_cfg_x            (io_ptw_pmp_3_cfg_x),
    .io_ptw_pmp_3_cfg_w            (io_ptw_pmp_3_cfg_w),
    .io_ptw_pmp_3_cfg_r            (io_ptw_pmp_3_cfg_r),
    .io_ptw_pmp_3_addr             (io_ptw_pmp_3_addr),
    .io_ptw_pmp_3_mask             (io_ptw_pmp_3_mask),
    .io_ptw_pmp_4_cfg_l            (io_ptw_pmp_4_cfg_l),
    .io_ptw_pmp_4_cfg_a            (io_ptw_pmp_4_cfg_a),
    .io_ptw_pmp_4_cfg_x            (io_ptw_pmp_4_cfg_x),
    .io_ptw_pmp_4_cfg_w            (io_ptw_pmp_4_cfg_w),
    .io_ptw_pmp_4_cfg_r            (io_ptw_pmp_4_cfg_r),
    .io_ptw_pmp_4_addr             (io_ptw_pmp_4_addr),
    .io_ptw_pmp_4_mask             (io_ptw_pmp_4_mask),
    .io_ptw_pmp_5_cfg_l            (io_ptw_pmp_5_cfg_l),
    .io_ptw_pmp_5_cfg_a            (io_ptw_pmp_5_cfg_a),
    .io_ptw_pmp_5_cfg_x            (io_ptw_pmp_5_cfg_x),
    .io_ptw_pmp_5_cfg_w            (io_ptw_pmp_5_cfg_w),
    .io_ptw_pmp_5_cfg_r            (io_ptw_pmp_5_cfg_r),
    .io_ptw_pmp_5_addr             (io_ptw_pmp_5_addr),
    .io_ptw_pmp_5_mask             (io_ptw_pmp_5_mask),
    .io_ptw_pmp_6_cfg_l            (io_ptw_pmp_6_cfg_l),
    .io_ptw_pmp_6_cfg_a            (io_ptw_pmp_6_cfg_a),
    .io_ptw_pmp_6_cfg_x            (io_ptw_pmp_6_cfg_x),
    .io_ptw_pmp_6_cfg_w            (io_ptw_pmp_6_cfg_w),
    .io_ptw_pmp_6_cfg_r            (io_ptw_pmp_6_cfg_r),
    .io_ptw_pmp_6_addr             (io_ptw_pmp_6_addr),
    .io_ptw_pmp_6_mask             (io_ptw_pmp_6_mask),
    .io_ptw_pmp_7_cfg_l            (io_ptw_pmp_7_cfg_l),
    .io_ptw_pmp_7_cfg_a            (io_ptw_pmp_7_cfg_a),
    .io_ptw_pmp_7_cfg_x            (io_ptw_pmp_7_cfg_x),
    .io_ptw_pmp_7_cfg_w            (io_ptw_pmp_7_cfg_w),
    .io_ptw_pmp_7_cfg_r            (io_ptw_pmp_7_cfg_r),
    .io_ptw_pmp_7_addr             (io_ptw_pmp_7_addr),
    .io_ptw_pmp_7_mask             (io_ptw_pmp_7_mask)
  );
  Queue_32 f3 (
    .clock                                          (clock),
    .reset                                          (_GEN_34),
    .io_enq_ready                                   (_f3_io_enq_ready),
    .io_enq_valid                                   (_f3_io_enq_valid_T_6),
    .io_enq_bits_pc                                 (s2_vpc),
    .io_enq_bits_data                               (s2_xcpt ? 128'h0 : _icache_io_resp_bits_data),
    .io_enq_bits_mask                               (_f3_io_enq_bits_mask_T[7:0] & ((&(s2_vpc[5:3])) ? 8'hF : 8'hFF)),
    .io_enq_bits_xcpt_pf_inst                       (s2_tlb_resp_pf_inst),
    .io_enq_bits_xcpt_gf_inst                       (s2_tlb_resp_gf_inst),
    .io_enq_bits_xcpt_ae_inst                       (s2_tlb_resp_ae_inst),
    .io_enq_bits_ghist_old_history                  (_GEN_161 ? f3_predicted_ghist_old_history : s2_ghist_old_history),
    .io_enq_bits_ghist_current_saw_branch_not_taken (~_GEN_161 & s2_ghist_current_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_not_taken     (_GEN_161 ? f3_predicted_ghist_new_saw_branch_not_taken : s2_ghist_new_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_taken         (_GEN_161 ? f3_predicted_ghist_new_saw_branch_taken : s2_ghist_new_saw_branch_taken),
    .io_enq_bits_ghist_ras_idx                      (_GEN),
    .io_enq_bits_fsrc                               (_GEN_29 ? 2'h0 : {1'h0, _GEN_33}),
    .io_enq_bits_tsrc                               (s2_tsrc),
    .io_deq_ready                                   (_f4_io_enq_ready),
    .io_deq_valid                                   (_f3_io_deq_valid),
    .io_deq_bits_pc                                 (_f3_io_deq_bits_pc),
    .io_deq_bits_data                               (_f3_io_deq_bits_data),
    .io_deq_bits_mask                               (_f3_io_deq_bits_mask),
    .io_deq_bits_xcpt_pf_inst                       (_f3_io_deq_bits_xcpt_pf_inst),
    .io_deq_bits_xcpt_ae_inst                       (_f3_io_deq_bits_xcpt_ae_inst),
    .io_deq_bits_ghist_old_history                  (_f3_io_deq_bits_ghist_old_history),
    .io_deq_bits_ghist_current_saw_branch_not_taken (_f3_io_deq_bits_ghist_current_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_not_taken     (_f3_io_deq_bits_ghist_new_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_taken         (_f3_io_deq_bits_ghist_new_saw_branch_taken),
    .io_deq_bits_ghist_ras_idx                      (_f3_io_deq_bits_ghist_ras_idx),
    .io_deq_bits_fsrc                               (_f3_io_deq_bits_fsrc),
    .io_deq_bits_tsrc                               (_f3_io_deq_bits_tsrc)
  );
  Queue_33 f3_bpd_resp (
    .clock                                  (clock),
    .reset                                  (_GEN_34),
    .io_enq_ready                           (_f3_bpd_resp_io_enq_ready),
    .io_enq_valid                           (_f3_bpd_resp_io_enq_valid_T),
    .io_enq_bits_pc                         (_bpd_io_resp_f3_pc),
    .io_enq_bits_preds_0_taken              (_bpd_io_resp_f3_preds_0_taken),
    .io_enq_bits_preds_0_is_br              (_bpd_io_resp_f3_preds_0_is_br),
    .io_enq_bits_preds_0_is_jal             (_bpd_io_resp_f3_preds_0_is_jal),
    .io_enq_bits_preds_0_predicted_pc_valid (_bpd_io_resp_f3_preds_0_predicted_pc_valid),
    .io_enq_bits_preds_0_predicted_pc_bits  (_bpd_io_resp_f3_preds_0_predicted_pc_bits),
    .io_enq_bits_preds_1_taken              (_bpd_io_resp_f3_preds_1_taken),
    .io_enq_bits_preds_1_is_br              (_bpd_io_resp_f3_preds_1_is_br),
    .io_enq_bits_preds_1_is_jal             (_bpd_io_resp_f3_preds_1_is_jal),
    .io_enq_bits_preds_1_predicted_pc_valid (_bpd_io_resp_f3_preds_1_predicted_pc_valid),
    .io_enq_bits_preds_1_predicted_pc_bits  (_bpd_io_resp_f3_preds_1_predicted_pc_bits),
    .io_enq_bits_preds_2_taken              (_bpd_io_resp_f3_preds_2_taken),
    .io_enq_bits_preds_2_is_br              (_bpd_io_resp_f3_preds_2_is_br),
    .io_enq_bits_preds_2_is_jal             (_bpd_io_resp_f3_preds_2_is_jal),
    .io_enq_bits_preds_2_predicted_pc_valid (_bpd_io_resp_f3_preds_2_predicted_pc_valid),
    .io_enq_bits_preds_2_predicted_pc_bits  (_bpd_io_resp_f3_preds_2_predicted_pc_bits),
    .io_enq_bits_preds_3_taken              (_bpd_io_resp_f3_preds_3_taken),
    .io_enq_bits_preds_3_is_br              (_bpd_io_resp_f3_preds_3_is_br),
    .io_enq_bits_preds_3_is_jal             (_bpd_io_resp_f3_preds_3_is_jal),
    .io_enq_bits_preds_3_predicted_pc_valid (_bpd_io_resp_f3_preds_3_predicted_pc_valid),
    .io_enq_bits_preds_3_predicted_pc_bits  (_bpd_io_resp_f3_preds_3_predicted_pc_bits),
    .io_enq_bits_preds_4_taken              (_bpd_io_resp_f3_preds_4_taken),
    .io_enq_bits_preds_4_is_br              (_bpd_io_resp_f3_preds_4_is_br),
    .io_enq_bits_preds_4_is_jal             (_bpd_io_resp_f3_preds_4_is_jal),
    .io_enq_bits_preds_4_predicted_pc_valid (_bpd_io_resp_f3_preds_4_predicted_pc_valid),
    .io_enq_bits_preds_4_predicted_pc_bits  (_bpd_io_resp_f3_preds_4_predicted_pc_bits),
    .io_enq_bits_preds_5_taken              (_bpd_io_resp_f3_preds_5_taken),
    .io_enq_bits_preds_5_is_br              (_bpd_io_resp_f3_preds_5_is_br),
    .io_enq_bits_preds_5_is_jal             (_bpd_io_resp_f3_preds_5_is_jal),
    .io_enq_bits_preds_5_predicted_pc_valid (_bpd_io_resp_f3_preds_5_predicted_pc_valid),
    .io_enq_bits_preds_5_predicted_pc_bits  (_bpd_io_resp_f3_preds_5_predicted_pc_bits),
    .io_enq_bits_preds_6_taken              (_bpd_io_resp_f3_preds_6_taken),
    .io_enq_bits_preds_6_is_br              (_bpd_io_resp_f3_preds_6_is_br),
    .io_enq_bits_preds_6_is_jal             (_bpd_io_resp_f3_preds_6_is_jal),
    .io_enq_bits_preds_6_predicted_pc_valid (_bpd_io_resp_f3_preds_6_predicted_pc_valid),
    .io_enq_bits_preds_6_predicted_pc_bits  (_bpd_io_resp_f3_preds_6_predicted_pc_bits),
    .io_enq_bits_preds_7_taken              (_bpd_io_resp_f3_preds_7_taken),
    .io_enq_bits_preds_7_is_br              (_bpd_io_resp_f3_preds_7_is_br),
    .io_enq_bits_preds_7_is_jal             (_bpd_io_resp_f3_preds_7_is_jal),
    .io_enq_bits_preds_7_predicted_pc_valid (_bpd_io_resp_f3_preds_7_predicted_pc_valid),
    .io_enq_bits_preds_7_predicted_pc_bits  (_bpd_io_resp_f3_preds_7_predicted_pc_bits),
    .io_enq_bits_meta_0                     (_bpd_io_resp_f3_meta_0),
    .io_enq_bits_meta_1                     (_bpd_io_resp_f3_meta_1),
    .io_deq_ready                           (_f4_io_enq_ready),
    .io_deq_bits_pc                         (_f3_bpd_resp_io_deq_bits_pc),
    .io_deq_bits_preds_0_taken              (_f3_bpd_resp_io_deq_bits_preds_0_taken),
    .io_deq_bits_preds_0_predicted_pc_valid (_f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_valid),
    .io_deq_bits_preds_0_predicted_pc_bits  (_f3_bpd_resp_io_deq_bits_preds_0_predicted_pc_bits),
    .io_deq_bits_preds_1_taken              (_f3_bpd_resp_io_deq_bits_preds_1_taken),
    .io_deq_bits_preds_1_predicted_pc_valid (_f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_valid),
    .io_deq_bits_preds_1_predicted_pc_bits  (_f3_bpd_resp_io_deq_bits_preds_1_predicted_pc_bits),
    .io_deq_bits_preds_2_taken              (_f3_bpd_resp_io_deq_bits_preds_2_taken),
    .io_deq_bits_preds_2_predicted_pc_valid (_f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_valid),
    .io_deq_bits_preds_2_predicted_pc_bits  (_f3_bpd_resp_io_deq_bits_preds_2_predicted_pc_bits),
    .io_deq_bits_preds_3_taken              (_f3_bpd_resp_io_deq_bits_preds_3_taken),
    .io_deq_bits_preds_3_predicted_pc_valid (_f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_valid),
    .io_deq_bits_preds_3_predicted_pc_bits  (_f3_bpd_resp_io_deq_bits_preds_3_predicted_pc_bits),
    .io_deq_bits_preds_4_taken              (_f3_bpd_resp_io_deq_bits_preds_4_taken),
    .io_deq_bits_preds_4_predicted_pc_valid (_f3_bpd_resp_io_deq_bits_preds_4_predicted_pc_valid),
    .io_deq_bits_preds_4_predicted_pc_bits  (_f3_bpd_resp_io_deq_bits_preds_4_predicted_pc_bits),
    .io_deq_bits_preds_5_taken              (_f3_bpd_resp_io_deq_bits_preds_5_taken),
    .io_deq_bits_preds_5_predicted_pc_valid (_f3_bpd_resp_io_deq_bits_preds_5_predicted_pc_valid),
    .io_deq_bits_preds_5_predicted_pc_bits  (_f3_bpd_resp_io_deq_bits_preds_5_predicted_pc_bits),
    .io_deq_bits_preds_6_taken              (_f3_bpd_resp_io_deq_bits_preds_6_taken),
    .io_deq_bits_preds_6_predicted_pc_valid (_f3_bpd_resp_io_deq_bits_preds_6_predicted_pc_valid),
    .io_deq_bits_preds_6_predicted_pc_bits  (_f3_bpd_resp_io_deq_bits_preds_6_predicted_pc_bits),
    .io_deq_bits_preds_7_taken              (_f3_bpd_resp_io_deq_bits_preds_7_taken),
    .io_deq_bits_preds_7_predicted_pc_valid (_f3_bpd_resp_io_deq_bits_preds_7_predicted_pc_valid),
    .io_deq_bits_preds_7_predicted_pc_bits  (_f3_bpd_resp_io_deq_bits_preds_7_predicted_pc_bits),
    .io_deq_bits_meta_0                     (_f3_bpd_resp_io_deq_bits_meta_0),
    .io_deq_bits_meta_1                     (_f3_bpd_resp_io_deq_bits_meta_1),
    .io_deq_bits_lhist_0                    (_f3_bpd_resp_io_deq_bits_lhist_0),
    .io_deq_bits_lhist_1                    (_f3_bpd_resp_io_deq_bits_lhist_1)
  );
  RVCExpander exp_inst0_rvc_exp (
    .io_in       (inst0),
    .io_out_bits (_exp_inst0_rvc_exp_io_out_bits),
    .io_rvc      (_exp_inst0_rvc_exp_io_rvc)
  );
  RVCExpander exp_inst1_rvc_exp (
    .io_in       (_f3_io_deq_bits_data[31:0]),
    .io_out_bits (_exp_inst1_rvc_exp_io_out_bits),
    .io_rvc      (_exp_inst1_rvc_exp_io_rvc)
  );
  BranchDecode bpd_decoder0 (
    .io_inst                 (exp_inst0),
    .io_pc                   (_GEN_36 - 40'h2),
    .io_out_is_ret           (_bpd_decoder0_io_out_is_ret),
    .io_out_is_call          (_bpd_decoder0_io_out_is_call),
    .io_out_target           (_bpd_decoder0_io_out_target),
    .io_out_cfi_type         (_bpd_decoder0_io_out_cfi_type),
    .io_out_sfb_offset_valid (_bpd_decoder0_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits  (_bpd_decoder0_io_out_sfb_offset_bits),
    .io_out_shadowable       (_bpd_decoder0_io_out_shadowable)
  );
  BranchDecode bpd_decoder1 (
    .io_inst                 (exp_inst1),
    .io_pc                   ({_f3_io_deq_bits_pc[39:3], 3'h0}),
    .io_out_is_ret           (_bpd_decoder1_io_out_is_ret),
    .io_out_is_call          (_bpd_decoder1_io_out_is_call),
    .io_out_target           (_bpd_decoder1_io_out_target),
    .io_out_cfi_type         (_bpd_decoder1_io_out_cfi_type),
    .io_out_sfb_offset_valid (_bpd_decoder1_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits  (_bpd_decoder1_io_out_sfb_offset_bits),
    .io_out_shadowable       (_bpd_decoder1_io_out_shadowable)
  );
  RVCExpander exp_inst_rvc_exp (
    .io_in       (inst),
    .io_out_bits (_exp_inst_rvc_exp_io_out_bits),
    .io_rvc      (_exp_inst_rvc_exp_io_rvc)
  );
  BranchDecode bpd_decoder (
    .io_inst                 (f3_fetch_bundle_exp_insts_1),
    .io_pc                   (_GEN_36 + 40'h2),
    .io_out_is_ret           (_bpd_decoder_io_out_is_ret),
    .io_out_is_call          (_bpd_decoder_io_out_is_call),
    .io_out_target           (_bpd_decoder_io_out_target),
    .io_out_cfi_type         (_bpd_decoder_io_out_cfi_type),
    .io_out_sfb_offset_valid (_bpd_decoder_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits  (_bpd_decoder_io_out_sfb_offset_bits),
    .io_out_shadowable       (_bpd_decoder_io_out_shadowable)
  );
  RVCExpander exp_inst_rvc_exp_1 (
    .io_in       (inst_1),
    .io_out_bits (_exp_inst_rvc_exp_1_io_out_bits),
    .io_rvc      (_exp_inst_rvc_exp_1_io_rvc)
  );
  BranchDecode bpd_decoder_1 (
    .io_inst                 (f3_fetch_bundle_exp_insts_2),
    .io_pc                   (_GEN_36 + 40'h4),
    .io_out_is_ret           (_bpd_decoder_1_io_out_is_ret),
    .io_out_is_call          (_bpd_decoder_1_io_out_is_call),
    .io_out_target           (_bpd_decoder_1_io_out_target),
    .io_out_cfi_type         (_bpd_decoder_1_io_out_cfi_type),
    .io_out_sfb_offset_valid (_bpd_decoder_1_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits  (_bpd_decoder_1_io_out_sfb_offset_bits),
    .io_out_shadowable       (_bpd_decoder_1_io_out_shadowable)
  );
  RVCExpander exp_inst_rvc_exp_2 (
    .io_in       (inst_2),
    .io_out_bits (_exp_inst_rvc_exp_2_io_out_bits),
    .io_rvc      (_exp_inst_rvc_exp_2_io_rvc)
  );
  BranchDecode bpd_decoder_2 (
    .io_inst                 (f3_fetch_bundle_exp_insts_3),
    .io_pc                   (_GEN_36 + 40'h6),
    .io_out_is_ret           (_bpd_decoder_2_io_out_is_ret),
    .io_out_is_call          (_bpd_decoder_2_io_out_is_call),
    .io_out_target           (_bpd_decoder_2_io_out_target),
    .io_out_cfi_type         (_bpd_decoder_2_io_out_cfi_type),
    .io_out_sfb_offset_valid (_bpd_decoder_2_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits  (_bpd_decoder_2_io_out_sfb_offset_bits),
    .io_out_shadowable       (_bpd_decoder_2_io_out_shadowable)
  );
  RVCExpander exp_inst1_rvc_exp_1 (
    .io_in       (_f3_io_deq_bits_data[95:64]),
    .io_out_bits (_exp_inst1_rvc_exp_1_io_out_bits),
    .io_rvc      (_exp_inst1_rvc_exp_1_io_rvc)
  );
  BranchDecode bpd_decoder1_1 (
    .io_inst                 (exp_inst1_1),
    .io_pc                   (_GEN_36 + 40'h8),
    .io_out_is_ret           (_bpd_decoder1_1_io_out_is_ret),
    .io_out_is_call          (_bpd_decoder1_1_io_out_is_call),
    .io_out_target           (_bpd_decoder1_1_io_out_target),
    .io_out_cfi_type         (_bpd_decoder1_1_io_out_cfi_type),
    .io_out_sfb_offset_valid (_bpd_decoder1_1_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits  (_bpd_decoder1_1_io_out_sfb_offset_bits),
    .io_out_shadowable       (_bpd_decoder1_1_io_out_shadowable)
  );
  RVCExpander exp_inst0b_rvc_exp (
    .io_in       (_f3_io_deq_bits_data[79:48]),
    .io_out_bits (_exp_inst0b_rvc_exp_io_out_bits),
    .io_rvc      (_exp_inst0b_rvc_exp_io_rvc)
  );
  BranchDecode bpd_decoder0b (
    .io_inst                 (exp_inst0b),
    .io_pc                   (_GEN_36 + 40'h6),
    .io_out_is_ret           (_bpd_decoder0b_io_out_is_ret),
    .io_out_is_call          (_bpd_decoder0b_io_out_is_call),
    .io_out_target           (_bpd_decoder0b_io_out_target),
    .io_out_cfi_type         (_bpd_decoder0b_io_out_cfi_type),
    .io_out_sfb_offset_valid (_bpd_decoder0b_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits  (_bpd_decoder0b_io_out_sfb_offset_bits),
    .io_out_shadowable       (_bpd_decoder0b_io_out_shadowable)
  );
  RVCExpander exp_inst_rvc_exp_3 (
    .io_in       (inst_3),
    .io_out_bits (_exp_inst_rvc_exp_3_io_out_bits),
    .io_rvc      (_exp_inst_rvc_exp_3_io_rvc)
  );
  BranchDecode bpd_decoder_3 (
    .io_inst                 (f3_fetch_bundle_exp_insts_5),
    .io_pc                   (_GEN_36 + 40'hA),
    .io_out_is_ret           (_bpd_decoder_3_io_out_is_ret),
    .io_out_is_call          (_bpd_decoder_3_io_out_is_call),
    .io_out_target           (_bpd_decoder_3_io_out_target),
    .io_out_cfi_type         (_bpd_decoder_3_io_out_cfi_type),
    .io_out_sfb_offset_valid (_bpd_decoder_3_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits  (_bpd_decoder_3_io_out_sfb_offset_bits),
    .io_out_shadowable       (_bpd_decoder_3_io_out_shadowable)
  );
  RVCExpander exp_inst_rvc_exp_4 (
    .io_in       (inst_4),
    .io_out_bits (_exp_inst_rvc_exp_4_io_out_bits),
    .io_rvc      (_exp_inst_rvc_exp_4_io_rvc)
  );
  BranchDecode bpd_decoder_4 (
    .io_inst                 (f3_fetch_bundle_exp_insts_6),
    .io_pc                   (_GEN_36 + 40'hC),
    .io_out_is_ret           (_bpd_decoder_4_io_out_is_ret),
    .io_out_is_call          (_bpd_decoder_4_io_out_is_call),
    .io_out_target           (_bpd_decoder_4_io_out_target),
    .io_out_cfi_type         (_bpd_decoder_4_io_out_cfi_type),
    .io_out_sfb_offset_valid (_bpd_decoder_4_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits  (_bpd_decoder_4_io_out_sfb_offset_bits),
    .io_out_shadowable       (_bpd_decoder_4_io_out_shadowable)
  );
  RVCExpander exp_inst_rvc_exp_5 (
    .io_in       (inst_5),
    .io_out_bits (_exp_inst_rvc_exp_5_io_out_bits),
    .io_rvc      (_exp_inst_rvc_exp_5_io_rvc)
  );
  BranchDecode bpd_decoder_5 (
    .io_inst                 (f3_fetch_bundle_exp_insts_7),
    .io_pc                   (_GEN_36 + 40'hE),
    .io_out_is_ret           (_bpd_decoder_5_io_out_is_ret),
    .io_out_is_call          (_bpd_decoder_5_io_out_is_call),
    .io_out_target           (_bpd_decoder_5_io_out_target),
    .io_out_cfi_type         (_bpd_decoder_5_io_out_cfi_type),
    .io_out_sfb_offset_valid (_bpd_decoder_5_io_out_sfb_offset_valid),
    .io_out_sfb_offset_bits  (_bpd_decoder_5_io_out_sfb_offset_bits),
    .io_out_shadowable       (_bpd_decoder_5_io_out_shadowable)
  );
  Queue_34 f4_btb_corrections (
    .clock                                          (clock),
    .reset                                          (reset),
    .io_enq_valid                                   (_f4_btb_corrections_io_enq_valid_T & (f3_btb_mispredicts_0 | f3_btb_mispredicts_1 | f3_btb_mispredicts_2 | f3_btb_mispredicts_3 | f3_btb_mispredicts_4 | f3_btb_mispredicts_5 | f3_btb_mispredicts_6 | f3_btb_mispredicts_7)),
    .io_enq_bits_btb_mispredicts                    ({f3_btb_mispredicts_7, f3_btb_mispredicts_6, f3_btb_mispredicts_5, f3_btb_mispredicts_4, f3_btb_mispredicts_3, f3_btb_mispredicts_2, f3_btb_mispredicts_1, f3_btb_mispredicts_0}),
    .io_enq_bits_pc                                 (_f3_io_deq_bits_pc),
    .io_enq_bits_ghist_old_history                  (_f3_io_deq_bits_ghist_old_history),
    .io_enq_bits_ghist_current_saw_branch_not_taken (_f3_io_deq_bits_ghist_current_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_not_taken     (_f3_io_deq_bits_ghist_new_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_taken         (_f3_io_deq_bits_ghist_new_saw_branch_taken),
    .io_enq_bits_ghist_ras_idx                      (_f3_io_deq_bits_ghist_ras_idx),
    .io_enq_bits_lhist_0                            (_f3_bpd_resp_io_deq_bits_lhist_0),
    .io_enq_bits_lhist_1                            (_f3_bpd_resp_io_deq_bits_lhist_1),
    .io_enq_bits_meta_0                             (_f3_bpd_resp_io_deq_bits_meta_0),
    .io_enq_bits_meta_1                             (_f3_bpd_resp_io_deq_bits_meta_1),
    .io_deq_ready                                   (_bpd_update_arbiter_io_in_1_ready),
    .io_deq_valid                                   (_f4_btb_corrections_io_deq_valid),
    .io_deq_bits_is_mispredict_update               (_f4_btb_corrections_io_deq_bits_is_mispredict_update),
    .io_deq_bits_is_repair_update                   (_f4_btb_corrections_io_deq_bits_is_repair_update),
    .io_deq_bits_btb_mispredicts                    (_f4_btb_corrections_io_deq_bits_btb_mispredicts),
    .io_deq_bits_pc                                 (_f4_btb_corrections_io_deq_bits_pc),
    .io_deq_bits_br_mask                            (_f4_btb_corrections_io_deq_bits_br_mask),
    .io_deq_bits_cfi_idx_valid                      (_f4_btb_corrections_io_deq_bits_cfi_idx_valid),
    .io_deq_bits_cfi_idx_bits                       (_f4_btb_corrections_io_deq_bits_cfi_idx_bits),
    .io_deq_bits_cfi_taken                          (_f4_btb_corrections_io_deq_bits_cfi_taken),
    .io_deq_bits_cfi_mispredicted                   (_f4_btb_corrections_io_deq_bits_cfi_mispredicted),
    .io_deq_bits_cfi_is_br                          (_f4_btb_corrections_io_deq_bits_cfi_is_br),
    .io_deq_bits_cfi_is_jal                         (_f4_btb_corrections_io_deq_bits_cfi_is_jal),
    .io_deq_bits_ghist_old_history                  (_f4_btb_corrections_io_deq_bits_ghist_old_history),
    .io_deq_bits_ghist_new_saw_branch_not_taken     (_f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_taken         (_f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_taken),
    .io_deq_bits_target                             (_f4_btb_corrections_io_deq_bits_target),
    .io_deq_bits_meta_0                             (_f4_btb_corrections_io_deq_bits_meta_0),
    .io_deq_bits_meta_1                             (_f4_btb_corrections_io_deq_bits_meta_1)
  );
  Queue_35 f4 (
    .clock                                          (clock),
    .reset                                          (_GEN_34),
    .io_enq_ready                                   (_f4_io_enq_ready),
    .io_enq_valid                                   (_f4_io_enq_valid_T_1),
    .io_enq_bits_pc                                 (_f3_io_deq_bits_pc),
    .io_enq_bits_next_pc                            (f3_fetch_bundle_next_pc),
    .io_enq_bits_edge_inst_0                        (f3_prev_is_half),
    .io_enq_bits_edge_inst_1                        (f3_fetch_bundle_edge_inst_1),
    .io_enq_bits_insts_0                            (bank_insts_0),
    .io_enq_bits_insts_1                            (inst),
    .io_enq_bits_insts_2                            (inst_1),
    .io_enq_bits_insts_3                            (inst_2),
    .io_enq_bits_insts_4                            (bank_insts_1_0),
    .io_enq_bits_insts_5                            (inst_3),
    .io_enq_bits_insts_6                            (inst_4),
    .io_enq_bits_insts_7                            (inst_5),
    .io_enq_bits_exp_insts_0                        (f3_prev_is_half ? exp_inst0 : exp_inst1),
    .io_enq_bits_exp_insts_1                        (f3_fetch_bundle_exp_insts_1),
    .io_enq_bits_exp_insts_2                        (f3_fetch_bundle_exp_insts_2),
    .io_enq_bits_exp_insts_3                        (f3_fetch_bundle_exp_insts_3),
    .io_enq_bits_exp_insts_4                        (f3_fetch_bundle_edge_inst_1 ? exp_inst0b : exp_inst1_1),
    .io_enq_bits_exp_insts_5                        (f3_fetch_bundle_exp_insts_5),
    .io_enq_bits_exp_insts_6                        (f3_fetch_bundle_exp_insts_6),
    .io_enq_bits_exp_insts_7                        (f3_fetch_bundle_exp_insts_7),
    .io_enq_bits_sfbs_0                             (f3_mask_0 & (f3_prev_is_half ? _bpd_decoder0_io_out_sfb_offset_valid : _bpd_decoder1_io_out_sfb_offset_valid) & _offset_from_aligned_pc_T_4 <= _GEN_38),
    .io_enq_bits_sfbs_1                             (f3_mask_1 & _bpd_decoder_io_out_sfb_offset_valid & _offset_from_aligned_pc_T_5 <= _GEN_38),
    .io_enq_bits_sfbs_2                             (f3_mask_2 & _bpd_decoder_1_io_out_sfb_offset_valid & _offset_from_aligned_pc_T_10 <= _GEN_38),
    .io_enq_bits_sfbs_3                             (f3_mask_3 & _bpd_decoder_2_io_out_sfb_offset_valid & _offset_from_aligned_pc_T_15 <= _GEN_38),
    .io_enq_bits_sfbs_4                             (f3_mask_4 & (f3_fetch_bundle_edge_inst_1 ? _bpd_decoder0b_io_out_sfb_offset_valid : _bpd_decoder1_1_io_out_sfb_offset_valid) & _offset_from_aligned_pc_T_24 <= _GEN_38),
    .io_enq_bits_sfbs_5                             (f3_mask_5 & _bpd_decoder_3_io_out_sfb_offset_valid & _offset_from_aligned_pc_T_25 <= _GEN_38),
    .io_enq_bits_sfbs_6                             (f3_mask_6 & _bpd_decoder_4_io_out_sfb_offset_valid & _offset_from_aligned_pc_T_30 <= _GEN_38),
    .io_enq_bits_sfbs_7                             (f3_mask_7 & _bpd_decoder_5_io_out_sfb_offset_valid & _offset_from_aligned_pc_T_35 <= _GEN_38),
    .io_enq_bits_sfb_masks_0                        (~(_upper_mask_T_3[15:0] | {_GEN_51[1] | _upper_mask_T_3[0], _GEN_51[0], _GEN_50[0], _GEN_49[0], _GEN_48[0], _GEN_47[0], _GEN_46[0], _GEN_45[0], _GEN_44[0], _GEN_43[0], _GEN_42[0], _GEN_41[0], _GEN_40[0], _GEN_39[0], _upper_mask_T_3[0], 1'h0}) & 16'hFFFE),
    .io_enq_bits_sfb_masks_1                        (~(_upper_mask_T_7[15:0] | {_GEN_64[1] | _upper_mask_T_7[0], _GEN_64[0], _GEN_63[0], _GEN_62[0], _GEN_61[0], _GEN_60[0], _GEN_59[0], _GEN_58[0], _GEN_57[0], _GEN_56[0], _GEN_55[0], _GEN_54[0], _GEN_53[0], _GEN_52[0], _upper_mask_T_7[0], 1'h0}) & 16'hFFFC),
    .io_enq_bits_sfb_masks_2                        (~(_upper_mask_T_11[15:0] | {_GEN_78[1] | _upper_mask_T_11[0], _GEN_78[0], _GEN_77[0], _GEN_76[0], _GEN_75[0], _GEN_74[0], _GEN_73[0], _GEN_72[0], _GEN_71[0], _GEN_70[0], _GEN_69[0], _GEN_68[0], _GEN_67[0], _GEN_66[0], _upper_mask_T_11[0], 1'h0}) & 16'hFFF8),
    .io_enq_bits_sfb_masks_3                        (~(_upper_mask_T_15[15:0] | {_GEN_92[1] | _upper_mask_T_15[0], _GEN_92[0], _GEN_91[0], _GEN_90[0], _GEN_89[0], _GEN_88[0], _GEN_87[0], _GEN_86[0], _GEN_85[0], _GEN_84[0], _GEN_83[0], _GEN_82[0], _GEN_81[0], _GEN_80[0], _upper_mask_T_15[0], 1'h0}) & 16'hFFF0),
    .io_enq_bits_sfb_masks_4                        (~(_upper_mask_T_19[15:0] | {_GEN_106[1] | _upper_mask_T_19[0], _GEN_106[0], _GEN_105[0], _GEN_104[0], _GEN_103[0], _GEN_102[0], _GEN_101[0], _GEN_100[0], _GEN_99[0], _GEN_98[0], _GEN_97[0], _GEN_96[0], _GEN_95[0], _GEN_94[0], _upper_mask_T_19[0], 1'h0}) & 16'hFFE0),
    .io_enq_bits_sfb_masks_5                        (~(_upper_mask_T_23[15:0] | {_GEN_120[1] | _upper_mask_T_23[0], _GEN_120[0], _GEN_119[0], _GEN_118[0], _GEN_117[0], _GEN_116[0], _GEN_115[0], _GEN_114[0], _GEN_113[0], _GEN_112[0], _GEN_111[0], _GEN_110[0], _GEN_109[0], _GEN_108[0], _upper_mask_T_23[0], 1'h0}) & 16'hFFC0),
    .io_enq_bits_sfb_masks_6                        (~(_upper_mask_T_27[15:0] | {_GEN_134[1] | _upper_mask_T_27[0], _GEN_134[0], _GEN_133[0], _GEN_132[0], _GEN_131[0], _GEN_130[0], _GEN_129[0], _GEN_128[0], _GEN_127[0], _GEN_126[0], _GEN_125[0], _GEN_124[0], _GEN_123[0], _GEN_122[0], _upper_mask_T_27[0], 1'h0}) & 16'hFF80),
    .io_enq_bits_sfb_masks_7                        (~(_upper_mask_T_31[15:0] | {_GEN_147[1] | _upper_mask_T_31[0], _GEN_147[0], _GEN_146[0], _GEN_145[0], _GEN_144[0], _GEN_143[0], _GEN_142[0], _GEN_141[0], _GEN_140[0], _GEN_139[0], _GEN_138[0], _GEN_137[0], _GEN_136[0], _GEN_135[0], _upper_mask_T_31[0], 1'h0}) & 16'hFF00),
    .io_enq_bits_sfb_dests_0                        (_offset_from_aligned_pc_T_4[4:0]),
    .io_enq_bits_sfb_dests_1                        (_offset_from_aligned_pc_T_5[4:0]),
    .io_enq_bits_sfb_dests_2                        (_offset_from_aligned_pc_T_10[4:0]),
    .io_enq_bits_sfb_dests_3                        (_offset_from_aligned_pc_T_15[4:0]),
    .io_enq_bits_sfb_dests_4                        (_offset_from_aligned_pc_T_24[4:0]),
    .io_enq_bits_sfb_dests_5                        (_offset_from_aligned_pc_T_25[4:0]),
    .io_enq_bits_sfb_dests_6                        (_offset_from_aligned_pc_T_30[4:0]),
    .io_enq_bits_sfb_dests_7                        (_offset_from_aligned_pc_T_35[4:0]),
    .io_enq_bits_shadowable_mask_0                  (~_s0_valid_T_11 & ((f3_prev_is_half ? _bpd_decoder0_io_out_shadowable : _bpd_decoder1_io_out_shadowable) | ~f3_mask_0)),
    .io_enq_bits_shadowable_mask_1                  (~_s0_valid_T_11 & (_bpd_decoder_io_out_shadowable | ~f3_mask_1)),
    .io_enq_bits_shadowable_mask_2                  (~_s0_valid_T_11 & (_bpd_decoder_1_io_out_shadowable | ~f3_mask_2)),
    .io_enq_bits_shadowable_mask_3                  (~_s0_valid_T_11 & (_bpd_decoder_2_io_out_shadowable | ~f3_mask_3)),
    .io_enq_bits_shadowable_mask_4                  (~_s0_valid_T_11 & _f3_fetch_bundle_shadowable_mask_7_T_4 & ((f3_fetch_bundle_edge_inst_1 ? _bpd_decoder0b_io_out_shadowable : _bpd_decoder1_1_io_out_shadowable) | ~f3_mask_4)),
    .io_enq_bits_shadowable_mask_5                  (~_s0_valid_T_11 & _f3_fetch_bundle_shadowable_mask_7_T_4 & (_bpd_decoder_3_io_out_shadowable | ~f3_mask_5)),
    .io_enq_bits_shadowable_mask_6                  (~_s0_valid_T_11 & _f3_fetch_bundle_shadowable_mask_7_T_4 & (_bpd_decoder_4_io_out_shadowable | ~f3_mask_6)),
    .io_enq_bits_shadowable_mask_7                  (~_s0_valid_T_11 & _f3_fetch_bundle_shadowable_mask_7_T_4 & (_bpd_decoder_5_io_out_shadowable | ~f3_mask_7)),
    .io_enq_bits_cfi_idx_valid                      (f3_fetch_bundle_cfi_idx_valid),
    .io_enq_bits_cfi_idx_bits                       (f3_fetch_bundle_cfi_idx_bits),
    .io_enq_bits_cfi_type                           (casez_tmp_5),
    .io_enq_bits_cfi_is_call                        (casez_tmp_6),
    .io_enq_bits_cfi_is_ret                         (casez_tmp_7),
    .io_enq_bits_cfi_npc_plus4                      (casez_tmp_8),
    .io_enq_bits_ras_top                            (_ras_io_read_addr),
    .io_enq_bits_mask                               ({f3_mask_7, f3_mask_6, f3_mask_5, f3_mask_4, f3_mask_3, f3_mask_2, f3_mask_1, f3_mask_0}),
    .io_enq_bits_br_mask                            (f3_fetch_bundle_br_mask),
    .io_enq_bits_ghist_old_history                  (_f3_io_deq_bits_ghist_old_history),
    .io_enq_bits_ghist_current_saw_branch_not_taken (_f3_io_deq_bits_ghist_current_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_not_taken     (_f3_io_deq_bits_ghist_new_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_taken         (_f3_io_deq_bits_ghist_new_saw_branch_taken),
    .io_enq_bits_ghist_ras_idx                      (_f3_io_deq_bits_ghist_ras_idx),
    .io_enq_bits_lhist_0                            (_f3_bpd_resp_io_deq_bits_lhist_0),
    .io_enq_bits_lhist_1                            (_f3_bpd_resp_io_deq_bits_lhist_1),
    .io_enq_bits_xcpt_pf_if                         (_f3_io_deq_bits_xcpt_pf_inst),
    .io_enq_bits_xcpt_ae_if                         (_f3_io_deq_bits_xcpt_ae_inst),
    .io_enq_bits_end_half_valid                     (f3_fetch_bundle_end_half_valid),
    .io_enq_bits_end_half_bits                      (f3_fetch_bundle_end_half_bits),
    .io_enq_bits_bpd_meta_0                         (_f3_bpd_resp_io_deq_bits_meta_0),
    .io_enq_bits_bpd_meta_1                         (_f3_bpd_resp_io_deq_bits_meta_1),
    .io_enq_bits_fsrc                               (_GEN_166 ? _f3_io_deq_bits_fsrc : 2'h2),
    .io_enq_bits_tsrc                               (_f3_io_deq_bits_tsrc),
    .io_deq_ready                                   (_fb_io_enq_ready & _ftq_io_enq_ready & ~f4_delay),
    .io_deq_valid                                   (_f4_io_deq_valid),
    .io_deq_bits_pc                                 (_f4_io_deq_bits_pc),
    .io_deq_bits_edge_inst_0                        (_f4_io_deq_bits_edge_inst_0),
    .io_deq_bits_edge_inst_1                        (_f4_io_deq_bits_edge_inst_1),
    .io_deq_bits_insts_0                            (_f4_io_deq_bits_insts_0),
    .io_deq_bits_insts_1                            (_f4_io_deq_bits_insts_1),
    .io_deq_bits_insts_2                            (_f4_io_deq_bits_insts_2),
    .io_deq_bits_insts_3                            (_f4_io_deq_bits_insts_3),
    .io_deq_bits_insts_4                            (_f4_io_deq_bits_insts_4),
    .io_deq_bits_insts_5                            (_f4_io_deq_bits_insts_5),
    .io_deq_bits_insts_6                            (_f4_io_deq_bits_insts_6),
    .io_deq_bits_insts_7                            (_f4_io_deq_bits_insts_7),
    .io_deq_bits_exp_insts_0                        (_f4_io_deq_bits_exp_insts_0),
    .io_deq_bits_exp_insts_1                        (_f4_io_deq_bits_exp_insts_1),
    .io_deq_bits_exp_insts_2                        (_f4_io_deq_bits_exp_insts_2),
    .io_deq_bits_exp_insts_3                        (_f4_io_deq_bits_exp_insts_3),
    .io_deq_bits_exp_insts_4                        (_f4_io_deq_bits_exp_insts_4),
    .io_deq_bits_exp_insts_5                        (_f4_io_deq_bits_exp_insts_5),
    .io_deq_bits_exp_insts_6                        (_f4_io_deq_bits_exp_insts_6),
    .io_deq_bits_exp_insts_7                        (_f4_io_deq_bits_exp_insts_7),
    .io_deq_bits_sfbs_0                             (_f4_io_deq_bits_sfbs_0),
    .io_deq_bits_sfbs_1                             (_f4_io_deq_bits_sfbs_1),
    .io_deq_bits_sfbs_2                             (_f4_io_deq_bits_sfbs_2),
    .io_deq_bits_sfbs_3                             (_f4_io_deq_bits_sfbs_3),
    .io_deq_bits_sfbs_4                             (_f4_io_deq_bits_sfbs_4),
    .io_deq_bits_sfbs_5                             (_f4_io_deq_bits_sfbs_5),
    .io_deq_bits_sfbs_6                             (_f4_io_deq_bits_sfbs_6),
    .io_deq_bits_sfbs_7                             (_f4_io_deq_bits_sfbs_7),
    .io_deq_bits_shadowed_mask_0                    (_f4_io_deq_bits_shadowed_mask_0),
    .io_deq_bits_shadowed_mask_1                    (_f4_io_deq_bits_shadowed_mask_1),
    .io_deq_bits_shadowed_mask_2                    (_f4_io_deq_bits_shadowed_mask_2),
    .io_deq_bits_shadowed_mask_3                    (_f4_io_deq_bits_shadowed_mask_3),
    .io_deq_bits_shadowed_mask_4                    (_f4_io_deq_bits_shadowed_mask_4),
    .io_deq_bits_shadowed_mask_5                    (_f4_io_deq_bits_shadowed_mask_5),
    .io_deq_bits_shadowed_mask_6                    (_f4_io_deq_bits_shadowed_mask_6),
    .io_deq_bits_shadowed_mask_7                    (_f4_io_deq_bits_shadowed_mask_7),
    .io_deq_bits_cfi_idx_valid                      (_f4_io_deq_bits_cfi_idx_valid),
    .io_deq_bits_cfi_idx_bits                       (_f4_io_deq_bits_cfi_idx_bits),
    .io_deq_bits_cfi_type                           (_f4_io_deq_bits_cfi_type),
    .io_deq_bits_cfi_is_call                        (_f4_io_deq_bits_cfi_is_call),
    .io_deq_bits_cfi_is_ret                         (_f4_io_deq_bits_cfi_is_ret),
    .io_deq_bits_ras_top                            (_f4_io_deq_bits_ras_top),
    .io_deq_bits_mask                               (_f4_io_deq_bits_mask),
    .io_deq_bits_br_mask                            (_f4_io_deq_bits_br_mask),
    .io_deq_bits_ghist_old_history                  (_f4_io_deq_bits_ghist_old_history),
    .io_deq_bits_ghist_current_saw_branch_not_taken (_f4_io_deq_bits_ghist_current_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_not_taken     (_f4_io_deq_bits_ghist_new_saw_branch_not_taken),
    .io_deq_bits_ghist_new_saw_branch_taken         (_f4_io_deq_bits_ghist_new_saw_branch_taken),
    .io_deq_bits_ghist_ras_idx                      (_f4_io_deq_bits_ghist_ras_idx),
    .io_deq_bits_xcpt_pf_if                         (_f4_io_deq_bits_xcpt_pf_if),
    .io_deq_bits_xcpt_ae_if                         (_f4_io_deq_bits_xcpt_ae_if),
    .io_deq_bits_bp_debug_if_oh_0                   (_f4_io_deq_bits_bp_debug_if_oh_0),
    .io_deq_bits_bp_debug_if_oh_1                   (_f4_io_deq_bits_bp_debug_if_oh_1),
    .io_deq_bits_bp_debug_if_oh_2                   (_f4_io_deq_bits_bp_debug_if_oh_2),
    .io_deq_bits_bp_debug_if_oh_3                   (_f4_io_deq_bits_bp_debug_if_oh_3),
    .io_deq_bits_bp_debug_if_oh_4                   (_f4_io_deq_bits_bp_debug_if_oh_4),
    .io_deq_bits_bp_debug_if_oh_5                   (_f4_io_deq_bits_bp_debug_if_oh_5),
    .io_deq_bits_bp_debug_if_oh_6                   (_f4_io_deq_bits_bp_debug_if_oh_6),
    .io_deq_bits_bp_debug_if_oh_7                   (_f4_io_deq_bits_bp_debug_if_oh_7),
    .io_deq_bits_bp_xcpt_if_oh_0                    (_f4_io_deq_bits_bp_xcpt_if_oh_0),
    .io_deq_bits_bp_xcpt_if_oh_1                    (_f4_io_deq_bits_bp_xcpt_if_oh_1),
    .io_deq_bits_bp_xcpt_if_oh_2                    (_f4_io_deq_bits_bp_xcpt_if_oh_2),
    .io_deq_bits_bp_xcpt_if_oh_3                    (_f4_io_deq_bits_bp_xcpt_if_oh_3),
    .io_deq_bits_bp_xcpt_if_oh_4                    (_f4_io_deq_bits_bp_xcpt_if_oh_4),
    .io_deq_bits_bp_xcpt_if_oh_5                    (_f4_io_deq_bits_bp_xcpt_if_oh_5),
    .io_deq_bits_bp_xcpt_if_oh_6                    (_f4_io_deq_bits_bp_xcpt_if_oh_6),
    .io_deq_bits_bp_xcpt_if_oh_7                    (_f4_io_deq_bits_bp_xcpt_if_oh_7),
    .io_deq_bits_bpd_meta_0                         (_f4_io_deq_bits_bpd_meta_0),
    .io_deq_bits_bpd_meta_1                         (_f4_io_deq_bits_bpd_meta_1),
    .io_deq_bits_fsrc                               (_f4_io_deq_bits_fsrc)
  );
  FetchBuffer fb (
    .clock                               (clock),
    .reset                               (reset),
    .io_enq_ready                        (_fb_io_enq_ready),
    .io_enq_valid                        (_f4_io_deq_valid & _ftq_io_enq_ready & ~f4_delay),
    .io_enq_bits_pc                      (_f4_io_deq_bits_pc),
    .io_enq_bits_edge_inst_0             (_f4_io_deq_bits_edge_inst_0),
    .io_enq_bits_edge_inst_1             (_f4_io_deq_bits_edge_inst_1),
    .io_enq_bits_insts_0                 (_f4_io_deq_bits_insts_0),
    .io_enq_bits_insts_1                 (_f4_io_deq_bits_insts_1),
    .io_enq_bits_insts_2                 (_f4_io_deq_bits_insts_2),
    .io_enq_bits_insts_3                 (_f4_io_deq_bits_insts_3),
    .io_enq_bits_insts_4                 (_f4_io_deq_bits_insts_4),
    .io_enq_bits_insts_5                 (_f4_io_deq_bits_insts_5),
    .io_enq_bits_insts_6                 (_f4_io_deq_bits_insts_6),
    .io_enq_bits_insts_7                 (_f4_io_deq_bits_insts_7),
    .io_enq_bits_exp_insts_0             (_f4_io_deq_bits_exp_insts_0),
    .io_enq_bits_exp_insts_1             (_f4_io_deq_bits_exp_insts_1),
    .io_enq_bits_exp_insts_2             (_f4_io_deq_bits_exp_insts_2),
    .io_enq_bits_exp_insts_3             (_f4_io_deq_bits_exp_insts_3),
    .io_enq_bits_exp_insts_4             (_f4_io_deq_bits_exp_insts_4),
    .io_enq_bits_exp_insts_5             (_f4_io_deq_bits_exp_insts_5),
    .io_enq_bits_exp_insts_6             (_f4_io_deq_bits_exp_insts_6),
    .io_enq_bits_exp_insts_7             (_f4_io_deq_bits_exp_insts_7),
    .io_enq_bits_shadowed_mask_0         (_f4_io_deq_bits_shadowed_mask_0),
    .io_enq_bits_shadowed_mask_1         (_f4_io_deq_bits_shadowed_mask_1),
    .io_enq_bits_shadowed_mask_2         (_f4_io_deq_bits_shadowed_mask_2),
    .io_enq_bits_shadowed_mask_3         (_f4_io_deq_bits_shadowed_mask_3),
    .io_enq_bits_shadowed_mask_4         (_f4_io_deq_bits_shadowed_mask_4),
    .io_enq_bits_shadowed_mask_5         (_f4_io_deq_bits_shadowed_mask_5),
    .io_enq_bits_shadowed_mask_6         (_f4_io_deq_bits_shadowed_mask_6),
    .io_enq_bits_shadowed_mask_7         (_f4_io_deq_bits_shadowed_mask_7),
    .io_enq_bits_cfi_idx_valid           (_f4_io_deq_bits_cfi_idx_valid),
    .io_enq_bits_cfi_idx_bits            (_f4_io_deq_bits_cfi_idx_bits),
    .io_enq_bits_ftq_idx                 (_ftq_io_enq_idx),
    .io_enq_bits_mask                    (_f4_io_deq_bits_mask),
    .io_enq_bits_xcpt_pf_if              (_f4_io_deq_bits_xcpt_pf_if),
    .io_enq_bits_xcpt_ae_if              (_f4_io_deq_bits_xcpt_ae_if),
    .io_enq_bits_bp_debug_if_oh_0        (_f4_io_deq_bits_bp_debug_if_oh_0),
    .io_enq_bits_bp_debug_if_oh_1        (_f4_io_deq_bits_bp_debug_if_oh_1),
    .io_enq_bits_bp_debug_if_oh_2        (_f4_io_deq_bits_bp_debug_if_oh_2),
    .io_enq_bits_bp_debug_if_oh_3        (_f4_io_deq_bits_bp_debug_if_oh_3),
    .io_enq_bits_bp_debug_if_oh_4        (_f4_io_deq_bits_bp_debug_if_oh_4),
    .io_enq_bits_bp_debug_if_oh_5        (_f4_io_deq_bits_bp_debug_if_oh_5),
    .io_enq_bits_bp_debug_if_oh_6        (_f4_io_deq_bits_bp_debug_if_oh_6),
    .io_enq_bits_bp_debug_if_oh_7        (_f4_io_deq_bits_bp_debug_if_oh_7),
    .io_enq_bits_bp_xcpt_if_oh_0         (_f4_io_deq_bits_bp_xcpt_if_oh_0),
    .io_enq_bits_bp_xcpt_if_oh_1         (_f4_io_deq_bits_bp_xcpt_if_oh_1),
    .io_enq_bits_bp_xcpt_if_oh_2         (_f4_io_deq_bits_bp_xcpt_if_oh_2),
    .io_enq_bits_bp_xcpt_if_oh_3         (_f4_io_deq_bits_bp_xcpt_if_oh_3),
    .io_enq_bits_bp_xcpt_if_oh_4         (_f4_io_deq_bits_bp_xcpt_if_oh_4),
    .io_enq_bits_bp_xcpt_if_oh_5         (_f4_io_deq_bits_bp_xcpt_if_oh_5),
    .io_enq_bits_bp_xcpt_if_oh_6         (_f4_io_deq_bits_bp_xcpt_if_oh_6),
    .io_enq_bits_bp_xcpt_if_oh_7         (_f4_io_deq_bits_bp_xcpt_if_oh_7),
    .io_enq_bits_fsrc                    (_f4_io_deq_bits_fsrc),
    .io_deq_ready                        (io_cpu_fetchpacket_ready),
    .io_deq_valid                        (io_cpu_fetchpacket_valid),
    .io_deq_bits_uops_0_valid            (io_cpu_fetchpacket_bits_uops_0_valid),
    .io_deq_bits_uops_0_bits_inst        (io_cpu_fetchpacket_bits_uops_0_bits_inst),
    .io_deq_bits_uops_0_bits_debug_inst  (io_cpu_fetchpacket_bits_uops_0_bits_debug_inst),
    .io_deq_bits_uops_0_bits_is_rvc      (io_cpu_fetchpacket_bits_uops_0_bits_is_rvc),
    .io_deq_bits_uops_0_bits_debug_pc    (io_cpu_fetchpacket_bits_uops_0_bits_debug_pc),
    .io_deq_bits_uops_0_bits_is_sfb      (io_cpu_fetchpacket_bits_uops_0_bits_is_sfb),
    .io_deq_bits_uops_0_bits_ftq_idx     (io_cpu_fetchpacket_bits_uops_0_bits_ftq_idx),
    .io_deq_bits_uops_0_bits_edge_inst   (io_cpu_fetchpacket_bits_uops_0_bits_edge_inst),
    .io_deq_bits_uops_0_bits_pc_lob      (io_cpu_fetchpacket_bits_uops_0_bits_pc_lob),
    .io_deq_bits_uops_0_bits_taken       (io_cpu_fetchpacket_bits_uops_0_bits_taken),
    .io_deq_bits_uops_0_bits_xcpt_pf_if  (io_cpu_fetchpacket_bits_uops_0_bits_xcpt_pf_if),
    .io_deq_bits_uops_0_bits_xcpt_ae_if  (io_cpu_fetchpacket_bits_uops_0_bits_xcpt_ae_if),
    .io_deq_bits_uops_0_bits_bp_debug_if (io_cpu_fetchpacket_bits_uops_0_bits_bp_debug_if),
    .io_deq_bits_uops_0_bits_bp_xcpt_if  (io_cpu_fetchpacket_bits_uops_0_bits_bp_xcpt_if),
    .io_deq_bits_uops_0_bits_debug_fsrc  (io_cpu_fetchpacket_bits_uops_0_bits_debug_fsrc),
    .io_deq_bits_uops_1_valid            (io_cpu_fetchpacket_bits_uops_1_valid),
    .io_deq_bits_uops_1_bits_inst        (io_cpu_fetchpacket_bits_uops_1_bits_inst),
    .io_deq_bits_uops_1_bits_debug_inst  (io_cpu_fetchpacket_bits_uops_1_bits_debug_inst),
    .io_deq_bits_uops_1_bits_is_rvc      (io_cpu_fetchpacket_bits_uops_1_bits_is_rvc),
    .io_deq_bits_uops_1_bits_debug_pc    (io_cpu_fetchpacket_bits_uops_1_bits_debug_pc),
    .io_deq_bits_uops_1_bits_is_sfb      (io_cpu_fetchpacket_bits_uops_1_bits_is_sfb),
    .io_deq_bits_uops_1_bits_ftq_idx     (io_cpu_fetchpacket_bits_uops_1_bits_ftq_idx),
    .io_deq_bits_uops_1_bits_edge_inst   (io_cpu_fetchpacket_bits_uops_1_bits_edge_inst),
    .io_deq_bits_uops_1_bits_pc_lob      (io_cpu_fetchpacket_bits_uops_1_bits_pc_lob),
    .io_deq_bits_uops_1_bits_taken       (io_cpu_fetchpacket_bits_uops_1_bits_taken),
    .io_deq_bits_uops_1_bits_xcpt_pf_if  (io_cpu_fetchpacket_bits_uops_1_bits_xcpt_pf_if),
    .io_deq_bits_uops_1_bits_xcpt_ae_if  (io_cpu_fetchpacket_bits_uops_1_bits_xcpt_ae_if),
    .io_deq_bits_uops_1_bits_bp_debug_if (io_cpu_fetchpacket_bits_uops_1_bits_bp_debug_if),
    .io_deq_bits_uops_1_bits_bp_xcpt_if  (io_cpu_fetchpacket_bits_uops_1_bits_bp_xcpt_if),
    .io_deq_bits_uops_1_bits_debug_fsrc  (io_cpu_fetchpacket_bits_uops_1_bits_debug_fsrc),
    .io_deq_bits_uops_2_valid            (io_cpu_fetchpacket_bits_uops_2_valid),
    .io_deq_bits_uops_2_bits_inst        (io_cpu_fetchpacket_bits_uops_2_bits_inst),
    .io_deq_bits_uops_2_bits_debug_inst  (io_cpu_fetchpacket_bits_uops_2_bits_debug_inst),
    .io_deq_bits_uops_2_bits_is_rvc      (io_cpu_fetchpacket_bits_uops_2_bits_is_rvc),
    .io_deq_bits_uops_2_bits_debug_pc    (io_cpu_fetchpacket_bits_uops_2_bits_debug_pc),
    .io_deq_bits_uops_2_bits_is_sfb      (io_cpu_fetchpacket_bits_uops_2_bits_is_sfb),
    .io_deq_bits_uops_2_bits_ftq_idx     (io_cpu_fetchpacket_bits_uops_2_bits_ftq_idx),
    .io_deq_bits_uops_2_bits_edge_inst   (io_cpu_fetchpacket_bits_uops_2_bits_edge_inst),
    .io_deq_bits_uops_2_bits_pc_lob      (io_cpu_fetchpacket_bits_uops_2_bits_pc_lob),
    .io_deq_bits_uops_2_bits_taken       (io_cpu_fetchpacket_bits_uops_2_bits_taken),
    .io_deq_bits_uops_2_bits_xcpt_pf_if  (io_cpu_fetchpacket_bits_uops_2_bits_xcpt_pf_if),
    .io_deq_bits_uops_2_bits_xcpt_ae_if  (io_cpu_fetchpacket_bits_uops_2_bits_xcpt_ae_if),
    .io_deq_bits_uops_2_bits_bp_debug_if (io_cpu_fetchpacket_bits_uops_2_bits_bp_debug_if),
    .io_deq_bits_uops_2_bits_bp_xcpt_if  (io_cpu_fetchpacket_bits_uops_2_bits_bp_xcpt_if),
    .io_deq_bits_uops_2_bits_debug_fsrc  (io_cpu_fetchpacket_bits_uops_2_bits_debug_fsrc),
    .io_deq_bits_uops_3_valid            (io_cpu_fetchpacket_bits_uops_3_valid),
    .io_deq_bits_uops_3_bits_inst        (io_cpu_fetchpacket_bits_uops_3_bits_inst),
    .io_deq_bits_uops_3_bits_debug_inst  (io_cpu_fetchpacket_bits_uops_3_bits_debug_inst),
    .io_deq_bits_uops_3_bits_is_rvc      (io_cpu_fetchpacket_bits_uops_3_bits_is_rvc),
    .io_deq_bits_uops_3_bits_debug_pc    (io_cpu_fetchpacket_bits_uops_3_bits_debug_pc),
    .io_deq_bits_uops_3_bits_is_sfb      (io_cpu_fetchpacket_bits_uops_3_bits_is_sfb),
    .io_deq_bits_uops_3_bits_ftq_idx     (io_cpu_fetchpacket_bits_uops_3_bits_ftq_idx),
    .io_deq_bits_uops_3_bits_edge_inst   (io_cpu_fetchpacket_bits_uops_3_bits_edge_inst),
    .io_deq_bits_uops_3_bits_pc_lob      (io_cpu_fetchpacket_bits_uops_3_bits_pc_lob),
    .io_deq_bits_uops_3_bits_taken       (io_cpu_fetchpacket_bits_uops_3_bits_taken),
    .io_deq_bits_uops_3_bits_xcpt_pf_if  (io_cpu_fetchpacket_bits_uops_3_bits_xcpt_pf_if),
    .io_deq_bits_uops_3_bits_xcpt_ae_if  (io_cpu_fetchpacket_bits_uops_3_bits_xcpt_ae_if),
    .io_deq_bits_uops_3_bits_bp_debug_if (io_cpu_fetchpacket_bits_uops_3_bits_bp_debug_if),
    .io_deq_bits_uops_3_bits_bp_xcpt_if  (io_cpu_fetchpacket_bits_uops_3_bits_bp_xcpt_if),
    .io_deq_bits_uops_3_bits_debug_fsrc  (io_cpu_fetchpacket_bits_uops_3_bits_debug_fsrc),
    .io_clear                            (f4_clear)
  );
  FetchTargetQueue ftq (
    .clock                                              (clock),
    .reset                                              (reset),
    .io_enq_ready                                       (_ftq_io_enq_ready),
    .io_enq_valid                                       (_f4_io_deq_valid & _fb_io_enq_ready & ~f4_delay),
    .io_enq_bits_pc                                     (_f4_io_deq_bits_pc),
    .io_enq_bits_cfi_idx_valid                          (_f4_io_deq_bits_cfi_idx_valid),
    .io_enq_bits_cfi_idx_bits                           (_f4_io_deq_bits_cfi_idx_bits),
    .io_enq_bits_cfi_type                               (_f4_io_deq_bits_cfi_type),
    .io_enq_bits_cfi_is_call                            (_f4_io_deq_bits_cfi_is_call),
    .io_enq_bits_cfi_is_ret                             (_f4_io_deq_bits_cfi_is_ret),
    .io_enq_bits_ras_top                                (_f4_io_deq_bits_ras_top),
    .io_enq_bits_mask                                   (_f4_io_deq_bits_mask),
    .io_enq_bits_br_mask                                (_f4_io_deq_bits_br_mask),
    .io_enq_bits_ghist_old_history                      (_f4_io_deq_bits_ghist_old_history),
    .io_enq_bits_ghist_current_saw_branch_not_taken     (_f4_io_deq_bits_ghist_current_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_not_taken         (_f4_io_deq_bits_ghist_new_saw_branch_not_taken),
    .io_enq_bits_ghist_new_saw_branch_taken             (_f4_io_deq_bits_ghist_new_saw_branch_taken),
    .io_enq_bits_ghist_ras_idx                          (_f4_io_deq_bits_ghist_ras_idx),
    .io_enq_bits_bpd_meta_0                             (_f4_io_deq_bits_bpd_meta_0),
    .io_enq_bits_bpd_meta_1                             (_f4_io_deq_bits_bpd_meta_1),
    .io_enq_idx                                         (_ftq_io_enq_idx),
    .io_deq_valid                                       (io_cpu_commit_valid),
    .io_deq_bits                                        (io_cpu_commit_bits[5:0]),
    .io_get_ftq_pc_0_ftq_idx                            (io_cpu_get_pc_0_ftq_idx),
    .io_get_ftq_pc_0_entry_cfi_idx_valid                (io_cpu_get_pc_0_entry_cfi_idx_valid),
    .io_get_ftq_pc_0_entry_cfi_idx_bits                 (io_cpu_get_pc_0_entry_cfi_idx_bits),
    .io_get_ftq_pc_0_entry_ras_idx                      (io_cpu_get_pc_0_entry_ras_idx),
    .io_get_ftq_pc_0_entry_start_bank                   (io_cpu_get_pc_0_entry_start_bank),
    .io_get_ftq_pc_0_pc                                 (io_cpu_get_pc_0_pc),
    .io_get_ftq_pc_0_com_pc                             (io_cpu_get_pc_0_com_pc),
    .io_get_ftq_pc_0_next_val                           (io_cpu_get_pc_0_next_val),
    .io_get_ftq_pc_0_next_pc                            (io_cpu_get_pc_0_next_pc),
    .io_get_ftq_pc_1_ftq_idx                            (io_cpu_get_pc_1_ftq_idx),
    .io_get_ftq_pc_1_entry_cfi_idx_bits                 (io_cpu_get_pc_1_entry_cfi_idx_bits),
    .io_get_ftq_pc_1_entry_br_mask                      (io_cpu_get_pc_1_entry_br_mask),
    .io_get_ftq_pc_1_entry_cfi_is_call                  (io_cpu_get_pc_1_entry_cfi_is_call),
    .io_get_ftq_pc_1_entry_cfi_is_ret                   (io_cpu_get_pc_1_entry_cfi_is_ret),
    .io_get_ftq_pc_1_entry_start_bank                   (io_cpu_get_pc_1_entry_start_bank),
    .io_get_ftq_pc_1_ghist_old_history                  (io_cpu_get_pc_1_ghist_old_history),
    .io_get_ftq_pc_1_ghist_current_saw_branch_not_taken (io_cpu_get_pc_1_ghist_current_saw_branch_not_taken),
    .io_get_ftq_pc_1_ghist_new_saw_branch_not_taken     (io_cpu_get_pc_1_ghist_new_saw_branch_not_taken),
    .io_get_ftq_pc_1_ghist_new_saw_branch_taken         (io_cpu_get_pc_1_ghist_new_saw_branch_taken),
    .io_get_ftq_pc_1_ghist_ras_idx                      (io_cpu_get_pc_1_ghist_ras_idx),
    .io_get_ftq_pc_1_pc                                 (io_cpu_get_pc_1_pc),
    .io_redirect_valid                                  (io_cpu_redirect_val),
    .io_redirect_bits                                   (io_cpu_redirect_ftq_idx),
    .io_brupdate_b2_uop_ftq_idx                         (io_cpu_brupdate_b2_uop_ftq_idx),
    .io_brupdate_b2_uop_pc_lob                          (io_cpu_brupdate_b2_uop_pc_lob),
    .io_brupdate_b2_mispredict                          (io_cpu_brupdate_b2_mispredict),
    .io_brupdate_b2_taken                               (io_cpu_brupdate_b2_taken),
    .io_bpdupdate_valid                                 (_ftq_io_bpdupdate_valid),
    .io_bpdupdate_bits_is_mispredict_update             (_ftq_io_bpdupdate_bits_is_mispredict_update),
    .io_bpdupdate_bits_is_repair_update                 (_ftq_io_bpdupdate_bits_is_repair_update),
    .io_bpdupdate_bits_pc                               (_ftq_io_bpdupdate_bits_pc),
    .io_bpdupdate_bits_br_mask                          (_ftq_io_bpdupdate_bits_br_mask),
    .io_bpdupdate_bits_cfi_idx_valid                    (_ftq_io_bpdupdate_bits_cfi_idx_valid),
    .io_bpdupdate_bits_cfi_idx_bits                     (_ftq_io_bpdupdate_bits_cfi_idx_bits),
    .io_bpdupdate_bits_cfi_taken                        (_ftq_io_bpdupdate_bits_cfi_taken),
    .io_bpdupdate_bits_cfi_mispredicted                 (_ftq_io_bpdupdate_bits_cfi_mispredicted),
    .io_bpdupdate_bits_cfi_is_br                        (_ftq_io_bpdupdate_bits_cfi_is_br),
    .io_bpdupdate_bits_cfi_is_jal                       (_ftq_io_bpdupdate_bits_cfi_is_jal),
    .io_bpdupdate_bits_ghist_old_history                (_ftq_io_bpdupdate_bits_ghist_old_history),
    .io_bpdupdate_bits_ghist_new_saw_branch_not_taken   (_ftq_io_bpdupdate_bits_ghist_new_saw_branch_not_taken),
    .io_bpdupdate_bits_ghist_new_saw_branch_taken       (_ftq_io_bpdupdate_bits_ghist_new_saw_branch_taken),
    .io_bpdupdate_bits_target                           (_ftq_io_bpdupdate_bits_target),
    .io_bpdupdate_bits_meta_0                           (_ftq_io_bpdupdate_bits_meta_0),
    .io_bpdupdate_bits_meta_1                           (_ftq_io_bpdupdate_bits_meta_1),
    .io_ras_update                                      (_ftq_io_ras_update),
    .io_ras_update_idx                                  (_ftq_io_ras_update_idx),
    .io_ras_update_pc                                   (_ftq_io_ras_update_pc)
  );
  Arbiter_15 bpd_update_arbiter (
    .io_in_0_valid                               (_ftq_io_bpdupdate_valid),
    .io_in_0_bits_is_mispredict_update           (_ftq_io_bpdupdate_bits_is_mispredict_update),
    .io_in_0_bits_is_repair_update               (_ftq_io_bpdupdate_bits_is_repair_update),
    .io_in_0_bits_pc                             (_ftq_io_bpdupdate_bits_pc),
    .io_in_0_bits_br_mask                        (_ftq_io_bpdupdate_bits_br_mask),
    .io_in_0_bits_cfi_idx_valid                  (_ftq_io_bpdupdate_bits_cfi_idx_valid),
    .io_in_0_bits_cfi_idx_bits                   (_ftq_io_bpdupdate_bits_cfi_idx_bits),
    .io_in_0_bits_cfi_taken                      (_ftq_io_bpdupdate_bits_cfi_taken),
    .io_in_0_bits_cfi_mispredicted               (_ftq_io_bpdupdate_bits_cfi_mispredicted),
    .io_in_0_bits_cfi_is_br                      (_ftq_io_bpdupdate_bits_cfi_is_br),
    .io_in_0_bits_cfi_is_jal                     (_ftq_io_bpdupdate_bits_cfi_is_jal),
    .io_in_0_bits_ghist_old_history              (_ftq_io_bpdupdate_bits_ghist_old_history),
    .io_in_0_bits_ghist_new_saw_branch_not_taken (_ftq_io_bpdupdate_bits_ghist_new_saw_branch_not_taken),
    .io_in_0_bits_ghist_new_saw_branch_taken     (_ftq_io_bpdupdate_bits_ghist_new_saw_branch_taken),
    .io_in_0_bits_target                         (_ftq_io_bpdupdate_bits_target),
    .io_in_0_bits_meta_0                         (_ftq_io_bpdupdate_bits_meta_0),
    .io_in_0_bits_meta_1                         (_ftq_io_bpdupdate_bits_meta_1),
    .io_in_1_ready                               (_bpd_update_arbiter_io_in_1_ready),
    .io_in_1_valid                               (_f4_btb_corrections_io_deq_valid),
    .io_in_1_bits_is_mispredict_update           (_f4_btb_corrections_io_deq_bits_is_mispredict_update),
    .io_in_1_bits_is_repair_update               (_f4_btb_corrections_io_deq_bits_is_repair_update),
    .io_in_1_bits_btb_mispredicts                (_f4_btb_corrections_io_deq_bits_btb_mispredicts),
    .io_in_1_bits_pc                             (_f4_btb_corrections_io_deq_bits_pc),
    .io_in_1_bits_br_mask                        (_f4_btb_corrections_io_deq_bits_br_mask),
    .io_in_1_bits_cfi_idx_valid                  (_f4_btb_corrections_io_deq_bits_cfi_idx_valid),
    .io_in_1_bits_cfi_idx_bits                   (_f4_btb_corrections_io_deq_bits_cfi_idx_bits),
    .io_in_1_bits_cfi_taken                      (_f4_btb_corrections_io_deq_bits_cfi_taken),
    .io_in_1_bits_cfi_mispredicted               (_f4_btb_corrections_io_deq_bits_cfi_mispredicted),
    .io_in_1_bits_cfi_is_br                      (_f4_btb_corrections_io_deq_bits_cfi_is_br),
    .io_in_1_bits_cfi_is_jal                     (_f4_btb_corrections_io_deq_bits_cfi_is_jal),
    .io_in_1_bits_ghist_old_history              (_f4_btb_corrections_io_deq_bits_ghist_old_history),
    .io_in_1_bits_ghist_new_saw_branch_not_taken (_f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_not_taken),
    .io_in_1_bits_ghist_new_saw_branch_taken     (_f4_btb_corrections_io_deq_bits_ghist_new_saw_branch_taken),
    .io_in_1_bits_target                         (_f4_btb_corrections_io_deq_bits_target),
    .io_in_1_bits_meta_0                         (_f4_btb_corrections_io_deq_bits_meta_0),
    .io_in_1_bits_meta_1                         (_f4_btb_corrections_io_deq_bits_meta_1),
    .io_out_valid                                (_bpd_update_arbiter_io_out_valid),
    .io_out_bits_is_mispredict_update            (_bpd_update_arbiter_io_out_bits_is_mispredict_update),
    .io_out_bits_is_repair_update                (_bpd_update_arbiter_io_out_bits_is_repair_update),
    .io_out_bits_btb_mispredicts                 (_bpd_update_arbiter_io_out_bits_btb_mispredicts),
    .io_out_bits_pc                              (_bpd_update_arbiter_io_out_bits_pc),
    .io_out_bits_br_mask                         (_bpd_update_arbiter_io_out_bits_br_mask),
    .io_out_bits_cfi_idx_valid                   (_bpd_update_arbiter_io_out_bits_cfi_idx_valid),
    .io_out_bits_cfi_idx_bits                    (_bpd_update_arbiter_io_out_bits_cfi_idx_bits),
    .io_out_bits_cfi_taken                       (_bpd_update_arbiter_io_out_bits_cfi_taken),
    .io_out_bits_cfi_mispredicted                (_bpd_update_arbiter_io_out_bits_cfi_mispredicted),
    .io_out_bits_cfi_is_br                       (_bpd_update_arbiter_io_out_bits_cfi_is_br),
    .io_out_bits_cfi_is_jal                      (_bpd_update_arbiter_io_out_bits_cfi_is_jal),
    .io_out_bits_ghist_old_history               (_bpd_update_arbiter_io_out_bits_ghist_old_history),
    .io_out_bits_ghist_new_saw_branch_not_taken  (_bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_not_taken),
    .io_out_bits_ghist_new_saw_branch_taken      (_bpd_update_arbiter_io_out_bits_ghist_new_saw_branch_taken),
    .io_out_bits_target                          (_bpd_update_arbiter_io_out_bits_target),
    .io_out_bits_meta_0                          (_bpd_update_arbiter_io_out_bits_meta_0),
    .io_out_bits_meta_1                          (_bpd_update_arbiter_io_out_bits_meta_1)
  );
endmodule

