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

module Repeater_6(
  input          clock,
                 reset,
                 io_repeat,
  output         io_enq_ready,
  input          io_enq_valid,
  input  [2:0]   io_enq_bits_opcode,
                 io_enq_bits_param,
  input  [3:0]   io_enq_bits_size,
                 io_enq_bits_source,
  input  [32:0]  io_enq_bits_address,
  input  [127:0] io_enq_bits_data,
  input          io_deq_ready,
  output         io_deq_valid,
  output [2:0]   io_deq_bits_opcode,
                 io_deq_bits_param,
  output [3:0]   io_deq_bits_size,
                 io_deq_bits_source,
  output [32:0]  io_deq_bits_address,
  output [127:0] io_deq_bits_data
);

  reg          full;
  reg  [2:0]   saved_opcode;
  reg  [2:0]   saved_param;
  reg  [3:0]   saved_size;
  reg  [3:0]   saved_source;
  reg  [32:0]  saved_address;
  reg  [127:0] saved_data;
  wire         _io_deq_valid_output = io_enq_valid | full;
  wire         _io_enq_ready_output = io_deq_ready & ~full;
  wire         _GEN = _io_enq_ready_output & io_enq_valid & io_repeat;
  always @(posedge clock) begin
    if (reset)
      full <= 1'h0;
    else
      full <= ~(io_deq_ready & _io_deq_valid_output & ~io_repeat) & (_GEN | full);
    if (_GEN) begin
      saved_opcode <= io_enq_bits_opcode;
      saved_param <= io_enq_bits_param;
      saved_size <= io_enq_bits_size;
      saved_source <= io_enq_bits_source;
      saved_address <= io_enq_bits_address;
      saved_data <= io_enq_bits_data;
    end
  end // always @(posedge)
  assign io_enq_ready = _io_enq_ready_output;
  assign io_deq_valid = _io_deq_valid_output;
  assign io_deq_bits_opcode = full ? saved_opcode : io_enq_bits_opcode;
  assign io_deq_bits_param = full ? saved_param : io_enq_bits_param;
  assign io_deq_bits_size = full ? saved_size : io_enq_bits_size;
  assign io_deq_bits_source = full ? saved_source : io_enq_bits_source;
  assign io_deq_bits_address = full ? saved_address : io_enq_bits_address;
  assign io_deq_bits_data = full ? saved_data : io_enq_bits_data;
endmodule

