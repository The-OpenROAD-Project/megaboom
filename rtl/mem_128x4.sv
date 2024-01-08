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

// VCS coverage exclude_file
module mem_128x4(
  input  [6:0] R0_addr,
  input        R0_en,
               R0_clk,
  output [3:0] R0_data,
  input  [6:0] W0_addr,
  input        W0_en,
               W0_clk,
  input  [3:0] W0_data,
               W0_mask
);

  reg [3:0] Memory[0:127];
  reg       _R0_en_d0;
  reg [6:0] _R0_addr_d0;
  always @(posedge R0_clk) begin
    _R0_en_d0 <= R0_en;
    _R0_addr_d0 <= R0_addr;
  end // always @(posedge)
  always @(posedge W0_clk) begin
    if (W0_en & W0_mask[0])
      Memory[W0_addr][32'h0 +: 1] <= W0_data[0];
    if (W0_en & W0_mask[1])
      Memory[W0_addr][32'h1 +: 1] <= W0_data[1];
    if (W0_en & W0_mask[2])
      Memory[W0_addr][32'h2 +: 1] <= W0_data[2];
    if (W0_en & W0_mask[3])
      Memory[W0_addr][32'h3 +: 1] <= W0_data[3];
  end // always @(posedge)
  assign R0_data = _R0_en_d0 ? Memory[_R0_addr_d0] : 4'bx;
endmodule

