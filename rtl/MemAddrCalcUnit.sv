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

module MemAddrCalcUnit(
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
                io_req_bits_rs2_data,
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
  output        io_resp_bits_uop_is_br,
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
  output [39:0] io_resp_bits_addr,
  output        io_resp_bits_mxcpt_valid,
                io_resp_bits_sfence_valid,
                io_resp_bits_sfence_bits_rs1,
                io_resp_bits_sfence_bits_rs2,
  output [38:0] io_resp_bits_sfence_bits_addr,
  input  [19:0] io_brupdate_b1_resolve_mask,
                io_brupdate_b1_mispredict_mask
);

  wire [63:0] _sum_T_3 = io_req_bits_rs1_data[63:0] + {{52{io_req_bits_uop_imm_packed[19]}}, io_req_bits_uop_imm_packed[19:8]};
  wire        misaligned = io_req_bits_uop_mem_size == 2'h1 & _sum_T_3[0] | io_req_bits_uop_mem_size == 2'h2 & (|(_sum_T_3[1:0])) | (&io_req_bits_uop_mem_size) & (|(_sum_T_3[2:0]));
  wire        ma_ld = io_req_valid & io_req_bits_uop_uopc == 7'h1 & misaligned;
  wire        ma_st = io_req_valid & (io_req_bits_uop_uopc == 7'h2 | io_req_bits_uop_uopc == 7'h43) & misaligned;
  `ifndef SYNTHESIS
    wire _GEN = io_req_valid & io_req_bits_uop_ctrl_is_std;
    always @(posedge clock) begin
      if (~reset & _GEN & io_req_bits_rs2_data[64]) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 65th bit set in MemAddrCalcUnit.\n    at functional-unit.scala:504 assert (!(io.req.valid && io.req.bits.uop.ctrl.is_std &&\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & _GEN & io_req_bits_uop_fp_val) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: FP store-data should now be going through a different unit.\n    at functional-unit.scala:507 assert (!(io.req.valid && io.req.bits.uop.ctrl.is_std && io.req.bits.uop.fp_val),\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & io_req_bits_uop_fp_val & io_req_valid & io_req_bits_uop_uopc != 7'h1 & io_req_bits_uop_uopc != 7'h2) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [maddrcalc] assert we never get store data in here.\n    at functional-unit.scala:511 assert (!(io.req.bits.uop.fp_val && io.req.valid && io.req.bits.uop.uopc =/=\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ma_ld & ma_st) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Mutually-exclusive exceptions are firing.\n    at functional-unit.scala:547 assert (!(ma_ld && ma_st), \"Mutually-exclusive exceptions are firing.\")\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  assign io_resp_valid = io_req_valid & (io_brupdate_b1_mispredict_mask & io_req_bits_uop_br_mask) == 20'h0;
  assign io_resp_bits_uop_uopc = io_req_bits_uop_uopc;
  assign io_resp_bits_uop_inst = io_req_bits_uop_inst;
  assign io_resp_bits_uop_debug_inst = io_req_bits_uop_debug_inst;
  assign io_resp_bits_uop_is_rvc = io_req_bits_uop_is_rvc;
  assign io_resp_bits_uop_debug_pc = io_req_bits_uop_debug_pc;
  assign io_resp_bits_uop_iq_type = io_req_bits_uop_iq_type;
  assign io_resp_bits_uop_fu_code = io_req_bits_uop_fu_code;
  assign io_resp_bits_uop_ctrl_br_type = io_req_bits_uop_ctrl_br_type;
  assign io_resp_bits_uop_ctrl_op1_sel = io_req_bits_uop_ctrl_op1_sel;
  assign io_resp_bits_uop_ctrl_op2_sel = io_req_bits_uop_ctrl_op2_sel;
  assign io_resp_bits_uop_ctrl_imm_sel = io_req_bits_uop_ctrl_imm_sel;
  assign io_resp_bits_uop_ctrl_op_fcn = io_req_bits_uop_ctrl_op_fcn;
  assign io_resp_bits_uop_ctrl_fcn_dw = io_req_bits_uop_ctrl_fcn_dw;
  assign io_resp_bits_uop_ctrl_csr_cmd = io_req_bits_uop_ctrl_csr_cmd;
  assign io_resp_bits_uop_ctrl_is_load = io_req_bits_uop_ctrl_is_load;
  assign io_resp_bits_uop_ctrl_is_sta = io_req_bits_uop_ctrl_is_sta;
  assign io_resp_bits_uop_ctrl_is_std = io_req_bits_uop_ctrl_is_std;
  assign io_resp_bits_uop_iw_state = io_req_bits_uop_iw_state;
  assign io_resp_bits_uop_is_br = io_req_bits_uop_is_br;
  assign io_resp_bits_uop_is_jalr = io_req_bits_uop_is_jalr;
  assign io_resp_bits_uop_is_jal = io_req_bits_uop_is_jal;
  assign io_resp_bits_uop_is_sfb = io_req_bits_uop_is_sfb;
  assign io_resp_bits_uop_br_mask = io_req_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask;
  assign io_resp_bits_uop_br_tag = io_req_bits_uop_br_tag;
  assign io_resp_bits_uop_ftq_idx = io_req_bits_uop_ftq_idx;
  assign io_resp_bits_uop_edge_inst = io_req_bits_uop_edge_inst;
  assign io_resp_bits_uop_pc_lob = io_req_bits_uop_pc_lob;
  assign io_resp_bits_uop_taken = io_req_bits_uop_taken;
  assign io_resp_bits_uop_imm_packed = io_req_bits_uop_imm_packed;
  assign io_resp_bits_uop_csr_addr = io_req_bits_uop_csr_addr;
  assign io_resp_bits_uop_rob_idx = io_req_bits_uop_rob_idx;
  assign io_resp_bits_uop_ldq_idx = io_req_bits_uop_ldq_idx;
  assign io_resp_bits_uop_stq_idx = io_req_bits_uop_stq_idx;
  assign io_resp_bits_uop_rxq_idx = io_req_bits_uop_rxq_idx;
  assign io_resp_bits_uop_pdst = io_req_bits_uop_pdst;
  assign io_resp_bits_uop_prs1 = io_req_bits_uop_prs1;
  assign io_resp_bits_uop_prs2 = io_req_bits_uop_prs2;
  assign io_resp_bits_uop_prs3 = io_req_bits_uop_prs3;
  assign io_resp_bits_uop_ppred = io_req_bits_uop_ppred;
  assign io_resp_bits_uop_prs1_busy = io_req_bits_uop_prs1_busy;
  assign io_resp_bits_uop_prs2_busy = io_req_bits_uop_prs2_busy;
  assign io_resp_bits_uop_prs3_busy = io_req_bits_uop_prs3_busy;
  assign io_resp_bits_uop_ppred_busy = io_req_bits_uop_ppred_busy;
  assign io_resp_bits_uop_stale_pdst = io_req_bits_uop_stale_pdst;
  assign io_resp_bits_uop_exception = io_req_bits_uop_exception;
  assign io_resp_bits_uop_exc_cause = io_req_bits_uop_exc_cause;
  assign io_resp_bits_uop_bypassable = io_req_bits_uop_bypassable;
  assign io_resp_bits_uop_mem_cmd = io_req_bits_uop_mem_cmd;
  assign io_resp_bits_uop_mem_size = io_req_bits_uop_mem_size;
  assign io_resp_bits_uop_mem_signed = io_req_bits_uop_mem_signed;
  assign io_resp_bits_uop_is_fence = io_req_bits_uop_is_fence;
  assign io_resp_bits_uop_is_fencei = io_req_bits_uop_is_fencei;
  assign io_resp_bits_uop_is_amo = io_req_bits_uop_is_amo;
  assign io_resp_bits_uop_uses_ldq = io_req_bits_uop_uses_ldq;
  assign io_resp_bits_uop_uses_stq = io_req_bits_uop_uses_stq;
  assign io_resp_bits_uop_is_sys_pc2epc = io_req_bits_uop_is_sys_pc2epc;
  assign io_resp_bits_uop_is_unique = io_req_bits_uop_is_unique;
  assign io_resp_bits_uop_flush_on_commit = io_req_bits_uop_flush_on_commit;
  assign io_resp_bits_uop_ldst_is_rs1 = io_req_bits_uop_ldst_is_rs1;
  assign io_resp_bits_uop_ldst = io_req_bits_uop_ldst;
  assign io_resp_bits_uop_lrs1 = io_req_bits_uop_lrs1;
  assign io_resp_bits_uop_lrs2 = io_req_bits_uop_lrs2;
  assign io_resp_bits_uop_lrs3 = io_req_bits_uop_lrs3;
  assign io_resp_bits_uop_ldst_val = io_req_bits_uop_ldst_val;
  assign io_resp_bits_uop_dst_rtype = io_req_bits_uop_dst_rtype;
  assign io_resp_bits_uop_lrs1_rtype = io_req_bits_uop_lrs1_rtype;
  assign io_resp_bits_uop_lrs2_rtype = io_req_bits_uop_lrs2_rtype;
  assign io_resp_bits_uop_frs3_en = io_req_bits_uop_frs3_en;
  assign io_resp_bits_uop_fp_val = io_req_bits_uop_fp_val;
  assign io_resp_bits_uop_fp_single = io_req_bits_uop_fp_single;
  assign io_resp_bits_uop_xcpt_pf_if = io_req_bits_uop_xcpt_pf_if;
  assign io_resp_bits_uop_xcpt_ae_if = io_req_bits_uop_xcpt_ae_if;
  assign io_resp_bits_uop_xcpt_ma_if = io_req_bits_uop_xcpt_ma_if;
  assign io_resp_bits_uop_bp_debug_if = io_req_bits_uop_bp_debug_if;
  assign io_resp_bits_uop_bp_xcpt_if = io_req_bits_uop_bp_xcpt_if;
  assign io_resp_bits_uop_debug_fsrc = io_req_bits_uop_debug_fsrc;
  assign io_resp_bits_uop_debug_tsrc = io_req_bits_uop_debug_tsrc;
  assign io_resp_bits_data = io_req_bits_rs2_data;
  assign io_resp_bits_addr = {_sum_T_3[38] ? (&(_sum_T_3[63:39])) : (|(_sum_T_3[63:39])), _sum_T_3[38:0]};
  assign io_resp_bits_mxcpt_valid = ma_ld | ma_st;
  assign io_resp_bits_sfence_valid = io_req_valid & io_req_bits_uop_mem_cmd == 5'h14;
  assign io_resp_bits_sfence_bits_rs1 = io_req_bits_uop_mem_size[0];
  assign io_resp_bits_sfence_bits_rs2 = io_req_bits_uop_mem_size[1];
  assign io_resp_bits_sfence_bits_addr = io_req_bits_rs1_data[38:0];
endmodule

