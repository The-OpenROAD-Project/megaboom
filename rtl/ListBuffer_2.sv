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

module ListBuffer_2(
  input         clock,
                reset,
  output        io_push_ready,
  input         io_push_valid,
  input  [4:0]  io_push_bits_index,
  input         io_push_bits_data_prio_0,
                io_push_bits_data_prio_2,
                io_push_bits_data_control,
  input  [2:0]  io_push_bits_data_opcode,
                io_push_bits_data_param,
                io_push_bits_data_size,
  input  [5:0]  io_push_bits_data_source,
  input  [16:0] io_push_bits_data_tag,
  input  [5:0]  io_push_bits_data_offset,
                io_push_bits_data_put,
  output [20:0] io_valid,
  input         io_pop_valid,
  input  [4:0]  io_pop_bits,
  output        io_data_prio_0,
                io_data_prio_1,
                io_data_prio_2,
                io_data_control,
  output [2:0]  io_data_opcode,
                io_data_param,
                io_data_size,
  output [5:0]  io_data_source,
  output [16:0] io_data_tag,
  output [5:0]  io_data_offset,
                io_data_put
);

  wire [47:0] _data_ext_R0_data;
  wire [5:0]  _next_ext_R0_data;
  wire [5:0]  _tail_ext_R0_data;
  wire [5:0]  _tail_ext_R1_data;
  wire [5:0]  _head_ext_R0_data;
  reg  [20:0] valid;
  reg  [32:0] used;
  wire [32:0] _freeOH_T_22 = ~used;
  wire [31:0] _freeOH_T_3 = _freeOH_T_22[31:0] | {_freeOH_T_22[30:0], 1'h0};
  wire [31:0] _freeOH_T_6 = _freeOH_T_3 | {_freeOH_T_3[29:0], 2'h0};
  wire [31:0] _freeOH_T_9 = _freeOH_T_6 | {_freeOH_T_6[27:0], 4'h0};
  wire [31:0] _freeOH_T_12 = _freeOH_T_9 | {_freeOH_T_9[23:0], 8'h0};
  wire [32:0] _GEN = {~(_freeOH_T_12 | {_freeOH_T_12[15:0], 16'h0}), 1'h1} & _freeOH_T_22;
  wire [14:0] _freeIdx_T_3 = _GEN[31:17] | _GEN[15:1];
  wire [6:0]  _freeIdx_T_5 = _freeIdx_T_3[14:8] | _freeIdx_T_3[6:0];
  wire [2:0]  _freeIdx_T_7 = _freeIdx_T_5[6:4] | _freeIdx_T_5[2:0];
  wire [5:0]  data_MPORT_addr = {_GEN[32], |(_GEN[31:16]), |(_freeIdx_T_3[14:7]), |(_freeIdx_T_5[6:3]), |(_freeIdx_T_7[2:1]), _freeIdx_T_7[2] | _freeIdx_T_7[0]};
  wire [20:0] _push_valid_T = valid >> io_push_bits_index;
  wire        _io_push_ready_output = used != 33'h1FFFFFFFF;
  wire        data_MPORT_en = _io_push_ready_output & io_push_valid;
  `ifndef SYNTHESIS
    wire [20:0] _GEN_0 = valid >> io_pop_bits;
    always @(posedge clock) begin
      if (~reset & ~(~io_pop_valid | _GEN_0[0])) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at ListBuffer.scala:85 assert (!io.pop.fire || (io.valid)(io.pop.bits))\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [31:0] _valid_clr_T = 32'h1 << io_pop_bits;
  wire [31:0] _valid_set_T = 32'h1 << io_push_bits_index;
  wire [63:0] _used_clr_T = 64'h1 << _head_ext_R0_data;
  always @(posedge clock) begin
    if (reset) begin
      valid <= 21'h0;
      used <= 33'h0;
    end
    else begin
      valid <= valid & ~(io_pop_valid & _head_ext_R0_data == _tail_ext_R1_data ? _valid_clr_T[20:0] : 21'h0) | (data_MPORT_en ? _valid_set_T[20:0] : 21'h0);
      used <= used & ~(io_pop_valid ? _used_clr_T[32:0] : 33'h0) | (data_MPORT_en ? _GEN : 33'h0);
    end
  end // always @(posedge)
  head_21x6 head_ext (
    .R0_addr (io_pop_bits),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_head_ext_R0_data),
    .W0_addr (io_pop_bits),
    .W0_en   (io_pop_valid),
    .W0_clk  (clock),
    .W0_data (data_MPORT_en & _push_valid_T[0] & _tail_ext_R0_data == _head_ext_R0_data ? data_MPORT_addr : _next_ext_R0_data),
    .W1_addr (io_push_bits_index),
    .W1_en   (data_MPORT_en & ~(_push_valid_T[0])),
    .W1_clk  (clock),
    .W1_data (data_MPORT_addr)
  );
  tail_21x6 tail_ext (
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
  next_33x6 next_ext (
    .R0_addr (_head_ext_R0_data),
    .R0_en   (io_pop_valid),
    .R0_clk  (clock),
    .R0_data (_next_ext_R0_data),
    .W0_addr (_tail_ext_R0_data),
    .W0_en   (data_MPORT_en & _push_valid_T[0]),
    .W0_clk  (clock),
    .W0_data (data_MPORT_addr)
  );
  data_33x48 data_ext (
    .R0_addr (_head_ext_R0_data),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (_data_ext_R0_data),
    .W0_addr (data_MPORT_addr),
    .W0_en   (data_MPORT_en),
    .W0_clk  (clock),
    .W0_data ({io_push_bits_data_put, io_push_bits_data_offset, io_push_bits_data_tag, io_push_bits_data_source, io_push_bits_data_size, io_push_bits_data_param, io_push_bits_data_opcode, io_push_bits_data_control, io_push_bits_data_prio_2, 1'h0, io_push_bits_data_prio_0})
  );
  assign io_push_ready = _io_push_ready_output;
  assign io_valid = valid;
  assign io_data_prio_0 = _data_ext_R0_data[0];
  assign io_data_prio_1 = _data_ext_R0_data[1];
  assign io_data_prio_2 = _data_ext_R0_data[2];
  assign io_data_control = _data_ext_R0_data[3];
  assign io_data_opcode = _data_ext_R0_data[6:4];
  assign io_data_param = _data_ext_R0_data[9:7];
  assign io_data_size = _data_ext_R0_data[12:10];
  assign io_data_source = _data_ext_R0_data[18:13];
  assign io_data_tag = _data_ext_R0_data[35:19];
  assign io_data_offset = _data_ext_R0_data[41:36];
  assign io_data_put = _data_ext_R0_data[47:42];
endmodule

