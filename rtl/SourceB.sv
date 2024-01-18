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

module SourceB(
  input         clock,
                reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [2:0]  io_req_bits_param,
  input  [16:0] io_req_bits_tag,
  input  [9:0]  io_req_bits_set,
  input  [1:0]  io_req_bits_clients,
  input         io_b_ready,
  output        io_b_valid,
  output [1:0]  io_b_bits_param,
  output [6:0]  io_b_bits_source,
  output [32:0] io_b_bits_address
);

  reg  [1:0]  remain;
  wire [1:0]  todo = (|remain) ? remain : io_req_bits_clients;
  wire [1:0]  _GEN = {~(todo[0]), 1'h1} & todo;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~(~io_req_valid | (|io_req_bits_clients))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at SourceB.scala:59 assert (!io.req.valid || io.req.bits.clients =/= 0.U)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        _param_T_1 = ~(|remain) & io_req_valid;
  wire        b_valid = (|remain) | io_req_valid;
  reg  [16:0] tag_r;
  reg  [9:0]  set_r;
  reg  [2:0]  param_r;
  always @(posedge clock) begin
    if (reset)
      remain <= 2'h0;
    else
      remain <= (remain | (_param_T_1 ? io_req_bits_clients : 2'h0)) & ~(io_b_ready & b_valid ? _GEN : 2'h0);
    if (_param_T_1) begin
      tag_r <= io_req_bits_tag;
      set_r <= io_req_bits_set;
      param_r <= io_req_bits_param;
    end
  end // always @(posedge)
  assign io_req_ready = ~(|remain);
  assign io_b_valid = b_valid;
  assign io_b_bits_param = (|remain) ? param_r[1:0] : io_req_bits_param[1:0];
  assign io_b_bits_source = {1'h0, _GEN[0], 5'h0};
  assign io_b_bits_address = {(|remain) ? tag_r : io_req_bits_tag, (|remain) ? set_r : io_req_bits_set, 6'h0};
endmodule

