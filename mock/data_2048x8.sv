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
module data_2048x8(
  input  [10:0] R0_addr,
  input         R0_en,
                R0_clk,
  output [7:0]  R0_data,
  input  [10:0] W0_addr,
  input         W0_en,
                W0_clk,
  input  [7:0]  W0_data,
  input  [3:0]  W0_mask
);

  reg [7:0]  Memory[0:3];  // Reduced to 4 rows
  reg        _R0_en_d0;
  reg [1:0]  _R0_addr_d0;  // Reduced to 2 bits
  reg [1:0]  _W0_addr_d0;  // Reduced to 2 bits
  always @(posedge R0_clk) begin
    _R0_en_d0 <= R0_en;
    _R0_addr_d0 <= R0_addr[1:0] ^ R0_addr[5:4] ^ R0_addr[9:8];  // XOR upper and lower bits
  end // always @(posedge)
  always @(posedge W0_clk) begin
    _W0_addr_d0 <= W0_addr[1:0] ^ W0_addr[5:4] ^ W0_addr[9:8];  // XOR upper and lower bits
    if (W0_en & W0_mask[0])
      Memory[_W0_addr_d0][32'h0 +: 2] <= W0_data[1:0];
    if (W0_en & W0_mask[1])
      Memory[_W0_addr_d0][32'h2 +: 2] <= W0_data[3:2];
    if (W0_en & W0_mask[2])
      Memory[_W0_addr_d0][32'h4 +: 2] <= W0_data[5:4];
    if (W0_en & W0_mask[3])
      Memory[_W0_addr_d0][32'h6 +: 2] <= W0_data[7:6];
  end // always @(posedge)
  assign R0_data = _R0_en_d0 ? Memory[_R0_addr_d0] : 8'bx;
endmodule

