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

module RegisterFileSynthesizable_1(
  input         clock,
                reset,
  input  [6:0]  io_read_ports_0_addr,
  output [63:0] io_read_ports_0_data,
  input  [6:0]  io_read_ports_1_addr,
  output [63:0] io_read_ports_1_data,
  input  [6:0]  io_read_ports_2_addr,
  output [63:0] io_read_ports_2_data,
  input  [6:0]  io_read_ports_3_addr,
  output [63:0] io_read_ports_3_data,
  input  [6:0]  io_read_ports_4_addr,
  output [63:0] io_read_ports_4_data,
  input  [6:0]  io_read_ports_5_addr,
  output [63:0] io_read_ports_5_data,
  input  [6:0]  io_read_ports_6_addr,
  output [63:0] io_read_ports_6_data,
  input  [6:0]  io_read_ports_7_addr,
  output [63:0] io_read_ports_7_data,
  input  [6:0]  io_read_ports_8_addr,
  output [63:0] io_read_ports_8_data,
  input  [6:0]  io_read_ports_9_addr,
  output [63:0] io_read_ports_9_data,
  input  [6:0]  io_read_ports_10_addr,
  output [63:0] io_read_ports_10_data,
  input  [6:0]  io_read_ports_11_addr,
  output [63:0] io_read_ports_11_data,
  input         io_write_ports_0_valid,
  input  [6:0]  io_write_ports_0_bits_addr,
  input  [63:0] io_write_ports_0_bits_data,
  input         io_write_ports_1_valid,
  input  [6:0]  io_write_ports_1_bits_addr,
  input  [63:0] io_write_ports_1_bits_data,
  input         io_write_ports_2_valid,
  input  [6:0]  io_write_ports_2_bits_addr,
  input  [63:0] io_write_ports_2_bits_data,
  input         io_write_ports_3_valid,
  input  [6:0]  io_write_ports_3_bits_addr,
  input  [63:0] io_write_ports_3_bits_data,
  input         io_write_ports_4_valid,
  input  [6:0]  io_write_ports_4_bits_addr,
  input  [63:0] io_write_ports_4_bits_data,
  input         io_write_ports_5_valid,
  input  [6:0]  io_write_ports_5_bits_addr,
  input  [63:0] io_write_ports_5_bits_data
);

  wire [63:0] _regfile_ext_R0_data;
  wire [63:0] _regfile_ext_R1_data;
  wire [63:0] _regfile_ext_R2_data;
  wire [63:0] _regfile_ext_R3_data;
  wire [63:0] _regfile_ext_R4_data;
  wire [63:0] _regfile_ext_R5_data;
  wire [63:0] _regfile_ext_R6_data;
  wire [63:0] _regfile_ext_R7_data;
  wire [63:0] _regfile_ext_R8_data;
  wire [63:0] _regfile_ext_R9_data;
  wire [63:0] _regfile_ext_R10_data;
  wire [63:0] _regfile_ext_R11_data;
  reg  [6:0]  read_addrs_0;
  reg  [6:0]  read_addrs_1;
  reg  [6:0]  read_addrs_2;
  reg  [6:0]  read_addrs_3;
  reg  [6:0]  read_addrs_4;
  reg  [6:0]  read_addrs_5;
  reg  [6:0]  read_addrs_6;
  reg  [6:0]  read_addrs_7;
  reg  [6:0]  read_addrs_8;
  reg  [6:0]  read_addrs_9;
  reg  [6:0]  read_addrs_10;
  reg  [6:0]  read_addrs_11;
  wire        _bypass_data_WIRE_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_0;
  wire        _bypass_data_WIRE_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_0;
  wire        _bypass_data_WIRE_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_0;
  wire        _bypass_data_WIRE_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_0;
  wire        _bypass_data_WIRE_4 = io_write_ports_4_valid & io_write_ports_4_bits_addr == read_addrs_0;
  wire        _bypass_data_WIRE_5 = io_write_ports_5_valid & io_write_ports_5_bits_addr == read_addrs_0;
  wire        _bypass_data_WIRE_2_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_1;
  wire        _bypass_data_WIRE_2_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_1;
  wire        _bypass_data_WIRE_2_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_1;
  wire        _bypass_data_WIRE_2_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_1;
  wire        _bypass_data_WIRE_2_4 = io_write_ports_4_valid & io_write_ports_4_bits_addr == read_addrs_1;
  wire        _bypass_data_WIRE_2_5 = io_write_ports_5_valid & io_write_ports_5_bits_addr == read_addrs_1;
  wire        _bypass_data_WIRE_4_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_2;
  wire        _bypass_data_WIRE_4_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_2;
  wire        _bypass_data_WIRE_4_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_2;
  wire        _bypass_data_WIRE_4_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_2;
  wire        _bypass_data_WIRE_4_4 = io_write_ports_4_valid & io_write_ports_4_bits_addr == read_addrs_2;
  wire        _bypass_data_WIRE_4_5 = io_write_ports_5_valid & io_write_ports_5_bits_addr == read_addrs_2;
  wire        _bypass_data_WIRE_6_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_3;
  wire        _bypass_data_WIRE_6_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_3;
  wire        _bypass_data_WIRE_6_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_3;
  wire        _bypass_data_WIRE_6_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_3;
  wire        _bypass_data_WIRE_6_4 = io_write_ports_4_valid & io_write_ports_4_bits_addr == read_addrs_3;
  wire        _bypass_data_WIRE_6_5 = io_write_ports_5_valid & io_write_ports_5_bits_addr == read_addrs_3;
  wire        _bypass_data_WIRE_8_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_4;
  wire        _bypass_data_WIRE_8_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_4;
  wire        _bypass_data_WIRE_8_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_4;
  wire        _bypass_data_WIRE_8_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_4;
  wire        _bypass_data_WIRE_8_4 = io_write_ports_4_valid & io_write_ports_4_bits_addr == read_addrs_4;
  wire        _bypass_data_WIRE_8_5 = io_write_ports_5_valid & io_write_ports_5_bits_addr == read_addrs_4;
  wire        _bypass_data_WIRE_10_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_5;
  wire        _bypass_data_WIRE_10_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_5;
  wire        _bypass_data_WIRE_10_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_5;
  wire        _bypass_data_WIRE_10_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_5;
  wire        _bypass_data_WIRE_10_4 = io_write_ports_4_valid & io_write_ports_4_bits_addr == read_addrs_5;
  wire        _bypass_data_WIRE_10_5 = io_write_ports_5_valid & io_write_ports_5_bits_addr == read_addrs_5;
  wire        _bypass_data_WIRE_12_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_6;
  wire        _bypass_data_WIRE_12_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_6;
  wire        _bypass_data_WIRE_12_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_6;
  wire        _bypass_data_WIRE_12_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_6;
  wire        _bypass_data_WIRE_12_4 = io_write_ports_4_valid & io_write_ports_4_bits_addr == read_addrs_6;
  wire        _bypass_data_WIRE_12_5 = io_write_ports_5_valid & io_write_ports_5_bits_addr == read_addrs_6;
  wire        _bypass_data_WIRE_14_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_7;
  wire        _bypass_data_WIRE_14_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_7;
  wire        _bypass_data_WIRE_14_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_7;
  wire        _bypass_data_WIRE_14_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_7;
  wire        _bypass_data_WIRE_14_4 = io_write_ports_4_valid & io_write_ports_4_bits_addr == read_addrs_7;
  wire        _bypass_data_WIRE_14_5 = io_write_ports_5_valid & io_write_ports_5_bits_addr == read_addrs_7;
  wire        _bypass_data_WIRE_16_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_8;
  wire        _bypass_data_WIRE_16_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_8;
  wire        _bypass_data_WIRE_16_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_8;
  wire        _bypass_data_WIRE_16_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_8;
  wire        _bypass_data_WIRE_16_4 = io_write_ports_4_valid & io_write_ports_4_bits_addr == read_addrs_8;
  wire        _bypass_data_WIRE_16_5 = io_write_ports_5_valid & io_write_ports_5_bits_addr == read_addrs_8;
  wire        _bypass_data_WIRE_18_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_9;
  wire        _bypass_data_WIRE_18_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_9;
  wire        _bypass_data_WIRE_18_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_9;
  wire        _bypass_data_WIRE_18_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_9;
  wire        _bypass_data_WIRE_18_4 = io_write_ports_4_valid & io_write_ports_4_bits_addr == read_addrs_9;
  wire        _bypass_data_WIRE_18_5 = io_write_ports_5_valid & io_write_ports_5_bits_addr == read_addrs_9;
  wire        _bypass_data_WIRE_20_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_10;
  wire        _bypass_data_WIRE_20_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_10;
  wire        _bypass_data_WIRE_20_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_10;
  wire        _bypass_data_WIRE_20_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_10;
  wire        _bypass_data_WIRE_20_4 = io_write_ports_4_valid & io_write_ports_4_bits_addr == read_addrs_10;
  wire        _bypass_data_WIRE_20_5 = io_write_ports_5_valid & io_write_ports_5_bits_addr == read_addrs_10;
  wire        _bypass_data_WIRE_22_0 = io_write_ports_0_valid & io_write_ports_0_bits_addr == read_addrs_11;
  wire        _bypass_data_WIRE_22_1 = io_write_ports_1_valid & io_write_ports_1_bits_addr == read_addrs_11;
  wire        _bypass_data_WIRE_22_2 = io_write_ports_2_valid & io_write_ports_2_bits_addr == read_addrs_11;
  wire        _bypass_data_WIRE_22_3 = io_write_ports_3_valid & io_write_ports_3_bits_addr == read_addrs_11;
  wire        _bypass_data_WIRE_22_4 = io_write_ports_4_valid & io_write_ports_4_bits_addr == read_addrs_11;
  wire        _bypass_data_WIRE_22_5 = io_write_ports_5_valid & io_write_ports_5_bits_addr == read_addrs_11;
  `ifndef SYNTHESIS
    wire _GEN = io_write_ports_0_bits_addr == 7'h0;
    wire _GEN_0 = io_write_ports_1_bits_addr == 7'h0;
    wire _GEN_1 = io_write_ports_2_bits_addr == 7'h0;
    wire _GEN_2 = io_write_ports_3_bits_addr == 7'h0;
    always @(posedge clock) begin
      if (~reset & ~(~io_write_ports_0_valid | ~io_write_ports_1_valid | io_write_ports_0_bits_addr != io_write_ports_1_bits_addr | _GEN)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_0_valid | ~io_write_ports_2_valid | io_write_ports_0_bits_addr != io_write_ports_2_bits_addr | _GEN)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_0_valid | ~io_write_ports_3_valid | io_write_ports_0_bits_addr != io_write_ports_3_bits_addr | _GEN)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_0_valid | ~io_write_ports_4_valid | io_write_ports_0_bits_addr != io_write_ports_4_bits_addr | _GEN)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_0_valid | ~io_write_ports_5_valid | io_write_ports_0_bits_addr != io_write_ports_5_bits_addr | _GEN)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_1_valid | ~io_write_ports_2_valid | io_write_ports_1_bits_addr != io_write_ports_2_bits_addr | _GEN_0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_1_valid | ~io_write_ports_3_valid | io_write_ports_1_bits_addr != io_write_ports_3_bits_addr | _GEN_0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_1_valid | ~io_write_ports_4_valid | io_write_ports_1_bits_addr != io_write_ports_4_bits_addr | _GEN_0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_1_valid | ~io_write_ports_5_valid | io_write_ports_1_bits_addr != io_write_ports_5_bits_addr | _GEN_0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_2_valid | ~io_write_ports_3_valid | io_write_ports_2_bits_addr != io_write_ports_3_bits_addr | _GEN_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_2_valid | ~io_write_ports_4_valid | io_write_ports_2_bits_addr != io_write_ports_4_bits_addr | _GEN_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_2_valid | ~io_write_ports_5_valid | io_write_ports_2_bits_addr != io_write_ports_5_bits_addr | _GEN_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_3_valid | ~io_write_ports_4_valid | io_write_ports_3_bits_addr != io_write_ports_4_bits_addr | _GEN_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_3_valid | ~io_write_ports_5_valid | io_write_ports_3_bits_addr != io_write_ports_5_bits_addr | _GEN_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_4_valid | ~io_write_ports_5_valid | io_write_ports_4_bits_addr != io_write_ports_5_bits_addr | io_write_ports_4_bits_addr == 7'h0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  always @(posedge clock) begin
    read_addrs_0 <= io_read_ports_0_addr;
    read_addrs_1 <= io_read_ports_1_addr;
    read_addrs_2 <= io_read_ports_2_addr;
    read_addrs_3 <= io_read_ports_3_addr;
    read_addrs_4 <= io_read_ports_4_addr;
    read_addrs_5 <= io_read_ports_5_addr;
    read_addrs_6 <= io_read_ports_6_addr;
    read_addrs_7 <= io_read_ports_7_addr;
    read_addrs_8 <= io_read_ports_8_addr;
    read_addrs_9 <= io_read_ports_9_addr;
    read_addrs_10 <= io_read_ports_10_addr;
    read_addrs_11 <= io_read_ports_11_addr;
  end // always @(posedge)
  regfile_128x64 regfile_ext (
    .R0_addr  (read_addrs_9),
    .R0_en    (1'h1),
    .R0_clk   (clock),
    .R0_data  (_regfile_ext_R0_data),
    .R1_addr  (read_addrs_8),
    .R1_en    (1'h1),
    .R1_clk   (clock),
    .R1_data  (_regfile_ext_R1_data),
    .R2_addr  (read_addrs_7),
    .R2_en    (1'h1),
    .R2_clk   (clock),
    .R2_data  (_regfile_ext_R2_data),
    .R3_addr  (read_addrs_6),
    .R3_en    (1'h1),
    .R3_clk   (clock),
    .R3_data  (_regfile_ext_R3_data),
    .R4_addr  (read_addrs_5),
    .R4_en    (1'h1),
    .R4_clk   (clock),
    .R4_data  (_regfile_ext_R4_data),
    .R5_addr  (read_addrs_4),
    .R5_en    (1'h1),
    .R5_clk   (clock),
    .R5_data  (_regfile_ext_R5_data),
    .R6_addr  (read_addrs_3),
    .R6_en    (1'h1),
    .R6_clk   (clock),
    .R6_data  (_regfile_ext_R6_data),
    .R7_addr  (read_addrs_2),
    .R7_en    (1'h1),
    .R7_clk   (clock),
    .R7_data  (_regfile_ext_R7_data),
    .R8_addr  (read_addrs_1),
    .R8_en    (1'h1),
    .R8_clk   (clock),
    .R8_data  (_regfile_ext_R8_data),
    .R9_addr  (read_addrs_11),
    .R9_en    (1'h1),
    .R9_clk   (clock),
    .R9_data  (_regfile_ext_R9_data),
    .R10_addr (read_addrs_10),
    .R10_en   (1'h1),
    .R10_clk  (clock),
    .R10_data (_regfile_ext_R10_data),
    .R11_addr (read_addrs_0),
    .R11_en   (1'h1),
    .R11_clk  (clock),
    .R11_data (_regfile_ext_R11_data),
    .W0_addr  (io_write_ports_5_bits_addr),
    .W0_en    (io_write_ports_5_valid),
    .W0_clk   (clock),
    .W0_data  (io_write_ports_5_bits_data),
    .W1_addr  (io_write_ports_4_bits_addr),
    .W1_en    (io_write_ports_4_valid),
    .W1_clk   (clock),
    .W1_data  (io_write_ports_4_bits_data),
    .W2_addr  (io_write_ports_3_bits_addr),
    .W2_en    (io_write_ports_3_valid),
    .W2_clk   (clock),
    .W2_data  (io_write_ports_3_bits_data),
    .W3_addr  (io_write_ports_2_bits_addr),
    .W3_en    (io_write_ports_2_valid),
    .W3_clk   (clock),
    .W3_data  (io_write_ports_2_bits_data),
    .W4_addr  (io_write_ports_1_bits_addr),
    .W4_en    (io_write_ports_1_valid),
    .W4_clk   (clock),
    .W4_data  (io_write_ports_1_bits_data),
    .W5_addr  (io_write_ports_0_bits_addr),
    .W5_en    (io_write_ports_0_valid),
    .W5_clk   (clock),
    .W5_data  (io_write_ports_0_bits_data)
  );
  assign io_read_ports_0_data = _bypass_data_WIRE_0 | _bypass_data_WIRE_1 | _bypass_data_WIRE_2 | _bypass_data_WIRE_3 | _bypass_data_WIRE_4 | _bypass_data_WIRE_5 ? (_bypass_data_WIRE_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_3 ? io_write_ports_3_bits_data : 64'h0) | (_bypass_data_WIRE_4 ? io_write_ports_4_bits_data : 64'h0) | (_bypass_data_WIRE_5 ? io_write_ports_5_bits_data : 64'h0) : _regfile_ext_R11_data;
  assign io_read_ports_1_data = _bypass_data_WIRE_2_0 | _bypass_data_WIRE_2_1 | _bypass_data_WIRE_2_2 | _bypass_data_WIRE_2_3 | _bypass_data_WIRE_2_4 | _bypass_data_WIRE_2_5 ? (_bypass_data_WIRE_2_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_2_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_2_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_2_3 ? io_write_ports_3_bits_data : 64'h0) | (_bypass_data_WIRE_2_4 ? io_write_ports_4_bits_data : 64'h0) | (_bypass_data_WIRE_2_5 ? io_write_ports_5_bits_data : 64'h0) : _regfile_ext_R8_data;
  assign io_read_ports_2_data = _bypass_data_WIRE_4_0 | _bypass_data_WIRE_4_1 | _bypass_data_WIRE_4_2 | _bypass_data_WIRE_4_3 | _bypass_data_WIRE_4_4 | _bypass_data_WIRE_4_5 ? (_bypass_data_WIRE_4_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_4_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_4_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_4_3 ? io_write_ports_3_bits_data : 64'h0) | (_bypass_data_WIRE_4_4 ? io_write_ports_4_bits_data : 64'h0) | (_bypass_data_WIRE_4_5 ? io_write_ports_5_bits_data : 64'h0) : _regfile_ext_R7_data;
  assign io_read_ports_3_data = _bypass_data_WIRE_6_0 | _bypass_data_WIRE_6_1 | _bypass_data_WIRE_6_2 | _bypass_data_WIRE_6_3 | _bypass_data_WIRE_6_4 | _bypass_data_WIRE_6_5 ? (_bypass_data_WIRE_6_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_6_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_6_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_6_3 ? io_write_ports_3_bits_data : 64'h0) | (_bypass_data_WIRE_6_4 ? io_write_ports_4_bits_data : 64'h0) | (_bypass_data_WIRE_6_5 ? io_write_ports_5_bits_data : 64'h0) : _regfile_ext_R6_data;
  assign io_read_ports_4_data = _bypass_data_WIRE_8_0 | _bypass_data_WIRE_8_1 | _bypass_data_WIRE_8_2 | _bypass_data_WIRE_8_3 | _bypass_data_WIRE_8_4 | _bypass_data_WIRE_8_5 ? (_bypass_data_WIRE_8_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_8_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_8_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_8_3 ? io_write_ports_3_bits_data : 64'h0) | (_bypass_data_WIRE_8_4 ? io_write_ports_4_bits_data : 64'h0) | (_bypass_data_WIRE_8_5 ? io_write_ports_5_bits_data : 64'h0) : _regfile_ext_R5_data;
  assign io_read_ports_5_data = _bypass_data_WIRE_10_0 | _bypass_data_WIRE_10_1 | _bypass_data_WIRE_10_2 | _bypass_data_WIRE_10_3 | _bypass_data_WIRE_10_4 | _bypass_data_WIRE_10_5 ? (_bypass_data_WIRE_10_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_10_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_10_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_10_3 ? io_write_ports_3_bits_data : 64'h0) | (_bypass_data_WIRE_10_4 ? io_write_ports_4_bits_data : 64'h0) | (_bypass_data_WIRE_10_5 ? io_write_ports_5_bits_data : 64'h0) : _regfile_ext_R4_data;
  assign io_read_ports_6_data = _bypass_data_WIRE_12_0 | _bypass_data_WIRE_12_1 | _bypass_data_WIRE_12_2 | _bypass_data_WIRE_12_3 | _bypass_data_WIRE_12_4 | _bypass_data_WIRE_12_5 ? (_bypass_data_WIRE_12_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_12_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_12_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_12_3 ? io_write_ports_3_bits_data : 64'h0) | (_bypass_data_WIRE_12_4 ? io_write_ports_4_bits_data : 64'h0) | (_bypass_data_WIRE_12_5 ? io_write_ports_5_bits_data : 64'h0) : _regfile_ext_R3_data;
  assign io_read_ports_7_data = _bypass_data_WIRE_14_0 | _bypass_data_WIRE_14_1 | _bypass_data_WIRE_14_2 | _bypass_data_WIRE_14_3 | _bypass_data_WIRE_14_4 | _bypass_data_WIRE_14_5 ? (_bypass_data_WIRE_14_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_14_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_14_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_14_3 ? io_write_ports_3_bits_data : 64'h0) | (_bypass_data_WIRE_14_4 ? io_write_ports_4_bits_data : 64'h0) | (_bypass_data_WIRE_14_5 ? io_write_ports_5_bits_data : 64'h0) : _regfile_ext_R2_data;
  assign io_read_ports_8_data = _bypass_data_WIRE_16_0 | _bypass_data_WIRE_16_1 | _bypass_data_WIRE_16_2 | _bypass_data_WIRE_16_3 | _bypass_data_WIRE_16_4 | _bypass_data_WIRE_16_5 ? (_bypass_data_WIRE_16_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_16_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_16_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_16_3 ? io_write_ports_3_bits_data : 64'h0) | (_bypass_data_WIRE_16_4 ? io_write_ports_4_bits_data : 64'h0) | (_bypass_data_WIRE_16_5 ? io_write_ports_5_bits_data : 64'h0) : _regfile_ext_R1_data;
  assign io_read_ports_9_data = _bypass_data_WIRE_18_0 | _bypass_data_WIRE_18_1 | _bypass_data_WIRE_18_2 | _bypass_data_WIRE_18_3 | _bypass_data_WIRE_18_4 | _bypass_data_WIRE_18_5 ? (_bypass_data_WIRE_18_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_18_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_18_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_18_3 ? io_write_ports_3_bits_data : 64'h0) | (_bypass_data_WIRE_18_4 ? io_write_ports_4_bits_data : 64'h0) | (_bypass_data_WIRE_18_5 ? io_write_ports_5_bits_data : 64'h0) : _regfile_ext_R0_data;
  assign io_read_ports_10_data = _bypass_data_WIRE_20_0 | _bypass_data_WIRE_20_1 | _bypass_data_WIRE_20_2 | _bypass_data_WIRE_20_3 | _bypass_data_WIRE_20_4 | _bypass_data_WIRE_20_5 ? (_bypass_data_WIRE_20_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_20_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_20_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_20_3 ? io_write_ports_3_bits_data : 64'h0) | (_bypass_data_WIRE_20_4 ? io_write_ports_4_bits_data : 64'h0) | (_bypass_data_WIRE_20_5 ? io_write_ports_5_bits_data : 64'h0) : _regfile_ext_R10_data;
  assign io_read_ports_11_data = _bypass_data_WIRE_22_0 | _bypass_data_WIRE_22_1 | _bypass_data_WIRE_22_2 | _bypass_data_WIRE_22_3 | _bypass_data_WIRE_22_4 | _bypass_data_WIRE_22_5 ? (_bypass_data_WIRE_22_0 ? io_write_ports_0_bits_data : 64'h0) | (_bypass_data_WIRE_22_1 ? io_write_ports_1_bits_data : 64'h0) | (_bypass_data_WIRE_22_2 ? io_write_ports_2_bits_data : 64'h0) | (_bypass_data_WIRE_22_3 ? io_write_ports_3_bits_data : 64'h0) | (_bypass_data_WIRE_22_4 ? io_write_ports_4_bits_data : 64'h0) | (_bypass_data_WIRE_22_5 ? io_write_ports_5_bits_data : 64'h0) : _regfile_ext_R9_data;
endmodule

