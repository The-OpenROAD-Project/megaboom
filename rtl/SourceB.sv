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

module SourceB(
  input         clock,
                reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [2:0]  io_req_bits_param,
  input  [16:0] io_req_bits_tag,
  input  [9:0]  io_req_bits_set,
  input         io_req_bits_clients,
                io_b_ready,
  output        io_b_valid,
  output [1:0]  io_b_bits_param,
  output [32:0] io_b_bits_address
);

  reg         busy;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~(~io_req_valid | io_req_bits_clients)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at SourceB.scala:59 assert (!io.req.valid || io.req.bits.clients =/= 0.U)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        _param_T_1 = ~busy & io_req_valid;
  wire        b_valid = busy | io_req_valid;
  reg  [16:0] tag_r;
  reg  [9:0]  set_r;
  reg  [2:0]  param_r;
  always @(posedge clock) begin
    if (reset)
      busy <= 1'h0;
    else
      busy <= (busy | _param_T_1 & io_req_bits_clients) & ~(io_b_ready & b_valid & (busy ? busy : io_req_bits_clients));
    if (_param_T_1) begin
      tag_r <= io_req_bits_tag;
      set_r <= io_req_bits_set;
      param_r <= io_req_bits_param;
    end
  end // always @(posedge)
  assign io_req_ready = ~busy;
  assign io_b_valid = b_valid;
  assign io_b_bits_param = busy ? param_r[1:0] : io_req_bits_param[1:0];
  assign io_b_bits_address = {busy ? tag_r : io_req_bits_tag, busy ? set_r : io_req_bits_set, 6'h0};
endmodule

