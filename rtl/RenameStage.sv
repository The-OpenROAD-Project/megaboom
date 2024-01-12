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

module RenameStage(
  input         clock,
                reset,
  output        io_ren_stalls_0,
                io_ren_stalls_1,
                io_ren_stalls_2,
                io_ren_stalls_3,
  input         io_kill,
                io_dec_fire_0,
                io_dec_fire_1,
                io_dec_fire_2,
                io_dec_fire_3,
  input  [6:0]  io_dec_uops_0_uopc,
  input  [31:0] io_dec_uops_0_inst,
                io_dec_uops_0_debug_inst,
  input         io_dec_uops_0_is_rvc,
  input  [39:0] io_dec_uops_0_debug_pc,
  input  [2:0]  io_dec_uops_0_iq_type,
  input  [9:0]  io_dec_uops_0_fu_code,
  input         io_dec_uops_0_is_br,
                io_dec_uops_0_is_jalr,
                io_dec_uops_0_is_jal,
                io_dec_uops_0_is_sfb,
  input  [19:0] io_dec_uops_0_br_mask,
  input  [4:0]  io_dec_uops_0_br_tag,
  input  [5:0]  io_dec_uops_0_ftq_idx,
  input         io_dec_uops_0_edge_inst,
  input  [5:0]  io_dec_uops_0_pc_lob,
  input         io_dec_uops_0_taken,
  input  [19:0] io_dec_uops_0_imm_packed,
  input         io_dec_uops_0_exception,
  input  [63:0] io_dec_uops_0_exc_cause,
  input         io_dec_uops_0_bypassable,
  input  [4:0]  io_dec_uops_0_mem_cmd,
  input  [1:0]  io_dec_uops_0_mem_size,
  input         io_dec_uops_0_mem_signed,
                io_dec_uops_0_is_fence,
                io_dec_uops_0_is_fencei,
                io_dec_uops_0_is_amo,
                io_dec_uops_0_uses_ldq,
                io_dec_uops_0_uses_stq,
                io_dec_uops_0_is_sys_pc2epc,
                io_dec_uops_0_is_unique,
                io_dec_uops_0_flush_on_commit,
  input  [5:0]  io_dec_uops_0_ldst,
                io_dec_uops_0_lrs1,
                io_dec_uops_0_lrs2,
                io_dec_uops_0_lrs3,
  input         io_dec_uops_0_ldst_val,
  input  [1:0]  io_dec_uops_0_dst_rtype,
                io_dec_uops_0_lrs1_rtype,
                io_dec_uops_0_lrs2_rtype,
  input         io_dec_uops_0_frs3_en,
                io_dec_uops_0_fp_val,
                io_dec_uops_0_fp_single,
                io_dec_uops_0_xcpt_pf_if,
                io_dec_uops_0_xcpt_ae_if,
                io_dec_uops_0_bp_debug_if,
                io_dec_uops_0_bp_xcpt_if,
  input  [1:0]  io_dec_uops_0_debug_fsrc,
  input  [6:0]  io_dec_uops_1_uopc,
  input  [31:0] io_dec_uops_1_inst,
                io_dec_uops_1_debug_inst,
  input         io_dec_uops_1_is_rvc,
  input  [39:0] io_dec_uops_1_debug_pc,
  input  [2:0]  io_dec_uops_1_iq_type,
  input  [9:0]  io_dec_uops_1_fu_code,
  input         io_dec_uops_1_is_br,
                io_dec_uops_1_is_jalr,
                io_dec_uops_1_is_jal,
                io_dec_uops_1_is_sfb,
  input  [19:0] io_dec_uops_1_br_mask,
  input  [4:0]  io_dec_uops_1_br_tag,
  input  [5:0]  io_dec_uops_1_ftq_idx,
  input         io_dec_uops_1_edge_inst,
  input  [5:0]  io_dec_uops_1_pc_lob,
  input         io_dec_uops_1_taken,
  input  [19:0] io_dec_uops_1_imm_packed,
  input         io_dec_uops_1_exception,
  input  [63:0] io_dec_uops_1_exc_cause,
  input         io_dec_uops_1_bypassable,
  input  [4:0]  io_dec_uops_1_mem_cmd,
  input  [1:0]  io_dec_uops_1_mem_size,
  input         io_dec_uops_1_mem_signed,
                io_dec_uops_1_is_fence,
                io_dec_uops_1_is_fencei,
                io_dec_uops_1_is_amo,
                io_dec_uops_1_uses_ldq,
                io_dec_uops_1_uses_stq,
                io_dec_uops_1_is_sys_pc2epc,
                io_dec_uops_1_is_unique,
                io_dec_uops_1_flush_on_commit,
  input  [5:0]  io_dec_uops_1_ldst,
                io_dec_uops_1_lrs1,
                io_dec_uops_1_lrs2,
                io_dec_uops_1_lrs3,
  input         io_dec_uops_1_ldst_val,
  input  [1:0]  io_dec_uops_1_dst_rtype,
                io_dec_uops_1_lrs1_rtype,
                io_dec_uops_1_lrs2_rtype,
  input         io_dec_uops_1_frs3_en,
                io_dec_uops_1_fp_val,
                io_dec_uops_1_fp_single,
                io_dec_uops_1_xcpt_pf_if,
                io_dec_uops_1_xcpt_ae_if,
                io_dec_uops_1_bp_debug_if,
                io_dec_uops_1_bp_xcpt_if,
  input  [1:0]  io_dec_uops_1_debug_fsrc,
  input  [6:0]  io_dec_uops_2_uopc,
  input  [31:0] io_dec_uops_2_inst,
                io_dec_uops_2_debug_inst,
  input         io_dec_uops_2_is_rvc,
  input  [39:0] io_dec_uops_2_debug_pc,
  input  [2:0]  io_dec_uops_2_iq_type,
  input  [9:0]  io_dec_uops_2_fu_code,
  input         io_dec_uops_2_is_br,
                io_dec_uops_2_is_jalr,
                io_dec_uops_2_is_jal,
                io_dec_uops_2_is_sfb,
  input  [19:0] io_dec_uops_2_br_mask,
  input  [4:0]  io_dec_uops_2_br_tag,
  input  [5:0]  io_dec_uops_2_ftq_idx,
  input         io_dec_uops_2_edge_inst,
  input  [5:0]  io_dec_uops_2_pc_lob,
  input         io_dec_uops_2_taken,
  input  [19:0] io_dec_uops_2_imm_packed,
  input         io_dec_uops_2_exception,
  input  [63:0] io_dec_uops_2_exc_cause,
  input         io_dec_uops_2_bypassable,
  input  [4:0]  io_dec_uops_2_mem_cmd,
  input  [1:0]  io_dec_uops_2_mem_size,
  input         io_dec_uops_2_mem_signed,
                io_dec_uops_2_is_fence,
                io_dec_uops_2_is_fencei,
                io_dec_uops_2_is_amo,
                io_dec_uops_2_uses_ldq,
                io_dec_uops_2_uses_stq,
                io_dec_uops_2_is_sys_pc2epc,
                io_dec_uops_2_is_unique,
                io_dec_uops_2_flush_on_commit,
  input  [5:0]  io_dec_uops_2_ldst,
                io_dec_uops_2_lrs1,
                io_dec_uops_2_lrs2,
                io_dec_uops_2_lrs3,
  input         io_dec_uops_2_ldst_val,
  input  [1:0]  io_dec_uops_2_dst_rtype,
                io_dec_uops_2_lrs1_rtype,
                io_dec_uops_2_lrs2_rtype,
  input         io_dec_uops_2_frs3_en,
                io_dec_uops_2_fp_val,
                io_dec_uops_2_fp_single,
                io_dec_uops_2_xcpt_pf_if,
                io_dec_uops_2_xcpt_ae_if,
                io_dec_uops_2_bp_debug_if,
                io_dec_uops_2_bp_xcpt_if,
  input  [1:0]  io_dec_uops_2_debug_fsrc,
  input  [6:0]  io_dec_uops_3_uopc,
  input  [31:0] io_dec_uops_3_inst,
                io_dec_uops_3_debug_inst,
  input         io_dec_uops_3_is_rvc,
  input  [39:0] io_dec_uops_3_debug_pc,
  input  [2:0]  io_dec_uops_3_iq_type,
  input  [9:0]  io_dec_uops_3_fu_code,
  input         io_dec_uops_3_is_br,
                io_dec_uops_3_is_jalr,
                io_dec_uops_3_is_jal,
                io_dec_uops_3_is_sfb,
  input  [19:0] io_dec_uops_3_br_mask,
  input  [4:0]  io_dec_uops_3_br_tag,
  input  [5:0]  io_dec_uops_3_ftq_idx,
  input         io_dec_uops_3_edge_inst,
  input  [5:0]  io_dec_uops_3_pc_lob,
  input         io_dec_uops_3_taken,
  input  [19:0] io_dec_uops_3_imm_packed,
  input         io_dec_uops_3_exception,
  input  [63:0] io_dec_uops_3_exc_cause,
  input         io_dec_uops_3_bypassable,
  input  [4:0]  io_dec_uops_3_mem_cmd,
  input  [1:0]  io_dec_uops_3_mem_size,
  input         io_dec_uops_3_mem_signed,
                io_dec_uops_3_is_fence,
                io_dec_uops_3_is_fencei,
                io_dec_uops_3_is_amo,
                io_dec_uops_3_uses_ldq,
                io_dec_uops_3_uses_stq,
                io_dec_uops_3_is_sys_pc2epc,
                io_dec_uops_3_is_unique,
                io_dec_uops_3_flush_on_commit,
  input  [5:0]  io_dec_uops_3_ldst,
                io_dec_uops_3_lrs1,
                io_dec_uops_3_lrs2,
                io_dec_uops_3_lrs3,
  input         io_dec_uops_3_ldst_val,
  input  [1:0]  io_dec_uops_3_dst_rtype,
                io_dec_uops_3_lrs1_rtype,
                io_dec_uops_3_lrs2_rtype,
  input         io_dec_uops_3_frs3_en,
                io_dec_uops_3_fp_val,
                io_dec_uops_3_fp_single,
                io_dec_uops_3_xcpt_pf_if,
                io_dec_uops_3_xcpt_ae_if,
                io_dec_uops_3_bp_debug_if,
                io_dec_uops_3_bp_xcpt_if,
  input  [1:0]  io_dec_uops_3_debug_fsrc,
  output        io_ren2_mask_0,
                io_ren2_mask_1,
                io_ren2_mask_2,
                io_ren2_mask_3,
  output [6:0]  io_ren2_uops_0_uopc,
  output [31:0] io_ren2_uops_0_inst,
                io_ren2_uops_0_debug_inst,
  output        io_ren2_uops_0_is_rvc,
  output [39:0] io_ren2_uops_0_debug_pc,
  output [2:0]  io_ren2_uops_0_iq_type,
  output [9:0]  io_ren2_uops_0_fu_code,
  output [3:0]  io_ren2_uops_0_ctrl_br_type,
  output [1:0]  io_ren2_uops_0_ctrl_op1_sel,
  output [2:0]  io_ren2_uops_0_ctrl_op2_sel,
                io_ren2_uops_0_ctrl_imm_sel,
  output [3:0]  io_ren2_uops_0_ctrl_op_fcn,
  output        io_ren2_uops_0_ctrl_fcn_dw,
  output [2:0]  io_ren2_uops_0_ctrl_csr_cmd,
  output        io_ren2_uops_0_ctrl_is_load,
                io_ren2_uops_0_ctrl_is_sta,
                io_ren2_uops_0_ctrl_is_std,
  output [1:0]  io_ren2_uops_0_iw_state,
  output        io_ren2_uops_0_iw_p1_poisoned,
                io_ren2_uops_0_iw_p2_poisoned,
                io_ren2_uops_0_is_br,
                io_ren2_uops_0_is_jalr,
                io_ren2_uops_0_is_jal,
                io_ren2_uops_0_is_sfb,
  output [19:0] io_ren2_uops_0_br_mask,
  output [4:0]  io_ren2_uops_0_br_tag,
  output [5:0]  io_ren2_uops_0_ftq_idx,
  output        io_ren2_uops_0_edge_inst,
  output [5:0]  io_ren2_uops_0_pc_lob,
  output        io_ren2_uops_0_taken,
  output [19:0] io_ren2_uops_0_imm_packed,
  output [11:0] io_ren2_uops_0_csr_addr,
  output [1:0]  io_ren2_uops_0_rxq_idx,
  output [6:0]  io_ren2_uops_0_pdst,
                io_ren2_uops_0_prs1,
                io_ren2_uops_0_prs2,
  output        io_ren2_uops_0_prs1_busy,
                io_ren2_uops_0_prs2_busy,
  output [6:0]  io_ren2_uops_0_stale_pdst,
  output        io_ren2_uops_0_exception,
  output [63:0] io_ren2_uops_0_exc_cause,
  output        io_ren2_uops_0_bypassable,
  output [4:0]  io_ren2_uops_0_mem_cmd,
  output [1:0]  io_ren2_uops_0_mem_size,
  output        io_ren2_uops_0_mem_signed,
                io_ren2_uops_0_is_fence,
                io_ren2_uops_0_is_fencei,
                io_ren2_uops_0_is_amo,
                io_ren2_uops_0_uses_ldq,
                io_ren2_uops_0_uses_stq,
                io_ren2_uops_0_is_sys_pc2epc,
                io_ren2_uops_0_is_unique,
                io_ren2_uops_0_flush_on_commit,
                io_ren2_uops_0_ldst_is_rs1,
  output [5:0]  io_ren2_uops_0_ldst,
                io_ren2_uops_0_lrs1,
                io_ren2_uops_0_lrs2,
                io_ren2_uops_0_lrs3,
  output        io_ren2_uops_0_ldst_val,
  output [1:0]  io_ren2_uops_0_dst_rtype,
                io_ren2_uops_0_lrs1_rtype,
                io_ren2_uops_0_lrs2_rtype,
  output        io_ren2_uops_0_frs3_en,
                io_ren2_uops_0_fp_val,
                io_ren2_uops_0_fp_single,
                io_ren2_uops_0_xcpt_pf_if,
                io_ren2_uops_0_xcpt_ae_if,
                io_ren2_uops_0_xcpt_ma_if,
                io_ren2_uops_0_bp_debug_if,
                io_ren2_uops_0_bp_xcpt_if,
  output [1:0]  io_ren2_uops_0_debug_fsrc,
                io_ren2_uops_0_debug_tsrc,
  output [6:0]  io_ren2_uops_1_uopc,
  output [31:0] io_ren2_uops_1_inst,
                io_ren2_uops_1_debug_inst,
  output        io_ren2_uops_1_is_rvc,
  output [39:0] io_ren2_uops_1_debug_pc,
  output [2:0]  io_ren2_uops_1_iq_type,
  output [9:0]  io_ren2_uops_1_fu_code,
  output [3:0]  io_ren2_uops_1_ctrl_br_type,
  output [1:0]  io_ren2_uops_1_ctrl_op1_sel,
  output [2:0]  io_ren2_uops_1_ctrl_op2_sel,
                io_ren2_uops_1_ctrl_imm_sel,
  output [3:0]  io_ren2_uops_1_ctrl_op_fcn,
  output        io_ren2_uops_1_ctrl_fcn_dw,
  output [2:0]  io_ren2_uops_1_ctrl_csr_cmd,
  output        io_ren2_uops_1_ctrl_is_load,
                io_ren2_uops_1_ctrl_is_sta,
                io_ren2_uops_1_ctrl_is_std,
  output [1:0]  io_ren2_uops_1_iw_state,
  output        io_ren2_uops_1_iw_p1_poisoned,
                io_ren2_uops_1_iw_p2_poisoned,
                io_ren2_uops_1_is_br,
                io_ren2_uops_1_is_jalr,
                io_ren2_uops_1_is_jal,
                io_ren2_uops_1_is_sfb,
  output [19:0] io_ren2_uops_1_br_mask,
  output [4:0]  io_ren2_uops_1_br_tag,
  output [5:0]  io_ren2_uops_1_ftq_idx,
  output        io_ren2_uops_1_edge_inst,
  output [5:0]  io_ren2_uops_1_pc_lob,
  output        io_ren2_uops_1_taken,
  output [19:0] io_ren2_uops_1_imm_packed,
  output [11:0] io_ren2_uops_1_csr_addr,
  output [1:0]  io_ren2_uops_1_rxq_idx,
  output [6:0]  io_ren2_uops_1_pdst,
                io_ren2_uops_1_prs1,
                io_ren2_uops_1_prs2,
  output        io_ren2_uops_1_prs1_busy,
                io_ren2_uops_1_prs2_busy,
  output [6:0]  io_ren2_uops_1_stale_pdst,
  output        io_ren2_uops_1_exception,
  output [63:0] io_ren2_uops_1_exc_cause,
  output        io_ren2_uops_1_bypassable,
  output [4:0]  io_ren2_uops_1_mem_cmd,
  output [1:0]  io_ren2_uops_1_mem_size,
  output        io_ren2_uops_1_mem_signed,
                io_ren2_uops_1_is_fence,
                io_ren2_uops_1_is_fencei,
                io_ren2_uops_1_is_amo,
                io_ren2_uops_1_uses_ldq,
                io_ren2_uops_1_uses_stq,
                io_ren2_uops_1_is_sys_pc2epc,
                io_ren2_uops_1_is_unique,
                io_ren2_uops_1_flush_on_commit,
                io_ren2_uops_1_ldst_is_rs1,
  output [5:0]  io_ren2_uops_1_ldst,
                io_ren2_uops_1_lrs1,
                io_ren2_uops_1_lrs2,
                io_ren2_uops_1_lrs3,
  output        io_ren2_uops_1_ldst_val,
  output [1:0]  io_ren2_uops_1_dst_rtype,
                io_ren2_uops_1_lrs1_rtype,
                io_ren2_uops_1_lrs2_rtype,
  output        io_ren2_uops_1_frs3_en,
                io_ren2_uops_1_fp_val,
                io_ren2_uops_1_fp_single,
                io_ren2_uops_1_xcpt_pf_if,
                io_ren2_uops_1_xcpt_ae_if,
                io_ren2_uops_1_xcpt_ma_if,
                io_ren2_uops_1_bp_debug_if,
                io_ren2_uops_1_bp_xcpt_if,
  output [1:0]  io_ren2_uops_1_debug_fsrc,
                io_ren2_uops_1_debug_tsrc,
  output [6:0]  io_ren2_uops_2_uopc,
  output [31:0] io_ren2_uops_2_inst,
                io_ren2_uops_2_debug_inst,
  output        io_ren2_uops_2_is_rvc,
  output [39:0] io_ren2_uops_2_debug_pc,
  output [2:0]  io_ren2_uops_2_iq_type,
  output [9:0]  io_ren2_uops_2_fu_code,
  output [3:0]  io_ren2_uops_2_ctrl_br_type,
  output [1:0]  io_ren2_uops_2_ctrl_op1_sel,
  output [2:0]  io_ren2_uops_2_ctrl_op2_sel,
                io_ren2_uops_2_ctrl_imm_sel,
  output [3:0]  io_ren2_uops_2_ctrl_op_fcn,
  output        io_ren2_uops_2_ctrl_fcn_dw,
  output [2:0]  io_ren2_uops_2_ctrl_csr_cmd,
  output        io_ren2_uops_2_ctrl_is_load,
                io_ren2_uops_2_ctrl_is_sta,
                io_ren2_uops_2_ctrl_is_std,
  output [1:0]  io_ren2_uops_2_iw_state,
  output        io_ren2_uops_2_iw_p1_poisoned,
                io_ren2_uops_2_iw_p2_poisoned,
                io_ren2_uops_2_is_br,
                io_ren2_uops_2_is_jalr,
                io_ren2_uops_2_is_jal,
                io_ren2_uops_2_is_sfb,
  output [19:0] io_ren2_uops_2_br_mask,
  output [4:0]  io_ren2_uops_2_br_tag,
  output [5:0]  io_ren2_uops_2_ftq_idx,
  output        io_ren2_uops_2_edge_inst,
  output [5:0]  io_ren2_uops_2_pc_lob,
  output        io_ren2_uops_2_taken,
  output [19:0] io_ren2_uops_2_imm_packed,
  output [11:0] io_ren2_uops_2_csr_addr,
  output [1:0]  io_ren2_uops_2_rxq_idx,
  output [6:0]  io_ren2_uops_2_pdst,
                io_ren2_uops_2_prs1,
                io_ren2_uops_2_prs2,
  output        io_ren2_uops_2_prs1_busy,
                io_ren2_uops_2_prs2_busy,
  output [6:0]  io_ren2_uops_2_stale_pdst,
  output        io_ren2_uops_2_exception,
  output [63:0] io_ren2_uops_2_exc_cause,
  output        io_ren2_uops_2_bypassable,
  output [4:0]  io_ren2_uops_2_mem_cmd,
  output [1:0]  io_ren2_uops_2_mem_size,
  output        io_ren2_uops_2_mem_signed,
                io_ren2_uops_2_is_fence,
                io_ren2_uops_2_is_fencei,
                io_ren2_uops_2_is_amo,
                io_ren2_uops_2_uses_ldq,
                io_ren2_uops_2_uses_stq,
                io_ren2_uops_2_is_sys_pc2epc,
                io_ren2_uops_2_is_unique,
                io_ren2_uops_2_flush_on_commit,
                io_ren2_uops_2_ldst_is_rs1,
  output [5:0]  io_ren2_uops_2_ldst,
                io_ren2_uops_2_lrs1,
                io_ren2_uops_2_lrs2,
                io_ren2_uops_2_lrs3,
  output        io_ren2_uops_2_ldst_val,
  output [1:0]  io_ren2_uops_2_dst_rtype,
                io_ren2_uops_2_lrs1_rtype,
                io_ren2_uops_2_lrs2_rtype,
  output        io_ren2_uops_2_frs3_en,
                io_ren2_uops_2_fp_val,
                io_ren2_uops_2_fp_single,
                io_ren2_uops_2_xcpt_pf_if,
                io_ren2_uops_2_xcpt_ae_if,
                io_ren2_uops_2_xcpt_ma_if,
                io_ren2_uops_2_bp_debug_if,
                io_ren2_uops_2_bp_xcpt_if,
  output [1:0]  io_ren2_uops_2_debug_fsrc,
                io_ren2_uops_2_debug_tsrc,
  output [6:0]  io_ren2_uops_3_uopc,
  output [31:0] io_ren2_uops_3_inst,
                io_ren2_uops_3_debug_inst,
  output        io_ren2_uops_3_is_rvc,
  output [39:0] io_ren2_uops_3_debug_pc,
  output [2:0]  io_ren2_uops_3_iq_type,
  output [9:0]  io_ren2_uops_3_fu_code,
  output [3:0]  io_ren2_uops_3_ctrl_br_type,
  output [1:0]  io_ren2_uops_3_ctrl_op1_sel,
  output [2:0]  io_ren2_uops_3_ctrl_op2_sel,
                io_ren2_uops_3_ctrl_imm_sel,
  output [3:0]  io_ren2_uops_3_ctrl_op_fcn,
  output        io_ren2_uops_3_ctrl_fcn_dw,
  output [2:0]  io_ren2_uops_3_ctrl_csr_cmd,
  output        io_ren2_uops_3_ctrl_is_load,
                io_ren2_uops_3_ctrl_is_sta,
                io_ren2_uops_3_ctrl_is_std,
  output [1:0]  io_ren2_uops_3_iw_state,
  output        io_ren2_uops_3_iw_p1_poisoned,
                io_ren2_uops_3_iw_p2_poisoned,
                io_ren2_uops_3_is_br,
                io_ren2_uops_3_is_jalr,
                io_ren2_uops_3_is_jal,
                io_ren2_uops_3_is_sfb,
  output [19:0] io_ren2_uops_3_br_mask,
  output [4:0]  io_ren2_uops_3_br_tag,
  output [5:0]  io_ren2_uops_3_ftq_idx,
  output        io_ren2_uops_3_edge_inst,
  output [5:0]  io_ren2_uops_3_pc_lob,
  output        io_ren2_uops_3_taken,
  output [19:0] io_ren2_uops_3_imm_packed,
  output [11:0] io_ren2_uops_3_csr_addr,
  output [1:0]  io_ren2_uops_3_rxq_idx,
  output [6:0]  io_ren2_uops_3_pdst,
                io_ren2_uops_3_prs1,
                io_ren2_uops_3_prs2,
  output        io_ren2_uops_3_prs1_busy,
                io_ren2_uops_3_prs2_busy,
  output [6:0]  io_ren2_uops_3_stale_pdst,
  output        io_ren2_uops_3_exception,
  output [63:0] io_ren2_uops_3_exc_cause,
  output        io_ren2_uops_3_bypassable,
  output [4:0]  io_ren2_uops_3_mem_cmd,
  output [1:0]  io_ren2_uops_3_mem_size,
  output        io_ren2_uops_3_mem_signed,
                io_ren2_uops_3_is_fence,
                io_ren2_uops_3_is_fencei,
                io_ren2_uops_3_is_amo,
                io_ren2_uops_3_uses_ldq,
                io_ren2_uops_3_uses_stq,
                io_ren2_uops_3_is_sys_pc2epc,
                io_ren2_uops_3_is_unique,
                io_ren2_uops_3_flush_on_commit,
                io_ren2_uops_3_ldst_is_rs1,
  output [5:0]  io_ren2_uops_3_ldst,
                io_ren2_uops_3_lrs1,
                io_ren2_uops_3_lrs2,
                io_ren2_uops_3_lrs3,
  output        io_ren2_uops_3_ldst_val,
  output [1:0]  io_ren2_uops_3_dst_rtype,
                io_ren2_uops_3_lrs1_rtype,
                io_ren2_uops_3_lrs2_rtype,
  output        io_ren2_uops_3_frs3_en,
                io_ren2_uops_3_fp_val,
                io_ren2_uops_3_fp_single,
                io_ren2_uops_3_xcpt_pf_if,
                io_ren2_uops_3_xcpt_ae_if,
                io_ren2_uops_3_xcpt_ma_if,
                io_ren2_uops_3_bp_debug_if,
                io_ren2_uops_3_bp_xcpt_if,
  output [1:0]  io_ren2_uops_3_debug_fsrc,
                io_ren2_uops_3_debug_tsrc,
  input  [19:0] io_brupdate_b1_resolve_mask,
  input  [4:0]  io_brupdate_b2_uop_br_tag,
  input         io_brupdate_b2_mispredict,
                io_dis_fire_0,
                io_dis_fire_1,
                io_dis_fire_2,
                io_dis_fire_3,
                io_dis_ready,
                io_wakeups_0_valid,
  input  [6:0]  io_wakeups_0_bits_uop_pdst,
  input  [1:0]  io_wakeups_0_bits_uop_dst_rtype,
  input         io_wakeups_1_valid,
  input  [6:0]  io_wakeups_1_bits_uop_pdst,
  input  [1:0]  io_wakeups_1_bits_uop_dst_rtype,
  input         io_wakeups_2_valid,
  input  [6:0]  io_wakeups_2_bits_uop_pdst,
  input  [1:0]  io_wakeups_2_bits_uop_dst_rtype,
  input         io_wakeups_3_valid,
  input  [6:0]  io_wakeups_3_bits_uop_pdst,
  input  [1:0]  io_wakeups_3_bits_uop_dst_rtype,
  input         io_wakeups_4_valid,
  input  [6:0]  io_wakeups_4_bits_uop_pdst,
  input  [1:0]  io_wakeups_4_bits_uop_dst_rtype,
  input         io_wakeups_5_valid,
  input  [6:0]  io_wakeups_5_bits_uop_pdst,
  input  [1:0]  io_wakeups_5_bits_uop_dst_rtype,
  input         io_wakeups_6_valid,
  input  [6:0]  io_wakeups_6_bits_uop_pdst,
  input  [1:0]  io_wakeups_6_bits_uop_dst_rtype,
  input         io_wakeups_7_valid,
  input  [6:0]  io_wakeups_7_bits_uop_pdst,
  input  [1:0]  io_wakeups_7_bits_uop_dst_rtype,
  input         io_wakeups_8_valid,
  input  [6:0]  io_wakeups_8_bits_uop_pdst,
  input  [1:0]  io_wakeups_8_bits_uop_dst_rtype,
  input         io_wakeups_9_valid,
  input  [6:0]  io_wakeups_9_bits_uop_pdst,
  input  [1:0]  io_wakeups_9_bits_uop_dst_rtype,
  input         io_com_valids_0,
                io_com_valids_1,
                io_com_valids_2,
                io_com_valids_3,
  input  [6:0]  io_com_uops_0_pdst,
                io_com_uops_0_stale_pdst,
  input  [5:0]  io_com_uops_0_ldst,
  input         io_com_uops_0_ldst_val,
  input  [1:0]  io_com_uops_0_dst_rtype,
  input  [6:0]  io_com_uops_1_pdst,
                io_com_uops_1_stale_pdst,
  input  [5:0]  io_com_uops_1_ldst,
  input         io_com_uops_1_ldst_val,
  input  [1:0]  io_com_uops_1_dst_rtype,
  input  [6:0]  io_com_uops_2_pdst,
                io_com_uops_2_stale_pdst,
  input  [5:0]  io_com_uops_2_ldst,
  input         io_com_uops_2_ldst_val,
  input  [1:0]  io_com_uops_2_dst_rtype,
  input  [6:0]  io_com_uops_3_pdst,
                io_com_uops_3_stale_pdst,
  input  [5:0]  io_com_uops_3_ldst,
  input         io_com_uops_3_ldst_val,
  input  [1:0]  io_com_uops_3_dst_rtype,
  input         io_rbk_valids_0,
                io_rbk_valids_1,
                io_rbk_valids_2,
                io_rbk_valids_3,
                io_rollback,
                io_debug_rob_empty
);

  wire [6:0]  io_ren2_uops_3_newuop_pdst;
  wire [6:0]  io_ren2_uops_2_newuop_pdst;
  wire [6:0]  io_ren2_uops_1_newuop_pdst;
  wire [6:0]  io_ren2_uops_0_newuop_pdst;
  wire        _busytable_io_busy_resps_0_prs1_busy;
  wire        _busytable_io_busy_resps_0_prs2_busy;
  wire        _busytable_io_busy_resps_1_prs1_busy;
  wire        _busytable_io_busy_resps_1_prs2_busy;
  wire        _busytable_io_busy_resps_2_prs1_busy;
  wire        _busytable_io_busy_resps_2_prs2_busy;
  wire        _busytable_io_busy_resps_3_prs1_busy;
  wire        _busytable_io_busy_resps_3_prs2_busy;
  wire        _freelist_io_alloc_pregs_0_valid;
  wire [6:0]  _freelist_io_alloc_pregs_0_bits;
  wire        _freelist_io_alloc_pregs_1_valid;
  wire [6:0]  _freelist_io_alloc_pregs_1_bits;
  wire        _freelist_io_alloc_pregs_2_valid;
  wire [6:0]  _freelist_io_alloc_pregs_2_bits;
  wire        _freelist_io_alloc_pregs_3_valid;
  wire [6:0]  _freelist_io_alloc_pregs_3_bits;
  wire [6:0]  _maptable_io_map_resps_0_prs1;
  wire [6:0]  _maptable_io_map_resps_0_prs2;
  wire [6:0]  _maptable_io_map_resps_0_stale_pdst;
  wire [6:0]  _maptable_io_map_resps_1_prs1;
  wire [6:0]  _maptable_io_map_resps_1_prs2;
  wire [6:0]  _maptable_io_map_resps_1_stale_pdst;
  wire [6:0]  _maptable_io_map_resps_2_prs1;
  wire [6:0]  _maptable_io_map_resps_2_prs2;
  wire [6:0]  _maptable_io_map_resps_2_stale_pdst;
  wire [6:0]  _maptable_io_map_resps_3_prs1;
  wire [6:0]  _maptable_io_map_resps_3_prs2;
  wire [6:0]  _maptable_io_map_resps_3_stale_pdst;
  reg         r_valid;
  reg  [6:0]  r_uop_uopc;
  reg  [31:0] r_uop_inst;
  reg  [31:0] r_uop_debug_inst;
  reg         r_uop_is_rvc;
  reg  [39:0] r_uop_debug_pc;
  reg  [2:0]  r_uop_iq_type;
  reg  [9:0]  r_uop_fu_code;
  reg  [3:0]  r_uop_ctrl_br_type;
  reg  [1:0]  r_uop_ctrl_op1_sel;
  reg  [2:0]  r_uop_ctrl_op2_sel;
  reg  [2:0]  r_uop_ctrl_imm_sel;
  reg  [3:0]  r_uop_ctrl_op_fcn;
  reg         r_uop_ctrl_fcn_dw;
  reg  [2:0]  r_uop_ctrl_csr_cmd;
  reg         r_uop_ctrl_is_load;
  reg         r_uop_ctrl_is_sta;
  reg         r_uop_ctrl_is_std;
  reg  [1:0]  r_uop_iw_state;
  reg         r_uop_iw_p1_poisoned;
  reg         r_uop_iw_p2_poisoned;
  reg         r_uop_is_br;
  reg         r_uop_is_jalr;
  reg         r_uop_is_jal;
  reg         r_uop_is_sfb;
  reg  [19:0] r_uop_br_mask;
  reg  [4:0]  r_uop_br_tag;
  reg  [5:0]  r_uop_ftq_idx;
  reg         r_uop_edge_inst;
  reg  [5:0]  r_uop_pc_lob;
  reg         r_uop_taken;
  reg  [19:0] r_uop_imm_packed;
  reg  [11:0] r_uop_csr_addr;
  reg  [1:0]  r_uop_rxq_idx;
  reg  [6:0]  r_uop_prs1;
  reg  [6:0]  r_uop_prs2;
  reg  [6:0]  r_uop_stale_pdst;
  reg         r_uop_exception;
  reg  [63:0] r_uop_exc_cause;
  reg         r_uop_bypassable;
  reg  [4:0]  r_uop_mem_cmd;
  reg  [1:0]  r_uop_mem_size;
  reg         r_uop_mem_signed;
  reg         r_uop_is_fence;
  reg         r_uop_is_fencei;
  reg         r_uop_is_amo;
  reg         r_uop_uses_ldq;
  reg         r_uop_uses_stq;
  reg         r_uop_is_sys_pc2epc;
  reg         r_uop_is_unique;
  reg         r_uop_flush_on_commit;
  reg         r_uop_ldst_is_rs1;
  reg  [5:0]  r_uop_ldst;
  reg  [5:0]  r_uop_lrs1;
  reg  [5:0]  r_uop_lrs2;
  reg  [5:0]  r_uop_lrs3;
  reg         r_uop_ldst_val;
  reg  [1:0]  r_uop_dst_rtype;
  reg  [1:0]  r_uop_lrs1_rtype;
  reg  [1:0]  r_uop_lrs2_rtype;
  reg         r_uop_frs3_en;
  reg         r_uop_fp_val;
  reg         r_uop_fp_single;
  reg         r_uop_xcpt_pf_if;
  reg         r_uop_xcpt_ae_if;
  reg         r_uop_xcpt_ma_if;
  reg         r_uop_bp_debug_if;
  reg         r_uop_bp_xcpt_if;
  reg  [1:0]  r_uop_debug_fsrc;
  reg  [1:0]  r_uop_debug_tsrc;
  reg         r_valid_1;
  reg  [6:0]  r_uop_1_uopc;
  reg  [31:0] r_uop_1_inst;
  reg  [31:0] r_uop_1_debug_inst;
  reg         r_uop_1_is_rvc;
  reg  [39:0] r_uop_1_debug_pc;
  reg  [2:0]  r_uop_1_iq_type;
  reg  [9:0]  r_uop_1_fu_code;
  reg  [3:0]  r_uop_1_ctrl_br_type;
  reg  [1:0]  r_uop_1_ctrl_op1_sel;
  reg  [2:0]  r_uop_1_ctrl_op2_sel;
  reg  [2:0]  r_uop_1_ctrl_imm_sel;
  reg  [3:0]  r_uop_1_ctrl_op_fcn;
  reg         r_uop_1_ctrl_fcn_dw;
  reg  [2:0]  r_uop_1_ctrl_csr_cmd;
  reg         r_uop_1_ctrl_is_load;
  reg         r_uop_1_ctrl_is_sta;
  reg         r_uop_1_ctrl_is_std;
  reg  [1:0]  r_uop_1_iw_state;
  reg         r_uop_1_iw_p1_poisoned;
  reg         r_uop_1_iw_p2_poisoned;
  reg         r_uop_1_is_br;
  reg         r_uop_1_is_jalr;
  reg         r_uop_1_is_jal;
  reg         r_uop_1_is_sfb;
  reg  [19:0] r_uop_1_br_mask;
  reg  [4:0]  r_uop_1_br_tag;
  reg  [5:0]  r_uop_1_ftq_idx;
  reg         r_uop_1_edge_inst;
  reg  [5:0]  r_uop_1_pc_lob;
  reg         r_uop_1_taken;
  reg  [19:0] r_uop_1_imm_packed;
  reg  [11:0] r_uop_1_csr_addr;
  reg  [1:0]  r_uop_1_rxq_idx;
  reg  [6:0]  r_uop_1_prs1;
  reg  [6:0]  r_uop_1_prs2;
  reg  [6:0]  r_uop_1_stale_pdst;
  reg         r_uop_1_exception;
  reg  [63:0] r_uop_1_exc_cause;
  reg         r_uop_1_bypassable;
  reg  [4:0]  r_uop_1_mem_cmd;
  reg  [1:0]  r_uop_1_mem_size;
  reg         r_uop_1_mem_signed;
  reg         r_uop_1_is_fence;
  reg         r_uop_1_is_fencei;
  reg         r_uop_1_is_amo;
  reg         r_uop_1_uses_ldq;
  reg         r_uop_1_uses_stq;
  reg         r_uop_1_is_sys_pc2epc;
  reg         r_uop_1_is_unique;
  reg         r_uop_1_flush_on_commit;
  reg         r_uop_1_ldst_is_rs1;
  reg  [5:0]  r_uop_1_ldst;
  reg  [5:0]  r_uop_1_lrs1;
  reg  [5:0]  r_uop_1_lrs2;
  reg  [5:0]  r_uop_1_lrs3;
  reg         r_uop_1_ldst_val;
  reg  [1:0]  r_uop_1_dst_rtype;
  reg  [1:0]  r_uop_1_lrs1_rtype;
  reg  [1:0]  r_uop_1_lrs2_rtype;
  reg         r_uop_1_frs3_en;
  reg         r_uop_1_fp_val;
  reg         r_uop_1_fp_single;
  reg         r_uop_1_xcpt_pf_if;
  reg         r_uop_1_xcpt_ae_if;
  reg         r_uop_1_xcpt_ma_if;
  reg         r_uop_1_bp_debug_if;
  reg         r_uop_1_bp_xcpt_if;
  reg  [1:0]  r_uop_1_debug_fsrc;
  reg  [1:0]  r_uop_1_debug_tsrc;
  reg         r_valid_2;
  reg  [6:0]  r_uop_2_uopc;
  reg  [31:0] r_uop_2_inst;
  reg  [31:0] r_uop_2_debug_inst;
  reg         r_uop_2_is_rvc;
  reg  [39:0] r_uop_2_debug_pc;
  reg  [2:0]  r_uop_2_iq_type;
  reg  [9:0]  r_uop_2_fu_code;
  reg  [3:0]  r_uop_2_ctrl_br_type;
  reg  [1:0]  r_uop_2_ctrl_op1_sel;
  reg  [2:0]  r_uop_2_ctrl_op2_sel;
  reg  [2:0]  r_uop_2_ctrl_imm_sel;
  reg  [3:0]  r_uop_2_ctrl_op_fcn;
  reg         r_uop_2_ctrl_fcn_dw;
  reg  [2:0]  r_uop_2_ctrl_csr_cmd;
  reg         r_uop_2_ctrl_is_load;
  reg         r_uop_2_ctrl_is_sta;
  reg         r_uop_2_ctrl_is_std;
  reg  [1:0]  r_uop_2_iw_state;
  reg         r_uop_2_iw_p1_poisoned;
  reg         r_uop_2_iw_p2_poisoned;
  reg         r_uop_2_is_br;
  reg         r_uop_2_is_jalr;
  reg         r_uop_2_is_jal;
  reg         r_uop_2_is_sfb;
  reg  [19:0] r_uop_2_br_mask;
  reg  [4:0]  r_uop_2_br_tag;
  reg  [5:0]  r_uop_2_ftq_idx;
  reg         r_uop_2_edge_inst;
  reg  [5:0]  r_uop_2_pc_lob;
  reg         r_uop_2_taken;
  reg  [19:0] r_uop_2_imm_packed;
  reg  [11:0] r_uop_2_csr_addr;
  reg  [1:0]  r_uop_2_rxq_idx;
  reg  [6:0]  r_uop_2_prs1;
  reg  [6:0]  r_uop_2_prs2;
  reg  [6:0]  r_uop_2_stale_pdst;
  reg         r_uop_2_exception;
  reg  [63:0] r_uop_2_exc_cause;
  reg         r_uop_2_bypassable;
  reg  [4:0]  r_uop_2_mem_cmd;
  reg  [1:0]  r_uop_2_mem_size;
  reg         r_uop_2_mem_signed;
  reg         r_uop_2_is_fence;
  reg         r_uop_2_is_fencei;
  reg         r_uop_2_is_amo;
  reg         r_uop_2_uses_ldq;
  reg         r_uop_2_uses_stq;
  reg         r_uop_2_is_sys_pc2epc;
  reg         r_uop_2_is_unique;
  reg         r_uop_2_flush_on_commit;
  reg         r_uop_2_ldst_is_rs1;
  reg  [5:0]  r_uop_2_ldst;
  reg  [5:0]  r_uop_2_lrs1;
  reg  [5:0]  r_uop_2_lrs2;
  reg  [5:0]  r_uop_2_lrs3;
  reg         r_uop_2_ldst_val;
  reg  [1:0]  r_uop_2_dst_rtype;
  reg  [1:0]  r_uop_2_lrs1_rtype;
  reg  [1:0]  r_uop_2_lrs2_rtype;
  reg         r_uop_2_frs3_en;
  reg         r_uop_2_fp_val;
  reg         r_uop_2_fp_single;
  reg         r_uop_2_xcpt_pf_if;
  reg         r_uop_2_xcpt_ae_if;
  reg         r_uop_2_xcpt_ma_if;
  reg         r_uop_2_bp_debug_if;
  reg         r_uop_2_bp_xcpt_if;
  reg  [1:0]  r_uop_2_debug_fsrc;
  reg  [1:0]  r_uop_2_debug_tsrc;
  reg         r_valid_3;
  reg  [6:0]  r_uop_3_uopc;
  reg  [31:0] r_uop_3_inst;
  reg  [31:0] r_uop_3_debug_inst;
  reg         r_uop_3_is_rvc;
  reg  [39:0] r_uop_3_debug_pc;
  reg  [2:0]  r_uop_3_iq_type;
  reg  [9:0]  r_uop_3_fu_code;
  reg  [3:0]  r_uop_3_ctrl_br_type;
  reg  [1:0]  r_uop_3_ctrl_op1_sel;
  reg  [2:0]  r_uop_3_ctrl_op2_sel;
  reg  [2:0]  r_uop_3_ctrl_imm_sel;
  reg  [3:0]  r_uop_3_ctrl_op_fcn;
  reg         r_uop_3_ctrl_fcn_dw;
  reg  [2:0]  r_uop_3_ctrl_csr_cmd;
  reg         r_uop_3_ctrl_is_load;
  reg         r_uop_3_ctrl_is_sta;
  reg         r_uop_3_ctrl_is_std;
  reg  [1:0]  r_uop_3_iw_state;
  reg         r_uop_3_iw_p1_poisoned;
  reg         r_uop_3_iw_p2_poisoned;
  reg         r_uop_3_is_br;
  reg         r_uop_3_is_jalr;
  reg         r_uop_3_is_jal;
  reg         r_uop_3_is_sfb;
  reg  [19:0] r_uop_3_br_mask;
  reg  [4:0]  r_uop_3_br_tag;
  reg  [5:0]  r_uop_3_ftq_idx;
  reg         r_uop_3_edge_inst;
  reg  [5:0]  r_uop_3_pc_lob;
  reg         r_uop_3_taken;
  reg  [19:0] r_uop_3_imm_packed;
  reg  [11:0] r_uop_3_csr_addr;
  reg  [1:0]  r_uop_3_rxq_idx;
  reg  [6:0]  r_uop_3_prs1;
  reg  [6:0]  r_uop_3_prs2;
  reg  [6:0]  r_uop_3_stale_pdst;
  reg         r_uop_3_exception;
  reg  [63:0] r_uop_3_exc_cause;
  reg         r_uop_3_bypassable;
  reg  [4:0]  r_uop_3_mem_cmd;
  reg  [1:0]  r_uop_3_mem_size;
  reg         r_uop_3_mem_signed;
  reg         r_uop_3_is_fence;
  reg         r_uop_3_is_fencei;
  reg         r_uop_3_is_amo;
  reg         r_uop_3_uses_ldq;
  reg         r_uop_3_uses_stq;
  reg         r_uop_3_is_sys_pc2epc;
  reg         r_uop_3_is_unique;
  reg         r_uop_3_flush_on_commit;
  reg         r_uop_3_ldst_is_rs1;
  reg  [5:0]  r_uop_3_ldst;
  reg  [5:0]  r_uop_3_lrs1;
  reg  [5:0]  r_uop_3_lrs2;
  reg  [5:0]  r_uop_3_lrs3;
  reg         r_uop_3_ldst_val;
  reg  [1:0]  r_uop_3_dst_rtype;
  reg  [1:0]  r_uop_3_lrs1_rtype;
  reg  [1:0]  r_uop_3_lrs2_rtype;
  reg         r_uop_3_frs3_en;
  reg         r_uop_3_fp_val;
  reg         r_uop_3_fp_single;
  reg         r_uop_3_xcpt_pf_if;
  reg         r_uop_3_xcpt_ae_if;
  reg         r_uop_3_xcpt_ma_if;
  reg         r_uop_3_bp_debug_if;
  reg         r_uop_3_bp_xcpt_if;
  reg  [1:0]  r_uop_3_debug_fsrc;
  reg  [1:0]  r_uop_3_debug_tsrc;
  wire        _io_ren_stalls_0_T = r_uop_dst_rtype == 2'h0;
  wire        ren2_alloc_reqs_0 = r_uop_ldst_val & _io_ren_stalls_0_T & io_dis_fire_0;
  wire        ren2_br_tags_0_valid = io_dis_fire_0 & (r_uop_is_br & ~r_uop_is_sfb | r_uop_is_jalr);
  wire        _rbk_valids_0_T = io_com_uops_0_dst_rtype == 2'h0;
  wire        rbk_valids_0 = io_com_uops_0_ldst_val & _rbk_valids_0_T & io_rbk_valids_0;
  wire        _io_ren_stalls_1_T = r_uop_1_dst_rtype == 2'h0;
  wire        ren2_alloc_reqs_1 = r_uop_1_ldst_val & _io_ren_stalls_1_T & io_dis_fire_1;
  wire        ren2_br_tags_1_valid = io_dis_fire_1 & (r_uop_1_is_br & ~r_uop_1_is_sfb | r_uop_1_is_jalr);
  wire        _rbk_valids_1_T = io_com_uops_1_dst_rtype == 2'h0;
  wire        rbk_valids_1 = io_com_uops_1_ldst_val & _rbk_valids_1_T & io_rbk_valids_1;
  wire        _io_ren_stalls_2_T = r_uop_2_dst_rtype == 2'h0;
  wire        ren2_alloc_reqs_2 = r_uop_2_ldst_val & _io_ren_stalls_2_T & io_dis_fire_2;
  wire        ren2_br_tags_2_valid = io_dis_fire_2 & (r_uop_2_is_br & ~r_uop_2_is_sfb | r_uop_2_is_jalr);
  wire        _rbk_valids_2_T = io_com_uops_2_dst_rtype == 2'h0;
  wire        rbk_valids_2 = io_com_uops_2_ldst_val & _rbk_valids_2_T & io_rbk_valids_2;
  wire        _io_ren_stalls_3_T = r_uop_3_dst_rtype == 2'h0;
  wire        ren2_alloc_reqs_3 = r_uop_3_ldst_val & _io_ren_stalls_3_T & io_dis_fire_3;
  wire        ren2_br_tags_3_valid = io_dis_fire_3 & (r_uop_3_is_br & ~r_uop_3_is_sfb | r_uop_3_is_jalr);
  wire        _rbk_valids_3_T = io_com_uops_3_dst_rtype == 2'h0;
  wire        rbk_valids_3 = io_com_uops_3_ldst_val & _rbk_valids_3_T & io_rbk_valids_3;
  assign io_ren2_uops_0_newuop_pdst = (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0;
  assign io_ren2_uops_1_newuop_pdst = (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0;
  assign io_ren2_uops_2_newuop_pdst = (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0;
  assign io_ren2_uops_3_newuop_pdst = (|r_uop_3_ldst) ? _freelist_io_alloc_pregs_3_bits : 7'h0;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~((~ren2_alloc_reqs_0 | (|_freelist_io_alloc_pregs_0_bits)) & (~ren2_alloc_reqs_1 | (|_freelist_io_alloc_pregs_1_bits)) & (~ren2_alloc_reqs_2 | (|_freelist_io_alloc_pregs_2_bits)) & (~ren2_alloc_reqs_3 | (|_freelist_io_alloc_pregs_3_bits)))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [rename-stage] A uop is trying to allocate the zero physical register.\n    at rename-stage.scala:300 assert (ren2_alloc_reqs zip freelist.io.alloc_pregs map {case (r,p) => !r || p.bits =/= 0.U} reduce (_&&_),\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & (io_wakeups_0_valid & (|io_wakeups_0_bits_uop_dst_rtype) | io_wakeups_1_valid & (|io_wakeups_1_bits_uop_dst_rtype) | io_wakeups_2_valid & (|io_wakeups_2_bits_uop_dst_rtype) | io_wakeups_3_valid & (|io_wakeups_3_bits_uop_dst_rtype) | io_wakeups_4_valid & (|io_wakeups_4_bits_uop_dst_rtype) | io_wakeups_5_valid & (|io_wakeups_5_bits_uop_dst_rtype) | io_wakeups_6_valid & (|io_wakeups_6_bits_uop_dst_rtype) | io_wakeups_7_valid & (|io_wakeups_7_bits_uop_dst_rtype) | io_wakeups_8_valid & (|io_wakeups_8_bits_uop_dst_rtype) | io_wakeups_9_valid & (|io_wakeups_9_bits_uop_dst_rtype))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [rename] Wakeup has wrong rtype.\n    at rename-stage.scala:317 assert (!(io.wakeups.map(x => x.valid && x.bits.uop.dst_rtype =/= rtype).reduce(_||_)),\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & r_valid & _busytable_io_busy_resps_0_prs1_busy & r_uop_lrs1 == 6'h0) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [rename] x0 is busy??\n    at rename-stage.scala:328 assert (!(valid && busy.prs1_busy && rtype === RT_FIX && uop.lrs1 === 0.U), \"[rename] x0 is busy??\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & r_valid & _busytable_io_busy_resps_0_prs2_busy & r_uop_lrs2 == 6'h0) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [rename] x0 is busy??\n    at rename-stage.scala:329 assert (!(valid && busy.prs2_busy && rtype === RT_FIX && uop.lrs2 === 0.U), \"[rename] x0 is busy??\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & r_valid_1 & _busytable_io_busy_resps_1_prs1_busy & r_uop_1_lrs1 == 6'h0) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [rename] x0 is busy??\n    at rename-stage.scala:328 assert (!(valid && busy.prs1_busy && rtype === RT_FIX && uop.lrs1 === 0.U), \"[rename] x0 is busy??\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & r_valid_1 & _busytable_io_busy_resps_1_prs2_busy & r_uop_1_lrs2 == 6'h0) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [rename] x0 is busy??\n    at rename-stage.scala:329 assert (!(valid && busy.prs2_busy && rtype === RT_FIX && uop.lrs2 === 0.U), \"[rename] x0 is busy??\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & r_valid_2 & _busytable_io_busy_resps_2_prs1_busy & r_uop_2_lrs1 == 6'h0) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [rename] x0 is busy??\n    at rename-stage.scala:328 assert (!(valid && busy.prs1_busy && rtype === RT_FIX && uop.lrs1 === 0.U), \"[rename] x0 is busy??\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & r_valid_2 & _busytable_io_busy_resps_2_prs2_busy & r_uop_2_lrs2 == 6'h0) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [rename] x0 is busy??\n    at rename-stage.scala:329 assert (!(valid && busy.prs2_busy && rtype === RT_FIX && uop.lrs2 === 0.U), \"[rename] x0 is busy??\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & r_valid_3 & _busytable_io_busy_resps_3_prs1_busy & r_uop_3_lrs1 == 6'h0) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [rename] x0 is busy??\n    at rename-stage.scala:328 assert (!(valid && busy.prs1_busy && rtype === RT_FIX && uop.lrs1 === 0.U), \"[rename] x0 is busy??\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & r_valid_3 & _busytable_io_busy_resps_3_prs2_busy & r_uop_3_lrs2 == 6'h0) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [rename] x0 is busy??\n    at rename-stage.scala:329 assert (!(valid && busy.prs2_busy && rtype === RT_FIX && uop.lrs2 === 0.U), \"[rename] x0 is busy??\")\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        bypassed_uop_bypass_sel_rs1_0 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_1_lrs1;
  wire        bypassed_uop_bypass_sel_rs2_0 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_1_lrs2;
  wire        bypassed_uop_bypass_hits_rs1_0_1 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_2_lrs1;
  wire        bypassed_uop_bypass_hits_rs1_1 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_2_lrs1;
  wire        bypassed_uop_bypass_hits_rs2_0_1 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_2_lrs2;
  wire        bypassed_uop_bypass_hits_rs2_1 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_2_lrs2;
  wire        bypassed_uop_bypass_hits_dst_0_1 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_2_ldst;
  wire        bypassed_uop_bypass_hits_dst_1 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_2_ldst;
  wire [1:0]  bypassed_uop_bypass_sel_rs1_enc_1 = bypassed_uop_bypass_hits_rs1_1 ? 2'h1 : {bypassed_uop_bypass_hits_rs1_0_1, 1'h0};
  wire [1:0]  bypassed_uop_bypass_sel_rs2_enc_1 = bypassed_uop_bypass_hits_rs2_1 ? 2'h1 : {bypassed_uop_bypass_hits_rs2_0_1, 1'h0};
  wire [1:0]  bypassed_uop_bypass_sel_dst_enc_1 = bypassed_uop_bypass_hits_dst_1 ? 2'h1 : {bypassed_uop_bypass_hits_dst_0_1, 1'h0};
  wire        bypassed_uop_do_bypass_rs1 = bypassed_uop_bypass_hits_rs1_0_1 | bypassed_uop_bypass_hits_rs1_1;
  wire        bypassed_uop_do_bypass_rs2 = bypassed_uop_bypass_hits_rs2_0_1 | bypassed_uop_bypass_hits_rs2_1;
  wire        bypassed_uop_bypass_hits_rs1_0_2 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_3_lrs1;
  wire        bypassed_uop_bypass_hits_rs1_1_1 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_3_lrs1;
  wire        bypassed_uop_bypass_hits_rs1_2 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_3_lrs1;
  wire        bypassed_uop_bypass_hits_rs2_0_2 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_3_lrs2;
  wire        bypassed_uop_bypass_hits_rs2_1_1 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_3_lrs2;
  wire        bypassed_uop_bypass_hits_rs2_2 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_3_lrs2;
  wire        bypassed_uop_bypass_hits_dst_0_2 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_3_ldst;
  wire        bypassed_uop_bypass_hits_dst_1_1 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_3_ldst;
  wire        bypassed_uop_bypass_hits_dst_2 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_3_ldst;
  wire [2:0]  bypassed_uop_bypass_sel_rs1_enc_2 = bypassed_uop_bypass_hits_rs1_2 ? 3'h1 : bypassed_uop_bypass_hits_rs1_1_1 ? 3'h2 : {bypassed_uop_bypass_hits_rs1_0_2, 2'h0};
  wire [2:0]  bypassed_uop_bypass_sel_rs2_enc_2 = bypassed_uop_bypass_hits_rs2_2 ? 3'h1 : bypassed_uop_bypass_hits_rs2_1_1 ? 3'h2 : {bypassed_uop_bypass_hits_rs2_0_2, 2'h0};
  wire [2:0]  bypassed_uop_bypass_sel_dst_enc_2 = bypassed_uop_bypass_hits_dst_2 ? 3'h1 : bypassed_uop_bypass_hits_dst_1_1 ? 3'h2 : {bypassed_uop_bypass_hits_dst_0_2, 2'h0};
  wire        bypassed_uop_do_bypass_rs1_1 = bypassed_uop_bypass_hits_rs1_0_2 | bypassed_uop_bypass_hits_rs1_1_1 | bypassed_uop_bypass_hits_rs1_2;
  wire        bypassed_uop_do_bypass_rs2_1 = bypassed_uop_bypass_hits_rs2_0_2 | bypassed_uop_bypass_hits_rs2_1_1 | bypassed_uop_bypass_hits_rs2_2;
  wire        _GEN = io_kill | ~io_dis_ready;
  wire [5:0]  r_uop_newuop_ldst = _GEN ? r_uop_ldst : io_dec_uops_0_ldst;
  wire [5:0]  r_uop_newuop_lrs1 = _GEN ? r_uop_lrs1 : io_dec_uops_0_lrs1;
  wire [5:0]  r_uop_newuop_lrs2 = _GEN ? r_uop_lrs2 : io_dec_uops_0_lrs2;
  wire        r_uop_bypass_hits_rs1_0 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_newuop_lrs1;
  wire        r_uop_bypass_hits_rs1_1 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_newuop_lrs1;
  wire        r_uop_bypass_hits_rs1_2 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_newuop_lrs1;
  wire        r_uop_bypass_hits_rs1_3 = ren2_alloc_reqs_3 & r_uop_3_ldst == r_uop_newuop_lrs1;
  wire        r_uop_bypass_hits_rs2_0 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_newuop_lrs2;
  wire        r_uop_bypass_hits_rs2_1 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_newuop_lrs2;
  wire        r_uop_bypass_hits_rs2_2 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_newuop_lrs2;
  wire        r_uop_bypass_hits_rs2_3 = ren2_alloc_reqs_3 & r_uop_3_ldst == r_uop_newuop_lrs2;
  wire        r_uop_bypass_hits_dst_0 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_newuop_ldst;
  wire        r_uop_bypass_hits_dst_1 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_newuop_ldst;
  wire        r_uop_bypass_hits_dst_2 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_newuop_ldst;
  wire        r_uop_bypass_hits_dst_3 = ren2_alloc_reqs_3 & r_uop_3_ldst == r_uop_newuop_ldst;
  wire [5:0]  r_uop_newuop_1_ldst = _GEN ? r_uop_1_ldst : io_dec_uops_1_ldst;
  wire [5:0]  r_uop_newuop_1_lrs1 = _GEN ? r_uop_1_lrs1 : io_dec_uops_1_lrs1;
  wire [5:0]  r_uop_newuop_1_lrs2 = _GEN ? r_uop_1_lrs2 : io_dec_uops_1_lrs2;
  wire        r_uop_bypass_hits_rs1_0_1 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_newuop_1_lrs1;
  wire        r_uop_bypass_hits_rs1_1_1 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_newuop_1_lrs1;
  wire        r_uop_bypass_hits_rs1_2_1 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_newuop_1_lrs1;
  wire        r_uop_bypass_hits_rs1_3_1 = ren2_alloc_reqs_3 & r_uop_3_ldst == r_uop_newuop_1_lrs1;
  wire        r_uop_bypass_hits_rs2_0_1 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_newuop_1_lrs2;
  wire        r_uop_bypass_hits_rs2_1_1 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_newuop_1_lrs2;
  wire        r_uop_bypass_hits_rs2_2_1 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_newuop_1_lrs2;
  wire        r_uop_bypass_hits_rs2_3_1 = ren2_alloc_reqs_3 & r_uop_3_ldst == r_uop_newuop_1_lrs2;
  wire        r_uop_bypass_hits_dst_0_1 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_newuop_1_ldst;
  wire        r_uop_bypass_hits_dst_1_1 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_newuop_1_ldst;
  wire        r_uop_bypass_hits_dst_2_1 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_newuop_1_ldst;
  wire        r_uop_bypass_hits_dst_3_1 = ren2_alloc_reqs_3 & r_uop_3_ldst == r_uop_newuop_1_ldst;
  wire [5:0]  r_uop_newuop_2_ldst = _GEN ? r_uop_2_ldst : io_dec_uops_2_ldst;
  wire [5:0]  r_uop_newuop_2_lrs1 = _GEN ? r_uop_2_lrs1 : io_dec_uops_2_lrs1;
  wire [5:0]  r_uop_newuop_2_lrs2 = _GEN ? r_uop_2_lrs2 : io_dec_uops_2_lrs2;
  wire        r_uop_bypass_hits_rs1_0_2 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_newuop_2_lrs1;
  wire        r_uop_bypass_hits_rs1_1_2 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_newuop_2_lrs1;
  wire        r_uop_bypass_hits_rs1_2_2 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_newuop_2_lrs1;
  wire        r_uop_bypass_hits_rs1_3_2 = ren2_alloc_reqs_3 & r_uop_3_ldst == r_uop_newuop_2_lrs1;
  wire        r_uop_bypass_hits_rs2_0_2 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_newuop_2_lrs2;
  wire        r_uop_bypass_hits_rs2_1_2 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_newuop_2_lrs2;
  wire        r_uop_bypass_hits_rs2_2_2 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_newuop_2_lrs2;
  wire        r_uop_bypass_hits_rs2_3_2 = ren2_alloc_reqs_3 & r_uop_3_ldst == r_uop_newuop_2_lrs2;
  wire        r_uop_bypass_hits_dst_0_2 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_newuop_2_ldst;
  wire        r_uop_bypass_hits_dst_1_2 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_newuop_2_ldst;
  wire        r_uop_bypass_hits_dst_2_2 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_newuop_2_ldst;
  wire        r_uop_bypass_hits_dst_3_2 = ren2_alloc_reqs_3 & r_uop_3_ldst == r_uop_newuop_2_ldst;
  wire [5:0]  r_uop_newuop_3_ldst = _GEN ? r_uop_3_ldst : io_dec_uops_3_ldst;
  wire [5:0]  r_uop_newuop_3_lrs1 = _GEN ? r_uop_3_lrs1 : io_dec_uops_3_lrs1;
  wire [5:0]  r_uop_newuop_3_lrs2 = _GEN ? r_uop_3_lrs2 : io_dec_uops_3_lrs2;
  wire        r_uop_bypass_hits_rs1_0_3 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_newuop_3_lrs1;
  wire        r_uop_bypass_hits_rs1_1_3 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_newuop_3_lrs1;
  wire        r_uop_bypass_hits_rs1_2_3 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_newuop_3_lrs1;
  wire        r_uop_bypass_hits_rs1_3_3 = ren2_alloc_reqs_3 & r_uop_3_ldst == r_uop_newuop_3_lrs1;
  wire        r_uop_bypass_hits_rs2_0_3 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_newuop_3_lrs2;
  wire        r_uop_bypass_hits_rs2_1_3 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_newuop_3_lrs2;
  wire        r_uop_bypass_hits_rs2_2_3 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_newuop_3_lrs2;
  wire        r_uop_bypass_hits_rs2_3_3 = ren2_alloc_reqs_3 & r_uop_3_ldst == r_uop_newuop_3_lrs2;
  wire        r_uop_bypass_hits_dst_0_3 = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_newuop_3_ldst;
  wire        r_uop_bypass_hits_dst_1_3 = ren2_alloc_reqs_1 & r_uop_1_ldst == r_uop_newuop_3_ldst;
  wire        r_uop_bypass_hits_dst_2_3 = ren2_alloc_reqs_2 & r_uop_2_ldst == r_uop_newuop_3_ldst;
  wire        r_uop_bypass_hits_dst_3_3 = ren2_alloc_reqs_3 & r_uop_3_ldst == r_uop_newuop_3_ldst;
  wire [3:0]  r_uop_bypass_sel_rs1_enc = r_uop_bypass_hits_rs1_3 ? 4'h1 : r_uop_bypass_hits_rs1_2 ? 4'h2 : r_uop_bypass_hits_rs1_1 ? 4'h4 : {r_uop_bypass_hits_rs1_0, 3'h0};
  wire [3:0]  r_uop_bypass_sel_rs2_enc = r_uop_bypass_hits_rs2_3 ? 4'h1 : r_uop_bypass_hits_rs2_2 ? 4'h2 : r_uop_bypass_hits_rs2_1 ? 4'h4 : {r_uop_bypass_hits_rs2_0, 3'h0};
  wire [3:0]  r_uop_bypass_sel_dst_enc = r_uop_bypass_hits_dst_3 ? 4'h1 : r_uop_bypass_hits_dst_2 ? 4'h2 : r_uop_bypass_hits_dst_1 ? 4'h4 : {r_uop_bypass_hits_dst_0, 3'h0};
  wire [3:0]  r_uop_bypass_sel_rs1_enc_1 = r_uop_bypass_hits_rs1_3_1 ? 4'h1 : r_uop_bypass_hits_rs1_2_1 ? 4'h2 : r_uop_bypass_hits_rs1_1_1 ? 4'h4 : {r_uop_bypass_hits_rs1_0_1, 3'h0};
  wire [3:0]  r_uop_bypass_sel_rs2_enc_1 = r_uop_bypass_hits_rs2_3_1 ? 4'h1 : r_uop_bypass_hits_rs2_2_1 ? 4'h2 : r_uop_bypass_hits_rs2_1_1 ? 4'h4 : {r_uop_bypass_hits_rs2_0_1, 3'h0};
  wire [3:0]  r_uop_bypass_sel_dst_enc_1 = r_uop_bypass_hits_dst_3_1 ? 4'h1 : r_uop_bypass_hits_dst_2_1 ? 4'h2 : r_uop_bypass_hits_dst_1_1 ? 4'h4 : {r_uop_bypass_hits_dst_0_1, 3'h0};
  wire [3:0]  r_uop_bypass_sel_rs1_enc_2 = r_uop_bypass_hits_rs1_3_2 ? 4'h1 : r_uop_bypass_hits_rs1_2_2 ? 4'h2 : r_uop_bypass_hits_rs1_1_2 ? 4'h4 : {r_uop_bypass_hits_rs1_0_2, 3'h0};
  wire [3:0]  r_uop_bypass_sel_rs2_enc_2 = r_uop_bypass_hits_rs2_3_2 ? 4'h1 : r_uop_bypass_hits_rs2_2_2 ? 4'h2 : r_uop_bypass_hits_rs2_1_2 ? 4'h4 : {r_uop_bypass_hits_rs2_0_2, 3'h0};
  wire [3:0]  r_uop_bypass_sel_dst_enc_2 = r_uop_bypass_hits_dst_3_2 ? 4'h1 : r_uop_bypass_hits_dst_2_2 ? 4'h2 : r_uop_bypass_hits_dst_1_2 ? 4'h4 : {r_uop_bypass_hits_dst_0_2, 3'h0};
  wire [3:0]  r_uop_bypass_sel_rs1_enc_3 = r_uop_bypass_hits_rs1_3_3 ? 4'h1 : r_uop_bypass_hits_rs1_2_3 ? 4'h2 : r_uop_bypass_hits_rs1_1_3 ? 4'h4 : {r_uop_bypass_hits_rs1_0_3, 3'h0};
  wire [3:0]  r_uop_bypass_sel_rs2_enc_3 = r_uop_bypass_hits_rs2_3_3 ? 4'h1 : r_uop_bypass_hits_rs2_2_3 ? 4'h2 : r_uop_bypass_hits_rs2_1_3 ? 4'h4 : {r_uop_bypass_hits_rs2_0_3, 3'h0};
  wire [3:0]  r_uop_bypass_sel_dst_enc_3 = r_uop_bypass_hits_dst_3_3 ? 4'h1 : r_uop_bypass_hits_dst_2_3 ? 4'h2 : r_uop_bypass_hits_dst_1_3 ? 4'h4 : {r_uop_bypass_hits_dst_0_3, 3'h0};
  always @(posedge clock) begin
    if (reset) begin
      r_valid <= 1'h0;
      r_valid_1 <= 1'h0;
      r_valid_2 <= 1'h0;
      r_valid_3 <= 1'h0;
    end
    else begin
      r_valid <= ~io_kill & (io_dis_ready ? io_dec_fire_0 : r_valid & ~io_dis_fire_0);
      r_valid_1 <= ~io_kill & (io_dis_ready ? io_dec_fire_1 : r_valid_1 & ~io_dis_fire_1);
      r_valid_2 <= ~io_kill & (io_dis_ready ? io_dec_fire_2 : r_valid_2 & ~io_dis_fire_2);
      r_valid_3 <= ~io_kill & (io_dis_ready ? io_dec_fire_3 : r_valid_3 & ~io_dis_fire_3);
    end
    if (_GEN) begin
    end
    else begin
      r_uop_uopc <= io_dec_uops_0_uopc;
      r_uop_inst <= io_dec_uops_0_inst;
      r_uop_debug_inst <= io_dec_uops_0_debug_inst;
      r_uop_is_rvc <= io_dec_uops_0_is_rvc;
      r_uop_debug_pc <= io_dec_uops_0_debug_pc;
      r_uop_iq_type <= io_dec_uops_0_iq_type;
      r_uop_fu_code <= io_dec_uops_0_fu_code;
      r_uop_ctrl_br_type <= 4'h0;
      r_uop_ctrl_op1_sel <= 2'h0;
      r_uop_ctrl_op2_sel <= 3'h0;
      r_uop_ctrl_imm_sel <= 3'h0;
      r_uop_ctrl_op_fcn <= 4'h0;
    end
    r_uop_ctrl_fcn_dw <= _GEN & r_uop_ctrl_fcn_dw;
    if (_GEN) begin
    end
    else
      r_uop_ctrl_csr_cmd <= 3'h0;
    r_uop_ctrl_is_load <= _GEN & r_uop_ctrl_is_load;
    r_uop_ctrl_is_sta <= _GEN & r_uop_ctrl_is_sta;
    r_uop_ctrl_is_std <= _GEN & r_uop_ctrl_is_std;
    if (_GEN) begin
    end
    else
      r_uop_iw_state <= 2'h0;
    r_uop_iw_p1_poisoned <= _GEN & r_uop_iw_p1_poisoned;
    r_uop_iw_p2_poisoned <= _GEN & r_uop_iw_p2_poisoned;
    if (_GEN) begin
    end
    else begin
      r_uop_is_br <= io_dec_uops_0_is_br;
      r_uop_is_jalr <= io_dec_uops_0_is_jalr;
      r_uop_is_jal <= io_dec_uops_0_is_jal;
      r_uop_is_sfb <= io_dec_uops_0_is_sfb;
    end
    r_uop_br_mask <= (_GEN ? r_uop_br_mask : io_dec_uops_0_br_mask) & ~io_brupdate_b1_resolve_mask;
    if (_GEN) begin
    end
    else begin
      r_uop_br_tag <= io_dec_uops_0_br_tag;
      r_uop_ftq_idx <= io_dec_uops_0_ftq_idx;
      r_uop_edge_inst <= io_dec_uops_0_edge_inst;
      r_uop_pc_lob <= io_dec_uops_0_pc_lob;
      r_uop_taken <= io_dec_uops_0_taken;
      r_uop_imm_packed <= io_dec_uops_0_imm_packed;
      r_uop_csr_addr <= 12'h0;
      r_uop_rxq_idx <= 2'h0;
    end
    if (r_uop_bypass_hits_rs1_0 | r_uop_bypass_hits_rs1_1 | r_uop_bypass_hits_rs1_2 | r_uop_bypass_hits_rs1_3)
      r_uop_prs1 <= (r_uop_bypass_sel_rs1_enc[3] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (r_uop_bypass_sel_rs1_enc[2] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (r_uop_bypass_sel_rs1_enc[1] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) | (r_uop_bypass_sel_rs1_enc[0] & (|r_uop_3_ldst) ? _freelist_io_alloc_pregs_3_bits : 7'h0);
    else if (_GEN) begin
    end
    else
      r_uop_prs1 <= _maptable_io_map_resps_0_prs1;
    if (r_uop_bypass_hits_rs2_0 | r_uop_bypass_hits_rs2_1 | r_uop_bypass_hits_rs2_2 | r_uop_bypass_hits_rs2_3)
      r_uop_prs2 <= (r_uop_bypass_sel_rs2_enc[3] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (r_uop_bypass_sel_rs2_enc[2] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (r_uop_bypass_sel_rs2_enc[1] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) | (r_uop_bypass_sel_rs2_enc[0] & (|r_uop_3_ldst) ? _freelist_io_alloc_pregs_3_bits : 7'h0);
    else if (_GEN) begin
    end
    else
      r_uop_prs2 <= _maptable_io_map_resps_0_prs2;
    if (r_uop_bypass_hits_dst_0 | r_uop_bypass_hits_dst_1 | r_uop_bypass_hits_dst_2 | r_uop_bypass_hits_dst_3)
      r_uop_stale_pdst <= (r_uop_bypass_sel_dst_enc[3] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (r_uop_bypass_sel_dst_enc[2] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (r_uop_bypass_sel_dst_enc[1] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) | (r_uop_bypass_sel_dst_enc[0] & (|r_uop_3_ldst) ? _freelist_io_alloc_pregs_3_bits : 7'h0);
    else if (_GEN) begin
    end
    else
      r_uop_stale_pdst <= _maptable_io_map_resps_0_stale_pdst;
    if (_GEN) begin
    end
    else begin
      r_uop_exception <= io_dec_uops_0_exception;
      r_uop_exc_cause <= io_dec_uops_0_exc_cause;
      r_uop_bypassable <= io_dec_uops_0_bypassable;
      r_uop_mem_cmd <= io_dec_uops_0_mem_cmd;
      r_uop_mem_size <= io_dec_uops_0_mem_size;
      r_uop_mem_signed <= io_dec_uops_0_mem_signed;
      r_uop_is_fence <= io_dec_uops_0_is_fence;
      r_uop_is_fencei <= io_dec_uops_0_is_fencei;
      r_uop_is_amo <= io_dec_uops_0_is_amo;
      r_uop_uses_ldq <= io_dec_uops_0_uses_ldq;
      r_uop_uses_stq <= io_dec_uops_0_uses_stq;
      r_uop_is_sys_pc2epc <= io_dec_uops_0_is_sys_pc2epc;
      r_uop_is_unique <= io_dec_uops_0_is_unique;
      r_uop_flush_on_commit <= io_dec_uops_0_flush_on_commit;
    end
    r_uop_ldst_is_rs1 <= _GEN & r_uop_ldst_is_rs1;
    if (_GEN) begin
    end
    else begin
      r_uop_ldst <= io_dec_uops_0_ldst;
      r_uop_lrs1 <= io_dec_uops_0_lrs1;
      r_uop_lrs2 <= io_dec_uops_0_lrs2;
      r_uop_lrs3 <= io_dec_uops_0_lrs3;
      r_uop_ldst_val <= io_dec_uops_0_ldst_val;
      r_uop_dst_rtype <= io_dec_uops_0_dst_rtype;
      r_uop_lrs1_rtype <= io_dec_uops_0_lrs1_rtype;
      r_uop_lrs2_rtype <= io_dec_uops_0_lrs2_rtype;
      r_uop_frs3_en <= io_dec_uops_0_frs3_en;
      r_uop_fp_val <= io_dec_uops_0_fp_val;
      r_uop_fp_single <= io_dec_uops_0_fp_single;
      r_uop_xcpt_pf_if <= io_dec_uops_0_xcpt_pf_if;
      r_uop_xcpt_ae_if <= io_dec_uops_0_xcpt_ae_if;
    end
    r_uop_xcpt_ma_if <= _GEN & r_uop_xcpt_ma_if;
    if (_GEN) begin
    end
    else begin
      r_uop_bp_debug_if <= io_dec_uops_0_bp_debug_if;
      r_uop_bp_xcpt_if <= io_dec_uops_0_bp_xcpt_if;
      r_uop_debug_fsrc <= io_dec_uops_0_debug_fsrc;
      r_uop_debug_tsrc <= 2'h0;
      r_uop_1_uopc <= io_dec_uops_1_uopc;
      r_uop_1_inst <= io_dec_uops_1_inst;
      r_uop_1_debug_inst <= io_dec_uops_1_debug_inst;
      r_uop_1_is_rvc <= io_dec_uops_1_is_rvc;
      r_uop_1_debug_pc <= io_dec_uops_1_debug_pc;
      r_uop_1_iq_type <= io_dec_uops_1_iq_type;
      r_uop_1_fu_code <= io_dec_uops_1_fu_code;
      r_uop_1_ctrl_br_type <= 4'h0;
      r_uop_1_ctrl_op1_sel <= 2'h0;
      r_uop_1_ctrl_op2_sel <= 3'h0;
      r_uop_1_ctrl_imm_sel <= 3'h0;
      r_uop_1_ctrl_op_fcn <= 4'h0;
    end
    r_uop_1_ctrl_fcn_dw <= _GEN & r_uop_1_ctrl_fcn_dw;
    if (_GEN) begin
    end
    else
      r_uop_1_ctrl_csr_cmd <= 3'h0;
    r_uop_1_ctrl_is_load <= _GEN & r_uop_1_ctrl_is_load;
    r_uop_1_ctrl_is_sta <= _GEN & r_uop_1_ctrl_is_sta;
    r_uop_1_ctrl_is_std <= _GEN & r_uop_1_ctrl_is_std;
    if (_GEN) begin
    end
    else
      r_uop_1_iw_state <= 2'h0;
    r_uop_1_iw_p1_poisoned <= _GEN & r_uop_1_iw_p1_poisoned;
    r_uop_1_iw_p2_poisoned <= _GEN & r_uop_1_iw_p2_poisoned;
    if (_GEN) begin
    end
    else begin
      r_uop_1_is_br <= io_dec_uops_1_is_br;
      r_uop_1_is_jalr <= io_dec_uops_1_is_jalr;
      r_uop_1_is_jal <= io_dec_uops_1_is_jal;
      r_uop_1_is_sfb <= io_dec_uops_1_is_sfb;
    end
    r_uop_1_br_mask <= (_GEN ? r_uop_1_br_mask : io_dec_uops_1_br_mask) & ~io_brupdate_b1_resolve_mask;
    if (_GEN) begin
    end
    else begin
      r_uop_1_br_tag <= io_dec_uops_1_br_tag;
      r_uop_1_ftq_idx <= io_dec_uops_1_ftq_idx;
      r_uop_1_edge_inst <= io_dec_uops_1_edge_inst;
      r_uop_1_pc_lob <= io_dec_uops_1_pc_lob;
      r_uop_1_taken <= io_dec_uops_1_taken;
      r_uop_1_imm_packed <= io_dec_uops_1_imm_packed;
      r_uop_1_csr_addr <= 12'h0;
      r_uop_1_rxq_idx <= 2'h0;
    end
    if (r_uop_bypass_hits_rs1_0_1 | r_uop_bypass_hits_rs1_1_1 | r_uop_bypass_hits_rs1_2_1 | r_uop_bypass_hits_rs1_3_1)
      r_uop_1_prs1 <= (r_uop_bypass_sel_rs1_enc_1[3] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (r_uop_bypass_sel_rs1_enc_1[2] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (r_uop_bypass_sel_rs1_enc_1[1] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) | (r_uop_bypass_sel_rs1_enc_1[0] & (|r_uop_3_ldst) ? _freelist_io_alloc_pregs_3_bits : 7'h0);
    else if (_GEN) begin
    end
    else
      r_uop_1_prs1 <= _maptable_io_map_resps_1_prs1;
    if (r_uop_bypass_hits_rs2_0_1 | r_uop_bypass_hits_rs2_1_1 | r_uop_bypass_hits_rs2_2_1 | r_uop_bypass_hits_rs2_3_1)
      r_uop_1_prs2 <= (r_uop_bypass_sel_rs2_enc_1[3] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (r_uop_bypass_sel_rs2_enc_1[2] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (r_uop_bypass_sel_rs2_enc_1[1] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) | (r_uop_bypass_sel_rs2_enc_1[0] & (|r_uop_3_ldst) ? _freelist_io_alloc_pregs_3_bits : 7'h0);
    else if (_GEN) begin
    end
    else
      r_uop_1_prs2 <= _maptable_io_map_resps_1_prs2;
    if (r_uop_bypass_hits_dst_0_1 | r_uop_bypass_hits_dst_1_1 | r_uop_bypass_hits_dst_2_1 | r_uop_bypass_hits_dst_3_1)
      r_uop_1_stale_pdst <= (r_uop_bypass_sel_dst_enc_1[3] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (r_uop_bypass_sel_dst_enc_1[2] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (r_uop_bypass_sel_dst_enc_1[1] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) | (r_uop_bypass_sel_dst_enc_1[0] & (|r_uop_3_ldst) ? _freelist_io_alloc_pregs_3_bits : 7'h0);
    else if (_GEN) begin
    end
    else
      r_uop_1_stale_pdst <= _maptable_io_map_resps_1_stale_pdst;
    if (_GEN) begin
    end
    else begin
      r_uop_1_exception <= io_dec_uops_1_exception;
      r_uop_1_exc_cause <= io_dec_uops_1_exc_cause;
      r_uop_1_bypassable <= io_dec_uops_1_bypassable;
      r_uop_1_mem_cmd <= io_dec_uops_1_mem_cmd;
      r_uop_1_mem_size <= io_dec_uops_1_mem_size;
      r_uop_1_mem_signed <= io_dec_uops_1_mem_signed;
      r_uop_1_is_fence <= io_dec_uops_1_is_fence;
      r_uop_1_is_fencei <= io_dec_uops_1_is_fencei;
      r_uop_1_is_amo <= io_dec_uops_1_is_amo;
      r_uop_1_uses_ldq <= io_dec_uops_1_uses_ldq;
      r_uop_1_uses_stq <= io_dec_uops_1_uses_stq;
      r_uop_1_is_sys_pc2epc <= io_dec_uops_1_is_sys_pc2epc;
      r_uop_1_is_unique <= io_dec_uops_1_is_unique;
      r_uop_1_flush_on_commit <= io_dec_uops_1_flush_on_commit;
    end
    r_uop_1_ldst_is_rs1 <= _GEN & r_uop_1_ldst_is_rs1;
    if (_GEN) begin
    end
    else begin
      r_uop_1_ldst <= io_dec_uops_1_ldst;
      r_uop_1_lrs1 <= io_dec_uops_1_lrs1;
      r_uop_1_lrs2 <= io_dec_uops_1_lrs2;
      r_uop_1_lrs3 <= io_dec_uops_1_lrs3;
      r_uop_1_ldst_val <= io_dec_uops_1_ldst_val;
      r_uop_1_dst_rtype <= io_dec_uops_1_dst_rtype;
      r_uop_1_lrs1_rtype <= io_dec_uops_1_lrs1_rtype;
      r_uop_1_lrs2_rtype <= io_dec_uops_1_lrs2_rtype;
      r_uop_1_frs3_en <= io_dec_uops_1_frs3_en;
      r_uop_1_fp_val <= io_dec_uops_1_fp_val;
      r_uop_1_fp_single <= io_dec_uops_1_fp_single;
      r_uop_1_xcpt_pf_if <= io_dec_uops_1_xcpt_pf_if;
      r_uop_1_xcpt_ae_if <= io_dec_uops_1_xcpt_ae_if;
    end
    r_uop_1_xcpt_ma_if <= _GEN & r_uop_1_xcpt_ma_if;
    if (_GEN) begin
    end
    else begin
      r_uop_1_bp_debug_if <= io_dec_uops_1_bp_debug_if;
      r_uop_1_bp_xcpt_if <= io_dec_uops_1_bp_xcpt_if;
      r_uop_1_debug_fsrc <= io_dec_uops_1_debug_fsrc;
      r_uop_1_debug_tsrc <= 2'h0;
      r_uop_2_uopc <= io_dec_uops_2_uopc;
      r_uop_2_inst <= io_dec_uops_2_inst;
      r_uop_2_debug_inst <= io_dec_uops_2_debug_inst;
      r_uop_2_is_rvc <= io_dec_uops_2_is_rvc;
      r_uop_2_debug_pc <= io_dec_uops_2_debug_pc;
      r_uop_2_iq_type <= io_dec_uops_2_iq_type;
      r_uop_2_fu_code <= io_dec_uops_2_fu_code;
      r_uop_2_ctrl_br_type <= 4'h0;
      r_uop_2_ctrl_op1_sel <= 2'h0;
      r_uop_2_ctrl_op2_sel <= 3'h0;
      r_uop_2_ctrl_imm_sel <= 3'h0;
      r_uop_2_ctrl_op_fcn <= 4'h0;
    end
    r_uop_2_ctrl_fcn_dw <= _GEN & r_uop_2_ctrl_fcn_dw;
    if (_GEN) begin
    end
    else
      r_uop_2_ctrl_csr_cmd <= 3'h0;
    r_uop_2_ctrl_is_load <= _GEN & r_uop_2_ctrl_is_load;
    r_uop_2_ctrl_is_sta <= _GEN & r_uop_2_ctrl_is_sta;
    r_uop_2_ctrl_is_std <= _GEN & r_uop_2_ctrl_is_std;
    if (_GEN) begin
    end
    else
      r_uop_2_iw_state <= 2'h0;
    r_uop_2_iw_p1_poisoned <= _GEN & r_uop_2_iw_p1_poisoned;
    r_uop_2_iw_p2_poisoned <= _GEN & r_uop_2_iw_p2_poisoned;
    if (_GEN) begin
    end
    else begin
      r_uop_2_is_br <= io_dec_uops_2_is_br;
      r_uop_2_is_jalr <= io_dec_uops_2_is_jalr;
      r_uop_2_is_jal <= io_dec_uops_2_is_jal;
      r_uop_2_is_sfb <= io_dec_uops_2_is_sfb;
    end
    r_uop_2_br_mask <= (_GEN ? r_uop_2_br_mask : io_dec_uops_2_br_mask) & ~io_brupdate_b1_resolve_mask;
    if (_GEN) begin
    end
    else begin
      r_uop_2_br_tag <= io_dec_uops_2_br_tag;
      r_uop_2_ftq_idx <= io_dec_uops_2_ftq_idx;
      r_uop_2_edge_inst <= io_dec_uops_2_edge_inst;
      r_uop_2_pc_lob <= io_dec_uops_2_pc_lob;
      r_uop_2_taken <= io_dec_uops_2_taken;
      r_uop_2_imm_packed <= io_dec_uops_2_imm_packed;
      r_uop_2_csr_addr <= 12'h0;
      r_uop_2_rxq_idx <= 2'h0;
    end
    if (r_uop_bypass_hits_rs1_0_2 | r_uop_bypass_hits_rs1_1_2 | r_uop_bypass_hits_rs1_2_2 | r_uop_bypass_hits_rs1_3_2)
      r_uop_2_prs1 <= (r_uop_bypass_sel_rs1_enc_2[3] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (r_uop_bypass_sel_rs1_enc_2[2] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (r_uop_bypass_sel_rs1_enc_2[1] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) | (r_uop_bypass_sel_rs1_enc_2[0] & (|r_uop_3_ldst) ? _freelist_io_alloc_pregs_3_bits : 7'h0);
    else if (_GEN) begin
    end
    else
      r_uop_2_prs1 <= _maptable_io_map_resps_2_prs1;
    if (r_uop_bypass_hits_rs2_0_2 | r_uop_bypass_hits_rs2_1_2 | r_uop_bypass_hits_rs2_2_2 | r_uop_bypass_hits_rs2_3_2)
      r_uop_2_prs2 <= (r_uop_bypass_sel_rs2_enc_2[3] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (r_uop_bypass_sel_rs2_enc_2[2] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (r_uop_bypass_sel_rs2_enc_2[1] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) | (r_uop_bypass_sel_rs2_enc_2[0] & (|r_uop_3_ldst) ? _freelist_io_alloc_pregs_3_bits : 7'h0);
    else if (_GEN) begin
    end
    else
      r_uop_2_prs2 <= _maptable_io_map_resps_2_prs2;
    if (r_uop_bypass_hits_dst_0_2 | r_uop_bypass_hits_dst_1_2 | r_uop_bypass_hits_dst_2_2 | r_uop_bypass_hits_dst_3_2)
      r_uop_2_stale_pdst <= (r_uop_bypass_sel_dst_enc_2[3] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (r_uop_bypass_sel_dst_enc_2[2] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (r_uop_bypass_sel_dst_enc_2[1] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) | (r_uop_bypass_sel_dst_enc_2[0] & (|r_uop_3_ldst) ? _freelist_io_alloc_pregs_3_bits : 7'h0);
    else if (_GEN) begin
    end
    else
      r_uop_2_stale_pdst <= _maptable_io_map_resps_2_stale_pdst;
    if (_GEN) begin
    end
    else begin
      r_uop_2_exception <= io_dec_uops_2_exception;
      r_uop_2_exc_cause <= io_dec_uops_2_exc_cause;
      r_uop_2_bypassable <= io_dec_uops_2_bypassable;
      r_uop_2_mem_cmd <= io_dec_uops_2_mem_cmd;
      r_uop_2_mem_size <= io_dec_uops_2_mem_size;
      r_uop_2_mem_signed <= io_dec_uops_2_mem_signed;
      r_uop_2_is_fence <= io_dec_uops_2_is_fence;
      r_uop_2_is_fencei <= io_dec_uops_2_is_fencei;
      r_uop_2_is_amo <= io_dec_uops_2_is_amo;
      r_uop_2_uses_ldq <= io_dec_uops_2_uses_ldq;
      r_uop_2_uses_stq <= io_dec_uops_2_uses_stq;
      r_uop_2_is_sys_pc2epc <= io_dec_uops_2_is_sys_pc2epc;
      r_uop_2_is_unique <= io_dec_uops_2_is_unique;
      r_uop_2_flush_on_commit <= io_dec_uops_2_flush_on_commit;
    end
    r_uop_2_ldst_is_rs1 <= _GEN & r_uop_2_ldst_is_rs1;
    if (_GEN) begin
    end
    else begin
      r_uop_2_ldst <= io_dec_uops_2_ldst;
      r_uop_2_lrs1 <= io_dec_uops_2_lrs1;
      r_uop_2_lrs2 <= io_dec_uops_2_lrs2;
      r_uop_2_lrs3 <= io_dec_uops_2_lrs3;
      r_uop_2_ldst_val <= io_dec_uops_2_ldst_val;
      r_uop_2_dst_rtype <= io_dec_uops_2_dst_rtype;
      r_uop_2_lrs1_rtype <= io_dec_uops_2_lrs1_rtype;
      r_uop_2_lrs2_rtype <= io_dec_uops_2_lrs2_rtype;
      r_uop_2_frs3_en <= io_dec_uops_2_frs3_en;
      r_uop_2_fp_val <= io_dec_uops_2_fp_val;
      r_uop_2_fp_single <= io_dec_uops_2_fp_single;
      r_uop_2_xcpt_pf_if <= io_dec_uops_2_xcpt_pf_if;
      r_uop_2_xcpt_ae_if <= io_dec_uops_2_xcpt_ae_if;
    end
    r_uop_2_xcpt_ma_if <= _GEN & r_uop_2_xcpt_ma_if;
    if (_GEN) begin
    end
    else begin
      r_uop_2_bp_debug_if <= io_dec_uops_2_bp_debug_if;
      r_uop_2_bp_xcpt_if <= io_dec_uops_2_bp_xcpt_if;
      r_uop_2_debug_fsrc <= io_dec_uops_2_debug_fsrc;
      r_uop_2_debug_tsrc <= 2'h0;
      r_uop_3_uopc <= io_dec_uops_3_uopc;
      r_uop_3_inst <= io_dec_uops_3_inst;
      r_uop_3_debug_inst <= io_dec_uops_3_debug_inst;
      r_uop_3_is_rvc <= io_dec_uops_3_is_rvc;
      r_uop_3_debug_pc <= io_dec_uops_3_debug_pc;
      r_uop_3_iq_type <= io_dec_uops_3_iq_type;
      r_uop_3_fu_code <= io_dec_uops_3_fu_code;
      r_uop_3_ctrl_br_type <= 4'h0;
      r_uop_3_ctrl_op1_sel <= 2'h0;
      r_uop_3_ctrl_op2_sel <= 3'h0;
      r_uop_3_ctrl_imm_sel <= 3'h0;
      r_uop_3_ctrl_op_fcn <= 4'h0;
    end
    r_uop_3_ctrl_fcn_dw <= _GEN & r_uop_3_ctrl_fcn_dw;
    if (_GEN) begin
    end
    else
      r_uop_3_ctrl_csr_cmd <= 3'h0;
    r_uop_3_ctrl_is_load <= _GEN & r_uop_3_ctrl_is_load;
    r_uop_3_ctrl_is_sta <= _GEN & r_uop_3_ctrl_is_sta;
    r_uop_3_ctrl_is_std <= _GEN & r_uop_3_ctrl_is_std;
    if (_GEN) begin
    end
    else
      r_uop_3_iw_state <= 2'h0;
    r_uop_3_iw_p1_poisoned <= _GEN & r_uop_3_iw_p1_poisoned;
    r_uop_3_iw_p2_poisoned <= _GEN & r_uop_3_iw_p2_poisoned;
    if (_GEN) begin
    end
    else begin
      r_uop_3_is_br <= io_dec_uops_3_is_br;
      r_uop_3_is_jalr <= io_dec_uops_3_is_jalr;
      r_uop_3_is_jal <= io_dec_uops_3_is_jal;
      r_uop_3_is_sfb <= io_dec_uops_3_is_sfb;
    end
    r_uop_3_br_mask <= (_GEN ? r_uop_3_br_mask : io_dec_uops_3_br_mask) & ~io_brupdate_b1_resolve_mask;
    if (_GEN) begin
    end
    else begin
      r_uop_3_br_tag <= io_dec_uops_3_br_tag;
      r_uop_3_ftq_idx <= io_dec_uops_3_ftq_idx;
      r_uop_3_edge_inst <= io_dec_uops_3_edge_inst;
      r_uop_3_pc_lob <= io_dec_uops_3_pc_lob;
      r_uop_3_taken <= io_dec_uops_3_taken;
      r_uop_3_imm_packed <= io_dec_uops_3_imm_packed;
      r_uop_3_csr_addr <= 12'h0;
      r_uop_3_rxq_idx <= 2'h0;
    end
    if (r_uop_bypass_hits_rs1_0_3 | r_uop_bypass_hits_rs1_1_3 | r_uop_bypass_hits_rs1_2_3 | r_uop_bypass_hits_rs1_3_3)
      r_uop_3_prs1 <= (r_uop_bypass_sel_rs1_enc_3[3] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (r_uop_bypass_sel_rs1_enc_3[2] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (r_uop_bypass_sel_rs1_enc_3[1] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) | (r_uop_bypass_sel_rs1_enc_3[0] & (|r_uop_3_ldst) ? _freelist_io_alloc_pregs_3_bits : 7'h0);
    else if (_GEN) begin
    end
    else
      r_uop_3_prs1 <= _maptable_io_map_resps_3_prs1;
    if (r_uop_bypass_hits_rs2_0_3 | r_uop_bypass_hits_rs2_1_3 | r_uop_bypass_hits_rs2_2_3 | r_uop_bypass_hits_rs2_3_3)
      r_uop_3_prs2 <= (r_uop_bypass_sel_rs2_enc_3[3] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (r_uop_bypass_sel_rs2_enc_3[2] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (r_uop_bypass_sel_rs2_enc_3[1] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) | (r_uop_bypass_sel_rs2_enc_3[0] & (|r_uop_3_ldst) ? _freelist_io_alloc_pregs_3_bits : 7'h0);
    else if (_GEN) begin
    end
    else
      r_uop_3_prs2 <= _maptable_io_map_resps_3_prs2;
    if (r_uop_bypass_hits_dst_0_3 | r_uop_bypass_hits_dst_1_3 | r_uop_bypass_hits_dst_2_3 | r_uop_bypass_hits_dst_3_3)
      r_uop_3_stale_pdst <= (r_uop_bypass_sel_dst_enc_3[3] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (r_uop_bypass_sel_dst_enc_3[2] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (r_uop_bypass_sel_dst_enc_3[1] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) | (r_uop_bypass_sel_dst_enc_3[0] & (|r_uop_3_ldst) ? _freelist_io_alloc_pregs_3_bits : 7'h0);
    else if (_GEN) begin
    end
    else
      r_uop_3_stale_pdst <= _maptable_io_map_resps_3_stale_pdst;
    if (_GEN) begin
    end
    else begin
      r_uop_3_exception <= io_dec_uops_3_exception;
      r_uop_3_exc_cause <= io_dec_uops_3_exc_cause;
      r_uop_3_bypassable <= io_dec_uops_3_bypassable;
      r_uop_3_mem_cmd <= io_dec_uops_3_mem_cmd;
      r_uop_3_mem_size <= io_dec_uops_3_mem_size;
      r_uop_3_mem_signed <= io_dec_uops_3_mem_signed;
      r_uop_3_is_fence <= io_dec_uops_3_is_fence;
      r_uop_3_is_fencei <= io_dec_uops_3_is_fencei;
      r_uop_3_is_amo <= io_dec_uops_3_is_amo;
      r_uop_3_uses_ldq <= io_dec_uops_3_uses_ldq;
      r_uop_3_uses_stq <= io_dec_uops_3_uses_stq;
      r_uop_3_is_sys_pc2epc <= io_dec_uops_3_is_sys_pc2epc;
      r_uop_3_is_unique <= io_dec_uops_3_is_unique;
      r_uop_3_flush_on_commit <= io_dec_uops_3_flush_on_commit;
    end
    r_uop_3_ldst_is_rs1 <= _GEN & r_uop_3_ldst_is_rs1;
    if (_GEN) begin
    end
    else begin
      r_uop_3_ldst <= io_dec_uops_3_ldst;
      r_uop_3_lrs1 <= io_dec_uops_3_lrs1;
      r_uop_3_lrs2 <= io_dec_uops_3_lrs2;
      r_uop_3_lrs3 <= io_dec_uops_3_lrs3;
      r_uop_3_ldst_val <= io_dec_uops_3_ldst_val;
      r_uop_3_dst_rtype <= io_dec_uops_3_dst_rtype;
      r_uop_3_lrs1_rtype <= io_dec_uops_3_lrs1_rtype;
      r_uop_3_lrs2_rtype <= io_dec_uops_3_lrs2_rtype;
      r_uop_3_frs3_en <= io_dec_uops_3_frs3_en;
      r_uop_3_fp_val <= io_dec_uops_3_fp_val;
      r_uop_3_fp_single <= io_dec_uops_3_fp_single;
      r_uop_3_xcpt_pf_if <= io_dec_uops_3_xcpt_pf_if;
      r_uop_3_xcpt_ae_if <= io_dec_uops_3_xcpt_ae_if;
    end
    r_uop_3_xcpt_ma_if <= _GEN & r_uop_3_xcpt_ma_if;
    if (_GEN) begin
    end
    else begin
      r_uop_3_bp_debug_if <= io_dec_uops_3_bp_debug_if;
      r_uop_3_bp_xcpt_if <= io_dec_uops_3_bp_xcpt_if;
      r_uop_3_debug_fsrc <= io_dec_uops_3_debug_fsrc;
      r_uop_3_debug_tsrc <= 2'h0;
    end
  end // always @(posedge)
  RenameMapTable maptable (
    .clock                     (clock),
    .reset                     (reset),
    .io_map_reqs_0_lrs1        (io_dec_uops_0_lrs1),
    .io_map_reqs_0_lrs2        (io_dec_uops_0_lrs2),
    .io_map_reqs_0_ldst        (io_dec_uops_0_ldst),
    .io_map_reqs_1_lrs1        (io_dec_uops_1_lrs1),
    .io_map_reqs_1_lrs2        (io_dec_uops_1_lrs2),
    .io_map_reqs_1_ldst        (io_dec_uops_1_ldst),
    .io_map_reqs_2_lrs1        (io_dec_uops_2_lrs1),
    .io_map_reqs_2_lrs2        (io_dec_uops_2_lrs2),
    .io_map_reqs_2_ldst        (io_dec_uops_2_ldst),
    .io_map_reqs_3_lrs1        (io_dec_uops_3_lrs1),
    .io_map_reqs_3_lrs2        (io_dec_uops_3_lrs2),
    .io_map_reqs_3_ldst        (io_dec_uops_3_ldst),
    .io_map_resps_0_prs1       (_maptable_io_map_resps_0_prs1),
    .io_map_resps_0_prs2       (_maptable_io_map_resps_0_prs2),
    .io_map_resps_0_stale_pdst (_maptable_io_map_resps_0_stale_pdst),
    .io_map_resps_1_prs1       (_maptable_io_map_resps_1_prs1),
    .io_map_resps_1_prs2       (_maptable_io_map_resps_1_prs2),
    .io_map_resps_1_stale_pdst (_maptable_io_map_resps_1_stale_pdst),
    .io_map_resps_2_prs1       (_maptable_io_map_resps_2_prs1),
    .io_map_resps_2_prs2       (_maptable_io_map_resps_2_prs2),
    .io_map_resps_2_stale_pdst (_maptable_io_map_resps_2_stale_pdst),
    .io_map_resps_3_prs1       (_maptable_io_map_resps_3_prs1),
    .io_map_resps_3_prs2       (_maptable_io_map_resps_3_prs2),
    .io_map_resps_3_stale_pdst (_maptable_io_map_resps_3_stale_pdst),
    .io_remap_reqs_0_ldst      (io_rollback ? io_com_uops_3_ldst : r_uop_ldst),
    .io_remap_reqs_0_pdst      (io_rollback ? io_com_uops_3_stale_pdst : io_ren2_uops_0_newuop_pdst),
    .io_remap_reqs_0_valid     (ren2_alloc_reqs_0 | rbk_valids_3),
    .io_remap_reqs_1_ldst      (io_rollback ? io_com_uops_2_ldst : r_uop_1_ldst),
    .io_remap_reqs_1_pdst      (io_rollback ? io_com_uops_2_stale_pdst : io_ren2_uops_1_newuop_pdst),
    .io_remap_reqs_1_valid     (ren2_alloc_reqs_1 | rbk_valids_2),
    .io_remap_reqs_2_ldst      (io_rollback ? io_com_uops_1_ldst : r_uop_2_ldst),
    .io_remap_reqs_2_pdst      (io_rollback ? io_com_uops_1_stale_pdst : io_ren2_uops_2_newuop_pdst),
    .io_remap_reqs_2_valid     (ren2_alloc_reqs_2 | rbk_valids_1),
    .io_remap_reqs_3_ldst      (io_rollback ? io_com_uops_0_ldst : r_uop_3_ldst),
    .io_remap_reqs_3_pdst      (io_rollback ? io_com_uops_0_stale_pdst : io_ren2_uops_3_newuop_pdst),
    .io_remap_reqs_3_valid     (ren2_alloc_reqs_3 | rbk_valids_0),
    .io_ren_br_tags_0_valid    (ren2_br_tags_0_valid),
    .io_ren_br_tags_0_bits     (r_uop_br_tag),
    .io_ren_br_tags_1_valid    (ren2_br_tags_1_valid),
    .io_ren_br_tags_1_bits     (r_uop_1_br_tag),
    .io_ren_br_tags_2_valid    (ren2_br_tags_2_valid),
    .io_ren_br_tags_2_bits     (r_uop_2_br_tag),
    .io_ren_br_tags_3_valid    (ren2_br_tags_3_valid),
    .io_ren_br_tags_3_bits     (r_uop_3_br_tag),
    .io_brupdate_b2_uop_br_tag (io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_mispredict (io_brupdate_b2_mispredict),
    .io_rollback               (io_rollback)
  );
  RenameFreeList freelist (
    .clock                     (clock),
    .reset                     (reset),
    .io_reqs_0                 (ren2_alloc_reqs_0),
    .io_reqs_1                 (ren2_alloc_reqs_1),
    .io_reqs_2                 (ren2_alloc_reqs_2),
    .io_reqs_3                 (ren2_alloc_reqs_3),
    .io_alloc_pregs_0_valid    (_freelist_io_alloc_pregs_0_valid),
    .io_alloc_pregs_0_bits     (_freelist_io_alloc_pregs_0_bits),
    .io_alloc_pregs_1_valid    (_freelist_io_alloc_pregs_1_valid),
    .io_alloc_pregs_1_bits     (_freelist_io_alloc_pregs_1_bits),
    .io_alloc_pregs_2_valid    (_freelist_io_alloc_pregs_2_valid),
    .io_alloc_pregs_2_bits     (_freelist_io_alloc_pregs_2_bits),
    .io_alloc_pregs_3_valid    (_freelist_io_alloc_pregs_3_valid),
    .io_alloc_pregs_3_bits     (_freelist_io_alloc_pregs_3_bits),
    .io_dealloc_pregs_0_valid  (io_com_uops_0_ldst_val & _rbk_valids_0_T & io_com_valids_0 | rbk_valids_0),
    .io_dealloc_pregs_0_bits   (io_rollback ? io_com_uops_0_pdst : io_com_uops_0_stale_pdst),
    .io_dealloc_pregs_1_valid  (io_com_uops_1_ldst_val & _rbk_valids_1_T & io_com_valids_1 | rbk_valids_1),
    .io_dealloc_pregs_1_bits   (io_rollback ? io_com_uops_1_pdst : io_com_uops_1_stale_pdst),
    .io_dealloc_pregs_2_valid  (io_com_uops_2_ldst_val & _rbk_valids_2_T & io_com_valids_2 | rbk_valids_2),
    .io_dealloc_pregs_2_bits   (io_rollback ? io_com_uops_2_pdst : io_com_uops_2_stale_pdst),
    .io_dealloc_pregs_3_valid  (io_com_uops_3_ldst_val & _rbk_valids_3_T & io_com_valids_3 | rbk_valids_3),
    .io_dealloc_pregs_3_bits   (io_rollback ? io_com_uops_3_pdst : io_com_uops_3_stale_pdst),
    .io_ren_br_tags_0_valid    (ren2_br_tags_0_valid),
    .io_ren_br_tags_0_bits     (r_uop_br_tag),
    .io_ren_br_tags_1_valid    (ren2_br_tags_1_valid),
    .io_ren_br_tags_1_bits     (r_uop_1_br_tag),
    .io_ren_br_tags_2_valid    (ren2_br_tags_2_valid),
    .io_ren_br_tags_2_bits     (r_uop_2_br_tag),
    .io_ren_br_tags_3_valid    (ren2_br_tags_3_valid),
    .io_ren_br_tags_3_bits     (r_uop_3_br_tag),
    .io_brupdate_b2_uop_br_tag (io_brupdate_b2_uop_br_tag),
    .io_brupdate_b2_mispredict (io_brupdate_b2_mispredict),
    .io_debug_pipeline_empty   (io_debug_rob_empty)
  );
  RenameBusyTable busytable (
    .clock                     (clock),
    .reset                     (reset),
    .io_ren_uops_0_pdst        (io_ren2_uops_0_newuop_pdst),
    .io_ren_uops_0_prs1        (r_uop_prs1),
    .io_ren_uops_0_prs2        (r_uop_prs2),
    .io_ren_uops_1_pdst        (io_ren2_uops_1_newuop_pdst),
    .io_ren_uops_1_prs1        (r_uop_1_prs1),
    .io_ren_uops_1_prs2        (r_uop_1_prs2),
    .io_ren_uops_2_pdst        (io_ren2_uops_2_newuop_pdst),
    .io_ren_uops_2_prs1        (r_uop_2_prs1),
    .io_ren_uops_2_prs2        (r_uop_2_prs2),
    .io_ren_uops_3_pdst        (io_ren2_uops_3_newuop_pdst),
    .io_ren_uops_3_prs1        (r_uop_3_prs1),
    .io_ren_uops_3_prs2        (r_uop_3_prs2),
    .io_busy_resps_0_prs1_busy (_busytable_io_busy_resps_0_prs1_busy),
    .io_busy_resps_0_prs2_busy (_busytable_io_busy_resps_0_prs2_busy),
    .io_busy_resps_1_prs1_busy (_busytable_io_busy_resps_1_prs1_busy),
    .io_busy_resps_1_prs2_busy (_busytable_io_busy_resps_1_prs2_busy),
    .io_busy_resps_2_prs1_busy (_busytable_io_busy_resps_2_prs1_busy),
    .io_busy_resps_2_prs2_busy (_busytable_io_busy_resps_2_prs2_busy),
    .io_busy_resps_3_prs1_busy (_busytable_io_busy_resps_3_prs1_busy),
    .io_busy_resps_3_prs2_busy (_busytable_io_busy_resps_3_prs2_busy),
    .io_rebusy_reqs_0          (ren2_alloc_reqs_0),
    .io_rebusy_reqs_1          (ren2_alloc_reqs_1),
    .io_rebusy_reqs_2          (ren2_alloc_reqs_2),
    .io_rebusy_reqs_3          (ren2_alloc_reqs_3),
    .io_wb_pdsts_0             (io_wakeups_0_bits_uop_pdst),
    .io_wb_pdsts_1             (io_wakeups_1_bits_uop_pdst),
    .io_wb_pdsts_2             (io_wakeups_2_bits_uop_pdst),
    .io_wb_pdsts_3             (io_wakeups_3_bits_uop_pdst),
    .io_wb_pdsts_4             (io_wakeups_4_bits_uop_pdst),
    .io_wb_pdsts_5             (io_wakeups_5_bits_uop_pdst),
    .io_wb_pdsts_6             (io_wakeups_6_bits_uop_pdst),
    .io_wb_pdsts_7             (io_wakeups_7_bits_uop_pdst),
    .io_wb_pdsts_8             (io_wakeups_8_bits_uop_pdst),
    .io_wb_pdsts_9             (io_wakeups_9_bits_uop_pdst),
    .io_wb_valids_0            (io_wakeups_0_valid),
    .io_wb_valids_1            (io_wakeups_1_valid),
    .io_wb_valids_2            (io_wakeups_2_valid),
    .io_wb_valids_3            (io_wakeups_3_valid),
    .io_wb_valids_4            (io_wakeups_4_valid),
    .io_wb_valids_5            (io_wakeups_5_valid),
    .io_wb_valids_6            (io_wakeups_6_valid),
    .io_wb_valids_7            (io_wakeups_7_valid),
    .io_wb_valids_8            (io_wakeups_8_valid),
    .io_wb_valids_9            (io_wakeups_9_valid)
  );
  assign io_ren_stalls_0 = _io_ren_stalls_0_T & ~_freelist_io_alloc_pregs_0_valid;
  assign io_ren_stalls_1 = _io_ren_stalls_1_T & ~_freelist_io_alloc_pregs_1_valid;
  assign io_ren_stalls_2 = _io_ren_stalls_2_T & ~_freelist_io_alloc_pregs_2_valid;
  assign io_ren_stalls_3 = _io_ren_stalls_3_T & ~_freelist_io_alloc_pregs_3_valid;
  assign io_ren2_mask_0 = r_valid;
  assign io_ren2_mask_1 = r_valid_1;
  assign io_ren2_mask_2 = r_valid_2;
  assign io_ren2_mask_3 = r_valid_3;
  assign io_ren2_uops_0_uopc = r_uop_uopc;
  assign io_ren2_uops_0_inst = r_uop_inst;
  assign io_ren2_uops_0_debug_inst = r_uop_debug_inst;
  assign io_ren2_uops_0_is_rvc = r_uop_is_rvc;
  assign io_ren2_uops_0_debug_pc = r_uop_debug_pc;
  assign io_ren2_uops_0_iq_type = r_uop_iq_type;
  assign io_ren2_uops_0_fu_code = r_uop_fu_code;
  assign io_ren2_uops_0_ctrl_br_type = r_uop_ctrl_br_type;
  assign io_ren2_uops_0_ctrl_op1_sel = r_uop_ctrl_op1_sel;
  assign io_ren2_uops_0_ctrl_op2_sel = r_uop_ctrl_op2_sel;
  assign io_ren2_uops_0_ctrl_imm_sel = r_uop_ctrl_imm_sel;
  assign io_ren2_uops_0_ctrl_op_fcn = r_uop_ctrl_op_fcn;
  assign io_ren2_uops_0_ctrl_fcn_dw = r_uop_ctrl_fcn_dw;
  assign io_ren2_uops_0_ctrl_csr_cmd = r_uop_ctrl_csr_cmd;
  assign io_ren2_uops_0_ctrl_is_load = r_uop_ctrl_is_load;
  assign io_ren2_uops_0_ctrl_is_sta = r_uop_ctrl_is_sta;
  assign io_ren2_uops_0_ctrl_is_std = r_uop_ctrl_is_std;
  assign io_ren2_uops_0_iw_state = r_uop_iw_state;
  assign io_ren2_uops_0_iw_p1_poisoned = r_uop_iw_p1_poisoned;
  assign io_ren2_uops_0_iw_p2_poisoned = r_uop_iw_p2_poisoned;
  assign io_ren2_uops_0_is_br = r_uop_is_br;
  assign io_ren2_uops_0_is_jalr = r_uop_is_jalr;
  assign io_ren2_uops_0_is_jal = r_uop_is_jal;
  assign io_ren2_uops_0_is_sfb = r_uop_is_sfb;
  assign io_ren2_uops_0_br_mask = r_uop_br_mask & ~io_brupdate_b1_resolve_mask;
  assign io_ren2_uops_0_br_tag = r_uop_br_tag;
  assign io_ren2_uops_0_ftq_idx = r_uop_ftq_idx;
  assign io_ren2_uops_0_edge_inst = r_uop_edge_inst;
  assign io_ren2_uops_0_pc_lob = r_uop_pc_lob;
  assign io_ren2_uops_0_taken = r_uop_taken;
  assign io_ren2_uops_0_imm_packed = r_uop_imm_packed;
  assign io_ren2_uops_0_csr_addr = r_uop_csr_addr;
  assign io_ren2_uops_0_rxq_idx = r_uop_rxq_idx;
  assign io_ren2_uops_0_pdst = io_ren2_uops_0_newuop_pdst;
  assign io_ren2_uops_0_prs1 = r_uop_prs1;
  assign io_ren2_uops_0_prs2 = r_uop_prs2;
  assign io_ren2_uops_0_prs1_busy = r_uop_lrs1_rtype == 2'h0 & _busytable_io_busy_resps_0_prs1_busy;
  assign io_ren2_uops_0_prs2_busy = r_uop_lrs2_rtype == 2'h0 & _busytable_io_busy_resps_0_prs2_busy;
  assign io_ren2_uops_0_stale_pdst = r_uop_stale_pdst;
  assign io_ren2_uops_0_exception = r_uop_exception;
  assign io_ren2_uops_0_exc_cause = r_uop_exc_cause;
  assign io_ren2_uops_0_bypassable = r_uop_bypassable;
  assign io_ren2_uops_0_mem_cmd = r_uop_mem_cmd;
  assign io_ren2_uops_0_mem_size = r_uop_mem_size;
  assign io_ren2_uops_0_mem_signed = r_uop_mem_signed;
  assign io_ren2_uops_0_is_fence = r_uop_is_fence;
  assign io_ren2_uops_0_is_fencei = r_uop_is_fencei;
  assign io_ren2_uops_0_is_amo = r_uop_is_amo;
  assign io_ren2_uops_0_uses_ldq = r_uop_uses_ldq;
  assign io_ren2_uops_0_uses_stq = r_uop_uses_stq;
  assign io_ren2_uops_0_is_sys_pc2epc = r_uop_is_sys_pc2epc;
  assign io_ren2_uops_0_is_unique = r_uop_is_unique;
  assign io_ren2_uops_0_flush_on_commit = r_uop_flush_on_commit;
  assign io_ren2_uops_0_ldst_is_rs1 = r_uop_ldst_is_rs1;
  assign io_ren2_uops_0_ldst = r_uop_ldst;
  assign io_ren2_uops_0_lrs1 = r_uop_lrs1;
  assign io_ren2_uops_0_lrs2 = r_uop_lrs2;
  assign io_ren2_uops_0_lrs3 = r_uop_lrs3;
  assign io_ren2_uops_0_ldst_val = r_uop_ldst_val;
  assign io_ren2_uops_0_dst_rtype = r_uop_dst_rtype;
  assign io_ren2_uops_0_lrs1_rtype = r_uop_lrs1_rtype;
  assign io_ren2_uops_0_lrs2_rtype = r_uop_lrs2_rtype;
  assign io_ren2_uops_0_frs3_en = r_uop_frs3_en;
  assign io_ren2_uops_0_fp_val = r_uop_fp_val;
  assign io_ren2_uops_0_fp_single = r_uop_fp_single;
  assign io_ren2_uops_0_xcpt_pf_if = r_uop_xcpt_pf_if;
  assign io_ren2_uops_0_xcpt_ae_if = r_uop_xcpt_ae_if;
  assign io_ren2_uops_0_xcpt_ma_if = r_uop_xcpt_ma_if;
  assign io_ren2_uops_0_bp_debug_if = r_uop_bp_debug_if;
  assign io_ren2_uops_0_bp_xcpt_if = r_uop_bp_xcpt_if;
  assign io_ren2_uops_0_debug_fsrc = r_uop_debug_fsrc;
  assign io_ren2_uops_0_debug_tsrc = r_uop_debug_tsrc;
  assign io_ren2_uops_1_uopc = r_uop_1_uopc;
  assign io_ren2_uops_1_inst = r_uop_1_inst;
  assign io_ren2_uops_1_debug_inst = r_uop_1_debug_inst;
  assign io_ren2_uops_1_is_rvc = r_uop_1_is_rvc;
  assign io_ren2_uops_1_debug_pc = r_uop_1_debug_pc;
  assign io_ren2_uops_1_iq_type = r_uop_1_iq_type;
  assign io_ren2_uops_1_fu_code = r_uop_1_fu_code;
  assign io_ren2_uops_1_ctrl_br_type = r_uop_1_ctrl_br_type;
  assign io_ren2_uops_1_ctrl_op1_sel = r_uop_1_ctrl_op1_sel;
  assign io_ren2_uops_1_ctrl_op2_sel = r_uop_1_ctrl_op2_sel;
  assign io_ren2_uops_1_ctrl_imm_sel = r_uop_1_ctrl_imm_sel;
  assign io_ren2_uops_1_ctrl_op_fcn = r_uop_1_ctrl_op_fcn;
  assign io_ren2_uops_1_ctrl_fcn_dw = r_uop_1_ctrl_fcn_dw;
  assign io_ren2_uops_1_ctrl_csr_cmd = r_uop_1_ctrl_csr_cmd;
  assign io_ren2_uops_1_ctrl_is_load = r_uop_1_ctrl_is_load;
  assign io_ren2_uops_1_ctrl_is_sta = r_uop_1_ctrl_is_sta;
  assign io_ren2_uops_1_ctrl_is_std = r_uop_1_ctrl_is_std;
  assign io_ren2_uops_1_iw_state = r_uop_1_iw_state;
  assign io_ren2_uops_1_iw_p1_poisoned = r_uop_1_iw_p1_poisoned;
  assign io_ren2_uops_1_iw_p2_poisoned = r_uop_1_iw_p2_poisoned;
  assign io_ren2_uops_1_is_br = r_uop_1_is_br;
  assign io_ren2_uops_1_is_jalr = r_uop_1_is_jalr;
  assign io_ren2_uops_1_is_jal = r_uop_1_is_jal;
  assign io_ren2_uops_1_is_sfb = r_uop_1_is_sfb;
  assign io_ren2_uops_1_br_mask = r_uop_1_br_mask & ~io_brupdate_b1_resolve_mask;
  assign io_ren2_uops_1_br_tag = r_uop_1_br_tag;
  assign io_ren2_uops_1_ftq_idx = r_uop_1_ftq_idx;
  assign io_ren2_uops_1_edge_inst = r_uop_1_edge_inst;
  assign io_ren2_uops_1_pc_lob = r_uop_1_pc_lob;
  assign io_ren2_uops_1_taken = r_uop_1_taken;
  assign io_ren2_uops_1_imm_packed = r_uop_1_imm_packed;
  assign io_ren2_uops_1_csr_addr = r_uop_1_csr_addr;
  assign io_ren2_uops_1_rxq_idx = r_uop_1_rxq_idx;
  assign io_ren2_uops_1_pdst = io_ren2_uops_1_newuop_pdst;
  assign io_ren2_uops_1_prs1 = bypassed_uop_bypass_sel_rs1_0 ? io_ren2_uops_0_newuop_pdst : r_uop_1_prs1;
  assign io_ren2_uops_1_prs2 = bypassed_uop_bypass_sel_rs2_0 ? io_ren2_uops_0_newuop_pdst : r_uop_1_prs2;
  assign io_ren2_uops_1_prs1_busy = r_uop_1_lrs1_rtype == 2'h0 & _busytable_io_busy_resps_1_prs1_busy | bypassed_uop_bypass_sel_rs1_0;
  assign io_ren2_uops_1_prs2_busy = r_uop_1_lrs2_rtype == 2'h0 & _busytable_io_busy_resps_1_prs2_busy | bypassed_uop_bypass_sel_rs2_0;
  assign io_ren2_uops_1_stale_pdst = ren2_alloc_reqs_0 & r_uop_ldst == r_uop_1_ldst ? io_ren2_uops_0_newuop_pdst : r_uop_1_stale_pdst;
  assign io_ren2_uops_1_exception = r_uop_1_exception;
  assign io_ren2_uops_1_exc_cause = r_uop_1_exc_cause;
  assign io_ren2_uops_1_bypassable = r_uop_1_bypassable;
  assign io_ren2_uops_1_mem_cmd = r_uop_1_mem_cmd;
  assign io_ren2_uops_1_mem_size = r_uop_1_mem_size;
  assign io_ren2_uops_1_mem_signed = r_uop_1_mem_signed;
  assign io_ren2_uops_1_is_fence = r_uop_1_is_fence;
  assign io_ren2_uops_1_is_fencei = r_uop_1_is_fencei;
  assign io_ren2_uops_1_is_amo = r_uop_1_is_amo;
  assign io_ren2_uops_1_uses_ldq = r_uop_1_uses_ldq;
  assign io_ren2_uops_1_uses_stq = r_uop_1_uses_stq;
  assign io_ren2_uops_1_is_sys_pc2epc = r_uop_1_is_sys_pc2epc;
  assign io_ren2_uops_1_is_unique = r_uop_1_is_unique;
  assign io_ren2_uops_1_flush_on_commit = r_uop_1_flush_on_commit;
  assign io_ren2_uops_1_ldst_is_rs1 = r_uop_1_ldst_is_rs1;
  assign io_ren2_uops_1_ldst = r_uop_1_ldst;
  assign io_ren2_uops_1_lrs1 = r_uop_1_lrs1;
  assign io_ren2_uops_1_lrs2 = r_uop_1_lrs2;
  assign io_ren2_uops_1_lrs3 = r_uop_1_lrs3;
  assign io_ren2_uops_1_ldst_val = r_uop_1_ldst_val;
  assign io_ren2_uops_1_dst_rtype = r_uop_1_dst_rtype;
  assign io_ren2_uops_1_lrs1_rtype = r_uop_1_lrs1_rtype;
  assign io_ren2_uops_1_lrs2_rtype = r_uop_1_lrs2_rtype;
  assign io_ren2_uops_1_frs3_en = r_uop_1_frs3_en;
  assign io_ren2_uops_1_fp_val = r_uop_1_fp_val;
  assign io_ren2_uops_1_fp_single = r_uop_1_fp_single;
  assign io_ren2_uops_1_xcpt_pf_if = r_uop_1_xcpt_pf_if;
  assign io_ren2_uops_1_xcpt_ae_if = r_uop_1_xcpt_ae_if;
  assign io_ren2_uops_1_xcpt_ma_if = r_uop_1_xcpt_ma_if;
  assign io_ren2_uops_1_bp_debug_if = r_uop_1_bp_debug_if;
  assign io_ren2_uops_1_bp_xcpt_if = r_uop_1_bp_xcpt_if;
  assign io_ren2_uops_1_debug_fsrc = r_uop_1_debug_fsrc;
  assign io_ren2_uops_1_debug_tsrc = r_uop_1_debug_tsrc;
  assign io_ren2_uops_2_uopc = r_uop_2_uopc;
  assign io_ren2_uops_2_inst = r_uop_2_inst;
  assign io_ren2_uops_2_debug_inst = r_uop_2_debug_inst;
  assign io_ren2_uops_2_is_rvc = r_uop_2_is_rvc;
  assign io_ren2_uops_2_debug_pc = r_uop_2_debug_pc;
  assign io_ren2_uops_2_iq_type = r_uop_2_iq_type;
  assign io_ren2_uops_2_fu_code = r_uop_2_fu_code;
  assign io_ren2_uops_2_ctrl_br_type = r_uop_2_ctrl_br_type;
  assign io_ren2_uops_2_ctrl_op1_sel = r_uop_2_ctrl_op1_sel;
  assign io_ren2_uops_2_ctrl_op2_sel = r_uop_2_ctrl_op2_sel;
  assign io_ren2_uops_2_ctrl_imm_sel = r_uop_2_ctrl_imm_sel;
  assign io_ren2_uops_2_ctrl_op_fcn = r_uop_2_ctrl_op_fcn;
  assign io_ren2_uops_2_ctrl_fcn_dw = r_uop_2_ctrl_fcn_dw;
  assign io_ren2_uops_2_ctrl_csr_cmd = r_uop_2_ctrl_csr_cmd;
  assign io_ren2_uops_2_ctrl_is_load = r_uop_2_ctrl_is_load;
  assign io_ren2_uops_2_ctrl_is_sta = r_uop_2_ctrl_is_sta;
  assign io_ren2_uops_2_ctrl_is_std = r_uop_2_ctrl_is_std;
  assign io_ren2_uops_2_iw_state = r_uop_2_iw_state;
  assign io_ren2_uops_2_iw_p1_poisoned = r_uop_2_iw_p1_poisoned;
  assign io_ren2_uops_2_iw_p2_poisoned = r_uop_2_iw_p2_poisoned;
  assign io_ren2_uops_2_is_br = r_uop_2_is_br;
  assign io_ren2_uops_2_is_jalr = r_uop_2_is_jalr;
  assign io_ren2_uops_2_is_jal = r_uop_2_is_jal;
  assign io_ren2_uops_2_is_sfb = r_uop_2_is_sfb;
  assign io_ren2_uops_2_br_mask = r_uop_2_br_mask & ~io_brupdate_b1_resolve_mask;
  assign io_ren2_uops_2_br_tag = r_uop_2_br_tag;
  assign io_ren2_uops_2_ftq_idx = r_uop_2_ftq_idx;
  assign io_ren2_uops_2_edge_inst = r_uop_2_edge_inst;
  assign io_ren2_uops_2_pc_lob = r_uop_2_pc_lob;
  assign io_ren2_uops_2_taken = r_uop_2_taken;
  assign io_ren2_uops_2_imm_packed = r_uop_2_imm_packed;
  assign io_ren2_uops_2_csr_addr = r_uop_2_csr_addr;
  assign io_ren2_uops_2_rxq_idx = r_uop_2_rxq_idx;
  assign io_ren2_uops_2_pdst = io_ren2_uops_2_newuop_pdst;
  assign io_ren2_uops_2_prs1 = bypassed_uop_do_bypass_rs1 ? (bypassed_uop_bypass_sel_rs1_enc_1[1] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (bypassed_uop_bypass_sel_rs1_enc_1[0] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) : r_uop_2_prs1;
  assign io_ren2_uops_2_prs2 = bypassed_uop_do_bypass_rs2 ? (bypassed_uop_bypass_sel_rs2_enc_1[1] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (bypassed_uop_bypass_sel_rs2_enc_1[0] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) : r_uop_2_prs2;
  assign io_ren2_uops_2_prs1_busy = r_uop_2_lrs1_rtype == 2'h0 & _busytable_io_busy_resps_2_prs1_busy | bypassed_uop_do_bypass_rs1;
  assign io_ren2_uops_2_prs2_busy = r_uop_2_lrs2_rtype == 2'h0 & _busytable_io_busy_resps_2_prs2_busy | bypassed_uop_do_bypass_rs2;
  assign io_ren2_uops_2_stale_pdst = bypassed_uop_bypass_hits_dst_0_1 | bypassed_uop_bypass_hits_dst_1 ? (bypassed_uop_bypass_sel_dst_enc_1[1] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (bypassed_uop_bypass_sel_dst_enc_1[0] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) : r_uop_2_stale_pdst;
  assign io_ren2_uops_2_exception = r_uop_2_exception;
  assign io_ren2_uops_2_exc_cause = r_uop_2_exc_cause;
  assign io_ren2_uops_2_bypassable = r_uop_2_bypassable;
  assign io_ren2_uops_2_mem_cmd = r_uop_2_mem_cmd;
  assign io_ren2_uops_2_mem_size = r_uop_2_mem_size;
  assign io_ren2_uops_2_mem_signed = r_uop_2_mem_signed;
  assign io_ren2_uops_2_is_fence = r_uop_2_is_fence;
  assign io_ren2_uops_2_is_fencei = r_uop_2_is_fencei;
  assign io_ren2_uops_2_is_amo = r_uop_2_is_amo;
  assign io_ren2_uops_2_uses_ldq = r_uop_2_uses_ldq;
  assign io_ren2_uops_2_uses_stq = r_uop_2_uses_stq;
  assign io_ren2_uops_2_is_sys_pc2epc = r_uop_2_is_sys_pc2epc;
  assign io_ren2_uops_2_is_unique = r_uop_2_is_unique;
  assign io_ren2_uops_2_flush_on_commit = r_uop_2_flush_on_commit;
  assign io_ren2_uops_2_ldst_is_rs1 = r_uop_2_ldst_is_rs1;
  assign io_ren2_uops_2_ldst = r_uop_2_ldst;
  assign io_ren2_uops_2_lrs1 = r_uop_2_lrs1;
  assign io_ren2_uops_2_lrs2 = r_uop_2_lrs2;
  assign io_ren2_uops_2_lrs3 = r_uop_2_lrs3;
  assign io_ren2_uops_2_ldst_val = r_uop_2_ldst_val;
  assign io_ren2_uops_2_dst_rtype = r_uop_2_dst_rtype;
  assign io_ren2_uops_2_lrs1_rtype = r_uop_2_lrs1_rtype;
  assign io_ren2_uops_2_lrs2_rtype = r_uop_2_lrs2_rtype;
  assign io_ren2_uops_2_frs3_en = r_uop_2_frs3_en;
  assign io_ren2_uops_2_fp_val = r_uop_2_fp_val;
  assign io_ren2_uops_2_fp_single = r_uop_2_fp_single;
  assign io_ren2_uops_2_xcpt_pf_if = r_uop_2_xcpt_pf_if;
  assign io_ren2_uops_2_xcpt_ae_if = r_uop_2_xcpt_ae_if;
  assign io_ren2_uops_2_xcpt_ma_if = r_uop_2_xcpt_ma_if;
  assign io_ren2_uops_2_bp_debug_if = r_uop_2_bp_debug_if;
  assign io_ren2_uops_2_bp_xcpt_if = r_uop_2_bp_xcpt_if;
  assign io_ren2_uops_2_debug_fsrc = r_uop_2_debug_fsrc;
  assign io_ren2_uops_2_debug_tsrc = r_uop_2_debug_tsrc;
  assign io_ren2_uops_3_uopc = r_uop_3_uopc;
  assign io_ren2_uops_3_inst = r_uop_3_inst;
  assign io_ren2_uops_3_debug_inst = r_uop_3_debug_inst;
  assign io_ren2_uops_3_is_rvc = r_uop_3_is_rvc;
  assign io_ren2_uops_3_debug_pc = r_uop_3_debug_pc;
  assign io_ren2_uops_3_iq_type = r_uop_3_iq_type;
  assign io_ren2_uops_3_fu_code = r_uop_3_fu_code;
  assign io_ren2_uops_3_ctrl_br_type = r_uop_3_ctrl_br_type;
  assign io_ren2_uops_3_ctrl_op1_sel = r_uop_3_ctrl_op1_sel;
  assign io_ren2_uops_3_ctrl_op2_sel = r_uop_3_ctrl_op2_sel;
  assign io_ren2_uops_3_ctrl_imm_sel = r_uop_3_ctrl_imm_sel;
  assign io_ren2_uops_3_ctrl_op_fcn = r_uop_3_ctrl_op_fcn;
  assign io_ren2_uops_3_ctrl_fcn_dw = r_uop_3_ctrl_fcn_dw;
  assign io_ren2_uops_3_ctrl_csr_cmd = r_uop_3_ctrl_csr_cmd;
  assign io_ren2_uops_3_ctrl_is_load = r_uop_3_ctrl_is_load;
  assign io_ren2_uops_3_ctrl_is_sta = r_uop_3_ctrl_is_sta;
  assign io_ren2_uops_3_ctrl_is_std = r_uop_3_ctrl_is_std;
  assign io_ren2_uops_3_iw_state = r_uop_3_iw_state;
  assign io_ren2_uops_3_iw_p1_poisoned = r_uop_3_iw_p1_poisoned;
  assign io_ren2_uops_3_iw_p2_poisoned = r_uop_3_iw_p2_poisoned;
  assign io_ren2_uops_3_is_br = r_uop_3_is_br;
  assign io_ren2_uops_3_is_jalr = r_uop_3_is_jalr;
  assign io_ren2_uops_3_is_jal = r_uop_3_is_jal;
  assign io_ren2_uops_3_is_sfb = r_uop_3_is_sfb;
  assign io_ren2_uops_3_br_mask = r_uop_3_br_mask & ~io_brupdate_b1_resolve_mask;
  assign io_ren2_uops_3_br_tag = r_uop_3_br_tag;
  assign io_ren2_uops_3_ftq_idx = r_uop_3_ftq_idx;
  assign io_ren2_uops_3_edge_inst = r_uop_3_edge_inst;
  assign io_ren2_uops_3_pc_lob = r_uop_3_pc_lob;
  assign io_ren2_uops_3_taken = r_uop_3_taken;
  assign io_ren2_uops_3_imm_packed = r_uop_3_imm_packed;
  assign io_ren2_uops_3_csr_addr = r_uop_3_csr_addr;
  assign io_ren2_uops_3_rxq_idx = r_uop_3_rxq_idx;
  assign io_ren2_uops_3_pdst = io_ren2_uops_3_newuop_pdst;
  assign io_ren2_uops_3_prs1 = bypassed_uop_do_bypass_rs1_1 ? (bypassed_uop_bypass_sel_rs1_enc_2[2] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (bypassed_uop_bypass_sel_rs1_enc_2[1] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (bypassed_uop_bypass_sel_rs1_enc_2[0] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) : r_uop_3_prs1;
  assign io_ren2_uops_3_prs2 = bypassed_uop_do_bypass_rs2_1 ? (bypassed_uop_bypass_sel_rs2_enc_2[2] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (bypassed_uop_bypass_sel_rs2_enc_2[1] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (bypassed_uop_bypass_sel_rs2_enc_2[0] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) : r_uop_3_prs2;
  assign io_ren2_uops_3_prs1_busy = r_uop_3_lrs1_rtype == 2'h0 & _busytable_io_busy_resps_3_prs1_busy | bypassed_uop_do_bypass_rs1_1;
  assign io_ren2_uops_3_prs2_busy = r_uop_3_lrs2_rtype == 2'h0 & _busytable_io_busy_resps_3_prs2_busy | bypassed_uop_do_bypass_rs2_1;
  assign io_ren2_uops_3_stale_pdst = bypassed_uop_bypass_hits_dst_0_2 | bypassed_uop_bypass_hits_dst_1_1 | bypassed_uop_bypass_hits_dst_2 ? (bypassed_uop_bypass_sel_dst_enc_2[2] & (|r_uop_ldst) ? _freelist_io_alloc_pregs_0_bits : 7'h0) | (bypassed_uop_bypass_sel_dst_enc_2[1] & (|r_uop_1_ldst) ? _freelist_io_alloc_pregs_1_bits : 7'h0) | (bypassed_uop_bypass_sel_dst_enc_2[0] & (|r_uop_2_ldst) ? _freelist_io_alloc_pregs_2_bits : 7'h0) : r_uop_3_stale_pdst;
  assign io_ren2_uops_3_exception = r_uop_3_exception;
  assign io_ren2_uops_3_exc_cause = r_uop_3_exc_cause;
  assign io_ren2_uops_3_bypassable = r_uop_3_bypassable;
  assign io_ren2_uops_3_mem_cmd = r_uop_3_mem_cmd;
  assign io_ren2_uops_3_mem_size = r_uop_3_mem_size;
  assign io_ren2_uops_3_mem_signed = r_uop_3_mem_signed;
  assign io_ren2_uops_3_is_fence = r_uop_3_is_fence;
  assign io_ren2_uops_3_is_fencei = r_uop_3_is_fencei;
  assign io_ren2_uops_3_is_amo = r_uop_3_is_amo;
  assign io_ren2_uops_3_uses_ldq = r_uop_3_uses_ldq;
  assign io_ren2_uops_3_uses_stq = r_uop_3_uses_stq;
  assign io_ren2_uops_3_is_sys_pc2epc = r_uop_3_is_sys_pc2epc;
  assign io_ren2_uops_3_is_unique = r_uop_3_is_unique;
  assign io_ren2_uops_3_flush_on_commit = r_uop_3_flush_on_commit;
  assign io_ren2_uops_3_ldst_is_rs1 = r_uop_3_ldst_is_rs1;
  assign io_ren2_uops_3_ldst = r_uop_3_ldst;
  assign io_ren2_uops_3_lrs1 = r_uop_3_lrs1;
  assign io_ren2_uops_3_lrs2 = r_uop_3_lrs2;
  assign io_ren2_uops_3_lrs3 = r_uop_3_lrs3;
  assign io_ren2_uops_3_ldst_val = r_uop_3_ldst_val;
  assign io_ren2_uops_3_dst_rtype = r_uop_3_dst_rtype;
  assign io_ren2_uops_3_lrs1_rtype = r_uop_3_lrs1_rtype;
  assign io_ren2_uops_3_lrs2_rtype = r_uop_3_lrs2_rtype;
  assign io_ren2_uops_3_frs3_en = r_uop_3_frs3_en;
  assign io_ren2_uops_3_fp_val = r_uop_3_fp_val;
  assign io_ren2_uops_3_fp_single = r_uop_3_fp_single;
  assign io_ren2_uops_3_xcpt_pf_if = r_uop_3_xcpt_pf_if;
  assign io_ren2_uops_3_xcpt_ae_if = r_uop_3_xcpt_ae_if;
  assign io_ren2_uops_3_xcpt_ma_if = r_uop_3_xcpt_ma_if;
  assign io_ren2_uops_3_bp_debug_if = r_uop_3_bp_debug_if;
  assign io_ren2_uops_3_bp_xcpt_if = r_uop_3_bp_xcpt_if;
  assign io_ren2_uops_3_debug_fsrc = r_uop_3_debug_fsrc;
  assign io_ren2_uops_3_debug_tsrc = r_uop_3_debug_tsrc;
endmodule

