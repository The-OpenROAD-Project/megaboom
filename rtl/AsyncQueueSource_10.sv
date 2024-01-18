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

module AsyncQueueSource_10(
  input         clock,
                reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [2:0]  io_enq_bits_opcode,
                io_enq_bits_param,
  input  [3:0]  io_enq_bits_size,
  input  [4:0]  io_enq_bits_source,
  input  [32:0] io_enq_bits_address,
  input  [7:0]  io_enq_bits_mask,
  input  [63:0] io_enq_bits_data,
  output [2:0]  io_async_mem_0_opcode,
                io_async_mem_0_param,
  output [3:0]  io_async_mem_0_size,
  output [4:0]  io_async_mem_0_source,
  output [32:0] io_async_mem_0_address,
  output [7:0]  io_async_mem_0_mask,
  output [63:0] io_async_mem_0_data,
  output        io_async_mem_0_corrupt,
  output [2:0]  io_async_mem_1_opcode,
                io_async_mem_1_param,
  output [3:0]  io_async_mem_1_size,
  output [4:0]  io_async_mem_1_source,
  output [32:0] io_async_mem_1_address,
  output [7:0]  io_async_mem_1_mask,
  output [63:0] io_async_mem_1_data,
  output        io_async_mem_1_corrupt,
  output [2:0]  io_async_mem_2_opcode,
                io_async_mem_2_param,
  output [3:0]  io_async_mem_2_size,
  output [4:0]  io_async_mem_2_source,
  output [32:0] io_async_mem_2_address,
  output [7:0]  io_async_mem_2_mask,
  output [63:0] io_async_mem_2_data,
  output        io_async_mem_2_corrupt,
  output [2:0]  io_async_mem_3_opcode,
                io_async_mem_3_param,
  output [3:0]  io_async_mem_3_size,
  output [4:0]  io_async_mem_3_source,
  output [32:0] io_async_mem_3_address,
  output [7:0]  io_async_mem_3_mask,
  output [63:0] io_async_mem_3_data,
  output        io_async_mem_3_corrupt,
  output [2:0]  io_async_mem_4_opcode,
                io_async_mem_4_param,
  output [3:0]  io_async_mem_4_size,
  output [4:0]  io_async_mem_4_source,
  output [32:0] io_async_mem_4_address,
  output [7:0]  io_async_mem_4_mask,
  output [63:0] io_async_mem_4_data,
  output        io_async_mem_4_corrupt,
  output [2:0]  io_async_mem_5_opcode,
                io_async_mem_5_param,
  output [3:0]  io_async_mem_5_size,
  output [4:0]  io_async_mem_5_source,
  output [32:0] io_async_mem_5_address,
  output [7:0]  io_async_mem_5_mask,
  output [63:0] io_async_mem_5_data,
  output        io_async_mem_5_corrupt,
  output [2:0]  io_async_mem_6_opcode,
                io_async_mem_6_param,
  output [3:0]  io_async_mem_6_size,
  output [4:0]  io_async_mem_6_source,
  output [32:0] io_async_mem_6_address,
  output [7:0]  io_async_mem_6_mask,
  output [63:0] io_async_mem_6_data,
  output        io_async_mem_6_corrupt,
  output [2:0]  io_async_mem_7_opcode,
                io_async_mem_7_param,
  output [3:0]  io_async_mem_7_size,
  output [4:0]  io_async_mem_7_source,
  output [32:0] io_async_mem_7_address,
  output [7:0]  io_async_mem_7_mask,
  output [63:0] io_async_mem_7_data,
  output        io_async_mem_7_corrupt,
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
  reg  [2:0]  mem_0_opcode;
  reg  [2:0]  mem_0_param;
  reg  [3:0]  mem_0_size;
  reg  [4:0]  mem_0_source;
  reg  [32:0] mem_0_address;
  reg  [7:0]  mem_0_mask;
  reg  [63:0] mem_0_data;
  reg         mem_0_corrupt;
  reg  [2:0]  mem_1_opcode;
  reg  [2:0]  mem_1_param;
  reg  [3:0]  mem_1_size;
  reg  [4:0]  mem_1_source;
  reg  [32:0] mem_1_address;
  reg  [7:0]  mem_1_mask;
  reg  [63:0] mem_1_data;
  reg         mem_1_corrupt;
  reg  [2:0]  mem_2_opcode;
  reg  [2:0]  mem_2_param;
  reg  [3:0]  mem_2_size;
  reg  [4:0]  mem_2_source;
  reg  [32:0] mem_2_address;
  reg  [7:0]  mem_2_mask;
  reg  [63:0] mem_2_data;
  reg         mem_2_corrupt;
  reg  [2:0]  mem_3_opcode;
  reg  [2:0]  mem_3_param;
  reg  [3:0]  mem_3_size;
  reg  [4:0]  mem_3_source;
  reg  [32:0] mem_3_address;
  reg  [7:0]  mem_3_mask;
  reg  [63:0] mem_3_data;
  reg         mem_3_corrupt;
  reg  [2:0]  mem_4_opcode;
  reg  [2:0]  mem_4_param;
  reg  [3:0]  mem_4_size;
  reg  [4:0]  mem_4_source;
  reg  [32:0] mem_4_address;
  reg  [7:0]  mem_4_mask;
  reg  [63:0] mem_4_data;
  reg         mem_4_corrupt;
  reg  [2:0]  mem_5_opcode;
  reg  [2:0]  mem_5_param;
  reg  [3:0]  mem_5_size;
  reg  [4:0]  mem_5_source;
  reg  [32:0] mem_5_address;
  reg  [7:0]  mem_5_mask;
  reg  [63:0] mem_5_data;
  reg         mem_5_corrupt;
  reg  [2:0]  mem_6_opcode;
  reg  [2:0]  mem_6_param;
  reg  [3:0]  mem_6_size;
  reg  [4:0]  mem_6_source;
  reg  [32:0] mem_6_address;
  reg  [7:0]  mem_6_mask;
  reg  [63:0] mem_6_data;
  reg         mem_6_corrupt;
  reg  [2:0]  mem_7_opcode;
  reg  [2:0]  mem_7_param;
  reg  [3:0]  mem_7_size;
  reg  [4:0]  mem_7_source;
  reg  [32:0] mem_7_address;
  reg  [7:0]  mem_7_mask;
  reg  [63:0] mem_7_data;
  reg         mem_7_corrupt;
  wire        _widx_T_1 = _io_enq_ready_output & io_enq_valid;
  reg  [3:0]  widx_widx_bin;
  reg         ready_reg;
  assign _io_enq_ready_output = ready_reg & _sink_valid_io_out;
  reg  [3:0]  widx_gray;
  wire [2:0]  index = widx_gray[2:0] ^ {widx_gray[3], 2'h0};
  wire        _GEN = _widx_T_1 & index == 3'h0;
  wire        _GEN_0 = _widx_T_1 & index == 3'h1;
  wire        _GEN_1 = _widx_T_1 & index == 3'h2;
  wire        _GEN_2 = _widx_T_1 & index == 3'h3;
  wire        _GEN_3 = _widx_T_1 & index == 3'h4;
  wire        _GEN_4 = _widx_T_1 & index == 3'h5;
  wire        _GEN_5 = _widx_T_1 & index == 3'h6;
  wire        _GEN_6 = _widx_T_1 & (&index);
  always @(posedge clock) begin
    if (_GEN) begin
      mem_0_opcode <= io_enq_bits_opcode;
      mem_0_param <= io_enq_bits_param;
      mem_0_size <= io_enq_bits_size;
      mem_0_source <= io_enq_bits_source;
      mem_0_address <= io_enq_bits_address;
      mem_0_mask <= io_enq_bits_mask;
      mem_0_data <= io_enq_bits_data;
    end
    mem_0_corrupt <= ~_GEN & mem_0_corrupt;
    if (_GEN_0) begin
      mem_1_opcode <= io_enq_bits_opcode;
      mem_1_param <= io_enq_bits_param;
      mem_1_size <= io_enq_bits_size;
      mem_1_source <= io_enq_bits_source;
      mem_1_address <= io_enq_bits_address;
      mem_1_mask <= io_enq_bits_mask;
      mem_1_data <= io_enq_bits_data;
    end
    mem_1_corrupt <= ~_GEN_0 & mem_1_corrupt;
    if (_GEN_1) begin
      mem_2_opcode <= io_enq_bits_opcode;
      mem_2_param <= io_enq_bits_param;
      mem_2_size <= io_enq_bits_size;
      mem_2_source <= io_enq_bits_source;
      mem_2_address <= io_enq_bits_address;
      mem_2_mask <= io_enq_bits_mask;
      mem_2_data <= io_enq_bits_data;
    end
    mem_2_corrupt <= ~_GEN_1 & mem_2_corrupt;
    if (_GEN_2) begin
      mem_3_opcode <= io_enq_bits_opcode;
      mem_3_param <= io_enq_bits_param;
      mem_3_size <= io_enq_bits_size;
      mem_3_source <= io_enq_bits_source;
      mem_3_address <= io_enq_bits_address;
      mem_3_mask <= io_enq_bits_mask;
      mem_3_data <= io_enq_bits_data;
    end
    mem_3_corrupt <= ~_GEN_2 & mem_3_corrupt;
    if (_GEN_3) begin
      mem_4_opcode <= io_enq_bits_opcode;
      mem_4_param <= io_enq_bits_param;
      mem_4_size <= io_enq_bits_size;
      mem_4_source <= io_enq_bits_source;
      mem_4_address <= io_enq_bits_address;
      mem_4_mask <= io_enq_bits_mask;
      mem_4_data <= io_enq_bits_data;
    end
    mem_4_corrupt <= ~_GEN_3 & mem_4_corrupt;
    if (_GEN_4) begin
      mem_5_opcode <= io_enq_bits_opcode;
      mem_5_param <= io_enq_bits_param;
      mem_5_size <= io_enq_bits_size;
      mem_5_source <= io_enq_bits_source;
      mem_5_address <= io_enq_bits_address;
      mem_5_mask <= io_enq_bits_mask;
      mem_5_data <= io_enq_bits_data;
    end
    mem_5_corrupt <= ~_GEN_4 & mem_5_corrupt;
    if (_GEN_5) begin
      mem_6_opcode <= io_enq_bits_opcode;
      mem_6_param <= io_enq_bits_param;
      mem_6_size <= io_enq_bits_size;
      mem_6_source <= io_enq_bits_source;
      mem_6_address <= io_enq_bits_address;
      mem_6_mask <= io_enq_bits_mask;
      mem_6_data <= io_enq_bits_data;
    end
    mem_6_corrupt <= ~_GEN_5 & mem_6_corrupt;
    if (_GEN_6) begin
      mem_7_opcode <= io_enq_bits_opcode;
      mem_7_param <= io_enq_bits_param;
      mem_7_size <= io_enq_bits_size;
      mem_7_source <= io_enq_bits_source;
      mem_7_address <= io_enq_bits_address;
      mem_7_mask <= io_enq_bits_mask;
      mem_7_data <= io_enq_bits_data;
    end
    mem_7_corrupt <= ~_GEN_6 & mem_7_corrupt;
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
  assign io_async_mem_0_opcode = mem_0_opcode;
  assign io_async_mem_0_param = mem_0_param;
  assign io_async_mem_0_size = mem_0_size;
  assign io_async_mem_0_source = mem_0_source;
  assign io_async_mem_0_address = mem_0_address;
  assign io_async_mem_0_mask = mem_0_mask;
  assign io_async_mem_0_data = mem_0_data;
  assign io_async_mem_0_corrupt = mem_0_corrupt;
  assign io_async_mem_1_opcode = mem_1_opcode;
  assign io_async_mem_1_param = mem_1_param;
  assign io_async_mem_1_size = mem_1_size;
  assign io_async_mem_1_source = mem_1_source;
  assign io_async_mem_1_address = mem_1_address;
  assign io_async_mem_1_mask = mem_1_mask;
  assign io_async_mem_1_data = mem_1_data;
  assign io_async_mem_1_corrupt = mem_1_corrupt;
  assign io_async_mem_2_opcode = mem_2_opcode;
  assign io_async_mem_2_param = mem_2_param;
  assign io_async_mem_2_size = mem_2_size;
  assign io_async_mem_2_source = mem_2_source;
  assign io_async_mem_2_address = mem_2_address;
  assign io_async_mem_2_mask = mem_2_mask;
  assign io_async_mem_2_data = mem_2_data;
  assign io_async_mem_2_corrupt = mem_2_corrupt;
  assign io_async_mem_3_opcode = mem_3_opcode;
  assign io_async_mem_3_param = mem_3_param;
  assign io_async_mem_3_size = mem_3_size;
  assign io_async_mem_3_source = mem_3_source;
  assign io_async_mem_3_address = mem_3_address;
  assign io_async_mem_3_mask = mem_3_mask;
  assign io_async_mem_3_data = mem_3_data;
  assign io_async_mem_3_corrupt = mem_3_corrupt;
  assign io_async_mem_4_opcode = mem_4_opcode;
  assign io_async_mem_4_param = mem_4_param;
  assign io_async_mem_4_size = mem_4_size;
  assign io_async_mem_4_source = mem_4_source;
  assign io_async_mem_4_address = mem_4_address;
  assign io_async_mem_4_mask = mem_4_mask;
  assign io_async_mem_4_data = mem_4_data;
  assign io_async_mem_4_corrupt = mem_4_corrupt;
  assign io_async_mem_5_opcode = mem_5_opcode;
  assign io_async_mem_5_param = mem_5_param;
  assign io_async_mem_5_size = mem_5_size;
  assign io_async_mem_5_source = mem_5_source;
  assign io_async_mem_5_address = mem_5_address;
  assign io_async_mem_5_mask = mem_5_mask;
  assign io_async_mem_5_data = mem_5_data;
  assign io_async_mem_5_corrupt = mem_5_corrupt;
  assign io_async_mem_6_opcode = mem_6_opcode;
  assign io_async_mem_6_param = mem_6_param;
  assign io_async_mem_6_size = mem_6_size;
  assign io_async_mem_6_source = mem_6_source;
  assign io_async_mem_6_address = mem_6_address;
  assign io_async_mem_6_mask = mem_6_mask;
  assign io_async_mem_6_data = mem_6_data;
  assign io_async_mem_6_corrupt = mem_6_corrupt;
  assign io_async_mem_7_opcode = mem_7_opcode;
  assign io_async_mem_7_param = mem_7_param;
  assign io_async_mem_7_size = mem_7_size;
  assign io_async_mem_7_source = mem_7_source;
  assign io_async_mem_7_address = mem_7_address;
  assign io_async_mem_7_mask = mem_7_mask;
  assign io_async_mem_7_data = mem_7_data;
  assign io_async_mem_7_corrupt = mem_7_corrupt;
  assign io_async_widx = widx_gray;
  assign io_async_safe_source_reset_n = ~reset;
endmodule

