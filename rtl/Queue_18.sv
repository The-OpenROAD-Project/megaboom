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

module Queue_18(
  input         clock,
                reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [2:0]  io_enq_bits_opcode,
                io_enq_bits_param,
                io_enq_bits_source,
  input  [32:0] io_enq_bits_address,
  input         io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
                io_deq_bits_param,
                io_deq_bits_size,
                io_deq_bits_source,
  output [32:0] io_deq_bits_address,
  output [7:0]  io_deq_bits_mask,
  output [63:0] io_deq_bits_data,
  output        io_deq_bits_corrupt
);

  wire [117:0] _ram_ext_R0_data;
  reg          wrap;
  reg          wrap_1;
  reg          maybe_full;
  wire         ptr_match = wrap == wrap_1;
  wire         empty = ptr_match & ~maybe_full;
  wire         full = ptr_match & maybe_full;
  wire         do_enq = ~full & io_enq_valid;
  wire         do_deq = io_deq_ready & ~empty;
  always @(posedge clock) begin
    if (reset) begin
      wrap <= 1'h0;
      wrap_1 <= 1'h0;
      maybe_full <= 1'h0;
    end
    else begin
      if (do_enq)
        wrap <= wrap - 1'h1;
      if (do_deq)
        wrap_1 <= wrap_1 - 1'h1;
      if (~(do_enq == do_deq))
        maybe_full <= do_enq;
    end
  end // always @(posedge)
  ram_2x118 ram_ext (
    .R0_addr (wrap_1),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_ram_ext_R0_data),
    .W0_addr (wrap),
    .W0_en   (do_enq),
    .W0_clk  (clock),
    .W0_data ({73'hFF, io_enq_bits_address, io_enq_bits_source, 3'h6, io_enq_bits_param, io_enq_bits_opcode})
  );
  assign io_enq_ready = ~full;
  assign io_deq_valid = ~empty;
  assign io_deq_bits_opcode = _ram_ext_R0_data[2:0];
  assign io_deq_bits_param = _ram_ext_R0_data[5:3];
  assign io_deq_bits_size = _ram_ext_R0_data[8:6];
  assign io_deq_bits_source = _ram_ext_R0_data[11:9];
  assign io_deq_bits_address = _ram_ext_R0_data[44:12];
  assign io_deq_bits_mask = _ram_ext_R0_data[52:45];
  assign io_deq_bits_data = _ram_ext_R0_data[116:53];
  assign io_deq_bits_corrupt = _ram_ext_R0_data[117];
endmodule

