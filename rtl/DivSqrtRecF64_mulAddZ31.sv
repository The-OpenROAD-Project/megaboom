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

module DivSqrtRecF64_mulAddZ31(
  input          clock,
                 reset,
  output         io_inReady_div,
                 io_inReady_sqrt,
  input          io_inValid,
                 io_sqrtOp,
  input  [64:0]  io_a,
                 io_b,
  input  [2:0]   io_roundingMode,
  output [3:0]   io_usingMulAdd,
  output         io_latchMulAddA_0,
  output [53:0]  io_mulAddA_0,
  output         io_latchMulAddB_0,
  output [53:0]  io_mulAddB_0,
  output [104:0] io_mulAddC_2,
  input  [104:0] io_mulAddResult_3,
  output         io_outValid_div,
                 io_outValid_sqrt,
  output [64:0]  io_out,
  output [4:0]   io_exceptionFlags
);

  wire [2:0]  _divSqrtRecF64ToRaw_io_roundingModeOut;
  wire        _divSqrtRecF64ToRaw_io_invalidExc;
  wire        _divSqrtRecF64ToRaw_io_infiniteExc;
  wire        _divSqrtRecF64ToRaw_io_rawOut_isNaN;
  wire        _divSqrtRecF64ToRaw_io_rawOut_isInf;
  wire        _divSqrtRecF64ToRaw_io_rawOut_isZero;
  wire        _divSqrtRecF64ToRaw_io_rawOut_sign;
  wire [12:0] _divSqrtRecF64ToRaw_io_rawOut_sExp;
  wire [55:0] _divSqrtRecF64ToRaw_io_rawOut_sig;
  DivSqrtRecF64ToRaw_mulAddZ31 divSqrtRecF64ToRaw (
    .clock               (clock),
    .reset               (reset),
    .io_inReady_div      (io_inReady_div),
    .io_inReady_sqrt     (io_inReady_sqrt),
    .io_inValid          (io_inValid),
    .io_sqrtOp           (io_sqrtOp),
    .io_a                (io_a),
    .io_b                (io_b),
    .io_roundingMode     (io_roundingMode),
    .io_usingMulAdd      (io_usingMulAdd),
    .io_latchMulAddA_0   (io_latchMulAddA_0),
    .io_mulAddA_0        (io_mulAddA_0),
    .io_latchMulAddB_0   (io_latchMulAddB_0),
    .io_mulAddB_0        (io_mulAddB_0),
    .io_mulAddC_2        (io_mulAddC_2),
    .io_mulAddResult_3   (io_mulAddResult_3),
    .io_rawOutValid_div  (io_outValid_div),
    .io_rawOutValid_sqrt (io_outValid_sqrt),
    .io_roundingModeOut  (_divSqrtRecF64ToRaw_io_roundingModeOut),
    .io_invalidExc       (_divSqrtRecF64ToRaw_io_invalidExc),
    .io_infiniteExc      (_divSqrtRecF64ToRaw_io_infiniteExc),
    .io_rawOut_isNaN     (_divSqrtRecF64ToRaw_io_rawOut_isNaN),
    .io_rawOut_isInf     (_divSqrtRecF64ToRaw_io_rawOut_isInf),
    .io_rawOut_isZero    (_divSqrtRecF64ToRaw_io_rawOut_isZero),
    .io_rawOut_sign      (_divSqrtRecF64ToRaw_io_rawOut_sign),
    .io_rawOut_sExp      (_divSqrtRecF64ToRaw_io_rawOut_sExp),
    .io_rawOut_sig       (_divSqrtRecF64ToRaw_io_rawOut_sig)
  );
  RoundRawFNToRecFN_2 roundRawFNToRecFN (
    .io_invalidExc     (_divSqrtRecF64ToRaw_io_invalidExc),
    .io_infiniteExc    (_divSqrtRecF64ToRaw_io_infiniteExc),
    .io_in_isNaN       (_divSqrtRecF64ToRaw_io_rawOut_isNaN),
    .io_in_isInf       (_divSqrtRecF64ToRaw_io_rawOut_isInf),
    .io_in_isZero      (_divSqrtRecF64ToRaw_io_rawOut_isZero),
    .io_in_sign        (_divSqrtRecF64ToRaw_io_rawOut_sign),
    .io_in_sExp        (_divSqrtRecF64ToRaw_io_rawOut_sExp),
    .io_in_sig         (_divSqrtRecF64ToRaw_io_rawOut_sig),
    .io_roundingMode   (_divSqrtRecF64ToRaw_io_roundingModeOut),
    .io_out            (io_out),
    .io_exceptionFlags (io_exceptionFlags)
  );
endmodule

