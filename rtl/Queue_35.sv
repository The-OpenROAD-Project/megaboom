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

module Queue_35(
  input          clock,
                 reset,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [39:0]  io_enq_bits_pc,
                 io_enq_bits_next_pc,
  input          io_enq_bits_edge_inst_0,
                 io_enq_bits_edge_inst_1,
  input  [31:0]  io_enq_bits_insts_0,
                 io_enq_bits_insts_1,
                 io_enq_bits_insts_2,
                 io_enq_bits_insts_3,
                 io_enq_bits_insts_4,
                 io_enq_bits_insts_5,
                 io_enq_bits_insts_6,
                 io_enq_bits_insts_7,
                 io_enq_bits_exp_insts_0,
                 io_enq_bits_exp_insts_1,
                 io_enq_bits_exp_insts_2,
                 io_enq_bits_exp_insts_3,
                 io_enq_bits_exp_insts_4,
                 io_enq_bits_exp_insts_5,
                 io_enq_bits_exp_insts_6,
                 io_enq_bits_exp_insts_7,
  input          io_enq_bits_sfbs_0,
                 io_enq_bits_sfbs_1,
                 io_enq_bits_sfbs_2,
                 io_enq_bits_sfbs_3,
                 io_enq_bits_sfbs_4,
                 io_enq_bits_sfbs_5,
                 io_enq_bits_sfbs_6,
                 io_enq_bits_sfbs_7,
  input  [15:0]  io_enq_bits_sfb_masks_0,
                 io_enq_bits_sfb_masks_1,
                 io_enq_bits_sfb_masks_2,
                 io_enq_bits_sfb_masks_3,
                 io_enq_bits_sfb_masks_4,
                 io_enq_bits_sfb_masks_5,
                 io_enq_bits_sfb_masks_6,
                 io_enq_bits_sfb_masks_7,
  input  [4:0]   io_enq_bits_sfb_dests_0,
                 io_enq_bits_sfb_dests_1,
                 io_enq_bits_sfb_dests_2,
                 io_enq_bits_sfb_dests_3,
                 io_enq_bits_sfb_dests_4,
                 io_enq_bits_sfb_dests_5,
                 io_enq_bits_sfb_dests_6,
                 io_enq_bits_sfb_dests_7,
  input          io_enq_bits_shadowable_mask_0,
                 io_enq_bits_shadowable_mask_1,
                 io_enq_bits_shadowable_mask_2,
                 io_enq_bits_shadowable_mask_3,
                 io_enq_bits_shadowable_mask_4,
                 io_enq_bits_shadowable_mask_5,
                 io_enq_bits_shadowable_mask_6,
                 io_enq_bits_shadowable_mask_7,
                 io_enq_bits_cfi_idx_valid,
  input  [2:0]   io_enq_bits_cfi_idx_bits,
                 io_enq_bits_cfi_type,
  input          io_enq_bits_cfi_is_call,
                 io_enq_bits_cfi_is_ret,
                 io_enq_bits_cfi_npc_plus4,
  input  [39:0]  io_enq_bits_ras_top,
  input  [7:0]   io_enq_bits_mask,
                 io_enq_bits_br_mask,
  input  [63:0]  io_enq_bits_ghist_old_history,
  input          io_enq_bits_ghist_current_saw_branch_not_taken,
                 io_enq_bits_ghist_new_saw_branch_not_taken,
                 io_enq_bits_ghist_new_saw_branch_taken,
  input  [4:0]   io_enq_bits_ghist_ras_idx,
  input          io_enq_bits_lhist_0,
                 io_enq_bits_lhist_1,
                 io_enq_bits_xcpt_pf_if,
                 io_enq_bits_xcpt_ae_if,
                 io_enq_bits_end_half_valid,
  input  [15:0]  io_enq_bits_end_half_bits,
  input  [119:0] io_enq_bits_bpd_meta_0,
                 io_enq_bits_bpd_meta_1,
  input  [1:0]   io_enq_bits_fsrc,
                 io_enq_bits_tsrc,
  input          io_deq_ready,
  output         io_deq_valid,
  output [39:0]  io_deq_bits_pc,
  output         io_deq_bits_edge_inst_0,
                 io_deq_bits_edge_inst_1,
  output [31:0]  io_deq_bits_insts_0,
                 io_deq_bits_insts_1,
                 io_deq_bits_insts_2,
                 io_deq_bits_insts_3,
                 io_deq_bits_insts_4,
                 io_deq_bits_insts_5,
                 io_deq_bits_insts_6,
                 io_deq_bits_insts_7,
                 io_deq_bits_exp_insts_0,
                 io_deq_bits_exp_insts_1,
                 io_deq_bits_exp_insts_2,
                 io_deq_bits_exp_insts_3,
                 io_deq_bits_exp_insts_4,
                 io_deq_bits_exp_insts_5,
                 io_deq_bits_exp_insts_6,
                 io_deq_bits_exp_insts_7,
  output         io_deq_bits_sfbs_0,
                 io_deq_bits_sfbs_1,
                 io_deq_bits_sfbs_2,
                 io_deq_bits_sfbs_3,
                 io_deq_bits_sfbs_4,
                 io_deq_bits_sfbs_5,
                 io_deq_bits_sfbs_6,
                 io_deq_bits_sfbs_7,
                 io_deq_bits_shadowed_mask_0,
                 io_deq_bits_shadowed_mask_1,
                 io_deq_bits_shadowed_mask_2,
                 io_deq_bits_shadowed_mask_3,
                 io_deq_bits_shadowed_mask_4,
                 io_deq_bits_shadowed_mask_5,
                 io_deq_bits_shadowed_mask_6,
                 io_deq_bits_shadowed_mask_7,
                 io_deq_bits_cfi_idx_valid,
  output [2:0]   io_deq_bits_cfi_idx_bits,
                 io_deq_bits_cfi_type,
  output         io_deq_bits_cfi_is_call,
                 io_deq_bits_cfi_is_ret,
  output [39:0]  io_deq_bits_ras_top,
  output [7:0]   io_deq_bits_mask,
                 io_deq_bits_br_mask,
  output [63:0]  io_deq_bits_ghist_old_history,
  output         io_deq_bits_ghist_current_saw_branch_not_taken,
                 io_deq_bits_ghist_new_saw_branch_not_taken,
                 io_deq_bits_ghist_new_saw_branch_taken,
  output [4:0]   io_deq_bits_ghist_ras_idx,
  output         io_deq_bits_xcpt_pf_if,
                 io_deq_bits_xcpt_ae_if,
                 io_deq_bits_bp_debug_if_oh_0,
                 io_deq_bits_bp_debug_if_oh_1,
                 io_deq_bits_bp_debug_if_oh_2,
                 io_deq_bits_bp_debug_if_oh_3,
                 io_deq_bits_bp_debug_if_oh_4,
                 io_deq_bits_bp_debug_if_oh_5,
                 io_deq_bits_bp_debug_if_oh_6,
                 io_deq_bits_bp_debug_if_oh_7,
                 io_deq_bits_bp_xcpt_if_oh_0,
                 io_deq_bits_bp_xcpt_if_oh_1,
                 io_deq_bits_bp_xcpt_if_oh_2,
                 io_deq_bits_bp_xcpt_if_oh_3,
                 io_deq_bits_bp_xcpt_if_oh_4,
                 io_deq_bits_bp_xcpt_if_oh_5,
                 io_deq_bits_bp_xcpt_if_oh_6,
                 io_deq_bits_bp_xcpt_if_oh_7,
  output [119:0] io_deq_bits_bpd_meta_0,
                 io_deq_bits_bpd_meta_1,
  output [1:0]   io_deq_bits_fsrc
);

  reg  [1210:0] ram;
  reg           full;
  wire          _io_enq_ready_output = io_deq_ready | ~full;
  wire          do_enq = _io_enq_ready_output & io_enq_valid;
  always @(posedge clock) begin
    if (do_enq)
      ram <= {io_enq_bits_tsrc, io_enq_bits_fsrc, io_enq_bits_bpd_meta_1, io_enq_bits_bpd_meta_0, io_enq_bits_end_half_bits, io_enq_bits_end_half_valid, 16'h0, io_enq_bits_xcpt_ae_if, io_enq_bits_xcpt_pf_if, io_enq_bits_lhist_1, io_enq_bits_lhist_0, io_enq_bits_ghist_ras_idx, io_enq_bits_ghist_new_saw_branch_taken, io_enq_bits_ghist_new_saw_branch_not_taken, io_enq_bits_ghist_current_saw_branch_not_taken, io_enq_bits_ghist_old_history, io_enq_bits_br_mask, io_enq_bits_mask, 6'h0, io_enq_bits_ras_top, io_enq_bits_cfi_npc_plus4, io_enq_bits_cfi_is_ret, io_enq_bits_cfi_is_call, io_enq_bits_cfi_type, io_enq_bits_cfi_idx_bits, io_enq_bits_cfi_idx_valid, 8'h0, io_enq_bits_shadowable_mask_7, io_enq_bits_shadowable_mask_6, io_enq_bits_shadowable_mask_5, io_enq_bits_shadowable_mask_4, io_enq_bits_shadowable_mask_3, io_enq_bits_shadowable_mask_2, io_enq_bits_shadowable_mask_1, io_enq_bits_shadowable_mask_0, io_enq_bits_sfb_dests_7, io_enq_bits_sfb_dests_6, io_enq_bits_sfb_dests_5, io_enq_bits_sfb_dests_4, io_enq_bits_sfb_dests_3, io_enq_bits_sfb_dests_2, io_enq_bits_sfb_dests_1, io_enq_bits_sfb_dests_0, io_enq_bits_sfb_masks_7, io_enq_bits_sfb_masks_6, io_enq_bits_sfb_masks_5, io_enq_bits_sfb_masks_4, io_enq_bits_sfb_masks_3, io_enq_bits_sfb_masks_2, io_enq_bits_sfb_masks_1, io_enq_bits_sfb_masks_0, io_enq_bits_sfbs_7, io_enq_bits_sfbs_6, io_enq_bits_sfbs_5, io_enq_bits_sfbs_4, io_enq_bits_sfbs_3, io_enq_bits_sfbs_2, io_enq_bits_sfbs_1, io_enq_bits_sfbs_0, io_enq_bits_exp_insts_7, io_enq_bits_exp_insts_6, io_enq_bits_exp_insts_5, io_enq_bits_exp_insts_4, io_enq_bits_exp_insts_3, io_enq_bits_exp_insts_2, io_enq_bits_exp_insts_1, io_enq_bits_exp_insts_0, io_enq_bits_insts_7, io_enq_bits_insts_6, io_enq_bits_insts_5, io_enq_bits_insts_4, io_enq_bits_insts_3, io_enq_bits_insts_2, io_enq_bits_insts_1, io_enq_bits_insts_0, io_enq_bits_edge_inst_1, io_enq_bits_edge_inst_0, io_enq_bits_next_pc, io_enq_bits_pc};
    if (reset)
      full <= 1'h0;
    else if (~(do_enq == (io_deq_ready & full)))
      full <= do_enq;
  end // always @(posedge)
  assign io_enq_ready = _io_enq_ready_output;
  assign io_deq_valid = full;
  assign io_deq_bits_pc = ram[39:0];
  assign io_deq_bits_edge_inst_0 = ram[80];
  assign io_deq_bits_edge_inst_1 = ram[81];
  assign io_deq_bits_insts_0 = ram[113:82];
  assign io_deq_bits_insts_1 = ram[145:114];
  assign io_deq_bits_insts_2 = ram[177:146];
  assign io_deq_bits_insts_3 = ram[209:178];
  assign io_deq_bits_insts_4 = ram[241:210];
  assign io_deq_bits_insts_5 = ram[273:242];
  assign io_deq_bits_insts_6 = ram[305:274];
  assign io_deq_bits_insts_7 = ram[337:306];
  assign io_deq_bits_exp_insts_0 = ram[369:338];
  assign io_deq_bits_exp_insts_1 = ram[401:370];
  assign io_deq_bits_exp_insts_2 = ram[433:402];
  assign io_deq_bits_exp_insts_3 = ram[465:434];
  assign io_deq_bits_exp_insts_4 = ram[497:466];
  assign io_deq_bits_exp_insts_5 = ram[529:498];
  assign io_deq_bits_exp_insts_6 = ram[561:530];
  assign io_deq_bits_exp_insts_7 = ram[593:562];
  assign io_deq_bits_sfbs_0 = ram[594];
  assign io_deq_bits_sfbs_1 = ram[595];
  assign io_deq_bits_sfbs_2 = ram[596];
  assign io_deq_bits_sfbs_3 = ram[597];
  assign io_deq_bits_sfbs_4 = ram[598];
  assign io_deq_bits_sfbs_5 = ram[599];
  assign io_deq_bits_sfbs_6 = ram[600];
  assign io_deq_bits_sfbs_7 = ram[601];
  assign io_deq_bits_shadowed_mask_0 = ram[778];
  assign io_deq_bits_shadowed_mask_1 = ram[779];
  assign io_deq_bits_shadowed_mask_2 = ram[780];
  assign io_deq_bits_shadowed_mask_3 = ram[781];
  assign io_deq_bits_shadowed_mask_4 = ram[782];
  assign io_deq_bits_shadowed_mask_5 = ram[783];
  assign io_deq_bits_shadowed_mask_6 = ram[784];
  assign io_deq_bits_shadowed_mask_7 = ram[785];
  assign io_deq_bits_cfi_idx_valid = ram[786];
  assign io_deq_bits_cfi_idx_bits = ram[789:787];
  assign io_deq_bits_cfi_type = ram[792:790];
  assign io_deq_bits_cfi_is_call = ram[793];
  assign io_deq_bits_cfi_is_ret = ram[794];
  assign io_deq_bits_ras_top = ram[835:796];
  assign io_deq_bits_mask = ram[849:842];
  assign io_deq_bits_br_mask = ram[857:850];
  assign io_deq_bits_ghist_old_history = ram[921:858];
  assign io_deq_bits_ghist_current_saw_branch_not_taken = ram[922];
  assign io_deq_bits_ghist_new_saw_branch_not_taken = ram[923];
  assign io_deq_bits_ghist_new_saw_branch_taken = ram[924];
  assign io_deq_bits_ghist_ras_idx = ram[929:925];
  assign io_deq_bits_xcpt_pf_if = ram[932];
  assign io_deq_bits_xcpt_ae_if = ram[933];
  assign io_deq_bits_bp_debug_if_oh_0 = ram[934];
  assign io_deq_bits_bp_debug_if_oh_1 = ram[935];
  assign io_deq_bits_bp_debug_if_oh_2 = ram[936];
  assign io_deq_bits_bp_debug_if_oh_3 = ram[937];
  assign io_deq_bits_bp_debug_if_oh_4 = ram[938];
  assign io_deq_bits_bp_debug_if_oh_5 = ram[939];
  assign io_deq_bits_bp_debug_if_oh_6 = ram[940];
  assign io_deq_bits_bp_debug_if_oh_7 = ram[941];
  assign io_deq_bits_bp_xcpt_if_oh_0 = ram[942];
  assign io_deq_bits_bp_xcpt_if_oh_1 = ram[943];
  assign io_deq_bits_bp_xcpt_if_oh_2 = ram[944];
  assign io_deq_bits_bp_xcpt_if_oh_3 = ram[945];
  assign io_deq_bits_bp_xcpt_if_oh_4 = ram[946];
  assign io_deq_bits_bp_xcpt_if_oh_5 = ram[947];
  assign io_deq_bits_bp_xcpt_if_oh_6 = ram[948];
  assign io_deq_bits_bp_xcpt_if_oh_7 = ram[949];
  assign io_deq_bits_bpd_meta_0 = ram[1086:967];
  assign io_deq_bits_bpd_meta_1 = ram[1206:1087];
  assign io_deq_bits_fsrc = ram[1208:1207];
endmodule

