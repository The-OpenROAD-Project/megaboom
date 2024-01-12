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

module ALUExeUnit_2(
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
                io_req_bits_rs2_data,
  input         io_req_bits_kill,
  output        io_iresp_valid,
  output [6:0]  io_iresp_bits_uop_rob_idx,
                io_iresp_bits_uop_pdst,
  output        io_iresp_bits_uop_bypassable,
                io_iresp_bits_uop_is_amo,
                io_iresp_bits_uop_uses_stq,
  output [1:0]  io_iresp_bits_uop_dst_rtype,
  output [64:0] io_iresp_bits_data,
  input         io_ll_fresp_ready,
  output        io_ll_fresp_valid,
  output [6:0]  io_ll_fresp_bits_uop_uopc,
  output [19:0] io_ll_fresp_bits_uop_br_mask,
  output [6:0]  io_ll_fresp_bits_uop_rob_idx,
  output [4:0]  io_ll_fresp_bits_uop_stq_idx,
  output [6:0]  io_ll_fresp_bits_uop_pdst,
  output        io_ll_fresp_bits_uop_is_amo,
                io_ll_fresp_bits_uop_uses_stq,
  output [1:0]  io_ll_fresp_bits_uop_dst_rtype,
  output        io_ll_fresp_bits_uop_fp_val,
  output [64:0] io_ll_fresp_bits_data,
  output        io_ll_fresp_bits_predicated,
                io_ll_fresp_bits_fflags_valid,
  output [6:0]  io_ll_fresp_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_ll_fresp_bits_fflags_bits_flags,
  output        io_bypass_0_valid,
  output [6:0]  io_bypass_0_bits_uop_pdst,
  output [1:0]  io_bypass_0_bits_uop_dst_rtype,
  output [64:0] io_bypass_0_bits_data,
  input  [19:0] io_brupdate_b1_resolve_mask,
                io_brupdate_b1_mispredict_mask,
  output        io_brinfo_uop_is_rvc,
  output [19:0] io_brinfo_uop_br_mask,
  output [4:0]  io_brinfo_uop_br_tag,
  output [5:0]  io_brinfo_uop_ftq_idx,
  output        io_brinfo_uop_edge_inst,
  output [5:0]  io_brinfo_uop_pc_lob,
  output [6:0]  io_brinfo_uop_rob_idx,
  output [4:0]  io_brinfo_uop_ldq_idx,
                io_brinfo_uop_stq_idx,
  output        io_brinfo_valid,
                io_brinfo_mispredict,
                io_brinfo_taken,
  output [2:0]  io_brinfo_cfi_type,
  output [1:0]  io_brinfo_pc_sel,
  output [39:0] io_brinfo_jalr_target,
  output [20:0] io_brinfo_target_offset,
  input         io_get_ftq_pc_entry_cfi_idx_valid,
  input  [2:0]  io_get_ftq_pc_entry_cfi_idx_bits,
  input         io_get_ftq_pc_entry_start_bank,
  input  [39:0] io_get_ftq_pc_pc,
  input         io_get_ftq_pc_next_val,
  input  [39:0] io_get_ftq_pc_next_pc,
  input  [2:0]  io_fcsr_rm
);

  wire        _queue_io_enq_ready;
  wire        _queue_io_empty;
  wire        _IntToFPUnit_io_resp_valid;
  wire [6:0]  _IntToFPUnit_io_resp_bits_uop_uopc;
  wire [31:0] _IntToFPUnit_io_resp_bits_uop_inst;
  wire [31:0] _IntToFPUnit_io_resp_bits_uop_debug_inst;
  wire        _IntToFPUnit_io_resp_bits_uop_is_rvc;
  wire [39:0] _IntToFPUnit_io_resp_bits_uop_debug_pc;
  wire [2:0]  _IntToFPUnit_io_resp_bits_uop_iq_type;
  wire [9:0]  _IntToFPUnit_io_resp_bits_uop_fu_code;
  wire [3:0]  _IntToFPUnit_io_resp_bits_uop_ctrl_br_type;
  wire [1:0]  _IntToFPUnit_io_resp_bits_uop_ctrl_op1_sel;
  wire [2:0]  _IntToFPUnit_io_resp_bits_uop_ctrl_op2_sel;
  wire [2:0]  _IntToFPUnit_io_resp_bits_uop_ctrl_imm_sel;
  wire [3:0]  _IntToFPUnit_io_resp_bits_uop_ctrl_op_fcn;
  wire        _IntToFPUnit_io_resp_bits_uop_ctrl_fcn_dw;
  wire [2:0]  _IntToFPUnit_io_resp_bits_uop_ctrl_csr_cmd;
  wire        _IntToFPUnit_io_resp_bits_uop_ctrl_is_load;
  wire        _IntToFPUnit_io_resp_bits_uop_ctrl_is_sta;
  wire        _IntToFPUnit_io_resp_bits_uop_ctrl_is_std;
  wire [1:0]  _IntToFPUnit_io_resp_bits_uop_iw_state;
  wire        _IntToFPUnit_io_resp_bits_uop_iw_p1_poisoned;
  wire        _IntToFPUnit_io_resp_bits_uop_iw_p2_poisoned;
  wire        _IntToFPUnit_io_resp_bits_uop_is_br;
  wire        _IntToFPUnit_io_resp_bits_uop_is_jalr;
  wire        _IntToFPUnit_io_resp_bits_uop_is_jal;
  wire        _IntToFPUnit_io_resp_bits_uop_is_sfb;
  wire [19:0] _IntToFPUnit_io_resp_bits_uop_br_mask;
  wire [4:0]  _IntToFPUnit_io_resp_bits_uop_br_tag;
  wire [5:0]  _IntToFPUnit_io_resp_bits_uop_ftq_idx;
  wire        _IntToFPUnit_io_resp_bits_uop_edge_inst;
  wire [5:0]  _IntToFPUnit_io_resp_bits_uop_pc_lob;
  wire        _IntToFPUnit_io_resp_bits_uop_taken;
  wire [19:0] _IntToFPUnit_io_resp_bits_uop_imm_packed;
  wire [11:0] _IntToFPUnit_io_resp_bits_uop_csr_addr;
  wire [6:0]  _IntToFPUnit_io_resp_bits_uop_rob_idx;
  wire [4:0]  _IntToFPUnit_io_resp_bits_uop_ldq_idx;
  wire [4:0]  _IntToFPUnit_io_resp_bits_uop_stq_idx;
  wire [1:0]  _IntToFPUnit_io_resp_bits_uop_rxq_idx;
  wire [6:0]  _IntToFPUnit_io_resp_bits_uop_pdst;
  wire [6:0]  _IntToFPUnit_io_resp_bits_uop_prs1;
  wire [6:0]  _IntToFPUnit_io_resp_bits_uop_prs2;
  wire [6:0]  _IntToFPUnit_io_resp_bits_uop_prs3;
  wire [5:0]  _IntToFPUnit_io_resp_bits_uop_ppred;
  wire        _IntToFPUnit_io_resp_bits_uop_prs1_busy;
  wire        _IntToFPUnit_io_resp_bits_uop_prs2_busy;
  wire        _IntToFPUnit_io_resp_bits_uop_prs3_busy;
  wire        _IntToFPUnit_io_resp_bits_uop_ppred_busy;
  wire [6:0]  _IntToFPUnit_io_resp_bits_uop_stale_pdst;
  wire        _IntToFPUnit_io_resp_bits_uop_exception;
  wire [63:0] _IntToFPUnit_io_resp_bits_uop_exc_cause;
  wire        _IntToFPUnit_io_resp_bits_uop_bypassable;
  wire [4:0]  _IntToFPUnit_io_resp_bits_uop_mem_cmd;
  wire [1:0]  _IntToFPUnit_io_resp_bits_uop_mem_size;
  wire        _IntToFPUnit_io_resp_bits_uop_mem_signed;
  wire        _IntToFPUnit_io_resp_bits_uop_is_fence;
  wire        _IntToFPUnit_io_resp_bits_uop_is_fencei;
  wire        _IntToFPUnit_io_resp_bits_uop_is_amo;
  wire        _IntToFPUnit_io_resp_bits_uop_uses_ldq;
  wire        _IntToFPUnit_io_resp_bits_uop_uses_stq;
  wire        _IntToFPUnit_io_resp_bits_uop_is_sys_pc2epc;
  wire        _IntToFPUnit_io_resp_bits_uop_is_unique;
  wire        _IntToFPUnit_io_resp_bits_uop_flush_on_commit;
  wire        _IntToFPUnit_io_resp_bits_uop_ldst_is_rs1;
  wire [5:0]  _IntToFPUnit_io_resp_bits_uop_ldst;
  wire [5:0]  _IntToFPUnit_io_resp_bits_uop_lrs1;
  wire [5:0]  _IntToFPUnit_io_resp_bits_uop_lrs2;
  wire [5:0]  _IntToFPUnit_io_resp_bits_uop_lrs3;
  wire        _IntToFPUnit_io_resp_bits_uop_ldst_val;
  wire [1:0]  _IntToFPUnit_io_resp_bits_uop_dst_rtype;
  wire [1:0]  _IntToFPUnit_io_resp_bits_uop_lrs1_rtype;
  wire [1:0]  _IntToFPUnit_io_resp_bits_uop_lrs2_rtype;
  wire        _IntToFPUnit_io_resp_bits_uop_frs3_en;
  wire        _IntToFPUnit_io_resp_bits_uop_fp_val;
  wire        _IntToFPUnit_io_resp_bits_uop_fp_single;
  wire        _IntToFPUnit_io_resp_bits_uop_xcpt_pf_if;
  wire        _IntToFPUnit_io_resp_bits_uop_xcpt_ae_if;
  wire        _IntToFPUnit_io_resp_bits_uop_xcpt_ma_if;
  wire        _IntToFPUnit_io_resp_bits_uop_bp_debug_if;
  wire        _IntToFPUnit_io_resp_bits_uop_bp_xcpt_if;
  wire [1:0]  _IntToFPUnit_io_resp_bits_uop_debug_fsrc;
  wire [1:0]  _IntToFPUnit_io_resp_bits_uop_debug_tsrc;
  wire [64:0] _IntToFPUnit_io_resp_bits_data;
  wire        _IntToFPUnit_io_resp_bits_fflags_valid;
  wire [6:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_uopc;
  wire [31:0] _IntToFPUnit_io_resp_bits_fflags_bits_uop_inst;
  wire [31:0] _IntToFPUnit_io_resp_bits_fflags_bits_uop_debug_inst;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_is_rvc;
  wire [39:0] _IntToFPUnit_io_resp_bits_fflags_bits_uop_debug_pc;
  wire [2:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_iq_type;
  wire [9:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_fu_code;
  wire [3:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_br_type;
  wire [1:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_op1_sel;
  wire [2:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_op2_sel;
  wire [2:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_imm_sel;
  wire [3:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_op_fcn;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw;
  wire [2:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_is_load;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_is_sta;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_is_std;
  wire [1:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_iw_state;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_iw_p1_poisoned;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_iw_p2_poisoned;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_is_br;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_is_jalr;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_is_jal;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_is_sfb;
  wire [19:0] _IntToFPUnit_io_resp_bits_fflags_bits_uop_br_mask;
  wire [4:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_br_tag;
  wire [5:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_ftq_idx;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_edge_inst;
  wire [5:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_pc_lob;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_taken;
  wire [19:0] _IntToFPUnit_io_resp_bits_fflags_bits_uop_imm_packed;
  wire [11:0] _IntToFPUnit_io_resp_bits_fflags_bits_uop_csr_addr;
  wire [6:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_rob_idx;
  wire [4:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_ldq_idx;
  wire [4:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_stq_idx;
  wire [1:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_rxq_idx;
  wire [6:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_pdst;
  wire [6:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_prs1;
  wire [6:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_prs2;
  wire [6:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_prs3;
  wire [5:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_ppred;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_prs1_busy;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_prs2_busy;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_prs3_busy;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_ppred_busy;
  wire [6:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_stale_pdst;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_exception;
  wire [63:0] _IntToFPUnit_io_resp_bits_fflags_bits_uop_exc_cause;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_bypassable;
  wire [4:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_mem_cmd;
  wire [1:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_mem_size;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_mem_signed;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_is_fence;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_is_fencei;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_is_amo;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_uses_ldq;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_uses_stq;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_is_sys_pc2epc;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_is_unique;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_flush_on_commit;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_ldst_is_rs1;
  wire [5:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_ldst;
  wire [5:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs1;
  wire [5:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs2;
  wire [5:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs3;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_ldst_val;
  wire [1:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_dst_rtype;
  wire [1:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs1_rtype;
  wire [1:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs2_rtype;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_frs3_en;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_fp_val;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_fp_single;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_xcpt_pf_if;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_xcpt_ae_if;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_xcpt_ma_if;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_bp_debug_if;
  wire        _IntToFPUnit_io_resp_bits_fflags_bits_uop_bp_xcpt_if;
  wire [1:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_debug_fsrc;
  wire [1:0]  _IntToFPUnit_io_resp_bits_fflags_bits_uop_debug_tsrc;
  wire [4:0]  _IntToFPUnit_io_resp_bits_fflags_bits_flags;
  wire [63:0] _ALUUnit_io_resp_bits_data;
  wire [63:0] _ALUUnit_io_bypass_0_bits_data;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~_queue_io_enq_ready) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at execution-unit.scala:360 assert (queue.io.enq.ready)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  ALUUnit ALUUnit (
    .clock                             (clock),
    .reset                             (reset),
    .io_req_valid                      (io_req_valid & (io_req_bits_uop_fu_code == 10'h1 | io_req_bits_uop_fu_code == 10'h2 | io_req_bits_uop_fu_code == 10'h20 & io_req_bits_uop_uopc != 7'h6C)),
    .io_req_bits_uop_uopc              (io_req_bits_uop_uopc),
    .io_req_bits_uop_is_rvc            (io_req_bits_uop_is_rvc),
    .io_req_bits_uop_ctrl_br_type      (io_req_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel      (io_req_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel      (io_req_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel      (io_req_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn       (io_req_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw       (io_req_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_is_br             (io_req_bits_uop_is_br),
    .io_req_bits_uop_is_jalr           (io_req_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal            (io_req_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb            (io_req_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask           (io_req_bits_uop_br_mask),
    .io_req_bits_uop_br_tag            (io_req_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx           (io_req_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst         (io_req_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob            (io_req_bits_uop_pc_lob),
    .io_req_bits_uop_taken             (io_req_bits_uop_taken),
    .io_req_bits_uop_imm_packed        (io_req_bits_uop_imm_packed),
    .io_req_bits_uop_rob_idx           (io_req_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx           (io_req_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx           (io_req_bits_uop_stq_idx),
    .io_req_bits_uop_pdst              (io_req_bits_uop_pdst),
    .io_req_bits_uop_prs1              (io_req_bits_uop_prs1),
    .io_req_bits_uop_bypassable        (io_req_bits_uop_bypassable),
    .io_req_bits_uop_is_amo            (io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_stq          (io_req_bits_uop_uses_stq),
    .io_req_bits_uop_dst_rtype         (io_req_bits_uop_dst_rtype),
    .io_req_bits_rs1_data              (io_req_bits_rs1_data[63:0]),
    .io_req_bits_rs2_data              (io_req_bits_rs2_data[63:0]),
    .io_req_bits_kill                  (io_req_bits_kill),
    .io_resp_valid                     (io_iresp_valid),
    .io_resp_bits_uop_rob_idx          (io_iresp_bits_uop_rob_idx),
    .io_resp_bits_uop_pdst             (io_iresp_bits_uop_pdst),
    .io_resp_bits_uop_bypassable       (io_iresp_bits_uop_bypassable),
    .io_resp_bits_uop_is_amo           (io_iresp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_stq         (io_iresp_bits_uop_uses_stq),
    .io_resp_bits_uop_dst_rtype        (io_iresp_bits_uop_dst_rtype),
    .io_resp_bits_data                 (_ALUUnit_io_resp_bits_data),
    .io_brupdate_b1_resolve_mask       (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask    (io_brupdate_b1_mispredict_mask),
    .io_bypass_0_valid                 (io_bypass_0_valid),
    .io_bypass_0_bits_uop_pdst         (io_bypass_0_bits_uop_pdst),
    .io_bypass_0_bits_uop_dst_rtype    (io_bypass_0_bits_uop_dst_rtype),
    .io_bypass_0_bits_data             (_ALUUnit_io_bypass_0_bits_data),
    .io_brinfo_uop_is_rvc              (io_brinfo_uop_is_rvc),
    .io_brinfo_uop_br_mask             (io_brinfo_uop_br_mask),
    .io_brinfo_uop_br_tag              (io_brinfo_uop_br_tag),
    .io_brinfo_uop_ftq_idx             (io_brinfo_uop_ftq_idx),
    .io_brinfo_uop_edge_inst           (io_brinfo_uop_edge_inst),
    .io_brinfo_uop_pc_lob              (io_brinfo_uop_pc_lob),
    .io_brinfo_uop_rob_idx             (io_brinfo_uop_rob_idx),
    .io_brinfo_uop_ldq_idx             (io_brinfo_uop_ldq_idx),
    .io_brinfo_uop_stq_idx             (io_brinfo_uop_stq_idx),
    .io_brinfo_valid                   (io_brinfo_valid),
    .io_brinfo_mispredict              (io_brinfo_mispredict),
    .io_brinfo_taken                   (io_brinfo_taken),
    .io_brinfo_cfi_type                (io_brinfo_cfi_type),
    .io_brinfo_pc_sel                  (io_brinfo_pc_sel),
    .io_brinfo_jalr_target             (io_brinfo_jalr_target),
    .io_brinfo_target_offset           (io_brinfo_target_offset),
    .io_get_ftq_pc_entry_cfi_idx_valid (io_get_ftq_pc_entry_cfi_idx_valid),
    .io_get_ftq_pc_entry_cfi_idx_bits  (io_get_ftq_pc_entry_cfi_idx_bits),
    .io_get_ftq_pc_entry_start_bank    (io_get_ftq_pc_entry_start_bank),
    .io_get_ftq_pc_pc                  (io_get_ftq_pc_pc),
    .io_get_ftq_pc_next_val            (io_get_ftq_pc_next_val),
    .io_get_ftq_pc_next_pc             (io_get_ftq_pc_next_pc)
  );
  IntToFPUnit IntToFPUnit (
    .clock                                        (clock),
    .reset                                        (reset),
    .io_req_valid                                 (io_req_valid & io_req_bits_uop_fu_code[8]),
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
    .io_req_bits_kill                             (io_req_bits_kill),
    .io_resp_valid                                (_IntToFPUnit_io_resp_valid),
    .io_resp_bits_uop_uopc                        (_IntToFPUnit_io_resp_bits_uop_uopc),
    .io_resp_bits_uop_inst                        (_IntToFPUnit_io_resp_bits_uop_inst),
    .io_resp_bits_uop_debug_inst                  (_IntToFPUnit_io_resp_bits_uop_debug_inst),
    .io_resp_bits_uop_is_rvc                      (_IntToFPUnit_io_resp_bits_uop_is_rvc),
    .io_resp_bits_uop_debug_pc                    (_IntToFPUnit_io_resp_bits_uop_debug_pc),
    .io_resp_bits_uop_iq_type                     (_IntToFPUnit_io_resp_bits_uop_iq_type),
    .io_resp_bits_uop_fu_code                     (_IntToFPUnit_io_resp_bits_uop_fu_code),
    .io_resp_bits_uop_ctrl_br_type                (_IntToFPUnit_io_resp_bits_uop_ctrl_br_type),
    .io_resp_bits_uop_ctrl_op1_sel                (_IntToFPUnit_io_resp_bits_uop_ctrl_op1_sel),
    .io_resp_bits_uop_ctrl_op2_sel                (_IntToFPUnit_io_resp_bits_uop_ctrl_op2_sel),
    .io_resp_bits_uop_ctrl_imm_sel                (_IntToFPUnit_io_resp_bits_uop_ctrl_imm_sel),
    .io_resp_bits_uop_ctrl_op_fcn                 (_IntToFPUnit_io_resp_bits_uop_ctrl_op_fcn),
    .io_resp_bits_uop_ctrl_fcn_dw                 (_IntToFPUnit_io_resp_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_uop_ctrl_csr_cmd                (_IntToFPUnit_io_resp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_ctrl_is_load                (_IntToFPUnit_io_resp_bits_uop_ctrl_is_load),
    .io_resp_bits_uop_ctrl_is_sta                 (_IntToFPUnit_io_resp_bits_uop_ctrl_is_sta),
    .io_resp_bits_uop_ctrl_is_std                 (_IntToFPUnit_io_resp_bits_uop_ctrl_is_std),
    .io_resp_bits_uop_iw_state                    (_IntToFPUnit_io_resp_bits_uop_iw_state),
    .io_resp_bits_uop_iw_p1_poisoned              (_IntToFPUnit_io_resp_bits_uop_iw_p1_poisoned),
    .io_resp_bits_uop_iw_p2_poisoned              (_IntToFPUnit_io_resp_bits_uop_iw_p2_poisoned),
    .io_resp_bits_uop_is_br                       (_IntToFPUnit_io_resp_bits_uop_is_br),
    .io_resp_bits_uop_is_jalr                     (_IntToFPUnit_io_resp_bits_uop_is_jalr),
    .io_resp_bits_uop_is_jal                      (_IntToFPUnit_io_resp_bits_uop_is_jal),
    .io_resp_bits_uop_is_sfb                      (_IntToFPUnit_io_resp_bits_uop_is_sfb),
    .io_resp_bits_uop_br_mask                     (_IntToFPUnit_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_br_tag                      (_IntToFPUnit_io_resp_bits_uop_br_tag),
    .io_resp_bits_uop_ftq_idx                     (_IntToFPUnit_io_resp_bits_uop_ftq_idx),
    .io_resp_bits_uop_edge_inst                   (_IntToFPUnit_io_resp_bits_uop_edge_inst),
    .io_resp_bits_uop_pc_lob                      (_IntToFPUnit_io_resp_bits_uop_pc_lob),
    .io_resp_bits_uop_taken                       (_IntToFPUnit_io_resp_bits_uop_taken),
    .io_resp_bits_uop_imm_packed                  (_IntToFPUnit_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_csr_addr                    (_IntToFPUnit_io_resp_bits_uop_csr_addr),
    .io_resp_bits_uop_rob_idx                     (_IntToFPUnit_io_resp_bits_uop_rob_idx),
    .io_resp_bits_uop_ldq_idx                     (_IntToFPUnit_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx                     (_IntToFPUnit_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_rxq_idx                     (_IntToFPUnit_io_resp_bits_uop_rxq_idx),
    .io_resp_bits_uop_pdst                        (_IntToFPUnit_io_resp_bits_uop_pdst),
    .io_resp_bits_uop_prs1                        (_IntToFPUnit_io_resp_bits_uop_prs1),
    .io_resp_bits_uop_prs2                        (_IntToFPUnit_io_resp_bits_uop_prs2),
    .io_resp_bits_uop_prs3                        (_IntToFPUnit_io_resp_bits_uop_prs3),
    .io_resp_bits_uop_ppred                       (_IntToFPUnit_io_resp_bits_uop_ppred),
    .io_resp_bits_uop_prs1_busy                   (_IntToFPUnit_io_resp_bits_uop_prs1_busy),
    .io_resp_bits_uop_prs2_busy                   (_IntToFPUnit_io_resp_bits_uop_prs2_busy),
    .io_resp_bits_uop_prs3_busy                   (_IntToFPUnit_io_resp_bits_uop_prs3_busy),
    .io_resp_bits_uop_ppred_busy                  (_IntToFPUnit_io_resp_bits_uop_ppred_busy),
    .io_resp_bits_uop_stale_pdst                  (_IntToFPUnit_io_resp_bits_uop_stale_pdst),
    .io_resp_bits_uop_exception                   (_IntToFPUnit_io_resp_bits_uop_exception),
    .io_resp_bits_uop_exc_cause                   (_IntToFPUnit_io_resp_bits_uop_exc_cause),
    .io_resp_bits_uop_bypassable                  (_IntToFPUnit_io_resp_bits_uop_bypassable),
    .io_resp_bits_uop_mem_cmd                     (_IntToFPUnit_io_resp_bits_uop_mem_cmd),
    .io_resp_bits_uop_mem_size                    (_IntToFPUnit_io_resp_bits_uop_mem_size),
    .io_resp_bits_uop_mem_signed                  (_IntToFPUnit_io_resp_bits_uop_mem_signed),
    .io_resp_bits_uop_is_fence                    (_IntToFPUnit_io_resp_bits_uop_is_fence),
    .io_resp_bits_uop_is_fencei                   (_IntToFPUnit_io_resp_bits_uop_is_fencei),
    .io_resp_bits_uop_is_amo                      (_IntToFPUnit_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq                    (_IntToFPUnit_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq                    (_IntToFPUnit_io_resp_bits_uop_uses_stq),
    .io_resp_bits_uop_is_sys_pc2epc               (_IntToFPUnit_io_resp_bits_uop_is_sys_pc2epc),
    .io_resp_bits_uop_is_unique                   (_IntToFPUnit_io_resp_bits_uop_is_unique),
    .io_resp_bits_uop_flush_on_commit             (_IntToFPUnit_io_resp_bits_uop_flush_on_commit),
    .io_resp_bits_uop_ldst_is_rs1                 (_IntToFPUnit_io_resp_bits_uop_ldst_is_rs1),
    .io_resp_bits_uop_ldst                        (_IntToFPUnit_io_resp_bits_uop_ldst),
    .io_resp_bits_uop_lrs1                        (_IntToFPUnit_io_resp_bits_uop_lrs1),
    .io_resp_bits_uop_lrs2                        (_IntToFPUnit_io_resp_bits_uop_lrs2),
    .io_resp_bits_uop_lrs3                        (_IntToFPUnit_io_resp_bits_uop_lrs3),
    .io_resp_bits_uop_ldst_val                    (_IntToFPUnit_io_resp_bits_uop_ldst_val),
    .io_resp_bits_uop_dst_rtype                   (_IntToFPUnit_io_resp_bits_uop_dst_rtype),
    .io_resp_bits_uop_lrs1_rtype                  (_IntToFPUnit_io_resp_bits_uop_lrs1_rtype),
    .io_resp_bits_uop_lrs2_rtype                  (_IntToFPUnit_io_resp_bits_uop_lrs2_rtype),
    .io_resp_bits_uop_frs3_en                     (_IntToFPUnit_io_resp_bits_uop_frs3_en),
    .io_resp_bits_uop_fp_val                      (_IntToFPUnit_io_resp_bits_uop_fp_val),
    .io_resp_bits_uop_fp_single                   (_IntToFPUnit_io_resp_bits_uop_fp_single),
    .io_resp_bits_uop_xcpt_pf_if                  (_IntToFPUnit_io_resp_bits_uop_xcpt_pf_if),
    .io_resp_bits_uop_xcpt_ae_if                  (_IntToFPUnit_io_resp_bits_uop_xcpt_ae_if),
    .io_resp_bits_uop_xcpt_ma_if                  (_IntToFPUnit_io_resp_bits_uop_xcpt_ma_if),
    .io_resp_bits_uop_bp_debug_if                 (_IntToFPUnit_io_resp_bits_uop_bp_debug_if),
    .io_resp_bits_uop_bp_xcpt_if                  (_IntToFPUnit_io_resp_bits_uop_bp_xcpt_if),
    .io_resp_bits_uop_debug_fsrc                  (_IntToFPUnit_io_resp_bits_uop_debug_fsrc),
    .io_resp_bits_uop_debug_tsrc                  (_IntToFPUnit_io_resp_bits_uop_debug_tsrc),
    .io_resp_bits_data                            (_IntToFPUnit_io_resp_bits_data),
    .io_resp_bits_fflags_valid                    (_IntToFPUnit_io_resp_bits_fflags_valid),
    .io_resp_bits_fflags_bits_uop_uopc            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_uopc),
    .io_resp_bits_fflags_bits_uop_inst            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_inst),
    .io_resp_bits_fflags_bits_uop_debug_inst      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_debug_inst),
    .io_resp_bits_fflags_bits_uop_is_rvc          (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_rvc),
    .io_resp_bits_fflags_bits_uop_debug_pc        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_debug_pc),
    .io_resp_bits_fflags_bits_uop_iq_type         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_iq_type),
    .io_resp_bits_fflags_bits_uop_fu_code         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_fu_code),
    .io_resp_bits_fflags_bits_uop_ctrl_br_type    (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_br_type),
    .io_resp_bits_fflags_bits_uop_ctrl_op1_sel    (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op2_sel    (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_imm_sel    (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_resp_bits_fflags_bits_uop_ctrl_op_fcn     (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_resp_bits_fflags_bits_uop_ctrl_fcn_dw     (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_resp_bits_fflags_bits_uop_ctrl_csr_cmd    (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_fflags_bits_uop_ctrl_is_load    (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_is_load),
    .io_resp_bits_fflags_bits_uop_ctrl_is_sta     (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_is_sta),
    .io_resp_bits_fflags_bits_uop_ctrl_is_std     (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_is_std),
    .io_resp_bits_fflags_bits_uop_iw_state        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_iw_state),
    .io_resp_bits_fflags_bits_uop_iw_p1_poisoned  (_IntToFPUnit_io_resp_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_resp_bits_fflags_bits_uop_iw_p2_poisoned  (_IntToFPUnit_io_resp_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_resp_bits_fflags_bits_uop_is_br           (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_br),
    .io_resp_bits_fflags_bits_uop_is_jalr         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_jalr),
    .io_resp_bits_fflags_bits_uop_is_jal          (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_jal),
    .io_resp_bits_fflags_bits_uop_is_sfb          (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_sfb),
    .io_resp_bits_fflags_bits_uop_br_mask         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_br_mask),
    .io_resp_bits_fflags_bits_uop_br_tag          (_IntToFPUnit_io_resp_bits_fflags_bits_uop_br_tag),
    .io_resp_bits_fflags_bits_uop_ftq_idx         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ftq_idx),
    .io_resp_bits_fflags_bits_uop_edge_inst       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_edge_inst),
    .io_resp_bits_fflags_bits_uop_pc_lob          (_IntToFPUnit_io_resp_bits_fflags_bits_uop_pc_lob),
    .io_resp_bits_fflags_bits_uop_taken           (_IntToFPUnit_io_resp_bits_fflags_bits_uop_taken),
    .io_resp_bits_fflags_bits_uop_imm_packed      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_imm_packed),
    .io_resp_bits_fflags_bits_uop_csr_addr        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_csr_addr),
    .io_resp_bits_fflags_bits_uop_rob_idx         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_rob_idx),
    .io_resp_bits_fflags_bits_uop_ldq_idx         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ldq_idx),
    .io_resp_bits_fflags_bits_uop_stq_idx         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_stq_idx),
    .io_resp_bits_fflags_bits_uop_rxq_idx         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_rxq_idx),
    .io_resp_bits_fflags_bits_uop_pdst            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_pdst),
    .io_resp_bits_fflags_bits_uop_prs1            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_prs1),
    .io_resp_bits_fflags_bits_uop_prs2            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_prs2),
    .io_resp_bits_fflags_bits_uop_prs3            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_prs3),
    .io_resp_bits_fflags_bits_uop_ppred           (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ppred),
    .io_resp_bits_fflags_bits_uop_prs1_busy       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_prs1_busy),
    .io_resp_bits_fflags_bits_uop_prs2_busy       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_prs2_busy),
    .io_resp_bits_fflags_bits_uop_prs3_busy       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_prs3_busy),
    .io_resp_bits_fflags_bits_uop_ppred_busy      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ppred_busy),
    .io_resp_bits_fflags_bits_uop_stale_pdst      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_stale_pdst),
    .io_resp_bits_fflags_bits_uop_exception       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_exception),
    .io_resp_bits_fflags_bits_uop_exc_cause       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_exc_cause),
    .io_resp_bits_fflags_bits_uop_bypassable      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_bypassable),
    .io_resp_bits_fflags_bits_uop_mem_cmd         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_mem_cmd),
    .io_resp_bits_fflags_bits_uop_mem_size        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_mem_size),
    .io_resp_bits_fflags_bits_uop_mem_signed      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_mem_signed),
    .io_resp_bits_fflags_bits_uop_is_fence        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_fence),
    .io_resp_bits_fflags_bits_uop_is_fencei       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_fencei),
    .io_resp_bits_fflags_bits_uop_is_amo          (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_amo),
    .io_resp_bits_fflags_bits_uop_uses_ldq        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_uses_ldq),
    .io_resp_bits_fflags_bits_uop_uses_stq        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_uses_stq),
    .io_resp_bits_fflags_bits_uop_is_sys_pc2epc   (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_resp_bits_fflags_bits_uop_is_unique       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_unique),
    .io_resp_bits_fflags_bits_uop_flush_on_commit (_IntToFPUnit_io_resp_bits_fflags_bits_uop_flush_on_commit),
    .io_resp_bits_fflags_bits_uop_ldst_is_rs1     (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ldst_is_rs1),
    .io_resp_bits_fflags_bits_uop_ldst            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ldst),
    .io_resp_bits_fflags_bits_uop_lrs1            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs1),
    .io_resp_bits_fflags_bits_uop_lrs2            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs2),
    .io_resp_bits_fflags_bits_uop_lrs3            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs3),
    .io_resp_bits_fflags_bits_uop_ldst_val        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ldst_val),
    .io_resp_bits_fflags_bits_uop_dst_rtype       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_dst_rtype),
    .io_resp_bits_fflags_bits_uop_lrs1_rtype      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs1_rtype),
    .io_resp_bits_fflags_bits_uop_lrs2_rtype      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs2_rtype),
    .io_resp_bits_fflags_bits_uop_frs3_en         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_frs3_en),
    .io_resp_bits_fflags_bits_uop_fp_val          (_IntToFPUnit_io_resp_bits_fflags_bits_uop_fp_val),
    .io_resp_bits_fflags_bits_uop_fp_single       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_fp_single),
    .io_resp_bits_fflags_bits_uop_xcpt_pf_if      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_xcpt_pf_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ae_if      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_xcpt_ae_if),
    .io_resp_bits_fflags_bits_uop_xcpt_ma_if      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_xcpt_ma_if),
    .io_resp_bits_fflags_bits_uop_bp_debug_if     (_IntToFPUnit_io_resp_bits_fflags_bits_uop_bp_debug_if),
    .io_resp_bits_fflags_bits_uop_bp_xcpt_if      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_bp_xcpt_if),
    .io_resp_bits_fflags_bits_uop_debug_fsrc      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_debug_fsrc),
    .io_resp_bits_fflags_bits_uop_debug_tsrc      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_debug_tsrc),
    .io_resp_bits_fflags_bits_flags               (_IntToFPUnit_io_resp_bits_fflags_bits_flags),
    .io_brupdate_b1_resolve_mask                  (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask               (io_brupdate_b1_mispredict_mask),
    .io_fcsr_rm                                   (io_fcsr_rm)
  );
  BranchKillableQueue_9 queue (
    .clock                                       (clock),
    .reset                                       (reset),
    .io_enq_ready                                (_queue_io_enq_ready),
    .io_enq_valid                                (_IntToFPUnit_io_resp_valid),
    .io_enq_bits_uop_uopc                        (_IntToFPUnit_io_resp_bits_uop_uopc),
    .io_enq_bits_uop_inst                        (_IntToFPUnit_io_resp_bits_uop_inst),
    .io_enq_bits_uop_debug_inst                  (_IntToFPUnit_io_resp_bits_uop_debug_inst),
    .io_enq_bits_uop_is_rvc                      (_IntToFPUnit_io_resp_bits_uop_is_rvc),
    .io_enq_bits_uop_debug_pc                    (_IntToFPUnit_io_resp_bits_uop_debug_pc),
    .io_enq_bits_uop_iq_type                     (_IntToFPUnit_io_resp_bits_uop_iq_type),
    .io_enq_bits_uop_fu_code                     (_IntToFPUnit_io_resp_bits_uop_fu_code),
    .io_enq_bits_uop_ctrl_br_type                (_IntToFPUnit_io_resp_bits_uop_ctrl_br_type),
    .io_enq_bits_uop_ctrl_op1_sel                (_IntToFPUnit_io_resp_bits_uop_ctrl_op1_sel),
    .io_enq_bits_uop_ctrl_op2_sel                (_IntToFPUnit_io_resp_bits_uop_ctrl_op2_sel),
    .io_enq_bits_uop_ctrl_imm_sel                (_IntToFPUnit_io_resp_bits_uop_ctrl_imm_sel),
    .io_enq_bits_uop_ctrl_op_fcn                 (_IntToFPUnit_io_resp_bits_uop_ctrl_op_fcn),
    .io_enq_bits_uop_ctrl_fcn_dw                 (_IntToFPUnit_io_resp_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_uop_ctrl_csr_cmd                (_IntToFPUnit_io_resp_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_uop_ctrl_is_load                (_IntToFPUnit_io_resp_bits_uop_ctrl_is_load),
    .io_enq_bits_uop_ctrl_is_sta                 (_IntToFPUnit_io_resp_bits_uop_ctrl_is_sta),
    .io_enq_bits_uop_ctrl_is_std                 (_IntToFPUnit_io_resp_bits_uop_ctrl_is_std),
    .io_enq_bits_uop_iw_state                    (_IntToFPUnit_io_resp_bits_uop_iw_state),
    .io_enq_bits_uop_iw_p1_poisoned              (_IntToFPUnit_io_resp_bits_uop_iw_p1_poisoned),
    .io_enq_bits_uop_iw_p2_poisoned              (_IntToFPUnit_io_resp_bits_uop_iw_p2_poisoned),
    .io_enq_bits_uop_is_br                       (_IntToFPUnit_io_resp_bits_uop_is_br),
    .io_enq_bits_uop_is_jalr                     (_IntToFPUnit_io_resp_bits_uop_is_jalr),
    .io_enq_bits_uop_is_jal                      (_IntToFPUnit_io_resp_bits_uop_is_jal),
    .io_enq_bits_uop_is_sfb                      (_IntToFPUnit_io_resp_bits_uop_is_sfb),
    .io_enq_bits_uop_br_mask                     (_IntToFPUnit_io_resp_bits_uop_br_mask),
    .io_enq_bits_uop_br_tag                      (_IntToFPUnit_io_resp_bits_uop_br_tag),
    .io_enq_bits_uop_ftq_idx                     (_IntToFPUnit_io_resp_bits_uop_ftq_idx),
    .io_enq_bits_uop_edge_inst                   (_IntToFPUnit_io_resp_bits_uop_edge_inst),
    .io_enq_bits_uop_pc_lob                      (_IntToFPUnit_io_resp_bits_uop_pc_lob),
    .io_enq_bits_uop_taken                       (_IntToFPUnit_io_resp_bits_uop_taken),
    .io_enq_bits_uop_imm_packed                  (_IntToFPUnit_io_resp_bits_uop_imm_packed),
    .io_enq_bits_uop_csr_addr                    (_IntToFPUnit_io_resp_bits_uop_csr_addr),
    .io_enq_bits_uop_rob_idx                     (_IntToFPUnit_io_resp_bits_uop_rob_idx),
    .io_enq_bits_uop_ldq_idx                     (_IntToFPUnit_io_resp_bits_uop_ldq_idx),
    .io_enq_bits_uop_stq_idx                     (_IntToFPUnit_io_resp_bits_uop_stq_idx),
    .io_enq_bits_uop_rxq_idx                     (_IntToFPUnit_io_resp_bits_uop_rxq_idx),
    .io_enq_bits_uop_pdst                        (_IntToFPUnit_io_resp_bits_uop_pdst),
    .io_enq_bits_uop_prs1                        (_IntToFPUnit_io_resp_bits_uop_prs1),
    .io_enq_bits_uop_prs2                        (_IntToFPUnit_io_resp_bits_uop_prs2),
    .io_enq_bits_uop_prs3                        (_IntToFPUnit_io_resp_bits_uop_prs3),
    .io_enq_bits_uop_ppred                       (_IntToFPUnit_io_resp_bits_uop_ppred),
    .io_enq_bits_uop_prs1_busy                   (_IntToFPUnit_io_resp_bits_uop_prs1_busy),
    .io_enq_bits_uop_prs2_busy                   (_IntToFPUnit_io_resp_bits_uop_prs2_busy),
    .io_enq_bits_uop_prs3_busy                   (_IntToFPUnit_io_resp_bits_uop_prs3_busy),
    .io_enq_bits_uop_ppred_busy                  (_IntToFPUnit_io_resp_bits_uop_ppred_busy),
    .io_enq_bits_uop_stale_pdst                  (_IntToFPUnit_io_resp_bits_uop_stale_pdst),
    .io_enq_bits_uop_exception                   (_IntToFPUnit_io_resp_bits_uop_exception),
    .io_enq_bits_uop_exc_cause                   (_IntToFPUnit_io_resp_bits_uop_exc_cause),
    .io_enq_bits_uop_bypassable                  (_IntToFPUnit_io_resp_bits_uop_bypassable),
    .io_enq_bits_uop_mem_cmd                     (_IntToFPUnit_io_resp_bits_uop_mem_cmd),
    .io_enq_bits_uop_mem_size                    (_IntToFPUnit_io_resp_bits_uop_mem_size),
    .io_enq_bits_uop_mem_signed                  (_IntToFPUnit_io_resp_bits_uop_mem_signed),
    .io_enq_bits_uop_is_fence                    (_IntToFPUnit_io_resp_bits_uop_is_fence),
    .io_enq_bits_uop_is_fencei                   (_IntToFPUnit_io_resp_bits_uop_is_fencei),
    .io_enq_bits_uop_is_amo                      (_IntToFPUnit_io_resp_bits_uop_is_amo),
    .io_enq_bits_uop_uses_ldq                    (_IntToFPUnit_io_resp_bits_uop_uses_ldq),
    .io_enq_bits_uop_uses_stq                    (_IntToFPUnit_io_resp_bits_uop_uses_stq),
    .io_enq_bits_uop_is_sys_pc2epc               (_IntToFPUnit_io_resp_bits_uop_is_sys_pc2epc),
    .io_enq_bits_uop_is_unique                   (_IntToFPUnit_io_resp_bits_uop_is_unique),
    .io_enq_bits_uop_flush_on_commit             (_IntToFPUnit_io_resp_bits_uop_flush_on_commit),
    .io_enq_bits_uop_ldst_is_rs1                 (_IntToFPUnit_io_resp_bits_uop_ldst_is_rs1),
    .io_enq_bits_uop_ldst                        (_IntToFPUnit_io_resp_bits_uop_ldst),
    .io_enq_bits_uop_lrs1                        (_IntToFPUnit_io_resp_bits_uop_lrs1),
    .io_enq_bits_uop_lrs2                        (_IntToFPUnit_io_resp_bits_uop_lrs2),
    .io_enq_bits_uop_lrs3                        (_IntToFPUnit_io_resp_bits_uop_lrs3),
    .io_enq_bits_uop_ldst_val                    (_IntToFPUnit_io_resp_bits_uop_ldst_val),
    .io_enq_bits_uop_dst_rtype                   (_IntToFPUnit_io_resp_bits_uop_dst_rtype),
    .io_enq_bits_uop_lrs1_rtype                  (_IntToFPUnit_io_resp_bits_uop_lrs1_rtype),
    .io_enq_bits_uop_lrs2_rtype                  (_IntToFPUnit_io_resp_bits_uop_lrs2_rtype),
    .io_enq_bits_uop_frs3_en                     (_IntToFPUnit_io_resp_bits_uop_frs3_en),
    .io_enq_bits_uop_fp_val                      (_IntToFPUnit_io_resp_bits_uop_fp_val),
    .io_enq_bits_uop_fp_single                   (_IntToFPUnit_io_resp_bits_uop_fp_single),
    .io_enq_bits_uop_xcpt_pf_if                  (_IntToFPUnit_io_resp_bits_uop_xcpt_pf_if),
    .io_enq_bits_uop_xcpt_ae_if                  (_IntToFPUnit_io_resp_bits_uop_xcpt_ae_if),
    .io_enq_bits_uop_xcpt_ma_if                  (_IntToFPUnit_io_resp_bits_uop_xcpt_ma_if),
    .io_enq_bits_uop_bp_debug_if                 (_IntToFPUnit_io_resp_bits_uop_bp_debug_if),
    .io_enq_bits_uop_bp_xcpt_if                  (_IntToFPUnit_io_resp_bits_uop_bp_xcpt_if),
    .io_enq_bits_uop_debug_fsrc                  (_IntToFPUnit_io_resp_bits_uop_debug_fsrc),
    .io_enq_bits_uop_debug_tsrc                  (_IntToFPUnit_io_resp_bits_uop_debug_tsrc),
    .io_enq_bits_data                            (_IntToFPUnit_io_resp_bits_data),
    .io_enq_bits_fflags_valid                    (_IntToFPUnit_io_resp_bits_fflags_valid),
    .io_enq_bits_fflags_bits_uop_uopc            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_uopc),
    .io_enq_bits_fflags_bits_uop_inst            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_inst),
    .io_enq_bits_fflags_bits_uop_debug_inst      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_debug_inst),
    .io_enq_bits_fflags_bits_uop_is_rvc          (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_rvc),
    .io_enq_bits_fflags_bits_uop_debug_pc        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_debug_pc),
    .io_enq_bits_fflags_bits_uop_iq_type         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_iq_type),
    .io_enq_bits_fflags_bits_uop_fu_code         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_fu_code),
    .io_enq_bits_fflags_bits_uop_ctrl_br_type    (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_br_type),
    .io_enq_bits_fflags_bits_uop_ctrl_op1_sel    (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_op1_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_op2_sel    (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_op2_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_imm_sel    (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_imm_sel),
    .io_enq_bits_fflags_bits_uop_ctrl_op_fcn     (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_op_fcn),
    .io_enq_bits_fflags_bits_uop_ctrl_fcn_dw     (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_fcn_dw),
    .io_enq_bits_fflags_bits_uop_ctrl_csr_cmd    (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_csr_cmd),
    .io_enq_bits_fflags_bits_uop_ctrl_is_load    (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_is_load),
    .io_enq_bits_fflags_bits_uop_ctrl_is_sta     (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_is_sta),
    .io_enq_bits_fflags_bits_uop_ctrl_is_std     (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ctrl_is_std),
    .io_enq_bits_fflags_bits_uop_iw_state        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_iw_state),
    .io_enq_bits_fflags_bits_uop_iw_p1_poisoned  (_IntToFPUnit_io_resp_bits_fflags_bits_uop_iw_p1_poisoned),
    .io_enq_bits_fflags_bits_uop_iw_p2_poisoned  (_IntToFPUnit_io_resp_bits_fflags_bits_uop_iw_p2_poisoned),
    .io_enq_bits_fflags_bits_uop_is_br           (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_br),
    .io_enq_bits_fflags_bits_uop_is_jalr         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_jalr),
    .io_enq_bits_fflags_bits_uop_is_jal          (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_jal),
    .io_enq_bits_fflags_bits_uop_is_sfb          (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_sfb),
    .io_enq_bits_fflags_bits_uop_br_mask         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_br_mask),
    .io_enq_bits_fflags_bits_uop_br_tag          (_IntToFPUnit_io_resp_bits_fflags_bits_uop_br_tag),
    .io_enq_bits_fflags_bits_uop_ftq_idx         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ftq_idx),
    .io_enq_bits_fflags_bits_uop_edge_inst       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_edge_inst),
    .io_enq_bits_fflags_bits_uop_pc_lob          (_IntToFPUnit_io_resp_bits_fflags_bits_uop_pc_lob),
    .io_enq_bits_fflags_bits_uop_taken           (_IntToFPUnit_io_resp_bits_fflags_bits_uop_taken),
    .io_enq_bits_fflags_bits_uop_imm_packed      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_imm_packed),
    .io_enq_bits_fflags_bits_uop_csr_addr        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_csr_addr),
    .io_enq_bits_fflags_bits_uop_rob_idx         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_rob_idx),
    .io_enq_bits_fflags_bits_uop_ldq_idx         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ldq_idx),
    .io_enq_bits_fflags_bits_uop_stq_idx         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_stq_idx),
    .io_enq_bits_fflags_bits_uop_rxq_idx         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_rxq_idx),
    .io_enq_bits_fflags_bits_uop_pdst            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_pdst),
    .io_enq_bits_fflags_bits_uop_prs1            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_prs1),
    .io_enq_bits_fflags_bits_uop_prs2            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_prs2),
    .io_enq_bits_fflags_bits_uop_prs3            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_prs3),
    .io_enq_bits_fflags_bits_uop_ppred           (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ppred),
    .io_enq_bits_fflags_bits_uop_prs1_busy       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_prs1_busy),
    .io_enq_bits_fflags_bits_uop_prs2_busy       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_prs2_busy),
    .io_enq_bits_fflags_bits_uop_prs3_busy       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_prs3_busy),
    .io_enq_bits_fflags_bits_uop_ppred_busy      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ppred_busy),
    .io_enq_bits_fflags_bits_uop_stale_pdst      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_stale_pdst),
    .io_enq_bits_fflags_bits_uop_exception       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_exception),
    .io_enq_bits_fflags_bits_uop_exc_cause       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_exc_cause),
    .io_enq_bits_fflags_bits_uop_bypassable      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_bypassable),
    .io_enq_bits_fflags_bits_uop_mem_cmd         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_mem_cmd),
    .io_enq_bits_fflags_bits_uop_mem_size        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_mem_size),
    .io_enq_bits_fflags_bits_uop_mem_signed      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_mem_signed),
    .io_enq_bits_fflags_bits_uop_is_fence        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_fence),
    .io_enq_bits_fflags_bits_uop_is_fencei       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_fencei),
    .io_enq_bits_fflags_bits_uop_is_amo          (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_amo),
    .io_enq_bits_fflags_bits_uop_uses_ldq        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_uses_ldq),
    .io_enq_bits_fflags_bits_uop_uses_stq        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_uses_stq),
    .io_enq_bits_fflags_bits_uop_is_sys_pc2epc   (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_sys_pc2epc),
    .io_enq_bits_fflags_bits_uop_is_unique       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_is_unique),
    .io_enq_bits_fflags_bits_uop_flush_on_commit (_IntToFPUnit_io_resp_bits_fflags_bits_uop_flush_on_commit),
    .io_enq_bits_fflags_bits_uop_ldst_is_rs1     (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ldst_is_rs1),
    .io_enq_bits_fflags_bits_uop_ldst            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ldst),
    .io_enq_bits_fflags_bits_uop_lrs1            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs1),
    .io_enq_bits_fflags_bits_uop_lrs2            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs2),
    .io_enq_bits_fflags_bits_uop_lrs3            (_IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs3),
    .io_enq_bits_fflags_bits_uop_ldst_val        (_IntToFPUnit_io_resp_bits_fflags_bits_uop_ldst_val),
    .io_enq_bits_fflags_bits_uop_dst_rtype       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_dst_rtype),
    .io_enq_bits_fflags_bits_uop_lrs1_rtype      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs1_rtype),
    .io_enq_bits_fflags_bits_uop_lrs2_rtype      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_lrs2_rtype),
    .io_enq_bits_fflags_bits_uop_frs3_en         (_IntToFPUnit_io_resp_bits_fflags_bits_uop_frs3_en),
    .io_enq_bits_fflags_bits_uop_fp_val          (_IntToFPUnit_io_resp_bits_fflags_bits_uop_fp_val),
    .io_enq_bits_fflags_bits_uop_fp_single       (_IntToFPUnit_io_resp_bits_fflags_bits_uop_fp_single),
    .io_enq_bits_fflags_bits_uop_xcpt_pf_if      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_xcpt_pf_if),
    .io_enq_bits_fflags_bits_uop_xcpt_ae_if      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_xcpt_ae_if),
    .io_enq_bits_fflags_bits_uop_xcpt_ma_if      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_xcpt_ma_if),
    .io_enq_bits_fflags_bits_uop_bp_debug_if     (_IntToFPUnit_io_resp_bits_fflags_bits_uop_bp_debug_if),
    .io_enq_bits_fflags_bits_uop_bp_xcpt_if      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_bp_xcpt_if),
    .io_enq_bits_fflags_bits_uop_debug_fsrc      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_debug_fsrc),
    .io_enq_bits_fflags_bits_uop_debug_tsrc      (_IntToFPUnit_io_resp_bits_fflags_bits_uop_debug_tsrc),
    .io_enq_bits_fflags_bits_flags               (_IntToFPUnit_io_resp_bits_fflags_bits_flags),
    .io_deq_ready                                (io_ll_fresp_ready),
    .io_deq_valid                                (io_ll_fresp_valid),
    .io_deq_bits_uop_uopc                        (io_ll_fresp_bits_uop_uopc),
    .io_deq_bits_uop_br_mask                     (io_ll_fresp_bits_uop_br_mask),
    .io_deq_bits_uop_rob_idx                     (io_ll_fresp_bits_uop_rob_idx),
    .io_deq_bits_uop_stq_idx                     (io_ll_fresp_bits_uop_stq_idx),
    .io_deq_bits_uop_pdst                        (io_ll_fresp_bits_uop_pdst),
    .io_deq_bits_uop_is_amo                      (io_ll_fresp_bits_uop_is_amo),
    .io_deq_bits_uop_uses_stq                    (io_ll_fresp_bits_uop_uses_stq),
    .io_deq_bits_uop_dst_rtype                   (io_ll_fresp_bits_uop_dst_rtype),
    .io_deq_bits_uop_fp_val                      (io_ll_fresp_bits_uop_fp_val),
    .io_deq_bits_data                            (io_ll_fresp_bits_data),
    .io_deq_bits_predicated                      (io_ll_fresp_bits_predicated),
    .io_deq_bits_fflags_valid                    (io_ll_fresp_bits_fflags_valid),
    .io_deq_bits_fflags_bits_uop_rob_idx         (io_ll_fresp_bits_fflags_bits_uop_rob_idx),
    .io_deq_bits_fflags_bits_flags               (io_ll_fresp_bits_fflags_bits_flags),
    .io_brupdate_b1_resolve_mask                 (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask              (io_brupdate_b1_mispredict_mask),
    .io_flush                                    (io_req_bits_kill),
    .io_empty                                    (_queue_io_empty)
  );
  assign io_fu_types = {1'h0, _queue_io_empty, 8'h3};
  assign io_iresp_bits_data = {1'h0, _ALUUnit_io_resp_bits_data};
  assign io_bypass_0_bits_data = {1'h0, _ALUUnit_io_bypass_0_bits_data};
endmodule

