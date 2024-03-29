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

module RoundAnyRawFNToRecFN_7(
  input         io_invalidExc,
                io_infiniteExc,
                io_in_isNaN,
                io_in_isInf,
                io_in_isZero,
                io_in_sign,
  input  [12:0] io_in_sExp,
  input  [55:0] io_in_sig,
  input  [2:0]  io_roundingMode,
  output [64:0] io_out,
  output [4:0]  io_exceptionFlags
);

  wire        roundingMode_near_even = io_roundingMode == 3'h0;
  wire        roundingMode_odd = io_roundingMode == 3'h6;
  wire        roundMagUp = io_roundingMode == 3'h2 & io_in_sign | io_roundingMode == 3'h3 & ~io_in_sign;
  wire [11:0] _roundMask_T_1 = ~(io_in_sExp[11:0]);
  wire [64:0] roundMask_shift = $signed(65'sh10000000000000000 >>> _roundMask_T_1[5:0]);
  wire [7:0]  _GEN = {{roundMask_shift[24:21], roundMask_shift[28:27]} & 6'h33, 2'h0} | {roundMask_shift[28:25], roundMask_shift[32:29]} & 8'h33;
  wire [18:0] _GEN_0 = {roundMask_shift[18:17], roundMask_shift[20:19], roundMask_shift[22:21], _GEN, roundMask_shift[32:31], roundMask_shift[34:33], roundMask_shift[36]} & 19'h55555;
  wire [64:0] roundMask_shift_1 = $signed(65'sh10000000000000000 >>> _roundMask_T_1[5:0]);
  wire [53:0] _roundMask_T_129 = _roundMask_T_1[11] ? (_roundMask_T_1[10] ? {~(_roundMask_T_1[9] | _roundMask_T_1[8] | _roundMask_T_1[7] | _roundMask_T_1[6] ? 51'h0 : ~{roundMask_shift[13], roundMask_shift[14], roundMask_shift[15], roundMask_shift[16], roundMask_shift[17], _GEN_0[18:15] | {roundMask_shift[20:19], roundMask_shift[22:21]} & 4'h5, _GEN_0[14:7] | _GEN & 8'h55, _GEN[1], _GEN_0[5] | roundMask_shift[31], roundMask_shift[32], roundMask_shift[33], {_GEN_0[2:0], 1'h0} | {roundMask_shift[36:35], roundMask_shift[38:37]} & 4'h5, roundMask_shift[38], roundMask_shift[39], roundMask_shift[40], roundMask_shift[41], roundMask_shift[42], roundMask_shift[43], roundMask_shift[44], roundMask_shift[45], roundMask_shift[46], roundMask_shift[47], roundMask_shift[48], roundMask_shift[49], {{roundMask_shift[50:49], roundMask_shift[52]} & 3'h5, 1'h0} | {roundMask_shift[52:51], roundMask_shift[54:53]} & 4'h5, roundMask_shift[54], roundMask_shift[55], roundMask_shift[56], roundMask_shift[57], roundMask_shift[58], roundMask_shift[59], roundMask_shift[60], roundMask_shift[61], roundMask_shift[62], roundMask_shift[63]}), 3'h7} : {51'h0, _roundMask_T_1[9] & _roundMask_T_1[8] & _roundMask_T_1[7] & _roundMask_T_1[6] ? {roundMask_shift_1[0], roundMask_shift_1[1], roundMask_shift_1[2]} : 3'h0}) : 54'h0;
  wire [54:0] _GEN_1 = {1'h1, ~_roundMask_T_129};
  wire [54:0] _GEN_2 = {_roundMask_T_129, 1'h1};
  wire [54:0] _roundPosBit_T = io_in_sig[55:1] & _GEN_1 & _GEN_2;
  wire [54:0] _anyRoundExtra_T = io_in_sig[54:0] & _GEN_2;
  wire        anyRound = (|_roundPosBit_T) | (|_anyRoundExtra_T);
  wire        _overflow_roundMagUp_T = roundingMode_near_even | io_roundingMode == 3'h4;
  wire [54:0] roundedSig = _overflow_roundMagUp_T & (|_roundPosBit_T) | roundMagUp & anyRound ? {1'h0, io_in_sig[55:2] | _roundMask_T_129} + 55'h1 & ~(roundingMode_near_even & (|_roundPosBit_T) & ~(|_anyRoundExtra_T) ? {_roundMask_T_129, 1'h1} : 55'h0) : {1'h0, io_in_sig[55:2] & ~_roundMask_T_129} | (roundingMode_odd & anyRound ? _GEN_1 & _GEN_2 : 55'h0);
  wire [13:0] sRoundedExp = {io_in_sExp[12], io_in_sExp} + {12'h0, roundedSig[54:53]};
  wire        common_totalUnderflow = $signed(sRoundedExp) < 14'sh3CE;
  wire        isNaNOut = io_invalidExc | io_in_isNaN;
  wire        notNaN_isSpecialInfOut = io_infiniteExc | io_in_isInf;
  wire        commonCase = ~isNaNOut & ~notNaN_isSpecialInfOut & ~io_in_isZero;
  wire        overflow = commonCase & $signed(sRoundedExp[13:10]) > 4'sh2;
  wire        overflow_roundMagUp = _overflow_roundMagUp_T | roundMagUp;
  wire        pegMinNonzeroMagOut = commonCase & common_totalUnderflow & (roundMagUp | roundingMode_odd);
  wire        pegMaxFiniteMagOut = overflow & ~overflow_roundMagUp;
  wire        notNaN_isInfOut = notNaN_isSpecialInfOut | overflow & overflow_roundMagUp;
  assign io_out = {~isNaNOut & io_in_sign, sRoundedExp[11:0] & ~(io_in_isZero | common_totalUnderflow ? 12'hE00 : 12'h0) & ~(pegMinNonzeroMagOut ? 12'hC31 : 12'h0) & {1'h1, ~pegMaxFiniteMagOut, 10'h3FF} & {2'h3, ~notNaN_isInfOut, 9'h1FF} | (pegMinNonzeroMagOut ? 12'h3CE : 12'h0) | (pegMaxFiniteMagOut ? 12'hBFF : 12'h0) | (notNaN_isInfOut ? 12'hC00 : 12'h0) | (isNaNOut ? 12'hE00 : 12'h0), (isNaNOut | io_in_isZero | common_totalUnderflow ? {isNaNOut, 51'h0} : roundedSig[51:0]) | {52{pegMaxFiniteMagOut}}};
  assign io_exceptionFlags = {io_invalidExc, io_infiniteExc, overflow, commonCase & (common_totalUnderflow | anyRound & io_in_sExp[12:11] != 2'h1 & _roundMask_T_129[0]), overflow | commonCase & (common_totalUnderflow | anyRound)};
endmodule

