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

module BranchKillableQueue_8(
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
  input  [63:0] io_enq_bits_data,
  input         io_enq_bits_is_hella,
                io_deq_ready,
  output        io_deq_valid,
  output [19:0] io_deq_bits_uop_br_mask,
  output [4:0]  io_deq_bits_uop_ldq_idx,
                io_deq_bits_uop_stq_idx,
  output        io_deq_bits_uop_is_amo,
                io_deq_bits_uop_uses_ldq,
                io_deq_bits_uop_uses_stq,
  output [63:0] io_deq_bits_data,
  output        io_deq_bits_is_hella,
  input  [19:0] io_brupdate_b1_resolve_mask,
                io_brupdate_b1_mispredict_mask,
  input         io_flush
);

  wire [64:0] _ram_ext_R0_data;
  reg         valids_0;
  reg         valids_1;
  reg         valids_2;
  reg         valids_3;
  reg  [19:0] uops_0_br_mask;
  reg  [4:0]  uops_0_ldq_idx;
  reg  [4:0]  uops_0_stq_idx;
  reg         uops_0_is_amo;
  reg         uops_0_uses_ldq;
  reg         uops_0_uses_stq;
  reg  [19:0] uops_1_br_mask;
  reg  [4:0]  uops_1_ldq_idx;
  reg  [4:0]  uops_1_stq_idx;
  reg         uops_1_is_amo;
  reg         uops_1_uses_ldq;
  reg         uops_1_uses_stq;
  reg  [19:0] uops_2_br_mask;
  reg  [4:0]  uops_2_ldq_idx;
  reg  [4:0]  uops_2_stq_idx;
  reg         uops_2_is_amo;
  reg         uops_2_uses_ldq;
  reg         uops_2_uses_stq;
  reg  [19:0] uops_3_br_mask;
  reg  [4:0]  uops_3_ldq_idx;
  reg  [4:0]  uops_3_stq_idx;
  reg         uops_3_is_amo;
  reg         uops_3_uses_ldq;
  reg         uops_3_uses_stq;
  reg  [1:0]  enq_ptr_value;
  reg  [1:0]  deq_ptr_value;
  reg         maybe_full;
  wire        ptr_match = enq_ptr_value == deq_ptr_value;
  wire        _io_empty_T_1 = ptr_match & ~maybe_full;
  wire        full = ptr_match & maybe_full;
  wire        do_enq = ~full & io_enq_valid;
  reg         casez_tmp;
  always @(*) begin
    casez (deq_ptr_value)
      2'b00:
        casez_tmp = valids_0;
      2'b01:
        casez_tmp = valids_1;
      2'b10:
        casez_tmp = valids_2;
      default:
        casez_tmp = valids_3;
    endcase
  end // always @(*)
  reg  [19:0] casez_tmp_0;
  always @(*) begin
    casez (deq_ptr_value)
      2'b00:
        casez_tmp_0 = uops_0_br_mask;
      2'b01:
        casez_tmp_0 = uops_1_br_mask;
      2'b10:
        casez_tmp_0 = uops_2_br_mask;
      default:
        casez_tmp_0 = uops_3_br_mask;
    endcase
  end // always @(*)
  reg  [4:0]  casez_tmp_1;
  always @(*) begin
    casez (deq_ptr_value)
      2'b00:
        casez_tmp_1 = uops_0_ldq_idx;
      2'b01:
        casez_tmp_1 = uops_1_ldq_idx;
      2'b10:
        casez_tmp_1 = uops_2_ldq_idx;
      default:
        casez_tmp_1 = uops_3_ldq_idx;
    endcase
  end // always @(*)
  reg  [4:0]  casez_tmp_2;
  always @(*) begin
    casez (deq_ptr_value)
      2'b00:
        casez_tmp_2 = uops_0_stq_idx;
      2'b01:
        casez_tmp_2 = uops_1_stq_idx;
      2'b10:
        casez_tmp_2 = uops_2_stq_idx;
      default:
        casez_tmp_2 = uops_3_stq_idx;
    endcase
  end // always @(*)
  reg         casez_tmp_3;
  always @(*) begin
    casez (deq_ptr_value)
      2'b00:
        casez_tmp_3 = uops_0_is_amo;
      2'b01:
        casez_tmp_3 = uops_1_is_amo;
      2'b10:
        casez_tmp_3 = uops_2_is_amo;
      default:
        casez_tmp_3 = uops_3_is_amo;
    endcase
  end // always @(*)
  reg         casez_tmp_4;
  always @(*) begin
    casez (deq_ptr_value)
      2'b00:
        casez_tmp_4 = uops_0_uses_ldq;
      2'b01:
        casez_tmp_4 = uops_1_uses_ldq;
      2'b10:
        casez_tmp_4 = uops_2_uses_ldq;
      default:
        casez_tmp_4 = uops_3_uses_ldq;
    endcase
  end // always @(*)
  reg         casez_tmp_5;
  always @(*) begin
    casez (deq_ptr_value)
      2'b00:
        casez_tmp_5 = uops_0_uses_stq;
      2'b01:
        casez_tmp_5 = uops_1_uses_stq;
      2'b10:
        casez_tmp_5 = uops_2_uses_stq;
      default:
        casez_tmp_5 = uops_3_uses_stq;
    endcase
  end // always @(*)
  wire        do_deq = (io_deq_ready | ~casez_tmp) & ~_io_empty_T_1;
  wire        _GEN = enq_ptr_value == 2'h0;
  wire        _GEN_0 = do_enq & _GEN;
  wire        _GEN_1 = enq_ptr_value == 2'h1;
  wire        _GEN_2 = do_enq & _GEN_1;
  wire        _GEN_3 = enq_ptr_value == 2'h2;
  wire        _GEN_4 = do_enq & _GEN_3;
  wire        _GEN_5 = do_enq & (&enq_ptr_value);
  wire [19:0] _uops_br_mask_T_1 = io_enq_bits_uop_br_mask & ~io_brupdate_b1_resolve_mask;
  always @(posedge clock) begin
    if (reset) begin
      valids_0 <= 1'h0;
      valids_1 <= 1'h0;
      valids_2 <= 1'h0;
      valids_3 <= 1'h0;
      enq_ptr_value <= 2'h0;
      deq_ptr_value <= 2'h0;
      maybe_full <= 1'h0;
    end
    else begin
      valids_0 <= ~(do_deq & deq_ptr_value == 2'h0) & (_GEN_0 | valids_0 & (io_brupdate_b1_mispredict_mask & uops_0_br_mask) == 20'h0 & ~(io_flush & uops_0_uses_ldq));
      valids_1 <= ~(do_deq & deq_ptr_value == 2'h1) & (_GEN_2 | valids_1 & (io_brupdate_b1_mispredict_mask & uops_1_br_mask) == 20'h0 & ~(io_flush & uops_1_uses_ldq));
      valids_2 <= ~(do_deq & deq_ptr_value == 2'h2) & (_GEN_4 | valids_2 & (io_brupdate_b1_mispredict_mask & uops_2_br_mask) == 20'h0 & ~(io_flush & uops_2_uses_ldq));
      valids_3 <= ~(do_deq & (&deq_ptr_value)) & (_GEN_5 | valids_3 & (io_brupdate_b1_mispredict_mask & uops_3_br_mask) == 20'h0 & ~(io_flush & uops_3_uses_ldq));
      if (do_enq)
        enq_ptr_value <= enq_ptr_value + 2'h1;
      if (do_deq)
        deq_ptr_value <= deq_ptr_value + 2'h1;
      if (~(do_enq == do_deq))
        maybe_full <= do_enq;
    end
    if (do_enq & _GEN)
      uops_0_br_mask <= _uops_br_mask_T_1;
    else
      uops_0_br_mask <= ({20{~valids_0}} | ~io_brupdate_b1_resolve_mask) & uops_0_br_mask;
    if (_GEN_0) begin
      uops_0_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_0_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_0_is_amo <= io_enq_bits_uop_is_amo;
      uops_0_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_0_uses_stq <= io_enq_bits_uop_uses_stq;
    end
    if (do_enq & _GEN_1)
      uops_1_br_mask <= _uops_br_mask_T_1;
    else
      uops_1_br_mask <= ({20{~valids_1}} | ~io_brupdate_b1_resolve_mask) & uops_1_br_mask;
    if (_GEN_2) begin
      uops_1_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_1_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_1_is_amo <= io_enq_bits_uop_is_amo;
      uops_1_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_1_uses_stq <= io_enq_bits_uop_uses_stq;
    end
    if (do_enq & _GEN_3)
      uops_2_br_mask <= _uops_br_mask_T_1;
    else
      uops_2_br_mask <= ({20{~valids_2}} | ~io_brupdate_b1_resolve_mask) & uops_2_br_mask;
    if (_GEN_4) begin
      uops_2_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_2_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_2_is_amo <= io_enq_bits_uop_is_amo;
      uops_2_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_2_uses_stq <= io_enq_bits_uop_uses_stq;
    end
    if (do_enq & (&enq_ptr_value))
      uops_3_br_mask <= _uops_br_mask_T_1;
    else
      uops_3_br_mask <= ({20{~valids_3}} | ~io_brupdate_b1_resolve_mask) & uops_3_br_mask;
    if (_GEN_5) begin
      uops_3_ldq_idx <= io_enq_bits_uop_ldq_idx;
      uops_3_stq_idx <= io_enq_bits_uop_stq_idx;
      uops_3_is_amo <= io_enq_bits_uop_is_amo;
      uops_3_uses_ldq <= io_enq_bits_uop_uses_ldq;
      uops_3_uses_stq <= io_enq_bits_uop_uses_stq;
    end
  end // always @(posedge)
  ram_4x65 ram_ext (
    .R0_addr (deq_ptr_value),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_ram_ext_R0_data),
    .W0_addr (enq_ptr_value),
    .W0_en   (do_enq),
    .W0_clk  (clock),
    .W0_data ({io_enq_bits_is_hella, io_enq_bits_data})
  );
  assign io_enq_ready = ~full;
  assign io_deq_valid = ~_io_empty_T_1 & casez_tmp & (io_brupdate_b1_mispredict_mask & casez_tmp_0) == 20'h0 & ~(io_flush & casez_tmp_4);
  assign io_deq_bits_uop_br_mask = casez_tmp_0 & ~io_brupdate_b1_resolve_mask;
  assign io_deq_bits_uop_ldq_idx = casez_tmp_1;
  assign io_deq_bits_uop_stq_idx = casez_tmp_2;
  assign io_deq_bits_uop_is_amo = casez_tmp_3;
  assign io_deq_bits_uop_uses_ldq = casez_tmp_4;
  assign io_deq_bits_uop_uses_stq = casez_tmp_5;
  assign io_deq_bits_data = _ram_ext_R0_data[63:0];
  assign io_deq_bits_is_hella = _ram_ext_R0_data[64];
endmodule

