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

module BroadcastFilter(
  output        io_request_ready,
  input         io_request_valid,
  input  [1:0]  io_request_bits_mshr,
  input  [32:0] io_request_bits_address,
  input         io_request_bits_allocOH,
                io_request_bits_needT,
                io_response_ready,
  output        io_response_valid,
  output [1:0]  io_response_bits_mshr,
  output [32:0] io_response_bits_address,
  output        io_response_bits_allocOH,
                io_response_bits_needT
);

  assign io_request_ready = io_response_ready;
  assign io_response_valid = io_request_valid;
  assign io_response_bits_mshr = io_request_bits_mshr;
  assign io_response_bits_address = io_request_bits_address;
  assign io_response_bits_allocOH = io_request_bits_allocOH;
  assign io_response_bits_needT = io_request_bits_needT;
endmodule

