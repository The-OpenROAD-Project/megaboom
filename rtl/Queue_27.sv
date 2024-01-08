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

module Queue_27(
  input         clock,
                reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [9:0]  io_enq_bits_set,
  input  [2:0]  io_enq_bits_way,
  input         io_enq_bits_data_dirty,
  input  [1:0]  io_enq_bits_data_state,
  input         io_enq_bits_data_clients,
  input  [16:0] io_enq_bits_data_tag,
  input         io_deq_ready,
  output        io_deq_valid,
  output [9:0]  io_deq_bits_set,
  output [2:0]  io_deq_bits_way,
  output        io_deq_bits_data_dirty,
  output [1:0]  io_deq_bits_data_state,
  output        io_deq_bits_data_clients,
  output [16:0] io_deq_bits_data_tag
);

  reg  [33:0] ram;
  reg         full;
  wire        do_enq = ~full & io_enq_valid;
  always @(posedge clock) begin
    if (do_enq)
      ram <= {io_enq_bits_data_tag, io_enq_bits_data_clients, io_enq_bits_data_state, io_enq_bits_data_dirty, io_enq_bits_way, io_enq_bits_set};
    if (reset)
      full <= 1'h0;
    else if (~(do_enq == (io_deq_ready & full)))
      full <= do_enq;
  end // always @(posedge)
  assign io_enq_ready = ~full;
  assign io_deq_valid = full;
  assign io_deq_bits_set = ram[9:0];
  assign io_deq_bits_way = ram[12:10];
  assign io_deq_bits_data_dirty = ram[13];
  assign io_deq_bits_data_state = ram[15:14];
  assign io_deq_bits_data_clients = ram[16];
  assign io_deq_bits_data_tag = ram[33:17];
endmodule

