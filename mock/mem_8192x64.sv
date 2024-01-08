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
module mem_8192x64(
  input  [12:0] RW0_addr,
  input         RW0_en,
                RW0_clk,
                RW0_wmode,
  input  [63:0] RW0_wdata,
  output [63:0] RW0_rdata,
  input  [7:0]  RW0_wmask
);

reg [63:0] Memory[0:15];  // Reduced to 16 rows
reg [3:0]  _RW0_raddr_d0;  // Reduced to 4 bits
reg        _RW0_ren_d0;
reg        _RW0_rmode_d0;
always @(posedge RW0_clk) begin
  _RW0_raddr_d0 <= RW0_addr[3:0] ^ RW0_addr[7:4];  // XOR upper and lower bits
  _RW0_ren_d0 <= RW0_en;
  _RW0_rmode_d0 <= RW0_wmode;
  if (RW0_en & RW0_wmask[0] & RW0_wmode)
    Memory[_RW0_raddr_d0][32'h0 +: 8] <= RW0_wdata[7:0];
  if (RW0_en & RW0_wmask[1] & RW0_wmode)
    Memory[_RW0_raddr_d0][32'h8 +: 8] <= RW0_wdata[15:8];
  if (RW0_en & RW0_wmask[2] & RW0_wmode)
    Memory[_RW0_raddr_d0][32'h10 +: 8] <= RW0_wdata[23:16];
  if (RW0_en & RW0_wmask[3] & RW0_wmode)
    Memory[_RW0_raddr_d0][32'h18 +: 8] <= RW0_wdata[31:24];
  if (RW0_en & RW0_wmask[4] & RW0_wmode)
    Memory[_RW0_raddr_d0][32'h20 +: 8] <= RW0_wdata[39:32];
  if (RW0_en & RW0_wmask[5] & RW0_wmode)
    Memory[_RW0_raddr_d0][32'h28 +: 8] <= RW0_wdata[47:40];
  if (RW0_en & RW0_wmask[6] & RW0_wmode)
    Memory[_RW0_raddr_d0][32'h30 +: 8] <= RW0_wdata[55:48];
  if (RW0_en & RW0_wmask[7] & RW0_wmode)
    Memory[_RW0_raddr_d0][32'h38 +: 8] <= RW0_wdata[63:56];
end // always @(posedge)
assign RW0_rdata = _RW0_ren_d0 & ~_RW0_rmode_d0 ? Memory[_RW0_raddr_d0] : 64'bx;
endmodule

