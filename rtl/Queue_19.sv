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

module Queue_19(
  input          clock,
                 reset,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [39:0]  io_enq_bits_pc,
  input  [127:0] io_enq_bits_data,
  input  [7:0]   io_enq_bits_mask,
  input          io_enq_bits_xcpt_pf_inst,
                 io_enq_bits_xcpt_gf_inst,
                 io_enq_bits_xcpt_ae_inst,
  input  [63:0]  io_enq_bits_ghist_old_history,
  input          io_enq_bits_ghist_current_saw_branch_not_taken,
                 io_enq_bits_ghist_new_saw_branch_not_taken,
                 io_enq_bits_ghist_new_saw_branch_taken,
  input  [4:0]   io_enq_bits_ghist_ras_idx,
  input  [1:0]   io_enq_bits_fsrc,
                 io_enq_bits_tsrc,
  input          io_deq_ready,
  output         io_deq_valid,
  output [39:0]  io_deq_bits_pc,
  output [127:0] io_deq_bits_data,
  output [7:0]   io_deq_bits_mask,
  output         io_deq_bits_xcpt_pf_inst,
                 io_deq_bits_xcpt_ae_inst,
  output [63:0]  io_deq_bits_ghist_old_history,
  output         io_deq_bits_ghist_current_saw_branch_not_taken,
                 io_deq_bits_ghist_new_saw_branch_not_taken,
                 io_deq_bits_ghist_new_saw_branch_taken,
  output [4:0]   io_deq_bits_ghist_ras_idx,
  output [1:0]   io_deq_bits_fsrc,
                 io_deq_bits_tsrc
);

  reg  [254:0] ram;
  reg          full;
  wire         _io_enq_ready_output = io_deq_ready | ~full;
  wire         do_enq = _io_enq_ready_output & io_enq_valid;
  always @(posedge clock) begin
    if (do_enq)
      ram <= {io_enq_bits_tsrc, io_enq_bits_fsrc, io_enq_bits_ghist_ras_idx, io_enq_bits_ghist_new_saw_branch_taken, io_enq_bits_ghist_new_saw_branch_not_taken, io_enq_bits_ghist_current_saw_branch_not_taken, io_enq_bits_ghist_old_history, io_enq_bits_xcpt_ae_inst, io_enq_bits_xcpt_gf_inst, io_enq_bits_xcpt_pf_inst, io_enq_bits_mask, io_enq_bits_data, io_enq_bits_pc};
    if (reset)
      full <= 1'h0;
    else if (~(do_enq == (io_deq_ready & full)))
      full <= do_enq;
  end // always @(posedge)
  assign io_enq_ready = _io_enq_ready_output;
  assign io_deq_valid = full;
  assign io_deq_bits_pc = ram[39:0];
  assign io_deq_bits_data = ram[167:40];
  assign io_deq_bits_mask = ram[175:168];
  assign io_deq_bits_xcpt_pf_inst = ram[176];
  assign io_deq_bits_xcpt_ae_inst = ram[178];
  assign io_deq_bits_ghist_old_history = ram[242:179];
  assign io_deq_bits_ghist_current_saw_branch_not_taken = ram[243];
  assign io_deq_bits_ghist_new_saw_branch_not_taken = ram[244];
  assign io_deq_bits_ghist_new_saw_branch_taken = ram[245];
  assign io_deq_bits_ghist_ras_idx = ram[250:246];
  assign io_deq_bits_fsrc = ram[252:251];
  assign io_deq_bits_tsrc = ram[254:253];
endmodule

