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

module PMPChecker(
  input  [1:0]  io_prv,
  input         io_pmp_0_cfg_l,
  input  [1:0]  io_pmp_0_cfg_a,
  input         io_pmp_0_cfg_x,
                io_pmp_0_cfg_w,
                io_pmp_0_cfg_r,
  input  [30:0] io_pmp_0_addr,
  input  [32:0] io_pmp_0_mask,
  input         io_pmp_1_cfg_l,
  input  [1:0]  io_pmp_1_cfg_a,
  input         io_pmp_1_cfg_x,
                io_pmp_1_cfg_w,
                io_pmp_1_cfg_r,
  input  [30:0] io_pmp_1_addr,
  input  [32:0] io_pmp_1_mask,
  input         io_pmp_2_cfg_l,
  input  [1:0]  io_pmp_2_cfg_a,
  input         io_pmp_2_cfg_x,
                io_pmp_2_cfg_w,
                io_pmp_2_cfg_r,
  input  [30:0] io_pmp_2_addr,
  input  [32:0] io_pmp_2_mask,
  input         io_pmp_3_cfg_l,
  input  [1:0]  io_pmp_3_cfg_a,
  input         io_pmp_3_cfg_x,
                io_pmp_3_cfg_w,
                io_pmp_3_cfg_r,
  input  [30:0] io_pmp_3_addr,
  input  [32:0] io_pmp_3_mask,
  input         io_pmp_4_cfg_l,
  input  [1:0]  io_pmp_4_cfg_a,
  input         io_pmp_4_cfg_x,
                io_pmp_4_cfg_w,
                io_pmp_4_cfg_r,
  input  [30:0] io_pmp_4_addr,
  input  [32:0] io_pmp_4_mask,
  input         io_pmp_5_cfg_l,
  input  [1:0]  io_pmp_5_cfg_a,
  input         io_pmp_5_cfg_x,
                io_pmp_5_cfg_w,
                io_pmp_5_cfg_r,
  input  [30:0] io_pmp_5_addr,
  input  [32:0] io_pmp_5_mask,
  input         io_pmp_6_cfg_l,
  input  [1:0]  io_pmp_6_cfg_a,
  input         io_pmp_6_cfg_x,
                io_pmp_6_cfg_w,
                io_pmp_6_cfg_r,
  input  [30:0] io_pmp_6_addr,
  input  [32:0] io_pmp_6_mask,
  input         io_pmp_7_cfg_l,
  input  [1:0]  io_pmp_7_cfg_a,
  input         io_pmp_7_cfg_x,
                io_pmp_7_cfg_w,
                io_pmp_7_cfg_r,
  input  [30:0] io_pmp_7_addr,
  input  [32:0] io_pmp_7_mask,
                io_addr,
  output        io_r,
                io_w,
                io_x
);

  wire res_hit = io_pmp_7_cfg_a[1] ? ((io_addr[32:4] ^ io_pmp_7_addr[30:2]) & ~(io_pmp_7_mask[32:4])) == 29'h0 : io_pmp_7_cfg_a[0] & io_addr[32:4] >= io_pmp_6_addr[30:2] & (io_addr[32:4] < io_pmp_7_addr[30:2] | (io_addr[32:4] ^ io_pmp_7_addr[30:2]) == 29'h0 & io_addr[3:0] < {io_pmp_7_addr[1:0], 2'h0});
  wire res_ignore = io_prv[1] & ~io_pmp_7_cfg_l;
  wire res_aligned = io_pmp_7_cfg_a[1] ? (&(io_pmp_7_mask[3:0])) : ~((io_addr[32:4] ^ io_pmp_6_addr[30:2]) == 29'h0 & (|(io_pmp_6_addr[1:0] & ~(io_addr[3:2]))) | (io_addr[32:4] ^ io_pmp_7_addr[30:2]) == 29'h0 & (|(io_pmp_7_addr[1:0])));
  wire res_hit_1 = io_pmp_6_cfg_a[1] ? ((io_addr[32:4] ^ io_pmp_6_addr[30:2]) & ~(io_pmp_6_mask[32:4])) == 29'h0 : io_pmp_6_cfg_a[0] & io_addr[32:4] >= io_pmp_5_addr[30:2] & (io_addr[32:4] < io_pmp_6_addr[30:2] | (io_addr[32:4] ^ io_pmp_6_addr[30:2]) == 29'h0 & io_addr[3:0] < {io_pmp_6_addr[1:0], 2'h0});
  wire res_ignore_1 = io_prv[1] & ~io_pmp_6_cfg_l;
  wire res_aligned_1 = io_pmp_6_cfg_a[1] ? (&(io_pmp_6_mask[3:0])) : ~((io_addr[32:4] ^ io_pmp_5_addr[30:2]) == 29'h0 & (|(io_pmp_5_addr[1:0] & ~(io_addr[3:2]))) | (io_addr[32:4] ^ io_pmp_6_addr[30:2]) == 29'h0 & (|(io_pmp_6_addr[1:0])));
  wire res_hit_2 = io_pmp_5_cfg_a[1] ? ((io_addr[32:4] ^ io_pmp_5_addr[30:2]) & ~(io_pmp_5_mask[32:4])) == 29'h0 : io_pmp_5_cfg_a[0] & io_addr[32:4] >= io_pmp_4_addr[30:2] & (io_addr[32:4] < io_pmp_5_addr[30:2] | (io_addr[32:4] ^ io_pmp_5_addr[30:2]) == 29'h0 & io_addr[3:0] < {io_pmp_5_addr[1:0], 2'h0});
  wire res_ignore_2 = io_prv[1] & ~io_pmp_5_cfg_l;
  wire res_aligned_2 = io_pmp_5_cfg_a[1] ? (&(io_pmp_5_mask[3:0])) : ~((io_addr[32:4] ^ io_pmp_4_addr[30:2]) == 29'h0 & (|(io_pmp_4_addr[1:0] & ~(io_addr[3:2]))) | (io_addr[32:4] ^ io_pmp_5_addr[30:2]) == 29'h0 & (|(io_pmp_5_addr[1:0])));
  wire res_hit_3 = io_pmp_4_cfg_a[1] ? ((io_addr[32:4] ^ io_pmp_4_addr[30:2]) & ~(io_pmp_4_mask[32:4])) == 29'h0 : io_pmp_4_cfg_a[0] & io_addr[32:4] >= io_pmp_3_addr[30:2] & (io_addr[32:4] < io_pmp_4_addr[30:2] | (io_addr[32:4] ^ io_pmp_4_addr[30:2]) == 29'h0 & io_addr[3:0] < {io_pmp_4_addr[1:0], 2'h0});
  wire res_ignore_3 = io_prv[1] & ~io_pmp_4_cfg_l;
  wire res_aligned_3 = io_pmp_4_cfg_a[1] ? (&(io_pmp_4_mask[3:0])) : ~((io_addr[32:4] ^ io_pmp_3_addr[30:2]) == 29'h0 & (|(io_pmp_3_addr[1:0] & ~(io_addr[3:2]))) | (io_addr[32:4] ^ io_pmp_4_addr[30:2]) == 29'h0 & (|(io_pmp_4_addr[1:0])));
  wire res_hit_4 = io_pmp_3_cfg_a[1] ? ((io_addr[32:4] ^ io_pmp_3_addr[30:2]) & ~(io_pmp_3_mask[32:4])) == 29'h0 : io_pmp_3_cfg_a[0] & io_addr[32:4] >= io_pmp_2_addr[30:2] & (io_addr[32:4] < io_pmp_3_addr[30:2] | (io_addr[32:4] ^ io_pmp_3_addr[30:2]) == 29'h0 & io_addr[3:0] < {io_pmp_3_addr[1:0], 2'h0});
  wire res_ignore_4 = io_prv[1] & ~io_pmp_3_cfg_l;
  wire res_aligned_4 = io_pmp_3_cfg_a[1] ? (&(io_pmp_3_mask[3:0])) : ~((io_addr[32:4] ^ io_pmp_2_addr[30:2]) == 29'h0 & (|(io_pmp_2_addr[1:0] & ~(io_addr[3:2]))) | (io_addr[32:4] ^ io_pmp_3_addr[30:2]) == 29'h0 & (|(io_pmp_3_addr[1:0])));
  wire res_hit_5 = io_pmp_2_cfg_a[1] ? ((io_addr[32:4] ^ io_pmp_2_addr[30:2]) & ~(io_pmp_2_mask[32:4])) == 29'h0 : io_pmp_2_cfg_a[0] & io_addr[32:4] >= io_pmp_1_addr[30:2] & (io_addr[32:4] < io_pmp_2_addr[30:2] | (io_addr[32:4] ^ io_pmp_2_addr[30:2]) == 29'h0 & io_addr[3:0] < {io_pmp_2_addr[1:0], 2'h0});
  wire res_ignore_5 = io_prv[1] & ~io_pmp_2_cfg_l;
  wire res_aligned_5 = io_pmp_2_cfg_a[1] ? (&(io_pmp_2_mask[3:0])) : ~((io_addr[32:4] ^ io_pmp_1_addr[30:2]) == 29'h0 & (|(io_pmp_1_addr[1:0] & ~(io_addr[3:2]))) | (io_addr[32:4] ^ io_pmp_2_addr[30:2]) == 29'h0 & (|(io_pmp_2_addr[1:0])));
  wire res_hit_6 = io_pmp_1_cfg_a[1] ? ((io_addr[32:4] ^ io_pmp_1_addr[30:2]) & ~(io_pmp_1_mask[32:4])) == 29'h0 : io_pmp_1_cfg_a[0] & io_addr[32:4] >= io_pmp_0_addr[30:2] & (io_addr[32:4] < io_pmp_1_addr[30:2] | (io_addr[32:4] ^ io_pmp_1_addr[30:2]) == 29'h0 & io_addr[3:0] < {io_pmp_1_addr[1:0], 2'h0});
  wire res_ignore_6 = io_prv[1] & ~io_pmp_1_cfg_l;
  wire res_aligned_6 = io_pmp_1_cfg_a[1] ? (&(io_pmp_1_mask[3:0])) : ~((io_addr[32:4] ^ io_pmp_0_addr[30:2]) == 29'h0 & (|(io_pmp_0_addr[1:0] & ~(io_addr[3:2]))) | (io_addr[32:4] ^ io_pmp_1_addr[30:2]) == 29'h0 & (|(io_pmp_1_addr[1:0])));
  wire res_hit_7 = io_pmp_0_cfg_a[1] ? ((io_addr[32:4] ^ io_pmp_0_addr[30:2]) & ~(io_pmp_0_mask[32:4])) == 29'h0 : io_pmp_0_cfg_a[0] & (io_addr[32:4] < io_pmp_0_addr[30:2] | (io_addr[32:4] ^ io_pmp_0_addr[30:2]) == 29'h0 & io_addr[3:0] < {io_pmp_0_addr[1:0], 2'h0});
  wire res_ignore_7 = io_prv[1] & ~io_pmp_0_cfg_l;
  wire res_aligned_7 = io_pmp_0_cfg_a[1] ? (&(io_pmp_0_mask[3:0])) : ~((io_addr[32:4] ^ io_pmp_0_addr[30:2]) == 29'h0 & (|(io_pmp_0_addr[1:0])));
  assign io_r = res_hit_7 ? res_aligned_7 & (io_pmp_0_cfg_r | res_ignore_7) : res_hit_6 ? res_aligned_6 & (io_pmp_1_cfg_r | res_ignore_6) : res_hit_5 ? res_aligned_5 & (io_pmp_2_cfg_r | res_ignore_5) : res_hit_4 ? res_aligned_4 & (io_pmp_3_cfg_r | res_ignore_4) : res_hit_3 ? res_aligned_3 & (io_pmp_4_cfg_r | res_ignore_3) : res_hit_2 ? res_aligned_2 & (io_pmp_5_cfg_r | res_ignore_2) : res_hit_1 ? res_aligned_1 & (io_pmp_6_cfg_r | res_ignore_1) : res_hit ? res_aligned & (io_pmp_7_cfg_r | res_ignore) : io_prv[1];
  assign io_w = res_hit_7 ? res_aligned_7 & (io_pmp_0_cfg_w | res_ignore_7) : res_hit_6 ? res_aligned_6 & (io_pmp_1_cfg_w | res_ignore_6) : res_hit_5 ? res_aligned_5 & (io_pmp_2_cfg_w | res_ignore_5) : res_hit_4 ? res_aligned_4 & (io_pmp_3_cfg_w | res_ignore_4) : res_hit_3 ? res_aligned_3 & (io_pmp_4_cfg_w | res_ignore_3) : res_hit_2 ? res_aligned_2 & (io_pmp_5_cfg_w | res_ignore_2) : res_hit_1 ? res_aligned_1 & (io_pmp_6_cfg_w | res_ignore_1) : res_hit ? res_aligned & (io_pmp_7_cfg_w | res_ignore) : io_prv[1];
  assign io_x = res_hit_7 ? res_aligned_7 & (io_pmp_0_cfg_x | res_ignore_7) : res_hit_6 ? res_aligned_6 & (io_pmp_1_cfg_x | res_ignore_6) : res_hit_5 ? res_aligned_5 & (io_pmp_2_cfg_x | res_ignore_5) : res_hit_4 ? res_aligned_4 & (io_pmp_3_cfg_x | res_ignore_4) : res_hit_3 ? res_aligned_3 & (io_pmp_4_cfg_x | res_ignore_3) : res_hit_2 ? res_aligned_2 & (io_pmp_5_cfg_x | res_ignore_2) : res_hit_1 ? res_aligned_1 & (io_pmp_6_cfg_x | res_ignore_1) : res_hit ? res_aligned & (io_pmp_7_cfg_x | res_ignore) : io_prv[1];
endmodule

