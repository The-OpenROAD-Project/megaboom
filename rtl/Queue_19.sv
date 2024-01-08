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

module Queue_19(
  input         clock,
                reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [2:0]  io_enq_bits_opcode,
                io_enq_bits_param,
                io_enq_bits_source,
  input  [32:0] io_enq_bits_address,
  input  [63:0] io_enq_bits_data,
  input         io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
                io_deq_bits_param,
                io_deq_bits_size,
                io_deq_bits_source,
  output [32:0] io_deq_bits_address,
  output [63:0] io_deq_bits_data,
  output        io_deq_bits_corrupt,
  output [3:0]  io_count
);

  wire [109:0] _ram_ext_R0_data;
  reg  [3:0]   enq_ptr_value;
  reg  [3:0]   deq_ptr_value;
  reg          maybe_full;
  wire         ptr_match = enq_ptr_value == deq_ptr_value;
  wire         empty = ptr_match & ~maybe_full;
  wire         full = ptr_match & maybe_full;
  wire         do_enq = ~full & io_enq_valid;
  wire [3:0]   _ptr_diff_T = enq_ptr_value - deq_ptr_value;
  wire         do_deq = io_deq_ready & ~empty;
  always @(posedge clock) begin
    if (reset) begin
      enq_ptr_value <= 4'h0;
      deq_ptr_value <= 4'h0;
      maybe_full <= 1'h0;
    end
    else begin
      if (do_enq) begin
        if (enq_ptr_value == 4'hB)
          enq_ptr_value <= 4'h0;
        else
          enq_ptr_value <= enq_ptr_value + 4'h1;
      end
      if (do_deq) begin
        if (deq_ptr_value == 4'hB)
          deq_ptr_value <= 4'h0;
        else
          deq_ptr_value <= deq_ptr_value + 4'h1;
      end
      if (~(do_enq == do_deq))
        maybe_full <= do_enq;
    end
  end // always @(posedge)
  ram_12x110 ram_ext (
    .R0_addr (deq_ptr_value),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_ram_ext_R0_data),
    .W0_addr (enq_ptr_value),
    .W0_en   (do_enq),
    .W0_clk  (clock),
    .W0_data ({1'h0, io_enq_bits_data, io_enq_bits_address, io_enq_bits_source, 3'h6, io_enq_bits_param, io_enq_bits_opcode})
  );
  assign io_enq_ready = ~full;
  assign io_deq_valid = ~empty;
  assign io_deq_bits_opcode = _ram_ext_R0_data[2:0];
  assign io_deq_bits_param = _ram_ext_R0_data[5:3];
  assign io_deq_bits_size = _ram_ext_R0_data[8:6];
  assign io_deq_bits_source = _ram_ext_R0_data[11:9];
  assign io_deq_bits_address = _ram_ext_R0_data[44:12];
  assign io_deq_bits_data = _ram_ext_R0_data[108:45];
  assign io_deq_bits_corrupt = _ram_ext_R0_data[109];
  assign io_count = ptr_match ? (maybe_full ? 4'hC : 4'h0) : deq_ptr_value > enq_ptr_value ? _ptr_diff_T - 4'h4 : _ptr_diff_T;
endmodule

