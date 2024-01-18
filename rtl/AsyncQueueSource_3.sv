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

module AsyncQueueSource_3(
  input         clock,
                reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [1:0]  io_enq_bits_param,
  input  [4:0]  io_enq_bits_source,
  input  [32:0] io_enq_bits_address,
  output [1:0]  io_async_mem_0_param,
  output [4:0]  io_async_mem_0_source,
  output [32:0] io_async_mem_0_address,
  output [1:0]  io_async_mem_1_param,
  output [4:0]  io_async_mem_1_source,
  output [32:0] io_async_mem_1_address,
  output [1:0]  io_async_mem_2_param,
  output [4:0]  io_async_mem_2_source,
  output [32:0] io_async_mem_2_address,
  output [1:0]  io_async_mem_3_param,
  output [4:0]  io_async_mem_3_source,
  output [32:0] io_async_mem_3_address,
  output [1:0]  io_async_mem_4_param,
  output [4:0]  io_async_mem_4_source,
  output [32:0] io_async_mem_4_address,
  output [1:0]  io_async_mem_5_param,
  output [4:0]  io_async_mem_5_source,
  output [32:0] io_async_mem_5_address,
  output [1:0]  io_async_mem_6_param,
  output [4:0]  io_async_mem_6_source,
  output [32:0] io_async_mem_6_address,
  output [1:0]  io_async_mem_7_param,
  output [4:0]  io_async_mem_7_source,
  output [32:0] io_async_mem_7_address,
  input  [3:0]  io_async_ridx,
  output [3:0]  io_async_widx,
  input         io_async_safe_ridx_valid,
  output        io_async_safe_widx_valid,
                io_async_safe_source_reset_n,
  input         io_async_safe_sink_reset_n
);

  wire        _io_enq_ready_output;
  wire        _sink_valid_io_out;
  wire        _sink_extend_io_out;
  wire        _source_valid_0_io_out;
  wire [3:0]  _ridx_ridx_gray_io_q;
  reg  [1:0]  mem_0_param;
  reg  [4:0]  mem_0_source;
  reg  [32:0] mem_0_address;
  reg  [1:0]  mem_1_param;
  reg  [4:0]  mem_1_source;
  reg  [32:0] mem_1_address;
  reg  [1:0]  mem_2_param;
  reg  [4:0]  mem_2_source;
  reg  [32:0] mem_2_address;
  reg  [1:0]  mem_3_param;
  reg  [4:0]  mem_3_source;
  reg  [32:0] mem_3_address;
  reg  [1:0]  mem_4_param;
  reg  [4:0]  mem_4_source;
  reg  [32:0] mem_4_address;
  reg  [1:0]  mem_5_param;
  reg  [4:0]  mem_5_source;
  reg  [32:0] mem_5_address;
  reg  [1:0]  mem_6_param;
  reg  [4:0]  mem_6_source;
  reg  [32:0] mem_6_address;
  reg  [1:0]  mem_7_param;
  reg  [4:0]  mem_7_source;
  reg  [32:0] mem_7_address;
  wire        _widx_T_1 = _io_enq_ready_output & io_enq_valid;
  reg  [3:0]  widx_widx_bin;
  reg         ready_reg;
  assign _io_enq_ready_output = ready_reg & _sink_valid_io_out;
  reg  [3:0]  widx_gray;
  wire [2:0]  index = widx_gray[2:0] ^ {widx_gray[3], 2'h0};
  always @(posedge clock) begin
    if (_widx_T_1 & index == 3'h0) begin
      mem_0_param <= io_enq_bits_param;
      mem_0_source <= io_enq_bits_source;
      mem_0_address <= io_enq_bits_address;
    end
    if (_widx_T_1 & index == 3'h1) begin
      mem_1_param <= io_enq_bits_param;
      mem_1_source <= io_enq_bits_source;
      mem_1_address <= io_enq_bits_address;
    end
    if (_widx_T_1 & index == 3'h2) begin
      mem_2_param <= io_enq_bits_param;
      mem_2_source <= io_enq_bits_source;
      mem_2_address <= io_enq_bits_address;
    end
    if (_widx_T_1 & index == 3'h3) begin
      mem_3_param <= io_enq_bits_param;
      mem_3_source <= io_enq_bits_source;
      mem_3_address <= io_enq_bits_address;
    end
    if (_widx_T_1 & index == 3'h4) begin
      mem_4_param <= io_enq_bits_param;
      mem_4_source <= io_enq_bits_source;
      mem_4_address <= io_enq_bits_address;
    end
    if (_widx_T_1 & index == 3'h5) begin
      mem_5_param <= io_enq_bits_param;
      mem_5_source <= io_enq_bits_source;
      mem_5_address <= io_enq_bits_address;
    end
    if (_widx_T_1 & index == 3'h6) begin
      mem_6_param <= io_enq_bits_param;
      mem_6_source <= io_enq_bits_source;
      mem_6_address <= io_enq_bits_address;
    end
    if (_widx_T_1 & (&index)) begin
      mem_7_param <= io_enq_bits_param;
      mem_7_source <= io_enq_bits_source;
      mem_7_address <= io_enq_bits_address;
    end
  end // always @(posedge)
  wire [3:0]  _widx_incremented_T = widx_widx_bin + {3'h0, _widx_T_1};
  wire [3:0]  widx_incremented = _sink_valid_io_out ? _widx_incremented_T : 4'h0;
  wire [3:0]  widx = {widx_incremented[3], widx_incremented[2:0] ^ widx_incremented[3:1]};
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      widx_widx_bin <= 4'h0;
      ready_reg <= 1'h0;
      widx_gray <= 4'h0;
    end
    else begin
      if (_sink_valid_io_out)
        widx_widx_bin <= _widx_incremented_T;
      else
        widx_widx_bin <= 4'h0;
      ready_reg <= _sink_valid_io_out & widx != (_ridx_ridx_gray_io_q ^ 4'hC);
      widx_gray <= widx;
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      if (reset) begin
        widx_widx_bin = 4'h0;
        ready_reg = 1'h0;
        widx_gray = 4'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  AsyncResetSynchronizerShiftReg_w4_d3_i0 ridx_ridx_gray (
    .clock (clock),
    .reset (reset),
    .io_d  (io_async_ridx),
    .io_q  (_ridx_ridx_gray_io_q)
  );
  AsyncValidSync source_valid_0 (
    .io_in  (1'h1),
    .io_out (_source_valid_0_io_out),
    .clock  (clock),
    .reset  (reset | ~io_async_safe_sink_reset_n)
  );
  AsyncValidSync source_valid_1 (
    .io_in  (_source_valid_0_io_out),
    .io_out (io_async_safe_widx_valid),
    .clock  (clock),
    .reset  (reset | ~io_async_safe_sink_reset_n)
  );
  AsyncValidSync sink_extend (
    .io_in  (io_async_safe_ridx_valid),
    .io_out (_sink_extend_io_out),
    .clock  (clock),
    .reset  (reset | ~io_async_safe_sink_reset_n)
  );
  AsyncValidSync sink_valid (
    .io_in  (_sink_extend_io_out),
    .io_out (_sink_valid_io_out),
    .clock  (clock),
    .reset  (reset)
  );
  assign io_enq_ready = _io_enq_ready_output;
  assign io_async_mem_0_param = mem_0_param;
  assign io_async_mem_0_source = mem_0_source;
  assign io_async_mem_0_address = mem_0_address;
  assign io_async_mem_1_param = mem_1_param;
  assign io_async_mem_1_source = mem_1_source;
  assign io_async_mem_1_address = mem_1_address;
  assign io_async_mem_2_param = mem_2_param;
  assign io_async_mem_2_source = mem_2_source;
  assign io_async_mem_2_address = mem_2_address;
  assign io_async_mem_3_param = mem_3_param;
  assign io_async_mem_3_source = mem_3_source;
  assign io_async_mem_3_address = mem_3_address;
  assign io_async_mem_4_param = mem_4_param;
  assign io_async_mem_4_source = mem_4_source;
  assign io_async_mem_4_address = mem_4_address;
  assign io_async_mem_5_param = mem_5_param;
  assign io_async_mem_5_source = mem_5_source;
  assign io_async_mem_5_address = mem_5_address;
  assign io_async_mem_6_param = mem_6_param;
  assign io_async_mem_6_source = mem_6_source;
  assign io_async_mem_6_address = mem_6_address;
  assign io_async_mem_7_param = mem_7_param;
  assign io_async_mem_7_source = mem_7_source;
  assign io_async_mem_7_address = mem_7_address;
  assign io_async_widx = widx_gray;
  assign io_async_safe_source_reset_n = ~reset;
endmodule

