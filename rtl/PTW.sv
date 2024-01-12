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

module PTW(
  input         clock,
                reset,
  output        io_requestor_0_req_ready,
  input         io_requestor_0_req_valid,
                io_requestor_0_req_bits_valid,
  input  [26:0] io_requestor_0_req_bits_bits_addr,
  output        io_requestor_0_resp_valid,
                io_requestor_0_resp_bits_ae_final,
  output [43:0] io_requestor_0_resp_bits_pte_ppn,
  output        io_requestor_0_resp_bits_pte_d,
                io_requestor_0_resp_bits_pte_a,
                io_requestor_0_resp_bits_pte_g,
                io_requestor_0_resp_bits_pte_u,
                io_requestor_0_resp_bits_pte_x,
                io_requestor_0_resp_bits_pte_w,
                io_requestor_0_resp_bits_pte_r,
                io_requestor_0_resp_bits_pte_v,
  output [1:0]  io_requestor_0_resp_bits_level,
  output        io_requestor_0_resp_bits_homogeneous,
  output [3:0]  io_requestor_0_ptbr_mode,
  output [1:0]  io_requestor_0_status_dprv,
  output        io_requestor_0_status_mxr,
                io_requestor_0_status_sum,
                io_requestor_0_pmp_0_cfg_l,
  output [1:0]  io_requestor_0_pmp_0_cfg_a,
  output        io_requestor_0_pmp_0_cfg_x,
                io_requestor_0_pmp_0_cfg_w,
                io_requestor_0_pmp_0_cfg_r,
  output [30:0] io_requestor_0_pmp_0_addr,
  output [32:0] io_requestor_0_pmp_0_mask,
  output        io_requestor_0_pmp_1_cfg_l,
  output [1:0]  io_requestor_0_pmp_1_cfg_a,
  output        io_requestor_0_pmp_1_cfg_x,
                io_requestor_0_pmp_1_cfg_w,
                io_requestor_0_pmp_1_cfg_r,
  output [30:0] io_requestor_0_pmp_1_addr,
  output [32:0] io_requestor_0_pmp_1_mask,
  output        io_requestor_0_pmp_2_cfg_l,
  output [1:0]  io_requestor_0_pmp_2_cfg_a,
  output        io_requestor_0_pmp_2_cfg_x,
                io_requestor_0_pmp_2_cfg_w,
                io_requestor_0_pmp_2_cfg_r,
  output [30:0] io_requestor_0_pmp_2_addr,
  output [32:0] io_requestor_0_pmp_2_mask,
  output        io_requestor_0_pmp_3_cfg_l,
  output [1:0]  io_requestor_0_pmp_3_cfg_a,
  output        io_requestor_0_pmp_3_cfg_x,
                io_requestor_0_pmp_3_cfg_w,
                io_requestor_0_pmp_3_cfg_r,
  output [30:0] io_requestor_0_pmp_3_addr,
  output [32:0] io_requestor_0_pmp_3_mask,
  output        io_requestor_0_pmp_4_cfg_l,
  output [1:0]  io_requestor_0_pmp_4_cfg_a,
  output        io_requestor_0_pmp_4_cfg_x,
                io_requestor_0_pmp_4_cfg_w,
                io_requestor_0_pmp_4_cfg_r,
  output [30:0] io_requestor_0_pmp_4_addr,
  output [32:0] io_requestor_0_pmp_4_mask,
  output        io_requestor_0_pmp_5_cfg_l,
  output [1:0]  io_requestor_0_pmp_5_cfg_a,
  output        io_requestor_0_pmp_5_cfg_x,
                io_requestor_0_pmp_5_cfg_w,
                io_requestor_0_pmp_5_cfg_r,
  output [30:0] io_requestor_0_pmp_5_addr,
  output [32:0] io_requestor_0_pmp_5_mask,
  output        io_requestor_0_pmp_6_cfg_l,
  output [1:0]  io_requestor_0_pmp_6_cfg_a,
  output        io_requestor_0_pmp_6_cfg_x,
                io_requestor_0_pmp_6_cfg_w,
                io_requestor_0_pmp_6_cfg_r,
  output [30:0] io_requestor_0_pmp_6_addr,
  output [32:0] io_requestor_0_pmp_6_mask,
  output        io_requestor_0_pmp_7_cfg_l,
  output [1:0]  io_requestor_0_pmp_7_cfg_a,
  output        io_requestor_0_pmp_7_cfg_x,
                io_requestor_0_pmp_7_cfg_w,
                io_requestor_0_pmp_7_cfg_r,
  output [30:0] io_requestor_0_pmp_7_addr,
  output [32:0] io_requestor_0_pmp_7_mask,
  output        io_requestor_1_req_ready,
  input         io_requestor_1_req_valid,
  input  [26:0] io_requestor_1_req_bits_bits_addr,
  input         io_requestor_1_req_bits_bits_need_gpa,
  output        io_requestor_1_resp_valid,
                io_requestor_1_resp_bits_ae_ptw,
                io_requestor_1_resp_bits_ae_final,
                io_requestor_1_resp_bits_pf,
                io_requestor_1_resp_bits_gf,
                io_requestor_1_resp_bits_hr,
                io_requestor_1_resp_bits_hw,
                io_requestor_1_resp_bits_hx,
  output [43:0] io_requestor_1_resp_bits_pte_ppn,
  output        io_requestor_1_resp_bits_pte_d,
                io_requestor_1_resp_bits_pte_a,
                io_requestor_1_resp_bits_pte_g,
                io_requestor_1_resp_bits_pte_u,
                io_requestor_1_resp_bits_pte_x,
                io_requestor_1_resp_bits_pte_w,
                io_requestor_1_resp_bits_pte_r,
                io_requestor_1_resp_bits_pte_v,
  output [1:0]  io_requestor_1_resp_bits_level,
  output        io_requestor_1_resp_bits_homogeneous,
  output [3:0]  io_requestor_1_ptbr_mode,
  output        io_requestor_1_status_debug,
  output [1:0]  io_requestor_1_status_prv,
  output        io_requestor_1_pmp_0_cfg_l,
  output [1:0]  io_requestor_1_pmp_0_cfg_a,
  output        io_requestor_1_pmp_0_cfg_x,
                io_requestor_1_pmp_0_cfg_w,
                io_requestor_1_pmp_0_cfg_r,
  output [30:0] io_requestor_1_pmp_0_addr,
  output [32:0] io_requestor_1_pmp_0_mask,
  output        io_requestor_1_pmp_1_cfg_l,
  output [1:0]  io_requestor_1_pmp_1_cfg_a,
  output        io_requestor_1_pmp_1_cfg_x,
                io_requestor_1_pmp_1_cfg_w,
                io_requestor_1_pmp_1_cfg_r,
  output [30:0] io_requestor_1_pmp_1_addr,
  output [32:0] io_requestor_1_pmp_1_mask,
  output        io_requestor_1_pmp_2_cfg_l,
  output [1:0]  io_requestor_1_pmp_2_cfg_a,
  output        io_requestor_1_pmp_2_cfg_x,
                io_requestor_1_pmp_2_cfg_w,
                io_requestor_1_pmp_2_cfg_r,
  output [30:0] io_requestor_1_pmp_2_addr,
  output [32:0] io_requestor_1_pmp_2_mask,
  output        io_requestor_1_pmp_3_cfg_l,
  output [1:0]  io_requestor_1_pmp_3_cfg_a,
  output        io_requestor_1_pmp_3_cfg_x,
                io_requestor_1_pmp_3_cfg_w,
                io_requestor_1_pmp_3_cfg_r,
  output [30:0] io_requestor_1_pmp_3_addr,
  output [32:0] io_requestor_1_pmp_3_mask,
  output        io_requestor_1_pmp_4_cfg_l,
  output [1:0]  io_requestor_1_pmp_4_cfg_a,
  output        io_requestor_1_pmp_4_cfg_x,
                io_requestor_1_pmp_4_cfg_w,
                io_requestor_1_pmp_4_cfg_r,
  output [30:0] io_requestor_1_pmp_4_addr,
  output [32:0] io_requestor_1_pmp_4_mask,
  output        io_requestor_1_pmp_5_cfg_l,
  output [1:0]  io_requestor_1_pmp_5_cfg_a,
  output        io_requestor_1_pmp_5_cfg_x,
                io_requestor_1_pmp_5_cfg_w,
                io_requestor_1_pmp_5_cfg_r,
  output [30:0] io_requestor_1_pmp_5_addr,
  output [32:0] io_requestor_1_pmp_5_mask,
  output        io_requestor_1_pmp_6_cfg_l,
  output [1:0]  io_requestor_1_pmp_6_cfg_a,
  output        io_requestor_1_pmp_6_cfg_x,
                io_requestor_1_pmp_6_cfg_w,
                io_requestor_1_pmp_6_cfg_r,
  output [30:0] io_requestor_1_pmp_6_addr,
  output [32:0] io_requestor_1_pmp_6_mask,
  output        io_requestor_1_pmp_7_cfg_l,
  output [1:0]  io_requestor_1_pmp_7_cfg_a,
  output        io_requestor_1_pmp_7_cfg_x,
                io_requestor_1_pmp_7_cfg_w,
                io_requestor_1_pmp_7_cfg_r,
  output [30:0] io_requestor_1_pmp_7_addr,
  output [32:0] io_requestor_1_pmp_7_mask,
  input         io_mem_req_ready,
  output        io_mem_req_valid,
  output [39:0] io_mem_req_bits_addr,
  output        io_mem_s1_kill,
  input         io_mem_s2_nack,
                io_mem_resp_valid,
  input  [63:0] io_mem_resp_bits_data,
  input         io_mem_s2_xcpt_ae_ld,
  input  [3:0]  io_dpath_ptbr_mode,
  input  [43:0] io_dpath_ptbr_ppn,
  input         io_dpath_sfence_valid,
                io_dpath_sfence_bits_rs1,
                io_dpath_sfence_bits_rs2,
  input  [38:0] io_dpath_sfence_bits_addr,
  input         io_dpath_status_debug,
  input  [1:0]  io_dpath_status_dprv,
                io_dpath_status_prv,
  input         io_dpath_status_mxr,
                io_dpath_status_sum,
                io_dpath_pmp_0_cfg_l,
  input  [1:0]  io_dpath_pmp_0_cfg_a,
  input         io_dpath_pmp_0_cfg_x,
                io_dpath_pmp_0_cfg_w,
                io_dpath_pmp_0_cfg_r,
  input  [30:0] io_dpath_pmp_0_addr,
  input  [32:0] io_dpath_pmp_0_mask,
  input         io_dpath_pmp_1_cfg_l,
  input  [1:0]  io_dpath_pmp_1_cfg_a,
  input         io_dpath_pmp_1_cfg_x,
                io_dpath_pmp_1_cfg_w,
                io_dpath_pmp_1_cfg_r,
  input  [30:0] io_dpath_pmp_1_addr,
  input  [32:0] io_dpath_pmp_1_mask,
  input         io_dpath_pmp_2_cfg_l,
  input  [1:0]  io_dpath_pmp_2_cfg_a,
  input         io_dpath_pmp_2_cfg_x,
                io_dpath_pmp_2_cfg_w,
                io_dpath_pmp_2_cfg_r,
  input  [30:0] io_dpath_pmp_2_addr,
  input  [32:0] io_dpath_pmp_2_mask,
  input         io_dpath_pmp_3_cfg_l,
  input  [1:0]  io_dpath_pmp_3_cfg_a,
  input         io_dpath_pmp_3_cfg_x,
                io_dpath_pmp_3_cfg_w,
                io_dpath_pmp_3_cfg_r,
  input  [30:0] io_dpath_pmp_3_addr,
  input  [32:0] io_dpath_pmp_3_mask,
  input         io_dpath_pmp_4_cfg_l,
  input  [1:0]  io_dpath_pmp_4_cfg_a,
  input         io_dpath_pmp_4_cfg_x,
                io_dpath_pmp_4_cfg_w,
                io_dpath_pmp_4_cfg_r,
  input  [30:0] io_dpath_pmp_4_addr,
  input  [32:0] io_dpath_pmp_4_mask,
  input         io_dpath_pmp_5_cfg_l,
  input  [1:0]  io_dpath_pmp_5_cfg_a,
  input         io_dpath_pmp_5_cfg_x,
                io_dpath_pmp_5_cfg_w,
                io_dpath_pmp_5_cfg_r,
  input  [30:0] io_dpath_pmp_5_addr,
  input  [32:0] io_dpath_pmp_5_mask,
  input         io_dpath_pmp_6_cfg_l,
  input  [1:0]  io_dpath_pmp_6_cfg_a,
  input         io_dpath_pmp_6_cfg_x,
                io_dpath_pmp_6_cfg_w,
                io_dpath_pmp_6_cfg_r,
  input  [30:0] io_dpath_pmp_6_addr,
  input  [32:0] io_dpath_pmp_6_mask,
  input         io_dpath_pmp_7_cfg_l,
  input  [1:0]  io_dpath_pmp_7_cfg_a,
  input         io_dpath_pmp_7_cfg_x,
                io_dpath_pmp_7_cfg_w,
                io_dpath_pmp_7_cfg_r,
  input  [30:0] io_dpath_pmp_7_addr,
  input  [32:0] io_dpath_pmp_7_mask
);

  wire [8:0]   _s1_rdata_T_2;
  wire         readEnable;
  wire         writeEnable;
  wire [8:0]   writeAddr;
  reg          l2_refill;
  wire [43:0]  _r_pte_barrier_io_y_ppn;
  wire         _r_pte_barrier_io_y_d;
  wire         _r_pte_barrier_io_y_a;
  wire         _r_pte_barrier_io_y_g;
  wire         _r_pte_barrier_io_y_u;
  wire         _r_pte_barrier_io_y_x;
  wire         _r_pte_barrier_io_y_w;
  wire         _r_pte_barrier_io_y_r;
  wire         _r_pte_barrier_io_y_v;
  wire [2:0]   _state_barrier_io_y;
  wire [45:0]  _l2_tlb_ram_0_ext_RW0_rdata;
  wire         _arb_io_out_valid;
  wire         _arb_io_out_bits_valid;
  wire [26:0]  _arb_io_out_bits_bits_addr;
  wire         _arb_io_out_bits_bits_need_gpa;
  wire [1:0]   _arb_io_chosen;
  reg  [2:0]   state;
  wire         _arb_io_out_ready_T_2 = ~(|state) & ~l2_refill;
  reg          resp_valid_0;
  reg          resp_valid_1;
  reg          invalidated;
  reg  [1:0]   count;
  reg          resp_ae_ptw;
  reg          resp_ae_final;
  reg          resp_pf;
  reg          resp_gf;
  reg          resp_hr;
  reg          resp_hw;
  reg          resp_hx;
  reg  [26:0]  r_req_addr;
  reg          r_req_need_gpa;
  reg  [1:0]   r_req_dest;
  reg  [43:0]  r_pte_ppn;
  reg          r_pte_d;
  reg          r_pte_a;
  reg          r_pte_g;
  reg          r_pte_u;
  reg          r_pte_x;
  reg          r_pte_w;
  reg          r_pte_r;
  reg          r_pte_v;
  reg          stage2;
  reg          mem_resp_valid;
  reg  [63:0]  mem_resp_data;
  wire         pte_v = ~((mem_resp_data[1] | mem_resp_data[2] | mem_resp_data[3]) & (~(count[1]) & (|(mem_resp_data[18:10])) | count == 2'h0 & (|(mem_resp_data[27:19])))) & mem_resp_data[0];
  wire         _resp_ae_ptw_T_14 = mem_resp_data[63:54] == 10'h0;
  wire         traverse = pte_v & ~(mem_resp_data[1]) & ~(mem_resp_data[2]) & ~(mem_resp_data[3]) & ~(mem_resp_data[7]) & ~(mem_resp_data[6]) & ~(mem_resp_data[4]) & _resp_ae_ptw_T_14 & ~(|(mem_resp_data[53:31])) & ~(count[1]);
  wire         _leaf_T_5 = count == 2'h1;
  wire         _leaf_T_8 = count == 2'h2;
  wire         _GEN = (&count) | _leaf_T_8;
  wire [8:0]   pte_addr_vpn_idx = _GEN ? r_req_addr[8:0] : _leaf_T_5 ? r_req_addr[17:9] : r_req_addr[26:18];
  reg  [6:0]   state_reg;
  reg  [7:0]   valid;
  reg  [32:0]  tags_0;
  reg  [32:0]  tags_1;
  reg  [32:0]  tags_2;
  reg  [32:0]  tags_3;
  reg  [32:0]  tags_4;
  reg  [32:0]  tags_5;
  reg  [32:0]  tags_6;
  reg  [32:0]  tags_7;
  reg  [20:0]  data_0;
  reg  [20:0]  data_1;
  reg  [20:0]  data_2;
  reg  [20:0]  data_3;
  reg  [20:0]  data_4;
  reg  [20:0]  data_5;
  reg  [20:0]  data_6;
  reg  [20:0]  data_7;
  wire [32:0]  _GEN_0 = {r_pte_ppn[20:0], pte_addr_vpn_idx, 3'h0};
  wire         _hits_T = tags_0 == _GEN_0;
  wire         _hits_T_1 = tags_1 == _GEN_0;
  wire         _hits_T_2 = tags_2 == _GEN_0;
  wire         _hits_T_3 = tags_3 == _GEN_0;
  wire         _hits_T_4 = tags_4 == _GEN_0;
  wire         _hits_T_5 = tags_5 == _GEN_0;
  wire         _hits_T_6 = tags_6 == _GEN_0;
  wire         _hits_T_7 = tags_7 == _GEN_0;
  wire [7:0]   hits = {_hits_T_7, _hits_T_6, _hits_T_5, _hits_T_4, _hits_T_3, _hits_T_2, _hits_T_1, _hits_T} & valid;
  wire         pte_cache_hit = (|hits) & ~(count[1]);
  wire         _r_pte_T_2 = state == 3'h1;
  reg          pte_hit;
  reg  [511:0] g_0;
  reg  [511:0] valid_2_0;
  assign writeAddr = r_req_addr[8:0];
  assign writeEnable = l2_refill & ~invalidated;
  wire         _r_pte_T_23 = _arb_io_out_ready_T_2 & _arb_io_out_valid;
  assign readEnable = ~l2_refill & _r_pte_T_23;
  reg          s1_valid;
  reg          s2_valid;
  assign _s1_rdata_T_2 = _arb_io_out_bits_bits_addr[8:0];
  reg  [45:0]  r_2;
  reg          s2_valid_vec;
  reg          s2_g_vec_0;
  wire         l2_error = s2_valid_vec & ^r_2;
  wire         s2_hit_vec_0 = s2_valid_vec & r_req_addr[26:9] == r_2[44:27];
  wire         l2_hit = s2_valid & s2_hit_vec_0;
  wire [55:0]  _pmpHomogeneous_T = {r_pte_ppn, 12'h0};
  wire [24:0]  _GEN_1 = {r_pte_ppn[43:20], ~(r_pte_ppn[19])};
  wire [32:0]  _GEN_2 = {r_pte_ppn[20:0], 12'h0};
  wire [24:0]  _GEN_3 = {r_pte_ppn[43:21], r_pte_ppn[20:19] ^ 2'h2};
  wire [29:0]  _GEN_4 = {r_pte_ppn[43:16], ~(r_pte_ppn[15:14])};
  wire [55:0]  _GEN_5 = {23'h0, io_dpath_pmp_0_addr, 2'h0};
  wire [32:0]  pmpHomogeneous_pgMask = _GEN ? 33'h1FFFFF000 : _leaf_T_5 ? 33'h1FFE00000 : 33'h1C0000000;
  wire [55:0]  _GEN_6 = {23'h0, io_dpath_pmp_1_addr, 2'h0};
  wire [32:0]  pmpHomogeneous_pgMask_1 = _GEN ? 33'h1FFFFF000 : _leaf_T_5 ? 33'h1FFE00000 : 33'h1C0000000;
  wire [32:0]  _GEN_7 = _GEN_2 & pmpHomogeneous_pgMask_1;
  wire [55:0]  _GEN_8 = {23'h0, io_dpath_pmp_2_addr, 2'h0};
  wire [32:0]  pmpHomogeneous_pgMask_2 = _GEN ? 33'h1FFFFF000 : _leaf_T_5 ? 33'h1FFE00000 : 33'h1C0000000;
  wire [32:0]  _GEN_9 = _GEN_2 & pmpHomogeneous_pgMask_2;
  wire [55:0]  _GEN_10 = {23'h0, io_dpath_pmp_3_addr, 2'h0};
  wire [32:0]  pmpHomogeneous_pgMask_3 = _GEN ? 33'h1FFFFF000 : _leaf_T_5 ? 33'h1FFE00000 : 33'h1C0000000;
  wire [32:0]  _GEN_11 = _GEN_2 & pmpHomogeneous_pgMask_3;
  wire [55:0]  _GEN_12 = {23'h0, io_dpath_pmp_4_addr, 2'h0};
  wire [32:0]  pmpHomogeneous_pgMask_4 = _GEN ? 33'h1FFFFF000 : _leaf_T_5 ? 33'h1FFE00000 : 33'h1C0000000;
  wire [32:0]  _GEN_13 = _GEN_2 & pmpHomogeneous_pgMask_4;
  wire [55:0]  _GEN_14 = {23'h0, io_dpath_pmp_5_addr, 2'h0};
  wire [32:0]  pmpHomogeneous_pgMask_5 = _GEN ? 33'h1FFFFF000 : _leaf_T_5 ? 33'h1FFE00000 : 33'h1C0000000;
  wire [32:0]  _GEN_15 = _GEN_2 & pmpHomogeneous_pgMask_5;
  wire [55:0]  _GEN_16 = {23'h0, io_dpath_pmp_6_addr, 2'h0};
  wire [32:0]  pmpHomogeneous_pgMask_6 = _GEN ? 33'h1FFFFF000 : _leaf_T_5 ? 33'h1FFE00000 : 33'h1C0000000;
  wire [32:0]  _GEN_17 = _GEN_2 & pmpHomogeneous_pgMask_6;
  wire [32:0]  pmpHomogeneous_pgMask_7 = _GEN ? 33'h1FFFFF000 : _leaf_T_5 ? 33'h1FFE00000 : 33'h1C0000000;
  wire [32:0]  _GEN_18 = _GEN_2 & pmpHomogeneous_pgMask_7;
  wire         homogeneous =
    (_GEN ? r_pte_ppn[43:1] == 43'h0 | {r_pte_ppn[43:2], ~(r_pte_ppn[1:0])} == 44'h0 | {r_pte_ppn[43:5], ~(r_pte_ppn[4])} == 40'h0 | {r_pte_ppn[43:9], r_pte_ppn[8:5] ^ 4'h8, r_pte_ppn[3:0]} == 43'h0 | {r_pte_ppn[43:14], r_pte_ppn[13:4] ^ 10'h200} == 40'h0 | _GEN_4 == 30'h0 | _GEN_1 == 25'h0 | _GEN_3 == 25'h0 : _leaf_T_5 ? _GEN_4 == 30'h0 | _GEN_1 == 25'h0 | _GEN_3 == 25'h0 : _GEN_1 == 25'h0 | _GEN_3 == 25'h0) & (io_dpath_pmp_0_cfg_a[1] ? (_GEN ? io_dpath_pmp_0_mask[11] : _leaf_T_5 ? io_dpath_pmp_0_mask[20] : io_dpath_pmp_0_mask[29]) | (_GEN ? (|{r_pte_ppn[43:21], r_pte_ppn[20:0] ^ io_dpath_pmp_0_addr[30:10]}) : _leaf_T_5 ? (|{r_pte_ppn[43:21], r_pte_ppn[20:9] ^ io_dpath_pmp_0_addr[30:19]}) : (|{r_pte_ppn[43:21], r_pte_ppn[20:18] ^ io_dpath_pmp_0_addr[30:28]})) : ~(io_dpath_pmp_0_cfg_a[0]) | _pmpHomogeneous_T >= _GEN_5 | (_GEN_2 & pmpHomogeneous_pgMask) < ({io_dpath_pmp_0_addr, 2'h0} & pmpHomogeneous_pgMask)) & (io_dpath_pmp_1_cfg_a[1] ? (_GEN ? io_dpath_pmp_1_mask[11] : _leaf_T_5 ? io_dpath_pmp_1_mask[20] : io_dpath_pmp_1_mask[29]) | (_GEN ? (|{r_pte_ppn[43:21], r_pte_ppn[20:0] ^ io_dpath_pmp_1_addr[30:10]}) : _leaf_T_5 ? (|{r_pte_ppn[43:21], r_pte_ppn[20:9] ^ io_dpath_pmp_1_addr[30:19]}) : (|{r_pte_ppn[43:21], r_pte_ppn[20:18] ^ io_dpath_pmp_1_addr[30:28]})) : ~(io_dpath_pmp_1_cfg_a[0]) | _GEN_7 < ({io_dpath_pmp_0_addr, 2'h0} & pmpHomogeneous_pgMask_1) | _pmpHomogeneous_T >= _GEN_6 | _pmpHomogeneous_T >= _GEN_5 & _GEN_7 < ({io_dpath_pmp_1_addr, 2'h0} & pmpHomogeneous_pgMask_1))
    & (io_dpath_pmp_2_cfg_a[1] ? (_GEN ? io_dpath_pmp_2_mask[11] : _leaf_T_5 ? io_dpath_pmp_2_mask[20] : io_dpath_pmp_2_mask[29]) | (_GEN ? (|{r_pte_ppn[43:21], r_pte_ppn[20:0] ^ io_dpath_pmp_2_addr[30:10]}) : _leaf_T_5 ? (|{r_pte_ppn[43:21], r_pte_ppn[20:9] ^ io_dpath_pmp_2_addr[30:19]}) : (|{r_pte_ppn[43:21], r_pte_ppn[20:18] ^ io_dpath_pmp_2_addr[30:28]})) : ~(io_dpath_pmp_2_cfg_a[0]) | _GEN_9 < ({io_dpath_pmp_1_addr, 2'h0} & pmpHomogeneous_pgMask_2) | _pmpHomogeneous_T >= _GEN_8 | _pmpHomogeneous_T >= _GEN_6 & _GEN_9 < ({io_dpath_pmp_2_addr, 2'h0} & pmpHomogeneous_pgMask_2)) & (io_dpath_pmp_3_cfg_a[1] ? (_GEN ? io_dpath_pmp_3_mask[11] : _leaf_T_5 ? io_dpath_pmp_3_mask[20] : io_dpath_pmp_3_mask[29]) | (_GEN ? (|{r_pte_ppn[43:21], r_pte_ppn[20:0] ^ io_dpath_pmp_3_addr[30:10]}) : _leaf_T_5 ? (|{r_pte_ppn[43:21], r_pte_ppn[20:9] ^ io_dpath_pmp_3_addr[30:19]}) : (|{r_pte_ppn[43:21], r_pte_ppn[20:18] ^ io_dpath_pmp_3_addr[30:28]})) : ~(io_dpath_pmp_3_cfg_a[0]) | _GEN_11 < ({io_dpath_pmp_2_addr, 2'h0} & pmpHomogeneous_pgMask_3) | _pmpHomogeneous_T >= _GEN_10 | _pmpHomogeneous_T >= _GEN_8 & _GEN_11 < ({io_dpath_pmp_3_addr, 2'h0} & pmpHomogeneous_pgMask_3)) & (io_dpath_pmp_4_cfg_a[1] ? (_GEN ? io_dpath_pmp_4_mask[11] : _leaf_T_5 ? io_dpath_pmp_4_mask[20] : io_dpath_pmp_4_mask[29]) | (_GEN ? (|{r_pte_ppn[43:21], r_pte_ppn[20:0] ^ io_dpath_pmp_4_addr[30:10]}) : _leaf_T_5 ? (|{r_pte_ppn[43:21], r_pte_ppn[20:9] ^ io_dpath_pmp_4_addr[30:19]}) : (|{r_pte_ppn[43:21], r_pte_ppn[20:18] ^ io_dpath_pmp_4_addr[30:28]})) : ~(io_dpath_pmp_4_cfg_a[0]) | _GEN_13 < ({io_dpath_pmp_3_addr, 2'h0} & pmpHomogeneous_pgMask_4) | _pmpHomogeneous_T >= _GEN_12 | _pmpHomogeneous_T >= _GEN_10 & _GEN_13 < ({io_dpath_pmp_4_addr, 2'h0} & pmpHomogeneous_pgMask_4))
    & (io_dpath_pmp_5_cfg_a[1] ? (_GEN ? io_dpath_pmp_5_mask[11] : _leaf_T_5 ? io_dpath_pmp_5_mask[20] : io_dpath_pmp_5_mask[29]) | (_GEN ? (|{r_pte_ppn[43:21], r_pte_ppn[20:0] ^ io_dpath_pmp_5_addr[30:10]}) : _leaf_T_5 ? (|{r_pte_ppn[43:21], r_pte_ppn[20:9] ^ io_dpath_pmp_5_addr[30:19]}) : (|{r_pte_ppn[43:21], r_pte_ppn[20:18] ^ io_dpath_pmp_5_addr[30:28]})) : ~(io_dpath_pmp_5_cfg_a[0]) | _GEN_15 < ({io_dpath_pmp_4_addr, 2'h0} & pmpHomogeneous_pgMask_5) | _pmpHomogeneous_T >= _GEN_14 | _pmpHomogeneous_T >= _GEN_12 & _GEN_15 < ({io_dpath_pmp_5_addr, 2'h0} & pmpHomogeneous_pgMask_5)) & (io_dpath_pmp_6_cfg_a[1] ? (_GEN ? io_dpath_pmp_6_mask[11] : _leaf_T_5 ? io_dpath_pmp_6_mask[20] : io_dpath_pmp_6_mask[29]) | (_GEN ? (|{r_pte_ppn[43:21], r_pte_ppn[20:0] ^ io_dpath_pmp_6_addr[30:10]}) : _leaf_T_5 ? (|{r_pte_ppn[43:21], r_pte_ppn[20:9] ^ io_dpath_pmp_6_addr[30:19]}) : (|{r_pte_ppn[43:21], r_pte_ppn[20:18] ^ io_dpath_pmp_6_addr[30:28]})) : ~(io_dpath_pmp_6_cfg_a[0]) | _GEN_17 < ({io_dpath_pmp_5_addr, 2'h0} & pmpHomogeneous_pgMask_6) | _pmpHomogeneous_T >= _GEN_16 | _pmpHomogeneous_T >= _GEN_14 & _GEN_17 < ({io_dpath_pmp_6_addr, 2'h0} & pmpHomogeneous_pgMask_6)) & (io_dpath_pmp_7_cfg_a[1] ? (_GEN ? io_dpath_pmp_7_mask[11] : _leaf_T_5 ? io_dpath_pmp_7_mask[20] : io_dpath_pmp_7_mask[29]) | (_GEN ? (|{r_pte_ppn[43:21], r_pte_ppn[20:0] ^ io_dpath_pmp_7_addr[30:10]}) : _leaf_T_5 ? (|{r_pte_ppn[43:21], r_pte_ppn[20:9] ^ io_dpath_pmp_7_addr[30:19]}) : (|{r_pte_ppn[43:21], r_pte_ppn[20:18] ^ io_dpath_pmp_7_addr[30:28]})) : ~(io_dpath_pmp_7_cfg_a[0]) | _GEN_18 < ({io_dpath_pmp_6_addr, 2'h0} & pmpHomogeneous_pgMask_7) | _pmpHomogeneous_T >= {23'h0, io_dpath_pmp_7_addr, 2'h0} | _pmpHomogeneous_T >= _GEN_16 & _GEN_18 < ({io_dpath_pmp_7_addr, 2'h0} & pmpHomogeneous_pgMask_7));
  wire         _GEN_19 = ~(|state) & _r_pte_T_23;
  wire         _GEN_20 = state == 3'h1;
  wire         _GEN_21 = state == 3'h2;
  wire         _GEN_22 = state == 3'h4;
  wire         _r_pte_T_1 = l2_hit & ~l2_error;
  wire         _r_pte_T_5 = _r_pte_T_2 & pte_cache_hit;
  wire         _GEN_23 = _r_pte_T_1 | _r_pte_T_5;
  wire         _GEN_24 = l2_hit & ~l2_error;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & l2_hit & (~(~(|state) | _GEN_20 | _GEN_21) & _GEN_22 & ~(count[1]) | pte_hit & _r_pte_T_2 & ~l2_hit)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: PTE Cache Hit/Miss Performance Monitor Events are lower priority than L2TLB Hit event\n    at PTW.scala:407 assert(!(io.dpath.perf.l2hit && (io.dpath.perf.pte_miss || io.dpath.perf.pte_hit)),\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (l2_hit & ~reset & ~(s2_hit_vec_0 | l2_error)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: L2 TLB multi-hit\n    at PTW.scala:498 assert((PopCount(s2_hit_vec) === 1.U) || s2_error, \"L2 TLB multi-hit\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_19 & ~reset & _arb_io_out_bits_bits_need_gpa) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at PTW.scala:622 assert(!arb.io.out.bits.bits.need_gpa || arb.io.out.bits.bits.stage2)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_24 & ~reset & ~(_r_pte_T_2 | _GEN_21)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at PTW.scala:693 assert(state === s_req || state === s_wait1)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (mem_resp_valid & ~reset & state != 3'h5) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at PTW.scala:699 assert(state === s_wait3)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_mem_s2_nack & ~reset & ~_GEN_22) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at PTW.scala:743 assert(state === s_wait2)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [3:0]   hi = {_hits_T_7, _hits_T_6, _hits_T_5, _hits_T_4} & valid[7:4];
  wire [2:0]   _GEN_25 = hi[3:1] | {_hits_T_3, _hits_T_2, _hits_T_1} & valid[3:1];
  wire         _state_reg_T_29 = _GEN_25[2] | _GEN_25[0];
  wire         _GEN_26 = mem_resp_valid & traverse & ~(count[1]) & ~(|hits) & ~invalidated;
  wire [6:0]   _r_T_11 = ~(valid[6:0]);
  wire [2:0]   r = (&valid) ? {state_reg[6], state_reg[6] ? {state_reg[5], state_reg[5] ? state_reg[4] : state_reg[3]} : {state_reg[2], state_reg[2] ? state_reg[1] : state_reg[0]}} : _r_T_11[0] ? 3'h0 : _r_T_11[1] ? 3'h1 : _r_T_11[2] ? 3'h2 : _r_T_11[3] ? 3'h3 : _r_T_11[4] ? 3'h4 : _r_T_11[5] ? 3'h5 : {2'h3, ~(_r_T_11[6])};
  wire [511:0] _GEN_27 = {503'h0, writeAddr};
  wire [511:0] mask = 512'h1 << _GEN_27;
  wire         _GEN_28 = _GEN_20 | _GEN_21;
  wire         _GEN_29 = r_req_dest == 2'h0;
  wire         _GEN_30 = r_req_dest == 2'h1;
  wire         _GEN_31 = ~(|state) | _GEN_28;
  wire         _GEN_32 = ~_GEN_31 & (_GEN_22 ? io_mem_s2_xcpt_ae_ld & _GEN_29 : (&state) & _GEN_29);
  wire         _GEN_33 = ~_GEN_31 & (_GEN_22 ? io_mem_s2_xcpt_ae_ld & _GEN_30 : (&state) & _GEN_30);
  wire         _GEN_34 = _GEN_24 & _GEN_29;
  wire         _GEN_35 = _GEN_24 & _GEN_30;
  wire         gf = stage2 & ~(pte_v & (mem_resp_data[1] | mem_resp_data[3] & ~(mem_resp_data[2])) & mem_resp_data[6] & mem_resp_data[1] & mem_resp_data[4]);
  wire         ae = pte_v & (|(mem_resp_data[53:31]));
  wire         pf = pte_v & (|(mem_resp_data[63:54]));
  wire         _GEN_36 = ~mem_resp_valid | traverse;
  wire [511:0] _r_valid_vec_T = valid_2_0 >> _GEN_27;
  wire [511:0] _s2_g_vec_T = g_0 >> _GEN_27;
  always @(posedge clock) begin
    if (reset) begin
      state <= 3'h0;
      state_reg <= 7'h0;
      valid <= 8'h0;
      valid_2_0 <= 512'h0;
    end
    else begin
      state <= _state_barrier_io_y;
      if (pte_cache_hit & _r_pte_T_2)
        state_reg <= {~(|hi), (|hi) ? {~(|(_GEN_25[2:1])), (|(_GEN_25[2:1])) ? ~_state_reg_T_29 : state_reg[4], (|(_GEN_25[2:1])) ? state_reg[3] : ~_state_reg_T_29} : state_reg[5:3], (|hi) ? state_reg[2:0] : {~(|(_GEN_25[2:1])), (|(_GEN_25[2:1])) ? ~_state_reg_T_29 : state_reg[1], (|(_GEN_25[2:1])) ? state_reg[0] : ~_state_reg_T_29}};
      else if (_GEN_26)
        state_reg <= {~(r[2]), r[2] ? {~(r[1]), r[1] ? ~(r[0]) : state_reg[4], r[1] ? state_reg[3] : ~(r[0])} : state_reg[5:3], r[2] ? state_reg[2:0] : {~(r[1]), r[1] ? ~(r[0]) : state_reg[1], r[1] ? state_reg[0] : ~(r[0])}};
      if (io_dpath_sfence_valid & ~io_dpath_sfence_bits_rs1)
        valid <= 8'h0;
      else
        valid <= {8{_GEN_26}} & 8'h1 << r | valid;
      if (s2_valid & l2_error)
        valid_2_0 <= 512'h0;
      else if (io_dpath_sfence_valid) begin
        if (io_dpath_sfence_bits_rs1)
          valid_2_0 <= valid_2_0 & ~(512'h1 << io_dpath_sfence_bits_addr[20:12]);
        else if (io_dpath_sfence_bits_rs2)
          valid_2_0 <= valid_2_0 & g_0;
        else
          valid_2_0 <= 512'h0;
      end
      else
        valid_2_0 <= {512{writeEnable}} & mask | valid_2_0;
    end
    resp_valid_0 <= _GEN_36 ? _GEN_34 | _GEN_32 : _GEN_29 | _GEN_34 | _GEN_32;
    resp_valid_1 <= _GEN_36 ? _GEN_35 | _GEN_33 : _GEN_30 | _GEN_35 | _GEN_33;
    invalidated <= io_dpath_sfence_valid | invalidated & (|state);
    if (mem_resp_valid) begin
      if (traverse)
        count <= count + 2'h1;
    end
    else if (_GEN_24)
      count <= 2'h2;
    else if (|state) begin
      if (_GEN_20) begin
        if (pte_cache_hit)
          count <= count + 2'h1;
      end
      else if (_GEN_21 | _GEN_22 | ~((&state) & ~homogeneous)) begin
      end
      else
        count <= 2'h2;
    end
    else if (_r_pte_T_23)
      count <= 2'h0;
    if (_GEN_36) begin
      if (|state)
        resp_ae_ptw <= ~_GEN_28 & _GEN_22 & io_mem_s2_xcpt_ae_ld | resp_ae_ptw;
      else
        resp_ae_ptw <= ~_r_pte_T_23 & resp_ae_ptw;
      resp_ae_final <= ~_GEN_19 & resp_ae_final;
      resp_pf <= ~_GEN_19 & resp_pf;
      resp_gf <= ~_GEN_19 & resp_gf;
      resp_hr <= _GEN_19 | resp_hr;
      resp_hw <= _GEN_19 | resp_hw;
      resp_hx <= _GEN_19 | resp_hx;
    end
    else begin
      resp_ae_ptw <= ae & ~(count[1]) & pte_v & ~(mem_resp_data[1]) & ~(mem_resp_data[2]) & ~(mem_resp_data[3]) & ~(mem_resp_data[7]) & ~(mem_resp_data[6]) & ~(mem_resp_data[4]) & _resp_ae_ptw_T_14;
      resp_ae_final <= ae;
      resp_pf <= pf & ~stage2;
      resp_gf <= gf | pf & stage2;
      resp_hr <= ~stage2 | ~pf & ~gf & pte_v & (mem_resp_data[1] | mem_resp_data[3] & ~(mem_resp_data[2])) & mem_resp_data[6] & mem_resp_data[1] & mem_resp_data[4];
      resp_hw <= ~stage2 | ~pf & ~gf & pte_v & (mem_resp_data[1] | mem_resp_data[3] & ~(mem_resp_data[2])) & mem_resp_data[6] & mem_resp_data[2] & mem_resp_data[7] & mem_resp_data[4];
      resp_hx <= ~stage2 | ~pf & ~gf & pte_v & (mem_resp_data[1] | mem_resp_data[3] & ~(mem_resp_data[2])) & mem_resp_data[6] & mem_resp_data[3] & mem_resp_data[4];
    end
    if (_GEN_19) begin
      r_req_addr <= _arb_io_out_bits_bits_addr;
      r_req_need_gpa <= _arb_io_out_bits_bits_need_gpa;
      r_req_dest <= _arb_io_chosen;
    end
    r_pte_ppn <= _r_pte_barrier_io_y_ppn;
    r_pte_d <= _r_pte_barrier_io_y_d;
    r_pte_a <= _r_pte_barrier_io_y_a;
    r_pte_g <= _r_pte_barrier_io_y_g;
    r_pte_u <= _r_pte_barrier_io_y_u;
    r_pte_x <= _r_pte_barrier_io_y_x;
    r_pte_w <= _r_pte_barrier_io_y_w;
    r_pte_r <= _r_pte_barrier_io_y_r;
    r_pte_v <= _r_pte_barrier_io_y_v;
    stage2 <= ~_GEN_19 & stage2;
    mem_resp_valid <= io_mem_resp_valid;
    mem_resp_data <= io_mem_resp_bits_data;
    if (_GEN_26 & r == 3'h0) begin
      tags_0 <= _GEN_0;
      data_0 <= mem_resp_data[30:10];
    end
    if (_GEN_26 & r == 3'h1) begin
      tags_1 <= _GEN_0;
      data_1 <= mem_resp_data[30:10];
    end
    if (_GEN_26 & r == 3'h2) begin
      tags_2 <= _GEN_0;
      data_2 <= mem_resp_data[30:10];
    end
    if (_GEN_26 & r == 3'h3) begin
      tags_3 <= _GEN_0;
      data_3 <= mem_resp_data[30:10];
    end
    if (_GEN_26 & r == 3'h4) begin
      tags_4 <= _GEN_0;
      data_4 <= mem_resp_data[30:10];
    end
    if (_GEN_26 & r == 3'h5) begin
      tags_5 <= _GEN_0;
      data_5 <= mem_resp_data[30:10];
    end
    if (_GEN_26 & r == 3'h6) begin
      tags_6 <= _GEN_0;
      data_6 <= mem_resp_data[30:10];
    end
    if (_GEN_26 & (&r)) begin
      tags_7 <= _GEN_0;
      data_7 <= mem_resp_data[30:10];
    end
    pte_hit <= (|state) & _GEN_20 & pte_cache_hit;
    l2_refill <= mem_resp_valid & ~traverse & pte_v & ~ae & ~pf & ~gf & _leaf_T_8 & ~r_req_need_gpa;
    if (writeEnable) begin
      if (r_pte_g)
        g_0 <= g_0 | mask;
      else
        g_0 <= g_0 & ~mask;
    end
    s1_valid <= readEnable & ~_arb_io_out_bits_bits_need_gpa & _arb_io_out_bits_valid;
    s2_valid <= s1_valid;
    if (s1_valid) begin
      r_2 <= _l2_tlb_ram_0_ext_RW0_rdata;
      s2_valid_vec <= _r_valid_vec_T[0];
      s2_g_vec_0 <= _s2_g_vec_T[0];
    end
  end // always @(posedge)
  Arbiter_20 arb (
    .io_in_0_ready              (io_requestor_0_req_ready),
    .io_in_0_valid              (io_requestor_0_req_valid),
    .io_in_0_bits_valid         (io_requestor_0_req_bits_valid),
    .io_in_0_bits_bits_addr     (io_requestor_0_req_bits_bits_addr),
    .io_in_1_ready              (io_requestor_1_req_ready),
    .io_in_1_valid              (io_requestor_1_req_valid),
    .io_in_1_bits_bits_addr     (io_requestor_1_req_bits_bits_addr),
    .io_in_1_bits_bits_need_gpa (io_requestor_1_req_bits_bits_need_gpa),
    .io_out_ready               (_arb_io_out_ready_T_2),
    .io_out_valid               (_arb_io_out_valid),
    .io_out_bits_valid          (_arb_io_out_bits_valid),
    .io_out_bits_bits_addr      (_arb_io_out_bits_bits_addr),
    .io_out_bits_bits_need_gpa  (_arb_io_out_bits_bits_need_gpa),
    .io_chosen                  (_arb_io_chosen)
  );
  l2_tlb_ram_0_512x46 l2_tlb_ram_0_ext (
    .RW0_addr  (writeEnable ? writeAddr : _s1_rdata_T_2),
    .RW0_en    (readEnable | writeEnable),
    .RW0_clk   (clock),
    .RW0_wmode (l2_refill),
    .RW0_wdata ({^{r_req_addr[26:9], r_pte_ppn[20:0], r_pte_d, r_pte_a, r_pte_u, r_pte_x, r_pte_w, r_pte_r}, r_req_addr[26:9], r_pte_ppn[20:0], r_pte_d, r_pte_a, r_pte_u, r_pte_x, r_pte_w, r_pte_r}),
    .RW0_rdata (_l2_tlb_ram_0_ext_RW0_rdata)
  );
  OptimizationBarrier_92 state_barrier (
    .io_x (io_mem_s2_nack ? 3'h1 : mem_resp_valid ? {2'h0, traverse} : _GEN_24 ? 3'h0 : (|state) ? (_GEN_20 ? (pte_cache_hit ? state : io_mem_req_ready ? 3'h2 : 3'h1) : _GEN_21 ? (l2_hit ? 3'h1 : 3'h4) : _GEN_22 ? (io_mem_s2_xcpt_ae_ld ? 3'h0 : 3'h5) : (&state) ? 3'h0 : state) : _r_pte_T_23 ? {2'h0, _arb_io_out_bits_valid} : state),
    .io_y (_state_barrier_io_y)
  );
  OptimizationBarrier_93 r_pte_barrier (
    .io_x_ppn (_r_pte_T_1 ? {23'h0, r_2[26:6]} : _r_pte_T_5 ? {23'h0, (_hits_T & valid[0] ? data_0 : 21'h0) | (_hits_T_1 & valid[1] ? data_1 : 21'h0) | (_hits_T_2 & valid[2] ? data_2 : 21'h0) | (_hits_T_3 & valid[3] ? data_3 : 21'h0) | (_hits_T_4 & valid[4] ? data_4 : 21'h0) | (_hits_T_5 & valid[5] ? data_5 : 21'h0) | (_hits_T_6 & valid[6] ? data_6 : 21'h0) | (_hits_T_7 & valid[7] ? data_7 : 21'h0)} : mem_resp_valid ? {23'h0, mem_resp_data[30:10]} : (&state) & ~homogeneous & count != 2'h2 ? (count[0] ? {r_pte_ppn[43:9], r_req_addr[8:0]} : {r_pte_ppn[43:18], r_req_addr[17:0]}) : _r_pte_T_23 ? io_dpath_ptbr_ppn : r_pte_ppn),
    .io_x_d   (_GEN_23 ? r_2[5] : mem_resp_valid ? mem_resp_data[7] : r_pte_d),
    .io_x_a   (_GEN_23 ? r_2[4] : mem_resp_valid ? mem_resp_data[6] : r_pte_a),
    .io_x_g   (_GEN_23 ? s2_g_vec_0 : mem_resp_valid ? mem_resp_data[5] : r_pte_g),
    .io_x_u   (_GEN_23 ? r_2[3] : mem_resp_valid ? mem_resp_data[4] : r_pte_u),
    .io_x_x   (_GEN_23 ? r_2[2] : mem_resp_valid ? mem_resp_data[3] : r_pte_x),
    .io_x_w   (_GEN_23 ? r_2[1] : mem_resp_valid ? mem_resp_data[2] : r_pte_w),
    .io_x_r   (_GEN_23 ? r_2[0] : mem_resp_valid ? mem_resp_data[1] : r_pte_r),
    .io_x_v   (_r_pte_T_1 | _r_pte_T_5 | (mem_resp_valid ? pte_v : r_pte_v)),
    .io_y_ppn (_r_pte_barrier_io_y_ppn),
    .io_y_d   (_r_pte_barrier_io_y_d),
    .io_y_a   (_r_pte_barrier_io_y_a),
    .io_y_g   (_r_pte_barrier_io_y_g),
    .io_y_u   (_r_pte_barrier_io_y_u),
    .io_y_x   (_r_pte_barrier_io_y_x),
    .io_y_w   (_r_pte_barrier_io_y_w),
    .io_y_r   (_r_pte_barrier_io_y_r),
    .io_y_v   (_r_pte_barrier_io_y_v)
  );
  assign io_requestor_0_resp_valid = resp_valid_0;
  assign io_requestor_0_resp_bits_ae_final = resp_ae_final;
  assign io_requestor_0_resp_bits_pte_ppn = r_pte_ppn;
  assign io_requestor_0_resp_bits_pte_d = r_pte_d;
  assign io_requestor_0_resp_bits_pte_a = r_pte_a;
  assign io_requestor_0_resp_bits_pte_g = r_pte_g;
  assign io_requestor_0_resp_bits_pte_u = r_pte_u;
  assign io_requestor_0_resp_bits_pte_x = r_pte_x;
  assign io_requestor_0_resp_bits_pte_w = r_pte_w;
  assign io_requestor_0_resp_bits_pte_r = r_pte_r;
  assign io_requestor_0_resp_bits_pte_v = r_pte_v;
  assign io_requestor_0_resp_bits_level = count;
  assign io_requestor_0_resp_bits_homogeneous = homogeneous;
  assign io_requestor_0_ptbr_mode = io_dpath_ptbr_mode;
  assign io_requestor_0_status_dprv = io_dpath_status_dprv;
  assign io_requestor_0_status_mxr = io_dpath_status_mxr;
  assign io_requestor_0_status_sum = io_dpath_status_sum;
  assign io_requestor_0_pmp_0_cfg_l = io_dpath_pmp_0_cfg_l;
  assign io_requestor_0_pmp_0_cfg_a = io_dpath_pmp_0_cfg_a;
  assign io_requestor_0_pmp_0_cfg_x = io_dpath_pmp_0_cfg_x;
  assign io_requestor_0_pmp_0_cfg_w = io_dpath_pmp_0_cfg_w;
  assign io_requestor_0_pmp_0_cfg_r = io_dpath_pmp_0_cfg_r;
  assign io_requestor_0_pmp_0_addr = io_dpath_pmp_0_addr;
  assign io_requestor_0_pmp_0_mask = io_dpath_pmp_0_mask;
  assign io_requestor_0_pmp_1_cfg_l = io_dpath_pmp_1_cfg_l;
  assign io_requestor_0_pmp_1_cfg_a = io_dpath_pmp_1_cfg_a;
  assign io_requestor_0_pmp_1_cfg_x = io_dpath_pmp_1_cfg_x;
  assign io_requestor_0_pmp_1_cfg_w = io_dpath_pmp_1_cfg_w;
  assign io_requestor_0_pmp_1_cfg_r = io_dpath_pmp_1_cfg_r;
  assign io_requestor_0_pmp_1_addr = io_dpath_pmp_1_addr;
  assign io_requestor_0_pmp_1_mask = io_dpath_pmp_1_mask;
  assign io_requestor_0_pmp_2_cfg_l = io_dpath_pmp_2_cfg_l;
  assign io_requestor_0_pmp_2_cfg_a = io_dpath_pmp_2_cfg_a;
  assign io_requestor_0_pmp_2_cfg_x = io_dpath_pmp_2_cfg_x;
  assign io_requestor_0_pmp_2_cfg_w = io_dpath_pmp_2_cfg_w;
  assign io_requestor_0_pmp_2_cfg_r = io_dpath_pmp_2_cfg_r;
  assign io_requestor_0_pmp_2_addr = io_dpath_pmp_2_addr;
  assign io_requestor_0_pmp_2_mask = io_dpath_pmp_2_mask;
  assign io_requestor_0_pmp_3_cfg_l = io_dpath_pmp_3_cfg_l;
  assign io_requestor_0_pmp_3_cfg_a = io_dpath_pmp_3_cfg_a;
  assign io_requestor_0_pmp_3_cfg_x = io_dpath_pmp_3_cfg_x;
  assign io_requestor_0_pmp_3_cfg_w = io_dpath_pmp_3_cfg_w;
  assign io_requestor_0_pmp_3_cfg_r = io_dpath_pmp_3_cfg_r;
  assign io_requestor_0_pmp_3_addr = io_dpath_pmp_3_addr;
  assign io_requestor_0_pmp_3_mask = io_dpath_pmp_3_mask;
  assign io_requestor_0_pmp_4_cfg_l = io_dpath_pmp_4_cfg_l;
  assign io_requestor_0_pmp_4_cfg_a = io_dpath_pmp_4_cfg_a;
  assign io_requestor_0_pmp_4_cfg_x = io_dpath_pmp_4_cfg_x;
  assign io_requestor_0_pmp_4_cfg_w = io_dpath_pmp_4_cfg_w;
  assign io_requestor_0_pmp_4_cfg_r = io_dpath_pmp_4_cfg_r;
  assign io_requestor_0_pmp_4_addr = io_dpath_pmp_4_addr;
  assign io_requestor_0_pmp_4_mask = io_dpath_pmp_4_mask;
  assign io_requestor_0_pmp_5_cfg_l = io_dpath_pmp_5_cfg_l;
  assign io_requestor_0_pmp_5_cfg_a = io_dpath_pmp_5_cfg_a;
  assign io_requestor_0_pmp_5_cfg_x = io_dpath_pmp_5_cfg_x;
  assign io_requestor_0_pmp_5_cfg_w = io_dpath_pmp_5_cfg_w;
  assign io_requestor_0_pmp_5_cfg_r = io_dpath_pmp_5_cfg_r;
  assign io_requestor_0_pmp_5_addr = io_dpath_pmp_5_addr;
  assign io_requestor_0_pmp_5_mask = io_dpath_pmp_5_mask;
  assign io_requestor_0_pmp_6_cfg_l = io_dpath_pmp_6_cfg_l;
  assign io_requestor_0_pmp_6_cfg_a = io_dpath_pmp_6_cfg_a;
  assign io_requestor_0_pmp_6_cfg_x = io_dpath_pmp_6_cfg_x;
  assign io_requestor_0_pmp_6_cfg_w = io_dpath_pmp_6_cfg_w;
  assign io_requestor_0_pmp_6_cfg_r = io_dpath_pmp_6_cfg_r;
  assign io_requestor_0_pmp_6_addr = io_dpath_pmp_6_addr;
  assign io_requestor_0_pmp_6_mask = io_dpath_pmp_6_mask;
  assign io_requestor_0_pmp_7_cfg_l = io_dpath_pmp_7_cfg_l;
  assign io_requestor_0_pmp_7_cfg_a = io_dpath_pmp_7_cfg_a;
  assign io_requestor_0_pmp_7_cfg_x = io_dpath_pmp_7_cfg_x;
  assign io_requestor_0_pmp_7_cfg_w = io_dpath_pmp_7_cfg_w;
  assign io_requestor_0_pmp_7_cfg_r = io_dpath_pmp_7_cfg_r;
  assign io_requestor_0_pmp_7_addr = io_dpath_pmp_7_addr;
  assign io_requestor_0_pmp_7_mask = io_dpath_pmp_7_mask;
  assign io_requestor_1_resp_valid = resp_valid_1;
  assign io_requestor_1_resp_bits_ae_ptw = resp_ae_ptw;
  assign io_requestor_1_resp_bits_ae_final = resp_ae_final;
  assign io_requestor_1_resp_bits_pf = resp_pf;
  assign io_requestor_1_resp_bits_gf = resp_gf;
  assign io_requestor_1_resp_bits_hr = resp_hr;
  assign io_requestor_1_resp_bits_hw = resp_hw;
  assign io_requestor_1_resp_bits_hx = resp_hx;
  assign io_requestor_1_resp_bits_pte_ppn = r_pte_ppn;
  assign io_requestor_1_resp_bits_pte_d = r_pte_d;
  assign io_requestor_1_resp_bits_pte_a = r_pte_a;
  assign io_requestor_1_resp_bits_pte_g = r_pte_g;
  assign io_requestor_1_resp_bits_pte_u = r_pte_u;
  assign io_requestor_1_resp_bits_pte_x = r_pte_x;
  assign io_requestor_1_resp_bits_pte_w = r_pte_w;
  assign io_requestor_1_resp_bits_pte_r = r_pte_r;
  assign io_requestor_1_resp_bits_pte_v = r_pte_v;
  assign io_requestor_1_resp_bits_level = count;
  assign io_requestor_1_resp_bits_homogeneous = homogeneous;
  assign io_requestor_1_ptbr_mode = io_dpath_ptbr_mode;
  assign io_requestor_1_status_debug = io_dpath_status_debug;
  assign io_requestor_1_status_prv = io_dpath_status_prv;
  assign io_requestor_1_pmp_0_cfg_l = io_dpath_pmp_0_cfg_l;
  assign io_requestor_1_pmp_0_cfg_a = io_dpath_pmp_0_cfg_a;
  assign io_requestor_1_pmp_0_cfg_x = io_dpath_pmp_0_cfg_x;
  assign io_requestor_1_pmp_0_cfg_w = io_dpath_pmp_0_cfg_w;
  assign io_requestor_1_pmp_0_cfg_r = io_dpath_pmp_0_cfg_r;
  assign io_requestor_1_pmp_0_addr = io_dpath_pmp_0_addr;
  assign io_requestor_1_pmp_0_mask = io_dpath_pmp_0_mask;
  assign io_requestor_1_pmp_1_cfg_l = io_dpath_pmp_1_cfg_l;
  assign io_requestor_1_pmp_1_cfg_a = io_dpath_pmp_1_cfg_a;
  assign io_requestor_1_pmp_1_cfg_x = io_dpath_pmp_1_cfg_x;
  assign io_requestor_1_pmp_1_cfg_w = io_dpath_pmp_1_cfg_w;
  assign io_requestor_1_pmp_1_cfg_r = io_dpath_pmp_1_cfg_r;
  assign io_requestor_1_pmp_1_addr = io_dpath_pmp_1_addr;
  assign io_requestor_1_pmp_1_mask = io_dpath_pmp_1_mask;
  assign io_requestor_1_pmp_2_cfg_l = io_dpath_pmp_2_cfg_l;
  assign io_requestor_1_pmp_2_cfg_a = io_dpath_pmp_2_cfg_a;
  assign io_requestor_1_pmp_2_cfg_x = io_dpath_pmp_2_cfg_x;
  assign io_requestor_1_pmp_2_cfg_w = io_dpath_pmp_2_cfg_w;
  assign io_requestor_1_pmp_2_cfg_r = io_dpath_pmp_2_cfg_r;
  assign io_requestor_1_pmp_2_addr = io_dpath_pmp_2_addr;
  assign io_requestor_1_pmp_2_mask = io_dpath_pmp_2_mask;
  assign io_requestor_1_pmp_3_cfg_l = io_dpath_pmp_3_cfg_l;
  assign io_requestor_1_pmp_3_cfg_a = io_dpath_pmp_3_cfg_a;
  assign io_requestor_1_pmp_3_cfg_x = io_dpath_pmp_3_cfg_x;
  assign io_requestor_1_pmp_3_cfg_w = io_dpath_pmp_3_cfg_w;
  assign io_requestor_1_pmp_3_cfg_r = io_dpath_pmp_3_cfg_r;
  assign io_requestor_1_pmp_3_addr = io_dpath_pmp_3_addr;
  assign io_requestor_1_pmp_3_mask = io_dpath_pmp_3_mask;
  assign io_requestor_1_pmp_4_cfg_l = io_dpath_pmp_4_cfg_l;
  assign io_requestor_1_pmp_4_cfg_a = io_dpath_pmp_4_cfg_a;
  assign io_requestor_1_pmp_4_cfg_x = io_dpath_pmp_4_cfg_x;
  assign io_requestor_1_pmp_4_cfg_w = io_dpath_pmp_4_cfg_w;
  assign io_requestor_1_pmp_4_cfg_r = io_dpath_pmp_4_cfg_r;
  assign io_requestor_1_pmp_4_addr = io_dpath_pmp_4_addr;
  assign io_requestor_1_pmp_4_mask = io_dpath_pmp_4_mask;
  assign io_requestor_1_pmp_5_cfg_l = io_dpath_pmp_5_cfg_l;
  assign io_requestor_1_pmp_5_cfg_a = io_dpath_pmp_5_cfg_a;
  assign io_requestor_1_pmp_5_cfg_x = io_dpath_pmp_5_cfg_x;
  assign io_requestor_1_pmp_5_cfg_w = io_dpath_pmp_5_cfg_w;
  assign io_requestor_1_pmp_5_cfg_r = io_dpath_pmp_5_cfg_r;
  assign io_requestor_1_pmp_5_addr = io_dpath_pmp_5_addr;
  assign io_requestor_1_pmp_5_mask = io_dpath_pmp_5_mask;
  assign io_requestor_1_pmp_6_cfg_l = io_dpath_pmp_6_cfg_l;
  assign io_requestor_1_pmp_6_cfg_a = io_dpath_pmp_6_cfg_a;
  assign io_requestor_1_pmp_6_cfg_x = io_dpath_pmp_6_cfg_x;
  assign io_requestor_1_pmp_6_cfg_w = io_dpath_pmp_6_cfg_w;
  assign io_requestor_1_pmp_6_cfg_r = io_dpath_pmp_6_cfg_r;
  assign io_requestor_1_pmp_6_addr = io_dpath_pmp_6_addr;
  assign io_requestor_1_pmp_6_mask = io_dpath_pmp_6_mask;
  assign io_requestor_1_pmp_7_cfg_l = io_dpath_pmp_7_cfg_l;
  assign io_requestor_1_pmp_7_cfg_a = io_dpath_pmp_7_cfg_a;
  assign io_requestor_1_pmp_7_cfg_x = io_dpath_pmp_7_cfg_x;
  assign io_requestor_1_pmp_7_cfg_w = io_dpath_pmp_7_cfg_w;
  assign io_requestor_1_pmp_7_cfg_r = io_dpath_pmp_7_cfg_r;
  assign io_requestor_1_pmp_7_addr = io_dpath_pmp_7_addr;
  assign io_requestor_1_pmp_7_mask = io_dpath_pmp_7_mask;
  assign io_mem_req_valid = _r_pte_T_2 | state == 3'h3;
  assign io_mem_req_bits_addr = {7'h0, r_pte_ppn[20:0], pte_addr_vpn_idx, 3'h0};
  assign io_mem_s1_kill = l2_hit | state != 3'h2;
endmodule

