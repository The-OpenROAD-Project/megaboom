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

module SinkX(
  input         clock,
                reset,
                io_req_ready,
  output        io_req_valid,
  output [16:0] io_req_bits_tag,
  output [9:0]  io_req_bits_set,
  output        io_x_ready,
  input         io_x_valid,
  input  [32:0] io_x_bits_address
);

  wire [32:0] _x_q_io_deq_bits_address;
  Queue_26 x_q (
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (io_x_ready),
    .io_enq_valid        (io_x_valid),
    .io_enq_bits_address (io_x_bits_address),
    .io_deq_ready        (io_req_ready),
    .io_deq_valid        (io_req_valid),
    .io_deq_bits_address (_x_q_io_deq_bits_address)
  );
  assign io_req_bits_tag = _x_q_io_deq_bits_address[32:16];
  assign io_req_bits_set = _x_q_io_deq_bits_address[15:6];
endmodule

