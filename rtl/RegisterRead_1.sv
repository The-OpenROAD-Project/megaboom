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

module RegisterRead_1(
  input         clock,
                reset,
                io_iss_valids_0,
                io_iss_valids_1,
                io_iss_valids_2,
                io_iss_valids_3,
                io_iss_valids_4,
                io_iss_valids_5,
  input  [6:0]  io_iss_uops_0_uopc,
  input  [31:0] io_iss_uops_0_inst,
                io_iss_uops_0_debug_inst,
  input         io_iss_uops_0_is_rvc,
  input  [39:0] io_iss_uops_0_debug_pc,
  input  [2:0]  io_iss_uops_0_iq_type,
  input  [9:0]  io_iss_uops_0_fu_code,
  input  [1:0]  io_iss_uops_0_iw_state,
  input         io_iss_uops_0_is_br,
                io_iss_uops_0_is_jalr,
                io_iss_uops_0_is_jal,
                io_iss_uops_0_is_sfb,
  input  [19:0] io_iss_uops_0_br_mask,
  input  [4:0]  io_iss_uops_0_br_tag,
  input  [5:0]  io_iss_uops_0_ftq_idx,
  input         io_iss_uops_0_edge_inst,
  input  [5:0]  io_iss_uops_0_pc_lob,
  input         io_iss_uops_0_taken,
  input  [19:0] io_iss_uops_0_imm_packed,
  input  [11:0] io_iss_uops_0_csr_addr,
  input  [6:0]  io_iss_uops_0_rob_idx,
  input  [4:0]  io_iss_uops_0_ldq_idx,
                io_iss_uops_0_stq_idx,
  input  [1:0]  io_iss_uops_0_rxq_idx,
  input  [6:0]  io_iss_uops_0_pdst,
                io_iss_uops_0_prs1,
                io_iss_uops_0_prs2,
                io_iss_uops_0_prs3,
  input  [5:0]  io_iss_uops_0_ppred,
  input         io_iss_uops_0_prs1_busy,
                io_iss_uops_0_prs2_busy,
                io_iss_uops_0_prs3_busy,
                io_iss_uops_0_ppred_busy,
  input  [6:0]  io_iss_uops_0_stale_pdst,
  input         io_iss_uops_0_exception,
  input  [63:0] io_iss_uops_0_exc_cause,
  input         io_iss_uops_0_bypassable,
  input  [4:0]  io_iss_uops_0_mem_cmd,
  input  [1:0]  io_iss_uops_0_mem_size,
  input         io_iss_uops_0_mem_signed,
                io_iss_uops_0_is_fence,
                io_iss_uops_0_is_fencei,
                io_iss_uops_0_is_amo,
                io_iss_uops_0_uses_ldq,
                io_iss_uops_0_uses_stq,
                io_iss_uops_0_is_sys_pc2epc,
                io_iss_uops_0_is_unique,
                io_iss_uops_0_flush_on_commit,
                io_iss_uops_0_ldst_is_rs1,
  input  [5:0]  io_iss_uops_0_ldst,
                io_iss_uops_0_lrs1,
                io_iss_uops_0_lrs2,
                io_iss_uops_0_lrs3,
  input         io_iss_uops_0_ldst_val,
  input  [1:0]  io_iss_uops_0_dst_rtype,
                io_iss_uops_0_lrs1_rtype,
                io_iss_uops_0_lrs2_rtype,
  input         io_iss_uops_0_frs3_en,
                io_iss_uops_0_fp_val,
                io_iss_uops_0_fp_single,
                io_iss_uops_0_xcpt_pf_if,
                io_iss_uops_0_xcpt_ae_if,
                io_iss_uops_0_xcpt_ma_if,
                io_iss_uops_0_bp_debug_if,
                io_iss_uops_0_bp_xcpt_if,
  input  [1:0]  io_iss_uops_0_debug_fsrc,
                io_iss_uops_0_debug_tsrc,
  input  [6:0]  io_iss_uops_1_uopc,
  input  [31:0] io_iss_uops_1_inst,
                io_iss_uops_1_debug_inst,
  input         io_iss_uops_1_is_rvc,
  input  [39:0] io_iss_uops_1_debug_pc,
  input  [2:0]  io_iss_uops_1_iq_type,
  input  [9:0]  io_iss_uops_1_fu_code,
  input  [1:0]  io_iss_uops_1_iw_state,
  input         io_iss_uops_1_is_br,
                io_iss_uops_1_is_jalr,
                io_iss_uops_1_is_jal,
                io_iss_uops_1_is_sfb,
  input  [19:0] io_iss_uops_1_br_mask,
  input  [4:0]  io_iss_uops_1_br_tag,
  input  [5:0]  io_iss_uops_1_ftq_idx,
  input         io_iss_uops_1_edge_inst,
  input  [5:0]  io_iss_uops_1_pc_lob,
  input         io_iss_uops_1_taken,
  input  [19:0] io_iss_uops_1_imm_packed,
  input  [11:0] io_iss_uops_1_csr_addr,
  input  [6:0]  io_iss_uops_1_rob_idx,
  input  [4:0]  io_iss_uops_1_ldq_idx,
                io_iss_uops_1_stq_idx,
  input  [1:0]  io_iss_uops_1_rxq_idx,
  input  [6:0]  io_iss_uops_1_pdst,
                io_iss_uops_1_prs1,
                io_iss_uops_1_prs2,
                io_iss_uops_1_prs3,
  input  [5:0]  io_iss_uops_1_ppred,
  input         io_iss_uops_1_prs1_busy,
                io_iss_uops_1_prs2_busy,
                io_iss_uops_1_prs3_busy,
                io_iss_uops_1_ppred_busy,
  input  [6:0]  io_iss_uops_1_stale_pdst,
  input         io_iss_uops_1_exception,
  input  [63:0] io_iss_uops_1_exc_cause,
  input         io_iss_uops_1_bypassable,
  input  [4:0]  io_iss_uops_1_mem_cmd,
  input  [1:0]  io_iss_uops_1_mem_size,
  input         io_iss_uops_1_mem_signed,
                io_iss_uops_1_is_fence,
                io_iss_uops_1_is_fencei,
                io_iss_uops_1_is_amo,
                io_iss_uops_1_uses_ldq,
                io_iss_uops_1_uses_stq,
                io_iss_uops_1_is_sys_pc2epc,
                io_iss_uops_1_is_unique,
                io_iss_uops_1_flush_on_commit,
                io_iss_uops_1_ldst_is_rs1,
  input  [5:0]  io_iss_uops_1_ldst,
                io_iss_uops_1_lrs1,
                io_iss_uops_1_lrs2,
                io_iss_uops_1_lrs3,
  input         io_iss_uops_1_ldst_val,
  input  [1:0]  io_iss_uops_1_dst_rtype,
                io_iss_uops_1_lrs1_rtype,
                io_iss_uops_1_lrs2_rtype,
  input         io_iss_uops_1_frs3_en,
                io_iss_uops_1_fp_val,
                io_iss_uops_1_fp_single,
                io_iss_uops_1_xcpt_pf_if,
                io_iss_uops_1_xcpt_ae_if,
                io_iss_uops_1_xcpt_ma_if,
                io_iss_uops_1_bp_debug_if,
                io_iss_uops_1_bp_xcpt_if,
  input  [1:0]  io_iss_uops_1_debug_fsrc,
                io_iss_uops_1_debug_tsrc,
  input  [6:0]  io_iss_uops_2_uopc,
  input  [31:0] io_iss_uops_2_inst,
                io_iss_uops_2_debug_inst,
  input         io_iss_uops_2_is_rvc,
  input  [39:0] io_iss_uops_2_debug_pc,
  input  [2:0]  io_iss_uops_2_iq_type,
  input  [9:0]  io_iss_uops_2_fu_code,
  input  [1:0]  io_iss_uops_2_iw_state,
  input         io_iss_uops_2_is_br,
                io_iss_uops_2_is_jalr,
                io_iss_uops_2_is_jal,
                io_iss_uops_2_is_sfb,
  input  [19:0] io_iss_uops_2_br_mask,
  input  [4:0]  io_iss_uops_2_br_tag,
  input  [5:0]  io_iss_uops_2_ftq_idx,
  input         io_iss_uops_2_edge_inst,
  input  [5:0]  io_iss_uops_2_pc_lob,
  input         io_iss_uops_2_taken,
  input  [19:0] io_iss_uops_2_imm_packed,
  input  [11:0] io_iss_uops_2_csr_addr,
  input  [6:0]  io_iss_uops_2_rob_idx,
  input  [4:0]  io_iss_uops_2_ldq_idx,
                io_iss_uops_2_stq_idx,
  input  [1:0]  io_iss_uops_2_rxq_idx,
  input  [6:0]  io_iss_uops_2_pdst,
                io_iss_uops_2_prs1,
                io_iss_uops_2_prs2,
                io_iss_uops_2_prs3,
  input  [5:0]  io_iss_uops_2_ppred,
  input         io_iss_uops_2_prs1_busy,
                io_iss_uops_2_prs2_busy,
                io_iss_uops_2_prs3_busy,
                io_iss_uops_2_ppred_busy,
  input  [6:0]  io_iss_uops_2_stale_pdst,
  input         io_iss_uops_2_exception,
  input  [63:0] io_iss_uops_2_exc_cause,
  input         io_iss_uops_2_bypassable,
  input  [4:0]  io_iss_uops_2_mem_cmd,
  input  [1:0]  io_iss_uops_2_mem_size,
  input         io_iss_uops_2_mem_signed,
                io_iss_uops_2_is_fence,
                io_iss_uops_2_is_fencei,
                io_iss_uops_2_is_amo,
                io_iss_uops_2_uses_ldq,
                io_iss_uops_2_uses_stq,
                io_iss_uops_2_is_sys_pc2epc,
                io_iss_uops_2_is_unique,
                io_iss_uops_2_flush_on_commit,
                io_iss_uops_2_ldst_is_rs1,
  input  [5:0]  io_iss_uops_2_ldst,
                io_iss_uops_2_lrs1,
                io_iss_uops_2_lrs2,
                io_iss_uops_2_lrs3,
  input         io_iss_uops_2_ldst_val,
  input  [1:0]  io_iss_uops_2_dst_rtype,
                io_iss_uops_2_lrs1_rtype,
                io_iss_uops_2_lrs2_rtype,
  input         io_iss_uops_2_frs3_en,
                io_iss_uops_2_fp_val,
                io_iss_uops_2_fp_single,
                io_iss_uops_2_xcpt_pf_if,
                io_iss_uops_2_xcpt_ae_if,
                io_iss_uops_2_xcpt_ma_if,
                io_iss_uops_2_bp_debug_if,
                io_iss_uops_2_bp_xcpt_if,
  input  [1:0]  io_iss_uops_2_debug_fsrc,
                io_iss_uops_2_debug_tsrc,
  input  [6:0]  io_iss_uops_3_uopc,
  input         io_iss_uops_3_is_rvc,
  input  [9:0]  io_iss_uops_3_fu_code,
  input         io_iss_uops_3_is_br,
                io_iss_uops_3_is_jalr,
                io_iss_uops_3_is_jal,
                io_iss_uops_3_is_sfb,
  input  [19:0] io_iss_uops_3_br_mask,
  input  [4:0]  io_iss_uops_3_br_tag,
  input  [5:0]  io_iss_uops_3_ftq_idx,
  input         io_iss_uops_3_edge_inst,
  input  [5:0]  io_iss_uops_3_pc_lob,
  input         io_iss_uops_3_taken,
  input  [19:0] io_iss_uops_3_imm_packed,
  input  [6:0]  io_iss_uops_3_rob_idx,
  input  [4:0]  io_iss_uops_3_ldq_idx,
                io_iss_uops_3_stq_idx,
  input  [6:0]  io_iss_uops_3_pdst,
                io_iss_uops_3_prs1,
                io_iss_uops_3_prs2,
  input         io_iss_uops_3_bypassable,
  input  [4:0]  io_iss_uops_3_mem_cmd,
  input         io_iss_uops_3_is_amo,
                io_iss_uops_3_uses_stq,
  input  [1:0]  io_iss_uops_3_dst_rtype,
                io_iss_uops_3_lrs1_rtype,
                io_iss_uops_3_lrs2_rtype,
  input  [6:0]  io_iss_uops_4_uopc,
  input         io_iss_uops_4_is_rvc,
  input  [9:0]  io_iss_uops_4_fu_code,
  input         io_iss_uops_4_is_br,
                io_iss_uops_4_is_jalr,
                io_iss_uops_4_is_jal,
                io_iss_uops_4_is_sfb,
  input  [19:0] io_iss_uops_4_br_mask,
  input  [4:0]  io_iss_uops_4_br_tag,
  input  [5:0]  io_iss_uops_4_ftq_idx,
  input         io_iss_uops_4_edge_inst,
  input  [5:0]  io_iss_uops_4_pc_lob,
  input         io_iss_uops_4_taken,
  input  [19:0] io_iss_uops_4_imm_packed,
  input  [6:0]  io_iss_uops_4_rob_idx,
  input  [4:0]  io_iss_uops_4_ldq_idx,
                io_iss_uops_4_stq_idx,
  input  [6:0]  io_iss_uops_4_pdst,
                io_iss_uops_4_prs1,
                io_iss_uops_4_prs2,
  input         io_iss_uops_4_bypassable,
  input  [4:0]  io_iss_uops_4_mem_cmd,
  input         io_iss_uops_4_is_amo,
                io_iss_uops_4_uses_stq,
  input  [1:0]  io_iss_uops_4_dst_rtype,
                io_iss_uops_4_lrs1_rtype,
                io_iss_uops_4_lrs2_rtype,
  input  [6:0]  io_iss_uops_5_uopc,
  input         io_iss_uops_5_is_rvc,
  input  [9:0]  io_iss_uops_5_fu_code,
  input         io_iss_uops_5_is_br,
                io_iss_uops_5_is_jalr,
                io_iss_uops_5_is_jal,
                io_iss_uops_5_is_sfb,
  input  [19:0] io_iss_uops_5_br_mask,
  input  [4:0]  io_iss_uops_5_br_tag,
  input  [5:0]  io_iss_uops_5_ftq_idx,
  input         io_iss_uops_5_edge_inst,
  input  [5:0]  io_iss_uops_5_pc_lob,
  input         io_iss_uops_5_taken,
  input  [19:0] io_iss_uops_5_imm_packed,
  input  [6:0]  io_iss_uops_5_rob_idx,
  input  [4:0]  io_iss_uops_5_ldq_idx,
                io_iss_uops_5_stq_idx,
  input  [6:0]  io_iss_uops_5_pdst,
                io_iss_uops_5_prs1,
                io_iss_uops_5_prs2,
  input         io_iss_uops_5_bypassable,
  input  [4:0]  io_iss_uops_5_mem_cmd,
  input         io_iss_uops_5_is_amo,
                io_iss_uops_5_uses_stq,
  input  [1:0]  io_iss_uops_5_dst_rtype,
                io_iss_uops_5_lrs1_rtype,
                io_iss_uops_5_lrs2_rtype,
  output [6:0]  io_rf_read_ports_0_addr,
  input  [63:0] io_rf_read_ports_0_data,
  output [6:0]  io_rf_read_ports_1_addr,
  input  [63:0] io_rf_read_ports_1_data,
  output [6:0]  io_rf_read_ports_2_addr,
  input  [63:0] io_rf_read_ports_2_data,
  output [6:0]  io_rf_read_ports_3_addr,
  input  [63:0] io_rf_read_ports_3_data,
  output [6:0]  io_rf_read_ports_4_addr,
  input  [63:0] io_rf_read_ports_4_data,
  output [6:0]  io_rf_read_ports_5_addr,
  input  [63:0] io_rf_read_ports_5_data,
  output [6:0]  io_rf_read_ports_6_addr,
  input  [63:0] io_rf_read_ports_6_data,
  output [6:0]  io_rf_read_ports_7_addr,
  input  [63:0] io_rf_read_ports_7_data,
  output [6:0]  io_rf_read_ports_8_addr,
  input  [63:0] io_rf_read_ports_8_data,
  output [6:0]  io_rf_read_ports_9_addr,
  input  [63:0] io_rf_read_ports_9_data,
  output [6:0]  io_rf_read_ports_10_addr,
  input  [63:0] io_rf_read_ports_10_data,
  output [6:0]  io_rf_read_ports_11_addr,
  input  [63:0] io_rf_read_ports_11_data,
  input         io_bypass_0_valid,
  input  [6:0]  io_bypass_0_bits_uop_pdst,
  input  [1:0]  io_bypass_0_bits_uop_dst_rtype,
  input  [63:0] io_bypass_0_bits_data,
  input         io_bypass_1_valid,
  input  [6:0]  io_bypass_1_bits_uop_pdst,
  input  [1:0]  io_bypass_1_bits_uop_dst_rtype,
  input  [63:0] io_bypass_1_bits_data,
  input         io_bypass_2_valid,
  input  [6:0]  io_bypass_2_bits_uop_pdst,
  input  [1:0]  io_bypass_2_bits_uop_dst_rtype,
  input  [63:0] io_bypass_2_bits_data,
  input         io_bypass_3_valid,
  input  [6:0]  io_bypass_3_bits_uop_pdst,
  input  [1:0]  io_bypass_3_bits_uop_dst_rtype,
  input  [63:0] io_bypass_3_bits_data,
  input         io_bypass_4_valid,
  input  [6:0]  io_bypass_4_bits_uop_pdst,
  input  [1:0]  io_bypass_4_bits_uop_dst_rtype,
  input  [63:0] io_bypass_4_bits_data,
  input         io_bypass_5_valid,
  input  [6:0]  io_bypass_5_bits_uop_pdst,
  input  [1:0]  io_bypass_5_bits_uop_dst_rtype,
  input  [63:0] io_bypass_5_bits_data,
  output        io_exe_reqs_0_valid,
  output [6:0]  io_exe_reqs_0_bits_uop_uopc,
  output [31:0] io_exe_reqs_0_bits_uop_inst,
                io_exe_reqs_0_bits_uop_debug_inst,
  output        io_exe_reqs_0_bits_uop_is_rvc,
  output [39:0] io_exe_reqs_0_bits_uop_debug_pc,
  output [2:0]  io_exe_reqs_0_bits_uop_iq_type,
  output [9:0]  io_exe_reqs_0_bits_uop_fu_code,
  output [3:0]  io_exe_reqs_0_bits_uop_ctrl_br_type,
  output [1:0]  io_exe_reqs_0_bits_uop_ctrl_op1_sel,
  output [2:0]  io_exe_reqs_0_bits_uop_ctrl_op2_sel,
                io_exe_reqs_0_bits_uop_ctrl_imm_sel,
  output [3:0]  io_exe_reqs_0_bits_uop_ctrl_op_fcn,
  output        io_exe_reqs_0_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_exe_reqs_0_bits_uop_ctrl_csr_cmd,
  output        io_exe_reqs_0_bits_uop_ctrl_is_load,
                io_exe_reqs_0_bits_uop_ctrl_is_sta,
                io_exe_reqs_0_bits_uop_ctrl_is_std,
  output [1:0]  io_exe_reqs_0_bits_uop_iw_state,
  output        io_exe_reqs_0_bits_uop_is_br,
                io_exe_reqs_0_bits_uop_is_jalr,
                io_exe_reqs_0_bits_uop_is_jal,
                io_exe_reqs_0_bits_uop_is_sfb,
  output [19:0] io_exe_reqs_0_bits_uop_br_mask,
  output [4:0]  io_exe_reqs_0_bits_uop_br_tag,
  output [5:0]  io_exe_reqs_0_bits_uop_ftq_idx,
  output        io_exe_reqs_0_bits_uop_edge_inst,
  output [5:0]  io_exe_reqs_0_bits_uop_pc_lob,
  output        io_exe_reqs_0_bits_uop_taken,
  output [19:0] io_exe_reqs_0_bits_uop_imm_packed,
  output [11:0] io_exe_reqs_0_bits_uop_csr_addr,
  output [6:0]  io_exe_reqs_0_bits_uop_rob_idx,
  output [4:0]  io_exe_reqs_0_bits_uop_ldq_idx,
                io_exe_reqs_0_bits_uop_stq_idx,
  output [1:0]  io_exe_reqs_0_bits_uop_rxq_idx,
  output [6:0]  io_exe_reqs_0_bits_uop_pdst,
                io_exe_reqs_0_bits_uop_prs1,
                io_exe_reqs_0_bits_uop_prs2,
                io_exe_reqs_0_bits_uop_prs3,
  output [5:0]  io_exe_reqs_0_bits_uop_ppred,
  output        io_exe_reqs_0_bits_uop_prs1_busy,
                io_exe_reqs_0_bits_uop_prs2_busy,
                io_exe_reqs_0_bits_uop_prs3_busy,
                io_exe_reqs_0_bits_uop_ppred_busy,
  output [6:0]  io_exe_reqs_0_bits_uop_stale_pdst,
  output        io_exe_reqs_0_bits_uop_exception,
  output [63:0] io_exe_reqs_0_bits_uop_exc_cause,
  output        io_exe_reqs_0_bits_uop_bypassable,
  output [4:0]  io_exe_reqs_0_bits_uop_mem_cmd,
  output [1:0]  io_exe_reqs_0_bits_uop_mem_size,
  output        io_exe_reqs_0_bits_uop_mem_signed,
                io_exe_reqs_0_bits_uop_is_fence,
                io_exe_reqs_0_bits_uop_is_fencei,
                io_exe_reqs_0_bits_uop_is_amo,
                io_exe_reqs_0_bits_uop_uses_ldq,
                io_exe_reqs_0_bits_uop_uses_stq,
                io_exe_reqs_0_bits_uop_is_sys_pc2epc,
                io_exe_reqs_0_bits_uop_is_unique,
                io_exe_reqs_0_bits_uop_flush_on_commit,
                io_exe_reqs_0_bits_uop_ldst_is_rs1,
  output [5:0]  io_exe_reqs_0_bits_uop_ldst,
                io_exe_reqs_0_bits_uop_lrs1,
                io_exe_reqs_0_bits_uop_lrs2,
                io_exe_reqs_0_bits_uop_lrs3,
  output        io_exe_reqs_0_bits_uop_ldst_val,
  output [1:0]  io_exe_reqs_0_bits_uop_dst_rtype,
                io_exe_reqs_0_bits_uop_lrs1_rtype,
                io_exe_reqs_0_bits_uop_lrs2_rtype,
  output        io_exe_reqs_0_bits_uop_frs3_en,
                io_exe_reqs_0_bits_uop_fp_val,
                io_exe_reqs_0_bits_uop_fp_single,
                io_exe_reqs_0_bits_uop_xcpt_pf_if,
                io_exe_reqs_0_bits_uop_xcpt_ae_if,
                io_exe_reqs_0_bits_uop_xcpt_ma_if,
                io_exe_reqs_0_bits_uop_bp_debug_if,
                io_exe_reqs_0_bits_uop_bp_xcpt_if,
  output [1:0]  io_exe_reqs_0_bits_uop_debug_fsrc,
                io_exe_reqs_0_bits_uop_debug_tsrc,
  output [63:0] io_exe_reqs_0_bits_rs1_data,
                io_exe_reqs_0_bits_rs2_data,
  output        io_exe_reqs_1_valid,
  output [6:0]  io_exe_reqs_1_bits_uop_uopc,
  output [31:0] io_exe_reqs_1_bits_uop_inst,
                io_exe_reqs_1_bits_uop_debug_inst,
  output        io_exe_reqs_1_bits_uop_is_rvc,
  output [39:0] io_exe_reqs_1_bits_uop_debug_pc,
  output [2:0]  io_exe_reqs_1_bits_uop_iq_type,
  output [9:0]  io_exe_reqs_1_bits_uop_fu_code,
  output [3:0]  io_exe_reqs_1_bits_uop_ctrl_br_type,
  output [1:0]  io_exe_reqs_1_bits_uop_ctrl_op1_sel,
  output [2:0]  io_exe_reqs_1_bits_uop_ctrl_op2_sel,
                io_exe_reqs_1_bits_uop_ctrl_imm_sel,
  output [3:0]  io_exe_reqs_1_bits_uop_ctrl_op_fcn,
  output        io_exe_reqs_1_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_exe_reqs_1_bits_uop_ctrl_csr_cmd,
  output        io_exe_reqs_1_bits_uop_ctrl_is_load,
                io_exe_reqs_1_bits_uop_ctrl_is_sta,
                io_exe_reqs_1_bits_uop_ctrl_is_std,
  output [1:0]  io_exe_reqs_1_bits_uop_iw_state,
  output        io_exe_reqs_1_bits_uop_is_br,
                io_exe_reqs_1_bits_uop_is_jalr,
                io_exe_reqs_1_bits_uop_is_jal,
                io_exe_reqs_1_bits_uop_is_sfb,
  output [19:0] io_exe_reqs_1_bits_uop_br_mask,
  output [4:0]  io_exe_reqs_1_bits_uop_br_tag,
  output [5:0]  io_exe_reqs_1_bits_uop_ftq_idx,
  output        io_exe_reqs_1_bits_uop_edge_inst,
  output [5:0]  io_exe_reqs_1_bits_uop_pc_lob,
  output        io_exe_reqs_1_bits_uop_taken,
  output [19:0] io_exe_reqs_1_bits_uop_imm_packed,
  output [11:0] io_exe_reqs_1_bits_uop_csr_addr,
  output [6:0]  io_exe_reqs_1_bits_uop_rob_idx,
  output [4:0]  io_exe_reqs_1_bits_uop_ldq_idx,
                io_exe_reqs_1_bits_uop_stq_idx,
  output [1:0]  io_exe_reqs_1_bits_uop_rxq_idx,
  output [6:0]  io_exe_reqs_1_bits_uop_pdst,
                io_exe_reqs_1_bits_uop_prs1,
                io_exe_reqs_1_bits_uop_prs2,
                io_exe_reqs_1_bits_uop_prs3,
  output [5:0]  io_exe_reqs_1_bits_uop_ppred,
  output        io_exe_reqs_1_bits_uop_prs1_busy,
                io_exe_reqs_1_bits_uop_prs2_busy,
                io_exe_reqs_1_bits_uop_prs3_busy,
                io_exe_reqs_1_bits_uop_ppred_busy,
  output [6:0]  io_exe_reqs_1_bits_uop_stale_pdst,
  output        io_exe_reqs_1_bits_uop_exception,
  output [63:0] io_exe_reqs_1_bits_uop_exc_cause,
  output        io_exe_reqs_1_bits_uop_bypassable,
  output [4:0]  io_exe_reqs_1_bits_uop_mem_cmd,
  output [1:0]  io_exe_reqs_1_bits_uop_mem_size,
  output        io_exe_reqs_1_bits_uop_mem_signed,
                io_exe_reqs_1_bits_uop_is_fence,
                io_exe_reqs_1_bits_uop_is_fencei,
                io_exe_reqs_1_bits_uop_is_amo,
                io_exe_reqs_1_bits_uop_uses_ldq,
                io_exe_reqs_1_bits_uop_uses_stq,
                io_exe_reqs_1_bits_uop_is_sys_pc2epc,
                io_exe_reqs_1_bits_uop_is_unique,
                io_exe_reqs_1_bits_uop_flush_on_commit,
                io_exe_reqs_1_bits_uop_ldst_is_rs1,
  output [5:0]  io_exe_reqs_1_bits_uop_ldst,
                io_exe_reqs_1_bits_uop_lrs1,
                io_exe_reqs_1_bits_uop_lrs2,
                io_exe_reqs_1_bits_uop_lrs3,
  output        io_exe_reqs_1_bits_uop_ldst_val,
  output [1:0]  io_exe_reqs_1_bits_uop_dst_rtype,
                io_exe_reqs_1_bits_uop_lrs1_rtype,
                io_exe_reqs_1_bits_uop_lrs2_rtype,
  output        io_exe_reqs_1_bits_uop_frs3_en,
                io_exe_reqs_1_bits_uop_fp_val,
                io_exe_reqs_1_bits_uop_fp_single,
                io_exe_reqs_1_bits_uop_xcpt_pf_if,
                io_exe_reqs_1_bits_uop_xcpt_ae_if,
                io_exe_reqs_1_bits_uop_xcpt_ma_if,
                io_exe_reqs_1_bits_uop_bp_debug_if,
                io_exe_reqs_1_bits_uop_bp_xcpt_if,
  output [1:0]  io_exe_reqs_1_bits_uop_debug_fsrc,
                io_exe_reqs_1_bits_uop_debug_tsrc,
  output [63:0] io_exe_reqs_1_bits_rs1_data,
                io_exe_reqs_1_bits_rs2_data,
  output        io_exe_reqs_2_valid,
  output [6:0]  io_exe_reqs_2_bits_uop_uopc,
  output [31:0] io_exe_reqs_2_bits_uop_inst,
                io_exe_reqs_2_bits_uop_debug_inst,
  output        io_exe_reqs_2_bits_uop_is_rvc,
  output [39:0] io_exe_reqs_2_bits_uop_debug_pc,
  output [2:0]  io_exe_reqs_2_bits_uop_iq_type,
  output [9:0]  io_exe_reqs_2_bits_uop_fu_code,
  output [3:0]  io_exe_reqs_2_bits_uop_ctrl_br_type,
  output [1:0]  io_exe_reqs_2_bits_uop_ctrl_op1_sel,
  output [2:0]  io_exe_reqs_2_bits_uop_ctrl_op2_sel,
                io_exe_reqs_2_bits_uop_ctrl_imm_sel,
  output [3:0]  io_exe_reqs_2_bits_uop_ctrl_op_fcn,
  output        io_exe_reqs_2_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_exe_reqs_2_bits_uop_ctrl_csr_cmd,
  output        io_exe_reqs_2_bits_uop_ctrl_is_load,
                io_exe_reqs_2_bits_uop_ctrl_is_sta,
                io_exe_reqs_2_bits_uop_ctrl_is_std,
  output [1:0]  io_exe_reqs_2_bits_uop_iw_state,
  output        io_exe_reqs_2_bits_uop_is_br,
                io_exe_reqs_2_bits_uop_is_jalr,
                io_exe_reqs_2_bits_uop_is_jal,
                io_exe_reqs_2_bits_uop_is_sfb,
  output [19:0] io_exe_reqs_2_bits_uop_br_mask,
  output [4:0]  io_exe_reqs_2_bits_uop_br_tag,
  output [5:0]  io_exe_reqs_2_bits_uop_ftq_idx,
  output        io_exe_reqs_2_bits_uop_edge_inst,
  output [5:0]  io_exe_reqs_2_bits_uop_pc_lob,
  output        io_exe_reqs_2_bits_uop_taken,
  output [19:0] io_exe_reqs_2_bits_uop_imm_packed,
  output [11:0] io_exe_reqs_2_bits_uop_csr_addr,
  output [6:0]  io_exe_reqs_2_bits_uop_rob_idx,
  output [4:0]  io_exe_reqs_2_bits_uop_ldq_idx,
                io_exe_reqs_2_bits_uop_stq_idx,
  output [1:0]  io_exe_reqs_2_bits_uop_rxq_idx,
  output [6:0]  io_exe_reqs_2_bits_uop_pdst,
                io_exe_reqs_2_bits_uop_prs1,
                io_exe_reqs_2_bits_uop_prs2,
                io_exe_reqs_2_bits_uop_prs3,
  output [5:0]  io_exe_reqs_2_bits_uop_ppred,
  output        io_exe_reqs_2_bits_uop_prs1_busy,
                io_exe_reqs_2_bits_uop_prs2_busy,
                io_exe_reqs_2_bits_uop_prs3_busy,
                io_exe_reqs_2_bits_uop_ppred_busy,
  output [6:0]  io_exe_reqs_2_bits_uop_stale_pdst,
  output        io_exe_reqs_2_bits_uop_exception,
  output [63:0] io_exe_reqs_2_bits_uop_exc_cause,
  output        io_exe_reqs_2_bits_uop_bypassable,
  output [4:0]  io_exe_reqs_2_bits_uop_mem_cmd,
  output [1:0]  io_exe_reqs_2_bits_uop_mem_size,
  output        io_exe_reqs_2_bits_uop_mem_signed,
                io_exe_reqs_2_bits_uop_is_fence,
                io_exe_reqs_2_bits_uop_is_fencei,
                io_exe_reqs_2_bits_uop_is_amo,
                io_exe_reqs_2_bits_uop_uses_ldq,
                io_exe_reqs_2_bits_uop_uses_stq,
                io_exe_reqs_2_bits_uop_is_sys_pc2epc,
                io_exe_reqs_2_bits_uop_is_unique,
                io_exe_reqs_2_bits_uop_flush_on_commit,
                io_exe_reqs_2_bits_uop_ldst_is_rs1,
  output [5:0]  io_exe_reqs_2_bits_uop_ldst,
                io_exe_reqs_2_bits_uop_lrs1,
                io_exe_reqs_2_bits_uop_lrs2,
                io_exe_reqs_2_bits_uop_lrs3,
  output        io_exe_reqs_2_bits_uop_ldst_val,
  output [1:0]  io_exe_reqs_2_bits_uop_dst_rtype,
                io_exe_reqs_2_bits_uop_lrs1_rtype,
                io_exe_reqs_2_bits_uop_lrs2_rtype,
  output        io_exe_reqs_2_bits_uop_frs3_en,
                io_exe_reqs_2_bits_uop_fp_val,
                io_exe_reqs_2_bits_uop_fp_single,
                io_exe_reqs_2_bits_uop_xcpt_pf_if,
                io_exe_reqs_2_bits_uop_xcpt_ae_if,
                io_exe_reqs_2_bits_uop_xcpt_ma_if,
                io_exe_reqs_2_bits_uop_bp_debug_if,
                io_exe_reqs_2_bits_uop_bp_xcpt_if,
  output [1:0]  io_exe_reqs_2_bits_uop_debug_fsrc,
                io_exe_reqs_2_bits_uop_debug_tsrc,
  output [63:0] io_exe_reqs_2_bits_rs1_data,
                io_exe_reqs_2_bits_rs2_data,
  output        io_exe_reqs_3_valid,
  output [6:0]  io_exe_reqs_3_bits_uop_uopc,
  output        io_exe_reqs_3_bits_uop_is_rvc,
  output [9:0]  io_exe_reqs_3_bits_uop_fu_code,
  output [3:0]  io_exe_reqs_3_bits_uop_ctrl_br_type,
  output [1:0]  io_exe_reqs_3_bits_uop_ctrl_op1_sel,
  output [2:0]  io_exe_reqs_3_bits_uop_ctrl_op2_sel,
                io_exe_reqs_3_bits_uop_ctrl_imm_sel,
  output [3:0]  io_exe_reqs_3_bits_uop_ctrl_op_fcn,
  output        io_exe_reqs_3_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_exe_reqs_3_bits_uop_ctrl_csr_cmd,
  output        io_exe_reqs_3_bits_uop_is_br,
                io_exe_reqs_3_bits_uop_is_jalr,
                io_exe_reqs_3_bits_uop_is_jal,
                io_exe_reqs_3_bits_uop_is_sfb,
  output [19:0] io_exe_reqs_3_bits_uop_br_mask,
  output [4:0]  io_exe_reqs_3_bits_uop_br_tag,
  output [5:0]  io_exe_reqs_3_bits_uop_ftq_idx,
  output        io_exe_reqs_3_bits_uop_edge_inst,
  output [5:0]  io_exe_reqs_3_bits_uop_pc_lob,
  output        io_exe_reqs_3_bits_uop_taken,
  output [19:0] io_exe_reqs_3_bits_uop_imm_packed,
  output [6:0]  io_exe_reqs_3_bits_uop_rob_idx,
  output [4:0]  io_exe_reqs_3_bits_uop_ldq_idx,
                io_exe_reqs_3_bits_uop_stq_idx,
  output [6:0]  io_exe_reqs_3_bits_uop_pdst,
                io_exe_reqs_3_bits_uop_prs1,
  output        io_exe_reqs_3_bits_uop_bypassable,
                io_exe_reqs_3_bits_uop_is_amo,
                io_exe_reqs_3_bits_uop_uses_stq,
  output [1:0]  io_exe_reqs_3_bits_uop_dst_rtype,
  output [63:0] io_exe_reqs_3_bits_rs1_data,
                io_exe_reqs_3_bits_rs2_data,
  output        io_exe_reqs_4_valid,
  output [6:0]  io_exe_reqs_4_bits_uop_uopc,
  output        io_exe_reqs_4_bits_uop_is_rvc,
  output [9:0]  io_exe_reqs_4_bits_uop_fu_code,
  output [3:0]  io_exe_reqs_4_bits_uop_ctrl_br_type,
  output [1:0]  io_exe_reqs_4_bits_uop_ctrl_op1_sel,
  output [2:0]  io_exe_reqs_4_bits_uop_ctrl_op2_sel,
                io_exe_reqs_4_bits_uop_ctrl_imm_sel,
  output [3:0]  io_exe_reqs_4_bits_uop_ctrl_op_fcn,
  output        io_exe_reqs_4_bits_uop_ctrl_fcn_dw,
                io_exe_reqs_4_bits_uop_is_br,
                io_exe_reqs_4_bits_uop_is_jalr,
                io_exe_reqs_4_bits_uop_is_jal,
                io_exe_reqs_4_bits_uop_is_sfb,
  output [19:0] io_exe_reqs_4_bits_uop_br_mask,
  output [4:0]  io_exe_reqs_4_bits_uop_br_tag,
  output [5:0]  io_exe_reqs_4_bits_uop_ftq_idx,
  output        io_exe_reqs_4_bits_uop_edge_inst,
  output [5:0]  io_exe_reqs_4_bits_uop_pc_lob,
  output        io_exe_reqs_4_bits_uop_taken,
  output [19:0] io_exe_reqs_4_bits_uop_imm_packed,
  output [6:0]  io_exe_reqs_4_bits_uop_rob_idx,
  output [4:0]  io_exe_reqs_4_bits_uop_ldq_idx,
                io_exe_reqs_4_bits_uop_stq_idx,
  output [6:0]  io_exe_reqs_4_bits_uop_pdst,
                io_exe_reqs_4_bits_uop_prs1,
  output        io_exe_reqs_4_bits_uop_bypassable,
                io_exe_reqs_4_bits_uop_is_amo,
                io_exe_reqs_4_bits_uop_uses_stq,
  output [1:0]  io_exe_reqs_4_bits_uop_dst_rtype,
  output [63:0] io_exe_reqs_4_bits_rs1_data,
                io_exe_reqs_4_bits_rs2_data,
  output        io_exe_reqs_5_valid,
  output [6:0]  io_exe_reqs_5_bits_uop_uopc,
  output        io_exe_reqs_5_bits_uop_is_rvc,
  output [9:0]  io_exe_reqs_5_bits_uop_fu_code,
  output [3:0]  io_exe_reqs_5_bits_uop_ctrl_br_type,
  output [1:0]  io_exe_reqs_5_bits_uop_ctrl_op1_sel,
  output [2:0]  io_exe_reqs_5_bits_uop_ctrl_op2_sel,
                io_exe_reqs_5_bits_uop_ctrl_imm_sel,
  output [3:0]  io_exe_reqs_5_bits_uop_ctrl_op_fcn,
  output        io_exe_reqs_5_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_exe_reqs_5_bits_uop_ctrl_csr_cmd,
  output        io_exe_reqs_5_bits_uop_is_br,
                io_exe_reqs_5_bits_uop_is_jalr,
                io_exe_reqs_5_bits_uop_is_jal,
                io_exe_reqs_5_bits_uop_is_sfb,
  output [19:0] io_exe_reqs_5_bits_uop_br_mask,
  output [4:0]  io_exe_reqs_5_bits_uop_br_tag,
  output [5:0]  io_exe_reqs_5_bits_uop_ftq_idx,
  output        io_exe_reqs_5_bits_uop_edge_inst,
  output [5:0]  io_exe_reqs_5_bits_uop_pc_lob,
  output        io_exe_reqs_5_bits_uop_taken,
  output [19:0] io_exe_reqs_5_bits_uop_imm_packed,
  output [6:0]  io_exe_reqs_5_bits_uop_rob_idx,
  output [4:0]  io_exe_reqs_5_bits_uop_ldq_idx,
                io_exe_reqs_5_bits_uop_stq_idx,
  output [6:0]  io_exe_reqs_5_bits_uop_pdst,
                io_exe_reqs_5_bits_uop_prs1,
  output        io_exe_reqs_5_bits_uop_bypassable,
                io_exe_reqs_5_bits_uop_is_amo,
                io_exe_reqs_5_bits_uop_uses_stq,
  output [1:0]  io_exe_reqs_5_bits_uop_dst_rtype,
  output [63:0] io_exe_reqs_5_bits_rs1_data,
                io_exe_reqs_5_bits_rs2_data,
  input         io_kill,
  input  [19:0] io_brupdate_b1_resolve_mask,
                io_brupdate_b1_mispredict_mask
);

  wire        _rrd_decode_unit_5_io_rrd_valid;
  wire [6:0]  _rrd_decode_unit_5_io_rrd_uop_uopc;
  wire        _rrd_decode_unit_5_io_rrd_uop_is_rvc;
  wire [9:0]  _rrd_decode_unit_5_io_rrd_uop_fu_code;
  wire [3:0]  _rrd_decode_unit_5_io_rrd_uop_ctrl_br_type;
  wire [1:0]  _rrd_decode_unit_5_io_rrd_uop_ctrl_op1_sel;
  wire [2:0]  _rrd_decode_unit_5_io_rrd_uop_ctrl_op2_sel;
  wire [2:0]  _rrd_decode_unit_5_io_rrd_uop_ctrl_imm_sel;
  wire [3:0]  _rrd_decode_unit_5_io_rrd_uop_ctrl_op_fcn;
  wire        _rrd_decode_unit_5_io_rrd_uop_ctrl_fcn_dw;
  wire [2:0]  _rrd_decode_unit_5_io_rrd_uop_ctrl_csr_cmd;
  wire        _rrd_decode_unit_5_io_rrd_uop_is_br;
  wire        _rrd_decode_unit_5_io_rrd_uop_is_jalr;
  wire        _rrd_decode_unit_5_io_rrd_uop_is_jal;
  wire        _rrd_decode_unit_5_io_rrd_uop_is_sfb;
  wire [19:0] _rrd_decode_unit_5_io_rrd_uop_br_mask;
  wire [4:0]  _rrd_decode_unit_5_io_rrd_uop_br_tag;
  wire [5:0]  _rrd_decode_unit_5_io_rrd_uop_ftq_idx;
  wire        _rrd_decode_unit_5_io_rrd_uop_edge_inst;
  wire [5:0]  _rrd_decode_unit_5_io_rrd_uop_pc_lob;
  wire        _rrd_decode_unit_5_io_rrd_uop_taken;
  wire [19:0] _rrd_decode_unit_5_io_rrd_uop_imm_packed;
  wire [6:0]  _rrd_decode_unit_5_io_rrd_uop_rob_idx;
  wire [4:0]  _rrd_decode_unit_5_io_rrd_uop_ldq_idx;
  wire [4:0]  _rrd_decode_unit_5_io_rrd_uop_stq_idx;
  wire [6:0]  _rrd_decode_unit_5_io_rrd_uop_pdst;
  wire [6:0]  _rrd_decode_unit_5_io_rrd_uop_prs1;
  wire [6:0]  _rrd_decode_unit_5_io_rrd_uop_prs2;
  wire        _rrd_decode_unit_5_io_rrd_uop_bypassable;
  wire        _rrd_decode_unit_5_io_rrd_uop_is_amo;
  wire        _rrd_decode_unit_5_io_rrd_uop_uses_stq;
  wire [1:0]  _rrd_decode_unit_5_io_rrd_uop_dst_rtype;
  wire [1:0]  _rrd_decode_unit_5_io_rrd_uop_lrs1_rtype;
  wire [1:0]  _rrd_decode_unit_5_io_rrd_uop_lrs2_rtype;
  wire        _rrd_decode_unit_4_io_rrd_valid;
  wire [6:0]  _rrd_decode_unit_4_io_rrd_uop_uopc;
  wire        _rrd_decode_unit_4_io_rrd_uop_is_rvc;
  wire [9:0]  _rrd_decode_unit_4_io_rrd_uop_fu_code;
  wire [3:0]  _rrd_decode_unit_4_io_rrd_uop_ctrl_br_type;
  wire [1:0]  _rrd_decode_unit_4_io_rrd_uop_ctrl_op1_sel;
  wire [2:0]  _rrd_decode_unit_4_io_rrd_uop_ctrl_op2_sel;
  wire [2:0]  _rrd_decode_unit_4_io_rrd_uop_ctrl_imm_sel;
  wire [3:0]  _rrd_decode_unit_4_io_rrd_uop_ctrl_op_fcn;
  wire        _rrd_decode_unit_4_io_rrd_uop_ctrl_fcn_dw;
  wire        _rrd_decode_unit_4_io_rrd_uop_is_br;
  wire        _rrd_decode_unit_4_io_rrd_uop_is_jalr;
  wire        _rrd_decode_unit_4_io_rrd_uop_is_jal;
  wire        _rrd_decode_unit_4_io_rrd_uop_is_sfb;
  wire [19:0] _rrd_decode_unit_4_io_rrd_uop_br_mask;
  wire [4:0]  _rrd_decode_unit_4_io_rrd_uop_br_tag;
  wire [5:0]  _rrd_decode_unit_4_io_rrd_uop_ftq_idx;
  wire        _rrd_decode_unit_4_io_rrd_uop_edge_inst;
  wire [5:0]  _rrd_decode_unit_4_io_rrd_uop_pc_lob;
  wire        _rrd_decode_unit_4_io_rrd_uop_taken;
  wire [19:0] _rrd_decode_unit_4_io_rrd_uop_imm_packed;
  wire [6:0]  _rrd_decode_unit_4_io_rrd_uop_rob_idx;
  wire [4:0]  _rrd_decode_unit_4_io_rrd_uop_ldq_idx;
  wire [4:0]  _rrd_decode_unit_4_io_rrd_uop_stq_idx;
  wire [6:0]  _rrd_decode_unit_4_io_rrd_uop_pdst;
  wire [6:0]  _rrd_decode_unit_4_io_rrd_uop_prs1;
  wire [6:0]  _rrd_decode_unit_4_io_rrd_uop_prs2;
  wire        _rrd_decode_unit_4_io_rrd_uop_bypassable;
  wire        _rrd_decode_unit_4_io_rrd_uop_is_amo;
  wire        _rrd_decode_unit_4_io_rrd_uop_uses_stq;
  wire [1:0]  _rrd_decode_unit_4_io_rrd_uop_dst_rtype;
  wire [1:0]  _rrd_decode_unit_4_io_rrd_uop_lrs1_rtype;
  wire [1:0]  _rrd_decode_unit_4_io_rrd_uop_lrs2_rtype;
  wire        _rrd_decode_unit_3_io_rrd_valid;
  wire [6:0]  _rrd_decode_unit_3_io_rrd_uop_uopc;
  wire        _rrd_decode_unit_3_io_rrd_uop_is_rvc;
  wire [9:0]  _rrd_decode_unit_3_io_rrd_uop_fu_code;
  wire [3:0]  _rrd_decode_unit_3_io_rrd_uop_ctrl_br_type;
  wire [1:0]  _rrd_decode_unit_3_io_rrd_uop_ctrl_op1_sel;
  wire [2:0]  _rrd_decode_unit_3_io_rrd_uop_ctrl_op2_sel;
  wire [2:0]  _rrd_decode_unit_3_io_rrd_uop_ctrl_imm_sel;
  wire [3:0]  _rrd_decode_unit_3_io_rrd_uop_ctrl_op_fcn;
  wire        _rrd_decode_unit_3_io_rrd_uop_ctrl_fcn_dw;
  wire [2:0]  _rrd_decode_unit_3_io_rrd_uop_ctrl_csr_cmd;
  wire        _rrd_decode_unit_3_io_rrd_uop_is_br;
  wire        _rrd_decode_unit_3_io_rrd_uop_is_jalr;
  wire        _rrd_decode_unit_3_io_rrd_uop_is_jal;
  wire        _rrd_decode_unit_3_io_rrd_uop_is_sfb;
  wire [19:0] _rrd_decode_unit_3_io_rrd_uop_br_mask;
  wire [4:0]  _rrd_decode_unit_3_io_rrd_uop_br_tag;
  wire [5:0]  _rrd_decode_unit_3_io_rrd_uop_ftq_idx;
  wire        _rrd_decode_unit_3_io_rrd_uop_edge_inst;
  wire [5:0]  _rrd_decode_unit_3_io_rrd_uop_pc_lob;
  wire        _rrd_decode_unit_3_io_rrd_uop_taken;
  wire [19:0] _rrd_decode_unit_3_io_rrd_uop_imm_packed;
  wire [6:0]  _rrd_decode_unit_3_io_rrd_uop_rob_idx;
  wire [4:0]  _rrd_decode_unit_3_io_rrd_uop_ldq_idx;
  wire [4:0]  _rrd_decode_unit_3_io_rrd_uop_stq_idx;
  wire [6:0]  _rrd_decode_unit_3_io_rrd_uop_pdst;
  wire [6:0]  _rrd_decode_unit_3_io_rrd_uop_prs1;
  wire [6:0]  _rrd_decode_unit_3_io_rrd_uop_prs2;
  wire        _rrd_decode_unit_3_io_rrd_uop_bypassable;
  wire        _rrd_decode_unit_3_io_rrd_uop_is_amo;
  wire        _rrd_decode_unit_3_io_rrd_uop_uses_stq;
  wire [1:0]  _rrd_decode_unit_3_io_rrd_uop_dst_rtype;
  wire [1:0]  _rrd_decode_unit_3_io_rrd_uop_lrs1_rtype;
  wire [1:0]  _rrd_decode_unit_3_io_rrd_uop_lrs2_rtype;
  wire        _rrd_decode_unit_2_io_rrd_valid;
  wire [6:0]  _rrd_decode_unit_2_io_rrd_uop_uopc;
  wire [31:0] _rrd_decode_unit_2_io_rrd_uop_inst;
  wire [31:0] _rrd_decode_unit_2_io_rrd_uop_debug_inst;
  wire        _rrd_decode_unit_2_io_rrd_uop_is_rvc;
  wire [39:0] _rrd_decode_unit_2_io_rrd_uop_debug_pc;
  wire [2:0]  _rrd_decode_unit_2_io_rrd_uop_iq_type;
  wire [9:0]  _rrd_decode_unit_2_io_rrd_uop_fu_code;
  wire [3:0]  _rrd_decode_unit_2_io_rrd_uop_ctrl_br_type;
  wire [1:0]  _rrd_decode_unit_2_io_rrd_uop_ctrl_op1_sel;
  wire [2:0]  _rrd_decode_unit_2_io_rrd_uop_ctrl_op2_sel;
  wire [2:0]  _rrd_decode_unit_2_io_rrd_uop_ctrl_imm_sel;
  wire [3:0]  _rrd_decode_unit_2_io_rrd_uop_ctrl_op_fcn;
  wire        _rrd_decode_unit_2_io_rrd_uop_ctrl_fcn_dw;
  wire [2:0]  _rrd_decode_unit_2_io_rrd_uop_ctrl_csr_cmd;
  wire        _rrd_decode_unit_2_io_rrd_uop_ctrl_is_load;
  wire        _rrd_decode_unit_2_io_rrd_uop_ctrl_is_sta;
  wire        _rrd_decode_unit_2_io_rrd_uop_ctrl_is_std;
  wire [1:0]  _rrd_decode_unit_2_io_rrd_uop_iw_state;
  wire        _rrd_decode_unit_2_io_rrd_uop_is_br;
  wire        _rrd_decode_unit_2_io_rrd_uop_is_jalr;
  wire        _rrd_decode_unit_2_io_rrd_uop_is_jal;
  wire        _rrd_decode_unit_2_io_rrd_uop_is_sfb;
  wire [19:0] _rrd_decode_unit_2_io_rrd_uop_br_mask;
  wire [4:0]  _rrd_decode_unit_2_io_rrd_uop_br_tag;
  wire [5:0]  _rrd_decode_unit_2_io_rrd_uop_ftq_idx;
  wire        _rrd_decode_unit_2_io_rrd_uop_edge_inst;
  wire [5:0]  _rrd_decode_unit_2_io_rrd_uop_pc_lob;
  wire        _rrd_decode_unit_2_io_rrd_uop_taken;
  wire [19:0] _rrd_decode_unit_2_io_rrd_uop_imm_packed;
  wire [11:0] _rrd_decode_unit_2_io_rrd_uop_csr_addr;
  wire [6:0]  _rrd_decode_unit_2_io_rrd_uop_rob_idx;
  wire [4:0]  _rrd_decode_unit_2_io_rrd_uop_ldq_idx;
  wire [4:0]  _rrd_decode_unit_2_io_rrd_uop_stq_idx;
  wire [1:0]  _rrd_decode_unit_2_io_rrd_uop_rxq_idx;
  wire [6:0]  _rrd_decode_unit_2_io_rrd_uop_pdst;
  wire [6:0]  _rrd_decode_unit_2_io_rrd_uop_prs1;
  wire [6:0]  _rrd_decode_unit_2_io_rrd_uop_prs2;
  wire [6:0]  _rrd_decode_unit_2_io_rrd_uop_prs3;
  wire [5:0]  _rrd_decode_unit_2_io_rrd_uop_ppred;
  wire        _rrd_decode_unit_2_io_rrd_uop_prs1_busy;
  wire        _rrd_decode_unit_2_io_rrd_uop_prs2_busy;
  wire        _rrd_decode_unit_2_io_rrd_uop_prs3_busy;
  wire        _rrd_decode_unit_2_io_rrd_uop_ppred_busy;
  wire [6:0]  _rrd_decode_unit_2_io_rrd_uop_stale_pdst;
  wire        _rrd_decode_unit_2_io_rrd_uop_exception;
  wire [63:0] _rrd_decode_unit_2_io_rrd_uop_exc_cause;
  wire        _rrd_decode_unit_2_io_rrd_uop_bypassable;
  wire [4:0]  _rrd_decode_unit_2_io_rrd_uop_mem_cmd;
  wire [1:0]  _rrd_decode_unit_2_io_rrd_uop_mem_size;
  wire        _rrd_decode_unit_2_io_rrd_uop_mem_signed;
  wire        _rrd_decode_unit_2_io_rrd_uop_is_fence;
  wire        _rrd_decode_unit_2_io_rrd_uop_is_fencei;
  wire        _rrd_decode_unit_2_io_rrd_uop_is_amo;
  wire        _rrd_decode_unit_2_io_rrd_uop_uses_ldq;
  wire        _rrd_decode_unit_2_io_rrd_uop_uses_stq;
  wire        _rrd_decode_unit_2_io_rrd_uop_is_sys_pc2epc;
  wire        _rrd_decode_unit_2_io_rrd_uop_is_unique;
  wire        _rrd_decode_unit_2_io_rrd_uop_flush_on_commit;
  wire        _rrd_decode_unit_2_io_rrd_uop_ldst_is_rs1;
  wire [5:0]  _rrd_decode_unit_2_io_rrd_uop_ldst;
  wire [5:0]  _rrd_decode_unit_2_io_rrd_uop_lrs1;
  wire [5:0]  _rrd_decode_unit_2_io_rrd_uop_lrs2;
  wire [5:0]  _rrd_decode_unit_2_io_rrd_uop_lrs3;
  wire        _rrd_decode_unit_2_io_rrd_uop_ldst_val;
  wire [1:0]  _rrd_decode_unit_2_io_rrd_uop_dst_rtype;
  wire [1:0]  _rrd_decode_unit_2_io_rrd_uop_lrs1_rtype;
  wire [1:0]  _rrd_decode_unit_2_io_rrd_uop_lrs2_rtype;
  wire        _rrd_decode_unit_2_io_rrd_uop_frs3_en;
  wire        _rrd_decode_unit_2_io_rrd_uop_fp_val;
  wire        _rrd_decode_unit_2_io_rrd_uop_fp_single;
  wire        _rrd_decode_unit_2_io_rrd_uop_xcpt_pf_if;
  wire        _rrd_decode_unit_2_io_rrd_uop_xcpt_ae_if;
  wire        _rrd_decode_unit_2_io_rrd_uop_xcpt_ma_if;
  wire        _rrd_decode_unit_2_io_rrd_uop_bp_debug_if;
  wire        _rrd_decode_unit_2_io_rrd_uop_bp_xcpt_if;
  wire [1:0]  _rrd_decode_unit_2_io_rrd_uop_debug_fsrc;
  wire [1:0]  _rrd_decode_unit_2_io_rrd_uop_debug_tsrc;
  wire        _rrd_decode_unit_1_io_rrd_valid;
  wire [6:0]  _rrd_decode_unit_1_io_rrd_uop_uopc;
  wire [31:0] _rrd_decode_unit_1_io_rrd_uop_inst;
  wire [31:0] _rrd_decode_unit_1_io_rrd_uop_debug_inst;
  wire        _rrd_decode_unit_1_io_rrd_uop_is_rvc;
  wire [39:0] _rrd_decode_unit_1_io_rrd_uop_debug_pc;
  wire [2:0]  _rrd_decode_unit_1_io_rrd_uop_iq_type;
  wire [9:0]  _rrd_decode_unit_1_io_rrd_uop_fu_code;
  wire [3:0]  _rrd_decode_unit_1_io_rrd_uop_ctrl_br_type;
  wire [1:0]  _rrd_decode_unit_1_io_rrd_uop_ctrl_op1_sel;
  wire [2:0]  _rrd_decode_unit_1_io_rrd_uop_ctrl_op2_sel;
  wire [2:0]  _rrd_decode_unit_1_io_rrd_uop_ctrl_imm_sel;
  wire [3:0]  _rrd_decode_unit_1_io_rrd_uop_ctrl_op_fcn;
  wire        _rrd_decode_unit_1_io_rrd_uop_ctrl_fcn_dw;
  wire [2:0]  _rrd_decode_unit_1_io_rrd_uop_ctrl_csr_cmd;
  wire        _rrd_decode_unit_1_io_rrd_uop_ctrl_is_load;
  wire        _rrd_decode_unit_1_io_rrd_uop_ctrl_is_sta;
  wire        _rrd_decode_unit_1_io_rrd_uop_ctrl_is_std;
  wire [1:0]  _rrd_decode_unit_1_io_rrd_uop_iw_state;
  wire        _rrd_decode_unit_1_io_rrd_uop_is_br;
  wire        _rrd_decode_unit_1_io_rrd_uop_is_jalr;
  wire        _rrd_decode_unit_1_io_rrd_uop_is_jal;
  wire        _rrd_decode_unit_1_io_rrd_uop_is_sfb;
  wire [19:0] _rrd_decode_unit_1_io_rrd_uop_br_mask;
  wire [4:0]  _rrd_decode_unit_1_io_rrd_uop_br_tag;
  wire [5:0]  _rrd_decode_unit_1_io_rrd_uop_ftq_idx;
  wire        _rrd_decode_unit_1_io_rrd_uop_edge_inst;
  wire [5:0]  _rrd_decode_unit_1_io_rrd_uop_pc_lob;
  wire        _rrd_decode_unit_1_io_rrd_uop_taken;
  wire [19:0] _rrd_decode_unit_1_io_rrd_uop_imm_packed;
  wire [11:0] _rrd_decode_unit_1_io_rrd_uop_csr_addr;
  wire [6:0]  _rrd_decode_unit_1_io_rrd_uop_rob_idx;
  wire [4:0]  _rrd_decode_unit_1_io_rrd_uop_ldq_idx;
  wire [4:0]  _rrd_decode_unit_1_io_rrd_uop_stq_idx;
  wire [1:0]  _rrd_decode_unit_1_io_rrd_uop_rxq_idx;
  wire [6:0]  _rrd_decode_unit_1_io_rrd_uop_pdst;
  wire [6:0]  _rrd_decode_unit_1_io_rrd_uop_prs1;
  wire [6:0]  _rrd_decode_unit_1_io_rrd_uop_prs2;
  wire [6:0]  _rrd_decode_unit_1_io_rrd_uop_prs3;
  wire [5:0]  _rrd_decode_unit_1_io_rrd_uop_ppred;
  wire        _rrd_decode_unit_1_io_rrd_uop_prs1_busy;
  wire        _rrd_decode_unit_1_io_rrd_uop_prs2_busy;
  wire        _rrd_decode_unit_1_io_rrd_uop_prs3_busy;
  wire        _rrd_decode_unit_1_io_rrd_uop_ppred_busy;
  wire [6:0]  _rrd_decode_unit_1_io_rrd_uop_stale_pdst;
  wire        _rrd_decode_unit_1_io_rrd_uop_exception;
  wire [63:0] _rrd_decode_unit_1_io_rrd_uop_exc_cause;
  wire        _rrd_decode_unit_1_io_rrd_uop_bypassable;
  wire [4:0]  _rrd_decode_unit_1_io_rrd_uop_mem_cmd;
  wire [1:0]  _rrd_decode_unit_1_io_rrd_uop_mem_size;
  wire        _rrd_decode_unit_1_io_rrd_uop_mem_signed;
  wire        _rrd_decode_unit_1_io_rrd_uop_is_fence;
  wire        _rrd_decode_unit_1_io_rrd_uop_is_fencei;
  wire        _rrd_decode_unit_1_io_rrd_uop_is_amo;
  wire        _rrd_decode_unit_1_io_rrd_uop_uses_ldq;
  wire        _rrd_decode_unit_1_io_rrd_uop_uses_stq;
  wire        _rrd_decode_unit_1_io_rrd_uop_is_sys_pc2epc;
  wire        _rrd_decode_unit_1_io_rrd_uop_is_unique;
  wire        _rrd_decode_unit_1_io_rrd_uop_flush_on_commit;
  wire        _rrd_decode_unit_1_io_rrd_uop_ldst_is_rs1;
  wire [5:0]  _rrd_decode_unit_1_io_rrd_uop_ldst;
  wire [5:0]  _rrd_decode_unit_1_io_rrd_uop_lrs1;
  wire [5:0]  _rrd_decode_unit_1_io_rrd_uop_lrs2;
  wire [5:0]  _rrd_decode_unit_1_io_rrd_uop_lrs3;
  wire        _rrd_decode_unit_1_io_rrd_uop_ldst_val;
  wire [1:0]  _rrd_decode_unit_1_io_rrd_uop_dst_rtype;
  wire [1:0]  _rrd_decode_unit_1_io_rrd_uop_lrs1_rtype;
  wire [1:0]  _rrd_decode_unit_1_io_rrd_uop_lrs2_rtype;
  wire        _rrd_decode_unit_1_io_rrd_uop_frs3_en;
  wire        _rrd_decode_unit_1_io_rrd_uop_fp_val;
  wire        _rrd_decode_unit_1_io_rrd_uop_fp_single;
  wire        _rrd_decode_unit_1_io_rrd_uop_xcpt_pf_if;
  wire        _rrd_decode_unit_1_io_rrd_uop_xcpt_ae_if;
  wire        _rrd_decode_unit_1_io_rrd_uop_xcpt_ma_if;
  wire        _rrd_decode_unit_1_io_rrd_uop_bp_debug_if;
  wire        _rrd_decode_unit_1_io_rrd_uop_bp_xcpt_if;
  wire [1:0]  _rrd_decode_unit_1_io_rrd_uop_debug_fsrc;
  wire [1:0]  _rrd_decode_unit_1_io_rrd_uop_debug_tsrc;
  wire        _rrd_decode_unit_io_rrd_valid;
  wire [6:0]  _rrd_decode_unit_io_rrd_uop_uopc;
  wire [31:0] _rrd_decode_unit_io_rrd_uop_inst;
  wire [31:0] _rrd_decode_unit_io_rrd_uop_debug_inst;
  wire        _rrd_decode_unit_io_rrd_uop_is_rvc;
  wire [39:0] _rrd_decode_unit_io_rrd_uop_debug_pc;
  wire [2:0]  _rrd_decode_unit_io_rrd_uop_iq_type;
  wire [9:0]  _rrd_decode_unit_io_rrd_uop_fu_code;
  wire [3:0]  _rrd_decode_unit_io_rrd_uop_ctrl_br_type;
  wire [1:0]  _rrd_decode_unit_io_rrd_uop_ctrl_op1_sel;
  wire [2:0]  _rrd_decode_unit_io_rrd_uop_ctrl_op2_sel;
  wire [2:0]  _rrd_decode_unit_io_rrd_uop_ctrl_imm_sel;
  wire [3:0]  _rrd_decode_unit_io_rrd_uop_ctrl_op_fcn;
  wire        _rrd_decode_unit_io_rrd_uop_ctrl_fcn_dw;
  wire [2:0]  _rrd_decode_unit_io_rrd_uop_ctrl_csr_cmd;
  wire        _rrd_decode_unit_io_rrd_uop_ctrl_is_load;
  wire        _rrd_decode_unit_io_rrd_uop_ctrl_is_sta;
  wire        _rrd_decode_unit_io_rrd_uop_ctrl_is_std;
  wire [1:0]  _rrd_decode_unit_io_rrd_uop_iw_state;
  wire        _rrd_decode_unit_io_rrd_uop_is_br;
  wire        _rrd_decode_unit_io_rrd_uop_is_jalr;
  wire        _rrd_decode_unit_io_rrd_uop_is_jal;
  wire        _rrd_decode_unit_io_rrd_uop_is_sfb;
  wire [19:0] _rrd_decode_unit_io_rrd_uop_br_mask;
  wire [4:0]  _rrd_decode_unit_io_rrd_uop_br_tag;
  wire [5:0]  _rrd_decode_unit_io_rrd_uop_ftq_idx;
  wire        _rrd_decode_unit_io_rrd_uop_edge_inst;
  wire [5:0]  _rrd_decode_unit_io_rrd_uop_pc_lob;
  wire        _rrd_decode_unit_io_rrd_uop_taken;
  wire [19:0] _rrd_decode_unit_io_rrd_uop_imm_packed;
  wire [11:0] _rrd_decode_unit_io_rrd_uop_csr_addr;
  wire [6:0]  _rrd_decode_unit_io_rrd_uop_rob_idx;
  wire [4:0]  _rrd_decode_unit_io_rrd_uop_ldq_idx;
  wire [4:0]  _rrd_decode_unit_io_rrd_uop_stq_idx;
  wire [1:0]  _rrd_decode_unit_io_rrd_uop_rxq_idx;
  wire [6:0]  _rrd_decode_unit_io_rrd_uop_pdst;
  wire [6:0]  _rrd_decode_unit_io_rrd_uop_prs1;
  wire [6:0]  _rrd_decode_unit_io_rrd_uop_prs2;
  wire [6:0]  _rrd_decode_unit_io_rrd_uop_prs3;
  wire [5:0]  _rrd_decode_unit_io_rrd_uop_ppred;
  wire        _rrd_decode_unit_io_rrd_uop_prs1_busy;
  wire        _rrd_decode_unit_io_rrd_uop_prs2_busy;
  wire        _rrd_decode_unit_io_rrd_uop_prs3_busy;
  wire        _rrd_decode_unit_io_rrd_uop_ppred_busy;
  wire [6:0]  _rrd_decode_unit_io_rrd_uop_stale_pdst;
  wire        _rrd_decode_unit_io_rrd_uop_exception;
  wire [63:0] _rrd_decode_unit_io_rrd_uop_exc_cause;
  wire        _rrd_decode_unit_io_rrd_uop_bypassable;
  wire [4:0]  _rrd_decode_unit_io_rrd_uop_mem_cmd;
  wire [1:0]  _rrd_decode_unit_io_rrd_uop_mem_size;
  wire        _rrd_decode_unit_io_rrd_uop_mem_signed;
  wire        _rrd_decode_unit_io_rrd_uop_is_fence;
  wire        _rrd_decode_unit_io_rrd_uop_is_fencei;
  wire        _rrd_decode_unit_io_rrd_uop_is_amo;
  wire        _rrd_decode_unit_io_rrd_uop_uses_ldq;
  wire        _rrd_decode_unit_io_rrd_uop_uses_stq;
  wire        _rrd_decode_unit_io_rrd_uop_is_sys_pc2epc;
  wire        _rrd_decode_unit_io_rrd_uop_is_unique;
  wire        _rrd_decode_unit_io_rrd_uop_flush_on_commit;
  wire        _rrd_decode_unit_io_rrd_uop_ldst_is_rs1;
  wire [5:0]  _rrd_decode_unit_io_rrd_uop_ldst;
  wire [5:0]  _rrd_decode_unit_io_rrd_uop_lrs1;
  wire [5:0]  _rrd_decode_unit_io_rrd_uop_lrs2;
  wire [5:0]  _rrd_decode_unit_io_rrd_uop_lrs3;
  wire        _rrd_decode_unit_io_rrd_uop_ldst_val;
  wire [1:0]  _rrd_decode_unit_io_rrd_uop_dst_rtype;
  wire [1:0]  _rrd_decode_unit_io_rrd_uop_lrs1_rtype;
  wire [1:0]  _rrd_decode_unit_io_rrd_uop_lrs2_rtype;
  wire        _rrd_decode_unit_io_rrd_uop_frs3_en;
  wire        _rrd_decode_unit_io_rrd_uop_fp_val;
  wire        _rrd_decode_unit_io_rrd_uop_fp_single;
  wire        _rrd_decode_unit_io_rrd_uop_xcpt_pf_if;
  wire        _rrd_decode_unit_io_rrd_uop_xcpt_ae_if;
  wire        _rrd_decode_unit_io_rrd_uop_xcpt_ma_if;
  wire        _rrd_decode_unit_io_rrd_uop_bp_debug_if;
  wire        _rrd_decode_unit_io_rrd_uop_bp_xcpt_if;
  wire [1:0]  _rrd_decode_unit_io_rrd_uop_debug_fsrc;
  wire [1:0]  _rrd_decode_unit_io_rrd_uop_debug_tsrc;
  reg         exe_reg_valids_0;
  reg         exe_reg_valids_1;
  reg         exe_reg_valids_2;
  reg         exe_reg_valids_3;
  reg         exe_reg_valids_4;
  reg         exe_reg_valids_5;
  reg  [6:0]  exe_reg_uops_0_uopc;
  reg  [31:0] exe_reg_uops_0_inst;
  reg  [31:0] exe_reg_uops_0_debug_inst;
  reg         exe_reg_uops_0_is_rvc;
  reg  [39:0] exe_reg_uops_0_debug_pc;
  reg  [2:0]  exe_reg_uops_0_iq_type;
  reg  [9:0]  exe_reg_uops_0_fu_code;
  reg  [3:0]  exe_reg_uops_0_ctrl_br_type;
  reg  [1:0]  exe_reg_uops_0_ctrl_op1_sel;
  reg  [2:0]  exe_reg_uops_0_ctrl_op2_sel;
  reg  [2:0]  exe_reg_uops_0_ctrl_imm_sel;
  reg  [3:0]  exe_reg_uops_0_ctrl_op_fcn;
  reg         exe_reg_uops_0_ctrl_fcn_dw;
  reg  [2:0]  exe_reg_uops_0_ctrl_csr_cmd;
  reg         exe_reg_uops_0_ctrl_is_load;
  reg         exe_reg_uops_0_ctrl_is_sta;
  reg         exe_reg_uops_0_ctrl_is_std;
  reg  [1:0]  exe_reg_uops_0_iw_state;
  reg         exe_reg_uops_0_is_br;
  reg         exe_reg_uops_0_is_jalr;
  reg         exe_reg_uops_0_is_jal;
  reg         exe_reg_uops_0_is_sfb;
  reg  [19:0] exe_reg_uops_0_br_mask;
  reg  [4:0]  exe_reg_uops_0_br_tag;
  reg  [5:0]  exe_reg_uops_0_ftq_idx;
  reg         exe_reg_uops_0_edge_inst;
  reg  [5:0]  exe_reg_uops_0_pc_lob;
  reg         exe_reg_uops_0_taken;
  reg  [19:0] exe_reg_uops_0_imm_packed;
  reg  [11:0] exe_reg_uops_0_csr_addr;
  reg  [6:0]  exe_reg_uops_0_rob_idx;
  reg  [4:0]  exe_reg_uops_0_ldq_idx;
  reg  [4:0]  exe_reg_uops_0_stq_idx;
  reg  [1:0]  exe_reg_uops_0_rxq_idx;
  reg  [6:0]  exe_reg_uops_0_pdst;
  reg  [6:0]  exe_reg_uops_0_prs1;
  reg  [6:0]  exe_reg_uops_0_prs2;
  reg  [6:0]  exe_reg_uops_0_prs3;
  reg  [5:0]  exe_reg_uops_0_ppred;
  reg         exe_reg_uops_0_prs1_busy;
  reg         exe_reg_uops_0_prs2_busy;
  reg         exe_reg_uops_0_prs3_busy;
  reg         exe_reg_uops_0_ppred_busy;
  reg  [6:0]  exe_reg_uops_0_stale_pdst;
  reg         exe_reg_uops_0_exception;
  reg  [63:0] exe_reg_uops_0_exc_cause;
  reg         exe_reg_uops_0_bypassable;
  reg  [4:0]  exe_reg_uops_0_mem_cmd;
  reg  [1:0]  exe_reg_uops_0_mem_size;
  reg         exe_reg_uops_0_mem_signed;
  reg         exe_reg_uops_0_is_fence;
  reg         exe_reg_uops_0_is_fencei;
  reg         exe_reg_uops_0_is_amo;
  reg         exe_reg_uops_0_uses_ldq;
  reg         exe_reg_uops_0_uses_stq;
  reg         exe_reg_uops_0_is_sys_pc2epc;
  reg         exe_reg_uops_0_is_unique;
  reg         exe_reg_uops_0_flush_on_commit;
  reg         exe_reg_uops_0_ldst_is_rs1;
  reg  [5:0]  exe_reg_uops_0_ldst;
  reg  [5:0]  exe_reg_uops_0_lrs1;
  reg  [5:0]  exe_reg_uops_0_lrs2;
  reg  [5:0]  exe_reg_uops_0_lrs3;
  reg         exe_reg_uops_0_ldst_val;
  reg  [1:0]  exe_reg_uops_0_dst_rtype;
  reg  [1:0]  exe_reg_uops_0_lrs1_rtype;
  reg  [1:0]  exe_reg_uops_0_lrs2_rtype;
  reg         exe_reg_uops_0_frs3_en;
  reg         exe_reg_uops_0_fp_val;
  reg         exe_reg_uops_0_fp_single;
  reg         exe_reg_uops_0_xcpt_pf_if;
  reg         exe_reg_uops_0_xcpt_ae_if;
  reg         exe_reg_uops_0_xcpt_ma_if;
  reg         exe_reg_uops_0_bp_debug_if;
  reg         exe_reg_uops_0_bp_xcpt_if;
  reg  [1:0]  exe_reg_uops_0_debug_fsrc;
  reg  [1:0]  exe_reg_uops_0_debug_tsrc;
  reg  [6:0]  exe_reg_uops_1_uopc;
  reg  [31:0] exe_reg_uops_1_inst;
  reg  [31:0] exe_reg_uops_1_debug_inst;
  reg         exe_reg_uops_1_is_rvc;
  reg  [39:0] exe_reg_uops_1_debug_pc;
  reg  [2:0]  exe_reg_uops_1_iq_type;
  reg  [9:0]  exe_reg_uops_1_fu_code;
  reg  [3:0]  exe_reg_uops_1_ctrl_br_type;
  reg  [1:0]  exe_reg_uops_1_ctrl_op1_sel;
  reg  [2:0]  exe_reg_uops_1_ctrl_op2_sel;
  reg  [2:0]  exe_reg_uops_1_ctrl_imm_sel;
  reg  [3:0]  exe_reg_uops_1_ctrl_op_fcn;
  reg         exe_reg_uops_1_ctrl_fcn_dw;
  reg  [2:0]  exe_reg_uops_1_ctrl_csr_cmd;
  reg         exe_reg_uops_1_ctrl_is_load;
  reg         exe_reg_uops_1_ctrl_is_sta;
  reg         exe_reg_uops_1_ctrl_is_std;
  reg  [1:0]  exe_reg_uops_1_iw_state;
  reg         exe_reg_uops_1_is_br;
  reg         exe_reg_uops_1_is_jalr;
  reg         exe_reg_uops_1_is_jal;
  reg         exe_reg_uops_1_is_sfb;
  reg  [19:0] exe_reg_uops_1_br_mask;
  reg  [4:0]  exe_reg_uops_1_br_tag;
  reg  [5:0]  exe_reg_uops_1_ftq_idx;
  reg         exe_reg_uops_1_edge_inst;
  reg  [5:0]  exe_reg_uops_1_pc_lob;
  reg         exe_reg_uops_1_taken;
  reg  [19:0] exe_reg_uops_1_imm_packed;
  reg  [11:0] exe_reg_uops_1_csr_addr;
  reg  [6:0]  exe_reg_uops_1_rob_idx;
  reg  [4:0]  exe_reg_uops_1_ldq_idx;
  reg  [4:0]  exe_reg_uops_1_stq_idx;
  reg  [1:0]  exe_reg_uops_1_rxq_idx;
  reg  [6:0]  exe_reg_uops_1_pdst;
  reg  [6:0]  exe_reg_uops_1_prs1;
  reg  [6:0]  exe_reg_uops_1_prs2;
  reg  [6:0]  exe_reg_uops_1_prs3;
  reg  [5:0]  exe_reg_uops_1_ppred;
  reg         exe_reg_uops_1_prs1_busy;
  reg         exe_reg_uops_1_prs2_busy;
  reg         exe_reg_uops_1_prs3_busy;
  reg         exe_reg_uops_1_ppred_busy;
  reg  [6:0]  exe_reg_uops_1_stale_pdst;
  reg         exe_reg_uops_1_exception;
  reg  [63:0] exe_reg_uops_1_exc_cause;
  reg         exe_reg_uops_1_bypassable;
  reg  [4:0]  exe_reg_uops_1_mem_cmd;
  reg  [1:0]  exe_reg_uops_1_mem_size;
  reg         exe_reg_uops_1_mem_signed;
  reg         exe_reg_uops_1_is_fence;
  reg         exe_reg_uops_1_is_fencei;
  reg         exe_reg_uops_1_is_amo;
  reg         exe_reg_uops_1_uses_ldq;
  reg         exe_reg_uops_1_uses_stq;
  reg         exe_reg_uops_1_is_sys_pc2epc;
  reg         exe_reg_uops_1_is_unique;
  reg         exe_reg_uops_1_flush_on_commit;
  reg         exe_reg_uops_1_ldst_is_rs1;
  reg  [5:0]  exe_reg_uops_1_ldst;
  reg  [5:0]  exe_reg_uops_1_lrs1;
  reg  [5:0]  exe_reg_uops_1_lrs2;
  reg  [5:0]  exe_reg_uops_1_lrs3;
  reg         exe_reg_uops_1_ldst_val;
  reg  [1:0]  exe_reg_uops_1_dst_rtype;
  reg  [1:0]  exe_reg_uops_1_lrs1_rtype;
  reg  [1:0]  exe_reg_uops_1_lrs2_rtype;
  reg         exe_reg_uops_1_frs3_en;
  reg         exe_reg_uops_1_fp_val;
  reg         exe_reg_uops_1_fp_single;
  reg         exe_reg_uops_1_xcpt_pf_if;
  reg         exe_reg_uops_1_xcpt_ae_if;
  reg         exe_reg_uops_1_xcpt_ma_if;
  reg         exe_reg_uops_1_bp_debug_if;
  reg         exe_reg_uops_1_bp_xcpt_if;
  reg  [1:0]  exe_reg_uops_1_debug_fsrc;
  reg  [1:0]  exe_reg_uops_1_debug_tsrc;
  reg  [6:0]  exe_reg_uops_2_uopc;
  reg  [31:0] exe_reg_uops_2_inst;
  reg  [31:0] exe_reg_uops_2_debug_inst;
  reg         exe_reg_uops_2_is_rvc;
  reg  [39:0] exe_reg_uops_2_debug_pc;
  reg  [2:0]  exe_reg_uops_2_iq_type;
  reg  [9:0]  exe_reg_uops_2_fu_code;
  reg  [3:0]  exe_reg_uops_2_ctrl_br_type;
  reg  [1:0]  exe_reg_uops_2_ctrl_op1_sel;
  reg  [2:0]  exe_reg_uops_2_ctrl_op2_sel;
  reg  [2:0]  exe_reg_uops_2_ctrl_imm_sel;
  reg  [3:0]  exe_reg_uops_2_ctrl_op_fcn;
  reg         exe_reg_uops_2_ctrl_fcn_dw;
  reg  [2:0]  exe_reg_uops_2_ctrl_csr_cmd;
  reg         exe_reg_uops_2_ctrl_is_load;
  reg         exe_reg_uops_2_ctrl_is_sta;
  reg         exe_reg_uops_2_ctrl_is_std;
  reg  [1:0]  exe_reg_uops_2_iw_state;
  reg         exe_reg_uops_2_is_br;
  reg         exe_reg_uops_2_is_jalr;
  reg         exe_reg_uops_2_is_jal;
  reg         exe_reg_uops_2_is_sfb;
  reg  [19:0] exe_reg_uops_2_br_mask;
  reg  [4:0]  exe_reg_uops_2_br_tag;
  reg  [5:0]  exe_reg_uops_2_ftq_idx;
  reg         exe_reg_uops_2_edge_inst;
  reg  [5:0]  exe_reg_uops_2_pc_lob;
  reg         exe_reg_uops_2_taken;
  reg  [19:0] exe_reg_uops_2_imm_packed;
  reg  [11:0] exe_reg_uops_2_csr_addr;
  reg  [6:0]  exe_reg_uops_2_rob_idx;
  reg  [4:0]  exe_reg_uops_2_ldq_idx;
  reg  [4:0]  exe_reg_uops_2_stq_idx;
  reg  [1:0]  exe_reg_uops_2_rxq_idx;
  reg  [6:0]  exe_reg_uops_2_pdst;
  reg  [6:0]  exe_reg_uops_2_prs1;
  reg  [6:0]  exe_reg_uops_2_prs2;
  reg  [6:0]  exe_reg_uops_2_prs3;
  reg  [5:0]  exe_reg_uops_2_ppred;
  reg         exe_reg_uops_2_prs1_busy;
  reg         exe_reg_uops_2_prs2_busy;
  reg         exe_reg_uops_2_prs3_busy;
  reg         exe_reg_uops_2_ppred_busy;
  reg  [6:0]  exe_reg_uops_2_stale_pdst;
  reg         exe_reg_uops_2_exception;
  reg  [63:0] exe_reg_uops_2_exc_cause;
  reg         exe_reg_uops_2_bypassable;
  reg  [4:0]  exe_reg_uops_2_mem_cmd;
  reg  [1:0]  exe_reg_uops_2_mem_size;
  reg         exe_reg_uops_2_mem_signed;
  reg         exe_reg_uops_2_is_fence;
  reg         exe_reg_uops_2_is_fencei;
  reg         exe_reg_uops_2_is_amo;
  reg         exe_reg_uops_2_uses_ldq;
  reg         exe_reg_uops_2_uses_stq;
  reg         exe_reg_uops_2_is_sys_pc2epc;
  reg         exe_reg_uops_2_is_unique;
  reg         exe_reg_uops_2_flush_on_commit;
  reg         exe_reg_uops_2_ldst_is_rs1;
  reg  [5:0]  exe_reg_uops_2_ldst;
  reg  [5:0]  exe_reg_uops_2_lrs1;
  reg  [5:0]  exe_reg_uops_2_lrs2;
  reg  [5:0]  exe_reg_uops_2_lrs3;
  reg         exe_reg_uops_2_ldst_val;
  reg  [1:0]  exe_reg_uops_2_dst_rtype;
  reg  [1:0]  exe_reg_uops_2_lrs1_rtype;
  reg  [1:0]  exe_reg_uops_2_lrs2_rtype;
  reg         exe_reg_uops_2_frs3_en;
  reg         exe_reg_uops_2_fp_val;
  reg         exe_reg_uops_2_fp_single;
  reg         exe_reg_uops_2_xcpt_pf_if;
  reg         exe_reg_uops_2_xcpt_ae_if;
  reg         exe_reg_uops_2_xcpt_ma_if;
  reg         exe_reg_uops_2_bp_debug_if;
  reg         exe_reg_uops_2_bp_xcpt_if;
  reg  [1:0]  exe_reg_uops_2_debug_fsrc;
  reg  [1:0]  exe_reg_uops_2_debug_tsrc;
  reg  [6:0]  exe_reg_uops_3_uopc;
  reg         exe_reg_uops_3_is_rvc;
  reg  [9:0]  exe_reg_uops_3_fu_code;
  reg  [3:0]  exe_reg_uops_3_ctrl_br_type;
  reg  [1:0]  exe_reg_uops_3_ctrl_op1_sel;
  reg  [2:0]  exe_reg_uops_3_ctrl_op2_sel;
  reg  [2:0]  exe_reg_uops_3_ctrl_imm_sel;
  reg  [3:0]  exe_reg_uops_3_ctrl_op_fcn;
  reg         exe_reg_uops_3_ctrl_fcn_dw;
  reg  [2:0]  exe_reg_uops_3_ctrl_csr_cmd;
  reg         exe_reg_uops_3_is_br;
  reg         exe_reg_uops_3_is_jalr;
  reg         exe_reg_uops_3_is_jal;
  reg         exe_reg_uops_3_is_sfb;
  reg  [19:0] exe_reg_uops_3_br_mask;
  reg  [4:0]  exe_reg_uops_3_br_tag;
  reg  [5:0]  exe_reg_uops_3_ftq_idx;
  reg         exe_reg_uops_3_edge_inst;
  reg  [5:0]  exe_reg_uops_3_pc_lob;
  reg         exe_reg_uops_3_taken;
  reg  [19:0] exe_reg_uops_3_imm_packed;
  reg  [6:0]  exe_reg_uops_3_rob_idx;
  reg  [4:0]  exe_reg_uops_3_ldq_idx;
  reg  [4:0]  exe_reg_uops_3_stq_idx;
  reg  [6:0]  exe_reg_uops_3_pdst;
  reg  [6:0]  exe_reg_uops_3_prs1;
  reg         exe_reg_uops_3_bypassable;
  reg         exe_reg_uops_3_is_amo;
  reg         exe_reg_uops_3_uses_stq;
  reg  [1:0]  exe_reg_uops_3_dst_rtype;
  reg  [6:0]  exe_reg_uops_4_uopc;
  reg         exe_reg_uops_4_is_rvc;
  reg  [9:0]  exe_reg_uops_4_fu_code;
  reg  [3:0]  exe_reg_uops_4_ctrl_br_type;
  reg  [1:0]  exe_reg_uops_4_ctrl_op1_sel;
  reg  [2:0]  exe_reg_uops_4_ctrl_op2_sel;
  reg  [2:0]  exe_reg_uops_4_ctrl_imm_sel;
  reg  [3:0]  exe_reg_uops_4_ctrl_op_fcn;
  reg         exe_reg_uops_4_ctrl_fcn_dw;
  reg         exe_reg_uops_4_is_br;
  reg         exe_reg_uops_4_is_jalr;
  reg         exe_reg_uops_4_is_jal;
  reg         exe_reg_uops_4_is_sfb;
  reg  [19:0] exe_reg_uops_4_br_mask;
  reg  [4:0]  exe_reg_uops_4_br_tag;
  reg  [5:0]  exe_reg_uops_4_ftq_idx;
  reg         exe_reg_uops_4_edge_inst;
  reg  [5:0]  exe_reg_uops_4_pc_lob;
  reg         exe_reg_uops_4_taken;
  reg  [19:0] exe_reg_uops_4_imm_packed;
  reg  [6:0]  exe_reg_uops_4_rob_idx;
  reg  [4:0]  exe_reg_uops_4_ldq_idx;
  reg  [4:0]  exe_reg_uops_4_stq_idx;
  reg  [6:0]  exe_reg_uops_4_pdst;
  reg  [6:0]  exe_reg_uops_4_prs1;
  reg         exe_reg_uops_4_bypassable;
  reg         exe_reg_uops_4_is_amo;
  reg         exe_reg_uops_4_uses_stq;
  reg  [1:0]  exe_reg_uops_4_dst_rtype;
  reg  [6:0]  exe_reg_uops_5_uopc;
  reg         exe_reg_uops_5_is_rvc;
  reg  [9:0]  exe_reg_uops_5_fu_code;
  reg  [3:0]  exe_reg_uops_5_ctrl_br_type;
  reg  [1:0]  exe_reg_uops_5_ctrl_op1_sel;
  reg  [2:0]  exe_reg_uops_5_ctrl_op2_sel;
  reg  [2:0]  exe_reg_uops_5_ctrl_imm_sel;
  reg  [3:0]  exe_reg_uops_5_ctrl_op_fcn;
  reg         exe_reg_uops_5_ctrl_fcn_dw;
  reg  [2:0]  exe_reg_uops_5_ctrl_csr_cmd;
  reg         exe_reg_uops_5_is_br;
  reg         exe_reg_uops_5_is_jalr;
  reg         exe_reg_uops_5_is_jal;
  reg         exe_reg_uops_5_is_sfb;
  reg  [19:0] exe_reg_uops_5_br_mask;
  reg  [4:0]  exe_reg_uops_5_br_tag;
  reg  [5:0]  exe_reg_uops_5_ftq_idx;
  reg         exe_reg_uops_5_edge_inst;
  reg  [5:0]  exe_reg_uops_5_pc_lob;
  reg         exe_reg_uops_5_taken;
  reg  [19:0] exe_reg_uops_5_imm_packed;
  reg  [6:0]  exe_reg_uops_5_rob_idx;
  reg  [4:0]  exe_reg_uops_5_ldq_idx;
  reg  [4:0]  exe_reg_uops_5_stq_idx;
  reg  [6:0]  exe_reg_uops_5_pdst;
  reg  [6:0]  exe_reg_uops_5_prs1;
  reg         exe_reg_uops_5_bypassable;
  reg         exe_reg_uops_5_is_amo;
  reg         exe_reg_uops_5_uses_stq;
  reg  [1:0]  exe_reg_uops_5_dst_rtype;
  reg  [63:0] exe_reg_rs1_data_0;
  reg  [63:0] exe_reg_rs1_data_1;
  reg  [63:0] exe_reg_rs1_data_2;
  reg  [63:0] exe_reg_rs1_data_3;
  reg  [63:0] exe_reg_rs1_data_4;
  reg  [63:0] exe_reg_rs1_data_5;
  reg  [63:0] exe_reg_rs2_data_0;
  reg  [63:0] exe_reg_rs2_data_1;
  reg  [63:0] exe_reg_rs2_data_2;
  reg  [63:0] exe_reg_rs2_data_3;
  reg  [63:0] exe_reg_rs2_data_4;
  reg  [63:0] exe_reg_rs2_data_5;
  reg         rrd_valids_0_REG;
  reg  [6:0]  rrd_uops_0_REG_uopc;
  reg  [31:0] rrd_uops_0_REG_inst;
  reg  [31:0] rrd_uops_0_REG_debug_inst;
  reg         rrd_uops_0_REG_is_rvc;
  reg  [39:0] rrd_uops_0_REG_debug_pc;
  reg  [2:0]  rrd_uops_0_REG_iq_type;
  reg  [9:0]  rrd_uops_0_REG_fu_code;
  reg  [3:0]  rrd_uops_0_REG_ctrl_br_type;
  reg  [1:0]  rrd_uops_0_REG_ctrl_op1_sel;
  reg  [2:0]  rrd_uops_0_REG_ctrl_op2_sel;
  reg  [2:0]  rrd_uops_0_REG_ctrl_imm_sel;
  reg  [3:0]  rrd_uops_0_REG_ctrl_op_fcn;
  reg         rrd_uops_0_REG_ctrl_fcn_dw;
  reg  [2:0]  rrd_uops_0_REG_ctrl_csr_cmd;
  reg         rrd_uops_0_REG_ctrl_is_load;
  reg         rrd_uops_0_REG_ctrl_is_sta;
  reg         rrd_uops_0_REG_ctrl_is_std;
  reg  [1:0]  rrd_uops_0_REG_iw_state;
  reg         rrd_uops_0_REG_is_br;
  reg         rrd_uops_0_REG_is_jalr;
  reg         rrd_uops_0_REG_is_jal;
  reg         rrd_uops_0_REG_is_sfb;
  reg  [19:0] rrd_uops_0_REG_br_mask;
  reg  [4:0]  rrd_uops_0_REG_br_tag;
  reg  [5:0]  rrd_uops_0_REG_ftq_idx;
  reg         rrd_uops_0_REG_edge_inst;
  reg  [5:0]  rrd_uops_0_REG_pc_lob;
  reg         rrd_uops_0_REG_taken;
  reg  [19:0] rrd_uops_0_REG_imm_packed;
  reg  [11:0] rrd_uops_0_REG_csr_addr;
  reg  [6:0]  rrd_uops_0_REG_rob_idx;
  reg  [4:0]  rrd_uops_0_REG_ldq_idx;
  reg  [4:0]  rrd_uops_0_REG_stq_idx;
  reg  [1:0]  rrd_uops_0_REG_rxq_idx;
  reg  [6:0]  rrd_uops_0_REG_pdst;
  reg  [6:0]  rrd_uops_0_REG_prs1;
  reg  [6:0]  rrd_uops_0_REG_prs2;
  reg  [6:0]  rrd_uops_0_REG_prs3;
  reg  [5:0]  rrd_uops_0_REG_ppred;
  reg         rrd_uops_0_REG_prs1_busy;
  reg         rrd_uops_0_REG_prs2_busy;
  reg         rrd_uops_0_REG_prs3_busy;
  reg         rrd_uops_0_REG_ppred_busy;
  reg  [6:0]  rrd_uops_0_REG_stale_pdst;
  reg         rrd_uops_0_REG_exception;
  reg  [63:0] rrd_uops_0_REG_exc_cause;
  reg         rrd_uops_0_REG_bypassable;
  reg  [4:0]  rrd_uops_0_REG_mem_cmd;
  reg  [1:0]  rrd_uops_0_REG_mem_size;
  reg         rrd_uops_0_REG_mem_signed;
  reg         rrd_uops_0_REG_is_fence;
  reg         rrd_uops_0_REG_is_fencei;
  reg         rrd_uops_0_REG_is_amo;
  reg         rrd_uops_0_REG_uses_ldq;
  reg         rrd_uops_0_REG_uses_stq;
  reg         rrd_uops_0_REG_is_sys_pc2epc;
  reg         rrd_uops_0_REG_is_unique;
  reg         rrd_uops_0_REG_flush_on_commit;
  reg         rrd_uops_0_REG_ldst_is_rs1;
  reg  [5:0]  rrd_uops_0_REG_ldst;
  reg  [5:0]  rrd_uops_0_REG_lrs1;
  reg  [5:0]  rrd_uops_0_REG_lrs2;
  reg  [5:0]  rrd_uops_0_REG_lrs3;
  reg         rrd_uops_0_REG_ldst_val;
  reg  [1:0]  rrd_uops_0_REG_dst_rtype;
  reg  [1:0]  rrd_uops_0_REG_lrs1_rtype;
  reg  [1:0]  rrd_uops_0_REG_lrs2_rtype;
  reg         rrd_uops_0_REG_frs3_en;
  reg         rrd_uops_0_REG_fp_val;
  reg         rrd_uops_0_REG_fp_single;
  reg         rrd_uops_0_REG_xcpt_pf_if;
  reg         rrd_uops_0_REG_xcpt_ae_if;
  reg         rrd_uops_0_REG_xcpt_ma_if;
  reg         rrd_uops_0_REG_bp_debug_if;
  reg         rrd_uops_0_REG_bp_xcpt_if;
  reg  [1:0]  rrd_uops_0_REG_debug_fsrc;
  reg  [1:0]  rrd_uops_0_REG_debug_tsrc;
  reg         rrd_valids_1_REG;
  reg  [6:0]  rrd_uops_1_REG_uopc;
  reg  [31:0] rrd_uops_1_REG_inst;
  reg  [31:0] rrd_uops_1_REG_debug_inst;
  reg         rrd_uops_1_REG_is_rvc;
  reg  [39:0] rrd_uops_1_REG_debug_pc;
  reg  [2:0]  rrd_uops_1_REG_iq_type;
  reg  [9:0]  rrd_uops_1_REG_fu_code;
  reg  [3:0]  rrd_uops_1_REG_ctrl_br_type;
  reg  [1:0]  rrd_uops_1_REG_ctrl_op1_sel;
  reg  [2:0]  rrd_uops_1_REG_ctrl_op2_sel;
  reg  [2:0]  rrd_uops_1_REG_ctrl_imm_sel;
  reg  [3:0]  rrd_uops_1_REG_ctrl_op_fcn;
  reg         rrd_uops_1_REG_ctrl_fcn_dw;
  reg  [2:0]  rrd_uops_1_REG_ctrl_csr_cmd;
  reg         rrd_uops_1_REG_ctrl_is_load;
  reg         rrd_uops_1_REG_ctrl_is_sta;
  reg         rrd_uops_1_REG_ctrl_is_std;
  reg  [1:0]  rrd_uops_1_REG_iw_state;
  reg         rrd_uops_1_REG_is_br;
  reg         rrd_uops_1_REG_is_jalr;
  reg         rrd_uops_1_REG_is_jal;
  reg         rrd_uops_1_REG_is_sfb;
  reg  [19:0] rrd_uops_1_REG_br_mask;
  reg  [4:0]  rrd_uops_1_REG_br_tag;
  reg  [5:0]  rrd_uops_1_REG_ftq_idx;
  reg         rrd_uops_1_REG_edge_inst;
  reg  [5:0]  rrd_uops_1_REG_pc_lob;
  reg         rrd_uops_1_REG_taken;
  reg  [19:0] rrd_uops_1_REG_imm_packed;
  reg  [11:0] rrd_uops_1_REG_csr_addr;
  reg  [6:0]  rrd_uops_1_REG_rob_idx;
  reg  [4:0]  rrd_uops_1_REG_ldq_idx;
  reg  [4:0]  rrd_uops_1_REG_stq_idx;
  reg  [1:0]  rrd_uops_1_REG_rxq_idx;
  reg  [6:0]  rrd_uops_1_REG_pdst;
  reg  [6:0]  rrd_uops_1_REG_prs1;
  reg  [6:0]  rrd_uops_1_REG_prs2;
  reg  [6:0]  rrd_uops_1_REG_prs3;
  reg  [5:0]  rrd_uops_1_REG_ppred;
  reg         rrd_uops_1_REG_prs1_busy;
  reg         rrd_uops_1_REG_prs2_busy;
  reg         rrd_uops_1_REG_prs3_busy;
  reg         rrd_uops_1_REG_ppred_busy;
  reg  [6:0]  rrd_uops_1_REG_stale_pdst;
  reg         rrd_uops_1_REG_exception;
  reg  [63:0] rrd_uops_1_REG_exc_cause;
  reg         rrd_uops_1_REG_bypassable;
  reg  [4:0]  rrd_uops_1_REG_mem_cmd;
  reg  [1:0]  rrd_uops_1_REG_mem_size;
  reg         rrd_uops_1_REG_mem_signed;
  reg         rrd_uops_1_REG_is_fence;
  reg         rrd_uops_1_REG_is_fencei;
  reg         rrd_uops_1_REG_is_amo;
  reg         rrd_uops_1_REG_uses_ldq;
  reg         rrd_uops_1_REG_uses_stq;
  reg         rrd_uops_1_REG_is_sys_pc2epc;
  reg         rrd_uops_1_REG_is_unique;
  reg         rrd_uops_1_REG_flush_on_commit;
  reg         rrd_uops_1_REG_ldst_is_rs1;
  reg  [5:0]  rrd_uops_1_REG_ldst;
  reg  [5:0]  rrd_uops_1_REG_lrs1;
  reg  [5:0]  rrd_uops_1_REG_lrs2;
  reg  [5:0]  rrd_uops_1_REG_lrs3;
  reg         rrd_uops_1_REG_ldst_val;
  reg  [1:0]  rrd_uops_1_REG_dst_rtype;
  reg  [1:0]  rrd_uops_1_REG_lrs1_rtype;
  reg  [1:0]  rrd_uops_1_REG_lrs2_rtype;
  reg         rrd_uops_1_REG_frs3_en;
  reg         rrd_uops_1_REG_fp_val;
  reg         rrd_uops_1_REG_fp_single;
  reg         rrd_uops_1_REG_xcpt_pf_if;
  reg         rrd_uops_1_REG_xcpt_ae_if;
  reg         rrd_uops_1_REG_xcpt_ma_if;
  reg         rrd_uops_1_REG_bp_debug_if;
  reg         rrd_uops_1_REG_bp_xcpt_if;
  reg  [1:0]  rrd_uops_1_REG_debug_fsrc;
  reg  [1:0]  rrd_uops_1_REG_debug_tsrc;
  reg         rrd_valids_2_REG;
  reg  [6:0]  rrd_uops_2_REG_uopc;
  reg  [31:0] rrd_uops_2_REG_inst;
  reg  [31:0] rrd_uops_2_REG_debug_inst;
  reg         rrd_uops_2_REG_is_rvc;
  reg  [39:0] rrd_uops_2_REG_debug_pc;
  reg  [2:0]  rrd_uops_2_REG_iq_type;
  reg  [9:0]  rrd_uops_2_REG_fu_code;
  reg  [3:0]  rrd_uops_2_REG_ctrl_br_type;
  reg  [1:0]  rrd_uops_2_REG_ctrl_op1_sel;
  reg  [2:0]  rrd_uops_2_REG_ctrl_op2_sel;
  reg  [2:0]  rrd_uops_2_REG_ctrl_imm_sel;
  reg  [3:0]  rrd_uops_2_REG_ctrl_op_fcn;
  reg         rrd_uops_2_REG_ctrl_fcn_dw;
  reg  [2:0]  rrd_uops_2_REG_ctrl_csr_cmd;
  reg         rrd_uops_2_REG_ctrl_is_load;
  reg         rrd_uops_2_REG_ctrl_is_sta;
  reg         rrd_uops_2_REG_ctrl_is_std;
  reg  [1:0]  rrd_uops_2_REG_iw_state;
  reg         rrd_uops_2_REG_is_br;
  reg         rrd_uops_2_REG_is_jalr;
  reg         rrd_uops_2_REG_is_jal;
  reg         rrd_uops_2_REG_is_sfb;
  reg  [19:0] rrd_uops_2_REG_br_mask;
  reg  [4:0]  rrd_uops_2_REG_br_tag;
  reg  [5:0]  rrd_uops_2_REG_ftq_idx;
  reg         rrd_uops_2_REG_edge_inst;
  reg  [5:0]  rrd_uops_2_REG_pc_lob;
  reg         rrd_uops_2_REG_taken;
  reg  [19:0] rrd_uops_2_REG_imm_packed;
  reg  [11:0] rrd_uops_2_REG_csr_addr;
  reg  [6:0]  rrd_uops_2_REG_rob_idx;
  reg  [4:0]  rrd_uops_2_REG_ldq_idx;
  reg  [4:0]  rrd_uops_2_REG_stq_idx;
  reg  [1:0]  rrd_uops_2_REG_rxq_idx;
  reg  [6:0]  rrd_uops_2_REG_pdst;
  reg  [6:0]  rrd_uops_2_REG_prs1;
  reg  [6:0]  rrd_uops_2_REG_prs2;
  reg  [6:0]  rrd_uops_2_REG_prs3;
  reg  [5:0]  rrd_uops_2_REG_ppred;
  reg         rrd_uops_2_REG_prs1_busy;
  reg         rrd_uops_2_REG_prs2_busy;
  reg         rrd_uops_2_REG_prs3_busy;
  reg         rrd_uops_2_REG_ppred_busy;
  reg  [6:0]  rrd_uops_2_REG_stale_pdst;
  reg         rrd_uops_2_REG_exception;
  reg  [63:0] rrd_uops_2_REG_exc_cause;
  reg         rrd_uops_2_REG_bypassable;
  reg  [4:0]  rrd_uops_2_REG_mem_cmd;
  reg  [1:0]  rrd_uops_2_REG_mem_size;
  reg         rrd_uops_2_REG_mem_signed;
  reg         rrd_uops_2_REG_is_fence;
  reg         rrd_uops_2_REG_is_fencei;
  reg         rrd_uops_2_REG_is_amo;
  reg         rrd_uops_2_REG_uses_ldq;
  reg         rrd_uops_2_REG_uses_stq;
  reg         rrd_uops_2_REG_is_sys_pc2epc;
  reg         rrd_uops_2_REG_is_unique;
  reg         rrd_uops_2_REG_flush_on_commit;
  reg         rrd_uops_2_REG_ldst_is_rs1;
  reg  [5:0]  rrd_uops_2_REG_ldst;
  reg  [5:0]  rrd_uops_2_REG_lrs1;
  reg  [5:0]  rrd_uops_2_REG_lrs2;
  reg  [5:0]  rrd_uops_2_REG_lrs3;
  reg         rrd_uops_2_REG_ldst_val;
  reg  [1:0]  rrd_uops_2_REG_dst_rtype;
  reg  [1:0]  rrd_uops_2_REG_lrs1_rtype;
  reg  [1:0]  rrd_uops_2_REG_lrs2_rtype;
  reg         rrd_uops_2_REG_frs3_en;
  reg         rrd_uops_2_REG_fp_val;
  reg         rrd_uops_2_REG_fp_single;
  reg         rrd_uops_2_REG_xcpt_pf_if;
  reg         rrd_uops_2_REG_xcpt_ae_if;
  reg         rrd_uops_2_REG_xcpt_ma_if;
  reg         rrd_uops_2_REG_bp_debug_if;
  reg         rrd_uops_2_REG_bp_xcpt_if;
  reg  [1:0]  rrd_uops_2_REG_debug_fsrc;
  reg  [1:0]  rrd_uops_2_REG_debug_tsrc;
  reg         rrd_valids_3_REG;
  reg  [6:0]  rrd_uops_3_REG_uopc;
  reg         rrd_uops_3_REG_is_rvc;
  reg  [9:0]  rrd_uops_3_REG_fu_code;
  reg  [3:0]  rrd_uops_3_REG_ctrl_br_type;
  reg  [1:0]  rrd_uops_3_REG_ctrl_op1_sel;
  reg  [2:0]  rrd_uops_3_REG_ctrl_op2_sel;
  reg  [2:0]  rrd_uops_3_REG_ctrl_imm_sel;
  reg  [3:0]  rrd_uops_3_REG_ctrl_op_fcn;
  reg         rrd_uops_3_REG_ctrl_fcn_dw;
  reg  [2:0]  rrd_uops_3_REG_ctrl_csr_cmd;
  reg         rrd_uops_3_REG_is_br;
  reg         rrd_uops_3_REG_is_jalr;
  reg         rrd_uops_3_REG_is_jal;
  reg         rrd_uops_3_REG_is_sfb;
  reg  [19:0] rrd_uops_3_REG_br_mask;
  reg  [4:0]  rrd_uops_3_REG_br_tag;
  reg  [5:0]  rrd_uops_3_REG_ftq_idx;
  reg         rrd_uops_3_REG_edge_inst;
  reg  [5:0]  rrd_uops_3_REG_pc_lob;
  reg         rrd_uops_3_REG_taken;
  reg  [19:0] rrd_uops_3_REG_imm_packed;
  reg  [6:0]  rrd_uops_3_REG_rob_idx;
  reg  [4:0]  rrd_uops_3_REG_ldq_idx;
  reg  [4:0]  rrd_uops_3_REG_stq_idx;
  reg  [6:0]  rrd_uops_3_REG_pdst;
  reg  [6:0]  rrd_uops_3_REG_prs1;
  reg  [6:0]  rrd_uops_3_REG_prs2;
  reg         rrd_uops_3_REG_bypassable;
  reg         rrd_uops_3_REG_is_amo;
  reg         rrd_uops_3_REG_uses_stq;
  reg  [1:0]  rrd_uops_3_REG_dst_rtype;
  reg  [1:0]  rrd_uops_3_REG_lrs1_rtype;
  reg  [1:0]  rrd_uops_3_REG_lrs2_rtype;
  reg         rrd_valids_4_REG;
  reg  [6:0]  rrd_uops_4_REG_uopc;
  reg         rrd_uops_4_REG_is_rvc;
  reg  [9:0]  rrd_uops_4_REG_fu_code;
  reg  [3:0]  rrd_uops_4_REG_ctrl_br_type;
  reg  [1:0]  rrd_uops_4_REG_ctrl_op1_sel;
  reg  [2:0]  rrd_uops_4_REG_ctrl_op2_sel;
  reg  [2:0]  rrd_uops_4_REG_ctrl_imm_sel;
  reg  [3:0]  rrd_uops_4_REG_ctrl_op_fcn;
  reg         rrd_uops_4_REG_ctrl_fcn_dw;
  reg         rrd_uops_4_REG_is_br;
  reg         rrd_uops_4_REG_is_jalr;
  reg         rrd_uops_4_REG_is_jal;
  reg         rrd_uops_4_REG_is_sfb;
  reg  [19:0] rrd_uops_4_REG_br_mask;
  reg  [4:0]  rrd_uops_4_REG_br_tag;
  reg  [5:0]  rrd_uops_4_REG_ftq_idx;
  reg         rrd_uops_4_REG_edge_inst;
  reg  [5:0]  rrd_uops_4_REG_pc_lob;
  reg         rrd_uops_4_REG_taken;
  reg  [19:0] rrd_uops_4_REG_imm_packed;
  reg  [6:0]  rrd_uops_4_REG_rob_idx;
  reg  [4:0]  rrd_uops_4_REG_ldq_idx;
  reg  [4:0]  rrd_uops_4_REG_stq_idx;
  reg  [6:0]  rrd_uops_4_REG_pdst;
  reg  [6:0]  rrd_uops_4_REG_prs1;
  reg  [6:0]  rrd_uops_4_REG_prs2;
  reg         rrd_uops_4_REG_bypassable;
  reg         rrd_uops_4_REG_is_amo;
  reg         rrd_uops_4_REG_uses_stq;
  reg  [1:0]  rrd_uops_4_REG_dst_rtype;
  reg  [1:0]  rrd_uops_4_REG_lrs1_rtype;
  reg  [1:0]  rrd_uops_4_REG_lrs2_rtype;
  reg         rrd_valids_5_REG;
  reg  [6:0]  rrd_uops_5_REG_uopc;
  reg         rrd_uops_5_REG_is_rvc;
  reg  [9:0]  rrd_uops_5_REG_fu_code;
  reg  [3:0]  rrd_uops_5_REG_ctrl_br_type;
  reg  [1:0]  rrd_uops_5_REG_ctrl_op1_sel;
  reg  [2:0]  rrd_uops_5_REG_ctrl_op2_sel;
  reg  [2:0]  rrd_uops_5_REG_ctrl_imm_sel;
  reg  [3:0]  rrd_uops_5_REG_ctrl_op_fcn;
  reg         rrd_uops_5_REG_ctrl_fcn_dw;
  reg  [2:0]  rrd_uops_5_REG_ctrl_csr_cmd;
  reg         rrd_uops_5_REG_is_br;
  reg         rrd_uops_5_REG_is_jalr;
  reg         rrd_uops_5_REG_is_jal;
  reg         rrd_uops_5_REG_is_sfb;
  reg  [19:0] rrd_uops_5_REG_br_mask;
  reg  [4:0]  rrd_uops_5_REG_br_tag;
  reg  [5:0]  rrd_uops_5_REG_ftq_idx;
  reg         rrd_uops_5_REG_edge_inst;
  reg  [5:0]  rrd_uops_5_REG_pc_lob;
  reg         rrd_uops_5_REG_taken;
  reg  [19:0] rrd_uops_5_REG_imm_packed;
  reg  [6:0]  rrd_uops_5_REG_rob_idx;
  reg  [4:0]  rrd_uops_5_REG_ldq_idx;
  reg  [4:0]  rrd_uops_5_REG_stq_idx;
  reg  [6:0]  rrd_uops_5_REG_pdst;
  reg  [6:0]  rrd_uops_5_REG_prs1;
  reg  [6:0]  rrd_uops_5_REG_prs2;
  reg         rrd_uops_5_REG_bypassable;
  reg         rrd_uops_5_REG_is_amo;
  reg         rrd_uops_5_REG_uses_stq;
  reg  [1:0]  rrd_uops_5_REG_dst_rtype;
  reg  [1:0]  rrd_uops_5_REG_lrs1_rtype;
  reg  [1:0]  rrd_uops_5_REG_lrs2_rtype;
  reg         rrd_rs1_data_0_REG;
  reg         rrd_rs2_data_0_REG;
  reg         rrd_rs1_data_1_REG;
  reg         rrd_rs2_data_1_REG;
  reg         rrd_rs1_data_2_REG;
  reg         rrd_rs2_data_2_REG;
  reg         rrd_rs1_data_3_REG;
  reg         rrd_rs2_data_3_REG;
  reg         rrd_rs1_data_4_REG;
  reg         rrd_rs2_data_4_REG;
  reg         rrd_rs1_data_5_REG;
  reg         rrd_rs2_data_5_REG;
  wire        rrd_kill = io_kill | (|(io_brupdate_b1_mispredict_mask & rrd_uops_0_REG_br_mask));
  wire        rrd_kill_1 = io_kill | (|(io_brupdate_b1_mispredict_mask & rrd_uops_1_REG_br_mask));
  wire        rrd_kill_2 = io_kill | (|(io_brupdate_b1_mispredict_mask & rrd_uops_2_REG_br_mask));
  wire        rrd_kill_3 = io_kill | (|(io_brupdate_b1_mispredict_mask & rrd_uops_3_REG_br_mask));
  wire        rrd_kill_4 = io_kill | (|(io_brupdate_b1_mispredict_mask & rrd_uops_4_REG_br_mask));
  wire        rrd_kill_5 = io_kill | (|(io_brupdate_b1_mispredict_mask & rrd_uops_5_REG_br_mask));
  wire        _GEN = io_bypass_0_bits_uop_dst_rtype != 2'h2;
  wire        _GEN_0 = io_bypass_0_bits_uop_dst_rtype == 2'h0;
  wire        _GEN_1 = rrd_uops_0_REG_lrs1_rtype == 2'h0;
  wire        _GEN_2 = rrd_uops_0_REG_lrs2_rtype == 2'h0;
  wire        _GEN_3 = io_bypass_1_bits_uop_dst_rtype != 2'h2;
  wire        _GEN_4 = io_bypass_1_bits_uop_dst_rtype == 2'h0;
  wire        _GEN_5 = io_bypass_2_bits_uop_dst_rtype != 2'h2;
  wire        _GEN_6 = io_bypass_2_bits_uop_dst_rtype == 2'h0;
  wire        _GEN_7 = io_bypass_3_bits_uop_dst_rtype != 2'h2;
  wire        _GEN_8 = io_bypass_3_bits_uop_dst_rtype == 2'h0;
  wire        _GEN_9 = io_bypass_4_bits_uop_dst_rtype != 2'h2;
  wire        _GEN_10 = io_bypass_4_bits_uop_dst_rtype == 2'h0;
  wire        _GEN_11 = io_bypass_5_bits_uop_dst_rtype != 2'h2;
  wire        _GEN_12 = io_bypass_5_bits_uop_dst_rtype == 2'h0;
  wire        _GEN_13 = rrd_uops_1_REG_lrs1_rtype == 2'h0;
  wire        _GEN_14 = rrd_uops_1_REG_lrs2_rtype == 2'h0;
  wire        _GEN_15 = rrd_uops_2_REG_lrs1_rtype == 2'h0;
  wire        _GEN_16 = rrd_uops_2_REG_lrs2_rtype == 2'h0;
  wire        _GEN_17 = rrd_uops_3_REG_lrs1_rtype == 2'h0;
  wire        _GEN_18 = rrd_uops_3_REG_lrs2_rtype == 2'h0;
  wire        _GEN_19 = rrd_uops_4_REG_lrs1_rtype == 2'h0;
  wire        _GEN_20 = rrd_uops_4_REG_lrs2_rtype == 2'h0;
  wire        _GEN_21 = rrd_uops_5_REG_lrs1_rtype == 2'h0;
  wire        _GEN_22 = rrd_uops_5_REG_lrs2_rtype == 2'h0;
  always @(posedge clock) begin
    if (reset) begin
      exe_reg_valids_0 <= 1'h0;
      exe_reg_valids_1 <= 1'h0;
      exe_reg_valids_2 <= 1'h0;
      exe_reg_valids_3 <= 1'h0;
      exe_reg_valids_4 <= 1'h0;
      exe_reg_valids_5 <= 1'h0;
    end
    else begin
      exe_reg_valids_0 <= ~rrd_kill & rrd_valids_0_REG;
      exe_reg_valids_1 <= ~rrd_kill_1 & rrd_valids_1_REG;
      exe_reg_valids_2 <= ~rrd_kill_2 & rrd_valids_2_REG;
      exe_reg_valids_3 <= ~rrd_kill_3 & rrd_valids_3_REG;
      exe_reg_valids_4 <= ~rrd_kill_4 & rrd_valids_4_REG;
      exe_reg_valids_5 <= ~rrd_kill_5 & rrd_valids_5_REG;
    end
    exe_reg_uops_0_uopc <= rrd_kill ? 7'h0 : rrd_uops_0_REG_uopc;
    exe_reg_uops_0_inst <= rrd_kill ? 32'h0 : rrd_uops_0_REG_inst;
    exe_reg_uops_0_debug_inst <= rrd_kill ? 32'h0 : rrd_uops_0_REG_debug_inst;
    exe_reg_uops_0_is_rvc <= ~rrd_kill & rrd_uops_0_REG_is_rvc;
    exe_reg_uops_0_debug_pc <= rrd_kill ? 40'h0 : rrd_uops_0_REG_debug_pc;
    exe_reg_uops_0_iq_type <= rrd_kill ? 3'h0 : rrd_uops_0_REG_iq_type;
    exe_reg_uops_0_fu_code <= rrd_kill ? 10'h0 : rrd_uops_0_REG_fu_code;
    exe_reg_uops_0_ctrl_br_type <= rrd_kill ? 4'h0 : rrd_uops_0_REG_ctrl_br_type;
    exe_reg_uops_0_ctrl_op1_sel <= rrd_kill ? 2'h0 : rrd_uops_0_REG_ctrl_op1_sel;
    exe_reg_uops_0_ctrl_op2_sel <= rrd_kill ? 3'h0 : rrd_uops_0_REG_ctrl_op2_sel;
    exe_reg_uops_0_ctrl_imm_sel <= rrd_kill ? 3'h0 : rrd_uops_0_REG_ctrl_imm_sel;
    exe_reg_uops_0_ctrl_op_fcn <= rrd_kill ? 4'h0 : rrd_uops_0_REG_ctrl_op_fcn;
    exe_reg_uops_0_ctrl_fcn_dw <= ~rrd_kill & rrd_uops_0_REG_ctrl_fcn_dw;
    exe_reg_uops_0_ctrl_csr_cmd <= rrd_kill ? 3'h0 : rrd_uops_0_REG_ctrl_csr_cmd;
    exe_reg_uops_0_ctrl_is_load <= ~rrd_kill & rrd_uops_0_REG_ctrl_is_load;
    exe_reg_uops_0_ctrl_is_sta <= ~rrd_kill & rrd_uops_0_REG_ctrl_is_sta;
    exe_reg_uops_0_ctrl_is_std <= ~rrd_kill & rrd_uops_0_REG_ctrl_is_std;
    exe_reg_uops_0_iw_state <= rrd_kill ? 2'h0 : rrd_uops_0_REG_iw_state;
    exe_reg_uops_0_is_br <= ~rrd_kill & rrd_uops_0_REG_is_br;
    exe_reg_uops_0_is_jalr <= ~rrd_kill & rrd_uops_0_REG_is_jalr;
    exe_reg_uops_0_is_jal <= ~rrd_kill & rrd_uops_0_REG_is_jal;
    exe_reg_uops_0_is_sfb <= ~rrd_kill & rrd_uops_0_REG_is_sfb;
    exe_reg_uops_0_br_mask <= rrd_uops_0_REG_br_mask & ~io_brupdate_b1_resolve_mask;
    exe_reg_uops_0_br_tag <= rrd_kill ? 5'h0 : rrd_uops_0_REG_br_tag;
    exe_reg_uops_0_ftq_idx <= rrd_kill ? 6'h0 : rrd_uops_0_REG_ftq_idx;
    exe_reg_uops_0_edge_inst <= ~rrd_kill & rrd_uops_0_REG_edge_inst;
    exe_reg_uops_0_pc_lob <= rrd_kill ? 6'h0 : rrd_uops_0_REG_pc_lob;
    exe_reg_uops_0_taken <= ~rrd_kill & rrd_uops_0_REG_taken;
    exe_reg_uops_0_imm_packed <= rrd_kill ? 20'h0 : rrd_uops_0_REG_imm_packed;
    exe_reg_uops_0_csr_addr <= rrd_kill ? 12'h0 : rrd_uops_0_REG_csr_addr;
    exe_reg_uops_0_rob_idx <= rrd_kill ? 7'h0 : rrd_uops_0_REG_rob_idx;
    exe_reg_uops_0_ldq_idx <= rrd_kill ? 5'h0 : rrd_uops_0_REG_ldq_idx;
    exe_reg_uops_0_stq_idx <= rrd_kill ? 5'h0 : rrd_uops_0_REG_stq_idx;
    exe_reg_uops_0_rxq_idx <= rrd_kill ? 2'h0 : rrd_uops_0_REG_rxq_idx;
    exe_reg_uops_0_pdst <= rrd_kill ? 7'h0 : rrd_uops_0_REG_pdst;
    exe_reg_uops_0_prs1 <= rrd_kill ? 7'h0 : rrd_uops_0_REG_prs1;
    exe_reg_uops_0_prs2 <= rrd_kill ? 7'h0 : rrd_uops_0_REG_prs2;
    exe_reg_uops_0_prs3 <= rrd_kill ? 7'h0 : rrd_uops_0_REG_prs3;
    exe_reg_uops_0_ppred <= rrd_kill ? 6'h0 : rrd_uops_0_REG_ppred;
    exe_reg_uops_0_prs1_busy <= ~rrd_kill & rrd_uops_0_REG_prs1_busy;
    exe_reg_uops_0_prs2_busy <= ~rrd_kill & rrd_uops_0_REG_prs2_busy;
    exe_reg_uops_0_prs3_busy <= ~rrd_kill & rrd_uops_0_REG_prs3_busy;
    exe_reg_uops_0_ppred_busy <= ~rrd_kill & rrd_uops_0_REG_ppred_busy;
    exe_reg_uops_0_stale_pdst <= rrd_kill ? 7'h0 : rrd_uops_0_REG_stale_pdst;
    exe_reg_uops_0_exception <= ~rrd_kill & rrd_uops_0_REG_exception;
    exe_reg_uops_0_exc_cause <= rrd_kill ? 64'h0 : rrd_uops_0_REG_exc_cause;
    exe_reg_uops_0_bypassable <= ~rrd_kill & rrd_uops_0_REG_bypassable;
    exe_reg_uops_0_mem_cmd <= rrd_kill ? 5'h0 : rrd_uops_0_REG_mem_cmd;
    exe_reg_uops_0_mem_size <= rrd_kill ? 2'h0 : rrd_uops_0_REG_mem_size;
    exe_reg_uops_0_mem_signed <= ~rrd_kill & rrd_uops_0_REG_mem_signed;
    exe_reg_uops_0_is_fence <= ~rrd_kill & rrd_uops_0_REG_is_fence;
    exe_reg_uops_0_is_fencei <= ~rrd_kill & rrd_uops_0_REG_is_fencei;
    exe_reg_uops_0_is_amo <= ~rrd_kill & rrd_uops_0_REG_is_amo;
    exe_reg_uops_0_uses_ldq <= ~rrd_kill & rrd_uops_0_REG_uses_ldq;
    exe_reg_uops_0_uses_stq <= ~rrd_kill & rrd_uops_0_REG_uses_stq;
    exe_reg_uops_0_is_sys_pc2epc <= ~rrd_kill & rrd_uops_0_REG_is_sys_pc2epc;
    exe_reg_uops_0_is_unique <= ~rrd_kill & rrd_uops_0_REG_is_unique;
    exe_reg_uops_0_flush_on_commit <= ~rrd_kill & rrd_uops_0_REG_flush_on_commit;
    exe_reg_uops_0_ldst_is_rs1 <= ~rrd_kill & rrd_uops_0_REG_ldst_is_rs1;
    exe_reg_uops_0_ldst <= rrd_kill ? 6'h0 : rrd_uops_0_REG_ldst;
    exe_reg_uops_0_lrs1 <= rrd_kill ? 6'h0 : rrd_uops_0_REG_lrs1;
    exe_reg_uops_0_lrs2 <= rrd_kill ? 6'h0 : rrd_uops_0_REG_lrs2;
    exe_reg_uops_0_lrs3 <= rrd_kill ? 6'h0 : rrd_uops_0_REG_lrs3;
    exe_reg_uops_0_ldst_val <= ~rrd_kill & rrd_uops_0_REG_ldst_val;
    exe_reg_uops_0_dst_rtype <= rrd_kill ? 2'h2 : rrd_uops_0_REG_dst_rtype;
    exe_reg_uops_0_lrs1_rtype <= rrd_kill ? 2'h0 : rrd_uops_0_REG_lrs1_rtype;
    exe_reg_uops_0_lrs2_rtype <= rrd_kill ? 2'h0 : rrd_uops_0_REG_lrs2_rtype;
    exe_reg_uops_0_frs3_en <= ~rrd_kill & rrd_uops_0_REG_frs3_en;
    exe_reg_uops_0_fp_val <= ~rrd_kill & rrd_uops_0_REG_fp_val;
    exe_reg_uops_0_fp_single <= ~rrd_kill & rrd_uops_0_REG_fp_single;
    exe_reg_uops_0_xcpt_pf_if <= ~rrd_kill & rrd_uops_0_REG_xcpt_pf_if;
    exe_reg_uops_0_xcpt_ae_if <= ~rrd_kill & rrd_uops_0_REG_xcpt_ae_if;
    exe_reg_uops_0_xcpt_ma_if <= ~rrd_kill & rrd_uops_0_REG_xcpt_ma_if;
    exe_reg_uops_0_bp_debug_if <= ~rrd_kill & rrd_uops_0_REG_bp_debug_if;
    exe_reg_uops_0_bp_xcpt_if <= ~rrd_kill & rrd_uops_0_REG_bp_xcpt_if;
    exe_reg_uops_0_debug_fsrc <= rrd_kill ? 2'h0 : rrd_uops_0_REG_debug_fsrc;
    exe_reg_uops_0_debug_tsrc <= rrd_kill ? 2'h0 : rrd_uops_0_REG_debug_tsrc;
    exe_reg_uops_1_uopc <= rrd_kill_1 ? 7'h0 : rrd_uops_1_REG_uopc;
    exe_reg_uops_1_inst <= rrd_kill_1 ? 32'h0 : rrd_uops_1_REG_inst;
    exe_reg_uops_1_debug_inst <= rrd_kill_1 ? 32'h0 : rrd_uops_1_REG_debug_inst;
    exe_reg_uops_1_is_rvc <= ~rrd_kill_1 & rrd_uops_1_REG_is_rvc;
    exe_reg_uops_1_debug_pc <= rrd_kill_1 ? 40'h0 : rrd_uops_1_REG_debug_pc;
    exe_reg_uops_1_iq_type <= rrd_kill_1 ? 3'h0 : rrd_uops_1_REG_iq_type;
    exe_reg_uops_1_fu_code <= rrd_kill_1 ? 10'h0 : rrd_uops_1_REG_fu_code;
    exe_reg_uops_1_ctrl_br_type <= rrd_kill_1 ? 4'h0 : rrd_uops_1_REG_ctrl_br_type;
    exe_reg_uops_1_ctrl_op1_sel <= rrd_kill_1 ? 2'h0 : rrd_uops_1_REG_ctrl_op1_sel;
    exe_reg_uops_1_ctrl_op2_sel <= rrd_kill_1 ? 3'h0 : rrd_uops_1_REG_ctrl_op2_sel;
    exe_reg_uops_1_ctrl_imm_sel <= rrd_kill_1 ? 3'h0 : rrd_uops_1_REG_ctrl_imm_sel;
    exe_reg_uops_1_ctrl_op_fcn <= rrd_kill_1 ? 4'h0 : rrd_uops_1_REG_ctrl_op_fcn;
    exe_reg_uops_1_ctrl_fcn_dw <= ~rrd_kill_1 & rrd_uops_1_REG_ctrl_fcn_dw;
    exe_reg_uops_1_ctrl_csr_cmd <= rrd_kill_1 ? 3'h0 : rrd_uops_1_REG_ctrl_csr_cmd;
    exe_reg_uops_1_ctrl_is_load <= ~rrd_kill_1 & rrd_uops_1_REG_ctrl_is_load;
    exe_reg_uops_1_ctrl_is_sta <= ~rrd_kill_1 & rrd_uops_1_REG_ctrl_is_sta;
    exe_reg_uops_1_ctrl_is_std <= ~rrd_kill_1 & rrd_uops_1_REG_ctrl_is_std;
    exe_reg_uops_1_iw_state <= rrd_kill_1 ? 2'h0 : rrd_uops_1_REG_iw_state;
    exe_reg_uops_1_is_br <= ~rrd_kill_1 & rrd_uops_1_REG_is_br;
    exe_reg_uops_1_is_jalr <= ~rrd_kill_1 & rrd_uops_1_REG_is_jalr;
    exe_reg_uops_1_is_jal <= ~rrd_kill_1 & rrd_uops_1_REG_is_jal;
    exe_reg_uops_1_is_sfb <= ~rrd_kill_1 & rrd_uops_1_REG_is_sfb;
    exe_reg_uops_1_br_mask <= rrd_uops_1_REG_br_mask & ~io_brupdate_b1_resolve_mask;
    exe_reg_uops_1_br_tag <= rrd_kill_1 ? 5'h0 : rrd_uops_1_REG_br_tag;
    exe_reg_uops_1_ftq_idx <= rrd_kill_1 ? 6'h0 : rrd_uops_1_REG_ftq_idx;
    exe_reg_uops_1_edge_inst <= ~rrd_kill_1 & rrd_uops_1_REG_edge_inst;
    exe_reg_uops_1_pc_lob <= rrd_kill_1 ? 6'h0 : rrd_uops_1_REG_pc_lob;
    exe_reg_uops_1_taken <= ~rrd_kill_1 & rrd_uops_1_REG_taken;
    exe_reg_uops_1_imm_packed <= rrd_kill_1 ? 20'h0 : rrd_uops_1_REG_imm_packed;
    exe_reg_uops_1_csr_addr <= rrd_kill_1 ? 12'h0 : rrd_uops_1_REG_csr_addr;
    exe_reg_uops_1_rob_idx <= rrd_kill_1 ? 7'h0 : rrd_uops_1_REG_rob_idx;
    exe_reg_uops_1_ldq_idx <= rrd_kill_1 ? 5'h0 : rrd_uops_1_REG_ldq_idx;
    exe_reg_uops_1_stq_idx <= rrd_kill_1 ? 5'h0 : rrd_uops_1_REG_stq_idx;
    exe_reg_uops_1_rxq_idx <= rrd_kill_1 ? 2'h0 : rrd_uops_1_REG_rxq_idx;
    exe_reg_uops_1_pdst <= rrd_kill_1 ? 7'h0 : rrd_uops_1_REG_pdst;
    exe_reg_uops_1_prs1 <= rrd_kill_1 ? 7'h0 : rrd_uops_1_REG_prs1;
    exe_reg_uops_1_prs2 <= rrd_kill_1 ? 7'h0 : rrd_uops_1_REG_prs2;
    exe_reg_uops_1_prs3 <= rrd_kill_1 ? 7'h0 : rrd_uops_1_REG_prs3;
    exe_reg_uops_1_ppred <= rrd_kill_1 ? 6'h0 : rrd_uops_1_REG_ppred;
    exe_reg_uops_1_prs1_busy <= ~rrd_kill_1 & rrd_uops_1_REG_prs1_busy;
    exe_reg_uops_1_prs2_busy <= ~rrd_kill_1 & rrd_uops_1_REG_prs2_busy;
    exe_reg_uops_1_prs3_busy <= ~rrd_kill_1 & rrd_uops_1_REG_prs3_busy;
    exe_reg_uops_1_ppred_busy <= ~rrd_kill_1 & rrd_uops_1_REG_ppred_busy;
    exe_reg_uops_1_stale_pdst <= rrd_kill_1 ? 7'h0 : rrd_uops_1_REG_stale_pdst;
    exe_reg_uops_1_exception <= ~rrd_kill_1 & rrd_uops_1_REG_exception;
    exe_reg_uops_1_exc_cause <= rrd_kill_1 ? 64'h0 : rrd_uops_1_REG_exc_cause;
    exe_reg_uops_1_bypassable <= ~rrd_kill_1 & rrd_uops_1_REG_bypassable;
    exe_reg_uops_1_mem_cmd <= rrd_kill_1 ? 5'h0 : rrd_uops_1_REG_mem_cmd;
    exe_reg_uops_1_mem_size <= rrd_kill_1 ? 2'h0 : rrd_uops_1_REG_mem_size;
    exe_reg_uops_1_mem_signed <= ~rrd_kill_1 & rrd_uops_1_REG_mem_signed;
    exe_reg_uops_1_is_fence <= ~rrd_kill_1 & rrd_uops_1_REG_is_fence;
    exe_reg_uops_1_is_fencei <= ~rrd_kill_1 & rrd_uops_1_REG_is_fencei;
    exe_reg_uops_1_is_amo <= ~rrd_kill_1 & rrd_uops_1_REG_is_amo;
    exe_reg_uops_1_uses_ldq <= ~rrd_kill_1 & rrd_uops_1_REG_uses_ldq;
    exe_reg_uops_1_uses_stq <= ~rrd_kill_1 & rrd_uops_1_REG_uses_stq;
    exe_reg_uops_1_is_sys_pc2epc <= ~rrd_kill_1 & rrd_uops_1_REG_is_sys_pc2epc;
    exe_reg_uops_1_is_unique <= ~rrd_kill_1 & rrd_uops_1_REG_is_unique;
    exe_reg_uops_1_flush_on_commit <= ~rrd_kill_1 & rrd_uops_1_REG_flush_on_commit;
    exe_reg_uops_1_ldst_is_rs1 <= ~rrd_kill_1 & rrd_uops_1_REG_ldst_is_rs1;
    exe_reg_uops_1_ldst <= rrd_kill_1 ? 6'h0 : rrd_uops_1_REG_ldst;
    exe_reg_uops_1_lrs1 <= rrd_kill_1 ? 6'h0 : rrd_uops_1_REG_lrs1;
    exe_reg_uops_1_lrs2 <= rrd_kill_1 ? 6'h0 : rrd_uops_1_REG_lrs2;
    exe_reg_uops_1_lrs3 <= rrd_kill_1 ? 6'h0 : rrd_uops_1_REG_lrs3;
    exe_reg_uops_1_ldst_val <= ~rrd_kill_1 & rrd_uops_1_REG_ldst_val;
    exe_reg_uops_1_dst_rtype <= rrd_kill_1 ? 2'h2 : rrd_uops_1_REG_dst_rtype;
    exe_reg_uops_1_lrs1_rtype <= rrd_kill_1 ? 2'h0 : rrd_uops_1_REG_lrs1_rtype;
    exe_reg_uops_1_lrs2_rtype <= rrd_kill_1 ? 2'h0 : rrd_uops_1_REG_lrs2_rtype;
    exe_reg_uops_1_frs3_en <= ~rrd_kill_1 & rrd_uops_1_REG_frs3_en;
    exe_reg_uops_1_fp_val <= ~rrd_kill_1 & rrd_uops_1_REG_fp_val;
    exe_reg_uops_1_fp_single <= ~rrd_kill_1 & rrd_uops_1_REG_fp_single;
    exe_reg_uops_1_xcpt_pf_if <= ~rrd_kill_1 & rrd_uops_1_REG_xcpt_pf_if;
    exe_reg_uops_1_xcpt_ae_if <= ~rrd_kill_1 & rrd_uops_1_REG_xcpt_ae_if;
    exe_reg_uops_1_xcpt_ma_if <= ~rrd_kill_1 & rrd_uops_1_REG_xcpt_ma_if;
    exe_reg_uops_1_bp_debug_if <= ~rrd_kill_1 & rrd_uops_1_REG_bp_debug_if;
    exe_reg_uops_1_bp_xcpt_if <= ~rrd_kill_1 & rrd_uops_1_REG_bp_xcpt_if;
    exe_reg_uops_1_debug_fsrc <= rrd_kill_1 ? 2'h0 : rrd_uops_1_REG_debug_fsrc;
    exe_reg_uops_1_debug_tsrc <= rrd_kill_1 ? 2'h0 : rrd_uops_1_REG_debug_tsrc;
    exe_reg_uops_2_uopc <= rrd_kill_2 ? 7'h0 : rrd_uops_2_REG_uopc;
    exe_reg_uops_2_inst <= rrd_kill_2 ? 32'h0 : rrd_uops_2_REG_inst;
    exe_reg_uops_2_debug_inst <= rrd_kill_2 ? 32'h0 : rrd_uops_2_REG_debug_inst;
    exe_reg_uops_2_is_rvc <= ~rrd_kill_2 & rrd_uops_2_REG_is_rvc;
    exe_reg_uops_2_debug_pc <= rrd_kill_2 ? 40'h0 : rrd_uops_2_REG_debug_pc;
    exe_reg_uops_2_iq_type <= rrd_kill_2 ? 3'h0 : rrd_uops_2_REG_iq_type;
    exe_reg_uops_2_fu_code <= rrd_kill_2 ? 10'h0 : rrd_uops_2_REG_fu_code;
    exe_reg_uops_2_ctrl_br_type <= rrd_kill_2 ? 4'h0 : rrd_uops_2_REG_ctrl_br_type;
    exe_reg_uops_2_ctrl_op1_sel <= rrd_kill_2 ? 2'h0 : rrd_uops_2_REG_ctrl_op1_sel;
    exe_reg_uops_2_ctrl_op2_sel <= rrd_kill_2 ? 3'h0 : rrd_uops_2_REG_ctrl_op2_sel;
    exe_reg_uops_2_ctrl_imm_sel <= rrd_kill_2 ? 3'h0 : rrd_uops_2_REG_ctrl_imm_sel;
    exe_reg_uops_2_ctrl_op_fcn <= rrd_kill_2 ? 4'h0 : rrd_uops_2_REG_ctrl_op_fcn;
    exe_reg_uops_2_ctrl_fcn_dw <= ~rrd_kill_2 & rrd_uops_2_REG_ctrl_fcn_dw;
    exe_reg_uops_2_ctrl_csr_cmd <= rrd_kill_2 ? 3'h0 : rrd_uops_2_REG_ctrl_csr_cmd;
    exe_reg_uops_2_ctrl_is_load <= ~rrd_kill_2 & rrd_uops_2_REG_ctrl_is_load;
    exe_reg_uops_2_ctrl_is_sta <= ~rrd_kill_2 & rrd_uops_2_REG_ctrl_is_sta;
    exe_reg_uops_2_ctrl_is_std <= ~rrd_kill_2 & rrd_uops_2_REG_ctrl_is_std;
    exe_reg_uops_2_iw_state <= rrd_kill_2 ? 2'h0 : rrd_uops_2_REG_iw_state;
    exe_reg_uops_2_is_br <= ~rrd_kill_2 & rrd_uops_2_REG_is_br;
    exe_reg_uops_2_is_jalr <= ~rrd_kill_2 & rrd_uops_2_REG_is_jalr;
    exe_reg_uops_2_is_jal <= ~rrd_kill_2 & rrd_uops_2_REG_is_jal;
    exe_reg_uops_2_is_sfb <= ~rrd_kill_2 & rrd_uops_2_REG_is_sfb;
    exe_reg_uops_2_br_mask <= rrd_uops_2_REG_br_mask & ~io_brupdate_b1_resolve_mask;
    exe_reg_uops_2_br_tag <= rrd_kill_2 ? 5'h0 : rrd_uops_2_REG_br_tag;
    exe_reg_uops_2_ftq_idx <= rrd_kill_2 ? 6'h0 : rrd_uops_2_REG_ftq_idx;
    exe_reg_uops_2_edge_inst <= ~rrd_kill_2 & rrd_uops_2_REG_edge_inst;
    exe_reg_uops_2_pc_lob <= rrd_kill_2 ? 6'h0 : rrd_uops_2_REG_pc_lob;
    exe_reg_uops_2_taken <= ~rrd_kill_2 & rrd_uops_2_REG_taken;
    exe_reg_uops_2_imm_packed <= rrd_kill_2 ? 20'h0 : rrd_uops_2_REG_imm_packed;
    exe_reg_uops_2_csr_addr <= rrd_kill_2 ? 12'h0 : rrd_uops_2_REG_csr_addr;
    exe_reg_uops_2_rob_idx <= rrd_kill_2 ? 7'h0 : rrd_uops_2_REG_rob_idx;
    exe_reg_uops_2_ldq_idx <= rrd_kill_2 ? 5'h0 : rrd_uops_2_REG_ldq_idx;
    exe_reg_uops_2_stq_idx <= rrd_kill_2 ? 5'h0 : rrd_uops_2_REG_stq_idx;
    exe_reg_uops_2_rxq_idx <= rrd_kill_2 ? 2'h0 : rrd_uops_2_REG_rxq_idx;
    exe_reg_uops_2_pdst <= rrd_kill_2 ? 7'h0 : rrd_uops_2_REG_pdst;
    exe_reg_uops_2_prs1 <= rrd_kill_2 ? 7'h0 : rrd_uops_2_REG_prs1;
    exe_reg_uops_2_prs2 <= rrd_kill_2 ? 7'h0 : rrd_uops_2_REG_prs2;
    exe_reg_uops_2_prs3 <= rrd_kill_2 ? 7'h0 : rrd_uops_2_REG_prs3;
    exe_reg_uops_2_ppred <= rrd_kill_2 ? 6'h0 : rrd_uops_2_REG_ppred;
    exe_reg_uops_2_prs1_busy <= ~rrd_kill_2 & rrd_uops_2_REG_prs1_busy;
    exe_reg_uops_2_prs2_busy <= ~rrd_kill_2 & rrd_uops_2_REG_prs2_busy;
    exe_reg_uops_2_prs3_busy <= ~rrd_kill_2 & rrd_uops_2_REG_prs3_busy;
    exe_reg_uops_2_ppred_busy <= ~rrd_kill_2 & rrd_uops_2_REG_ppred_busy;
    exe_reg_uops_2_stale_pdst <= rrd_kill_2 ? 7'h0 : rrd_uops_2_REG_stale_pdst;
    exe_reg_uops_2_exception <= ~rrd_kill_2 & rrd_uops_2_REG_exception;
    exe_reg_uops_2_exc_cause <= rrd_kill_2 ? 64'h0 : rrd_uops_2_REG_exc_cause;
    exe_reg_uops_2_bypassable <= ~rrd_kill_2 & rrd_uops_2_REG_bypassable;
    exe_reg_uops_2_mem_cmd <= rrd_kill_2 ? 5'h0 : rrd_uops_2_REG_mem_cmd;
    exe_reg_uops_2_mem_size <= rrd_kill_2 ? 2'h0 : rrd_uops_2_REG_mem_size;
    exe_reg_uops_2_mem_signed <= ~rrd_kill_2 & rrd_uops_2_REG_mem_signed;
    exe_reg_uops_2_is_fence <= ~rrd_kill_2 & rrd_uops_2_REG_is_fence;
    exe_reg_uops_2_is_fencei <= ~rrd_kill_2 & rrd_uops_2_REG_is_fencei;
    exe_reg_uops_2_is_amo <= ~rrd_kill_2 & rrd_uops_2_REG_is_amo;
    exe_reg_uops_2_uses_ldq <= ~rrd_kill_2 & rrd_uops_2_REG_uses_ldq;
    exe_reg_uops_2_uses_stq <= ~rrd_kill_2 & rrd_uops_2_REG_uses_stq;
    exe_reg_uops_2_is_sys_pc2epc <= ~rrd_kill_2 & rrd_uops_2_REG_is_sys_pc2epc;
    exe_reg_uops_2_is_unique <= ~rrd_kill_2 & rrd_uops_2_REG_is_unique;
    exe_reg_uops_2_flush_on_commit <= ~rrd_kill_2 & rrd_uops_2_REG_flush_on_commit;
    exe_reg_uops_2_ldst_is_rs1 <= ~rrd_kill_2 & rrd_uops_2_REG_ldst_is_rs1;
    exe_reg_uops_2_ldst <= rrd_kill_2 ? 6'h0 : rrd_uops_2_REG_ldst;
    exe_reg_uops_2_lrs1 <= rrd_kill_2 ? 6'h0 : rrd_uops_2_REG_lrs1;
    exe_reg_uops_2_lrs2 <= rrd_kill_2 ? 6'h0 : rrd_uops_2_REG_lrs2;
    exe_reg_uops_2_lrs3 <= rrd_kill_2 ? 6'h0 : rrd_uops_2_REG_lrs3;
    exe_reg_uops_2_ldst_val <= ~rrd_kill_2 & rrd_uops_2_REG_ldst_val;
    exe_reg_uops_2_dst_rtype <= rrd_kill_2 ? 2'h2 : rrd_uops_2_REG_dst_rtype;
    exe_reg_uops_2_lrs1_rtype <= rrd_kill_2 ? 2'h0 : rrd_uops_2_REG_lrs1_rtype;
    exe_reg_uops_2_lrs2_rtype <= rrd_kill_2 ? 2'h0 : rrd_uops_2_REG_lrs2_rtype;
    exe_reg_uops_2_frs3_en <= ~rrd_kill_2 & rrd_uops_2_REG_frs3_en;
    exe_reg_uops_2_fp_val <= ~rrd_kill_2 & rrd_uops_2_REG_fp_val;
    exe_reg_uops_2_fp_single <= ~rrd_kill_2 & rrd_uops_2_REG_fp_single;
    exe_reg_uops_2_xcpt_pf_if <= ~rrd_kill_2 & rrd_uops_2_REG_xcpt_pf_if;
    exe_reg_uops_2_xcpt_ae_if <= ~rrd_kill_2 & rrd_uops_2_REG_xcpt_ae_if;
    exe_reg_uops_2_xcpt_ma_if <= ~rrd_kill_2 & rrd_uops_2_REG_xcpt_ma_if;
    exe_reg_uops_2_bp_debug_if <= ~rrd_kill_2 & rrd_uops_2_REG_bp_debug_if;
    exe_reg_uops_2_bp_xcpt_if <= ~rrd_kill_2 & rrd_uops_2_REG_bp_xcpt_if;
    exe_reg_uops_2_debug_fsrc <= rrd_kill_2 ? 2'h0 : rrd_uops_2_REG_debug_fsrc;
    exe_reg_uops_2_debug_tsrc <= rrd_kill_2 ? 2'h0 : rrd_uops_2_REG_debug_tsrc;
    exe_reg_uops_3_uopc <= rrd_kill_3 ? 7'h0 : rrd_uops_3_REG_uopc;
    exe_reg_uops_3_is_rvc <= ~rrd_kill_3 & rrd_uops_3_REG_is_rvc;
    exe_reg_uops_3_fu_code <= rrd_kill_3 ? 10'h0 : rrd_uops_3_REG_fu_code;
    exe_reg_uops_3_ctrl_br_type <= rrd_kill_3 ? 4'h0 : rrd_uops_3_REG_ctrl_br_type;
    exe_reg_uops_3_ctrl_op1_sel <= rrd_kill_3 ? 2'h0 : rrd_uops_3_REG_ctrl_op1_sel;
    exe_reg_uops_3_ctrl_op2_sel <= rrd_kill_3 ? 3'h0 : rrd_uops_3_REG_ctrl_op2_sel;
    exe_reg_uops_3_ctrl_imm_sel <= rrd_kill_3 ? 3'h0 : rrd_uops_3_REG_ctrl_imm_sel;
    exe_reg_uops_3_ctrl_op_fcn <= rrd_kill_3 ? 4'h0 : rrd_uops_3_REG_ctrl_op_fcn;
    exe_reg_uops_3_ctrl_fcn_dw <= ~rrd_kill_3 & rrd_uops_3_REG_ctrl_fcn_dw;
    exe_reg_uops_3_ctrl_csr_cmd <= rrd_kill_3 ? 3'h0 : rrd_uops_3_REG_ctrl_csr_cmd;
    exe_reg_uops_3_is_br <= ~rrd_kill_3 & rrd_uops_3_REG_is_br;
    exe_reg_uops_3_is_jalr <= ~rrd_kill_3 & rrd_uops_3_REG_is_jalr;
    exe_reg_uops_3_is_jal <= ~rrd_kill_3 & rrd_uops_3_REG_is_jal;
    exe_reg_uops_3_is_sfb <= ~rrd_kill_3 & rrd_uops_3_REG_is_sfb;
    exe_reg_uops_3_br_mask <= rrd_uops_3_REG_br_mask & ~io_brupdate_b1_resolve_mask;
    exe_reg_uops_3_br_tag <= rrd_kill_3 ? 5'h0 : rrd_uops_3_REG_br_tag;
    exe_reg_uops_3_ftq_idx <= rrd_kill_3 ? 6'h0 : rrd_uops_3_REG_ftq_idx;
    exe_reg_uops_3_edge_inst <= ~rrd_kill_3 & rrd_uops_3_REG_edge_inst;
    exe_reg_uops_3_pc_lob <= rrd_kill_3 ? 6'h0 : rrd_uops_3_REG_pc_lob;
    exe_reg_uops_3_taken <= ~rrd_kill_3 & rrd_uops_3_REG_taken;
    exe_reg_uops_3_imm_packed <= rrd_kill_3 ? 20'h0 : rrd_uops_3_REG_imm_packed;
    exe_reg_uops_3_rob_idx <= rrd_kill_3 ? 7'h0 : rrd_uops_3_REG_rob_idx;
    exe_reg_uops_3_ldq_idx <= rrd_kill_3 ? 5'h0 : rrd_uops_3_REG_ldq_idx;
    exe_reg_uops_3_stq_idx <= rrd_kill_3 ? 5'h0 : rrd_uops_3_REG_stq_idx;
    exe_reg_uops_3_pdst <= rrd_kill_3 ? 7'h0 : rrd_uops_3_REG_pdst;
    exe_reg_uops_3_prs1 <= rrd_kill_3 ? 7'h0 : rrd_uops_3_REG_prs1;
    exe_reg_uops_3_bypassable <= ~rrd_kill_3 & rrd_uops_3_REG_bypassable;
    exe_reg_uops_3_is_amo <= ~rrd_kill_3 & rrd_uops_3_REG_is_amo;
    exe_reg_uops_3_uses_stq <= ~rrd_kill_3 & rrd_uops_3_REG_uses_stq;
    exe_reg_uops_3_dst_rtype <= rrd_kill_3 ? 2'h2 : rrd_uops_3_REG_dst_rtype;
    exe_reg_uops_4_uopc <= rrd_kill_4 ? 7'h0 : rrd_uops_4_REG_uopc;
    exe_reg_uops_4_is_rvc <= ~rrd_kill_4 & rrd_uops_4_REG_is_rvc;
    exe_reg_uops_4_fu_code <= rrd_kill_4 ? 10'h0 : rrd_uops_4_REG_fu_code;
    exe_reg_uops_4_ctrl_br_type <= rrd_kill_4 ? 4'h0 : rrd_uops_4_REG_ctrl_br_type;
    exe_reg_uops_4_ctrl_op1_sel <= rrd_kill_4 ? 2'h0 : rrd_uops_4_REG_ctrl_op1_sel;
    exe_reg_uops_4_ctrl_op2_sel <= rrd_kill_4 ? 3'h0 : rrd_uops_4_REG_ctrl_op2_sel;
    exe_reg_uops_4_ctrl_imm_sel <= rrd_kill_4 ? 3'h0 : rrd_uops_4_REG_ctrl_imm_sel;
    exe_reg_uops_4_ctrl_op_fcn <= rrd_kill_4 ? 4'h0 : rrd_uops_4_REG_ctrl_op_fcn;
    exe_reg_uops_4_ctrl_fcn_dw <= ~rrd_kill_4 & rrd_uops_4_REG_ctrl_fcn_dw;
    exe_reg_uops_4_is_br <= ~rrd_kill_4 & rrd_uops_4_REG_is_br;
    exe_reg_uops_4_is_jalr <= ~rrd_kill_4 & rrd_uops_4_REG_is_jalr;
    exe_reg_uops_4_is_jal <= ~rrd_kill_4 & rrd_uops_4_REG_is_jal;
    exe_reg_uops_4_is_sfb <= ~rrd_kill_4 & rrd_uops_4_REG_is_sfb;
    exe_reg_uops_4_br_mask <= rrd_uops_4_REG_br_mask & ~io_brupdate_b1_resolve_mask;
    exe_reg_uops_4_br_tag <= rrd_kill_4 ? 5'h0 : rrd_uops_4_REG_br_tag;
    exe_reg_uops_4_ftq_idx <= rrd_kill_4 ? 6'h0 : rrd_uops_4_REG_ftq_idx;
    exe_reg_uops_4_edge_inst <= ~rrd_kill_4 & rrd_uops_4_REG_edge_inst;
    exe_reg_uops_4_pc_lob <= rrd_kill_4 ? 6'h0 : rrd_uops_4_REG_pc_lob;
    exe_reg_uops_4_taken <= ~rrd_kill_4 & rrd_uops_4_REG_taken;
    exe_reg_uops_4_imm_packed <= rrd_kill_4 ? 20'h0 : rrd_uops_4_REG_imm_packed;
    exe_reg_uops_4_rob_idx <= rrd_kill_4 ? 7'h0 : rrd_uops_4_REG_rob_idx;
    exe_reg_uops_4_ldq_idx <= rrd_kill_4 ? 5'h0 : rrd_uops_4_REG_ldq_idx;
    exe_reg_uops_4_stq_idx <= rrd_kill_4 ? 5'h0 : rrd_uops_4_REG_stq_idx;
    exe_reg_uops_4_pdst <= rrd_kill_4 ? 7'h0 : rrd_uops_4_REG_pdst;
    exe_reg_uops_4_prs1 <= rrd_kill_4 ? 7'h0 : rrd_uops_4_REG_prs1;
    exe_reg_uops_4_bypassable <= ~rrd_kill_4 & rrd_uops_4_REG_bypassable;
    exe_reg_uops_4_is_amo <= ~rrd_kill_4 & rrd_uops_4_REG_is_amo;
    exe_reg_uops_4_uses_stq <= ~rrd_kill_4 & rrd_uops_4_REG_uses_stq;
    exe_reg_uops_4_dst_rtype <= rrd_kill_4 ? 2'h2 : rrd_uops_4_REG_dst_rtype;
    exe_reg_uops_5_uopc <= rrd_kill_5 ? 7'h0 : rrd_uops_5_REG_uopc;
    exe_reg_uops_5_is_rvc <= ~rrd_kill_5 & rrd_uops_5_REG_is_rvc;
    exe_reg_uops_5_fu_code <= rrd_kill_5 ? 10'h0 : rrd_uops_5_REG_fu_code;
    exe_reg_uops_5_ctrl_br_type <= rrd_kill_5 ? 4'h0 : rrd_uops_5_REG_ctrl_br_type;
    exe_reg_uops_5_ctrl_op1_sel <= rrd_kill_5 ? 2'h0 : rrd_uops_5_REG_ctrl_op1_sel;
    exe_reg_uops_5_ctrl_op2_sel <= rrd_kill_5 ? 3'h0 : rrd_uops_5_REG_ctrl_op2_sel;
    exe_reg_uops_5_ctrl_imm_sel <= rrd_kill_5 ? 3'h0 : rrd_uops_5_REG_ctrl_imm_sel;
    exe_reg_uops_5_ctrl_op_fcn <= rrd_kill_5 ? 4'h0 : rrd_uops_5_REG_ctrl_op_fcn;
    exe_reg_uops_5_ctrl_fcn_dw <= ~rrd_kill_5 & rrd_uops_5_REG_ctrl_fcn_dw;
    exe_reg_uops_5_ctrl_csr_cmd <= rrd_kill_5 ? 3'h0 : rrd_uops_5_REG_ctrl_csr_cmd;
    exe_reg_uops_5_is_br <= ~rrd_kill_5 & rrd_uops_5_REG_is_br;
    exe_reg_uops_5_is_jalr <= ~rrd_kill_5 & rrd_uops_5_REG_is_jalr;
    exe_reg_uops_5_is_jal <= ~rrd_kill_5 & rrd_uops_5_REG_is_jal;
    exe_reg_uops_5_is_sfb <= ~rrd_kill_5 & rrd_uops_5_REG_is_sfb;
    exe_reg_uops_5_br_mask <= rrd_uops_5_REG_br_mask & ~io_brupdate_b1_resolve_mask;
    exe_reg_uops_5_br_tag <= rrd_kill_5 ? 5'h0 : rrd_uops_5_REG_br_tag;
    exe_reg_uops_5_ftq_idx <= rrd_kill_5 ? 6'h0 : rrd_uops_5_REG_ftq_idx;
    exe_reg_uops_5_edge_inst <= ~rrd_kill_5 & rrd_uops_5_REG_edge_inst;
    exe_reg_uops_5_pc_lob <= rrd_kill_5 ? 6'h0 : rrd_uops_5_REG_pc_lob;
    exe_reg_uops_5_taken <= ~rrd_kill_5 & rrd_uops_5_REG_taken;
    exe_reg_uops_5_imm_packed <= rrd_kill_5 ? 20'h0 : rrd_uops_5_REG_imm_packed;
    exe_reg_uops_5_rob_idx <= rrd_kill_5 ? 7'h0 : rrd_uops_5_REG_rob_idx;
    exe_reg_uops_5_ldq_idx <= rrd_kill_5 ? 5'h0 : rrd_uops_5_REG_ldq_idx;
    exe_reg_uops_5_stq_idx <= rrd_kill_5 ? 5'h0 : rrd_uops_5_REG_stq_idx;
    exe_reg_uops_5_pdst <= rrd_kill_5 ? 7'h0 : rrd_uops_5_REG_pdst;
    exe_reg_uops_5_prs1 <= rrd_kill_5 ? 7'h0 : rrd_uops_5_REG_prs1;
    exe_reg_uops_5_bypassable <= ~rrd_kill_5 & rrd_uops_5_REG_bypassable;
    exe_reg_uops_5_is_amo <= ~rrd_kill_5 & rrd_uops_5_REG_is_amo;
    exe_reg_uops_5_uses_stq <= ~rrd_kill_5 & rrd_uops_5_REG_uses_stq;
    exe_reg_uops_5_dst_rtype <= rrd_kill_5 ? 2'h2 : rrd_uops_5_REG_dst_rtype;
    exe_reg_rs1_data_0 <= io_bypass_0_valid & rrd_uops_0_REG_prs1 == io_bypass_0_bits_uop_pdst & _GEN & _GEN_0 & _GEN_1 & (|rrd_uops_0_REG_prs1) ? io_bypass_0_bits_data : io_bypass_1_valid & rrd_uops_0_REG_prs1 == io_bypass_1_bits_uop_pdst & _GEN_3 & _GEN_4 & _GEN_1 & (|rrd_uops_0_REG_prs1) ? io_bypass_1_bits_data : io_bypass_2_valid & rrd_uops_0_REG_prs1 == io_bypass_2_bits_uop_pdst & _GEN_5 & _GEN_6 & _GEN_1 & (|rrd_uops_0_REG_prs1) ? io_bypass_2_bits_data : io_bypass_3_valid & rrd_uops_0_REG_prs1 == io_bypass_3_bits_uop_pdst & _GEN_7 & _GEN_8 & _GEN_1 & (|rrd_uops_0_REG_prs1) ? io_bypass_3_bits_data : io_bypass_4_valid & rrd_uops_0_REG_prs1 == io_bypass_4_bits_uop_pdst & _GEN_9 & _GEN_10 & _GEN_1 & (|rrd_uops_0_REG_prs1) ? io_bypass_4_bits_data : io_bypass_5_valid & rrd_uops_0_REG_prs1 == io_bypass_5_bits_uop_pdst & _GEN_11 & _GEN_12 & _GEN_1 & (|rrd_uops_0_REG_prs1) ? io_bypass_5_bits_data : rrd_rs1_data_0_REG ? 64'h0 : io_rf_read_ports_0_data;
    exe_reg_rs1_data_1 <= io_bypass_0_valid & rrd_uops_1_REG_prs1 == io_bypass_0_bits_uop_pdst & _GEN & _GEN_0 & _GEN_13 & (|rrd_uops_1_REG_prs1) ? io_bypass_0_bits_data : io_bypass_1_valid & rrd_uops_1_REG_prs1 == io_bypass_1_bits_uop_pdst & _GEN_3 & _GEN_4 & _GEN_13 & (|rrd_uops_1_REG_prs1) ? io_bypass_1_bits_data : io_bypass_2_valid & rrd_uops_1_REG_prs1 == io_bypass_2_bits_uop_pdst & _GEN_5 & _GEN_6 & _GEN_13 & (|rrd_uops_1_REG_prs1) ? io_bypass_2_bits_data : io_bypass_3_valid & rrd_uops_1_REG_prs1 == io_bypass_3_bits_uop_pdst & _GEN_7 & _GEN_8 & _GEN_13 & (|rrd_uops_1_REG_prs1) ? io_bypass_3_bits_data : io_bypass_4_valid & rrd_uops_1_REG_prs1 == io_bypass_4_bits_uop_pdst & _GEN_9 & _GEN_10 & _GEN_13 & (|rrd_uops_1_REG_prs1) ? io_bypass_4_bits_data : io_bypass_5_valid & rrd_uops_1_REG_prs1 == io_bypass_5_bits_uop_pdst & _GEN_11 & _GEN_12 & _GEN_13 & (|rrd_uops_1_REG_prs1) ? io_bypass_5_bits_data : rrd_rs1_data_1_REG ? 64'h0 : io_rf_read_ports_2_data;
    exe_reg_rs1_data_2 <= io_bypass_0_valid & rrd_uops_2_REG_prs1 == io_bypass_0_bits_uop_pdst & _GEN & _GEN_0 & _GEN_15 & (|rrd_uops_2_REG_prs1) ? io_bypass_0_bits_data : io_bypass_1_valid & rrd_uops_2_REG_prs1 == io_bypass_1_bits_uop_pdst & _GEN_3 & _GEN_4 & _GEN_15 & (|rrd_uops_2_REG_prs1) ? io_bypass_1_bits_data : io_bypass_2_valid & rrd_uops_2_REG_prs1 == io_bypass_2_bits_uop_pdst & _GEN_5 & _GEN_6 & _GEN_15 & (|rrd_uops_2_REG_prs1) ? io_bypass_2_bits_data : io_bypass_3_valid & rrd_uops_2_REG_prs1 == io_bypass_3_bits_uop_pdst & _GEN_7 & _GEN_8 & _GEN_15 & (|rrd_uops_2_REG_prs1) ? io_bypass_3_bits_data : io_bypass_4_valid & rrd_uops_2_REG_prs1 == io_bypass_4_bits_uop_pdst & _GEN_9 & _GEN_10 & _GEN_15 & (|rrd_uops_2_REG_prs1) ? io_bypass_4_bits_data : io_bypass_5_valid & rrd_uops_2_REG_prs1 == io_bypass_5_bits_uop_pdst & _GEN_11 & _GEN_12 & _GEN_15 & (|rrd_uops_2_REG_prs1) ? io_bypass_5_bits_data : rrd_rs1_data_2_REG ? 64'h0 : io_rf_read_ports_4_data;
    exe_reg_rs1_data_3 <= io_bypass_0_valid & rrd_uops_3_REG_prs1 == io_bypass_0_bits_uop_pdst & _GEN & _GEN_0 & _GEN_17 & (|rrd_uops_3_REG_prs1) ? io_bypass_0_bits_data : io_bypass_1_valid & rrd_uops_3_REG_prs1 == io_bypass_1_bits_uop_pdst & _GEN_3 & _GEN_4 & _GEN_17 & (|rrd_uops_3_REG_prs1) ? io_bypass_1_bits_data : io_bypass_2_valid & rrd_uops_3_REG_prs1 == io_bypass_2_bits_uop_pdst & _GEN_5 & _GEN_6 & _GEN_17 & (|rrd_uops_3_REG_prs1) ? io_bypass_2_bits_data : io_bypass_3_valid & rrd_uops_3_REG_prs1 == io_bypass_3_bits_uop_pdst & _GEN_7 & _GEN_8 & _GEN_17 & (|rrd_uops_3_REG_prs1) ? io_bypass_3_bits_data : io_bypass_4_valid & rrd_uops_3_REG_prs1 == io_bypass_4_bits_uop_pdst & _GEN_9 & _GEN_10 & _GEN_17 & (|rrd_uops_3_REG_prs1) ? io_bypass_4_bits_data : io_bypass_5_valid & rrd_uops_3_REG_prs1 == io_bypass_5_bits_uop_pdst & _GEN_11 & _GEN_12 & _GEN_17 & (|rrd_uops_3_REG_prs1) ? io_bypass_5_bits_data : rrd_rs1_data_3_REG ? 64'h0 : io_rf_read_ports_6_data;
    exe_reg_rs1_data_4 <= io_bypass_0_valid & rrd_uops_4_REG_prs1 == io_bypass_0_bits_uop_pdst & _GEN & _GEN_0 & _GEN_19 & (|rrd_uops_4_REG_prs1) ? io_bypass_0_bits_data : io_bypass_1_valid & rrd_uops_4_REG_prs1 == io_bypass_1_bits_uop_pdst & _GEN_3 & _GEN_4 & _GEN_19 & (|rrd_uops_4_REG_prs1) ? io_bypass_1_bits_data : io_bypass_2_valid & rrd_uops_4_REG_prs1 == io_bypass_2_bits_uop_pdst & _GEN_5 & _GEN_6 & _GEN_19 & (|rrd_uops_4_REG_prs1) ? io_bypass_2_bits_data : io_bypass_3_valid & rrd_uops_4_REG_prs1 == io_bypass_3_bits_uop_pdst & _GEN_7 & _GEN_8 & _GEN_19 & (|rrd_uops_4_REG_prs1) ? io_bypass_3_bits_data : io_bypass_4_valid & rrd_uops_4_REG_prs1 == io_bypass_4_bits_uop_pdst & _GEN_9 & _GEN_10 & _GEN_19 & (|rrd_uops_4_REG_prs1) ? io_bypass_4_bits_data : io_bypass_5_valid & rrd_uops_4_REG_prs1 == io_bypass_5_bits_uop_pdst & _GEN_11 & _GEN_12 & _GEN_19 & (|rrd_uops_4_REG_prs1) ? io_bypass_5_bits_data : rrd_rs1_data_4_REG ? 64'h0 : io_rf_read_ports_8_data;
    exe_reg_rs1_data_5 <= io_bypass_0_valid & rrd_uops_5_REG_prs1 == io_bypass_0_bits_uop_pdst & _GEN & _GEN_0 & _GEN_21 & (|rrd_uops_5_REG_prs1) ? io_bypass_0_bits_data : io_bypass_1_valid & rrd_uops_5_REG_prs1 == io_bypass_1_bits_uop_pdst & _GEN_3 & _GEN_4 & _GEN_21 & (|rrd_uops_5_REG_prs1) ? io_bypass_1_bits_data : io_bypass_2_valid & rrd_uops_5_REG_prs1 == io_bypass_2_bits_uop_pdst & _GEN_5 & _GEN_6 & _GEN_21 & (|rrd_uops_5_REG_prs1) ? io_bypass_2_bits_data : io_bypass_3_valid & rrd_uops_5_REG_prs1 == io_bypass_3_bits_uop_pdst & _GEN_7 & _GEN_8 & _GEN_21 & (|rrd_uops_5_REG_prs1) ? io_bypass_3_bits_data : io_bypass_4_valid & rrd_uops_5_REG_prs1 == io_bypass_4_bits_uop_pdst & _GEN_9 & _GEN_10 & _GEN_21 & (|rrd_uops_5_REG_prs1) ? io_bypass_4_bits_data : io_bypass_5_valid & rrd_uops_5_REG_prs1 == io_bypass_5_bits_uop_pdst & _GEN_11 & _GEN_12 & _GEN_21 & (|rrd_uops_5_REG_prs1) ? io_bypass_5_bits_data : rrd_rs1_data_5_REG ? 64'h0 : io_rf_read_ports_10_data;
    exe_reg_rs2_data_0 <= io_bypass_0_valid & rrd_uops_0_REG_prs2 == io_bypass_0_bits_uop_pdst & _GEN & _GEN_0 & _GEN_2 & (|rrd_uops_0_REG_prs2) ? io_bypass_0_bits_data : io_bypass_1_valid & rrd_uops_0_REG_prs2 == io_bypass_1_bits_uop_pdst & _GEN_3 & _GEN_4 & _GEN_2 & (|rrd_uops_0_REG_prs2) ? io_bypass_1_bits_data : io_bypass_2_valid & rrd_uops_0_REG_prs2 == io_bypass_2_bits_uop_pdst & _GEN_5 & _GEN_6 & _GEN_2 & (|rrd_uops_0_REG_prs2) ? io_bypass_2_bits_data : io_bypass_3_valid & rrd_uops_0_REG_prs2 == io_bypass_3_bits_uop_pdst & _GEN_7 & _GEN_8 & _GEN_2 & (|rrd_uops_0_REG_prs2) ? io_bypass_3_bits_data : io_bypass_4_valid & rrd_uops_0_REG_prs2 == io_bypass_4_bits_uop_pdst & _GEN_9 & _GEN_10 & _GEN_2 & (|rrd_uops_0_REG_prs2) ? io_bypass_4_bits_data : io_bypass_5_valid & rrd_uops_0_REG_prs2 == io_bypass_5_bits_uop_pdst & _GEN_11 & _GEN_12 & _GEN_2 & (|rrd_uops_0_REG_prs2) ? io_bypass_5_bits_data : rrd_rs2_data_0_REG ? 64'h0 : io_rf_read_ports_1_data;
    exe_reg_rs2_data_1 <= io_bypass_0_valid & rrd_uops_1_REG_prs2 == io_bypass_0_bits_uop_pdst & _GEN & _GEN_0 & _GEN_14 & (|rrd_uops_1_REG_prs2) ? io_bypass_0_bits_data : io_bypass_1_valid & rrd_uops_1_REG_prs2 == io_bypass_1_bits_uop_pdst & _GEN_3 & _GEN_4 & _GEN_14 & (|rrd_uops_1_REG_prs2) ? io_bypass_1_bits_data : io_bypass_2_valid & rrd_uops_1_REG_prs2 == io_bypass_2_bits_uop_pdst & _GEN_5 & _GEN_6 & _GEN_14 & (|rrd_uops_1_REG_prs2) ? io_bypass_2_bits_data : io_bypass_3_valid & rrd_uops_1_REG_prs2 == io_bypass_3_bits_uop_pdst & _GEN_7 & _GEN_8 & _GEN_14 & (|rrd_uops_1_REG_prs2) ? io_bypass_3_bits_data : io_bypass_4_valid & rrd_uops_1_REG_prs2 == io_bypass_4_bits_uop_pdst & _GEN_9 & _GEN_10 & _GEN_14 & (|rrd_uops_1_REG_prs2) ? io_bypass_4_bits_data : io_bypass_5_valid & rrd_uops_1_REG_prs2 == io_bypass_5_bits_uop_pdst & _GEN_11 & _GEN_12 & _GEN_14 & (|rrd_uops_1_REG_prs2) ? io_bypass_5_bits_data : rrd_rs2_data_1_REG ? 64'h0 : io_rf_read_ports_3_data;
    exe_reg_rs2_data_2 <= io_bypass_0_valid & rrd_uops_2_REG_prs2 == io_bypass_0_bits_uop_pdst & _GEN & _GEN_0 & _GEN_16 & (|rrd_uops_2_REG_prs2) ? io_bypass_0_bits_data : io_bypass_1_valid & rrd_uops_2_REG_prs2 == io_bypass_1_bits_uop_pdst & _GEN_3 & _GEN_4 & _GEN_16 & (|rrd_uops_2_REG_prs2) ? io_bypass_1_bits_data : io_bypass_2_valid & rrd_uops_2_REG_prs2 == io_bypass_2_bits_uop_pdst & _GEN_5 & _GEN_6 & _GEN_16 & (|rrd_uops_2_REG_prs2) ? io_bypass_2_bits_data : io_bypass_3_valid & rrd_uops_2_REG_prs2 == io_bypass_3_bits_uop_pdst & _GEN_7 & _GEN_8 & _GEN_16 & (|rrd_uops_2_REG_prs2) ? io_bypass_3_bits_data : io_bypass_4_valid & rrd_uops_2_REG_prs2 == io_bypass_4_bits_uop_pdst & _GEN_9 & _GEN_10 & _GEN_16 & (|rrd_uops_2_REG_prs2) ? io_bypass_4_bits_data : io_bypass_5_valid & rrd_uops_2_REG_prs2 == io_bypass_5_bits_uop_pdst & _GEN_11 & _GEN_12 & _GEN_16 & (|rrd_uops_2_REG_prs2) ? io_bypass_5_bits_data : rrd_rs2_data_2_REG ? 64'h0 : io_rf_read_ports_5_data;
    exe_reg_rs2_data_3 <= io_bypass_0_valid & rrd_uops_3_REG_prs2 == io_bypass_0_bits_uop_pdst & _GEN & _GEN_0 & _GEN_18 & (|rrd_uops_3_REG_prs2) ? io_bypass_0_bits_data : io_bypass_1_valid & rrd_uops_3_REG_prs2 == io_bypass_1_bits_uop_pdst & _GEN_3 & _GEN_4 & _GEN_18 & (|rrd_uops_3_REG_prs2) ? io_bypass_1_bits_data : io_bypass_2_valid & rrd_uops_3_REG_prs2 == io_bypass_2_bits_uop_pdst & _GEN_5 & _GEN_6 & _GEN_18 & (|rrd_uops_3_REG_prs2) ? io_bypass_2_bits_data : io_bypass_3_valid & rrd_uops_3_REG_prs2 == io_bypass_3_bits_uop_pdst & _GEN_7 & _GEN_8 & _GEN_18 & (|rrd_uops_3_REG_prs2) ? io_bypass_3_bits_data : io_bypass_4_valid & rrd_uops_3_REG_prs2 == io_bypass_4_bits_uop_pdst & _GEN_9 & _GEN_10 & _GEN_18 & (|rrd_uops_3_REG_prs2) ? io_bypass_4_bits_data : io_bypass_5_valid & rrd_uops_3_REG_prs2 == io_bypass_5_bits_uop_pdst & _GEN_11 & _GEN_12 & _GEN_18 & (|rrd_uops_3_REG_prs2) ? io_bypass_5_bits_data : rrd_rs2_data_3_REG ? 64'h0 : io_rf_read_ports_7_data;
    exe_reg_rs2_data_4 <= io_bypass_0_valid & rrd_uops_4_REG_prs2 == io_bypass_0_bits_uop_pdst & _GEN & _GEN_0 & _GEN_20 & (|rrd_uops_4_REG_prs2) ? io_bypass_0_bits_data : io_bypass_1_valid & rrd_uops_4_REG_prs2 == io_bypass_1_bits_uop_pdst & _GEN_3 & _GEN_4 & _GEN_20 & (|rrd_uops_4_REG_prs2) ? io_bypass_1_bits_data : io_bypass_2_valid & rrd_uops_4_REG_prs2 == io_bypass_2_bits_uop_pdst & _GEN_5 & _GEN_6 & _GEN_20 & (|rrd_uops_4_REG_prs2) ? io_bypass_2_bits_data : io_bypass_3_valid & rrd_uops_4_REG_prs2 == io_bypass_3_bits_uop_pdst & _GEN_7 & _GEN_8 & _GEN_20 & (|rrd_uops_4_REG_prs2) ? io_bypass_3_bits_data : io_bypass_4_valid & rrd_uops_4_REG_prs2 == io_bypass_4_bits_uop_pdst & _GEN_9 & _GEN_10 & _GEN_20 & (|rrd_uops_4_REG_prs2) ? io_bypass_4_bits_data : io_bypass_5_valid & rrd_uops_4_REG_prs2 == io_bypass_5_bits_uop_pdst & _GEN_11 & _GEN_12 & _GEN_20 & (|rrd_uops_4_REG_prs2) ? io_bypass_5_bits_data : rrd_rs2_data_4_REG ? 64'h0 : io_rf_read_ports_9_data;
    exe_reg_rs2_data_5 <= io_bypass_0_valid & rrd_uops_5_REG_prs2 == io_bypass_0_bits_uop_pdst & _GEN & _GEN_0 & _GEN_22 & (|rrd_uops_5_REG_prs2) ? io_bypass_0_bits_data : io_bypass_1_valid & rrd_uops_5_REG_prs2 == io_bypass_1_bits_uop_pdst & _GEN_3 & _GEN_4 & _GEN_22 & (|rrd_uops_5_REG_prs2) ? io_bypass_1_bits_data : io_bypass_2_valid & rrd_uops_5_REG_prs2 == io_bypass_2_bits_uop_pdst & _GEN_5 & _GEN_6 & _GEN_22 & (|rrd_uops_5_REG_prs2) ? io_bypass_2_bits_data : io_bypass_3_valid & rrd_uops_5_REG_prs2 == io_bypass_3_bits_uop_pdst & _GEN_7 & _GEN_8 & _GEN_22 & (|rrd_uops_5_REG_prs2) ? io_bypass_3_bits_data : io_bypass_4_valid & rrd_uops_5_REG_prs2 == io_bypass_4_bits_uop_pdst & _GEN_9 & _GEN_10 & _GEN_22 & (|rrd_uops_5_REG_prs2) ? io_bypass_4_bits_data : io_bypass_5_valid & rrd_uops_5_REG_prs2 == io_bypass_5_bits_uop_pdst & _GEN_11 & _GEN_12 & _GEN_22 & (|rrd_uops_5_REG_prs2) ? io_bypass_5_bits_data : rrd_rs2_data_5_REG ? 64'h0 : io_rf_read_ports_11_data;
    rrd_valids_0_REG <= _rrd_decode_unit_io_rrd_valid & (io_brupdate_b1_mispredict_mask & _rrd_decode_unit_io_rrd_uop_br_mask) == 20'h0;
    rrd_uops_0_REG_uopc <= _rrd_decode_unit_io_rrd_uop_uopc;
    rrd_uops_0_REG_inst <= _rrd_decode_unit_io_rrd_uop_inst;
    rrd_uops_0_REG_debug_inst <= _rrd_decode_unit_io_rrd_uop_debug_inst;
    rrd_uops_0_REG_is_rvc <= _rrd_decode_unit_io_rrd_uop_is_rvc;
    rrd_uops_0_REG_debug_pc <= _rrd_decode_unit_io_rrd_uop_debug_pc;
    rrd_uops_0_REG_iq_type <= _rrd_decode_unit_io_rrd_uop_iq_type;
    rrd_uops_0_REG_fu_code <= _rrd_decode_unit_io_rrd_uop_fu_code;
    rrd_uops_0_REG_ctrl_br_type <= _rrd_decode_unit_io_rrd_uop_ctrl_br_type;
    rrd_uops_0_REG_ctrl_op1_sel <= _rrd_decode_unit_io_rrd_uop_ctrl_op1_sel;
    rrd_uops_0_REG_ctrl_op2_sel <= _rrd_decode_unit_io_rrd_uop_ctrl_op2_sel;
    rrd_uops_0_REG_ctrl_imm_sel <= _rrd_decode_unit_io_rrd_uop_ctrl_imm_sel;
    rrd_uops_0_REG_ctrl_op_fcn <= _rrd_decode_unit_io_rrd_uop_ctrl_op_fcn;
    rrd_uops_0_REG_ctrl_fcn_dw <= _rrd_decode_unit_io_rrd_uop_ctrl_fcn_dw;
    rrd_uops_0_REG_ctrl_csr_cmd <= _rrd_decode_unit_io_rrd_uop_ctrl_csr_cmd;
    rrd_uops_0_REG_ctrl_is_load <= _rrd_decode_unit_io_rrd_uop_ctrl_is_load;
    rrd_uops_0_REG_ctrl_is_sta <= _rrd_decode_unit_io_rrd_uop_ctrl_is_sta;
    rrd_uops_0_REG_ctrl_is_std <= _rrd_decode_unit_io_rrd_uop_ctrl_is_std;
    rrd_uops_0_REG_iw_state <= _rrd_decode_unit_io_rrd_uop_iw_state;
    rrd_uops_0_REG_is_br <= _rrd_decode_unit_io_rrd_uop_is_br;
    rrd_uops_0_REG_is_jalr <= _rrd_decode_unit_io_rrd_uop_is_jalr;
    rrd_uops_0_REG_is_jal <= _rrd_decode_unit_io_rrd_uop_is_jal;
    rrd_uops_0_REG_is_sfb <= _rrd_decode_unit_io_rrd_uop_is_sfb;
    rrd_uops_0_REG_br_mask <= _rrd_decode_unit_io_rrd_uop_br_mask & ~io_brupdate_b1_resolve_mask;
    rrd_uops_0_REG_br_tag <= _rrd_decode_unit_io_rrd_uop_br_tag;
    rrd_uops_0_REG_ftq_idx <= _rrd_decode_unit_io_rrd_uop_ftq_idx;
    rrd_uops_0_REG_edge_inst <= _rrd_decode_unit_io_rrd_uop_edge_inst;
    rrd_uops_0_REG_pc_lob <= _rrd_decode_unit_io_rrd_uop_pc_lob;
    rrd_uops_0_REG_taken <= _rrd_decode_unit_io_rrd_uop_taken;
    rrd_uops_0_REG_imm_packed <= _rrd_decode_unit_io_rrd_uop_imm_packed;
    rrd_uops_0_REG_csr_addr <= _rrd_decode_unit_io_rrd_uop_csr_addr;
    rrd_uops_0_REG_rob_idx <= _rrd_decode_unit_io_rrd_uop_rob_idx;
    rrd_uops_0_REG_ldq_idx <= _rrd_decode_unit_io_rrd_uop_ldq_idx;
    rrd_uops_0_REG_stq_idx <= _rrd_decode_unit_io_rrd_uop_stq_idx;
    rrd_uops_0_REG_rxq_idx <= _rrd_decode_unit_io_rrd_uop_rxq_idx;
    rrd_uops_0_REG_pdst <= _rrd_decode_unit_io_rrd_uop_pdst;
    rrd_uops_0_REG_prs1 <= _rrd_decode_unit_io_rrd_uop_prs1;
    rrd_uops_0_REG_prs2 <= _rrd_decode_unit_io_rrd_uop_prs2;
    rrd_uops_0_REG_prs3 <= _rrd_decode_unit_io_rrd_uop_prs3;
    rrd_uops_0_REG_ppred <= _rrd_decode_unit_io_rrd_uop_ppred;
    rrd_uops_0_REG_prs1_busy <= _rrd_decode_unit_io_rrd_uop_prs1_busy;
    rrd_uops_0_REG_prs2_busy <= _rrd_decode_unit_io_rrd_uop_prs2_busy;
    rrd_uops_0_REG_prs3_busy <= _rrd_decode_unit_io_rrd_uop_prs3_busy;
    rrd_uops_0_REG_ppred_busy <= _rrd_decode_unit_io_rrd_uop_ppred_busy;
    rrd_uops_0_REG_stale_pdst <= _rrd_decode_unit_io_rrd_uop_stale_pdst;
    rrd_uops_0_REG_exception <= _rrd_decode_unit_io_rrd_uop_exception;
    rrd_uops_0_REG_exc_cause <= _rrd_decode_unit_io_rrd_uop_exc_cause;
    rrd_uops_0_REG_bypassable <= _rrd_decode_unit_io_rrd_uop_bypassable;
    rrd_uops_0_REG_mem_cmd <= _rrd_decode_unit_io_rrd_uop_mem_cmd;
    rrd_uops_0_REG_mem_size <= _rrd_decode_unit_io_rrd_uop_mem_size;
    rrd_uops_0_REG_mem_signed <= _rrd_decode_unit_io_rrd_uop_mem_signed;
    rrd_uops_0_REG_is_fence <= _rrd_decode_unit_io_rrd_uop_is_fence;
    rrd_uops_0_REG_is_fencei <= _rrd_decode_unit_io_rrd_uop_is_fencei;
    rrd_uops_0_REG_is_amo <= _rrd_decode_unit_io_rrd_uop_is_amo;
    rrd_uops_0_REG_uses_ldq <= _rrd_decode_unit_io_rrd_uop_uses_ldq;
    rrd_uops_0_REG_uses_stq <= _rrd_decode_unit_io_rrd_uop_uses_stq;
    rrd_uops_0_REG_is_sys_pc2epc <= _rrd_decode_unit_io_rrd_uop_is_sys_pc2epc;
    rrd_uops_0_REG_is_unique <= _rrd_decode_unit_io_rrd_uop_is_unique;
    rrd_uops_0_REG_flush_on_commit <= _rrd_decode_unit_io_rrd_uop_flush_on_commit;
    rrd_uops_0_REG_ldst_is_rs1 <= _rrd_decode_unit_io_rrd_uop_ldst_is_rs1;
    rrd_uops_0_REG_ldst <= _rrd_decode_unit_io_rrd_uop_ldst;
    rrd_uops_0_REG_lrs1 <= _rrd_decode_unit_io_rrd_uop_lrs1;
    rrd_uops_0_REG_lrs2 <= _rrd_decode_unit_io_rrd_uop_lrs2;
    rrd_uops_0_REG_lrs3 <= _rrd_decode_unit_io_rrd_uop_lrs3;
    rrd_uops_0_REG_ldst_val <= _rrd_decode_unit_io_rrd_uop_ldst_val;
    rrd_uops_0_REG_dst_rtype <= _rrd_decode_unit_io_rrd_uop_dst_rtype;
    rrd_uops_0_REG_lrs1_rtype <= _rrd_decode_unit_io_rrd_uop_lrs1_rtype;
    rrd_uops_0_REG_lrs2_rtype <= _rrd_decode_unit_io_rrd_uop_lrs2_rtype;
    rrd_uops_0_REG_frs3_en <= _rrd_decode_unit_io_rrd_uop_frs3_en;
    rrd_uops_0_REG_fp_val <= _rrd_decode_unit_io_rrd_uop_fp_val;
    rrd_uops_0_REG_fp_single <= _rrd_decode_unit_io_rrd_uop_fp_single;
    rrd_uops_0_REG_xcpt_pf_if <= _rrd_decode_unit_io_rrd_uop_xcpt_pf_if;
    rrd_uops_0_REG_xcpt_ae_if <= _rrd_decode_unit_io_rrd_uop_xcpt_ae_if;
    rrd_uops_0_REG_xcpt_ma_if <= _rrd_decode_unit_io_rrd_uop_xcpt_ma_if;
    rrd_uops_0_REG_bp_debug_if <= _rrd_decode_unit_io_rrd_uop_bp_debug_if;
    rrd_uops_0_REG_bp_xcpt_if <= _rrd_decode_unit_io_rrd_uop_bp_xcpt_if;
    rrd_uops_0_REG_debug_fsrc <= _rrd_decode_unit_io_rrd_uop_debug_fsrc;
    rrd_uops_0_REG_debug_tsrc <= _rrd_decode_unit_io_rrd_uop_debug_tsrc;
    rrd_valids_1_REG <= _rrd_decode_unit_1_io_rrd_valid & (io_brupdate_b1_mispredict_mask & _rrd_decode_unit_1_io_rrd_uop_br_mask) == 20'h0;
    rrd_uops_1_REG_uopc <= _rrd_decode_unit_1_io_rrd_uop_uopc;
    rrd_uops_1_REG_inst <= _rrd_decode_unit_1_io_rrd_uop_inst;
    rrd_uops_1_REG_debug_inst <= _rrd_decode_unit_1_io_rrd_uop_debug_inst;
    rrd_uops_1_REG_is_rvc <= _rrd_decode_unit_1_io_rrd_uop_is_rvc;
    rrd_uops_1_REG_debug_pc <= _rrd_decode_unit_1_io_rrd_uop_debug_pc;
    rrd_uops_1_REG_iq_type <= _rrd_decode_unit_1_io_rrd_uop_iq_type;
    rrd_uops_1_REG_fu_code <= _rrd_decode_unit_1_io_rrd_uop_fu_code;
    rrd_uops_1_REG_ctrl_br_type <= _rrd_decode_unit_1_io_rrd_uop_ctrl_br_type;
    rrd_uops_1_REG_ctrl_op1_sel <= _rrd_decode_unit_1_io_rrd_uop_ctrl_op1_sel;
    rrd_uops_1_REG_ctrl_op2_sel <= _rrd_decode_unit_1_io_rrd_uop_ctrl_op2_sel;
    rrd_uops_1_REG_ctrl_imm_sel <= _rrd_decode_unit_1_io_rrd_uop_ctrl_imm_sel;
    rrd_uops_1_REG_ctrl_op_fcn <= _rrd_decode_unit_1_io_rrd_uop_ctrl_op_fcn;
    rrd_uops_1_REG_ctrl_fcn_dw <= _rrd_decode_unit_1_io_rrd_uop_ctrl_fcn_dw;
    rrd_uops_1_REG_ctrl_csr_cmd <= _rrd_decode_unit_1_io_rrd_uop_ctrl_csr_cmd;
    rrd_uops_1_REG_ctrl_is_load <= _rrd_decode_unit_1_io_rrd_uop_ctrl_is_load;
    rrd_uops_1_REG_ctrl_is_sta <= _rrd_decode_unit_1_io_rrd_uop_ctrl_is_sta;
    rrd_uops_1_REG_ctrl_is_std <= _rrd_decode_unit_1_io_rrd_uop_ctrl_is_std;
    rrd_uops_1_REG_iw_state <= _rrd_decode_unit_1_io_rrd_uop_iw_state;
    rrd_uops_1_REG_is_br <= _rrd_decode_unit_1_io_rrd_uop_is_br;
    rrd_uops_1_REG_is_jalr <= _rrd_decode_unit_1_io_rrd_uop_is_jalr;
    rrd_uops_1_REG_is_jal <= _rrd_decode_unit_1_io_rrd_uop_is_jal;
    rrd_uops_1_REG_is_sfb <= _rrd_decode_unit_1_io_rrd_uop_is_sfb;
    rrd_uops_1_REG_br_mask <= _rrd_decode_unit_1_io_rrd_uop_br_mask & ~io_brupdate_b1_resolve_mask;
    rrd_uops_1_REG_br_tag <= _rrd_decode_unit_1_io_rrd_uop_br_tag;
    rrd_uops_1_REG_ftq_idx <= _rrd_decode_unit_1_io_rrd_uop_ftq_idx;
    rrd_uops_1_REG_edge_inst <= _rrd_decode_unit_1_io_rrd_uop_edge_inst;
    rrd_uops_1_REG_pc_lob <= _rrd_decode_unit_1_io_rrd_uop_pc_lob;
    rrd_uops_1_REG_taken <= _rrd_decode_unit_1_io_rrd_uop_taken;
    rrd_uops_1_REG_imm_packed <= _rrd_decode_unit_1_io_rrd_uop_imm_packed;
    rrd_uops_1_REG_csr_addr <= _rrd_decode_unit_1_io_rrd_uop_csr_addr;
    rrd_uops_1_REG_rob_idx <= _rrd_decode_unit_1_io_rrd_uop_rob_idx;
    rrd_uops_1_REG_ldq_idx <= _rrd_decode_unit_1_io_rrd_uop_ldq_idx;
    rrd_uops_1_REG_stq_idx <= _rrd_decode_unit_1_io_rrd_uop_stq_idx;
    rrd_uops_1_REG_rxq_idx <= _rrd_decode_unit_1_io_rrd_uop_rxq_idx;
    rrd_uops_1_REG_pdst <= _rrd_decode_unit_1_io_rrd_uop_pdst;
    rrd_uops_1_REG_prs1 <= _rrd_decode_unit_1_io_rrd_uop_prs1;
    rrd_uops_1_REG_prs2 <= _rrd_decode_unit_1_io_rrd_uop_prs2;
    rrd_uops_1_REG_prs3 <= _rrd_decode_unit_1_io_rrd_uop_prs3;
    rrd_uops_1_REG_ppred <= _rrd_decode_unit_1_io_rrd_uop_ppred;
    rrd_uops_1_REG_prs1_busy <= _rrd_decode_unit_1_io_rrd_uop_prs1_busy;
    rrd_uops_1_REG_prs2_busy <= _rrd_decode_unit_1_io_rrd_uop_prs2_busy;
    rrd_uops_1_REG_prs3_busy <= _rrd_decode_unit_1_io_rrd_uop_prs3_busy;
    rrd_uops_1_REG_ppred_busy <= _rrd_decode_unit_1_io_rrd_uop_ppred_busy;
    rrd_uops_1_REG_stale_pdst <= _rrd_decode_unit_1_io_rrd_uop_stale_pdst;
    rrd_uops_1_REG_exception <= _rrd_decode_unit_1_io_rrd_uop_exception;
    rrd_uops_1_REG_exc_cause <= _rrd_decode_unit_1_io_rrd_uop_exc_cause;
    rrd_uops_1_REG_bypassable <= _rrd_decode_unit_1_io_rrd_uop_bypassable;
    rrd_uops_1_REG_mem_cmd <= _rrd_decode_unit_1_io_rrd_uop_mem_cmd;
    rrd_uops_1_REG_mem_size <= _rrd_decode_unit_1_io_rrd_uop_mem_size;
    rrd_uops_1_REG_mem_signed <= _rrd_decode_unit_1_io_rrd_uop_mem_signed;
    rrd_uops_1_REG_is_fence <= _rrd_decode_unit_1_io_rrd_uop_is_fence;
    rrd_uops_1_REG_is_fencei <= _rrd_decode_unit_1_io_rrd_uop_is_fencei;
    rrd_uops_1_REG_is_amo <= _rrd_decode_unit_1_io_rrd_uop_is_amo;
    rrd_uops_1_REG_uses_ldq <= _rrd_decode_unit_1_io_rrd_uop_uses_ldq;
    rrd_uops_1_REG_uses_stq <= _rrd_decode_unit_1_io_rrd_uop_uses_stq;
    rrd_uops_1_REG_is_sys_pc2epc <= _rrd_decode_unit_1_io_rrd_uop_is_sys_pc2epc;
    rrd_uops_1_REG_is_unique <= _rrd_decode_unit_1_io_rrd_uop_is_unique;
    rrd_uops_1_REG_flush_on_commit <= _rrd_decode_unit_1_io_rrd_uop_flush_on_commit;
    rrd_uops_1_REG_ldst_is_rs1 <= _rrd_decode_unit_1_io_rrd_uop_ldst_is_rs1;
    rrd_uops_1_REG_ldst <= _rrd_decode_unit_1_io_rrd_uop_ldst;
    rrd_uops_1_REG_lrs1 <= _rrd_decode_unit_1_io_rrd_uop_lrs1;
    rrd_uops_1_REG_lrs2 <= _rrd_decode_unit_1_io_rrd_uop_lrs2;
    rrd_uops_1_REG_lrs3 <= _rrd_decode_unit_1_io_rrd_uop_lrs3;
    rrd_uops_1_REG_ldst_val <= _rrd_decode_unit_1_io_rrd_uop_ldst_val;
    rrd_uops_1_REG_dst_rtype <= _rrd_decode_unit_1_io_rrd_uop_dst_rtype;
    rrd_uops_1_REG_lrs1_rtype <= _rrd_decode_unit_1_io_rrd_uop_lrs1_rtype;
    rrd_uops_1_REG_lrs2_rtype <= _rrd_decode_unit_1_io_rrd_uop_lrs2_rtype;
    rrd_uops_1_REG_frs3_en <= _rrd_decode_unit_1_io_rrd_uop_frs3_en;
    rrd_uops_1_REG_fp_val <= _rrd_decode_unit_1_io_rrd_uop_fp_val;
    rrd_uops_1_REG_fp_single <= _rrd_decode_unit_1_io_rrd_uop_fp_single;
    rrd_uops_1_REG_xcpt_pf_if <= _rrd_decode_unit_1_io_rrd_uop_xcpt_pf_if;
    rrd_uops_1_REG_xcpt_ae_if <= _rrd_decode_unit_1_io_rrd_uop_xcpt_ae_if;
    rrd_uops_1_REG_xcpt_ma_if <= _rrd_decode_unit_1_io_rrd_uop_xcpt_ma_if;
    rrd_uops_1_REG_bp_debug_if <= _rrd_decode_unit_1_io_rrd_uop_bp_debug_if;
    rrd_uops_1_REG_bp_xcpt_if <= _rrd_decode_unit_1_io_rrd_uop_bp_xcpt_if;
    rrd_uops_1_REG_debug_fsrc <= _rrd_decode_unit_1_io_rrd_uop_debug_fsrc;
    rrd_uops_1_REG_debug_tsrc <= _rrd_decode_unit_1_io_rrd_uop_debug_tsrc;
    rrd_valids_2_REG <= _rrd_decode_unit_2_io_rrd_valid & (io_brupdate_b1_mispredict_mask & _rrd_decode_unit_2_io_rrd_uop_br_mask) == 20'h0;
    rrd_uops_2_REG_uopc <= _rrd_decode_unit_2_io_rrd_uop_uopc;
    rrd_uops_2_REG_inst <= _rrd_decode_unit_2_io_rrd_uop_inst;
    rrd_uops_2_REG_debug_inst <= _rrd_decode_unit_2_io_rrd_uop_debug_inst;
    rrd_uops_2_REG_is_rvc <= _rrd_decode_unit_2_io_rrd_uop_is_rvc;
    rrd_uops_2_REG_debug_pc <= _rrd_decode_unit_2_io_rrd_uop_debug_pc;
    rrd_uops_2_REG_iq_type <= _rrd_decode_unit_2_io_rrd_uop_iq_type;
    rrd_uops_2_REG_fu_code <= _rrd_decode_unit_2_io_rrd_uop_fu_code;
    rrd_uops_2_REG_ctrl_br_type <= _rrd_decode_unit_2_io_rrd_uop_ctrl_br_type;
    rrd_uops_2_REG_ctrl_op1_sel <= _rrd_decode_unit_2_io_rrd_uop_ctrl_op1_sel;
    rrd_uops_2_REG_ctrl_op2_sel <= _rrd_decode_unit_2_io_rrd_uop_ctrl_op2_sel;
    rrd_uops_2_REG_ctrl_imm_sel <= _rrd_decode_unit_2_io_rrd_uop_ctrl_imm_sel;
    rrd_uops_2_REG_ctrl_op_fcn <= _rrd_decode_unit_2_io_rrd_uop_ctrl_op_fcn;
    rrd_uops_2_REG_ctrl_fcn_dw <= _rrd_decode_unit_2_io_rrd_uop_ctrl_fcn_dw;
    rrd_uops_2_REG_ctrl_csr_cmd <= _rrd_decode_unit_2_io_rrd_uop_ctrl_csr_cmd;
    rrd_uops_2_REG_ctrl_is_load <= _rrd_decode_unit_2_io_rrd_uop_ctrl_is_load;
    rrd_uops_2_REG_ctrl_is_sta <= _rrd_decode_unit_2_io_rrd_uop_ctrl_is_sta;
    rrd_uops_2_REG_ctrl_is_std <= _rrd_decode_unit_2_io_rrd_uop_ctrl_is_std;
    rrd_uops_2_REG_iw_state <= _rrd_decode_unit_2_io_rrd_uop_iw_state;
    rrd_uops_2_REG_is_br <= _rrd_decode_unit_2_io_rrd_uop_is_br;
    rrd_uops_2_REG_is_jalr <= _rrd_decode_unit_2_io_rrd_uop_is_jalr;
    rrd_uops_2_REG_is_jal <= _rrd_decode_unit_2_io_rrd_uop_is_jal;
    rrd_uops_2_REG_is_sfb <= _rrd_decode_unit_2_io_rrd_uop_is_sfb;
    rrd_uops_2_REG_br_mask <= _rrd_decode_unit_2_io_rrd_uop_br_mask & ~io_brupdate_b1_resolve_mask;
    rrd_uops_2_REG_br_tag <= _rrd_decode_unit_2_io_rrd_uop_br_tag;
    rrd_uops_2_REG_ftq_idx <= _rrd_decode_unit_2_io_rrd_uop_ftq_idx;
    rrd_uops_2_REG_edge_inst <= _rrd_decode_unit_2_io_rrd_uop_edge_inst;
    rrd_uops_2_REG_pc_lob <= _rrd_decode_unit_2_io_rrd_uop_pc_lob;
    rrd_uops_2_REG_taken <= _rrd_decode_unit_2_io_rrd_uop_taken;
    rrd_uops_2_REG_imm_packed <= _rrd_decode_unit_2_io_rrd_uop_imm_packed;
    rrd_uops_2_REG_csr_addr <= _rrd_decode_unit_2_io_rrd_uop_csr_addr;
    rrd_uops_2_REG_rob_idx <= _rrd_decode_unit_2_io_rrd_uop_rob_idx;
    rrd_uops_2_REG_ldq_idx <= _rrd_decode_unit_2_io_rrd_uop_ldq_idx;
    rrd_uops_2_REG_stq_idx <= _rrd_decode_unit_2_io_rrd_uop_stq_idx;
    rrd_uops_2_REG_rxq_idx <= _rrd_decode_unit_2_io_rrd_uop_rxq_idx;
    rrd_uops_2_REG_pdst <= _rrd_decode_unit_2_io_rrd_uop_pdst;
    rrd_uops_2_REG_prs1 <= _rrd_decode_unit_2_io_rrd_uop_prs1;
    rrd_uops_2_REG_prs2 <= _rrd_decode_unit_2_io_rrd_uop_prs2;
    rrd_uops_2_REG_prs3 <= _rrd_decode_unit_2_io_rrd_uop_prs3;
    rrd_uops_2_REG_ppred <= _rrd_decode_unit_2_io_rrd_uop_ppred;
    rrd_uops_2_REG_prs1_busy <= _rrd_decode_unit_2_io_rrd_uop_prs1_busy;
    rrd_uops_2_REG_prs2_busy <= _rrd_decode_unit_2_io_rrd_uop_prs2_busy;
    rrd_uops_2_REG_prs3_busy <= _rrd_decode_unit_2_io_rrd_uop_prs3_busy;
    rrd_uops_2_REG_ppred_busy <= _rrd_decode_unit_2_io_rrd_uop_ppred_busy;
    rrd_uops_2_REG_stale_pdst <= _rrd_decode_unit_2_io_rrd_uop_stale_pdst;
    rrd_uops_2_REG_exception <= _rrd_decode_unit_2_io_rrd_uop_exception;
    rrd_uops_2_REG_exc_cause <= _rrd_decode_unit_2_io_rrd_uop_exc_cause;
    rrd_uops_2_REG_bypassable <= _rrd_decode_unit_2_io_rrd_uop_bypassable;
    rrd_uops_2_REG_mem_cmd <= _rrd_decode_unit_2_io_rrd_uop_mem_cmd;
    rrd_uops_2_REG_mem_size <= _rrd_decode_unit_2_io_rrd_uop_mem_size;
    rrd_uops_2_REG_mem_signed <= _rrd_decode_unit_2_io_rrd_uop_mem_signed;
    rrd_uops_2_REG_is_fence <= _rrd_decode_unit_2_io_rrd_uop_is_fence;
    rrd_uops_2_REG_is_fencei <= _rrd_decode_unit_2_io_rrd_uop_is_fencei;
    rrd_uops_2_REG_is_amo <= _rrd_decode_unit_2_io_rrd_uop_is_amo;
    rrd_uops_2_REG_uses_ldq <= _rrd_decode_unit_2_io_rrd_uop_uses_ldq;
    rrd_uops_2_REG_uses_stq <= _rrd_decode_unit_2_io_rrd_uop_uses_stq;
    rrd_uops_2_REG_is_sys_pc2epc <= _rrd_decode_unit_2_io_rrd_uop_is_sys_pc2epc;
    rrd_uops_2_REG_is_unique <= _rrd_decode_unit_2_io_rrd_uop_is_unique;
    rrd_uops_2_REG_flush_on_commit <= _rrd_decode_unit_2_io_rrd_uop_flush_on_commit;
    rrd_uops_2_REG_ldst_is_rs1 <= _rrd_decode_unit_2_io_rrd_uop_ldst_is_rs1;
    rrd_uops_2_REG_ldst <= _rrd_decode_unit_2_io_rrd_uop_ldst;
    rrd_uops_2_REG_lrs1 <= _rrd_decode_unit_2_io_rrd_uop_lrs1;
    rrd_uops_2_REG_lrs2 <= _rrd_decode_unit_2_io_rrd_uop_lrs2;
    rrd_uops_2_REG_lrs3 <= _rrd_decode_unit_2_io_rrd_uop_lrs3;
    rrd_uops_2_REG_ldst_val <= _rrd_decode_unit_2_io_rrd_uop_ldst_val;
    rrd_uops_2_REG_dst_rtype <= _rrd_decode_unit_2_io_rrd_uop_dst_rtype;
    rrd_uops_2_REG_lrs1_rtype <= _rrd_decode_unit_2_io_rrd_uop_lrs1_rtype;
    rrd_uops_2_REG_lrs2_rtype <= _rrd_decode_unit_2_io_rrd_uop_lrs2_rtype;
    rrd_uops_2_REG_frs3_en <= _rrd_decode_unit_2_io_rrd_uop_frs3_en;
    rrd_uops_2_REG_fp_val <= _rrd_decode_unit_2_io_rrd_uop_fp_val;
    rrd_uops_2_REG_fp_single <= _rrd_decode_unit_2_io_rrd_uop_fp_single;
    rrd_uops_2_REG_xcpt_pf_if <= _rrd_decode_unit_2_io_rrd_uop_xcpt_pf_if;
    rrd_uops_2_REG_xcpt_ae_if <= _rrd_decode_unit_2_io_rrd_uop_xcpt_ae_if;
    rrd_uops_2_REG_xcpt_ma_if <= _rrd_decode_unit_2_io_rrd_uop_xcpt_ma_if;
    rrd_uops_2_REG_bp_debug_if <= _rrd_decode_unit_2_io_rrd_uop_bp_debug_if;
    rrd_uops_2_REG_bp_xcpt_if <= _rrd_decode_unit_2_io_rrd_uop_bp_xcpt_if;
    rrd_uops_2_REG_debug_fsrc <= _rrd_decode_unit_2_io_rrd_uop_debug_fsrc;
    rrd_uops_2_REG_debug_tsrc <= _rrd_decode_unit_2_io_rrd_uop_debug_tsrc;
    rrd_valids_3_REG <= _rrd_decode_unit_3_io_rrd_valid & (io_brupdate_b1_mispredict_mask & _rrd_decode_unit_3_io_rrd_uop_br_mask) == 20'h0;
    rrd_uops_3_REG_uopc <= _rrd_decode_unit_3_io_rrd_uop_uopc;
    rrd_uops_3_REG_is_rvc <= _rrd_decode_unit_3_io_rrd_uop_is_rvc;
    rrd_uops_3_REG_fu_code <= _rrd_decode_unit_3_io_rrd_uop_fu_code;
    rrd_uops_3_REG_ctrl_br_type <= _rrd_decode_unit_3_io_rrd_uop_ctrl_br_type;
    rrd_uops_3_REG_ctrl_op1_sel <= _rrd_decode_unit_3_io_rrd_uop_ctrl_op1_sel;
    rrd_uops_3_REG_ctrl_op2_sel <= _rrd_decode_unit_3_io_rrd_uop_ctrl_op2_sel;
    rrd_uops_3_REG_ctrl_imm_sel <= _rrd_decode_unit_3_io_rrd_uop_ctrl_imm_sel;
    rrd_uops_3_REG_ctrl_op_fcn <= _rrd_decode_unit_3_io_rrd_uop_ctrl_op_fcn;
    rrd_uops_3_REG_ctrl_fcn_dw <= _rrd_decode_unit_3_io_rrd_uop_ctrl_fcn_dw;
    rrd_uops_3_REG_ctrl_csr_cmd <= _rrd_decode_unit_3_io_rrd_uop_ctrl_csr_cmd;
    rrd_uops_3_REG_is_br <= _rrd_decode_unit_3_io_rrd_uop_is_br;
    rrd_uops_3_REG_is_jalr <= _rrd_decode_unit_3_io_rrd_uop_is_jalr;
    rrd_uops_3_REG_is_jal <= _rrd_decode_unit_3_io_rrd_uop_is_jal;
    rrd_uops_3_REG_is_sfb <= _rrd_decode_unit_3_io_rrd_uop_is_sfb;
    rrd_uops_3_REG_br_mask <= _rrd_decode_unit_3_io_rrd_uop_br_mask & ~io_brupdate_b1_resolve_mask;
    rrd_uops_3_REG_br_tag <= _rrd_decode_unit_3_io_rrd_uop_br_tag;
    rrd_uops_3_REG_ftq_idx <= _rrd_decode_unit_3_io_rrd_uop_ftq_idx;
    rrd_uops_3_REG_edge_inst <= _rrd_decode_unit_3_io_rrd_uop_edge_inst;
    rrd_uops_3_REG_pc_lob <= _rrd_decode_unit_3_io_rrd_uop_pc_lob;
    rrd_uops_3_REG_taken <= _rrd_decode_unit_3_io_rrd_uop_taken;
    rrd_uops_3_REG_imm_packed <= _rrd_decode_unit_3_io_rrd_uop_imm_packed;
    rrd_uops_3_REG_rob_idx <= _rrd_decode_unit_3_io_rrd_uop_rob_idx;
    rrd_uops_3_REG_ldq_idx <= _rrd_decode_unit_3_io_rrd_uop_ldq_idx;
    rrd_uops_3_REG_stq_idx <= _rrd_decode_unit_3_io_rrd_uop_stq_idx;
    rrd_uops_3_REG_pdst <= _rrd_decode_unit_3_io_rrd_uop_pdst;
    rrd_uops_3_REG_prs1 <= _rrd_decode_unit_3_io_rrd_uop_prs1;
    rrd_uops_3_REG_prs2 <= _rrd_decode_unit_3_io_rrd_uop_prs2;
    rrd_uops_3_REG_bypassable <= _rrd_decode_unit_3_io_rrd_uop_bypassable;
    rrd_uops_3_REG_is_amo <= _rrd_decode_unit_3_io_rrd_uop_is_amo;
    rrd_uops_3_REG_uses_stq <= _rrd_decode_unit_3_io_rrd_uop_uses_stq;
    rrd_uops_3_REG_dst_rtype <= _rrd_decode_unit_3_io_rrd_uop_dst_rtype;
    rrd_uops_3_REG_lrs1_rtype <= _rrd_decode_unit_3_io_rrd_uop_lrs1_rtype;
    rrd_uops_3_REG_lrs2_rtype <= _rrd_decode_unit_3_io_rrd_uop_lrs2_rtype;
    rrd_valids_4_REG <= _rrd_decode_unit_4_io_rrd_valid & (io_brupdate_b1_mispredict_mask & _rrd_decode_unit_4_io_rrd_uop_br_mask) == 20'h0;
    rrd_uops_4_REG_uopc <= _rrd_decode_unit_4_io_rrd_uop_uopc;
    rrd_uops_4_REG_is_rvc <= _rrd_decode_unit_4_io_rrd_uop_is_rvc;
    rrd_uops_4_REG_fu_code <= _rrd_decode_unit_4_io_rrd_uop_fu_code;
    rrd_uops_4_REG_ctrl_br_type <= _rrd_decode_unit_4_io_rrd_uop_ctrl_br_type;
    rrd_uops_4_REG_ctrl_op1_sel <= _rrd_decode_unit_4_io_rrd_uop_ctrl_op1_sel;
    rrd_uops_4_REG_ctrl_op2_sel <= _rrd_decode_unit_4_io_rrd_uop_ctrl_op2_sel;
    rrd_uops_4_REG_ctrl_imm_sel <= _rrd_decode_unit_4_io_rrd_uop_ctrl_imm_sel;
    rrd_uops_4_REG_ctrl_op_fcn <= _rrd_decode_unit_4_io_rrd_uop_ctrl_op_fcn;
    rrd_uops_4_REG_ctrl_fcn_dw <= _rrd_decode_unit_4_io_rrd_uop_ctrl_fcn_dw;
    rrd_uops_4_REG_is_br <= _rrd_decode_unit_4_io_rrd_uop_is_br;
    rrd_uops_4_REG_is_jalr <= _rrd_decode_unit_4_io_rrd_uop_is_jalr;
    rrd_uops_4_REG_is_jal <= _rrd_decode_unit_4_io_rrd_uop_is_jal;
    rrd_uops_4_REG_is_sfb <= _rrd_decode_unit_4_io_rrd_uop_is_sfb;
    rrd_uops_4_REG_br_mask <= _rrd_decode_unit_4_io_rrd_uop_br_mask & ~io_brupdate_b1_resolve_mask;
    rrd_uops_4_REG_br_tag <= _rrd_decode_unit_4_io_rrd_uop_br_tag;
    rrd_uops_4_REG_ftq_idx <= _rrd_decode_unit_4_io_rrd_uop_ftq_idx;
    rrd_uops_4_REG_edge_inst <= _rrd_decode_unit_4_io_rrd_uop_edge_inst;
    rrd_uops_4_REG_pc_lob <= _rrd_decode_unit_4_io_rrd_uop_pc_lob;
    rrd_uops_4_REG_taken <= _rrd_decode_unit_4_io_rrd_uop_taken;
    rrd_uops_4_REG_imm_packed <= _rrd_decode_unit_4_io_rrd_uop_imm_packed;
    rrd_uops_4_REG_rob_idx <= _rrd_decode_unit_4_io_rrd_uop_rob_idx;
    rrd_uops_4_REG_ldq_idx <= _rrd_decode_unit_4_io_rrd_uop_ldq_idx;
    rrd_uops_4_REG_stq_idx <= _rrd_decode_unit_4_io_rrd_uop_stq_idx;
    rrd_uops_4_REG_pdst <= _rrd_decode_unit_4_io_rrd_uop_pdst;
    rrd_uops_4_REG_prs1 <= _rrd_decode_unit_4_io_rrd_uop_prs1;
    rrd_uops_4_REG_prs2 <= _rrd_decode_unit_4_io_rrd_uop_prs2;
    rrd_uops_4_REG_bypassable <= _rrd_decode_unit_4_io_rrd_uop_bypassable;
    rrd_uops_4_REG_is_amo <= _rrd_decode_unit_4_io_rrd_uop_is_amo;
    rrd_uops_4_REG_uses_stq <= _rrd_decode_unit_4_io_rrd_uop_uses_stq;
    rrd_uops_4_REG_dst_rtype <= _rrd_decode_unit_4_io_rrd_uop_dst_rtype;
    rrd_uops_4_REG_lrs1_rtype <= _rrd_decode_unit_4_io_rrd_uop_lrs1_rtype;
    rrd_uops_4_REG_lrs2_rtype <= _rrd_decode_unit_4_io_rrd_uop_lrs2_rtype;
    rrd_valids_5_REG <= _rrd_decode_unit_5_io_rrd_valid & (io_brupdate_b1_mispredict_mask & _rrd_decode_unit_5_io_rrd_uop_br_mask) == 20'h0;
    rrd_uops_5_REG_uopc <= _rrd_decode_unit_5_io_rrd_uop_uopc;
    rrd_uops_5_REG_is_rvc <= _rrd_decode_unit_5_io_rrd_uop_is_rvc;
    rrd_uops_5_REG_fu_code <= _rrd_decode_unit_5_io_rrd_uop_fu_code;
    rrd_uops_5_REG_ctrl_br_type <= _rrd_decode_unit_5_io_rrd_uop_ctrl_br_type;
    rrd_uops_5_REG_ctrl_op1_sel <= _rrd_decode_unit_5_io_rrd_uop_ctrl_op1_sel;
    rrd_uops_5_REG_ctrl_op2_sel <= _rrd_decode_unit_5_io_rrd_uop_ctrl_op2_sel;
    rrd_uops_5_REG_ctrl_imm_sel <= _rrd_decode_unit_5_io_rrd_uop_ctrl_imm_sel;
    rrd_uops_5_REG_ctrl_op_fcn <= _rrd_decode_unit_5_io_rrd_uop_ctrl_op_fcn;
    rrd_uops_5_REG_ctrl_fcn_dw <= _rrd_decode_unit_5_io_rrd_uop_ctrl_fcn_dw;
    rrd_uops_5_REG_ctrl_csr_cmd <= _rrd_decode_unit_5_io_rrd_uop_ctrl_csr_cmd;
    rrd_uops_5_REG_is_br <= _rrd_decode_unit_5_io_rrd_uop_is_br;
    rrd_uops_5_REG_is_jalr <= _rrd_decode_unit_5_io_rrd_uop_is_jalr;
    rrd_uops_5_REG_is_jal <= _rrd_decode_unit_5_io_rrd_uop_is_jal;
    rrd_uops_5_REG_is_sfb <= _rrd_decode_unit_5_io_rrd_uop_is_sfb;
    rrd_uops_5_REG_br_mask <= _rrd_decode_unit_5_io_rrd_uop_br_mask & ~io_brupdate_b1_resolve_mask;
    rrd_uops_5_REG_br_tag <= _rrd_decode_unit_5_io_rrd_uop_br_tag;
    rrd_uops_5_REG_ftq_idx <= _rrd_decode_unit_5_io_rrd_uop_ftq_idx;
    rrd_uops_5_REG_edge_inst <= _rrd_decode_unit_5_io_rrd_uop_edge_inst;
    rrd_uops_5_REG_pc_lob <= _rrd_decode_unit_5_io_rrd_uop_pc_lob;
    rrd_uops_5_REG_taken <= _rrd_decode_unit_5_io_rrd_uop_taken;
    rrd_uops_5_REG_imm_packed <= _rrd_decode_unit_5_io_rrd_uop_imm_packed;
    rrd_uops_5_REG_rob_idx <= _rrd_decode_unit_5_io_rrd_uop_rob_idx;
    rrd_uops_5_REG_ldq_idx <= _rrd_decode_unit_5_io_rrd_uop_ldq_idx;
    rrd_uops_5_REG_stq_idx <= _rrd_decode_unit_5_io_rrd_uop_stq_idx;
    rrd_uops_5_REG_pdst <= _rrd_decode_unit_5_io_rrd_uop_pdst;
    rrd_uops_5_REG_prs1 <= _rrd_decode_unit_5_io_rrd_uop_prs1;
    rrd_uops_5_REG_prs2 <= _rrd_decode_unit_5_io_rrd_uop_prs2;
    rrd_uops_5_REG_bypassable <= _rrd_decode_unit_5_io_rrd_uop_bypassable;
    rrd_uops_5_REG_is_amo <= _rrd_decode_unit_5_io_rrd_uop_is_amo;
    rrd_uops_5_REG_uses_stq <= _rrd_decode_unit_5_io_rrd_uop_uses_stq;
    rrd_uops_5_REG_dst_rtype <= _rrd_decode_unit_5_io_rrd_uop_dst_rtype;
    rrd_uops_5_REG_lrs1_rtype <= _rrd_decode_unit_5_io_rrd_uop_lrs1_rtype;
    rrd_uops_5_REG_lrs2_rtype <= _rrd_decode_unit_5_io_rrd_uop_lrs2_rtype;
    rrd_rs1_data_0_REG <= io_iss_uops_0_prs1 == 7'h0;
    rrd_rs2_data_0_REG <= io_iss_uops_0_prs2 == 7'h0;
    rrd_rs1_data_1_REG <= io_iss_uops_1_prs1 == 7'h0;
    rrd_rs2_data_1_REG <= io_iss_uops_1_prs2 == 7'h0;
    rrd_rs1_data_2_REG <= io_iss_uops_2_prs1 == 7'h0;
    rrd_rs2_data_2_REG <= io_iss_uops_2_prs2 == 7'h0;
    rrd_rs1_data_3_REG <= io_iss_uops_3_prs1 == 7'h0;
    rrd_rs2_data_3_REG <= io_iss_uops_3_prs2 == 7'h0;
    rrd_rs1_data_4_REG <= io_iss_uops_4_prs1 == 7'h0;
    rrd_rs2_data_4_REG <= io_iss_uops_4_prs2 == 7'h0;
    rrd_rs1_data_5_REG <= io_iss_uops_5_prs1 == 7'h0;
    rrd_rs2_data_5_REG <= io_iss_uops_5_prs2 == 7'h0;
  end // always @(posedge)
  RegisterReadDecode_2 rrd_decode_unit (
    .io_iss_valid               (io_iss_valids_0),
    .io_iss_uop_uopc            (io_iss_uops_0_uopc),
    .io_iss_uop_inst            (io_iss_uops_0_inst),
    .io_iss_uop_debug_inst      (io_iss_uops_0_debug_inst),
    .io_iss_uop_is_rvc          (io_iss_uops_0_is_rvc),
    .io_iss_uop_debug_pc        (io_iss_uops_0_debug_pc),
    .io_iss_uop_iq_type         (io_iss_uops_0_iq_type),
    .io_iss_uop_fu_code         (io_iss_uops_0_fu_code),
    .io_iss_uop_iw_state        (io_iss_uops_0_iw_state),
    .io_iss_uop_is_br           (io_iss_uops_0_is_br),
    .io_iss_uop_is_jalr         (io_iss_uops_0_is_jalr),
    .io_iss_uop_is_jal          (io_iss_uops_0_is_jal),
    .io_iss_uop_is_sfb          (io_iss_uops_0_is_sfb),
    .io_iss_uop_br_mask         (io_iss_uops_0_br_mask),
    .io_iss_uop_br_tag          (io_iss_uops_0_br_tag),
    .io_iss_uop_ftq_idx         (io_iss_uops_0_ftq_idx),
    .io_iss_uop_edge_inst       (io_iss_uops_0_edge_inst),
    .io_iss_uop_pc_lob          (io_iss_uops_0_pc_lob),
    .io_iss_uop_taken           (io_iss_uops_0_taken),
    .io_iss_uop_imm_packed      (io_iss_uops_0_imm_packed),
    .io_iss_uop_csr_addr        (io_iss_uops_0_csr_addr),
    .io_iss_uop_rob_idx         (io_iss_uops_0_rob_idx),
    .io_iss_uop_ldq_idx         (io_iss_uops_0_ldq_idx),
    .io_iss_uop_stq_idx         (io_iss_uops_0_stq_idx),
    .io_iss_uop_rxq_idx         (io_iss_uops_0_rxq_idx),
    .io_iss_uop_pdst            (io_iss_uops_0_pdst),
    .io_iss_uop_prs1            (io_iss_uops_0_prs1),
    .io_iss_uop_prs2            (io_iss_uops_0_prs2),
    .io_iss_uop_prs3            (io_iss_uops_0_prs3),
    .io_iss_uop_ppred           (io_iss_uops_0_ppred),
    .io_iss_uop_prs1_busy       (io_iss_uops_0_prs1_busy),
    .io_iss_uop_prs2_busy       (io_iss_uops_0_prs2_busy),
    .io_iss_uop_prs3_busy       (io_iss_uops_0_prs3_busy),
    .io_iss_uop_ppred_busy      (io_iss_uops_0_ppred_busy),
    .io_iss_uop_stale_pdst      (io_iss_uops_0_stale_pdst),
    .io_iss_uop_exception       (io_iss_uops_0_exception),
    .io_iss_uop_exc_cause       (io_iss_uops_0_exc_cause),
    .io_iss_uop_bypassable      (io_iss_uops_0_bypassable),
    .io_iss_uop_mem_cmd         (io_iss_uops_0_mem_cmd),
    .io_iss_uop_mem_size        (io_iss_uops_0_mem_size),
    .io_iss_uop_mem_signed      (io_iss_uops_0_mem_signed),
    .io_iss_uop_is_fence        (io_iss_uops_0_is_fence),
    .io_iss_uop_is_fencei       (io_iss_uops_0_is_fencei),
    .io_iss_uop_is_amo          (io_iss_uops_0_is_amo),
    .io_iss_uop_uses_ldq        (io_iss_uops_0_uses_ldq),
    .io_iss_uop_uses_stq        (io_iss_uops_0_uses_stq),
    .io_iss_uop_is_sys_pc2epc   (io_iss_uops_0_is_sys_pc2epc),
    .io_iss_uop_is_unique       (io_iss_uops_0_is_unique),
    .io_iss_uop_flush_on_commit (io_iss_uops_0_flush_on_commit),
    .io_iss_uop_ldst_is_rs1     (io_iss_uops_0_ldst_is_rs1),
    .io_iss_uop_ldst            (io_iss_uops_0_ldst),
    .io_iss_uop_lrs1            (io_iss_uops_0_lrs1),
    .io_iss_uop_lrs2            (io_iss_uops_0_lrs2),
    .io_iss_uop_lrs3            (io_iss_uops_0_lrs3),
    .io_iss_uop_ldst_val        (io_iss_uops_0_ldst_val),
    .io_iss_uop_dst_rtype       (io_iss_uops_0_dst_rtype),
    .io_iss_uop_lrs1_rtype      (io_iss_uops_0_lrs1_rtype),
    .io_iss_uop_lrs2_rtype      (io_iss_uops_0_lrs2_rtype),
    .io_iss_uop_frs3_en         (io_iss_uops_0_frs3_en),
    .io_iss_uop_fp_val          (io_iss_uops_0_fp_val),
    .io_iss_uop_fp_single       (io_iss_uops_0_fp_single),
    .io_iss_uop_xcpt_pf_if      (io_iss_uops_0_xcpt_pf_if),
    .io_iss_uop_xcpt_ae_if      (io_iss_uops_0_xcpt_ae_if),
    .io_iss_uop_xcpt_ma_if      (io_iss_uops_0_xcpt_ma_if),
    .io_iss_uop_bp_debug_if     (io_iss_uops_0_bp_debug_if),
    .io_iss_uop_bp_xcpt_if      (io_iss_uops_0_bp_xcpt_if),
    .io_iss_uop_debug_fsrc      (io_iss_uops_0_debug_fsrc),
    .io_iss_uop_debug_tsrc      (io_iss_uops_0_debug_tsrc),
    .io_rrd_valid               (_rrd_decode_unit_io_rrd_valid),
    .io_rrd_uop_uopc            (_rrd_decode_unit_io_rrd_uop_uopc),
    .io_rrd_uop_inst            (_rrd_decode_unit_io_rrd_uop_inst),
    .io_rrd_uop_debug_inst      (_rrd_decode_unit_io_rrd_uop_debug_inst),
    .io_rrd_uop_is_rvc          (_rrd_decode_unit_io_rrd_uop_is_rvc),
    .io_rrd_uop_debug_pc        (_rrd_decode_unit_io_rrd_uop_debug_pc),
    .io_rrd_uop_iq_type         (_rrd_decode_unit_io_rrd_uop_iq_type),
    .io_rrd_uop_fu_code         (_rrd_decode_unit_io_rrd_uop_fu_code),
    .io_rrd_uop_ctrl_br_type    (_rrd_decode_unit_io_rrd_uop_ctrl_br_type),
    .io_rrd_uop_ctrl_op1_sel    (_rrd_decode_unit_io_rrd_uop_ctrl_op1_sel),
    .io_rrd_uop_ctrl_op2_sel    (_rrd_decode_unit_io_rrd_uop_ctrl_op2_sel),
    .io_rrd_uop_ctrl_imm_sel    (_rrd_decode_unit_io_rrd_uop_ctrl_imm_sel),
    .io_rrd_uop_ctrl_op_fcn     (_rrd_decode_unit_io_rrd_uop_ctrl_op_fcn),
    .io_rrd_uop_ctrl_fcn_dw     (_rrd_decode_unit_io_rrd_uop_ctrl_fcn_dw),
    .io_rrd_uop_ctrl_csr_cmd    (_rrd_decode_unit_io_rrd_uop_ctrl_csr_cmd),
    .io_rrd_uop_ctrl_is_load    (_rrd_decode_unit_io_rrd_uop_ctrl_is_load),
    .io_rrd_uop_ctrl_is_sta     (_rrd_decode_unit_io_rrd_uop_ctrl_is_sta),
    .io_rrd_uop_ctrl_is_std     (_rrd_decode_unit_io_rrd_uop_ctrl_is_std),
    .io_rrd_uop_iw_state        (_rrd_decode_unit_io_rrd_uop_iw_state),
    .io_rrd_uop_is_br           (_rrd_decode_unit_io_rrd_uop_is_br),
    .io_rrd_uop_is_jalr         (_rrd_decode_unit_io_rrd_uop_is_jalr),
    .io_rrd_uop_is_jal          (_rrd_decode_unit_io_rrd_uop_is_jal),
    .io_rrd_uop_is_sfb          (_rrd_decode_unit_io_rrd_uop_is_sfb),
    .io_rrd_uop_br_mask         (_rrd_decode_unit_io_rrd_uop_br_mask),
    .io_rrd_uop_br_tag          (_rrd_decode_unit_io_rrd_uop_br_tag),
    .io_rrd_uop_ftq_idx         (_rrd_decode_unit_io_rrd_uop_ftq_idx),
    .io_rrd_uop_edge_inst       (_rrd_decode_unit_io_rrd_uop_edge_inst),
    .io_rrd_uop_pc_lob          (_rrd_decode_unit_io_rrd_uop_pc_lob),
    .io_rrd_uop_taken           (_rrd_decode_unit_io_rrd_uop_taken),
    .io_rrd_uop_imm_packed      (_rrd_decode_unit_io_rrd_uop_imm_packed),
    .io_rrd_uop_csr_addr        (_rrd_decode_unit_io_rrd_uop_csr_addr),
    .io_rrd_uop_rob_idx         (_rrd_decode_unit_io_rrd_uop_rob_idx),
    .io_rrd_uop_ldq_idx         (_rrd_decode_unit_io_rrd_uop_ldq_idx),
    .io_rrd_uop_stq_idx         (_rrd_decode_unit_io_rrd_uop_stq_idx),
    .io_rrd_uop_rxq_idx         (_rrd_decode_unit_io_rrd_uop_rxq_idx),
    .io_rrd_uop_pdst            (_rrd_decode_unit_io_rrd_uop_pdst),
    .io_rrd_uop_prs1            (_rrd_decode_unit_io_rrd_uop_prs1),
    .io_rrd_uop_prs2            (_rrd_decode_unit_io_rrd_uop_prs2),
    .io_rrd_uop_prs3            (_rrd_decode_unit_io_rrd_uop_prs3),
    .io_rrd_uop_ppred           (_rrd_decode_unit_io_rrd_uop_ppred),
    .io_rrd_uop_prs1_busy       (_rrd_decode_unit_io_rrd_uop_prs1_busy),
    .io_rrd_uop_prs2_busy       (_rrd_decode_unit_io_rrd_uop_prs2_busy),
    .io_rrd_uop_prs3_busy       (_rrd_decode_unit_io_rrd_uop_prs3_busy),
    .io_rrd_uop_ppred_busy      (_rrd_decode_unit_io_rrd_uop_ppred_busy),
    .io_rrd_uop_stale_pdst      (_rrd_decode_unit_io_rrd_uop_stale_pdst),
    .io_rrd_uop_exception       (_rrd_decode_unit_io_rrd_uop_exception),
    .io_rrd_uop_exc_cause       (_rrd_decode_unit_io_rrd_uop_exc_cause),
    .io_rrd_uop_bypassable      (_rrd_decode_unit_io_rrd_uop_bypassable),
    .io_rrd_uop_mem_cmd         (_rrd_decode_unit_io_rrd_uop_mem_cmd),
    .io_rrd_uop_mem_size        (_rrd_decode_unit_io_rrd_uop_mem_size),
    .io_rrd_uop_mem_signed      (_rrd_decode_unit_io_rrd_uop_mem_signed),
    .io_rrd_uop_is_fence        (_rrd_decode_unit_io_rrd_uop_is_fence),
    .io_rrd_uop_is_fencei       (_rrd_decode_unit_io_rrd_uop_is_fencei),
    .io_rrd_uop_is_amo          (_rrd_decode_unit_io_rrd_uop_is_amo),
    .io_rrd_uop_uses_ldq        (_rrd_decode_unit_io_rrd_uop_uses_ldq),
    .io_rrd_uop_uses_stq        (_rrd_decode_unit_io_rrd_uop_uses_stq),
    .io_rrd_uop_is_sys_pc2epc   (_rrd_decode_unit_io_rrd_uop_is_sys_pc2epc),
    .io_rrd_uop_is_unique       (_rrd_decode_unit_io_rrd_uop_is_unique),
    .io_rrd_uop_flush_on_commit (_rrd_decode_unit_io_rrd_uop_flush_on_commit),
    .io_rrd_uop_ldst_is_rs1     (_rrd_decode_unit_io_rrd_uop_ldst_is_rs1),
    .io_rrd_uop_ldst            (_rrd_decode_unit_io_rrd_uop_ldst),
    .io_rrd_uop_lrs1            (_rrd_decode_unit_io_rrd_uop_lrs1),
    .io_rrd_uop_lrs2            (_rrd_decode_unit_io_rrd_uop_lrs2),
    .io_rrd_uop_lrs3            (_rrd_decode_unit_io_rrd_uop_lrs3),
    .io_rrd_uop_ldst_val        (_rrd_decode_unit_io_rrd_uop_ldst_val),
    .io_rrd_uop_dst_rtype       (_rrd_decode_unit_io_rrd_uop_dst_rtype),
    .io_rrd_uop_lrs1_rtype      (_rrd_decode_unit_io_rrd_uop_lrs1_rtype),
    .io_rrd_uop_lrs2_rtype      (_rrd_decode_unit_io_rrd_uop_lrs2_rtype),
    .io_rrd_uop_frs3_en         (_rrd_decode_unit_io_rrd_uop_frs3_en),
    .io_rrd_uop_fp_val          (_rrd_decode_unit_io_rrd_uop_fp_val),
    .io_rrd_uop_fp_single       (_rrd_decode_unit_io_rrd_uop_fp_single),
    .io_rrd_uop_xcpt_pf_if      (_rrd_decode_unit_io_rrd_uop_xcpt_pf_if),
    .io_rrd_uop_xcpt_ae_if      (_rrd_decode_unit_io_rrd_uop_xcpt_ae_if),
    .io_rrd_uop_xcpt_ma_if      (_rrd_decode_unit_io_rrd_uop_xcpt_ma_if),
    .io_rrd_uop_bp_debug_if     (_rrd_decode_unit_io_rrd_uop_bp_debug_if),
    .io_rrd_uop_bp_xcpt_if      (_rrd_decode_unit_io_rrd_uop_bp_xcpt_if),
    .io_rrd_uop_debug_fsrc      (_rrd_decode_unit_io_rrd_uop_debug_fsrc),
    .io_rrd_uop_debug_tsrc      (_rrd_decode_unit_io_rrd_uop_debug_tsrc)
  );
  RegisterReadDecode_2 rrd_decode_unit_1 (
    .io_iss_valid               (io_iss_valids_1),
    .io_iss_uop_uopc            (io_iss_uops_1_uopc),
    .io_iss_uop_inst            (io_iss_uops_1_inst),
    .io_iss_uop_debug_inst      (io_iss_uops_1_debug_inst),
    .io_iss_uop_is_rvc          (io_iss_uops_1_is_rvc),
    .io_iss_uop_debug_pc        (io_iss_uops_1_debug_pc),
    .io_iss_uop_iq_type         (io_iss_uops_1_iq_type),
    .io_iss_uop_fu_code         (io_iss_uops_1_fu_code),
    .io_iss_uop_iw_state        (io_iss_uops_1_iw_state),
    .io_iss_uop_is_br           (io_iss_uops_1_is_br),
    .io_iss_uop_is_jalr         (io_iss_uops_1_is_jalr),
    .io_iss_uop_is_jal          (io_iss_uops_1_is_jal),
    .io_iss_uop_is_sfb          (io_iss_uops_1_is_sfb),
    .io_iss_uop_br_mask         (io_iss_uops_1_br_mask),
    .io_iss_uop_br_tag          (io_iss_uops_1_br_tag),
    .io_iss_uop_ftq_idx         (io_iss_uops_1_ftq_idx),
    .io_iss_uop_edge_inst       (io_iss_uops_1_edge_inst),
    .io_iss_uop_pc_lob          (io_iss_uops_1_pc_lob),
    .io_iss_uop_taken           (io_iss_uops_1_taken),
    .io_iss_uop_imm_packed      (io_iss_uops_1_imm_packed),
    .io_iss_uop_csr_addr        (io_iss_uops_1_csr_addr),
    .io_iss_uop_rob_idx         (io_iss_uops_1_rob_idx),
    .io_iss_uop_ldq_idx         (io_iss_uops_1_ldq_idx),
    .io_iss_uop_stq_idx         (io_iss_uops_1_stq_idx),
    .io_iss_uop_rxq_idx         (io_iss_uops_1_rxq_idx),
    .io_iss_uop_pdst            (io_iss_uops_1_pdst),
    .io_iss_uop_prs1            (io_iss_uops_1_prs1),
    .io_iss_uop_prs2            (io_iss_uops_1_prs2),
    .io_iss_uop_prs3            (io_iss_uops_1_prs3),
    .io_iss_uop_ppred           (io_iss_uops_1_ppred),
    .io_iss_uop_prs1_busy       (io_iss_uops_1_prs1_busy),
    .io_iss_uop_prs2_busy       (io_iss_uops_1_prs2_busy),
    .io_iss_uop_prs3_busy       (io_iss_uops_1_prs3_busy),
    .io_iss_uop_ppred_busy      (io_iss_uops_1_ppred_busy),
    .io_iss_uop_stale_pdst      (io_iss_uops_1_stale_pdst),
    .io_iss_uop_exception       (io_iss_uops_1_exception),
    .io_iss_uop_exc_cause       (io_iss_uops_1_exc_cause),
    .io_iss_uop_bypassable      (io_iss_uops_1_bypassable),
    .io_iss_uop_mem_cmd         (io_iss_uops_1_mem_cmd),
    .io_iss_uop_mem_size        (io_iss_uops_1_mem_size),
    .io_iss_uop_mem_signed      (io_iss_uops_1_mem_signed),
    .io_iss_uop_is_fence        (io_iss_uops_1_is_fence),
    .io_iss_uop_is_fencei       (io_iss_uops_1_is_fencei),
    .io_iss_uop_is_amo          (io_iss_uops_1_is_amo),
    .io_iss_uop_uses_ldq        (io_iss_uops_1_uses_ldq),
    .io_iss_uop_uses_stq        (io_iss_uops_1_uses_stq),
    .io_iss_uop_is_sys_pc2epc   (io_iss_uops_1_is_sys_pc2epc),
    .io_iss_uop_is_unique       (io_iss_uops_1_is_unique),
    .io_iss_uop_flush_on_commit (io_iss_uops_1_flush_on_commit),
    .io_iss_uop_ldst_is_rs1     (io_iss_uops_1_ldst_is_rs1),
    .io_iss_uop_ldst            (io_iss_uops_1_ldst),
    .io_iss_uop_lrs1            (io_iss_uops_1_lrs1),
    .io_iss_uop_lrs2            (io_iss_uops_1_lrs2),
    .io_iss_uop_lrs3            (io_iss_uops_1_lrs3),
    .io_iss_uop_ldst_val        (io_iss_uops_1_ldst_val),
    .io_iss_uop_dst_rtype       (io_iss_uops_1_dst_rtype),
    .io_iss_uop_lrs1_rtype      (io_iss_uops_1_lrs1_rtype),
    .io_iss_uop_lrs2_rtype      (io_iss_uops_1_lrs2_rtype),
    .io_iss_uop_frs3_en         (io_iss_uops_1_frs3_en),
    .io_iss_uop_fp_val          (io_iss_uops_1_fp_val),
    .io_iss_uop_fp_single       (io_iss_uops_1_fp_single),
    .io_iss_uop_xcpt_pf_if      (io_iss_uops_1_xcpt_pf_if),
    .io_iss_uop_xcpt_ae_if      (io_iss_uops_1_xcpt_ae_if),
    .io_iss_uop_xcpt_ma_if      (io_iss_uops_1_xcpt_ma_if),
    .io_iss_uop_bp_debug_if     (io_iss_uops_1_bp_debug_if),
    .io_iss_uop_bp_xcpt_if      (io_iss_uops_1_bp_xcpt_if),
    .io_iss_uop_debug_fsrc      (io_iss_uops_1_debug_fsrc),
    .io_iss_uop_debug_tsrc      (io_iss_uops_1_debug_tsrc),
    .io_rrd_valid               (_rrd_decode_unit_1_io_rrd_valid),
    .io_rrd_uop_uopc            (_rrd_decode_unit_1_io_rrd_uop_uopc),
    .io_rrd_uop_inst            (_rrd_decode_unit_1_io_rrd_uop_inst),
    .io_rrd_uop_debug_inst      (_rrd_decode_unit_1_io_rrd_uop_debug_inst),
    .io_rrd_uop_is_rvc          (_rrd_decode_unit_1_io_rrd_uop_is_rvc),
    .io_rrd_uop_debug_pc        (_rrd_decode_unit_1_io_rrd_uop_debug_pc),
    .io_rrd_uop_iq_type         (_rrd_decode_unit_1_io_rrd_uop_iq_type),
    .io_rrd_uop_fu_code         (_rrd_decode_unit_1_io_rrd_uop_fu_code),
    .io_rrd_uop_ctrl_br_type    (_rrd_decode_unit_1_io_rrd_uop_ctrl_br_type),
    .io_rrd_uop_ctrl_op1_sel    (_rrd_decode_unit_1_io_rrd_uop_ctrl_op1_sel),
    .io_rrd_uop_ctrl_op2_sel    (_rrd_decode_unit_1_io_rrd_uop_ctrl_op2_sel),
    .io_rrd_uop_ctrl_imm_sel    (_rrd_decode_unit_1_io_rrd_uop_ctrl_imm_sel),
    .io_rrd_uop_ctrl_op_fcn     (_rrd_decode_unit_1_io_rrd_uop_ctrl_op_fcn),
    .io_rrd_uop_ctrl_fcn_dw     (_rrd_decode_unit_1_io_rrd_uop_ctrl_fcn_dw),
    .io_rrd_uop_ctrl_csr_cmd    (_rrd_decode_unit_1_io_rrd_uop_ctrl_csr_cmd),
    .io_rrd_uop_ctrl_is_load    (_rrd_decode_unit_1_io_rrd_uop_ctrl_is_load),
    .io_rrd_uop_ctrl_is_sta     (_rrd_decode_unit_1_io_rrd_uop_ctrl_is_sta),
    .io_rrd_uop_ctrl_is_std     (_rrd_decode_unit_1_io_rrd_uop_ctrl_is_std),
    .io_rrd_uop_iw_state        (_rrd_decode_unit_1_io_rrd_uop_iw_state),
    .io_rrd_uop_is_br           (_rrd_decode_unit_1_io_rrd_uop_is_br),
    .io_rrd_uop_is_jalr         (_rrd_decode_unit_1_io_rrd_uop_is_jalr),
    .io_rrd_uop_is_jal          (_rrd_decode_unit_1_io_rrd_uop_is_jal),
    .io_rrd_uop_is_sfb          (_rrd_decode_unit_1_io_rrd_uop_is_sfb),
    .io_rrd_uop_br_mask         (_rrd_decode_unit_1_io_rrd_uop_br_mask),
    .io_rrd_uop_br_tag          (_rrd_decode_unit_1_io_rrd_uop_br_tag),
    .io_rrd_uop_ftq_idx         (_rrd_decode_unit_1_io_rrd_uop_ftq_idx),
    .io_rrd_uop_edge_inst       (_rrd_decode_unit_1_io_rrd_uop_edge_inst),
    .io_rrd_uop_pc_lob          (_rrd_decode_unit_1_io_rrd_uop_pc_lob),
    .io_rrd_uop_taken           (_rrd_decode_unit_1_io_rrd_uop_taken),
    .io_rrd_uop_imm_packed      (_rrd_decode_unit_1_io_rrd_uop_imm_packed),
    .io_rrd_uop_csr_addr        (_rrd_decode_unit_1_io_rrd_uop_csr_addr),
    .io_rrd_uop_rob_idx         (_rrd_decode_unit_1_io_rrd_uop_rob_idx),
    .io_rrd_uop_ldq_idx         (_rrd_decode_unit_1_io_rrd_uop_ldq_idx),
    .io_rrd_uop_stq_idx         (_rrd_decode_unit_1_io_rrd_uop_stq_idx),
    .io_rrd_uop_rxq_idx         (_rrd_decode_unit_1_io_rrd_uop_rxq_idx),
    .io_rrd_uop_pdst            (_rrd_decode_unit_1_io_rrd_uop_pdst),
    .io_rrd_uop_prs1            (_rrd_decode_unit_1_io_rrd_uop_prs1),
    .io_rrd_uop_prs2            (_rrd_decode_unit_1_io_rrd_uop_prs2),
    .io_rrd_uop_prs3            (_rrd_decode_unit_1_io_rrd_uop_prs3),
    .io_rrd_uop_ppred           (_rrd_decode_unit_1_io_rrd_uop_ppred),
    .io_rrd_uop_prs1_busy       (_rrd_decode_unit_1_io_rrd_uop_prs1_busy),
    .io_rrd_uop_prs2_busy       (_rrd_decode_unit_1_io_rrd_uop_prs2_busy),
    .io_rrd_uop_prs3_busy       (_rrd_decode_unit_1_io_rrd_uop_prs3_busy),
    .io_rrd_uop_ppred_busy      (_rrd_decode_unit_1_io_rrd_uop_ppred_busy),
    .io_rrd_uop_stale_pdst      (_rrd_decode_unit_1_io_rrd_uop_stale_pdst),
    .io_rrd_uop_exception       (_rrd_decode_unit_1_io_rrd_uop_exception),
    .io_rrd_uop_exc_cause       (_rrd_decode_unit_1_io_rrd_uop_exc_cause),
    .io_rrd_uop_bypassable      (_rrd_decode_unit_1_io_rrd_uop_bypassable),
    .io_rrd_uop_mem_cmd         (_rrd_decode_unit_1_io_rrd_uop_mem_cmd),
    .io_rrd_uop_mem_size        (_rrd_decode_unit_1_io_rrd_uop_mem_size),
    .io_rrd_uop_mem_signed      (_rrd_decode_unit_1_io_rrd_uop_mem_signed),
    .io_rrd_uop_is_fence        (_rrd_decode_unit_1_io_rrd_uop_is_fence),
    .io_rrd_uop_is_fencei       (_rrd_decode_unit_1_io_rrd_uop_is_fencei),
    .io_rrd_uop_is_amo          (_rrd_decode_unit_1_io_rrd_uop_is_amo),
    .io_rrd_uop_uses_ldq        (_rrd_decode_unit_1_io_rrd_uop_uses_ldq),
    .io_rrd_uop_uses_stq        (_rrd_decode_unit_1_io_rrd_uop_uses_stq),
    .io_rrd_uop_is_sys_pc2epc   (_rrd_decode_unit_1_io_rrd_uop_is_sys_pc2epc),
    .io_rrd_uop_is_unique       (_rrd_decode_unit_1_io_rrd_uop_is_unique),
    .io_rrd_uop_flush_on_commit (_rrd_decode_unit_1_io_rrd_uop_flush_on_commit),
    .io_rrd_uop_ldst_is_rs1     (_rrd_decode_unit_1_io_rrd_uop_ldst_is_rs1),
    .io_rrd_uop_ldst            (_rrd_decode_unit_1_io_rrd_uop_ldst),
    .io_rrd_uop_lrs1            (_rrd_decode_unit_1_io_rrd_uop_lrs1),
    .io_rrd_uop_lrs2            (_rrd_decode_unit_1_io_rrd_uop_lrs2),
    .io_rrd_uop_lrs3            (_rrd_decode_unit_1_io_rrd_uop_lrs3),
    .io_rrd_uop_ldst_val        (_rrd_decode_unit_1_io_rrd_uop_ldst_val),
    .io_rrd_uop_dst_rtype       (_rrd_decode_unit_1_io_rrd_uop_dst_rtype),
    .io_rrd_uop_lrs1_rtype      (_rrd_decode_unit_1_io_rrd_uop_lrs1_rtype),
    .io_rrd_uop_lrs2_rtype      (_rrd_decode_unit_1_io_rrd_uop_lrs2_rtype),
    .io_rrd_uop_frs3_en         (_rrd_decode_unit_1_io_rrd_uop_frs3_en),
    .io_rrd_uop_fp_val          (_rrd_decode_unit_1_io_rrd_uop_fp_val),
    .io_rrd_uop_fp_single       (_rrd_decode_unit_1_io_rrd_uop_fp_single),
    .io_rrd_uop_xcpt_pf_if      (_rrd_decode_unit_1_io_rrd_uop_xcpt_pf_if),
    .io_rrd_uop_xcpt_ae_if      (_rrd_decode_unit_1_io_rrd_uop_xcpt_ae_if),
    .io_rrd_uop_xcpt_ma_if      (_rrd_decode_unit_1_io_rrd_uop_xcpt_ma_if),
    .io_rrd_uop_bp_debug_if     (_rrd_decode_unit_1_io_rrd_uop_bp_debug_if),
    .io_rrd_uop_bp_xcpt_if      (_rrd_decode_unit_1_io_rrd_uop_bp_xcpt_if),
    .io_rrd_uop_debug_fsrc      (_rrd_decode_unit_1_io_rrd_uop_debug_fsrc),
    .io_rrd_uop_debug_tsrc      (_rrd_decode_unit_1_io_rrd_uop_debug_tsrc)
  );
  RegisterReadDecode_4 rrd_decode_unit_2 (
    .io_iss_valid               (io_iss_valids_2),
    .io_iss_uop_uopc            (io_iss_uops_2_uopc),
    .io_iss_uop_inst            (io_iss_uops_2_inst),
    .io_iss_uop_debug_inst      (io_iss_uops_2_debug_inst),
    .io_iss_uop_is_rvc          (io_iss_uops_2_is_rvc),
    .io_iss_uop_debug_pc        (io_iss_uops_2_debug_pc),
    .io_iss_uop_iq_type         (io_iss_uops_2_iq_type),
    .io_iss_uop_fu_code         (io_iss_uops_2_fu_code),
    .io_iss_uop_iw_state        (io_iss_uops_2_iw_state),
    .io_iss_uop_is_br           (io_iss_uops_2_is_br),
    .io_iss_uop_is_jalr         (io_iss_uops_2_is_jalr),
    .io_iss_uop_is_jal          (io_iss_uops_2_is_jal),
    .io_iss_uop_is_sfb          (io_iss_uops_2_is_sfb),
    .io_iss_uop_br_mask         (io_iss_uops_2_br_mask),
    .io_iss_uop_br_tag          (io_iss_uops_2_br_tag),
    .io_iss_uop_ftq_idx         (io_iss_uops_2_ftq_idx),
    .io_iss_uop_edge_inst       (io_iss_uops_2_edge_inst),
    .io_iss_uop_pc_lob          (io_iss_uops_2_pc_lob),
    .io_iss_uop_taken           (io_iss_uops_2_taken),
    .io_iss_uop_imm_packed      (io_iss_uops_2_imm_packed),
    .io_iss_uop_csr_addr        (io_iss_uops_2_csr_addr),
    .io_iss_uop_rob_idx         (io_iss_uops_2_rob_idx),
    .io_iss_uop_ldq_idx         (io_iss_uops_2_ldq_idx),
    .io_iss_uop_stq_idx         (io_iss_uops_2_stq_idx),
    .io_iss_uop_rxq_idx         (io_iss_uops_2_rxq_idx),
    .io_iss_uop_pdst            (io_iss_uops_2_pdst),
    .io_iss_uop_prs1            (io_iss_uops_2_prs1),
    .io_iss_uop_prs2            (io_iss_uops_2_prs2),
    .io_iss_uop_prs3            (io_iss_uops_2_prs3),
    .io_iss_uop_ppred           (io_iss_uops_2_ppred),
    .io_iss_uop_prs1_busy       (io_iss_uops_2_prs1_busy),
    .io_iss_uop_prs2_busy       (io_iss_uops_2_prs2_busy),
    .io_iss_uop_prs3_busy       (io_iss_uops_2_prs3_busy),
    .io_iss_uop_ppred_busy      (io_iss_uops_2_ppred_busy),
    .io_iss_uop_stale_pdst      (io_iss_uops_2_stale_pdst),
    .io_iss_uop_exception       (io_iss_uops_2_exception),
    .io_iss_uop_exc_cause       (io_iss_uops_2_exc_cause),
    .io_iss_uop_bypassable      (io_iss_uops_2_bypassable),
    .io_iss_uop_mem_cmd         (io_iss_uops_2_mem_cmd),
    .io_iss_uop_mem_size        (io_iss_uops_2_mem_size),
    .io_iss_uop_mem_signed      (io_iss_uops_2_mem_signed),
    .io_iss_uop_is_fence        (io_iss_uops_2_is_fence),
    .io_iss_uop_is_fencei       (io_iss_uops_2_is_fencei),
    .io_iss_uop_is_amo          (io_iss_uops_2_is_amo),
    .io_iss_uop_uses_ldq        (io_iss_uops_2_uses_ldq),
    .io_iss_uop_uses_stq        (io_iss_uops_2_uses_stq),
    .io_iss_uop_is_sys_pc2epc   (io_iss_uops_2_is_sys_pc2epc),
    .io_iss_uop_is_unique       (io_iss_uops_2_is_unique),
    .io_iss_uop_flush_on_commit (io_iss_uops_2_flush_on_commit),
    .io_iss_uop_ldst_is_rs1     (io_iss_uops_2_ldst_is_rs1),
    .io_iss_uop_ldst            (io_iss_uops_2_ldst),
    .io_iss_uop_lrs1            (io_iss_uops_2_lrs1),
    .io_iss_uop_lrs2            (io_iss_uops_2_lrs2),
    .io_iss_uop_lrs3            (io_iss_uops_2_lrs3),
    .io_iss_uop_ldst_val        (io_iss_uops_2_ldst_val),
    .io_iss_uop_dst_rtype       (io_iss_uops_2_dst_rtype),
    .io_iss_uop_lrs1_rtype      (io_iss_uops_2_lrs1_rtype),
    .io_iss_uop_lrs2_rtype      (io_iss_uops_2_lrs2_rtype),
    .io_iss_uop_frs3_en         (io_iss_uops_2_frs3_en),
    .io_iss_uop_fp_val          (io_iss_uops_2_fp_val),
    .io_iss_uop_fp_single       (io_iss_uops_2_fp_single),
    .io_iss_uop_xcpt_pf_if      (io_iss_uops_2_xcpt_pf_if),
    .io_iss_uop_xcpt_ae_if      (io_iss_uops_2_xcpt_ae_if),
    .io_iss_uop_xcpt_ma_if      (io_iss_uops_2_xcpt_ma_if),
    .io_iss_uop_bp_debug_if     (io_iss_uops_2_bp_debug_if),
    .io_iss_uop_bp_xcpt_if      (io_iss_uops_2_bp_xcpt_if),
    .io_iss_uop_debug_fsrc      (io_iss_uops_2_debug_fsrc),
    .io_iss_uop_debug_tsrc      (io_iss_uops_2_debug_tsrc),
    .io_rrd_valid               (_rrd_decode_unit_2_io_rrd_valid),
    .io_rrd_uop_uopc            (_rrd_decode_unit_2_io_rrd_uop_uopc),
    .io_rrd_uop_inst            (_rrd_decode_unit_2_io_rrd_uop_inst),
    .io_rrd_uop_debug_inst      (_rrd_decode_unit_2_io_rrd_uop_debug_inst),
    .io_rrd_uop_is_rvc          (_rrd_decode_unit_2_io_rrd_uop_is_rvc),
    .io_rrd_uop_debug_pc        (_rrd_decode_unit_2_io_rrd_uop_debug_pc),
    .io_rrd_uop_iq_type         (_rrd_decode_unit_2_io_rrd_uop_iq_type),
    .io_rrd_uop_fu_code         (_rrd_decode_unit_2_io_rrd_uop_fu_code),
    .io_rrd_uop_ctrl_br_type    (_rrd_decode_unit_2_io_rrd_uop_ctrl_br_type),
    .io_rrd_uop_ctrl_op1_sel    (_rrd_decode_unit_2_io_rrd_uop_ctrl_op1_sel),
    .io_rrd_uop_ctrl_op2_sel    (_rrd_decode_unit_2_io_rrd_uop_ctrl_op2_sel),
    .io_rrd_uop_ctrl_imm_sel    (_rrd_decode_unit_2_io_rrd_uop_ctrl_imm_sel),
    .io_rrd_uop_ctrl_op_fcn     (_rrd_decode_unit_2_io_rrd_uop_ctrl_op_fcn),
    .io_rrd_uop_ctrl_fcn_dw     (_rrd_decode_unit_2_io_rrd_uop_ctrl_fcn_dw),
    .io_rrd_uop_ctrl_csr_cmd    (_rrd_decode_unit_2_io_rrd_uop_ctrl_csr_cmd),
    .io_rrd_uop_ctrl_is_load    (_rrd_decode_unit_2_io_rrd_uop_ctrl_is_load),
    .io_rrd_uop_ctrl_is_sta     (_rrd_decode_unit_2_io_rrd_uop_ctrl_is_sta),
    .io_rrd_uop_ctrl_is_std     (_rrd_decode_unit_2_io_rrd_uop_ctrl_is_std),
    .io_rrd_uop_iw_state        (_rrd_decode_unit_2_io_rrd_uop_iw_state),
    .io_rrd_uop_is_br           (_rrd_decode_unit_2_io_rrd_uop_is_br),
    .io_rrd_uop_is_jalr         (_rrd_decode_unit_2_io_rrd_uop_is_jalr),
    .io_rrd_uop_is_jal          (_rrd_decode_unit_2_io_rrd_uop_is_jal),
    .io_rrd_uop_is_sfb          (_rrd_decode_unit_2_io_rrd_uop_is_sfb),
    .io_rrd_uop_br_mask         (_rrd_decode_unit_2_io_rrd_uop_br_mask),
    .io_rrd_uop_br_tag          (_rrd_decode_unit_2_io_rrd_uop_br_tag),
    .io_rrd_uop_ftq_idx         (_rrd_decode_unit_2_io_rrd_uop_ftq_idx),
    .io_rrd_uop_edge_inst       (_rrd_decode_unit_2_io_rrd_uop_edge_inst),
    .io_rrd_uop_pc_lob          (_rrd_decode_unit_2_io_rrd_uop_pc_lob),
    .io_rrd_uop_taken           (_rrd_decode_unit_2_io_rrd_uop_taken),
    .io_rrd_uop_imm_packed      (_rrd_decode_unit_2_io_rrd_uop_imm_packed),
    .io_rrd_uop_csr_addr        (_rrd_decode_unit_2_io_rrd_uop_csr_addr),
    .io_rrd_uop_rob_idx         (_rrd_decode_unit_2_io_rrd_uop_rob_idx),
    .io_rrd_uop_ldq_idx         (_rrd_decode_unit_2_io_rrd_uop_ldq_idx),
    .io_rrd_uop_stq_idx         (_rrd_decode_unit_2_io_rrd_uop_stq_idx),
    .io_rrd_uop_rxq_idx         (_rrd_decode_unit_2_io_rrd_uop_rxq_idx),
    .io_rrd_uop_pdst            (_rrd_decode_unit_2_io_rrd_uop_pdst),
    .io_rrd_uop_prs1            (_rrd_decode_unit_2_io_rrd_uop_prs1),
    .io_rrd_uop_prs2            (_rrd_decode_unit_2_io_rrd_uop_prs2),
    .io_rrd_uop_prs3            (_rrd_decode_unit_2_io_rrd_uop_prs3),
    .io_rrd_uop_ppred           (_rrd_decode_unit_2_io_rrd_uop_ppred),
    .io_rrd_uop_prs1_busy       (_rrd_decode_unit_2_io_rrd_uop_prs1_busy),
    .io_rrd_uop_prs2_busy       (_rrd_decode_unit_2_io_rrd_uop_prs2_busy),
    .io_rrd_uop_prs3_busy       (_rrd_decode_unit_2_io_rrd_uop_prs3_busy),
    .io_rrd_uop_ppred_busy      (_rrd_decode_unit_2_io_rrd_uop_ppred_busy),
    .io_rrd_uop_stale_pdst      (_rrd_decode_unit_2_io_rrd_uop_stale_pdst),
    .io_rrd_uop_exception       (_rrd_decode_unit_2_io_rrd_uop_exception),
    .io_rrd_uop_exc_cause       (_rrd_decode_unit_2_io_rrd_uop_exc_cause),
    .io_rrd_uop_bypassable      (_rrd_decode_unit_2_io_rrd_uop_bypassable),
    .io_rrd_uop_mem_cmd         (_rrd_decode_unit_2_io_rrd_uop_mem_cmd),
    .io_rrd_uop_mem_size        (_rrd_decode_unit_2_io_rrd_uop_mem_size),
    .io_rrd_uop_mem_signed      (_rrd_decode_unit_2_io_rrd_uop_mem_signed),
    .io_rrd_uop_is_fence        (_rrd_decode_unit_2_io_rrd_uop_is_fence),
    .io_rrd_uop_is_fencei       (_rrd_decode_unit_2_io_rrd_uop_is_fencei),
    .io_rrd_uop_is_amo          (_rrd_decode_unit_2_io_rrd_uop_is_amo),
    .io_rrd_uop_uses_ldq        (_rrd_decode_unit_2_io_rrd_uop_uses_ldq),
    .io_rrd_uop_uses_stq        (_rrd_decode_unit_2_io_rrd_uop_uses_stq),
    .io_rrd_uop_is_sys_pc2epc   (_rrd_decode_unit_2_io_rrd_uop_is_sys_pc2epc),
    .io_rrd_uop_is_unique       (_rrd_decode_unit_2_io_rrd_uop_is_unique),
    .io_rrd_uop_flush_on_commit (_rrd_decode_unit_2_io_rrd_uop_flush_on_commit),
    .io_rrd_uop_ldst_is_rs1     (_rrd_decode_unit_2_io_rrd_uop_ldst_is_rs1),
    .io_rrd_uop_ldst            (_rrd_decode_unit_2_io_rrd_uop_ldst),
    .io_rrd_uop_lrs1            (_rrd_decode_unit_2_io_rrd_uop_lrs1),
    .io_rrd_uop_lrs2            (_rrd_decode_unit_2_io_rrd_uop_lrs2),
    .io_rrd_uop_lrs3            (_rrd_decode_unit_2_io_rrd_uop_lrs3),
    .io_rrd_uop_ldst_val        (_rrd_decode_unit_2_io_rrd_uop_ldst_val),
    .io_rrd_uop_dst_rtype       (_rrd_decode_unit_2_io_rrd_uop_dst_rtype),
    .io_rrd_uop_lrs1_rtype      (_rrd_decode_unit_2_io_rrd_uop_lrs1_rtype),
    .io_rrd_uop_lrs2_rtype      (_rrd_decode_unit_2_io_rrd_uop_lrs2_rtype),
    .io_rrd_uop_frs3_en         (_rrd_decode_unit_2_io_rrd_uop_frs3_en),
    .io_rrd_uop_fp_val          (_rrd_decode_unit_2_io_rrd_uop_fp_val),
    .io_rrd_uop_fp_single       (_rrd_decode_unit_2_io_rrd_uop_fp_single),
    .io_rrd_uop_xcpt_pf_if      (_rrd_decode_unit_2_io_rrd_uop_xcpt_pf_if),
    .io_rrd_uop_xcpt_ae_if      (_rrd_decode_unit_2_io_rrd_uop_xcpt_ae_if),
    .io_rrd_uop_xcpt_ma_if      (_rrd_decode_unit_2_io_rrd_uop_xcpt_ma_if),
    .io_rrd_uop_bp_debug_if     (_rrd_decode_unit_2_io_rrd_uop_bp_debug_if),
    .io_rrd_uop_bp_xcpt_if      (_rrd_decode_unit_2_io_rrd_uop_bp_xcpt_if),
    .io_rrd_uop_debug_fsrc      (_rrd_decode_unit_2_io_rrd_uop_debug_fsrc),
    .io_rrd_uop_debug_tsrc      (_rrd_decode_unit_2_io_rrd_uop_debug_tsrc)
  );
  RegisterReadDecode_5 rrd_decode_unit_3 (
    .io_iss_valid            (io_iss_valids_3),
    .io_iss_uop_uopc         (io_iss_uops_3_uopc),
    .io_iss_uop_is_rvc       (io_iss_uops_3_is_rvc),
    .io_iss_uop_fu_code      (io_iss_uops_3_fu_code),
    .io_iss_uop_is_br        (io_iss_uops_3_is_br),
    .io_iss_uop_is_jalr      (io_iss_uops_3_is_jalr),
    .io_iss_uop_is_jal       (io_iss_uops_3_is_jal),
    .io_iss_uop_is_sfb       (io_iss_uops_3_is_sfb),
    .io_iss_uop_br_mask      (io_iss_uops_3_br_mask),
    .io_iss_uop_br_tag       (io_iss_uops_3_br_tag),
    .io_iss_uop_ftq_idx      (io_iss_uops_3_ftq_idx),
    .io_iss_uop_edge_inst    (io_iss_uops_3_edge_inst),
    .io_iss_uop_pc_lob       (io_iss_uops_3_pc_lob),
    .io_iss_uop_taken        (io_iss_uops_3_taken),
    .io_iss_uop_imm_packed   (io_iss_uops_3_imm_packed),
    .io_iss_uop_rob_idx      (io_iss_uops_3_rob_idx),
    .io_iss_uop_ldq_idx      (io_iss_uops_3_ldq_idx),
    .io_iss_uop_stq_idx      (io_iss_uops_3_stq_idx),
    .io_iss_uop_pdst         (io_iss_uops_3_pdst),
    .io_iss_uop_prs1         (io_iss_uops_3_prs1),
    .io_iss_uop_prs2         (io_iss_uops_3_prs2),
    .io_iss_uop_bypassable   (io_iss_uops_3_bypassable),
    .io_iss_uop_mem_cmd      (io_iss_uops_3_mem_cmd),
    .io_iss_uop_is_amo       (io_iss_uops_3_is_amo),
    .io_iss_uop_uses_stq     (io_iss_uops_3_uses_stq),
    .io_iss_uop_dst_rtype    (io_iss_uops_3_dst_rtype),
    .io_iss_uop_lrs1_rtype   (io_iss_uops_3_lrs1_rtype),
    .io_iss_uop_lrs2_rtype   (io_iss_uops_3_lrs2_rtype),
    .io_rrd_valid            (_rrd_decode_unit_3_io_rrd_valid),
    .io_rrd_uop_uopc         (_rrd_decode_unit_3_io_rrd_uop_uopc),
    .io_rrd_uop_is_rvc       (_rrd_decode_unit_3_io_rrd_uop_is_rvc),
    .io_rrd_uop_fu_code      (_rrd_decode_unit_3_io_rrd_uop_fu_code),
    .io_rrd_uop_ctrl_br_type (_rrd_decode_unit_3_io_rrd_uop_ctrl_br_type),
    .io_rrd_uop_ctrl_op1_sel (_rrd_decode_unit_3_io_rrd_uop_ctrl_op1_sel),
    .io_rrd_uop_ctrl_op2_sel (_rrd_decode_unit_3_io_rrd_uop_ctrl_op2_sel),
    .io_rrd_uop_ctrl_imm_sel (_rrd_decode_unit_3_io_rrd_uop_ctrl_imm_sel),
    .io_rrd_uop_ctrl_op_fcn  (_rrd_decode_unit_3_io_rrd_uop_ctrl_op_fcn),
    .io_rrd_uop_ctrl_fcn_dw  (_rrd_decode_unit_3_io_rrd_uop_ctrl_fcn_dw),
    .io_rrd_uop_ctrl_csr_cmd (_rrd_decode_unit_3_io_rrd_uop_ctrl_csr_cmd),
    .io_rrd_uop_is_br        (_rrd_decode_unit_3_io_rrd_uop_is_br),
    .io_rrd_uop_is_jalr      (_rrd_decode_unit_3_io_rrd_uop_is_jalr),
    .io_rrd_uop_is_jal       (_rrd_decode_unit_3_io_rrd_uop_is_jal),
    .io_rrd_uop_is_sfb       (_rrd_decode_unit_3_io_rrd_uop_is_sfb),
    .io_rrd_uop_br_mask      (_rrd_decode_unit_3_io_rrd_uop_br_mask),
    .io_rrd_uop_br_tag       (_rrd_decode_unit_3_io_rrd_uop_br_tag),
    .io_rrd_uop_ftq_idx      (_rrd_decode_unit_3_io_rrd_uop_ftq_idx),
    .io_rrd_uop_edge_inst    (_rrd_decode_unit_3_io_rrd_uop_edge_inst),
    .io_rrd_uop_pc_lob       (_rrd_decode_unit_3_io_rrd_uop_pc_lob),
    .io_rrd_uop_taken        (_rrd_decode_unit_3_io_rrd_uop_taken),
    .io_rrd_uop_imm_packed   (_rrd_decode_unit_3_io_rrd_uop_imm_packed),
    .io_rrd_uop_rob_idx      (_rrd_decode_unit_3_io_rrd_uop_rob_idx),
    .io_rrd_uop_ldq_idx      (_rrd_decode_unit_3_io_rrd_uop_ldq_idx),
    .io_rrd_uop_stq_idx      (_rrd_decode_unit_3_io_rrd_uop_stq_idx),
    .io_rrd_uop_pdst         (_rrd_decode_unit_3_io_rrd_uop_pdst),
    .io_rrd_uop_prs1         (_rrd_decode_unit_3_io_rrd_uop_prs1),
    .io_rrd_uop_prs2         (_rrd_decode_unit_3_io_rrd_uop_prs2),
    .io_rrd_uop_bypassable   (_rrd_decode_unit_3_io_rrd_uop_bypassable),
    .io_rrd_uop_is_amo       (_rrd_decode_unit_3_io_rrd_uop_is_amo),
    .io_rrd_uop_uses_stq     (_rrd_decode_unit_3_io_rrd_uop_uses_stq),
    .io_rrd_uop_dst_rtype    (_rrd_decode_unit_3_io_rrd_uop_dst_rtype),
    .io_rrd_uop_lrs1_rtype   (_rrd_decode_unit_3_io_rrd_uop_lrs1_rtype),
    .io_rrd_uop_lrs2_rtype   (_rrd_decode_unit_3_io_rrd_uop_lrs2_rtype)
  );
  RegisterReadDecode_6 rrd_decode_unit_4 (
    .io_iss_valid            (io_iss_valids_4),
    .io_iss_uop_uopc         (io_iss_uops_4_uopc),
    .io_iss_uop_is_rvc       (io_iss_uops_4_is_rvc),
    .io_iss_uop_fu_code      (io_iss_uops_4_fu_code),
    .io_iss_uop_is_br        (io_iss_uops_4_is_br),
    .io_iss_uop_is_jalr      (io_iss_uops_4_is_jalr),
    .io_iss_uop_is_jal       (io_iss_uops_4_is_jal),
    .io_iss_uop_is_sfb       (io_iss_uops_4_is_sfb),
    .io_iss_uop_br_mask      (io_iss_uops_4_br_mask),
    .io_iss_uop_br_tag       (io_iss_uops_4_br_tag),
    .io_iss_uop_ftq_idx      (io_iss_uops_4_ftq_idx),
    .io_iss_uop_edge_inst    (io_iss_uops_4_edge_inst),
    .io_iss_uop_pc_lob       (io_iss_uops_4_pc_lob),
    .io_iss_uop_taken        (io_iss_uops_4_taken),
    .io_iss_uop_imm_packed   (io_iss_uops_4_imm_packed),
    .io_iss_uop_rob_idx      (io_iss_uops_4_rob_idx),
    .io_iss_uop_ldq_idx      (io_iss_uops_4_ldq_idx),
    .io_iss_uop_stq_idx      (io_iss_uops_4_stq_idx),
    .io_iss_uop_pdst         (io_iss_uops_4_pdst),
    .io_iss_uop_prs1         (io_iss_uops_4_prs1),
    .io_iss_uop_prs2         (io_iss_uops_4_prs2),
    .io_iss_uop_bypassable   (io_iss_uops_4_bypassable),
    .io_iss_uop_mem_cmd      (io_iss_uops_4_mem_cmd),
    .io_iss_uop_is_amo       (io_iss_uops_4_is_amo),
    .io_iss_uop_uses_stq     (io_iss_uops_4_uses_stq),
    .io_iss_uop_dst_rtype    (io_iss_uops_4_dst_rtype),
    .io_iss_uop_lrs1_rtype   (io_iss_uops_4_lrs1_rtype),
    .io_iss_uop_lrs2_rtype   (io_iss_uops_4_lrs2_rtype),
    .io_rrd_valid            (_rrd_decode_unit_4_io_rrd_valid),
    .io_rrd_uop_uopc         (_rrd_decode_unit_4_io_rrd_uop_uopc),
    .io_rrd_uop_is_rvc       (_rrd_decode_unit_4_io_rrd_uop_is_rvc),
    .io_rrd_uop_fu_code      (_rrd_decode_unit_4_io_rrd_uop_fu_code),
    .io_rrd_uop_ctrl_br_type (_rrd_decode_unit_4_io_rrd_uop_ctrl_br_type),
    .io_rrd_uop_ctrl_op1_sel (_rrd_decode_unit_4_io_rrd_uop_ctrl_op1_sel),
    .io_rrd_uop_ctrl_op2_sel (_rrd_decode_unit_4_io_rrd_uop_ctrl_op2_sel),
    .io_rrd_uop_ctrl_imm_sel (_rrd_decode_unit_4_io_rrd_uop_ctrl_imm_sel),
    .io_rrd_uop_ctrl_op_fcn  (_rrd_decode_unit_4_io_rrd_uop_ctrl_op_fcn),
    .io_rrd_uop_ctrl_fcn_dw  (_rrd_decode_unit_4_io_rrd_uop_ctrl_fcn_dw),
    .io_rrd_uop_ctrl_csr_cmd (/* unused */),
    .io_rrd_uop_is_br        (_rrd_decode_unit_4_io_rrd_uop_is_br),
    .io_rrd_uop_is_jalr      (_rrd_decode_unit_4_io_rrd_uop_is_jalr),
    .io_rrd_uop_is_jal       (_rrd_decode_unit_4_io_rrd_uop_is_jal),
    .io_rrd_uop_is_sfb       (_rrd_decode_unit_4_io_rrd_uop_is_sfb),
    .io_rrd_uop_br_mask      (_rrd_decode_unit_4_io_rrd_uop_br_mask),
    .io_rrd_uop_br_tag       (_rrd_decode_unit_4_io_rrd_uop_br_tag),
    .io_rrd_uop_ftq_idx      (_rrd_decode_unit_4_io_rrd_uop_ftq_idx),
    .io_rrd_uop_edge_inst    (_rrd_decode_unit_4_io_rrd_uop_edge_inst),
    .io_rrd_uop_pc_lob       (_rrd_decode_unit_4_io_rrd_uop_pc_lob),
    .io_rrd_uop_taken        (_rrd_decode_unit_4_io_rrd_uop_taken),
    .io_rrd_uop_imm_packed   (_rrd_decode_unit_4_io_rrd_uop_imm_packed),
    .io_rrd_uop_rob_idx      (_rrd_decode_unit_4_io_rrd_uop_rob_idx),
    .io_rrd_uop_ldq_idx      (_rrd_decode_unit_4_io_rrd_uop_ldq_idx),
    .io_rrd_uop_stq_idx      (_rrd_decode_unit_4_io_rrd_uop_stq_idx),
    .io_rrd_uop_pdst         (_rrd_decode_unit_4_io_rrd_uop_pdst),
    .io_rrd_uop_prs1         (_rrd_decode_unit_4_io_rrd_uop_prs1),
    .io_rrd_uop_prs2         (_rrd_decode_unit_4_io_rrd_uop_prs2),
    .io_rrd_uop_bypassable   (_rrd_decode_unit_4_io_rrd_uop_bypassable),
    .io_rrd_uop_is_amo       (_rrd_decode_unit_4_io_rrd_uop_is_amo),
    .io_rrd_uop_uses_stq     (_rrd_decode_unit_4_io_rrd_uop_uses_stq),
    .io_rrd_uop_dst_rtype    (_rrd_decode_unit_4_io_rrd_uop_dst_rtype),
    .io_rrd_uop_lrs1_rtype   (_rrd_decode_unit_4_io_rrd_uop_lrs1_rtype),
    .io_rrd_uop_lrs2_rtype   (_rrd_decode_unit_4_io_rrd_uop_lrs2_rtype)
  );
  RegisterReadDecode_6 rrd_decode_unit_5 (
    .io_iss_valid            (io_iss_valids_5),
    .io_iss_uop_uopc         (io_iss_uops_5_uopc),
    .io_iss_uop_is_rvc       (io_iss_uops_5_is_rvc),
    .io_iss_uop_fu_code      (io_iss_uops_5_fu_code),
    .io_iss_uop_is_br        (io_iss_uops_5_is_br),
    .io_iss_uop_is_jalr      (io_iss_uops_5_is_jalr),
    .io_iss_uop_is_jal       (io_iss_uops_5_is_jal),
    .io_iss_uop_is_sfb       (io_iss_uops_5_is_sfb),
    .io_iss_uop_br_mask      (io_iss_uops_5_br_mask),
    .io_iss_uop_br_tag       (io_iss_uops_5_br_tag),
    .io_iss_uop_ftq_idx      (io_iss_uops_5_ftq_idx),
    .io_iss_uop_edge_inst    (io_iss_uops_5_edge_inst),
    .io_iss_uop_pc_lob       (io_iss_uops_5_pc_lob),
    .io_iss_uop_taken        (io_iss_uops_5_taken),
    .io_iss_uop_imm_packed   (io_iss_uops_5_imm_packed),
    .io_iss_uop_rob_idx      (io_iss_uops_5_rob_idx),
    .io_iss_uop_ldq_idx      (io_iss_uops_5_ldq_idx),
    .io_iss_uop_stq_idx      (io_iss_uops_5_stq_idx),
    .io_iss_uop_pdst         (io_iss_uops_5_pdst),
    .io_iss_uop_prs1         (io_iss_uops_5_prs1),
    .io_iss_uop_prs2         (io_iss_uops_5_prs2),
    .io_iss_uop_bypassable   (io_iss_uops_5_bypassable),
    .io_iss_uop_mem_cmd      (io_iss_uops_5_mem_cmd),
    .io_iss_uop_is_amo       (io_iss_uops_5_is_amo),
    .io_iss_uop_uses_stq     (io_iss_uops_5_uses_stq),
    .io_iss_uop_dst_rtype    (io_iss_uops_5_dst_rtype),
    .io_iss_uop_lrs1_rtype   (io_iss_uops_5_lrs1_rtype),
    .io_iss_uop_lrs2_rtype   (io_iss_uops_5_lrs2_rtype),
    .io_rrd_valid            (_rrd_decode_unit_5_io_rrd_valid),
    .io_rrd_uop_uopc         (_rrd_decode_unit_5_io_rrd_uop_uopc),
    .io_rrd_uop_is_rvc       (_rrd_decode_unit_5_io_rrd_uop_is_rvc),
    .io_rrd_uop_fu_code      (_rrd_decode_unit_5_io_rrd_uop_fu_code),
    .io_rrd_uop_ctrl_br_type (_rrd_decode_unit_5_io_rrd_uop_ctrl_br_type),
    .io_rrd_uop_ctrl_op1_sel (_rrd_decode_unit_5_io_rrd_uop_ctrl_op1_sel),
    .io_rrd_uop_ctrl_op2_sel (_rrd_decode_unit_5_io_rrd_uop_ctrl_op2_sel),
    .io_rrd_uop_ctrl_imm_sel (_rrd_decode_unit_5_io_rrd_uop_ctrl_imm_sel),
    .io_rrd_uop_ctrl_op_fcn  (_rrd_decode_unit_5_io_rrd_uop_ctrl_op_fcn),
    .io_rrd_uop_ctrl_fcn_dw  (_rrd_decode_unit_5_io_rrd_uop_ctrl_fcn_dw),
    .io_rrd_uop_ctrl_csr_cmd (_rrd_decode_unit_5_io_rrd_uop_ctrl_csr_cmd),
    .io_rrd_uop_is_br        (_rrd_decode_unit_5_io_rrd_uop_is_br),
    .io_rrd_uop_is_jalr      (_rrd_decode_unit_5_io_rrd_uop_is_jalr),
    .io_rrd_uop_is_jal       (_rrd_decode_unit_5_io_rrd_uop_is_jal),
    .io_rrd_uop_is_sfb       (_rrd_decode_unit_5_io_rrd_uop_is_sfb),
    .io_rrd_uop_br_mask      (_rrd_decode_unit_5_io_rrd_uop_br_mask),
    .io_rrd_uop_br_tag       (_rrd_decode_unit_5_io_rrd_uop_br_tag),
    .io_rrd_uop_ftq_idx      (_rrd_decode_unit_5_io_rrd_uop_ftq_idx),
    .io_rrd_uop_edge_inst    (_rrd_decode_unit_5_io_rrd_uop_edge_inst),
    .io_rrd_uop_pc_lob       (_rrd_decode_unit_5_io_rrd_uop_pc_lob),
    .io_rrd_uop_taken        (_rrd_decode_unit_5_io_rrd_uop_taken),
    .io_rrd_uop_imm_packed   (_rrd_decode_unit_5_io_rrd_uop_imm_packed),
    .io_rrd_uop_rob_idx      (_rrd_decode_unit_5_io_rrd_uop_rob_idx),
    .io_rrd_uop_ldq_idx      (_rrd_decode_unit_5_io_rrd_uop_ldq_idx),
    .io_rrd_uop_stq_idx      (_rrd_decode_unit_5_io_rrd_uop_stq_idx),
    .io_rrd_uop_pdst         (_rrd_decode_unit_5_io_rrd_uop_pdst),
    .io_rrd_uop_prs1         (_rrd_decode_unit_5_io_rrd_uop_prs1),
    .io_rrd_uop_prs2         (_rrd_decode_unit_5_io_rrd_uop_prs2),
    .io_rrd_uop_bypassable   (_rrd_decode_unit_5_io_rrd_uop_bypassable),
    .io_rrd_uop_is_amo       (_rrd_decode_unit_5_io_rrd_uop_is_amo),
    .io_rrd_uop_uses_stq     (_rrd_decode_unit_5_io_rrd_uop_uses_stq),
    .io_rrd_uop_dst_rtype    (_rrd_decode_unit_5_io_rrd_uop_dst_rtype),
    .io_rrd_uop_lrs1_rtype   (_rrd_decode_unit_5_io_rrd_uop_lrs1_rtype),
    .io_rrd_uop_lrs2_rtype   (_rrd_decode_unit_5_io_rrd_uop_lrs2_rtype)
  );
  assign io_rf_read_ports_0_addr = io_iss_uops_0_prs1;
  assign io_rf_read_ports_1_addr = io_iss_uops_0_prs2;
  assign io_rf_read_ports_2_addr = io_iss_uops_1_prs1;
  assign io_rf_read_ports_3_addr = io_iss_uops_1_prs2;
  assign io_rf_read_ports_4_addr = io_iss_uops_2_prs1;
  assign io_rf_read_ports_5_addr = io_iss_uops_2_prs2;
  assign io_rf_read_ports_6_addr = io_iss_uops_3_prs1;
  assign io_rf_read_ports_7_addr = io_iss_uops_3_prs2;
  assign io_rf_read_ports_8_addr = io_iss_uops_4_prs1;
  assign io_rf_read_ports_9_addr = io_iss_uops_4_prs2;
  assign io_rf_read_ports_10_addr = io_iss_uops_5_prs1;
  assign io_rf_read_ports_11_addr = io_iss_uops_5_prs2;
  assign io_exe_reqs_0_valid = exe_reg_valids_0;
  assign io_exe_reqs_0_bits_uop_uopc = exe_reg_uops_0_uopc;
  assign io_exe_reqs_0_bits_uop_inst = exe_reg_uops_0_inst;
  assign io_exe_reqs_0_bits_uop_debug_inst = exe_reg_uops_0_debug_inst;
  assign io_exe_reqs_0_bits_uop_is_rvc = exe_reg_uops_0_is_rvc;
  assign io_exe_reqs_0_bits_uop_debug_pc = exe_reg_uops_0_debug_pc;
  assign io_exe_reqs_0_bits_uop_iq_type = exe_reg_uops_0_iq_type;
  assign io_exe_reqs_0_bits_uop_fu_code = exe_reg_uops_0_fu_code;
  assign io_exe_reqs_0_bits_uop_ctrl_br_type = exe_reg_uops_0_ctrl_br_type;
  assign io_exe_reqs_0_bits_uop_ctrl_op1_sel = exe_reg_uops_0_ctrl_op1_sel;
  assign io_exe_reqs_0_bits_uop_ctrl_op2_sel = exe_reg_uops_0_ctrl_op2_sel;
  assign io_exe_reqs_0_bits_uop_ctrl_imm_sel = exe_reg_uops_0_ctrl_imm_sel;
  assign io_exe_reqs_0_bits_uop_ctrl_op_fcn = exe_reg_uops_0_ctrl_op_fcn;
  assign io_exe_reqs_0_bits_uop_ctrl_fcn_dw = exe_reg_uops_0_ctrl_fcn_dw;
  assign io_exe_reqs_0_bits_uop_ctrl_csr_cmd = exe_reg_uops_0_ctrl_csr_cmd;
  assign io_exe_reqs_0_bits_uop_ctrl_is_load = exe_reg_uops_0_ctrl_is_load;
  assign io_exe_reqs_0_bits_uop_ctrl_is_sta = exe_reg_uops_0_ctrl_is_sta;
  assign io_exe_reqs_0_bits_uop_ctrl_is_std = exe_reg_uops_0_ctrl_is_std;
  assign io_exe_reqs_0_bits_uop_iw_state = exe_reg_uops_0_iw_state;
  assign io_exe_reqs_0_bits_uop_is_br = exe_reg_uops_0_is_br;
  assign io_exe_reqs_0_bits_uop_is_jalr = exe_reg_uops_0_is_jalr;
  assign io_exe_reqs_0_bits_uop_is_jal = exe_reg_uops_0_is_jal;
  assign io_exe_reqs_0_bits_uop_is_sfb = exe_reg_uops_0_is_sfb;
  assign io_exe_reqs_0_bits_uop_br_mask = exe_reg_uops_0_br_mask;
  assign io_exe_reqs_0_bits_uop_br_tag = exe_reg_uops_0_br_tag;
  assign io_exe_reqs_0_bits_uop_ftq_idx = exe_reg_uops_0_ftq_idx;
  assign io_exe_reqs_0_bits_uop_edge_inst = exe_reg_uops_0_edge_inst;
  assign io_exe_reqs_0_bits_uop_pc_lob = exe_reg_uops_0_pc_lob;
  assign io_exe_reqs_0_bits_uop_taken = exe_reg_uops_0_taken;
  assign io_exe_reqs_0_bits_uop_imm_packed = exe_reg_uops_0_imm_packed;
  assign io_exe_reqs_0_bits_uop_csr_addr = exe_reg_uops_0_csr_addr;
  assign io_exe_reqs_0_bits_uop_rob_idx = exe_reg_uops_0_rob_idx;
  assign io_exe_reqs_0_bits_uop_ldq_idx = exe_reg_uops_0_ldq_idx;
  assign io_exe_reqs_0_bits_uop_stq_idx = exe_reg_uops_0_stq_idx;
  assign io_exe_reqs_0_bits_uop_rxq_idx = exe_reg_uops_0_rxq_idx;
  assign io_exe_reqs_0_bits_uop_pdst = exe_reg_uops_0_pdst;
  assign io_exe_reqs_0_bits_uop_prs1 = exe_reg_uops_0_prs1;
  assign io_exe_reqs_0_bits_uop_prs2 = exe_reg_uops_0_prs2;
  assign io_exe_reqs_0_bits_uop_prs3 = exe_reg_uops_0_prs3;
  assign io_exe_reqs_0_bits_uop_ppred = exe_reg_uops_0_ppred;
  assign io_exe_reqs_0_bits_uop_prs1_busy = exe_reg_uops_0_prs1_busy;
  assign io_exe_reqs_0_bits_uop_prs2_busy = exe_reg_uops_0_prs2_busy;
  assign io_exe_reqs_0_bits_uop_prs3_busy = exe_reg_uops_0_prs3_busy;
  assign io_exe_reqs_0_bits_uop_ppred_busy = exe_reg_uops_0_ppred_busy;
  assign io_exe_reqs_0_bits_uop_stale_pdst = exe_reg_uops_0_stale_pdst;
  assign io_exe_reqs_0_bits_uop_exception = exe_reg_uops_0_exception;
  assign io_exe_reqs_0_bits_uop_exc_cause = exe_reg_uops_0_exc_cause;
  assign io_exe_reqs_0_bits_uop_bypassable = exe_reg_uops_0_bypassable;
  assign io_exe_reqs_0_bits_uop_mem_cmd = exe_reg_uops_0_mem_cmd;
  assign io_exe_reqs_0_bits_uop_mem_size = exe_reg_uops_0_mem_size;
  assign io_exe_reqs_0_bits_uop_mem_signed = exe_reg_uops_0_mem_signed;
  assign io_exe_reqs_0_bits_uop_is_fence = exe_reg_uops_0_is_fence;
  assign io_exe_reqs_0_bits_uop_is_fencei = exe_reg_uops_0_is_fencei;
  assign io_exe_reqs_0_bits_uop_is_amo = exe_reg_uops_0_is_amo;
  assign io_exe_reqs_0_bits_uop_uses_ldq = exe_reg_uops_0_uses_ldq;
  assign io_exe_reqs_0_bits_uop_uses_stq = exe_reg_uops_0_uses_stq;
  assign io_exe_reqs_0_bits_uop_is_sys_pc2epc = exe_reg_uops_0_is_sys_pc2epc;
  assign io_exe_reqs_0_bits_uop_is_unique = exe_reg_uops_0_is_unique;
  assign io_exe_reqs_0_bits_uop_flush_on_commit = exe_reg_uops_0_flush_on_commit;
  assign io_exe_reqs_0_bits_uop_ldst_is_rs1 = exe_reg_uops_0_ldst_is_rs1;
  assign io_exe_reqs_0_bits_uop_ldst = exe_reg_uops_0_ldst;
  assign io_exe_reqs_0_bits_uop_lrs1 = exe_reg_uops_0_lrs1;
  assign io_exe_reqs_0_bits_uop_lrs2 = exe_reg_uops_0_lrs2;
  assign io_exe_reqs_0_bits_uop_lrs3 = exe_reg_uops_0_lrs3;
  assign io_exe_reqs_0_bits_uop_ldst_val = exe_reg_uops_0_ldst_val;
  assign io_exe_reqs_0_bits_uop_dst_rtype = exe_reg_uops_0_dst_rtype;
  assign io_exe_reqs_0_bits_uop_lrs1_rtype = exe_reg_uops_0_lrs1_rtype;
  assign io_exe_reqs_0_bits_uop_lrs2_rtype = exe_reg_uops_0_lrs2_rtype;
  assign io_exe_reqs_0_bits_uop_frs3_en = exe_reg_uops_0_frs3_en;
  assign io_exe_reqs_0_bits_uop_fp_val = exe_reg_uops_0_fp_val;
  assign io_exe_reqs_0_bits_uop_fp_single = exe_reg_uops_0_fp_single;
  assign io_exe_reqs_0_bits_uop_xcpt_pf_if = exe_reg_uops_0_xcpt_pf_if;
  assign io_exe_reqs_0_bits_uop_xcpt_ae_if = exe_reg_uops_0_xcpt_ae_if;
  assign io_exe_reqs_0_bits_uop_xcpt_ma_if = exe_reg_uops_0_xcpt_ma_if;
  assign io_exe_reqs_0_bits_uop_bp_debug_if = exe_reg_uops_0_bp_debug_if;
  assign io_exe_reqs_0_bits_uop_bp_xcpt_if = exe_reg_uops_0_bp_xcpt_if;
  assign io_exe_reqs_0_bits_uop_debug_fsrc = exe_reg_uops_0_debug_fsrc;
  assign io_exe_reqs_0_bits_uop_debug_tsrc = exe_reg_uops_0_debug_tsrc;
  assign io_exe_reqs_0_bits_rs1_data = exe_reg_rs1_data_0;
  assign io_exe_reqs_0_bits_rs2_data = exe_reg_rs2_data_0;
  assign io_exe_reqs_1_valid = exe_reg_valids_1;
  assign io_exe_reqs_1_bits_uop_uopc = exe_reg_uops_1_uopc;
  assign io_exe_reqs_1_bits_uop_inst = exe_reg_uops_1_inst;
  assign io_exe_reqs_1_bits_uop_debug_inst = exe_reg_uops_1_debug_inst;
  assign io_exe_reqs_1_bits_uop_is_rvc = exe_reg_uops_1_is_rvc;
  assign io_exe_reqs_1_bits_uop_debug_pc = exe_reg_uops_1_debug_pc;
  assign io_exe_reqs_1_bits_uop_iq_type = exe_reg_uops_1_iq_type;
  assign io_exe_reqs_1_bits_uop_fu_code = exe_reg_uops_1_fu_code;
  assign io_exe_reqs_1_bits_uop_ctrl_br_type = exe_reg_uops_1_ctrl_br_type;
  assign io_exe_reqs_1_bits_uop_ctrl_op1_sel = exe_reg_uops_1_ctrl_op1_sel;
  assign io_exe_reqs_1_bits_uop_ctrl_op2_sel = exe_reg_uops_1_ctrl_op2_sel;
  assign io_exe_reqs_1_bits_uop_ctrl_imm_sel = exe_reg_uops_1_ctrl_imm_sel;
  assign io_exe_reqs_1_bits_uop_ctrl_op_fcn = exe_reg_uops_1_ctrl_op_fcn;
  assign io_exe_reqs_1_bits_uop_ctrl_fcn_dw = exe_reg_uops_1_ctrl_fcn_dw;
  assign io_exe_reqs_1_bits_uop_ctrl_csr_cmd = exe_reg_uops_1_ctrl_csr_cmd;
  assign io_exe_reqs_1_bits_uop_ctrl_is_load = exe_reg_uops_1_ctrl_is_load;
  assign io_exe_reqs_1_bits_uop_ctrl_is_sta = exe_reg_uops_1_ctrl_is_sta;
  assign io_exe_reqs_1_bits_uop_ctrl_is_std = exe_reg_uops_1_ctrl_is_std;
  assign io_exe_reqs_1_bits_uop_iw_state = exe_reg_uops_1_iw_state;
  assign io_exe_reqs_1_bits_uop_is_br = exe_reg_uops_1_is_br;
  assign io_exe_reqs_1_bits_uop_is_jalr = exe_reg_uops_1_is_jalr;
  assign io_exe_reqs_1_bits_uop_is_jal = exe_reg_uops_1_is_jal;
  assign io_exe_reqs_1_bits_uop_is_sfb = exe_reg_uops_1_is_sfb;
  assign io_exe_reqs_1_bits_uop_br_mask = exe_reg_uops_1_br_mask;
  assign io_exe_reqs_1_bits_uop_br_tag = exe_reg_uops_1_br_tag;
  assign io_exe_reqs_1_bits_uop_ftq_idx = exe_reg_uops_1_ftq_idx;
  assign io_exe_reqs_1_bits_uop_edge_inst = exe_reg_uops_1_edge_inst;
  assign io_exe_reqs_1_bits_uop_pc_lob = exe_reg_uops_1_pc_lob;
  assign io_exe_reqs_1_bits_uop_taken = exe_reg_uops_1_taken;
  assign io_exe_reqs_1_bits_uop_imm_packed = exe_reg_uops_1_imm_packed;
  assign io_exe_reqs_1_bits_uop_csr_addr = exe_reg_uops_1_csr_addr;
  assign io_exe_reqs_1_bits_uop_rob_idx = exe_reg_uops_1_rob_idx;
  assign io_exe_reqs_1_bits_uop_ldq_idx = exe_reg_uops_1_ldq_idx;
  assign io_exe_reqs_1_bits_uop_stq_idx = exe_reg_uops_1_stq_idx;
  assign io_exe_reqs_1_bits_uop_rxq_idx = exe_reg_uops_1_rxq_idx;
  assign io_exe_reqs_1_bits_uop_pdst = exe_reg_uops_1_pdst;
  assign io_exe_reqs_1_bits_uop_prs1 = exe_reg_uops_1_prs1;
  assign io_exe_reqs_1_bits_uop_prs2 = exe_reg_uops_1_prs2;
  assign io_exe_reqs_1_bits_uop_prs3 = exe_reg_uops_1_prs3;
  assign io_exe_reqs_1_bits_uop_ppred = exe_reg_uops_1_ppred;
  assign io_exe_reqs_1_bits_uop_prs1_busy = exe_reg_uops_1_prs1_busy;
  assign io_exe_reqs_1_bits_uop_prs2_busy = exe_reg_uops_1_prs2_busy;
  assign io_exe_reqs_1_bits_uop_prs3_busy = exe_reg_uops_1_prs3_busy;
  assign io_exe_reqs_1_bits_uop_ppred_busy = exe_reg_uops_1_ppred_busy;
  assign io_exe_reqs_1_bits_uop_stale_pdst = exe_reg_uops_1_stale_pdst;
  assign io_exe_reqs_1_bits_uop_exception = exe_reg_uops_1_exception;
  assign io_exe_reqs_1_bits_uop_exc_cause = exe_reg_uops_1_exc_cause;
  assign io_exe_reqs_1_bits_uop_bypassable = exe_reg_uops_1_bypassable;
  assign io_exe_reqs_1_bits_uop_mem_cmd = exe_reg_uops_1_mem_cmd;
  assign io_exe_reqs_1_bits_uop_mem_size = exe_reg_uops_1_mem_size;
  assign io_exe_reqs_1_bits_uop_mem_signed = exe_reg_uops_1_mem_signed;
  assign io_exe_reqs_1_bits_uop_is_fence = exe_reg_uops_1_is_fence;
  assign io_exe_reqs_1_bits_uop_is_fencei = exe_reg_uops_1_is_fencei;
  assign io_exe_reqs_1_bits_uop_is_amo = exe_reg_uops_1_is_amo;
  assign io_exe_reqs_1_bits_uop_uses_ldq = exe_reg_uops_1_uses_ldq;
  assign io_exe_reqs_1_bits_uop_uses_stq = exe_reg_uops_1_uses_stq;
  assign io_exe_reqs_1_bits_uop_is_sys_pc2epc = exe_reg_uops_1_is_sys_pc2epc;
  assign io_exe_reqs_1_bits_uop_is_unique = exe_reg_uops_1_is_unique;
  assign io_exe_reqs_1_bits_uop_flush_on_commit = exe_reg_uops_1_flush_on_commit;
  assign io_exe_reqs_1_bits_uop_ldst_is_rs1 = exe_reg_uops_1_ldst_is_rs1;
  assign io_exe_reqs_1_bits_uop_ldst = exe_reg_uops_1_ldst;
  assign io_exe_reqs_1_bits_uop_lrs1 = exe_reg_uops_1_lrs1;
  assign io_exe_reqs_1_bits_uop_lrs2 = exe_reg_uops_1_lrs2;
  assign io_exe_reqs_1_bits_uop_lrs3 = exe_reg_uops_1_lrs3;
  assign io_exe_reqs_1_bits_uop_ldst_val = exe_reg_uops_1_ldst_val;
  assign io_exe_reqs_1_bits_uop_dst_rtype = exe_reg_uops_1_dst_rtype;
  assign io_exe_reqs_1_bits_uop_lrs1_rtype = exe_reg_uops_1_lrs1_rtype;
  assign io_exe_reqs_1_bits_uop_lrs2_rtype = exe_reg_uops_1_lrs2_rtype;
  assign io_exe_reqs_1_bits_uop_frs3_en = exe_reg_uops_1_frs3_en;
  assign io_exe_reqs_1_bits_uop_fp_val = exe_reg_uops_1_fp_val;
  assign io_exe_reqs_1_bits_uop_fp_single = exe_reg_uops_1_fp_single;
  assign io_exe_reqs_1_bits_uop_xcpt_pf_if = exe_reg_uops_1_xcpt_pf_if;
  assign io_exe_reqs_1_bits_uop_xcpt_ae_if = exe_reg_uops_1_xcpt_ae_if;
  assign io_exe_reqs_1_bits_uop_xcpt_ma_if = exe_reg_uops_1_xcpt_ma_if;
  assign io_exe_reqs_1_bits_uop_bp_debug_if = exe_reg_uops_1_bp_debug_if;
  assign io_exe_reqs_1_bits_uop_bp_xcpt_if = exe_reg_uops_1_bp_xcpt_if;
  assign io_exe_reqs_1_bits_uop_debug_fsrc = exe_reg_uops_1_debug_fsrc;
  assign io_exe_reqs_1_bits_uop_debug_tsrc = exe_reg_uops_1_debug_tsrc;
  assign io_exe_reqs_1_bits_rs1_data = exe_reg_rs1_data_1;
  assign io_exe_reqs_1_bits_rs2_data = exe_reg_rs2_data_1;
  assign io_exe_reqs_2_valid = exe_reg_valids_2;
  assign io_exe_reqs_2_bits_uop_uopc = exe_reg_uops_2_uopc;
  assign io_exe_reqs_2_bits_uop_inst = exe_reg_uops_2_inst;
  assign io_exe_reqs_2_bits_uop_debug_inst = exe_reg_uops_2_debug_inst;
  assign io_exe_reqs_2_bits_uop_is_rvc = exe_reg_uops_2_is_rvc;
  assign io_exe_reqs_2_bits_uop_debug_pc = exe_reg_uops_2_debug_pc;
  assign io_exe_reqs_2_bits_uop_iq_type = exe_reg_uops_2_iq_type;
  assign io_exe_reqs_2_bits_uop_fu_code = exe_reg_uops_2_fu_code;
  assign io_exe_reqs_2_bits_uop_ctrl_br_type = exe_reg_uops_2_ctrl_br_type;
  assign io_exe_reqs_2_bits_uop_ctrl_op1_sel = exe_reg_uops_2_ctrl_op1_sel;
  assign io_exe_reqs_2_bits_uop_ctrl_op2_sel = exe_reg_uops_2_ctrl_op2_sel;
  assign io_exe_reqs_2_bits_uop_ctrl_imm_sel = exe_reg_uops_2_ctrl_imm_sel;
  assign io_exe_reqs_2_bits_uop_ctrl_op_fcn = exe_reg_uops_2_ctrl_op_fcn;
  assign io_exe_reqs_2_bits_uop_ctrl_fcn_dw = exe_reg_uops_2_ctrl_fcn_dw;
  assign io_exe_reqs_2_bits_uop_ctrl_csr_cmd = exe_reg_uops_2_ctrl_csr_cmd;
  assign io_exe_reqs_2_bits_uop_ctrl_is_load = exe_reg_uops_2_ctrl_is_load;
  assign io_exe_reqs_2_bits_uop_ctrl_is_sta = exe_reg_uops_2_ctrl_is_sta;
  assign io_exe_reqs_2_bits_uop_ctrl_is_std = exe_reg_uops_2_ctrl_is_std;
  assign io_exe_reqs_2_bits_uop_iw_state = exe_reg_uops_2_iw_state;
  assign io_exe_reqs_2_bits_uop_is_br = exe_reg_uops_2_is_br;
  assign io_exe_reqs_2_bits_uop_is_jalr = exe_reg_uops_2_is_jalr;
  assign io_exe_reqs_2_bits_uop_is_jal = exe_reg_uops_2_is_jal;
  assign io_exe_reqs_2_bits_uop_is_sfb = exe_reg_uops_2_is_sfb;
  assign io_exe_reqs_2_bits_uop_br_mask = exe_reg_uops_2_br_mask;
  assign io_exe_reqs_2_bits_uop_br_tag = exe_reg_uops_2_br_tag;
  assign io_exe_reqs_2_bits_uop_ftq_idx = exe_reg_uops_2_ftq_idx;
  assign io_exe_reqs_2_bits_uop_edge_inst = exe_reg_uops_2_edge_inst;
  assign io_exe_reqs_2_bits_uop_pc_lob = exe_reg_uops_2_pc_lob;
  assign io_exe_reqs_2_bits_uop_taken = exe_reg_uops_2_taken;
  assign io_exe_reqs_2_bits_uop_imm_packed = exe_reg_uops_2_imm_packed;
  assign io_exe_reqs_2_bits_uop_csr_addr = exe_reg_uops_2_csr_addr;
  assign io_exe_reqs_2_bits_uop_rob_idx = exe_reg_uops_2_rob_idx;
  assign io_exe_reqs_2_bits_uop_ldq_idx = exe_reg_uops_2_ldq_idx;
  assign io_exe_reqs_2_bits_uop_stq_idx = exe_reg_uops_2_stq_idx;
  assign io_exe_reqs_2_bits_uop_rxq_idx = exe_reg_uops_2_rxq_idx;
  assign io_exe_reqs_2_bits_uop_pdst = exe_reg_uops_2_pdst;
  assign io_exe_reqs_2_bits_uop_prs1 = exe_reg_uops_2_prs1;
  assign io_exe_reqs_2_bits_uop_prs2 = exe_reg_uops_2_prs2;
  assign io_exe_reqs_2_bits_uop_prs3 = exe_reg_uops_2_prs3;
  assign io_exe_reqs_2_bits_uop_ppred = exe_reg_uops_2_ppred;
  assign io_exe_reqs_2_bits_uop_prs1_busy = exe_reg_uops_2_prs1_busy;
  assign io_exe_reqs_2_bits_uop_prs2_busy = exe_reg_uops_2_prs2_busy;
  assign io_exe_reqs_2_bits_uop_prs3_busy = exe_reg_uops_2_prs3_busy;
  assign io_exe_reqs_2_bits_uop_ppred_busy = exe_reg_uops_2_ppred_busy;
  assign io_exe_reqs_2_bits_uop_stale_pdst = exe_reg_uops_2_stale_pdst;
  assign io_exe_reqs_2_bits_uop_exception = exe_reg_uops_2_exception;
  assign io_exe_reqs_2_bits_uop_exc_cause = exe_reg_uops_2_exc_cause;
  assign io_exe_reqs_2_bits_uop_bypassable = exe_reg_uops_2_bypassable;
  assign io_exe_reqs_2_bits_uop_mem_cmd = exe_reg_uops_2_mem_cmd;
  assign io_exe_reqs_2_bits_uop_mem_size = exe_reg_uops_2_mem_size;
  assign io_exe_reqs_2_bits_uop_mem_signed = exe_reg_uops_2_mem_signed;
  assign io_exe_reqs_2_bits_uop_is_fence = exe_reg_uops_2_is_fence;
  assign io_exe_reqs_2_bits_uop_is_fencei = exe_reg_uops_2_is_fencei;
  assign io_exe_reqs_2_bits_uop_is_amo = exe_reg_uops_2_is_amo;
  assign io_exe_reqs_2_bits_uop_uses_ldq = exe_reg_uops_2_uses_ldq;
  assign io_exe_reqs_2_bits_uop_uses_stq = exe_reg_uops_2_uses_stq;
  assign io_exe_reqs_2_bits_uop_is_sys_pc2epc = exe_reg_uops_2_is_sys_pc2epc;
  assign io_exe_reqs_2_bits_uop_is_unique = exe_reg_uops_2_is_unique;
  assign io_exe_reqs_2_bits_uop_flush_on_commit = exe_reg_uops_2_flush_on_commit;
  assign io_exe_reqs_2_bits_uop_ldst_is_rs1 = exe_reg_uops_2_ldst_is_rs1;
  assign io_exe_reqs_2_bits_uop_ldst = exe_reg_uops_2_ldst;
  assign io_exe_reqs_2_bits_uop_lrs1 = exe_reg_uops_2_lrs1;
  assign io_exe_reqs_2_bits_uop_lrs2 = exe_reg_uops_2_lrs2;
  assign io_exe_reqs_2_bits_uop_lrs3 = exe_reg_uops_2_lrs3;
  assign io_exe_reqs_2_bits_uop_ldst_val = exe_reg_uops_2_ldst_val;
  assign io_exe_reqs_2_bits_uop_dst_rtype = exe_reg_uops_2_dst_rtype;
  assign io_exe_reqs_2_bits_uop_lrs1_rtype = exe_reg_uops_2_lrs1_rtype;
  assign io_exe_reqs_2_bits_uop_lrs2_rtype = exe_reg_uops_2_lrs2_rtype;
  assign io_exe_reqs_2_bits_uop_frs3_en = exe_reg_uops_2_frs3_en;
  assign io_exe_reqs_2_bits_uop_fp_val = exe_reg_uops_2_fp_val;
  assign io_exe_reqs_2_bits_uop_fp_single = exe_reg_uops_2_fp_single;
  assign io_exe_reqs_2_bits_uop_xcpt_pf_if = exe_reg_uops_2_xcpt_pf_if;
  assign io_exe_reqs_2_bits_uop_xcpt_ae_if = exe_reg_uops_2_xcpt_ae_if;
  assign io_exe_reqs_2_bits_uop_xcpt_ma_if = exe_reg_uops_2_xcpt_ma_if;
  assign io_exe_reqs_2_bits_uop_bp_debug_if = exe_reg_uops_2_bp_debug_if;
  assign io_exe_reqs_2_bits_uop_bp_xcpt_if = exe_reg_uops_2_bp_xcpt_if;
  assign io_exe_reqs_2_bits_uop_debug_fsrc = exe_reg_uops_2_debug_fsrc;
  assign io_exe_reqs_2_bits_uop_debug_tsrc = exe_reg_uops_2_debug_tsrc;
  assign io_exe_reqs_2_bits_rs1_data = exe_reg_rs1_data_2;
  assign io_exe_reqs_2_bits_rs2_data = exe_reg_rs2_data_2;
  assign io_exe_reqs_3_valid = exe_reg_valids_3;
  assign io_exe_reqs_3_bits_uop_uopc = exe_reg_uops_3_uopc;
  assign io_exe_reqs_3_bits_uop_is_rvc = exe_reg_uops_3_is_rvc;
  assign io_exe_reqs_3_bits_uop_fu_code = exe_reg_uops_3_fu_code;
  assign io_exe_reqs_3_bits_uop_ctrl_br_type = exe_reg_uops_3_ctrl_br_type;
  assign io_exe_reqs_3_bits_uop_ctrl_op1_sel = exe_reg_uops_3_ctrl_op1_sel;
  assign io_exe_reqs_3_bits_uop_ctrl_op2_sel = exe_reg_uops_3_ctrl_op2_sel;
  assign io_exe_reqs_3_bits_uop_ctrl_imm_sel = exe_reg_uops_3_ctrl_imm_sel;
  assign io_exe_reqs_3_bits_uop_ctrl_op_fcn = exe_reg_uops_3_ctrl_op_fcn;
  assign io_exe_reqs_3_bits_uop_ctrl_fcn_dw = exe_reg_uops_3_ctrl_fcn_dw;
  assign io_exe_reqs_3_bits_uop_ctrl_csr_cmd = exe_reg_uops_3_ctrl_csr_cmd;
  assign io_exe_reqs_3_bits_uop_is_br = exe_reg_uops_3_is_br;
  assign io_exe_reqs_3_bits_uop_is_jalr = exe_reg_uops_3_is_jalr;
  assign io_exe_reqs_3_bits_uop_is_jal = exe_reg_uops_3_is_jal;
  assign io_exe_reqs_3_bits_uop_is_sfb = exe_reg_uops_3_is_sfb;
  assign io_exe_reqs_3_bits_uop_br_mask = exe_reg_uops_3_br_mask;
  assign io_exe_reqs_3_bits_uop_br_tag = exe_reg_uops_3_br_tag;
  assign io_exe_reqs_3_bits_uop_ftq_idx = exe_reg_uops_3_ftq_idx;
  assign io_exe_reqs_3_bits_uop_edge_inst = exe_reg_uops_3_edge_inst;
  assign io_exe_reqs_3_bits_uop_pc_lob = exe_reg_uops_3_pc_lob;
  assign io_exe_reqs_3_bits_uop_taken = exe_reg_uops_3_taken;
  assign io_exe_reqs_3_bits_uop_imm_packed = exe_reg_uops_3_imm_packed;
  assign io_exe_reqs_3_bits_uop_rob_idx = exe_reg_uops_3_rob_idx;
  assign io_exe_reqs_3_bits_uop_ldq_idx = exe_reg_uops_3_ldq_idx;
  assign io_exe_reqs_3_bits_uop_stq_idx = exe_reg_uops_3_stq_idx;
  assign io_exe_reqs_3_bits_uop_pdst = exe_reg_uops_3_pdst;
  assign io_exe_reqs_3_bits_uop_prs1 = exe_reg_uops_3_prs1;
  assign io_exe_reqs_3_bits_uop_bypassable = exe_reg_uops_3_bypassable;
  assign io_exe_reqs_3_bits_uop_is_amo = exe_reg_uops_3_is_amo;
  assign io_exe_reqs_3_bits_uop_uses_stq = exe_reg_uops_3_uses_stq;
  assign io_exe_reqs_3_bits_uop_dst_rtype = exe_reg_uops_3_dst_rtype;
  assign io_exe_reqs_3_bits_rs1_data = exe_reg_rs1_data_3;
  assign io_exe_reqs_3_bits_rs2_data = exe_reg_rs2_data_3;
  assign io_exe_reqs_4_valid = exe_reg_valids_4;
  assign io_exe_reqs_4_bits_uop_uopc = exe_reg_uops_4_uopc;
  assign io_exe_reqs_4_bits_uop_is_rvc = exe_reg_uops_4_is_rvc;
  assign io_exe_reqs_4_bits_uop_fu_code = exe_reg_uops_4_fu_code;
  assign io_exe_reqs_4_bits_uop_ctrl_br_type = exe_reg_uops_4_ctrl_br_type;
  assign io_exe_reqs_4_bits_uop_ctrl_op1_sel = exe_reg_uops_4_ctrl_op1_sel;
  assign io_exe_reqs_4_bits_uop_ctrl_op2_sel = exe_reg_uops_4_ctrl_op2_sel;
  assign io_exe_reqs_4_bits_uop_ctrl_imm_sel = exe_reg_uops_4_ctrl_imm_sel;
  assign io_exe_reqs_4_bits_uop_ctrl_op_fcn = exe_reg_uops_4_ctrl_op_fcn;
  assign io_exe_reqs_4_bits_uop_ctrl_fcn_dw = exe_reg_uops_4_ctrl_fcn_dw;
  assign io_exe_reqs_4_bits_uop_is_br = exe_reg_uops_4_is_br;
  assign io_exe_reqs_4_bits_uop_is_jalr = exe_reg_uops_4_is_jalr;
  assign io_exe_reqs_4_bits_uop_is_jal = exe_reg_uops_4_is_jal;
  assign io_exe_reqs_4_bits_uop_is_sfb = exe_reg_uops_4_is_sfb;
  assign io_exe_reqs_4_bits_uop_br_mask = exe_reg_uops_4_br_mask;
  assign io_exe_reqs_4_bits_uop_br_tag = exe_reg_uops_4_br_tag;
  assign io_exe_reqs_4_bits_uop_ftq_idx = exe_reg_uops_4_ftq_idx;
  assign io_exe_reqs_4_bits_uop_edge_inst = exe_reg_uops_4_edge_inst;
  assign io_exe_reqs_4_bits_uop_pc_lob = exe_reg_uops_4_pc_lob;
  assign io_exe_reqs_4_bits_uop_taken = exe_reg_uops_4_taken;
  assign io_exe_reqs_4_bits_uop_imm_packed = exe_reg_uops_4_imm_packed;
  assign io_exe_reqs_4_bits_uop_rob_idx = exe_reg_uops_4_rob_idx;
  assign io_exe_reqs_4_bits_uop_ldq_idx = exe_reg_uops_4_ldq_idx;
  assign io_exe_reqs_4_bits_uop_stq_idx = exe_reg_uops_4_stq_idx;
  assign io_exe_reqs_4_bits_uop_pdst = exe_reg_uops_4_pdst;
  assign io_exe_reqs_4_bits_uop_prs1 = exe_reg_uops_4_prs1;
  assign io_exe_reqs_4_bits_uop_bypassable = exe_reg_uops_4_bypassable;
  assign io_exe_reqs_4_bits_uop_is_amo = exe_reg_uops_4_is_amo;
  assign io_exe_reqs_4_bits_uop_uses_stq = exe_reg_uops_4_uses_stq;
  assign io_exe_reqs_4_bits_uop_dst_rtype = exe_reg_uops_4_dst_rtype;
  assign io_exe_reqs_4_bits_rs1_data = exe_reg_rs1_data_4;
  assign io_exe_reqs_4_bits_rs2_data = exe_reg_rs2_data_4;
  assign io_exe_reqs_5_valid = exe_reg_valids_5;
  assign io_exe_reqs_5_bits_uop_uopc = exe_reg_uops_5_uopc;
  assign io_exe_reqs_5_bits_uop_is_rvc = exe_reg_uops_5_is_rvc;
  assign io_exe_reqs_5_bits_uop_fu_code = exe_reg_uops_5_fu_code;
  assign io_exe_reqs_5_bits_uop_ctrl_br_type = exe_reg_uops_5_ctrl_br_type;
  assign io_exe_reqs_5_bits_uop_ctrl_op1_sel = exe_reg_uops_5_ctrl_op1_sel;
  assign io_exe_reqs_5_bits_uop_ctrl_op2_sel = exe_reg_uops_5_ctrl_op2_sel;
  assign io_exe_reqs_5_bits_uop_ctrl_imm_sel = exe_reg_uops_5_ctrl_imm_sel;
  assign io_exe_reqs_5_bits_uop_ctrl_op_fcn = exe_reg_uops_5_ctrl_op_fcn;
  assign io_exe_reqs_5_bits_uop_ctrl_fcn_dw = exe_reg_uops_5_ctrl_fcn_dw;
  assign io_exe_reqs_5_bits_uop_ctrl_csr_cmd = exe_reg_uops_5_ctrl_csr_cmd;
  assign io_exe_reqs_5_bits_uop_is_br = exe_reg_uops_5_is_br;
  assign io_exe_reqs_5_bits_uop_is_jalr = exe_reg_uops_5_is_jalr;
  assign io_exe_reqs_5_bits_uop_is_jal = exe_reg_uops_5_is_jal;
  assign io_exe_reqs_5_bits_uop_is_sfb = exe_reg_uops_5_is_sfb;
  assign io_exe_reqs_5_bits_uop_br_mask = exe_reg_uops_5_br_mask;
  assign io_exe_reqs_5_bits_uop_br_tag = exe_reg_uops_5_br_tag;
  assign io_exe_reqs_5_bits_uop_ftq_idx = exe_reg_uops_5_ftq_idx;
  assign io_exe_reqs_5_bits_uop_edge_inst = exe_reg_uops_5_edge_inst;
  assign io_exe_reqs_5_bits_uop_pc_lob = exe_reg_uops_5_pc_lob;
  assign io_exe_reqs_5_bits_uop_taken = exe_reg_uops_5_taken;
  assign io_exe_reqs_5_bits_uop_imm_packed = exe_reg_uops_5_imm_packed;
  assign io_exe_reqs_5_bits_uop_rob_idx = exe_reg_uops_5_rob_idx;
  assign io_exe_reqs_5_bits_uop_ldq_idx = exe_reg_uops_5_ldq_idx;
  assign io_exe_reqs_5_bits_uop_stq_idx = exe_reg_uops_5_stq_idx;
  assign io_exe_reqs_5_bits_uop_pdst = exe_reg_uops_5_pdst;
  assign io_exe_reqs_5_bits_uop_prs1 = exe_reg_uops_5_prs1;
  assign io_exe_reqs_5_bits_uop_bypassable = exe_reg_uops_5_bypassable;
  assign io_exe_reqs_5_bits_uop_is_amo = exe_reg_uops_5_is_amo;
  assign io_exe_reqs_5_bits_uop_uses_stq = exe_reg_uops_5_uses_stq;
  assign io_exe_reqs_5_bits_uop_dst_rtype = exe_reg_uops_5_dst_rtype;
  assign io_exe_reqs_5_bits_rs1_data = exe_reg_rs1_data_5;
  assign io_exe_reqs_5_bits_rs2_data = exe_reg_rs2_data_5;
endmodule

