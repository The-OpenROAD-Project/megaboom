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

module ListBuffer_1(
  input         clock,
                reset,
  output        io_push_ready,
  input         io_push_valid,
                io_push_bits_index,
  input  [63:0] io_push_bits_data_data,
  input         io_push_bits_data_corrupt,
  output [1:0]  io_valid,
  input         io_pop_valid,
                io_pop_bits,
  output [63:0] io_data_data,
  output        io_data_corrupt
);

  wire [64:0] _data_ext_R0_data;
  wire [3:0]  _next_ext_R0_data;
  wire [3:0]  _tail_ext_R0_data;
  wire [3:0]  _tail_ext_R1_data;
  wire [3:0]  _head_ext_R0_data;
  reg  [1:0]  valid;
  reg  [15:0] used;
  wire [15:0] _freeOH_T_16 = ~used;
  wire [14:0] _freeOH_T_3 = _freeOH_T_16[14:0] | {_freeOH_T_16[13:0], 1'h0};
  wire [14:0] _freeOH_T_6 = _freeOH_T_3 | {_freeOH_T_3[12:0], 2'h0};
  wire [14:0] _freeOH_T_9 = _freeOH_T_6 | {_freeOH_T_6[10:0], 4'h0};
  wire [15:0] freeIdx_lo = {~(_freeOH_T_9 | {_freeOH_T_9[6:0], 8'h0}), 1'h1} & _freeOH_T_16;
  wire [6:0]  _freeIdx_T_3 = freeIdx_lo[15:9] | freeIdx_lo[7:1];
  wire [2:0]  _freeIdx_T_5 = _freeIdx_T_3[6:4] | _freeIdx_T_3[2:0];
  wire        _freeIdx_T_7 = _freeIdx_T_5[2] | _freeIdx_T_5[0];
  wire [1:0]  _GEN = {1'h0, io_push_bits_index};
  wire [1:0]  _push_valid_T = valid >> _GEN;
  wire        _io_push_ready_output = used != 16'hFFFF;
  wire        data_MPORT_en = _io_push_ready_output & io_push_valid;
  wire [3:0]  data_MPORT_addr = {|(freeIdx_lo[15:8]), |(_freeIdx_T_3[6:3]), |(_freeIdx_T_5[2:1]), _freeIdx_T_7};
  wire [1:0]  _GEN_0 = {1'h0, io_pop_bits};
  `ifndef SYNTHESIS
    wire [1:0] _GEN_1 = valid >> _GEN_0;
    always @(posedge clock) begin
      if (~reset & ~(~io_pop_valid | _GEN_1[0])) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at ListBuffer.scala:85 assert (!io.pop.fire || (io.valid)(io.pop.bits))\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  always @(posedge clock) begin
    if (reset) begin
      valid <= 2'h0;
      used <= 16'h0;
    end
    else begin
      valid <= valid & ~(io_pop_valid & _head_ext_R0_data == _tail_ext_R1_data ? 2'h1 << _GEN_0 : 2'h0) | (data_MPORT_en ? 2'h1 << _GEN : 2'h0);
      used <= used & ~(io_pop_valid ? 16'h1 << _head_ext_R0_data : 16'h0) | (data_MPORT_en ? freeIdx_lo : 16'h0);
    end
  end // always @(posedge)
  head_2x4 head_ext (
    .R0_addr (io_pop_bits),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_head_ext_R0_data),
    .W0_addr (io_pop_bits),
    .W0_en   (io_pop_valid),
    .W0_clk  (clock),
    .W0_data (data_MPORT_en & _push_valid_T[0] & _tail_ext_R0_data == _head_ext_R0_data ? {|(freeIdx_lo[15:8]), |(_freeIdx_T_3[6:3]), |(_freeIdx_T_5[2:1]), _freeIdx_T_7} : _next_ext_R0_data),
    .W1_addr (io_push_bits_index),
    .W1_en   (data_MPORT_en & ~(_push_valid_T[0])),
    .W1_clk  (clock),
    .W1_data (data_MPORT_addr)
  );
  tail_2x4 tail_ext (
    .R0_addr (io_push_bits_index),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_tail_ext_R0_data),
    .R1_addr (io_pop_bits),
    .R1_en   (io_pop_valid),
    .R1_clk  (clock),
    .R1_data (_tail_ext_R1_data),
    .W0_addr (io_push_bits_index),
    .W0_en   (data_MPORT_en),
    .W0_clk  (clock),
    .W0_data (data_MPORT_addr)
  );
  next_16x4 next_ext (
    .R0_addr (_head_ext_R0_data),
    .R0_en   (io_pop_valid),
    .R0_clk  (clock),
    .R0_data (_next_ext_R0_data),
    .W0_addr (_tail_ext_R0_data),
    .W0_en   (data_MPORT_en & _push_valid_T[0]),
    .W0_clk  (clock),
    .W0_data (data_MPORT_addr)
  );
  data_16x65 data_ext (
    .R0_addr (_head_ext_R0_data),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_data_ext_R0_data),
    .W0_addr (data_MPORT_addr),
    .W0_en   (data_MPORT_en),
    .W0_clk  (clock),
    .W0_data ({io_push_bits_data_corrupt, io_push_bits_data_data})
  );
  assign io_push_ready = _io_push_ready_output;
  assign io_valid = valid;
  assign io_data_data = _data_ext_R0_data[63:0];
  assign io_data_corrupt = _data_ext_R0_data[64];
endmodule

