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

module BranchKillableQueue_10(
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
  input  [64:0] io_enq_bits_data,
  input         io_enq_bits_fflags_valid,
  input  [6:0]  io_enq_bits_fflags_bits_uop_uopc,
  input  [31:0] io_enq_bits_fflags_bits_uop_inst,
                io_enq_bits_fflags_bits_uop_debug_inst,
  input         io_enq_bits_fflags_bits_uop_is_rvc,
  input  [39:0] io_enq_bits_fflags_bits_uop_debug_pc,
  input  [2:0]  io_enq_bits_fflags_bits_uop_iq_type,
  input  [9:0]  io_enq_bits_fflags_bits_uop_fu_code,
  input  [3:0]  io_enq_bits_fflags_bits_uop_ctrl_br_type,
  input  [1:0]  io_enq_bits_fflags_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_enq_bits_fflags_bits_uop_ctrl_op2_sel,
                io_enq_bits_fflags_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_enq_bits_fflags_bits_uop_ctrl_op_fcn,
  input         io_enq_bits_fflags_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_enq_bits_fflags_bits_uop_ctrl_csr_cmd,
  input         io_enq_bits_fflags_bits_uop_ctrl_is_load,
                io_enq_bits_fflags_bits_uop_ctrl_is_sta,
                io_enq_bits_fflags_bits_uop_ctrl_is_std,
  input  [1:0]  io_enq_bits_fflags_bits_uop_iw_state,
  input         io_enq_bits_fflags_bits_uop_iw_p1_poisoned,
                io_enq_bits_fflags_bits_uop_iw_p2_poisoned,
                io_enq_bits_fflags_bits_uop_is_br,
                io_enq_bits_fflags_bits_uop_is_jalr,
                io_enq_bits_fflags_bits_uop_is_jal,
                io_enq_bits_fflags_bits_uop_is_sfb,
  input  [19:0] io_enq_bits_fflags_bits_uop_br_mask,
  input  [4:0]  io_enq_bits_fflags_bits_uop_br_tag,
  input  [5:0]  io_enq_bits_fflags_bits_uop_ftq_idx,
  input         io_enq_bits_fflags_bits_uop_edge_inst,
  input  [5:0]  io_enq_bits_fflags_bits_uop_pc_lob,
  input         io_enq_bits_fflags_bits_uop_taken,
  input  [19:0] io_enq_bits_fflags_bits_uop_imm_packed,
  input  [11:0] io_enq_bits_fflags_bits_uop_csr_addr,
  input  [6:0]  io_enq_bits_fflags_bits_uop_rob_idx,
  input  [4:0]  io_enq_bits_fflags_bits_uop_ldq_idx,
                io_enq_bits_fflags_bits_uop_stq_idx,
  input  [1:0]  io_enq_bits_fflags_bits_uop_rxq_idx,
  input  [6:0]  io_enq_bits_fflags_bits_uop_pdst,
                io_enq_bits_fflags_bits_uop_prs1,
                io_enq_bits_fflags_bits_uop_prs2,
                io_enq_bits_fflags_bits_uop_prs3,
  input  [5:0]  io_enq_bits_fflags_bits_uop_ppred,
  input         io_enq_bits_fflags_bits_uop_prs1_busy,
                io_enq_bits_fflags_bits_uop_prs2_busy,
                io_enq_bits_fflags_bits_uop_prs3_busy,
                io_enq_bits_fflags_bits_uop_ppred_busy,
  input  [6:0]  io_enq_bits_fflags_bits_uop_stale_pdst,
  input         io_enq_bits_fflags_bits_uop_exception,
  input  [63:0] io_enq_bits_fflags_bits_uop_exc_cause,
  input         io_enq_bits_fflags_bits_uop_bypassable,
  input  [4:0]  io_enq_bits_fflags_bits_uop_mem_cmd,
  input  [1:0]  io_enq_bits_fflags_bits_uop_mem_size,
  input         io_enq_bits_fflags_bits_uop_mem_signed,
                io_enq_bits_fflags_bits_uop_is_fence,
                io_enq_bits_fflags_bits_uop_is_fencei,
                io_enq_bits_fflags_bits_uop_is_amo,
                io_enq_bits_fflags_bits_uop_uses_ldq,
                io_enq_bits_fflags_bits_uop_uses_stq,
                io_enq_bits_fflags_bits_uop_is_sys_pc2epc,
                io_enq_bits_fflags_bits_uop_is_unique,
                io_enq_bits_fflags_bits_uop_flush_on_commit,
                io_enq_bits_fflags_bits_uop_ldst_is_rs1,
  input  [5:0]  io_enq_bits_fflags_bits_uop_ldst,
                io_enq_bits_fflags_bits_uop_lrs1,
                io_enq_bits_fflags_bits_uop_lrs2,
                io_enq_bits_fflags_bits_uop_lrs3,
  input         io_enq_bits_fflags_bits_uop_ldst_val,
  input  [1:0]  io_enq_bits_fflags_bits_uop_dst_rtype,
                io_enq_bits_fflags_bits_uop_lrs1_rtype,
                io_enq_bits_fflags_bits_uop_lrs2_rtype,
  input         io_enq_bits_fflags_bits_uop_frs3_en,
                io_enq_bits_fflags_bits_uop_fp_val,
                io_enq_bits_fflags_bits_uop_fp_single,
                io_enq_bits_fflags_bits_uop_xcpt_pf_if,
                io_enq_bits_fflags_bits_uop_xcpt_ae_if,
                io_enq_bits_fflags_bits_uop_xcpt_ma_if,
                io_enq_bits_fflags_bits_uop_bp_debug_if,
                io_enq_bits_fflags_bits_uop_bp_xcpt_if,
  input  [1:0]  io_enq_bits_fflags_bits_uop_debug_fsrc,
                io_enq_bits_fflags_bits_uop_debug_tsrc,
  input  [4:0]  io_enq_bits_fflags_bits_flags,
  input         io_deq_ready,
  output        io_deq_valid,
  output [6:0]  io_deq_bits_uop_uopc,
  output [19:0] io_deq_bits_uop_br_mask,
  output [6:0]  io_deq_bits_uop_rob_idx,
  output [4:0]  io_deq_bits_uop_stq_idx,
  output [6:0]  io_deq_bits_uop_pdst,
  output        io_deq_bits_uop_is_amo,
                io_deq_bits_uop_uses_stq,
  output [1:0]  io_deq_bits_uop_dst_rtype,
  output        io_deq_bits_uop_fp_val,
  output [64:0] io_deq_bits_data,
  output        io_deq_bits_predicated,
                io_deq_bits_fflags_valid,
  output [6:0]  io_deq_bits_fflags_bits_uop_rob_idx,
  output [4:0]  io_deq_bits_fflags_bits_flags,
  input  [19:0] io_brupdate_b1_resolve_mask,
                io_brupdate_b1_mispredict_mask,
  input         io_flush,
  output        io_empty
);

  wire [78:0] _ram_ext_R0_data;
  reg         valids_0;
  reg         valids_1;
  reg         valids_2;
  reg         valids_3;
  reg         valids_4;
  reg         valids_5;
  reg         valids_6;
  reg  [6:0]  uops_0_uopc;
  reg  [19:0] uops_0_br_mask;
  reg  [6:0]  uops_0_rob_idx;
  reg  [4:0]  uops_0_stq_idx;
  reg  [6:0]  uops_0_pdst;
  reg         uops_0_is_amo;
  reg         uops_0_uses_stq;
  reg  [1:0]  uops_0_dst_rtype;
  reg         uops_0_fp_val;
  reg  [6:0]  uops_1_uopc;
  reg  [19:0] uops_1_br_mask;
  reg  [6:0]  uops_1_rob_idx;
  reg  [4:0]  uops_1_stq_idx;
  reg  [6:0]  uops_1_pdst;
  reg         uops_1_is_amo;
  reg         uops_1_uses_stq;
  reg  [1:0]  uops_1_dst_rtype;
  reg         uops_1_fp_val;
  reg  [6:0]  uops_2_uopc;
  reg  [19:0] uops_2_br_mask;
  reg  [6:0]  uops_2_rob_idx;
  reg  [4:0]  uops_2_stq_idx;
  reg  [6:0]  uops_2_pdst;
  reg         uops_2_is_amo;
  reg         uops_2_uses_stq;
  reg  [1:0]  uops_2_dst_rtype;
  reg         uops_2_fp_val;
  reg  [6:0]  uops_3_uopc;
  reg  [19:0] uops_3_br_mask;
  reg  [6:0]  uops_3_rob_idx;
  reg  [4:0]  uops_3_stq_idx;
  reg  [6:0]  uops_3_pdst;
  reg         uops_3_is_amo;
  reg         uops_3_uses_stq;
  reg  [1:0]  uops_3_dst_rtype;
  reg         uops_3_fp_val;
  reg  [6:0]  uops_4_uopc;
  reg  [19:0] uops_4_br_mask;
  reg  [6:0]  uops_4_rob_idx;
  reg  [4:0]  uops_4_stq_idx;
  reg  [6:0]  uops_4_pdst;
  reg         uops_4_is_amo;
  reg         uops_4_uses_stq;
  reg  [1:0]  uops_4_dst_rtype;
  reg         uops_4_fp_val;
  reg  [6:0]  uops_5_uopc;
  reg  [19:0] uops_5_br_mask;
  reg  [6:0]  uops_5_rob_idx;
  reg  [4:0]  uops_5_stq_idx;
  reg  [6:0]  uops_5_pdst;
  reg         uops_5_is_amo;
  reg         uops_5_uses_stq;
  reg  [1:0]  uops_5_dst_rtype;
  reg         uops_5_fp_val;
  reg  [6:0]  uops_6_uopc;
  reg  [19:0] uops_6_br_mask;
  reg  [6:0]  uops_6_rob_idx;
  reg  [4:0]  uops_6_stq_idx;
  reg  [6:0]  uops_6_pdst;
  reg         uops_6_is_amo;
  reg         uops_6_uses_stq;
  reg  [1:0]  uops_6_dst_rtype;
  reg         uops_6_fp_val;
  reg  [2:0]  enq_ptr_value;
  reg  [2:0]  deq_ptr_value;
  reg         maybe_full;
  wire        ptr_match = enq_ptr_value == deq_ptr_value;
  wire        _io_empty_output = ptr_match & ~maybe_full;
  wire        full = ptr_match & maybe_full;
  reg         casez_tmp;
  always @(*) begin
    casez (deq_ptr_value)
      3'b000:
        casez_tmp = valids_0;
      3'b001:
        casez_tmp = valids_1;
      3'b010:
        casez_tmp = valids_2;
      3'b011:
        casez_tmp = valids_3;
      3'b100:
        casez_tmp = valids_4;
      3'b101:
        casez_tmp = valids_5;
      3'b110:
        casez_tmp = valids_6;
      default:
        casez_tmp = valids_0;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_0;
  always @(*) begin
    casez (deq_ptr_value)
      3'b000:
        casez_tmp_0 = uops_0_uopc;
      3'b001:
        casez_tmp_0 = uops_1_uopc;
      3'b010:
        casez_tmp_0 = uops_2_uopc;
      3'b011:
        casez_tmp_0 = uops_3_uopc;
      3'b100:
        casez_tmp_0 = uops_4_uopc;
      3'b101:
        casez_tmp_0 = uops_5_uopc;
      3'b110:
        casez_tmp_0 = uops_6_uopc;
      default:
        casez_tmp_0 = uops_0_uopc;
    endcase
  end // always @(*)
  reg  [19:0] casez_tmp_1;
  always @(*) begin
    casez (deq_ptr_value)
      3'b000:
        casez_tmp_1 = uops_0_br_mask;
      3'b001:
        casez_tmp_1 = uops_1_br_mask;
      3'b010:
        casez_tmp_1 = uops_2_br_mask;
      3'b011:
        casez_tmp_1 = uops_3_br_mask;
      3'b100:
        casez_tmp_1 = uops_4_br_mask;
      3'b101:
        casez_tmp_1 = uops_5_br_mask;
      3'b110:
        casez_tmp_1 = uops_6_br_mask;
      default:
        casez_tmp_1 = uops_0_br_mask;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_2;
  always @(*) begin
    casez (deq_ptr_value)
      3'b000:
        casez_tmp_2 = uops_0_rob_idx;
      3'b001:
        casez_tmp_2 = uops_1_rob_idx;
      3'b010:
        casez_tmp_2 = uops_2_rob_idx;
      3'b011:
        casez_tmp_2 = uops_3_rob_idx;
      3'b100:
        casez_tmp_2 = uops_4_rob_idx;
      3'b101:
        casez_tmp_2 = uops_5_rob_idx;
      3'b110:
        casez_tmp_2 = uops_6_rob_idx;
      default:
        casez_tmp_2 = uops_0_rob_idx;
    endcase
  end // always @(*)
  reg  [4:0]  casez_tmp_3;
  always @(*) begin
    casez (deq_ptr_value)
      3'b000:
        casez_tmp_3 = uops_0_stq_idx;
      3'b001:
        casez_tmp_3 = uops_1_stq_idx;
      3'b010:
        casez_tmp_3 = uops_2_stq_idx;
      3'b011:
        casez_tmp_3 = uops_3_stq_idx;
      3'b100:
        casez_tmp_3 = uops_4_stq_idx;
      3'b101:
        casez_tmp_3 = uops_5_stq_idx;
      3'b110:
        casez_tmp_3 = uops_6_stq_idx;
      default:
        casez_tmp_3 = uops_0_stq_idx;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_4;
  always @(*) begin
    casez (deq_ptr_value)
      3'b000:
        casez_tmp_4 = uops_0_pdst;
      3'b001:
        casez_tmp_4 = uops_1_pdst;
      3'b010:
        casez_tmp_4 = uops_2_pdst;
      3'b011:
        casez_tmp_4 = uops_3_pdst;
      3'b100:
        casez_tmp_4 = uops_4_pdst;
      3'b101:
        casez_tmp_4 = uops_5_pdst;
      3'b110:
        casez_tmp_4 = uops_6_pdst;
      default:
        casez_tmp_4 = uops_0_pdst;
    endcase
  end // always @(*)
  reg         casez_tmp_5;
  always @(*) begin
    casez (deq_ptr_value)
      3'b000:
        casez_tmp_5 = uops_0_is_amo;
      3'b001:
        casez_tmp_5 = uops_1_is_amo;
      3'b010:
        casez_tmp_5 = uops_2_is_amo;
      3'b011:
        casez_tmp_5 = uops_3_is_amo;
      3'b100:
        casez_tmp_5 = uops_4_is_amo;
      3'b101:
        casez_tmp_5 = uops_5_is_amo;
      3'b110:
        casez_tmp_5 = uops_6_is_amo;
      default:
        casez_tmp_5 = uops_0_is_amo;
    endcase
  end // always @(*)
  reg         casez_tmp_6;
  always @(*) begin
    casez (deq_ptr_value)
      3'b000:
        casez_tmp_6 = uops_0_uses_stq;
      3'b001:
        casez_tmp_6 = uops_1_uses_stq;
      3'b010:
        casez_tmp_6 = uops_2_uses_stq;
      3'b011:
        casez_tmp_6 = uops_3_uses_stq;
      3'b100:
        casez_tmp_6 = uops_4_uses_stq;
      3'b101:
        casez_tmp_6 = uops_5_uses_stq;
      3'b110:
        casez_tmp_6 = uops_6_uses_stq;
      default:
        casez_tmp_6 = uops_0_uses_stq;
    endcase
  end // always @(*)
  reg  [1:0]  casez_tmp_7;
  always @(*) begin
    casez (deq_ptr_value)
      3'b000:
        casez_tmp_7 = uops_0_dst_rtype;
      3'b001:
        casez_tmp_7 = uops_1_dst_rtype;
      3'b010:
        casez_tmp_7 = uops_2_dst_rtype;
      3'b011:
        casez_tmp_7 = uops_3_dst_rtype;
      3'b100:
        casez_tmp_7 = uops_4_dst_rtype;
      3'b101:
        casez_tmp_7 = uops_5_dst_rtype;
      3'b110:
        casez_tmp_7 = uops_6_dst_rtype;
      default:
        casez_tmp_7 = uops_0_dst_rtype;
    endcase
  end // always @(*)
  reg         casez_tmp_8;
  always @(*) begin
    casez (deq_ptr_value)
      3'b000:
        casez_tmp_8 = uops_0_fp_val;
      3'b001:
        casez_tmp_8 = uops_1_fp_val;
      3'b010:
        casez_tmp_8 = uops_2_fp_val;
      3'b011:
        casez_tmp_8 = uops_3_fp_val;
      3'b100:
        casez_tmp_8 = uops_4_fp_val;
      3'b101:
        casez_tmp_8 = uops_5_fp_val;
      3'b110:
        casez_tmp_8 = uops_6_fp_val;
      default:
        casez_tmp_8 = uops_0_fp_val;
    endcase
  end // always @(*)
  wire        do_deq = ~_io_empty_output & (io_deq_ready | ~casez_tmp) & ~_io_empty_output;
  wire        do_enq = ~(_io_empty_output & io_deq_ready) & ~full & io_enq_valid;
  wire        _GEN = enq_ptr_value == 3'h0;
  wire        _GEN_0 = do_enq & _GEN;
  wire        _GEN_1 = enq_ptr_value == 3'h1;
  wire        _GEN_2 = do_enq & _GEN_1;
  wire        _GEN_3 = enq_ptr_value == 3'h2;
  wire        _GEN_4 = do_enq & _GEN_3;
  wire        _GEN_5 = enq_ptr_value == 3'h3;
  wire        _GEN_6 = do_enq & _GEN_5;
  wire        _GEN_7 = enq_ptr_value == 3'h4;
  wire        _GEN_8 = do_enq & _GEN_7;
  wire        _GEN_9 = enq_ptr_value == 3'h5;
  wire        _GEN_10 = do_enq & _GEN_9;
  wire        _GEN_11 = enq_ptr_value == 3'h6;
  wire        _GEN_12 = do_enq & _GEN_11;
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
      enq_ptr_value <= 3'h0;
      deq_ptr_value <= 3'h0;
      maybe_full <= 1'h0;
    end
    else begin
      valids_0 <= ~(do_deq & deq_ptr_value == 3'h0) & (_GEN_0 | valids_0 & (io_brupdate_b1_mispredict_mask & uops_0_br_mask) == 20'h0 & ~io_flush);
      valids_1 <= ~(do_deq & deq_ptr_value == 3'h1) & (_GEN_2 | valids_1 & (io_brupdate_b1_mispredict_mask & uops_1_br_mask) == 20'h0 & ~io_flush);
      valids_2 <= ~(do_deq & deq_ptr_value == 3'h2) & (_GEN_4 | valids_2 & (io_brupdate_b1_mispredict_mask & uops_2_br_mask) == 20'h0 & ~io_flush);
      valids_3 <= ~(do_deq & deq_ptr_value == 3'h3) & (_GEN_6 | valids_3 & (io_brupdate_b1_mispredict_mask & uops_3_br_mask) == 20'h0 & ~io_flush);
      valids_4 <= ~(do_deq & deq_ptr_value == 3'h4) & (_GEN_8 | valids_4 & (io_brupdate_b1_mispredict_mask & uops_4_br_mask) == 20'h0 & ~io_flush);
      valids_5 <= ~(do_deq & deq_ptr_value == 3'h5) & (_GEN_10 | valids_5 & (io_brupdate_b1_mispredict_mask & uops_5_br_mask) == 20'h0 & ~io_flush);
      valids_6 <= ~(do_deq & deq_ptr_value == 3'h6) & (_GEN_12 | valids_6 & (io_brupdate_b1_mispredict_mask & uops_6_br_mask) == 20'h0 & ~io_flush);
      if (do_enq) begin
        if (enq_ptr_value == 3'h6)
          enq_ptr_value <= 3'h0;
        else
          enq_ptr_value <= enq_ptr_value + 3'h1;
      end
      if (do_deq) begin
        if (deq_ptr_value == 3'h6)
          deq_ptr_value <= 3'h0;
        else
          deq_ptr_value <= deq_ptr_value + 3'h1;
      end
      if (~(do_enq == do_deq))
        maybe_full <= do_enq;
    end
    if (_GEN_0) begin
      uops_0_uopc <= io_enq_bits_uop_uopc;
      uops_0_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_0_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_0_pdst <= io_enq_bits_uop_pdst;
      uops_0_is_amo <= io_enq_bits_uop_is_amo;
      uops_0_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_0_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_0_fp_val <= io_enq_bits_uop_fp_val;
    end
    if (do_enq & _GEN)
      uops_0_br_mask <= _uops_br_mask_T_1;
    else
      uops_0_br_mask <= ({20{~valids_0}} | ~io_brupdate_b1_resolve_mask) & uops_0_br_mask;
    if (_GEN_2) begin
      uops_1_uopc <= io_enq_bits_uop_uopc;
      uops_1_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_1_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_1_pdst <= io_enq_bits_uop_pdst;
      uops_1_is_amo <= io_enq_bits_uop_is_amo;
      uops_1_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_1_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_1_fp_val <= io_enq_bits_uop_fp_val;
    end
    if (do_enq & _GEN_1)
      uops_1_br_mask <= _uops_br_mask_T_1;
    else
      uops_1_br_mask <= ({20{~valids_1}} | ~io_brupdate_b1_resolve_mask) & uops_1_br_mask;
    if (_GEN_4) begin
      uops_2_uopc <= io_enq_bits_uop_uopc;
      uops_2_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_2_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_2_pdst <= io_enq_bits_uop_pdst;
      uops_2_is_amo <= io_enq_bits_uop_is_amo;
      uops_2_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_2_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_2_fp_val <= io_enq_bits_uop_fp_val;
    end
    if (do_enq & _GEN_3)
      uops_2_br_mask <= _uops_br_mask_T_1;
    else
      uops_2_br_mask <= ({20{~valids_2}} | ~io_brupdate_b1_resolve_mask) & uops_2_br_mask;
    if (_GEN_6) begin
      uops_3_uopc <= io_enq_bits_uop_uopc;
      uops_3_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_3_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_3_pdst <= io_enq_bits_uop_pdst;
      uops_3_is_amo <= io_enq_bits_uop_is_amo;
      uops_3_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_3_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_3_fp_val <= io_enq_bits_uop_fp_val;
    end
    if (do_enq & _GEN_5)
      uops_3_br_mask <= _uops_br_mask_T_1;
    else
      uops_3_br_mask <= ({20{~valids_3}} | ~io_brupdate_b1_resolve_mask) & uops_3_br_mask;
    if (_GEN_8) begin
      uops_4_uopc <= io_enq_bits_uop_uopc;
      uops_4_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_4_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_4_pdst <= io_enq_bits_uop_pdst;
      uops_4_is_amo <= io_enq_bits_uop_is_amo;
      uops_4_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_4_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_4_fp_val <= io_enq_bits_uop_fp_val;
    end
    if (do_enq & _GEN_7)
      uops_4_br_mask <= _uops_br_mask_T_1;
    else
      uops_4_br_mask <= ({20{~valids_4}} | ~io_brupdate_b1_resolve_mask) & uops_4_br_mask;
    if (_GEN_10) begin
      uops_5_uopc <= io_enq_bits_uop_uopc;
      uops_5_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_5_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_5_pdst <= io_enq_bits_uop_pdst;
      uops_5_is_amo <= io_enq_bits_uop_is_amo;
      uops_5_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_5_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_5_fp_val <= io_enq_bits_uop_fp_val;
    end
    if (do_enq & _GEN_9)
      uops_5_br_mask <= _uops_br_mask_T_1;
    else
      uops_5_br_mask <= ({20{~valids_5}} | ~io_brupdate_b1_resolve_mask) & uops_5_br_mask;
    if (_GEN_12) begin
      uops_6_uopc <= io_enq_bits_uop_uopc;
      uops_6_rob_idx <= io_enq_bits_uop_rob_idx;
      uops_6_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_6_pdst <= io_enq_bits_uop_pdst;
      uops_6_is_amo <= io_enq_bits_uop_is_amo;
      uops_6_uses_stq <= io_enq_bits_uop_uses_stq;
      uops_6_dst_rtype <= io_enq_bits_uop_dst_rtype;
      uops_6_fp_val <= io_enq_bits_uop_fp_val;
    end
    if (do_enq & _GEN_11)
      uops_6_br_mask <= _uops_br_mask_T_1;
    else
      uops_6_br_mask <= ({20{~valids_6}} | ~io_brupdate_b1_resolve_mask) & uops_6_br_mask;
  end // always @(posedge)
  ram_7x79 ram_ext (
    .R0_addr (deq_ptr_value),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_ram_ext_R0_data),
    .W0_addr (enq_ptr_value),
    .W0_en   (do_enq),
    .W0_clk  (clock),
    .W0_data ({io_enq_bits_fflags_bits_flags, io_enq_bits_fflags_bits_uop_rob_idx, io_enq_bits_fflags_valid, 1'h0, io_enq_bits_data})
  );
  assign io_enq_ready = ~full;
  assign io_deq_valid = _io_empty_output ? io_enq_valid : ~_io_empty_output & casez_tmp & (io_brupdate_b1_mispredict_mask & casez_tmp_1) == 20'h0 & ~io_flush;
  assign io_deq_bits_uop_uopc = _io_empty_output ? io_enq_bits_uop_uopc : casez_tmp_0;
  assign io_deq_bits_uop_br_mask = _io_empty_output ? io_enq_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask : casez_tmp_1 & ~io_brupdate_b1_resolve_mask;
  assign io_deq_bits_uop_rob_idx = _io_empty_output ? io_enq_bits_uop_rob_idx : casez_tmp_2;
  assign io_deq_bits_uop_stq_idx = _io_empty_output ? io_enq_bits_uop_stq_idx : casez_tmp_3;
  assign io_deq_bits_uop_pdst = _io_empty_output ? io_enq_bits_uop_pdst : casez_tmp_4;
  assign io_deq_bits_uop_is_amo = _io_empty_output ? io_enq_bits_uop_is_amo : casez_tmp_5;
  assign io_deq_bits_uop_uses_stq = _io_empty_output ? io_enq_bits_uop_uses_stq : casez_tmp_6;
  assign io_deq_bits_uop_dst_rtype = _io_empty_output ? io_enq_bits_uop_dst_rtype : casez_tmp_7;
  assign io_deq_bits_uop_fp_val = _io_empty_output ? io_enq_bits_uop_fp_val : casez_tmp_8;
  assign io_deq_bits_data = _io_empty_output ? io_enq_bits_data : _ram_ext_R0_data[64:0];
  assign io_deq_bits_predicated = ~_io_empty_output & _ram_ext_R0_data[65];
  assign io_deq_bits_fflags_valid = _io_empty_output ? io_enq_bits_fflags_valid : _ram_ext_R0_data[66];
  assign io_deq_bits_fflags_bits_uop_rob_idx = _io_empty_output ? io_enq_bits_fflags_bits_uop_rob_idx : _ram_ext_R0_data[73:67];
  assign io_deq_bits_fflags_bits_flags = _io_empty_output ? io_enq_bits_fflags_bits_flags : _ram_ext_R0_data[78:74];
  assign io_empty = _io_empty_output;
endmodule

