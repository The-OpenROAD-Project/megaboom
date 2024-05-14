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
module tag_array_64x184(
  input  [5:0]   R0_addr,
  input          R0_en,
                 R0_clk,
  output [183:0] R0_data,
  input  [5:0]   W0_addr,
  input          W0_en,
                 W0_clk,
  input  [183:0] W0_data,
  input  [7:0]   W0_mask
);

  reg [183:0] Memory[0:15];
  reg         _R0_en_d0;
  reg [5:0]   _R0_addr_d0;
  reg [3:0]   _W0_addr_d0, _R0_addr_d1;

  always @(posedge R0_clk) begin
    _R0_en_d0 <= R0_en;
    _R0_addr_d0 <= R0_addr;
    _R0_addr_d1 <= R0_addr[5:2] ^ R0_addr[1:0];
  end // always @(posedge)

  always @(posedge W0_clk) begin
    _W0_addr_d0 <= W0_addr[5:2] ^ W0_addr[1:0];
    if (W0_en & W0_mask[0])
      Memory[_W0_addr_d0][32'h0 +: 23] <= W0_data[22:0];
    if (W0_en & W0_mask[1])
      Memory[_W0_addr_d0][32'h17 +: 23] <= W0_data[45:23];
    if (W0_en & W0_mask[2])
      Memory[_W0_addr_d0][32'h2E +: 23] <= W0_data[68:46];
    if (W0_en & W0_mask[3])
      Memory[_W0_addr_d0][32'h45 +: 23] <= W0_data[91:69];
    if (W0_en & W0_mask[4])
      Memory[_W0_addr_d0][32'h5C +: 23] <= W0_data[114:92];
    if (W0_en & W0_mask[5])
      Memory[_W0_addr_d0][32'h73 +: 23] <= W0_data[137:115];
    if (W0_en & W0_mask[6])
      Memory[_W0_addr_d0][32'h8A +: 23] <= W0_data[160:138];
    if (W0_en & W0_mask[7])
      Memory[_W0_addr_d0][32'hA1 +: 23] <= W0_data[183:161];
  end // always @(posedge)

  assign R0_data = _R0_en_d0 ? Memory[_R0_addr_d1] : 184'bx;
endmodule

