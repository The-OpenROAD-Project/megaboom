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

module Queue_28(
  input         clock,
                reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [2:0]  io_enq_bits_opcode,
                io_enq_bits_param,
                io_enq_bits_size,
  input  [5:0]  io_enq_bits_source,
  input  [32:0] io_enq_bits_address,
  input  [7:0]  io_enq_bits_mask,
  input  [63:0] io_enq_bits_data,
  input         io_enq_bits_corrupt,
                io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
                io_deq_bits_param,
                io_deq_bits_size,
  output [5:0]  io_deq_bits_source,
  output [32:0] io_deq_bits_address,
  output [7:0]  io_deq_bits_mask,
  output [63:0] io_deq_bits_data,
  output        io_deq_bits_corrupt
);

  reg  [120:0] ram;
  reg          full;
  wire         _io_deq_valid_output = io_enq_valid | full;
  wire         do_enq = ~(~full & io_deq_ready) & ~full & io_enq_valid;
  always @(posedge clock) begin
    if (do_enq)
      ram <= {io_enq_bits_corrupt, io_enq_bits_data, io_enq_bits_mask, io_enq_bits_address, io_enq_bits_source, io_enq_bits_size, io_enq_bits_param, io_enq_bits_opcode};
    if (reset)
      full <= 1'h0;
    else if (~(do_enq == (full & io_deq_ready & _io_deq_valid_output)))
      full <= do_enq;
  end // always @(posedge)
  assign io_enq_ready = ~full;
  assign io_deq_valid = _io_deq_valid_output;
  assign io_deq_bits_opcode = full ? ram[2:0] : io_enq_bits_opcode;
  assign io_deq_bits_param = full ? ram[5:3] : io_enq_bits_param;
  assign io_deq_bits_size = full ? ram[8:6] : io_enq_bits_size;
  assign io_deq_bits_source = full ? ram[14:9] : io_enq_bits_source;
  assign io_deq_bits_address = full ? ram[47:15] : io_enq_bits_address;
  assign io_deq_bits_mask = full ? ram[55:48] : io_enq_bits_mask;
  assign io_deq_bits_data = full ? ram[119:56] : io_enq_bits_data;
  assign io_deq_bits_corrupt = full ? ram[120] : io_enq_bits_corrupt;
endmodule

