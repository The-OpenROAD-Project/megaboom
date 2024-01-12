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

module FPToFP(
  input         clock,
                reset,
                io_in_valid,
                io_in_bits_ren2,
  input  [1:0]  io_in_bits_typeTagOut,
  input         io_in_bits_wflags,
  input  [2:0]  io_in_bits_rm,
  input  [64:0] io_in_bits_in1,
                io_in_bits_in2,
  output        io_out_valid,
  output [64:0] io_out_bits_data,
  output [4:0]  io_out_bits_exc,
  input         io_lt
);

  wire [32:0] _narrower_io_out;
  wire [4:0]  _narrower_io_exceptionFlags;
  reg         in_pipe_v;
  reg         in_pipe_b_ren2;
  reg  [1:0]  in_pipe_b_typeTagOut;
  reg         in_pipe_b_wflags;
  reg  [2:0]  in_pipe_b_rm;
  reg  [64:0] in_pipe_b_in1;
  reg  [64:0] in_pipe_b_in2;
  wire        _GEN = in_pipe_b_wflags & ~in_pipe_b_ren2;
  wire [64:0] fsgnjMux_data = _GEN ? ((&(in_pipe_b_in1[63:61])) ? 65'hE008000000000000 : in_pipe_b_in1) : in_pipe_b_wflags ? ((&(in_pipe_b_in1[63:61])) & (&(in_pipe_b_in2[63:61])) ? 65'hE008000000000000 : (&(in_pipe_b_in2[63:61])) | in_pipe_b_rm[0] != io_lt & ~(&(in_pipe_b_in1[63:61])) ? in_pipe_b_in1 : in_pipe_b_in2) : {in_pipe_b_rm[1] ? in_pipe_b_in1[64] ^ in_pipe_b_in2[64] : in_pipe_b_rm[0] ^ in_pipe_b_in2[64], in_pipe_b_in1[63:0]};
  reg         io_out_pipe_v;
  reg  [64:0] io_out_pipe_b_data;
  reg  [4:0]  io_out_pipe_b_exc;
  reg         io_out_pipe_pipe_v;
  reg  [64:0] io_out_pipe_pipe_b_data;
  reg  [4:0]  io_out_pipe_pipe_b_exc;
  reg         io_out_pipe_pipe_pipe_v;
  reg  [64:0] io_out_pipe_pipe_pipe_b_data;
  reg  [4:0]  io_out_pipe_pipe_pipe_b_exc;
  wire        _GEN_0 = in_pipe_b_typeTagOut == 2'h0;
  wire [8:0]  _mux_data_expOut_commonCase_T = fsgnjMux_data[60:52] - 9'h100;
  always @(posedge clock) begin
    if (reset) begin
      in_pipe_v <= 1'h0;
      io_out_pipe_v <= 1'h0;
      io_out_pipe_pipe_v <= 1'h0;
      io_out_pipe_pipe_pipe_v <= 1'h0;
    end
    else begin
      in_pipe_v <= io_in_valid;
      io_out_pipe_v <= in_pipe_v;
      io_out_pipe_pipe_v <= io_out_pipe_v;
      io_out_pipe_pipe_pipe_v <= io_out_pipe_pipe_v;
    end
    if (io_in_valid) begin
      in_pipe_b_ren2 <= io_in_bits_ren2;
      in_pipe_b_typeTagOut <= io_in_bits_typeTagOut;
      in_pipe_b_wflags <= io_in_bits_wflags;
      in_pipe_b_rm <= io_in_bits_rm;
      in_pipe_b_in1 <= io_in_bits_in1;
      in_pipe_b_in2 <= io_in_bits_in2;
    end
    if (in_pipe_v) begin
      io_out_pipe_b_data <= _GEN_0 ? (_GEN ? {fsgnjMux_data[64:33], _narrower_io_out} : {fsgnjMux_data[64:33], fsgnjMux_data[64], fsgnjMux_data[63:61] == 3'h0 | fsgnjMux_data[63:61] > 3'h5 ? {fsgnjMux_data[63:61], _mux_data_expOut_commonCase_T[5:0]} : _mux_data_expOut_commonCase_T, fsgnjMux_data[51:29]}) : fsgnjMux_data;
      io_out_pipe_b_exc <= _GEN & _GEN_0 ? _narrower_io_exceptionFlags : _GEN ? {(&(in_pipe_b_in1[63:61])) & ~(in_pipe_b_in1[51]), 4'h0} : in_pipe_b_wflags ? {(&(in_pipe_b_in1[63:61])) & ~(in_pipe_b_in1[51]) | (&(in_pipe_b_in2[63:61])) & ~(in_pipe_b_in2[51]), 4'h0} : 5'h0;
    end
    if (io_out_pipe_v) begin
      io_out_pipe_pipe_b_data <= io_out_pipe_b_data;
      io_out_pipe_pipe_b_exc <= io_out_pipe_b_exc;
    end
    if (io_out_pipe_pipe_v) begin
      io_out_pipe_pipe_pipe_b_data <= io_out_pipe_pipe_b_data;
      io_out_pipe_pipe_pipe_b_exc <= io_out_pipe_pipe_b_exc;
    end
  end // always @(posedge)
  RecFNToRecFN narrower (
    .io_in             (in_pipe_b_in1),
    .io_roundingMode   (in_pipe_b_rm),
    .io_detectTininess (1'h1),
    .io_out            (_narrower_io_out),
    .io_exceptionFlags (_narrower_io_exceptionFlags)
  );
  assign io_out_valid = io_out_pipe_pipe_pipe_v;
  assign io_out_bits_data = io_out_pipe_pipe_pipe_b_data;
  assign io_out_bits_exc = io_out_pipe_pipe_pipe_b_exc;
endmodule

