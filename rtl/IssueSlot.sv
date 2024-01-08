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

module IssueSlot(
  input         clock,
                reset,
  output        io_valid,
                io_will_be_valid,
                io_request,
  input         io_grant,
  input  [19:0] io_brupdate_b1_resolve_mask,
                io_brupdate_b1_mispredict_mask,
  input         io_kill,
                io_clear,
                io_wakeup_ports_0_valid,
  input  [6:0]  io_wakeup_ports_0_bits_pdst,
  input         io_wakeup_ports_1_valid,
  input  [6:0]  io_wakeup_ports_1_bits_pdst,
  input         io_wakeup_ports_2_valid,
  input  [6:0]  io_wakeup_ports_2_bits_pdst,
  input         io_wakeup_ports_3_valid,
  input  [6:0]  io_wakeup_ports_3_bits_pdst,
  input         io_in_uop_valid,
  input  [6:0]  io_in_uop_bits_uopc,
  input  [31:0] io_in_uop_bits_inst,
                io_in_uop_bits_debug_inst,
  input         io_in_uop_bits_is_rvc,
  input  [39:0] io_in_uop_bits_debug_pc,
  input  [2:0]  io_in_uop_bits_iq_type,
  input  [9:0]  io_in_uop_bits_fu_code,
  input  [1:0]  io_in_uop_bits_iw_state,
  input         io_in_uop_bits_is_br,
                io_in_uop_bits_is_jalr,
                io_in_uop_bits_is_jal,
                io_in_uop_bits_is_sfb,
  input  [19:0] io_in_uop_bits_br_mask,
  input  [4:0]  io_in_uop_bits_br_tag,
  input  [5:0]  io_in_uop_bits_ftq_idx,
  input         io_in_uop_bits_edge_inst,
  input  [5:0]  io_in_uop_bits_pc_lob,
  input         io_in_uop_bits_taken,
  input  [19:0] io_in_uop_bits_imm_packed,
  input  [11:0] io_in_uop_bits_csr_addr,
  input  [6:0]  io_in_uop_bits_rob_idx,
  input  [4:0]  io_in_uop_bits_ldq_idx,
                io_in_uop_bits_stq_idx,
  input  [1:0]  io_in_uop_bits_rxq_idx,
  input  [6:0]  io_in_uop_bits_pdst,
                io_in_uop_bits_prs1,
                io_in_uop_bits_prs2,
                io_in_uop_bits_prs3,
  input  [5:0]  io_in_uop_bits_ppred,
  input         io_in_uop_bits_prs1_busy,
                io_in_uop_bits_prs2_busy,
                io_in_uop_bits_prs3_busy,
                io_in_uop_bits_ppred_busy,
  input  [6:0]  io_in_uop_bits_stale_pdst,
  input         io_in_uop_bits_exception,
  input  [63:0] io_in_uop_bits_exc_cause,
  input         io_in_uop_bits_bypassable,
  input  [4:0]  io_in_uop_bits_mem_cmd,
  input  [1:0]  io_in_uop_bits_mem_size,
  input         io_in_uop_bits_mem_signed,
                io_in_uop_bits_is_fence,
                io_in_uop_bits_is_fencei,
                io_in_uop_bits_is_amo,
                io_in_uop_bits_uses_ldq,
                io_in_uop_bits_uses_stq,
                io_in_uop_bits_is_sys_pc2epc,
                io_in_uop_bits_is_unique,
                io_in_uop_bits_flush_on_commit,
                io_in_uop_bits_ldst_is_rs1,
  input  [5:0]  io_in_uop_bits_ldst,
                io_in_uop_bits_lrs1,
                io_in_uop_bits_lrs2,
                io_in_uop_bits_lrs3,
  input         io_in_uop_bits_ldst_val,
  input  [1:0]  io_in_uop_bits_dst_rtype,
                io_in_uop_bits_lrs1_rtype,
                io_in_uop_bits_lrs2_rtype,
  input         io_in_uop_bits_frs3_en,
                io_in_uop_bits_fp_val,
                io_in_uop_bits_fp_single,
                io_in_uop_bits_xcpt_pf_if,
                io_in_uop_bits_xcpt_ae_if,
                io_in_uop_bits_xcpt_ma_if,
                io_in_uop_bits_bp_debug_if,
                io_in_uop_bits_bp_xcpt_if,
  input  [1:0]  io_in_uop_bits_debug_fsrc,
                io_in_uop_bits_debug_tsrc,
  output [6:0]  io_out_uop_uopc,
  output [31:0] io_out_uop_inst,
                io_out_uop_debug_inst,
  output        io_out_uop_is_rvc,
  output [39:0] io_out_uop_debug_pc,
  output [2:0]  io_out_uop_iq_type,
  output [9:0]  io_out_uop_fu_code,
  output [1:0]  io_out_uop_iw_state,
  output        io_out_uop_is_br,
                io_out_uop_is_jalr,
                io_out_uop_is_jal,
                io_out_uop_is_sfb,
  output [19:0] io_out_uop_br_mask,
  output [4:0]  io_out_uop_br_tag,
  output [5:0]  io_out_uop_ftq_idx,
  output        io_out_uop_edge_inst,
  output [5:0]  io_out_uop_pc_lob,
  output        io_out_uop_taken,
  output [19:0] io_out_uop_imm_packed,
  output [11:0] io_out_uop_csr_addr,
  output [6:0]  io_out_uop_rob_idx,
  output [4:0]  io_out_uop_ldq_idx,
                io_out_uop_stq_idx,
  output [1:0]  io_out_uop_rxq_idx,
  output [6:0]  io_out_uop_pdst,
                io_out_uop_prs1,
                io_out_uop_prs2,
                io_out_uop_prs3,
  output [5:0]  io_out_uop_ppred,
  output        io_out_uop_prs1_busy,
                io_out_uop_prs2_busy,
                io_out_uop_prs3_busy,
                io_out_uop_ppred_busy,
  output [6:0]  io_out_uop_stale_pdst,
  output        io_out_uop_exception,
  output [63:0] io_out_uop_exc_cause,
  output        io_out_uop_bypassable,
  output [4:0]  io_out_uop_mem_cmd,
  output [1:0]  io_out_uop_mem_size,
  output        io_out_uop_mem_signed,
                io_out_uop_is_fence,
                io_out_uop_is_fencei,
                io_out_uop_is_amo,
                io_out_uop_uses_ldq,
                io_out_uop_uses_stq,
                io_out_uop_is_sys_pc2epc,
                io_out_uop_is_unique,
                io_out_uop_flush_on_commit,
                io_out_uop_ldst_is_rs1,
  output [5:0]  io_out_uop_ldst,
                io_out_uop_lrs1,
                io_out_uop_lrs2,
                io_out_uop_lrs3,
  output        io_out_uop_ldst_val,
  output [1:0]  io_out_uop_dst_rtype,
                io_out_uop_lrs1_rtype,
                io_out_uop_lrs2_rtype,
  output        io_out_uop_frs3_en,
                io_out_uop_fp_val,
                io_out_uop_fp_single,
                io_out_uop_xcpt_pf_if,
                io_out_uop_xcpt_ae_if,
                io_out_uop_xcpt_ma_if,
                io_out_uop_bp_debug_if,
                io_out_uop_bp_xcpt_if,
  output [1:0]  io_out_uop_debug_fsrc,
                io_out_uop_debug_tsrc,
  output [6:0]  io_uop_uopc,
  output [31:0] io_uop_inst,
                io_uop_debug_inst,
  output        io_uop_is_rvc,
  output [39:0] io_uop_debug_pc,
  output [2:0]  io_uop_iq_type,
  output [9:0]  io_uop_fu_code,
  output [1:0]  io_uop_iw_state,
  output        io_uop_is_br,
                io_uop_is_jalr,
                io_uop_is_jal,
                io_uop_is_sfb,
  output [19:0] io_uop_br_mask,
  output [4:0]  io_uop_br_tag,
  output [5:0]  io_uop_ftq_idx,
  output        io_uop_edge_inst,
  output [5:0]  io_uop_pc_lob,
  output        io_uop_taken,
  output [19:0] io_uop_imm_packed,
  output [11:0] io_uop_csr_addr,
  output [6:0]  io_uop_rob_idx,
  output [4:0]  io_uop_ldq_idx,
                io_uop_stq_idx,
  output [1:0]  io_uop_rxq_idx,
  output [6:0]  io_uop_pdst,
                io_uop_prs1,
                io_uop_prs2,
                io_uop_prs3,
  output [5:0]  io_uop_ppred,
  output        io_uop_prs1_busy,
                io_uop_prs2_busy,
                io_uop_prs3_busy,
                io_uop_ppred_busy,
  output [6:0]  io_uop_stale_pdst,
  output        io_uop_exception,
  output [63:0] io_uop_exc_cause,
  output        io_uop_bypassable,
  output [4:0]  io_uop_mem_cmd,
  output [1:0]  io_uop_mem_size,
  output        io_uop_mem_signed,
                io_uop_is_fence,
                io_uop_is_fencei,
                io_uop_is_amo,
                io_uop_uses_ldq,
                io_uop_uses_stq,
                io_uop_is_sys_pc2epc,
                io_uop_is_unique,
                io_uop_flush_on_commit,
                io_uop_ldst_is_rs1,
  output [5:0]  io_uop_ldst,
                io_uop_lrs1,
                io_uop_lrs2,
                io_uop_lrs3,
  output        io_uop_ldst_val,
  output [1:0]  io_uop_dst_rtype,
                io_uop_lrs1_rtype,
                io_uop_lrs2_rtype,
  output        io_uop_frs3_en,
                io_uop_fp_val,
                io_uop_fp_single,
                io_uop_xcpt_pf_if,
                io_uop_xcpt_ae_if,
                io_uop_xcpt_ma_if,
                io_uop_bp_debug_if,
                io_uop_bp_xcpt_if,
  output [1:0]  io_uop_debug_fsrc,
                io_uop_debug_tsrc
);

  reg  [1:0]  state;
  reg         p1;
  reg         p2;
  reg         p3;
  reg         ppred;
  reg  [6:0]  slot_uop_uopc;
  reg  [31:0] slot_uop_inst;
  reg  [31:0] slot_uop_debug_inst;
  reg         slot_uop_is_rvc;
  reg  [39:0] slot_uop_debug_pc;
  reg  [2:0]  slot_uop_iq_type;
  reg  [9:0]  slot_uop_fu_code;
  reg  [1:0]  slot_uop_iw_state;
  reg         slot_uop_is_br;
  reg         slot_uop_is_jalr;
  reg         slot_uop_is_jal;
  reg         slot_uop_is_sfb;
  reg  [19:0] slot_uop_br_mask;
  reg  [4:0]  slot_uop_br_tag;
  reg  [5:0]  slot_uop_ftq_idx;
  reg         slot_uop_edge_inst;
  reg  [5:0]  slot_uop_pc_lob;
  reg         slot_uop_taken;
  reg  [19:0] slot_uop_imm_packed;
  reg  [11:0] slot_uop_csr_addr;
  reg  [6:0]  slot_uop_rob_idx;
  reg  [4:0]  slot_uop_ldq_idx;
  reg  [4:0]  slot_uop_stq_idx;
  reg  [1:0]  slot_uop_rxq_idx;
  reg  [6:0]  slot_uop_pdst;
  reg  [6:0]  slot_uop_prs1;
  reg  [6:0]  slot_uop_prs2;
  reg  [6:0]  slot_uop_prs3;
  reg  [5:0]  slot_uop_ppred;
  reg         slot_uop_prs1_busy;
  reg         slot_uop_prs2_busy;
  reg         slot_uop_prs3_busy;
  reg         slot_uop_ppred_busy;
  reg  [6:0]  slot_uop_stale_pdst;
  reg         slot_uop_exception;
  reg  [63:0] slot_uop_exc_cause;
  reg         slot_uop_bypassable;
  reg  [4:0]  slot_uop_mem_cmd;
  reg  [1:0]  slot_uop_mem_size;
  reg         slot_uop_mem_signed;
  reg         slot_uop_is_fence;
  reg         slot_uop_is_fencei;
  reg         slot_uop_is_amo;
  reg         slot_uop_uses_ldq;
  reg         slot_uop_uses_stq;
  reg         slot_uop_is_sys_pc2epc;
  reg         slot_uop_is_unique;
  reg         slot_uop_flush_on_commit;
  reg         slot_uop_ldst_is_rs1;
  reg  [5:0]  slot_uop_ldst;
  reg  [5:0]  slot_uop_lrs1;
  reg  [5:0]  slot_uop_lrs2;
  reg  [5:0]  slot_uop_lrs3;
  reg         slot_uop_ldst_val;
  reg  [1:0]  slot_uop_dst_rtype;
  reg  [1:0]  slot_uop_lrs1_rtype;
  reg  [1:0]  slot_uop_lrs2_rtype;
  reg         slot_uop_frs3_en;
  reg         slot_uop_fp_val;
  reg         slot_uop_fp_single;
  reg         slot_uop_xcpt_pf_if;
  reg         slot_uop_xcpt_ae_if;
  reg         slot_uop_xcpt_ma_if;
  reg         slot_uop_bp_debug_if;
  reg         slot_uop_bp_xcpt_if;
  reg  [1:0]  slot_uop_debug_fsrc;
  reg  [1:0]  slot_uop_debug_tsrc;
  wire        _GEN = state == 2'h2;
  wire        _GEN_0 = io_grant & _GEN;
  wire        _GEN_1 = _GEN_0 & p1;
  wire        _GEN_2 = io_grant & state == 2'h1 | _GEN_1 & p2 & ppred;
  wire        _GEN_3 = io_kill | _GEN_2;
  wire        _GEN_4 = _GEN_3 | ~_GEN_1;
  wire        _GEN_5 = _GEN_3 | ~_GEN_0 | p1;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (io_in_uop_valid & ~reset & ~(state == 2'h0 | io_clear | io_kill)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: trying to overwrite a valid issue slot.\n    at issue-slot.scala:156 assert (is_invalid || io.clear || io.kill, \"trying to overwrite a valid issue slot.\")\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [19:0] next_br_mask = slot_uop_br_mask & ~io_brupdate_b1_resolve_mask;
  wire        _GEN_6 = (|(io_brupdate_b1_mispredict_mask & slot_uop_br_mask)) | io_kill | _GEN_2;
  wire        _may_vacate_T = state == 2'h1;
  wire        _may_vacate_T_1 = state == 2'h2;
  wire        _GEN_7 = p1 & p2 & ppred;
  wire        _GEN_8 = p1 & ppred;
  wire        _GEN_9 = ~_may_vacate_T_1 | _GEN_7 | _GEN_8 | ~(p2 & ppred);
  wire [6:0]  next_uop_prs1 = io_in_uop_valid ? io_in_uop_bits_prs1 : slot_uop_prs1;
  wire [6:0]  next_uop_prs2 = io_in_uop_valid ? io_in_uop_bits_prs2 : slot_uop_prs2;
  wire [6:0]  next_uop_prs3 = io_in_uop_valid ? io_in_uop_bits_prs3 : slot_uop_prs3;
  always @(posedge clock) begin
    if (reset) begin
      state <= 2'h0;
      p1 <= 1'h0;
      p2 <= 1'h0;
      p3 <= 1'h0;
      ppred <= 1'h0;
      slot_uop_uopc <= 7'h0;
      slot_uop_pdst <= 7'h0;
      slot_uop_bypassable <= 1'h0;
      slot_uop_uses_ldq <= 1'h0;
      slot_uop_uses_stq <= 1'h0;
      slot_uop_dst_rtype <= 2'h2;
      slot_uop_fp_val <= 1'h0;
    end
    else begin
      if (io_kill)
        state <= 2'h0;
      else if (io_in_uop_valid)
        state <= io_in_uop_bits_iw_state;
      else if (io_clear | _GEN_6)
        state <= 2'h0;
      else if (_GEN_0)
        state <= 2'h1;
      p1 <= io_wakeup_ports_3_valid & io_wakeup_ports_3_bits_pdst == next_uop_prs1 | io_wakeup_ports_2_valid & io_wakeup_ports_2_bits_pdst == next_uop_prs1 | io_wakeup_ports_1_valid & io_wakeup_ports_1_bits_pdst == next_uop_prs1 | io_wakeup_ports_0_valid & io_wakeup_ports_0_bits_pdst == next_uop_prs1 | (io_in_uop_valid ? ~io_in_uop_bits_prs1_busy : p1);
      p2 <= io_wakeup_ports_3_valid & io_wakeup_ports_3_bits_pdst == next_uop_prs2 | io_wakeup_ports_2_valid & io_wakeup_ports_2_bits_pdst == next_uop_prs2 | io_wakeup_ports_1_valid & io_wakeup_ports_1_bits_pdst == next_uop_prs2 | io_wakeup_ports_0_valid & io_wakeup_ports_0_bits_pdst == next_uop_prs2 | (io_in_uop_valid ? ~io_in_uop_bits_prs2_busy : p2);
      p3 <= io_wakeup_ports_3_valid & io_wakeup_ports_3_bits_pdst == next_uop_prs3 | io_wakeup_ports_2_valid & io_wakeup_ports_2_bits_pdst == next_uop_prs3 | io_wakeup_ports_1_valid & io_wakeup_ports_1_bits_pdst == next_uop_prs3 | io_wakeup_ports_0_valid & io_wakeup_ports_0_bits_pdst == next_uop_prs3 | (io_in_uop_valid ? ~io_in_uop_bits_prs3_busy : p3);
      if (io_in_uop_valid) begin
        ppred <= ~io_in_uop_bits_ppred_busy;
        slot_uop_uopc <= io_in_uop_bits_uopc;
        slot_uop_pdst <= io_in_uop_bits_pdst;
        slot_uop_bypassable <= io_in_uop_bits_bypassable;
        slot_uop_uses_ldq <= io_in_uop_bits_uses_ldq;
        slot_uop_uses_stq <= io_in_uop_bits_uses_stq;
        slot_uop_dst_rtype <= io_in_uop_bits_dst_rtype;
        slot_uop_fp_val <= io_in_uop_bits_fp_val;
      end
      else if (_GEN_4) begin
      end
      else
        slot_uop_uopc <= 7'h3;
    end
    if (io_in_uop_valid) begin
      slot_uop_inst <= io_in_uop_bits_inst;
      slot_uop_debug_inst <= io_in_uop_bits_debug_inst;
      slot_uop_is_rvc <= io_in_uop_bits_is_rvc;
      slot_uop_debug_pc <= io_in_uop_bits_debug_pc;
      slot_uop_iq_type <= io_in_uop_bits_iq_type;
      slot_uop_fu_code <= io_in_uop_bits_fu_code;
      slot_uop_iw_state <= io_in_uop_bits_iw_state;
      slot_uop_is_br <= io_in_uop_bits_is_br;
      slot_uop_is_jalr <= io_in_uop_bits_is_jalr;
      slot_uop_is_jal <= io_in_uop_bits_is_jal;
      slot_uop_is_sfb <= io_in_uop_bits_is_sfb;
      slot_uop_br_mask <= io_in_uop_bits_br_mask;
      slot_uop_br_tag <= io_in_uop_bits_br_tag;
      slot_uop_ftq_idx <= io_in_uop_bits_ftq_idx;
      slot_uop_edge_inst <= io_in_uop_bits_edge_inst;
      slot_uop_pc_lob <= io_in_uop_bits_pc_lob;
      slot_uop_taken <= io_in_uop_bits_taken;
      slot_uop_imm_packed <= io_in_uop_bits_imm_packed;
      slot_uop_csr_addr <= io_in_uop_bits_csr_addr;
      slot_uop_rob_idx <= io_in_uop_bits_rob_idx;
      slot_uop_ldq_idx <= io_in_uop_bits_ldq_idx;
      slot_uop_stq_idx <= io_in_uop_bits_stq_idx;
      slot_uop_rxq_idx <= io_in_uop_bits_rxq_idx;
      slot_uop_prs1 <= io_in_uop_bits_prs1;
      slot_uop_prs2 <= io_in_uop_bits_prs2;
      slot_uop_prs3 <= io_in_uop_bits_prs3;
      slot_uop_ppred <= io_in_uop_bits_ppred;
      slot_uop_prs1_busy <= io_in_uop_bits_prs1_busy;
      slot_uop_prs2_busy <= io_in_uop_bits_prs2_busy;
      slot_uop_prs3_busy <= io_in_uop_bits_prs3_busy;
      slot_uop_ppred_busy <= io_in_uop_bits_ppred_busy;
      slot_uop_stale_pdst <= io_in_uop_bits_stale_pdst;
      slot_uop_exception <= io_in_uop_bits_exception;
      slot_uop_exc_cause <= io_in_uop_bits_exc_cause;
      slot_uop_mem_cmd <= io_in_uop_bits_mem_cmd;
      slot_uop_mem_size <= io_in_uop_bits_mem_size;
      slot_uop_mem_signed <= io_in_uop_bits_mem_signed;
      slot_uop_is_fence <= io_in_uop_bits_is_fence;
      slot_uop_is_fencei <= io_in_uop_bits_is_fencei;
      slot_uop_is_amo <= io_in_uop_bits_is_amo;
      slot_uop_is_sys_pc2epc <= io_in_uop_bits_is_sys_pc2epc;
      slot_uop_is_unique <= io_in_uop_bits_is_unique;
      slot_uop_flush_on_commit <= io_in_uop_bits_flush_on_commit;
      slot_uop_ldst_is_rs1 <= io_in_uop_bits_ldst_is_rs1;
      slot_uop_ldst <= io_in_uop_bits_ldst;
      slot_uop_lrs1 <= io_in_uop_bits_lrs1;
      slot_uop_lrs2 <= io_in_uop_bits_lrs2;
      slot_uop_lrs3 <= io_in_uop_bits_lrs3;
      slot_uop_ldst_val <= io_in_uop_bits_ldst_val;
      slot_uop_lrs1_rtype <= io_in_uop_bits_lrs1_rtype;
      slot_uop_lrs2_rtype <= io_in_uop_bits_lrs2_rtype;
      slot_uop_frs3_en <= io_in_uop_bits_frs3_en;
      slot_uop_fp_single <= io_in_uop_bits_fp_single;
      slot_uop_xcpt_pf_if <= io_in_uop_bits_xcpt_pf_if;
      slot_uop_xcpt_ae_if <= io_in_uop_bits_xcpt_ae_if;
      slot_uop_xcpt_ma_if <= io_in_uop_bits_xcpt_ma_if;
      slot_uop_bp_debug_if <= io_in_uop_bits_bp_debug_if;
      slot_uop_bp_xcpt_if <= io_in_uop_bits_bp_xcpt_if;
      slot_uop_debug_fsrc <= io_in_uop_bits_debug_fsrc;
      slot_uop_debug_tsrc <= io_in_uop_bits_debug_tsrc;
    end
    else begin
      slot_uop_br_mask <= next_br_mask;
      if (_GEN_4) begin
      end
      else
        slot_uop_lrs1_rtype <= 2'h2;
      if (_GEN_5) begin
      end
      else
        slot_uop_lrs2_rtype <= 2'h2;
    end
  end // always @(posedge)
  assign io_valid = |state;
  assign io_will_be_valid = (|state) & ~(io_grant & (_may_vacate_T | _may_vacate_T_1 & p1 & p2 & ppred));
  assign io_request = _may_vacate_T ? p1 & p2 & p3 & ppred & ~io_kill : _GEN & (p1 | p2) & ppred & ~io_kill;
  assign io_out_uop_uopc = _GEN_4 ? slot_uop_uopc : 7'h3;
  assign io_out_uop_inst = slot_uop_inst;
  assign io_out_uop_debug_inst = slot_uop_debug_inst;
  assign io_out_uop_is_rvc = slot_uop_is_rvc;
  assign io_out_uop_debug_pc = slot_uop_debug_pc;
  assign io_out_uop_iq_type = slot_uop_iq_type;
  assign io_out_uop_fu_code = slot_uop_fu_code;
  assign io_out_uop_iw_state = _GEN_6 ? 2'h0 : _GEN_0 ? 2'h1 : state;
  assign io_out_uop_is_br = slot_uop_is_br;
  assign io_out_uop_is_jalr = slot_uop_is_jalr;
  assign io_out_uop_is_jal = slot_uop_is_jal;
  assign io_out_uop_is_sfb = slot_uop_is_sfb;
  assign io_out_uop_br_mask = next_br_mask;
  assign io_out_uop_br_tag = slot_uop_br_tag;
  assign io_out_uop_ftq_idx = slot_uop_ftq_idx;
  assign io_out_uop_edge_inst = slot_uop_edge_inst;
  assign io_out_uop_pc_lob = slot_uop_pc_lob;
  assign io_out_uop_taken = slot_uop_taken;
  assign io_out_uop_imm_packed = slot_uop_imm_packed;
  assign io_out_uop_csr_addr = slot_uop_csr_addr;
  assign io_out_uop_rob_idx = slot_uop_rob_idx;
  assign io_out_uop_ldq_idx = slot_uop_ldq_idx;
  assign io_out_uop_stq_idx = slot_uop_stq_idx;
  assign io_out_uop_rxq_idx = slot_uop_rxq_idx;
  assign io_out_uop_pdst = slot_uop_pdst;
  assign io_out_uop_prs1 = slot_uop_prs1;
  assign io_out_uop_prs2 = slot_uop_prs2;
  assign io_out_uop_prs3 = slot_uop_prs3;
  assign io_out_uop_ppred = slot_uop_ppred;
  assign io_out_uop_prs1_busy = ~p1;
  assign io_out_uop_prs2_busy = ~p2;
  assign io_out_uop_prs3_busy = ~p3;
  assign io_out_uop_ppred_busy = ~ppred;
  assign io_out_uop_stale_pdst = slot_uop_stale_pdst;
  assign io_out_uop_exception = slot_uop_exception;
  assign io_out_uop_exc_cause = slot_uop_exc_cause;
  assign io_out_uop_bypassable = slot_uop_bypassable;
  assign io_out_uop_mem_cmd = slot_uop_mem_cmd;
  assign io_out_uop_mem_size = slot_uop_mem_size;
  assign io_out_uop_mem_signed = slot_uop_mem_signed;
  assign io_out_uop_is_fence = slot_uop_is_fence;
  assign io_out_uop_is_fencei = slot_uop_is_fencei;
  assign io_out_uop_is_amo = slot_uop_is_amo;
  assign io_out_uop_uses_ldq = slot_uop_uses_ldq;
  assign io_out_uop_uses_stq = slot_uop_uses_stq;
  assign io_out_uop_is_sys_pc2epc = slot_uop_is_sys_pc2epc;
  assign io_out_uop_is_unique = slot_uop_is_unique;
  assign io_out_uop_flush_on_commit = slot_uop_flush_on_commit;
  assign io_out_uop_ldst_is_rs1 = slot_uop_ldst_is_rs1;
  assign io_out_uop_ldst = slot_uop_ldst;
  assign io_out_uop_lrs1 = slot_uop_lrs1;
  assign io_out_uop_lrs2 = slot_uop_lrs2;
  assign io_out_uop_lrs3 = slot_uop_lrs3;
  assign io_out_uop_ldst_val = slot_uop_ldst_val;
  assign io_out_uop_dst_rtype = slot_uop_dst_rtype;
  assign io_out_uop_lrs1_rtype = _GEN_4 ? slot_uop_lrs1_rtype : 2'h2;
  assign io_out_uop_lrs2_rtype = _GEN_5 ? slot_uop_lrs2_rtype : 2'h2;
  assign io_out_uop_frs3_en = slot_uop_frs3_en;
  assign io_out_uop_fp_val = slot_uop_fp_val;
  assign io_out_uop_fp_single = slot_uop_fp_single;
  assign io_out_uop_xcpt_pf_if = slot_uop_xcpt_pf_if;
  assign io_out_uop_xcpt_ae_if = slot_uop_xcpt_ae_if;
  assign io_out_uop_xcpt_ma_if = slot_uop_xcpt_ma_if;
  assign io_out_uop_bp_debug_if = slot_uop_bp_debug_if;
  assign io_out_uop_bp_xcpt_if = slot_uop_bp_xcpt_if;
  assign io_out_uop_debug_fsrc = slot_uop_debug_fsrc;
  assign io_out_uop_debug_tsrc = slot_uop_debug_tsrc;
  assign io_uop_uopc = _GEN_9 ? slot_uop_uopc : 7'h3;
  assign io_uop_inst = slot_uop_inst;
  assign io_uop_debug_inst = slot_uop_debug_inst;
  assign io_uop_is_rvc = slot_uop_is_rvc;
  assign io_uop_debug_pc = slot_uop_debug_pc;
  assign io_uop_iq_type = slot_uop_iq_type;
  assign io_uop_fu_code = slot_uop_fu_code;
  assign io_uop_iw_state = slot_uop_iw_state;
  assign io_uop_is_br = slot_uop_is_br;
  assign io_uop_is_jalr = slot_uop_is_jalr;
  assign io_uop_is_jal = slot_uop_is_jal;
  assign io_uop_is_sfb = slot_uop_is_sfb;
  assign io_uop_br_mask = slot_uop_br_mask;
  assign io_uop_br_tag = slot_uop_br_tag;
  assign io_uop_ftq_idx = slot_uop_ftq_idx;
  assign io_uop_edge_inst = slot_uop_edge_inst;
  assign io_uop_pc_lob = slot_uop_pc_lob;
  assign io_uop_taken = slot_uop_taken;
  assign io_uop_imm_packed = slot_uop_imm_packed;
  assign io_uop_csr_addr = slot_uop_csr_addr;
  assign io_uop_rob_idx = slot_uop_rob_idx;
  assign io_uop_ldq_idx = slot_uop_ldq_idx;
  assign io_uop_stq_idx = slot_uop_stq_idx;
  assign io_uop_rxq_idx = slot_uop_rxq_idx;
  assign io_uop_pdst = slot_uop_pdst;
  assign io_uop_prs1 = slot_uop_prs1;
  assign io_uop_prs2 = slot_uop_prs2;
  assign io_uop_prs3 = slot_uop_prs3;
  assign io_uop_ppred = slot_uop_ppred;
  assign io_uop_prs1_busy = slot_uop_prs1_busy;
  assign io_uop_prs2_busy = slot_uop_prs2_busy;
  assign io_uop_prs3_busy = slot_uop_prs3_busy;
  assign io_uop_ppred_busy = slot_uop_ppred_busy;
  assign io_uop_stale_pdst = slot_uop_stale_pdst;
  assign io_uop_exception = slot_uop_exception;
  assign io_uop_exc_cause = slot_uop_exc_cause;
  assign io_uop_bypassable = slot_uop_bypassable;
  assign io_uop_mem_cmd = slot_uop_mem_cmd;
  assign io_uop_mem_size = slot_uop_mem_size;
  assign io_uop_mem_signed = slot_uop_mem_signed;
  assign io_uop_is_fence = slot_uop_is_fence;
  assign io_uop_is_fencei = slot_uop_is_fencei;
  assign io_uop_is_amo = slot_uop_is_amo;
  assign io_uop_uses_ldq = slot_uop_uses_ldq;
  assign io_uop_uses_stq = slot_uop_uses_stq;
  assign io_uop_is_sys_pc2epc = slot_uop_is_sys_pc2epc;
  assign io_uop_is_unique = slot_uop_is_unique;
  assign io_uop_flush_on_commit = slot_uop_flush_on_commit;
  assign io_uop_ldst_is_rs1 = slot_uop_ldst_is_rs1;
  assign io_uop_ldst = slot_uop_ldst;
  assign io_uop_lrs1 = slot_uop_lrs1;
  assign io_uop_lrs2 = slot_uop_lrs2;
  assign io_uop_lrs3 = slot_uop_lrs3;
  assign io_uop_ldst_val = slot_uop_ldst_val;
  assign io_uop_dst_rtype = slot_uop_dst_rtype;
  assign io_uop_lrs1_rtype = _GEN_9 ? slot_uop_lrs1_rtype : 2'h2;
  assign io_uop_lrs2_rtype = ~_may_vacate_T_1 | _GEN_7 | ~_GEN_8 ? slot_uop_lrs2_rtype : 2'h2;
  assign io_uop_frs3_en = slot_uop_frs3_en;
  assign io_uop_fp_val = slot_uop_fp_val;
  assign io_uop_fp_single = slot_uop_fp_single;
  assign io_uop_xcpt_pf_if = slot_uop_xcpt_pf_if;
  assign io_uop_xcpt_ae_if = slot_uop_xcpt_ae_if;
  assign io_uop_xcpt_ma_if = slot_uop_xcpt_ma_if;
  assign io_uop_bp_debug_if = slot_uop_bp_debug_if;
  assign io_uop_bp_xcpt_if = slot_uop_bp_xcpt_if;
  assign io_uop_debug_fsrc = slot_uop_debug_fsrc;
  assign io_uop_debug_tsrc = slot_uop_debug_tsrc;
endmodule

