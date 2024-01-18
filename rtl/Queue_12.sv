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

module Queue_12(
  input         clock,
                reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [2:0]  io_enq_bits_opcode,
  input  [1:0]  io_enq_bits_size,
  input  [11:0] io_enq_bits_source,
  input  [63:0] io_enq_bits_data,
  input         io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
  output [1:0]  io_deq_bits_param,
                io_deq_bits_size,
  output [11:0] io_deq_bits_source,
  output        io_deq_bits_sink,
                io_deq_bits_denied,
  output [63:0] io_deq_bits_data,
  output        io_deq_bits_corrupt
);

  reg  [85:0] ram;
  reg         full;
  wire        do_enq = ~full & io_enq_valid;
  always @(posedge clock) begin
    if (do_enq)
      ram <= {1'h0, io_enq_bits_data, 2'h0, io_enq_bits_source, io_enq_bits_size, 2'h0, io_enq_bits_opcode};
    if (reset)
      full <= 1'h0;
    else if (~(do_enq == (io_deq_ready & full)))
      full <= do_enq;
  end // always @(posedge)
  assign io_enq_ready = ~full;
  assign io_deq_valid = full;
  assign io_deq_bits_opcode = ram[2:0];
  assign io_deq_bits_param = ram[4:3];
  assign io_deq_bits_size = ram[6:5];
  assign io_deq_bits_source = ram[18:7];
  assign io_deq_bits_sink = ram[19];
  assign io_deq_bits_denied = ram[20];
  assign io_deq_bits_data = ram[84:21];
  assign io_deq_bits_corrupt = ram[85];
endmodule

