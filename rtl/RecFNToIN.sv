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

module RecFNToIN(
  input  [64:0] io_in,
  input  [2:0]  io_roundingMode,
  input         io_signedOut,
  output [63:0] io_out,
  output [2:0]  io_intExceptionFlags
);

  wire         rawIn_isNaN = (&(io_in[63:62])) & io_in[61];
  wire         magJustBelowOne = ~(io_in[63]) & (&(io_in[62:52]));
  wire         roundingMode_odd = io_roundingMode == 3'h6;
  wire [115:0] shiftedSig = {63'h0, io_in[63], io_in[51:0]} << (io_in[63] ? io_in[57:52] : 6'h0);
  wire [1:0]   _roundIncr_near_even_T_6 = {shiftedSig[51], |(shiftedSig[50:0])};
  wire         common_inexact = io_in[63] ? (|_roundIncr_near_even_T_6) : (|(io_in[63:61]));
  wire         roundIncr = io_roundingMode == 3'h0 & (io_in[63] & ((&(shiftedSig[52:51])) | (&_roundIncr_near_even_T_6)) | magJustBelowOne & (|_roundIncr_near_even_T_6)) | io_roundingMode == 3'h4 & (io_in[63] & shiftedSig[51] | magJustBelowOne) | (io_roundingMode == 3'h2 | roundingMode_odd) & io_in[64] & common_inexact | io_roundingMode == 3'h3 & ~(io_in[64]) & common_inexact;
  wire [63:0]  complUnroundedInt = {64{io_in[64]}} ^ shiftedSig[115:52];
  wire [63:0]  _roundedInt_T_3 = roundIncr ^ io_in[64] ? complUnroundedInt + 64'h1 : complUnroundedInt;
  wire         magGeOne_atOverflowEdge = io_in[62:52] == 11'h3F;
  wire         roundCarryBut2 = (&(shiftedSig[113:52])) & roundIncr;
  wire         common_overflow = io_in[63] ? (|(io_in[62:58])) | (io_signedOut ? (io_in[64] ? magGeOne_atOverflowEdge & ((|(shiftedSig[114:52])) | roundIncr) : magGeOne_atOverflowEdge | io_in[62:52] == 11'h3E & roundCarryBut2) : io_in[64] | magGeOne_atOverflowEdge & shiftedSig[114] & roundCarryBut2) : ~io_signedOut & io_in[64] & roundIncr;
  wire         invalidExc = rawIn_isNaN | (&(io_in[63:62])) & ~(io_in[61]);
  wire         excSign = ~rawIn_isNaN & io_in[64];
  assign io_out = invalidExc | common_overflow ? {io_signedOut == excSign, {63{~excSign}}} : {_roundedInt_T_3[63:1], _roundedInt_T_3[0] | roundingMode_odd & common_inexact};
  assign io_intExceptionFlags = {invalidExc, ~invalidExc & common_overflow, ~invalidExc & ~common_overflow & common_inexact};
endmodule

