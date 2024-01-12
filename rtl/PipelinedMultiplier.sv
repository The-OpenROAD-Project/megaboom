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

module PipelinedMultiplier(
  input         clock,
                reset,
                io_req_valid,
  input  [3:0]  io_req_bits_fn,
  input         io_req_bits_dw,
  input  [63:0] io_req_bits_in1,
                io_req_bits_in2,
  output [63:0] io_resp_bits_data
);

  reg          in_pipe_v;
  reg  [3:0]   in_pipe_b_fn;
  reg          in_pipe_b_dw;
  reg  [63:0]  in_pipe_b_in1;
  reg  [63:0]  in_pipe_b_in2;
  reg          io_resp_bits_data_pipe_v;
  reg  [63:0]  io_resp_bits_data_pipe_b;
  reg  [63:0]  io_resp_bits_data_pipe_pipe_b;
  wire [1:0]   decoded_invInputs = ~(in_pipe_b_fn[1:0]);
  wire [127:0] prod = {{64{(|{decoded_invInputs[1], &{decoded_invInputs[0], in_pipe_b_fn[1]}}) & in_pipe_b_in1[63]}}, in_pipe_b_in1} * {{64{decoded_invInputs[1] & in_pipe_b_in2[63]}}, in_pipe_b_in2};
  always @(posedge clock) begin
    if (reset) begin
      in_pipe_v <= 1'h0;
      io_resp_bits_data_pipe_v <= 1'h0;
    end
    else begin
      in_pipe_v <= io_req_valid;
      io_resp_bits_data_pipe_v <= in_pipe_v;
    end
    if (io_req_valid) begin
      in_pipe_b_fn <= io_req_bits_fn;
      in_pipe_b_dw <= io_req_bits_dw;
      in_pipe_b_in1 <= io_req_bits_in1;
      in_pipe_b_in2 <= io_req_bits_in2;
    end
    if (in_pipe_v)
      io_resp_bits_data_pipe_b <= (|{in_pipe_b_fn[0], in_pipe_b_fn[1]}) ? prod[127:64] : in_pipe_b_dw ? prod[63:0] : {{32{prod[31]}}, prod[31:0]};
    if (io_resp_bits_data_pipe_v)
      io_resp_bits_data_pipe_pipe_b <= io_resp_bits_data_pipe_b;
  end // always @(posedge)
  assign io_resp_bits_data = io_resp_bits_data_pipe_pipe_b;
endmodule

