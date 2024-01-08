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

module SourceE(
  input        clock,
               reset,
  output       io_req_ready,
  input        io_req_valid,
  input  [2:0] io_req_bits_sink,
  output       io_e_valid,
  output [2:0] io_e_bits_sink
);

  Queue_21 io_e_q (
    .clock            (clock),
    .reset            (reset),
    .io_enq_ready     (io_req_ready),
    .io_enq_valid     (io_req_valid),
    .io_enq_bits_sink (io_req_bits_sink),
    .io_deq_valid     (io_e_valid),
    .io_deq_bits_sink (io_e_bits_sink)
  );
endmodule

