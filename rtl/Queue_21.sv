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

module Queue_21(
  input          clock,
                 reset,
                 io_enq_valid,
  input  [7:0]   io_enq_bits_btb_mispredicts,
  input  [39:0]  io_enq_bits_pc,
  input  [63:0]  io_enq_bits_ghist_old_history,
  input          io_enq_bits_ghist_current_saw_branch_not_taken,
                 io_enq_bits_ghist_new_saw_branch_not_taken,
                 io_enq_bits_ghist_new_saw_branch_taken,
  input  [4:0]   io_enq_bits_ghist_ras_idx,
  input          io_enq_bits_lhist_0,
                 io_enq_bits_lhist_1,
  input  [119:0] io_enq_bits_meta_0,
                 io_enq_bits_meta_1,
  input          io_deq_ready,
  output         io_deq_valid,
                 io_deq_bits_is_mispredict_update,
                 io_deq_bits_is_repair_update,
  output [7:0]   io_deq_bits_btb_mispredicts,
  output [39:0]  io_deq_bits_pc,
  output [7:0]   io_deq_bits_br_mask,
  output         io_deq_bits_cfi_idx_valid,
  output [2:0]   io_deq_bits_cfi_idx_bits,
  output         io_deq_bits_cfi_taken,
                 io_deq_bits_cfi_mispredicted,
                 io_deq_bits_cfi_is_br,
                 io_deq_bits_cfi_is_jal,
  output [63:0]  io_deq_bits_ghist_old_history,
  output         io_deq_bits_ghist_new_saw_branch_not_taken,
                 io_deq_bits_ghist_new_saw_branch_taken,
  output [39:0]  io_deq_bits_target,
  output [119:0] io_deq_bits_meta_0,
                 io_deq_bits_meta_1
);

  wire         _io_enq_ready_T;
  wire [411:0] _ram_ext_R0_data;
  reg          wrap;
  reg          wrap_1;
  reg          maybe_full;
  wire         ptr_match = wrap == wrap_1;
  wire         empty = ptr_match & ~maybe_full;
  wire         do_enq = _io_enq_ready_T & io_enq_valid;
  assign _io_enq_ready_T = ~(ptr_match & maybe_full);
  wire         do_deq = io_deq_ready & ~empty;
  always @(posedge clock) begin
    if (reset) begin
      wrap <= 1'h0;
      wrap_1 <= 1'h0;
      maybe_full <= 1'h0;
    end
    else begin
      if (do_enq)
        wrap <= wrap - 1'h1;
      if (do_deq)
        wrap_1 <= wrap_1 - 1'h1;
      if (~(do_enq == do_deq))
        maybe_full <= do_enq;
    end
  end // always @(posedge)
  ram_2x412 ram_ext (
    .R0_addr (wrap_1),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_ram_ext_R0_data),
    .W0_addr (wrap),
    .W0_en   (do_enq),
    .W0_clk  (clock),
    .W0_data ({io_enq_bits_meta_1, io_enq_bits_meta_0, 40'h0, io_enq_bits_ghist_new_saw_branch_taken, io_enq_bits_ghist_new_saw_branch_not_taken, io_enq_bits_ghist_old_history, 16'h0, io_enq_bits_pc, io_enq_bits_btb_mispredicts, 2'h0})
  );
  assign io_deq_valid = ~empty;
  assign io_deq_bits_is_mispredict_update = _ram_ext_R0_data[0];
  assign io_deq_bits_is_repair_update = _ram_ext_R0_data[1];
  assign io_deq_bits_btb_mispredicts = _ram_ext_R0_data[9:2];
  assign io_deq_bits_pc = _ram_ext_R0_data[49:10];
  assign io_deq_bits_br_mask = _ram_ext_R0_data[57:50];
  assign io_deq_bits_cfi_idx_valid = _ram_ext_R0_data[58];
  assign io_deq_bits_cfi_idx_bits = _ram_ext_R0_data[61:59];
  assign io_deq_bits_cfi_taken = _ram_ext_R0_data[62];
  assign io_deq_bits_cfi_mispredicted = _ram_ext_R0_data[63];
  assign io_deq_bits_cfi_is_br = _ram_ext_R0_data[64];
  assign io_deq_bits_cfi_is_jal = _ram_ext_R0_data[65];
  assign io_deq_bits_ghist_old_history = _ram_ext_R0_data[129:66];
  assign io_deq_bits_ghist_new_saw_branch_not_taken = _ram_ext_R0_data[130];
  assign io_deq_bits_ghist_new_saw_branch_taken = _ram_ext_R0_data[131];
  assign io_deq_bits_target = _ram_ext_R0_data[171:132];
  assign io_deq_bits_meta_0 = _ram_ext_R0_data[291:172];
  assign io_deq_bits_meta_1 = _ram_ext_R0_data[411:292];
endmodule

