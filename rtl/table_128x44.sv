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
module table_128x44(
  input  [6:0]  R0_addr,
  input         R0_en,
                R0_clk,
  output [43:0] R0_data,
  input  [6:0]  W0_addr,
  input         W0_en,
                W0_clk,
  input  [43:0] W0_data,
  input  [3:0]  W0_mask
);

  reg [43:0] Memory[0:127];
  reg        _R0_en_d0;
  reg [6:0]  _R0_addr_d0;
  always @(posedge R0_clk) begin
    _R0_en_d0 <= R0_en;
    _R0_addr_d0 <= R0_addr;
  end // always @(posedge)
  always @(posedge W0_clk) begin
    if (W0_en & W0_mask[0])
      Memory[W0_addr][32'h0 +: 11] <= W0_data[10:0];
    if (W0_en & W0_mask[1])
      Memory[W0_addr][32'hB +: 11] <= W0_data[21:11];
    if (W0_en & W0_mask[2])
      Memory[W0_addr][32'h16 +: 11] <= W0_data[32:22];
    if (W0_en & W0_mask[3])
      Memory[W0_addr][32'h21 +: 11] <= W0_data[43:33];
  end // always @(posedge)
  assign R0_data = _R0_en_d0 ? Memory[_R0_addr_d0] : 44'bx;
endmodule

