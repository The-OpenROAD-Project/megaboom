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

module AsyncQueueSource_3(
  input        clock,
               reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [3:0] io_enq_bits,
  output [3:0] io_async_mem_0,
               io_async_mem_1,
               io_async_mem_2,
               io_async_mem_3,
               io_async_mem_4,
               io_async_mem_5,
               io_async_mem_6,
               io_async_mem_7,
  input  [3:0] io_async_ridx,
  output [3:0] io_async_widx,
  input        io_async_safe_ridx_valid,
  output       io_async_safe_widx_valid,
               io_async_safe_source_reset_n,
  input        io_async_safe_sink_reset_n
);

  wire       _io_enq_ready_output;
  wire       _sink_valid_io_out;
  wire       _sink_extend_io_out;
  wire       _source_valid_0_io_out;
  wire [3:0] _ridx_ridx_gray_io_q;
  reg  [3:0] mem_0;
  reg  [3:0] mem_1;
  reg  [3:0] mem_2;
  reg  [3:0] mem_3;
  reg  [3:0] mem_4;
  reg  [3:0] mem_5;
  reg  [3:0] mem_6;
  reg  [3:0] mem_7;
  wire       _widx_T_1 = _io_enq_ready_output & io_enq_valid;
  reg  [3:0] widx_widx_bin;
  reg        ready_reg;
  assign _io_enq_ready_output = ready_reg & _sink_valid_io_out;
  reg  [3:0] widx_gray;
  wire [2:0] index = widx_gray[2:0] ^ {widx_gray[3], 2'h0};
  always @(posedge clock) begin
    if (_widx_T_1 & index == 3'h0)
      mem_0 <= io_enq_bits;
    if (_widx_T_1 & index == 3'h1)
      mem_1 <= io_enq_bits;
    if (_widx_T_1 & index == 3'h2)
      mem_2 <= io_enq_bits;
    if (_widx_T_1 & index == 3'h3)
      mem_3 <= io_enq_bits;
    if (_widx_T_1 & index == 3'h4)
      mem_4 <= io_enq_bits;
    if (_widx_T_1 & index == 3'h5)
      mem_5 <= io_enq_bits;
    if (_widx_T_1 & index == 3'h6)
      mem_6 <= io_enq_bits;
    if (_widx_T_1 & (&index))
      mem_7 <= io_enq_bits;
  end // always @(posedge)
  wire [3:0] _widx_incremented_T = widx_widx_bin + {3'h0, _widx_T_1};
  wire [3:0] widx_incremented = _sink_valid_io_out ? _widx_incremented_T : 4'h0;
  wire [3:0] widx = {widx_incremented[3], widx_incremented[2:0] ^ widx_incremented[3:1]};
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
  assign io_async_mem_0 = mem_0;
  assign io_async_mem_1 = mem_1;
  assign io_async_mem_2 = mem_2;
  assign io_async_mem_3 = mem_3;
  assign io_async_mem_4 = mem_4;
  assign io_async_mem_5 = mem_5;
  assign io_async_mem_6 = mem_6;
  assign io_async_mem_7 = mem_7;
  assign io_async_widx = widx_gray;
  assign io_async_safe_source_reset_n = ~reset;
endmodule

