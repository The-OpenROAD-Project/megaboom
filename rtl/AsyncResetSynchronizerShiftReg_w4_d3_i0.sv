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

module AsyncResetSynchronizerShiftReg_w4_d3_i0(
  input        clock,
               reset,
  input  [3:0] io_d,
  output [3:0] io_q
);

  wire _output_chain_3_io_q;
  wire _output_chain_2_io_q;
  wire _output_chain_1_io_q;
  wire _output_chain_io_q;
  AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 output_chain (
    .clock (clock),
    .reset (reset),
    .io_d  (io_d[0]),
    .io_q  (_output_chain_io_q)
  );
  AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 output_chain_1 (
    .clock (clock),
    .reset (reset),
    .io_d  (io_d[1]),
    .io_q  (_output_chain_1_io_q)
  );
  AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 output_chain_2 (
    .clock (clock),
    .reset (reset),
    .io_d  (io_d[2]),
    .io_q  (_output_chain_2_io_q)
  );
  AsyncResetSynchronizerPrimitiveShiftReg_d3_i0 output_chain_3 (
    .clock (clock),
    .reset (reset),
    .io_d  (io_d[3]),
    .io_q  (_output_chain_3_io_q)
  );
  assign io_q = {_output_chain_3_io_q, _output_chain_2_io_q, _output_chain_1_io_q, _output_chain_io_q};
endmodule

