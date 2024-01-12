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

// VCS coverage exclude_file
module regfile_128x64(
  input  [6:0]  R0_addr,
  input         R0_en,
                R0_clk,
  output [63:0] R0_data,
  input  [6:0]  R1_addr,
  input         R1_en,
                R1_clk,
  output [63:0] R1_data,
  input  [6:0]  R2_addr,
  input         R2_en,
                R2_clk,
  output [63:0] R2_data,
  input  [6:0]  R3_addr,
  input         R3_en,
                R3_clk,
  output [63:0] R3_data,
  input  [6:0]  R4_addr,
  input         R4_en,
                R4_clk,
  output [63:0] R4_data,
  input  [6:0]  R5_addr,
  input         R5_en,
                R5_clk,
  output [63:0] R5_data,
  input  [6:0]  R6_addr,
  input         R6_en,
                R6_clk,
  output [63:0] R6_data,
  input  [6:0]  R7_addr,
  input         R7_en,
                R7_clk,
  output [63:0] R7_data,
  input  [6:0]  R8_addr,
  input         R8_en,
                R8_clk,
  output [63:0] R8_data,
  input  [6:0]  R9_addr,
  input         R9_en,
                R9_clk,
  output [63:0] R9_data,
  input  [6:0]  R10_addr,
  input         R10_en,
                R10_clk,
  output [63:0] R10_data,
  input  [6:0]  R11_addr,
  input         R11_en,
                R11_clk,
  output [63:0] R11_data,
  input  [6:0]  W0_addr,
  input         W0_en,
                W0_clk,
  input  [63:0] W0_data,
  input  [6:0]  W1_addr,
  input         W1_en,
                W1_clk,
  input  [63:0] W1_data,
  input  [6:0]  W2_addr,
  input         W2_en,
                W2_clk,
  input  [63:0] W2_data,
  input  [6:0]  W3_addr,
  input         W3_en,
                W3_clk,
  input  [63:0] W3_data,
  input  [6:0]  W4_addr,
  input         W4_en,
                W4_clk,
  input  [63:0] W4_data,
  input  [6:0]  W5_addr,
  input         W5_en,
                W5_clk,
  input  [63:0] W5_data
);

  reg [63:0] Memory[0:127];
  always @(posedge W0_clk) begin
    if (W0_en & 1'h1)
      Memory[W0_addr] <= W0_data;
    if (W1_en & 1'h1)
      Memory[W1_addr] <= W1_data;
    if (W2_en & 1'h1)
      Memory[W2_addr] <= W2_data;
    if (W3_en & 1'h1)
      Memory[W3_addr] <= W3_data;
    if (W4_en & 1'h1)
      Memory[W4_addr] <= W4_data;
    if (W5_en & 1'h1)
      Memory[W5_addr] <= W5_data;
  end // always @(posedge)
  assign R0_data = R0_en ? Memory[R0_addr] : 64'bx;
  assign R1_data = R1_en ? Memory[R1_addr] : 64'bx;
  assign R2_data = R2_en ? Memory[R2_addr] : 64'bx;
  assign R3_data = R3_en ? Memory[R3_addr] : 64'bx;
  assign R4_data = R4_en ? Memory[R4_addr] : 64'bx;
  assign R5_data = R5_en ? Memory[R5_addr] : 64'bx;
  assign R6_data = R6_en ? Memory[R6_addr] : 64'bx;
  assign R7_data = R7_en ? Memory[R7_addr] : 64'bx;
  assign R8_data = R8_en ? Memory[R8_addr] : 64'bx;
  assign R9_data = R9_en ? Memory[R9_addr] : 64'bx;
  assign R10_data = R10_en ? Memory[R10_addr] : 64'bx;
  assign R11_data = R11_en ? Memory[R11_addr] : 64'bx;
endmodule

