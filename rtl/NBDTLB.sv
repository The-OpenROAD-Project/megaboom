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

module NBDTLB(
  input         clock,
                reset,
                io_req_0_valid,
  input  [39:0] io_req_0_bits_vaddr,
  input         io_req_0_bits_passthrough,
  input  [1:0]  io_req_0_bits_size,
  input  [4:0]  io_req_0_bits_cmd,
  input         io_req_1_valid,
  input  [39:0] io_req_1_bits_vaddr,
  input         io_req_1_bits_passthrough,
  input  [1:0]  io_req_1_bits_size,
  input  [4:0]  io_req_1_bits_cmd,
  output        io_miss_rdy,
                io_resp_0_miss,
  output [32:0] io_resp_0_paddr,
  output        io_resp_0_pf_ld,
                io_resp_0_pf_st,
                io_resp_0_ae_ld,
                io_resp_0_ae_st,
                io_resp_0_cacheable,
                io_resp_1_miss,
  output [32:0] io_resp_1_paddr,
  output        io_resp_1_pf_ld,
                io_resp_1_pf_st,
                io_resp_1_ae_ld,
                io_resp_1_ae_st,
                io_resp_1_ma_ld,
                io_resp_1_ma_st,
                io_resp_1_cacheable,
  input         io_sfence_valid,
                io_sfence_bits_rs1,
                io_sfence_bits_rs2,
  input  [38:0] io_sfence_bits_addr,
  input         io_ptw_req_ready,
  output        io_ptw_req_valid,
                io_ptw_req_bits_valid,
  output [26:0] io_ptw_req_bits_bits_addr,
  input         io_ptw_resp_valid,
                io_ptw_resp_bits_ae_final,
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
  input  [1:0]  io_ptw_status_dprv,
  input         io_ptw_status_mxr,
                io_ptw_status_sum,
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
  input  [32:0] io_ptw_pmp_7_mask,
  input         io_kill
);

  wire        _normal_entries_barrier_23_io_y_pw;
  wire        _normal_entries_barrier_23_io_y_pr;
  wire        _normal_entries_barrier_23_io_y_pal;
  wire        _normal_entries_barrier_23_io_y_paa;
  wire        _normal_entries_barrier_23_io_y_eff;
  wire        _normal_entries_barrier_23_io_y_c;
  wire        _normal_entries_barrier_22_io_y_pw;
  wire        _normal_entries_barrier_22_io_y_pr;
  wire        _normal_entries_barrier_22_io_y_pal;
  wire        _normal_entries_barrier_22_io_y_paa;
  wire        _normal_entries_barrier_22_io_y_eff;
  wire        _normal_entries_barrier_22_io_y_c;
  wire        _normal_entries_barrier_21_io_y_pw;
  wire        _normal_entries_barrier_21_io_y_pr;
  wire        _normal_entries_barrier_21_io_y_pal;
  wire        _normal_entries_barrier_21_io_y_paa;
  wire        _normal_entries_barrier_21_io_y_eff;
  wire        _normal_entries_barrier_21_io_y_c;
  wire        _normal_entries_barrier_20_io_y_pw;
  wire        _normal_entries_barrier_20_io_y_pr;
  wire        _normal_entries_barrier_20_io_y_pal;
  wire        _normal_entries_barrier_20_io_y_paa;
  wire        _normal_entries_barrier_20_io_y_eff;
  wire        _normal_entries_barrier_20_io_y_c;
  wire        _normal_entries_barrier_19_io_y_pw;
  wire        _normal_entries_barrier_19_io_y_pr;
  wire        _normal_entries_barrier_19_io_y_pal;
  wire        _normal_entries_barrier_19_io_y_paa;
  wire        _normal_entries_barrier_19_io_y_eff;
  wire        _normal_entries_barrier_19_io_y_c;
  wire        _normal_entries_barrier_18_io_y_pw;
  wire        _normal_entries_barrier_18_io_y_pr;
  wire        _normal_entries_barrier_18_io_y_pal;
  wire        _normal_entries_barrier_18_io_y_paa;
  wire        _normal_entries_barrier_18_io_y_eff;
  wire        _normal_entries_barrier_18_io_y_c;
  wire        _normal_entries_barrier_17_io_y_pw;
  wire        _normal_entries_barrier_17_io_y_pr;
  wire        _normal_entries_barrier_17_io_y_pal;
  wire        _normal_entries_barrier_17_io_y_paa;
  wire        _normal_entries_barrier_17_io_y_eff;
  wire        _normal_entries_barrier_17_io_y_c;
  wire        _normal_entries_barrier_16_io_y_pw;
  wire        _normal_entries_barrier_16_io_y_pr;
  wire        _normal_entries_barrier_16_io_y_pal;
  wire        _normal_entries_barrier_16_io_y_paa;
  wire        _normal_entries_barrier_16_io_y_eff;
  wire        _normal_entries_barrier_16_io_y_c;
  wire        _normal_entries_barrier_15_io_y_pw;
  wire        _normal_entries_barrier_15_io_y_pr;
  wire        _normal_entries_barrier_15_io_y_pal;
  wire        _normal_entries_barrier_15_io_y_paa;
  wire        _normal_entries_barrier_15_io_y_eff;
  wire        _normal_entries_barrier_15_io_y_c;
  wire        _normal_entries_barrier_14_io_y_pw;
  wire        _normal_entries_barrier_14_io_y_pr;
  wire        _normal_entries_barrier_14_io_y_pal;
  wire        _normal_entries_barrier_14_io_y_paa;
  wire        _normal_entries_barrier_14_io_y_eff;
  wire        _normal_entries_barrier_14_io_y_c;
  wire        _normal_entries_barrier_13_io_y_pw;
  wire        _normal_entries_barrier_13_io_y_pr;
  wire        _normal_entries_barrier_13_io_y_pal;
  wire        _normal_entries_barrier_13_io_y_paa;
  wire        _normal_entries_barrier_13_io_y_eff;
  wire        _normal_entries_barrier_13_io_y_c;
  wire        _normal_entries_barrier_12_io_y_pw;
  wire        _normal_entries_barrier_12_io_y_pr;
  wire        _normal_entries_barrier_12_io_y_pal;
  wire        _normal_entries_barrier_12_io_y_paa;
  wire        _normal_entries_barrier_12_io_y_eff;
  wire        _normal_entries_barrier_12_io_y_c;
  wire        _normal_entries_barrier_11_io_y_pw;
  wire        _normal_entries_barrier_11_io_y_pr;
  wire        _normal_entries_barrier_11_io_y_pal;
  wire        _normal_entries_barrier_11_io_y_paa;
  wire        _normal_entries_barrier_11_io_y_eff;
  wire        _normal_entries_barrier_11_io_y_c;
  wire        _normal_entries_barrier_10_io_y_pw;
  wire        _normal_entries_barrier_10_io_y_pr;
  wire        _normal_entries_barrier_10_io_y_pal;
  wire        _normal_entries_barrier_10_io_y_paa;
  wire        _normal_entries_barrier_10_io_y_eff;
  wire        _normal_entries_barrier_10_io_y_c;
  wire        _normal_entries_barrier_9_io_y_pw;
  wire        _normal_entries_barrier_9_io_y_pr;
  wire        _normal_entries_barrier_9_io_y_pal;
  wire        _normal_entries_barrier_9_io_y_paa;
  wire        _normal_entries_barrier_9_io_y_eff;
  wire        _normal_entries_barrier_9_io_y_c;
  wire        _normal_entries_barrier_8_io_y_pw;
  wire        _normal_entries_barrier_8_io_y_pr;
  wire        _normal_entries_barrier_8_io_y_pal;
  wire        _normal_entries_barrier_8_io_y_paa;
  wire        _normal_entries_barrier_8_io_y_eff;
  wire        _normal_entries_barrier_8_io_y_c;
  wire        _normal_entries_barrier_7_io_y_pw;
  wire        _normal_entries_barrier_7_io_y_pr;
  wire        _normal_entries_barrier_7_io_y_pal;
  wire        _normal_entries_barrier_7_io_y_paa;
  wire        _normal_entries_barrier_7_io_y_eff;
  wire        _normal_entries_barrier_7_io_y_c;
  wire        _normal_entries_barrier_6_io_y_pw;
  wire        _normal_entries_barrier_6_io_y_pr;
  wire        _normal_entries_barrier_6_io_y_pal;
  wire        _normal_entries_barrier_6_io_y_paa;
  wire        _normal_entries_barrier_6_io_y_eff;
  wire        _normal_entries_barrier_6_io_y_c;
  wire        _normal_entries_barrier_5_io_y_pw;
  wire        _normal_entries_barrier_5_io_y_pr;
  wire        _normal_entries_barrier_5_io_y_pal;
  wire        _normal_entries_barrier_5_io_y_paa;
  wire        _normal_entries_barrier_5_io_y_eff;
  wire        _normal_entries_barrier_5_io_y_c;
  wire        _normal_entries_barrier_4_io_y_pw;
  wire        _normal_entries_barrier_4_io_y_pr;
  wire        _normal_entries_barrier_4_io_y_pal;
  wire        _normal_entries_barrier_4_io_y_paa;
  wire        _normal_entries_barrier_4_io_y_eff;
  wire        _normal_entries_barrier_4_io_y_c;
  wire        _normal_entries_barrier_3_io_y_pw;
  wire        _normal_entries_barrier_3_io_y_pr;
  wire        _normal_entries_barrier_3_io_y_pal;
  wire        _normal_entries_barrier_3_io_y_paa;
  wire        _normal_entries_barrier_3_io_y_eff;
  wire        _normal_entries_barrier_3_io_y_c;
  wire        _normal_entries_barrier_2_io_y_pw;
  wire        _normal_entries_barrier_2_io_y_pr;
  wire        _normal_entries_barrier_2_io_y_pal;
  wire        _normal_entries_barrier_2_io_y_paa;
  wire        _normal_entries_barrier_2_io_y_eff;
  wire        _normal_entries_barrier_2_io_y_c;
  wire        _normal_entries_barrier_1_io_y_pw;
  wire        _normal_entries_barrier_1_io_y_pr;
  wire        _normal_entries_barrier_1_io_y_pal;
  wire        _normal_entries_barrier_1_io_y_paa;
  wire        _normal_entries_barrier_1_io_y_eff;
  wire        _normal_entries_barrier_1_io_y_c;
  wire        _normal_entries_barrier_io_y_pw;
  wire        _normal_entries_barrier_io_y_pr;
  wire        _normal_entries_barrier_io_y_pal;
  wire        _normal_entries_barrier_io_y_paa;
  wire        _normal_entries_barrier_io_y_eff;
  wire        _normal_entries_barrier_io_y_c;
  wire        _entries_barrier_25_io_y_u;
  wire        _entries_barrier_25_io_y_ae;
  wire        _entries_barrier_25_io_y_sw;
  wire        _entries_barrier_25_io_y_sx;
  wire        _entries_barrier_25_io_y_sr;
  wire        _entries_barrier_24_io_y_u;
  wire        _entries_barrier_24_io_y_ae;
  wire        _entries_barrier_24_io_y_sw;
  wire        _entries_barrier_24_io_y_sx;
  wire        _entries_barrier_24_io_y_sr;
  wire        _entries_barrier_23_io_y_u;
  wire        _entries_barrier_23_io_y_ae;
  wire        _entries_barrier_23_io_y_sw;
  wire        _entries_barrier_23_io_y_sx;
  wire        _entries_barrier_23_io_y_sr;
  wire        _entries_barrier_22_io_y_u;
  wire        _entries_barrier_22_io_y_ae;
  wire        _entries_barrier_22_io_y_sw;
  wire        _entries_barrier_22_io_y_sx;
  wire        _entries_barrier_22_io_y_sr;
  wire        _entries_barrier_21_io_y_u;
  wire        _entries_barrier_21_io_y_ae;
  wire        _entries_barrier_21_io_y_sw;
  wire        _entries_barrier_21_io_y_sx;
  wire        _entries_barrier_21_io_y_sr;
  wire        _entries_barrier_20_io_y_u;
  wire        _entries_barrier_20_io_y_ae;
  wire        _entries_barrier_20_io_y_sw;
  wire        _entries_barrier_20_io_y_sx;
  wire        _entries_barrier_20_io_y_sr;
  wire        _entries_barrier_19_io_y_u;
  wire        _entries_barrier_19_io_y_ae;
  wire        _entries_barrier_19_io_y_sw;
  wire        _entries_barrier_19_io_y_sx;
  wire        _entries_barrier_19_io_y_sr;
  wire        _entries_barrier_18_io_y_u;
  wire        _entries_barrier_18_io_y_ae;
  wire        _entries_barrier_18_io_y_sw;
  wire        _entries_barrier_18_io_y_sx;
  wire        _entries_barrier_18_io_y_sr;
  wire        _entries_barrier_17_io_y_u;
  wire        _entries_barrier_17_io_y_ae;
  wire        _entries_barrier_17_io_y_sw;
  wire        _entries_barrier_17_io_y_sx;
  wire        _entries_barrier_17_io_y_sr;
  wire        _entries_barrier_16_io_y_u;
  wire        _entries_barrier_16_io_y_ae;
  wire        _entries_barrier_16_io_y_sw;
  wire        _entries_barrier_16_io_y_sx;
  wire        _entries_barrier_16_io_y_sr;
  wire        _entries_barrier_15_io_y_u;
  wire        _entries_barrier_15_io_y_ae;
  wire        _entries_barrier_15_io_y_sw;
  wire        _entries_barrier_15_io_y_sx;
  wire        _entries_barrier_15_io_y_sr;
  wire        _entries_barrier_14_io_y_u;
  wire        _entries_barrier_14_io_y_ae;
  wire        _entries_barrier_14_io_y_sw;
  wire        _entries_barrier_14_io_y_sx;
  wire        _entries_barrier_14_io_y_sr;
  wire        _entries_barrier_13_io_y_u;
  wire        _entries_barrier_13_io_y_ae;
  wire        _entries_barrier_13_io_y_sw;
  wire        _entries_barrier_13_io_y_sx;
  wire        _entries_barrier_13_io_y_sr;
  wire        _entries_barrier_12_io_y_u;
  wire        _entries_barrier_12_io_y_ae;
  wire        _entries_barrier_12_io_y_sw;
  wire        _entries_barrier_12_io_y_sx;
  wire        _entries_barrier_12_io_y_sr;
  wire        _entries_barrier_11_io_y_u;
  wire        _entries_barrier_11_io_y_ae;
  wire        _entries_barrier_11_io_y_sw;
  wire        _entries_barrier_11_io_y_sx;
  wire        _entries_barrier_11_io_y_sr;
  wire        _entries_barrier_10_io_y_u;
  wire        _entries_barrier_10_io_y_ae;
  wire        _entries_barrier_10_io_y_sw;
  wire        _entries_barrier_10_io_y_sx;
  wire        _entries_barrier_10_io_y_sr;
  wire        _entries_barrier_9_io_y_u;
  wire        _entries_barrier_9_io_y_ae;
  wire        _entries_barrier_9_io_y_sw;
  wire        _entries_barrier_9_io_y_sx;
  wire        _entries_barrier_9_io_y_sr;
  wire        _entries_barrier_8_io_y_u;
  wire        _entries_barrier_8_io_y_ae;
  wire        _entries_barrier_8_io_y_sw;
  wire        _entries_barrier_8_io_y_sx;
  wire        _entries_barrier_8_io_y_sr;
  wire        _entries_barrier_7_io_y_u;
  wire        _entries_barrier_7_io_y_ae;
  wire        _entries_barrier_7_io_y_sw;
  wire        _entries_barrier_7_io_y_sx;
  wire        _entries_barrier_7_io_y_sr;
  wire        _entries_barrier_6_io_y_u;
  wire        _entries_barrier_6_io_y_ae;
  wire        _entries_barrier_6_io_y_sw;
  wire        _entries_barrier_6_io_y_sx;
  wire        _entries_barrier_6_io_y_sr;
  wire        _entries_barrier_5_io_y_u;
  wire        _entries_barrier_5_io_y_ae;
  wire        _entries_barrier_5_io_y_sw;
  wire        _entries_barrier_5_io_y_sx;
  wire        _entries_barrier_5_io_y_sr;
  wire        _entries_barrier_4_io_y_u;
  wire        _entries_barrier_4_io_y_ae;
  wire        _entries_barrier_4_io_y_sw;
  wire        _entries_barrier_4_io_y_sx;
  wire        _entries_barrier_4_io_y_sr;
  wire        _entries_barrier_3_io_y_u;
  wire        _entries_barrier_3_io_y_ae;
  wire        _entries_barrier_3_io_y_sw;
  wire        _entries_barrier_3_io_y_sx;
  wire        _entries_barrier_3_io_y_sr;
  wire        _entries_barrier_2_io_y_u;
  wire        _entries_barrier_2_io_y_ae;
  wire        _entries_barrier_2_io_y_sw;
  wire        _entries_barrier_2_io_y_sx;
  wire        _entries_barrier_2_io_y_sr;
  wire        _entries_barrier_1_io_y_u;
  wire        _entries_barrier_1_io_y_ae;
  wire        _entries_barrier_1_io_y_sw;
  wire        _entries_barrier_1_io_y_sx;
  wire        _entries_barrier_1_io_y_sr;
  wire        _entries_barrier_io_y_u;
  wire        _entries_barrier_io_y_ae;
  wire        _entries_barrier_io_y_sw;
  wire        _entries_barrier_io_y_sx;
  wire        _entries_barrier_io_y_sr;
  wire [20:0] _ppn_data_barrier_25_io_y_ppn;
  wire [20:0] _ppn_data_barrier_24_io_y_ppn;
  wire [20:0] _ppn_data_barrier_23_io_y_ppn;
  wire [20:0] _ppn_data_barrier_22_io_y_ppn;
  wire [20:0] _ppn_data_barrier_21_io_y_ppn;
  wire [20:0] _ppn_data_barrier_20_io_y_ppn;
  wire [20:0] _ppn_data_barrier_19_io_y_ppn;
  wire [20:0] _ppn_data_barrier_18_io_y_ppn;
  wire [20:0] _ppn_data_barrier_17_io_y_ppn;
  wire [20:0] _ppn_data_barrier_16_io_y_ppn;
  wire [20:0] _ppn_data_barrier_15_io_y_ppn;
  wire [20:0] _ppn_data_barrier_14_io_y_ppn;
  wire [20:0] _ppn_data_barrier_13_io_y_ppn;
  wire [20:0] _ppn_data_barrier_12_io_y_ppn;
  wire [20:0] _ppn_data_barrier_11_io_y_ppn;
  wire [20:0] _ppn_data_barrier_10_io_y_ppn;
  wire [20:0] _ppn_data_barrier_9_io_y_ppn;
  wire [20:0] _ppn_data_barrier_8_io_y_ppn;
  wire [20:0] _ppn_data_barrier_7_io_y_ppn;
  wire [20:0] _ppn_data_barrier_6_io_y_ppn;
  wire [20:0] _ppn_data_barrier_5_io_y_ppn;
  wire [20:0] _ppn_data_barrier_4_io_y_ppn;
  wire [20:0] _ppn_data_barrier_3_io_y_ppn;
  wire [20:0] _ppn_data_barrier_2_io_y_ppn;
  wire [20:0] _ppn_data_barrier_1_io_y_ppn;
  wire [20:0] _ppn_data_barrier_io_y_ppn;
  wire        _pmp_1_io_r;
  wire        _pmp_1_io_w;
  wire        _pmp_0_io_r;
  wire        _pmp_0_io_w;
  wire        _pmp_0_io_x;
  wire [20:0] _mpu_ppn_data_barrier_1_io_y_ppn;
  wire [20:0] _mpu_ppn_data_barrier_io_y_ppn;
  reg  [26:0] sectored_entries_0_tag;
  reg  [34:0] sectored_entries_0_data_0;
  reg  [34:0] sectored_entries_0_data_1;
  reg  [34:0] sectored_entries_0_data_2;
  reg  [34:0] sectored_entries_0_data_3;
  reg         sectored_entries_0_valid_0;
  reg         sectored_entries_0_valid_1;
  reg         sectored_entries_0_valid_2;
  reg         sectored_entries_0_valid_3;
  reg  [26:0] sectored_entries_1_tag;
  reg  [34:0] sectored_entries_1_data_0;
  reg  [34:0] sectored_entries_1_data_1;
  reg  [34:0] sectored_entries_1_data_2;
  reg  [34:0] sectored_entries_1_data_3;
  reg         sectored_entries_1_valid_0;
  reg         sectored_entries_1_valid_1;
  reg         sectored_entries_1_valid_2;
  reg         sectored_entries_1_valid_3;
  reg  [26:0] sectored_entries_2_tag;
  reg  [34:0] sectored_entries_2_data_0;
  reg  [34:0] sectored_entries_2_data_1;
  reg  [34:0] sectored_entries_2_data_2;
  reg  [34:0] sectored_entries_2_data_3;
  reg         sectored_entries_2_valid_0;
  reg         sectored_entries_2_valid_1;
  reg         sectored_entries_2_valid_2;
  reg         sectored_entries_2_valid_3;
  reg  [26:0] sectored_entries_3_tag;
  reg  [34:0] sectored_entries_3_data_0;
  reg  [34:0] sectored_entries_3_data_1;
  reg  [34:0] sectored_entries_3_data_2;
  reg  [34:0] sectored_entries_3_data_3;
  reg         sectored_entries_3_valid_0;
  reg         sectored_entries_3_valid_1;
  reg         sectored_entries_3_valid_2;
  reg         sectored_entries_3_valid_3;
  reg  [26:0] sectored_entries_4_tag;
  reg  [34:0] sectored_entries_4_data_0;
  reg  [34:0] sectored_entries_4_data_1;
  reg  [34:0] sectored_entries_4_data_2;
  reg  [34:0] sectored_entries_4_data_3;
  reg         sectored_entries_4_valid_0;
  reg         sectored_entries_4_valid_1;
  reg         sectored_entries_4_valid_2;
  reg         sectored_entries_4_valid_3;
  reg  [26:0] sectored_entries_5_tag;
  reg  [34:0] sectored_entries_5_data_0;
  reg  [34:0] sectored_entries_5_data_1;
  reg  [34:0] sectored_entries_5_data_2;
  reg  [34:0] sectored_entries_5_data_3;
  reg         sectored_entries_5_valid_0;
  reg         sectored_entries_5_valid_1;
  reg         sectored_entries_5_valid_2;
  reg         sectored_entries_5_valid_3;
  reg  [26:0] sectored_entries_6_tag;
  reg  [34:0] sectored_entries_6_data_0;
  reg  [34:0] sectored_entries_6_data_1;
  reg  [34:0] sectored_entries_6_data_2;
  reg  [34:0] sectored_entries_6_data_3;
  reg         sectored_entries_6_valid_0;
  reg         sectored_entries_6_valid_1;
  reg         sectored_entries_6_valid_2;
  reg         sectored_entries_6_valid_3;
  reg  [26:0] sectored_entries_7_tag;
  reg  [34:0] sectored_entries_7_data_0;
  reg  [34:0] sectored_entries_7_data_1;
  reg  [34:0] sectored_entries_7_data_2;
  reg  [34:0] sectored_entries_7_data_3;
  reg         sectored_entries_7_valid_0;
  reg         sectored_entries_7_valid_1;
  reg         sectored_entries_7_valid_2;
  reg         sectored_entries_7_valid_3;
  reg  [1:0]  superpage_entries_0_level;
  reg  [26:0] superpage_entries_0_tag;
  reg  [34:0] superpage_entries_0_data_0;
  reg         superpage_entries_0_valid_0;
  reg  [1:0]  superpage_entries_1_level;
  reg  [26:0] superpage_entries_1_tag;
  reg  [34:0] superpage_entries_1_data_0;
  reg         superpage_entries_1_valid_0;
  reg  [1:0]  superpage_entries_2_level;
  reg  [26:0] superpage_entries_2_tag;
  reg  [34:0] superpage_entries_2_data_0;
  reg         superpage_entries_2_valid_0;
  reg  [1:0]  superpage_entries_3_level;
  reg  [26:0] superpage_entries_3_tag;
  reg  [34:0] superpage_entries_3_data_0;
  reg         superpage_entries_3_valid_0;
  reg  [1:0]  special_entry_level;
  reg  [26:0] special_entry_tag;
  reg  [34:0] special_entry_data_0;
  reg         special_entry_valid_0;
  reg  [1:0]  state;
  reg  [26:0] r_refill_tag;
  reg  [1:0]  r_superpage_repl_addr;
  reg  [2:0]  r_sectored_repl_addr;
  reg  [2:0]  r_sectored_hit_addr;
  reg         r_sectored_hit;
  wire        vm_enabled_0 = io_ptw_ptbr_mode[3] & ~(io_ptw_status_dprv[1]) & ~io_req_0_bits_passthrough;
  wire        vm_enabled_1 = io_ptw_ptbr_mode[3] & ~(io_ptw_status_dprv[1]) & ~io_req_1_bits_passthrough;
  wire        _io_ptw_req_valid_T = state == 2'h1;
  wire        ignore_13 = special_entry_level == 2'h0;
  wire [27:0] _GEN = {7'h0, io_ptw_resp_bits_pte_ppn[20:0]};
  wire [27:0] mpu_ppn_0 = io_ptw_resp_valid ? _GEN : vm_enabled_0 ? {7'h0, _mpu_ppn_data_barrier_io_y_ppn[20:18], (ignore_13 ? io_req_0_bits_vaddr[29:21] : 9'h0) | _mpu_ppn_data_barrier_io_y_ppn[17:9], (special_entry_level[1] ? 9'h0 : io_req_0_bits_vaddr[20:12]) | _mpu_ppn_data_barrier_io_y_ppn[8:0]} : io_req_0_bits_vaddr[39:12];
  wire [27:0] mpu_ppn_1 = io_ptw_resp_valid ? _GEN : vm_enabled_1 ? {7'h0, _mpu_ppn_data_barrier_1_io_y_ppn[20:18], (ignore_13 ? io_req_1_bits_vaddr[29:21] : 9'h0) | _mpu_ppn_data_barrier_1_io_y_ppn[17:9], (special_entry_level[1] ? 9'h0 : io_req_1_bits_vaddr[20:12]) | _mpu_ppn_data_barrier_1_io_y_ppn[8:0]} : io_req_1_bits_vaddr[39:12];
  wire [13:0] _GEN_0 = mpu_ppn_0[13:0] ^ 14'h2010;
  wire [9:0]  _GEN_1 = mpu_ppn_0[13:4] ^ 10'h200;
  wire [8:0]  _GEN_2 = mpu_ppn_0[8:0] ^ 9'h100;
  wire [11:0] _GEN_3 = mpu_ppn_0[15:4] ^ 12'h800;
  wire        legal_address_0 = {mpu_ppn_0[27:2], ~(mpu_ppn_0[1:0])} == 28'h0 | {mpu_ppn_0[27:14], _GEN_0} == 28'h0 | {mpu_ppn_0[27:1], ~(mpu_ppn_0[0])} == 28'h0 | {mpu_ppn_0[27:17], mpu_ppn_0[16:0] ^ 17'h10020} == 28'h0 | {mpu_ppn_0[27:16], ~(mpu_ppn_0[15:14])} == 14'h0 | {mpu_ppn_0[27:14], _GEN_1} == 24'h0 | mpu_ppn_0 == 28'h0 | {mpu_ppn_0[27:5], ~(mpu_ppn_0[4])} == 24'h0 | {mpu_ppn_0[27:9], _GEN_2} == 28'h0 | {mpu_ppn_0[27:9], mpu_ppn_0[8:0] ^ 9'h110} == 28'h0 | {mpu_ppn_0[27:20], ~(mpu_ppn_0[19])} == 9'h0 | {mpu_ppn_0[27:21], mpu_ppn_0[20:19] ^ 2'h2} == 9'h0 | {mpu_ppn_0[27:16], _GEN_3} == 24'h0;
  wire [13:0] _GEN_4 = mpu_ppn_1[13:0] ^ 14'h2010;
  wire [9:0]  _GEN_5 = mpu_ppn_1[13:4] ^ 10'h200;
  wire [8:0]  _GEN_6 = mpu_ppn_1[8:0] ^ 9'h100;
  wire [11:0] _GEN_7 = mpu_ppn_1[15:4] ^ 12'h800;
  wire        legal_address_1 = {mpu_ppn_1[27:2], ~(mpu_ppn_1[1:0])} == 28'h0 | {mpu_ppn_1[27:14], _GEN_4} == 28'h0 | {mpu_ppn_1[27:1], ~(mpu_ppn_1[0])} == 28'h0 | {mpu_ppn_1[27:17], mpu_ppn_1[16:0] ^ 17'h10020} == 28'h0 | {mpu_ppn_1[27:16], ~(mpu_ppn_1[15:14])} == 14'h0 | {mpu_ppn_1[27:14], _GEN_5} == 24'h0 | mpu_ppn_1 == 28'h0 | {mpu_ppn_1[27:5], ~(mpu_ppn_1[4])} == 24'h0 | {mpu_ppn_1[27:9], _GEN_6} == 28'h0 | {mpu_ppn_1[27:9], mpu_ppn_1[8:0] ^ 9'h110} == 28'h0 | {mpu_ppn_1[27:20], ~(mpu_ppn_1[19])} == 9'h0 | {mpu_ppn_1[27:21], mpu_ppn_1[20:19] ^ 2'h2} == 9'h0 | {mpu_ppn_1[27:16], _GEN_7} == 24'h0;
  wire [1:0]  _GEN_8 = {mpu_ppn_0[20], ~(mpu_ppn_0[19])};
  wire        _GEN_9 = mpu_ppn_0[20:19] != 2'h2;
  wire        newEntry_c = legal_address_0 & ({mpu_ppn_0[20:19], _GEN_3[11:10], mpu_ppn_0[4]} == 5'h0 | ~(|_GEN_8) | ~_GEN_9);
  wire [1:0]  _GEN_10 = {mpu_ppn_1[20], ~(mpu_ppn_1[19])};
  wire        _GEN_11 = mpu_ppn_1[20:19] != 2'h2;
  wire [3:0]  _GEN_12 = mpu_ppn_0[16:13] ^ 4'h8;
  wire [3:0]  _GEN_13 = mpu_ppn_1[16:13] ^ 4'h8;
  wire        newEntry_pr = legal_address_0 & _pmp_0_io_r;
  wire [5:0]  _GEN_14 = {mpu_ppn_0[20:19], mpu_ppn_0[16:15], mpu_ppn_0[8], mpu_ppn_0[4]};
  wire [6:0]  _GEN_15 = {mpu_ppn_0[20:19], mpu_ppn_0[16:15], mpu_ppn_0[13], _GEN_2[8], mpu_ppn_0[0]};
  wire [7:0]  _GEN_16 = {mpu_ppn_0[20:19], mpu_ppn_0[16:15], _GEN_0[13], mpu_ppn_0[8], _GEN_0[4], mpu_ppn_0[0]};
  wire [3:0]  _GEN_17 = {mpu_ppn_0[20:19], mpu_ppn_0[16], _GEN_3[11]};
  wire [6:0]  _GEN_18 = {mpu_ppn_0[20:19], mpu_ppn_0[16], _GEN_3[11], mpu_ppn_0[13], mpu_ppn_0[8], mpu_ppn_0[4]};
  wire [7:0]  _GEN_19 = {mpu_ppn_0[20:19], _GEN_12[3:2], mpu_ppn_0[13], mpu_ppn_0[8], mpu_ppn_0[4], mpu_ppn_0[0]};
  wire        newEntry_pw = legal_address_0 & (~(|_GEN_14) | ~(|_GEN_15) | ~(|_GEN_16) | ~(|_GEN_17) | ~(|_GEN_18) | ~(|_GEN_19) | ~(|_GEN_8) | ~_GEN_9) & _pmp_0_io_w;
  wire [5:0]  _GEN_20 = {mpu_ppn_1[20:19], mpu_ppn_1[16:15], mpu_ppn_1[8], mpu_ppn_1[4]};
  wire [6:0]  _GEN_21 = {mpu_ppn_1[20:19], mpu_ppn_1[16:15], mpu_ppn_1[13], _GEN_6[8], mpu_ppn_1[0]};
  wire [7:0]  _GEN_22 = {mpu_ppn_1[20:19], mpu_ppn_1[16:15], _GEN_4[13], mpu_ppn_1[8], _GEN_4[4], mpu_ppn_1[0]};
  wire [3:0]  _GEN_23 = {mpu_ppn_1[20:19], mpu_ppn_1[16], _GEN_7[11]};
  wire [6:0]  _GEN_24 = {mpu_ppn_1[20:19], mpu_ppn_1[16], _GEN_7[11], mpu_ppn_1[13], mpu_ppn_1[8], mpu_ppn_1[4]};
  wire [7:0]  _GEN_25 = {mpu_ppn_1[20:19], _GEN_13[3:2], mpu_ppn_1[13], mpu_ppn_1[8], mpu_ppn_1[4], mpu_ppn_1[0]};
  wire        newEntry_pal = legal_address_0 & (~(|_GEN_14) | ~(|_GEN_15) | ~(|_GEN_16) | ~(|_GEN_17) | ~(|_GEN_18) | ~(|_GEN_19) | ~(|_GEN_8) | ~_GEN_9);
  wire        newEntry_paa = legal_address_0 & (~(|_GEN_14) | ~(|_GEN_15) | ~(|_GEN_16) | ~(|_GEN_17) | ~(|_GEN_18) | ~(|_GEN_19) | ~(|_GEN_8) | ~_GEN_9);
  wire        newEntry_eff = legal_address_0 & ({mpu_ppn_0[20:19], mpu_ppn_0[16:13], mpu_ppn_0[8], mpu_ppn_0[4], mpu_ppn_0[1]} == 9'h0 | {mpu_ppn_0[20:19], mpu_ppn_0[16:13], _GEN_2[8], mpu_ppn_0[1:0]} == 9'h0 | {mpu_ppn_0[20:19], mpu_ppn_0[16:14], _GEN_1[9], mpu_ppn_0[8], mpu_ppn_0[4]} == 8'h0 | {mpu_ppn_0[20:19], mpu_ppn_0[16:14], _GEN_0[13], mpu_ppn_0[8], _GEN_0[4], mpu_ppn_0[1:0]} == 10'h0 | {mpu_ppn_0[20:19], mpu_ppn_0[16], ~(mpu_ppn_0[15:14])} == 5'h0 | {mpu_ppn_0[20:19], _GEN_12, mpu_ppn_0[8], mpu_ppn_0[4], mpu_ppn_0[1:0]} == 10'h0);
  wire [24:0] _hitsVec_T = sectored_entries_0_tag[26:2] ^ io_req_0_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_5 = sectored_entries_1_tag[26:2] ^ io_req_0_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_10 = sectored_entries_2_tag[26:2] ^ io_req_0_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_15 = sectored_entries_3_tag[26:2] ^ io_req_0_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_20 = sectored_entries_4_tag[26:2] ^ io_req_0_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_25 = sectored_entries_5_tag[26:2] ^ io_req_0_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_30 = sectored_entries_6_tag[26:2] ^ io_req_0_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_35 = sectored_entries_7_tag[26:2] ^ io_req_0_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_120 = sectored_entries_0_tag[26:2] ^ io_req_1_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_125 = sectored_entries_1_tag[26:2] ^ io_req_1_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_130 = sectored_entries_2_tag[26:2] ^ io_req_1_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_135 = sectored_entries_3_tag[26:2] ^ io_req_1_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_140 = sectored_entries_4_tag[26:2] ^ io_req_1_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_145 = sectored_entries_5_tag[26:2] ^ io_req_1_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_150 = sectored_entries_6_tag[26:2] ^ io_req_1_bits_vaddr[38:14];
  wire [24:0] _hitsVec_T_155 = sectored_entries_7_tag[26:2] ^ io_req_1_bits_vaddr[38:14];
  wire        ignore_1 = superpage_entries_0_level == 2'h0;
  wire        ignore_4 = superpage_entries_1_level == 2'h0;
  wire        ignore_7 = superpage_entries_2_level == 2'h0;
  wire        ignore_10 = superpage_entries_3_level == 2'h0;
  reg         casez_tmp;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp = sectored_entries_0_valid_0;
      2'b01:
        casez_tmp = sectored_entries_0_valid_1;
      2'b10:
        casez_tmp = sectored_entries_0_valid_2;
      default:
        casez_tmp = sectored_entries_0_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_0_0 = vm_enabled_0 & casez_tmp & _hitsVec_T == 25'h0;
  reg         casez_tmp_0;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_0 = sectored_entries_1_valid_0;
      2'b01:
        casez_tmp_0 = sectored_entries_1_valid_1;
      2'b10:
        casez_tmp_0 = sectored_entries_1_valid_2;
      default:
        casez_tmp_0 = sectored_entries_1_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_0_1 = vm_enabled_0 & casez_tmp_0 & _hitsVec_T_5 == 25'h0;
  reg         casez_tmp_1;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_1 = sectored_entries_2_valid_0;
      2'b01:
        casez_tmp_1 = sectored_entries_2_valid_1;
      2'b10:
        casez_tmp_1 = sectored_entries_2_valid_2;
      default:
        casez_tmp_1 = sectored_entries_2_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_0_2 = vm_enabled_0 & casez_tmp_1 & _hitsVec_T_10 == 25'h0;
  reg         casez_tmp_2;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_2 = sectored_entries_3_valid_0;
      2'b01:
        casez_tmp_2 = sectored_entries_3_valid_1;
      2'b10:
        casez_tmp_2 = sectored_entries_3_valid_2;
      default:
        casez_tmp_2 = sectored_entries_3_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_0_3 = vm_enabled_0 & casez_tmp_2 & _hitsVec_T_15 == 25'h0;
  reg         casez_tmp_3;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_3 = sectored_entries_4_valid_0;
      2'b01:
        casez_tmp_3 = sectored_entries_4_valid_1;
      2'b10:
        casez_tmp_3 = sectored_entries_4_valid_2;
      default:
        casez_tmp_3 = sectored_entries_4_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_0_4 = vm_enabled_0 & casez_tmp_3 & _hitsVec_T_20 == 25'h0;
  reg         casez_tmp_4;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_4 = sectored_entries_5_valid_0;
      2'b01:
        casez_tmp_4 = sectored_entries_5_valid_1;
      2'b10:
        casez_tmp_4 = sectored_entries_5_valid_2;
      default:
        casez_tmp_4 = sectored_entries_5_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_0_5 = vm_enabled_0 & casez_tmp_4 & _hitsVec_T_25 == 25'h0;
  reg         casez_tmp_5;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_5 = sectored_entries_6_valid_0;
      2'b01:
        casez_tmp_5 = sectored_entries_6_valid_1;
      2'b10:
        casez_tmp_5 = sectored_entries_6_valid_2;
      default:
        casez_tmp_5 = sectored_entries_6_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_0_6 = vm_enabled_0 & casez_tmp_5 & _hitsVec_T_30 == 25'h0;
  reg         casez_tmp_6;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_6 = sectored_entries_7_valid_0;
      2'b01:
        casez_tmp_6 = sectored_entries_7_valid_1;
      2'b10:
        casez_tmp_6 = sectored_entries_7_valid_2;
      default:
        casez_tmp_6 = sectored_entries_7_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_0_7 = vm_enabled_0 & casez_tmp_6 & _hitsVec_T_35 == 25'h0;
  wire        hitsVec_0_8 = vm_enabled_0 & superpage_entries_0_valid_0 & superpage_entries_0_tag[26:18] == io_req_0_bits_vaddr[38:30] & (ignore_1 | superpage_entries_0_tag[17:9] == io_req_0_bits_vaddr[29:21]);
  wire        hitsVec_0_9 = vm_enabled_0 & superpage_entries_1_valid_0 & superpage_entries_1_tag[26:18] == io_req_0_bits_vaddr[38:30] & (ignore_4 | superpage_entries_1_tag[17:9] == io_req_0_bits_vaddr[29:21]);
  wire        hitsVec_0_10 = vm_enabled_0 & superpage_entries_2_valid_0 & superpage_entries_2_tag[26:18] == io_req_0_bits_vaddr[38:30] & (ignore_7 | superpage_entries_2_tag[17:9] == io_req_0_bits_vaddr[29:21]);
  wire        hitsVec_0_11 = vm_enabled_0 & superpage_entries_3_valid_0 & superpage_entries_3_tag[26:18] == io_req_0_bits_vaddr[38:30] & (ignore_10 | superpage_entries_3_tag[17:9] == io_req_0_bits_vaddr[29:21]);
  wire        hitsVec_0_12 = vm_enabled_0 & special_entry_valid_0 & special_entry_tag[26:18] == io_req_0_bits_vaddr[38:30] & (ignore_13 | special_entry_tag[17:9] == io_req_0_bits_vaddr[29:21]) & (~(special_entry_level[1]) | special_entry_tag[8:0] == io_req_0_bits_vaddr[20:12]);
  reg         casez_tmp_7;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_7 = sectored_entries_0_valid_0;
      2'b01:
        casez_tmp_7 = sectored_entries_0_valid_1;
      2'b10:
        casez_tmp_7 = sectored_entries_0_valid_2;
      default:
        casez_tmp_7 = sectored_entries_0_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_1_0 = vm_enabled_1 & casez_tmp_7 & _hitsVec_T_120 == 25'h0;
  reg         casez_tmp_8;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_8 = sectored_entries_1_valid_0;
      2'b01:
        casez_tmp_8 = sectored_entries_1_valid_1;
      2'b10:
        casez_tmp_8 = sectored_entries_1_valid_2;
      default:
        casez_tmp_8 = sectored_entries_1_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_1_1 = vm_enabled_1 & casez_tmp_8 & _hitsVec_T_125 == 25'h0;
  reg         casez_tmp_9;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_9 = sectored_entries_2_valid_0;
      2'b01:
        casez_tmp_9 = sectored_entries_2_valid_1;
      2'b10:
        casez_tmp_9 = sectored_entries_2_valid_2;
      default:
        casez_tmp_9 = sectored_entries_2_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_1_2 = vm_enabled_1 & casez_tmp_9 & _hitsVec_T_130 == 25'h0;
  reg         casez_tmp_10;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_10 = sectored_entries_3_valid_0;
      2'b01:
        casez_tmp_10 = sectored_entries_3_valid_1;
      2'b10:
        casez_tmp_10 = sectored_entries_3_valid_2;
      default:
        casez_tmp_10 = sectored_entries_3_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_1_3 = vm_enabled_1 & casez_tmp_10 & _hitsVec_T_135 == 25'h0;
  reg         casez_tmp_11;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_11 = sectored_entries_4_valid_0;
      2'b01:
        casez_tmp_11 = sectored_entries_4_valid_1;
      2'b10:
        casez_tmp_11 = sectored_entries_4_valid_2;
      default:
        casez_tmp_11 = sectored_entries_4_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_1_4 = vm_enabled_1 & casez_tmp_11 & _hitsVec_T_140 == 25'h0;
  reg         casez_tmp_12;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_12 = sectored_entries_5_valid_0;
      2'b01:
        casez_tmp_12 = sectored_entries_5_valid_1;
      2'b10:
        casez_tmp_12 = sectored_entries_5_valid_2;
      default:
        casez_tmp_12 = sectored_entries_5_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_1_5 = vm_enabled_1 & casez_tmp_12 & _hitsVec_T_145 == 25'h0;
  reg         casez_tmp_13;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_13 = sectored_entries_6_valid_0;
      2'b01:
        casez_tmp_13 = sectored_entries_6_valid_1;
      2'b10:
        casez_tmp_13 = sectored_entries_6_valid_2;
      default:
        casez_tmp_13 = sectored_entries_6_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_1_6 = vm_enabled_1 & casez_tmp_13 & _hitsVec_T_150 == 25'h0;
  reg         casez_tmp_14;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_14 = sectored_entries_7_valid_0;
      2'b01:
        casez_tmp_14 = sectored_entries_7_valid_1;
      2'b10:
        casez_tmp_14 = sectored_entries_7_valid_2;
      default:
        casez_tmp_14 = sectored_entries_7_valid_3;
    endcase
  end // always @(*)
  wire        hitsVec_1_7 = vm_enabled_1 & casez_tmp_14 & _hitsVec_T_155 == 25'h0;
  wire        hitsVec_1_8 = vm_enabled_1 & superpage_entries_0_valid_0 & superpage_entries_0_tag[26:18] == io_req_1_bits_vaddr[38:30] & (ignore_1 | superpage_entries_0_tag[17:9] == io_req_1_bits_vaddr[29:21]);
  wire        hitsVec_1_9 = vm_enabled_1 & superpage_entries_1_valid_0 & superpage_entries_1_tag[26:18] == io_req_1_bits_vaddr[38:30] & (ignore_4 | superpage_entries_1_tag[17:9] == io_req_1_bits_vaddr[29:21]);
  wire        hitsVec_1_10 = vm_enabled_1 & superpage_entries_2_valid_0 & superpage_entries_2_tag[26:18] == io_req_1_bits_vaddr[38:30] & (ignore_7 | superpage_entries_2_tag[17:9] == io_req_1_bits_vaddr[29:21]);
  wire        hitsVec_1_11 = vm_enabled_1 & superpage_entries_3_valid_0 & superpage_entries_3_tag[26:18] == io_req_1_bits_vaddr[38:30] & (ignore_10 | superpage_entries_3_tag[17:9] == io_req_1_bits_vaddr[29:21]);
  wire        hitsVec_1_12 = vm_enabled_1 & special_entry_valid_0 & special_entry_tag[26:18] == io_req_1_bits_vaddr[38:30] & (ignore_13 | special_entry_tag[17:9] == io_req_1_bits_vaddr[29:21]) & (~(special_entry_level[1]) | special_entry_tag[8:0] == io_req_1_bits_vaddr[20:12]);
  wire [13:0] hits_0 = {~vm_enabled_0, hitsVec_0_12, hitsVec_0_11, hitsVec_0_10, hitsVec_0_9, hitsVec_0_8, hitsVec_0_7, hitsVec_0_6, hitsVec_0_5, hitsVec_0_4, hitsVec_0_3, hitsVec_0_2, hitsVec_0_1, hitsVec_0_0};
  wire [13:0] hits_1 = {~vm_enabled_1, hitsVec_1_12, hitsVec_1_11, hitsVec_1_10, hitsVec_1_9, hitsVec_1_8, hitsVec_1_7, hitsVec_1_6, hitsVec_1_5, hitsVec_1_4, hitsVec_1_3, hitsVec_1_2, hitsVec_1_1, hitsVec_1_0};
  reg  [34:0] casez_tmp_15;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_15 = sectored_entries_0_data_0;
      2'b01:
        casez_tmp_15 = sectored_entries_0_data_1;
      2'b10:
        casez_tmp_15 = sectored_entries_0_data_2;
      default:
        casez_tmp_15 = sectored_entries_0_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_16;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_16 = sectored_entries_1_data_0;
      2'b01:
        casez_tmp_16 = sectored_entries_1_data_1;
      2'b10:
        casez_tmp_16 = sectored_entries_1_data_2;
      default:
        casez_tmp_16 = sectored_entries_1_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_17;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_17 = sectored_entries_2_data_0;
      2'b01:
        casez_tmp_17 = sectored_entries_2_data_1;
      2'b10:
        casez_tmp_17 = sectored_entries_2_data_2;
      default:
        casez_tmp_17 = sectored_entries_2_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_18;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_18 = sectored_entries_3_data_0;
      2'b01:
        casez_tmp_18 = sectored_entries_3_data_1;
      2'b10:
        casez_tmp_18 = sectored_entries_3_data_2;
      default:
        casez_tmp_18 = sectored_entries_3_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_19;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_19 = sectored_entries_4_data_0;
      2'b01:
        casez_tmp_19 = sectored_entries_4_data_1;
      2'b10:
        casez_tmp_19 = sectored_entries_4_data_2;
      default:
        casez_tmp_19 = sectored_entries_4_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_20;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_20 = sectored_entries_5_data_0;
      2'b01:
        casez_tmp_20 = sectored_entries_5_data_1;
      2'b10:
        casez_tmp_20 = sectored_entries_5_data_2;
      default:
        casez_tmp_20 = sectored_entries_5_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_21;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_21 = sectored_entries_6_data_0;
      2'b01:
        casez_tmp_21 = sectored_entries_6_data_1;
      2'b10:
        casez_tmp_21 = sectored_entries_6_data_2;
      default:
        casez_tmp_21 = sectored_entries_6_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_22;
  always @(*) begin
    casez (io_req_0_bits_vaddr[13:12])
      2'b00:
        casez_tmp_22 = sectored_entries_7_data_0;
      2'b01:
        casez_tmp_22 = sectored_entries_7_data_1;
      2'b10:
        casez_tmp_22 = sectored_entries_7_data_2;
      default:
        casez_tmp_22 = sectored_entries_7_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_23;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_23 = sectored_entries_0_data_0;
      2'b01:
        casez_tmp_23 = sectored_entries_0_data_1;
      2'b10:
        casez_tmp_23 = sectored_entries_0_data_2;
      default:
        casez_tmp_23 = sectored_entries_0_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_24;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_24 = sectored_entries_1_data_0;
      2'b01:
        casez_tmp_24 = sectored_entries_1_data_1;
      2'b10:
        casez_tmp_24 = sectored_entries_1_data_2;
      default:
        casez_tmp_24 = sectored_entries_1_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_25;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_25 = sectored_entries_2_data_0;
      2'b01:
        casez_tmp_25 = sectored_entries_2_data_1;
      2'b10:
        casez_tmp_25 = sectored_entries_2_data_2;
      default:
        casez_tmp_25 = sectored_entries_2_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_26;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_26 = sectored_entries_3_data_0;
      2'b01:
        casez_tmp_26 = sectored_entries_3_data_1;
      2'b10:
        casez_tmp_26 = sectored_entries_3_data_2;
      default:
        casez_tmp_26 = sectored_entries_3_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_27;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_27 = sectored_entries_4_data_0;
      2'b01:
        casez_tmp_27 = sectored_entries_4_data_1;
      2'b10:
        casez_tmp_27 = sectored_entries_4_data_2;
      default:
        casez_tmp_27 = sectored_entries_4_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_28;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_28 = sectored_entries_5_data_0;
      2'b01:
        casez_tmp_28 = sectored_entries_5_data_1;
      2'b10:
        casez_tmp_28 = sectored_entries_5_data_2;
      default:
        casez_tmp_28 = sectored_entries_5_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_29;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_29 = sectored_entries_6_data_0;
      2'b01:
        casez_tmp_29 = sectored_entries_6_data_1;
      2'b10:
        casez_tmp_29 = sectored_entries_6_data_2;
      default:
        casez_tmp_29 = sectored_entries_6_data_3;
    endcase
  end // always @(*)
  reg  [34:0] casez_tmp_30;
  always @(*) begin
    casez (io_req_1_bits_vaddr[13:12])
      2'b00:
        casez_tmp_30 = sectored_entries_7_data_0;
      2'b01:
        casez_tmp_30 = sectored_entries_7_data_1;
      2'b10:
        casez_tmp_30 = sectored_entries_7_data_2;
      default:
        casez_tmp_30 = sectored_entries_7_data_3;
    endcase
  end // always @(*)
  wire [12:0] priv_rw_ok_0 = (~(io_ptw_status_dprv[0]) | io_ptw_status_sum ? {_entries_barrier_12_io_y_u, _entries_barrier_11_io_y_u, _entries_barrier_10_io_y_u, _entries_barrier_9_io_y_u, _entries_barrier_8_io_y_u, _entries_barrier_7_io_y_u, _entries_barrier_6_io_y_u, _entries_barrier_5_io_y_u, _entries_barrier_4_io_y_u, _entries_barrier_3_io_y_u, _entries_barrier_2_io_y_u, _entries_barrier_1_io_y_u, _entries_barrier_io_y_u} : 13'h0) | (io_ptw_status_dprv[0] ? ~{_entries_barrier_12_io_y_u, _entries_barrier_11_io_y_u, _entries_barrier_10_io_y_u, _entries_barrier_9_io_y_u, _entries_barrier_8_io_y_u, _entries_barrier_7_io_y_u, _entries_barrier_6_io_y_u, _entries_barrier_5_io_y_u, _entries_barrier_4_io_y_u, _entries_barrier_3_io_y_u, _entries_barrier_2_io_y_u, _entries_barrier_1_io_y_u, _entries_barrier_io_y_u} : 13'h0);
  wire [12:0] priv_rw_ok_1 = (~(io_ptw_status_dprv[0]) | io_ptw_status_sum ? {_entries_barrier_25_io_y_u, _entries_barrier_24_io_y_u, _entries_barrier_23_io_y_u, _entries_barrier_22_io_y_u, _entries_barrier_21_io_y_u, _entries_barrier_20_io_y_u, _entries_barrier_19_io_y_u, _entries_barrier_18_io_y_u, _entries_barrier_17_io_y_u, _entries_barrier_16_io_y_u, _entries_barrier_15_io_y_u, _entries_barrier_14_io_y_u, _entries_barrier_13_io_y_u} : 13'h0) | (io_ptw_status_dprv[0] ? ~{_entries_barrier_25_io_y_u, _entries_barrier_24_io_y_u, _entries_barrier_23_io_y_u, _entries_barrier_22_io_y_u, _entries_barrier_21_io_y_u, _entries_barrier_20_io_y_u, _entries_barrier_19_io_y_u, _entries_barrier_18_io_y_u, _entries_barrier_17_io_y_u, _entries_barrier_16_io_y_u, _entries_barrier_15_io_y_u, _entries_barrier_14_io_y_u, _entries_barrier_13_io_y_u} : 13'h0);
  wire [12:0] _r_array_T_4 = priv_rw_ok_0 & ({_entries_barrier_12_io_y_sr, _entries_barrier_11_io_y_sr, _entries_barrier_10_io_y_sr, _entries_barrier_9_io_y_sr, _entries_barrier_8_io_y_sr, _entries_barrier_7_io_y_sr, _entries_barrier_6_io_y_sr, _entries_barrier_5_io_y_sr, _entries_barrier_4_io_y_sr, _entries_barrier_3_io_y_sr, _entries_barrier_2_io_y_sr, _entries_barrier_1_io_y_sr, _entries_barrier_io_y_sr} | (io_ptw_status_mxr ? {_entries_barrier_12_io_y_sx, _entries_barrier_11_io_y_sx, _entries_barrier_10_io_y_sx, _entries_barrier_9_io_y_sx, _entries_barrier_8_io_y_sx, _entries_barrier_7_io_y_sx, _entries_barrier_6_io_y_sx, _entries_barrier_5_io_y_sx, _entries_barrier_4_io_y_sx, _entries_barrier_3_io_y_sx, _entries_barrier_2_io_y_sx, _entries_barrier_1_io_y_sx, _entries_barrier_io_y_sx} : 13'h0));
  wire [12:0] _r_array_T_10 = priv_rw_ok_1 & ({_entries_barrier_25_io_y_sr, _entries_barrier_24_io_y_sr, _entries_barrier_23_io_y_sr, _entries_barrier_22_io_y_sr, _entries_barrier_21_io_y_sr, _entries_barrier_20_io_y_sr, _entries_barrier_19_io_y_sr, _entries_barrier_18_io_y_sr, _entries_barrier_17_io_y_sr, _entries_barrier_16_io_y_sr, _entries_barrier_15_io_y_sr, _entries_barrier_14_io_y_sr, _entries_barrier_13_io_y_sr} | (io_ptw_status_mxr ? {_entries_barrier_25_io_y_sx, _entries_barrier_24_io_y_sx, _entries_barrier_23_io_y_sx, _entries_barrier_22_io_y_sx, _entries_barrier_21_io_y_sx, _entries_barrier_20_io_y_sx, _entries_barrier_19_io_y_sx, _entries_barrier_18_io_y_sx, _entries_barrier_17_io_y_sx, _entries_barrier_16_io_y_sx, _entries_barrier_15_io_y_sx, _entries_barrier_14_io_y_sx, _entries_barrier_13_io_y_sx} : 13'h0));
  wire [12:0] _w_array_T_1 = priv_rw_ok_0 & {_entries_barrier_12_io_y_sw, _entries_barrier_11_io_y_sw, _entries_barrier_10_io_y_sw, _entries_barrier_9_io_y_sw, _entries_barrier_8_io_y_sw, _entries_barrier_7_io_y_sw, _entries_barrier_6_io_y_sw, _entries_barrier_5_io_y_sw, _entries_barrier_4_io_y_sw, _entries_barrier_3_io_y_sw, _entries_barrier_2_io_y_sw, _entries_barrier_1_io_y_sw, _entries_barrier_io_y_sw};
  wire [12:0] _w_array_T_4 = priv_rw_ok_1 & {_entries_barrier_25_io_y_sw, _entries_barrier_24_io_y_sw, _entries_barrier_23_io_y_sw, _entries_barrier_22_io_y_sw, _entries_barrier_21_io_y_sw, _entries_barrier_20_io_y_sw, _entries_barrier_19_io_y_sw, _entries_barrier_18_io_y_sw, _entries_barrier_17_io_y_sw, _entries_barrier_16_io_y_sw, _entries_barrier_15_io_y_sw, _entries_barrier_14_io_y_sw, _entries_barrier_13_io_y_sw};
  wire [13:0] _px_array_T_4 = {1'h1, ~_entries_barrier_12_io_y_ae, ~_entries_barrier_11_io_y_ae, ~_entries_barrier_10_io_y_ae, ~_entries_barrier_9_io_y_ae, ~_entries_barrier_8_io_y_ae, ~_entries_barrier_7_io_y_ae, ~_entries_barrier_6_io_y_ae, ~_entries_barrier_5_io_y_ae, ~_entries_barrier_4_io_y_ae, ~_entries_barrier_3_io_y_ae, ~_entries_barrier_2_io_y_ae, ~_entries_barrier_1_io_y_ae, ~_entries_barrier_io_y_ae};
  wire [13:0] _px_array_T_10 = {1'h1, ~_entries_barrier_25_io_y_ae, ~_entries_barrier_24_io_y_ae, ~_entries_barrier_23_io_y_ae, ~_entries_barrier_22_io_y_ae, ~_entries_barrier_21_io_y_ae, ~_entries_barrier_20_io_y_ae, ~_entries_barrier_19_io_y_ae, ~_entries_barrier_18_io_y_ae, ~_entries_barrier_17_io_y_ae, ~_entries_barrier_16_io_y_ae, ~_entries_barrier_15_io_y_ae, ~_entries_barrier_14_io_y_ae, ~_entries_barrier_13_io_y_ae};
  wire [13:0] eff_array_1 = {{2{legal_address_1 & ({mpu_ppn_1[20:19], mpu_ppn_1[16:13], mpu_ppn_1[8], mpu_ppn_1[4], mpu_ppn_1[1]} == 9'h0 | {mpu_ppn_1[20:19], mpu_ppn_1[16:13], _GEN_6[8], mpu_ppn_1[1:0]} == 9'h0 | {mpu_ppn_1[20:19], mpu_ppn_1[16:14], _GEN_5[9], mpu_ppn_1[8], mpu_ppn_1[4]} == 8'h0 | {mpu_ppn_1[20:19], mpu_ppn_1[16:14], _GEN_4[13], mpu_ppn_1[8], _GEN_4[4], mpu_ppn_1[1:0]} == 10'h0 | {mpu_ppn_1[20:19], mpu_ppn_1[16], ~(mpu_ppn_1[15:14])} == 5'h0 | {mpu_ppn_1[20:19], _GEN_13, mpu_ppn_1[8], mpu_ppn_1[4], mpu_ppn_1[1:0]} == 10'h0)}}, _normal_entries_barrier_23_io_y_eff, _normal_entries_barrier_22_io_y_eff, _normal_entries_barrier_21_io_y_eff, _normal_entries_barrier_20_io_y_eff, _normal_entries_barrier_19_io_y_eff, _normal_entries_barrier_18_io_y_eff, _normal_entries_barrier_17_io_y_eff, _normal_entries_barrier_16_io_y_eff, _normal_entries_barrier_15_io_y_eff, _normal_entries_barrier_14_io_y_eff, _normal_entries_barrier_13_io_y_eff, _normal_entries_barrier_12_io_y_eff};
  wire [13:0] lrscAllowed_0 = {{2{newEntry_c}}, _normal_entries_barrier_11_io_y_c, _normal_entries_barrier_10_io_y_c, _normal_entries_barrier_9_io_y_c, _normal_entries_barrier_8_io_y_c, _normal_entries_barrier_7_io_y_c, _normal_entries_barrier_6_io_y_c, _normal_entries_barrier_5_io_y_c, _normal_entries_barrier_4_io_y_c, _normal_entries_barrier_3_io_y_c, _normal_entries_barrier_2_io_y_c, _normal_entries_barrier_1_io_y_c, _normal_entries_barrier_io_y_c};
  wire [13:0] lrscAllowed_1 = {{2{legal_address_1 & ({mpu_ppn_1[20:19], _GEN_7[11:10], mpu_ppn_1[4]} == 5'h0 | ~(|_GEN_10) | ~_GEN_11)}}, _normal_entries_barrier_23_io_y_c, _normal_entries_barrier_22_io_y_c, _normal_entries_barrier_21_io_y_c, _normal_entries_barrier_20_io_y_c, _normal_entries_barrier_19_io_y_c, _normal_entries_barrier_18_io_y_c, _normal_entries_barrier_17_io_y_c, _normal_entries_barrier_16_io_y_c, _normal_entries_barrier_15_io_y_c, _normal_entries_barrier_14_io_y_c, _normal_entries_barrier_13_io_y_c, _normal_entries_barrier_12_io_y_c};
  wire [3:0]  _GEN_26 = io_req_1_bits_vaddr[3:0] & (4'h1 << io_req_1_bits_size) - 4'h1;
  wire        bad_va_0 = vm_enabled_0 & ~(io_req_0_bits_vaddr[39:38] == 2'h0 | (&(io_req_0_bits_vaddr[39:38])));
  wire        bad_va_1 = vm_enabled_1 & ~(io_req_1_bits_vaddr[39:38] == 2'h0 | (&(io_req_1_bits_vaddr[39:38])));
  wire        _cmd_read_T_2 = io_req_0_bits_cmd == 5'h6;
  wire        _cmd_write_T_3 = io_req_0_bits_cmd == 5'h7;
  wire        _cmd_read_T_27 = io_req_1_bits_cmd == 5'h6;
  wire        _cmd_write_T_26 = io_req_1_bits_cmd == 5'h7;
  wire        _cmd_write_T_5 = io_req_0_bits_cmd == 5'h4;
  wire        _cmd_write_T_6 = io_req_0_bits_cmd == 5'h9;
  wire        _cmd_write_T_7 = io_req_0_bits_cmd == 5'hA;
  wire        _cmd_write_T_8 = io_req_0_bits_cmd == 5'hB;
  wire        _cmd_write_T_28 = io_req_1_bits_cmd == 5'h4;
  wire        _cmd_write_T_29 = io_req_1_bits_cmd == 5'h9;
  wire        _cmd_write_T_30 = io_req_1_bits_cmd == 5'hA;
  wire        _cmd_write_T_31 = io_req_1_bits_cmd == 5'hB;
  wire        _cmd_write_T_12 = io_req_0_bits_cmd == 5'h8;
  wire        _cmd_write_T_13 = io_req_0_bits_cmd == 5'hC;
  wire        _cmd_write_T_14 = io_req_0_bits_cmd == 5'hD;
  wire        _cmd_write_T_15 = io_req_0_bits_cmd == 5'hE;
  wire        _cmd_write_T_16 = io_req_0_bits_cmd == 5'hF;
  wire        _cmd_write_T_35 = io_req_1_bits_cmd == 5'h8;
  wire        _cmd_write_T_36 = io_req_1_bits_cmd == 5'hC;
  wire        _cmd_write_T_37 = io_req_1_bits_cmd == 5'hD;
  wire        _cmd_write_T_38 = io_req_1_bits_cmd == 5'hE;
  wire        _cmd_write_T_39 = io_req_1_bits_cmd == 5'hF;
  wire        cmd_read_0 = io_req_0_bits_cmd == 5'h0 | io_req_0_bits_cmd == 5'h10 | _cmd_read_T_2 | _cmd_write_T_3 | _cmd_write_T_5 | _cmd_write_T_6 | _cmd_write_T_7 | _cmd_write_T_8 | _cmd_write_T_12 | _cmd_write_T_13 | _cmd_write_T_14 | _cmd_write_T_15 | _cmd_write_T_16;
  wire        cmd_read_1 = io_req_1_bits_cmd == 5'h0 | io_req_1_bits_cmd == 5'h10 | _cmd_read_T_27 | _cmd_write_T_26 | _cmd_write_T_28 | _cmd_write_T_29 | _cmd_write_T_30 | _cmd_write_T_31 | _cmd_write_T_35 | _cmd_write_T_36 | _cmd_write_T_37 | _cmd_write_T_38 | _cmd_write_T_39;
  wire        cmd_write_perms_0 = io_req_0_bits_cmd == 5'h1 | io_req_0_bits_cmd == 5'h11 | _cmd_write_T_3 | _cmd_write_T_5 | _cmd_write_T_6 | _cmd_write_T_7 | _cmd_write_T_8 | _cmd_write_T_12 | _cmd_write_T_13 | _cmd_write_T_14 | _cmd_write_T_15 | _cmd_write_T_16;
  wire        cmd_write_perms_1 = io_req_1_bits_cmd == 5'h1 | io_req_1_bits_cmd == 5'h11 | _cmd_write_T_26 | _cmd_write_T_28 | _cmd_write_T_29 | _cmd_write_T_30 | _cmd_write_T_31 | _cmd_write_T_35 | _cmd_write_T_36 | _cmd_write_T_37 | _cmd_write_T_38 | _cmd_write_T_39;
  wire [13:0] ae_array_0 = ((|(io_req_0_bits_vaddr[3:0] & (4'h1 << io_req_0_bits_size) - 4'h1)) ? {{2{newEntry_eff}}, _normal_entries_barrier_11_io_y_eff, _normal_entries_barrier_10_io_y_eff, _normal_entries_barrier_9_io_y_eff, _normal_entries_barrier_8_io_y_eff, _normal_entries_barrier_7_io_y_eff, _normal_entries_barrier_6_io_y_eff, _normal_entries_barrier_5_io_y_eff, _normal_entries_barrier_4_io_y_eff, _normal_entries_barrier_3_io_y_eff, _normal_entries_barrier_2_io_y_eff, _normal_entries_barrier_1_io_y_eff, _normal_entries_barrier_io_y_eff} : 14'h0) | (_cmd_read_T_2 | _cmd_write_T_3 ? ~lrscAllowed_0 : 14'h0);
  wire [13:0] ae_array_1 = ((|_GEN_26) ? eff_array_1 : 14'h0) | (_cmd_read_T_27 | _cmd_write_T_26 ? ~lrscAllowed_1 : 14'h0);
  wire        tlb_miss_0 = vm_enabled_0 & ~bad_va_0 & {hitsVec_0_12, hitsVec_0_11, hitsVec_0_10, hitsVec_0_9, hitsVec_0_8, hitsVec_0_7, hitsVec_0_6, hitsVec_0_5, hitsVec_0_4, hitsVec_0_3, hitsVec_0_2, hitsVec_0_1, hitsVec_0_0} == 13'h0;
  wire        tlb_miss_1 = vm_enabled_1 & ~bad_va_1 & {hitsVec_1_12, hitsVec_1_11, hitsVec_1_10, hitsVec_1_9, hitsVec_1_8, hitsVec_1_7, hitsVec_1_6, hitsVec_1_5, hitsVec_1_4, hitsVec_1_3, hitsVec_1_2, hitsVec_1_1, hitsVec_1_0} == 13'h0;
  reg  [6:0]  state_reg;
  reg  [2:0]  state_reg_1;
  wire        multipleHits_rightOne_1 = hitsVec_0_1 | hitsVec_0_2;
  wire        multipleHits_leftOne_2 = hitsVec_0_0 | multipleHits_rightOne_1;
  wire        multipleHits_rightOne_3 = hitsVec_0_4 | hitsVec_0_5;
  wire        multipleHits_rightOne_4 = hitsVec_0_3 | multipleHits_rightOne_3;
  wire        multipleHits_rightOne_6 = hitsVec_0_7 | hitsVec_0_8;
  wire        multipleHits_leftOne_8 = hitsVec_0_6 | multipleHits_rightOne_6;
  wire        multipleHits_leftOne_10 = hitsVec_0_9 | hitsVec_0_10;
  wire        multipleHits_rightOne_9 = hitsVec_0_11 | hitsVec_0_12;
  wire        multipleHits_rightOne_10 = multipleHits_leftOne_10 | multipleHits_rightOne_9;
  wire        multipleHits_0 = hitsVec_0_1 & hitsVec_0_2 | hitsVec_0_0 & multipleHits_rightOne_1 | hitsVec_0_4 & hitsVec_0_5 | hitsVec_0_3 & multipleHits_rightOne_3 | multipleHits_leftOne_2 & multipleHits_rightOne_4 | hitsVec_0_7 & hitsVec_0_8 | hitsVec_0_6 & multipleHits_rightOne_6 | hitsVec_0_9 & hitsVec_0_10 | hitsVec_0_11 & hitsVec_0_12 | multipleHits_leftOne_10 & multipleHits_rightOne_9 | multipleHits_leftOne_8 & multipleHits_rightOne_10 | (multipleHits_leftOne_2 | multipleHits_rightOne_4) & (multipleHits_leftOne_8 | multipleHits_rightOne_10);
  wire        multipleHits_rightOne_13 = hitsVec_1_1 | hitsVec_1_2;
  wire        multipleHits_leftOne_14 = hitsVec_1_0 | multipleHits_rightOne_13;
  wire        multipleHits_rightOne_15 = hitsVec_1_4 | hitsVec_1_5;
  wire        multipleHits_rightOne_16 = hitsVec_1_3 | multipleHits_rightOne_15;
  wire        multipleHits_rightOne_18 = hitsVec_1_7 | hitsVec_1_8;
  wire        multipleHits_leftOne_20 = hitsVec_1_6 | multipleHits_rightOne_18;
  wire        multipleHits_leftOne_22 = hitsVec_1_9 | hitsVec_1_10;
  wire        multipleHits_rightOne_21 = hitsVec_1_11 | hitsVec_1_12;
  wire        multipleHits_rightOne_22 = multipleHits_leftOne_22 | multipleHits_rightOne_21;
  wire        multipleHits_1 = hitsVec_1_1 & hitsVec_1_2 | hitsVec_1_0 & multipleHits_rightOne_13 | hitsVec_1_4 & hitsVec_1_5 | hitsVec_1_3 & multipleHits_rightOne_15 | multipleHits_leftOne_14 & multipleHits_rightOne_16 | hitsVec_1_7 & hitsVec_1_8 | hitsVec_1_6 & multipleHits_rightOne_18 | hitsVec_1_9 & hitsVec_1_10 | hitsVec_1_11 & hitsVec_1_12 | multipleHits_leftOne_22 & multipleHits_rightOne_21 | multipleHits_leftOne_20 & multipleHits_rightOne_22 | (multipleHits_leftOne_14 | multipleHits_rightOne_16) & (multipleHits_leftOne_20 | multipleHits_rightOne_22);
  wire        _io_miss_rdy_T = state == 2'h0;
  wire [12:0] _GEN_27 = {hitsVec_0_12, hitsVec_0_11, hitsVec_0_10, hitsVec_0_9, hitsVec_0_8, hitsVec_0_7, hitsVec_0_6, hitsVec_0_5, hitsVec_0_4, hitsVec_0_3, hitsVec_0_2, hitsVec_0_1, hitsVec_0_0};
  wire [12:0] _GEN_28 = {hitsVec_1_12, hitsVec_1_11, hitsVec_1_10, hitsVec_1_9, hitsVec_1_8, hitsVec_1_7, hitsVec_1_6, hitsVec_1_5, hitsVec_1_4, hitsVec_1_3, hitsVec_1_2, hitsVec_1_1, hitsVec_1_0};
  `ifndef SYNTHESIS
    wire _GEN_29 = io_sfence_valid & ~reset;
    always @(posedge clock) begin
      if (_GEN_29 & ~(~io_sfence_bits_rs1 | io_sfence_bits_addr[38:12] == io_req_0_bits_vaddr[38:12])) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at tlb.scala:340 assert(!io.sfence.bits.rs1 || (io.sfence.bits.addr >> pgIdxBits) === vpn(w))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & ~(~io_sfence_bits_rs1 | io_sfence_bits_addr[38:12] == io_req_1_bits_vaddr[38:12])) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at tlb.scala:340 assert(!io.sfence.bits.rs1 || (io.sfence.bits.addr >> pgIdxBits) === vpn(w))\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        superpage_hits_0_1 = superpage_entries_1_valid_0 & superpage_entries_1_tag[26:18] == io_req_0_bits_vaddr[38:30] & (ignore_4 | superpage_entries_1_tag[17:9] == io_req_0_bits_vaddr[29:21]);
  wire        superpage_hits_0_2 = superpage_entries_2_valid_0 & superpage_entries_2_tag[26:18] == io_req_0_bits_vaddr[38:30] & (ignore_7 | superpage_entries_2_tag[17:9] == io_req_0_bits_vaddr[29:21]);
  wire        superpage_hits_0_3 = superpage_entries_3_valid_0 & superpage_entries_3_tag[26:18] == io_req_0_bits_vaddr[38:30] & (ignore_10 | superpage_entries_3_tag[17:9] == io_req_0_bits_vaddr[29:21]);
  wire [1:0]  hi_4 = {superpage_hits_0_3, superpage_hits_0_2};
  wire        _state_reg_T_28 = superpage_hits_0_3 | superpage_hits_0_1;
  wire        superpage_hits_1_1 = superpage_entries_1_valid_0 & superpage_entries_1_tag[26:18] == io_req_1_bits_vaddr[38:30] & (ignore_4 | superpage_entries_1_tag[17:9] == io_req_1_bits_vaddr[29:21]);
  wire        superpage_hits_1_2 = superpage_entries_2_valid_0 & superpage_entries_2_tag[26:18] == io_req_1_bits_vaddr[38:30] & (ignore_7 | superpage_entries_2_tag[17:9] == io_req_1_bits_vaddr[29:21]);
  wire        superpage_hits_1_3 = superpage_entries_3_valid_0 & superpage_entries_3_tag[26:18] == io_req_1_bits_vaddr[38:30] & (ignore_10 | superpage_entries_3_tag[17:9] == io_req_1_bits_vaddr[29:21]);
  wire        _GEN_30 = io_req_0_valid & vm_enabled_0;
  wire        _GEN_31 = io_req_1_valid & vm_enabled_1;
  wire [1:0]  hi_9 = {superpage_hits_1_3, superpage_hits_1_2};
  wire        _state_reg_T_60 = superpage_hits_1_3 | superpage_hits_1_1;
  wire        newEntry_px = legal_address_0 & ({mpu_ppn_0[20:19], mpu_ppn_0[16:13], mpu_ppn_0[8], mpu_ppn_0[4], mpu_ppn_0[1:0]} == 10'h0 | {mpu_ppn_0[20:19], mpu_ppn_0[16:13], mpu_ppn_0[8], mpu_ppn_0[4], ~(mpu_ppn_0[1:0])} == 10'h0 | {mpu_ppn_0[20:19], mpu_ppn_0[16:13], mpu_ppn_0[8], ~(mpu_ppn_0[4])} == 8'h0 | {mpu_ppn_0[20:19], mpu_ppn_0[16], _GEN_3[11:9], mpu_ppn_0[8], mpu_ppn_0[4]} == 8'h0 | ~(|_GEN_8) | ~_GEN_9) & _pmp_0_io_x;
  wire        _r_sectored_repl_addr_valids_T_24 = sectored_entries_0_valid_0 | sectored_entries_0_valid_1;
  wire        sector_hits_0_0 = (_r_sectored_repl_addr_valids_T_24 | sectored_entries_0_valid_2 | sectored_entries_0_valid_3) & _hitsVec_T == 25'h0;
  wire        _r_sectored_repl_addr_valids_T_27 = sectored_entries_1_valid_0 | sectored_entries_1_valid_1;
  wire        sector_hits_0_1 = (_r_sectored_repl_addr_valids_T_27 | sectored_entries_1_valid_2 | sectored_entries_1_valid_3) & _hitsVec_T_5 == 25'h0;
  wire        _r_sectored_repl_addr_valids_T_30 = sectored_entries_2_valid_0 | sectored_entries_2_valid_1;
  wire        sector_hits_0_2 = (_r_sectored_repl_addr_valids_T_30 | sectored_entries_2_valid_2 | sectored_entries_2_valid_3) & _hitsVec_T_10 == 25'h0;
  wire        _r_sectored_repl_addr_valids_T_33 = sectored_entries_3_valid_0 | sectored_entries_3_valid_1;
  wire        sector_hits_0_3 = (_r_sectored_repl_addr_valids_T_33 | sectored_entries_3_valid_2 | sectored_entries_3_valid_3) & _hitsVec_T_15 == 25'h0;
  wire        _r_sectored_repl_addr_valids_T_36 = sectored_entries_4_valid_0 | sectored_entries_4_valid_1;
  wire        sector_hits_0_4 = (_r_sectored_repl_addr_valids_T_36 | sectored_entries_4_valid_2 | sectored_entries_4_valid_3) & _hitsVec_T_20 == 25'h0;
  wire        _r_sectored_repl_addr_valids_T_39 = sectored_entries_5_valid_0 | sectored_entries_5_valid_1;
  wire        sector_hits_0_5 = (_r_sectored_repl_addr_valids_T_39 | sectored_entries_5_valid_2 | sectored_entries_5_valid_3) & _hitsVec_T_25 == 25'h0;
  wire        _r_sectored_repl_addr_valids_T_42 = sectored_entries_6_valid_0 | sectored_entries_6_valid_1;
  wire        sector_hits_0_6 = (_r_sectored_repl_addr_valids_T_42 | sectored_entries_6_valid_2 | sectored_entries_6_valid_3) & _hitsVec_T_30 == 25'h0;
  wire        _r_sectored_repl_addr_valids_T_45 = sectored_entries_7_valid_0 | sectored_entries_7_valid_1;
  wire        sector_hits_0_7 = (_r_sectored_repl_addr_valids_T_45 | sectored_entries_7_valid_2 | sectored_entries_7_valid_3) & _hitsVec_T_35 == 25'h0;
  wire        sector_hits_1_0 = (_r_sectored_repl_addr_valids_T_24 | sectored_entries_0_valid_2 | sectored_entries_0_valid_3) & _hitsVec_T_120 == 25'h0;
  wire        sector_hits_1_1 = (_r_sectored_repl_addr_valids_T_27 | sectored_entries_1_valid_2 | sectored_entries_1_valid_3) & _hitsVec_T_125 == 25'h0;
  wire        sector_hits_1_2 = (_r_sectored_repl_addr_valids_T_30 | sectored_entries_2_valid_2 | sectored_entries_2_valid_3) & _hitsVec_T_130 == 25'h0;
  wire        sector_hits_1_3 = (_r_sectored_repl_addr_valids_T_33 | sectored_entries_3_valid_2 | sectored_entries_3_valid_3) & _hitsVec_T_135 == 25'h0;
  wire        sector_hits_1_4 = (_r_sectored_repl_addr_valids_T_36 | sectored_entries_4_valid_2 | sectored_entries_4_valid_3) & _hitsVec_T_140 == 25'h0;
  wire        sector_hits_1_5 = (_r_sectored_repl_addr_valids_T_39 | sectored_entries_5_valid_2 | sectored_entries_5_valid_3) & _hitsVec_T_145 == 25'h0;
  wire        sector_hits_1_6 = (_r_sectored_repl_addr_valids_T_42 | sectored_entries_6_valid_2 | sectored_entries_6_valid_3) & _hitsVec_T_150 == 25'h0;
  wire        sector_hits_1_7 = (_r_sectored_repl_addr_valids_T_45 | sectored_entries_7_valid_2 | sectored_entries_7_valid_3) & _hitsVec_T_155 == 25'h0;
  wire        newEntry_sr = io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | io_ptw_resp_bits_pte_x & ~io_ptw_resp_bits_pte_w) & io_ptw_resp_bits_pte_a & io_ptw_resp_bits_pte_r;
  wire        newEntry_sw = io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | io_ptw_resp_bits_pte_x & ~io_ptw_resp_bits_pte_w) & io_ptw_resp_bits_pte_a & io_ptw_resp_bits_pte_w & io_ptw_resp_bits_pte_d;
  wire        newEntry_sx = io_ptw_resp_bits_pte_v & (io_ptw_resp_bits_pte_r | io_ptw_resp_bits_pte_x & ~io_ptw_resp_bits_pte_w) & io_ptw_resp_bits_pte_a & io_ptw_resp_bits_pte_x;
  wire        _GEN_32 = io_ptw_resp_valid & ~io_ptw_resp_bits_homogeneous;
  wire        _GEN_33 = _GEN_32 | special_entry_valid_0;
  wire        _GEN_34 = io_ptw_resp_valid & io_ptw_resp_bits_homogeneous & ~(io_ptw_resp_bits_level[1]) & r_superpage_repl_addr == 2'h0;
  wire        _GEN_35 = _GEN_34 | superpage_entries_0_valid_0;
  wire        _GEN_36 = io_ptw_resp_valid & io_ptw_resp_bits_homogeneous & ~(io_ptw_resp_bits_level[1]) & r_superpage_repl_addr == 2'h1;
  wire        _GEN_37 = _GEN_36 | superpage_entries_1_valid_0;
  wire        _GEN_38 = io_ptw_resp_valid & io_ptw_resp_bits_homogeneous & ~(io_ptw_resp_bits_level[1]) & r_superpage_repl_addr == 2'h2;
  wire        _GEN_39 = _GEN_38 | superpage_entries_2_valid_0;
  wire        _GEN_40 = io_ptw_resp_valid & io_ptw_resp_bits_homogeneous & ~(io_ptw_resp_bits_level[1]) & (&r_superpage_repl_addr);
  wire        _GEN_41 = _GEN_40 | superpage_entries_3_valid_0;
  wire [2:0]  waddr = r_sectored_hit ? r_sectored_hit_addr : r_sectored_repl_addr;
  wire        _GEN_42 = waddr == 3'h0;
  wire        _GEN_43 = ~io_ptw_resp_bits_homogeneous | ~(io_ptw_resp_bits_level[1]);
  wire        _GEN_44 = ~io_ptw_resp_valid | _GEN_43 | ~_GEN_42;
  wire        _GEN_45 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_46 = _GEN_44 ? sectored_entries_0_valid_0 : _GEN_45 | r_sectored_hit & sectored_entries_0_valid_0;
  wire        _GEN_47 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_48 = _GEN_44 ? sectored_entries_0_valid_1 : _GEN_47 | r_sectored_hit & sectored_entries_0_valid_1;
  wire        _GEN_49 = r_refill_tag[1:0] == 2'h2;
  wire        _GEN_50 = _GEN_44 ? sectored_entries_0_valid_2 : _GEN_49 | r_sectored_hit & sectored_entries_0_valid_2;
  wire        _GEN_51 = _GEN_44 ? sectored_entries_0_valid_3 : (&(r_refill_tag[1:0])) | r_sectored_hit & sectored_entries_0_valid_3;
  wire [34:0] _sectored_entries_0_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_52 = waddr == 3'h1;
  wire        _GEN_53 = ~io_ptw_resp_valid | _GEN_43 | ~_GEN_52;
  wire        _GEN_54 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_55 = _GEN_53 ? sectored_entries_1_valid_0 : _GEN_54 | r_sectored_hit & sectored_entries_1_valid_0;
  wire        _GEN_56 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_57 = _GEN_53 ? sectored_entries_1_valid_1 : _GEN_56 | r_sectored_hit & sectored_entries_1_valid_1;
  wire        _GEN_58 = r_refill_tag[1:0] == 2'h2;
  wire        _GEN_59 = _GEN_53 ? sectored_entries_1_valid_2 : _GEN_58 | r_sectored_hit & sectored_entries_1_valid_2;
  wire        _GEN_60 = _GEN_53 ? sectored_entries_1_valid_3 : (&(r_refill_tag[1:0])) | r_sectored_hit & sectored_entries_1_valid_3;
  wire [34:0] _sectored_entries_1_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_61 = waddr == 3'h2;
  wire        _GEN_62 = ~io_ptw_resp_valid | _GEN_43 | ~_GEN_61;
  wire        _GEN_63 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_64 = _GEN_62 ? sectored_entries_2_valid_0 : _GEN_63 | r_sectored_hit & sectored_entries_2_valid_0;
  wire        _GEN_65 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_66 = _GEN_62 ? sectored_entries_2_valid_1 : _GEN_65 | r_sectored_hit & sectored_entries_2_valid_1;
  wire        _GEN_67 = r_refill_tag[1:0] == 2'h2;
  wire        _GEN_68 = _GEN_62 ? sectored_entries_2_valid_2 : _GEN_67 | r_sectored_hit & sectored_entries_2_valid_2;
  wire        _GEN_69 = _GEN_62 ? sectored_entries_2_valid_3 : (&(r_refill_tag[1:0])) | r_sectored_hit & sectored_entries_2_valid_3;
  wire [34:0] _sectored_entries_2_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_70 = waddr == 3'h3;
  wire        _GEN_71 = ~io_ptw_resp_valid | _GEN_43 | ~_GEN_70;
  wire        _GEN_72 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_73 = _GEN_71 ? sectored_entries_3_valid_0 : _GEN_72 | r_sectored_hit & sectored_entries_3_valid_0;
  wire        _GEN_74 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_75 = _GEN_71 ? sectored_entries_3_valid_1 : _GEN_74 | r_sectored_hit & sectored_entries_3_valid_1;
  wire        _GEN_76 = r_refill_tag[1:0] == 2'h2;
  wire        _GEN_77 = _GEN_71 ? sectored_entries_3_valid_2 : _GEN_76 | r_sectored_hit & sectored_entries_3_valid_2;
  wire        _GEN_78 = _GEN_71 ? sectored_entries_3_valid_3 : (&(r_refill_tag[1:0])) | r_sectored_hit & sectored_entries_3_valid_3;
  wire [34:0] _sectored_entries_3_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_79 = waddr == 3'h4;
  wire        _GEN_80 = ~io_ptw_resp_valid | _GEN_43 | ~_GEN_79;
  wire        _GEN_81 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_82 = _GEN_80 ? sectored_entries_4_valid_0 : _GEN_81 | r_sectored_hit & sectored_entries_4_valid_0;
  wire        _GEN_83 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_84 = _GEN_80 ? sectored_entries_4_valid_1 : _GEN_83 | r_sectored_hit & sectored_entries_4_valid_1;
  wire        _GEN_85 = r_refill_tag[1:0] == 2'h2;
  wire        _GEN_86 = _GEN_80 ? sectored_entries_4_valid_2 : _GEN_85 | r_sectored_hit & sectored_entries_4_valid_2;
  wire        _GEN_87 = _GEN_80 ? sectored_entries_4_valid_3 : (&(r_refill_tag[1:0])) | r_sectored_hit & sectored_entries_4_valid_3;
  wire [34:0] _sectored_entries_4_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_88 = waddr == 3'h5;
  wire        _GEN_89 = ~io_ptw_resp_valid | _GEN_43 | ~_GEN_88;
  wire        _GEN_90 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_91 = _GEN_89 ? sectored_entries_5_valid_0 : _GEN_90 | r_sectored_hit & sectored_entries_5_valid_0;
  wire        _GEN_92 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_93 = _GEN_89 ? sectored_entries_5_valid_1 : _GEN_92 | r_sectored_hit & sectored_entries_5_valid_1;
  wire        _GEN_94 = r_refill_tag[1:0] == 2'h2;
  wire        _GEN_95 = _GEN_89 ? sectored_entries_5_valid_2 : _GEN_94 | r_sectored_hit & sectored_entries_5_valid_2;
  wire        _GEN_96 = _GEN_89 ? sectored_entries_5_valid_3 : (&(r_refill_tag[1:0])) | r_sectored_hit & sectored_entries_5_valid_3;
  wire [34:0] _sectored_entries_5_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_97 = waddr == 3'h6;
  wire        _GEN_98 = ~io_ptw_resp_valid | _GEN_43 | ~_GEN_97;
  wire        _GEN_99 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_100 = _GEN_98 ? sectored_entries_6_valid_0 : _GEN_99 | r_sectored_hit & sectored_entries_6_valid_0;
  wire        _GEN_101 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_102 = _GEN_98 ? sectored_entries_6_valid_1 : _GEN_101 | r_sectored_hit & sectored_entries_6_valid_1;
  wire        _GEN_103 = r_refill_tag[1:0] == 2'h2;
  wire        _GEN_104 = _GEN_98 ? sectored_entries_6_valid_2 : _GEN_103 | r_sectored_hit & sectored_entries_6_valid_2;
  wire        _GEN_105 = _GEN_98 ? sectored_entries_6_valid_3 : (&(r_refill_tag[1:0])) | r_sectored_hit & sectored_entries_6_valid_3;
  wire [34:0] _sectored_entries_6_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire        _GEN_106 = ~io_ptw_resp_valid | _GEN_43 | ~(&waddr);
  wire        _GEN_107 = r_refill_tag[1:0] == 2'h0;
  wire        _GEN_108 = _GEN_106 ? sectored_entries_7_valid_0 : _GEN_107 | r_sectored_hit & sectored_entries_7_valid_0;
  wire        _GEN_109 = r_refill_tag[1:0] == 2'h1;
  wire        _GEN_110 = _GEN_106 ? sectored_entries_7_valid_1 : _GEN_109 | r_sectored_hit & sectored_entries_7_valid_1;
  wire        _GEN_111 = r_refill_tag[1:0] == 2'h2;
  wire        _GEN_112 = _GEN_106 ? sectored_entries_7_valid_2 : _GEN_111 | r_sectored_hit & sectored_entries_7_valid_2;
  wire        _GEN_113 = _GEN_106 ? sectored_entries_7_valid_3 : (&(r_refill_tag[1:0])) | r_sectored_hit & sectored_entries_7_valid_3;
  wire [34:0] _sectored_entries_7_data_T = {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
  wire [2:0]  _GEN_114 = {sector_hits_0_7, sector_hits_0_6, sector_hits_0_5};
  wire [2:0]  _GEN_115 = {sector_hits_0_3, sector_hits_0_2, sector_hits_0_1};
  wire [2:0]  _GEN_116 = {sector_hits_1_7, sector_hits_1_6, sector_hits_1_5};
  wire [2:0]  _GEN_117 = {sector_hits_1_3, sector_hits_1_2, sector_hits_1_1};
  wire        _GEN_118 = io_req_0_valid & tlb_miss_0 & _io_miss_rdy_T;
  wire [2:0]  _GEN_119 = {superpage_entries_2_valid_0, superpage_entries_1_valid_0, superpage_entries_0_valid_0};
  wire        _GEN_120 = io_req_1_valid & tlb_miss_1 & _io_miss_rdy_T;
  wire        _GEN_121 = _hitsVec_T == 25'h0;
  wire        _GEN_122 = io_req_0_bits_vaddr[13:12] == 2'h0;
  wire        _GEN_123 = _GEN_121 & _GEN_122;
  wire        _GEN_124 = io_req_0_bits_vaddr[13:12] == 2'h1;
  wire        _GEN_125 = _GEN_121 & _GEN_124;
  wire        _GEN_126 = io_req_0_bits_vaddr[13:12] == 2'h2;
  wire        _GEN_127 = _GEN_121 & _GEN_126;
  wire        _GEN_128 = _GEN_121 & (&(io_req_0_bits_vaddr[13:12]));
  wire        _GEN_129 = _hitsVec_T[24:16] == 9'h0;
  wire        _GEN_130 = _GEN_129 ? ~(sectored_entries_0_data_0[0] | _GEN_123) & _GEN_46 : ~_GEN_123 & _GEN_46;
  wire        _GEN_131 = _GEN_129 ? ~(sectored_entries_0_data_1[0] | _GEN_125) & _GEN_48 : ~_GEN_125 & _GEN_48;
  wire        _GEN_132 = _GEN_129 ? ~(sectored_entries_0_data_2[0] | _GEN_127) & _GEN_50 : ~_GEN_127 & _GEN_50;
  wire        _GEN_133 = _GEN_129 ? ~(sectored_entries_0_data_3[0] | _GEN_128) & _GEN_51 : ~_GEN_128 & _GEN_51;
  wire        _GEN_134 = _hitsVec_T_5 == 25'h0;
  wire        _GEN_135 = _GEN_134 & _GEN_122;
  wire        _GEN_136 = _GEN_134 & _GEN_124;
  wire        _GEN_137 = _GEN_134 & _GEN_126;
  wire        _GEN_138 = _GEN_134 & (&(io_req_0_bits_vaddr[13:12]));
  wire        _GEN_139 = _hitsVec_T_5[24:16] == 9'h0;
  wire        _GEN_140 = _GEN_139 ? ~(sectored_entries_1_data_0[0] | _GEN_135) & _GEN_55 : ~_GEN_135 & _GEN_55;
  wire        _GEN_141 = _GEN_139 ? ~(sectored_entries_1_data_1[0] | _GEN_136) & _GEN_57 : ~_GEN_136 & _GEN_57;
  wire        _GEN_142 = _GEN_139 ? ~(sectored_entries_1_data_2[0] | _GEN_137) & _GEN_59 : ~_GEN_137 & _GEN_59;
  wire        _GEN_143 = _GEN_139 ? ~(sectored_entries_1_data_3[0] | _GEN_138) & _GEN_60 : ~_GEN_138 & _GEN_60;
  wire        _GEN_144 = _hitsVec_T_10 == 25'h0;
  wire        _GEN_145 = _GEN_144 & _GEN_122;
  wire        _GEN_146 = _GEN_144 & _GEN_124;
  wire        _GEN_147 = _GEN_144 & _GEN_126;
  wire        _GEN_148 = _GEN_144 & (&(io_req_0_bits_vaddr[13:12]));
  wire        _GEN_149 = _hitsVec_T_10[24:16] == 9'h0;
  wire        _GEN_150 = _GEN_149 ? ~(sectored_entries_2_data_0[0] | _GEN_145) & _GEN_64 : ~_GEN_145 & _GEN_64;
  wire        _GEN_151 = _GEN_149 ? ~(sectored_entries_2_data_1[0] | _GEN_146) & _GEN_66 : ~_GEN_146 & _GEN_66;
  wire        _GEN_152 = _GEN_149 ? ~(sectored_entries_2_data_2[0] | _GEN_147) & _GEN_68 : ~_GEN_147 & _GEN_68;
  wire        _GEN_153 = _GEN_149 ? ~(sectored_entries_2_data_3[0] | _GEN_148) & _GEN_69 : ~_GEN_148 & _GEN_69;
  wire        _GEN_154 = _hitsVec_T_15 == 25'h0;
  wire        _GEN_155 = _GEN_154 & _GEN_122;
  wire        _GEN_156 = _GEN_154 & _GEN_124;
  wire        _GEN_157 = _GEN_154 & _GEN_126;
  wire        _GEN_158 = _GEN_154 & (&(io_req_0_bits_vaddr[13:12]));
  wire        _GEN_159 = _hitsVec_T_15[24:16] == 9'h0;
  wire        _GEN_160 = _GEN_159 ? ~(sectored_entries_3_data_0[0] | _GEN_155) & _GEN_73 : ~_GEN_155 & _GEN_73;
  wire        _GEN_161 = _GEN_159 ? ~(sectored_entries_3_data_1[0] | _GEN_156) & _GEN_75 : ~_GEN_156 & _GEN_75;
  wire        _GEN_162 = _GEN_159 ? ~(sectored_entries_3_data_2[0] | _GEN_157) & _GEN_77 : ~_GEN_157 & _GEN_77;
  wire        _GEN_163 = _GEN_159 ? ~(sectored_entries_3_data_3[0] | _GEN_158) & _GEN_78 : ~_GEN_158 & _GEN_78;
  wire        _GEN_164 = _hitsVec_T_20 == 25'h0;
  wire        _GEN_165 = _GEN_164 & _GEN_122;
  wire        _GEN_166 = _GEN_164 & _GEN_124;
  wire        _GEN_167 = _GEN_164 & _GEN_126;
  wire        _GEN_168 = _GEN_164 & (&(io_req_0_bits_vaddr[13:12]));
  wire        _GEN_169 = _hitsVec_T_20[24:16] == 9'h0;
  wire        _GEN_170 = _GEN_169 ? ~(sectored_entries_4_data_0[0] | _GEN_165) & _GEN_82 : ~_GEN_165 & _GEN_82;
  wire        _GEN_171 = _GEN_169 ? ~(sectored_entries_4_data_1[0] | _GEN_166) & _GEN_84 : ~_GEN_166 & _GEN_84;
  wire        _GEN_172 = _GEN_169 ? ~(sectored_entries_4_data_2[0] | _GEN_167) & _GEN_86 : ~_GEN_167 & _GEN_86;
  wire        _GEN_173 = _GEN_169 ? ~(sectored_entries_4_data_3[0] | _GEN_168) & _GEN_87 : ~_GEN_168 & _GEN_87;
  wire        _GEN_174 = _hitsVec_T_25 == 25'h0;
  wire        _GEN_175 = _GEN_174 & _GEN_122;
  wire        _GEN_176 = _GEN_174 & _GEN_124;
  wire        _GEN_177 = _GEN_174 & _GEN_126;
  wire        _GEN_178 = _GEN_174 & (&(io_req_0_bits_vaddr[13:12]));
  wire        _GEN_179 = _hitsVec_T_25[24:16] == 9'h0;
  wire        _GEN_180 = _GEN_179 ? ~(sectored_entries_5_data_0[0] | _GEN_175) & _GEN_91 : ~_GEN_175 & _GEN_91;
  wire        _GEN_181 = _GEN_179 ? ~(sectored_entries_5_data_1[0] | _GEN_176) & _GEN_93 : ~_GEN_176 & _GEN_93;
  wire        _GEN_182 = _GEN_179 ? ~(sectored_entries_5_data_2[0] | _GEN_177) & _GEN_95 : ~_GEN_177 & _GEN_95;
  wire        _GEN_183 = _GEN_179 ? ~(sectored_entries_5_data_3[0] | _GEN_178) & _GEN_96 : ~_GEN_178 & _GEN_96;
  wire        _GEN_184 = _hitsVec_T_30 == 25'h0;
  wire        _GEN_185 = _GEN_184 & _GEN_122;
  wire        _GEN_186 = _GEN_184 & _GEN_124;
  wire        _GEN_187 = _GEN_184 & _GEN_126;
  wire        _GEN_188 = _GEN_184 & (&(io_req_0_bits_vaddr[13:12]));
  wire        _GEN_189 = _hitsVec_T_30[24:16] == 9'h0;
  wire        _GEN_190 = _GEN_189 ? ~(sectored_entries_6_data_0[0] | _GEN_185) & _GEN_100 : ~_GEN_185 & _GEN_100;
  wire        _GEN_191 = _GEN_189 ? ~(sectored_entries_6_data_1[0] | _GEN_186) & _GEN_102 : ~_GEN_186 & _GEN_102;
  wire        _GEN_192 = _GEN_189 ? ~(sectored_entries_6_data_2[0] | _GEN_187) & _GEN_104 : ~_GEN_187 & _GEN_104;
  wire        _GEN_193 = _GEN_189 ? ~(sectored_entries_6_data_3[0] | _GEN_188) & _GEN_105 : ~_GEN_188 & _GEN_105;
  wire        _GEN_194 = _hitsVec_T_35 == 25'h0;
  wire        _GEN_195 = _GEN_194 & _GEN_122;
  wire        _GEN_196 = _GEN_194 & _GEN_124;
  wire        _GEN_197 = _GEN_194 & _GEN_126;
  wire        _GEN_198 = _GEN_194 & (&(io_req_0_bits_vaddr[13:12]));
  wire        _GEN_199 = _hitsVec_T_35[24:16] == 9'h0;
  wire        _GEN_200 = _GEN_199 ? ~(sectored_entries_7_data_0[0] | _GEN_195) & _GEN_108 : ~_GEN_195 & _GEN_108;
  wire        _GEN_201 = _GEN_199 ? ~(sectored_entries_7_data_1[0] | _GEN_196) & _GEN_110 : ~_GEN_196 & _GEN_110;
  wire        _GEN_202 = _GEN_199 ? ~(sectored_entries_7_data_2[0] | _GEN_197) & _GEN_112 : ~_GEN_197 & _GEN_112;
  wire        _GEN_203 = _GEN_199 ? ~(sectored_entries_7_data_3[0] | _GEN_198) & _GEN_113 : ~_GEN_198 & _GEN_113;
  wire        _GEN_204 = _hitsVec_T_120 == 25'h0;
  wire        _GEN_205 = io_req_1_bits_vaddr[13:12] == 2'h0;
  wire        _GEN_206 = _GEN_204 & _GEN_205;
  wire        _GEN_207 = io_req_1_bits_vaddr[13:12] == 2'h1;
  wire        _GEN_208 = _GEN_204 & _GEN_207;
  wire        _GEN_209 = io_req_1_bits_vaddr[13:12] == 2'h2;
  wire        _GEN_210 = _GEN_204 & _GEN_209;
  wire        _GEN_211 = _GEN_204 & (&(io_req_1_bits_vaddr[13:12]));
  wire        _GEN_212 = _hitsVec_T_120[24:16] == 9'h0;
  wire        _GEN_213 = _hitsVec_T_125 == 25'h0;
  wire        _GEN_214 = _GEN_213 & _GEN_205;
  wire        _GEN_215 = _GEN_213 & _GEN_207;
  wire        _GEN_216 = _GEN_213 & _GEN_209;
  wire        _GEN_217 = _GEN_213 & (&(io_req_1_bits_vaddr[13:12]));
  wire        _GEN_218 = _hitsVec_T_125[24:16] == 9'h0;
  wire        _GEN_219 = _hitsVec_T_130 == 25'h0;
  wire        _GEN_220 = _GEN_219 & _GEN_205;
  wire        _GEN_221 = _GEN_219 & _GEN_207;
  wire        _GEN_222 = _GEN_219 & _GEN_209;
  wire        _GEN_223 = _GEN_219 & (&(io_req_1_bits_vaddr[13:12]));
  wire        _GEN_224 = _hitsVec_T_130[24:16] == 9'h0;
  wire        _GEN_225 = _hitsVec_T_135 == 25'h0;
  wire        _GEN_226 = _GEN_225 & _GEN_205;
  wire        _GEN_227 = _GEN_225 & _GEN_207;
  wire        _GEN_228 = _GEN_225 & _GEN_209;
  wire        _GEN_229 = _GEN_225 & (&(io_req_1_bits_vaddr[13:12]));
  wire        _GEN_230 = _hitsVec_T_135[24:16] == 9'h0;
  wire        _GEN_231 = _hitsVec_T_140 == 25'h0;
  wire        _GEN_232 = _GEN_231 & _GEN_205;
  wire        _GEN_233 = _GEN_231 & _GEN_207;
  wire        _GEN_234 = _GEN_231 & _GEN_209;
  wire        _GEN_235 = _GEN_231 & (&(io_req_1_bits_vaddr[13:12]));
  wire        _GEN_236 = _hitsVec_T_140[24:16] == 9'h0;
  wire        _GEN_237 = _hitsVec_T_145 == 25'h0;
  wire        _GEN_238 = _GEN_237 & _GEN_205;
  wire        _GEN_239 = _GEN_237 & _GEN_207;
  wire        _GEN_240 = _GEN_237 & _GEN_209;
  wire        _GEN_241 = _GEN_237 & (&(io_req_1_bits_vaddr[13:12]));
  wire        _GEN_242 = _hitsVec_T_145[24:16] == 9'h0;
  wire        _GEN_243 = _hitsVec_T_150 == 25'h0;
  wire        _GEN_244 = _GEN_243 & _GEN_205;
  wire        _GEN_245 = _GEN_243 & _GEN_207;
  wire        _GEN_246 = _GEN_243 & _GEN_209;
  wire        _GEN_247 = _GEN_243 & (&(io_req_1_bits_vaddr[13:12]));
  wire        _GEN_248 = _hitsVec_T_150[24:16] == 9'h0;
  wire        _GEN_249 = _hitsVec_T_155 == 25'h0;
  wire        _GEN_250 = _GEN_249 & _GEN_205;
  wire        _GEN_251 = _GEN_249 & _GEN_207;
  wire        _GEN_252 = _GEN_249 & _GEN_209;
  wire        _GEN_253 = _GEN_249 & (&(io_req_1_bits_vaddr[13:12]));
  wire        _GEN_254 = _hitsVec_T_155[24:16] == 9'h0;
  wire        _GEN_255 = multipleHits_0 | multipleHits_1 | reset;
  wire [2:0]  _r_superpage_repl_addr_T_19 = ~_GEN_119;
  wire        _r_sectored_repl_addr_valids_T_26 = _r_sectored_repl_addr_valids_T_24 | sectored_entries_0_valid_2 | sectored_entries_0_valid_3;
  wire        _r_sectored_repl_addr_valids_T_29 = _r_sectored_repl_addr_valids_T_27 | sectored_entries_1_valid_2 | sectored_entries_1_valid_3;
  wire        _r_sectored_repl_addr_valids_T_32 = _r_sectored_repl_addr_valids_T_30 | sectored_entries_2_valid_2 | sectored_entries_2_valid_3;
  wire        _r_sectored_repl_addr_valids_T_35 = _r_sectored_repl_addr_valids_T_33 | sectored_entries_3_valid_2 | sectored_entries_3_valid_3;
  wire        _r_sectored_repl_addr_valids_T_38 = _r_sectored_repl_addr_valids_T_36 | sectored_entries_4_valid_2 | sectored_entries_4_valid_3;
  wire        _r_sectored_repl_addr_valids_T_41 = _r_sectored_repl_addr_valids_T_39 | sectored_entries_5_valid_2 | sectored_entries_5_valid_3;
  wire        _r_sectored_repl_addr_valids_T_44 = _r_sectored_repl_addr_valids_T_42 | sectored_entries_6_valid_2 | sectored_entries_6_valid_3;
  wire [6:0]  _r_sectored_repl_addr_T_39 = ~{_r_sectored_repl_addr_valids_T_44, _r_sectored_repl_addr_valids_T_41, _r_sectored_repl_addr_valids_T_38, _r_sectored_repl_addr_valids_T_35, _r_sectored_repl_addr_valids_T_32, _r_sectored_repl_addr_valids_T_29, _r_sectored_repl_addr_valids_T_26};
  wire [2:0]  _r_sectored_hit_addr_T_10 = _GEN_116 | _GEN_117;
  wire [2:0]  _r_superpage_repl_addr_T_5 = ~_GEN_119;
  wire        _r_sectored_repl_addr_valids_T_2 = _r_sectored_repl_addr_valids_T_24 | sectored_entries_0_valid_2 | sectored_entries_0_valid_3;
  wire        _r_sectored_repl_addr_valids_T_5 = _r_sectored_repl_addr_valids_T_27 | sectored_entries_1_valid_2 | sectored_entries_1_valid_3;
  wire        _r_sectored_repl_addr_valids_T_8 = _r_sectored_repl_addr_valids_T_30 | sectored_entries_2_valid_2 | sectored_entries_2_valid_3;
  wire        _r_sectored_repl_addr_valids_T_11 = _r_sectored_repl_addr_valids_T_33 | sectored_entries_3_valid_2 | sectored_entries_3_valid_3;
  wire        _r_sectored_repl_addr_valids_T_14 = _r_sectored_repl_addr_valids_T_36 | sectored_entries_4_valid_2 | sectored_entries_4_valid_3;
  wire        _r_sectored_repl_addr_valids_T_17 = _r_sectored_repl_addr_valids_T_39 | sectored_entries_5_valid_2 | sectored_entries_5_valid_3;
  wire        _r_sectored_repl_addr_valids_T_20 = _r_sectored_repl_addr_valids_T_42 | sectored_entries_6_valid_2 | sectored_entries_6_valid_3;
  wire [6:0]  _r_sectored_repl_addr_T_11 = ~{_r_sectored_repl_addr_valids_T_20, _r_sectored_repl_addr_valids_T_17, _r_sectored_repl_addr_valids_T_14, _r_sectored_repl_addr_valids_T_11, _r_sectored_repl_addr_valids_T_8, _r_sectored_repl_addr_valids_T_5, _r_sectored_repl_addr_valids_T_2};
  wire [2:0]  _r_sectored_hit_addr_T_2 = _GEN_114 | _GEN_115;
  wire        _GEN_256 = _GEN_120 | _GEN_118;
  wire [3:0]  hi_6 = {sector_hits_1_7, sector_hits_1_6, sector_hits_1_5, sector_hits_1_4};
  wire [2:0]  _GEN_257 = _GEN_116 | _GEN_117;
  wire        _state_reg_T_38 = _GEN_257[2] | _GEN_257[0];
  wire [3:0]  hi_1 = {sector_hits_0_7, sector_hits_0_6, sector_hits_0_5, sector_hits_0_4};
  wire [2:0]  _GEN_258 = _GEN_114 | _GEN_115;
  wire        _state_reg_T_6 = _GEN_258[2] | _GEN_258[0];
  always @(posedge clock) begin
    if (_GEN_44) begin
    end
    else
      sectored_entries_0_tag <= r_refill_tag;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_42 & _GEN_45)) begin
    end
    else
      sectored_entries_0_data_0 <= _sectored_entries_0_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_42 & _GEN_47)) begin
    end
    else
      sectored_entries_0_data_1 <= _sectored_entries_0_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_42 & _GEN_49)) begin
    end
    else
      sectored_entries_0_data_2 <= _sectored_entries_0_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_42 & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_0_data_3 <= _sectored_entries_0_data_T;
    sectored_entries_0_valid_0 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_212 ? ~(sectored_entries_0_data_0[0] | _GEN_206) & _GEN_130 : ~_GEN_206 & _GEN_130) : io_sfence_bits_rs2 & sectored_entries_0_data_0[12] & _GEN_46) : _GEN_46);
    sectored_entries_0_valid_1 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_212 ? ~(sectored_entries_0_data_1[0] | _GEN_208) & _GEN_131 : ~_GEN_208 & _GEN_131) : io_sfence_bits_rs2 & sectored_entries_0_data_1[12] & _GEN_48) : _GEN_48);
    sectored_entries_0_valid_2 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_212 ? ~(sectored_entries_0_data_2[0] | _GEN_210) & _GEN_132 : ~_GEN_210 & _GEN_132) : io_sfence_bits_rs2 & sectored_entries_0_data_2[12] & _GEN_50) : _GEN_50);
    sectored_entries_0_valid_3 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_212 ? ~(sectored_entries_0_data_3[0] | _GEN_211) & _GEN_133 : ~_GEN_211 & _GEN_133) : io_sfence_bits_rs2 & sectored_entries_0_data_3[12] & _GEN_51) : _GEN_51);
    if (_GEN_53) begin
    end
    else
      sectored_entries_1_tag <= r_refill_tag;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_52 & _GEN_54)) begin
    end
    else
      sectored_entries_1_data_0 <= _sectored_entries_1_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_52 & _GEN_56)) begin
    end
    else
      sectored_entries_1_data_1 <= _sectored_entries_1_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_52 & _GEN_58)) begin
    end
    else
      sectored_entries_1_data_2 <= _sectored_entries_1_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_52 & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_1_data_3 <= _sectored_entries_1_data_T;
    sectored_entries_1_valid_0 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_218 ? ~(sectored_entries_1_data_0[0] | _GEN_214) & _GEN_140 : ~_GEN_214 & _GEN_140) : io_sfence_bits_rs2 & sectored_entries_1_data_0[12] & _GEN_55) : _GEN_55);
    sectored_entries_1_valid_1 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_218 ? ~(sectored_entries_1_data_1[0] | _GEN_215) & _GEN_141 : ~_GEN_215 & _GEN_141) : io_sfence_bits_rs2 & sectored_entries_1_data_1[12] & _GEN_57) : _GEN_57);
    sectored_entries_1_valid_2 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_218 ? ~(sectored_entries_1_data_2[0] | _GEN_216) & _GEN_142 : ~_GEN_216 & _GEN_142) : io_sfence_bits_rs2 & sectored_entries_1_data_2[12] & _GEN_59) : _GEN_59);
    sectored_entries_1_valid_3 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_218 ? ~(sectored_entries_1_data_3[0] | _GEN_217) & _GEN_143 : ~_GEN_217 & _GEN_143) : io_sfence_bits_rs2 & sectored_entries_1_data_3[12] & _GEN_60) : _GEN_60);
    if (_GEN_62) begin
    end
    else
      sectored_entries_2_tag <= r_refill_tag;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_61 & _GEN_63)) begin
    end
    else
      sectored_entries_2_data_0 <= _sectored_entries_2_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_61 & _GEN_65)) begin
    end
    else
      sectored_entries_2_data_1 <= _sectored_entries_2_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_61 & _GEN_67)) begin
    end
    else
      sectored_entries_2_data_2 <= _sectored_entries_2_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_61 & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_2_data_3 <= _sectored_entries_2_data_T;
    sectored_entries_2_valid_0 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_224 ? ~(sectored_entries_2_data_0[0] | _GEN_220) & _GEN_150 : ~_GEN_220 & _GEN_150) : io_sfence_bits_rs2 & sectored_entries_2_data_0[12] & _GEN_64) : _GEN_64);
    sectored_entries_2_valid_1 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_224 ? ~(sectored_entries_2_data_1[0] | _GEN_221) & _GEN_151 : ~_GEN_221 & _GEN_151) : io_sfence_bits_rs2 & sectored_entries_2_data_1[12] & _GEN_66) : _GEN_66);
    sectored_entries_2_valid_2 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_224 ? ~(sectored_entries_2_data_2[0] | _GEN_222) & _GEN_152 : ~_GEN_222 & _GEN_152) : io_sfence_bits_rs2 & sectored_entries_2_data_2[12] & _GEN_68) : _GEN_68);
    sectored_entries_2_valid_3 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_224 ? ~(sectored_entries_2_data_3[0] | _GEN_223) & _GEN_153 : ~_GEN_223 & _GEN_153) : io_sfence_bits_rs2 & sectored_entries_2_data_3[12] & _GEN_69) : _GEN_69);
    if (_GEN_71) begin
    end
    else
      sectored_entries_3_tag <= r_refill_tag;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_70 & _GEN_72)) begin
    end
    else
      sectored_entries_3_data_0 <= _sectored_entries_3_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_70 & _GEN_74)) begin
    end
    else
      sectored_entries_3_data_1 <= _sectored_entries_3_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_70 & _GEN_76)) begin
    end
    else
      sectored_entries_3_data_2 <= _sectored_entries_3_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_70 & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_3_data_3 <= _sectored_entries_3_data_T;
    sectored_entries_3_valid_0 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_230 ? ~(sectored_entries_3_data_0[0] | _GEN_226) & _GEN_160 : ~_GEN_226 & _GEN_160) : io_sfence_bits_rs2 & sectored_entries_3_data_0[12] & _GEN_73) : _GEN_73);
    sectored_entries_3_valid_1 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_230 ? ~(sectored_entries_3_data_1[0] | _GEN_227) & _GEN_161 : ~_GEN_227 & _GEN_161) : io_sfence_bits_rs2 & sectored_entries_3_data_1[12] & _GEN_75) : _GEN_75);
    sectored_entries_3_valid_2 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_230 ? ~(sectored_entries_3_data_2[0] | _GEN_228) & _GEN_162 : ~_GEN_228 & _GEN_162) : io_sfence_bits_rs2 & sectored_entries_3_data_2[12] & _GEN_77) : _GEN_77);
    sectored_entries_3_valid_3 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_230 ? ~(sectored_entries_3_data_3[0] | _GEN_229) & _GEN_163 : ~_GEN_229 & _GEN_163) : io_sfence_bits_rs2 & sectored_entries_3_data_3[12] & _GEN_78) : _GEN_78);
    if (_GEN_80) begin
    end
    else
      sectored_entries_4_tag <= r_refill_tag;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_79 & _GEN_81)) begin
    end
    else
      sectored_entries_4_data_0 <= _sectored_entries_4_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_79 & _GEN_83)) begin
    end
    else
      sectored_entries_4_data_1 <= _sectored_entries_4_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_79 & _GEN_85)) begin
    end
    else
      sectored_entries_4_data_2 <= _sectored_entries_4_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_79 & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_4_data_3 <= _sectored_entries_4_data_T;
    sectored_entries_4_valid_0 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_236 ? ~(sectored_entries_4_data_0[0] | _GEN_232) & _GEN_170 : ~_GEN_232 & _GEN_170) : io_sfence_bits_rs2 & sectored_entries_4_data_0[12] & _GEN_82) : _GEN_82);
    sectored_entries_4_valid_1 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_236 ? ~(sectored_entries_4_data_1[0] | _GEN_233) & _GEN_171 : ~_GEN_233 & _GEN_171) : io_sfence_bits_rs2 & sectored_entries_4_data_1[12] & _GEN_84) : _GEN_84);
    sectored_entries_4_valid_2 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_236 ? ~(sectored_entries_4_data_2[0] | _GEN_234) & _GEN_172 : ~_GEN_234 & _GEN_172) : io_sfence_bits_rs2 & sectored_entries_4_data_2[12] & _GEN_86) : _GEN_86);
    sectored_entries_4_valid_3 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_236 ? ~(sectored_entries_4_data_3[0] | _GEN_235) & _GEN_173 : ~_GEN_235 & _GEN_173) : io_sfence_bits_rs2 & sectored_entries_4_data_3[12] & _GEN_87) : _GEN_87);
    if (_GEN_89) begin
    end
    else
      sectored_entries_5_tag <= r_refill_tag;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_88 & _GEN_90)) begin
    end
    else
      sectored_entries_5_data_0 <= _sectored_entries_5_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_88 & _GEN_92)) begin
    end
    else
      sectored_entries_5_data_1 <= _sectored_entries_5_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_88 & _GEN_94)) begin
    end
    else
      sectored_entries_5_data_2 <= _sectored_entries_5_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_88 & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_5_data_3 <= _sectored_entries_5_data_T;
    sectored_entries_5_valid_0 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_242 ? ~(sectored_entries_5_data_0[0] | _GEN_238) & _GEN_180 : ~_GEN_238 & _GEN_180) : io_sfence_bits_rs2 & sectored_entries_5_data_0[12] & _GEN_91) : _GEN_91);
    sectored_entries_5_valid_1 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_242 ? ~(sectored_entries_5_data_1[0] | _GEN_239) & _GEN_181 : ~_GEN_239 & _GEN_181) : io_sfence_bits_rs2 & sectored_entries_5_data_1[12] & _GEN_93) : _GEN_93);
    sectored_entries_5_valid_2 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_242 ? ~(sectored_entries_5_data_2[0] | _GEN_240) & _GEN_182 : ~_GEN_240 & _GEN_182) : io_sfence_bits_rs2 & sectored_entries_5_data_2[12] & _GEN_95) : _GEN_95);
    sectored_entries_5_valid_3 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_242 ? ~(sectored_entries_5_data_3[0] | _GEN_241) & _GEN_183 : ~_GEN_241 & _GEN_183) : io_sfence_bits_rs2 & sectored_entries_5_data_3[12] & _GEN_96) : _GEN_96);
    if (_GEN_98) begin
    end
    else
      sectored_entries_6_tag <= r_refill_tag;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_97 & _GEN_99)) begin
    end
    else
      sectored_entries_6_data_0 <= _sectored_entries_6_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_97 & _GEN_101)) begin
    end
    else
      sectored_entries_6_data_1 <= _sectored_entries_6_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_97 & _GEN_103)) begin
    end
    else
      sectored_entries_6_data_2 <= _sectored_entries_6_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~(_GEN_97 & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_6_data_3 <= _sectored_entries_6_data_T;
    sectored_entries_6_valid_0 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_248 ? ~(sectored_entries_6_data_0[0] | _GEN_244) & _GEN_190 : ~_GEN_244 & _GEN_190) : io_sfence_bits_rs2 & sectored_entries_6_data_0[12] & _GEN_100) : _GEN_100);
    sectored_entries_6_valid_1 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_248 ? ~(sectored_entries_6_data_1[0] | _GEN_245) & _GEN_191 : ~_GEN_245 & _GEN_191) : io_sfence_bits_rs2 & sectored_entries_6_data_1[12] & _GEN_102) : _GEN_102);
    sectored_entries_6_valid_2 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_248 ? ~(sectored_entries_6_data_2[0] | _GEN_246) & _GEN_192 : ~_GEN_246 & _GEN_192) : io_sfence_bits_rs2 & sectored_entries_6_data_2[12] & _GEN_104) : _GEN_104);
    sectored_entries_6_valid_3 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_248 ? ~(sectored_entries_6_data_3[0] | _GEN_247) & _GEN_193 : ~_GEN_247 & _GEN_193) : io_sfence_bits_rs2 & sectored_entries_6_data_3[12] & _GEN_105) : _GEN_105);
    if (_GEN_106) begin
    end
    else
      sectored_entries_7_tag <= r_refill_tag;
    if (~io_ptw_resp_valid | _GEN_43 | ~((&waddr) & _GEN_107)) begin
    end
    else
      sectored_entries_7_data_0 <= _sectored_entries_7_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~((&waddr) & _GEN_109)) begin
    end
    else
      sectored_entries_7_data_1 <= _sectored_entries_7_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~((&waddr) & _GEN_111)) begin
    end
    else
      sectored_entries_7_data_2 <= _sectored_entries_7_data_T;
    if (~io_ptw_resp_valid | _GEN_43 | ~((&waddr) & (&(r_refill_tag[1:0])))) begin
    end
    else
      sectored_entries_7_data_3 <= _sectored_entries_7_data_T;
    sectored_entries_7_valid_0 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_254 ? ~(sectored_entries_7_data_0[0] | _GEN_250) & _GEN_200 : ~_GEN_250 & _GEN_200) : io_sfence_bits_rs2 & sectored_entries_7_data_0[12] & _GEN_108) : _GEN_108);
    sectored_entries_7_valid_1 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_254 ? ~(sectored_entries_7_data_1[0] | _GEN_251) & _GEN_201 : ~_GEN_251 & _GEN_201) : io_sfence_bits_rs2 & sectored_entries_7_data_1[12] & _GEN_110) : _GEN_110);
    sectored_entries_7_valid_2 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_254 ? ~(sectored_entries_7_data_2[0] | _GEN_252) & _GEN_202 : ~_GEN_252 & _GEN_202) : io_sfence_bits_rs2 & sectored_entries_7_data_2[12] & _GEN_112) : _GEN_112);
    sectored_entries_7_valid_3 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? (_GEN_254 ? ~(sectored_entries_7_data_3[0] | _GEN_253) & _GEN_203 : ~_GEN_253 & _GEN_203) : io_sfence_bits_rs2 & sectored_entries_7_data_3[12] & _GEN_113) : _GEN_113);
    if (_GEN_34) begin
      superpage_entries_0_level <= {1'h0, io_ptw_resp_bits_level[0]};
      superpage_entries_0_tag <= r_refill_tag;
      superpage_entries_0_data_0 <= {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
    end
    superpage_entries_0_valid_0 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? ~(superpage_entries_0_valid_0 & superpage_entries_0_tag[26:18] == io_req_1_bits_vaddr[38:30] & (ignore_1 | superpage_entries_0_tag[17:9] == io_req_1_bits_vaddr[29:21]) | superpage_entries_0_valid_0 & superpage_entries_0_tag[26:18] == io_req_0_bits_vaddr[38:30] & (ignore_1 | superpage_entries_0_tag[17:9] == io_req_0_bits_vaddr[29:21])) & _GEN_35 : io_sfence_bits_rs2 & superpage_entries_0_data_0[12] & _GEN_35) : _GEN_35);
    if (_GEN_36) begin
      superpage_entries_1_level <= {1'h0, io_ptw_resp_bits_level[0]};
      superpage_entries_1_tag <= r_refill_tag;
      superpage_entries_1_data_0 <= {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
    end
    superpage_entries_1_valid_0 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? ~(superpage_entries_1_valid_0 & superpage_entries_1_tag[26:18] == io_req_1_bits_vaddr[38:30] & (ignore_4 | superpage_entries_1_tag[17:9] == io_req_1_bits_vaddr[29:21]) | superpage_entries_1_valid_0 & superpage_entries_1_tag[26:18] == io_req_0_bits_vaddr[38:30] & (ignore_4 | superpage_entries_1_tag[17:9] == io_req_0_bits_vaddr[29:21])) & _GEN_37 : io_sfence_bits_rs2 & superpage_entries_1_data_0[12] & _GEN_37) : _GEN_37);
    if (_GEN_38) begin
      superpage_entries_2_level <= {1'h0, io_ptw_resp_bits_level[0]};
      superpage_entries_2_tag <= r_refill_tag;
      superpage_entries_2_data_0 <= {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
    end
    superpage_entries_2_valid_0 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? ~(superpage_entries_2_valid_0 & superpage_entries_2_tag[26:18] == io_req_1_bits_vaddr[38:30] & (ignore_7 | superpage_entries_2_tag[17:9] == io_req_1_bits_vaddr[29:21]) | superpage_entries_2_valid_0 & superpage_entries_2_tag[26:18] == io_req_0_bits_vaddr[38:30] & (ignore_7 | superpage_entries_2_tag[17:9] == io_req_0_bits_vaddr[29:21])) & _GEN_39 : io_sfence_bits_rs2 & superpage_entries_2_data_0[12] & _GEN_39) : _GEN_39);
    if (_GEN_40) begin
      superpage_entries_3_level <= {1'h0, io_ptw_resp_bits_level[0]};
      superpage_entries_3_tag <= r_refill_tag;
      superpage_entries_3_data_0 <= {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
    end
    superpage_entries_3_valid_0 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? ~(superpage_entries_3_valid_0 & superpage_entries_3_tag[26:18] == io_req_1_bits_vaddr[38:30] & (ignore_10 | superpage_entries_3_tag[17:9] == io_req_1_bits_vaddr[29:21]) | superpage_entries_3_valid_0 & superpage_entries_3_tag[26:18] == io_req_0_bits_vaddr[38:30] & (ignore_10 | superpage_entries_3_tag[17:9] == io_req_0_bits_vaddr[29:21])) & _GEN_41 : io_sfence_bits_rs2 & superpage_entries_3_data_0[12] & _GEN_41) : _GEN_41);
    if (_GEN_32) begin
      special_entry_level <= io_ptw_resp_bits_level;
      special_entry_tag <= r_refill_tag;
      special_entry_data_0 <= {io_ptw_resp_bits_pte_ppn[20:0], io_ptw_resp_bits_pte_u, io_ptw_resp_bits_pte_g, io_ptw_resp_bits_ae_final, newEntry_sw, newEntry_sx, newEntry_sr, newEntry_pw, newEntry_px, newEntry_pr, newEntry_pal, newEntry_paa, newEntry_eff, newEntry_c, 1'h0};
    end
    special_entry_valid_0 <= ~_GEN_255 & (io_sfence_valid ? (io_sfence_bits_rs1 ? ~(special_entry_valid_0 & special_entry_tag[26:18] == io_req_1_bits_vaddr[38:30] & (ignore_13 | special_entry_tag[17:9] == io_req_1_bits_vaddr[29:21]) & (~(special_entry_level[1]) | special_entry_tag[8:0] == io_req_1_bits_vaddr[20:12]) | special_entry_valid_0 & special_entry_tag[26:18] == io_req_0_bits_vaddr[38:30] & (ignore_13 | special_entry_tag[17:9] == io_req_0_bits_vaddr[29:21]) & (~(special_entry_level[1]) | special_entry_tag[8:0] == io_req_0_bits_vaddr[20:12])) & _GEN_33 : io_sfence_bits_rs2 & special_entry_data_0[12] & _GEN_33) : _GEN_33);
    if (_GEN_120) begin
      r_refill_tag <= io_req_1_bits_vaddr[38:12];
      r_superpage_repl_addr <= (&{superpage_entries_3_valid_0, superpage_entries_2_valid_0, superpage_entries_1_valid_0, superpage_entries_0_valid_0}) ? {state_reg_1[2], state_reg_1[2] ? state_reg_1[1] : state_reg_1[0]} : _r_superpage_repl_addr_T_19[0] ? 2'h0 : _r_superpage_repl_addr_T_19[1] ? 2'h1 : {1'h1, ~(_r_superpage_repl_addr_T_19[2])};
      r_sectored_repl_addr <= (&{_r_sectored_repl_addr_valids_T_45 | sectored_entries_7_valid_2 | sectored_entries_7_valid_3, _r_sectored_repl_addr_valids_T_44, _r_sectored_repl_addr_valids_T_41, _r_sectored_repl_addr_valids_T_38, _r_sectored_repl_addr_valids_T_35, _r_sectored_repl_addr_valids_T_32, _r_sectored_repl_addr_valids_T_29, _r_sectored_repl_addr_valids_T_26}) ? {state_reg[6], state_reg[6] ? {state_reg[5], state_reg[5] ? state_reg[4] : state_reg[3]} : {state_reg[2], state_reg[2] ? state_reg[1] : state_reg[0]}} : _r_sectored_repl_addr_T_39[0] ? 3'h0 : _r_sectored_repl_addr_T_39[1] ? 3'h1 : _r_sectored_repl_addr_T_39[2] ? 3'h2 : _r_sectored_repl_addr_T_39[3] ? 3'h3 : _r_sectored_repl_addr_T_39[4] ? 3'h4 : _r_sectored_repl_addr_T_39[5] ? 3'h5 : {2'h3, ~(_r_sectored_repl_addr_T_39[6])};
      r_sectored_hit_addr <= {|{sector_hits_1_7, sector_hits_1_6, sector_hits_1_5, sector_hits_1_4}, |(_r_sectored_hit_addr_T_10[2:1]), _r_sectored_hit_addr_T_10[2] | _r_sectored_hit_addr_T_10[0]};
      r_sectored_hit <= sector_hits_1_0 | sector_hits_1_1 | sector_hits_1_2 | sector_hits_1_3 | sector_hits_1_4 | sector_hits_1_5 | sector_hits_1_6 | sector_hits_1_7;
    end
    else if (_GEN_118) begin
      r_refill_tag <= io_req_0_bits_vaddr[38:12];
      r_superpage_repl_addr <= (&{superpage_entries_3_valid_0, superpage_entries_2_valid_0, superpage_entries_1_valid_0, superpage_entries_0_valid_0}) ? {state_reg_1[2], state_reg_1[2] ? state_reg_1[1] : state_reg_1[0]} : _r_superpage_repl_addr_T_5[0] ? 2'h0 : _r_superpage_repl_addr_T_5[1] ? 2'h1 : {1'h1, ~(_r_superpage_repl_addr_T_5[2])};
      r_sectored_repl_addr <= (&{_r_sectored_repl_addr_valids_T_45 | sectored_entries_7_valid_2 | sectored_entries_7_valid_3, _r_sectored_repl_addr_valids_T_20, _r_sectored_repl_addr_valids_T_17, _r_sectored_repl_addr_valids_T_14, _r_sectored_repl_addr_valids_T_11, _r_sectored_repl_addr_valids_T_8, _r_sectored_repl_addr_valids_T_5, _r_sectored_repl_addr_valids_T_2}) ? {state_reg[6], state_reg[6] ? {state_reg[5], state_reg[5] ? state_reg[4] : state_reg[3]} : {state_reg[2], state_reg[2] ? state_reg[1] : state_reg[0]}} : _r_sectored_repl_addr_T_11[0] ? 3'h0 : _r_sectored_repl_addr_T_11[1] ? 3'h1 : _r_sectored_repl_addr_T_11[2] ? 3'h2 : _r_sectored_repl_addr_T_11[3] ? 3'h3 : _r_sectored_repl_addr_T_11[4] ? 3'h4 : _r_sectored_repl_addr_T_11[5] ? 3'h5 : {2'h3, ~(_r_sectored_repl_addr_T_11[6])};
      r_sectored_hit_addr <= {|{sector_hits_0_7, sector_hits_0_6, sector_hits_0_5, sector_hits_0_4}, |(_r_sectored_hit_addr_T_2[2:1]), _r_sectored_hit_addr_T_2[2] | _r_sectored_hit_addr_T_2[0]};
      r_sectored_hit <= sector_hits_0_0 | sector_hits_0_1 | sector_hits_0_2 | sector_hits_0_3 | sector_hits_0_4 | sector_hits_0_5 | sector_hits_0_6 | sector_hits_0_7;
    end
    if (reset) begin
      state <= 2'h0;
      state_reg <= 7'h0;
      state_reg_1 <= 3'h0;
    end
    else begin
      if (io_ptw_resp_valid)
        state <= 2'h0;
      else if (state == 2'h2 & io_sfence_valid)
        state <= 2'h3;
      else if (_io_ptw_req_valid_T) begin
        if (io_kill)
          state <= 2'h0;
        else if (io_ptw_req_ready)
          state <= {1'h1, io_sfence_valid};
        else if (io_sfence_valid)
          state <= 2'h0;
        else if (_GEN_256)
          state <= 2'h1;
      end
      else if (_GEN_256)
        state <= 2'h1;
      if (_GEN_31 & (sector_hits_1_0 | sector_hits_1_1 | sector_hits_1_2 | sector_hits_1_3 | sector_hits_1_4 | sector_hits_1_5 | sector_hits_1_6 | sector_hits_1_7))
        state_reg <= {~(|hi_6), (|hi_6) ? {~(|(_GEN_257[2:1])), (|(_GEN_257[2:1])) ? ~_state_reg_T_38 : state_reg[4], (|(_GEN_257[2:1])) ? state_reg[3] : ~_state_reg_T_38} : state_reg[5:3], (|hi_6) ? state_reg[2:0] : {~(|(_GEN_257[2:1])), (|(_GEN_257[2:1])) ? ~_state_reg_T_38 : state_reg[1], (|(_GEN_257[2:1])) ? state_reg[0] : ~_state_reg_T_38}};
      else if (_GEN_30 & (sector_hits_0_0 | sector_hits_0_1 | sector_hits_0_2 | sector_hits_0_3 | sector_hits_0_4 | sector_hits_0_5 | sector_hits_0_6 | sector_hits_0_7))
        state_reg <= {~(|hi_1), (|hi_1) ? {~(|(_GEN_258[2:1])), (|(_GEN_258[2:1])) ? ~_state_reg_T_6 : state_reg[4], (|(_GEN_258[2:1])) ? state_reg[3] : ~_state_reg_T_6} : state_reg[5:3], (|hi_1) ? state_reg[2:0] : {~(|(_GEN_258[2:1])), (|(_GEN_258[2:1])) ? ~_state_reg_T_6 : state_reg[1], (|(_GEN_258[2:1])) ? state_reg[0] : ~_state_reg_T_6}};
      if (_GEN_31 & (superpage_entries_0_valid_0 & superpage_entries_0_tag[26:18] == io_req_1_bits_vaddr[38:30] & (ignore_1 | superpage_entries_0_tag[17:9] == io_req_1_bits_vaddr[29:21]) | superpage_hits_1_1 | superpage_hits_1_2 | superpage_hits_1_3))
        state_reg_1 <= {~(|hi_9), (|hi_9) ? ~_state_reg_T_60 : state_reg_1[1], (|hi_9) ? state_reg_1[0] : ~_state_reg_T_60};
      else if (_GEN_30 & (superpage_entries_0_valid_0 & superpage_entries_0_tag[26:18] == io_req_0_bits_vaddr[38:30] & (ignore_1 | superpage_entries_0_tag[17:9] == io_req_0_bits_vaddr[29:21]) | superpage_hits_0_1 | superpage_hits_0_2 | superpage_hits_0_3))
        state_reg_1 <= {~(|hi_4), (|hi_4) ? ~_state_reg_T_28 : state_reg_1[1], (|hi_4) ? state_reg_1[0] : ~_state_reg_T_28};
    end
  end // always @(posedge)
  OptimizationBarrier_14 mpu_ppn_data_barrier (
    .io_x_ppn (special_entry_data_0[34:14]),
    .io_x_u   (special_entry_data_0[13]),
    .io_x_ae  (special_entry_data_0[11]),
    .io_x_sw  (special_entry_data_0[10]),
    .io_x_sx  (special_entry_data_0[9]),
    .io_x_sr  (special_entry_data_0[8]),
    .io_x_pw  (special_entry_data_0[7]),
    .io_x_pr  (special_entry_data_0[5]),
    .io_x_pal (special_entry_data_0[4]),
    .io_x_paa (special_entry_data_0[3]),
    .io_x_eff (special_entry_data_0[2]),
    .io_x_c   (special_entry_data_0[1]),
    .io_y_ppn (_mpu_ppn_data_barrier_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 mpu_ppn_data_barrier_1 (
    .io_x_ppn (special_entry_data_0[34:14]),
    .io_x_u   (special_entry_data_0[13]),
    .io_x_ae  (special_entry_data_0[11]),
    .io_x_sw  (special_entry_data_0[10]),
    .io_x_sx  (special_entry_data_0[9]),
    .io_x_sr  (special_entry_data_0[8]),
    .io_x_pw  (special_entry_data_0[7]),
    .io_x_pr  (special_entry_data_0[5]),
    .io_x_pal (special_entry_data_0[4]),
    .io_x_paa (special_entry_data_0[3]),
    .io_x_eff (special_entry_data_0[2]),
    .io_x_c   (special_entry_data_0[1]),
    .io_y_ppn (_mpu_ppn_data_barrier_1_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  PMPChecker_1 pmp_0 (
    .io_prv         (io_ptw_resp_valid | io_req_0_bits_passthrough ? 2'h1 : io_ptw_status_dprv),
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
    .io_addr        ({mpu_ppn_0[20:0], io_req_0_bits_vaddr[11:0]}),
    .io_size        (io_req_0_bits_size),
    .io_r           (_pmp_0_io_r),
    .io_w           (_pmp_0_io_w),
    .io_x           (_pmp_0_io_x)
  );
  PMPChecker_1 pmp_1 (
    .io_prv         (io_ptw_resp_valid | io_req_1_bits_passthrough ? 2'h1 : io_ptw_status_dprv),
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
    .io_addr        ({mpu_ppn_1[20:0], io_req_1_bits_vaddr[11:0]}),
    .io_size        (io_req_1_bits_size),
    .io_r           (_pmp_1_io_r),
    .io_w           (_pmp_1_io_w),
    .io_x           (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier (
    .io_x_ppn (casez_tmp_15[34:14]),
    .io_x_u   (casez_tmp_15[13]),
    .io_x_ae  (casez_tmp_15[11]),
    .io_x_sw  (casez_tmp_15[10]),
    .io_x_sx  (casez_tmp_15[9]),
    .io_x_sr  (casez_tmp_15[8]),
    .io_x_pw  (casez_tmp_15[7]),
    .io_x_pr  (casez_tmp_15[5]),
    .io_x_pal (casez_tmp_15[4]),
    .io_x_paa (casez_tmp_15[3]),
    .io_x_eff (casez_tmp_15[2]),
    .io_x_c   (casez_tmp_15[1]),
    .io_y_ppn (_ppn_data_barrier_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_1 (
    .io_x_ppn (casez_tmp_16[34:14]),
    .io_x_u   (casez_tmp_16[13]),
    .io_x_ae  (casez_tmp_16[11]),
    .io_x_sw  (casez_tmp_16[10]),
    .io_x_sx  (casez_tmp_16[9]),
    .io_x_sr  (casez_tmp_16[8]),
    .io_x_pw  (casez_tmp_16[7]),
    .io_x_pr  (casez_tmp_16[5]),
    .io_x_pal (casez_tmp_16[4]),
    .io_x_paa (casez_tmp_16[3]),
    .io_x_eff (casez_tmp_16[2]),
    .io_x_c   (casez_tmp_16[1]),
    .io_y_ppn (_ppn_data_barrier_1_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_2 (
    .io_x_ppn (casez_tmp_17[34:14]),
    .io_x_u   (casez_tmp_17[13]),
    .io_x_ae  (casez_tmp_17[11]),
    .io_x_sw  (casez_tmp_17[10]),
    .io_x_sx  (casez_tmp_17[9]),
    .io_x_sr  (casez_tmp_17[8]),
    .io_x_pw  (casez_tmp_17[7]),
    .io_x_pr  (casez_tmp_17[5]),
    .io_x_pal (casez_tmp_17[4]),
    .io_x_paa (casez_tmp_17[3]),
    .io_x_eff (casez_tmp_17[2]),
    .io_x_c   (casez_tmp_17[1]),
    .io_y_ppn (_ppn_data_barrier_2_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_3 (
    .io_x_ppn (casez_tmp_18[34:14]),
    .io_x_u   (casez_tmp_18[13]),
    .io_x_ae  (casez_tmp_18[11]),
    .io_x_sw  (casez_tmp_18[10]),
    .io_x_sx  (casez_tmp_18[9]),
    .io_x_sr  (casez_tmp_18[8]),
    .io_x_pw  (casez_tmp_18[7]),
    .io_x_pr  (casez_tmp_18[5]),
    .io_x_pal (casez_tmp_18[4]),
    .io_x_paa (casez_tmp_18[3]),
    .io_x_eff (casez_tmp_18[2]),
    .io_x_c   (casez_tmp_18[1]),
    .io_y_ppn (_ppn_data_barrier_3_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_4 (
    .io_x_ppn (casez_tmp_19[34:14]),
    .io_x_u   (casez_tmp_19[13]),
    .io_x_ae  (casez_tmp_19[11]),
    .io_x_sw  (casez_tmp_19[10]),
    .io_x_sx  (casez_tmp_19[9]),
    .io_x_sr  (casez_tmp_19[8]),
    .io_x_pw  (casez_tmp_19[7]),
    .io_x_pr  (casez_tmp_19[5]),
    .io_x_pal (casez_tmp_19[4]),
    .io_x_paa (casez_tmp_19[3]),
    .io_x_eff (casez_tmp_19[2]),
    .io_x_c   (casez_tmp_19[1]),
    .io_y_ppn (_ppn_data_barrier_4_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_5 (
    .io_x_ppn (casez_tmp_20[34:14]),
    .io_x_u   (casez_tmp_20[13]),
    .io_x_ae  (casez_tmp_20[11]),
    .io_x_sw  (casez_tmp_20[10]),
    .io_x_sx  (casez_tmp_20[9]),
    .io_x_sr  (casez_tmp_20[8]),
    .io_x_pw  (casez_tmp_20[7]),
    .io_x_pr  (casez_tmp_20[5]),
    .io_x_pal (casez_tmp_20[4]),
    .io_x_paa (casez_tmp_20[3]),
    .io_x_eff (casez_tmp_20[2]),
    .io_x_c   (casez_tmp_20[1]),
    .io_y_ppn (_ppn_data_barrier_5_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_6 (
    .io_x_ppn (casez_tmp_21[34:14]),
    .io_x_u   (casez_tmp_21[13]),
    .io_x_ae  (casez_tmp_21[11]),
    .io_x_sw  (casez_tmp_21[10]),
    .io_x_sx  (casez_tmp_21[9]),
    .io_x_sr  (casez_tmp_21[8]),
    .io_x_pw  (casez_tmp_21[7]),
    .io_x_pr  (casez_tmp_21[5]),
    .io_x_pal (casez_tmp_21[4]),
    .io_x_paa (casez_tmp_21[3]),
    .io_x_eff (casez_tmp_21[2]),
    .io_x_c   (casez_tmp_21[1]),
    .io_y_ppn (_ppn_data_barrier_6_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_7 (
    .io_x_ppn (casez_tmp_22[34:14]),
    .io_x_u   (casez_tmp_22[13]),
    .io_x_ae  (casez_tmp_22[11]),
    .io_x_sw  (casez_tmp_22[10]),
    .io_x_sx  (casez_tmp_22[9]),
    .io_x_sr  (casez_tmp_22[8]),
    .io_x_pw  (casez_tmp_22[7]),
    .io_x_pr  (casez_tmp_22[5]),
    .io_x_pal (casez_tmp_22[4]),
    .io_x_paa (casez_tmp_22[3]),
    .io_x_eff (casez_tmp_22[2]),
    .io_x_c   (casez_tmp_22[1]),
    .io_y_ppn (_ppn_data_barrier_7_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_8 (
    .io_x_ppn (superpage_entries_0_data_0[34:14]),
    .io_x_u   (superpage_entries_0_data_0[13]),
    .io_x_ae  (superpage_entries_0_data_0[11]),
    .io_x_sw  (superpage_entries_0_data_0[10]),
    .io_x_sx  (superpage_entries_0_data_0[9]),
    .io_x_sr  (superpage_entries_0_data_0[8]),
    .io_x_pw  (superpage_entries_0_data_0[7]),
    .io_x_pr  (superpage_entries_0_data_0[5]),
    .io_x_pal (superpage_entries_0_data_0[4]),
    .io_x_paa (superpage_entries_0_data_0[3]),
    .io_x_eff (superpage_entries_0_data_0[2]),
    .io_x_c   (superpage_entries_0_data_0[1]),
    .io_y_ppn (_ppn_data_barrier_8_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_9 (
    .io_x_ppn (superpage_entries_1_data_0[34:14]),
    .io_x_u   (superpage_entries_1_data_0[13]),
    .io_x_ae  (superpage_entries_1_data_0[11]),
    .io_x_sw  (superpage_entries_1_data_0[10]),
    .io_x_sx  (superpage_entries_1_data_0[9]),
    .io_x_sr  (superpage_entries_1_data_0[8]),
    .io_x_pw  (superpage_entries_1_data_0[7]),
    .io_x_pr  (superpage_entries_1_data_0[5]),
    .io_x_pal (superpage_entries_1_data_0[4]),
    .io_x_paa (superpage_entries_1_data_0[3]),
    .io_x_eff (superpage_entries_1_data_0[2]),
    .io_x_c   (superpage_entries_1_data_0[1]),
    .io_y_ppn (_ppn_data_barrier_9_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_10 (
    .io_x_ppn (superpage_entries_2_data_0[34:14]),
    .io_x_u   (superpage_entries_2_data_0[13]),
    .io_x_ae  (superpage_entries_2_data_0[11]),
    .io_x_sw  (superpage_entries_2_data_0[10]),
    .io_x_sx  (superpage_entries_2_data_0[9]),
    .io_x_sr  (superpage_entries_2_data_0[8]),
    .io_x_pw  (superpage_entries_2_data_0[7]),
    .io_x_pr  (superpage_entries_2_data_0[5]),
    .io_x_pal (superpage_entries_2_data_0[4]),
    .io_x_paa (superpage_entries_2_data_0[3]),
    .io_x_eff (superpage_entries_2_data_0[2]),
    .io_x_c   (superpage_entries_2_data_0[1]),
    .io_y_ppn (_ppn_data_barrier_10_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_11 (
    .io_x_ppn (superpage_entries_3_data_0[34:14]),
    .io_x_u   (superpage_entries_3_data_0[13]),
    .io_x_ae  (superpage_entries_3_data_0[11]),
    .io_x_sw  (superpage_entries_3_data_0[10]),
    .io_x_sx  (superpage_entries_3_data_0[9]),
    .io_x_sr  (superpage_entries_3_data_0[8]),
    .io_x_pw  (superpage_entries_3_data_0[7]),
    .io_x_pr  (superpage_entries_3_data_0[5]),
    .io_x_pal (superpage_entries_3_data_0[4]),
    .io_x_paa (superpage_entries_3_data_0[3]),
    .io_x_eff (superpage_entries_3_data_0[2]),
    .io_x_c   (superpage_entries_3_data_0[1]),
    .io_y_ppn (_ppn_data_barrier_11_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_12 (
    .io_x_ppn (special_entry_data_0[34:14]),
    .io_x_u   (special_entry_data_0[13]),
    .io_x_ae  (special_entry_data_0[11]),
    .io_x_sw  (special_entry_data_0[10]),
    .io_x_sx  (special_entry_data_0[9]),
    .io_x_sr  (special_entry_data_0[8]),
    .io_x_pw  (special_entry_data_0[7]),
    .io_x_pr  (special_entry_data_0[5]),
    .io_x_pal (special_entry_data_0[4]),
    .io_x_paa (special_entry_data_0[3]),
    .io_x_eff (special_entry_data_0[2]),
    .io_x_c   (special_entry_data_0[1]),
    .io_y_ppn (_ppn_data_barrier_12_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_13 (
    .io_x_ppn (casez_tmp_23[34:14]),
    .io_x_u   (casez_tmp_23[13]),
    .io_x_ae  (casez_tmp_23[11]),
    .io_x_sw  (casez_tmp_23[10]),
    .io_x_sx  (casez_tmp_23[9]),
    .io_x_sr  (casez_tmp_23[8]),
    .io_x_pw  (casez_tmp_23[7]),
    .io_x_pr  (casez_tmp_23[5]),
    .io_x_pal (casez_tmp_23[4]),
    .io_x_paa (casez_tmp_23[3]),
    .io_x_eff (casez_tmp_23[2]),
    .io_x_c   (casez_tmp_23[1]),
    .io_y_ppn (_ppn_data_barrier_13_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_14 (
    .io_x_ppn (casez_tmp_24[34:14]),
    .io_x_u   (casez_tmp_24[13]),
    .io_x_ae  (casez_tmp_24[11]),
    .io_x_sw  (casez_tmp_24[10]),
    .io_x_sx  (casez_tmp_24[9]),
    .io_x_sr  (casez_tmp_24[8]),
    .io_x_pw  (casez_tmp_24[7]),
    .io_x_pr  (casez_tmp_24[5]),
    .io_x_pal (casez_tmp_24[4]),
    .io_x_paa (casez_tmp_24[3]),
    .io_x_eff (casez_tmp_24[2]),
    .io_x_c   (casez_tmp_24[1]),
    .io_y_ppn (_ppn_data_barrier_14_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_15 (
    .io_x_ppn (casez_tmp_25[34:14]),
    .io_x_u   (casez_tmp_25[13]),
    .io_x_ae  (casez_tmp_25[11]),
    .io_x_sw  (casez_tmp_25[10]),
    .io_x_sx  (casez_tmp_25[9]),
    .io_x_sr  (casez_tmp_25[8]),
    .io_x_pw  (casez_tmp_25[7]),
    .io_x_pr  (casez_tmp_25[5]),
    .io_x_pal (casez_tmp_25[4]),
    .io_x_paa (casez_tmp_25[3]),
    .io_x_eff (casez_tmp_25[2]),
    .io_x_c   (casez_tmp_25[1]),
    .io_y_ppn (_ppn_data_barrier_15_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_16 (
    .io_x_ppn (casez_tmp_26[34:14]),
    .io_x_u   (casez_tmp_26[13]),
    .io_x_ae  (casez_tmp_26[11]),
    .io_x_sw  (casez_tmp_26[10]),
    .io_x_sx  (casez_tmp_26[9]),
    .io_x_sr  (casez_tmp_26[8]),
    .io_x_pw  (casez_tmp_26[7]),
    .io_x_pr  (casez_tmp_26[5]),
    .io_x_pal (casez_tmp_26[4]),
    .io_x_paa (casez_tmp_26[3]),
    .io_x_eff (casez_tmp_26[2]),
    .io_x_c   (casez_tmp_26[1]),
    .io_y_ppn (_ppn_data_barrier_16_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_17 (
    .io_x_ppn (casez_tmp_27[34:14]),
    .io_x_u   (casez_tmp_27[13]),
    .io_x_ae  (casez_tmp_27[11]),
    .io_x_sw  (casez_tmp_27[10]),
    .io_x_sx  (casez_tmp_27[9]),
    .io_x_sr  (casez_tmp_27[8]),
    .io_x_pw  (casez_tmp_27[7]),
    .io_x_pr  (casez_tmp_27[5]),
    .io_x_pal (casez_tmp_27[4]),
    .io_x_paa (casez_tmp_27[3]),
    .io_x_eff (casez_tmp_27[2]),
    .io_x_c   (casez_tmp_27[1]),
    .io_y_ppn (_ppn_data_barrier_17_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_18 (
    .io_x_ppn (casez_tmp_28[34:14]),
    .io_x_u   (casez_tmp_28[13]),
    .io_x_ae  (casez_tmp_28[11]),
    .io_x_sw  (casez_tmp_28[10]),
    .io_x_sx  (casez_tmp_28[9]),
    .io_x_sr  (casez_tmp_28[8]),
    .io_x_pw  (casez_tmp_28[7]),
    .io_x_pr  (casez_tmp_28[5]),
    .io_x_pal (casez_tmp_28[4]),
    .io_x_paa (casez_tmp_28[3]),
    .io_x_eff (casez_tmp_28[2]),
    .io_x_c   (casez_tmp_28[1]),
    .io_y_ppn (_ppn_data_barrier_18_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_19 (
    .io_x_ppn (casez_tmp_29[34:14]),
    .io_x_u   (casez_tmp_29[13]),
    .io_x_ae  (casez_tmp_29[11]),
    .io_x_sw  (casez_tmp_29[10]),
    .io_x_sx  (casez_tmp_29[9]),
    .io_x_sr  (casez_tmp_29[8]),
    .io_x_pw  (casez_tmp_29[7]),
    .io_x_pr  (casez_tmp_29[5]),
    .io_x_pal (casez_tmp_29[4]),
    .io_x_paa (casez_tmp_29[3]),
    .io_x_eff (casez_tmp_29[2]),
    .io_x_c   (casez_tmp_29[1]),
    .io_y_ppn (_ppn_data_barrier_19_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_20 (
    .io_x_ppn (casez_tmp_30[34:14]),
    .io_x_u   (casez_tmp_30[13]),
    .io_x_ae  (casez_tmp_30[11]),
    .io_x_sw  (casez_tmp_30[10]),
    .io_x_sx  (casez_tmp_30[9]),
    .io_x_sr  (casez_tmp_30[8]),
    .io_x_pw  (casez_tmp_30[7]),
    .io_x_pr  (casez_tmp_30[5]),
    .io_x_pal (casez_tmp_30[4]),
    .io_x_paa (casez_tmp_30[3]),
    .io_x_eff (casez_tmp_30[2]),
    .io_x_c   (casez_tmp_30[1]),
    .io_y_ppn (_ppn_data_barrier_20_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_21 (
    .io_x_ppn (superpage_entries_0_data_0[34:14]),
    .io_x_u   (superpage_entries_0_data_0[13]),
    .io_x_ae  (superpage_entries_0_data_0[11]),
    .io_x_sw  (superpage_entries_0_data_0[10]),
    .io_x_sx  (superpage_entries_0_data_0[9]),
    .io_x_sr  (superpage_entries_0_data_0[8]),
    .io_x_pw  (superpage_entries_0_data_0[7]),
    .io_x_pr  (superpage_entries_0_data_0[5]),
    .io_x_pal (superpage_entries_0_data_0[4]),
    .io_x_paa (superpage_entries_0_data_0[3]),
    .io_x_eff (superpage_entries_0_data_0[2]),
    .io_x_c   (superpage_entries_0_data_0[1]),
    .io_y_ppn (_ppn_data_barrier_21_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_22 (
    .io_x_ppn (superpage_entries_1_data_0[34:14]),
    .io_x_u   (superpage_entries_1_data_0[13]),
    .io_x_ae  (superpage_entries_1_data_0[11]),
    .io_x_sw  (superpage_entries_1_data_0[10]),
    .io_x_sx  (superpage_entries_1_data_0[9]),
    .io_x_sr  (superpage_entries_1_data_0[8]),
    .io_x_pw  (superpage_entries_1_data_0[7]),
    .io_x_pr  (superpage_entries_1_data_0[5]),
    .io_x_pal (superpage_entries_1_data_0[4]),
    .io_x_paa (superpage_entries_1_data_0[3]),
    .io_x_eff (superpage_entries_1_data_0[2]),
    .io_x_c   (superpage_entries_1_data_0[1]),
    .io_y_ppn (_ppn_data_barrier_22_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_23 (
    .io_x_ppn (superpage_entries_2_data_0[34:14]),
    .io_x_u   (superpage_entries_2_data_0[13]),
    .io_x_ae  (superpage_entries_2_data_0[11]),
    .io_x_sw  (superpage_entries_2_data_0[10]),
    .io_x_sx  (superpage_entries_2_data_0[9]),
    .io_x_sr  (superpage_entries_2_data_0[8]),
    .io_x_pw  (superpage_entries_2_data_0[7]),
    .io_x_pr  (superpage_entries_2_data_0[5]),
    .io_x_pal (superpage_entries_2_data_0[4]),
    .io_x_paa (superpage_entries_2_data_0[3]),
    .io_x_eff (superpage_entries_2_data_0[2]),
    .io_x_c   (superpage_entries_2_data_0[1]),
    .io_y_ppn (_ppn_data_barrier_23_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_24 (
    .io_x_ppn (superpage_entries_3_data_0[34:14]),
    .io_x_u   (superpage_entries_3_data_0[13]),
    .io_x_ae  (superpage_entries_3_data_0[11]),
    .io_x_sw  (superpage_entries_3_data_0[10]),
    .io_x_sx  (superpage_entries_3_data_0[9]),
    .io_x_sr  (superpage_entries_3_data_0[8]),
    .io_x_pw  (superpage_entries_3_data_0[7]),
    .io_x_pr  (superpage_entries_3_data_0[5]),
    .io_x_pal (superpage_entries_3_data_0[4]),
    .io_x_paa (superpage_entries_3_data_0[3]),
    .io_x_eff (superpage_entries_3_data_0[2]),
    .io_x_c   (superpage_entries_3_data_0[1]),
    .io_y_ppn (_ppn_data_barrier_24_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 ppn_data_barrier_25 (
    .io_x_ppn (special_entry_data_0[34:14]),
    .io_x_u   (special_entry_data_0[13]),
    .io_x_ae  (special_entry_data_0[11]),
    .io_x_sw  (special_entry_data_0[10]),
    .io_x_sx  (special_entry_data_0[9]),
    .io_x_sr  (special_entry_data_0[8]),
    .io_x_pw  (special_entry_data_0[7]),
    .io_x_pr  (special_entry_data_0[5]),
    .io_x_pal (special_entry_data_0[4]),
    .io_x_paa (special_entry_data_0[3]),
    .io_x_eff (special_entry_data_0[2]),
    .io_x_c   (special_entry_data_0[1]),
    .io_y_ppn (_ppn_data_barrier_25_io_y_ppn),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier (
    .io_x_ppn (casez_tmp_15[34:14]),
    .io_x_u   (casez_tmp_15[13]),
    .io_x_ae  (casez_tmp_15[11]),
    .io_x_sw  (casez_tmp_15[10]),
    .io_x_sx  (casez_tmp_15[9]),
    .io_x_sr  (casez_tmp_15[8]),
    .io_x_pw  (casez_tmp_15[7]),
    .io_x_pr  (casez_tmp_15[5]),
    .io_x_pal (casez_tmp_15[4]),
    .io_x_paa (casez_tmp_15[3]),
    .io_x_eff (casez_tmp_15[2]),
    .io_x_c   (casez_tmp_15[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_io_y_u),
    .io_y_ae  (_entries_barrier_io_y_ae),
    .io_y_sw  (_entries_barrier_io_y_sw),
    .io_y_sx  (_entries_barrier_io_y_sx),
    .io_y_sr  (_entries_barrier_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_1 (
    .io_x_ppn (casez_tmp_16[34:14]),
    .io_x_u   (casez_tmp_16[13]),
    .io_x_ae  (casez_tmp_16[11]),
    .io_x_sw  (casez_tmp_16[10]),
    .io_x_sx  (casez_tmp_16[9]),
    .io_x_sr  (casez_tmp_16[8]),
    .io_x_pw  (casez_tmp_16[7]),
    .io_x_pr  (casez_tmp_16[5]),
    .io_x_pal (casez_tmp_16[4]),
    .io_x_paa (casez_tmp_16[3]),
    .io_x_eff (casez_tmp_16[2]),
    .io_x_c   (casez_tmp_16[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_1_io_y_u),
    .io_y_ae  (_entries_barrier_1_io_y_ae),
    .io_y_sw  (_entries_barrier_1_io_y_sw),
    .io_y_sx  (_entries_barrier_1_io_y_sx),
    .io_y_sr  (_entries_barrier_1_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_2 (
    .io_x_ppn (casez_tmp_17[34:14]),
    .io_x_u   (casez_tmp_17[13]),
    .io_x_ae  (casez_tmp_17[11]),
    .io_x_sw  (casez_tmp_17[10]),
    .io_x_sx  (casez_tmp_17[9]),
    .io_x_sr  (casez_tmp_17[8]),
    .io_x_pw  (casez_tmp_17[7]),
    .io_x_pr  (casez_tmp_17[5]),
    .io_x_pal (casez_tmp_17[4]),
    .io_x_paa (casez_tmp_17[3]),
    .io_x_eff (casez_tmp_17[2]),
    .io_x_c   (casez_tmp_17[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_2_io_y_u),
    .io_y_ae  (_entries_barrier_2_io_y_ae),
    .io_y_sw  (_entries_barrier_2_io_y_sw),
    .io_y_sx  (_entries_barrier_2_io_y_sx),
    .io_y_sr  (_entries_barrier_2_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_3 (
    .io_x_ppn (casez_tmp_18[34:14]),
    .io_x_u   (casez_tmp_18[13]),
    .io_x_ae  (casez_tmp_18[11]),
    .io_x_sw  (casez_tmp_18[10]),
    .io_x_sx  (casez_tmp_18[9]),
    .io_x_sr  (casez_tmp_18[8]),
    .io_x_pw  (casez_tmp_18[7]),
    .io_x_pr  (casez_tmp_18[5]),
    .io_x_pal (casez_tmp_18[4]),
    .io_x_paa (casez_tmp_18[3]),
    .io_x_eff (casez_tmp_18[2]),
    .io_x_c   (casez_tmp_18[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_3_io_y_u),
    .io_y_ae  (_entries_barrier_3_io_y_ae),
    .io_y_sw  (_entries_barrier_3_io_y_sw),
    .io_y_sx  (_entries_barrier_3_io_y_sx),
    .io_y_sr  (_entries_barrier_3_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_4 (
    .io_x_ppn (casez_tmp_19[34:14]),
    .io_x_u   (casez_tmp_19[13]),
    .io_x_ae  (casez_tmp_19[11]),
    .io_x_sw  (casez_tmp_19[10]),
    .io_x_sx  (casez_tmp_19[9]),
    .io_x_sr  (casez_tmp_19[8]),
    .io_x_pw  (casez_tmp_19[7]),
    .io_x_pr  (casez_tmp_19[5]),
    .io_x_pal (casez_tmp_19[4]),
    .io_x_paa (casez_tmp_19[3]),
    .io_x_eff (casez_tmp_19[2]),
    .io_x_c   (casez_tmp_19[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_4_io_y_u),
    .io_y_ae  (_entries_barrier_4_io_y_ae),
    .io_y_sw  (_entries_barrier_4_io_y_sw),
    .io_y_sx  (_entries_barrier_4_io_y_sx),
    .io_y_sr  (_entries_barrier_4_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_5 (
    .io_x_ppn (casez_tmp_20[34:14]),
    .io_x_u   (casez_tmp_20[13]),
    .io_x_ae  (casez_tmp_20[11]),
    .io_x_sw  (casez_tmp_20[10]),
    .io_x_sx  (casez_tmp_20[9]),
    .io_x_sr  (casez_tmp_20[8]),
    .io_x_pw  (casez_tmp_20[7]),
    .io_x_pr  (casez_tmp_20[5]),
    .io_x_pal (casez_tmp_20[4]),
    .io_x_paa (casez_tmp_20[3]),
    .io_x_eff (casez_tmp_20[2]),
    .io_x_c   (casez_tmp_20[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_5_io_y_u),
    .io_y_ae  (_entries_barrier_5_io_y_ae),
    .io_y_sw  (_entries_barrier_5_io_y_sw),
    .io_y_sx  (_entries_barrier_5_io_y_sx),
    .io_y_sr  (_entries_barrier_5_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_6 (
    .io_x_ppn (casez_tmp_21[34:14]),
    .io_x_u   (casez_tmp_21[13]),
    .io_x_ae  (casez_tmp_21[11]),
    .io_x_sw  (casez_tmp_21[10]),
    .io_x_sx  (casez_tmp_21[9]),
    .io_x_sr  (casez_tmp_21[8]),
    .io_x_pw  (casez_tmp_21[7]),
    .io_x_pr  (casez_tmp_21[5]),
    .io_x_pal (casez_tmp_21[4]),
    .io_x_paa (casez_tmp_21[3]),
    .io_x_eff (casez_tmp_21[2]),
    .io_x_c   (casez_tmp_21[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_6_io_y_u),
    .io_y_ae  (_entries_barrier_6_io_y_ae),
    .io_y_sw  (_entries_barrier_6_io_y_sw),
    .io_y_sx  (_entries_barrier_6_io_y_sx),
    .io_y_sr  (_entries_barrier_6_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_7 (
    .io_x_ppn (casez_tmp_22[34:14]),
    .io_x_u   (casez_tmp_22[13]),
    .io_x_ae  (casez_tmp_22[11]),
    .io_x_sw  (casez_tmp_22[10]),
    .io_x_sx  (casez_tmp_22[9]),
    .io_x_sr  (casez_tmp_22[8]),
    .io_x_pw  (casez_tmp_22[7]),
    .io_x_pr  (casez_tmp_22[5]),
    .io_x_pal (casez_tmp_22[4]),
    .io_x_paa (casez_tmp_22[3]),
    .io_x_eff (casez_tmp_22[2]),
    .io_x_c   (casez_tmp_22[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_7_io_y_u),
    .io_y_ae  (_entries_barrier_7_io_y_ae),
    .io_y_sw  (_entries_barrier_7_io_y_sw),
    .io_y_sx  (_entries_barrier_7_io_y_sx),
    .io_y_sr  (_entries_barrier_7_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_8 (
    .io_x_ppn (superpage_entries_0_data_0[34:14]),
    .io_x_u   (superpage_entries_0_data_0[13]),
    .io_x_ae  (superpage_entries_0_data_0[11]),
    .io_x_sw  (superpage_entries_0_data_0[10]),
    .io_x_sx  (superpage_entries_0_data_0[9]),
    .io_x_sr  (superpage_entries_0_data_0[8]),
    .io_x_pw  (superpage_entries_0_data_0[7]),
    .io_x_pr  (superpage_entries_0_data_0[5]),
    .io_x_pal (superpage_entries_0_data_0[4]),
    .io_x_paa (superpage_entries_0_data_0[3]),
    .io_x_eff (superpage_entries_0_data_0[2]),
    .io_x_c   (superpage_entries_0_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_8_io_y_u),
    .io_y_ae  (_entries_barrier_8_io_y_ae),
    .io_y_sw  (_entries_barrier_8_io_y_sw),
    .io_y_sx  (_entries_barrier_8_io_y_sx),
    .io_y_sr  (_entries_barrier_8_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_9 (
    .io_x_ppn (superpage_entries_1_data_0[34:14]),
    .io_x_u   (superpage_entries_1_data_0[13]),
    .io_x_ae  (superpage_entries_1_data_0[11]),
    .io_x_sw  (superpage_entries_1_data_0[10]),
    .io_x_sx  (superpage_entries_1_data_0[9]),
    .io_x_sr  (superpage_entries_1_data_0[8]),
    .io_x_pw  (superpage_entries_1_data_0[7]),
    .io_x_pr  (superpage_entries_1_data_0[5]),
    .io_x_pal (superpage_entries_1_data_0[4]),
    .io_x_paa (superpage_entries_1_data_0[3]),
    .io_x_eff (superpage_entries_1_data_0[2]),
    .io_x_c   (superpage_entries_1_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_9_io_y_u),
    .io_y_ae  (_entries_barrier_9_io_y_ae),
    .io_y_sw  (_entries_barrier_9_io_y_sw),
    .io_y_sx  (_entries_barrier_9_io_y_sx),
    .io_y_sr  (_entries_barrier_9_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_10 (
    .io_x_ppn (superpage_entries_2_data_0[34:14]),
    .io_x_u   (superpage_entries_2_data_0[13]),
    .io_x_ae  (superpage_entries_2_data_0[11]),
    .io_x_sw  (superpage_entries_2_data_0[10]),
    .io_x_sx  (superpage_entries_2_data_0[9]),
    .io_x_sr  (superpage_entries_2_data_0[8]),
    .io_x_pw  (superpage_entries_2_data_0[7]),
    .io_x_pr  (superpage_entries_2_data_0[5]),
    .io_x_pal (superpage_entries_2_data_0[4]),
    .io_x_paa (superpage_entries_2_data_0[3]),
    .io_x_eff (superpage_entries_2_data_0[2]),
    .io_x_c   (superpage_entries_2_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_10_io_y_u),
    .io_y_ae  (_entries_barrier_10_io_y_ae),
    .io_y_sw  (_entries_barrier_10_io_y_sw),
    .io_y_sx  (_entries_barrier_10_io_y_sx),
    .io_y_sr  (_entries_barrier_10_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_11 (
    .io_x_ppn (superpage_entries_3_data_0[34:14]),
    .io_x_u   (superpage_entries_3_data_0[13]),
    .io_x_ae  (superpage_entries_3_data_0[11]),
    .io_x_sw  (superpage_entries_3_data_0[10]),
    .io_x_sx  (superpage_entries_3_data_0[9]),
    .io_x_sr  (superpage_entries_3_data_0[8]),
    .io_x_pw  (superpage_entries_3_data_0[7]),
    .io_x_pr  (superpage_entries_3_data_0[5]),
    .io_x_pal (superpage_entries_3_data_0[4]),
    .io_x_paa (superpage_entries_3_data_0[3]),
    .io_x_eff (superpage_entries_3_data_0[2]),
    .io_x_c   (superpage_entries_3_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_11_io_y_u),
    .io_y_ae  (_entries_barrier_11_io_y_ae),
    .io_y_sw  (_entries_barrier_11_io_y_sw),
    .io_y_sx  (_entries_barrier_11_io_y_sx),
    .io_y_sr  (_entries_barrier_11_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_12 (
    .io_x_ppn (special_entry_data_0[34:14]),
    .io_x_u   (special_entry_data_0[13]),
    .io_x_ae  (special_entry_data_0[11]),
    .io_x_sw  (special_entry_data_0[10]),
    .io_x_sx  (special_entry_data_0[9]),
    .io_x_sr  (special_entry_data_0[8]),
    .io_x_pw  (special_entry_data_0[7]),
    .io_x_pr  (special_entry_data_0[5]),
    .io_x_pal (special_entry_data_0[4]),
    .io_x_paa (special_entry_data_0[3]),
    .io_x_eff (special_entry_data_0[2]),
    .io_x_c   (special_entry_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_12_io_y_u),
    .io_y_ae  (_entries_barrier_12_io_y_ae),
    .io_y_sw  (_entries_barrier_12_io_y_sw),
    .io_y_sx  (_entries_barrier_12_io_y_sx),
    .io_y_sr  (_entries_barrier_12_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_13 (
    .io_x_ppn (casez_tmp_23[34:14]),
    .io_x_u   (casez_tmp_23[13]),
    .io_x_ae  (casez_tmp_23[11]),
    .io_x_sw  (casez_tmp_23[10]),
    .io_x_sx  (casez_tmp_23[9]),
    .io_x_sr  (casez_tmp_23[8]),
    .io_x_pw  (casez_tmp_23[7]),
    .io_x_pr  (casez_tmp_23[5]),
    .io_x_pal (casez_tmp_23[4]),
    .io_x_paa (casez_tmp_23[3]),
    .io_x_eff (casez_tmp_23[2]),
    .io_x_c   (casez_tmp_23[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_13_io_y_u),
    .io_y_ae  (_entries_barrier_13_io_y_ae),
    .io_y_sw  (_entries_barrier_13_io_y_sw),
    .io_y_sx  (_entries_barrier_13_io_y_sx),
    .io_y_sr  (_entries_barrier_13_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_14 (
    .io_x_ppn (casez_tmp_24[34:14]),
    .io_x_u   (casez_tmp_24[13]),
    .io_x_ae  (casez_tmp_24[11]),
    .io_x_sw  (casez_tmp_24[10]),
    .io_x_sx  (casez_tmp_24[9]),
    .io_x_sr  (casez_tmp_24[8]),
    .io_x_pw  (casez_tmp_24[7]),
    .io_x_pr  (casez_tmp_24[5]),
    .io_x_pal (casez_tmp_24[4]),
    .io_x_paa (casez_tmp_24[3]),
    .io_x_eff (casez_tmp_24[2]),
    .io_x_c   (casez_tmp_24[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_14_io_y_u),
    .io_y_ae  (_entries_barrier_14_io_y_ae),
    .io_y_sw  (_entries_barrier_14_io_y_sw),
    .io_y_sx  (_entries_barrier_14_io_y_sx),
    .io_y_sr  (_entries_barrier_14_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_15 (
    .io_x_ppn (casez_tmp_25[34:14]),
    .io_x_u   (casez_tmp_25[13]),
    .io_x_ae  (casez_tmp_25[11]),
    .io_x_sw  (casez_tmp_25[10]),
    .io_x_sx  (casez_tmp_25[9]),
    .io_x_sr  (casez_tmp_25[8]),
    .io_x_pw  (casez_tmp_25[7]),
    .io_x_pr  (casez_tmp_25[5]),
    .io_x_pal (casez_tmp_25[4]),
    .io_x_paa (casez_tmp_25[3]),
    .io_x_eff (casez_tmp_25[2]),
    .io_x_c   (casez_tmp_25[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_15_io_y_u),
    .io_y_ae  (_entries_barrier_15_io_y_ae),
    .io_y_sw  (_entries_barrier_15_io_y_sw),
    .io_y_sx  (_entries_barrier_15_io_y_sx),
    .io_y_sr  (_entries_barrier_15_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_16 (
    .io_x_ppn (casez_tmp_26[34:14]),
    .io_x_u   (casez_tmp_26[13]),
    .io_x_ae  (casez_tmp_26[11]),
    .io_x_sw  (casez_tmp_26[10]),
    .io_x_sx  (casez_tmp_26[9]),
    .io_x_sr  (casez_tmp_26[8]),
    .io_x_pw  (casez_tmp_26[7]),
    .io_x_pr  (casez_tmp_26[5]),
    .io_x_pal (casez_tmp_26[4]),
    .io_x_paa (casez_tmp_26[3]),
    .io_x_eff (casez_tmp_26[2]),
    .io_x_c   (casez_tmp_26[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_16_io_y_u),
    .io_y_ae  (_entries_barrier_16_io_y_ae),
    .io_y_sw  (_entries_barrier_16_io_y_sw),
    .io_y_sx  (_entries_barrier_16_io_y_sx),
    .io_y_sr  (_entries_barrier_16_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_17 (
    .io_x_ppn (casez_tmp_27[34:14]),
    .io_x_u   (casez_tmp_27[13]),
    .io_x_ae  (casez_tmp_27[11]),
    .io_x_sw  (casez_tmp_27[10]),
    .io_x_sx  (casez_tmp_27[9]),
    .io_x_sr  (casez_tmp_27[8]),
    .io_x_pw  (casez_tmp_27[7]),
    .io_x_pr  (casez_tmp_27[5]),
    .io_x_pal (casez_tmp_27[4]),
    .io_x_paa (casez_tmp_27[3]),
    .io_x_eff (casez_tmp_27[2]),
    .io_x_c   (casez_tmp_27[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_17_io_y_u),
    .io_y_ae  (_entries_barrier_17_io_y_ae),
    .io_y_sw  (_entries_barrier_17_io_y_sw),
    .io_y_sx  (_entries_barrier_17_io_y_sx),
    .io_y_sr  (_entries_barrier_17_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_18 (
    .io_x_ppn (casez_tmp_28[34:14]),
    .io_x_u   (casez_tmp_28[13]),
    .io_x_ae  (casez_tmp_28[11]),
    .io_x_sw  (casez_tmp_28[10]),
    .io_x_sx  (casez_tmp_28[9]),
    .io_x_sr  (casez_tmp_28[8]),
    .io_x_pw  (casez_tmp_28[7]),
    .io_x_pr  (casez_tmp_28[5]),
    .io_x_pal (casez_tmp_28[4]),
    .io_x_paa (casez_tmp_28[3]),
    .io_x_eff (casez_tmp_28[2]),
    .io_x_c   (casez_tmp_28[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_18_io_y_u),
    .io_y_ae  (_entries_barrier_18_io_y_ae),
    .io_y_sw  (_entries_barrier_18_io_y_sw),
    .io_y_sx  (_entries_barrier_18_io_y_sx),
    .io_y_sr  (_entries_barrier_18_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_19 (
    .io_x_ppn (casez_tmp_29[34:14]),
    .io_x_u   (casez_tmp_29[13]),
    .io_x_ae  (casez_tmp_29[11]),
    .io_x_sw  (casez_tmp_29[10]),
    .io_x_sx  (casez_tmp_29[9]),
    .io_x_sr  (casez_tmp_29[8]),
    .io_x_pw  (casez_tmp_29[7]),
    .io_x_pr  (casez_tmp_29[5]),
    .io_x_pal (casez_tmp_29[4]),
    .io_x_paa (casez_tmp_29[3]),
    .io_x_eff (casez_tmp_29[2]),
    .io_x_c   (casez_tmp_29[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_19_io_y_u),
    .io_y_ae  (_entries_barrier_19_io_y_ae),
    .io_y_sw  (_entries_barrier_19_io_y_sw),
    .io_y_sx  (_entries_barrier_19_io_y_sx),
    .io_y_sr  (_entries_barrier_19_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_20 (
    .io_x_ppn (casez_tmp_30[34:14]),
    .io_x_u   (casez_tmp_30[13]),
    .io_x_ae  (casez_tmp_30[11]),
    .io_x_sw  (casez_tmp_30[10]),
    .io_x_sx  (casez_tmp_30[9]),
    .io_x_sr  (casez_tmp_30[8]),
    .io_x_pw  (casez_tmp_30[7]),
    .io_x_pr  (casez_tmp_30[5]),
    .io_x_pal (casez_tmp_30[4]),
    .io_x_paa (casez_tmp_30[3]),
    .io_x_eff (casez_tmp_30[2]),
    .io_x_c   (casez_tmp_30[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_20_io_y_u),
    .io_y_ae  (_entries_barrier_20_io_y_ae),
    .io_y_sw  (_entries_barrier_20_io_y_sw),
    .io_y_sx  (_entries_barrier_20_io_y_sx),
    .io_y_sr  (_entries_barrier_20_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_21 (
    .io_x_ppn (superpage_entries_0_data_0[34:14]),
    .io_x_u   (superpage_entries_0_data_0[13]),
    .io_x_ae  (superpage_entries_0_data_0[11]),
    .io_x_sw  (superpage_entries_0_data_0[10]),
    .io_x_sx  (superpage_entries_0_data_0[9]),
    .io_x_sr  (superpage_entries_0_data_0[8]),
    .io_x_pw  (superpage_entries_0_data_0[7]),
    .io_x_pr  (superpage_entries_0_data_0[5]),
    .io_x_pal (superpage_entries_0_data_0[4]),
    .io_x_paa (superpage_entries_0_data_0[3]),
    .io_x_eff (superpage_entries_0_data_0[2]),
    .io_x_c   (superpage_entries_0_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_21_io_y_u),
    .io_y_ae  (_entries_barrier_21_io_y_ae),
    .io_y_sw  (_entries_barrier_21_io_y_sw),
    .io_y_sx  (_entries_barrier_21_io_y_sx),
    .io_y_sr  (_entries_barrier_21_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_22 (
    .io_x_ppn (superpage_entries_1_data_0[34:14]),
    .io_x_u   (superpage_entries_1_data_0[13]),
    .io_x_ae  (superpage_entries_1_data_0[11]),
    .io_x_sw  (superpage_entries_1_data_0[10]),
    .io_x_sx  (superpage_entries_1_data_0[9]),
    .io_x_sr  (superpage_entries_1_data_0[8]),
    .io_x_pw  (superpage_entries_1_data_0[7]),
    .io_x_pr  (superpage_entries_1_data_0[5]),
    .io_x_pal (superpage_entries_1_data_0[4]),
    .io_x_paa (superpage_entries_1_data_0[3]),
    .io_x_eff (superpage_entries_1_data_0[2]),
    .io_x_c   (superpage_entries_1_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_22_io_y_u),
    .io_y_ae  (_entries_barrier_22_io_y_ae),
    .io_y_sw  (_entries_barrier_22_io_y_sw),
    .io_y_sx  (_entries_barrier_22_io_y_sx),
    .io_y_sr  (_entries_barrier_22_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_23 (
    .io_x_ppn (superpage_entries_2_data_0[34:14]),
    .io_x_u   (superpage_entries_2_data_0[13]),
    .io_x_ae  (superpage_entries_2_data_0[11]),
    .io_x_sw  (superpage_entries_2_data_0[10]),
    .io_x_sx  (superpage_entries_2_data_0[9]),
    .io_x_sr  (superpage_entries_2_data_0[8]),
    .io_x_pw  (superpage_entries_2_data_0[7]),
    .io_x_pr  (superpage_entries_2_data_0[5]),
    .io_x_pal (superpage_entries_2_data_0[4]),
    .io_x_paa (superpage_entries_2_data_0[3]),
    .io_x_eff (superpage_entries_2_data_0[2]),
    .io_x_c   (superpage_entries_2_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_23_io_y_u),
    .io_y_ae  (_entries_barrier_23_io_y_ae),
    .io_y_sw  (_entries_barrier_23_io_y_sw),
    .io_y_sx  (_entries_barrier_23_io_y_sx),
    .io_y_sr  (_entries_barrier_23_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_24 (
    .io_x_ppn (superpage_entries_3_data_0[34:14]),
    .io_x_u   (superpage_entries_3_data_0[13]),
    .io_x_ae  (superpage_entries_3_data_0[11]),
    .io_x_sw  (superpage_entries_3_data_0[10]),
    .io_x_sx  (superpage_entries_3_data_0[9]),
    .io_x_sr  (superpage_entries_3_data_0[8]),
    .io_x_pw  (superpage_entries_3_data_0[7]),
    .io_x_pr  (superpage_entries_3_data_0[5]),
    .io_x_pal (superpage_entries_3_data_0[4]),
    .io_x_paa (superpage_entries_3_data_0[3]),
    .io_x_eff (superpage_entries_3_data_0[2]),
    .io_x_c   (superpage_entries_3_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_24_io_y_u),
    .io_y_ae  (_entries_barrier_24_io_y_ae),
    .io_y_sw  (_entries_barrier_24_io_y_sw),
    .io_y_sx  (_entries_barrier_24_io_y_sx),
    .io_y_sr  (_entries_barrier_24_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 entries_barrier_25 (
    .io_x_ppn (special_entry_data_0[34:14]),
    .io_x_u   (special_entry_data_0[13]),
    .io_x_ae  (special_entry_data_0[11]),
    .io_x_sw  (special_entry_data_0[10]),
    .io_x_sx  (special_entry_data_0[9]),
    .io_x_sr  (special_entry_data_0[8]),
    .io_x_pw  (special_entry_data_0[7]),
    .io_x_pr  (special_entry_data_0[5]),
    .io_x_pal (special_entry_data_0[4]),
    .io_x_paa (special_entry_data_0[3]),
    .io_x_eff (special_entry_data_0[2]),
    .io_x_c   (special_entry_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (_entries_barrier_25_io_y_u),
    .io_y_ae  (_entries_barrier_25_io_y_ae),
    .io_y_sw  (_entries_barrier_25_io_y_sw),
    .io_y_sx  (_entries_barrier_25_io_y_sx),
    .io_y_sr  (_entries_barrier_25_io_y_sr),
    .io_y_pw  (/* unused */),
    .io_y_pr  (/* unused */),
    .io_y_pal (/* unused */),
    .io_y_paa (/* unused */),
    .io_y_eff (/* unused */),
    .io_y_c   (/* unused */)
  );
  OptimizationBarrier_14 normal_entries_barrier (
    .io_x_ppn (casez_tmp_15[34:14]),
    .io_x_u   (casez_tmp_15[13]),
    .io_x_ae  (casez_tmp_15[11]),
    .io_x_sw  (casez_tmp_15[10]),
    .io_x_sx  (casez_tmp_15[9]),
    .io_x_sr  (casez_tmp_15[8]),
    .io_x_pw  (casez_tmp_15[7]),
    .io_x_pr  (casez_tmp_15[5]),
    .io_x_pal (casez_tmp_15[4]),
    .io_x_paa (casez_tmp_15[3]),
    .io_x_eff (casez_tmp_15[2]),
    .io_x_c   (casez_tmp_15[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_io_y_pr),
    .io_y_pal (_normal_entries_barrier_io_y_pal),
    .io_y_paa (_normal_entries_barrier_io_y_paa),
    .io_y_eff (_normal_entries_barrier_io_y_eff),
    .io_y_c   (_normal_entries_barrier_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_1 (
    .io_x_ppn (casez_tmp_16[34:14]),
    .io_x_u   (casez_tmp_16[13]),
    .io_x_ae  (casez_tmp_16[11]),
    .io_x_sw  (casez_tmp_16[10]),
    .io_x_sx  (casez_tmp_16[9]),
    .io_x_sr  (casez_tmp_16[8]),
    .io_x_pw  (casez_tmp_16[7]),
    .io_x_pr  (casez_tmp_16[5]),
    .io_x_pal (casez_tmp_16[4]),
    .io_x_paa (casez_tmp_16[3]),
    .io_x_eff (casez_tmp_16[2]),
    .io_x_c   (casez_tmp_16[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_1_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_1_io_y_pr),
    .io_y_pal (_normal_entries_barrier_1_io_y_pal),
    .io_y_paa (_normal_entries_barrier_1_io_y_paa),
    .io_y_eff (_normal_entries_barrier_1_io_y_eff),
    .io_y_c   (_normal_entries_barrier_1_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_2 (
    .io_x_ppn (casez_tmp_17[34:14]),
    .io_x_u   (casez_tmp_17[13]),
    .io_x_ae  (casez_tmp_17[11]),
    .io_x_sw  (casez_tmp_17[10]),
    .io_x_sx  (casez_tmp_17[9]),
    .io_x_sr  (casez_tmp_17[8]),
    .io_x_pw  (casez_tmp_17[7]),
    .io_x_pr  (casez_tmp_17[5]),
    .io_x_pal (casez_tmp_17[4]),
    .io_x_paa (casez_tmp_17[3]),
    .io_x_eff (casez_tmp_17[2]),
    .io_x_c   (casez_tmp_17[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_2_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_2_io_y_pr),
    .io_y_pal (_normal_entries_barrier_2_io_y_pal),
    .io_y_paa (_normal_entries_barrier_2_io_y_paa),
    .io_y_eff (_normal_entries_barrier_2_io_y_eff),
    .io_y_c   (_normal_entries_barrier_2_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_3 (
    .io_x_ppn (casez_tmp_18[34:14]),
    .io_x_u   (casez_tmp_18[13]),
    .io_x_ae  (casez_tmp_18[11]),
    .io_x_sw  (casez_tmp_18[10]),
    .io_x_sx  (casez_tmp_18[9]),
    .io_x_sr  (casez_tmp_18[8]),
    .io_x_pw  (casez_tmp_18[7]),
    .io_x_pr  (casez_tmp_18[5]),
    .io_x_pal (casez_tmp_18[4]),
    .io_x_paa (casez_tmp_18[3]),
    .io_x_eff (casez_tmp_18[2]),
    .io_x_c   (casez_tmp_18[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_3_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_3_io_y_pr),
    .io_y_pal (_normal_entries_barrier_3_io_y_pal),
    .io_y_paa (_normal_entries_barrier_3_io_y_paa),
    .io_y_eff (_normal_entries_barrier_3_io_y_eff),
    .io_y_c   (_normal_entries_barrier_3_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_4 (
    .io_x_ppn (casez_tmp_19[34:14]),
    .io_x_u   (casez_tmp_19[13]),
    .io_x_ae  (casez_tmp_19[11]),
    .io_x_sw  (casez_tmp_19[10]),
    .io_x_sx  (casez_tmp_19[9]),
    .io_x_sr  (casez_tmp_19[8]),
    .io_x_pw  (casez_tmp_19[7]),
    .io_x_pr  (casez_tmp_19[5]),
    .io_x_pal (casez_tmp_19[4]),
    .io_x_paa (casez_tmp_19[3]),
    .io_x_eff (casez_tmp_19[2]),
    .io_x_c   (casez_tmp_19[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_4_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_4_io_y_pr),
    .io_y_pal (_normal_entries_barrier_4_io_y_pal),
    .io_y_paa (_normal_entries_barrier_4_io_y_paa),
    .io_y_eff (_normal_entries_barrier_4_io_y_eff),
    .io_y_c   (_normal_entries_barrier_4_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_5 (
    .io_x_ppn (casez_tmp_20[34:14]),
    .io_x_u   (casez_tmp_20[13]),
    .io_x_ae  (casez_tmp_20[11]),
    .io_x_sw  (casez_tmp_20[10]),
    .io_x_sx  (casez_tmp_20[9]),
    .io_x_sr  (casez_tmp_20[8]),
    .io_x_pw  (casez_tmp_20[7]),
    .io_x_pr  (casez_tmp_20[5]),
    .io_x_pal (casez_tmp_20[4]),
    .io_x_paa (casez_tmp_20[3]),
    .io_x_eff (casez_tmp_20[2]),
    .io_x_c   (casez_tmp_20[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_5_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_5_io_y_pr),
    .io_y_pal (_normal_entries_barrier_5_io_y_pal),
    .io_y_paa (_normal_entries_barrier_5_io_y_paa),
    .io_y_eff (_normal_entries_barrier_5_io_y_eff),
    .io_y_c   (_normal_entries_barrier_5_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_6 (
    .io_x_ppn (casez_tmp_21[34:14]),
    .io_x_u   (casez_tmp_21[13]),
    .io_x_ae  (casez_tmp_21[11]),
    .io_x_sw  (casez_tmp_21[10]),
    .io_x_sx  (casez_tmp_21[9]),
    .io_x_sr  (casez_tmp_21[8]),
    .io_x_pw  (casez_tmp_21[7]),
    .io_x_pr  (casez_tmp_21[5]),
    .io_x_pal (casez_tmp_21[4]),
    .io_x_paa (casez_tmp_21[3]),
    .io_x_eff (casez_tmp_21[2]),
    .io_x_c   (casez_tmp_21[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_6_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_6_io_y_pr),
    .io_y_pal (_normal_entries_barrier_6_io_y_pal),
    .io_y_paa (_normal_entries_barrier_6_io_y_paa),
    .io_y_eff (_normal_entries_barrier_6_io_y_eff),
    .io_y_c   (_normal_entries_barrier_6_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_7 (
    .io_x_ppn (casez_tmp_22[34:14]),
    .io_x_u   (casez_tmp_22[13]),
    .io_x_ae  (casez_tmp_22[11]),
    .io_x_sw  (casez_tmp_22[10]),
    .io_x_sx  (casez_tmp_22[9]),
    .io_x_sr  (casez_tmp_22[8]),
    .io_x_pw  (casez_tmp_22[7]),
    .io_x_pr  (casez_tmp_22[5]),
    .io_x_pal (casez_tmp_22[4]),
    .io_x_paa (casez_tmp_22[3]),
    .io_x_eff (casez_tmp_22[2]),
    .io_x_c   (casez_tmp_22[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_7_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_7_io_y_pr),
    .io_y_pal (_normal_entries_barrier_7_io_y_pal),
    .io_y_paa (_normal_entries_barrier_7_io_y_paa),
    .io_y_eff (_normal_entries_barrier_7_io_y_eff),
    .io_y_c   (_normal_entries_barrier_7_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_8 (
    .io_x_ppn (superpage_entries_0_data_0[34:14]),
    .io_x_u   (superpage_entries_0_data_0[13]),
    .io_x_ae  (superpage_entries_0_data_0[11]),
    .io_x_sw  (superpage_entries_0_data_0[10]),
    .io_x_sx  (superpage_entries_0_data_0[9]),
    .io_x_sr  (superpage_entries_0_data_0[8]),
    .io_x_pw  (superpage_entries_0_data_0[7]),
    .io_x_pr  (superpage_entries_0_data_0[5]),
    .io_x_pal (superpage_entries_0_data_0[4]),
    .io_x_paa (superpage_entries_0_data_0[3]),
    .io_x_eff (superpage_entries_0_data_0[2]),
    .io_x_c   (superpage_entries_0_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_8_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_8_io_y_pr),
    .io_y_pal (_normal_entries_barrier_8_io_y_pal),
    .io_y_paa (_normal_entries_barrier_8_io_y_paa),
    .io_y_eff (_normal_entries_barrier_8_io_y_eff),
    .io_y_c   (_normal_entries_barrier_8_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_9 (
    .io_x_ppn (superpage_entries_1_data_0[34:14]),
    .io_x_u   (superpage_entries_1_data_0[13]),
    .io_x_ae  (superpage_entries_1_data_0[11]),
    .io_x_sw  (superpage_entries_1_data_0[10]),
    .io_x_sx  (superpage_entries_1_data_0[9]),
    .io_x_sr  (superpage_entries_1_data_0[8]),
    .io_x_pw  (superpage_entries_1_data_0[7]),
    .io_x_pr  (superpage_entries_1_data_0[5]),
    .io_x_pal (superpage_entries_1_data_0[4]),
    .io_x_paa (superpage_entries_1_data_0[3]),
    .io_x_eff (superpage_entries_1_data_0[2]),
    .io_x_c   (superpage_entries_1_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_9_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_9_io_y_pr),
    .io_y_pal (_normal_entries_barrier_9_io_y_pal),
    .io_y_paa (_normal_entries_barrier_9_io_y_paa),
    .io_y_eff (_normal_entries_barrier_9_io_y_eff),
    .io_y_c   (_normal_entries_barrier_9_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_10 (
    .io_x_ppn (superpage_entries_2_data_0[34:14]),
    .io_x_u   (superpage_entries_2_data_0[13]),
    .io_x_ae  (superpage_entries_2_data_0[11]),
    .io_x_sw  (superpage_entries_2_data_0[10]),
    .io_x_sx  (superpage_entries_2_data_0[9]),
    .io_x_sr  (superpage_entries_2_data_0[8]),
    .io_x_pw  (superpage_entries_2_data_0[7]),
    .io_x_pr  (superpage_entries_2_data_0[5]),
    .io_x_pal (superpage_entries_2_data_0[4]),
    .io_x_paa (superpage_entries_2_data_0[3]),
    .io_x_eff (superpage_entries_2_data_0[2]),
    .io_x_c   (superpage_entries_2_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_10_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_10_io_y_pr),
    .io_y_pal (_normal_entries_barrier_10_io_y_pal),
    .io_y_paa (_normal_entries_barrier_10_io_y_paa),
    .io_y_eff (_normal_entries_barrier_10_io_y_eff),
    .io_y_c   (_normal_entries_barrier_10_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_11 (
    .io_x_ppn (superpage_entries_3_data_0[34:14]),
    .io_x_u   (superpage_entries_3_data_0[13]),
    .io_x_ae  (superpage_entries_3_data_0[11]),
    .io_x_sw  (superpage_entries_3_data_0[10]),
    .io_x_sx  (superpage_entries_3_data_0[9]),
    .io_x_sr  (superpage_entries_3_data_0[8]),
    .io_x_pw  (superpage_entries_3_data_0[7]),
    .io_x_pr  (superpage_entries_3_data_0[5]),
    .io_x_pal (superpage_entries_3_data_0[4]),
    .io_x_paa (superpage_entries_3_data_0[3]),
    .io_x_eff (superpage_entries_3_data_0[2]),
    .io_x_c   (superpage_entries_3_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_11_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_11_io_y_pr),
    .io_y_pal (_normal_entries_barrier_11_io_y_pal),
    .io_y_paa (_normal_entries_barrier_11_io_y_paa),
    .io_y_eff (_normal_entries_barrier_11_io_y_eff),
    .io_y_c   (_normal_entries_barrier_11_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_12 (
    .io_x_ppn (casez_tmp_23[34:14]),
    .io_x_u   (casez_tmp_23[13]),
    .io_x_ae  (casez_tmp_23[11]),
    .io_x_sw  (casez_tmp_23[10]),
    .io_x_sx  (casez_tmp_23[9]),
    .io_x_sr  (casez_tmp_23[8]),
    .io_x_pw  (casez_tmp_23[7]),
    .io_x_pr  (casez_tmp_23[5]),
    .io_x_pal (casez_tmp_23[4]),
    .io_x_paa (casez_tmp_23[3]),
    .io_x_eff (casez_tmp_23[2]),
    .io_x_c   (casez_tmp_23[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_12_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_12_io_y_pr),
    .io_y_pal (_normal_entries_barrier_12_io_y_pal),
    .io_y_paa (_normal_entries_barrier_12_io_y_paa),
    .io_y_eff (_normal_entries_barrier_12_io_y_eff),
    .io_y_c   (_normal_entries_barrier_12_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_13 (
    .io_x_ppn (casez_tmp_24[34:14]),
    .io_x_u   (casez_tmp_24[13]),
    .io_x_ae  (casez_tmp_24[11]),
    .io_x_sw  (casez_tmp_24[10]),
    .io_x_sx  (casez_tmp_24[9]),
    .io_x_sr  (casez_tmp_24[8]),
    .io_x_pw  (casez_tmp_24[7]),
    .io_x_pr  (casez_tmp_24[5]),
    .io_x_pal (casez_tmp_24[4]),
    .io_x_paa (casez_tmp_24[3]),
    .io_x_eff (casez_tmp_24[2]),
    .io_x_c   (casez_tmp_24[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_13_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_13_io_y_pr),
    .io_y_pal (_normal_entries_barrier_13_io_y_pal),
    .io_y_paa (_normal_entries_barrier_13_io_y_paa),
    .io_y_eff (_normal_entries_barrier_13_io_y_eff),
    .io_y_c   (_normal_entries_barrier_13_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_14 (
    .io_x_ppn (casez_tmp_25[34:14]),
    .io_x_u   (casez_tmp_25[13]),
    .io_x_ae  (casez_tmp_25[11]),
    .io_x_sw  (casez_tmp_25[10]),
    .io_x_sx  (casez_tmp_25[9]),
    .io_x_sr  (casez_tmp_25[8]),
    .io_x_pw  (casez_tmp_25[7]),
    .io_x_pr  (casez_tmp_25[5]),
    .io_x_pal (casez_tmp_25[4]),
    .io_x_paa (casez_tmp_25[3]),
    .io_x_eff (casez_tmp_25[2]),
    .io_x_c   (casez_tmp_25[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_14_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_14_io_y_pr),
    .io_y_pal (_normal_entries_barrier_14_io_y_pal),
    .io_y_paa (_normal_entries_barrier_14_io_y_paa),
    .io_y_eff (_normal_entries_barrier_14_io_y_eff),
    .io_y_c   (_normal_entries_barrier_14_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_15 (
    .io_x_ppn (casez_tmp_26[34:14]),
    .io_x_u   (casez_tmp_26[13]),
    .io_x_ae  (casez_tmp_26[11]),
    .io_x_sw  (casez_tmp_26[10]),
    .io_x_sx  (casez_tmp_26[9]),
    .io_x_sr  (casez_tmp_26[8]),
    .io_x_pw  (casez_tmp_26[7]),
    .io_x_pr  (casez_tmp_26[5]),
    .io_x_pal (casez_tmp_26[4]),
    .io_x_paa (casez_tmp_26[3]),
    .io_x_eff (casez_tmp_26[2]),
    .io_x_c   (casez_tmp_26[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_15_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_15_io_y_pr),
    .io_y_pal (_normal_entries_barrier_15_io_y_pal),
    .io_y_paa (_normal_entries_barrier_15_io_y_paa),
    .io_y_eff (_normal_entries_barrier_15_io_y_eff),
    .io_y_c   (_normal_entries_barrier_15_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_16 (
    .io_x_ppn (casez_tmp_27[34:14]),
    .io_x_u   (casez_tmp_27[13]),
    .io_x_ae  (casez_tmp_27[11]),
    .io_x_sw  (casez_tmp_27[10]),
    .io_x_sx  (casez_tmp_27[9]),
    .io_x_sr  (casez_tmp_27[8]),
    .io_x_pw  (casez_tmp_27[7]),
    .io_x_pr  (casez_tmp_27[5]),
    .io_x_pal (casez_tmp_27[4]),
    .io_x_paa (casez_tmp_27[3]),
    .io_x_eff (casez_tmp_27[2]),
    .io_x_c   (casez_tmp_27[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_16_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_16_io_y_pr),
    .io_y_pal (_normal_entries_barrier_16_io_y_pal),
    .io_y_paa (_normal_entries_barrier_16_io_y_paa),
    .io_y_eff (_normal_entries_barrier_16_io_y_eff),
    .io_y_c   (_normal_entries_barrier_16_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_17 (
    .io_x_ppn (casez_tmp_28[34:14]),
    .io_x_u   (casez_tmp_28[13]),
    .io_x_ae  (casez_tmp_28[11]),
    .io_x_sw  (casez_tmp_28[10]),
    .io_x_sx  (casez_tmp_28[9]),
    .io_x_sr  (casez_tmp_28[8]),
    .io_x_pw  (casez_tmp_28[7]),
    .io_x_pr  (casez_tmp_28[5]),
    .io_x_pal (casez_tmp_28[4]),
    .io_x_paa (casez_tmp_28[3]),
    .io_x_eff (casez_tmp_28[2]),
    .io_x_c   (casez_tmp_28[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_17_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_17_io_y_pr),
    .io_y_pal (_normal_entries_barrier_17_io_y_pal),
    .io_y_paa (_normal_entries_barrier_17_io_y_paa),
    .io_y_eff (_normal_entries_barrier_17_io_y_eff),
    .io_y_c   (_normal_entries_barrier_17_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_18 (
    .io_x_ppn (casez_tmp_29[34:14]),
    .io_x_u   (casez_tmp_29[13]),
    .io_x_ae  (casez_tmp_29[11]),
    .io_x_sw  (casez_tmp_29[10]),
    .io_x_sx  (casez_tmp_29[9]),
    .io_x_sr  (casez_tmp_29[8]),
    .io_x_pw  (casez_tmp_29[7]),
    .io_x_pr  (casez_tmp_29[5]),
    .io_x_pal (casez_tmp_29[4]),
    .io_x_paa (casez_tmp_29[3]),
    .io_x_eff (casez_tmp_29[2]),
    .io_x_c   (casez_tmp_29[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_18_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_18_io_y_pr),
    .io_y_pal (_normal_entries_barrier_18_io_y_pal),
    .io_y_paa (_normal_entries_barrier_18_io_y_paa),
    .io_y_eff (_normal_entries_barrier_18_io_y_eff),
    .io_y_c   (_normal_entries_barrier_18_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_19 (
    .io_x_ppn (casez_tmp_30[34:14]),
    .io_x_u   (casez_tmp_30[13]),
    .io_x_ae  (casez_tmp_30[11]),
    .io_x_sw  (casez_tmp_30[10]),
    .io_x_sx  (casez_tmp_30[9]),
    .io_x_sr  (casez_tmp_30[8]),
    .io_x_pw  (casez_tmp_30[7]),
    .io_x_pr  (casez_tmp_30[5]),
    .io_x_pal (casez_tmp_30[4]),
    .io_x_paa (casez_tmp_30[3]),
    .io_x_eff (casez_tmp_30[2]),
    .io_x_c   (casez_tmp_30[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_19_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_19_io_y_pr),
    .io_y_pal (_normal_entries_barrier_19_io_y_pal),
    .io_y_paa (_normal_entries_barrier_19_io_y_paa),
    .io_y_eff (_normal_entries_barrier_19_io_y_eff),
    .io_y_c   (_normal_entries_barrier_19_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_20 (
    .io_x_ppn (superpage_entries_0_data_0[34:14]),
    .io_x_u   (superpage_entries_0_data_0[13]),
    .io_x_ae  (superpage_entries_0_data_0[11]),
    .io_x_sw  (superpage_entries_0_data_0[10]),
    .io_x_sx  (superpage_entries_0_data_0[9]),
    .io_x_sr  (superpage_entries_0_data_0[8]),
    .io_x_pw  (superpage_entries_0_data_0[7]),
    .io_x_pr  (superpage_entries_0_data_0[5]),
    .io_x_pal (superpage_entries_0_data_0[4]),
    .io_x_paa (superpage_entries_0_data_0[3]),
    .io_x_eff (superpage_entries_0_data_0[2]),
    .io_x_c   (superpage_entries_0_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_20_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_20_io_y_pr),
    .io_y_pal (_normal_entries_barrier_20_io_y_pal),
    .io_y_paa (_normal_entries_barrier_20_io_y_paa),
    .io_y_eff (_normal_entries_barrier_20_io_y_eff),
    .io_y_c   (_normal_entries_barrier_20_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_21 (
    .io_x_ppn (superpage_entries_1_data_0[34:14]),
    .io_x_u   (superpage_entries_1_data_0[13]),
    .io_x_ae  (superpage_entries_1_data_0[11]),
    .io_x_sw  (superpage_entries_1_data_0[10]),
    .io_x_sx  (superpage_entries_1_data_0[9]),
    .io_x_sr  (superpage_entries_1_data_0[8]),
    .io_x_pw  (superpage_entries_1_data_0[7]),
    .io_x_pr  (superpage_entries_1_data_0[5]),
    .io_x_pal (superpage_entries_1_data_0[4]),
    .io_x_paa (superpage_entries_1_data_0[3]),
    .io_x_eff (superpage_entries_1_data_0[2]),
    .io_x_c   (superpage_entries_1_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_21_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_21_io_y_pr),
    .io_y_pal (_normal_entries_barrier_21_io_y_pal),
    .io_y_paa (_normal_entries_barrier_21_io_y_paa),
    .io_y_eff (_normal_entries_barrier_21_io_y_eff),
    .io_y_c   (_normal_entries_barrier_21_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_22 (
    .io_x_ppn (superpage_entries_2_data_0[34:14]),
    .io_x_u   (superpage_entries_2_data_0[13]),
    .io_x_ae  (superpage_entries_2_data_0[11]),
    .io_x_sw  (superpage_entries_2_data_0[10]),
    .io_x_sx  (superpage_entries_2_data_0[9]),
    .io_x_sr  (superpage_entries_2_data_0[8]),
    .io_x_pw  (superpage_entries_2_data_0[7]),
    .io_x_pr  (superpage_entries_2_data_0[5]),
    .io_x_pal (superpage_entries_2_data_0[4]),
    .io_x_paa (superpage_entries_2_data_0[3]),
    .io_x_eff (superpage_entries_2_data_0[2]),
    .io_x_c   (superpage_entries_2_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_22_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_22_io_y_pr),
    .io_y_pal (_normal_entries_barrier_22_io_y_pal),
    .io_y_paa (_normal_entries_barrier_22_io_y_paa),
    .io_y_eff (_normal_entries_barrier_22_io_y_eff),
    .io_y_c   (_normal_entries_barrier_22_io_y_c)
  );
  OptimizationBarrier_14 normal_entries_barrier_23 (
    .io_x_ppn (superpage_entries_3_data_0[34:14]),
    .io_x_u   (superpage_entries_3_data_0[13]),
    .io_x_ae  (superpage_entries_3_data_0[11]),
    .io_x_sw  (superpage_entries_3_data_0[10]),
    .io_x_sx  (superpage_entries_3_data_0[9]),
    .io_x_sr  (superpage_entries_3_data_0[8]),
    .io_x_pw  (superpage_entries_3_data_0[7]),
    .io_x_pr  (superpage_entries_3_data_0[5]),
    .io_x_pal (superpage_entries_3_data_0[4]),
    .io_x_paa (superpage_entries_3_data_0[3]),
    .io_x_eff (superpage_entries_3_data_0[2]),
    .io_x_c   (superpage_entries_3_data_0[1]),
    .io_y_ppn (/* unused */),
    .io_y_u   (/* unused */),
    .io_y_ae  (/* unused */),
    .io_y_sw  (/* unused */),
    .io_y_sx  (/* unused */),
    .io_y_sr  (/* unused */),
    .io_y_pw  (_normal_entries_barrier_23_io_y_pw),
    .io_y_pr  (_normal_entries_barrier_23_io_y_pr),
    .io_y_pal (_normal_entries_barrier_23_io_y_pal),
    .io_y_paa (_normal_entries_barrier_23_io_y_paa),
    .io_y_eff (_normal_entries_barrier_23_io_y_eff),
    .io_y_c   (_normal_entries_barrier_23_io_y_c)
  );
  assign io_miss_rdy = _io_miss_rdy_T;
  assign io_resp_0_miss = io_ptw_resp_valid | tlb_miss_0 | multipleHits_0;
  assign io_resp_0_paddr = {(hitsVec_0_0 ? _ppn_data_barrier_io_y_ppn : 21'h0) | (hitsVec_0_1 ? _ppn_data_barrier_1_io_y_ppn : 21'h0) | (hitsVec_0_2 ? _ppn_data_barrier_2_io_y_ppn : 21'h0) | (hitsVec_0_3 ? _ppn_data_barrier_3_io_y_ppn : 21'h0) | (hitsVec_0_4 ? _ppn_data_barrier_4_io_y_ppn : 21'h0) | (hitsVec_0_5 ? _ppn_data_barrier_5_io_y_ppn : 21'h0) | (hitsVec_0_6 ? _ppn_data_barrier_6_io_y_ppn : 21'h0) | (hitsVec_0_7 ? _ppn_data_barrier_7_io_y_ppn : 21'h0) | (hitsVec_0_8 ? {_ppn_data_barrier_8_io_y_ppn[20:18], (ignore_1 ? io_req_0_bits_vaddr[29:21] : 9'h0) | _ppn_data_barrier_8_io_y_ppn[17:9], io_req_0_bits_vaddr[20:12] | _ppn_data_barrier_8_io_y_ppn[8:0]} : 21'h0) | (hitsVec_0_9 ? {_ppn_data_barrier_9_io_y_ppn[20:18], (ignore_4 ? io_req_0_bits_vaddr[29:21] : 9'h0) | _ppn_data_barrier_9_io_y_ppn[17:9], io_req_0_bits_vaddr[20:12] | _ppn_data_barrier_9_io_y_ppn[8:0]} : 21'h0) | (hitsVec_0_10 ? {_ppn_data_barrier_10_io_y_ppn[20:18], (ignore_7 ? io_req_0_bits_vaddr[29:21] : 9'h0) | _ppn_data_barrier_10_io_y_ppn[17:9], io_req_0_bits_vaddr[20:12] | _ppn_data_barrier_10_io_y_ppn[8:0]} : 21'h0) | (hitsVec_0_11 ? {_ppn_data_barrier_11_io_y_ppn[20:18], (ignore_10 ? io_req_0_bits_vaddr[29:21] : 9'h0) | _ppn_data_barrier_11_io_y_ppn[17:9], io_req_0_bits_vaddr[20:12] | _ppn_data_barrier_11_io_y_ppn[8:0]} : 21'h0) | (hitsVec_0_12 ? {_ppn_data_barrier_12_io_y_ppn[20:18], (ignore_13 ? io_req_0_bits_vaddr[29:21] : 9'h0) | _ppn_data_barrier_12_io_y_ppn[17:9], (special_entry_level[1] ? 9'h0 : io_req_0_bits_vaddr[20:12]) | _ppn_data_barrier_12_io_y_ppn[8:0]} : 21'h0) | (vm_enabled_0 ? 21'h0 : io_req_0_bits_vaddr[32:12]), io_req_0_bits_vaddr[11:0]};
  assign io_resp_0_pf_ld = bad_va_0 & cmd_read_0 | (|((cmd_read_0 ? {~(_r_array_T_4[12] | _entries_barrier_12_io_y_ae), ~(_r_array_T_4[11] | _entries_barrier_11_io_y_ae), ~(_r_array_T_4[10] | _entries_barrier_10_io_y_ae), ~(_r_array_T_4[9] | _entries_barrier_9_io_y_ae), ~(_r_array_T_4[8] | _entries_barrier_8_io_y_ae), ~(_r_array_T_4[7] | _entries_barrier_7_io_y_ae), ~(_r_array_T_4[6] | _entries_barrier_6_io_y_ae), ~(_r_array_T_4[5] | _entries_barrier_5_io_y_ae), ~(_r_array_T_4[4] | _entries_barrier_4_io_y_ae), ~(_r_array_T_4[3] | _entries_barrier_3_io_y_ae), ~(_r_array_T_4[2] | _entries_barrier_2_io_y_ae), ~(_r_array_T_4[1] | _entries_barrier_1_io_y_ae), ~(_r_array_T_4[0] | _entries_barrier_io_y_ae)} : 13'h0) & _GEN_27));
  assign io_resp_0_pf_st = bad_va_0 & cmd_write_perms_0 | (|((cmd_write_perms_0 ? {~(_w_array_T_1[12] | _entries_barrier_12_io_y_ae), ~(_w_array_T_1[11] | _entries_barrier_11_io_y_ae), ~(_w_array_T_1[10] | _entries_barrier_10_io_y_ae), ~(_w_array_T_1[9] | _entries_barrier_9_io_y_ae), ~(_w_array_T_1[8] | _entries_barrier_8_io_y_ae), ~(_w_array_T_1[7] | _entries_barrier_7_io_y_ae), ~(_w_array_T_1[6] | _entries_barrier_6_io_y_ae), ~(_w_array_T_1[5] | _entries_barrier_5_io_y_ae), ~(_w_array_T_1[4] | _entries_barrier_4_io_y_ae), ~(_w_array_T_1[3] | _entries_barrier_3_io_y_ae), ~(_w_array_T_1[2] | _entries_barrier_2_io_y_ae), ~(_w_array_T_1[1] | _entries_barrier_1_io_y_ae), ~(_w_array_T_1[0] | _entries_barrier_io_y_ae)} : 13'h0) & _GEN_27));
  assign io_resp_0_ae_ld = |((cmd_read_0 ? ae_array_0 | ~({{2{newEntry_pr}}, _normal_entries_barrier_11_io_y_pr, _normal_entries_barrier_10_io_y_pr, _normal_entries_barrier_9_io_y_pr, _normal_entries_barrier_8_io_y_pr, _normal_entries_barrier_7_io_y_pr, _normal_entries_barrier_6_io_y_pr, _normal_entries_barrier_5_io_y_pr, _normal_entries_barrier_4_io_y_pr, _normal_entries_barrier_3_io_y_pr, _normal_entries_barrier_2_io_y_pr, _normal_entries_barrier_1_io_y_pr, _normal_entries_barrier_io_y_pr} & _px_array_T_4) : 14'h0) & hits_0);
  assign io_resp_0_ae_st = |(((cmd_write_perms_0 ? ae_array_0 | ~({{2{newEntry_pw}}, _normal_entries_barrier_11_io_y_pw, _normal_entries_barrier_10_io_y_pw, _normal_entries_barrier_9_io_y_pw, _normal_entries_barrier_8_io_y_pw, _normal_entries_barrier_7_io_y_pw, _normal_entries_barrier_6_io_y_pw, _normal_entries_barrier_5_io_y_pw, _normal_entries_barrier_4_io_y_pw, _normal_entries_barrier_3_io_y_pw, _normal_entries_barrier_2_io_y_pw, _normal_entries_barrier_1_io_y_pw, _normal_entries_barrier_io_y_pw} & _px_array_T_4) : 14'h0) | (_cmd_write_T_5 | _cmd_write_T_6 | _cmd_write_T_7 | _cmd_write_T_8 ? ~({{2{newEntry_pal}}, _normal_entries_barrier_11_io_y_pal, _normal_entries_barrier_10_io_y_pal, _normal_entries_barrier_9_io_y_pal, _normal_entries_barrier_8_io_y_pal, _normal_entries_barrier_7_io_y_pal, _normal_entries_barrier_6_io_y_pal, _normal_entries_barrier_5_io_y_pal, _normal_entries_barrier_4_io_y_pal, _normal_entries_barrier_3_io_y_pal, _normal_entries_barrier_2_io_y_pal, _normal_entries_barrier_1_io_y_pal, _normal_entries_barrier_io_y_pal} | lrscAllowed_0) : 14'h0) | (_cmd_write_T_12 | _cmd_write_T_13 | _cmd_write_T_14 | _cmd_write_T_15 | _cmd_write_T_16 ? ~({{2{newEntry_paa}}, _normal_entries_barrier_11_io_y_paa, _normal_entries_barrier_10_io_y_paa, _normal_entries_barrier_9_io_y_paa, _normal_entries_barrier_8_io_y_paa, _normal_entries_barrier_7_io_y_paa, _normal_entries_barrier_6_io_y_paa, _normal_entries_barrier_5_io_y_paa, _normal_entries_barrier_4_io_y_paa, _normal_entries_barrier_3_io_y_paa, _normal_entries_barrier_2_io_y_paa, _normal_entries_barrier_1_io_y_paa, _normal_entries_barrier_io_y_paa} | lrscAllowed_0) : 14'h0)) & hits_0);
  assign io_resp_0_cacheable = |(lrscAllowed_0 & hits_0);
  assign io_resp_1_miss = io_ptw_resp_valid | tlb_miss_1 | multipleHits_1;
  assign io_resp_1_paddr = {(hitsVec_1_0 ? _ppn_data_barrier_13_io_y_ppn : 21'h0) | (hitsVec_1_1 ? _ppn_data_barrier_14_io_y_ppn : 21'h0) | (hitsVec_1_2 ? _ppn_data_barrier_15_io_y_ppn : 21'h0) | (hitsVec_1_3 ? _ppn_data_barrier_16_io_y_ppn : 21'h0) | (hitsVec_1_4 ? _ppn_data_barrier_17_io_y_ppn : 21'h0) | (hitsVec_1_5 ? _ppn_data_barrier_18_io_y_ppn : 21'h0) | (hitsVec_1_6 ? _ppn_data_barrier_19_io_y_ppn : 21'h0) | (hitsVec_1_7 ? _ppn_data_barrier_20_io_y_ppn : 21'h0) | (hitsVec_1_8 ? {_ppn_data_barrier_21_io_y_ppn[20:18], (ignore_1 ? io_req_1_bits_vaddr[29:21] : 9'h0) | _ppn_data_barrier_21_io_y_ppn[17:9], io_req_1_bits_vaddr[20:12] | _ppn_data_barrier_21_io_y_ppn[8:0]} : 21'h0) | (hitsVec_1_9 ? {_ppn_data_barrier_22_io_y_ppn[20:18], (ignore_4 ? io_req_1_bits_vaddr[29:21] : 9'h0) | _ppn_data_barrier_22_io_y_ppn[17:9], io_req_1_bits_vaddr[20:12] | _ppn_data_barrier_22_io_y_ppn[8:0]} : 21'h0) | (hitsVec_1_10 ? {_ppn_data_barrier_23_io_y_ppn[20:18], (ignore_7 ? io_req_1_bits_vaddr[29:21] : 9'h0) | _ppn_data_barrier_23_io_y_ppn[17:9], io_req_1_bits_vaddr[20:12] | _ppn_data_barrier_23_io_y_ppn[8:0]} : 21'h0) | (hitsVec_1_11 ? {_ppn_data_barrier_24_io_y_ppn[20:18], (ignore_10 ? io_req_1_bits_vaddr[29:21] : 9'h0) | _ppn_data_barrier_24_io_y_ppn[17:9], io_req_1_bits_vaddr[20:12] | _ppn_data_barrier_24_io_y_ppn[8:0]} : 21'h0) | (hitsVec_1_12 ? {_ppn_data_barrier_25_io_y_ppn[20:18], (ignore_13 ? io_req_1_bits_vaddr[29:21] : 9'h0) | _ppn_data_barrier_25_io_y_ppn[17:9], (special_entry_level[1] ? 9'h0 : io_req_1_bits_vaddr[20:12]) | _ppn_data_barrier_25_io_y_ppn[8:0]} : 21'h0) | (vm_enabled_1 ? 21'h0 : io_req_1_bits_vaddr[32:12]), io_req_1_bits_vaddr[11:0]};
  assign io_resp_1_pf_ld = bad_va_1 & cmd_read_1 | (|((cmd_read_1 ? {~(_r_array_T_10[12] | _entries_barrier_25_io_y_ae), ~(_r_array_T_10[11] | _entries_barrier_24_io_y_ae), ~(_r_array_T_10[10] | _entries_barrier_23_io_y_ae), ~(_r_array_T_10[9] | _entries_barrier_22_io_y_ae), ~(_r_array_T_10[8] | _entries_barrier_21_io_y_ae), ~(_r_array_T_10[7] | _entries_barrier_20_io_y_ae), ~(_r_array_T_10[6] | _entries_barrier_19_io_y_ae), ~(_r_array_T_10[5] | _entries_barrier_18_io_y_ae), ~(_r_array_T_10[4] | _entries_barrier_17_io_y_ae), ~(_r_array_T_10[3] | _entries_barrier_16_io_y_ae), ~(_r_array_T_10[2] | _entries_barrier_15_io_y_ae), ~(_r_array_T_10[1] | _entries_barrier_14_io_y_ae), ~(_r_array_T_10[0] | _entries_barrier_13_io_y_ae)} : 13'h0) & _GEN_28));
  assign io_resp_1_pf_st = bad_va_1 & cmd_write_perms_1 | (|((cmd_write_perms_1 ? {~(_w_array_T_4[12] | _entries_barrier_25_io_y_ae), ~(_w_array_T_4[11] | _entries_barrier_24_io_y_ae), ~(_w_array_T_4[10] | _entries_barrier_23_io_y_ae), ~(_w_array_T_4[9] | _entries_barrier_22_io_y_ae), ~(_w_array_T_4[8] | _entries_barrier_21_io_y_ae), ~(_w_array_T_4[7] | _entries_barrier_20_io_y_ae), ~(_w_array_T_4[6] | _entries_barrier_19_io_y_ae), ~(_w_array_T_4[5] | _entries_barrier_18_io_y_ae), ~(_w_array_T_4[4] | _entries_barrier_17_io_y_ae), ~(_w_array_T_4[3] | _entries_barrier_16_io_y_ae), ~(_w_array_T_4[2] | _entries_barrier_15_io_y_ae), ~(_w_array_T_4[1] | _entries_barrier_14_io_y_ae), ~(_w_array_T_4[0] | _entries_barrier_13_io_y_ae)} : 13'h0) & _GEN_28));
  assign io_resp_1_ae_ld = |((cmd_read_1 ? ae_array_1 | ~({{2{legal_address_1 & _pmp_1_io_r}}, _normal_entries_barrier_23_io_y_pr, _normal_entries_barrier_22_io_y_pr, _normal_entries_barrier_21_io_y_pr, _normal_entries_barrier_20_io_y_pr, _normal_entries_barrier_19_io_y_pr, _normal_entries_barrier_18_io_y_pr, _normal_entries_barrier_17_io_y_pr, _normal_entries_barrier_16_io_y_pr, _normal_entries_barrier_15_io_y_pr, _normal_entries_barrier_14_io_y_pr, _normal_entries_barrier_13_io_y_pr, _normal_entries_barrier_12_io_y_pr} & _px_array_T_10) : 14'h0) & hits_1);
  assign io_resp_1_ae_st =
    |(((cmd_write_perms_1 ? ae_array_1 | ~({{2{legal_address_1 & (~(|_GEN_20) | ~(|_GEN_21) | ~(|_GEN_22) | ~(|_GEN_23) | ~(|_GEN_24) | ~(|_GEN_25) | ~(|_GEN_10) | ~_GEN_11) & _pmp_1_io_w}}, _normal_entries_barrier_23_io_y_pw, _normal_entries_barrier_22_io_y_pw, _normal_entries_barrier_21_io_y_pw, _normal_entries_barrier_20_io_y_pw, _normal_entries_barrier_19_io_y_pw, _normal_entries_barrier_18_io_y_pw, _normal_entries_barrier_17_io_y_pw, _normal_entries_barrier_16_io_y_pw, _normal_entries_barrier_15_io_y_pw, _normal_entries_barrier_14_io_y_pw, _normal_entries_barrier_13_io_y_pw, _normal_entries_barrier_12_io_y_pw} & _px_array_T_10) : 14'h0) | (_cmd_write_T_28 | _cmd_write_T_29 | _cmd_write_T_30 | _cmd_write_T_31 ? ~({{2{legal_address_1 & (~(|_GEN_20) | ~(|_GEN_21) | ~(|_GEN_22) | ~(|_GEN_23) | ~(|_GEN_24) | ~(|_GEN_25) | ~(|_GEN_10) | ~_GEN_11)}}, _normal_entries_barrier_23_io_y_pal, _normal_entries_barrier_22_io_y_pal, _normal_entries_barrier_21_io_y_pal, _normal_entries_barrier_20_io_y_pal, _normal_entries_barrier_19_io_y_pal, _normal_entries_barrier_18_io_y_pal, _normal_entries_barrier_17_io_y_pal, _normal_entries_barrier_16_io_y_pal, _normal_entries_barrier_15_io_y_pal, _normal_entries_barrier_14_io_y_pal, _normal_entries_barrier_13_io_y_pal, _normal_entries_barrier_12_io_y_pal} | lrscAllowed_1) : 14'h0) | (_cmd_write_T_35 | _cmd_write_T_36 | _cmd_write_T_37 | _cmd_write_T_38 | _cmd_write_T_39 ? ~({{2{legal_address_1 & (~(|_GEN_20) | ~(|_GEN_21) | ~(|_GEN_22) | ~(|_GEN_23) | ~(|_GEN_24) | ~(|_GEN_25) | ~(|_GEN_10) | ~_GEN_11)}}, _normal_entries_barrier_23_io_y_paa, _normal_entries_barrier_22_io_y_paa, _normal_entries_barrier_21_io_y_paa, _normal_entries_barrier_20_io_y_paa, _normal_entries_barrier_19_io_y_paa, _normal_entries_barrier_18_io_y_paa, _normal_entries_barrier_17_io_y_paa, _normal_entries_barrier_16_io_y_paa, _normal_entries_barrier_15_io_y_paa, _normal_entries_barrier_14_io_y_paa, _normal_entries_barrier_13_io_y_paa, _normal_entries_barrier_12_io_y_paa} | lrscAllowed_1) : 14'h0)) & hits_1);
  assign io_resp_1_ma_ld = |(((|_GEN_26) & cmd_read_1 ? ~eff_array_1 : 14'h0) & hits_1);
  assign io_resp_1_ma_st = |(((|_GEN_26) & cmd_write_perms_1 ? ~eff_array_1 : 14'h0) & hits_1);
  assign io_resp_1_cacheable = |(lrscAllowed_1 & hits_1);
  assign io_ptw_req_valid = _io_ptw_req_valid_T;
  assign io_ptw_req_bits_valid = ~io_kill;
  assign io_ptw_req_bits_bits_addr = r_refill_tag;
endmodule

