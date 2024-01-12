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

module BoomMSHR(
  input          clock,
                 reset,
  input  [2:0]   io_id,
  input          io_req_pri_val,
  output         io_req_pri_rdy,
  input          io_req_sec_val,
  output         io_req_sec_rdy,
  input          io_clear_prefetch,
  input  [19:0]  io_brupdate_b1_resolve_mask,
                 io_brupdate_b1_mispredict_mask,
  input          io_exception,
  input  [6:0]   io_req_uop_uopc,
  input  [31:0]  io_req_uop_inst,
                 io_req_uop_debug_inst,
  input          io_req_uop_is_rvc,
  input  [39:0]  io_req_uop_debug_pc,
  input  [2:0]   io_req_uop_iq_type,
  input  [9:0]   io_req_uop_fu_code,
  input  [3:0]   io_req_uop_ctrl_br_type,
  input  [1:0]   io_req_uop_ctrl_op1_sel,
  input  [2:0]   io_req_uop_ctrl_op2_sel,
                 io_req_uop_ctrl_imm_sel,
  input  [3:0]   io_req_uop_ctrl_op_fcn,
  input          io_req_uop_ctrl_fcn_dw,
  input  [2:0]   io_req_uop_ctrl_csr_cmd,
  input          io_req_uop_ctrl_is_load,
                 io_req_uop_ctrl_is_sta,
                 io_req_uop_ctrl_is_std,
  input  [1:0]   io_req_uop_iw_state,
  input          io_req_uop_iw_p1_poisoned,
                 io_req_uop_iw_p2_poisoned,
                 io_req_uop_is_br,
                 io_req_uop_is_jalr,
                 io_req_uop_is_jal,
                 io_req_uop_is_sfb,
  input  [19:0]  io_req_uop_br_mask,
  input  [4:0]   io_req_uop_br_tag,
  input  [5:0]   io_req_uop_ftq_idx,
  input          io_req_uop_edge_inst,
  input  [5:0]   io_req_uop_pc_lob,
  input          io_req_uop_taken,
  input  [19:0]  io_req_uop_imm_packed,
  input  [11:0]  io_req_uop_csr_addr,
  input  [6:0]   io_req_uop_rob_idx,
  input  [4:0]   io_req_uop_ldq_idx,
                 io_req_uop_stq_idx,
  input  [1:0]   io_req_uop_rxq_idx,
  input  [6:0]   io_req_uop_pdst,
                 io_req_uop_prs1,
                 io_req_uop_prs2,
                 io_req_uop_prs3,
  input  [5:0]   io_req_uop_ppred,
  input          io_req_uop_prs1_busy,
                 io_req_uop_prs2_busy,
                 io_req_uop_prs3_busy,
                 io_req_uop_ppred_busy,
  input  [6:0]   io_req_uop_stale_pdst,
  input          io_req_uop_exception,
  input  [63:0]  io_req_uop_exc_cause,
  input          io_req_uop_bypassable,
  input  [4:0]   io_req_uop_mem_cmd,
  input  [1:0]   io_req_uop_mem_size,
  input          io_req_uop_mem_signed,
                 io_req_uop_is_fence,
                 io_req_uop_is_fencei,
                 io_req_uop_is_amo,
                 io_req_uop_uses_ldq,
                 io_req_uop_uses_stq,
                 io_req_uop_is_sys_pc2epc,
                 io_req_uop_is_unique,
                 io_req_uop_flush_on_commit,
                 io_req_uop_ldst_is_rs1,
  input  [5:0]   io_req_uop_ldst,
                 io_req_uop_lrs1,
                 io_req_uop_lrs2,
                 io_req_uop_lrs3,
  input          io_req_uop_ldst_val,
  input  [1:0]   io_req_uop_dst_rtype,
                 io_req_uop_lrs1_rtype,
                 io_req_uop_lrs2_rtype,
  input          io_req_uop_frs3_en,
                 io_req_uop_fp_val,
                 io_req_uop_fp_single,
                 io_req_uop_xcpt_pf_if,
                 io_req_uop_xcpt_ae_if,
                 io_req_uop_xcpt_ma_if,
                 io_req_uop_bp_debug_if,
                 io_req_uop_bp_xcpt_if,
  input  [1:0]   io_req_uop_debug_fsrc,
                 io_req_uop_debug_tsrc,
  input  [39:0]  io_req_addr,
  input  [63:0]  io_req_data,
  input          io_req_is_hella,
                 io_req_tag_match,
  input  [1:0]   io_req_old_meta_coh_state,
  input  [20:0]  io_req_old_meta_tag,
  input  [7:0]   io_req_way_en,
  input  [4:0]   io_req_sdq_id,
  input          io_req_is_probe,
  output         io_idx_valid,
  output [5:0]   io_idx_bits,
  output         io_way_valid,
  output [7:0]   io_way_bits,
  output         io_tag_valid,
  output [27:0]  io_tag_bits,
  input          io_mem_acquire_ready,
  output         io_mem_acquire_valid,
  output [2:0]   io_mem_acquire_bits_param,
  output [3:0]   io_mem_acquire_bits_source,
  output [32:0]  io_mem_acquire_bits_address,
  output         io_mem_grant_ready,
  input          io_mem_grant_valid,
  input  [2:0]   io_mem_grant_bits_opcode,
  input  [1:0]   io_mem_grant_bits_param,
  input  [3:0]   io_mem_grant_bits_size,
  input  [1:0]   io_mem_grant_bits_sink,
  input  [127:0] io_mem_grant_bits_data,
  input          io_mem_finish_ready,
  output         io_mem_finish_valid,
  output [1:0]   io_mem_finish_bits_sink,
  input          io_prober_state_valid,
  input  [39:0]  io_prober_state_bits,
  input          io_refill_ready,
  output         io_refill_valid,
  output [7:0]   io_refill_bits_way_en,
  output [11:0]  io_refill_bits_addr,
  output [127:0] io_refill_bits_data,
  input          io_meta_write_ready,
  output         io_meta_write_valid,
  output [5:0]   io_meta_write_bits_idx,
  output [7:0]   io_meta_write_bits_way_en,
  output [1:0]   io_meta_write_bits_data_coh_state,
  output [20:0]  io_meta_write_bits_data_tag,
  input          io_meta_read_ready,
  output         io_meta_read_valid,
  output [5:0]   io_meta_read_bits_idx,
  output [7:0]   io_meta_read_bits_way_en,
  output [20:0]  io_meta_read_bits_tag,
  input          io_meta_resp_valid,
  input  [1:0]   io_meta_resp_bits_coh_state,
  input          io_wb_req_ready,
  output         io_wb_req_valid,
  output [20:0]  io_wb_req_bits_tag,
  output [5:0]   io_wb_req_bits_idx,
  output [2:0]   io_wb_req_bits_param,
  output [7:0]   io_wb_req_bits_way_en,
  output         io_commit_val,
  output [39:0]  io_commit_addr,
  output [1:0]   io_commit_coh_state,
  input          io_lb_read_ready,
  output         io_lb_read_valid,
  output [2:0]   io_lb_read_bits_id,
  output [1:0]   io_lb_read_bits_offset,
  input  [127:0] io_lb_resp,
  input          io_lb_write_ready,
  output         io_lb_write_valid,
  output [2:0]   io_lb_write_bits_id,
  output [1:0]   io_lb_write_bits_offset,
  output [127:0] io_lb_write_bits_data,
  input          io_replay_ready,
  output         io_replay_valid,
  output [6:0]   io_replay_bits_uop_uopc,
  output [31:0]  io_replay_bits_uop_inst,
                 io_replay_bits_uop_debug_inst,
  output         io_replay_bits_uop_is_rvc,
  output [39:0]  io_replay_bits_uop_debug_pc,
  output [2:0]   io_replay_bits_uop_iq_type,
  output [9:0]   io_replay_bits_uop_fu_code,
  output [3:0]   io_replay_bits_uop_ctrl_br_type,
  output [1:0]   io_replay_bits_uop_ctrl_op1_sel,
  output [2:0]   io_replay_bits_uop_ctrl_op2_sel,
                 io_replay_bits_uop_ctrl_imm_sel,
  output [3:0]   io_replay_bits_uop_ctrl_op_fcn,
  output         io_replay_bits_uop_ctrl_fcn_dw,
  output [2:0]   io_replay_bits_uop_ctrl_csr_cmd,
  output         io_replay_bits_uop_ctrl_is_load,
                 io_replay_bits_uop_ctrl_is_sta,
                 io_replay_bits_uop_ctrl_is_std,
  output [1:0]   io_replay_bits_uop_iw_state,
  output         io_replay_bits_uop_iw_p1_poisoned,
                 io_replay_bits_uop_iw_p2_poisoned,
                 io_replay_bits_uop_is_br,
                 io_replay_bits_uop_is_jalr,
                 io_replay_bits_uop_is_jal,
                 io_replay_bits_uop_is_sfb,
  output [19:0]  io_replay_bits_uop_br_mask,
  output [4:0]   io_replay_bits_uop_br_tag,
  output [5:0]   io_replay_bits_uop_ftq_idx,
  output         io_replay_bits_uop_edge_inst,
  output [5:0]   io_replay_bits_uop_pc_lob,
  output         io_replay_bits_uop_taken,
  output [19:0]  io_replay_bits_uop_imm_packed,
  output [11:0]  io_replay_bits_uop_csr_addr,
  output [6:0]   io_replay_bits_uop_rob_idx,
  output [4:0]   io_replay_bits_uop_ldq_idx,
                 io_replay_bits_uop_stq_idx,
  output [1:0]   io_replay_bits_uop_rxq_idx,
  output [6:0]   io_replay_bits_uop_pdst,
                 io_replay_bits_uop_prs1,
                 io_replay_bits_uop_prs2,
                 io_replay_bits_uop_prs3,
  output [5:0]   io_replay_bits_uop_ppred,
  output         io_replay_bits_uop_prs1_busy,
                 io_replay_bits_uop_prs2_busy,
                 io_replay_bits_uop_prs3_busy,
                 io_replay_bits_uop_ppred_busy,
  output [6:0]   io_replay_bits_uop_stale_pdst,
  output         io_replay_bits_uop_exception,
  output [63:0]  io_replay_bits_uop_exc_cause,
  output         io_replay_bits_uop_bypassable,
  output [4:0]   io_replay_bits_uop_mem_cmd,
  output [1:0]   io_replay_bits_uop_mem_size,
  output         io_replay_bits_uop_mem_signed,
                 io_replay_bits_uop_is_fence,
                 io_replay_bits_uop_is_fencei,
                 io_replay_bits_uop_is_amo,
                 io_replay_bits_uop_uses_ldq,
                 io_replay_bits_uop_uses_stq,
                 io_replay_bits_uop_is_sys_pc2epc,
                 io_replay_bits_uop_is_unique,
                 io_replay_bits_uop_flush_on_commit,
                 io_replay_bits_uop_ldst_is_rs1,
  output [5:0]   io_replay_bits_uop_ldst,
                 io_replay_bits_uop_lrs1,
                 io_replay_bits_uop_lrs2,
                 io_replay_bits_uop_lrs3,
  output         io_replay_bits_uop_ldst_val,
  output [1:0]   io_replay_bits_uop_dst_rtype,
                 io_replay_bits_uop_lrs1_rtype,
                 io_replay_bits_uop_lrs2_rtype,
  output         io_replay_bits_uop_frs3_en,
                 io_replay_bits_uop_fp_val,
                 io_replay_bits_uop_fp_single,
                 io_replay_bits_uop_xcpt_pf_if,
                 io_replay_bits_uop_xcpt_ae_if,
                 io_replay_bits_uop_xcpt_ma_if,
                 io_replay_bits_uop_bp_debug_if,
                 io_replay_bits_uop_bp_xcpt_if,
  output [1:0]   io_replay_bits_uop_debug_fsrc,
                 io_replay_bits_uop_debug_tsrc,
  output [39:0]  io_replay_bits_addr,
  output         io_replay_bits_is_hella,
  output [7:0]   io_replay_bits_way_en,
  output [4:0]   io_replay_bits_sdq_id,
  input          io_resp_ready,
  output         io_resp_valid,
  output [6:0]   io_resp_bits_uop_uopc,
  output [31:0]  io_resp_bits_uop_inst,
                 io_resp_bits_uop_debug_inst,
  output         io_resp_bits_uop_is_rvc,
  output [39:0]  io_resp_bits_uop_debug_pc,
  output [2:0]   io_resp_bits_uop_iq_type,
  output [9:0]   io_resp_bits_uop_fu_code,
  output [3:0]   io_resp_bits_uop_ctrl_br_type,
  output [1:0]   io_resp_bits_uop_ctrl_op1_sel,
  output [2:0]   io_resp_bits_uop_ctrl_op2_sel,
                 io_resp_bits_uop_ctrl_imm_sel,
  output [3:0]   io_resp_bits_uop_ctrl_op_fcn,
  output         io_resp_bits_uop_ctrl_fcn_dw,
  output [2:0]   io_resp_bits_uop_ctrl_csr_cmd,
  output         io_resp_bits_uop_ctrl_is_load,
                 io_resp_bits_uop_ctrl_is_sta,
                 io_resp_bits_uop_ctrl_is_std,
  output [1:0]   io_resp_bits_uop_iw_state,
  output         io_resp_bits_uop_iw_p1_poisoned,
                 io_resp_bits_uop_iw_p2_poisoned,
                 io_resp_bits_uop_is_br,
                 io_resp_bits_uop_is_jalr,
                 io_resp_bits_uop_is_jal,
                 io_resp_bits_uop_is_sfb,
  output [19:0]  io_resp_bits_uop_br_mask,
  output [4:0]   io_resp_bits_uop_br_tag,
  output [5:0]   io_resp_bits_uop_ftq_idx,
  output         io_resp_bits_uop_edge_inst,
  output [5:0]   io_resp_bits_uop_pc_lob,
  output         io_resp_bits_uop_taken,
  output [19:0]  io_resp_bits_uop_imm_packed,
  output [11:0]  io_resp_bits_uop_csr_addr,
  output [6:0]   io_resp_bits_uop_rob_idx,
  output [4:0]   io_resp_bits_uop_ldq_idx,
                 io_resp_bits_uop_stq_idx,
  output [1:0]   io_resp_bits_uop_rxq_idx,
  output [6:0]   io_resp_bits_uop_pdst,
                 io_resp_bits_uop_prs1,
                 io_resp_bits_uop_prs2,
                 io_resp_bits_uop_prs3,
  output [5:0]   io_resp_bits_uop_ppred,
  output         io_resp_bits_uop_prs1_busy,
                 io_resp_bits_uop_prs2_busy,
                 io_resp_bits_uop_prs3_busy,
                 io_resp_bits_uop_ppred_busy,
  output [6:0]   io_resp_bits_uop_stale_pdst,
  output         io_resp_bits_uop_exception,
  output [63:0]  io_resp_bits_uop_exc_cause,
  output         io_resp_bits_uop_bypassable,
  output [4:0]   io_resp_bits_uop_mem_cmd,
  output [1:0]   io_resp_bits_uop_mem_size,
  output         io_resp_bits_uop_mem_signed,
                 io_resp_bits_uop_is_fence,
                 io_resp_bits_uop_is_fencei,
                 io_resp_bits_uop_is_amo,
                 io_resp_bits_uop_uses_ldq,
                 io_resp_bits_uop_uses_stq,
                 io_resp_bits_uop_is_sys_pc2epc,
                 io_resp_bits_uop_is_unique,
                 io_resp_bits_uop_flush_on_commit,
                 io_resp_bits_uop_ldst_is_rs1,
  output [5:0]   io_resp_bits_uop_ldst,
                 io_resp_bits_uop_lrs1,
                 io_resp_bits_uop_lrs2,
                 io_resp_bits_uop_lrs3,
  output         io_resp_bits_uop_ldst_val,
  output [1:0]   io_resp_bits_uop_dst_rtype,
                 io_resp_bits_uop_lrs1_rtype,
                 io_resp_bits_uop_lrs2_rtype,
  output         io_resp_bits_uop_frs3_en,
                 io_resp_bits_uop_fp_val,
                 io_resp_bits_uop_fp_single,
                 io_resp_bits_uop_xcpt_pf_if,
                 io_resp_bits_uop_xcpt_ae_if,
                 io_resp_bits_uop_xcpt_ma_if,
                 io_resp_bits_uop_bp_debug_if,
                 io_resp_bits_uop_bp_xcpt_if,
  output [1:0]   io_resp_bits_uop_debug_fsrc,
                 io_resp_bits_uop_debug_tsrc,
  output [63:0]  io_resp_bits_data,
  output         io_resp_bits_is_hella,
  input          io_wb_resp,
  output         io_probe_rdy
);

  wire         _io_req_pri_rdy_output;
  wire         _GEN;
  wire         _io_lb_read_valid_output;
  wire         _io_mem_grant_ready_output;
  wire         _io_req_sec_rdy_output;
  wire         _rpq_io_enq_ready;
  wire         _rpq_io_deq_valid;
  wire [6:0]   _rpq_io_deq_bits_uop_uopc;
  wire [31:0]  _rpq_io_deq_bits_uop_inst;
  wire [31:0]  _rpq_io_deq_bits_uop_debug_inst;
  wire         _rpq_io_deq_bits_uop_is_rvc;
  wire [39:0]  _rpq_io_deq_bits_uop_debug_pc;
  wire [2:0]   _rpq_io_deq_bits_uop_iq_type;
  wire [9:0]   _rpq_io_deq_bits_uop_fu_code;
  wire [3:0]   _rpq_io_deq_bits_uop_ctrl_br_type;
  wire [1:0]   _rpq_io_deq_bits_uop_ctrl_op1_sel;
  wire [2:0]   _rpq_io_deq_bits_uop_ctrl_op2_sel;
  wire [2:0]   _rpq_io_deq_bits_uop_ctrl_imm_sel;
  wire [3:0]   _rpq_io_deq_bits_uop_ctrl_op_fcn;
  wire         _rpq_io_deq_bits_uop_ctrl_fcn_dw;
  wire [2:0]   _rpq_io_deq_bits_uop_ctrl_csr_cmd;
  wire         _rpq_io_deq_bits_uop_ctrl_is_load;
  wire         _rpq_io_deq_bits_uop_ctrl_is_sta;
  wire         _rpq_io_deq_bits_uop_ctrl_is_std;
  wire [1:0]   _rpq_io_deq_bits_uop_iw_state;
  wire         _rpq_io_deq_bits_uop_iw_p1_poisoned;
  wire         _rpq_io_deq_bits_uop_iw_p2_poisoned;
  wire         _rpq_io_deq_bits_uop_is_br;
  wire         _rpq_io_deq_bits_uop_is_jalr;
  wire         _rpq_io_deq_bits_uop_is_jal;
  wire         _rpq_io_deq_bits_uop_is_sfb;
  wire [19:0]  _rpq_io_deq_bits_uop_br_mask;
  wire [4:0]   _rpq_io_deq_bits_uop_br_tag;
  wire [5:0]   _rpq_io_deq_bits_uop_ftq_idx;
  wire         _rpq_io_deq_bits_uop_edge_inst;
  wire [5:0]   _rpq_io_deq_bits_uop_pc_lob;
  wire         _rpq_io_deq_bits_uop_taken;
  wire [19:0]  _rpq_io_deq_bits_uop_imm_packed;
  wire [11:0]  _rpq_io_deq_bits_uop_csr_addr;
  wire [6:0]   _rpq_io_deq_bits_uop_rob_idx;
  wire [4:0]   _rpq_io_deq_bits_uop_ldq_idx;
  wire [4:0]   _rpq_io_deq_bits_uop_stq_idx;
  wire [1:0]   _rpq_io_deq_bits_uop_rxq_idx;
  wire [6:0]   _rpq_io_deq_bits_uop_pdst;
  wire [6:0]   _rpq_io_deq_bits_uop_prs1;
  wire [6:0]   _rpq_io_deq_bits_uop_prs2;
  wire [6:0]   _rpq_io_deq_bits_uop_prs3;
  wire [5:0]   _rpq_io_deq_bits_uop_ppred;
  wire         _rpq_io_deq_bits_uop_prs1_busy;
  wire         _rpq_io_deq_bits_uop_prs2_busy;
  wire         _rpq_io_deq_bits_uop_prs3_busy;
  wire         _rpq_io_deq_bits_uop_ppred_busy;
  wire [6:0]   _rpq_io_deq_bits_uop_stale_pdst;
  wire         _rpq_io_deq_bits_uop_exception;
  wire [63:0]  _rpq_io_deq_bits_uop_exc_cause;
  wire         _rpq_io_deq_bits_uop_bypassable;
  wire [4:0]   _rpq_io_deq_bits_uop_mem_cmd;
  wire [1:0]   _rpq_io_deq_bits_uop_mem_size;
  wire         _rpq_io_deq_bits_uop_mem_signed;
  wire         _rpq_io_deq_bits_uop_is_fence;
  wire         _rpq_io_deq_bits_uop_is_fencei;
  wire         _rpq_io_deq_bits_uop_is_amo;
  wire         _rpq_io_deq_bits_uop_uses_ldq;
  wire         _rpq_io_deq_bits_uop_uses_stq;
  wire         _rpq_io_deq_bits_uop_is_sys_pc2epc;
  wire         _rpq_io_deq_bits_uop_is_unique;
  wire         _rpq_io_deq_bits_uop_flush_on_commit;
  wire         _rpq_io_deq_bits_uop_ldst_is_rs1;
  wire [5:0]   _rpq_io_deq_bits_uop_ldst;
  wire [5:0]   _rpq_io_deq_bits_uop_lrs1;
  wire [5:0]   _rpq_io_deq_bits_uop_lrs2;
  wire [5:0]   _rpq_io_deq_bits_uop_lrs3;
  wire         _rpq_io_deq_bits_uop_ldst_val;
  wire [1:0]   _rpq_io_deq_bits_uop_dst_rtype;
  wire [1:0]   _rpq_io_deq_bits_uop_lrs1_rtype;
  wire [1:0]   _rpq_io_deq_bits_uop_lrs2_rtype;
  wire         _rpq_io_deq_bits_uop_frs3_en;
  wire         _rpq_io_deq_bits_uop_fp_val;
  wire         _rpq_io_deq_bits_uop_fp_single;
  wire         _rpq_io_deq_bits_uop_xcpt_pf_if;
  wire         _rpq_io_deq_bits_uop_xcpt_ae_if;
  wire         _rpq_io_deq_bits_uop_xcpt_ma_if;
  wire         _rpq_io_deq_bits_uop_bp_debug_if;
  wire         _rpq_io_deq_bits_uop_bp_xcpt_if;
  wire [1:0]   _rpq_io_deq_bits_uop_debug_fsrc;
  wire [1:0]   _rpq_io_deq_bits_uop_debug_tsrc;
  wire [39:0]  _rpq_io_deq_bits_addr;
  wire         _rpq_io_deq_bits_is_hella;
  wire         _rpq_io_empty;
  reg  [4:0]   state;
  reg  [4:0]   req_uop_mem_cmd;
  reg  [39:0]  req_addr;
  reg  [1:0]   req_old_meta_coh_state;
  reg  [20:0]  req_old_meta_tag;
  reg  [7:0]   req_way_en;
  reg          req_needs_wb;
  reg  [1:0]   new_coh_state;
  wire         _needs_second_acq_T_27 = req_uop_mem_cmd == 5'h1;
  wire         _needs_second_acq_T_28 = req_uop_mem_cmd == 5'h11;
  wire         _needs_second_acq_T_30 = req_uop_mem_cmd == 5'h7;
  wire         _needs_second_acq_T_32 = req_uop_mem_cmd == 5'h4;
  wire         _needs_second_acq_T_33 = req_uop_mem_cmd == 5'h9;
  wire         _needs_second_acq_T_34 = req_uop_mem_cmd == 5'hA;
  wire         _needs_second_acq_T_35 = req_uop_mem_cmd == 5'hB;
  wire         _needs_second_acq_T_39 = req_uop_mem_cmd == 5'h8;
  wire         _needs_second_acq_T_40 = req_uop_mem_cmd == 5'hC;
  wire         _needs_second_acq_T_41 = req_uop_mem_cmd == 5'hD;
  wire         _needs_second_acq_T_42 = req_uop_mem_cmd == 5'hE;
  wire         _needs_second_acq_T_43 = req_uop_mem_cmd == 5'hF;
  wire         _needs_second_acq_T_50 = req_uop_mem_cmd == 5'h3;
  wire         _needs_second_acq_T_52 = req_uop_mem_cmd == 5'h6;
  reg  [1:0]   casez_tmp;
  wire [3:0]   _grow_param_T = {_needs_second_acq_T_27 | _needs_second_acq_T_28 | _needs_second_acq_T_30 | _needs_second_acq_T_32 | _needs_second_acq_T_33 | _needs_second_acq_T_34 | _needs_second_acq_T_35 | _needs_second_acq_T_39 | _needs_second_acq_T_40 | _needs_second_acq_T_41 | _needs_second_acq_T_42 | _needs_second_acq_T_43, _needs_second_acq_T_27 | _needs_second_acq_T_28 | _needs_second_acq_T_30 | _needs_second_acq_T_32 | _needs_second_acq_T_33 | _needs_second_acq_T_34 | _needs_second_acq_T_35 | _needs_second_acq_T_39 | _needs_second_acq_T_40 | _needs_second_acq_T_41 | _needs_second_acq_T_42 | _needs_second_acq_T_43 | _needs_second_acq_T_50 | _needs_second_acq_T_52, new_coh_state};
  wire [1:0]   _grow_param_T_27 = {1'h0, _grow_param_T == 4'hC};
  always @(*) begin
    casez (_grow_param_T)
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
        casez_tmp = _grow_param_T_27;
      4'b1001:
        casez_tmp = _grow_param_T_27;
      4'b1010:
        casez_tmp = _grow_param_T_27;
      4'b1011:
        casez_tmp = _grow_param_T_27;
      4'b1100:
        casez_tmp = _grow_param_T_27;
      4'b1101:
        casez_tmp = 2'h2;
      4'b1110:
        casez_tmp = 2'h3;
      default:
        casez_tmp = 2'h3;
    endcase
  end // always @(*)
  wire [3:0]   _coh_on_grant_T = {_needs_second_acq_T_27 | _needs_second_acq_T_28 | _needs_second_acq_T_30 | _needs_second_acq_T_32 | _needs_second_acq_T_33 | _needs_second_acq_T_34 | _needs_second_acq_T_35 | _needs_second_acq_T_39 | _needs_second_acq_T_40 | _needs_second_acq_T_41 | _needs_second_acq_T_42 | _needs_second_acq_T_43, _needs_second_acq_T_27 | _needs_second_acq_T_28 | _needs_second_acq_T_30 | _needs_second_acq_T_32 | _needs_second_acq_T_33 | _needs_second_acq_T_34 | _needs_second_acq_T_35 | _needs_second_acq_T_39 | _needs_second_acq_T_40 | _needs_second_acq_T_41 | _needs_second_acq_T_42 | _needs_second_acq_T_43 | _needs_second_acq_T_50 | _needs_second_acq_T_52, io_mem_grant_bits_param};
  wire [1:0]   coh_on_grant_state = _coh_on_grant_T == 4'hC ? 2'h3 : _coh_on_grant_T == 4'h4 | _coh_on_grant_T == 4'h0 ? 2'h2 : {1'h0, _coh_on_grant_T == 4'h1};
  wire [3:0]   _GEN_0 = {_needs_second_acq_T_27 | _needs_second_acq_T_28 | _needs_second_acq_T_30 | _needs_second_acq_T_32 | _needs_second_acq_T_33 | _needs_second_acq_T_34 | _needs_second_acq_T_35 | _needs_second_acq_T_39 | _needs_second_acq_T_40 | _needs_second_acq_T_41 | _needs_second_acq_T_42 | _needs_second_acq_T_43, _needs_second_acq_T_27 | _needs_second_acq_T_28 | _needs_second_acq_T_30 | _needs_second_acq_T_32 | _needs_second_acq_T_33 | _needs_second_acq_T_34 | _needs_second_acq_T_35 | _needs_second_acq_T_39 | _needs_second_acq_T_40 | _needs_second_acq_T_41 | _needs_second_acq_T_42 | _needs_second_acq_T_43 | _needs_second_acq_T_50 | _needs_second_acq_T_52, new_coh_state};
  reg  [1:0]   casez_tmp_0;
  wire [1:0]   _GEN_1 = {1'h0, _GEN_0 == 4'hC};
  always @(*) begin
    casez (_GEN_0)
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
        casez_tmp_0 = _GEN_1;
      4'b1001:
        casez_tmp_0 = _GEN_1;
      4'b1010:
        casez_tmp_0 = _GEN_1;
      4'b1011:
        casez_tmp_0 = _GEN_1;
      4'b1100:
        casez_tmp_0 = _GEN_1;
      4'b1101:
        casez_tmp_0 = 2'h2;
      4'b1110:
        casez_tmp_0 = 2'h3;
      default:
        casez_tmp_0 = 2'h3;
    endcase
  end // always @(*)
  wire         _state_T_157 = io_req_uop_mem_cmd == 5'h1;
  wire         _state_T_158 = io_req_uop_mem_cmd == 5'h11;
  wire         _state_T_160 = io_req_uop_mem_cmd == 5'h7;
  wire         _state_T_162 = io_req_uop_mem_cmd == 5'h4;
  wire         _state_T_163 = io_req_uop_mem_cmd == 5'h9;
  wire         _state_T_164 = io_req_uop_mem_cmd == 5'hA;
  wire         _state_T_165 = io_req_uop_mem_cmd == 5'hB;
  wire         _state_T_169 = io_req_uop_mem_cmd == 5'h8;
  wire         _state_T_170 = io_req_uop_mem_cmd == 5'hC;
  wire         _state_T_171 = io_req_uop_mem_cmd == 5'hD;
  wire         _state_T_172 = io_req_uop_mem_cmd == 5'hE;
  wire         _state_T_173 = io_req_uop_mem_cmd == 5'hF;
  wire         _state_c_cat_T_96 = io_req_uop_mem_cmd == 5'h3;
  wire         _state_c_cat_T_98 = io_req_uop_mem_cmd == 5'h6;
  wire [3:0]   _GEN_2 = {_state_T_157 | _state_T_158 | _state_T_160 | _state_T_162 | _state_T_163 | _state_T_164 | _state_T_165 | _state_T_169 | _state_T_170 | _state_T_171 | _state_T_172 | _state_T_173, _state_T_157 | _state_T_158 | _state_T_160 | _state_T_162 | _state_T_163 | _state_T_164 | _state_T_165 | _state_T_169 | _state_T_170 | _state_T_171 | _state_T_172 | _state_T_173 | _state_c_cat_T_96 | _state_c_cat_T_98, new_coh_state};
  reg  [1:0]   casez_tmp_1;
  wire [1:0]   _GEN_3 = {1'h0, _GEN_2 == 4'hC};
  always @(*) begin
    casez (_GEN_2)
      4'b0000:
        casez_tmp_1 = 2'h0;
      4'b0001:
        casez_tmp_1 = 2'h1;
      4'b0010:
        casez_tmp_1 = 2'h2;
      4'b0011:
        casez_tmp_1 = 2'h3;
      4'b0100:
        casez_tmp_1 = 2'h1;
      4'b0101:
        casez_tmp_1 = 2'h2;
      4'b0110:
        casez_tmp_1 = 2'h2;
      4'b0111:
        casez_tmp_1 = 2'h3;
      4'b1000:
        casez_tmp_1 = _GEN_3;
      4'b1001:
        casez_tmp_1 = _GEN_3;
      4'b1010:
        casez_tmp_1 = _GEN_3;
      4'b1011:
        casez_tmp_1 = _GEN_3;
      4'b1100:
        casez_tmp_1 = _GEN_3;
      4'b1101:
        casez_tmp_1 = 2'h2;
      4'b1110:
        casez_tmp_1 = 2'h3;
      default:
        casez_tmp_1 = 2'h3;
    endcase
  end // always @(*)
  wire         _GEN_4 = _io_mem_grant_ready_output & io_mem_grant_valid;
  wire [26:0]  _beats1_decode_T_1 = 27'hFFF << io_mem_grant_bits_size;
  wire [7:0]   beats1 = io_mem_grant_bits_opcode[0] ? ~(_beats1_decode_T_1[11:4]) : 8'h0;
  reg  [7:0]   counter;
  wire [7:0]   _counter1_T = counter - 8'h1;
  wire         refill_done = (counter == 8'h1 | beats1 == 8'h0) & _GEN_4;
  wire         _sec_rdy_T_4 = state == 5'hD;
  wire         _sec_rdy_T_5 = state == 5'hE;
  wire         _sec_rdy_T_6 = state == 5'hF;
  wire         _rpq_io_enq_valid_T = io_req_pri_val & _io_req_pri_rdy_output;
  wire         _rpq_io_enq_valid_T_1 = io_req_sec_val & _io_req_sec_rdy_output;
  wire         _rpq_io_enq_valid_T_7 = (_rpq_io_enq_valid_T | _rpq_io_enq_valid_T_1) & ~(io_req_uop_mem_cmd == 5'h2 | _state_c_cat_T_96);
  reg          grantack_valid;
  reg  [1:0]   grantack_bits_sink;
  reg  [1:0]   refill_ctr;
  reg          commit_line;
  reg          grant_had_data;
  reg          finish_to_prefetch;
  reg  [1:0]   meta_hazard;
  wire         _io_probe_rdy_T_2 = state == 5'h1;
  wire         _io_probe_rdy_T_3 = state == 5'h2;
  wire         _io_probe_rdy_T_4 = state == 5'h3;
  wire         _io_probe_rdy_T_8 = state == 5'h4;
  wire         _io_way_valid_T_1 = state == 5'h11;
  assign _io_req_sec_rdy_output = ~((_state_T_157 | _state_T_158 | _state_T_160 | _state_T_162 | _state_T_163 | _state_T_164 | _state_T_165 | _state_T_169 | _state_T_170 | _state_T_171 | _state_T_172 | _state_T_173 | _state_c_cat_T_96 | _state_c_cat_T_98) & ~(_needs_second_acq_T_27 | _needs_second_acq_T_28 | _needs_second_acq_T_30 | _needs_second_acq_T_32 | _needs_second_acq_T_33 | _needs_second_acq_T_34 | _needs_second_acq_T_35 | _needs_second_acq_T_39 | _needs_second_acq_T_40 | _needs_second_acq_T_41 | _needs_second_acq_T_42 | _needs_second_acq_T_43 | _needs_second_acq_T_50 | _needs_second_acq_T_52)) & ~io_req_is_probe & ~(~(|state) | _sec_rdy_T_4 | _sec_rdy_T_5 | _sec_rdy_T_6) & _rpq_io_enq_ready;
  wire [3:0]   _state_T_3 = {_state_T_157 | _state_T_158 | _state_T_160 | _state_T_162 | _state_T_163 | _state_T_164 | _state_T_165 | _state_T_169 | _state_T_170 | _state_T_171 | _state_T_172 | _state_T_173, _state_T_157 | _state_T_158 | _state_T_160 | _state_T_162 | _state_T_163 | _state_T_164 | _state_T_165 | _state_T_169 | _state_T_170 | _state_T_171 | _state_T_172 | _state_T_173 | _state_c_cat_T_96 | _state_c_cat_T_98, io_req_old_meta_coh_state};
  wire         state_is_hit = _state_T_3 == 4'h3 | _state_T_3 == 4'h2 | _state_T_3 == 4'h1 | _state_T_3 == 4'h7 | _state_T_3 == 4'h6 | (&_state_T_3) | _state_T_3 == 4'hE;
  reg  [1:0]   casez_tmp_2;
  wire [1:0]   _state_T_30 = {1'h0, _state_T_3 == 4'hC};
  always @(*) begin
    casez (_state_T_3)
      4'b0000:
        casez_tmp_2 = 2'h0;
      4'b0001:
        casez_tmp_2 = 2'h1;
      4'b0010:
        casez_tmp_2 = 2'h2;
      4'b0011:
        casez_tmp_2 = 2'h3;
      4'b0100:
        casez_tmp_2 = 2'h1;
      4'b0101:
        casez_tmp_2 = 2'h2;
      4'b0110:
        casez_tmp_2 = 2'h2;
      4'b0111:
        casez_tmp_2 = 2'h3;
      4'b1000:
        casez_tmp_2 = _state_T_30;
      4'b1001:
        casez_tmp_2 = _state_T_30;
      4'b1010:
        casez_tmp_2 = _state_T_30;
      4'b1011:
        casez_tmp_2 = _state_T_30;
      4'b1100:
        casez_tmp_2 = _state_T_30;
      4'b1101:
        casez_tmp_2 = 2'h2;
      4'b1110:
        casez_tmp_2 = 2'h3;
      default:
        casez_tmp_2 = 2'h3;
    endcase
  end // always @(*)
  wire         _io_mem_acquire_valid_output = (|state) & _io_probe_rdy_T_2;
  wire         _GEN_5 = ~(|state) | _io_probe_rdy_T_2;
  assign _io_mem_grant_ready_output = ~_GEN_5 & _io_probe_rdy_T_3 & (~(io_mem_grant_bits_opcode[0]) | io_lb_write_ready);
  wire         _drain_load_T_28 = _rpq_io_deq_bits_uop_mem_cmd == 5'h7;
  wire         _drain_load_T_30 = _rpq_io_deq_bits_uop_mem_cmd == 5'h4;
  wire         _drain_load_T_31 = _rpq_io_deq_bits_uop_mem_cmd == 5'h9;
  wire         _drain_load_T_32 = _rpq_io_deq_bits_uop_mem_cmd == 5'hA;
  wire         _drain_load_T_33 = _rpq_io_deq_bits_uop_mem_cmd == 5'hB;
  wire         _drain_load_T_37 = _rpq_io_deq_bits_uop_mem_cmd == 5'h8;
  wire         _drain_load_T_38 = _rpq_io_deq_bits_uop_mem_cmd == 5'hC;
  wire         _drain_load_T_39 = _rpq_io_deq_bits_uop_mem_cmd == 5'hD;
  wire         _drain_load_T_40 = _rpq_io_deq_bits_uop_mem_cmd == 5'hE;
  wire         _drain_load_T_41 = _rpq_io_deq_bits_uop_mem_cmd == 5'hF;
  wire         drain_load = (_rpq_io_deq_bits_uop_mem_cmd == 5'h0 | _rpq_io_deq_bits_uop_mem_cmd == 5'h10 | _rpq_io_deq_bits_uop_mem_cmd == 5'h6 | _drain_load_T_28 | _drain_load_T_30 | _drain_load_T_31 | _drain_load_T_32 | _drain_load_T_33 | _drain_load_T_37 | _drain_load_T_38 | _drain_load_T_39 | _drain_load_T_40 | _drain_load_T_41) & ~(_rpq_io_deq_bits_uop_mem_cmd == 5'h1 | _rpq_io_deq_bits_uop_mem_cmd == 5'h11 | _drain_load_T_28 | _drain_load_T_30 | _drain_load_T_31 | _drain_load_T_32 | _drain_load_T_33 | _drain_load_T_37 | _drain_load_T_38 | _drain_load_T_39 | _drain_load_T_40 | _drain_load_T_41) & _rpq_io_deq_bits_uop_mem_cmd != 5'h6;
  wire [127:0] data_word = io_lb_resp >> {121'h0, _rpq_io_deq_bits_addr[3], 6'h0};
  wire         _GEN_6 = ~(|state) | _io_probe_rdy_T_2 | _io_probe_rdy_T_3;
  wire [31:0]  io_resp_bits_data_zeroed = _rpq_io_deq_bits_addr[2] ? data_word[63:32] : data_word[31:0];
  wire [15:0]  io_resp_bits_data_zeroed_1 = _rpq_io_deq_bits_addr[1] ? io_resp_bits_data_zeroed[31:16] : io_resp_bits_data_zeroed[15:0];
  wire [7:0]   io_resp_bits_data_zeroed_2 = _rpq_io_deq_bits_addr[0] ? io_resp_bits_data_zeroed_1[15:8] : io_resp_bits_data_zeroed_1[7:0];
  wire         _GEN_7 = _GEN & _rpq_io_deq_valid;
  wire         _GEN_8 = _rpq_io_empty & ~commit_line;
  wire         _GEN_9 = _rpq_io_empty | _rpq_io_deq_valid & ~drain_load;
  wire         _io_meta_read_valid_output = ~(~(|state) | _io_probe_rdy_T_2 | _io_probe_rdy_T_3 | _io_probe_rdy_T_4) & _io_probe_rdy_T_8 & (~io_prober_state_valid | ~grantack_valid | io_prober_state_bits[11:6] != req_addr[11:6]);
  wire         _GEN_10 = state == 5'h5;
  wire         _GEN_11 = state == 5'h6;
  wire         _GEN_12 = state == 5'h7;
  wire         _GEN_13 = state == 5'h9;
  wire         _io_wb_req_valid_output = ~(~(|state) | _io_probe_rdy_T_2 | _io_probe_rdy_T_3 | _io_probe_rdy_T_4 | _io_probe_rdy_T_8 | _GEN_10 | _GEN_11 | _GEN_12) & _GEN_13;
  wire         _GEN_14 = state == 5'hA;
  wire         _GEN_15 = state == 5'hB;
  wire         _GEN_16 = _io_probe_rdy_T_8 | _GEN_10 | _GEN_11 | _GEN_12 | _GEN_13 | _GEN_14;
  assign _io_lb_read_valid_output = ~_GEN_6 & (_io_probe_rdy_T_4 ? _rpq_io_deq_valid & drain_load : ~_GEN_16 & _GEN_15);
  wire         _GEN_17 = _io_probe_rdy_T_2 | _io_probe_rdy_T_3 | _io_probe_rdy_T_4 | _GEN_16;
  wire         _io_refill_valid_output = ~(~(|state) | _GEN_17) & _GEN_15 & io_lb_read_ready & _io_lb_read_valid_output;
  wire         _GEN_18 = state == 5'hC;
  wire         _GEN_19 = _io_probe_rdy_T_8 | _GEN_10 | _GEN_11 | _GEN_12 | _GEN_13 | _GEN_14 | _GEN_15;
  wire         _GEN_20 = _io_probe_rdy_T_4 | _GEN_19;
  wire         _io_replay_valid_output = ~(~(|state) | _io_probe_rdy_T_2 | _io_probe_rdy_T_3 | _GEN_20) & _GEN_18 & _rpq_io_deq_valid;
  assign _GEN = ~_GEN_6 & (_io_probe_rdy_T_4 ? io_resp_ready & io_lb_read_ready & drain_load : ~_GEN_19 & _GEN_18 & io_replay_ready);
  wire         _c_cat_T_123 = _rpq_io_deq_bits_uop_mem_cmd == 5'h1;
  wire         _c_cat_T_124 = _rpq_io_deq_bits_uop_mem_cmd == 5'h11;
  wire         _c_cat_T_126 = _rpq_io_deq_bits_uop_mem_cmd == 5'h7;
  wire         _c_cat_T_128 = _rpq_io_deq_bits_uop_mem_cmd == 5'h4;
  wire         _c_cat_T_129 = _rpq_io_deq_bits_uop_mem_cmd == 5'h9;
  wire         _c_cat_T_130 = _rpq_io_deq_bits_uop_mem_cmd == 5'hA;
  wire         _c_cat_T_131 = _rpq_io_deq_bits_uop_mem_cmd == 5'hB;
  wire         _c_cat_T_135 = _rpq_io_deq_bits_uop_mem_cmd == 5'h8;
  wire         _c_cat_T_136 = _rpq_io_deq_bits_uop_mem_cmd == 5'hC;
  wire         _c_cat_T_137 = _rpq_io_deq_bits_uop_mem_cmd == 5'hD;
  wire         _c_cat_T_138 = _rpq_io_deq_bits_uop_mem_cmd == 5'hE;
  wire         _c_cat_T_139 = _rpq_io_deq_bits_uop_mem_cmd == 5'hF;
  wire         _GEN_21 = io_replay_ready & _io_replay_valid_output & (_c_cat_T_123 | _c_cat_T_124 | _c_cat_T_126 | _c_cat_T_128 | _c_cat_T_129 | _c_cat_T_130 | _c_cat_T_131 | _c_cat_T_135 | _c_cat_T_136 | _c_cat_T_137 | _c_cat_T_138 | _c_cat_T_139);
  wire [3:0]   _GEN_22 = {_c_cat_T_123 | _c_cat_T_124 | _c_cat_T_126 | _c_cat_T_128 | _c_cat_T_129 | _c_cat_T_130 | _c_cat_T_131 | _c_cat_T_135 | _c_cat_T_136 | _c_cat_T_137 | _c_cat_T_138 | _c_cat_T_139, _c_cat_T_123 | _c_cat_T_124 | _c_cat_T_126 | _c_cat_T_128 | _c_cat_T_129 | _c_cat_T_130 | _c_cat_T_131 | _c_cat_T_135 | _c_cat_T_136 | _c_cat_T_137 | _c_cat_T_138 | _c_cat_T_139 | _rpq_io_deq_bits_uop_mem_cmd == 5'h3 | _rpq_io_deq_bits_uop_mem_cmd == 5'h6, new_coh_state};
  reg  [1:0]   casez_tmp_3;
  wire [1:0]   _GEN_23 = {1'h0, _GEN_22 == 4'hC};
  always @(*) begin
    casez (_GEN_22)
      4'b0000:
        casez_tmp_3 = 2'h0;
      4'b0001:
        casez_tmp_3 = 2'h1;
      4'b0010:
        casez_tmp_3 = 2'h2;
      4'b0011:
        casez_tmp_3 = 2'h3;
      4'b0100:
        casez_tmp_3 = 2'h1;
      4'b0101:
        casez_tmp_3 = 2'h2;
      4'b0110:
        casez_tmp_3 = 2'h2;
      4'b0111:
        casez_tmp_3 = 2'h3;
      4'b1000:
        casez_tmp_3 = _GEN_23;
      4'b1001:
        casez_tmp_3 = _GEN_23;
      4'b1010:
        casez_tmp_3 = _GEN_23;
      4'b1011:
        casez_tmp_3 = _GEN_23;
      4'b1100:
        casez_tmp_3 = _GEN_23;
      4'b1101:
        casez_tmp_3 = 2'h2;
      4'b1110:
        casez_tmp_3 = 2'h3;
      default:
        casez_tmp_3 = 2'h3;
    endcase
  end // always @(*)
  wire         _GEN_24 = _GEN_13 | _GEN_14 | _GEN_15 | _GEN_18;
  wire         _io_meta_write_valid_output = ~(~(|state) | _io_probe_rdy_T_2 | _io_probe_rdy_T_3 | _io_probe_rdy_T_4 | _io_probe_rdy_T_8 | _GEN_10 | _GEN_11) & (_GEN_12 | ~_GEN_24 & _sec_rdy_T_4);
  wire         _GEN_25 = _io_probe_rdy_T_4 | _io_probe_rdy_T_8 | _GEN_10 | _GEN_11 | _GEN_12 | _GEN_13 | _GEN_14 | _GEN_15 | _GEN_18 | _sec_rdy_T_4;
  wire         _io_mem_finish_valid_output = ~(~(|state) | _io_probe_rdy_T_2 | _io_probe_rdy_T_3 | _GEN_25) & _sec_rdy_T_5 & grantack_valid;
  wire         _GEN_26 = _sec_rdy_T_4 | _sec_rdy_T_5 | _sec_rdy_T_6;
  wire         _GEN_27 = _GEN_18 | _GEN_26;
  wire         _GEN_28 = _io_probe_rdy_T_4 | _io_probe_rdy_T_8 | _GEN_10 | _GEN_11 | _GEN_12 | _GEN_13 | _GEN_14 | _GEN_15 | _GEN_27;
  wire         _GEN_29 = _io_probe_rdy_T_2 | _io_probe_rdy_T_3 | _GEN_28;
  assign _io_req_pri_rdy_output = ~(|state) | ~_GEN_29 & _io_way_valid_T_1;
  wire         _GEN_30 = io_req_sec_val & ~_io_req_sec_rdy_output | io_clear_prefetch;
  wire [3:0]   _GEN_31 = {_state_T_157 | _state_T_158 | _state_T_160 | _state_T_162 | _state_T_163 | _state_T_164 | _state_T_165 | _state_T_169 | _state_T_170 | _state_T_171 | _state_T_172 | _state_T_173, _state_T_157 | _state_T_158 | _state_T_160 | _state_T_162 | _state_T_163 | _state_T_164 | _state_T_165 | _state_T_169 | _state_T_170 | _state_T_171 | _state_T_172 | _state_T_173 | _state_c_cat_T_96 | _state_c_cat_T_98, new_coh_state};
  reg  [1:0]   casez_tmp_4;
  wire [1:0]   _GEN_32 = {1'h0, _GEN_31 == 4'hC};
  always @(*) begin
    casez (_GEN_31)
      4'b0000:
        casez_tmp_4 = 2'h0;
      4'b0001:
        casez_tmp_4 = 2'h1;
      4'b0010:
        casez_tmp_4 = 2'h2;
      4'b0011:
        casez_tmp_4 = 2'h3;
      4'b0100:
        casez_tmp_4 = 2'h1;
      4'b0101:
        casez_tmp_4 = 2'h2;
      4'b0110:
        casez_tmp_4 = 2'h2;
      4'b0111:
        casez_tmp_4 = 2'h3;
      4'b1000:
        casez_tmp_4 = _GEN_32;
      4'b1001:
        casez_tmp_4 = _GEN_32;
      4'b1010:
        casez_tmp_4 = _GEN_32;
      4'b1011:
        casez_tmp_4 = _GEN_32;
      4'b1100:
        casez_tmp_4 = _GEN_32;
      4'b1101:
        casez_tmp_4 = 2'h2;
      4'b1110:
        casez_tmp_4 = 2'h3;
      default:
        casez_tmp_4 = 2'h3;
    endcase
  end // always @(*)
  wire [3:0]   _state_T_97 = {_state_T_157 | _state_T_158 | _state_T_160 | _state_T_162 | _state_T_163 | _state_T_164 | _state_T_165 | _state_T_169 | _state_T_170 | _state_T_171 | _state_T_172 | _state_T_173, _state_T_157 | _state_T_158 | _state_T_160 | _state_T_162 | _state_T_163 | _state_T_164 | _state_T_165 | _state_T_169 | _state_T_170 | _state_T_171 | _state_T_172 | _state_T_173 | _state_c_cat_T_96 | _state_c_cat_T_98, io_req_old_meta_coh_state};
  wire         state_is_hit_1 = _state_T_97 == 4'h3 | _state_T_97 == 4'h2 | _state_T_97 == 4'h1 | _state_T_97 == 4'h7 | _state_T_97 == 4'h6 | (&_state_T_97) | _state_T_97 == 4'hE;
  reg  [1:0]   casez_tmp_5;
  wire [1:0]   _state_T_124 = {1'h0, _state_T_97 == 4'hC};
  always @(*) begin
    casez (_state_T_97)
      4'b0000:
        casez_tmp_5 = 2'h0;
      4'b0001:
        casez_tmp_5 = 2'h1;
      4'b0010:
        casez_tmp_5 = 2'h2;
      4'b0011:
        casez_tmp_5 = 2'h3;
      4'b0100:
        casez_tmp_5 = 2'h1;
      4'b0101:
        casez_tmp_5 = 2'h2;
      4'b0110:
        casez_tmp_5 = 2'h2;
      4'b0111:
        casez_tmp_5 = 2'h3;
      4'b1000:
        casez_tmp_5 = _state_T_124;
      4'b1001:
        casez_tmp_5 = _state_T_124;
      4'b1010:
        casez_tmp_5 = _state_T_124;
      4'b1011:
        casez_tmp_5 = _state_T_124;
      4'b1100:
        casez_tmp_5 = _state_T_124;
      4'b1101:
        casez_tmp_5 = 2'h2;
      4'b1110:
        casez_tmp_5 = 2'h3;
      default:
        casez_tmp_5 = 2'h3;
    endcase
  end // always @(*)
  `ifndef SYNTHESIS
    wire _GEN_33 = ~(|state) & _rpq_io_enq_valid_T;
    wire _GEN_34 = (|state) & ~_io_probe_rdy_T_2;
    wire _GEN_35 = _GEN_34 & ~_io_probe_rdy_T_3 & ~_io_probe_rdy_T_4 & ~_io_probe_rdy_T_8 & ~_GEN_10 & ~_GEN_11 & ~_GEN_12 & ~_GEN_13 & ~_GEN_14 & ~_GEN_15;
    wire _GEN_36 = _GEN_35 & ~_GEN_18 & ~_sec_rdy_T_4 & ~_sec_rdy_T_5 & ~_sec_rdy_T_6 & _io_way_valid_T_1 & ~_GEN_30 & ~_rpq_io_enq_valid_T_1 & _rpq_io_enq_valid_T;
    always @(posedge clock) begin
      if (~reset & ~(|state) & ~_rpq_io_empty) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at mshrs.scala:131 assert(!(state === s_invalid && !rpq.io.empty))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_33 & ~reset & ~_rpq_io_enq_ready) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at mshrs.scala:194 assert(rpq.io.enq.ready)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_33 & io_req_tag_match & state_is_hit & ~reset & ~(_state_T_157 | _state_T_158 | _state_T_160 | _state_T_162 | _state_T_163 | _state_T_164 | _state_T_165 | _state_T_169 | _state_T_170 | _state_T_171 | _state_T_172 | _state_T_173)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at mshrs.scala:201 assert(isWrite(io.req.uop.mem_cmd))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_34 & _io_probe_rdy_T_3 & refill_done & ~reset & ~grant_had_data & req_needs_wb) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at mshrs.scala:251 assert(!(!grant_had_data && req_needs_wb))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_35 & _GEN_18 & _GEN_21 & ~reset & ~(_GEN_22 == 4'h3 | _GEN_22 == 4'h2 | _GEN_22 == 4'h1 | _GEN_22 == 4'h7 | _GEN_22 == 4'h6 | (&_GEN_22) | _GEN_22 == 4'hE)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: We still don't have permissions for this store\n    at mshrs.scala:357 assert(is_hit, \"We still don't have permissions for this store\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_36 & ~reset & ~_rpq_io_enq_ready) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at mshrs.scala:194 assert(rpq.io.enq.ready)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_36 & io_req_tag_match & state_is_hit_1 & ~reset & ~(_state_T_157 | _state_T_158 | _state_T_160 | _state_T_162 | _state_T_163 | _state_T_164 | _state_T_165 | _state_T_169 | _state_T_170 | _state_T_171 | _state_T_172 | _state_T_173)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at mshrs.scala:201 assert(isWrite(io.req.uop.mem_cmd))\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire         is_hit_1 = _GEN_31 == 4'h3 | _GEN_31 == 4'h2 | _GEN_31 == 4'h1 | _GEN_31 == 4'h7 | _GEN_31 == 4'h6 | (&_GEN_31) | _GEN_31 == 4'hE;
  wire         _GEN_37 = _rpq_io_enq_valid_T_1 & (_GEN_0 == 4'h3 | _GEN_0 == 4'h2 | _GEN_0 == 4'h1 | _GEN_0 == 4'h7 | _GEN_0 == 4'h6 | (&_GEN_0) | _GEN_0 == 4'hE) & (_GEN_2 == 4'h3 | _GEN_2 == 4'h2 | _GEN_2 == 4'h1 | _GEN_2 == 4'h7 | _GEN_2 == 4'h6 | (&_GEN_2) | _GEN_2 == 4'hE);
  wire [1:0]   dirties_cat = {_state_T_157 | _state_T_158 | _state_T_160 | _state_T_162 | _state_T_163 | _state_T_164 | _state_T_165 | _state_T_169 | _state_T_170 | _state_T_171 | _state_T_172 | _state_T_173, _state_T_157 | _state_T_158 | _state_T_160 | _state_T_162 | _state_T_163 | _state_T_164 | _state_T_165 | _state_T_169 | _state_T_170 | _state_T_171 | _state_T_172 | _state_T_173 | _state_c_cat_T_96 | _state_c_cat_T_98};
  wire         _GEN_38 = io_meta_write_ready & _io_meta_write_valid_output;
  wire         _GEN_39 = _rpq_io_enq_valid_T_1 & (&dirties_cat);
  wire         _GEN_40 = _rpq_io_enq_ready & _rpq_io_enq_valid_T_7;
  wire         _GEN_41 = io_refill_ready & _io_refill_valid_output;
  wire         _GEN_42 = io_mem_finish_ready & _io_mem_finish_valid_output | ~grantack_valid;
  wire         _GEN_43 = _GEN_30 | _rpq_io_enq_valid_T_1;
  wire         _GEN_44 = _GEN_29 | ~_io_way_valid_T_1 | _GEN_43 | ~_rpq_io_enq_valid_T;
  always @(posedge clock) begin
    if (reset) begin
      state <= 5'h0;
      req_needs_wb <= 1'h0;
      new_coh_state <= 2'h0;
      counter <= 8'h0;
      meta_hazard <= 2'h0;
    end
    else begin
      if (|state) begin
        if (_io_probe_rdy_T_2) begin
          if (io_mem_acquire_ready & _io_mem_acquire_valid_output)
            state <= 5'h2;
          if (_GEN_37) begin
            if (&dirties_cat)
              new_coh_state <= casez_tmp_1;
            else
              new_coh_state <= casez_tmp_0;
          end
        end
        else if (_io_probe_rdy_T_3) begin
          if (refill_done) begin
            state <= grant_had_data ? 5'h3 : 5'hC;
            new_coh_state <= coh_on_grant_state;
          end
          else if (_GEN_37) begin
            if (&dirties_cat)
              new_coh_state <= casez_tmp_1;
            else
              new_coh_state <= casez_tmp_0;
          end
        end
        else begin
          if (_io_probe_rdy_T_4) begin
            if (~_GEN_7) begin
              if (_GEN_8) begin
                if (~_GEN_40)
                  state <= 5'hE;
              end
              else if (_GEN_9)
                state <= 5'h4;
            end
          end
          else if (_io_probe_rdy_T_8) begin
            if (io_meta_read_ready & _io_meta_read_valid_output)
              state <= 5'h5;
          end
          else if (_GEN_10)
            state <= 5'h6;
          else if (_GEN_11)
            state <= io_meta_resp_valid ? ((&io_meta_resp_bits_coh_state) ? 5'h7 : 5'hB) : 5'h4;
          else if (_GEN_12) begin
            if (_GEN_38)
              state <= 5'h9;
          end
          else if (_GEN_13) begin
            if (io_wb_req_ready & _io_wb_req_valid_output)
              state <= 5'hA;
          end
          else if (_GEN_14) begin
            if (io_wb_resp)
              state <= 5'hB;
          end
          else if (_GEN_15) begin
            if (_GEN_41 & (&refill_ctr))
              state <= 5'hC;
          end
          else if (_GEN_18) begin
            if (_rpq_io_empty & ~_rpq_io_enq_valid_T_7)
              state <= 5'hD;
          end
          else if (_sec_rdy_T_4) begin
            if (_GEN_38)
              state <= 5'hE;
          end
          else if (_sec_rdy_T_5) begin
            if (_GEN_42)
              state <= 5'hF;
          end
          else if (_sec_rdy_T_6)
            state <= finish_to_prefetch ? 5'h11 : 5'h0;
          else if (_io_way_valid_T_1) begin
            if (_GEN_30)
              state <= 5'h0;
            else if (_rpq_io_enq_valid_T_1)
              state <= is_hit_1 ? 5'h4 : 5'h1;
            else if (_rpq_io_enq_valid_T)
              state <= io_req_tag_match & state_is_hit_1 ? 5'hC : 5'h1;
          end
          if (_GEN_20) begin
            if (_GEN_37) begin
              if (&dirties_cat)
                new_coh_state <= casez_tmp_1;
              else
                new_coh_state <= casez_tmp_0;
            end
          end
          else if (_GEN_18) begin
            if (_GEN_21)
              new_coh_state <= casez_tmp_3;
            else if (_GEN_37) begin
              if (&dirties_cat)
                new_coh_state <= casez_tmp_1;
              else
                new_coh_state <= casez_tmp_0;
            end
          end
          else if (_GEN_26 | ~_io_way_valid_T_1 | _GEN_30) begin
            if (_GEN_37) begin
              if (&dirties_cat)
                new_coh_state <= casez_tmp_1;
              else
                new_coh_state <= casez_tmp_0;
            end
          end
          else if (_rpq_io_enq_valid_T_1) begin
            if (is_hit_1)
              new_coh_state <= casez_tmp_4;
            else
              new_coh_state <= 2'h0;
          end
          else if (_rpq_io_enq_valid_T)
            new_coh_state <= io_req_tag_match ? (state_is_hit_1 ? casez_tmp_5 : io_req_old_meta_coh_state) : 2'h0;
          else if (_GEN_37) begin
            if (&dirties_cat)
              new_coh_state <= casez_tmp_1;
            else
              new_coh_state <= casez_tmp_0;
          end
        end
        if (_GEN_44) begin
        end
        else
          req_needs_wb <= &io_req_old_meta_coh_state;
      end
      else if (_rpq_io_enq_valid_T) begin
        state <= io_req_tag_match & state_is_hit ? 5'hC : 5'h1;
        req_needs_wb <= &io_req_old_meta_coh_state;
        new_coh_state <= io_req_tag_match ? (state_is_hit ? casez_tmp_2 : io_req_old_meta_coh_state) : 2'h0;
      end
      else if (_GEN_37) begin
        if (&dirties_cat)
          new_coh_state <= casez_tmp_1;
        else
          new_coh_state <= casez_tmp_0;
      end
      if (_GEN_4) begin
        if (counter == 8'h0)
          counter <= beats1;
        else
          counter <= _counter1_T;
      end
      if (_GEN_38)
        meta_hazard <= 2'h1;
      else if (|meta_hazard)
        meta_hazard <= meta_hazard + 2'h1;
    end
    if ((|state) ? ~_GEN_29 & _io_way_valid_T_1 & ~_GEN_43 & _rpq_io_enq_valid_T | _GEN_39 : _rpq_io_enq_valid_T | _GEN_39)
      req_uop_mem_cmd <= io_req_uop_mem_cmd;
    if (|state) begin
      if (_GEN_44) begin
      end
      else begin
        req_addr <= io_req_addr;
        req_old_meta_coh_state <= io_req_old_meta_coh_state;
        req_old_meta_tag <= io_req_old_meta_tag;
        req_way_en <= io_req_way_en;
      end
      if (~_io_probe_rdy_T_2) begin
        if (_io_probe_rdy_T_3) begin
          if (refill_done)
            grantack_valid <= io_mem_grant_bits_opcode[2] & ~(io_mem_grant_bits_opcode[1]);
        end
        else if (~_GEN_25) begin
          if (_sec_rdy_T_5)
            grantack_valid <= ~_GEN_42 & grantack_valid;
          else
            grantack_valid <= (_sec_rdy_T_6 | ~_io_way_valid_T_1 | _GEN_43 | ~_rpq_io_enq_valid_T) & grantack_valid;
        end
      end
      if (~_GEN_17) begin
        if (_GEN_15) begin
          if (_GEN_41)
            refill_ctr <= refill_ctr + 2'h1;
        end
        else if (_GEN_27 | ~_io_way_valid_T_1 | _GEN_43 | ~_rpq_io_enq_valid_T) begin
        end
        else
          refill_ctr <= 2'h0;
      end
    end
    else begin
      if (_rpq_io_enq_valid_T) begin
        req_addr <= io_req_addr;
        req_old_meta_coh_state <= io_req_old_meta_coh_state;
        req_old_meta_tag <= io_req_old_meta_tag;
        req_way_en <= io_req_way_en;
        refill_ctr <= 2'h0;
      end
      grantack_valid <= ~_rpq_io_enq_valid_T & grantack_valid;
    end
    if (_GEN_5 | ~(_io_probe_rdy_T_3 & refill_done)) begin
    end
    else
      grantack_bits_sink <= io_mem_grant_bits_sink;
    if (~_GEN_5) begin
      if (_io_probe_rdy_T_3)
        commit_line <= ~refill_done & commit_line;
      else
        commit_line <= _io_probe_rdy_T_4 & _GEN_7 | commit_line;
    end
    grant_had_data <= (|state) & (_io_probe_rdy_T_2 ? grant_had_data : _io_probe_rdy_T_3 ? (_GEN_4 ? io_mem_grant_bits_opcode[0] : grant_had_data) : (_GEN_28 | ~_io_way_valid_T_1 | _GEN_43 | ~_rpq_io_enq_valid_T) & grant_had_data);
    if (~_GEN_6) begin
      if (_io_probe_rdy_T_4)
        finish_to_prefetch <= ~_GEN_7 & _GEN_8 & ~_GEN_40 | finish_to_prefetch;
      else
        finish_to_prefetch <= (_io_probe_rdy_T_8 | _GEN_10 | _GEN_11 | _GEN_12 | _GEN_24 | ~(_sec_rdy_T_4 & _GEN_38)) & finish_to_prefetch;
    end
  end // always @(posedge)
  BranchKillableQueue rpq (
    .clock                           (clock),
    .reset                           (reset),
    .io_enq_ready                    (_rpq_io_enq_ready),
    .io_enq_valid                    (_rpq_io_enq_valid_T_7),
    .io_enq_bits_uop_uopc            (io_req_uop_uopc),
    .io_enq_bits_uop_inst            (io_req_uop_inst),
    .io_enq_bits_uop_debug_inst      (io_req_uop_debug_inst),
    .io_enq_bits_uop_is_rvc          (io_req_uop_is_rvc),
    .io_enq_bits_uop_debug_pc        (io_req_uop_debug_pc),
    .io_enq_bits_uop_iq_type         (io_req_uop_iq_type),
    .io_enq_bits_uop_fu_code         (io_req_uop_fu_code),
    .io_enq_bits_uop_ctrl_br_type    (io_req_uop_ctrl_br_type),
    .io_enq_bits_uop_ctrl_op1_sel    (io_req_uop_ctrl_op1_sel),
    .io_enq_bits_uop_ctrl_op2_sel    (io_req_uop_ctrl_op2_sel),
    .io_enq_bits_uop_ctrl_imm_sel    (io_req_uop_ctrl_imm_sel),
    .io_enq_bits_uop_ctrl_op_fcn     (io_req_uop_ctrl_op_fcn),
    .io_enq_bits_uop_ctrl_fcn_dw     (io_req_uop_ctrl_fcn_dw),
    .io_enq_bits_uop_ctrl_csr_cmd    (io_req_uop_ctrl_csr_cmd),
    .io_enq_bits_uop_ctrl_is_load    (io_req_uop_ctrl_is_load),
    .io_enq_bits_uop_ctrl_is_sta     (io_req_uop_ctrl_is_sta),
    .io_enq_bits_uop_ctrl_is_std     (io_req_uop_ctrl_is_std),
    .io_enq_bits_uop_iw_state        (io_req_uop_iw_state),
    .io_enq_bits_uop_iw_p1_poisoned  (io_req_uop_iw_p1_poisoned),
    .io_enq_bits_uop_iw_p2_poisoned  (io_req_uop_iw_p2_poisoned),
    .io_enq_bits_uop_is_br           (io_req_uop_is_br),
    .io_enq_bits_uop_is_jalr         (io_req_uop_is_jalr),
    .io_enq_bits_uop_is_jal          (io_req_uop_is_jal),
    .io_enq_bits_uop_is_sfb          (io_req_uop_is_sfb),
    .io_enq_bits_uop_br_mask         (io_req_uop_br_mask),
    .io_enq_bits_uop_br_tag          (io_req_uop_br_tag),
    .io_enq_bits_uop_ftq_idx         (io_req_uop_ftq_idx),
    .io_enq_bits_uop_edge_inst       (io_req_uop_edge_inst),
    .io_enq_bits_uop_pc_lob          (io_req_uop_pc_lob),
    .io_enq_bits_uop_taken           (io_req_uop_taken),
    .io_enq_bits_uop_imm_packed      (io_req_uop_imm_packed),
    .io_enq_bits_uop_csr_addr        (io_req_uop_csr_addr),
    .io_enq_bits_uop_rob_idx         (io_req_uop_rob_idx),
    .io_enq_bits_uop_ldq_idx         (io_req_uop_ldq_idx),
    .io_enq_bits_uop_stq_idx         (io_req_uop_stq_idx),
    .io_enq_bits_uop_rxq_idx         (io_req_uop_rxq_idx),
    .io_enq_bits_uop_pdst            (io_req_uop_pdst),
    .io_enq_bits_uop_prs1            (io_req_uop_prs1),
    .io_enq_bits_uop_prs2            (io_req_uop_prs2),
    .io_enq_bits_uop_prs3            (io_req_uop_prs3),
    .io_enq_bits_uop_ppred           (io_req_uop_ppred),
    .io_enq_bits_uop_prs1_busy       (io_req_uop_prs1_busy),
    .io_enq_bits_uop_prs2_busy       (io_req_uop_prs2_busy),
    .io_enq_bits_uop_prs3_busy       (io_req_uop_prs3_busy),
    .io_enq_bits_uop_ppred_busy      (io_req_uop_ppred_busy),
    .io_enq_bits_uop_stale_pdst      (io_req_uop_stale_pdst),
    .io_enq_bits_uop_exception       (io_req_uop_exception),
    .io_enq_bits_uop_exc_cause       (io_req_uop_exc_cause),
    .io_enq_bits_uop_bypassable      (io_req_uop_bypassable),
    .io_enq_bits_uop_mem_cmd         (io_req_uop_mem_cmd),
    .io_enq_bits_uop_mem_size        (io_req_uop_mem_size),
    .io_enq_bits_uop_mem_signed      (io_req_uop_mem_signed),
    .io_enq_bits_uop_is_fence        (io_req_uop_is_fence),
    .io_enq_bits_uop_is_fencei       (io_req_uop_is_fencei),
    .io_enq_bits_uop_is_amo          (io_req_uop_is_amo),
    .io_enq_bits_uop_uses_ldq        (io_req_uop_uses_ldq),
    .io_enq_bits_uop_uses_stq        (io_req_uop_uses_stq),
    .io_enq_bits_uop_is_sys_pc2epc   (io_req_uop_is_sys_pc2epc),
    .io_enq_bits_uop_is_unique       (io_req_uop_is_unique),
    .io_enq_bits_uop_flush_on_commit (io_req_uop_flush_on_commit),
    .io_enq_bits_uop_ldst_is_rs1     (io_req_uop_ldst_is_rs1),
    .io_enq_bits_uop_ldst            (io_req_uop_ldst),
    .io_enq_bits_uop_lrs1            (io_req_uop_lrs1),
    .io_enq_bits_uop_lrs2            (io_req_uop_lrs2),
    .io_enq_bits_uop_lrs3            (io_req_uop_lrs3),
    .io_enq_bits_uop_ldst_val        (io_req_uop_ldst_val),
    .io_enq_bits_uop_dst_rtype       (io_req_uop_dst_rtype),
    .io_enq_bits_uop_lrs1_rtype      (io_req_uop_lrs1_rtype),
    .io_enq_bits_uop_lrs2_rtype      (io_req_uop_lrs2_rtype),
    .io_enq_bits_uop_frs3_en         (io_req_uop_frs3_en),
    .io_enq_bits_uop_fp_val          (io_req_uop_fp_val),
    .io_enq_bits_uop_fp_single       (io_req_uop_fp_single),
    .io_enq_bits_uop_xcpt_pf_if      (io_req_uop_xcpt_pf_if),
    .io_enq_bits_uop_xcpt_ae_if      (io_req_uop_xcpt_ae_if),
    .io_enq_bits_uop_xcpt_ma_if      (io_req_uop_xcpt_ma_if),
    .io_enq_bits_uop_bp_debug_if     (io_req_uop_bp_debug_if),
    .io_enq_bits_uop_bp_xcpt_if      (io_req_uop_bp_xcpt_if),
    .io_enq_bits_uop_debug_fsrc      (io_req_uop_debug_fsrc),
    .io_enq_bits_uop_debug_tsrc      (io_req_uop_debug_tsrc),
    .io_enq_bits_addr                (io_req_addr),
    .io_enq_bits_data                (io_req_data),
    .io_enq_bits_is_hella            (io_req_is_hella),
    .io_enq_bits_tag_match           (io_req_tag_match),
    .io_enq_bits_old_meta_coh_state  (io_req_old_meta_coh_state),
    .io_enq_bits_old_meta_tag        (io_req_old_meta_tag),
    .io_enq_bits_way_en              (io_req_way_en),
    .io_enq_bits_sdq_id              (io_req_sdq_id),
    .io_deq_ready                    (_GEN),
    .io_deq_valid                    (_rpq_io_deq_valid),
    .io_deq_bits_uop_uopc            (_rpq_io_deq_bits_uop_uopc),
    .io_deq_bits_uop_inst            (_rpq_io_deq_bits_uop_inst),
    .io_deq_bits_uop_debug_inst      (_rpq_io_deq_bits_uop_debug_inst),
    .io_deq_bits_uop_is_rvc          (_rpq_io_deq_bits_uop_is_rvc),
    .io_deq_bits_uop_debug_pc        (_rpq_io_deq_bits_uop_debug_pc),
    .io_deq_bits_uop_iq_type         (_rpq_io_deq_bits_uop_iq_type),
    .io_deq_bits_uop_fu_code         (_rpq_io_deq_bits_uop_fu_code),
    .io_deq_bits_uop_ctrl_br_type    (_rpq_io_deq_bits_uop_ctrl_br_type),
    .io_deq_bits_uop_ctrl_op1_sel    (_rpq_io_deq_bits_uop_ctrl_op1_sel),
    .io_deq_bits_uop_ctrl_op2_sel    (_rpq_io_deq_bits_uop_ctrl_op2_sel),
    .io_deq_bits_uop_ctrl_imm_sel    (_rpq_io_deq_bits_uop_ctrl_imm_sel),
    .io_deq_bits_uop_ctrl_op_fcn     (_rpq_io_deq_bits_uop_ctrl_op_fcn),
    .io_deq_bits_uop_ctrl_fcn_dw     (_rpq_io_deq_bits_uop_ctrl_fcn_dw),
    .io_deq_bits_uop_ctrl_csr_cmd    (_rpq_io_deq_bits_uop_ctrl_csr_cmd),
    .io_deq_bits_uop_ctrl_is_load    (_rpq_io_deq_bits_uop_ctrl_is_load),
    .io_deq_bits_uop_ctrl_is_sta     (_rpq_io_deq_bits_uop_ctrl_is_sta),
    .io_deq_bits_uop_ctrl_is_std     (_rpq_io_deq_bits_uop_ctrl_is_std),
    .io_deq_bits_uop_iw_state        (_rpq_io_deq_bits_uop_iw_state),
    .io_deq_bits_uop_iw_p1_poisoned  (_rpq_io_deq_bits_uop_iw_p1_poisoned),
    .io_deq_bits_uop_iw_p2_poisoned  (_rpq_io_deq_bits_uop_iw_p2_poisoned),
    .io_deq_bits_uop_is_br           (_rpq_io_deq_bits_uop_is_br),
    .io_deq_bits_uop_is_jalr         (_rpq_io_deq_bits_uop_is_jalr),
    .io_deq_bits_uop_is_jal          (_rpq_io_deq_bits_uop_is_jal),
    .io_deq_bits_uop_is_sfb          (_rpq_io_deq_bits_uop_is_sfb),
    .io_deq_bits_uop_br_mask         (_rpq_io_deq_bits_uop_br_mask),
    .io_deq_bits_uop_br_tag          (_rpq_io_deq_bits_uop_br_tag),
    .io_deq_bits_uop_ftq_idx         (_rpq_io_deq_bits_uop_ftq_idx),
    .io_deq_bits_uop_edge_inst       (_rpq_io_deq_bits_uop_edge_inst),
    .io_deq_bits_uop_pc_lob          (_rpq_io_deq_bits_uop_pc_lob),
    .io_deq_bits_uop_taken           (_rpq_io_deq_bits_uop_taken),
    .io_deq_bits_uop_imm_packed      (_rpq_io_deq_bits_uop_imm_packed),
    .io_deq_bits_uop_csr_addr        (_rpq_io_deq_bits_uop_csr_addr),
    .io_deq_bits_uop_rob_idx         (_rpq_io_deq_bits_uop_rob_idx),
    .io_deq_bits_uop_ldq_idx         (_rpq_io_deq_bits_uop_ldq_idx),
    .io_deq_bits_uop_stq_idx         (_rpq_io_deq_bits_uop_stq_idx),
    .io_deq_bits_uop_rxq_idx         (_rpq_io_deq_bits_uop_rxq_idx),
    .io_deq_bits_uop_pdst            (_rpq_io_deq_bits_uop_pdst),
    .io_deq_bits_uop_prs1            (_rpq_io_deq_bits_uop_prs1),
    .io_deq_bits_uop_prs2            (_rpq_io_deq_bits_uop_prs2),
    .io_deq_bits_uop_prs3            (_rpq_io_deq_bits_uop_prs3),
    .io_deq_bits_uop_ppred           (_rpq_io_deq_bits_uop_ppred),
    .io_deq_bits_uop_prs1_busy       (_rpq_io_deq_bits_uop_prs1_busy),
    .io_deq_bits_uop_prs2_busy       (_rpq_io_deq_bits_uop_prs2_busy),
    .io_deq_bits_uop_prs3_busy       (_rpq_io_deq_bits_uop_prs3_busy),
    .io_deq_bits_uop_ppred_busy      (_rpq_io_deq_bits_uop_ppred_busy),
    .io_deq_bits_uop_stale_pdst      (_rpq_io_deq_bits_uop_stale_pdst),
    .io_deq_bits_uop_exception       (_rpq_io_deq_bits_uop_exception),
    .io_deq_bits_uop_exc_cause       (_rpq_io_deq_bits_uop_exc_cause),
    .io_deq_bits_uop_bypassable      (_rpq_io_deq_bits_uop_bypassable),
    .io_deq_bits_uop_mem_cmd         (_rpq_io_deq_bits_uop_mem_cmd),
    .io_deq_bits_uop_mem_size        (_rpq_io_deq_bits_uop_mem_size),
    .io_deq_bits_uop_mem_signed      (_rpq_io_deq_bits_uop_mem_signed),
    .io_deq_bits_uop_is_fence        (_rpq_io_deq_bits_uop_is_fence),
    .io_deq_bits_uop_is_fencei       (_rpq_io_deq_bits_uop_is_fencei),
    .io_deq_bits_uop_is_amo          (_rpq_io_deq_bits_uop_is_amo),
    .io_deq_bits_uop_uses_ldq        (_rpq_io_deq_bits_uop_uses_ldq),
    .io_deq_bits_uop_uses_stq        (_rpq_io_deq_bits_uop_uses_stq),
    .io_deq_bits_uop_is_sys_pc2epc   (_rpq_io_deq_bits_uop_is_sys_pc2epc),
    .io_deq_bits_uop_is_unique       (_rpq_io_deq_bits_uop_is_unique),
    .io_deq_bits_uop_flush_on_commit (_rpq_io_deq_bits_uop_flush_on_commit),
    .io_deq_bits_uop_ldst_is_rs1     (_rpq_io_deq_bits_uop_ldst_is_rs1),
    .io_deq_bits_uop_ldst            (_rpq_io_deq_bits_uop_ldst),
    .io_deq_bits_uop_lrs1            (_rpq_io_deq_bits_uop_lrs1),
    .io_deq_bits_uop_lrs2            (_rpq_io_deq_bits_uop_lrs2),
    .io_deq_bits_uop_lrs3            (_rpq_io_deq_bits_uop_lrs3),
    .io_deq_bits_uop_ldst_val        (_rpq_io_deq_bits_uop_ldst_val),
    .io_deq_bits_uop_dst_rtype       (_rpq_io_deq_bits_uop_dst_rtype),
    .io_deq_bits_uop_lrs1_rtype      (_rpq_io_deq_bits_uop_lrs1_rtype),
    .io_deq_bits_uop_lrs2_rtype      (_rpq_io_deq_bits_uop_lrs2_rtype),
    .io_deq_bits_uop_frs3_en         (_rpq_io_deq_bits_uop_frs3_en),
    .io_deq_bits_uop_fp_val          (_rpq_io_deq_bits_uop_fp_val),
    .io_deq_bits_uop_fp_single       (_rpq_io_deq_bits_uop_fp_single),
    .io_deq_bits_uop_xcpt_pf_if      (_rpq_io_deq_bits_uop_xcpt_pf_if),
    .io_deq_bits_uop_xcpt_ae_if      (_rpq_io_deq_bits_uop_xcpt_ae_if),
    .io_deq_bits_uop_xcpt_ma_if      (_rpq_io_deq_bits_uop_xcpt_ma_if),
    .io_deq_bits_uop_bp_debug_if     (_rpq_io_deq_bits_uop_bp_debug_if),
    .io_deq_bits_uop_bp_xcpt_if      (_rpq_io_deq_bits_uop_bp_xcpt_if),
    .io_deq_bits_uop_debug_fsrc      (_rpq_io_deq_bits_uop_debug_fsrc),
    .io_deq_bits_uop_debug_tsrc      (_rpq_io_deq_bits_uop_debug_tsrc),
    .io_deq_bits_addr                (_rpq_io_deq_bits_addr),
    .io_deq_bits_is_hella            (_rpq_io_deq_bits_is_hella),
    .io_deq_bits_sdq_id              (io_replay_bits_sdq_id),
    .io_brupdate_b1_resolve_mask     (io_brupdate_b1_resolve_mask),
    .io_brupdate_b1_mispredict_mask  (io_brupdate_b1_mispredict_mask),
    .io_flush                        (io_exception),
    .io_empty                        (_rpq_io_empty)
  );
  assign io_req_pri_rdy = _io_req_pri_rdy_output;
  assign io_req_sec_rdy = _io_req_sec_rdy_output;
  assign io_idx_valid = |state;
  assign io_idx_bits = req_addr[11:6];
  assign io_way_valid = ~(~(|state) | _io_way_valid_T_1);
  assign io_way_bits = req_way_en;
  assign io_tag_valid = |state;
  assign io_tag_bits = req_addr[39:12];
  assign io_mem_acquire_valid = _io_mem_acquire_valid_output;
  assign io_mem_acquire_bits_param = {1'h0, casez_tmp};
  assign io_mem_acquire_bits_source = {1'h0, io_id};
  assign io_mem_acquire_bits_address = {req_addr[32:6], 6'h0};
  assign io_mem_grant_ready = _io_mem_grant_ready_output;
  assign io_mem_finish_valid = _io_mem_finish_valid_output;
  assign io_mem_finish_bits_sink = grantack_bits_sink;
  assign io_refill_valid = _io_refill_valid_output;
  assign io_refill_bits_way_en = req_way_en;
  assign io_refill_bits_addr = {req_addr[11:6], refill_ctr, 4'h0};
  assign io_refill_bits_data = io_lb_resp;
  assign io_meta_write_valid = _io_meta_write_valid_output;
  assign io_meta_write_bits_idx = req_addr[11:6];
  assign io_meta_write_bits_way_en = req_way_en;
  assign io_meta_write_bits_data_coh_state = _GEN_12 ? 2'h0 : new_coh_state;
  assign io_meta_write_bits_data_tag = req_addr[32:12];
  assign io_meta_read_valid = _io_meta_read_valid_output;
  assign io_meta_read_bits_idx = req_addr[11:6];
  assign io_meta_read_bits_way_en = req_way_en;
  assign io_meta_read_bits_tag = req_addr[32:12];
  assign io_wb_req_valid = _io_wb_req_valid_output;
  assign io_wb_req_bits_tag = req_old_meta_tag;
  assign io_wb_req_bits_idx = req_addr[11:6];
  assign io_wb_req_bits_param = (&req_old_meta_coh_state) | req_old_meta_coh_state == 2'h2 ? 3'h1 : req_old_meta_coh_state == 2'h1 ? 3'h2 : req_old_meta_coh_state == 2'h0 ? 3'h5 : 3'h0;
  assign io_wb_req_bits_way_en = req_way_en;
  assign io_commit_val = ~_GEN_6 & _io_probe_rdy_T_4 & ~(_GEN_7 | _GEN_8) & _GEN_9;
  assign io_commit_addr = req_addr;
  assign io_commit_coh_state = coh_on_grant_state;
  assign io_lb_read_valid = _io_lb_read_valid_output;
  assign io_lb_read_bits_id = io_id;
  assign io_lb_read_bits_offset = _io_probe_rdy_T_4 ? _rpq_io_deq_bits_addr[5:4] : refill_ctr;
  assign io_lb_write_valid = ~_GEN_5 & _io_probe_rdy_T_3 & io_mem_grant_bits_opcode[0] & io_mem_grant_valid;
  assign io_lb_write_bits_id = io_id;
  assign io_lb_write_bits_offset = beats1[1:0] & ~(_counter1_T[1:0]);
  assign io_lb_write_bits_data = io_mem_grant_bits_data;
  assign io_replay_valid = _io_replay_valid_output;
  assign io_replay_bits_uop_uopc = _rpq_io_deq_bits_uop_uopc;
  assign io_replay_bits_uop_inst = _rpq_io_deq_bits_uop_inst;
  assign io_replay_bits_uop_debug_inst = _rpq_io_deq_bits_uop_debug_inst;
  assign io_replay_bits_uop_is_rvc = _rpq_io_deq_bits_uop_is_rvc;
  assign io_replay_bits_uop_debug_pc = _rpq_io_deq_bits_uop_debug_pc;
  assign io_replay_bits_uop_iq_type = _rpq_io_deq_bits_uop_iq_type;
  assign io_replay_bits_uop_fu_code = _rpq_io_deq_bits_uop_fu_code;
  assign io_replay_bits_uop_ctrl_br_type = _rpq_io_deq_bits_uop_ctrl_br_type;
  assign io_replay_bits_uop_ctrl_op1_sel = _rpq_io_deq_bits_uop_ctrl_op1_sel;
  assign io_replay_bits_uop_ctrl_op2_sel = _rpq_io_deq_bits_uop_ctrl_op2_sel;
  assign io_replay_bits_uop_ctrl_imm_sel = _rpq_io_deq_bits_uop_ctrl_imm_sel;
  assign io_replay_bits_uop_ctrl_op_fcn = _rpq_io_deq_bits_uop_ctrl_op_fcn;
  assign io_replay_bits_uop_ctrl_fcn_dw = _rpq_io_deq_bits_uop_ctrl_fcn_dw;
  assign io_replay_bits_uop_ctrl_csr_cmd = _rpq_io_deq_bits_uop_ctrl_csr_cmd;
  assign io_replay_bits_uop_ctrl_is_load = _rpq_io_deq_bits_uop_ctrl_is_load;
  assign io_replay_bits_uop_ctrl_is_sta = _rpq_io_deq_bits_uop_ctrl_is_sta;
  assign io_replay_bits_uop_ctrl_is_std = _rpq_io_deq_bits_uop_ctrl_is_std;
  assign io_replay_bits_uop_iw_state = _rpq_io_deq_bits_uop_iw_state;
  assign io_replay_bits_uop_iw_p1_poisoned = _rpq_io_deq_bits_uop_iw_p1_poisoned;
  assign io_replay_bits_uop_iw_p2_poisoned = _rpq_io_deq_bits_uop_iw_p2_poisoned;
  assign io_replay_bits_uop_is_br = _rpq_io_deq_bits_uop_is_br;
  assign io_replay_bits_uop_is_jalr = _rpq_io_deq_bits_uop_is_jalr;
  assign io_replay_bits_uop_is_jal = _rpq_io_deq_bits_uop_is_jal;
  assign io_replay_bits_uop_is_sfb = _rpq_io_deq_bits_uop_is_sfb;
  assign io_replay_bits_uop_br_mask = _rpq_io_deq_bits_uop_br_mask;
  assign io_replay_bits_uop_br_tag = _rpq_io_deq_bits_uop_br_tag;
  assign io_replay_bits_uop_ftq_idx = _rpq_io_deq_bits_uop_ftq_idx;
  assign io_replay_bits_uop_edge_inst = _rpq_io_deq_bits_uop_edge_inst;
  assign io_replay_bits_uop_pc_lob = _rpq_io_deq_bits_uop_pc_lob;
  assign io_replay_bits_uop_taken = _rpq_io_deq_bits_uop_taken;
  assign io_replay_bits_uop_imm_packed = _rpq_io_deq_bits_uop_imm_packed;
  assign io_replay_bits_uop_csr_addr = _rpq_io_deq_bits_uop_csr_addr;
  assign io_replay_bits_uop_rob_idx = _rpq_io_deq_bits_uop_rob_idx;
  assign io_replay_bits_uop_ldq_idx = _rpq_io_deq_bits_uop_ldq_idx;
  assign io_replay_bits_uop_stq_idx = _rpq_io_deq_bits_uop_stq_idx;
  assign io_replay_bits_uop_rxq_idx = _rpq_io_deq_bits_uop_rxq_idx;
  assign io_replay_bits_uop_pdst = _rpq_io_deq_bits_uop_pdst;
  assign io_replay_bits_uop_prs1 = _rpq_io_deq_bits_uop_prs1;
  assign io_replay_bits_uop_prs2 = _rpq_io_deq_bits_uop_prs2;
  assign io_replay_bits_uop_prs3 = _rpq_io_deq_bits_uop_prs3;
  assign io_replay_bits_uop_ppred = _rpq_io_deq_bits_uop_ppred;
  assign io_replay_bits_uop_prs1_busy = _rpq_io_deq_bits_uop_prs1_busy;
  assign io_replay_bits_uop_prs2_busy = _rpq_io_deq_bits_uop_prs2_busy;
  assign io_replay_bits_uop_prs3_busy = _rpq_io_deq_bits_uop_prs3_busy;
  assign io_replay_bits_uop_ppred_busy = _rpq_io_deq_bits_uop_ppred_busy;
  assign io_replay_bits_uop_stale_pdst = _rpq_io_deq_bits_uop_stale_pdst;
  assign io_replay_bits_uop_exception = _rpq_io_deq_bits_uop_exception;
  assign io_replay_bits_uop_exc_cause = _rpq_io_deq_bits_uop_exc_cause;
  assign io_replay_bits_uop_bypassable = _rpq_io_deq_bits_uop_bypassable;
  assign io_replay_bits_uop_mem_cmd = _rpq_io_deq_bits_uop_mem_cmd;
  assign io_replay_bits_uop_mem_size = _rpq_io_deq_bits_uop_mem_size;
  assign io_replay_bits_uop_mem_signed = _rpq_io_deq_bits_uop_mem_signed;
  assign io_replay_bits_uop_is_fence = _rpq_io_deq_bits_uop_is_fence;
  assign io_replay_bits_uop_is_fencei = _rpq_io_deq_bits_uop_is_fencei;
  assign io_replay_bits_uop_is_amo = _rpq_io_deq_bits_uop_is_amo;
  assign io_replay_bits_uop_uses_ldq = _rpq_io_deq_bits_uop_uses_ldq;
  assign io_replay_bits_uop_uses_stq = _rpq_io_deq_bits_uop_uses_stq;
  assign io_replay_bits_uop_is_sys_pc2epc = _rpq_io_deq_bits_uop_is_sys_pc2epc;
  assign io_replay_bits_uop_is_unique = _rpq_io_deq_bits_uop_is_unique;
  assign io_replay_bits_uop_flush_on_commit = _rpq_io_deq_bits_uop_flush_on_commit;
  assign io_replay_bits_uop_ldst_is_rs1 = _rpq_io_deq_bits_uop_ldst_is_rs1;
  assign io_replay_bits_uop_ldst = _rpq_io_deq_bits_uop_ldst;
  assign io_replay_bits_uop_lrs1 = _rpq_io_deq_bits_uop_lrs1;
  assign io_replay_bits_uop_lrs2 = _rpq_io_deq_bits_uop_lrs2;
  assign io_replay_bits_uop_lrs3 = _rpq_io_deq_bits_uop_lrs3;
  assign io_replay_bits_uop_ldst_val = _rpq_io_deq_bits_uop_ldst_val;
  assign io_replay_bits_uop_dst_rtype = _rpq_io_deq_bits_uop_dst_rtype;
  assign io_replay_bits_uop_lrs1_rtype = _rpq_io_deq_bits_uop_lrs1_rtype;
  assign io_replay_bits_uop_lrs2_rtype = _rpq_io_deq_bits_uop_lrs2_rtype;
  assign io_replay_bits_uop_frs3_en = _rpq_io_deq_bits_uop_frs3_en;
  assign io_replay_bits_uop_fp_val = _rpq_io_deq_bits_uop_fp_val;
  assign io_replay_bits_uop_fp_single = _rpq_io_deq_bits_uop_fp_single;
  assign io_replay_bits_uop_xcpt_pf_if = _rpq_io_deq_bits_uop_xcpt_pf_if;
  assign io_replay_bits_uop_xcpt_ae_if = _rpq_io_deq_bits_uop_xcpt_ae_if;
  assign io_replay_bits_uop_xcpt_ma_if = _rpq_io_deq_bits_uop_xcpt_ma_if;
  assign io_replay_bits_uop_bp_debug_if = _rpq_io_deq_bits_uop_bp_debug_if;
  assign io_replay_bits_uop_bp_xcpt_if = _rpq_io_deq_bits_uop_bp_xcpt_if;
  assign io_replay_bits_uop_debug_fsrc = _rpq_io_deq_bits_uop_debug_fsrc;
  assign io_replay_bits_uop_debug_tsrc = _rpq_io_deq_bits_uop_debug_tsrc;
  assign io_replay_bits_addr = {req_addr[39:6], _rpq_io_deq_bits_addr[5:0]};
  assign io_replay_bits_is_hella = _rpq_io_deq_bits_is_hella;
  assign io_replay_bits_way_en = req_way_en;
  assign io_resp_valid = ~_GEN_6 & _io_probe_rdy_T_4 & _rpq_io_deq_valid & io_lb_read_ready & _io_lb_read_valid_output & drain_load;
  assign io_resp_bits_uop_uopc = _rpq_io_deq_bits_uop_uopc;
  assign io_resp_bits_uop_inst = _rpq_io_deq_bits_uop_inst;
  assign io_resp_bits_uop_debug_inst = _rpq_io_deq_bits_uop_debug_inst;
  assign io_resp_bits_uop_is_rvc = _rpq_io_deq_bits_uop_is_rvc;
  assign io_resp_bits_uop_debug_pc = _rpq_io_deq_bits_uop_debug_pc;
  assign io_resp_bits_uop_iq_type = _rpq_io_deq_bits_uop_iq_type;
  assign io_resp_bits_uop_fu_code = _rpq_io_deq_bits_uop_fu_code;
  assign io_resp_bits_uop_ctrl_br_type = _rpq_io_deq_bits_uop_ctrl_br_type;
  assign io_resp_bits_uop_ctrl_op1_sel = _rpq_io_deq_bits_uop_ctrl_op1_sel;
  assign io_resp_bits_uop_ctrl_op2_sel = _rpq_io_deq_bits_uop_ctrl_op2_sel;
  assign io_resp_bits_uop_ctrl_imm_sel = _rpq_io_deq_bits_uop_ctrl_imm_sel;
  assign io_resp_bits_uop_ctrl_op_fcn = _rpq_io_deq_bits_uop_ctrl_op_fcn;
  assign io_resp_bits_uop_ctrl_fcn_dw = _rpq_io_deq_bits_uop_ctrl_fcn_dw;
  assign io_resp_bits_uop_ctrl_csr_cmd = _rpq_io_deq_bits_uop_ctrl_csr_cmd;
  assign io_resp_bits_uop_ctrl_is_load = _rpq_io_deq_bits_uop_ctrl_is_load;
  assign io_resp_bits_uop_ctrl_is_sta = _rpq_io_deq_bits_uop_ctrl_is_sta;
  assign io_resp_bits_uop_ctrl_is_std = _rpq_io_deq_bits_uop_ctrl_is_std;
  assign io_resp_bits_uop_iw_state = _rpq_io_deq_bits_uop_iw_state;
  assign io_resp_bits_uop_iw_p1_poisoned = _rpq_io_deq_bits_uop_iw_p1_poisoned;
  assign io_resp_bits_uop_iw_p2_poisoned = _rpq_io_deq_bits_uop_iw_p2_poisoned;
  assign io_resp_bits_uop_is_br = _rpq_io_deq_bits_uop_is_br;
  assign io_resp_bits_uop_is_jalr = _rpq_io_deq_bits_uop_is_jalr;
  assign io_resp_bits_uop_is_jal = _rpq_io_deq_bits_uop_is_jal;
  assign io_resp_bits_uop_is_sfb = _rpq_io_deq_bits_uop_is_sfb;
  assign io_resp_bits_uop_br_mask = _rpq_io_deq_bits_uop_br_mask;
  assign io_resp_bits_uop_br_tag = _rpq_io_deq_bits_uop_br_tag;
  assign io_resp_bits_uop_ftq_idx = _rpq_io_deq_bits_uop_ftq_idx;
  assign io_resp_bits_uop_edge_inst = _rpq_io_deq_bits_uop_edge_inst;
  assign io_resp_bits_uop_pc_lob = _rpq_io_deq_bits_uop_pc_lob;
  assign io_resp_bits_uop_taken = _rpq_io_deq_bits_uop_taken;
  assign io_resp_bits_uop_imm_packed = _rpq_io_deq_bits_uop_imm_packed;
  assign io_resp_bits_uop_csr_addr = _rpq_io_deq_bits_uop_csr_addr;
  assign io_resp_bits_uop_rob_idx = _rpq_io_deq_bits_uop_rob_idx;
  assign io_resp_bits_uop_ldq_idx = _rpq_io_deq_bits_uop_ldq_idx;
  assign io_resp_bits_uop_stq_idx = _rpq_io_deq_bits_uop_stq_idx;
  assign io_resp_bits_uop_rxq_idx = _rpq_io_deq_bits_uop_rxq_idx;
  assign io_resp_bits_uop_pdst = _rpq_io_deq_bits_uop_pdst;
  assign io_resp_bits_uop_prs1 = _rpq_io_deq_bits_uop_prs1;
  assign io_resp_bits_uop_prs2 = _rpq_io_deq_bits_uop_prs2;
  assign io_resp_bits_uop_prs3 = _rpq_io_deq_bits_uop_prs3;
  assign io_resp_bits_uop_ppred = _rpq_io_deq_bits_uop_ppred;
  assign io_resp_bits_uop_prs1_busy = _rpq_io_deq_bits_uop_prs1_busy;
  assign io_resp_bits_uop_prs2_busy = _rpq_io_deq_bits_uop_prs2_busy;
  assign io_resp_bits_uop_prs3_busy = _rpq_io_deq_bits_uop_prs3_busy;
  assign io_resp_bits_uop_ppred_busy = _rpq_io_deq_bits_uop_ppred_busy;
  assign io_resp_bits_uop_stale_pdst = _rpq_io_deq_bits_uop_stale_pdst;
  assign io_resp_bits_uop_exception = _rpq_io_deq_bits_uop_exception;
  assign io_resp_bits_uop_exc_cause = _rpq_io_deq_bits_uop_exc_cause;
  assign io_resp_bits_uop_bypassable = _rpq_io_deq_bits_uop_bypassable;
  assign io_resp_bits_uop_mem_cmd = _rpq_io_deq_bits_uop_mem_cmd;
  assign io_resp_bits_uop_mem_size = _rpq_io_deq_bits_uop_mem_size;
  assign io_resp_bits_uop_mem_signed = _rpq_io_deq_bits_uop_mem_signed;
  assign io_resp_bits_uop_is_fence = _rpq_io_deq_bits_uop_is_fence;
  assign io_resp_bits_uop_is_fencei = _rpq_io_deq_bits_uop_is_fencei;
  assign io_resp_bits_uop_is_amo = _rpq_io_deq_bits_uop_is_amo;
  assign io_resp_bits_uop_uses_ldq = _rpq_io_deq_bits_uop_uses_ldq;
  assign io_resp_bits_uop_uses_stq = _rpq_io_deq_bits_uop_uses_stq;
  assign io_resp_bits_uop_is_sys_pc2epc = _rpq_io_deq_bits_uop_is_sys_pc2epc;
  assign io_resp_bits_uop_is_unique = _rpq_io_deq_bits_uop_is_unique;
  assign io_resp_bits_uop_flush_on_commit = _rpq_io_deq_bits_uop_flush_on_commit;
  assign io_resp_bits_uop_ldst_is_rs1 = _rpq_io_deq_bits_uop_ldst_is_rs1;
  assign io_resp_bits_uop_ldst = _rpq_io_deq_bits_uop_ldst;
  assign io_resp_bits_uop_lrs1 = _rpq_io_deq_bits_uop_lrs1;
  assign io_resp_bits_uop_lrs2 = _rpq_io_deq_bits_uop_lrs2;
  assign io_resp_bits_uop_lrs3 = _rpq_io_deq_bits_uop_lrs3;
  assign io_resp_bits_uop_ldst_val = _rpq_io_deq_bits_uop_ldst_val;
  assign io_resp_bits_uop_dst_rtype = _rpq_io_deq_bits_uop_dst_rtype;
  assign io_resp_bits_uop_lrs1_rtype = _rpq_io_deq_bits_uop_lrs1_rtype;
  assign io_resp_bits_uop_lrs2_rtype = _rpq_io_deq_bits_uop_lrs2_rtype;
  assign io_resp_bits_uop_frs3_en = _rpq_io_deq_bits_uop_frs3_en;
  assign io_resp_bits_uop_fp_val = _rpq_io_deq_bits_uop_fp_val;
  assign io_resp_bits_uop_fp_single = _rpq_io_deq_bits_uop_fp_single;
  assign io_resp_bits_uop_xcpt_pf_if = _rpq_io_deq_bits_uop_xcpt_pf_if;
  assign io_resp_bits_uop_xcpt_ae_if = _rpq_io_deq_bits_uop_xcpt_ae_if;
  assign io_resp_bits_uop_xcpt_ma_if = _rpq_io_deq_bits_uop_xcpt_ma_if;
  assign io_resp_bits_uop_bp_debug_if = _rpq_io_deq_bits_uop_bp_debug_if;
  assign io_resp_bits_uop_bp_xcpt_if = _rpq_io_deq_bits_uop_bp_xcpt_if;
  assign io_resp_bits_uop_debug_fsrc = _rpq_io_deq_bits_uop_debug_fsrc;
  assign io_resp_bits_uop_debug_tsrc = _rpq_io_deq_bits_uop_debug_tsrc;
  assign io_resp_bits_data = {_rpq_io_deq_bits_uop_mem_size == 2'h0 ? {56{_rpq_io_deq_bits_uop_mem_signed & io_resp_bits_data_zeroed_2[7]}} : {_rpq_io_deq_bits_uop_mem_size == 2'h1 ? {48{_rpq_io_deq_bits_uop_mem_signed & io_resp_bits_data_zeroed_1[15]}} : {_rpq_io_deq_bits_uop_mem_size == 2'h2 ? {32{_rpq_io_deq_bits_uop_mem_signed & io_resp_bits_data_zeroed[31]}} : data_word[63:32], io_resp_bits_data_zeroed[31:16]}, io_resp_bits_data_zeroed_1[15:8]}, io_resp_bits_data_zeroed_2};
  assign io_resp_bits_is_hella = _rpq_io_deq_bits_is_hella;
  assign io_probe_rdy = ~(|meta_hazard) & (~(|state) | _io_probe_rdy_T_2 | _io_probe_rdy_T_3 | _io_probe_rdy_T_4 | _io_probe_rdy_T_8 & grantack_valid);
endmodule

