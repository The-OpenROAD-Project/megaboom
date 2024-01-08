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

module TLRAM_2(
  input         clock,
                reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [9:0]  auto_in_a_bits_source,
  input  [32:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_size,
  output [9:0]  auto_in_d_bits_source,
  output [63:0] auto_in_d_bits_data
);

  wire [7:0]  r_raw_data_7;
  wire [7:0]  r_raw_data_6;
  wire [7:0]  r_raw_data_5;
  wire [7:0]  r_raw_data_4;
  wire [7:0]  r_raw_data_3;
  wire [7:0]  r_raw_data_2;
  wire [7:0]  r_raw_data_1;
  wire [7:0]  r_raw_data_0;
  wire        mem_MPORT_en;
  wire        mem_MPORT_1_en;
  wire [63:0] _mem_ext_RW0_rdata;
  reg         r_full;
  reg  [1:0]  r_size;
  reg  [9:0]  r_source;
  reg         r_read;
  wire [2:0]  nodeIn_d_bits_opcode = {2'h0, r_read};
  wire        nodeIn_a_ready = ~r_full | auto_in_d_ready;
  wire        a_ren = auto_in_a_bits_opcode == 3'h4;
  wire        a_fire = nodeIn_a_ready & auto_in_a_valid;
  assign mem_MPORT_1_en = a_fire & ~a_ren;
  assign mem_MPORT_en = ~mem_MPORT_1_en & a_fire;
  reg         REG;
  reg  [7:0]  r_0;
  reg  [7:0]  r_1;
  reg  [7:0]  r_2;
  reg  [7:0]  r_3;
  reg  [7:0]  r_4;
  reg  [7:0]  r_5;
  reg  [7:0]  r_6;
  reg  [7:0]  r_7;
  assign r_raw_data_0 = REG ? _mem_ext_RW0_rdata[7:0] : r_0;
  assign r_raw_data_1 = REG ? _mem_ext_RW0_rdata[15:8] : r_1;
  assign r_raw_data_2 = REG ? _mem_ext_RW0_rdata[23:16] : r_2;
  assign r_raw_data_3 = REG ? _mem_ext_RW0_rdata[31:24] : r_3;
  assign r_raw_data_4 = REG ? _mem_ext_RW0_rdata[39:32] : r_4;
  assign r_raw_data_5 = REG ? _mem_ext_RW0_rdata[47:40] : r_5;
  assign r_raw_data_6 = REG ? _mem_ext_RW0_rdata[55:48] : r_6;
  assign r_raw_data_7 = REG ? _mem_ext_RW0_rdata[63:56] : r_7;
  always @(posedge clock) begin
    if (reset)
      r_full <= 1'h0;
    else
      r_full <= a_fire | ~auto_in_d_ready & r_full;
    if (a_fire) begin
      r_size <= auto_in_a_bits_size;
      r_source <= auto_in_a_bits_source;
      r_read <= a_ren;
    end
    REG <= mem_MPORT_en;
    if (REG) begin
      r_0 <= _mem_ext_RW0_rdata[7:0];
      r_1 <= _mem_ext_RW0_rdata[15:8];
      r_2 <= _mem_ext_RW0_rdata[23:16];
      r_3 <= _mem_ext_RW0_rdata[31:24];
      r_4 <= _mem_ext_RW0_rdata[39:32];
      r_5 <= _mem_ext_RW0_rdata[47:40];
      r_6 <= _mem_ext_RW0_rdata[55:48];
      r_7 <= _mem_ext_RW0_rdata[63:56];
    end
  end // always @(posedge)
  TLMonitor_74 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (nodeIn_a_ready),
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_opcode  (auto_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_in_a_bits_param),
    .io_in_a_bits_size    (auto_in_a_bits_size),
    .io_in_a_bits_source  (auto_in_a_bits_source),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_a_bits_mask    (auto_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_in_a_bits_corrupt),
    .io_in_d_ready        (auto_in_d_ready),
    .io_in_d_valid        (r_full),
    .io_in_d_bits_opcode  (nodeIn_d_bits_opcode),
    .io_in_d_bits_size    (r_size),
    .io_in_d_bits_source  (r_source)
  );
  mem_268435456x64 mem_ext (
    .RW0_addr  (auto_in_a_bits_address[30:3]),
    .RW0_en    (mem_MPORT_en | mem_MPORT_1_en),
    .RW0_clk   (clock),
    .RW0_wmode (mem_MPORT_1_en),
    .RW0_wdata (auto_in_a_bits_data),
    .RW0_rdata (_mem_ext_RW0_rdata),
    .RW0_wmask (auto_in_a_bits_mask)
  );
  assign auto_in_a_ready = nodeIn_a_ready;
  assign auto_in_d_valid = r_full;
  assign auto_in_d_bits_opcode = nodeIn_d_bits_opcode;
  assign auto_in_d_bits_size = r_size;
  assign auto_in_d_bits_source = r_source;
  assign auto_in_d_bits_data = {r_raw_data_7, r_raw_data_6, r_raw_data_5, r_raw_data_4, r_raw_data_3, r_raw_data_2, r_raw_data_1, r_raw_data_0};
endmodule

