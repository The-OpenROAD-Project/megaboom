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

module IntToFPUnit(
  input         clock,
                reset,
                io_req_valid,
  input  [6:0]  io_req_bits_uop_uopc,
  input  [31:0] io_req_bits_uop_inst,
                io_req_bits_uop_debug_inst,
  input         io_req_bits_uop_is_rvc,
  input  [39:0] io_req_bits_uop_debug_pc,
  input  [2:0]  io_req_bits_uop_iq_type,
  input  [9:0]  io_req_bits_uop_fu_code,
  input  [3:0]  io_req_bits_uop_ctrl_br_type,
  input  [1:0]  io_req_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_req_bits_uop_ctrl_op2_sel,
                io_req_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_req_bits_uop_ctrl_op_fcn,
  input         io_req_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_req_bits_uop_ctrl_csr_cmd,
  input         io_req_bits_uop_ctrl_is_load,
                io_req_bits_uop_ctrl_is_sta,
                io_req_bits_uop_ctrl_is_std,
  input  [1:0]  io_req_bits_uop_iw_state,
  input         io_req_bits_uop_is_br,
                io_req_bits_uop_is_jalr,
                io_req_bits_uop_is_jal,
                io_req_bits_uop_is_sfb,
  input  [19:0] io_req_bits_uop_br_mask,
  input  [4:0]  io_req_bits_uop_br_tag,
  input  [5:0]  io_req_bits_uop_ftq_idx,
  input         io_req_bits_uop_edge_inst,
  input  [5:0]  io_req_bits_uop_pc_lob,
  input         io_req_bits_uop_taken,
  input  [19:0] io_req_bits_uop_imm_packed,
  input  [11:0] io_req_bits_uop_csr_addr,
  input  [6:0]  io_req_bits_uop_rob_idx,
  input  [4:0]  io_req_bits_uop_ldq_idx,
                io_req_bits_uop_stq_idx,
  input  [1:0]  io_req_bits_uop_rxq_idx,
  input  [6:0]  io_req_bits_uop_pdst,
                io_req_bits_uop_prs1,
                io_req_bits_uop_prs2,
                io_req_bits_uop_prs3,
  input  [5:0]  io_req_bits_uop_ppred,
  input         io_req_bits_uop_prs1_busy,
                io_req_bits_uop_prs2_busy,
                io_req_bits_uop_prs3_busy,
                io_req_bits_uop_ppred_busy,
  input  [6:0]  io_req_bits_uop_stale_pdst,
  input         io_req_bits_uop_exception,
  input  [63:0] io_req_bits_uop_exc_cause,
  input         io_req_bits_uop_bypassable,
  input  [4:0]  io_req_bits_uop_mem_cmd,
  input  [1:0]  io_req_bits_uop_mem_size,
  input         io_req_bits_uop_mem_signed,
                io_req_bits_uop_is_fence,
                io_req_bits_uop_is_fencei,
                io_req_bits_uop_is_amo,
                io_req_bits_uop_uses_ldq,
                io_req_bits_uop_uses_stq,
                io_req_bits_uop_is_sys_pc2epc,
                io_req_bits_uop_is_unique,
                io_req_bits_uop_flush_on_commit,
                io_req_bits_uop_ldst_is_rs1,
  input  [5:0]  io_req_bits_uop_ldst,
                io_req_bits_uop_lrs1,
                io_req_bits_uop_lrs2,
                io_req_bits_uop_lrs3,
  input         io_req_bits_uop_ldst_val,
  input  [1:0]  io_req_bits_uop_dst_rtype,
                io_req_bits_uop_lrs1_rtype,
                io_req_bits_uop_lrs2_rtype,
  input         io_req_bits_uop_frs3_en,
                io_req_bits_uop_fp_val,
                io_req_bits_uop_fp_single,
                io_req_bits_uop_xcpt_pf_if,
                io_req_bits_uop_xcpt_ae_if,
                io_req_bits_uop_xcpt_ma_if,
                io_req_bits_uop_bp_debug_if,
                io_req_bits_uop_bp_xcpt_if,
  input  [1:0]  io_req_bits_uop_debug_fsrc,
                io_req_bits_uop_debug_tsrc,
  input  [64:0] io_req_bits_rs1_data,
  input         io_req_bits_kill,
  output        io_resp_valid,
  output [6:0]  io_resp_bits_uop_uopc,
  output [31:0] io_resp_bits_uop_inst,
                io_resp_bits_uop_debug_inst,
  output        io_resp_bits_uop_is_rvc,
  output [39:0] io_resp_bits_uop_debug_pc,
  output [2:0]  io_resp_bits_uop_iq_type,
  output [9:0]  io_resp_bits_uop_fu_code,
  output [3:0]  io_resp_bits_uop_ctrl_br_type,
  output [1:0]  io_resp_bits_uop_ctrl_op1_sel,
  output [2:0]  io_resp_bits_uop_ctrl_op2_sel,
                io_resp_bits_uop_ctrl_imm_sel,
  output [3:0]  io_resp_bits_uop_ctrl_op_fcn,
  output        io_resp_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_resp_bits_uop_ctrl_csr_cmd,
  output        io_resp_bits_uop_ctrl_is_load,
                io_resp_bits_uop_ctrl_is_sta,
                io_resp_bits_uop_ctrl_is_std,
  output [1:0]  io_resp_bits_uop_iw_state,
  output        io_resp_bits_uop_iw_p1_poisoned,
                io_resp_bits_uop_iw_p2_poisoned,
                io_resp_bits_uop_is_br,
                io_resp_bits_uop_is_jalr,
                io_resp_bits_uop_is_jal,
                io_resp_bits_uop_is_sfb,
  output [19:0] io_resp_bits_uop_br_mask,
  output [4:0]  io_resp_bits_uop_br_tag,
  output [5:0]  io_resp_bits_uop_ftq_idx,
  output        io_resp_bits_uop_edge_inst,
  output [5:0]  io_resp_bits_uop_pc_lob,
  output        io_resp_bits_uop_taken,
  output [19:0] io_resp_bits_uop_imm_packed,
  output [11:0] io_resp_bits_uop_csr_addr,
  output [6:0]  io_resp_bits_uop_rob_idx,
  output [4:0]  io_resp_bits_uop_ldq_idx,
                io_resp_bits_uop_stq_idx,
  output [1:0]  io_resp_bits_uop_rxq_idx,
  output [6:0]  io_resp_bits_uop_pdst,
                io_resp_bits_uop_prs1,
                io_resp_bits_uop_prs2,
                io_resp_bits_uop_prs3,
  output [5:0]  io_resp_bits_uop_ppred,
  output        io_resp_bits_uop_prs1_busy,
                io_resp_bits_uop_prs2_busy,
                io_resp_bits_uop_prs3_busy,
                io_resp_bits_uop_ppred_busy,
  output [6:0]  io_resp_bits_uop_stale_pdst,
  output        io_resp_bits_uop_exception,
  output [63:0] io_resp_bits_uop_exc_cause,
  output        io_resp_bits_uop_bypassable,
  output [4:0]  io_resp_bits_uop_mem_cmd,
  output [1:0]  io_resp_bits_uop_mem_size,
  output        io_resp_bits_uop_mem_signed,
                io_resp_bits_uop_is_fence,
                io_resp_bits_uop_is_fencei,
                io_resp_bits_uop_is_amo,
                io_resp_bits_uop_uses_ldq,
                io_resp_bits_uop_uses_stq,
                io_resp_bits_uop_is_sys_pc2epc,
                io_resp_bits_uop_is_unique,
                io_resp_bits_uop_flush_on_commit,
                io_resp_bits_uop_ldst_is_rs1,
  output [5:0]  io_resp_bits_uop_ldst,
                io_resp_bits_uop_lrs1,
                io_resp_bits_uop_lrs2,
                io_resp_bits_uop_lrs3,
  output        io_resp_bits_uop_ldst_val,
  output [1:0]  io_resp_bits_uop_dst_rtype,
                io_resp_bits_uop_lrs1_rtype,
                io_resp_bits_uop_lrs2_rtype,
  output        io_resp_bits_uop_frs3_en,
                io_resp_bits_uop_fp_val,
                io_resp_bits_uop_fp_single,
                io_resp_bits_uop_xcpt_pf_if,
                io_resp_bits_uop_xcpt_ae_if,
                io_resp_bits_uop_xcpt_ma_if,
                io_resp_bits_uop_bp_debug_if,
                io_resp_bits_uop_bp_xcpt_if,
  output [1:0]  io_resp_bits_uop_debug_fsrc,
                io_resp_bits_uop_debug_tsrc,
  output [64:0] io_resp_bits_data,
  output        io_resp_bits_fflags_valid,
  output [6:0]  io_resp_bits_fflags_bits_uop_uopc,
  output [31:0] io_resp_bits_fflags_bits_uop_inst,
                io_resp_bits_fflags_bits_uop_debug_inst,
  output        io_resp_bits_fflags_bits_uop_is_rvc,
  output [39:0] io_resp_bits_fflags_bits_uop_debug_pc,
  output [2:0]  io_resp_bits_fflags_bits_uop_iq_type,
  output [9:0]  io_resp_bits_fflags_bits_uop_fu_code,
  output [3:0]  io_resp_bits_fflags_bits_uop_ctrl_br_type,
  output [1:0]  io_resp_bits_fflags_bits_uop_ctrl_op1_sel,
  output [2:0]  io_resp_bits_fflags_bits_uop_ctrl_op2_sel,
                io_resp_bits_fflags_bits_uop_ctrl_imm_sel,
  output [3:0]  io_resp_bits_fflags_bits_uop_ctrl_op_fcn,
  output        io_resp_bits_fflags_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_resp_bits_fflags_bits_uop_ctrl_csr_cmd,
  output        io_resp_bits_fflags_bits_uop_ctrl_is_load,
                io_resp_bits_fflags_bits_uop_ctrl_is_sta,
                io_resp_bits_fflags_bits_uop_ctrl_is_std,
  output [1:0]  io_resp_bits_fflags_bits_uop_iw_state,
  output        io_resp_bits_fflags_bits_uop_iw_p1_poisoned,
                io_resp_bits_fflags_bits_uop_iw_p2_poisoned,
                io_resp_bits_fflags_bits_uop_is_br,
                io_resp_bits_fflags_bits_uop_is_jalr,
                io_resp_bits_fflags_bits_uop_is_jal,
                io_resp_bits_fflags_bits_uop_is_sfb,
  output [19:0] io_resp_bits_fflags_bits_uop_br_mask,
  output [4:0]  io_resp_bits_fflags_bits_uop_br_tag,
  output [5:0]  io_resp_bits_fflags_bits_uop_ftq_idx,
  output        io_resp_bits_fflags_bits_uop_edge_inst,
  output [5:0]  io_resp_bits_fflags_bits_uop_pc_lob,
  output        io_resp_bits_fflags_bits_uop_taken,
  output [19:0] io_resp_bits_fflags_bits_uop_imm_packed,
  output [11:0] io_resp_bits_fflags_bits_uop_csr_addr,
  output [6:0]  io_resp_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_resp_bits_fflags_bits_uop_ldq_idx,
                io_resp_bits_fflags_bits_uop_stq_idx,
  output [1:0]  io_resp_bits_fflags_bits_uop_rxq_idx,
  output [6:0]  io_resp_bits_fflags_bits_uop_pdst,
                io_resp_bits_fflags_bits_uop_prs1,
                io_resp_bits_fflags_bits_uop_prs2,
                io_resp_bits_fflags_bits_uop_prs3,
  output [5:0]  io_resp_bits_fflags_bits_uop_ppred,
  output        io_resp_bits_fflags_bits_uop_prs1_busy,
                io_resp_bits_fflags_bits_uop_prs2_busy,
                io_resp_bits_fflags_bits_uop_prs3_busy,
                io_resp_bits_fflags_bits_uop_ppred_busy,
  output [6:0]  io_resp_bits_fflags_bits_uop_stale_pdst,
  output        io_resp_bits_fflags_bits_uop_exception,
  output [63:0] io_resp_bits_fflags_bits_uop_exc_cause,
  output        io_resp_bits_fflags_bits_uop_bypassable,
  output [4:0]  io_resp_bits_fflags_bits_uop_mem_cmd,
  output [1:0]  io_resp_bits_fflags_bits_uop_mem_size,
  output        io_resp_bits_fflags_bits_uop_mem_signed,
                io_resp_bits_fflags_bits_uop_is_fence,
                io_resp_bits_fflags_bits_uop_is_fencei,
                io_resp_bits_fflags_bits_uop_is_amo,
                io_resp_bits_fflags_bits_uop_uses_ldq,
                io_resp_bits_fflags_bits_uop_uses_stq,
                io_resp_bits_fflags_bits_uop_is_sys_pc2epc,
                io_resp_bits_fflags_bits_uop_is_unique,
                io_resp_bits_fflags_bits_uop_flush_on_commit,
                io_resp_bits_fflags_bits_uop_ldst_is_rs1,
  output [5:0]  io_resp_bits_fflags_bits_uop_ldst,
                io_resp_bits_fflags_bits_uop_lrs1,
                io_resp_bits_fflags_bits_uop_lrs2,
                io_resp_bits_fflags_bits_uop_lrs3,
  output        io_resp_bits_fflags_bits_uop_ldst_val,
  output [1:0]  io_resp_bits_fflags_bits_uop_dst_rtype,
                io_resp_bits_fflags_bits_uop_lrs1_rtype,
                io_resp_bits_fflags_bits_uop_lrs2_rtype,
  output        io_resp_bits_fflags_bits_uop_frs3_en,
                io_resp_bits_fflags_bits_uop_fp_val,
                io_resp_bits_fflags_bits_uop_fp_single,
                io_resp_bits_fflags_bits_uop_xcpt_pf_if,
                io_resp_bits_fflags_bits_uop_xcpt_ae_if,
                io_resp_bits_fflags_bits_uop_xcpt_ma_if,
                io_resp_bits_fflags_bits_uop_bp_debug_if,
                io_resp_bits_fflags_bits_uop_bp_xcpt_if,
  output [1:0]  io_resp_bits_fflags_bits_uop_debug_fsrc,
                io_resp_bits_fflags_bits_uop_debug_tsrc,
  output [4:0]  io_resp_bits_fflags_bits_flags,
  input  [19:0] io_brupdate_b1_resolve_mask,
                io_brupdate_b1_mispredict_mask,
  input  [2:0]  io_fcsr_rm
);

  wire [64:0] _ifpu_io_out_bits_data;
  wire [1:0]  _fp_decoder_io_sigs_typeTagIn;
  wire [1:0]  _fp_decoder_io_sigs_typeTagOut;
  wire        _fp_decoder_io_sigs_fromint;
  wire        _fp_decoder_io_sigs_wflags;
  reg         r_valids_0;
  reg         r_valids_1;
  reg  [6:0]  r_uops_0_uopc;
  reg  [31:0] r_uops_0_inst;
  reg  [31:0] r_uops_0_debug_inst;
  reg         r_uops_0_is_rvc;
  reg  [39:0] r_uops_0_debug_pc;
  reg  [2:0]  r_uops_0_iq_type;
  reg  [9:0]  r_uops_0_fu_code;
  reg  [3:0]  r_uops_0_ctrl_br_type;
  reg  [1:0]  r_uops_0_ctrl_op1_sel;
  reg  [2:0]  r_uops_0_ctrl_op2_sel;
  reg  [2:0]  r_uops_0_ctrl_imm_sel;
  reg  [3:0]  r_uops_0_ctrl_op_fcn;
  reg         r_uops_0_ctrl_fcn_dw;
  reg  [2:0]  r_uops_0_ctrl_csr_cmd;
  reg         r_uops_0_ctrl_is_load;
  reg         r_uops_0_ctrl_is_sta;
  reg         r_uops_0_ctrl_is_std;
  reg  [1:0]  r_uops_0_iw_state;
  reg         r_uops_0_iw_p1_poisoned;
  reg         r_uops_0_iw_p2_poisoned;
  reg         r_uops_0_is_br;
  reg         r_uops_0_is_jalr;
  reg         r_uops_0_is_jal;
  reg         r_uops_0_is_sfb;
  reg  [19:0] r_uops_0_br_mask;
  reg  [4:0]  r_uops_0_br_tag;
  reg  [5:0]  r_uops_0_ftq_idx;
  reg         r_uops_0_edge_inst;
  reg  [5:0]  r_uops_0_pc_lob;
  reg         r_uops_0_taken;
  reg  [19:0] r_uops_0_imm_packed;
  reg  [11:0] r_uops_0_csr_addr;
  reg  [6:0]  r_uops_0_rob_idx;
  reg  [4:0]  r_uops_0_ldq_idx;
  reg  [4:0]  r_uops_0_stq_idx;
  reg  [1:0]  r_uops_0_rxq_idx;
  reg  [6:0]  r_uops_0_pdst;
  reg  [6:0]  r_uops_0_prs1;
  reg  [6:0]  r_uops_0_prs2;
  reg  [6:0]  r_uops_0_prs3;
  reg  [5:0]  r_uops_0_ppred;
  reg         r_uops_0_prs1_busy;
  reg         r_uops_0_prs2_busy;
  reg         r_uops_0_prs3_busy;
  reg         r_uops_0_ppred_busy;
  reg  [6:0]  r_uops_0_stale_pdst;
  reg         r_uops_0_exception;
  reg  [63:0] r_uops_0_exc_cause;
  reg         r_uops_0_bypassable;
  reg  [4:0]  r_uops_0_mem_cmd;
  reg  [1:0]  r_uops_0_mem_size;
  reg         r_uops_0_mem_signed;
  reg         r_uops_0_is_fence;
  reg         r_uops_0_is_fencei;
  reg         r_uops_0_is_amo;
  reg         r_uops_0_uses_ldq;
  reg         r_uops_0_uses_stq;
  reg         r_uops_0_is_sys_pc2epc;
  reg         r_uops_0_is_unique;
  reg         r_uops_0_flush_on_commit;
  reg         r_uops_0_ldst_is_rs1;
  reg  [5:0]  r_uops_0_ldst;
  reg  [5:0]  r_uops_0_lrs1;
  reg  [5:0]  r_uops_0_lrs2;
  reg  [5:0]  r_uops_0_lrs3;
  reg         r_uops_0_ldst_val;
  reg  [1:0]  r_uops_0_dst_rtype;
  reg  [1:0]  r_uops_0_lrs1_rtype;
  reg  [1:0]  r_uops_0_lrs2_rtype;
  reg         r_uops_0_frs3_en;
  reg         r_uops_0_fp_val;
  reg         r_uops_0_fp_single;
  reg         r_uops_0_xcpt_pf_if;
  reg         r_uops_0_xcpt_ae_if;
  reg         r_uops_0_xcpt_ma_if;
  reg         r_uops_0_bp_debug_if;
  reg         r_uops_0_bp_xcpt_if;
  reg  [1:0]  r_uops_0_debug_fsrc;
  reg  [1:0]  r_uops_0_debug_tsrc;
  reg  [6:0]  r_uops_1_uopc;
  reg  [31:0] r_uops_1_inst;
  reg  [31:0] r_uops_1_debug_inst;
  reg         r_uops_1_is_rvc;
  reg  [39:0] r_uops_1_debug_pc;
  reg  [2:0]  r_uops_1_iq_type;
  reg  [9:0]  r_uops_1_fu_code;
  reg  [3:0]  r_uops_1_ctrl_br_type;
  reg  [1:0]  r_uops_1_ctrl_op1_sel;
  reg  [2:0]  r_uops_1_ctrl_op2_sel;
  reg  [2:0]  r_uops_1_ctrl_imm_sel;
  reg  [3:0]  r_uops_1_ctrl_op_fcn;
  reg         r_uops_1_ctrl_fcn_dw;
  reg  [2:0]  r_uops_1_ctrl_csr_cmd;
  reg         r_uops_1_ctrl_is_load;
  reg         r_uops_1_ctrl_is_sta;
  reg         r_uops_1_ctrl_is_std;
  reg  [1:0]  r_uops_1_iw_state;
  reg         r_uops_1_iw_p1_poisoned;
  reg         r_uops_1_iw_p2_poisoned;
  reg         r_uops_1_is_br;
  reg         r_uops_1_is_jalr;
  reg         r_uops_1_is_jal;
  reg         r_uops_1_is_sfb;
  reg  [19:0] r_uops_1_br_mask;
  reg  [4:0]  r_uops_1_br_tag;
  reg  [5:0]  r_uops_1_ftq_idx;
  reg         r_uops_1_edge_inst;
  reg  [5:0]  r_uops_1_pc_lob;
  reg         r_uops_1_taken;
  reg  [19:0] r_uops_1_imm_packed;
  reg  [11:0] r_uops_1_csr_addr;
  reg  [6:0]  r_uops_1_rob_idx;
  reg  [4:0]  r_uops_1_ldq_idx;
  reg  [4:0]  r_uops_1_stq_idx;
  reg  [1:0]  r_uops_1_rxq_idx;
  reg  [6:0]  r_uops_1_pdst;
  reg  [6:0]  r_uops_1_prs1;
  reg  [6:0]  r_uops_1_prs2;
  reg  [6:0]  r_uops_1_prs3;
  reg  [5:0]  r_uops_1_ppred;
  reg         r_uops_1_prs1_busy;
  reg         r_uops_1_prs2_busy;
  reg         r_uops_1_prs3_busy;
  reg         r_uops_1_ppred_busy;
  reg  [6:0]  r_uops_1_stale_pdst;
  reg         r_uops_1_exception;
  reg  [63:0] r_uops_1_exc_cause;
  reg         r_uops_1_bypassable;
  reg  [4:0]  r_uops_1_mem_cmd;
  reg  [1:0]  r_uops_1_mem_size;
  reg         r_uops_1_mem_signed;
  reg         r_uops_1_is_fence;
  reg         r_uops_1_is_fencei;
  reg         r_uops_1_is_amo;
  reg         r_uops_1_uses_ldq;
  reg         r_uops_1_uses_stq;
  reg         r_uops_1_is_sys_pc2epc;
  reg         r_uops_1_is_unique;
  reg         r_uops_1_flush_on_commit;
  reg         r_uops_1_ldst_is_rs1;
  reg  [5:0]  r_uops_1_ldst;
  reg  [5:0]  r_uops_1_lrs1;
  reg  [5:0]  r_uops_1_lrs2;
  reg  [5:0]  r_uops_1_lrs3;
  reg         r_uops_1_ldst_val;
  reg  [1:0]  r_uops_1_dst_rtype;
  reg  [1:0]  r_uops_1_lrs1_rtype;
  reg  [1:0]  r_uops_1_lrs2_rtype;
  reg         r_uops_1_frs3_en;
  reg         r_uops_1_fp_val;
  reg         r_uops_1_fp_single;
  reg         r_uops_1_xcpt_pf_if;
  reg         r_uops_1_xcpt_ae_if;
  reg         r_uops_1_xcpt_ma_if;
  reg         r_uops_1_bp_debug_if;
  reg         r_uops_1_bp_xcpt_if;
  reg  [1:0]  r_uops_1_debug_fsrc;
  reg  [1:0]  r_uops_1_debug_tsrc;
  wire [19:0] _io_resp_bits_uop_br_mask_output = r_uops_1_br_mask & ~io_brupdate_b1_resolve_mask;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & io_req_valid & _fp_decoder_io_sigs_fromint & (_fp_decoder_io_sigs_typeTagIn[0] | (&(io_req_bits_rs1_data[64:60]))) & (_fp_decoder_io_sigs_typeTagIn[0] ? io_req_bits_rs1_data[64] : io_req_bits_rs1_data[31])) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [func] IntToFP integer input has 65th high-order bit set!\n    at functional-unit.scala:618 assert (!(io.req.valid && fp_ctrl.fromint && req.in1(xLen).asBool),\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & io_req_valid & ~_fp_decoder_io_sigs_fromint) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [func] Only support fromInt micro-ops.\n    at functional-unit.scala:621 assert (!(io.req.valid && !fp_ctrl.fromint),\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg         out_double_pipe_v;
  reg         out_double_pipe_b;
  reg         out_double_pipe_pipe_b;
  always @(posedge clock) begin
    if (reset) begin
      r_valids_0 <= 1'h0;
      r_valids_1 <= 1'h0;
      out_double_pipe_v <= 1'h0;
    end
    else begin
      r_valids_0 <= io_req_valid & (io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask) == 20'h0 & ~io_req_bits_kill;
      r_valids_1 <= r_valids_0 & (io_brupdate_b1_mispredict_mask & r_uops_0_br_mask) == 20'h0 & ~io_req_bits_kill;
      out_double_pipe_v <= io_req_valid;
    end
    r_uops_0_uopc <= io_req_bits_uop_uopc;
    r_uops_0_inst <= io_req_bits_uop_inst;
    r_uops_0_debug_inst <= io_req_bits_uop_debug_inst;
    r_uops_0_is_rvc <= io_req_bits_uop_is_rvc;
    r_uops_0_debug_pc <= io_req_bits_uop_debug_pc;
    r_uops_0_iq_type <= io_req_bits_uop_iq_type;
    r_uops_0_fu_code <= io_req_bits_uop_fu_code;
    r_uops_0_ctrl_br_type <= io_req_bits_uop_ctrl_br_type;
    r_uops_0_ctrl_op1_sel <= io_req_bits_uop_ctrl_op1_sel;
    r_uops_0_ctrl_op2_sel <= io_req_bits_uop_ctrl_op2_sel;
    r_uops_0_ctrl_imm_sel <= io_req_bits_uop_ctrl_imm_sel;
    r_uops_0_ctrl_op_fcn <= io_req_bits_uop_ctrl_op_fcn;
    r_uops_0_ctrl_fcn_dw <= io_req_bits_uop_ctrl_fcn_dw;
    r_uops_0_ctrl_csr_cmd <= io_req_bits_uop_ctrl_csr_cmd;
    r_uops_0_ctrl_is_load <= io_req_bits_uop_ctrl_is_load;
    r_uops_0_ctrl_is_sta <= io_req_bits_uop_ctrl_is_sta;
    r_uops_0_ctrl_is_std <= io_req_bits_uop_ctrl_is_std;
    r_uops_0_iw_state <= io_req_bits_uop_iw_state;
    r_uops_0_iw_p1_poisoned <= 1'h0;
    r_uops_0_iw_p2_poisoned <= 1'h0;
    r_uops_0_is_br <= io_req_bits_uop_is_br;
    r_uops_0_is_jalr <= io_req_bits_uop_is_jalr;
    r_uops_0_is_jal <= io_req_bits_uop_is_jal;
    r_uops_0_is_sfb <= io_req_bits_uop_is_sfb;
    r_uops_0_br_mask <= io_req_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask;
    r_uops_0_br_tag <= io_req_bits_uop_br_tag;
    r_uops_0_ftq_idx <= io_req_bits_uop_ftq_idx;
    r_uops_0_edge_inst <= io_req_bits_uop_edge_inst;
    r_uops_0_pc_lob <= io_req_bits_uop_pc_lob;
    r_uops_0_taken <= io_req_bits_uop_taken;
    r_uops_0_imm_packed <= io_req_bits_uop_imm_packed;
    r_uops_0_csr_addr <= io_req_bits_uop_csr_addr;
    r_uops_0_rob_idx <= io_req_bits_uop_rob_idx;
    r_uops_0_ldq_idx <= io_req_bits_uop_ldq_idx;
    r_uops_0_stq_idx <= io_req_bits_uop_stq_idx;
    r_uops_0_rxq_idx <= io_req_bits_uop_rxq_idx;
    r_uops_0_pdst <= io_req_bits_uop_pdst;
    r_uops_0_prs1 <= io_req_bits_uop_prs1;
    r_uops_0_prs2 <= io_req_bits_uop_prs2;
    r_uops_0_prs3 <= io_req_bits_uop_prs3;
    r_uops_0_ppred <= io_req_bits_uop_ppred;
    r_uops_0_prs1_busy <= io_req_bits_uop_prs1_busy;
    r_uops_0_prs2_busy <= io_req_bits_uop_prs2_busy;
    r_uops_0_prs3_busy <= io_req_bits_uop_prs3_busy;
    r_uops_0_ppred_busy <= io_req_bits_uop_ppred_busy;
    r_uops_0_stale_pdst <= io_req_bits_uop_stale_pdst;
    r_uops_0_exception <= io_req_bits_uop_exception;
    r_uops_0_exc_cause <= io_req_bits_uop_exc_cause;
    r_uops_0_bypassable <= io_req_bits_uop_bypassable;
    r_uops_0_mem_cmd <= io_req_bits_uop_mem_cmd;
    r_uops_0_mem_size <= io_req_bits_uop_mem_size;
    r_uops_0_mem_signed <= io_req_bits_uop_mem_signed;
    r_uops_0_is_fence <= io_req_bits_uop_is_fence;
    r_uops_0_is_fencei <= io_req_bits_uop_is_fencei;
    r_uops_0_is_amo <= io_req_bits_uop_is_amo;
    r_uops_0_uses_ldq <= io_req_bits_uop_uses_ldq;
    r_uops_0_uses_stq <= io_req_bits_uop_uses_stq;
    r_uops_0_is_sys_pc2epc <= io_req_bits_uop_is_sys_pc2epc;
    r_uops_0_is_unique <= io_req_bits_uop_is_unique;
    r_uops_0_flush_on_commit <= io_req_bits_uop_flush_on_commit;
    r_uops_0_ldst_is_rs1 <= io_req_bits_uop_ldst_is_rs1;
    r_uops_0_ldst <= io_req_bits_uop_ldst;
    r_uops_0_lrs1 <= io_req_bits_uop_lrs1;
    r_uops_0_lrs2 <= io_req_bits_uop_lrs2;
    r_uops_0_lrs3 <= io_req_bits_uop_lrs3;
    r_uops_0_ldst_val <= io_req_bits_uop_ldst_val;
    r_uops_0_dst_rtype <= io_req_bits_uop_dst_rtype;
    r_uops_0_lrs1_rtype <= io_req_bits_uop_lrs1_rtype;
    r_uops_0_lrs2_rtype <= io_req_bits_uop_lrs2_rtype;
    r_uops_0_frs3_en <= io_req_bits_uop_frs3_en;
    r_uops_0_fp_val <= io_req_bits_uop_fp_val;
    r_uops_0_fp_single <= io_req_bits_uop_fp_single;
    r_uops_0_xcpt_pf_if <= io_req_bits_uop_xcpt_pf_if;
    r_uops_0_xcpt_ae_if <= io_req_bits_uop_xcpt_ae_if;
    r_uops_0_xcpt_ma_if <= io_req_bits_uop_xcpt_ma_if;
    r_uops_0_bp_debug_if <= io_req_bits_uop_bp_debug_if;
    r_uops_0_bp_xcpt_if <= io_req_bits_uop_bp_xcpt_if;
    r_uops_0_debug_fsrc <= io_req_bits_uop_debug_fsrc;
    r_uops_0_debug_tsrc <= io_req_bits_uop_debug_tsrc;
    r_uops_1_uopc <= r_uops_0_uopc;
    r_uops_1_inst <= r_uops_0_inst;
    r_uops_1_debug_inst <= r_uops_0_debug_inst;
    r_uops_1_is_rvc <= r_uops_0_is_rvc;
    r_uops_1_debug_pc <= r_uops_0_debug_pc;
    r_uops_1_iq_type <= r_uops_0_iq_type;
    r_uops_1_fu_code <= r_uops_0_fu_code;
    r_uops_1_ctrl_br_type <= r_uops_0_ctrl_br_type;
    r_uops_1_ctrl_op1_sel <= r_uops_0_ctrl_op1_sel;
    r_uops_1_ctrl_op2_sel <= r_uops_0_ctrl_op2_sel;
    r_uops_1_ctrl_imm_sel <= r_uops_0_ctrl_imm_sel;
    r_uops_1_ctrl_op_fcn <= r_uops_0_ctrl_op_fcn;
    r_uops_1_ctrl_fcn_dw <= r_uops_0_ctrl_fcn_dw;
    r_uops_1_ctrl_csr_cmd <= r_uops_0_ctrl_csr_cmd;
    r_uops_1_ctrl_is_load <= r_uops_0_ctrl_is_load;
    r_uops_1_ctrl_is_sta <= r_uops_0_ctrl_is_sta;
    r_uops_1_ctrl_is_std <= r_uops_0_ctrl_is_std;
    r_uops_1_iw_state <= r_uops_0_iw_state;
    r_uops_1_iw_p1_poisoned <= r_uops_0_iw_p1_poisoned;
    r_uops_1_iw_p2_poisoned <= r_uops_0_iw_p2_poisoned;
    r_uops_1_is_br <= r_uops_0_is_br;
    r_uops_1_is_jalr <= r_uops_0_is_jalr;
    r_uops_1_is_jal <= r_uops_0_is_jal;
    r_uops_1_is_sfb <= r_uops_0_is_sfb;
    r_uops_1_br_mask <= r_uops_0_br_mask & ~io_brupdate_b1_resolve_mask;
    r_uops_1_br_tag <= r_uops_0_br_tag;
    r_uops_1_ftq_idx <= r_uops_0_ftq_idx;
    r_uops_1_edge_inst <= r_uops_0_edge_inst;
    r_uops_1_pc_lob <= r_uops_0_pc_lob;
    r_uops_1_taken <= r_uops_0_taken;
    r_uops_1_imm_packed <= r_uops_0_imm_packed;
    r_uops_1_csr_addr <= r_uops_0_csr_addr;
    r_uops_1_rob_idx <= r_uops_0_rob_idx;
    r_uops_1_ldq_idx <= r_uops_0_ldq_idx;
    r_uops_1_stq_idx <= r_uops_0_stq_idx;
    r_uops_1_rxq_idx <= r_uops_0_rxq_idx;
    r_uops_1_pdst <= r_uops_0_pdst;
    r_uops_1_prs1 <= r_uops_0_prs1;
    r_uops_1_prs2 <= r_uops_0_prs2;
    r_uops_1_prs3 <= r_uops_0_prs3;
    r_uops_1_ppred <= r_uops_0_ppred;
    r_uops_1_prs1_busy <= r_uops_0_prs1_busy;
    r_uops_1_prs2_busy <= r_uops_0_prs2_busy;
    r_uops_1_prs3_busy <= r_uops_0_prs3_busy;
    r_uops_1_ppred_busy <= r_uops_0_ppred_busy;
    r_uops_1_stale_pdst <= r_uops_0_stale_pdst;
    r_uops_1_exception <= r_uops_0_exception;
    r_uops_1_exc_cause <= r_uops_0_exc_cause;
    r_uops_1_bypassable <= r_uops_0_bypassable;
    r_uops_1_mem_cmd <= r_uops_0_mem_cmd;
    r_uops_1_mem_size <= r_uops_0_mem_size;
    r_uops_1_mem_signed <= r_uops_0_mem_signed;
    r_uops_1_is_fence <= r_uops_0_is_fence;
    r_uops_1_is_fencei <= r_uops_0_is_fencei;
    r_uops_1_is_amo <= r_uops_0_is_amo;
    r_uops_1_uses_ldq <= r_uops_0_uses_ldq;
    r_uops_1_uses_stq <= r_uops_0_uses_stq;
    r_uops_1_is_sys_pc2epc <= r_uops_0_is_sys_pc2epc;
    r_uops_1_is_unique <= r_uops_0_is_unique;
    r_uops_1_flush_on_commit <= r_uops_0_flush_on_commit;
    r_uops_1_ldst_is_rs1 <= r_uops_0_ldst_is_rs1;
    r_uops_1_ldst <= r_uops_0_ldst;
    r_uops_1_lrs1 <= r_uops_0_lrs1;
    r_uops_1_lrs2 <= r_uops_0_lrs2;
    r_uops_1_lrs3 <= r_uops_0_lrs3;
    r_uops_1_ldst_val <= r_uops_0_ldst_val;
    r_uops_1_dst_rtype <= r_uops_0_dst_rtype;
    r_uops_1_lrs1_rtype <= r_uops_0_lrs1_rtype;
    r_uops_1_lrs2_rtype <= r_uops_0_lrs2_rtype;
    r_uops_1_frs3_en <= r_uops_0_frs3_en;
    r_uops_1_fp_val <= r_uops_0_fp_val;
    r_uops_1_fp_single <= r_uops_0_fp_single;
    r_uops_1_xcpt_pf_if <= r_uops_0_xcpt_pf_if;
    r_uops_1_xcpt_ae_if <= r_uops_0_xcpt_ae_if;
    r_uops_1_xcpt_ma_if <= r_uops_0_xcpt_ma_if;
    r_uops_1_bp_debug_if <= r_uops_0_bp_debug_if;
    r_uops_1_bp_xcpt_if <= r_uops_0_bp_xcpt_if;
    r_uops_1_debug_fsrc <= r_uops_0_debug_fsrc;
    r_uops_1_debug_tsrc <= r_uops_0_debug_tsrc;
    if (io_req_valid)
      out_double_pipe_b <= _fp_decoder_io_sigs_typeTagOut == 2'h1;
    if (out_double_pipe_v)
      out_double_pipe_pipe_b <= out_double_pipe_b;
  end // always @(posedge)
  UOPCodeFPUDecoder fp_decoder (
    .io_uopc            (io_req_bits_uop_uopc),
    .io_sigs_ren2       (/* unused */),
    .io_sigs_ren3       (/* unused */),
    .io_sigs_swap23     (/* unused */),
    .io_sigs_typeTagIn  (_fp_decoder_io_sigs_typeTagIn),
    .io_sigs_typeTagOut (_fp_decoder_io_sigs_typeTagOut),
    .io_sigs_fromint    (_fp_decoder_io_sigs_fromint),
    .io_sigs_toint      (/* unused */),
    .io_sigs_fastpipe   (/* unused */),
    .io_sigs_fma        (/* unused */),
    .io_sigs_wflags     (_fp_decoder_io_sigs_wflags)
  );
  IntToFP ifpu (
    .clock                (clock),
    .reset                (reset),
    .io_in_valid          (io_req_valid),
    .io_in_bits_typeTagIn (_fp_decoder_io_sigs_typeTagIn),
    .io_in_bits_wflags    (_fp_decoder_io_sigs_wflags),
    .io_in_bits_rm        ((&(io_req_bits_uop_imm_packed[2:0])) ? io_fcsr_rm : io_req_bits_uop_imm_packed[2:0]),
    .io_in_bits_typ       (io_req_bits_uop_imm_packed[9:8]),
    .io_in_bits_in1       (io_req_bits_rs1_data[63:0]),
    .io_out_valid         (io_resp_bits_fflags_valid),
    .io_out_bits_data     (_ifpu_io_out_bits_data),
    .io_out_bits_exc      (io_resp_bits_fflags_bits_flags)
  );
  assign io_resp_valid = r_valids_1 & (io_brupdate_b1_mispredict_mask & r_uops_1_br_mask) == 20'h0;
  assign io_resp_bits_uop_uopc = r_uops_1_uopc;
  assign io_resp_bits_uop_inst = r_uops_1_inst;
  assign io_resp_bits_uop_debug_inst = r_uops_1_debug_inst;
  assign io_resp_bits_uop_is_rvc = r_uops_1_is_rvc;
  assign io_resp_bits_uop_debug_pc = r_uops_1_debug_pc;
  assign io_resp_bits_uop_iq_type = r_uops_1_iq_type;
  assign io_resp_bits_uop_fu_code = r_uops_1_fu_code;
  assign io_resp_bits_uop_ctrl_br_type = r_uops_1_ctrl_br_type;
  assign io_resp_bits_uop_ctrl_op1_sel = r_uops_1_ctrl_op1_sel;
  assign io_resp_bits_uop_ctrl_op2_sel = r_uops_1_ctrl_op2_sel;
  assign io_resp_bits_uop_ctrl_imm_sel = r_uops_1_ctrl_imm_sel;
  assign io_resp_bits_uop_ctrl_op_fcn = r_uops_1_ctrl_op_fcn;
  assign io_resp_bits_uop_ctrl_fcn_dw = r_uops_1_ctrl_fcn_dw;
  assign io_resp_bits_uop_ctrl_csr_cmd = r_uops_1_ctrl_csr_cmd;
  assign io_resp_bits_uop_ctrl_is_load = r_uops_1_ctrl_is_load;
  assign io_resp_bits_uop_ctrl_is_sta = r_uops_1_ctrl_is_sta;
  assign io_resp_bits_uop_ctrl_is_std = r_uops_1_ctrl_is_std;
  assign io_resp_bits_uop_iw_state = r_uops_1_iw_state;
  assign io_resp_bits_uop_iw_p1_poisoned = r_uops_1_iw_p1_poisoned;
  assign io_resp_bits_uop_iw_p2_poisoned = r_uops_1_iw_p2_poisoned;
  assign io_resp_bits_uop_is_br = r_uops_1_is_br;
  assign io_resp_bits_uop_is_jalr = r_uops_1_is_jalr;
  assign io_resp_bits_uop_is_jal = r_uops_1_is_jal;
  assign io_resp_bits_uop_is_sfb = r_uops_1_is_sfb;
  assign io_resp_bits_uop_br_mask = _io_resp_bits_uop_br_mask_output;
  assign io_resp_bits_uop_br_tag = r_uops_1_br_tag;
  assign io_resp_bits_uop_ftq_idx = r_uops_1_ftq_idx;
  assign io_resp_bits_uop_edge_inst = r_uops_1_edge_inst;
  assign io_resp_bits_uop_pc_lob = r_uops_1_pc_lob;
  assign io_resp_bits_uop_taken = r_uops_1_taken;
  assign io_resp_bits_uop_imm_packed = r_uops_1_imm_packed;
  assign io_resp_bits_uop_csr_addr = r_uops_1_csr_addr;
  assign io_resp_bits_uop_rob_idx = r_uops_1_rob_idx;
  assign io_resp_bits_uop_ldq_idx = r_uops_1_ldq_idx;
  assign io_resp_bits_uop_stq_idx = r_uops_1_stq_idx;
  assign io_resp_bits_uop_rxq_idx = r_uops_1_rxq_idx;
  assign io_resp_bits_uop_pdst = r_uops_1_pdst;
  assign io_resp_bits_uop_prs1 = r_uops_1_prs1;
  assign io_resp_bits_uop_prs2 = r_uops_1_prs2;
  assign io_resp_bits_uop_prs3 = r_uops_1_prs3;
  assign io_resp_bits_uop_ppred = r_uops_1_ppred;
  assign io_resp_bits_uop_prs1_busy = r_uops_1_prs1_busy;
  assign io_resp_bits_uop_prs2_busy = r_uops_1_prs2_busy;
  assign io_resp_bits_uop_prs3_busy = r_uops_1_prs3_busy;
  assign io_resp_bits_uop_ppred_busy = r_uops_1_ppred_busy;
  assign io_resp_bits_uop_stale_pdst = r_uops_1_stale_pdst;
  assign io_resp_bits_uop_exception = r_uops_1_exception;
  assign io_resp_bits_uop_exc_cause = r_uops_1_exc_cause;
  assign io_resp_bits_uop_bypassable = r_uops_1_bypassable;
  assign io_resp_bits_uop_mem_cmd = r_uops_1_mem_cmd;
  assign io_resp_bits_uop_mem_size = r_uops_1_mem_size;
  assign io_resp_bits_uop_mem_signed = r_uops_1_mem_signed;
  assign io_resp_bits_uop_is_fence = r_uops_1_is_fence;
  assign io_resp_bits_uop_is_fencei = r_uops_1_is_fencei;
  assign io_resp_bits_uop_is_amo = r_uops_1_is_amo;
  assign io_resp_bits_uop_uses_ldq = r_uops_1_uses_ldq;
  assign io_resp_bits_uop_uses_stq = r_uops_1_uses_stq;
  assign io_resp_bits_uop_is_sys_pc2epc = r_uops_1_is_sys_pc2epc;
  assign io_resp_bits_uop_is_unique = r_uops_1_is_unique;
  assign io_resp_bits_uop_flush_on_commit = r_uops_1_flush_on_commit;
  assign io_resp_bits_uop_ldst_is_rs1 = r_uops_1_ldst_is_rs1;
  assign io_resp_bits_uop_ldst = r_uops_1_ldst;
  assign io_resp_bits_uop_lrs1 = r_uops_1_lrs1;
  assign io_resp_bits_uop_lrs2 = r_uops_1_lrs2;
  assign io_resp_bits_uop_lrs3 = r_uops_1_lrs3;
  assign io_resp_bits_uop_ldst_val = r_uops_1_ldst_val;
  assign io_resp_bits_uop_dst_rtype = r_uops_1_dst_rtype;
  assign io_resp_bits_uop_lrs1_rtype = r_uops_1_lrs1_rtype;
  assign io_resp_bits_uop_lrs2_rtype = r_uops_1_lrs2_rtype;
  assign io_resp_bits_uop_frs3_en = r_uops_1_frs3_en;
  assign io_resp_bits_uop_fp_val = r_uops_1_fp_val;
  assign io_resp_bits_uop_fp_single = r_uops_1_fp_single;
  assign io_resp_bits_uop_xcpt_pf_if = r_uops_1_xcpt_pf_if;
  assign io_resp_bits_uop_xcpt_ae_if = r_uops_1_xcpt_ae_if;
  assign io_resp_bits_uop_xcpt_ma_if = r_uops_1_xcpt_ma_if;
  assign io_resp_bits_uop_bp_debug_if = r_uops_1_bp_debug_if;
  assign io_resp_bits_uop_bp_xcpt_if = r_uops_1_bp_xcpt_if;
  assign io_resp_bits_uop_debug_fsrc = r_uops_1_debug_fsrc;
  assign io_resp_bits_uop_debug_tsrc = r_uops_1_debug_tsrc;
  assign io_resp_bits_data = out_double_pipe_pipe_b ? _ifpu_io_out_bits_data : {12'hFFF, _ifpu_io_out_bits_data[31], 20'hFFFFF, _ifpu_io_out_bits_data[32], _ifpu_io_out_bits_data[30:0]};
  assign io_resp_bits_fflags_bits_uop_uopc = r_uops_1_uopc;
  assign io_resp_bits_fflags_bits_uop_inst = r_uops_1_inst;
  assign io_resp_bits_fflags_bits_uop_debug_inst = r_uops_1_debug_inst;
  assign io_resp_bits_fflags_bits_uop_is_rvc = r_uops_1_is_rvc;
  assign io_resp_bits_fflags_bits_uop_debug_pc = r_uops_1_debug_pc;
  assign io_resp_bits_fflags_bits_uop_iq_type = r_uops_1_iq_type;
  assign io_resp_bits_fflags_bits_uop_fu_code = r_uops_1_fu_code;
  assign io_resp_bits_fflags_bits_uop_ctrl_br_type = r_uops_1_ctrl_br_type;
  assign io_resp_bits_fflags_bits_uop_ctrl_op1_sel = r_uops_1_ctrl_op1_sel;
  assign io_resp_bits_fflags_bits_uop_ctrl_op2_sel = r_uops_1_ctrl_op2_sel;
  assign io_resp_bits_fflags_bits_uop_ctrl_imm_sel = r_uops_1_ctrl_imm_sel;
  assign io_resp_bits_fflags_bits_uop_ctrl_op_fcn = r_uops_1_ctrl_op_fcn;
  assign io_resp_bits_fflags_bits_uop_ctrl_fcn_dw = r_uops_1_ctrl_fcn_dw;
  assign io_resp_bits_fflags_bits_uop_ctrl_csr_cmd = r_uops_1_ctrl_csr_cmd;
  assign io_resp_bits_fflags_bits_uop_ctrl_is_load = r_uops_1_ctrl_is_load;
  assign io_resp_bits_fflags_bits_uop_ctrl_is_sta = r_uops_1_ctrl_is_sta;
  assign io_resp_bits_fflags_bits_uop_ctrl_is_std = r_uops_1_ctrl_is_std;
  assign io_resp_bits_fflags_bits_uop_iw_state = r_uops_1_iw_state;
  assign io_resp_bits_fflags_bits_uop_iw_p1_poisoned = r_uops_1_iw_p1_poisoned;
  assign io_resp_bits_fflags_bits_uop_iw_p2_poisoned = r_uops_1_iw_p2_poisoned;
  assign io_resp_bits_fflags_bits_uop_is_br = r_uops_1_is_br;
  assign io_resp_bits_fflags_bits_uop_is_jalr = r_uops_1_is_jalr;
  assign io_resp_bits_fflags_bits_uop_is_jal = r_uops_1_is_jal;
  assign io_resp_bits_fflags_bits_uop_is_sfb = r_uops_1_is_sfb;
  assign io_resp_bits_fflags_bits_uop_br_mask = _io_resp_bits_uop_br_mask_output;
  assign io_resp_bits_fflags_bits_uop_br_tag = r_uops_1_br_tag;
  assign io_resp_bits_fflags_bits_uop_ftq_idx = r_uops_1_ftq_idx;
  assign io_resp_bits_fflags_bits_uop_edge_inst = r_uops_1_edge_inst;
  assign io_resp_bits_fflags_bits_uop_pc_lob = r_uops_1_pc_lob;
  assign io_resp_bits_fflags_bits_uop_taken = r_uops_1_taken;
  assign io_resp_bits_fflags_bits_uop_imm_packed = r_uops_1_imm_packed;
  assign io_resp_bits_fflags_bits_uop_csr_addr = r_uops_1_csr_addr;
  assign io_resp_bits_fflags_bits_uop_rob_idx = r_uops_1_rob_idx;
  assign io_resp_bits_fflags_bits_uop_ldq_idx = r_uops_1_ldq_idx;
  assign io_resp_bits_fflags_bits_uop_stq_idx = r_uops_1_stq_idx;
  assign io_resp_bits_fflags_bits_uop_rxq_idx = r_uops_1_rxq_idx;
  assign io_resp_bits_fflags_bits_uop_pdst = r_uops_1_pdst;
  assign io_resp_bits_fflags_bits_uop_prs1 = r_uops_1_prs1;
  assign io_resp_bits_fflags_bits_uop_prs2 = r_uops_1_prs2;
  assign io_resp_bits_fflags_bits_uop_prs3 = r_uops_1_prs3;
  assign io_resp_bits_fflags_bits_uop_ppred = r_uops_1_ppred;
  assign io_resp_bits_fflags_bits_uop_prs1_busy = r_uops_1_prs1_busy;
  assign io_resp_bits_fflags_bits_uop_prs2_busy = r_uops_1_prs2_busy;
  assign io_resp_bits_fflags_bits_uop_prs3_busy = r_uops_1_prs3_busy;
  assign io_resp_bits_fflags_bits_uop_ppred_busy = r_uops_1_ppred_busy;
  assign io_resp_bits_fflags_bits_uop_stale_pdst = r_uops_1_stale_pdst;
  assign io_resp_bits_fflags_bits_uop_exception = r_uops_1_exception;
  assign io_resp_bits_fflags_bits_uop_exc_cause = r_uops_1_exc_cause;
  assign io_resp_bits_fflags_bits_uop_bypassable = r_uops_1_bypassable;
  assign io_resp_bits_fflags_bits_uop_mem_cmd = r_uops_1_mem_cmd;
  assign io_resp_bits_fflags_bits_uop_mem_size = r_uops_1_mem_size;
  assign io_resp_bits_fflags_bits_uop_mem_signed = r_uops_1_mem_signed;
  assign io_resp_bits_fflags_bits_uop_is_fence = r_uops_1_is_fence;
  assign io_resp_bits_fflags_bits_uop_is_fencei = r_uops_1_is_fencei;
  assign io_resp_bits_fflags_bits_uop_is_amo = r_uops_1_is_amo;
  assign io_resp_bits_fflags_bits_uop_uses_ldq = r_uops_1_uses_ldq;
  assign io_resp_bits_fflags_bits_uop_uses_stq = r_uops_1_uses_stq;
  assign io_resp_bits_fflags_bits_uop_is_sys_pc2epc = r_uops_1_is_sys_pc2epc;
  assign io_resp_bits_fflags_bits_uop_is_unique = r_uops_1_is_unique;
  assign io_resp_bits_fflags_bits_uop_flush_on_commit = r_uops_1_flush_on_commit;
  assign io_resp_bits_fflags_bits_uop_ldst_is_rs1 = r_uops_1_ldst_is_rs1;
  assign io_resp_bits_fflags_bits_uop_ldst = r_uops_1_ldst;
  assign io_resp_bits_fflags_bits_uop_lrs1 = r_uops_1_lrs1;
  assign io_resp_bits_fflags_bits_uop_lrs2 = r_uops_1_lrs2;
  assign io_resp_bits_fflags_bits_uop_lrs3 = r_uops_1_lrs3;
  assign io_resp_bits_fflags_bits_uop_ldst_val = r_uops_1_ldst_val;
  assign io_resp_bits_fflags_bits_uop_dst_rtype = r_uops_1_dst_rtype;
  assign io_resp_bits_fflags_bits_uop_lrs1_rtype = r_uops_1_lrs1_rtype;
  assign io_resp_bits_fflags_bits_uop_lrs2_rtype = r_uops_1_lrs2_rtype;
  assign io_resp_bits_fflags_bits_uop_frs3_en = r_uops_1_frs3_en;
  assign io_resp_bits_fflags_bits_uop_fp_val = r_uops_1_fp_val;
  assign io_resp_bits_fflags_bits_uop_fp_single = r_uops_1_fp_single;
  assign io_resp_bits_fflags_bits_uop_xcpt_pf_if = r_uops_1_xcpt_pf_if;
  assign io_resp_bits_fflags_bits_uop_xcpt_ae_if = r_uops_1_xcpt_ae_if;
  assign io_resp_bits_fflags_bits_uop_xcpt_ma_if = r_uops_1_xcpt_ma_if;
  assign io_resp_bits_fflags_bits_uop_bp_debug_if = r_uops_1_bp_debug_if;
  assign io_resp_bits_fflags_bits_uop_bp_xcpt_if = r_uops_1_bp_xcpt_if;
  assign io_resp_bits_fflags_bits_uop_debug_fsrc = r_uops_1_debug_fsrc;
  assign io_resp_bits_fflags_bits_uop_debug_tsrc = r_uops_1_debug_tsrc;
endmodule

