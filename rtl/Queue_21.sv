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

module Queue_21(
  input        clock,
               reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [2:0] io_enq_bits_sink,
  output       io_deq_valid,
  output [2:0] io_deq_bits_sink
);

  reg  wrap;
  reg  wrap_1;
  reg  maybe_full;
  wire ptr_match = wrap == wrap_1;
  wire empty = ptr_match & ~maybe_full;
  wire full = ptr_match & maybe_full;
  wire do_enq = ~full & io_enq_valid;
  always @(posedge clock) begin
    if (reset) begin
      wrap <= 1'h0;
      wrap_1 <= 1'h0;
      maybe_full <= 1'h0;
    end
    else begin
      if (do_enq)
        wrap <= wrap - 1'h1;
      if (~empty)
        wrap_1 <= wrap_1 - 1'h1;
      if (~(do_enq == ~empty))
        maybe_full <= do_enq;
    end
  end // always @(posedge)
  ram_sink_2x3 ram_sink_ext (
    .R0_addr (wrap_1),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (io_deq_bits_sink),
    .W0_addr (wrap),
    .W0_en   (do_enq),
    .W0_clk  (clock),
    .W0_data (io_enq_bits_sink)
  );
  assign io_enq_ready = ~full;
  assign io_deq_valid = ~empty;
endmodule

