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

module AsyncQueueSink_13(
  input         clock,
                reset,
                io_deq_ready,
  output        io_deq_valid,
  output [2:0]  io_deq_bits_opcode,
  output [1:0]  io_deq_bits_param,
  output [3:0]  io_deq_bits_size,
  output [4:0]  io_deq_bits_source,
  output [32:0] io_deq_bits_address,
  output [7:0]  io_deq_bits_mask,
  output        io_deq_bits_corrupt,
  input  [1:0]  io_async_mem_0_param,
  input  [4:0]  io_async_mem_0_source,
  input  [32:0] io_async_mem_0_address,
  input  [1:0]  io_async_mem_1_param,
  input  [4:0]  io_async_mem_1_source,
  input  [32:0] io_async_mem_1_address,
  input  [1:0]  io_async_mem_2_param,
  input  [4:0]  io_async_mem_2_source,
  input  [32:0] io_async_mem_2_address,
  input  [1:0]  io_async_mem_3_param,
  input  [4:0]  io_async_mem_3_source,
  input  [32:0] io_async_mem_3_address,
  input  [1:0]  io_async_mem_4_param,
  input  [4:0]  io_async_mem_4_source,
  input  [32:0] io_async_mem_4_address,
  input  [1:0]  io_async_mem_5_param,
  input  [4:0]  io_async_mem_5_source,
  input  [32:0] io_async_mem_5_address,
  input  [1:0]  io_async_mem_6_param,
  input  [4:0]  io_async_mem_6_source,
  input  [32:0] io_async_mem_6_address,
  input  [1:0]  io_async_mem_7_param,
  input  [4:0]  io_async_mem_7_source,
  input  [32:0] io_async_mem_7_address,
  output [3:0]  io_async_ridx,
  input  [3:0]  io_async_widx,
  output        io_async_safe_ridx_valid,
  input         io_async_safe_widx_valid,
                io_async_safe_source_reset_n,
  output        io_async_safe_sink_reset_n
);

  wire         _io_deq_valid_output;
  wire         _source_valid_io_out;
  wire         _source_extend_io_out;
  wire         _sink_valid_0_io_out;
  wire [119:0] _io_deq_bits_deq_bits_reg_io_q;
  wire [3:0]   _widx_widx_gray_io_q;
  reg  [3:0]   ridx_ridx_bin;
  wire [3:0]   _ridx_incremented_T = ridx_ridx_bin + {3'h0, io_deq_ready & _io_deq_valid_output};
  wire [3:0]   ridx_incremented = _source_valid_io_out ? _ridx_incremented_T : 4'h0;
  wire [2:0]   _index_T = ridx_incremented[2:0] ^ ridx_incremented[3:1];
  wire [3:0]   ridx = {ridx_incremented[3], _index_T};
  wire         valid = _source_valid_io_out & ridx != _widx_widx_gray_io_q;
  wire [2:0]   index = _index_T ^ {ridx_incremented[3], 2'h0};
  reg  [1:0]   casez_tmp;
  always @(*) begin
    casez (index)
      3'b000:
        casez_tmp = io_async_mem_0_param;
      3'b001:
        casez_tmp = io_async_mem_1_param;
      3'b010:
        casez_tmp = io_async_mem_2_param;
      3'b011:
        casez_tmp = io_async_mem_3_param;
      3'b100:
        casez_tmp = io_async_mem_4_param;
      3'b101:
        casez_tmp = io_async_mem_5_param;
      3'b110:
        casez_tmp = io_async_mem_6_param;
      default:
        casez_tmp = io_async_mem_7_param;
    endcase
  end // always @(*)
  reg  [4:0]   casez_tmp_0;
  always @(*) begin
    casez (index)
      3'b000:
        casez_tmp_0 = io_async_mem_0_source;
      3'b001:
        casez_tmp_0 = io_async_mem_1_source;
      3'b010:
        casez_tmp_0 = io_async_mem_2_source;
      3'b011:
        casez_tmp_0 = io_async_mem_3_source;
      3'b100:
        casez_tmp_0 = io_async_mem_4_source;
      3'b101:
        casez_tmp_0 = io_async_mem_5_source;
      3'b110:
        casez_tmp_0 = io_async_mem_6_source;
      default:
        casez_tmp_0 = io_async_mem_7_source;
    endcase
  end // always @(*)
  reg  [32:0]  casez_tmp_1;
  always @(*) begin
    casez (index)
      3'b000:
        casez_tmp_1 = io_async_mem_0_address;
      3'b001:
        casez_tmp_1 = io_async_mem_1_address;
      3'b010:
        casez_tmp_1 = io_async_mem_2_address;
      3'b011:
        casez_tmp_1 = io_async_mem_3_address;
      3'b100:
        casez_tmp_1 = io_async_mem_4_address;
      3'b101:
        casez_tmp_1 = io_async_mem_5_address;
      3'b110:
        casez_tmp_1 = io_async_mem_6_address;
      default:
        casez_tmp_1 = io_async_mem_7_address;
    endcase
  end // always @(*)
  reg          valid_reg;
  assign _io_deq_valid_output = valid_reg & _source_valid_io_out;
  reg  [3:0]   ridx_gray;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      ridx_ridx_bin <= 4'h0;
      valid_reg <= 1'h0;
      ridx_gray <= 4'h0;
    end
    else begin
      if (_source_valid_io_out)
        ridx_ridx_bin <= _ridx_incremented_T;
      else
        ridx_ridx_bin <= 4'h0;
      valid_reg <= valid;
      ridx_gray <= ridx;
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      if (reset) begin
        ridx_ridx_bin = 4'h0;
        valid_reg = 1'h0;
        ridx_gray = 4'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  AsyncResetSynchronizerShiftReg_w4_d3_i0 widx_widx_gray (
    .clock (clock),
    .reset (reset),
    .io_d  (io_async_widx),
    .io_q  (_widx_widx_gray_io_q)
  );
  ClockCrossingReg_w120 io_deq_bits_deq_bits_reg (
    .clock (clock),
    .io_d  ({3'h6, casez_tmp, 4'h6, casez_tmp_0, casez_tmp_1, 73'h1FE0000000000000000}),
    .io_q  (_io_deq_bits_deq_bits_reg_io_q),
    .io_en (valid)
  );
  AsyncValidSync sink_valid_0 (
    .io_in  (1'h1),
    .io_out (_sink_valid_0_io_out),
    .clock  (clock),
    .reset  (reset | ~io_async_safe_source_reset_n)
  );
  AsyncValidSync sink_valid_1 (
    .io_in  (_sink_valid_0_io_out),
    .io_out (io_async_safe_ridx_valid),
    .clock  (clock),
    .reset  (reset | ~io_async_safe_source_reset_n)
  );
  AsyncValidSync source_extend (
    .io_in  (io_async_safe_widx_valid),
    .io_out (_source_extend_io_out),
    .clock  (clock),
    .reset  (reset | ~io_async_safe_source_reset_n)
  );
  AsyncValidSync source_valid (
    .io_in  (_source_extend_io_out),
    .io_out (_source_valid_io_out),
    .clock  (clock),
    .reset  (reset)
  );
  assign io_deq_valid = _io_deq_valid_output;
  assign io_deq_bits_opcode = _io_deq_bits_deq_bits_reg_io_q[119:117];
  assign io_deq_bits_param = _io_deq_bits_deq_bits_reg_io_q[116:115];
  assign io_deq_bits_size = _io_deq_bits_deq_bits_reg_io_q[114:111];
  assign io_deq_bits_source = _io_deq_bits_deq_bits_reg_io_q[110:106];
  assign io_deq_bits_address = _io_deq_bits_deq_bits_reg_io_q[105:73];
  assign io_deq_bits_mask = _io_deq_bits_deq_bits_reg_io_q[72:65];
  assign io_deq_bits_corrupt = _io_deq_bits_deq_bits_reg_io_q[0];
  assign io_async_ridx = ridx_gray;
  assign io_async_safe_sink_reset_n = ~reset;
endmodule

