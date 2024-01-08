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

module BoomMSHRFile(
  input          clock,
                 reset,
  output         io_req_0_ready,
  input          io_req_0_valid,
  input  [6:0]   io_req_0_bits_uop_uopc,
  input  [31:0]  io_req_0_bits_uop_inst,
                 io_req_0_bits_uop_debug_inst,
  input          io_req_0_bits_uop_is_rvc,
  input  [39:0]  io_req_0_bits_uop_debug_pc,
  input  [2:0]   io_req_0_bits_uop_iq_type,
  input  [9:0]   io_req_0_bits_uop_fu_code,
  input  [3:0]   io_req_0_bits_uop_ctrl_br_type,
  input  [1:0]   io_req_0_bits_uop_ctrl_op1_sel,
  input  [2:0]   io_req_0_bits_uop_ctrl_op2_sel,
                 io_req_0_bits_uop_ctrl_imm_sel,
  input  [3:0]   io_req_0_bits_uop_ctrl_op_fcn,
  input          io_req_0_bits_uop_ctrl_fcn_dw,
  input  [2:0]   io_req_0_bits_uop_ctrl_csr_cmd,
  input          io_req_0_bits_uop_ctrl_is_load,
                 io_req_0_bits_uop_ctrl_is_sta,
                 io_req_0_bits_uop_ctrl_is_std,
  input  [1:0]   io_req_0_bits_uop_iw_state,
  input          io_req_0_bits_uop_iw_p1_poisoned,
                 io_req_0_bits_uop_iw_p2_poisoned,
                 io_req_0_bits_uop_is_br,
                 io_req_0_bits_uop_is_jalr,
                 io_req_0_bits_uop_is_jal,
                 io_req_0_bits_uop_is_sfb,
  input  [19:0]  io_req_0_bits_uop_br_mask,
  input  [4:0]   io_req_0_bits_uop_br_tag,
  input  [5:0]   io_req_0_bits_uop_ftq_idx,
  input          io_req_0_bits_uop_edge_inst,
  input  [5:0]   io_req_0_bits_uop_pc_lob,
  input          io_req_0_bits_uop_taken,
  input  [19:0]  io_req_0_bits_uop_imm_packed,
  input  [11:0]  io_req_0_bits_uop_csr_addr,
  input  [6:0]   io_req_0_bits_uop_rob_idx,
  input  [4:0]   io_req_0_bits_uop_ldq_idx,
                 io_req_0_bits_uop_stq_idx,
  input  [1:0]   io_req_0_bits_uop_rxq_idx,
  input  [6:0]   io_req_0_bits_uop_pdst,
                 io_req_0_bits_uop_prs1,
                 io_req_0_bits_uop_prs2,
                 io_req_0_bits_uop_prs3,
  input  [5:0]   io_req_0_bits_uop_ppred,
  input          io_req_0_bits_uop_prs1_busy,
                 io_req_0_bits_uop_prs2_busy,
                 io_req_0_bits_uop_prs3_busy,
                 io_req_0_bits_uop_ppred_busy,
  input  [6:0]   io_req_0_bits_uop_stale_pdst,
  input          io_req_0_bits_uop_exception,
  input  [63:0]  io_req_0_bits_uop_exc_cause,
  input          io_req_0_bits_uop_bypassable,
  input  [4:0]   io_req_0_bits_uop_mem_cmd,
  input  [1:0]   io_req_0_bits_uop_mem_size,
  input          io_req_0_bits_uop_mem_signed,
                 io_req_0_bits_uop_is_fence,
                 io_req_0_bits_uop_is_fencei,
                 io_req_0_bits_uop_is_amo,
                 io_req_0_bits_uop_uses_ldq,
                 io_req_0_bits_uop_uses_stq,
                 io_req_0_bits_uop_is_sys_pc2epc,
                 io_req_0_bits_uop_is_unique,
                 io_req_0_bits_uop_flush_on_commit,
                 io_req_0_bits_uop_ldst_is_rs1,
  input  [5:0]   io_req_0_bits_uop_ldst,
                 io_req_0_bits_uop_lrs1,
                 io_req_0_bits_uop_lrs2,
                 io_req_0_bits_uop_lrs3,
  input          io_req_0_bits_uop_ldst_val,
  input  [1:0]   io_req_0_bits_uop_dst_rtype,
                 io_req_0_bits_uop_lrs1_rtype,
                 io_req_0_bits_uop_lrs2_rtype,
  input          io_req_0_bits_uop_frs3_en,
                 io_req_0_bits_uop_fp_val,
                 io_req_0_bits_uop_fp_single,
                 io_req_0_bits_uop_xcpt_pf_if,
                 io_req_0_bits_uop_xcpt_ae_if,
                 io_req_0_bits_uop_xcpt_ma_if,
                 io_req_0_bits_uop_bp_debug_if,
                 io_req_0_bits_uop_bp_xcpt_if,
  input  [1:0]   io_req_0_bits_uop_debug_fsrc,
                 io_req_0_bits_uop_debug_tsrc,
  input  [39:0]  io_req_0_bits_addr,
  input  [63:0]  io_req_0_bits_data,
  input          io_req_0_bits_is_hella,
                 io_req_0_bits_tag_match,
  input  [1:0]   io_req_0_bits_old_meta_coh_state,
  input  [20:0]  io_req_0_bits_old_meta_tag,
  input  [7:0]   io_req_0_bits_way_en,
  output         io_req_1_ready,
  input          io_req_1_valid,
  input  [6:0]   io_req_1_bits_uop_uopc,
  input  [31:0]  io_req_1_bits_uop_inst,
                 io_req_1_bits_uop_debug_inst,
  input          io_req_1_bits_uop_is_rvc,
  input  [39:0]  io_req_1_bits_uop_debug_pc,
  input  [2:0]   io_req_1_bits_uop_iq_type,
  input  [9:0]   io_req_1_bits_uop_fu_code,
  input  [3:0]   io_req_1_bits_uop_ctrl_br_type,
  input  [1:0]   io_req_1_bits_uop_ctrl_op1_sel,
  input  [2:0]   io_req_1_bits_uop_ctrl_op2_sel,
                 io_req_1_bits_uop_ctrl_imm_sel,
  input  [3:0]   io_req_1_bits_uop_ctrl_op_fcn,
  input          io_req_1_bits_uop_ctrl_fcn_dw,
  input  [2:0]   io_req_1_bits_uop_ctrl_csr_cmd,
  input          io_req_1_bits_uop_ctrl_is_load,
                 io_req_1_bits_uop_ctrl_is_sta,
                 io_req_1_bits_uop_ctrl_is_std,
  input  [1:0]   io_req_1_bits_uop_iw_state,
  input          io_req_1_bits_uop_iw_p1_poisoned,
                 io_req_1_bits_uop_iw_p2_poisoned,
                 io_req_1_bits_uop_is_br,
                 io_req_1_bits_uop_is_jalr,
                 io_req_1_bits_uop_is_jal,
                 io_req_1_bits_uop_is_sfb,
  input  [19:0]  io_req_1_bits_uop_br_mask,
  input  [4:0]   io_req_1_bits_uop_br_tag,
  input  [5:0]   io_req_1_bits_uop_ftq_idx,
  input          io_req_1_bits_uop_edge_inst,
  input  [5:0]   io_req_1_bits_uop_pc_lob,
  input          io_req_1_bits_uop_taken,
  input  [19:0]  io_req_1_bits_uop_imm_packed,
  input  [11:0]  io_req_1_bits_uop_csr_addr,
  input  [6:0]   io_req_1_bits_uop_rob_idx,
  input  [4:0]   io_req_1_bits_uop_ldq_idx,
                 io_req_1_bits_uop_stq_idx,
  input  [1:0]   io_req_1_bits_uop_rxq_idx,
  input  [6:0]   io_req_1_bits_uop_pdst,
                 io_req_1_bits_uop_prs1,
                 io_req_1_bits_uop_prs2,
                 io_req_1_bits_uop_prs3,
  input  [5:0]   io_req_1_bits_uop_ppred,
  input          io_req_1_bits_uop_prs1_busy,
                 io_req_1_bits_uop_prs2_busy,
                 io_req_1_bits_uop_prs3_busy,
                 io_req_1_bits_uop_ppred_busy,
  input  [6:0]   io_req_1_bits_uop_stale_pdst,
  input          io_req_1_bits_uop_exception,
  input  [63:0]  io_req_1_bits_uop_exc_cause,
  input          io_req_1_bits_uop_bypassable,
  input  [4:0]   io_req_1_bits_uop_mem_cmd,
  input  [1:0]   io_req_1_bits_uop_mem_size,
  input          io_req_1_bits_uop_mem_signed,
                 io_req_1_bits_uop_is_fence,
                 io_req_1_bits_uop_is_fencei,
                 io_req_1_bits_uop_is_amo,
                 io_req_1_bits_uop_uses_ldq,
                 io_req_1_bits_uop_uses_stq,
                 io_req_1_bits_uop_is_sys_pc2epc,
                 io_req_1_bits_uop_is_unique,
                 io_req_1_bits_uop_flush_on_commit,
                 io_req_1_bits_uop_ldst_is_rs1,
  input  [5:0]   io_req_1_bits_uop_ldst,
                 io_req_1_bits_uop_lrs1,
                 io_req_1_bits_uop_lrs2,
                 io_req_1_bits_uop_lrs3,
  input          io_req_1_bits_uop_ldst_val,
  input  [1:0]   io_req_1_bits_uop_dst_rtype,
                 io_req_1_bits_uop_lrs1_rtype,
                 io_req_1_bits_uop_lrs2_rtype,
  input          io_req_1_bits_uop_frs3_en,
                 io_req_1_bits_uop_fp_val,
                 io_req_1_bits_uop_fp_single,
                 io_req_1_bits_uop_xcpt_pf_if,
                 io_req_1_bits_uop_xcpt_ae_if,
                 io_req_1_bits_uop_xcpt_ma_if,
                 io_req_1_bits_uop_bp_debug_if,
                 io_req_1_bits_uop_bp_xcpt_if,
  input  [1:0]   io_req_1_bits_uop_debug_fsrc,
                 io_req_1_bits_uop_debug_tsrc,
  input  [39:0]  io_req_1_bits_addr,
  input  [63:0]  io_req_1_bits_data,
  input          io_req_1_bits_is_hella,
                 io_req_1_bits_tag_match,
  input  [1:0]   io_req_1_bits_old_meta_coh_state,
  input  [20:0]  io_req_1_bits_old_meta_tag,
  input  [7:0]   io_req_1_bits_way_en,
  input          io_req_is_probe_0,
                 io_req_is_probe_1,
                 io_resp_ready,
  output         io_resp_valid,
  output [19:0]  io_resp_bits_uop_br_mask,
  output [4:0]   io_resp_bits_uop_ldq_idx,
                 io_resp_bits_uop_stq_idx,
  output         io_resp_bits_uop_is_amo,
                 io_resp_bits_uop_uses_ldq,
                 io_resp_bits_uop_uses_stq,
  output [63:0]  io_resp_bits_data,
  output         io_resp_bits_is_hella,
                 io_secondary_miss_0,
                 io_secondary_miss_1,
                 io_block_hit_0,
                 io_block_hit_1,
  input  [19:0]  io_brupdate_b1_resolve_mask,
                 io_brupdate_b1_mispredict_mask,
  input          io_exception,
                 io_mem_acquire_ready,
  output         io_mem_acquire_valid,
  output [2:0]   io_mem_acquire_bits_opcode,
                 io_mem_acquire_bits_param,
  output [3:0]   io_mem_acquire_bits_size,
                 io_mem_acquire_bits_source,
  output [32:0]  io_mem_acquire_bits_address,
  output [15:0]  io_mem_acquire_bits_mask,
  output [127:0] io_mem_acquire_bits_data,
  output         io_mem_grant_ready,
  input          io_mem_grant_valid,
  input  [2:0]   io_mem_grant_bits_opcode,
  input  [1:0]   io_mem_grant_bits_param,
  input  [3:0]   io_mem_grant_bits_size,
                 io_mem_grant_bits_source,
  input  [2:0]   io_mem_grant_bits_sink,
  input  [127:0] io_mem_grant_bits_data,
  input          io_mem_finish_ready,
  output         io_mem_finish_valid,
  output [2:0]   io_mem_finish_bits_sink,
  input          io_refill_ready,
  output         io_refill_valid,
  output [7:0]   io_refill_bits_way_en,
  output [11:0]  io_refill_bits_addr,
  output [127:0] io_refill_bits_data,
  input          io_meta_write_ready,
  output         io_meta_write_valid,
  output [5:0]   io_meta_write_bits_idx,
  output [7:0]   io_meta_write_bits_way_en,
  output [1:0]   io_meta_write_bits_data_coh_state,
  output [20:0]  io_meta_write_bits_data_tag,
  input          io_meta_read_ready,
  output         io_meta_read_valid,
  output [5:0]   io_meta_read_bits_idx,
  output [7:0]   io_meta_read_bits_way_en,
  output [20:0]  io_meta_read_bits_tag,
  input          io_meta_resp_valid,
  input  [1:0]   io_meta_resp_bits_coh_state,
  input          io_replay_ready,
  output         io_replay_valid,
  output [6:0]   io_replay_bits_uop_uopc,
  output [31:0]  io_replay_bits_uop_inst,
                 io_replay_bits_uop_debug_inst,
  output         io_replay_bits_uop_is_rvc,
  output [39:0]  io_replay_bits_uop_debug_pc,
  output [2:0]   io_replay_bits_uop_iq_type,
  output [9:0]   io_replay_bits_uop_fu_code,
  output [3:0]   io_replay_bits_uop_ctrl_br_type,
  output [1:0]   io_replay_bits_uop_ctrl_op1_sel,
  output [2:0]   io_replay_bits_uop_ctrl_op2_sel,
                 io_replay_bits_uop_ctrl_imm_sel,
  output [3:0]   io_replay_bits_uop_ctrl_op_fcn,
  output         io_replay_bits_uop_ctrl_fcn_dw,
  output [2:0]   io_replay_bits_uop_ctrl_csr_cmd,
  output         io_replay_bits_uop_ctrl_is_load,
                 io_replay_bits_uop_ctrl_is_sta,
                 io_replay_bits_uop_ctrl_is_std,
  output [1:0]   io_replay_bits_uop_iw_state,
  output         io_replay_bits_uop_iw_p1_poisoned,
                 io_replay_bits_uop_iw_p2_poisoned,
                 io_replay_bits_uop_is_br,
                 io_replay_bits_uop_is_jalr,
                 io_replay_bits_uop_is_jal,
                 io_replay_bits_uop_is_sfb,
  output [19:0]  io_replay_bits_uop_br_mask,
  output [4:0]   io_replay_bits_uop_br_tag,
  output [5:0]   io_replay_bits_uop_ftq_idx,
  output         io_replay_bits_uop_edge_inst,
  output [5:0]   io_replay_bits_uop_pc_lob,
  output         io_replay_bits_uop_taken,
  output [19:0]  io_replay_bits_uop_imm_packed,
  output [11:0]  io_replay_bits_uop_csr_addr,
  output [6:0]   io_replay_bits_uop_rob_idx,
  output [4:0]   io_replay_bits_uop_ldq_idx,
                 io_replay_bits_uop_stq_idx,
  output [1:0]   io_replay_bits_uop_rxq_idx,
  output [6:0]   io_replay_bits_uop_pdst,
                 io_replay_bits_uop_prs1,
                 io_replay_bits_uop_prs2,
                 io_replay_bits_uop_prs3,
  output [5:0]   io_replay_bits_uop_ppred,
  output         io_replay_bits_uop_prs1_busy,
                 io_replay_bits_uop_prs2_busy,
                 io_replay_bits_uop_prs3_busy,
                 io_replay_bits_uop_ppred_busy,
  output [6:0]   io_replay_bits_uop_stale_pdst,
  output         io_replay_bits_uop_exception,
  output [63:0]  io_replay_bits_uop_exc_cause,
  output         io_replay_bits_uop_bypassable,
  output [4:0]   io_replay_bits_uop_mem_cmd,
  output [1:0]   io_replay_bits_uop_mem_size,
  output         io_replay_bits_uop_mem_signed,
                 io_replay_bits_uop_is_fence,
                 io_replay_bits_uop_is_fencei,
                 io_replay_bits_uop_is_amo,
                 io_replay_bits_uop_uses_ldq,
                 io_replay_bits_uop_uses_stq,
                 io_replay_bits_uop_is_sys_pc2epc,
                 io_replay_bits_uop_is_unique,
                 io_replay_bits_uop_flush_on_commit,
                 io_replay_bits_uop_ldst_is_rs1,
  output [5:0]   io_replay_bits_uop_ldst,
                 io_replay_bits_uop_lrs1,
                 io_replay_bits_uop_lrs2,
                 io_replay_bits_uop_lrs3,
  output         io_replay_bits_uop_ldst_val,
  output [1:0]   io_replay_bits_uop_dst_rtype,
                 io_replay_bits_uop_lrs1_rtype,
                 io_replay_bits_uop_lrs2_rtype,
  output         io_replay_bits_uop_frs3_en,
                 io_replay_bits_uop_fp_val,
                 io_replay_bits_uop_fp_single,
                 io_replay_bits_uop_xcpt_pf_if,
                 io_replay_bits_uop_xcpt_ae_if,
                 io_replay_bits_uop_xcpt_ma_if,
                 io_replay_bits_uop_bp_debug_if,
                 io_replay_bits_uop_bp_xcpt_if,
  output [1:0]   io_replay_bits_uop_debug_fsrc,
                 io_replay_bits_uop_debug_tsrc,
  output [39:0]  io_replay_bits_addr,
  output [63:0]  io_replay_bits_data,
  output         io_replay_bits_is_hella,
  output [7:0]   io_replay_bits_way_en,
  input          io_prefetch_ready,
  output         io_prefetch_valid,
  output [4:0]   io_prefetch_bits_uop_mem_cmd,
  output [39:0]  io_prefetch_bits_addr,
  input          io_wb_req_ready,
  output         io_wb_req_valid,
  output [20:0]  io_wb_req_bits_tag,
  output [5:0]   io_wb_req_bits_idx,
  output [2:0]   io_wb_req_bits_param,
  output [7:0]   io_wb_req_bits_way_en,
  input          io_prober_state_valid,
  input  [39:0]  io_prober_state_bits,
  input          io_clear_all,
                 io_wb_resp,
  output         io_fence_rdy,
                 io_probe_rdy
);

  wire         _io_req_1_ready_output;
  wire         _io_req_0_ready_output;
  reg  [2:0]   mshr_alloc_idx_REG;
  wire         _way_matches_1_7_T;
  wire         _tag_matches_1_7_T_1;
  wire         idx_matches_1_7;
  wire         _way_matches_0_7_T;
  wire         _tag_matches_0_7_T_1;
  wire         idx_matches_0_7;
  wire         _way_matches_1_6_T;
  wire         _tag_matches_1_6_T_1;
  wire         idx_matches_1_6;
  wire         _way_matches_0_6_T;
  wire         _tag_matches_0_6_T_1;
  wire         idx_matches_0_6;
  wire         _way_matches_1_5_T;
  wire         _tag_matches_1_5_T_1;
  wire         idx_matches_1_5;
  wire         _way_matches_0_5_T;
  wire         _tag_matches_0_5_T_1;
  wire         idx_matches_0_5;
  wire         _way_matches_1_4_T;
  wire         _tag_matches_1_4_T_1;
  wire         idx_matches_1_4;
  wire         _way_matches_0_4_T;
  wire         _tag_matches_0_4_T_1;
  wire         idx_matches_0_4;
  wire         _way_matches_1_3_T;
  wire         _tag_matches_1_3_T_1;
  wire         idx_matches_1_3;
  wire         _way_matches_0_3_T;
  wire         _tag_matches_0_3_T_1;
  wire         idx_matches_0_3;
  wire         _way_matches_1_2_T;
  wire         _tag_matches_1_2_T_1;
  wire         idx_matches_1_2;
  wire         _way_matches_0_2_T;
  wire         _tag_matches_0_2_T_1;
  wire         idx_matches_0_2;
  wire         _way_matches_1_1_T;
  wire         _tag_matches_1_1_T_1;
  wire         idx_matches_1_1;
  wire         _way_matches_0_1_T;
  wire         _tag_matches_0_1_T_1;
  wire         idx_matches_0_1;
  wire         _way_matches_1_0_T;
  wire         _tag_matches_1_0_T_1;
  wire         idx_matches_1_0;
  wire         _way_matches_0_0_T;
  wire         _tag_matches_0_0_T_1;
  wire         idx_matches_0_0;
  wire         _respq_io_enq_ready;
  wire         _mmios_0_io_req_ready;
  wire         _mmios_0_io_resp_valid;
  wire [6:0]   _mmios_0_io_resp_bits_uop_uopc;
  wire [31:0]  _mmios_0_io_resp_bits_uop_inst;
  wire [31:0]  _mmios_0_io_resp_bits_uop_debug_inst;
  wire         _mmios_0_io_resp_bits_uop_is_rvc;
  wire [39:0]  _mmios_0_io_resp_bits_uop_debug_pc;
  wire [2:0]   _mmios_0_io_resp_bits_uop_iq_type;
  wire [9:0]   _mmios_0_io_resp_bits_uop_fu_code;
  wire [3:0]   _mmios_0_io_resp_bits_uop_ctrl_br_type;
  wire [1:0]   _mmios_0_io_resp_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mmios_0_io_resp_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mmios_0_io_resp_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mmios_0_io_resp_bits_uop_ctrl_op_fcn;
  wire         _mmios_0_io_resp_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mmios_0_io_resp_bits_uop_ctrl_csr_cmd;
  wire         _mmios_0_io_resp_bits_uop_ctrl_is_load;
  wire         _mmios_0_io_resp_bits_uop_ctrl_is_sta;
  wire         _mmios_0_io_resp_bits_uop_ctrl_is_std;
  wire [1:0]   _mmios_0_io_resp_bits_uop_iw_state;
  wire         _mmios_0_io_resp_bits_uop_iw_p1_poisoned;
  wire         _mmios_0_io_resp_bits_uop_iw_p2_poisoned;
  wire         _mmios_0_io_resp_bits_uop_is_br;
  wire         _mmios_0_io_resp_bits_uop_is_jalr;
  wire         _mmios_0_io_resp_bits_uop_is_jal;
  wire         _mmios_0_io_resp_bits_uop_is_sfb;
  wire [19:0]  _mmios_0_io_resp_bits_uop_br_mask;
  wire [4:0]   _mmios_0_io_resp_bits_uop_br_tag;
  wire [5:0]   _mmios_0_io_resp_bits_uop_ftq_idx;
  wire         _mmios_0_io_resp_bits_uop_edge_inst;
  wire [5:0]   _mmios_0_io_resp_bits_uop_pc_lob;
  wire         _mmios_0_io_resp_bits_uop_taken;
  wire [19:0]  _mmios_0_io_resp_bits_uop_imm_packed;
  wire [11:0]  _mmios_0_io_resp_bits_uop_csr_addr;
  wire [6:0]   _mmios_0_io_resp_bits_uop_rob_idx;
  wire [4:0]   _mmios_0_io_resp_bits_uop_ldq_idx;
  wire [4:0]   _mmios_0_io_resp_bits_uop_stq_idx;
  wire [1:0]   _mmios_0_io_resp_bits_uop_rxq_idx;
  wire [6:0]   _mmios_0_io_resp_bits_uop_pdst;
  wire [6:0]   _mmios_0_io_resp_bits_uop_prs1;
  wire [6:0]   _mmios_0_io_resp_bits_uop_prs2;
  wire [6:0]   _mmios_0_io_resp_bits_uop_prs3;
  wire [5:0]   _mmios_0_io_resp_bits_uop_ppred;
  wire         _mmios_0_io_resp_bits_uop_prs1_busy;
  wire         _mmios_0_io_resp_bits_uop_prs2_busy;
  wire         _mmios_0_io_resp_bits_uop_prs3_busy;
  wire         _mmios_0_io_resp_bits_uop_ppred_busy;
  wire [6:0]   _mmios_0_io_resp_bits_uop_stale_pdst;
  wire         _mmios_0_io_resp_bits_uop_exception;
  wire [63:0]  _mmios_0_io_resp_bits_uop_exc_cause;
  wire         _mmios_0_io_resp_bits_uop_bypassable;
  wire [4:0]   _mmios_0_io_resp_bits_uop_mem_cmd;
  wire [1:0]   _mmios_0_io_resp_bits_uop_mem_size;
  wire         _mmios_0_io_resp_bits_uop_mem_signed;
  wire         _mmios_0_io_resp_bits_uop_is_fence;
  wire         _mmios_0_io_resp_bits_uop_is_fencei;
  wire         _mmios_0_io_resp_bits_uop_is_amo;
  wire         _mmios_0_io_resp_bits_uop_uses_ldq;
  wire         _mmios_0_io_resp_bits_uop_uses_stq;
  wire         _mmios_0_io_resp_bits_uop_is_sys_pc2epc;
  wire         _mmios_0_io_resp_bits_uop_is_unique;
  wire         _mmios_0_io_resp_bits_uop_flush_on_commit;
  wire         _mmios_0_io_resp_bits_uop_ldst_is_rs1;
  wire [5:0]   _mmios_0_io_resp_bits_uop_ldst;
  wire [5:0]   _mmios_0_io_resp_bits_uop_lrs1;
  wire [5:0]   _mmios_0_io_resp_bits_uop_lrs2;
  wire [5:0]   _mmios_0_io_resp_bits_uop_lrs3;
  wire         _mmios_0_io_resp_bits_uop_ldst_val;
  wire [1:0]   _mmios_0_io_resp_bits_uop_dst_rtype;
  wire [1:0]   _mmios_0_io_resp_bits_uop_lrs1_rtype;
  wire [1:0]   _mmios_0_io_resp_bits_uop_lrs2_rtype;
  wire         _mmios_0_io_resp_bits_uop_frs3_en;
  wire         _mmios_0_io_resp_bits_uop_fp_val;
  wire         _mmios_0_io_resp_bits_uop_fp_single;
  wire         _mmios_0_io_resp_bits_uop_xcpt_pf_if;
  wire         _mmios_0_io_resp_bits_uop_xcpt_ae_if;
  wire         _mmios_0_io_resp_bits_uop_xcpt_ma_if;
  wire         _mmios_0_io_resp_bits_uop_bp_debug_if;
  wire         _mmios_0_io_resp_bits_uop_bp_xcpt_if;
  wire [1:0]   _mmios_0_io_resp_bits_uop_debug_fsrc;
  wire [1:0]   _mmios_0_io_resp_bits_uop_debug_tsrc;
  wire [63:0]  _mmios_0_io_resp_bits_data;
  wire         _mmios_0_io_resp_bits_is_hella;
  wire         _mmios_0_io_mem_access_valid;
  wire [2:0]   _mmios_0_io_mem_access_bits_opcode;
  wire [2:0]   _mmios_0_io_mem_access_bits_param;
  wire [3:0]   _mmios_0_io_mem_access_bits_size;
  wire [3:0]   _mmios_0_io_mem_access_bits_source;
  wire [32:0]  _mmios_0_io_mem_access_bits_address;
  wire [15:0]  _mmios_0_io_mem_access_bits_mask;
  wire [127:0] _mmios_0_io_mem_access_bits_data;
  wire         _mmio_alloc_arb_io_in_0_ready;
  wire         _mshrs_7_io_req_pri_rdy;
  wire         _mshrs_7_io_req_sec_rdy;
  wire         _mshrs_7_io_idx_valid;
  wire [5:0]   _mshrs_7_io_idx_bits;
  wire         _mshrs_7_io_way_valid;
  wire [7:0]   _mshrs_7_io_way_bits;
  wire         _mshrs_7_io_tag_valid;
  wire [27:0]  _mshrs_7_io_tag_bits;
  wire         _mshrs_7_io_mem_acquire_valid;
  wire [2:0]   _mshrs_7_io_mem_acquire_bits_param;
  wire [3:0]   _mshrs_7_io_mem_acquire_bits_source;
  wire [32:0]  _mshrs_7_io_mem_acquire_bits_address;
  wire         _mshrs_7_io_mem_grant_ready;
  wire         _mshrs_7_io_mem_finish_valid;
  wire [2:0]   _mshrs_7_io_mem_finish_bits_sink;
  wire         _mshrs_7_io_refill_valid;
  wire [7:0]   _mshrs_7_io_refill_bits_way_en;
  wire [11:0]  _mshrs_7_io_refill_bits_addr;
  wire [127:0] _mshrs_7_io_refill_bits_data;
  wire         _mshrs_7_io_meta_write_valid;
  wire [5:0]   _mshrs_7_io_meta_write_bits_idx;
  wire [7:0]   _mshrs_7_io_meta_write_bits_way_en;
  wire [1:0]   _mshrs_7_io_meta_write_bits_data_coh_state;
  wire [20:0]  _mshrs_7_io_meta_write_bits_data_tag;
  wire         _mshrs_7_io_meta_read_valid;
  wire [5:0]   _mshrs_7_io_meta_read_bits_idx;
  wire [7:0]   _mshrs_7_io_meta_read_bits_way_en;
  wire [20:0]  _mshrs_7_io_meta_read_bits_tag;
  wire         _mshrs_7_io_wb_req_valid;
  wire [20:0]  _mshrs_7_io_wb_req_bits_tag;
  wire [5:0]   _mshrs_7_io_wb_req_bits_idx;
  wire [2:0]   _mshrs_7_io_wb_req_bits_param;
  wire [7:0]   _mshrs_7_io_wb_req_bits_way_en;
  wire         _mshrs_7_io_commit_val;
  wire [39:0]  _mshrs_7_io_commit_addr;
  wire [1:0]   _mshrs_7_io_commit_coh_state;
  wire         _mshrs_7_io_lb_read_valid;
  wire [2:0]   _mshrs_7_io_lb_read_bits_id;
  wire [1:0]   _mshrs_7_io_lb_read_bits_offset;
  wire         _mshrs_7_io_lb_write_valid;
  wire [2:0]   _mshrs_7_io_lb_write_bits_id;
  wire [1:0]   _mshrs_7_io_lb_write_bits_offset;
  wire [127:0] _mshrs_7_io_lb_write_bits_data;
  wire         _mshrs_7_io_replay_valid;
  wire [6:0]   _mshrs_7_io_replay_bits_uop_uopc;
  wire [31:0]  _mshrs_7_io_replay_bits_uop_inst;
  wire [31:0]  _mshrs_7_io_replay_bits_uop_debug_inst;
  wire         _mshrs_7_io_replay_bits_uop_is_rvc;
  wire [39:0]  _mshrs_7_io_replay_bits_uop_debug_pc;
  wire [2:0]   _mshrs_7_io_replay_bits_uop_iq_type;
  wire [9:0]   _mshrs_7_io_replay_bits_uop_fu_code;
  wire [3:0]   _mshrs_7_io_replay_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_7_io_replay_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_7_io_replay_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_7_io_replay_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_7_io_replay_bits_uop_ctrl_op_fcn;
  wire         _mshrs_7_io_replay_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_7_io_replay_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_7_io_replay_bits_uop_ctrl_is_load;
  wire         _mshrs_7_io_replay_bits_uop_ctrl_is_sta;
  wire         _mshrs_7_io_replay_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_7_io_replay_bits_uop_iw_state;
  wire         _mshrs_7_io_replay_bits_uop_iw_p1_poisoned;
  wire         _mshrs_7_io_replay_bits_uop_iw_p2_poisoned;
  wire         _mshrs_7_io_replay_bits_uop_is_br;
  wire         _mshrs_7_io_replay_bits_uop_is_jalr;
  wire         _mshrs_7_io_replay_bits_uop_is_jal;
  wire         _mshrs_7_io_replay_bits_uop_is_sfb;
  wire [19:0]  _mshrs_7_io_replay_bits_uop_br_mask;
  wire [4:0]   _mshrs_7_io_replay_bits_uop_br_tag;
  wire [5:0]   _mshrs_7_io_replay_bits_uop_ftq_idx;
  wire         _mshrs_7_io_replay_bits_uop_edge_inst;
  wire [5:0]   _mshrs_7_io_replay_bits_uop_pc_lob;
  wire         _mshrs_7_io_replay_bits_uop_taken;
  wire [19:0]  _mshrs_7_io_replay_bits_uop_imm_packed;
  wire [11:0]  _mshrs_7_io_replay_bits_uop_csr_addr;
  wire [6:0]   _mshrs_7_io_replay_bits_uop_rob_idx;
  wire [4:0]   _mshrs_7_io_replay_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_7_io_replay_bits_uop_stq_idx;
  wire [1:0]   _mshrs_7_io_replay_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_7_io_replay_bits_uop_pdst;
  wire [6:0]   _mshrs_7_io_replay_bits_uop_prs1;
  wire [6:0]   _mshrs_7_io_replay_bits_uop_prs2;
  wire [6:0]   _mshrs_7_io_replay_bits_uop_prs3;
  wire [5:0]   _mshrs_7_io_replay_bits_uop_ppred;
  wire         _mshrs_7_io_replay_bits_uop_prs1_busy;
  wire         _mshrs_7_io_replay_bits_uop_prs2_busy;
  wire         _mshrs_7_io_replay_bits_uop_prs3_busy;
  wire         _mshrs_7_io_replay_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_7_io_replay_bits_uop_stale_pdst;
  wire         _mshrs_7_io_replay_bits_uop_exception;
  wire [63:0]  _mshrs_7_io_replay_bits_uop_exc_cause;
  wire         _mshrs_7_io_replay_bits_uop_bypassable;
  wire [4:0]   _mshrs_7_io_replay_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_7_io_replay_bits_uop_mem_size;
  wire         _mshrs_7_io_replay_bits_uop_mem_signed;
  wire         _mshrs_7_io_replay_bits_uop_is_fence;
  wire         _mshrs_7_io_replay_bits_uop_is_fencei;
  wire         _mshrs_7_io_replay_bits_uop_is_amo;
  wire         _mshrs_7_io_replay_bits_uop_uses_ldq;
  wire         _mshrs_7_io_replay_bits_uop_uses_stq;
  wire         _mshrs_7_io_replay_bits_uop_is_sys_pc2epc;
  wire         _mshrs_7_io_replay_bits_uop_is_unique;
  wire         _mshrs_7_io_replay_bits_uop_flush_on_commit;
  wire         _mshrs_7_io_replay_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_7_io_replay_bits_uop_ldst;
  wire [5:0]   _mshrs_7_io_replay_bits_uop_lrs1;
  wire [5:0]   _mshrs_7_io_replay_bits_uop_lrs2;
  wire [5:0]   _mshrs_7_io_replay_bits_uop_lrs3;
  wire         _mshrs_7_io_replay_bits_uop_ldst_val;
  wire [1:0]   _mshrs_7_io_replay_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_7_io_replay_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_7_io_replay_bits_uop_lrs2_rtype;
  wire         _mshrs_7_io_replay_bits_uop_frs3_en;
  wire         _mshrs_7_io_replay_bits_uop_fp_val;
  wire         _mshrs_7_io_replay_bits_uop_fp_single;
  wire         _mshrs_7_io_replay_bits_uop_xcpt_pf_if;
  wire         _mshrs_7_io_replay_bits_uop_xcpt_ae_if;
  wire         _mshrs_7_io_replay_bits_uop_xcpt_ma_if;
  wire         _mshrs_7_io_replay_bits_uop_bp_debug_if;
  wire         _mshrs_7_io_replay_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_7_io_replay_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_7_io_replay_bits_uop_debug_tsrc;
  wire [39:0]  _mshrs_7_io_replay_bits_addr;
  wire         _mshrs_7_io_replay_bits_is_hella;
  wire [7:0]   _mshrs_7_io_replay_bits_way_en;
  wire [4:0]   _mshrs_7_io_replay_bits_sdq_id;
  wire         _mshrs_7_io_resp_valid;
  wire [6:0]   _mshrs_7_io_resp_bits_uop_uopc;
  wire [31:0]  _mshrs_7_io_resp_bits_uop_inst;
  wire [31:0]  _mshrs_7_io_resp_bits_uop_debug_inst;
  wire         _mshrs_7_io_resp_bits_uop_is_rvc;
  wire [39:0]  _mshrs_7_io_resp_bits_uop_debug_pc;
  wire [2:0]   _mshrs_7_io_resp_bits_uop_iq_type;
  wire [9:0]   _mshrs_7_io_resp_bits_uop_fu_code;
  wire [3:0]   _mshrs_7_io_resp_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_7_io_resp_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_7_io_resp_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_7_io_resp_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_7_io_resp_bits_uop_ctrl_op_fcn;
  wire         _mshrs_7_io_resp_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_7_io_resp_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_7_io_resp_bits_uop_ctrl_is_load;
  wire         _mshrs_7_io_resp_bits_uop_ctrl_is_sta;
  wire         _mshrs_7_io_resp_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_7_io_resp_bits_uop_iw_state;
  wire         _mshrs_7_io_resp_bits_uop_iw_p1_poisoned;
  wire         _mshrs_7_io_resp_bits_uop_iw_p2_poisoned;
  wire         _mshrs_7_io_resp_bits_uop_is_br;
  wire         _mshrs_7_io_resp_bits_uop_is_jalr;
  wire         _mshrs_7_io_resp_bits_uop_is_jal;
  wire         _mshrs_7_io_resp_bits_uop_is_sfb;
  wire [19:0]  _mshrs_7_io_resp_bits_uop_br_mask;
  wire [4:0]   _mshrs_7_io_resp_bits_uop_br_tag;
  wire [5:0]   _mshrs_7_io_resp_bits_uop_ftq_idx;
  wire         _mshrs_7_io_resp_bits_uop_edge_inst;
  wire [5:0]   _mshrs_7_io_resp_bits_uop_pc_lob;
  wire         _mshrs_7_io_resp_bits_uop_taken;
  wire [19:0]  _mshrs_7_io_resp_bits_uop_imm_packed;
  wire [11:0]  _mshrs_7_io_resp_bits_uop_csr_addr;
  wire [6:0]   _mshrs_7_io_resp_bits_uop_rob_idx;
  wire [4:0]   _mshrs_7_io_resp_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_7_io_resp_bits_uop_stq_idx;
  wire [1:0]   _mshrs_7_io_resp_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_7_io_resp_bits_uop_pdst;
  wire [6:0]   _mshrs_7_io_resp_bits_uop_prs1;
  wire [6:0]   _mshrs_7_io_resp_bits_uop_prs2;
  wire [6:0]   _mshrs_7_io_resp_bits_uop_prs3;
  wire [5:0]   _mshrs_7_io_resp_bits_uop_ppred;
  wire         _mshrs_7_io_resp_bits_uop_prs1_busy;
  wire         _mshrs_7_io_resp_bits_uop_prs2_busy;
  wire         _mshrs_7_io_resp_bits_uop_prs3_busy;
  wire         _mshrs_7_io_resp_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_7_io_resp_bits_uop_stale_pdst;
  wire         _mshrs_7_io_resp_bits_uop_exception;
  wire [63:0]  _mshrs_7_io_resp_bits_uop_exc_cause;
  wire         _mshrs_7_io_resp_bits_uop_bypassable;
  wire [4:0]   _mshrs_7_io_resp_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_7_io_resp_bits_uop_mem_size;
  wire         _mshrs_7_io_resp_bits_uop_mem_signed;
  wire         _mshrs_7_io_resp_bits_uop_is_fence;
  wire         _mshrs_7_io_resp_bits_uop_is_fencei;
  wire         _mshrs_7_io_resp_bits_uop_is_amo;
  wire         _mshrs_7_io_resp_bits_uop_uses_ldq;
  wire         _mshrs_7_io_resp_bits_uop_uses_stq;
  wire         _mshrs_7_io_resp_bits_uop_is_sys_pc2epc;
  wire         _mshrs_7_io_resp_bits_uop_is_unique;
  wire         _mshrs_7_io_resp_bits_uop_flush_on_commit;
  wire         _mshrs_7_io_resp_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_7_io_resp_bits_uop_ldst;
  wire [5:0]   _mshrs_7_io_resp_bits_uop_lrs1;
  wire [5:0]   _mshrs_7_io_resp_bits_uop_lrs2;
  wire [5:0]   _mshrs_7_io_resp_bits_uop_lrs3;
  wire         _mshrs_7_io_resp_bits_uop_ldst_val;
  wire [1:0]   _mshrs_7_io_resp_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_7_io_resp_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_7_io_resp_bits_uop_lrs2_rtype;
  wire         _mshrs_7_io_resp_bits_uop_frs3_en;
  wire         _mshrs_7_io_resp_bits_uop_fp_val;
  wire         _mshrs_7_io_resp_bits_uop_fp_single;
  wire         _mshrs_7_io_resp_bits_uop_xcpt_pf_if;
  wire         _mshrs_7_io_resp_bits_uop_xcpt_ae_if;
  wire         _mshrs_7_io_resp_bits_uop_xcpt_ma_if;
  wire         _mshrs_7_io_resp_bits_uop_bp_debug_if;
  wire         _mshrs_7_io_resp_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_7_io_resp_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_7_io_resp_bits_uop_debug_tsrc;
  wire [63:0]  _mshrs_7_io_resp_bits_data;
  wire         _mshrs_7_io_resp_bits_is_hella;
  wire         _mshrs_7_io_probe_rdy;
  wire         _mshrs_6_io_req_pri_rdy;
  wire         _mshrs_6_io_req_sec_rdy;
  wire         _mshrs_6_io_idx_valid;
  wire [5:0]   _mshrs_6_io_idx_bits;
  wire         _mshrs_6_io_way_valid;
  wire [7:0]   _mshrs_6_io_way_bits;
  wire         _mshrs_6_io_tag_valid;
  wire [27:0]  _mshrs_6_io_tag_bits;
  wire         _mshrs_6_io_mem_acquire_valid;
  wire [2:0]   _mshrs_6_io_mem_acquire_bits_param;
  wire [3:0]   _mshrs_6_io_mem_acquire_bits_source;
  wire [32:0]  _mshrs_6_io_mem_acquire_bits_address;
  wire         _mshrs_6_io_mem_grant_ready;
  wire         _mshrs_6_io_mem_finish_valid;
  wire [2:0]   _mshrs_6_io_mem_finish_bits_sink;
  wire         _mshrs_6_io_refill_valid;
  wire [7:0]   _mshrs_6_io_refill_bits_way_en;
  wire [11:0]  _mshrs_6_io_refill_bits_addr;
  wire [127:0] _mshrs_6_io_refill_bits_data;
  wire         _mshrs_6_io_meta_write_valid;
  wire [5:0]   _mshrs_6_io_meta_write_bits_idx;
  wire [7:0]   _mshrs_6_io_meta_write_bits_way_en;
  wire [1:0]   _mshrs_6_io_meta_write_bits_data_coh_state;
  wire [20:0]  _mshrs_6_io_meta_write_bits_data_tag;
  wire         _mshrs_6_io_meta_read_valid;
  wire [5:0]   _mshrs_6_io_meta_read_bits_idx;
  wire [7:0]   _mshrs_6_io_meta_read_bits_way_en;
  wire [20:0]  _mshrs_6_io_meta_read_bits_tag;
  wire         _mshrs_6_io_wb_req_valid;
  wire [20:0]  _mshrs_6_io_wb_req_bits_tag;
  wire [5:0]   _mshrs_6_io_wb_req_bits_idx;
  wire [2:0]   _mshrs_6_io_wb_req_bits_param;
  wire [7:0]   _mshrs_6_io_wb_req_bits_way_en;
  wire         _mshrs_6_io_commit_val;
  wire [39:0]  _mshrs_6_io_commit_addr;
  wire [1:0]   _mshrs_6_io_commit_coh_state;
  wire         _mshrs_6_io_lb_read_valid;
  wire [2:0]   _mshrs_6_io_lb_read_bits_id;
  wire [1:0]   _mshrs_6_io_lb_read_bits_offset;
  wire         _mshrs_6_io_lb_write_valid;
  wire [2:0]   _mshrs_6_io_lb_write_bits_id;
  wire [1:0]   _mshrs_6_io_lb_write_bits_offset;
  wire [127:0] _mshrs_6_io_lb_write_bits_data;
  wire         _mshrs_6_io_replay_valid;
  wire [6:0]   _mshrs_6_io_replay_bits_uop_uopc;
  wire [31:0]  _mshrs_6_io_replay_bits_uop_inst;
  wire [31:0]  _mshrs_6_io_replay_bits_uop_debug_inst;
  wire         _mshrs_6_io_replay_bits_uop_is_rvc;
  wire [39:0]  _mshrs_6_io_replay_bits_uop_debug_pc;
  wire [2:0]   _mshrs_6_io_replay_bits_uop_iq_type;
  wire [9:0]   _mshrs_6_io_replay_bits_uop_fu_code;
  wire [3:0]   _mshrs_6_io_replay_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_6_io_replay_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_6_io_replay_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_6_io_replay_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_6_io_replay_bits_uop_ctrl_op_fcn;
  wire         _mshrs_6_io_replay_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_6_io_replay_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_6_io_replay_bits_uop_ctrl_is_load;
  wire         _mshrs_6_io_replay_bits_uop_ctrl_is_sta;
  wire         _mshrs_6_io_replay_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_6_io_replay_bits_uop_iw_state;
  wire         _mshrs_6_io_replay_bits_uop_iw_p1_poisoned;
  wire         _mshrs_6_io_replay_bits_uop_iw_p2_poisoned;
  wire         _mshrs_6_io_replay_bits_uop_is_br;
  wire         _mshrs_6_io_replay_bits_uop_is_jalr;
  wire         _mshrs_6_io_replay_bits_uop_is_jal;
  wire         _mshrs_6_io_replay_bits_uop_is_sfb;
  wire [19:0]  _mshrs_6_io_replay_bits_uop_br_mask;
  wire [4:0]   _mshrs_6_io_replay_bits_uop_br_tag;
  wire [5:0]   _mshrs_6_io_replay_bits_uop_ftq_idx;
  wire         _mshrs_6_io_replay_bits_uop_edge_inst;
  wire [5:0]   _mshrs_6_io_replay_bits_uop_pc_lob;
  wire         _mshrs_6_io_replay_bits_uop_taken;
  wire [19:0]  _mshrs_6_io_replay_bits_uop_imm_packed;
  wire [11:0]  _mshrs_6_io_replay_bits_uop_csr_addr;
  wire [6:0]   _mshrs_6_io_replay_bits_uop_rob_idx;
  wire [4:0]   _mshrs_6_io_replay_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_6_io_replay_bits_uop_stq_idx;
  wire [1:0]   _mshrs_6_io_replay_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_6_io_replay_bits_uop_pdst;
  wire [6:0]   _mshrs_6_io_replay_bits_uop_prs1;
  wire [6:0]   _mshrs_6_io_replay_bits_uop_prs2;
  wire [6:0]   _mshrs_6_io_replay_bits_uop_prs3;
  wire [5:0]   _mshrs_6_io_replay_bits_uop_ppred;
  wire         _mshrs_6_io_replay_bits_uop_prs1_busy;
  wire         _mshrs_6_io_replay_bits_uop_prs2_busy;
  wire         _mshrs_6_io_replay_bits_uop_prs3_busy;
  wire         _mshrs_6_io_replay_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_6_io_replay_bits_uop_stale_pdst;
  wire         _mshrs_6_io_replay_bits_uop_exception;
  wire [63:0]  _mshrs_6_io_replay_bits_uop_exc_cause;
  wire         _mshrs_6_io_replay_bits_uop_bypassable;
  wire [4:0]   _mshrs_6_io_replay_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_6_io_replay_bits_uop_mem_size;
  wire         _mshrs_6_io_replay_bits_uop_mem_signed;
  wire         _mshrs_6_io_replay_bits_uop_is_fence;
  wire         _mshrs_6_io_replay_bits_uop_is_fencei;
  wire         _mshrs_6_io_replay_bits_uop_is_amo;
  wire         _mshrs_6_io_replay_bits_uop_uses_ldq;
  wire         _mshrs_6_io_replay_bits_uop_uses_stq;
  wire         _mshrs_6_io_replay_bits_uop_is_sys_pc2epc;
  wire         _mshrs_6_io_replay_bits_uop_is_unique;
  wire         _mshrs_6_io_replay_bits_uop_flush_on_commit;
  wire         _mshrs_6_io_replay_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_6_io_replay_bits_uop_ldst;
  wire [5:0]   _mshrs_6_io_replay_bits_uop_lrs1;
  wire [5:0]   _mshrs_6_io_replay_bits_uop_lrs2;
  wire [5:0]   _mshrs_6_io_replay_bits_uop_lrs3;
  wire         _mshrs_6_io_replay_bits_uop_ldst_val;
  wire [1:0]   _mshrs_6_io_replay_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_6_io_replay_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_6_io_replay_bits_uop_lrs2_rtype;
  wire         _mshrs_6_io_replay_bits_uop_frs3_en;
  wire         _mshrs_6_io_replay_bits_uop_fp_val;
  wire         _mshrs_6_io_replay_bits_uop_fp_single;
  wire         _mshrs_6_io_replay_bits_uop_xcpt_pf_if;
  wire         _mshrs_6_io_replay_bits_uop_xcpt_ae_if;
  wire         _mshrs_6_io_replay_bits_uop_xcpt_ma_if;
  wire         _mshrs_6_io_replay_bits_uop_bp_debug_if;
  wire         _mshrs_6_io_replay_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_6_io_replay_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_6_io_replay_bits_uop_debug_tsrc;
  wire [39:0]  _mshrs_6_io_replay_bits_addr;
  wire         _mshrs_6_io_replay_bits_is_hella;
  wire [7:0]   _mshrs_6_io_replay_bits_way_en;
  wire [4:0]   _mshrs_6_io_replay_bits_sdq_id;
  wire         _mshrs_6_io_resp_valid;
  wire [6:0]   _mshrs_6_io_resp_bits_uop_uopc;
  wire [31:0]  _mshrs_6_io_resp_bits_uop_inst;
  wire [31:0]  _mshrs_6_io_resp_bits_uop_debug_inst;
  wire         _mshrs_6_io_resp_bits_uop_is_rvc;
  wire [39:0]  _mshrs_6_io_resp_bits_uop_debug_pc;
  wire [2:0]   _mshrs_6_io_resp_bits_uop_iq_type;
  wire [9:0]   _mshrs_6_io_resp_bits_uop_fu_code;
  wire [3:0]   _mshrs_6_io_resp_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_6_io_resp_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_6_io_resp_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_6_io_resp_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_6_io_resp_bits_uop_ctrl_op_fcn;
  wire         _mshrs_6_io_resp_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_6_io_resp_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_6_io_resp_bits_uop_ctrl_is_load;
  wire         _mshrs_6_io_resp_bits_uop_ctrl_is_sta;
  wire         _mshrs_6_io_resp_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_6_io_resp_bits_uop_iw_state;
  wire         _mshrs_6_io_resp_bits_uop_iw_p1_poisoned;
  wire         _mshrs_6_io_resp_bits_uop_iw_p2_poisoned;
  wire         _mshrs_6_io_resp_bits_uop_is_br;
  wire         _mshrs_6_io_resp_bits_uop_is_jalr;
  wire         _mshrs_6_io_resp_bits_uop_is_jal;
  wire         _mshrs_6_io_resp_bits_uop_is_sfb;
  wire [19:0]  _mshrs_6_io_resp_bits_uop_br_mask;
  wire [4:0]   _mshrs_6_io_resp_bits_uop_br_tag;
  wire [5:0]   _mshrs_6_io_resp_bits_uop_ftq_idx;
  wire         _mshrs_6_io_resp_bits_uop_edge_inst;
  wire [5:0]   _mshrs_6_io_resp_bits_uop_pc_lob;
  wire         _mshrs_6_io_resp_bits_uop_taken;
  wire [19:0]  _mshrs_6_io_resp_bits_uop_imm_packed;
  wire [11:0]  _mshrs_6_io_resp_bits_uop_csr_addr;
  wire [6:0]   _mshrs_6_io_resp_bits_uop_rob_idx;
  wire [4:0]   _mshrs_6_io_resp_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_6_io_resp_bits_uop_stq_idx;
  wire [1:0]   _mshrs_6_io_resp_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_6_io_resp_bits_uop_pdst;
  wire [6:0]   _mshrs_6_io_resp_bits_uop_prs1;
  wire [6:0]   _mshrs_6_io_resp_bits_uop_prs2;
  wire [6:0]   _mshrs_6_io_resp_bits_uop_prs3;
  wire [5:0]   _mshrs_6_io_resp_bits_uop_ppred;
  wire         _mshrs_6_io_resp_bits_uop_prs1_busy;
  wire         _mshrs_6_io_resp_bits_uop_prs2_busy;
  wire         _mshrs_6_io_resp_bits_uop_prs3_busy;
  wire         _mshrs_6_io_resp_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_6_io_resp_bits_uop_stale_pdst;
  wire         _mshrs_6_io_resp_bits_uop_exception;
  wire [63:0]  _mshrs_6_io_resp_bits_uop_exc_cause;
  wire         _mshrs_6_io_resp_bits_uop_bypassable;
  wire [4:0]   _mshrs_6_io_resp_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_6_io_resp_bits_uop_mem_size;
  wire         _mshrs_6_io_resp_bits_uop_mem_signed;
  wire         _mshrs_6_io_resp_bits_uop_is_fence;
  wire         _mshrs_6_io_resp_bits_uop_is_fencei;
  wire         _mshrs_6_io_resp_bits_uop_is_amo;
  wire         _mshrs_6_io_resp_bits_uop_uses_ldq;
  wire         _mshrs_6_io_resp_bits_uop_uses_stq;
  wire         _mshrs_6_io_resp_bits_uop_is_sys_pc2epc;
  wire         _mshrs_6_io_resp_bits_uop_is_unique;
  wire         _mshrs_6_io_resp_bits_uop_flush_on_commit;
  wire         _mshrs_6_io_resp_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_6_io_resp_bits_uop_ldst;
  wire [5:0]   _mshrs_6_io_resp_bits_uop_lrs1;
  wire [5:0]   _mshrs_6_io_resp_bits_uop_lrs2;
  wire [5:0]   _mshrs_6_io_resp_bits_uop_lrs3;
  wire         _mshrs_6_io_resp_bits_uop_ldst_val;
  wire [1:0]   _mshrs_6_io_resp_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_6_io_resp_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_6_io_resp_bits_uop_lrs2_rtype;
  wire         _mshrs_6_io_resp_bits_uop_frs3_en;
  wire         _mshrs_6_io_resp_bits_uop_fp_val;
  wire         _mshrs_6_io_resp_bits_uop_fp_single;
  wire         _mshrs_6_io_resp_bits_uop_xcpt_pf_if;
  wire         _mshrs_6_io_resp_bits_uop_xcpt_ae_if;
  wire         _mshrs_6_io_resp_bits_uop_xcpt_ma_if;
  wire         _mshrs_6_io_resp_bits_uop_bp_debug_if;
  wire         _mshrs_6_io_resp_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_6_io_resp_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_6_io_resp_bits_uop_debug_tsrc;
  wire [63:0]  _mshrs_6_io_resp_bits_data;
  wire         _mshrs_6_io_resp_bits_is_hella;
  wire         _mshrs_6_io_probe_rdy;
  wire         _mshrs_5_io_req_pri_rdy;
  wire         _mshrs_5_io_req_sec_rdy;
  wire         _mshrs_5_io_idx_valid;
  wire [5:0]   _mshrs_5_io_idx_bits;
  wire         _mshrs_5_io_way_valid;
  wire [7:0]   _mshrs_5_io_way_bits;
  wire         _mshrs_5_io_tag_valid;
  wire [27:0]  _mshrs_5_io_tag_bits;
  wire         _mshrs_5_io_mem_acquire_valid;
  wire [2:0]   _mshrs_5_io_mem_acquire_bits_param;
  wire [3:0]   _mshrs_5_io_mem_acquire_bits_source;
  wire [32:0]  _mshrs_5_io_mem_acquire_bits_address;
  wire         _mshrs_5_io_mem_grant_ready;
  wire         _mshrs_5_io_mem_finish_valid;
  wire [2:0]   _mshrs_5_io_mem_finish_bits_sink;
  wire         _mshrs_5_io_refill_valid;
  wire [7:0]   _mshrs_5_io_refill_bits_way_en;
  wire [11:0]  _mshrs_5_io_refill_bits_addr;
  wire [127:0] _mshrs_5_io_refill_bits_data;
  wire         _mshrs_5_io_meta_write_valid;
  wire [5:0]   _mshrs_5_io_meta_write_bits_idx;
  wire [7:0]   _mshrs_5_io_meta_write_bits_way_en;
  wire [1:0]   _mshrs_5_io_meta_write_bits_data_coh_state;
  wire [20:0]  _mshrs_5_io_meta_write_bits_data_tag;
  wire         _mshrs_5_io_meta_read_valid;
  wire [5:0]   _mshrs_5_io_meta_read_bits_idx;
  wire [7:0]   _mshrs_5_io_meta_read_bits_way_en;
  wire [20:0]  _mshrs_5_io_meta_read_bits_tag;
  wire         _mshrs_5_io_wb_req_valid;
  wire [20:0]  _mshrs_5_io_wb_req_bits_tag;
  wire [5:0]   _mshrs_5_io_wb_req_bits_idx;
  wire [2:0]   _mshrs_5_io_wb_req_bits_param;
  wire [7:0]   _mshrs_5_io_wb_req_bits_way_en;
  wire         _mshrs_5_io_commit_val;
  wire [39:0]  _mshrs_5_io_commit_addr;
  wire [1:0]   _mshrs_5_io_commit_coh_state;
  wire         _mshrs_5_io_lb_read_valid;
  wire [2:0]   _mshrs_5_io_lb_read_bits_id;
  wire [1:0]   _mshrs_5_io_lb_read_bits_offset;
  wire         _mshrs_5_io_lb_write_valid;
  wire [2:0]   _mshrs_5_io_lb_write_bits_id;
  wire [1:0]   _mshrs_5_io_lb_write_bits_offset;
  wire [127:0] _mshrs_5_io_lb_write_bits_data;
  wire         _mshrs_5_io_replay_valid;
  wire [6:0]   _mshrs_5_io_replay_bits_uop_uopc;
  wire [31:0]  _mshrs_5_io_replay_bits_uop_inst;
  wire [31:0]  _mshrs_5_io_replay_bits_uop_debug_inst;
  wire         _mshrs_5_io_replay_bits_uop_is_rvc;
  wire [39:0]  _mshrs_5_io_replay_bits_uop_debug_pc;
  wire [2:0]   _mshrs_5_io_replay_bits_uop_iq_type;
  wire [9:0]   _mshrs_5_io_replay_bits_uop_fu_code;
  wire [3:0]   _mshrs_5_io_replay_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_5_io_replay_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_5_io_replay_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_5_io_replay_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_5_io_replay_bits_uop_ctrl_op_fcn;
  wire         _mshrs_5_io_replay_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_5_io_replay_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_5_io_replay_bits_uop_ctrl_is_load;
  wire         _mshrs_5_io_replay_bits_uop_ctrl_is_sta;
  wire         _mshrs_5_io_replay_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_5_io_replay_bits_uop_iw_state;
  wire         _mshrs_5_io_replay_bits_uop_iw_p1_poisoned;
  wire         _mshrs_5_io_replay_bits_uop_iw_p2_poisoned;
  wire         _mshrs_5_io_replay_bits_uop_is_br;
  wire         _mshrs_5_io_replay_bits_uop_is_jalr;
  wire         _mshrs_5_io_replay_bits_uop_is_jal;
  wire         _mshrs_5_io_replay_bits_uop_is_sfb;
  wire [19:0]  _mshrs_5_io_replay_bits_uop_br_mask;
  wire [4:0]   _mshrs_5_io_replay_bits_uop_br_tag;
  wire [5:0]   _mshrs_5_io_replay_bits_uop_ftq_idx;
  wire         _mshrs_5_io_replay_bits_uop_edge_inst;
  wire [5:0]   _mshrs_5_io_replay_bits_uop_pc_lob;
  wire         _mshrs_5_io_replay_bits_uop_taken;
  wire [19:0]  _mshrs_5_io_replay_bits_uop_imm_packed;
  wire [11:0]  _mshrs_5_io_replay_bits_uop_csr_addr;
  wire [6:0]   _mshrs_5_io_replay_bits_uop_rob_idx;
  wire [4:0]   _mshrs_5_io_replay_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_5_io_replay_bits_uop_stq_idx;
  wire [1:0]   _mshrs_5_io_replay_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_5_io_replay_bits_uop_pdst;
  wire [6:0]   _mshrs_5_io_replay_bits_uop_prs1;
  wire [6:0]   _mshrs_5_io_replay_bits_uop_prs2;
  wire [6:0]   _mshrs_5_io_replay_bits_uop_prs3;
  wire [5:0]   _mshrs_5_io_replay_bits_uop_ppred;
  wire         _mshrs_5_io_replay_bits_uop_prs1_busy;
  wire         _mshrs_5_io_replay_bits_uop_prs2_busy;
  wire         _mshrs_5_io_replay_bits_uop_prs3_busy;
  wire         _mshrs_5_io_replay_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_5_io_replay_bits_uop_stale_pdst;
  wire         _mshrs_5_io_replay_bits_uop_exception;
  wire [63:0]  _mshrs_5_io_replay_bits_uop_exc_cause;
  wire         _mshrs_5_io_replay_bits_uop_bypassable;
  wire [4:0]   _mshrs_5_io_replay_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_5_io_replay_bits_uop_mem_size;
  wire         _mshrs_5_io_replay_bits_uop_mem_signed;
  wire         _mshrs_5_io_replay_bits_uop_is_fence;
  wire         _mshrs_5_io_replay_bits_uop_is_fencei;
  wire         _mshrs_5_io_replay_bits_uop_is_amo;
  wire         _mshrs_5_io_replay_bits_uop_uses_ldq;
  wire         _mshrs_5_io_replay_bits_uop_uses_stq;
  wire         _mshrs_5_io_replay_bits_uop_is_sys_pc2epc;
  wire         _mshrs_5_io_replay_bits_uop_is_unique;
  wire         _mshrs_5_io_replay_bits_uop_flush_on_commit;
  wire         _mshrs_5_io_replay_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_5_io_replay_bits_uop_ldst;
  wire [5:0]   _mshrs_5_io_replay_bits_uop_lrs1;
  wire [5:0]   _mshrs_5_io_replay_bits_uop_lrs2;
  wire [5:0]   _mshrs_5_io_replay_bits_uop_lrs3;
  wire         _mshrs_5_io_replay_bits_uop_ldst_val;
  wire [1:0]   _mshrs_5_io_replay_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_5_io_replay_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_5_io_replay_bits_uop_lrs2_rtype;
  wire         _mshrs_5_io_replay_bits_uop_frs3_en;
  wire         _mshrs_5_io_replay_bits_uop_fp_val;
  wire         _mshrs_5_io_replay_bits_uop_fp_single;
  wire         _mshrs_5_io_replay_bits_uop_xcpt_pf_if;
  wire         _mshrs_5_io_replay_bits_uop_xcpt_ae_if;
  wire         _mshrs_5_io_replay_bits_uop_xcpt_ma_if;
  wire         _mshrs_5_io_replay_bits_uop_bp_debug_if;
  wire         _mshrs_5_io_replay_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_5_io_replay_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_5_io_replay_bits_uop_debug_tsrc;
  wire [39:0]  _mshrs_5_io_replay_bits_addr;
  wire         _mshrs_5_io_replay_bits_is_hella;
  wire [7:0]   _mshrs_5_io_replay_bits_way_en;
  wire [4:0]   _mshrs_5_io_replay_bits_sdq_id;
  wire         _mshrs_5_io_resp_valid;
  wire [6:0]   _mshrs_5_io_resp_bits_uop_uopc;
  wire [31:0]  _mshrs_5_io_resp_bits_uop_inst;
  wire [31:0]  _mshrs_5_io_resp_bits_uop_debug_inst;
  wire         _mshrs_5_io_resp_bits_uop_is_rvc;
  wire [39:0]  _mshrs_5_io_resp_bits_uop_debug_pc;
  wire [2:0]   _mshrs_5_io_resp_bits_uop_iq_type;
  wire [9:0]   _mshrs_5_io_resp_bits_uop_fu_code;
  wire [3:0]   _mshrs_5_io_resp_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_5_io_resp_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_5_io_resp_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_5_io_resp_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_5_io_resp_bits_uop_ctrl_op_fcn;
  wire         _mshrs_5_io_resp_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_5_io_resp_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_5_io_resp_bits_uop_ctrl_is_load;
  wire         _mshrs_5_io_resp_bits_uop_ctrl_is_sta;
  wire         _mshrs_5_io_resp_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_5_io_resp_bits_uop_iw_state;
  wire         _mshrs_5_io_resp_bits_uop_iw_p1_poisoned;
  wire         _mshrs_5_io_resp_bits_uop_iw_p2_poisoned;
  wire         _mshrs_5_io_resp_bits_uop_is_br;
  wire         _mshrs_5_io_resp_bits_uop_is_jalr;
  wire         _mshrs_5_io_resp_bits_uop_is_jal;
  wire         _mshrs_5_io_resp_bits_uop_is_sfb;
  wire [19:0]  _mshrs_5_io_resp_bits_uop_br_mask;
  wire [4:0]   _mshrs_5_io_resp_bits_uop_br_tag;
  wire [5:0]   _mshrs_5_io_resp_bits_uop_ftq_idx;
  wire         _mshrs_5_io_resp_bits_uop_edge_inst;
  wire [5:0]   _mshrs_5_io_resp_bits_uop_pc_lob;
  wire         _mshrs_5_io_resp_bits_uop_taken;
  wire [19:0]  _mshrs_5_io_resp_bits_uop_imm_packed;
  wire [11:0]  _mshrs_5_io_resp_bits_uop_csr_addr;
  wire [6:0]   _mshrs_5_io_resp_bits_uop_rob_idx;
  wire [4:0]   _mshrs_5_io_resp_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_5_io_resp_bits_uop_stq_idx;
  wire [1:0]   _mshrs_5_io_resp_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_5_io_resp_bits_uop_pdst;
  wire [6:0]   _mshrs_5_io_resp_bits_uop_prs1;
  wire [6:0]   _mshrs_5_io_resp_bits_uop_prs2;
  wire [6:0]   _mshrs_5_io_resp_bits_uop_prs3;
  wire [5:0]   _mshrs_5_io_resp_bits_uop_ppred;
  wire         _mshrs_5_io_resp_bits_uop_prs1_busy;
  wire         _mshrs_5_io_resp_bits_uop_prs2_busy;
  wire         _mshrs_5_io_resp_bits_uop_prs3_busy;
  wire         _mshrs_5_io_resp_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_5_io_resp_bits_uop_stale_pdst;
  wire         _mshrs_5_io_resp_bits_uop_exception;
  wire [63:0]  _mshrs_5_io_resp_bits_uop_exc_cause;
  wire         _mshrs_5_io_resp_bits_uop_bypassable;
  wire [4:0]   _mshrs_5_io_resp_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_5_io_resp_bits_uop_mem_size;
  wire         _mshrs_5_io_resp_bits_uop_mem_signed;
  wire         _mshrs_5_io_resp_bits_uop_is_fence;
  wire         _mshrs_5_io_resp_bits_uop_is_fencei;
  wire         _mshrs_5_io_resp_bits_uop_is_amo;
  wire         _mshrs_5_io_resp_bits_uop_uses_ldq;
  wire         _mshrs_5_io_resp_bits_uop_uses_stq;
  wire         _mshrs_5_io_resp_bits_uop_is_sys_pc2epc;
  wire         _mshrs_5_io_resp_bits_uop_is_unique;
  wire         _mshrs_5_io_resp_bits_uop_flush_on_commit;
  wire         _mshrs_5_io_resp_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_5_io_resp_bits_uop_ldst;
  wire [5:0]   _mshrs_5_io_resp_bits_uop_lrs1;
  wire [5:0]   _mshrs_5_io_resp_bits_uop_lrs2;
  wire [5:0]   _mshrs_5_io_resp_bits_uop_lrs3;
  wire         _mshrs_5_io_resp_bits_uop_ldst_val;
  wire [1:0]   _mshrs_5_io_resp_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_5_io_resp_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_5_io_resp_bits_uop_lrs2_rtype;
  wire         _mshrs_5_io_resp_bits_uop_frs3_en;
  wire         _mshrs_5_io_resp_bits_uop_fp_val;
  wire         _mshrs_5_io_resp_bits_uop_fp_single;
  wire         _mshrs_5_io_resp_bits_uop_xcpt_pf_if;
  wire         _mshrs_5_io_resp_bits_uop_xcpt_ae_if;
  wire         _mshrs_5_io_resp_bits_uop_xcpt_ma_if;
  wire         _mshrs_5_io_resp_bits_uop_bp_debug_if;
  wire         _mshrs_5_io_resp_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_5_io_resp_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_5_io_resp_bits_uop_debug_tsrc;
  wire [63:0]  _mshrs_5_io_resp_bits_data;
  wire         _mshrs_5_io_resp_bits_is_hella;
  wire         _mshrs_5_io_probe_rdy;
  wire         _mshrs_4_io_req_pri_rdy;
  wire         _mshrs_4_io_req_sec_rdy;
  wire         _mshrs_4_io_idx_valid;
  wire [5:0]   _mshrs_4_io_idx_bits;
  wire         _mshrs_4_io_way_valid;
  wire [7:0]   _mshrs_4_io_way_bits;
  wire         _mshrs_4_io_tag_valid;
  wire [27:0]  _mshrs_4_io_tag_bits;
  wire         _mshrs_4_io_mem_acquire_valid;
  wire [2:0]   _mshrs_4_io_mem_acquire_bits_param;
  wire [3:0]   _mshrs_4_io_mem_acquire_bits_source;
  wire [32:0]  _mshrs_4_io_mem_acquire_bits_address;
  wire         _mshrs_4_io_mem_grant_ready;
  wire         _mshrs_4_io_mem_finish_valid;
  wire [2:0]   _mshrs_4_io_mem_finish_bits_sink;
  wire         _mshrs_4_io_refill_valid;
  wire [7:0]   _mshrs_4_io_refill_bits_way_en;
  wire [11:0]  _mshrs_4_io_refill_bits_addr;
  wire [127:0] _mshrs_4_io_refill_bits_data;
  wire         _mshrs_4_io_meta_write_valid;
  wire [5:0]   _mshrs_4_io_meta_write_bits_idx;
  wire [7:0]   _mshrs_4_io_meta_write_bits_way_en;
  wire [1:0]   _mshrs_4_io_meta_write_bits_data_coh_state;
  wire [20:0]  _mshrs_4_io_meta_write_bits_data_tag;
  wire         _mshrs_4_io_meta_read_valid;
  wire [5:0]   _mshrs_4_io_meta_read_bits_idx;
  wire [7:0]   _mshrs_4_io_meta_read_bits_way_en;
  wire [20:0]  _mshrs_4_io_meta_read_bits_tag;
  wire         _mshrs_4_io_wb_req_valid;
  wire [20:0]  _mshrs_4_io_wb_req_bits_tag;
  wire [5:0]   _mshrs_4_io_wb_req_bits_idx;
  wire [2:0]   _mshrs_4_io_wb_req_bits_param;
  wire [7:0]   _mshrs_4_io_wb_req_bits_way_en;
  wire         _mshrs_4_io_commit_val;
  wire [39:0]  _mshrs_4_io_commit_addr;
  wire [1:0]   _mshrs_4_io_commit_coh_state;
  wire         _mshrs_4_io_lb_read_valid;
  wire [2:0]   _mshrs_4_io_lb_read_bits_id;
  wire [1:0]   _mshrs_4_io_lb_read_bits_offset;
  wire         _mshrs_4_io_lb_write_valid;
  wire [2:0]   _mshrs_4_io_lb_write_bits_id;
  wire [1:0]   _mshrs_4_io_lb_write_bits_offset;
  wire [127:0] _mshrs_4_io_lb_write_bits_data;
  wire         _mshrs_4_io_replay_valid;
  wire [6:0]   _mshrs_4_io_replay_bits_uop_uopc;
  wire [31:0]  _mshrs_4_io_replay_bits_uop_inst;
  wire [31:0]  _mshrs_4_io_replay_bits_uop_debug_inst;
  wire         _mshrs_4_io_replay_bits_uop_is_rvc;
  wire [39:0]  _mshrs_4_io_replay_bits_uop_debug_pc;
  wire [2:0]   _mshrs_4_io_replay_bits_uop_iq_type;
  wire [9:0]   _mshrs_4_io_replay_bits_uop_fu_code;
  wire [3:0]   _mshrs_4_io_replay_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_4_io_replay_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_4_io_replay_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_4_io_replay_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_4_io_replay_bits_uop_ctrl_op_fcn;
  wire         _mshrs_4_io_replay_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_4_io_replay_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_4_io_replay_bits_uop_ctrl_is_load;
  wire         _mshrs_4_io_replay_bits_uop_ctrl_is_sta;
  wire         _mshrs_4_io_replay_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_4_io_replay_bits_uop_iw_state;
  wire         _mshrs_4_io_replay_bits_uop_iw_p1_poisoned;
  wire         _mshrs_4_io_replay_bits_uop_iw_p2_poisoned;
  wire         _mshrs_4_io_replay_bits_uop_is_br;
  wire         _mshrs_4_io_replay_bits_uop_is_jalr;
  wire         _mshrs_4_io_replay_bits_uop_is_jal;
  wire         _mshrs_4_io_replay_bits_uop_is_sfb;
  wire [19:0]  _mshrs_4_io_replay_bits_uop_br_mask;
  wire [4:0]   _mshrs_4_io_replay_bits_uop_br_tag;
  wire [5:0]   _mshrs_4_io_replay_bits_uop_ftq_idx;
  wire         _mshrs_4_io_replay_bits_uop_edge_inst;
  wire [5:0]   _mshrs_4_io_replay_bits_uop_pc_lob;
  wire         _mshrs_4_io_replay_bits_uop_taken;
  wire [19:0]  _mshrs_4_io_replay_bits_uop_imm_packed;
  wire [11:0]  _mshrs_4_io_replay_bits_uop_csr_addr;
  wire [6:0]   _mshrs_4_io_replay_bits_uop_rob_idx;
  wire [4:0]   _mshrs_4_io_replay_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_4_io_replay_bits_uop_stq_idx;
  wire [1:0]   _mshrs_4_io_replay_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_4_io_replay_bits_uop_pdst;
  wire [6:0]   _mshrs_4_io_replay_bits_uop_prs1;
  wire [6:0]   _mshrs_4_io_replay_bits_uop_prs2;
  wire [6:0]   _mshrs_4_io_replay_bits_uop_prs3;
  wire [5:0]   _mshrs_4_io_replay_bits_uop_ppred;
  wire         _mshrs_4_io_replay_bits_uop_prs1_busy;
  wire         _mshrs_4_io_replay_bits_uop_prs2_busy;
  wire         _mshrs_4_io_replay_bits_uop_prs3_busy;
  wire         _mshrs_4_io_replay_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_4_io_replay_bits_uop_stale_pdst;
  wire         _mshrs_4_io_replay_bits_uop_exception;
  wire [63:0]  _mshrs_4_io_replay_bits_uop_exc_cause;
  wire         _mshrs_4_io_replay_bits_uop_bypassable;
  wire [4:0]   _mshrs_4_io_replay_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_4_io_replay_bits_uop_mem_size;
  wire         _mshrs_4_io_replay_bits_uop_mem_signed;
  wire         _mshrs_4_io_replay_bits_uop_is_fence;
  wire         _mshrs_4_io_replay_bits_uop_is_fencei;
  wire         _mshrs_4_io_replay_bits_uop_is_amo;
  wire         _mshrs_4_io_replay_bits_uop_uses_ldq;
  wire         _mshrs_4_io_replay_bits_uop_uses_stq;
  wire         _mshrs_4_io_replay_bits_uop_is_sys_pc2epc;
  wire         _mshrs_4_io_replay_bits_uop_is_unique;
  wire         _mshrs_4_io_replay_bits_uop_flush_on_commit;
  wire         _mshrs_4_io_replay_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_4_io_replay_bits_uop_ldst;
  wire [5:0]   _mshrs_4_io_replay_bits_uop_lrs1;
  wire [5:0]   _mshrs_4_io_replay_bits_uop_lrs2;
  wire [5:0]   _mshrs_4_io_replay_bits_uop_lrs3;
  wire         _mshrs_4_io_replay_bits_uop_ldst_val;
  wire [1:0]   _mshrs_4_io_replay_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_4_io_replay_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_4_io_replay_bits_uop_lrs2_rtype;
  wire         _mshrs_4_io_replay_bits_uop_frs3_en;
  wire         _mshrs_4_io_replay_bits_uop_fp_val;
  wire         _mshrs_4_io_replay_bits_uop_fp_single;
  wire         _mshrs_4_io_replay_bits_uop_xcpt_pf_if;
  wire         _mshrs_4_io_replay_bits_uop_xcpt_ae_if;
  wire         _mshrs_4_io_replay_bits_uop_xcpt_ma_if;
  wire         _mshrs_4_io_replay_bits_uop_bp_debug_if;
  wire         _mshrs_4_io_replay_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_4_io_replay_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_4_io_replay_bits_uop_debug_tsrc;
  wire [39:0]  _mshrs_4_io_replay_bits_addr;
  wire         _mshrs_4_io_replay_bits_is_hella;
  wire [7:0]   _mshrs_4_io_replay_bits_way_en;
  wire [4:0]   _mshrs_4_io_replay_bits_sdq_id;
  wire         _mshrs_4_io_resp_valid;
  wire [6:0]   _mshrs_4_io_resp_bits_uop_uopc;
  wire [31:0]  _mshrs_4_io_resp_bits_uop_inst;
  wire [31:0]  _mshrs_4_io_resp_bits_uop_debug_inst;
  wire         _mshrs_4_io_resp_bits_uop_is_rvc;
  wire [39:0]  _mshrs_4_io_resp_bits_uop_debug_pc;
  wire [2:0]   _mshrs_4_io_resp_bits_uop_iq_type;
  wire [9:0]   _mshrs_4_io_resp_bits_uop_fu_code;
  wire [3:0]   _mshrs_4_io_resp_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_4_io_resp_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_4_io_resp_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_4_io_resp_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_4_io_resp_bits_uop_ctrl_op_fcn;
  wire         _mshrs_4_io_resp_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_4_io_resp_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_4_io_resp_bits_uop_ctrl_is_load;
  wire         _mshrs_4_io_resp_bits_uop_ctrl_is_sta;
  wire         _mshrs_4_io_resp_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_4_io_resp_bits_uop_iw_state;
  wire         _mshrs_4_io_resp_bits_uop_iw_p1_poisoned;
  wire         _mshrs_4_io_resp_bits_uop_iw_p2_poisoned;
  wire         _mshrs_4_io_resp_bits_uop_is_br;
  wire         _mshrs_4_io_resp_bits_uop_is_jalr;
  wire         _mshrs_4_io_resp_bits_uop_is_jal;
  wire         _mshrs_4_io_resp_bits_uop_is_sfb;
  wire [19:0]  _mshrs_4_io_resp_bits_uop_br_mask;
  wire [4:0]   _mshrs_4_io_resp_bits_uop_br_tag;
  wire [5:0]   _mshrs_4_io_resp_bits_uop_ftq_idx;
  wire         _mshrs_4_io_resp_bits_uop_edge_inst;
  wire [5:0]   _mshrs_4_io_resp_bits_uop_pc_lob;
  wire         _mshrs_4_io_resp_bits_uop_taken;
  wire [19:0]  _mshrs_4_io_resp_bits_uop_imm_packed;
  wire [11:0]  _mshrs_4_io_resp_bits_uop_csr_addr;
  wire [6:0]   _mshrs_4_io_resp_bits_uop_rob_idx;
  wire [4:0]   _mshrs_4_io_resp_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_4_io_resp_bits_uop_stq_idx;
  wire [1:0]   _mshrs_4_io_resp_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_4_io_resp_bits_uop_pdst;
  wire [6:0]   _mshrs_4_io_resp_bits_uop_prs1;
  wire [6:0]   _mshrs_4_io_resp_bits_uop_prs2;
  wire [6:0]   _mshrs_4_io_resp_bits_uop_prs3;
  wire [5:0]   _mshrs_4_io_resp_bits_uop_ppred;
  wire         _mshrs_4_io_resp_bits_uop_prs1_busy;
  wire         _mshrs_4_io_resp_bits_uop_prs2_busy;
  wire         _mshrs_4_io_resp_bits_uop_prs3_busy;
  wire         _mshrs_4_io_resp_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_4_io_resp_bits_uop_stale_pdst;
  wire         _mshrs_4_io_resp_bits_uop_exception;
  wire [63:0]  _mshrs_4_io_resp_bits_uop_exc_cause;
  wire         _mshrs_4_io_resp_bits_uop_bypassable;
  wire [4:0]   _mshrs_4_io_resp_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_4_io_resp_bits_uop_mem_size;
  wire         _mshrs_4_io_resp_bits_uop_mem_signed;
  wire         _mshrs_4_io_resp_bits_uop_is_fence;
  wire         _mshrs_4_io_resp_bits_uop_is_fencei;
  wire         _mshrs_4_io_resp_bits_uop_is_amo;
  wire         _mshrs_4_io_resp_bits_uop_uses_ldq;
  wire         _mshrs_4_io_resp_bits_uop_uses_stq;
  wire         _mshrs_4_io_resp_bits_uop_is_sys_pc2epc;
  wire         _mshrs_4_io_resp_bits_uop_is_unique;
  wire         _mshrs_4_io_resp_bits_uop_flush_on_commit;
  wire         _mshrs_4_io_resp_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_4_io_resp_bits_uop_ldst;
  wire [5:0]   _mshrs_4_io_resp_bits_uop_lrs1;
  wire [5:0]   _mshrs_4_io_resp_bits_uop_lrs2;
  wire [5:0]   _mshrs_4_io_resp_bits_uop_lrs3;
  wire         _mshrs_4_io_resp_bits_uop_ldst_val;
  wire [1:0]   _mshrs_4_io_resp_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_4_io_resp_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_4_io_resp_bits_uop_lrs2_rtype;
  wire         _mshrs_4_io_resp_bits_uop_frs3_en;
  wire         _mshrs_4_io_resp_bits_uop_fp_val;
  wire         _mshrs_4_io_resp_bits_uop_fp_single;
  wire         _mshrs_4_io_resp_bits_uop_xcpt_pf_if;
  wire         _mshrs_4_io_resp_bits_uop_xcpt_ae_if;
  wire         _mshrs_4_io_resp_bits_uop_xcpt_ma_if;
  wire         _mshrs_4_io_resp_bits_uop_bp_debug_if;
  wire         _mshrs_4_io_resp_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_4_io_resp_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_4_io_resp_bits_uop_debug_tsrc;
  wire [63:0]  _mshrs_4_io_resp_bits_data;
  wire         _mshrs_4_io_resp_bits_is_hella;
  wire         _mshrs_4_io_probe_rdy;
  wire         _mshrs_3_io_req_pri_rdy;
  wire         _mshrs_3_io_req_sec_rdy;
  wire         _mshrs_3_io_idx_valid;
  wire [5:0]   _mshrs_3_io_idx_bits;
  wire         _mshrs_3_io_way_valid;
  wire [7:0]   _mshrs_3_io_way_bits;
  wire         _mshrs_3_io_tag_valid;
  wire [27:0]  _mshrs_3_io_tag_bits;
  wire         _mshrs_3_io_mem_acquire_valid;
  wire [2:0]   _mshrs_3_io_mem_acquire_bits_param;
  wire [3:0]   _mshrs_3_io_mem_acquire_bits_source;
  wire [32:0]  _mshrs_3_io_mem_acquire_bits_address;
  wire         _mshrs_3_io_mem_grant_ready;
  wire         _mshrs_3_io_mem_finish_valid;
  wire [2:0]   _mshrs_3_io_mem_finish_bits_sink;
  wire         _mshrs_3_io_refill_valid;
  wire [7:0]   _mshrs_3_io_refill_bits_way_en;
  wire [11:0]  _mshrs_3_io_refill_bits_addr;
  wire [127:0] _mshrs_3_io_refill_bits_data;
  wire         _mshrs_3_io_meta_write_valid;
  wire [5:0]   _mshrs_3_io_meta_write_bits_idx;
  wire [7:0]   _mshrs_3_io_meta_write_bits_way_en;
  wire [1:0]   _mshrs_3_io_meta_write_bits_data_coh_state;
  wire [20:0]  _mshrs_3_io_meta_write_bits_data_tag;
  wire         _mshrs_3_io_meta_read_valid;
  wire [5:0]   _mshrs_3_io_meta_read_bits_idx;
  wire [7:0]   _mshrs_3_io_meta_read_bits_way_en;
  wire [20:0]  _mshrs_3_io_meta_read_bits_tag;
  wire         _mshrs_3_io_wb_req_valid;
  wire [20:0]  _mshrs_3_io_wb_req_bits_tag;
  wire [5:0]   _mshrs_3_io_wb_req_bits_idx;
  wire [2:0]   _mshrs_3_io_wb_req_bits_param;
  wire [7:0]   _mshrs_3_io_wb_req_bits_way_en;
  wire         _mshrs_3_io_commit_val;
  wire [39:0]  _mshrs_3_io_commit_addr;
  wire [1:0]   _mshrs_3_io_commit_coh_state;
  wire         _mshrs_3_io_lb_read_valid;
  wire [2:0]   _mshrs_3_io_lb_read_bits_id;
  wire [1:0]   _mshrs_3_io_lb_read_bits_offset;
  wire         _mshrs_3_io_lb_write_valid;
  wire [2:0]   _mshrs_3_io_lb_write_bits_id;
  wire [1:0]   _mshrs_3_io_lb_write_bits_offset;
  wire [127:0] _mshrs_3_io_lb_write_bits_data;
  wire         _mshrs_3_io_replay_valid;
  wire [6:0]   _mshrs_3_io_replay_bits_uop_uopc;
  wire [31:0]  _mshrs_3_io_replay_bits_uop_inst;
  wire [31:0]  _mshrs_3_io_replay_bits_uop_debug_inst;
  wire         _mshrs_3_io_replay_bits_uop_is_rvc;
  wire [39:0]  _mshrs_3_io_replay_bits_uop_debug_pc;
  wire [2:0]   _mshrs_3_io_replay_bits_uop_iq_type;
  wire [9:0]   _mshrs_3_io_replay_bits_uop_fu_code;
  wire [3:0]   _mshrs_3_io_replay_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_3_io_replay_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_3_io_replay_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_3_io_replay_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_3_io_replay_bits_uop_ctrl_op_fcn;
  wire         _mshrs_3_io_replay_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_3_io_replay_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_3_io_replay_bits_uop_ctrl_is_load;
  wire         _mshrs_3_io_replay_bits_uop_ctrl_is_sta;
  wire         _mshrs_3_io_replay_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_3_io_replay_bits_uop_iw_state;
  wire         _mshrs_3_io_replay_bits_uop_iw_p1_poisoned;
  wire         _mshrs_3_io_replay_bits_uop_iw_p2_poisoned;
  wire         _mshrs_3_io_replay_bits_uop_is_br;
  wire         _mshrs_3_io_replay_bits_uop_is_jalr;
  wire         _mshrs_3_io_replay_bits_uop_is_jal;
  wire         _mshrs_3_io_replay_bits_uop_is_sfb;
  wire [19:0]  _mshrs_3_io_replay_bits_uop_br_mask;
  wire [4:0]   _mshrs_3_io_replay_bits_uop_br_tag;
  wire [5:0]   _mshrs_3_io_replay_bits_uop_ftq_idx;
  wire         _mshrs_3_io_replay_bits_uop_edge_inst;
  wire [5:0]   _mshrs_3_io_replay_bits_uop_pc_lob;
  wire         _mshrs_3_io_replay_bits_uop_taken;
  wire [19:0]  _mshrs_3_io_replay_bits_uop_imm_packed;
  wire [11:0]  _mshrs_3_io_replay_bits_uop_csr_addr;
  wire [6:0]   _mshrs_3_io_replay_bits_uop_rob_idx;
  wire [4:0]   _mshrs_3_io_replay_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_3_io_replay_bits_uop_stq_idx;
  wire [1:0]   _mshrs_3_io_replay_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_3_io_replay_bits_uop_pdst;
  wire [6:0]   _mshrs_3_io_replay_bits_uop_prs1;
  wire [6:0]   _mshrs_3_io_replay_bits_uop_prs2;
  wire [6:0]   _mshrs_3_io_replay_bits_uop_prs3;
  wire [5:0]   _mshrs_3_io_replay_bits_uop_ppred;
  wire         _mshrs_3_io_replay_bits_uop_prs1_busy;
  wire         _mshrs_3_io_replay_bits_uop_prs2_busy;
  wire         _mshrs_3_io_replay_bits_uop_prs3_busy;
  wire         _mshrs_3_io_replay_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_3_io_replay_bits_uop_stale_pdst;
  wire         _mshrs_3_io_replay_bits_uop_exception;
  wire [63:0]  _mshrs_3_io_replay_bits_uop_exc_cause;
  wire         _mshrs_3_io_replay_bits_uop_bypassable;
  wire [4:0]   _mshrs_3_io_replay_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_3_io_replay_bits_uop_mem_size;
  wire         _mshrs_3_io_replay_bits_uop_mem_signed;
  wire         _mshrs_3_io_replay_bits_uop_is_fence;
  wire         _mshrs_3_io_replay_bits_uop_is_fencei;
  wire         _mshrs_3_io_replay_bits_uop_is_amo;
  wire         _mshrs_3_io_replay_bits_uop_uses_ldq;
  wire         _mshrs_3_io_replay_bits_uop_uses_stq;
  wire         _mshrs_3_io_replay_bits_uop_is_sys_pc2epc;
  wire         _mshrs_3_io_replay_bits_uop_is_unique;
  wire         _mshrs_3_io_replay_bits_uop_flush_on_commit;
  wire         _mshrs_3_io_replay_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_3_io_replay_bits_uop_ldst;
  wire [5:0]   _mshrs_3_io_replay_bits_uop_lrs1;
  wire [5:0]   _mshrs_3_io_replay_bits_uop_lrs2;
  wire [5:0]   _mshrs_3_io_replay_bits_uop_lrs3;
  wire         _mshrs_3_io_replay_bits_uop_ldst_val;
  wire [1:0]   _mshrs_3_io_replay_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_3_io_replay_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_3_io_replay_bits_uop_lrs2_rtype;
  wire         _mshrs_3_io_replay_bits_uop_frs3_en;
  wire         _mshrs_3_io_replay_bits_uop_fp_val;
  wire         _mshrs_3_io_replay_bits_uop_fp_single;
  wire         _mshrs_3_io_replay_bits_uop_xcpt_pf_if;
  wire         _mshrs_3_io_replay_bits_uop_xcpt_ae_if;
  wire         _mshrs_3_io_replay_bits_uop_xcpt_ma_if;
  wire         _mshrs_3_io_replay_bits_uop_bp_debug_if;
  wire         _mshrs_3_io_replay_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_3_io_replay_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_3_io_replay_bits_uop_debug_tsrc;
  wire [39:0]  _mshrs_3_io_replay_bits_addr;
  wire         _mshrs_3_io_replay_bits_is_hella;
  wire [7:0]   _mshrs_3_io_replay_bits_way_en;
  wire [4:0]   _mshrs_3_io_replay_bits_sdq_id;
  wire         _mshrs_3_io_resp_valid;
  wire [6:0]   _mshrs_3_io_resp_bits_uop_uopc;
  wire [31:0]  _mshrs_3_io_resp_bits_uop_inst;
  wire [31:0]  _mshrs_3_io_resp_bits_uop_debug_inst;
  wire         _mshrs_3_io_resp_bits_uop_is_rvc;
  wire [39:0]  _mshrs_3_io_resp_bits_uop_debug_pc;
  wire [2:0]   _mshrs_3_io_resp_bits_uop_iq_type;
  wire [9:0]   _mshrs_3_io_resp_bits_uop_fu_code;
  wire [3:0]   _mshrs_3_io_resp_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_3_io_resp_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_3_io_resp_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_3_io_resp_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_3_io_resp_bits_uop_ctrl_op_fcn;
  wire         _mshrs_3_io_resp_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_3_io_resp_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_3_io_resp_bits_uop_ctrl_is_load;
  wire         _mshrs_3_io_resp_bits_uop_ctrl_is_sta;
  wire         _mshrs_3_io_resp_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_3_io_resp_bits_uop_iw_state;
  wire         _mshrs_3_io_resp_bits_uop_iw_p1_poisoned;
  wire         _mshrs_3_io_resp_bits_uop_iw_p2_poisoned;
  wire         _mshrs_3_io_resp_bits_uop_is_br;
  wire         _mshrs_3_io_resp_bits_uop_is_jalr;
  wire         _mshrs_3_io_resp_bits_uop_is_jal;
  wire         _mshrs_3_io_resp_bits_uop_is_sfb;
  wire [19:0]  _mshrs_3_io_resp_bits_uop_br_mask;
  wire [4:0]   _mshrs_3_io_resp_bits_uop_br_tag;
  wire [5:0]   _mshrs_3_io_resp_bits_uop_ftq_idx;
  wire         _mshrs_3_io_resp_bits_uop_edge_inst;
  wire [5:0]   _mshrs_3_io_resp_bits_uop_pc_lob;
  wire         _mshrs_3_io_resp_bits_uop_taken;
  wire [19:0]  _mshrs_3_io_resp_bits_uop_imm_packed;
  wire [11:0]  _mshrs_3_io_resp_bits_uop_csr_addr;
  wire [6:0]   _mshrs_3_io_resp_bits_uop_rob_idx;
  wire [4:0]   _mshrs_3_io_resp_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_3_io_resp_bits_uop_stq_idx;
  wire [1:0]   _mshrs_3_io_resp_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_3_io_resp_bits_uop_pdst;
  wire [6:0]   _mshrs_3_io_resp_bits_uop_prs1;
  wire [6:0]   _mshrs_3_io_resp_bits_uop_prs2;
  wire [6:0]   _mshrs_3_io_resp_bits_uop_prs3;
  wire [5:0]   _mshrs_3_io_resp_bits_uop_ppred;
  wire         _mshrs_3_io_resp_bits_uop_prs1_busy;
  wire         _mshrs_3_io_resp_bits_uop_prs2_busy;
  wire         _mshrs_3_io_resp_bits_uop_prs3_busy;
  wire         _mshrs_3_io_resp_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_3_io_resp_bits_uop_stale_pdst;
  wire         _mshrs_3_io_resp_bits_uop_exception;
  wire [63:0]  _mshrs_3_io_resp_bits_uop_exc_cause;
  wire         _mshrs_3_io_resp_bits_uop_bypassable;
  wire [4:0]   _mshrs_3_io_resp_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_3_io_resp_bits_uop_mem_size;
  wire         _mshrs_3_io_resp_bits_uop_mem_signed;
  wire         _mshrs_3_io_resp_bits_uop_is_fence;
  wire         _mshrs_3_io_resp_bits_uop_is_fencei;
  wire         _mshrs_3_io_resp_bits_uop_is_amo;
  wire         _mshrs_3_io_resp_bits_uop_uses_ldq;
  wire         _mshrs_3_io_resp_bits_uop_uses_stq;
  wire         _mshrs_3_io_resp_bits_uop_is_sys_pc2epc;
  wire         _mshrs_3_io_resp_bits_uop_is_unique;
  wire         _mshrs_3_io_resp_bits_uop_flush_on_commit;
  wire         _mshrs_3_io_resp_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_3_io_resp_bits_uop_ldst;
  wire [5:0]   _mshrs_3_io_resp_bits_uop_lrs1;
  wire [5:0]   _mshrs_3_io_resp_bits_uop_lrs2;
  wire [5:0]   _mshrs_3_io_resp_bits_uop_lrs3;
  wire         _mshrs_3_io_resp_bits_uop_ldst_val;
  wire [1:0]   _mshrs_3_io_resp_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_3_io_resp_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_3_io_resp_bits_uop_lrs2_rtype;
  wire         _mshrs_3_io_resp_bits_uop_frs3_en;
  wire         _mshrs_3_io_resp_bits_uop_fp_val;
  wire         _mshrs_3_io_resp_bits_uop_fp_single;
  wire         _mshrs_3_io_resp_bits_uop_xcpt_pf_if;
  wire         _mshrs_3_io_resp_bits_uop_xcpt_ae_if;
  wire         _mshrs_3_io_resp_bits_uop_xcpt_ma_if;
  wire         _mshrs_3_io_resp_bits_uop_bp_debug_if;
  wire         _mshrs_3_io_resp_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_3_io_resp_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_3_io_resp_bits_uop_debug_tsrc;
  wire [63:0]  _mshrs_3_io_resp_bits_data;
  wire         _mshrs_3_io_resp_bits_is_hella;
  wire         _mshrs_3_io_probe_rdy;
  wire         _mshrs_2_io_req_pri_rdy;
  wire         _mshrs_2_io_req_sec_rdy;
  wire         _mshrs_2_io_idx_valid;
  wire [5:0]   _mshrs_2_io_idx_bits;
  wire         _mshrs_2_io_way_valid;
  wire [7:0]   _mshrs_2_io_way_bits;
  wire         _mshrs_2_io_tag_valid;
  wire [27:0]  _mshrs_2_io_tag_bits;
  wire         _mshrs_2_io_mem_acquire_valid;
  wire [2:0]   _mshrs_2_io_mem_acquire_bits_param;
  wire [3:0]   _mshrs_2_io_mem_acquire_bits_source;
  wire [32:0]  _mshrs_2_io_mem_acquire_bits_address;
  wire         _mshrs_2_io_mem_grant_ready;
  wire         _mshrs_2_io_mem_finish_valid;
  wire [2:0]   _mshrs_2_io_mem_finish_bits_sink;
  wire         _mshrs_2_io_refill_valid;
  wire [7:0]   _mshrs_2_io_refill_bits_way_en;
  wire [11:0]  _mshrs_2_io_refill_bits_addr;
  wire [127:0] _mshrs_2_io_refill_bits_data;
  wire         _mshrs_2_io_meta_write_valid;
  wire [5:0]   _mshrs_2_io_meta_write_bits_idx;
  wire [7:0]   _mshrs_2_io_meta_write_bits_way_en;
  wire [1:0]   _mshrs_2_io_meta_write_bits_data_coh_state;
  wire [20:0]  _mshrs_2_io_meta_write_bits_data_tag;
  wire         _mshrs_2_io_meta_read_valid;
  wire [5:0]   _mshrs_2_io_meta_read_bits_idx;
  wire [7:0]   _mshrs_2_io_meta_read_bits_way_en;
  wire [20:0]  _mshrs_2_io_meta_read_bits_tag;
  wire         _mshrs_2_io_wb_req_valid;
  wire [20:0]  _mshrs_2_io_wb_req_bits_tag;
  wire [5:0]   _mshrs_2_io_wb_req_bits_idx;
  wire [2:0]   _mshrs_2_io_wb_req_bits_param;
  wire [7:0]   _mshrs_2_io_wb_req_bits_way_en;
  wire         _mshrs_2_io_commit_val;
  wire [39:0]  _mshrs_2_io_commit_addr;
  wire [1:0]   _mshrs_2_io_commit_coh_state;
  wire         _mshrs_2_io_lb_read_valid;
  wire [2:0]   _mshrs_2_io_lb_read_bits_id;
  wire [1:0]   _mshrs_2_io_lb_read_bits_offset;
  wire         _mshrs_2_io_lb_write_valid;
  wire [2:0]   _mshrs_2_io_lb_write_bits_id;
  wire [1:0]   _mshrs_2_io_lb_write_bits_offset;
  wire [127:0] _mshrs_2_io_lb_write_bits_data;
  wire         _mshrs_2_io_replay_valid;
  wire [6:0]   _mshrs_2_io_replay_bits_uop_uopc;
  wire [31:0]  _mshrs_2_io_replay_bits_uop_inst;
  wire [31:0]  _mshrs_2_io_replay_bits_uop_debug_inst;
  wire         _mshrs_2_io_replay_bits_uop_is_rvc;
  wire [39:0]  _mshrs_2_io_replay_bits_uop_debug_pc;
  wire [2:0]   _mshrs_2_io_replay_bits_uop_iq_type;
  wire [9:0]   _mshrs_2_io_replay_bits_uop_fu_code;
  wire [3:0]   _mshrs_2_io_replay_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_2_io_replay_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_2_io_replay_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_2_io_replay_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_2_io_replay_bits_uop_ctrl_op_fcn;
  wire         _mshrs_2_io_replay_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_2_io_replay_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_2_io_replay_bits_uop_ctrl_is_load;
  wire         _mshrs_2_io_replay_bits_uop_ctrl_is_sta;
  wire         _mshrs_2_io_replay_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_2_io_replay_bits_uop_iw_state;
  wire         _mshrs_2_io_replay_bits_uop_iw_p1_poisoned;
  wire         _mshrs_2_io_replay_bits_uop_iw_p2_poisoned;
  wire         _mshrs_2_io_replay_bits_uop_is_br;
  wire         _mshrs_2_io_replay_bits_uop_is_jalr;
  wire         _mshrs_2_io_replay_bits_uop_is_jal;
  wire         _mshrs_2_io_replay_bits_uop_is_sfb;
  wire [19:0]  _mshrs_2_io_replay_bits_uop_br_mask;
  wire [4:0]   _mshrs_2_io_replay_bits_uop_br_tag;
  wire [5:0]   _mshrs_2_io_replay_bits_uop_ftq_idx;
  wire         _mshrs_2_io_replay_bits_uop_edge_inst;
  wire [5:0]   _mshrs_2_io_replay_bits_uop_pc_lob;
  wire         _mshrs_2_io_replay_bits_uop_taken;
  wire [19:0]  _mshrs_2_io_replay_bits_uop_imm_packed;
  wire [11:0]  _mshrs_2_io_replay_bits_uop_csr_addr;
  wire [6:0]   _mshrs_2_io_replay_bits_uop_rob_idx;
  wire [4:0]   _mshrs_2_io_replay_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_2_io_replay_bits_uop_stq_idx;
  wire [1:0]   _mshrs_2_io_replay_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_2_io_replay_bits_uop_pdst;
  wire [6:0]   _mshrs_2_io_replay_bits_uop_prs1;
  wire [6:0]   _mshrs_2_io_replay_bits_uop_prs2;
  wire [6:0]   _mshrs_2_io_replay_bits_uop_prs3;
  wire [5:0]   _mshrs_2_io_replay_bits_uop_ppred;
  wire         _mshrs_2_io_replay_bits_uop_prs1_busy;
  wire         _mshrs_2_io_replay_bits_uop_prs2_busy;
  wire         _mshrs_2_io_replay_bits_uop_prs3_busy;
  wire         _mshrs_2_io_replay_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_2_io_replay_bits_uop_stale_pdst;
  wire         _mshrs_2_io_replay_bits_uop_exception;
  wire [63:0]  _mshrs_2_io_replay_bits_uop_exc_cause;
  wire         _mshrs_2_io_replay_bits_uop_bypassable;
  wire [4:0]   _mshrs_2_io_replay_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_2_io_replay_bits_uop_mem_size;
  wire         _mshrs_2_io_replay_bits_uop_mem_signed;
  wire         _mshrs_2_io_replay_bits_uop_is_fence;
  wire         _mshrs_2_io_replay_bits_uop_is_fencei;
  wire         _mshrs_2_io_replay_bits_uop_is_amo;
  wire         _mshrs_2_io_replay_bits_uop_uses_ldq;
  wire         _mshrs_2_io_replay_bits_uop_uses_stq;
  wire         _mshrs_2_io_replay_bits_uop_is_sys_pc2epc;
  wire         _mshrs_2_io_replay_bits_uop_is_unique;
  wire         _mshrs_2_io_replay_bits_uop_flush_on_commit;
  wire         _mshrs_2_io_replay_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_2_io_replay_bits_uop_ldst;
  wire [5:0]   _mshrs_2_io_replay_bits_uop_lrs1;
  wire [5:0]   _mshrs_2_io_replay_bits_uop_lrs2;
  wire [5:0]   _mshrs_2_io_replay_bits_uop_lrs3;
  wire         _mshrs_2_io_replay_bits_uop_ldst_val;
  wire [1:0]   _mshrs_2_io_replay_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_2_io_replay_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_2_io_replay_bits_uop_lrs2_rtype;
  wire         _mshrs_2_io_replay_bits_uop_frs3_en;
  wire         _mshrs_2_io_replay_bits_uop_fp_val;
  wire         _mshrs_2_io_replay_bits_uop_fp_single;
  wire         _mshrs_2_io_replay_bits_uop_xcpt_pf_if;
  wire         _mshrs_2_io_replay_bits_uop_xcpt_ae_if;
  wire         _mshrs_2_io_replay_bits_uop_xcpt_ma_if;
  wire         _mshrs_2_io_replay_bits_uop_bp_debug_if;
  wire         _mshrs_2_io_replay_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_2_io_replay_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_2_io_replay_bits_uop_debug_tsrc;
  wire [39:0]  _mshrs_2_io_replay_bits_addr;
  wire         _mshrs_2_io_replay_bits_is_hella;
  wire [7:0]   _mshrs_2_io_replay_bits_way_en;
  wire [4:0]   _mshrs_2_io_replay_bits_sdq_id;
  wire         _mshrs_2_io_resp_valid;
  wire [6:0]   _mshrs_2_io_resp_bits_uop_uopc;
  wire [31:0]  _mshrs_2_io_resp_bits_uop_inst;
  wire [31:0]  _mshrs_2_io_resp_bits_uop_debug_inst;
  wire         _mshrs_2_io_resp_bits_uop_is_rvc;
  wire [39:0]  _mshrs_2_io_resp_bits_uop_debug_pc;
  wire [2:0]   _mshrs_2_io_resp_bits_uop_iq_type;
  wire [9:0]   _mshrs_2_io_resp_bits_uop_fu_code;
  wire [3:0]   _mshrs_2_io_resp_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_2_io_resp_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_2_io_resp_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_2_io_resp_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_2_io_resp_bits_uop_ctrl_op_fcn;
  wire         _mshrs_2_io_resp_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_2_io_resp_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_2_io_resp_bits_uop_ctrl_is_load;
  wire         _mshrs_2_io_resp_bits_uop_ctrl_is_sta;
  wire         _mshrs_2_io_resp_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_2_io_resp_bits_uop_iw_state;
  wire         _mshrs_2_io_resp_bits_uop_iw_p1_poisoned;
  wire         _mshrs_2_io_resp_bits_uop_iw_p2_poisoned;
  wire         _mshrs_2_io_resp_bits_uop_is_br;
  wire         _mshrs_2_io_resp_bits_uop_is_jalr;
  wire         _mshrs_2_io_resp_bits_uop_is_jal;
  wire         _mshrs_2_io_resp_bits_uop_is_sfb;
  wire [19:0]  _mshrs_2_io_resp_bits_uop_br_mask;
  wire [4:0]   _mshrs_2_io_resp_bits_uop_br_tag;
  wire [5:0]   _mshrs_2_io_resp_bits_uop_ftq_idx;
  wire         _mshrs_2_io_resp_bits_uop_edge_inst;
  wire [5:0]   _mshrs_2_io_resp_bits_uop_pc_lob;
  wire         _mshrs_2_io_resp_bits_uop_taken;
  wire [19:0]  _mshrs_2_io_resp_bits_uop_imm_packed;
  wire [11:0]  _mshrs_2_io_resp_bits_uop_csr_addr;
  wire [6:0]   _mshrs_2_io_resp_bits_uop_rob_idx;
  wire [4:0]   _mshrs_2_io_resp_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_2_io_resp_bits_uop_stq_idx;
  wire [1:0]   _mshrs_2_io_resp_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_2_io_resp_bits_uop_pdst;
  wire [6:0]   _mshrs_2_io_resp_bits_uop_prs1;
  wire [6:0]   _mshrs_2_io_resp_bits_uop_prs2;
  wire [6:0]   _mshrs_2_io_resp_bits_uop_prs3;
  wire [5:0]   _mshrs_2_io_resp_bits_uop_ppred;
  wire         _mshrs_2_io_resp_bits_uop_prs1_busy;
  wire         _mshrs_2_io_resp_bits_uop_prs2_busy;
  wire         _mshrs_2_io_resp_bits_uop_prs3_busy;
  wire         _mshrs_2_io_resp_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_2_io_resp_bits_uop_stale_pdst;
  wire         _mshrs_2_io_resp_bits_uop_exception;
  wire [63:0]  _mshrs_2_io_resp_bits_uop_exc_cause;
  wire         _mshrs_2_io_resp_bits_uop_bypassable;
  wire [4:0]   _mshrs_2_io_resp_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_2_io_resp_bits_uop_mem_size;
  wire         _mshrs_2_io_resp_bits_uop_mem_signed;
  wire         _mshrs_2_io_resp_bits_uop_is_fence;
  wire         _mshrs_2_io_resp_bits_uop_is_fencei;
  wire         _mshrs_2_io_resp_bits_uop_is_amo;
  wire         _mshrs_2_io_resp_bits_uop_uses_ldq;
  wire         _mshrs_2_io_resp_bits_uop_uses_stq;
  wire         _mshrs_2_io_resp_bits_uop_is_sys_pc2epc;
  wire         _mshrs_2_io_resp_bits_uop_is_unique;
  wire         _mshrs_2_io_resp_bits_uop_flush_on_commit;
  wire         _mshrs_2_io_resp_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_2_io_resp_bits_uop_ldst;
  wire [5:0]   _mshrs_2_io_resp_bits_uop_lrs1;
  wire [5:0]   _mshrs_2_io_resp_bits_uop_lrs2;
  wire [5:0]   _mshrs_2_io_resp_bits_uop_lrs3;
  wire         _mshrs_2_io_resp_bits_uop_ldst_val;
  wire [1:0]   _mshrs_2_io_resp_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_2_io_resp_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_2_io_resp_bits_uop_lrs2_rtype;
  wire         _mshrs_2_io_resp_bits_uop_frs3_en;
  wire         _mshrs_2_io_resp_bits_uop_fp_val;
  wire         _mshrs_2_io_resp_bits_uop_fp_single;
  wire         _mshrs_2_io_resp_bits_uop_xcpt_pf_if;
  wire         _mshrs_2_io_resp_bits_uop_xcpt_ae_if;
  wire         _mshrs_2_io_resp_bits_uop_xcpt_ma_if;
  wire         _mshrs_2_io_resp_bits_uop_bp_debug_if;
  wire         _mshrs_2_io_resp_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_2_io_resp_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_2_io_resp_bits_uop_debug_tsrc;
  wire [63:0]  _mshrs_2_io_resp_bits_data;
  wire         _mshrs_2_io_resp_bits_is_hella;
  wire         _mshrs_2_io_probe_rdy;
  wire         _mshrs_1_io_req_pri_rdy;
  wire         _mshrs_1_io_req_sec_rdy;
  wire         _mshrs_1_io_idx_valid;
  wire [5:0]   _mshrs_1_io_idx_bits;
  wire         _mshrs_1_io_way_valid;
  wire [7:0]   _mshrs_1_io_way_bits;
  wire         _mshrs_1_io_tag_valid;
  wire [27:0]  _mshrs_1_io_tag_bits;
  wire         _mshrs_1_io_mem_acquire_valid;
  wire [2:0]   _mshrs_1_io_mem_acquire_bits_param;
  wire [3:0]   _mshrs_1_io_mem_acquire_bits_source;
  wire [32:0]  _mshrs_1_io_mem_acquire_bits_address;
  wire         _mshrs_1_io_mem_grant_ready;
  wire         _mshrs_1_io_mem_finish_valid;
  wire [2:0]   _mshrs_1_io_mem_finish_bits_sink;
  wire         _mshrs_1_io_refill_valid;
  wire [7:0]   _mshrs_1_io_refill_bits_way_en;
  wire [11:0]  _mshrs_1_io_refill_bits_addr;
  wire [127:0] _mshrs_1_io_refill_bits_data;
  wire         _mshrs_1_io_meta_write_valid;
  wire [5:0]   _mshrs_1_io_meta_write_bits_idx;
  wire [7:0]   _mshrs_1_io_meta_write_bits_way_en;
  wire [1:0]   _mshrs_1_io_meta_write_bits_data_coh_state;
  wire [20:0]  _mshrs_1_io_meta_write_bits_data_tag;
  wire         _mshrs_1_io_meta_read_valid;
  wire [5:0]   _mshrs_1_io_meta_read_bits_idx;
  wire [7:0]   _mshrs_1_io_meta_read_bits_way_en;
  wire [20:0]  _mshrs_1_io_meta_read_bits_tag;
  wire         _mshrs_1_io_wb_req_valid;
  wire [20:0]  _mshrs_1_io_wb_req_bits_tag;
  wire [5:0]   _mshrs_1_io_wb_req_bits_idx;
  wire [2:0]   _mshrs_1_io_wb_req_bits_param;
  wire [7:0]   _mshrs_1_io_wb_req_bits_way_en;
  wire         _mshrs_1_io_commit_val;
  wire [39:0]  _mshrs_1_io_commit_addr;
  wire [1:0]   _mshrs_1_io_commit_coh_state;
  wire         _mshrs_1_io_lb_read_valid;
  wire [2:0]   _mshrs_1_io_lb_read_bits_id;
  wire [1:0]   _mshrs_1_io_lb_read_bits_offset;
  wire         _mshrs_1_io_lb_write_valid;
  wire [2:0]   _mshrs_1_io_lb_write_bits_id;
  wire [1:0]   _mshrs_1_io_lb_write_bits_offset;
  wire [127:0] _mshrs_1_io_lb_write_bits_data;
  wire         _mshrs_1_io_replay_valid;
  wire [6:0]   _mshrs_1_io_replay_bits_uop_uopc;
  wire [31:0]  _mshrs_1_io_replay_bits_uop_inst;
  wire [31:0]  _mshrs_1_io_replay_bits_uop_debug_inst;
  wire         _mshrs_1_io_replay_bits_uop_is_rvc;
  wire [39:0]  _mshrs_1_io_replay_bits_uop_debug_pc;
  wire [2:0]   _mshrs_1_io_replay_bits_uop_iq_type;
  wire [9:0]   _mshrs_1_io_replay_bits_uop_fu_code;
  wire [3:0]   _mshrs_1_io_replay_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_1_io_replay_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_1_io_replay_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_1_io_replay_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_1_io_replay_bits_uop_ctrl_op_fcn;
  wire         _mshrs_1_io_replay_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_1_io_replay_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_1_io_replay_bits_uop_ctrl_is_load;
  wire         _mshrs_1_io_replay_bits_uop_ctrl_is_sta;
  wire         _mshrs_1_io_replay_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_1_io_replay_bits_uop_iw_state;
  wire         _mshrs_1_io_replay_bits_uop_iw_p1_poisoned;
  wire         _mshrs_1_io_replay_bits_uop_iw_p2_poisoned;
  wire         _mshrs_1_io_replay_bits_uop_is_br;
  wire         _mshrs_1_io_replay_bits_uop_is_jalr;
  wire         _mshrs_1_io_replay_bits_uop_is_jal;
  wire         _mshrs_1_io_replay_bits_uop_is_sfb;
  wire [19:0]  _mshrs_1_io_replay_bits_uop_br_mask;
  wire [4:0]   _mshrs_1_io_replay_bits_uop_br_tag;
  wire [5:0]   _mshrs_1_io_replay_bits_uop_ftq_idx;
  wire         _mshrs_1_io_replay_bits_uop_edge_inst;
  wire [5:0]   _mshrs_1_io_replay_bits_uop_pc_lob;
  wire         _mshrs_1_io_replay_bits_uop_taken;
  wire [19:0]  _mshrs_1_io_replay_bits_uop_imm_packed;
  wire [11:0]  _mshrs_1_io_replay_bits_uop_csr_addr;
  wire [6:0]   _mshrs_1_io_replay_bits_uop_rob_idx;
  wire [4:0]   _mshrs_1_io_replay_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_1_io_replay_bits_uop_stq_idx;
  wire [1:0]   _mshrs_1_io_replay_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_1_io_replay_bits_uop_pdst;
  wire [6:0]   _mshrs_1_io_replay_bits_uop_prs1;
  wire [6:0]   _mshrs_1_io_replay_bits_uop_prs2;
  wire [6:0]   _mshrs_1_io_replay_bits_uop_prs3;
  wire [5:0]   _mshrs_1_io_replay_bits_uop_ppred;
  wire         _mshrs_1_io_replay_bits_uop_prs1_busy;
  wire         _mshrs_1_io_replay_bits_uop_prs2_busy;
  wire         _mshrs_1_io_replay_bits_uop_prs3_busy;
  wire         _mshrs_1_io_replay_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_1_io_replay_bits_uop_stale_pdst;
  wire         _mshrs_1_io_replay_bits_uop_exception;
  wire [63:0]  _mshrs_1_io_replay_bits_uop_exc_cause;
  wire         _mshrs_1_io_replay_bits_uop_bypassable;
  wire [4:0]   _mshrs_1_io_replay_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_1_io_replay_bits_uop_mem_size;
  wire         _mshrs_1_io_replay_bits_uop_mem_signed;
  wire         _mshrs_1_io_replay_bits_uop_is_fence;
  wire         _mshrs_1_io_replay_bits_uop_is_fencei;
  wire         _mshrs_1_io_replay_bits_uop_is_amo;
  wire         _mshrs_1_io_replay_bits_uop_uses_ldq;
  wire         _mshrs_1_io_replay_bits_uop_uses_stq;
  wire         _mshrs_1_io_replay_bits_uop_is_sys_pc2epc;
  wire         _mshrs_1_io_replay_bits_uop_is_unique;
  wire         _mshrs_1_io_replay_bits_uop_flush_on_commit;
  wire         _mshrs_1_io_replay_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_1_io_replay_bits_uop_ldst;
  wire [5:0]   _mshrs_1_io_replay_bits_uop_lrs1;
  wire [5:0]   _mshrs_1_io_replay_bits_uop_lrs2;
  wire [5:0]   _mshrs_1_io_replay_bits_uop_lrs3;
  wire         _mshrs_1_io_replay_bits_uop_ldst_val;
  wire [1:0]   _mshrs_1_io_replay_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_1_io_replay_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_1_io_replay_bits_uop_lrs2_rtype;
  wire         _mshrs_1_io_replay_bits_uop_frs3_en;
  wire         _mshrs_1_io_replay_bits_uop_fp_val;
  wire         _mshrs_1_io_replay_bits_uop_fp_single;
  wire         _mshrs_1_io_replay_bits_uop_xcpt_pf_if;
  wire         _mshrs_1_io_replay_bits_uop_xcpt_ae_if;
  wire         _mshrs_1_io_replay_bits_uop_xcpt_ma_if;
  wire         _mshrs_1_io_replay_bits_uop_bp_debug_if;
  wire         _mshrs_1_io_replay_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_1_io_replay_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_1_io_replay_bits_uop_debug_tsrc;
  wire [39:0]  _mshrs_1_io_replay_bits_addr;
  wire         _mshrs_1_io_replay_bits_is_hella;
  wire [7:0]   _mshrs_1_io_replay_bits_way_en;
  wire [4:0]   _mshrs_1_io_replay_bits_sdq_id;
  wire         _mshrs_1_io_resp_valid;
  wire [6:0]   _mshrs_1_io_resp_bits_uop_uopc;
  wire [31:0]  _mshrs_1_io_resp_bits_uop_inst;
  wire [31:0]  _mshrs_1_io_resp_bits_uop_debug_inst;
  wire         _mshrs_1_io_resp_bits_uop_is_rvc;
  wire [39:0]  _mshrs_1_io_resp_bits_uop_debug_pc;
  wire [2:0]   _mshrs_1_io_resp_bits_uop_iq_type;
  wire [9:0]   _mshrs_1_io_resp_bits_uop_fu_code;
  wire [3:0]   _mshrs_1_io_resp_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_1_io_resp_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_1_io_resp_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_1_io_resp_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_1_io_resp_bits_uop_ctrl_op_fcn;
  wire         _mshrs_1_io_resp_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_1_io_resp_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_1_io_resp_bits_uop_ctrl_is_load;
  wire         _mshrs_1_io_resp_bits_uop_ctrl_is_sta;
  wire         _mshrs_1_io_resp_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_1_io_resp_bits_uop_iw_state;
  wire         _mshrs_1_io_resp_bits_uop_iw_p1_poisoned;
  wire         _mshrs_1_io_resp_bits_uop_iw_p2_poisoned;
  wire         _mshrs_1_io_resp_bits_uop_is_br;
  wire         _mshrs_1_io_resp_bits_uop_is_jalr;
  wire         _mshrs_1_io_resp_bits_uop_is_jal;
  wire         _mshrs_1_io_resp_bits_uop_is_sfb;
  wire [19:0]  _mshrs_1_io_resp_bits_uop_br_mask;
  wire [4:0]   _mshrs_1_io_resp_bits_uop_br_tag;
  wire [5:0]   _mshrs_1_io_resp_bits_uop_ftq_idx;
  wire         _mshrs_1_io_resp_bits_uop_edge_inst;
  wire [5:0]   _mshrs_1_io_resp_bits_uop_pc_lob;
  wire         _mshrs_1_io_resp_bits_uop_taken;
  wire [19:0]  _mshrs_1_io_resp_bits_uop_imm_packed;
  wire [11:0]  _mshrs_1_io_resp_bits_uop_csr_addr;
  wire [6:0]   _mshrs_1_io_resp_bits_uop_rob_idx;
  wire [4:0]   _mshrs_1_io_resp_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_1_io_resp_bits_uop_stq_idx;
  wire [1:0]   _mshrs_1_io_resp_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_1_io_resp_bits_uop_pdst;
  wire [6:0]   _mshrs_1_io_resp_bits_uop_prs1;
  wire [6:0]   _mshrs_1_io_resp_bits_uop_prs2;
  wire [6:0]   _mshrs_1_io_resp_bits_uop_prs3;
  wire [5:0]   _mshrs_1_io_resp_bits_uop_ppred;
  wire         _mshrs_1_io_resp_bits_uop_prs1_busy;
  wire         _mshrs_1_io_resp_bits_uop_prs2_busy;
  wire         _mshrs_1_io_resp_bits_uop_prs3_busy;
  wire         _mshrs_1_io_resp_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_1_io_resp_bits_uop_stale_pdst;
  wire         _mshrs_1_io_resp_bits_uop_exception;
  wire [63:0]  _mshrs_1_io_resp_bits_uop_exc_cause;
  wire         _mshrs_1_io_resp_bits_uop_bypassable;
  wire [4:0]   _mshrs_1_io_resp_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_1_io_resp_bits_uop_mem_size;
  wire         _mshrs_1_io_resp_bits_uop_mem_signed;
  wire         _mshrs_1_io_resp_bits_uop_is_fence;
  wire         _mshrs_1_io_resp_bits_uop_is_fencei;
  wire         _mshrs_1_io_resp_bits_uop_is_amo;
  wire         _mshrs_1_io_resp_bits_uop_uses_ldq;
  wire         _mshrs_1_io_resp_bits_uop_uses_stq;
  wire         _mshrs_1_io_resp_bits_uop_is_sys_pc2epc;
  wire         _mshrs_1_io_resp_bits_uop_is_unique;
  wire         _mshrs_1_io_resp_bits_uop_flush_on_commit;
  wire         _mshrs_1_io_resp_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_1_io_resp_bits_uop_ldst;
  wire [5:0]   _mshrs_1_io_resp_bits_uop_lrs1;
  wire [5:0]   _mshrs_1_io_resp_bits_uop_lrs2;
  wire [5:0]   _mshrs_1_io_resp_bits_uop_lrs3;
  wire         _mshrs_1_io_resp_bits_uop_ldst_val;
  wire [1:0]   _mshrs_1_io_resp_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_1_io_resp_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_1_io_resp_bits_uop_lrs2_rtype;
  wire         _mshrs_1_io_resp_bits_uop_frs3_en;
  wire         _mshrs_1_io_resp_bits_uop_fp_val;
  wire         _mshrs_1_io_resp_bits_uop_fp_single;
  wire         _mshrs_1_io_resp_bits_uop_xcpt_pf_if;
  wire         _mshrs_1_io_resp_bits_uop_xcpt_ae_if;
  wire         _mshrs_1_io_resp_bits_uop_xcpt_ma_if;
  wire         _mshrs_1_io_resp_bits_uop_bp_debug_if;
  wire         _mshrs_1_io_resp_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_1_io_resp_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_1_io_resp_bits_uop_debug_tsrc;
  wire [63:0]  _mshrs_1_io_resp_bits_data;
  wire         _mshrs_1_io_resp_bits_is_hella;
  wire         _mshrs_1_io_probe_rdy;
  wire         _mshrs_0_io_req_pri_rdy;
  wire         _mshrs_0_io_req_sec_rdy;
  wire         _mshrs_0_io_idx_valid;
  wire [5:0]   _mshrs_0_io_idx_bits;
  wire         _mshrs_0_io_way_valid;
  wire [7:0]   _mshrs_0_io_way_bits;
  wire         _mshrs_0_io_tag_valid;
  wire [27:0]  _mshrs_0_io_tag_bits;
  wire         _mshrs_0_io_mem_acquire_valid;
  wire [2:0]   _mshrs_0_io_mem_acquire_bits_param;
  wire [3:0]   _mshrs_0_io_mem_acquire_bits_source;
  wire [32:0]  _mshrs_0_io_mem_acquire_bits_address;
  wire         _mshrs_0_io_mem_grant_ready;
  wire         _mshrs_0_io_mem_finish_valid;
  wire [2:0]   _mshrs_0_io_mem_finish_bits_sink;
  wire         _mshrs_0_io_refill_valid;
  wire [7:0]   _mshrs_0_io_refill_bits_way_en;
  wire [11:0]  _mshrs_0_io_refill_bits_addr;
  wire [127:0] _mshrs_0_io_refill_bits_data;
  wire         _mshrs_0_io_meta_write_valid;
  wire [5:0]   _mshrs_0_io_meta_write_bits_idx;
  wire [7:0]   _mshrs_0_io_meta_write_bits_way_en;
  wire [1:0]   _mshrs_0_io_meta_write_bits_data_coh_state;
  wire [20:0]  _mshrs_0_io_meta_write_bits_data_tag;
  wire         _mshrs_0_io_meta_read_valid;
  wire [5:0]   _mshrs_0_io_meta_read_bits_idx;
  wire [7:0]   _mshrs_0_io_meta_read_bits_way_en;
  wire [20:0]  _mshrs_0_io_meta_read_bits_tag;
  wire         _mshrs_0_io_wb_req_valid;
  wire [20:0]  _mshrs_0_io_wb_req_bits_tag;
  wire [5:0]   _mshrs_0_io_wb_req_bits_idx;
  wire [2:0]   _mshrs_0_io_wb_req_bits_param;
  wire [7:0]   _mshrs_0_io_wb_req_bits_way_en;
  wire         _mshrs_0_io_commit_val;
  wire [39:0]  _mshrs_0_io_commit_addr;
  wire [1:0]   _mshrs_0_io_commit_coh_state;
  wire         _mshrs_0_io_lb_read_valid;
  wire [2:0]   _mshrs_0_io_lb_read_bits_id;
  wire [1:0]   _mshrs_0_io_lb_read_bits_offset;
  wire         _mshrs_0_io_lb_write_valid;
  wire [2:0]   _mshrs_0_io_lb_write_bits_id;
  wire [1:0]   _mshrs_0_io_lb_write_bits_offset;
  wire [127:0] _mshrs_0_io_lb_write_bits_data;
  wire         _mshrs_0_io_replay_valid;
  wire [6:0]   _mshrs_0_io_replay_bits_uop_uopc;
  wire [31:0]  _mshrs_0_io_replay_bits_uop_inst;
  wire [31:0]  _mshrs_0_io_replay_bits_uop_debug_inst;
  wire         _mshrs_0_io_replay_bits_uop_is_rvc;
  wire [39:0]  _mshrs_0_io_replay_bits_uop_debug_pc;
  wire [2:0]   _mshrs_0_io_replay_bits_uop_iq_type;
  wire [9:0]   _mshrs_0_io_replay_bits_uop_fu_code;
  wire [3:0]   _mshrs_0_io_replay_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_0_io_replay_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_0_io_replay_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_0_io_replay_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_0_io_replay_bits_uop_ctrl_op_fcn;
  wire         _mshrs_0_io_replay_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_0_io_replay_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_0_io_replay_bits_uop_ctrl_is_load;
  wire         _mshrs_0_io_replay_bits_uop_ctrl_is_sta;
  wire         _mshrs_0_io_replay_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_0_io_replay_bits_uop_iw_state;
  wire         _mshrs_0_io_replay_bits_uop_iw_p1_poisoned;
  wire         _mshrs_0_io_replay_bits_uop_iw_p2_poisoned;
  wire         _mshrs_0_io_replay_bits_uop_is_br;
  wire         _mshrs_0_io_replay_bits_uop_is_jalr;
  wire         _mshrs_0_io_replay_bits_uop_is_jal;
  wire         _mshrs_0_io_replay_bits_uop_is_sfb;
  wire [19:0]  _mshrs_0_io_replay_bits_uop_br_mask;
  wire [4:0]   _mshrs_0_io_replay_bits_uop_br_tag;
  wire [5:0]   _mshrs_0_io_replay_bits_uop_ftq_idx;
  wire         _mshrs_0_io_replay_bits_uop_edge_inst;
  wire [5:0]   _mshrs_0_io_replay_bits_uop_pc_lob;
  wire         _mshrs_0_io_replay_bits_uop_taken;
  wire [19:0]  _mshrs_0_io_replay_bits_uop_imm_packed;
  wire [11:0]  _mshrs_0_io_replay_bits_uop_csr_addr;
  wire [6:0]   _mshrs_0_io_replay_bits_uop_rob_idx;
  wire [4:0]   _mshrs_0_io_replay_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_0_io_replay_bits_uop_stq_idx;
  wire [1:0]   _mshrs_0_io_replay_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_0_io_replay_bits_uop_pdst;
  wire [6:0]   _mshrs_0_io_replay_bits_uop_prs1;
  wire [6:0]   _mshrs_0_io_replay_bits_uop_prs2;
  wire [6:0]   _mshrs_0_io_replay_bits_uop_prs3;
  wire [5:0]   _mshrs_0_io_replay_bits_uop_ppred;
  wire         _mshrs_0_io_replay_bits_uop_prs1_busy;
  wire         _mshrs_0_io_replay_bits_uop_prs2_busy;
  wire         _mshrs_0_io_replay_bits_uop_prs3_busy;
  wire         _mshrs_0_io_replay_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_0_io_replay_bits_uop_stale_pdst;
  wire         _mshrs_0_io_replay_bits_uop_exception;
  wire [63:0]  _mshrs_0_io_replay_bits_uop_exc_cause;
  wire         _mshrs_0_io_replay_bits_uop_bypassable;
  wire [4:0]   _mshrs_0_io_replay_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_0_io_replay_bits_uop_mem_size;
  wire         _mshrs_0_io_replay_bits_uop_mem_signed;
  wire         _mshrs_0_io_replay_bits_uop_is_fence;
  wire         _mshrs_0_io_replay_bits_uop_is_fencei;
  wire         _mshrs_0_io_replay_bits_uop_is_amo;
  wire         _mshrs_0_io_replay_bits_uop_uses_ldq;
  wire         _mshrs_0_io_replay_bits_uop_uses_stq;
  wire         _mshrs_0_io_replay_bits_uop_is_sys_pc2epc;
  wire         _mshrs_0_io_replay_bits_uop_is_unique;
  wire         _mshrs_0_io_replay_bits_uop_flush_on_commit;
  wire         _mshrs_0_io_replay_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_0_io_replay_bits_uop_ldst;
  wire [5:0]   _mshrs_0_io_replay_bits_uop_lrs1;
  wire [5:0]   _mshrs_0_io_replay_bits_uop_lrs2;
  wire [5:0]   _mshrs_0_io_replay_bits_uop_lrs3;
  wire         _mshrs_0_io_replay_bits_uop_ldst_val;
  wire [1:0]   _mshrs_0_io_replay_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_0_io_replay_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_0_io_replay_bits_uop_lrs2_rtype;
  wire         _mshrs_0_io_replay_bits_uop_frs3_en;
  wire         _mshrs_0_io_replay_bits_uop_fp_val;
  wire         _mshrs_0_io_replay_bits_uop_fp_single;
  wire         _mshrs_0_io_replay_bits_uop_xcpt_pf_if;
  wire         _mshrs_0_io_replay_bits_uop_xcpt_ae_if;
  wire         _mshrs_0_io_replay_bits_uop_xcpt_ma_if;
  wire         _mshrs_0_io_replay_bits_uop_bp_debug_if;
  wire         _mshrs_0_io_replay_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_0_io_replay_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_0_io_replay_bits_uop_debug_tsrc;
  wire [39:0]  _mshrs_0_io_replay_bits_addr;
  wire         _mshrs_0_io_replay_bits_is_hella;
  wire [7:0]   _mshrs_0_io_replay_bits_way_en;
  wire [4:0]   _mshrs_0_io_replay_bits_sdq_id;
  wire         _mshrs_0_io_resp_valid;
  wire [6:0]   _mshrs_0_io_resp_bits_uop_uopc;
  wire [31:0]  _mshrs_0_io_resp_bits_uop_inst;
  wire [31:0]  _mshrs_0_io_resp_bits_uop_debug_inst;
  wire         _mshrs_0_io_resp_bits_uop_is_rvc;
  wire [39:0]  _mshrs_0_io_resp_bits_uop_debug_pc;
  wire [2:0]   _mshrs_0_io_resp_bits_uop_iq_type;
  wire [9:0]   _mshrs_0_io_resp_bits_uop_fu_code;
  wire [3:0]   _mshrs_0_io_resp_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_0_io_resp_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_0_io_resp_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_0_io_resp_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_0_io_resp_bits_uop_ctrl_op_fcn;
  wire         _mshrs_0_io_resp_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_0_io_resp_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_0_io_resp_bits_uop_ctrl_is_load;
  wire         _mshrs_0_io_resp_bits_uop_ctrl_is_sta;
  wire         _mshrs_0_io_resp_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_0_io_resp_bits_uop_iw_state;
  wire         _mshrs_0_io_resp_bits_uop_iw_p1_poisoned;
  wire         _mshrs_0_io_resp_bits_uop_iw_p2_poisoned;
  wire         _mshrs_0_io_resp_bits_uop_is_br;
  wire         _mshrs_0_io_resp_bits_uop_is_jalr;
  wire         _mshrs_0_io_resp_bits_uop_is_jal;
  wire         _mshrs_0_io_resp_bits_uop_is_sfb;
  wire [19:0]  _mshrs_0_io_resp_bits_uop_br_mask;
  wire [4:0]   _mshrs_0_io_resp_bits_uop_br_tag;
  wire [5:0]   _mshrs_0_io_resp_bits_uop_ftq_idx;
  wire         _mshrs_0_io_resp_bits_uop_edge_inst;
  wire [5:0]   _mshrs_0_io_resp_bits_uop_pc_lob;
  wire         _mshrs_0_io_resp_bits_uop_taken;
  wire [19:0]  _mshrs_0_io_resp_bits_uop_imm_packed;
  wire [11:0]  _mshrs_0_io_resp_bits_uop_csr_addr;
  wire [6:0]   _mshrs_0_io_resp_bits_uop_rob_idx;
  wire [4:0]   _mshrs_0_io_resp_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_0_io_resp_bits_uop_stq_idx;
  wire [1:0]   _mshrs_0_io_resp_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_0_io_resp_bits_uop_pdst;
  wire [6:0]   _mshrs_0_io_resp_bits_uop_prs1;
  wire [6:0]   _mshrs_0_io_resp_bits_uop_prs2;
  wire [6:0]   _mshrs_0_io_resp_bits_uop_prs3;
  wire [5:0]   _mshrs_0_io_resp_bits_uop_ppred;
  wire         _mshrs_0_io_resp_bits_uop_prs1_busy;
  wire         _mshrs_0_io_resp_bits_uop_prs2_busy;
  wire         _mshrs_0_io_resp_bits_uop_prs3_busy;
  wire         _mshrs_0_io_resp_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_0_io_resp_bits_uop_stale_pdst;
  wire         _mshrs_0_io_resp_bits_uop_exception;
  wire [63:0]  _mshrs_0_io_resp_bits_uop_exc_cause;
  wire         _mshrs_0_io_resp_bits_uop_bypassable;
  wire [4:0]   _mshrs_0_io_resp_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_0_io_resp_bits_uop_mem_size;
  wire         _mshrs_0_io_resp_bits_uop_mem_signed;
  wire         _mshrs_0_io_resp_bits_uop_is_fence;
  wire         _mshrs_0_io_resp_bits_uop_is_fencei;
  wire         _mshrs_0_io_resp_bits_uop_is_amo;
  wire         _mshrs_0_io_resp_bits_uop_uses_ldq;
  wire         _mshrs_0_io_resp_bits_uop_uses_stq;
  wire         _mshrs_0_io_resp_bits_uop_is_sys_pc2epc;
  wire         _mshrs_0_io_resp_bits_uop_is_unique;
  wire         _mshrs_0_io_resp_bits_uop_flush_on_commit;
  wire         _mshrs_0_io_resp_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_0_io_resp_bits_uop_ldst;
  wire [5:0]   _mshrs_0_io_resp_bits_uop_lrs1;
  wire [5:0]   _mshrs_0_io_resp_bits_uop_lrs2;
  wire [5:0]   _mshrs_0_io_resp_bits_uop_lrs3;
  wire         _mshrs_0_io_resp_bits_uop_ldst_val;
  wire [1:0]   _mshrs_0_io_resp_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_0_io_resp_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_0_io_resp_bits_uop_lrs2_rtype;
  wire         _mshrs_0_io_resp_bits_uop_frs3_en;
  wire         _mshrs_0_io_resp_bits_uop_fp_val;
  wire         _mshrs_0_io_resp_bits_uop_fp_single;
  wire         _mshrs_0_io_resp_bits_uop_xcpt_pf_if;
  wire         _mshrs_0_io_resp_bits_uop_xcpt_ae_if;
  wire         _mshrs_0_io_resp_bits_uop_xcpt_ma_if;
  wire         _mshrs_0_io_resp_bits_uop_bp_debug_if;
  wire         _mshrs_0_io_resp_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_0_io_resp_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_0_io_resp_bits_uop_debug_tsrc;
  wire [63:0]  _mshrs_0_io_resp_bits_data;
  wire         _mshrs_0_io_resp_bits_is_hella;
  wire         _mshrs_0_io_probe_rdy;
  wire         _refill_arb_io_in_0_ready;
  wire         _refill_arb_io_in_1_ready;
  wire         _refill_arb_io_in_2_ready;
  wire         _refill_arb_io_in_3_ready;
  wire         _refill_arb_io_in_4_ready;
  wire         _refill_arb_io_in_5_ready;
  wire         _refill_arb_io_in_6_ready;
  wire         _refill_arb_io_in_7_ready;
  wire         _resp_arb_io_in_0_ready;
  wire         _resp_arb_io_in_1_ready;
  wire         _resp_arb_io_in_2_ready;
  wire         _resp_arb_io_in_3_ready;
  wire         _resp_arb_io_in_4_ready;
  wire         _resp_arb_io_in_5_ready;
  wire         _resp_arb_io_in_6_ready;
  wire         _resp_arb_io_in_7_ready;
  wire         _resp_arb_io_in_8_ready;
  wire         _resp_arb_io_out_valid;
  wire [6:0]   _resp_arb_io_out_bits_uop_uopc;
  wire [31:0]  _resp_arb_io_out_bits_uop_inst;
  wire [31:0]  _resp_arb_io_out_bits_uop_debug_inst;
  wire         _resp_arb_io_out_bits_uop_is_rvc;
  wire [39:0]  _resp_arb_io_out_bits_uop_debug_pc;
  wire [2:0]   _resp_arb_io_out_bits_uop_iq_type;
  wire [9:0]   _resp_arb_io_out_bits_uop_fu_code;
  wire [3:0]   _resp_arb_io_out_bits_uop_ctrl_br_type;
  wire [1:0]   _resp_arb_io_out_bits_uop_ctrl_op1_sel;
  wire [2:0]   _resp_arb_io_out_bits_uop_ctrl_op2_sel;
  wire [2:0]   _resp_arb_io_out_bits_uop_ctrl_imm_sel;
  wire [3:0]   _resp_arb_io_out_bits_uop_ctrl_op_fcn;
  wire         _resp_arb_io_out_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _resp_arb_io_out_bits_uop_ctrl_csr_cmd;
  wire         _resp_arb_io_out_bits_uop_ctrl_is_load;
  wire         _resp_arb_io_out_bits_uop_ctrl_is_sta;
  wire         _resp_arb_io_out_bits_uop_ctrl_is_std;
  wire [1:0]   _resp_arb_io_out_bits_uop_iw_state;
  wire         _resp_arb_io_out_bits_uop_iw_p1_poisoned;
  wire         _resp_arb_io_out_bits_uop_iw_p2_poisoned;
  wire         _resp_arb_io_out_bits_uop_is_br;
  wire         _resp_arb_io_out_bits_uop_is_jalr;
  wire         _resp_arb_io_out_bits_uop_is_jal;
  wire         _resp_arb_io_out_bits_uop_is_sfb;
  wire [19:0]  _resp_arb_io_out_bits_uop_br_mask;
  wire [4:0]   _resp_arb_io_out_bits_uop_br_tag;
  wire [5:0]   _resp_arb_io_out_bits_uop_ftq_idx;
  wire         _resp_arb_io_out_bits_uop_edge_inst;
  wire [5:0]   _resp_arb_io_out_bits_uop_pc_lob;
  wire         _resp_arb_io_out_bits_uop_taken;
  wire [19:0]  _resp_arb_io_out_bits_uop_imm_packed;
  wire [11:0]  _resp_arb_io_out_bits_uop_csr_addr;
  wire [6:0]   _resp_arb_io_out_bits_uop_rob_idx;
  wire [4:0]   _resp_arb_io_out_bits_uop_ldq_idx;
  wire [4:0]   _resp_arb_io_out_bits_uop_stq_idx;
  wire [1:0]   _resp_arb_io_out_bits_uop_rxq_idx;
  wire [6:0]   _resp_arb_io_out_bits_uop_pdst;
  wire [6:0]   _resp_arb_io_out_bits_uop_prs1;
  wire [6:0]   _resp_arb_io_out_bits_uop_prs2;
  wire [6:0]   _resp_arb_io_out_bits_uop_prs3;
  wire [5:0]   _resp_arb_io_out_bits_uop_ppred;
  wire         _resp_arb_io_out_bits_uop_prs1_busy;
  wire         _resp_arb_io_out_bits_uop_prs2_busy;
  wire         _resp_arb_io_out_bits_uop_prs3_busy;
  wire         _resp_arb_io_out_bits_uop_ppred_busy;
  wire [6:0]   _resp_arb_io_out_bits_uop_stale_pdst;
  wire         _resp_arb_io_out_bits_uop_exception;
  wire [63:0]  _resp_arb_io_out_bits_uop_exc_cause;
  wire         _resp_arb_io_out_bits_uop_bypassable;
  wire [4:0]   _resp_arb_io_out_bits_uop_mem_cmd;
  wire [1:0]   _resp_arb_io_out_bits_uop_mem_size;
  wire         _resp_arb_io_out_bits_uop_mem_signed;
  wire         _resp_arb_io_out_bits_uop_is_fence;
  wire         _resp_arb_io_out_bits_uop_is_fencei;
  wire         _resp_arb_io_out_bits_uop_is_amo;
  wire         _resp_arb_io_out_bits_uop_uses_ldq;
  wire         _resp_arb_io_out_bits_uop_uses_stq;
  wire         _resp_arb_io_out_bits_uop_is_sys_pc2epc;
  wire         _resp_arb_io_out_bits_uop_is_unique;
  wire         _resp_arb_io_out_bits_uop_flush_on_commit;
  wire         _resp_arb_io_out_bits_uop_ldst_is_rs1;
  wire [5:0]   _resp_arb_io_out_bits_uop_ldst;
  wire [5:0]   _resp_arb_io_out_bits_uop_lrs1;
  wire [5:0]   _resp_arb_io_out_bits_uop_lrs2;
  wire [5:0]   _resp_arb_io_out_bits_uop_lrs3;
  wire         _resp_arb_io_out_bits_uop_ldst_val;
  wire [1:0]   _resp_arb_io_out_bits_uop_dst_rtype;
  wire [1:0]   _resp_arb_io_out_bits_uop_lrs1_rtype;
  wire [1:0]   _resp_arb_io_out_bits_uop_lrs2_rtype;
  wire         _resp_arb_io_out_bits_uop_frs3_en;
  wire         _resp_arb_io_out_bits_uop_fp_val;
  wire         _resp_arb_io_out_bits_uop_fp_single;
  wire         _resp_arb_io_out_bits_uop_xcpt_pf_if;
  wire         _resp_arb_io_out_bits_uop_xcpt_ae_if;
  wire         _resp_arb_io_out_bits_uop_xcpt_ma_if;
  wire         _resp_arb_io_out_bits_uop_bp_debug_if;
  wire         _resp_arb_io_out_bits_uop_bp_xcpt_if;
  wire [1:0]   _resp_arb_io_out_bits_uop_debug_fsrc;
  wire [1:0]   _resp_arb_io_out_bits_uop_debug_tsrc;
  wire [63:0]  _resp_arb_io_out_bits_data;
  wire         _resp_arb_io_out_bits_is_hella;
  wire         _replay_arb_io_in_0_ready;
  wire         _replay_arb_io_in_1_ready;
  wire         _replay_arb_io_in_2_ready;
  wire         _replay_arb_io_in_3_ready;
  wire         _replay_arb_io_in_4_ready;
  wire         _replay_arb_io_in_5_ready;
  wire         _replay_arb_io_in_6_ready;
  wire         _replay_arb_io_in_7_ready;
  wire         _replay_arb_io_out_valid;
  wire [4:0]   _replay_arb_io_out_bits_uop_mem_cmd;
  wire [4:0]   _replay_arb_io_out_bits_sdq_id;
  wire         _wb_req_arb_io_in_0_ready;
  wire         _wb_req_arb_io_in_1_ready;
  wire         _wb_req_arb_io_in_2_ready;
  wire         _wb_req_arb_io_in_3_ready;
  wire         _wb_req_arb_io_in_4_ready;
  wire         _wb_req_arb_io_in_5_ready;
  wire         _wb_req_arb_io_in_6_ready;
  wire         _wb_req_arb_io_in_7_ready;
  wire         _meta_read_arb_io_in_0_ready;
  wire         _meta_read_arb_io_in_1_ready;
  wire         _meta_read_arb_io_in_2_ready;
  wire         _meta_read_arb_io_in_3_ready;
  wire         _meta_read_arb_io_in_4_ready;
  wire         _meta_read_arb_io_in_5_ready;
  wire         _meta_read_arb_io_in_6_ready;
  wire         _meta_read_arb_io_in_7_ready;
  wire         _meta_write_arb_io_in_0_ready;
  wire         _meta_write_arb_io_in_1_ready;
  wire         _meta_write_arb_io_in_2_ready;
  wire         _meta_write_arb_io_in_3_ready;
  wire         _meta_write_arb_io_in_4_ready;
  wire         _meta_write_arb_io_in_5_ready;
  wire         _meta_write_arb_io_in_6_ready;
  wire         _meta_write_arb_io_in_7_ready;
  wire         _lb_write_arb_io_in_1_ready;
  wire         _lb_write_arb_io_in_2_ready;
  wire         _lb_write_arb_io_in_3_ready;
  wire         _lb_write_arb_io_in_4_ready;
  wire         _lb_write_arb_io_in_5_ready;
  wire         _lb_write_arb_io_in_6_ready;
  wire         _lb_write_arb_io_in_7_ready;
  wire         _lb_write_arb_io_out_valid;
  wire [2:0]   _lb_write_arb_io_out_bits_id;
  wire [1:0]   _lb_write_arb_io_out_bits_offset;
  wire [127:0] _lb_write_arb_io_out_bits_data;
  wire         _lb_read_arb_io_in_0_ready;
  wire         _lb_read_arb_io_in_1_ready;
  wire         _lb_read_arb_io_in_2_ready;
  wire         _lb_read_arb_io_in_3_ready;
  wire         _lb_read_arb_io_in_4_ready;
  wire         _lb_read_arb_io_in_5_ready;
  wire         _lb_read_arb_io_in_6_ready;
  wire         _lb_read_arb_io_in_7_ready;
  wire         _lb_read_arb_io_out_valid;
  wire [2:0]   _lb_read_arb_io_out_bits_id;
  wire [1:0]   _lb_read_arb_io_out_bits_offset;
  wire [127:0] _lb_ext_R0_data;
  wire         _GEN = io_req_1_valid ? io_req_1_valid : io_req_0_valid;
  wire [6:0]   _GEN_0 = io_req_1_valid ? io_req_1_bits_uop_uopc : io_req_0_bits_uop_uopc;
  wire [31:0]  _GEN_1 = io_req_1_valid ? io_req_1_bits_uop_inst : io_req_0_bits_uop_inst;
  wire [31:0]  _GEN_2 = io_req_1_valid ? io_req_1_bits_uop_debug_inst : io_req_0_bits_uop_debug_inst;
  wire         _GEN_3 = io_req_1_valid ? io_req_1_bits_uop_is_rvc : io_req_0_bits_uop_is_rvc;
  wire [39:0]  _GEN_4 = io_req_1_valid ? io_req_1_bits_uop_debug_pc : io_req_0_bits_uop_debug_pc;
  wire [2:0]   _GEN_5 = io_req_1_valid ? io_req_1_bits_uop_iq_type : io_req_0_bits_uop_iq_type;
  wire [9:0]   _GEN_6 = io_req_1_valid ? io_req_1_bits_uop_fu_code : io_req_0_bits_uop_fu_code;
  wire [3:0]   _GEN_7 = io_req_1_valid ? io_req_1_bits_uop_ctrl_br_type : io_req_0_bits_uop_ctrl_br_type;
  wire [1:0]   _GEN_8 = io_req_1_valid ? io_req_1_bits_uop_ctrl_op1_sel : io_req_0_bits_uop_ctrl_op1_sel;
  wire [2:0]   _GEN_9 = io_req_1_valid ? io_req_1_bits_uop_ctrl_op2_sel : io_req_0_bits_uop_ctrl_op2_sel;
  wire [2:0]   _GEN_10 = io_req_1_valid ? io_req_1_bits_uop_ctrl_imm_sel : io_req_0_bits_uop_ctrl_imm_sel;
  wire [3:0]   _GEN_11 = io_req_1_valid ? io_req_1_bits_uop_ctrl_op_fcn : io_req_0_bits_uop_ctrl_op_fcn;
  wire         _GEN_12 = io_req_1_valid ? io_req_1_bits_uop_ctrl_fcn_dw : io_req_0_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _GEN_13 = io_req_1_valid ? io_req_1_bits_uop_ctrl_csr_cmd : io_req_0_bits_uop_ctrl_csr_cmd;
  wire         _GEN_14 = io_req_1_valid ? io_req_1_bits_uop_ctrl_is_load : io_req_0_bits_uop_ctrl_is_load;
  wire         _GEN_15 = io_req_1_valid ? io_req_1_bits_uop_ctrl_is_sta : io_req_0_bits_uop_ctrl_is_sta;
  wire         _GEN_16 = io_req_1_valid ? io_req_1_bits_uop_ctrl_is_std : io_req_0_bits_uop_ctrl_is_std;
  wire [1:0]   _GEN_17 = io_req_1_valid ? io_req_1_bits_uop_iw_state : io_req_0_bits_uop_iw_state;
  wire         _GEN_18 = io_req_1_valid ? io_req_1_bits_uop_iw_p1_poisoned : io_req_0_bits_uop_iw_p1_poisoned;
  wire         _GEN_19 = io_req_1_valid ? io_req_1_bits_uop_iw_p2_poisoned : io_req_0_bits_uop_iw_p2_poisoned;
  wire         _GEN_20 = io_req_1_valid ? io_req_1_bits_uop_is_br : io_req_0_bits_uop_is_br;
  wire         _GEN_21 = io_req_1_valid ? io_req_1_bits_uop_is_jalr : io_req_0_bits_uop_is_jalr;
  wire         _GEN_22 = io_req_1_valid ? io_req_1_bits_uop_is_jal : io_req_0_bits_uop_is_jal;
  wire         _GEN_23 = io_req_1_valid ? io_req_1_bits_uop_is_sfb : io_req_0_bits_uop_is_sfb;
  wire [19:0]  _GEN_24 = io_req_1_valid ? io_req_1_bits_uop_br_mask : io_req_0_bits_uop_br_mask;
  wire [4:0]   _GEN_25 = io_req_1_valid ? io_req_1_bits_uop_br_tag : io_req_0_bits_uop_br_tag;
  wire [5:0]   _GEN_26 = io_req_1_valid ? io_req_1_bits_uop_ftq_idx : io_req_0_bits_uop_ftq_idx;
  wire         _GEN_27 = io_req_1_valid ? io_req_1_bits_uop_edge_inst : io_req_0_bits_uop_edge_inst;
  wire [5:0]   _GEN_28 = io_req_1_valid ? io_req_1_bits_uop_pc_lob : io_req_0_bits_uop_pc_lob;
  wire         _GEN_29 = io_req_1_valid ? io_req_1_bits_uop_taken : io_req_0_bits_uop_taken;
  wire [19:0]  _GEN_30 = io_req_1_valid ? io_req_1_bits_uop_imm_packed : io_req_0_bits_uop_imm_packed;
  wire [11:0]  _GEN_31 = io_req_1_valid ? io_req_1_bits_uop_csr_addr : io_req_0_bits_uop_csr_addr;
  wire [6:0]   _GEN_32 = io_req_1_valid ? io_req_1_bits_uop_rob_idx : io_req_0_bits_uop_rob_idx;
  wire [4:0]   _GEN_33 = io_req_1_valid ? io_req_1_bits_uop_ldq_idx : io_req_0_bits_uop_ldq_idx;
  wire [4:0]   _GEN_34 = io_req_1_valid ? io_req_1_bits_uop_stq_idx : io_req_0_bits_uop_stq_idx;
  wire [1:0]   _GEN_35 = io_req_1_valid ? io_req_1_bits_uop_rxq_idx : io_req_0_bits_uop_rxq_idx;
  wire [6:0]   _GEN_36 = io_req_1_valid ? io_req_1_bits_uop_pdst : io_req_0_bits_uop_pdst;
  wire [6:0]   _GEN_37 = io_req_1_valid ? io_req_1_bits_uop_prs1 : io_req_0_bits_uop_prs1;
  wire [6:0]   _GEN_38 = io_req_1_valid ? io_req_1_bits_uop_prs2 : io_req_0_bits_uop_prs2;
  wire [6:0]   _GEN_39 = io_req_1_valid ? io_req_1_bits_uop_prs3 : io_req_0_bits_uop_prs3;
  wire [5:0]   _GEN_40 = io_req_1_valid ? io_req_1_bits_uop_ppred : io_req_0_bits_uop_ppred;
  wire         _GEN_41 = io_req_1_valid ? io_req_1_bits_uop_prs1_busy : io_req_0_bits_uop_prs1_busy;
  wire         _GEN_42 = io_req_1_valid ? io_req_1_bits_uop_prs2_busy : io_req_0_bits_uop_prs2_busy;
  wire         _GEN_43 = io_req_1_valid ? io_req_1_bits_uop_prs3_busy : io_req_0_bits_uop_prs3_busy;
  wire         _GEN_44 = io_req_1_valid ? io_req_1_bits_uop_ppred_busy : io_req_0_bits_uop_ppred_busy;
  wire [6:0]   _GEN_45 = io_req_1_valid ? io_req_1_bits_uop_stale_pdst : io_req_0_bits_uop_stale_pdst;
  wire         _GEN_46 = io_req_1_valid ? io_req_1_bits_uop_exception : io_req_0_bits_uop_exception;
  wire [63:0]  _GEN_47 = io_req_1_valid ? io_req_1_bits_uop_exc_cause : io_req_0_bits_uop_exc_cause;
  wire         _GEN_48 = io_req_1_valid ? io_req_1_bits_uop_bypassable : io_req_0_bits_uop_bypassable;
  wire [4:0]   _GEN_49 = io_req_1_valid ? io_req_1_bits_uop_mem_cmd : io_req_0_bits_uop_mem_cmd;
  wire [1:0]   _GEN_50 = io_req_1_valid ? io_req_1_bits_uop_mem_size : io_req_0_bits_uop_mem_size;
  wire         _GEN_51 = io_req_1_valid ? io_req_1_bits_uop_mem_signed : io_req_0_bits_uop_mem_signed;
  wire         _GEN_52 = io_req_1_valid ? io_req_1_bits_uop_is_fence : io_req_0_bits_uop_is_fence;
  wire         _GEN_53 = io_req_1_valid ? io_req_1_bits_uop_is_fencei : io_req_0_bits_uop_is_fencei;
  wire         _GEN_54 = io_req_1_valid ? io_req_1_bits_uop_is_amo : io_req_0_bits_uop_is_amo;
  wire         _GEN_55 = io_req_1_valid ? io_req_1_bits_uop_uses_ldq : io_req_0_bits_uop_uses_ldq;
  wire         _GEN_56 = io_req_1_valid ? io_req_1_bits_uop_uses_stq : io_req_0_bits_uop_uses_stq;
  wire         _GEN_57 = io_req_1_valid ? io_req_1_bits_uop_is_sys_pc2epc : io_req_0_bits_uop_is_sys_pc2epc;
  wire         _GEN_58 = io_req_1_valid ? io_req_1_bits_uop_is_unique : io_req_0_bits_uop_is_unique;
  wire         _GEN_59 = io_req_1_valid ? io_req_1_bits_uop_flush_on_commit : io_req_0_bits_uop_flush_on_commit;
  wire         _GEN_60 = io_req_1_valid ? io_req_1_bits_uop_ldst_is_rs1 : io_req_0_bits_uop_ldst_is_rs1;
  wire [5:0]   _GEN_61 = io_req_1_valid ? io_req_1_bits_uop_ldst : io_req_0_bits_uop_ldst;
  wire [5:0]   _GEN_62 = io_req_1_valid ? io_req_1_bits_uop_lrs1 : io_req_0_bits_uop_lrs1;
  wire [5:0]   _GEN_63 = io_req_1_valid ? io_req_1_bits_uop_lrs2 : io_req_0_bits_uop_lrs2;
  wire [5:0]   _GEN_64 = io_req_1_valid ? io_req_1_bits_uop_lrs3 : io_req_0_bits_uop_lrs3;
  wire         _GEN_65 = io_req_1_valid ? io_req_1_bits_uop_ldst_val : io_req_0_bits_uop_ldst_val;
  wire [1:0]   _GEN_66 = io_req_1_valid ? io_req_1_bits_uop_dst_rtype : io_req_0_bits_uop_dst_rtype;
  wire [1:0]   _GEN_67 = io_req_1_valid ? io_req_1_bits_uop_lrs1_rtype : io_req_0_bits_uop_lrs1_rtype;
  wire [1:0]   _GEN_68 = io_req_1_valid ? io_req_1_bits_uop_lrs2_rtype : io_req_0_bits_uop_lrs2_rtype;
  wire         _GEN_69 = io_req_1_valid ? io_req_1_bits_uop_frs3_en : io_req_0_bits_uop_frs3_en;
  wire         _GEN_70 = io_req_1_valid ? io_req_1_bits_uop_fp_val : io_req_0_bits_uop_fp_val;
  wire         _GEN_71 = io_req_1_valid ? io_req_1_bits_uop_fp_single : io_req_0_bits_uop_fp_single;
  wire         _GEN_72 = io_req_1_valid ? io_req_1_bits_uop_xcpt_pf_if : io_req_0_bits_uop_xcpt_pf_if;
  wire         _GEN_73 = io_req_1_valid ? io_req_1_bits_uop_xcpt_ae_if : io_req_0_bits_uop_xcpt_ae_if;
  wire         _GEN_74 = io_req_1_valid ? io_req_1_bits_uop_xcpt_ma_if : io_req_0_bits_uop_xcpt_ma_if;
  wire         _GEN_75 = io_req_1_valid ? io_req_1_bits_uop_bp_debug_if : io_req_0_bits_uop_bp_debug_if;
  wire         _GEN_76 = io_req_1_valid ? io_req_1_bits_uop_bp_xcpt_if : io_req_0_bits_uop_bp_xcpt_if;
  wire [1:0]   _GEN_77 = io_req_1_valid ? io_req_1_bits_uop_debug_fsrc : io_req_0_bits_uop_debug_fsrc;
  wire [1:0]   _GEN_78 = io_req_1_valid ? io_req_1_bits_uop_debug_tsrc : io_req_0_bits_uop_debug_tsrc;
  wire [39:0]  _cacheable_T_1 = io_req_1_valid ? io_req_1_bits_addr : io_req_0_bits_addr;
  wire [63:0]  _GEN_79 = io_req_1_valid ? io_req_1_bits_data : io_req_0_bits_data;
  wire         _GEN_80 = io_req_1_valid ? io_req_1_bits_is_hella : io_req_0_bits_is_hella;
  wire         _GEN_81 = io_req_1_valid ? io_req_1_bits_tag_match : io_req_0_bits_tag_match;
  wire [1:0]   _GEN_82 = io_req_1_valid ? io_req_1_bits_old_meta_coh_state : io_req_0_bits_old_meta_coh_state;
  wire [20:0]  _GEN_83 = io_req_1_valid ? io_req_1_bits_old_meta_tag : io_req_0_bits_old_meta_tag;
  wire [7:0]   _GEN_84 = io_req_1_valid ? io_req_1_bits_way_en : io_req_0_bits_way_en;
  wire         cacheable = {_cacheable_T_1[32:31], _cacheable_T_1[27:25] ^ 3'h4, _cacheable_T_1[20]} == 6'h0 | {_cacheable_T_1[32], ~(_cacheable_T_1[31])} == 2'h0 | _cacheable_T_1[32:31] == 2'h2;
  reg  [16:0]  sdq_val;
  wire [15:0]  _sdq_alloc_id_T_1 = ~(sdq_val[15:0]);
  wire [4:0]   sdq_alloc_id = _sdq_alloc_id_T_1[0] ? 5'h0 : _sdq_alloc_id_T_1[1] ? 5'h1 : _sdq_alloc_id_T_1[2] ? 5'h2 : _sdq_alloc_id_T_1[3] ? 5'h3 : _sdq_alloc_id_T_1[4] ? 5'h4 : _sdq_alloc_id_T_1[5] ? 5'h5 : _sdq_alloc_id_T_1[6] ? 5'h6 : _sdq_alloc_id_T_1[7] ? 5'h7 : _sdq_alloc_id_T_1[8] ? 5'h8 : _sdq_alloc_id_T_1[9] ? 5'h9 : _sdq_alloc_id_T_1[10] ? 5'hA : _sdq_alloc_id_T_1[11] ? 5'hB : _sdq_alloc_id_T_1[12] ? 5'hC : _sdq_alloc_id_T_1[13] ? 5'hD : _sdq_alloc_id_T_1[14] ? 5'hE : _sdq_alloc_id_T_1[15] ? 5'hF : 5'h10;
  wire         sdq_rdy = sdq_val != 17'h1FFFF;
  wire         sdq_enq = (io_req_1_valid ? _io_req_1_ready_output : _io_req_0_ready_output) & _GEN & cacheable & (_GEN_49 == 5'h1 | _GEN_49 == 5'h11 | _GEN_49 == 5'h7 | _GEN_49 == 5'h4 | _GEN_49 == 5'h9 | _GEN_49 == 5'hA | _GEN_49 == 5'hB | _GEN_49 == 5'h8 | _GEN_49 == 5'hC | _GEN_49 == 5'hD | _GEN_49 == 5'hE | _GEN_49 == 5'hF);
  wire         _GEN_85 = ~_lb_write_arb_io_out_valid & _lb_read_arb_io_out_valid;
  wire [127:0] lb_read_data = _lb_write_arb_io_out_valid | ~_GEN_85 ? 128'h0 : _lb_ext_R0_data;
  wire         tag_match_0 = idx_matches_0_0 & _mshrs_0_io_tag_valid & _tag_matches_0_0_T_1 | idx_matches_0_1 & _mshrs_1_io_tag_valid & _tag_matches_0_1_T_1 | idx_matches_0_2 & _mshrs_2_io_tag_valid & _tag_matches_0_2_T_1 | idx_matches_0_3 & _mshrs_3_io_tag_valid & _tag_matches_0_3_T_1 | idx_matches_0_4 & _mshrs_4_io_tag_valid & _tag_matches_0_4_T_1 | idx_matches_0_5 & _mshrs_5_io_tag_valid & _tag_matches_0_5_T_1 | idx_matches_0_6 & _mshrs_6_io_tag_valid & _tag_matches_0_6_T_1 | idx_matches_0_7 & _mshrs_7_io_tag_valid & _tag_matches_0_7_T_1;
  wire         tag_match_1 = idx_matches_1_0 & _mshrs_0_io_tag_valid & _tag_matches_1_0_T_1 | idx_matches_1_1 & _mshrs_1_io_tag_valid & _tag_matches_1_1_T_1 | idx_matches_1_2 & _mshrs_2_io_tag_valid & _tag_matches_1_2_T_1 | idx_matches_1_3 & _mshrs_3_io_tag_valid & _tag_matches_1_3_T_1 | idx_matches_1_4 & _mshrs_4_io_tag_valid & _tag_matches_1_4_T_1 | idx_matches_1_5 & _mshrs_5_io_tag_valid & _tag_matches_1_5_T_1 | idx_matches_1_6 & _mshrs_6_io_tag_valid & _tag_matches_1_6_T_1 | idx_matches_1_7 & _mshrs_7_io_tag_valid & _tag_matches_1_7_T_1;
  wire         idx_match_0 = idx_matches_0_0 | idx_matches_0_1 | idx_matches_0_2 | idx_matches_0_3 | idx_matches_0_4 | idx_matches_0_5 | idx_matches_0_6 | idx_matches_0_7;
  wire         idx_match_1 = idx_matches_1_0 | idx_matches_1_1 | idx_matches_1_2 | idx_matches_1_3 | idx_matches_1_4 | idx_matches_1_5 | idx_matches_1_6 | idx_matches_1_7;
  wire         _mshr_io_req_sec_val_T_28 = _GEN & sdq_rdy;
  wire         pri_val = _mshr_io_req_sec_val_T_28 & cacheable & ~(io_req_1_valid ? idx_match_1 : idx_match_0);
  assign idx_matches_0_0 = _mshrs_0_io_idx_valid & _mshrs_0_io_idx_bits == io_req_0_bits_addr[11:6];
  assign _tag_matches_0_0_T_1 = _mshrs_0_io_tag_bits == io_req_0_bits_addr[39:12];
  assign _way_matches_0_0_T = _mshrs_0_io_way_bits == io_req_0_bits_way_en;
  assign idx_matches_1_0 = _mshrs_0_io_idx_valid & _mshrs_0_io_idx_bits == io_req_1_bits_addr[11:6];
  assign _tag_matches_1_0_T_1 = _mshrs_0_io_tag_bits == io_req_1_bits_addr[39:12];
  assign _way_matches_1_0_T = _mshrs_0_io_way_bits == io_req_1_bits_way_en;
  wire         _mshr_io_req_pri_val_T = mshr_alloc_idx_REG == 3'h0;
  wire         _GEN_86 = io_req_1_valid ? tag_match_1 : tag_match_0;
  wire         _GEN_87 = io_req_1_valid ? idx_matches_1_0 : idx_matches_0_0;
  wire         _GEN_88 = io_req_1_valid ? idx_matches_1_1 : idx_matches_0_1;
  wire         _GEN_89 = io_req_1_valid ? idx_matches_1_2 : idx_matches_0_2;
  wire         _GEN_90 = io_req_1_valid ? idx_matches_1_3 : idx_matches_0_3;
  wire         _GEN_91 = io_req_1_valid ? idx_matches_1_4 : idx_matches_0_4;
  wire         _GEN_92 = io_req_1_valid ? idx_matches_1_5 : idx_matches_0_5;
  wire         _GEN_93 = io_req_1_valid ? idx_matches_1_6 : idx_matches_0_6;
  wire         _GEN_94 = io_req_1_valid ? idx_matches_1_7 : idx_matches_0_7;
  wire         _mshr_io_req_sec_val_T_3 = _mshr_io_req_sec_val_T_28 & _GEN_86 & _GEN_87 & cacheable;
  wire         _GEN_95 = io_mem_grant_bits_source == 4'h0;
  assign idx_matches_0_1 = _mshrs_1_io_idx_valid & _mshrs_1_io_idx_bits == io_req_0_bits_addr[11:6];
  assign _tag_matches_0_1_T_1 = _mshrs_1_io_tag_bits == io_req_0_bits_addr[39:12];
  assign _way_matches_0_1_T = _mshrs_1_io_way_bits == io_req_0_bits_way_en;
  assign idx_matches_1_1 = _mshrs_1_io_idx_valid & _mshrs_1_io_idx_bits == io_req_1_bits_addr[11:6];
  assign _tag_matches_1_1_T_1 = _mshrs_1_io_tag_bits == io_req_1_bits_addr[39:12];
  assign _way_matches_1_1_T = _mshrs_1_io_way_bits == io_req_1_bits_way_en;
  wire         _mshr_io_req_sec_val_T_7 = _mshr_io_req_sec_val_T_28 & _GEN_86 & _GEN_88 & cacheable;
  wire         _GEN_96 = io_mem_grant_bits_source == 4'h1;
  assign idx_matches_0_2 = _mshrs_2_io_idx_valid & _mshrs_2_io_idx_bits == io_req_0_bits_addr[11:6];
  assign _tag_matches_0_2_T_1 = _mshrs_2_io_tag_bits == io_req_0_bits_addr[39:12];
  assign _way_matches_0_2_T = _mshrs_2_io_way_bits == io_req_0_bits_way_en;
  assign idx_matches_1_2 = _mshrs_2_io_idx_valid & _mshrs_2_io_idx_bits == io_req_1_bits_addr[11:6];
  assign _tag_matches_1_2_T_1 = _mshrs_2_io_tag_bits == io_req_1_bits_addr[39:12];
  assign _way_matches_1_2_T = _mshrs_2_io_way_bits == io_req_1_bits_way_en;
  wire         _mshr_io_req_sec_val_T_11 = _mshr_io_req_sec_val_T_28 & _GEN_86 & _GEN_89 & cacheable;
  wire         _GEN_97 = io_mem_grant_bits_source == 4'h2;
  assign idx_matches_0_3 = _mshrs_3_io_idx_valid & _mshrs_3_io_idx_bits == io_req_0_bits_addr[11:6];
  assign _tag_matches_0_3_T_1 = _mshrs_3_io_tag_bits == io_req_0_bits_addr[39:12];
  assign _way_matches_0_3_T = _mshrs_3_io_way_bits == io_req_0_bits_way_en;
  assign idx_matches_1_3 = _mshrs_3_io_idx_valid & _mshrs_3_io_idx_bits == io_req_1_bits_addr[11:6];
  assign _tag_matches_1_3_T_1 = _mshrs_3_io_tag_bits == io_req_1_bits_addr[39:12];
  assign _way_matches_1_3_T = _mshrs_3_io_way_bits == io_req_1_bits_way_en;
  wire         _mshr_io_req_sec_val_T_15 = _mshr_io_req_sec_val_T_28 & _GEN_86 & _GEN_90 & cacheable;
  wire         _GEN_98 = io_mem_grant_bits_source == 4'h3;
  assign idx_matches_0_4 = _mshrs_4_io_idx_valid & _mshrs_4_io_idx_bits == io_req_0_bits_addr[11:6];
  assign _tag_matches_0_4_T_1 = _mshrs_4_io_tag_bits == io_req_0_bits_addr[39:12];
  assign _way_matches_0_4_T = _mshrs_4_io_way_bits == io_req_0_bits_way_en;
  assign idx_matches_1_4 = _mshrs_4_io_idx_valid & _mshrs_4_io_idx_bits == io_req_1_bits_addr[11:6];
  assign _tag_matches_1_4_T_1 = _mshrs_4_io_tag_bits == io_req_1_bits_addr[39:12];
  assign _way_matches_1_4_T = _mshrs_4_io_way_bits == io_req_1_bits_way_en;
  wire         _mshr_io_req_sec_val_T_19 = _mshr_io_req_sec_val_T_28 & _GEN_86 & _GEN_91 & cacheable;
  wire         _GEN_99 = io_mem_grant_bits_source == 4'h4;
  assign idx_matches_0_5 = _mshrs_5_io_idx_valid & _mshrs_5_io_idx_bits == io_req_0_bits_addr[11:6];
  assign _tag_matches_0_5_T_1 = _mshrs_5_io_tag_bits == io_req_0_bits_addr[39:12];
  assign _way_matches_0_5_T = _mshrs_5_io_way_bits == io_req_0_bits_way_en;
  assign idx_matches_1_5 = _mshrs_5_io_idx_valid & _mshrs_5_io_idx_bits == io_req_1_bits_addr[11:6];
  assign _tag_matches_1_5_T_1 = _mshrs_5_io_tag_bits == io_req_1_bits_addr[39:12];
  assign _way_matches_1_5_T = _mshrs_5_io_way_bits == io_req_1_bits_way_en;
  wire         _mshr_io_req_sec_val_T_23 = _mshr_io_req_sec_val_T_28 & _GEN_86 & _GEN_92 & cacheable;
  wire         _GEN_100 = io_mem_grant_bits_source == 4'h5;
  assign idx_matches_0_6 = _mshrs_6_io_idx_valid & _mshrs_6_io_idx_bits == io_req_0_bits_addr[11:6];
  assign _tag_matches_0_6_T_1 = _mshrs_6_io_tag_bits == io_req_0_bits_addr[39:12];
  assign _way_matches_0_6_T = _mshrs_6_io_way_bits == io_req_0_bits_way_en;
  assign idx_matches_1_6 = _mshrs_6_io_idx_valid & _mshrs_6_io_idx_bits == io_req_1_bits_addr[11:6];
  assign _tag_matches_1_6_T_1 = _mshrs_6_io_tag_bits == io_req_1_bits_addr[39:12];
  assign _way_matches_1_6_T = _mshrs_6_io_way_bits == io_req_1_bits_way_en;
  wire         _mshr_io_req_sec_val_T_27 = _mshr_io_req_sec_val_T_28 & _GEN_86 & _GEN_93 & cacheable;
  wire         _GEN_101 = io_mem_grant_bits_source == 4'h6;
  assign idx_matches_0_7 = _mshrs_7_io_idx_valid & _mshrs_7_io_idx_bits == io_req_0_bits_addr[11:6];
  assign _tag_matches_0_7_T_1 = _mshrs_7_io_tag_bits == io_req_0_bits_addr[39:12];
  assign _way_matches_0_7_T = _mshrs_7_io_way_bits == io_req_0_bits_way_en;
  assign idx_matches_1_7 = _mshrs_7_io_idx_valid & _mshrs_7_io_idx_bits == io_req_1_bits_addr[11:6];
  assign _tag_matches_1_7_T_1 = _mshrs_7_io_tag_bits == io_req_1_bits_addr[39:12];
  assign _way_matches_1_7_T = _mshrs_7_io_way_bits == io_req_1_bits_way_en;
  reg          casez_tmp;
  always @(*) begin
    casez (mshr_alloc_idx_REG)
      3'b000:
        casez_tmp = _mshr_io_req_pri_val_T & _mshrs_0_io_req_pri_rdy;
      3'b001:
        casez_tmp = _mshrs_1_io_req_pri_rdy;
      3'b010:
        casez_tmp = _mshrs_2_io_req_pri_rdy;
      3'b011:
        casez_tmp = _mshrs_3_io_req_pri_rdy;
      3'b100:
        casez_tmp = _mshrs_4_io_req_pri_rdy;
      3'b101:
        casez_tmp = _mshrs_5_io_req_pri_rdy;
      3'b110:
        casez_tmp = _mshrs_6_io_req_pri_rdy;
      default:
        casez_tmp = _mshrs_7_io_req_pri_rdy;
    endcase
  end // always @(*)
  wire         _mshr_io_req_sec_val_T_31 = _mshr_io_req_sec_val_T_28 & _GEN_86 & _GEN_94 & cacheable;
  wire         _GEN_102 = io_mem_grant_bits_source == 4'h7;
  wire         _GEN_103 = _mshrs_0_io_req_sec_rdy & _mshr_io_req_sec_val_T_3 | _mshrs_1_io_req_sec_rdy & _mshr_io_req_sec_val_T_7 | _mshrs_2_io_req_sec_rdy & _mshr_io_req_sec_val_T_11 | _mshrs_3_io_req_sec_rdy & _mshr_io_req_sec_val_T_15 | _mshrs_4_io_req_sec_rdy & _mshr_io_req_sec_val_T_19 | _mshrs_5_io_req_sec_rdy & _mshr_io_req_sec_val_T_23 | _mshrs_6_io_req_sec_rdy & _mshr_io_req_sec_val_T_27 | _mshrs_7_io_req_sec_rdy & _mshr_io_req_sec_val_T_31;
  reg  [2:0]   mshr_head;
  wire         _mshr_io_mem_ack_valid_T = io_mem_grant_bits_source == 4'h9;
  reg  [7:0]   beatsLeft;
  wire         idle = beatsLeft == 8'h0;
  wire         _GEN_104 = _mshrs_5_io_mem_acquire_valid | _mshrs_4_io_mem_acquire_valid;
  wire         _GEN_105 = _mshrs_4_io_mem_acquire_valid | _mshrs_3_io_mem_acquire_valid;
  wire         _GEN_106 = _mshrs_3_io_mem_acquire_valid | _mshrs_2_io_mem_acquire_valid;
  wire         _GEN_107 = _mshrs_2_io_mem_acquire_valid | _mshrs_1_io_mem_acquire_valid;
  wire         _GEN_108 = _mshrs_1_io_mem_acquire_valid | _mshrs_0_io_mem_acquire_valid;
  wire         _GEN_109 = _GEN_106 | _GEN_108;
  wire         _GEN_110 = _GEN_107 | _mshrs_0_io_mem_acquire_valid;
  wire         _GEN_111 = _mshrs_7_io_mem_acquire_valid | _mshrs_6_io_mem_acquire_valid | _GEN_104 | _GEN_109;
  wire         _GEN_112 = _mshrs_6_io_mem_acquire_valid | _mshrs_5_io_mem_acquire_valid | _GEN_105 | _GEN_110;
  wire         _GEN_113 = _GEN_104 | _GEN_106 | _GEN_108;
  wire         _GEN_114 = _GEN_105 | _GEN_107 | _mshrs_0_io_mem_acquire_valid;
  wire         winner_1 = ~_mshrs_0_io_mem_acquire_valid & _mshrs_1_io_mem_acquire_valid;
  wire         winner_2 = ~_GEN_108 & _mshrs_2_io_mem_acquire_valid;
  wire         winner_3 = ~_GEN_110 & _mshrs_3_io_mem_acquire_valid;
  wire         winner_4 = ~_GEN_109 & _mshrs_4_io_mem_acquire_valid;
  wire         winner_5 = ~_GEN_114 & _mshrs_5_io_mem_acquire_valid;
  wire         winner_6 = ~_GEN_113 & _mshrs_6_io_mem_acquire_valid;
  wire         winner_7 = ~_GEN_112 & _mshrs_7_io_mem_acquire_valid;
  wire         winner_8 = ~_GEN_111 & _mmios_0_io_mem_access_valid;
  wire         _io_mem_acquire_valid_T = _mshrs_0_io_mem_acquire_valid | _mshrs_1_io_mem_acquire_valid;
  reg          state_0;
  reg          state_1;
  reg          state_2;
  reg          state_3;
  reg          state_4;
  reg          state_5;
  reg          state_6;
  reg          state_7;
  reg          state_8;
  wire         muxState_0 = idle ? _mshrs_0_io_mem_acquire_valid : state_0;
  wire         muxState_1 = idle ? winner_1 : state_1;
  wire         muxState_2 = idle ? winner_2 : state_2;
  wire         muxState_3 = idle ? winner_3 : state_3;
  wire         muxState_4 = idle ? winner_4 : state_4;
  wire         muxState_5 = idle ? winner_5 : state_5;
  wire         muxState_6 = idle ? winner_6 : state_6;
  wire         muxState_7 = idle ? winner_7 : state_7;
  wire         muxState_8 = idle ? winner_8 : state_8;
  wire         _io_mem_acquire_valid_output = idle ? _io_mem_acquire_valid_T | _mshrs_2_io_mem_acquire_valid | _mshrs_3_io_mem_acquire_valid | _mshrs_4_io_mem_acquire_valid | _mshrs_5_io_mem_acquire_valid | _mshrs_6_io_mem_acquire_valid | _mshrs_7_io_mem_acquire_valid | _mmios_0_io_mem_access_valid : state_0 & _mshrs_0_io_mem_acquire_valid | state_1 & _mshrs_1_io_mem_acquire_valid | state_2 & _mshrs_2_io_mem_acquire_valid | state_3 & _mshrs_3_io_mem_acquire_valid | state_4 & _mshrs_4_io_mem_acquire_valid | state_5 & _mshrs_5_io_mem_acquire_valid | state_6 & _mshrs_6_io_mem_acquire_valid | state_7 & _mshrs_7_io_mem_acquire_valid | state_8 & _mmios_0_io_mem_access_valid;
  wire         _GEN_115 = muxState_0 | muxState_1 | muxState_2 | muxState_3 | muxState_4 | muxState_5 | muxState_6 | muxState_7;
  reg          beatsLeft_1;
  wire         _GEN_116 = _mshrs_4_io_mem_finish_valid | _mshrs_3_io_mem_finish_valid;
  wire         _GEN_117 = _mshrs_3_io_mem_finish_valid | _mshrs_2_io_mem_finish_valid;
  wire         _GEN_118 = _mshrs_2_io_mem_finish_valid | _mshrs_1_io_mem_finish_valid;
  wire         _GEN_119 = _mshrs_1_io_mem_finish_valid | _mshrs_0_io_mem_finish_valid;
  wire         _GEN_120 = _GEN_117 | _GEN_119;
  wire         _GEN_121 = _GEN_118 | _mshrs_0_io_mem_finish_valid;
  wire         _GEN_122 = _mshrs_6_io_mem_finish_valid | _mshrs_5_io_mem_finish_valid | _GEN_116 | _GEN_121;
  wire         _GEN_123 = _mshrs_5_io_mem_finish_valid | _mshrs_4_io_mem_finish_valid | _GEN_117 | _GEN_119;
  wire         _GEN_124 = _GEN_116 | _GEN_118 | _mshrs_0_io_mem_finish_valid;
  wire         winner_1_1 = ~_mshrs_0_io_mem_finish_valid & _mshrs_1_io_mem_finish_valid;
  wire         winner_1_2 = ~_GEN_119 & _mshrs_2_io_mem_finish_valid;
  wire         winner_1_3 = ~_GEN_121 & _mshrs_3_io_mem_finish_valid;
  wire         winner_1_4 = ~_GEN_120 & _mshrs_4_io_mem_finish_valid;
  wire         winner_1_5 = ~_GEN_124 & _mshrs_5_io_mem_finish_valid;
  wire         winner_1_6 = ~_GEN_123 & _mshrs_6_io_mem_finish_valid;
  wire         winner_1_7 = ~_GEN_122 & _mshrs_7_io_mem_finish_valid;
  wire         _io_mem_finish_valid_T = _mshrs_0_io_mem_finish_valid | _mshrs_1_io_mem_finish_valid;
  `ifndef SYNTHESIS
    wire prefixOR_2 = _mshrs_0_io_mem_acquire_valid | winner_1;
    wire prefixOR_3 = prefixOR_2 | winner_2;
    wire prefixOR_4 = prefixOR_3 | winner_3;
    wire prefixOR_5 = prefixOR_4 | winner_4;
    wire prefixOR_6 = prefixOR_5 | winner_5;
    wire prefixOR_7 = prefixOR_6 | winner_6;
    wire prefixOR_2_1 = _mshrs_0_io_mem_finish_valid | winner_1_1;
    wire prefixOR_3_1 = prefixOR_2_1 | winner_1_2;
    wire prefixOR_4_1 = prefixOR_3_1 | winner_1_3;
    wire prefixOR_5_1 = prefixOR_4_1 | winner_1_4;
    wire prefixOR_6_1 = prefixOR_5_1 | winner_1_5;
    always @(posedge clock) begin
      if (~reset & ~((~_mshrs_0_io_mem_acquire_valid | ~winner_1) & (~prefixOR_2 | ~winner_2) & (~prefixOR_3 | ~winner_3) & (~prefixOR_4 | ~winner_4) & (~prefixOR_5 | ~winner_5) & (~prefixOR_6 | ~winner_6) & (~prefixOR_7 | ~winner_7) & (~(prefixOR_7 | winner_7) | ~winner_8))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~(_io_mem_acquire_valid_T | _mshrs_2_io_mem_acquire_valid | _mshrs_3_io_mem_acquire_valid | _mshrs_4_io_mem_acquire_valid | _mshrs_5_io_mem_acquire_valid | _mshrs_6_io_mem_acquire_valid | _mshrs_7_io_mem_acquire_valid | _mmios_0_io_mem_access_valid) | _mshrs_0_io_mem_acquire_valid | winner_1 | winner_2 | winner_3 | winner_4 | winner_5 | winner_6 | winner_7 | winner_8)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~((~_mshrs_0_io_mem_finish_valid | ~winner_1_1) & (~prefixOR_2_1 | ~winner_1_2) & (~prefixOR_3_1 | ~winner_1_3) & (~prefixOR_4_1 | ~winner_1_4) & (~prefixOR_5_1 | ~winner_1_5) & (~prefixOR_6_1 | ~winner_1_6) & (~(prefixOR_6_1 | winner_1_6) | ~winner_1_7))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~(_io_mem_finish_valid_T | _mshrs_2_io_mem_finish_valid | _mshrs_3_io_mem_finish_valid | _mshrs_4_io_mem_finish_valid | _mshrs_5_io_mem_finish_valid | _mshrs_6_io_mem_finish_valid | _mshrs_7_io_mem_finish_valid) | _mshrs_0_io_mem_finish_valid | winner_1_1 | winner_1_2 | winner_1_3 | winner_1_4 | winner_1_5 | winner_1_6 | winner_1_7)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg          state_1_0;
  reg          state_1_1;
  reg          state_1_2;
  reg          state_1_3;
  reg          state_1_4;
  reg          state_1_5;
  reg          state_1_6;
  reg          state_1_7;
  wire         _io_mem_finish_valid_output = beatsLeft_1 ? state_1_0 & _mshrs_0_io_mem_finish_valid | state_1_1 & _mshrs_1_io_mem_finish_valid | state_1_2 & _mshrs_2_io_mem_finish_valid | state_1_3 & _mshrs_3_io_mem_finish_valid | state_1_4 & _mshrs_4_io_mem_finish_valid | state_1_5 & _mshrs_5_io_mem_finish_valid | state_1_6 & _mshrs_6_io_mem_finish_valid | state_1_7 & _mshrs_7_io_mem_finish_valid : _io_mem_finish_valid_T | _mshrs_2_io_mem_finish_valid | _mshrs_3_io_mem_finish_valid | _mshrs_4_io_mem_finish_valid | _mshrs_5_io_mem_finish_valid | _mshrs_6_io_mem_finish_valid | _mshrs_7_io_mem_finish_valid;
  assign _io_req_0_ready_output = ~io_req_1_valid & (cacheable ? sdq_rdy & (idx_match_0 ? tag_match_0 & _GEN_103 : casez_tmp) : _mmios_0_io_req_ready);
  assign _io_req_1_ready_output = io_req_1_valid & (cacheable ? sdq_rdy & (idx_match_1 ? tag_match_1 & _GEN_103 : casez_tmp) : _mmios_0_io_req_ready);
  reg          prefetcher_io_mshr_avail_REG;
  reg          prefetcher_io_req_val_REG;
  reg  [39:0]  prefetcher_io_req_addr_REG;
  reg  [1:0]   prefetcher_io_req_coh_REG_state;
  wire [16:0]  _sdq_val_T_7 = ~sdq_val;
  wire [31:0]  _sdq_val_T = 32'h1 << _replay_arb_io_out_bits_sdq_id;
  wire [26:0]  _decode_T_33 = 27'hFFF << _mmios_0_io_mem_access_bits_size;
  always @(posedge clock) begin
    if (reset) begin
      sdq_val <= 17'h0;
      mshr_head <= 3'h0;
      beatsLeft <= 8'h0;
      state_0 <= 1'h0;
      state_1 <= 1'h0;
      state_2 <= 1'h0;
      state_3 <= 1'h0;
      state_4 <= 1'h0;
      state_5 <= 1'h0;
      state_6 <= 1'h0;
      state_7 <= 1'h0;
      state_8 <= 1'h0;
      beatsLeft_1 <= 1'h0;
      state_1_0 <= 1'h0;
      state_1_1 <= 1'h0;
      state_1_2 <= 1'h0;
      state_1_3 <= 1'h0;
      state_1_4 <= 1'h0;
      state_1_5 <= 1'h0;
      state_1_6 <= 1'h0;
      state_1_7 <= 1'h0;
    end
    else begin
      if (_replay_arb_io_out_valid | sdq_enq)
        sdq_val <= ~(_sdq_val_T[16:0] & {17{io_replay_ready & _replay_arb_io_out_valid & (_replay_arb_io_out_bits_uop_mem_cmd == 5'h1 | _replay_arb_io_out_bits_uop_mem_cmd == 5'h11 | _replay_arb_io_out_bits_uop_mem_cmd == 5'h7 | _replay_arb_io_out_bits_uop_mem_cmd == 5'h4 | _replay_arb_io_out_bits_uop_mem_cmd == 5'h9 | _replay_arb_io_out_bits_uop_mem_cmd == 5'hA | _replay_arb_io_out_bits_uop_mem_cmd == 5'hB | _replay_arb_io_out_bits_uop_mem_cmd == 5'h8 | _replay_arb_io_out_bits_uop_mem_cmd == 5'hC | _replay_arb_io_out_bits_uop_mem_cmd == 5'hD | _replay_arb_io_out_bits_uop_mem_cmd == 5'hE | _replay_arb_io_out_bits_uop_mem_cmd == 5'hF)}}) & sdq_val | (_sdq_val_T_7[0] ? 17'h1 : _sdq_val_T_7[1] ? 17'h2 : _sdq_val_T_7[2] ? 17'h4 : _sdq_val_T_7[3] ? 17'h8 : _sdq_val_T_7[4] ? 17'h10 : _sdq_val_T_7[5] ? 17'h20 : _sdq_val_T_7[6] ? 17'h40 : _sdq_val_T_7[7] ? 17'h80 : _sdq_val_T_7[8] ? 17'h100 : _sdq_val_T_7[9] ? 17'h200 : _sdq_val_T_7[10] ? 17'h400 : _sdq_val_T_7[11] ? 17'h800 : _sdq_val_T_7[12] ? 17'h1000 : _sdq_val_T_7[13] ? 17'h2000 : _sdq_val_T_7[14] ? 17'h4000 : _sdq_val_T_7[15] ? 17'h8000 : {_sdq_val_T_7[16], 16'h0}) & {17{sdq_enq}};
      if (casez_tmp & pri_val)
        mshr_head <= mshr_head + 3'h1;
      if (idle & io_mem_acquire_ready)
        beatsLeft <= winner_8 & ~(_mmios_0_io_mem_access_bits_opcode[2]) ? ~(_decode_T_33[11:4]) : 8'h0;
      else
        beatsLeft <= beatsLeft - {7'h0, io_mem_acquire_ready & _io_mem_acquire_valid_output};
      if (idle) begin
        state_0 <= _mshrs_0_io_mem_acquire_valid;
        state_1 <= winner_1;
        state_2 <= winner_2;
        state_3 <= winner_3;
        state_4 <= winner_4;
        state_5 <= winner_5;
        state_6 <= winner_6;
        state_7 <= winner_7;
        state_8 <= winner_8;
      end
      beatsLeft_1 <= ~(~beatsLeft_1 & io_mem_finish_ready) & beatsLeft_1 - (io_mem_finish_ready & _io_mem_finish_valid_output);
      if (beatsLeft_1) begin
      end
      else begin
        state_1_0 <= _mshrs_0_io_mem_finish_valid;
        state_1_1 <= winner_1_1;
        state_1_2 <= winner_1_2;
        state_1_3 <= winner_1_3;
        state_1_4 <= winner_1_4;
        state_1_5 <= winner_1_5;
        state_1_6 <= winner_1_6;
        state_1_7 <= winner_1_7;
      end
    end
    mshr_alloc_idx_REG <= _mshrs_0_io_req_pri_rdy & mshr_head == 3'h0 ? 3'h0 : _mshrs_1_io_req_pri_rdy & mshr_head < 3'h2 ? 3'h1 : _mshrs_2_io_req_pri_rdy & mshr_head < 3'h3 ? 3'h2 : _mshrs_3_io_req_pri_rdy & ~(mshr_head[2]) ? 3'h3 : _mshrs_4_io_req_pri_rdy & mshr_head < 3'h5 ? 3'h4 : _mshrs_5_io_req_pri_rdy & mshr_head[2:1] != 2'h3 ? 3'h5 : _mshrs_6_io_req_pri_rdy & mshr_head != 3'h7 ? 3'h6 : _mshrs_7_io_req_pri_rdy ? 3'h7 : _mshrs_0_io_req_pri_rdy ? 3'h0 : _mshrs_1_io_req_pri_rdy ? 3'h1 : _mshrs_2_io_req_pri_rdy ? 3'h2 : _mshrs_3_io_req_pri_rdy ? 3'h3 : _mshrs_4_io_req_pri_rdy ? 3'h4 : _mshrs_5_io_req_pri_rdy ? 3'h5 : {2'h3, ~_mshrs_6_io_req_pri_rdy};
    prefetcher_io_mshr_avail_REG <= casez_tmp;
    prefetcher_io_req_val_REG <= _mshrs_0_io_commit_val | _mshrs_1_io_commit_val | _mshrs_2_io_commit_val | _mshrs_3_io_commit_val | _mshrs_4_io_commit_val | _mshrs_5_io_commit_val | _mshrs_6_io_commit_val | _mshrs_7_io_commit_val;
    prefetcher_io_req_addr_REG <= (_mshrs_0_io_commit_val ? _mshrs_0_io_commit_addr : 40'h0) | (_mshrs_1_io_commit_val ? _mshrs_1_io_commit_addr : 40'h0) | (_mshrs_2_io_commit_val ? _mshrs_2_io_commit_addr : 40'h0) | (_mshrs_3_io_commit_val ? _mshrs_3_io_commit_addr : 40'h0) | (_mshrs_4_io_commit_val ? _mshrs_4_io_commit_addr : 40'h0) | (_mshrs_5_io_commit_val ? _mshrs_5_io_commit_addr : 40'h0) | (_mshrs_6_io_commit_val ? _mshrs_6_io_commit_addr : 40'h0) | (_mshrs_7_io_commit_val ? _mshrs_7_io_commit_addr : 40'h0);
    prefetcher_io_req_coh_REG_state <= (_mshrs_0_io_commit_val ? _mshrs_0_io_commit_coh_state : 2'h0) | (_mshrs_1_io_commit_val ? _mshrs_1_io_commit_coh_state : 2'h0) | (_mshrs_2_io_commit_val ? _mshrs_2_io_commit_coh_state : 2'h0) | (_mshrs_3_io_commit_val ? _mshrs_3_io_commit_coh_state : 2'h0) | (_mshrs_4_io_commit_val ? _mshrs_4_io_commit_coh_state : 2'h0) | (_mshrs_5_io_commit_val ? _mshrs_5_io_commit_coh_state : 2'h0) | (_mshrs_6_io_commit_val ? _mshrs_6_io_commit_coh_state : 2'h0) | (_mshrs_7_io_commit_val ? _mshrs_7_io_commit_coh_state : 2'h0);
  end // always @(posedge)
  NLPrefetcher prefetcher (
    .clock                        (clock),
    .reset                        (reset),
    .io_mshr_avail                (prefetcher_io_mshr_avail_REG),
    .io_req_val                   (prefetcher_io_req_val_REG),
    .io_req_addr                  (prefetcher_io_req_addr_REG),
    .io_req_coh_state             (prefetcher_io_req_coh_REG_state),
    .io_prefetch_ready            (io_prefetch_ready),
    .io_prefetch_valid            (io_prefetch_valid),
    .io_prefetch_bits_uop_mem_cmd (io_prefetch_bits_uop_mem_cmd),
    .io_prefetch_bits_addr        (io_prefetch_bits_addr)
  );
  sdq_17x64 sdq_ext (
    .R0_addr (_replay_arb_io_out_bits_sdq_id),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (io_replay_bits_data),
    .W0_addr (sdq_alloc_id),
    .W0_en   (sdq_enq),
    .W0_clk  (clock),
    .W0_data (_GEN_79)
  );
  lb_32x128 lb_ext (
    .R0_addr ({_lb_read_arb_io_out_bits_id, _lb_read_arb_io_out_bits_offset}),
    .R0_en   (~_lb_write_arb_io_out_valid & _GEN_85),
    .R0_clk  (clock),
    .R0_data (_lb_ext_R0_data),
    .W0_addr ({_lb_write_arb_io_out_bits_id, _lb_write_arb_io_out_bits_offset}),
    .W0_en   (_lb_write_arb_io_out_valid),
    .W0_clk  (clock),
    .W0_data (_lb_write_arb_io_out_bits_data)
  );
  Arbiter lb_read_arb (
    .io_in_0_ready       (_lb_read_arb_io_in_0_ready),
    .io_in_0_valid       (_mshrs_0_io_lb_read_valid),
    .io_in_0_bits_id     (_mshrs_0_io_lb_read_bits_id),
    .io_in_0_bits_offset (_mshrs_0_io_lb_read_bits_offset),
    .io_in_1_ready       (_lb_read_arb_io_in_1_ready),
    .io_in_1_valid       (_mshrs_1_io_lb_read_valid),
    .io_in_1_bits_id     (_mshrs_1_io_lb_read_bits_id),
    .io_in_1_bits_offset (_mshrs_1_io_lb_read_bits_offset),
    .io_in_2_ready       (_lb_read_arb_io_in_2_ready),
    .io_in_2_valid       (_mshrs_2_io_lb_read_valid),
    .io_in_2_bits_id     (_mshrs_2_io_lb_read_bits_id),
    .io_in_2_bits_offset (_mshrs_2_io_lb_read_bits_offset),
    .io_in_3_ready       (_lb_read_arb_io_in_3_ready),
    .io_in_3_valid       (_mshrs_3_io_lb_read_valid),
    .io_in_3_bits_id     (_mshrs_3_io_lb_read_bits_id),
    .io_in_3_bits_offset (_mshrs_3_io_lb_read_bits_offset),
    .io_in_4_ready       (_lb_read_arb_io_in_4_ready),
    .io_in_4_valid       (_mshrs_4_io_lb_read_valid),
    .io_in_4_bits_id     (_mshrs_4_io_lb_read_bits_id),
    .io_in_4_bits_offset (_mshrs_4_io_lb_read_bits_offset),
    .io_in_5_ready       (_lb_read_arb_io_in_5_ready),
    .io_in_5_valid       (_mshrs_5_io_lb_read_valid),
    .io_in_5_bits_id     (_mshrs_5_io_lb_read_bits_id),
    .io_in_5_bits_offset (_mshrs_5_io_lb_read_bits_offset),
    .io_in_6_ready       (_lb_read_arb_io_in_6_ready),
    .io_in_6_valid       (_mshrs_6_io_lb_read_valid),
    .io_in_6_bits_id     (_mshrs_6_io_lb_read_bits_id),
    .io_in_6_bits_offset (_mshrs_6_io_lb_read_bits_offset),
    .io_in_7_ready       (_lb_read_arb_io_in_7_ready),
    .io_in_7_valid       (_mshrs_7_io_lb_read_valid),
    .io_in_7_bits_id     (_mshrs_7_io_lb_read_bits_id),
    .io_in_7_bits_offset (_mshrs_7_io_lb_read_bits_offset),
    .io_out_ready        (~_lb_write_arb_io_out_valid),
    .io_out_valid        (_lb_read_arb_io_out_valid),
    .io_out_bits_id      (_lb_read_arb_io_out_bits_id),
    .io_out_bits_offset  (_lb_read_arb_io_out_bits_offset)
  );
  Arbiter_1 lb_write_arb (
    .io_in_0_valid       (_mshrs_0_io_lb_write_valid),
    .io_in_0_bits_id     (_mshrs_0_io_lb_write_bits_id),
    .io_in_0_bits_offset (_mshrs_0_io_lb_write_bits_offset),
    .io_in_0_bits_data   (_mshrs_0_io_lb_write_bits_data),
    .io_in_1_ready       (_lb_write_arb_io_in_1_ready),
    .io_in_1_valid       (_mshrs_1_io_lb_write_valid),
    .io_in_1_bits_id     (_mshrs_1_io_lb_write_bits_id),
    .io_in_1_bits_offset (_mshrs_1_io_lb_write_bits_offset),
    .io_in_1_bits_data   (_mshrs_1_io_lb_write_bits_data),
    .io_in_2_ready       (_lb_write_arb_io_in_2_ready),
    .io_in_2_valid       (_mshrs_2_io_lb_write_valid),
    .io_in_2_bits_id     (_mshrs_2_io_lb_write_bits_id),
    .io_in_2_bits_offset (_mshrs_2_io_lb_write_bits_offset),
    .io_in_2_bits_data   (_mshrs_2_io_lb_write_bits_data),
    .io_in_3_ready       (_lb_write_arb_io_in_3_ready),
    .io_in_3_valid       (_mshrs_3_io_lb_write_valid),
    .io_in_3_bits_id     (_mshrs_3_io_lb_write_bits_id),
    .io_in_3_bits_offset (_mshrs_3_io_lb_write_bits_offset),
    .io_in_3_bits_data   (_mshrs_3_io_lb_write_bits_data),
    .io_in_4_ready       (_lb_write_arb_io_in_4_ready),
    .io_in_4_valid       (_mshrs_4_io_lb_write_valid),
    .io_in_4_bits_id     (_mshrs_4_io_lb_write_bits_id),
    .io_in_4_bits_offset (_mshrs_4_io_lb_write_bits_offset),
    .io_in_4_bits_data   (_mshrs_4_io_lb_write_bits_data),
    .io_in_5_ready       (_lb_write_arb_io_in_5_ready),
    .io_in_5_valid       (_mshrs_5_io_lb_write_valid),
    .io_in_5_bits_id     (_mshrs_5_io_lb_write_bits_id),
    .io_in_5_bits_offset (_mshrs_5_io_lb_write_bits_offset),
    .io_in_5_bits_data   (_mshrs_5_io_lb_write_bits_data),
    .io_in_6_ready       (_lb_write_arb_io_in_6_ready),
    .io_in_6_valid       (_mshrs_6_io_lb_write_valid),
    .io_in_6_bits_id     (_mshrs_6_io_lb_write_bits_id),
    .io_in_6_bits_offset (_mshrs_6_io_lb_write_bits_offset),
    .io_in_6_bits_data   (_mshrs_6_io_lb_write_bits_data),
    .io_in_7_ready       (_lb_write_arb_io_in_7_ready),
    .io_in_7_valid       (_mshrs_7_io_lb_write_valid),
    .io_in_7_bits_id     (_mshrs_7_io_lb_write_bits_id),
    .io_in_7_bits_offset (_mshrs_7_io_lb_write_bits_offset),
    .io_in_7_bits_data   (_mshrs_7_io_lb_write_bits_data),
    .io_out_valid        (_lb_write_arb_io_out_valid),
    .io_out_bits_id      (_lb_write_arb_io_out_bits_id),
    .io_out_bits_offset  (_lb_write_arb_io_out_bits_offset),
    .io_out_bits_data    (_lb_write_arb_io_out_bits_data)
  );
  Arbiter_2 meta_write_arb (
    .io_in_0_ready               (_meta_write_arb_io_in_0_ready),
    .io_in_0_valid               (_mshrs_0_io_meta_write_valid),
    .io_in_0_bits_idx            (_mshrs_0_io_meta_write_bits_idx),
    .io_in_0_bits_way_en         (_mshrs_0_io_meta_write_bits_way_en),
    .io_in_0_bits_data_coh_state (_mshrs_0_io_meta_write_bits_data_coh_state),
    .io_in_0_bits_data_tag       (_mshrs_0_io_meta_write_bits_data_tag),
    .io_in_1_ready               (_meta_write_arb_io_in_1_ready),
    .io_in_1_valid               (_mshrs_1_io_meta_write_valid),
    .io_in_1_bits_idx            (_mshrs_1_io_meta_write_bits_idx),
    .io_in_1_bits_way_en         (_mshrs_1_io_meta_write_bits_way_en),
    .io_in_1_bits_data_coh_state (_mshrs_1_io_meta_write_bits_data_coh_state),
    .io_in_1_bits_data_tag       (_mshrs_1_io_meta_write_bits_data_tag),
    .io_in_2_ready               (_meta_write_arb_io_in_2_ready),
    .io_in_2_valid               (_mshrs_2_io_meta_write_valid),
    .io_in_2_bits_idx            (_mshrs_2_io_meta_write_bits_idx),
    .io_in_2_bits_way_en         (_mshrs_2_io_meta_write_bits_way_en),
    .io_in_2_bits_data_coh_state (_mshrs_2_io_meta_write_bits_data_coh_state),
    .io_in_2_bits_data_tag       (_mshrs_2_io_meta_write_bits_data_tag),
    .io_in_3_ready               (_meta_write_arb_io_in_3_ready),
    .io_in_3_valid               (_mshrs_3_io_meta_write_valid),
    .io_in_3_bits_idx            (_mshrs_3_io_meta_write_bits_idx),
    .io_in_3_bits_way_en         (_mshrs_3_io_meta_write_bits_way_en),
    .io_in_3_bits_data_coh_state (_mshrs_3_io_meta_write_bits_data_coh_state),
    .io_in_3_bits_data_tag       (_mshrs_3_io_meta_write_bits_data_tag),
    .io_in_4_ready               (_meta_write_arb_io_in_4_ready),
    .io_in_4_valid               (_mshrs_4_io_meta_write_valid),
    .io_in_4_bits_idx            (_mshrs_4_io_meta_write_bits_idx),
    .io_in_4_bits_way_en         (_mshrs_4_io_meta_write_bits_way_en),
    .io_in_4_bits_data_coh_state (_mshrs_4_io_meta_write_bits_data_coh_state),
    .io_in_4_bits_data_tag       (_mshrs_4_io_meta_write_bits_data_tag),
    .io_in_5_ready               (_meta_write_arb_io_in_5_ready),
    .io_in_5_valid               (_mshrs_5_io_meta_write_valid),
    .io_in_5_bits_idx            (_mshrs_5_io_meta_write_bits_idx),
    .io_in_5_bits_way_en         (_mshrs_5_io_meta_write_bits_way_en),
    .io_in_5_bits_data_coh_state (_mshrs_5_io_meta_write_bits_data_coh_state),
    .io_in_5_bits_data_tag       (_mshrs_5_io_meta_write_bits_data_tag),
    .io_in_6_ready               (_meta_write_arb_io_in_6_ready),
    .io_in_6_valid               (_mshrs_6_io_meta_write_valid),
    .io_in_6_bits_idx            (_mshrs_6_io_meta_write_bits_idx),
    .io_in_6_bits_way_en         (_mshrs_6_io_meta_write_bits_way_en),
    .io_in_6_bits_data_coh_state (_mshrs_6_io_meta_write_bits_data_coh_state),
    .io_in_6_bits_data_tag       (_mshrs_6_io_meta_write_bits_data_tag),
    .io_in_7_ready               (_meta_write_arb_io_in_7_ready),
    .io_in_7_valid               (_mshrs_7_io_meta_write_valid),
    .io_in_7_bits_idx            (_mshrs_7_io_meta_write_bits_idx),
    .io_in_7_bits_way_en         (_mshrs_7_io_meta_write_bits_way_en),
    .io_in_7_bits_data_coh_state (_mshrs_7_io_meta_write_bits_data_coh_state),
    .io_in_7_bits_data_tag       (_mshrs_7_io_meta_write_bits_data_tag),
    .io_out_ready                (io_meta_write_ready),
    .io_out_valid                (io_meta_write_valid),
    .io_out_bits_idx             (io_meta_write_bits_idx),
    .io_out_bits_way_en          (io_meta_write_bits_way_en),
    .io_out_bits_data_coh_state  (io_meta_write_bits_data_coh_state),
    .io_out_bits_data_tag        (io_meta_write_bits_data_tag)
  );
  Arbiter_3 meta_read_arb (
    .io_in_0_ready       (_meta_read_arb_io_in_0_ready),
    .io_in_0_valid       (_mshrs_0_io_meta_read_valid),
    .io_in_0_bits_idx    (_mshrs_0_io_meta_read_bits_idx),
    .io_in_0_bits_way_en (_mshrs_0_io_meta_read_bits_way_en),
    .io_in_0_bits_tag    (_mshrs_0_io_meta_read_bits_tag),
    .io_in_1_ready       (_meta_read_arb_io_in_1_ready),
    .io_in_1_valid       (_mshrs_1_io_meta_read_valid),
    .io_in_1_bits_idx    (_mshrs_1_io_meta_read_bits_idx),
    .io_in_1_bits_way_en (_mshrs_1_io_meta_read_bits_way_en),
    .io_in_1_bits_tag    (_mshrs_1_io_meta_read_bits_tag),
    .io_in_2_ready       (_meta_read_arb_io_in_2_ready),
    .io_in_2_valid       (_mshrs_2_io_meta_read_valid),
    .io_in_2_bits_idx    (_mshrs_2_io_meta_read_bits_idx),
    .io_in_2_bits_way_en (_mshrs_2_io_meta_read_bits_way_en),
    .io_in_2_bits_tag    (_mshrs_2_io_meta_read_bits_tag),
    .io_in_3_ready       (_meta_read_arb_io_in_3_ready),
    .io_in_3_valid       (_mshrs_3_io_meta_read_valid),
    .io_in_3_bits_idx    (_mshrs_3_io_meta_read_bits_idx),
    .io_in_3_bits_way_en (_mshrs_3_io_meta_read_bits_way_en),
    .io_in_3_bits_tag    (_mshrs_3_io_meta_read_bits_tag),
    .io_in_4_ready       (_meta_read_arb_io_in_4_ready),
    .io_in_4_valid       (_mshrs_4_io_meta_read_valid),
    .io_in_4_bits_idx    (_mshrs_4_io_meta_read_bits_idx),
    .io_in_4_bits_way_en (_mshrs_4_io_meta_read_bits_way_en),
    .io_in_4_bits_tag    (_mshrs_4_io_meta_read_bits_tag),
    .io_in_5_ready       (_meta_read_arb_io_in_5_ready),
    .io_in_5_valid       (_mshrs_5_io_meta_read_valid),
    .io_in_5_bits_idx    (_mshrs_5_io_meta_read_bits_idx),
    .io_in_5_bits_way_en (_mshrs_5_io_meta_read_bits_way_en),
    .io_in_5_bits_tag    (_mshrs_5_io_meta_read_bits_tag),
    .io_in_6_ready       (_meta_read_arb_io_in_6_ready),
    .io_in_6_valid       (_mshrs_6_io_meta_read_valid),
    .io_in_6_bits_idx    (_mshrs_6_io_meta_read_bits_idx),
    .io_in_6_bits_way_en (_mshrs_6_io_meta_read_bits_way_en),
    .io_in_6_bits_tag    (_mshrs_6_io_meta_read_bits_tag),
    .io_in_7_ready       (_meta_read_arb_io_in_7_ready),
    .io_in_7_valid       (_mshrs_7_io_meta_read_valid),
    .io_in_7_bits_idx    (_mshrs_7_io_meta_read_bits_idx),
    .io_in_7_bits_way_en (_mshrs_7_io_meta_read_bits_way_en),
    .io_in_7_bits_tag    (_mshrs_7_io_meta_read_bits_tag),
    .io_out_ready        (io_meta_read_ready),
    .io_out_valid        (io_meta_read_valid),
    .io_out_bits_idx     (io_meta_read_bits_idx),
    .io_out_bits_way_en  (io_meta_read_bits_way_en),
    .io_out_bits_tag     (io_meta_read_bits_tag)
  );
  Arbiter_4 wb_req_arb (
    .io_in_0_ready       (_wb_req_arb_io_in_0_ready),
    .io_in_0_valid       (_mshrs_0_io_wb_req_valid),
    .io_in_0_bits_tag    (_mshrs_0_io_wb_req_bits_tag),
    .io_in_0_bits_idx    (_mshrs_0_io_wb_req_bits_idx),
    .io_in_0_bits_param  (_mshrs_0_io_wb_req_bits_param),
    .io_in_0_bits_way_en (_mshrs_0_io_wb_req_bits_way_en),
    .io_in_1_ready       (_wb_req_arb_io_in_1_ready),
    .io_in_1_valid       (_mshrs_1_io_wb_req_valid),
    .io_in_1_bits_tag    (_mshrs_1_io_wb_req_bits_tag),
    .io_in_1_bits_idx    (_mshrs_1_io_wb_req_bits_idx),
    .io_in_1_bits_param  (_mshrs_1_io_wb_req_bits_param),
    .io_in_1_bits_way_en (_mshrs_1_io_wb_req_bits_way_en),
    .io_in_2_ready       (_wb_req_arb_io_in_2_ready),
    .io_in_2_valid       (_mshrs_2_io_wb_req_valid),
    .io_in_2_bits_tag    (_mshrs_2_io_wb_req_bits_tag),
    .io_in_2_bits_idx    (_mshrs_2_io_wb_req_bits_idx),
    .io_in_2_bits_param  (_mshrs_2_io_wb_req_bits_param),
    .io_in_2_bits_way_en (_mshrs_2_io_wb_req_bits_way_en),
    .io_in_3_ready       (_wb_req_arb_io_in_3_ready),
    .io_in_3_valid       (_mshrs_3_io_wb_req_valid),
    .io_in_3_bits_tag    (_mshrs_3_io_wb_req_bits_tag),
    .io_in_3_bits_idx    (_mshrs_3_io_wb_req_bits_idx),
    .io_in_3_bits_param  (_mshrs_3_io_wb_req_bits_param),
    .io_in_3_bits_way_en (_mshrs_3_io_wb_req_bits_way_en),
    .io_in_4_ready       (_wb_req_arb_io_in_4_ready),
    .io_in_4_valid       (_mshrs_4_io_wb_req_valid),
    .io_in_4_bits_tag    (_mshrs_4_io_wb_req_bits_tag),
    .io_in_4_bits_idx    (_mshrs_4_io_wb_req_bits_idx),
    .io_in_4_bits_param  (_mshrs_4_io_wb_req_bits_param),
    .io_in_4_bits_way_en (_mshrs_4_io_wb_req_bits_way_en),
    .io_in_5_ready       (_wb_req_arb_io_in_5_ready),
    .io_in_5_valid       (_mshrs_5_io_wb_req_valid),
    .io_in_5_bits_tag    (_mshrs_5_io_wb_req_bits_tag),
    .io_in_5_bits_idx    (_mshrs_5_io_wb_req_bits_idx),
    .io_in_5_bits_param  (_mshrs_5_io_wb_req_bits_param),
    .io_in_5_bits_way_en (_mshrs_5_io_wb_req_bits_way_en),
    .io_in_6_ready       (_wb_req_arb_io_in_6_ready),
    .io_in_6_valid       (_mshrs_6_io_wb_req_valid),
    .io_in_6_bits_tag    (_mshrs_6_io_wb_req_bits_tag),
    .io_in_6_bits_idx    (_mshrs_6_io_wb_req_bits_idx),
    .io_in_6_bits_param  (_mshrs_6_io_wb_req_bits_param),
    .io_in_6_bits_way_en (_mshrs_6_io_wb_req_bits_way_en),
    .io_in_7_ready       (_wb_req_arb_io_in_7_ready),
    .io_in_7_valid       (_mshrs_7_io_wb_req_valid),
    .io_in_7_bits_tag    (_mshrs_7_io_wb_req_bits_tag),
    .io_in_7_bits_idx    (_mshrs_7_io_wb_req_bits_idx),
    .io_in_7_bits_param  (_mshrs_7_io_wb_req_bits_param),
    .io_in_7_bits_way_en (_mshrs_7_io_wb_req_bits_way_en),
    .io_out_ready        (io_wb_req_ready),
    .io_out_valid        (io_wb_req_valid),
    .io_out_bits_tag     (io_wb_req_bits_tag),
    .io_out_bits_idx     (io_wb_req_bits_idx),
    .io_out_bits_param   (io_wb_req_bits_param),
    .io_out_bits_way_en  (io_wb_req_bits_way_en)
  );
  Arbiter_5 replay_arb (
    .io_in_0_ready                    (_replay_arb_io_in_0_ready),
    .io_in_0_valid                    (_mshrs_0_io_replay_valid),
    .io_in_0_bits_uop_uopc            (_mshrs_0_io_replay_bits_uop_uopc),
    .io_in_0_bits_uop_inst            (_mshrs_0_io_replay_bits_uop_inst),
    .io_in_0_bits_uop_debug_inst      (_mshrs_0_io_replay_bits_uop_debug_inst),
    .io_in_0_bits_uop_is_rvc          (_mshrs_0_io_replay_bits_uop_is_rvc),
    .io_in_0_bits_uop_debug_pc        (_mshrs_0_io_replay_bits_uop_debug_pc),
    .io_in_0_bits_uop_iq_type         (_mshrs_0_io_replay_bits_uop_iq_type),
    .io_in_0_bits_uop_fu_code         (_mshrs_0_io_replay_bits_uop_fu_code),
    .io_in_0_bits_uop_ctrl_br_type    (_mshrs_0_io_replay_bits_uop_ctrl_br_type),
    .io_in_0_bits_uop_ctrl_op1_sel    (_mshrs_0_io_replay_bits_uop_ctrl_op1_sel),
    .io_in_0_bits_uop_ctrl_op2_sel    (_mshrs_0_io_replay_bits_uop_ctrl_op2_sel),
    .io_in_0_bits_uop_ctrl_imm_sel    (_mshrs_0_io_replay_bits_uop_ctrl_imm_sel),
    .io_in_0_bits_uop_ctrl_op_fcn     (_mshrs_0_io_replay_bits_uop_ctrl_op_fcn),
    .io_in_0_bits_uop_ctrl_fcn_dw     (_mshrs_0_io_replay_bits_uop_ctrl_fcn_dw),
    .io_in_0_bits_uop_ctrl_csr_cmd    (_mshrs_0_io_replay_bits_uop_ctrl_csr_cmd),
    .io_in_0_bits_uop_ctrl_is_load    (_mshrs_0_io_replay_bits_uop_ctrl_is_load),
    .io_in_0_bits_uop_ctrl_is_sta     (_mshrs_0_io_replay_bits_uop_ctrl_is_sta),
    .io_in_0_bits_uop_ctrl_is_std     (_mshrs_0_io_replay_bits_uop_ctrl_is_std),
    .io_in_0_bits_uop_iw_state        (_mshrs_0_io_replay_bits_uop_iw_state),
    .io_in_0_bits_uop_iw_p1_poisoned  (_mshrs_0_io_replay_bits_uop_iw_p1_poisoned),
    .io_in_0_bits_uop_iw_p2_poisoned  (_mshrs_0_io_replay_bits_uop_iw_p2_poisoned),
    .io_in_0_bits_uop_is_br           (_mshrs_0_io_replay_bits_uop_is_br),
    .io_in_0_bits_uop_is_jalr         (_mshrs_0_io_replay_bits_uop_is_jalr),
    .io_in_0_bits_uop_is_jal          (_mshrs_0_io_replay_bits_uop_is_jal),
    .io_in_0_bits_uop_is_sfb          (_mshrs_0_io_replay_bits_uop_is_sfb),
    .io_in_0_bits_uop_br_mask         (_mshrs_0_io_replay_bits_uop_br_mask),
    .io_in_0_bits_uop_br_tag          (_mshrs_0_io_replay_bits_uop_br_tag),
    .io_in_0_bits_uop_ftq_idx         (_mshrs_0_io_replay_bits_uop_ftq_idx),
    .io_in_0_bits_uop_edge_inst       (_mshrs_0_io_replay_bits_uop_edge_inst),
    .io_in_0_bits_uop_pc_lob          (_mshrs_0_io_replay_bits_uop_pc_lob),
    .io_in_0_bits_uop_taken           (_mshrs_0_io_replay_bits_uop_taken),
    .io_in_0_bits_uop_imm_packed      (_mshrs_0_io_replay_bits_uop_imm_packed),
    .io_in_0_bits_uop_csr_addr        (_mshrs_0_io_replay_bits_uop_csr_addr),
    .io_in_0_bits_uop_rob_idx         (_mshrs_0_io_replay_bits_uop_rob_idx),
    .io_in_0_bits_uop_ldq_idx         (_mshrs_0_io_replay_bits_uop_ldq_idx),
    .io_in_0_bits_uop_stq_idx         (_mshrs_0_io_replay_bits_uop_stq_idx),
    .io_in_0_bits_uop_rxq_idx         (_mshrs_0_io_replay_bits_uop_rxq_idx),
    .io_in_0_bits_uop_pdst            (_mshrs_0_io_replay_bits_uop_pdst),
    .io_in_0_bits_uop_prs1            (_mshrs_0_io_replay_bits_uop_prs1),
    .io_in_0_bits_uop_prs2            (_mshrs_0_io_replay_bits_uop_prs2),
    .io_in_0_bits_uop_prs3            (_mshrs_0_io_replay_bits_uop_prs3),
    .io_in_0_bits_uop_ppred           (_mshrs_0_io_replay_bits_uop_ppred),
    .io_in_0_bits_uop_prs1_busy       (_mshrs_0_io_replay_bits_uop_prs1_busy),
    .io_in_0_bits_uop_prs2_busy       (_mshrs_0_io_replay_bits_uop_prs2_busy),
    .io_in_0_bits_uop_prs3_busy       (_mshrs_0_io_replay_bits_uop_prs3_busy),
    .io_in_0_bits_uop_ppred_busy      (_mshrs_0_io_replay_bits_uop_ppred_busy),
    .io_in_0_bits_uop_stale_pdst      (_mshrs_0_io_replay_bits_uop_stale_pdst),
    .io_in_0_bits_uop_exception       (_mshrs_0_io_replay_bits_uop_exception),
    .io_in_0_bits_uop_exc_cause       (_mshrs_0_io_replay_bits_uop_exc_cause),
    .io_in_0_bits_uop_bypassable      (_mshrs_0_io_replay_bits_uop_bypassable),
    .io_in_0_bits_uop_mem_cmd         (_mshrs_0_io_replay_bits_uop_mem_cmd),
    .io_in_0_bits_uop_mem_size        (_mshrs_0_io_replay_bits_uop_mem_size),
    .io_in_0_bits_uop_mem_signed      (_mshrs_0_io_replay_bits_uop_mem_signed),
    .io_in_0_bits_uop_is_fence        (_mshrs_0_io_replay_bits_uop_is_fence),
    .io_in_0_bits_uop_is_fencei       (_mshrs_0_io_replay_bits_uop_is_fencei),
    .io_in_0_bits_uop_is_amo          (_mshrs_0_io_replay_bits_uop_is_amo),
    .io_in_0_bits_uop_uses_ldq        (_mshrs_0_io_replay_bits_uop_uses_ldq),
    .io_in_0_bits_uop_uses_stq        (_mshrs_0_io_replay_bits_uop_uses_stq),
    .io_in_0_bits_uop_is_sys_pc2epc   (_mshrs_0_io_replay_bits_uop_is_sys_pc2epc),
    .io_in_0_bits_uop_is_unique       (_mshrs_0_io_replay_bits_uop_is_unique),
    .io_in_0_bits_uop_flush_on_commit (_mshrs_0_io_replay_bits_uop_flush_on_commit),
    .io_in_0_bits_uop_ldst_is_rs1     (_mshrs_0_io_replay_bits_uop_ldst_is_rs1),
    .io_in_0_bits_uop_ldst            (_mshrs_0_io_replay_bits_uop_ldst),
    .io_in_0_bits_uop_lrs1            (_mshrs_0_io_replay_bits_uop_lrs1),
    .io_in_0_bits_uop_lrs2            (_mshrs_0_io_replay_bits_uop_lrs2),
    .io_in_0_bits_uop_lrs3            (_mshrs_0_io_replay_bits_uop_lrs3),
    .io_in_0_bits_uop_ldst_val        (_mshrs_0_io_replay_bits_uop_ldst_val),
    .io_in_0_bits_uop_dst_rtype       (_mshrs_0_io_replay_bits_uop_dst_rtype),
    .io_in_0_bits_uop_lrs1_rtype      (_mshrs_0_io_replay_bits_uop_lrs1_rtype),
    .io_in_0_bits_uop_lrs2_rtype      (_mshrs_0_io_replay_bits_uop_lrs2_rtype),
    .io_in_0_bits_uop_frs3_en         (_mshrs_0_io_replay_bits_uop_frs3_en),
    .io_in_0_bits_uop_fp_val          (_mshrs_0_io_replay_bits_uop_fp_val),
    .io_in_0_bits_uop_fp_single       (_mshrs_0_io_replay_bits_uop_fp_single),
    .io_in_0_bits_uop_xcpt_pf_if      (_mshrs_0_io_replay_bits_uop_xcpt_pf_if),
    .io_in_0_bits_uop_xcpt_ae_if      (_mshrs_0_io_replay_bits_uop_xcpt_ae_if),
    .io_in_0_bits_uop_xcpt_ma_if      (_mshrs_0_io_replay_bits_uop_xcpt_ma_if),
    .io_in_0_bits_uop_bp_debug_if     (_mshrs_0_io_replay_bits_uop_bp_debug_if),
    .io_in_0_bits_uop_bp_xcpt_if      (_mshrs_0_io_replay_bits_uop_bp_xcpt_if),
    .io_in_0_bits_uop_debug_fsrc      (_mshrs_0_io_replay_bits_uop_debug_fsrc),
    .io_in_0_bits_uop_debug_tsrc      (_mshrs_0_io_replay_bits_uop_debug_tsrc),
    .io_in_0_bits_addr                (_mshrs_0_io_replay_bits_addr),
    .io_in_0_bits_is_hella            (_mshrs_0_io_replay_bits_is_hella),
    .io_in_0_bits_way_en              (_mshrs_0_io_replay_bits_way_en),
    .io_in_0_bits_sdq_id              (_mshrs_0_io_replay_bits_sdq_id),
    .io_in_1_ready                    (_replay_arb_io_in_1_ready),
    .io_in_1_valid                    (_mshrs_1_io_replay_valid),
    .io_in_1_bits_uop_uopc            (_mshrs_1_io_replay_bits_uop_uopc),
    .io_in_1_bits_uop_inst            (_mshrs_1_io_replay_bits_uop_inst),
    .io_in_1_bits_uop_debug_inst      (_mshrs_1_io_replay_bits_uop_debug_inst),
    .io_in_1_bits_uop_is_rvc          (_mshrs_1_io_replay_bits_uop_is_rvc),
    .io_in_1_bits_uop_debug_pc        (_mshrs_1_io_replay_bits_uop_debug_pc),
    .io_in_1_bits_uop_iq_type         (_mshrs_1_io_replay_bits_uop_iq_type),
    .io_in_1_bits_uop_fu_code         (_mshrs_1_io_replay_bits_uop_fu_code),
    .io_in_1_bits_uop_ctrl_br_type    (_mshrs_1_io_replay_bits_uop_ctrl_br_type),
    .io_in_1_bits_uop_ctrl_op1_sel    (_mshrs_1_io_replay_bits_uop_ctrl_op1_sel),
    .io_in_1_bits_uop_ctrl_op2_sel    (_mshrs_1_io_replay_bits_uop_ctrl_op2_sel),
    .io_in_1_bits_uop_ctrl_imm_sel    (_mshrs_1_io_replay_bits_uop_ctrl_imm_sel),
    .io_in_1_bits_uop_ctrl_op_fcn     (_mshrs_1_io_replay_bits_uop_ctrl_op_fcn),
    .io_in_1_bits_uop_ctrl_fcn_dw     (_mshrs_1_io_replay_bits_uop_ctrl_fcn_dw),
    .io_in_1_bits_uop_ctrl_csr_cmd    (_mshrs_1_io_replay_bits_uop_ctrl_csr_cmd),
    .io_in_1_bits_uop_ctrl_is_load    (_mshrs_1_io_replay_bits_uop_ctrl_is_load),
    .io_in_1_bits_uop_ctrl_is_sta     (_mshrs_1_io_replay_bits_uop_ctrl_is_sta),
    .io_in_1_bits_uop_ctrl_is_std     (_mshrs_1_io_replay_bits_uop_ctrl_is_std),
    .io_in_1_bits_uop_iw_state        (_mshrs_1_io_replay_bits_uop_iw_state),
    .io_in_1_bits_uop_iw_p1_poisoned  (_mshrs_1_io_replay_bits_uop_iw_p1_poisoned),
    .io_in_1_bits_uop_iw_p2_poisoned  (_mshrs_1_io_replay_bits_uop_iw_p2_poisoned),
    .io_in_1_bits_uop_is_br           (_mshrs_1_io_replay_bits_uop_is_br),
    .io_in_1_bits_uop_is_jalr         (_mshrs_1_io_replay_bits_uop_is_jalr),
    .io_in_1_bits_uop_is_jal          (_mshrs_1_io_replay_bits_uop_is_jal),
    .io_in_1_bits_uop_is_sfb          (_mshrs_1_io_replay_bits_uop_is_sfb),
    .io_in_1_bits_uop_br_mask         (_mshrs_1_io_replay_bits_uop_br_mask),
    .io_in_1_bits_uop_br_tag          (_mshrs_1_io_replay_bits_uop_br_tag),
    .io_in_1_bits_uop_ftq_idx         (_mshrs_1_io_replay_bits_uop_ftq_idx),
    .io_in_1_bits_uop_edge_inst       (_mshrs_1_io_replay_bits_uop_edge_inst),
    .io_in_1_bits_uop_pc_lob          (_mshrs_1_io_replay_bits_uop_pc_lob),
    .io_in_1_bits_uop_taken           (_mshrs_1_io_replay_bits_uop_taken),
    .io_in_1_bits_uop_imm_packed      (_mshrs_1_io_replay_bits_uop_imm_packed),
    .io_in_1_bits_uop_csr_addr        (_mshrs_1_io_replay_bits_uop_csr_addr),
    .io_in_1_bits_uop_rob_idx         (_mshrs_1_io_replay_bits_uop_rob_idx),
    .io_in_1_bits_uop_ldq_idx         (_mshrs_1_io_replay_bits_uop_ldq_idx),
    .io_in_1_bits_uop_stq_idx         (_mshrs_1_io_replay_bits_uop_stq_idx),
    .io_in_1_bits_uop_rxq_idx         (_mshrs_1_io_replay_bits_uop_rxq_idx),
    .io_in_1_bits_uop_pdst            (_mshrs_1_io_replay_bits_uop_pdst),
    .io_in_1_bits_uop_prs1            (_mshrs_1_io_replay_bits_uop_prs1),
    .io_in_1_bits_uop_prs2            (_mshrs_1_io_replay_bits_uop_prs2),
    .io_in_1_bits_uop_prs3            (_mshrs_1_io_replay_bits_uop_prs3),
    .io_in_1_bits_uop_ppred           (_mshrs_1_io_replay_bits_uop_ppred),
    .io_in_1_bits_uop_prs1_busy       (_mshrs_1_io_replay_bits_uop_prs1_busy),
    .io_in_1_bits_uop_prs2_busy       (_mshrs_1_io_replay_bits_uop_prs2_busy),
    .io_in_1_bits_uop_prs3_busy       (_mshrs_1_io_replay_bits_uop_prs3_busy),
    .io_in_1_bits_uop_ppred_busy      (_mshrs_1_io_replay_bits_uop_ppred_busy),
    .io_in_1_bits_uop_stale_pdst      (_mshrs_1_io_replay_bits_uop_stale_pdst),
    .io_in_1_bits_uop_exception       (_mshrs_1_io_replay_bits_uop_exception),
    .io_in_1_bits_uop_exc_cause       (_mshrs_1_io_replay_bits_uop_exc_cause),
    .io_in_1_bits_uop_bypassable      (_mshrs_1_io_replay_bits_uop_bypassable),
    .io_in_1_bits_uop_mem_cmd         (_mshrs_1_io_replay_bits_uop_mem_cmd),
    .io_in_1_bits_uop_mem_size        (_mshrs_1_io_replay_bits_uop_mem_size),
    .io_in_1_bits_uop_mem_signed      (_mshrs_1_io_replay_bits_uop_mem_signed),
    .io_in_1_bits_uop_is_fence        (_mshrs_1_io_replay_bits_uop_is_fence),
    .io_in_1_bits_uop_is_fencei       (_mshrs_1_io_replay_bits_uop_is_fencei),
    .io_in_1_bits_uop_is_amo          (_mshrs_1_io_replay_bits_uop_is_amo),
    .io_in_1_bits_uop_uses_ldq        (_mshrs_1_io_replay_bits_uop_uses_ldq),
    .io_in_1_bits_uop_uses_stq        (_mshrs_1_io_replay_bits_uop_uses_stq),
    .io_in_1_bits_uop_is_sys_pc2epc   (_mshrs_1_io_replay_bits_uop_is_sys_pc2epc),
    .io_in_1_bits_uop_is_unique       (_mshrs_1_io_replay_bits_uop_is_unique),
    .io_in_1_bits_uop_flush_on_commit (_mshrs_1_io_replay_bits_uop_flush_on_commit),
    .io_in_1_bits_uop_ldst_is_rs1     (_mshrs_1_io_replay_bits_uop_ldst_is_rs1),
    .io_in_1_bits_uop_ldst            (_mshrs_1_io_replay_bits_uop_ldst),
    .io_in_1_bits_uop_lrs1            (_mshrs_1_io_replay_bits_uop_lrs1),
    .io_in_1_bits_uop_lrs2            (_mshrs_1_io_replay_bits_uop_lrs2),
    .io_in_1_bits_uop_lrs3            (_mshrs_1_io_replay_bits_uop_lrs3),
    .io_in_1_bits_uop_ldst_val        (_mshrs_1_io_replay_bits_uop_ldst_val),
    .io_in_1_bits_uop_dst_rtype       (_mshrs_1_io_replay_bits_uop_dst_rtype),
    .io_in_1_bits_uop_lrs1_rtype      (_mshrs_1_io_replay_bits_uop_lrs1_rtype),
    .io_in_1_bits_uop_lrs2_rtype      (_mshrs_1_io_replay_bits_uop_lrs2_rtype),
    .io_in_1_bits_uop_frs3_en         (_mshrs_1_io_replay_bits_uop_frs3_en),
    .io_in_1_bits_uop_fp_val          (_mshrs_1_io_replay_bits_uop_fp_val),
    .io_in_1_bits_uop_fp_single       (_mshrs_1_io_replay_bits_uop_fp_single),
    .io_in_1_bits_uop_xcpt_pf_if      (_mshrs_1_io_replay_bits_uop_xcpt_pf_if),
    .io_in_1_bits_uop_xcpt_ae_if      (_mshrs_1_io_replay_bits_uop_xcpt_ae_if),
    .io_in_1_bits_uop_xcpt_ma_if      (_mshrs_1_io_replay_bits_uop_xcpt_ma_if),
    .io_in_1_bits_uop_bp_debug_if     (_mshrs_1_io_replay_bits_uop_bp_debug_if),
    .io_in_1_bits_uop_bp_xcpt_if      (_mshrs_1_io_replay_bits_uop_bp_xcpt_if),
    .io_in_1_bits_uop_debug_fsrc      (_mshrs_1_io_replay_bits_uop_debug_fsrc),
    .io_in_1_bits_uop_debug_tsrc      (_mshrs_1_io_replay_bits_uop_debug_tsrc),
    .io_in_1_bits_addr                (_mshrs_1_io_replay_bits_addr),
    .io_in_1_bits_is_hella            (_mshrs_1_io_replay_bits_is_hella),
    .io_in_1_bits_way_en              (_mshrs_1_io_replay_bits_way_en),
    .io_in_1_bits_sdq_id              (_mshrs_1_io_replay_bits_sdq_id),
    .io_in_2_ready                    (_replay_arb_io_in_2_ready),
    .io_in_2_valid                    (_mshrs_2_io_replay_valid),
    .io_in_2_bits_uop_uopc            (_mshrs_2_io_replay_bits_uop_uopc),
    .io_in_2_bits_uop_inst            (_mshrs_2_io_replay_bits_uop_inst),
    .io_in_2_bits_uop_debug_inst      (_mshrs_2_io_replay_bits_uop_debug_inst),
    .io_in_2_bits_uop_is_rvc          (_mshrs_2_io_replay_bits_uop_is_rvc),
    .io_in_2_bits_uop_debug_pc        (_mshrs_2_io_replay_bits_uop_debug_pc),
    .io_in_2_bits_uop_iq_type         (_mshrs_2_io_replay_bits_uop_iq_type),
    .io_in_2_bits_uop_fu_code         (_mshrs_2_io_replay_bits_uop_fu_code),
    .io_in_2_bits_uop_ctrl_br_type    (_mshrs_2_io_replay_bits_uop_ctrl_br_type),
    .io_in_2_bits_uop_ctrl_op1_sel    (_mshrs_2_io_replay_bits_uop_ctrl_op1_sel),
    .io_in_2_bits_uop_ctrl_op2_sel    (_mshrs_2_io_replay_bits_uop_ctrl_op2_sel),
    .io_in_2_bits_uop_ctrl_imm_sel    (_mshrs_2_io_replay_bits_uop_ctrl_imm_sel),
    .io_in_2_bits_uop_ctrl_op_fcn     (_mshrs_2_io_replay_bits_uop_ctrl_op_fcn),
    .io_in_2_bits_uop_ctrl_fcn_dw     (_mshrs_2_io_replay_bits_uop_ctrl_fcn_dw),
    .io_in_2_bits_uop_ctrl_csr_cmd    (_mshrs_2_io_replay_bits_uop_ctrl_csr_cmd),
    .io_in_2_bits_uop_ctrl_is_load    (_mshrs_2_io_replay_bits_uop_ctrl_is_load),
    .io_in_2_bits_uop_ctrl_is_sta     (_mshrs_2_io_replay_bits_uop_ctrl_is_sta),
    .io_in_2_bits_uop_ctrl_is_std     (_mshrs_2_io_replay_bits_uop_ctrl_is_std),
    .io_in_2_bits_uop_iw_state        (_mshrs_2_io_replay_bits_uop_iw_state),
    .io_in_2_bits_uop_iw_p1_poisoned  (_mshrs_2_io_replay_bits_uop_iw_p1_poisoned),
    .io_in_2_bits_uop_iw_p2_poisoned  (_mshrs_2_io_replay_bits_uop_iw_p2_poisoned),
    .io_in_2_bits_uop_is_br           (_mshrs_2_io_replay_bits_uop_is_br),
    .io_in_2_bits_uop_is_jalr         (_mshrs_2_io_replay_bits_uop_is_jalr),
    .io_in_2_bits_uop_is_jal          (_mshrs_2_io_replay_bits_uop_is_jal),
    .io_in_2_bits_uop_is_sfb          (_mshrs_2_io_replay_bits_uop_is_sfb),
    .io_in_2_bits_uop_br_mask         (_mshrs_2_io_replay_bits_uop_br_mask),
    .io_in_2_bits_uop_br_tag          (_mshrs_2_io_replay_bits_uop_br_tag),
    .io_in_2_bits_uop_ftq_idx         (_mshrs_2_io_replay_bits_uop_ftq_idx),
    .io_in_2_bits_uop_edge_inst       (_mshrs_2_io_replay_bits_uop_edge_inst),
    .io_in_2_bits_uop_pc_lob          (_mshrs_2_io_replay_bits_uop_pc_lob),
    .io_in_2_bits_uop_taken           (_mshrs_2_io_replay_bits_uop_taken),
    .io_in_2_bits_uop_imm_packed      (_mshrs_2_io_replay_bits_uop_imm_packed),
    .io_in_2_bits_uop_csr_addr        (_mshrs_2_io_replay_bits_uop_csr_addr),
    .io_in_2_bits_uop_rob_idx         (_mshrs_2_io_replay_bits_uop_rob_idx),
    .io_in_2_bits_uop_ldq_idx         (_mshrs_2_io_replay_bits_uop_ldq_idx),
    .io_in_2_bits_uop_stq_idx         (_mshrs_2_io_replay_bits_uop_stq_idx),
    .io_in_2_bits_uop_rxq_idx         (_mshrs_2_io_replay_bits_uop_rxq_idx),
    .io_in_2_bits_uop_pdst            (_mshrs_2_io_replay_bits_uop_pdst),
    .io_in_2_bits_uop_prs1            (_mshrs_2_io_replay_bits_uop_prs1),
    .io_in_2_bits_uop_prs2            (_mshrs_2_io_replay_bits_uop_prs2),
    .io_in_2_bits_uop_prs3            (_mshrs_2_io_replay_bits_uop_prs3),
    .io_in_2_bits_uop_ppred           (_mshrs_2_io_replay_bits_uop_ppred),
    .io_in_2_bits_uop_prs1_busy       (_mshrs_2_io_replay_bits_uop_prs1_busy),
    .io_in_2_bits_uop_prs2_busy       (_mshrs_2_io_replay_bits_uop_prs2_busy),
    .io_in_2_bits_uop_prs3_busy       (_mshrs_2_io_replay_bits_uop_prs3_busy),
    .io_in_2_bits_uop_ppred_busy      (_mshrs_2_io_replay_bits_uop_ppred_busy),
    .io_in_2_bits_uop_stale_pdst      (_mshrs_2_io_replay_bits_uop_stale_pdst),
    .io_in_2_bits_uop_exception       (_mshrs_2_io_replay_bits_uop_exception),
    .io_in_2_bits_uop_exc_cause       (_mshrs_2_io_replay_bits_uop_exc_cause),
    .io_in_2_bits_uop_bypassable      (_mshrs_2_io_replay_bits_uop_bypassable),
    .io_in_2_bits_uop_mem_cmd         (_mshrs_2_io_replay_bits_uop_mem_cmd),
    .io_in_2_bits_uop_mem_size        (_mshrs_2_io_replay_bits_uop_mem_size),
    .io_in_2_bits_uop_mem_signed      (_mshrs_2_io_replay_bits_uop_mem_signed),
    .io_in_2_bits_uop_is_fence        (_mshrs_2_io_replay_bits_uop_is_fence),
    .io_in_2_bits_uop_is_fencei       (_mshrs_2_io_replay_bits_uop_is_fencei),
    .io_in_2_bits_uop_is_amo          (_mshrs_2_io_replay_bits_uop_is_amo),
    .io_in_2_bits_uop_uses_ldq        (_mshrs_2_io_replay_bits_uop_uses_ldq),
    .io_in_2_bits_uop_uses_stq        (_mshrs_2_io_replay_bits_uop_uses_stq),
    .io_in_2_bits_uop_is_sys_pc2epc   (_mshrs_2_io_replay_bits_uop_is_sys_pc2epc),
    .io_in_2_bits_uop_is_unique       (_mshrs_2_io_replay_bits_uop_is_unique),
    .io_in_2_bits_uop_flush_on_commit (_mshrs_2_io_replay_bits_uop_flush_on_commit),
    .io_in_2_bits_uop_ldst_is_rs1     (_mshrs_2_io_replay_bits_uop_ldst_is_rs1),
    .io_in_2_bits_uop_ldst            (_mshrs_2_io_replay_bits_uop_ldst),
    .io_in_2_bits_uop_lrs1            (_mshrs_2_io_replay_bits_uop_lrs1),
    .io_in_2_bits_uop_lrs2            (_mshrs_2_io_replay_bits_uop_lrs2),
    .io_in_2_bits_uop_lrs3            (_mshrs_2_io_replay_bits_uop_lrs3),
    .io_in_2_bits_uop_ldst_val        (_mshrs_2_io_replay_bits_uop_ldst_val),
    .io_in_2_bits_uop_dst_rtype       (_mshrs_2_io_replay_bits_uop_dst_rtype),
    .io_in_2_bits_uop_lrs1_rtype      (_mshrs_2_io_replay_bits_uop_lrs1_rtype),
    .io_in_2_bits_uop_lrs2_rtype      (_mshrs_2_io_replay_bits_uop_lrs2_rtype),
    .io_in_2_bits_uop_frs3_en         (_mshrs_2_io_replay_bits_uop_frs3_en),
    .io_in_2_bits_uop_fp_val          (_mshrs_2_io_replay_bits_uop_fp_val),
    .io_in_2_bits_uop_fp_single       (_mshrs_2_io_replay_bits_uop_fp_single),
    .io_in_2_bits_uop_xcpt_pf_if      (_mshrs_2_io_replay_bits_uop_xcpt_pf_if),
    .io_in_2_bits_uop_xcpt_ae_if      (_mshrs_2_io_replay_bits_uop_xcpt_ae_if),
    .io_in_2_bits_uop_xcpt_ma_if      (_mshrs_2_io_replay_bits_uop_xcpt_ma_if),
    .io_in_2_bits_uop_bp_debug_if     (_mshrs_2_io_replay_bits_uop_bp_debug_if),
    .io_in_2_bits_uop_bp_xcpt_if      (_mshrs_2_io_replay_bits_uop_bp_xcpt_if),
    .io_in_2_bits_uop_debug_fsrc      (_mshrs_2_io_replay_bits_uop_debug_fsrc),
    .io_in_2_bits_uop_debug_tsrc      (_mshrs_2_io_replay_bits_uop_debug_tsrc),
    .io_in_2_bits_addr                (_mshrs_2_io_replay_bits_addr),
    .io_in_2_bits_is_hella            (_mshrs_2_io_replay_bits_is_hella),
    .io_in_2_bits_way_en              (_mshrs_2_io_replay_bits_way_en),
    .io_in_2_bits_sdq_id              (_mshrs_2_io_replay_bits_sdq_id),
    .io_in_3_ready                    (_replay_arb_io_in_3_ready),
    .io_in_3_valid                    (_mshrs_3_io_replay_valid),
    .io_in_3_bits_uop_uopc            (_mshrs_3_io_replay_bits_uop_uopc),
    .io_in_3_bits_uop_inst            (_mshrs_3_io_replay_bits_uop_inst),
    .io_in_3_bits_uop_debug_inst      (_mshrs_3_io_replay_bits_uop_debug_inst),
    .io_in_3_bits_uop_is_rvc          (_mshrs_3_io_replay_bits_uop_is_rvc),
    .io_in_3_bits_uop_debug_pc        (_mshrs_3_io_replay_bits_uop_debug_pc),
    .io_in_3_bits_uop_iq_type         (_mshrs_3_io_replay_bits_uop_iq_type),
    .io_in_3_bits_uop_fu_code         (_mshrs_3_io_replay_bits_uop_fu_code),
    .io_in_3_bits_uop_ctrl_br_type    (_mshrs_3_io_replay_bits_uop_ctrl_br_type),
    .io_in_3_bits_uop_ctrl_op1_sel    (_mshrs_3_io_replay_bits_uop_ctrl_op1_sel),
    .io_in_3_bits_uop_ctrl_op2_sel    (_mshrs_3_io_replay_bits_uop_ctrl_op2_sel),
    .io_in_3_bits_uop_ctrl_imm_sel    (_mshrs_3_io_replay_bits_uop_ctrl_imm_sel),
    .io_in_3_bits_uop_ctrl_op_fcn     (_mshrs_3_io_replay_bits_uop_ctrl_op_fcn),
    .io_in_3_bits_uop_ctrl_fcn_dw     (_mshrs_3_io_replay_bits_uop_ctrl_fcn_dw),
    .io_in_3_bits_uop_ctrl_csr_cmd    (_mshrs_3_io_replay_bits_uop_ctrl_csr_cmd),
    .io_in_3_bits_uop_ctrl_is_load    (_mshrs_3_io_replay_bits_uop_ctrl_is_load),
    .io_in_3_bits_uop_ctrl_is_sta     (_mshrs_3_io_replay_bits_uop_ctrl_is_sta),
    .io_in_3_bits_uop_ctrl_is_std     (_mshrs_3_io_replay_bits_uop_ctrl_is_std),
    .io_in_3_bits_uop_iw_state        (_mshrs_3_io_replay_bits_uop_iw_state),
    .io_in_3_bits_uop_iw_p1_poisoned  (_mshrs_3_io_replay_bits_uop_iw_p1_poisoned),
    .io_in_3_bits_uop_iw_p2_poisoned  (_mshrs_3_io_replay_bits_uop_iw_p2_poisoned),
    .io_in_3_bits_uop_is_br           (_mshrs_3_io_replay_bits_uop_is_br),
    .io_in_3_bits_uop_is_jalr         (_mshrs_3_io_replay_bits_uop_is_jalr),
    .io_in_3_bits_uop_is_jal          (_mshrs_3_io_replay_bits_uop_is_jal),
    .io_in_3_bits_uop_is_sfb          (_mshrs_3_io_replay_bits_uop_is_sfb),
    .io_in_3_bits_uop_br_mask         (_mshrs_3_io_replay_bits_uop_br_mask),
    .io_in_3_bits_uop_br_tag          (_mshrs_3_io_replay_bits_uop_br_tag),
    .io_in_3_bits_uop_ftq_idx         (_mshrs_3_io_replay_bits_uop_ftq_idx),
    .io_in_3_bits_uop_edge_inst       (_mshrs_3_io_replay_bits_uop_edge_inst),
    .io_in_3_bits_uop_pc_lob          (_mshrs_3_io_replay_bits_uop_pc_lob),
    .io_in_3_bits_uop_taken           (_mshrs_3_io_replay_bits_uop_taken),
    .io_in_3_bits_uop_imm_packed      (_mshrs_3_io_replay_bits_uop_imm_packed),
    .io_in_3_bits_uop_csr_addr        (_mshrs_3_io_replay_bits_uop_csr_addr),
    .io_in_3_bits_uop_rob_idx         (_mshrs_3_io_replay_bits_uop_rob_idx),
    .io_in_3_bits_uop_ldq_idx         (_mshrs_3_io_replay_bits_uop_ldq_idx),
    .io_in_3_bits_uop_stq_idx         (_mshrs_3_io_replay_bits_uop_stq_idx),
    .io_in_3_bits_uop_rxq_idx         (_mshrs_3_io_replay_bits_uop_rxq_idx),
    .io_in_3_bits_uop_pdst            (_mshrs_3_io_replay_bits_uop_pdst),
    .io_in_3_bits_uop_prs1            (_mshrs_3_io_replay_bits_uop_prs1),
    .io_in_3_bits_uop_prs2            (_mshrs_3_io_replay_bits_uop_prs2),
    .io_in_3_bits_uop_prs3            (_mshrs_3_io_replay_bits_uop_prs3),
    .io_in_3_bits_uop_ppred           (_mshrs_3_io_replay_bits_uop_ppred),
    .io_in_3_bits_uop_prs1_busy       (_mshrs_3_io_replay_bits_uop_prs1_busy),
    .io_in_3_bits_uop_prs2_busy       (_mshrs_3_io_replay_bits_uop_prs2_busy),
    .io_in_3_bits_uop_prs3_busy       (_mshrs_3_io_replay_bits_uop_prs3_busy),
    .io_in_3_bits_uop_ppred_busy      (_mshrs_3_io_replay_bits_uop_ppred_busy),
    .io_in_3_bits_uop_stale_pdst      (_mshrs_3_io_replay_bits_uop_stale_pdst),
    .io_in_3_bits_uop_exception       (_mshrs_3_io_replay_bits_uop_exception),
    .io_in_3_bits_uop_exc_cause       (_mshrs_3_io_replay_bits_uop_exc_cause),
    .io_in_3_bits_uop_bypassable      (_mshrs_3_io_replay_bits_uop_bypassable),
    .io_in_3_bits_uop_mem_cmd         (_mshrs_3_io_replay_bits_uop_mem_cmd),
    .io_in_3_bits_uop_mem_size        (_mshrs_3_io_replay_bits_uop_mem_size),
    .io_in_3_bits_uop_mem_signed      (_mshrs_3_io_replay_bits_uop_mem_signed),
    .io_in_3_bits_uop_is_fence        (_mshrs_3_io_replay_bits_uop_is_fence),
    .io_in_3_bits_uop_is_fencei       (_mshrs_3_io_replay_bits_uop_is_fencei),
    .io_in_3_bits_uop_is_amo          (_mshrs_3_io_replay_bits_uop_is_amo),
    .io_in_3_bits_uop_uses_ldq        (_mshrs_3_io_replay_bits_uop_uses_ldq),
    .io_in_3_bits_uop_uses_stq        (_mshrs_3_io_replay_bits_uop_uses_stq),
    .io_in_3_bits_uop_is_sys_pc2epc   (_mshrs_3_io_replay_bits_uop_is_sys_pc2epc),
    .io_in_3_bits_uop_is_unique       (_mshrs_3_io_replay_bits_uop_is_unique),
    .io_in_3_bits_uop_flush_on_commit (_mshrs_3_io_replay_bits_uop_flush_on_commit),
    .io_in_3_bits_uop_ldst_is_rs1     (_mshrs_3_io_replay_bits_uop_ldst_is_rs1),
    .io_in_3_bits_uop_ldst            (_mshrs_3_io_replay_bits_uop_ldst),
    .io_in_3_bits_uop_lrs1            (_mshrs_3_io_replay_bits_uop_lrs1),
    .io_in_3_bits_uop_lrs2            (_mshrs_3_io_replay_bits_uop_lrs2),
    .io_in_3_bits_uop_lrs3            (_mshrs_3_io_replay_bits_uop_lrs3),
    .io_in_3_bits_uop_ldst_val        (_mshrs_3_io_replay_bits_uop_ldst_val),
    .io_in_3_bits_uop_dst_rtype       (_mshrs_3_io_replay_bits_uop_dst_rtype),
    .io_in_3_bits_uop_lrs1_rtype      (_mshrs_3_io_replay_bits_uop_lrs1_rtype),
    .io_in_3_bits_uop_lrs2_rtype      (_mshrs_3_io_replay_bits_uop_lrs2_rtype),
    .io_in_3_bits_uop_frs3_en         (_mshrs_3_io_replay_bits_uop_frs3_en),
    .io_in_3_bits_uop_fp_val          (_mshrs_3_io_replay_bits_uop_fp_val),
    .io_in_3_bits_uop_fp_single       (_mshrs_3_io_replay_bits_uop_fp_single),
    .io_in_3_bits_uop_xcpt_pf_if      (_mshrs_3_io_replay_bits_uop_xcpt_pf_if),
    .io_in_3_bits_uop_xcpt_ae_if      (_mshrs_3_io_replay_bits_uop_xcpt_ae_if),
    .io_in_3_bits_uop_xcpt_ma_if      (_mshrs_3_io_replay_bits_uop_xcpt_ma_if),
    .io_in_3_bits_uop_bp_debug_if     (_mshrs_3_io_replay_bits_uop_bp_debug_if),
    .io_in_3_bits_uop_bp_xcpt_if      (_mshrs_3_io_replay_bits_uop_bp_xcpt_if),
    .io_in_3_bits_uop_debug_fsrc      (_mshrs_3_io_replay_bits_uop_debug_fsrc),
    .io_in_3_bits_uop_debug_tsrc      (_mshrs_3_io_replay_bits_uop_debug_tsrc),
    .io_in_3_bits_addr                (_mshrs_3_io_replay_bits_addr),
    .io_in_3_bits_is_hella            (_mshrs_3_io_replay_bits_is_hella),
    .io_in_3_bits_way_en              (_mshrs_3_io_replay_bits_way_en),
    .io_in_3_bits_sdq_id              (_mshrs_3_io_replay_bits_sdq_id),
    .io_in_4_ready                    (_replay_arb_io_in_4_ready),
    .io_in_4_valid                    (_mshrs_4_io_replay_valid),
    .io_in_4_bits_uop_uopc            (_mshrs_4_io_replay_bits_uop_uopc),
    .io_in_4_bits_uop_inst            (_mshrs_4_io_replay_bits_uop_inst),
    .io_in_4_bits_uop_debug_inst      (_mshrs_4_io_replay_bits_uop_debug_inst),
    .io_in_4_bits_uop_is_rvc          (_mshrs_4_io_replay_bits_uop_is_rvc),
    .io_in_4_bits_uop_debug_pc        (_mshrs_4_io_replay_bits_uop_debug_pc),
    .io_in_4_bits_uop_iq_type         (_mshrs_4_io_replay_bits_uop_iq_type),
    .io_in_4_bits_uop_fu_code         (_mshrs_4_io_replay_bits_uop_fu_code),
    .io_in_4_bits_uop_ctrl_br_type    (_mshrs_4_io_replay_bits_uop_ctrl_br_type),
    .io_in_4_bits_uop_ctrl_op1_sel    (_mshrs_4_io_replay_bits_uop_ctrl_op1_sel),
    .io_in_4_bits_uop_ctrl_op2_sel    (_mshrs_4_io_replay_bits_uop_ctrl_op2_sel),
    .io_in_4_bits_uop_ctrl_imm_sel    (_mshrs_4_io_replay_bits_uop_ctrl_imm_sel),
    .io_in_4_bits_uop_ctrl_op_fcn     (_mshrs_4_io_replay_bits_uop_ctrl_op_fcn),
    .io_in_4_bits_uop_ctrl_fcn_dw     (_mshrs_4_io_replay_bits_uop_ctrl_fcn_dw),
    .io_in_4_bits_uop_ctrl_csr_cmd    (_mshrs_4_io_replay_bits_uop_ctrl_csr_cmd),
    .io_in_4_bits_uop_ctrl_is_load    (_mshrs_4_io_replay_bits_uop_ctrl_is_load),
    .io_in_4_bits_uop_ctrl_is_sta     (_mshrs_4_io_replay_bits_uop_ctrl_is_sta),
    .io_in_4_bits_uop_ctrl_is_std     (_mshrs_4_io_replay_bits_uop_ctrl_is_std),
    .io_in_4_bits_uop_iw_state        (_mshrs_4_io_replay_bits_uop_iw_state),
    .io_in_4_bits_uop_iw_p1_poisoned  (_mshrs_4_io_replay_bits_uop_iw_p1_poisoned),
    .io_in_4_bits_uop_iw_p2_poisoned  (_mshrs_4_io_replay_bits_uop_iw_p2_poisoned),
    .io_in_4_bits_uop_is_br           (_mshrs_4_io_replay_bits_uop_is_br),
    .io_in_4_bits_uop_is_jalr         (_mshrs_4_io_replay_bits_uop_is_jalr),
    .io_in_4_bits_uop_is_jal          (_mshrs_4_io_replay_bits_uop_is_jal),
    .io_in_4_bits_uop_is_sfb          (_mshrs_4_io_replay_bits_uop_is_sfb),
    .io_in_4_bits_uop_br_mask         (_mshrs_4_io_replay_bits_uop_br_mask),
    .io_in_4_bits_uop_br_tag          (_mshrs_4_io_replay_bits_uop_br_tag),
    .io_in_4_bits_uop_ftq_idx         (_mshrs_4_io_replay_bits_uop_ftq_idx),
    .io_in_4_bits_uop_edge_inst       (_mshrs_4_io_replay_bits_uop_edge_inst),
    .io_in_4_bits_uop_pc_lob          (_mshrs_4_io_replay_bits_uop_pc_lob),
    .io_in_4_bits_uop_taken           (_mshrs_4_io_replay_bits_uop_taken),
    .io_in_4_bits_uop_imm_packed      (_mshrs_4_io_replay_bits_uop_imm_packed),
    .io_in_4_bits_uop_csr_addr        (_mshrs_4_io_replay_bits_uop_csr_addr),
    .io_in_4_bits_uop_rob_idx         (_mshrs_4_io_replay_bits_uop_rob_idx),
    .io_in_4_bits_uop_ldq_idx         (_mshrs_4_io_replay_bits_uop_ldq_idx),
    .io_in_4_bits_uop_stq_idx         (_mshrs_4_io_replay_bits_uop_stq_idx),
    .io_in_4_bits_uop_rxq_idx         (_mshrs_4_io_replay_bits_uop_rxq_idx),
    .io_in_4_bits_uop_pdst            (_mshrs_4_io_replay_bits_uop_pdst),
    .io_in_4_bits_uop_prs1            (_mshrs_4_io_replay_bits_uop_prs1),
    .io_in_4_bits_uop_prs2            (_mshrs_4_io_replay_bits_uop_prs2),
    .io_in_4_bits_uop_prs3            (_mshrs_4_io_replay_bits_uop_prs3),
    .io_in_4_bits_uop_ppred           (_mshrs_4_io_replay_bits_uop_ppred),
    .io_in_4_bits_uop_prs1_busy       (_mshrs_4_io_replay_bits_uop_prs1_busy),
    .io_in_4_bits_uop_prs2_busy       (_mshrs_4_io_replay_bits_uop_prs2_busy),
    .io_in_4_bits_uop_prs3_busy       (_mshrs_4_io_replay_bits_uop_prs3_busy),
    .io_in_4_bits_uop_ppred_busy      (_mshrs_4_io_replay_bits_uop_ppred_busy),
    .io_in_4_bits_uop_stale_pdst      (_mshrs_4_io_replay_bits_uop_stale_pdst),
    .io_in_4_bits_uop_exception       (_mshrs_4_io_replay_bits_uop_exception),
    .io_in_4_bits_uop_exc_cause       (_mshrs_4_io_replay_bits_uop_exc_cause),
    .io_in_4_bits_uop_bypassable      (_mshrs_4_io_replay_bits_uop_bypassable),
    .io_in_4_bits_uop_mem_cmd         (_mshrs_4_io_replay_bits_uop_mem_cmd),
    .io_in_4_bits_uop_mem_size        (_mshrs_4_io_replay_bits_uop_mem_size),
    .io_in_4_bits_uop_mem_signed      (_mshrs_4_io_replay_bits_uop_mem_signed),
    .io_in_4_bits_uop_is_fence        (_mshrs_4_io_replay_bits_uop_is_fence),
    .io_in_4_bits_uop_is_fencei       (_mshrs_4_io_replay_bits_uop_is_fencei),
    .io_in_4_bits_uop_is_amo          (_mshrs_4_io_replay_bits_uop_is_amo),
    .io_in_4_bits_uop_uses_ldq        (_mshrs_4_io_replay_bits_uop_uses_ldq),
    .io_in_4_bits_uop_uses_stq        (_mshrs_4_io_replay_bits_uop_uses_stq),
    .io_in_4_bits_uop_is_sys_pc2epc   (_mshrs_4_io_replay_bits_uop_is_sys_pc2epc),
    .io_in_4_bits_uop_is_unique       (_mshrs_4_io_replay_bits_uop_is_unique),
    .io_in_4_bits_uop_flush_on_commit (_mshrs_4_io_replay_bits_uop_flush_on_commit),
    .io_in_4_bits_uop_ldst_is_rs1     (_mshrs_4_io_replay_bits_uop_ldst_is_rs1),
    .io_in_4_bits_uop_ldst            (_mshrs_4_io_replay_bits_uop_ldst),
    .io_in_4_bits_uop_lrs1            (_mshrs_4_io_replay_bits_uop_lrs1),
    .io_in_4_bits_uop_lrs2            (_mshrs_4_io_replay_bits_uop_lrs2),
    .io_in_4_bits_uop_lrs3            (_mshrs_4_io_replay_bits_uop_lrs3),
    .io_in_4_bits_uop_ldst_val        (_mshrs_4_io_replay_bits_uop_ldst_val),
    .io_in_4_bits_uop_dst_rtype       (_mshrs_4_io_replay_bits_uop_dst_rtype),
    .io_in_4_bits_uop_lrs1_rtype      (_mshrs_4_io_replay_bits_uop_lrs1_rtype),
    .io_in_4_bits_uop_lrs2_rtype      (_mshrs_4_io_replay_bits_uop_lrs2_rtype),
    .io_in_4_bits_uop_frs3_en         (_mshrs_4_io_replay_bits_uop_frs3_en),
    .io_in_4_bits_uop_fp_val          (_mshrs_4_io_replay_bits_uop_fp_val),
    .io_in_4_bits_uop_fp_single       (_mshrs_4_io_replay_bits_uop_fp_single),
    .io_in_4_bits_uop_xcpt_pf_if      (_mshrs_4_io_replay_bits_uop_xcpt_pf_if),
    .io_in_4_bits_uop_xcpt_ae_if      (_mshrs_4_io_replay_bits_uop_xcpt_ae_if),
    .io_in_4_bits_uop_xcpt_ma_if      (_mshrs_4_io_replay_bits_uop_xcpt_ma_if),
    .io_in_4_bits_uop_bp_debug_if     (_mshrs_4_io_replay_bits_uop_bp_debug_if),
    .io_in_4_bits_uop_bp_xcpt_if      (_mshrs_4_io_replay_bits_uop_bp_xcpt_if),
    .io_in_4_bits_uop_debug_fsrc      (_mshrs_4_io_replay_bits_uop_debug_fsrc),
    .io_in_4_bits_uop_debug_tsrc      (_mshrs_4_io_replay_bits_uop_debug_tsrc),
    .io_in_4_bits_addr                (_mshrs_4_io_replay_bits_addr),
    .io_in_4_bits_is_hella            (_mshrs_4_io_replay_bits_is_hella),
    .io_in_4_bits_way_en              (_mshrs_4_io_replay_bits_way_en),
    .io_in_4_bits_sdq_id              (_mshrs_4_io_replay_bits_sdq_id),
    .io_in_5_ready                    (_replay_arb_io_in_5_ready),
    .io_in_5_valid                    (_mshrs_5_io_replay_valid),
    .io_in_5_bits_uop_uopc            (_mshrs_5_io_replay_bits_uop_uopc),
    .io_in_5_bits_uop_inst            (_mshrs_5_io_replay_bits_uop_inst),
    .io_in_5_bits_uop_debug_inst      (_mshrs_5_io_replay_bits_uop_debug_inst),
    .io_in_5_bits_uop_is_rvc          (_mshrs_5_io_replay_bits_uop_is_rvc),
    .io_in_5_bits_uop_debug_pc        (_mshrs_5_io_replay_bits_uop_debug_pc),
    .io_in_5_bits_uop_iq_type         (_mshrs_5_io_replay_bits_uop_iq_type),
    .io_in_5_bits_uop_fu_code         (_mshrs_5_io_replay_bits_uop_fu_code),
    .io_in_5_bits_uop_ctrl_br_type    (_mshrs_5_io_replay_bits_uop_ctrl_br_type),
    .io_in_5_bits_uop_ctrl_op1_sel    (_mshrs_5_io_replay_bits_uop_ctrl_op1_sel),
    .io_in_5_bits_uop_ctrl_op2_sel    (_mshrs_5_io_replay_bits_uop_ctrl_op2_sel),
    .io_in_5_bits_uop_ctrl_imm_sel    (_mshrs_5_io_replay_bits_uop_ctrl_imm_sel),
    .io_in_5_bits_uop_ctrl_op_fcn     (_mshrs_5_io_replay_bits_uop_ctrl_op_fcn),
    .io_in_5_bits_uop_ctrl_fcn_dw     (_mshrs_5_io_replay_bits_uop_ctrl_fcn_dw),
    .io_in_5_bits_uop_ctrl_csr_cmd    (_mshrs_5_io_replay_bits_uop_ctrl_csr_cmd),
    .io_in_5_bits_uop_ctrl_is_load    (_mshrs_5_io_replay_bits_uop_ctrl_is_load),
    .io_in_5_bits_uop_ctrl_is_sta     (_mshrs_5_io_replay_bits_uop_ctrl_is_sta),
    .io_in_5_bits_uop_ctrl_is_std     (_mshrs_5_io_replay_bits_uop_ctrl_is_std),
    .io_in_5_bits_uop_iw_state        (_mshrs_5_io_replay_bits_uop_iw_state),
    .io_in_5_bits_uop_iw_p1_poisoned  (_mshrs_5_io_replay_bits_uop_iw_p1_poisoned),
    .io_in_5_bits_uop_iw_p2_poisoned  (_mshrs_5_io_replay_bits_uop_iw_p2_poisoned),
    .io_in_5_bits_uop_is_br           (_mshrs_5_io_replay_bits_uop_is_br),
    .io_in_5_bits_uop_is_jalr         (_mshrs_5_io_replay_bits_uop_is_jalr),
    .io_in_5_bits_uop_is_jal          (_mshrs_5_io_replay_bits_uop_is_jal),
    .io_in_5_bits_uop_is_sfb          (_mshrs_5_io_replay_bits_uop_is_sfb),
    .io_in_5_bits_uop_br_mask         (_mshrs_5_io_replay_bits_uop_br_mask),
    .io_in_5_bits_uop_br_tag          (_mshrs_5_io_replay_bits_uop_br_tag),
    .io_in_5_bits_uop_ftq_idx         (_mshrs_5_io_replay_bits_uop_ftq_idx),
    .io_in_5_bits_uop_edge_inst       (_mshrs_5_io_replay_bits_uop_edge_inst),
    .io_in_5_bits_uop_pc_lob          (_mshrs_5_io_replay_bits_uop_pc_lob),
    .io_in_5_bits_uop_taken           (_mshrs_5_io_replay_bits_uop_taken),
    .io_in_5_bits_uop_imm_packed      (_mshrs_5_io_replay_bits_uop_imm_packed),
    .io_in_5_bits_uop_csr_addr        (_mshrs_5_io_replay_bits_uop_csr_addr),
    .io_in_5_bits_uop_rob_idx         (_mshrs_5_io_replay_bits_uop_rob_idx),
    .io_in_5_bits_uop_ldq_idx         (_mshrs_5_io_replay_bits_uop_ldq_idx),
    .io_in_5_bits_uop_stq_idx         (_mshrs_5_io_replay_bits_uop_stq_idx),
    .io_in_5_bits_uop_rxq_idx         (_mshrs_5_io_replay_bits_uop_rxq_idx),
    .io_in_5_bits_uop_pdst            (_mshrs_5_io_replay_bits_uop_pdst),
    .io_in_5_bits_uop_prs1            (_mshrs_5_io_replay_bits_uop_prs1),
    .io_in_5_bits_uop_prs2            (_mshrs_5_io_replay_bits_uop_prs2),
    .io_in_5_bits_uop_prs3            (_mshrs_5_io_replay_bits_uop_prs3),
    .io_in_5_bits_uop_ppred           (_mshrs_5_io_replay_bits_uop_ppred),
    .io_in_5_bits_uop_prs1_busy       (_mshrs_5_io_replay_bits_uop_prs1_busy),
    .io_in_5_bits_uop_prs2_busy       (_mshrs_5_io_replay_bits_uop_prs2_busy),
    .io_in_5_bits_uop_prs3_busy       (_mshrs_5_io_replay_bits_uop_prs3_busy),
    .io_in_5_bits_uop_ppred_busy      (_mshrs_5_io_replay_bits_uop_ppred_busy),
    .io_in_5_bits_uop_stale_pdst      (_mshrs_5_io_replay_bits_uop_stale_pdst),
    .io_in_5_bits_uop_exception       (_mshrs_5_io_replay_bits_uop_exception),
    .io_in_5_bits_uop_exc_cause       (_mshrs_5_io_replay_bits_uop_exc_cause),
    .io_in_5_bits_uop_bypassable      (_mshrs_5_io_replay_bits_uop_bypassable),
    .io_in_5_bits_uop_mem_cmd         (_mshrs_5_io_replay_bits_uop_mem_cmd),
    .io_in_5_bits_uop_mem_size        (_mshrs_5_io_replay_bits_uop_mem_size),
    .io_in_5_bits_uop_mem_signed      (_mshrs_5_io_replay_bits_uop_mem_signed),
    .io_in_5_bits_uop_is_fence        (_mshrs_5_io_replay_bits_uop_is_fence),
    .io_in_5_bits_uop_is_fencei       (_mshrs_5_io_replay_bits_uop_is_fencei),
    .io_in_5_bits_uop_is_amo          (_mshrs_5_io_replay_bits_uop_is_amo),
    .io_in_5_bits_uop_uses_ldq        (_mshrs_5_io_replay_bits_uop_uses_ldq),
    .io_in_5_bits_uop_uses_stq        (_mshrs_5_io_replay_bits_uop_uses_stq),
    .io_in_5_bits_uop_is_sys_pc2epc   (_mshrs_5_io_replay_bits_uop_is_sys_pc2epc),
    .io_in_5_bits_uop_is_unique       (_mshrs_5_io_replay_bits_uop_is_unique),
    .io_in_5_bits_uop_flush_on_commit (_mshrs_5_io_replay_bits_uop_flush_on_commit),
    .io_in_5_bits_uop_ldst_is_rs1     (_mshrs_5_io_replay_bits_uop_ldst_is_rs1),
    .io_in_5_bits_uop_ldst            (_mshrs_5_io_replay_bits_uop_ldst),
    .io_in_5_bits_uop_lrs1            (_mshrs_5_io_replay_bits_uop_lrs1),
    .io_in_5_bits_uop_lrs2            (_mshrs_5_io_replay_bits_uop_lrs2),
    .io_in_5_bits_uop_lrs3            (_mshrs_5_io_replay_bits_uop_lrs3),
    .io_in_5_bits_uop_ldst_val        (_mshrs_5_io_replay_bits_uop_ldst_val),
    .io_in_5_bits_uop_dst_rtype       (_mshrs_5_io_replay_bits_uop_dst_rtype),
    .io_in_5_bits_uop_lrs1_rtype      (_mshrs_5_io_replay_bits_uop_lrs1_rtype),
    .io_in_5_bits_uop_lrs2_rtype      (_mshrs_5_io_replay_bits_uop_lrs2_rtype),
    .io_in_5_bits_uop_frs3_en         (_mshrs_5_io_replay_bits_uop_frs3_en),
    .io_in_5_bits_uop_fp_val          (_mshrs_5_io_replay_bits_uop_fp_val),
    .io_in_5_bits_uop_fp_single       (_mshrs_5_io_replay_bits_uop_fp_single),
    .io_in_5_bits_uop_xcpt_pf_if      (_mshrs_5_io_replay_bits_uop_xcpt_pf_if),
    .io_in_5_bits_uop_xcpt_ae_if      (_mshrs_5_io_replay_bits_uop_xcpt_ae_if),
    .io_in_5_bits_uop_xcpt_ma_if      (_mshrs_5_io_replay_bits_uop_xcpt_ma_if),
    .io_in_5_bits_uop_bp_debug_if     (_mshrs_5_io_replay_bits_uop_bp_debug_if),
    .io_in_5_bits_uop_bp_xcpt_if      (_mshrs_5_io_replay_bits_uop_bp_xcpt_if),
    .io_in_5_bits_uop_debug_fsrc      (_mshrs_5_io_replay_bits_uop_debug_fsrc),
    .io_in_5_bits_uop_debug_tsrc      (_mshrs_5_io_replay_bits_uop_debug_tsrc),
    .io_in_5_bits_addr                (_mshrs_5_io_replay_bits_addr),
    .io_in_5_bits_is_hella            (_mshrs_5_io_replay_bits_is_hella),
    .io_in_5_bits_way_en              (_mshrs_5_io_replay_bits_way_en),
    .io_in_5_bits_sdq_id              (_mshrs_5_io_replay_bits_sdq_id),
    .io_in_6_ready                    (_replay_arb_io_in_6_ready),
    .io_in_6_valid                    (_mshrs_6_io_replay_valid),
    .io_in_6_bits_uop_uopc            (_mshrs_6_io_replay_bits_uop_uopc),
    .io_in_6_bits_uop_inst            (_mshrs_6_io_replay_bits_uop_inst),
    .io_in_6_bits_uop_debug_inst      (_mshrs_6_io_replay_bits_uop_debug_inst),
    .io_in_6_bits_uop_is_rvc          (_mshrs_6_io_replay_bits_uop_is_rvc),
    .io_in_6_bits_uop_debug_pc        (_mshrs_6_io_replay_bits_uop_debug_pc),
    .io_in_6_bits_uop_iq_type         (_mshrs_6_io_replay_bits_uop_iq_type),
    .io_in_6_bits_uop_fu_code         (_mshrs_6_io_replay_bits_uop_fu_code),
    .io_in_6_bits_uop_ctrl_br_type    (_mshrs_6_io_replay_bits_uop_ctrl_br_type),
    .io_in_6_bits_uop_ctrl_op1_sel    (_mshrs_6_io_replay_bits_uop_ctrl_op1_sel),
    .io_in_6_bits_uop_ctrl_op2_sel    (_mshrs_6_io_replay_bits_uop_ctrl_op2_sel),
    .io_in_6_bits_uop_ctrl_imm_sel    (_mshrs_6_io_replay_bits_uop_ctrl_imm_sel),
    .io_in_6_bits_uop_ctrl_op_fcn     (_mshrs_6_io_replay_bits_uop_ctrl_op_fcn),
    .io_in_6_bits_uop_ctrl_fcn_dw     (_mshrs_6_io_replay_bits_uop_ctrl_fcn_dw),
    .io_in_6_bits_uop_ctrl_csr_cmd    (_mshrs_6_io_replay_bits_uop_ctrl_csr_cmd),
    .io_in_6_bits_uop_ctrl_is_load    (_mshrs_6_io_replay_bits_uop_ctrl_is_load),
    .io_in_6_bits_uop_ctrl_is_sta     (_mshrs_6_io_replay_bits_uop_ctrl_is_sta),
    .io_in_6_bits_uop_ctrl_is_std     (_mshrs_6_io_replay_bits_uop_ctrl_is_std),
    .io_in_6_bits_uop_iw_state        (_mshrs_6_io_replay_bits_uop_iw_state),
    .io_in_6_bits_uop_iw_p1_poisoned  (_mshrs_6_io_replay_bits_uop_iw_p1_poisoned),
    .io_in_6_bits_uop_iw_p2_poisoned  (_mshrs_6_io_replay_bits_uop_iw_p2_poisoned),
    .io_in_6_bits_uop_is_br           (_mshrs_6_io_replay_bits_uop_is_br),
    .io_in_6_bits_uop_is_jalr         (_mshrs_6_io_replay_bits_uop_is_jalr),
    .io_in_6_bits_uop_is_jal          (_mshrs_6_io_replay_bits_uop_is_jal),
    .io_in_6_bits_uop_is_sfb          (_mshrs_6_io_replay_bits_uop_is_sfb),
    .io_in_6_bits_uop_br_mask         (_mshrs_6_io_replay_bits_uop_br_mask),
    .io_in_6_bits_uop_br_tag          (_mshrs_6_io_replay_bits_uop_br_tag),
    .io_in_6_bits_uop_ftq_idx         (_mshrs_6_io_replay_bits_uop_ftq_idx),
    .io_in_6_bits_uop_edge_inst       (_mshrs_6_io_replay_bits_uop_edge_inst),
    .io_in_6_bits_uop_pc_lob          (_mshrs_6_io_replay_bits_uop_pc_lob),
    .io_in_6_bits_uop_taken           (_mshrs_6_io_replay_bits_uop_taken),
    .io_in_6_bits_uop_imm_packed      (_mshrs_6_io_replay_bits_uop_imm_packed),
    .io_in_6_bits_uop_csr_addr        (_mshrs_6_io_replay_bits_uop_csr_addr),
    .io_in_6_bits_uop_rob_idx         (_mshrs_6_io_replay_bits_uop_rob_idx),
    .io_in_6_bits_uop_ldq_idx         (_mshrs_6_io_replay_bits_uop_ldq_idx),
    .io_in_6_bits_uop_stq_idx         (_mshrs_6_io_replay_bits_uop_stq_idx),
    .io_in_6_bits_uop_rxq_idx         (_mshrs_6_io_replay_bits_uop_rxq_idx),
    .io_in_6_bits_uop_pdst            (_mshrs_6_io_replay_bits_uop_pdst),
    .io_in_6_bits_uop_prs1            (_mshrs_6_io_replay_bits_uop_prs1),
    .io_in_6_bits_uop_prs2            (_mshrs_6_io_replay_bits_uop_prs2),
    .io_in_6_bits_uop_prs3            (_mshrs_6_io_replay_bits_uop_prs3),
    .io_in_6_bits_uop_ppred           (_mshrs_6_io_replay_bits_uop_ppred),
    .io_in_6_bits_uop_prs1_busy       (_mshrs_6_io_replay_bits_uop_prs1_busy),
    .io_in_6_bits_uop_prs2_busy       (_mshrs_6_io_replay_bits_uop_prs2_busy),
    .io_in_6_bits_uop_prs3_busy       (_mshrs_6_io_replay_bits_uop_prs3_busy),
    .io_in_6_bits_uop_ppred_busy      (_mshrs_6_io_replay_bits_uop_ppred_busy),
    .io_in_6_bits_uop_stale_pdst      (_mshrs_6_io_replay_bits_uop_stale_pdst),
    .io_in_6_bits_uop_exception       (_mshrs_6_io_replay_bits_uop_exception),
    .io_in_6_bits_uop_exc_cause       (_mshrs_6_io_replay_bits_uop_exc_cause),
    .io_in_6_bits_uop_bypassable      (_mshrs_6_io_replay_bits_uop_bypassable),
    .io_in_6_bits_uop_mem_cmd         (_mshrs_6_io_replay_bits_uop_mem_cmd),
    .io_in_6_bits_uop_mem_size        (_mshrs_6_io_replay_bits_uop_mem_size),
    .io_in_6_bits_uop_mem_signed      (_mshrs_6_io_replay_bits_uop_mem_signed),
    .io_in_6_bits_uop_is_fence        (_mshrs_6_io_replay_bits_uop_is_fence),
    .io_in_6_bits_uop_is_fencei       (_mshrs_6_io_replay_bits_uop_is_fencei),
    .io_in_6_bits_uop_is_amo          (_mshrs_6_io_replay_bits_uop_is_amo),
    .io_in_6_bits_uop_uses_ldq        (_mshrs_6_io_replay_bits_uop_uses_ldq),
    .io_in_6_bits_uop_uses_stq        (_mshrs_6_io_replay_bits_uop_uses_stq),
    .io_in_6_bits_uop_is_sys_pc2epc   (_mshrs_6_io_replay_bits_uop_is_sys_pc2epc),
    .io_in_6_bits_uop_is_unique       (_mshrs_6_io_replay_bits_uop_is_unique),
    .io_in_6_bits_uop_flush_on_commit (_mshrs_6_io_replay_bits_uop_flush_on_commit),
    .io_in_6_bits_uop_ldst_is_rs1     (_mshrs_6_io_replay_bits_uop_ldst_is_rs1),
    .io_in_6_bits_uop_ldst            (_mshrs_6_io_replay_bits_uop_ldst),
    .io_in_6_bits_uop_lrs1            (_mshrs_6_io_replay_bits_uop_lrs1),
    .io_in_6_bits_uop_lrs2            (_mshrs_6_io_replay_bits_uop_lrs2),
    .io_in_6_bits_uop_lrs3            (_mshrs_6_io_replay_bits_uop_lrs3),
    .io_in_6_bits_uop_ldst_val        (_mshrs_6_io_replay_bits_uop_ldst_val),
    .io_in_6_bits_uop_dst_rtype       (_mshrs_6_io_replay_bits_uop_dst_rtype),
    .io_in_6_bits_uop_lrs1_rtype      (_mshrs_6_io_replay_bits_uop_lrs1_rtype),
    .io_in_6_bits_uop_lrs2_rtype      (_mshrs_6_io_replay_bits_uop_lrs2_rtype),
    .io_in_6_bits_uop_frs3_en         (_mshrs_6_io_replay_bits_uop_frs3_en),
    .io_in_6_bits_uop_fp_val          (_mshrs_6_io_replay_bits_uop_fp_val),
    .io_in_6_bits_uop_fp_single       (_mshrs_6_io_replay_bits_uop_fp_single),
    .io_in_6_bits_uop_xcpt_pf_if      (_mshrs_6_io_replay_bits_uop_xcpt_pf_if),
    .io_in_6_bits_uop_xcpt_ae_if      (_mshrs_6_io_replay_bits_uop_xcpt_ae_if),
    .io_in_6_bits_uop_xcpt_ma_if      (_mshrs_6_io_replay_bits_uop_xcpt_ma_if),
    .io_in_6_bits_uop_bp_debug_if     (_mshrs_6_io_replay_bits_uop_bp_debug_if),
    .io_in_6_bits_uop_bp_xcpt_if      (_mshrs_6_io_replay_bits_uop_bp_xcpt_if),
    .io_in_6_bits_uop_debug_fsrc      (_mshrs_6_io_replay_bits_uop_debug_fsrc),
    .io_in_6_bits_uop_debug_tsrc      (_mshrs_6_io_replay_bits_uop_debug_tsrc),
    .io_in_6_bits_addr                (_mshrs_6_io_replay_bits_addr),
    .io_in_6_bits_is_hella            (_mshrs_6_io_replay_bits_is_hella),
    .io_in_6_bits_way_en              (_mshrs_6_io_replay_bits_way_en),
    .io_in_6_bits_sdq_id              (_mshrs_6_io_replay_bits_sdq_id),
    .io_in_7_ready                    (_replay_arb_io_in_7_ready),
    .io_in_7_valid                    (_mshrs_7_io_replay_valid),
    .io_in_7_bits_uop_uopc            (_mshrs_7_io_replay_bits_uop_uopc),
    .io_in_7_bits_uop_inst            (_mshrs_7_io_replay_bits_uop_inst),
    .io_in_7_bits_uop_debug_inst      (_mshrs_7_io_replay_bits_uop_debug_inst),
    .io_in_7_bits_uop_is_rvc          (_mshrs_7_io_replay_bits_uop_is_rvc),
    .io_in_7_bits_uop_debug_pc        (_mshrs_7_io_replay_bits_uop_debug_pc),
    .io_in_7_bits_uop_iq_type         (_mshrs_7_io_replay_bits_uop_iq_type),
    .io_in_7_bits_uop_fu_code         (_mshrs_7_io_replay_bits_uop_fu_code),
    .io_in_7_bits_uop_ctrl_br_type    (_mshrs_7_io_replay_bits_uop_ctrl_br_type),
    .io_in_7_bits_uop_ctrl_op1_sel    (_mshrs_7_io_replay_bits_uop_ctrl_op1_sel),
    .io_in_7_bits_uop_ctrl_op2_sel    (_mshrs_7_io_replay_bits_uop_ctrl_op2_sel),
    .io_in_7_bits_uop_ctrl_imm_sel    (_mshrs_7_io_replay_bits_uop_ctrl_imm_sel),
    .io_in_7_bits_uop_ctrl_op_fcn     (_mshrs_7_io_replay_bits_uop_ctrl_op_fcn),
    .io_in_7_bits_uop_ctrl_fcn_dw     (_mshrs_7_io_replay_bits_uop_ctrl_fcn_dw),
    .io_in_7_bits_uop_ctrl_csr_cmd    (_mshrs_7_io_replay_bits_uop_ctrl_csr_cmd),
    .io_in_7_bits_uop_ctrl_is_load    (_mshrs_7_io_replay_bits_uop_ctrl_is_load),
    .io_in_7_bits_uop_ctrl_is_sta     (_mshrs_7_io_replay_bits_uop_ctrl_is_sta),
    .io_in_7_bits_uop_ctrl_is_std     (_mshrs_7_io_replay_bits_uop_ctrl_is_std),
    .io_in_7_bits_uop_iw_state        (_mshrs_7_io_replay_bits_uop_iw_state),
    .io_in_7_bits_uop_iw_p1_poisoned  (_mshrs_7_io_replay_bits_uop_iw_p1_poisoned),
    .io_in_7_bits_uop_iw_p2_poisoned  (_mshrs_7_io_replay_bits_uop_iw_p2_poisoned),
    .io_in_7_bits_uop_is_br           (_mshrs_7_io_replay_bits_uop_is_br),
    .io_in_7_bits_uop_is_jalr         (_mshrs_7_io_replay_bits_uop_is_jalr),
    .io_in_7_bits_uop_is_jal          (_mshrs_7_io_replay_bits_uop_is_jal),
    .io_in_7_bits_uop_is_sfb          (_mshrs_7_io_replay_bits_uop_is_sfb),
    .io_in_7_bits_uop_br_mask         (_mshrs_7_io_replay_bits_uop_br_mask),
    .io_in_7_bits_uop_br_tag          (_mshrs_7_io_replay_bits_uop_br_tag),
    .io_in_7_bits_uop_ftq_idx         (_mshrs_7_io_replay_bits_uop_ftq_idx),
    .io_in_7_bits_uop_edge_inst       (_mshrs_7_io_replay_bits_uop_edge_inst),
    .io_in_7_bits_uop_pc_lob          (_mshrs_7_io_replay_bits_uop_pc_lob),
    .io_in_7_bits_uop_taken           (_mshrs_7_io_replay_bits_uop_taken),
    .io_in_7_bits_uop_imm_packed      (_mshrs_7_io_replay_bits_uop_imm_packed),
    .io_in_7_bits_uop_csr_addr        (_mshrs_7_io_replay_bits_uop_csr_addr),
    .io_in_7_bits_uop_rob_idx         (_mshrs_7_io_replay_bits_uop_rob_idx),
    .io_in_7_bits_uop_ldq_idx         (_mshrs_7_io_replay_bits_uop_ldq_idx),
    .io_in_7_bits_uop_stq_idx         (_mshrs_7_io_replay_bits_uop_stq_idx),
    .io_in_7_bits_uop_rxq_idx         (_mshrs_7_io_replay_bits_uop_rxq_idx),
    .io_in_7_bits_uop_pdst            (_mshrs_7_io_replay_bits_uop_pdst),
    .io_in_7_bits_uop_prs1            (_mshrs_7_io_replay_bits_uop_prs1),
    .io_in_7_bits_uop_prs2            (_mshrs_7_io_replay_bits_uop_prs2),
    .io_in_7_bits_uop_prs3            (_mshrs_7_io_replay_bits_uop_prs3),
    .io_in_7_bits_uop_ppred           (_mshrs_7_io_replay_bits_uop_ppred),
    .io_in_7_bits_uop_prs1_busy       (_mshrs_7_io_replay_bits_uop_prs1_busy),
    .io_in_7_bits_uop_prs2_busy       (_mshrs_7_io_replay_bits_uop_prs2_busy),
    .io_in_7_bits_uop_prs3_busy       (_mshrs_7_io_replay_bits_uop_prs3_busy),
    .io_in_7_bits_uop_ppred_busy      (_mshrs_7_io_replay_bits_uop_ppred_busy),
    .io_in_7_bits_uop_stale_pdst      (_mshrs_7_io_replay_bits_uop_stale_pdst),
    .io_in_7_bits_uop_exception       (_mshrs_7_io_replay_bits_uop_exception),
    .io_in_7_bits_uop_exc_cause       (_mshrs_7_io_replay_bits_uop_exc_cause),
    .io_in_7_bits_uop_bypassable      (_mshrs_7_io_replay_bits_uop_bypassable),
    .io_in_7_bits_uop_mem_cmd         (_mshrs_7_io_replay_bits_uop_mem_cmd),
    .io_in_7_bits_uop_mem_size        (_mshrs_7_io_replay_bits_uop_mem_size),
    .io_in_7_bits_uop_mem_signed      (_mshrs_7_io_replay_bits_uop_mem_signed),
    .io_in_7_bits_uop_is_fence        (_mshrs_7_io_replay_bits_uop_is_fence),
    .io_in_7_bits_uop_is_fencei       (_mshrs_7_io_replay_bits_uop_is_fencei),
    .io_in_7_bits_uop_is_amo          (_mshrs_7_io_replay_bits_uop_is_amo),
    .io_in_7_bits_uop_uses_ldq        (_mshrs_7_io_replay_bits_uop_uses_ldq),
    .io_in_7_bits_uop_uses_stq        (_mshrs_7_io_replay_bits_uop_uses_stq),
    .io_in_7_bits_uop_is_sys_pc2epc   (_mshrs_7_io_replay_bits_uop_is_sys_pc2epc),
    .io_in_7_bits_uop_is_unique       (_mshrs_7_io_replay_bits_uop_is_unique),
    .io_in_7_bits_uop_flush_on_commit (_mshrs_7_io_replay_bits_uop_flush_on_commit),
    .io_in_7_bits_uop_ldst_is_rs1     (_mshrs_7_io_replay_bits_uop_ldst_is_rs1),
    .io_in_7_bits_uop_ldst            (_mshrs_7_io_replay_bits_uop_ldst),
    .io_in_7_bits_uop_lrs1            (_mshrs_7_io_replay_bits_uop_lrs1),
    .io_in_7_bits_uop_lrs2            (_mshrs_7_io_replay_bits_uop_lrs2),
    .io_in_7_bits_uop_lrs3            (_mshrs_7_io_replay_bits_uop_lrs3),
    .io_in_7_bits_uop_ldst_val        (_mshrs_7_io_replay_bits_uop_ldst_val),
    .io_in_7_bits_uop_dst_rtype       (_mshrs_7_io_replay_bits_uop_dst_rtype),
    .io_in_7_bits_uop_lrs1_rtype      (_mshrs_7_io_replay_bits_uop_lrs1_rtype),
    .io_in_7_bits_uop_lrs2_rtype      (_mshrs_7_io_replay_bits_uop_lrs2_rtype),
    .io_in_7_bits_uop_frs3_en         (_mshrs_7_io_replay_bits_uop_frs3_en),
    .io_in_7_bits_uop_fp_val          (_mshrs_7_io_replay_bits_uop_fp_val),
    .io_in_7_bits_uop_fp_single       (_mshrs_7_io_replay_bits_uop_fp_single),
    .io_in_7_bits_uop_xcpt_pf_if      (_mshrs_7_io_replay_bits_uop_xcpt_pf_if),
    .io_in_7_bits_uop_xcpt_ae_if      (_mshrs_7_io_replay_bits_uop_xcpt_ae_if),
    .io_in_7_bits_uop_xcpt_ma_if      (_mshrs_7_io_replay_bits_uop_xcpt_ma_if),
    .io_in_7_bits_uop_bp_debug_if     (_mshrs_7_io_replay_bits_uop_bp_debug_if),
    .io_in_7_bits_uop_bp_xcpt_if      (_mshrs_7_io_replay_bits_uop_bp_xcpt_if),
    .io_in_7_bits_uop_debug_fsrc      (_mshrs_7_io_replay_bits_uop_debug_fsrc),
    .io_in_7_bits_uop_debug_tsrc      (_mshrs_7_io_replay_bits_uop_debug_tsrc),
    .io_in_7_bits_addr                (_mshrs_7_io_replay_bits_addr),
    .io_in_7_bits_is_hella            (_mshrs_7_io_replay_bits_is_hella),
    .io_in_7_bits_way_en              (_mshrs_7_io_replay_bits_way_en),
    .io_in_7_bits_sdq_id              (_mshrs_7_io_replay_bits_sdq_id),
    .io_out_ready                     (io_replay_ready),
    .io_out_valid                     (_replay_arb_io_out_valid),
    .io_out_bits_uop_uopc             (io_replay_bits_uop_uopc),
    .io_out_bits_uop_inst             (io_replay_bits_uop_inst),
    .io_out_bits_uop_debug_inst       (io_replay_bits_uop_debug_inst),
    .io_out_bits_uop_is_rvc           (io_replay_bits_uop_is_rvc),
    .io_out_bits_uop_debug_pc         (io_replay_bits_uop_debug_pc),
    .io_out_bits_uop_iq_type          (io_replay_bits_uop_iq_type),
    .io_out_bits_uop_fu_code          (io_replay_bits_uop_fu_code),
    .io_out_bits_uop_ctrl_br_type     (io_replay_bits_uop_ctrl_br_type),
    .io_out_bits_uop_ctrl_op1_sel     (io_replay_bits_uop_ctrl_op1_sel),
    .io_out_bits_uop_ctrl_op2_sel     (io_replay_bits_uop_ctrl_op2_sel),
    .io_out_bits_uop_ctrl_imm_sel     (io_replay_bits_uop_ctrl_imm_sel),
    .io_out_bits_uop_ctrl_op_fcn      (io_replay_bits_uop_ctrl_op_fcn),
    .io_out_bits_uop_ctrl_fcn_dw      (io_replay_bits_uop_ctrl_fcn_dw),
    .io_out_bits_uop_ctrl_csr_cmd     (io_replay_bits_uop_ctrl_csr_cmd),
    .io_out_bits_uop_ctrl_is_load     (io_replay_bits_uop_ctrl_is_load),
    .io_out_bits_uop_ctrl_is_sta      (io_replay_bits_uop_ctrl_is_sta),
    .io_out_bits_uop_ctrl_is_std      (io_replay_bits_uop_ctrl_is_std),
    .io_out_bits_uop_iw_state         (io_replay_bits_uop_iw_state),
    .io_out_bits_uop_iw_p1_poisoned   (io_replay_bits_uop_iw_p1_poisoned),
    .io_out_bits_uop_iw_p2_poisoned   (io_replay_bits_uop_iw_p2_poisoned),
    .io_out_bits_uop_is_br            (io_replay_bits_uop_is_br),
    .io_out_bits_uop_is_jalr          (io_replay_bits_uop_is_jalr),
    .io_out_bits_uop_is_jal           (io_replay_bits_uop_is_jal),
    .io_out_bits_uop_is_sfb           (io_replay_bits_uop_is_sfb),
    .io_out_bits_uop_br_mask          (io_replay_bits_uop_br_mask),
    .io_out_bits_uop_br_tag           (io_replay_bits_uop_br_tag),
    .io_out_bits_uop_ftq_idx          (io_replay_bits_uop_ftq_idx),
    .io_out_bits_uop_edge_inst        (io_replay_bits_uop_edge_inst),
    .io_out_bits_uop_pc_lob           (io_replay_bits_uop_pc_lob),
    .io_out_bits_uop_taken            (io_replay_bits_uop_taken),
    .io_out_bits_uop_imm_packed       (io_replay_bits_uop_imm_packed),
    .io_out_bits_uop_csr_addr         (io_replay_bits_uop_csr_addr),
    .io_out_bits_uop_rob_idx          (io_replay_bits_uop_rob_idx),
    .io_out_bits_uop_ldq_idx          (io_replay_bits_uop_ldq_idx),
    .io_out_bits_uop_stq_idx          (io_replay_bits_uop_stq_idx),
    .io_out_bits_uop_rxq_idx          (io_replay_bits_uop_rxq_idx),
    .io_out_bits_uop_pdst             (io_replay_bits_uop_pdst),
    .io_out_bits_uop_prs1             (io_replay_bits_uop_prs1),
    .io_out_bits_uop_prs2             (io_replay_bits_uop_prs2),
    .io_out_bits_uop_prs3             (io_replay_bits_uop_prs3),
    .io_out_bits_uop_ppred            (io_replay_bits_uop_ppred),
    .io_out_bits_uop_prs1_busy        (io_replay_bits_uop_prs1_busy),
    .io_out_bits_uop_prs2_busy        (io_replay_bits_uop_prs2_busy),
    .io_out_bits_uop_prs3_busy        (io_replay_bits_uop_prs3_busy),
    .io_out_bits_uop_ppred_busy       (io_replay_bits_uop_ppred_busy),
    .io_out_bits_uop_stale_pdst       (io_replay_bits_uop_stale_pdst),
    .io_out_bits_uop_exception        (io_replay_bits_uop_exception),
    .io_out_bits_uop_exc_cause        (io_replay_bits_uop_exc_cause),
    .io_out_bits_uop_bypassable       (io_replay_bits_uop_bypassable),
    .io_out_bits_uop_mem_cmd          (_replay_arb_io_out_bits_uop_mem_cmd),
    .io_out_bits_uop_mem_size         (io_replay_bits_uop_mem_size),
    .io_out_bits_uop_mem_signed       (io_replay_bits_uop_mem_signed),
    .io_out_bits_uop_is_fence         (io_replay_bits_uop_is_fence),
    .io_out_bits_uop_is_fencei        (io_replay_bits_uop_is_fencei),
    .io_out_bits_uop_is_amo           (io_replay_bits_uop_is_amo),
    .io_out_bits_uop_uses_ldq         (io_replay_bits_uop_uses_ldq),
    .io_out_bits_uop_uses_stq         (io_replay_bits_uop_uses_stq),
    .io_out_bits_uop_is_sys_pc2epc    (io_replay_bits_uop_is_sys_pc2epc),
    .io_out_bits_uop_is_unique        (io_replay_bits_uop_is_unique),
    .io_out_bits_uop_flush_on_commit  (io_replay_bits_uop_flush_on_commit),
    .io_out_bits_uop_ldst_is_rs1      (io_replay_bits_uop_ldst_is_rs1),
    .io_out_bits_uop_ldst             (io_replay_bits_uop_ldst),
    .io_out_bits_uop_lrs1             (io_replay_bits_uop_lrs1),
    .io_out_bits_uop_lrs2             (io_replay_bits_uop_lrs2),
    .io_out_bits_uop_lrs3             (io_replay_bits_uop_lrs3),
    .io_out_bits_uop_ldst_val         (io_replay_bits_uop_ldst_val),
    .io_out_bits_uop_dst_rtype        (io_replay_bits_uop_dst_rtype),
    .io_out_bits_uop_lrs1_rtype       (io_replay_bits_uop_lrs1_rtype),
    .io_out_bits_uop_lrs2_rtype       (io_replay_bits_uop_lrs2_rtype),
    .io_out_bits_uop_frs3_en          (io_replay_bits_uop_frs3_en),
    .io_out_bits_uop_fp_val           (io_replay_bits_uop_fp_val),
    .io_out_bits_uop_fp_single        (io_replay_bits_uop_fp_single),
    .io_out_bits_uop_xcpt_pf_if       (io_replay_bits_uop_xcpt_pf_if),
    .io_out_bits_uop_xcpt_ae_if       (io_replay_bits_uop_xcpt_ae_if),
    .io_out_bits_uop_xcpt_ma_if       (io_replay_bits_uop_xcpt_ma_if),
    .io_out_bits_uop_bp_debug_if      (io_replay_bits_uop_bp_debug_if),
    .io_out_bits_uop_bp_xcpt_if       (io_replay_bits_uop_bp_xcpt_if),
    .io_out_bits_uop_debug_fsrc       (io_replay_bits_uop_debug_fsrc),
    .io_out_bits_uop_debug_tsrc       (io_replay_bits_uop_debug_tsrc),
    .io_out_bits_addr                 (io_replay_bits_addr),
    .io_out_bits_is_hella             (io_replay_bits_is_hella),
    .io_out_bits_way_en               (io_replay_bits_way_en),
    .io_out_bits_sdq_id               (_replay_arb_io_out_bits_sdq_id)
  );
  Arbiter_6 resp_arb (
    .io_in_0_ready                    (_resp_arb_io_in_0_ready),
    .io_in_0_valid                    (_mshrs_0_io_resp_valid),
    .io_in_0_bits_uop_uopc            (_mshrs_0_io_resp_bits_uop_uopc),
    .io_in_0_bits_uop_inst            (_mshrs_0_io_resp_bits_uop_inst),
    .io_in_0_bits_uop_debug_inst      (_mshrs_0_io_resp_bits_uop_debug_inst),
    .io_in_0_bits_uop_is_rvc          (_mshrs_0_io_resp_bits_uop_is_rvc),
    .io_in_0_bits_uop_debug_pc        (_mshrs_0_io_resp_bits_uop_debug_pc),
    .io_in_0_bits_uop_iq_type         (_mshrs_0_io_resp_bits_uop_iq_type),
    .io_in_0_bits_uop_fu_code         (_mshrs_0_io_resp_bits_uop_fu_code),
    .io_in_0_bits_uop_ctrl_br_type    (_mshrs_0_io_resp_bits_uop_ctrl_br_type),
    .io_in_0_bits_uop_ctrl_op1_sel    (_mshrs_0_io_resp_bits_uop_ctrl_op1_sel),
    .io_in_0_bits_uop_ctrl_op2_sel    (_mshrs_0_io_resp_bits_uop_ctrl_op2_sel),
    .io_in_0_bits_uop_ctrl_imm_sel    (_mshrs_0_io_resp_bits_uop_ctrl_imm_sel),
    .io_in_0_bits_uop_ctrl_op_fcn     (_mshrs_0_io_resp_bits_uop_ctrl_op_fcn),
    .io_in_0_bits_uop_ctrl_fcn_dw     (_mshrs_0_io_resp_bits_uop_ctrl_fcn_dw),
    .io_in_0_bits_uop_ctrl_csr_cmd    (_mshrs_0_io_resp_bits_uop_ctrl_csr_cmd),
    .io_in_0_bits_uop_ctrl_is_load    (_mshrs_0_io_resp_bits_uop_ctrl_is_load),
    .io_in_0_bits_uop_ctrl_is_sta     (_mshrs_0_io_resp_bits_uop_ctrl_is_sta),
    .io_in_0_bits_uop_ctrl_is_std     (_mshrs_0_io_resp_bits_uop_ctrl_is_std),
    .io_in_0_bits_uop_iw_state        (_mshrs_0_io_resp_bits_uop_iw_state),
    .io_in_0_bits_uop_iw_p1_poisoned  (_mshrs_0_io_resp_bits_uop_iw_p1_poisoned),
    .io_in_0_bits_uop_iw_p2_poisoned  (_mshrs_0_io_resp_bits_uop_iw_p2_poisoned),
    .io_in_0_bits_uop_is_br           (_mshrs_0_io_resp_bits_uop_is_br),
    .io_in_0_bits_uop_is_jalr         (_mshrs_0_io_resp_bits_uop_is_jalr),
    .io_in_0_bits_uop_is_jal          (_mshrs_0_io_resp_bits_uop_is_jal),
    .io_in_0_bits_uop_is_sfb          (_mshrs_0_io_resp_bits_uop_is_sfb),
    .io_in_0_bits_uop_br_mask         (_mshrs_0_io_resp_bits_uop_br_mask),
    .io_in_0_bits_uop_br_tag          (_mshrs_0_io_resp_bits_uop_br_tag),
    .io_in_0_bits_uop_ftq_idx         (_mshrs_0_io_resp_bits_uop_ftq_idx),
    .io_in_0_bits_uop_edge_inst       (_mshrs_0_io_resp_bits_uop_edge_inst),
    .io_in_0_bits_uop_pc_lob          (_mshrs_0_io_resp_bits_uop_pc_lob),
    .io_in_0_bits_uop_taken           (_mshrs_0_io_resp_bits_uop_taken),
    .io_in_0_bits_uop_imm_packed      (_mshrs_0_io_resp_bits_uop_imm_packed),
    .io_in_0_bits_uop_csr_addr        (_mshrs_0_io_resp_bits_uop_csr_addr),
    .io_in_0_bits_uop_rob_idx         (_mshrs_0_io_resp_bits_uop_rob_idx),
    .io_in_0_bits_uop_ldq_idx         (_mshrs_0_io_resp_bits_uop_ldq_idx),
    .io_in_0_bits_uop_stq_idx         (_mshrs_0_io_resp_bits_uop_stq_idx),
    .io_in_0_bits_uop_rxq_idx         (_mshrs_0_io_resp_bits_uop_rxq_idx),
    .io_in_0_bits_uop_pdst            (_mshrs_0_io_resp_bits_uop_pdst),
    .io_in_0_bits_uop_prs1            (_mshrs_0_io_resp_bits_uop_prs1),
    .io_in_0_bits_uop_prs2            (_mshrs_0_io_resp_bits_uop_prs2),
    .io_in_0_bits_uop_prs3            (_mshrs_0_io_resp_bits_uop_prs3),
    .io_in_0_bits_uop_ppred           (_mshrs_0_io_resp_bits_uop_ppred),
    .io_in_0_bits_uop_prs1_busy       (_mshrs_0_io_resp_bits_uop_prs1_busy),
    .io_in_0_bits_uop_prs2_busy       (_mshrs_0_io_resp_bits_uop_prs2_busy),
    .io_in_0_bits_uop_prs3_busy       (_mshrs_0_io_resp_bits_uop_prs3_busy),
    .io_in_0_bits_uop_ppred_busy      (_mshrs_0_io_resp_bits_uop_ppred_busy),
    .io_in_0_bits_uop_stale_pdst      (_mshrs_0_io_resp_bits_uop_stale_pdst),
    .io_in_0_bits_uop_exception       (_mshrs_0_io_resp_bits_uop_exception),
    .io_in_0_bits_uop_exc_cause       (_mshrs_0_io_resp_bits_uop_exc_cause),
    .io_in_0_bits_uop_bypassable      (_mshrs_0_io_resp_bits_uop_bypassable),
    .io_in_0_bits_uop_mem_cmd         (_mshrs_0_io_resp_bits_uop_mem_cmd),
    .io_in_0_bits_uop_mem_size        (_mshrs_0_io_resp_bits_uop_mem_size),
    .io_in_0_bits_uop_mem_signed      (_mshrs_0_io_resp_bits_uop_mem_signed),
    .io_in_0_bits_uop_is_fence        (_mshrs_0_io_resp_bits_uop_is_fence),
    .io_in_0_bits_uop_is_fencei       (_mshrs_0_io_resp_bits_uop_is_fencei),
    .io_in_0_bits_uop_is_amo          (_mshrs_0_io_resp_bits_uop_is_amo),
    .io_in_0_bits_uop_uses_ldq        (_mshrs_0_io_resp_bits_uop_uses_ldq),
    .io_in_0_bits_uop_uses_stq        (_mshrs_0_io_resp_bits_uop_uses_stq),
    .io_in_0_bits_uop_is_sys_pc2epc   (_mshrs_0_io_resp_bits_uop_is_sys_pc2epc),
    .io_in_0_bits_uop_is_unique       (_mshrs_0_io_resp_bits_uop_is_unique),
    .io_in_0_bits_uop_flush_on_commit (_mshrs_0_io_resp_bits_uop_flush_on_commit),
    .io_in_0_bits_uop_ldst_is_rs1     (_mshrs_0_io_resp_bits_uop_ldst_is_rs1),
    .io_in_0_bits_uop_ldst            (_mshrs_0_io_resp_bits_uop_ldst),
    .io_in_0_bits_uop_lrs1            (_mshrs_0_io_resp_bits_uop_lrs1),
    .io_in_0_bits_uop_lrs2            (_mshrs_0_io_resp_bits_uop_lrs2),
    .io_in_0_bits_uop_lrs3            (_mshrs_0_io_resp_bits_uop_lrs3),
    .io_in_0_bits_uop_ldst_val        (_mshrs_0_io_resp_bits_uop_ldst_val),
    .io_in_0_bits_uop_dst_rtype       (_mshrs_0_io_resp_bits_uop_dst_rtype),
    .io_in_0_bits_uop_lrs1_rtype      (_mshrs_0_io_resp_bits_uop_lrs1_rtype),
    .io_in_0_bits_uop_lrs2_rtype      (_mshrs_0_io_resp_bits_uop_lrs2_rtype),
    .io_in_0_bits_uop_frs3_en         (_mshrs_0_io_resp_bits_uop_frs3_en),
    .io_in_0_bits_uop_fp_val          (_mshrs_0_io_resp_bits_uop_fp_val),
    .io_in_0_bits_uop_fp_single       (_mshrs_0_io_resp_bits_uop_fp_single),
    .io_in_0_bits_uop_xcpt_pf_if      (_mshrs_0_io_resp_bits_uop_xcpt_pf_if),
    .io_in_0_bits_uop_xcpt_ae_if      (_mshrs_0_io_resp_bits_uop_xcpt_ae_if),
    .io_in_0_bits_uop_xcpt_ma_if      (_mshrs_0_io_resp_bits_uop_xcpt_ma_if),
    .io_in_0_bits_uop_bp_debug_if     (_mshrs_0_io_resp_bits_uop_bp_debug_if),
    .io_in_0_bits_uop_bp_xcpt_if      (_mshrs_0_io_resp_bits_uop_bp_xcpt_if),
    .io_in_0_bits_uop_debug_fsrc      (_mshrs_0_io_resp_bits_uop_debug_fsrc),
    .io_in_0_bits_uop_debug_tsrc      (_mshrs_0_io_resp_bits_uop_debug_tsrc),
    .io_in_0_bits_data                (_mshrs_0_io_resp_bits_data),
    .io_in_0_bits_is_hella            (_mshrs_0_io_resp_bits_is_hella),
    .io_in_1_ready                    (_resp_arb_io_in_1_ready),
    .io_in_1_valid                    (_mshrs_1_io_resp_valid),
    .io_in_1_bits_uop_uopc            (_mshrs_1_io_resp_bits_uop_uopc),
    .io_in_1_bits_uop_inst            (_mshrs_1_io_resp_bits_uop_inst),
    .io_in_1_bits_uop_debug_inst      (_mshrs_1_io_resp_bits_uop_debug_inst),
    .io_in_1_bits_uop_is_rvc          (_mshrs_1_io_resp_bits_uop_is_rvc),
    .io_in_1_bits_uop_debug_pc        (_mshrs_1_io_resp_bits_uop_debug_pc),
    .io_in_1_bits_uop_iq_type         (_mshrs_1_io_resp_bits_uop_iq_type),
    .io_in_1_bits_uop_fu_code         (_mshrs_1_io_resp_bits_uop_fu_code),
    .io_in_1_bits_uop_ctrl_br_type    (_mshrs_1_io_resp_bits_uop_ctrl_br_type),
    .io_in_1_bits_uop_ctrl_op1_sel    (_mshrs_1_io_resp_bits_uop_ctrl_op1_sel),
    .io_in_1_bits_uop_ctrl_op2_sel    (_mshrs_1_io_resp_bits_uop_ctrl_op2_sel),
    .io_in_1_bits_uop_ctrl_imm_sel    (_mshrs_1_io_resp_bits_uop_ctrl_imm_sel),
    .io_in_1_bits_uop_ctrl_op_fcn     (_mshrs_1_io_resp_bits_uop_ctrl_op_fcn),
    .io_in_1_bits_uop_ctrl_fcn_dw     (_mshrs_1_io_resp_bits_uop_ctrl_fcn_dw),
    .io_in_1_bits_uop_ctrl_csr_cmd    (_mshrs_1_io_resp_bits_uop_ctrl_csr_cmd),
    .io_in_1_bits_uop_ctrl_is_load    (_mshrs_1_io_resp_bits_uop_ctrl_is_load),
    .io_in_1_bits_uop_ctrl_is_sta     (_mshrs_1_io_resp_bits_uop_ctrl_is_sta),
    .io_in_1_bits_uop_ctrl_is_std     (_mshrs_1_io_resp_bits_uop_ctrl_is_std),
    .io_in_1_bits_uop_iw_state        (_mshrs_1_io_resp_bits_uop_iw_state),
    .io_in_1_bits_uop_iw_p1_poisoned  (_mshrs_1_io_resp_bits_uop_iw_p1_poisoned),
    .io_in_1_bits_uop_iw_p2_poisoned  (_mshrs_1_io_resp_bits_uop_iw_p2_poisoned),
    .io_in_1_bits_uop_is_br           (_mshrs_1_io_resp_bits_uop_is_br),
    .io_in_1_bits_uop_is_jalr         (_mshrs_1_io_resp_bits_uop_is_jalr),
    .io_in_1_bits_uop_is_jal          (_mshrs_1_io_resp_bits_uop_is_jal),
    .io_in_1_bits_uop_is_sfb          (_mshrs_1_io_resp_bits_uop_is_sfb),
    .io_in_1_bits_uop_br_mask         (_mshrs_1_io_resp_bits_uop_br_mask),
    .io_in_1_bits_uop_br_tag          (_mshrs_1_io_resp_bits_uop_br_tag),
    .io_in_1_bits_uop_ftq_idx         (_mshrs_1_io_resp_bits_uop_ftq_idx),
    .io_in_1_bits_uop_edge_inst       (_mshrs_1_io_resp_bits_uop_edge_inst),
    .io_in_1_bits_uop_pc_lob          (_mshrs_1_io_resp_bits_uop_pc_lob),
    .io_in_1_bits_uop_taken           (_mshrs_1_io_resp_bits_uop_taken),
    .io_in_1_bits_uop_imm_packed      (_mshrs_1_io_resp_bits_uop_imm_packed),
    .io_in_1_bits_uop_csr_addr        (_mshrs_1_io_resp_bits_uop_csr_addr),
    .io_in_1_bits_uop_rob_idx         (_mshrs_1_io_resp_bits_uop_rob_idx),
    .io_in_1_bits_uop_ldq_idx         (_mshrs_1_io_resp_bits_uop_ldq_idx),
    .io_in_1_bits_uop_stq_idx         (_mshrs_1_io_resp_bits_uop_stq_idx),
    .io_in_1_bits_uop_rxq_idx         (_mshrs_1_io_resp_bits_uop_rxq_idx),
    .io_in_1_bits_uop_pdst            (_mshrs_1_io_resp_bits_uop_pdst),
    .io_in_1_bits_uop_prs1            (_mshrs_1_io_resp_bits_uop_prs1),
    .io_in_1_bits_uop_prs2            (_mshrs_1_io_resp_bits_uop_prs2),
    .io_in_1_bits_uop_prs3            (_mshrs_1_io_resp_bits_uop_prs3),
    .io_in_1_bits_uop_ppred           (_mshrs_1_io_resp_bits_uop_ppred),
    .io_in_1_bits_uop_prs1_busy       (_mshrs_1_io_resp_bits_uop_prs1_busy),
    .io_in_1_bits_uop_prs2_busy       (_mshrs_1_io_resp_bits_uop_prs2_busy),
    .io_in_1_bits_uop_prs3_busy       (_mshrs_1_io_resp_bits_uop_prs3_busy),
    .io_in_1_bits_uop_ppred_busy      (_mshrs_1_io_resp_bits_uop_ppred_busy),
    .io_in_1_bits_uop_stale_pdst      (_mshrs_1_io_resp_bits_uop_stale_pdst),
    .io_in_1_bits_uop_exception       (_mshrs_1_io_resp_bits_uop_exception),
    .io_in_1_bits_uop_exc_cause       (_mshrs_1_io_resp_bits_uop_exc_cause),
    .io_in_1_bits_uop_bypassable      (_mshrs_1_io_resp_bits_uop_bypassable),
    .io_in_1_bits_uop_mem_cmd         (_mshrs_1_io_resp_bits_uop_mem_cmd),
    .io_in_1_bits_uop_mem_size        (_mshrs_1_io_resp_bits_uop_mem_size),
    .io_in_1_bits_uop_mem_signed      (_mshrs_1_io_resp_bits_uop_mem_signed),
    .io_in_1_bits_uop_is_fence        (_mshrs_1_io_resp_bits_uop_is_fence),
    .io_in_1_bits_uop_is_fencei       (_mshrs_1_io_resp_bits_uop_is_fencei),
    .io_in_1_bits_uop_is_amo          (_mshrs_1_io_resp_bits_uop_is_amo),
    .io_in_1_bits_uop_uses_ldq        (_mshrs_1_io_resp_bits_uop_uses_ldq),
    .io_in_1_bits_uop_uses_stq        (_mshrs_1_io_resp_bits_uop_uses_stq),
    .io_in_1_bits_uop_is_sys_pc2epc   (_mshrs_1_io_resp_bits_uop_is_sys_pc2epc),
    .io_in_1_bits_uop_is_unique       (_mshrs_1_io_resp_bits_uop_is_unique),
    .io_in_1_bits_uop_flush_on_commit (_mshrs_1_io_resp_bits_uop_flush_on_commit),
    .io_in_1_bits_uop_ldst_is_rs1     (_mshrs_1_io_resp_bits_uop_ldst_is_rs1),
    .io_in_1_bits_uop_ldst            (_mshrs_1_io_resp_bits_uop_ldst),
    .io_in_1_bits_uop_lrs1            (_mshrs_1_io_resp_bits_uop_lrs1),
    .io_in_1_bits_uop_lrs2            (_mshrs_1_io_resp_bits_uop_lrs2),
    .io_in_1_bits_uop_lrs3            (_mshrs_1_io_resp_bits_uop_lrs3),
    .io_in_1_bits_uop_ldst_val        (_mshrs_1_io_resp_bits_uop_ldst_val),
    .io_in_1_bits_uop_dst_rtype       (_mshrs_1_io_resp_bits_uop_dst_rtype),
    .io_in_1_bits_uop_lrs1_rtype      (_mshrs_1_io_resp_bits_uop_lrs1_rtype),
    .io_in_1_bits_uop_lrs2_rtype      (_mshrs_1_io_resp_bits_uop_lrs2_rtype),
    .io_in_1_bits_uop_frs3_en         (_mshrs_1_io_resp_bits_uop_frs3_en),
    .io_in_1_bits_uop_fp_val          (_mshrs_1_io_resp_bits_uop_fp_val),
    .io_in_1_bits_uop_fp_single       (_mshrs_1_io_resp_bits_uop_fp_single),
    .io_in_1_bits_uop_xcpt_pf_if      (_mshrs_1_io_resp_bits_uop_xcpt_pf_if),
    .io_in_1_bits_uop_xcpt_ae_if      (_mshrs_1_io_resp_bits_uop_xcpt_ae_if),
    .io_in_1_bits_uop_xcpt_ma_if      (_mshrs_1_io_resp_bits_uop_xcpt_ma_if),
    .io_in_1_bits_uop_bp_debug_if     (_mshrs_1_io_resp_bits_uop_bp_debug_if),
    .io_in_1_bits_uop_bp_xcpt_if      (_mshrs_1_io_resp_bits_uop_bp_xcpt_if),
    .io_in_1_bits_uop_debug_fsrc      (_mshrs_1_io_resp_bits_uop_debug_fsrc),
    .io_in_1_bits_uop_debug_tsrc      (_mshrs_1_io_resp_bits_uop_debug_tsrc),
    .io_in_1_bits_data                (_mshrs_1_io_resp_bits_data),
    .io_in_1_bits_is_hella            (_mshrs_1_io_resp_bits_is_hella),
    .io_in_2_ready                    (_resp_arb_io_in_2_ready),
    .io_in_2_valid                    (_mshrs_2_io_resp_valid),
    .io_in_2_bits_uop_uopc            (_mshrs_2_io_resp_bits_uop_uopc),
    .io_in_2_bits_uop_inst            (_mshrs_2_io_resp_bits_uop_inst),
    .io_in_2_bits_uop_debug_inst      (_mshrs_2_io_resp_bits_uop_debug_inst),
    .io_in_2_bits_uop_is_rvc          (_mshrs_2_io_resp_bits_uop_is_rvc),
    .io_in_2_bits_uop_debug_pc        (_mshrs_2_io_resp_bits_uop_debug_pc),
    .io_in_2_bits_uop_iq_type         (_mshrs_2_io_resp_bits_uop_iq_type),
    .io_in_2_bits_uop_fu_code         (_mshrs_2_io_resp_bits_uop_fu_code),
    .io_in_2_bits_uop_ctrl_br_type    (_mshrs_2_io_resp_bits_uop_ctrl_br_type),
    .io_in_2_bits_uop_ctrl_op1_sel    (_mshrs_2_io_resp_bits_uop_ctrl_op1_sel),
    .io_in_2_bits_uop_ctrl_op2_sel    (_mshrs_2_io_resp_bits_uop_ctrl_op2_sel),
    .io_in_2_bits_uop_ctrl_imm_sel    (_mshrs_2_io_resp_bits_uop_ctrl_imm_sel),
    .io_in_2_bits_uop_ctrl_op_fcn     (_mshrs_2_io_resp_bits_uop_ctrl_op_fcn),
    .io_in_2_bits_uop_ctrl_fcn_dw     (_mshrs_2_io_resp_bits_uop_ctrl_fcn_dw),
    .io_in_2_bits_uop_ctrl_csr_cmd    (_mshrs_2_io_resp_bits_uop_ctrl_csr_cmd),
    .io_in_2_bits_uop_ctrl_is_load    (_mshrs_2_io_resp_bits_uop_ctrl_is_load),
    .io_in_2_bits_uop_ctrl_is_sta     (_mshrs_2_io_resp_bits_uop_ctrl_is_sta),
    .io_in_2_bits_uop_ctrl_is_std     (_mshrs_2_io_resp_bits_uop_ctrl_is_std),
    .io_in_2_bits_uop_iw_state        (_mshrs_2_io_resp_bits_uop_iw_state),
    .io_in_2_bits_uop_iw_p1_poisoned  (_mshrs_2_io_resp_bits_uop_iw_p1_poisoned),
    .io_in_2_bits_uop_iw_p2_poisoned  (_mshrs_2_io_resp_bits_uop_iw_p2_poisoned),
    .io_in_2_bits_uop_is_br           (_mshrs_2_io_resp_bits_uop_is_br),
    .io_in_2_bits_uop_is_jalr         (_mshrs_2_io_resp_bits_uop_is_jalr),
    .io_in_2_bits_uop_is_jal          (_mshrs_2_io_resp_bits_uop_is_jal),
    .io_in_2_bits_uop_is_sfb          (_mshrs_2_io_resp_bits_uop_is_sfb),
    .io_in_2_bits_uop_br_mask         (_mshrs_2_io_resp_bits_uop_br_mask),
    .io_in_2_bits_uop_br_tag          (_mshrs_2_io_resp_bits_uop_br_tag),
    .io_in_2_bits_uop_ftq_idx         (_mshrs_2_io_resp_bits_uop_ftq_idx),
    .io_in_2_bits_uop_edge_inst       (_mshrs_2_io_resp_bits_uop_edge_inst),
    .io_in_2_bits_uop_pc_lob          (_mshrs_2_io_resp_bits_uop_pc_lob),
    .io_in_2_bits_uop_taken           (_mshrs_2_io_resp_bits_uop_taken),
    .io_in_2_bits_uop_imm_packed      (_mshrs_2_io_resp_bits_uop_imm_packed),
    .io_in_2_bits_uop_csr_addr        (_mshrs_2_io_resp_bits_uop_csr_addr),
    .io_in_2_bits_uop_rob_idx         (_mshrs_2_io_resp_bits_uop_rob_idx),
    .io_in_2_bits_uop_ldq_idx         (_mshrs_2_io_resp_bits_uop_ldq_idx),
    .io_in_2_bits_uop_stq_idx         (_mshrs_2_io_resp_bits_uop_stq_idx),
    .io_in_2_bits_uop_rxq_idx         (_mshrs_2_io_resp_bits_uop_rxq_idx),
    .io_in_2_bits_uop_pdst            (_mshrs_2_io_resp_bits_uop_pdst),
    .io_in_2_bits_uop_prs1            (_mshrs_2_io_resp_bits_uop_prs1),
    .io_in_2_bits_uop_prs2            (_mshrs_2_io_resp_bits_uop_prs2),
    .io_in_2_bits_uop_prs3            (_mshrs_2_io_resp_bits_uop_prs3),
    .io_in_2_bits_uop_ppred           (_mshrs_2_io_resp_bits_uop_ppred),
    .io_in_2_bits_uop_prs1_busy       (_mshrs_2_io_resp_bits_uop_prs1_busy),
    .io_in_2_bits_uop_prs2_busy       (_mshrs_2_io_resp_bits_uop_prs2_busy),
    .io_in_2_bits_uop_prs3_busy       (_mshrs_2_io_resp_bits_uop_prs3_busy),
    .io_in_2_bits_uop_ppred_busy      (_mshrs_2_io_resp_bits_uop_ppred_busy),
    .io_in_2_bits_uop_stale_pdst      (_mshrs_2_io_resp_bits_uop_stale_pdst),
    .io_in_2_bits_uop_exception       (_mshrs_2_io_resp_bits_uop_exception),
    .io_in_2_bits_uop_exc_cause       (_mshrs_2_io_resp_bits_uop_exc_cause),
    .io_in_2_bits_uop_bypassable      (_mshrs_2_io_resp_bits_uop_bypassable),
    .io_in_2_bits_uop_mem_cmd         (_mshrs_2_io_resp_bits_uop_mem_cmd),
    .io_in_2_bits_uop_mem_size        (_mshrs_2_io_resp_bits_uop_mem_size),
    .io_in_2_bits_uop_mem_signed      (_mshrs_2_io_resp_bits_uop_mem_signed),
    .io_in_2_bits_uop_is_fence        (_mshrs_2_io_resp_bits_uop_is_fence),
    .io_in_2_bits_uop_is_fencei       (_mshrs_2_io_resp_bits_uop_is_fencei),
    .io_in_2_bits_uop_is_amo          (_mshrs_2_io_resp_bits_uop_is_amo),
    .io_in_2_bits_uop_uses_ldq        (_mshrs_2_io_resp_bits_uop_uses_ldq),
    .io_in_2_bits_uop_uses_stq        (_mshrs_2_io_resp_bits_uop_uses_stq),
    .io_in_2_bits_uop_is_sys_pc2epc   (_mshrs_2_io_resp_bits_uop_is_sys_pc2epc),
    .io_in_2_bits_uop_is_unique       (_mshrs_2_io_resp_bits_uop_is_unique),
    .io_in_2_bits_uop_flush_on_commit (_mshrs_2_io_resp_bits_uop_flush_on_commit),
    .io_in_2_bits_uop_ldst_is_rs1     (_mshrs_2_io_resp_bits_uop_ldst_is_rs1),
    .io_in_2_bits_uop_ldst            (_mshrs_2_io_resp_bits_uop_ldst),
    .io_in_2_bits_uop_lrs1            (_mshrs_2_io_resp_bits_uop_lrs1),
    .io_in_2_bits_uop_lrs2            (_mshrs_2_io_resp_bits_uop_lrs2),
    .io_in_2_bits_uop_lrs3            (_mshrs_2_io_resp_bits_uop_lrs3),
    .io_in_2_bits_uop_ldst_val        (_mshrs_2_io_resp_bits_uop_ldst_val),
    .io_in_2_bits_uop_dst_rtype       (_mshrs_2_io_resp_bits_uop_dst_rtype),
    .io_in_2_bits_uop_lrs1_rtype      (_mshrs_2_io_resp_bits_uop_lrs1_rtype),
    .io_in_2_bits_uop_lrs2_rtype      (_mshrs_2_io_resp_bits_uop_lrs2_rtype),
    .io_in_2_bits_uop_frs3_en         (_mshrs_2_io_resp_bits_uop_frs3_en),
    .io_in_2_bits_uop_fp_val          (_mshrs_2_io_resp_bits_uop_fp_val),
    .io_in_2_bits_uop_fp_single       (_mshrs_2_io_resp_bits_uop_fp_single),
    .io_in_2_bits_uop_xcpt_pf_if      (_mshrs_2_io_resp_bits_uop_xcpt_pf_if),
    .io_in_2_bits_uop_xcpt_ae_if      (_mshrs_2_io_resp_bits_uop_xcpt_ae_if),
    .io_in_2_bits_uop_xcpt_ma_if      (_mshrs_2_io_resp_bits_uop_xcpt_ma_if),
    .io_in_2_bits_uop_bp_debug_if     (_mshrs_2_io_resp_bits_uop_bp_debug_if),
    .io_in_2_bits_uop_bp_xcpt_if      (_mshrs_2_io_resp_bits_uop_bp_xcpt_if),
    .io_in_2_bits_uop_debug_fsrc      (_mshrs_2_io_resp_bits_uop_debug_fsrc),
    .io_in_2_bits_uop_debug_tsrc      (_mshrs_2_io_resp_bits_uop_debug_tsrc),
    .io_in_2_bits_data                (_mshrs_2_io_resp_bits_data),
    .io_in_2_bits_is_hella            (_mshrs_2_io_resp_bits_is_hella),
    .io_in_3_ready                    (_resp_arb_io_in_3_ready),
    .io_in_3_valid                    (_mshrs_3_io_resp_valid),
    .io_in_3_bits_uop_uopc            (_mshrs_3_io_resp_bits_uop_uopc),
    .io_in_3_bits_uop_inst            (_mshrs_3_io_resp_bits_uop_inst),
    .io_in_3_bits_uop_debug_inst      (_mshrs_3_io_resp_bits_uop_debug_inst),
    .io_in_3_bits_uop_is_rvc          (_mshrs_3_io_resp_bits_uop_is_rvc),
    .io_in_3_bits_uop_debug_pc        (_mshrs_3_io_resp_bits_uop_debug_pc),
    .io_in_3_bits_uop_iq_type         (_mshrs_3_io_resp_bits_uop_iq_type),
    .io_in_3_bits_uop_fu_code         (_mshrs_3_io_resp_bits_uop_fu_code),
    .io_in_3_bits_uop_ctrl_br_type    (_mshrs_3_io_resp_bits_uop_ctrl_br_type),
    .io_in_3_bits_uop_ctrl_op1_sel    (_mshrs_3_io_resp_bits_uop_ctrl_op1_sel),
    .io_in_3_bits_uop_ctrl_op2_sel    (_mshrs_3_io_resp_bits_uop_ctrl_op2_sel),
    .io_in_3_bits_uop_ctrl_imm_sel    (_mshrs_3_io_resp_bits_uop_ctrl_imm_sel),
    .io_in_3_bits_uop_ctrl_op_fcn     (_mshrs_3_io_resp_bits_uop_ctrl_op_fcn),
    .io_in_3_bits_uop_ctrl_fcn_dw     (_mshrs_3_io_resp_bits_uop_ctrl_fcn_dw),
    .io_in_3_bits_uop_ctrl_csr_cmd    (_mshrs_3_io_resp_bits_uop_ctrl_csr_cmd),
    .io_in_3_bits_uop_ctrl_is_load    (_mshrs_3_io_resp_bits_uop_ctrl_is_load),
    .io_in_3_bits_uop_ctrl_is_sta     (_mshrs_3_io_resp_bits_uop_ctrl_is_sta),
    .io_in_3_bits_uop_ctrl_is_std     (_mshrs_3_io_resp_bits_uop_ctrl_is_std),
    .io_in_3_bits_uop_iw_state        (_mshrs_3_io_resp_bits_uop_iw_state),
    .io_in_3_bits_uop_iw_p1_poisoned  (_mshrs_3_io_resp_bits_uop_iw_p1_poisoned),
    .io_in_3_bits_uop_iw_p2_poisoned  (_mshrs_3_io_resp_bits_uop_iw_p2_poisoned),
    .io_in_3_bits_uop_is_br           (_mshrs_3_io_resp_bits_uop_is_br),
    .io_in_3_bits_uop_is_jalr         (_mshrs_3_io_resp_bits_uop_is_jalr),
    .io_in_3_bits_uop_is_jal          (_mshrs_3_io_resp_bits_uop_is_jal),
    .io_in_3_bits_uop_is_sfb          (_mshrs_3_io_resp_bits_uop_is_sfb),
    .io_in_3_bits_uop_br_mask         (_mshrs_3_io_resp_bits_uop_br_mask),
    .io_in_3_bits_uop_br_tag          (_mshrs_3_io_resp_bits_uop_br_tag),
    .io_in_3_bits_uop_ftq_idx         (_mshrs_3_io_resp_bits_uop_ftq_idx),
    .io_in_3_bits_uop_edge_inst       (_mshrs_3_io_resp_bits_uop_edge_inst),
    .io_in_3_bits_uop_pc_lob          (_mshrs_3_io_resp_bits_uop_pc_lob),
    .io_in_3_bits_uop_taken           (_mshrs_3_io_resp_bits_uop_taken),
    .io_in_3_bits_uop_imm_packed      (_mshrs_3_io_resp_bits_uop_imm_packed),
    .io_in_3_bits_uop_csr_addr        (_mshrs_3_io_resp_bits_uop_csr_addr),
    .io_in_3_bits_uop_rob_idx         (_mshrs_3_io_resp_bits_uop_rob_idx),
    .io_in_3_bits_uop_ldq_idx         (_mshrs_3_io_resp_bits_uop_ldq_idx),
    .io_in_3_bits_uop_stq_idx         (_mshrs_3_io_resp_bits_uop_stq_idx),
    .io_in_3_bits_uop_rxq_idx         (_mshrs_3_io_resp_bits_uop_rxq_idx),
    .io_in_3_bits_uop_pdst            (_mshrs_3_io_resp_bits_uop_pdst),
    .io_in_3_bits_uop_prs1            (_mshrs_3_io_resp_bits_uop_prs1),
    .io_in_3_bits_uop_prs2            (_mshrs_3_io_resp_bits_uop_prs2),
    .io_in_3_bits_uop_prs3            (_mshrs_3_io_resp_bits_uop_prs3),
    .io_in_3_bits_uop_ppred           (_mshrs_3_io_resp_bits_uop_ppred),
    .io_in_3_bits_uop_prs1_busy       (_mshrs_3_io_resp_bits_uop_prs1_busy),
    .io_in_3_bits_uop_prs2_busy       (_mshrs_3_io_resp_bits_uop_prs2_busy),
    .io_in_3_bits_uop_prs3_busy       (_mshrs_3_io_resp_bits_uop_prs3_busy),
    .io_in_3_bits_uop_ppred_busy      (_mshrs_3_io_resp_bits_uop_ppred_busy),
    .io_in_3_bits_uop_stale_pdst      (_mshrs_3_io_resp_bits_uop_stale_pdst),
    .io_in_3_bits_uop_exception       (_mshrs_3_io_resp_bits_uop_exception),
    .io_in_3_bits_uop_exc_cause       (_mshrs_3_io_resp_bits_uop_exc_cause),
    .io_in_3_bits_uop_bypassable      (_mshrs_3_io_resp_bits_uop_bypassable),
    .io_in_3_bits_uop_mem_cmd         (_mshrs_3_io_resp_bits_uop_mem_cmd),
    .io_in_3_bits_uop_mem_size        (_mshrs_3_io_resp_bits_uop_mem_size),
    .io_in_3_bits_uop_mem_signed      (_mshrs_3_io_resp_bits_uop_mem_signed),
    .io_in_3_bits_uop_is_fence        (_mshrs_3_io_resp_bits_uop_is_fence),
    .io_in_3_bits_uop_is_fencei       (_mshrs_3_io_resp_bits_uop_is_fencei),
    .io_in_3_bits_uop_is_amo          (_mshrs_3_io_resp_bits_uop_is_amo),
    .io_in_3_bits_uop_uses_ldq        (_mshrs_3_io_resp_bits_uop_uses_ldq),
    .io_in_3_bits_uop_uses_stq        (_mshrs_3_io_resp_bits_uop_uses_stq),
    .io_in_3_bits_uop_is_sys_pc2epc   (_mshrs_3_io_resp_bits_uop_is_sys_pc2epc),
    .io_in_3_bits_uop_is_unique       (_mshrs_3_io_resp_bits_uop_is_unique),
    .io_in_3_bits_uop_flush_on_commit (_mshrs_3_io_resp_bits_uop_flush_on_commit),
    .io_in_3_bits_uop_ldst_is_rs1     (_mshrs_3_io_resp_bits_uop_ldst_is_rs1),
    .io_in_3_bits_uop_ldst            (_mshrs_3_io_resp_bits_uop_ldst),
    .io_in_3_bits_uop_lrs1            (_mshrs_3_io_resp_bits_uop_lrs1),
    .io_in_3_bits_uop_lrs2            (_mshrs_3_io_resp_bits_uop_lrs2),
    .io_in_3_bits_uop_lrs3            (_mshrs_3_io_resp_bits_uop_lrs3),
    .io_in_3_bits_uop_ldst_val        (_mshrs_3_io_resp_bits_uop_ldst_val),
    .io_in_3_bits_uop_dst_rtype       (_mshrs_3_io_resp_bits_uop_dst_rtype),
    .io_in_3_bits_uop_lrs1_rtype      (_mshrs_3_io_resp_bits_uop_lrs1_rtype),
    .io_in_3_bits_uop_lrs2_rtype      (_mshrs_3_io_resp_bits_uop_lrs2_rtype),
    .io_in_3_bits_uop_frs3_en         (_mshrs_3_io_resp_bits_uop_frs3_en),
    .io_in_3_bits_uop_fp_val          (_mshrs_3_io_resp_bits_uop_fp_val),
    .io_in_3_bits_uop_fp_single       (_mshrs_3_io_resp_bits_uop_fp_single),
    .io_in_3_bits_uop_xcpt_pf_if      (_mshrs_3_io_resp_bits_uop_xcpt_pf_if),
    .io_in_3_bits_uop_xcpt_ae_if      (_mshrs_3_io_resp_bits_uop_xcpt_ae_if),
    .io_in_3_bits_uop_xcpt_ma_if      (_mshrs_3_io_resp_bits_uop_xcpt_ma_if),
    .io_in_3_bits_uop_bp_debug_if     (_mshrs_3_io_resp_bits_uop_bp_debug_if),
    .io_in_3_bits_uop_bp_xcpt_if      (_mshrs_3_io_resp_bits_uop_bp_xcpt_if),
    .io_in_3_bits_uop_debug_fsrc      (_mshrs_3_io_resp_bits_uop_debug_fsrc),
    .io_in_3_bits_uop_debug_tsrc      (_mshrs_3_io_resp_bits_uop_debug_tsrc),
    .io_in_3_bits_data                (_mshrs_3_io_resp_bits_data),
    .io_in_3_bits_is_hella            (_mshrs_3_io_resp_bits_is_hella),
    .io_in_4_ready                    (_resp_arb_io_in_4_ready),
    .io_in_4_valid                    (_mshrs_4_io_resp_valid),
    .io_in_4_bits_uop_uopc            (_mshrs_4_io_resp_bits_uop_uopc),
    .io_in_4_bits_uop_inst            (_mshrs_4_io_resp_bits_uop_inst),
    .io_in_4_bits_uop_debug_inst      (_mshrs_4_io_resp_bits_uop_debug_inst),
    .io_in_4_bits_uop_is_rvc          (_mshrs_4_io_resp_bits_uop_is_rvc),
    .io_in_4_bits_uop_debug_pc        (_mshrs_4_io_resp_bits_uop_debug_pc),
    .io_in_4_bits_uop_iq_type         (_mshrs_4_io_resp_bits_uop_iq_type),
    .io_in_4_bits_uop_fu_code         (_mshrs_4_io_resp_bits_uop_fu_code),
    .io_in_4_bits_uop_ctrl_br_type    (_mshrs_4_io_resp_bits_uop_ctrl_br_type),
    .io_in_4_bits_uop_ctrl_op1_sel    (_mshrs_4_io_resp_bits_uop_ctrl_op1_sel),
    .io_in_4_bits_uop_ctrl_op2_sel    (_mshrs_4_io_resp_bits_uop_ctrl_op2_sel),
    .io_in_4_bits_uop_ctrl_imm_sel    (_mshrs_4_io_resp_bits_uop_ctrl_imm_sel),
    .io_in_4_bits_uop_ctrl_op_fcn     (_mshrs_4_io_resp_bits_uop_ctrl_op_fcn),
    .io_in_4_bits_uop_ctrl_fcn_dw     (_mshrs_4_io_resp_bits_uop_ctrl_fcn_dw),
    .io_in_4_bits_uop_ctrl_csr_cmd    (_mshrs_4_io_resp_bits_uop_ctrl_csr_cmd),
    .io_in_4_bits_uop_ctrl_is_load    (_mshrs_4_io_resp_bits_uop_ctrl_is_load),
    .io_in_4_bits_uop_ctrl_is_sta     (_mshrs_4_io_resp_bits_uop_ctrl_is_sta),
    .io_in_4_bits_uop_ctrl_is_std     (_mshrs_4_io_resp_bits_uop_ctrl_is_std),
    .io_in_4_bits_uop_iw_state        (_mshrs_4_io_resp_bits_uop_iw_state),
    .io_in_4_bits_uop_iw_p1_poisoned  (_mshrs_4_io_resp_bits_uop_iw_p1_poisoned),
    .io_in_4_bits_uop_iw_p2_poisoned  (_mshrs_4_io_resp_bits_uop_iw_p2_poisoned),
    .io_in_4_bits_uop_is_br           (_mshrs_4_io_resp_bits_uop_is_br),
    .io_in_4_bits_uop_is_jalr         (_mshrs_4_io_resp_bits_uop_is_jalr),
    .io_in_4_bits_uop_is_jal          (_mshrs_4_io_resp_bits_uop_is_jal),
    .io_in_4_bits_uop_is_sfb          (_mshrs_4_io_resp_bits_uop_is_sfb),
    .io_in_4_bits_uop_br_mask         (_mshrs_4_io_resp_bits_uop_br_mask),
    .io_in_4_bits_uop_br_tag          (_mshrs_4_io_resp_bits_uop_br_tag),
    .io_in_4_bits_uop_ftq_idx         (_mshrs_4_io_resp_bits_uop_ftq_idx),
    .io_in_4_bits_uop_edge_inst       (_mshrs_4_io_resp_bits_uop_edge_inst),
    .io_in_4_bits_uop_pc_lob          (_mshrs_4_io_resp_bits_uop_pc_lob),
    .io_in_4_bits_uop_taken           (_mshrs_4_io_resp_bits_uop_taken),
    .io_in_4_bits_uop_imm_packed      (_mshrs_4_io_resp_bits_uop_imm_packed),
    .io_in_4_bits_uop_csr_addr        (_mshrs_4_io_resp_bits_uop_csr_addr),
    .io_in_4_bits_uop_rob_idx         (_mshrs_4_io_resp_bits_uop_rob_idx),
    .io_in_4_bits_uop_ldq_idx         (_mshrs_4_io_resp_bits_uop_ldq_idx),
    .io_in_4_bits_uop_stq_idx         (_mshrs_4_io_resp_bits_uop_stq_idx),
    .io_in_4_bits_uop_rxq_idx         (_mshrs_4_io_resp_bits_uop_rxq_idx),
    .io_in_4_bits_uop_pdst            (_mshrs_4_io_resp_bits_uop_pdst),
    .io_in_4_bits_uop_prs1            (_mshrs_4_io_resp_bits_uop_prs1),
    .io_in_4_bits_uop_prs2            (_mshrs_4_io_resp_bits_uop_prs2),
    .io_in_4_bits_uop_prs3            (_mshrs_4_io_resp_bits_uop_prs3),
    .io_in_4_bits_uop_ppred           (_mshrs_4_io_resp_bits_uop_ppred),
    .io_in_4_bits_uop_prs1_busy       (_mshrs_4_io_resp_bits_uop_prs1_busy),
    .io_in_4_bits_uop_prs2_busy       (_mshrs_4_io_resp_bits_uop_prs2_busy),
    .io_in_4_bits_uop_prs3_busy       (_mshrs_4_io_resp_bits_uop_prs3_busy),
    .io_in_4_bits_uop_ppred_busy      (_mshrs_4_io_resp_bits_uop_ppred_busy),
    .io_in_4_bits_uop_stale_pdst      (_mshrs_4_io_resp_bits_uop_stale_pdst),
    .io_in_4_bits_uop_exception       (_mshrs_4_io_resp_bits_uop_exception),
    .io_in_4_bits_uop_exc_cause       (_mshrs_4_io_resp_bits_uop_exc_cause),
    .io_in_4_bits_uop_bypassable      (_mshrs_4_io_resp_bits_uop_bypassable),
    .io_in_4_bits_uop_mem_cmd         (_mshrs_4_io_resp_bits_uop_mem_cmd),
    .io_in_4_bits_uop_mem_size        (_mshrs_4_io_resp_bits_uop_mem_size),
    .io_in_4_bits_uop_mem_signed      (_mshrs_4_io_resp_bits_uop_mem_signed),
    .io_in_4_bits_uop_is_fence        (_mshrs_4_io_resp_bits_uop_is_fence),
    .io_in_4_bits_uop_is_fencei       (_mshrs_4_io_resp_bits_uop_is_fencei),
    .io_in_4_bits_uop_is_amo          (_mshrs_4_io_resp_bits_uop_is_amo),
    .io_in_4_bits_uop_uses_ldq        (_mshrs_4_io_resp_bits_uop_uses_ldq),
    .io_in_4_bits_uop_uses_stq        (_mshrs_4_io_resp_bits_uop_uses_stq),
    .io_in_4_bits_uop_is_sys_pc2epc   (_mshrs_4_io_resp_bits_uop_is_sys_pc2epc),
    .io_in_4_bits_uop_is_unique       (_mshrs_4_io_resp_bits_uop_is_unique),
    .io_in_4_bits_uop_flush_on_commit (_mshrs_4_io_resp_bits_uop_flush_on_commit),
    .io_in_4_bits_uop_ldst_is_rs1     (_mshrs_4_io_resp_bits_uop_ldst_is_rs1),
    .io_in_4_bits_uop_ldst            (_mshrs_4_io_resp_bits_uop_ldst),
    .io_in_4_bits_uop_lrs1            (_mshrs_4_io_resp_bits_uop_lrs1),
    .io_in_4_bits_uop_lrs2            (_mshrs_4_io_resp_bits_uop_lrs2),
    .io_in_4_bits_uop_lrs3            (_mshrs_4_io_resp_bits_uop_lrs3),
    .io_in_4_bits_uop_ldst_val        (_mshrs_4_io_resp_bits_uop_ldst_val),
    .io_in_4_bits_uop_dst_rtype       (_mshrs_4_io_resp_bits_uop_dst_rtype),
    .io_in_4_bits_uop_lrs1_rtype      (_mshrs_4_io_resp_bits_uop_lrs1_rtype),
    .io_in_4_bits_uop_lrs2_rtype      (_mshrs_4_io_resp_bits_uop_lrs2_rtype),
    .io_in_4_bits_uop_frs3_en         (_mshrs_4_io_resp_bits_uop_frs3_en),
    .io_in_4_bits_uop_fp_val          (_mshrs_4_io_resp_bits_uop_fp_val),
    .io_in_4_bits_uop_fp_single       (_mshrs_4_io_resp_bits_uop_fp_single),
    .io_in_4_bits_uop_xcpt_pf_if      (_mshrs_4_io_resp_bits_uop_xcpt_pf_if),
    .io_in_4_bits_uop_xcpt_ae_if      (_mshrs_4_io_resp_bits_uop_xcpt_ae_if),
    .io_in_4_bits_uop_xcpt_ma_if      (_mshrs_4_io_resp_bits_uop_xcpt_ma_if),
    .io_in_4_bits_uop_bp_debug_if     (_mshrs_4_io_resp_bits_uop_bp_debug_if),
    .io_in_4_bits_uop_bp_xcpt_if      (_mshrs_4_io_resp_bits_uop_bp_xcpt_if),
    .io_in_4_bits_uop_debug_fsrc      (_mshrs_4_io_resp_bits_uop_debug_fsrc),
    .io_in_4_bits_uop_debug_tsrc      (_mshrs_4_io_resp_bits_uop_debug_tsrc),
    .io_in_4_bits_data                (_mshrs_4_io_resp_bits_data),
    .io_in_4_bits_is_hella            (_mshrs_4_io_resp_bits_is_hella),
    .io_in_5_ready                    (_resp_arb_io_in_5_ready),
    .io_in_5_valid                    (_mshrs_5_io_resp_valid),
    .io_in_5_bits_uop_uopc            (_mshrs_5_io_resp_bits_uop_uopc),
    .io_in_5_bits_uop_inst            (_mshrs_5_io_resp_bits_uop_inst),
    .io_in_5_bits_uop_debug_inst      (_mshrs_5_io_resp_bits_uop_debug_inst),
    .io_in_5_bits_uop_is_rvc          (_mshrs_5_io_resp_bits_uop_is_rvc),
    .io_in_5_bits_uop_debug_pc        (_mshrs_5_io_resp_bits_uop_debug_pc),
    .io_in_5_bits_uop_iq_type         (_mshrs_5_io_resp_bits_uop_iq_type),
    .io_in_5_bits_uop_fu_code         (_mshrs_5_io_resp_bits_uop_fu_code),
    .io_in_5_bits_uop_ctrl_br_type    (_mshrs_5_io_resp_bits_uop_ctrl_br_type),
    .io_in_5_bits_uop_ctrl_op1_sel    (_mshrs_5_io_resp_bits_uop_ctrl_op1_sel),
    .io_in_5_bits_uop_ctrl_op2_sel    (_mshrs_5_io_resp_bits_uop_ctrl_op2_sel),
    .io_in_5_bits_uop_ctrl_imm_sel    (_mshrs_5_io_resp_bits_uop_ctrl_imm_sel),
    .io_in_5_bits_uop_ctrl_op_fcn     (_mshrs_5_io_resp_bits_uop_ctrl_op_fcn),
    .io_in_5_bits_uop_ctrl_fcn_dw     (_mshrs_5_io_resp_bits_uop_ctrl_fcn_dw),
    .io_in_5_bits_uop_ctrl_csr_cmd    (_mshrs_5_io_resp_bits_uop_ctrl_csr_cmd),
    .io_in_5_bits_uop_ctrl_is_load    (_mshrs_5_io_resp_bits_uop_ctrl_is_load),
    .io_in_5_bits_uop_ctrl_is_sta     (_mshrs_5_io_resp_bits_uop_ctrl_is_sta),
    .io_in_5_bits_uop_ctrl_is_std     (_mshrs_5_io_resp_bits_uop_ctrl_is_std),
    .io_in_5_bits_uop_iw_state        (_mshrs_5_io_resp_bits_uop_iw_state),
    .io_in_5_bits_uop_iw_p1_poisoned  (_mshrs_5_io_resp_bits_uop_iw_p1_poisoned),
    .io_in_5_bits_uop_iw_p2_poisoned  (_mshrs_5_io_resp_bits_uop_iw_p2_poisoned),
    .io_in_5_bits_uop_is_br           (_mshrs_5_io_resp_bits_uop_is_br),
    .io_in_5_bits_uop_is_jalr         (_mshrs_5_io_resp_bits_uop_is_jalr),
    .io_in_5_bits_uop_is_jal          (_mshrs_5_io_resp_bits_uop_is_jal),
    .io_in_5_bits_uop_is_sfb          (_mshrs_5_io_resp_bits_uop_is_sfb),
    .io_in_5_bits_uop_br_mask         (_mshrs_5_io_resp_bits_uop_br_mask),
    .io_in_5_bits_uop_br_tag          (_mshrs_5_io_resp_bits_uop_br_tag),
    .io_in_5_bits_uop_ftq_idx         (_mshrs_5_io_resp_bits_uop_ftq_idx),
    .io_in_5_bits_uop_edge_inst       (_mshrs_5_io_resp_bits_uop_edge_inst),
    .io_in_5_bits_uop_pc_lob          (_mshrs_5_io_resp_bits_uop_pc_lob),
    .io_in_5_bits_uop_taken           (_mshrs_5_io_resp_bits_uop_taken),
    .io_in_5_bits_uop_imm_packed      (_mshrs_5_io_resp_bits_uop_imm_packed),
    .io_in_5_bits_uop_csr_addr        (_mshrs_5_io_resp_bits_uop_csr_addr),
    .io_in_5_bits_uop_rob_idx         (_mshrs_5_io_resp_bits_uop_rob_idx),
    .io_in_5_bits_uop_ldq_idx         (_mshrs_5_io_resp_bits_uop_ldq_idx),
    .io_in_5_bits_uop_stq_idx         (_mshrs_5_io_resp_bits_uop_stq_idx),
    .io_in_5_bits_uop_rxq_idx         (_mshrs_5_io_resp_bits_uop_rxq_idx),
    .io_in_5_bits_uop_pdst            (_mshrs_5_io_resp_bits_uop_pdst),
    .io_in_5_bits_uop_prs1            (_mshrs_5_io_resp_bits_uop_prs1),
    .io_in_5_bits_uop_prs2            (_mshrs_5_io_resp_bits_uop_prs2),
    .io_in_5_bits_uop_prs3            (_mshrs_5_io_resp_bits_uop_prs3),
    .io_in_5_bits_uop_ppred           (_mshrs_5_io_resp_bits_uop_ppred),
    .io_in_5_bits_uop_prs1_busy       (_mshrs_5_io_resp_bits_uop_prs1_busy),
    .io_in_5_bits_uop_prs2_busy       (_mshrs_5_io_resp_bits_uop_prs2_busy),
    .io_in_5_bits_uop_prs3_busy       (_mshrs_5_io_resp_bits_uop_prs3_busy),
    .io_in_5_bits_uop_ppred_busy      (_mshrs_5_io_resp_bits_uop_ppred_busy),
    .io_in_5_bits_uop_stale_pdst      (_mshrs_5_io_resp_bits_uop_stale_pdst),
    .io_in_5_bits_uop_exception       (_mshrs_5_io_resp_bits_uop_exception),
    .io_in_5_bits_uop_exc_cause       (_mshrs_5_io_resp_bits_uop_exc_cause),
    .io_in_5_bits_uop_bypassable      (_mshrs_5_io_resp_bits_uop_bypassable),
    .io_in_5_bits_uop_mem_cmd         (_mshrs_5_io_resp_bits_uop_mem_cmd),
    .io_in_5_bits_uop_mem_size        (_mshrs_5_io_resp_bits_uop_mem_size),
    .io_in_5_bits_uop_mem_signed      (_mshrs_5_io_resp_bits_uop_mem_signed),
    .io_in_5_bits_uop_is_fence        (_mshrs_5_io_resp_bits_uop_is_fence),
    .io_in_5_bits_uop_is_fencei       (_mshrs_5_io_resp_bits_uop_is_fencei),
    .io_in_5_bits_uop_is_amo          (_mshrs_5_io_resp_bits_uop_is_amo),
    .io_in_5_bits_uop_uses_ldq        (_mshrs_5_io_resp_bits_uop_uses_ldq),
    .io_in_5_bits_uop_uses_stq        (_mshrs_5_io_resp_bits_uop_uses_stq),
    .io_in_5_bits_uop_is_sys_pc2epc   (_mshrs_5_io_resp_bits_uop_is_sys_pc2epc),
    .io_in_5_bits_uop_is_unique       (_mshrs_5_io_resp_bits_uop_is_unique),
    .io_in_5_bits_uop_flush_on_commit (_mshrs_5_io_resp_bits_uop_flush_on_commit),
    .io_in_5_bits_uop_ldst_is_rs1     (_mshrs_5_io_resp_bits_uop_ldst_is_rs1),
    .io_in_5_bits_uop_ldst            (_mshrs_5_io_resp_bits_uop_ldst),
    .io_in_5_bits_uop_lrs1            (_mshrs_5_io_resp_bits_uop_lrs1),
    .io_in_5_bits_uop_lrs2            (_mshrs_5_io_resp_bits_uop_lrs2),
    .io_in_5_bits_uop_lrs3            (_mshrs_5_io_resp_bits_uop_lrs3),
    .io_in_5_bits_uop_ldst_val        (_mshrs_5_io_resp_bits_uop_ldst_val),
    .io_in_5_bits_uop_dst_rtype       (_mshrs_5_io_resp_bits_uop_dst_rtype),
    .io_in_5_bits_uop_lrs1_rtype      (_mshrs_5_io_resp_bits_uop_lrs1_rtype),
    .io_in_5_bits_uop_lrs2_rtype      (_mshrs_5_io_resp_bits_uop_lrs2_rtype),
    .io_in_5_bits_uop_frs3_en         (_mshrs_5_io_resp_bits_uop_frs3_en),
    .io_in_5_bits_uop_fp_val          (_mshrs_5_io_resp_bits_uop_fp_val),
    .io_in_5_bits_uop_fp_single       (_mshrs_5_io_resp_bits_uop_fp_single),
    .io_in_5_bits_uop_xcpt_pf_if      (_mshrs_5_io_resp_bits_uop_xcpt_pf_if),
    .io_in_5_bits_uop_xcpt_ae_if      (_mshrs_5_io_resp_bits_uop_xcpt_ae_if),
    .io_in_5_bits_uop_xcpt_ma_if      (_mshrs_5_io_resp_bits_uop_xcpt_ma_if),
    .io_in_5_bits_uop_bp_debug_if     (_mshrs_5_io_resp_bits_uop_bp_debug_if),
    .io_in_5_bits_uop_bp_xcpt_if      (_mshrs_5_io_resp_bits_uop_bp_xcpt_if),
    .io_in_5_bits_uop_debug_fsrc      (_mshrs_5_io_resp_bits_uop_debug_fsrc),
    .io_in_5_bits_uop_debug_tsrc      (_mshrs_5_io_resp_bits_uop_debug_tsrc),
    .io_in_5_bits_data                (_mshrs_5_io_resp_bits_data),
    .io_in_5_bits_is_hella            (_mshrs_5_io_resp_bits_is_hella),
    .io_in_6_ready                    (_resp_arb_io_in_6_ready),
    .io_in_6_valid                    (_mshrs_6_io_resp_valid),
    .io_in_6_bits_uop_uopc            (_mshrs_6_io_resp_bits_uop_uopc),
    .io_in_6_bits_uop_inst            (_mshrs_6_io_resp_bits_uop_inst),
    .io_in_6_bits_uop_debug_inst      (_mshrs_6_io_resp_bits_uop_debug_inst),
    .io_in_6_bits_uop_is_rvc          (_mshrs_6_io_resp_bits_uop_is_rvc),
    .io_in_6_bits_uop_debug_pc        (_mshrs_6_io_resp_bits_uop_debug_pc),
    .io_in_6_bits_uop_iq_type         (_mshrs_6_io_resp_bits_uop_iq_type),
    .io_in_6_bits_uop_fu_code         (_mshrs_6_io_resp_bits_uop_fu_code),
    .io_in_6_bits_uop_ctrl_br_type    (_mshrs_6_io_resp_bits_uop_ctrl_br_type),
    .io_in_6_bits_uop_ctrl_op1_sel    (_mshrs_6_io_resp_bits_uop_ctrl_op1_sel),
    .io_in_6_bits_uop_ctrl_op2_sel    (_mshrs_6_io_resp_bits_uop_ctrl_op2_sel),
    .io_in_6_bits_uop_ctrl_imm_sel    (_mshrs_6_io_resp_bits_uop_ctrl_imm_sel),
    .io_in_6_bits_uop_ctrl_op_fcn     (_mshrs_6_io_resp_bits_uop_ctrl_op_fcn),
    .io_in_6_bits_uop_ctrl_fcn_dw     (_mshrs_6_io_resp_bits_uop_ctrl_fcn_dw),
    .io_in_6_bits_uop_ctrl_csr_cmd    (_mshrs_6_io_resp_bits_uop_ctrl_csr_cmd),
    .io_in_6_bits_uop_ctrl_is_load    (_mshrs_6_io_resp_bits_uop_ctrl_is_load),
    .io_in_6_bits_uop_ctrl_is_sta     (_mshrs_6_io_resp_bits_uop_ctrl_is_sta),
    .io_in_6_bits_uop_ctrl_is_std     (_mshrs_6_io_resp_bits_uop_ctrl_is_std),
    .io_in_6_bits_uop_iw_state        (_mshrs_6_io_resp_bits_uop_iw_state),
    .io_in_6_bits_uop_iw_p1_poisoned  (_mshrs_6_io_resp_bits_uop_iw_p1_poisoned),
    .io_in_6_bits_uop_iw_p2_poisoned  (_mshrs_6_io_resp_bits_uop_iw_p2_poisoned),
    .io_in_6_bits_uop_is_br           (_mshrs_6_io_resp_bits_uop_is_br),
    .io_in_6_bits_uop_is_jalr         (_mshrs_6_io_resp_bits_uop_is_jalr),
    .io_in_6_bits_uop_is_jal          (_mshrs_6_io_resp_bits_uop_is_jal),
    .io_in_6_bits_uop_is_sfb          (_mshrs_6_io_resp_bits_uop_is_sfb),
    .io_in_6_bits_uop_br_mask         (_mshrs_6_io_resp_bits_uop_br_mask),
    .io_in_6_bits_uop_br_tag          (_mshrs_6_io_resp_bits_uop_br_tag),
    .io_in_6_bits_uop_ftq_idx         (_mshrs_6_io_resp_bits_uop_ftq_idx),
    .io_in_6_bits_uop_edge_inst       (_mshrs_6_io_resp_bits_uop_edge_inst),
    .io_in_6_bits_uop_pc_lob          (_mshrs_6_io_resp_bits_uop_pc_lob),
    .io_in_6_bits_uop_taken           (_mshrs_6_io_resp_bits_uop_taken),
    .io_in_6_bits_uop_imm_packed      (_mshrs_6_io_resp_bits_uop_imm_packed),
    .io_in_6_bits_uop_csr_addr        (_mshrs_6_io_resp_bits_uop_csr_addr),
    .io_in_6_bits_uop_rob_idx         (_mshrs_6_io_resp_bits_uop_rob_idx),
    .io_in_6_bits_uop_ldq_idx         (_mshrs_6_io_resp_bits_uop_ldq_idx),
    .io_in_6_bits_uop_stq_idx         (_mshrs_6_io_resp_bits_uop_stq_idx),
    .io_in_6_bits_uop_rxq_idx         (_mshrs_6_io_resp_bits_uop_rxq_idx),
    .io_in_6_bits_uop_pdst            (_mshrs_6_io_resp_bits_uop_pdst),
    .io_in_6_bits_uop_prs1            (_mshrs_6_io_resp_bits_uop_prs1),
    .io_in_6_bits_uop_prs2            (_mshrs_6_io_resp_bits_uop_prs2),
    .io_in_6_bits_uop_prs3            (_mshrs_6_io_resp_bits_uop_prs3),
    .io_in_6_bits_uop_ppred           (_mshrs_6_io_resp_bits_uop_ppred),
    .io_in_6_bits_uop_prs1_busy       (_mshrs_6_io_resp_bits_uop_prs1_busy),
    .io_in_6_bits_uop_prs2_busy       (_mshrs_6_io_resp_bits_uop_prs2_busy),
    .io_in_6_bits_uop_prs3_busy       (_mshrs_6_io_resp_bits_uop_prs3_busy),
    .io_in_6_bits_uop_ppred_busy      (_mshrs_6_io_resp_bits_uop_ppred_busy),
    .io_in_6_bits_uop_stale_pdst      (_mshrs_6_io_resp_bits_uop_stale_pdst),
    .io_in_6_bits_uop_exception       (_mshrs_6_io_resp_bits_uop_exception),
    .io_in_6_bits_uop_exc_cause       (_mshrs_6_io_resp_bits_uop_exc_cause),
    .io_in_6_bits_uop_bypassable      (_mshrs_6_io_resp_bits_uop_bypassable),
    .io_in_6_bits_uop_mem_cmd         (_mshrs_6_io_resp_bits_uop_mem_cmd),
    .io_in_6_bits_uop_mem_size        (_mshrs_6_io_resp_bits_uop_mem_size),
    .io_in_6_bits_uop_mem_signed      (_mshrs_6_io_resp_bits_uop_mem_signed),
    .io_in_6_bits_uop_is_fence        (_mshrs_6_io_resp_bits_uop_is_fence),
    .io_in_6_bits_uop_is_fencei       (_mshrs_6_io_resp_bits_uop_is_fencei),
    .io_in_6_bits_uop_is_amo          (_mshrs_6_io_resp_bits_uop_is_amo),
    .io_in_6_bits_uop_uses_ldq        (_mshrs_6_io_resp_bits_uop_uses_ldq),
    .io_in_6_bits_uop_uses_stq        (_mshrs_6_io_resp_bits_uop_uses_stq),
    .io_in_6_bits_uop_is_sys_pc2epc   (_mshrs_6_io_resp_bits_uop_is_sys_pc2epc),
    .io_in_6_bits_uop_is_unique       (_mshrs_6_io_resp_bits_uop_is_unique),
    .io_in_6_bits_uop_flush_on_commit (_mshrs_6_io_resp_bits_uop_flush_on_commit),
    .io_in_6_bits_uop_ldst_is_rs1     (_mshrs_6_io_resp_bits_uop_ldst_is_rs1),
    .io_in_6_bits_uop_ldst            (_mshrs_6_io_resp_bits_uop_ldst),
    .io_in_6_bits_uop_lrs1            (_mshrs_6_io_resp_bits_uop_lrs1),
    .io_in_6_bits_uop_lrs2            (_mshrs_6_io_resp_bits_uop_lrs2),
    .io_in_6_bits_uop_lrs3            (_mshrs_6_io_resp_bits_uop_lrs3),
    .io_in_6_bits_uop_ldst_val        (_mshrs_6_io_resp_bits_uop_ldst_val),
    .io_in_6_bits_uop_dst_rtype       (_mshrs_6_io_resp_bits_uop_dst_rtype),
    .io_in_6_bits_uop_lrs1_rtype      (_mshrs_6_io_resp_bits_uop_lrs1_rtype),
    .io_in_6_bits_uop_lrs2_rtype      (_mshrs_6_io_resp_bits_uop_lrs2_rtype),
    .io_in_6_bits_uop_frs3_en         (_mshrs_6_io_resp_bits_uop_frs3_en),
    .io_in_6_bits_uop_fp_val          (_mshrs_6_io_resp_bits_uop_fp_val),
    .io_in_6_bits_uop_fp_single       (_mshrs_6_io_resp_bits_uop_fp_single),
    .io_in_6_bits_uop_xcpt_pf_if      (_mshrs_6_io_resp_bits_uop_xcpt_pf_if),
    .io_in_6_bits_uop_xcpt_ae_if      (_mshrs_6_io_resp_bits_uop_xcpt_ae_if),
    .io_in_6_bits_uop_xcpt_ma_if      (_mshrs_6_io_resp_bits_uop_xcpt_ma_if),
    .io_in_6_bits_uop_bp_debug_if     (_mshrs_6_io_resp_bits_uop_bp_debug_if),
    .io_in_6_bits_uop_bp_xcpt_if      (_mshrs_6_io_resp_bits_uop_bp_xcpt_if),
    .io_in_6_bits_uop_debug_fsrc      (_mshrs_6_io_resp_bits_uop_debug_fsrc),
    .io_in_6_bits_uop_debug_tsrc      (_mshrs_6_io_resp_bits_uop_debug_tsrc),
    .io_in_6_bits_data                (_mshrs_6_io_resp_bits_data),
    .io_in_6_bits_is_hella            (_mshrs_6_io_resp_bits_is_hella),
    .io_in_7_ready                    (_resp_arb_io_in_7_ready),
    .io_in_7_valid                    (_mshrs_7_io_resp_valid),
    .io_in_7_bits_uop_uopc            (_mshrs_7_io_resp_bits_uop_uopc),
    .io_in_7_bits_uop_inst            (_mshrs_7_io_resp_bits_uop_inst),
    .io_in_7_bits_uop_debug_inst      (_mshrs_7_io_resp_bits_uop_debug_inst),
    .io_in_7_bits_uop_is_rvc          (_mshrs_7_io_resp_bits_uop_is_rvc),
    .io_in_7_bits_uop_debug_pc        (_mshrs_7_io_resp_bits_uop_debug_pc),
    .io_in_7_bits_uop_iq_type         (_mshrs_7_io_resp_bits_uop_iq_type),
    .io_in_7_bits_uop_fu_code         (_mshrs_7_io_resp_bits_uop_fu_code),
    .io_in_7_bits_uop_ctrl_br_type    (_mshrs_7_io_resp_bits_uop_ctrl_br_type),
    .io_in_7_bits_uop_ctrl_op1_sel    (_mshrs_7_io_resp_bits_uop_ctrl_op1_sel),
    .io_in_7_bits_uop_ctrl_op2_sel    (_mshrs_7_io_resp_bits_uop_ctrl_op2_sel),
    .io_in_7_bits_uop_ctrl_imm_sel    (_mshrs_7_io_resp_bits_uop_ctrl_imm_sel),
    .io_in_7_bits_uop_ctrl_op_fcn     (_mshrs_7_io_resp_bits_uop_ctrl_op_fcn),
    .io_in_7_bits_uop_ctrl_fcn_dw     (_mshrs_7_io_resp_bits_uop_ctrl_fcn_dw),
    .io_in_7_bits_uop_ctrl_csr_cmd    (_mshrs_7_io_resp_bits_uop_ctrl_csr_cmd),
    .io_in_7_bits_uop_ctrl_is_load    (_mshrs_7_io_resp_bits_uop_ctrl_is_load),
    .io_in_7_bits_uop_ctrl_is_sta     (_mshrs_7_io_resp_bits_uop_ctrl_is_sta),
    .io_in_7_bits_uop_ctrl_is_std     (_mshrs_7_io_resp_bits_uop_ctrl_is_std),
    .io_in_7_bits_uop_iw_state        (_mshrs_7_io_resp_bits_uop_iw_state),
    .io_in_7_bits_uop_iw_p1_poisoned  (_mshrs_7_io_resp_bits_uop_iw_p1_poisoned),
    .io_in_7_bits_uop_iw_p2_poisoned  (_mshrs_7_io_resp_bits_uop_iw_p2_poisoned),
    .io_in_7_bits_uop_is_br           (_mshrs_7_io_resp_bits_uop_is_br),
    .io_in_7_bits_uop_is_jalr         (_mshrs_7_io_resp_bits_uop_is_jalr),
    .io_in_7_bits_uop_is_jal          (_mshrs_7_io_resp_bits_uop_is_jal),
    .io_in_7_bits_uop_is_sfb          (_mshrs_7_io_resp_bits_uop_is_sfb),
    .io_in_7_bits_uop_br_mask         (_mshrs_7_io_resp_bits_uop_br_mask),
    .io_in_7_bits_uop_br_tag          (_mshrs_7_io_resp_bits_uop_br_tag),
    .io_in_7_bits_uop_ftq_idx         (_mshrs_7_io_resp_bits_uop_ftq_idx),
    .io_in_7_bits_uop_edge_inst       (_mshrs_7_io_resp_bits_uop_edge_inst),
    .io_in_7_bits_uop_pc_lob          (_mshrs_7_io_resp_bits_uop_pc_lob),
    .io_in_7_bits_uop_taken           (_mshrs_7_io_resp_bits_uop_taken),
    .io_in_7_bits_uop_imm_packed      (_mshrs_7_io_resp_bits_uop_imm_packed),
    .io_in_7_bits_uop_csr_addr        (_mshrs_7_io_resp_bits_uop_csr_addr),
    .io_in_7_bits_uop_rob_idx         (_mshrs_7_io_resp_bits_uop_rob_idx),
    .io_in_7_bits_uop_ldq_idx         (_mshrs_7_io_resp_bits_uop_ldq_idx),
    .io_in_7_bits_uop_stq_idx         (_mshrs_7_io_resp_bits_uop_stq_idx),
    .io_in_7_bits_uop_rxq_idx         (_mshrs_7_io_resp_bits_uop_rxq_idx),
    .io_in_7_bits_uop_pdst            (_mshrs_7_io_resp_bits_uop_pdst),
    .io_in_7_bits_uop_prs1            (_mshrs_7_io_resp_bits_uop_prs1),
    .io_in_7_bits_uop_prs2            (_mshrs_7_io_resp_bits_uop_prs2),
    .io_in_7_bits_uop_prs3            (_mshrs_7_io_resp_bits_uop_prs3),
    .io_in_7_bits_uop_ppred           (_mshrs_7_io_resp_bits_uop_ppred),
    .io_in_7_bits_uop_prs1_busy       (_mshrs_7_io_resp_bits_uop_prs1_busy),
    .io_in_7_bits_uop_prs2_busy       (_mshrs_7_io_resp_bits_uop_prs2_busy),
    .io_in_7_bits_uop_prs3_busy       (_mshrs_7_io_resp_bits_uop_prs3_busy),
    .io_in_7_bits_uop_ppred_busy      (_mshrs_7_io_resp_bits_uop_ppred_busy),
    .io_in_7_bits_uop_stale_pdst      (_mshrs_7_io_resp_bits_uop_stale_pdst),
    .io_in_7_bits_uop_exception       (_mshrs_7_io_resp_bits_uop_exception),
    .io_in_7_bits_uop_exc_cause       (_mshrs_7_io_resp_bits_uop_exc_cause),
    .io_in_7_bits_uop_bypassable      (_mshrs_7_io_resp_bits_uop_bypassable),
    .io_in_7_bits_uop_mem_cmd         (_mshrs_7_io_resp_bits_uop_mem_cmd),
    .io_in_7_bits_uop_mem_size        (_mshrs_7_io_resp_bits_uop_mem_size),
    .io_in_7_bits_uop_mem_signed      (_mshrs_7_io_resp_bits_uop_mem_signed),
    .io_in_7_bits_uop_is_fence        (_mshrs_7_io_resp_bits_uop_is_fence),
    .io_in_7_bits_uop_is_fencei       (_mshrs_7_io_resp_bits_uop_is_fencei),
    .io_in_7_bits_uop_is_amo          (_mshrs_7_io_resp_bits_uop_is_amo),
    .io_in_7_bits_uop_uses_ldq        (_mshrs_7_io_resp_bits_uop_uses_ldq),
    .io_in_7_bits_uop_uses_stq        (_mshrs_7_io_resp_bits_uop_uses_stq),
    .io_in_7_bits_uop_is_sys_pc2epc   (_mshrs_7_io_resp_bits_uop_is_sys_pc2epc),
    .io_in_7_bits_uop_is_unique       (_mshrs_7_io_resp_bits_uop_is_unique),
    .io_in_7_bits_uop_flush_on_commit (_mshrs_7_io_resp_bits_uop_flush_on_commit),
    .io_in_7_bits_uop_ldst_is_rs1     (_mshrs_7_io_resp_bits_uop_ldst_is_rs1),
    .io_in_7_bits_uop_ldst            (_mshrs_7_io_resp_bits_uop_ldst),
    .io_in_7_bits_uop_lrs1            (_mshrs_7_io_resp_bits_uop_lrs1),
    .io_in_7_bits_uop_lrs2            (_mshrs_7_io_resp_bits_uop_lrs2),
    .io_in_7_bits_uop_lrs3            (_mshrs_7_io_resp_bits_uop_lrs3),
    .io_in_7_bits_uop_ldst_val        (_mshrs_7_io_resp_bits_uop_ldst_val),
    .io_in_7_bits_uop_dst_rtype       (_mshrs_7_io_resp_bits_uop_dst_rtype),
    .io_in_7_bits_uop_lrs1_rtype      (_mshrs_7_io_resp_bits_uop_lrs1_rtype),
    .io_in_7_bits_uop_lrs2_rtype      (_mshrs_7_io_resp_bits_uop_lrs2_rtype),
    .io_in_7_bits_uop_frs3_en         (_mshrs_7_io_resp_bits_uop_frs3_en),
    .io_in_7_bits_uop_fp_val          (_mshrs_7_io_resp_bits_uop_fp_val),
    .io_in_7_bits_uop_fp_single       (_mshrs_7_io_resp_bits_uop_fp_single),
    .io_in_7_bits_uop_xcpt_pf_if      (_mshrs_7_io_resp_bits_uop_xcpt_pf_if),
    .io_in_7_bits_uop_xcpt_ae_if      (_mshrs_7_io_resp_bits_uop_xcpt_ae_if),
    .io_in_7_bits_uop_xcpt_ma_if      (_mshrs_7_io_resp_bits_uop_xcpt_ma_if),
    .io_in_7_bits_uop_bp_debug_if     (_mshrs_7_io_resp_bits_uop_bp_debug_if),
    .io_in_7_bits_uop_bp_xcpt_if      (_mshrs_7_io_resp_bits_uop_bp_xcpt_if),
    .io_in_7_bits_uop_debug_fsrc      (_mshrs_7_io_resp_bits_uop_debug_fsrc),
    .io_in_7_bits_uop_debug_tsrc      (_mshrs_7_io_resp_bits_uop_debug_tsrc),
    .io_in_7_bits_data                (_mshrs_7_io_resp_bits_data),
    .io_in_7_bits_is_hella            (_mshrs_7_io_resp_bits_is_hella),
    .io_in_8_ready                    (_resp_arb_io_in_8_ready),
    .io_in_8_valid                    (_mmios_0_io_resp_valid),
    .io_in_8_bits_uop_uopc            (_mmios_0_io_resp_bits_uop_uopc),
    .io_in_8_bits_uop_inst            (_mmios_0_io_resp_bits_uop_inst),
    .io_in_8_bits_uop_debug_inst      (_mmios_0_io_resp_bits_uop_debug_inst),
    .io_in_8_bits_uop_is_rvc          (_mmios_0_io_resp_bits_uop_is_rvc),
    .io_in_8_bits_uop_debug_pc        (_mmios_0_io_resp_bits_uop_debug_pc),
    .io_in_8_bits_uop_iq_type         (_mmios_0_io_resp_bits_uop_iq_type),
    .io_in_8_bits_uop_fu_code         (_mmios_0_io_resp_bits_uop_fu_code),
    .io_in_8_bits_uop_ctrl_br_type    (_mmios_0_io_resp_bits_uop_ctrl_br_type),
    .io_in_8_bits_uop_ctrl_op1_sel    (_mmios_0_io_resp_bits_uop_ctrl_op1_sel),
    .io_in_8_bits_uop_ctrl_op2_sel    (_mmios_0_io_resp_bits_uop_ctrl_op2_sel),
    .io_in_8_bits_uop_ctrl_imm_sel    (_mmios_0_io_resp_bits_uop_ctrl_imm_sel),
    .io_in_8_bits_uop_ctrl_op_fcn     (_mmios_0_io_resp_bits_uop_ctrl_op_fcn),
    .io_in_8_bits_uop_ctrl_fcn_dw     (_mmios_0_io_resp_bits_uop_ctrl_fcn_dw),
    .io_in_8_bits_uop_ctrl_csr_cmd    (_mmios_0_io_resp_bits_uop_ctrl_csr_cmd),
    .io_in_8_bits_uop_ctrl_is_load    (_mmios_0_io_resp_bits_uop_ctrl_is_load),
    .io_in_8_bits_uop_ctrl_is_sta     (_mmios_0_io_resp_bits_uop_ctrl_is_sta),
    .io_in_8_bits_uop_ctrl_is_std     (_mmios_0_io_resp_bits_uop_ctrl_is_std),
    .io_in_8_bits_uop_iw_state        (_mmios_0_io_resp_bits_uop_iw_state),
    .io_in_8_bits_uop_iw_p1_poisoned  (_mmios_0_io_resp_bits_uop_iw_p1_poisoned),
    .io_in_8_bits_uop_iw_p2_poisoned  (_mmios_0_io_resp_bits_uop_iw_p2_poisoned),
    .io_in_8_bits_uop_is_br           (_mmios_0_io_resp_bits_uop_is_br),
    .io_in_8_bits_uop_is_jalr         (_mmios_0_io_resp_bits_uop_is_jalr),
    .io_in_8_bits_uop_is_jal          (_mmios_0_io_resp_bits_uop_is_jal),
    .io_in_8_bits_uop_is_sfb          (_mmios_0_io_resp_bits_uop_is_sfb),
    .io_in_8_bits_uop_br_mask         (_mmios_0_io_resp_bits_uop_br_mask),
    .io_in_8_bits_uop_br_tag          (_mmios_0_io_resp_bits_uop_br_tag),
    .io_in_8_bits_uop_ftq_idx         (_mmios_0_io_resp_bits_uop_ftq_idx),
    .io_in_8_bits_uop_edge_inst       (_mmios_0_io_resp_bits_uop_edge_inst),
    .io_in_8_bits_uop_pc_lob          (_mmios_0_io_resp_bits_uop_pc_lob),
    .io_in_8_bits_uop_taken           (_mmios_0_io_resp_bits_uop_taken),
    .io_in_8_bits_uop_imm_packed      (_mmios_0_io_resp_bits_uop_imm_packed),
    .io_in_8_bits_uop_csr_addr        (_mmios_0_io_resp_bits_uop_csr_addr),
    .io_in_8_bits_uop_rob_idx         (_mmios_0_io_resp_bits_uop_rob_idx),
    .io_in_8_bits_uop_ldq_idx         (_mmios_0_io_resp_bits_uop_ldq_idx),
    .io_in_8_bits_uop_stq_idx         (_mmios_0_io_resp_bits_uop_stq_idx),
    .io_in_8_bits_uop_rxq_idx         (_mmios_0_io_resp_bits_uop_rxq_idx),
    .io_in_8_bits_uop_pdst            (_mmios_0_io_resp_bits_uop_pdst),
    .io_in_8_bits_uop_prs1            (_mmios_0_io_resp_bits_uop_prs1),
    .io_in_8_bits_uop_prs2            (_mmios_0_io_resp_bits_uop_prs2),
    .io_in_8_bits_uop_prs3            (_mmios_0_io_resp_bits_uop_prs3),
    .io_in_8_bits_uop_ppred           (_mmios_0_io_resp_bits_uop_ppred),
    .io_in_8_bits_uop_prs1_busy       (_mmios_0_io_resp_bits_uop_prs1_busy),
    .io_in_8_bits_uop_prs2_busy       (_mmios_0_io_resp_bits_uop_prs2_busy),
    .io_in_8_bits_uop_prs3_busy       (_mmios_0_io_resp_bits_uop_prs3_busy),
    .io_in_8_bits_uop_ppred_busy      (_mmios_0_io_resp_bits_uop_ppred_busy),
    .io_in_8_bits_uop_stale_pdst      (_mmios_0_io_resp_bits_uop_stale_pdst),
    .io_in_8_bits_uop_exception       (_mmios_0_io_resp_bits_uop_exception),
    .io_in_8_bits_uop_exc_cause       (_mmios_0_io_resp_bits_uop_exc_cause),
    .io_in_8_bits_uop_bypassable      (_mmios_0_io_resp_bits_uop_bypassable),
    .io_in_8_bits_uop_mem_cmd         (_mmios_0_io_resp_bits_uop_mem_cmd),
    .io_in_8_bits_uop_mem_size        (_mmios_0_io_resp_bits_uop_mem_size),
    .io_in_8_bits_uop_mem_signed      (_mmios_0_io_resp_bits_uop_mem_signed),
    .io_in_8_bits_uop_is_fence        (_mmios_0_io_resp_bits_uop_is_fence),
    .io_in_8_bits_uop_is_fencei       (_mmios_0_io_resp_bits_uop_is_fencei),
    .io_in_8_bits_uop_is_amo          (_mmios_0_io_resp_bits_uop_is_amo),
    .io_in_8_bits_uop_uses_ldq        (_mmios_0_io_resp_bits_uop_uses_ldq),
    .io_in_8_bits_uop_uses_stq        (_mmios_0_io_resp_bits_uop_uses_stq),
    .io_in_8_bits_uop_is_sys_pc2epc   (_mmios_0_io_resp_bits_uop_is_sys_pc2epc),
    .io_in_8_bits_uop_is_unique       (_mmios_0_io_resp_bits_uop_is_unique),
    .io_in_8_bits_uop_flush_on_commit (_mmios_0_io_resp_bits_uop_flush_on_commit),
    .io_in_8_bits_uop_ldst_is_rs1     (_mmios_0_io_resp_bits_uop_ldst_is_rs1),
    .io_in_8_bits_uop_ldst            (_mmios_0_io_resp_bits_uop_ldst),
    .io_in_8_bits_uop_lrs1            (_mmios_0_io_resp_bits_uop_lrs1),
    .io_in_8_bits_uop_lrs2            (_mmios_0_io_resp_bits_uop_lrs2),
    .io_in_8_bits_uop_lrs3            (_mmios_0_io_resp_bits_uop_lrs3),
    .io_in_8_bits_uop_ldst_val        (_mmios_0_io_resp_bits_uop_ldst_val),
    .io_in_8_bits_uop_dst_rtype       (_mmios_0_io_resp_bits_uop_dst_rtype),
    .io_in_8_bits_uop_lrs1_rtype      (_mmios_0_io_resp_bits_uop_lrs1_rtype),
    .io_in_8_bits_uop_lrs2_rtype      (_mmios_0_io_resp_bits_uop_lrs2_rtype),
    .io_in_8_bits_uop_frs3_en         (_mmios_0_io_resp_bits_uop_frs3_en),
    .io_in_8_bits_uop_fp_val          (_mmios_0_io_resp_bits_uop_fp_val),
    .io_in_8_bits_uop_fp_single       (_mmios_0_io_resp_bits_uop_fp_single),
    .io_in_8_bits_uop_xcpt_pf_if      (_mmios_0_io_resp_bits_uop_xcpt_pf_if),
    .io_in_8_bits_uop_xcpt_ae_if      (_mmios_0_io_resp_bits_uop_xcpt_ae_if),
    .io_in_8_bits_uop_xcpt_ma_if      (_mmios_0_io_resp_bits_uop_xcpt_ma_if),
    .io_in_8_bits_uop_bp_debug_if     (_mmios_0_io_resp_bits_uop_bp_debug_if),
    .io_in_8_bits_uop_bp_xcpt_if      (_mmios_0_io_resp_bits_uop_bp_xcpt_if),
    .io_in_8_bits_uop_debug_fsrc      (_mmios_0_io_resp_bits_uop_debug_fsrc),
    .io_in_8_bits_uop_debug_tsrc      (_mmios_0_io_resp_bits_uop_debug_tsrc),
    .io_in_8_bits_data                (_mmios_0_io_resp_bits_data),
    .io_in_8_bits_is_hella            (_mmios_0_io_resp_bits_is_hella),
    .io_out_ready                     (_respq_io_enq_ready),
    .io_out_valid                     (_resp_arb_io_out_valid),
    .io_out_bits_uop_uopc             (_resp_arb_io_out_bits_uop_uopc),
    .io_out_bits_uop_inst             (_resp_arb_io_out_bits_uop_inst),
    .io_out_bits_uop_debug_inst       (_resp_arb_io_out_bits_uop_debug_inst),
    .io_out_bits_uop_is_rvc           (_resp_arb_io_out_bits_uop_is_rvc),
    .io_out_bits_uop_debug_pc         (_resp_arb_io_out_bits_uop_debug_pc),
    .io_out_bits_uop_iq_type          (_resp_arb_io_out_bits_uop_iq_type),
    .io_out_bits_uop_fu_code          (_resp_arb_io_out_bits_uop_fu_code),
    .io_out_bits_uop_ctrl_br_type     (_resp_arb_io_out_bits_uop_ctrl_br_type),
    .io_out_bits_uop_ctrl_op1_sel     (_resp_arb_io_out_bits_uop_ctrl_op1_sel),
    .io_out_bits_uop_ctrl_op2_sel     (_resp_arb_io_out_bits_uop_ctrl_op2_sel),
    .io_out_bits_uop_ctrl_imm_sel     (_resp_arb_io_out_bits_uop_ctrl_imm_sel),
    .io_out_bits_uop_ctrl_op_fcn      (_resp_arb_io_out_bits_uop_ctrl_op_fcn),
    .io_out_bits_uop_ctrl_fcn_dw      (_resp_arb_io_out_bits_uop_ctrl_fcn_dw),
    .io_out_bits_uop_ctrl_csr_cmd     (_resp_arb_io_out_bits_uop_ctrl_csr_cmd),
    .io_out_bits_uop_ctrl_is_load     (_resp_arb_io_out_bits_uop_ctrl_is_load),
    .io_out_bits_uop_ctrl_is_sta      (_resp_arb_io_out_bits_uop_ctrl_is_sta),
    .io_out_bits_uop_ctrl_is_std      (_resp_arb_io_out_bits_uop_ctrl_is_std),
    .io_out_bits_uop_iw_state         (_resp_arb_io_out_bits_uop_iw_state),
    .io_out_bits_uop_iw_p1_poisoned   (_resp_arb_io_out_bits_uop_iw_p1_poisoned),
    .io_out_bits_uop_iw_p2_poisoned   (_resp_arb_io_out_bits_uop_iw_p2_poisoned),
    .io_out_bits_uop_is_br            (_resp_arb_io_out_bits_uop_is_br),
    .io_out_bits_uop_is_jalr          (_resp_arb_io_out_bits_uop_is_jalr),
    .io_out_bits_uop_is_jal           (_resp_arb_io_out_bits_uop_is_jal),
    .io_out_bits_uop_is_sfb           (_resp_arb_io_out_bits_uop_is_sfb),
    .io_out_bits_uop_br_mask          (_resp_arb_io_out_bits_uop_br_mask),
    .io_out_bits_uop_br_tag           (_resp_arb_io_out_bits_uop_br_tag),
    .io_out_bits_uop_ftq_idx          (_resp_arb_io_out_bits_uop_ftq_idx),
    .io_out_bits_uop_edge_inst        (_resp_arb_io_out_bits_uop_edge_inst),
    .io_out_bits_uop_pc_lob           (_resp_arb_io_out_bits_uop_pc_lob),
    .io_out_bits_uop_taken            (_resp_arb_io_out_bits_uop_taken),
    .io_out_bits_uop_imm_packed       (_resp_arb_io_out_bits_uop_imm_packed),
    .io_out_bits_uop_csr_addr         (_resp_arb_io_out_bits_uop_csr_addr),
    .io_out_bits_uop_rob_idx          (_resp_arb_io_out_bits_uop_rob_idx),
    .io_out_bits_uop_ldq_idx          (_resp_arb_io_out_bits_uop_ldq_idx),
    .io_out_bits_uop_stq_idx          (_resp_arb_io_out_bits_uop_stq_idx),
    .io_out_bits_uop_rxq_idx          (_resp_arb_io_out_bits_uop_rxq_idx),
    .io_out_bits_uop_pdst             (_resp_arb_io_out_bits_uop_pdst),
    .io_out_bits_uop_prs1             (_resp_arb_io_out_bits_uop_prs1),
    .io_out_bits_uop_prs2             (_resp_arb_io_out_bits_uop_prs2),
    .io_out_bits_uop_prs3             (_resp_arb_io_out_bits_uop_prs3),
    .io_out_bits_uop_ppred            (_resp_arb_io_out_bits_uop_ppred),
    .io_out_bits_uop_prs1_busy        (_resp_arb_io_out_bits_uop_prs1_busy),
    .io_out_bits_uop_prs2_busy        (_resp_arb_io_out_bits_uop_prs2_busy),
    .io_out_bits_uop_prs3_busy        (_resp_arb_io_out_bits_uop_prs3_busy),
    .io_out_bits_uop_ppred_busy       (_resp_arb_io_out_bits_uop_ppred_busy),
    .io_out_bits_uop_stale_pdst       (_resp_arb_io_out_bits_uop_stale_pdst),
    .io_out_bits_uop_exception        (_resp_arb_io_out_bits_uop_exception),
    .io_out_bits_uop_exc_cause        (_resp_arb_io_out_bits_uop_exc_cause),
    .io_out_bits_uop_bypassable       (_resp_arb_io_out_bits_uop_bypassable),
    .io_out_bits_uop_mem_cmd          (_resp_arb_io_out_bits_uop_mem_cmd),
    .io_out_bits_uop_mem_size         (_resp_arb_io_out_bits_uop_mem_size),
    .io_out_bits_uop_mem_signed       (_resp_arb_io_out_bits_uop_mem_signed),
    .io_out_bits_uop_is_fence         (_resp_arb_io_out_bits_uop_is_fence),
    .io_out_bits_uop_is_fencei        (_resp_arb_io_out_bits_uop_is_fencei),
    .io_out_bits_uop_is_amo           (_resp_arb_io_out_bits_uop_is_amo),
    .io_out_bits_uop_uses_ldq         (_resp_arb_io_out_bits_uop_uses_ldq),
    .io_out_bits_uop_uses_stq         (_resp_arb_io_out_bits_uop_uses_stq),
    .io_out_bits_uop_is_sys_pc2epc    (_resp_arb_io_out_bits_uop_is_sys_pc2epc),
    .io_out_bits_uop_is_unique        (_resp_arb_io_out_bits_uop_is_unique),
    .io_out_bits_uop_flush_on_commit  (_resp_arb_io_out_bits_uop_flush_on_commit),
    .io_out_bits_uop_ldst_is_rs1      (_resp_arb_io_out_bits_uop_ldst_is_rs1),
    .io_out_bits_uop_ldst             (_resp_arb_io_out_bits_uop_ldst),
    .io_out_bits_uop_lrs1             (_resp_arb_io_out_bits_uop_lrs1),
    .io_out_bits_uop_lrs2             (_resp_arb_io_out_bits_uop_lrs2),
    .io_out_bits_uop_lrs3             (_resp_arb_io_out_bits_uop_lrs3),
    .io_out_bits_uop_ldst_val         (_resp_arb_io_out_bits_uop_ldst_val),
    .io_out_bits_uop_dst_rtype        (_resp_arb_io_out_bits_uop_dst_rtype),
    .io_out_bits_uop_lrs1_rtype       (_resp_arb_io_out_bits_uop_lrs1_rtype),
    .io_out_bits_uop_lrs2_rtype       (_resp_arb_io_out_bits_uop_lrs2_rtype),
    .io_out_bits_uop_frs3_en          (_resp_arb_io_out_bits_uop_frs3_en),
    .io_out_bits_uop_fp_val           (_resp_arb_io_out_bits_uop_fp_val),
    .io_out_bits_uop_fp_single        (_resp_arb_io_out_bits_uop_fp_single),
    .io_out_bits_uop_xcpt_pf_if       (_resp_arb_io_out_bits_uop_xcpt_pf_if),
    .io_out_bits_uop_xcpt_ae_if       (_resp_arb_io_out_bits_uop_xcpt_ae_if),
    .io_out_bits_uop_xcpt_ma_if       (_resp_arb_io_out_bits_uop_xcpt_ma_if),
    .io_out_bits_uop_bp_debug_if      (_resp_arb_io_out_bits_uop_bp_debug_if),
    .io_out_bits_uop_bp_xcpt_if       (_resp_arb_io_out_bits_uop_bp_xcpt_if),
    .io_out_bits_uop_debug_fsrc       (_resp_arb_io_out_bits_uop_debug_fsrc),
    .io_out_bits_uop_debug_tsrc       (_resp_arb_io_out_bits_uop_debug_tsrc),
    .io_out_bits_data                 (_resp_arb_io_out_bits_data),
    .io_out_bits_is_hella             (_resp_arb_io_out_bits_is_hella)
  );
  Arbiter_7 refill_arb (
    .io_in_0_ready       (_refill_arb_io_in_0_ready),
    .io_in_0_valid       (_mshrs_0_io_refill_valid),
    .io_in_0_bits_way_en (_mshrs_0_io_refill_bits_way_en),
    .io_in_0_bits_addr   (_mshrs_0_io_refill_bits_addr),
    .io_in_0_bits_data   (_mshrs_0_io_refill_bits_data),
    .io_in_1_ready       (_refill_arb_io_in_1_ready),
    .io_in_1_valid       (_mshrs_1_io_refill_valid),
    .io_in_1_bits_way_en (_mshrs_1_io_refill_bits_way_en),
    .io_in_1_bits_addr   (_mshrs_1_io_refill_bits_addr),
    .io_in_1_bits_data   (_mshrs_1_io_refill_bits_data),
    .io_in_2_ready       (_refill_arb_io_in_2_ready),
    .io_in_2_valid       (_mshrs_2_io_refill_valid),
    .io_in_2_bits_way_en (_mshrs_2_io_refill_bits_way_en),
    .io_in_2_bits_addr   (_mshrs_2_io_refill_bits_addr),
    .io_in_2_bits_data   (_mshrs_2_io_refill_bits_data),
    .io_in_3_ready       (_refill_arb_io_in_3_ready),
    .io_in_3_valid       (_mshrs_3_io_refill_valid),
    .io_in_3_bits_way_en (_mshrs_3_io_refill_bits_way_en),
    .io_in_3_bits_addr   (_mshrs_3_io_refill_bits_addr),
    .io_in_3_bits_data   (_mshrs_3_io_refill_bits_data),
    .io_in_4_ready       (_refill_arb_io_in_4_ready),
    .io_in_4_valid       (_mshrs_4_io_refill_valid),
    .io_in_4_bits_way_en (_mshrs_4_io_refill_bits_way_en),
    .io_in_4_bits_addr   (_mshrs_4_io_refill_bits_addr),
    .io_in_4_bits_data   (_mshrs_4_io_refill_bits_data),
    .io_in_5_ready       (_refill_arb_io_in_5_ready),
    .io_in_5_valid       (_mshrs_5_io_refill_valid),
    .io_in_5_bits_way_en (_mshrs_5_io_refill_bits_way_en),
    .io_in_5_bits_addr   (_mshrs_5_io_refill_bits_addr),
    .io_in_5_bits_data   (_mshrs_5_io_refill_bits_data),
    .io_in_6_ready       (_refill_arb_io_in_6_ready),
    .io_in_6_valid       (_mshrs_6_io_refill_valid),
    .io_in_6_bits_way_en (_mshrs_6_io_refill_bits_way_en),
    .io_in_6_bits_addr   (_mshrs_6_io_refill_bits_addr),
    .io_in_6_bits_data   (_mshrs_6_io_refill_bits_data),
    .io_in_7_ready       (_refill_arb_io_in_7_ready),
    .io_in_7_valid       (_mshrs_7_io_refill_valid),
    .io_in_7_bits_way_en (_mshrs_7_io_refill_bits_way_en),
    .io_in_7_bits_addr   (_mshrs_7_io_refill_bits_addr),
    .io_in_7_bits_data   (_mshrs_7_io_refill_bits_data),
    .io_out_ready        (io_refill_ready),
    .io_out_valid        (io_refill_valid),
    .io_out_bits_way_en  (io_refill_bits_way_en),
    .io_out_bits_addr    (io_refill_bits_addr),
    .io_out_bits_data    (io_refill_bits_data)
  );
  BoomMSHR mshrs_0 (
    .clock                              (clock),
    .reset                              (reset),
    .io_id                              (3'h0),
    .io_req_pri_val                     (_mshr_io_req_pri_val_T & pri_val),
    .io_req_pri_rdy                     (_mshrs_0_io_req_pri_rdy),
    .io_req_sec_val                     (_mshr_io_req_sec_val_T_3),
    .io_req_sec_rdy                     (_mshrs_0_io_req_sec_rdy),
    .io_clear_prefetch                  (io_clear_all & ~_GEN | _GEN & _GEN_87 & cacheable & ~_GEN_86 | io_req_is_probe_0 & _GEN_87),
    .io_brupdate_b1_resolve_mask        (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask     (io_brupdate_b1_mispredict_mask),
    .io_exception                       (io_exception),
    .io_req_uop_uopc                    (_GEN_0),
    .io_req_uop_inst                    (_GEN_1),
    .io_req_uop_debug_inst              (_GEN_2),
    .io_req_uop_is_rvc                  (_GEN_3),
    .io_req_uop_debug_pc                (_GEN_4),
    .io_req_uop_iq_type                 (_GEN_5),
    .io_req_uop_fu_code                 (_GEN_6),
    .io_req_uop_ctrl_br_type            (_GEN_7),
    .io_req_uop_ctrl_op1_sel            (_GEN_8),
    .io_req_uop_ctrl_op2_sel            (_GEN_9),
    .io_req_uop_ctrl_imm_sel            (_GEN_10),
    .io_req_uop_ctrl_op_fcn             (_GEN_11),
    .io_req_uop_ctrl_fcn_dw             (_GEN_12),
    .io_req_uop_ctrl_csr_cmd            (_GEN_13),
    .io_req_uop_ctrl_is_load            (_GEN_14),
    .io_req_uop_ctrl_is_sta             (_GEN_15),
    .io_req_uop_ctrl_is_std             (_GEN_16),
    .io_req_uop_iw_state                (_GEN_17),
    .io_req_uop_iw_p1_poisoned          (_GEN_18),
    .io_req_uop_iw_p2_poisoned          (_GEN_19),
    .io_req_uop_is_br                   (_GEN_20),
    .io_req_uop_is_jalr                 (_GEN_21),
    .io_req_uop_is_jal                  (_GEN_22),
    .io_req_uop_is_sfb                  (_GEN_23),
    .io_req_uop_br_mask                 (_GEN_24),
    .io_req_uop_br_tag                  (_GEN_25),
    .io_req_uop_ftq_idx                 (_GEN_26),
    .io_req_uop_edge_inst               (_GEN_27),
    .io_req_uop_pc_lob                  (_GEN_28),
    .io_req_uop_taken                   (_GEN_29),
    .io_req_uop_imm_packed              (_GEN_30),
    .io_req_uop_csr_addr                (_GEN_31),
    .io_req_uop_rob_idx                 (_GEN_32),
    .io_req_uop_ldq_idx                 (_GEN_33),
    .io_req_uop_stq_idx                 (_GEN_34),
    .io_req_uop_rxq_idx                 (_GEN_35),
    .io_req_uop_pdst                    (_GEN_36),
    .io_req_uop_prs1                    (_GEN_37),
    .io_req_uop_prs2                    (_GEN_38),
    .io_req_uop_prs3                    (_GEN_39),
    .io_req_uop_ppred                   (_GEN_40),
    .io_req_uop_prs1_busy               (_GEN_41),
    .io_req_uop_prs2_busy               (_GEN_42),
    .io_req_uop_prs3_busy               (_GEN_43),
    .io_req_uop_ppred_busy              (_GEN_44),
    .io_req_uop_stale_pdst              (_GEN_45),
    .io_req_uop_exception               (_GEN_46),
    .io_req_uop_exc_cause               (_GEN_47),
    .io_req_uop_bypassable              (_GEN_48),
    .io_req_uop_mem_cmd                 (_GEN_49),
    .io_req_uop_mem_size                (_GEN_50),
    .io_req_uop_mem_signed              (_GEN_51),
    .io_req_uop_is_fence                (_GEN_52),
    .io_req_uop_is_fencei               (_GEN_53),
    .io_req_uop_is_amo                  (_GEN_54),
    .io_req_uop_uses_ldq                (_GEN_55),
    .io_req_uop_uses_stq                (_GEN_56),
    .io_req_uop_is_sys_pc2epc           (_GEN_57),
    .io_req_uop_is_unique               (_GEN_58),
    .io_req_uop_flush_on_commit         (_GEN_59),
    .io_req_uop_ldst_is_rs1             (_GEN_60),
    .io_req_uop_ldst                    (_GEN_61),
    .io_req_uop_lrs1                    (_GEN_62),
    .io_req_uop_lrs2                    (_GEN_63),
    .io_req_uop_lrs3                    (_GEN_64),
    .io_req_uop_ldst_val                (_GEN_65),
    .io_req_uop_dst_rtype               (_GEN_66),
    .io_req_uop_lrs1_rtype              (_GEN_67),
    .io_req_uop_lrs2_rtype              (_GEN_68),
    .io_req_uop_frs3_en                 (_GEN_69),
    .io_req_uop_fp_val                  (_GEN_70),
    .io_req_uop_fp_single               (_GEN_71),
    .io_req_uop_xcpt_pf_if              (_GEN_72),
    .io_req_uop_xcpt_ae_if              (_GEN_73),
    .io_req_uop_xcpt_ma_if              (_GEN_74),
    .io_req_uop_bp_debug_if             (_GEN_75),
    .io_req_uop_bp_xcpt_if              (_GEN_76),
    .io_req_uop_debug_fsrc              (_GEN_77),
    .io_req_uop_debug_tsrc              (_GEN_78),
    .io_req_addr                        (_cacheable_T_1),
    .io_req_data                        (_GEN_79),
    .io_req_is_hella                    (_GEN_80),
    .io_req_tag_match                   (_GEN_81),
    .io_req_old_meta_coh_state          (_GEN_82),
    .io_req_old_meta_tag                (_GEN_83),
    .io_req_way_en                      (_GEN_84),
    .io_req_sdq_id                      (sdq_alloc_id),
    .io_req_is_probe                    (io_req_is_probe_0),
    .io_idx_valid                       (_mshrs_0_io_idx_valid),
    .io_idx_bits                        (_mshrs_0_io_idx_bits),
    .io_way_valid                       (_mshrs_0_io_way_valid),
    .io_way_bits                        (_mshrs_0_io_way_bits),
    .io_tag_valid                       (_mshrs_0_io_tag_valid),
    .io_tag_bits                        (_mshrs_0_io_tag_bits),
    .io_mem_acquire_ready               (io_mem_acquire_ready & (idle | state_0)),
    .io_mem_acquire_valid               (_mshrs_0_io_mem_acquire_valid),
    .io_mem_acquire_bits_param          (_mshrs_0_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source         (_mshrs_0_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address        (_mshrs_0_io_mem_acquire_bits_address),
    .io_mem_grant_ready                 (_mshrs_0_io_mem_grant_ready),
    .io_mem_grant_valid                 (_GEN_95 & io_mem_grant_valid),
    .io_mem_grant_bits_opcode           (io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param            (io_mem_grant_bits_param),
    .io_mem_grant_bits_size             (io_mem_grant_bits_size),
    .io_mem_grant_bits_sink             (io_mem_grant_bits_sink),
    .io_mem_grant_bits_data             (io_mem_grant_bits_data),
    .io_mem_finish_ready                (io_mem_finish_ready & (~beatsLeft_1 | state_1_0)),
    .io_mem_finish_valid                (_mshrs_0_io_mem_finish_valid),
    .io_mem_finish_bits_sink            (_mshrs_0_io_mem_finish_bits_sink),
    .io_prober_state_valid              (io_prober_state_valid),
    .io_prober_state_bits               (io_prober_state_bits),
    .io_refill_ready                    (_refill_arb_io_in_0_ready),
    .io_refill_valid                    (_mshrs_0_io_refill_valid),
    .io_refill_bits_way_en              (_mshrs_0_io_refill_bits_way_en),
    .io_refill_bits_addr                (_mshrs_0_io_refill_bits_addr),
    .io_refill_bits_data                (_mshrs_0_io_refill_bits_data),
    .io_meta_write_ready                (_meta_write_arb_io_in_0_ready),
    .io_meta_write_valid                (_mshrs_0_io_meta_write_valid),
    .io_meta_write_bits_idx             (_mshrs_0_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en          (_mshrs_0_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state  (_mshrs_0_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag        (_mshrs_0_io_meta_write_bits_data_tag),
    .io_meta_read_ready                 (_meta_read_arb_io_in_0_ready),
    .io_meta_read_valid                 (_mshrs_0_io_meta_read_valid),
    .io_meta_read_bits_idx              (_mshrs_0_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en           (_mshrs_0_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag              (_mshrs_0_io_meta_read_bits_tag),
    .io_meta_resp_valid                 (io_meta_resp_valid),
    .io_meta_resp_bits_coh_state        (io_meta_resp_bits_coh_state),
    .io_wb_req_ready                    (_wb_req_arb_io_in_0_ready),
    .io_wb_req_valid                    (_mshrs_0_io_wb_req_valid),
    .io_wb_req_bits_tag                 (_mshrs_0_io_wb_req_bits_tag),
    .io_wb_req_bits_idx                 (_mshrs_0_io_wb_req_bits_idx),
    .io_wb_req_bits_param               (_mshrs_0_io_wb_req_bits_param),
    .io_wb_req_bits_way_en              (_mshrs_0_io_wb_req_bits_way_en),
    .io_commit_val                      (_mshrs_0_io_commit_val),
    .io_commit_addr                     (_mshrs_0_io_commit_addr),
    .io_commit_coh_state                (_mshrs_0_io_commit_coh_state),
    .io_lb_read_ready                   (_lb_read_arb_io_in_0_ready),
    .io_lb_read_valid                   (_mshrs_0_io_lb_read_valid),
    .io_lb_read_bits_id                 (_mshrs_0_io_lb_read_bits_id),
    .io_lb_read_bits_offset             (_mshrs_0_io_lb_read_bits_offset),
    .io_lb_resp                         (lb_read_data),
    .io_lb_write_ready                  (1'h1),
    .io_lb_write_valid                  (_mshrs_0_io_lb_write_valid),
    .io_lb_write_bits_id                (_mshrs_0_io_lb_write_bits_id),
    .io_lb_write_bits_offset            (_mshrs_0_io_lb_write_bits_offset),
    .io_lb_write_bits_data              (_mshrs_0_io_lb_write_bits_data),
    .io_replay_ready                    (_replay_arb_io_in_0_ready),
    .io_replay_valid                    (_mshrs_0_io_replay_valid),
    .io_replay_bits_uop_uopc            (_mshrs_0_io_replay_bits_uop_uopc),
    .io_replay_bits_uop_inst            (_mshrs_0_io_replay_bits_uop_inst),
    .io_replay_bits_uop_debug_inst      (_mshrs_0_io_replay_bits_uop_debug_inst),
    .io_replay_bits_uop_is_rvc          (_mshrs_0_io_replay_bits_uop_is_rvc),
    .io_replay_bits_uop_debug_pc        (_mshrs_0_io_replay_bits_uop_debug_pc),
    .io_replay_bits_uop_iq_type         (_mshrs_0_io_replay_bits_uop_iq_type),
    .io_replay_bits_uop_fu_code         (_mshrs_0_io_replay_bits_uop_fu_code),
    .io_replay_bits_uop_ctrl_br_type    (_mshrs_0_io_replay_bits_uop_ctrl_br_type),
    .io_replay_bits_uop_ctrl_op1_sel    (_mshrs_0_io_replay_bits_uop_ctrl_op1_sel),
    .io_replay_bits_uop_ctrl_op2_sel    (_mshrs_0_io_replay_bits_uop_ctrl_op2_sel),
    .io_replay_bits_uop_ctrl_imm_sel    (_mshrs_0_io_replay_bits_uop_ctrl_imm_sel),
    .io_replay_bits_uop_ctrl_op_fcn     (_mshrs_0_io_replay_bits_uop_ctrl_op_fcn),
    .io_replay_bits_uop_ctrl_fcn_dw     (_mshrs_0_io_replay_bits_uop_ctrl_fcn_dw),
    .io_replay_bits_uop_ctrl_csr_cmd    (_mshrs_0_io_replay_bits_uop_ctrl_csr_cmd),
    .io_replay_bits_uop_ctrl_is_load    (_mshrs_0_io_replay_bits_uop_ctrl_is_load),
    .io_replay_bits_uop_ctrl_is_sta     (_mshrs_0_io_replay_bits_uop_ctrl_is_sta),
    .io_replay_bits_uop_ctrl_is_std     (_mshrs_0_io_replay_bits_uop_ctrl_is_std),
    .io_replay_bits_uop_iw_state        (_mshrs_0_io_replay_bits_uop_iw_state),
    .io_replay_bits_uop_iw_p1_poisoned  (_mshrs_0_io_replay_bits_uop_iw_p1_poisoned),
    .io_replay_bits_uop_iw_p2_poisoned  (_mshrs_0_io_replay_bits_uop_iw_p2_poisoned),
    .io_replay_bits_uop_is_br           (_mshrs_0_io_replay_bits_uop_is_br),
    .io_replay_bits_uop_is_jalr         (_mshrs_0_io_replay_bits_uop_is_jalr),
    .io_replay_bits_uop_is_jal          (_mshrs_0_io_replay_bits_uop_is_jal),
    .io_replay_bits_uop_is_sfb          (_mshrs_0_io_replay_bits_uop_is_sfb),
    .io_replay_bits_uop_br_mask         (_mshrs_0_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_br_tag          (_mshrs_0_io_replay_bits_uop_br_tag),
    .io_replay_bits_uop_ftq_idx         (_mshrs_0_io_replay_bits_uop_ftq_idx),
    .io_replay_bits_uop_edge_inst       (_mshrs_0_io_replay_bits_uop_edge_inst),
    .io_replay_bits_uop_pc_lob          (_mshrs_0_io_replay_bits_uop_pc_lob),
    .io_replay_bits_uop_taken           (_mshrs_0_io_replay_bits_uop_taken),
    .io_replay_bits_uop_imm_packed      (_mshrs_0_io_replay_bits_uop_imm_packed),
    .io_replay_bits_uop_csr_addr        (_mshrs_0_io_replay_bits_uop_csr_addr),
    .io_replay_bits_uop_rob_idx         (_mshrs_0_io_replay_bits_uop_rob_idx),
    .io_replay_bits_uop_ldq_idx         (_mshrs_0_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx         (_mshrs_0_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_rxq_idx         (_mshrs_0_io_replay_bits_uop_rxq_idx),
    .io_replay_bits_uop_pdst            (_mshrs_0_io_replay_bits_uop_pdst),
    .io_replay_bits_uop_prs1            (_mshrs_0_io_replay_bits_uop_prs1),
    .io_replay_bits_uop_prs2            (_mshrs_0_io_replay_bits_uop_prs2),
    .io_replay_bits_uop_prs3            (_mshrs_0_io_replay_bits_uop_prs3),
    .io_replay_bits_uop_ppred           (_mshrs_0_io_replay_bits_uop_ppred),
    .io_replay_bits_uop_prs1_busy       (_mshrs_0_io_replay_bits_uop_prs1_busy),
    .io_replay_bits_uop_prs2_busy       (_mshrs_0_io_replay_bits_uop_prs2_busy),
    .io_replay_bits_uop_prs3_busy       (_mshrs_0_io_replay_bits_uop_prs3_busy),
    .io_replay_bits_uop_ppred_busy      (_mshrs_0_io_replay_bits_uop_ppred_busy),
    .io_replay_bits_uop_stale_pdst      (_mshrs_0_io_replay_bits_uop_stale_pdst),
    .io_replay_bits_uop_exception       (_mshrs_0_io_replay_bits_uop_exception),
    .io_replay_bits_uop_exc_cause       (_mshrs_0_io_replay_bits_uop_exc_cause),
    .io_replay_bits_uop_bypassable      (_mshrs_0_io_replay_bits_uop_bypassable),
    .io_replay_bits_uop_mem_cmd         (_mshrs_0_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size        (_mshrs_0_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed      (_mshrs_0_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_fence        (_mshrs_0_io_replay_bits_uop_is_fence),
    .io_replay_bits_uop_is_fencei       (_mshrs_0_io_replay_bits_uop_is_fencei),
    .io_replay_bits_uop_is_amo          (_mshrs_0_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq        (_mshrs_0_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq        (_mshrs_0_io_replay_bits_uop_uses_stq),
    .io_replay_bits_uop_is_sys_pc2epc   (_mshrs_0_io_replay_bits_uop_is_sys_pc2epc),
    .io_replay_bits_uop_is_unique       (_mshrs_0_io_replay_bits_uop_is_unique),
    .io_replay_bits_uop_flush_on_commit (_mshrs_0_io_replay_bits_uop_flush_on_commit),
    .io_replay_bits_uop_ldst_is_rs1     (_mshrs_0_io_replay_bits_uop_ldst_is_rs1),
    .io_replay_bits_uop_ldst            (_mshrs_0_io_replay_bits_uop_ldst),
    .io_replay_bits_uop_lrs1            (_mshrs_0_io_replay_bits_uop_lrs1),
    .io_replay_bits_uop_lrs2            (_mshrs_0_io_replay_bits_uop_lrs2),
    .io_replay_bits_uop_lrs3            (_mshrs_0_io_replay_bits_uop_lrs3),
    .io_replay_bits_uop_ldst_val        (_mshrs_0_io_replay_bits_uop_ldst_val),
    .io_replay_bits_uop_dst_rtype       (_mshrs_0_io_replay_bits_uop_dst_rtype),
    .io_replay_bits_uop_lrs1_rtype      (_mshrs_0_io_replay_bits_uop_lrs1_rtype),
    .io_replay_bits_uop_lrs2_rtype      (_mshrs_0_io_replay_bits_uop_lrs2_rtype),
    .io_replay_bits_uop_frs3_en         (_mshrs_0_io_replay_bits_uop_frs3_en),
    .io_replay_bits_uop_fp_val          (_mshrs_0_io_replay_bits_uop_fp_val),
    .io_replay_bits_uop_fp_single       (_mshrs_0_io_replay_bits_uop_fp_single),
    .io_replay_bits_uop_xcpt_pf_if      (_mshrs_0_io_replay_bits_uop_xcpt_pf_if),
    .io_replay_bits_uop_xcpt_ae_if      (_mshrs_0_io_replay_bits_uop_xcpt_ae_if),
    .io_replay_bits_uop_xcpt_ma_if      (_mshrs_0_io_replay_bits_uop_xcpt_ma_if),
    .io_replay_bits_uop_bp_debug_if     (_mshrs_0_io_replay_bits_uop_bp_debug_if),
    .io_replay_bits_uop_bp_xcpt_if      (_mshrs_0_io_replay_bits_uop_bp_xcpt_if),
    .io_replay_bits_uop_debug_fsrc      (_mshrs_0_io_replay_bits_uop_debug_fsrc),
    .io_replay_bits_uop_debug_tsrc      (_mshrs_0_io_replay_bits_uop_debug_tsrc),
    .io_replay_bits_addr                (_mshrs_0_io_replay_bits_addr),
    .io_replay_bits_is_hella            (_mshrs_0_io_replay_bits_is_hella),
    .io_replay_bits_way_en              (_mshrs_0_io_replay_bits_way_en),
    .io_replay_bits_sdq_id              (_mshrs_0_io_replay_bits_sdq_id),
    .io_resp_ready                      (_resp_arb_io_in_0_ready),
    .io_resp_valid                      (_mshrs_0_io_resp_valid),
    .io_resp_bits_uop_uopc              (_mshrs_0_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst              (_mshrs_0_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst        (_mshrs_0_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc            (_mshrs_0_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc          (_mshrs_0_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type           (_mshrs_0_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code           (_mshrs_0_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type      (_mshrs_0_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel      (_mshrs_0_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel      (_mshrs_0_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel      (_mshrs_0_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn       (_mshrs_0_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw       (_mshrs_0_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd      (_mshrs_0_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load      (_mshrs_0_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta       (_mshrs_0_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std       (_mshrs_0_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state          (_mshrs_0_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned    (_mshrs_0_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned    (_mshrs_0_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br             (_mshrs_0_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr           (_mshrs_0_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal            (_mshrs_0_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb            (_mshrs_0_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask           (_mshrs_0_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag            (_mshrs_0_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx           (_mshrs_0_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst         (_mshrs_0_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob            (_mshrs_0_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken             (_mshrs_0_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed        (_mshrs_0_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr          (_mshrs_0_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx           (_mshrs_0_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx           (_mshrs_0_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx           (_mshrs_0_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx           (_mshrs_0_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst              (_mshrs_0_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1              (_mshrs_0_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2              (_mshrs_0_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3              (_mshrs_0_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred             (_mshrs_0_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy         (_mshrs_0_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy         (_mshrs_0_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy         (_mshrs_0_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy        (_mshrs_0_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst        (_mshrs_0_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception         (_mshrs_0_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause         (_mshrs_0_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable        (_mshrs_0_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd           (_mshrs_0_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size          (_mshrs_0_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed        (_mshrs_0_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence          (_mshrs_0_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei         (_mshrs_0_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo            (_mshrs_0_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq          (_mshrs_0_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq          (_mshrs_0_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc     (_mshrs_0_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique         (_mshrs_0_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit   (_mshrs_0_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1       (_mshrs_0_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst              (_mshrs_0_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1              (_mshrs_0_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2              (_mshrs_0_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3              (_mshrs_0_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val          (_mshrs_0_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype         (_mshrs_0_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype        (_mshrs_0_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype        (_mshrs_0_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en           (_mshrs_0_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val            (_mshrs_0_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single         (_mshrs_0_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if        (_mshrs_0_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if        (_mshrs_0_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if        (_mshrs_0_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if       (_mshrs_0_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if        (_mshrs_0_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc        (_mshrs_0_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc        (_mshrs_0_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data                  (_mshrs_0_io_resp_bits_data),
    .io_resp_bits_is_hella              (_mshrs_0_io_resp_bits_is_hella),
    .io_wb_resp                         (io_wb_resp),
    .io_probe_rdy                       (_mshrs_0_io_probe_rdy)
  );
  BoomMSHR mshrs_1 (
    .clock                              (clock),
    .reset                              (reset),
    .io_id                              (3'h1),
    .io_req_pri_val                     (mshr_alloc_idx_REG == 3'h1 & pri_val),
    .io_req_pri_rdy                     (_mshrs_1_io_req_pri_rdy),
    .io_req_sec_val                     (_mshr_io_req_sec_val_T_7),
    .io_req_sec_rdy                     (_mshrs_1_io_req_sec_rdy),
    .io_clear_prefetch                  (io_clear_all & ~_GEN | _GEN & _GEN_88 & cacheable & ~_GEN_86 | io_req_is_probe_0 & _GEN_88),
    .io_brupdate_b1_resolve_mask        (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask     (io_brupdate_b1_mispredict_mask),
    .io_exception                       (io_exception),
    .io_req_uop_uopc                    (_GEN_0),
    .io_req_uop_inst                    (_GEN_1),
    .io_req_uop_debug_inst              (_GEN_2),
    .io_req_uop_is_rvc                  (_GEN_3),
    .io_req_uop_debug_pc                (_GEN_4),
    .io_req_uop_iq_type                 (_GEN_5),
    .io_req_uop_fu_code                 (_GEN_6),
    .io_req_uop_ctrl_br_type            (_GEN_7),
    .io_req_uop_ctrl_op1_sel            (_GEN_8),
    .io_req_uop_ctrl_op2_sel            (_GEN_9),
    .io_req_uop_ctrl_imm_sel            (_GEN_10),
    .io_req_uop_ctrl_op_fcn             (_GEN_11),
    .io_req_uop_ctrl_fcn_dw             (_GEN_12),
    .io_req_uop_ctrl_csr_cmd            (_GEN_13),
    .io_req_uop_ctrl_is_load            (_GEN_14),
    .io_req_uop_ctrl_is_sta             (_GEN_15),
    .io_req_uop_ctrl_is_std             (_GEN_16),
    .io_req_uop_iw_state                (_GEN_17),
    .io_req_uop_iw_p1_poisoned          (_GEN_18),
    .io_req_uop_iw_p2_poisoned          (_GEN_19),
    .io_req_uop_is_br                   (_GEN_20),
    .io_req_uop_is_jalr                 (_GEN_21),
    .io_req_uop_is_jal                  (_GEN_22),
    .io_req_uop_is_sfb                  (_GEN_23),
    .io_req_uop_br_mask                 (_GEN_24),
    .io_req_uop_br_tag                  (_GEN_25),
    .io_req_uop_ftq_idx                 (_GEN_26),
    .io_req_uop_edge_inst               (_GEN_27),
    .io_req_uop_pc_lob                  (_GEN_28),
    .io_req_uop_taken                   (_GEN_29),
    .io_req_uop_imm_packed              (_GEN_30),
    .io_req_uop_csr_addr                (_GEN_31),
    .io_req_uop_rob_idx                 (_GEN_32),
    .io_req_uop_ldq_idx                 (_GEN_33),
    .io_req_uop_stq_idx                 (_GEN_34),
    .io_req_uop_rxq_idx                 (_GEN_35),
    .io_req_uop_pdst                    (_GEN_36),
    .io_req_uop_prs1                    (_GEN_37),
    .io_req_uop_prs2                    (_GEN_38),
    .io_req_uop_prs3                    (_GEN_39),
    .io_req_uop_ppred                   (_GEN_40),
    .io_req_uop_prs1_busy               (_GEN_41),
    .io_req_uop_prs2_busy               (_GEN_42),
    .io_req_uop_prs3_busy               (_GEN_43),
    .io_req_uop_ppred_busy              (_GEN_44),
    .io_req_uop_stale_pdst              (_GEN_45),
    .io_req_uop_exception               (_GEN_46),
    .io_req_uop_exc_cause               (_GEN_47),
    .io_req_uop_bypassable              (_GEN_48),
    .io_req_uop_mem_cmd                 (_GEN_49),
    .io_req_uop_mem_size                (_GEN_50),
    .io_req_uop_mem_signed              (_GEN_51),
    .io_req_uop_is_fence                (_GEN_52),
    .io_req_uop_is_fencei               (_GEN_53),
    .io_req_uop_is_amo                  (_GEN_54),
    .io_req_uop_uses_ldq                (_GEN_55),
    .io_req_uop_uses_stq                (_GEN_56),
    .io_req_uop_is_sys_pc2epc           (_GEN_57),
    .io_req_uop_is_unique               (_GEN_58),
    .io_req_uop_flush_on_commit         (_GEN_59),
    .io_req_uop_ldst_is_rs1             (_GEN_60),
    .io_req_uop_ldst                    (_GEN_61),
    .io_req_uop_lrs1                    (_GEN_62),
    .io_req_uop_lrs2                    (_GEN_63),
    .io_req_uop_lrs3                    (_GEN_64),
    .io_req_uop_ldst_val                (_GEN_65),
    .io_req_uop_dst_rtype               (_GEN_66),
    .io_req_uop_lrs1_rtype              (_GEN_67),
    .io_req_uop_lrs2_rtype              (_GEN_68),
    .io_req_uop_frs3_en                 (_GEN_69),
    .io_req_uop_fp_val                  (_GEN_70),
    .io_req_uop_fp_single               (_GEN_71),
    .io_req_uop_xcpt_pf_if              (_GEN_72),
    .io_req_uop_xcpt_ae_if              (_GEN_73),
    .io_req_uop_xcpt_ma_if              (_GEN_74),
    .io_req_uop_bp_debug_if             (_GEN_75),
    .io_req_uop_bp_xcpt_if              (_GEN_76),
    .io_req_uop_debug_fsrc              (_GEN_77),
    .io_req_uop_debug_tsrc              (_GEN_78),
    .io_req_addr                        (_cacheable_T_1),
    .io_req_data                        (_GEN_79),
    .io_req_is_hella                    (_GEN_80),
    .io_req_tag_match                   (_GEN_81),
    .io_req_old_meta_coh_state          (_GEN_82),
    .io_req_old_meta_tag                (_GEN_83),
    .io_req_way_en                      (_GEN_84),
    .io_req_sdq_id                      (sdq_alloc_id),
    .io_req_is_probe                    (io_req_is_probe_0),
    .io_idx_valid                       (_mshrs_1_io_idx_valid),
    .io_idx_bits                        (_mshrs_1_io_idx_bits),
    .io_way_valid                       (_mshrs_1_io_way_valid),
    .io_way_bits                        (_mshrs_1_io_way_bits),
    .io_tag_valid                       (_mshrs_1_io_tag_valid),
    .io_tag_bits                        (_mshrs_1_io_tag_bits),
    .io_mem_acquire_ready               (io_mem_acquire_ready & (idle ? ~_mshrs_0_io_mem_acquire_valid : state_1)),
    .io_mem_acquire_valid               (_mshrs_1_io_mem_acquire_valid),
    .io_mem_acquire_bits_param          (_mshrs_1_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source         (_mshrs_1_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address        (_mshrs_1_io_mem_acquire_bits_address),
    .io_mem_grant_ready                 (_mshrs_1_io_mem_grant_ready),
    .io_mem_grant_valid                 (_GEN_96 & io_mem_grant_valid),
    .io_mem_grant_bits_opcode           (io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param            (io_mem_grant_bits_param),
    .io_mem_grant_bits_size             (io_mem_grant_bits_size),
    .io_mem_grant_bits_sink             (io_mem_grant_bits_sink),
    .io_mem_grant_bits_data             (io_mem_grant_bits_data),
    .io_mem_finish_ready                (io_mem_finish_ready & (beatsLeft_1 ? state_1_1 : ~_mshrs_0_io_mem_finish_valid)),
    .io_mem_finish_valid                (_mshrs_1_io_mem_finish_valid),
    .io_mem_finish_bits_sink            (_mshrs_1_io_mem_finish_bits_sink),
    .io_prober_state_valid              (io_prober_state_valid),
    .io_prober_state_bits               (io_prober_state_bits),
    .io_refill_ready                    (_refill_arb_io_in_1_ready),
    .io_refill_valid                    (_mshrs_1_io_refill_valid),
    .io_refill_bits_way_en              (_mshrs_1_io_refill_bits_way_en),
    .io_refill_bits_addr                (_mshrs_1_io_refill_bits_addr),
    .io_refill_bits_data                (_mshrs_1_io_refill_bits_data),
    .io_meta_write_ready                (_meta_write_arb_io_in_1_ready),
    .io_meta_write_valid                (_mshrs_1_io_meta_write_valid),
    .io_meta_write_bits_idx             (_mshrs_1_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en          (_mshrs_1_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state  (_mshrs_1_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag        (_mshrs_1_io_meta_write_bits_data_tag),
    .io_meta_read_ready                 (_meta_read_arb_io_in_1_ready),
    .io_meta_read_valid                 (_mshrs_1_io_meta_read_valid),
    .io_meta_read_bits_idx              (_mshrs_1_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en           (_mshrs_1_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag              (_mshrs_1_io_meta_read_bits_tag),
    .io_meta_resp_valid                 (io_meta_resp_valid),
    .io_meta_resp_bits_coh_state        (io_meta_resp_bits_coh_state),
    .io_wb_req_ready                    (_wb_req_arb_io_in_1_ready),
    .io_wb_req_valid                    (_mshrs_1_io_wb_req_valid),
    .io_wb_req_bits_tag                 (_mshrs_1_io_wb_req_bits_tag),
    .io_wb_req_bits_idx                 (_mshrs_1_io_wb_req_bits_idx),
    .io_wb_req_bits_param               (_mshrs_1_io_wb_req_bits_param),
    .io_wb_req_bits_way_en              (_mshrs_1_io_wb_req_bits_way_en),
    .io_commit_val                      (_mshrs_1_io_commit_val),
    .io_commit_addr                     (_mshrs_1_io_commit_addr),
    .io_commit_coh_state                (_mshrs_1_io_commit_coh_state),
    .io_lb_read_ready                   (_lb_read_arb_io_in_1_ready),
    .io_lb_read_valid                   (_mshrs_1_io_lb_read_valid),
    .io_lb_read_bits_id                 (_mshrs_1_io_lb_read_bits_id),
    .io_lb_read_bits_offset             (_mshrs_1_io_lb_read_bits_offset),
    .io_lb_resp                         (lb_read_data),
    .io_lb_write_ready                  (_lb_write_arb_io_in_1_ready),
    .io_lb_write_valid                  (_mshrs_1_io_lb_write_valid),
    .io_lb_write_bits_id                (_mshrs_1_io_lb_write_bits_id),
    .io_lb_write_bits_offset            (_mshrs_1_io_lb_write_bits_offset),
    .io_lb_write_bits_data              (_mshrs_1_io_lb_write_bits_data),
    .io_replay_ready                    (_replay_arb_io_in_1_ready),
    .io_replay_valid                    (_mshrs_1_io_replay_valid),
    .io_replay_bits_uop_uopc            (_mshrs_1_io_replay_bits_uop_uopc),
    .io_replay_bits_uop_inst            (_mshrs_1_io_replay_bits_uop_inst),
    .io_replay_bits_uop_debug_inst      (_mshrs_1_io_replay_bits_uop_debug_inst),
    .io_replay_bits_uop_is_rvc          (_mshrs_1_io_replay_bits_uop_is_rvc),
    .io_replay_bits_uop_debug_pc        (_mshrs_1_io_replay_bits_uop_debug_pc),
    .io_replay_bits_uop_iq_type         (_mshrs_1_io_replay_bits_uop_iq_type),
    .io_replay_bits_uop_fu_code         (_mshrs_1_io_replay_bits_uop_fu_code),
    .io_replay_bits_uop_ctrl_br_type    (_mshrs_1_io_replay_bits_uop_ctrl_br_type),
    .io_replay_bits_uop_ctrl_op1_sel    (_mshrs_1_io_replay_bits_uop_ctrl_op1_sel),
    .io_replay_bits_uop_ctrl_op2_sel    (_mshrs_1_io_replay_bits_uop_ctrl_op2_sel),
    .io_replay_bits_uop_ctrl_imm_sel    (_mshrs_1_io_replay_bits_uop_ctrl_imm_sel),
    .io_replay_bits_uop_ctrl_op_fcn     (_mshrs_1_io_replay_bits_uop_ctrl_op_fcn),
    .io_replay_bits_uop_ctrl_fcn_dw     (_mshrs_1_io_replay_bits_uop_ctrl_fcn_dw),
    .io_replay_bits_uop_ctrl_csr_cmd    (_mshrs_1_io_replay_bits_uop_ctrl_csr_cmd),
    .io_replay_bits_uop_ctrl_is_load    (_mshrs_1_io_replay_bits_uop_ctrl_is_load),
    .io_replay_bits_uop_ctrl_is_sta     (_mshrs_1_io_replay_bits_uop_ctrl_is_sta),
    .io_replay_bits_uop_ctrl_is_std     (_mshrs_1_io_replay_bits_uop_ctrl_is_std),
    .io_replay_bits_uop_iw_state        (_mshrs_1_io_replay_bits_uop_iw_state),
    .io_replay_bits_uop_iw_p1_poisoned  (_mshrs_1_io_replay_bits_uop_iw_p1_poisoned),
    .io_replay_bits_uop_iw_p2_poisoned  (_mshrs_1_io_replay_bits_uop_iw_p2_poisoned),
    .io_replay_bits_uop_is_br           (_mshrs_1_io_replay_bits_uop_is_br),
    .io_replay_bits_uop_is_jalr         (_mshrs_1_io_replay_bits_uop_is_jalr),
    .io_replay_bits_uop_is_jal          (_mshrs_1_io_replay_bits_uop_is_jal),
    .io_replay_bits_uop_is_sfb          (_mshrs_1_io_replay_bits_uop_is_sfb),
    .io_replay_bits_uop_br_mask         (_mshrs_1_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_br_tag          (_mshrs_1_io_replay_bits_uop_br_tag),
    .io_replay_bits_uop_ftq_idx         (_mshrs_1_io_replay_bits_uop_ftq_idx),
    .io_replay_bits_uop_edge_inst       (_mshrs_1_io_replay_bits_uop_edge_inst),
    .io_replay_bits_uop_pc_lob          (_mshrs_1_io_replay_bits_uop_pc_lob),
    .io_replay_bits_uop_taken           (_mshrs_1_io_replay_bits_uop_taken),
    .io_replay_bits_uop_imm_packed      (_mshrs_1_io_replay_bits_uop_imm_packed),
    .io_replay_bits_uop_csr_addr        (_mshrs_1_io_replay_bits_uop_csr_addr),
    .io_replay_bits_uop_rob_idx         (_mshrs_1_io_replay_bits_uop_rob_idx),
    .io_replay_bits_uop_ldq_idx         (_mshrs_1_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx         (_mshrs_1_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_rxq_idx         (_mshrs_1_io_replay_bits_uop_rxq_idx),
    .io_replay_bits_uop_pdst            (_mshrs_1_io_replay_bits_uop_pdst),
    .io_replay_bits_uop_prs1            (_mshrs_1_io_replay_bits_uop_prs1),
    .io_replay_bits_uop_prs2            (_mshrs_1_io_replay_bits_uop_prs2),
    .io_replay_bits_uop_prs3            (_mshrs_1_io_replay_bits_uop_prs3),
    .io_replay_bits_uop_ppred           (_mshrs_1_io_replay_bits_uop_ppred),
    .io_replay_bits_uop_prs1_busy       (_mshrs_1_io_replay_bits_uop_prs1_busy),
    .io_replay_bits_uop_prs2_busy       (_mshrs_1_io_replay_bits_uop_prs2_busy),
    .io_replay_bits_uop_prs3_busy       (_mshrs_1_io_replay_bits_uop_prs3_busy),
    .io_replay_bits_uop_ppred_busy      (_mshrs_1_io_replay_bits_uop_ppred_busy),
    .io_replay_bits_uop_stale_pdst      (_mshrs_1_io_replay_bits_uop_stale_pdst),
    .io_replay_bits_uop_exception       (_mshrs_1_io_replay_bits_uop_exception),
    .io_replay_bits_uop_exc_cause       (_mshrs_1_io_replay_bits_uop_exc_cause),
    .io_replay_bits_uop_bypassable      (_mshrs_1_io_replay_bits_uop_bypassable),
    .io_replay_bits_uop_mem_cmd         (_mshrs_1_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size        (_mshrs_1_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed      (_mshrs_1_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_fence        (_mshrs_1_io_replay_bits_uop_is_fence),
    .io_replay_bits_uop_is_fencei       (_mshrs_1_io_replay_bits_uop_is_fencei),
    .io_replay_bits_uop_is_amo          (_mshrs_1_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq        (_mshrs_1_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq        (_mshrs_1_io_replay_bits_uop_uses_stq),
    .io_replay_bits_uop_is_sys_pc2epc   (_mshrs_1_io_replay_bits_uop_is_sys_pc2epc),
    .io_replay_bits_uop_is_unique       (_mshrs_1_io_replay_bits_uop_is_unique),
    .io_replay_bits_uop_flush_on_commit (_mshrs_1_io_replay_bits_uop_flush_on_commit),
    .io_replay_bits_uop_ldst_is_rs1     (_mshrs_1_io_replay_bits_uop_ldst_is_rs1),
    .io_replay_bits_uop_ldst            (_mshrs_1_io_replay_bits_uop_ldst),
    .io_replay_bits_uop_lrs1            (_mshrs_1_io_replay_bits_uop_lrs1),
    .io_replay_bits_uop_lrs2            (_mshrs_1_io_replay_bits_uop_lrs2),
    .io_replay_bits_uop_lrs3            (_mshrs_1_io_replay_bits_uop_lrs3),
    .io_replay_bits_uop_ldst_val        (_mshrs_1_io_replay_bits_uop_ldst_val),
    .io_replay_bits_uop_dst_rtype       (_mshrs_1_io_replay_bits_uop_dst_rtype),
    .io_replay_bits_uop_lrs1_rtype      (_mshrs_1_io_replay_bits_uop_lrs1_rtype),
    .io_replay_bits_uop_lrs2_rtype      (_mshrs_1_io_replay_bits_uop_lrs2_rtype),
    .io_replay_bits_uop_frs3_en         (_mshrs_1_io_replay_bits_uop_frs3_en),
    .io_replay_bits_uop_fp_val          (_mshrs_1_io_replay_bits_uop_fp_val),
    .io_replay_bits_uop_fp_single       (_mshrs_1_io_replay_bits_uop_fp_single),
    .io_replay_bits_uop_xcpt_pf_if      (_mshrs_1_io_replay_bits_uop_xcpt_pf_if),
    .io_replay_bits_uop_xcpt_ae_if      (_mshrs_1_io_replay_bits_uop_xcpt_ae_if),
    .io_replay_bits_uop_xcpt_ma_if      (_mshrs_1_io_replay_bits_uop_xcpt_ma_if),
    .io_replay_bits_uop_bp_debug_if     (_mshrs_1_io_replay_bits_uop_bp_debug_if),
    .io_replay_bits_uop_bp_xcpt_if      (_mshrs_1_io_replay_bits_uop_bp_xcpt_if),
    .io_replay_bits_uop_debug_fsrc      (_mshrs_1_io_replay_bits_uop_debug_fsrc),
    .io_replay_bits_uop_debug_tsrc      (_mshrs_1_io_replay_bits_uop_debug_tsrc),
    .io_replay_bits_addr                (_mshrs_1_io_replay_bits_addr),
    .io_replay_bits_is_hella            (_mshrs_1_io_replay_bits_is_hella),
    .io_replay_bits_way_en              (_mshrs_1_io_replay_bits_way_en),
    .io_replay_bits_sdq_id              (_mshrs_1_io_replay_bits_sdq_id),
    .io_resp_ready                      (_resp_arb_io_in_1_ready),
    .io_resp_valid                      (_mshrs_1_io_resp_valid),
    .io_resp_bits_uop_uopc              (_mshrs_1_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst              (_mshrs_1_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst        (_mshrs_1_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc            (_mshrs_1_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc          (_mshrs_1_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type           (_mshrs_1_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code           (_mshrs_1_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type      (_mshrs_1_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel      (_mshrs_1_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel      (_mshrs_1_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel      (_mshrs_1_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn       (_mshrs_1_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw       (_mshrs_1_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd      (_mshrs_1_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load      (_mshrs_1_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta       (_mshrs_1_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std       (_mshrs_1_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state          (_mshrs_1_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned    (_mshrs_1_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned    (_mshrs_1_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br             (_mshrs_1_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr           (_mshrs_1_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal            (_mshrs_1_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb            (_mshrs_1_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask           (_mshrs_1_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag            (_mshrs_1_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx           (_mshrs_1_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst         (_mshrs_1_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob            (_mshrs_1_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken             (_mshrs_1_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed        (_mshrs_1_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr          (_mshrs_1_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx           (_mshrs_1_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx           (_mshrs_1_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx           (_mshrs_1_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx           (_mshrs_1_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst              (_mshrs_1_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1              (_mshrs_1_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2              (_mshrs_1_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3              (_mshrs_1_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred             (_mshrs_1_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy         (_mshrs_1_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy         (_mshrs_1_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy         (_mshrs_1_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy        (_mshrs_1_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst        (_mshrs_1_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception         (_mshrs_1_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause         (_mshrs_1_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable        (_mshrs_1_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd           (_mshrs_1_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size          (_mshrs_1_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed        (_mshrs_1_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence          (_mshrs_1_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei         (_mshrs_1_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo            (_mshrs_1_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq          (_mshrs_1_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq          (_mshrs_1_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc     (_mshrs_1_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique         (_mshrs_1_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit   (_mshrs_1_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1       (_mshrs_1_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst              (_mshrs_1_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1              (_mshrs_1_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2              (_mshrs_1_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3              (_mshrs_1_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val          (_mshrs_1_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype         (_mshrs_1_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype        (_mshrs_1_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype        (_mshrs_1_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en           (_mshrs_1_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val            (_mshrs_1_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single         (_mshrs_1_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if        (_mshrs_1_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if        (_mshrs_1_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if        (_mshrs_1_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if       (_mshrs_1_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if        (_mshrs_1_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc        (_mshrs_1_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc        (_mshrs_1_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data                  (_mshrs_1_io_resp_bits_data),
    .io_resp_bits_is_hella              (_mshrs_1_io_resp_bits_is_hella),
    .io_wb_resp                         (io_wb_resp),
    .io_probe_rdy                       (_mshrs_1_io_probe_rdy)
  );
  BoomMSHR mshrs_2 (
    .clock                              (clock),
    .reset                              (reset),
    .io_id                              (3'h2),
    .io_req_pri_val                     (mshr_alloc_idx_REG == 3'h2 & pri_val),
    .io_req_pri_rdy                     (_mshrs_2_io_req_pri_rdy),
    .io_req_sec_val                     (_mshr_io_req_sec_val_T_11),
    .io_req_sec_rdy                     (_mshrs_2_io_req_sec_rdy),
    .io_clear_prefetch                  (io_clear_all & ~_GEN | _GEN & _GEN_89 & cacheable & ~_GEN_86 | io_req_is_probe_0 & _GEN_89),
    .io_brupdate_b1_resolve_mask        (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask     (io_brupdate_b1_mispredict_mask),
    .io_exception                       (io_exception),
    .io_req_uop_uopc                    (_GEN_0),
    .io_req_uop_inst                    (_GEN_1),
    .io_req_uop_debug_inst              (_GEN_2),
    .io_req_uop_is_rvc                  (_GEN_3),
    .io_req_uop_debug_pc                (_GEN_4),
    .io_req_uop_iq_type                 (_GEN_5),
    .io_req_uop_fu_code                 (_GEN_6),
    .io_req_uop_ctrl_br_type            (_GEN_7),
    .io_req_uop_ctrl_op1_sel            (_GEN_8),
    .io_req_uop_ctrl_op2_sel            (_GEN_9),
    .io_req_uop_ctrl_imm_sel            (_GEN_10),
    .io_req_uop_ctrl_op_fcn             (_GEN_11),
    .io_req_uop_ctrl_fcn_dw             (_GEN_12),
    .io_req_uop_ctrl_csr_cmd            (_GEN_13),
    .io_req_uop_ctrl_is_load            (_GEN_14),
    .io_req_uop_ctrl_is_sta             (_GEN_15),
    .io_req_uop_ctrl_is_std             (_GEN_16),
    .io_req_uop_iw_state                (_GEN_17),
    .io_req_uop_iw_p1_poisoned          (_GEN_18),
    .io_req_uop_iw_p2_poisoned          (_GEN_19),
    .io_req_uop_is_br                   (_GEN_20),
    .io_req_uop_is_jalr                 (_GEN_21),
    .io_req_uop_is_jal                  (_GEN_22),
    .io_req_uop_is_sfb                  (_GEN_23),
    .io_req_uop_br_mask                 (_GEN_24),
    .io_req_uop_br_tag                  (_GEN_25),
    .io_req_uop_ftq_idx                 (_GEN_26),
    .io_req_uop_edge_inst               (_GEN_27),
    .io_req_uop_pc_lob                  (_GEN_28),
    .io_req_uop_taken                   (_GEN_29),
    .io_req_uop_imm_packed              (_GEN_30),
    .io_req_uop_csr_addr                (_GEN_31),
    .io_req_uop_rob_idx                 (_GEN_32),
    .io_req_uop_ldq_idx                 (_GEN_33),
    .io_req_uop_stq_idx                 (_GEN_34),
    .io_req_uop_rxq_idx                 (_GEN_35),
    .io_req_uop_pdst                    (_GEN_36),
    .io_req_uop_prs1                    (_GEN_37),
    .io_req_uop_prs2                    (_GEN_38),
    .io_req_uop_prs3                    (_GEN_39),
    .io_req_uop_ppred                   (_GEN_40),
    .io_req_uop_prs1_busy               (_GEN_41),
    .io_req_uop_prs2_busy               (_GEN_42),
    .io_req_uop_prs3_busy               (_GEN_43),
    .io_req_uop_ppred_busy              (_GEN_44),
    .io_req_uop_stale_pdst              (_GEN_45),
    .io_req_uop_exception               (_GEN_46),
    .io_req_uop_exc_cause               (_GEN_47),
    .io_req_uop_bypassable              (_GEN_48),
    .io_req_uop_mem_cmd                 (_GEN_49),
    .io_req_uop_mem_size                (_GEN_50),
    .io_req_uop_mem_signed              (_GEN_51),
    .io_req_uop_is_fence                (_GEN_52),
    .io_req_uop_is_fencei               (_GEN_53),
    .io_req_uop_is_amo                  (_GEN_54),
    .io_req_uop_uses_ldq                (_GEN_55),
    .io_req_uop_uses_stq                (_GEN_56),
    .io_req_uop_is_sys_pc2epc           (_GEN_57),
    .io_req_uop_is_unique               (_GEN_58),
    .io_req_uop_flush_on_commit         (_GEN_59),
    .io_req_uop_ldst_is_rs1             (_GEN_60),
    .io_req_uop_ldst                    (_GEN_61),
    .io_req_uop_lrs1                    (_GEN_62),
    .io_req_uop_lrs2                    (_GEN_63),
    .io_req_uop_lrs3                    (_GEN_64),
    .io_req_uop_ldst_val                (_GEN_65),
    .io_req_uop_dst_rtype               (_GEN_66),
    .io_req_uop_lrs1_rtype              (_GEN_67),
    .io_req_uop_lrs2_rtype              (_GEN_68),
    .io_req_uop_frs3_en                 (_GEN_69),
    .io_req_uop_fp_val                  (_GEN_70),
    .io_req_uop_fp_single               (_GEN_71),
    .io_req_uop_xcpt_pf_if              (_GEN_72),
    .io_req_uop_xcpt_ae_if              (_GEN_73),
    .io_req_uop_xcpt_ma_if              (_GEN_74),
    .io_req_uop_bp_debug_if             (_GEN_75),
    .io_req_uop_bp_xcpt_if              (_GEN_76),
    .io_req_uop_debug_fsrc              (_GEN_77),
    .io_req_uop_debug_tsrc              (_GEN_78),
    .io_req_addr                        (_cacheable_T_1),
    .io_req_data                        (_GEN_79),
    .io_req_is_hella                    (_GEN_80),
    .io_req_tag_match                   (_GEN_81),
    .io_req_old_meta_coh_state          (_GEN_82),
    .io_req_old_meta_tag                (_GEN_83),
    .io_req_way_en                      (_GEN_84),
    .io_req_sdq_id                      (sdq_alloc_id),
    .io_req_is_probe                    (io_req_is_probe_0),
    .io_idx_valid                       (_mshrs_2_io_idx_valid),
    .io_idx_bits                        (_mshrs_2_io_idx_bits),
    .io_way_valid                       (_mshrs_2_io_way_valid),
    .io_way_bits                        (_mshrs_2_io_way_bits),
    .io_tag_valid                       (_mshrs_2_io_tag_valid),
    .io_tag_bits                        (_mshrs_2_io_tag_bits),
    .io_mem_acquire_ready               (io_mem_acquire_ready & (idle ? ~_GEN_108 : state_2)),
    .io_mem_acquire_valid               (_mshrs_2_io_mem_acquire_valid),
    .io_mem_acquire_bits_param          (_mshrs_2_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source         (_mshrs_2_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address        (_mshrs_2_io_mem_acquire_bits_address),
    .io_mem_grant_ready                 (_mshrs_2_io_mem_grant_ready),
    .io_mem_grant_valid                 (_GEN_97 & io_mem_grant_valid),
    .io_mem_grant_bits_opcode           (io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param            (io_mem_grant_bits_param),
    .io_mem_grant_bits_size             (io_mem_grant_bits_size),
    .io_mem_grant_bits_sink             (io_mem_grant_bits_sink),
    .io_mem_grant_bits_data             (io_mem_grant_bits_data),
    .io_mem_finish_ready                (io_mem_finish_ready & (beatsLeft_1 ? state_1_2 : ~_GEN_119)),
    .io_mem_finish_valid                (_mshrs_2_io_mem_finish_valid),
    .io_mem_finish_bits_sink            (_mshrs_2_io_mem_finish_bits_sink),
    .io_prober_state_valid              (io_prober_state_valid),
    .io_prober_state_bits               (io_prober_state_bits),
    .io_refill_ready                    (_refill_arb_io_in_2_ready),
    .io_refill_valid                    (_mshrs_2_io_refill_valid),
    .io_refill_bits_way_en              (_mshrs_2_io_refill_bits_way_en),
    .io_refill_bits_addr                (_mshrs_2_io_refill_bits_addr),
    .io_refill_bits_data                (_mshrs_2_io_refill_bits_data),
    .io_meta_write_ready                (_meta_write_arb_io_in_2_ready),
    .io_meta_write_valid                (_mshrs_2_io_meta_write_valid),
    .io_meta_write_bits_idx             (_mshrs_2_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en          (_mshrs_2_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state  (_mshrs_2_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag        (_mshrs_2_io_meta_write_bits_data_tag),
    .io_meta_read_ready                 (_meta_read_arb_io_in_2_ready),
    .io_meta_read_valid                 (_mshrs_2_io_meta_read_valid),
    .io_meta_read_bits_idx              (_mshrs_2_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en           (_mshrs_2_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag              (_mshrs_2_io_meta_read_bits_tag),
    .io_meta_resp_valid                 (io_meta_resp_valid),
    .io_meta_resp_bits_coh_state        (io_meta_resp_bits_coh_state),
    .io_wb_req_ready                    (_wb_req_arb_io_in_2_ready),
    .io_wb_req_valid                    (_mshrs_2_io_wb_req_valid),
    .io_wb_req_bits_tag                 (_mshrs_2_io_wb_req_bits_tag),
    .io_wb_req_bits_idx                 (_mshrs_2_io_wb_req_bits_idx),
    .io_wb_req_bits_param               (_mshrs_2_io_wb_req_bits_param),
    .io_wb_req_bits_way_en              (_mshrs_2_io_wb_req_bits_way_en),
    .io_commit_val                      (_mshrs_2_io_commit_val),
    .io_commit_addr                     (_mshrs_2_io_commit_addr),
    .io_commit_coh_state                (_mshrs_2_io_commit_coh_state),
    .io_lb_read_ready                   (_lb_read_arb_io_in_2_ready),
    .io_lb_read_valid                   (_mshrs_2_io_lb_read_valid),
    .io_lb_read_bits_id                 (_mshrs_2_io_lb_read_bits_id),
    .io_lb_read_bits_offset             (_mshrs_2_io_lb_read_bits_offset),
    .io_lb_resp                         (lb_read_data),
    .io_lb_write_ready                  (_lb_write_arb_io_in_2_ready),
    .io_lb_write_valid                  (_mshrs_2_io_lb_write_valid),
    .io_lb_write_bits_id                (_mshrs_2_io_lb_write_bits_id),
    .io_lb_write_bits_offset            (_mshrs_2_io_lb_write_bits_offset),
    .io_lb_write_bits_data              (_mshrs_2_io_lb_write_bits_data),
    .io_replay_ready                    (_replay_arb_io_in_2_ready),
    .io_replay_valid                    (_mshrs_2_io_replay_valid),
    .io_replay_bits_uop_uopc            (_mshrs_2_io_replay_bits_uop_uopc),
    .io_replay_bits_uop_inst            (_mshrs_2_io_replay_bits_uop_inst),
    .io_replay_bits_uop_debug_inst      (_mshrs_2_io_replay_bits_uop_debug_inst),
    .io_replay_bits_uop_is_rvc          (_mshrs_2_io_replay_bits_uop_is_rvc),
    .io_replay_bits_uop_debug_pc        (_mshrs_2_io_replay_bits_uop_debug_pc),
    .io_replay_bits_uop_iq_type         (_mshrs_2_io_replay_bits_uop_iq_type),
    .io_replay_bits_uop_fu_code         (_mshrs_2_io_replay_bits_uop_fu_code),
    .io_replay_bits_uop_ctrl_br_type    (_mshrs_2_io_replay_bits_uop_ctrl_br_type),
    .io_replay_bits_uop_ctrl_op1_sel    (_mshrs_2_io_replay_bits_uop_ctrl_op1_sel),
    .io_replay_bits_uop_ctrl_op2_sel    (_mshrs_2_io_replay_bits_uop_ctrl_op2_sel),
    .io_replay_bits_uop_ctrl_imm_sel    (_mshrs_2_io_replay_bits_uop_ctrl_imm_sel),
    .io_replay_bits_uop_ctrl_op_fcn     (_mshrs_2_io_replay_bits_uop_ctrl_op_fcn),
    .io_replay_bits_uop_ctrl_fcn_dw     (_mshrs_2_io_replay_bits_uop_ctrl_fcn_dw),
    .io_replay_bits_uop_ctrl_csr_cmd    (_mshrs_2_io_replay_bits_uop_ctrl_csr_cmd),
    .io_replay_bits_uop_ctrl_is_load    (_mshrs_2_io_replay_bits_uop_ctrl_is_load),
    .io_replay_bits_uop_ctrl_is_sta     (_mshrs_2_io_replay_bits_uop_ctrl_is_sta),
    .io_replay_bits_uop_ctrl_is_std     (_mshrs_2_io_replay_bits_uop_ctrl_is_std),
    .io_replay_bits_uop_iw_state        (_mshrs_2_io_replay_bits_uop_iw_state),
    .io_replay_bits_uop_iw_p1_poisoned  (_mshrs_2_io_replay_bits_uop_iw_p1_poisoned),
    .io_replay_bits_uop_iw_p2_poisoned  (_mshrs_2_io_replay_bits_uop_iw_p2_poisoned),
    .io_replay_bits_uop_is_br           (_mshrs_2_io_replay_bits_uop_is_br),
    .io_replay_bits_uop_is_jalr         (_mshrs_2_io_replay_bits_uop_is_jalr),
    .io_replay_bits_uop_is_jal          (_mshrs_2_io_replay_bits_uop_is_jal),
    .io_replay_bits_uop_is_sfb          (_mshrs_2_io_replay_bits_uop_is_sfb),
    .io_replay_bits_uop_br_mask         (_mshrs_2_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_br_tag          (_mshrs_2_io_replay_bits_uop_br_tag),
    .io_replay_bits_uop_ftq_idx         (_mshrs_2_io_replay_bits_uop_ftq_idx),
    .io_replay_bits_uop_edge_inst       (_mshrs_2_io_replay_bits_uop_edge_inst),
    .io_replay_bits_uop_pc_lob          (_mshrs_2_io_replay_bits_uop_pc_lob),
    .io_replay_bits_uop_taken           (_mshrs_2_io_replay_bits_uop_taken),
    .io_replay_bits_uop_imm_packed      (_mshrs_2_io_replay_bits_uop_imm_packed),
    .io_replay_bits_uop_csr_addr        (_mshrs_2_io_replay_bits_uop_csr_addr),
    .io_replay_bits_uop_rob_idx         (_mshrs_2_io_replay_bits_uop_rob_idx),
    .io_replay_bits_uop_ldq_idx         (_mshrs_2_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx         (_mshrs_2_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_rxq_idx         (_mshrs_2_io_replay_bits_uop_rxq_idx),
    .io_replay_bits_uop_pdst            (_mshrs_2_io_replay_bits_uop_pdst),
    .io_replay_bits_uop_prs1            (_mshrs_2_io_replay_bits_uop_prs1),
    .io_replay_bits_uop_prs2            (_mshrs_2_io_replay_bits_uop_prs2),
    .io_replay_bits_uop_prs3            (_mshrs_2_io_replay_bits_uop_prs3),
    .io_replay_bits_uop_ppred           (_mshrs_2_io_replay_bits_uop_ppred),
    .io_replay_bits_uop_prs1_busy       (_mshrs_2_io_replay_bits_uop_prs1_busy),
    .io_replay_bits_uop_prs2_busy       (_mshrs_2_io_replay_bits_uop_prs2_busy),
    .io_replay_bits_uop_prs3_busy       (_mshrs_2_io_replay_bits_uop_prs3_busy),
    .io_replay_bits_uop_ppred_busy      (_mshrs_2_io_replay_bits_uop_ppred_busy),
    .io_replay_bits_uop_stale_pdst      (_mshrs_2_io_replay_bits_uop_stale_pdst),
    .io_replay_bits_uop_exception       (_mshrs_2_io_replay_bits_uop_exception),
    .io_replay_bits_uop_exc_cause       (_mshrs_2_io_replay_bits_uop_exc_cause),
    .io_replay_bits_uop_bypassable      (_mshrs_2_io_replay_bits_uop_bypassable),
    .io_replay_bits_uop_mem_cmd         (_mshrs_2_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size        (_mshrs_2_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed      (_mshrs_2_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_fence        (_mshrs_2_io_replay_bits_uop_is_fence),
    .io_replay_bits_uop_is_fencei       (_mshrs_2_io_replay_bits_uop_is_fencei),
    .io_replay_bits_uop_is_amo          (_mshrs_2_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq        (_mshrs_2_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq        (_mshrs_2_io_replay_bits_uop_uses_stq),
    .io_replay_bits_uop_is_sys_pc2epc   (_mshrs_2_io_replay_bits_uop_is_sys_pc2epc),
    .io_replay_bits_uop_is_unique       (_mshrs_2_io_replay_bits_uop_is_unique),
    .io_replay_bits_uop_flush_on_commit (_mshrs_2_io_replay_bits_uop_flush_on_commit),
    .io_replay_bits_uop_ldst_is_rs1     (_mshrs_2_io_replay_bits_uop_ldst_is_rs1),
    .io_replay_bits_uop_ldst            (_mshrs_2_io_replay_bits_uop_ldst),
    .io_replay_bits_uop_lrs1            (_mshrs_2_io_replay_bits_uop_lrs1),
    .io_replay_bits_uop_lrs2            (_mshrs_2_io_replay_bits_uop_lrs2),
    .io_replay_bits_uop_lrs3            (_mshrs_2_io_replay_bits_uop_lrs3),
    .io_replay_bits_uop_ldst_val        (_mshrs_2_io_replay_bits_uop_ldst_val),
    .io_replay_bits_uop_dst_rtype       (_mshrs_2_io_replay_bits_uop_dst_rtype),
    .io_replay_bits_uop_lrs1_rtype      (_mshrs_2_io_replay_bits_uop_lrs1_rtype),
    .io_replay_bits_uop_lrs2_rtype      (_mshrs_2_io_replay_bits_uop_lrs2_rtype),
    .io_replay_bits_uop_frs3_en         (_mshrs_2_io_replay_bits_uop_frs3_en),
    .io_replay_bits_uop_fp_val          (_mshrs_2_io_replay_bits_uop_fp_val),
    .io_replay_bits_uop_fp_single       (_mshrs_2_io_replay_bits_uop_fp_single),
    .io_replay_bits_uop_xcpt_pf_if      (_mshrs_2_io_replay_bits_uop_xcpt_pf_if),
    .io_replay_bits_uop_xcpt_ae_if      (_mshrs_2_io_replay_bits_uop_xcpt_ae_if),
    .io_replay_bits_uop_xcpt_ma_if      (_mshrs_2_io_replay_bits_uop_xcpt_ma_if),
    .io_replay_bits_uop_bp_debug_if     (_mshrs_2_io_replay_bits_uop_bp_debug_if),
    .io_replay_bits_uop_bp_xcpt_if      (_mshrs_2_io_replay_bits_uop_bp_xcpt_if),
    .io_replay_bits_uop_debug_fsrc      (_mshrs_2_io_replay_bits_uop_debug_fsrc),
    .io_replay_bits_uop_debug_tsrc      (_mshrs_2_io_replay_bits_uop_debug_tsrc),
    .io_replay_bits_addr                (_mshrs_2_io_replay_bits_addr),
    .io_replay_bits_is_hella            (_mshrs_2_io_replay_bits_is_hella),
    .io_replay_bits_way_en              (_mshrs_2_io_replay_bits_way_en),
    .io_replay_bits_sdq_id              (_mshrs_2_io_replay_bits_sdq_id),
    .io_resp_ready                      (_resp_arb_io_in_2_ready),
    .io_resp_valid                      (_mshrs_2_io_resp_valid),
    .io_resp_bits_uop_uopc              (_mshrs_2_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst              (_mshrs_2_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst        (_mshrs_2_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc            (_mshrs_2_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc          (_mshrs_2_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type           (_mshrs_2_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code           (_mshrs_2_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type      (_mshrs_2_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel      (_mshrs_2_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel      (_mshrs_2_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel      (_mshrs_2_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn       (_mshrs_2_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw       (_mshrs_2_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd      (_mshrs_2_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load      (_mshrs_2_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta       (_mshrs_2_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std       (_mshrs_2_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state          (_mshrs_2_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned    (_mshrs_2_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned    (_mshrs_2_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br             (_mshrs_2_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr           (_mshrs_2_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal            (_mshrs_2_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb            (_mshrs_2_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask           (_mshrs_2_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag            (_mshrs_2_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx           (_mshrs_2_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst         (_mshrs_2_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob            (_mshrs_2_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken             (_mshrs_2_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed        (_mshrs_2_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr          (_mshrs_2_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx           (_mshrs_2_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx           (_mshrs_2_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx           (_mshrs_2_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx           (_mshrs_2_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst              (_mshrs_2_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1              (_mshrs_2_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2              (_mshrs_2_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3              (_mshrs_2_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred             (_mshrs_2_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy         (_mshrs_2_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy         (_mshrs_2_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy         (_mshrs_2_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy        (_mshrs_2_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst        (_mshrs_2_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception         (_mshrs_2_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause         (_mshrs_2_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable        (_mshrs_2_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd           (_mshrs_2_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size          (_mshrs_2_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed        (_mshrs_2_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence          (_mshrs_2_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei         (_mshrs_2_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo            (_mshrs_2_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq          (_mshrs_2_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq          (_mshrs_2_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc     (_mshrs_2_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique         (_mshrs_2_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit   (_mshrs_2_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1       (_mshrs_2_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst              (_mshrs_2_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1              (_mshrs_2_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2              (_mshrs_2_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3              (_mshrs_2_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val          (_mshrs_2_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype         (_mshrs_2_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype        (_mshrs_2_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype        (_mshrs_2_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en           (_mshrs_2_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val            (_mshrs_2_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single         (_mshrs_2_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if        (_mshrs_2_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if        (_mshrs_2_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if        (_mshrs_2_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if       (_mshrs_2_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if        (_mshrs_2_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc        (_mshrs_2_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc        (_mshrs_2_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data                  (_mshrs_2_io_resp_bits_data),
    .io_resp_bits_is_hella              (_mshrs_2_io_resp_bits_is_hella),
    .io_wb_resp                         (io_wb_resp),
    .io_probe_rdy                       (_mshrs_2_io_probe_rdy)
  );
  BoomMSHR mshrs_3 (
    .clock                              (clock),
    .reset                              (reset),
    .io_id                              (3'h3),
    .io_req_pri_val                     (mshr_alloc_idx_REG == 3'h3 & pri_val),
    .io_req_pri_rdy                     (_mshrs_3_io_req_pri_rdy),
    .io_req_sec_val                     (_mshr_io_req_sec_val_T_15),
    .io_req_sec_rdy                     (_mshrs_3_io_req_sec_rdy),
    .io_clear_prefetch                  (io_clear_all & ~_GEN | _GEN & _GEN_90 & cacheable & ~_GEN_86 | io_req_is_probe_0 & _GEN_90),
    .io_brupdate_b1_resolve_mask        (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask     (io_brupdate_b1_mispredict_mask),
    .io_exception                       (io_exception),
    .io_req_uop_uopc                    (_GEN_0),
    .io_req_uop_inst                    (_GEN_1),
    .io_req_uop_debug_inst              (_GEN_2),
    .io_req_uop_is_rvc                  (_GEN_3),
    .io_req_uop_debug_pc                (_GEN_4),
    .io_req_uop_iq_type                 (_GEN_5),
    .io_req_uop_fu_code                 (_GEN_6),
    .io_req_uop_ctrl_br_type            (_GEN_7),
    .io_req_uop_ctrl_op1_sel            (_GEN_8),
    .io_req_uop_ctrl_op2_sel            (_GEN_9),
    .io_req_uop_ctrl_imm_sel            (_GEN_10),
    .io_req_uop_ctrl_op_fcn             (_GEN_11),
    .io_req_uop_ctrl_fcn_dw             (_GEN_12),
    .io_req_uop_ctrl_csr_cmd            (_GEN_13),
    .io_req_uop_ctrl_is_load            (_GEN_14),
    .io_req_uop_ctrl_is_sta             (_GEN_15),
    .io_req_uop_ctrl_is_std             (_GEN_16),
    .io_req_uop_iw_state                (_GEN_17),
    .io_req_uop_iw_p1_poisoned          (_GEN_18),
    .io_req_uop_iw_p2_poisoned          (_GEN_19),
    .io_req_uop_is_br                   (_GEN_20),
    .io_req_uop_is_jalr                 (_GEN_21),
    .io_req_uop_is_jal                  (_GEN_22),
    .io_req_uop_is_sfb                  (_GEN_23),
    .io_req_uop_br_mask                 (_GEN_24),
    .io_req_uop_br_tag                  (_GEN_25),
    .io_req_uop_ftq_idx                 (_GEN_26),
    .io_req_uop_edge_inst               (_GEN_27),
    .io_req_uop_pc_lob                  (_GEN_28),
    .io_req_uop_taken                   (_GEN_29),
    .io_req_uop_imm_packed              (_GEN_30),
    .io_req_uop_csr_addr                (_GEN_31),
    .io_req_uop_rob_idx                 (_GEN_32),
    .io_req_uop_ldq_idx                 (_GEN_33),
    .io_req_uop_stq_idx                 (_GEN_34),
    .io_req_uop_rxq_idx                 (_GEN_35),
    .io_req_uop_pdst                    (_GEN_36),
    .io_req_uop_prs1                    (_GEN_37),
    .io_req_uop_prs2                    (_GEN_38),
    .io_req_uop_prs3                    (_GEN_39),
    .io_req_uop_ppred                   (_GEN_40),
    .io_req_uop_prs1_busy               (_GEN_41),
    .io_req_uop_prs2_busy               (_GEN_42),
    .io_req_uop_prs3_busy               (_GEN_43),
    .io_req_uop_ppred_busy              (_GEN_44),
    .io_req_uop_stale_pdst              (_GEN_45),
    .io_req_uop_exception               (_GEN_46),
    .io_req_uop_exc_cause               (_GEN_47),
    .io_req_uop_bypassable              (_GEN_48),
    .io_req_uop_mem_cmd                 (_GEN_49),
    .io_req_uop_mem_size                (_GEN_50),
    .io_req_uop_mem_signed              (_GEN_51),
    .io_req_uop_is_fence                (_GEN_52),
    .io_req_uop_is_fencei               (_GEN_53),
    .io_req_uop_is_amo                  (_GEN_54),
    .io_req_uop_uses_ldq                (_GEN_55),
    .io_req_uop_uses_stq                (_GEN_56),
    .io_req_uop_is_sys_pc2epc           (_GEN_57),
    .io_req_uop_is_unique               (_GEN_58),
    .io_req_uop_flush_on_commit         (_GEN_59),
    .io_req_uop_ldst_is_rs1             (_GEN_60),
    .io_req_uop_ldst                    (_GEN_61),
    .io_req_uop_lrs1                    (_GEN_62),
    .io_req_uop_lrs2                    (_GEN_63),
    .io_req_uop_lrs3                    (_GEN_64),
    .io_req_uop_ldst_val                (_GEN_65),
    .io_req_uop_dst_rtype               (_GEN_66),
    .io_req_uop_lrs1_rtype              (_GEN_67),
    .io_req_uop_lrs2_rtype              (_GEN_68),
    .io_req_uop_frs3_en                 (_GEN_69),
    .io_req_uop_fp_val                  (_GEN_70),
    .io_req_uop_fp_single               (_GEN_71),
    .io_req_uop_xcpt_pf_if              (_GEN_72),
    .io_req_uop_xcpt_ae_if              (_GEN_73),
    .io_req_uop_xcpt_ma_if              (_GEN_74),
    .io_req_uop_bp_debug_if             (_GEN_75),
    .io_req_uop_bp_xcpt_if              (_GEN_76),
    .io_req_uop_debug_fsrc              (_GEN_77),
    .io_req_uop_debug_tsrc              (_GEN_78),
    .io_req_addr                        (_cacheable_T_1),
    .io_req_data                        (_GEN_79),
    .io_req_is_hella                    (_GEN_80),
    .io_req_tag_match                   (_GEN_81),
    .io_req_old_meta_coh_state          (_GEN_82),
    .io_req_old_meta_tag                (_GEN_83),
    .io_req_way_en                      (_GEN_84),
    .io_req_sdq_id                      (sdq_alloc_id),
    .io_req_is_probe                    (io_req_is_probe_0),
    .io_idx_valid                       (_mshrs_3_io_idx_valid),
    .io_idx_bits                        (_mshrs_3_io_idx_bits),
    .io_way_valid                       (_mshrs_3_io_way_valid),
    .io_way_bits                        (_mshrs_3_io_way_bits),
    .io_tag_valid                       (_mshrs_3_io_tag_valid),
    .io_tag_bits                        (_mshrs_3_io_tag_bits),
    .io_mem_acquire_ready               (io_mem_acquire_ready & (idle ? ~_GEN_110 : state_3)),
    .io_mem_acquire_valid               (_mshrs_3_io_mem_acquire_valid),
    .io_mem_acquire_bits_param          (_mshrs_3_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source         (_mshrs_3_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address        (_mshrs_3_io_mem_acquire_bits_address),
    .io_mem_grant_ready                 (_mshrs_3_io_mem_grant_ready),
    .io_mem_grant_valid                 (_GEN_98 & io_mem_grant_valid),
    .io_mem_grant_bits_opcode           (io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param            (io_mem_grant_bits_param),
    .io_mem_grant_bits_size             (io_mem_grant_bits_size),
    .io_mem_grant_bits_sink             (io_mem_grant_bits_sink),
    .io_mem_grant_bits_data             (io_mem_grant_bits_data),
    .io_mem_finish_ready                (io_mem_finish_ready & (beatsLeft_1 ? state_1_3 : ~_GEN_121)),
    .io_mem_finish_valid                (_mshrs_3_io_mem_finish_valid),
    .io_mem_finish_bits_sink            (_mshrs_3_io_mem_finish_bits_sink),
    .io_prober_state_valid              (io_prober_state_valid),
    .io_prober_state_bits               (io_prober_state_bits),
    .io_refill_ready                    (_refill_arb_io_in_3_ready),
    .io_refill_valid                    (_mshrs_3_io_refill_valid),
    .io_refill_bits_way_en              (_mshrs_3_io_refill_bits_way_en),
    .io_refill_bits_addr                (_mshrs_3_io_refill_bits_addr),
    .io_refill_bits_data                (_mshrs_3_io_refill_bits_data),
    .io_meta_write_ready                (_meta_write_arb_io_in_3_ready),
    .io_meta_write_valid                (_mshrs_3_io_meta_write_valid),
    .io_meta_write_bits_idx             (_mshrs_3_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en          (_mshrs_3_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state  (_mshrs_3_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag        (_mshrs_3_io_meta_write_bits_data_tag),
    .io_meta_read_ready                 (_meta_read_arb_io_in_3_ready),
    .io_meta_read_valid                 (_mshrs_3_io_meta_read_valid),
    .io_meta_read_bits_idx              (_mshrs_3_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en           (_mshrs_3_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag              (_mshrs_3_io_meta_read_bits_tag),
    .io_meta_resp_valid                 (io_meta_resp_valid),
    .io_meta_resp_bits_coh_state        (io_meta_resp_bits_coh_state),
    .io_wb_req_ready                    (_wb_req_arb_io_in_3_ready),
    .io_wb_req_valid                    (_mshrs_3_io_wb_req_valid),
    .io_wb_req_bits_tag                 (_mshrs_3_io_wb_req_bits_tag),
    .io_wb_req_bits_idx                 (_mshrs_3_io_wb_req_bits_idx),
    .io_wb_req_bits_param               (_mshrs_3_io_wb_req_bits_param),
    .io_wb_req_bits_way_en              (_mshrs_3_io_wb_req_bits_way_en),
    .io_commit_val                      (_mshrs_3_io_commit_val),
    .io_commit_addr                     (_mshrs_3_io_commit_addr),
    .io_commit_coh_state                (_mshrs_3_io_commit_coh_state),
    .io_lb_read_ready                   (_lb_read_arb_io_in_3_ready),
    .io_lb_read_valid                   (_mshrs_3_io_lb_read_valid),
    .io_lb_read_bits_id                 (_mshrs_3_io_lb_read_bits_id),
    .io_lb_read_bits_offset             (_mshrs_3_io_lb_read_bits_offset),
    .io_lb_resp                         (lb_read_data),
    .io_lb_write_ready                  (_lb_write_arb_io_in_3_ready),
    .io_lb_write_valid                  (_mshrs_3_io_lb_write_valid),
    .io_lb_write_bits_id                (_mshrs_3_io_lb_write_bits_id),
    .io_lb_write_bits_offset            (_mshrs_3_io_lb_write_bits_offset),
    .io_lb_write_bits_data              (_mshrs_3_io_lb_write_bits_data),
    .io_replay_ready                    (_replay_arb_io_in_3_ready),
    .io_replay_valid                    (_mshrs_3_io_replay_valid),
    .io_replay_bits_uop_uopc            (_mshrs_3_io_replay_bits_uop_uopc),
    .io_replay_bits_uop_inst            (_mshrs_3_io_replay_bits_uop_inst),
    .io_replay_bits_uop_debug_inst      (_mshrs_3_io_replay_bits_uop_debug_inst),
    .io_replay_bits_uop_is_rvc          (_mshrs_3_io_replay_bits_uop_is_rvc),
    .io_replay_bits_uop_debug_pc        (_mshrs_3_io_replay_bits_uop_debug_pc),
    .io_replay_bits_uop_iq_type         (_mshrs_3_io_replay_bits_uop_iq_type),
    .io_replay_bits_uop_fu_code         (_mshrs_3_io_replay_bits_uop_fu_code),
    .io_replay_bits_uop_ctrl_br_type    (_mshrs_3_io_replay_bits_uop_ctrl_br_type),
    .io_replay_bits_uop_ctrl_op1_sel    (_mshrs_3_io_replay_bits_uop_ctrl_op1_sel),
    .io_replay_bits_uop_ctrl_op2_sel    (_mshrs_3_io_replay_bits_uop_ctrl_op2_sel),
    .io_replay_bits_uop_ctrl_imm_sel    (_mshrs_3_io_replay_bits_uop_ctrl_imm_sel),
    .io_replay_bits_uop_ctrl_op_fcn     (_mshrs_3_io_replay_bits_uop_ctrl_op_fcn),
    .io_replay_bits_uop_ctrl_fcn_dw     (_mshrs_3_io_replay_bits_uop_ctrl_fcn_dw),
    .io_replay_bits_uop_ctrl_csr_cmd    (_mshrs_3_io_replay_bits_uop_ctrl_csr_cmd),
    .io_replay_bits_uop_ctrl_is_load    (_mshrs_3_io_replay_bits_uop_ctrl_is_load),
    .io_replay_bits_uop_ctrl_is_sta     (_mshrs_3_io_replay_bits_uop_ctrl_is_sta),
    .io_replay_bits_uop_ctrl_is_std     (_mshrs_3_io_replay_bits_uop_ctrl_is_std),
    .io_replay_bits_uop_iw_state        (_mshrs_3_io_replay_bits_uop_iw_state),
    .io_replay_bits_uop_iw_p1_poisoned  (_mshrs_3_io_replay_bits_uop_iw_p1_poisoned),
    .io_replay_bits_uop_iw_p2_poisoned  (_mshrs_3_io_replay_bits_uop_iw_p2_poisoned),
    .io_replay_bits_uop_is_br           (_mshrs_3_io_replay_bits_uop_is_br),
    .io_replay_bits_uop_is_jalr         (_mshrs_3_io_replay_bits_uop_is_jalr),
    .io_replay_bits_uop_is_jal          (_mshrs_3_io_replay_bits_uop_is_jal),
    .io_replay_bits_uop_is_sfb          (_mshrs_3_io_replay_bits_uop_is_sfb),
    .io_replay_bits_uop_br_mask         (_mshrs_3_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_br_tag          (_mshrs_3_io_replay_bits_uop_br_tag),
    .io_replay_bits_uop_ftq_idx         (_mshrs_3_io_replay_bits_uop_ftq_idx),
    .io_replay_bits_uop_edge_inst       (_mshrs_3_io_replay_bits_uop_edge_inst),
    .io_replay_bits_uop_pc_lob          (_mshrs_3_io_replay_bits_uop_pc_lob),
    .io_replay_bits_uop_taken           (_mshrs_3_io_replay_bits_uop_taken),
    .io_replay_bits_uop_imm_packed      (_mshrs_3_io_replay_bits_uop_imm_packed),
    .io_replay_bits_uop_csr_addr        (_mshrs_3_io_replay_bits_uop_csr_addr),
    .io_replay_bits_uop_rob_idx         (_mshrs_3_io_replay_bits_uop_rob_idx),
    .io_replay_bits_uop_ldq_idx         (_mshrs_3_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx         (_mshrs_3_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_rxq_idx         (_mshrs_3_io_replay_bits_uop_rxq_idx),
    .io_replay_bits_uop_pdst            (_mshrs_3_io_replay_bits_uop_pdst),
    .io_replay_bits_uop_prs1            (_mshrs_3_io_replay_bits_uop_prs1),
    .io_replay_bits_uop_prs2            (_mshrs_3_io_replay_bits_uop_prs2),
    .io_replay_bits_uop_prs3            (_mshrs_3_io_replay_bits_uop_prs3),
    .io_replay_bits_uop_ppred           (_mshrs_3_io_replay_bits_uop_ppred),
    .io_replay_bits_uop_prs1_busy       (_mshrs_3_io_replay_bits_uop_prs1_busy),
    .io_replay_bits_uop_prs2_busy       (_mshrs_3_io_replay_bits_uop_prs2_busy),
    .io_replay_bits_uop_prs3_busy       (_mshrs_3_io_replay_bits_uop_prs3_busy),
    .io_replay_bits_uop_ppred_busy      (_mshrs_3_io_replay_bits_uop_ppred_busy),
    .io_replay_bits_uop_stale_pdst      (_mshrs_3_io_replay_bits_uop_stale_pdst),
    .io_replay_bits_uop_exception       (_mshrs_3_io_replay_bits_uop_exception),
    .io_replay_bits_uop_exc_cause       (_mshrs_3_io_replay_bits_uop_exc_cause),
    .io_replay_bits_uop_bypassable      (_mshrs_3_io_replay_bits_uop_bypassable),
    .io_replay_bits_uop_mem_cmd         (_mshrs_3_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size        (_mshrs_3_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed      (_mshrs_3_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_fence        (_mshrs_3_io_replay_bits_uop_is_fence),
    .io_replay_bits_uop_is_fencei       (_mshrs_3_io_replay_bits_uop_is_fencei),
    .io_replay_bits_uop_is_amo          (_mshrs_3_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq        (_mshrs_3_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq        (_mshrs_3_io_replay_bits_uop_uses_stq),
    .io_replay_bits_uop_is_sys_pc2epc   (_mshrs_3_io_replay_bits_uop_is_sys_pc2epc),
    .io_replay_bits_uop_is_unique       (_mshrs_3_io_replay_bits_uop_is_unique),
    .io_replay_bits_uop_flush_on_commit (_mshrs_3_io_replay_bits_uop_flush_on_commit),
    .io_replay_bits_uop_ldst_is_rs1     (_mshrs_3_io_replay_bits_uop_ldst_is_rs1),
    .io_replay_bits_uop_ldst            (_mshrs_3_io_replay_bits_uop_ldst),
    .io_replay_bits_uop_lrs1            (_mshrs_3_io_replay_bits_uop_lrs1),
    .io_replay_bits_uop_lrs2            (_mshrs_3_io_replay_bits_uop_lrs2),
    .io_replay_bits_uop_lrs3            (_mshrs_3_io_replay_bits_uop_lrs3),
    .io_replay_bits_uop_ldst_val        (_mshrs_3_io_replay_bits_uop_ldst_val),
    .io_replay_bits_uop_dst_rtype       (_mshrs_3_io_replay_bits_uop_dst_rtype),
    .io_replay_bits_uop_lrs1_rtype      (_mshrs_3_io_replay_bits_uop_lrs1_rtype),
    .io_replay_bits_uop_lrs2_rtype      (_mshrs_3_io_replay_bits_uop_lrs2_rtype),
    .io_replay_bits_uop_frs3_en         (_mshrs_3_io_replay_bits_uop_frs3_en),
    .io_replay_bits_uop_fp_val          (_mshrs_3_io_replay_bits_uop_fp_val),
    .io_replay_bits_uop_fp_single       (_mshrs_3_io_replay_bits_uop_fp_single),
    .io_replay_bits_uop_xcpt_pf_if      (_mshrs_3_io_replay_bits_uop_xcpt_pf_if),
    .io_replay_bits_uop_xcpt_ae_if      (_mshrs_3_io_replay_bits_uop_xcpt_ae_if),
    .io_replay_bits_uop_xcpt_ma_if      (_mshrs_3_io_replay_bits_uop_xcpt_ma_if),
    .io_replay_bits_uop_bp_debug_if     (_mshrs_3_io_replay_bits_uop_bp_debug_if),
    .io_replay_bits_uop_bp_xcpt_if      (_mshrs_3_io_replay_bits_uop_bp_xcpt_if),
    .io_replay_bits_uop_debug_fsrc      (_mshrs_3_io_replay_bits_uop_debug_fsrc),
    .io_replay_bits_uop_debug_tsrc      (_mshrs_3_io_replay_bits_uop_debug_tsrc),
    .io_replay_bits_addr                (_mshrs_3_io_replay_bits_addr),
    .io_replay_bits_is_hella            (_mshrs_3_io_replay_bits_is_hella),
    .io_replay_bits_way_en              (_mshrs_3_io_replay_bits_way_en),
    .io_replay_bits_sdq_id              (_mshrs_3_io_replay_bits_sdq_id),
    .io_resp_ready                      (_resp_arb_io_in_3_ready),
    .io_resp_valid                      (_mshrs_3_io_resp_valid),
    .io_resp_bits_uop_uopc              (_mshrs_3_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst              (_mshrs_3_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst        (_mshrs_3_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc            (_mshrs_3_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc          (_mshrs_3_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type           (_mshrs_3_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code           (_mshrs_3_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type      (_mshrs_3_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel      (_mshrs_3_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel      (_mshrs_3_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel      (_mshrs_3_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn       (_mshrs_3_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw       (_mshrs_3_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd      (_mshrs_3_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load      (_mshrs_3_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta       (_mshrs_3_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std       (_mshrs_3_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state          (_mshrs_3_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned    (_mshrs_3_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned    (_mshrs_3_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br             (_mshrs_3_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr           (_mshrs_3_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal            (_mshrs_3_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb            (_mshrs_3_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask           (_mshrs_3_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag            (_mshrs_3_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx           (_mshrs_3_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst         (_mshrs_3_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob            (_mshrs_3_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken             (_mshrs_3_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed        (_mshrs_3_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr          (_mshrs_3_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx           (_mshrs_3_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx           (_mshrs_3_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx           (_mshrs_3_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx           (_mshrs_3_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst              (_mshrs_3_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1              (_mshrs_3_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2              (_mshrs_3_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3              (_mshrs_3_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred             (_mshrs_3_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy         (_mshrs_3_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy         (_mshrs_3_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy         (_mshrs_3_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy        (_mshrs_3_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst        (_mshrs_3_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception         (_mshrs_3_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause         (_mshrs_3_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable        (_mshrs_3_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd           (_mshrs_3_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size          (_mshrs_3_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed        (_mshrs_3_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence          (_mshrs_3_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei         (_mshrs_3_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo            (_mshrs_3_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq          (_mshrs_3_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq          (_mshrs_3_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc     (_mshrs_3_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique         (_mshrs_3_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit   (_mshrs_3_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1       (_mshrs_3_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst              (_mshrs_3_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1              (_mshrs_3_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2              (_mshrs_3_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3              (_mshrs_3_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val          (_mshrs_3_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype         (_mshrs_3_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype        (_mshrs_3_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype        (_mshrs_3_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en           (_mshrs_3_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val            (_mshrs_3_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single         (_mshrs_3_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if        (_mshrs_3_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if        (_mshrs_3_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if        (_mshrs_3_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if       (_mshrs_3_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if        (_mshrs_3_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc        (_mshrs_3_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc        (_mshrs_3_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data                  (_mshrs_3_io_resp_bits_data),
    .io_resp_bits_is_hella              (_mshrs_3_io_resp_bits_is_hella),
    .io_wb_resp                         (io_wb_resp),
    .io_probe_rdy                       (_mshrs_3_io_probe_rdy)
  );
  BoomMSHR mshrs_4 (
    .clock                              (clock),
    .reset                              (reset),
    .io_id                              (3'h4),
    .io_req_pri_val                     (mshr_alloc_idx_REG == 3'h4 & pri_val),
    .io_req_pri_rdy                     (_mshrs_4_io_req_pri_rdy),
    .io_req_sec_val                     (_mshr_io_req_sec_val_T_19),
    .io_req_sec_rdy                     (_mshrs_4_io_req_sec_rdy),
    .io_clear_prefetch                  (io_clear_all & ~_GEN | _GEN & _GEN_91 & cacheable & ~_GEN_86 | io_req_is_probe_0 & _GEN_91),
    .io_brupdate_b1_resolve_mask        (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask     (io_brupdate_b1_mispredict_mask),
    .io_exception                       (io_exception),
    .io_req_uop_uopc                    (_GEN_0),
    .io_req_uop_inst                    (_GEN_1),
    .io_req_uop_debug_inst              (_GEN_2),
    .io_req_uop_is_rvc                  (_GEN_3),
    .io_req_uop_debug_pc                (_GEN_4),
    .io_req_uop_iq_type                 (_GEN_5),
    .io_req_uop_fu_code                 (_GEN_6),
    .io_req_uop_ctrl_br_type            (_GEN_7),
    .io_req_uop_ctrl_op1_sel            (_GEN_8),
    .io_req_uop_ctrl_op2_sel            (_GEN_9),
    .io_req_uop_ctrl_imm_sel            (_GEN_10),
    .io_req_uop_ctrl_op_fcn             (_GEN_11),
    .io_req_uop_ctrl_fcn_dw             (_GEN_12),
    .io_req_uop_ctrl_csr_cmd            (_GEN_13),
    .io_req_uop_ctrl_is_load            (_GEN_14),
    .io_req_uop_ctrl_is_sta             (_GEN_15),
    .io_req_uop_ctrl_is_std             (_GEN_16),
    .io_req_uop_iw_state                (_GEN_17),
    .io_req_uop_iw_p1_poisoned          (_GEN_18),
    .io_req_uop_iw_p2_poisoned          (_GEN_19),
    .io_req_uop_is_br                   (_GEN_20),
    .io_req_uop_is_jalr                 (_GEN_21),
    .io_req_uop_is_jal                  (_GEN_22),
    .io_req_uop_is_sfb                  (_GEN_23),
    .io_req_uop_br_mask                 (_GEN_24),
    .io_req_uop_br_tag                  (_GEN_25),
    .io_req_uop_ftq_idx                 (_GEN_26),
    .io_req_uop_edge_inst               (_GEN_27),
    .io_req_uop_pc_lob                  (_GEN_28),
    .io_req_uop_taken                   (_GEN_29),
    .io_req_uop_imm_packed              (_GEN_30),
    .io_req_uop_csr_addr                (_GEN_31),
    .io_req_uop_rob_idx                 (_GEN_32),
    .io_req_uop_ldq_idx                 (_GEN_33),
    .io_req_uop_stq_idx                 (_GEN_34),
    .io_req_uop_rxq_idx                 (_GEN_35),
    .io_req_uop_pdst                    (_GEN_36),
    .io_req_uop_prs1                    (_GEN_37),
    .io_req_uop_prs2                    (_GEN_38),
    .io_req_uop_prs3                    (_GEN_39),
    .io_req_uop_ppred                   (_GEN_40),
    .io_req_uop_prs1_busy               (_GEN_41),
    .io_req_uop_prs2_busy               (_GEN_42),
    .io_req_uop_prs3_busy               (_GEN_43),
    .io_req_uop_ppred_busy              (_GEN_44),
    .io_req_uop_stale_pdst              (_GEN_45),
    .io_req_uop_exception               (_GEN_46),
    .io_req_uop_exc_cause               (_GEN_47),
    .io_req_uop_bypassable              (_GEN_48),
    .io_req_uop_mem_cmd                 (_GEN_49),
    .io_req_uop_mem_size                (_GEN_50),
    .io_req_uop_mem_signed              (_GEN_51),
    .io_req_uop_is_fence                (_GEN_52),
    .io_req_uop_is_fencei               (_GEN_53),
    .io_req_uop_is_amo                  (_GEN_54),
    .io_req_uop_uses_ldq                (_GEN_55),
    .io_req_uop_uses_stq                (_GEN_56),
    .io_req_uop_is_sys_pc2epc           (_GEN_57),
    .io_req_uop_is_unique               (_GEN_58),
    .io_req_uop_flush_on_commit         (_GEN_59),
    .io_req_uop_ldst_is_rs1             (_GEN_60),
    .io_req_uop_ldst                    (_GEN_61),
    .io_req_uop_lrs1                    (_GEN_62),
    .io_req_uop_lrs2                    (_GEN_63),
    .io_req_uop_lrs3                    (_GEN_64),
    .io_req_uop_ldst_val                (_GEN_65),
    .io_req_uop_dst_rtype               (_GEN_66),
    .io_req_uop_lrs1_rtype              (_GEN_67),
    .io_req_uop_lrs2_rtype              (_GEN_68),
    .io_req_uop_frs3_en                 (_GEN_69),
    .io_req_uop_fp_val                  (_GEN_70),
    .io_req_uop_fp_single               (_GEN_71),
    .io_req_uop_xcpt_pf_if              (_GEN_72),
    .io_req_uop_xcpt_ae_if              (_GEN_73),
    .io_req_uop_xcpt_ma_if              (_GEN_74),
    .io_req_uop_bp_debug_if             (_GEN_75),
    .io_req_uop_bp_xcpt_if              (_GEN_76),
    .io_req_uop_debug_fsrc              (_GEN_77),
    .io_req_uop_debug_tsrc              (_GEN_78),
    .io_req_addr                        (_cacheable_T_1),
    .io_req_data                        (_GEN_79),
    .io_req_is_hella                    (_GEN_80),
    .io_req_tag_match                   (_GEN_81),
    .io_req_old_meta_coh_state          (_GEN_82),
    .io_req_old_meta_tag                (_GEN_83),
    .io_req_way_en                      (_GEN_84),
    .io_req_sdq_id                      (sdq_alloc_id),
    .io_req_is_probe                    (io_req_is_probe_0),
    .io_idx_valid                       (_mshrs_4_io_idx_valid),
    .io_idx_bits                        (_mshrs_4_io_idx_bits),
    .io_way_valid                       (_mshrs_4_io_way_valid),
    .io_way_bits                        (_mshrs_4_io_way_bits),
    .io_tag_valid                       (_mshrs_4_io_tag_valid),
    .io_tag_bits                        (_mshrs_4_io_tag_bits),
    .io_mem_acquire_ready               (io_mem_acquire_ready & (idle ? ~_GEN_109 : state_4)),
    .io_mem_acquire_valid               (_mshrs_4_io_mem_acquire_valid),
    .io_mem_acquire_bits_param          (_mshrs_4_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source         (_mshrs_4_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address        (_mshrs_4_io_mem_acquire_bits_address),
    .io_mem_grant_ready                 (_mshrs_4_io_mem_grant_ready),
    .io_mem_grant_valid                 (_GEN_99 & io_mem_grant_valid),
    .io_mem_grant_bits_opcode           (io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param            (io_mem_grant_bits_param),
    .io_mem_grant_bits_size             (io_mem_grant_bits_size),
    .io_mem_grant_bits_sink             (io_mem_grant_bits_sink),
    .io_mem_grant_bits_data             (io_mem_grant_bits_data),
    .io_mem_finish_ready                (io_mem_finish_ready & (beatsLeft_1 ? state_1_4 : ~_GEN_120)),
    .io_mem_finish_valid                (_mshrs_4_io_mem_finish_valid),
    .io_mem_finish_bits_sink            (_mshrs_4_io_mem_finish_bits_sink),
    .io_prober_state_valid              (io_prober_state_valid),
    .io_prober_state_bits               (io_prober_state_bits),
    .io_refill_ready                    (_refill_arb_io_in_4_ready),
    .io_refill_valid                    (_mshrs_4_io_refill_valid),
    .io_refill_bits_way_en              (_mshrs_4_io_refill_bits_way_en),
    .io_refill_bits_addr                (_mshrs_4_io_refill_bits_addr),
    .io_refill_bits_data                (_mshrs_4_io_refill_bits_data),
    .io_meta_write_ready                (_meta_write_arb_io_in_4_ready),
    .io_meta_write_valid                (_mshrs_4_io_meta_write_valid),
    .io_meta_write_bits_idx             (_mshrs_4_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en          (_mshrs_4_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state  (_mshrs_4_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag        (_mshrs_4_io_meta_write_bits_data_tag),
    .io_meta_read_ready                 (_meta_read_arb_io_in_4_ready),
    .io_meta_read_valid                 (_mshrs_4_io_meta_read_valid),
    .io_meta_read_bits_idx              (_mshrs_4_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en           (_mshrs_4_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag              (_mshrs_4_io_meta_read_bits_tag),
    .io_meta_resp_valid                 (io_meta_resp_valid),
    .io_meta_resp_bits_coh_state        (io_meta_resp_bits_coh_state),
    .io_wb_req_ready                    (_wb_req_arb_io_in_4_ready),
    .io_wb_req_valid                    (_mshrs_4_io_wb_req_valid),
    .io_wb_req_bits_tag                 (_mshrs_4_io_wb_req_bits_tag),
    .io_wb_req_bits_idx                 (_mshrs_4_io_wb_req_bits_idx),
    .io_wb_req_bits_param               (_mshrs_4_io_wb_req_bits_param),
    .io_wb_req_bits_way_en              (_mshrs_4_io_wb_req_bits_way_en),
    .io_commit_val                      (_mshrs_4_io_commit_val),
    .io_commit_addr                     (_mshrs_4_io_commit_addr),
    .io_commit_coh_state                (_mshrs_4_io_commit_coh_state),
    .io_lb_read_ready                   (_lb_read_arb_io_in_4_ready),
    .io_lb_read_valid                   (_mshrs_4_io_lb_read_valid),
    .io_lb_read_bits_id                 (_mshrs_4_io_lb_read_bits_id),
    .io_lb_read_bits_offset             (_mshrs_4_io_lb_read_bits_offset),
    .io_lb_resp                         (lb_read_data),
    .io_lb_write_ready                  (_lb_write_arb_io_in_4_ready),
    .io_lb_write_valid                  (_mshrs_4_io_lb_write_valid),
    .io_lb_write_bits_id                (_mshrs_4_io_lb_write_bits_id),
    .io_lb_write_bits_offset            (_mshrs_4_io_lb_write_bits_offset),
    .io_lb_write_bits_data              (_mshrs_4_io_lb_write_bits_data),
    .io_replay_ready                    (_replay_arb_io_in_4_ready),
    .io_replay_valid                    (_mshrs_4_io_replay_valid),
    .io_replay_bits_uop_uopc            (_mshrs_4_io_replay_bits_uop_uopc),
    .io_replay_bits_uop_inst            (_mshrs_4_io_replay_bits_uop_inst),
    .io_replay_bits_uop_debug_inst      (_mshrs_4_io_replay_bits_uop_debug_inst),
    .io_replay_bits_uop_is_rvc          (_mshrs_4_io_replay_bits_uop_is_rvc),
    .io_replay_bits_uop_debug_pc        (_mshrs_4_io_replay_bits_uop_debug_pc),
    .io_replay_bits_uop_iq_type         (_mshrs_4_io_replay_bits_uop_iq_type),
    .io_replay_bits_uop_fu_code         (_mshrs_4_io_replay_bits_uop_fu_code),
    .io_replay_bits_uop_ctrl_br_type    (_mshrs_4_io_replay_bits_uop_ctrl_br_type),
    .io_replay_bits_uop_ctrl_op1_sel    (_mshrs_4_io_replay_bits_uop_ctrl_op1_sel),
    .io_replay_bits_uop_ctrl_op2_sel    (_mshrs_4_io_replay_bits_uop_ctrl_op2_sel),
    .io_replay_bits_uop_ctrl_imm_sel    (_mshrs_4_io_replay_bits_uop_ctrl_imm_sel),
    .io_replay_bits_uop_ctrl_op_fcn     (_mshrs_4_io_replay_bits_uop_ctrl_op_fcn),
    .io_replay_bits_uop_ctrl_fcn_dw     (_mshrs_4_io_replay_bits_uop_ctrl_fcn_dw),
    .io_replay_bits_uop_ctrl_csr_cmd    (_mshrs_4_io_replay_bits_uop_ctrl_csr_cmd),
    .io_replay_bits_uop_ctrl_is_load    (_mshrs_4_io_replay_bits_uop_ctrl_is_load),
    .io_replay_bits_uop_ctrl_is_sta     (_mshrs_4_io_replay_bits_uop_ctrl_is_sta),
    .io_replay_bits_uop_ctrl_is_std     (_mshrs_4_io_replay_bits_uop_ctrl_is_std),
    .io_replay_bits_uop_iw_state        (_mshrs_4_io_replay_bits_uop_iw_state),
    .io_replay_bits_uop_iw_p1_poisoned  (_mshrs_4_io_replay_bits_uop_iw_p1_poisoned),
    .io_replay_bits_uop_iw_p2_poisoned  (_mshrs_4_io_replay_bits_uop_iw_p2_poisoned),
    .io_replay_bits_uop_is_br           (_mshrs_4_io_replay_bits_uop_is_br),
    .io_replay_bits_uop_is_jalr         (_mshrs_4_io_replay_bits_uop_is_jalr),
    .io_replay_bits_uop_is_jal          (_mshrs_4_io_replay_bits_uop_is_jal),
    .io_replay_bits_uop_is_sfb          (_mshrs_4_io_replay_bits_uop_is_sfb),
    .io_replay_bits_uop_br_mask         (_mshrs_4_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_br_tag          (_mshrs_4_io_replay_bits_uop_br_tag),
    .io_replay_bits_uop_ftq_idx         (_mshrs_4_io_replay_bits_uop_ftq_idx),
    .io_replay_bits_uop_edge_inst       (_mshrs_4_io_replay_bits_uop_edge_inst),
    .io_replay_bits_uop_pc_lob          (_mshrs_4_io_replay_bits_uop_pc_lob),
    .io_replay_bits_uop_taken           (_mshrs_4_io_replay_bits_uop_taken),
    .io_replay_bits_uop_imm_packed      (_mshrs_4_io_replay_bits_uop_imm_packed),
    .io_replay_bits_uop_csr_addr        (_mshrs_4_io_replay_bits_uop_csr_addr),
    .io_replay_bits_uop_rob_idx         (_mshrs_4_io_replay_bits_uop_rob_idx),
    .io_replay_bits_uop_ldq_idx         (_mshrs_4_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx         (_mshrs_4_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_rxq_idx         (_mshrs_4_io_replay_bits_uop_rxq_idx),
    .io_replay_bits_uop_pdst            (_mshrs_4_io_replay_bits_uop_pdst),
    .io_replay_bits_uop_prs1            (_mshrs_4_io_replay_bits_uop_prs1),
    .io_replay_bits_uop_prs2            (_mshrs_4_io_replay_bits_uop_prs2),
    .io_replay_bits_uop_prs3            (_mshrs_4_io_replay_bits_uop_prs3),
    .io_replay_bits_uop_ppred           (_mshrs_4_io_replay_bits_uop_ppred),
    .io_replay_bits_uop_prs1_busy       (_mshrs_4_io_replay_bits_uop_prs1_busy),
    .io_replay_bits_uop_prs2_busy       (_mshrs_4_io_replay_bits_uop_prs2_busy),
    .io_replay_bits_uop_prs3_busy       (_mshrs_4_io_replay_bits_uop_prs3_busy),
    .io_replay_bits_uop_ppred_busy      (_mshrs_4_io_replay_bits_uop_ppred_busy),
    .io_replay_bits_uop_stale_pdst      (_mshrs_4_io_replay_bits_uop_stale_pdst),
    .io_replay_bits_uop_exception       (_mshrs_4_io_replay_bits_uop_exception),
    .io_replay_bits_uop_exc_cause       (_mshrs_4_io_replay_bits_uop_exc_cause),
    .io_replay_bits_uop_bypassable      (_mshrs_4_io_replay_bits_uop_bypassable),
    .io_replay_bits_uop_mem_cmd         (_mshrs_4_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size        (_mshrs_4_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed      (_mshrs_4_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_fence        (_mshrs_4_io_replay_bits_uop_is_fence),
    .io_replay_bits_uop_is_fencei       (_mshrs_4_io_replay_bits_uop_is_fencei),
    .io_replay_bits_uop_is_amo          (_mshrs_4_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq        (_mshrs_4_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq        (_mshrs_4_io_replay_bits_uop_uses_stq),
    .io_replay_bits_uop_is_sys_pc2epc   (_mshrs_4_io_replay_bits_uop_is_sys_pc2epc),
    .io_replay_bits_uop_is_unique       (_mshrs_4_io_replay_bits_uop_is_unique),
    .io_replay_bits_uop_flush_on_commit (_mshrs_4_io_replay_bits_uop_flush_on_commit),
    .io_replay_bits_uop_ldst_is_rs1     (_mshrs_4_io_replay_bits_uop_ldst_is_rs1),
    .io_replay_bits_uop_ldst            (_mshrs_4_io_replay_bits_uop_ldst),
    .io_replay_bits_uop_lrs1            (_mshrs_4_io_replay_bits_uop_lrs1),
    .io_replay_bits_uop_lrs2            (_mshrs_4_io_replay_bits_uop_lrs2),
    .io_replay_bits_uop_lrs3            (_mshrs_4_io_replay_bits_uop_lrs3),
    .io_replay_bits_uop_ldst_val        (_mshrs_4_io_replay_bits_uop_ldst_val),
    .io_replay_bits_uop_dst_rtype       (_mshrs_4_io_replay_bits_uop_dst_rtype),
    .io_replay_bits_uop_lrs1_rtype      (_mshrs_4_io_replay_bits_uop_lrs1_rtype),
    .io_replay_bits_uop_lrs2_rtype      (_mshrs_4_io_replay_bits_uop_lrs2_rtype),
    .io_replay_bits_uop_frs3_en         (_mshrs_4_io_replay_bits_uop_frs3_en),
    .io_replay_bits_uop_fp_val          (_mshrs_4_io_replay_bits_uop_fp_val),
    .io_replay_bits_uop_fp_single       (_mshrs_4_io_replay_bits_uop_fp_single),
    .io_replay_bits_uop_xcpt_pf_if      (_mshrs_4_io_replay_bits_uop_xcpt_pf_if),
    .io_replay_bits_uop_xcpt_ae_if      (_mshrs_4_io_replay_bits_uop_xcpt_ae_if),
    .io_replay_bits_uop_xcpt_ma_if      (_mshrs_4_io_replay_bits_uop_xcpt_ma_if),
    .io_replay_bits_uop_bp_debug_if     (_mshrs_4_io_replay_bits_uop_bp_debug_if),
    .io_replay_bits_uop_bp_xcpt_if      (_mshrs_4_io_replay_bits_uop_bp_xcpt_if),
    .io_replay_bits_uop_debug_fsrc      (_mshrs_4_io_replay_bits_uop_debug_fsrc),
    .io_replay_bits_uop_debug_tsrc      (_mshrs_4_io_replay_bits_uop_debug_tsrc),
    .io_replay_bits_addr                (_mshrs_4_io_replay_bits_addr),
    .io_replay_bits_is_hella            (_mshrs_4_io_replay_bits_is_hella),
    .io_replay_bits_way_en              (_mshrs_4_io_replay_bits_way_en),
    .io_replay_bits_sdq_id              (_mshrs_4_io_replay_bits_sdq_id),
    .io_resp_ready                      (_resp_arb_io_in_4_ready),
    .io_resp_valid                      (_mshrs_4_io_resp_valid),
    .io_resp_bits_uop_uopc              (_mshrs_4_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst              (_mshrs_4_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst        (_mshrs_4_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc            (_mshrs_4_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc          (_mshrs_4_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type           (_mshrs_4_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code           (_mshrs_4_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type      (_mshrs_4_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel      (_mshrs_4_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel      (_mshrs_4_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel      (_mshrs_4_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn       (_mshrs_4_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw       (_mshrs_4_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd      (_mshrs_4_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load      (_mshrs_4_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta       (_mshrs_4_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std       (_mshrs_4_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state          (_mshrs_4_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned    (_mshrs_4_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned    (_mshrs_4_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br             (_mshrs_4_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr           (_mshrs_4_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal            (_mshrs_4_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb            (_mshrs_4_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask           (_mshrs_4_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag            (_mshrs_4_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx           (_mshrs_4_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst         (_mshrs_4_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob            (_mshrs_4_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken             (_mshrs_4_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed        (_mshrs_4_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr          (_mshrs_4_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx           (_mshrs_4_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx           (_mshrs_4_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx           (_mshrs_4_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx           (_mshrs_4_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst              (_mshrs_4_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1              (_mshrs_4_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2              (_mshrs_4_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3              (_mshrs_4_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred             (_mshrs_4_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy         (_mshrs_4_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy         (_mshrs_4_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy         (_mshrs_4_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy        (_mshrs_4_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst        (_mshrs_4_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception         (_mshrs_4_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause         (_mshrs_4_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable        (_mshrs_4_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd           (_mshrs_4_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size          (_mshrs_4_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed        (_mshrs_4_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence          (_mshrs_4_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei         (_mshrs_4_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo            (_mshrs_4_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq          (_mshrs_4_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq          (_mshrs_4_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc     (_mshrs_4_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique         (_mshrs_4_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit   (_mshrs_4_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1       (_mshrs_4_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst              (_mshrs_4_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1              (_mshrs_4_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2              (_mshrs_4_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3              (_mshrs_4_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val          (_mshrs_4_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype         (_mshrs_4_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype        (_mshrs_4_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype        (_mshrs_4_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en           (_mshrs_4_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val            (_mshrs_4_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single         (_mshrs_4_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if        (_mshrs_4_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if        (_mshrs_4_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if        (_mshrs_4_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if       (_mshrs_4_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if        (_mshrs_4_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc        (_mshrs_4_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc        (_mshrs_4_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data                  (_mshrs_4_io_resp_bits_data),
    .io_resp_bits_is_hella              (_mshrs_4_io_resp_bits_is_hella),
    .io_wb_resp                         (io_wb_resp),
    .io_probe_rdy                       (_mshrs_4_io_probe_rdy)
  );
  BoomMSHR mshrs_5 (
    .clock                              (clock),
    .reset                              (reset),
    .io_id                              (3'h5),
    .io_req_pri_val                     (mshr_alloc_idx_REG == 3'h5 & pri_val),
    .io_req_pri_rdy                     (_mshrs_5_io_req_pri_rdy),
    .io_req_sec_val                     (_mshr_io_req_sec_val_T_23),
    .io_req_sec_rdy                     (_mshrs_5_io_req_sec_rdy),
    .io_clear_prefetch                  (io_clear_all & ~_GEN | _GEN & _GEN_92 & cacheable & ~_GEN_86 | io_req_is_probe_0 & _GEN_92),
    .io_brupdate_b1_resolve_mask        (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask     (io_brupdate_b1_mispredict_mask),
    .io_exception                       (io_exception),
    .io_req_uop_uopc                    (_GEN_0),
    .io_req_uop_inst                    (_GEN_1),
    .io_req_uop_debug_inst              (_GEN_2),
    .io_req_uop_is_rvc                  (_GEN_3),
    .io_req_uop_debug_pc                (_GEN_4),
    .io_req_uop_iq_type                 (_GEN_5),
    .io_req_uop_fu_code                 (_GEN_6),
    .io_req_uop_ctrl_br_type            (_GEN_7),
    .io_req_uop_ctrl_op1_sel            (_GEN_8),
    .io_req_uop_ctrl_op2_sel            (_GEN_9),
    .io_req_uop_ctrl_imm_sel            (_GEN_10),
    .io_req_uop_ctrl_op_fcn             (_GEN_11),
    .io_req_uop_ctrl_fcn_dw             (_GEN_12),
    .io_req_uop_ctrl_csr_cmd            (_GEN_13),
    .io_req_uop_ctrl_is_load            (_GEN_14),
    .io_req_uop_ctrl_is_sta             (_GEN_15),
    .io_req_uop_ctrl_is_std             (_GEN_16),
    .io_req_uop_iw_state                (_GEN_17),
    .io_req_uop_iw_p1_poisoned          (_GEN_18),
    .io_req_uop_iw_p2_poisoned          (_GEN_19),
    .io_req_uop_is_br                   (_GEN_20),
    .io_req_uop_is_jalr                 (_GEN_21),
    .io_req_uop_is_jal                  (_GEN_22),
    .io_req_uop_is_sfb                  (_GEN_23),
    .io_req_uop_br_mask                 (_GEN_24),
    .io_req_uop_br_tag                  (_GEN_25),
    .io_req_uop_ftq_idx                 (_GEN_26),
    .io_req_uop_edge_inst               (_GEN_27),
    .io_req_uop_pc_lob                  (_GEN_28),
    .io_req_uop_taken                   (_GEN_29),
    .io_req_uop_imm_packed              (_GEN_30),
    .io_req_uop_csr_addr                (_GEN_31),
    .io_req_uop_rob_idx                 (_GEN_32),
    .io_req_uop_ldq_idx                 (_GEN_33),
    .io_req_uop_stq_idx                 (_GEN_34),
    .io_req_uop_rxq_idx                 (_GEN_35),
    .io_req_uop_pdst                    (_GEN_36),
    .io_req_uop_prs1                    (_GEN_37),
    .io_req_uop_prs2                    (_GEN_38),
    .io_req_uop_prs3                    (_GEN_39),
    .io_req_uop_ppred                   (_GEN_40),
    .io_req_uop_prs1_busy               (_GEN_41),
    .io_req_uop_prs2_busy               (_GEN_42),
    .io_req_uop_prs3_busy               (_GEN_43),
    .io_req_uop_ppred_busy              (_GEN_44),
    .io_req_uop_stale_pdst              (_GEN_45),
    .io_req_uop_exception               (_GEN_46),
    .io_req_uop_exc_cause               (_GEN_47),
    .io_req_uop_bypassable              (_GEN_48),
    .io_req_uop_mem_cmd                 (_GEN_49),
    .io_req_uop_mem_size                (_GEN_50),
    .io_req_uop_mem_signed              (_GEN_51),
    .io_req_uop_is_fence                (_GEN_52),
    .io_req_uop_is_fencei               (_GEN_53),
    .io_req_uop_is_amo                  (_GEN_54),
    .io_req_uop_uses_ldq                (_GEN_55),
    .io_req_uop_uses_stq                (_GEN_56),
    .io_req_uop_is_sys_pc2epc           (_GEN_57),
    .io_req_uop_is_unique               (_GEN_58),
    .io_req_uop_flush_on_commit         (_GEN_59),
    .io_req_uop_ldst_is_rs1             (_GEN_60),
    .io_req_uop_ldst                    (_GEN_61),
    .io_req_uop_lrs1                    (_GEN_62),
    .io_req_uop_lrs2                    (_GEN_63),
    .io_req_uop_lrs3                    (_GEN_64),
    .io_req_uop_ldst_val                (_GEN_65),
    .io_req_uop_dst_rtype               (_GEN_66),
    .io_req_uop_lrs1_rtype              (_GEN_67),
    .io_req_uop_lrs2_rtype              (_GEN_68),
    .io_req_uop_frs3_en                 (_GEN_69),
    .io_req_uop_fp_val                  (_GEN_70),
    .io_req_uop_fp_single               (_GEN_71),
    .io_req_uop_xcpt_pf_if              (_GEN_72),
    .io_req_uop_xcpt_ae_if              (_GEN_73),
    .io_req_uop_xcpt_ma_if              (_GEN_74),
    .io_req_uop_bp_debug_if             (_GEN_75),
    .io_req_uop_bp_xcpt_if              (_GEN_76),
    .io_req_uop_debug_fsrc              (_GEN_77),
    .io_req_uop_debug_tsrc              (_GEN_78),
    .io_req_addr                        (_cacheable_T_1),
    .io_req_data                        (_GEN_79),
    .io_req_is_hella                    (_GEN_80),
    .io_req_tag_match                   (_GEN_81),
    .io_req_old_meta_coh_state          (_GEN_82),
    .io_req_old_meta_tag                (_GEN_83),
    .io_req_way_en                      (_GEN_84),
    .io_req_sdq_id                      (sdq_alloc_id),
    .io_req_is_probe                    (io_req_is_probe_0),
    .io_idx_valid                       (_mshrs_5_io_idx_valid),
    .io_idx_bits                        (_mshrs_5_io_idx_bits),
    .io_way_valid                       (_mshrs_5_io_way_valid),
    .io_way_bits                        (_mshrs_5_io_way_bits),
    .io_tag_valid                       (_mshrs_5_io_tag_valid),
    .io_tag_bits                        (_mshrs_5_io_tag_bits),
    .io_mem_acquire_ready               (io_mem_acquire_ready & (idle ? ~_GEN_114 : state_5)),
    .io_mem_acquire_valid               (_mshrs_5_io_mem_acquire_valid),
    .io_mem_acquire_bits_param          (_mshrs_5_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source         (_mshrs_5_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address        (_mshrs_5_io_mem_acquire_bits_address),
    .io_mem_grant_ready                 (_mshrs_5_io_mem_grant_ready),
    .io_mem_grant_valid                 (_GEN_100 & io_mem_grant_valid),
    .io_mem_grant_bits_opcode           (io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param            (io_mem_grant_bits_param),
    .io_mem_grant_bits_size             (io_mem_grant_bits_size),
    .io_mem_grant_bits_sink             (io_mem_grant_bits_sink),
    .io_mem_grant_bits_data             (io_mem_grant_bits_data),
    .io_mem_finish_ready                (io_mem_finish_ready & (beatsLeft_1 ? state_1_5 : ~_GEN_124)),
    .io_mem_finish_valid                (_mshrs_5_io_mem_finish_valid),
    .io_mem_finish_bits_sink            (_mshrs_5_io_mem_finish_bits_sink),
    .io_prober_state_valid              (io_prober_state_valid),
    .io_prober_state_bits               (io_prober_state_bits),
    .io_refill_ready                    (_refill_arb_io_in_5_ready),
    .io_refill_valid                    (_mshrs_5_io_refill_valid),
    .io_refill_bits_way_en              (_mshrs_5_io_refill_bits_way_en),
    .io_refill_bits_addr                (_mshrs_5_io_refill_bits_addr),
    .io_refill_bits_data                (_mshrs_5_io_refill_bits_data),
    .io_meta_write_ready                (_meta_write_arb_io_in_5_ready),
    .io_meta_write_valid                (_mshrs_5_io_meta_write_valid),
    .io_meta_write_bits_idx             (_mshrs_5_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en          (_mshrs_5_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state  (_mshrs_5_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag        (_mshrs_5_io_meta_write_bits_data_tag),
    .io_meta_read_ready                 (_meta_read_arb_io_in_5_ready),
    .io_meta_read_valid                 (_mshrs_5_io_meta_read_valid),
    .io_meta_read_bits_idx              (_mshrs_5_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en           (_mshrs_5_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag              (_mshrs_5_io_meta_read_bits_tag),
    .io_meta_resp_valid                 (io_meta_resp_valid),
    .io_meta_resp_bits_coh_state        (io_meta_resp_bits_coh_state),
    .io_wb_req_ready                    (_wb_req_arb_io_in_5_ready),
    .io_wb_req_valid                    (_mshrs_5_io_wb_req_valid),
    .io_wb_req_bits_tag                 (_mshrs_5_io_wb_req_bits_tag),
    .io_wb_req_bits_idx                 (_mshrs_5_io_wb_req_bits_idx),
    .io_wb_req_bits_param               (_mshrs_5_io_wb_req_bits_param),
    .io_wb_req_bits_way_en              (_mshrs_5_io_wb_req_bits_way_en),
    .io_commit_val                      (_mshrs_5_io_commit_val),
    .io_commit_addr                     (_mshrs_5_io_commit_addr),
    .io_commit_coh_state                (_mshrs_5_io_commit_coh_state),
    .io_lb_read_ready                   (_lb_read_arb_io_in_5_ready),
    .io_lb_read_valid                   (_mshrs_5_io_lb_read_valid),
    .io_lb_read_bits_id                 (_mshrs_5_io_lb_read_bits_id),
    .io_lb_read_bits_offset             (_mshrs_5_io_lb_read_bits_offset),
    .io_lb_resp                         (lb_read_data),
    .io_lb_write_ready                  (_lb_write_arb_io_in_5_ready),
    .io_lb_write_valid                  (_mshrs_5_io_lb_write_valid),
    .io_lb_write_bits_id                (_mshrs_5_io_lb_write_bits_id),
    .io_lb_write_bits_offset            (_mshrs_5_io_lb_write_bits_offset),
    .io_lb_write_bits_data              (_mshrs_5_io_lb_write_bits_data),
    .io_replay_ready                    (_replay_arb_io_in_5_ready),
    .io_replay_valid                    (_mshrs_5_io_replay_valid),
    .io_replay_bits_uop_uopc            (_mshrs_5_io_replay_bits_uop_uopc),
    .io_replay_bits_uop_inst            (_mshrs_5_io_replay_bits_uop_inst),
    .io_replay_bits_uop_debug_inst      (_mshrs_5_io_replay_bits_uop_debug_inst),
    .io_replay_bits_uop_is_rvc          (_mshrs_5_io_replay_bits_uop_is_rvc),
    .io_replay_bits_uop_debug_pc        (_mshrs_5_io_replay_bits_uop_debug_pc),
    .io_replay_bits_uop_iq_type         (_mshrs_5_io_replay_bits_uop_iq_type),
    .io_replay_bits_uop_fu_code         (_mshrs_5_io_replay_bits_uop_fu_code),
    .io_replay_bits_uop_ctrl_br_type    (_mshrs_5_io_replay_bits_uop_ctrl_br_type),
    .io_replay_bits_uop_ctrl_op1_sel    (_mshrs_5_io_replay_bits_uop_ctrl_op1_sel),
    .io_replay_bits_uop_ctrl_op2_sel    (_mshrs_5_io_replay_bits_uop_ctrl_op2_sel),
    .io_replay_bits_uop_ctrl_imm_sel    (_mshrs_5_io_replay_bits_uop_ctrl_imm_sel),
    .io_replay_bits_uop_ctrl_op_fcn     (_mshrs_5_io_replay_bits_uop_ctrl_op_fcn),
    .io_replay_bits_uop_ctrl_fcn_dw     (_mshrs_5_io_replay_bits_uop_ctrl_fcn_dw),
    .io_replay_bits_uop_ctrl_csr_cmd    (_mshrs_5_io_replay_bits_uop_ctrl_csr_cmd),
    .io_replay_bits_uop_ctrl_is_load    (_mshrs_5_io_replay_bits_uop_ctrl_is_load),
    .io_replay_bits_uop_ctrl_is_sta     (_mshrs_5_io_replay_bits_uop_ctrl_is_sta),
    .io_replay_bits_uop_ctrl_is_std     (_mshrs_5_io_replay_bits_uop_ctrl_is_std),
    .io_replay_bits_uop_iw_state        (_mshrs_5_io_replay_bits_uop_iw_state),
    .io_replay_bits_uop_iw_p1_poisoned  (_mshrs_5_io_replay_bits_uop_iw_p1_poisoned),
    .io_replay_bits_uop_iw_p2_poisoned  (_mshrs_5_io_replay_bits_uop_iw_p2_poisoned),
    .io_replay_bits_uop_is_br           (_mshrs_5_io_replay_bits_uop_is_br),
    .io_replay_bits_uop_is_jalr         (_mshrs_5_io_replay_bits_uop_is_jalr),
    .io_replay_bits_uop_is_jal          (_mshrs_5_io_replay_bits_uop_is_jal),
    .io_replay_bits_uop_is_sfb          (_mshrs_5_io_replay_bits_uop_is_sfb),
    .io_replay_bits_uop_br_mask         (_mshrs_5_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_br_tag          (_mshrs_5_io_replay_bits_uop_br_tag),
    .io_replay_bits_uop_ftq_idx         (_mshrs_5_io_replay_bits_uop_ftq_idx),
    .io_replay_bits_uop_edge_inst       (_mshrs_5_io_replay_bits_uop_edge_inst),
    .io_replay_bits_uop_pc_lob          (_mshrs_5_io_replay_bits_uop_pc_lob),
    .io_replay_bits_uop_taken           (_mshrs_5_io_replay_bits_uop_taken),
    .io_replay_bits_uop_imm_packed      (_mshrs_5_io_replay_bits_uop_imm_packed),
    .io_replay_bits_uop_csr_addr        (_mshrs_5_io_replay_bits_uop_csr_addr),
    .io_replay_bits_uop_rob_idx         (_mshrs_5_io_replay_bits_uop_rob_idx),
    .io_replay_bits_uop_ldq_idx         (_mshrs_5_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx         (_mshrs_5_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_rxq_idx         (_mshrs_5_io_replay_bits_uop_rxq_idx),
    .io_replay_bits_uop_pdst            (_mshrs_5_io_replay_bits_uop_pdst),
    .io_replay_bits_uop_prs1            (_mshrs_5_io_replay_bits_uop_prs1),
    .io_replay_bits_uop_prs2            (_mshrs_5_io_replay_bits_uop_prs2),
    .io_replay_bits_uop_prs3            (_mshrs_5_io_replay_bits_uop_prs3),
    .io_replay_bits_uop_ppred           (_mshrs_5_io_replay_bits_uop_ppred),
    .io_replay_bits_uop_prs1_busy       (_mshrs_5_io_replay_bits_uop_prs1_busy),
    .io_replay_bits_uop_prs2_busy       (_mshrs_5_io_replay_bits_uop_prs2_busy),
    .io_replay_bits_uop_prs3_busy       (_mshrs_5_io_replay_bits_uop_prs3_busy),
    .io_replay_bits_uop_ppred_busy      (_mshrs_5_io_replay_bits_uop_ppred_busy),
    .io_replay_bits_uop_stale_pdst      (_mshrs_5_io_replay_bits_uop_stale_pdst),
    .io_replay_bits_uop_exception       (_mshrs_5_io_replay_bits_uop_exception),
    .io_replay_bits_uop_exc_cause       (_mshrs_5_io_replay_bits_uop_exc_cause),
    .io_replay_bits_uop_bypassable      (_mshrs_5_io_replay_bits_uop_bypassable),
    .io_replay_bits_uop_mem_cmd         (_mshrs_5_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size        (_mshrs_5_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed      (_mshrs_5_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_fence        (_mshrs_5_io_replay_bits_uop_is_fence),
    .io_replay_bits_uop_is_fencei       (_mshrs_5_io_replay_bits_uop_is_fencei),
    .io_replay_bits_uop_is_amo          (_mshrs_5_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq        (_mshrs_5_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq        (_mshrs_5_io_replay_bits_uop_uses_stq),
    .io_replay_bits_uop_is_sys_pc2epc   (_mshrs_5_io_replay_bits_uop_is_sys_pc2epc),
    .io_replay_bits_uop_is_unique       (_mshrs_5_io_replay_bits_uop_is_unique),
    .io_replay_bits_uop_flush_on_commit (_mshrs_5_io_replay_bits_uop_flush_on_commit),
    .io_replay_bits_uop_ldst_is_rs1     (_mshrs_5_io_replay_bits_uop_ldst_is_rs1),
    .io_replay_bits_uop_ldst            (_mshrs_5_io_replay_bits_uop_ldst),
    .io_replay_bits_uop_lrs1            (_mshrs_5_io_replay_bits_uop_lrs1),
    .io_replay_bits_uop_lrs2            (_mshrs_5_io_replay_bits_uop_lrs2),
    .io_replay_bits_uop_lrs3            (_mshrs_5_io_replay_bits_uop_lrs3),
    .io_replay_bits_uop_ldst_val        (_mshrs_5_io_replay_bits_uop_ldst_val),
    .io_replay_bits_uop_dst_rtype       (_mshrs_5_io_replay_bits_uop_dst_rtype),
    .io_replay_bits_uop_lrs1_rtype      (_mshrs_5_io_replay_bits_uop_lrs1_rtype),
    .io_replay_bits_uop_lrs2_rtype      (_mshrs_5_io_replay_bits_uop_lrs2_rtype),
    .io_replay_bits_uop_frs3_en         (_mshrs_5_io_replay_bits_uop_frs3_en),
    .io_replay_bits_uop_fp_val          (_mshrs_5_io_replay_bits_uop_fp_val),
    .io_replay_bits_uop_fp_single       (_mshrs_5_io_replay_bits_uop_fp_single),
    .io_replay_bits_uop_xcpt_pf_if      (_mshrs_5_io_replay_bits_uop_xcpt_pf_if),
    .io_replay_bits_uop_xcpt_ae_if      (_mshrs_5_io_replay_bits_uop_xcpt_ae_if),
    .io_replay_bits_uop_xcpt_ma_if      (_mshrs_5_io_replay_bits_uop_xcpt_ma_if),
    .io_replay_bits_uop_bp_debug_if     (_mshrs_5_io_replay_bits_uop_bp_debug_if),
    .io_replay_bits_uop_bp_xcpt_if      (_mshrs_5_io_replay_bits_uop_bp_xcpt_if),
    .io_replay_bits_uop_debug_fsrc      (_mshrs_5_io_replay_bits_uop_debug_fsrc),
    .io_replay_bits_uop_debug_tsrc      (_mshrs_5_io_replay_bits_uop_debug_tsrc),
    .io_replay_bits_addr                (_mshrs_5_io_replay_bits_addr),
    .io_replay_bits_is_hella            (_mshrs_5_io_replay_bits_is_hella),
    .io_replay_bits_way_en              (_mshrs_5_io_replay_bits_way_en),
    .io_replay_bits_sdq_id              (_mshrs_5_io_replay_bits_sdq_id),
    .io_resp_ready                      (_resp_arb_io_in_5_ready),
    .io_resp_valid                      (_mshrs_5_io_resp_valid),
    .io_resp_bits_uop_uopc              (_mshrs_5_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst              (_mshrs_5_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst        (_mshrs_5_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc            (_mshrs_5_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc          (_mshrs_5_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type           (_mshrs_5_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code           (_mshrs_5_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type      (_mshrs_5_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel      (_mshrs_5_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel      (_mshrs_5_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel      (_mshrs_5_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn       (_mshrs_5_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw       (_mshrs_5_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd      (_mshrs_5_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load      (_mshrs_5_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta       (_mshrs_5_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std       (_mshrs_5_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state          (_mshrs_5_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned    (_mshrs_5_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned    (_mshrs_5_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br             (_mshrs_5_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr           (_mshrs_5_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal            (_mshrs_5_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb            (_mshrs_5_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask           (_mshrs_5_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag            (_mshrs_5_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx           (_mshrs_5_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst         (_mshrs_5_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob            (_mshrs_5_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken             (_mshrs_5_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed        (_mshrs_5_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr          (_mshrs_5_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx           (_mshrs_5_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx           (_mshrs_5_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx           (_mshrs_5_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx           (_mshrs_5_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst              (_mshrs_5_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1              (_mshrs_5_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2              (_mshrs_5_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3              (_mshrs_5_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred             (_mshrs_5_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy         (_mshrs_5_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy         (_mshrs_5_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy         (_mshrs_5_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy        (_mshrs_5_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst        (_mshrs_5_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception         (_mshrs_5_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause         (_mshrs_5_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable        (_mshrs_5_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd           (_mshrs_5_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size          (_mshrs_5_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed        (_mshrs_5_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence          (_mshrs_5_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei         (_mshrs_5_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo            (_mshrs_5_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq          (_mshrs_5_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq          (_mshrs_5_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc     (_mshrs_5_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique         (_mshrs_5_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit   (_mshrs_5_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1       (_mshrs_5_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst              (_mshrs_5_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1              (_mshrs_5_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2              (_mshrs_5_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3              (_mshrs_5_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val          (_mshrs_5_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype         (_mshrs_5_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype        (_mshrs_5_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype        (_mshrs_5_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en           (_mshrs_5_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val            (_mshrs_5_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single         (_mshrs_5_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if        (_mshrs_5_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if        (_mshrs_5_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if        (_mshrs_5_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if       (_mshrs_5_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if        (_mshrs_5_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc        (_mshrs_5_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc        (_mshrs_5_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data                  (_mshrs_5_io_resp_bits_data),
    .io_resp_bits_is_hella              (_mshrs_5_io_resp_bits_is_hella),
    .io_wb_resp                         (io_wb_resp),
    .io_probe_rdy                       (_mshrs_5_io_probe_rdy)
  );
  BoomMSHR mshrs_6 (
    .clock                              (clock),
    .reset                              (reset),
    .io_id                              (3'h6),
    .io_req_pri_val                     (mshr_alloc_idx_REG == 3'h6 & pri_val),
    .io_req_pri_rdy                     (_mshrs_6_io_req_pri_rdy),
    .io_req_sec_val                     (_mshr_io_req_sec_val_T_27),
    .io_req_sec_rdy                     (_mshrs_6_io_req_sec_rdy),
    .io_clear_prefetch                  (io_clear_all & ~_GEN | _GEN & _GEN_93 & cacheable & ~_GEN_86 | io_req_is_probe_0 & _GEN_93),
    .io_brupdate_b1_resolve_mask        (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask     (io_brupdate_b1_mispredict_mask),
    .io_exception                       (io_exception),
    .io_req_uop_uopc                    (_GEN_0),
    .io_req_uop_inst                    (_GEN_1),
    .io_req_uop_debug_inst              (_GEN_2),
    .io_req_uop_is_rvc                  (_GEN_3),
    .io_req_uop_debug_pc                (_GEN_4),
    .io_req_uop_iq_type                 (_GEN_5),
    .io_req_uop_fu_code                 (_GEN_6),
    .io_req_uop_ctrl_br_type            (_GEN_7),
    .io_req_uop_ctrl_op1_sel            (_GEN_8),
    .io_req_uop_ctrl_op2_sel            (_GEN_9),
    .io_req_uop_ctrl_imm_sel            (_GEN_10),
    .io_req_uop_ctrl_op_fcn             (_GEN_11),
    .io_req_uop_ctrl_fcn_dw             (_GEN_12),
    .io_req_uop_ctrl_csr_cmd            (_GEN_13),
    .io_req_uop_ctrl_is_load            (_GEN_14),
    .io_req_uop_ctrl_is_sta             (_GEN_15),
    .io_req_uop_ctrl_is_std             (_GEN_16),
    .io_req_uop_iw_state                (_GEN_17),
    .io_req_uop_iw_p1_poisoned          (_GEN_18),
    .io_req_uop_iw_p2_poisoned          (_GEN_19),
    .io_req_uop_is_br                   (_GEN_20),
    .io_req_uop_is_jalr                 (_GEN_21),
    .io_req_uop_is_jal                  (_GEN_22),
    .io_req_uop_is_sfb                  (_GEN_23),
    .io_req_uop_br_mask                 (_GEN_24),
    .io_req_uop_br_tag                  (_GEN_25),
    .io_req_uop_ftq_idx                 (_GEN_26),
    .io_req_uop_edge_inst               (_GEN_27),
    .io_req_uop_pc_lob                  (_GEN_28),
    .io_req_uop_taken                   (_GEN_29),
    .io_req_uop_imm_packed              (_GEN_30),
    .io_req_uop_csr_addr                (_GEN_31),
    .io_req_uop_rob_idx                 (_GEN_32),
    .io_req_uop_ldq_idx                 (_GEN_33),
    .io_req_uop_stq_idx                 (_GEN_34),
    .io_req_uop_rxq_idx                 (_GEN_35),
    .io_req_uop_pdst                    (_GEN_36),
    .io_req_uop_prs1                    (_GEN_37),
    .io_req_uop_prs2                    (_GEN_38),
    .io_req_uop_prs3                    (_GEN_39),
    .io_req_uop_ppred                   (_GEN_40),
    .io_req_uop_prs1_busy               (_GEN_41),
    .io_req_uop_prs2_busy               (_GEN_42),
    .io_req_uop_prs3_busy               (_GEN_43),
    .io_req_uop_ppred_busy              (_GEN_44),
    .io_req_uop_stale_pdst              (_GEN_45),
    .io_req_uop_exception               (_GEN_46),
    .io_req_uop_exc_cause               (_GEN_47),
    .io_req_uop_bypassable              (_GEN_48),
    .io_req_uop_mem_cmd                 (_GEN_49),
    .io_req_uop_mem_size                (_GEN_50),
    .io_req_uop_mem_signed              (_GEN_51),
    .io_req_uop_is_fence                (_GEN_52),
    .io_req_uop_is_fencei               (_GEN_53),
    .io_req_uop_is_amo                  (_GEN_54),
    .io_req_uop_uses_ldq                (_GEN_55),
    .io_req_uop_uses_stq                (_GEN_56),
    .io_req_uop_is_sys_pc2epc           (_GEN_57),
    .io_req_uop_is_unique               (_GEN_58),
    .io_req_uop_flush_on_commit         (_GEN_59),
    .io_req_uop_ldst_is_rs1             (_GEN_60),
    .io_req_uop_ldst                    (_GEN_61),
    .io_req_uop_lrs1                    (_GEN_62),
    .io_req_uop_lrs2                    (_GEN_63),
    .io_req_uop_lrs3                    (_GEN_64),
    .io_req_uop_ldst_val                (_GEN_65),
    .io_req_uop_dst_rtype               (_GEN_66),
    .io_req_uop_lrs1_rtype              (_GEN_67),
    .io_req_uop_lrs2_rtype              (_GEN_68),
    .io_req_uop_frs3_en                 (_GEN_69),
    .io_req_uop_fp_val                  (_GEN_70),
    .io_req_uop_fp_single               (_GEN_71),
    .io_req_uop_xcpt_pf_if              (_GEN_72),
    .io_req_uop_xcpt_ae_if              (_GEN_73),
    .io_req_uop_xcpt_ma_if              (_GEN_74),
    .io_req_uop_bp_debug_if             (_GEN_75),
    .io_req_uop_bp_xcpt_if              (_GEN_76),
    .io_req_uop_debug_fsrc              (_GEN_77),
    .io_req_uop_debug_tsrc              (_GEN_78),
    .io_req_addr                        (_cacheable_T_1),
    .io_req_data                        (_GEN_79),
    .io_req_is_hella                    (_GEN_80),
    .io_req_tag_match                   (_GEN_81),
    .io_req_old_meta_coh_state          (_GEN_82),
    .io_req_old_meta_tag                (_GEN_83),
    .io_req_way_en                      (_GEN_84),
    .io_req_sdq_id                      (sdq_alloc_id),
    .io_req_is_probe                    (io_req_is_probe_0),
    .io_idx_valid                       (_mshrs_6_io_idx_valid),
    .io_idx_bits                        (_mshrs_6_io_idx_bits),
    .io_way_valid                       (_mshrs_6_io_way_valid),
    .io_way_bits                        (_mshrs_6_io_way_bits),
    .io_tag_valid                       (_mshrs_6_io_tag_valid),
    .io_tag_bits                        (_mshrs_6_io_tag_bits),
    .io_mem_acquire_ready               (io_mem_acquire_ready & (idle ? ~_GEN_113 : state_6)),
    .io_mem_acquire_valid               (_mshrs_6_io_mem_acquire_valid),
    .io_mem_acquire_bits_param          (_mshrs_6_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source         (_mshrs_6_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address        (_mshrs_6_io_mem_acquire_bits_address),
    .io_mem_grant_ready                 (_mshrs_6_io_mem_grant_ready),
    .io_mem_grant_valid                 (_GEN_101 & io_mem_grant_valid),
    .io_mem_grant_bits_opcode           (io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param            (io_mem_grant_bits_param),
    .io_mem_grant_bits_size             (io_mem_grant_bits_size),
    .io_mem_grant_bits_sink             (io_mem_grant_bits_sink),
    .io_mem_grant_bits_data             (io_mem_grant_bits_data),
    .io_mem_finish_ready                (io_mem_finish_ready & (beatsLeft_1 ? state_1_6 : ~_GEN_123)),
    .io_mem_finish_valid                (_mshrs_6_io_mem_finish_valid),
    .io_mem_finish_bits_sink            (_mshrs_6_io_mem_finish_bits_sink),
    .io_prober_state_valid              (io_prober_state_valid),
    .io_prober_state_bits               (io_prober_state_bits),
    .io_refill_ready                    (_refill_arb_io_in_6_ready),
    .io_refill_valid                    (_mshrs_6_io_refill_valid),
    .io_refill_bits_way_en              (_mshrs_6_io_refill_bits_way_en),
    .io_refill_bits_addr                (_mshrs_6_io_refill_bits_addr),
    .io_refill_bits_data                (_mshrs_6_io_refill_bits_data),
    .io_meta_write_ready                (_meta_write_arb_io_in_6_ready),
    .io_meta_write_valid                (_mshrs_6_io_meta_write_valid),
    .io_meta_write_bits_idx             (_mshrs_6_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en          (_mshrs_6_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state  (_mshrs_6_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag        (_mshrs_6_io_meta_write_bits_data_tag),
    .io_meta_read_ready                 (_meta_read_arb_io_in_6_ready),
    .io_meta_read_valid                 (_mshrs_6_io_meta_read_valid),
    .io_meta_read_bits_idx              (_mshrs_6_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en           (_mshrs_6_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag              (_mshrs_6_io_meta_read_bits_tag),
    .io_meta_resp_valid                 (io_meta_resp_valid),
    .io_meta_resp_bits_coh_state        (io_meta_resp_bits_coh_state),
    .io_wb_req_ready                    (_wb_req_arb_io_in_6_ready),
    .io_wb_req_valid                    (_mshrs_6_io_wb_req_valid),
    .io_wb_req_bits_tag                 (_mshrs_6_io_wb_req_bits_tag),
    .io_wb_req_bits_idx                 (_mshrs_6_io_wb_req_bits_idx),
    .io_wb_req_bits_param               (_mshrs_6_io_wb_req_bits_param),
    .io_wb_req_bits_way_en              (_mshrs_6_io_wb_req_bits_way_en),
    .io_commit_val                      (_mshrs_6_io_commit_val),
    .io_commit_addr                     (_mshrs_6_io_commit_addr),
    .io_commit_coh_state                (_mshrs_6_io_commit_coh_state),
    .io_lb_read_ready                   (_lb_read_arb_io_in_6_ready),
    .io_lb_read_valid                   (_mshrs_6_io_lb_read_valid),
    .io_lb_read_bits_id                 (_mshrs_6_io_lb_read_bits_id),
    .io_lb_read_bits_offset             (_mshrs_6_io_lb_read_bits_offset),
    .io_lb_resp                         (lb_read_data),
    .io_lb_write_ready                  (_lb_write_arb_io_in_6_ready),
    .io_lb_write_valid                  (_mshrs_6_io_lb_write_valid),
    .io_lb_write_bits_id                (_mshrs_6_io_lb_write_bits_id),
    .io_lb_write_bits_offset            (_mshrs_6_io_lb_write_bits_offset),
    .io_lb_write_bits_data              (_mshrs_6_io_lb_write_bits_data),
    .io_replay_ready                    (_replay_arb_io_in_6_ready),
    .io_replay_valid                    (_mshrs_6_io_replay_valid),
    .io_replay_bits_uop_uopc            (_mshrs_6_io_replay_bits_uop_uopc),
    .io_replay_bits_uop_inst            (_mshrs_6_io_replay_bits_uop_inst),
    .io_replay_bits_uop_debug_inst      (_mshrs_6_io_replay_bits_uop_debug_inst),
    .io_replay_bits_uop_is_rvc          (_mshrs_6_io_replay_bits_uop_is_rvc),
    .io_replay_bits_uop_debug_pc        (_mshrs_6_io_replay_bits_uop_debug_pc),
    .io_replay_bits_uop_iq_type         (_mshrs_6_io_replay_bits_uop_iq_type),
    .io_replay_bits_uop_fu_code         (_mshrs_6_io_replay_bits_uop_fu_code),
    .io_replay_bits_uop_ctrl_br_type    (_mshrs_6_io_replay_bits_uop_ctrl_br_type),
    .io_replay_bits_uop_ctrl_op1_sel    (_mshrs_6_io_replay_bits_uop_ctrl_op1_sel),
    .io_replay_bits_uop_ctrl_op2_sel    (_mshrs_6_io_replay_bits_uop_ctrl_op2_sel),
    .io_replay_bits_uop_ctrl_imm_sel    (_mshrs_6_io_replay_bits_uop_ctrl_imm_sel),
    .io_replay_bits_uop_ctrl_op_fcn     (_mshrs_6_io_replay_bits_uop_ctrl_op_fcn),
    .io_replay_bits_uop_ctrl_fcn_dw     (_mshrs_6_io_replay_bits_uop_ctrl_fcn_dw),
    .io_replay_bits_uop_ctrl_csr_cmd    (_mshrs_6_io_replay_bits_uop_ctrl_csr_cmd),
    .io_replay_bits_uop_ctrl_is_load    (_mshrs_6_io_replay_bits_uop_ctrl_is_load),
    .io_replay_bits_uop_ctrl_is_sta     (_mshrs_6_io_replay_bits_uop_ctrl_is_sta),
    .io_replay_bits_uop_ctrl_is_std     (_mshrs_6_io_replay_bits_uop_ctrl_is_std),
    .io_replay_bits_uop_iw_state        (_mshrs_6_io_replay_bits_uop_iw_state),
    .io_replay_bits_uop_iw_p1_poisoned  (_mshrs_6_io_replay_bits_uop_iw_p1_poisoned),
    .io_replay_bits_uop_iw_p2_poisoned  (_mshrs_6_io_replay_bits_uop_iw_p2_poisoned),
    .io_replay_bits_uop_is_br           (_mshrs_6_io_replay_bits_uop_is_br),
    .io_replay_bits_uop_is_jalr         (_mshrs_6_io_replay_bits_uop_is_jalr),
    .io_replay_bits_uop_is_jal          (_mshrs_6_io_replay_bits_uop_is_jal),
    .io_replay_bits_uop_is_sfb          (_mshrs_6_io_replay_bits_uop_is_sfb),
    .io_replay_bits_uop_br_mask         (_mshrs_6_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_br_tag          (_mshrs_6_io_replay_bits_uop_br_tag),
    .io_replay_bits_uop_ftq_idx         (_mshrs_6_io_replay_bits_uop_ftq_idx),
    .io_replay_bits_uop_edge_inst       (_mshrs_6_io_replay_bits_uop_edge_inst),
    .io_replay_bits_uop_pc_lob          (_mshrs_6_io_replay_bits_uop_pc_lob),
    .io_replay_bits_uop_taken           (_mshrs_6_io_replay_bits_uop_taken),
    .io_replay_bits_uop_imm_packed      (_mshrs_6_io_replay_bits_uop_imm_packed),
    .io_replay_bits_uop_csr_addr        (_mshrs_6_io_replay_bits_uop_csr_addr),
    .io_replay_bits_uop_rob_idx         (_mshrs_6_io_replay_bits_uop_rob_idx),
    .io_replay_bits_uop_ldq_idx         (_mshrs_6_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx         (_mshrs_6_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_rxq_idx         (_mshrs_6_io_replay_bits_uop_rxq_idx),
    .io_replay_bits_uop_pdst            (_mshrs_6_io_replay_bits_uop_pdst),
    .io_replay_bits_uop_prs1            (_mshrs_6_io_replay_bits_uop_prs1),
    .io_replay_bits_uop_prs2            (_mshrs_6_io_replay_bits_uop_prs2),
    .io_replay_bits_uop_prs3            (_mshrs_6_io_replay_bits_uop_prs3),
    .io_replay_bits_uop_ppred           (_mshrs_6_io_replay_bits_uop_ppred),
    .io_replay_bits_uop_prs1_busy       (_mshrs_6_io_replay_bits_uop_prs1_busy),
    .io_replay_bits_uop_prs2_busy       (_mshrs_6_io_replay_bits_uop_prs2_busy),
    .io_replay_bits_uop_prs3_busy       (_mshrs_6_io_replay_bits_uop_prs3_busy),
    .io_replay_bits_uop_ppred_busy      (_mshrs_6_io_replay_bits_uop_ppred_busy),
    .io_replay_bits_uop_stale_pdst      (_mshrs_6_io_replay_bits_uop_stale_pdst),
    .io_replay_bits_uop_exception       (_mshrs_6_io_replay_bits_uop_exception),
    .io_replay_bits_uop_exc_cause       (_mshrs_6_io_replay_bits_uop_exc_cause),
    .io_replay_bits_uop_bypassable      (_mshrs_6_io_replay_bits_uop_bypassable),
    .io_replay_bits_uop_mem_cmd         (_mshrs_6_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size        (_mshrs_6_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed      (_mshrs_6_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_fence        (_mshrs_6_io_replay_bits_uop_is_fence),
    .io_replay_bits_uop_is_fencei       (_mshrs_6_io_replay_bits_uop_is_fencei),
    .io_replay_bits_uop_is_amo          (_mshrs_6_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq        (_mshrs_6_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq        (_mshrs_6_io_replay_bits_uop_uses_stq),
    .io_replay_bits_uop_is_sys_pc2epc   (_mshrs_6_io_replay_bits_uop_is_sys_pc2epc),
    .io_replay_bits_uop_is_unique       (_mshrs_6_io_replay_bits_uop_is_unique),
    .io_replay_bits_uop_flush_on_commit (_mshrs_6_io_replay_bits_uop_flush_on_commit),
    .io_replay_bits_uop_ldst_is_rs1     (_mshrs_6_io_replay_bits_uop_ldst_is_rs1),
    .io_replay_bits_uop_ldst            (_mshrs_6_io_replay_bits_uop_ldst),
    .io_replay_bits_uop_lrs1            (_mshrs_6_io_replay_bits_uop_lrs1),
    .io_replay_bits_uop_lrs2            (_mshrs_6_io_replay_bits_uop_lrs2),
    .io_replay_bits_uop_lrs3            (_mshrs_6_io_replay_bits_uop_lrs3),
    .io_replay_bits_uop_ldst_val        (_mshrs_6_io_replay_bits_uop_ldst_val),
    .io_replay_bits_uop_dst_rtype       (_mshrs_6_io_replay_bits_uop_dst_rtype),
    .io_replay_bits_uop_lrs1_rtype      (_mshrs_6_io_replay_bits_uop_lrs1_rtype),
    .io_replay_bits_uop_lrs2_rtype      (_mshrs_6_io_replay_bits_uop_lrs2_rtype),
    .io_replay_bits_uop_frs3_en         (_mshrs_6_io_replay_bits_uop_frs3_en),
    .io_replay_bits_uop_fp_val          (_mshrs_6_io_replay_bits_uop_fp_val),
    .io_replay_bits_uop_fp_single       (_mshrs_6_io_replay_bits_uop_fp_single),
    .io_replay_bits_uop_xcpt_pf_if      (_mshrs_6_io_replay_bits_uop_xcpt_pf_if),
    .io_replay_bits_uop_xcpt_ae_if      (_mshrs_6_io_replay_bits_uop_xcpt_ae_if),
    .io_replay_bits_uop_xcpt_ma_if      (_mshrs_6_io_replay_bits_uop_xcpt_ma_if),
    .io_replay_bits_uop_bp_debug_if     (_mshrs_6_io_replay_bits_uop_bp_debug_if),
    .io_replay_bits_uop_bp_xcpt_if      (_mshrs_6_io_replay_bits_uop_bp_xcpt_if),
    .io_replay_bits_uop_debug_fsrc      (_mshrs_6_io_replay_bits_uop_debug_fsrc),
    .io_replay_bits_uop_debug_tsrc      (_mshrs_6_io_replay_bits_uop_debug_tsrc),
    .io_replay_bits_addr                (_mshrs_6_io_replay_bits_addr),
    .io_replay_bits_is_hella            (_mshrs_6_io_replay_bits_is_hella),
    .io_replay_bits_way_en              (_mshrs_6_io_replay_bits_way_en),
    .io_replay_bits_sdq_id              (_mshrs_6_io_replay_bits_sdq_id),
    .io_resp_ready                      (_resp_arb_io_in_6_ready),
    .io_resp_valid                      (_mshrs_6_io_resp_valid),
    .io_resp_bits_uop_uopc              (_mshrs_6_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst              (_mshrs_6_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst        (_mshrs_6_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc            (_mshrs_6_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc          (_mshrs_6_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type           (_mshrs_6_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code           (_mshrs_6_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type      (_mshrs_6_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel      (_mshrs_6_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel      (_mshrs_6_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel      (_mshrs_6_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn       (_mshrs_6_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw       (_mshrs_6_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd      (_mshrs_6_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load      (_mshrs_6_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta       (_mshrs_6_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std       (_mshrs_6_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state          (_mshrs_6_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned    (_mshrs_6_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned    (_mshrs_6_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br             (_mshrs_6_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr           (_mshrs_6_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal            (_mshrs_6_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb            (_mshrs_6_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask           (_mshrs_6_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag            (_mshrs_6_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx           (_mshrs_6_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst         (_mshrs_6_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob            (_mshrs_6_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken             (_mshrs_6_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed        (_mshrs_6_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr          (_mshrs_6_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx           (_mshrs_6_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx           (_mshrs_6_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx           (_mshrs_6_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx           (_mshrs_6_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst              (_mshrs_6_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1              (_mshrs_6_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2              (_mshrs_6_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3              (_mshrs_6_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred             (_mshrs_6_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy         (_mshrs_6_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy         (_mshrs_6_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy         (_mshrs_6_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy        (_mshrs_6_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst        (_mshrs_6_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception         (_mshrs_6_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause         (_mshrs_6_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable        (_mshrs_6_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd           (_mshrs_6_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size          (_mshrs_6_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed        (_mshrs_6_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence          (_mshrs_6_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei         (_mshrs_6_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo            (_mshrs_6_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq          (_mshrs_6_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq          (_mshrs_6_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc     (_mshrs_6_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique         (_mshrs_6_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit   (_mshrs_6_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1       (_mshrs_6_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst              (_mshrs_6_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1              (_mshrs_6_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2              (_mshrs_6_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3              (_mshrs_6_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val          (_mshrs_6_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype         (_mshrs_6_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype        (_mshrs_6_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype        (_mshrs_6_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en           (_mshrs_6_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val            (_mshrs_6_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single         (_mshrs_6_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if        (_mshrs_6_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if        (_mshrs_6_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if        (_mshrs_6_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if       (_mshrs_6_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if        (_mshrs_6_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc        (_mshrs_6_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc        (_mshrs_6_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data                  (_mshrs_6_io_resp_bits_data),
    .io_resp_bits_is_hella              (_mshrs_6_io_resp_bits_is_hella),
    .io_wb_resp                         (io_wb_resp),
    .io_probe_rdy                       (_mshrs_6_io_probe_rdy)
  );
  BoomMSHR mshrs_7 (
    .clock                              (clock),
    .reset                              (reset),
    .io_id                              (3'h7),
    .io_req_pri_val                     ((&mshr_alloc_idx_REG) & pri_val),
    .io_req_pri_rdy                     (_mshrs_7_io_req_pri_rdy),
    .io_req_sec_val                     (_mshr_io_req_sec_val_T_31),
    .io_req_sec_rdy                     (_mshrs_7_io_req_sec_rdy),
    .io_clear_prefetch                  (io_clear_all & ~_GEN | _GEN & _GEN_94 & cacheable & ~_GEN_86 | io_req_is_probe_0 & _GEN_94),
    .io_brupdate_b1_resolve_mask        (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask     (io_brupdate_b1_mispredict_mask),
    .io_exception                       (io_exception),
    .io_req_uop_uopc                    (_GEN_0),
    .io_req_uop_inst                    (_GEN_1),
    .io_req_uop_debug_inst              (_GEN_2),
    .io_req_uop_is_rvc                  (_GEN_3),
    .io_req_uop_debug_pc                (_GEN_4),
    .io_req_uop_iq_type                 (_GEN_5),
    .io_req_uop_fu_code                 (_GEN_6),
    .io_req_uop_ctrl_br_type            (_GEN_7),
    .io_req_uop_ctrl_op1_sel            (_GEN_8),
    .io_req_uop_ctrl_op2_sel            (_GEN_9),
    .io_req_uop_ctrl_imm_sel            (_GEN_10),
    .io_req_uop_ctrl_op_fcn             (_GEN_11),
    .io_req_uop_ctrl_fcn_dw             (_GEN_12),
    .io_req_uop_ctrl_csr_cmd            (_GEN_13),
    .io_req_uop_ctrl_is_load            (_GEN_14),
    .io_req_uop_ctrl_is_sta             (_GEN_15),
    .io_req_uop_ctrl_is_std             (_GEN_16),
    .io_req_uop_iw_state                (_GEN_17),
    .io_req_uop_iw_p1_poisoned          (_GEN_18),
    .io_req_uop_iw_p2_poisoned          (_GEN_19),
    .io_req_uop_is_br                   (_GEN_20),
    .io_req_uop_is_jalr                 (_GEN_21),
    .io_req_uop_is_jal                  (_GEN_22),
    .io_req_uop_is_sfb                  (_GEN_23),
    .io_req_uop_br_mask                 (_GEN_24),
    .io_req_uop_br_tag                  (_GEN_25),
    .io_req_uop_ftq_idx                 (_GEN_26),
    .io_req_uop_edge_inst               (_GEN_27),
    .io_req_uop_pc_lob                  (_GEN_28),
    .io_req_uop_taken                   (_GEN_29),
    .io_req_uop_imm_packed              (_GEN_30),
    .io_req_uop_csr_addr                (_GEN_31),
    .io_req_uop_rob_idx                 (_GEN_32),
    .io_req_uop_ldq_idx                 (_GEN_33),
    .io_req_uop_stq_idx                 (_GEN_34),
    .io_req_uop_rxq_idx                 (_GEN_35),
    .io_req_uop_pdst                    (_GEN_36),
    .io_req_uop_prs1                    (_GEN_37),
    .io_req_uop_prs2                    (_GEN_38),
    .io_req_uop_prs3                    (_GEN_39),
    .io_req_uop_ppred                   (_GEN_40),
    .io_req_uop_prs1_busy               (_GEN_41),
    .io_req_uop_prs2_busy               (_GEN_42),
    .io_req_uop_prs3_busy               (_GEN_43),
    .io_req_uop_ppred_busy              (_GEN_44),
    .io_req_uop_stale_pdst              (_GEN_45),
    .io_req_uop_exception               (_GEN_46),
    .io_req_uop_exc_cause               (_GEN_47),
    .io_req_uop_bypassable              (_GEN_48),
    .io_req_uop_mem_cmd                 (_GEN_49),
    .io_req_uop_mem_size                (_GEN_50),
    .io_req_uop_mem_signed              (_GEN_51),
    .io_req_uop_is_fence                (_GEN_52),
    .io_req_uop_is_fencei               (_GEN_53),
    .io_req_uop_is_amo                  (_GEN_54),
    .io_req_uop_uses_ldq                (_GEN_55),
    .io_req_uop_uses_stq                (_GEN_56),
    .io_req_uop_is_sys_pc2epc           (_GEN_57),
    .io_req_uop_is_unique               (_GEN_58),
    .io_req_uop_flush_on_commit         (_GEN_59),
    .io_req_uop_ldst_is_rs1             (_GEN_60),
    .io_req_uop_ldst                    (_GEN_61),
    .io_req_uop_lrs1                    (_GEN_62),
    .io_req_uop_lrs2                    (_GEN_63),
    .io_req_uop_lrs3                    (_GEN_64),
    .io_req_uop_ldst_val                (_GEN_65),
    .io_req_uop_dst_rtype               (_GEN_66),
    .io_req_uop_lrs1_rtype              (_GEN_67),
    .io_req_uop_lrs2_rtype              (_GEN_68),
    .io_req_uop_frs3_en                 (_GEN_69),
    .io_req_uop_fp_val                  (_GEN_70),
    .io_req_uop_fp_single               (_GEN_71),
    .io_req_uop_xcpt_pf_if              (_GEN_72),
    .io_req_uop_xcpt_ae_if              (_GEN_73),
    .io_req_uop_xcpt_ma_if              (_GEN_74),
    .io_req_uop_bp_debug_if             (_GEN_75),
    .io_req_uop_bp_xcpt_if              (_GEN_76),
    .io_req_uop_debug_fsrc              (_GEN_77),
    .io_req_uop_debug_tsrc              (_GEN_78),
    .io_req_addr                        (_cacheable_T_1),
    .io_req_data                        (_GEN_79),
    .io_req_is_hella                    (_GEN_80),
    .io_req_tag_match                   (_GEN_81),
    .io_req_old_meta_coh_state          (_GEN_82),
    .io_req_old_meta_tag                (_GEN_83),
    .io_req_way_en                      (_GEN_84),
    .io_req_sdq_id                      (sdq_alloc_id),
    .io_req_is_probe                    (io_req_is_probe_0),
    .io_idx_valid                       (_mshrs_7_io_idx_valid),
    .io_idx_bits                        (_mshrs_7_io_idx_bits),
    .io_way_valid                       (_mshrs_7_io_way_valid),
    .io_way_bits                        (_mshrs_7_io_way_bits),
    .io_tag_valid                       (_mshrs_7_io_tag_valid),
    .io_tag_bits                        (_mshrs_7_io_tag_bits),
    .io_mem_acquire_ready               (io_mem_acquire_ready & (idle ? ~_GEN_112 : state_7)),
    .io_mem_acquire_valid               (_mshrs_7_io_mem_acquire_valid),
    .io_mem_acquire_bits_param          (_mshrs_7_io_mem_acquire_bits_param),
    .io_mem_acquire_bits_source         (_mshrs_7_io_mem_acquire_bits_source),
    .io_mem_acquire_bits_address        (_mshrs_7_io_mem_acquire_bits_address),
    .io_mem_grant_ready                 (_mshrs_7_io_mem_grant_ready),
    .io_mem_grant_valid                 (_GEN_102 & io_mem_grant_valid),
    .io_mem_grant_bits_opcode           (io_mem_grant_bits_opcode),
    .io_mem_grant_bits_param            (io_mem_grant_bits_param),
    .io_mem_grant_bits_size             (io_mem_grant_bits_size),
    .io_mem_grant_bits_sink             (io_mem_grant_bits_sink),
    .io_mem_grant_bits_data             (io_mem_grant_bits_data),
    .io_mem_finish_ready                (io_mem_finish_ready & (beatsLeft_1 ? state_1_7 : ~_GEN_122)),
    .io_mem_finish_valid                (_mshrs_7_io_mem_finish_valid),
    .io_mem_finish_bits_sink            (_mshrs_7_io_mem_finish_bits_sink),
    .io_prober_state_valid              (io_prober_state_valid),
    .io_prober_state_bits               (io_prober_state_bits),
    .io_refill_ready                    (_refill_arb_io_in_7_ready),
    .io_refill_valid                    (_mshrs_7_io_refill_valid),
    .io_refill_bits_way_en              (_mshrs_7_io_refill_bits_way_en),
    .io_refill_bits_addr                (_mshrs_7_io_refill_bits_addr),
    .io_refill_bits_data                (_mshrs_7_io_refill_bits_data),
    .io_meta_write_ready                (_meta_write_arb_io_in_7_ready),
    .io_meta_write_valid                (_mshrs_7_io_meta_write_valid),
    .io_meta_write_bits_idx             (_mshrs_7_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en          (_mshrs_7_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state  (_mshrs_7_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag        (_mshrs_7_io_meta_write_bits_data_tag),
    .io_meta_read_ready                 (_meta_read_arb_io_in_7_ready),
    .io_meta_read_valid                 (_mshrs_7_io_meta_read_valid),
    .io_meta_read_bits_idx              (_mshrs_7_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en           (_mshrs_7_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag              (_mshrs_7_io_meta_read_bits_tag),
    .io_meta_resp_valid                 (io_meta_resp_valid),
    .io_meta_resp_bits_coh_state        (io_meta_resp_bits_coh_state),
    .io_wb_req_ready                    (_wb_req_arb_io_in_7_ready),
    .io_wb_req_valid                    (_mshrs_7_io_wb_req_valid),
    .io_wb_req_bits_tag                 (_mshrs_7_io_wb_req_bits_tag),
    .io_wb_req_bits_idx                 (_mshrs_7_io_wb_req_bits_idx),
    .io_wb_req_bits_param               (_mshrs_7_io_wb_req_bits_param),
    .io_wb_req_bits_way_en              (_mshrs_7_io_wb_req_bits_way_en),
    .io_commit_val                      (_mshrs_7_io_commit_val),
    .io_commit_addr                     (_mshrs_7_io_commit_addr),
    .io_commit_coh_state                (_mshrs_7_io_commit_coh_state),
    .io_lb_read_ready                   (_lb_read_arb_io_in_7_ready),
    .io_lb_read_valid                   (_mshrs_7_io_lb_read_valid),
    .io_lb_read_bits_id                 (_mshrs_7_io_lb_read_bits_id),
    .io_lb_read_bits_offset             (_mshrs_7_io_lb_read_bits_offset),
    .io_lb_resp                         (lb_read_data),
    .io_lb_write_ready                  (_lb_write_arb_io_in_7_ready),
    .io_lb_write_valid                  (_mshrs_7_io_lb_write_valid),
    .io_lb_write_bits_id                (_mshrs_7_io_lb_write_bits_id),
    .io_lb_write_bits_offset            (_mshrs_7_io_lb_write_bits_offset),
    .io_lb_write_bits_data              (_mshrs_7_io_lb_write_bits_data),
    .io_replay_ready                    (_replay_arb_io_in_7_ready),
    .io_replay_valid                    (_mshrs_7_io_replay_valid),
    .io_replay_bits_uop_uopc            (_mshrs_7_io_replay_bits_uop_uopc),
    .io_replay_bits_uop_inst            (_mshrs_7_io_replay_bits_uop_inst),
    .io_replay_bits_uop_debug_inst      (_mshrs_7_io_replay_bits_uop_debug_inst),
    .io_replay_bits_uop_is_rvc          (_mshrs_7_io_replay_bits_uop_is_rvc),
    .io_replay_bits_uop_debug_pc        (_mshrs_7_io_replay_bits_uop_debug_pc),
    .io_replay_bits_uop_iq_type         (_mshrs_7_io_replay_bits_uop_iq_type),
    .io_replay_bits_uop_fu_code         (_mshrs_7_io_replay_bits_uop_fu_code),
    .io_replay_bits_uop_ctrl_br_type    (_mshrs_7_io_replay_bits_uop_ctrl_br_type),
    .io_replay_bits_uop_ctrl_op1_sel    (_mshrs_7_io_replay_bits_uop_ctrl_op1_sel),
    .io_replay_bits_uop_ctrl_op2_sel    (_mshrs_7_io_replay_bits_uop_ctrl_op2_sel),
    .io_replay_bits_uop_ctrl_imm_sel    (_mshrs_7_io_replay_bits_uop_ctrl_imm_sel),
    .io_replay_bits_uop_ctrl_op_fcn     (_mshrs_7_io_replay_bits_uop_ctrl_op_fcn),
    .io_replay_bits_uop_ctrl_fcn_dw     (_mshrs_7_io_replay_bits_uop_ctrl_fcn_dw),
    .io_replay_bits_uop_ctrl_csr_cmd    (_mshrs_7_io_replay_bits_uop_ctrl_csr_cmd),
    .io_replay_bits_uop_ctrl_is_load    (_mshrs_7_io_replay_bits_uop_ctrl_is_load),
    .io_replay_bits_uop_ctrl_is_sta     (_mshrs_7_io_replay_bits_uop_ctrl_is_sta),
    .io_replay_bits_uop_ctrl_is_std     (_mshrs_7_io_replay_bits_uop_ctrl_is_std),
    .io_replay_bits_uop_iw_state        (_mshrs_7_io_replay_bits_uop_iw_state),
    .io_replay_bits_uop_iw_p1_poisoned  (_mshrs_7_io_replay_bits_uop_iw_p1_poisoned),
    .io_replay_bits_uop_iw_p2_poisoned  (_mshrs_7_io_replay_bits_uop_iw_p2_poisoned),
    .io_replay_bits_uop_is_br           (_mshrs_7_io_replay_bits_uop_is_br),
    .io_replay_bits_uop_is_jalr         (_mshrs_7_io_replay_bits_uop_is_jalr),
    .io_replay_bits_uop_is_jal          (_mshrs_7_io_replay_bits_uop_is_jal),
    .io_replay_bits_uop_is_sfb          (_mshrs_7_io_replay_bits_uop_is_sfb),
    .io_replay_bits_uop_br_mask         (_mshrs_7_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_br_tag          (_mshrs_7_io_replay_bits_uop_br_tag),
    .io_replay_bits_uop_ftq_idx         (_mshrs_7_io_replay_bits_uop_ftq_idx),
    .io_replay_bits_uop_edge_inst       (_mshrs_7_io_replay_bits_uop_edge_inst),
    .io_replay_bits_uop_pc_lob          (_mshrs_7_io_replay_bits_uop_pc_lob),
    .io_replay_bits_uop_taken           (_mshrs_7_io_replay_bits_uop_taken),
    .io_replay_bits_uop_imm_packed      (_mshrs_7_io_replay_bits_uop_imm_packed),
    .io_replay_bits_uop_csr_addr        (_mshrs_7_io_replay_bits_uop_csr_addr),
    .io_replay_bits_uop_rob_idx         (_mshrs_7_io_replay_bits_uop_rob_idx),
    .io_replay_bits_uop_ldq_idx         (_mshrs_7_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx         (_mshrs_7_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_rxq_idx         (_mshrs_7_io_replay_bits_uop_rxq_idx),
    .io_replay_bits_uop_pdst            (_mshrs_7_io_replay_bits_uop_pdst),
    .io_replay_bits_uop_prs1            (_mshrs_7_io_replay_bits_uop_prs1),
    .io_replay_bits_uop_prs2            (_mshrs_7_io_replay_bits_uop_prs2),
    .io_replay_bits_uop_prs3            (_mshrs_7_io_replay_bits_uop_prs3),
    .io_replay_bits_uop_ppred           (_mshrs_7_io_replay_bits_uop_ppred),
    .io_replay_bits_uop_prs1_busy       (_mshrs_7_io_replay_bits_uop_prs1_busy),
    .io_replay_bits_uop_prs2_busy       (_mshrs_7_io_replay_bits_uop_prs2_busy),
    .io_replay_bits_uop_prs3_busy       (_mshrs_7_io_replay_bits_uop_prs3_busy),
    .io_replay_bits_uop_ppred_busy      (_mshrs_7_io_replay_bits_uop_ppred_busy),
    .io_replay_bits_uop_stale_pdst      (_mshrs_7_io_replay_bits_uop_stale_pdst),
    .io_replay_bits_uop_exception       (_mshrs_7_io_replay_bits_uop_exception),
    .io_replay_bits_uop_exc_cause       (_mshrs_7_io_replay_bits_uop_exc_cause),
    .io_replay_bits_uop_bypassable      (_mshrs_7_io_replay_bits_uop_bypassable),
    .io_replay_bits_uop_mem_cmd         (_mshrs_7_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size        (_mshrs_7_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed      (_mshrs_7_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_fence        (_mshrs_7_io_replay_bits_uop_is_fence),
    .io_replay_bits_uop_is_fencei       (_mshrs_7_io_replay_bits_uop_is_fencei),
    .io_replay_bits_uop_is_amo          (_mshrs_7_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq        (_mshrs_7_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq        (_mshrs_7_io_replay_bits_uop_uses_stq),
    .io_replay_bits_uop_is_sys_pc2epc   (_mshrs_7_io_replay_bits_uop_is_sys_pc2epc),
    .io_replay_bits_uop_is_unique       (_mshrs_7_io_replay_bits_uop_is_unique),
    .io_replay_bits_uop_flush_on_commit (_mshrs_7_io_replay_bits_uop_flush_on_commit),
    .io_replay_bits_uop_ldst_is_rs1     (_mshrs_7_io_replay_bits_uop_ldst_is_rs1),
    .io_replay_bits_uop_ldst            (_mshrs_7_io_replay_bits_uop_ldst),
    .io_replay_bits_uop_lrs1            (_mshrs_7_io_replay_bits_uop_lrs1),
    .io_replay_bits_uop_lrs2            (_mshrs_7_io_replay_bits_uop_lrs2),
    .io_replay_bits_uop_lrs3            (_mshrs_7_io_replay_bits_uop_lrs3),
    .io_replay_bits_uop_ldst_val        (_mshrs_7_io_replay_bits_uop_ldst_val),
    .io_replay_bits_uop_dst_rtype       (_mshrs_7_io_replay_bits_uop_dst_rtype),
    .io_replay_bits_uop_lrs1_rtype      (_mshrs_7_io_replay_bits_uop_lrs1_rtype),
    .io_replay_bits_uop_lrs2_rtype      (_mshrs_7_io_replay_bits_uop_lrs2_rtype),
    .io_replay_bits_uop_frs3_en         (_mshrs_7_io_replay_bits_uop_frs3_en),
    .io_replay_bits_uop_fp_val          (_mshrs_7_io_replay_bits_uop_fp_val),
    .io_replay_bits_uop_fp_single       (_mshrs_7_io_replay_bits_uop_fp_single),
    .io_replay_bits_uop_xcpt_pf_if      (_mshrs_7_io_replay_bits_uop_xcpt_pf_if),
    .io_replay_bits_uop_xcpt_ae_if      (_mshrs_7_io_replay_bits_uop_xcpt_ae_if),
    .io_replay_bits_uop_xcpt_ma_if      (_mshrs_7_io_replay_bits_uop_xcpt_ma_if),
    .io_replay_bits_uop_bp_debug_if     (_mshrs_7_io_replay_bits_uop_bp_debug_if),
    .io_replay_bits_uop_bp_xcpt_if      (_mshrs_7_io_replay_bits_uop_bp_xcpt_if),
    .io_replay_bits_uop_debug_fsrc      (_mshrs_7_io_replay_bits_uop_debug_fsrc),
    .io_replay_bits_uop_debug_tsrc      (_mshrs_7_io_replay_bits_uop_debug_tsrc),
    .io_replay_bits_addr                (_mshrs_7_io_replay_bits_addr),
    .io_replay_bits_is_hella            (_mshrs_7_io_replay_bits_is_hella),
    .io_replay_bits_way_en              (_mshrs_7_io_replay_bits_way_en),
    .io_replay_bits_sdq_id              (_mshrs_7_io_replay_bits_sdq_id),
    .io_resp_ready                      (_resp_arb_io_in_7_ready),
    .io_resp_valid                      (_mshrs_7_io_resp_valid),
    .io_resp_bits_uop_uopc              (_mshrs_7_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst              (_mshrs_7_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst        (_mshrs_7_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc            (_mshrs_7_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc          (_mshrs_7_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type           (_mshrs_7_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code           (_mshrs_7_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type      (_mshrs_7_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel      (_mshrs_7_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel      (_mshrs_7_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel      (_mshrs_7_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn       (_mshrs_7_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw       (_mshrs_7_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd      (_mshrs_7_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load      (_mshrs_7_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta       (_mshrs_7_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std       (_mshrs_7_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state          (_mshrs_7_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned    (_mshrs_7_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned    (_mshrs_7_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br             (_mshrs_7_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr           (_mshrs_7_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal            (_mshrs_7_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb            (_mshrs_7_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask           (_mshrs_7_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag            (_mshrs_7_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx           (_mshrs_7_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst         (_mshrs_7_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob            (_mshrs_7_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken             (_mshrs_7_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed        (_mshrs_7_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr          (_mshrs_7_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx           (_mshrs_7_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx           (_mshrs_7_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx           (_mshrs_7_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx           (_mshrs_7_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst              (_mshrs_7_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1              (_mshrs_7_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2              (_mshrs_7_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3              (_mshrs_7_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred             (_mshrs_7_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy         (_mshrs_7_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy         (_mshrs_7_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy         (_mshrs_7_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy        (_mshrs_7_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst        (_mshrs_7_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception         (_mshrs_7_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause         (_mshrs_7_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable        (_mshrs_7_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd           (_mshrs_7_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size          (_mshrs_7_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed        (_mshrs_7_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence          (_mshrs_7_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei         (_mshrs_7_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo            (_mshrs_7_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq          (_mshrs_7_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq          (_mshrs_7_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc     (_mshrs_7_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique         (_mshrs_7_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit   (_mshrs_7_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1       (_mshrs_7_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst              (_mshrs_7_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1              (_mshrs_7_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2              (_mshrs_7_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3              (_mshrs_7_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val          (_mshrs_7_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype         (_mshrs_7_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype        (_mshrs_7_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype        (_mshrs_7_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en           (_mshrs_7_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val            (_mshrs_7_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single         (_mshrs_7_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if        (_mshrs_7_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if        (_mshrs_7_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if        (_mshrs_7_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if       (_mshrs_7_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if        (_mshrs_7_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc        (_mshrs_7_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc        (_mshrs_7_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data                  (_mshrs_7_io_resp_bits_data),
    .io_resp_bits_is_hella              (_mshrs_7_io_resp_bits_is_hella),
    .io_wb_resp                         (io_wb_resp),
    .io_probe_rdy                       (_mshrs_7_io_probe_rdy)
  );
  Arbiter_8 mmio_alloc_arb (
    .io_in_0_ready (_mmio_alloc_arb_io_in_0_ready),
    .io_out_ready  (_GEN & ~cacheable)
  );
  BoomIOMSHR mmios_0 (
    .clock                            (clock),
    .reset                            (reset),
    .io_req_ready                     (_mmios_0_io_req_ready),
    .io_req_valid                     (_mmio_alloc_arb_io_in_0_ready),
    .io_req_bits_uop_uopc             (_GEN_0),
    .io_req_bits_uop_inst             (_GEN_1),
    .io_req_bits_uop_debug_inst       (_GEN_2),
    .io_req_bits_uop_is_rvc           (_GEN_3),
    .io_req_bits_uop_debug_pc         (_GEN_4),
    .io_req_bits_uop_iq_type          (_GEN_5),
    .io_req_bits_uop_fu_code          (_GEN_6),
    .io_req_bits_uop_ctrl_br_type     (_GEN_7),
    .io_req_bits_uop_ctrl_op1_sel     (_GEN_8),
    .io_req_bits_uop_ctrl_op2_sel     (_GEN_9),
    .io_req_bits_uop_ctrl_imm_sel     (_GEN_10),
    .io_req_bits_uop_ctrl_op_fcn      (_GEN_11),
    .io_req_bits_uop_ctrl_fcn_dw      (_GEN_12),
    .io_req_bits_uop_ctrl_csr_cmd     (_GEN_13),
    .io_req_bits_uop_ctrl_is_load     (_GEN_14),
    .io_req_bits_uop_ctrl_is_sta      (_GEN_15),
    .io_req_bits_uop_ctrl_is_std      (_GEN_16),
    .io_req_bits_uop_iw_state         (_GEN_17),
    .io_req_bits_uop_iw_p1_poisoned   (_GEN_18),
    .io_req_bits_uop_iw_p2_poisoned   (_GEN_19),
    .io_req_bits_uop_is_br            (_GEN_20),
    .io_req_bits_uop_is_jalr          (_GEN_21),
    .io_req_bits_uop_is_jal           (_GEN_22),
    .io_req_bits_uop_is_sfb           (_GEN_23),
    .io_req_bits_uop_br_mask          (_GEN_24),
    .io_req_bits_uop_br_tag           (_GEN_25),
    .io_req_bits_uop_ftq_idx          (_GEN_26),
    .io_req_bits_uop_edge_inst        (_GEN_27),
    .io_req_bits_uop_pc_lob           (_GEN_28),
    .io_req_bits_uop_taken            (_GEN_29),
    .io_req_bits_uop_imm_packed       (_GEN_30),
    .io_req_bits_uop_csr_addr         (_GEN_31),
    .io_req_bits_uop_rob_idx          (_GEN_32),
    .io_req_bits_uop_ldq_idx          (_GEN_33),
    .io_req_bits_uop_stq_idx          (_GEN_34),
    .io_req_bits_uop_rxq_idx          (_GEN_35),
    .io_req_bits_uop_pdst             (_GEN_36),
    .io_req_bits_uop_prs1             (_GEN_37),
    .io_req_bits_uop_prs2             (_GEN_38),
    .io_req_bits_uop_prs3             (_GEN_39),
    .io_req_bits_uop_ppred            (_GEN_40),
    .io_req_bits_uop_prs1_busy        (_GEN_41),
    .io_req_bits_uop_prs2_busy        (_GEN_42),
    .io_req_bits_uop_prs3_busy        (_GEN_43),
    .io_req_bits_uop_ppred_busy       (_GEN_44),
    .io_req_bits_uop_stale_pdst       (_GEN_45),
    .io_req_bits_uop_exception        (_GEN_46),
    .io_req_bits_uop_exc_cause        (_GEN_47),
    .io_req_bits_uop_bypassable       (_GEN_48),
    .io_req_bits_uop_mem_cmd          (_GEN_49),
    .io_req_bits_uop_mem_size         (_GEN_50),
    .io_req_bits_uop_mem_signed       (_GEN_51),
    .io_req_bits_uop_is_fence         (_GEN_52),
    .io_req_bits_uop_is_fencei        (_GEN_53),
    .io_req_bits_uop_is_amo           (_GEN_54),
    .io_req_bits_uop_uses_ldq         (_GEN_55),
    .io_req_bits_uop_uses_stq         (_GEN_56),
    .io_req_bits_uop_is_sys_pc2epc    (_GEN_57),
    .io_req_bits_uop_is_unique        (_GEN_58),
    .io_req_bits_uop_flush_on_commit  (_GEN_59),
    .io_req_bits_uop_ldst_is_rs1      (_GEN_60),
    .io_req_bits_uop_ldst             (_GEN_61),
    .io_req_bits_uop_lrs1             (_GEN_62),
    .io_req_bits_uop_lrs2             (_GEN_63),
    .io_req_bits_uop_lrs3             (_GEN_64),
    .io_req_bits_uop_ldst_val         (_GEN_65),
    .io_req_bits_uop_dst_rtype        (_GEN_66),
    .io_req_bits_uop_lrs1_rtype       (_GEN_67),
    .io_req_bits_uop_lrs2_rtype       (_GEN_68),
    .io_req_bits_uop_frs3_en          (_GEN_69),
    .io_req_bits_uop_fp_val           (_GEN_70),
    .io_req_bits_uop_fp_single        (_GEN_71),
    .io_req_bits_uop_xcpt_pf_if       (_GEN_72),
    .io_req_bits_uop_xcpt_ae_if       (_GEN_73),
    .io_req_bits_uop_xcpt_ma_if       (_GEN_74),
    .io_req_bits_uop_bp_debug_if      (_GEN_75),
    .io_req_bits_uop_bp_xcpt_if       (_GEN_76),
    .io_req_bits_uop_debug_fsrc       (_GEN_77),
    .io_req_bits_uop_debug_tsrc       (_GEN_78),
    .io_req_bits_addr                 (_cacheable_T_1),
    .io_req_bits_data                 (_GEN_79),
    .io_req_bits_is_hella             (_GEN_80),
    .io_resp_ready                    (_resp_arb_io_in_8_ready),
    .io_resp_valid                    (_mmios_0_io_resp_valid),
    .io_resp_bits_uop_uopc            (_mmios_0_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst            (_mmios_0_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst      (_mmios_0_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc          (_mmios_0_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc        (_mmios_0_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type         (_mmios_0_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code         (_mmios_0_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type    (_mmios_0_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel    (_mmios_0_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel    (_mmios_0_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel    (_mmios_0_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn     (_mmios_0_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw     (_mmios_0_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd    (_mmios_0_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load    (_mmios_0_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta     (_mmios_0_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std     (_mmios_0_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state        (_mmios_0_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned  (_mmios_0_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned  (_mmios_0_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br           (_mmios_0_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr         (_mmios_0_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal          (_mmios_0_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb          (_mmios_0_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask         (_mmios_0_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag          (_mmios_0_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx         (_mmios_0_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst       (_mmios_0_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob          (_mmios_0_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken           (_mmios_0_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed      (_mmios_0_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr        (_mmios_0_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx         (_mmios_0_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx         (_mmios_0_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx         (_mmios_0_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx         (_mmios_0_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst            (_mmios_0_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1            (_mmios_0_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2            (_mmios_0_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3            (_mmios_0_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred           (_mmios_0_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy       (_mmios_0_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy       (_mmios_0_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy       (_mmios_0_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy      (_mmios_0_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst      (_mmios_0_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception       (_mmios_0_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause       (_mmios_0_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable      (_mmios_0_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd         (_mmios_0_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size        (_mmios_0_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed      (_mmios_0_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence        (_mmios_0_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei       (_mmios_0_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo          (_mmios_0_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq        (_mmios_0_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq        (_mmios_0_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc   (_mmios_0_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique       (_mmios_0_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit (_mmios_0_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1     (_mmios_0_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst            (_mmios_0_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1            (_mmios_0_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2            (_mmios_0_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3            (_mmios_0_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val        (_mmios_0_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype       (_mmios_0_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype      (_mmios_0_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype      (_mmios_0_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en         (_mmios_0_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val          (_mmios_0_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single       (_mmios_0_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if      (_mmios_0_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if      (_mmios_0_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if      (_mmios_0_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if     (_mmios_0_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if      (_mmios_0_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc      (_mmios_0_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc      (_mmios_0_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data                (_mmios_0_io_resp_bits_data),
    .io_resp_bits_is_hella            (_mmios_0_io_resp_bits_is_hella),
    .io_mem_access_ready              (io_mem_acquire_ready & (idle ? ~_GEN_111 : state_8)),
    .io_mem_access_valid              (_mmios_0_io_mem_access_valid),
    .io_mem_access_bits_opcode        (_mmios_0_io_mem_access_bits_opcode),
    .io_mem_access_bits_param         (_mmios_0_io_mem_access_bits_param),
    .io_mem_access_bits_size          (_mmios_0_io_mem_access_bits_size),
    .io_mem_access_bits_source        (_mmios_0_io_mem_access_bits_source),
    .io_mem_access_bits_address       (_mmios_0_io_mem_access_bits_address),
    .io_mem_access_bits_mask          (_mmios_0_io_mem_access_bits_mask),
    .io_mem_access_bits_data          (_mmios_0_io_mem_access_bits_data),
    .io_mem_ack_valid                 (io_mem_grant_valid & _mshr_io_mem_ack_valid_T),
    .io_mem_ack_bits_data             (io_mem_grant_bits_data)
  );
  BranchKillableQueue_8 respq (
    .clock                           (clock),
    .reset                           (reset),
    .io_enq_ready                    (_respq_io_enq_ready),
    .io_enq_valid                    (_resp_arb_io_out_valid),
    .io_enq_bits_uop_uopc            (_resp_arb_io_out_bits_uop_uopc),
    .io_enq_bits_uop_inst            (_resp_arb_io_out_bits_uop_inst),
    .io_enq_bits_uop_debug_inst      (_resp_arb_io_out_bits_uop_debug_inst),
    .io_enq_bits_uop_is_rvc          (_resp_arb_io_out_bits_uop_is_rvc),
    .io_enq_bits_uop_debug_pc        (_resp_arb_io_out_bits_uop_debug_pc),
    .io_enq_bits_uop_iq_type         (_resp_arb_io_out_bits_uop_iq_type),
    .io_enq_bits_uop_fu_code         (_resp_arb_io_out_bits_uop_fu_code),
    .io_enq_bits_uop_ctrl_br_type    (_resp_arb_io_out_bits_uop_ctrl_br_type),
    .io_enq_bits_uop_ctrl_op1_sel    (_resp_arb_io_out_bits_uop_ctrl_op1_sel),
    .io_enq_bits_uop_ctrl_op2_sel    (_resp_arb_io_out_bits_uop_ctrl_op2_sel),
    .io_enq_bits_uop_ctrl_imm_sel    (_resp_arb_io_out_bits_uop_ctrl_imm_sel),
    .io_enq_bits_uop_ctrl_op_fcn     (_resp_arb_io_out_bits_uop_ctrl_op_fcn),
    .io_enq_bits_uop_ctrl_fcn_dw     (_resp_arb_io_out_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_uop_ctrl_csr_cmd    (_resp_arb_io_out_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_uop_ctrl_is_load    (_resp_arb_io_out_bits_uop_ctrl_is_load),
    .io_enq_bits_uop_ctrl_is_sta     (_resp_arb_io_out_bits_uop_ctrl_is_sta),
    .io_enq_bits_uop_ctrl_is_std     (_resp_arb_io_out_bits_uop_ctrl_is_std),
    .io_enq_bits_uop_iw_state        (_resp_arb_io_out_bits_uop_iw_state),
    .io_enq_bits_uop_iw_p1_poisoned  (_resp_arb_io_out_bits_uop_iw_p1_poisoned),
    .io_enq_bits_uop_iw_p2_poisoned  (_resp_arb_io_out_bits_uop_iw_p2_poisoned),
    .io_enq_bits_uop_is_br           (_resp_arb_io_out_bits_uop_is_br),
    .io_enq_bits_uop_is_jalr         (_resp_arb_io_out_bits_uop_is_jalr),
    .io_enq_bits_uop_is_jal          (_resp_arb_io_out_bits_uop_is_jal),
    .io_enq_bits_uop_is_sfb          (_resp_arb_io_out_bits_uop_is_sfb),
    .io_enq_bits_uop_br_mask         (_resp_arb_io_out_bits_uop_br_mask),
    .io_enq_bits_uop_br_tag          (_resp_arb_io_out_bits_uop_br_tag),
    .io_enq_bits_uop_ftq_idx         (_resp_arb_io_out_bits_uop_ftq_idx),
    .io_enq_bits_uop_edge_inst       (_resp_arb_io_out_bits_uop_edge_inst),
    .io_enq_bits_uop_pc_lob          (_resp_arb_io_out_bits_uop_pc_lob),
    .io_enq_bits_uop_taken           (_resp_arb_io_out_bits_uop_taken),
    .io_enq_bits_uop_imm_packed      (_resp_arb_io_out_bits_uop_imm_packed),
    .io_enq_bits_uop_csr_addr        (_resp_arb_io_out_bits_uop_csr_addr),
    .io_enq_bits_uop_rob_idx         (_resp_arb_io_out_bits_uop_rob_idx),
    .io_enq_bits_uop_ldq_idx         (_resp_arb_io_out_bits_uop_ldq_idx),
    .io_enq_bits_uop_stq_idx         (_resp_arb_io_out_bits_uop_stq_idx),
    .io_enq_bits_uop_rxq_idx         (_resp_arb_io_out_bits_uop_rxq_idx),
    .io_enq_bits_uop_pdst            (_resp_arb_io_out_bits_uop_pdst),
    .io_enq_bits_uop_prs1            (_resp_arb_io_out_bits_uop_prs1),
    .io_enq_bits_uop_prs2            (_resp_arb_io_out_bits_uop_prs2),
    .io_enq_bits_uop_prs3            (_resp_arb_io_out_bits_uop_prs3),
    .io_enq_bits_uop_ppred           (_resp_arb_io_out_bits_uop_ppred),
    .io_enq_bits_uop_prs1_busy       (_resp_arb_io_out_bits_uop_prs1_busy),
    .io_enq_bits_uop_prs2_busy       (_resp_arb_io_out_bits_uop_prs2_busy),
    .io_enq_bits_uop_prs3_busy       (_resp_arb_io_out_bits_uop_prs3_busy),
    .io_enq_bits_uop_ppred_busy      (_resp_arb_io_out_bits_uop_ppred_busy),
    .io_enq_bits_uop_stale_pdst      (_resp_arb_io_out_bits_uop_stale_pdst),
    .io_enq_bits_uop_exception       (_resp_arb_io_out_bits_uop_exception),
    .io_enq_bits_uop_exc_cause       (_resp_arb_io_out_bits_uop_exc_cause),
    .io_enq_bits_uop_bypassable      (_resp_arb_io_out_bits_uop_bypassable),
    .io_enq_bits_uop_mem_cmd         (_resp_arb_io_out_bits_uop_mem_cmd),
    .io_enq_bits_uop_mem_size        (_resp_arb_io_out_bits_uop_mem_size),
    .io_enq_bits_uop_mem_signed      (_resp_arb_io_out_bits_uop_mem_signed),
    .io_enq_bits_uop_is_fence        (_resp_arb_io_out_bits_uop_is_fence),
    .io_enq_bits_uop_is_fencei       (_resp_arb_io_out_bits_uop_is_fencei),
    .io_enq_bits_uop_is_amo          (_resp_arb_io_out_bits_uop_is_amo),
    .io_enq_bits_uop_uses_ldq        (_resp_arb_io_out_bits_uop_uses_ldq),
    .io_enq_bits_uop_uses_stq        (_resp_arb_io_out_bits_uop_uses_stq),
    .io_enq_bits_uop_is_sys_pc2epc   (_resp_arb_io_out_bits_uop_is_sys_pc2epc),
    .io_enq_bits_uop_is_unique       (_resp_arb_io_out_bits_uop_is_unique),
    .io_enq_bits_uop_flush_on_commit (_resp_arb_io_out_bits_uop_flush_on_commit),
    .io_enq_bits_uop_ldst_is_rs1     (_resp_arb_io_out_bits_uop_ldst_is_rs1),
    .io_enq_bits_uop_ldst            (_resp_arb_io_out_bits_uop_ldst),
    .io_enq_bits_uop_lrs1            (_resp_arb_io_out_bits_uop_lrs1),
    .io_enq_bits_uop_lrs2            (_resp_arb_io_out_bits_uop_lrs2),
    .io_enq_bits_uop_lrs3            (_resp_arb_io_out_bits_uop_lrs3),
    .io_enq_bits_uop_ldst_val        (_resp_arb_io_out_bits_uop_ldst_val),
    .io_enq_bits_uop_dst_rtype       (_resp_arb_io_out_bits_uop_dst_rtype),
    .io_enq_bits_uop_lrs1_rtype      (_resp_arb_io_out_bits_uop_lrs1_rtype),
    .io_enq_bits_uop_lrs2_rtype      (_resp_arb_io_out_bits_uop_lrs2_rtype),
    .io_enq_bits_uop_frs3_en         (_resp_arb_io_out_bits_uop_frs3_en),
    .io_enq_bits_uop_fp_val          (_resp_arb_io_out_bits_uop_fp_val),
    .io_enq_bits_uop_fp_single       (_resp_arb_io_out_bits_uop_fp_single),
    .io_enq_bits_uop_xcpt_pf_if      (_resp_arb_io_out_bits_uop_xcpt_pf_if),
    .io_enq_bits_uop_xcpt_ae_if      (_resp_arb_io_out_bits_uop_xcpt_ae_if),
    .io_enq_bits_uop_xcpt_ma_if      (_resp_arb_io_out_bits_uop_xcpt_ma_if),
    .io_enq_bits_uop_bp_debug_if     (_resp_arb_io_out_bits_uop_bp_debug_if),
    .io_enq_bits_uop_bp_xcpt_if      (_resp_arb_io_out_bits_uop_bp_xcpt_if),
    .io_enq_bits_uop_debug_fsrc      (_resp_arb_io_out_bits_uop_debug_fsrc),
    .io_enq_bits_uop_debug_tsrc      (_resp_arb_io_out_bits_uop_debug_tsrc),
    .io_enq_bits_data                (_resp_arb_io_out_bits_data),
    .io_enq_bits_is_hella            (_resp_arb_io_out_bits_is_hella),
    .io_deq_ready                    (io_resp_ready),
    .io_deq_valid                    (io_resp_valid),
    .io_deq_bits_uop_br_mask         (io_resp_bits_uop_br_mask),
    .io_deq_bits_uop_ldq_idx         (io_resp_bits_uop_ldq_idx),
    .io_deq_bits_uop_stq_idx         (io_resp_bits_uop_stq_idx),
    .io_deq_bits_uop_is_amo          (io_resp_bits_uop_is_amo),
    .io_deq_bits_uop_uses_ldq        (io_resp_bits_uop_uses_ldq),
    .io_deq_bits_uop_uses_stq        (io_resp_bits_uop_uses_stq),
    .io_deq_bits_data                (io_resp_bits_data),
    .io_deq_bits_is_hella            (io_resp_bits_is_hella),
    .io_brupdate_b1_resolve_mask     (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask  (io_brupdate_b1_mispredict_mask),
    .io_flush                        (io_exception)
  );
  assign io_req_0_ready = _io_req_0_ready_output;
  assign io_req_1_ready = _io_req_1_ready_output;
  assign io_secondary_miss_0 = idx_match_0 & (idx_matches_0_0 & _mshrs_0_io_way_valid & _way_matches_0_0_T | idx_matches_0_1 & _mshrs_1_io_way_valid & _way_matches_0_1_T | idx_matches_0_2 & _mshrs_2_io_way_valid & _way_matches_0_2_T | idx_matches_0_3 & _mshrs_3_io_way_valid & _way_matches_0_3_T | idx_matches_0_4 & _mshrs_4_io_way_valid & _way_matches_0_4_T | idx_matches_0_5 & _mshrs_5_io_way_valid & _way_matches_0_5_T | idx_matches_0_6 & _mshrs_6_io_way_valid & _way_matches_0_6_T | idx_matches_0_7 & _mshrs_7_io_way_valid & _way_matches_0_7_T) & ~tag_match_0;
  assign io_secondary_miss_1 = idx_match_1 & (idx_matches_1_0 & _mshrs_0_io_way_valid & _way_matches_1_0_T | idx_matches_1_1 & _mshrs_1_io_way_valid & _way_matches_1_1_T | idx_matches_1_2 & _mshrs_2_io_way_valid & _way_matches_1_2_T | idx_matches_1_3 & _mshrs_3_io_way_valid & _way_matches_1_3_T | idx_matches_1_4 & _mshrs_4_io_way_valid & _way_matches_1_4_T | idx_matches_1_5 & _mshrs_5_io_way_valid & _way_matches_1_5_T | idx_matches_1_6 & _mshrs_6_io_way_valid & _way_matches_1_6_T | idx_matches_1_7 & _mshrs_7_io_way_valid & _way_matches_1_7_T) & ~tag_match_1;
  assign io_block_hit_0 = idx_match_0 & tag_match_0;
  assign io_block_hit_1 = idx_match_1 & tag_match_1;
  assign io_mem_acquire_valid = _io_mem_acquire_valid_output;
  assign io_mem_acquire_bits_opcode = (_GEN_115 ? 3'h6 : 3'h0) | (muxState_8 ? _mmios_0_io_mem_access_bits_opcode : 3'h0);
  assign io_mem_acquire_bits_param = (muxState_0 ? _mshrs_0_io_mem_acquire_bits_param : 3'h0) | (muxState_1 ? _mshrs_1_io_mem_acquire_bits_param : 3'h0) | (muxState_2 ? _mshrs_2_io_mem_acquire_bits_param : 3'h0) | (muxState_3 ? _mshrs_3_io_mem_acquire_bits_param : 3'h0) | (muxState_4 ? _mshrs_4_io_mem_acquire_bits_param : 3'h0) | (muxState_5 ? _mshrs_5_io_mem_acquire_bits_param : 3'h0) | (muxState_6 ? _mshrs_6_io_mem_acquire_bits_param : 3'h0) | (muxState_7 ? _mshrs_7_io_mem_acquire_bits_param : 3'h0) | (muxState_8 ? _mmios_0_io_mem_access_bits_param : 3'h0);
  assign io_mem_acquire_bits_size = (_GEN_115 ? 4'h6 : 4'h0) | (muxState_8 ? _mmios_0_io_mem_access_bits_size : 4'h0);
  assign io_mem_acquire_bits_source = (muxState_0 ? _mshrs_0_io_mem_acquire_bits_source : 4'h0) | (muxState_1 ? _mshrs_1_io_mem_acquire_bits_source : 4'h0) | (muxState_2 ? _mshrs_2_io_mem_acquire_bits_source : 4'h0) | (muxState_3 ? _mshrs_3_io_mem_acquire_bits_source : 4'h0) | (muxState_4 ? _mshrs_4_io_mem_acquire_bits_source : 4'h0) | (muxState_5 ? _mshrs_5_io_mem_acquire_bits_source : 4'h0) | (muxState_6 ? _mshrs_6_io_mem_acquire_bits_source : 4'h0) | (muxState_7 ? _mshrs_7_io_mem_acquire_bits_source : 4'h0) | (muxState_8 ? _mmios_0_io_mem_access_bits_source : 4'h0);
  assign io_mem_acquire_bits_address = (muxState_0 ? _mshrs_0_io_mem_acquire_bits_address : 33'h0) | (muxState_1 ? _mshrs_1_io_mem_acquire_bits_address : 33'h0) | (muxState_2 ? _mshrs_2_io_mem_acquire_bits_address : 33'h0) | (muxState_3 ? _mshrs_3_io_mem_acquire_bits_address : 33'h0) | (muxState_4 ? _mshrs_4_io_mem_acquire_bits_address : 33'h0) | (muxState_5 ? _mshrs_5_io_mem_acquire_bits_address : 33'h0) | (muxState_6 ? _mshrs_6_io_mem_acquire_bits_address : 33'h0) | (muxState_7 ? _mshrs_7_io_mem_acquire_bits_address : 33'h0) | (muxState_8 ? _mmios_0_io_mem_access_bits_address : 33'h0);
  assign io_mem_acquire_bits_mask = {16{muxState_0}} | {16{muxState_1}} | {16{muxState_2}} | {16{muxState_3}} | {16{muxState_4}} | {16{muxState_5}} | {16{muxState_6}} | {16{muxState_7}} | (muxState_8 ? _mmios_0_io_mem_access_bits_mask : 16'h0);
  assign io_mem_acquire_bits_data = muxState_8 ? _mmios_0_io_mem_access_bits_data : 128'h0;
  assign io_mem_grant_ready = _mshr_io_mem_ack_valid_T | (_GEN_102 ? _mshrs_7_io_mem_grant_ready : _GEN_101 ? _mshrs_6_io_mem_grant_ready : _GEN_100 ? _mshrs_5_io_mem_grant_ready : _GEN_99 ? _mshrs_4_io_mem_grant_ready : _GEN_98 ? _mshrs_3_io_mem_grant_ready : _GEN_97 ? _mshrs_2_io_mem_grant_ready : _GEN_96 ? _mshrs_1_io_mem_grant_ready : _GEN_95 & _mshrs_0_io_mem_grant_ready);
  assign io_mem_finish_valid = _io_mem_finish_valid_output;
  assign io_mem_finish_bits_sink = ((beatsLeft_1 ? state_1_0 : _mshrs_0_io_mem_finish_valid) ? _mshrs_0_io_mem_finish_bits_sink : 3'h0) | ((beatsLeft_1 ? state_1_1 : winner_1_1) ? _mshrs_1_io_mem_finish_bits_sink : 3'h0) | ((beatsLeft_1 ? state_1_2 : winner_1_2) ? _mshrs_2_io_mem_finish_bits_sink : 3'h0) | ((beatsLeft_1 ? state_1_3 : winner_1_3) ? _mshrs_3_io_mem_finish_bits_sink : 3'h0) | ((beatsLeft_1 ? state_1_4 : winner_1_4) ? _mshrs_4_io_mem_finish_bits_sink : 3'h0) | ((beatsLeft_1 ? state_1_5 : winner_1_5) ? _mshrs_5_io_mem_finish_bits_sink : 3'h0) | ((beatsLeft_1 ? state_1_6 : winner_1_6) ? _mshrs_6_io_mem_finish_bits_sink : 3'h0) | ((beatsLeft_1 ? state_1_7 : winner_1_7) ? _mshrs_7_io_mem_finish_bits_sink : 3'h0);
  assign io_replay_valid = _replay_arb_io_out_valid;
  assign io_replay_bits_uop_mem_cmd = _replay_arb_io_out_bits_uop_mem_cmd;
  assign io_fence_rdy = ~(~_mmios_0_io_req_ready | ~_mshrs_7_io_req_pri_rdy | ~_mshrs_6_io_req_pri_rdy | ~_mshrs_5_io_req_pri_rdy | ~_mshrs_4_io_req_pri_rdy | ~_mshrs_3_io_req_pri_rdy | ~_mshrs_2_io_req_pri_rdy | ~_mshrs_1_io_req_pri_rdy | ~_mshrs_0_io_req_pri_rdy);
  assign io_probe_rdy = ~(~_mshrs_7_io_probe_rdy & idx_matches_1_7 & io_req_is_probe_1 | ~_mshrs_7_io_probe_rdy & idx_matches_0_7 & io_req_is_probe_0 | ~_mshrs_6_io_probe_rdy & idx_matches_1_6 & io_req_is_probe_1 | ~_mshrs_6_io_probe_rdy & idx_matches_0_6 & io_req_is_probe_0 | ~_mshrs_5_io_probe_rdy & idx_matches_1_5 & io_req_is_probe_1 | ~_mshrs_5_io_probe_rdy & idx_matches_0_5 & io_req_is_probe_0 | ~_mshrs_4_io_probe_rdy & idx_matches_1_4 & io_req_is_probe_1 | ~_mshrs_4_io_probe_rdy & idx_matches_0_4 & io_req_is_probe_0 | ~_mshrs_3_io_probe_rdy & idx_matches_1_3 & io_req_is_probe_1 | ~_mshrs_3_io_probe_rdy & idx_matches_0_3 & io_req_is_probe_0 | ~_mshrs_2_io_probe_rdy & idx_matches_1_2 & io_req_is_probe_1 | ~_mshrs_2_io_probe_rdy & idx_matches_0_2 & io_req_is_probe_0 | ~_mshrs_1_io_probe_rdy & idx_matches_1_1 & io_req_is_probe_1 | ~_mshrs_1_io_probe_rdy & idx_matches_0_1 & io_req_is_probe_0 | ~_mshrs_0_io_probe_rdy & idx_matches_1_0 & io_req_is_probe_1 | ~_mshrs_0_io_probe_rdy & idx_matches_0_0 & io_req_is_probe_0);
endmodule

