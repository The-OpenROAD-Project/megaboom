// Standard header to adapt well known macros to our needs.

// Users can define 'PRINTF_COND' to add an extra gate to prints.
`ifndef PRINTF_COND_
  `ifdef PRINTF_COND
    `define PRINTF_COND_ (`PRINTF_COND)
  `else  // PRINTF_COND
    `define PRINTF_COND_ 1
  `endif // PRINTF_COND
`endif // not def PRINTF_COND_

// VCS coverage exclude_file
module data_data_40x128(
  input  [5:0]   R0_addr,
  input          R0_en,
                 R0_clk,
  input  [5:0]   W0_addr,
  input          W0_en,
                 W0_clk,
  input  [127:0] W0_data,
  output [127:0] R0_data
);

  reg [127:0] Memory[0:15];  // Reduced to 16 rows
  reg [3:0]   _R0_addr_d0;  // Reduced to 4 bits
  reg [3:0]   _W0_addr_d0;  // Reduced to 4 bits
  always @(posedge R0_clk) begin
    _R0_addr_d0 <= R0_addr[3:0] ^ R0_addr[5:4];  // XOR upper and lower bits
  end // always @(posedge)
  always @(posedge W0_clk) begin
    _W0_addr_d0 <= W0_addr[3:0] ^ W0_addr[5:4];  // XOR upper and lower bits
    if (W0_en)
      Memory[_W0_addr_d0] <= W0_data;  // Use XORed address
  end // always @(posedge)
  assign R0_data = R0_en ? Memory[_R0_addr_d0] : 128'bx;
endmodule

