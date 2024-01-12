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

module CompareRecFN(
  input  [64:0] io_a,
                io_b,
  input         io_signaling,
  output        io_lt,
                io_eq,
  output [4:0]  io_exceptionFlags
);

  wire        rawA_isNaN = (&(io_a[63:62])) & io_a[61];
  wire        rawB_isNaN = (&(io_b[63:62])) & io_b[61];
  wire        ordered = ~rawA_isNaN & ~rawB_isNaN;
  wire        bothInfs = (&(io_a[63:62])) & ~(io_a[61]) & (&(io_b[63:62])) & ~(io_b[61]);
  wire        bothZeros = ~(|(io_a[63:61])) & ~(|(io_b[63:61]));
  wire        eqExps = io_a[63:52] == io_b[63:52];
  wire [52:0] _GEN = {|(io_a[63:61]), io_a[51:0]};
  wire [52:0] _GEN_0 = {|(io_b[63:61]), io_b[51:0]};
  wire        common_ltMags = $signed({1'h0, io_a[63:52]}) < $signed({1'h0, io_b[63:52]}) | eqExps & _GEN < _GEN_0;
  wire        common_eqMags = eqExps & _GEN == _GEN_0;
  assign io_lt = ordered & ~bothZeros & (io_a[64] & ~(io_b[64]) | ~bothInfs & (io_a[64] & ~common_ltMags & ~common_eqMags | ~(io_b[64]) & common_ltMags));
  assign io_eq = ordered & (bothZeros | io_a[64] == io_b[64] & (bothInfs | common_eqMags));
  assign io_exceptionFlags = {rawA_isNaN & ~(io_a[51]) | rawB_isNaN & ~(io_b[51]) | io_signaling & ~ordered, 4'h0};
endmodule

