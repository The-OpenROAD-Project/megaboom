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

module TLBroadcastTracker_1(
  input         clock,
                reset,
                io_in_a_first,
  output        io_in_a_ready,
  input         io_in_a_valid,
  input  [2:0]  io_in_a_bits_opcode,
                io_in_a_bits_param,
                io_in_a_bits_size,
  input  [3:0]  io_in_a_bits_source,
  input  [32:0] io_in_a_bits_address,
  input  [7:0]  io_in_a_bits_mask,
  input  [63:0] io_in_a_bits_data,
  input         io_out_a_ready,
  output        io_out_a_valid,
  output [2:0]  io_out_a_bits_opcode,
                io_out_a_bits_param,
                io_out_a_bits_size,
  output [5:0]  io_out_a_bits_source,
  output [32:0] io_out_a_bits_address,
  output [7:0]  io_out_a_bits_mask,
  output [63:0] io_out_a_bits_data,
  input         io_probedack,
                io_d_last,
  output [3:0]  io_source,
  output [26:0] io_line,
  output        io_idle,
                io_need_d
);

  wire        _io_in_a_ready_output;
  wire        _o_data_q_io_enq_ready;
  reg         got_e;
  reg         sent_d;
  reg  [2:0]  opcode;
  reg  [2:0]  param;
  reg  [2:0]  size;
  reg  [3:0]  source;
  reg  [32:0] address;
  wire        idle = got_e & sent_d;
  wire        _GEN = _io_in_a_ready_output & io_in_a_valid & io_in_a_first;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (_GEN & ~reset & ~idle) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Broadcast.scala:439 assert (idle)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_d_last & ~reset & sent_d) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Broadcast.scala:460 assert (!sent_d)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_probedack & ~reset) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Broadcast.scala:469 assert (count > 0.U)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  assign _io_in_a_ready_output = (idle | ~io_in_a_first) & _o_data_q_io_enq_ready;
  wire        acquire = opcode == 3'h6 | (&opcode);
  always @(posedge clock) begin
    if (reset) begin
      got_e <= 1'h1;
      sent_d <= 1'h1;
      address <= 33'h40;
    end
    else begin
      if (_GEN) begin
        got_e <= io_in_a_bits_opcode != 3'h6 & io_in_a_bits_opcode != 3'h7;
        address <= io_in_a_bits_address;
      end
      sent_d <= io_d_last | ~_GEN & sent_d;
    end
    if (_GEN) begin
      opcode <= io_in_a_bits_opcode;
      param <= io_in_a_bits_param;
      size <= io_in_a_bits_size;
      source <= io_in_a_bits_source;
    end
  end // always @(posedge)
  Queue_52 o_data_q (
    .clock            (clock),
    .reset            (reset),
    .io_enq_ready     (_o_data_q_io_enq_ready),
    .io_enq_valid     ((idle | ~io_in_a_first) & io_in_a_valid),
    .io_enq_bits_mask (io_in_a_bits_mask),
    .io_enq_bits_data (io_in_a_bits_data),
    .io_deq_ready     (io_out_a_ready),
    .io_deq_valid     (io_out_a_valid),
    .io_deq_bits_mask (io_out_a_bits_mask),
    .io_deq_bits_data (io_out_a_bits_data)
  );
  assign io_in_a_ready = _io_in_a_ready_output;
  assign io_out_a_bits_opcode = acquire ? 3'h4 : opcode;
  assign io_out_a_bits_param = acquire ? 3'h0 : param;
  assign io_out_a_bits_size = size;
  assign io_out_a_bits_source = {{2{acquire}}, source};
  assign io_out_a_bits_address = address;
  assign io_source = source;
  assign io_line = address[32:6];
  assign io_idle = idle;
  assign io_need_d = ~sent_d;
endmodule

