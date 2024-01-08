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

module FpPipeline(
  input         clock,
                reset,
  input  [19:0] io_brupdate_b1_resolve_mask,
                io_brupdate_b1_mispredict_mask,
  input         io_flush_pipeline,
  input  [2:0]  io_fcsr_rm,
  output        io_dis_uops_0_ready,
  input         io_dis_uops_0_valid,
  input  [6:0]  io_dis_uops_0_bits_uopc,
  input  [31:0] io_dis_uops_0_bits_inst,
                io_dis_uops_0_bits_debug_inst,
  input         io_dis_uops_0_bits_is_rvc,
  input  [39:0] io_dis_uops_0_bits_debug_pc,
  input  [2:0]  io_dis_uops_0_bits_iq_type,
  input  [9:0]  io_dis_uops_0_bits_fu_code,
  input         io_dis_uops_0_bits_is_br,
                io_dis_uops_0_bits_is_jalr,
                io_dis_uops_0_bits_is_jal,
                io_dis_uops_0_bits_is_sfb,
  input  [19:0] io_dis_uops_0_bits_br_mask,
  input  [4:0]  io_dis_uops_0_bits_br_tag,
  input  [5:0]  io_dis_uops_0_bits_ftq_idx,
  input         io_dis_uops_0_bits_edge_inst,
  input  [5:0]  io_dis_uops_0_bits_pc_lob,
  input         io_dis_uops_0_bits_taken,
  input  [19:0] io_dis_uops_0_bits_imm_packed,
  input  [11:0] io_dis_uops_0_bits_csr_addr,
  input  [6:0]  io_dis_uops_0_bits_rob_idx,
  input  [4:0]  io_dis_uops_0_bits_ldq_idx,
                io_dis_uops_0_bits_stq_idx,
  input  [1:0]  io_dis_uops_0_bits_rxq_idx,
  input  [6:0]  io_dis_uops_0_bits_pdst,
                io_dis_uops_0_bits_prs1,
                io_dis_uops_0_bits_prs2,
                io_dis_uops_0_bits_prs3,
  input         io_dis_uops_0_bits_prs1_busy,
                io_dis_uops_0_bits_prs2_busy,
                io_dis_uops_0_bits_prs3_busy,
  input  [6:0]  io_dis_uops_0_bits_stale_pdst,
  input         io_dis_uops_0_bits_exception,
  input  [63:0] io_dis_uops_0_bits_exc_cause,
  input         io_dis_uops_0_bits_bypassable,
  input  [4:0]  io_dis_uops_0_bits_mem_cmd,
  input  [1:0]  io_dis_uops_0_bits_mem_size,
  input         io_dis_uops_0_bits_mem_signed,
                io_dis_uops_0_bits_is_fence,
                io_dis_uops_0_bits_is_fencei,
                io_dis_uops_0_bits_is_amo,
                io_dis_uops_0_bits_uses_ldq,
                io_dis_uops_0_bits_uses_stq,
                io_dis_uops_0_bits_is_sys_pc2epc,
                io_dis_uops_0_bits_is_unique,
                io_dis_uops_0_bits_flush_on_commit,
                io_dis_uops_0_bits_ldst_is_rs1,
  input  [5:0]  io_dis_uops_0_bits_ldst,
                io_dis_uops_0_bits_lrs1,
                io_dis_uops_0_bits_lrs2,
                io_dis_uops_0_bits_lrs3,
  input         io_dis_uops_0_bits_ldst_val,
  input  [1:0]  io_dis_uops_0_bits_dst_rtype,
                io_dis_uops_0_bits_lrs1_rtype,
                io_dis_uops_0_bits_lrs2_rtype,
  input         io_dis_uops_0_bits_frs3_en,
                io_dis_uops_0_bits_fp_val,
                io_dis_uops_0_bits_fp_single,
                io_dis_uops_0_bits_xcpt_pf_if,
                io_dis_uops_0_bits_xcpt_ae_if,
                io_dis_uops_0_bits_xcpt_ma_if,
                io_dis_uops_0_bits_bp_debug_if,
                io_dis_uops_0_bits_bp_xcpt_if,
  input  [1:0]  io_dis_uops_0_bits_debug_fsrc,
                io_dis_uops_0_bits_debug_tsrc,
  output        io_dis_uops_1_ready,
  input         io_dis_uops_1_valid,
  input  [6:0]  io_dis_uops_1_bits_uopc,
  input  [31:0] io_dis_uops_1_bits_inst,
                io_dis_uops_1_bits_debug_inst,
  input         io_dis_uops_1_bits_is_rvc,
  input  [39:0] io_dis_uops_1_bits_debug_pc,
  input  [2:0]  io_dis_uops_1_bits_iq_type,
  input  [9:0]  io_dis_uops_1_bits_fu_code,
  input         io_dis_uops_1_bits_is_br,
                io_dis_uops_1_bits_is_jalr,
                io_dis_uops_1_bits_is_jal,
                io_dis_uops_1_bits_is_sfb,
  input  [19:0] io_dis_uops_1_bits_br_mask,
  input  [4:0]  io_dis_uops_1_bits_br_tag,
  input  [5:0]  io_dis_uops_1_bits_ftq_idx,
  input         io_dis_uops_1_bits_edge_inst,
  input  [5:0]  io_dis_uops_1_bits_pc_lob,
  input         io_dis_uops_1_bits_taken,
  input  [19:0] io_dis_uops_1_bits_imm_packed,
  input  [11:0] io_dis_uops_1_bits_csr_addr,
  input  [6:0]  io_dis_uops_1_bits_rob_idx,
  input  [4:0]  io_dis_uops_1_bits_ldq_idx,
                io_dis_uops_1_bits_stq_idx,
  input  [1:0]  io_dis_uops_1_bits_rxq_idx,
  input  [6:0]  io_dis_uops_1_bits_pdst,
                io_dis_uops_1_bits_prs1,
                io_dis_uops_1_bits_prs2,
                io_dis_uops_1_bits_prs3,
  input         io_dis_uops_1_bits_prs1_busy,
                io_dis_uops_1_bits_prs2_busy,
                io_dis_uops_1_bits_prs3_busy,
  input  [6:0]  io_dis_uops_1_bits_stale_pdst,
  input         io_dis_uops_1_bits_exception,
  input  [63:0] io_dis_uops_1_bits_exc_cause,
  input         io_dis_uops_1_bits_bypassable,
  input  [4:0]  io_dis_uops_1_bits_mem_cmd,
  input  [1:0]  io_dis_uops_1_bits_mem_size,
  input         io_dis_uops_1_bits_mem_signed,
                io_dis_uops_1_bits_is_fence,
                io_dis_uops_1_bits_is_fencei,
                io_dis_uops_1_bits_is_amo,
                io_dis_uops_1_bits_uses_ldq,
                io_dis_uops_1_bits_uses_stq,
                io_dis_uops_1_bits_is_sys_pc2epc,
                io_dis_uops_1_bits_is_unique,
                io_dis_uops_1_bits_flush_on_commit,
                io_dis_uops_1_bits_ldst_is_rs1,
  input  [5:0]  io_dis_uops_1_bits_ldst,
                io_dis_uops_1_bits_lrs1,
                io_dis_uops_1_bits_lrs2,
                io_dis_uops_1_bits_lrs3,
  input         io_dis_uops_1_bits_ldst_val,
  input  [1:0]  io_dis_uops_1_bits_dst_rtype,
                io_dis_uops_1_bits_lrs1_rtype,
                io_dis_uops_1_bits_lrs2_rtype,
  input         io_dis_uops_1_bits_frs3_en,
                io_dis_uops_1_bits_fp_val,
                io_dis_uops_1_bits_fp_single,
                io_dis_uops_1_bits_xcpt_pf_if,
                io_dis_uops_1_bits_xcpt_ae_if,
                io_dis_uops_1_bits_xcpt_ma_if,
                io_dis_uops_1_bits_bp_debug_if,
                io_dis_uops_1_bits_bp_xcpt_if,
  input  [1:0]  io_dis_uops_1_bits_debug_fsrc,
                io_dis_uops_1_bits_debug_tsrc,
  output        io_dis_uops_2_ready,
  input         io_dis_uops_2_valid,
  input  [6:0]  io_dis_uops_2_bits_uopc,
  input  [31:0] io_dis_uops_2_bits_inst,
                io_dis_uops_2_bits_debug_inst,
  input         io_dis_uops_2_bits_is_rvc,
  input  [39:0] io_dis_uops_2_bits_debug_pc,
  input  [2:0]  io_dis_uops_2_bits_iq_type,
  input  [9:0]  io_dis_uops_2_bits_fu_code,
  input         io_dis_uops_2_bits_is_br,
                io_dis_uops_2_bits_is_jalr,
                io_dis_uops_2_bits_is_jal,
                io_dis_uops_2_bits_is_sfb,
  input  [19:0] io_dis_uops_2_bits_br_mask,
  input  [4:0]  io_dis_uops_2_bits_br_tag,
  input  [5:0]  io_dis_uops_2_bits_ftq_idx,
  input         io_dis_uops_2_bits_edge_inst,
  input  [5:0]  io_dis_uops_2_bits_pc_lob,
  input         io_dis_uops_2_bits_taken,
  input  [19:0] io_dis_uops_2_bits_imm_packed,
  input  [11:0] io_dis_uops_2_bits_csr_addr,
  input  [6:0]  io_dis_uops_2_bits_rob_idx,
  input  [4:0]  io_dis_uops_2_bits_ldq_idx,
                io_dis_uops_2_bits_stq_idx,
  input  [1:0]  io_dis_uops_2_bits_rxq_idx,
  input  [6:0]  io_dis_uops_2_bits_pdst,
                io_dis_uops_2_bits_prs1,
                io_dis_uops_2_bits_prs2,
                io_dis_uops_2_bits_prs3,
  input         io_dis_uops_2_bits_prs1_busy,
                io_dis_uops_2_bits_prs2_busy,
                io_dis_uops_2_bits_prs3_busy,
  input  [6:0]  io_dis_uops_2_bits_stale_pdst,
  input         io_dis_uops_2_bits_exception,
  input  [63:0] io_dis_uops_2_bits_exc_cause,
  input         io_dis_uops_2_bits_bypassable,
  input  [4:0]  io_dis_uops_2_bits_mem_cmd,
  input  [1:0]  io_dis_uops_2_bits_mem_size,
  input         io_dis_uops_2_bits_mem_signed,
                io_dis_uops_2_bits_is_fence,
                io_dis_uops_2_bits_is_fencei,
                io_dis_uops_2_bits_is_amo,
                io_dis_uops_2_bits_uses_ldq,
                io_dis_uops_2_bits_uses_stq,
                io_dis_uops_2_bits_is_sys_pc2epc,
                io_dis_uops_2_bits_is_unique,
                io_dis_uops_2_bits_flush_on_commit,
                io_dis_uops_2_bits_ldst_is_rs1,
  input  [5:0]  io_dis_uops_2_bits_ldst,
                io_dis_uops_2_bits_lrs1,
                io_dis_uops_2_bits_lrs2,
                io_dis_uops_2_bits_lrs3,
  input         io_dis_uops_2_bits_ldst_val,
  input  [1:0]  io_dis_uops_2_bits_dst_rtype,
                io_dis_uops_2_bits_lrs1_rtype,
                io_dis_uops_2_bits_lrs2_rtype,
  input         io_dis_uops_2_bits_frs3_en,
                io_dis_uops_2_bits_fp_val,
                io_dis_uops_2_bits_fp_single,
                io_dis_uops_2_bits_xcpt_pf_if,
                io_dis_uops_2_bits_xcpt_ae_if,
                io_dis_uops_2_bits_xcpt_ma_if,
                io_dis_uops_2_bits_bp_debug_if,
                io_dis_uops_2_bits_bp_xcpt_if,
  input  [1:0]  io_dis_uops_2_bits_debug_fsrc,
                io_dis_uops_2_bits_debug_tsrc,
  output        io_dis_uops_3_ready,
  input         io_dis_uops_3_valid,
  input  [6:0]  io_dis_uops_3_bits_uopc,
  input  [31:0] io_dis_uops_3_bits_inst,
                io_dis_uops_3_bits_debug_inst,
  input         io_dis_uops_3_bits_is_rvc,
  input  [39:0] io_dis_uops_3_bits_debug_pc,
  input  [2:0]  io_dis_uops_3_bits_iq_type,
  input  [9:0]  io_dis_uops_3_bits_fu_code,
  input         io_dis_uops_3_bits_is_br,
                io_dis_uops_3_bits_is_jalr,
                io_dis_uops_3_bits_is_jal,
                io_dis_uops_3_bits_is_sfb,
  input  [19:0] io_dis_uops_3_bits_br_mask,
  input  [4:0]  io_dis_uops_3_bits_br_tag,
  input  [5:0]  io_dis_uops_3_bits_ftq_idx,
  input         io_dis_uops_3_bits_edge_inst,
  input  [5:0]  io_dis_uops_3_bits_pc_lob,
  input         io_dis_uops_3_bits_taken,
  input  [19:0] io_dis_uops_3_bits_imm_packed,
  input  [11:0] io_dis_uops_3_bits_csr_addr,
  input  [6:0]  io_dis_uops_3_bits_rob_idx,
  input  [4:0]  io_dis_uops_3_bits_ldq_idx,
                io_dis_uops_3_bits_stq_idx,
  input  [1:0]  io_dis_uops_3_bits_rxq_idx,
  input  [6:0]  io_dis_uops_3_bits_pdst,
                io_dis_uops_3_bits_prs1,
                io_dis_uops_3_bits_prs2,
                io_dis_uops_3_bits_prs3,
  input         io_dis_uops_3_bits_prs1_busy,
                io_dis_uops_3_bits_prs2_busy,
                io_dis_uops_3_bits_prs3_busy,
  input  [6:0]  io_dis_uops_3_bits_stale_pdst,
  input         io_dis_uops_3_bits_exception,
  input  [63:0] io_dis_uops_3_bits_exc_cause,
  input         io_dis_uops_3_bits_bypassable,
  input  [4:0]  io_dis_uops_3_bits_mem_cmd,
  input  [1:0]  io_dis_uops_3_bits_mem_size,
  input         io_dis_uops_3_bits_mem_signed,
                io_dis_uops_3_bits_is_fence,
                io_dis_uops_3_bits_is_fencei,
                io_dis_uops_3_bits_is_amo,
                io_dis_uops_3_bits_uses_ldq,
                io_dis_uops_3_bits_uses_stq,
                io_dis_uops_3_bits_is_sys_pc2epc,
                io_dis_uops_3_bits_is_unique,
                io_dis_uops_3_bits_flush_on_commit,
                io_dis_uops_3_bits_ldst_is_rs1,
  input  [5:0]  io_dis_uops_3_bits_ldst,
                io_dis_uops_3_bits_lrs1,
                io_dis_uops_3_bits_lrs2,
                io_dis_uops_3_bits_lrs3,
  input         io_dis_uops_3_bits_ldst_val,
  input  [1:0]  io_dis_uops_3_bits_dst_rtype,
                io_dis_uops_3_bits_lrs1_rtype,
                io_dis_uops_3_bits_lrs2_rtype,
  input         io_dis_uops_3_bits_frs3_en,
                io_dis_uops_3_bits_fp_val,
                io_dis_uops_3_bits_fp_single,
                io_dis_uops_3_bits_xcpt_pf_if,
                io_dis_uops_3_bits_xcpt_ae_if,
                io_dis_uops_3_bits_xcpt_ma_if,
                io_dis_uops_3_bits_bp_debug_if,
                io_dis_uops_3_bits_bp_xcpt_if,
  input  [1:0]  io_dis_uops_3_bits_debug_fsrc,
                io_dis_uops_3_bits_debug_tsrc,
  input         io_ll_wports_0_valid,
  input  [6:0]  io_ll_wports_0_bits_uop_uopc,
  input  [19:0] io_ll_wports_0_bits_uop_br_mask,
  input  [6:0]  io_ll_wports_0_bits_uop_rob_idx,
  input  [4:0]  io_ll_wports_0_bits_uop_stq_idx,
  input  [6:0]  io_ll_wports_0_bits_uop_pdst,
  input  [1:0]  io_ll_wports_0_bits_uop_mem_size,
  input         io_ll_wports_0_bits_uop_is_amo,
                io_ll_wports_0_bits_uop_uses_stq,
  input  [1:0]  io_ll_wports_0_bits_uop_dst_rtype,
  input         io_ll_wports_0_bits_uop_fp_val,
  input  [64:0] io_ll_wports_0_bits_data,
  input         io_ll_wports_1_valid,
  input  [6:0]  io_ll_wports_1_bits_uop_rob_idx,
                io_ll_wports_1_bits_uop_pdst,
  input  [1:0]  io_ll_wports_1_bits_uop_mem_size,
                io_ll_wports_1_bits_uop_dst_rtype,
  input         io_ll_wports_1_bits_uop_fp_val,
  input  [64:0] io_ll_wports_1_bits_data,
  output        io_from_int_ready,
  input         io_from_int_valid,
  input  [6:0]  io_from_int_bits_uop_uopc,
  input  [19:0] io_from_int_bits_uop_br_mask,
  input  [6:0]  io_from_int_bits_uop_rob_idx,
  input  [4:0]  io_from_int_bits_uop_stq_idx,
  input  [6:0]  io_from_int_bits_uop_pdst,
  input         io_from_int_bits_uop_is_amo,
                io_from_int_bits_uop_uses_stq,
  input  [1:0]  io_from_int_bits_uop_dst_rtype,
  input         io_from_int_bits_uop_fp_val,
  input  [64:0] io_from_int_bits_data,
  input         io_from_int_bits_predicated,
                io_from_int_bits_fflags_valid,
  input  [6:0]  io_from_int_bits_fflags_bits_uop_rob_idx,
  input  [4:0]  io_from_int_bits_fflags_bits_flags,
  input         io_to_sdq_ready,
  output        io_to_sdq_valid,
  output [19:0] io_to_sdq_bits_uop_br_mask,
  output [6:0]  io_to_sdq_bits_uop_rob_idx,
  output [4:0]  io_to_sdq_bits_uop_stq_idx,
  output [63:0] io_to_sdq_bits_data,
  input         io_to_int_ready,
  output        io_to_int_valid,
  output [6:0]  io_to_int_bits_uop_rob_idx,
                io_to_int_bits_uop_pdst,
  output        io_to_int_bits_uop_is_amo,
                io_to_int_bits_uop_uses_stq,
  output [1:0]  io_to_int_bits_uop_dst_rtype,
  output [63:0] io_to_int_bits_data,
  output        io_to_int_bits_predicated,
                io_wakeups_0_valid,
  output [6:0]  io_wakeups_0_bits_uop_rob_idx,
                io_wakeups_0_bits_uop_pdst,
  output [1:0]  io_wakeups_0_bits_uop_dst_rtype,
  output        io_wakeups_0_bits_uop_fp_val,
                io_wakeups_0_bits_predicated,
                io_wakeups_0_bits_fflags_valid,
  output [6:0]  io_wakeups_0_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_wakeups_0_bits_fflags_bits_flags,
  output        io_wakeups_1_valid,
  output [6:0]  io_wakeups_1_bits_uop_rob_idx,
                io_wakeups_1_bits_uop_pdst,
  output [1:0]  io_wakeups_1_bits_uop_dst_rtype,
  output        io_wakeups_1_bits_uop_fp_val,
                io_wakeups_2_valid,
  output [6:0]  io_wakeups_2_bits_uop_rob_idx,
                io_wakeups_2_bits_uop_pdst,
  output [1:0]  io_wakeups_2_bits_uop_dst_rtype,
  output        io_wakeups_2_bits_uop_fp_val,
                io_wakeups_2_bits_fflags_valid,
  output [6:0]  io_wakeups_2_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_wakeups_2_bits_fflags_bits_flags,
  output        io_wakeups_3_valid,
  output [6:0]  io_wakeups_3_bits_uop_rob_idx,
                io_wakeups_3_bits_uop_pdst,
  output [1:0]  io_wakeups_3_bits_uop_dst_rtype,
  output        io_wakeups_3_bits_uop_fp_val,
                io_wakeups_3_bits_fflags_valid,
  output [6:0]  io_wakeups_3_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_wakeups_3_bits_fflags_bits_flags
);

  wire         _fpu_exe_unit_io_ll_iresp_ready_T;
  wire         _ll_wbarb_io_in_0_ready;
  wire         _ll_wbarb_io_out_valid;
  wire [6:0]   _ll_wbarb_io_out_bits_uop_pdst;
  wire [1:0]   _ll_wbarb_io_out_bits_uop_dst_rtype;
  wire [64:0]  _ll_wbarb_io_out_bits_data;
  wire [6:0]   _fregister_read_io_rf_read_ports_0_addr;
  wire [6:0]   _fregister_read_io_rf_read_ports_1_addr;
  wire [6:0]   _fregister_read_io_rf_read_ports_2_addr;
  wire [6:0]   _fregister_read_io_rf_read_ports_3_addr;
  wire [6:0]   _fregister_read_io_rf_read_ports_4_addr;
  wire [6:0]   _fregister_read_io_rf_read_ports_5_addr;
  wire         _fregister_read_io_exe_reqs_0_valid;
  wire [6:0]   _fregister_read_io_exe_reqs_0_bits_uop_uopc;
  wire [31:0]  _fregister_read_io_exe_reqs_0_bits_uop_inst;
  wire [31:0]  _fregister_read_io_exe_reqs_0_bits_uop_debug_inst;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_is_rvc;
  wire [39:0]  _fregister_read_io_exe_reqs_0_bits_uop_debug_pc;
  wire [2:0]   _fregister_read_io_exe_reqs_0_bits_uop_iq_type;
  wire [9:0]   _fregister_read_io_exe_reqs_0_bits_uop_fu_code;
  wire [3:0]   _fregister_read_io_exe_reqs_0_bits_uop_ctrl_br_type;
  wire [1:0]   _fregister_read_io_exe_reqs_0_bits_uop_ctrl_op1_sel;
  wire [2:0]   _fregister_read_io_exe_reqs_0_bits_uop_ctrl_op2_sel;
  wire [2:0]   _fregister_read_io_exe_reqs_0_bits_uop_ctrl_imm_sel;
  wire [3:0]   _fregister_read_io_exe_reqs_0_bits_uop_ctrl_op_fcn;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _fregister_read_io_exe_reqs_0_bits_uop_ctrl_csr_cmd;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_load;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_sta;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_std;
  wire [1:0]   _fregister_read_io_exe_reqs_0_bits_uop_iw_state;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_iw_p1_poisoned;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_iw_p2_poisoned;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_is_br;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_is_jalr;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_is_jal;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_is_sfb;
  wire [19:0]  _fregister_read_io_exe_reqs_0_bits_uop_br_mask;
  wire [4:0]   _fregister_read_io_exe_reqs_0_bits_uop_br_tag;
  wire [5:0]   _fregister_read_io_exe_reqs_0_bits_uop_ftq_idx;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_edge_inst;
  wire [5:0]   _fregister_read_io_exe_reqs_0_bits_uop_pc_lob;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_taken;
  wire [19:0]  _fregister_read_io_exe_reqs_0_bits_uop_imm_packed;
  wire [11:0]  _fregister_read_io_exe_reqs_0_bits_uop_csr_addr;
  wire [6:0]   _fregister_read_io_exe_reqs_0_bits_uop_rob_idx;
  wire [4:0]   _fregister_read_io_exe_reqs_0_bits_uop_ldq_idx;
  wire [4:0]   _fregister_read_io_exe_reqs_0_bits_uop_stq_idx;
  wire [1:0]   _fregister_read_io_exe_reqs_0_bits_uop_rxq_idx;
  wire [6:0]   _fregister_read_io_exe_reqs_0_bits_uop_pdst;
  wire [6:0]   _fregister_read_io_exe_reqs_0_bits_uop_prs1;
  wire [6:0]   _fregister_read_io_exe_reqs_0_bits_uop_prs2;
  wire [6:0]   _fregister_read_io_exe_reqs_0_bits_uop_prs3;
  wire [5:0]   _fregister_read_io_exe_reqs_0_bits_uop_ppred;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_prs1_busy;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_prs2_busy;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_prs3_busy;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_ppred_busy;
  wire [6:0]   _fregister_read_io_exe_reqs_0_bits_uop_stale_pdst;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_exception;
  wire [63:0]  _fregister_read_io_exe_reqs_0_bits_uop_exc_cause;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_bypassable;
  wire [4:0]   _fregister_read_io_exe_reqs_0_bits_uop_mem_cmd;
  wire [1:0]   _fregister_read_io_exe_reqs_0_bits_uop_mem_size;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_mem_signed;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_is_fence;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_is_fencei;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_is_amo;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_uses_ldq;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_uses_stq;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_is_sys_pc2epc;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_is_unique;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_flush_on_commit;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_ldst_is_rs1;
  wire [5:0]   _fregister_read_io_exe_reqs_0_bits_uop_ldst;
  wire [5:0]   _fregister_read_io_exe_reqs_0_bits_uop_lrs1;
  wire [5:0]   _fregister_read_io_exe_reqs_0_bits_uop_lrs2;
  wire [5:0]   _fregister_read_io_exe_reqs_0_bits_uop_lrs3;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_ldst_val;
  wire [1:0]   _fregister_read_io_exe_reqs_0_bits_uop_dst_rtype;
  wire [1:0]   _fregister_read_io_exe_reqs_0_bits_uop_lrs1_rtype;
  wire [1:0]   _fregister_read_io_exe_reqs_0_bits_uop_lrs2_rtype;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_frs3_en;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_fp_val;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_fp_single;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_xcpt_pf_if;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_xcpt_ae_if;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_xcpt_ma_if;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_bp_debug_if;
  wire         _fregister_read_io_exe_reqs_0_bits_uop_bp_xcpt_if;
  wire [1:0]   _fregister_read_io_exe_reqs_0_bits_uop_debug_fsrc;
  wire [1:0]   _fregister_read_io_exe_reqs_0_bits_uop_debug_tsrc;
  wire [64:0]  _fregister_read_io_exe_reqs_0_bits_rs1_data;
  wire [64:0]  _fregister_read_io_exe_reqs_0_bits_rs2_data;
  wire [64:0]  _fregister_read_io_exe_reqs_0_bits_rs3_data;
  wire         _fregister_read_io_exe_reqs_1_valid;
  wire [6:0]   _fregister_read_io_exe_reqs_1_bits_uop_uopc;
  wire [31:0]  _fregister_read_io_exe_reqs_1_bits_uop_inst;
  wire [31:0]  _fregister_read_io_exe_reqs_1_bits_uop_debug_inst;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_is_rvc;
  wire [39:0]  _fregister_read_io_exe_reqs_1_bits_uop_debug_pc;
  wire [2:0]   _fregister_read_io_exe_reqs_1_bits_uop_iq_type;
  wire [9:0]   _fregister_read_io_exe_reqs_1_bits_uop_fu_code;
  wire [3:0]   _fregister_read_io_exe_reqs_1_bits_uop_ctrl_br_type;
  wire [1:0]   _fregister_read_io_exe_reqs_1_bits_uop_ctrl_op1_sel;
  wire [2:0]   _fregister_read_io_exe_reqs_1_bits_uop_ctrl_op2_sel;
  wire [2:0]   _fregister_read_io_exe_reqs_1_bits_uop_ctrl_imm_sel;
  wire [3:0]   _fregister_read_io_exe_reqs_1_bits_uop_ctrl_op_fcn;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _fregister_read_io_exe_reqs_1_bits_uop_ctrl_csr_cmd;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_ctrl_is_load;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_ctrl_is_sta;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_ctrl_is_std;
  wire [1:0]   _fregister_read_io_exe_reqs_1_bits_uop_iw_state;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_iw_p1_poisoned;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_iw_p2_poisoned;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_is_br;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_is_jalr;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_is_jal;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_is_sfb;
  wire [19:0]  _fregister_read_io_exe_reqs_1_bits_uop_br_mask;
  wire [4:0]   _fregister_read_io_exe_reqs_1_bits_uop_br_tag;
  wire [5:0]   _fregister_read_io_exe_reqs_1_bits_uop_ftq_idx;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_edge_inst;
  wire [5:0]   _fregister_read_io_exe_reqs_1_bits_uop_pc_lob;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_taken;
  wire [19:0]  _fregister_read_io_exe_reqs_1_bits_uop_imm_packed;
  wire [11:0]  _fregister_read_io_exe_reqs_1_bits_uop_csr_addr;
  wire [6:0]   _fregister_read_io_exe_reqs_1_bits_uop_rob_idx;
  wire [4:0]   _fregister_read_io_exe_reqs_1_bits_uop_ldq_idx;
  wire [4:0]   _fregister_read_io_exe_reqs_1_bits_uop_stq_idx;
  wire [1:0]   _fregister_read_io_exe_reqs_1_bits_uop_rxq_idx;
  wire [6:0]   _fregister_read_io_exe_reqs_1_bits_uop_pdst;
  wire [6:0]   _fregister_read_io_exe_reqs_1_bits_uop_prs1;
  wire [6:0]   _fregister_read_io_exe_reqs_1_bits_uop_prs2;
  wire [6:0]   _fregister_read_io_exe_reqs_1_bits_uop_prs3;
  wire [5:0]   _fregister_read_io_exe_reqs_1_bits_uop_ppred;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_prs1_busy;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_prs2_busy;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_prs3_busy;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_ppred_busy;
  wire [6:0]   _fregister_read_io_exe_reqs_1_bits_uop_stale_pdst;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_exception;
  wire [63:0]  _fregister_read_io_exe_reqs_1_bits_uop_exc_cause;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_bypassable;
  wire [4:0]   _fregister_read_io_exe_reqs_1_bits_uop_mem_cmd;
  wire [1:0]   _fregister_read_io_exe_reqs_1_bits_uop_mem_size;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_mem_signed;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_is_fence;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_is_fencei;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_is_amo;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_uses_ldq;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_uses_stq;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_is_sys_pc2epc;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_is_unique;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_flush_on_commit;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_ldst_is_rs1;
  wire [5:0]   _fregister_read_io_exe_reqs_1_bits_uop_ldst;
  wire [5:0]   _fregister_read_io_exe_reqs_1_bits_uop_lrs1;
  wire [5:0]   _fregister_read_io_exe_reqs_1_bits_uop_lrs2;
  wire [5:0]   _fregister_read_io_exe_reqs_1_bits_uop_lrs3;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_ldst_val;
  wire [1:0]   _fregister_read_io_exe_reqs_1_bits_uop_dst_rtype;
  wire [1:0]   _fregister_read_io_exe_reqs_1_bits_uop_lrs1_rtype;
  wire [1:0]   _fregister_read_io_exe_reqs_1_bits_uop_lrs2_rtype;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_frs3_en;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_fp_val;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_fp_single;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_xcpt_pf_if;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_xcpt_ae_if;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_xcpt_ma_if;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_bp_debug_if;
  wire         _fregister_read_io_exe_reqs_1_bits_uop_bp_xcpt_if;
  wire [1:0]   _fregister_read_io_exe_reqs_1_bits_uop_debug_fsrc;
  wire [1:0]   _fregister_read_io_exe_reqs_1_bits_uop_debug_tsrc;
  wire [64:0]  _fregister_read_io_exe_reqs_1_bits_rs1_data;
  wire [64:0]  _fregister_read_io_exe_reqs_1_bits_rs2_data;
  wire [64:0]  _fregister_read_io_exe_reqs_1_bits_rs3_data;
  wire [64:0]  _fregfile_io_read_ports_0_data;
  wire [64:0]  _fregfile_io_read_ports_1_data;
  wire [64:0]  _fregfile_io_read_ports_2_data;
  wire [64:0]  _fregfile_io_read_ports_3_data;
  wire [64:0]  _fregfile_io_read_ports_4_data;
  wire [64:0]  _fregfile_io_read_ports_5_data;
  wire         _fp_issue_unit_io_iss_valids_0;
  wire         _fp_issue_unit_io_iss_valids_1;
  wire [6:0]   _fp_issue_unit_io_iss_uops_0_uopc;
  wire [31:0]  _fp_issue_unit_io_iss_uops_0_inst;
  wire [31:0]  _fp_issue_unit_io_iss_uops_0_debug_inst;
  wire         _fp_issue_unit_io_iss_uops_0_is_rvc;
  wire [39:0]  _fp_issue_unit_io_iss_uops_0_debug_pc;
  wire [2:0]   _fp_issue_unit_io_iss_uops_0_iq_type;
  wire [9:0]   _fp_issue_unit_io_iss_uops_0_fu_code;
  wire [1:0]   _fp_issue_unit_io_iss_uops_0_iw_state;
  wire         _fp_issue_unit_io_iss_uops_0_is_br;
  wire         _fp_issue_unit_io_iss_uops_0_is_jalr;
  wire         _fp_issue_unit_io_iss_uops_0_is_jal;
  wire         _fp_issue_unit_io_iss_uops_0_is_sfb;
  wire [19:0]  _fp_issue_unit_io_iss_uops_0_br_mask;
  wire [4:0]   _fp_issue_unit_io_iss_uops_0_br_tag;
  wire [5:0]   _fp_issue_unit_io_iss_uops_0_ftq_idx;
  wire         _fp_issue_unit_io_iss_uops_0_edge_inst;
  wire [5:0]   _fp_issue_unit_io_iss_uops_0_pc_lob;
  wire         _fp_issue_unit_io_iss_uops_0_taken;
  wire [19:0]  _fp_issue_unit_io_iss_uops_0_imm_packed;
  wire [11:0]  _fp_issue_unit_io_iss_uops_0_csr_addr;
  wire [6:0]   _fp_issue_unit_io_iss_uops_0_rob_idx;
  wire [4:0]   _fp_issue_unit_io_iss_uops_0_ldq_idx;
  wire [4:0]   _fp_issue_unit_io_iss_uops_0_stq_idx;
  wire [1:0]   _fp_issue_unit_io_iss_uops_0_rxq_idx;
  wire [6:0]   _fp_issue_unit_io_iss_uops_0_pdst;
  wire [6:0]   _fp_issue_unit_io_iss_uops_0_prs1;
  wire [6:0]   _fp_issue_unit_io_iss_uops_0_prs2;
  wire [6:0]   _fp_issue_unit_io_iss_uops_0_prs3;
  wire [5:0]   _fp_issue_unit_io_iss_uops_0_ppred;
  wire         _fp_issue_unit_io_iss_uops_0_prs1_busy;
  wire         _fp_issue_unit_io_iss_uops_0_prs2_busy;
  wire         _fp_issue_unit_io_iss_uops_0_prs3_busy;
  wire         _fp_issue_unit_io_iss_uops_0_ppred_busy;
  wire [6:0]   _fp_issue_unit_io_iss_uops_0_stale_pdst;
  wire         _fp_issue_unit_io_iss_uops_0_exception;
  wire [63:0]  _fp_issue_unit_io_iss_uops_0_exc_cause;
  wire         _fp_issue_unit_io_iss_uops_0_bypassable;
  wire [4:0]   _fp_issue_unit_io_iss_uops_0_mem_cmd;
  wire [1:0]   _fp_issue_unit_io_iss_uops_0_mem_size;
  wire         _fp_issue_unit_io_iss_uops_0_mem_signed;
  wire         _fp_issue_unit_io_iss_uops_0_is_fence;
  wire         _fp_issue_unit_io_iss_uops_0_is_fencei;
  wire         _fp_issue_unit_io_iss_uops_0_is_amo;
  wire         _fp_issue_unit_io_iss_uops_0_uses_ldq;
  wire         _fp_issue_unit_io_iss_uops_0_uses_stq;
  wire         _fp_issue_unit_io_iss_uops_0_is_sys_pc2epc;
  wire         _fp_issue_unit_io_iss_uops_0_is_unique;
  wire         _fp_issue_unit_io_iss_uops_0_flush_on_commit;
  wire         _fp_issue_unit_io_iss_uops_0_ldst_is_rs1;
  wire [5:0]   _fp_issue_unit_io_iss_uops_0_ldst;
  wire [5:0]   _fp_issue_unit_io_iss_uops_0_lrs1;
  wire [5:0]   _fp_issue_unit_io_iss_uops_0_lrs2;
  wire [5:0]   _fp_issue_unit_io_iss_uops_0_lrs3;
  wire         _fp_issue_unit_io_iss_uops_0_ldst_val;
  wire [1:0]   _fp_issue_unit_io_iss_uops_0_dst_rtype;
  wire [1:0]   _fp_issue_unit_io_iss_uops_0_lrs1_rtype;
  wire [1:0]   _fp_issue_unit_io_iss_uops_0_lrs2_rtype;
  wire         _fp_issue_unit_io_iss_uops_0_frs3_en;
  wire         _fp_issue_unit_io_iss_uops_0_fp_val;
  wire         _fp_issue_unit_io_iss_uops_0_fp_single;
  wire         _fp_issue_unit_io_iss_uops_0_xcpt_pf_if;
  wire         _fp_issue_unit_io_iss_uops_0_xcpt_ae_if;
  wire         _fp_issue_unit_io_iss_uops_0_xcpt_ma_if;
  wire         _fp_issue_unit_io_iss_uops_0_bp_debug_if;
  wire         _fp_issue_unit_io_iss_uops_0_bp_xcpt_if;
  wire [1:0]   _fp_issue_unit_io_iss_uops_0_debug_fsrc;
  wire [1:0]   _fp_issue_unit_io_iss_uops_0_debug_tsrc;
  wire [6:0]   _fp_issue_unit_io_iss_uops_1_uopc;
  wire [31:0]  _fp_issue_unit_io_iss_uops_1_inst;
  wire [31:0]  _fp_issue_unit_io_iss_uops_1_debug_inst;
  wire         _fp_issue_unit_io_iss_uops_1_is_rvc;
  wire [39:0]  _fp_issue_unit_io_iss_uops_1_debug_pc;
  wire [2:0]   _fp_issue_unit_io_iss_uops_1_iq_type;
  wire [9:0]   _fp_issue_unit_io_iss_uops_1_fu_code;
  wire [1:0]   _fp_issue_unit_io_iss_uops_1_iw_state;
  wire         _fp_issue_unit_io_iss_uops_1_is_br;
  wire         _fp_issue_unit_io_iss_uops_1_is_jalr;
  wire         _fp_issue_unit_io_iss_uops_1_is_jal;
  wire         _fp_issue_unit_io_iss_uops_1_is_sfb;
  wire [19:0]  _fp_issue_unit_io_iss_uops_1_br_mask;
  wire [4:0]   _fp_issue_unit_io_iss_uops_1_br_tag;
  wire [5:0]   _fp_issue_unit_io_iss_uops_1_ftq_idx;
  wire         _fp_issue_unit_io_iss_uops_1_edge_inst;
  wire [5:0]   _fp_issue_unit_io_iss_uops_1_pc_lob;
  wire         _fp_issue_unit_io_iss_uops_1_taken;
  wire [19:0]  _fp_issue_unit_io_iss_uops_1_imm_packed;
  wire [11:0]  _fp_issue_unit_io_iss_uops_1_csr_addr;
  wire [6:0]   _fp_issue_unit_io_iss_uops_1_rob_idx;
  wire [4:0]   _fp_issue_unit_io_iss_uops_1_ldq_idx;
  wire [4:0]   _fp_issue_unit_io_iss_uops_1_stq_idx;
  wire [1:0]   _fp_issue_unit_io_iss_uops_1_rxq_idx;
  wire [6:0]   _fp_issue_unit_io_iss_uops_1_pdst;
  wire [6:0]   _fp_issue_unit_io_iss_uops_1_prs1;
  wire [6:0]   _fp_issue_unit_io_iss_uops_1_prs2;
  wire [6:0]   _fp_issue_unit_io_iss_uops_1_prs3;
  wire [5:0]   _fp_issue_unit_io_iss_uops_1_ppred;
  wire         _fp_issue_unit_io_iss_uops_1_prs1_busy;
  wire         _fp_issue_unit_io_iss_uops_1_prs2_busy;
  wire         _fp_issue_unit_io_iss_uops_1_prs3_busy;
  wire         _fp_issue_unit_io_iss_uops_1_ppred_busy;
  wire [6:0]   _fp_issue_unit_io_iss_uops_1_stale_pdst;
  wire         _fp_issue_unit_io_iss_uops_1_exception;
  wire [63:0]  _fp_issue_unit_io_iss_uops_1_exc_cause;
  wire         _fp_issue_unit_io_iss_uops_1_bypassable;
  wire [4:0]   _fp_issue_unit_io_iss_uops_1_mem_cmd;
  wire [1:0]   _fp_issue_unit_io_iss_uops_1_mem_size;
  wire         _fp_issue_unit_io_iss_uops_1_mem_signed;
  wire         _fp_issue_unit_io_iss_uops_1_is_fence;
  wire         _fp_issue_unit_io_iss_uops_1_is_fencei;
  wire         _fp_issue_unit_io_iss_uops_1_is_amo;
  wire         _fp_issue_unit_io_iss_uops_1_uses_ldq;
  wire         _fp_issue_unit_io_iss_uops_1_uses_stq;
  wire         _fp_issue_unit_io_iss_uops_1_is_sys_pc2epc;
  wire         _fp_issue_unit_io_iss_uops_1_is_unique;
  wire         _fp_issue_unit_io_iss_uops_1_flush_on_commit;
  wire         _fp_issue_unit_io_iss_uops_1_ldst_is_rs1;
  wire [5:0]   _fp_issue_unit_io_iss_uops_1_ldst;
  wire [5:0]   _fp_issue_unit_io_iss_uops_1_lrs1;
  wire [5:0]   _fp_issue_unit_io_iss_uops_1_lrs2;
  wire [5:0]   _fp_issue_unit_io_iss_uops_1_lrs3;
  wire         _fp_issue_unit_io_iss_uops_1_ldst_val;
  wire [1:0]   _fp_issue_unit_io_iss_uops_1_dst_rtype;
  wire [1:0]   _fp_issue_unit_io_iss_uops_1_lrs1_rtype;
  wire [1:0]   _fp_issue_unit_io_iss_uops_1_lrs2_rtype;
  wire         _fp_issue_unit_io_iss_uops_1_frs3_en;
  wire         _fp_issue_unit_io_iss_uops_1_fp_val;
  wire         _fp_issue_unit_io_iss_uops_1_fp_single;
  wire         _fp_issue_unit_io_iss_uops_1_xcpt_pf_if;
  wire         _fp_issue_unit_io_iss_uops_1_xcpt_ae_if;
  wire         _fp_issue_unit_io_iss_uops_1_xcpt_ma_if;
  wire         _fp_issue_unit_io_iss_uops_1_bp_debug_if;
  wire         _fp_issue_unit_io_iss_uops_1_bp_xcpt_if;
  wire [1:0]   _fp_issue_unit_io_iss_uops_1_debug_fsrc;
  wire [1:0]   _fp_issue_unit_io_iss_uops_1_debug_tsrc;
  wire         _fpu_exe_unit_1_io_fresp_valid;
  wire [6:0]   _fpu_exe_unit_1_io_fresp_bits_uop_pdst;
  wire         _fpu_exe_unit_1_io_fresp_bits_uop_is_amo;
  wire         _fpu_exe_unit_1_io_fresp_bits_uop_uses_ldq;
  wire         _fpu_exe_unit_1_io_fresp_bits_uop_uses_stq;
  wire [1:0]   _fpu_exe_unit_1_io_fresp_bits_uop_dst_rtype;
  wire [64:0]  _fpu_exe_unit_1_io_fresp_bits_data;
  wire [9:0]   _fpu_exe_unit_io_fu_types;
  wire         _fpu_exe_unit_io_fresp_valid;
  wire [6:0]   _fpu_exe_unit_io_fresp_bits_uop_pdst;
  wire         _fpu_exe_unit_io_fresp_bits_uop_is_amo;
  wire         _fpu_exe_unit_io_fresp_bits_uop_uses_ldq;
  wire         _fpu_exe_unit_io_fresp_bits_uop_uses_stq;
  wire [1:0]   _fpu_exe_unit_io_fresp_bits_uop_dst_rtype;
  wire [64:0]  _fpu_exe_unit_io_fresp_bits_data;
  wire         _fpu_exe_unit_io_ll_iresp_valid;
  wire [6:0]   _fpu_exe_unit_io_ll_iresp_bits_uop_uopc;
  wire [6:0]   _fpu_exe_unit_io_ll_iresp_bits_uop_rob_idx;
  wire [64:0]  _fpu_exe_unit_io_ll_iresp_bits_data;
  reg  [9:0]   REG;
  wire [63:0]  _ll_wbarb_io_in_0_bits_data_T_3 = (io_ll_wports_0_bits_uop_mem_size == 2'h2 ? 64'hFFFFFFFF00000000 : 64'h0) | io_ll_wports_0_bits_data[63:0];
  wire         ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn = _ll_wbarb_io_in_0_bits_data_T_3[62:52] == 11'h0;
  wire [5:0]   ll_wbarb_io_in_0_bits_data_rawIn_normDist =
    _ll_wbarb_io_in_0_bits_data_T_3[51]
      ? 6'h0
      : _ll_wbarb_io_in_0_bits_data_T_3[50]
          ? 6'h1
          : _ll_wbarb_io_in_0_bits_data_T_3[49]
              ? 6'h2
              : _ll_wbarb_io_in_0_bits_data_T_3[48]
                  ? 6'h3
                  : _ll_wbarb_io_in_0_bits_data_T_3[47]
                      ? 6'h4
                      : _ll_wbarb_io_in_0_bits_data_T_3[46]
                          ? 6'h5
                          : _ll_wbarb_io_in_0_bits_data_T_3[45]
                              ? 6'h6
                              : _ll_wbarb_io_in_0_bits_data_T_3[44] ? 6'h7 : _ll_wbarb_io_in_0_bits_data_T_3[43] ? 6'h8 : _ll_wbarb_io_in_0_bits_data_T_3[42] ? 6'h9 : _ll_wbarb_io_in_0_bits_data_T_3[41] ? 6'hA : _ll_wbarb_io_in_0_bits_data_T_3[40] ? 6'hB : _ll_wbarb_io_in_0_bits_data_T_3[39] ? 6'hC : _ll_wbarb_io_in_0_bits_data_T_3[38] ? 6'hD : _ll_wbarb_io_in_0_bits_data_T_3[37] ? 6'hE : _ll_wbarb_io_in_0_bits_data_T_3[36] ? 6'hF : _ll_wbarb_io_in_0_bits_data_T_3[35] ? 6'h10 : _ll_wbarb_io_in_0_bits_data_T_3[34] ? 6'h11 : _ll_wbarb_io_in_0_bits_data_T_3[33] ? 6'h12 : _ll_wbarb_io_in_0_bits_data_T_3[32] ? 6'h13 : _ll_wbarb_io_in_0_bits_data_T_3[31] ? 6'h14 : _ll_wbarb_io_in_0_bits_data_T_3[30] ? 6'h15 : _ll_wbarb_io_in_0_bits_data_T_3[29] ? 6'h16 : _ll_wbarb_io_in_0_bits_data_T_3[28] ? 6'h17 : _ll_wbarb_io_in_0_bits_data_T_3[27] ? 6'h18 : _ll_wbarb_io_in_0_bits_data_T_3[26] ? 6'h19 : _ll_wbarb_io_in_0_bits_data_T_3[25] ? 6'h1A : _ll_wbarb_io_in_0_bits_data_T_3[24] ? 6'h1B : _ll_wbarb_io_in_0_bits_data_T_3[23] ? 6'h1C : _ll_wbarb_io_in_0_bits_data_T_3[22] ? 6'h1D : _ll_wbarb_io_in_0_bits_data_T_3[21] ? 6'h1E : _ll_wbarb_io_in_0_bits_data_T_3[20] ? 6'h1F : _ll_wbarb_io_in_0_bits_data_T_3[19] ? 6'h20 : _ll_wbarb_io_in_0_bits_data_T_3[18] ? 6'h21 : _ll_wbarb_io_in_0_bits_data_T_3[17] ? 6'h22 : _ll_wbarb_io_in_0_bits_data_T_3[16] ? 6'h23 : _ll_wbarb_io_in_0_bits_data_T_3[15] ? 6'h24 : _ll_wbarb_io_in_0_bits_data_T_3[14] ? 6'h25 : _ll_wbarb_io_in_0_bits_data_T_3[13] ? 6'h26 : _ll_wbarb_io_in_0_bits_data_T_3[12] ? 6'h27 : _ll_wbarb_io_in_0_bits_data_T_3[11] ? 6'h28 : _ll_wbarb_io_in_0_bits_data_T_3[10] ? 6'h29 : _ll_wbarb_io_in_0_bits_data_T_3[9] ? 6'h2A : _ll_wbarb_io_in_0_bits_data_T_3[8] ? 6'h2B : _ll_wbarb_io_in_0_bits_data_T_3[7] ? 6'h2C : _ll_wbarb_io_in_0_bits_data_T_3[6] ? 6'h2D : _ll_wbarb_io_in_0_bits_data_T_3[5] ? 6'h2E : _ll_wbarb_io_in_0_bits_data_T_3[4] ? 6'h2F : _ll_wbarb_io_in_0_bits_data_T_3[3] ? 6'h30 : _ll_wbarb_io_in_0_bits_data_T_3[2] ? 6'h31 : {5'h19, ~(_ll_wbarb_io_in_0_bits_data_T_3[1])};
  wire [114:0] _ll_wbarb_io_in_0_bits_data_rawIn_subnormFract_T = {63'h0, _ll_wbarb_io_in_0_bits_data_T_3[51:0]} << ll_wbarb_io_in_0_bits_data_rawIn_normDist;
  wire [11:0]  _ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_4 = (ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn ? {6'h3F, ~ll_wbarb_io_in_0_bits_data_rawIn_normDist} : {1'h0, _ll_wbarb_io_in_0_bits_data_T_3[62:52]}) + {10'h100, ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn ? 2'h2 : 2'h1};
  wire [51:0]  _ll_wbarb_io_in_0_bits_data_rawIn_out_sig_T_2 = ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn ? {_ll_wbarb_io_in_0_bits_data_rawIn_subnormFract_T[50:0], 1'h0} : _ll_wbarb_io_in_0_bits_data_T_3[51:0];
  wire [2:0]   _ll_wbarb_io_in_0_bits_data_T_5 = ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn & ~(|(_ll_wbarb_io_in_0_bits_data_T_3[51:0])) ? 3'h0 : _ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_4[11:9];
  wire         _GEN = _ll_wbarb_io_in_0_bits_data_T_5[0] | (&(_ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_4[11:10])) & (|(_ll_wbarb_io_in_0_bits_data_T_3[51:0]));
  wire         ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn_1 = _ll_wbarb_io_in_0_bits_data_T_3[30:23] == 8'h0;
  wire [4:0]   ll_wbarb_io_in_0_bits_data_rawIn_normDist_1 = _ll_wbarb_io_in_0_bits_data_T_3[22] ? 5'h0 : _ll_wbarb_io_in_0_bits_data_T_3[21] ? 5'h1 : _ll_wbarb_io_in_0_bits_data_T_3[20] ? 5'h2 : _ll_wbarb_io_in_0_bits_data_T_3[19] ? 5'h3 : _ll_wbarb_io_in_0_bits_data_T_3[18] ? 5'h4 : _ll_wbarb_io_in_0_bits_data_T_3[17] ? 5'h5 : _ll_wbarb_io_in_0_bits_data_T_3[16] ? 5'h6 : _ll_wbarb_io_in_0_bits_data_T_3[15] ? 5'h7 : _ll_wbarb_io_in_0_bits_data_T_3[14] ? 5'h8 : _ll_wbarb_io_in_0_bits_data_T_3[13] ? 5'h9 : _ll_wbarb_io_in_0_bits_data_T_3[12] ? 5'hA : _ll_wbarb_io_in_0_bits_data_T_3[11] ? 5'hB : _ll_wbarb_io_in_0_bits_data_T_3[10] ? 5'hC : _ll_wbarb_io_in_0_bits_data_T_3[9] ? 5'hD : _ll_wbarb_io_in_0_bits_data_T_3[8] ? 5'hE : _ll_wbarb_io_in_0_bits_data_T_3[7] ? 5'hF : _ll_wbarb_io_in_0_bits_data_T_3[6] ? 5'h10 : _ll_wbarb_io_in_0_bits_data_T_3[5] ? 5'h11 : _ll_wbarb_io_in_0_bits_data_T_3[4] ? 5'h12 : _ll_wbarb_io_in_0_bits_data_T_3[3] ? 5'h13 : _ll_wbarb_io_in_0_bits_data_T_3[2] ? 5'h14 : _ll_wbarb_io_in_0_bits_data_T_3[1] ? 5'h15 : 5'h16;
  wire [53:0]  _ll_wbarb_io_in_0_bits_data_rawIn_subnormFract_T_2 = {31'h0, _ll_wbarb_io_in_0_bits_data_T_3[22:0]} << ll_wbarb_io_in_0_bits_data_rawIn_normDist_1;
  wire [8:0]   _ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_9 = (ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn_1 ? {4'hF, ~ll_wbarb_io_in_0_bits_data_rawIn_normDist_1} : {1'h0, _ll_wbarb_io_in_0_bits_data_T_3[30:23]}) + {7'h20, ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn_1 ? 2'h2 : 2'h1};
  wire [2:0]   _ll_wbarb_io_in_0_bits_data_T_14 = ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn_1 & ~(|(_ll_wbarb_io_in_0_bits_data_T_3[22:0])) ? 3'h0 : _ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_9[8:6];
  reg          fregfile_io_write_ports_0_REG_valid;
  reg  [6:0]   fregfile_io_write_ports_0_REG_bits_addr;
  reg  [64:0]  fregfile_io_write_ports_0_REG_bits_data;
  reg          fregfile_io_write_ports_1_REG_valid;
  reg  [6:0]   fregfile_io_write_ports_1_REG_bits_addr;
  reg  [64:0]  fregfile_io_write_ports_1_bits_data_REG;
  wire         _fregfile_io_write_ports_2_valid_T = _fpu_exe_unit_io_fresp_bits_uop_dst_rtype != 2'h2;
  wire         _fregfile_io_write_ports_3_valid_T = _fpu_exe_unit_1_io_fresp_bits_uop_dst_rtype != 2'h2;
  wire         fpiu_is_sdq = _fpu_exe_unit_io_ll_iresp_bits_uop_uopc == 7'h2;
  wire         _io_to_sdq_valid_T = _fpu_exe_unit_io_ll_iresp_ready_T & _fpu_exe_unit_io_ll_iresp_valid;
  assign _fpu_exe_unit_io_ll_iresp_ready_T = io_to_sdq_ready & io_to_int_ready;
  wire         _io_wakeups_2_valid_output = _fpu_exe_unit_io_fresp_valid & _fpu_exe_unit_io_fresp_bits_uop_dst_rtype == 2'h1;
  wire         _io_wakeups_3_valid_output = _fpu_exe_unit_1_io_fresp_valid & _fpu_exe_unit_1_io_fresp_bits_uop_dst_rtype == 2'h1;
  `ifndef SYNTHESIS
    wire _GEN_0 = _fpu_exe_unit_io_fresp_valid & ~reset;
    wire _GEN_1 = _fpu_exe_unit_1_io_fresp_valid & ~reset;
    always @(posedge clock) begin
      if (~reset & ~_ll_wbarb_io_in_0_ready) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at fp-pipeline.scala:187 assert (ll_wbarb.io.in(0).ready) // never backpressure the memory unit.\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_from_int_valid & ~reset & ~(io_from_int_bits_uop_dst_rtype != 2'h2 & io_from_int_bits_uop_dst_rtype == 2'h1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at fp-pipeline.scala:188 when (ifpu_resp.valid) { assert (ifpu_resp.bits.uop.rf_wen && ifpu_resp.bits.uop.dst_rtype === RT_FLT) }\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_0 & ~_fregfile_io_write_ports_2_valid_T) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: rf_wen must be high here\n    at fp-pipeline.scala:205 assert(eu.io.fresp.bits.uop.rf_wen, \"rf_wen must be high here\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_0 & _fpu_exe_unit_io_fresp_bits_uop_dst_rtype != 2'h1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: wb type must be FLT for fpu\n    at fp-pipeline.scala:206 assert(eu.io.fresp.bits.uop.dst_rtype === RT_FLT, \"wb type must be FLT for fpu\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_1 & ~_fregfile_io_write_ports_3_valid_T) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: rf_wen must be high here\n    at fp-pipeline.scala:205 assert(eu.io.fresp.bits.uop.rf_wen, \"rf_wen must be high here\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_1 & _fpu_exe_unit_1_io_fresp_bits_uop_dst_rtype != 2'h1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: wb type must be FLT for fpu\n    at fp-pipeline.scala:206 assert(eu.io.fresp.bits.uop.dst_rtype === RT_FLT, \"wb type must be FLT for fpu\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & _fpu_exe_unit_io_fresp_valid & _fpu_exe_unit_io_fresp_bits_uop_uses_ldq) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at fp-pipeline.scala:248 assert(!(exe_resp.valid && wb_uop.uses_ldq))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & _fpu_exe_unit_io_fresp_valid & _fpu_exe_unit_io_fresp_bits_uop_uses_stq) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at fp-pipeline.scala:249 assert(!(exe_resp.valid && wb_uop.uses_stq))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & _fpu_exe_unit_io_fresp_valid & _fpu_exe_unit_io_fresp_bits_uop_is_amo) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at fp-pipeline.scala:250 assert(!(exe_resp.valid && wb_uop.is_amo))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & _fpu_exe_unit_1_io_fresp_valid & _fpu_exe_unit_1_io_fresp_bits_uop_uses_ldq) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at fp-pipeline.scala:248 assert(!(exe_resp.valid && wb_uop.uses_ldq))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & _fpu_exe_unit_1_io_fresp_valid & _fpu_exe_unit_1_io_fresp_bits_uop_uses_stq) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at fp-pipeline.scala:249 assert(!(exe_resp.valid && wb_uop.uses_stq))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & _fpu_exe_unit_1_io_fresp_valid & _fpu_exe_unit_1_io_fresp_bits_uop_is_amo) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at fp-pipeline.scala:250 assert(!(exe_resp.valid && wb_uop.is_amo))\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [63:0]  _fregfile_io_write_ports_1_bits_data_T_3 = (io_ll_wports_1_bits_uop_mem_size == 2'h2 ? 64'hFFFFFFFF00000000 : 64'h0) | io_ll_wports_1_bits_data[63:0];
  wire         fregfile_io_write_ports_1_bits_data_rawIn_isZeroExpIn = _fregfile_io_write_ports_1_bits_data_T_3[62:52] == 11'h0;
  wire [5:0]   fregfile_io_write_ports_1_bits_data_rawIn_normDist =
    _fregfile_io_write_ports_1_bits_data_T_3[51]
      ? 6'h0
      : _fregfile_io_write_ports_1_bits_data_T_3[50]
          ? 6'h1
          : _fregfile_io_write_ports_1_bits_data_T_3[49]
              ? 6'h2
              : _fregfile_io_write_ports_1_bits_data_T_3[48]
                  ? 6'h3
                  : _fregfile_io_write_ports_1_bits_data_T_3[47]
                      ? 6'h4
                      : _fregfile_io_write_ports_1_bits_data_T_3[46]
                          ? 6'h5
                          : _fregfile_io_write_ports_1_bits_data_T_3[45]
                              ? 6'h6
                              : _fregfile_io_write_ports_1_bits_data_T_3[44]
                                  ? 6'h7
                                  : _fregfile_io_write_ports_1_bits_data_T_3[43]
                                      ? 6'h8
                                      : _fregfile_io_write_ports_1_bits_data_T_3[42]
                                          ? 6'h9
                                          : _fregfile_io_write_ports_1_bits_data_T_3[41]
                                              ? 6'hA
                                              : _fregfile_io_write_ports_1_bits_data_T_3[40]
                                                  ? 6'hB
                                                  : _fregfile_io_write_ports_1_bits_data_T_3[39]
                                                      ? 6'hC
                                                      : _fregfile_io_write_ports_1_bits_data_T_3[38]
                                                          ? 6'hD
                                                          : _fregfile_io_write_ports_1_bits_data_T_3[37]
                                                              ? 6'hE
                                                              : _fregfile_io_write_ports_1_bits_data_T_3[36] ? 6'hF : _fregfile_io_write_ports_1_bits_data_T_3[35] ? 6'h10 : _fregfile_io_write_ports_1_bits_data_T_3[34] ? 6'h11 : _fregfile_io_write_ports_1_bits_data_T_3[33] ? 6'h12 : _fregfile_io_write_ports_1_bits_data_T_3[32] ? 6'h13 : _fregfile_io_write_ports_1_bits_data_T_3[31] ? 6'h14 : _fregfile_io_write_ports_1_bits_data_T_3[30] ? 6'h15 : _fregfile_io_write_ports_1_bits_data_T_3[29] ? 6'h16 : _fregfile_io_write_ports_1_bits_data_T_3[28] ? 6'h17 : _fregfile_io_write_ports_1_bits_data_T_3[27] ? 6'h18 : _fregfile_io_write_ports_1_bits_data_T_3[26] ? 6'h19 : _fregfile_io_write_ports_1_bits_data_T_3[25] ? 6'h1A : _fregfile_io_write_ports_1_bits_data_T_3[24] ? 6'h1B : _fregfile_io_write_ports_1_bits_data_T_3[23] ? 6'h1C : _fregfile_io_write_ports_1_bits_data_T_3[22] ? 6'h1D : _fregfile_io_write_ports_1_bits_data_T_3[21] ? 6'h1E : _fregfile_io_write_ports_1_bits_data_T_3[20] ? 6'h1F : _fregfile_io_write_ports_1_bits_data_T_3[19] ? 6'h20 : _fregfile_io_write_ports_1_bits_data_T_3[18] ? 6'h21 : _fregfile_io_write_ports_1_bits_data_T_3[17] ? 6'h22 : _fregfile_io_write_ports_1_bits_data_T_3[16] ? 6'h23 : _fregfile_io_write_ports_1_bits_data_T_3[15] ? 6'h24 : _fregfile_io_write_ports_1_bits_data_T_3[14] ? 6'h25 : _fregfile_io_write_ports_1_bits_data_T_3[13] ? 6'h26 : _fregfile_io_write_ports_1_bits_data_T_3[12] ? 6'h27 : _fregfile_io_write_ports_1_bits_data_T_3[11] ? 6'h28 : _fregfile_io_write_ports_1_bits_data_T_3[10] ? 6'h29 : _fregfile_io_write_ports_1_bits_data_T_3[9] ? 6'h2A : _fregfile_io_write_ports_1_bits_data_T_3[8] ? 6'h2B : _fregfile_io_write_ports_1_bits_data_T_3[7] ? 6'h2C : _fregfile_io_write_ports_1_bits_data_T_3[6] ? 6'h2D : _fregfile_io_write_ports_1_bits_data_T_3[5] ? 6'h2E : _fregfile_io_write_ports_1_bits_data_T_3[4] ? 6'h2F : _fregfile_io_write_ports_1_bits_data_T_3[3] ? 6'h30 : _fregfile_io_write_ports_1_bits_data_T_3[2] ? 6'h31 : {5'h19, ~(_fregfile_io_write_ports_1_bits_data_T_3[1])};
  wire [11:0]  _fregfile_io_write_ports_1_bits_data_rawIn_adjustedExp_T_4 = (fregfile_io_write_ports_1_bits_data_rawIn_isZeroExpIn ? {6'h3F, ~fregfile_io_write_ports_1_bits_data_rawIn_normDist} : {1'h0, _fregfile_io_write_ports_1_bits_data_T_3[62:52]}) + {10'h100, fregfile_io_write_ports_1_bits_data_rawIn_isZeroExpIn ? 2'h2 : 2'h1};
  wire [114:0] _fregfile_io_write_ports_1_bits_data_rawIn_subnormFract_T = {63'h0, _fregfile_io_write_ports_1_bits_data_T_3[51:0]} << fregfile_io_write_ports_1_bits_data_rawIn_normDist;
  wire [51:0]  _fregfile_io_write_ports_1_bits_data_rawIn_out_sig_T_2 = fregfile_io_write_ports_1_bits_data_rawIn_isZeroExpIn ? {_fregfile_io_write_ports_1_bits_data_rawIn_subnormFract_T[50:0], 1'h0} : _fregfile_io_write_ports_1_bits_data_T_3[51:0];
  wire [2:0]   _fregfile_io_write_ports_1_bits_data_T_5 = fregfile_io_write_ports_1_bits_data_rawIn_isZeroExpIn & ~(|(_fregfile_io_write_ports_1_bits_data_T_3[51:0])) ? 3'h0 : _fregfile_io_write_ports_1_bits_data_rawIn_adjustedExp_T_4[11:9];
  wire         _GEN_2 = _fregfile_io_write_ports_1_bits_data_T_5[0] | (&(_fregfile_io_write_ports_1_bits_data_rawIn_adjustedExp_T_4[11:10])) & (|(_fregfile_io_write_ports_1_bits_data_T_3[51:0]));
  wire         fregfile_io_write_ports_1_bits_data_rawIn_isZeroExpIn_1 = _fregfile_io_write_ports_1_bits_data_T_3[30:23] == 8'h0;
  wire [4:0]   fregfile_io_write_ports_1_bits_data_rawIn_normDist_1 = _fregfile_io_write_ports_1_bits_data_T_3[22] ? 5'h0 : _fregfile_io_write_ports_1_bits_data_T_3[21] ? 5'h1 : _fregfile_io_write_ports_1_bits_data_T_3[20] ? 5'h2 : _fregfile_io_write_ports_1_bits_data_T_3[19] ? 5'h3 : _fregfile_io_write_ports_1_bits_data_T_3[18] ? 5'h4 : _fregfile_io_write_ports_1_bits_data_T_3[17] ? 5'h5 : _fregfile_io_write_ports_1_bits_data_T_3[16] ? 5'h6 : _fregfile_io_write_ports_1_bits_data_T_3[15] ? 5'h7 : _fregfile_io_write_ports_1_bits_data_T_3[14] ? 5'h8 : _fregfile_io_write_ports_1_bits_data_T_3[13] ? 5'h9 : _fregfile_io_write_ports_1_bits_data_T_3[12] ? 5'hA : _fregfile_io_write_ports_1_bits_data_T_3[11] ? 5'hB : _fregfile_io_write_ports_1_bits_data_T_3[10] ? 5'hC : _fregfile_io_write_ports_1_bits_data_T_3[9] ? 5'hD : _fregfile_io_write_ports_1_bits_data_T_3[8] ? 5'hE : _fregfile_io_write_ports_1_bits_data_T_3[7] ? 5'hF : _fregfile_io_write_ports_1_bits_data_T_3[6] ? 5'h10 : _fregfile_io_write_ports_1_bits_data_T_3[5] ? 5'h11 : _fregfile_io_write_ports_1_bits_data_T_3[4] ? 5'h12 : _fregfile_io_write_ports_1_bits_data_T_3[3] ? 5'h13 : _fregfile_io_write_ports_1_bits_data_T_3[2] ? 5'h14 : _fregfile_io_write_ports_1_bits_data_T_3[1] ? 5'h15 : 5'h16;
  wire [8:0]   _fregfile_io_write_ports_1_bits_data_rawIn_adjustedExp_T_9 = (fregfile_io_write_ports_1_bits_data_rawIn_isZeroExpIn_1 ? {4'hF, ~fregfile_io_write_ports_1_bits_data_rawIn_normDist_1} : {1'h0, _fregfile_io_write_ports_1_bits_data_T_3[30:23]}) + {7'h20, fregfile_io_write_ports_1_bits_data_rawIn_isZeroExpIn_1 ? 2'h2 : 2'h1};
  wire [2:0]   _fregfile_io_write_ports_1_bits_data_T_14 = fregfile_io_write_ports_1_bits_data_rawIn_isZeroExpIn_1 & ~(|(_fregfile_io_write_ports_1_bits_data_T_3[22:0])) ? 3'h0 : _fregfile_io_write_ports_1_bits_data_rawIn_adjustedExp_T_9[8:6];
  wire [53:0]  _fregfile_io_write_ports_1_bits_data_rawIn_subnormFract_T_2 = {31'h0, _fregfile_io_write_ports_1_bits_data_T_3[22:0]} << fregfile_io_write_ports_1_bits_data_rawIn_normDist_1;
  always @(posedge clock) begin
    REG <= {2'h3, ~(_fp_issue_unit_io_iss_valids_0 & _fp_issue_unit_io_iss_uops_0_fu_code[7]), 7'h7F};
    fregfile_io_write_ports_0_REG_valid <= _ll_wbarb_io_out_valid & _ll_wbarb_io_out_bits_uop_dst_rtype == 2'h1;
    fregfile_io_write_ports_0_REG_bits_addr <= _ll_wbarb_io_out_bits_uop_pdst;
    fregfile_io_write_ports_0_REG_bits_data <= _ll_wbarb_io_out_bits_data;
    fregfile_io_write_ports_1_REG_valid <= io_ll_wports_1_valid & io_ll_wports_1_bits_uop_dst_rtype == 2'h1;
    fregfile_io_write_ports_1_REG_bits_addr <= io_ll_wports_1_bits_uop_pdst;
    fregfile_io_write_ports_1_bits_data_REG <= {_fregfile_io_write_ports_1_bits_data_T_3[63], _fregfile_io_write_ports_1_bits_data_T_5[2:1], _GEN_2, (&{_fregfile_io_write_ports_1_bits_data_T_5[2:1], _GEN_2}) ? {&(_fregfile_io_write_ports_1_bits_data_rawIn_out_sig_T_2[51:32]), _fregfile_io_write_ports_1_bits_data_rawIn_adjustedExp_T_4[7:1], _fregfile_io_write_ports_1_bits_data_T_14[2], _fregfile_io_write_ports_1_bits_data_rawIn_out_sig_T_2[51:32], _fregfile_io_write_ports_1_bits_data_T_3[31], _fregfile_io_write_ports_1_bits_data_T_14[1], _fregfile_io_write_ports_1_bits_data_T_14[0] | (&(_fregfile_io_write_ports_1_bits_data_rawIn_adjustedExp_T_9[8:7])) & (|(_fregfile_io_write_ports_1_bits_data_T_3[22:0])), _fregfile_io_write_ports_1_bits_data_rawIn_adjustedExp_T_9[5:0], fregfile_io_write_ports_1_bits_data_rawIn_isZeroExpIn_1 ? {_fregfile_io_write_ports_1_bits_data_rawIn_subnormFract_T_2[21:0], 1'h0} : _fregfile_io_write_ports_1_bits_data_T_3[22:0]} : {_fregfile_io_write_ports_1_bits_data_rawIn_adjustedExp_T_4[8:0], _fregfile_io_write_ports_1_bits_data_rawIn_out_sig_T_2}};
  end // always @(posedge)
  FPUExeUnit fpu_exe_unit (
    .clock                                 (clock),
    .reset                                 (reset),
    .io_fu_types                           (_fpu_exe_unit_io_fu_types),
    .io_req_valid                          (_fregister_read_io_exe_reqs_0_valid),
    .io_req_bits_uop_uopc                  (_fregister_read_io_exe_reqs_0_bits_uop_uopc),
    .io_req_bits_uop_inst                  (_fregister_read_io_exe_reqs_0_bits_uop_inst),
    .io_req_bits_uop_debug_inst            (_fregister_read_io_exe_reqs_0_bits_uop_debug_inst),
    .io_req_bits_uop_is_rvc                (_fregister_read_io_exe_reqs_0_bits_uop_is_rvc),
    .io_req_bits_uop_debug_pc              (_fregister_read_io_exe_reqs_0_bits_uop_debug_pc),
    .io_req_bits_uop_iq_type               (_fregister_read_io_exe_reqs_0_bits_uop_iq_type),
    .io_req_bits_uop_fu_code               (_fregister_read_io_exe_reqs_0_bits_uop_fu_code),
    .io_req_bits_uop_ctrl_br_type          (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel          (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel          (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel          (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn           (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw           (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_ctrl_csr_cmd          (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_csr_cmd),
    .io_req_bits_uop_ctrl_is_load          (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_load),
    .io_req_bits_uop_ctrl_is_sta           (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_sta),
    .io_req_bits_uop_ctrl_is_std           (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_std),
    .io_req_bits_uop_iw_state              (_fregister_read_io_exe_reqs_0_bits_uop_iw_state),
    .io_req_bits_uop_iw_p1_poisoned        (_fregister_read_io_exe_reqs_0_bits_uop_iw_p1_poisoned),
    .io_req_bits_uop_iw_p2_poisoned        (_fregister_read_io_exe_reqs_0_bits_uop_iw_p2_poisoned),
    .io_req_bits_uop_is_br                 (_fregister_read_io_exe_reqs_0_bits_uop_is_br),
    .io_req_bits_uop_is_jalr               (_fregister_read_io_exe_reqs_0_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal                (_fregister_read_io_exe_reqs_0_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb                (_fregister_read_io_exe_reqs_0_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask               (_fregister_read_io_exe_reqs_0_bits_uop_br_mask),
    .io_req_bits_uop_br_tag                (_fregister_read_io_exe_reqs_0_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx               (_fregister_read_io_exe_reqs_0_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst             (_fregister_read_io_exe_reqs_0_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob                (_fregister_read_io_exe_reqs_0_bits_uop_pc_lob),
    .io_req_bits_uop_taken                 (_fregister_read_io_exe_reqs_0_bits_uop_taken),
    .io_req_bits_uop_imm_packed            (_fregister_read_io_exe_reqs_0_bits_uop_imm_packed),
    .io_req_bits_uop_csr_addr              (_fregister_read_io_exe_reqs_0_bits_uop_csr_addr),
    .io_req_bits_uop_rob_idx               (_fregister_read_io_exe_reqs_0_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx               (_fregister_read_io_exe_reqs_0_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx               (_fregister_read_io_exe_reqs_0_bits_uop_stq_idx),
    .io_req_bits_uop_rxq_idx               (_fregister_read_io_exe_reqs_0_bits_uop_rxq_idx),
    .io_req_bits_uop_pdst                  (_fregister_read_io_exe_reqs_0_bits_uop_pdst),
    .io_req_bits_uop_prs1                  (_fregister_read_io_exe_reqs_0_bits_uop_prs1),
    .io_req_bits_uop_prs2                  (_fregister_read_io_exe_reqs_0_bits_uop_prs2),
    .io_req_bits_uop_prs3                  (_fregister_read_io_exe_reqs_0_bits_uop_prs3),
    .io_req_bits_uop_ppred                 (_fregister_read_io_exe_reqs_0_bits_uop_ppred),
    .io_req_bits_uop_prs1_busy             (_fregister_read_io_exe_reqs_0_bits_uop_prs1_busy),
    .io_req_bits_uop_prs2_busy             (_fregister_read_io_exe_reqs_0_bits_uop_prs2_busy),
    .io_req_bits_uop_prs3_busy             (_fregister_read_io_exe_reqs_0_bits_uop_prs3_busy),
    .io_req_bits_uop_ppred_busy            (_fregister_read_io_exe_reqs_0_bits_uop_ppred_busy),
    .io_req_bits_uop_stale_pdst            (_fregister_read_io_exe_reqs_0_bits_uop_stale_pdst),
    .io_req_bits_uop_exception             (_fregister_read_io_exe_reqs_0_bits_uop_exception),
    .io_req_bits_uop_exc_cause             (_fregister_read_io_exe_reqs_0_bits_uop_exc_cause),
    .io_req_bits_uop_bypassable            (_fregister_read_io_exe_reqs_0_bits_uop_bypassable),
    .io_req_bits_uop_mem_cmd               (_fregister_read_io_exe_reqs_0_bits_uop_mem_cmd),
    .io_req_bits_uop_mem_size              (_fregister_read_io_exe_reqs_0_bits_uop_mem_size),
    .io_req_bits_uop_mem_signed            (_fregister_read_io_exe_reqs_0_bits_uop_mem_signed),
    .io_req_bits_uop_is_fence              (_fregister_read_io_exe_reqs_0_bits_uop_is_fence),
    .io_req_bits_uop_is_fencei             (_fregister_read_io_exe_reqs_0_bits_uop_is_fencei),
    .io_req_bits_uop_is_amo                (_fregister_read_io_exe_reqs_0_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq              (_fregister_read_io_exe_reqs_0_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq              (_fregister_read_io_exe_reqs_0_bits_uop_uses_stq),
    .io_req_bits_uop_is_sys_pc2epc         (_fregister_read_io_exe_reqs_0_bits_uop_is_sys_pc2epc),
    .io_req_bits_uop_is_unique             (_fregister_read_io_exe_reqs_0_bits_uop_is_unique),
    .io_req_bits_uop_flush_on_commit       (_fregister_read_io_exe_reqs_0_bits_uop_flush_on_commit),
    .io_req_bits_uop_ldst_is_rs1           (_fregister_read_io_exe_reqs_0_bits_uop_ldst_is_rs1),
    .io_req_bits_uop_ldst                  (_fregister_read_io_exe_reqs_0_bits_uop_ldst),
    .io_req_bits_uop_lrs1                  (_fregister_read_io_exe_reqs_0_bits_uop_lrs1),
    .io_req_bits_uop_lrs2                  (_fregister_read_io_exe_reqs_0_bits_uop_lrs2),
    .io_req_bits_uop_lrs3                  (_fregister_read_io_exe_reqs_0_bits_uop_lrs3),
    .io_req_bits_uop_ldst_val              (_fregister_read_io_exe_reqs_0_bits_uop_ldst_val),
    .io_req_bits_uop_dst_rtype             (_fregister_read_io_exe_reqs_0_bits_uop_dst_rtype),
    .io_req_bits_uop_lrs1_rtype            (_fregister_read_io_exe_reqs_0_bits_uop_lrs1_rtype),
    .io_req_bits_uop_lrs2_rtype            (_fregister_read_io_exe_reqs_0_bits_uop_lrs2_rtype),
    .io_req_bits_uop_frs3_en               (_fregister_read_io_exe_reqs_0_bits_uop_frs3_en),
    .io_req_bits_uop_fp_val                (_fregister_read_io_exe_reqs_0_bits_uop_fp_val),
    .io_req_bits_uop_fp_single             (_fregister_read_io_exe_reqs_0_bits_uop_fp_single),
    .io_req_bits_uop_xcpt_pf_if            (_fregister_read_io_exe_reqs_0_bits_uop_xcpt_pf_if),
    .io_req_bits_uop_xcpt_ae_if            (_fregister_read_io_exe_reqs_0_bits_uop_xcpt_ae_if),
    .io_req_bits_uop_xcpt_ma_if            (_fregister_read_io_exe_reqs_0_bits_uop_xcpt_ma_if),
    .io_req_bits_uop_bp_debug_if           (_fregister_read_io_exe_reqs_0_bits_uop_bp_debug_if),
    .io_req_bits_uop_bp_xcpt_if            (_fregister_read_io_exe_reqs_0_bits_uop_bp_xcpt_if),
    .io_req_bits_uop_debug_fsrc            (_fregister_read_io_exe_reqs_0_bits_uop_debug_fsrc),
    .io_req_bits_uop_debug_tsrc            (_fregister_read_io_exe_reqs_0_bits_uop_debug_tsrc),
    .io_req_bits_rs1_data                  (_fregister_read_io_exe_reqs_0_bits_rs1_data),
    .io_req_bits_rs2_data                  (_fregister_read_io_exe_reqs_0_bits_rs2_data),
    .io_req_bits_rs3_data                  (_fregister_read_io_exe_reqs_0_bits_rs3_data),
    .io_req_bits_kill                      (io_flush_pipeline),
    .io_fresp_valid                        (_fpu_exe_unit_io_fresp_valid),
    .io_fresp_bits_uop_rob_idx             (io_wakeups_2_bits_uop_rob_idx),
    .io_fresp_bits_uop_pdst                (_fpu_exe_unit_io_fresp_bits_uop_pdst),
    .io_fresp_bits_uop_is_amo              (_fpu_exe_unit_io_fresp_bits_uop_is_amo),
    .io_fresp_bits_uop_uses_ldq            (_fpu_exe_unit_io_fresp_bits_uop_uses_ldq),
    .io_fresp_bits_uop_uses_stq            (_fpu_exe_unit_io_fresp_bits_uop_uses_stq),
    .io_fresp_bits_uop_dst_rtype           (_fpu_exe_unit_io_fresp_bits_uop_dst_rtype),
    .io_fresp_bits_uop_fp_val              (io_wakeups_2_bits_uop_fp_val),
    .io_fresp_bits_data                    (_fpu_exe_unit_io_fresp_bits_data),
    .io_fresp_bits_fflags_valid            (io_wakeups_2_bits_fflags_valid),
    .io_fresp_bits_fflags_bits_uop_rob_idx (io_wakeups_2_bits_fflags_bits_uop_rob_idx),
    .io_fresp_bits_fflags_bits_flags       (io_wakeups_2_bits_fflags_bits_flags),
    .io_ll_iresp_ready                     (_fpu_exe_unit_io_ll_iresp_ready_T),
    .io_ll_iresp_valid                     (_fpu_exe_unit_io_ll_iresp_valid),
    .io_ll_iresp_bits_uop_uopc             (_fpu_exe_unit_io_ll_iresp_bits_uop_uopc),
    .io_ll_iresp_bits_uop_br_mask          (io_to_sdq_bits_uop_br_mask),
    .io_ll_iresp_bits_uop_rob_idx          (_fpu_exe_unit_io_ll_iresp_bits_uop_rob_idx),
    .io_ll_iresp_bits_uop_stq_idx          (io_to_sdq_bits_uop_stq_idx),
    .io_ll_iresp_bits_uop_pdst             (io_to_int_bits_uop_pdst),
    .io_ll_iresp_bits_uop_is_amo           (io_to_int_bits_uop_is_amo),
    .io_ll_iresp_bits_uop_uses_stq         (io_to_int_bits_uop_uses_stq),
    .io_ll_iresp_bits_uop_dst_rtype        (io_to_int_bits_uop_dst_rtype),
    .io_ll_iresp_bits_data                 (_fpu_exe_unit_io_ll_iresp_bits_data),
    .io_ll_iresp_bits_predicated           (io_to_int_bits_predicated),
    .io_brupdate_b1_resolve_mask           (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask        (io_brupdate_b1_mispredict_mask),
    .io_fcsr_rm                            (io_fcsr_rm)
  );
  FPUExeUnit_1 fpu_exe_unit_1 (
    .clock                                 (clock),
    .reset                                 (reset),
    .io_req_valid                          (_fregister_read_io_exe_reqs_1_valid),
    .io_req_bits_uop_uopc                  (_fregister_read_io_exe_reqs_1_bits_uop_uopc),
    .io_req_bits_uop_inst                  (_fregister_read_io_exe_reqs_1_bits_uop_inst),
    .io_req_bits_uop_debug_inst            (_fregister_read_io_exe_reqs_1_bits_uop_debug_inst),
    .io_req_bits_uop_is_rvc                (_fregister_read_io_exe_reqs_1_bits_uop_is_rvc),
    .io_req_bits_uop_debug_pc              (_fregister_read_io_exe_reqs_1_bits_uop_debug_pc),
    .io_req_bits_uop_iq_type               (_fregister_read_io_exe_reqs_1_bits_uop_iq_type),
    .io_req_bits_uop_fu_code               (_fregister_read_io_exe_reqs_1_bits_uop_fu_code),
    .io_req_bits_uop_ctrl_br_type          (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel          (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel          (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel          (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn           (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw           (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_ctrl_csr_cmd          (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_csr_cmd),
    .io_req_bits_uop_ctrl_is_load          (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_is_load),
    .io_req_bits_uop_ctrl_is_sta           (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_is_sta),
    .io_req_bits_uop_ctrl_is_std           (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_is_std),
    .io_req_bits_uop_iw_state              (_fregister_read_io_exe_reqs_1_bits_uop_iw_state),
    .io_req_bits_uop_iw_p1_poisoned        (_fregister_read_io_exe_reqs_1_bits_uop_iw_p1_poisoned),
    .io_req_bits_uop_iw_p2_poisoned        (_fregister_read_io_exe_reqs_1_bits_uop_iw_p2_poisoned),
    .io_req_bits_uop_is_br                 (_fregister_read_io_exe_reqs_1_bits_uop_is_br),
    .io_req_bits_uop_is_jalr               (_fregister_read_io_exe_reqs_1_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal                (_fregister_read_io_exe_reqs_1_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb                (_fregister_read_io_exe_reqs_1_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask               (_fregister_read_io_exe_reqs_1_bits_uop_br_mask),
    .io_req_bits_uop_br_tag                (_fregister_read_io_exe_reqs_1_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx               (_fregister_read_io_exe_reqs_1_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst             (_fregister_read_io_exe_reqs_1_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob                (_fregister_read_io_exe_reqs_1_bits_uop_pc_lob),
    .io_req_bits_uop_taken                 (_fregister_read_io_exe_reqs_1_bits_uop_taken),
    .io_req_bits_uop_imm_packed            (_fregister_read_io_exe_reqs_1_bits_uop_imm_packed),
    .io_req_bits_uop_csr_addr              (_fregister_read_io_exe_reqs_1_bits_uop_csr_addr),
    .io_req_bits_uop_rob_idx               (_fregister_read_io_exe_reqs_1_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx               (_fregister_read_io_exe_reqs_1_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx               (_fregister_read_io_exe_reqs_1_bits_uop_stq_idx),
    .io_req_bits_uop_rxq_idx               (_fregister_read_io_exe_reqs_1_bits_uop_rxq_idx),
    .io_req_bits_uop_pdst                  (_fregister_read_io_exe_reqs_1_bits_uop_pdst),
    .io_req_bits_uop_prs1                  (_fregister_read_io_exe_reqs_1_bits_uop_prs1),
    .io_req_bits_uop_prs2                  (_fregister_read_io_exe_reqs_1_bits_uop_prs2),
    .io_req_bits_uop_prs3                  (_fregister_read_io_exe_reqs_1_bits_uop_prs3),
    .io_req_bits_uop_ppred                 (_fregister_read_io_exe_reqs_1_bits_uop_ppred),
    .io_req_bits_uop_prs1_busy             (_fregister_read_io_exe_reqs_1_bits_uop_prs1_busy),
    .io_req_bits_uop_prs2_busy             (_fregister_read_io_exe_reqs_1_bits_uop_prs2_busy),
    .io_req_bits_uop_prs3_busy             (_fregister_read_io_exe_reqs_1_bits_uop_prs3_busy),
    .io_req_bits_uop_ppred_busy            (_fregister_read_io_exe_reqs_1_bits_uop_ppred_busy),
    .io_req_bits_uop_stale_pdst            (_fregister_read_io_exe_reqs_1_bits_uop_stale_pdst),
    .io_req_bits_uop_exception             (_fregister_read_io_exe_reqs_1_bits_uop_exception),
    .io_req_bits_uop_exc_cause             (_fregister_read_io_exe_reqs_1_bits_uop_exc_cause),
    .io_req_bits_uop_bypassable            (_fregister_read_io_exe_reqs_1_bits_uop_bypassable),
    .io_req_bits_uop_mem_cmd               (_fregister_read_io_exe_reqs_1_bits_uop_mem_cmd),
    .io_req_bits_uop_mem_size              (_fregister_read_io_exe_reqs_1_bits_uop_mem_size),
    .io_req_bits_uop_mem_signed            (_fregister_read_io_exe_reqs_1_bits_uop_mem_signed),
    .io_req_bits_uop_is_fence              (_fregister_read_io_exe_reqs_1_bits_uop_is_fence),
    .io_req_bits_uop_is_fencei             (_fregister_read_io_exe_reqs_1_bits_uop_is_fencei),
    .io_req_bits_uop_is_amo                (_fregister_read_io_exe_reqs_1_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq              (_fregister_read_io_exe_reqs_1_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq              (_fregister_read_io_exe_reqs_1_bits_uop_uses_stq),
    .io_req_bits_uop_is_sys_pc2epc         (_fregister_read_io_exe_reqs_1_bits_uop_is_sys_pc2epc),
    .io_req_bits_uop_is_unique             (_fregister_read_io_exe_reqs_1_bits_uop_is_unique),
    .io_req_bits_uop_flush_on_commit       (_fregister_read_io_exe_reqs_1_bits_uop_flush_on_commit),
    .io_req_bits_uop_ldst_is_rs1           (_fregister_read_io_exe_reqs_1_bits_uop_ldst_is_rs1),
    .io_req_bits_uop_ldst                  (_fregister_read_io_exe_reqs_1_bits_uop_ldst),
    .io_req_bits_uop_lrs1                  (_fregister_read_io_exe_reqs_1_bits_uop_lrs1),
    .io_req_bits_uop_lrs2                  (_fregister_read_io_exe_reqs_1_bits_uop_lrs2),
    .io_req_bits_uop_lrs3                  (_fregister_read_io_exe_reqs_1_bits_uop_lrs3),
    .io_req_bits_uop_ldst_val              (_fregister_read_io_exe_reqs_1_bits_uop_ldst_val),
    .io_req_bits_uop_dst_rtype             (_fregister_read_io_exe_reqs_1_bits_uop_dst_rtype),
    .io_req_bits_uop_lrs1_rtype            (_fregister_read_io_exe_reqs_1_bits_uop_lrs1_rtype),
    .io_req_bits_uop_lrs2_rtype            (_fregister_read_io_exe_reqs_1_bits_uop_lrs2_rtype),
    .io_req_bits_uop_frs3_en               (_fregister_read_io_exe_reqs_1_bits_uop_frs3_en),
    .io_req_bits_uop_fp_val                (_fregister_read_io_exe_reqs_1_bits_uop_fp_val),
    .io_req_bits_uop_fp_single             (_fregister_read_io_exe_reqs_1_bits_uop_fp_single),
    .io_req_bits_uop_xcpt_pf_if            (_fregister_read_io_exe_reqs_1_bits_uop_xcpt_pf_if),
    .io_req_bits_uop_xcpt_ae_if            (_fregister_read_io_exe_reqs_1_bits_uop_xcpt_ae_if),
    .io_req_bits_uop_xcpt_ma_if            (_fregister_read_io_exe_reqs_1_bits_uop_xcpt_ma_if),
    .io_req_bits_uop_bp_debug_if           (_fregister_read_io_exe_reqs_1_bits_uop_bp_debug_if),
    .io_req_bits_uop_bp_xcpt_if            (_fregister_read_io_exe_reqs_1_bits_uop_bp_xcpt_if),
    .io_req_bits_uop_debug_fsrc            (_fregister_read_io_exe_reqs_1_bits_uop_debug_fsrc),
    .io_req_bits_uop_debug_tsrc            (_fregister_read_io_exe_reqs_1_bits_uop_debug_tsrc),
    .io_req_bits_rs1_data                  (_fregister_read_io_exe_reqs_1_bits_rs1_data),
    .io_req_bits_rs2_data                  (_fregister_read_io_exe_reqs_1_bits_rs2_data),
    .io_req_bits_rs3_data                  (_fregister_read_io_exe_reqs_1_bits_rs3_data),
    .io_req_bits_kill                      (io_flush_pipeline),
    .io_fresp_valid                        (_fpu_exe_unit_1_io_fresp_valid),
    .io_fresp_bits_uop_rob_idx             (io_wakeups_3_bits_uop_rob_idx),
    .io_fresp_bits_uop_pdst                (_fpu_exe_unit_1_io_fresp_bits_uop_pdst),
    .io_fresp_bits_uop_is_amo              (_fpu_exe_unit_1_io_fresp_bits_uop_is_amo),
    .io_fresp_bits_uop_uses_ldq            (_fpu_exe_unit_1_io_fresp_bits_uop_uses_ldq),
    .io_fresp_bits_uop_uses_stq            (_fpu_exe_unit_1_io_fresp_bits_uop_uses_stq),
    .io_fresp_bits_uop_dst_rtype           (_fpu_exe_unit_1_io_fresp_bits_uop_dst_rtype),
    .io_fresp_bits_uop_fp_val              (io_wakeups_3_bits_uop_fp_val),
    .io_fresp_bits_data                    (_fpu_exe_unit_1_io_fresp_bits_data),
    .io_fresp_bits_fflags_valid            (io_wakeups_3_bits_fflags_valid),
    .io_fresp_bits_fflags_bits_uop_rob_idx (io_wakeups_3_bits_fflags_bits_uop_rob_idx),
    .io_fresp_bits_fflags_bits_flags       (io_wakeups_3_bits_fflags_bits_flags),
    .io_brupdate_b1_resolve_mask           (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask        (io_brupdate_b1_mispredict_mask),
    .io_fcsr_rm                            (io_fcsr_rm)
  );
  IssueUnitCollapsing fp_issue_unit (
    .clock                              (clock),
    .reset                              (reset),
    .io_dis_uops_0_ready                (io_dis_uops_0_ready),
    .io_dis_uops_0_valid                (io_dis_uops_0_valid),
    .io_dis_uops_0_bits_uopc            (io_dis_uops_0_bits_uopc),
    .io_dis_uops_0_bits_inst            (io_dis_uops_0_bits_inst),
    .io_dis_uops_0_bits_debug_inst      (io_dis_uops_0_bits_debug_inst),
    .io_dis_uops_0_bits_is_rvc          (io_dis_uops_0_bits_is_rvc),
    .io_dis_uops_0_bits_debug_pc        (io_dis_uops_0_bits_debug_pc),
    .io_dis_uops_0_bits_iq_type         (io_dis_uops_0_bits_iq_type),
    .io_dis_uops_0_bits_fu_code         (io_dis_uops_0_bits_fu_code),
    .io_dis_uops_0_bits_is_br           (io_dis_uops_0_bits_is_br),
    .io_dis_uops_0_bits_is_jalr         (io_dis_uops_0_bits_is_jalr),
    .io_dis_uops_0_bits_is_jal          (io_dis_uops_0_bits_is_jal),
    .io_dis_uops_0_bits_is_sfb          (io_dis_uops_0_bits_is_sfb),
    .io_dis_uops_0_bits_br_mask         (io_dis_uops_0_bits_br_mask),
    .io_dis_uops_0_bits_br_tag          (io_dis_uops_0_bits_br_tag),
    .io_dis_uops_0_bits_ftq_idx         (io_dis_uops_0_bits_ftq_idx),
    .io_dis_uops_0_bits_edge_inst       (io_dis_uops_0_bits_edge_inst),
    .io_dis_uops_0_bits_pc_lob          (io_dis_uops_0_bits_pc_lob),
    .io_dis_uops_0_bits_taken           (io_dis_uops_0_bits_taken),
    .io_dis_uops_0_bits_imm_packed      (io_dis_uops_0_bits_imm_packed),
    .io_dis_uops_0_bits_csr_addr        (io_dis_uops_0_bits_csr_addr),
    .io_dis_uops_0_bits_rob_idx         (io_dis_uops_0_bits_rob_idx),
    .io_dis_uops_0_bits_ldq_idx         (io_dis_uops_0_bits_ldq_idx),
    .io_dis_uops_0_bits_stq_idx         (io_dis_uops_0_bits_stq_idx),
    .io_dis_uops_0_bits_rxq_idx         (io_dis_uops_0_bits_rxq_idx),
    .io_dis_uops_0_bits_pdst            (io_dis_uops_0_bits_pdst),
    .io_dis_uops_0_bits_prs1            (io_dis_uops_0_bits_prs1),
    .io_dis_uops_0_bits_prs2            (io_dis_uops_0_bits_prs2),
    .io_dis_uops_0_bits_prs3            (io_dis_uops_0_bits_prs3),
    .io_dis_uops_0_bits_prs1_busy       (io_dis_uops_0_bits_prs1_busy),
    .io_dis_uops_0_bits_prs2_busy       (io_dis_uops_0_bits_prs2_busy),
    .io_dis_uops_0_bits_prs3_busy       (io_dis_uops_0_bits_prs3_busy),
    .io_dis_uops_0_bits_stale_pdst      (io_dis_uops_0_bits_stale_pdst),
    .io_dis_uops_0_bits_exception       (io_dis_uops_0_bits_exception),
    .io_dis_uops_0_bits_exc_cause       (io_dis_uops_0_bits_exc_cause),
    .io_dis_uops_0_bits_bypassable      (io_dis_uops_0_bits_bypassable),
    .io_dis_uops_0_bits_mem_cmd         (io_dis_uops_0_bits_mem_cmd),
    .io_dis_uops_0_bits_mem_size        (io_dis_uops_0_bits_mem_size),
    .io_dis_uops_0_bits_mem_signed      (io_dis_uops_0_bits_mem_signed),
    .io_dis_uops_0_bits_is_fence        (io_dis_uops_0_bits_is_fence),
    .io_dis_uops_0_bits_is_fencei       (io_dis_uops_0_bits_is_fencei),
    .io_dis_uops_0_bits_is_amo          (io_dis_uops_0_bits_is_amo),
    .io_dis_uops_0_bits_uses_ldq        (io_dis_uops_0_bits_uses_ldq),
    .io_dis_uops_0_bits_uses_stq        (io_dis_uops_0_bits_uses_stq),
    .io_dis_uops_0_bits_is_sys_pc2epc   (io_dis_uops_0_bits_is_sys_pc2epc),
    .io_dis_uops_0_bits_is_unique       (io_dis_uops_0_bits_is_unique),
    .io_dis_uops_0_bits_flush_on_commit (io_dis_uops_0_bits_flush_on_commit),
    .io_dis_uops_0_bits_ldst_is_rs1     (io_dis_uops_0_bits_ldst_is_rs1),
    .io_dis_uops_0_bits_ldst            (io_dis_uops_0_bits_ldst),
    .io_dis_uops_0_bits_lrs1            (io_dis_uops_0_bits_lrs1),
    .io_dis_uops_0_bits_lrs2            (io_dis_uops_0_bits_lrs2),
    .io_dis_uops_0_bits_lrs3            (io_dis_uops_0_bits_lrs3),
    .io_dis_uops_0_bits_ldst_val        (io_dis_uops_0_bits_ldst_val),
    .io_dis_uops_0_bits_dst_rtype       (io_dis_uops_0_bits_dst_rtype),
    .io_dis_uops_0_bits_lrs1_rtype      (io_dis_uops_0_bits_lrs1_rtype),
    .io_dis_uops_0_bits_lrs2_rtype      (io_dis_uops_0_bits_lrs2_rtype),
    .io_dis_uops_0_bits_frs3_en         (io_dis_uops_0_bits_frs3_en),
    .io_dis_uops_0_bits_fp_val          (io_dis_uops_0_bits_fp_val),
    .io_dis_uops_0_bits_fp_single       (io_dis_uops_0_bits_fp_single),
    .io_dis_uops_0_bits_xcpt_pf_if      (io_dis_uops_0_bits_xcpt_pf_if),
    .io_dis_uops_0_bits_xcpt_ae_if      (io_dis_uops_0_bits_xcpt_ae_if),
    .io_dis_uops_0_bits_xcpt_ma_if      (io_dis_uops_0_bits_xcpt_ma_if),
    .io_dis_uops_0_bits_bp_debug_if     (io_dis_uops_0_bits_bp_debug_if),
    .io_dis_uops_0_bits_bp_xcpt_if      (io_dis_uops_0_bits_bp_xcpt_if),
    .io_dis_uops_0_bits_debug_fsrc      (io_dis_uops_0_bits_debug_fsrc),
    .io_dis_uops_0_bits_debug_tsrc      (io_dis_uops_0_bits_debug_tsrc),
    .io_dis_uops_1_ready                (io_dis_uops_1_ready),
    .io_dis_uops_1_valid                (io_dis_uops_1_valid),
    .io_dis_uops_1_bits_uopc            (io_dis_uops_1_bits_uopc),
    .io_dis_uops_1_bits_inst            (io_dis_uops_1_bits_inst),
    .io_dis_uops_1_bits_debug_inst      (io_dis_uops_1_bits_debug_inst),
    .io_dis_uops_1_bits_is_rvc          (io_dis_uops_1_bits_is_rvc),
    .io_dis_uops_1_bits_debug_pc        (io_dis_uops_1_bits_debug_pc),
    .io_dis_uops_1_bits_iq_type         (io_dis_uops_1_bits_iq_type),
    .io_dis_uops_1_bits_fu_code         (io_dis_uops_1_bits_fu_code),
    .io_dis_uops_1_bits_is_br           (io_dis_uops_1_bits_is_br),
    .io_dis_uops_1_bits_is_jalr         (io_dis_uops_1_bits_is_jalr),
    .io_dis_uops_1_bits_is_jal          (io_dis_uops_1_bits_is_jal),
    .io_dis_uops_1_bits_is_sfb          (io_dis_uops_1_bits_is_sfb),
    .io_dis_uops_1_bits_br_mask         (io_dis_uops_1_bits_br_mask),
    .io_dis_uops_1_bits_br_tag          (io_dis_uops_1_bits_br_tag),
    .io_dis_uops_1_bits_ftq_idx         (io_dis_uops_1_bits_ftq_idx),
    .io_dis_uops_1_bits_edge_inst       (io_dis_uops_1_bits_edge_inst),
    .io_dis_uops_1_bits_pc_lob          (io_dis_uops_1_bits_pc_lob),
    .io_dis_uops_1_bits_taken           (io_dis_uops_1_bits_taken),
    .io_dis_uops_1_bits_imm_packed      (io_dis_uops_1_bits_imm_packed),
    .io_dis_uops_1_bits_csr_addr        (io_dis_uops_1_bits_csr_addr),
    .io_dis_uops_1_bits_rob_idx         (io_dis_uops_1_bits_rob_idx),
    .io_dis_uops_1_bits_ldq_idx         (io_dis_uops_1_bits_ldq_idx),
    .io_dis_uops_1_bits_stq_idx         (io_dis_uops_1_bits_stq_idx),
    .io_dis_uops_1_bits_rxq_idx         (io_dis_uops_1_bits_rxq_idx),
    .io_dis_uops_1_bits_pdst            (io_dis_uops_1_bits_pdst),
    .io_dis_uops_1_bits_prs1            (io_dis_uops_1_bits_prs1),
    .io_dis_uops_1_bits_prs2            (io_dis_uops_1_bits_prs2),
    .io_dis_uops_1_bits_prs3            (io_dis_uops_1_bits_prs3),
    .io_dis_uops_1_bits_prs1_busy       (io_dis_uops_1_bits_prs1_busy),
    .io_dis_uops_1_bits_prs2_busy       (io_dis_uops_1_bits_prs2_busy),
    .io_dis_uops_1_bits_prs3_busy       (io_dis_uops_1_bits_prs3_busy),
    .io_dis_uops_1_bits_stale_pdst      (io_dis_uops_1_bits_stale_pdst),
    .io_dis_uops_1_bits_exception       (io_dis_uops_1_bits_exception),
    .io_dis_uops_1_bits_exc_cause       (io_dis_uops_1_bits_exc_cause),
    .io_dis_uops_1_bits_bypassable      (io_dis_uops_1_bits_bypassable),
    .io_dis_uops_1_bits_mem_cmd         (io_dis_uops_1_bits_mem_cmd),
    .io_dis_uops_1_bits_mem_size        (io_dis_uops_1_bits_mem_size),
    .io_dis_uops_1_bits_mem_signed      (io_dis_uops_1_bits_mem_signed),
    .io_dis_uops_1_bits_is_fence        (io_dis_uops_1_bits_is_fence),
    .io_dis_uops_1_bits_is_fencei       (io_dis_uops_1_bits_is_fencei),
    .io_dis_uops_1_bits_is_amo          (io_dis_uops_1_bits_is_amo),
    .io_dis_uops_1_bits_uses_ldq        (io_dis_uops_1_bits_uses_ldq),
    .io_dis_uops_1_bits_uses_stq        (io_dis_uops_1_bits_uses_stq),
    .io_dis_uops_1_bits_is_sys_pc2epc   (io_dis_uops_1_bits_is_sys_pc2epc),
    .io_dis_uops_1_bits_is_unique       (io_dis_uops_1_bits_is_unique),
    .io_dis_uops_1_bits_flush_on_commit (io_dis_uops_1_bits_flush_on_commit),
    .io_dis_uops_1_bits_ldst_is_rs1     (io_dis_uops_1_bits_ldst_is_rs1),
    .io_dis_uops_1_bits_ldst            (io_dis_uops_1_bits_ldst),
    .io_dis_uops_1_bits_lrs1            (io_dis_uops_1_bits_lrs1),
    .io_dis_uops_1_bits_lrs2            (io_dis_uops_1_bits_lrs2),
    .io_dis_uops_1_bits_lrs3            (io_dis_uops_1_bits_lrs3),
    .io_dis_uops_1_bits_ldst_val        (io_dis_uops_1_bits_ldst_val),
    .io_dis_uops_1_bits_dst_rtype       (io_dis_uops_1_bits_dst_rtype),
    .io_dis_uops_1_bits_lrs1_rtype      (io_dis_uops_1_bits_lrs1_rtype),
    .io_dis_uops_1_bits_lrs2_rtype      (io_dis_uops_1_bits_lrs2_rtype),
    .io_dis_uops_1_bits_frs3_en         (io_dis_uops_1_bits_frs3_en),
    .io_dis_uops_1_bits_fp_val          (io_dis_uops_1_bits_fp_val),
    .io_dis_uops_1_bits_fp_single       (io_dis_uops_1_bits_fp_single),
    .io_dis_uops_1_bits_xcpt_pf_if      (io_dis_uops_1_bits_xcpt_pf_if),
    .io_dis_uops_1_bits_xcpt_ae_if      (io_dis_uops_1_bits_xcpt_ae_if),
    .io_dis_uops_1_bits_xcpt_ma_if      (io_dis_uops_1_bits_xcpt_ma_if),
    .io_dis_uops_1_bits_bp_debug_if     (io_dis_uops_1_bits_bp_debug_if),
    .io_dis_uops_1_bits_bp_xcpt_if      (io_dis_uops_1_bits_bp_xcpt_if),
    .io_dis_uops_1_bits_debug_fsrc      (io_dis_uops_1_bits_debug_fsrc),
    .io_dis_uops_1_bits_debug_tsrc      (io_dis_uops_1_bits_debug_tsrc),
    .io_dis_uops_2_ready                (io_dis_uops_2_ready),
    .io_dis_uops_2_valid                (io_dis_uops_2_valid),
    .io_dis_uops_2_bits_uopc            (io_dis_uops_2_bits_uopc),
    .io_dis_uops_2_bits_inst            (io_dis_uops_2_bits_inst),
    .io_dis_uops_2_bits_debug_inst      (io_dis_uops_2_bits_debug_inst),
    .io_dis_uops_2_bits_is_rvc          (io_dis_uops_2_bits_is_rvc),
    .io_dis_uops_2_bits_debug_pc        (io_dis_uops_2_bits_debug_pc),
    .io_dis_uops_2_bits_iq_type         (io_dis_uops_2_bits_iq_type),
    .io_dis_uops_2_bits_fu_code         (io_dis_uops_2_bits_fu_code),
    .io_dis_uops_2_bits_is_br           (io_dis_uops_2_bits_is_br),
    .io_dis_uops_2_bits_is_jalr         (io_dis_uops_2_bits_is_jalr),
    .io_dis_uops_2_bits_is_jal          (io_dis_uops_2_bits_is_jal),
    .io_dis_uops_2_bits_is_sfb          (io_dis_uops_2_bits_is_sfb),
    .io_dis_uops_2_bits_br_mask         (io_dis_uops_2_bits_br_mask),
    .io_dis_uops_2_bits_br_tag          (io_dis_uops_2_bits_br_tag),
    .io_dis_uops_2_bits_ftq_idx         (io_dis_uops_2_bits_ftq_idx),
    .io_dis_uops_2_bits_edge_inst       (io_dis_uops_2_bits_edge_inst),
    .io_dis_uops_2_bits_pc_lob          (io_dis_uops_2_bits_pc_lob),
    .io_dis_uops_2_bits_taken           (io_dis_uops_2_bits_taken),
    .io_dis_uops_2_bits_imm_packed      (io_dis_uops_2_bits_imm_packed),
    .io_dis_uops_2_bits_csr_addr        (io_dis_uops_2_bits_csr_addr),
    .io_dis_uops_2_bits_rob_idx         (io_dis_uops_2_bits_rob_idx),
    .io_dis_uops_2_bits_ldq_idx         (io_dis_uops_2_bits_ldq_idx),
    .io_dis_uops_2_bits_stq_idx         (io_dis_uops_2_bits_stq_idx),
    .io_dis_uops_2_bits_rxq_idx         (io_dis_uops_2_bits_rxq_idx),
    .io_dis_uops_2_bits_pdst            (io_dis_uops_2_bits_pdst),
    .io_dis_uops_2_bits_prs1            (io_dis_uops_2_bits_prs1),
    .io_dis_uops_2_bits_prs2            (io_dis_uops_2_bits_prs2),
    .io_dis_uops_2_bits_prs3            (io_dis_uops_2_bits_prs3),
    .io_dis_uops_2_bits_prs1_busy       (io_dis_uops_2_bits_prs1_busy),
    .io_dis_uops_2_bits_prs2_busy       (io_dis_uops_2_bits_prs2_busy),
    .io_dis_uops_2_bits_prs3_busy       (io_dis_uops_2_bits_prs3_busy),
    .io_dis_uops_2_bits_stale_pdst      (io_dis_uops_2_bits_stale_pdst),
    .io_dis_uops_2_bits_exception       (io_dis_uops_2_bits_exception),
    .io_dis_uops_2_bits_exc_cause       (io_dis_uops_2_bits_exc_cause),
    .io_dis_uops_2_bits_bypassable      (io_dis_uops_2_bits_bypassable),
    .io_dis_uops_2_bits_mem_cmd         (io_dis_uops_2_bits_mem_cmd),
    .io_dis_uops_2_bits_mem_size        (io_dis_uops_2_bits_mem_size),
    .io_dis_uops_2_bits_mem_signed      (io_dis_uops_2_bits_mem_signed),
    .io_dis_uops_2_bits_is_fence        (io_dis_uops_2_bits_is_fence),
    .io_dis_uops_2_bits_is_fencei       (io_dis_uops_2_bits_is_fencei),
    .io_dis_uops_2_bits_is_amo          (io_dis_uops_2_bits_is_amo),
    .io_dis_uops_2_bits_uses_ldq        (io_dis_uops_2_bits_uses_ldq),
    .io_dis_uops_2_bits_uses_stq        (io_dis_uops_2_bits_uses_stq),
    .io_dis_uops_2_bits_is_sys_pc2epc   (io_dis_uops_2_bits_is_sys_pc2epc),
    .io_dis_uops_2_bits_is_unique       (io_dis_uops_2_bits_is_unique),
    .io_dis_uops_2_bits_flush_on_commit (io_dis_uops_2_bits_flush_on_commit),
    .io_dis_uops_2_bits_ldst_is_rs1     (io_dis_uops_2_bits_ldst_is_rs1),
    .io_dis_uops_2_bits_ldst            (io_dis_uops_2_bits_ldst),
    .io_dis_uops_2_bits_lrs1            (io_dis_uops_2_bits_lrs1),
    .io_dis_uops_2_bits_lrs2            (io_dis_uops_2_bits_lrs2),
    .io_dis_uops_2_bits_lrs3            (io_dis_uops_2_bits_lrs3),
    .io_dis_uops_2_bits_ldst_val        (io_dis_uops_2_bits_ldst_val),
    .io_dis_uops_2_bits_dst_rtype       (io_dis_uops_2_bits_dst_rtype),
    .io_dis_uops_2_bits_lrs1_rtype      (io_dis_uops_2_bits_lrs1_rtype),
    .io_dis_uops_2_bits_lrs2_rtype      (io_dis_uops_2_bits_lrs2_rtype),
    .io_dis_uops_2_bits_frs3_en         (io_dis_uops_2_bits_frs3_en),
    .io_dis_uops_2_bits_fp_val          (io_dis_uops_2_bits_fp_val),
    .io_dis_uops_2_bits_fp_single       (io_dis_uops_2_bits_fp_single),
    .io_dis_uops_2_bits_xcpt_pf_if      (io_dis_uops_2_bits_xcpt_pf_if),
    .io_dis_uops_2_bits_xcpt_ae_if      (io_dis_uops_2_bits_xcpt_ae_if),
    .io_dis_uops_2_bits_xcpt_ma_if      (io_dis_uops_2_bits_xcpt_ma_if),
    .io_dis_uops_2_bits_bp_debug_if     (io_dis_uops_2_bits_bp_debug_if),
    .io_dis_uops_2_bits_bp_xcpt_if      (io_dis_uops_2_bits_bp_xcpt_if),
    .io_dis_uops_2_bits_debug_fsrc      (io_dis_uops_2_bits_debug_fsrc),
    .io_dis_uops_2_bits_debug_tsrc      (io_dis_uops_2_bits_debug_tsrc),
    .io_dis_uops_3_ready                (io_dis_uops_3_ready),
    .io_dis_uops_3_valid                (io_dis_uops_3_valid),
    .io_dis_uops_3_bits_uopc            (io_dis_uops_3_bits_uopc),
    .io_dis_uops_3_bits_inst            (io_dis_uops_3_bits_inst),
    .io_dis_uops_3_bits_debug_inst      (io_dis_uops_3_bits_debug_inst),
    .io_dis_uops_3_bits_is_rvc          (io_dis_uops_3_bits_is_rvc),
    .io_dis_uops_3_bits_debug_pc        (io_dis_uops_3_bits_debug_pc),
    .io_dis_uops_3_bits_iq_type         (io_dis_uops_3_bits_iq_type),
    .io_dis_uops_3_bits_fu_code         (io_dis_uops_3_bits_fu_code),
    .io_dis_uops_3_bits_is_br           (io_dis_uops_3_bits_is_br),
    .io_dis_uops_3_bits_is_jalr         (io_dis_uops_3_bits_is_jalr),
    .io_dis_uops_3_bits_is_jal          (io_dis_uops_3_bits_is_jal),
    .io_dis_uops_3_bits_is_sfb          (io_dis_uops_3_bits_is_sfb),
    .io_dis_uops_3_bits_br_mask         (io_dis_uops_3_bits_br_mask),
    .io_dis_uops_3_bits_br_tag          (io_dis_uops_3_bits_br_tag),
    .io_dis_uops_3_bits_ftq_idx         (io_dis_uops_3_bits_ftq_idx),
    .io_dis_uops_3_bits_edge_inst       (io_dis_uops_3_bits_edge_inst),
    .io_dis_uops_3_bits_pc_lob          (io_dis_uops_3_bits_pc_lob),
    .io_dis_uops_3_bits_taken           (io_dis_uops_3_bits_taken),
    .io_dis_uops_3_bits_imm_packed      (io_dis_uops_3_bits_imm_packed),
    .io_dis_uops_3_bits_csr_addr        (io_dis_uops_3_bits_csr_addr),
    .io_dis_uops_3_bits_rob_idx         (io_dis_uops_3_bits_rob_idx),
    .io_dis_uops_3_bits_ldq_idx         (io_dis_uops_3_bits_ldq_idx),
    .io_dis_uops_3_bits_stq_idx         (io_dis_uops_3_bits_stq_idx),
    .io_dis_uops_3_bits_rxq_idx         (io_dis_uops_3_bits_rxq_idx),
    .io_dis_uops_3_bits_pdst            (io_dis_uops_3_bits_pdst),
    .io_dis_uops_3_bits_prs1            (io_dis_uops_3_bits_prs1),
    .io_dis_uops_3_bits_prs2            (io_dis_uops_3_bits_prs2),
    .io_dis_uops_3_bits_prs3            (io_dis_uops_3_bits_prs3),
    .io_dis_uops_3_bits_prs1_busy       (io_dis_uops_3_bits_prs1_busy),
    .io_dis_uops_3_bits_prs2_busy       (io_dis_uops_3_bits_prs2_busy),
    .io_dis_uops_3_bits_prs3_busy       (io_dis_uops_3_bits_prs3_busy),
    .io_dis_uops_3_bits_stale_pdst      (io_dis_uops_3_bits_stale_pdst),
    .io_dis_uops_3_bits_exception       (io_dis_uops_3_bits_exception),
    .io_dis_uops_3_bits_exc_cause       (io_dis_uops_3_bits_exc_cause),
    .io_dis_uops_3_bits_bypassable      (io_dis_uops_3_bits_bypassable),
    .io_dis_uops_3_bits_mem_cmd         (io_dis_uops_3_bits_mem_cmd),
    .io_dis_uops_3_bits_mem_size        (io_dis_uops_3_bits_mem_size),
    .io_dis_uops_3_bits_mem_signed      (io_dis_uops_3_bits_mem_signed),
    .io_dis_uops_3_bits_is_fence        (io_dis_uops_3_bits_is_fence),
    .io_dis_uops_3_bits_is_fencei       (io_dis_uops_3_bits_is_fencei),
    .io_dis_uops_3_bits_is_amo          (io_dis_uops_3_bits_is_amo),
    .io_dis_uops_3_bits_uses_ldq        (io_dis_uops_3_bits_uses_ldq),
    .io_dis_uops_3_bits_uses_stq        (io_dis_uops_3_bits_uses_stq),
    .io_dis_uops_3_bits_is_sys_pc2epc   (io_dis_uops_3_bits_is_sys_pc2epc),
    .io_dis_uops_3_bits_is_unique       (io_dis_uops_3_bits_is_unique),
    .io_dis_uops_3_bits_flush_on_commit (io_dis_uops_3_bits_flush_on_commit),
    .io_dis_uops_3_bits_ldst_is_rs1     (io_dis_uops_3_bits_ldst_is_rs1),
    .io_dis_uops_3_bits_ldst            (io_dis_uops_3_bits_ldst),
    .io_dis_uops_3_bits_lrs1            (io_dis_uops_3_bits_lrs1),
    .io_dis_uops_3_bits_lrs2            (io_dis_uops_3_bits_lrs2),
    .io_dis_uops_3_bits_lrs3            (io_dis_uops_3_bits_lrs3),
    .io_dis_uops_3_bits_ldst_val        (io_dis_uops_3_bits_ldst_val),
    .io_dis_uops_3_bits_dst_rtype       (io_dis_uops_3_bits_dst_rtype),
    .io_dis_uops_3_bits_lrs1_rtype      (io_dis_uops_3_bits_lrs1_rtype),
    .io_dis_uops_3_bits_lrs2_rtype      (io_dis_uops_3_bits_lrs2_rtype),
    .io_dis_uops_3_bits_frs3_en         (io_dis_uops_3_bits_frs3_en),
    .io_dis_uops_3_bits_fp_val          (io_dis_uops_3_bits_fp_val),
    .io_dis_uops_3_bits_fp_single       (io_dis_uops_3_bits_fp_single),
    .io_dis_uops_3_bits_xcpt_pf_if      (io_dis_uops_3_bits_xcpt_pf_if),
    .io_dis_uops_3_bits_xcpt_ae_if      (io_dis_uops_3_bits_xcpt_ae_if),
    .io_dis_uops_3_bits_xcpt_ma_if      (io_dis_uops_3_bits_xcpt_ma_if),
    .io_dis_uops_3_bits_bp_debug_if     (io_dis_uops_3_bits_bp_debug_if),
    .io_dis_uops_3_bits_bp_xcpt_if      (io_dis_uops_3_bits_bp_xcpt_if),
    .io_dis_uops_3_bits_debug_fsrc      (io_dis_uops_3_bits_debug_fsrc),
    .io_dis_uops_3_bits_debug_tsrc      (io_dis_uops_3_bits_debug_tsrc),
    .io_iss_valids_0                    (_fp_issue_unit_io_iss_valids_0),
    .io_iss_valids_1                    (_fp_issue_unit_io_iss_valids_1),
    .io_iss_uops_0_uopc                 (_fp_issue_unit_io_iss_uops_0_uopc),
    .io_iss_uops_0_inst                 (_fp_issue_unit_io_iss_uops_0_inst),
    .io_iss_uops_0_debug_inst           (_fp_issue_unit_io_iss_uops_0_debug_inst),
    .io_iss_uops_0_is_rvc               (_fp_issue_unit_io_iss_uops_0_is_rvc),
    .io_iss_uops_0_debug_pc             (_fp_issue_unit_io_iss_uops_0_debug_pc),
    .io_iss_uops_0_iq_type              (_fp_issue_unit_io_iss_uops_0_iq_type),
    .io_iss_uops_0_fu_code              (_fp_issue_unit_io_iss_uops_0_fu_code),
    .io_iss_uops_0_iw_state             (_fp_issue_unit_io_iss_uops_0_iw_state),
    .io_iss_uops_0_is_br                (_fp_issue_unit_io_iss_uops_0_is_br),
    .io_iss_uops_0_is_jalr              (_fp_issue_unit_io_iss_uops_0_is_jalr),
    .io_iss_uops_0_is_jal               (_fp_issue_unit_io_iss_uops_0_is_jal),
    .io_iss_uops_0_is_sfb               (_fp_issue_unit_io_iss_uops_0_is_sfb),
    .io_iss_uops_0_br_mask              (_fp_issue_unit_io_iss_uops_0_br_mask),
    .io_iss_uops_0_br_tag               (_fp_issue_unit_io_iss_uops_0_br_tag),
    .io_iss_uops_0_ftq_idx              (_fp_issue_unit_io_iss_uops_0_ftq_idx),
    .io_iss_uops_0_edge_inst            (_fp_issue_unit_io_iss_uops_0_edge_inst),
    .io_iss_uops_0_pc_lob               (_fp_issue_unit_io_iss_uops_0_pc_lob),
    .io_iss_uops_0_taken                (_fp_issue_unit_io_iss_uops_0_taken),
    .io_iss_uops_0_imm_packed           (_fp_issue_unit_io_iss_uops_0_imm_packed),
    .io_iss_uops_0_csr_addr             (_fp_issue_unit_io_iss_uops_0_csr_addr),
    .io_iss_uops_0_rob_idx              (_fp_issue_unit_io_iss_uops_0_rob_idx),
    .io_iss_uops_0_ldq_idx              (_fp_issue_unit_io_iss_uops_0_ldq_idx),
    .io_iss_uops_0_stq_idx              (_fp_issue_unit_io_iss_uops_0_stq_idx),
    .io_iss_uops_0_rxq_idx              (_fp_issue_unit_io_iss_uops_0_rxq_idx),
    .io_iss_uops_0_pdst                 (_fp_issue_unit_io_iss_uops_0_pdst),
    .io_iss_uops_0_prs1                 (_fp_issue_unit_io_iss_uops_0_prs1),
    .io_iss_uops_0_prs2                 (_fp_issue_unit_io_iss_uops_0_prs2),
    .io_iss_uops_0_prs3                 (_fp_issue_unit_io_iss_uops_0_prs3),
    .io_iss_uops_0_ppred                (_fp_issue_unit_io_iss_uops_0_ppred),
    .io_iss_uops_0_prs1_busy            (_fp_issue_unit_io_iss_uops_0_prs1_busy),
    .io_iss_uops_0_prs2_busy            (_fp_issue_unit_io_iss_uops_0_prs2_busy),
    .io_iss_uops_0_prs3_busy            (_fp_issue_unit_io_iss_uops_0_prs3_busy),
    .io_iss_uops_0_ppred_busy           (_fp_issue_unit_io_iss_uops_0_ppred_busy),
    .io_iss_uops_0_stale_pdst           (_fp_issue_unit_io_iss_uops_0_stale_pdst),
    .io_iss_uops_0_exception            (_fp_issue_unit_io_iss_uops_0_exception),
    .io_iss_uops_0_exc_cause            (_fp_issue_unit_io_iss_uops_0_exc_cause),
    .io_iss_uops_0_bypassable           (_fp_issue_unit_io_iss_uops_0_bypassable),
    .io_iss_uops_0_mem_cmd              (_fp_issue_unit_io_iss_uops_0_mem_cmd),
    .io_iss_uops_0_mem_size             (_fp_issue_unit_io_iss_uops_0_mem_size),
    .io_iss_uops_0_mem_signed           (_fp_issue_unit_io_iss_uops_0_mem_signed),
    .io_iss_uops_0_is_fence             (_fp_issue_unit_io_iss_uops_0_is_fence),
    .io_iss_uops_0_is_fencei            (_fp_issue_unit_io_iss_uops_0_is_fencei),
    .io_iss_uops_0_is_amo               (_fp_issue_unit_io_iss_uops_0_is_amo),
    .io_iss_uops_0_uses_ldq             (_fp_issue_unit_io_iss_uops_0_uses_ldq),
    .io_iss_uops_0_uses_stq             (_fp_issue_unit_io_iss_uops_0_uses_stq),
    .io_iss_uops_0_is_sys_pc2epc        (_fp_issue_unit_io_iss_uops_0_is_sys_pc2epc),
    .io_iss_uops_0_is_unique            (_fp_issue_unit_io_iss_uops_0_is_unique),
    .io_iss_uops_0_flush_on_commit      (_fp_issue_unit_io_iss_uops_0_flush_on_commit),
    .io_iss_uops_0_ldst_is_rs1          (_fp_issue_unit_io_iss_uops_0_ldst_is_rs1),
    .io_iss_uops_0_ldst                 (_fp_issue_unit_io_iss_uops_0_ldst),
    .io_iss_uops_0_lrs1                 (_fp_issue_unit_io_iss_uops_0_lrs1),
    .io_iss_uops_0_lrs2                 (_fp_issue_unit_io_iss_uops_0_lrs2),
    .io_iss_uops_0_lrs3                 (_fp_issue_unit_io_iss_uops_0_lrs3),
    .io_iss_uops_0_ldst_val             (_fp_issue_unit_io_iss_uops_0_ldst_val),
    .io_iss_uops_0_dst_rtype            (_fp_issue_unit_io_iss_uops_0_dst_rtype),
    .io_iss_uops_0_lrs1_rtype           (_fp_issue_unit_io_iss_uops_0_lrs1_rtype),
    .io_iss_uops_0_lrs2_rtype           (_fp_issue_unit_io_iss_uops_0_lrs2_rtype),
    .io_iss_uops_0_frs3_en              (_fp_issue_unit_io_iss_uops_0_frs3_en),
    .io_iss_uops_0_fp_val               (_fp_issue_unit_io_iss_uops_0_fp_val),
    .io_iss_uops_0_fp_single            (_fp_issue_unit_io_iss_uops_0_fp_single),
    .io_iss_uops_0_xcpt_pf_if           (_fp_issue_unit_io_iss_uops_0_xcpt_pf_if),
    .io_iss_uops_0_xcpt_ae_if           (_fp_issue_unit_io_iss_uops_0_xcpt_ae_if),
    .io_iss_uops_0_xcpt_ma_if           (_fp_issue_unit_io_iss_uops_0_xcpt_ma_if),
    .io_iss_uops_0_bp_debug_if          (_fp_issue_unit_io_iss_uops_0_bp_debug_if),
    .io_iss_uops_0_bp_xcpt_if           (_fp_issue_unit_io_iss_uops_0_bp_xcpt_if),
    .io_iss_uops_0_debug_fsrc           (_fp_issue_unit_io_iss_uops_0_debug_fsrc),
    .io_iss_uops_0_debug_tsrc           (_fp_issue_unit_io_iss_uops_0_debug_tsrc),
    .io_iss_uops_1_uopc                 (_fp_issue_unit_io_iss_uops_1_uopc),
    .io_iss_uops_1_inst                 (_fp_issue_unit_io_iss_uops_1_inst),
    .io_iss_uops_1_debug_inst           (_fp_issue_unit_io_iss_uops_1_debug_inst),
    .io_iss_uops_1_is_rvc               (_fp_issue_unit_io_iss_uops_1_is_rvc),
    .io_iss_uops_1_debug_pc             (_fp_issue_unit_io_iss_uops_1_debug_pc),
    .io_iss_uops_1_iq_type              (_fp_issue_unit_io_iss_uops_1_iq_type),
    .io_iss_uops_1_fu_code              (_fp_issue_unit_io_iss_uops_1_fu_code),
    .io_iss_uops_1_iw_state             (_fp_issue_unit_io_iss_uops_1_iw_state),
    .io_iss_uops_1_is_br                (_fp_issue_unit_io_iss_uops_1_is_br),
    .io_iss_uops_1_is_jalr              (_fp_issue_unit_io_iss_uops_1_is_jalr),
    .io_iss_uops_1_is_jal               (_fp_issue_unit_io_iss_uops_1_is_jal),
    .io_iss_uops_1_is_sfb               (_fp_issue_unit_io_iss_uops_1_is_sfb),
    .io_iss_uops_1_br_mask              (_fp_issue_unit_io_iss_uops_1_br_mask),
    .io_iss_uops_1_br_tag               (_fp_issue_unit_io_iss_uops_1_br_tag),
    .io_iss_uops_1_ftq_idx              (_fp_issue_unit_io_iss_uops_1_ftq_idx),
    .io_iss_uops_1_edge_inst            (_fp_issue_unit_io_iss_uops_1_edge_inst),
    .io_iss_uops_1_pc_lob               (_fp_issue_unit_io_iss_uops_1_pc_lob),
    .io_iss_uops_1_taken                (_fp_issue_unit_io_iss_uops_1_taken),
    .io_iss_uops_1_imm_packed           (_fp_issue_unit_io_iss_uops_1_imm_packed),
    .io_iss_uops_1_csr_addr             (_fp_issue_unit_io_iss_uops_1_csr_addr),
    .io_iss_uops_1_rob_idx              (_fp_issue_unit_io_iss_uops_1_rob_idx),
    .io_iss_uops_1_ldq_idx              (_fp_issue_unit_io_iss_uops_1_ldq_idx),
    .io_iss_uops_1_stq_idx              (_fp_issue_unit_io_iss_uops_1_stq_idx),
    .io_iss_uops_1_rxq_idx              (_fp_issue_unit_io_iss_uops_1_rxq_idx),
    .io_iss_uops_1_pdst                 (_fp_issue_unit_io_iss_uops_1_pdst),
    .io_iss_uops_1_prs1                 (_fp_issue_unit_io_iss_uops_1_prs1),
    .io_iss_uops_1_prs2                 (_fp_issue_unit_io_iss_uops_1_prs2),
    .io_iss_uops_1_prs3                 (_fp_issue_unit_io_iss_uops_1_prs3),
    .io_iss_uops_1_ppred                (_fp_issue_unit_io_iss_uops_1_ppred),
    .io_iss_uops_1_prs1_busy            (_fp_issue_unit_io_iss_uops_1_prs1_busy),
    .io_iss_uops_1_prs2_busy            (_fp_issue_unit_io_iss_uops_1_prs2_busy),
    .io_iss_uops_1_prs3_busy            (_fp_issue_unit_io_iss_uops_1_prs3_busy),
    .io_iss_uops_1_ppred_busy           (_fp_issue_unit_io_iss_uops_1_ppred_busy),
    .io_iss_uops_1_stale_pdst           (_fp_issue_unit_io_iss_uops_1_stale_pdst),
    .io_iss_uops_1_exception            (_fp_issue_unit_io_iss_uops_1_exception),
    .io_iss_uops_1_exc_cause            (_fp_issue_unit_io_iss_uops_1_exc_cause),
    .io_iss_uops_1_bypassable           (_fp_issue_unit_io_iss_uops_1_bypassable),
    .io_iss_uops_1_mem_cmd              (_fp_issue_unit_io_iss_uops_1_mem_cmd),
    .io_iss_uops_1_mem_size             (_fp_issue_unit_io_iss_uops_1_mem_size),
    .io_iss_uops_1_mem_signed           (_fp_issue_unit_io_iss_uops_1_mem_signed),
    .io_iss_uops_1_is_fence             (_fp_issue_unit_io_iss_uops_1_is_fence),
    .io_iss_uops_1_is_fencei            (_fp_issue_unit_io_iss_uops_1_is_fencei),
    .io_iss_uops_1_is_amo               (_fp_issue_unit_io_iss_uops_1_is_amo),
    .io_iss_uops_1_uses_ldq             (_fp_issue_unit_io_iss_uops_1_uses_ldq),
    .io_iss_uops_1_uses_stq             (_fp_issue_unit_io_iss_uops_1_uses_stq),
    .io_iss_uops_1_is_sys_pc2epc        (_fp_issue_unit_io_iss_uops_1_is_sys_pc2epc),
    .io_iss_uops_1_is_unique            (_fp_issue_unit_io_iss_uops_1_is_unique),
    .io_iss_uops_1_flush_on_commit      (_fp_issue_unit_io_iss_uops_1_flush_on_commit),
    .io_iss_uops_1_ldst_is_rs1          (_fp_issue_unit_io_iss_uops_1_ldst_is_rs1),
    .io_iss_uops_1_ldst                 (_fp_issue_unit_io_iss_uops_1_ldst),
    .io_iss_uops_1_lrs1                 (_fp_issue_unit_io_iss_uops_1_lrs1),
    .io_iss_uops_1_lrs2                 (_fp_issue_unit_io_iss_uops_1_lrs2),
    .io_iss_uops_1_lrs3                 (_fp_issue_unit_io_iss_uops_1_lrs3),
    .io_iss_uops_1_ldst_val             (_fp_issue_unit_io_iss_uops_1_ldst_val),
    .io_iss_uops_1_dst_rtype            (_fp_issue_unit_io_iss_uops_1_dst_rtype),
    .io_iss_uops_1_lrs1_rtype           (_fp_issue_unit_io_iss_uops_1_lrs1_rtype),
    .io_iss_uops_1_lrs2_rtype           (_fp_issue_unit_io_iss_uops_1_lrs2_rtype),
    .io_iss_uops_1_frs3_en              (_fp_issue_unit_io_iss_uops_1_frs3_en),
    .io_iss_uops_1_fp_val               (_fp_issue_unit_io_iss_uops_1_fp_val),
    .io_iss_uops_1_fp_single            (_fp_issue_unit_io_iss_uops_1_fp_single),
    .io_iss_uops_1_xcpt_pf_if           (_fp_issue_unit_io_iss_uops_1_xcpt_pf_if),
    .io_iss_uops_1_xcpt_ae_if           (_fp_issue_unit_io_iss_uops_1_xcpt_ae_if),
    .io_iss_uops_1_xcpt_ma_if           (_fp_issue_unit_io_iss_uops_1_xcpt_ma_if),
    .io_iss_uops_1_bp_debug_if          (_fp_issue_unit_io_iss_uops_1_bp_debug_if),
    .io_iss_uops_1_bp_xcpt_if           (_fp_issue_unit_io_iss_uops_1_bp_xcpt_if),
    .io_iss_uops_1_debug_fsrc           (_fp_issue_unit_io_iss_uops_1_debug_fsrc),
    .io_iss_uops_1_debug_tsrc           (_fp_issue_unit_io_iss_uops_1_debug_tsrc),
    .io_wakeup_ports_0_valid            (_ll_wbarb_io_out_valid),
    .io_wakeup_ports_0_bits_pdst        (_ll_wbarb_io_out_bits_uop_pdst),
    .io_wakeup_ports_1_valid            (io_ll_wports_1_valid),
    .io_wakeup_ports_1_bits_pdst        (io_ll_wports_1_bits_uop_pdst),
    .io_wakeup_ports_2_valid            (_io_wakeups_2_valid_output),
    .io_wakeup_ports_2_bits_pdst        (_fpu_exe_unit_io_fresp_bits_uop_pdst),
    .io_wakeup_ports_3_valid            (_io_wakeups_3_valid_output),
    .io_wakeup_ports_3_bits_pdst        (_fpu_exe_unit_1_io_fresp_bits_uop_pdst),
    .io_fu_types_0                      (_fpu_exe_unit_io_fu_types & REG),
    .io_brupdate_b1_resolve_mask        (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask     (io_brupdate_b1_mispredict_mask),
    .io_flush_pipeline                  (io_flush_pipeline)
  );
  RegisterFileSynthesizable fregfile (
    .clock                      (clock),
    .reset                      (reset),
    .io_read_ports_0_addr       (_fregister_read_io_rf_read_ports_0_addr),
    .io_read_ports_0_data       (_fregfile_io_read_ports_0_data),
    .io_read_ports_1_addr       (_fregister_read_io_rf_read_ports_1_addr),
    .io_read_ports_1_data       (_fregfile_io_read_ports_1_data),
    .io_read_ports_2_addr       (_fregister_read_io_rf_read_ports_2_addr),
    .io_read_ports_2_data       (_fregfile_io_read_ports_2_data),
    .io_read_ports_3_addr       (_fregister_read_io_rf_read_ports_3_addr),
    .io_read_ports_3_data       (_fregfile_io_read_ports_3_data),
    .io_read_ports_4_addr       (_fregister_read_io_rf_read_ports_4_addr),
    .io_read_ports_4_data       (_fregfile_io_read_ports_4_data),
    .io_read_ports_5_addr       (_fregister_read_io_rf_read_ports_5_addr),
    .io_read_ports_5_data       (_fregfile_io_read_ports_5_data),
    .io_write_ports_0_valid     (fregfile_io_write_ports_0_REG_valid),
    .io_write_ports_0_bits_addr (fregfile_io_write_ports_0_REG_bits_addr),
    .io_write_ports_0_bits_data (fregfile_io_write_ports_0_REG_bits_data),
    .io_write_ports_1_valid     (fregfile_io_write_ports_1_REG_valid),
    .io_write_ports_1_bits_addr (fregfile_io_write_ports_1_REG_bits_addr),
    .io_write_ports_1_bits_data (fregfile_io_write_ports_1_bits_data_REG),
    .io_write_ports_2_valid     (_fpu_exe_unit_io_fresp_valid & _fregfile_io_write_ports_2_valid_T),
    .io_write_ports_2_bits_addr (_fpu_exe_unit_io_fresp_bits_uop_pdst),
    .io_write_ports_2_bits_data (_fpu_exe_unit_io_fresp_bits_data),
    .io_write_ports_3_valid     (_fpu_exe_unit_1_io_fresp_valid & _fregfile_io_write_ports_3_valid_T),
    .io_write_ports_3_bits_addr (_fpu_exe_unit_1_io_fresp_bits_uop_pdst),
    .io_write_ports_3_bits_data (_fpu_exe_unit_1_io_fresp_bits_data)
  );
  RegisterRead fregister_read (
    .clock                                  (clock),
    .reset                                  (reset),
    .io_iss_valids_0                        (_fp_issue_unit_io_iss_valids_0),
    .io_iss_valids_1                        (_fp_issue_unit_io_iss_valids_1),
    .io_iss_uops_0_uopc                     (_fp_issue_unit_io_iss_uops_0_uopc),
    .io_iss_uops_0_inst                     (_fp_issue_unit_io_iss_uops_0_inst),
    .io_iss_uops_0_debug_inst               (_fp_issue_unit_io_iss_uops_0_debug_inst),
    .io_iss_uops_0_is_rvc                   (_fp_issue_unit_io_iss_uops_0_is_rvc),
    .io_iss_uops_0_debug_pc                 (_fp_issue_unit_io_iss_uops_0_debug_pc),
    .io_iss_uops_0_iq_type                  (_fp_issue_unit_io_iss_uops_0_iq_type),
    .io_iss_uops_0_fu_code                  (_fp_issue_unit_io_iss_uops_0_fu_code),
    .io_iss_uops_0_iw_state                 (_fp_issue_unit_io_iss_uops_0_iw_state),
    .io_iss_uops_0_is_br                    (_fp_issue_unit_io_iss_uops_0_is_br),
    .io_iss_uops_0_is_jalr                  (_fp_issue_unit_io_iss_uops_0_is_jalr),
    .io_iss_uops_0_is_jal                   (_fp_issue_unit_io_iss_uops_0_is_jal),
    .io_iss_uops_0_is_sfb                   (_fp_issue_unit_io_iss_uops_0_is_sfb),
    .io_iss_uops_0_br_mask                  (_fp_issue_unit_io_iss_uops_0_br_mask),
    .io_iss_uops_0_br_tag                   (_fp_issue_unit_io_iss_uops_0_br_tag),
    .io_iss_uops_0_ftq_idx                  (_fp_issue_unit_io_iss_uops_0_ftq_idx),
    .io_iss_uops_0_edge_inst                (_fp_issue_unit_io_iss_uops_0_edge_inst),
    .io_iss_uops_0_pc_lob                   (_fp_issue_unit_io_iss_uops_0_pc_lob),
    .io_iss_uops_0_taken                    (_fp_issue_unit_io_iss_uops_0_taken),
    .io_iss_uops_0_imm_packed               (_fp_issue_unit_io_iss_uops_0_imm_packed),
    .io_iss_uops_0_csr_addr                 (_fp_issue_unit_io_iss_uops_0_csr_addr),
    .io_iss_uops_0_rob_idx                  (_fp_issue_unit_io_iss_uops_0_rob_idx),
    .io_iss_uops_0_ldq_idx                  (_fp_issue_unit_io_iss_uops_0_ldq_idx),
    .io_iss_uops_0_stq_idx                  (_fp_issue_unit_io_iss_uops_0_stq_idx),
    .io_iss_uops_0_rxq_idx                  (_fp_issue_unit_io_iss_uops_0_rxq_idx),
    .io_iss_uops_0_pdst                     (_fp_issue_unit_io_iss_uops_0_pdst),
    .io_iss_uops_0_prs1                     (_fp_issue_unit_io_iss_uops_0_prs1),
    .io_iss_uops_0_prs2                     (_fp_issue_unit_io_iss_uops_0_prs2),
    .io_iss_uops_0_prs3                     (_fp_issue_unit_io_iss_uops_0_prs3),
    .io_iss_uops_0_ppred                    (_fp_issue_unit_io_iss_uops_0_ppred),
    .io_iss_uops_0_prs1_busy                (_fp_issue_unit_io_iss_uops_0_prs1_busy),
    .io_iss_uops_0_prs2_busy                (_fp_issue_unit_io_iss_uops_0_prs2_busy),
    .io_iss_uops_0_prs3_busy                (_fp_issue_unit_io_iss_uops_0_prs3_busy),
    .io_iss_uops_0_ppred_busy               (_fp_issue_unit_io_iss_uops_0_ppred_busy),
    .io_iss_uops_0_stale_pdst               (_fp_issue_unit_io_iss_uops_0_stale_pdst),
    .io_iss_uops_0_exception                (_fp_issue_unit_io_iss_uops_0_exception),
    .io_iss_uops_0_exc_cause                (_fp_issue_unit_io_iss_uops_0_exc_cause),
    .io_iss_uops_0_bypassable               (_fp_issue_unit_io_iss_uops_0_bypassable),
    .io_iss_uops_0_mem_cmd                  (_fp_issue_unit_io_iss_uops_0_mem_cmd),
    .io_iss_uops_0_mem_size                 (_fp_issue_unit_io_iss_uops_0_mem_size),
    .io_iss_uops_0_mem_signed               (_fp_issue_unit_io_iss_uops_0_mem_signed),
    .io_iss_uops_0_is_fence                 (_fp_issue_unit_io_iss_uops_0_is_fence),
    .io_iss_uops_0_is_fencei                (_fp_issue_unit_io_iss_uops_0_is_fencei),
    .io_iss_uops_0_is_amo                   (_fp_issue_unit_io_iss_uops_0_is_amo),
    .io_iss_uops_0_uses_ldq                 (_fp_issue_unit_io_iss_uops_0_uses_ldq),
    .io_iss_uops_0_uses_stq                 (_fp_issue_unit_io_iss_uops_0_uses_stq),
    .io_iss_uops_0_is_sys_pc2epc            (_fp_issue_unit_io_iss_uops_0_is_sys_pc2epc),
    .io_iss_uops_0_is_unique                (_fp_issue_unit_io_iss_uops_0_is_unique),
    .io_iss_uops_0_flush_on_commit          (_fp_issue_unit_io_iss_uops_0_flush_on_commit),
    .io_iss_uops_0_ldst_is_rs1              (_fp_issue_unit_io_iss_uops_0_ldst_is_rs1),
    .io_iss_uops_0_ldst                     (_fp_issue_unit_io_iss_uops_0_ldst),
    .io_iss_uops_0_lrs1                     (_fp_issue_unit_io_iss_uops_0_lrs1),
    .io_iss_uops_0_lrs2                     (_fp_issue_unit_io_iss_uops_0_lrs2),
    .io_iss_uops_0_lrs3                     (_fp_issue_unit_io_iss_uops_0_lrs3),
    .io_iss_uops_0_ldst_val                 (_fp_issue_unit_io_iss_uops_0_ldst_val),
    .io_iss_uops_0_dst_rtype                (_fp_issue_unit_io_iss_uops_0_dst_rtype),
    .io_iss_uops_0_lrs1_rtype               (_fp_issue_unit_io_iss_uops_0_lrs1_rtype),
    .io_iss_uops_0_lrs2_rtype               (_fp_issue_unit_io_iss_uops_0_lrs2_rtype),
    .io_iss_uops_0_frs3_en                  (_fp_issue_unit_io_iss_uops_0_frs3_en),
    .io_iss_uops_0_fp_val                   (_fp_issue_unit_io_iss_uops_0_fp_val),
    .io_iss_uops_0_fp_single                (_fp_issue_unit_io_iss_uops_0_fp_single),
    .io_iss_uops_0_xcpt_pf_if               (_fp_issue_unit_io_iss_uops_0_xcpt_pf_if),
    .io_iss_uops_0_xcpt_ae_if               (_fp_issue_unit_io_iss_uops_0_xcpt_ae_if),
    .io_iss_uops_0_xcpt_ma_if               (_fp_issue_unit_io_iss_uops_0_xcpt_ma_if),
    .io_iss_uops_0_bp_debug_if              (_fp_issue_unit_io_iss_uops_0_bp_debug_if),
    .io_iss_uops_0_bp_xcpt_if               (_fp_issue_unit_io_iss_uops_0_bp_xcpt_if),
    .io_iss_uops_0_debug_fsrc               (_fp_issue_unit_io_iss_uops_0_debug_fsrc),
    .io_iss_uops_0_debug_tsrc               (_fp_issue_unit_io_iss_uops_0_debug_tsrc),
    .io_iss_uops_1_uopc                     (_fp_issue_unit_io_iss_uops_1_uopc),
    .io_iss_uops_1_inst                     (_fp_issue_unit_io_iss_uops_1_inst),
    .io_iss_uops_1_debug_inst               (_fp_issue_unit_io_iss_uops_1_debug_inst),
    .io_iss_uops_1_is_rvc                   (_fp_issue_unit_io_iss_uops_1_is_rvc),
    .io_iss_uops_1_debug_pc                 (_fp_issue_unit_io_iss_uops_1_debug_pc),
    .io_iss_uops_1_iq_type                  (_fp_issue_unit_io_iss_uops_1_iq_type),
    .io_iss_uops_1_fu_code                  (_fp_issue_unit_io_iss_uops_1_fu_code),
    .io_iss_uops_1_iw_state                 (_fp_issue_unit_io_iss_uops_1_iw_state),
    .io_iss_uops_1_is_br                    (_fp_issue_unit_io_iss_uops_1_is_br),
    .io_iss_uops_1_is_jalr                  (_fp_issue_unit_io_iss_uops_1_is_jalr),
    .io_iss_uops_1_is_jal                   (_fp_issue_unit_io_iss_uops_1_is_jal),
    .io_iss_uops_1_is_sfb                   (_fp_issue_unit_io_iss_uops_1_is_sfb),
    .io_iss_uops_1_br_mask                  (_fp_issue_unit_io_iss_uops_1_br_mask),
    .io_iss_uops_1_br_tag                   (_fp_issue_unit_io_iss_uops_1_br_tag),
    .io_iss_uops_1_ftq_idx                  (_fp_issue_unit_io_iss_uops_1_ftq_idx),
    .io_iss_uops_1_edge_inst                (_fp_issue_unit_io_iss_uops_1_edge_inst),
    .io_iss_uops_1_pc_lob                   (_fp_issue_unit_io_iss_uops_1_pc_lob),
    .io_iss_uops_1_taken                    (_fp_issue_unit_io_iss_uops_1_taken),
    .io_iss_uops_1_imm_packed               (_fp_issue_unit_io_iss_uops_1_imm_packed),
    .io_iss_uops_1_csr_addr                 (_fp_issue_unit_io_iss_uops_1_csr_addr),
    .io_iss_uops_1_rob_idx                  (_fp_issue_unit_io_iss_uops_1_rob_idx),
    .io_iss_uops_1_ldq_idx                  (_fp_issue_unit_io_iss_uops_1_ldq_idx),
    .io_iss_uops_1_stq_idx                  (_fp_issue_unit_io_iss_uops_1_stq_idx),
    .io_iss_uops_1_rxq_idx                  (_fp_issue_unit_io_iss_uops_1_rxq_idx),
    .io_iss_uops_1_pdst                     (_fp_issue_unit_io_iss_uops_1_pdst),
    .io_iss_uops_1_prs1                     (_fp_issue_unit_io_iss_uops_1_prs1),
    .io_iss_uops_1_prs2                     (_fp_issue_unit_io_iss_uops_1_prs2),
    .io_iss_uops_1_prs3                     (_fp_issue_unit_io_iss_uops_1_prs3),
    .io_iss_uops_1_ppred                    (_fp_issue_unit_io_iss_uops_1_ppred),
    .io_iss_uops_1_prs1_busy                (_fp_issue_unit_io_iss_uops_1_prs1_busy),
    .io_iss_uops_1_prs2_busy                (_fp_issue_unit_io_iss_uops_1_prs2_busy),
    .io_iss_uops_1_prs3_busy                (_fp_issue_unit_io_iss_uops_1_prs3_busy),
    .io_iss_uops_1_ppred_busy               (_fp_issue_unit_io_iss_uops_1_ppred_busy),
    .io_iss_uops_1_stale_pdst               (_fp_issue_unit_io_iss_uops_1_stale_pdst),
    .io_iss_uops_1_exception                (_fp_issue_unit_io_iss_uops_1_exception),
    .io_iss_uops_1_exc_cause                (_fp_issue_unit_io_iss_uops_1_exc_cause),
    .io_iss_uops_1_bypassable               (_fp_issue_unit_io_iss_uops_1_bypassable),
    .io_iss_uops_1_mem_cmd                  (_fp_issue_unit_io_iss_uops_1_mem_cmd),
    .io_iss_uops_1_mem_size                 (_fp_issue_unit_io_iss_uops_1_mem_size),
    .io_iss_uops_1_mem_signed               (_fp_issue_unit_io_iss_uops_1_mem_signed),
    .io_iss_uops_1_is_fence                 (_fp_issue_unit_io_iss_uops_1_is_fence),
    .io_iss_uops_1_is_fencei                (_fp_issue_unit_io_iss_uops_1_is_fencei),
    .io_iss_uops_1_is_amo                   (_fp_issue_unit_io_iss_uops_1_is_amo),
    .io_iss_uops_1_uses_ldq                 (_fp_issue_unit_io_iss_uops_1_uses_ldq),
    .io_iss_uops_1_uses_stq                 (_fp_issue_unit_io_iss_uops_1_uses_stq),
    .io_iss_uops_1_is_sys_pc2epc            (_fp_issue_unit_io_iss_uops_1_is_sys_pc2epc),
    .io_iss_uops_1_is_unique                (_fp_issue_unit_io_iss_uops_1_is_unique),
    .io_iss_uops_1_flush_on_commit          (_fp_issue_unit_io_iss_uops_1_flush_on_commit),
    .io_iss_uops_1_ldst_is_rs1              (_fp_issue_unit_io_iss_uops_1_ldst_is_rs1),
    .io_iss_uops_1_ldst                     (_fp_issue_unit_io_iss_uops_1_ldst),
    .io_iss_uops_1_lrs1                     (_fp_issue_unit_io_iss_uops_1_lrs1),
    .io_iss_uops_1_lrs2                     (_fp_issue_unit_io_iss_uops_1_lrs2),
    .io_iss_uops_1_lrs3                     (_fp_issue_unit_io_iss_uops_1_lrs3),
    .io_iss_uops_1_ldst_val                 (_fp_issue_unit_io_iss_uops_1_ldst_val),
    .io_iss_uops_1_dst_rtype                (_fp_issue_unit_io_iss_uops_1_dst_rtype),
    .io_iss_uops_1_lrs1_rtype               (_fp_issue_unit_io_iss_uops_1_lrs1_rtype),
    .io_iss_uops_1_lrs2_rtype               (_fp_issue_unit_io_iss_uops_1_lrs2_rtype),
    .io_iss_uops_1_frs3_en                  (_fp_issue_unit_io_iss_uops_1_frs3_en),
    .io_iss_uops_1_fp_val                   (_fp_issue_unit_io_iss_uops_1_fp_val),
    .io_iss_uops_1_fp_single                (_fp_issue_unit_io_iss_uops_1_fp_single),
    .io_iss_uops_1_xcpt_pf_if               (_fp_issue_unit_io_iss_uops_1_xcpt_pf_if),
    .io_iss_uops_1_xcpt_ae_if               (_fp_issue_unit_io_iss_uops_1_xcpt_ae_if),
    .io_iss_uops_1_xcpt_ma_if               (_fp_issue_unit_io_iss_uops_1_xcpt_ma_if),
    .io_iss_uops_1_bp_debug_if              (_fp_issue_unit_io_iss_uops_1_bp_debug_if),
    .io_iss_uops_1_bp_xcpt_if               (_fp_issue_unit_io_iss_uops_1_bp_xcpt_if),
    .io_iss_uops_1_debug_fsrc               (_fp_issue_unit_io_iss_uops_1_debug_fsrc),
    .io_iss_uops_1_debug_tsrc               (_fp_issue_unit_io_iss_uops_1_debug_tsrc),
    .io_rf_read_ports_0_addr                (_fregister_read_io_rf_read_ports_0_addr),
    .io_rf_read_ports_0_data                (_fregfile_io_read_ports_0_data),
    .io_rf_read_ports_1_addr                (_fregister_read_io_rf_read_ports_1_addr),
    .io_rf_read_ports_1_data                (_fregfile_io_read_ports_1_data),
    .io_rf_read_ports_2_addr                (_fregister_read_io_rf_read_ports_2_addr),
    .io_rf_read_ports_2_data                (_fregfile_io_read_ports_2_data),
    .io_rf_read_ports_3_addr                (_fregister_read_io_rf_read_ports_3_addr),
    .io_rf_read_ports_3_data                (_fregfile_io_read_ports_3_data),
    .io_rf_read_ports_4_addr                (_fregister_read_io_rf_read_ports_4_addr),
    .io_rf_read_ports_4_data                (_fregfile_io_read_ports_4_data),
    .io_rf_read_ports_5_addr                (_fregister_read_io_rf_read_ports_5_addr),
    .io_rf_read_ports_5_data                (_fregfile_io_read_ports_5_data),
    .io_exe_reqs_0_valid                    (_fregister_read_io_exe_reqs_0_valid),
    .io_exe_reqs_0_bits_uop_uopc            (_fregister_read_io_exe_reqs_0_bits_uop_uopc),
    .io_exe_reqs_0_bits_uop_inst            (_fregister_read_io_exe_reqs_0_bits_uop_inst),
    .io_exe_reqs_0_bits_uop_debug_inst      (_fregister_read_io_exe_reqs_0_bits_uop_debug_inst),
    .io_exe_reqs_0_bits_uop_is_rvc          (_fregister_read_io_exe_reqs_0_bits_uop_is_rvc),
    .io_exe_reqs_0_bits_uop_debug_pc        (_fregister_read_io_exe_reqs_0_bits_uop_debug_pc),
    .io_exe_reqs_0_bits_uop_iq_type         (_fregister_read_io_exe_reqs_0_bits_uop_iq_type),
    .io_exe_reqs_0_bits_uop_fu_code         (_fregister_read_io_exe_reqs_0_bits_uop_fu_code),
    .io_exe_reqs_0_bits_uop_ctrl_br_type    (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_br_type),
    .io_exe_reqs_0_bits_uop_ctrl_op1_sel    (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_op1_sel),
    .io_exe_reqs_0_bits_uop_ctrl_op2_sel    (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_op2_sel),
    .io_exe_reqs_0_bits_uop_ctrl_imm_sel    (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_imm_sel),
    .io_exe_reqs_0_bits_uop_ctrl_op_fcn     (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_op_fcn),
    .io_exe_reqs_0_bits_uop_ctrl_fcn_dw     (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_fcn_dw),
    .io_exe_reqs_0_bits_uop_ctrl_csr_cmd    (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_csr_cmd),
    .io_exe_reqs_0_bits_uop_ctrl_is_load    (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_load),
    .io_exe_reqs_0_bits_uop_ctrl_is_sta     (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_sta),
    .io_exe_reqs_0_bits_uop_ctrl_is_std     (_fregister_read_io_exe_reqs_0_bits_uop_ctrl_is_std),
    .io_exe_reqs_0_bits_uop_iw_state        (_fregister_read_io_exe_reqs_0_bits_uop_iw_state),
    .io_exe_reqs_0_bits_uop_iw_p1_poisoned  (_fregister_read_io_exe_reqs_0_bits_uop_iw_p1_poisoned),
    .io_exe_reqs_0_bits_uop_iw_p2_poisoned  (_fregister_read_io_exe_reqs_0_bits_uop_iw_p2_poisoned),
    .io_exe_reqs_0_bits_uop_is_br           (_fregister_read_io_exe_reqs_0_bits_uop_is_br),
    .io_exe_reqs_0_bits_uop_is_jalr         (_fregister_read_io_exe_reqs_0_bits_uop_is_jalr),
    .io_exe_reqs_0_bits_uop_is_jal          (_fregister_read_io_exe_reqs_0_bits_uop_is_jal),
    .io_exe_reqs_0_bits_uop_is_sfb          (_fregister_read_io_exe_reqs_0_bits_uop_is_sfb),
    .io_exe_reqs_0_bits_uop_br_mask         (_fregister_read_io_exe_reqs_0_bits_uop_br_mask),
    .io_exe_reqs_0_bits_uop_br_tag          (_fregister_read_io_exe_reqs_0_bits_uop_br_tag),
    .io_exe_reqs_0_bits_uop_ftq_idx         (_fregister_read_io_exe_reqs_0_bits_uop_ftq_idx),
    .io_exe_reqs_0_bits_uop_edge_inst       (_fregister_read_io_exe_reqs_0_bits_uop_edge_inst),
    .io_exe_reqs_0_bits_uop_pc_lob          (_fregister_read_io_exe_reqs_0_bits_uop_pc_lob),
    .io_exe_reqs_0_bits_uop_taken           (_fregister_read_io_exe_reqs_0_bits_uop_taken),
    .io_exe_reqs_0_bits_uop_imm_packed      (_fregister_read_io_exe_reqs_0_bits_uop_imm_packed),
    .io_exe_reqs_0_bits_uop_csr_addr        (_fregister_read_io_exe_reqs_0_bits_uop_csr_addr),
    .io_exe_reqs_0_bits_uop_rob_idx         (_fregister_read_io_exe_reqs_0_bits_uop_rob_idx),
    .io_exe_reqs_0_bits_uop_ldq_idx         (_fregister_read_io_exe_reqs_0_bits_uop_ldq_idx),
    .io_exe_reqs_0_bits_uop_stq_idx         (_fregister_read_io_exe_reqs_0_bits_uop_stq_idx),
    .io_exe_reqs_0_bits_uop_rxq_idx         (_fregister_read_io_exe_reqs_0_bits_uop_rxq_idx),
    .io_exe_reqs_0_bits_uop_pdst            (_fregister_read_io_exe_reqs_0_bits_uop_pdst),
    .io_exe_reqs_0_bits_uop_prs1            (_fregister_read_io_exe_reqs_0_bits_uop_prs1),
    .io_exe_reqs_0_bits_uop_prs2            (_fregister_read_io_exe_reqs_0_bits_uop_prs2),
    .io_exe_reqs_0_bits_uop_prs3            (_fregister_read_io_exe_reqs_0_bits_uop_prs3),
    .io_exe_reqs_0_bits_uop_ppred           (_fregister_read_io_exe_reqs_0_bits_uop_ppred),
    .io_exe_reqs_0_bits_uop_prs1_busy       (_fregister_read_io_exe_reqs_0_bits_uop_prs1_busy),
    .io_exe_reqs_0_bits_uop_prs2_busy       (_fregister_read_io_exe_reqs_0_bits_uop_prs2_busy),
    .io_exe_reqs_0_bits_uop_prs3_busy       (_fregister_read_io_exe_reqs_0_bits_uop_prs3_busy),
    .io_exe_reqs_0_bits_uop_ppred_busy      (_fregister_read_io_exe_reqs_0_bits_uop_ppred_busy),
    .io_exe_reqs_0_bits_uop_stale_pdst      (_fregister_read_io_exe_reqs_0_bits_uop_stale_pdst),
    .io_exe_reqs_0_bits_uop_exception       (_fregister_read_io_exe_reqs_0_bits_uop_exception),
    .io_exe_reqs_0_bits_uop_exc_cause       (_fregister_read_io_exe_reqs_0_bits_uop_exc_cause),
    .io_exe_reqs_0_bits_uop_bypassable      (_fregister_read_io_exe_reqs_0_bits_uop_bypassable),
    .io_exe_reqs_0_bits_uop_mem_cmd         (_fregister_read_io_exe_reqs_0_bits_uop_mem_cmd),
    .io_exe_reqs_0_bits_uop_mem_size        (_fregister_read_io_exe_reqs_0_bits_uop_mem_size),
    .io_exe_reqs_0_bits_uop_mem_signed      (_fregister_read_io_exe_reqs_0_bits_uop_mem_signed),
    .io_exe_reqs_0_bits_uop_is_fence        (_fregister_read_io_exe_reqs_0_bits_uop_is_fence),
    .io_exe_reqs_0_bits_uop_is_fencei       (_fregister_read_io_exe_reqs_0_bits_uop_is_fencei),
    .io_exe_reqs_0_bits_uop_is_amo          (_fregister_read_io_exe_reqs_0_bits_uop_is_amo),
    .io_exe_reqs_0_bits_uop_uses_ldq        (_fregister_read_io_exe_reqs_0_bits_uop_uses_ldq),
    .io_exe_reqs_0_bits_uop_uses_stq        (_fregister_read_io_exe_reqs_0_bits_uop_uses_stq),
    .io_exe_reqs_0_bits_uop_is_sys_pc2epc   (_fregister_read_io_exe_reqs_0_bits_uop_is_sys_pc2epc),
    .io_exe_reqs_0_bits_uop_is_unique       (_fregister_read_io_exe_reqs_0_bits_uop_is_unique),
    .io_exe_reqs_0_bits_uop_flush_on_commit (_fregister_read_io_exe_reqs_0_bits_uop_flush_on_commit),
    .io_exe_reqs_0_bits_uop_ldst_is_rs1     (_fregister_read_io_exe_reqs_0_bits_uop_ldst_is_rs1),
    .io_exe_reqs_0_bits_uop_ldst            (_fregister_read_io_exe_reqs_0_bits_uop_ldst),
    .io_exe_reqs_0_bits_uop_lrs1            (_fregister_read_io_exe_reqs_0_bits_uop_lrs1),
    .io_exe_reqs_0_bits_uop_lrs2            (_fregister_read_io_exe_reqs_0_bits_uop_lrs2),
    .io_exe_reqs_0_bits_uop_lrs3            (_fregister_read_io_exe_reqs_0_bits_uop_lrs3),
    .io_exe_reqs_0_bits_uop_ldst_val        (_fregister_read_io_exe_reqs_0_bits_uop_ldst_val),
    .io_exe_reqs_0_bits_uop_dst_rtype       (_fregister_read_io_exe_reqs_0_bits_uop_dst_rtype),
    .io_exe_reqs_0_bits_uop_lrs1_rtype      (_fregister_read_io_exe_reqs_0_bits_uop_lrs1_rtype),
    .io_exe_reqs_0_bits_uop_lrs2_rtype      (_fregister_read_io_exe_reqs_0_bits_uop_lrs2_rtype),
    .io_exe_reqs_0_bits_uop_frs3_en         (_fregister_read_io_exe_reqs_0_bits_uop_frs3_en),
    .io_exe_reqs_0_bits_uop_fp_val          (_fregister_read_io_exe_reqs_0_bits_uop_fp_val),
    .io_exe_reqs_0_bits_uop_fp_single       (_fregister_read_io_exe_reqs_0_bits_uop_fp_single),
    .io_exe_reqs_0_bits_uop_xcpt_pf_if      (_fregister_read_io_exe_reqs_0_bits_uop_xcpt_pf_if),
    .io_exe_reqs_0_bits_uop_xcpt_ae_if      (_fregister_read_io_exe_reqs_0_bits_uop_xcpt_ae_if),
    .io_exe_reqs_0_bits_uop_xcpt_ma_if      (_fregister_read_io_exe_reqs_0_bits_uop_xcpt_ma_if),
    .io_exe_reqs_0_bits_uop_bp_debug_if     (_fregister_read_io_exe_reqs_0_bits_uop_bp_debug_if),
    .io_exe_reqs_0_bits_uop_bp_xcpt_if      (_fregister_read_io_exe_reqs_0_bits_uop_bp_xcpt_if),
    .io_exe_reqs_0_bits_uop_debug_fsrc      (_fregister_read_io_exe_reqs_0_bits_uop_debug_fsrc),
    .io_exe_reqs_0_bits_uop_debug_tsrc      (_fregister_read_io_exe_reqs_0_bits_uop_debug_tsrc),
    .io_exe_reqs_0_bits_rs1_data            (_fregister_read_io_exe_reqs_0_bits_rs1_data),
    .io_exe_reqs_0_bits_rs2_data            (_fregister_read_io_exe_reqs_0_bits_rs2_data),
    .io_exe_reqs_0_bits_rs3_data            (_fregister_read_io_exe_reqs_0_bits_rs3_data),
    .io_exe_reqs_1_valid                    (_fregister_read_io_exe_reqs_1_valid),
    .io_exe_reqs_1_bits_uop_uopc            (_fregister_read_io_exe_reqs_1_bits_uop_uopc),
    .io_exe_reqs_1_bits_uop_inst            (_fregister_read_io_exe_reqs_1_bits_uop_inst),
    .io_exe_reqs_1_bits_uop_debug_inst      (_fregister_read_io_exe_reqs_1_bits_uop_debug_inst),
    .io_exe_reqs_1_bits_uop_is_rvc          (_fregister_read_io_exe_reqs_1_bits_uop_is_rvc),
    .io_exe_reqs_1_bits_uop_debug_pc        (_fregister_read_io_exe_reqs_1_bits_uop_debug_pc),
    .io_exe_reqs_1_bits_uop_iq_type         (_fregister_read_io_exe_reqs_1_bits_uop_iq_type),
    .io_exe_reqs_1_bits_uop_fu_code         (_fregister_read_io_exe_reqs_1_bits_uop_fu_code),
    .io_exe_reqs_1_bits_uop_ctrl_br_type    (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_br_type),
    .io_exe_reqs_1_bits_uop_ctrl_op1_sel    (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_op1_sel),
    .io_exe_reqs_1_bits_uop_ctrl_op2_sel    (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_op2_sel),
    .io_exe_reqs_1_bits_uop_ctrl_imm_sel    (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_imm_sel),
    .io_exe_reqs_1_bits_uop_ctrl_op_fcn     (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_op_fcn),
    .io_exe_reqs_1_bits_uop_ctrl_fcn_dw     (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_fcn_dw),
    .io_exe_reqs_1_bits_uop_ctrl_csr_cmd    (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_csr_cmd),
    .io_exe_reqs_1_bits_uop_ctrl_is_load    (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_is_load),
    .io_exe_reqs_1_bits_uop_ctrl_is_sta     (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_is_sta),
    .io_exe_reqs_1_bits_uop_ctrl_is_std     (_fregister_read_io_exe_reqs_1_bits_uop_ctrl_is_std),
    .io_exe_reqs_1_bits_uop_iw_state        (_fregister_read_io_exe_reqs_1_bits_uop_iw_state),
    .io_exe_reqs_1_bits_uop_iw_p1_poisoned  (_fregister_read_io_exe_reqs_1_bits_uop_iw_p1_poisoned),
    .io_exe_reqs_1_bits_uop_iw_p2_poisoned  (_fregister_read_io_exe_reqs_1_bits_uop_iw_p2_poisoned),
    .io_exe_reqs_1_bits_uop_is_br           (_fregister_read_io_exe_reqs_1_bits_uop_is_br),
    .io_exe_reqs_1_bits_uop_is_jalr         (_fregister_read_io_exe_reqs_1_bits_uop_is_jalr),
    .io_exe_reqs_1_bits_uop_is_jal          (_fregister_read_io_exe_reqs_1_bits_uop_is_jal),
    .io_exe_reqs_1_bits_uop_is_sfb          (_fregister_read_io_exe_reqs_1_bits_uop_is_sfb),
    .io_exe_reqs_1_bits_uop_br_mask         (_fregister_read_io_exe_reqs_1_bits_uop_br_mask),
    .io_exe_reqs_1_bits_uop_br_tag          (_fregister_read_io_exe_reqs_1_bits_uop_br_tag),
    .io_exe_reqs_1_bits_uop_ftq_idx         (_fregister_read_io_exe_reqs_1_bits_uop_ftq_idx),
    .io_exe_reqs_1_bits_uop_edge_inst       (_fregister_read_io_exe_reqs_1_bits_uop_edge_inst),
    .io_exe_reqs_1_bits_uop_pc_lob          (_fregister_read_io_exe_reqs_1_bits_uop_pc_lob),
    .io_exe_reqs_1_bits_uop_taken           (_fregister_read_io_exe_reqs_1_bits_uop_taken),
    .io_exe_reqs_1_bits_uop_imm_packed      (_fregister_read_io_exe_reqs_1_bits_uop_imm_packed),
    .io_exe_reqs_1_bits_uop_csr_addr        (_fregister_read_io_exe_reqs_1_bits_uop_csr_addr),
    .io_exe_reqs_1_bits_uop_rob_idx         (_fregister_read_io_exe_reqs_1_bits_uop_rob_idx),
    .io_exe_reqs_1_bits_uop_ldq_idx         (_fregister_read_io_exe_reqs_1_bits_uop_ldq_idx),
    .io_exe_reqs_1_bits_uop_stq_idx         (_fregister_read_io_exe_reqs_1_bits_uop_stq_idx),
    .io_exe_reqs_1_bits_uop_rxq_idx         (_fregister_read_io_exe_reqs_1_bits_uop_rxq_idx),
    .io_exe_reqs_1_bits_uop_pdst            (_fregister_read_io_exe_reqs_1_bits_uop_pdst),
    .io_exe_reqs_1_bits_uop_prs1            (_fregister_read_io_exe_reqs_1_bits_uop_prs1),
    .io_exe_reqs_1_bits_uop_prs2            (_fregister_read_io_exe_reqs_1_bits_uop_prs2),
    .io_exe_reqs_1_bits_uop_prs3            (_fregister_read_io_exe_reqs_1_bits_uop_prs3),
    .io_exe_reqs_1_bits_uop_ppred           (_fregister_read_io_exe_reqs_1_bits_uop_ppred),
    .io_exe_reqs_1_bits_uop_prs1_busy       (_fregister_read_io_exe_reqs_1_bits_uop_prs1_busy),
    .io_exe_reqs_1_bits_uop_prs2_busy       (_fregister_read_io_exe_reqs_1_bits_uop_prs2_busy),
    .io_exe_reqs_1_bits_uop_prs3_busy       (_fregister_read_io_exe_reqs_1_bits_uop_prs3_busy),
    .io_exe_reqs_1_bits_uop_ppred_busy      (_fregister_read_io_exe_reqs_1_bits_uop_ppred_busy),
    .io_exe_reqs_1_bits_uop_stale_pdst      (_fregister_read_io_exe_reqs_1_bits_uop_stale_pdst),
    .io_exe_reqs_1_bits_uop_exception       (_fregister_read_io_exe_reqs_1_bits_uop_exception),
    .io_exe_reqs_1_bits_uop_exc_cause       (_fregister_read_io_exe_reqs_1_bits_uop_exc_cause),
    .io_exe_reqs_1_bits_uop_bypassable      (_fregister_read_io_exe_reqs_1_bits_uop_bypassable),
    .io_exe_reqs_1_bits_uop_mem_cmd         (_fregister_read_io_exe_reqs_1_bits_uop_mem_cmd),
    .io_exe_reqs_1_bits_uop_mem_size        (_fregister_read_io_exe_reqs_1_bits_uop_mem_size),
    .io_exe_reqs_1_bits_uop_mem_signed      (_fregister_read_io_exe_reqs_1_bits_uop_mem_signed),
    .io_exe_reqs_1_bits_uop_is_fence        (_fregister_read_io_exe_reqs_1_bits_uop_is_fence),
    .io_exe_reqs_1_bits_uop_is_fencei       (_fregister_read_io_exe_reqs_1_bits_uop_is_fencei),
    .io_exe_reqs_1_bits_uop_is_amo          (_fregister_read_io_exe_reqs_1_bits_uop_is_amo),
    .io_exe_reqs_1_bits_uop_uses_ldq        (_fregister_read_io_exe_reqs_1_bits_uop_uses_ldq),
    .io_exe_reqs_1_bits_uop_uses_stq        (_fregister_read_io_exe_reqs_1_bits_uop_uses_stq),
    .io_exe_reqs_1_bits_uop_is_sys_pc2epc   (_fregister_read_io_exe_reqs_1_bits_uop_is_sys_pc2epc),
    .io_exe_reqs_1_bits_uop_is_unique       (_fregister_read_io_exe_reqs_1_bits_uop_is_unique),
    .io_exe_reqs_1_bits_uop_flush_on_commit (_fregister_read_io_exe_reqs_1_bits_uop_flush_on_commit),
    .io_exe_reqs_1_bits_uop_ldst_is_rs1     (_fregister_read_io_exe_reqs_1_bits_uop_ldst_is_rs1),
    .io_exe_reqs_1_bits_uop_ldst            (_fregister_read_io_exe_reqs_1_bits_uop_ldst),
    .io_exe_reqs_1_bits_uop_lrs1            (_fregister_read_io_exe_reqs_1_bits_uop_lrs1),
    .io_exe_reqs_1_bits_uop_lrs2            (_fregister_read_io_exe_reqs_1_bits_uop_lrs2),
    .io_exe_reqs_1_bits_uop_lrs3            (_fregister_read_io_exe_reqs_1_bits_uop_lrs3),
    .io_exe_reqs_1_bits_uop_ldst_val        (_fregister_read_io_exe_reqs_1_bits_uop_ldst_val),
    .io_exe_reqs_1_bits_uop_dst_rtype       (_fregister_read_io_exe_reqs_1_bits_uop_dst_rtype),
    .io_exe_reqs_1_bits_uop_lrs1_rtype      (_fregister_read_io_exe_reqs_1_bits_uop_lrs1_rtype),
    .io_exe_reqs_1_bits_uop_lrs2_rtype      (_fregister_read_io_exe_reqs_1_bits_uop_lrs2_rtype),
    .io_exe_reqs_1_bits_uop_frs3_en         (_fregister_read_io_exe_reqs_1_bits_uop_frs3_en),
    .io_exe_reqs_1_bits_uop_fp_val          (_fregister_read_io_exe_reqs_1_bits_uop_fp_val),
    .io_exe_reqs_1_bits_uop_fp_single       (_fregister_read_io_exe_reqs_1_bits_uop_fp_single),
    .io_exe_reqs_1_bits_uop_xcpt_pf_if      (_fregister_read_io_exe_reqs_1_bits_uop_xcpt_pf_if),
    .io_exe_reqs_1_bits_uop_xcpt_ae_if      (_fregister_read_io_exe_reqs_1_bits_uop_xcpt_ae_if),
    .io_exe_reqs_1_bits_uop_xcpt_ma_if      (_fregister_read_io_exe_reqs_1_bits_uop_xcpt_ma_if),
    .io_exe_reqs_1_bits_uop_bp_debug_if     (_fregister_read_io_exe_reqs_1_bits_uop_bp_debug_if),
    .io_exe_reqs_1_bits_uop_bp_xcpt_if      (_fregister_read_io_exe_reqs_1_bits_uop_bp_xcpt_if),
    .io_exe_reqs_1_bits_uop_debug_fsrc      (_fregister_read_io_exe_reqs_1_bits_uop_debug_fsrc),
    .io_exe_reqs_1_bits_uop_debug_tsrc      (_fregister_read_io_exe_reqs_1_bits_uop_debug_tsrc),
    .io_exe_reqs_1_bits_rs1_data            (_fregister_read_io_exe_reqs_1_bits_rs1_data),
    .io_exe_reqs_1_bits_rs2_data            (_fregister_read_io_exe_reqs_1_bits_rs2_data),
    .io_exe_reqs_1_bits_rs3_data            (_fregister_read_io_exe_reqs_1_bits_rs3_data),
    .io_kill                                (io_flush_pipeline),
    .io_brupdate_b1_resolve_mask            (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask         (io_brupdate_b1_mispredict_mask)
  );
  Arbiter_16 ll_wbarb (
    .io_in_0_ready                        (_ll_wbarb_io_in_0_ready),
    .io_in_0_valid                        (io_ll_wports_0_valid),
    .io_in_0_bits_uop_uopc                (io_ll_wports_0_bits_uop_uopc),
    .io_in_0_bits_uop_br_mask             (io_ll_wports_0_bits_uop_br_mask),
    .io_in_0_bits_uop_rob_idx             (io_ll_wports_0_bits_uop_rob_idx),
    .io_in_0_bits_uop_stq_idx             (io_ll_wports_0_bits_uop_stq_idx),
    .io_in_0_bits_uop_pdst                (io_ll_wports_0_bits_uop_pdst),
    .io_in_0_bits_uop_is_amo              (io_ll_wports_0_bits_uop_is_amo),
    .io_in_0_bits_uop_uses_stq            (io_ll_wports_0_bits_uop_uses_stq),
    .io_in_0_bits_uop_dst_rtype           (io_ll_wports_0_bits_uop_dst_rtype),
    .io_in_0_bits_uop_fp_val              (io_ll_wports_0_bits_uop_fp_val),
    .io_in_0_bits_data                    ({_ll_wbarb_io_in_0_bits_data_T_3[63], _ll_wbarb_io_in_0_bits_data_T_5[2:1], _GEN, (&{_ll_wbarb_io_in_0_bits_data_T_5[2:1], _GEN}) ? {&(_ll_wbarb_io_in_0_bits_data_rawIn_out_sig_T_2[51:32]), _ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_4[7:1], _ll_wbarb_io_in_0_bits_data_T_14[2], _ll_wbarb_io_in_0_bits_data_rawIn_out_sig_T_2[51:32], _ll_wbarb_io_in_0_bits_data_T_3[31], _ll_wbarb_io_in_0_bits_data_T_14[1], _ll_wbarb_io_in_0_bits_data_T_14[0] | (&(_ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_9[8:7])) & (|(_ll_wbarb_io_in_0_bits_data_T_3[22:0])), _ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_9[5:0], ll_wbarb_io_in_0_bits_data_rawIn_isZeroExpIn_1 ? {_ll_wbarb_io_in_0_bits_data_rawIn_subnormFract_T_2[21:0], 1'h0} : _ll_wbarb_io_in_0_bits_data_T_3[22:0]} : {_ll_wbarb_io_in_0_bits_data_rawIn_adjustedExp_T_4[8:0], _ll_wbarb_io_in_0_bits_data_rawIn_out_sig_T_2}}),
    .io_in_0_bits_predicated              (1'h0),
    .io_in_0_bits_fflags_valid            (1'h0),
    .io_in_0_bits_fflags_bits_uop_rob_idx (7'h0),
    .io_in_0_bits_fflags_bits_flags       (5'h0),
    .io_in_1_ready                        (io_from_int_ready),
    .io_in_1_valid                        (io_from_int_valid),
    .io_in_1_bits_uop_uopc                (io_from_int_bits_uop_uopc),
    .io_in_1_bits_uop_br_mask             (io_from_int_bits_uop_br_mask),
    .io_in_1_bits_uop_rob_idx             (io_from_int_bits_uop_rob_idx),
    .io_in_1_bits_uop_stq_idx             (io_from_int_bits_uop_stq_idx),
    .io_in_1_bits_uop_pdst                (io_from_int_bits_uop_pdst),
    .io_in_1_bits_uop_is_amo              (io_from_int_bits_uop_is_amo),
    .io_in_1_bits_uop_uses_stq            (io_from_int_bits_uop_uses_stq),
    .io_in_1_bits_uop_dst_rtype           (io_from_int_bits_uop_dst_rtype),
    .io_in_1_bits_uop_fp_val              (io_from_int_bits_uop_fp_val),
    .io_in_1_bits_data                    (io_from_int_bits_data),
    .io_in_1_bits_predicated              (io_from_int_bits_predicated),
    .io_in_1_bits_fflags_valid            (io_from_int_bits_fflags_valid),
    .io_in_1_bits_fflags_bits_uop_rob_idx (io_from_int_bits_fflags_bits_uop_rob_idx),
    .io_in_1_bits_fflags_bits_flags       (io_from_int_bits_fflags_bits_flags),
    .io_out_ready                         (1'h1),
    .io_out_valid                         (_ll_wbarb_io_out_valid),
    .io_out_bits_uop_uopc                 (/* unused */),
    .io_out_bits_uop_br_mask              (/* unused */),
    .io_out_bits_uop_rob_idx              (io_wakeups_0_bits_uop_rob_idx),
    .io_out_bits_uop_stq_idx              (/* unused */),
    .io_out_bits_uop_pdst                 (_ll_wbarb_io_out_bits_uop_pdst),
    .io_out_bits_uop_is_amo               (/* unused */),
    .io_out_bits_uop_uses_stq             (/* unused */),
    .io_out_bits_uop_dst_rtype            (_ll_wbarb_io_out_bits_uop_dst_rtype),
    .io_out_bits_uop_fp_val               (io_wakeups_0_bits_uop_fp_val),
    .io_out_bits_data                     (_ll_wbarb_io_out_bits_data),
    .io_out_bits_predicated               (io_wakeups_0_bits_predicated),
    .io_out_bits_fflags_valid             (io_wakeups_0_bits_fflags_valid),
    .io_out_bits_fflags_bits_uop_rob_idx  (io_wakeups_0_bits_fflags_bits_uop_rob_idx),
    .io_out_bits_fflags_bits_flags        (io_wakeups_0_bits_fflags_bits_flags)
  );
  assign io_to_sdq_valid = _io_to_sdq_valid_T & fpiu_is_sdq;
  assign io_to_sdq_bits_uop_rob_idx = _fpu_exe_unit_io_ll_iresp_bits_uop_rob_idx;
  assign io_to_sdq_bits_data = _fpu_exe_unit_io_ll_iresp_bits_data[63:0];
  assign io_to_int_valid = _io_to_sdq_valid_T & ~fpiu_is_sdq;
  assign io_to_int_bits_uop_rob_idx = _fpu_exe_unit_io_ll_iresp_bits_uop_rob_idx;
  assign io_to_int_bits_data = _fpu_exe_unit_io_ll_iresp_bits_data[63:0];
  assign io_wakeups_0_valid = _ll_wbarb_io_out_valid;
  assign io_wakeups_0_bits_uop_pdst = _ll_wbarb_io_out_bits_uop_pdst;
  assign io_wakeups_0_bits_uop_dst_rtype = _ll_wbarb_io_out_bits_uop_dst_rtype;
  assign io_wakeups_1_valid = io_ll_wports_1_valid;
  assign io_wakeups_1_bits_uop_rob_idx = io_ll_wports_1_bits_uop_rob_idx;
  assign io_wakeups_1_bits_uop_pdst = io_ll_wports_1_bits_uop_pdst;
  assign io_wakeups_1_bits_uop_dst_rtype = io_ll_wports_1_bits_uop_dst_rtype;
  assign io_wakeups_1_bits_uop_fp_val = io_ll_wports_1_bits_uop_fp_val;
  assign io_wakeups_2_valid = _io_wakeups_2_valid_output;
  assign io_wakeups_2_bits_uop_pdst = _fpu_exe_unit_io_fresp_bits_uop_pdst;
  assign io_wakeups_2_bits_uop_dst_rtype = _fpu_exe_unit_io_fresp_bits_uop_dst_rtype;
  assign io_wakeups_3_valid = _io_wakeups_3_valid_output;
  assign io_wakeups_3_bits_uop_pdst = _fpu_exe_unit_1_io_fresp_bits_uop_pdst;
  assign io_wakeups_3_bits_uop_dst_rtype = _fpu_exe_unit_1_io_fresp_bits_uop_dst_rtype;
endmodule

