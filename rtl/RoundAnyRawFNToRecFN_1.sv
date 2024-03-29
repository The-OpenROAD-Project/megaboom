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

module RoundAnyRawFNToRecFN_1(
  input         io_in_isZero,
                io_in_sign,
  input  [8:0]  io_in_sExp,
  input  [64:0] io_in_sig,
  input  [2:0]  io_roundingMode,
  output [64:0] io_out,
  output [4:0]  io_exceptionFlags
);

  wire        roundingMode_near_even = io_roundingMode == 3'h0;
  wire        common_inexact = io_in_sig[10] | (|(io_in_sig[9:0]));
  wire [54:0] roundedSig = (roundingMode_near_even | io_roundingMode == 3'h4) & io_in_sig[10] | (io_roundingMode == 3'h2 & io_in_sign | io_roundingMode == 3'h3 & ~io_in_sign) & common_inexact ? {1'h0, io_in_sig[64:11]} + 55'h1 & {54'h3FFFFFFFFFFFFF, ~(roundingMode_near_even & io_in_sig[10] & ~(|(io_in_sig[9:0])))} : {1'h0, io_in_sig[64:12], io_in_sig[11] | io_roundingMode == 3'h6 & common_inexact};
  assign io_out = {io_in_sign, {{3{io_in_sExp[8]}}, io_in_sExp} + {10'h0, roundedSig[54:53]} + 12'h780 & ~(io_in_isZero ? 12'hE00 : 12'h0), io_in_isZero ? 52'h0 : roundedSig[51:0]};
  assign io_exceptionFlags = {4'h0, ~io_in_isZero & common_inexact};
endmodule

