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

module RecFNToRecFN(
  input  [64:0] io_in,
  input  [2:0]  io_roundingMode,
  input         io_detectTininess,
  output [32:0] io_out,
  output [4:0]  io_exceptionFlags
);

  wire rawIn_isNaN = (&(io_in[63:62])) & io_in[61];
  RoundAnyRawFNToRecFN_4 roundAnyRawFNToRecFN (
    .io_invalidExc     (rawIn_isNaN & ~(io_in[51])),
    .io_in_isNaN       (rawIn_isNaN),
    .io_in_isInf       ((&(io_in[63:62])) & ~(io_in[61])),
    .io_in_isZero      (~(|(io_in[63:61]))),
    .io_in_sign        (io_in[64]),
    .io_in_sExp        ({1'h0, io_in[63:52]}),
    .io_in_sig         ({1'h0, |(io_in[63:61]), io_in[51:0]}),
    .io_roundingMode   (io_roundingMode),
    .io_detectTininess (io_detectTininess),
    .io_out            (io_out),
    .io_exceptionFlags (io_exceptionFlags)
  );
endmodule

