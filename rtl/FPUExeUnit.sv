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

module FPUExeUnit(
  input         clock,
                reset,
  output [9:0]  io_fu_types,
  input         io_req_valid,
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
  input         io_req_bits_uop_iw_p1_poisoned,
                io_req_bits_uop_iw_p2_poisoned,
                io_req_bits_uop_is_br,
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
                io_req_bits_rs2_data,
                io_req_bits_rs3_data,
  input         io_req_bits_kill,
  output        io_fresp_valid,
  output [6:0]  io_fresp_bits_uop_rob_idx,
                io_fresp_bits_uop_pdst,
  output        io_fresp_bits_uop_is_amo,
                io_fresp_bits_uop_uses_ldq,
                io_fresp_bits_uop_uses_stq,
  output [1:0]  io_fresp_bits_uop_dst_rtype,
  output        io_fresp_bits_uop_fp_val,
  output [64:0] io_fresp_bits_data,
  output        io_fresp_bits_fflags_valid,
  output [6:0]  io_fresp_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_fresp_bits_fflags_bits_flags,
  input         io_ll_iresp_ready,
  output        io_ll_iresp_valid,
  output [6:0]  io_ll_iresp_bits_uop_uopc,
  output [19:0] io_ll_iresp_bits_uop_br_mask,
  output [6:0]  io_ll_iresp_bits_uop_rob_idx,
  output [4:0]  io_ll_iresp_bits_uop_stq_idx,
  output [6:0]  io_ll_iresp_bits_uop_pdst,
  output        io_ll_iresp_bits_uop_is_amo,
                io_ll_iresp_bits_uop_uses_stq,
  output [1:0]  io_ll_iresp_bits_uop_dst_rtype,
  output [64:0] io_ll_iresp_bits_data,
  output        io_ll_iresp_bits_predicated,
  input  [19:0] io_brupdate_b1_resolve_mask,
                io_brupdate_b1_mispredict_mask,
  input  [2:0]  io_fcsr_rm
);

  wire        _fpiu_busy_T;
  wire        fdiv_busy;
  wire        _resp_arb_io_in_0_ready;
  wire        _resp_arb_io_in_1_ready;
  wire        _fp_sdq_io_enq_ready;
  wire        _fp_sdq_io_deq_valid;
  wire [6:0]  _fp_sdq_io_deq_bits_uop_uopc;
  wire [19:0] _fp_sdq_io_deq_bits_uop_br_mask;
  wire [6:0]  _fp_sdq_io_deq_bits_uop_rob_idx;
  wire [4:0]  _fp_sdq_io_deq_bits_uop_stq_idx;
  wire [6:0]  _fp_sdq_io_deq_bits_uop_pdst;
  wire        _fp_sdq_io_deq_bits_uop_is_amo;
  wire        _fp_sdq_io_deq_bits_uop_uses_stq;
  wire [1:0]  _fp_sdq_io_deq_bits_uop_dst_rtype;
  wire        _fp_sdq_io_deq_bits_uop_fp_val;
  wire [64:0] _fp_sdq_io_deq_bits_data;
  wire        _fp_sdq_io_deq_bits_predicated;
  wire        _fp_sdq_io_deq_bits_fflags_valid;
  wire [6:0]  _fp_sdq_io_deq_bits_fflags_bits_uop_rob_idx;
  wire [4:0]  _fp_sdq_io_deq_bits_fflags_bits_flags;
  wire        _fp_sdq_io_empty;
  wire        _queue_io_enq_ready;
  wire        _queue_io_deq_valid;
  wire [6:0]  _queue_io_deq_bits_uop_uopc;
  wire [19:0] _queue_io_deq_bits_uop_br_mask;
  wire [6:0]  _queue_io_deq_bits_uop_rob_idx;
  wire [4:0]  _queue_io_deq_bits_uop_stq_idx;
  wire [6:0]  _queue_io_deq_bits_uop_pdst;
  wire        _queue_io_deq_bits_uop_is_amo;
  wire        _queue_io_deq_bits_uop_uses_stq;
  wire [1:0]  _queue_io_deq_bits_uop_dst_rtype;
  wire        _queue_io_deq_bits_uop_fp_val;
  wire [64:0] _queue_io_deq_bits_data;
  wire        _queue_io_deq_bits_predicated;
  wire        _queue_io_deq_bits_fflags_valid;
  wire [6:0]  _queue_io_deq_bits_fflags_bits_uop_rob_idx;
  wire [4:0]  _queue_io_deq_bits_fflags_bits_flags;
  wire        _queue_io_empty;
  wire        _FDivSqrtUnit_io_req_ready;
  wire        _FDivSqrtUnit_io_resp_valid;
  wire [6:0]  _FDivSqrtUnit_io_resp_bits_uop_rob_idx;
  wire [6:0]  _FDivSqrtUnit_io_resp_bits_uop_pdst;
  wire        _FDivSqrtUnit_io_resp_bits_uop_is_amo;
  wire        _FDivSqrtUnit_io_resp_bits_uop_uses_ldq;
  wire        _FDivSqrtUnit_io_resp_bits_uop_uses_stq;
  wire [1:0]  _FDivSqrtUnit_io_resp_bits_uop_dst_rtype;
  wire        _FDivSqrtUnit_io_resp_bits_uop_fp_val;
  wire [64:0] _FDivSqrtUnit_io_resp_bits_data;
  wire        _FDivSqrtUnit_io_resp_bits_fflags_valid;
  wire [6:0]  _FDivSqrtUnit_io_resp_bits_fflags_bits_uop_rob_idx;
  wire [4:0]  _FDivSqrtUnit_io_resp_bits_fflags_bits_flags;
  wire        _FPUUnit_io_resp_valid;
  wire [6:0]  _FPUUnit_io_resp_bits_uop_uopc;
  wire [31:0] _FPUUnit_io_resp_bits_uop_inst;
  wire [31:0] _FPUUnit_io_resp_bits_uop_debug_inst;
  wire        _FPUUnit_io_resp_bits_uop_is_rvc;
  wire [39:0] _FPUUnit_io_resp_bits_uop_debug_pc;
  wire [2:0]  _FPUUnit_io_resp_bits_uop_iq_type;
  wire [9:0]  _FPUUnit_io_resp_bits_uop_fu_code;
  wire [3:0]  _FPUUnit_io_resp_bits_uop_ctrl_br_type;
  wire [1:0]  _FPUUnit_io_resp_bits_uop_ctrl_op1_sel;
  wire [2:0]  _FPUUnit_io_resp_bits_uop_ctrl_op2_sel;
  wire [2:0]  _FPUUnit_io_resp_bits_uop_ctrl_imm_sel;
  wire [3:0]  _FPUUnit_io_resp_bits_uop_ctrl_op_fcn;
  wire        _FPUUnit_io_resp_bits_uop_ctrl_fcn_dw;
  wire [2:0]  _FPUUnit_io_resp_bits_uop_ctrl_csr_cmd;
  wire        _FPUUnit_io_resp_bits_uop_ctrl_is_load;
  wire        _FPUUnit_io_resp_bits_uop_ctrl_is_sta;
  wire        _FPUUnit_io_resp_bits_uop_ctrl_is_std;
  wire [1:0]  _FPUUnit_io_resp_bits_uop_iw_state;
  wire        _FPUUnit_io_resp_bits_uop_iw_p1_poisoned;
  wire        _FPUUnit_io_resp_bits_uop_iw_p2_poisoned;
  wire        _FPUUnit_io_resp_bits_uop_is_br;
  wire        _FPUUnit_io_resp_bits_uop_is_jalr;
  wire        _FPUUnit_io_resp_bits_uop_is_jal;
  wire        _FPUUnit_io_resp_bits_uop_is_sfb;
  wire [19:0] _FPUUnit_io_resp_bits_uop_br_mask;
  wire [4:0]  _FPUUnit_io_resp_bits_uop_br_tag;
  wire [5:0]  _FPUUnit_io_resp_bits_uop_ftq_idx;
  wire        _FPUUnit_io_resp_bits_uop_edge_inst;
  wire [5:0]  _FPUUnit_io_resp_bits_uop_pc_lob;
  wire        _FPUUnit_io_resp_bits_uop_taken;
  wire [19:0] _FPUUnit_io_resp_bits_uop_imm_packed;
  wire [11:0] _FPUUnit_io_resp_bits_uop_csr_addr;
  wire [6:0]  _FPUUnit_io_resp_bits_uop_rob_idx;
  wire [4:0]  _FPUUnit_io_resp_bits_uop_ldq_idx;
  wire [4:0]  _FPUUnit_io_resp_bits_uop_stq_idx;
  wire [1:0]  _FPUUnit_io_resp_bits_uop_rxq_idx;
  wire [6:0]  _FPUUnit_io_resp_bits_uop_pdst;
  wire [6:0]  _FPUUnit_io_resp_bits_uop_prs1;
  wire [6:0]  _FPUUnit_io_resp_bits_uop_prs2;
  wire [6:0]  _FPUUnit_io_resp_bits_uop_prs3;
  wire [5:0]  _FPUUnit_io_resp_bits_uop_ppred;
  wire        _FPUUnit_io_resp_bits_uop_prs1_busy;
  wire        _FPUUnit_io_resp_bits_uop_prs2_busy;
  wire        _FPUUnit_io_resp_bits_uop_prs3_busy;
  wire        _FPUUnit_io_resp_bits_uop_ppred_busy;
  wire [6:0]  _FPUUnit_io_resp_bits_uop_stale_pdst;
  wire        _FPUUnit_io_resp_bits_uop_exception;
  wire [63:0] _FPUUnit_io_resp_bits_uop_exc_cause;
  wire        _FPUUnit_io_resp_bits_uop_bypassable;
  wire [4:0]  _FPUUnit_io_resp_bits_uop_mem_cmd;
  wire [1:0]  _FPUUnit_io_resp_bits_uop_mem_size;
  wire        _FPUUnit_io_resp_bits_uop_mem_signed;
  wire        _FPUUnit_io_resp_bits_uop_is_fence;
  wire        _FPUUnit_io_resp_bits_uop_is_fencei;
  wire        _FPUUnit_io_resp_bits_uop_is_amo;
  wire        _FPUUnit_io_resp_bits_uop_uses_ldq;
  wire        _FPUUnit_io_resp_bits_uop_uses_stq;
  wire        _FPUUnit_io_resp_bits_uop_is_sys_pc2epc;
  wire        _FPUUnit_io_resp_bits_uop_is_unique;
  wire        _FPUUnit_io_resp_bits_uop_flush_on_commit;
  wire        _FPUUnit_io_resp_bits_uop_ldst_is_rs1;
  wire [5:0]  _FPUUnit_io_resp_bits_uop_ldst;
  wire [5:0]  _FPUUnit_io_resp_bits_uop_lrs1;
  wire [5:0]  _FPUUnit_io_resp_bits_uop_lrs2;
  wire [5:0]  _FPUUnit_io_resp_bits_uop_lrs3;
  wire        _FPUUnit_io_resp_bits_uop_ldst_val;
  wire [1:0]  _FPUUnit_io_resp_bits_uop_dst_rtype;
  wire [1:0]  _FPUUnit_io_resp_bits_uop_lrs1_rtype;
  wire [1:0]  _FPUUnit_io_resp_bits_uop_lrs2_rtype;
  wire        _FPUUnit_io_resp_bits_uop_frs3_en;
  wire        _FPUUnit_io_resp_bits_uop_fp_val;
  wire        _FPUUnit_io_resp_bits_uop_fp_single;
  wire        _FPUUnit_io_resp_bits_uop_xcpt_pf_if;
  wire        _FPUUnit_io_resp_bits_uop_xcpt_ae_if;
  wire        _FPUUnit_io_resp_bits_uop_xcpt_ma_if;
  wire        _FPUUnit_io_resp_bits_uop_bp_debug_if;
  wire        _FPUUnit_io_resp_bits_uop_bp_xcpt_if;
  wire [1:0]  _FPUUnit_io_resp_bits_uop_debug_fsrc;
  wire [1:0]  _FPUUnit_io_resp_bits_uop_debug_tsrc;
  wire [64:0] _FPUUnit_io_resp_bits_data;
  wire        _FPUUnit_io_resp_bits_fflags_valid;
  wire [6:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_uopc;
  wire [31:0] _FPUUnit_io_resp_bits_fflags_bits_uop_inst;
  wire [31:0] _FPUUnit_io_resp_bits_fflags_bits_uop_debug_inst;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_is_rvc;
  wire [39:0] _FPUUnit_io_resp_bits_fflags_bits_uop_debug_pc;
  wire [2:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_iq_type;
  wire [9:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_fu_code;
  wire [3:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_br_type;
  wire [1:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_op1_sel;
  wire [2:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_op2_sel;
  wire [2:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_imm_sel;
  wire [3:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_op_fcn;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw;
  wire [2:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_is_load;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_is_sta;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_is_std;
  wire [1:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_iw_state;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_iw_p1_poisoned;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_iw_p2_poisoned;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_is_br;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_is_jalr;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_is_jal;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_is_sfb;
  wire [19:0] _FPUUnit_io_resp_bits_fflags_bits_uop_br_mask;
  wire [4:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_br_tag;
  wire [5:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_ftq_idx;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_edge_inst;
  wire [5:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_pc_lob;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_taken;
  wire [19:0] _FPUUnit_io_resp_bits_fflags_bits_uop_imm_packed;
  wire [11:0] _FPUUnit_io_resp_bits_fflags_bits_uop_csr_addr;
  wire [6:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_rob_idx;
  wire [4:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_ldq_idx;
  wire [4:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_stq_idx;
  wire [1:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_rxq_idx;
  wire [6:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_pdst;
  wire [6:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_prs1;
  wire [6:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_prs2;
  wire [6:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_prs3;
  wire [5:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_ppred;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_prs1_busy;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_prs2_busy;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_prs3_busy;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_ppred_busy;
  wire [6:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_stale_pdst;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_exception;
  wire [63:0] _FPUUnit_io_resp_bits_fflags_bits_uop_exc_cause;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_bypassable;
  wire [4:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_mem_cmd;
  wire [1:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_mem_size;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_mem_signed;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_is_fence;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_is_fencei;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_is_amo;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_uses_ldq;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_uses_stq;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_is_sys_pc2epc;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_is_unique;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_flush_on_commit;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_ldst_is_rs1;
  wire [5:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_ldst;
  wire [5:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_lrs1;
  wire [5:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_lrs2;
  wire [5:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_lrs3;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_ldst_val;
  wire [1:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_dst_rtype;
  wire [1:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_lrs1_rtype;
  wire [1:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_lrs2_rtype;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_frs3_en;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_fp_val;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_fp_single;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_xcpt_pf_if;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_xcpt_ae_if;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_xcpt_ma_if;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_bp_debug_if;
  wire        _FPUUnit_io_resp_bits_fflags_bits_uop_bp_xcpt_if;
  wire [1:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_debug_fsrc;
  wire [1:0]  _FPUUnit_io_resp_bits_fflags_bits_uop_debug_tsrc;
  wire [4:0]  _FPUUnit_io_resp_bits_fflags_bits_flags;
  assign fdiv_busy = ~_FDivSqrtUnit_io_req_ready | io_req_valid & io_req_bits_uop_fu_code[7];
  wire        _fp_sdq_io_enq_valid_T_5 = io_req_valid & io_req_bits_uop_uopc == 7'h2 & (io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask) == 20'h0;
  wire        fp_sdq_io_enq_bits_data_unrecoded_rawIn_isInf = (&(io_req_bits_rs2_data[63:62])) & ~(io_req_bits_rs2_data[61]);
  wire        fp_sdq_io_enq_bits_data_unrecoded_isSubnormal = $signed({1'h0, io_req_bits_rs2_data[63:52]}) < 13'sh402;
  wire [52:0] _fp_sdq_io_enq_bits_data_unrecoded_denormFract_T_1 = {1'h0, |(io_req_bits_rs2_data[63:61]), io_req_bits_rs2_data[51:1]} >> 6'h1 - io_req_bits_rs2_data[57:52];
  wire [51:0] fp_sdq_io_enq_bits_data_unrecoded_fractOut = fp_sdq_io_enq_bits_data_unrecoded_isSubnormal ? _fp_sdq_io_enq_bits_data_unrecoded_denormFract_T_1[51:0] : fp_sdq_io_enq_bits_data_unrecoded_rawIn_isInf ? 52'h0 : io_req_bits_rs2_data[51:0];
  wire [1:0]  _fp_sdq_io_enq_bits_data_prevUnrecoded_rawIn_isSpecial_T = {io_req_bits_rs2_data[52], io_req_bits_rs2_data[30]};
  wire        fp_sdq_io_enq_bits_data_prevUnrecoded_rawIn_isInf = (&_fp_sdq_io_enq_bits_data_prevUnrecoded_rawIn_isSpecial_T) & ~(io_req_bits_rs2_data[29]);
  wire        fp_sdq_io_enq_bits_data_prevUnrecoded_isSubnormal = $signed({1'h0, io_req_bits_rs2_data[52], io_req_bits_rs2_data[30:23]}) < 10'sh82;
  wire [23:0] _fp_sdq_io_enq_bits_data_prevUnrecoded_denormFract_T_1 = {1'h0, |{io_req_bits_rs2_data[52], io_req_bits_rs2_data[30:29]}, io_req_bits_rs2_data[22:1]} >> 5'h1 - io_req_bits_rs2_data[27:23];
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~_queue_io_enq_ready) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at execution-unit.scala:550 assert (queue.io.enq.ready) // If this backs up, we've miscalculated the size of the queue.\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & _fp_sdq_io_enq_valid_T_5 & ~_fp_sdq_io_enq_ready) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at execution-unit.scala:562 assert(!(fp_sdq.io.enq.valid && !fp_sdq.io.enq.ready))\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  assign _fpiu_busy_T = _queue_io_empty & _fp_sdq_io_empty;
  FPUUnit FPUUnit (
    .clock                                        (clock),
    .reset                                        (reset),
    .io_req_valid                                 (io_req_valid & (io_req_bits_uop_fu_code[6] | io_req_bits_uop_fu_code[9])),
    .io_req_bits_uop_uopc                         (io_req_bits_uop_uopc),
    .io_req_bits_uop_inst                         (io_req_bits_uop_inst),
    .io_req_bits_uop_debug_inst                   (io_req_bits_uop_debug_inst),
    .io_req_bits_uop_is_rvc                       (io_req_bits_uop_is_rvc),
    .io_req_bits_uop_debug_pc                     (io_req_bits_uop_debug_pc),
    .io_req_bits_uop_iq_type                      (io_req_bits_uop_iq_type),
    .io_req_bits_uop_fu_code                      (io_req_bits_uop_fu_code),
    .io_req_bits_uop_ctrl_br_type                 (io_req_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel                 (io_req_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel                 (io_req_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel                 (io_req_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn                  (io_req_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw                  (io_req_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_ctrl_csr_cmd                 (io_req_bits_uop_ctrl_csr_cmd),
    .io_req_bits_uop_ctrl_is_load                 (io_req_bits_uop_ctrl_is_load),
    .io_req_bits_uop_ctrl_is_sta                  (io_req_bits_uop_ctrl_is_sta),
    .io_req_bits_uop_ctrl_is_std                  (io_req_bits_uop_ctrl_is_std),
    .io_req_bits_uop_iw_state                     (io_req_bits_uop_iw_state),
    .io_req_bits_uop_iw_p1_poisoned               (io_req_bits_uop_iw_p1_poisoned),
    .io_req_bits_uop_iw_p2_poisoned               (io_req_bits_uop_iw_p2_poisoned),
    .io_req_bits_uop_is_br                        (io_req_bits_uop_is_br),
    .io_req_bits_uop_is_jalr                      (io_req_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal                       (io_req_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb                       (io_req_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask                      (io_req_bits_uop_br_mask),
    .io_req_bits_uop_br_tag                       (io_req_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx                      (io_req_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst                    (io_req_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob                       (io_req_bits_uop_pc_lob),
    .io_req_bits_uop_taken                        (io_req_bits_uop_taken),
    .io_req_bits_uop_imm_packed                   (io_req_bits_uop_imm_packed),
    .io_req_bits_uop_csr_addr                     (io_req_bits_uop_csr_addr),
    .io_req_bits_uop_rob_idx                      (io_req_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx                      (io_req_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx                      (io_req_bits_uop_stq_idx),
    .io_req_bits_uop_rxq_idx                      (io_req_bits_uop_rxq_idx),
    .io_req_bits_uop_pdst                         (io_req_bits_uop_pdst),
    .io_req_bits_uop_prs1                         (io_req_bits_uop_prs1),
    .io_req_bits_uop_prs2                         (io_req_bits_uop_prs2),
    .io_req_bits_uop_prs3                         (io_req_bits_uop_prs3),
    .io_req_bits_uop_ppred                        (io_req_bits_uop_ppred),
    .io_req_bits_uop_prs1_busy                    (io_req_bits_uop_prs1_busy),
    .io_req_bits_uop_prs2_busy                    (io_req_bits_uop_prs2_busy),
    .io_req_bits_uop_prs3_busy                    (io_req_bits_uop_prs3_busy),
    .io_req_bits_uop_ppred_busy                   (io_req_bits_uop_ppred_busy),
    .io_req_bits_uop_stale_pdst                   (io_req_bits_uop_stale_pdst),
    .io_req_bits_uop_exception                    (io_req_bits_uop_exception),
    .io_req_bits_uop_exc_cause                    (io_req_bits_uop_exc_cause),
    .io_req_bits_uop_bypassable                   (io_req_bits_uop_bypassable),
    .io_req_bits_uop_mem_cmd                      (io_req_bits_uop_mem_cmd),
    .io_req_bits_uop_mem_size                     (io_req_bits_uop_mem_size),
    .io_req_bits_uop_mem_signed                   (io_req_bits_uop_mem_signed),
    .io_req_bits_uop_is_fence                     (io_req_bits_uop_is_fence),
    .io_req_bits_uop_is_fencei                    (io_req_bits_uop_is_fencei),
    .io_req_bits_uop_is_amo                       (io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq                     (io_req_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq                     (io_req_bits_uop_uses_stq),
    .io_req_bits_uop_is_sys_pc2epc                (io_req_bits_uop_is_sys_pc2epc),
    .io_req_bits_uop_is_unique                    (io_req_bits_uop_is_unique),
    .io_req_bits_uop_flush_on_commit              (io_req_bits_uop_flush_on_commit),
    .io_req_bits_uop_ldst_is_rs1                  (io_req_bits_uop_ldst_is_rs1),
    .io_req_bits_uop_ldst                         (io_req_bits_uop_ldst),
    .io_req_bits_uop_lrs1                         (io_req_bits_uop_lrs1),
    .io_req_bits_uop_lrs2                         (io_req_bits_uop_lrs2),
    .io_req_bits_uop_lrs3                         (io_req_bits_uop_lrs3),
    .io_req_bits_uop_ldst_val                     (io_req_bits_uop_ldst_val),
    .io_req_bits_uop_dst_rtype                    (io_req_bits_uop_dst_rtype),
    .io_req_bits_uop_lrs1_rtype                   (io_req_bits_uop_lrs1_rtype),
    .io_req_bits_uop_lrs2_rtype                   (io_req_bits_uop_lrs2_rtype),
    .io_req_bits_uop_frs3_en                      (io_req_bits_uop_frs3_en),
    .io_req_bits_uop_fp_val                       (io_req_bits_uop_fp_val),
    .io_req_bits_uop_fp_single                    (io_req_bits_uop_fp_single),
    .io_req_bits_uop_xcpt_pf_if                   (io_req_bits_uop_xcpt_pf_if),
    .io_req_bits_uop_xcpt_ae_if                   (io_req_bits_uop_xcpt_ae_if),
    .io_req_bits_uop_xcpt_ma_if                   (io_req_bits_uop_xcpt_ma_if),
    .io_req_bits_uop_bp_debug_if                  (io_req_bits_uop_bp_debug_if),
    .io_req_bits_uop_bp_xcpt_if                   (io_req_bits_uop_bp_xcpt_if),
    .io_req_bits_uop_debug_fsrc                   (io_req_bits_uop_debug_fsrc),
    .io_req_bits_uop_debug_tsrc                   (io_req_bits_uop_debug_tsrc),
    .io_req_bits_rs1_data                         (io_req_bits_rs1_data),
    .io_req_bits_rs2_data                         (io_req_bits_rs2_data),
    .io_req_bits_rs3_data                         (io_req_bits_rs3_data),
    .io_req_bits_kill                             (io_req_bits_kill),
    .io_resp_valid                                (_FPUUnit_io_resp_valid),
    .io_resp_bits_uop_uopc                        (_FPUUnit_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst                        (_FPUUnit_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst                  (_FPUUnit_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc                      (_FPUUnit_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc                    (_FPUUnit_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type                     (_FPUUnit_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code                     (_FPUUnit_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type                (_FPUUnit_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel                (_FPUUnit_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel                (_FPUUnit_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel                (_FPUUnit_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn                 (_FPUUnit_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw                 (_FPUUnit_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd                (_FPUUnit_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load                (_FPUUnit_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta                 (_FPUUnit_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std                 (_FPUUnit_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state                    (_FPUUnit_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned              (_FPUUnit_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned              (_FPUUnit_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br                       (_FPUUnit_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr                     (_FPUUnit_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal                      (_FPUUnit_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb                      (_FPUUnit_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask                     (_FPUUnit_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag                      (_FPUUnit_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx                     (_FPUUnit_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst                   (_FPUUnit_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob                      (_FPUUnit_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken                       (_FPUUnit_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed                  (_FPUUnit_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr                    (_FPUUnit_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx                     (_FPUUnit_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx                     (_FPUUnit_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx                     (_FPUUnit_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx                     (_FPUUnit_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst                        (_FPUUnit_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1                        (_FPUUnit_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2                        (_FPUUnit_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3                        (_FPUUnit_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred                       (_FPUUnit_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy                   (_FPUUnit_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy                   (_FPUUnit_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy                   (_FPUUnit_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy                  (_FPUUnit_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst                  (_FPUUnit_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception                   (_FPUUnit_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause                   (_FPUUnit_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable                  (_FPUUnit_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd                     (_FPUUnit_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size                    (_FPUUnit_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed                  (_FPUUnit_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence                    (_FPUUnit_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei                   (_FPUUnit_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo                      (_FPUUnit_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq                    (_FPUUnit_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq                    (_FPUUnit_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc               (_FPUUnit_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique                   (_FPUUnit_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit             (_FPUUnit_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1                 (_FPUUnit_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst                        (_FPUUnit_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1                        (_FPUUnit_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2                        (_FPUUnit_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3                        (_FPUUnit_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val                    (_FPUUnit_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype                   (_FPUUnit_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype                  (_FPUUnit_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype                  (_FPUUnit_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en                     (_FPUUnit_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val                      (_FPUUnit_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single                   (_FPUUnit_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if                  (_FPUUnit_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if                  (_FPUUnit_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if                  (_FPUUnit_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if                 (_FPUUnit_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if                  (_FPUUnit_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc                  (_FPUUnit_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc                  (_FPUUnit_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data                            (_FPUUnit_io_resp_bits_data),
    .io_resp_bits_fflags_valid                    (_FPUUnit_io_resp_bits_fflags_valid),
    .io_resp_bits_fflags_bits_uop_uopc            (_FPUUnit_io_resp_bits_fflags_bits_uop_uopc),
    .io_resp_bits_fflags_bits_uop_inst            (_FPUUnit_io_resp_bits_fflags_bits_uop_inst),
    .io_resp_bits_fflags_bits_uop_debug_inst      (_FPUUnit_io_resp_bits_fflags_bits_uop_debug_inst),
    .io_resp_bits_fflags_bits_uop_is_rvc          (_FPUUnit_io_resp_bits_fflags_bits_uop_is_rvc),
    .io_resp_bits_fflags_bits_uop_debug_pc        (_FPUUnit_io_resp_bits_fflags_bits_uop_debug_pc),
    .io_resp_bits_fflags_bits_uop_iq_type         (_FPUUnit_io_resp_bits_fflags_bits_uop_iq_type),
    .io_resp_bits_fflags_bits_uop_fu_code         (_FPUUnit_io_resp_bits_fflags_bits_uop_fu_code),
    .io_resp_bits_fflags_bits_uop_ctrl_br_type    (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_br_type),
    .io_resp_bits_fflags_bits_uop_ctrl_op1_sel    (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op2_sel    (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_imm_sel    (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op_fcn     (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_resp_bits_fflags_bits_uop_ctrl_fcn_dw     (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_fflags_bits_uop_ctrl_csr_cmd    (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_fflags_bits_uop_ctrl_is_load    (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_is_load),
    .io_resp_bits_fflags_bits_uop_ctrl_is_sta     (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_is_sta),
    .io_resp_bits_fflags_bits_uop_ctrl_is_std     (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_is_std),
    .io_resp_bits_fflags_bits_uop_iw_state        (_FPUUnit_io_resp_bits_fflags_bits_uop_iw_state),
    .io_resp_bits_fflags_bits_uop_iw_p1_poisoned  (_FPUUnit_io_resp_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_resp_bits_fflags_bits_uop_iw_p2_poisoned  (_FPUUnit_io_resp_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_resp_bits_fflags_bits_uop_is_br           (_FPUUnit_io_resp_bits_fflags_bits_uop_is_br),
    .io_resp_bits_fflags_bits_uop_is_jalr         (_FPUUnit_io_resp_bits_fflags_bits_uop_is_jalr),
    .io_resp_bits_fflags_bits_uop_is_jal          (_FPUUnit_io_resp_bits_fflags_bits_uop_is_jal),
    .io_resp_bits_fflags_bits_uop_is_sfb          (_FPUUnit_io_resp_bits_fflags_bits_uop_is_sfb),
    .io_resp_bits_fflags_bits_uop_br_mask         (_FPUUnit_io_resp_bits_fflags_bits_uop_br_mask),
    .io_resp_bits_fflags_bits_uop_br_tag          (_FPUUnit_io_resp_bits_fflags_bits_uop_br_tag),
    .io_resp_bits_fflags_bits_uop_ftq_idx         (_FPUUnit_io_resp_bits_fflags_bits_uop_ftq_idx),
    .io_resp_bits_fflags_bits_uop_edge_inst       (_FPUUnit_io_resp_bits_fflags_bits_uop_edge_inst),
    .io_resp_bits_fflags_bits_uop_pc_lob          (_FPUUnit_io_resp_bits_fflags_bits_uop_pc_lob),
    .io_resp_bits_fflags_bits_uop_taken           (_FPUUnit_io_resp_bits_fflags_bits_uop_taken),
    .io_resp_bits_fflags_bits_uop_imm_packed      (_FPUUnit_io_resp_bits_fflags_bits_uop_imm_packed),
    .io_resp_bits_fflags_bits_uop_csr_addr        (_FPUUnit_io_resp_bits_fflags_bits_uop_csr_addr),
    .io_resp_bits_fflags_bits_uop_rob_idx         (_FPUUnit_io_resp_bits_fflags_bits_uop_rob_idx),
    .io_resp_bits_fflags_bits_uop_ldq_idx         (_FPUUnit_io_resp_bits_fflags_bits_uop_ldq_idx),
    .io_resp_bits_fflags_bits_uop_stq_idx         (_FPUUnit_io_resp_bits_fflags_bits_uop_stq_idx),
    .io_resp_bits_fflags_bits_uop_rxq_idx         (_FPUUnit_io_resp_bits_fflags_bits_uop_rxq_idx),
    .io_resp_bits_fflags_bits_uop_pdst            (_FPUUnit_io_resp_bits_fflags_bits_uop_pdst),
    .io_resp_bits_fflags_bits_uop_prs1            (_FPUUnit_io_resp_bits_fflags_bits_uop_prs1),
    .io_resp_bits_fflags_bits_uop_prs2            (_FPUUnit_io_resp_bits_fflags_bits_uop_prs2),
    .io_resp_bits_fflags_bits_uop_prs3            (_FPUUnit_io_resp_bits_fflags_bits_uop_prs3),
    .io_resp_bits_fflags_bits_uop_ppred           (_FPUUnit_io_resp_bits_fflags_bits_uop_ppred),
    .io_resp_bits_fflags_bits_uop_prs1_busy       (_FPUUnit_io_resp_bits_fflags_bits_uop_prs1_busy),
    .io_resp_bits_fflags_bits_uop_prs2_busy       (_FPUUnit_io_resp_bits_fflags_bits_uop_prs2_busy),
    .io_resp_bits_fflags_bits_uop_prs3_busy       (_FPUUnit_io_resp_bits_fflags_bits_uop_prs3_busy),
    .io_resp_bits_fflags_bits_uop_ppred_busy      (_FPUUnit_io_resp_bits_fflags_bits_uop_ppred_busy),
    .io_resp_bits_fflags_bits_uop_stale_pdst      (_FPUUnit_io_resp_bits_fflags_bits_uop_stale_pdst),
    .io_resp_bits_fflags_bits_uop_exception       (_FPUUnit_io_resp_bits_fflags_bits_uop_exception),
    .io_resp_bits_fflags_bits_uop_exc_cause       (_FPUUnit_io_resp_bits_fflags_bits_uop_exc_cause),
    .io_resp_bits_fflags_bits_uop_bypassable      (_FPUUnit_io_resp_bits_fflags_bits_uop_bypassable),
    .io_resp_bits_fflags_bits_uop_mem_cmd         (_FPUUnit_io_resp_bits_fflags_bits_uop_mem_cmd),
    .io_resp_bits_fflags_bits_uop_mem_size        (_FPUUnit_io_resp_bits_fflags_bits_uop_mem_size),
    .io_resp_bits_fflags_bits_uop_mem_signed      (_FPUUnit_io_resp_bits_fflags_bits_uop_mem_signed),
    .io_resp_bits_fflags_bits_uop_is_fence        (_FPUUnit_io_resp_bits_fflags_bits_uop_is_fence),
    .io_resp_bits_fflags_bits_uop_is_fencei       (_FPUUnit_io_resp_bits_fflags_bits_uop_is_fencei),
    .io_resp_bits_fflags_bits_uop_is_amo          (_FPUUnit_io_resp_bits_fflags_bits_uop_is_amo),
    .io_resp_bits_fflags_bits_uop_uses_ldq        (_FPUUnit_io_resp_bits_fflags_bits_uop_uses_ldq),
    .io_resp_bits_fflags_bits_uop_uses_stq        (_FPUUnit_io_resp_bits_fflags_bits_uop_uses_stq),
    .io_resp_bits_fflags_bits_uop_is_sys_pc2epc   (_FPUUnit_io_resp_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_resp_bits_fflags_bits_uop_is_unique       (_FPUUnit_io_resp_bits_fflags_bits_uop_is_unique),
    .io_resp_bits_fflags_bits_uop_flush_on_commit (_FPUUnit_io_resp_bits_fflags_bits_uop_flush_on_commit),
    .io_resp_bits_fflags_bits_uop_ldst_is_rs1     (_FPUUnit_io_resp_bits_fflags_bits_uop_ldst_is_rs1),
    .io_resp_bits_fflags_bits_uop_ldst            (_FPUUnit_io_resp_bits_fflags_bits_uop_ldst),
    .io_resp_bits_fflags_bits_uop_lrs1            (_FPUUnit_io_resp_bits_fflags_bits_uop_lrs1),
    .io_resp_bits_fflags_bits_uop_lrs2            (_FPUUnit_io_resp_bits_fflags_bits_uop_lrs2),
    .io_resp_bits_fflags_bits_uop_lrs3            (_FPUUnit_io_resp_bits_fflags_bits_uop_lrs3),
    .io_resp_bits_fflags_bits_uop_ldst_val        (_FPUUnit_io_resp_bits_fflags_bits_uop_ldst_val),
    .io_resp_bits_fflags_bits_uop_dst_rtype       (_FPUUnit_io_resp_bits_fflags_bits_uop_dst_rtype),
    .io_resp_bits_fflags_bits_uop_lrs1_rtype      (_FPUUnit_io_resp_bits_fflags_bits_uop_lrs1_rtype),
    .io_resp_bits_fflags_bits_uop_lrs2_rtype      (_FPUUnit_io_resp_bits_fflags_bits_uop_lrs2_rtype),
    .io_resp_bits_fflags_bits_uop_frs3_en         (_FPUUnit_io_resp_bits_fflags_bits_uop_frs3_en),
    .io_resp_bits_fflags_bits_uop_fp_val          (_FPUUnit_io_resp_bits_fflags_bits_uop_fp_val),
    .io_resp_bits_fflags_bits_uop_fp_single       (_FPUUnit_io_resp_bits_fflags_bits_uop_fp_single),
    .io_resp_bits_fflags_bits_uop_xcpt_pf_if      (_FPUUnit_io_resp_bits_fflags_bits_uop_xcpt_pf_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ae_if      (_FPUUnit_io_resp_bits_fflags_bits_uop_xcpt_ae_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ma_if      (_FPUUnit_io_resp_bits_fflags_bits_uop_xcpt_ma_if),
    .io_resp_bits_fflags_bits_uop_bp_debug_if     (_FPUUnit_io_resp_bits_fflags_bits_uop_bp_debug_if),
    .io_resp_bits_fflags_bits_uop_bp_xcpt_if      (_FPUUnit_io_resp_bits_fflags_bits_uop_bp_xcpt_if),
    .io_resp_bits_fflags_bits_uop_debug_fsrc      (_FPUUnit_io_resp_bits_fflags_bits_uop_debug_fsrc),
    .io_resp_bits_fflags_bits_uop_debug_tsrc      (_FPUUnit_io_resp_bits_fflags_bits_uop_debug_tsrc),
    .io_resp_bits_fflags_bits_flags               (_FPUUnit_io_resp_bits_fflags_bits_flags),
    .io_brupdate_b1_resolve_mask                  (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask               (io_brupdate_b1_mispredict_mask),
    .io_fcsr_rm                                   (io_fcsr_rm)
  );
  FDivSqrtUnit FDivSqrtUnit (
    .clock                                (clock),
    .reset                                (reset),
    .io_req_ready                         (_FDivSqrtUnit_io_req_ready),
    .io_req_valid                         (io_req_valid & io_req_bits_uop_fu_code[7]),
    .io_req_bits_uop_uopc                 (io_req_bits_uop_uopc),
    .io_req_bits_uop_br_mask              (io_req_bits_uop_br_mask),
    .io_req_bits_uop_imm_packed           (io_req_bits_uop_imm_packed),
    .io_req_bits_uop_rob_idx              (io_req_bits_uop_rob_idx),
    .io_req_bits_uop_pdst                 (io_req_bits_uop_pdst),
    .io_req_bits_uop_is_amo               (io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_ldq             (io_req_bits_uop_uses_ldq),
    .io_req_bits_uop_uses_stq             (io_req_bits_uop_uses_stq),
    .io_req_bits_uop_dst_rtype            (io_req_bits_uop_dst_rtype),
    .io_req_bits_uop_fp_val               (io_req_bits_uop_fp_val),
    .io_req_bits_rs1_data                 (io_req_bits_rs1_data),
    .io_req_bits_rs2_data                 (io_req_bits_rs2_data),
    .io_req_bits_kill                     (io_req_bits_kill),
    .io_resp_ready                        (~_FPUUnit_io_resp_valid),
    .io_resp_valid                        (_FDivSqrtUnit_io_resp_valid),
    .io_resp_bits_uop_rob_idx             (_FDivSqrtUnit_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_pdst                (_FDivSqrtUnit_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_is_amo              (_FDivSqrtUnit_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq            (_FDivSqrtUnit_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq            (_FDivSqrtUnit_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_dst_rtype           (_FDivSqrtUnit_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_fp_val              (_FDivSqrtUnit_io_resp_bits_uop_fp_val),
    .io_resp_bits_data                    (_FDivSqrtUnit_io_resp_bits_data),
    .io_resp_bits_fflags_valid            (_FDivSqrtUnit_io_resp_bits_fflags_valid),
    .io_resp_bits_fflags_bits_uop_rob_idx (_FDivSqrtUnit_io_resp_bits_fflags_bits_uop_rob_idx),
    .io_resp_bits_fflags_bits_flags       (_FDivSqrtUnit_io_resp_bits_fflags_bits_flags),
    .io_brupdate_b1_resolve_mask          (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask       (io_brupdate_b1_mispredict_mask),
    .io_fcsr_rm                           (io_fcsr_rm)
  );
  BranchKillableQueue_10 queue (
    .clock                                       (clock),
    .reset                                       (reset),
    .io_enq_ready                                (_queue_io_enq_ready),
    .io_enq_valid                                (_FPUUnit_io_resp_valid & _FPUUnit_io_resp_bits_uop_fu_code[9] & _FPUUnit_io_resp_bits_uop_uopc != 7'h2),
    .io_enq_bits_uop_uopc                        (_FPUUnit_io_resp_bits_uop_uopc),
    .io_enq_bits_uop_inst                        (_FPUUnit_io_resp_bits_uop_inst),
    .io_enq_bits_uop_debug_inst                  (_FPUUnit_io_resp_bits_uop_debug_inst),
    .io_enq_bits_uop_is_rvc                      (_FPUUnit_io_resp_bits_uop_is_rvc),
    .io_enq_bits_uop_debug_pc                    (_FPUUnit_io_resp_bits_uop_debug_pc),
    .io_enq_bits_uop_iq_type                     (_FPUUnit_io_resp_bits_uop_iq_type),
    .io_enq_bits_uop_fu_code                     (_FPUUnit_io_resp_bits_uop_fu_code),
    .io_enq_bits_uop_ctrl_br_type                (_FPUUnit_io_resp_bits_uop_ctrl_br_type),
    .io_enq_bits_uop_ctrl_op1_sel                (_FPUUnit_io_resp_bits_uop_ctrl_op1_sel),
    .io_enq_bits_uop_ctrl_op2_sel                (_FPUUnit_io_resp_bits_uop_ctrl_op2_sel),
    .io_enq_bits_uop_ctrl_imm_sel                (_FPUUnit_io_resp_bits_uop_ctrl_imm_sel),
    .io_enq_bits_uop_ctrl_op_fcn                 (_FPUUnit_io_resp_bits_uop_ctrl_op_fcn),
    .io_enq_bits_uop_ctrl_fcn_dw                 (_FPUUnit_io_resp_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_uop_ctrl_csr_cmd                (_FPUUnit_io_resp_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_uop_ctrl_is_load                (_FPUUnit_io_resp_bits_uop_ctrl_is_load),
    .io_enq_bits_uop_ctrl_is_sta                 (_FPUUnit_io_resp_bits_uop_ctrl_is_sta),
    .io_enq_bits_uop_ctrl_is_std                 (_FPUUnit_io_resp_bits_uop_ctrl_is_std),
    .io_enq_bits_uop_iw_state                    (_FPUUnit_io_resp_bits_uop_iw_state),
    .io_enq_bits_uop_iw_p1_poisoned              (_FPUUnit_io_resp_bits_uop_iw_p1_poisoned),
    .io_enq_bits_uop_iw_p2_poisoned              (_FPUUnit_io_resp_bits_uop_iw_p2_poisoned),
    .io_enq_bits_uop_is_br                       (_FPUUnit_io_resp_bits_uop_is_br),
    .io_enq_bits_uop_is_jalr                     (_FPUUnit_io_resp_bits_uop_is_jalr),
    .io_enq_bits_uop_is_jal                      (_FPUUnit_io_resp_bits_uop_is_jal),
    .io_enq_bits_uop_is_sfb                      (_FPUUnit_io_resp_bits_uop_is_sfb),
    .io_enq_bits_uop_br_mask                     (_FPUUnit_io_resp_bits_uop_br_mask),
    .io_enq_bits_uop_br_tag                      (_FPUUnit_io_resp_bits_uop_br_tag),
    .io_enq_bits_uop_ftq_idx                     (_FPUUnit_io_resp_bits_uop_ftq_idx),
    .io_enq_bits_uop_edge_inst                   (_FPUUnit_io_resp_bits_uop_edge_inst),
    .io_enq_bits_uop_pc_lob                      (_FPUUnit_io_resp_bits_uop_pc_lob),
    .io_enq_bits_uop_taken                       (_FPUUnit_io_resp_bits_uop_taken),
    .io_enq_bits_uop_imm_packed                  (_FPUUnit_io_resp_bits_uop_imm_packed),
    .io_enq_bits_uop_csr_addr                    (_FPUUnit_io_resp_bits_uop_csr_addr),
    .io_enq_bits_uop_rob_idx                     (_FPUUnit_io_resp_bits_uop_rob_idx),
    .io_enq_bits_uop_ldq_idx                     (_FPUUnit_io_resp_bits_uop_ldq_idx),
    .io_enq_bits_uop_stq_idx                     (_FPUUnit_io_resp_bits_uop_stq_idx),
    .io_enq_bits_uop_rxq_idx                     (_FPUUnit_io_resp_bits_uop_rxq_idx),
    .io_enq_bits_uop_pdst                        (_FPUUnit_io_resp_bits_uop_pdst),
    .io_enq_bits_uop_prs1                        (_FPUUnit_io_resp_bits_uop_prs1),
    .io_enq_bits_uop_prs2                        (_FPUUnit_io_resp_bits_uop_prs2),
    .io_enq_bits_uop_prs3                        (_FPUUnit_io_resp_bits_uop_prs3),
    .io_enq_bits_uop_ppred                       (_FPUUnit_io_resp_bits_uop_ppred),
    .io_enq_bits_uop_prs1_busy                   (_FPUUnit_io_resp_bits_uop_prs1_busy),
    .io_enq_bits_uop_prs2_busy                   (_FPUUnit_io_resp_bits_uop_prs2_busy),
    .io_enq_bits_uop_prs3_busy                   (_FPUUnit_io_resp_bits_uop_prs3_busy),
    .io_enq_bits_uop_ppred_busy                  (_FPUUnit_io_resp_bits_uop_ppred_busy),
    .io_enq_bits_uop_stale_pdst                  (_FPUUnit_io_resp_bits_uop_stale_pdst),
    .io_enq_bits_uop_exception                   (_FPUUnit_io_resp_bits_uop_exception),
    .io_enq_bits_uop_exc_cause                   (_FPUUnit_io_resp_bits_uop_exc_cause),
    .io_enq_bits_uop_bypassable                  (_FPUUnit_io_resp_bits_uop_bypassable),
    .io_enq_bits_uop_mem_cmd                     (_FPUUnit_io_resp_bits_uop_mem_cmd),
    .io_enq_bits_uop_mem_size                    (_FPUUnit_io_resp_bits_uop_mem_size),
    .io_enq_bits_uop_mem_signed                  (_FPUUnit_io_resp_bits_uop_mem_signed),
    .io_enq_bits_uop_is_fence                    (_FPUUnit_io_resp_bits_uop_is_fence),
    .io_enq_bits_uop_is_fencei                   (_FPUUnit_io_resp_bits_uop_is_fencei),
    .io_enq_bits_uop_is_amo                      (_FPUUnit_io_resp_bits_uop_is_amo),
    .io_enq_bits_uop_uses_ldq                    (_FPUUnit_io_resp_bits_uop_uses_ldq),
    .io_enq_bits_uop_uses_stq                    (_FPUUnit_io_resp_bits_uop_uses_stq),
    .io_enq_bits_uop_is_sys_pc2epc               (_FPUUnit_io_resp_bits_uop_is_sys_pc2epc),
    .io_enq_bits_uop_is_unique                   (_FPUUnit_io_resp_bits_uop_is_unique),
    .io_enq_bits_uop_flush_on_commit             (_FPUUnit_io_resp_bits_uop_flush_on_commit),
    .io_enq_bits_uop_ldst_is_rs1                 (_FPUUnit_io_resp_bits_uop_ldst_is_rs1),
    .io_enq_bits_uop_ldst                        (_FPUUnit_io_resp_bits_uop_ldst),
    .io_enq_bits_uop_lrs1                        (_FPUUnit_io_resp_bits_uop_lrs1),
    .io_enq_bits_uop_lrs2                        (_FPUUnit_io_resp_bits_uop_lrs2),
    .io_enq_bits_uop_lrs3                        (_FPUUnit_io_resp_bits_uop_lrs3),
    .io_enq_bits_uop_ldst_val                    (_FPUUnit_io_resp_bits_uop_ldst_val),
    .io_enq_bits_uop_dst_rtype                   (_FPUUnit_io_resp_bits_uop_dst_rtype),
    .io_enq_bits_uop_lrs1_rtype                  (_FPUUnit_io_resp_bits_uop_lrs1_rtype),
    .io_enq_bits_uop_lrs2_rtype                  (_FPUUnit_io_resp_bits_uop_lrs2_rtype),
    .io_enq_bits_uop_frs3_en                     (_FPUUnit_io_resp_bits_uop_frs3_en),
    .io_enq_bits_uop_fp_val                      (_FPUUnit_io_resp_bits_uop_fp_val),
    .io_enq_bits_uop_fp_single                   (_FPUUnit_io_resp_bits_uop_fp_single),
    .io_enq_bits_uop_xcpt_pf_if                  (_FPUUnit_io_resp_bits_uop_xcpt_pf_if),
    .io_enq_bits_uop_xcpt_ae_if                  (_FPUUnit_io_resp_bits_uop_xcpt_ae_if),
    .io_enq_bits_uop_xcpt_ma_if                  (_FPUUnit_io_resp_bits_uop_xcpt_ma_if),
    .io_enq_bits_uop_bp_debug_if                 (_FPUUnit_io_resp_bits_uop_bp_debug_if),
    .io_enq_bits_uop_bp_xcpt_if                  (_FPUUnit_io_resp_bits_uop_bp_xcpt_if),
    .io_enq_bits_uop_debug_fsrc                  (_FPUUnit_io_resp_bits_uop_debug_fsrc),
    .io_enq_bits_uop_debug_tsrc                  (_FPUUnit_io_resp_bits_uop_debug_tsrc),
    .io_enq_bits_data                            (_FPUUnit_io_resp_bits_data),
    .io_enq_bits_fflags_valid                    (_FPUUnit_io_resp_bits_fflags_valid),
    .io_enq_bits_fflags_bits_uop_uopc            (_FPUUnit_io_resp_bits_fflags_bits_uop_uopc),
    .io_enq_bits_fflags_bits_uop_inst            (_FPUUnit_io_resp_bits_fflags_bits_uop_inst),
    .io_enq_bits_fflags_bits_uop_debug_inst      (_FPUUnit_io_resp_bits_fflags_bits_uop_debug_inst),
    .io_enq_bits_fflags_bits_uop_is_rvc          (_FPUUnit_io_resp_bits_fflags_bits_uop_is_rvc),
    .io_enq_bits_fflags_bits_uop_debug_pc        (_FPUUnit_io_resp_bits_fflags_bits_uop_debug_pc),
    .io_enq_bits_fflags_bits_uop_iq_type         (_FPUUnit_io_resp_bits_fflags_bits_uop_iq_type),
    .io_enq_bits_fflags_bits_uop_fu_code         (_FPUUnit_io_resp_bits_fflags_bits_uop_fu_code),
    .io_enq_bits_fflags_bits_uop_ctrl_br_type    (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_br_type),
    .io_enq_bits_fflags_bits_uop_ctrl_op1_sel    (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_op2_sel    (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_imm_sel    (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_op_fcn     (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_enq_bits_fflags_bits_uop_ctrl_fcn_dw     (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_fflags_bits_uop_ctrl_csr_cmd    (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_fflags_bits_uop_ctrl_is_load    (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_is_load),
    .io_enq_bits_fflags_bits_uop_ctrl_is_sta     (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_is_sta),
    .io_enq_bits_fflags_bits_uop_ctrl_is_std     (_FPUUnit_io_resp_bits_fflags_bits_uop_ctrl_is_std),
    .io_enq_bits_fflags_bits_uop_iw_state        (_FPUUnit_io_resp_bits_fflags_bits_uop_iw_state),
    .io_enq_bits_fflags_bits_uop_iw_p1_poisoned  (_FPUUnit_io_resp_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_enq_bits_fflags_bits_uop_iw_p2_poisoned  (_FPUUnit_io_resp_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_enq_bits_fflags_bits_uop_is_br           (_FPUUnit_io_resp_bits_fflags_bits_uop_is_br),
    .io_enq_bits_fflags_bits_uop_is_jalr         (_FPUUnit_io_resp_bits_fflags_bits_uop_is_jalr),
    .io_enq_bits_fflags_bits_uop_is_jal          (_FPUUnit_io_resp_bits_fflags_bits_uop_is_jal),
    .io_enq_bits_fflags_bits_uop_is_sfb          (_FPUUnit_io_resp_bits_fflags_bits_uop_is_sfb),
    .io_enq_bits_fflags_bits_uop_br_mask         (_FPUUnit_io_resp_bits_fflags_bits_uop_br_mask),
    .io_enq_bits_fflags_bits_uop_br_tag          (_FPUUnit_io_resp_bits_fflags_bits_uop_br_tag),
    .io_enq_bits_fflags_bits_uop_ftq_idx         (_FPUUnit_io_resp_bits_fflags_bits_uop_ftq_idx),
    .io_enq_bits_fflags_bits_uop_edge_inst       (_FPUUnit_io_resp_bits_fflags_bits_uop_edge_inst),
    .io_enq_bits_fflags_bits_uop_pc_lob          (_FPUUnit_io_resp_bits_fflags_bits_uop_pc_lob),
    .io_enq_bits_fflags_bits_uop_taken           (_FPUUnit_io_resp_bits_fflags_bits_uop_taken),
    .io_enq_bits_fflags_bits_uop_imm_packed      (_FPUUnit_io_resp_bits_fflags_bits_uop_imm_packed),
    .io_enq_bits_fflags_bits_uop_csr_addr        (_FPUUnit_io_resp_bits_fflags_bits_uop_csr_addr),
    .io_enq_bits_fflags_bits_uop_rob_idx         (_FPUUnit_io_resp_bits_fflags_bits_uop_rob_idx),
    .io_enq_bits_fflags_bits_uop_ldq_idx         (_FPUUnit_io_resp_bits_fflags_bits_uop_ldq_idx),
    .io_enq_bits_fflags_bits_uop_stq_idx         (_FPUUnit_io_resp_bits_fflags_bits_uop_stq_idx),
    .io_enq_bits_fflags_bits_uop_rxq_idx         (_FPUUnit_io_resp_bits_fflags_bits_uop_rxq_idx),
    .io_enq_bits_fflags_bits_uop_pdst            (_FPUUnit_io_resp_bits_fflags_bits_uop_pdst),
    .io_enq_bits_fflags_bits_uop_prs1            (_FPUUnit_io_resp_bits_fflags_bits_uop_prs1),
    .io_enq_bits_fflags_bits_uop_prs2            (_FPUUnit_io_resp_bits_fflags_bits_uop_prs2),
    .io_enq_bits_fflags_bits_uop_prs3            (_FPUUnit_io_resp_bits_fflags_bits_uop_prs3),
    .io_enq_bits_fflags_bits_uop_ppred           (_FPUUnit_io_resp_bits_fflags_bits_uop_ppred),
    .io_enq_bits_fflags_bits_uop_prs1_busy       (_FPUUnit_io_resp_bits_fflags_bits_uop_prs1_busy),
    .io_enq_bits_fflags_bits_uop_prs2_busy       (_FPUUnit_io_resp_bits_fflags_bits_uop_prs2_busy),
    .io_enq_bits_fflags_bits_uop_prs3_busy       (_FPUUnit_io_resp_bits_fflags_bits_uop_prs3_busy),
    .io_enq_bits_fflags_bits_uop_ppred_busy      (_FPUUnit_io_resp_bits_fflags_bits_uop_ppred_busy),
    .io_enq_bits_fflags_bits_uop_stale_pdst      (_FPUUnit_io_resp_bits_fflags_bits_uop_stale_pdst),
    .io_enq_bits_fflags_bits_uop_exception       (_FPUUnit_io_resp_bits_fflags_bits_uop_exception),
    .io_enq_bits_fflags_bits_uop_exc_cause       (_FPUUnit_io_resp_bits_fflags_bits_uop_exc_cause),
    .io_enq_bits_fflags_bits_uop_bypassable      (_FPUUnit_io_resp_bits_fflags_bits_uop_bypassable),
    .io_enq_bits_fflags_bits_uop_mem_cmd         (_FPUUnit_io_resp_bits_fflags_bits_uop_mem_cmd),
    .io_enq_bits_fflags_bits_uop_mem_size        (_FPUUnit_io_resp_bits_fflags_bits_uop_mem_size),
    .io_enq_bits_fflags_bits_uop_mem_signed      (_FPUUnit_io_resp_bits_fflags_bits_uop_mem_signed),
    .io_enq_bits_fflags_bits_uop_is_fence        (_FPUUnit_io_resp_bits_fflags_bits_uop_is_fence),
    .io_enq_bits_fflags_bits_uop_is_fencei       (_FPUUnit_io_resp_bits_fflags_bits_uop_is_fencei),
    .io_enq_bits_fflags_bits_uop_is_amo          (_FPUUnit_io_resp_bits_fflags_bits_uop_is_amo),
    .io_enq_bits_fflags_bits_uop_uses_ldq        (_FPUUnit_io_resp_bits_fflags_bits_uop_uses_ldq),
    .io_enq_bits_fflags_bits_uop_uses_stq        (_FPUUnit_io_resp_bits_fflags_bits_uop_uses_stq),
    .io_enq_bits_fflags_bits_uop_is_sys_pc2epc   (_FPUUnit_io_resp_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_enq_bits_fflags_bits_uop_is_unique       (_FPUUnit_io_resp_bits_fflags_bits_uop_is_unique),
    .io_enq_bits_fflags_bits_uop_flush_on_commit (_FPUUnit_io_resp_bits_fflags_bits_uop_flush_on_commit),
    .io_enq_bits_fflags_bits_uop_ldst_is_rs1     (_FPUUnit_io_resp_bits_fflags_bits_uop_ldst_is_rs1),
    .io_enq_bits_fflags_bits_uop_ldst            (_FPUUnit_io_resp_bits_fflags_bits_uop_ldst),
    .io_enq_bits_fflags_bits_uop_lrs1            (_FPUUnit_io_resp_bits_fflags_bits_uop_lrs1),
    .io_enq_bits_fflags_bits_uop_lrs2            (_FPUUnit_io_resp_bits_fflags_bits_uop_lrs2),
    .io_enq_bits_fflags_bits_uop_lrs3            (_FPUUnit_io_resp_bits_fflags_bits_uop_lrs3),
    .io_enq_bits_fflags_bits_uop_ldst_val        (_FPUUnit_io_resp_bits_fflags_bits_uop_ldst_val),
    .io_enq_bits_fflags_bits_uop_dst_rtype       (_FPUUnit_io_resp_bits_fflags_bits_uop_dst_rtype),
    .io_enq_bits_fflags_bits_uop_lrs1_rtype      (_FPUUnit_io_resp_bits_fflags_bits_uop_lrs1_rtype),
    .io_enq_bits_fflags_bits_uop_lrs2_rtype      (_FPUUnit_io_resp_bits_fflags_bits_uop_lrs2_rtype),
    .io_enq_bits_fflags_bits_uop_frs3_en         (_FPUUnit_io_resp_bits_fflags_bits_uop_frs3_en),
    .io_enq_bits_fflags_bits_uop_fp_val          (_FPUUnit_io_resp_bits_fflags_bits_uop_fp_val),
    .io_enq_bits_fflags_bits_uop_fp_single       (_FPUUnit_io_resp_bits_fflags_bits_uop_fp_single),
    .io_enq_bits_fflags_bits_uop_xcpt_pf_if      (_FPUUnit_io_resp_bits_fflags_bits_uop_xcpt_pf_if),
    .io_enq_bits_fflags_bits_uop_xcpt_ae_if      (_FPUUnit_io_resp_bits_fflags_bits_uop_xcpt_ae_if),
    .io_enq_bits_fflags_bits_uop_xcpt_ma_if      (_FPUUnit_io_resp_bits_fflags_bits_uop_xcpt_ma_if),
    .io_enq_bits_fflags_bits_uop_bp_debug_if     (_FPUUnit_io_resp_bits_fflags_bits_uop_bp_debug_if),
    .io_enq_bits_fflags_bits_uop_bp_xcpt_if      (_FPUUnit_io_resp_bits_fflags_bits_uop_bp_xcpt_if),
    .io_enq_bits_fflags_bits_uop_debug_fsrc      (_FPUUnit_io_resp_bits_fflags_bits_uop_debug_fsrc),
    .io_enq_bits_fflags_bits_uop_debug_tsrc      (_FPUUnit_io_resp_bits_fflags_bits_uop_debug_tsrc),
    .io_enq_bits_fflags_bits_flags               (_FPUUnit_io_resp_bits_fflags_bits_flags),
    .io_deq_ready                                (_resp_arb_io_in_0_ready),
    .io_deq_valid                                (_queue_io_deq_valid),
    .io_deq_bits_uop_uopc                        (_queue_io_deq_bits_uop_uopc),
    .io_deq_bits_uop_br_mask                     (_queue_io_deq_bits_uop_br_mask),
    .io_deq_bits_uop_rob_idx                     (_queue_io_deq_bits_uop_rob_idx),
    .io_deq_bits_uop_stq_idx                     (_queue_io_deq_bits_uop_stq_idx),
    .io_deq_bits_uop_pdst                        (_queue_io_deq_bits_uop_pdst),
    .io_deq_bits_uop_is_amo                      (_queue_io_deq_bits_uop_is_amo),
    .io_deq_bits_uop_uses_stq                    (_queue_io_deq_bits_uop_uses_stq),
    .io_deq_bits_uop_dst_rtype                   (_queue_io_deq_bits_uop_dst_rtype),
    .io_deq_bits_uop_fp_val                      (_queue_io_deq_bits_uop_fp_val),
    .io_deq_bits_data                            (_queue_io_deq_bits_data),
    .io_deq_bits_predicated                      (_queue_io_deq_bits_predicated),
    .io_deq_bits_fflags_valid                    (_queue_io_deq_bits_fflags_valid),
    .io_deq_bits_fflags_bits_uop_rob_idx         (_queue_io_deq_bits_fflags_bits_uop_rob_idx),
    .io_deq_bits_fflags_bits_flags               (_queue_io_deq_bits_fflags_bits_flags),
    .io_brupdate_b1_resolve_mask                 (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask              (io_brupdate_b1_mispredict_mask),
    .io_flush                                    (io_req_bits_kill),
    .io_empty                                    (_queue_io_empty)
  );
  BranchKillableQueue_11 fp_sdq (
    .clock                               (clock),
    .reset                               (reset),
    .io_enq_ready                        (_fp_sdq_io_enq_ready),
    .io_enq_valid                        (_fp_sdq_io_enq_valid_T_5),
    .io_enq_bits_uop_uopc                (io_req_bits_uop_uopc),
    .io_enq_bits_uop_inst                (io_req_bits_uop_inst),
    .io_enq_bits_uop_debug_inst          (io_req_bits_uop_debug_inst),
    .io_enq_bits_uop_is_rvc              (io_req_bits_uop_is_rvc),
    .io_enq_bits_uop_debug_pc            (io_req_bits_uop_debug_pc),
    .io_enq_bits_uop_iq_type             (io_req_bits_uop_iq_type),
    .io_enq_bits_uop_fu_code             (io_req_bits_uop_fu_code),
    .io_enq_bits_uop_ctrl_br_type        (io_req_bits_uop_ctrl_br_type),
    .io_enq_bits_uop_ctrl_op1_sel        (io_req_bits_uop_ctrl_op1_sel),
    .io_enq_bits_uop_ctrl_op2_sel        (io_req_bits_uop_ctrl_op2_sel),
    .io_enq_bits_uop_ctrl_imm_sel        (io_req_bits_uop_ctrl_imm_sel),
    .io_enq_bits_uop_ctrl_op_fcn         (io_req_bits_uop_ctrl_op_fcn),
    .io_enq_bits_uop_ctrl_fcn_dw         (io_req_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_uop_ctrl_csr_cmd        (io_req_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_uop_ctrl_is_load        (io_req_bits_uop_ctrl_is_load),
    .io_enq_bits_uop_ctrl_is_sta         (io_req_bits_uop_ctrl_is_sta),
    .io_enq_bits_uop_ctrl_is_std         (io_req_bits_uop_ctrl_is_std),
    .io_enq_bits_uop_iw_state            (io_req_bits_uop_iw_state),
    .io_enq_bits_uop_iw_p1_poisoned      (io_req_bits_uop_iw_p1_poisoned),
    .io_enq_bits_uop_iw_p2_poisoned      (io_req_bits_uop_iw_p2_poisoned),
    .io_enq_bits_uop_is_br               (io_req_bits_uop_is_br),
    .io_enq_bits_uop_is_jalr             (io_req_bits_uop_is_jalr),
    .io_enq_bits_uop_is_jal              (io_req_bits_uop_is_jal),
    .io_enq_bits_uop_is_sfb              (io_req_bits_uop_is_sfb),
    .io_enq_bits_uop_br_mask             (io_req_bits_uop_br_mask),
    .io_enq_bits_uop_br_tag              (io_req_bits_uop_br_tag),
    .io_enq_bits_uop_ftq_idx             (io_req_bits_uop_ftq_idx),
    .io_enq_bits_uop_edge_inst           (io_req_bits_uop_edge_inst),
    .io_enq_bits_uop_pc_lob              (io_req_bits_uop_pc_lob),
    .io_enq_bits_uop_taken               (io_req_bits_uop_taken),
    .io_enq_bits_uop_imm_packed          (io_req_bits_uop_imm_packed),
    .io_enq_bits_uop_csr_addr            (io_req_bits_uop_csr_addr),
    .io_enq_bits_uop_rob_idx             (io_req_bits_uop_rob_idx),
    .io_enq_bits_uop_ldq_idx             (io_req_bits_uop_ldq_idx),
    .io_enq_bits_uop_stq_idx             (io_req_bits_uop_stq_idx),
    .io_enq_bits_uop_rxq_idx             (io_req_bits_uop_rxq_idx),
    .io_enq_bits_uop_pdst                (io_req_bits_uop_pdst),
    .io_enq_bits_uop_prs1                (io_req_bits_uop_prs1),
    .io_enq_bits_uop_prs2                (io_req_bits_uop_prs2),
    .io_enq_bits_uop_prs3                (io_req_bits_uop_prs3),
    .io_enq_bits_uop_ppred               (io_req_bits_uop_ppred),
    .io_enq_bits_uop_prs1_busy           (io_req_bits_uop_prs1_busy),
    .io_enq_bits_uop_prs2_busy           (io_req_bits_uop_prs2_busy),
    .io_enq_bits_uop_prs3_busy           (io_req_bits_uop_prs3_busy),
    .io_enq_bits_uop_ppred_busy          (io_req_bits_uop_ppred_busy),
    .io_enq_bits_uop_stale_pdst          (io_req_bits_uop_stale_pdst),
    .io_enq_bits_uop_exception           (io_req_bits_uop_exception),
    .io_enq_bits_uop_exc_cause           (io_req_bits_uop_exc_cause),
    .io_enq_bits_uop_bypassable          (io_req_bits_uop_bypassable),
    .io_enq_bits_uop_mem_cmd             (io_req_bits_uop_mem_cmd),
    .io_enq_bits_uop_mem_size            (io_req_bits_uop_mem_size),
    .io_enq_bits_uop_mem_signed          (io_req_bits_uop_mem_signed),
    .io_enq_bits_uop_is_fence            (io_req_bits_uop_is_fence),
    .io_enq_bits_uop_is_fencei           (io_req_bits_uop_is_fencei),
    .io_enq_bits_uop_is_amo              (io_req_bits_uop_is_amo),
    .io_enq_bits_uop_uses_ldq            (io_req_bits_uop_uses_ldq),
    .io_enq_bits_uop_uses_stq            (io_req_bits_uop_uses_stq),
    .io_enq_bits_uop_is_sys_pc2epc       (io_req_bits_uop_is_sys_pc2epc),
    .io_enq_bits_uop_is_unique           (io_req_bits_uop_is_unique),
    .io_enq_bits_uop_flush_on_commit     (io_req_bits_uop_flush_on_commit),
    .io_enq_bits_uop_ldst_is_rs1         (io_req_bits_uop_ldst_is_rs1),
    .io_enq_bits_uop_ldst                (io_req_bits_uop_ldst),
    .io_enq_bits_uop_lrs1                (io_req_bits_uop_lrs1),
    .io_enq_bits_uop_lrs2                (io_req_bits_uop_lrs2),
    .io_enq_bits_uop_lrs3                (io_req_bits_uop_lrs3),
    .io_enq_bits_uop_ldst_val            (io_req_bits_uop_ldst_val),
    .io_enq_bits_uop_dst_rtype           (io_req_bits_uop_dst_rtype),
    .io_enq_bits_uop_lrs1_rtype          (io_req_bits_uop_lrs1_rtype),
    .io_enq_bits_uop_lrs2_rtype          (io_req_bits_uop_lrs2_rtype),
    .io_enq_bits_uop_frs3_en             (io_req_bits_uop_frs3_en),
    .io_enq_bits_uop_fp_val              (io_req_bits_uop_fp_val),
    .io_enq_bits_uop_fp_single           (io_req_bits_uop_fp_single),
    .io_enq_bits_uop_xcpt_pf_if          (io_req_bits_uop_xcpt_pf_if),
    .io_enq_bits_uop_xcpt_ae_if          (io_req_bits_uop_xcpt_ae_if),
    .io_enq_bits_uop_xcpt_ma_if          (io_req_bits_uop_xcpt_ma_if),
    .io_enq_bits_uop_bp_debug_if         (io_req_bits_uop_bp_debug_if),
    .io_enq_bits_uop_bp_xcpt_if          (io_req_bits_uop_bp_xcpt_if),
    .io_enq_bits_uop_debug_fsrc          (io_req_bits_uop_debug_fsrc),
    .io_enq_bits_uop_debug_tsrc          (io_req_bits_uop_debug_tsrc),
    .io_enq_bits_data                    ({1'h0, io_req_bits_rs2_data[64], (fp_sdq_io_enq_bits_data_unrecoded_isSubnormal ? 11'h0 : io_req_bits_rs2_data[62:52] + 11'h3FF) | {11{(&(io_req_bits_rs2_data[63:62])) & io_req_bits_rs2_data[61] | fp_sdq_io_enq_bits_data_unrecoded_rawIn_isInf}}, fp_sdq_io_enq_bits_data_unrecoded_fractOut[51:32], (&(io_req_bits_rs2_data[63:61])) ? {io_req_bits_rs2_data[31], (fp_sdq_io_enq_bits_data_prevUnrecoded_isSubnormal ? 8'h0 : io_req_bits_rs2_data[30:23] + 8'h7F) | {8{(&_fp_sdq_io_enq_bits_data_prevUnrecoded_rawIn_isSpecial_T) & io_req_bits_rs2_data[29] | fp_sdq_io_enq_bits_data_prevUnrecoded_rawIn_isInf}}, fp_sdq_io_enq_bits_data_prevUnrecoded_isSubnormal ? _fp_sdq_io_enq_bits_data_prevUnrecoded_denormFract_T_1[22:0] : fp_sdq_io_enq_bits_data_prevUnrecoded_rawIn_isInf ? 23'h0 : io_req_bits_rs2_data[22:0]} : fp_sdq_io_enq_bits_data_unrecoded_fractOut[31:0]}),
    .io_deq_ready                        (_resp_arb_io_in_1_ready),
    .io_deq_valid                        (_fp_sdq_io_deq_valid),
    .io_deq_bits_uop_uopc                (_fp_sdq_io_deq_bits_uop_uopc),
    .io_deq_bits_uop_br_mask             (_fp_sdq_io_deq_bits_uop_br_mask),
    .io_deq_bits_uop_rob_idx             (_fp_sdq_io_deq_bits_uop_rob_idx),
    .io_deq_bits_uop_stq_idx             (_fp_sdq_io_deq_bits_uop_stq_idx),
    .io_deq_bits_uop_pdst                (_fp_sdq_io_deq_bits_uop_pdst),
    .io_deq_bits_uop_is_amo              (_fp_sdq_io_deq_bits_uop_is_amo),
    .io_deq_bits_uop_uses_stq            (_fp_sdq_io_deq_bits_uop_uses_stq),
    .io_deq_bits_uop_dst_rtype           (_fp_sdq_io_deq_bits_uop_dst_rtype),
    .io_deq_bits_uop_fp_val              (_fp_sdq_io_deq_bits_uop_fp_val),
    .io_deq_bits_data                    (_fp_sdq_io_deq_bits_data),
    .io_deq_bits_predicated              (_fp_sdq_io_deq_bits_predicated),
    .io_deq_bits_fflags_valid            (_fp_sdq_io_deq_bits_fflags_valid),
    .io_deq_bits_fflags_bits_uop_rob_idx (_fp_sdq_io_deq_bits_fflags_bits_uop_rob_idx),
    .io_deq_bits_fflags_bits_flags       (_fp_sdq_io_deq_bits_fflags_bits_flags),
    .io_brupdate_b1_resolve_mask         (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask      (io_brupdate_b1_mispredict_mask),
    .io_flush                            (io_req_bits_kill),
    .io_empty                            (_fp_sdq_io_empty)
  );
  Arbiter_16 resp_arb (
    .io_in_0_ready                        (_resp_arb_io_in_0_ready),
    .io_in_0_valid                        (_queue_io_deq_valid),
    .io_in_0_bits_uop_uopc                (_queue_io_deq_bits_uop_uopc),
    .io_in_0_bits_uop_br_mask             (_queue_io_deq_bits_uop_br_mask),
    .io_in_0_bits_uop_rob_idx             (_queue_io_deq_bits_uop_rob_idx),
    .io_in_0_bits_uop_stq_idx             (_queue_io_deq_bits_uop_stq_idx),
    .io_in_0_bits_uop_pdst                (_queue_io_deq_bits_uop_pdst),
    .io_in_0_bits_uop_is_amo              (_queue_io_deq_bits_uop_is_amo),
    .io_in_0_bits_uop_uses_stq            (_queue_io_deq_bits_uop_uses_stq),
    .io_in_0_bits_uop_dst_rtype           (_queue_io_deq_bits_uop_dst_rtype),
    .io_in_0_bits_uop_fp_val              (_queue_io_deq_bits_uop_fp_val),
    .io_in_0_bits_data                    (_queue_io_deq_bits_data),
    .io_in_0_bits_predicated              (_queue_io_deq_bits_predicated),
    .io_in_0_bits_fflags_valid            (_queue_io_deq_bits_fflags_valid),
    .io_in_0_bits_fflags_bits_uop_rob_idx (_queue_io_deq_bits_fflags_bits_uop_rob_idx),
    .io_in_0_bits_fflags_bits_flags       (_queue_io_deq_bits_fflags_bits_flags),
    .io_in_1_ready                        (_resp_arb_io_in_1_ready),
    .io_in_1_valid                        (_fp_sdq_io_deq_valid),
    .io_in_1_bits_uop_uopc                (_fp_sdq_io_deq_bits_uop_uopc),
    .io_in_1_bits_uop_br_mask             (_fp_sdq_io_deq_bits_uop_br_mask),
    .io_in_1_bits_uop_rob_idx             (_fp_sdq_io_deq_bits_uop_rob_idx),
    .io_in_1_bits_uop_stq_idx             (_fp_sdq_io_deq_bits_uop_stq_idx),
    .io_in_1_bits_uop_pdst                (_fp_sdq_io_deq_bits_uop_pdst),
    .io_in_1_bits_uop_is_amo              (_fp_sdq_io_deq_bits_uop_is_amo),
    .io_in_1_bits_uop_uses_stq            (_fp_sdq_io_deq_bits_uop_uses_stq),
    .io_in_1_bits_uop_dst_rtype           (_fp_sdq_io_deq_bits_uop_dst_rtype),
    .io_in_1_bits_uop_fp_val              (_fp_sdq_io_deq_bits_uop_fp_val),
    .io_in_1_bits_data                    (_fp_sdq_io_deq_bits_data),
    .io_in_1_bits_predicated              (_fp_sdq_io_deq_bits_predicated),
    .io_in_1_bits_fflags_valid            (_fp_sdq_io_deq_bits_fflags_valid),
    .io_in_1_bits_fflags_bits_uop_rob_idx (_fp_sdq_io_deq_bits_fflags_bits_uop_rob_idx),
    .io_in_1_bits_fflags_bits_flags       (_fp_sdq_io_deq_bits_fflags_bits_flags),
    .io_out_ready                         (io_ll_iresp_ready),
    .io_out_valid                         (io_ll_iresp_valid),
    .io_out_bits_uop_uopc                 (io_ll_iresp_bits_uop_uopc),
    .io_out_bits_uop_br_mask              (io_ll_iresp_bits_uop_br_mask),
    .io_out_bits_uop_rob_idx              (io_ll_iresp_bits_uop_rob_idx),
    .io_out_bits_uop_stq_idx              (io_ll_iresp_bits_uop_stq_idx),
    .io_out_bits_uop_pdst                 (io_ll_iresp_bits_uop_pdst),
    .io_out_bits_uop_is_amo               (io_ll_iresp_bits_uop_is_amo),
    .io_out_bits_uop_uses_stq             (io_ll_iresp_bits_uop_uses_stq),
    .io_out_bits_uop_dst_rtype            (io_ll_iresp_bits_uop_dst_rtype),
    .io_out_bits_uop_fp_val               (/* unused */),
    .io_out_bits_data                     (io_ll_iresp_bits_data),
    .io_out_bits_predicated               (io_ll_iresp_bits_predicated),
    .io_out_bits_fflags_valid             (/* unused */),
    .io_out_bits_fflags_bits_uop_rob_idx  (/* unused */),
    .io_out_bits_fflags_bits_flags        (/* unused */)
  );
  assign io_fu_types = {_fpiu_busy_T, 1'h0, ~fdiv_busy, 7'h40};
  assign io_fresp_valid = (_FPUUnit_io_resp_valid | _FDivSqrtUnit_io_resp_valid) & ~(_FPUUnit_io_resp_valid & _FPUUnit_io_resp_bits_uop_fu_code[9]);
  assign io_fresp_bits_uop_rob_idx = _FPUUnit_io_resp_valid ? _FPUUnit_io_resp_bits_uop_rob_idx : _FDivSqrtUnit_io_resp_bits_uop_rob_idx;
  assign io_fresp_bits_uop_pdst = _FPUUnit_io_resp_valid ? _FPUUnit_io_resp_bits_uop_pdst : _FDivSqrtUnit_io_resp_bits_uop_pdst;
  assign io_fresp_bits_uop_is_amo = _FPUUnit_io_resp_valid ? _FPUUnit_io_resp_bits_uop_is_amo : _FDivSqrtUnit_io_resp_bits_uop_is_amo;
  assign io_fresp_bits_uop_uses_ldq = _FPUUnit_io_resp_valid ? _FPUUnit_io_resp_bits_uop_uses_ldq : _FDivSqrtUnit_io_resp_bits_uop_uses_ldq;
  assign io_fresp_bits_uop_uses_stq = _FPUUnit_io_resp_valid ? _FPUUnit_io_resp_bits_uop_uses_stq : _FDivSqrtUnit_io_resp_bits_uop_uses_stq;
  assign io_fresp_bits_uop_dst_rtype = _FPUUnit_io_resp_valid ? _FPUUnit_io_resp_bits_uop_dst_rtype : _FDivSqrtUnit_io_resp_bits_uop_dst_rtype;
  assign io_fresp_bits_uop_fp_val = _FPUUnit_io_resp_valid ? _FPUUnit_io_resp_bits_uop_fp_val : _FDivSqrtUnit_io_resp_bits_uop_fp_val;
  assign io_fresp_bits_data = _FPUUnit_io_resp_valid ? _FPUUnit_io_resp_bits_data : _FDivSqrtUnit_io_resp_bits_data;
  assign io_fresp_bits_fflags_valid = _FPUUnit_io_resp_valid ? _FPUUnit_io_resp_bits_fflags_valid : _FDivSqrtUnit_io_resp_bits_fflags_valid;
  assign io_fresp_bits_fflags_bits_uop_rob_idx = _FPUUnit_io_resp_valid ? _FPUUnit_io_resp_bits_fflags_bits_uop_rob_idx : _FDivSqrtUnit_io_resp_bits_fflags_bits_uop_rob_idx;
  assign io_fresp_bits_fflags_bits_flags = _FPUUnit_io_resp_valid ? _FPUUnit_io_resp_bits_fflags_bits_flags : _FDivSqrtUnit_io_resp_bits_fflags_bits_flags;
endmodule

