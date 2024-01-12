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

module Queue_28(
  input         clock,
                reset,
  output        io_enq_ready,
  input         io_enq_valid,
                io_enq_bits_read,
  input  [22:0] io_enq_bits_index,
  input  [63:0] io_enq_bits_data,
  input  [7:0]  io_enq_bits_mask,
  input  [9:0]  io_enq_bits_extra_tlrr_extra_source,
  input  [1:0]  io_enq_bits_extra_tlrr_extra_size,
  input         io_deq_ready,
  output        io_deq_valid,
                io_deq_bits_read,
  output [22:0] io_deq_bits_index,
  output [7:0]  io_deq_bits_mask,
  output [9:0]  io_deq_bits_extra_tlrr_extra_source,
  output [1:0]  io_deq_bits_extra_tlrr_extra_size
);

  reg  [107:0] ram;
  reg          full;
  wire         do_enq = ~full & io_enq_valid;
  always @(posedge clock) begin
    if (do_enq)
      ram <= {io_enq_bits_extra_tlrr_extra_size, io_enq_bits_extra_tlrr_extra_source, io_enq_bits_mask, io_enq_bits_data, io_enq_bits_index, io_enq_bits_read};
    if (reset)
      full <= 1'h0;
    else if (~(do_enq == (io_deq_ready & full)))
      full <= do_enq;
  end // always @(posedge)
  assign io_enq_ready = ~full;
  assign io_deq_valid = full;
  assign io_deq_bits_read = ram[0];
  assign io_deq_bits_index = ram[23:1];
  assign io_deq_bits_mask = ram[95:88];
  assign io_deq_bits_extra_tlrr_extra_source = ram[105:96];
  assign io_deq_bits_extra_tlrr_extra_size = ram[107:106];
endmodule

