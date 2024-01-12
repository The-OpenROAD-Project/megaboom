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

module TLB(
  input         clock,
                reset,
                io_req_valid,
  input  [39:0] io_req_bits_vaddr,
  input  [1:0]  io_req_bits_prv,
  output        io_resp_miss,
  output [32:0] io_resp_paddr,
  output        io_resp_pf_inst,
                io_resp_ae_inst,
  input         io_sfence_valid,
                io_sfence_bits_rs1,
                io_sfence_bits_rs2,
  input  [38:0] io_sfence_bits_addr,
  input         io_ptw_req_ready,
  output        io_ptw_req_valid,
  output [26:0] io_ptw_req_bits_bits_addr,
  output        io_ptw_req_bits_bits_need_gpa,
  input         io_ptw_resp_valid,
                io_ptw_resp_bits_ae_ptw,
                io_ptw_resp_bits_ae_final,
                io_ptw_resp_bits_pf,
                io_ptw_resp_bits_gf,
                io_ptw_resp_bits_hr,
                io_ptw_resp_bits_hw,
                io_ptw_resp_bits_hx,
  input  [43:0] io_ptw_resp_bits_pte_ppn,
  input         io_ptw_resp_bits_pte_d,
                io_ptw_resp_bits_pte_a,
                io_ptw_resp_bits_pte_g,
                io_ptw_resp_bits_pte_u,
                io_ptw_resp_bits_pte_x,
                io_ptw_resp_bits_pte_w,
                io_ptw_resp_bits_pte_r,
                io_ptw_resp_bits_pte_v,
  input  [1:0]  io_ptw_resp_bits_level,
  input         io_ptw_resp_bits_homogeneous,
  input  [3:0]  io_ptw_ptbr_mode,
  input         io_ptw_status_debug,
                io_ptw_pmp_0_cfg_l,
  input  [1:0]  io_ptw_pmp_0_cfg_a,
  input         io_ptw_pmp_0_cfg_x,
                io_ptw_pmp_0_cfg_w,
                io_ptw_pmp_0_cfg_r,
  input  [30:0] io_ptw_pmp_0_addr,
  input  [32:0] io_ptw_pmp_0_mask,
  input         io_ptw_pmp_1_cfg_l,
  input  [1:0]  io_ptw_pmp_1_cfg_a,
  input         io_ptw_pmp_1_cfg_x,
                io_ptw_pmp_1_cfg_w,
                io_ptw_pmp_1_cfg_r,
  input  [30:0] io_ptw_pmp_1_addr,
  input  [32:0] io_ptw_pmp_1_mask,
  input         io_ptw_pmp_2_cfg_l,
  input  [1:0]  io_ptw_pmp_2_cfg_a,
  input         io_ptw_pmp_2_cfg_x,
                io_ptw_pmp_2_cfg_w,
                io_ptw_pmp_2_cfg_r,
  input  [30:0] io_ptw_pmp_2_addr,
  input  [32:0] io_ptw_pmp_2_mask,
  input         io_ptw_pmp_3_cfg_l,
  input  [1:0]  io_ptw_pmp_3_cfg_a,
  input         io_ptw_pmp_3_cfg_x,
                io_ptw_pmp_3_cfg_w,
                io_ptw_pmp_3_cfg_r,
  input  [30:0] io_ptw_pmp_3_addr,
  input  [32:0] io_ptw_pmp_3_mask,
  input         io_ptw_pmp_4_cfg_l,
  input  [1:0]  io_ptw_pmp_4_cfg_a,
  input         io_ptw_pmp_4_cfg_x,
                io_ptw_pmp_4_cfg_w,
                io_ptw_pmp_4_cfg_r,
  input  [30:0] io_ptw_pmp_4_addr,
  input  [32:0] io_ptw_pmp_4_mask,
  input         io_ptw_pmp_5_cfg_l,
  input  [1:0]  io_ptw_pmp_5_cfg_a,
  input         io_ptw_pmp_5_cfg_x,
                io_ptw_pmp_5_cfg_w,
                io_ptw_pmp_5_cfg_r,
  input  [30:0] io_ptw_pmp_5_addr,
  input  [32:0] io_ptw_pmp_5_mask,
  input         io_ptw_pmp_6_cfg_l,
  input  [1:0]  io_ptw_pmp_6_cfg_a,
  input         io_ptw_pmp_6_cfg_x,
                io_ptw_pmp_6_cfg_w,
                io_ptw_pmp_6_cfg_r,
  input  [30:0] io_ptw_pmp_6_addr,
  input  [32:0] io_ptw_pmp_6_mask,
  input         io_ptw_pmp_7_cfg_l,
  input  [1:0]  io_ptw_pmp_7_cfg_a,
  input         io_ptw_pmp_7_cfg_x,
                io_ptw_pmp_7_cfg_w,
                io_ptw_pmp_7_cfg_r,
  input  [30:0] io_ptw_pmp_7_addr,
  input  [32:0] io_ptw_pmp_7_mask
);

  wire [20:0] _entries_barrier_12_io_y_ppn;
  wire        _entries_barrier_12_io_y_u;
  wire        _entries_barrier_12_io_y_ae_ptw;
  wire        _entries_barrier_12_io_y_ae_final;
  wire        _entries_barrier_12_io_y_pf;
  wire        _entries_barrier_12_io_y_gf;
  wire        _entries_barrier_12_io_y_sx;
  wire [20:0] _entries_barrier_11_io_y_ppn;
  wire        _entries_barrier_11_io_y_u;
  wire        _entries_barrier_11_io_y_ae_ptw;
  wire        _entries_barrier_11_io_y_ae_final;
  wire        _entries_barrier_11_io_y_pf;
  wire        _entries_barrier_11_io_y_gf;
  wire        _entries_barrier_11_io_y_sx;
  wire        _entries_barrier_11_io_y_px;
  wire [20:0] _entries_barrier_10_io_y_ppn;
  wire        _entries_barrier_10_io_y_u;
  wire        _entries_barrier_10_io_y_ae_ptw;
  wire        _entries_barrier_10_io_y_ae_final;
  wire        _entries_barrier_10_io_y_pf;
  wire        _entries_barrier_10_io_y_gf;
  wire        _entries_barrier_10_io_y_sx;
  wire        _entries_barrier_10_io_y_px;
  wire [20:0] _entries_barrier_9_io_y_ppn;
  wire        _entries_barrier_9_io_y_u;
  wire        _entries_barrier_9_io_y_ae_ptw;
  wire        _entries_barrier_9_io_y_ae_final;
  wire        _entries_barrier_9_io_y_pf;
  wire        _entries_barrier_9_io_y_gf;
  wire        _entries_barrier_9_io_y_sx;
  wire        _entries_barrier_9_io_y_px;
  wire [20:0] _entries_barrier_8_io_y_ppn;
  wire        _entries_barrier_8_io_y_u;
  wire        _entries_barrier_8_io_y_ae_ptw;
  wire        _entries_barrier_8_io_y_ae_final;
  wire        _entries_barrier_8_io_y_pf;
  wire        _entries_barrier_8_io_y_gf;
  wire        _entries_barrier_8_io_y_sx;
  wire        _entries_barrier_8_io_y_px;
  wire [20:0] _entries_barrier_7_io_y_ppn;
  wire        _entries_barrier_7_io_y_u;
  wire        _entries_barrier_7_io_y_ae_ptw;
  wire        _entries_barrier_7_io_y_ae_final;
  wire        _entries_barrier_7_io_y_pf;
  wire        _entries_barrier_7_io_y_gf;
  wire        _entries_barrier_7_io_y_sx;
  wire        _entries_barrier_7_io_y_px;
  wire [20:0] _entries_barrier_6_io_y_ppn;
  wire        _entries_barrier_6_io_y_u;
  wire        _entries_barrier_6_io_y_ae_ptw;
  wire        _entries_barrier_6_io_y_ae_final;
  wire        _entries_barrier_6_io_y_pf;
  wire        _entries_barrier_6_io_y_gf;
  wire        _entries_barrier_6_io_y_sx;
  wire        _entries_barrier_6_io_y_px;
  wire [20:0] _entries_barrier_5_io_y_ppn;
  wire        _entries_barrier_5_io_y_u;
  wire        _entries_barrier_5_io_y_ae_ptw;
  wire        _entries_barrier_5_io_y_ae_final;
  wire        _entries_barrier_5_io_y_pf;
  wire        _entries_barrier_5_io_y_gf;
  wire        _entries_barrier_5_io_y_sx;
  wire        _entries_barrier_5_io_y_px;
  wire [20:0] _entries_barrier_4_io_y_ppn;
  wire        _entries_barrier_4_io_y_u;
  wire        _entries_barrier_4_io_y_ae_ptw;
  wire        _entries_barrier_4_io_y_ae_final;
  wire        _entries_barrier_4_io_y_pf;
  wire        _entries_barrier_4_io_y_gf;
  wire        _entries_barrier_4_io_y_sx;
  wire        _entries_barrier_4_io_y_px;
  wire [20:0] _entries_barrier_3_io_y_ppn;
  wire        _entries_barrier_3_io_y_u;
  wire        _entries_barrier_3_io_y_ae_ptw;
  wire        _entries_barrier_3_io_y_ae_final;
  wire        _entries_barrier_3_io_y_pf;
  wire        _entries_barrier_3_io_y_gf;
  wire        _entries_barrier_3_io_y_sx;
  wire        _entries_barrier_3_io_y_px;
  wire [20:0] _entries_barrier_2_io_y_ppn;
  wire        _entries_barrier_2_io_y_u;
  wire        _entries_barrier_2_io_y_ae_ptw;
  wire        _entries_barrier_2_io_y_ae_final;
  wire        _entries_barrier_2_io_y_pf;
  wire        _entries_barrier_2_io_y_gf;
  wire        _entries_barrier_2_io_y_sx;
  wire        _entries_barrier_2_io_y_px;
  wire [20:0] _entries_barrier_1_io_y_ppn;
  wire        _entries_barrier_1_io_y_u;
  wire        _entries_barrier_1_io_y_ae_ptw;
  wire        _entries_barrier_1_io_y_ae_final;
  wire        _entries_barrier_1_io_y_pf;
  wire        _entries_barrier_1_io_y_gf;
  wire        _entries_barrier_1_io_y_sx;
  wire        _entries_barrier_1_io_y_px;
  wire [20:0] _entries_barrier_io_y_ppn;
  wire        _entries_barrier_io_y_u;
  wire        _entries_barrier_io_y_ae_ptw;
  wire        _entries_barrier_io_y_ae_final;
  wire        _entries_barrier_io_y_pf;
  wire        _entries_barrier_io_y_gf;
  wire        _entries_barrier_io_y_sx;
  wire        _entries_barrier_io_y_px;
  wire        _pmp_io_r;
  wire        _pmp_io_w;
  wire        _pmp_io_x;
  wire [20:0] _mpu_ppn_barrier_io_y_ppn;
  reg  [26:0] sectored_entries_0_0_tag_vpn;
  reg         sectored_entries_0_0_tag_v;
  reg  [42:0] sectored_entries_0_0_data_0;
  reg  [42:0] sectored_entries_0_0_data_1;
  reg  [42:0] sectored_entries_0_0_data_2;
  reg  [42:0] sectored_entries_0_0_data_3;
  reg         sectored_entries_0_0_valid_0;
  reg         sectored_entries_0_0_valid_1;
  reg         sectored_entries_0_0_valid_2;
  reg         sectored_entries_0_0_valid_3;
  reg  [26:0] sectored_entries_0_1_tag_vpn;
  reg         sectored_entries_0_1_tag_v;
  reg  [42:0] sectored_entries_0_1_data_0;
  reg  [42:0] sectored_entries_0_1_data_1;
  reg  [42:0] sectored_entries_0_1_data_2;
  reg  [42:0] sectored_entries_0_1_data_3;
  reg         sectored_entries_0_1_valid_0;
  reg         sectored_entries_0_1_valid_1;
  reg         sectored_entries_0_1_valid_2;
  reg         sectored_entries_0_1_valid_3;
  reg  [26:0] sectored_entries_0_2_tag_vpn;
  reg         sectored_entries_0_2_tag_v;
  reg  [42:0] sectored_entries_0_2_data_0;
  reg  [42:0] sectored_entries_0_2_data_1;
  reg  [42:0] sectored_entries_0_2_data_2;
  reg  [42:0] sectored_entries_0_2_data_3;
  reg         sectored_entries_0_2_valid_0;
  reg         sectored_entries_0_2_valid_1;
  reg         sectored_entries_0_2_valid_2;
  reg         sectored_entries_0_2_valid_3;
  reg  [26:0] sectored_entries_0_3_tag_vpn;
  reg         sectored_entries_0_3_tag_v;
  reg  [42:0] sectored_entries_0_3_data_0;
  reg  [42:0] sectored_entries_0_3_data_1;
  reg  [42:0] sectored_entries_0_3_data_2;
  reg  [42:0] sectored_entries_0_3_data_3;
  reg         sectored_entries_0_3_valid_0;
  reg         sectored_entries_0_3_valid_1;
  reg         sectored_entries_0_3_valid_2;
  reg         sectored_entries_0_3_valid_3;
  reg  [26:0] sectored_entries_0_4_tag_vpn;
  reg         sectored_entries_0_4_tag_v;
  reg  [42:0] sectored_entries_0_4_data_0;
  reg  [42:0] sectored_entries_0_4_data_1;
  reg  [42:0] sectored_entries_0_4_data_2;
  reg  [42:0] sectored_entries_0_4_data_3;
  reg         sectored_entries_0_4_valid_0;
  reg         sectored_entries_0_4_valid_1;
  reg         sectored_entries_0_4_valid_2;
  reg         sectored_entries_0_4_valid_3;
  reg  [26:0] sectored_entries_0_5_tag_vpn;
  reg         sectored_entries_0_5_tag_v;
  reg  [42:0] sectored_entries_0_5_data_0;
  reg  [42:0] sectored_entries_0_5_data_1;
  reg  [42:0] sectored_entries_0_5_data_2;
  reg  [42:0] sectored_entries_0_5_data_3;
  reg         sectored_entries_0_5_valid_0;
  reg         sectored_entries_0_5_valid_1;
  reg         sectored_entries_0_5_valid_2;
  reg         sectored_entries_0_5_valid_3;
  reg  [26:0] sectored_entries_0_6_tag_vpn;
  reg         sectored_entries_0_6_tag_v;
  reg  [42:0] sectored_entries_0_6_data_0;
  reg  [42:0] sectored_entries_0_6_data_1;
  reg  [42:0] sectored_entries_0_6_data_2;
  reg  [42:0] sectored_entries_0_6_data_3;
  reg         sectored_entries_0_6_valid_0;
  reg         sectored_entries_0_6_valid_1;
  reg         sectored_entries_0_6_valid_2;
  reg         sectored_entries_0_6_valid_3;
  reg  [26:0] sectored_entries_0_7_tag_vpn;
  reg         sectored_entries_0_7_tag_v;
  reg  [42:0] sectored_entries_0_7_data_0;
  reg  [42:0] sectored_entries_0_7_data_1;
  reg  [42:0] sectored_entries_0_7_data_2;
  reg  [42:0] sectored_entries_0_7_data_3;
  reg         sectored_entries_0_7_valid_0;
  reg         sectored_entries_0_7_valid_1;
  reg         sectored_entries_0_7_valid_2;
  reg         sectored_entries_0_7_valid_3;
  reg  [1:0]  superpage_entries_0_level;
  reg  [26:0] superpage_entries_0_tag_vpn;
  reg         superpage_entries_0_tag_v;
  reg  [42:0] superpage_entries_0_data_0;
  reg         superpage_entries_0_valid_0;
  reg  [1:0]  superpage_entries_1_level;
  reg  [26:0] superpage_entries_1_tag_vpn;
  reg         superpage_entries_1_tag_v;
  reg  [42:0] superpage_entries_1_data_0;
  reg         superpage_entries_1_valid_0;
  reg  [1:0]  superpage_entries_2_level;
  reg  [26:0] superpage_entries_2_tag_vpn;
  reg         superpage_entries_2_tag_v;
  reg  [42:0] superpage_entries_2_data_0;
  reg         superpage_entries_2_valid_0;
  reg  [1:0]  superpage_entries_3_level;
  reg  [26:0] superpage_entries_3_tag_vpn;
  reg         superpage_entries_3_tag_v;
  reg  [42:0] superpage_entries_3_data_0;
  reg         superpage_entries_3_valid_0;
  reg  [1:0]  special_entry_level;
  reg  [26:0] special_entry_tag_vpn;
  reg  [42:0] special_entry_data_0;
  reg         special_entry_valid_0;
  reg  [1:0]  state;
  reg  [26:0] r_refill_tag;
  reg  [1:0]  waddr;
  reg  [2:0]  r_sectored_repl_addr;
  reg         r_sectored_hit_valid;
  reg  [2:0]  r_sectored_hit_bits;
  reg         r_need_gpa;
  wire        _vm_enabled_T_1 = io_ptw_ptbr_mode[3] & ~(io_req_bits_prv[1]);
  wire        _io_ptw_req_valid_T = state == 2'h1;
  wire        ignore_13 = special_entry_level == 2'h0;
  wire [27:0] mpu_ppn = io_ptw_resp_valid ? {7'h0, io_ptw_resp_bits_pte_ppn[20:0]} : _vm_enabled_T_1 ? {7'h0, _mpu_ppn_barrier_io_y_ppn[20:18], (ignore_13 ? io_req_bits_vaddr[29:21] : 9'h0) | _mpu_ppn_barrier_io_y_ppn[17:9], (special_entry_level[1] ? 9'h0 : io_req_bits_vaddr[20:12]) | _mpu_ppn_barrier_io_y_ppn[8:0]} : io_req_bits_vaddr[39:12];
  wire [2:0]  mpu_priv = io_ptw_resp_valid ? 3'h1 : {io_ptw_status_debug, io_req_bits_prv};
  wire [9:0]  _GEN = mpu_ppn[13:4] ^ 10'h200;
  wire [8:0]  _GEN_0 = mpu_ppn[8:0] ^ 9'h100;
  wire        legal_address = {mpu_ppn[27:2], ~(mpu_ppn[1:0])} == 28'h0 | {mpu_ppn[27:1], ~(mpu_ppn[0])} == 28'h0 | {mpu_ppn[27:16], ~(mpu_ppn[15:14])} == 14'h0 | {mpu_ppn[27:14], _GEN} == 24'h0 | ~(|mpu_ppn) | {mpu_ppn[27:5], ~(mpu_ppn[4])} == 24'h0 | {mpu_ppn[27:9], _GEN_0} == 28'h0 | {mpu_ppn[27:9], mpu_ppn[8:0] ^ 9'h110} == 28'h0 | {mpu_ppn[27:20], ~(mpu_ppn[19])} == 9'h0 | {mpu_ppn[27:21], mpu_ppn[20:19] ^ 2'h2} == 9'h0;
  wire [1:0]  _GEN_1 = {mpu_ppn[20], ~(mpu_ppn[19])};
  wire        _GEN_2 = mpu_ppn[20:19] != 2'h2;
  wire        deny_access_to_debug = ~(mpu_priv[2]) & ~(|mpu_ppn);
  wire        newEntry_px = legal_address & ({mpu_ppn[20:19], mpu_ppn[15], mpu_ppn[13], mpu_ppn[8], mpu_ppn[4], mpu_ppn[1:0]} == 8'h0 | {mpu_ppn[20:19], mpu_ppn[15], mpu_ppn[13], mpu_ppn[8], mpu_ppn[4], ~(mpu_ppn[1:0])} == 8'h0 | {mpu_ppn[20:19], mpu_ppn[15], mpu_ppn[13], mpu_ppn[8], ~(mpu_ppn[4])} == 6'h0 | ~(|_GEN_1) | ~_GEN_2) & ~deny_access_to_debug & _pmp_io_x;
  wire [24:0] _hitsVec_T = sectored_entries_0_0_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_6 = sectored_entries_0_1_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_12 = sectored_entries_0_2_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_18 = sectored_entries_0_3_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_24 = sectored_entries_0_4_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_30 = sectored_entries_0_5_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_36 = sectored_entries_0_6_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_42 = sectored_entries_0_7_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire [17:0] _hitsVec_T_58 = superpage_entries_0_tag_vpn[26:9] ^ io_req_bits_vaddr[38:21];
  wire        ignore_1 = superpage_entries_0_level == 2'h0;
  wire [17:0] _hitsVec_T_73 = superpage_entries_1_tag_vpn[26:9] ^ io_req_bits_vaddr[38:21];
  wire        ignore_4 = superpage_entries_1_level == 2'h0;
  wire [17:0] _hitsVec_T_88 = superpage_entries_2_tag_vpn[26:9] ^ io_req_bits_vaddr[38:21];
  wire        ignore_7 = superpage_entries_2_level == 2'h0;
  wire [17:0] _hitsVec_T_103 = superpage_entries_3_tag_vpn[26:9] ^ io_req_bits_vaddr[38:21];
  wire        ignore_10 = superpage_entries_3_level == 2'h0;
  reg         casez_tmp;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp = sectored_entries_0_0_valid_0;
      2'b01:
        casez_tmp = sectored_entries_0_0_valid_1;
      2'b10:
        casez_tmp = sectored_entries_0_0_valid_2;
      default:
        casez_tmp = sectored_entries_0_0_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_0 = _vm_enabled_T_1 & casez_tmp & _hitsVec_T == 25'h0 & ~sectored_entries_0_0_tag_v;
  reg         casez_tmp_0;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_0 = sectored_entries_0_1_valid_0;
      2'b01:
        casez_tmp_0 = sectored_entries_0_1_valid_1;
      2'b10:
        casez_tmp_0 = sectored_entries_0_1_valid_2;
      default:
        casez_tmp_0 = sectored_entries_0_1_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_1 = _vm_enabled_T_1 & casez_tmp_0 & _hitsVec_T_6 == 25'h0 & ~sectored_entries_0_1_tag_v;
  reg         casez_tmp_1;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_1 = sectored_entries_0_2_valid_0;
      2'b01:
        casez_tmp_1 = sectored_entries_0_2_valid_1;
      2'b10:
        casez_tmp_1 = sectored_entries_0_2_valid_2;
      default:
        casez_tmp_1 = sectored_entries_0_2_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_2 = _vm_enabled_T_1 & casez_tmp_1 & _hitsVec_T_12 == 25'h0 & ~sectored_entries_0_2_tag_v;
  reg         casez_tmp_2;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_2 = sectored_entries_0_3_valid_0;
      2'b01:
        casez_tmp_2 = sectored_entries_0_3_valid_1;
      2'b10:
        casez_tmp_2 = sectored_entries_0_3_valid_2;
      default:
        casez_tmp_2 = sectored_entries_0_3_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_3 = _vm_enabled_T_1 & casez_tmp_2 & _hitsVec_T_18 == 25'h0 & ~sectored_entries_0_3_tag_v;
  reg         casez_tmp_3;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_3 = sectored_entries_0_4_valid_0;
      2'b01:
        casez_tmp_3 = sectored_entries_0_4_valid_1;
      2'b10:
        casez_tmp_3 = sectored_entries_0_4_valid_2;
      default:
        casez_tmp_3 = sectored_entries_0_4_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_4 = _vm_enabled_T_1 & casez_tmp_3 & _hitsVec_T_24 == 25'h0 & ~sectored_entries_0_4_tag_v;
  reg         casez_tmp_4;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_4 = sectored_entries_0_5_valid_0;
      2'b01:
        casez_tmp_4 = sectored_entries_0_5_valid_1;
      2'b10:
        casez_tmp_4 = sectored_entries_0_5_valid_2;
      default:
        casez_tmp_4 = sectored_entries_0_5_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_5 = _vm_enabled_T_1 & casez_tmp_4 & _hitsVec_T_30 == 25'h0 & ~sectored_entries_0_5_tag_v;
  reg         casez_tmp_5;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_5 = sectored_entries_0_6_valid_0;
      2'b01:
        casez_tmp_5 = sectored_entries_0_6_valid_1;
      2'b10:
        casez_tmp_5 = sectored_entries_0_6_valid_2;
      default:
        casez_tmp_5 = sectored_entries_0_6_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_6 = _vm_enabled_T_1 & casez_tmp_5 & _hitsVec_T_36 == 25'h0 & ~sectored_entries_0_6_tag_v;
  reg         casez_tmp_6;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_6 = sectored_entries_0_7_valid_0;
      2'b01:
        casez_tmp_6 = sectored_entries_0_7_valid_1;
      2'b10:
        casez_tmp_6 = sectored_entries_0_7_valid_2;
      default:
        casez_tmp_6 = sectored_entries_0_7_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_7 = _vm_enabled_T_1 & casez_tmp_6 & _hitsVec_T_42 == 25'h0 & ~sectored_entries_0_7_tag_v;
  wire        hitsVec_8 = _vm_enabled_T_1 & superpage_entries_0_valid_0 & ~superpage_entries_0_tag_v & _hitsVec_T_58[17:9] == 9'h0 & (ignore_1 | _hitsVec_T_58[8:0] == 9'h0);
  wire        hitsVec_9 = _vm_enabled_T_1 & superpage_entries_1_valid_0 & ~superpage_entries_1_tag_v & _hitsVec_T_73[17:9] == 9'h0 & (ignore_4 | _hitsVec_T_73[8:0] == 9'h0);
  wire        hitsVec_10 = _vm_enabled_T_1 & superpage_entries_2_valid_0 & ~superpage_entries_2_tag_v & _hitsVec_T_88[17:9] == 9'h0 & (ignore_7 | _hitsVec_T_88[8:0] == 9'h0);
  wire        hitsVec_11 = _vm_enabled_T_1 & superpage_entries_3_valid_0 & ~superpage_entries_3_tag_v & _hitsVec_T_103[17:9] == 9'h0 & (ignore_10 | _hitsVec_T_103[8:0] == 9'h0);
  wire [26:0] _hitsVec_T_118 = special_entry_tag_vpn ^ io_req_bits_vaddr[38:12];
  wire        hitsVec_12 = _vm_enabled_T_1 & special_entry_valid_0 & _hitsVec_T_118[26:18] == 9'h0 & (ignore_13 | _hitsVec_T_118[17:9] == 9'h0) & (~(special_entry_level[1]) | _hitsVec_T_118[8:0] == 9'h0);
  wire [12:0] real_hits = {hitsVec_12, hitsVec_11, hitsVec_10, hitsVec_9, hitsVec_8, hitsVec_7, hitsVec_6, hitsVec_5, hitsVec_4, hitsVec_3, hitsVec_2, hitsVec_1, hitsVec_0};
  reg  [42:0] casez_tmp_7;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_7 = sectored_entries_0_0_data_0;
      2'b01:
        casez_tmp_7 = sectored_entries_0_0_data_1;
      2'b10:
        casez_tmp_7 = sectored_entries_0_0_data_2;
      default:
        casez_tmp_7 = sectored_entries_0_0_data_3;
    endcase
  end // always @(*)
  reg  [42:0] casez_tmp_8;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_8 = sectored_entries_0_1_data_0;
      2'b01:
        casez_tmp_8 = sectored_entries_0_1_data_1;
      2'b10:
        casez_tmp_8 = sectored_entries_0_1_data_2;
      default:
        casez_tmp_8 = sectored_entries_0_1_data_3;
    endcase
  end // always @(*)
  reg  [42:0] casez_tmp_9;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_9 = sectored_entries_0_2_data_0;
      2'b01:
        casez_tmp_9 = sectored_entries_0_2_data_1;
      2'b10:
        casez_tmp_9 = sectored_entries_0_2_data_2;
      default:
        casez_tmp_9 = sectored_entries_0_2_data_3;
    endcase
  end // always @(*)
  reg  [42:0] casez_tmp_10;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_10 = sectored_entries_0_3_data_0;
      2'b01:
        casez_tmp_10 = sectored_entries_0_3_data_1;
      2'b10:
        casez_tmp_10 = sectored_entries_0_3_data_2;
      default:
        casez_tmp_10 = sectored_entries_0_3_data_3;
    endcase
  end // always @(*)
  reg  [42:0] casez_tmp_11;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_11 = sectored_entries_0_4_data_0;
      2'b01:
        casez_tmp_11 = sectored_entries_0_4_data_1;
      2'b10:
        casez_tmp_11 = sectored_entries_0_4_data_2;
      default:
        casez_tmp_11 = sectored_entries_0_4_data_3;
    endcase
  end // always @(*)
  reg  [42:0] casez_tmp_12;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_12 = sectored_entries_0_5_data_0;
      2'b01:
        casez_tmp_12 = sectored_entries_0_5_data_1;
      2'b10:
        casez_tmp_12 = sectored_entries_0_5_data_2;
      default:
        casez_tmp_12 = sectored_entries_0_5_data_3;
    endcase
  end // always @(*)
  reg  [42:0] casez_tmp_13;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_13 = sectored_entries_0_6_data_0;
      2'b01:
        casez_tmp_13 = sectored_entries_0_6_data_1;
      2'b10:
        casez_tmp_13 = sectored_entries_0_6_data_2;
      default:
        casez_tmp_13 = sectored_entries_0_6_data_3;
    endcase
  end // always @(*)
  reg  [42:0] casez_tmp_14;
  always @(*) begin
    casez (io_req_bits_vaddr[13:12])
      2'b00:
        casez_tmp_14 = sectored_entries_0_7_data_0;
      2'b01:
        casez_tmp_14 = sectored_entries_0_7_data_1;
      2'b10:
        casez_tmp_14 = sectored_entries_0_7_data_2;
      default:
        casez_tmp_14 = sectored_entries_0_7_data_3;
    endcase
  end // always @(*)
  wire        bad_va = _vm_enabled_T_1 & io_ptw_ptbr_mode[3] & ~(io_req_bits_vaddr[39:38] == 2'h0 | (&(io_req_bits_vaddr[39:38])));
  wire        tlb_miss = _vm_enabled_T_1 & ~bad_va & real_hits == 13'h0;
  reg  [6:0]  state_vec_0;
  reg  [2:0]  state_reg_1;
  wire        multipleHits_rightOne_1 = hitsVec_1 | hitsVec_2;
  wire        multipleHits_leftOne_2 = hitsVec_0 | multipleHits_rightOne_1;
  wire        multipleHits_rightOne_3 = hitsVec_4 | hitsVec_5;
  wire        multipleHits_rightOne_4 = hitsVec_3 | multipleHits_rightOne_3;
  wire        multipleHits_rightOne_6 = hitsVec_7 | hitsVec_8;
  wire        multipleHits_leftOne_8 = hitsVec_6 | multipleHits_rightOne_6;
  wire        multipleHits_leftOne_10 = hitsVec_9 | hitsVec_10;
  wire        multipleHits_rightOne_9 = hitsVec_11 | hitsVec_12;
  wire        multipleHits_rightOne_10 = multipleHits_leftOne_10 | multipleHits_rightOne_9;
  wire        multipleHits = hitsVec_1 & hitsVec_2 | hitsVec_0 & multipleHits_rightOne_1 | hitsVec_4 & hitsVec_5 | hitsVec_3 & multipleHits_rightOne_3 | multipleHits_leftOne_2 & multipleHits_rightOne_4 | hitsVec_7 & hitsVec_8 | hitsVec_6 & multipleHits_rightOne_6 | hitsVec_9 & hitsVec_10 | hitsVec_11 & hitsVec_12 | multipleHits_leftOne_10 & multipleHits_rightOne_9 | multipleHits_leftOne_8 & multipleHits_rightOne_10 | (multipleHits_leftOne_2 | multipleHits_rightOne_4) & (multipleHits_leftOne_8 | multipleHits_rightOne_10);
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (io_sfence_valid & ~reset & ~(~io_sfence_bits_rs1 | io_sfence_bits_addr[38:12] == io_req_bits_vaddr[38:12])) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at TLB.scala:709 assert(!io.sfence.bits.rs1 || (io.sfence.bits.addr >> pgIdxBits) === vpn)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [2:0]  _r_superpage_repl_addr_T_5 = ~{superpage_entries_2_valid_0, superpage_entries_1_valid_0, superpage_entries_0_valid_0};
  wire        superpage_hits_1 = superpage_entries_1_valid_0 & ~superpage_entries_1_tag_v & _hitsVec_T_73[17:9] == 9'h0 & (ignore_4 | _hitsVec_T_73[8:0] == 9'h0);
  wire        superpage_hits_2 = superpage_entries_2_valid_0 & ~superpage_entries_2_tag_v & _hitsVec_T_88[17:9] == 9'h0 & (ignore_7 | _hitsVec_T_88[8:0] == 9'h0);
  wire        superpage_hits_3 = superpage_entries_3_valid_0 & ~superpage_entries_3_tag_v & _hitsVec_T_103[17:9] == 9'h0 & (ignore_10 | _hitsVec_T_103[8:0] == 9'h0);
  wire        _GEN_3 = io_req_valid & _vm_enabled_T_1;
  wire [1:0]  hi_4 = {superpage_hits_3, superpage_hits_2};
  wire        _state_reg_T_5 = superpage_hits_3 | superpage_hits_1;
  wire        invalidate_refill = _io_ptw_req_valid_T | (&state) | io_sfence_valid;
  wire        newEntry_c = legal_address & (~(|_GEN_1) | ~_GEN_2);
  wire        newEntry_pr = legal_address & ~deny_access_to_debug & _pmp_io_r;
  wire [4:0]  _GEN_4 = {mpu_ppn[20:19], mpu_ppn[15], mpu_ppn[8], mpu_ppn[4]};
  wire [3:0]  _GEN_5 = {mpu_ppn[20:19], mpu_ppn[15], _GEN_0[8]};
  wire [2:0]  _GEN_6 = {mpu_ppn[20:19], ~(mpu_ppn[15])};
  wire        newEntry_pw = legal_address & (~(|_GEN_4) | ~(|_GEN_5) | ~(|_GEN_6) | ~(|_GEN_1) | ~_GEN_2) & ~deny_access_to_debug & _pmp_io_w;
  wire        newEntry_ppp = legal_address & (~(|_GEN_4) | ~(|_GEN_5) | ~(|_GEN_6) | ~(|_GEN_1) | ~_GEN_2);
  wire        newEntry_pal = legal_address & (~(|_GEN_4) | ~(|_GEN_5) | ~(|_GEN_6));
  wire        newEntry_paa = legal_address & (~(|_GEN_4) | ~(|_GEN_5) | ~(|_GEN_6));
  wire        newEntry_eff = legal_address & ({mpu_ppn[20:19], mpu_ppn[15], mpu_ppn[13], mpu_ppn[8], mpu_ppn[4], mpu_ppn[1]} == 7'h0 | {mpu_ppn[20:19], mpu_ppn[15], mpu_ppn[13], _GEN_0[8], mpu_ppn[1]} == 6'h0 | {mpu_ppn[20:19], mpu_ppn[15], _GEN[9], mpu_ppn[8], mpu_ppn[4]} == 6'h0 | ~(|_GEN_6));
  wire        _r_sectored_repl_addr_valids_T = sectored_entries_0_0_valid_0 | sectored_entries_0_0_valid_1;
  wire        sector_hits_0 = (_r_sectored_repl_addr_valids_T | sectored_entries_0_0_valid_2 | sectored_entries_0_0_valid_3) & _hitsVec_T == 25'h0 & ~sectored_entries_0_0_tag_v;
  wire        _r_sectored_repl_addr_valids_T_3 = sectored_entries_0_1_valid_0 | sectored_entries_0_1_valid_1;
  wire        sector_hits_1 = (_r_sectored_repl_addr_valids_T_3 | sectored_entries_0_1_valid_2 | sectored_entries_0_1_valid_3) & _hitsVec_T_6 == 25'h0 & ~sectored_entries_0_1_tag_v;
  wire        _r_sectored_repl_addr_valids_T_6 = sectored_entries_0_2_valid_0 | sectored_entries_0_2_valid_1;
  wire        sector_hits_2 = (_r_sectored_repl_addr_valids_T_6 | sectored_entries_0_2_valid_2 | sectored_entries_0_2_valid_3) & _hitsVec_T_12 == 25'h0 & ~sectored_entries_0_2_tag_v;
  wire        _r_sectored_repl_addr_valids_T_9 = sectored_entries_0_3_valid_0 | sectored_entries_0_3_valid_1;
  wire        sector_hits_3 = (_r_sectored_repl_addr_valids_T_9 | sectored_entries_0_3_valid_2 | sectored_entries_0_3_valid_3) & _hitsVec_T_18 == 25'h0 & ~sectored_entries_0_3_tag_v;
  wire        _r_sectored_repl_addr_valids_T_12 = sectored_entries_0_4_valid_0 | sectored_entries_0_4_valid_1;
  wire        sector_hits_4 = (_r_sectored_repl_addr_valids_T_12 | sectored_entries_0_4_valid_2 | sectored_entries_0_4_valid_3) & _hitsVec_T_24 == 25'h0 & ~sectored_entries_0_4_tag_v;
  wire        _r_sectored_repl_addr_valids_T_15 = sectored_entries_0_5_valid_0 | sectored_entries_0_5_valid_1;
  wire        sector_hits_5 = (_r_sectored_repl_addr_valids_T_15 | sectored_entries_0_5_valid_2 | sectored_entries_0_5_valid_3) & _hitsVec_T_30 == 25'h0 & ~sectored_entries_0_5_tag_v;
  wire        _r_sectored_repl_addr_valids_T_18 = sectored_entries_0_6_valid_0 | sectored_entries_0_6_valid_1;
  wire        sector_hits_6 = (_r_sectored_repl_addr_valids_T_18 | sectored_entries_0_6_valid_2 | sectored_entries_0_6_valid_3) & _hitsVec_T_36 == 25'h0 & ~sectored_entries_0_6_tag_v;
  wire        _r_sectored_repl_addr_valids_T_21 = sectored_entries_0_7_valid_0 | sectored_entries_0_7_valid_1;
  wire        sector_hits_7 = (_r_sectored_repl_addr_valids_T_21 | sectored_entries_0_7_valid_2 | sectored_entries_0_7_valid_3) & _hitsVec_T_42 == 25'h0 & ~sectored_entries_0_7_tag_v;
  wire        newEntry_g = io_ptw_resp_bits_pte_g & io_ptw_resp_bits_pte_v;
  wire        newEntry_sr = io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | io_ptw_resp_bits_pte_x & ~io_ptw_resp_bits_pte_w) & io_ptw_resp_bits_pte_a & io_ptw_resp_bits_pte_r;
  wire        newEntry_sw = io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | io_ptw_resp_bits_pte_x & ~io_ptw_resp_bits_pte_w) & io_ptw_resp_bits_pte_a & io_ptw_resp_bits_pte_w & io_ptw_resp_bits_pte_d;
  wire        newEntry_sx = io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | io_ptw_resp_bits_pte_x & ~io_ptw_resp_bits_pte_w) & io_ptw_resp_bits_pte_a & io_ptw_resp_bits_pte_x;
  wire        _GEN_7 = io_ptw_resp_valid & ~io_ptw_resp_bits_homogeneous;
  wire        _GEN_8 = _GEN_7 | special_entry_valid_0;
  wire        _GEN_9 = ~(io_ptw_resp_bits_level[1]) & waddr == 2'h0;
  wire        _GEN_10 = io_ptw_resp_valid & io_ptw_resp_bits_homogeneous & _GEN_9;
  wire        _GEN_11 = _GEN_10 ? ~invalidate_refill : superpage_entries_0_valid_0;
  wire        _GEN_12 = ~(io_ptw_resp_bits_level[1]) & waddr == 2'h1;
  wire        _GEN_13 = io_ptw_resp_valid & io_ptw_resp_bits_homogeneous & _GEN_12;
  wire        _GEN_14 = _GEN_13 ? ~invalidate_refill : superpage_entries_1_valid_0;
  wire        _GEN_15 = ~(io_ptw_resp_bits_level[1]) & waddr == 2'h2;
  wire        _GEN_16 = io_ptw_resp_valid & io_ptw_resp_bits_homogeneous & _GEN_15;
  wire        _GEN_17 = _GEN_16 ? ~invalidate_refill : superpage_entries_2_valid_0;
  wire        _GEN_18 = ~(io_ptw_resp_bits_level[1]) & (&waddr);
  wire        _GEN_19 = io_ptw_resp_valid & io_ptw_resp_bits_homogeneous & _GEN_18;
  wire        _GEN_20 = _GEN_19 ? ~invalidate_refill : superpage_entries_3_valid_0;
  wire [2:0]  waddr_1 = r_sectored_hit_valid ? r_sectored_hit_bits : r_sectored_repl_addr;
  wire        _GEN_21 = waddr_1 == 3'h0;
  wire        _GEN_22 = ~io_ptw_resp_bits_homogeneous | ~(io_ptw_resp_bits_level[1]);
  wire        _GEN_23 = ~io_ptw_resp_valid | _GEN_22 | ~_GEN_21;
  wire        _GEN_24 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_25 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_26 = r_refill_tag[1:0] == 2'h2;
  wire [42:0] _sectored_entries_0_0_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_ppp, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_27 = _GEN_23 ? sectored_entries_0_0_valid_0 : ~invalidate_refill & (_GEN_24 | r_sectored_hit_valid & sectored_entries_0_0_valid_0);
  wire        _GEN_28 = _GEN_23 ? sectored_entries_0_0_valid_1 : ~invalidate_refill & (_GEN_25 | r_sectored_hit_valid & sectored_entries_0_0_valid_1);
  wire        _GEN_29 = _GEN_23 ? sectored_entries_0_0_valid_2 : ~invalidate_refill & (_GEN_26 | r_sectored_hit_valid & sectored_entries_0_0_valid_2);
  wire        _GEN_30 = _GEN_23 ? sectored_entries_0_0_valid_3 : ~invalidate_refill & ((&(r_refill_tag[1:0])) | r_sectored_hit_valid & sectored_entries_0_0_valid_3);
  wire        _GEN_31 = waddr_1 == 3'h1;
  wire        _GEN_32 = ~io_ptw_resp_valid | _GEN_22 | ~_GEN_31;
  wire        _GEN_33 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_34 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_35 = r_refill_tag[1:0] == 2'h2;
  wire [42:0] _sectored_entries_0_1_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_ppp, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_36 = _GEN_32 ? sectored_entries_0_1_valid_0 : ~invalidate_refill & (_GEN_33 | r_sectored_hit_valid & sectored_entries_0_1_valid_0);
  wire        _GEN_37 = _GEN_32 ? sectored_entries_0_1_valid_1 : ~invalidate_refill & (_GEN_34 | r_sectored_hit_valid & sectored_entries_0_1_valid_1);
  wire        _GEN_38 = _GEN_32 ? sectored_entries_0_1_valid_2 : ~invalidate_refill & (_GEN_35 | r_sectored_hit_valid & sectored_entries_0_1_valid_2);
  wire        _GEN_39 = _GEN_32 ? sectored_entries_0_1_valid_3 : ~invalidate_refill & ((&(r_refill_tag[1:0])) | r_sectored_hit_valid & sectored_entries_0_1_valid_3);
  wire        _GEN_40 = waddr_1 == 3'h2;
  wire        _GEN_41 = ~io_ptw_resp_valid | _GEN_22 | ~_GEN_40;
  wire        _GEN_42 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_43 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_44 = r_refill_tag[1:0] == 2'h2;
  wire [42:0] _sectored_entries_0_2_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_ppp, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_45 = _GEN_41 ? sectored_entries_0_2_valid_0 : ~invalidate_refill & (_GEN_42 | r_sectored_hit_valid & sectored_entries_0_2_valid_0);
  wire        _GEN_46 = _GEN_41 ? sectored_entries_0_2_valid_1 : ~invalidate_refill & (_GEN_43 | r_sectored_hit_valid & sectored_entries_0_2_valid_1);
  wire        _GEN_47 = _GEN_41 ? sectored_entries_0_2_valid_2 : ~invalidate_refill & (_GEN_44 | r_sectored_hit_valid & sectored_entries_0_2_valid_2);
  wire        _GEN_48 = _GEN_41 ? sectored_entries_0_2_valid_3 : ~invalidate_refill & ((&(r_refill_tag[1:0])) | r_sectored_hit_valid & sectored_entries_0_2_valid_3);
  wire        _GEN_49 = waddr_1 == 3'h3;
  wire        _GEN_50 = ~io_ptw_resp_valid | _GEN_22 | ~_GEN_49;
  wire        _GEN_51 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_52 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_53 = r_refill_tag[1:0] == 2'h2;
  wire [42:0] _sectored_entries_0_3_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_ppp, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_54 = _GEN_50 ? sectored_entries_0_3_valid_0 : ~invalidate_refill & (_GEN_51 | r_sectored_hit_valid & sectored_entries_0_3_valid_0);
  wire        _GEN_55 = _GEN_50 ? sectored_entries_0_3_valid_1 : ~invalidate_refill & (_GEN_52 | r_sectored_hit_valid & sectored_entries_0_3_valid_1);
  wire        _GEN_56 = _GEN_50 ? sectored_entries_0_3_valid_2 : ~invalidate_refill & (_GEN_53 | r_sectored_hit_valid & sectored_entries_0_3_valid_2);
  wire        _GEN_57 = _GEN_50 ? sectored_entries_0_3_valid_3 : ~invalidate_refill & ((&(r_refill_tag[1:0])) | r_sectored_hit_valid & sectored_entries_0_3_valid_3);
  wire        _GEN_58 = waddr_1 == 3'h4;
  wire        _GEN_59 = ~io_ptw_resp_valid | _GEN_22 | ~_GEN_58;
  wire        _GEN_60 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_61 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_62 = r_refill_tag[1:0] == 2'h2;
  wire [42:0] _sectored_entries_0_4_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_ppp, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_63 = _GEN_59 ? sectored_entries_0_4_valid_0 : ~invalidate_refill & (_GEN_60 | r_sectored_hit_valid & sectored_entries_0_4_valid_0);
  wire        _GEN_64 = _GEN_59 ? sectored_entries_0_4_valid_1 : ~invalidate_refill & (_GEN_61 | r_sectored_hit_valid & sectored_entries_0_4_valid_1);
  wire        _GEN_65 = _GEN_59 ? sectored_entries_0_4_valid_2 : ~invalidate_refill & (_GEN_62 | r_sectored_hit_valid & sectored_entries_0_4_valid_2);
  wire        _GEN_66 = _GEN_59 ? sectored_entries_0_4_valid_3 : ~invalidate_refill & ((&(r_refill_tag[1:0])) | r_sectored_hit_valid & sectored_entries_0_4_valid_3);
  wire        _GEN_67 = waddr_1 == 3'h5;
  wire        _GEN_68 = ~io_ptw_resp_valid | _GEN_22 | ~_GEN_67;
  wire        _GEN_69 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_70 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_71 = r_refill_tag[1:0] == 2'h2;
  wire [42:0] _sectored_entries_0_5_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_ppp, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_72 = _GEN_68 ? sectored_entries_0_5_valid_0 : ~invalidate_refill & (_GEN_69 | r_sectored_hit_valid & sectored_entries_0_5_valid_0);
  wire        _GEN_73 = _GEN_68 ? sectored_entries_0_5_valid_1 : ~invalidate_refill & (_GEN_70 | r_sectored_hit_valid & sectored_entries_0_5_valid_1);
  wire        _GEN_74 = _GEN_68 ? sectored_entries_0_5_valid_2 : ~invalidate_refill & (_GEN_71 | r_sectored_hit_valid & sectored_entries_0_5_valid_2);
  wire        _GEN_75 = _GEN_68 ? sectored_entries_0_5_valid_3 : ~invalidate_refill & ((&(r_refill_tag[1:0])) | r_sectored_hit_valid & sectored_entries_0_5_valid_3);
  wire        _GEN_76 = waddr_1 == 3'h6;
  wire        _GEN_77 = ~io_ptw_resp_valid | _GEN_22 | ~_GEN_76;
  wire        _GEN_78 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_79 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_80 = r_refill_tag[1:0] == 2'h2;
  wire [42:0] _sectored_entries_0_6_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_ppp, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_81 = _GEN_77 ? sectored_entries_0_6_valid_0 : ~invalidate_refill & (_GEN_78 | r_sectored_hit_valid & sectored_entries_0_6_valid_0);
  wire        _GEN_82 = _GEN_77 ? sectored_entries_0_6_valid_1 : ~invalidate_refill & (_GEN_79 | r_sectored_hit_valid & sectored_entries_0_6_valid_1);
  wire        _GEN_83 = _GEN_77 ? sectored_entries_0_6_valid_2 : ~invalidate_refill & (_GEN_80 | r_sectored_hit_valid & sectored_entries_0_6_valid_2);
  wire        _GEN_84 = _GEN_77 ? sectored_entries_0_6_valid_3 : ~invalidate_refill & ((&(r_refill_tag[1:0])) | r_sectored_hit_valid & sectored_entries_0_6_valid_3);
  wire        _GEN_85 = ~io_ptw_resp_valid | _GEN_22 | ~(&waddr_1);
  wire        _GEN_86 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_87 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_88 = r_refill_tag[1:0] == 2'h2;
  wire [42:0] _sectored_entries_0_7_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_ppp, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_89 = _GEN_85 ? sectored_entries_0_7_valid_0 : ~invalidate_refill & (_GEN_86 | r_sectored_hit_valid & sectored_entries_0_7_valid_0);
  wire        _GEN_90 = _GEN_85 ? sectored_entries_0_7_valid_1 : ~invalidate_refill & (_GEN_87 | r_sectored_hit_valid & sectored_entries_0_7_valid_1);
  wire        _GEN_91 = _GEN_85 ? sectored_entries_0_7_valid_2 : ~invalidate_refill & (_GEN_88 | r_sectored_hit_valid & sectored_entries_0_7_valid_2);
  wire        _GEN_92 = _GEN_85 ? sectored_entries_0_7_valid_3 : ~invalidate_refill & ((&(r_refill_tag[1:0])) | r_sectored_hit_valid & sectored_entries_0_7_valid_3);
  wire [2:0]  _GEN_93 = {sector_hits_7, sector_hits_6, sector_hits_5};
  wire [2:0]  _GEN_94 = {sector_hits_3, sector_hits_2, sector_hits_1};
  wire        _GEN_95 = state == 2'h0 & io_req_valid & tlb_miss;
  wire [24:0] _GEN_96 = sectored_entries_0_0_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire        _GEN_97 = _GEN_96 == 25'h0 & ~sectored_entries_0_0_tag_v;
  wire        _GEN_98 = io_req_bits_vaddr[13:12] == 2'h0;
  wire        _GEN_99 = _GEN_97 & ~sectored_entries_0_0_tag_v & _GEN_98;
  wire        _GEN_100 = io_req_bits_vaddr[13:12] == 2'h1;
  wire        _GEN_101 = _GEN_97 & ~sectored_entries_0_0_tag_v & _GEN_100;
  wire        _GEN_102 = io_req_bits_vaddr[13:12] == 2'h2;
  wire        _GEN_103 = _GEN_97 & ~sectored_entries_0_0_tag_v & _GEN_102;
  wire        _GEN_104 = _GEN_97 & ~sectored_entries_0_0_tag_v & (&(io_req_bits_vaddr[13:12]));
  wire        _GEN_105 = _GEN_96[24:16] == 9'h0;
  wire [24:0] _GEN_106 = sectored_entries_0_1_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire        _GEN_107 = _GEN_106 == 25'h0 & ~sectored_entries_0_1_tag_v;
  wire        _GEN_108 = _GEN_107 & ~sectored_entries_0_1_tag_v & _GEN_98;
  wire        _GEN_109 = _GEN_107 & ~sectored_entries_0_1_tag_v & _GEN_100;
  wire        _GEN_110 = _GEN_107 & ~sectored_entries_0_1_tag_v & _GEN_102;
  wire        _GEN_111 = _GEN_107 & ~sectored_entries_0_1_tag_v & (&(io_req_bits_vaddr[13:12]));
  wire        _GEN_112 = _GEN_106[24:16] == 9'h0;
  wire [24:0] _GEN_113 = sectored_entries_0_2_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire        _GEN_114 = _GEN_113 == 25'h0 & ~sectored_entries_0_2_tag_v;
  wire        _GEN_115 = _GEN_114 & ~sectored_entries_0_2_tag_v & _GEN_98;
  wire        _GEN_116 = _GEN_114 & ~sectored_entries_0_2_tag_v & _GEN_100;
  wire        _GEN_117 = _GEN_114 & ~sectored_entries_0_2_tag_v & _GEN_102;
  wire        _GEN_118 = _GEN_114 & ~sectored_entries_0_2_tag_v & (&(io_req_bits_vaddr[13:12]));
  wire        _GEN_119 = _GEN_113[24:16] == 9'h0;
  wire [24:0] _GEN_120 = sectored_entries_0_3_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire        _GEN_121 = _GEN_120 == 25'h0 & ~sectored_entries_0_3_tag_v;
  wire        _GEN_122 = _GEN_121 & ~sectored_entries_0_3_tag_v & _GEN_98;
  wire        _GEN_123 = _GEN_121 & ~sectored_entries_0_3_tag_v & _GEN_100;
  wire        _GEN_124 = _GEN_121 & ~sectored_entries_0_3_tag_v & _GEN_102;
  wire        _GEN_125 = _GEN_121 & ~sectored_entries_0_3_tag_v & (&(io_req_bits_vaddr[13:12]));
  wire        _GEN_126 = _GEN_120[24:16] == 9'h0;
  wire [24:0] _GEN_127 = sectored_entries_0_4_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire        _GEN_128 = _GEN_127 == 25'h0 & ~sectored_entries_0_4_tag_v;
  wire        _GEN_129 = _GEN_128 & ~sectored_entries_0_4_tag_v & _GEN_98;
  wire        _GEN_130 = _GEN_128 & ~sectored_entries_0_4_tag_v & _GEN_100;
  wire        _GEN_131 = _GEN_128 & ~sectored_entries_0_4_tag_v & _GEN_102;
  wire        _GEN_132 = _GEN_128 & ~sectored_entries_0_4_tag_v & (&(io_req_bits_vaddr[13:12]));
  wire        _GEN_133 = _GEN_127[24:16] == 9'h0;
  wire [24:0] _GEN_134 = sectored_entries_0_5_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire        _GEN_135 = _GEN_134 == 25'h0 & ~sectored_entries_0_5_tag_v;
  wire        _GEN_136 = _GEN_135 & ~sectored_entries_0_5_tag_v & _GEN_98;
  wire        _GEN_137 = _GEN_135 & ~sectored_entries_0_5_tag_v & _GEN_100;
  wire        _GEN_138 = _GEN_135 & ~sectored_entries_0_5_tag_v & _GEN_102;
  wire        _GEN_139 = _GEN_135 & ~sectored_entries_0_5_tag_v & (&(io_req_bits_vaddr[13:12]));
  wire        _GEN_140 = _GEN_134[24:16] == 9'h0;
  wire [24:0] _GEN_141 = sectored_entries_0_6_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire        _GEN_142 = _GEN_141 == 25'h0 & ~sectored_entries_0_6_tag_v;
  wire        _GEN_143 = _GEN_142 & ~sectored_entries_0_6_tag_v & _GEN_98;
  wire        _GEN_144 = _GEN_142 & ~sectored_entries_0_6_tag_v & _GEN_100;
  wire        _GEN_145 = _GEN_142 & ~sectored_entries_0_6_tag_v & _GEN_102;
  wire        _GEN_146 = _GEN_142 & ~sectored_entries_0_6_tag_v & (&(io_req_bits_vaddr[13:12]));
  wire        _GEN_147 = _GEN_141[24:16] == 9'h0;
  wire [24:0] _GEN_148 = sectored_entries_0_7_tag_vpn[26:2] ^ io_req_bits_vaddr[38:14];
  wire        _GEN_149 = _GEN_148 == 25'h0 & ~sectored_entries_0_7_tag_v;
  wire        _GEN_150 = _GEN_149 & ~sectored_entries_0_7_tag_v & _GEN_98;
  wire        _GEN_151 = _GEN_149 & ~sectored_entries_0_7_tag_v & _GEN_100;
  wire        _GEN_152 = _GEN_149 & ~sectored_entries_0_7_tag_v & _GEN_102;
  wire        _GEN_153 = _GEN_149 & ~sectored_entries_0_7_tag_v & (&(io_req_bits_vaddr[13:12]));
  wire        _GEN_154 = _GEN_148[24:16] == 9'h0;
  wire        _GEN_155 = _hitsVec_T_58[17:9] == 9'h0;
  wire        _GEN_156 = superpage_entries_0_valid_0 & ~superpage_entries_0_tag_v & _GEN_155 & (ignore_1 | _hitsVec_T_58[8:0] == 9'h0);
  wire        _GEN_157 = _hitsVec_T_73[17:9] == 9'h0;
  wire        _GEN_158 = superpage_entries_1_valid_0 & ~superpage_entries_1_tag_v & _GEN_157 & (ignore_4 | _hitsVec_T_73[8:0] == 9'h0);
  wire        _GEN_159 = _hitsVec_T_88[17:9] == 9'h0;
  wire        _GEN_160 = superpage_entries_2_valid_0 & ~superpage_entries_2_tag_v & _GEN_159 & (ignore_7 | _hitsVec_T_88[8:0] == 9'h0);
  wire        _GEN_161 = _hitsVec_T_103[17:9] == 9'h0;
  wire        _GEN_162 = superpage_entries_3_valid_0 & ~superpage_entries_3_tag_v & _GEN_161 & (ignore_10 | _hitsVec_T_103[8:0] == 9'h0);
  wire        _GEN_163 = _hitsVec_T_118[26:18] == 9'h0;
  wire        _GEN_164 = special_entry_valid_0 & _GEN_163 & (ignore_13 | _hitsVec_T_118[17:9] == 9'h0) & (~(special_entry_level[1]) | _hitsVec_T_118[8:0] == 9'h0);
  wire        _GEN_165 = multipleHits | reset;
  wire        _r_sectored_repl_addr_valids_T_2 = _r_sectored_repl_addr_valids_T | sectored_entries_0_0_valid_2 | sectored_entries_0_0_valid_3;
  wire        _r_sectored_repl_addr_valids_T_5 = _r_sectored_repl_addr_valids_T_3 | sectored_entries_0_1_valid_2 | sectored_entries_0_1_valid_3;
  wire        _r_sectored_repl_addr_valids_T_8 = _r_sectored_repl_addr_valids_T_6 | sectored_entries_0_2_valid_2 | sectored_entries_0_2_valid_3;
  wire        _r_sectored_repl_addr_valids_T_11 = _r_sectored_repl_addr_valids_T_9 | sectored_entries_0_3_valid_2 | sectored_entries_0_3_valid_3;
  wire        _r_sectored_repl_addr_valids_T_14 = _r_sectored_repl_addr_valids_T_12 | sectored_entries_0_4_valid_2 | sectored_entries_0_4_valid_3;
  wire        _r_sectored_repl_addr_valids_T_17 = _r_sectored_repl_addr_valids_T_15 | sectored_entries_0_5_valid_2 | sectored_entries_0_5_valid_3;
  wire        _r_sectored_repl_addr_valids_T_20 = _r_sectored_repl_addr_valids_T_18 | sectored_entries_0_6_valid_2 | sectored_entries_0_6_valid_3;
  wire [6:0]  _r_sectored_repl_addr_T_11 = ~{_r_sectored_repl_addr_valids_T_20, _r_sectored_repl_addr_valids_T_17, _r_sectored_repl_addr_valids_T_14, _r_sectored_repl_addr_valids_T_11, _r_sectored_repl_addr_valids_T_8, _r_sectored_repl_addr_valids_T_5, _r_sectored_repl_addr_valids_T_2};
  wire [2:0]  _r_sectored_hit_bits_T_2 = _GEN_93 | _GEN_94;
  wire [3:0]  hi_1 = {sector_hits_7, sector_hits_6, sector_hits_5, sector_hits_4};
  wire [2:0]  _GEN_166 = _GEN_93 | _GEN_94;
  wire        _state_vec_0_T_6 = _GEN_166[2] | _GEN_166[0];
  always @(posedge clock) begin
    if (_GEN_23) begin
    end
    else
      sectored_entries_0_0_tag_vpn <= r_refill_tag;
    sectored_entries_0_0_tag_v <= _GEN_23 & sectored_entries_0_0_tag_v;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_21 & _GEN_24)) begin
    end
    else
      sectored_entries_0_0_data_0 <= _sectored_entries_0_0_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_21 & _GEN_25)) begin
    end
    else
      sectored_entries_0_0_data_1 <= _sectored_entries_0_0_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_21 & _GEN_26)) begin
    end
    else
      sectored_entries_0_0_data_2 <= _sectored_entries_0_0_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_21 & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_0_0_data_3 <= _sectored_entries_0_0_data_T;
    sectored_entries_0_0_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_105 ? ~(~sectored_entries_0_0_tag_v & sectored_entries_0_0_data_0[0] | _GEN_99) & _GEN_27 : ~_GEN_99 & _GEN_27) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_0_tag_v & ~(sectored_entries_0_0_data_0[20])) & _GEN_27 : sectored_entries_0_0_tag_v & _GEN_27) : _GEN_27);
    sectored_entries_0_0_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_105 ? ~(~sectored_entries_0_0_tag_v & sectored_entries_0_0_data_1[0] | _GEN_101) & _GEN_28 : ~_GEN_101 & _GEN_28) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_0_tag_v & ~(sectored_entries_0_0_data_1[20])) & _GEN_28 : sectored_entries_0_0_tag_v & _GEN_28) : _GEN_28);
    sectored_entries_0_0_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_105 ? ~(~sectored_entries_0_0_tag_v & sectored_entries_0_0_data_2[0] | _GEN_103) & _GEN_29 : ~_GEN_103 & _GEN_29) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_0_tag_v & ~(sectored_entries_0_0_data_2[20])) & _GEN_29 : sectored_entries_0_0_tag_v & _GEN_29) : _GEN_29);
    sectored_entries_0_0_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_105 ? ~(~sectored_entries_0_0_tag_v & sectored_entries_0_0_data_3[0] | _GEN_104) & _GEN_30 : ~_GEN_104 & _GEN_30) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_0_tag_v & ~(sectored_entries_0_0_data_3[20])) & _GEN_30 : sectored_entries_0_0_tag_v & _GEN_30) : _GEN_30);
    if (_GEN_32) begin
    end
    else
      sectored_entries_0_1_tag_vpn <= r_refill_tag;
    sectored_entries_0_1_tag_v <= _GEN_32 & sectored_entries_0_1_tag_v;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_31 & _GEN_33)) begin
    end
    else
      sectored_entries_0_1_data_0 <= _sectored_entries_0_1_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_31 & _GEN_34)) begin
    end
    else
      sectored_entries_0_1_data_1 <= _sectored_entries_0_1_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_31 & _GEN_35)) begin
    end
    else
      sectored_entries_0_1_data_2 <= _sectored_entries_0_1_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_31 & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_0_1_data_3 <= _sectored_entries_0_1_data_T;
    sectored_entries_0_1_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_112 ? ~(~sectored_entries_0_1_tag_v & sectored_entries_0_1_data_0[0] | _GEN_108) & _GEN_36 : ~_GEN_108 & _GEN_36) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_1_tag_v & ~(sectored_entries_0_1_data_0[20])) & _GEN_36 : sectored_entries_0_1_tag_v & _GEN_36) : _GEN_36);
    sectored_entries_0_1_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_112 ? ~(~sectored_entries_0_1_tag_v & sectored_entries_0_1_data_1[0] | _GEN_109) & _GEN_37 : ~_GEN_109 & _GEN_37) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_1_tag_v & ~(sectored_entries_0_1_data_1[20])) & _GEN_37 : sectored_entries_0_1_tag_v & _GEN_37) : _GEN_37);
    sectored_entries_0_1_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_112 ? ~(~sectored_entries_0_1_tag_v & sectored_entries_0_1_data_2[0] | _GEN_110) & _GEN_38 : ~_GEN_110 & _GEN_38) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_1_tag_v & ~(sectored_entries_0_1_data_2[20])) & _GEN_38 : sectored_entries_0_1_tag_v & _GEN_38) : _GEN_38);
    sectored_entries_0_1_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_112 ? ~(~sectored_entries_0_1_tag_v & sectored_entries_0_1_data_3[0] | _GEN_111) & _GEN_39 : ~_GEN_111 & _GEN_39) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_1_tag_v & ~(sectored_entries_0_1_data_3[20])) & _GEN_39 : sectored_entries_0_1_tag_v & _GEN_39) : _GEN_39);
    if (_GEN_41) begin
    end
    else
      sectored_entries_0_2_tag_vpn <= r_refill_tag;
    sectored_entries_0_2_tag_v <= _GEN_41 & sectored_entries_0_2_tag_v;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_40 & _GEN_42)) begin
    end
    else
      sectored_entries_0_2_data_0 <= _sectored_entries_0_2_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_40 & _GEN_43)) begin
    end
    else
      sectored_entries_0_2_data_1 <= _sectored_entries_0_2_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_40 & _GEN_44)) begin
    end
    else
      sectored_entries_0_2_data_2 <= _sectored_entries_0_2_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_40 & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_0_2_data_3 <= _sectored_entries_0_2_data_T;
    sectored_entries_0_2_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_119 ? ~(~sectored_entries_0_2_tag_v & sectored_entries_0_2_data_0[0] | _GEN_115) & _GEN_45 : ~_GEN_115 & _GEN_45) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_2_tag_v & ~(sectored_entries_0_2_data_0[20])) & _GEN_45 : sectored_entries_0_2_tag_v & _GEN_45) : _GEN_45);
    sectored_entries_0_2_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_119 ? ~(~sectored_entries_0_2_tag_v & sectored_entries_0_2_data_1[0] | _GEN_116) & _GEN_46 : ~_GEN_116 & _GEN_46) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_2_tag_v & ~(sectored_entries_0_2_data_1[20])) & _GEN_46 : sectored_entries_0_2_tag_v & _GEN_46) : _GEN_46);
    sectored_entries_0_2_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_119 ? ~(~sectored_entries_0_2_tag_v & sectored_entries_0_2_data_2[0] | _GEN_117) & _GEN_47 : ~_GEN_117 & _GEN_47) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_2_tag_v & ~(sectored_entries_0_2_data_2[20])) & _GEN_47 : sectored_entries_0_2_tag_v & _GEN_47) : _GEN_47);
    sectored_entries_0_2_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_119 ? ~(~sectored_entries_0_2_tag_v & sectored_entries_0_2_data_3[0] | _GEN_118) & _GEN_48 : ~_GEN_118 & _GEN_48) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_2_tag_v & ~(sectored_entries_0_2_data_3[20])) & _GEN_48 : sectored_entries_0_2_tag_v & _GEN_48) : _GEN_48);
    if (_GEN_50) begin
    end
    else
      sectored_entries_0_3_tag_vpn <= r_refill_tag;
    sectored_entries_0_3_tag_v <= _GEN_50 & sectored_entries_0_3_tag_v;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_49 & _GEN_51)) begin
    end
    else
      sectored_entries_0_3_data_0 <= _sectored_entries_0_3_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_49 & _GEN_52)) begin
    end
    else
      sectored_entries_0_3_data_1 <= _sectored_entries_0_3_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_49 & _GEN_53)) begin
    end
    else
      sectored_entries_0_3_data_2 <= _sectored_entries_0_3_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_49 & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_0_3_data_3 <= _sectored_entries_0_3_data_T;
    sectored_entries_0_3_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_126 ? ~(~sectored_entries_0_3_tag_v & sectored_entries_0_3_data_0[0] | _GEN_122) & _GEN_54 : ~_GEN_122 & _GEN_54) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_3_tag_v & ~(sectored_entries_0_3_data_0[20])) & _GEN_54 : sectored_entries_0_3_tag_v & _GEN_54) : _GEN_54);
    sectored_entries_0_3_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_126 ? ~(~sectored_entries_0_3_tag_v & sectored_entries_0_3_data_1[0] | _GEN_123) & _GEN_55 : ~_GEN_123 & _GEN_55) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_3_tag_v & ~(sectored_entries_0_3_data_1[20])) & _GEN_55 : sectored_entries_0_3_tag_v & _GEN_55) : _GEN_55);
    sectored_entries_0_3_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_126 ? ~(~sectored_entries_0_3_tag_v & sectored_entries_0_3_data_2[0] | _GEN_124) & _GEN_56 : ~_GEN_124 & _GEN_56) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_3_tag_v & ~(sectored_entries_0_3_data_2[20])) & _GEN_56 : sectored_entries_0_3_tag_v & _GEN_56) : _GEN_56);
    sectored_entries_0_3_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_126 ? ~(~sectored_entries_0_3_tag_v & sectored_entries_0_3_data_3[0] | _GEN_125) & _GEN_57 : ~_GEN_125 & _GEN_57) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_3_tag_v & ~(sectored_entries_0_3_data_3[20])) & _GEN_57 : sectored_entries_0_3_tag_v & _GEN_57) : _GEN_57);
    if (_GEN_59) begin
    end
    else
      sectored_entries_0_4_tag_vpn <= r_refill_tag;
    sectored_entries_0_4_tag_v <= _GEN_59 & sectored_entries_0_4_tag_v;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_58 & _GEN_60)) begin
    end
    else
      sectored_entries_0_4_data_0 <= _sectored_entries_0_4_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_58 & _GEN_61)) begin
    end
    else
      sectored_entries_0_4_data_1 <= _sectored_entries_0_4_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_58 & _GEN_62)) begin
    end
    else
      sectored_entries_0_4_data_2 <= _sectored_entries_0_4_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_58 & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_0_4_data_3 <= _sectored_entries_0_4_data_T;
    sectored_entries_0_4_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_133 ? ~(~sectored_entries_0_4_tag_v & sectored_entries_0_4_data_0[0] | _GEN_129) & _GEN_63 : ~_GEN_129 & _GEN_63) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_4_tag_v & ~(sectored_entries_0_4_data_0[20])) & _GEN_63 : sectored_entries_0_4_tag_v & _GEN_63) : _GEN_63);
    sectored_entries_0_4_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_133 ? ~(~sectored_entries_0_4_tag_v & sectored_entries_0_4_data_1[0] | _GEN_130) & _GEN_64 : ~_GEN_130 & _GEN_64) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_4_tag_v & ~(sectored_entries_0_4_data_1[20])) & _GEN_64 : sectored_entries_0_4_tag_v & _GEN_64) : _GEN_64);
    sectored_entries_0_4_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_133 ? ~(~sectored_entries_0_4_tag_v & sectored_entries_0_4_data_2[0] | _GEN_131) & _GEN_65 : ~_GEN_131 & _GEN_65) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_4_tag_v & ~(sectored_entries_0_4_data_2[20])) & _GEN_65 : sectored_entries_0_4_tag_v & _GEN_65) : _GEN_65);
    sectored_entries_0_4_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_133 ? ~(~sectored_entries_0_4_tag_v & sectored_entries_0_4_data_3[0] | _GEN_132) & _GEN_66 : ~_GEN_132 & _GEN_66) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_4_tag_v & ~(sectored_entries_0_4_data_3[20])) & _GEN_66 : sectored_entries_0_4_tag_v & _GEN_66) : _GEN_66);
    if (_GEN_68) begin
    end
    else
      sectored_entries_0_5_tag_vpn <= r_refill_tag;
    sectored_entries_0_5_tag_v <= _GEN_68 & sectored_entries_0_5_tag_v;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_67 & _GEN_69)) begin
    end
    else
      sectored_entries_0_5_data_0 <= _sectored_entries_0_5_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_67 & _GEN_70)) begin
    end
    else
      sectored_entries_0_5_data_1 <= _sectored_entries_0_5_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_67 & _GEN_71)) begin
    end
    else
      sectored_entries_0_5_data_2 <= _sectored_entries_0_5_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_67 & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_0_5_data_3 <= _sectored_entries_0_5_data_T;
    sectored_entries_0_5_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_140 ? ~(~sectored_entries_0_5_tag_v & sectored_entries_0_5_data_0[0] | _GEN_136) & _GEN_72 : ~_GEN_136 & _GEN_72) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_5_tag_v & ~(sectored_entries_0_5_data_0[20])) & _GEN_72 : sectored_entries_0_5_tag_v & _GEN_72) : _GEN_72);
    sectored_entries_0_5_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_140 ? ~(~sectored_entries_0_5_tag_v & sectored_entries_0_5_data_1[0] | _GEN_137) & _GEN_73 : ~_GEN_137 & _GEN_73) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_5_tag_v & ~(sectored_entries_0_5_data_1[20])) & _GEN_73 : sectored_entries_0_5_tag_v & _GEN_73) : _GEN_73);
    sectored_entries_0_5_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_140 ? ~(~sectored_entries_0_5_tag_v & sectored_entries_0_5_data_2[0] | _GEN_138) & _GEN_74 : ~_GEN_138 & _GEN_74) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_5_tag_v & ~(sectored_entries_0_5_data_2[20])) & _GEN_74 : sectored_entries_0_5_tag_v & _GEN_74) : _GEN_74);
    sectored_entries_0_5_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_140 ? ~(~sectored_entries_0_5_tag_v & sectored_entries_0_5_data_3[0] | _GEN_139) & _GEN_75 : ~_GEN_139 & _GEN_75) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_5_tag_v & ~(sectored_entries_0_5_data_3[20])) & _GEN_75 : sectored_entries_0_5_tag_v & _GEN_75) : _GEN_75);
    if (_GEN_77) begin
    end
    else
      sectored_entries_0_6_tag_vpn <= r_refill_tag;
    sectored_entries_0_6_tag_v <= _GEN_77 & sectored_entries_0_6_tag_v;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_76 & _GEN_78)) begin
    end
    else
      sectored_entries_0_6_data_0 <= _sectored_entries_0_6_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_76 & _GEN_79)) begin
    end
    else
      sectored_entries_0_6_data_1 <= _sectored_entries_0_6_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_76 & _GEN_80)) begin
    end
    else
      sectored_entries_0_6_data_2 <= _sectored_entries_0_6_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~(_GEN_76 & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_0_6_data_3 <= _sectored_entries_0_6_data_T;
    sectored_entries_0_6_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_147 ? ~(~sectored_entries_0_6_tag_v & sectored_entries_0_6_data_0[0] | _GEN_143) & _GEN_81 : ~_GEN_143 & _GEN_81) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_6_tag_v & ~(sectored_entries_0_6_data_0[20])) & _GEN_81 : sectored_entries_0_6_tag_v & _GEN_81) : _GEN_81);
    sectored_entries_0_6_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_147 ? ~(~sectored_entries_0_6_tag_v & sectored_entries_0_6_data_1[0] | _GEN_144) & _GEN_82 : ~_GEN_144 & _GEN_82) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_6_tag_v & ~(sectored_entries_0_6_data_1[20])) & _GEN_82 : sectored_entries_0_6_tag_v & _GEN_82) : _GEN_82);
    sectored_entries_0_6_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_147 ? ~(~sectored_entries_0_6_tag_v & sectored_entries_0_6_data_2[0] | _GEN_145) & _GEN_83 : ~_GEN_145 & _GEN_83) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_6_tag_v & ~(sectored_entries_0_6_data_2[20])) & _GEN_83 : sectored_entries_0_6_tag_v & _GEN_83) : _GEN_83);
    sectored_entries_0_6_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_147 ? ~(~sectored_entries_0_6_tag_v & sectored_entries_0_6_data_3[0] | _GEN_146) & _GEN_84 : ~_GEN_146 & _GEN_84) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_6_tag_v & ~(sectored_entries_0_6_data_3[20])) & _GEN_84 : sectored_entries_0_6_tag_v & _GEN_84) : _GEN_84);
    if (_GEN_85) begin
    end
    else
      sectored_entries_0_7_tag_vpn <= r_refill_tag;
    sectored_entries_0_7_tag_v <= _GEN_85 & sectored_entries_0_7_tag_v;
    if (~io_ptw_resp_valid | _GEN_22 | ~((&waddr_1) & _GEN_86)) begin
    end
    else
      sectored_entries_0_7_data_0 <= _sectored_entries_0_7_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~((&waddr_1) & _GEN_87)) begin
    end
    else
      sectored_entries_0_7_data_1 <= _sectored_entries_0_7_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~((&waddr_1) & _GEN_88)) begin
    end
    else
      sectored_entries_0_7_data_2 <= _sectored_entries_0_7_data_T;
    if (~io_ptw_resp_valid | _GEN_22 | ~((&waddr_1) & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_0_7_data_3 <= _sectored_entries_0_7_data_T;
    sectored_entries_0_7_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_154 ? ~(~sectored_entries_0_7_tag_v & sectored_entries_0_7_data_0[0] | _GEN_150) & _GEN_89 : ~_GEN_150 & _GEN_89) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_7_tag_v & ~(sectored_entries_0_7_data_0[20])) & _GEN_89 : sectored_entries_0_7_tag_v & _GEN_89) : _GEN_89);
    sectored_entries_0_7_valid_1 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_154 ? ~(~sectored_entries_0_7_tag_v & sectored_entries_0_7_data_1[0] | _GEN_151) & _GEN_90 : ~_GEN_151 & _GEN_90) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_7_tag_v & ~(sectored_entries_0_7_data_1[20])) & _GEN_90 : sectored_entries_0_7_tag_v & _GEN_90) : _GEN_90);
    sectored_entries_0_7_valid_2 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_154 ? ~(~sectored_entries_0_7_tag_v & sectored_entries_0_7_data_2[0] | _GEN_152) & _GEN_91 : ~_GEN_152 & _GEN_91) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_7_tag_v & ~(sectored_entries_0_7_data_2[20])) & _GEN_91 : sectored_entries_0_7_tag_v & _GEN_91) : _GEN_91);
    sectored_entries_0_7_valid_3 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_154 ? ~(~sectored_entries_0_7_tag_v & sectored_entries_0_7_data_3[0] | _GEN_153) & _GEN_92 : ~_GEN_153 & _GEN_92) : io_sfence_bits_rs2 ? ~(~sectored_entries_0_7_tag_v & ~(sectored_entries_0_7_data_3[20])) & _GEN_92 : sectored_entries_0_7_tag_v & _GEN_92) : _GEN_92);
    if (_GEN_10) begin
      superpage_entries_0_level <= {1'h0, io_ptw_resp_bits_level[0]};
      superpage_entries_0_tag_vpn <= r_refill_tag;
    end
    superpage_entries_0_tag_v <= (~io_ptw_resp_valid | ~io_ptw_resp_bits_homogeneous | ~_GEN_9) & superpage_entries_0_tag_v;
    if (_GEN_10)
      superpage_entries_0_data_0 <= {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_ppp, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
    superpage_entries_0_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_155 ? ~(~superpage_entries_0_tag_v & superpage_entries_0_data_0[0] | _GEN_156) & _GEN_11 : ~_GEN_156 & _GEN_11) : io_sfence_bits_rs2 ? ~(~superpage_entries_0_tag_v & ~(superpage_entries_0_data_0[20])) & _GEN_11 : superpage_entries_0_tag_v & _GEN_11) : _GEN_11);
    if (_GEN_13) begin
      superpage_entries_1_level <= {1'h0, io_ptw_resp_bits_level[0]};
      superpage_entries_1_tag_vpn <= r_refill_tag;
    end
    superpage_entries_1_tag_v <= (~io_ptw_resp_valid | ~io_ptw_resp_bits_homogeneous | ~_GEN_12) & superpage_entries_1_tag_v;
    if (_GEN_13)
      superpage_entries_1_data_0 <= {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_ppp, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
    superpage_entries_1_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_157 ? ~(~superpage_entries_1_tag_v & superpage_entries_1_data_0[0] | _GEN_158) & _GEN_14 : ~_GEN_158 & _GEN_14) : io_sfence_bits_rs2 ? ~(~superpage_entries_1_tag_v & ~(superpage_entries_1_data_0[20])) & _GEN_14 : superpage_entries_1_tag_v & _GEN_14) : _GEN_14);
    if (_GEN_16) begin
      superpage_entries_2_level <= {1'h0, io_ptw_resp_bits_level[0]};
      superpage_entries_2_tag_vpn <= r_refill_tag;
    end
    superpage_entries_2_tag_v <= (~io_ptw_resp_valid | ~io_ptw_resp_bits_homogeneous | ~_GEN_15) & superpage_entries_2_tag_v;
    if (_GEN_16)
      superpage_entries_2_data_0 <= {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_ppp, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
    superpage_entries_2_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_159 ? ~(~superpage_entries_2_tag_v & superpage_entries_2_data_0[0] | _GEN_160) & _GEN_17 : ~_GEN_160 & _GEN_17) : io_sfence_bits_rs2 ? ~(~superpage_entries_2_tag_v & ~(superpage_entries_2_data_0[20])) & _GEN_17 : superpage_entries_2_tag_v & _GEN_17) : _GEN_17);
    if (_GEN_19) begin
      superpage_entries_3_level <= {1'h0, io_ptw_resp_bits_level[0]};
      superpage_entries_3_tag_vpn <= r_refill_tag;
    end
    superpage_entries_3_tag_v <= (~io_ptw_resp_valid | ~io_ptw_resp_bits_homogeneous | ~_GEN_18) & superpage_entries_3_tag_v;
    if (_GEN_19)
      superpage_entries_3_data_0 <= {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_ppp, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
    superpage_entries_3_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_161 ? ~(~superpage_entries_3_tag_v & superpage_entries_3_data_0[0] | _GEN_162) & _GEN_20 : ~_GEN_162 & _GEN_20) : io_sfence_bits_rs2 ? ~(~superpage_entries_3_tag_v & ~(superpage_entries_3_data_0[20])) & _GEN_20 : superpage_entries_3_tag_v & _GEN_20) : _GEN_20);
    if (_GEN_7) begin
      special_entry_level <= io_ptw_resp_bits_level;
      special_entry_tag_vpn <= r_refill_tag;
      special_entry_data_0 <= {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, newEntry_g, io_ptw_resp_bits_ae_ptw, io_ptw_resp_bits_ae_final, 1'h0, io_ptw_resp_bits_pf, io_ptw_resp_bits_gf, newEntry_sw, newEntry_sx, newEntry_sr, io_ptw_resp_bits_hw, io_ptw_resp_bits_hx, io_ptw_resp_bits_hr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_ppp, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
    end
    special_entry_valid_0 <= ~_GEN_165 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_163 ? ~(special_entry_data_0[0] | _GEN_164) & _GEN_8 : ~_GEN_164 & _GEN_8) : io_sfence_bits_rs2 & special_entry_data_0[20] & _GEN_8) : _GEN_8);
    if (_GEN_95) begin
      r_refill_tag <= io_req_bits_vaddr[38:12];
      waddr <= (&{superpage_entries_3_valid_0, superpage_entries_2_valid_0, superpage_entries_1_valid_0, superpage_entries_0_valid_0}) ? {state_reg_1[2], state_reg_1[2] ? state_reg_1[1] : state_reg_1[0]} : _r_superpage_repl_addr_T_5[0] ? 2'h0 : _r_superpage_repl_addr_T_5[1] ? 2'h1 : {1'h1, ~(_r_superpage_repl_addr_T_5[2])};
      r_sectored_repl_addr <= (&{_r_sectored_repl_addr_valids_T_21 | sectored_entries_0_7_valid_2 | sectored_entries_0_7_valid_3, _r_sectored_repl_addr_valids_T_20, _r_sectored_repl_addr_valids_T_17, _r_sectored_repl_addr_valids_T_14, _r_sectored_repl_addr_valids_T_11, _r_sectored_repl_addr_valids_T_8, _r_sectored_repl_addr_valids_T_5, _r_sectored_repl_addr_valids_T_2}) ? {state_vec_0[6], state_vec_0[6] ? {state_vec_0[5], state_vec_0[5] ? state_vec_0[4] : state_vec_0[3]} : {state_vec_0[2], state_vec_0[2] ? state_vec_0[1] : state_vec_0[0]}} : _r_sectored_repl_addr_T_11[0] ? 3'h0 : _r_sectored_repl_addr_T_11[1] ? 3'h1 : _r_sectored_repl_addr_T_11[2] ? 3'h2 : _r_sectored_repl_addr_T_11[3] ? 3'h3 : _r_sectored_repl_addr_T_11[4] ? 3'h4 : _r_sectored_repl_addr_T_11[5] ? 3'h5 : {2'h3, ~(_r_sectored_repl_addr_T_11[6])};
      r_sectored_hit_valid <= sector_hits_0 | sector_hits_1 | sector_hits_2 | sector_hits_3 | sector_hits_4 | sector_hits_5 | sector_hits_6 | sector_hits_7;
      r_sectored_hit_bits <= {|{sector_hits_7, sector_hits_6, sector_hits_5, sector_hits_4}, |(_r_sectored_hit_bits_T_2[2:1]), _r_sectored_hit_bits_T_2[2] | _r_sectored_hit_bits_T_2[0]};
      r_need_gpa <= |real_hits;
    end
    if (reset) begin
      state <= 2'h0;
      state_vec_0 <= 7'h0;
      state_reg_1 <= 3'h0;
    end
    else begin
      if (io_ptw_resp_valid)
        state <= 2'h0;
      else if (state == 2'h2 & io_sfence_valid)
        state <= 2'h3;
      else if (_io_ptw_req_valid_T) begin
        if (io_ptw_req_ready)
          state <= {1'h1, io_sfence_valid};
        else if (io_sfence_valid)
          state <= 2'h0;
        else if (_GEN_95)
          state <= 2'h1;
      end
      else if (_GEN_95)
        state <= 2'h1;
      if (_GEN_3 & (sector_hits_0 | sector_hits_1 | sector_hits_2 | sector_hits_3 | sector_hits_4 | sector_hits_5 | sector_hits_6 | sector_hits_7))
        state_vec_0 <= {~(|hi_1), (|hi_1) ? {~(|(_GEN_166[2:1])), (|(_GEN_166[2:1])) ? ~_state_vec_0_T_6 : state_vec_0[4], (|(_GEN_166[2:1])) ? state_vec_0[3] : ~_state_vec_0_T_6} : state_vec_0[5:3], (|hi_1) ? state_vec_0[2:0] : {~(|(_GEN_166[2:1])), (|(_GEN_166[2:1])) ? ~_state_vec_0_T_6 : state_vec_0[1], (|(_GEN_166[2:1])) ? state_vec_0[0] : ~_state_vec_0_T_6}};
      if (_GEN_3 & (superpage_entries_0_valid_0 & ~superpage_entries_0_tag_v & _hitsVec_T_58[17:9] == 9'h0 & (ignore_1 | _hitsVec_T_58[8:0] == 9'h0) | superpage_hits_1 | superpage_hits_2 | superpage_hits_3))
        state_reg_1 <= {~(|hi_4), (|hi_4) ? ~_state_reg_T_5 : state_reg_1[1], (|hi_4) ? state_reg_1[0] : ~_state_reg_T_5};
    end
  end // always @(posedge)
  OptimizationBarrier mpu_ppn_barrier (
    .io_x_ppn      (special_entry_data_0[42:22]),
    .io_x_u        (special_entry_data_0[21]),
    .io_x_ae_ptw   (special_entry_data_0[19]),
    .io_x_ae_final (special_entry_data_0[18]),
    .io_x_pf       (special_entry_data_0[16]),
    .io_x_gf       (special_entry_data_0[15]),
    .io_x_sx       (special_entry_data_0[13]),
    .io_x_px       (special_entry_data_0[7]),
    .io_y_ppn      (_mpu_ppn_barrier_io_y_ppn),
    .io_y_u        (/* unused */),
    .io_y_ae_ptw   (/* unused */),
    .io_y_ae_final (/* unused */),
    .io_y_pf       (/* unused */),
    .io_y_gf       (/* unused */),
    .io_y_sx       (/* unused */),
    .io_y_px       (/* unused */)
  );
  PMPChecker pmp (
    .io_prv         (mpu_priv[1:0]),
    .io_pmp_0_cfg_l (io_ptw_pmp_0_cfg_l),
    .io_pmp_0_cfg_a (io_ptw_pmp_0_cfg_a),
    .io_pmp_0_cfg_x (io_ptw_pmp_0_cfg_x),
    .io_pmp_0_cfg_w (io_ptw_pmp_0_cfg_w),
    .io_pmp_0_cfg_r (io_ptw_pmp_0_cfg_r),
    .io_pmp_0_addr  (io_ptw_pmp_0_addr),
    .io_pmp_0_mask  (io_ptw_pmp_0_mask),
    .io_pmp_1_cfg_l (io_ptw_pmp_1_cfg_l),
    .io_pmp_1_cfg_a (io_ptw_pmp_1_cfg_a),
    .io_pmp_1_cfg_x (io_ptw_pmp_1_cfg_x),
    .io_pmp_1_cfg_w (io_ptw_pmp_1_cfg_w),
    .io_pmp_1_cfg_r (io_ptw_pmp_1_cfg_r),
    .io_pmp_1_addr  (io_ptw_pmp_1_addr),
    .io_pmp_1_mask  (io_ptw_pmp_1_mask),
    .io_pmp_2_cfg_l (io_ptw_pmp_2_cfg_l),
    .io_pmp_2_cfg_a (io_ptw_pmp_2_cfg_a),
    .io_pmp_2_cfg_x (io_ptw_pmp_2_cfg_x),
    .io_pmp_2_cfg_w (io_ptw_pmp_2_cfg_w),
    .io_pmp_2_cfg_r (io_ptw_pmp_2_cfg_r),
    .io_pmp_2_addr  (io_ptw_pmp_2_addr),
    .io_pmp_2_mask  (io_ptw_pmp_2_mask),
    .io_pmp_3_cfg_l (io_ptw_pmp_3_cfg_l),
    .io_pmp_3_cfg_a (io_ptw_pmp_3_cfg_a),
    .io_pmp_3_cfg_x (io_ptw_pmp_3_cfg_x),
    .io_pmp_3_cfg_w (io_ptw_pmp_3_cfg_w),
    .io_pmp_3_cfg_r (io_ptw_pmp_3_cfg_r),
    .io_pmp_3_addr  (io_ptw_pmp_3_addr),
    .io_pmp_3_mask  (io_ptw_pmp_3_mask),
    .io_pmp_4_cfg_l (io_ptw_pmp_4_cfg_l),
    .io_pmp_4_cfg_a (io_ptw_pmp_4_cfg_a),
    .io_pmp_4_cfg_x (io_ptw_pmp_4_cfg_x),
    .io_pmp_4_cfg_w (io_ptw_pmp_4_cfg_w),
    .io_pmp_4_cfg_r (io_ptw_pmp_4_cfg_r),
    .io_pmp_4_addr  (io_ptw_pmp_4_addr),
    .io_pmp_4_mask  (io_ptw_pmp_4_mask),
    .io_pmp_5_cfg_l (io_ptw_pmp_5_cfg_l),
    .io_pmp_5_cfg_a (io_ptw_pmp_5_cfg_a),
    .io_pmp_5_cfg_x (io_ptw_pmp_5_cfg_x),
    .io_pmp_5_cfg_w (io_ptw_pmp_5_cfg_w),
    .io_pmp_5_cfg_r (io_ptw_pmp_5_cfg_r),
    .io_pmp_5_addr  (io_ptw_pmp_5_addr),
    .io_pmp_5_mask  (io_ptw_pmp_5_mask),
    .io_pmp_6_cfg_l (io_ptw_pmp_6_cfg_l),
    .io_pmp_6_cfg_a (io_ptw_pmp_6_cfg_a),
    .io_pmp_6_cfg_x (io_ptw_pmp_6_cfg_x),
    .io_pmp_6_cfg_w (io_ptw_pmp_6_cfg_w),
    .io_pmp_6_cfg_r (io_ptw_pmp_6_cfg_r),
    .io_pmp_6_addr  (io_ptw_pmp_6_addr),
    .io_pmp_6_mask  (io_ptw_pmp_6_mask),
    .io_pmp_7_cfg_l (io_ptw_pmp_7_cfg_l),
    .io_pmp_7_cfg_a (io_ptw_pmp_7_cfg_a),
    .io_pmp_7_cfg_x (io_ptw_pmp_7_cfg_x),
    .io_pmp_7_cfg_w (io_ptw_pmp_7_cfg_w),
    .io_pmp_7_cfg_r (io_ptw_pmp_7_cfg_r),
    .io_pmp_7_addr  (io_ptw_pmp_7_addr),
    .io_pmp_7_mask  (io_ptw_pmp_7_mask),
    .io_addr        ({mpu_ppn[20:0], io_req_bits_vaddr[11:0]}),
    .io_r           (_pmp_io_r),
    .io_w           (_pmp_io_w),
    .io_x           (_pmp_io_x)
  );
  OptimizationBarrier entries_barrier (
    .io_x_ppn      (casez_tmp_7[42:22]),
    .io_x_u        (casez_tmp_7[21]),
    .io_x_ae_ptw   (casez_tmp_7[19]),
    .io_x_ae_final (casez_tmp_7[18]),
    .io_x_pf       (casez_tmp_7[16]),
    .io_x_gf       (casez_tmp_7[15]),
    .io_x_sx       (casez_tmp_7[13]),
    .io_x_px       (casez_tmp_7[7]),
    .io_y_ppn      (_entries_barrier_io_y_ppn),
    .io_y_u        (_entries_barrier_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_io_y_ae_final),
    .io_y_pf       (_entries_barrier_io_y_pf),
    .io_y_gf       (_entries_barrier_io_y_gf),
    .io_y_sx       (_entries_barrier_io_y_sx),
    .io_y_px       (_entries_barrier_io_y_px)
  );
  OptimizationBarrier entries_barrier_1 (
    .io_x_ppn      (casez_tmp_8[42:22]),
    .io_x_u        (casez_tmp_8[21]),
    .io_x_ae_ptw   (casez_tmp_8[19]),
    .io_x_ae_final (casez_tmp_8[18]),
    .io_x_pf       (casez_tmp_8[16]),
    .io_x_gf       (casez_tmp_8[15]),
    .io_x_sx       (casez_tmp_8[13]),
    .io_x_px       (casez_tmp_8[7]),
    .io_y_ppn      (_entries_barrier_1_io_y_ppn),
    .io_y_u        (_entries_barrier_1_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_1_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_1_io_y_ae_final),
    .io_y_pf       (_entries_barrier_1_io_y_pf),
    .io_y_gf       (_entries_barrier_1_io_y_gf),
    .io_y_sx       (_entries_barrier_1_io_y_sx),
    .io_y_px       (_entries_barrier_1_io_y_px)
  );
  OptimizationBarrier entries_barrier_2 (
    .io_x_ppn      (casez_tmp_9[42:22]),
    .io_x_u        (casez_tmp_9[21]),
    .io_x_ae_ptw   (casez_tmp_9[19]),
    .io_x_ae_final (casez_tmp_9[18]),
    .io_x_pf       (casez_tmp_9[16]),
    .io_x_gf       (casez_tmp_9[15]),
    .io_x_sx       (casez_tmp_9[13]),
    .io_x_px       (casez_tmp_9[7]),
    .io_y_ppn      (_entries_barrier_2_io_y_ppn),
    .io_y_u        (_entries_barrier_2_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_2_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_2_io_y_ae_final),
    .io_y_pf       (_entries_barrier_2_io_y_pf),
    .io_y_gf       (_entries_barrier_2_io_y_gf),
    .io_y_sx       (_entries_barrier_2_io_y_sx),
    .io_y_px       (_entries_barrier_2_io_y_px)
  );
  OptimizationBarrier entries_barrier_3 (
    .io_x_ppn      (casez_tmp_10[42:22]),
    .io_x_u        (casez_tmp_10[21]),
    .io_x_ae_ptw   (casez_tmp_10[19]),
    .io_x_ae_final (casez_tmp_10[18]),
    .io_x_pf       (casez_tmp_10[16]),
    .io_x_gf       (casez_tmp_10[15]),
    .io_x_sx       (casez_tmp_10[13]),
    .io_x_px       (casez_tmp_10[7]),
    .io_y_ppn      (_entries_barrier_3_io_y_ppn),
    .io_y_u        (_entries_barrier_3_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_3_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_3_io_y_ae_final),
    .io_y_pf       (_entries_barrier_3_io_y_pf),
    .io_y_gf       (_entries_barrier_3_io_y_gf),
    .io_y_sx       (_entries_barrier_3_io_y_sx),
    .io_y_px       (_entries_barrier_3_io_y_px)
  );
  OptimizationBarrier entries_barrier_4 (
    .io_x_ppn      (casez_tmp_11[42:22]),
    .io_x_u        (casez_tmp_11[21]),
    .io_x_ae_ptw   (casez_tmp_11[19]),
    .io_x_ae_final (casez_tmp_11[18]),
    .io_x_pf       (casez_tmp_11[16]),
    .io_x_gf       (casez_tmp_11[15]),
    .io_x_sx       (casez_tmp_11[13]),
    .io_x_px       (casez_tmp_11[7]),
    .io_y_ppn      (_entries_barrier_4_io_y_ppn),
    .io_y_u        (_entries_barrier_4_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_4_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_4_io_y_ae_final),
    .io_y_pf       (_entries_barrier_4_io_y_pf),
    .io_y_gf       (_entries_barrier_4_io_y_gf),
    .io_y_sx       (_entries_barrier_4_io_y_sx),
    .io_y_px       (_entries_barrier_4_io_y_px)
  );
  OptimizationBarrier entries_barrier_5 (
    .io_x_ppn      (casez_tmp_12[42:22]),
    .io_x_u        (casez_tmp_12[21]),
    .io_x_ae_ptw   (casez_tmp_12[19]),
    .io_x_ae_final (casez_tmp_12[18]),
    .io_x_pf       (casez_tmp_12[16]),
    .io_x_gf       (casez_tmp_12[15]),
    .io_x_sx       (casez_tmp_12[13]),
    .io_x_px       (casez_tmp_12[7]),
    .io_y_ppn      (_entries_barrier_5_io_y_ppn),
    .io_y_u        (_entries_barrier_5_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_5_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_5_io_y_ae_final),
    .io_y_pf       (_entries_barrier_5_io_y_pf),
    .io_y_gf       (_entries_barrier_5_io_y_gf),
    .io_y_sx       (_entries_barrier_5_io_y_sx),
    .io_y_px       (_entries_barrier_5_io_y_px)
  );
  OptimizationBarrier entries_barrier_6 (
    .io_x_ppn      (casez_tmp_13[42:22]),
    .io_x_u        (casez_tmp_13[21]),
    .io_x_ae_ptw   (casez_tmp_13[19]),
    .io_x_ae_final (casez_tmp_13[18]),
    .io_x_pf       (casez_tmp_13[16]),
    .io_x_gf       (casez_tmp_13[15]),
    .io_x_sx       (casez_tmp_13[13]),
    .io_x_px       (casez_tmp_13[7]),
    .io_y_ppn      (_entries_barrier_6_io_y_ppn),
    .io_y_u        (_entries_barrier_6_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_6_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_6_io_y_ae_final),
    .io_y_pf       (_entries_barrier_6_io_y_pf),
    .io_y_gf       (_entries_barrier_6_io_y_gf),
    .io_y_sx       (_entries_barrier_6_io_y_sx),
    .io_y_px       (_entries_barrier_6_io_y_px)
  );
  OptimizationBarrier entries_barrier_7 (
    .io_x_ppn      (casez_tmp_14[42:22]),
    .io_x_u        (casez_tmp_14[21]),
    .io_x_ae_ptw   (casez_tmp_14[19]),
    .io_x_ae_final (casez_tmp_14[18]),
    .io_x_pf       (casez_tmp_14[16]),
    .io_x_gf       (casez_tmp_14[15]),
    .io_x_sx       (casez_tmp_14[13]),
    .io_x_px       (casez_tmp_14[7]),
    .io_y_ppn      (_entries_barrier_7_io_y_ppn),
    .io_y_u        (_entries_barrier_7_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_7_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_7_io_y_ae_final),
    .io_y_pf       (_entries_barrier_7_io_y_pf),
    .io_y_gf       (_entries_barrier_7_io_y_gf),
    .io_y_sx       (_entries_barrier_7_io_y_sx),
    .io_y_px       (_entries_barrier_7_io_y_px)
  );
  OptimizationBarrier entries_barrier_8 (
    .io_x_ppn      (superpage_entries_0_data_0[42:22]),
    .io_x_u        (superpage_entries_0_data_0[21]),
    .io_x_ae_ptw   (superpage_entries_0_data_0[19]),
    .io_x_ae_final (superpage_entries_0_data_0[18]),
    .io_x_pf       (superpage_entries_0_data_0[16]),
    .io_x_gf       (superpage_entries_0_data_0[15]),
    .io_x_sx       (superpage_entries_0_data_0[13]),
    .io_x_px       (superpage_entries_0_data_0[7]),
    .io_y_ppn      (_entries_barrier_8_io_y_ppn),
    .io_y_u        (_entries_barrier_8_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_8_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_8_io_y_ae_final),
    .io_y_pf       (_entries_barrier_8_io_y_pf),
    .io_y_gf       (_entries_barrier_8_io_y_gf),
    .io_y_sx       (_entries_barrier_8_io_y_sx),
    .io_y_px       (_entries_barrier_8_io_y_px)
  );
  OptimizationBarrier entries_barrier_9 (
    .io_x_ppn      (superpage_entries_1_data_0[42:22]),
    .io_x_u        (superpage_entries_1_data_0[21]),
    .io_x_ae_ptw   (superpage_entries_1_data_0[19]),
    .io_x_ae_final (superpage_entries_1_data_0[18]),
    .io_x_pf       (superpage_entries_1_data_0[16]),
    .io_x_gf       (superpage_entries_1_data_0[15]),
    .io_x_sx       (superpage_entries_1_data_0[13]),
    .io_x_px       (superpage_entries_1_data_0[7]),
    .io_y_ppn      (_entries_barrier_9_io_y_ppn),
    .io_y_u        (_entries_barrier_9_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_9_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_9_io_y_ae_final),
    .io_y_pf       (_entries_barrier_9_io_y_pf),
    .io_y_gf       (_entries_barrier_9_io_y_gf),
    .io_y_sx       (_entries_barrier_9_io_y_sx),
    .io_y_px       (_entries_barrier_9_io_y_px)
  );
  OptimizationBarrier entries_barrier_10 (
    .io_x_ppn      (superpage_entries_2_data_0[42:22]),
    .io_x_u        (superpage_entries_2_data_0[21]),
    .io_x_ae_ptw   (superpage_entries_2_data_0[19]),
    .io_x_ae_final (superpage_entries_2_data_0[18]),
    .io_x_pf       (superpage_entries_2_data_0[16]),
    .io_x_gf       (superpage_entries_2_data_0[15]),
    .io_x_sx       (superpage_entries_2_data_0[13]),
    .io_x_px       (superpage_entries_2_data_0[7]),
    .io_y_ppn      (_entries_barrier_10_io_y_ppn),
    .io_y_u        (_entries_barrier_10_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_10_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_10_io_y_ae_final),
    .io_y_pf       (_entries_barrier_10_io_y_pf),
    .io_y_gf       (_entries_barrier_10_io_y_gf),
    .io_y_sx       (_entries_barrier_10_io_y_sx),
    .io_y_px       (_entries_barrier_10_io_y_px)
  );
  OptimizationBarrier entries_barrier_11 (
    .io_x_ppn      (superpage_entries_3_data_0[42:22]),
    .io_x_u        (superpage_entries_3_data_0[21]),
    .io_x_ae_ptw   (superpage_entries_3_data_0[19]),
    .io_x_ae_final (superpage_entries_3_data_0[18]),
    .io_x_pf       (superpage_entries_3_data_0[16]),
    .io_x_gf       (superpage_entries_3_data_0[15]),
    .io_x_sx       (superpage_entries_3_data_0[13]),
    .io_x_px       (superpage_entries_3_data_0[7]),
    .io_y_ppn      (_entries_barrier_11_io_y_ppn),
    .io_y_u        (_entries_barrier_11_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_11_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_11_io_y_ae_final),
    .io_y_pf       (_entries_barrier_11_io_y_pf),
    .io_y_gf       (_entries_barrier_11_io_y_gf),
    .io_y_sx       (_entries_barrier_11_io_y_sx),
    .io_y_px       (_entries_barrier_11_io_y_px)
  );
  OptimizationBarrier entries_barrier_12 (
    .io_x_ppn      (special_entry_data_0[42:22]),
    .io_x_u        (special_entry_data_0[21]),
    .io_x_ae_ptw   (special_entry_data_0[19]),
    .io_x_ae_final (special_entry_data_0[18]),
    .io_x_pf       (special_entry_data_0[16]),
    .io_x_gf       (special_entry_data_0[15]),
    .io_x_sx       (special_entry_data_0[13]),
    .io_x_px       (special_entry_data_0[7]),
    .io_y_ppn      (_entries_barrier_12_io_y_ppn),
    .io_y_u        (_entries_barrier_12_io_y_u),
    .io_y_ae_ptw   (_entries_barrier_12_io_y_ae_ptw),
    .io_y_ae_final (_entries_barrier_12_io_y_ae_final),
    .io_y_pf       (_entries_barrier_12_io_y_pf),
    .io_y_gf       (_entries_barrier_12_io_y_gf),
    .io_y_sx       (_entries_barrier_12_io_y_sx),
    .io_y_px       (/* unused */)
  );
  assign io_resp_miss = io_ptw_resp_valid | tlb_miss | multipleHits;
  assign io_resp_paddr = {(hitsVec_0 ? _entries_barrier_io_y_ppn : 21'h0) | (hitsVec_1 ? _entries_barrier_1_io_y_ppn : 21'h0) | (hitsVec_2 ? _entries_barrier_2_io_y_ppn : 21'h0) | (hitsVec_3 ? _entries_barrier_3_io_y_ppn : 21'h0) | (hitsVec_4 ? _entries_barrier_4_io_y_ppn : 21'h0) | (hitsVec_5 ? _entries_barrier_5_io_y_ppn : 21'h0) | (hitsVec_6 ? _entries_barrier_6_io_y_ppn : 21'h0) | (hitsVec_7 ? _entries_barrier_7_io_y_ppn : 21'h0) | (hitsVec_8 ? {_entries_barrier_8_io_y_ppn[20:18], (ignore_1 ? io_req_bits_vaddr[29:21] : 9'h0) | _entries_barrier_8_io_y_ppn[17:9], io_req_bits_vaddr[20:12] | _entries_barrier_8_io_y_ppn[8:0]} : 21'h0) | (hitsVec_9 ? {_entries_barrier_9_io_y_ppn[20:18], (ignore_4 ? io_req_bits_vaddr[29:21] : 9'h0) | _entries_barrier_9_io_y_ppn[17:9], io_req_bits_vaddr[20:12] | _entries_barrier_9_io_y_ppn[8:0]} : 21'h0) | (hitsVec_10 ? {_entries_barrier_10_io_y_ppn[20:18], (ignore_7 ? io_req_bits_vaddr[29:21] : 9'h0) | _entries_barrier_10_io_y_ppn[17:9], io_req_bits_vaddr[20:12] | _entries_barrier_10_io_y_ppn[8:0]} : 21'h0) | (hitsVec_11 ? {_entries_barrier_11_io_y_ppn[20:18], (ignore_10 ? io_req_bits_vaddr[29:21] : 9'h0) | _entries_barrier_11_io_y_ppn[17:9], io_req_bits_vaddr[20:12] | _entries_barrier_11_io_y_ppn[8:0]} : 21'h0) | (hitsVec_12 ? {_entries_barrier_12_io_y_ppn[20:18], (ignore_13 ? io_req_bits_vaddr[29:21] : 9'h0) | _entries_barrier_12_io_y_ppn[17:9], (special_entry_level[1] ? 9'h0 : io_req_bits_vaddr[20:12]) | _entries_barrier_12_io_y_ppn[8:0]} : 21'h0) | (_vm_enabled_T_1 ? 21'h0 : io_req_bits_vaddr[32:12]), io_req_bits_vaddr[11:0]};
  assign io_resp_pf_inst =
    bad_va
    | (|((~((io_req_bits_prv[0] ? ~{_entries_barrier_12_io_y_u, _entries_barrier_11_io_y_u, _entries_barrier_10_io_y_u, _entries_barrier_9_io_y_u, _entries_barrier_8_io_y_u, _entries_barrier_7_io_y_u, _entries_barrier_6_io_y_u, _entries_barrier_5_io_y_u, _entries_barrier_4_io_y_u, _entries_barrier_3_io_y_u, _entries_barrier_2_io_y_u, _entries_barrier_1_io_y_u, _entries_barrier_io_y_u} : {_entries_barrier_12_io_y_u, _entries_barrier_11_io_y_u, _entries_barrier_10_io_y_u, _entries_barrier_9_io_y_u, _entries_barrier_8_io_y_u, _entries_barrier_7_io_y_u, _entries_barrier_6_io_y_u, _entries_barrier_5_io_y_u, _entries_barrier_4_io_y_u, _entries_barrier_3_io_y_u, _entries_barrier_2_io_y_u, _entries_barrier_1_io_y_u, _entries_barrier_io_y_u}) & {_entries_barrier_12_io_y_sx, _entries_barrier_11_io_y_sx, _entries_barrier_10_io_y_sx, _entries_barrier_9_io_y_sx, _entries_barrier_8_io_y_sx, _entries_barrier_7_io_y_sx, _entries_barrier_6_io_y_sx, _entries_barrier_5_io_y_sx, _entries_barrier_4_io_y_sx, _entries_barrier_3_io_y_sx, _entries_barrier_2_io_y_sx, _entries_barrier_1_io_y_sx, _entries_barrier_io_y_sx}) & {~_entries_barrier_12_io_y_ae_ptw, ~_entries_barrier_11_io_y_ae_ptw, ~_entries_barrier_10_io_y_ae_ptw, ~_entries_barrier_9_io_y_ae_ptw, ~_entries_barrier_8_io_y_ae_ptw, ~_entries_barrier_7_io_y_ae_ptw, ~_entries_barrier_6_io_y_ae_ptw, ~_entries_barrier_5_io_y_ae_ptw, ~_entries_barrier_4_io_y_ae_ptw, ~_entries_barrier_3_io_y_ae_ptw, ~_entries_barrier_2_io_y_ae_ptw, ~_entries_barrier_1_io_y_ae_ptw, ~_entries_barrier_io_y_ae_ptw} | {_entries_barrier_12_io_y_pf, _entries_barrier_11_io_y_pf, _entries_barrier_10_io_y_pf, _entries_barrier_9_io_y_pf, _entries_barrier_8_io_y_pf, _entries_barrier_7_io_y_pf, _entries_barrier_6_io_y_pf, _entries_barrier_5_io_y_pf, _entries_barrier_4_io_y_pf, _entries_barrier_3_io_y_pf, _entries_barrier_2_io_y_pf, _entries_barrier_1_io_y_pf, _entries_barrier_io_y_pf})
         & {~_entries_barrier_12_io_y_gf, ~_entries_barrier_11_io_y_gf, ~_entries_barrier_10_io_y_gf, ~_entries_barrier_9_io_y_gf, ~_entries_barrier_8_io_y_gf, ~_entries_barrier_7_io_y_gf, ~_entries_barrier_6_io_y_gf, ~_entries_barrier_5_io_y_gf, ~_entries_barrier_4_io_y_gf, ~_entries_barrier_3_io_y_gf, ~_entries_barrier_2_io_y_gf, ~_entries_barrier_1_io_y_gf, ~_entries_barrier_io_y_gf} & {hitsVec_12, hitsVec_11, hitsVec_10, hitsVec_9, hitsVec_8, hitsVec_7, hitsVec_6, hitsVec_5, hitsVec_4, hitsVec_3, hitsVec_2, hitsVec_1, hitsVec_0}));
  assign io_resp_ae_inst = |(~({{2{newEntry_px}}, _entries_barrier_11_io_y_px, _entries_barrier_10_io_y_px, _entries_barrier_9_io_y_px, _entries_barrier_8_io_y_px, _entries_barrier_7_io_y_px, _entries_barrier_6_io_y_px, _entries_barrier_5_io_y_px, _entries_barrier_4_io_y_px, _entries_barrier_3_io_y_px, _entries_barrier_2_io_y_px, _entries_barrier_1_io_y_px, _entries_barrier_io_y_px} & {1'h1, ~(_entries_barrier_12_io_y_ae_ptw | _entries_barrier_12_io_y_ae_final), ~(_entries_barrier_11_io_y_ae_ptw | _entries_barrier_11_io_y_ae_final), ~(_entries_barrier_10_io_y_ae_ptw | _entries_barrier_10_io_y_ae_final), ~(_entries_barrier_9_io_y_ae_ptw | _entries_barrier_9_io_y_ae_final), ~(_entries_barrier_8_io_y_ae_ptw | _entries_barrier_8_io_y_ae_final), ~(_entries_barrier_7_io_y_ae_ptw | _entries_barrier_7_io_y_ae_final), ~(_entries_barrier_6_io_y_ae_ptw | _entries_barrier_6_io_y_ae_final), ~(_entries_barrier_5_io_y_ae_ptw | _entries_barrier_5_io_y_ae_final), ~(_entries_barrier_4_io_y_ae_ptw | _entries_barrier_4_io_y_ae_final), ~(_entries_barrier_3_io_y_ae_ptw | _entries_barrier_3_io_y_ae_final), ~(_entries_barrier_2_io_y_ae_ptw | _entries_barrier_2_io_y_ae_final), ~(_entries_barrier_1_io_y_ae_ptw | _entries_barrier_1_io_y_ae_final), ~(_entries_barrier_io_y_ae_ptw | _entries_barrier_io_y_ae_final)}) & {~_vm_enabled_T_1, hitsVec_12, hitsVec_11, hitsVec_10, hitsVec_9, hitsVec_8, hitsVec_7, hitsVec_6, hitsVec_5, hitsVec_4, hitsVec_3, hitsVec_2, hitsVec_1, hitsVec_0});
  assign io_ptw_req_valid = _io_ptw_req_valid_T;
  assign io_ptw_req_bits_bits_addr = r_refill_tag;
  assign io_ptw_req_bits_bits_need_gpa = r_need_gpa;
endmodule

