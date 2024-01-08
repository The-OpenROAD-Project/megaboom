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

module RoundAnyRawFNToRecFN_5(
  input         io_invalidExc,
                io_in_isNaN,
                io_in_isInf,
                io_in_isZero,
                io_in_sign,
  input  [9:0]  io_in_sExp,
  input  [24:0] io_in_sig,
  output [64:0] io_out
);

  wire isNaNOut = io_invalidExc | io_in_isNaN;
  assign io_out = {~isNaNOut & io_in_sign, {{2{io_in_sExp[9]}}, io_in_sExp} + 12'h700 & ~(io_in_isZero ? 12'hE00 : 12'h0) & {2'h3, ~io_in_isInf, 9'h1FF} | (io_in_isInf ? 12'hC00 : 12'h0) | (isNaNOut ? 12'hE00 : 12'h0), isNaNOut | io_in_isZero ? {isNaNOut, 51'h0} : {io_in_sig[22:0], 29'h0}};
endmodule

