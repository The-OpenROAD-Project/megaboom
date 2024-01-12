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

module FPUFMAPipe_1(
  input         clock,
                reset,
                io_in_valid,
                io_in_bits_ren3,
                io_in_bits_swap23,
  input  [2:0]  io_in_bits_rm,
  input  [1:0]  io_in_bits_fmaCmd,
  input  [64:0] io_in_bits_in1,
                io_in_bits_in2,
                io_in_bits_in3,
  output        io_out_valid,
  output [64:0] io_out_bits_data,
  output [4:0]  io_out_bits_exc
);

  wire [32:0] _fma_io_out;
  wire [4:0]  _fma_io_exceptionFlags;
  wire        _fma_io_validout;
  reg         valid;
  reg  [2:0]  in_rm;
  reg  [1:0]  in_fmaCmd;
  reg  [64:0] in_in1;
  reg  [64:0] in_in2;
  reg  [64:0] in_in3;
  reg         io_out_pipe_v;
  reg  [64:0] io_out_pipe_b_data;
  reg  [4:0]  io_out_pipe_b_exc;
  always @(posedge clock) begin
    valid <= io_in_valid;
    if (io_in_valid) begin
      in_rm <= io_in_bits_rm;
      in_fmaCmd <= io_in_bits_fmaCmd;
      in_in1 <= io_in_bits_in1;
      in_in2 <= io_in_bits_swap23 ? 65'h80000000 : io_in_bits_in2;
      in_in3 <= io_in_bits_ren3 | io_in_bits_swap23 ? io_in_bits_in3 : {32'h0, (io_in_bits_in1[32:0] ^ io_in_bits_in2[32:0]) & 33'h100000000};
    end
    if (_fma_io_validout) begin
      io_out_pipe_b_data <= {32'h0, _fma_io_out};
      io_out_pipe_b_exc <= _fma_io_exceptionFlags;
    end
    if (reset)
      io_out_pipe_v <= 1'h0;
    else
      io_out_pipe_v <= _fma_io_validout;
  end // always @(posedge)
  MulAddRecFNPipe_1 fma (
    .clock             (clock),
    .reset             (reset),
    .io_validin        (valid),
    .io_op             (in_fmaCmd),
    .io_a              (in_in1[32:0]),
    .io_b              (in_in2[32:0]),
    .io_c              (in_in3[32:0]),
    .io_roundingMode   (in_rm),
    .io_out            (_fma_io_out),
    .io_exceptionFlags (_fma_io_exceptionFlags),
    .io_validout       (_fma_io_validout)
  );
  assign io_out_valid = io_out_pipe_v;
  assign io_out_bits_data = io_out_pipe_b_data;
  assign io_out_bits_exc = io_out_pipe_b_exc;
endmodule

