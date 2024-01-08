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

module Queue_13(
  input         clock,
                reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [2:0]  io_enq_bits_opcode,
                io_enq_bits_param,
  input  [1:0]  io_enq_bits_size,
  input  [10:0] io_enq_bits_source,
  input  [25:0] io_enq_bits_address,
  input  [7:0]  io_enq_bits_mask,
  input  [63:0] io_enq_bits_data,
  input         io_enq_bits_corrupt,
                io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
                io_deq_bits_param,
  output [1:0]  io_deq_bits_size,
  output [10:0] io_deq_bits_source,
  output [25:0] io_deq_bits_address,
  output [7:0]  io_deq_bits_mask,
  output [63:0] io_deq_bits_data,
  output        io_deq_bits_corrupt
);

  reg  [117:0] ram;
  reg          full;
  wire         do_enq = ~full & io_enq_valid;
  always @(posedge clock) begin
    if (do_enq)
      ram <= {io_enq_bits_corrupt, io_enq_bits_data, io_enq_bits_mask, io_enq_bits_address, io_enq_bits_source, io_enq_bits_size, io_enq_bits_param, io_enq_bits_opcode};
    if (reset)
      full <= 1'h0;
    else if (~(do_enq == (io_deq_ready & full)))
      full <= do_enq;
  end // always @(posedge)
  assign io_enq_ready = ~full;
  assign io_deq_valid = full;
  assign io_deq_bits_opcode = ram[2:0];
  assign io_deq_bits_param = ram[5:3];
  assign io_deq_bits_size = ram[7:6];
  assign io_deq_bits_source = ram[18:8];
  assign io_deq_bits_address = ram[44:19];
  assign io_deq_bits_mask = ram[52:45];
  assign io_deq_bits_data = ram[116:53];
  assign io_deq_bits_corrupt = ram[117];
endmodule

