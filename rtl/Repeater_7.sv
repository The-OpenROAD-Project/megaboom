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

module Repeater_7(
  input         clock,
                reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [32:0] io_enq_bits_address,
  input         io_deq_ready,
  output        io_deq_valid,
  output [32:0] io_deq_bits_address
);

  reg  full;
  wire _io_deq_valid_output = io_enq_valid | full;
  always @(posedge clock) begin
    if (reset)
      full <= 1'h0;
    else
      full <= ~(io_deq_ready & _io_deq_valid_output) & full;
  end // always @(posedge)
  assign io_enq_ready = io_deq_ready & ~full;
  assign io_deq_valid = _io_deq_valid_output;
  assign io_deq_bits_address = full ? 33'h0 : io_enq_bits_address;
endmodule

