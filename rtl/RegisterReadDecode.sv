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

module RegisterReadDecode(
  input         io_iss_valid,
  input  [6:0]  io_iss_uop_uopc,
  input  [31:0] io_iss_uop_inst,
                io_iss_uop_debug_inst,
  input         io_iss_uop_is_rvc,
  input  [39:0] io_iss_uop_debug_pc,
  input  [2:0]  io_iss_uop_iq_type,
  input  [9:0]  io_iss_uop_fu_code,
  input  [1:0]  io_iss_uop_iw_state,
  input         io_iss_uop_is_br,
                io_iss_uop_is_jalr,
                io_iss_uop_is_jal,
                io_iss_uop_is_sfb,
  input  [19:0] io_iss_uop_br_mask,
  input  [4:0]  io_iss_uop_br_tag,
  input  [5:0]  io_iss_uop_ftq_idx,
  input         io_iss_uop_edge_inst,
  input  [5:0]  io_iss_uop_pc_lob,
  input         io_iss_uop_taken,
  input  [19:0] io_iss_uop_imm_packed,
  input  [11:0] io_iss_uop_csr_addr,
  input  [6:0]  io_iss_uop_rob_idx,
  input  [4:0]  io_iss_uop_ldq_idx,
                io_iss_uop_stq_idx,
  input  [1:0]  io_iss_uop_rxq_idx,
  input  [6:0]  io_iss_uop_pdst,
                io_iss_uop_prs1,
                io_iss_uop_prs2,
                io_iss_uop_prs3,
  input  [5:0]  io_iss_uop_ppred,
  input         io_iss_uop_prs1_busy,
                io_iss_uop_prs2_busy,
                io_iss_uop_prs3_busy,
                io_iss_uop_ppred_busy,
  input  [6:0]  io_iss_uop_stale_pdst,
  input         io_iss_uop_exception,
  input  [63:0] io_iss_uop_exc_cause,
  input         io_iss_uop_bypassable,
  input  [4:0]  io_iss_uop_mem_cmd,
  input  [1:0]  io_iss_uop_mem_size,
  input         io_iss_uop_mem_signed,
                io_iss_uop_is_fence,
                io_iss_uop_is_fencei,
                io_iss_uop_is_amo,
                io_iss_uop_uses_ldq,
                io_iss_uop_uses_stq,
                io_iss_uop_is_sys_pc2epc,
                io_iss_uop_is_unique,
                io_iss_uop_flush_on_commit,
                io_iss_uop_ldst_is_rs1,
  input  [5:0]  io_iss_uop_ldst,
                io_iss_uop_lrs1,
                io_iss_uop_lrs2,
                io_iss_uop_lrs3,
  input         io_iss_uop_ldst_val,
  input  [1:0]  io_iss_uop_dst_rtype,
                io_iss_uop_lrs1_rtype,
                io_iss_uop_lrs2_rtype,
  input         io_iss_uop_frs3_en,
                io_iss_uop_fp_val,
                io_iss_uop_fp_single,
                io_iss_uop_xcpt_pf_if,
                io_iss_uop_xcpt_ae_if,
                io_iss_uop_xcpt_ma_if,
                io_iss_uop_bp_debug_if,
                io_iss_uop_bp_xcpt_if,
  input  [1:0]  io_iss_uop_debug_fsrc,
                io_iss_uop_debug_tsrc,
  output        io_rrd_valid,
  output [6:0]  io_rrd_uop_uopc,
  output [31:0] io_rrd_uop_inst,
                io_rrd_uop_debug_inst,
  output        io_rrd_uop_is_rvc,
  output [39:0] io_rrd_uop_debug_pc,
  output [2:0]  io_rrd_uop_iq_type,
  output [9:0]  io_rrd_uop_fu_code,
  output [3:0]  io_rrd_uop_ctrl_br_type,
  output [1:0]  io_rrd_uop_ctrl_op1_sel,
  output [2:0]  io_rrd_uop_ctrl_op2_sel,
                io_rrd_uop_ctrl_imm_sel,
  output [3:0]  io_rrd_uop_ctrl_op_fcn,
  output        io_rrd_uop_ctrl_fcn_dw,
  output [2:0]  io_rrd_uop_ctrl_csr_cmd,
  output        io_rrd_uop_ctrl_is_load,
                io_rrd_uop_ctrl_is_sta,
                io_rrd_uop_ctrl_is_std,
  output [1:0]  io_rrd_uop_iw_state,
  output        io_rrd_uop_is_br,
                io_rrd_uop_is_jalr,
                io_rrd_uop_is_jal,
                io_rrd_uop_is_sfb,
  output [19:0] io_rrd_uop_br_mask,
  output [4:0]  io_rrd_uop_br_tag,
  output [5:0]  io_rrd_uop_ftq_idx,
  output        io_rrd_uop_edge_inst,
  output [5:0]  io_rrd_uop_pc_lob,
  output        io_rrd_uop_taken,
  output [19:0] io_rrd_uop_imm_packed,
  output [11:0] io_rrd_uop_csr_addr,
  output [6:0]  io_rrd_uop_rob_idx,
  output [4:0]  io_rrd_uop_ldq_idx,
                io_rrd_uop_stq_idx,
  output [1:0]  io_rrd_uop_rxq_idx,
  output [6:0]  io_rrd_uop_pdst,
                io_rrd_uop_prs1,
                io_rrd_uop_prs2,
                io_rrd_uop_prs3,
  output [5:0]  io_rrd_uop_ppred,
  output        io_rrd_uop_prs1_busy,
                io_rrd_uop_prs2_busy,
                io_rrd_uop_prs3_busy,
                io_rrd_uop_ppred_busy,
  output [6:0]  io_rrd_uop_stale_pdst,
  output        io_rrd_uop_exception,
  output [63:0] io_rrd_uop_exc_cause,
  output        io_rrd_uop_bypassable,
  output [4:0]  io_rrd_uop_mem_cmd,
  output [1:0]  io_rrd_uop_mem_size,
  output        io_rrd_uop_mem_signed,
                io_rrd_uop_is_fence,
                io_rrd_uop_is_fencei,
                io_rrd_uop_is_amo,
                io_rrd_uop_uses_ldq,
                io_rrd_uop_uses_stq,
                io_rrd_uop_is_sys_pc2epc,
                io_rrd_uop_is_unique,
                io_rrd_uop_flush_on_commit,
                io_rrd_uop_ldst_is_rs1,
  output [5:0]  io_rrd_uop_ldst,
                io_rrd_uop_lrs1,
                io_rrd_uop_lrs2,
                io_rrd_uop_lrs3,
  output        io_rrd_uop_ldst_val,
  output [1:0]  io_rrd_uop_dst_rtype,
                io_rrd_uop_lrs1_rtype,
                io_rrd_uop_lrs2_rtype,
  output        io_rrd_uop_frs3_en,
                io_rrd_uop_fp_val,
                io_rrd_uop_fp_single,
                io_rrd_uop_xcpt_pf_if,
                io_rrd_uop_xcpt_ae_if,
                io_rrd_uop_xcpt_ma_if,
                io_rrd_uop_bp_debug_if,
                io_rrd_uop_bp_xcpt_if,
  output [1:0]  io_rrd_uop_debug_fsrc,
                io_rrd_uop_debug_tsrc
);

  wire [6:0] rrd_cs_decoder_decoded_invInputs = ~io_iss_uop_uopc;
  wire [6:0] _rrd_cs_decoder_decoded_T_6 = {rrd_cs_decoder_decoded_invInputs[0], rrd_cs_decoder_decoded_invInputs[1], io_iss_uop_uopc[2], rrd_cs_decoder_decoded_invInputs[3], rrd_cs_decoder_decoded_invInputs[4], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]};
  wire [4:0] _rrd_cs_decoder_decoded_T_12 = {io_iss_uop_uopc[1], io_iss_uop_uopc[2], rrd_cs_decoder_decoded_invInputs[3], rrd_cs_decoder_decoded_invInputs[4], rrd_cs_decoder_decoded_invInputs[5]};
  wire [6:0] _rrd_cs_decoder_decoded_T_98 = {io_iss_uop_uopc[0], rrd_cs_decoder_decoded_invInputs[1], io_iss_uop_uopc[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[4], io_iss_uop_uopc[5], rrd_cs_decoder_decoded_invInputs[6]};
  wire [4:0] _rrd_cs_decoder_decoded_T_104 = {rrd_cs_decoder_decoded_invInputs[2], rrd_cs_decoder_decoded_invInputs[3], io_iss_uop_uopc[4], io_iss_uop_uopc[5], rrd_cs_decoder_decoded_invInputs[6]};
  wire [4:0] _rrd_cs_decoder_decoded_T_110 = {io_iss_uop_uopc[1], io_iss_uop_uopc[2], rrd_cs_decoder_decoded_invInputs[4], rrd_cs_decoder_decoded_invInputs[5], io_iss_uop_uopc[6]};
  wire [5:0] _rrd_cs_decoder_decoded_T_112 = {rrd_cs_decoder_decoded_invInputs[0], rrd_cs_decoder_decoded_invInputs[1], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[4], io_iss_uop_uopc[6]};
  wire [2:0] _rrd_cs_decoder_decoded_T_114 = {io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[5], io_iss_uop_uopc[6]};
  wire [3:0] _rrd_cs_decoder_decoded_T_116 = {rrd_cs_decoder_decoded_invInputs[1], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5], io_iss_uop_uopc[6]};
  wire [3:0] _rrd_cs_decoder_decoded_T_118 = {rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5], io_iss_uop_uopc[6]};
  wire [3:0] _rrd_cs_decoder_decoded_T_120 = {io_iss_uop_uopc[0], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5], io_iss_uop_uopc[6]};
  wire [3:0] _rrd_cs_decoder_decoded_T_122 = {rrd_cs_decoder_decoded_invInputs[3], rrd_cs_decoder_decoded_invInputs[4], io_iss_uop_uopc[5], io_iss_uop_uopc[6]};
  wire       _io_rrd_uop_ctrl_is_load_T = io_iss_uop_uopc == 7'h1;
  wire       _io_rrd_uop_ctrl_is_sta_T_1 = io_iss_uop_uopc == 7'h43;
  wire       _io_rrd_uop_ctrl_is_sta_output = io_iss_uop_uopc == 7'h2 | _io_rrd_uop_ctrl_is_sta_T_1;
  assign io_rrd_valid = io_iss_valid;
  assign io_rrd_uop_uopc = io_iss_uop_uopc;
  assign io_rrd_uop_inst = io_iss_uop_inst;
  assign io_rrd_uop_debug_inst = io_iss_uop_debug_inst;
  assign io_rrd_uop_is_rvc = io_iss_uop_is_rvc;
  assign io_rrd_uop_debug_pc = io_iss_uop_debug_pc;
  assign io_rrd_uop_iq_type = io_iss_uop_iq_type;
  assign io_rrd_uop_fu_code = io_iss_uop_fu_code;
  assign io_rrd_uop_ctrl_br_type = {1'h0, |{&{io_iss_uop_uopc[0], io_iss_uop_uopc[1], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]}, &{rrd_cs_decoder_decoded_invInputs[1], io_iss_uop_uopc[2], io_iss_uop_uopc[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]}}, |{&{rrd_cs_decoder_decoded_invInputs[0], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]}, &{io_iss_uop_uopc[0], rrd_cs_decoder_decoded_invInputs[1], io_iss_uop_uopc[2], io_iss_uop_uopc[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]}}, |{&{io_iss_uop_uopc[0], rrd_cs_decoder_decoded_invInputs[1], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]}, &{rrd_cs_decoder_decoded_invInputs[0], io_iss_uop_uopc[1], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]}, &{rrd_cs_decoder_decoded_invInputs[0], rrd_cs_decoder_decoded_invInputs[1], io_iss_uop_uopc[2], io_iss_uop_uopc[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]}}};
  assign io_rrd_uop_ctrl_op1_sel = {1'h0, &_rrd_cs_decoder_decoded_T_6};
  assign io_rrd_uop_ctrl_op2_sel = {2'h0, |{&{rrd_cs_decoder_decoded_invInputs[1], rrd_cs_decoder_decoded_invInputs[4], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]}, &{rrd_cs_decoder_decoded_invInputs[3], rrd_cs_decoder_decoded_invInputs[4], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]}, &{rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[4], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]}, &{io_iss_uop_uopc[0], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[4], rrd_cs_decoder_decoded_invInputs[6]}, &{rrd_cs_decoder_decoded_invInputs[0], io_iss_uop_uopc[1], io_iss_uop_uopc[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[4], io_iss_uop_uopc[5], rrd_cs_decoder_decoded_invInputs[6]}, &{rrd_cs_decoder_decoded_invInputs[0], rrd_cs_decoder_decoded_invInputs[2], rrd_cs_decoder_decoded_invInputs[3], io_iss_uop_uopc[4], io_iss_uop_uopc[5], rrd_cs_decoder_decoded_invInputs[6]}}};
  assign io_rrd_uop_ctrl_imm_sel = {1'h0, |{&_rrd_cs_decoder_decoded_T_6, &{io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]}}, &_rrd_cs_decoder_decoded_T_6};
  assign io_rrd_uop_ctrl_op_fcn =
    {|{&{io_iss_uop_uopc[0], rrd_cs_decoder_decoded_invInputs[1], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[5]}, &{rrd_cs_decoder_decoded_invInputs[0], io_iss_uop_uopc[1], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[5]}, &{rrd_cs_decoder_decoded_invInputs[0], rrd_cs_decoder_decoded_invInputs[1], io_iss_uop_uopc[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[5]}, &{rrd_cs_decoder_decoded_invInputs[0], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5]}, &{rrd_cs_decoder_decoded_invInputs[1], rrd_cs_decoder_decoded_invInputs[2], rrd_cs_decoder_decoded_invInputs[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[6]}, &{rrd_cs_decoder_decoded_invInputs[0], io_iss_uop_uopc[1], rrd_cs_decoder_decoded_invInputs[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]}, &{rrd_cs_decoder_decoded_invInputs[1], io_iss_uop_uopc[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5]}, &{rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5]}, &_rrd_cs_decoder_decoded_T_98, &_rrd_cs_decoder_decoded_T_110, &_rrd_cs_decoder_decoded_T_112, &_rrd_cs_decoder_decoded_T_114, &_rrd_cs_decoder_decoded_T_116, &_rrd_cs_decoder_decoded_T_120, &_rrd_cs_decoder_decoded_T_122},
     |{&_rrd_cs_decoder_decoded_T_12, &{rrd_cs_decoder_decoded_invInputs[0], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[4], rrd_cs_decoder_decoded_invInputs[5]}, &{io_iss_uop_uopc[0], rrd_cs_decoder_decoded_invInputs[1], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[4], rrd_cs_decoder_decoded_invInputs[5]}, &{io_iss_uop_uopc[0], rrd_cs_decoder_decoded_invInputs[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5]}, &{io_iss_uop_uopc[1], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5]}, &{io_iss_uop_uopc[1], rrd_cs_decoder_decoded_invInputs[2], rrd_cs_decoder_decoded_invInputs[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[6]}, &{rrd_cs_decoder_decoded_invInputs[1], io_iss_uop_uopc[2], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5]}, &_rrd_cs_decoder_decoded_T_112, &_rrd_cs_decoder_decoded_T_114, &_rrd_cs_decoder_decoded_T_118, &_rrd_cs_decoder_decoded_T_122},
     |{&_rrd_cs_decoder_decoded_T_12, &{rrd_cs_decoder_decoded_invInputs[0], io_iss_uop_uopc[1], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[4], rrd_cs_decoder_decoded_invInputs[5]}, &{rrd_cs_decoder_decoded_invInputs[0], rrd_cs_decoder_decoded_invInputs[1], io_iss_uop_uopc[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[4], rrd_cs_decoder_decoded_invInputs[5]}, &{rrd_cs_decoder_decoded_invInputs[0], rrd_cs_decoder_decoded_invInputs[1], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5]}, &{rrd_cs_decoder_decoded_invInputs[0], rrd_cs_decoder_decoded_invInputs[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]}, &{io_iss_uop_uopc[0], io_iss_uop_uopc[1], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5]}, &{io_iss_uop_uopc[0], rrd_cs_decoder_decoded_invInputs[1], io_iss_uop_uopc[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5]}, &_rrd_cs_decoder_decoded_T_98, &{rrd_cs_decoder_decoded_invInputs[1], rrd_cs_decoder_decoded_invInputs[2], rrd_cs_decoder_decoded_invInputs[3], io_iss_uop_uopc[4], io_iss_uop_uopc[5], rrd_cs_decoder_decoded_invInputs[6]}, &_rrd_cs_decoder_decoded_T_112, &_rrd_cs_decoder_decoded_T_114, &_rrd_cs_decoder_decoded_T_116, &_rrd_cs_decoder_decoded_T_118, &_rrd_cs_decoder_decoded_T_120, &_rrd_cs_decoder_decoded_T_122},
     |{&{rrd_cs_decoder_decoded_invInputs[0], io_iss_uop_uopc[1], io_iss_uop_uopc[2], rrd_cs_decoder_decoded_invInputs[4], rrd_cs_decoder_decoded_invInputs[5]}, &{rrd_cs_decoder_decoded_invInputs[0], io_iss_uop_uopc[1], io_iss_uop_uopc[2], rrd_cs_decoder_decoded_invInputs[3], rrd_cs_decoder_decoded_invInputs[5], rrd_cs_decoder_decoded_invInputs[6]}, &{io_iss_uop_uopc[0], io_iss_uop_uopc[1], rrd_cs_decoder_decoded_invInputs[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[4], rrd_cs_decoder_decoded_invInputs[5]}, &{rrd_cs_decoder_decoded_invInputs[1], io_iss_uop_uopc[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[4], rrd_cs_decoder_decoded_invInputs[5]}, &{io_iss_uop_uopc[0], io_iss_uop_uopc[1], rrd_cs_decoder_decoded_invInputs[3], io_iss_uop_uopc[4], rrd_cs_decoder_decoded_invInputs[5]}, &{io_iss_uop_uopc[1], io_iss_uop_uopc[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[4], io_iss_uop_uopc[5], rrd_cs_decoder_decoded_invInputs[6]}, &_rrd_cs_decoder_decoded_T_104, &_rrd_cs_decoder_decoded_T_110, &_rrd_cs_decoder_decoded_T_112, &_rrd_cs_decoder_decoded_T_114, &_rrd_cs_decoder_decoded_T_116, &_rrd_cs_decoder_decoded_T_118, &_rrd_cs_decoder_decoded_T_122}};
  assign io_rrd_uop_ctrl_fcn_dw = {&{io_iss_uop_uopc[0], io_iss_uop_uopc[1], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[4], io_iss_uop_uopc[5], rrd_cs_decoder_decoded_invInputs[6]}, &{io_iss_uop_uopc[2], io_iss_uop_uopc[3], rrd_cs_decoder_decoded_invInputs[4], io_iss_uop_uopc[5], rrd_cs_decoder_decoded_invInputs[6]}, &_rrd_cs_decoder_decoded_T_104} == 3'h0;
  assign io_rrd_uop_ctrl_csr_cmd = 3'h0;
  assign io_rrd_uop_ctrl_is_load = _io_rrd_uop_ctrl_is_load_T;
  assign io_rrd_uop_ctrl_is_sta = _io_rrd_uop_ctrl_is_sta_output;
  assign io_rrd_uop_ctrl_is_std = io_iss_uop_uopc == 7'h3 | _io_rrd_uop_ctrl_is_sta_output & io_iss_uop_lrs2_rtype == 2'h0;
  assign io_rrd_uop_iw_state = io_iss_uop_iw_state;
  assign io_rrd_uop_is_br = io_iss_uop_is_br;
  assign io_rrd_uop_is_jalr = io_iss_uop_is_jalr;
  assign io_rrd_uop_is_jal = io_iss_uop_is_jal;
  assign io_rrd_uop_is_sfb = io_iss_uop_is_sfb;
  assign io_rrd_uop_br_mask = io_iss_uop_br_mask;
  assign io_rrd_uop_br_tag = io_iss_uop_br_tag;
  assign io_rrd_uop_ftq_idx = io_iss_uop_ftq_idx;
  assign io_rrd_uop_edge_inst = io_iss_uop_edge_inst;
  assign io_rrd_uop_pc_lob = io_iss_uop_pc_lob;
  assign io_rrd_uop_taken = io_iss_uop_taken;
  assign io_rrd_uop_imm_packed = _io_rrd_uop_ctrl_is_sta_T_1 | _io_rrd_uop_ctrl_is_load_T & io_iss_uop_mem_cmd == 5'h6 ? 20'h0 : io_iss_uop_imm_packed;
  assign io_rrd_uop_csr_addr = io_iss_uop_csr_addr;
  assign io_rrd_uop_rob_idx = io_iss_uop_rob_idx;
  assign io_rrd_uop_ldq_idx = io_iss_uop_ldq_idx;
  assign io_rrd_uop_stq_idx = io_iss_uop_stq_idx;
  assign io_rrd_uop_rxq_idx = io_iss_uop_rxq_idx;
  assign io_rrd_uop_pdst = io_iss_uop_pdst;
  assign io_rrd_uop_prs1 = io_iss_uop_prs1;
  assign io_rrd_uop_prs2 = io_iss_uop_prs2;
  assign io_rrd_uop_prs3 = io_iss_uop_prs3;
  assign io_rrd_uop_ppred = io_iss_uop_ppred;
  assign io_rrd_uop_prs1_busy = io_iss_uop_prs1_busy;
  assign io_rrd_uop_prs2_busy = io_iss_uop_prs2_busy;
  assign io_rrd_uop_prs3_busy = io_iss_uop_prs3_busy;
  assign io_rrd_uop_ppred_busy = io_iss_uop_ppred_busy;
  assign io_rrd_uop_stale_pdst = io_iss_uop_stale_pdst;
  assign io_rrd_uop_exception = io_iss_uop_exception;
  assign io_rrd_uop_exc_cause = io_iss_uop_exc_cause;
  assign io_rrd_uop_bypassable = io_iss_uop_bypassable;
  assign io_rrd_uop_mem_cmd = io_iss_uop_mem_cmd;
  assign io_rrd_uop_mem_size = io_iss_uop_mem_size;
  assign io_rrd_uop_mem_signed = io_iss_uop_mem_signed;
  assign io_rrd_uop_is_fence = io_iss_uop_is_fence;
  assign io_rrd_uop_is_fencei = io_iss_uop_is_fencei;
  assign io_rrd_uop_is_amo = io_iss_uop_is_amo;
  assign io_rrd_uop_uses_ldq = io_iss_uop_uses_ldq;
  assign io_rrd_uop_uses_stq = io_iss_uop_uses_stq;
  assign io_rrd_uop_is_sys_pc2epc = io_iss_uop_is_sys_pc2epc;
  assign io_rrd_uop_is_unique = io_iss_uop_is_unique;
  assign io_rrd_uop_flush_on_commit = io_iss_uop_flush_on_commit;
  assign io_rrd_uop_ldst_is_rs1 = io_iss_uop_ldst_is_rs1;
  assign io_rrd_uop_ldst = io_iss_uop_ldst;
  assign io_rrd_uop_lrs1 = io_iss_uop_lrs1;
  assign io_rrd_uop_lrs2 = io_iss_uop_lrs2;
  assign io_rrd_uop_lrs3 = io_iss_uop_lrs3;
  assign io_rrd_uop_ldst_val = io_iss_uop_ldst_val;
  assign io_rrd_uop_dst_rtype = io_iss_uop_dst_rtype;
  assign io_rrd_uop_lrs1_rtype = io_iss_uop_lrs1_rtype;
  assign io_rrd_uop_lrs2_rtype = io_iss_uop_lrs2_rtype;
  assign io_rrd_uop_frs3_en = io_iss_uop_frs3_en;
  assign io_rrd_uop_fp_val = io_iss_uop_fp_val;
  assign io_rrd_uop_fp_single = io_iss_uop_fp_single;
  assign io_rrd_uop_xcpt_pf_if = io_iss_uop_xcpt_pf_if;
  assign io_rrd_uop_xcpt_ae_if = io_iss_uop_xcpt_ae_if;
  assign io_rrd_uop_xcpt_ma_if = io_iss_uop_xcpt_ma_if;
  assign io_rrd_uop_bp_debug_if = io_iss_uop_bp_debug_if;
  assign io_rrd_uop_bp_xcpt_if = io_iss_uop_bp_xcpt_if;
  assign io_rrd_uop_debug_fsrc = io_iss_uop_debug_fsrc;
  assign io_rrd_uop_debug_tsrc = io_iss_uop_debug_tsrc;
endmodule

