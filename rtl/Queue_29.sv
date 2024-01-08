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

module Queue_29(
  input         clock,
                reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [2:0]  io_enq_bits_opcode,
  input  [1:0]  io_enq_bits_param,
  input  [2:0]  io_enq_bits_size,
  input  [5:0]  io_enq_bits_source,
  input  [2:0]  io_enq_bits_sink,
  input         io_enq_bits_denied,
  input  [63:0] io_enq_bits_data,
  input         io_enq_bits_corrupt,
                io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
  output [1:0]  io_deq_bits_param,
  output [2:0]  io_deq_bits_size,
  output [5:0]  io_deq_bits_source,
  output [2:0]  io_deq_bits_sink,
  output        io_deq_bits_denied,
  output [63:0] io_deq_bits_data,
  output        io_deq_bits_corrupt
);

  reg  [82:0] ram;
  reg         full;
  wire        _io_deq_valid_output = io_enq_valid | full;
  wire        do_enq = ~(~full & io_deq_ready) & ~full & io_enq_valid;
  always @(posedge clock) begin
    if (do_enq)
      ram <= {io_enq_bits_corrupt, io_enq_bits_data, io_enq_bits_denied, io_enq_bits_sink, io_enq_bits_source, io_enq_bits_size, io_enq_bits_param, io_enq_bits_opcode};
    if (reset)
      full <= 1'h0;
    else if (~(do_enq == (full & io_deq_ready & _io_deq_valid_output)))
      full <= do_enq;
  end // always @(posedge)
  assign io_enq_ready = ~full;
  assign io_deq_valid = _io_deq_valid_output;
  assign io_deq_bits_opcode = full ? ram[2:0] : io_enq_bits_opcode;
  assign io_deq_bits_param = full ? ram[4:3] : io_enq_bits_param;
  assign io_deq_bits_size = full ? ram[7:5] : io_enq_bits_size;
  assign io_deq_bits_source = full ? ram[13:8] : io_enq_bits_source;
  assign io_deq_bits_sink = full ? ram[16:14] : io_enq_bits_sink;
  assign io_deq_bits_denied = full ? ram[17] : io_enq_bits_denied;
  assign io_deq_bits_data = full ? ram[81:18] : io_enq_bits_data;
  assign io_deq_bits_corrupt = full ? ram[82] : io_enq_bits_corrupt;
endmodule

