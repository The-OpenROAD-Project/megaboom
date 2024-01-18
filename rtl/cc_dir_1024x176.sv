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
module cc_dir_1024x176(
  input  [9:0]   RW0_addr,
  input          RW0_en,
                 RW0_clk,
                 RW0_wmode,
  input  [175:0] RW0_wdata,
  output [175:0] RW0_rdata,
  input  [7:0]   RW0_wmask
);

  reg [175:0] Memory[0:1023];
  reg [9:0]   _RW0_raddr_d0;
  reg         _RW0_ren_d0;
  reg         _RW0_rmode_d0;
  always @(posedge RW0_clk) begin
    _RW0_raddr_d0 <= RW0_addr;
    _RW0_ren_d0 <= RW0_en;
    _RW0_rmode_d0 <= RW0_wmode;
    if (RW0_en & RW0_wmask[0] & RW0_wmode)
      Memory[RW0_addr][32'h0 +: 22] <= RW0_wdata[21:0];
    if (RW0_en & RW0_wmask[1] & RW0_wmode)
      Memory[RW0_addr][32'h16 +: 22] <= RW0_wdata[43:22];
    if (RW0_en & RW0_wmask[2] & RW0_wmode)
      Memory[RW0_addr][32'h2C +: 22] <= RW0_wdata[65:44];
    if (RW0_en & RW0_wmask[3] & RW0_wmode)
      Memory[RW0_addr][32'h42 +: 22] <= RW0_wdata[87:66];
    if (RW0_en & RW0_wmask[4] & RW0_wmode)
      Memory[RW0_addr][32'h58 +: 22] <= RW0_wdata[109:88];
    if (RW0_en & RW0_wmask[5] & RW0_wmode)
      Memory[RW0_addr][32'h6E +: 22] <= RW0_wdata[131:110];
    if (RW0_en & RW0_wmask[6] & RW0_wmode)
      Memory[RW0_addr][32'h84 +: 22] <= RW0_wdata[153:132];
    if (RW0_en & RW0_wmask[7] & RW0_wmode)
      Memory[RW0_addr][32'h9A +: 22] <= RW0_wdata[175:154];
  end // always @(posedge)
  assign RW0_rdata = _RW0_ren_d0 & ~_RW0_rmode_d0 ? Memory[_RW0_raddr_d0] : 176'bx;
endmodule

