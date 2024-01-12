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

module BranchKillableQueue(
  input         clock,
                reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [6:0]  io_enq_bits_uop_uopc,
  input  [31:0] io_enq_bits_uop_inst,
                io_enq_bits_uop_debug_inst,
  input         io_enq_bits_uop_is_rvc,
  input  [39:0] io_enq_bits_uop_debug_pc,
  input  [2:0]  io_enq_bits_uop_iq_type,
  input  [9:0]  io_enq_bits_uop_fu_code,
  input  [3:0]  io_enq_bits_uop_ctrl_br_type,
  input  [1:0]  io_enq_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_enq_bits_uop_ctrl_op2_sel,
                io_enq_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_enq_bits_uop_ctrl_op_fcn,
  input         io_enq_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_enq_bits_uop_ctrl_csr_cmd,
  input         io_enq_bits_uop_ctrl_is_load,
                io_enq_bits_uop_ctrl_is_sta,
                io_enq_bits_uop_ctrl_is_std,
  input  [1:0]  io_enq_bits_uop_iw_state,
  input         io_enq_bits_uop_iw_p1_poisoned,
                io_enq_bits_uop_iw_p2_poisoned,
                io_enq_bits_uop_is_br,
                io_enq_bits_uop_is_jalr,
                io_enq_bits_uop_is_jal,
                io_enq_bits_uop_is_sfb,
  input  [19:0] io_enq_bits_uop_br_mask,
  input  [4:0]  io_enq_bits_uop_br_tag,
  input  [5:0]  io_enq_bits_uop_ftq_idx,
  input         io_enq_bits_uop_edge_inst,
  input  [5:0]  io_enq_bits_uop_pc_lob,
  input         io_enq_bits_uop_taken,
  input  [19:0] io_enq_bits_uop_imm_packed,
  input  [11:0] io_enq_bits_uop_csr_addr,
  input  [6:0]  io_enq_bits_uop_rob_idx,
  input  [4:0]  io_enq_bits_uop_ldq_idx,
                io_enq_bits_uop_stq_idx,
  input  [1:0]  io_enq_bits_uop_rxq_idx,
  input  [6:0]  io_enq_bits_uop_pdst,
                io_enq_bits_uop_prs1,
                io_enq_bits_uop_prs2,
                io_enq_bits_uop_prs3,
  input  [5:0]  io_enq_bits_uop_ppred,
  input         io_enq_bits_uop_prs1_busy,
                io_enq_bits_uop_prs2_busy,
                io_enq_bits_uop_prs3_busy,
                io_enq_bits_uop_ppred_busy,
  input  [6:0]  io_enq_bits_uop_stale_pdst,
  input         io_enq_bits_uop_exception,
  input  [63:0] io_enq_bits_uop_exc_cause,
  input         io_enq_bits_uop_bypassable,
  input  [4:0]  io_enq_bits_uop_mem_cmd,
  input  [1:0]  io_enq_bits_uop_mem_size,
  input         io_enq_bits_uop_mem_signed,
                io_enq_bits_uop_is_fence,
                io_enq_bits_uop_is_fencei,
                io_enq_bits_uop_is_amo,
                io_enq_bits_uop_uses_ldq,
                io_enq_bits_uop_uses_stq,
                io_enq_bits_uop_is_sys_pc2epc,
                io_enq_bits_uop_is_unique,
                io_enq_bits_uop_flush_on_commit,
                io_enq_bits_uop_ldst_is_rs1,
  input  [5:0]  io_enq_bits_uop_ldst,
                io_enq_bits_uop_lrs1,
                io_enq_bits_uop_lrs2,
                io_enq_bits_uop_lrs3,
  input         io_enq_bits_uop_ldst_val,
  input  [1:0]  io_enq_bits_uop_dst_rtype,
                io_enq_bits_uop_lrs1_rtype,
                io_enq_bits_uop_lrs2_rtype,
  input         io_enq_bits_uop_frs3_en,
                io_enq_bits_uop_fp_val,
                io_enq_bits_uop_fp_single,
                io_enq_bits_uop_xcpt_pf_if,
                io_enq_bits_uop_xcpt_ae_if,
                io_enq_bits_uop_xcpt_ma_if,
                io_enq_bits_uop_bp_debug_if,
                io_enq_bits_uop_bp_xcpt_if,
  input  [1:0]  io_enq_bits_uop_debug_fsrc,
                io_enq_bits_uop_debug_tsrc,
  input  [39:0] io_enq_bits_addr,
  input  [63:0] io_enq_bits_data,
  input         io_enq_bits_is_hella,
                io_enq_bits_tag_match,
  input  [1:0]  io_enq_bits_old_meta_coh_state,
  input  [20:0] io_enq_bits_old_meta_tag,
  input  [7:0]  io_enq_bits_way_en,
  input  [4:0]  io_enq_bits_sdq_id,
  input         io_deq_ready,
  output        io_deq_valid,
  output [6:0]  io_deq_bits_uop_uopc,
  output [31:0] io_deq_bits_uop_inst,
                io_deq_bits_uop_debug_inst,
  output        io_deq_bits_uop_is_rvc,
  output [39:0] io_deq_bits_uop_debug_pc,
  output [2:0]  io_deq_bits_uop_iq_type,
  output [9:0]  io_deq_bits_uop_fu_code,
  output [3:0]  io_deq_bits_uop_ctrl_br_type,
  output [1:0]  io_deq_bits_uop_ctrl_op1_sel,
  output [2:0]  io_deq_bits_uop_ctrl_op2_sel,
                io_deq_bits_uop_ctrl_imm_sel,
  output [3:0]  io_deq_bits_uop_ctrl_op_fcn,
  output        io_deq_bits_uop_ctrl_fcn_dw,
  output [2:0]  io_deq_bits_uop_ctrl_csr_cmd,
  output        io_deq_bits_uop_ctrl_is_load,
                io_deq_bits_uop_ctrl_is_sta,
                io_deq_bits_uop_ctrl_is_std,
  output [1:0]  io_deq_bits_uop_iw_state,
  output        io_deq_bits_uop_iw_p1_poisoned,
                io_deq_bits_uop_iw_p2_poisoned,
                io_deq_bits_uop_is_br,
                io_deq_bits_uop_is_jalr,
                io_deq_bits_uop_is_jal,
                io_deq_bits_uop_is_sfb,
  output [19:0] io_deq_bits_uop_br_mask,
  output [4:0]  io_deq_bits_uop_br_tag,
  output [5:0]  io_deq_bits_uop_ftq_idx,
  output        io_deq_bits_uop_edge_inst,
  output [5:0]  io_deq_bits_uop_pc_lob,
  output        io_deq_bits_uop_taken,
  output [19:0] io_deq_bits_uop_imm_packed,
  output [11:0] io_deq_bits_uop_csr_addr,
  output [6:0]  io_deq_bits_uop_rob_idx,
  output [4:0]  io_deq_bits_uop_ldq_idx,
                io_deq_bits_uop_stq_idx,
  output [1:0]  io_deq_bits_uop_rxq_idx,
  output [6:0]  io_deq_bits_uop_pdst,
                io_deq_bits_uop_prs1,
                io_deq_bits_uop_prs2,
                io_deq_bits_uop_prs3,
  output [5:0]  io_deq_bits_uop_ppred,
  output        io_deq_bits_uop_prs1_busy,
                io_deq_bits_uop_prs2_busy,
                io_deq_bits_uop_prs3_busy,
                io_deq_bits_uop_ppred_busy,
  output [6:0]  io_deq_bits_uop_stale_pdst,
  output        io_deq_bits_uop_exception,
  output [63:0] io_deq_bits_uop_exc_cause,
  output        io_deq_bits_uop_bypassable,
  output [4:0]  io_deq_bits_uop_mem_cmd,
  output [1:0]  io_deq_bits_uop_mem_size,
  output        io_deq_bits_uop_mem_signed,
                io_deq_bits_uop_is_fence,
                io_deq_bits_uop_is_fencei,
                io_deq_bits_uop_is_amo,
                io_deq_bits_uop_uses_ldq,
                io_deq_bits_uop_uses_stq,
                io_deq_bits_uop_is_sys_pc2epc,
                io_deq_bits_uop_is_unique,
                io_deq_bits_uop_flush_on_commit,
                io_deq_bits_uop_ldst_is_rs1,
  output [5:0]  io_deq_bits_uop_ldst,
                io_deq_bits_uop_lrs1,
                io_deq_bits_uop_lrs2,
                io_deq_bits_uop_lrs3,
  output        io_deq_bits_uop_ldst_val,
  output [1:0]  io_deq_bits_uop_dst_rtype,
                io_deq_bits_uop_lrs1_rtype,
                io_deq_bits_uop_lrs2_rtype,
  output        io_deq_bits_uop_frs3_en,
                io_deq_bits_uop_fp_val,
                io_deq_bits_uop_fp_single,
                io_deq_bits_uop_xcpt_pf_if,
                io_deq_bits_uop_xcpt_ae_if,
                io_deq_bits_uop_xcpt_ma_if,
                io_deq_bits_uop_bp_debug_if,
                io_deq_bits_uop_bp_xcpt_if,
  output [1:0]  io_deq_bits_uop_debug_fsrc,
                io_deq_bits_uop_debug_tsrc,
  output [39:0] io_deq_bits_addr,
  output        io_deq_bits_is_hella,
  output [4:0]  io_deq_bits_sdq_id,
  input  [19:0] io_brupdate_b1_resolve_mask,
                io_brupdate_b1_mispredict_mask,
  input         io_flush,
  output        io_empty
);

  wire [45:0] _ram_ext_R0_data;
  reg         valids_0;
  reg         valids_1;
  reg         valids_2;
  reg         valids_3;
  reg         valids_4;
  reg         valids_5;
  reg         valids_6;
  reg         valids_7;
  reg         valids_8;
  reg         valids_9;
  reg         valids_10;
  reg         valids_11;
  reg         valids_12;
  reg         valids_13;
  reg         valids_14;
  reg         valids_15;
  reg  [6:0]  uops_0_uopc;
  reg  [31:0] uops_0_inst;
  reg  [31:0] uops_0_debug_inst;
  reg         uops_0_is_rvc;
  reg  [39:0] uops_0_debug_pc;
  reg  [2:0]  uops_0_iq_type;
  reg  [9:0]  uops_0_fu_code;
  reg  [3:0]  uops_0_ctrl_br_type;
  reg  [1:0]  uops_0_ctrl_op1_sel;
  reg  [2:0]  uops_0_ctrl_op2_sel;
  reg  [2:0]  uops_0_ctrl_imm_sel;
  reg  [3:0]  uops_0_ctrl_op_fcn;
  reg         uops_0_ctrl_fcn_dw;
  reg  [2:0]  uops_0_ctrl_csr_cmd;
  reg         uops_0_ctrl_is_load;
  reg         uops_0_ctrl_is_sta;
  reg         uops_0_ctrl_is_std;
  reg  [1:0]  uops_0_iw_state;
  reg         uops_0_iw_p1_poisoned;
  reg         uops_0_iw_p2_poisoned;
  reg         uops_0_is_br;
  reg         uops_0_is_jalr;
  reg         uops_0_is_jal;
  reg         uops_0_is_sfb;
  reg  [19:0] uops_0_br_mask;
  reg  [4:0]  uops_0_br_tag;
  reg  [5:0]  uops_0_ftq_idx;
  reg         uops_0_edge_inst;
  reg  [5:0]  uops_0_pc_lob;
  reg         uops_0_taken;
  reg  [19:0] uops_0_imm_packed;
  reg  [11:0] uops_0_csr_addr;
  reg  [6:0]  uops_0_rob_idx;
  reg  [4:0]  uops_0_ldq_idx;
  reg  [4:0]  uops_0_stq_idx;
  reg  [1:0]  uops_0_rxq_idx;
  reg  [6:0]  uops_0_pdst;
  reg  [6:0]  uops_0_prs1;
  reg  [6:0]  uops_0_prs2;
  reg  [6:0]  uops_0_prs3;
  reg  [5:0]  uops_0_ppred;
  reg         uops_0_prs1_busy;
  reg         uops_0_prs2_busy;
  reg         uops_0_prs3_busy;
  reg         uops_0_ppred_busy;
  reg  [6:0]  uops_0_stale_pdst;
  reg         uops_0_exception;
  reg  [63:0] uops_0_exc_cause;
  reg         uops_0_bypassable;
  reg  [4:0]  uops_0_mem_cmd;
  reg  [1:0]  uops_0_mem_size;
  reg         uops_0_mem_signed;
  reg         uops_0_is_fence;
  reg         uops_0_is_fencei;
  reg         uops_0_is_amo;
  reg         uops_0_uses_ldq;
  reg         uops_0_uses_stq;
  reg         uops_0_is_sys_pc2epc;
  reg         uops_0_is_unique;
  reg         uops_0_flush_on_commit;
  reg         uops_0_ldst_is_rs1;
  reg  [5:0]  uops_0_ldst;
  reg  [5:0]  uops_0_lrs1;
  reg  [5:0]  uops_0_lrs2;
  reg  [5:0]  uops_0_lrs3;
  reg         uops_0_ldst_val;
  reg  [1:0]  uops_0_dst_rtype;
  reg  [1:0]  uops_0_lrs1_rtype;
  reg  [1:0]  uops_0_lrs2_rtype;
  reg         uops_0_frs3_en;
  reg         uops_0_fp_val;
  reg         uops_0_fp_single;
  reg         uops_0_xcpt_pf_if;
  reg         uops_0_xcpt_ae_if;
  reg         uops_0_xcpt_ma_if;
  reg         uops_0_bp_debug_if;
  reg         uops_0_bp_xcpt_if;
  reg  [1:0]  uops_0_debug_fsrc;
  reg  [1:0]  uops_0_debug_tsrc;
  reg  [6:0]  uops_1_uopc;
  reg  [31:0] uops_1_inst;
  reg  [31:0] uops_1_debug_inst;
  reg         uops_1_is_rvc;
  reg  [39:0] uops_1_debug_pc;
  reg  [2:0]  uops_1_iq_type;
  reg  [9:0]  uops_1_fu_code;
  reg  [3:0]  uops_1_ctrl_br_type;
  reg  [1:0]  uops_1_ctrl_op1_sel;
  reg  [2:0]  uops_1_ctrl_op2_sel;
  reg  [2:0]  uops_1_ctrl_imm_sel;
  reg  [3:0]  uops_1_ctrl_op_fcn;
  reg         uops_1_ctrl_fcn_dw;
  reg  [2:0]  uops_1_ctrl_csr_cmd;
  reg         uops_1_ctrl_is_load;
  reg         uops_1_ctrl_is_sta;
  reg         uops_1_ctrl_is_std;
  reg  [1:0]  uops_1_iw_state;
  reg         uops_1_iw_p1_poisoned;
  reg         uops_1_iw_p2_poisoned;
  reg         uops_1_is_br;
  reg         uops_1_is_jalr;
  reg         uops_1_is_jal;
  reg         uops_1_is_sfb;
  reg  [19:0] uops_1_br_mask;
  reg  [4:0]  uops_1_br_tag;
  reg  [5:0]  uops_1_ftq_idx;
  reg         uops_1_edge_inst;
  reg  [5:0]  uops_1_pc_lob;
  reg         uops_1_taken;
  reg  [19:0] uops_1_imm_packed;
  reg  [11:0] uops_1_csr_addr;
  reg  [6:0]  uops_1_rob_idx;
  reg  [4:0]  uops_1_ldq_idx;
  reg  [4:0]  uops_1_stq_idx;
  reg  [1:0]  uops_1_rxq_idx;
  reg  [6:0]  uops_1_pdst;
  reg  [6:0]  uops_1_prs1;
  reg  [6:0]  uops_1_prs2;
  reg  [6:0]  uops_1_prs3;
  reg  [5:0]  uops_1_ppred;
  reg         uops_1_prs1_busy;
  reg         uops_1_prs2_busy;
  reg         uops_1_prs3_busy;
  reg         uops_1_ppred_busy;
  reg  [6:0]  uops_1_stale_pdst;
  reg         uops_1_exception;
  reg  [63:0] uops_1_exc_cause;
  reg         uops_1_bypassable;
  reg  [4:0]  uops_1_mem_cmd;
  reg  [1:0]  uops_1_mem_size;
  reg         uops_1_mem_signed;
  reg         uops_1_is_fence;
  reg         uops_1_is_fencei;
  reg         uops_1_is_amo;
  reg         uops_1_uses_ldq;
  reg         uops_1_uses_stq;
  reg         uops_1_is_sys_pc2epc;
  reg         uops_1_is_unique;
  reg         uops_1_flush_on_commit;
  reg         uops_1_ldst_is_rs1;
  reg  [5:0]  uops_1_ldst;
  reg  [5:0]  uops_1_lrs1;
  reg  [5:0]  uops_1_lrs2;
  reg  [5:0]  uops_1_lrs3;
  reg         uops_1_ldst_val;
  reg  [1:0]  uops_1_dst_rtype;
  reg  [1:0]  uops_1_lrs1_rtype;
  reg  [1:0]  uops_1_lrs2_rtype;
  reg         uops_1_frs3_en;
  reg         uops_1_fp_val;
  reg         uops_1_fp_single;
  reg         uops_1_xcpt_pf_if;
  reg         uops_1_xcpt_ae_if;
  reg         uops_1_xcpt_ma_if;
  reg         uops_1_bp_debug_if;
  reg         uops_1_bp_xcpt_if;
  reg  [1:0]  uops_1_debug_fsrc;
  reg  [1:0]  uops_1_debug_tsrc;
  reg  [6:0]  uops_2_uopc;
  reg  [31:0] uops_2_inst;
  reg  [31:0] uops_2_debug_inst;
  reg         uops_2_is_rvc;
  reg  [39:0] uops_2_debug_pc;
  reg  [2:0]  uops_2_iq_type;
  reg  [9:0]  uops_2_fu_code;
  reg  [3:0]  uops_2_ctrl_br_type;
  reg  [1:0]  uops_2_ctrl_op1_sel;
  reg  [2:0]  uops_2_ctrl_op2_sel;
  reg  [2:0]  uops_2_ctrl_imm_sel;
  reg  [3:0]  uops_2_ctrl_op_fcn;
  reg         uops_2_ctrl_fcn_dw;
  reg  [2:0]  uops_2_ctrl_csr_cmd;
  reg         uops_2_ctrl_is_load;
  reg         uops_2_ctrl_is_sta;
  reg         uops_2_ctrl_is_std;
  reg  [1:0]  uops_2_iw_state;
  reg         uops_2_iw_p1_poisoned;
  reg         uops_2_iw_p2_poisoned;
  reg         uops_2_is_br;
  reg         uops_2_is_jalr;
  reg         uops_2_is_jal;
  reg         uops_2_is_sfb;
  reg  [19:0] uops_2_br_mask;
  reg  [4:0]  uops_2_br_tag;
  reg  [5:0]  uops_2_ftq_idx;
  reg         uops_2_edge_inst;
  reg  [5:0]  uops_2_pc_lob;
  reg         uops_2_taken;
  reg  [19:0] uops_2_imm_packed;
  reg  [11:0] uops_2_csr_addr;
  reg  [6:0]  uops_2_rob_idx;
  reg  [4:0]  uops_2_ldq_idx;
  reg  [4:0]  uops_2_stq_idx;
  reg  [1:0]  uops_2_rxq_idx;
  reg  [6:0]  uops_2_pdst;
  reg  [6:0]  uops_2_prs1;
  reg  [6:0]  uops_2_prs2;
  reg  [6:0]  uops_2_prs3;
  reg  [5:0]  uops_2_ppred;
  reg         uops_2_prs1_busy;
  reg         uops_2_prs2_busy;
  reg         uops_2_prs3_busy;
  reg         uops_2_ppred_busy;
  reg  [6:0]  uops_2_stale_pdst;
  reg         uops_2_exception;
  reg  [63:0] uops_2_exc_cause;
  reg         uops_2_bypassable;
  reg  [4:0]  uops_2_mem_cmd;
  reg  [1:0]  uops_2_mem_size;
  reg         uops_2_mem_signed;
  reg         uops_2_is_fence;
  reg         uops_2_is_fencei;
  reg         uops_2_is_amo;
  reg         uops_2_uses_ldq;
  reg         uops_2_uses_stq;
  reg         uops_2_is_sys_pc2epc;
  reg         uops_2_is_unique;
  reg         uops_2_flush_on_commit;
  reg         uops_2_ldst_is_rs1;
  reg  [5:0]  uops_2_ldst;
  reg  [5:0]  uops_2_lrs1;
  reg  [5:0]  uops_2_lrs2;
  reg  [5:0]  uops_2_lrs3;
  reg         uops_2_ldst_val;
  reg  [1:0]  uops_2_dst_rtype;
  reg  [1:0]  uops_2_lrs1_rtype;
  reg  [1:0]  uops_2_lrs2_rtype;
  reg         uops_2_frs3_en;
  reg         uops_2_fp_val;
  reg         uops_2_fp_single;
  reg         uops_2_xcpt_pf_if;
  reg         uops_2_xcpt_ae_if;
  reg         uops_2_xcpt_ma_if;
  reg         uops_2_bp_debug_if;
  reg         uops_2_bp_xcpt_if;
  reg  [1:0]  uops_2_debug_fsrc;
  reg  [1:0]  uops_2_debug_tsrc;
  reg  [6:0]  uops_3_uopc;
  reg  [31:0] uops_3_inst;
  reg  [31:0] uops_3_debug_inst;
  reg         uops_3_is_rvc;
  reg  [39:0] uops_3_debug_pc;
  reg  [2:0]  uops_3_iq_type;
  reg  [9:0]  uops_3_fu_code;
  reg  [3:0]  uops_3_ctrl_br_type;
  reg  [1:0]  uops_3_ctrl_op1_sel;
  reg  [2:0]  uops_3_ctrl_op2_sel;
  reg  [2:0]  uops_3_ctrl_imm_sel;
  reg  [3:0]  uops_3_ctrl_op_fcn;
  reg         uops_3_ctrl_fcn_dw;
  reg  [2:0]  uops_3_ctrl_csr_cmd;
  reg         uops_3_ctrl_is_load;
  reg         uops_3_ctrl_is_sta;
  reg         uops_3_ctrl_is_std;
  reg  [1:0]  uops_3_iw_state;
  reg         uops_3_iw_p1_poisoned;
  reg         uops_3_iw_p2_poisoned;
  reg         uops_3_is_br;
  reg         uops_3_is_jalr;
  reg         uops_3_is_jal;
  reg         uops_3_is_sfb;
  reg  [19:0] uops_3_br_mask;
  reg  [4:0]  uops_3_br_tag;
  reg  [5:0]  uops_3_ftq_idx;
  reg         uops_3_edge_inst;
  reg  [5:0]  uops_3_pc_lob;
  reg         uops_3_taken;
  reg  [19:0] uops_3_imm_packed;
  reg  [11:0] uops_3_csr_addr;
  reg  [6:0]  uops_3_rob_idx;
  reg  [4:0]  uops_3_ldq_idx;
  reg  [4:0]  uops_3_stq_idx;
  reg  [1:0]  uops_3_rxq_idx;
  reg  [6:0]  uops_3_pdst;
  reg  [6:0]  uops_3_prs1;
  reg  [6:0]  uops_3_prs2;
  reg  [6:0]  uops_3_prs3;
  reg  [5:0]  uops_3_ppred;
  reg         uops_3_prs1_busy;
  reg         uops_3_prs2_busy;
  reg         uops_3_prs3_busy;
  reg         uops_3_ppred_busy;
  reg  [6:0]  uops_3_stale_pdst;
  reg         uops_3_exception;
  reg  [63:0] uops_3_exc_cause;
  reg         uops_3_bypassable;
  reg  [4:0]  uops_3_mem_cmd;
  reg  [1:0]  uops_3_mem_size;
  reg         uops_3_mem_signed;
  reg         uops_3_is_fence;
  reg         uops_3_is_fencei;
  reg         uops_3_is_amo;
  reg         uops_3_uses_ldq;
  reg         uops_3_uses_stq;
  reg         uops_3_is_sys_pc2epc;
  reg         uops_3_is_unique;
  reg         uops_3_flush_on_commit;
  reg         uops_3_ldst_is_rs1;
  reg  [5:0]  uops_3_ldst;
  reg  [5:0]  uops_3_lrs1;
  reg  [5:0]  uops_3_lrs2;
  reg  [5:0]  uops_3_lrs3;
  reg         uops_3_ldst_val;
  reg  [1:0]  uops_3_dst_rtype;
  reg  [1:0]  uops_3_lrs1_rtype;
  reg  [1:0]  uops_3_lrs2_rtype;
  reg         uops_3_frs3_en;
  reg         uops_3_fp_val;
  reg         uops_3_fp_single;
  reg         uops_3_xcpt_pf_if;
  reg         uops_3_xcpt_ae_if;
  reg         uops_3_xcpt_ma_if;
  reg         uops_3_bp_debug_if;
  reg         uops_3_bp_xcpt_if;
  reg  [1:0]  uops_3_debug_fsrc;
  reg  [1:0]  uops_3_debug_tsrc;
  reg  [6:0]  uops_4_uopc;
  reg  [31:0] uops_4_inst;
  reg  [31:0] uops_4_debug_inst;
  reg         uops_4_is_rvc;
  reg  [39:0] uops_4_debug_pc;
  reg  [2:0]  uops_4_iq_type;
  reg  [9:0]  uops_4_fu_code;
  reg  [3:0]  uops_4_ctrl_br_type;
  reg  [1:0]  uops_4_ctrl_op1_sel;
  reg  [2:0]  uops_4_ctrl_op2_sel;
  reg  [2:0]  uops_4_ctrl_imm_sel;
  reg  [3:0]  uops_4_ctrl_op_fcn;
  reg         uops_4_ctrl_fcn_dw;
  reg  [2:0]  uops_4_ctrl_csr_cmd;
  reg         uops_4_ctrl_is_load;
  reg         uops_4_ctrl_is_sta;
  reg         uops_4_ctrl_is_std;
  reg  [1:0]  uops_4_iw_state;
  reg         uops_4_iw_p1_poisoned;
  reg         uops_4_iw_p2_poisoned;
  reg         uops_4_is_br;
  reg         uops_4_is_jalr;
  reg         uops_4_is_jal;
  reg         uops_4_is_sfb;
  reg  [19:0] uops_4_br_mask;
  reg  [4:0]  uops_4_br_tag;
  reg  [5:0]  uops_4_ftq_idx;
  reg         uops_4_edge_inst;
  reg  [5:0]  uops_4_pc_lob;
  reg         uops_4_taken;
  reg  [19:0] uops_4_imm_packed;
  reg  [11:0] uops_4_csr_addr;
  reg  [6:0]  uops_4_rob_idx;
  reg  [4:0]  uops_4_ldq_idx;
  reg  [4:0]  uops_4_stq_idx;
  reg  [1:0]  uops_4_rxq_idx;
  reg  [6:0]  uops_4_pdst;
  reg  [6:0]  uops_4_prs1;
  reg  [6:0]  uops_4_prs2;
  reg  [6:0]  uops_4_prs3;
  reg  [5:0]  uops_4_ppred;
  reg         uops_4_prs1_busy;
  reg         uops_4_prs2_busy;
  reg         uops_4_prs3_busy;
  reg         uops_4_ppred_busy;
  reg  [6:0]  uops_4_stale_pdst;
  reg         uops_4_exception;
  reg  [63:0] uops_4_exc_cause;
  reg         uops_4_bypassable;
  reg  [4:0]  uops_4_mem_cmd;
  reg  [1:0]  uops_4_mem_size;
  reg         uops_4_mem_signed;
  reg         uops_4_is_fence;
  reg         uops_4_is_fencei;
  reg         uops_4_is_amo;
  reg         uops_4_uses_ldq;
  reg         uops_4_uses_stq;
  reg         uops_4_is_sys_pc2epc;
  reg         uops_4_is_unique;
  reg         uops_4_flush_on_commit;
  reg         uops_4_ldst_is_rs1;
  reg  [5:0]  uops_4_ldst;
  reg  [5:0]  uops_4_lrs1;
  reg  [5:0]  uops_4_lrs2;
  reg  [5:0]  uops_4_lrs3;
  reg         uops_4_ldst_val;
  reg  [1:0]  uops_4_dst_rtype;
  reg  [1:0]  uops_4_lrs1_rtype;
  reg  [1:0]  uops_4_lrs2_rtype;
  reg         uops_4_frs3_en;
  reg         uops_4_fp_val;
  reg         uops_4_fp_single;
  reg         uops_4_xcpt_pf_if;
  reg         uops_4_xcpt_ae_if;
  reg         uops_4_xcpt_ma_if;
  reg         uops_4_bp_debug_if;
  reg         uops_4_bp_xcpt_if;
  reg  [1:0]  uops_4_debug_fsrc;
  reg  [1:0]  uops_4_debug_tsrc;
  reg  [6:0]  uops_5_uopc;
  reg  [31:0] uops_5_inst;
  reg  [31:0] uops_5_debug_inst;
  reg         uops_5_is_rvc;
  reg  [39:0] uops_5_debug_pc;
  reg  [2:0]  uops_5_iq_type;
  reg  [9:0]  uops_5_fu_code;
  reg  [3:0]  uops_5_ctrl_br_type;
  reg  [1:0]  uops_5_ctrl_op1_sel;
  reg  [2:0]  uops_5_ctrl_op2_sel;
  reg  [2:0]  uops_5_ctrl_imm_sel;
  reg  [3:0]  uops_5_ctrl_op_fcn;
  reg         uops_5_ctrl_fcn_dw;
  reg  [2:0]  uops_5_ctrl_csr_cmd;
  reg         uops_5_ctrl_is_load;
  reg         uops_5_ctrl_is_sta;
  reg         uops_5_ctrl_is_std;
  reg  [1:0]  uops_5_iw_state;
  reg         uops_5_iw_p1_poisoned;
  reg         uops_5_iw_p2_poisoned;
  reg         uops_5_is_br;
  reg         uops_5_is_jalr;
  reg         uops_5_is_jal;
  reg         uops_5_is_sfb;
  reg  [19:0] uops_5_br_mask;
  reg  [4:0]  uops_5_br_tag;
  reg  [5:0]  uops_5_ftq_idx;
  reg         uops_5_edge_inst;
  reg  [5:0]  uops_5_pc_lob;
  reg         uops_5_taken;
  reg  [19:0] uops_5_imm_packed;
  reg  [11:0] uops_5_csr_addr;
  reg  [6:0]  uops_5_rob_idx;
  reg  [4:0]  uops_5_ldq_idx;
  reg  [4:0]  uops_5_stq_idx;
  reg  [1:0]  uops_5_rxq_idx;
  reg  [6:0]  uops_5_pdst;
  reg  [6:0]  uops_5_prs1;
  reg  [6:0]  uops_5_prs2;
  reg  [6:0]  uops_5_prs3;
  reg  [5:0]  uops_5_ppred;
  reg         uops_5_prs1_busy;
  reg         uops_5_prs2_busy;
  reg         uops_5_prs3_busy;
  reg         uops_5_ppred_busy;
  reg  [6:0]  uops_5_stale_pdst;
  reg         uops_5_exception;
  reg  [63:0] uops_5_exc_cause;
  reg         uops_5_bypassable;
  reg  [4:0]  uops_5_mem_cmd;
  reg  [1:0]  uops_5_mem_size;
  reg         uops_5_mem_signed;
  reg         uops_5_is_fence;
  reg         uops_5_is_fencei;
  reg         uops_5_is_amo;
  reg         uops_5_uses_ldq;
  reg         uops_5_uses_stq;
  reg         uops_5_is_sys_pc2epc;
  reg         uops_5_is_unique;
  reg         uops_5_flush_on_commit;
  reg         uops_5_ldst_is_rs1;
  reg  [5:0]  uops_5_ldst;
  reg  [5:0]  uops_5_lrs1;
  reg  [5:0]  uops_5_lrs2;
  reg  [5:0]  uops_5_lrs3;
  reg         uops_5_ldst_val;
  reg  [1:0]  uops_5_dst_rtype;
  reg  [1:0]  uops_5_lrs1_rtype;
  reg  [1:0]  uops_5_lrs2_rtype;
  reg         uops_5_frs3_en;
  reg         uops_5_fp_val;
  reg         uops_5_fp_single;
  reg         uops_5_xcpt_pf_if;
  reg         uops_5_xcpt_ae_if;
  reg         uops_5_xcpt_ma_if;
  reg         uops_5_bp_debug_if;
  reg         uops_5_bp_xcpt_if;
  reg  [1:0]  uops_5_debug_fsrc;
  reg  [1:0]  uops_5_debug_tsrc;
  reg  [6:0]  uops_6_uopc;
  reg  [31:0] uops_6_inst;
  reg  [31:0] uops_6_debug_inst;
  reg         uops_6_is_rvc;
  reg  [39:0] uops_6_debug_pc;
  reg  [2:0]  uops_6_iq_type;
  reg  [9:0]  uops_6_fu_code;
  reg  [3:0]  uops_6_ctrl_br_type;
  reg  [1:0]  uops_6_ctrl_op1_sel;
  reg  [2:0]  uops_6_ctrl_op2_sel;
  reg  [2:0]  uops_6_ctrl_imm_sel;
  reg  [3:0]  uops_6_ctrl_op_fcn;
  reg         uops_6_ctrl_fcn_dw;
  reg  [2:0]  uops_6_ctrl_csr_cmd;
  reg         uops_6_ctrl_is_load;
  reg         uops_6_ctrl_is_sta;
  reg         uops_6_ctrl_is_std;
  reg  [1:0]  uops_6_iw_state;
  reg         uops_6_iw_p1_poisoned;
  reg         uops_6_iw_p2_poisoned;
  reg         uops_6_is_br;
  reg         uops_6_is_jalr;
  reg         uops_6_is_jal;
  reg         uops_6_is_sfb;
  reg  [19:0] uops_6_br_mask;
  reg  [4:0]  uops_6_br_tag;
  reg  [5:0]  uops_6_ftq_idx;
  reg         uops_6_edge_inst;
  reg  [5:0]  uops_6_pc_lob;
  reg         uops_6_taken;
  reg  [19:0] uops_6_imm_packed;
  reg  [11:0] uops_6_csr_addr;
  reg  [6:0]  uops_6_rob_idx;
  reg  [4:0]  uops_6_ldq_idx;
  reg  [4:0]  uops_6_stq_idx;
  reg  [1:0]  uops_6_rxq_idx;
  reg  [6:0]  uops_6_pdst;
  reg  [6:0]  uops_6_prs1;
  reg  [6:0]  uops_6_prs2;
  reg  [6:0]  uops_6_prs3;
  reg  [5:0]  uops_6_ppred;
  reg         uops_6_prs1_busy;
  reg         uops_6_prs2_busy;
  reg         uops_6_prs3_busy;
  reg         uops_6_ppred_busy;
  reg  [6:0]  uops_6_stale_pdst;
  reg         uops_6_exception;
  reg  [63:0] uops_6_exc_cause;
  reg         uops_6_bypassable;
  reg  [4:0]  uops_6_mem_cmd;
  reg  [1:0]  uops_6_mem_size;
  reg         uops_6_mem_signed;
  reg         uops_6_is_fence;
  reg         uops_6_is_fencei;
  reg         uops_6_is_amo;
  reg         uops_6_uses_ldq;
  reg         uops_6_uses_stq;
  reg         uops_6_is_sys_pc2epc;
  reg         uops_6_is_unique;
  reg         uops_6_flush_on_commit;
  reg         uops_6_ldst_is_rs1;
  reg  [5:0]  uops_6_ldst;
  reg  [5:0]  uops_6_lrs1;
  reg  [5:0]  uops_6_lrs2;
  reg  [5:0]  uops_6_lrs3;
  reg         uops_6_ldst_val;
  reg  [1:0]  uops_6_dst_rtype;
  reg  [1:0]  uops_6_lrs1_rtype;
  reg  [1:0]  uops_6_lrs2_rtype;
  reg         uops_6_frs3_en;
  reg         uops_6_fp_val;
  reg         uops_6_fp_single;
  reg         uops_6_xcpt_pf_if;
  reg         uops_6_xcpt_ae_if;
  reg         uops_6_xcpt_ma_if;
  reg         uops_6_bp_debug_if;
  reg         uops_6_bp_xcpt_if;
  reg  [1:0]  uops_6_debug_fsrc;
  reg  [1:0]  uops_6_debug_tsrc;
  reg  [6:0]  uops_7_uopc;
  reg  [31:0] uops_7_inst;
  reg  [31:0] uops_7_debug_inst;
  reg         uops_7_is_rvc;
  reg  [39:0] uops_7_debug_pc;
  reg  [2:0]  uops_7_iq_type;
  reg  [9:0]  uops_7_fu_code;
  reg  [3:0]  uops_7_ctrl_br_type;
  reg  [1:0]  uops_7_ctrl_op1_sel;
  reg  [2:0]  uops_7_ctrl_op2_sel;
  reg  [2:0]  uops_7_ctrl_imm_sel;
  reg  [3:0]  uops_7_ctrl_op_fcn;
  reg         uops_7_ctrl_fcn_dw;
  reg  [2:0]  uops_7_ctrl_csr_cmd;
  reg         uops_7_ctrl_is_load;
  reg         uops_7_ctrl_is_sta;
  reg         uops_7_ctrl_is_std;
  reg  [1:0]  uops_7_iw_state;
  reg         uops_7_iw_p1_poisoned;
  reg         uops_7_iw_p2_poisoned;
  reg         uops_7_is_br;
  reg         uops_7_is_jalr;
  reg         uops_7_is_jal;
  reg         uops_7_is_sfb;
  reg  [19:0] uops_7_br_mask;
  reg  [4:0]  uops_7_br_tag;
  reg  [5:0]  uops_7_ftq_idx;
  reg         uops_7_edge_inst;
  reg  [5:0]  uops_7_pc_lob;
  reg         uops_7_taken;
  reg  [19:0] uops_7_imm_packed;
  reg  [11:0] uops_7_csr_addr;
  reg  [6:0]  uops_7_rob_idx;
  reg  [4:0]  uops_7_ldq_idx;
  reg  [4:0]  uops_7_stq_idx;
  reg  [1:0]  uops_7_rxq_idx;
  reg  [6:0]  uops_7_pdst;
  reg  [6:0]  uops_7_prs1;
  reg  [6:0]  uops_7_prs2;
  reg  [6:0]  uops_7_prs3;
  reg  [5:0]  uops_7_ppred;
  reg         uops_7_prs1_busy;
  reg         uops_7_prs2_busy;
  reg         uops_7_prs3_busy;
  reg         uops_7_ppred_busy;
  reg  [6:0]  uops_7_stale_pdst;
  reg         uops_7_exception;
  reg  [63:0] uops_7_exc_cause;
  reg         uops_7_bypassable;
  reg  [4:0]  uops_7_mem_cmd;
  reg  [1:0]  uops_7_mem_size;
  reg         uops_7_mem_signed;
  reg         uops_7_is_fence;
  reg         uops_7_is_fencei;
  reg         uops_7_is_amo;
  reg         uops_7_uses_ldq;
  reg         uops_7_uses_stq;
  reg         uops_7_is_sys_pc2epc;
  reg         uops_7_is_unique;
  reg         uops_7_flush_on_commit;
  reg         uops_7_ldst_is_rs1;
  reg  [5:0]  uops_7_ldst;
  reg  [5:0]  uops_7_lrs1;
  reg  [5:0]  uops_7_lrs2;
  reg  [5:0]  uops_7_lrs3;
  reg         uops_7_ldst_val;
  reg  [1:0]  uops_7_dst_rtype;
  reg  [1:0]  uops_7_lrs1_rtype;
  reg  [1:0]  uops_7_lrs2_rtype;
  reg         uops_7_frs3_en;
  reg         uops_7_fp_val;
  reg         uops_7_fp_single;
  reg         uops_7_xcpt_pf_if;
  reg         uops_7_xcpt_ae_if;
  reg         uops_7_xcpt_ma_if;
  reg         uops_7_bp_debug_if;
  reg         uops_7_bp_xcpt_if;
  reg  [1:0]  uops_7_debug_fsrc;
  reg  [1:0]  uops_7_debug_tsrc;
  reg  [6:0]  uops_8_uopc;
  reg  [31:0] uops_8_inst;
  reg  [31:0] uops_8_debug_inst;
  reg         uops_8_is_rvc;
  reg  [39:0] uops_8_debug_pc;
  reg  [2:0]  uops_8_iq_type;
  reg  [9:0]  uops_8_fu_code;
  reg  [3:0]  uops_8_ctrl_br_type;
  reg  [1:0]  uops_8_ctrl_op1_sel;
  reg  [2:0]  uops_8_ctrl_op2_sel;
  reg  [2:0]  uops_8_ctrl_imm_sel;
  reg  [3:0]  uops_8_ctrl_op_fcn;
  reg         uops_8_ctrl_fcn_dw;
  reg  [2:0]  uops_8_ctrl_csr_cmd;
  reg         uops_8_ctrl_is_load;
  reg         uops_8_ctrl_is_sta;
  reg         uops_8_ctrl_is_std;
  reg  [1:0]  uops_8_iw_state;
  reg         uops_8_iw_p1_poisoned;
  reg         uops_8_iw_p2_poisoned;
  reg         uops_8_is_br;
  reg         uops_8_is_jalr;
  reg         uops_8_is_jal;
  reg         uops_8_is_sfb;
  reg  [19:0] uops_8_br_mask;
  reg  [4:0]  uops_8_br_tag;
  reg  [5:0]  uops_8_ftq_idx;
  reg         uops_8_edge_inst;
  reg  [5:0]  uops_8_pc_lob;
  reg         uops_8_taken;
  reg  [19:0] uops_8_imm_packed;
  reg  [11:0] uops_8_csr_addr;
  reg  [6:0]  uops_8_rob_idx;
  reg  [4:0]  uops_8_ldq_idx;
  reg  [4:0]  uops_8_stq_idx;
  reg  [1:0]  uops_8_rxq_idx;
  reg  [6:0]  uops_8_pdst;
  reg  [6:0]  uops_8_prs1;
  reg  [6:0]  uops_8_prs2;
  reg  [6:0]  uops_8_prs3;
  reg  [5:0]  uops_8_ppred;
  reg         uops_8_prs1_busy;
  reg         uops_8_prs2_busy;
  reg         uops_8_prs3_busy;
  reg         uops_8_ppred_busy;
  reg  [6:0]  uops_8_stale_pdst;
  reg         uops_8_exception;
  reg  [63:0] uops_8_exc_cause;
  reg         uops_8_bypassable;
  reg  [4:0]  uops_8_mem_cmd;
  reg  [1:0]  uops_8_mem_size;
  reg         uops_8_mem_signed;
  reg         uops_8_is_fence;
  reg         uops_8_is_fencei;
  reg         uops_8_is_amo;
  reg         uops_8_uses_ldq;
  reg         uops_8_uses_stq;
  reg         uops_8_is_sys_pc2epc;
  reg         uops_8_is_unique;
  reg         uops_8_flush_on_commit;
  reg         uops_8_ldst_is_rs1;
  reg  [5:0]  uops_8_ldst;
  reg  [5:0]  uops_8_lrs1;
  reg  [5:0]  uops_8_lrs2;
  reg  [5:0]  uops_8_lrs3;
  reg         uops_8_ldst_val;
  reg  [1:0]  uops_8_dst_rtype;
  reg  [1:0]  uops_8_lrs1_rtype;
  reg  [1:0]  uops_8_lrs2_rtype;
  reg         uops_8_frs3_en;
  reg         uops_8_fp_val;
  reg         uops_8_fp_single;
  reg         uops_8_xcpt_pf_if;
  reg         uops_8_xcpt_ae_if;
  reg         uops_8_xcpt_ma_if;
  reg         uops_8_bp_debug_if;
  reg         uops_8_bp_xcpt_if;
  reg  [1:0]  uops_8_debug_fsrc;
  reg  [1:0]  uops_8_debug_tsrc;
  reg  [6:0]  uops_9_uopc;
  reg  [31:0] uops_9_inst;
  reg  [31:0] uops_9_debug_inst;
  reg         uops_9_is_rvc;
  reg  [39:0] uops_9_debug_pc;
  reg  [2:0]  uops_9_iq_type;
  reg  [9:0]  uops_9_fu_code;
  reg  [3:0]  uops_9_ctrl_br_type;
  reg  [1:0]  uops_9_ctrl_op1_sel;
  reg  [2:0]  uops_9_ctrl_op2_sel;
  reg  [2:0]  uops_9_ctrl_imm_sel;
  reg  [3:0]  uops_9_ctrl_op_fcn;
  reg         uops_9_ctrl_fcn_dw;
  reg  [2:0]  uops_9_ctrl_csr_cmd;
  reg         uops_9_ctrl_is_load;
  reg         uops_9_ctrl_is_sta;
  reg         uops_9_ctrl_is_std;
  reg  [1:0]  uops_9_iw_state;
  reg         uops_9_iw_p1_poisoned;
  reg         uops_9_iw_p2_poisoned;
  reg         uops_9_is_br;
  reg         uops_9_is_jalr;
  reg         uops_9_is_jal;
  reg         uops_9_is_sfb;
  reg  [19:0] uops_9_br_mask;
  reg  [4:0]  uops_9_br_tag;
  reg  [5:0]  uops_9_ftq_idx;
  reg         uops_9_edge_inst;
  reg  [5:0]  uops_9_pc_lob;
  reg         uops_9_taken;
  reg  [19:0] uops_9_imm_packed;
  reg  [11:0] uops_9_csr_addr;
  reg  [6:0]  uops_9_rob_idx;
  reg  [4:0]  uops_9_ldq_idx;
  reg  [4:0]  uops_9_stq_idx;
  reg  [1:0]  uops_9_rxq_idx;
  reg  [6:0]  uops_9_pdst;
  reg  [6:0]  uops_9_prs1;
  reg  [6:0]  uops_9_prs2;
  reg  [6:0]  uops_9_prs3;
  reg  [5:0]  uops_9_ppred;
  reg         uops_9_prs1_busy;
  reg         uops_9_prs2_busy;
  reg         uops_9_prs3_busy;
  reg         uops_9_ppred_busy;
  reg  [6:0]  uops_9_stale_pdst;
  reg         uops_9_exception;
  reg  [63:0] uops_9_exc_cause;
  reg         uops_9_bypassable;
  reg  [4:0]  uops_9_mem_cmd;
  reg  [1:0]  uops_9_mem_size;
  reg         uops_9_mem_signed;
  reg         uops_9_is_fence;
  reg         uops_9_is_fencei;
  reg         uops_9_is_amo;
  reg         uops_9_uses_ldq;
  reg         uops_9_uses_stq;
  reg         uops_9_is_sys_pc2epc;
  reg         uops_9_is_unique;
  reg         uops_9_flush_on_commit;
  reg         uops_9_ldst_is_rs1;
  reg  [5:0]  uops_9_ldst;
  reg  [5:0]  uops_9_lrs1;
  reg  [5:0]  uops_9_lrs2;
  reg  [5:0]  uops_9_lrs3;
  reg         uops_9_ldst_val;
  reg  [1:0]  uops_9_dst_rtype;
  reg  [1:0]  uops_9_lrs1_rtype;
  reg  [1:0]  uops_9_lrs2_rtype;
  reg         uops_9_frs3_en;
  reg         uops_9_fp_val;
  reg         uops_9_fp_single;
  reg         uops_9_xcpt_pf_if;
  reg         uops_9_xcpt_ae_if;
  reg         uops_9_xcpt_ma_if;
  reg         uops_9_bp_debug_if;
  reg         uops_9_bp_xcpt_if;
  reg  [1:0]  uops_9_debug_fsrc;
  reg  [1:0]  uops_9_debug_tsrc;
  reg  [6:0]  uops_10_uopc;
  reg  [31:0] uops_10_inst;
  reg  [31:0] uops_10_debug_inst;
  reg         uops_10_is_rvc;
  reg  [39:0] uops_10_debug_pc;
  reg  [2:0]  uops_10_iq_type;
  reg  [9:0]  uops_10_fu_code;
  reg  [3:0]  uops_10_ctrl_br_type;
  reg  [1:0]  uops_10_ctrl_op1_sel;
  reg  [2:0]  uops_10_ctrl_op2_sel;
  reg  [2:0]  uops_10_ctrl_imm_sel;
  reg  [3:0]  uops_10_ctrl_op_fcn;
  reg         uops_10_ctrl_fcn_dw;
  reg  [2:0]  uops_10_ctrl_csr_cmd;
  reg         uops_10_ctrl_is_load;
  reg         uops_10_ctrl_is_sta;
  reg         uops_10_ctrl_is_std;
  reg  [1:0]  uops_10_iw_state;
  reg         uops_10_iw_p1_poisoned;
  reg         uops_10_iw_p2_poisoned;
  reg         uops_10_is_br;
  reg         uops_10_is_jalr;
  reg         uops_10_is_jal;
  reg         uops_10_is_sfb;
  reg  [19:0] uops_10_br_mask;
  reg  [4:0]  uops_10_br_tag;
  reg  [5:0]  uops_10_ftq_idx;
  reg         uops_10_edge_inst;
  reg  [5:0]  uops_10_pc_lob;
  reg         uops_10_taken;
  reg  [19:0] uops_10_imm_packed;
  reg  [11:0] uops_10_csr_addr;
  reg  [6:0]  uops_10_rob_idx;
  reg  [4:0]  uops_10_ldq_idx;
  reg  [4:0]  uops_10_stq_idx;
  reg  [1:0]  uops_10_rxq_idx;
  reg  [6:0]  uops_10_pdst;
  reg  [6:0]  uops_10_prs1;
  reg  [6:0]  uops_10_prs2;
  reg  [6:0]  uops_10_prs3;
  reg  [5:0]  uops_10_ppred;
  reg         uops_10_prs1_busy;
  reg         uops_10_prs2_busy;
  reg         uops_10_prs3_busy;
  reg         uops_10_ppred_busy;
  reg  [6:0]  uops_10_stale_pdst;
  reg         uops_10_exception;
  reg  [63:0] uops_10_exc_cause;
  reg         uops_10_bypassable;
  reg  [4:0]  uops_10_mem_cmd;
  reg  [1:0]  uops_10_mem_size;
  reg         uops_10_mem_signed;
  reg         uops_10_is_fence;
  reg         uops_10_is_fencei;
  reg         uops_10_is_amo;
  reg         uops_10_uses_ldq;
  reg         uops_10_uses_stq;
  reg         uops_10_is_sys_pc2epc;
  reg         uops_10_is_unique;
  reg         uops_10_flush_on_commit;
  reg         uops_10_ldst_is_rs1;
  reg  [5:0]  uops_10_ldst;
  reg  [5:0]  uops_10_lrs1;
  reg  [5:0]  uops_10_lrs2;
  reg  [5:0]  uops_10_lrs3;
  reg         uops_10_ldst_val;
  reg  [1:0]  uops_10_dst_rtype;
  reg  [1:0]  uops_10_lrs1_rtype;
  reg  [1:0]  uops_10_lrs2_rtype;
  reg         uops_10_frs3_en;
  reg         uops_10_fp_val;
  reg         uops_10_fp_single;
  reg         uops_10_xcpt_pf_if;
  reg         uops_10_xcpt_ae_if;
  reg         uops_10_xcpt_ma_if;
  reg         uops_10_bp_debug_if;
  reg         uops_10_bp_xcpt_if;
  reg  [1:0]  uops_10_debug_fsrc;
  reg  [1:0]  uops_10_debug_tsrc;
  reg  [6:0]  uops_11_uopc;
  reg  [31:0] uops_11_inst;
  reg  [31:0] uops_11_debug_inst;
  reg         uops_11_is_rvc;
  reg  [39:0] uops_11_debug_pc;
  reg  [2:0]  uops_11_iq_type;
  reg  [9:0]  uops_11_fu_code;
  reg  [3:0]  uops_11_ctrl_br_type;
  reg  [1:0]  uops_11_ctrl_op1_sel;
  reg  [2:0]  uops_11_ctrl_op2_sel;
  reg  [2:0]  uops_11_ctrl_imm_sel;
  reg  [3:0]  uops_11_ctrl_op_fcn;
  reg         uops_11_ctrl_fcn_dw;
  reg  [2:0]  uops_11_ctrl_csr_cmd;
  reg         uops_11_ctrl_is_load;
  reg         uops_11_ctrl_is_sta;
  reg         uops_11_ctrl_is_std;
  reg  [1:0]  uops_11_iw_state;
  reg         uops_11_iw_p1_poisoned;
  reg         uops_11_iw_p2_poisoned;
  reg         uops_11_is_br;
  reg         uops_11_is_jalr;
  reg         uops_11_is_jal;
  reg         uops_11_is_sfb;
  reg  [19:0] uops_11_br_mask;
  reg  [4:0]  uops_11_br_tag;
  reg  [5:0]  uops_11_ftq_idx;
  reg         uops_11_edge_inst;
  reg  [5:0]  uops_11_pc_lob;
  reg         uops_11_taken;
  reg  [19:0] uops_11_imm_packed;
  reg  [11:0] uops_11_csr_addr;
  reg  [6:0]  uops_11_rob_idx;
  reg  [4:0]  uops_11_ldq_idx;
  reg  [4:0]  uops_11_stq_idx;
  reg  [1:0]  uops_11_rxq_idx;
  reg  [6:0]  uops_11_pdst;
  reg  [6:0]  uops_11_prs1;
  reg  [6:0]  uops_11_prs2;
  reg  [6:0]  uops_11_prs3;
  reg  [5:0]  uops_11_ppred;
  reg         uops_11_prs1_busy;
  reg         uops_11_prs2_busy;
  reg         uops_11_prs3_busy;
  reg         uops_11_ppred_busy;
  reg  [6:0]  uops_11_stale_pdst;
  reg         uops_11_exception;
  reg  [63:0] uops_11_exc_cause;
  reg         uops_11_bypassable;
  reg  [4:0]  uops_11_mem_cmd;
  reg  [1:0]  uops_11_mem_size;
  reg         uops_11_mem_signed;
  reg         uops_11_is_fence;
  reg         uops_11_is_fencei;
  reg         uops_11_is_amo;
  reg         uops_11_uses_ldq;
  reg         uops_11_uses_stq;
  reg         uops_11_is_sys_pc2epc;
  reg         uops_11_is_unique;
  reg         uops_11_flush_on_commit;
  reg         uops_11_ldst_is_rs1;
  reg  [5:0]  uops_11_ldst;
  reg  [5:0]  uops_11_lrs1;
  reg  [5:0]  uops_11_lrs2;
  reg  [5:0]  uops_11_lrs3;
  reg         uops_11_ldst_val;
  reg  [1:0]  uops_11_dst_rtype;
  reg  [1:0]  uops_11_lrs1_rtype;
  reg  [1:0]  uops_11_lrs2_rtype;
  reg         uops_11_frs3_en;
  reg         uops_11_fp_val;
  reg         uops_11_fp_single;
  reg         uops_11_xcpt_pf_if;
  reg         uops_11_xcpt_ae_if;
  reg         uops_11_xcpt_ma_if;
  reg         uops_11_bp_debug_if;
  reg         uops_11_bp_xcpt_if;
  reg  [1:0]  uops_11_debug_fsrc;
  reg  [1:0]  uops_11_debug_tsrc;
  reg  [6:0]  uops_12_uopc;
  reg  [31:0] uops_12_inst;
  reg  [31:0] uops_12_debug_inst;
  reg         uops_12_is_rvc;
  reg  [39:0] uops_12_debug_pc;
  reg  [2:0]  uops_12_iq_type;
  reg  [9:0]  uops_12_fu_code;
  reg  [3:0]  uops_12_ctrl_br_type;
  reg  [1:0]  uops_12_ctrl_op1_sel;
  reg  [2:0]  uops_12_ctrl_op2_sel;
  reg  [2:0]  uops_12_ctrl_imm_sel;
  reg  [3:0]  uops_12_ctrl_op_fcn;
  reg         uops_12_ctrl_fcn_dw;
  reg  [2:0]  uops_12_ctrl_csr_cmd;
  reg         uops_12_ctrl_is_load;
  reg         uops_12_ctrl_is_sta;
  reg         uops_12_ctrl_is_std;
  reg  [1:0]  uops_12_iw_state;
  reg         uops_12_iw_p1_poisoned;
  reg         uops_12_iw_p2_poisoned;
  reg         uops_12_is_br;
  reg         uops_12_is_jalr;
  reg         uops_12_is_jal;
  reg         uops_12_is_sfb;
  reg  [19:0] uops_12_br_mask;
  reg  [4:0]  uops_12_br_tag;
  reg  [5:0]  uops_12_ftq_idx;
  reg         uops_12_edge_inst;
  reg  [5:0]  uops_12_pc_lob;
  reg         uops_12_taken;
  reg  [19:0] uops_12_imm_packed;
  reg  [11:0] uops_12_csr_addr;
  reg  [6:0]  uops_12_rob_idx;
  reg  [4:0]  uops_12_ldq_idx;
  reg  [4:0]  uops_12_stq_idx;
  reg  [1:0]  uops_12_rxq_idx;
  reg  [6:0]  uops_12_pdst;
  reg  [6:0]  uops_12_prs1;
  reg  [6:0]  uops_12_prs2;
  reg  [6:0]  uops_12_prs3;
  reg  [5:0]  uops_12_ppred;
  reg         uops_12_prs1_busy;
  reg         uops_12_prs2_busy;
  reg         uops_12_prs3_busy;
  reg         uops_12_ppred_busy;
  reg  [6:0]  uops_12_stale_pdst;
  reg         uops_12_exception;
  reg  [63:0] uops_12_exc_cause;
  reg         uops_12_bypassable;
  reg  [4:0]  uops_12_mem_cmd;
  reg  [1:0]  uops_12_mem_size;
  reg         uops_12_mem_signed;
  reg         uops_12_is_fence;
  reg         uops_12_is_fencei;
  reg         uops_12_is_amo;
  reg         uops_12_uses_ldq;
  reg         uops_12_uses_stq;
  reg         uops_12_is_sys_pc2epc;
  reg         uops_12_is_unique;
  reg         uops_12_flush_on_commit;
  reg         uops_12_ldst_is_rs1;
  reg  [5:0]  uops_12_ldst;
  reg  [5:0]  uops_12_lrs1;
  reg  [5:0]  uops_12_lrs2;
  reg  [5:0]  uops_12_lrs3;
  reg         uops_12_ldst_val;
  reg  [1:0]  uops_12_dst_rtype;
  reg  [1:0]  uops_12_lrs1_rtype;
  reg  [1:0]  uops_12_lrs2_rtype;
  reg         uops_12_frs3_en;
  reg         uops_12_fp_val;
  reg         uops_12_fp_single;
  reg         uops_12_xcpt_pf_if;
  reg         uops_12_xcpt_ae_if;
  reg         uops_12_xcpt_ma_if;
  reg         uops_12_bp_debug_if;
  reg         uops_12_bp_xcpt_if;
  reg  [1:0]  uops_12_debug_fsrc;
  reg  [1:0]  uops_12_debug_tsrc;
  reg  [6:0]  uops_13_uopc;
  reg  [31:0] uops_13_inst;
  reg  [31:0] uops_13_debug_inst;
  reg         uops_13_is_rvc;
  reg  [39:0] uops_13_debug_pc;
  reg  [2:0]  uops_13_iq_type;
  reg  [9:0]  uops_13_fu_code;
  reg  [3:0]  uops_13_ctrl_br_type;
  reg  [1:0]  uops_13_ctrl_op1_sel;
  reg  [2:0]  uops_13_ctrl_op2_sel;
  reg  [2:0]  uops_13_ctrl_imm_sel;
  reg  [3:0]  uops_13_ctrl_op_fcn;
  reg         uops_13_ctrl_fcn_dw;
  reg  [2:0]  uops_13_ctrl_csr_cmd;
  reg         uops_13_ctrl_is_load;
  reg         uops_13_ctrl_is_sta;
  reg         uops_13_ctrl_is_std;
  reg  [1:0]  uops_13_iw_state;
  reg         uops_13_iw_p1_poisoned;
  reg         uops_13_iw_p2_poisoned;
  reg         uops_13_is_br;
  reg         uops_13_is_jalr;
  reg         uops_13_is_jal;
  reg         uops_13_is_sfb;
  reg  [19:0] uops_13_br_mask;
  reg  [4:0]  uops_13_br_tag;
  reg  [5:0]  uops_13_ftq_idx;
  reg         uops_13_edge_inst;
  reg  [5:0]  uops_13_pc_lob;
  reg         uops_13_taken;
  reg  [19:0] uops_13_imm_packed;
  reg  [11:0] uops_13_csr_addr;
  reg  [6:0]  uops_13_rob_idx;
  reg  [4:0]  uops_13_ldq_idx;
  reg  [4:0]  uops_13_stq_idx;
  reg  [1:0]  uops_13_rxq_idx;
  reg  [6:0]  uops_13_pdst;
  reg  [6:0]  uops_13_prs1;
  reg  [6:0]  uops_13_prs2;
  reg  [6:0]  uops_13_prs3;
  reg  [5:0]  uops_13_ppred;
  reg         uops_13_prs1_busy;
  reg         uops_13_prs2_busy;
  reg         uops_13_prs3_busy;
  reg         uops_13_ppred_busy;
  reg  [6:0]  uops_13_stale_pdst;
  reg         uops_13_exception;
  reg  [63:0] uops_13_exc_cause;
  reg         uops_13_bypassable;
  reg  [4:0]  uops_13_mem_cmd;
  reg  [1:0]  uops_13_mem_size;
  reg         uops_13_mem_signed;
  reg         uops_13_is_fence;
  reg         uops_13_is_fencei;
  reg         uops_13_is_amo;
  reg         uops_13_uses_ldq;
  reg         uops_13_uses_stq;
  reg         uops_13_is_sys_pc2epc;
  reg         uops_13_is_unique;
  reg         uops_13_flush_on_commit;
  reg         uops_13_ldst_is_rs1;
  reg  [5:0]  uops_13_ldst;
  reg  [5:0]  uops_13_lrs1;
  reg  [5:0]  uops_13_lrs2;
  reg  [5:0]  uops_13_lrs3;
  reg         uops_13_ldst_val;
  reg  [1:0]  uops_13_dst_rtype;
  reg  [1:0]  uops_13_lrs1_rtype;
  reg  [1:0]  uops_13_lrs2_rtype;
  reg         uops_13_frs3_en;
  reg         uops_13_fp_val;
  reg         uops_13_fp_single;
  reg         uops_13_xcpt_pf_if;
  reg         uops_13_xcpt_ae_if;
  reg         uops_13_xcpt_ma_if;
  reg         uops_13_bp_debug_if;
  reg         uops_13_bp_xcpt_if;
  reg  [1:0]  uops_13_debug_fsrc;
  reg  [1:0]  uops_13_debug_tsrc;
  reg  [6:0]  uops_14_uopc;
  reg  [31:0] uops_14_inst;
  reg  [31:0] uops_14_debug_inst;
  reg         uops_14_is_rvc;
  reg  [39:0] uops_14_debug_pc;
  reg  [2:0]  uops_14_iq_type;
  reg  [9:0]  uops_14_fu_code;
  reg  [3:0]  uops_14_ctrl_br_type;
  reg  [1:0]  uops_14_ctrl_op1_sel;
  reg  [2:0]  uops_14_ctrl_op2_sel;
  reg  [2:0]  uops_14_ctrl_imm_sel;
  reg  [3:0]  uops_14_ctrl_op_fcn;
  reg         uops_14_ctrl_fcn_dw;
  reg  [2:0]  uops_14_ctrl_csr_cmd;
  reg         uops_14_ctrl_is_load;
  reg         uops_14_ctrl_is_sta;
  reg         uops_14_ctrl_is_std;
  reg  [1:0]  uops_14_iw_state;
  reg         uops_14_iw_p1_poisoned;
  reg         uops_14_iw_p2_poisoned;
  reg         uops_14_is_br;
  reg         uops_14_is_jalr;
  reg         uops_14_is_jal;
  reg         uops_14_is_sfb;
  reg  [19:0] uops_14_br_mask;
  reg  [4:0]  uops_14_br_tag;
  reg  [5:0]  uops_14_ftq_idx;
  reg         uops_14_edge_inst;
  reg  [5:0]  uops_14_pc_lob;
  reg         uops_14_taken;
  reg  [19:0] uops_14_imm_packed;
  reg  [11:0] uops_14_csr_addr;
  reg  [6:0]  uops_14_rob_idx;
  reg  [4:0]  uops_14_ldq_idx;
  reg  [4:0]  uops_14_stq_idx;
  reg  [1:0]  uops_14_rxq_idx;
  reg  [6:0]  uops_14_pdst;
  reg  [6:0]  uops_14_prs1;
  reg  [6:0]  uops_14_prs2;
  reg  [6:0]  uops_14_prs3;
  reg  [5:0]  uops_14_ppred;
  reg         uops_14_prs1_busy;
  reg         uops_14_prs2_busy;
  reg         uops_14_prs3_busy;
  reg         uops_14_ppred_busy;
  reg  [6:0]  uops_14_stale_pdst;
  reg         uops_14_exception;
  reg  [63:0] uops_14_exc_cause;
  reg         uops_14_bypassable;
  reg  [4:0]  uops_14_mem_cmd;
  reg  [1:0]  uops_14_mem_size;
  reg         uops_14_mem_signed;
  reg         uops_14_is_fence;
  reg         uops_14_is_fencei;
  reg         uops_14_is_amo;
  reg         uops_14_uses_ldq;
  reg         uops_14_uses_stq;
  reg         uops_14_is_sys_pc2epc;
  reg         uops_14_is_unique;
  reg         uops_14_flush_on_commit;
  reg         uops_14_ldst_is_rs1;
  reg  [5:0]  uops_14_ldst;
  reg  [5:0]  uops_14_lrs1;
  reg  [5:0]  uops_14_lrs2;
  reg  [5:0]  uops_14_lrs3;
  reg         uops_14_ldst_val;
  reg  [1:0]  uops_14_dst_rtype;
  reg  [1:0]  uops_14_lrs1_rtype;
  reg  [1:0]  uops_14_lrs2_rtype;
  reg         uops_14_frs3_en;
  reg         uops_14_fp_val;
  reg         uops_14_fp_single;
  reg         uops_14_xcpt_pf_if;
  reg         uops_14_xcpt_ae_if;
  reg         uops_14_xcpt_ma_if;
  reg         uops_14_bp_debug_if;
  reg         uops_14_bp_xcpt_if;
  reg  [1:0]  uops_14_debug_fsrc;
  reg  [1:0]  uops_14_debug_tsrc;
  reg  [6:0]  uops_15_uopc;
  reg  [31:0] uops_15_inst;
  reg  [31:0] uops_15_debug_inst;
  reg         uops_15_is_rvc;
  reg  [39:0] uops_15_debug_pc;
  reg  [2:0]  uops_15_iq_type;
  reg  [9:0]  uops_15_fu_code;
  reg  [3:0]  uops_15_ctrl_br_type;
  reg  [1:0]  uops_15_ctrl_op1_sel;
  reg  [2:0]  uops_15_ctrl_op2_sel;
  reg  [2:0]  uops_15_ctrl_imm_sel;
  reg  [3:0]  uops_15_ctrl_op_fcn;
  reg         uops_15_ctrl_fcn_dw;
  reg  [2:0]  uops_15_ctrl_csr_cmd;
  reg         uops_15_ctrl_is_load;
  reg         uops_15_ctrl_is_sta;
  reg         uops_15_ctrl_is_std;
  reg  [1:0]  uops_15_iw_state;
  reg         uops_15_iw_p1_poisoned;
  reg         uops_15_iw_p2_poisoned;
  reg         uops_15_is_br;
  reg         uops_15_is_jalr;
  reg         uops_15_is_jal;
  reg         uops_15_is_sfb;
  reg  [19:0] uops_15_br_mask;
  reg  [4:0]  uops_15_br_tag;
  reg  [5:0]  uops_15_ftq_idx;
  reg         uops_15_edge_inst;
  reg  [5:0]  uops_15_pc_lob;
  reg         uops_15_taken;
  reg  [19:0] uops_15_imm_packed;
  reg  [11:0] uops_15_csr_addr;
  reg  [6:0]  uops_15_rob_idx;
  reg  [4:0]  uops_15_ldq_idx;
  reg  [4:0]  uops_15_stq_idx;
  reg  [1:0]  uops_15_rxq_idx;
  reg  [6:0]  uops_15_pdst;
  reg  [6:0]  uops_15_prs1;
  reg  [6:0]  uops_15_prs2;
  reg  [6:0]  uops_15_prs3;
  reg  [5:0]  uops_15_ppred;
  reg         uops_15_prs1_busy;
  reg         uops_15_prs2_busy;
  reg         uops_15_prs3_busy;
  reg         uops_15_ppred_busy;
  reg  [6:0]  uops_15_stale_pdst;
  reg         uops_15_exception;
  reg  [63:0] uops_15_exc_cause;
  reg         uops_15_bypassable;
  reg  [4:0]  uops_15_mem_cmd;
  reg  [1:0]  uops_15_mem_size;
  reg         uops_15_mem_signed;
  reg         uops_15_is_fence;
  reg         uops_15_is_fencei;
  reg         uops_15_is_amo;
  reg         uops_15_uses_ldq;
  reg         uops_15_uses_stq;
  reg         uops_15_is_sys_pc2epc;
  reg         uops_15_is_unique;
  reg         uops_15_flush_on_commit;
  reg         uops_15_ldst_is_rs1;
  reg  [5:0]  uops_15_ldst;
  reg  [5:0]  uops_15_lrs1;
  reg  [5:0]  uops_15_lrs2;
  reg  [5:0]  uops_15_lrs3;
  reg         uops_15_ldst_val;
  reg  [1:0]  uops_15_dst_rtype;
  reg  [1:0]  uops_15_lrs1_rtype;
  reg  [1:0]  uops_15_lrs2_rtype;
  reg         uops_15_frs3_en;
  reg         uops_15_fp_val;
  reg         uops_15_fp_single;
  reg         uops_15_xcpt_pf_if;
  reg         uops_15_xcpt_ae_if;
  reg         uops_15_xcpt_ma_if;
  reg         uops_15_bp_debug_if;
  reg         uops_15_bp_xcpt_if;
  reg  [1:0]  uops_15_debug_fsrc;
  reg  [1:0]  uops_15_debug_tsrc;
  reg  [3:0]  enq_ptr_value;
  reg  [3:0]  deq_ptr_value;
  reg         maybe_full;
  wire        ptr_match = enq_ptr_value == deq_ptr_value;
  wire        _io_empty_output = ptr_match & ~maybe_full;
  wire        full = ptr_match & maybe_full;
  wire        do_enq = ~full & io_enq_valid;
  reg         casez_tmp;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp = valids_0;
      4'b0001:
        casez_tmp = valids_1;
      4'b0010:
        casez_tmp = valids_2;
      4'b0011:
        casez_tmp = valids_3;
      4'b0100:
        casez_tmp = valids_4;
      4'b0101:
        casez_tmp = valids_5;
      4'b0110:
        casez_tmp = valids_6;
      4'b0111:
        casez_tmp = valids_7;
      4'b1000:
        casez_tmp = valids_8;
      4'b1001:
        casez_tmp = valids_9;
      4'b1010:
        casez_tmp = valids_10;
      4'b1011:
        casez_tmp = valids_11;
      4'b1100:
        casez_tmp = valids_12;
      4'b1101:
        casez_tmp = valids_13;
      4'b1110:
        casez_tmp = valids_14;
      default:
        casez_tmp = valids_15;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_0;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_0 = uops_0_uopc;
      4'b0001:
        casez_tmp_0 = uops_1_uopc;
      4'b0010:
        casez_tmp_0 = uops_2_uopc;
      4'b0011:
        casez_tmp_0 = uops_3_uopc;
      4'b0100:
        casez_tmp_0 = uops_4_uopc;
      4'b0101:
        casez_tmp_0 = uops_5_uopc;
      4'b0110:
        casez_tmp_0 = uops_6_uopc;
      4'b0111:
        casez_tmp_0 = uops_7_uopc;
      4'b1000:
        casez_tmp_0 = uops_8_uopc;
      4'b1001:
        casez_tmp_0 = uops_9_uopc;
      4'b1010:
        casez_tmp_0 = uops_10_uopc;
      4'b1011:
        casez_tmp_0 = uops_11_uopc;
      4'b1100:
        casez_tmp_0 = uops_12_uopc;
      4'b1101:
        casez_tmp_0 = uops_13_uopc;
      4'b1110:
        casez_tmp_0 = uops_14_uopc;
      default:
        casez_tmp_0 = uops_15_uopc;
    endcase
  end // always @(*)
  reg  [31:0] casez_tmp_1;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_1 = uops_0_inst;
      4'b0001:
        casez_tmp_1 = uops_1_inst;
      4'b0010:
        casez_tmp_1 = uops_2_inst;
      4'b0011:
        casez_tmp_1 = uops_3_inst;
      4'b0100:
        casez_tmp_1 = uops_4_inst;
      4'b0101:
        casez_tmp_1 = uops_5_inst;
      4'b0110:
        casez_tmp_1 = uops_6_inst;
      4'b0111:
        casez_tmp_1 = uops_7_inst;
      4'b1000:
        casez_tmp_1 = uops_8_inst;
      4'b1001:
        casez_tmp_1 = uops_9_inst;
      4'b1010:
        casez_tmp_1 = uops_10_inst;
      4'b1011:
        casez_tmp_1 = uops_11_inst;
      4'b1100:
        casez_tmp_1 = uops_12_inst;
      4'b1101:
        casez_tmp_1 = uops_13_inst;
      4'b1110:
        casez_tmp_1 = uops_14_inst;
      default:
        casez_tmp_1 = uops_15_inst;
    endcase
  end // always @(*)
  reg  [31:0] casez_tmp_2;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_2 = uops_0_debug_inst;
      4'b0001:
        casez_tmp_2 = uops_1_debug_inst;
      4'b0010:
        casez_tmp_2 = uops_2_debug_inst;
      4'b0011:
        casez_tmp_2 = uops_3_debug_inst;
      4'b0100:
        casez_tmp_2 = uops_4_debug_inst;
      4'b0101:
        casez_tmp_2 = uops_5_debug_inst;
      4'b0110:
        casez_tmp_2 = uops_6_debug_inst;
      4'b0111:
        casez_tmp_2 = uops_7_debug_inst;
      4'b1000:
        casez_tmp_2 = uops_8_debug_inst;
      4'b1001:
        casez_tmp_2 = uops_9_debug_inst;
      4'b1010:
        casez_tmp_2 = uops_10_debug_inst;
      4'b1011:
        casez_tmp_2 = uops_11_debug_inst;
      4'b1100:
        casez_tmp_2 = uops_12_debug_inst;
      4'b1101:
        casez_tmp_2 = uops_13_debug_inst;
      4'b1110:
        casez_tmp_2 = uops_14_debug_inst;
      default:
        casez_tmp_2 = uops_15_debug_inst;
    endcase
  end // always @(*)
  reg         casez_tmp_3;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_3 = uops_0_is_rvc;
      4'b0001:
        casez_tmp_3 = uops_1_is_rvc;
      4'b0010:
        casez_tmp_3 = uops_2_is_rvc;
      4'b0011:
        casez_tmp_3 = uops_3_is_rvc;
      4'b0100:
        casez_tmp_3 = uops_4_is_rvc;
      4'b0101:
        casez_tmp_3 = uops_5_is_rvc;
      4'b0110:
        casez_tmp_3 = uops_6_is_rvc;
      4'b0111:
        casez_tmp_3 = uops_7_is_rvc;
      4'b1000:
        casez_tmp_3 = uops_8_is_rvc;
      4'b1001:
        casez_tmp_3 = uops_9_is_rvc;
      4'b1010:
        casez_tmp_3 = uops_10_is_rvc;
      4'b1011:
        casez_tmp_3 = uops_11_is_rvc;
      4'b1100:
        casez_tmp_3 = uops_12_is_rvc;
      4'b1101:
        casez_tmp_3 = uops_13_is_rvc;
      4'b1110:
        casez_tmp_3 = uops_14_is_rvc;
      default:
        casez_tmp_3 = uops_15_is_rvc;
    endcase
  end // always @(*)
  reg  [39:0] casez_tmp_4;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_4 = uops_0_debug_pc;
      4'b0001:
        casez_tmp_4 = uops_1_debug_pc;
      4'b0010:
        casez_tmp_4 = uops_2_debug_pc;
      4'b0011:
        casez_tmp_4 = uops_3_debug_pc;
      4'b0100:
        casez_tmp_4 = uops_4_debug_pc;
      4'b0101:
        casez_tmp_4 = uops_5_debug_pc;
      4'b0110:
        casez_tmp_4 = uops_6_debug_pc;
      4'b0111:
        casez_tmp_4 = uops_7_debug_pc;
      4'b1000:
        casez_tmp_4 = uops_8_debug_pc;
      4'b1001:
        casez_tmp_4 = uops_9_debug_pc;
      4'b1010:
        casez_tmp_4 = uops_10_debug_pc;
      4'b1011:
        casez_tmp_4 = uops_11_debug_pc;
      4'b1100:
        casez_tmp_4 = uops_12_debug_pc;
      4'b1101:
        casez_tmp_4 = uops_13_debug_pc;
      4'b1110:
        casez_tmp_4 = uops_14_debug_pc;
      default:
        casez_tmp_4 = uops_15_debug_pc;
    endcase
  end // always @(*)
  reg  [2:0]  casez_tmp_5;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_5 = uops_0_iq_type;
      4'b0001:
        casez_tmp_5 = uops_1_iq_type;
      4'b0010:
        casez_tmp_5 = uops_2_iq_type;
      4'b0011:
        casez_tmp_5 = uops_3_iq_type;
      4'b0100:
        casez_tmp_5 = uops_4_iq_type;
      4'b0101:
        casez_tmp_5 = uops_5_iq_type;
      4'b0110:
        casez_tmp_5 = uops_6_iq_type;
      4'b0111:
        casez_tmp_5 = uops_7_iq_type;
      4'b1000:
        casez_tmp_5 = uops_8_iq_type;
      4'b1001:
        casez_tmp_5 = uops_9_iq_type;
      4'b1010:
        casez_tmp_5 = uops_10_iq_type;
      4'b1011:
        casez_tmp_5 = uops_11_iq_type;
      4'b1100:
        casez_tmp_5 = uops_12_iq_type;
      4'b1101:
        casez_tmp_5 = uops_13_iq_type;
      4'b1110:
        casez_tmp_5 = uops_14_iq_type;
      default:
        casez_tmp_5 = uops_15_iq_type;
    endcase
  end // always @(*)
  reg  [9:0]  casez_tmp_6;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_6 = uops_0_fu_code;
      4'b0001:
        casez_tmp_6 = uops_1_fu_code;
      4'b0010:
        casez_tmp_6 = uops_2_fu_code;
      4'b0011:
        casez_tmp_6 = uops_3_fu_code;
      4'b0100:
        casez_tmp_6 = uops_4_fu_code;
      4'b0101:
        casez_tmp_6 = uops_5_fu_code;
      4'b0110:
        casez_tmp_6 = uops_6_fu_code;
      4'b0111:
        casez_tmp_6 = uops_7_fu_code;
      4'b1000:
        casez_tmp_6 = uops_8_fu_code;
      4'b1001:
        casez_tmp_6 = uops_9_fu_code;
      4'b1010:
        casez_tmp_6 = uops_10_fu_code;
      4'b1011:
        casez_tmp_6 = uops_11_fu_code;
      4'b1100:
        casez_tmp_6 = uops_12_fu_code;
      4'b1101:
        casez_tmp_6 = uops_13_fu_code;
      4'b1110:
        casez_tmp_6 = uops_14_fu_code;
      default:
        casez_tmp_6 = uops_15_fu_code;
    endcase
  end // always @(*)
  reg  [3:0]  casez_tmp_7;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_7 = uops_0_ctrl_br_type;
      4'b0001:
        casez_tmp_7 = uops_1_ctrl_br_type;
      4'b0010:
        casez_tmp_7 = uops_2_ctrl_br_type;
      4'b0011:
        casez_tmp_7 = uops_3_ctrl_br_type;
      4'b0100:
        casez_tmp_7 = uops_4_ctrl_br_type;
      4'b0101:
        casez_tmp_7 = uops_5_ctrl_br_type;
      4'b0110:
        casez_tmp_7 = uops_6_ctrl_br_type;
      4'b0111:
        casez_tmp_7 = uops_7_ctrl_br_type;
      4'b1000:
        casez_tmp_7 = uops_8_ctrl_br_type;
      4'b1001:
        casez_tmp_7 = uops_9_ctrl_br_type;
      4'b1010:
        casez_tmp_7 = uops_10_ctrl_br_type;
      4'b1011:
        casez_tmp_7 = uops_11_ctrl_br_type;
      4'b1100:
        casez_tmp_7 = uops_12_ctrl_br_type;
      4'b1101:
        casez_tmp_7 = uops_13_ctrl_br_type;
      4'b1110:
        casez_tmp_7 = uops_14_ctrl_br_type;
      default:
        casez_tmp_7 = uops_15_ctrl_br_type;
    endcase
  end // always @(*)
  reg  [1:0]  casez_tmp_8;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_8 = uops_0_ctrl_op1_sel;
      4'b0001:
        casez_tmp_8 = uops_1_ctrl_op1_sel;
      4'b0010:
        casez_tmp_8 = uops_2_ctrl_op1_sel;
      4'b0011:
        casez_tmp_8 = uops_3_ctrl_op1_sel;
      4'b0100:
        casez_tmp_8 = uops_4_ctrl_op1_sel;
      4'b0101:
        casez_tmp_8 = uops_5_ctrl_op1_sel;
      4'b0110:
        casez_tmp_8 = uops_6_ctrl_op1_sel;
      4'b0111:
        casez_tmp_8 = uops_7_ctrl_op1_sel;
      4'b1000:
        casez_tmp_8 = uops_8_ctrl_op1_sel;
      4'b1001:
        casez_tmp_8 = uops_9_ctrl_op1_sel;
      4'b1010:
        casez_tmp_8 = uops_10_ctrl_op1_sel;
      4'b1011:
        casez_tmp_8 = uops_11_ctrl_op1_sel;
      4'b1100:
        casez_tmp_8 = uops_12_ctrl_op1_sel;
      4'b1101:
        casez_tmp_8 = uops_13_ctrl_op1_sel;
      4'b1110:
        casez_tmp_8 = uops_14_ctrl_op1_sel;
      default:
        casez_tmp_8 = uops_15_ctrl_op1_sel;
    endcase
  end // always @(*)
  reg  [2:0]  casez_tmp_9;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_9 = uops_0_ctrl_op2_sel;
      4'b0001:
        casez_tmp_9 = uops_1_ctrl_op2_sel;
      4'b0010:
        casez_tmp_9 = uops_2_ctrl_op2_sel;
      4'b0011:
        casez_tmp_9 = uops_3_ctrl_op2_sel;
      4'b0100:
        casez_tmp_9 = uops_4_ctrl_op2_sel;
      4'b0101:
        casez_tmp_9 = uops_5_ctrl_op2_sel;
      4'b0110:
        casez_tmp_9 = uops_6_ctrl_op2_sel;
      4'b0111:
        casez_tmp_9 = uops_7_ctrl_op2_sel;
      4'b1000:
        casez_tmp_9 = uops_8_ctrl_op2_sel;
      4'b1001:
        casez_tmp_9 = uops_9_ctrl_op2_sel;
      4'b1010:
        casez_tmp_9 = uops_10_ctrl_op2_sel;
      4'b1011:
        casez_tmp_9 = uops_11_ctrl_op2_sel;
      4'b1100:
        casez_tmp_9 = uops_12_ctrl_op2_sel;
      4'b1101:
        casez_tmp_9 = uops_13_ctrl_op2_sel;
      4'b1110:
        casez_tmp_9 = uops_14_ctrl_op2_sel;
      default:
        casez_tmp_9 = uops_15_ctrl_op2_sel;
    endcase
  end // always @(*)
  reg  [2:0]  casez_tmp_10;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_10 = uops_0_ctrl_imm_sel;
      4'b0001:
        casez_tmp_10 = uops_1_ctrl_imm_sel;
      4'b0010:
        casez_tmp_10 = uops_2_ctrl_imm_sel;
      4'b0011:
        casez_tmp_10 = uops_3_ctrl_imm_sel;
      4'b0100:
        casez_tmp_10 = uops_4_ctrl_imm_sel;
      4'b0101:
        casez_tmp_10 = uops_5_ctrl_imm_sel;
      4'b0110:
        casez_tmp_10 = uops_6_ctrl_imm_sel;
      4'b0111:
        casez_tmp_10 = uops_7_ctrl_imm_sel;
      4'b1000:
        casez_tmp_10 = uops_8_ctrl_imm_sel;
      4'b1001:
        casez_tmp_10 = uops_9_ctrl_imm_sel;
      4'b1010:
        casez_tmp_10 = uops_10_ctrl_imm_sel;
      4'b1011:
        casez_tmp_10 = uops_11_ctrl_imm_sel;
      4'b1100:
        casez_tmp_10 = uops_12_ctrl_imm_sel;
      4'b1101:
        casez_tmp_10 = uops_13_ctrl_imm_sel;
      4'b1110:
        casez_tmp_10 = uops_14_ctrl_imm_sel;
      default:
        casez_tmp_10 = uops_15_ctrl_imm_sel;
    endcase
  end // always @(*)
  reg  [3:0]  casez_tmp_11;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_11 = uops_0_ctrl_op_fcn;
      4'b0001:
        casez_tmp_11 = uops_1_ctrl_op_fcn;
      4'b0010:
        casez_tmp_11 = uops_2_ctrl_op_fcn;
      4'b0011:
        casez_tmp_11 = uops_3_ctrl_op_fcn;
      4'b0100:
        casez_tmp_11 = uops_4_ctrl_op_fcn;
      4'b0101:
        casez_tmp_11 = uops_5_ctrl_op_fcn;
      4'b0110:
        casez_tmp_11 = uops_6_ctrl_op_fcn;
      4'b0111:
        casez_tmp_11 = uops_7_ctrl_op_fcn;
      4'b1000:
        casez_tmp_11 = uops_8_ctrl_op_fcn;
      4'b1001:
        casez_tmp_11 = uops_9_ctrl_op_fcn;
      4'b1010:
        casez_tmp_11 = uops_10_ctrl_op_fcn;
      4'b1011:
        casez_tmp_11 = uops_11_ctrl_op_fcn;
      4'b1100:
        casez_tmp_11 = uops_12_ctrl_op_fcn;
      4'b1101:
        casez_tmp_11 = uops_13_ctrl_op_fcn;
      4'b1110:
        casez_tmp_11 = uops_14_ctrl_op_fcn;
      default:
        casez_tmp_11 = uops_15_ctrl_op_fcn;
    endcase
  end // always @(*)
  reg         casez_tmp_12;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_12 = uops_0_ctrl_fcn_dw;
      4'b0001:
        casez_tmp_12 = uops_1_ctrl_fcn_dw;
      4'b0010:
        casez_tmp_12 = uops_2_ctrl_fcn_dw;
      4'b0011:
        casez_tmp_12 = uops_3_ctrl_fcn_dw;
      4'b0100:
        casez_tmp_12 = uops_4_ctrl_fcn_dw;
      4'b0101:
        casez_tmp_12 = uops_5_ctrl_fcn_dw;
      4'b0110:
        casez_tmp_12 = uops_6_ctrl_fcn_dw;
      4'b0111:
        casez_tmp_12 = uops_7_ctrl_fcn_dw;
      4'b1000:
        casez_tmp_12 = uops_8_ctrl_fcn_dw;
      4'b1001:
        casez_tmp_12 = uops_9_ctrl_fcn_dw;
      4'b1010:
        casez_tmp_12 = uops_10_ctrl_fcn_dw;
      4'b1011:
        casez_tmp_12 = uops_11_ctrl_fcn_dw;
      4'b1100:
        casez_tmp_12 = uops_12_ctrl_fcn_dw;
      4'b1101:
        casez_tmp_12 = uops_13_ctrl_fcn_dw;
      4'b1110:
        casez_tmp_12 = uops_14_ctrl_fcn_dw;
      default:
        casez_tmp_12 = uops_15_ctrl_fcn_dw;
    endcase
  end // always @(*)
  reg  [2:0]  casez_tmp_13;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_13 = uops_0_ctrl_csr_cmd;
      4'b0001:
        casez_tmp_13 = uops_1_ctrl_csr_cmd;
      4'b0010:
        casez_tmp_13 = uops_2_ctrl_csr_cmd;
      4'b0011:
        casez_tmp_13 = uops_3_ctrl_csr_cmd;
      4'b0100:
        casez_tmp_13 = uops_4_ctrl_csr_cmd;
      4'b0101:
        casez_tmp_13 = uops_5_ctrl_csr_cmd;
      4'b0110:
        casez_tmp_13 = uops_6_ctrl_csr_cmd;
      4'b0111:
        casez_tmp_13 = uops_7_ctrl_csr_cmd;
      4'b1000:
        casez_tmp_13 = uops_8_ctrl_csr_cmd;
      4'b1001:
        casez_tmp_13 = uops_9_ctrl_csr_cmd;
      4'b1010:
        casez_tmp_13 = uops_10_ctrl_csr_cmd;
      4'b1011:
        casez_tmp_13 = uops_11_ctrl_csr_cmd;
      4'b1100:
        casez_tmp_13 = uops_12_ctrl_csr_cmd;
      4'b1101:
        casez_tmp_13 = uops_13_ctrl_csr_cmd;
      4'b1110:
        casez_tmp_13 = uops_14_ctrl_csr_cmd;
      default:
        casez_tmp_13 = uops_15_ctrl_csr_cmd;
    endcase
  end // always @(*)
  reg         casez_tmp_14;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_14 = uops_0_ctrl_is_load;
      4'b0001:
        casez_tmp_14 = uops_1_ctrl_is_load;
      4'b0010:
        casez_tmp_14 = uops_2_ctrl_is_load;
      4'b0011:
        casez_tmp_14 = uops_3_ctrl_is_load;
      4'b0100:
        casez_tmp_14 = uops_4_ctrl_is_load;
      4'b0101:
        casez_tmp_14 = uops_5_ctrl_is_load;
      4'b0110:
        casez_tmp_14 = uops_6_ctrl_is_load;
      4'b0111:
        casez_tmp_14 = uops_7_ctrl_is_load;
      4'b1000:
        casez_tmp_14 = uops_8_ctrl_is_load;
      4'b1001:
        casez_tmp_14 = uops_9_ctrl_is_load;
      4'b1010:
        casez_tmp_14 = uops_10_ctrl_is_load;
      4'b1011:
        casez_tmp_14 = uops_11_ctrl_is_load;
      4'b1100:
        casez_tmp_14 = uops_12_ctrl_is_load;
      4'b1101:
        casez_tmp_14 = uops_13_ctrl_is_load;
      4'b1110:
        casez_tmp_14 = uops_14_ctrl_is_load;
      default:
        casez_tmp_14 = uops_15_ctrl_is_load;
    endcase
  end // always @(*)
  reg         casez_tmp_15;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_15 = uops_0_ctrl_is_sta;
      4'b0001:
        casez_tmp_15 = uops_1_ctrl_is_sta;
      4'b0010:
        casez_tmp_15 = uops_2_ctrl_is_sta;
      4'b0011:
        casez_tmp_15 = uops_3_ctrl_is_sta;
      4'b0100:
        casez_tmp_15 = uops_4_ctrl_is_sta;
      4'b0101:
        casez_tmp_15 = uops_5_ctrl_is_sta;
      4'b0110:
        casez_tmp_15 = uops_6_ctrl_is_sta;
      4'b0111:
        casez_tmp_15 = uops_7_ctrl_is_sta;
      4'b1000:
        casez_tmp_15 = uops_8_ctrl_is_sta;
      4'b1001:
        casez_tmp_15 = uops_9_ctrl_is_sta;
      4'b1010:
        casez_tmp_15 = uops_10_ctrl_is_sta;
      4'b1011:
        casez_tmp_15 = uops_11_ctrl_is_sta;
      4'b1100:
        casez_tmp_15 = uops_12_ctrl_is_sta;
      4'b1101:
        casez_tmp_15 = uops_13_ctrl_is_sta;
      4'b1110:
        casez_tmp_15 = uops_14_ctrl_is_sta;
      default:
        casez_tmp_15 = uops_15_ctrl_is_sta;
    endcase
  end // always @(*)
  reg         casez_tmp_16;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_16 = uops_0_ctrl_is_std;
      4'b0001:
        casez_tmp_16 = uops_1_ctrl_is_std;
      4'b0010:
        casez_tmp_16 = uops_2_ctrl_is_std;
      4'b0011:
        casez_tmp_16 = uops_3_ctrl_is_std;
      4'b0100:
        casez_tmp_16 = uops_4_ctrl_is_std;
      4'b0101:
        casez_tmp_16 = uops_5_ctrl_is_std;
      4'b0110:
        casez_tmp_16 = uops_6_ctrl_is_std;
      4'b0111:
        casez_tmp_16 = uops_7_ctrl_is_std;
      4'b1000:
        casez_tmp_16 = uops_8_ctrl_is_std;
      4'b1001:
        casez_tmp_16 = uops_9_ctrl_is_std;
      4'b1010:
        casez_tmp_16 = uops_10_ctrl_is_std;
      4'b1011:
        casez_tmp_16 = uops_11_ctrl_is_std;
      4'b1100:
        casez_tmp_16 = uops_12_ctrl_is_std;
      4'b1101:
        casez_tmp_16 = uops_13_ctrl_is_std;
      4'b1110:
        casez_tmp_16 = uops_14_ctrl_is_std;
      default:
        casez_tmp_16 = uops_15_ctrl_is_std;
    endcase
  end // always @(*)
  reg  [1:0]  casez_tmp_17;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_17 = uops_0_iw_state;
      4'b0001:
        casez_tmp_17 = uops_1_iw_state;
      4'b0010:
        casez_tmp_17 = uops_2_iw_state;
      4'b0011:
        casez_tmp_17 = uops_3_iw_state;
      4'b0100:
        casez_tmp_17 = uops_4_iw_state;
      4'b0101:
        casez_tmp_17 = uops_5_iw_state;
      4'b0110:
        casez_tmp_17 = uops_6_iw_state;
      4'b0111:
        casez_tmp_17 = uops_7_iw_state;
      4'b1000:
        casez_tmp_17 = uops_8_iw_state;
      4'b1001:
        casez_tmp_17 = uops_9_iw_state;
      4'b1010:
        casez_tmp_17 = uops_10_iw_state;
      4'b1011:
        casez_tmp_17 = uops_11_iw_state;
      4'b1100:
        casez_tmp_17 = uops_12_iw_state;
      4'b1101:
        casez_tmp_17 = uops_13_iw_state;
      4'b1110:
        casez_tmp_17 = uops_14_iw_state;
      default:
        casez_tmp_17 = uops_15_iw_state;
    endcase
  end // always @(*)
  reg         casez_tmp_18;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_18 = uops_0_iw_p1_poisoned;
      4'b0001:
        casez_tmp_18 = uops_1_iw_p1_poisoned;
      4'b0010:
        casez_tmp_18 = uops_2_iw_p1_poisoned;
      4'b0011:
        casez_tmp_18 = uops_3_iw_p1_poisoned;
      4'b0100:
        casez_tmp_18 = uops_4_iw_p1_poisoned;
      4'b0101:
        casez_tmp_18 = uops_5_iw_p1_poisoned;
      4'b0110:
        casez_tmp_18 = uops_6_iw_p1_poisoned;
      4'b0111:
        casez_tmp_18 = uops_7_iw_p1_poisoned;
      4'b1000:
        casez_tmp_18 = uops_8_iw_p1_poisoned;
      4'b1001:
        casez_tmp_18 = uops_9_iw_p1_poisoned;
      4'b1010:
        casez_tmp_18 = uops_10_iw_p1_poisoned;
      4'b1011:
        casez_tmp_18 = uops_11_iw_p1_poisoned;
      4'b1100:
        casez_tmp_18 = uops_12_iw_p1_poisoned;
      4'b1101:
        casez_tmp_18 = uops_13_iw_p1_poisoned;
      4'b1110:
        casez_tmp_18 = uops_14_iw_p1_poisoned;
      default:
        casez_tmp_18 = uops_15_iw_p1_poisoned;
    endcase
  end // always @(*)
  reg         casez_tmp_19;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_19 = uops_0_iw_p2_poisoned;
      4'b0001:
        casez_tmp_19 = uops_1_iw_p2_poisoned;
      4'b0010:
        casez_tmp_19 = uops_2_iw_p2_poisoned;
      4'b0011:
        casez_tmp_19 = uops_3_iw_p2_poisoned;
      4'b0100:
        casez_tmp_19 = uops_4_iw_p2_poisoned;
      4'b0101:
        casez_tmp_19 = uops_5_iw_p2_poisoned;
      4'b0110:
        casez_tmp_19 = uops_6_iw_p2_poisoned;
      4'b0111:
        casez_tmp_19 = uops_7_iw_p2_poisoned;
      4'b1000:
        casez_tmp_19 = uops_8_iw_p2_poisoned;
      4'b1001:
        casez_tmp_19 = uops_9_iw_p2_poisoned;
      4'b1010:
        casez_tmp_19 = uops_10_iw_p2_poisoned;
      4'b1011:
        casez_tmp_19 = uops_11_iw_p2_poisoned;
      4'b1100:
        casez_tmp_19 = uops_12_iw_p2_poisoned;
      4'b1101:
        casez_tmp_19 = uops_13_iw_p2_poisoned;
      4'b1110:
        casez_tmp_19 = uops_14_iw_p2_poisoned;
      default:
        casez_tmp_19 = uops_15_iw_p2_poisoned;
    endcase
  end // always @(*)
  reg         casez_tmp_20;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_20 = uops_0_is_br;
      4'b0001:
        casez_tmp_20 = uops_1_is_br;
      4'b0010:
        casez_tmp_20 = uops_2_is_br;
      4'b0011:
        casez_tmp_20 = uops_3_is_br;
      4'b0100:
        casez_tmp_20 = uops_4_is_br;
      4'b0101:
        casez_tmp_20 = uops_5_is_br;
      4'b0110:
        casez_tmp_20 = uops_6_is_br;
      4'b0111:
        casez_tmp_20 = uops_7_is_br;
      4'b1000:
        casez_tmp_20 = uops_8_is_br;
      4'b1001:
        casez_tmp_20 = uops_9_is_br;
      4'b1010:
        casez_tmp_20 = uops_10_is_br;
      4'b1011:
        casez_tmp_20 = uops_11_is_br;
      4'b1100:
        casez_tmp_20 = uops_12_is_br;
      4'b1101:
        casez_tmp_20 = uops_13_is_br;
      4'b1110:
        casez_tmp_20 = uops_14_is_br;
      default:
        casez_tmp_20 = uops_15_is_br;
    endcase
  end // always @(*)
  reg         casez_tmp_21;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_21 = uops_0_is_jalr;
      4'b0001:
        casez_tmp_21 = uops_1_is_jalr;
      4'b0010:
        casez_tmp_21 = uops_2_is_jalr;
      4'b0011:
        casez_tmp_21 = uops_3_is_jalr;
      4'b0100:
        casez_tmp_21 = uops_4_is_jalr;
      4'b0101:
        casez_tmp_21 = uops_5_is_jalr;
      4'b0110:
        casez_tmp_21 = uops_6_is_jalr;
      4'b0111:
        casez_tmp_21 = uops_7_is_jalr;
      4'b1000:
        casez_tmp_21 = uops_8_is_jalr;
      4'b1001:
        casez_tmp_21 = uops_9_is_jalr;
      4'b1010:
        casez_tmp_21 = uops_10_is_jalr;
      4'b1011:
        casez_tmp_21 = uops_11_is_jalr;
      4'b1100:
        casez_tmp_21 = uops_12_is_jalr;
      4'b1101:
        casez_tmp_21 = uops_13_is_jalr;
      4'b1110:
        casez_tmp_21 = uops_14_is_jalr;
      default:
        casez_tmp_21 = uops_15_is_jalr;
    endcase
  end // always @(*)
  reg         casez_tmp_22;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_22 = uops_0_is_jal;
      4'b0001:
        casez_tmp_22 = uops_1_is_jal;
      4'b0010:
        casez_tmp_22 = uops_2_is_jal;
      4'b0011:
        casez_tmp_22 = uops_3_is_jal;
      4'b0100:
        casez_tmp_22 = uops_4_is_jal;
      4'b0101:
        casez_tmp_22 = uops_5_is_jal;
      4'b0110:
        casez_tmp_22 = uops_6_is_jal;
      4'b0111:
        casez_tmp_22 = uops_7_is_jal;
      4'b1000:
        casez_tmp_22 = uops_8_is_jal;
      4'b1001:
        casez_tmp_22 = uops_9_is_jal;
      4'b1010:
        casez_tmp_22 = uops_10_is_jal;
      4'b1011:
        casez_tmp_22 = uops_11_is_jal;
      4'b1100:
        casez_tmp_22 = uops_12_is_jal;
      4'b1101:
        casez_tmp_22 = uops_13_is_jal;
      4'b1110:
        casez_tmp_22 = uops_14_is_jal;
      default:
        casez_tmp_22 = uops_15_is_jal;
    endcase
  end // always @(*)
  reg         casez_tmp_23;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_23 = uops_0_is_sfb;
      4'b0001:
        casez_tmp_23 = uops_1_is_sfb;
      4'b0010:
        casez_tmp_23 = uops_2_is_sfb;
      4'b0011:
        casez_tmp_23 = uops_3_is_sfb;
      4'b0100:
        casez_tmp_23 = uops_4_is_sfb;
      4'b0101:
        casez_tmp_23 = uops_5_is_sfb;
      4'b0110:
        casez_tmp_23 = uops_6_is_sfb;
      4'b0111:
        casez_tmp_23 = uops_7_is_sfb;
      4'b1000:
        casez_tmp_23 = uops_8_is_sfb;
      4'b1001:
        casez_tmp_23 = uops_9_is_sfb;
      4'b1010:
        casez_tmp_23 = uops_10_is_sfb;
      4'b1011:
        casez_tmp_23 = uops_11_is_sfb;
      4'b1100:
        casez_tmp_23 = uops_12_is_sfb;
      4'b1101:
        casez_tmp_23 = uops_13_is_sfb;
      4'b1110:
        casez_tmp_23 = uops_14_is_sfb;
      default:
        casez_tmp_23 = uops_15_is_sfb;
    endcase
  end // always @(*)
  reg  [19:0] casez_tmp_24;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_24 = uops_0_br_mask;
      4'b0001:
        casez_tmp_24 = uops_1_br_mask;
      4'b0010:
        casez_tmp_24 = uops_2_br_mask;
      4'b0011:
        casez_tmp_24 = uops_3_br_mask;
      4'b0100:
        casez_tmp_24 = uops_4_br_mask;
      4'b0101:
        casez_tmp_24 = uops_5_br_mask;
      4'b0110:
        casez_tmp_24 = uops_6_br_mask;
      4'b0111:
        casez_tmp_24 = uops_7_br_mask;
      4'b1000:
        casez_tmp_24 = uops_8_br_mask;
      4'b1001:
        casez_tmp_24 = uops_9_br_mask;
      4'b1010:
        casez_tmp_24 = uops_10_br_mask;
      4'b1011:
        casez_tmp_24 = uops_11_br_mask;
      4'b1100:
        casez_tmp_24 = uops_12_br_mask;
      4'b1101:
        casez_tmp_24 = uops_13_br_mask;
      4'b1110:
        casez_tmp_24 = uops_14_br_mask;
      default:
        casez_tmp_24 = uops_15_br_mask;
    endcase
  end // always @(*)
  reg  [4:0]  casez_tmp_25;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_25 = uops_0_br_tag;
      4'b0001:
        casez_tmp_25 = uops_1_br_tag;
      4'b0010:
        casez_tmp_25 = uops_2_br_tag;
      4'b0011:
        casez_tmp_25 = uops_3_br_tag;
      4'b0100:
        casez_tmp_25 = uops_4_br_tag;
      4'b0101:
        casez_tmp_25 = uops_5_br_tag;
      4'b0110:
        casez_tmp_25 = uops_6_br_tag;
      4'b0111:
        casez_tmp_25 = uops_7_br_tag;
      4'b1000:
        casez_tmp_25 = uops_8_br_tag;
      4'b1001:
        casez_tmp_25 = uops_9_br_tag;
      4'b1010:
        casez_tmp_25 = uops_10_br_tag;
      4'b1011:
        casez_tmp_25 = uops_11_br_tag;
      4'b1100:
        casez_tmp_25 = uops_12_br_tag;
      4'b1101:
        casez_tmp_25 = uops_13_br_tag;
      4'b1110:
        casez_tmp_25 = uops_14_br_tag;
      default:
        casez_tmp_25 = uops_15_br_tag;
    endcase
  end // always @(*)
  reg  [5:0]  casez_tmp_26;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_26 = uops_0_ftq_idx;
      4'b0001:
        casez_tmp_26 = uops_1_ftq_idx;
      4'b0010:
        casez_tmp_26 = uops_2_ftq_idx;
      4'b0011:
        casez_tmp_26 = uops_3_ftq_idx;
      4'b0100:
        casez_tmp_26 = uops_4_ftq_idx;
      4'b0101:
        casez_tmp_26 = uops_5_ftq_idx;
      4'b0110:
        casez_tmp_26 = uops_6_ftq_idx;
      4'b0111:
        casez_tmp_26 = uops_7_ftq_idx;
      4'b1000:
        casez_tmp_26 = uops_8_ftq_idx;
      4'b1001:
        casez_tmp_26 = uops_9_ftq_idx;
      4'b1010:
        casez_tmp_26 = uops_10_ftq_idx;
      4'b1011:
        casez_tmp_26 = uops_11_ftq_idx;
      4'b1100:
        casez_tmp_26 = uops_12_ftq_idx;
      4'b1101:
        casez_tmp_26 = uops_13_ftq_idx;
      4'b1110:
        casez_tmp_26 = uops_14_ftq_idx;
      default:
        casez_tmp_26 = uops_15_ftq_idx;
    endcase
  end // always @(*)
  reg         casez_tmp_27;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_27 = uops_0_edge_inst;
      4'b0001:
        casez_tmp_27 = uops_1_edge_inst;
      4'b0010:
        casez_tmp_27 = uops_2_edge_inst;
      4'b0011:
        casez_tmp_27 = uops_3_edge_inst;
      4'b0100:
        casez_tmp_27 = uops_4_edge_inst;
      4'b0101:
        casez_tmp_27 = uops_5_edge_inst;
      4'b0110:
        casez_tmp_27 = uops_6_edge_inst;
      4'b0111:
        casez_tmp_27 = uops_7_edge_inst;
      4'b1000:
        casez_tmp_27 = uops_8_edge_inst;
      4'b1001:
        casez_tmp_27 = uops_9_edge_inst;
      4'b1010:
        casez_tmp_27 = uops_10_edge_inst;
      4'b1011:
        casez_tmp_27 = uops_11_edge_inst;
      4'b1100:
        casez_tmp_27 = uops_12_edge_inst;
      4'b1101:
        casez_tmp_27 = uops_13_edge_inst;
      4'b1110:
        casez_tmp_27 = uops_14_edge_inst;
      default:
        casez_tmp_27 = uops_15_edge_inst;
    endcase
  end // always @(*)
  reg  [5:0]  casez_tmp_28;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_28 = uops_0_pc_lob;
      4'b0001:
        casez_tmp_28 = uops_1_pc_lob;
      4'b0010:
        casez_tmp_28 = uops_2_pc_lob;
      4'b0011:
        casez_tmp_28 = uops_3_pc_lob;
      4'b0100:
        casez_tmp_28 = uops_4_pc_lob;
      4'b0101:
        casez_tmp_28 = uops_5_pc_lob;
      4'b0110:
        casez_tmp_28 = uops_6_pc_lob;
      4'b0111:
        casez_tmp_28 = uops_7_pc_lob;
      4'b1000:
        casez_tmp_28 = uops_8_pc_lob;
      4'b1001:
        casez_tmp_28 = uops_9_pc_lob;
      4'b1010:
        casez_tmp_28 = uops_10_pc_lob;
      4'b1011:
        casez_tmp_28 = uops_11_pc_lob;
      4'b1100:
        casez_tmp_28 = uops_12_pc_lob;
      4'b1101:
        casez_tmp_28 = uops_13_pc_lob;
      4'b1110:
        casez_tmp_28 = uops_14_pc_lob;
      default:
        casez_tmp_28 = uops_15_pc_lob;
    endcase
  end // always @(*)
  reg         casez_tmp_29;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_29 = uops_0_taken;
      4'b0001:
        casez_tmp_29 = uops_1_taken;
      4'b0010:
        casez_tmp_29 = uops_2_taken;
      4'b0011:
        casez_tmp_29 = uops_3_taken;
      4'b0100:
        casez_tmp_29 = uops_4_taken;
      4'b0101:
        casez_tmp_29 = uops_5_taken;
      4'b0110:
        casez_tmp_29 = uops_6_taken;
      4'b0111:
        casez_tmp_29 = uops_7_taken;
      4'b1000:
        casez_tmp_29 = uops_8_taken;
      4'b1001:
        casez_tmp_29 = uops_9_taken;
      4'b1010:
        casez_tmp_29 = uops_10_taken;
      4'b1011:
        casez_tmp_29 = uops_11_taken;
      4'b1100:
        casez_tmp_29 = uops_12_taken;
      4'b1101:
        casez_tmp_29 = uops_13_taken;
      4'b1110:
        casez_tmp_29 = uops_14_taken;
      default:
        casez_tmp_29 = uops_15_taken;
    endcase
  end // always @(*)
  reg  [19:0] casez_tmp_30;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_30 = uops_0_imm_packed;
      4'b0001:
        casez_tmp_30 = uops_1_imm_packed;
      4'b0010:
        casez_tmp_30 = uops_2_imm_packed;
      4'b0011:
        casez_tmp_30 = uops_3_imm_packed;
      4'b0100:
        casez_tmp_30 = uops_4_imm_packed;
      4'b0101:
        casez_tmp_30 = uops_5_imm_packed;
      4'b0110:
        casez_tmp_30 = uops_6_imm_packed;
      4'b0111:
        casez_tmp_30 = uops_7_imm_packed;
      4'b1000:
        casez_tmp_30 = uops_8_imm_packed;
      4'b1001:
        casez_tmp_30 = uops_9_imm_packed;
      4'b1010:
        casez_tmp_30 = uops_10_imm_packed;
      4'b1011:
        casez_tmp_30 = uops_11_imm_packed;
      4'b1100:
        casez_tmp_30 = uops_12_imm_packed;
      4'b1101:
        casez_tmp_30 = uops_13_imm_packed;
      4'b1110:
        casez_tmp_30 = uops_14_imm_packed;
      default:
        casez_tmp_30 = uops_15_imm_packed;
    endcase
  end // always @(*)
  reg  [11:0] casez_tmp_31;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_31 = uops_0_csr_addr;
      4'b0001:
        casez_tmp_31 = uops_1_csr_addr;
      4'b0010:
        casez_tmp_31 = uops_2_csr_addr;
      4'b0011:
        casez_tmp_31 = uops_3_csr_addr;
      4'b0100:
        casez_tmp_31 = uops_4_csr_addr;
      4'b0101:
        casez_tmp_31 = uops_5_csr_addr;
      4'b0110:
        casez_tmp_31 = uops_6_csr_addr;
      4'b0111:
        casez_tmp_31 = uops_7_csr_addr;
      4'b1000:
        casez_tmp_31 = uops_8_csr_addr;
      4'b1001:
        casez_tmp_31 = uops_9_csr_addr;
      4'b1010:
        casez_tmp_31 = uops_10_csr_addr;
      4'b1011:
        casez_tmp_31 = uops_11_csr_addr;
      4'b1100:
        casez_tmp_31 = uops_12_csr_addr;
      4'b1101:
        casez_tmp_31 = uops_13_csr_addr;
      4'b1110:
        casez_tmp_31 = uops_14_csr_addr;
      default:
        casez_tmp_31 = uops_15_csr_addr;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_32;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_32 = uops_0_rob_idx;
      4'b0001:
        casez_tmp_32 = uops_1_rob_idx;
      4'b0010:
        casez_tmp_32 = uops_2_rob_idx;
      4'b0011:
        casez_tmp_32 = uops_3_rob_idx;
      4'b0100:
        casez_tmp_32 = uops_4_rob_idx;
      4'b0101:
        casez_tmp_32 = uops_5_rob_idx;
      4'b0110:
        casez_tmp_32 = uops_6_rob_idx;
      4'b0111:
        casez_tmp_32 = uops_7_rob_idx;
      4'b1000:
        casez_tmp_32 = uops_8_rob_idx;
      4'b1001:
        casez_tmp_32 = uops_9_rob_idx;
      4'b1010:
        casez_tmp_32 = uops_10_rob_idx;
      4'b1011:
        casez_tmp_32 = uops_11_rob_idx;
      4'b1100:
        casez_tmp_32 = uops_12_rob_idx;
      4'b1101:
        casez_tmp_32 = uops_13_rob_idx;
      4'b1110:
        casez_tmp_32 = uops_14_rob_idx;
      default:
        casez_tmp_32 = uops_15_rob_idx;
    endcase
  end // always @(*)
  reg  [4:0]  casez_tmp_33;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_33 = uops_0_ldq_idx;
      4'b0001:
        casez_tmp_33 = uops_1_ldq_idx;
      4'b0010:
        casez_tmp_33 = uops_2_ldq_idx;
      4'b0011:
        casez_tmp_33 = uops_3_ldq_idx;
      4'b0100:
        casez_tmp_33 = uops_4_ldq_idx;
      4'b0101:
        casez_tmp_33 = uops_5_ldq_idx;
      4'b0110:
        casez_tmp_33 = uops_6_ldq_idx;
      4'b0111:
        casez_tmp_33 = uops_7_ldq_idx;
      4'b1000:
        casez_tmp_33 = uops_8_ldq_idx;
      4'b1001:
        casez_tmp_33 = uops_9_ldq_idx;
      4'b1010:
        casez_tmp_33 = uops_10_ldq_idx;
      4'b1011:
        casez_tmp_33 = uops_11_ldq_idx;
      4'b1100:
        casez_tmp_33 = uops_12_ldq_idx;
      4'b1101:
        casez_tmp_33 = uops_13_ldq_idx;
      4'b1110:
        casez_tmp_33 = uops_14_ldq_idx;
      default:
        casez_tmp_33 = uops_15_ldq_idx;
    endcase
  end // always @(*)
  reg  [4:0]  casez_tmp_34;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_34 = uops_0_stq_idx;
      4'b0001:
        casez_tmp_34 = uops_1_stq_idx;
      4'b0010:
        casez_tmp_34 = uops_2_stq_idx;
      4'b0011:
        casez_tmp_34 = uops_3_stq_idx;
      4'b0100:
        casez_tmp_34 = uops_4_stq_idx;
      4'b0101:
        casez_tmp_34 = uops_5_stq_idx;
      4'b0110:
        casez_tmp_34 = uops_6_stq_idx;
      4'b0111:
        casez_tmp_34 = uops_7_stq_idx;
      4'b1000:
        casez_tmp_34 = uops_8_stq_idx;
      4'b1001:
        casez_tmp_34 = uops_9_stq_idx;
      4'b1010:
        casez_tmp_34 = uops_10_stq_idx;
      4'b1011:
        casez_tmp_34 = uops_11_stq_idx;
      4'b1100:
        casez_tmp_34 = uops_12_stq_idx;
      4'b1101:
        casez_tmp_34 = uops_13_stq_idx;
      4'b1110:
        casez_tmp_34 = uops_14_stq_idx;
      default:
        casez_tmp_34 = uops_15_stq_idx;
    endcase
  end // always @(*)
  reg  [1:0]  casez_tmp_35;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_35 = uops_0_rxq_idx;
      4'b0001:
        casez_tmp_35 = uops_1_rxq_idx;
      4'b0010:
        casez_tmp_35 = uops_2_rxq_idx;
      4'b0011:
        casez_tmp_35 = uops_3_rxq_idx;
      4'b0100:
        casez_tmp_35 = uops_4_rxq_idx;
      4'b0101:
        casez_tmp_35 = uops_5_rxq_idx;
      4'b0110:
        casez_tmp_35 = uops_6_rxq_idx;
      4'b0111:
        casez_tmp_35 = uops_7_rxq_idx;
      4'b1000:
        casez_tmp_35 = uops_8_rxq_idx;
      4'b1001:
        casez_tmp_35 = uops_9_rxq_idx;
      4'b1010:
        casez_tmp_35 = uops_10_rxq_idx;
      4'b1011:
        casez_tmp_35 = uops_11_rxq_idx;
      4'b1100:
        casez_tmp_35 = uops_12_rxq_idx;
      4'b1101:
        casez_tmp_35 = uops_13_rxq_idx;
      4'b1110:
        casez_tmp_35 = uops_14_rxq_idx;
      default:
        casez_tmp_35 = uops_15_rxq_idx;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_36;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_36 = uops_0_pdst;
      4'b0001:
        casez_tmp_36 = uops_1_pdst;
      4'b0010:
        casez_tmp_36 = uops_2_pdst;
      4'b0011:
        casez_tmp_36 = uops_3_pdst;
      4'b0100:
        casez_tmp_36 = uops_4_pdst;
      4'b0101:
        casez_tmp_36 = uops_5_pdst;
      4'b0110:
        casez_tmp_36 = uops_6_pdst;
      4'b0111:
        casez_tmp_36 = uops_7_pdst;
      4'b1000:
        casez_tmp_36 = uops_8_pdst;
      4'b1001:
        casez_tmp_36 = uops_9_pdst;
      4'b1010:
        casez_tmp_36 = uops_10_pdst;
      4'b1011:
        casez_tmp_36 = uops_11_pdst;
      4'b1100:
        casez_tmp_36 = uops_12_pdst;
      4'b1101:
        casez_tmp_36 = uops_13_pdst;
      4'b1110:
        casez_tmp_36 = uops_14_pdst;
      default:
        casez_tmp_36 = uops_15_pdst;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_37;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_37 = uops_0_prs1;
      4'b0001:
        casez_tmp_37 = uops_1_prs1;
      4'b0010:
        casez_tmp_37 = uops_2_prs1;
      4'b0011:
        casez_tmp_37 = uops_3_prs1;
      4'b0100:
        casez_tmp_37 = uops_4_prs1;
      4'b0101:
        casez_tmp_37 = uops_5_prs1;
      4'b0110:
        casez_tmp_37 = uops_6_prs1;
      4'b0111:
        casez_tmp_37 = uops_7_prs1;
      4'b1000:
        casez_tmp_37 = uops_8_prs1;
      4'b1001:
        casez_tmp_37 = uops_9_prs1;
      4'b1010:
        casez_tmp_37 = uops_10_prs1;
      4'b1011:
        casez_tmp_37 = uops_11_prs1;
      4'b1100:
        casez_tmp_37 = uops_12_prs1;
      4'b1101:
        casez_tmp_37 = uops_13_prs1;
      4'b1110:
        casez_tmp_37 = uops_14_prs1;
      default:
        casez_tmp_37 = uops_15_prs1;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_38;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_38 = uops_0_prs2;
      4'b0001:
        casez_tmp_38 = uops_1_prs2;
      4'b0010:
        casez_tmp_38 = uops_2_prs2;
      4'b0011:
        casez_tmp_38 = uops_3_prs2;
      4'b0100:
        casez_tmp_38 = uops_4_prs2;
      4'b0101:
        casez_tmp_38 = uops_5_prs2;
      4'b0110:
        casez_tmp_38 = uops_6_prs2;
      4'b0111:
        casez_tmp_38 = uops_7_prs2;
      4'b1000:
        casez_tmp_38 = uops_8_prs2;
      4'b1001:
        casez_tmp_38 = uops_9_prs2;
      4'b1010:
        casez_tmp_38 = uops_10_prs2;
      4'b1011:
        casez_tmp_38 = uops_11_prs2;
      4'b1100:
        casez_tmp_38 = uops_12_prs2;
      4'b1101:
        casez_tmp_38 = uops_13_prs2;
      4'b1110:
        casez_tmp_38 = uops_14_prs2;
      default:
        casez_tmp_38 = uops_15_prs2;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_39;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_39 = uops_0_prs3;
      4'b0001:
        casez_tmp_39 = uops_1_prs3;
      4'b0010:
        casez_tmp_39 = uops_2_prs3;
      4'b0011:
        casez_tmp_39 = uops_3_prs3;
      4'b0100:
        casez_tmp_39 = uops_4_prs3;
      4'b0101:
        casez_tmp_39 = uops_5_prs3;
      4'b0110:
        casez_tmp_39 = uops_6_prs3;
      4'b0111:
        casez_tmp_39 = uops_7_prs3;
      4'b1000:
        casez_tmp_39 = uops_8_prs3;
      4'b1001:
        casez_tmp_39 = uops_9_prs3;
      4'b1010:
        casez_tmp_39 = uops_10_prs3;
      4'b1011:
        casez_tmp_39 = uops_11_prs3;
      4'b1100:
        casez_tmp_39 = uops_12_prs3;
      4'b1101:
        casez_tmp_39 = uops_13_prs3;
      4'b1110:
        casez_tmp_39 = uops_14_prs3;
      default:
        casez_tmp_39 = uops_15_prs3;
    endcase
  end // always @(*)
  reg  [5:0]  casez_tmp_40;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_40 = uops_0_ppred;
      4'b0001:
        casez_tmp_40 = uops_1_ppred;
      4'b0010:
        casez_tmp_40 = uops_2_ppred;
      4'b0011:
        casez_tmp_40 = uops_3_ppred;
      4'b0100:
        casez_tmp_40 = uops_4_ppred;
      4'b0101:
        casez_tmp_40 = uops_5_ppred;
      4'b0110:
        casez_tmp_40 = uops_6_ppred;
      4'b0111:
        casez_tmp_40 = uops_7_ppred;
      4'b1000:
        casez_tmp_40 = uops_8_ppred;
      4'b1001:
        casez_tmp_40 = uops_9_ppred;
      4'b1010:
        casez_tmp_40 = uops_10_ppred;
      4'b1011:
        casez_tmp_40 = uops_11_ppred;
      4'b1100:
        casez_tmp_40 = uops_12_ppred;
      4'b1101:
        casez_tmp_40 = uops_13_ppred;
      4'b1110:
        casez_tmp_40 = uops_14_ppred;
      default:
        casez_tmp_40 = uops_15_ppred;
    endcase
  end // always @(*)
  reg         casez_tmp_41;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_41 = uops_0_prs1_busy;
      4'b0001:
        casez_tmp_41 = uops_1_prs1_busy;
      4'b0010:
        casez_tmp_41 = uops_2_prs1_busy;
      4'b0011:
        casez_tmp_41 = uops_3_prs1_busy;
      4'b0100:
        casez_tmp_41 = uops_4_prs1_busy;
      4'b0101:
        casez_tmp_41 = uops_5_prs1_busy;
      4'b0110:
        casez_tmp_41 = uops_6_prs1_busy;
      4'b0111:
        casez_tmp_41 = uops_7_prs1_busy;
      4'b1000:
        casez_tmp_41 = uops_8_prs1_busy;
      4'b1001:
        casez_tmp_41 = uops_9_prs1_busy;
      4'b1010:
        casez_tmp_41 = uops_10_prs1_busy;
      4'b1011:
        casez_tmp_41 = uops_11_prs1_busy;
      4'b1100:
        casez_tmp_41 = uops_12_prs1_busy;
      4'b1101:
        casez_tmp_41 = uops_13_prs1_busy;
      4'b1110:
        casez_tmp_41 = uops_14_prs1_busy;
      default:
        casez_tmp_41 = uops_15_prs1_busy;
    endcase
  end // always @(*)
  reg         casez_tmp_42;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_42 = uops_0_prs2_busy;
      4'b0001:
        casez_tmp_42 = uops_1_prs2_busy;
      4'b0010:
        casez_tmp_42 = uops_2_prs2_busy;
      4'b0011:
        casez_tmp_42 = uops_3_prs2_busy;
      4'b0100:
        casez_tmp_42 = uops_4_prs2_busy;
      4'b0101:
        casez_tmp_42 = uops_5_prs2_busy;
      4'b0110:
        casez_tmp_42 = uops_6_prs2_busy;
      4'b0111:
        casez_tmp_42 = uops_7_prs2_busy;
      4'b1000:
        casez_tmp_42 = uops_8_prs2_busy;
      4'b1001:
        casez_tmp_42 = uops_9_prs2_busy;
      4'b1010:
        casez_tmp_42 = uops_10_prs2_busy;
      4'b1011:
        casez_tmp_42 = uops_11_prs2_busy;
      4'b1100:
        casez_tmp_42 = uops_12_prs2_busy;
      4'b1101:
        casez_tmp_42 = uops_13_prs2_busy;
      4'b1110:
        casez_tmp_42 = uops_14_prs2_busy;
      default:
        casez_tmp_42 = uops_15_prs2_busy;
    endcase
  end // always @(*)
  reg         casez_tmp_43;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_43 = uops_0_prs3_busy;
      4'b0001:
        casez_tmp_43 = uops_1_prs3_busy;
      4'b0010:
        casez_tmp_43 = uops_2_prs3_busy;
      4'b0011:
        casez_tmp_43 = uops_3_prs3_busy;
      4'b0100:
        casez_tmp_43 = uops_4_prs3_busy;
      4'b0101:
        casez_tmp_43 = uops_5_prs3_busy;
      4'b0110:
        casez_tmp_43 = uops_6_prs3_busy;
      4'b0111:
        casez_tmp_43 = uops_7_prs3_busy;
      4'b1000:
        casez_tmp_43 = uops_8_prs3_busy;
      4'b1001:
        casez_tmp_43 = uops_9_prs3_busy;
      4'b1010:
        casez_tmp_43 = uops_10_prs3_busy;
      4'b1011:
        casez_tmp_43 = uops_11_prs3_busy;
      4'b1100:
        casez_tmp_43 = uops_12_prs3_busy;
      4'b1101:
        casez_tmp_43 = uops_13_prs3_busy;
      4'b1110:
        casez_tmp_43 = uops_14_prs3_busy;
      default:
        casez_tmp_43 = uops_15_prs3_busy;
    endcase
  end // always @(*)
  reg         casez_tmp_44;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_44 = uops_0_ppred_busy;
      4'b0001:
        casez_tmp_44 = uops_1_ppred_busy;
      4'b0010:
        casez_tmp_44 = uops_2_ppred_busy;
      4'b0011:
        casez_tmp_44 = uops_3_ppred_busy;
      4'b0100:
        casez_tmp_44 = uops_4_ppred_busy;
      4'b0101:
        casez_tmp_44 = uops_5_ppred_busy;
      4'b0110:
        casez_tmp_44 = uops_6_ppred_busy;
      4'b0111:
        casez_tmp_44 = uops_7_ppred_busy;
      4'b1000:
        casez_tmp_44 = uops_8_ppred_busy;
      4'b1001:
        casez_tmp_44 = uops_9_ppred_busy;
      4'b1010:
        casez_tmp_44 = uops_10_ppred_busy;
      4'b1011:
        casez_tmp_44 = uops_11_ppred_busy;
      4'b1100:
        casez_tmp_44 = uops_12_ppred_busy;
      4'b1101:
        casez_tmp_44 = uops_13_ppred_busy;
      4'b1110:
        casez_tmp_44 = uops_14_ppred_busy;
      default:
        casez_tmp_44 = uops_15_ppred_busy;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_45;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_45 = uops_0_stale_pdst;
      4'b0001:
        casez_tmp_45 = uops_1_stale_pdst;
      4'b0010:
        casez_tmp_45 = uops_2_stale_pdst;
      4'b0011:
        casez_tmp_45 = uops_3_stale_pdst;
      4'b0100:
        casez_tmp_45 = uops_4_stale_pdst;
      4'b0101:
        casez_tmp_45 = uops_5_stale_pdst;
      4'b0110:
        casez_tmp_45 = uops_6_stale_pdst;
      4'b0111:
        casez_tmp_45 = uops_7_stale_pdst;
      4'b1000:
        casez_tmp_45 = uops_8_stale_pdst;
      4'b1001:
        casez_tmp_45 = uops_9_stale_pdst;
      4'b1010:
        casez_tmp_45 = uops_10_stale_pdst;
      4'b1011:
        casez_tmp_45 = uops_11_stale_pdst;
      4'b1100:
        casez_tmp_45 = uops_12_stale_pdst;
      4'b1101:
        casez_tmp_45 = uops_13_stale_pdst;
      4'b1110:
        casez_tmp_45 = uops_14_stale_pdst;
      default:
        casez_tmp_45 = uops_15_stale_pdst;
    endcase
  end // always @(*)
  reg         casez_tmp_46;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_46 = uops_0_exception;
      4'b0001:
        casez_tmp_46 = uops_1_exception;
      4'b0010:
        casez_tmp_46 = uops_2_exception;
      4'b0011:
        casez_tmp_46 = uops_3_exception;
      4'b0100:
        casez_tmp_46 = uops_4_exception;
      4'b0101:
        casez_tmp_46 = uops_5_exception;
      4'b0110:
        casez_tmp_46 = uops_6_exception;
      4'b0111:
        casez_tmp_46 = uops_7_exception;
      4'b1000:
        casez_tmp_46 = uops_8_exception;
      4'b1001:
        casez_tmp_46 = uops_9_exception;
      4'b1010:
        casez_tmp_46 = uops_10_exception;
      4'b1011:
        casez_tmp_46 = uops_11_exception;
      4'b1100:
        casez_tmp_46 = uops_12_exception;
      4'b1101:
        casez_tmp_46 = uops_13_exception;
      4'b1110:
        casez_tmp_46 = uops_14_exception;
      default:
        casez_tmp_46 = uops_15_exception;
    endcase
  end // always @(*)
  reg  [63:0] casez_tmp_47;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_47 = uops_0_exc_cause;
      4'b0001:
        casez_tmp_47 = uops_1_exc_cause;
      4'b0010:
        casez_tmp_47 = uops_2_exc_cause;
      4'b0011:
        casez_tmp_47 = uops_3_exc_cause;
      4'b0100:
        casez_tmp_47 = uops_4_exc_cause;
      4'b0101:
        casez_tmp_47 = uops_5_exc_cause;
      4'b0110:
        casez_tmp_47 = uops_6_exc_cause;
      4'b0111:
        casez_tmp_47 = uops_7_exc_cause;
      4'b1000:
        casez_tmp_47 = uops_8_exc_cause;
      4'b1001:
        casez_tmp_47 = uops_9_exc_cause;
      4'b1010:
        casez_tmp_47 = uops_10_exc_cause;
      4'b1011:
        casez_tmp_47 = uops_11_exc_cause;
      4'b1100:
        casez_tmp_47 = uops_12_exc_cause;
      4'b1101:
        casez_tmp_47 = uops_13_exc_cause;
      4'b1110:
        casez_tmp_47 = uops_14_exc_cause;
      default:
        casez_tmp_47 = uops_15_exc_cause;
    endcase
  end // always @(*)
  reg         casez_tmp_48;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_48 = uops_0_bypassable;
      4'b0001:
        casez_tmp_48 = uops_1_bypassable;
      4'b0010:
        casez_tmp_48 = uops_2_bypassable;
      4'b0011:
        casez_tmp_48 = uops_3_bypassable;
      4'b0100:
        casez_tmp_48 = uops_4_bypassable;
      4'b0101:
        casez_tmp_48 = uops_5_bypassable;
      4'b0110:
        casez_tmp_48 = uops_6_bypassable;
      4'b0111:
        casez_tmp_48 = uops_7_bypassable;
      4'b1000:
        casez_tmp_48 = uops_8_bypassable;
      4'b1001:
        casez_tmp_48 = uops_9_bypassable;
      4'b1010:
        casez_tmp_48 = uops_10_bypassable;
      4'b1011:
        casez_tmp_48 = uops_11_bypassable;
      4'b1100:
        casez_tmp_48 = uops_12_bypassable;
      4'b1101:
        casez_tmp_48 = uops_13_bypassable;
      4'b1110:
        casez_tmp_48 = uops_14_bypassable;
      default:
        casez_tmp_48 = uops_15_bypassable;
    endcase
  end // always @(*)
  reg  [4:0]  casez_tmp_49;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_49 = uops_0_mem_cmd;
      4'b0001:
        casez_tmp_49 = uops_1_mem_cmd;
      4'b0010:
        casez_tmp_49 = uops_2_mem_cmd;
      4'b0011:
        casez_tmp_49 = uops_3_mem_cmd;
      4'b0100:
        casez_tmp_49 = uops_4_mem_cmd;
      4'b0101:
        casez_tmp_49 = uops_5_mem_cmd;
      4'b0110:
        casez_tmp_49 = uops_6_mem_cmd;
      4'b0111:
        casez_tmp_49 = uops_7_mem_cmd;
      4'b1000:
        casez_tmp_49 = uops_8_mem_cmd;
      4'b1001:
        casez_tmp_49 = uops_9_mem_cmd;
      4'b1010:
        casez_tmp_49 = uops_10_mem_cmd;
      4'b1011:
        casez_tmp_49 = uops_11_mem_cmd;
      4'b1100:
        casez_tmp_49 = uops_12_mem_cmd;
      4'b1101:
        casez_tmp_49 = uops_13_mem_cmd;
      4'b1110:
        casez_tmp_49 = uops_14_mem_cmd;
      default:
        casez_tmp_49 = uops_15_mem_cmd;
    endcase
  end // always @(*)
  reg  [1:0]  casez_tmp_50;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_50 = uops_0_mem_size;
      4'b0001:
        casez_tmp_50 = uops_1_mem_size;
      4'b0010:
        casez_tmp_50 = uops_2_mem_size;
      4'b0011:
        casez_tmp_50 = uops_3_mem_size;
      4'b0100:
        casez_tmp_50 = uops_4_mem_size;
      4'b0101:
        casez_tmp_50 = uops_5_mem_size;
      4'b0110:
        casez_tmp_50 = uops_6_mem_size;
      4'b0111:
        casez_tmp_50 = uops_7_mem_size;
      4'b1000:
        casez_tmp_50 = uops_8_mem_size;
      4'b1001:
        casez_tmp_50 = uops_9_mem_size;
      4'b1010:
        casez_tmp_50 = uops_10_mem_size;
      4'b1011:
        casez_tmp_50 = uops_11_mem_size;
      4'b1100:
        casez_tmp_50 = uops_12_mem_size;
      4'b1101:
        casez_tmp_50 = uops_13_mem_size;
      4'b1110:
        casez_tmp_50 = uops_14_mem_size;
      default:
        casez_tmp_50 = uops_15_mem_size;
    endcase
  end // always @(*)
  reg         casez_tmp_51;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_51 = uops_0_mem_signed;
      4'b0001:
        casez_tmp_51 = uops_1_mem_signed;
      4'b0010:
        casez_tmp_51 = uops_2_mem_signed;
      4'b0011:
        casez_tmp_51 = uops_3_mem_signed;
      4'b0100:
        casez_tmp_51 = uops_4_mem_signed;
      4'b0101:
        casez_tmp_51 = uops_5_mem_signed;
      4'b0110:
        casez_tmp_51 = uops_6_mem_signed;
      4'b0111:
        casez_tmp_51 = uops_7_mem_signed;
      4'b1000:
        casez_tmp_51 = uops_8_mem_signed;
      4'b1001:
        casez_tmp_51 = uops_9_mem_signed;
      4'b1010:
        casez_tmp_51 = uops_10_mem_signed;
      4'b1011:
        casez_tmp_51 = uops_11_mem_signed;
      4'b1100:
        casez_tmp_51 = uops_12_mem_signed;
      4'b1101:
        casez_tmp_51 = uops_13_mem_signed;
      4'b1110:
        casez_tmp_51 = uops_14_mem_signed;
      default:
        casez_tmp_51 = uops_15_mem_signed;
    endcase
  end // always @(*)
  reg         casez_tmp_52;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_52 = uops_0_is_fence;
      4'b0001:
        casez_tmp_52 = uops_1_is_fence;
      4'b0010:
        casez_tmp_52 = uops_2_is_fence;
      4'b0011:
        casez_tmp_52 = uops_3_is_fence;
      4'b0100:
        casez_tmp_52 = uops_4_is_fence;
      4'b0101:
        casez_tmp_52 = uops_5_is_fence;
      4'b0110:
        casez_tmp_52 = uops_6_is_fence;
      4'b0111:
        casez_tmp_52 = uops_7_is_fence;
      4'b1000:
        casez_tmp_52 = uops_8_is_fence;
      4'b1001:
        casez_tmp_52 = uops_9_is_fence;
      4'b1010:
        casez_tmp_52 = uops_10_is_fence;
      4'b1011:
        casez_tmp_52 = uops_11_is_fence;
      4'b1100:
        casez_tmp_52 = uops_12_is_fence;
      4'b1101:
        casez_tmp_52 = uops_13_is_fence;
      4'b1110:
        casez_tmp_52 = uops_14_is_fence;
      default:
        casez_tmp_52 = uops_15_is_fence;
    endcase
  end // always @(*)
  reg         casez_tmp_53;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_53 = uops_0_is_fencei;
      4'b0001:
        casez_tmp_53 = uops_1_is_fencei;
      4'b0010:
        casez_tmp_53 = uops_2_is_fencei;
      4'b0011:
        casez_tmp_53 = uops_3_is_fencei;
      4'b0100:
        casez_tmp_53 = uops_4_is_fencei;
      4'b0101:
        casez_tmp_53 = uops_5_is_fencei;
      4'b0110:
        casez_tmp_53 = uops_6_is_fencei;
      4'b0111:
        casez_tmp_53 = uops_7_is_fencei;
      4'b1000:
        casez_tmp_53 = uops_8_is_fencei;
      4'b1001:
        casez_tmp_53 = uops_9_is_fencei;
      4'b1010:
        casez_tmp_53 = uops_10_is_fencei;
      4'b1011:
        casez_tmp_53 = uops_11_is_fencei;
      4'b1100:
        casez_tmp_53 = uops_12_is_fencei;
      4'b1101:
        casez_tmp_53 = uops_13_is_fencei;
      4'b1110:
        casez_tmp_53 = uops_14_is_fencei;
      default:
        casez_tmp_53 = uops_15_is_fencei;
    endcase
  end // always @(*)
  reg         casez_tmp_54;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_54 = uops_0_is_amo;
      4'b0001:
        casez_tmp_54 = uops_1_is_amo;
      4'b0010:
        casez_tmp_54 = uops_2_is_amo;
      4'b0011:
        casez_tmp_54 = uops_3_is_amo;
      4'b0100:
        casez_tmp_54 = uops_4_is_amo;
      4'b0101:
        casez_tmp_54 = uops_5_is_amo;
      4'b0110:
        casez_tmp_54 = uops_6_is_amo;
      4'b0111:
        casez_tmp_54 = uops_7_is_amo;
      4'b1000:
        casez_tmp_54 = uops_8_is_amo;
      4'b1001:
        casez_tmp_54 = uops_9_is_amo;
      4'b1010:
        casez_tmp_54 = uops_10_is_amo;
      4'b1011:
        casez_tmp_54 = uops_11_is_amo;
      4'b1100:
        casez_tmp_54 = uops_12_is_amo;
      4'b1101:
        casez_tmp_54 = uops_13_is_amo;
      4'b1110:
        casez_tmp_54 = uops_14_is_amo;
      default:
        casez_tmp_54 = uops_15_is_amo;
    endcase
  end // always @(*)
  reg         casez_tmp_55;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_55 = uops_0_uses_ldq;
      4'b0001:
        casez_tmp_55 = uops_1_uses_ldq;
      4'b0010:
        casez_tmp_55 = uops_2_uses_ldq;
      4'b0011:
        casez_tmp_55 = uops_3_uses_ldq;
      4'b0100:
        casez_tmp_55 = uops_4_uses_ldq;
      4'b0101:
        casez_tmp_55 = uops_5_uses_ldq;
      4'b0110:
        casez_tmp_55 = uops_6_uses_ldq;
      4'b0111:
        casez_tmp_55 = uops_7_uses_ldq;
      4'b1000:
        casez_tmp_55 = uops_8_uses_ldq;
      4'b1001:
        casez_tmp_55 = uops_9_uses_ldq;
      4'b1010:
        casez_tmp_55 = uops_10_uses_ldq;
      4'b1011:
        casez_tmp_55 = uops_11_uses_ldq;
      4'b1100:
        casez_tmp_55 = uops_12_uses_ldq;
      4'b1101:
        casez_tmp_55 = uops_13_uses_ldq;
      4'b1110:
        casez_tmp_55 = uops_14_uses_ldq;
      default:
        casez_tmp_55 = uops_15_uses_ldq;
    endcase
  end // always @(*)
  reg         casez_tmp_56;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_56 = uops_0_uses_stq;
      4'b0001:
        casez_tmp_56 = uops_1_uses_stq;
      4'b0010:
        casez_tmp_56 = uops_2_uses_stq;
      4'b0011:
        casez_tmp_56 = uops_3_uses_stq;
      4'b0100:
        casez_tmp_56 = uops_4_uses_stq;
      4'b0101:
        casez_tmp_56 = uops_5_uses_stq;
      4'b0110:
        casez_tmp_56 = uops_6_uses_stq;
      4'b0111:
        casez_tmp_56 = uops_7_uses_stq;
      4'b1000:
        casez_tmp_56 = uops_8_uses_stq;
      4'b1001:
        casez_tmp_56 = uops_9_uses_stq;
      4'b1010:
        casez_tmp_56 = uops_10_uses_stq;
      4'b1011:
        casez_tmp_56 = uops_11_uses_stq;
      4'b1100:
        casez_tmp_56 = uops_12_uses_stq;
      4'b1101:
        casez_tmp_56 = uops_13_uses_stq;
      4'b1110:
        casez_tmp_56 = uops_14_uses_stq;
      default:
        casez_tmp_56 = uops_15_uses_stq;
    endcase
  end // always @(*)
  reg         casez_tmp_57;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_57 = uops_0_is_sys_pc2epc;
      4'b0001:
        casez_tmp_57 = uops_1_is_sys_pc2epc;
      4'b0010:
        casez_tmp_57 = uops_2_is_sys_pc2epc;
      4'b0011:
        casez_tmp_57 = uops_3_is_sys_pc2epc;
      4'b0100:
        casez_tmp_57 = uops_4_is_sys_pc2epc;
      4'b0101:
        casez_tmp_57 = uops_5_is_sys_pc2epc;
      4'b0110:
        casez_tmp_57 = uops_6_is_sys_pc2epc;
      4'b0111:
        casez_tmp_57 = uops_7_is_sys_pc2epc;
      4'b1000:
        casez_tmp_57 = uops_8_is_sys_pc2epc;
      4'b1001:
        casez_tmp_57 = uops_9_is_sys_pc2epc;
      4'b1010:
        casez_tmp_57 = uops_10_is_sys_pc2epc;
      4'b1011:
        casez_tmp_57 = uops_11_is_sys_pc2epc;
      4'b1100:
        casez_tmp_57 = uops_12_is_sys_pc2epc;
      4'b1101:
        casez_tmp_57 = uops_13_is_sys_pc2epc;
      4'b1110:
        casez_tmp_57 = uops_14_is_sys_pc2epc;
      default:
        casez_tmp_57 = uops_15_is_sys_pc2epc;
    endcase
  end // always @(*)
  reg         casez_tmp_58;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_58 = uops_0_is_unique;
      4'b0001:
        casez_tmp_58 = uops_1_is_unique;
      4'b0010:
        casez_tmp_58 = uops_2_is_unique;
      4'b0011:
        casez_tmp_58 = uops_3_is_unique;
      4'b0100:
        casez_tmp_58 = uops_4_is_unique;
      4'b0101:
        casez_tmp_58 = uops_5_is_unique;
      4'b0110:
        casez_tmp_58 = uops_6_is_unique;
      4'b0111:
        casez_tmp_58 = uops_7_is_unique;
      4'b1000:
        casez_tmp_58 = uops_8_is_unique;
      4'b1001:
        casez_tmp_58 = uops_9_is_unique;
      4'b1010:
        casez_tmp_58 = uops_10_is_unique;
      4'b1011:
        casez_tmp_58 = uops_11_is_unique;
      4'b1100:
        casez_tmp_58 = uops_12_is_unique;
      4'b1101:
        casez_tmp_58 = uops_13_is_unique;
      4'b1110:
        casez_tmp_58 = uops_14_is_unique;
      default:
        casez_tmp_58 = uops_15_is_unique;
    endcase
  end // always @(*)
  reg         casez_tmp_59;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_59 = uops_0_flush_on_commit;
      4'b0001:
        casez_tmp_59 = uops_1_flush_on_commit;
      4'b0010:
        casez_tmp_59 = uops_2_flush_on_commit;
      4'b0011:
        casez_tmp_59 = uops_3_flush_on_commit;
      4'b0100:
        casez_tmp_59 = uops_4_flush_on_commit;
      4'b0101:
        casez_tmp_59 = uops_5_flush_on_commit;
      4'b0110:
        casez_tmp_59 = uops_6_flush_on_commit;
      4'b0111:
        casez_tmp_59 = uops_7_flush_on_commit;
      4'b1000:
        casez_tmp_59 = uops_8_flush_on_commit;
      4'b1001:
        casez_tmp_59 = uops_9_flush_on_commit;
      4'b1010:
        casez_tmp_59 = uops_10_flush_on_commit;
      4'b1011:
        casez_tmp_59 = uops_11_flush_on_commit;
      4'b1100:
        casez_tmp_59 = uops_12_flush_on_commit;
      4'b1101:
        casez_tmp_59 = uops_13_flush_on_commit;
      4'b1110:
        casez_tmp_59 = uops_14_flush_on_commit;
      default:
        casez_tmp_59 = uops_15_flush_on_commit;
    endcase
  end // always @(*)
  reg         casez_tmp_60;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_60 = uops_0_ldst_is_rs1;
      4'b0001:
        casez_tmp_60 = uops_1_ldst_is_rs1;
      4'b0010:
        casez_tmp_60 = uops_2_ldst_is_rs1;
      4'b0011:
        casez_tmp_60 = uops_3_ldst_is_rs1;
      4'b0100:
        casez_tmp_60 = uops_4_ldst_is_rs1;
      4'b0101:
        casez_tmp_60 = uops_5_ldst_is_rs1;
      4'b0110:
        casez_tmp_60 = uops_6_ldst_is_rs1;
      4'b0111:
        casez_tmp_60 = uops_7_ldst_is_rs1;
      4'b1000:
        casez_tmp_60 = uops_8_ldst_is_rs1;
      4'b1001:
        casez_tmp_60 = uops_9_ldst_is_rs1;
      4'b1010:
        casez_tmp_60 = uops_10_ldst_is_rs1;
      4'b1011:
        casez_tmp_60 = uops_11_ldst_is_rs1;
      4'b1100:
        casez_tmp_60 = uops_12_ldst_is_rs1;
      4'b1101:
        casez_tmp_60 = uops_13_ldst_is_rs1;
      4'b1110:
        casez_tmp_60 = uops_14_ldst_is_rs1;
      default:
        casez_tmp_60 = uops_15_ldst_is_rs1;
    endcase
  end // always @(*)
  reg  [5:0]  casez_tmp_61;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_61 = uops_0_ldst;
      4'b0001:
        casez_tmp_61 = uops_1_ldst;
      4'b0010:
        casez_tmp_61 = uops_2_ldst;
      4'b0011:
        casez_tmp_61 = uops_3_ldst;
      4'b0100:
        casez_tmp_61 = uops_4_ldst;
      4'b0101:
        casez_tmp_61 = uops_5_ldst;
      4'b0110:
        casez_tmp_61 = uops_6_ldst;
      4'b0111:
        casez_tmp_61 = uops_7_ldst;
      4'b1000:
        casez_tmp_61 = uops_8_ldst;
      4'b1001:
        casez_tmp_61 = uops_9_ldst;
      4'b1010:
        casez_tmp_61 = uops_10_ldst;
      4'b1011:
        casez_tmp_61 = uops_11_ldst;
      4'b1100:
        casez_tmp_61 = uops_12_ldst;
      4'b1101:
        casez_tmp_61 = uops_13_ldst;
      4'b1110:
        casez_tmp_61 = uops_14_ldst;
      default:
        casez_tmp_61 = uops_15_ldst;
    endcase
  end // always @(*)
  reg  [5:0]  casez_tmp_62;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_62 = uops_0_lrs1;
      4'b0001:
        casez_tmp_62 = uops_1_lrs1;
      4'b0010:
        casez_tmp_62 = uops_2_lrs1;
      4'b0011:
        casez_tmp_62 = uops_3_lrs1;
      4'b0100:
        casez_tmp_62 = uops_4_lrs1;
      4'b0101:
        casez_tmp_62 = uops_5_lrs1;
      4'b0110:
        casez_tmp_62 = uops_6_lrs1;
      4'b0111:
        casez_tmp_62 = uops_7_lrs1;
      4'b1000:
        casez_tmp_62 = uops_8_lrs1;
      4'b1001:
        casez_tmp_62 = uops_9_lrs1;
      4'b1010:
        casez_tmp_62 = uops_10_lrs1;
      4'b1011:
        casez_tmp_62 = uops_11_lrs1;
      4'b1100:
        casez_tmp_62 = uops_12_lrs1;
      4'b1101:
        casez_tmp_62 = uops_13_lrs1;
      4'b1110:
        casez_tmp_62 = uops_14_lrs1;
      default:
        casez_tmp_62 = uops_15_lrs1;
    endcase
  end // always @(*)
  reg  [5:0]  casez_tmp_63;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_63 = uops_0_lrs2;
      4'b0001:
        casez_tmp_63 = uops_1_lrs2;
      4'b0010:
        casez_tmp_63 = uops_2_lrs2;
      4'b0011:
        casez_tmp_63 = uops_3_lrs2;
      4'b0100:
        casez_tmp_63 = uops_4_lrs2;
      4'b0101:
        casez_tmp_63 = uops_5_lrs2;
      4'b0110:
        casez_tmp_63 = uops_6_lrs2;
      4'b0111:
        casez_tmp_63 = uops_7_lrs2;
      4'b1000:
        casez_tmp_63 = uops_8_lrs2;
      4'b1001:
        casez_tmp_63 = uops_9_lrs2;
      4'b1010:
        casez_tmp_63 = uops_10_lrs2;
      4'b1011:
        casez_tmp_63 = uops_11_lrs2;
      4'b1100:
        casez_tmp_63 = uops_12_lrs2;
      4'b1101:
        casez_tmp_63 = uops_13_lrs2;
      4'b1110:
        casez_tmp_63 = uops_14_lrs2;
      default:
        casez_tmp_63 = uops_15_lrs2;
    endcase
  end // always @(*)
  reg  [5:0]  casez_tmp_64;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_64 = uops_0_lrs3;
      4'b0001:
        casez_tmp_64 = uops_1_lrs3;
      4'b0010:
        casez_tmp_64 = uops_2_lrs3;
      4'b0011:
        casez_tmp_64 = uops_3_lrs3;
      4'b0100:
        casez_tmp_64 = uops_4_lrs3;
      4'b0101:
        casez_tmp_64 = uops_5_lrs3;
      4'b0110:
        casez_tmp_64 = uops_6_lrs3;
      4'b0111:
        casez_tmp_64 = uops_7_lrs3;
      4'b1000:
        casez_tmp_64 = uops_8_lrs3;
      4'b1001:
        casez_tmp_64 = uops_9_lrs3;
      4'b1010:
        casez_tmp_64 = uops_10_lrs3;
      4'b1011:
        casez_tmp_64 = uops_11_lrs3;
      4'b1100:
        casez_tmp_64 = uops_12_lrs3;
      4'b1101:
        casez_tmp_64 = uops_13_lrs3;
      4'b1110:
        casez_tmp_64 = uops_14_lrs3;
      default:
        casez_tmp_64 = uops_15_lrs3;
    endcase
  end // always @(*)
  reg         casez_tmp_65;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_65 = uops_0_ldst_val;
      4'b0001:
        casez_tmp_65 = uops_1_ldst_val;
      4'b0010:
        casez_tmp_65 = uops_2_ldst_val;
      4'b0011:
        casez_tmp_65 = uops_3_ldst_val;
      4'b0100:
        casez_tmp_65 = uops_4_ldst_val;
      4'b0101:
        casez_tmp_65 = uops_5_ldst_val;
      4'b0110:
        casez_tmp_65 = uops_6_ldst_val;
      4'b0111:
        casez_tmp_65 = uops_7_ldst_val;
      4'b1000:
        casez_tmp_65 = uops_8_ldst_val;
      4'b1001:
        casez_tmp_65 = uops_9_ldst_val;
      4'b1010:
        casez_tmp_65 = uops_10_ldst_val;
      4'b1011:
        casez_tmp_65 = uops_11_ldst_val;
      4'b1100:
        casez_tmp_65 = uops_12_ldst_val;
      4'b1101:
        casez_tmp_65 = uops_13_ldst_val;
      4'b1110:
        casez_tmp_65 = uops_14_ldst_val;
      default:
        casez_tmp_65 = uops_15_ldst_val;
    endcase
  end // always @(*)
  reg  [1:0]  casez_tmp_66;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_66 = uops_0_dst_rtype;
      4'b0001:
        casez_tmp_66 = uops_1_dst_rtype;
      4'b0010:
        casez_tmp_66 = uops_2_dst_rtype;
      4'b0011:
        casez_tmp_66 = uops_3_dst_rtype;
      4'b0100:
        casez_tmp_66 = uops_4_dst_rtype;
      4'b0101:
        casez_tmp_66 = uops_5_dst_rtype;
      4'b0110:
        casez_tmp_66 = uops_6_dst_rtype;
      4'b0111:
        casez_tmp_66 = uops_7_dst_rtype;
      4'b1000:
        casez_tmp_66 = uops_8_dst_rtype;
      4'b1001:
        casez_tmp_66 = uops_9_dst_rtype;
      4'b1010:
        casez_tmp_66 = uops_10_dst_rtype;
      4'b1011:
        casez_tmp_66 = uops_11_dst_rtype;
      4'b1100:
        casez_tmp_66 = uops_12_dst_rtype;
      4'b1101:
        casez_tmp_66 = uops_13_dst_rtype;
      4'b1110:
        casez_tmp_66 = uops_14_dst_rtype;
      default:
        casez_tmp_66 = uops_15_dst_rtype;
    endcase
  end // always @(*)
  reg  [1:0]  casez_tmp_67;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_67 = uops_0_lrs1_rtype;
      4'b0001:
        casez_tmp_67 = uops_1_lrs1_rtype;
      4'b0010:
        casez_tmp_67 = uops_2_lrs1_rtype;
      4'b0011:
        casez_tmp_67 = uops_3_lrs1_rtype;
      4'b0100:
        casez_tmp_67 = uops_4_lrs1_rtype;
      4'b0101:
        casez_tmp_67 = uops_5_lrs1_rtype;
      4'b0110:
        casez_tmp_67 = uops_6_lrs1_rtype;
      4'b0111:
        casez_tmp_67 = uops_7_lrs1_rtype;
      4'b1000:
        casez_tmp_67 = uops_8_lrs1_rtype;
      4'b1001:
        casez_tmp_67 = uops_9_lrs1_rtype;
      4'b1010:
        casez_tmp_67 = uops_10_lrs1_rtype;
      4'b1011:
        casez_tmp_67 = uops_11_lrs1_rtype;
      4'b1100:
        casez_tmp_67 = uops_12_lrs1_rtype;
      4'b1101:
        casez_tmp_67 = uops_13_lrs1_rtype;
      4'b1110:
        casez_tmp_67 = uops_14_lrs1_rtype;
      default:
        casez_tmp_67 = uops_15_lrs1_rtype;
    endcase
  end // always @(*)
  reg  [1:0]  casez_tmp_68;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_68 = uops_0_lrs2_rtype;
      4'b0001:
        casez_tmp_68 = uops_1_lrs2_rtype;
      4'b0010:
        casez_tmp_68 = uops_2_lrs2_rtype;
      4'b0011:
        casez_tmp_68 = uops_3_lrs2_rtype;
      4'b0100:
        casez_tmp_68 = uops_4_lrs2_rtype;
      4'b0101:
        casez_tmp_68 = uops_5_lrs2_rtype;
      4'b0110:
        casez_tmp_68 = uops_6_lrs2_rtype;
      4'b0111:
        casez_tmp_68 = uops_7_lrs2_rtype;
      4'b1000:
        casez_tmp_68 = uops_8_lrs2_rtype;
      4'b1001:
        casez_tmp_68 = uops_9_lrs2_rtype;
      4'b1010:
        casez_tmp_68 = uops_10_lrs2_rtype;
      4'b1011:
        casez_tmp_68 = uops_11_lrs2_rtype;
      4'b1100:
        casez_tmp_68 = uops_12_lrs2_rtype;
      4'b1101:
        casez_tmp_68 = uops_13_lrs2_rtype;
      4'b1110:
        casez_tmp_68 = uops_14_lrs2_rtype;
      default:
        casez_tmp_68 = uops_15_lrs2_rtype;
    endcase
  end // always @(*)
  reg         casez_tmp_69;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_69 = uops_0_frs3_en;
      4'b0001:
        casez_tmp_69 = uops_1_frs3_en;
      4'b0010:
        casez_tmp_69 = uops_2_frs3_en;
      4'b0011:
        casez_tmp_69 = uops_3_frs3_en;
      4'b0100:
        casez_tmp_69 = uops_4_frs3_en;
      4'b0101:
        casez_tmp_69 = uops_5_frs3_en;
      4'b0110:
        casez_tmp_69 = uops_6_frs3_en;
      4'b0111:
        casez_tmp_69 = uops_7_frs3_en;
      4'b1000:
        casez_tmp_69 = uops_8_frs3_en;
      4'b1001:
        casez_tmp_69 = uops_9_frs3_en;
      4'b1010:
        casez_tmp_69 = uops_10_frs3_en;
      4'b1011:
        casez_tmp_69 = uops_11_frs3_en;
      4'b1100:
        casez_tmp_69 = uops_12_frs3_en;
      4'b1101:
        casez_tmp_69 = uops_13_frs3_en;
      4'b1110:
        casez_tmp_69 = uops_14_frs3_en;
      default:
        casez_tmp_69 = uops_15_frs3_en;
    endcase
  end // always @(*)
  reg         casez_tmp_70;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_70 = uops_0_fp_val;
      4'b0001:
        casez_tmp_70 = uops_1_fp_val;
      4'b0010:
        casez_tmp_70 = uops_2_fp_val;
      4'b0011:
        casez_tmp_70 = uops_3_fp_val;
      4'b0100:
        casez_tmp_70 = uops_4_fp_val;
      4'b0101:
        casez_tmp_70 = uops_5_fp_val;
      4'b0110:
        casez_tmp_70 = uops_6_fp_val;
      4'b0111:
        casez_tmp_70 = uops_7_fp_val;
      4'b1000:
        casez_tmp_70 = uops_8_fp_val;
      4'b1001:
        casez_tmp_70 = uops_9_fp_val;
      4'b1010:
        casez_tmp_70 = uops_10_fp_val;
      4'b1011:
        casez_tmp_70 = uops_11_fp_val;
      4'b1100:
        casez_tmp_70 = uops_12_fp_val;
      4'b1101:
        casez_tmp_70 = uops_13_fp_val;
      4'b1110:
        casez_tmp_70 = uops_14_fp_val;
      default:
        casez_tmp_70 = uops_15_fp_val;
    endcase
  end // always @(*)
  reg         casez_tmp_71;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_71 = uops_0_fp_single;
      4'b0001:
        casez_tmp_71 = uops_1_fp_single;
      4'b0010:
        casez_tmp_71 = uops_2_fp_single;
      4'b0011:
        casez_tmp_71 = uops_3_fp_single;
      4'b0100:
        casez_tmp_71 = uops_4_fp_single;
      4'b0101:
        casez_tmp_71 = uops_5_fp_single;
      4'b0110:
        casez_tmp_71 = uops_6_fp_single;
      4'b0111:
        casez_tmp_71 = uops_7_fp_single;
      4'b1000:
        casez_tmp_71 = uops_8_fp_single;
      4'b1001:
        casez_tmp_71 = uops_9_fp_single;
      4'b1010:
        casez_tmp_71 = uops_10_fp_single;
      4'b1011:
        casez_tmp_71 = uops_11_fp_single;
      4'b1100:
        casez_tmp_71 = uops_12_fp_single;
      4'b1101:
        casez_tmp_71 = uops_13_fp_single;
      4'b1110:
        casez_tmp_71 = uops_14_fp_single;
      default:
        casez_tmp_71 = uops_15_fp_single;
    endcase
  end // always @(*)
  reg         casez_tmp_72;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_72 = uops_0_xcpt_pf_if;
      4'b0001:
        casez_tmp_72 = uops_1_xcpt_pf_if;
      4'b0010:
        casez_tmp_72 = uops_2_xcpt_pf_if;
      4'b0011:
        casez_tmp_72 = uops_3_xcpt_pf_if;
      4'b0100:
        casez_tmp_72 = uops_4_xcpt_pf_if;
      4'b0101:
        casez_tmp_72 = uops_5_xcpt_pf_if;
      4'b0110:
        casez_tmp_72 = uops_6_xcpt_pf_if;
      4'b0111:
        casez_tmp_72 = uops_7_xcpt_pf_if;
      4'b1000:
        casez_tmp_72 = uops_8_xcpt_pf_if;
      4'b1001:
        casez_tmp_72 = uops_9_xcpt_pf_if;
      4'b1010:
        casez_tmp_72 = uops_10_xcpt_pf_if;
      4'b1011:
        casez_tmp_72 = uops_11_xcpt_pf_if;
      4'b1100:
        casez_tmp_72 = uops_12_xcpt_pf_if;
      4'b1101:
        casez_tmp_72 = uops_13_xcpt_pf_if;
      4'b1110:
        casez_tmp_72 = uops_14_xcpt_pf_if;
      default:
        casez_tmp_72 = uops_15_xcpt_pf_if;
    endcase
  end // always @(*)
  reg         casez_tmp_73;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_73 = uops_0_xcpt_ae_if;
      4'b0001:
        casez_tmp_73 = uops_1_xcpt_ae_if;
      4'b0010:
        casez_tmp_73 = uops_2_xcpt_ae_if;
      4'b0011:
        casez_tmp_73 = uops_3_xcpt_ae_if;
      4'b0100:
        casez_tmp_73 = uops_4_xcpt_ae_if;
      4'b0101:
        casez_tmp_73 = uops_5_xcpt_ae_if;
      4'b0110:
        casez_tmp_73 = uops_6_xcpt_ae_if;
      4'b0111:
        casez_tmp_73 = uops_7_xcpt_ae_if;
      4'b1000:
        casez_tmp_73 = uops_8_xcpt_ae_if;
      4'b1001:
        casez_tmp_73 = uops_9_xcpt_ae_if;
      4'b1010:
        casez_tmp_73 = uops_10_xcpt_ae_if;
      4'b1011:
        casez_tmp_73 = uops_11_xcpt_ae_if;
      4'b1100:
        casez_tmp_73 = uops_12_xcpt_ae_if;
      4'b1101:
        casez_tmp_73 = uops_13_xcpt_ae_if;
      4'b1110:
        casez_tmp_73 = uops_14_xcpt_ae_if;
      default:
        casez_tmp_73 = uops_15_xcpt_ae_if;
    endcase
  end // always @(*)
  reg         casez_tmp_74;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_74 = uops_0_xcpt_ma_if;
      4'b0001:
        casez_tmp_74 = uops_1_xcpt_ma_if;
      4'b0010:
        casez_tmp_74 = uops_2_xcpt_ma_if;
      4'b0011:
        casez_tmp_74 = uops_3_xcpt_ma_if;
      4'b0100:
        casez_tmp_74 = uops_4_xcpt_ma_if;
      4'b0101:
        casez_tmp_74 = uops_5_xcpt_ma_if;
      4'b0110:
        casez_tmp_74 = uops_6_xcpt_ma_if;
      4'b0111:
        casez_tmp_74 = uops_7_xcpt_ma_if;
      4'b1000:
        casez_tmp_74 = uops_8_xcpt_ma_if;
      4'b1001:
        casez_tmp_74 = uops_9_xcpt_ma_if;
      4'b1010:
        casez_tmp_74 = uops_10_xcpt_ma_if;
      4'b1011:
        casez_tmp_74 = uops_11_xcpt_ma_if;
      4'b1100:
        casez_tmp_74 = uops_12_xcpt_ma_if;
      4'b1101:
        casez_tmp_74 = uops_13_xcpt_ma_if;
      4'b1110:
        casez_tmp_74 = uops_14_xcpt_ma_if;
      default:
        casez_tmp_74 = uops_15_xcpt_ma_if;
    endcase
  end // always @(*)
  reg         casez_tmp_75;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_75 = uops_0_bp_debug_if;
      4'b0001:
        casez_tmp_75 = uops_1_bp_debug_if;
      4'b0010:
        casez_tmp_75 = uops_2_bp_debug_if;
      4'b0011:
        casez_tmp_75 = uops_3_bp_debug_if;
      4'b0100:
        casez_tmp_75 = uops_4_bp_debug_if;
      4'b0101:
        casez_tmp_75 = uops_5_bp_debug_if;
      4'b0110:
        casez_tmp_75 = uops_6_bp_debug_if;
      4'b0111:
        casez_tmp_75 = uops_7_bp_debug_if;
      4'b1000:
        casez_tmp_75 = uops_8_bp_debug_if;
      4'b1001:
        casez_tmp_75 = uops_9_bp_debug_if;
      4'b1010:
        casez_tmp_75 = uops_10_bp_debug_if;
      4'b1011:
        casez_tmp_75 = uops_11_bp_debug_if;
      4'b1100:
        casez_tmp_75 = uops_12_bp_debug_if;
      4'b1101:
        casez_tmp_75 = uops_13_bp_debug_if;
      4'b1110:
        casez_tmp_75 = uops_14_bp_debug_if;
      default:
        casez_tmp_75 = uops_15_bp_debug_if;
    endcase
  end // always @(*)
  reg         casez_tmp_76;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_76 = uops_0_bp_xcpt_if;
      4'b0001:
        casez_tmp_76 = uops_1_bp_xcpt_if;
      4'b0010:
        casez_tmp_76 = uops_2_bp_xcpt_if;
      4'b0011:
        casez_tmp_76 = uops_3_bp_xcpt_if;
      4'b0100:
        casez_tmp_76 = uops_4_bp_xcpt_if;
      4'b0101:
        casez_tmp_76 = uops_5_bp_xcpt_if;
      4'b0110:
        casez_tmp_76 = uops_6_bp_xcpt_if;
      4'b0111:
        casez_tmp_76 = uops_7_bp_xcpt_if;
      4'b1000:
        casez_tmp_76 = uops_8_bp_xcpt_if;
      4'b1001:
        casez_tmp_76 = uops_9_bp_xcpt_if;
      4'b1010:
        casez_tmp_76 = uops_10_bp_xcpt_if;
      4'b1011:
        casez_tmp_76 = uops_11_bp_xcpt_if;
      4'b1100:
        casez_tmp_76 = uops_12_bp_xcpt_if;
      4'b1101:
        casez_tmp_76 = uops_13_bp_xcpt_if;
      4'b1110:
        casez_tmp_76 = uops_14_bp_xcpt_if;
      default:
        casez_tmp_76 = uops_15_bp_xcpt_if;
    endcase
  end // always @(*)
  reg  [1:0]  casez_tmp_77;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_77 = uops_0_debug_fsrc;
      4'b0001:
        casez_tmp_77 = uops_1_debug_fsrc;
      4'b0010:
        casez_tmp_77 = uops_2_debug_fsrc;
      4'b0011:
        casez_tmp_77 = uops_3_debug_fsrc;
      4'b0100:
        casez_tmp_77 = uops_4_debug_fsrc;
      4'b0101:
        casez_tmp_77 = uops_5_debug_fsrc;
      4'b0110:
        casez_tmp_77 = uops_6_debug_fsrc;
      4'b0111:
        casez_tmp_77 = uops_7_debug_fsrc;
      4'b1000:
        casez_tmp_77 = uops_8_debug_fsrc;
      4'b1001:
        casez_tmp_77 = uops_9_debug_fsrc;
      4'b1010:
        casez_tmp_77 = uops_10_debug_fsrc;
      4'b1011:
        casez_tmp_77 = uops_11_debug_fsrc;
      4'b1100:
        casez_tmp_77 = uops_12_debug_fsrc;
      4'b1101:
        casez_tmp_77 = uops_13_debug_fsrc;
      4'b1110:
        casez_tmp_77 = uops_14_debug_fsrc;
      default:
        casez_tmp_77 = uops_15_debug_fsrc;
    endcase
  end // always @(*)
  reg  [1:0]  casez_tmp_78;
  always @(*) begin
    casez (deq_ptr_value)
      4'b0000:
        casez_tmp_78 = uops_0_debug_tsrc;
      4'b0001:
        casez_tmp_78 = uops_1_debug_tsrc;
      4'b0010:
        casez_tmp_78 = uops_2_debug_tsrc;
      4'b0011:
        casez_tmp_78 = uops_3_debug_tsrc;
      4'b0100:
        casez_tmp_78 = uops_4_debug_tsrc;
      4'b0101:
        casez_tmp_78 = uops_5_debug_tsrc;
      4'b0110:
        casez_tmp_78 = uops_6_debug_tsrc;
      4'b0111:
        casez_tmp_78 = uops_7_debug_tsrc;
      4'b1000:
        casez_tmp_78 = uops_8_debug_tsrc;
      4'b1001:
        casez_tmp_78 = uops_9_debug_tsrc;
      4'b1010:
        casez_tmp_78 = uops_10_debug_tsrc;
      4'b1011:
        casez_tmp_78 = uops_11_debug_tsrc;
      4'b1100:
        casez_tmp_78 = uops_12_debug_tsrc;
      4'b1101:
        casez_tmp_78 = uops_13_debug_tsrc;
      4'b1110:
        casez_tmp_78 = uops_14_debug_tsrc;
      default:
        casez_tmp_78 = uops_15_debug_tsrc;
    endcase
  end // always @(*)
  wire        do_deq = (io_deq_ready | ~casez_tmp) & ~_io_empty_output;
  wire        _GEN = enq_ptr_value == 4'h0;
  wire        _GEN_0 = do_enq & _GEN;
  wire        _GEN_1 = enq_ptr_value == 4'h1;
  wire        _GEN_2 = do_enq & _GEN_1;
  wire        _GEN_3 = enq_ptr_value == 4'h2;
  wire        _GEN_4 = do_enq & _GEN_3;
  wire        _GEN_5 = enq_ptr_value == 4'h3;
  wire        _GEN_6 = do_enq & _GEN_5;
  wire        _GEN_7 = enq_ptr_value == 4'h4;
  wire        _GEN_8 = do_enq & _GEN_7;
  wire        _GEN_9 = enq_ptr_value == 4'h5;
  wire        _GEN_10 = do_enq & _GEN_9;
  wire        _GEN_11 = enq_ptr_value == 4'h6;
  wire        _GEN_12 = do_enq & _GEN_11;
  wire        _GEN_13 = enq_ptr_value == 4'h7;
  wire        _GEN_14 = do_enq & _GEN_13;
  wire        _GEN_15 = enq_ptr_value == 4'h8;
  wire        _GEN_16 = do_enq & _GEN_15;
  wire        _GEN_17 = enq_ptr_value == 4'h9;
  wire        _GEN_18 = do_enq & _GEN_17;
  wire        _GEN_19 = enq_ptr_value == 4'hA;
  wire        _GEN_20 = do_enq & _GEN_19;
  wire        _GEN_21 = enq_ptr_value == 4'hB;
  wire        _GEN_22 = do_enq & _GEN_21;
  wire        _GEN_23 = enq_ptr_value == 4'hC;
  wire        _GEN_24 = do_enq & _GEN_23;
  wire        _GEN_25 = enq_ptr_value == 4'hD;
  wire        _GEN_26 = do_enq & _GEN_25;
  wire        _GEN_27 = enq_ptr_value == 4'hE;
  wire        _GEN_28 = do_enq & _GEN_27;
  wire        _GEN_29 = do_enq & (&enq_ptr_value);
  wire [19:0] _uops_br_mask_T_1 = io_enq_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask;
  always @(posedge clock) begin
    if (reset) begin
      valids_0 <= 1'h0;
      valids_1 <= 1'h0;
      valids_2 <= 1'h0;
      valids_3 <= 1'h0;
      valids_4 <= 1'h0;
      valids_5 <= 1'h0;
      valids_6 <= 1'h0;
      valids_7 <= 1'h0;
      valids_8 <= 1'h0;
      valids_9 <= 1'h0;
      valids_10 <= 1'h0;
      valids_11 <= 1'h0;
      valids_12 <= 1'h0;
      valids_13 <= 1'h0;
      valids_14 <= 1'h0;
      valids_15 <= 1'h0;
      enq_ptr_value <= 4'h0;
      deq_ptr_value <= 4'h0;
      maybe_full <= 1'h0;
    end
    else begin
      valids_0 <= ~(do_deq & deq_ptr_value == 4'h0) & (_GEN_0 | valids_0 & (io_brupdate_b1_mispredict_mask & uops_0_br_mask) == 20'h0 & ~(io_flush & uops_0_uses_ldq));
      valids_1 <= ~(do_deq & deq_ptr_value == 4'h1) & (_GEN_2 | valids_1 & (io_brupdate_b1_mispredict_mask & uops_1_br_mask) == 20'h0 & ~(io_flush & uops_1_uses_ldq));
      valids_2 <= ~(do_deq & deq_ptr_value == 4'h2) & (_GEN_4 | valids_2 & (io_brupdate_b1_mispredict_mask & uops_2_br_mask) == 20'h0 & ~(io_flush & uops_2_uses_ldq));
      valids_3 <= ~(do_deq & deq_ptr_value == 4'h3) & (_GEN_6 | valids_3 & (io_brupdate_b1_mispredict_mask & uops_3_br_mask) == 20'h0 & ~(io_flush & uops_3_uses_ldq));
      valids_4 <= ~(do_deq & deq_ptr_value == 4'h4) & (_GEN_8 | valids_4 & (io_brupdate_b1_mispredict_mask & uops_4_br_mask) == 20'h0 & ~(io_flush & uops_4_uses_ldq));
      valids_5 <= ~(do_deq & deq_ptr_value == 4'h5) & (_GEN_10 | valids_5 & (io_brupdate_b1_mispredict_mask & uops_5_br_mask) == 20'h0 & ~(io_flush & uops_5_uses_ldq));
      valids_6 <= ~(do_deq & deq_ptr_value == 4'h6) & (_GEN_12 | valids_6 & (io_brupdate_b1_mispredict_mask & uops_6_br_mask) == 20'h0 & ~(io_flush & uops_6_uses_ldq));
      valids_7 <= ~(do_deq & deq_ptr_value == 4'h7) & (_GEN_14 | valids_7 & (io_brupdate_b1_mispredict_mask & uops_7_br_mask) == 20'h0 & ~(io_flush & uops_7_uses_ldq));
      valids_8 <= ~(do_deq & deq_ptr_value == 4'h8) & (_GEN_16 | valids_8 & (io_brupdate_b1_mispredict_mask & uops_8_br_mask) == 20'h0 & ~(io_flush & uops_8_uses_ldq));
      valids_9 <= ~(do_deq & deq_ptr_value == 4'h9) & (_GEN_18 | valids_9 & (io_brupdate_b1_mispredict_mask & uops_9_br_mask) == 20'h0 & ~(io_flush & uops_9_uses_ldq));
      valids_10 <= ~(do_deq & deq_ptr_value == 4'hA) & (_GEN_20 | valids_10 & (io_brupdate_b1_mispredict_mask & uops_10_br_mask) == 20'h0 & ~(io_flush & uops_10_uses_ldq));
      valids_11 <= ~(do_deq & deq_ptr_value == 4'hB) & (_GEN_22 | valids_11 & (io_brupdate_b1_mispredict_mask & uops_11_br_mask) == 20'h0 & ~(io_flush & uops_11_uses_ldq));
      valids_12 <= ~(do_deq & deq_ptr_value == 4'hC) & (_GEN_24 | valids_12 & (io_brupdate_b1_mispredict_mask & uops_12_br_mask) == 20'h0 & ~(io_flush & uops_12_uses_ldq));
      valids_13 <= ~(do_deq & deq_ptr_value == 4'hD) & (_GEN_26 | valids_13 & (io_brupdate_b1_mispredict_mask & uops_13_br_mask) == 20'h0 & ~(io_flush & uops_13_uses_ldq));
      valids_14 <= ~(do_deq & deq_ptr_value == 4'hE) & (_GEN_28 | valids_14 & (io_brupdate_b1_mispredict_mask & uops_14_br_mask) == 20'h0 & ~(io_flush & uops_14_uses_ldq));
      valids_15 <= ~(do_deq & (&deq_ptr_value)) & (_GEN_29 | valids_15 & (io_brupdate_b1_mispredict_mask & uops_15_br_mask) == 20'h0 & ~(io_flush & uops_15_uses_ldq));
      if (do_enq)
        enq_ptr_value <= enq_ptr_value + 4'h1;
      if (do_deq)
        deq_ptr_value <= deq_ptr_value + 4'h1;
      if (~(do_enq == do_deq))
        maybe_full <= do_enq;
    end
    if (_GEN_0) begin
      uops_0_uopc <= io_enq_bits_uop_uopc;
      uops_0_inst <= io_enq_bits_uop_inst;
      uops_0_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_0_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_0_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_0_iq_type <= io_enq_bits_uop_iq_type;
      uops_0_fu_code <= io_enq_bits_uop_fu_code;
      uops_0_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_0_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_0_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_0_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_0_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_0_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_0_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_0_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_0_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_0_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_0_iw_state <= io_enq_bits_uop_iw_state;
      uops_0_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_0_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_0_is_br <= io_enq_bits_uop_is_br;
      uops_0_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_0_is_jal <= io_enq_bits_uop_is_jal;
      uops_0_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_0_br_tag <= io_enq_bits_uop_br_tag;
      uops_0_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_0_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_0_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_0_taken <= io_enq_bits_uop_taken;
      uops_0_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_0_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_0_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_0_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_0_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_0_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_0_pdst <= io_enq_bits_uop_pdst;
      uops_0_prs1 <= io_enq_bits_uop_prs1;
      uops_0_prs2 <= io_enq_bits_uop_prs2;
      uops_0_prs3 <= io_enq_bits_uop_prs3;
      uops_0_ppred <= io_enq_bits_uop_ppred;
      uops_0_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_0_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_0_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_0_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_0_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_0_exception <= io_enq_bits_uop_exception;
      uops_0_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_0_bypassable <= io_enq_bits_uop_bypassable;
      uops_0_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_0_mem_size <= io_enq_bits_uop_mem_size;
      uops_0_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_0_is_fence <= io_enq_bits_uop_is_fence;
      uops_0_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_0_is_amo <= io_enq_bits_uop_is_amo;
      uops_0_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_0_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_0_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_0_is_unique <= io_enq_bits_uop_is_unique;
      uops_0_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_0_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_0_ldst <= io_enq_bits_uop_ldst;
      uops_0_lrs1 <= io_enq_bits_uop_lrs1;
      uops_0_lrs2 <= io_enq_bits_uop_lrs2;
      uops_0_lrs3 <= io_enq_bits_uop_lrs3;
      uops_0_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_0_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_0_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_0_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_0_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_0_fp_val <= io_enq_bits_uop_fp_val;
      uops_0_fp_single <= io_enq_bits_uop_fp_single;
      uops_0_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_0_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_0_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_0_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_0_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_0_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_0_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN)
      uops_0_br_mask <= _uops_br_mask_T_1;
    else
      uops_0_br_mask <= ({20{~valids_0}} | ~io_brupdate_b1_resolve_mask) & uops_0_br_mask;
    if (_GEN_2) begin
      uops_1_uopc <= io_enq_bits_uop_uopc;
      uops_1_inst <= io_enq_bits_uop_inst;
      uops_1_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_1_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_1_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_1_iq_type <= io_enq_bits_uop_iq_type;
      uops_1_fu_code <= io_enq_bits_uop_fu_code;
      uops_1_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_1_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_1_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_1_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_1_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_1_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_1_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_1_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_1_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_1_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_1_iw_state <= io_enq_bits_uop_iw_state;
      uops_1_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_1_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_1_is_br <= io_enq_bits_uop_is_br;
      uops_1_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_1_is_jal <= io_enq_bits_uop_is_jal;
      uops_1_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_1_br_tag <= io_enq_bits_uop_br_tag;
      uops_1_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_1_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_1_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_1_taken <= io_enq_bits_uop_taken;
      uops_1_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_1_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_1_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_1_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_1_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_1_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_1_pdst <= io_enq_bits_uop_pdst;
      uops_1_prs1 <= io_enq_bits_uop_prs1;
      uops_1_prs2 <= io_enq_bits_uop_prs2;
      uops_1_prs3 <= io_enq_bits_uop_prs3;
      uops_1_ppred <= io_enq_bits_uop_ppred;
      uops_1_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_1_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_1_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_1_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_1_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_1_exception <= io_enq_bits_uop_exception;
      uops_1_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_1_bypassable <= io_enq_bits_uop_bypassable;
      uops_1_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_1_mem_size <= io_enq_bits_uop_mem_size;
      uops_1_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_1_is_fence <= io_enq_bits_uop_is_fence;
      uops_1_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_1_is_amo <= io_enq_bits_uop_is_amo;
      uops_1_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_1_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_1_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_1_is_unique <= io_enq_bits_uop_is_unique;
      uops_1_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_1_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_1_ldst <= io_enq_bits_uop_ldst;
      uops_1_lrs1 <= io_enq_bits_uop_lrs1;
      uops_1_lrs2 <= io_enq_bits_uop_lrs2;
      uops_1_lrs3 <= io_enq_bits_uop_lrs3;
      uops_1_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_1_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_1_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_1_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_1_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_1_fp_val <= io_enq_bits_uop_fp_val;
      uops_1_fp_single <= io_enq_bits_uop_fp_single;
      uops_1_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_1_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_1_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_1_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_1_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_1_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_1_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN_1)
      uops_1_br_mask <= _uops_br_mask_T_1;
    else
      uops_1_br_mask <= ({20{~valids_1}} | ~io_brupdate_b1_resolve_mask) & uops_1_br_mask;
    if (_GEN_4) begin
      uops_2_uopc <= io_enq_bits_uop_uopc;
      uops_2_inst <= io_enq_bits_uop_inst;
      uops_2_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_2_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_2_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_2_iq_type <= io_enq_bits_uop_iq_type;
      uops_2_fu_code <= io_enq_bits_uop_fu_code;
      uops_2_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_2_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_2_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_2_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_2_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_2_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_2_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_2_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_2_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_2_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_2_iw_state <= io_enq_bits_uop_iw_state;
      uops_2_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_2_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_2_is_br <= io_enq_bits_uop_is_br;
      uops_2_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_2_is_jal <= io_enq_bits_uop_is_jal;
      uops_2_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_2_br_tag <= io_enq_bits_uop_br_tag;
      uops_2_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_2_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_2_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_2_taken <= io_enq_bits_uop_taken;
      uops_2_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_2_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_2_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_2_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_2_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_2_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_2_pdst <= io_enq_bits_uop_pdst;
      uops_2_prs1 <= io_enq_bits_uop_prs1;
      uops_2_prs2 <= io_enq_bits_uop_prs2;
      uops_2_prs3 <= io_enq_bits_uop_prs3;
      uops_2_ppred <= io_enq_bits_uop_ppred;
      uops_2_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_2_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_2_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_2_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_2_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_2_exception <= io_enq_bits_uop_exception;
      uops_2_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_2_bypassable <= io_enq_bits_uop_bypassable;
      uops_2_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_2_mem_size <= io_enq_bits_uop_mem_size;
      uops_2_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_2_is_fence <= io_enq_bits_uop_is_fence;
      uops_2_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_2_is_amo <= io_enq_bits_uop_is_amo;
      uops_2_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_2_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_2_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_2_is_unique <= io_enq_bits_uop_is_unique;
      uops_2_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_2_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_2_ldst <= io_enq_bits_uop_ldst;
      uops_2_lrs1 <= io_enq_bits_uop_lrs1;
      uops_2_lrs2 <= io_enq_bits_uop_lrs2;
      uops_2_lrs3 <= io_enq_bits_uop_lrs3;
      uops_2_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_2_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_2_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_2_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_2_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_2_fp_val <= io_enq_bits_uop_fp_val;
      uops_2_fp_single <= io_enq_bits_uop_fp_single;
      uops_2_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_2_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_2_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_2_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_2_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_2_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_2_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN_3)
      uops_2_br_mask <= _uops_br_mask_T_1;
    else
      uops_2_br_mask <= ({20{~valids_2}} | ~io_brupdate_b1_resolve_mask) & uops_2_br_mask;
    if (_GEN_6) begin
      uops_3_uopc <= io_enq_bits_uop_uopc;
      uops_3_inst <= io_enq_bits_uop_inst;
      uops_3_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_3_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_3_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_3_iq_type <= io_enq_bits_uop_iq_type;
      uops_3_fu_code <= io_enq_bits_uop_fu_code;
      uops_3_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_3_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_3_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_3_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_3_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_3_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_3_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_3_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_3_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_3_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_3_iw_state <= io_enq_bits_uop_iw_state;
      uops_3_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_3_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_3_is_br <= io_enq_bits_uop_is_br;
      uops_3_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_3_is_jal <= io_enq_bits_uop_is_jal;
      uops_3_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_3_br_tag <= io_enq_bits_uop_br_tag;
      uops_3_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_3_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_3_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_3_taken <= io_enq_bits_uop_taken;
      uops_3_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_3_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_3_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_3_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_3_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_3_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_3_pdst <= io_enq_bits_uop_pdst;
      uops_3_prs1 <= io_enq_bits_uop_prs1;
      uops_3_prs2 <= io_enq_bits_uop_prs2;
      uops_3_prs3 <= io_enq_bits_uop_prs3;
      uops_3_ppred <= io_enq_bits_uop_ppred;
      uops_3_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_3_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_3_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_3_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_3_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_3_exception <= io_enq_bits_uop_exception;
      uops_3_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_3_bypassable <= io_enq_bits_uop_bypassable;
      uops_3_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_3_mem_size <= io_enq_bits_uop_mem_size;
      uops_3_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_3_is_fence <= io_enq_bits_uop_is_fence;
      uops_3_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_3_is_amo <= io_enq_bits_uop_is_amo;
      uops_3_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_3_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_3_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_3_is_unique <= io_enq_bits_uop_is_unique;
      uops_3_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_3_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_3_ldst <= io_enq_bits_uop_ldst;
      uops_3_lrs1 <= io_enq_bits_uop_lrs1;
      uops_3_lrs2 <= io_enq_bits_uop_lrs2;
      uops_3_lrs3 <= io_enq_bits_uop_lrs3;
      uops_3_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_3_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_3_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_3_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_3_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_3_fp_val <= io_enq_bits_uop_fp_val;
      uops_3_fp_single <= io_enq_bits_uop_fp_single;
      uops_3_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_3_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_3_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_3_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_3_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_3_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_3_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN_5)
      uops_3_br_mask <= _uops_br_mask_T_1;
    else
      uops_3_br_mask <= ({20{~valids_3}} | ~io_brupdate_b1_resolve_mask) & uops_3_br_mask;
    if (_GEN_8) begin
      uops_4_uopc <= io_enq_bits_uop_uopc;
      uops_4_inst <= io_enq_bits_uop_inst;
      uops_4_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_4_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_4_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_4_iq_type <= io_enq_bits_uop_iq_type;
      uops_4_fu_code <= io_enq_bits_uop_fu_code;
      uops_4_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_4_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_4_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_4_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_4_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_4_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_4_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_4_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_4_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_4_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_4_iw_state <= io_enq_bits_uop_iw_state;
      uops_4_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_4_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_4_is_br <= io_enq_bits_uop_is_br;
      uops_4_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_4_is_jal <= io_enq_bits_uop_is_jal;
      uops_4_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_4_br_tag <= io_enq_bits_uop_br_tag;
      uops_4_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_4_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_4_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_4_taken <= io_enq_bits_uop_taken;
      uops_4_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_4_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_4_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_4_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_4_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_4_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_4_pdst <= io_enq_bits_uop_pdst;
      uops_4_prs1 <= io_enq_bits_uop_prs1;
      uops_4_prs2 <= io_enq_bits_uop_prs2;
      uops_4_prs3 <= io_enq_bits_uop_prs3;
      uops_4_ppred <= io_enq_bits_uop_ppred;
      uops_4_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_4_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_4_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_4_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_4_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_4_exception <= io_enq_bits_uop_exception;
      uops_4_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_4_bypassable <= io_enq_bits_uop_bypassable;
      uops_4_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_4_mem_size <= io_enq_bits_uop_mem_size;
      uops_4_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_4_is_fence <= io_enq_bits_uop_is_fence;
      uops_4_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_4_is_amo <= io_enq_bits_uop_is_amo;
      uops_4_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_4_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_4_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_4_is_unique <= io_enq_bits_uop_is_unique;
      uops_4_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_4_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_4_ldst <= io_enq_bits_uop_ldst;
      uops_4_lrs1 <= io_enq_bits_uop_lrs1;
      uops_4_lrs2 <= io_enq_bits_uop_lrs2;
      uops_4_lrs3 <= io_enq_bits_uop_lrs3;
      uops_4_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_4_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_4_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_4_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_4_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_4_fp_val <= io_enq_bits_uop_fp_val;
      uops_4_fp_single <= io_enq_bits_uop_fp_single;
      uops_4_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_4_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_4_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_4_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_4_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_4_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_4_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN_7)
      uops_4_br_mask <= _uops_br_mask_T_1;
    else
      uops_4_br_mask <= ({20{~valids_4}} | ~io_brupdate_b1_resolve_mask) & uops_4_br_mask;
    if (_GEN_10) begin
      uops_5_uopc <= io_enq_bits_uop_uopc;
      uops_5_inst <= io_enq_bits_uop_inst;
      uops_5_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_5_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_5_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_5_iq_type <= io_enq_bits_uop_iq_type;
      uops_5_fu_code <= io_enq_bits_uop_fu_code;
      uops_5_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_5_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_5_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_5_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_5_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_5_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_5_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_5_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_5_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_5_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_5_iw_state <= io_enq_bits_uop_iw_state;
      uops_5_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_5_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_5_is_br <= io_enq_bits_uop_is_br;
      uops_5_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_5_is_jal <= io_enq_bits_uop_is_jal;
      uops_5_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_5_br_tag <= io_enq_bits_uop_br_tag;
      uops_5_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_5_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_5_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_5_taken <= io_enq_bits_uop_taken;
      uops_5_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_5_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_5_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_5_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_5_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_5_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_5_pdst <= io_enq_bits_uop_pdst;
      uops_5_prs1 <= io_enq_bits_uop_prs1;
      uops_5_prs2 <= io_enq_bits_uop_prs2;
      uops_5_prs3 <= io_enq_bits_uop_prs3;
      uops_5_ppred <= io_enq_bits_uop_ppred;
      uops_5_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_5_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_5_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_5_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_5_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_5_exception <= io_enq_bits_uop_exception;
      uops_5_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_5_bypassable <= io_enq_bits_uop_bypassable;
      uops_5_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_5_mem_size <= io_enq_bits_uop_mem_size;
      uops_5_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_5_is_fence <= io_enq_bits_uop_is_fence;
      uops_5_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_5_is_amo <= io_enq_bits_uop_is_amo;
      uops_5_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_5_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_5_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_5_is_unique <= io_enq_bits_uop_is_unique;
      uops_5_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_5_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_5_ldst <= io_enq_bits_uop_ldst;
      uops_5_lrs1 <= io_enq_bits_uop_lrs1;
      uops_5_lrs2 <= io_enq_bits_uop_lrs2;
      uops_5_lrs3 <= io_enq_bits_uop_lrs3;
      uops_5_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_5_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_5_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_5_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_5_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_5_fp_val <= io_enq_bits_uop_fp_val;
      uops_5_fp_single <= io_enq_bits_uop_fp_single;
      uops_5_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_5_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_5_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_5_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_5_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_5_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_5_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN_9)
      uops_5_br_mask <= _uops_br_mask_T_1;
    else
      uops_5_br_mask <= ({20{~valids_5}} | ~io_brupdate_b1_resolve_mask) & uops_5_br_mask;
    if (_GEN_12) begin
      uops_6_uopc <= io_enq_bits_uop_uopc;
      uops_6_inst <= io_enq_bits_uop_inst;
      uops_6_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_6_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_6_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_6_iq_type <= io_enq_bits_uop_iq_type;
      uops_6_fu_code <= io_enq_bits_uop_fu_code;
      uops_6_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_6_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_6_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_6_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_6_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_6_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_6_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_6_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_6_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_6_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_6_iw_state <= io_enq_bits_uop_iw_state;
      uops_6_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_6_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_6_is_br <= io_enq_bits_uop_is_br;
      uops_6_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_6_is_jal <= io_enq_bits_uop_is_jal;
      uops_6_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_6_br_tag <= io_enq_bits_uop_br_tag;
      uops_6_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_6_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_6_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_6_taken <= io_enq_bits_uop_taken;
      uops_6_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_6_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_6_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_6_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_6_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_6_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_6_pdst <= io_enq_bits_uop_pdst;
      uops_6_prs1 <= io_enq_bits_uop_prs1;
      uops_6_prs2 <= io_enq_bits_uop_prs2;
      uops_6_prs3 <= io_enq_bits_uop_prs3;
      uops_6_ppred <= io_enq_bits_uop_ppred;
      uops_6_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_6_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_6_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_6_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_6_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_6_exception <= io_enq_bits_uop_exception;
      uops_6_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_6_bypassable <= io_enq_bits_uop_bypassable;
      uops_6_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_6_mem_size <= io_enq_bits_uop_mem_size;
      uops_6_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_6_is_fence <= io_enq_bits_uop_is_fence;
      uops_6_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_6_is_amo <= io_enq_bits_uop_is_amo;
      uops_6_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_6_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_6_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_6_is_unique <= io_enq_bits_uop_is_unique;
      uops_6_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_6_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_6_ldst <= io_enq_bits_uop_ldst;
      uops_6_lrs1 <= io_enq_bits_uop_lrs1;
      uops_6_lrs2 <= io_enq_bits_uop_lrs2;
      uops_6_lrs3 <= io_enq_bits_uop_lrs3;
      uops_6_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_6_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_6_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_6_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_6_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_6_fp_val <= io_enq_bits_uop_fp_val;
      uops_6_fp_single <= io_enq_bits_uop_fp_single;
      uops_6_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_6_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_6_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_6_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_6_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_6_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_6_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN_11)
      uops_6_br_mask <= _uops_br_mask_T_1;
    else
      uops_6_br_mask <= ({20{~valids_6}} | ~io_brupdate_b1_resolve_mask) & uops_6_br_mask;
    if (_GEN_14) begin
      uops_7_uopc <= io_enq_bits_uop_uopc;
      uops_7_inst <= io_enq_bits_uop_inst;
      uops_7_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_7_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_7_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_7_iq_type <= io_enq_bits_uop_iq_type;
      uops_7_fu_code <= io_enq_bits_uop_fu_code;
      uops_7_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_7_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_7_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_7_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_7_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_7_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_7_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_7_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_7_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_7_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_7_iw_state <= io_enq_bits_uop_iw_state;
      uops_7_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_7_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_7_is_br <= io_enq_bits_uop_is_br;
      uops_7_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_7_is_jal <= io_enq_bits_uop_is_jal;
      uops_7_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_7_br_tag <= io_enq_bits_uop_br_tag;
      uops_7_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_7_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_7_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_7_taken <= io_enq_bits_uop_taken;
      uops_7_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_7_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_7_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_7_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_7_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_7_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_7_pdst <= io_enq_bits_uop_pdst;
      uops_7_prs1 <= io_enq_bits_uop_prs1;
      uops_7_prs2 <= io_enq_bits_uop_prs2;
      uops_7_prs3 <= io_enq_bits_uop_prs3;
      uops_7_ppred <= io_enq_bits_uop_ppred;
      uops_7_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_7_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_7_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_7_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_7_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_7_exception <= io_enq_bits_uop_exception;
      uops_7_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_7_bypassable <= io_enq_bits_uop_bypassable;
      uops_7_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_7_mem_size <= io_enq_bits_uop_mem_size;
      uops_7_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_7_is_fence <= io_enq_bits_uop_is_fence;
      uops_7_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_7_is_amo <= io_enq_bits_uop_is_amo;
      uops_7_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_7_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_7_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_7_is_unique <= io_enq_bits_uop_is_unique;
      uops_7_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_7_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_7_ldst <= io_enq_bits_uop_ldst;
      uops_7_lrs1 <= io_enq_bits_uop_lrs1;
      uops_7_lrs2 <= io_enq_bits_uop_lrs2;
      uops_7_lrs3 <= io_enq_bits_uop_lrs3;
      uops_7_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_7_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_7_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_7_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_7_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_7_fp_val <= io_enq_bits_uop_fp_val;
      uops_7_fp_single <= io_enq_bits_uop_fp_single;
      uops_7_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_7_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_7_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_7_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_7_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_7_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_7_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN_13)
      uops_7_br_mask <= _uops_br_mask_T_1;
    else
      uops_7_br_mask <= ({20{~valids_7}} | ~io_brupdate_b1_resolve_mask) & uops_7_br_mask;
    if (_GEN_16) begin
      uops_8_uopc <= io_enq_bits_uop_uopc;
      uops_8_inst <= io_enq_bits_uop_inst;
      uops_8_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_8_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_8_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_8_iq_type <= io_enq_bits_uop_iq_type;
      uops_8_fu_code <= io_enq_bits_uop_fu_code;
      uops_8_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_8_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_8_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_8_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_8_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_8_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_8_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_8_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_8_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_8_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_8_iw_state <= io_enq_bits_uop_iw_state;
      uops_8_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_8_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_8_is_br <= io_enq_bits_uop_is_br;
      uops_8_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_8_is_jal <= io_enq_bits_uop_is_jal;
      uops_8_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_8_br_tag <= io_enq_bits_uop_br_tag;
      uops_8_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_8_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_8_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_8_taken <= io_enq_bits_uop_taken;
      uops_8_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_8_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_8_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_8_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_8_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_8_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_8_pdst <= io_enq_bits_uop_pdst;
      uops_8_prs1 <= io_enq_bits_uop_prs1;
      uops_8_prs2 <= io_enq_bits_uop_prs2;
      uops_8_prs3 <= io_enq_bits_uop_prs3;
      uops_8_ppred <= io_enq_bits_uop_ppred;
      uops_8_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_8_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_8_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_8_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_8_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_8_exception <= io_enq_bits_uop_exception;
      uops_8_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_8_bypassable <= io_enq_bits_uop_bypassable;
      uops_8_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_8_mem_size <= io_enq_bits_uop_mem_size;
      uops_8_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_8_is_fence <= io_enq_bits_uop_is_fence;
      uops_8_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_8_is_amo <= io_enq_bits_uop_is_amo;
      uops_8_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_8_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_8_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_8_is_unique <= io_enq_bits_uop_is_unique;
      uops_8_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_8_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_8_ldst <= io_enq_bits_uop_ldst;
      uops_8_lrs1 <= io_enq_bits_uop_lrs1;
      uops_8_lrs2 <= io_enq_bits_uop_lrs2;
      uops_8_lrs3 <= io_enq_bits_uop_lrs3;
      uops_8_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_8_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_8_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_8_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_8_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_8_fp_val <= io_enq_bits_uop_fp_val;
      uops_8_fp_single <= io_enq_bits_uop_fp_single;
      uops_8_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_8_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_8_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_8_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_8_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_8_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_8_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN_15)
      uops_8_br_mask <= _uops_br_mask_T_1;
    else
      uops_8_br_mask <= ({20{~valids_8}} | ~io_brupdate_b1_resolve_mask) & uops_8_br_mask;
    if (_GEN_18) begin
      uops_9_uopc <= io_enq_bits_uop_uopc;
      uops_9_inst <= io_enq_bits_uop_inst;
      uops_9_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_9_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_9_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_9_iq_type <= io_enq_bits_uop_iq_type;
      uops_9_fu_code <= io_enq_bits_uop_fu_code;
      uops_9_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_9_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_9_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_9_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_9_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_9_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_9_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_9_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_9_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_9_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_9_iw_state <= io_enq_bits_uop_iw_state;
      uops_9_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_9_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_9_is_br <= io_enq_bits_uop_is_br;
      uops_9_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_9_is_jal <= io_enq_bits_uop_is_jal;
      uops_9_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_9_br_tag <= io_enq_bits_uop_br_tag;
      uops_9_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_9_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_9_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_9_taken <= io_enq_bits_uop_taken;
      uops_9_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_9_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_9_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_9_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_9_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_9_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_9_pdst <= io_enq_bits_uop_pdst;
      uops_9_prs1 <= io_enq_bits_uop_prs1;
      uops_9_prs2 <= io_enq_bits_uop_prs2;
      uops_9_prs3 <= io_enq_bits_uop_prs3;
      uops_9_ppred <= io_enq_bits_uop_ppred;
      uops_9_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_9_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_9_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_9_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_9_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_9_exception <= io_enq_bits_uop_exception;
      uops_9_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_9_bypassable <= io_enq_bits_uop_bypassable;
      uops_9_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_9_mem_size <= io_enq_bits_uop_mem_size;
      uops_9_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_9_is_fence <= io_enq_bits_uop_is_fence;
      uops_9_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_9_is_amo <= io_enq_bits_uop_is_amo;
      uops_9_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_9_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_9_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_9_is_unique <= io_enq_bits_uop_is_unique;
      uops_9_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_9_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_9_ldst <= io_enq_bits_uop_ldst;
      uops_9_lrs1 <= io_enq_bits_uop_lrs1;
      uops_9_lrs2 <= io_enq_bits_uop_lrs2;
      uops_9_lrs3 <= io_enq_bits_uop_lrs3;
      uops_9_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_9_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_9_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_9_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_9_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_9_fp_val <= io_enq_bits_uop_fp_val;
      uops_9_fp_single <= io_enq_bits_uop_fp_single;
      uops_9_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_9_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_9_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_9_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_9_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_9_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_9_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN_17)
      uops_9_br_mask <= _uops_br_mask_T_1;
    else
      uops_9_br_mask <= ({20{~valids_9}} | ~io_brupdate_b1_resolve_mask) & uops_9_br_mask;
    if (_GEN_20) begin
      uops_10_uopc <= io_enq_bits_uop_uopc;
      uops_10_inst <= io_enq_bits_uop_inst;
      uops_10_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_10_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_10_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_10_iq_type <= io_enq_bits_uop_iq_type;
      uops_10_fu_code <= io_enq_bits_uop_fu_code;
      uops_10_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_10_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_10_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_10_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_10_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_10_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_10_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_10_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_10_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_10_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_10_iw_state <= io_enq_bits_uop_iw_state;
      uops_10_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_10_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_10_is_br <= io_enq_bits_uop_is_br;
      uops_10_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_10_is_jal <= io_enq_bits_uop_is_jal;
      uops_10_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_10_br_tag <= io_enq_bits_uop_br_tag;
      uops_10_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_10_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_10_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_10_taken <= io_enq_bits_uop_taken;
      uops_10_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_10_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_10_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_10_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_10_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_10_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_10_pdst <= io_enq_bits_uop_pdst;
      uops_10_prs1 <= io_enq_bits_uop_prs1;
      uops_10_prs2 <= io_enq_bits_uop_prs2;
      uops_10_prs3 <= io_enq_bits_uop_prs3;
      uops_10_ppred <= io_enq_bits_uop_ppred;
      uops_10_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_10_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_10_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_10_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_10_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_10_exception <= io_enq_bits_uop_exception;
      uops_10_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_10_bypassable <= io_enq_bits_uop_bypassable;
      uops_10_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_10_mem_size <= io_enq_bits_uop_mem_size;
      uops_10_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_10_is_fence <= io_enq_bits_uop_is_fence;
      uops_10_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_10_is_amo <= io_enq_bits_uop_is_amo;
      uops_10_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_10_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_10_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_10_is_unique <= io_enq_bits_uop_is_unique;
      uops_10_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_10_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_10_ldst <= io_enq_bits_uop_ldst;
      uops_10_lrs1 <= io_enq_bits_uop_lrs1;
      uops_10_lrs2 <= io_enq_bits_uop_lrs2;
      uops_10_lrs3 <= io_enq_bits_uop_lrs3;
      uops_10_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_10_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_10_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_10_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_10_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_10_fp_val <= io_enq_bits_uop_fp_val;
      uops_10_fp_single <= io_enq_bits_uop_fp_single;
      uops_10_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_10_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_10_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_10_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_10_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_10_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_10_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN_19)
      uops_10_br_mask <= _uops_br_mask_T_1;
    else
      uops_10_br_mask <= ({20{~valids_10}} | ~io_brupdate_b1_resolve_mask) & uops_10_br_mask;
    if (_GEN_22) begin
      uops_11_uopc <= io_enq_bits_uop_uopc;
      uops_11_inst <= io_enq_bits_uop_inst;
      uops_11_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_11_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_11_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_11_iq_type <= io_enq_bits_uop_iq_type;
      uops_11_fu_code <= io_enq_bits_uop_fu_code;
      uops_11_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_11_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_11_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_11_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_11_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_11_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_11_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_11_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_11_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_11_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_11_iw_state <= io_enq_bits_uop_iw_state;
      uops_11_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_11_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_11_is_br <= io_enq_bits_uop_is_br;
      uops_11_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_11_is_jal <= io_enq_bits_uop_is_jal;
      uops_11_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_11_br_tag <= io_enq_bits_uop_br_tag;
      uops_11_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_11_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_11_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_11_taken <= io_enq_bits_uop_taken;
      uops_11_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_11_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_11_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_11_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_11_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_11_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_11_pdst <= io_enq_bits_uop_pdst;
      uops_11_prs1 <= io_enq_bits_uop_prs1;
      uops_11_prs2 <= io_enq_bits_uop_prs2;
      uops_11_prs3 <= io_enq_bits_uop_prs3;
      uops_11_ppred <= io_enq_bits_uop_ppred;
      uops_11_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_11_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_11_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_11_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_11_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_11_exception <= io_enq_bits_uop_exception;
      uops_11_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_11_bypassable <= io_enq_bits_uop_bypassable;
      uops_11_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_11_mem_size <= io_enq_bits_uop_mem_size;
      uops_11_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_11_is_fence <= io_enq_bits_uop_is_fence;
      uops_11_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_11_is_amo <= io_enq_bits_uop_is_amo;
      uops_11_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_11_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_11_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_11_is_unique <= io_enq_bits_uop_is_unique;
      uops_11_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_11_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_11_ldst <= io_enq_bits_uop_ldst;
      uops_11_lrs1 <= io_enq_bits_uop_lrs1;
      uops_11_lrs2 <= io_enq_bits_uop_lrs2;
      uops_11_lrs3 <= io_enq_bits_uop_lrs3;
      uops_11_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_11_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_11_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_11_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_11_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_11_fp_val <= io_enq_bits_uop_fp_val;
      uops_11_fp_single <= io_enq_bits_uop_fp_single;
      uops_11_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_11_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_11_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_11_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_11_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_11_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_11_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN_21)
      uops_11_br_mask <= _uops_br_mask_T_1;
    else
      uops_11_br_mask <= ({20{~valids_11}} | ~io_brupdate_b1_resolve_mask) & uops_11_br_mask;
    if (_GEN_24) begin
      uops_12_uopc <= io_enq_bits_uop_uopc;
      uops_12_inst <= io_enq_bits_uop_inst;
      uops_12_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_12_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_12_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_12_iq_type <= io_enq_bits_uop_iq_type;
      uops_12_fu_code <= io_enq_bits_uop_fu_code;
      uops_12_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_12_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_12_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_12_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_12_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_12_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_12_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_12_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_12_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_12_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_12_iw_state <= io_enq_bits_uop_iw_state;
      uops_12_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_12_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_12_is_br <= io_enq_bits_uop_is_br;
      uops_12_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_12_is_jal <= io_enq_bits_uop_is_jal;
      uops_12_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_12_br_tag <= io_enq_bits_uop_br_tag;
      uops_12_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_12_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_12_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_12_taken <= io_enq_bits_uop_taken;
      uops_12_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_12_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_12_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_12_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_12_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_12_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_12_pdst <= io_enq_bits_uop_pdst;
      uops_12_prs1 <= io_enq_bits_uop_prs1;
      uops_12_prs2 <= io_enq_bits_uop_prs2;
      uops_12_prs3 <= io_enq_bits_uop_prs3;
      uops_12_ppred <= io_enq_bits_uop_ppred;
      uops_12_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_12_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_12_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_12_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_12_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_12_exception <= io_enq_bits_uop_exception;
      uops_12_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_12_bypassable <= io_enq_bits_uop_bypassable;
      uops_12_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_12_mem_size <= io_enq_bits_uop_mem_size;
      uops_12_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_12_is_fence <= io_enq_bits_uop_is_fence;
      uops_12_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_12_is_amo <= io_enq_bits_uop_is_amo;
      uops_12_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_12_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_12_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_12_is_unique <= io_enq_bits_uop_is_unique;
      uops_12_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_12_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_12_ldst <= io_enq_bits_uop_ldst;
      uops_12_lrs1 <= io_enq_bits_uop_lrs1;
      uops_12_lrs2 <= io_enq_bits_uop_lrs2;
      uops_12_lrs3 <= io_enq_bits_uop_lrs3;
      uops_12_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_12_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_12_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_12_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_12_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_12_fp_val <= io_enq_bits_uop_fp_val;
      uops_12_fp_single <= io_enq_bits_uop_fp_single;
      uops_12_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_12_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_12_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_12_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_12_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_12_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_12_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN_23)
      uops_12_br_mask <= _uops_br_mask_T_1;
    else
      uops_12_br_mask <= ({20{~valids_12}} | ~io_brupdate_b1_resolve_mask) & uops_12_br_mask;
    if (_GEN_26) begin
      uops_13_uopc <= io_enq_bits_uop_uopc;
      uops_13_inst <= io_enq_bits_uop_inst;
      uops_13_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_13_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_13_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_13_iq_type <= io_enq_bits_uop_iq_type;
      uops_13_fu_code <= io_enq_bits_uop_fu_code;
      uops_13_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_13_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_13_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_13_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_13_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_13_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_13_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_13_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_13_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_13_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_13_iw_state <= io_enq_bits_uop_iw_state;
      uops_13_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_13_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_13_is_br <= io_enq_bits_uop_is_br;
      uops_13_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_13_is_jal <= io_enq_bits_uop_is_jal;
      uops_13_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_13_br_tag <= io_enq_bits_uop_br_tag;
      uops_13_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_13_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_13_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_13_taken <= io_enq_bits_uop_taken;
      uops_13_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_13_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_13_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_13_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_13_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_13_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_13_pdst <= io_enq_bits_uop_pdst;
      uops_13_prs1 <= io_enq_bits_uop_prs1;
      uops_13_prs2 <= io_enq_bits_uop_prs2;
      uops_13_prs3 <= io_enq_bits_uop_prs3;
      uops_13_ppred <= io_enq_bits_uop_ppred;
      uops_13_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_13_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_13_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_13_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_13_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_13_exception <= io_enq_bits_uop_exception;
      uops_13_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_13_bypassable <= io_enq_bits_uop_bypassable;
      uops_13_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_13_mem_size <= io_enq_bits_uop_mem_size;
      uops_13_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_13_is_fence <= io_enq_bits_uop_is_fence;
      uops_13_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_13_is_amo <= io_enq_bits_uop_is_amo;
      uops_13_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_13_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_13_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_13_is_unique <= io_enq_bits_uop_is_unique;
      uops_13_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_13_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_13_ldst <= io_enq_bits_uop_ldst;
      uops_13_lrs1 <= io_enq_bits_uop_lrs1;
      uops_13_lrs2 <= io_enq_bits_uop_lrs2;
      uops_13_lrs3 <= io_enq_bits_uop_lrs3;
      uops_13_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_13_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_13_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_13_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_13_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_13_fp_val <= io_enq_bits_uop_fp_val;
      uops_13_fp_single <= io_enq_bits_uop_fp_single;
      uops_13_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_13_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_13_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_13_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_13_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_13_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_13_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN_25)
      uops_13_br_mask <= _uops_br_mask_T_1;
    else
      uops_13_br_mask <= ({20{~valids_13}} | ~io_brupdate_b1_resolve_mask) & uops_13_br_mask;
    if (_GEN_28) begin
      uops_14_uopc <= io_enq_bits_uop_uopc;
      uops_14_inst <= io_enq_bits_uop_inst;
      uops_14_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_14_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_14_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_14_iq_type <= io_enq_bits_uop_iq_type;
      uops_14_fu_code <= io_enq_bits_uop_fu_code;
      uops_14_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_14_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_14_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_14_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_14_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_14_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_14_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_14_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_14_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_14_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_14_iw_state <= io_enq_bits_uop_iw_state;
      uops_14_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_14_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_14_is_br <= io_enq_bits_uop_is_br;
      uops_14_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_14_is_jal <= io_enq_bits_uop_is_jal;
      uops_14_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_14_br_tag <= io_enq_bits_uop_br_tag;
      uops_14_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_14_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_14_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_14_taken <= io_enq_bits_uop_taken;
      uops_14_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_14_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_14_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_14_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_14_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_14_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_14_pdst <= io_enq_bits_uop_pdst;
      uops_14_prs1 <= io_enq_bits_uop_prs1;
      uops_14_prs2 <= io_enq_bits_uop_prs2;
      uops_14_prs3 <= io_enq_bits_uop_prs3;
      uops_14_ppred <= io_enq_bits_uop_ppred;
      uops_14_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_14_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_14_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_14_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_14_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_14_exception <= io_enq_bits_uop_exception;
      uops_14_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_14_bypassable <= io_enq_bits_uop_bypassable;
      uops_14_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_14_mem_size <= io_enq_bits_uop_mem_size;
      uops_14_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_14_is_fence <= io_enq_bits_uop_is_fence;
      uops_14_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_14_is_amo <= io_enq_bits_uop_is_amo;
      uops_14_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_14_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_14_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_14_is_unique <= io_enq_bits_uop_is_unique;
      uops_14_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_14_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_14_ldst <= io_enq_bits_uop_ldst;
      uops_14_lrs1 <= io_enq_bits_uop_lrs1;
      uops_14_lrs2 <= io_enq_bits_uop_lrs2;
      uops_14_lrs3 <= io_enq_bits_uop_lrs3;
      uops_14_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_14_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_14_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_14_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_14_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_14_fp_val <= io_enq_bits_uop_fp_val;
      uops_14_fp_single <= io_enq_bits_uop_fp_single;
      uops_14_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_14_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_14_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_14_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_14_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_14_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_14_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & _GEN_27)
      uops_14_br_mask <= _uops_br_mask_T_1;
    else
      uops_14_br_mask <= ({20{~valids_14}} | ~io_brupdate_b1_resolve_mask) & uops_14_br_mask;
    if (_GEN_29) begin
      uops_15_uopc <= io_enq_bits_uop_uopc;
      uops_15_inst <= io_enq_bits_uop_inst;
      uops_15_debug_inst <= io_enq_bits_uop_debug_inst;
      uops_15_is_rvc <= io_enq_bits_uop_is_rvc;
      uops_15_debug_pc <= io_enq_bits_uop_debug_pc;
      uops_15_iq_type <= io_enq_bits_uop_iq_type;
      uops_15_fu_code <= io_enq_bits_uop_fu_code;
      uops_15_ctrl_br_type <= io_enq_bits_uop_ctrl_br_type;
      uops_15_ctrl_op1_sel <= io_enq_bits_uop_ctrl_op1_sel;
      uops_15_ctrl_op2_sel <= io_enq_bits_uop_ctrl_op2_sel;
      uops_15_ctrl_imm_sel <= io_enq_bits_uop_ctrl_imm_sel;
      uops_15_ctrl_op_fcn <= io_enq_bits_uop_ctrl_op_fcn;
      uops_15_ctrl_fcn_dw <= io_enq_bits_uop_ctrl_fcn_dw;
      uops_15_ctrl_csr_cmd <= io_enq_bits_uop_ctrl_csr_cmd;
      uops_15_ctrl_is_load <= io_enq_bits_uop_ctrl_is_load;
      uops_15_ctrl_is_sta <= io_enq_bits_uop_ctrl_is_sta;
      uops_15_ctrl_is_std <= io_enq_bits_uop_ctrl_is_std;
      uops_15_iw_state <= io_enq_bits_uop_iw_state;
      uops_15_iw_p1_poisoned <= io_enq_bits_uop_iw_p1_poisoned;
      uops_15_iw_p2_poisoned <= io_enq_bits_uop_iw_p2_poisoned;
      uops_15_is_br <= io_enq_bits_uop_is_br;
      uops_15_is_jalr <= io_enq_bits_uop_is_jalr;
      uops_15_is_jal <= io_enq_bits_uop_is_jal;
      uops_15_is_sfb <= io_enq_bits_uop_is_sfb;
      uops_15_br_tag <= io_enq_bits_uop_br_tag;
      uops_15_ftq_idx <= io_enq_bits_uop_ftq_idx;
      uops_15_edge_inst <= io_enq_bits_uop_edge_inst;
      uops_15_pc_lob <= io_enq_bits_uop_pc_lob;
      uops_15_taken <= io_enq_bits_uop_taken;
      uops_15_imm_packed <= io_enq_bits_uop_imm_packed;
      uops_15_csr_addr <= io_enq_bits_uop_csr_addr;
      uops_15_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_15_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_15_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_15_rxq_idx <= io_enq_bits_uop_rxq_idx;
      uops_15_pdst <= io_enq_bits_uop_pdst;
      uops_15_prs1 <= io_enq_bits_uop_prs1;
      uops_15_prs2 <= io_enq_bits_uop_prs2;
      uops_15_prs3 <= io_enq_bits_uop_prs3;
      uops_15_ppred <= io_enq_bits_uop_ppred;
      uops_15_prs1_busy <= io_enq_bits_uop_prs1_busy;
      uops_15_prs2_busy <= io_enq_bits_uop_prs2_busy;
      uops_15_prs3_busy <= io_enq_bits_uop_prs3_busy;
      uops_15_ppred_busy <= io_enq_bits_uop_ppred_busy;
      uops_15_stale_pdst <= io_enq_bits_uop_stale_pdst;
      uops_15_exception <= io_enq_bits_uop_exception;
      uops_15_exc_cause <= io_enq_bits_uop_exc_cause;
      uops_15_bypassable <= io_enq_bits_uop_bypassable;
      uops_15_mem_cmd <= io_enq_bits_uop_mem_cmd;
      uops_15_mem_size <= io_enq_bits_uop_mem_size;
      uops_15_mem_signed <= io_enq_bits_uop_mem_signed;
      uops_15_is_fence <= io_enq_bits_uop_is_fence;
      uops_15_is_fencei <= io_enq_bits_uop_is_fencei;
      uops_15_is_amo <= io_enq_bits_uop_is_amo;
      uops_15_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_15_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_15_is_sys_pc2epc <= io_enq_bits_uop_is_sys_pc2epc;
      uops_15_is_unique <= io_enq_bits_uop_is_unique;
      uops_15_flush_on_commit <= io_enq_bits_uop_flush_on_commit;
      uops_15_ldst_is_rs1 <= io_enq_bits_uop_ldst_is_rs1;
      uops_15_ldst <= io_enq_bits_uop_ldst;
      uops_15_lrs1 <= io_enq_bits_uop_lrs1;
      uops_15_lrs2 <= io_enq_bits_uop_lrs2;
      uops_15_lrs3 <= io_enq_bits_uop_lrs3;
      uops_15_ldst_val <= io_enq_bits_uop_ldst_val;
      uops_15_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_15_lrs1_rtype <= io_enq_bits_uop_lrs1_rtype;
      uops_15_lrs2_rtype <= io_enq_bits_uop_lrs2_rtype;
      uops_15_frs3_en <= io_enq_bits_uop_frs3_en;
      uops_15_fp_val <= io_enq_bits_uop_fp_val;
      uops_15_fp_single <= io_enq_bits_uop_fp_single;
      uops_15_xcpt_pf_if <= io_enq_bits_uop_xcpt_pf_if;
      uops_15_xcpt_ae_if <= io_enq_bits_uop_xcpt_ae_if;
      uops_15_xcpt_ma_if <= io_enq_bits_uop_xcpt_ma_if;
      uops_15_bp_debug_if <= io_enq_bits_uop_bp_debug_if;
      uops_15_bp_xcpt_if <= io_enq_bits_uop_bp_xcpt_if;
      uops_15_debug_fsrc <= io_enq_bits_uop_debug_fsrc;
      uops_15_debug_tsrc <= io_enq_bits_uop_debug_tsrc;
    end
    if (do_enq & (&enq_ptr_value))
      uops_15_br_mask <= _uops_br_mask_T_1;
    else
      uops_15_br_mask <= ({20{~valids_15}} | ~io_brupdate_b1_resolve_mask) & uops_15_br_mask;
  end // always @(posedge)
  ram_16x46 ram_ext (
    .R0_addr (deq_ptr_value),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_ram_ext_R0_data),
    .W0_addr (enq_ptr_value),
    .W0_en   (do_enq),
    .W0_clk  (clock),
    .W0_data ({io_enq_bits_sdq_id, io_enq_bits_is_hella, io_enq_bits_addr})
  );
  assign io_enq_ready = ~full;
  assign io_deq_valid = ~_io_empty_output & casez_tmp & (io_brupdate_b1_mispredict_mask & casez_tmp_24) == 20'h0 & ~(io_flush & casez_tmp_55);
  assign io_deq_bits_uop_uopc = casez_tmp_0;
  assign io_deq_bits_uop_inst = casez_tmp_1;
  assign io_deq_bits_uop_debug_inst = casez_tmp_2;
  assign io_deq_bits_uop_is_rvc = casez_tmp_3;
  assign io_deq_bits_uop_debug_pc = casez_tmp_4;
  assign io_deq_bits_uop_iq_type = casez_tmp_5;
  assign io_deq_bits_uop_fu_code = casez_tmp_6;
  assign io_deq_bits_uop_ctrl_br_type = casez_tmp_7;
  assign io_deq_bits_uop_ctrl_op1_sel = casez_tmp_8;
  assign io_deq_bits_uop_ctrl_op2_sel = casez_tmp_9;
  assign io_deq_bits_uop_ctrl_imm_sel = casez_tmp_10;
  assign io_deq_bits_uop_ctrl_op_fcn = casez_tmp_11;
  assign io_deq_bits_uop_ctrl_fcn_dw = casez_tmp_12;
  assign io_deq_bits_uop_ctrl_csr_cmd = casez_tmp_13;
  assign io_deq_bits_uop_ctrl_is_load = casez_tmp_14;
  assign io_deq_bits_uop_ctrl_is_sta = casez_tmp_15;
  assign io_deq_bits_uop_ctrl_is_std = casez_tmp_16;
  assign io_deq_bits_uop_iw_state = casez_tmp_17;
  assign io_deq_bits_uop_iw_p1_poisoned = casez_tmp_18;
  assign io_deq_bits_uop_iw_p2_poisoned = casez_tmp_19;
  assign io_deq_bits_uop_is_br = casez_tmp_20;
  assign io_deq_bits_uop_is_jalr = casez_tmp_21;
  assign io_deq_bits_uop_is_jal = casez_tmp_22;
  assign io_deq_bits_uop_is_sfb = casez_tmp_23;
  assign io_deq_bits_uop_br_mask = casez_tmp_24 & ~io_brupdate_b1_resolve_mask;
  assign io_deq_bits_uop_br_tag = casez_tmp_25;
  assign io_deq_bits_uop_ftq_idx = casez_tmp_26;
  assign io_deq_bits_uop_edge_inst = casez_tmp_27;
  assign io_deq_bits_uop_pc_lob = casez_tmp_28;
  assign io_deq_bits_uop_taken = casez_tmp_29;
  assign io_deq_bits_uop_imm_packed = casez_tmp_30;
  assign io_deq_bits_uop_csr_addr = casez_tmp_31;
  assign io_deq_bits_uop_rob_idx = casez_tmp_32;
  assign io_deq_bits_uop_ldq_idx = casez_tmp_33;
  assign io_deq_bits_uop_stq_idx = casez_tmp_34;
  assign io_deq_bits_uop_rxq_idx = casez_tmp_35;
  assign io_deq_bits_uop_pdst = casez_tmp_36;
  assign io_deq_bits_uop_prs1 = casez_tmp_37;
  assign io_deq_bits_uop_prs2 = casez_tmp_38;
  assign io_deq_bits_uop_prs3 = casez_tmp_39;
  assign io_deq_bits_uop_ppred = casez_tmp_40;
  assign io_deq_bits_uop_prs1_busy = casez_tmp_41;
  assign io_deq_bits_uop_prs2_busy = casez_tmp_42;
  assign io_deq_bits_uop_prs3_busy = casez_tmp_43;
  assign io_deq_bits_uop_ppred_busy = casez_tmp_44;
  assign io_deq_bits_uop_stale_pdst = casez_tmp_45;
  assign io_deq_bits_uop_exception = casez_tmp_46;
  assign io_deq_bits_uop_exc_cause = casez_tmp_47;
  assign io_deq_bits_uop_bypassable = casez_tmp_48;
  assign io_deq_bits_uop_mem_cmd = casez_tmp_49;
  assign io_deq_bits_uop_mem_size = casez_tmp_50;
  assign io_deq_bits_uop_mem_signed = casez_tmp_51;
  assign io_deq_bits_uop_is_fence = casez_tmp_52;
  assign io_deq_bits_uop_is_fencei = casez_tmp_53;
  assign io_deq_bits_uop_is_amo = casez_tmp_54;
  assign io_deq_bits_uop_uses_ldq = casez_tmp_55;
  assign io_deq_bits_uop_uses_stq = casez_tmp_56;
  assign io_deq_bits_uop_is_sys_pc2epc = casez_tmp_57;
  assign io_deq_bits_uop_is_unique = casez_tmp_58;
  assign io_deq_bits_uop_flush_on_commit = casez_tmp_59;
  assign io_deq_bits_uop_ldst_is_rs1 = casez_tmp_60;
  assign io_deq_bits_uop_ldst = casez_tmp_61;
  assign io_deq_bits_uop_lrs1 = casez_tmp_62;
  assign io_deq_bits_uop_lrs2 = casez_tmp_63;
  assign io_deq_bits_uop_lrs3 = casez_tmp_64;
  assign io_deq_bits_uop_ldst_val = casez_tmp_65;
  assign io_deq_bits_uop_dst_rtype = casez_tmp_66;
  assign io_deq_bits_uop_lrs1_rtype = casez_tmp_67;
  assign io_deq_bits_uop_lrs2_rtype = casez_tmp_68;
  assign io_deq_bits_uop_frs3_en = casez_tmp_69;
  assign io_deq_bits_uop_fp_val = casez_tmp_70;
  assign io_deq_bits_uop_fp_single = casez_tmp_71;
  assign io_deq_bits_uop_xcpt_pf_if = casez_tmp_72;
  assign io_deq_bits_uop_xcpt_ae_if = casez_tmp_73;
  assign io_deq_bits_uop_xcpt_ma_if = casez_tmp_74;
  assign io_deq_bits_uop_bp_debug_if = casez_tmp_75;
  assign io_deq_bits_uop_bp_xcpt_if = casez_tmp_76;
  assign io_deq_bits_uop_debug_fsrc = casez_tmp_77;
  assign io_deq_bits_uop_debug_tsrc = casez_tmp_78;
  assign io_deq_bits_addr = _ram_ext_R0_data[39:0];
  assign io_deq_bits_is_hella = _ram_ext_R0_data[40];
  assign io_deq_bits_sdq_id = _ram_ext_R0_data[45:41];
  assign io_empty = _io_empty_output;
endmodule

