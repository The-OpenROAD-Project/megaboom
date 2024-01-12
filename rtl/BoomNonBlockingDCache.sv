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

module BoomNonBlockingDCache(
  input          clock,
                 reset,
                 auto_out_a_ready,
  output         auto_out_a_valid,
  output [2:0]   auto_out_a_bits_opcode,
                 auto_out_a_bits_param,
  output [3:0]   auto_out_a_bits_size,
                 auto_out_a_bits_source,
  output [32:0]  auto_out_a_bits_address,
  output [15:0]  auto_out_a_bits_mask,
  output [127:0] auto_out_a_bits_data,
  output         auto_out_b_ready,
  input          auto_out_b_valid,
  input  [1:0]   auto_out_b_bits_param,
  input  [3:0]   auto_out_b_bits_size,
                 auto_out_b_bits_source,
  input  [32:0]  auto_out_b_bits_address,
  input          auto_out_c_ready,
  output         auto_out_c_valid,
  output [2:0]   auto_out_c_bits_opcode,
                 auto_out_c_bits_param,
  output [3:0]   auto_out_c_bits_size,
                 auto_out_c_bits_source,
  output [32:0]  auto_out_c_bits_address,
  output [127:0] auto_out_c_bits_data,
  output         auto_out_d_ready,
  input          auto_out_d_valid,
  input  [2:0]   auto_out_d_bits_opcode,
  input  [1:0]   auto_out_d_bits_param,
  input  [3:0]   auto_out_d_bits_size,
                 auto_out_d_bits_source,
  input  [1:0]   auto_out_d_bits_sink,
  input  [127:0] auto_out_d_bits_data,
  input          auto_out_e_ready,
  output         auto_out_e_valid,
  output [1:0]   auto_out_e_bits_sink,
  output         io_lsu_req_ready,
  input          io_lsu_req_valid,
                 io_lsu_req_bits_0_valid,
  input  [6:0]   io_lsu_req_bits_0_bits_uop_uopc,
  input  [31:0]  io_lsu_req_bits_0_bits_uop_inst,
                 io_lsu_req_bits_0_bits_uop_debug_inst,
  input          io_lsu_req_bits_0_bits_uop_is_rvc,
  input  [39:0]  io_lsu_req_bits_0_bits_uop_debug_pc,
  input  [2:0]   io_lsu_req_bits_0_bits_uop_iq_type,
  input  [9:0]   io_lsu_req_bits_0_bits_uop_fu_code,
  input  [3:0]   io_lsu_req_bits_0_bits_uop_ctrl_br_type,
  input  [1:0]   io_lsu_req_bits_0_bits_uop_ctrl_op1_sel,
  input  [2:0]   io_lsu_req_bits_0_bits_uop_ctrl_op2_sel,
                 io_lsu_req_bits_0_bits_uop_ctrl_imm_sel,
  input  [3:0]   io_lsu_req_bits_0_bits_uop_ctrl_op_fcn,
  input          io_lsu_req_bits_0_bits_uop_ctrl_fcn_dw,
  input  [2:0]   io_lsu_req_bits_0_bits_uop_ctrl_csr_cmd,
  input          io_lsu_req_bits_0_bits_uop_ctrl_is_load,
                 io_lsu_req_bits_0_bits_uop_ctrl_is_sta,
                 io_lsu_req_bits_0_bits_uop_ctrl_is_std,
  input  [1:0]   io_lsu_req_bits_0_bits_uop_iw_state,
  input          io_lsu_req_bits_0_bits_uop_iw_p1_poisoned,
                 io_lsu_req_bits_0_bits_uop_iw_p2_poisoned,
                 io_lsu_req_bits_0_bits_uop_is_br,
                 io_lsu_req_bits_0_bits_uop_is_jalr,
                 io_lsu_req_bits_0_bits_uop_is_jal,
                 io_lsu_req_bits_0_bits_uop_is_sfb,
  input  [19:0]  io_lsu_req_bits_0_bits_uop_br_mask,
  input  [4:0]   io_lsu_req_bits_0_bits_uop_br_tag,
  input  [5:0]   io_lsu_req_bits_0_bits_uop_ftq_idx,
  input          io_lsu_req_bits_0_bits_uop_edge_inst,
  input  [5:0]   io_lsu_req_bits_0_bits_uop_pc_lob,
  input          io_lsu_req_bits_0_bits_uop_taken,
  input  [19:0]  io_lsu_req_bits_0_bits_uop_imm_packed,
  input  [11:0]  io_lsu_req_bits_0_bits_uop_csr_addr,
  input  [6:0]   io_lsu_req_bits_0_bits_uop_rob_idx,
  input  [4:0]   io_lsu_req_bits_0_bits_uop_ldq_idx,
                 io_lsu_req_bits_0_bits_uop_stq_idx,
  input  [1:0]   io_lsu_req_bits_0_bits_uop_rxq_idx,
  input  [6:0]   io_lsu_req_bits_0_bits_uop_pdst,
                 io_lsu_req_bits_0_bits_uop_prs1,
                 io_lsu_req_bits_0_bits_uop_prs2,
                 io_lsu_req_bits_0_bits_uop_prs3,
  input  [5:0]   io_lsu_req_bits_0_bits_uop_ppred,
  input          io_lsu_req_bits_0_bits_uop_prs1_busy,
                 io_lsu_req_bits_0_bits_uop_prs2_busy,
                 io_lsu_req_bits_0_bits_uop_prs3_busy,
                 io_lsu_req_bits_0_bits_uop_ppred_busy,
  input  [6:0]   io_lsu_req_bits_0_bits_uop_stale_pdst,
  input          io_lsu_req_bits_0_bits_uop_exception,
  input  [63:0]  io_lsu_req_bits_0_bits_uop_exc_cause,
  input          io_lsu_req_bits_0_bits_uop_bypassable,
  input  [4:0]   io_lsu_req_bits_0_bits_uop_mem_cmd,
  input  [1:0]   io_lsu_req_bits_0_bits_uop_mem_size,
  input          io_lsu_req_bits_0_bits_uop_mem_signed,
                 io_lsu_req_bits_0_bits_uop_is_fence,
                 io_lsu_req_bits_0_bits_uop_is_fencei,
                 io_lsu_req_bits_0_bits_uop_is_amo,
                 io_lsu_req_bits_0_bits_uop_uses_ldq,
                 io_lsu_req_bits_0_bits_uop_uses_stq,
                 io_lsu_req_bits_0_bits_uop_is_sys_pc2epc,
                 io_lsu_req_bits_0_bits_uop_is_unique,
                 io_lsu_req_bits_0_bits_uop_flush_on_commit,
                 io_lsu_req_bits_0_bits_uop_ldst_is_rs1,
  input  [5:0]   io_lsu_req_bits_0_bits_uop_ldst,
                 io_lsu_req_bits_0_bits_uop_lrs1,
                 io_lsu_req_bits_0_bits_uop_lrs2,
                 io_lsu_req_bits_0_bits_uop_lrs3,
  input          io_lsu_req_bits_0_bits_uop_ldst_val,
  input  [1:0]   io_lsu_req_bits_0_bits_uop_dst_rtype,
                 io_lsu_req_bits_0_bits_uop_lrs1_rtype,
                 io_lsu_req_bits_0_bits_uop_lrs2_rtype,
  input          io_lsu_req_bits_0_bits_uop_frs3_en,
                 io_lsu_req_bits_0_bits_uop_fp_val,
                 io_lsu_req_bits_0_bits_uop_fp_single,
                 io_lsu_req_bits_0_bits_uop_xcpt_pf_if,
                 io_lsu_req_bits_0_bits_uop_xcpt_ae_if,
                 io_lsu_req_bits_0_bits_uop_xcpt_ma_if,
                 io_lsu_req_bits_0_bits_uop_bp_debug_if,
                 io_lsu_req_bits_0_bits_uop_bp_xcpt_if,
  input  [1:0]   io_lsu_req_bits_0_bits_uop_debug_fsrc,
                 io_lsu_req_bits_0_bits_uop_debug_tsrc,
  input  [39:0]  io_lsu_req_bits_0_bits_addr,
  input  [63:0]  io_lsu_req_bits_0_bits_data,
  input          io_lsu_req_bits_0_bits_is_hella,
                 io_lsu_req_bits_1_valid,
  input  [6:0]   io_lsu_req_bits_1_bits_uop_uopc,
  input  [31:0]  io_lsu_req_bits_1_bits_uop_inst,
                 io_lsu_req_bits_1_bits_uop_debug_inst,
  input          io_lsu_req_bits_1_bits_uop_is_rvc,
  input  [39:0]  io_lsu_req_bits_1_bits_uop_debug_pc,
  input  [2:0]   io_lsu_req_bits_1_bits_uop_iq_type,
  input  [9:0]   io_lsu_req_bits_1_bits_uop_fu_code,
  input  [3:0]   io_lsu_req_bits_1_bits_uop_ctrl_br_type,
  input  [1:0]   io_lsu_req_bits_1_bits_uop_ctrl_op1_sel,
  input  [2:0]   io_lsu_req_bits_1_bits_uop_ctrl_op2_sel,
                 io_lsu_req_bits_1_bits_uop_ctrl_imm_sel,
  input  [3:0]   io_lsu_req_bits_1_bits_uop_ctrl_op_fcn,
  input          io_lsu_req_bits_1_bits_uop_ctrl_fcn_dw,
  input  [2:0]   io_lsu_req_bits_1_bits_uop_ctrl_csr_cmd,
  input          io_lsu_req_bits_1_bits_uop_ctrl_is_load,
                 io_lsu_req_bits_1_bits_uop_ctrl_is_sta,
                 io_lsu_req_bits_1_bits_uop_ctrl_is_std,
  input  [1:0]   io_lsu_req_bits_1_bits_uop_iw_state,
  input          io_lsu_req_bits_1_bits_uop_iw_p1_poisoned,
                 io_lsu_req_bits_1_bits_uop_iw_p2_poisoned,
                 io_lsu_req_bits_1_bits_uop_is_br,
                 io_lsu_req_bits_1_bits_uop_is_jalr,
                 io_lsu_req_bits_1_bits_uop_is_jal,
                 io_lsu_req_bits_1_bits_uop_is_sfb,
  input  [19:0]  io_lsu_req_bits_1_bits_uop_br_mask,
  input  [4:0]   io_lsu_req_bits_1_bits_uop_br_tag,
  input  [5:0]   io_lsu_req_bits_1_bits_uop_ftq_idx,
  input          io_lsu_req_bits_1_bits_uop_edge_inst,
  input  [5:0]   io_lsu_req_bits_1_bits_uop_pc_lob,
  input          io_lsu_req_bits_1_bits_uop_taken,
  input  [19:0]  io_lsu_req_bits_1_bits_uop_imm_packed,
  input  [11:0]  io_lsu_req_bits_1_bits_uop_csr_addr,
  input  [6:0]   io_lsu_req_bits_1_bits_uop_rob_idx,
  input  [4:0]   io_lsu_req_bits_1_bits_uop_ldq_idx,
                 io_lsu_req_bits_1_bits_uop_stq_idx,
  input  [1:0]   io_lsu_req_bits_1_bits_uop_rxq_idx,
  input  [6:0]   io_lsu_req_bits_1_bits_uop_pdst,
                 io_lsu_req_bits_1_bits_uop_prs1,
                 io_lsu_req_bits_1_bits_uop_prs2,
                 io_lsu_req_bits_1_bits_uop_prs3,
  input  [5:0]   io_lsu_req_bits_1_bits_uop_ppred,
  input          io_lsu_req_bits_1_bits_uop_prs1_busy,
                 io_lsu_req_bits_1_bits_uop_prs2_busy,
                 io_lsu_req_bits_1_bits_uop_prs3_busy,
                 io_lsu_req_bits_1_bits_uop_ppred_busy,
  input  [6:0]   io_lsu_req_bits_1_bits_uop_stale_pdst,
  input          io_lsu_req_bits_1_bits_uop_exception,
  input  [63:0]  io_lsu_req_bits_1_bits_uop_exc_cause,
  input          io_lsu_req_bits_1_bits_uop_bypassable,
  input  [4:0]   io_lsu_req_bits_1_bits_uop_mem_cmd,
  input  [1:0]   io_lsu_req_bits_1_bits_uop_mem_size,
  input          io_lsu_req_bits_1_bits_uop_mem_signed,
                 io_lsu_req_bits_1_bits_uop_is_fence,
                 io_lsu_req_bits_1_bits_uop_is_fencei,
                 io_lsu_req_bits_1_bits_uop_is_amo,
                 io_lsu_req_bits_1_bits_uop_uses_ldq,
                 io_lsu_req_bits_1_bits_uop_uses_stq,
                 io_lsu_req_bits_1_bits_uop_is_sys_pc2epc,
                 io_lsu_req_bits_1_bits_uop_is_unique,
                 io_lsu_req_bits_1_bits_uop_flush_on_commit,
                 io_lsu_req_bits_1_bits_uop_ldst_is_rs1,
  input  [5:0]   io_lsu_req_bits_1_bits_uop_ldst,
                 io_lsu_req_bits_1_bits_uop_lrs1,
                 io_lsu_req_bits_1_bits_uop_lrs2,
                 io_lsu_req_bits_1_bits_uop_lrs3,
  input          io_lsu_req_bits_1_bits_uop_ldst_val,
  input  [1:0]   io_lsu_req_bits_1_bits_uop_dst_rtype,
                 io_lsu_req_bits_1_bits_uop_lrs1_rtype,
                 io_lsu_req_bits_1_bits_uop_lrs2_rtype,
  input          io_lsu_req_bits_1_bits_uop_frs3_en,
                 io_lsu_req_bits_1_bits_uop_fp_val,
                 io_lsu_req_bits_1_bits_uop_fp_single,
                 io_lsu_req_bits_1_bits_uop_xcpt_pf_if,
                 io_lsu_req_bits_1_bits_uop_xcpt_ae_if,
                 io_lsu_req_bits_1_bits_uop_xcpt_ma_if,
                 io_lsu_req_bits_1_bits_uop_bp_debug_if,
                 io_lsu_req_bits_1_bits_uop_bp_xcpt_if,
  input  [1:0]   io_lsu_req_bits_1_bits_uop_debug_fsrc,
                 io_lsu_req_bits_1_bits_uop_debug_tsrc,
  input  [39:0]  io_lsu_req_bits_1_bits_addr,
  input  [63:0]  io_lsu_req_bits_1_bits_data,
  input          io_lsu_req_bits_1_bits_is_hella,
                 io_lsu_s1_kill_0,
                 io_lsu_s1_kill_1,
  output         io_lsu_resp_0_valid,
  output [4:0]   io_lsu_resp_0_bits_uop_ldq_idx,
                 io_lsu_resp_0_bits_uop_stq_idx,
  output         io_lsu_resp_0_bits_uop_is_amo,
                 io_lsu_resp_0_bits_uop_uses_ldq,
                 io_lsu_resp_0_bits_uop_uses_stq,
  output [63:0]  io_lsu_resp_0_bits_data,
  output         io_lsu_resp_0_bits_is_hella,
                 io_lsu_resp_1_valid,
  output [4:0]   io_lsu_resp_1_bits_uop_ldq_idx,
                 io_lsu_resp_1_bits_uop_stq_idx,
  output         io_lsu_resp_1_bits_uop_is_amo,
                 io_lsu_resp_1_bits_uop_uses_ldq,
                 io_lsu_resp_1_bits_uop_uses_stq,
  output [63:0]  io_lsu_resp_1_bits_data,
  output         io_lsu_resp_1_bits_is_hella,
                 io_lsu_nack_0_valid,
  output [4:0]   io_lsu_nack_0_bits_uop_ldq_idx,
                 io_lsu_nack_0_bits_uop_stq_idx,
  output         io_lsu_nack_0_bits_uop_uses_ldq,
                 io_lsu_nack_0_bits_uop_uses_stq,
                 io_lsu_nack_0_bits_is_hella,
                 io_lsu_nack_1_valid,
  output [4:0]   io_lsu_nack_1_bits_uop_ldq_idx,
                 io_lsu_nack_1_bits_uop_stq_idx,
  output         io_lsu_nack_1_bits_uop_uses_ldq,
                 io_lsu_nack_1_bits_uop_uses_stq,
                 io_lsu_nack_1_bits_is_hella,
  input  [19:0]  io_lsu_brupdate_b1_resolve_mask,
                 io_lsu_brupdate_b1_mispredict_mask,
  input          io_lsu_exception,
                 io_lsu_release_ready,
  output         io_lsu_release_valid,
  output [32:0]  io_lsu_release_bits_address,
  input          io_lsu_force_order,
  output         io_lsu_ordered
);

  wire [63:0]  s2_data_word_1;
  wire [63:0]  s2_data_word_0;
  wire         _mshrs_io_req_1_valid_T_74;
  wire         _mshrs_io_req_0_valid_T_74;
  reg  [7:0]   s2_tag_match_way_1;
  reg  [7:0]   s2_tag_match_way_0;
  wire         _wb_io_data_req_ready_T;
  wire         _metaWriteArb_io_out_ready_T;
  wire [63:0]  _amoalu_io_out;
  wire         _lsu_release_arb_io_in_0_ready;
  wire         _lsu_release_arb_io_in_1_ready;
  wire         _wbArb_io_in_0_ready;
  wire         _wbArb_io_in_1_ready;
  wire         _wbArb_io_out_valid;
  wire [20:0]  _wbArb_io_out_bits_tag;
  wire [5:0]   _wbArb_io_out_bits_idx;
  wire [2:0]   _wbArb_io_out_bits_param;
  wire [7:0]   _wbArb_io_out_bits_way_en;
  wire         _wbArb_io_out_bits_voluntary;
  wire         _lfsr_prng_io_out_0;
  wire         _lfsr_prng_io_out_1;
  wire         _lfsr_prng_io_out_2;
  wire         _dataReadArb_io_in_1_ready;
  wire         _dataReadArb_io_in_2_ready;
  wire         _dataReadArb_io_out_valid;
  wire [7:0]   _dataReadArb_io_out_bits_req_0_way_en;
  wire [11:0]  _dataReadArb_io_out_bits_req_0_addr;
  wire [7:0]   _dataReadArb_io_out_bits_req_1_way_en;
  wire [11:0]  _dataReadArb_io_out_bits_req_1_addr;
  wire         _dataReadArb_io_out_bits_valid_0;
  wire         _dataReadArb_io_out_bits_valid_1;
  wire         _dataWriteArb_io_in_1_ready;
  wire         _dataWriteArb_io_out_valid;
  wire [7:0]   _dataWriteArb_io_out_bits_way_en;
  wire [11:0]  _dataWriteArb_io_out_bits_addr;
  wire [1:0]   _dataWriteArb_io_out_bits_wmask;
  wire [127:0] _dataWriteArb_io_out_bits_data;
  wire [127:0] _data_io_resp_0_0;
  wire [127:0] _data_io_resp_0_1;
  wire [127:0] _data_io_resp_0_2;
  wire [127:0] _data_io_resp_0_3;
  wire [127:0] _data_io_resp_0_4;
  wire [127:0] _data_io_resp_0_5;
  wire [127:0] _data_io_resp_0_6;
  wire [127:0] _data_io_resp_0_7;
  wire [127:0] _data_io_resp_1_0;
  wire [127:0] _data_io_resp_1_1;
  wire [127:0] _data_io_resp_1_2;
  wire [127:0] _data_io_resp_1_3;
  wire [127:0] _data_io_resp_1_4;
  wire [127:0] _data_io_resp_1_5;
  wire [127:0] _data_io_resp_1_6;
  wire [127:0] _data_io_resp_1_7;
  wire         _metaReadArb_io_in_0_ready;
  wire         _metaReadArb_io_in_1_ready;
  wire         _metaReadArb_io_in_2_ready;
  wire         _metaReadArb_io_in_3_ready;
  wire         _metaReadArb_io_in_4_ready;
  wire         _metaReadArb_io_in_5_ready;
  wire         _metaReadArb_io_out_valid;
  wire [5:0]   _metaReadArb_io_out_bits_req_0_idx;
  wire [5:0]   _metaReadArb_io_out_bits_req_1_idx;
  wire         _metaWriteArb_io_in_0_ready;
  wire         _metaWriteArb_io_in_1_ready;
  wire         _metaWriteArb_io_out_valid;
  wire [5:0]   _metaWriteArb_io_out_bits_idx;
  wire [7:0]   _metaWriteArb_io_out_bits_way_en;
  wire [1:0]   _metaWriteArb_io_out_bits_data_coh_state;
  wire [20:0]  _metaWriteArb_io_out_bits_data_tag;
  wire         _meta_1_io_read_ready;
  wire         _meta_1_io_write_ready;
  wire [1:0]   _meta_1_io_resp_0_coh_state;
  wire [20:0]  _meta_1_io_resp_0_tag;
  wire [1:0]   _meta_1_io_resp_1_coh_state;
  wire [20:0]  _meta_1_io_resp_1_tag;
  wire [1:0]   _meta_1_io_resp_2_coh_state;
  wire [20:0]  _meta_1_io_resp_2_tag;
  wire [1:0]   _meta_1_io_resp_3_coh_state;
  wire [20:0]  _meta_1_io_resp_3_tag;
  wire [1:0]   _meta_1_io_resp_4_coh_state;
  wire [20:0]  _meta_1_io_resp_4_tag;
  wire [1:0]   _meta_1_io_resp_5_coh_state;
  wire [20:0]  _meta_1_io_resp_5_tag;
  wire [1:0]   _meta_1_io_resp_6_coh_state;
  wire [20:0]  _meta_1_io_resp_6_tag;
  wire [1:0]   _meta_1_io_resp_7_coh_state;
  wire [20:0]  _meta_1_io_resp_7_tag;
  wire         _meta_0_io_read_ready;
  wire         _meta_0_io_write_ready;
  wire [1:0]   _meta_0_io_resp_0_coh_state;
  wire [20:0]  _meta_0_io_resp_0_tag;
  wire [1:0]   _meta_0_io_resp_1_coh_state;
  wire [20:0]  _meta_0_io_resp_1_tag;
  wire [1:0]   _meta_0_io_resp_2_coh_state;
  wire [20:0]  _meta_0_io_resp_2_tag;
  wire [1:0]   _meta_0_io_resp_3_coh_state;
  wire [20:0]  _meta_0_io_resp_3_tag;
  wire [1:0]   _meta_0_io_resp_4_coh_state;
  wire [20:0]  _meta_0_io_resp_4_tag;
  wire [1:0]   _meta_0_io_resp_5_coh_state;
  wire [20:0]  _meta_0_io_resp_5_tag;
  wire [1:0]   _meta_0_io_resp_6_coh_state;
  wire [20:0]  _meta_0_io_resp_6_tag;
  wire [1:0]   _meta_0_io_resp_7_coh_state;
  wire [20:0]  _meta_0_io_resp_7_tag;
  wire         _mshrs_io_req_0_ready;
  wire         _mshrs_io_req_1_ready;
  wire         _mshrs_io_resp_valid;
  wire [19:0]  _mshrs_io_resp_bits_uop_br_mask;
  wire [4:0]   _mshrs_io_resp_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_io_resp_bits_uop_stq_idx;
  wire         _mshrs_io_resp_bits_uop_is_amo;
  wire         _mshrs_io_resp_bits_uop_uses_ldq;
  wire         _mshrs_io_resp_bits_uop_uses_stq;
  wire [63:0]  _mshrs_io_resp_bits_data;
  wire         _mshrs_io_resp_bits_is_hella;
  wire         _mshrs_io_secondary_miss_0;
  wire         _mshrs_io_secondary_miss_1;
  wire         _mshrs_io_block_hit_0;
  wire         _mshrs_io_block_hit_1;
  wire         _mshrs_io_mem_grant_ready;
  wire         _mshrs_io_refill_valid;
  wire [7:0]   _mshrs_io_refill_bits_way_en;
  wire [11:0]  _mshrs_io_refill_bits_addr;
  wire [127:0] _mshrs_io_refill_bits_data;
  wire         _mshrs_io_meta_write_valid;
  wire [5:0]   _mshrs_io_meta_write_bits_idx;
  wire [7:0]   _mshrs_io_meta_write_bits_way_en;
  wire [1:0]   _mshrs_io_meta_write_bits_data_coh_state;
  wire [20:0]  _mshrs_io_meta_write_bits_data_tag;
  wire         _mshrs_io_meta_read_valid;
  wire [5:0]   _mshrs_io_meta_read_bits_idx;
  wire [7:0]   _mshrs_io_meta_read_bits_way_en;
  wire [20:0]  _mshrs_io_meta_read_bits_tag;
  wire         _mshrs_io_replay_valid;
  wire [6:0]   _mshrs_io_replay_bits_uop_uopc;
  wire [31:0]  _mshrs_io_replay_bits_uop_inst;
  wire [31:0]  _mshrs_io_replay_bits_uop_debug_inst;
  wire         _mshrs_io_replay_bits_uop_is_rvc;
  wire [39:0]  _mshrs_io_replay_bits_uop_debug_pc;
  wire [2:0]   _mshrs_io_replay_bits_uop_iq_type;
  wire [9:0]   _mshrs_io_replay_bits_uop_fu_code;
  wire [3:0]   _mshrs_io_replay_bits_uop_ctrl_br_type;
  wire [1:0]   _mshrs_io_replay_bits_uop_ctrl_op1_sel;
  wire [2:0]   _mshrs_io_replay_bits_uop_ctrl_op2_sel;
  wire [2:0]   _mshrs_io_replay_bits_uop_ctrl_imm_sel;
  wire [3:0]   _mshrs_io_replay_bits_uop_ctrl_op_fcn;
  wire         _mshrs_io_replay_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _mshrs_io_replay_bits_uop_ctrl_csr_cmd;
  wire         _mshrs_io_replay_bits_uop_ctrl_is_load;
  wire         _mshrs_io_replay_bits_uop_ctrl_is_sta;
  wire         _mshrs_io_replay_bits_uop_ctrl_is_std;
  wire [1:0]   _mshrs_io_replay_bits_uop_iw_state;
  wire         _mshrs_io_replay_bits_uop_iw_p1_poisoned;
  wire         _mshrs_io_replay_bits_uop_iw_p2_poisoned;
  wire         _mshrs_io_replay_bits_uop_is_br;
  wire         _mshrs_io_replay_bits_uop_is_jalr;
  wire         _mshrs_io_replay_bits_uop_is_jal;
  wire         _mshrs_io_replay_bits_uop_is_sfb;
  wire [19:0]  _mshrs_io_replay_bits_uop_br_mask;
  wire [4:0]   _mshrs_io_replay_bits_uop_br_tag;
  wire [5:0]   _mshrs_io_replay_bits_uop_ftq_idx;
  wire         _mshrs_io_replay_bits_uop_edge_inst;
  wire [5:0]   _mshrs_io_replay_bits_uop_pc_lob;
  wire         _mshrs_io_replay_bits_uop_taken;
  wire [19:0]  _mshrs_io_replay_bits_uop_imm_packed;
  wire [11:0]  _mshrs_io_replay_bits_uop_csr_addr;
  wire [6:0]   _mshrs_io_replay_bits_uop_rob_idx;
  wire [4:0]   _mshrs_io_replay_bits_uop_ldq_idx;
  wire [4:0]   _mshrs_io_replay_bits_uop_stq_idx;
  wire [1:0]   _mshrs_io_replay_bits_uop_rxq_idx;
  wire [6:0]   _mshrs_io_replay_bits_uop_pdst;
  wire [6:0]   _mshrs_io_replay_bits_uop_prs1;
  wire [6:0]   _mshrs_io_replay_bits_uop_prs2;
  wire [6:0]   _mshrs_io_replay_bits_uop_prs3;
  wire [5:0]   _mshrs_io_replay_bits_uop_ppred;
  wire         _mshrs_io_replay_bits_uop_prs1_busy;
  wire         _mshrs_io_replay_bits_uop_prs2_busy;
  wire         _mshrs_io_replay_bits_uop_prs3_busy;
  wire         _mshrs_io_replay_bits_uop_ppred_busy;
  wire [6:0]   _mshrs_io_replay_bits_uop_stale_pdst;
  wire         _mshrs_io_replay_bits_uop_exception;
  wire [63:0]  _mshrs_io_replay_bits_uop_exc_cause;
  wire         _mshrs_io_replay_bits_uop_bypassable;
  wire [4:0]   _mshrs_io_replay_bits_uop_mem_cmd;
  wire [1:0]   _mshrs_io_replay_bits_uop_mem_size;
  wire         _mshrs_io_replay_bits_uop_mem_signed;
  wire         _mshrs_io_replay_bits_uop_is_fence;
  wire         _mshrs_io_replay_bits_uop_is_fencei;
  wire         _mshrs_io_replay_bits_uop_is_amo;
  wire         _mshrs_io_replay_bits_uop_uses_ldq;
  wire         _mshrs_io_replay_bits_uop_uses_stq;
  wire         _mshrs_io_replay_bits_uop_is_sys_pc2epc;
  wire         _mshrs_io_replay_bits_uop_is_unique;
  wire         _mshrs_io_replay_bits_uop_flush_on_commit;
  wire         _mshrs_io_replay_bits_uop_ldst_is_rs1;
  wire [5:0]   _mshrs_io_replay_bits_uop_ldst;
  wire [5:0]   _mshrs_io_replay_bits_uop_lrs1;
  wire [5:0]   _mshrs_io_replay_bits_uop_lrs2;
  wire [5:0]   _mshrs_io_replay_bits_uop_lrs3;
  wire         _mshrs_io_replay_bits_uop_ldst_val;
  wire [1:0]   _mshrs_io_replay_bits_uop_dst_rtype;
  wire [1:0]   _mshrs_io_replay_bits_uop_lrs1_rtype;
  wire [1:0]   _mshrs_io_replay_bits_uop_lrs2_rtype;
  wire         _mshrs_io_replay_bits_uop_frs3_en;
  wire         _mshrs_io_replay_bits_uop_fp_val;
  wire         _mshrs_io_replay_bits_uop_fp_single;
  wire         _mshrs_io_replay_bits_uop_xcpt_pf_if;
  wire         _mshrs_io_replay_bits_uop_xcpt_ae_if;
  wire         _mshrs_io_replay_bits_uop_xcpt_ma_if;
  wire         _mshrs_io_replay_bits_uop_bp_debug_if;
  wire         _mshrs_io_replay_bits_uop_bp_xcpt_if;
  wire [1:0]   _mshrs_io_replay_bits_uop_debug_fsrc;
  wire [1:0]   _mshrs_io_replay_bits_uop_debug_tsrc;
  wire [39:0]  _mshrs_io_replay_bits_addr;
  wire [63:0]  _mshrs_io_replay_bits_data;
  wire         _mshrs_io_replay_bits_is_hella;
  wire [7:0]   _mshrs_io_replay_bits_way_en;
  wire         _mshrs_io_prefetch_valid;
  wire [4:0]   _mshrs_io_prefetch_bits_uop_mem_cmd;
  wire [39:0]  _mshrs_io_prefetch_bits_addr;
  wire         _mshrs_io_wb_req_valid;
  wire [20:0]  _mshrs_io_wb_req_bits_tag;
  wire [5:0]   _mshrs_io_wb_req_bits_idx;
  wire [2:0]   _mshrs_io_wb_req_bits_param;
  wire [7:0]   _mshrs_io_wb_req_bits_way_en;
  wire         _mshrs_io_fence_rdy;
  wire         _mshrs_io_probe_rdy;
  wire         _prober_io_req_ready;
  wire         _prober_io_rep_valid;
  wire [2:0]   _prober_io_rep_bits_param;
  wire [3:0]   _prober_io_rep_bits_size;
  wire [3:0]   _prober_io_rep_bits_source;
  wire [32:0]  _prober_io_rep_bits_address;
  wire         _prober_io_meta_read_valid;
  wire [5:0]   _prober_io_meta_read_bits_idx;
  wire [20:0]  _prober_io_meta_read_bits_tag;
  wire         _prober_io_meta_write_valid;
  wire [5:0]   _prober_io_meta_write_bits_idx;
  wire [7:0]   _prober_io_meta_write_bits_way_en;
  wire [1:0]   _prober_io_meta_write_bits_data_coh_state;
  wire [20:0]  _prober_io_meta_write_bits_data_tag;
  wire         _prober_io_wb_req_valid;
  wire [20:0]  _prober_io_wb_req_bits_tag;
  wire [5:0]   _prober_io_wb_req_bits_idx;
  wire [2:0]   _prober_io_wb_req_bits_param;
  wire [7:0]   _prober_io_wb_req_bits_way_en;
  wire         _prober_io_mshr_wb_rdy;
  wire         _prober_io_lsu_release_valid;
  wire [32:0]  _prober_io_lsu_release_bits_address;
  wire         _prober_io_state_valid;
  wire [39:0]  _prober_io_state_bits;
  wire         _wb_io_req_ready;
  wire         _wb_io_meta_read_valid;
  wire [5:0]   _wb_io_meta_read_bits_idx;
  wire [20:0]  _wb_io_meta_read_bits_tag;
  wire         _wb_io_resp;
  wire         _wb_io_idx_valid;
  wire [5:0]   _wb_io_idx_bits;
  wire         _wb_io_data_req_valid;
  wire [7:0]   _wb_io_data_req_bits_way_en;
  wire [11:0]  _wb_io_data_req_bits_addr;
  wire         _wb_io_release_valid;
  wire [2:0]   _wb_io_release_bits_opcode;
  wire [2:0]   _wb_io_release_bits_param;
  wire [32:0]  _wb_io_release_bits_address;
  wire [127:0] _wb_io_release_bits_data;
  wire         _wb_io_lsu_release_valid;
  wire [32:0]  _wb_io_lsu_release_bits_address;
  wire         _meta_1_io_write_valid_T = _metaWriteArb_io_out_ready_T & _metaWriteArb_io_out_valid;
  assign _metaWriteArb_io_out_ready_T = _meta_0_io_write_ready | _meta_1_io_write_ready;
  wire         _io_lsu_req_ready_output = _metaReadArb_io_in_4_ready & _dataReadArb_io_in_2_ready;
  wire         _wb_fire_T = _wb_io_data_req_ready_T & _wb_io_meta_read_valid;
  wire         _wb_fire_T_1 = _wb_io_data_req_ready_T & _wb_io_data_req_valid;
  assign _wb_io_data_req_ready_T = _metaReadArb_io_in_2_ready & _dataReadArb_io_in_1_ready;
  reg  [6:0]   s1_req_0_uop_uopc;
  reg  [31:0]  s1_req_0_uop_inst;
  reg  [31:0]  s1_req_0_uop_debug_inst;
  reg          s1_req_0_uop_is_rvc;
  reg  [39:0]  s1_req_0_uop_debug_pc;
  reg  [2:0]   s1_req_0_uop_iq_type;
  reg  [9:0]   s1_req_0_uop_fu_code;
  reg  [3:0]   s1_req_0_uop_ctrl_br_type;
  reg  [1:0]   s1_req_0_uop_ctrl_op1_sel;
  reg  [2:0]   s1_req_0_uop_ctrl_op2_sel;
  reg  [2:0]   s1_req_0_uop_ctrl_imm_sel;
  reg  [3:0]   s1_req_0_uop_ctrl_op_fcn;
  reg          s1_req_0_uop_ctrl_fcn_dw;
  reg  [2:0]   s1_req_0_uop_ctrl_csr_cmd;
  reg          s1_req_0_uop_ctrl_is_load;
  reg          s1_req_0_uop_ctrl_is_sta;
  reg          s1_req_0_uop_ctrl_is_std;
  reg  [1:0]   s1_req_0_uop_iw_state;
  reg          s1_req_0_uop_iw_p1_poisoned;
  reg          s1_req_0_uop_iw_p2_poisoned;
  reg          s1_req_0_uop_is_br;
  reg          s1_req_0_uop_is_jalr;
  reg          s1_req_0_uop_is_jal;
  reg          s1_req_0_uop_is_sfb;
  reg  [19:0]  s1_req_0_uop_br_mask;
  reg  [4:0]   s1_req_0_uop_br_tag;
  reg  [5:0]   s1_req_0_uop_ftq_idx;
  reg          s1_req_0_uop_edge_inst;
  reg  [5:0]   s1_req_0_uop_pc_lob;
  reg          s1_req_0_uop_taken;
  reg  [19:0]  s1_req_0_uop_imm_packed;
  reg  [11:0]  s1_req_0_uop_csr_addr;
  reg  [6:0]   s1_req_0_uop_rob_idx;
  reg  [4:0]   s1_req_0_uop_ldq_idx;
  reg  [4:0]   s1_req_0_uop_stq_idx;
  reg  [1:0]   s1_req_0_uop_rxq_idx;
  reg  [6:0]   s1_req_0_uop_pdst;
  reg  [6:0]   s1_req_0_uop_prs1;
  reg  [6:0]   s1_req_0_uop_prs2;
  reg  [6:0]   s1_req_0_uop_prs3;
  reg  [5:0]   s1_req_0_uop_ppred;
  reg          s1_req_0_uop_prs1_busy;
  reg          s1_req_0_uop_prs2_busy;
  reg          s1_req_0_uop_prs3_busy;
  reg          s1_req_0_uop_ppred_busy;
  reg  [6:0]   s1_req_0_uop_stale_pdst;
  reg          s1_req_0_uop_exception;
  reg  [63:0]  s1_req_0_uop_exc_cause;
  reg          s1_req_0_uop_bypassable;
  reg  [4:0]   s1_req_0_uop_mem_cmd;
  reg  [1:0]   s1_req_0_uop_mem_size;
  reg          s1_req_0_uop_mem_signed;
  reg          s1_req_0_uop_is_fence;
  reg          s1_req_0_uop_is_fencei;
  reg          s1_req_0_uop_is_amo;
  reg          s1_req_0_uop_uses_ldq;
  reg          s1_req_0_uop_uses_stq;
  reg          s1_req_0_uop_is_sys_pc2epc;
  reg          s1_req_0_uop_is_unique;
  reg          s1_req_0_uop_flush_on_commit;
  reg          s1_req_0_uop_ldst_is_rs1;
  reg  [5:0]   s1_req_0_uop_ldst;
  reg  [5:0]   s1_req_0_uop_lrs1;
  reg  [5:0]   s1_req_0_uop_lrs2;
  reg  [5:0]   s1_req_0_uop_lrs3;
  reg          s1_req_0_uop_ldst_val;
  reg  [1:0]   s1_req_0_uop_dst_rtype;
  reg  [1:0]   s1_req_0_uop_lrs1_rtype;
  reg  [1:0]   s1_req_0_uop_lrs2_rtype;
  reg          s1_req_0_uop_frs3_en;
  reg          s1_req_0_uop_fp_val;
  reg          s1_req_0_uop_fp_single;
  reg          s1_req_0_uop_xcpt_pf_if;
  reg          s1_req_0_uop_xcpt_ae_if;
  reg          s1_req_0_uop_xcpt_ma_if;
  reg          s1_req_0_uop_bp_debug_if;
  reg          s1_req_0_uop_bp_xcpt_if;
  reg  [1:0]   s1_req_0_uop_debug_fsrc;
  reg  [1:0]   s1_req_0_uop_debug_tsrc;
  reg  [39:0]  s1_req_0_addr;
  reg  [63:0]  s1_req_0_data;
  reg          s1_req_0_is_hella;
  reg  [6:0]   s1_req_1_uop_uopc;
  reg  [31:0]  s1_req_1_uop_inst;
  reg  [31:0]  s1_req_1_uop_debug_inst;
  reg          s1_req_1_uop_is_rvc;
  reg  [39:0]  s1_req_1_uop_debug_pc;
  reg  [2:0]   s1_req_1_uop_iq_type;
  reg  [9:0]   s1_req_1_uop_fu_code;
  reg  [3:0]   s1_req_1_uop_ctrl_br_type;
  reg  [1:0]   s1_req_1_uop_ctrl_op1_sel;
  reg  [2:0]   s1_req_1_uop_ctrl_op2_sel;
  reg  [2:0]   s1_req_1_uop_ctrl_imm_sel;
  reg  [3:0]   s1_req_1_uop_ctrl_op_fcn;
  reg          s1_req_1_uop_ctrl_fcn_dw;
  reg  [2:0]   s1_req_1_uop_ctrl_csr_cmd;
  reg          s1_req_1_uop_ctrl_is_load;
  reg          s1_req_1_uop_ctrl_is_sta;
  reg          s1_req_1_uop_ctrl_is_std;
  reg  [1:0]   s1_req_1_uop_iw_state;
  reg          s1_req_1_uop_iw_p1_poisoned;
  reg          s1_req_1_uop_iw_p2_poisoned;
  reg          s1_req_1_uop_is_br;
  reg          s1_req_1_uop_is_jalr;
  reg          s1_req_1_uop_is_jal;
  reg          s1_req_1_uop_is_sfb;
  reg  [19:0]  s1_req_1_uop_br_mask;
  reg  [4:0]   s1_req_1_uop_br_tag;
  reg  [5:0]   s1_req_1_uop_ftq_idx;
  reg          s1_req_1_uop_edge_inst;
  reg  [5:0]   s1_req_1_uop_pc_lob;
  reg          s1_req_1_uop_taken;
  reg  [19:0]  s1_req_1_uop_imm_packed;
  reg  [11:0]  s1_req_1_uop_csr_addr;
  reg  [6:0]   s1_req_1_uop_rob_idx;
  reg  [4:0]   s1_req_1_uop_ldq_idx;
  reg  [4:0]   s1_req_1_uop_stq_idx;
  reg  [1:0]   s1_req_1_uop_rxq_idx;
  reg  [6:0]   s1_req_1_uop_pdst;
  reg  [6:0]   s1_req_1_uop_prs1;
  reg  [6:0]   s1_req_1_uop_prs2;
  reg  [6:0]   s1_req_1_uop_prs3;
  reg  [5:0]   s1_req_1_uop_ppred;
  reg          s1_req_1_uop_prs1_busy;
  reg          s1_req_1_uop_prs2_busy;
  reg          s1_req_1_uop_prs3_busy;
  reg          s1_req_1_uop_ppred_busy;
  reg  [6:0]   s1_req_1_uop_stale_pdst;
  reg          s1_req_1_uop_exception;
  reg  [63:0]  s1_req_1_uop_exc_cause;
  reg          s1_req_1_uop_bypassable;
  reg  [4:0]   s1_req_1_uop_mem_cmd;
  reg  [1:0]   s1_req_1_uop_mem_size;
  reg          s1_req_1_uop_mem_signed;
  reg          s1_req_1_uop_is_fence;
  reg          s1_req_1_uop_is_fencei;
  reg          s1_req_1_uop_is_amo;
  reg          s1_req_1_uop_uses_ldq;
  reg          s1_req_1_uop_uses_stq;
  reg          s1_req_1_uop_is_sys_pc2epc;
  reg          s1_req_1_uop_is_unique;
  reg          s1_req_1_uop_flush_on_commit;
  reg          s1_req_1_uop_ldst_is_rs1;
  reg  [5:0]   s1_req_1_uop_ldst;
  reg  [5:0]   s1_req_1_uop_lrs1;
  reg  [5:0]   s1_req_1_uop_lrs2;
  reg  [5:0]   s1_req_1_uop_lrs3;
  reg          s1_req_1_uop_ldst_val;
  reg  [1:0]   s1_req_1_uop_dst_rtype;
  reg  [1:0]   s1_req_1_uop_lrs1_rtype;
  reg  [1:0]   s1_req_1_uop_lrs2_rtype;
  reg          s1_req_1_uop_frs3_en;
  reg          s1_req_1_uop_fp_val;
  reg          s1_req_1_uop_fp_single;
  reg          s1_req_1_uop_xcpt_pf_if;
  reg          s1_req_1_uop_xcpt_ae_if;
  reg          s1_req_1_uop_xcpt_ma_if;
  reg          s1_req_1_uop_bp_debug_if;
  reg          s1_req_1_uop_bp_xcpt_if;
  reg  [1:0]   s1_req_1_uop_debug_fsrc;
  reg  [1:0]   s1_req_1_uop_debug_tsrc;
  reg  [39:0]  s1_req_1_addr;
  reg  [63:0]  s1_req_1_data;
  reg          s1_req_1_is_hella;
  reg          s1_valid_REG;
  reg          s1_valid_REG_1;
  reg          REG;
  reg          REG_1;
  reg          REG_2;
  reg          REG_3;
  reg          s1_send_resp_or_nack_0;
  reg          s1_send_resp_or_nack_1;
  reg  [2:0]   s1_type;
  reg  [7:0]   s1_mshr_meta_read_way_en;
  reg  [7:0]   s1_replay_way_en;
  reg  [7:0]   s1_wb_way_en;
  reg  [6:0]   s2_req_0_uop_uopc;
  reg  [31:0]  s2_req_0_uop_inst;
  reg  [31:0]  s2_req_0_uop_debug_inst;
  reg          s2_req_0_uop_is_rvc;
  reg  [39:0]  s2_req_0_uop_debug_pc;
  reg  [2:0]   s2_req_0_uop_iq_type;
  reg  [9:0]   s2_req_0_uop_fu_code;
  reg  [3:0]   s2_req_0_uop_ctrl_br_type;
  reg  [1:0]   s2_req_0_uop_ctrl_op1_sel;
  reg  [2:0]   s2_req_0_uop_ctrl_op2_sel;
  reg  [2:0]   s2_req_0_uop_ctrl_imm_sel;
  reg  [3:0]   s2_req_0_uop_ctrl_op_fcn;
  reg          s2_req_0_uop_ctrl_fcn_dw;
  reg  [2:0]   s2_req_0_uop_ctrl_csr_cmd;
  reg          s2_req_0_uop_ctrl_is_load;
  reg          s2_req_0_uop_ctrl_is_sta;
  reg          s2_req_0_uop_ctrl_is_std;
  reg  [1:0]   s2_req_0_uop_iw_state;
  reg          s2_req_0_uop_iw_p1_poisoned;
  reg          s2_req_0_uop_iw_p2_poisoned;
  reg          s2_req_0_uop_is_br;
  reg          s2_req_0_uop_is_jalr;
  reg          s2_req_0_uop_is_jal;
  reg          s2_req_0_uop_is_sfb;
  reg  [19:0]  s2_req_0_uop_br_mask;
  reg  [4:0]   s2_req_0_uop_br_tag;
  reg  [5:0]   s2_req_0_uop_ftq_idx;
  reg          s2_req_0_uop_edge_inst;
  reg  [5:0]   s2_req_0_uop_pc_lob;
  reg          s2_req_0_uop_taken;
  reg  [19:0]  s2_req_0_uop_imm_packed;
  reg  [11:0]  s2_req_0_uop_csr_addr;
  reg  [6:0]   s2_req_0_uop_rob_idx;
  reg  [4:0]   s2_req_0_uop_ldq_idx;
  reg  [4:0]   s2_req_0_uop_stq_idx;
  reg  [1:0]   s2_req_0_uop_rxq_idx;
  reg  [6:0]   s2_req_0_uop_pdst;
  reg  [6:0]   s2_req_0_uop_prs1;
  reg  [6:0]   s2_req_0_uop_prs2;
  reg  [6:0]   s2_req_0_uop_prs3;
  reg  [5:0]   s2_req_0_uop_ppred;
  reg          s2_req_0_uop_prs1_busy;
  reg          s2_req_0_uop_prs2_busy;
  reg          s2_req_0_uop_prs3_busy;
  reg          s2_req_0_uop_ppred_busy;
  reg  [6:0]   s2_req_0_uop_stale_pdst;
  reg          s2_req_0_uop_exception;
  reg  [63:0]  s2_req_0_uop_exc_cause;
  reg          s2_req_0_uop_bypassable;
  reg  [4:0]   s2_req_0_uop_mem_cmd;
  reg  [1:0]   size;
  reg          s2_req_0_uop_mem_signed;
  reg          s2_req_0_uop_is_fence;
  reg          s2_req_0_uop_is_fencei;
  reg          s2_req_0_uop_is_amo;
  reg          s2_req_0_uop_uses_ldq;
  reg          s2_req_0_uop_uses_stq;
  reg          s2_req_0_uop_is_sys_pc2epc;
  reg          s2_req_0_uop_is_unique;
  reg          s2_req_0_uop_flush_on_commit;
  reg          s2_req_0_uop_ldst_is_rs1;
  reg  [5:0]   s2_req_0_uop_ldst;
  reg  [5:0]   s2_req_0_uop_lrs1;
  reg  [5:0]   s2_req_0_uop_lrs2;
  reg  [5:0]   s2_req_0_uop_lrs3;
  reg          s2_req_0_uop_ldst_val;
  reg  [1:0]   s2_req_0_uop_dst_rtype;
  reg  [1:0]   s2_req_0_uop_lrs1_rtype;
  reg  [1:0]   s2_req_0_uop_lrs2_rtype;
  reg          s2_req_0_uop_frs3_en;
  reg          s2_req_0_uop_fp_val;
  reg          s2_req_0_uop_fp_single;
  reg          s2_req_0_uop_xcpt_pf_if;
  reg          s2_req_0_uop_xcpt_ae_if;
  reg          s2_req_0_uop_xcpt_ma_if;
  reg          s2_req_0_uop_bp_debug_if;
  reg          s2_req_0_uop_bp_xcpt_if;
  reg  [1:0]   s2_req_0_uop_debug_fsrc;
  reg  [1:0]   s2_req_0_uop_debug_tsrc;
  reg  [39:0]  s2_req_0_addr;
  reg  [63:0]  s2_req_0_data;
  reg          s2_req_0_is_hella;
  reg  [6:0]   s2_req_1_uop_uopc;
  reg  [31:0]  s2_req_1_uop_inst;
  reg  [31:0]  s2_req_1_uop_debug_inst;
  reg          s2_req_1_uop_is_rvc;
  reg  [39:0]  s2_req_1_uop_debug_pc;
  reg  [2:0]   s2_req_1_uop_iq_type;
  reg  [9:0]   s2_req_1_uop_fu_code;
  reg  [3:0]   s2_req_1_uop_ctrl_br_type;
  reg  [1:0]   s2_req_1_uop_ctrl_op1_sel;
  reg  [2:0]   s2_req_1_uop_ctrl_op2_sel;
  reg  [2:0]   s2_req_1_uop_ctrl_imm_sel;
  reg  [3:0]   s2_req_1_uop_ctrl_op_fcn;
  reg          s2_req_1_uop_ctrl_fcn_dw;
  reg  [2:0]   s2_req_1_uop_ctrl_csr_cmd;
  reg          s2_req_1_uop_ctrl_is_load;
  reg          s2_req_1_uop_ctrl_is_sta;
  reg          s2_req_1_uop_ctrl_is_std;
  reg  [1:0]   s2_req_1_uop_iw_state;
  reg          s2_req_1_uop_iw_p1_poisoned;
  reg          s2_req_1_uop_iw_p2_poisoned;
  reg          s2_req_1_uop_is_br;
  reg          s2_req_1_uop_is_jalr;
  reg          s2_req_1_uop_is_jal;
  reg          s2_req_1_uop_is_sfb;
  reg  [19:0]  s2_req_1_uop_br_mask;
  reg  [4:0]   s2_req_1_uop_br_tag;
  reg  [5:0]   s2_req_1_uop_ftq_idx;
  reg          s2_req_1_uop_edge_inst;
  reg  [5:0]   s2_req_1_uop_pc_lob;
  reg          s2_req_1_uop_taken;
  reg  [19:0]  s2_req_1_uop_imm_packed;
  reg  [11:0]  s2_req_1_uop_csr_addr;
  reg  [6:0]   s2_req_1_uop_rob_idx;
  reg  [4:0]   s2_req_1_uop_ldq_idx;
  reg  [4:0]   s2_req_1_uop_stq_idx;
  reg  [1:0]   s2_req_1_uop_rxq_idx;
  reg  [6:0]   s2_req_1_uop_pdst;
  reg  [6:0]   s2_req_1_uop_prs1;
  reg  [6:0]   s2_req_1_uop_prs2;
  reg  [6:0]   s2_req_1_uop_prs3;
  reg  [5:0]   s2_req_1_uop_ppred;
  reg          s2_req_1_uop_prs1_busy;
  reg          s2_req_1_uop_prs2_busy;
  reg          s2_req_1_uop_prs3_busy;
  reg          s2_req_1_uop_ppred_busy;
  reg  [6:0]   s2_req_1_uop_stale_pdst;
  reg          s2_req_1_uop_exception;
  reg  [63:0]  s2_req_1_uop_exc_cause;
  reg          s2_req_1_uop_bypassable;
  reg  [4:0]   s2_req_1_uop_mem_cmd;
  reg  [1:0]   size_1;
  reg          s2_req_1_uop_mem_signed;
  reg          s2_req_1_uop_is_fence;
  reg          s2_req_1_uop_is_fencei;
  reg          s2_req_1_uop_is_amo;
  reg          s2_req_1_uop_uses_ldq;
  reg          s2_req_1_uop_uses_stq;
  reg          s2_req_1_uop_is_sys_pc2epc;
  reg          s2_req_1_uop_is_unique;
  reg          s2_req_1_uop_flush_on_commit;
  reg          s2_req_1_uop_ldst_is_rs1;
  reg  [5:0]   s2_req_1_uop_ldst;
  reg  [5:0]   s2_req_1_uop_lrs1;
  reg  [5:0]   s2_req_1_uop_lrs2;
  reg  [5:0]   s2_req_1_uop_lrs3;
  reg          s2_req_1_uop_ldst_val;
  reg  [1:0]   s2_req_1_uop_dst_rtype;
  reg  [1:0]   s2_req_1_uop_lrs1_rtype;
  reg  [1:0]   s2_req_1_uop_lrs2_rtype;
  reg          s2_req_1_uop_frs3_en;
  reg          s2_req_1_uop_fp_val;
  reg          s2_req_1_uop_fp_single;
  reg          s2_req_1_uop_xcpt_pf_if;
  reg          s2_req_1_uop_xcpt_ae_if;
  reg          s2_req_1_uop_xcpt_ma_if;
  reg          s2_req_1_uop_bp_debug_if;
  reg          s2_req_1_uop_bp_xcpt_if;
  reg  [1:0]   s2_req_1_uop_debug_fsrc;
  reg  [1:0]   s2_req_1_uop_debug_tsrc;
  reg  [39:0]  s2_req_1_addr;
  reg  [63:0]  s2_req_1_data;
  reg          s2_req_1_is_hella;
  reg  [2:0]   s2_type;
  reg          s2_valid_REG;
  reg          s2_valid_REG_1;
  reg  [1:0]   s2_hit_state_REG_state;
  reg  [1:0]   s2_hit_state_REG_1_state;
  reg  [1:0]   s2_hit_state_REG_2_state;
  reg  [1:0]   s2_hit_state_REG_3_state;
  reg  [1:0]   s2_hit_state_REG_4_state;
  reg  [1:0]   s2_hit_state_REG_5_state;
  reg  [1:0]   s2_hit_state_REG_6_state;
  reg  [1:0]   s2_hit_state_REG_7_state;
  wire [1:0]   mshrs_io_req_0_bits_old_meta_meta_coh_state = (s2_tag_match_way_0[0] ? s2_hit_state_REG_state : 2'h0) | (s2_tag_match_way_0[1] ? s2_hit_state_REG_1_state : 2'h0) | (s2_tag_match_way_0[2] ? s2_hit_state_REG_2_state : 2'h0) | (s2_tag_match_way_0[3] ? s2_hit_state_REG_3_state : 2'h0) | (s2_tag_match_way_0[4] ? s2_hit_state_REG_4_state : 2'h0) | (s2_tag_match_way_0[5] ? s2_hit_state_REG_5_state : 2'h0) | (s2_tag_match_way_0[6] ? s2_hit_state_REG_6_state : 2'h0) | (s2_tag_match_way_0[7] ? s2_hit_state_REG_7_state : 2'h0);
  reg  [1:0]   s2_hit_state_REG_8_state;
  reg  [1:0]   s2_hit_state_REG_9_state;
  reg  [1:0]   s2_hit_state_REG_10_state;
  reg  [1:0]   s2_hit_state_REG_11_state;
  reg  [1:0]   s2_hit_state_REG_12_state;
  reg  [1:0]   s2_hit_state_REG_13_state;
  reg  [1:0]   s2_hit_state_REG_14_state;
  reg  [1:0]   s2_hit_state_REG_15_state;
  wire [1:0]   mshrs_io_req_1_bits_old_meta_meta_coh_state = (s2_tag_match_way_1[0] ? s2_hit_state_REG_8_state : 2'h0) | (s2_tag_match_way_1[1] ? s2_hit_state_REG_9_state : 2'h0) | (s2_tag_match_way_1[2] ? s2_hit_state_REG_10_state : 2'h0) | (s2_tag_match_way_1[3] ? s2_hit_state_REG_11_state : 2'h0) | (s2_tag_match_way_1[4] ? s2_hit_state_REG_12_state : 2'h0) | (s2_tag_match_way_1[5] ? s2_hit_state_REG_13_state : 2'h0) | (s2_tag_match_way_1[6] ? s2_hit_state_REG_14_state : 2'h0) | (s2_tag_match_way_1[7] ? s2_hit_state_REG_15_state : 2'h0);
  wire         _s3_valid_T_1 = s2_req_0_uop_mem_cmd == 5'h1;
  wire         _s3_valid_T_2 = s2_req_0_uop_mem_cmd == 5'h11;
  wire         _s3_valid_T_4 = s2_req_0_uop_mem_cmd == 5'h7;
  wire         _s3_valid_T_6 = s2_req_0_uop_mem_cmd == 5'h4;
  wire         _s3_valid_T_7 = s2_req_0_uop_mem_cmd == 5'h9;
  wire         _s3_valid_T_8 = s2_req_0_uop_mem_cmd == 5'hA;
  wire         _s3_valid_T_9 = s2_req_0_uop_mem_cmd == 5'hB;
  wire         _s3_valid_T_13 = s2_req_0_uop_mem_cmd == 5'h8;
  wire         _s3_valid_T_14 = s2_req_0_uop_mem_cmd == 5'hC;
  wire         _s3_valid_T_15 = s2_req_0_uop_mem_cmd == 5'hD;
  wire         _s3_valid_T_16 = s2_req_0_uop_mem_cmd == 5'hE;
  wire         _s3_valid_T_17 = s2_req_0_uop_mem_cmd == 5'hF;
  wire         _mshrs_io_req_0_valid_T_22 = s2_req_0_uop_mem_cmd == 5'h3;
  wire         _mshrs_io_req_0_valid_T_26 = s2_req_0_uop_mem_cmd == 5'h6;
  wire [3:0]   _s2_has_permission_T = {_s3_valid_T_1 | _s3_valid_T_2 | _s3_valid_T_4 | _s3_valid_T_6 | _s3_valid_T_7 | _s3_valid_T_8 | _s3_valid_T_9 | _s3_valid_T_13 | _s3_valid_T_14 | _s3_valid_T_15 | _s3_valid_T_16 | _s3_valid_T_17, _s3_valid_T_1 | _s3_valid_T_2 | _s3_valid_T_4 | _s3_valid_T_6 | _s3_valid_T_7 | _s3_valid_T_8 | _s3_valid_T_9 | _s3_valid_T_13 | _s3_valid_T_14 | _s3_valid_T_15 | _s3_valid_T_16 | _s3_valid_T_17 | _mshrs_io_req_0_valid_T_22 | _mshrs_io_req_0_valid_T_26, mshrs_io_req_0_bits_old_meta_meta_coh_state};
  wire         s2_has_permission_0 = _s2_has_permission_T == 4'h3 | _s2_has_permission_T == 4'h2 | _s2_has_permission_T == 4'h1 | _s2_has_permission_T == 4'h7 | _s2_has_permission_T == 4'h6 | (&_s2_has_permission_T) | _s2_has_permission_T == 4'hE;
  wire         _mshrs_io_req_1_valid_T_50 = s2_req_1_uop_mem_cmd == 5'h1;
  wire         _mshrs_io_req_1_valid_T_51 = s2_req_1_uop_mem_cmd == 5'h11;
  wire         _mshrs_io_req_1_valid_T_53 = s2_req_1_uop_mem_cmd == 5'h7;
  wire         _mshrs_io_req_1_valid_T_55 = s2_req_1_uop_mem_cmd == 5'h4;
  wire         _mshrs_io_req_1_valid_T_56 = s2_req_1_uop_mem_cmd == 5'h9;
  wire         _mshrs_io_req_1_valid_T_57 = s2_req_1_uop_mem_cmd == 5'hA;
  wire         _mshrs_io_req_1_valid_T_58 = s2_req_1_uop_mem_cmd == 5'hB;
  wire         _mshrs_io_req_1_valid_T_62 = s2_req_1_uop_mem_cmd == 5'h8;
  wire         _mshrs_io_req_1_valid_T_63 = s2_req_1_uop_mem_cmd == 5'hC;
  wire         _mshrs_io_req_1_valid_T_64 = s2_req_1_uop_mem_cmd == 5'hD;
  wire         _mshrs_io_req_1_valid_T_65 = s2_req_1_uop_mem_cmd == 5'hE;
  wire         _mshrs_io_req_1_valid_T_66 = s2_req_1_uop_mem_cmd == 5'hF;
  wire         _mshrs_io_req_1_valid_T_22 = s2_req_1_uop_mem_cmd == 5'h3;
  wire         _mshrs_io_req_1_valid_T_26 = s2_req_1_uop_mem_cmd == 5'h6;
  wire [3:0]   _s2_has_permission_T_61 = {_mshrs_io_req_1_valid_T_50 | _mshrs_io_req_1_valid_T_51 | _mshrs_io_req_1_valid_T_53 | _mshrs_io_req_1_valid_T_55 | _mshrs_io_req_1_valid_T_56 | _mshrs_io_req_1_valid_T_57 | _mshrs_io_req_1_valid_T_58 | _mshrs_io_req_1_valid_T_62 | _mshrs_io_req_1_valid_T_63 | _mshrs_io_req_1_valid_T_64 | _mshrs_io_req_1_valid_T_65 | _mshrs_io_req_1_valid_T_66, _mshrs_io_req_1_valid_T_50 | _mshrs_io_req_1_valid_T_51 | _mshrs_io_req_1_valid_T_53 | _mshrs_io_req_1_valid_T_55 | _mshrs_io_req_1_valid_T_56 | _mshrs_io_req_1_valid_T_57 | _mshrs_io_req_1_valid_T_58 | _mshrs_io_req_1_valid_T_62 | _mshrs_io_req_1_valid_T_63 | _mshrs_io_req_1_valid_T_64 | _mshrs_io_req_1_valid_T_65 | _mshrs_io_req_1_valid_T_66 | _mshrs_io_req_1_valid_T_22 | _mshrs_io_req_1_valid_T_26, mshrs_io_req_1_bits_old_meta_meta_coh_state};
  wire         s2_has_permission_1 = _s2_has_permission_T_61 == 4'h3 | _s2_has_permission_T_61 == 4'h2 | _s2_has_permission_T_61 == 4'h1 | _s2_has_permission_T_61 == 4'h7 | _s2_has_permission_T_61 == 4'h6 | (&_s2_has_permission_T_61) | _s2_has_permission_T_61 == 4'hE;
  reg  [1:0]   casez_tmp;
  wire [3:0]   _s2_new_hit_state_T = {_s3_valid_T_1 | _s3_valid_T_2 | _s3_valid_T_4 | _s3_valid_T_6 | _s3_valid_T_7 | _s3_valid_T_8 | _s3_valid_T_9 | _s3_valid_T_13 | _s3_valid_T_14 | _s3_valid_T_15 | _s3_valid_T_16 | _s3_valid_T_17, _s3_valid_T_1 | _s3_valid_T_2 | _s3_valid_T_4 | _s3_valid_T_6 | _s3_valid_T_7 | _s3_valid_T_8 | _s3_valid_T_9 | _s3_valid_T_13 | _s3_valid_T_14 | _s3_valid_T_15 | _s3_valid_T_16 | _s3_valid_T_17 | _mshrs_io_req_0_valid_T_22 | _mshrs_io_req_0_valid_T_26, mshrs_io_req_0_bits_old_meta_meta_coh_state};
  wire [1:0]   _s2_new_hit_state_T_27 = {1'h0, _s2_new_hit_state_T == 4'hC};
  always @(*) begin
    casez (_s2_new_hit_state_T)
      4'b0000:
        casez_tmp = 2'h0;
      4'b0001:
        casez_tmp = 2'h1;
      4'b0010:
        casez_tmp = 2'h2;
      4'b0011:
        casez_tmp = 2'h3;
      4'b0100:
        casez_tmp = 2'h1;
      4'b0101:
        casez_tmp = 2'h2;
      4'b0110:
        casez_tmp = 2'h2;
      4'b0111:
        casez_tmp = 2'h3;
      4'b1000:
        casez_tmp = _s2_new_hit_state_T_27;
      4'b1001:
        casez_tmp = _s2_new_hit_state_T_27;
      4'b1010:
        casez_tmp = _s2_new_hit_state_T_27;
      4'b1011:
        casez_tmp = _s2_new_hit_state_T_27;
      4'b1100:
        casez_tmp = _s2_new_hit_state_T_27;
      4'b1101:
        casez_tmp = 2'h2;
      4'b1110:
        casez_tmp = 2'h3;
      default:
        casez_tmp = 2'h3;
    endcase
  end // always @(*)
  reg  [1:0]   casez_tmp_0;
  wire [3:0]   _s2_new_hit_state_T_61 = {_mshrs_io_req_1_valid_T_50 | _mshrs_io_req_1_valid_T_51 | _mshrs_io_req_1_valid_T_53 | _mshrs_io_req_1_valid_T_55 | _mshrs_io_req_1_valid_T_56 | _mshrs_io_req_1_valid_T_57 | _mshrs_io_req_1_valid_T_58 | _mshrs_io_req_1_valid_T_62 | _mshrs_io_req_1_valid_T_63 | _mshrs_io_req_1_valid_T_64 | _mshrs_io_req_1_valid_T_65 | _mshrs_io_req_1_valid_T_66, _mshrs_io_req_1_valid_T_50 | _mshrs_io_req_1_valid_T_51 | _mshrs_io_req_1_valid_T_53 | _mshrs_io_req_1_valid_T_55 | _mshrs_io_req_1_valid_T_56 | _mshrs_io_req_1_valid_T_57 | _mshrs_io_req_1_valid_T_58 | _mshrs_io_req_1_valid_T_62 | _mshrs_io_req_1_valid_T_63 | _mshrs_io_req_1_valid_T_64 | _mshrs_io_req_1_valid_T_65 | _mshrs_io_req_1_valid_T_66 | _mshrs_io_req_1_valid_T_22 | _mshrs_io_req_1_valid_T_26, mshrs_io_req_1_bits_old_meta_meta_coh_state};
  wire [1:0]   _s2_new_hit_state_T_88 = {1'h0, _s2_new_hit_state_T_61 == 4'hC};
  always @(*) begin
    casez (_s2_new_hit_state_T_61)
      4'b0000:
        casez_tmp_0 = 2'h0;
      4'b0001:
        casez_tmp_0 = 2'h1;
      4'b0010:
        casez_tmp_0 = 2'h2;
      4'b0011:
        casez_tmp_0 = 2'h3;
      4'b0100:
        casez_tmp_0 = 2'h1;
      4'b0101:
        casez_tmp_0 = 2'h2;
      4'b0110:
        casez_tmp_0 = 2'h2;
      4'b0111:
        casez_tmp_0 = 2'h3;
      4'b1000:
        casez_tmp_0 = _s2_new_hit_state_T_88;
      4'b1001:
        casez_tmp_0 = _s2_new_hit_state_T_88;
      4'b1010:
        casez_tmp_0 = _s2_new_hit_state_T_88;
      4'b1011:
        casez_tmp_0 = _s2_new_hit_state_T_88;
      4'b1100:
        casez_tmp_0 = _s2_new_hit_state_T_88;
      4'b1101:
        casez_tmp_0 = 2'h2;
      4'b1110:
        casez_tmp_0 = 2'h3;
      default:
        casez_tmp_0 = 2'h3;
    endcase
  end // always @(*)
  wire         _s2_hit_T_15 = s2_type == 3'h2;
  wire         s2_hit_0 = (|s2_tag_match_way_0) & s2_has_permission_0 & mshrs_io_req_0_bits_old_meta_meta_coh_state == casez_tmp & ~_mshrs_io_block_hit_0 | ~(|s2_type) | _s2_hit_T_15;
  wire         s2_hit_1 = (|s2_tag_match_way_1) & s2_has_permission_1 & mshrs_io_req_1_bits_old_meta_meta_coh_state == casez_tmp_0 & ~_mshrs_io_block_hit_1 | ~(|s2_type) | _s2_hit_T_15;
  reg          s2_wb_idx_matches_0;
  reg          s2_wb_idx_matches_1;
  reg  [39:0]  debug_sc_fail_addr;
  reg  [7:0]   debug_sc_fail_cnt;
  reg  [6:0]   lrsc_count;
  reg  [33:0]  lrsc_addr;
  reg          s2_lr_REG;
  reg          s2_sc_REG;
  wire         s2_sc = _s3_valid_T_4 & (~s2_sc_REG | ~(|s2_type));
  wire         s2_lrsc_addr_match_0 = (|(lrsc_count[6:2])) & lrsc_addr == s2_req_0_addr[39:6];
  wire         s2_sc_fail = s2_sc & ~s2_lrsc_addr_match_0;
  wire         _mshrs_io_req_1_valid_T_10 = s2_type == 3'h4;
  wire [127:0] s2_data_muxed_0 = (s2_tag_match_way_0[0] ? _data_io_resp_0_0 : 128'h0) | (s2_tag_match_way_0[1] ? _data_io_resp_0_1 : 128'h0) | (s2_tag_match_way_0[2] ? _data_io_resp_0_2 : 128'h0) | (s2_tag_match_way_0[3] ? _data_io_resp_0_3 : 128'h0) | (s2_tag_match_way_0[4] ? _data_io_resp_0_4 : 128'h0) | (s2_tag_match_way_0[5] ? _data_io_resp_0_5 : 128'h0) | (s2_tag_match_way_0[6] ? _data_io_resp_0_6 : 128'h0) | (s2_tag_match_way_0[7] ? _data_io_resp_0_7 : 128'h0);
  reg  [2:0]   s2_replaced_way_en_REG;
  wire [7:0]   s2_replaced_way_en = 8'h1 << s2_replaced_way_en_REG;
  reg  [1:0]   s2_repl_meta_REG_coh_state;
  reg  [20:0]  s2_repl_meta_REG_tag;
  reg  [1:0]   s2_repl_meta_REG_1_coh_state;
  reg  [20:0]  s2_repl_meta_REG_1_tag;
  reg  [1:0]   s2_repl_meta_REG_2_coh_state;
  reg  [20:0]  s2_repl_meta_REG_2_tag;
  reg  [1:0]   s2_repl_meta_REG_3_coh_state;
  reg  [20:0]  s2_repl_meta_REG_3_tag;
  reg  [1:0]   s2_repl_meta_REG_4_coh_state;
  reg  [20:0]  s2_repl_meta_REG_4_tag;
  reg  [1:0]   s2_repl_meta_REG_5_coh_state;
  reg  [20:0]  s2_repl_meta_REG_5_tag;
  reg  [1:0]   s2_repl_meta_REG_6_coh_state;
  reg  [20:0]  s2_repl_meta_REG_6_tag;
  reg  [1:0]   s2_repl_meta_REG_7_coh_state;
  reg  [20:0]  s2_repl_meta_REG_7_tag;
  wire         _s2_repl_meta_T_38 = s2_replaced_way_en_REG == 3'h0;
  wire         _s2_repl_meta_T_39 = s2_replaced_way_en_REG == 3'h1;
  wire         _s2_repl_meta_T_40 = s2_replaced_way_en_REG == 3'h2;
  wire         _s2_repl_meta_T_41 = s2_replaced_way_en_REG == 3'h3;
  wire         _s2_repl_meta_T_42 = s2_replaced_way_en_REG == 3'h4;
  wire         _s2_repl_meta_T_43 = s2_replaced_way_en_REG == 3'h5;
  wire         _s2_repl_meta_T_44 = s2_replaced_way_en_REG == 3'h6;
  reg  [1:0]   s2_repl_meta_REG_8_coh_state;
  reg  [20:0]  s2_repl_meta_REG_8_tag;
  reg  [1:0]   s2_repl_meta_REG_9_coh_state;
  reg  [20:0]  s2_repl_meta_REG_9_tag;
  reg  [1:0]   s2_repl_meta_REG_10_coh_state;
  reg  [20:0]  s2_repl_meta_REG_10_tag;
  reg  [1:0]   s2_repl_meta_REG_11_coh_state;
  reg  [20:0]  s2_repl_meta_REG_11_tag;
  reg  [1:0]   s2_repl_meta_REG_12_coh_state;
  reg  [20:0]  s2_repl_meta_REG_12_tag;
  reg  [1:0]   s2_repl_meta_REG_13_coh_state;
  reg  [20:0]  s2_repl_meta_REG_13_tag;
  reg  [1:0]   s2_repl_meta_REG_14_coh_state;
  reg  [20:0]  s2_repl_meta_REG_14_tag;
  reg  [1:0]   s2_repl_meta_REG_15_coh_state;
  reg  [20:0]  s2_repl_meta_REG_15_tag;
  reg          s2_nack_hit_0;
  reg          s2_nack_hit_1;
  wire         _s3_valid_T = s2_valid_REG & s2_hit_0;
  wire         s2_nack_victim_0 = _s3_valid_T & _mshrs_io_secondary_miss_0;
  wire         _s2_nack_victim_T_2 = s2_valid_REG_1 & s2_hit_1;
  wire         s2_nack_victim_1 = _s2_nack_victim_T_2 & _mshrs_io_secondary_miss_1;
  wire         s2_nack_wb_0 = s2_valid_REG & ~s2_hit_0 & s2_wb_idx_matches_0;
  wire         s2_nack_wb_1 = s2_valid_REG_1 & ~s2_hit_1 & s2_wb_idx_matches_1;
  wire         s2_nack_0 = (s2_valid_REG & ~s2_hit_0 & ~_mshrs_io_req_0_ready | s2_nack_hit_0 | s2_nack_victim_0 | s2_nack_wb_0) & (|s2_type);
  wire         s2_nack_1 = (s2_valid_REG_1 & ~s2_hit_1 & ~_mshrs_io_req_1_ready | s2_nack_hit_1 | s2_nack_victim_1 | s2_nack_wb_1) & (|s2_type);
  reg          s2_send_resp_REG;
  wire         _s2_send_resp_T_2 = _mshrs_io_req_0_ready & _mshrs_io_req_0_valid_T_74;
  wire         _mshrs_io_req_0_valid_T_24 = s2_req_0_uop_mem_cmd == 5'h0;
  wire         _mshrs_io_req_0_valid_T_25 = s2_req_0_uop_mem_cmd == 5'h10;
  wire         s2_send_resp_0 = s2_send_resp_REG & ~s2_nack_0 & (s2_hit_0 | _s2_send_resp_T_2 & (_s3_valid_T_1 | _s3_valid_T_2 | _s3_valid_T_4 | _s3_valid_T_6 | _s3_valid_T_7 | _s3_valid_T_8 | _s3_valid_T_9 | _s3_valid_T_13 | _s3_valid_T_14 | _s3_valid_T_15 | _s3_valid_T_16 | _s3_valid_T_17) & ~(_mshrs_io_req_0_valid_T_24 | _mshrs_io_req_0_valid_T_25 | _mshrs_io_req_0_valid_T_26 | _s3_valid_T_4 | _s3_valid_T_6 | _s3_valid_T_7 | _s3_valid_T_8 | _s3_valid_T_9 | _s3_valid_T_13 | _s3_valid_T_14 | _s3_valid_T_15 | _s3_valid_T_16 | _s3_valid_T_17));
  reg          s2_send_resp_REG_1;
  wire         _s2_send_resp_T_58 = _mshrs_io_req_1_ready & _mshrs_io_req_1_valid_T_74;
  wire         _mshrs_io_req_1_valid_T_24 = s2_req_1_uop_mem_cmd == 5'h0;
  wire         _mshrs_io_req_1_valid_T_25 = s2_req_1_uop_mem_cmd == 5'h10;
  wire         s2_send_resp_1 = s2_send_resp_REG_1 & ~s2_nack_1 & (s2_hit_1 | _s2_send_resp_T_58 & (_mshrs_io_req_1_valid_T_50 | _mshrs_io_req_1_valid_T_51 | _mshrs_io_req_1_valid_T_53 | _mshrs_io_req_1_valid_T_55 | _mshrs_io_req_1_valid_T_56 | _mshrs_io_req_1_valid_T_57 | _mshrs_io_req_1_valid_T_58 | _mshrs_io_req_1_valid_T_62 | _mshrs_io_req_1_valid_T_63 | _mshrs_io_req_1_valid_T_64 | _mshrs_io_req_1_valid_T_65 | _mshrs_io_req_1_valid_T_66) & ~(_mshrs_io_req_1_valid_T_24 | _mshrs_io_req_1_valid_T_25 | _mshrs_io_req_1_valid_T_26 | _mshrs_io_req_1_valid_T_53 | _mshrs_io_req_1_valid_T_55 | _mshrs_io_req_1_valid_T_56 | _mshrs_io_req_1_valid_T_57 | _mshrs_io_req_1_valid_T_58 | _mshrs_io_req_1_valid_T_62 | _mshrs_io_req_1_valid_T_63 | _mshrs_io_req_1_valid_T_64 | _mshrs_io_req_1_valid_T_65 | _mshrs_io_req_1_valid_T_66));
  reg          s2_send_nack_REG;
  wire         s2_send_nack_0 = s2_send_nack_REG & s2_nack_0;
  reg          s2_send_nack_REG_1;
  wire         s2_send_nack_1 = s2_send_nack_REG_1 & s2_nack_1;
  wire         s2_store_failed = s2_valid_REG & s2_nack_0 & s2_send_nack_0 & s2_req_0_uop_uses_stq;
  wire         _mshrs_io_req_1_valid_T_11 = s2_type == 3'h5;
  wire [19:0]  _io_lsu_nack_0_valid_T_4 = io_lsu_brupdate_b1_mispredict_mask & s2_req_0_uop_br_mask;
  wire         _io_lsu_nack_0_valid_T_1 = io_lsu_exception & s2_req_0_uop_uses_ldq;
  assign _mshrs_io_req_0_valid_T_74 = s2_valid_REG & ~s2_hit_0 & ~s2_nack_hit_0 & ~s2_nack_victim_0 & ~s2_nack_wb_0 & (_mshrs_io_req_1_valid_T_10 | _mshrs_io_req_1_valid_T_11) & _io_lsu_nack_0_valid_T_4 == 20'h0 & ~_io_lsu_nack_0_valid_T_1 & (s2_req_0_uop_mem_cmd == 5'h2 | _mshrs_io_req_0_valid_T_22 | _mshrs_io_req_0_valid_T_24 | _mshrs_io_req_0_valid_T_25 | _mshrs_io_req_0_valid_T_26 | _s3_valid_T_4 | _s3_valid_T_6 | _s3_valid_T_7 | _s3_valid_T_8 | _s3_valid_T_9 | _s3_valid_T_13 | _s3_valid_T_14 | _s3_valid_T_15 | _s3_valid_T_16 | _s3_valid_T_17 | _s3_valid_T_1 | _s3_valid_T_2);
  wire         _mshrs_io_req_is_probe_1_T = s2_type == 3'h1;
  wire [19:0]  _io_lsu_nack_1_valid_T_4 = io_lsu_brupdate_b1_mispredict_mask & s2_req_1_uop_br_mask;
  wire         _io_lsu_nack_1_valid_T_1 = io_lsu_exception & s2_req_1_uop_uses_ldq;
  assign _mshrs_io_req_1_valid_T_74 = s2_valid_REG_1 & ~s2_hit_1 & ~s2_nack_hit_1 & ~s2_nack_victim_1 & ~s2_nack_wb_1 & (_mshrs_io_req_1_valid_T_10 | _mshrs_io_req_1_valid_T_11) & _io_lsu_nack_1_valid_T_4 == 20'h0 & ~_io_lsu_nack_1_valid_T_1 & (s2_req_1_uop_mem_cmd == 5'h2 | _mshrs_io_req_1_valid_T_22 | _mshrs_io_req_1_valid_T_24 | _mshrs_io_req_1_valid_T_25 | _mshrs_io_req_1_valid_T_26 | _mshrs_io_req_1_valid_T_53 | _mshrs_io_req_1_valid_T_55 | _mshrs_io_req_1_valid_T_56 | _mshrs_io_req_1_valid_T_57 | _mshrs_io_req_1_valid_T_58 | _mshrs_io_req_1_valid_T_62 | _mshrs_io_req_1_valid_T_63 | _mshrs_io_req_1_valid_T_64 | _mshrs_io_req_1_valid_T_65 | _mshrs_io_req_1_valid_T_66 | _mshrs_io_req_1_valid_T_50 | _mshrs_io_req_1_valid_T_51);
  reg  [1:0]   mshrs_io_meta_resp_bits_REG_0_coh_state;
  reg  [1:0]   mshrs_io_meta_resp_bits_REG_1_coh_state;
  reg  [1:0]   mshrs_io_meta_resp_bits_REG_2_coh_state;
  reg  [1:0]   mshrs_io_meta_resp_bits_REG_3_coh_state;
  reg  [1:0]   mshrs_io_meta_resp_bits_REG_4_coh_state;
  reg  [1:0]   mshrs_io_meta_resp_bits_REG_5_coh_state;
  reg  [1:0]   mshrs_io_meta_resp_bits_REG_6_coh_state;
  reg  [1:0]   mshrs_io_meta_resp_bits_REG_7_coh_state;
  wire         _wb_io_mem_grant_T_1 = auto_out_d_bits_source == 4'h8;
  wire         nodeOut_d_ready = _wb_io_mem_grant_T_1 | _mshrs_io_mem_grant_ready;
  reg  [7:0]   beatsLeft;
  wire         idle = beatsLeft == 8'h0;
  wire         winner_1 = ~_wb_io_release_valid & _prober_io_rep_valid;
  wire         _nodeOut_c_valid_T = _wb_io_release_valid | _prober_io_rep_valid;
  reg          state_0;
  reg          state_1;
  wire         muxState_0 = idle ? _wb_io_release_valid : state_0;
  wire         muxState_1 = idle ? winner_1 : state_1;
  wire         nodeOut_c_valid = idle ? _nodeOut_c_valid_T : state_0 & _wb_io_release_valid | state_1 & _prober_io_rep_valid;
  wire [127:0] s2_data_word_prebypass_0 = s2_data_muxed_0 >> {121'h0, s2_req_0_addr[3], 6'h0};
  wire [127:0] s2_data_word_prebypass_1 = ((s2_tag_match_way_1[0] ? _data_io_resp_1_0 : 128'h0) | (s2_tag_match_way_1[1] ? _data_io_resp_1_1 : 128'h0) | (s2_tag_match_way_1[2] ? _data_io_resp_1_2 : 128'h0) | (s2_tag_match_way_1[3] ? _data_io_resp_1_3 : 128'h0) | (s2_tag_match_way_1[4] ? _data_io_resp_1_4 : 128'h0) | (s2_tag_match_way_1[5] ? _data_io_resp_1_5 : 128'h0) | (s2_tag_match_way_1[6] ? _data_io_resp_1_6 : 128'h0) | (s2_tag_match_way_1[7] ? _data_io_resp_1_7 : 128'h0)) >> {121'h0, s2_req_1_addr[3], 6'h0};
  wire         cache_resp_0_valid = s2_valid_REG & s2_send_resp_0;
  wire [31:0]  cache_resp_0_bits_data_zeroed = s2_req_0_addr[2] ? s2_data_word_0[63:32] : s2_data_word_0[31:0];
  wire [15:0]  cache_resp_0_bits_data_zeroed_1 = s2_req_0_addr[1] ? cache_resp_0_bits_data_zeroed[31:16] : cache_resp_0_bits_data_zeroed[15:0];
  wire [7:0]   cache_resp_0_bits_data_zeroed_2 = s2_sc ? 8'h0 : s2_req_0_addr[0] ? cache_resp_0_bits_data_zeroed_1[15:8] : cache_resp_0_bits_data_zeroed_1[7:0];
  wire         cache_resp_1_valid = s2_valid_REG_1 & s2_send_resp_1;
  wire [31:0]  cache_resp_1_bits_data_zeroed = s2_req_1_addr[2] ? s2_data_word_1[63:32] : s2_data_word_1[31:0];
  wire [15:0]  cache_resp_1_bits_data_zeroed_1 = s2_req_1_addr[1] ? cache_resp_1_bits_data_zeroed[31:16] : cache_resp_1_bits_data_zeroed[15:0];
  wire [7:0]   cache_resp_1_bits_data_zeroed_2 = s2_req_1_addr[0] ? cache_resp_1_bits_data_zeroed_1[15:8] : cache_resp_1_bits_data_zeroed_1[7:0];
  wire         io_lsu_resp_0_bits_out_uop_uses_ldq = cache_resp_0_valid ? s2_req_0_uop_uses_ldq : _mshrs_io_resp_bits_uop_uses_ldq;
  wire         uncache_respond_1 = ~cache_resp_1_valid & cache_resp_0_valid;
  wire         io_lsu_resp_1_bits_out_uop_uses_ldq = uncache_respond_1 ? _mshrs_io_resp_bits_uop_uses_ldq : s2_req_1_uop_uses_ldq;
  wire         _io_lsu_nack_0_valid_output = s2_valid_REG & s2_send_nack_0 & ~_io_lsu_nack_0_valid_T_1 & _io_lsu_nack_0_valid_T_4 == 20'h0;
  wire         _io_lsu_nack_1_valid_output = s2_valid_REG_1 & s2_send_nack_1 & ~_io_lsu_nack_1_valid_T_1 & _io_lsu_nack_1_valid_T_4 == 20'h0;
  reg  [39:0]  s3_req_addr;
  reg  [63:0]  s3_req_data;
  reg          s3_valid;
  `ifndef SYNTHESIS
    wire _GEN = s2_type != 3'h4;
    always @(posedge clock) begin
      if (~reset & (_wb_fire_T ^ _wb_fire_T_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at dcache.scala:548 assert(!(wb.io.meta_read.fire ^ wb.io.data_req.fire))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & io_lsu_s1_kill_0 & ~REG & ~REG_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at dcache.scala:611 assert(!(io.lsu.s1_kill(w) && !RegNext(io.lsu.req.fire) && !RegNext(io.lsu.req.bits(w).valid)))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & io_lsu_s1_kill_1 & ~REG_2 & ~REG_3) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at dcache.scala:611 assert(!(io.lsu.s1_kill(w) && !RegNext(io.lsu.req.fire) && !RegNext(io.lsu.req.bits(w).valid)))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(|s2_type) & ~s2_hit_0) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Replays should always hit\n    at dcache.scala:651 assert(!(s2_type === t_replay && !s2_hit(0)), \"Replays should always hit\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & _s2_hit_T_15 & ~s2_hit_0) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Writeback should always see data hit\n    at dcache.scala:652 assert(!(s2_type === t_wb && !s2_hit(0)), \"Writeback should always see data hit\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & debug_sc_fail_cnt > 8'h63) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: L1DCache failed too many SCs in a row\n    at dcache.scala:703 assert(debug_sc_fail_cnt < 100.U, \"L1DCache failed too many SCs in a row\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & s2_send_resp_0 & s2_send_nack_0) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at dcache.scala:737 assert(!(s2_send_resp(w) && s2_send_nack(w)))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & s2_send_resp_1 & s2_send_nack_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at dcache.scala:737 assert(!(s2_send_resp(w) && s2_send_nack(w)))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & _mshrs_io_req_0_valid_T_74 & ~(|s2_type)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Replays should not need to go back into MSHRs\n    at dcache.scala:758 assert(!(mshrs.io.req(w).valid && s2_type === t_replay), \"Replays should not need to go back into MSHRs\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & _mshrs_io_req_1_valid_T_74 & ~(|s2_type)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Replays should not need to go back into MSHRs\n    at dcache.scala:758 assert(!(mshrs.io.req(w).valid && s2_type === t_replay), \"Replays should not need to go back into MSHRs\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~_wb_io_release_valid | ~winner_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~_nodeOut_c_valid_T | _wb_io_release_valid | winner_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & _io_lsu_nack_0_valid_output & _GEN) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at dcache.scala:866 assert(!(io.lsu.nack(w).valid && s2_type =/= t_lsu))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & _io_lsu_nack_1_valid_output & _GEN) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at dcache.scala:866 assert(!(io.lsu.nack(w).valid && s2_type =/= t_lsu))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & _s2_nack_victim_T_2 & (_mshrs_io_req_1_valid_T_50 | _mshrs_io_req_1_valid_T_51 | _mshrs_io_req_1_valid_T_53 | _mshrs_io_req_1_valid_T_55 | _mshrs_io_req_1_valid_T_56 | _mshrs_io_req_1_valid_T_57 | _mshrs_io_req_1_valid_T_58 | _mshrs_io_req_1_valid_T_62 | _mshrs_io_req_1_valid_T_63 | _mshrs_io_req_1_valid_T_64 | _mshrs_io_req_1_valid_T_65 | _mshrs_io_req_1_valid_T_66) & ~s2_sc_fail & ~(s2_send_nack_1 & s2_nack_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Store must go through 0th pipe in L1D\n    at dcache.scala:874 assert(!(s2_valid(w) && s2_hit(w) && isWrite(s2_req(w).uop.mem_cmd) &&\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg  [39:0]  s4_req_addr;
  reg  [63:0]  s4_req_data;
  reg          s4_valid;
  reg  [39:0]  s5_req_addr;
  reg  [63:0]  s5_req_data;
  reg          s5_valid;
  assign s2_data_word_0 = s3_valid & s2_req_0_addr[39:3] == s3_req_addr[39:3] ? s3_req_data : s4_valid & s2_req_0_addr[39:3] == s4_req_addr[39:3] ? s4_req_data : s5_valid & s2_req_0_addr[39:3] == s5_req_addr[39:3] ? s5_req_data : s2_data_word_prebypass_0[63:0];
  assign s2_data_word_1 = s3_valid & s2_req_1_addr[39:3] == s3_req_addr[39:3] ? s3_req_data : s4_valid & s2_req_1_addr[39:3] == s4_req_addr[39:3] ? s4_req_data : s5_valid & s2_req_1_addr[39:3] == s5_req_addr[39:3] ? s5_req_data : s2_data_word_prebypass_1[63:0];
  wire [1:0]   _amoalu_io_mask_T = {s2_req_0_addr[0] | (|size), ~(s2_req_0_addr[0])};
  wire [3:0]   _amoalu_io_mask_T_1 = {(s2_req_0_addr[1] ? _amoalu_io_mask_T : 2'h0) | {2{size[1]}}, s2_req_0_addr[1] ? 2'h0 : _amoalu_io_mask_T};
  reg  [7:0]   s3_way;
  wire         _GEN_0 = s2_req_0_addr == debug_sc_fail_addr;
  wire         wb_fire = _wb_fire_T & _wb_fire_T_1;
  wire         prober_fire = _metaReadArb_io_in_1_ready & _prober_io_meta_read_valid;
  wire         prefetch_fire = _metaReadArb_io_in_5_ready & _mshrs_io_prefetch_valid;
  wire         _s1_valid_T_19 = _io_lsu_req_ready_output & io_lsu_req_valid;
  wire         _s0_send_resp_or_nack_T_1 = _metaReadArb_io_in_0_ready & _mshrs_io_replay_valid;
  wire         _s0_type_T_1 = _metaReadArb_io_in_3_ready & _mshrs_io_meta_read_valid;
  wire         _GEN_1 = wb_fire | prober_fire;
  wire         _GEN_2 = _GEN_1 | prefetch_fire | _s0_type_T_1;
  wire [19:0]  s0_req_0_uop_br_mask = _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_br_mask : _GEN_2 ? 20'h0 : _mshrs_io_replay_bits_uop_br_mask;
  wire         s0_req_0_uop_uses_ldq = _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_uses_ldq : ~_GEN_2 & _mshrs_io_replay_bits_uop_uses_ldq;
  wire         s0_req_0_uop_uses_stq = _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_uses_stq : ~_GEN_2 & _mshrs_io_replay_bits_uop_uses_stq;
  wire [19:0]  s0_req_1_uop_br_mask = _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_br_mask : 20'h0;
  wire         s0_req_1_uop_uses_ldq = _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_uses_ldq;
  wire         s0_req_1_uop_uses_stq = _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_uses_stq;
  wire         _s2_nack_hit_WIRE_0 = s1_req_0_addr[11:6] == _prober_io_meta_write_bits_idx & ~_prober_io_req_ready;
  wire         _s1_tag_match_way_T_31 = s1_type == 3'h0;
  wire         _s1_tag_match_way_T_32 = s1_type == 3'h2;
  wire         _s1_tag_match_way_T_33 = s1_type == 3'h3;
  wire         _s2_valid_T_23 = s1_type == 3'h4;
  wire         s2_lr = _mshrs_io_req_0_valid_T_26 & (~s2_lr_REG | ~(|s2_type));
  wire         _GEN_3 = s2_valid_REG & (_mshrs_io_req_1_valid_T_10 & s2_hit_0 & ~s2_nack_0 | ~(|s2_type) & s2_req_0_uop_mem_cmd != 5'h5);
  always @(posedge clock) begin
    s1_req_0_uop_uopc <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_uopc : _GEN_2 ? 7'h0 : _mshrs_io_replay_bits_uop_uopc;
    s1_req_0_uop_inst <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_inst : _GEN_2 ? 32'h0 : _mshrs_io_replay_bits_uop_inst;
    s1_req_0_uop_debug_inst <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_debug_inst : _GEN_2 ? 32'h0 : _mshrs_io_replay_bits_uop_debug_inst;
    s1_req_0_uop_is_rvc <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_is_rvc : ~_GEN_2 & _mshrs_io_replay_bits_uop_is_rvc;
    s1_req_0_uop_debug_pc <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_debug_pc : _GEN_2 ? 40'h0 : _mshrs_io_replay_bits_uop_debug_pc;
    s1_req_0_uop_iq_type <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_iq_type : _GEN_2 ? 3'h0 : _mshrs_io_replay_bits_uop_iq_type;
    s1_req_0_uop_fu_code <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_fu_code : _GEN_2 ? 10'h0 : _mshrs_io_replay_bits_uop_fu_code;
    s1_req_0_uop_ctrl_br_type <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ctrl_br_type : _GEN_2 ? 4'h0 : _mshrs_io_replay_bits_uop_ctrl_br_type;
    s1_req_0_uop_ctrl_op1_sel <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ctrl_op1_sel : _GEN_2 ? 2'h0 : _mshrs_io_replay_bits_uop_ctrl_op1_sel;
    s1_req_0_uop_ctrl_op2_sel <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ctrl_op2_sel : _GEN_2 ? 3'h0 : _mshrs_io_replay_bits_uop_ctrl_op2_sel;
    s1_req_0_uop_ctrl_imm_sel <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ctrl_imm_sel : _GEN_2 ? 3'h0 : _mshrs_io_replay_bits_uop_ctrl_imm_sel;
    s1_req_0_uop_ctrl_op_fcn <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ctrl_op_fcn : _GEN_2 ? 4'h0 : _mshrs_io_replay_bits_uop_ctrl_op_fcn;
    s1_req_0_uop_ctrl_fcn_dw <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ctrl_fcn_dw : ~_GEN_2 & _mshrs_io_replay_bits_uop_ctrl_fcn_dw;
    s1_req_0_uop_ctrl_csr_cmd <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ctrl_csr_cmd : _GEN_2 ? 3'h0 : _mshrs_io_replay_bits_uop_ctrl_csr_cmd;
    s1_req_0_uop_ctrl_is_load <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ctrl_is_load : ~_GEN_2 & _mshrs_io_replay_bits_uop_ctrl_is_load;
    s1_req_0_uop_ctrl_is_sta <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ctrl_is_sta : ~_GEN_2 & _mshrs_io_replay_bits_uop_ctrl_is_sta;
    s1_req_0_uop_ctrl_is_std <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ctrl_is_std : ~_GEN_2 & _mshrs_io_replay_bits_uop_ctrl_is_std;
    s1_req_0_uop_iw_state <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_iw_state : _GEN_2 ? 2'h0 : _mshrs_io_replay_bits_uop_iw_state;
    s1_req_0_uop_iw_p1_poisoned <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_iw_p1_poisoned : ~_GEN_2 & _mshrs_io_replay_bits_uop_iw_p1_poisoned;
    s1_req_0_uop_iw_p2_poisoned <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_iw_p2_poisoned : ~_GEN_2 & _mshrs_io_replay_bits_uop_iw_p2_poisoned;
    s1_req_0_uop_is_br <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_is_br : ~_GEN_2 & _mshrs_io_replay_bits_uop_is_br;
    s1_req_0_uop_is_jalr <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_is_jalr : ~_GEN_2 & _mshrs_io_replay_bits_uop_is_jalr;
    s1_req_0_uop_is_jal <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_is_jal : ~_GEN_2 & _mshrs_io_replay_bits_uop_is_jal;
    s1_req_0_uop_is_sfb <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_is_sfb : ~_GEN_2 & _mshrs_io_replay_bits_uop_is_sfb;
    s1_req_0_uop_br_mask <= s0_req_0_uop_br_mask & ~io_lsu_brupdate_b1_resolve_mask;
    s1_req_0_uop_br_tag <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_br_tag : _GEN_2 ? 5'h0 : _mshrs_io_replay_bits_uop_br_tag;
    s1_req_0_uop_ftq_idx <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ftq_idx : _GEN_2 ? 6'h0 : _mshrs_io_replay_bits_uop_ftq_idx;
    s1_req_0_uop_edge_inst <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_edge_inst : ~_GEN_2 & _mshrs_io_replay_bits_uop_edge_inst;
    s1_req_0_uop_pc_lob <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_pc_lob : _GEN_2 ? 6'h0 : _mshrs_io_replay_bits_uop_pc_lob;
    s1_req_0_uop_taken <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_taken : ~_GEN_2 & _mshrs_io_replay_bits_uop_taken;
    s1_req_0_uop_imm_packed <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_imm_packed : _GEN_2 ? 20'h0 : _mshrs_io_replay_bits_uop_imm_packed;
    s1_req_0_uop_csr_addr <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_csr_addr : _GEN_2 ? 12'h0 : _mshrs_io_replay_bits_uop_csr_addr;
    s1_req_0_uop_rob_idx <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_rob_idx : _GEN_2 ? 7'h0 : _mshrs_io_replay_bits_uop_rob_idx;
    s1_req_0_uop_ldq_idx <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ldq_idx : _GEN_2 ? 5'h0 : _mshrs_io_replay_bits_uop_ldq_idx;
    s1_req_0_uop_stq_idx <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_stq_idx : _GEN_2 ? 5'h0 : _mshrs_io_replay_bits_uop_stq_idx;
    s1_req_0_uop_rxq_idx <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_rxq_idx : _GEN_2 ? 2'h0 : _mshrs_io_replay_bits_uop_rxq_idx;
    s1_req_0_uop_pdst <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_pdst : _GEN_2 ? 7'h0 : _mshrs_io_replay_bits_uop_pdst;
    s1_req_0_uop_prs1 <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_prs1 : _GEN_2 ? 7'h0 : _mshrs_io_replay_bits_uop_prs1;
    s1_req_0_uop_prs2 <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_prs2 : _GEN_2 ? 7'h0 : _mshrs_io_replay_bits_uop_prs2;
    s1_req_0_uop_prs3 <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_prs3 : _GEN_2 ? 7'h0 : _mshrs_io_replay_bits_uop_prs3;
    s1_req_0_uop_ppred <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ppred : _GEN_2 ? 6'h0 : _mshrs_io_replay_bits_uop_ppred;
    s1_req_0_uop_prs1_busy <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_prs1_busy : ~_GEN_2 & _mshrs_io_replay_bits_uop_prs1_busy;
    s1_req_0_uop_prs2_busy <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_prs2_busy : ~_GEN_2 & _mshrs_io_replay_bits_uop_prs2_busy;
    s1_req_0_uop_prs3_busy <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_prs3_busy : ~_GEN_2 & _mshrs_io_replay_bits_uop_prs3_busy;
    s1_req_0_uop_ppred_busy <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ppred_busy : ~_GEN_2 & _mshrs_io_replay_bits_uop_ppred_busy;
    s1_req_0_uop_stale_pdst <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_stale_pdst : _GEN_2 ? 7'h0 : _mshrs_io_replay_bits_uop_stale_pdst;
    s1_req_0_uop_exception <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_exception : ~_GEN_2 & _mshrs_io_replay_bits_uop_exception;
    s1_req_0_uop_exc_cause <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_exc_cause : _GEN_2 ? 64'h0 : _mshrs_io_replay_bits_uop_exc_cause;
    s1_req_0_uop_bypassable <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_bypassable : ~_GEN_2 & _mshrs_io_replay_bits_uop_bypassable;
    s1_req_0_uop_mem_cmd <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_mem_cmd : _GEN_1 ? 5'h0 : prefetch_fire ? _mshrs_io_prefetch_bits_uop_mem_cmd : _s0_type_T_1 ? 5'h0 : _mshrs_io_replay_bits_uop_mem_cmd;
    s1_req_0_uop_mem_size <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_mem_size : _GEN_2 ? 2'h0 : _mshrs_io_replay_bits_uop_mem_size;
    s1_req_0_uop_mem_signed <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_mem_signed : ~_GEN_2 & _mshrs_io_replay_bits_uop_mem_signed;
    s1_req_0_uop_is_fence <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_is_fence : ~_GEN_2 & _mshrs_io_replay_bits_uop_is_fence;
    s1_req_0_uop_is_fencei <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_is_fencei : ~_GEN_2 & _mshrs_io_replay_bits_uop_is_fencei;
    s1_req_0_uop_is_amo <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_is_amo : ~_GEN_2 & _mshrs_io_replay_bits_uop_is_amo;
    s1_req_0_uop_uses_ldq <= s0_req_0_uop_uses_ldq;
    s1_req_0_uop_uses_stq <= s0_req_0_uop_uses_stq;
    s1_req_0_uop_is_sys_pc2epc <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_is_sys_pc2epc : ~_GEN_2 & _mshrs_io_replay_bits_uop_is_sys_pc2epc;
    s1_req_0_uop_is_unique <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_is_unique : ~_GEN_2 & _mshrs_io_replay_bits_uop_is_unique;
    s1_req_0_uop_flush_on_commit <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_flush_on_commit : ~_GEN_2 & _mshrs_io_replay_bits_uop_flush_on_commit;
    s1_req_0_uop_ldst_is_rs1 <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ldst_is_rs1 : ~_GEN_2 & _mshrs_io_replay_bits_uop_ldst_is_rs1;
    s1_req_0_uop_ldst <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ldst : _GEN_2 ? 6'h0 : _mshrs_io_replay_bits_uop_ldst;
    s1_req_0_uop_lrs1 <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_lrs1 : _GEN_2 ? 6'h0 : _mshrs_io_replay_bits_uop_lrs1;
    s1_req_0_uop_lrs2 <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_lrs2 : _GEN_2 ? 6'h0 : _mshrs_io_replay_bits_uop_lrs2;
    s1_req_0_uop_lrs3 <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_lrs3 : _GEN_2 ? 6'h0 : _mshrs_io_replay_bits_uop_lrs3;
    s1_req_0_uop_ldst_val <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_ldst_val : ~_GEN_2 & _mshrs_io_replay_bits_uop_ldst_val;
    s1_req_0_uop_dst_rtype <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_dst_rtype : _GEN_2 ? 2'h2 : _mshrs_io_replay_bits_uop_dst_rtype;
    s1_req_0_uop_lrs1_rtype <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_lrs1_rtype : _GEN_2 ? 2'h0 : _mshrs_io_replay_bits_uop_lrs1_rtype;
    s1_req_0_uop_lrs2_rtype <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_lrs2_rtype : _GEN_2 ? 2'h0 : _mshrs_io_replay_bits_uop_lrs2_rtype;
    s1_req_0_uop_frs3_en <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_frs3_en : ~_GEN_2 & _mshrs_io_replay_bits_uop_frs3_en;
    s1_req_0_uop_fp_val <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_fp_val : ~_GEN_2 & _mshrs_io_replay_bits_uop_fp_val;
    s1_req_0_uop_fp_single <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_fp_single : ~_GEN_2 & _mshrs_io_replay_bits_uop_fp_single;
    s1_req_0_uop_xcpt_pf_if <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_xcpt_pf_if : ~_GEN_2 & _mshrs_io_replay_bits_uop_xcpt_pf_if;
    s1_req_0_uop_xcpt_ae_if <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_xcpt_ae_if : ~_GEN_2 & _mshrs_io_replay_bits_uop_xcpt_ae_if;
    s1_req_0_uop_xcpt_ma_if <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_xcpt_ma_if : ~_GEN_2 & _mshrs_io_replay_bits_uop_xcpt_ma_if;
    s1_req_0_uop_bp_debug_if <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_bp_debug_if : ~_GEN_2 & _mshrs_io_replay_bits_uop_bp_debug_if;
    s1_req_0_uop_bp_xcpt_if <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_bp_xcpt_if : ~_GEN_2 & _mshrs_io_replay_bits_uop_bp_xcpt_if;
    s1_req_0_uop_debug_fsrc <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_debug_fsrc : _GEN_2 ? 2'h0 : _mshrs_io_replay_bits_uop_debug_fsrc;
    s1_req_0_uop_debug_tsrc <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_uop_debug_tsrc : _GEN_2 ? 2'h0 : _mshrs_io_replay_bits_uop_debug_tsrc;
    s1_req_0_addr <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_addr : wb_fire ? {7'h0, _wb_io_meta_read_bits_tag, _wb_io_data_req_bits_addr} : prober_fire ? {7'h0, _prober_io_meta_read_bits_tag, _prober_io_meta_read_bits_idx, 6'h0} : prefetch_fire ? _mshrs_io_prefetch_bits_addr : _s0_type_T_1 ? {7'h0, _mshrs_io_meta_read_bits_tag, _mshrs_io_meta_read_bits_idx, 6'h0} : _mshrs_io_replay_bits_addr;
    s1_req_0_data <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_data : _GEN_2 ? 64'h0 : _mshrs_io_replay_bits_data;
    s1_req_0_is_hella <= _s1_valid_T_19 ? io_lsu_req_bits_0_bits_is_hella : ~_GEN_2 & _mshrs_io_replay_bits_is_hella;
    s1_req_1_uop_uopc <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_uopc : 7'h0;
    s1_req_1_uop_inst <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_inst : 32'h0;
    s1_req_1_uop_debug_inst <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_debug_inst : 32'h0;
    s1_req_1_uop_is_rvc <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_is_rvc;
    s1_req_1_uop_debug_pc <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_debug_pc : 40'h0;
    s1_req_1_uop_iq_type <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_iq_type : 3'h0;
    s1_req_1_uop_fu_code <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_fu_code : 10'h0;
    s1_req_1_uop_ctrl_br_type <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_ctrl_br_type : 4'h0;
    s1_req_1_uop_ctrl_op1_sel <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_ctrl_op1_sel : 2'h0;
    s1_req_1_uop_ctrl_op2_sel <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_ctrl_op2_sel : 3'h0;
    s1_req_1_uop_ctrl_imm_sel <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_ctrl_imm_sel : 3'h0;
    s1_req_1_uop_ctrl_op_fcn <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_ctrl_op_fcn : 4'h0;
    s1_req_1_uop_ctrl_fcn_dw <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_ctrl_fcn_dw;
    s1_req_1_uop_ctrl_csr_cmd <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_ctrl_csr_cmd : 3'h0;
    s1_req_1_uop_ctrl_is_load <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_ctrl_is_load;
    s1_req_1_uop_ctrl_is_sta <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_ctrl_is_sta;
    s1_req_1_uop_ctrl_is_std <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_ctrl_is_std;
    s1_req_1_uop_iw_state <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_iw_state : 2'h0;
    s1_req_1_uop_iw_p1_poisoned <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_iw_p1_poisoned;
    s1_req_1_uop_iw_p2_poisoned <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_iw_p2_poisoned;
    s1_req_1_uop_is_br <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_is_br;
    s1_req_1_uop_is_jalr <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_is_jalr;
    s1_req_1_uop_is_jal <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_is_jal;
    s1_req_1_uop_is_sfb <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_is_sfb;
    s1_req_1_uop_br_mask <= s0_req_1_uop_br_mask & ~io_lsu_brupdate_b1_resolve_mask;
    s1_req_1_uop_br_tag <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_br_tag : 5'h0;
    s1_req_1_uop_ftq_idx <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_ftq_idx : 6'h0;
    s1_req_1_uop_edge_inst <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_edge_inst;
    s1_req_1_uop_pc_lob <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_pc_lob : 6'h0;
    s1_req_1_uop_taken <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_taken;
    s1_req_1_uop_imm_packed <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_imm_packed : 20'h0;
    s1_req_1_uop_csr_addr <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_csr_addr : 12'h0;
    s1_req_1_uop_rob_idx <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_rob_idx : 7'h0;
    s1_req_1_uop_ldq_idx <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_ldq_idx : 5'h0;
    s1_req_1_uop_stq_idx <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_stq_idx : 5'h0;
    s1_req_1_uop_rxq_idx <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_rxq_idx : 2'h0;
    s1_req_1_uop_pdst <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_pdst : 7'h0;
    s1_req_1_uop_prs1 <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_prs1 : 7'h0;
    s1_req_1_uop_prs2 <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_prs2 : 7'h0;
    s1_req_1_uop_prs3 <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_prs3 : 7'h0;
    s1_req_1_uop_ppred <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_ppred : 6'h0;
    s1_req_1_uop_prs1_busy <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_prs1_busy;
    s1_req_1_uop_prs2_busy <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_prs2_busy;
    s1_req_1_uop_prs3_busy <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_prs3_busy;
    s1_req_1_uop_ppred_busy <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_ppred_busy;
    s1_req_1_uop_stale_pdst <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_stale_pdst : 7'h0;
    s1_req_1_uop_exception <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_exception;
    s1_req_1_uop_exc_cause <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_exc_cause : 64'h0;
    s1_req_1_uop_bypassable <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_bypassable;
    s1_req_1_uop_mem_cmd <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_mem_cmd : 5'h0;
    s1_req_1_uop_mem_size <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_mem_size : 2'h0;
    s1_req_1_uop_mem_signed <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_mem_signed;
    s1_req_1_uop_is_fence <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_is_fence;
    s1_req_1_uop_is_fencei <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_is_fencei;
    s1_req_1_uop_is_amo <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_is_amo;
    s1_req_1_uop_uses_ldq <= s0_req_1_uop_uses_ldq;
    s1_req_1_uop_uses_stq <= s0_req_1_uop_uses_stq;
    s1_req_1_uop_is_sys_pc2epc <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_is_sys_pc2epc;
    s1_req_1_uop_is_unique <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_is_unique;
    s1_req_1_uop_flush_on_commit <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_flush_on_commit;
    s1_req_1_uop_ldst_is_rs1 <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_ldst_is_rs1;
    s1_req_1_uop_ldst <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_ldst : 6'h0;
    s1_req_1_uop_lrs1 <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_lrs1 : 6'h0;
    s1_req_1_uop_lrs2 <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_lrs2 : 6'h0;
    s1_req_1_uop_lrs3 <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_lrs3 : 6'h0;
    s1_req_1_uop_ldst_val <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_ldst_val;
    s1_req_1_uop_dst_rtype <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_dst_rtype : 2'h0;
    s1_req_1_uop_lrs1_rtype <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_lrs1_rtype : 2'h0;
    s1_req_1_uop_lrs2_rtype <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_lrs2_rtype : 2'h0;
    s1_req_1_uop_frs3_en <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_frs3_en;
    s1_req_1_uop_fp_val <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_fp_val;
    s1_req_1_uop_fp_single <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_fp_single;
    s1_req_1_uop_xcpt_pf_if <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_xcpt_pf_if;
    s1_req_1_uop_xcpt_ae_if <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_xcpt_ae_if;
    s1_req_1_uop_xcpt_ma_if <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_xcpt_ma_if;
    s1_req_1_uop_bp_debug_if <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_bp_debug_if;
    s1_req_1_uop_bp_xcpt_if <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_uop_bp_xcpt_if;
    s1_req_1_uop_debug_fsrc <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_debug_fsrc : 2'h0;
    s1_req_1_uop_debug_tsrc <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_uop_debug_tsrc : 2'h0;
    s1_req_1_addr <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_addr : 40'h0;
    s1_req_1_data <= _s1_valid_T_19 ? io_lsu_req_bits_1_bits_data : 64'h0;
    s1_req_1_is_hella <= _s1_valid_T_19 & io_lsu_req_bits_1_bits_is_hella;
    REG <= _s1_valid_T_19;
    REG_1 <= io_lsu_req_bits_0_valid;
    REG_2 <= _s1_valid_T_19;
    REG_3 <= io_lsu_req_bits_1_valid;
    s1_send_resp_or_nack_0 <= _s1_valid_T_19 ? io_lsu_req_bits_0_valid : _s0_send_resp_or_nack_T_1 & (_mshrs_io_replay_bits_uop_mem_cmd == 5'h0 | _mshrs_io_replay_bits_uop_mem_cmd == 5'h10 | _mshrs_io_replay_bits_uop_mem_cmd == 5'h6 | _mshrs_io_replay_bits_uop_mem_cmd == 5'h7 | _mshrs_io_replay_bits_uop_mem_cmd == 5'h4 | _mshrs_io_replay_bits_uop_mem_cmd == 5'h9 | _mshrs_io_replay_bits_uop_mem_cmd == 5'hA | _mshrs_io_replay_bits_uop_mem_cmd == 5'hB | _mshrs_io_replay_bits_uop_mem_cmd == 5'h8 | _mshrs_io_replay_bits_uop_mem_cmd == 5'hC | _mshrs_io_replay_bits_uop_mem_cmd == 5'hD | _mshrs_io_replay_bits_uop_mem_cmd == 5'hE | _mshrs_io_replay_bits_uop_mem_cmd == 5'hF);
    s1_send_resp_or_nack_1 <= _s1_valid_T_19 & io_lsu_req_bits_1_valid;
    s1_type <= _s1_valid_T_19 ? 3'h4 : wb_fire ? 3'h2 : prober_fire ? 3'h1 : prefetch_fire ? 3'h5 : _s0_type_T_1 ? 3'h3 : 3'h0;
    s1_mshr_meta_read_way_en <= _mshrs_io_meta_read_bits_way_en;
    s1_replay_way_en <= _mshrs_io_replay_bits_way_en;
    s1_wb_way_en <= _wb_io_data_req_bits_way_en;
    s2_req_0_uop_uopc <= s1_req_0_uop_uopc;
    s2_req_0_uop_inst <= s1_req_0_uop_inst;
    s2_req_0_uop_debug_inst <= s1_req_0_uop_debug_inst;
    s2_req_0_uop_is_rvc <= s1_req_0_uop_is_rvc;
    s2_req_0_uop_debug_pc <= s1_req_0_uop_debug_pc;
    s2_req_0_uop_iq_type <= s1_req_0_uop_iq_type;
    s2_req_0_uop_fu_code <= s1_req_0_uop_fu_code;
    s2_req_0_uop_ctrl_br_type <= s1_req_0_uop_ctrl_br_type;
    s2_req_0_uop_ctrl_op1_sel <= s1_req_0_uop_ctrl_op1_sel;
    s2_req_0_uop_ctrl_op2_sel <= s1_req_0_uop_ctrl_op2_sel;
    s2_req_0_uop_ctrl_imm_sel <= s1_req_0_uop_ctrl_imm_sel;
    s2_req_0_uop_ctrl_op_fcn <= s1_req_0_uop_ctrl_op_fcn;
    s2_req_0_uop_ctrl_fcn_dw <= s1_req_0_uop_ctrl_fcn_dw;
    s2_req_0_uop_ctrl_csr_cmd <= s1_req_0_uop_ctrl_csr_cmd;
    s2_req_0_uop_ctrl_is_load <= s1_req_0_uop_ctrl_is_load;
    s2_req_0_uop_ctrl_is_sta <= s1_req_0_uop_ctrl_is_sta;
    s2_req_0_uop_ctrl_is_std <= s1_req_0_uop_ctrl_is_std;
    s2_req_0_uop_iw_state <= s1_req_0_uop_iw_state;
    s2_req_0_uop_iw_p1_poisoned <= s1_req_0_uop_iw_p1_poisoned;
    s2_req_0_uop_iw_p2_poisoned <= s1_req_0_uop_iw_p2_poisoned;
    s2_req_0_uop_is_br <= s1_req_0_uop_is_br;
    s2_req_0_uop_is_jalr <= s1_req_0_uop_is_jalr;
    s2_req_0_uop_is_jal <= s1_req_0_uop_is_jal;
    s2_req_0_uop_is_sfb <= s1_req_0_uop_is_sfb;
    s2_req_0_uop_br_mask <= s1_req_0_uop_br_mask & ~io_lsu_brupdate_b1_resolve_mask;
    s2_req_0_uop_br_tag <= s1_req_0_uop_br_tag;
    s2_req_0_uop_ftq_idx <= s1_req_0_uop_ftq_idx;
    s2_req_0_uop_edge_inst <= s1_req_0_uop_edge_inst;
    s2_req_0_uop_pc_lob <= s1_req_0_uop_pc_lob;
    s2_req_0_uop_taken <= s1_req_0_uop_taken;
    s2_req_0_uop_imm_packed <= s1_req_0_uop_imm_packed;
    s2_req_0_uop_csr_addr <= s1_req_0_uop_csr_addr;
    s2_req_0_uop_rob_idx <= s1_req_0_uop_rob_idx;
    s2_req_0_uop_ldq_idx <= s1_req_0_uop_ldq_idx;
    s2_req_0_uop_stq_idx <= s1_req_0_uop_stq_idx;
    s2_req_0_uop_rxq_idx <= s1_req_0_uop_rxq_idx;
    s2_req_0_uop_pdst <= s1_req_0_uop_pdst;
    s2_req_0_uop_prs1 <= s1_req_0_uop_prs1;
    s2_req_0_uop_prs2 <= s1_req_0_uop_prs2;
    s2_req_0_uop_prs3 <= s1_req_0_uop_prs3;
    s2_req_0_uop_ppred <= s1_req_0_uop_ppred;
    s2_req_0_uop_prs1_busy <= s1_req_0_uop_prs1_busy;
    s2_req_0_uop_prs2_busy <= s1_req_0_uop_prs2_busy;
    s2_req_0_uop_prs3_busy <= s1_req_0_uop_prs3_busy;
    s2_req_0_uop_ppred_busy <= s1_req_0_uop_ppred_busy;
    s2_req_0_uop_stale_pdst <= s1_req_0_uop_stale_pdst;
    s2_req_0_uop_exception <= s1_req_0_uop_exception;
    s2_req_0_uop_exc_cause <= s1_req_0_uop_exc_cause;
    s2_req_0_uop_bypassable <= s1_req_0_uop_bypassable;
    s2_req_0_uop_mem_cmd <= s1_req_0_uop_mem_cmd;
    size <= s1_req_0_uop_mem_size;
    s2_req_0_uop_mem_signed <= s1_req_0_uop_mem_signed;
    s2_req_0_uop_is_fence <= s1_req_0_uop_is_fence;
    s2_req_0_uop_is_fencei <= s1_req_0_uop_is_fencei;
    s2_req_0_uop_is_amo <= s1_req_0_uop_is_amo;
    s2_req_0_uop_uses_ldq <= s1_req_0_uop_uses_ldq;
    s2_req_0_uop_uses_stq <= s1_req_0_uop_uses_stq;
    s2_req_0_uop_is_sys_pc2epc <= s1_req_0_uop_is_sys_pc2epc;
    s2_req_0_uop_is_unique <= s1_req_0_uop_is_unique;
    s2_req_0_uop_flush_on_commit <= s1_req_0_uop_flush_on_commit;
    s2_req_0_uop_ldst_is_rs1 <= s1_req_0_uop_ldst_is_rs1;
    s2_req_0_uop_ldst <= s1_req_0_uop_ldst;
    s2_req_0_uop_lrs1 <= s1_req_0_uop_lrs1;
    s2_req_0_uop_lrs2 <= s1_req_0_uop_lrs2;
    s2_req_0_uop_lrs3 <= s1_req_0_uop_lrs3;
    s2_req_0_uop_ldst_val <= s1_req_0_uop_ldst_val;
    s2_req_0_uop_dst_rtype <= s1_req_0_uop_dst_rtype;
    s2_req_0_uop_lrs1_rtype <= s1_req_0_uop_lrs1_rtype;
    s2_req_0_uop_lrs2_rtype <= s1_req_0_uop_lrs2_rtype;
    s2_req_0_uop_frs3_en <= s1_req_0_uop_frs3_en;
    s2_req_0_uop_fp_val <= s1_req_0_uop_fp_val;
    s2_req_0_uop_fp_single <= s1_req_0_uop_fp_single;
    s2_req_0_uop_xcpt_pf_if <= s1_req_0_uop_xcpt_pf_if;
    s2_req_0_uop_xcpt_ae_if <= s1_req_0_uop_xcpt_ae_if;
    s2_req_0_uop_xcpt_ma_if <= s1_req_0_uop_xcpt_ma_if;
    s2_req_0_uop_bp_debug_if <= s1_req_0_uop_bp_debug_if;
    s2_req_0_uop_bp_xcpt_if <= s1_req_0_uop_bp_xcpt_if;
    s2_req_0_uop_debug_fsrc <= s1_req_0_uop_debug_fsrc;
    s2_req_0_uop_debug_tsrc <= s1_req_0_uop_debug_tsrc;
    s2_req_0_addr <= s1_req_0_addr;
    s2_req_0_data <= s1_req_0_data;
    s2_req_0_is_hella <= s1_req_0_is_hella;
    s2_req_1_uop_uopc <= s1_req_1_uop_uopc;
    s2_req_1_uop_inst <= s1_req_1_uop_inst;
    s2_req_1_uop_debug_inst <= s1_req_1_uop_debug_inst;
    s2_req_1_uop_is_rvc <= s1_req_1_uop_is_rvc;
    s2_req_1_uop_debug_pc <= s1_req_1_uop_debug_pc;
    s2_req_1_uop_iq_type <= s1_req_1_uop_iq_type;
    s2_req_1_uop_fu_code <= s1_req_1_uop_fu_code;
    s2_req_1_uop_ctrl_br_type <= s1_req_1_uop_ctrl_br_type;
    s2_req_1_uop_ctrl_op1_sel <= s1_req_1_uop_ctrl_op1_sel;
    s2_req_1_uop_ctrl_op2_sel <= s1_req_1_uop_ctrl_op2_sel;
    s2_req_1_uop_ctrl_imm_sel <= s1_req_1_uop_ctrl_imm_sel;
    s2_req_1_uop_ctrl_op_fcn <= s1_req_1_uop_ctrl_op_fcn;
    s2_req_1_uop_ctrl_fcn_dw <= s1_req_1_uop_ctrl_fcn_dw;
    s2_req_1_uop_ctrl_csr_cmd <= s1_req_1_uop_ctrl_csr_cmd;
    s2_req_1_uop_ctrl_is_load <= s1_req_1_uop_ctrl_is_load;
    s2_req_1_uop_ctrl_is_sta <= s1_req_1_uop_ctrl_is_sta;
    s2_req_1_uop_ctrl_is_std <= s1_req_1_uop_ctrl_is_std;
    s2_req_1_uop_iw_state <= s1_req_1_uop_iw_state;
    s2_req_1_uop_iw_p1_poisoned <= s1_req_1_uop_iw_p1_poisoned;
    s2_req_1_uop_iw_p2_poisoned <= s1_req_1_uop_iw_p2_poisoned;
    s2_req_1_uop_is_br <= s1_req_1_uop_is_br;
    s2_req_1_uop_is_jalr <= s1_req_1_uop_is_jalr;
    s2_req_1_uop_is_jal <= s1_req_1_uop_is_jal;
    s2_req_1_uop_is_sfb <= s1_req_1_uop_is_sfb;
    s2_req_1_uop_br_mask <= s1_req_1_uop_br_mask & ~io_lsu_brupdate_b1_resolve_mask;
    s2_req_1_uop_br_tag <= s1_req_1_uop_br_tag;
    s2_req_1_uop_ftq_idx <= s1_req_1_uop_ftq_idx;
    s2_req_1_uop_edge_inst <= s1_req_1_uop_edge_inst;
    s2_req_1_uop_pc_lob <= s1_req_1_uop_pc_lob;
    s2_req_1_uop_taken <= s1_req_1_uop_taken;
    s2_req_1_uop_imm_packed <= s1_req_1_uop_imm_packed;
    s2_req_1_uop_csr_addr <= s1_req_1_uop_csr_addr;
    s2_req_1_uop_rob_idx <= s1_req_1_uop_rob_idx;
    s2_req_1_uop_ldq_idx <= s1_req_1_uop_ldq_idx;
    s2_req_1_uop_stq_idx <= s1_req_1_uop_stq_idx;
    s2_req_1_uop_rxq_idx <= s1_req_1_uop_rxq_idx;
    s2_req_1_uop_pdst <= s1_req_1_uop_pdst;
    s2_req_1_uop_prs1 <= s1_req_1_uop_prs1;
    s2_req_1_uop_prs2 <= s1_req_1_uop_prs2;
    s2_req_1_uop_prs3 <= s1_req_1_uop_prs3;
    s2_req_1_uop_ppred <= s1_req_1_uop_ppred;
    s2_req_1_uop_prs1_busy <= s1_req_1_uop_prs1_busy;
    s2_req_1_uop_prs2_busy <= s1_req_1_uop_prs2_busy;
    s2_req_1_uop_prs3_busy <= s1_req_1_uop_prs3_busy;
    s2_req_1_uop_ppred_busy <= s1_req_1_uop_ppred_busy;
    s2_req_1_uop_stale_pdst <= s1_req_1_uop_stale_pdst;
    s2_req_1_uop_exception <= s1_req_1_uop_exception;
    s2_req_1_uop_exc_cause <= s1_req_1_uop_exc_cause;
    s2_req_1_uop_bypassable <= s1_req_1_uop_bypassable;
    s2_req_1_uop_mem_cmd <= s1_req_1_uop_mem_cmd;
    size_1 <= s1_req_1_uop_mem_size;
    s2_req_1_uop_mem_signed <= s1_req_1_uop_mem_signed;
    s2_req_1_uop_is_fence <= s1_req_1_uop_is_fence;
    s2_req_1_uop_is_fencei <= s1_req_1_uop_is_fencei;
    s2_req_1_uop_is_amo <= s1_req_1_uop_is_amo;
    s2_req_1_uop_uses_ldq <= s1_req_1_uop_uses_ldq;
    s2_req_1_uop_uses_stq <= s1_req_1_uop_uses_stq;
    s2_req_1_uop_is_sys_pc2epc <= s1_req_1_uop_is_sys_pc2epc;
    s2_req_1_uop_is_unique <= s1_req_1_uop_is_unique;
    s2_req_1_uop_flush_on_commit <= s1_req_1_uop_flush_on_commit;
    s2_req_1_uop_ldst_is_rs1 <= s1_req_1_uop_ldst_is_rs1;
    s2_req_1_uop_ldst <= s1_req_1_uop_ldst;
    s2_req_1_uop_lrs1 <= s1_req_1_uop_lrs1;
    s2_req_1_uop_lrs2 <= s1_req_1_uop_lrs2;
    s2_req_1_uop_lrs3 <= s1_req_1_uop_lrs3;
    s2_req_1_uop_ldst_val <= s1_req_1_uop_ldst_val;
    s2_req_1_uop_dst_rtype <= s1_req_1_uop_dst_rtype;
    s2_req_1_uop_lrs1_rtype <= s1_req_1_uop_lrs1_rtype;
    s2_req_1_uop_lrs2_rtype <= s1_req_1_uop_lrs2_rtype;
    s2_req_1_uop_frs3_en <= s1_req_1_uop_frs3_en;
    s2_req_1_uop_fp_val <= s1_req_1_uop_fp_val;
    s2_req_1_uop_fp_single <= s1_req_1_uop_fp_single;
    s2_req_1_uop_xcpt_pf_if <= s1_req_1_uop_xcpt_pf_if;
    s2_req_1_uop_xcpt_ae_if <= s1_req_1_uop_xcpt_ae_if;
    s2_req_1_uop_xcpt_ma_if <= s1_req_1_uop_xcpt_ma_if;
    s2_req_1_uop_bp_debug_if <= s1_req_1_uop_bp_debug_if;
    s2_req_1_uop_bp_xcpt_if <= s1_req_1_uop_bp_xcpt_if;
    s2_req_1_uop_debug_fsrc <= s1_req_1_uop_debug_fsrc;
    s2_req_1_uop_debug_tsrc <= s1_req_1_uop_debug_tsrc;
    s2_req_1_addr <= s1_req_1_addr;
    s2_req_1_data <= s1_req_1_data;
    s2_req_1_is_hella <= s1_req_1_is_hella;
    s2_type <= s1_type;
    s2_valid_REG <= s1_valid_REG & ~io_lsu_s1_kill_0 & (io_lsu_brupdate_b1_mispredict_mask & s1_req_0_uop_br_mask) == 20'h0 & ~(io_lsu_exception & s1_req_0_uop_uses_ldq) & ~(s2_store_failed & _s2_valid_T_23 & s1_req_0_uop_uses_stq);
    s2_valid_REG_1 <= s1_valid_REG_1 & ~io_lsu_s1_kill_1 & (io_lsu_brupdate_b1_mispredict_mask & s1_req_1_uop_br_mask) == 20'h0 & ~(io_lsu_exception & s1_req_1_uop_uses_ldq) & ~(s2_store_failed & _s2_valid_T_23 & s1_req_1_uop_uses_stq);
    s2_tag_match_way_0 <= _s1_tag_match_way_T_31 ? s1_replay_way_en : _s1_tag_match_way_T_32 ? s1_wb_way_en : _s1_tag_match_way_T_33 ? s1_mshr_meta_read_way_en : {{7'h0, _meta_0_io_resp_7_tag} == s1_req_0_addr[39:12] & (|_meta_0_io_resp_7_coh_state), {7'h0, _meta_0_io_resp_6_tag} == s1_req_0_addr[39:12] & (|_meta_0_io_resp_6_coh_state), {7'h0, _meta_0_io_resp_5_tag} == s1_req_0_addr[39:12] & (|_meta_0_io_resp_5_coh_state), {7'h0, _meta_0_io_resp_4_tag} == s1_req_0_addr[39:12] & (|_meta_0_io_resp_4_coh_state), {7'h0, _meta_0_io_resp_3_tag} == s1_req_0_addr[39:12] & (|_meta_0_io_resp_3_coh_state), {7'h0, _meta_0_io_resp_2_tag} == s1_req_0_addr[39:12] & (|_meta_0_io_resp_2_coh_state), {7'h0, _meta_0_io_resp_1_tag} == s1_req_0_addr[39:12] & (|_meta_0_io_resp_1_coh_state), {7'h0, _meta_0_io_resp_0_tag} == s1_req_0_addr[39:12] & (|_meta_0_io_resp_0_coh_state)};
    s2_tag_match_way_1 <= _s1_tag_match_way_T_31 ? s1_replay_way_en : _s1_tag_match_way_T_32 ? s1_wb_way_en : _s1_tag_match_way_T_33 ? s1_mshr_meta_read_way_en : {{7'h0, _meta_1_io_resp_7_tag} == s1_req_1_addr[39:12] & (|_meta_1_io_resp_7_coh_state), {7'h0, _meta_1_io_resp_6_tag} == s1_req_1_addr[39:12] & (|_meta_1_io_resp_6_coh_state), {7'h0, _meta_1_io_resp_5_tag} == s1_req_1_addr[39:12] & (|_meta_1_io_resp_5_coh_state), {7'h0, _meta_1_io_resp_4_tag} == s1_req_1_addr[39:12] & (|_meta_1_io_resp_4_coh_state), {7'h0, _meta_1_io_resp_3_tag} == s1_req_1_addr[39:12] & (|_meta_1_io_resp_3_coh_state), {7'h0, _meta_1_io_resp_2_tag} == s1_req_1_addr[39:12] & (|_meta_1_io_resp_2_coh_state), {7'h0, _meta_1_io_resp_1_tag} == s1_req_1_addr[39:12] & (|_meta_1_io_resp_1_coh_state), {7'h0, _meta_1_io_resp_0_tag} == s1_req_1_addr[39:12] & (|_meta_1_io_resp_0_coh_state)};
    s2_hit_state_REG_state <= _meta_0_io_resp_0_coh_state;
    s2_hit_state_REG_1_state <= _meta_0_io_resp_1_coh_state;
    s2_hit_state_REG_2_state <= _meta_0_io_resp_2_coh_state;
    s2_hit_state_REG_3_state <= _meta_0_io_resp_3_coh_state;
    s2_hit_state_REG_4_state <= _meta_0_io_resp_4_coh_state;
    s2_hit_state_REG_5_state <= _meta_0_io_resp_5_coh_state;
    s2_hit_state_REG_6_state <= _meta_0_io_resp_6_coh_state;
    s2_hit_state_REG_7_state <= _meta_0_io_resp_7_coh_state;
    s2_hit_state_REG_8_state <= _meta_1_io_resp_0_coh_state;
    s2_hit_state_REG_9_state <= _meta_1_io_resp_1_coh_state;
    s2_hit_state_REG_10_state <= _meta_1_io_resp_2_coh_state;
    s2_hit_state_REG_11_state <= _meta_1_io_resp_3_coh_state;
    s2_hit_state_REG_12_state <= _meta_1_io_resp_4_coh_state;
    s2_hit_state_REG_13_state <= _meta_1_io_resp_5_coh_state;
    s2_hit_state_REG_14_state <= _meta_1_io_resp_6_coh_state;
    s2_hit_state_REG_15_state <= _meta_1_io_resp_7_coh_state;
    s2_wb_idx_matches_0 <= s1_req_0_addr[11:6] == _wb_io_idx_bits & _wb_io_idx_valid;
    s2_wb_idx_matches_1 <= s1_req_1_addr[11:6] == _wb_io_idx_bits & _wb_io_idx_valid;
    if (_GEN_3 & s2_lr)
      lrsc_addr <= s2_req_0_addr[39:6];
    s2_lr_REG <= _s2_nack_hit_WIRE_0;
    s2_sc_REG <= _s2_nack_hit_WIRE_0;
    s2_replaced_way_en_REG <= {_lfsr_prng_io_out_2, _lfsr_prng_io_out_1, _lfsr_prng_io_out_0};
    s2_repl_meta_REG_coh_state <= _meta_0_io_resp_0_coh_state;
    s2_repl_meta_REG_tag <= _meta_0_io_resp_0_tag;
    s2_repl_meta_REG_1_coh_state <= _meta_0_io_resp_1_coh_state;
    s2_repl_meta_REG_1_tag <= _meta_0_io_resp_1_tag;
    s2_repl_meta_REG_2_coh_state <= _meta_0_io_resp_2_coh_state;
    s2_repl_meta_REG_2_tag <= _meta_0_io_resp_2_tag;
    s2_repl_meta_REG_3_coh_state <= _meta_0_io_resp_3_coh_state;
    s2_repl_meta_REG_3_tag <= _meta_0_io_resp_3_tag;
    s2_repl_meta_REG_4_coh_state <= _meta_0_io_resp_4_coh_state;
    s2_repl_meta_REG_4_tag <= _meta_0_io_resp_4_tag;
    s2_repl_meta_REG_5_coh_state <= _meta_0_io_resp_5_coh_state;
    s2_repl_meta_REG_5_tag <= _meta_0_io_resp_5_tag;
    s2_repl_meta_REG_6_coh_state <= _meta_0_io_resp_6_coh_state;
    s2_repl_meta_REG_6_tag <= _meta_0_io_resp_6_tag;
    s2_repl_meta_REG_7_coh_state <= _meta_0_io_resp_7_coh_state;
    s2_repl_meta_REG_7_tag <= _meta_0_io_resp_7_tag;
    s2_repl_meta_REG_8_coh_state <= _meta_1_io_resp_0_coh_state;
    s2_repl_meta_REG_8_tag <= _meta_1_io_resp_0_tag;
    s2_repl_meta_REG_9_coh_state <= _meta_1_io_resp_1_coh_state;
    s2_repl_meta_REG_9_tag <= _meta_1_io_resp_1_tag;
    s2_repl_meta_REG_10_coh_state <= _meta_1_io_resp_2_coh_state;
    s2_repl_meta_REG_10_tag <= _meta_1_io_resp_2_tag;
    s2_repl_meta_REG_11_coh_state <= _meta_1_io_resp_3_coh_state;
    s2_repl_meta_REG_11_tag <= _meta_1_io_resp_3_tag;
    s2_repl_meta_REG_12_coh_state <= _meta_1_io_resp_4_coh_state;
    s2_repl_meta_REG_12_tag <= _meta_1_io_resp_4_tag;
    s2_repl_meta_REG_13_coh_state <= _meta_1_io_resp_5_coh_state;
    s2_repl_meta_REG_13_tag <= _meta_1_io_resp_5_tag;
    s2_repl_meta_REG_14_coh_state <= _meta_1_io_resp_6_coh_state;
    s2_repl_meta_REG_14_tag <= _meta_1_io_resp_6_tag;
    s2_repl_meta_REG_15_coh_state <= _meta_1_io_resp_7_coh_state;
    s2_repl_meta_REG_15_tag <= _meta_1_io_resp_7_tag;
    s2_nack_hit_0 <= _s2_nack_hit_WIRE_0;
    s2_nack_hit_1 <= s1_req_1_addr[11:6] == _prober_io_meta_write_bits_idx & ~_prober_io_req_ready;
    s2_send_resp_REG <= s1_send_resp_or_nack_0;
    s2_send_resp_REG_1 <= s1_send_resp_or_nack_1;
    s2_send_nack_REG <= s1_send_resp_or_nack_0;
    s2_send_nack_REG_1 <= s1_send_resp_or_nack_1;
    mshrs_io_meta_resp_bits_REG_0_coh_state <= _meta_0_io_resp_0_coh_state;
    mshrs_io_meta_resp_bits_REG_1_coh_state <= _meta_0_io_resp_1_coh_state;
    mshrs_io_meta_resp_bits_REG_2_coh_state <= _meta_0_io_resp_2_coh_state;
    mshrs_io_meta_resp_bits_REG_3_coh_state <= _meta_0_io_resp_3_coh_state;
    mshrs_io_meta_resp_bits_REG_4_coh_state <= _meta_0_io_resp_4_coh_state;
    mshrs_io_meta_resp_bits_REG_5_coh_state <= _meta_0_io_resp_5_coh_state;
    mshrs_io_meta_resp_bits_REG_6_coh_state <= _meta_0_io_resp_6_coh_state;
    mshrs_io_meta_resp_bits_REG_7_coh_state <= _meta_0_io_resp_7_coh_state;
    s3_req_addr <= s2_req_0_addr;
    s3_req_data <= _amoalu_io_out;
    s3_valid <= _s3_valid_T & (_s3_valid_T_1 | _s3_valid_T_2 | _s3_valid_T_4 | _s3_valid_T_6 | _s3_valid_T_7 | _s3_valid_T_8 | _s3_valid_T_9 | _s3_valid_T_13 | _s3_valid_T_14 | _s3_valid_T_15 | _s3_valid_T_16 | _s3_valid_T_17) & ~s2_sc_fail & ~(s2_send_nack_0 & s2_nack_0);
    s4_req_addr <= s3_req_addr;
    s4_req_data <= s3_req_data;
    s4_valid <= s3_valid;
    s5_req_addr <= s4_req_addr;
    s5_req_data <= s4_req_data;
    s5_valid <= s4_valid;
    s3_way <= s2_tag_match_way_0;
    if (reset) begin
      s1_valid_REG <= 1'h0;
      s1_valid_REG_1 <= 1'h0;
      debug_sc_fail_addr <= 40'h0;
      debug_sc_fail_cnt <= 8'h0;
      lrsc_count <= 7'h0;
      beatsLeft <= 8'h0;
      state_0 <= 1'h0;
      state_1 <= 1'h0;
    end
    else begin
      s1_valid_REG <= (_s1_valid_T_19 ? io_lsu_req_bits_0_valid : _s0_send_resp_or_nack_T_1 | wb_fire | prober_fire | prefetch_fire | _s0_type_T_1) & (io_lsu_brupdate_b1_mispredict_mask & s0_req_0_uop_br_mask) == 20'h0 & ~(io_lsu_exception & s0_req_0_uop_uses_ldq) & ~(s2_store_failed & _s1_valid_T_19 & s0_req_0_uop_uses_stq);
      s1_valid_REG_1 <= _s1_valid_T_19 & io_lsu_req_bits_1_valid & (io_lsu_brupdate_b1_mispredict_mask & s0_req_1_uop_br_mask) == 20'h0 & ~(io_lsu_exception & s0_req_1_uop_uses_ldq) & ~(s2_store_failed & _s1_valid_T_19 & s0_req_1_uop_uses_stq);
      if (~s2_valid_REG | _GEN_0 | ~s2_sc_fail) begin
      end
      else
        debug_sc_fail_addr <= s2_req_0_addr;
      if (s2_valid_REG) begin
        if (_GEN_0) begin
          if (s2_sc_fail)
            debug_sc_fail_cnt <= debug_sc_fail_cnt + 8'h1;
          else if (s2_sc)
            debug_sc_fail_cnt <= 8'h0;
        end
        else if (s2_sc_fail)
          debug_sc_fail_cnt <= 8'h1;
      end
      if (s2_valid_REG_1 & _mshrs_io_req_1_valid_T_10 & ~s2_hit_1 & ~(s2_has_permission_1 & (|s2_tag_match_way_1)) & (|(lrsc_count[6:2])) & lrsc_addr == s2_req_1_addr[39:6] & ~s2_nack_1 | s2_valid_REG & _mshrs_io_req_1_valid_T_10 & ~s2_hit_0 & ~(s2_has_permission_0 & (|s2_tag_match_way_0)) & s2_lrsc_addr_match_0 & ~s2_nack_0)
        lrsc_count <= 7'h0;
      else if (_GEN_3) begin
        if (|lrsc_count)
          lrsc_count <= 7'h0;
        else if (s2_lr)
          lrsc_count <= 7'h4F;
      end
      else if (|lrsc_count)
        lrsc_count <= lrsc_count - 7'h1;
      if (idle & auto_out_c_ready)
        beatsLeft <= _wb_io_release_valid & _wb_io_release_bits_opcode[0] ? 8'h3 : 8'h0;
      else
        beatsLeft <= beatsLeft - {7'h0, auto_out_c_ready & nodeOut_c_valid};
      if (idle) begin
        state_0 <= _wb_io_release_valid;
        state_1 <= winner_1;
      end
    end
  end // always @(posedge)
  BoomWritebackUnit wb (
    .clock                       (clock),
    .reset                       (reset),
    .io_req_ready                (_wb_io_req_ready),
    .io_req_valid                (_wbArb_io_out_valid),
    .io_req_bits_tag             (_wbArb_io_out_bits_tag),
    .io_req_bits_idx             (_wbArb_io_out_bits_idx),
    .io_req_bits_param           (_wbArb_io_out_bits_param),
    .io_req_bits_way_en          (_wbArb_io_out_bits_way_en),
    .io_req_bits_voluntary       (_wbArb_io_out_bits_voluntary),
    .io_meta_read_ready          (_wb_io_data_req_ready_T),
    .io_meta_read_valid          (_wb_io_meta_read_valid),
    .io_meta_read_bits_idx       (_wb_io_meta_read_bits_idx),
    .io_meta_read_bits_tag       (_wb_io_meta_read_bits_tag),
    .io_resp                     (_wb_io_resp),
    .io_idx_valid                (_wb_io_idx_valid),
    .io_idx_bits                 (_wb_io_idx_bits),
    .io_data_req_ready           (_wb_io_data_req_ready_T),
    .io_data_req_valid           (_wb_io_data_req_valid),
    .io_data_req_bits_way_en     (_wb_io_data_req_bits_way_en),
    .io_data_req_bits_addr       (_wb_io_data_req_bits_addr),
    .io_data_resp                (s2_data_muxed_0),
    .io_mem_grant                (nodeOut_d_ready & auto_out_d_valid & _wb_io_mem_grant_T_1),
    .io_release_ready            (auto_out_c_ready & (idle | state_0)),
    .io_release_valid            (_wb_io_release_valid),
    .io_release_bits_opcode      (_wb_io_release_bits_opcode),
    .io_release_bits_param       (_wb_io_release_bits_param),
    .io_release_bits_address     (_wb_io_release_bits_address),
    .io_release_bits_data        (_wb_io_release_bits_data),
    .io_lsu_release_ready        (_lsu_release_arb_io_in_0_ready),
    .io_lsu_release_valid        (_wb_io_lsu_release_valid),
    .io_lsu_release_bits_address (_wb_io_lsu_release_bits_address)
  );
  BoomProbeUnit prober (
    .clock                             (clock),
    .reset                             (reset),
    .io_req_ready                      (_prober_io_req_ready),
    .io_req_valid                      (auto_out_b_valid & ~(|(lrsc_count[6:2]))),
    .io_req_bits_param                 (auto_out_b_bits_param),
    .io_req_bits_size                  (auto_out_b_bits_size),
    .io_req_bits_source                (auto_out_b_bits_source),
    .io_req_bits_address               (auto_out_b_bits_address),
    .io_rep_ready                      (auto_out_c_ready & (idle ? ~_wb_io_release_valid : state_1)),
    .io_rep_valid                      (_prober_io_rep_valid),
    .io_rep_bits_param                 (_prober_io_rep_bits_param),
    .io_rep_bits_size                  (_prober_io_rep_bits_size),
    .io_rep_bits_source                (_prober_io_rep_bits_source),
    .io_rep_bits_address               (_prober_io_rep_bits_address),
    .io_meta_read_ready                (_metaReadArb_io_in_1_ready),
    .io_meta_read_valid                (_prober_io_meta_read_valid),
    .io_meta_read_bits_idx             (_prober_io_meta_read_bits_idx),
    .io_meta_read_bits_tag             (_prober_io_meta_read_bits_tag),
    .io_meta_write_ready               (_metaWriteArb_io_in_1_ready),
    .io_meta_write_valid               (_prober_io_meta_write_valid),
    .io_meta_write_bits_idx            (_prober_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en         (_prober_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state (_prober_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag       (_prober_io_meta_write_bits_data_tag),
    .io_wb_req_ready                   (_wbArb_io_in_0_ready),
    .io_wb_req_valid                   (_prober_io_wb_req_valid),
    .io_wb_req_bits_tag                (_prober_io_wb_req_bits_tag),
    .io_wb_req_bits_idx                (_prober_io_wb_req_bits_idx),
    .io_wb_req_bits_param              (_prober_io_wb_req_bits_param),
    .io_wb_req_bits_way_en             (_prober_io_wb_req_bits_way_en),
    .io_way_en                         (s2_tag_match_way_0),
    .io_wb_rdy                         (_prober_io_meta_write_bits_idx != _wb_io_idx_bits | ~_wb_io_idx_valid),
    .io_mshr_rdy                       (_mshrs_io_probe_rdy),
    .io_mshr_wb_rdy                    (_prober_io_mshr_wb_rdy),
    .io_block_state_state              (mshrs_io_req_0_bits_old_meta_meta_coh_state),
    .io_lsu_release_ready              (_lsu_release_arb_io_in_1_ready),
    .io_lsu_release_valid              (_prober_io_lsu_release_valid),
    .io_lsu_release_bits_address       (_prober_io_lsu_release_bits_address),
    .io_state_valid                    (_prober_io_state_valid),
    .io_state_bits                     (_prober_io_state_bits)
  );
  BoomMSHRFile mshrs (
    .clock                              (clock),
    .reset                              (reset),
    .io_req_0_ready                     (_mshrs_io_req_0_ready),
    .io_req_0_valid                     (_mshrs_io_req_0_valid_T_74),
    .io_req_0_bits_uop_uopc             (s2_req_0_uop_uopc),
    .io_req_0_bits_uop_inst             (s2_req_0_uop_inst),
    .io_req_0_bits_uop_debug_inst       (s2_req_0_uop_debug_inst),
    .io_req_0_bits_uop_is_rvc           (s2_req_0_uop_is_rvc),
    .io_req_0_bits_uop_debug_pc         (s2_req_0_uop_debug_pc),
    .io_req_0_bits_uop_iq_type          (s2_req_0_uop_iq_type),
    .io_req_0_bits_uop_fu_code          (s2_req_0_uop_fu_code),
    .io_req_0_bits_uop_ctrl_br_type     (s2_req_0_uop_ctrl_br_type),
    .io_req_0_bits_uop_ctrl_op1_sel     (s2_req_0_uop_ctrl_op1_sel),
    .io_req_0_bits_uop_ctrl_op2_sel     (s2_req_0_uop_ctrl_op2_sel),
    .io_req_0_bits_uop_ctrl_imm_sel     (s2_req_0_uop_ctrl_imm_sel),
    .io_req_0_bits_uop_ctrl_op_fcn      (s2_req_0_uop_ctrl_op_fcn),
    .io_req_0_bits_uop_ctrl_fcn_dw      (s2_req_0_uop_ctrl_fcn_dw),
    .io_req_0_bits_uop_ctrl_csr_cmd     (s2_req_0_uop_ctrl_csr_cmd),
    .io_req_0_bits_uop_ctrl_is_load     (s2_req_0_uop_ctrl_is_load),
    .io_req_0_bits_uop_ctrl_is_sta      (s2_req_0_uop_ctrl_is_sta),
    .io_req_0_bits_uop_ctrl_is_std      (s2_req_0_uop_ctrl_is_std),
    .io_req_0_bits_uop_iw_state         (s2_req_0_uop_iw_state),
    .io_req_0_bits_uop_iw_p1_poisoned   (s2_req_0_uop_iw_p1_poisoned),
    .io_req_0_bits_uop_iw_p2_poisoned   (s2_req_0_uop_iw_p2_poisoned),
    .io_req_0_bits_uop_is_br            (s2_req_0_uop_is_br),
    .io_req_0_bits_uop_is_jalr          (s2_req_0_uop_is_jalr),
    .io_req_0_bits_uop_is_jal           (s2_req_0_uop_is_jal),
    .io_req_0_bits_uop_is_sfb           (s2_req_0_uop_is_sfb),
    .io_req_0_bits_uop_br_mask          (s2_req_0_uop_br_mask & ~io_lsu_brupdate_b1_resolve_mask),
    .io_req_0_bits_uop_br_tag           (s2_req_0_uop_br_tag),
    .io_req_0_bits_uop_ftq_idx          (s2_req_0_uop_ftq_idx),
    .io_req_0_bits_uop_edge_inst        (s2_req_0_uop_edge_inst),
    .io_req_0_bits_uop_pc_lob           (s2_req_0_uop_pc_lob),
    .io_req_0_bits_uop_taken            (s2_req_0_uop_taken),
    .io_req_0_bits_uop_imm_packed       (s2_req_0_uop_imm_packed),
    .io_req_0_bits_uop_csr_addr         (s2_req_0_uop_csr_addr),
    .io_req_0_bits_uop_rob_idx          (s2_req_0_uop_rob_idx),
    .io_req_0_bits_uop_ldq_idx          (s2_req_0_uop_ldq_idx),
    .io_req_0_bits_uop_stq_idx          (s2_req_0_uop_stq_idx),
    .io_req_0_bits_uop_rxq_idx          (s2_req_0_uop_rxq_idx),
    .io_req_0_bits_uop_pdst             (s2_req_0_uop_pdst),
    .io_req_0_bits_uop_prs1             (s2_req_0_uop_prs1),
    .io_req_0_bits_uop_prs2             (s2_req_0_uop_prs2),
    .io_req_0_bits_uop_prs3             (s2_req_0_uop_prs3),
    .io_req_0_bits_uop_ppred            (s2_req_0_uop_ppred),
    .io_req_0_bits_uop_prs1_busy        (s2_req_0_uop_prs1_busy),
    .io_req_0_bits_uop_prs2_busy        (s2_req_0_uop_prs2_busy),
    .io_req_0_bits_uop_prs3_busy        (s2_req_0_uop_prs3_busy),
    .io_req_0_bits_uop_ppred_busy       (s2_req_0_uop_ppred_busy),
    .io_req_0_bits_uop_stale_pdst       (s2_req_0_uop_stale_pdst),
    .io_req_0_bits_uop_exception        (s2_req_0_uop_exception),
    .io_req_0_bits_uop_exc_cause        (s2_req_0_uop_exc_cause),
    .io_req_0_bits_uop_bypassable       (s2_req_0_uop_bypassable),
    .io_req_0_bits_uop_mem_cmd          (s2_req_0_uop_mem_cmd),
    .io_req_0_bits_uop_mem_size         (size),
    .io_req_0_bits_uop_mem_signed       (s2_req_0_uop_mem_signed),
    .io_req_0_bits_uop_is_fence         (s2_req_0_uop_is_fence),
    .io_req_0_bits_uop_is_fencei        (s2_req_0_uop_is_fencei),
    .io_req_0_bits_uop_is_amo           (s2_req_0_uop_is_amo),
    .io_req_0_bits_uop_uses_ldq         (s2_req_0_uop_uses_ldq),
    .io_req_0_bits_uop_uses_stq         (s2_req_0_uop_uses_stq),
    .io_req_0_bits_uop_is_sys_pc2epc    (s2_req_0_uop_is_sys_pc2epc),
    .io_req_0_bits_uop_is_unique        (s2_req_0_uop_is_unique),
    .io_req_0_bits_uop_flush_on_commit  (s2_req_0_uop_flush_on_commit),
    .io_req_0_bits_uop_ldst_is_rs1      (s2_req_0_uop_ldst_is_rs1),
    .io_req_0_bits_uop_ldst             (s2_req_0_uop_ldst),
    .io_req_0_bits_uop_lrs1             (s2_req_0_uop_lrs1),
    .io_req_0_bits_uop_lrs2             (s2_req_0_uop_lrs2),
    .io_req_0_bits_uop_lrs3             (s2_req_0_uop_lrs3),
    .io_req_0_bits_uop_ldst_val         (s2_req_0_uop_ldst_val),
    .io_req_0_bits_uop_dst_rtype        (s2_req_0_uop_dst_rtype),
    .io_req_0_bits_uop_lrs1_rtype       (s2_req_0_uop_lrs1_rtype),
    .io_req_0_bits_uop_lrs2_rtype       (s2_req_0_uop_lrs2_rtype),
    .io_req_0_bits_uop_frs3_en          (s2_req_0_uop_frs3_en),
    .io_req_0_bits_uop_fp_val           (s2_req_0_uop_fp_val),
    .io_req_0_bits_uop_fp_single        (s2_req_0_uop_fp_single),
    .io_req_0_bits_uop_xcpt_pf_if       (s2_req_0_uop_xcpt_pf_if),
    .io_req_0_bits_uop_xcpt_ae_if       (s2_req_0_uop_xcpt_ae_if),
    .io_req_0_bits_uop_xcpt_ma_if       (s2_req_0_uop_xcpt_ma_if),
    .io_req_0_bits_uop_bp_debug_if      (s2_req_0_uop_bp_debug_if),
    .io_req_0_bits_uop_bp_xcpt_if       (s2_req_0_uop_bp_xcpt_if),
    .io_req_0_bits_uop_debug_fsrc       (s2_req_0_uop_debug_fsrc),
    .io_req_0_bits_uop_debug_tsrc       (s2_req_0_uop_debug_tsrc),
    .io_req_0_bits_addr                 (s2_req_0_addr),
    .io_req_0_bits_data                 (s2_req_0_data),
    .io_req_0_bits_is_hella             (s2_req_0_is_hella),
    .io_req_0_bits_tag_match            (|s2_tag_match_way_0),
    .io_req_0_bits_old_meta_coh_state   ((|s2_tag_match_way_0) ? mshrs_io_req_0_bits_old_meta_meta_coh_state : (_s2_repl_meta_T_38 ? s2_repl_meta_REG_coh_state : 2'h0) | (_s2_repl_meta_T_39 ? s2_repl_meta_REG_1_coh_state : 2'h0) | (_s2_repl_meta_T_40 ? s2_repl_meta_REG_2_coh_state : 2'h0) | (_s2_repl_meta_T_41 ? s2_repl_meta_REG_3_coh_state : 2'h0) | (_s2_repl_meta_T_42 ? s2_repl_meta_REG_4_coh_state : 2'h0) | (_s2_repl_meta_T_43 ? s2_repl_meta_REG_5_coh_state : 2'h0) | (_s2_repl_meta_T_44 ? s2_repl_meta_REG_6_coh_state : 2'h0) | ((&s2_replaced_way_en_REG) ? s2_repl_meta_REG_7_coh_state : 2'h0)),
    .io_req_0_bits_old_meta_tag         ((_s2_repl_meta_T_38 ? s2_repl_meta_REG_tag : 21'h0) | (_s2_repl_meta_T_39 ? s2_repl_meta_REG_1_tag : 21'h0) | (_s2_repl_meta_T_40 ? s2_repl_meta_REG_2_tag : 21'h0) | (_s2_repl_meta_T_41 ? s2_repl_meta_REG_3_tag : 21'h0) | (_s2_repl_meta_T_42 ? s2_repl_meta_REG_4_tag : 21'h0) | (_s2_repl_meta_T_43 ? s2_repl_meta_REG_5_tag : 21'h0) | (_s2_repl_meta_T_44 ? s2_repl_meta_REG_6_tag : 21'h0) | ((&s2_replaced_way_en_REG) ? s2_repl_meta_REG_7_tag : 21'h0)),
    .io_req_0_bits_way_en               ((|s2_tag_match_way_0) ? s2_tag_match_way_0 : s2_replaced_way_en),
    .io_req_1_ready                     (_mshrs_io_req_1_ready),
    .io_req_1_valid                     (_mshrs_io_req_1_valid_T_74),
    .io_req_1_bits_uop_uopc             (s2_req_1_uop_uopc),
    .io_req_1_bits_uop_inst             (s2_req_1_uop_inst),
    .io_req_1_bits_uop_debug_inst       (s2_req_1_uop_debug_inst),
    .io_req_1_bits_uop_is_rvc           (s2_req_1_uop_is_rvc),
    .io_req_1_bits_uop_debug_pc         (s2_req_1_uop_debug_pc),
    .io_req_1_bits_uop_iq_type          (s2_req_1_uop_iq_type),
    .io_req_1_bits_uop_fu_code          (s2_req_1_uop_fu_code),
    .io_req_1_bits_uop_ctrl_br_type     (s2_req_1_uop_ctrl_br_type),
    .io_req_1_bits_uop_ctrl_op1_sel     (s2_req_1_uop_ctrl_op1_sel),
    .io_req_1_bits_uop_ctrl_op2_sel     (s2_req_1_uop_ctrl_op2_sel),
    .io_req_1_bits_uop_ctrl_imm_sel     (s2_req_1_uop_ctrl_imm_sel),
    .io_req_1_bits_uop_ctrl_op_fcn      (s2_req_1_uop_ctrl_op_fcn),
    .io_req_1_bits_uop_ctrl_fcn_dw      (s2_req_1_uop_ctrl_fcn_dw),
    .io_req_1_bits_uop_ctrl_csr_cmd     (s2_req_1_uop_ctrl_csr_cmd),
    .io_req_1_bits_uop_ctrl_is_load     (s2_req_1_uop_ctrl_is_load),
    .io_req_1_bits_uop_ctrl_is_sta      (s2_req_1_uop_ctrl_is_sta),
    .io_req_1_bits_uop_ctrl_is_std      (s2_req_1_uop_ctrl_is_std),
    .io_req_1_bits_uop_iw_state         (s2_req_1_uop_iw_state),
    .io_req_1_bits_uop_iw_p1_poisoned   (s2_req_1_uop_iw_p1_poisoned),
    .io_req_1_bits_uop_iw_p2_poisoned   (s2_req_1_uop_iw_p2_poisoned),
    .io_req_1_bits_uop_is_br            (s2_req_1_uop_is_br),
    .io_req_1_bits_uop_is_jalr          (s2_req_1_uop_is_jalr),
    .io_req_1_bits_uop_is_jal           (s2_req_1_uop_is_jal),
    .io_req_1_bits_uop_is_sfb           (s2_req_1_uop_is_sfb),
    .io_req_1_bits_uop_br_mask          (s2_req_1_uop_br_mask & ~io_lsu_brupdate_b1_resolve_mask),
    .io_req_1_bits_uop_br_tag           (s2_req_1_uop_br_tag),
    .io_req_1_bits_uop_ftq_idx          (s2_req_1_uop_ftq_idx),
    .io_req_1_bits_uop_edge_inst        (s2_req_1_uop_edge_inst),
    .io_req_1_bits_uop_pc_lob           (s2_req_1_uop_pc_lob),
    .io_req_1_bits_uop_taken            (s2_req_1_uop_taken),
    .io_req_1_bits_uop_imm_packed       (s2_req_1_uop_imm_packed),
    .io_req_1_bits_uop_csr_addr         (s2_req_1_uop_csr_addr),
    .io_req_1_bits_uop_rob_idx          (s2_req_1_uop_rob_idx),
    .io_req_1_bits_uop_ldq_idx          (s2_req_1_uop_ldq_idx),
    .io_req_1_bits_uop_stq_idx          (s2_req_1_uop_stq_idx),
    .io_req_1_bits_uop_rxq_idx          (s2_req_1_uop_rxq_idx),
    .io_req_1_bits_uop_pdst             (s2_req_1_uop_pdst),
    .io_req_1_bits_uop_prs1             (s2_req_1_uop_prs1),
    .io_req_1_bits_uop_prs2             (s2_req_1_uop_prs2),
    .io_req_1_bits_uop_prs3             (s2_req_1_uop_prs3),
    .io_req_1_bits_uop_ppred            (s2_req_1_uop_ppred),
    .io_req_1_bits_uop_prs1_busy        (s2_req_1_uop_prs1_busy),
    .io_req_1_bits_uop_prs2_busy        (s2_req_1_uop_prs2_busy),
    .io_req_1_bits_uop_prs3_busy        (s2_req_1_uop_prs3_busy),
    .io_req_1_bits_uop_ppred_busy       (s2_req_1_uop_ppred_busy),
    .io_req_1_bits_uop_stale_pdst       (s2_req_1_uop_stale_pdst),
    .io_req_1_bits_uop_exception        (s2_req_1_uop_exception),
    .io_req_1_bits_uop_exc_cause        (s2_req_1_uop_exc_cause),
    .io_req_1_bits_uop_bypassable       (s2_req_1_uop_bypassable),
    .io_req_1_bits_uop_mem_cmd          (s2_req_1_uop_mem_cmd),
    .io_req_1_bits_uop_mem_size         (size_1),
    .io_req_1_bits_uop_mem_signed       (s2_req_1_uop_mem_signed),
    .io_req_1_bits_uop_is_fence         (s2_req_1_uop_is_fence),
    .io_req_1_bits_uop_is_fencei        (s2_req_1_uop_is_fencei),
    .io_req_1_bits_uop_is_amo           (s2_req_1_uop_is_amo),
    .io_req_1_bits_uop_uses_ldq         (s2_req_1_uop_uses_ldq),
    .io_req_1_bits_uop_uses_stq         (s2_req_1_uop_uses_stq),
    .io_req_1_bits_uop_is_sys_pc2epc    (s2_req_1_uop_is_sys_pc2epc),
    .io_req_1_bits_uop_is_unique        (s2_req_1_uop_is_unique),
    .io_req_1_bits_uop_flush_on_commit  (s2_req_1_uop_flush_on_commit),
    .io_req_1_bits_uop_ldst_is_rs1      (s2_req_1_uop_ldst_is_rs1),
    .io_req_1_bits_uop_ldst             (s2_req_1_uop_ldst),
    .io_req_1_bits_uop_lrs1             (s2_req_1_uop_lrs1),
    .io_req_1_bits_uop_lrs2             (s2_req_1_uop_lrs2),
    .io_req_1_bits_uop_lrs3             (s2_req_1_uop_lrs3),
    .io_req_1_bits_uop_ldst_val         (s2_req_1_uop_ldst_val),
    .io_req_1_bits_uop_dst_rtype        (s2_req_1_uop_dst_rtype),
    .io_req_1_bits_uop_lrs1_rtype       (s2_req_1_uop_lrs1_rtype),
    .io_req_1_bits_uop_lrs2_rtype       (s2_req_1_uop_lrs2_rtype),
    .io_req_1_bits_uop_frs3_en          (s2_req_1_uop_frs3_en),
    .io_req_1_bits_uop_fp_val           (s2_req_1_uop_fp_val),
    .io_req_1_bits_uop_fp_single        (s2_req_1_uop_fp_single),
    .io_req_1_bits_uop_xcpt_pf_if       (s2_req_1_uop_xcpt_pf_if),
    .io_req_1_bits_uop_xcpt_ae_if       (s2_req_1_uop_xcpt_ae_if),
    .io_req_1_bits_uop_xcpt_ma_if       (s2_req_1_uop_xcpt_ma_if),
    .io_req_1_bits_uop_bp_debug_if      (s2_req_1_uop_bp_debug_if),
    .io_req_1_bits_uop_bp_xcpt_if       (s2_req_1_uop_bp_xcpt_if),
    .io_req_1_bits_uop_debug_fsrc       (s2_req_1_uop_debug_fsrc),
    .io_req_1_bits_uop_debug_tsrc       (s2_req_1_uop_debug_tsrc),
    .io_req_1_bits_addr                 (s2_req_1_addr),
    .io_req_1_bits_data                 (s2_req_1_data),
    .io_req_1_bits_is_hella             (s2_req_1_is_hella),
    .io_req_1_bits_tag_match            (|s2_tag_match_way_1),
    .io_req_1_bits_old_meta_coh_state   ((|s2_tag_match_way_1) ? mshrs_io_req_1_bits_old_meta_meta_coh_state : (_s2_repl_meta_T_38 ? s2_repl_meta_REG_8_coh_state : 2'h0) | (_s2_repl_meta_T_39 ? s2_repl_meta_REG_9_coh_state : 2'h0) | (_s2_repl_meta_T_40 ? s2_repl_meta_REG_10_coh_state : 2'h0) | (_s2_repl_meta_T_41 ? s2_repl_meta_REG_11_coh_state : 2'h0) | (_s2_repl_meta_T_42 ? s2_repl_meta_REG_12_coh_state : 2'h0) | (_s2_repl_meta_T_43 ? s2_repl_meta_REG_13_coh_state : 2'h0) | (_s2_repl_meta_T_44 ? s2_repl_meta_REG_14_coh_state : 2'h0) | ((&s2_replaced_way_en_REG) ? s2_repl_meta_REG_15_coh_state : 2'h0)),
    .io_req_1_bits_old_meta_tag         ((_s2_repl_meta_T_38 ? s2_repl_meta_REG_8_tag : 21'h0) | (_s2_repl_meta_T_39 ? s2_repl_meta_REG_9_tag : 21'h0) | (_s2_repl_meta_T_40 ? s2_repl_meta_REG_10_tag : 21'h0) | (_s2_repl_meta_T_41 ? s2_repl_meta_REG_11_tag : 21'h0) | (_s2_repl_meta_T_42 ? s2_repl_meta_REG_12_tag : 21'h0) | (_s2_repl_meta_T_43 ? s2_repl_meta_REG_13_tag : 21'h0) | (_s2_repl_meta_T_44 ? s2_repl_meta_REG_14_tag : 21'h0) | ((&s2_replaced_way_en_REG) ? s2_repl_meta_REG_15_tag : 21'h0)),
    .io_req_1_bits_way_en               ((|s2_tag_match_way_1) ? s2_tag_match_way_1 : s2_replaced_way_en),
    .io_req_is_probe_0                  (_mshrs_io_req_is_probe_1_T & s2_valid_REG),
    .io_req_is_probe_1                  (_mshrs_io_req_is_probe_1_T & s2_valid_REG_1),
    .io_resp_ready                      (~(cache_resp_0_valid & cache_resp_1_valid)),
    .io_resp_valid                      (_mshrs_io_resp_valid),
    .io_resp_bits_uop_br_mask           (_mshrs_io_resp_bits_uop_br_mask),
    .io_resp_bits_uop_ldq_idx           (_mshrs_io_resp_bits_uop_ldq_idx),
    .io_resp_bits_uop_stq_idx           (_mshrs_io_resp_bits_uop_stq_idx),
    .io_resp_bits_uop_is_amo            (_mshrs_io_resp_bits_uop_is_amo),
    .io_resp_bits_uop_uses_ldq          (_mshrs_io_resp_bits_uop_uses_ldq),
    .io_resp_bits_uop_uses_stq          (_mshrs_io_resp_bits_uop_uses_stq),
    .io_resp_bits_data                  (_mshrs_io_resp_bits_data),
    .io_resp_bits_is_hella              (_mshrs_io_resp_bits_is_hella),
    .io_secondary_miss_0                (_mshrs_io_secondary_miss_0),
    .io_secondary_miss_1                (_mshrs_io_secondary_miss_1),
    .io_block_hit_0                     (_mshrs_io_block_hit_0),
    .io_block_hit_1                     (_mshrs_io_block_hit_1),
    .io_brupdate_b1_resolve_mask        (io_lsu_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask     (io_lsu_brupdate_b1_mispredict_mask),
    .io_exception                       (io_lsu_exception),
    .io_mem_acquire_ready               (auto_out_a_ready),
    .io_mem_acquire_valid               (auto_out_a_valid),
    .io_mem_acquire_bits_opcode         (auto_out_a_bits_opcode),
    .io_mem_acquire_bits_param          (auto_out_a_bits_param),
    .io_mem_acquire_bits_size           (auto_out_a_bits_size),
    .io_mem_acquire_bits_source         (auto_out_a_bits_source),
    .io_mem_acquire_bits_address        (auto_out_a_bits_address),
    .io_mem_acquire_bits_mask           (auto_out_a_bits_mask),
    .io_mem_acquire_bits_data           (auto_out_a_bits_data),
    .io_mem_grant_ready                 (_mshrs_io_mem_grant_ready),
    .io_mem_grant_valid                 (~_wb_io_mem_grant_T_1 & auto_out_d_valid),
    .io_mem_grant_bits_opcode           (auto_out_d_bits_opcode),
    .io_mem_grant_bits_param            (auto_out_d_bits_param),
    .io_mem_grant_bits_size             (auto_out_d_bits_size),
    .io_mem_grant_bits_source           (auto_out_d_bits_source),
    .io_mem_grant_bits_sink             (auto_out_d_bits_sink),
    .io_mem_grant_bits_data             (auto_out_d_bits_data),
    .io_mem_finish_ready                (auto_out_e_ready),
    .io_mem_finish_valid                (auto_out_e_valid),
    .io_mem_finish_bits_sink            (auto_out_e_bits_sink),
    .io_refill_ready                    (_dataWriteArb_io_in_1_ready),
    .io_refill_valid                    (_mshrs_io_refill_valid),
    .io_refill_bits_way_en              (_mshrs_io_refill_bits_way_en),
    .io_refill_bits_addr                (_mshrs_io_refill_bits_addr),
    .io_refill_bits_data                (_mshrs_io_refill_bits_data),
    .io_meta_write_ready                (_metaWriteArb_io_in_0_ready),
    .io_meta_write_valid                (_mshrs_io_meta_write_valid),
    .io_meta_write_bits_idx             (_mshrs_io_meta_write_bits_idx),
    .io_meta_write_bits_way_en          (_mshrs_io_meta_write_bits_way_en),
    .io_meta_write_bits_data_coh_state  (_mshrs_io_meta_write_bits_data_coh_state),
    .io_meta_write_bits_data_tag        (_mshrs_io_meta_write_bits_data_tag),
    .io_meta_read_ready                 (_metaReadArb_io_in_3_ready),
    .io_meta_read_valid                 (_mshrs_io_meta_read_valid),
    .io_meta_read_bits_idx              (_mshrs_io_meta_read_bits_idx),
    .io_meta_read_bits_way_en           (_mshrs_io_meta_read_bits_way_en),
    .io_meta_read_bits_tag              (_mshrs_io_meta_read_bits_tag),
    .io_meta_resp_valid                 (~s2_nack_hit_0 | _prober_io_mshr_wb_rdy),
    .io_meta_resp_bits_coh_state        ((s2_tag_match_way_0[0] ? mshrs_io_meta_resp_bits_REG_0_coh_state : 2'h0) | (s2_tag_match_way_0[1] ? mshrs_io_meta_resp_bits_REG_1_coh_state : 2'h0) | (s2_tag_match_way_0[2] ? mshrs_io_meta_resp_bits_REG_2_coh_state : 2'h0) | (s2_tag_match_way_0[3] ? mshrs_io_meta_resp_bits_REG_3_coh_state : 2'h0) | (s2_tag_match_way_0[4] ? mshrs_io_meta_resp_bits_REG_4_coh_state : 2'h0) | (s2_tag_match_way_0[5] ? mshrs_io_meta_resp_bits_REG_5_coh_state : 2'h0) | (s2_tag_match_way_0[6] ? mshrs_io_meta_resp_bits_REG_6_coh_state : 2'h0) | (s2_tag_match_way_0[7] ? mshrs_io_meta_resp_bits_REG_7_coh_state : 2'h0)),
    .io_replay_ready                    (_metaReadArb_io_in_0_ready),
    .io_replay_valid                    (_mshrs_io_replay_valid),
    .io_replay_bits_uop_uopc            (_mshrs_io_replay_bits_uop_uopc),
    .io_replay_bits_uop_inst            (_mshrs_io_replay_bits_uop_inst),
    .io_replay_bits_uop_debug_inst      (_mshrs_io_replay_bits_uop_debug_inst),
    .io_replay_bits_uop_is_rvc          (_mshrs_io_replay_bits_uop_is_rvc),
    .io_replay_bits_uop_debug_pc        (_mshrs_io_replay_bits_uop_debug_pc),
    .io_replay_bits_uop_iq_type         (_mshrs_io_replay_bits_uop_iq_type),
    .io_replay_bits_uop_fu_code         (_mshrs_io_replay_bits_uop_fu_code),
    .io_replay_bits_uop_ctrl_br_type    (_mshrs_io_replay_bits_uop_ctrl_br_type),
    .io_replay_bits_uop_ctrl_op1_sel    (_mshrs_io_replay_bits_uop_ctrl_op1_sel),
    .io_replay_bits_uop_ctrl_op2_sel    (_mshrs_io_replay_bits_uop_ctrl_op2_sel),
    .io_replay_bits_uop_ctrl_imm_sel    (_mshrs_io_replay_bits_uop_ctrl_imm_sel),
    .io_replay_bits_uop_ctrl_op_fcn     (_mshrs_io_replay_bits_uop_ctrl_op_fcn),
    .io_replay_bits_uop_ctrl_fcn_dw     (_mshrs_io_replay_bits_uop_ctrl_fcn_dw),
    .io_replay_bits_uop_ctrl_csr_cmd    (_mshrs_io_replay_bits_uop_ctrl_csr_cmd),
    .io_replay_bits_uop_ctrl_is_load    (_mshrs_io_replay_bits_uop_ctrl_is_load),
    .io_replay_bits_uop_ctrl_is_sta     (_mshrs_io_replay_bits_uop_ctrl_is_sta),
    .io_replay_bits_uop_ctrl_is_std     (_mshrs_io_replay_bits_uop_ctrl_is_std),
    .io_replay_bits_uop_iw_state        (_mshrs_io_replay_bits_uop_iw_state),
    .io_replay_bits_uop_iw_p1_poisoned  (_mshrs_io_replay_bits_uop_iw_p1_poisoned),
    .io_replay_bits_uop_iw_p2_poisoned  (_mshrs_io_replay_bits_uop_iw_p2_poisoned),
    .io_replay_bits_uop_is_br           (_mshrs_io_replay_bits_uop_is_br),
    .io_replay_bits_uop_is_jalr         (_mshrs_io_replay_bits_uop_is_jalr),
    .io_replay_bits_uop_is_jal          (_mshrs_io_replay_bits_uop_is_jal),
    .io_replay_bits_uop_is_sfb          (_mshrs_io_replay_bits_uop_is_sfb),
    .io_replay_bits_uop_br_mask         (_mshrs_io_replay_bits_uop_br_mask),
    .io_replay_bits_uop_br_tag          (_mshrs_io_replay_bits_uop_br_tag),
    .io_replay_bits_uop_ftq_idx         (_mshrs_io_replay_bits_uop_ftq_idx),
    .io_replay_bits_uop_edge_inst       (_mshrs_io_replay_bits_uop_edge_inst),
    .io_replay_bits_uop_pc_lob          (_mshrs_io_replay_bits_uop_pc_lob),
    .io_replay_bits_uop_taken           (_mshrs_io_replay_bits_uop_taken),
    .io_replay_bits_uop_imm_packed      (_mshrs_io_replay_bits_uop_imm_packed),
    .io_replay_bits_uop_csr_addr        (_mshrs_io_replay_bits_uop_csr_addr),
    .io_replay_bits_uop_rob_idx         (_mshrs_io_replay_bits_uop_rob_idx),
    .io_replay_bits_uop_ldq_idx         (_mshrs_io_replay_bits_uop_ldq_idx),
    .io_replay_bits_uop_stq_idx         (_mshrs_io_replay_bits_uop_stq_idx),
    .io_replay_bits_uop_rxq_idx         (_mshrs_io_replay_bits_uop_rxq_idx),
    .io_replay_bits_uop_pdst            (_mshrs_io_replay_bits_uop_pdst),
    .io_replay_bits_uop_prs1            (_mshrs_io_replay_bits_uop_prs1),
    .io_replay_bits_uop_prs2            (_mshrs_io_replay_bits_uop_prs2),
    .io_replay_bits_uop_prs3            (_mshrs_io_replay_bits_uop_prs3),
    .io_replay_bits_uop_ppred           (_mshrs_io_replay_bits_uop_ppred),
    .io_replay_bits_uop_prs1_busy       (_mshrs_io_replay_bits_uop_prs1_busy),
    .io_replay_bits_uop_prs2_busy       (_mshrs_io_replay_bits_uop_prs2_busy),
    .io_replay_bits_uop_prs3_busy       (_mshrs_io_replay_bits_uop_prs3_busy),
    .io_replay_bits_uop_ppred_busy      (_mshrs_io_replay_bits_uop_ppred_busy),
    .io_replay_bits_uop_stale_pdst      (_mshrs_io_replay_bits_uop_stale_pdst),
    .io_replay_bits_uop_exception       (_mshrs_io_replay_bits_uop_exception),
    .io_replay_bits_uop_exc_cause       (_mshrs_io_replay_bits_uop_exc_cause),
    .io_replay_bits_uop_bypassable      (_mshrs_io_replay_bits_uop_bypassable),
    .io_replay_bits_uop_mem_cmd         (_mshrs_io_replay_bits_uop_mem_cmd),
    .io_replay_bits_uop_mem_size        (_mshrs_io_replay_bits_uop_mem_size),
    .io_replay_bits_uop_mem_signed      (_mshrs_io_replay_bits_uop_mem_signed),
    .io_replay_bits_uop_is_fence        (_mshrs_io_replay_bits_uop_is_fence),
    .io_replay_bits_uop_is_fencei       (_mshrs_io_replay_bits_uop_is_fencei),
    .io_replay_bits_uop_is_amo          (_mshrs_io_replay_bits_uop_is_amo),
    .io_replay_bits_uop_uses_ldq        (_mshrs_io_replay_bits_uop_uses_ldq),
    .io_replay_bits_uop_uses_stq        (_mshrs_io_replay_bits_uop_uses_stq),
    .io_replay_bits_uop_is_sys_pc2epc   (_mshrs_io_replay_bits_uop_is_sys_pc2epc),
    .io_replay_bits_uop_is_unique       (_mshrs_io_replay_bits_uop_is_unique),
    .io_replay_bits_uop_flush_on_commit (_mshrs_io_replay_bits_uop_flush_on_commit),
    .io_replay_bits_uop_ldst_is_rs1     (_mshrs_io_replay_bits_uop_ldst_is_rs1),
    .io_replay_bits_uop_ldst            (_mshrs_io_replay_bits_uop_ldst),
    .io_replay_bits_uop_lrs1            (_mshrs_io_replay_bits_uop_lrs1),
    .io_replay_bits_uop_lrs2            (_mshrs_io_replay_bits_uop_lrs2),
    .io_replay_bits_uop_lrs3            (_mshrs_io_replay_bits_uop_lrs3),
    .io_replay_bits_uop_ldst_val        (_mshrs_io_replay_bits_uop_ldst_val),
    .io_replay_bits_uop_dst_rtype       (_mshrs_io_replay_bits_uop_dst_rtype),
    .io_replay_bits_uop_lrs1_rtype      (_mshrs_io_replay_bits_uop_lrs1_rtype),
    .io_replay_bits_uop_lrs2_rtype      (_mshrs_io_replay_bits_uop_lrs2_rtype),
    .io_replay_bits_uop_frs3_en         (_mshrs_io_replay_bits_uop_frs3_en),
    .io_replay_bits_uop_fp_val          (_mshrs_io_replay_bits_uop_fp_val),
    .io_replay_bits_uop_fp_single       (_mshrs_io_replay_bits_uop_fp_single),
    .io_replay_bits_uop_xcpt_pf_if      (_mshrs_io_replay_bits_uop_xcpt_pf_if),
    .io_replay_bits_uop_xcpt_ae_if      (_mshrs_io_replay_bits_uop_xcpt_ae_if),
    .io_replay_bits_uop_xcpt_ma_if      (_mshrs_io_replay_bits_uop_xcpt_ma_if),
    .io_replay_bits_uop_bp_debug_if     (_mshrs_io_replay_bits_uop_bp_debug_if),
    .io_replay_bits_uop_bp_xcpt_if      (_mshrs_io_replay_bits_uop_bp_xcpt_if),
    .io_replay_bits_uop_debug_fsrc      (_mshrs_io_replay_bits_uop_debug_fsrc),
    .io_replay_bits_uop_debug_tsrc      (_mshrs_io_replay_bits_uop_debug_tsrc),
    .io_replay_bits_addr                (_mshrs_io_replay_bits_addr),
    .io_replay_bits_data                (_mshrs_io_replay_bits_data),
    .io_replay_bits_is_hella            (_mshrs_io_replay_bits_is_hella),
    .io_replay_bits_way_en              (_mshrs_io_replay_bits_way_en),
    .io_prefetch_ready                  (_metaReadArb_io_in_5_ready),
    .io_prefetch_valid                  (_mshrs_io_prefetch_valid),
    .io_prefetch_bits_uop_mem_cmd       (_mshrs_io_prefetch_bits_uop_mem_cmd),
    .io_prefetch_bits_addr              (_mshrs_io_prefetch_bits_addr),
    .io_wb_req_ready                    (_wbArb_io_in_1_ready),
    .io_wb_req_valid                    (_mshrs_io_wb_req_valid),
    .io_wb_req_bits_tag                 (_mshrs_io_wb_req_bits_tag),
    .io_wb_req_bits_idx                 (_mshrs_io_wb_req_bits_idx),
    .io_wb_req_bits_param               (_mshrs_io_wb_req_bits_param),
    .io_wb_req_bits_way_en              (_mshrs_io_wb_req_bits_way_en),
    .io_prober_state_valid              (_prober_io_state_valid),
    .io_prober_state_bits               (_prober_io_state_bits),
    .io_clear_all                       (io_lsu_force_order),
    .io_wb_resp                         (_wb_io_resp),
    .io_fence_rdy                       (_mshrs_io_fence_rdy),
    .io_probe_rdy                       (_mshrs_io_probe_rdy)
  );
  L1MetadataArray meta_0 (
    .clock                        (clock),
    .reset                        (reset),
    .io_read_ready                (_meta_0_io_read_ready),
    .io_read_valid                (_metaReadArb_io_out_valid),
    .io_read_bits_idx             (_metaReadArb_io_out_bits_req_0_idx),
    .io_write_ready               (_meta_0_io_write_ready),
    .io_write_valid               (_meta_1_io_write_valid_T),
    .io_write_bits_idx            (_metaWriteArb_io_out_bits_idx),
    .io_write_bits_way_en         (_metaWriteArb_io_out_bits_way_en),
    .io_write_bits_data_coh_state (_metaWriteArb_io_out_bits_data_coh_state),
    .io_write_bits_data_tag       (_metaWriteArb_io_out_bits_data_tag),
    .io_resp_0_coh_state          (_meta_0_io_resp_0_coh_state),
    .io_resp_0_tag                (_meta_0_io_resp_0_tag),
    .io_resp_1_coh_state          (_meta_0_io_resp_1_coh_state),
    .io_resp_1_tag                (_meta_0_io_resp_1_tag),
    .io_resp_2_coh_state          (_meta_0_io_resp_2_coh_state),
    .io_resp_2_tag                (_meta_0_io_resp_2_tag),
    .io_resp_3_coh_state          (_meta_0_io_resp_3_coh_state),
    .io_resp_3_tag                (_meta_0_io_resp_3_tag),
    .io_resp_4_coh_state          (_meta_0_io_resp_4_coh_state),
    .io_resp_4_tag                (_meta_0_io_resp_4_tag),
    .io_resp_5_coh_state          (_meta_0_io_resp_5_coh_state),
    .io_resp_5_tag                (_meta_0_io_resp_5_tag),
    .io_resp_6_coh_state          (_meta_0_io_resp_6_coh_state),
    .io_resp_6_tag                (_meta_0_io_resp_6_tag),
    .io_resp_7_coh_state          (_meta_0_io_resp_7_coh_state),
    .io_resp_7_tag                (_meta_0_io_resp_7_tag)
  );
  L1MetadataArray meta_1 (
    .clock                        (clock),
    .reset                        (reset),
    .io_read_ready                (_meta_1_io_read_ready),
    .io_read_valid                (_metaReadArb_io_out_valid),
    .io_read_bits_idx             (_metaReadArb_io_out_bits_req_1_idx),
    .io_write_ready               (_meta_1_io_write_ready),
    .io_write_valid               (_meta_1_io_write_valid_T),
    .io_write_bits_idx            (_metaWriteArb_io_out_bits_idx),
    .io_write_bits_way_en         (_metaWriteArb_io_out_bits_way_en),
    .io_write_bits_data_coh_state (_metaWriteArb_io_out_bits_data_coh_state),
    .io_write_bits_data_tag       (_metaWriteArb_io_out_bits_data_tag),
    .io_resp_0_coh_state          (_meta_1_io_resp_0_coh_state),
    .io_resp_0_tag                (_meta_1_io_resp_0_tag),
    .io_resp_1_coh_state          (_meta_1_io_resp_1_coh_state),
    .io_resp_1_tag                (_meta_1_io_resp_1_tag),
    .io_resp_2_coh_state          (_meta_1_io_resp_2_coh_state),
    .io_resp_2_tag                (_meta_1_io_resp_2_tag),
    .io_resp_3_coh_state          (_meta_1_io_resp_3_coh_state),
    .io_resp_3_tag                (_meta_1_io_resp_3_tag),
    .io_resp_4_coh_state          (_meta_1_io_resp_4_coh_state),
    .io_resp_4_tag                (_meta_1_io_resp_4_tag),
    .io_resp_5_coh_state          (_meta_1_io_resp_5_coh_state),
    .io_resp_5_tag                (_meta_1_io_resp_5_tag),
    .io_resp_6_coh_state          (_meta_1_io_resp_6_coh_state),
    .io_resp_6_tag                (_meta_1_io_resp_6_tag),
    .io_resp_7_coh_state          (_meta_1_io_resp_7_coh_state),
    .io_resp_7_tag                (_meta_1_io_resp_7_tag)
  );
  Arbiter_9 metaWriteArb (
    .io_in_0_ready               (_metaWriteArb_io_in_0_ready),
    .io_in_0_valid               (_mshrs_io_meta_write_valid),
    .io_in_0_bits_idx            (_mshrs_io_meta_write_bits_idx),
    .io_in_0_bits_way_en         (_mshrs_io_meta_write_bits_way_en),
    .io_in_0_bits_data_coh_state (_mshrs_io_meta_write_bits_data_coh_state),
    .io_in_0_bits_data_tag       (_mshrs_io_meta_write_bits_data_tag),
    .io_in_1_ready               (_metaWriteArb_io_in_1_ready),
    .io_in_1_valid               (_prober_io_meta_write_valid),
    .io_in_1_bits_idx            (_prober_io_meta_write_bits_idx),
    .io_in_1_bits_way_en         (_prober_io_meta_write_bits_way_en),
    .io_in_1_bits_data_coh_state (_prober_io_meta_write_bits_data_coh_state),
    .io_in_1_bits_data_tag       (_prober_io_meta_write_bits_data_tag),
    .io_out_ready                (_metaWriteArb_io_out_ready_T),
    .io_out_valid                (_metaWriteArb_io_out_valid),
    .io_out_bits_idx             (_metaWriteArb_io_out_bits_idx),
    .io_out_bits_way_en          (_metaWriteArb_io_out_bits_way_en),
    .io_out_bits_data_coh_state  (_metaWriteArb_io_out_bits_data_coh_state),
    .io_out_bits_data_tag        (_metaWriteArb_io_out_bits_data_tag)
  );
  Arbiter_10 metaReadArb (
    .io_in_0_ready          (_metaReadArb_io_in_0_ready),
    .io_in_0_valid          (_mshrs_io_replay_valid),
    .io_in_0_bits_req_0_idx (_mshrs_io_replay_bits_addr[11:6]),
    .io_in_1_ready          (_metaReadArb_io_in_1_ready),
    .io_in_1_valid          (_prober_io_meta_read_valid),
    .io_in_1_bits_req_0_idx (_prober_io_meta_read_bits_idx),
    .io_in_2_ready          (_metaReadArb_io_in_2_ready),
    .io_in_2_valid          (_wb_io_meta_read_valid),
    .io_in_2_bits_req_0_idx (_wb_io_meta_read_bits_idx),
    .io_in_3_ready          (_metaReadArb_io_in_3_ready),
    .io_in_3_valid          (_mshrs_io_meta_read_valid),
    .io_in_3_bits_req_0_idx (_mshrs_io_meta_read_bits_idx),
    .io_in_4_ready          (_metaReadArb_io_in_4_ready),
    .io_in_4_valid          (io_lsu_req_valid),
    .io_in_4_bits_req_0_idx (io_lsu_req_bits_0_bits_addr[11:6]),
    .io_in_4_bits_req_1_idx (io_lsu_req_bits_1_bits_addr[11:6]),
    .io_in_5_ready          (_metaReadArb_io_in_5_ready),
    .io_in_5_valid          (_mshrs_io_prefetch_valid),
    .io_in_5_bits_req_0_idx (_mshrs_io_prefetch_bits_addr[11:6]),
    .io_out_ready           (_meta_0_io_read_ready | _meta_1_io_read_ready),
    .io_out_valid           (_metaReadArb_io_out_valid),
    .io_out_bits_req_0_idx  (_metaReadArb_io_out_bits_req_0_idx),
    .io_out_bits_req_1_idx  (_metaReadArb_io_out_bits_req_1_idx)
  );
  BoomDuplicatedDataArray data (
    .clock                 (clock),
    .io_read_0_valid       (_dataReadArb_io_out_bits_valid_0 & _dataReadArb_io_out_valid),
    .io_read_0_bits_way_en (_dataReadArb_io_out_bits_req_0_way_en),
    .io_read_0_bits_addr   (_dataReadArb_io_out_bits_req_0_addr),
    .io_read_1_valid       (_dataReadArb_io_out_bits_valid_1 & _dataReadArb_io_out_valid),
    .io_read_1_bits_way_en (_dataReadArb_io_out_bits_req_1_way_en),
    .io_read_1_bits_addr   (_dataReadArb_io_out_bits_req_1_addr),
    .io_write_valid        (_dataWriteArb_io_out_valid),
    .io_write_bits_way_en  (_dataWriteArb_io_out_bits_way_en),
    .io_write_bits_addr    (_dataWriteArb_io_out_bits_addr),
    .io_write_bits_wmask   (_dataWriteArb_io_out_bits_wmask),
    .io_write_bits_data    (_dataWriteArb_io_out_bits_data),
    .io_resp_0_0           (_data_io_resp_0_0),
    .io_resp_0_1           (_data_io_resp_0_1),
    .io_resp_0_2           (_data_io_resp_0_2),
    .io_resp_0_3           (_data_io_resp_0_3),
    .io_resp_0_4           (_data_io_resp_0_4),
    .io_resp_0_5           (_data_io_resp_0_5),
    .io_resp_0_6           (_data_io_resp_0_6),
    .io_resp_0_7           (_data_io_resp_0_7),
    .io_resp_1_0           (_data_io_resp_1_0),
    .io_resp_1_1           (_data_io_resp_1_1),
    .io_resp_1_2           (_data_io_resp_1_2),
    .io_resp_1_3           (_data_io_resp_1_3),
    .io_resp_1_4           (_data_io_resp_1_4),
    .io_resp_1_5           (_data_io_resp_1_5),
    .io_resp_1_6           (_data_io_resp_1_6),
    .io_resp_1_7           (_data_io_resp_1_7)
  );
  Arbiter_11 dataWriteArb (
    .io_in_0_valid       (s3_valid),
    .io_in_0_bits_way_en (s3_way),
    .io_in_0_bits_addr   (s3_req_addr[11:0]),
    .io_in_0_bits_wmask  (2'h1 << s3_req_addr[3]),
    .io_in_0_bits_data   ({2{s3_req_data}}),
    .io_in_1_ready       (_dataWriteArb_io_in_1_ready),
    .io_in_1_valid       (_mshrs_io_refill_valid),
    .io_in_1_bits_way_en (_mshrs_io_refill_bits_way_en),
    .io_in_1_bits_addr   (_mshrs_io_refill_bits_addr),
    .io_in_1_bits_data   (_mshrs_io_refill_bits_data),
    .io_out_valid        (_dataWriteArb_io_out_valid),
    .io_out_bits_way_en  (_dataWriteArb_io_out_bits_way_en),
    .io_out_bits_addr    (_dataWriteArb_io_out_bits_addr),
    .io_out_bits_wmask   (_dataWriteArb_io_out_bits_wmask),
    .io_out_bits_data    (_dataWriteArb_io_out_bits_data)
  );
  Arbiter_12 dataReadArb (
    .io_in_0_valid             (_mshrs_io_replay_valid),
    .io_in_0_bits_req_0_way_en (_mshrs_io_replay_bits_way_en),
    .io_in_0_bits_req_0_addr   (_mshrs_io_replay_bits_addr[11:0]),
    .io_in_1_ready             (_dataReadArb_io_in_1_ready),
    .io_in_1_valid             (_wb_io_data_req_valid),
    .io_in_1_bits_req_0_way_en (_wb_io_data_req_bits_way_en),
    .io_in_1_bits_req_0_addr   (_wb_io_data_req_bits_addr),
    .io_in_2_ready             (_dataReadArb_io_in_2_ready),
    .io_in_2_valid             (io_lsu_req_valid),
    .io_in_2_bits_req_0_addr   (io_lsu_req_bits_0_bits_addr[11:0]),
    .io_in_2_bits_req_1_addr   (io_lsu_req_bits_1_bits_addr[11:0]),
    .io_in_2_bits_valid_0      (io_lsu_req_bits_0_valid),
    .io_in_2_bits_valid_1      (io_lsu_req_bits_1_valid),
    .io_out_valid              (_dataReadArb_io_out_valid),
    .io_out_bits_req_0_way_en  (_dataReadArb_io_out_bits_req_0_way_en),
    .io_out_bits_req_0_addr    (_dataReadArb_io_out_bits_req_0_addr),
    .io_out_bits_req_1_way_en  (_dataReadArb_io_out_bits_req_1_way_en),
    .io_out_bits_req_1_addr    (_dataReadArb_io_out_bits_req_1_addr),
    .io_out_bits_valid_0       (_dataReadArb_io_out_bits_valid_0),
    .io_out_bits_valid_1       (_dataReadArb_io_out_bits_valid_1)
  );
  MaxPeriodFibonacciLFSR lfsr_prng (
    .clock        (clock),
    .reset        (reset),
    .io_increment (_s2_send_resp_T_2 | _s2_send_resp_T_58),
    .io_out_0     (_lfsr_prng_io_out_0),
    .io_out_1     (_lfsr_prng_io_out_1),
    .io_out_2     (_lfsr_prng_io_out_2),
    .io_out_3     (/* unused */),
    .io_out_4     (/* unused */),
    .io_out_5     (/* unused */),
    .io_out_6     (/* unused */),
    .io_out_7     (/* unused */),
    .io_out_8     (/* unused */),
    .io_out_9     (/* unused */),
    .io_out_10    (/* unused */),
    .io_out_11    (/* unused */),
    .io_out_12    (/* unused */),
    .io_out_13    (/* unused */),
    .io_out_14    (/* unused */),
    .io_out_15    (/* unused */)
  );
  Arbiter_13 wbArb (
    .io_in_0_ready         (_wbArb_io_in_0_ready),
    .io_in_0_valid         (_prober_io_wb_req_valid),
    .io_in_0_bits_tag      (_prober_io_wb_req_bits_tag),
    .io_in_0_bits_idx      (_prober_io_wb_req_bits_idx),
    .io_in_0_bits_param    (_prober_io_wb_req_bits_param),
    .io_in_0_bits_way_en   (_prober_io_wb_req_bits_way_en),
    .io_in_1_ready         (_wbArb_io_in_1_ready),
    .io_in_1_valid         (_mshrs_io_wb_req_valid),
    .io_in_1_bits_tag      (_mshrs_io_wb_req_bits_tag),
    .io_in_1_bits_idx      (_mshrs_io_wb_req_bits_idx),
    .io_in_1_bits_param    (_mshrs_io_wb_req_bits_param),
    .io_in_1_bits_way_en   (_mshrs_io_wb_req_bits_way_en),
    .io_out_ready          (_wb_io_req_ready),
    .io_out_valid          (_wbArb_io_out_valid),
    .io_out_bits_tag       (_wbArb_io_out_bits_tag),
    .io_out_bits_idx       (_wbArb_io_out_bits_idx),
    .io_out_bits_param     (_wbArb_io_out_bits_param),
    .io_out_bits_way_en    (_wbArb_io_out_bits_way_en),
    .io_out_bits_voluntary (_wbArb_io_out_bits_voluntary)
  );
  Arbiter_14 lsu_release_arb (
    .io_in_0_ready        (_lsu_release_arb_io_in_0_ready),
    .io_in_0_valid        (_wb_io_lsu_release_valid),
    .io_in_0_bits_address (_wb_io_lsu_release_bits_address),
    .io_in_1_ready        (_lsu_release_arb_io_in_1_ready),
    .io_in_1_valid        (_prober_io_lsu_release_valid),
    .io_in_1_bits_address (_prober_io_lsu_release_bits_address),
    .io_out_ready         (io_lsu_release_ready),
    .io_out_valid         (io_lsu_release_valid),
    .io_out_bits_address  (io_lsu_release_bits_address)
  );
  AMOALU amoalu (
    .io_mask ({(s2_req_0_addr[2] ? _amoalu_io_mask_T_1 : 4'h0) | {4{&size}}, s2_req_0_addr[2] ? 4'h0 : _amoalu_io_mask_T_1}),
    .io_cmd  (s2_req_0_uop_mem_cmd),
    .io_lhs  (s2_data_word_0),
    .io_rhs  (s2_req_0_data),
    .io_out  (_amoalu_io_out)
  );
  assign auto_out_b_ready = _prober_io_req_ready & ~(|(lrsc_count[6:2]));
  assign auto_out_c_valid = nodeOut_c_valid;
  assign auto_out_c_bits_opcode = (muxState_0 ? _wb_io_release_bits_opcode : 3'h0) | {muxState_1, 2'h0};
  assign auto_out_c_bits_param = (muxState_0 ? _wb_io_release_bits_param : 3'h0) | (muxState_1 ? _prober_io_rep_bits_param : 3'h0);
  assign auto_out_c_bits_size = (muxState_0 ? 4'h6 : 4'h0) | (muxState_1 ? _prober_io_rep_bits_size : 4'h0);
  assign auto_out_c_bits_source = {muxState_0, 3'h0} | (muxState_1 ? _prober_io_rep_bits_source : 4'h0);
  assign auto_out_c_bits_address = (muxState_0 ? _wb_io_release_bits_address : 33'h0) | (muxState_1 ? _prober_io_rep_bits_address : 33'h0);
  assign auto_out_c_bits_data = muxState_0 ? _wb_io_release_bits_data : 128'h0;
  assign auto_out_d_ready = nodeOut_d_ready;
  assign io_lsu_req_ready = _io_lsu_req_ready_output;
  assign io_lsu_resp_0_valid = (cache_resp_0_valid ? cache_resp_0_valid : _mshrs_io_resp_valid) & ~(io_lsu_exception & io_lsu_resp_0_bits_out_uop_uses_ldq) & (io_lsu_brupdate_b1_mispredict_mask & (cache_resp_0_valid ? s2_req_0_uop_br_mask : _mshrs_io_resp_bits_uop_br_mask)) == 20'h0;
  assign io_lsu_resp_0_bits_uop_ldq_idx = cache_resp_0_valid ? s2_req_0_uop_ldq_idx : _mshrs_io_resp_bits_uop_ldq_idx;
  assign io_lsu_resp_0_bits_uop_stq_idx = cache_resp_0_valid ? s2_req_0_uop_stq_idx : _mshrs_io_resp_bits_uop_stq_idx;
  assign io_lsu_resp_0_bits_uop_is_amo = cache_resp_0_valid ? s2_req_0_uop_is_amo : _mshrs_io_resp_bits_uop_is_amo;
  assign io_lsu_resp_0_bits_uop_uses_ldq = io_lsu_resp_0_bits_out_uop_uses_ldq;
  assign io_lsu_resp_0_bits_uop_uses_stq = cache_resp_0_valid ? s2_req_0_uop_uses_stq : _mshrs_io_resp_bits_uop_uses_stq;
  assign io_lsu_resp_0_bits_data = cache_resp_0_valid ? {size == 2'h0 | s2_sc ? {56{s2_req_0_uop_mem_signed & cache_resp_0_bits_data_zeroed_2[7]}} : {size == 2'h1 ? {48{s2_req_0_uop_mem_signed & cache_resp_0_bits_data_zeroed_1[15]}} : {size == 2'h2 ? {32{s2_req_0_uop_mem_signed & cache_resp_0_bits_data_zeroed[31]}} : s2_data_word_0[63:32], cache_resp_0_bits_data_zeroed[31:16]}, cache_resp_0_bits_data_zeroed_1[15:8]}, cache_resp_0_bits_data_zeroed_2[7:1], cache_resp_0_bits_data_zeroed_2[0] | s2_sc_fail} : _mshrs_io_resp_bits_data;
  assign io_lsu_resp_0_bits_is_hella = cache_resp_0_valid ? s2_req_0_is_hella : _mshrs_io_resp_bits_is_hella;
  assign io_lsu_resp_1_valid = (uncache_respond_1 ? _mshrs_io_resp_valid : cache_resp_1_valid) & ~(io_lsu_exception & io_lsu_resp_1_bits_out_uop_uses_ldq) & (io_lsu_brupdate_b1_mispredict_mask & (uncache_respond_1 ? _mshrs_io_resp_bits_uop_br_mask : s2_req_1_uop_br_mask)) == 20'h0;
  assign io_lsu_resp_1_bits_uop_ldq_idx = uncache_respond_1 ? _mshrs_io_resp_bits_uop_ldq_idx : s2_req_1_uop_ldq_idx;
  assign io_lsu_resp_1_bits_uop_stq_idx = uncache_respond_1 ? _mshrs_io_resp_bits_uop_stq_idx : s2_req_1_uop_stq_idx;
  assign io_lsu_resp_1_bits_uop_is_amo = uncache_respond_1 ? _mshrs_io_resp_bits_uop_is_amo : s2_req_1_uop_is_amo;
  assign io_lsu_resp_1_bits_uop_uses_ldq = io_lsu_resp_1_bits_out_uop_uses_ldq;
  assign io_lsu_resp_1_bits_uop_uses_stq = uncache_respond_1 ? _mshrs_io_resp_bits_uop_uses_stq : s2_req_1_uop_uses_stq;
  assign io_lsu_resp_1_bits_data = uncache_respond_1 ? _mshrs_io_resp_bits_data : {size_1 == 2'h0 ? {56{s2_req_1_uop_mem_signed & cache_resp_1_bits_data_zeroed_2[7]}} : {size_1 == 2'h1 ? {48{s2_req_1_uop_mem_signed & cache_resp_1_bits_data_zeroed_1[15]}} : {size_1 == 2'h2 ? {32{s2_req_1_uop_mem_signed & cache_resp_1_bits_data_zeroed[31]}} : s2_data_word_1[63:32], cache_resp_1_bits_data_zeroed[31:16]}, cache_resp_1_bits_data_zeroed_1[15:8]}, cache_resp_1_bits_data_zeroed_2[7:1], cache_resp_1_bits_data_zeroed_2[0] | s2_sc_fail};
  assign io_lsu_resp_1_bits_is_hella = uncache_respond_1 ? _mshrs_io_resp_bits_is_hella : s2_req_1_is_hella;
  assign io_lsu_nack_0_valid = _io_lsu_nack_0_valid_output;
  assign io_lsu_nack_0_bits_uop_ldq_idx = s2_req_0_uop_ldq_idx;
  assign io_lsu_nack_0_bits_uop_stq_idx = s2_req_0_uop_stq_idx;
  assign io_lsu_nack_0_bits_uop_uses_ldq = s2_req_0_uop_uses_ldq;
  assign io_lsu_nack_0_bits_uop_uses_stq = s2_req_0_uop_uses_stq;
  assign io_lsu_nack_0_bits_is_hella = s2_req_0_is_hella;
  assign io_lsu_nack_1_valid = _io_lsu_nack_1_valid_output;
  assign io_lsu_nack_1_bits_uop_ldq_idx = s2_req_1_uop_ldq_idx;
  assign io_lsu_nack_1_bits_uop_stq_idx = s2_req_1_uop_stq_idx;
  assign io_lsu_nack_1_bits_uop_uses_ldq = s2_req_1_uop_uses_ldq;
  assign io_lsu_nack_1_bits_uop_uses_stq = s2_req_1_uop_uses_stq;
  assign io_lsu_nack_1_bits_is_hella = s2_req_1_is_hella;
  assign io_lsu_ordered = _mshrs_io_fence_rdy & ~(s1_valid_REG | s1_valid_REG_1) & ~(s2_valid_REG | s2_valid_REG_1);
endmodule

