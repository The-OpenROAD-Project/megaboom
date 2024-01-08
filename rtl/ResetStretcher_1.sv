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

module ResetStretcher_1(
  input  clock,
         reset,
  output io_reset_out
);

  wire       _resetout_io_q;
  wire [5:0] _count_io_q;
  AsyncResetRegVec_w6_i0 count (
    .clock (clock),
    .reset (reset),
    .io_d  (_count_io_q + 6'h1),
    .io_q  (_count_io_q),
    .io_en (_resetout_io_q)
  );
  AsyncResetRegVec_w1_i1 resetout (
    .clock (clock),
    .reset (reset),
    .io_d  (_count_io_q < 6'h27),
    .io_q  (_resetout_io_q),
    .io_en (_resetout_io_q)
  );
  assign io_reset_out = _resetout_io_q;
endmodule

