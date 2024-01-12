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

module RecFNToRecFN_1(
  input  [32:0] io_in,
  output [64:0] io_out
);

  wire rawIn_isNaN = (&(io_in[31:30])) & io_in[29];
  RoundAnyRawFNToRecFN_5 roundAnyRawFNToRecFN (
    .io_invalidExc (rawIn_isNaN & ~(io_in[22])),
    .io_in_isNaN   (rawIn_isNaN),
    .io_in_isInf   ((&(io_in[31:30])) & ~(io_in[29])),
    .io_in_isZero  (~(|(io_in[31:29]))),
    .io_in_sign    (io_in[32]),
    .io_in_sExp    ({1'h0, io_in[31:23]}),
    .io_in_sig     ({1'h0, |(io_in[31:29]), io_in[22:0]}),
    .io_out        (io_out)
  );
endmodule

