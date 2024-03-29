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

module ALUExeUnit_3(
  input         clock,
                reset,
                io_req_valid,
  input  [6:0]  io_req_bits_uop_uopc,
  input         io_req_bits_uop_is_rvc,
  input  [9:0]  io_req_bits_uop_fu_code,
  input  [3:0]  io_req_bits_uop_ctrl_br_type,
  input  [1:0]  io_req_bits_uop_ctrl_op1_sel,
  input  [2:0]  io_req_bits_uop_ctrl_op2_sel,
                io_req_bits_uop_ctrl_imm_sel,
  input  [3:0]  io_req_bits_uop_ctrl_op_fcn,
  input         io_req_bits_uop_ctrl_fcn_dw,
  input  [2:0]  io_req_bits_uop_ctrl_csr_cmd,
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
  input  [6:0]  io_req_bits_uop_rob_idx,
  input  [4:0]  io_req_bits_uop_ldq_idx,
                io_req_bits_uop_stq_idx,
  input  [6:0]  io_req_bits_uop_pdst,
                io_req_bits_uop_prs1,
  input         io_req_bits_uop_bypassable,
                io_req_bits_uop_is_amo,
                io_req_bits_uop_uses_stq,
  input  [1:0]  io_req_bits_uop_dst_rtype,
  input  [64:0] io_req_bits_rs1_data,
                io_req_bits_rs2_data,
  input         io_req_bits_kill,
  output        io_iresp_valid,
  output [2:0]  io_iresp_bits_uop_ctrl_csr_cmd,
  output [11:0] io_iresp_bits_uop_csr_addr,
  output [6:0]  io_iresp_bits_uop_rob_idx,
                io_iresp_bits_uop_pdst,
  output        io_iresp_bits_uop_bypassable,
                io_iresp_bits_uop_is_amo,
                io_iresp_bits_uop_uses_stq,
  output [1:0]  io_iresp_bits_uop_dst_rtype,
  output [64:0] io_iresp_bits_data,
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
  output [20:0] io_brinfo_target_offset
);

  wire [19:0] _ALUUnit_io_resp_bits_uop_imm_packed;
  wire [63:0] _ALUUnit_io_resp_bits_data;
  wire [63:0] _ALUUnit_io_bypass_0_bits_data;
  ALUUnit_1 ALUUnit (
    .clock                          (clock),
    .reset                          (reset),
    .io_req_valid                   (io_req_valid & (io_req_bits_uop_fu_code == 10'h1 | io_req_bits_uop_fu_code == 10'h2 | io_req_bits_uop_fu_code == 10'h20 & io_req_bits_uop_uopc != 7'h6C)),
    .io_req_bits_uop_uopc           (io_req_bits_uop_uopc),
    .io_req_bits_uop_is_rvc         (io_req_bits_uop_is_rvc),
    .io_req_bits_uop_ctrl_br_type   (io_req_bits_uop_ctrl_br_type),
    .io_req_bits_uop_ctrl_op1_sel   (io_req_bits_uop_ctrl_op1_sel),
    .io_req_bits_uop_ctrl_op2_sel   (io_req_bits_uop_ctrl_op2_sel),
    .io_req_bits_uop_ctrl_imm_sel   (io_req_bits_uop_ctrl_imm_sel),
    .io_req_bits_uop_ctrl_op_fcn    (io_req_bits_uop_ctrl_op_fcn),
    .io_req_bits_uop_ctrl_fcn_dw    (io_req_bits_uop_ctrl_fcn_dw),
    .io_req_bits_uop_ctrl_csr_cmd   (io_req_bits_uop_ctrl_csr_cmd),
    .io_req_bits_uop_is_br          (io_req_bits_uop_is_br),
    .io_req_bits_uop_is_jalr        (io_req_bits_uop_is_jalr),
    .io_req_bits_uop_is_jal         (io_req_bits_uop_is_jal),
    .io_req_bits_uop_is_sfb         (io_req_bits_uop_is_sfb),
    .io_req_bits_uop_br_mask        (io_req_bits_uop_br_mask),
    .io_req_bits_uop_br_tag         (io_req_bits_uop_br_tag),
    .io_req_bits_uop_ftq_idx        (io_req_bits_uop_ftq_idx),
    .io_req_bits_uop_edge_inst      (io_req_bits_uop_edge_inst),
    .io_req_bits_uop_pc_lob         (io_req_bits_uop_pc_lob),
    .io_req_bits_uop_taken          (io_req_bits_uop_taken),
    .io_req_bits_uop_imm_packed     (io_req_bits_uop_imm_packed),
    .io_req_bits_uop_rob_idx        (io_req_bits_uop_rob_idx),
    .io_req_bits_uop_ldq_idx        (io_req_bits_uop_ldq_idx),
    .io_req_bits_uop_stq_idx        (io_req_bits_uop_stq_idx),
    .io_req_bits_uop_pdst           (io_req_bits_uop_pdst),
    .io_req_bits_uop_prs1           (io_req_bits_uop_prs1),
    .io_req_bits_uop_bypassable     (io_req_bits_uop_bypassable),
    .io_req_bits_uop_is_amo         (io_req_bits_uop_is_amo),
    .io_req_bits_uop_uses_stq       (io_req_bits_uop_uses_stq),
    .io_req_bits_uop_dst_rtype      (io_req_bits_uop_dst_rtype),
    .io_req_bits_rs1_data           (io_req_bits_rs1_data[63:0]),
    .io_req_bits_rs2_data           (io_req_bits_rs2_data[63:0]),
    .io_req_bits_kill               (io_req_bits_kill),
    .io_resp_valid                  (io_iresp_valid),
    .io_resp_bits_uop_ctrl_csr_cmd  (io_iresp_bits_uop_ctrl_csr_cmd),
    .io_resp_bits_uop_imm_packed    (_ALUUnit_io_resp_bits_uop_imm_packed),
    .io_resp_bits_uop_rob_idx       (io_iresp_bits_uop_rob_idx),
    .io_resp_bits_uop_pdst          (io_iresp_bits_uop_pdst),
    .io_resp_bits_uop_bypassable    (io_iresp_bits_uop_bypassable),
    .io_resp_bits_uop_is_amo        (io_iresp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_stq      (io_iresp_bits_uop_uses_stq),
    .io_resp_bits_uop_dst_rtype     (io_iresp_bits_uop_dst_rtype),
    .io_resp_bits_data              (_ALUUnit_io_resp_bits_data),
    .io_brupdate_b1_resolve_mask    (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask (io_brupdate_b1_mispredict_mask),
    .io_bypass_0_valid              (io_bypass_0_valid),
    .io_bypass_0_bits_uop_pdst      (io_bypass_0_bits_uop_pdst),
    .io_bypass_0_bits_uop_dst_rtype (io_bypass_0_bits_uop_dst_rtype),
    .io_bypass_0_bits_data          (_ALUUnit_io_bypass_0_bits_data),
    .io_brinfo_uop_is_rvc           (io_brinfo_uop_is_rvc),
    .io_brinfo_uop_br_mask          (io_brinfo_uop_br_mask),
    .io_brinfo_uop_br_tag           (io_brinfo_uop_br_tag),
    .io_brinfo_uop_ftq_idx          (io_brinfo_uop_ftq_idx),
    .io_brinfo_uop_edge_inst        (io_brinfo_uop_edge_inst),
    .io_brinfo_uop_pc_lob           (io_brinfo_uop_pc_lob),
    .io_brinfo_uop_rob_idx          (io_brinfo_uop_rob_idx),
    .io_brinfo_uop_ldq_idx          (io_brinfo_uop_ldq_idx),
    .io_brinfo_uop_stq_idx          (io_brinfo_uop_stq_idx),
    .io_brinfo_valid                (io_brinfo_valid),
    .io_brinfo_mispredict           (io_brinfo_mispredict),
    .io_brinfo_taken                (io_brinfo_taken),
    .io_brinfo_cfi_type             (io_brinfo_cfi_type),
    .io_brinfo_pc_sel               (io_brinfo_pc_sel),
    .io_brinfo_target_offset        (io_brinfo_target_offset)
  );
  assign io_iresp_bits_uop_csr_addr = _ALUUnit_io_resp_bits_uop_imm_packed[19:8];
  assign io_iresp_bits_data = {1'h0, _ALUUnit_io_resp_bits_data};
  assign io_bypass_0_bits_data = {1'h0, _ALUUnit_io_bypass_0_bits_data};
endmodule

