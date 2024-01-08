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

module Queue_52(
  input         clock,
                reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [7:0]  io_enq_bits_mask,
  input  [63:0] io_enq_bits_data,
  input         io_deq_ready,
  output        io_deq_valid,
  output [7:0]  io_deq_bits_mask,
  output [63:0] io_deq_bits_data
);

  wire [71:0] _ram_ext_R0_data;
  reg  [2:0]  enq_ptr_value;
  reg  [2:0]  deq_ptr_value;
  reg         maybe_full;
  wire        ptr_match = enq_ptr_value == deq_ptr_value;
  wire        empty = ptr_match & ~maybe_full;
  wire        full = ptr_match & maybe_full;
  wire        do_enq = ~full & io_enq_valid;
  wire        do_deq = io_deq_ready & ~empty;
  always @(posedge clock) begin
    if (reset) begin
      enq_ptr_value <= 3'h0;
      deq_ptr_value <= 3'h0;
      maybe_full <= 1'h0;
    end
    else begin
      if (do_enq)
        enq_ptr_value <= enq_ptr_value + 3'h1;
      if (do_deq)
        deq_ptr_value <= deq_ptr_value + 3'h1;
      if (~(do_enq == do_deq))
        maybe_full <= do_enq;
    end
  end // always @(posedge)
  ram_8x72 ram_ext (
    .R0_addr (deq_ptr_value),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_ram_ext_R0_data),
    .W0_addr (enq_ptr_value),
    .W0_en   (do_enq),
    .W0_clk  (clock),
    .W0_data ({io_enq_bits_data, io_enq_bits_mask})
  );
  assign io_enq_ready = ~full;
  assign io_deq_valid = ~empty;
  assign io_deq_bits_mask = _ram_ext_R0_data[7:0];
  assign io_deq_bits_data = _ram_ext_R0_data[71:8];
endmodule

