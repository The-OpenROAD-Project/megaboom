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
module tag_array_64x168(
  input  [5:0]   RW0_addr,
  input          RW0_en,
                 RW0_clk,
                 RW0_wmode,
  input  [167:0] RW0_wdata,
  output [167:0] RW0_rdata,
  input  [7:0]   RW0_wmask
);

  reg [167:0] Memory[0:63];
  reg [5:0]   _RW0_raddr_d0;
  reg         _RW0_ren_d0;
  reg         _RW0_rmode_d0;
  always @(posedge RW0_clk) begin
    _RW0_raddr_d0 <= RW0_addr;
    _RW0_ren_d0 <= RW0_en;
    _RW0_rmode_d0 <= RW0_wmode;
    if (RW0_en & RW0_wmask[0] & RW0_wmode)
      Memory[RW0_addr][32'h0 +: 21] <= RW0_wdata[20:0];
    if (RW0_en & RW0_wmask[1] & RW0_wmode)
      Memory[RW0_addr][32'h15 +: 21] <= RW0_wdata[41:21];
    if (RW0_en & RW0_wmask[2] & RW0_wmode)
      Memory[RW0_addr][32'h2A +: 21] <= RW0_wdata[62:42];
    if (RW0_en & RW0_wmask[3] & RW0_wmode)
      Memory[RW0_addr][32'h3F +: 21] <= RW0_wdata[83:63];
    if (RW0_en & RW0_wmask[4] & RW0_wmode)
      Memory[RW0_addr][32'h54 +: 21] <= RW0_wdata[104:84];
    if (RW0_en & RW0_wmask[5] & RW0_wmode)
      Memory[RW0_addr][32'h69 +: 21] <= RW0_wdata[125:105];
    if (RW0_en & RW0_wmask[6] & RW0_wmode)
      Memory[RW0_addr][32'h7E +: 21] <= RW0_wdata[146:126];
    if (RW0_en & RW0_wmask[7] & RW0_wmode)
      Memory[RW0_addr][32'h93 +: 21] <= RW0_wdata[167:147];
  end // always @(posedge)
  assign RW0_rdata = _RW0_ren_d0 & ~_RW0_rmode_d0 ? Memory[_RW0_raddr_d0] : 168'bx;
endmodule

