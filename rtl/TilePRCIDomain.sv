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

module TilePRCIDomain(
  input         auto_intsink_in_sync_0,
                auto_tile_reset_domain_boom_tile_hartid_in,
                auto_int_in_clock_xing_in_0_sync_0,
                auto_int_in_clock_xing_in_0_sync_1,
  output [2:0]  auto_tl_master_clock_xing_out_a_mem_0_opcode,
                auto_tl_master_clock_xing_out_a_mem_0_param,
  output [3:0]  auto_tl_master_clock_xing_out_a_mem_0_size,
  output [4:0]  auto_tl_master_clock_xing_out_a_mem_0_source,
  output [32:0] auto_tl_master_clock_xing_out_a_mem_0_address,
  output [7:0]  auto_tl_master_clock_xing_out_a_mem_0_mask,
  output [63:0] auto_tl_master_clock_xing_out_a_mem_0_data,
  output        auto_tl_master_clock_xing_out_a_mem_0_corrupt,
  output [2:0]  auto_tl_master_clock_xing_out_a_mem_1_opcode,
                auto_tl_master_clock_xing_out_a_mem_1_param,
  output [3:0]  auto_tl_master_clock_xing_out_a_mem_1_size,
  output [4:0]  auto_tl_master_clock_xing_out_a_mem_1_source,
  output [32:0] auto_tl_master_clock_xing_out_a_mem_1_address,
  output [7:0]  auto_tl_master_clock_xing_out_a_mem_1_mask,
  output [63:0] auto_tl_master_clock_xing_out_a_mem_1_data,
  output        auto_tl_master_clock_xing_out_a_mem_1_corrupt,
  output [2:0]  auto_tl_master_clock_xing_out_a_mem_2_opcode,
                auto_tl_master_clock_xing_out_a_mem_2_param,
  output [3:0]  auto_tl_master_clock_xing_out_a_mem_2_size,
  output [4:0]  auto_tl_master_clock_xing_out_a_mem_2_source,
  output [32:0] auto_tl_master_clock_xing_out_a_mem_2_address,
  output [7:0]  auto_tl_master_clock_xing_out_a_mem_2_mask,
  output [63:0] auto_tl_master_clock_xing_out_a_mem_2_data,
  output        auto_tl_master_clock_xing_out_a_mem_2_corrupt,
  output [2:0]  auto_tl_master_clock_xing_out_a_mem_3_opcode,
                auto_tl_master_clock_xing_out_a_mem_3_param,
  output [3:0]  auto_tl_master_clock_xing_out_a_mem_3_size,
  output [4:0]  auto_tl_master_clock_xing_out_a_mem_3_source,
  output [32:0] auto_tl_master_clock_xing_out_a_mem_3_address,
  output [7:0]  auto_tl_master_clock_xing_out_a_mem_3_mask,
  output [63:0] auto_tl_master_clock_xing_out_a_mem_3_data,
  output        auto_tl_master_clock_xing_out_a_mem_3_corrupt,
  output [2:0]  auto_tl_master_clock_xing_out_a_mem_4_opcode,
                auto_tl_master_clock_xing_out_a_mem_4_param,
  output [3:0]  auto_tl_master_clock_xing_out_a_mem_4_size,
  output [4:0]  auto_tl_master_clock_xing_out_a_mem_4_source,
  output [32:0] auto_tl_master_clock_xing_out_a_mem_4_address,
  output [7:0]  auto_tl_master_clock_xing_out_a_mem_4_mask,
  output [63:0] auto_tl_master_clock_xing_out_a_mem_4_data,
  output        auto_tl_master_clock_xing_out_a_mem_4_corrupt,
  output [2:0]  auto_tl_master_clock_xing_out_a_mem_5_opcode,
                auto_tl_master_clock_xing_out_a_mem_5_param,
  output [3:0]  auto_tl_master_clock_xing_out_a_mem_5_size,
  output [4:0]  auto_tl_master_clock_xing_out_a_mem_5_source,
  output [32:0] auto_tl_master_clock_xing_out_a_mem_5_address,
  output [7:0]  auto_tl_master_clock_xing_out_a_mem_5_mask,
  output [63:0] auto_tl_master_clock_xing_out_a_mem_5_data,
  output        auto_tl_master_clock_xing_out_a_mem_5_corrupt,
  output [2:0]  auto_tl_master_clock_xing_out_a_mem_6_opcode,
                auto_tl_master_clock_xing_out_a_mem_6_param,
  output [3:0]  auto_tl_master_clock_xing_out_a_mem_6_size,
  output [4:0]  auto_tl_master_clock_xing_out_a_mem_6_source,
  output [32:0] auto_tl_master_clock_xing_out_a_mem_6_address,
  output [7:0]  auto_tl_master_clock_xing_out_a_mem_6_mask,
  output [63:0] auto_tl_master_clock_xing_out_a_mem_6_data,
  output        auto_tl_master_clock_xing_out_a_mem_6_corrupt,
  output [2:0]  auto_tl_master_clock_xing_out_a_mem_7_opcode,
                auto_tl_master_clock_xing_out_a_mem_7_param,
  output [3:0]  auto_tl_master_clock_xing_out_a_mem_7_size,
  output [4:0]  auto_tl_master_clock_xing_out_a_mem_7_source,
  output [32:0] auto_tl_master_clock_xing_out_a_mem_7_address,
  output [7:0]  auto_tl_master_clock_xing_out_a_mem_7_mask,
  output [63:0] auto_tl_master_clock_xing_out_a_mem_7_data,
  output        auto_tl_master_clock_xing_out_a_mem_7_corrupt,
  input  [3:0]  auto_tl_master_clock_xing_out_a_ridx,
  output [3:0]  auto_tl_master_clock_xing_out_a_widx,
  input         auto_tl_master_clock_xing_out_a_safe_ridx_valid,
  output        auto_tl_master_clock_xing_out_a_safe_widx_valid,
                auto_tl_master_clock_xing_out_a_safe_source_reset_n,
  input         auto_tl_master_clock_xing_out_a_safe_sink_reset_n,
  input  [1:0]  auto_tl_master_clock_xing_out_b_mem_0_param,
  input  [4:0]  auto_tl_master_clock_xing_out_b_mem_0_source,
  input  [32:0] auto_tl_master_clock_xing_out_b_mem_0_address,
  input  [1:0]  auto_tl_master_clock_xing_out_b_mem_1_param,
  input  [4:0]  auto_tl_master_clock_xing_out_b_mem_1_source,
  input  [32:0] auto_tl_master_clock_xing_out_b_mem_1_address,
  input  [1:0]  auto_tl_master_clock_xing_out_b_mem_2_param,
  input  [4:0]  auto_tl_master_clock_xing_out_b_mem_2_source,
  input  [32:0] auto_tl_master_clock_xing_out_b_mem_2_address,
  input  [1:0]  auto_tl_master_clock_xing_out_b_mem_3_param,
  input  [4:0]  auto_tl_master_clock_xing_out_b_mem_3_source,
  input  [32:0] auto_tl_master_clock_xing_out_b_mem_3_address,
  input  [1:0]  auto_tl_master_clock_xing_out_b_mem_4_param,
  input  [4:0]  auto_tl_master_clock_xing_out_b_mem_4_source,
  input  [32:0] auto_tl_master_clock_xing_out_b_mem_4_address,
  input  [1:0]  auto_tl_master_clock_xing_out_b_mem_5_param,
  input  [4:0]  auto_tl_master_clock_xing_out_b_mem_5_source,
  input  [32:0] auto_tl_master_clock_xing_out_b_mem_5_address,
  input  [1:0]  auto_tl_master_clock_xing_out_b_mem_6_param,
  input  [4:0]  auto_tl_master_clock_xing_out_b_mem_6_source,
  input  [32:0] auto_tl_master_clock_xing_out_b_mem_6_address,
  input  [1:0]  auto_tl_master_clock_xing_out_b_mem_7_param,
  input  [4:0]  auto_tl_master_clock_xing_out_b_mem_7_source,
  input  [32:0] auto_tl_master_clock_xing_out_b_mem_7_address,
  output [3:0]  auto_tl_master_clock_xing_out_b_ridx,
  input  [3:0]  auto_tl_master_clock_xing_out_b_widx,
  output        auto_tl_master_clock_xing_out_b_safe_ridx_valid,
  input         auto_tl_master_clock_xing_out_b_safe_widx_valid,
                auto_tl_master_clock_xing_out_b_safe_source_reset_n,
  output        auto_tl_master_clock_xing_out_b_safe_sink_reset_n,
  output [2:0]  auto_tl_master_clock_xing_out_c_mem_0_opcode,
                auto_tl_master_clock_xing_out_c_mem_0_param,
  output [3:0]  auto_tl_master_clock_xing_out_c_mem_0_size,
  output [4:0]  auto_tl_master_clock_xing_out_c_mem_0_source,
  output [32:0] auto_tl_master_clock_xing_out_c_mem_0_address,
  output [63:0] auto_tl_master_clock_xing_out_c_mem_0_data,
  output        auto_tl_master_clock_xing_out_c_mem_0_corrupt,
  output [2:0]  auto_tl_master_clock_xing_out_c_mem_1_opcode,
                auto_tl_master_clock_xing_out_c_mem_1_param,
  output [3:0]  auto_tl_master_clock_xing_out_c_mem_1_size,
  output [4:0]  auto_tl_master_clock_xing_out_c_mem_1_source,
  output [32:0] auto_tl_master_clock_xing_out_c_mem_1_address,
  output [63:0] auto_tl_master_clock_xing_out_c_mem_1_data,
  output        auto_tl_master_clock_xing_out_c_mem_1_corrupt,
  output [2:0]  auto_tl_master_clock_xing_out_c_mem_2_opcode,
                auto_tl_master_clock_xing_out_c_mem_2_param,
  output [3:0]  auto_tl_master_clock_xing_out_c_mem_2_size,
  output [4:0]  auto_tl_master_clock_xing_out_c_mem_2_source,
  output [32:0] auto_tl_master_clock_xing_out_c_mem_2_address,
  output [63:0] auto_tl_master_clock_xing_out_c_mem_2_data,
  output        auto_tl_master_clock_xing_out_c_mem_2_corrupt,
  output [2:0]  auto_tl_master_clock_xing_out_c_mem_3_opcode,
                auto_tl_master_clock_xing_out_c_mem_3_param,
  output [3:0]  auto_tl_master_clock_xing_out_c_mem_3_size,
  output [4:0]  auto_tl_master_clock_xing_out_c_mem_3_source,
  output [32:0] auto_tl_master_clock_xing_out_c_mem_3_address,
  output [63:0] auto_tl_master_clock_xing_out_c_mem_3_data,
  output        auto_tl_master_clock_xing_out_c_mem_3_corrupt,
  output [2:0]  auto_tl_master_clock_xing_out_c_mem_4_opcode,
                auto_tl_master_clock_xing_out_c_mem_4_param,
  output [3:0]  auto_tl_master_clock_xing_out_c_mem_4_size,
  output [4:0]  auto_tl_master_clock_xing_out_c_mem_4_source,
  output [32:0] auto_tl_master_clock_xing_out_c_mem_4_address,
  output [63:0] auto_tl_master_clock_xing_out_c_mem_4_data,
  output        auto_tl_master_clock_xing_out_c_mem_4_corrupt,
  output [2:0]  auto_tl_master_clock_xing_out_c_mem_5_opcode,
                auto_tl_master_clock_xing_out_c_mem_5_param,
  output [3:0]  auto_tl_master_clock_xing_out_c_mem_5_size,
  output [4:0]  auto_tl_master_clock_xing_out_c_mem_5_source,
  output [32:0] auto_tl_master_clock_xing_out_c_mem_5_address,
  output [63:0] auto_tl_master_clock_xing_out_c_mem_5_data,
  output        auto_tl_master_clock_xing_out_c_mem_5_corrupt,
  output [2:0]  auto_tl_master_clock_xing_out_c_mem_6_opcode,
                auto_tl_master_clock_xing_out_c_mem_6_param,
  output [3:0]  auto_tl_master_clock_xing_out_c_mem_6_size,
  output [4:0]  auto_tl_master_clock_xing_out_c_mem_6_source,
  output [32:0] auto_tl_master_clock_xing_out_c_mem_6_address,
  output [63:0] auto_tl_master_clock_xing_out_c_mem_6_data,
  output        auto_tl_master_clock_xing_out_c_mem_6_corrupt,
  output [2:0]  auto_tl_master_clock_xing_out_c_mem_7_opcode,
                auto_tl_master_clock_xing_out_c_mem_7_param,
  output [3:0]  auto_tl_master_clock_xing_out_c_mem_7_size,
  output [4:0]  auto_tl_master_clock_xing_out_c_mem_7_source,
  output [32:0] auto_tl_master_clock_xing_out_c_mem_7_address,
  output [63:0] auto_tl_master_clock_xing_out_c_mem_7_data,
  output        auto_tl_master_clock_xing_out_c_mem_7_corrupt,
  input  [3:0]  auto_tl_master_clock_xing_out_c_ridx,
  output [3:0]  auto_tl_master_clock_xing_out_c_widx,
  input         auto_tl_master_clock_xing_out_c_safe_ridx_valid,
  output        auto_tl_master_clock_xing_out_c_safe_widx_valid,
                auto_tl_master_clock_xing_out_c_safe_source_reset_n,
  input         auto_tl_master_clock_xing_out_c_safe_sink_reset_n,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_0_opcode,
  input  [1:0]  auto_tl_master_clock_xing_out_d_mem_0_param,
  input  [3:0]  auto_tl_master_clock_xing_out_d_mem_0_size,
  input  [4:0]  auto_tl_master_clock_xing_out_d_mem_0_source,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_0_sink,
  input         auto_tl_master_clock_xing_out_d_mem_0_denied,
  input  [63:0] auto_tl_master_clock_xing_out_d_mem_0_data,
  input         auto_tl_master_clock_xing_out_d_mem_0_corrupt,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_1_opcode,
  input  [1:0]  auto_tl_master_clock_xing_out_d_mem_1_param,
  input  [3:0]  auto_tl_master_clock_xing_out_d_mem_1_size,
  input  [4:0]  auto_tl_master_clock_xing_out_d_mem_1_source,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_1_sink,
  input         auto_tl_master_clock_xing_out_d_mem_1_denied,
  input  [63:0] auto_tl_master_clock_xing_out_d_mem_1_data,
  input         auto_tl_master_clock_xing_out_d_mem_1_corrupt,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_2_opcode,
  input  [1:0]  auto_tl_master_clock_xing_out_d_mem_2_param,
  input  [3:0]  auto_tl_master_clock_xing_out_d_mem_2_size,
  input  [4:0]  auto_tl_master_clock_xing_out_d_mem_2_source,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_2_sink,
  input         auto_tl_master_clock_xing_out_d_mem_2_denied,
  input  [63:0] auto_tl_master_clock_xing_out_d_mem_2_data,
  input         auto_tl_master_clock_xing_out_d_mem_2_corrupt,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_3_opcode,
  input  [1:0]  auto_tl_master_clock_xing_out_d_mem_3_param,
  input  [3:0]  auto_tl_master_clock_xing_out_d_mem_3_size,
  input  [4:0]  auto_tl_master_clock_xing_out_d_mem_3_source,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_3_sink,
  input         auto_tl_master_clock_xing_out_d_mem_3_denied,
  input  [63:0] auto_tl_master_clock_xing_out_d_mem_3_data,
  input         auto_tl_master_clock_xing_out_d_mem_3_corrupt,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_4_opcode,
  input  [1:0]  auto_tl_master_clock_xing_out_d_mem_4_param,
  input  [3:0]  auto_tl_master_clock_xing_out_d_mem_4_size,
  input  [4:0]  auto_tl_master_clock_xing_out_d_mem_4_source,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_4_sink,
  input         auto_tl_master_clock_xing_out_d_mem_4_denied,
  input  [63:0] auto_tl_master_clock_xing_out_d_mem_4_data,
  input         auto_tl_master_clock_xing_out_d_mem_4_corrupt,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_5_opcode,
  input  [1:0]  auto_tl_master_clock_xing_out_d_mem_5_param,
  input  [3:0]  auto_tl_master_clock_xing_out_d_mem_5_size,
  input  [4:0]  auto_tl_master_clock_xing_out_d_mem_5_source,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_5_sink,
  input         auto_tl_master_clock_xing_out_d_mem_5_denied,
  input  [63:0] auto_tl_master_clock_xing_out_d_mem_5_data,
  input         auto_tl_master_clock_xing_out_d_mem_5_corrupt,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_6_opcode,
  input  [1:0]  auto_tl_master_clock_xing_out_d_mem_6_param,
  input  [3:0]  auto_tl_master_clock_xing_out_d_mem_6_size,
  input  [4:0]  auto_tl_master_clock_xing_out_d_mem_6_source,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_6_sink,
  input         auto_tl_master_clock_xing_out_d_mem_6_denied,
  input  [63:0] auto_tl_master_clock_xing_out_d_mem_6_data,
  input         auto_tl_master_clock_xing_out_d_mem_6_corrupt,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_7_opcode,
  input  [1:0]  auto_tl_master_clock_xing_out_d_mem_7_param,
  input  [3:0]  auto_tl_master_clock_xing_out_d_mem_7_size,
  input  [4:0]  auto_tl_master_clock_xing_out_d_mem_7_source,
  input  [2:0]  auto_tl_master_clock_xing_out_d_mem_7_sink,
  input         auto_tl_master_clock_xing_out_d_mem_7_denied,
  input  [63:0] auto_tl_master_clock_xing_out_d_mem_7_data,
  input         auto_tl_master_clock_xing_out_d_mem_7_corrupt,
  output [3:0]  auto_tl_master_clock_xing_out_d_ridx,
  input  [3:0]  auto_tl_master_clock_xing_out_d_widx,
  output        auto_tl_master_clock_xing_out_d_safe_ridx_valid,
  input         auto_tl_master_clock_xing_out_d_safe_widx_valid,
                auto_tl_master_clock_xing_out_d_safe_source_reset_n,
  output        auto_tl_master_clock_xing_out_d_safe_sink_reset_n,
  output [2:0]  auto_tl_master_clock_xing_out_e_mem_0_sink,
                auto_tl_master_clock_xing_out_e_mem_1_sink,
                auto_tl_master_clock_xing_out_e_mem_2_sink,
                auto_tl_master_clock_xing_out_e_mem_3_sink,
                auto_tl_master_clock_xing_out_e_mem_4_sink,
                auto_tl_master_clock_xing_out_e_mem_5_sink,
                auto_tl_master_clock_xing_out_e_mem_6_sink,
                auto_tl_master_clock_xing_out_e_mem_7_sink,
  input  [3:0]  auto_tl_master_clock_xing_out_e_ridx,
  output [3:0]  auto_tl_master_clock_xing_out_e_widx,
  input         auto_tl_master_clock_xing_out_e_safe_ridx_valid,
  output        auto_tl_master_clock_xing_out_e_safe_widx_valid,
                auto_tl_master_clock_xing_out_e_safe_source_reset_n,
  input         auto_tl_master_clock_xing_out_e_safe_sink_reset_n,
                auto_tap_clock_in_clock,
                auto_tap_clock_in_reset
);

  wire        _rs_auto_reset_stretcher_out_clock;
  wire        _rs_auto_reset_stretcher_out_reset;
  wire        _intsink_3_auto_out_0;
  wire        _intsink_2_auto_out_0;
  wire        _intsink_1_auto_out_0;
  wire        _intsink_1_auto_out_1;
  wire        _intsink_auto_out_0;
  wire        _asource_auto_in_a_ready;
  wire        _asource_auto_in_b_valid;
  wire [2:0]  _asource_auto_in_b_bits_opcode;
  wire [1:0]  _asource_auto_in_b_bits_param;
  wire [3:0]  _asource_auto_in_b_bits_size;
  wire [4:0]  _asource_auto_in_b_bits_source;
  wire [32:0] _asource_auto_in_b_bits_address;
  wire [7:0]  _asource_auto_in_b_bits_mask;
  wire        _asource_auto_in_b_bits_corrupt;
  wire        _asource_auto_in_c_ready;
  wire        _asource_auto_in_d_valid;
  wire [2:0]  _asource_auto_in_d_bits_opcode;
  wire [1:0]  _asource_auto_in_d_bits_param;
  wire [3:0]  _asource_auto_in_d_bits_size;
  wire [4:0]  _asource_auto_in_d_bits_source;
  wire [2:0]  _asource_auto_in_d_bits_sink;
  wire        _asource_auto_in_d_bits_denied;
  wire [63:0] _asource_auto_in_d_bits_data;
  wire        _asource_auto_in_d_bits_corrupt;
  wire        _asource_auto_in_e_ready;
  wire        _tile_reset_domain_boom_tile_auto_buffer_in_a_ready;
  wire        _tile_reset_domain_boom_tile_auto_buffer_in_b_valid;
  wire [2:0]  _tile_reset_domain_boom_tile_auto_buffer_in_b_bits_opcode;
  wire [1:0]  _tile_reset_domain_boom_tile_auto_buffer_in_b_bits_param;
  wire [3:0]  _tile_reset_domain_boom_tile_auto_buffer_in_b_bits_size;
  wire [4:0]  _tile_reset_domain_boom_tile_auto_buffer_in_b_bits_source;
  wire [32:0] _tile_reset_domain_boom_tile_auto_buffer_in_b_bits_address;
  wire [7:0]  _tile_reset_domain_boom_tile_auto_buffer_in_b_bits_mask;
  wire        _tile_reset_domain_boom_tile_auto_buffer_in_b_bits_corrupt;
  wire        _tile_reset_domain_boom_tile_auto_buffer_in_c_ready;
  wire        _tile_reset_domain_boom_tile_auto_buffer_in_d_valid;
  wire [2:0]  _tile_reset_domain_boom_tile_auto_buffer_in_d_bits_opcode;
  wire [1:0]  _tile_reset_domain_boom_tile_auto_buffer_in_d_bits_param;
  wire [3:0]  _tile_reset_domain_boom_tile_auto_buffer_in_d_bits_size;
  wire [4:0]  _tile_reset_domain_boom_tile_auto_buffer_in_d_bits_source;
  wire [2:0]  _tile_reset_domain_boom_tile_auto_buffer_in_d_bits_sink;
  wire        _tile_reset_domain_boom_tile_auto_buffer_in_d_bits_denied;
  wire [63:0] _tile_reset_domain_boom_tile_auto_buffer_in_d_bits_data;
  wire        _tile_reset_domain_boom_tile_auto_buffer_in_d_bits_corrupt;
  wire        _tile_reset_domain_boom_tile_auto_buffer_in_e_ready;
  wire        _tile_reset_domain_boom_tile_auto_buffer_out_a_valid;
  wire [2:0]  _tile_reset_domain_boom_tile_auto_buffer_out_a_bits_opcode;
  wire [2:0]  _tile_reset_domain_boom_tile_auto_buffer_out_a_bits_param;
  wire [3:0]  _tile_reset_domain_boom_tile_auto_buffer_out_a_bits_size;
  wire [4:0]  _tile_reset_domain_boom_tile_auto_buffer_out_a_bits_source;
  wire [32:0] _tile_reset_domain_boom_tile_auto_buffer_out_a_bits_address;
  wire [7:0]  _tile_reset_domain_boom_tile_auto_buffer_out_a_bits_mask;
  wire [63:0] _tile_reset_domain_boom_tile_auto_buffer_out_a_bits_data;
  wire        _tile_reset_domain_boom_tile_auto_buffer_out_b_ready;
  wire        _tile_reset_domain_boom_tile_auto_buffer_out_c_valid;
  wire [2:0]  _tile_reset_domain_boom_tile_auto_buffer_out_c_bits_opcode;
  wire [2:0]  _tile_reset_domain_boom_tile_auto_buffer_out_c_bits_param;
  wire [3:0]  _tile_reset_domain_boom_tile_auto_buffer_out_c_bits_size;
  wire [4:0]  _tile_reset_domain_boom_tile_auto_buffer_out_c_bits_source;
  wire [32:0] _tile_reset_domain_boom_tile_auto_buffer_out_c_bits_address;
  wire [63:0] _tile_reset_domain_boom_tile_auto_buffer_out_c_bits_data;
  wire        _tile_reset_domain_boom_tile_auto_buffer_out_d_ready;
  wire        _tile_reset_domain_boom_tile_auto_buffer_out_e_valid;
  wire [2:0]  _tile_reset_domain_boom_tile_auto_buffer_out_e_bits_sink;
  wire        _tile_reset_domain_boom_tile_auto_master_out_a_valid;
  wire [2:0]  _tile_reset_domain_boom_tile_auto_master_out_a_bits_opcode;
  wire [2:0]  _tile_reset_domain_boom_tile_auto_master_out_a_bits_param;
  wire [3:0]  _tile_reset_domain_boom_tile_auto_master_out_a_bits_size;
  wire [4:0]  _tile_reset_domain_boom_tile_auto_master_out_a_bits_source;
  wire [32:0] _tile_reset_domain_boom_tile_auto_master_out_a_bits_address;
  wire [7:0]  _tile_reset_domain_boom_tile_auto_master_out_a_bits_mask;
  wire [63:0] _tile_reset_domain_boom_tile_auto_master_out_a_bits_data;
  wire        _tile_reset_domain_boom_tile_auto_master_out_b_ready;
  wire        _tile_reset_domain_boom_tile_auto_master_out_c_valid;
  wire [2:0]  _tile_reset_domain_boom_tile_auto_master_out_c_bits_opcode;
  wire [2:0]  _tile_reset_domain_boom_tile_auto_master_out_c_bits_param;
  wire [3:0]  _tile_reset_domain_boom_tile_auto_master_out_c_bits_size;
  wire [4:0]  _tile_reset_domain_boom_tile_auto_master_out_c_bits_source;
  wire [32:0] _tile_reset_domain_boom_tile_auto_master_out_c_bits_address;
  wire [63:0] _tile_reset_domain_boom_tile_auto_master_out_c_bits_data;
  wire        _tile_reset_domain_boom_tile_auto_master_out_d_ready;
  wire        _tile_reset_domain_boom_tile_auto_master_out_e_valid;
  wire [2:0]  _tile_reset_domain_boom_tile_auto_master_out_e_bits_sink;
  reg  [1:0]  block_during_reset_nodeOut_a_c_value;
  reg         block_during_reset_nodeOut_a_r;
  reg  [1:0]  block_during_reset_nodeIn_d_c_value;
  reg         block_during_reset_nodeIn_d_r;
  reg  [1:0]  block_during_reset_nodeIn_b_c_value;
  reg         block_during_reset_nodeIn_b_r;
  reg  [1:0]  block_during_reset_nodeOut_c_c_value;
  reg         block_during_reset_nodeOut_c_r;
  reg  [1:0]  block_during_reset_nodeOut_e_c_value;
  reg         block_during_reset_nodeOut_e_r;
  always @(posedge auto_tap_clock_in_clock) begin
    if (auto_tap_clock_in_reset) begin
      block_during_reset_nodeOut_a_c_value <= 2'h0;
      block_during_reset_nodeOut_a_r <= 1'h0;
      block_during_reset_nodeIn_d_c_value <= 2'h0;
      block_during_reset_nodeIn_d_r <= 1'h0;
      block_during_reset_nodeIn_b_c_value <= 2'h0;
      block_during_reset_nodeIn_b_r <= 1'h0;
      block_during_reset_nodeOut_c_c_value <= 2'h0;
      block_during_reset_nodeOut_c_r <= 1'h0;
      block_during_reset_nodeOut_e_c_value <= 2'h0;
      block_during_reset_nodeOut_e_r <= 1'h0;
    end
    else begin
      block_during_reset_nodeOut_a_c_value <= block_during_reset_nodeOut_a_c_value + 2'h1;
      block_during_reset_nodeOut_a_r <= (&block_during_reset_nodeOut_a_c_value) | block_during_reset_nodeOut_a_r;
      block_during_reset_nodeIn_d_c_value <= block_during_reset_nodeIn_d_c_value + 2'h1;
      block_during_reset_nodeIn_d_r <= (&block_during_reset_nodeIn_d_c_value) | block_during_reset_nodeIn_d_r;
      block_during_reset_nodeIn_b_c_value <= block_during_reset_nodeIn_b_c_value + 2'h1;
      block_during_reset_nodeIn_b_r <= (&block_during_reset_nodeIn_b_c_value) | block_during_reset_nodeIn_b_r;
      block_during_reset_nodeOut_c_c_value <= block_during_reset_nodeOut_c_c_value + 2'h1;
      block_during_reset_nodeOut_c_r <= (&block_during_reset_nodeOut_c_c_value) | block_during_reset_nodeOut_c_r;
      block_during_reset_nodeOut_e_c_value <= block_during_reset_nodeOut_e_c_value + 2'h1;
      block_during_reset_nodeOut_e_r <= (&block_during_reset_nodeOut_e_c_value) | block_during_reset_nodeOut_e_r;
    end
  end // always @(posedge)
  BoomTile tile_reset_domain_boom_tile (
    .clock                          (_rs_auto_reset_stretcher_out_clock),
    .reset                          (_rs_auto_reset_stretcher_out_reset),
    .auto_buffer_in_a_ready         (_tile_reset_domain_boom_tile_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid         (block_during_reset_nodeOut_a_r & _tile_reset_domain_boom_tile_auto_master_out_a_valid),
    .auto_buffer_in_a_bits_opcode   (_tile_reset_domain_boom_tile_auto_master_out_a_bits_opcode),
    .auto_buffer_in_a_bits_param    (_tile_reset_domain_boom_tile_auto_master_out_a_bits_param),
    .auto_buffer_in_a_bits_size     (_tile_reset_domain_boom_tile_auto_master_out_a_bits_size),
    .auto_buffer_in_a_bits_source   (_tile_reset_domain_boom_tile_auto_master_out_a_bits_source),
    .auto_buffer_in_a_bits_address  (_tile_reset_domain_boom_tile_auto_master_out_a_bits_address),
    .auto_buffer_in_a_bits_mask     (_tile_reset_domain_boom_tile_auto_master_out_a_bits_mask),
    .auto_buffer_in_a_bits_data     (_tile_reset_domain_boom_tile_auto_master_out_a_bits_data),
    .auto_buffer_in_b_ready         (block_during_reset_nodeIn_b_r & _tile_reset_domain_boom_tile_auto_master_out_b_ready),
    .auto_buffer_in_b_valid         (_tile_reset_domain_boom_tile_auto_buffer_in_b_valid),
    .auto_buffer_in_b_bits_opcode   (_tile_reset_domain_boom_tile_auto_buffer_in_b_bits_opcode),
    .auto_buffer_in_b_bits_param    (_tile_reset_domain_boom_tile_auto_buffer_in_b_bits_param),
    .auto_buffer_in_b_bits_size     (_tile_reset_domain_boom_tile_auto_buffer_in_b_bits_size),
    .auto_buffer_in_b_bits_source   (_tile_reset_domain_boom_tile_auto_buffer_in_b_bits_source),
    .auto_buffer_in_b_bits_address  (_tile_reset_domain_boom_tile_auto_buffer_in_b_bits_address),
    .auto_buffer_in_b_bits_mask     (_tile_reset_domain_boom_tile_auto_buffer_in_b_bits_mask),
    .auto_buffer_in_b_bits_corrupt  (_tile_reset_domain_boom_tile_auto_buffer_in_b_bits_corrupt),
    .auto_buffer_in_c_ready         (_tile_reset_domain_boom_tile_auto_buffer_in_c_ready),
    .auto_buffer_in_c_valid         (block_during_reset_nodeOut_c_r & _tile_reset_domain_boom_tile_auto_master_out_c_valid),
    .auto_buffer_in_c_bits_opcode   (_tile_reset_domain_boom_tile_auto_master_out_c_bits_opcode),
    .auto_buffer_in_c_bits_param    (_tile_reset_domain_boom_tile_auto_master_out_c_bits_param),
    .auto_buffer_in_c_bits_size     (_tile_reset_domain_boom_tile_auto_master_out_c_bits_size),
    .auto_buffer_in_c_bits_source   (_tile_reset_domain_boom_tile_auto_master_out_c_bits_source),
    .auto_buffer_in_c_bits_address  (_tile_reset_domain_boom_tile_auto_master_out_c_bits_address),
    .auto_buffer_in_c_bits_data     (_tile_reset_domain_boom_tile_auto_master_out_c_bits_data),
    .auto_buffer_in_d_ready         (block_during_reset_nodeIn_d_r & _tile_reset_domain_boom_tile_auto_master_out_d_ready),
    .auto_buffer_in_d_valid         (_tile_reset_domain_boom_tile_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode   (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_param    (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_param),
    .auto_buffer_in_d_bits_size     (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source   (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_sink     (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_sink),
    .auto_buffer_in_d_bits_denied   (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_denied),
    .auto_buffer_in_d_bits_data     (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_data),
    .auto_buffer_in_d_bits_corrupt  (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_corrupt),
    .auto_buffer_in_e_ready         (_tile_reset_domain_boom_tile_auto_buffer_in_e_ready),
    .auto_buffer_in_e_valid         (block_during_reset_nodeOut_e_r & _tile_reset_domain_boom_tile_auto_master_out_e_valid),
    .auto_buffer_in_e_bits_sink     (_tile_reset_domain_boom_tile_auto_master_out_e_bits_sink),
    .auto_buffer_out_a_ready        (_asource_auto_in_a_ready),
    .auto_buffer_out_a_valid        (_tile_reset_domain_boom_tile_auto_buffer_out_a_valid),
    .auto_buffer_out_a_bits_opcode  (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_opcode),
    .auto_buffer_out_a_bits_param   (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_param),
    .auto_buffer_out_a_bits_size    (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_size),
    .auto_buffer_out_a_bits_source  (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_source),
    .auto_buffer_out_a_bits_address (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_address),
    .auto_buffer_out_a_bits_mask    (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_mask),
    .auto_buffer_out_a_bits_data    (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_data),
    .auto_buffer_out_b_ready        (_tile_reset_domain_boom_tile_auto_buffer_out_b_ready),
    .auto_buffer_out_b_valid        (_asource_auto_in_b_valid),
    .auto_buffer_out_b_bits_opcode  (_asource_auto_in_b_bits_opcode),
    .auto_buffer_out_b_bits_param   (_asource_auto_in_b_bits_param),
    .auto_buffer_out_b_bits_size    (_asource_auto_in_b_bits_size),
    .auto_buffer_out_b_bits_source  (_asource_auto_in_b_bits_source),
    .auto_buffer_out_b_bits_address (_asource_auto_in_b_bits_address),
    .auto_buffer_out_b_bits_mask    (_asource_auto_in_b_bits_mask),
    .auto_buffer_out_b_bits_corrupt (_asource_auto_in_b_bits_corrupt),
    .auto_buffer_out_c_ready        (_asource_auto_in_c_ready),
    .auto_buffer_out_c_valid        (_tile_reset_domain_boom_tile_auto_buffer_out_c_valid),
    .auto_buffer_out_c_bits_opcode  (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_opcode),
    .auto_buffer_out_c_bits_param   (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_param),
    .auto_buffer_out_c_bits_size    (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_size),
    .auto_buffer_out_c_bits_source  (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_source),
    .auto_buffer_out_c_bits_address (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_address),
    .auto_buffer_out_c_bits_data    (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_data),
    .auto_buffer_out_d_ready        (_tile_reset_domain_boom_tile_auto_buffer_out_d_ready),
    .auto_buffer_out_d_valid        (_asource_auto_in_d_valid),
    .auto_buffer_out_d_bits_opcode  (_asource_auto_in_d_bits_opcode),
    .auto_buffer_out_d_bits_param   (_asource_auto_in_d_bits_param),
    .auto_buffer_out_d_bits_size    (_asource_auto_in_d_bits_size),
    .auto_buffer_out_d_bits_source  (_asource_auto_in_d_bits_source),
    .auto_buffer_out_d_bits_sink    (_asource_auto_in_d_bits_sink),
    .auto_buffer_out_d_bits_denied  (_asource_auto_in_d_bits_denied),
    .auto_buffer_out_d_bits_data    (_asource_auto_in_d_bits_data),
    .auto_buffer_out_d_bits_corrupt (_asource_auto_in_d_bits_corrupt),
    .auto_buffer_out_e_ready        (_asource_auto_in_e_ready),
    .auto_buffer_out_e_valid        (_tile_reset_domain_boom_tile_auto_buffer_out_e_valid),
    .auto_buffer_out_e_bits_sink    (_tile_reset_domain_boom_tile_auto_buffer_out_e_bits_sink),
    .auto_master_out_a_ready        (block_during_reset_nodeOut_a_r & _tile_reset_domain_boom_tile_auto_buffer_in_a_ready),
    .auto_master_out_a_valid        (_tile_reset_domain_boom_tile_auto_master_out_a_valid),
    .auto_master_out_a_bits_opcode  (_tile_reset_domain_boom_tile_auto_master_out_a_bits_opcode),
    .auto_master_out_a_bits_param   (_tile_reset_domain_boom_tile_auto_master_out_a_bits_param),
    .auto_master_out_a_bits_size    (_tile_reset_domain_boom_tile_auto_master_out_a_bits_size),
    .auto_master_out_a_bits_source  (_tile_reset_domain_boom_tile_auto_master_out_a_bits_source),
    .auto_master_out_a_bits_address (_tile_reset_domain_boom_tile_auto_master_out_a_bits_address),
    .auto_master_out_a_bits_mask    (_tile_reset_domain_boom_tile_auto_master_out_a_bits_mask),
    .auto_master_out_a_bits_data    (_tile_reset_domain_boom_tile_auto_master_out_a_bits_data),
    .auto_master_out_b_ready        (_tile_reset_domain_boom_tile_auto_master_out_b_ready),
    .auto_master_out_b_valid        (block_during_reset_nodeIn_b_r & _tile_reset_domain_boom_tile_auto_buffer_in_b_valid),
    .auto_master_out_b_bits_opcode  (_tile_reset_domain_boom_tile_auto_buffer_in_b_bits_opcode),
    .auto_master_out_b_bits_param   (_tile_reset_domain_boom_tile_auto_buffer_in_b_bits_param),
    .auto_master_out_b_bits_size    (_tile_reset_domain_boom_tile_auto_buffer_in_b_bits_size),
    .auto_master_out_b_bits_source  (_tile_reset_domain_boom_tile_auto_buffer_in_b_bits_source),
    .auto_master_out_b_bits_address (_tile_reset_domain_boom_tile_auto_buffer_in_b_bits_address),
    .auto_master_out_b_bits_mask    (_tile_reset_domain_boom_tile_auto_buffer_in_b_bits_mask),
    .auto_master_out_b_bits_corrupt (_tile_reset_domain_boom_tile_auto_buffer_in_b_bits_corrupt),
    .auto_master_out_c_ready        (block_during_reset_nodeOut_c_r & _tile_reset_domain_boom_tile_auto_buffer_in_c_ready),
    .auto_master_out_c_valid        (_tile_reset_domain_boom_tile_auto_master_out_c_valid),
    .auto_master_out_c_bits_opcode  (_tile_reset_domain_boom_tile_auto_master_out_c_bits_opcode),
    .auto_master_out_c_bits_param   (_tile_reset_domain_boom_tile_auto_master_out_c_bits_param),
    .auto_master_out_c_bits_size    (_tile_reset_domain_boom_tile_auto_master_out_c_bits_size),
    .auto_master_out_c_bits_source  (_tile_reset_domain_boom_tile_auto_master_out_c_bits_source),
    .auto_master_out_c_bits_address (_tile_reset_domain_boom_tile_auto_master_out_c_bits_address),
    .auto_master_out_c_bits_data    (_tile_reset_domain_boom_tile_auto_master_out_c_bits_data),
    .auto_master_out_d_ready        (_tile_reset_domain_boom_tile_auto_master_out_d_ready),
    .auto_master_out_d_valid        (block_during_reset_nodeIn_d_r & _tile_reset_domain_boom_tile_auto_buffer_in_d_valid),
    .auto_master_out_d_bits_opcode  (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_opcode),
    .auto_master_out_d_bits_param   (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_param),
    .auto_master_out_d_bits_size    (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_size),
    .auto_master_out_d_bits_source  (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_source),
    .auto_master_out_d_bits_sink    (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_sink),
    .auto_master_out_d_bits_denied  (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_denied),
    .auto_master_out_d_bits_data    (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_data),
    .auto_master_out_d_bits_corrupt (_tile_reset_domain_boom_tile_auto_buffer_in_d_bits_corrupt),
    .auto_master_out_e_ready        (block_during_reset_nodeOut_e_r & _tile_reset_domain_boom_tile_auto_buffer_in_e_ready),
    .auto_master_out_e_valid        (_tile_reset_domain_boom_tile_auto_master_out_e_valid),
    .auto_master_out_e_bits_sink    (_tile_reset_domain_boom_tile_auto_master_out_e_bits_sink),
    .auto_int_local_in_3_0          (_intsink_3_auto_out_0),
    .auto_int_local_in_2_0          (_intsink_2_auto_out_0),
    .auto_int_local_in_1_0          (_intsink_1_auto_out_0),
    .auto_int_local_in_1_1          (_intsink_1_auto_out_1),
    .auto_int_local_in_0_0          (_intsink_auto_out_0),
    .auto_hartid_in                 (auto_tile_reset_domain_boom_tile_hartid_in)
  );
  TLAsyncCrossingSource_5 asource (
    .clock                          (auto_tap_clock_in_clock),
    .reset                          (auto_tap_clock_in_reset),
    .auto_in_a_ready                (_asource_auto_in_a_ready),
    .auto_in_a_valid                (_tile_reset_domain_boom_tile_auto_buffer_out_a_valid),
    .auto_in_a_bits_opcode          (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_opcode),
    .auto_in_a_bits_param           (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_param),
    .auto_in_a_bits_size            (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_size),
    .auto_in_a_bits_source          (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_source),
    .auto_in_a_bits_address         (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_address),
    .auto_in_a_bits_mask            (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_mask),
    .auto_in_a_bits_data            (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_data),
    .auto_in_b_ready                (_tile_reset_domain_boom_tile_auto_buffer_out_b_ready),
    .auto_in_b_valid                (_asource_auto_in_b_valid),
    .auto_in_b_bits_opcode          (_asource_auto_in_b_bits_opcode),
    .auto_in_b_bits_param           (_asource_auto_in_b_bits_param),
    .auto_in_b_bits_size            (_asource_auto_in_b_bits_size),
    .auto_in_b_bits_source          (_asource_auto_in_b_bits_source),
    .auto_in_b_bits_address         (_asource_auto_in_b_bits_address),
    .auto_in_b_bits_mask            (_asource_auto_in_b_bits_mask),
    .auto_in_b_bits_corrupt         (_asource_auto_in_b_bits_corrupt),
    .auto_in_c_ready                (_asource_auto_in_c_ready),
    .auto_in_c_valid                (_tile_reset_domain_boom_tile_auto_buffer_out_c_valid),
    .auto_in_c_bits_opcode          (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_opcode),
    .auto_in_c_bits_param           (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_param),
    .auto_in_c_bits_size            (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_size),
    .auto_in_c_bits_source          (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_source),
    .auto_in_c_bits_address         (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_address),
    .auto_in_c_bits_data            (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_data),
    .auto_in_d_ready                (_tile_reset_domain_boom_tile_auto_buffer_out_d_ready),
    .auto_in_d_valid                (_asource_auto_in_d_valid),
    .auto_in_d_bits_opcode          (_asource_auto_in_d_bits_opcode),
    .auto_in_d_bits_param           (_asource_auto_in_d_bits_param),
    .auto_in_d_bits_size            (_asource_auto_in_d_bits_size),
    .auto_in_d_bits_source          (_asource_auto_in_d_bits_source),
    .auto_in_d_bits_sink            (_asource_auto_in_d_bits_sink),
    .auto_in_d_bits_denied          (_asource_auto_in_d_bits_denied),
    .auto_in_d_bits_data            (_asource_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt         (_asource_auto_in_d_bits_corrupt),
    .auto_in_e_ready                (_asource_auto_in_e_ready),
    .auto_in_e_valid                (_tile_reset_domain_boom_tile_auto_buffer_out_e_valid),
    .auto_in_e_bits_sink            (_tile_reset_domain_boom_tile_auto_buffer_out_e_bits_sink),
    .auto_out_a_mem_0_opcode        (auto_tl_master_clock_xing_out_a_mem_0_opcode),
    .auto_out_a_mem_0_param         (auto_tl_master_clock_xing_out_a_mem_0_param),
    .auto_out_a_mem_0_size          (auto_tl_master_clock_xing_out_a_mem_0_size),
    .auto_out_a_mem_0_source        (auto_tl_master_clock_xing_out_a_mem_0_source),
    .auto_out_a_mem_0_address       (auto_tl_master_clock_xing_out_a_mem_0_address),
    .auto_out_a_mem_0_mask          (auto_tl_master_clock_xing_out_a_mem_0_mask),
    .auto_out_a_mem_0_data          (auto_tl_master_clock_xing_out_a_mem_0_data),
    .auto_out_a_mem_0_corrupt       (auto_tl_master_clock_xing_out_a_mem_0_corrupt),
    .auto_out_a_mem_1_opcode        (auto_tl_master_clock_xing_out_a_mem_1_opcode),
    .auto_out_a_mem_1_param         (auto_tl_master_clock_xing_out_a_mem_1_param),
    .auto_out_a_mem_1_size          (auto_tl_master_clock_xing_out_a_mem_1_size),
    .auto_out_a_mem_1_source        (auto_tl_master_clock_xing_out_a_mem_1_source),
    .auto_out_a_mem_1_address       (auto_tl_master_clock_xing_out_a_mem_1_address),
    .auto_out_a_mem_1_mask          (auto_tl_master_clock_xing_out_a_mem_1_mask),
    .auto_out_a_mem_1_data          (auto_tl_master_clock_xing_out_a_mem_1_data),
    .auto_out_a_mem_1_corrupt       (auto_tl_master_clock_xing_out_a_mem_1_corrupt),
    .auto_out_a_mem_2_opcode        (auto_tl_master_clock_xing_out_a_mem_2_opcode),
    .auto_out_a_mem_2_param         (auto_tl_master_clock_xing_out_a_mem_2_param),
    .auto_out_a_mem_2_size          (auto_tl_master_clock_xing_out_a_mem_2_size),
    .auto_out_a_mem_2_source        (auto_tl_master_clock_xing_out_a_mem_2_source),
    .auto_out_a_mem_2_address       (auto_tl_master_clock_xing_out_a_mem_2_address),
    .auto_out_a_mem_2_mask          (auto_tl_master_clock_xing_out_a_mem_2_mask),
    .auto_out_a_mem_2_data          (auto_tl_master_clock_xing_out_a_mem_2_data),
    .auto_out_a_mem_2_corrupt       (auto_tl_master_clock_xing_out_a_mem_2_corrupt),
    .auto_out_a_mem_3_opcode        (auto_tl_master_clock_xing_out_a_mem_3_opcode),
    .auto_out_a_mem_3_param         (auto_tl_master_clock_xing_out_a_mem_3_param),
    .auto_out_a_mem_3_size          (auto_tl_master_clock_xing_out_a_mem_3_size),
    .auto_out_a_mem_3_source        (auto_tl_master_clock_xing_out_a_mem_3_source),
    .auto_out_a_mem_3_address       (auto_tl_master_clock_xing_out_a_mem_3_address),
    .auto_out_a_mem_3_mask          (auto_tl_master_clock_xing_out_a_mem_3_mask),
    .auto_out_a_mem_3_data          (auto_tl_master_clock_xing_out_a_mem_3_data),
    .auto_out_a_mem_3_corrupt       (auto_tl_master_clock_xing_out_a_mem_3_corrupt),
    .auto_out_a_mem_4_opcode        (auto_tl_master_clock_xing_out_a_mem_4_opcode),
    .auto_out_a_mem_4_param         (auto_tl_master_clock_xing_out_a_mem_4_param),
    .auto_out_a_mem_4_size          (auto_tl_master_clock_xing_out_a_mem_4_size),
    .auto_out_a_mem_4_source        (auto_tl_master_clock_xing_out_a_mem_4_source),
    .auto_out_a_mem_4_address       (auto_tl_master_clock_xing_out_a_mem_4_address),
    .auto_out_a_mem_4_mask          (auto_tl_master_clock_xing_out_a_mem_4_mask),
    .auto_out_a_mem_4_data          (auto_tl_master_clock_xing_out_a_mem_4_data),
    .auto_out_a_mem_4_corrupt       (auto_tl_master_clock_xing_out_a_mem_4_corrupt),
    .auto_out_a_mem_5_opcode        (auto_tl_master_clock_xing_out_a_mem_5_opcode),
    .auto_out_a_mem_5_param         (auto_tl_master_clock_xing_out_a_mem_5_param),
    .auto_out_a_mem_5_size          (auto_tl_master_clock_xing_out_a_mem_5_size),
    .auto_out_a_mem_5_source        (auto_tl_master_clock_xing_out_a_mem_5_source),
    .auto_out_a_mem_5_address       (auto_tl_master_clock_xing_out_a_mem_5_address),
    .auto_out_a_mem_5_mask          (auto_tl_master_clock_xing_out_a_mem_5_mask),
    .auto_out_a_mem_5_data          (auto_tl_master_clock_xing_out_a_mem_5_data),
    .auto_out_a_mem_5_corrupt       (auto_tl_master_clock_xing_out_a_mem_5_corrupt),
    .auto_out_a_mem_6_opcode        (auto_tl_master_clock_xing_out_a_mem_6_opcode),
    .auto_out_a_mem_6_param         (auto_tl_master_clock_xing_out_a_mem_6_param),
    .auto_out_a_mem_6_size          (auto_tl_master_clock_xing_out_a_mem_6_size),
    .auto_out_a_mem_6_source        (auto_tl_master_clock_xing_out_a_mem_6_source),
    .auto_out_a_mem_6_address       (auto_tl_master_clock_xing_out_a_mem_6_address),
    .auto_out_a_mem_6_mask          (auto_tl_master_clock_xing_out_a_mem_6_mask),
    .auto_out_a_mem_6_data          (auto_tl_master_clock_xing_out_a_mem_6_data),
    .auto_out_a_mem_6_corrupt       (auto_tl_master_clock_xing_out_a_mem_6_corrupt),
    .auto_out_a_mem_7_opcode        (auto_tl_master_clock_xing_out_a_mem_7_opcode),
    .auto_out_a_mem_7_param         (auto_tl_master_clock_xing_out_a_mem_7_param),
    .auto_out_a_mem_7_size          (auto_tl_master_clock_xing_out_a_mem_7_size),
    .auto_out_a_mem_7_source        (auto_tl_master_clock_xing_out_a_mem_7_source),
    .auto_out_a_mem_7_address       (auto_tl_master_clock_xing_out_a_mem_7_address),
    .auto_out_a_mem_7_mask          (auto_tl_master_clock_xing_out_a_mem_7_mask),
    .auto_out_a_mem_7_data          (auto_tl_master_clock_xing_out_a_mem_7_data),
    .auto_out_a_mem_7_corrupt       (auto_tl_master_clock_xing_out_a_mem_7_corrupt),
    .auto_out_a_ridx                (auto_tl_master_clock_xing_out_a_ridx),
    .auto_out_a_widx                (auto_tl_master_clock_xing_out_a_widx),
    .auto_out_a_safe_ridx_valid     (auto_tl_master_clock_xing_out_a_safe_ridx_valid),
    .auto_out_a_safe_widx_valid     (auto_tl_master_clock_xing_out_a_safe_widx_valid),
    .auto_out_a_safe_source_reset_n (auto_tl_master_clock_xing_out_a_safe_source_reset_n),
    .auto_out_a_safe_sink_reset_n   (auto_tl_master_clock_xing_out_a_safe_sink_reset_n),
    .auto_out_b_mem_0_param         (auto_tl_master_clock_xing_out_b_mem_0_param),
    .auto_out_b_mem_0_source        (auto_tl_master_clock_xing_out_b_mem_0_source),
    .auto_out_b_mem_0_address       (auto_tl_master_clock_xing_out_b_mem_0_address),
    .auto_out_b_mem_1_param         (auto_tl_master_clock_xing_out_b_mem_1_param),
    .auto_out_b_mem_1_source        (auto_tl_master_clock_xing_out_b_mem_1_source),
    .auto_out_b_mem_1_address       (auto_tl_master_clock_xing_out_b_mem_1_address),
    .auto_out_b_mem_2_param         (auto_tl_master_clock_xing_out_b_mem_2_param),
    .auto_out_b_mem_2_source        (auto_tl_master_clock_xing_out_b_mem_2_source),
    .auto_out_b_mem_2_address       (auto_tl_master_clock_xing_out_b_mem_2_address),
    .auto_out_b_mem_3_param         (auto_tl_master_clock_xing_out_b_mem_3_param),
    .auto_out_b_mem_3_source        (auto_tl_master_clock_xing_out_b_mem_3_source),
    .auto_out_b_mem_3_address       (auto_tl_master_clock_xing_out_b_mem_3_address),
    .auto_out_b_mem_4_param         (auto_tl_master_clock_xing_out_b_mem_4_param),
    .auto_out_b_mem_4_source        (auto_tl_master_clock_xing_out_b_mem_4_source),
    .auto_out_b_mem_4_address       (auto_tl_master_clock_xing_out_b_mem_4_address),
    .auto_out_b_mem_5_param         (auto_tl_master_clock_xing_out_b_mem_5_param),
    .auto_out_b_mem_5_source        (auto_tl_master_clock_xing_out_b_mem_5_source),
    .auto_out_b_mem_5_address       (auto_tl_master_clock_xing_out_b_mem_5_address),
    .auto_out_b_mem_6_param         (auto_tl_master_clock_xing_out_b_mem_6_param),
    .auto_out_b_mem_6_source        (auto_tl_master_clock_xing_out_b_mem_6_source),
    .auto_out_b_mem_6_address       (auto_tl_master_clock_xing_out_b_mem_6_address),
    .auto_out_b_mem_7_param         (auto_tl_master_clock_xing_out_b_mem_7_param),
    .auto_out_b_mem_7_source        (auto_tl_master_clock_xing_out_b_mem_7_source),
    .auto_out_b_mem_7_address       (auto_tl_master_clock_xing_out_b_mem_7_address),
    .auto_out_b_ridx                (auto_tl_master_clock_xing_out_b_ridx),
    .auto_out_b_widx                (auto_tl_master_clock_xing_out_b_widx),
    .auto_out_b_safe_ridx_valid     (auto_tl_master_clock_xing_out_b_safe_ridx_valid),
    .auto_out_b_safe_widx_valid     (auto_tl_master_clock_xing_out_b_safe_widx_valid),
    .auto_out_b_safe_source_reset_n (auto_tl_master_clock_xing_out_b_safe_source_reset_n),
    .auto_out_b_safe_sink_reset_n   (auto_tl_master_clock_xing_out_b_safe_sink_reset_n),
    .auto_out_c_mem_0_opcode        (auto_tl_master_clock_xing_out_c_mem_0_opcode),
    .auto_out_c_mem_0_param         (auto_tl_master_clock_xing_out_c_mem_0_param),
    .auto_out_c_mem_0_size          (auto_tl_master_clock_xing_out_c_mem_0_size),
    .auto_out_c_mem_0_source        (auto_tl_master_clock_xing_out_c_mem_0_source),
    .auto_out_c_mem_0_address       (auto_tl_master_clock_xing_out_c_mem_0_address),
    .auto_out_c_mem_0_data          (auto_tl_master_clock_xing_out_c_mem_0_data),
    .auto_out_c_mem_0_corrupt       (auto_tl_master_clock_xing_out_c_mem_0_corrupt),
    .auto_out_c_mem_1_opcode        (auto_tl_master_clock_xing_out_c_mem_1_opcode),
    .auto_out_c_mem_1_param         (auto_tl_master_clock_xing_out_c_mem_1_param),
    .auto_out_c_mem_1_size          (auto_tl_master_clock_xing_out_c_mem_1_size),
    .auto_out_c_mem_1_source        (auto_tl_master_clock_xing_out_c_mem_1_source),
    .auto_out_c_mem_1_address       (auto_tl_master_clock_xing_out_c_mem_1_address),
    .auto_out_c_mem_1_data          (auto_tl_master_clock_xing_out_c_mem_1_data),
    .auto_out_c_mem_1_corrupt       (auto_tl_master_clock_xing_out_c_mem_1_corrupt),
    .auto_out_c_mem_2_opcode        (auto_tl_master_clock_xing_out_c_mem_2_opcode),
    .auto_out_c_mem_2_param         (auto_tl_master_clock_xing_out_c_mem_2_param),
    .auto_out_c_mem_2_size          (auto_tl_master_clock_xing_out_c_mem_2_size),
    .auto_out_c_mem_2_source        (auto_tl_master_clock_xing_out_c_mem_2_source),
    .auto_out_c_mem_2_address       (auto_tl_master_clock_xing_out_c_mem_2_address),
    .auto_out_c_mem_2_data          (auto_tl_master_clock_xing_out_c_mem_2_data),
    .auto_out_c_mem_2_corrupt       (auto_tl_master_clock_xing_out_c_mem_2_corrupt),
    .auto_out_c_mem_3_opcode        (auto_tl_master_clock_xing_out_c_mem_3_opcode),
    .auto_out_c_mem_3_param         (auto_tl_master_clock_xing_out_c_mem_3_param),
    .auto_out_c_mem_3_size          (auto_tl_master_clock_xing_out_c_mem_3_size),
    .auto_out_c_mem_3_source        (auto_tl_master_clock_xing_out_c_mem_3_source),
    .auto_out_c_mem_3_address       (auto_tl_master_clock_xing_out_c_mem_3_address),
    .auto_out_c_mem_3_data          (auto_tl_master_clock_xing_out_c_mem_3_data),
    .auto_out_c_mem_3_corrupt       (auto_tl_master_clock_xing_out_c_mem_3_corrupt),
    .auto_out_c_mem_4_opcode        (auto_tl_master_clock_xing_out_c_mem_4_opcode),
    .auto_out_c_mem_4_param         (auto_tl_master_clock_xing_out_c_mem_4_param),
    .auto_out_c_mem_4_size          (auto_tl_master_clock_xing_out_c_mem_4_size),
    .auto_out_c_mem_4_source        (auto_tl_master_clock_xing_out_c_mem_4_source),
    .auto_out_c_mem_4_address       (auto_tl_master_clock_xing_out_c_mem_4_address),
    .auto_out_c_mem_4_data          (auto_tl_master_clock_xing_out_c_mem_4_data),
    .auto_out_c_mem_4_corrupt       (auto_tl_master_clock_xing_out_c_mem_4_corrupt),
    .auto_out_c_mem_5_opcode        (auto_tl_master_clock_xing_out_c_mem_5_opcode),
    .auto_out_c_mem_5_param         (auto_tl_master_clock_xing_out_c_mem_5_param),
    .auto_out_c_mem_5_size          (auto_tl_master_clock_xing_out_c_mem_5_size),
    .auto_out_c_mem_5_source        (auto_tl_master_clock_xing_out_c_mem_5_source),
    .auto_out_c_mem_5_address       (auto_tl_master_clock_xing_out_c_mem_5_address),
    .auto_out_c_mem_5_data          (auto_tl_master_clock_xing_out_c_mem_5_data),
    .auto_out_c_mem_5_corrupt       (auto_tl_master_clock_xing_out_c_mem_5_corrupt),
    .auto_out_c_mem_6_opcode        (auto_tl_master_clock_xing_out_c_mem_6_opcode),
    .auto_out_c_mem_6_param         (auto_tl_master_clock_xing_out_c_mem_6_param),
    .auto_out_c_mem_6_size          (auto_tl_master_clock_xing_out_c_mem_6_size),
    .auto_out_c_mem_6_source        (auto_tl_master_clock_xing_out_c_mem_6_source),
    .auto_out_c_mem_6_address       (auto_tl_master_clock_xing_out_c_mem_6_address),
    .auto_out_c_mem_6_data          (auto_tl_master_clock_xing_out_c_mem_6_data),
    .auto_out_c_mem_6_corrupt       (auto_tl_master_clock_xing_out_c_mem_6_corrupt),
    .auto_out_c_mem_7_opcode        (auto_tl_master_clock_xing_out_c_mem_7_opcode),
    .auto_out_c_mem_7_param         (auto_tl_master_clock_xing_out_c_mem_7_param),
    .auto_out_c_mem_7_size          (auto_tl_master_clock_xing_out_c_mem_7_size),
    .auto_out_c_mem_7_source        (auto_tl_master_clock_xing_out_c_mem_7_source),
    .auto_out_c_mem_7_address       (auto_tl_master_clock_xing_out_c_mem_7_address),
    .auto_out_c_mem_7_data          (auto_tl_master_clock_xing_out_c_mem_7_data),
    .auto_out_c_mem_7_corrupt       (auto_tl_master_clock_xing_out_c_mem_7_corrupt),
    .auto_out_c_ridx                (auto_tl_master_clock_xing_out_c_ridx),
    .auto_out_c_widx                (auto_tl_master_clock_xing_out_c_widx),
    .auto_out_c_safe_ridx_valid     (auto_tl_master_clock_xing_out_c_safe_ridx_valid),
    .auto_out_c_safe_widx_valid     (auto_tl_master_clock_xing_out_c_safe_widx_valid),
    .auto_out_c_safe_source_reset_n (auto_tl_master_clock_xing_out_c_safe_source_reset_n),
    .auto_out_c_safe_sink_reset_n   (auto_tl_master_clock_xing_out_c_safe_sink_reset_n),
    .auto_out_d_mem_0_opcode        (auto_tl_master_clock_xing_out_d_mem_0_opcode),
    .auto_out_d_mem_0_param         (auto_tl_master_clock_xing_out_d_mem_0_param),
    .auto_out_d_mem_0_size          (auto_tl_master_clock_xing_out_d_mem_0_size),
    .auto_out_d_mem_0_source        (auto_tl_master_clock_xing_out_d_mem_0_source),
    .auto_out_d_mem_0_sink          (auto_tl_master_clock_xing_out_d_mem_0_sink),
    .auto_out_d_mem_0_denied        (auto_tl_master_clock_xing_out_d_mem_0_denied),
    .auto_out_d_mem_0_data          (auto_tl_master_clock_xing_out_d_mem_0_data),
    .auto_out_d_mem_0_corrupt       (auto_tl_master_clock_xing_out_d_mem_0_corrupt),
    .auto_out_d_mem_1_opcode        (auto_tl_master_clock_xing_out_d_mem_1_opcode),
    .auto_out_d_mem_1_param         (auto_tl_master_clock_xing_out_d_mem_1_param),
    .auto_out_d_mem_1_size          (auto_tl_master_clock_xing_out_d_mem_1_size),
    .auto_out_d_mem_1_source        (auto_tl_master_clock_xing_out_d_mem_1_source),
    .auto_out_d_mem_1_sink          (auto_tl_master_clock_xing_out_d_mem_1_sink),
    .auto_out_d_mem_1_denied        (auto_tl_master_clock_xing_out_d_mem_1_denied),
    .auto_out_d_mem_1_data          (auto_tl_master_clock_xing_out_d_mem_1_data),
    .auto_out_d_mem_1_corrupt       (auto_tl_master_clock_xing_out_d_mem_1_corrupt),
    .auto_out_d_mem_2_opcode        (auto_tl_master_clock_xing_out_d_mem_2_opcode),
    .auto_out_d_mem_2_param         (auto_tl_master_clock_xing_out_d_mem_2_param),
    .auto_out_d_mem_2_size          (auto_tl_master_clock_xing_out_d_mem_2_size),
    .auto_out_d_mem_2_source        (auto_tl_master_clock_xing_out_d_mem_2_source),
    .auto_out_d_mem_2_sink          (auto_tl_master_clock_xing_out_d_mem_2_sink),
    .auto_out_d_mem_2_denied        (auto_tl_master_clock_xing_out_d_mem_2_denied),
    .auto_out_d_mem_2_data          (auto_tl_master_clock_xing_out_d_mem_2_data),
    .auto_out_d_mem_2_corrupt       (auto_tl_master_clock_xing_out_d_mem_2_corrupt),
    .auto_out_d_mem_3_opcode        (auto_tl_master_clock_xing_out_d_mem_3_opcode),
    .auto_out_d_mem_3_param         (auto_tl_master_clock_xing_out_d_mem_3_param),
    .auto_out_d_mem_3_size          (auto_tl_master_clock_xing_out_d_mem_3_size),
    .auto_out_d_mem_3_source        (auto_tl_master_clock_xing_out_d_mem_3_source),
    .auto_out_d_mem_3_sink          (auto_tl_master_clock_xing_out_d_mem_3_sink),
    .auto_out_d_mem_3_denied        (auto_tl_master_clock_xing_out_d_mem_3_denied),
    .auto_out_d_mem_3_data          (auto_tl_master_clock_xing_out_d_mem_3_data),
    .auto_out_d_mem_3_corrupt       (auto_tl_master_clock_xing_out_d_mem_3_corrupt),
    .auto_out_d_mem_4_opcode        (auto_tl_master_clock_xing_out_d_mem_4_opcode),
    .auto_out_d_mem_4_param         (auto_tl_master_clock_xing_out_d_mem_4_param),
    .auto_out_d_mem_4_size          (auto_tl_master_clock_xing_out_d_mem_4_size),
    .auto_out_d_mem_4_source        (auto_tl_master_clock_xing_out_d_mem_4_source),
    .auto_out_d_mem_4_sink          (auto_tl_master_clock_xing_out_d_mem_4_sink),
    .auto_out_d_mem_4_denied        (auto_tl_master_clock_xing_out_d_mem_4_denied),
    .auto_out_d_mem_4_data          (auto_tl_master_clock_xing_out_d_mem_4_data),
    .auto_out_d_mem_4_corrupt       (auto_tl_master_clock_xing_out_d_mem_4_corrupt),
    .auto_out_d_mem_5_opcode        (auto_tl_master_clock_xing_out_d_mem_5_opcode),
    .auto_out_d_mem_5_param         (auto_tl_master_clock_xing_out_d_mem_5_param),
    .auto_out_d_mem_5_size          (auto_tl_master_clock_xing_out_d_mem_5_size),
    .auto_out_d_mem_5_source        (auto_tl_master_clock_xing_out_d_mem_5_source),
    .auto_out_d_mem_5_sink          (auto_tl_master_clock_xing_out_d_mem_5_sink),
    .auto_out_d_mem_5_denied        (auto_tl_master_clock_xing_out_d_mem_5_denied),
    .auto_out_d_mem_5_data          (auto_tl_master_clock_xing_out_d_mem_5_data),
    .auto_out_d_mem_5_corrupt       (auto_tl_master_clock_xing_out_d_mem_5_corrupt),
    .auto_out_d_mem_6_opcode        (auto_tl_master_clock_xing_out_d_mem_6_opcode),
    .auto_out_d_mem_6_param         (auto_tl_master_clock_xing_out_d_mem_6_param),
    .auto_out_d_mem_6_size          (auto_tl_master_clock_xing_out_d_mem_6_size),
    .auto_out_d_mem_6_source        (auto_tl_master_clock_xing_out_d_mem_6_source),
    .auto_out_d_mem_6_sink          (auto_tl_master_clock_xing_out_d_mem_6_sink),
    .auto_out_d_mem_6_denied        (auto_tl_master_clock_xing_out_d_mem_6_denied),
    .auto_out_d_mem_6_data          (auto_tl_master_clock_xing_out_d_mem_6_data),
    .auto_out_d_mem_6_corrupt       (auto_tl_master_clock_xing_out_d_mem_6_corrupt),
    .auto_out_d_mem_7_opcode        (auto_tl_master_clock_xing_out_d_mem_7_opcode),
    .auto_out_d_mem_7_param         (auto_tl_master_clock_xing_out_d_mem_7_param),
    .auto_out_d_mem_7_size          (auto_tl_master_clock_xing_out_d_mem_7_size),
    .auto_out_d_mem_7_source        (auto_tl_master_clock_xing_out_d_mem_7_source),
    .auto_out_d_mem_7_sink          (auto_tl_master_clock_xing_out_d_mem_7_sink),
    .auto_out_d_mem_7_denied        (auto_tl_master_clock_xing_out_d_mem_7_denied),
    .auto_out_d_mem_7_data          (auto_tl_master_clock_xing_out_d_mem_7_data),
    .auto_out_d_mem_7_corrupt       (auto_tl_master_clock_xing_out_d_mem_7_corrupt),
    .auto_out_d_ridx                (auto_tl_master_clock_xing_out_d_ridx),
    .auto_out_d_widx                (auto_tl_master_clock_xing_out_d_widx),
    .auto_out_d_safe_ridx_valid     (auto_tl_master_clock_xing_out_d_safe_ridx_valid),
    .auto_out_d_safe_widx_valid     (auto_tl_master_clock_xing_out_d_safe_widx_valid),
    .auto_out_d_safe_source_reset_n (auto_tl_master_clock_xing_out_d_safe_source_reset_n),
    .auto_out_d_safe_sink_reset_n   (auto_tl_master_clock_xing_out_d_safe_sink_reset_n),
    .auto_out_e_mem_0_sink          (auto_tl_master_clock_xing_out_e_mem_0_sink),
    .auto_out_e_mem_1_sink          (auto_tl_master_clock_xing_out_e_mem_1_sink),
    .auto_out_e_mem_2_sink          (auto_tl_master_clock_xing_out_e_mem_2_sink),
    .auto_out_e_mem_3_sink          (auto_tl_master_clock_xing_out_e_mem_3_sink),
    .auto_out_e_mem_4_sink          (auto_tl_master_clock_xing_out_e_mem_4_sink),
    .auto_out_e_mem_5_sink          (auto_tl_master_clock_xing_out_e_mem_5_sink),
    .auto_out_e_mem_6_sink          (auto_tl_master_clock_xing_out_e_mem_6_sink),
    .auto_out_e_mem_7_sink          (auto_tl_master_clock_xing_out_e_mem_7_sink),
    .auto_out_e_ridx                (auto_tl_master_clock_xing_out_e_ridx),
    .auto_out_e_widx                (auto_tl_master_clock_xing_out_e_widx),
    .auto_out_e_safe_ridx_valid     (auto_tl_master_clock_xing_out_e_safe_ridx_valid),
    .auto_out_e_safe_widx_valid     (auto_tl_master_clock_xing_out_e_safe_widx_valid),
    .auto_out_e_safe_source_reset_n (auto_tl_master_clock_xing_out_e_safe_source_reset_n),
    .auto_out_e_safe_sink_reset_n   (auto_tl_master_clock_xing_out_e_safe_sink_reset_n)
  );
  IntSyncAsyncCrossingSink intsink (
    .clock          (auto_tap_clock_in_clock),
    .auto_in_sync_0 (auto_intsink_in_sync_0),
    .auto_out_0     (_intsink_auto_out_0)
  );
  IntSyncAsyncCrossingSink_1 intsink_1 (
    .clock          (auto_tap_clock_in_clock),
    .auto_in_sync_0 (auto_int_in_clock_xing_in_0_sync_0),
    .auto_in_sync_1 (auto_int_in_clock_xing_in_0_sync_1),
    .auto_out_0     (_intsink_1_auto_out_0),
    .auto_out_1     (_intsink_1_auto_out_1)
  );
  IntSyncAsyncCrossingSink intsink_2 (
    .clock          (auto_tap_clock_in_clock),
    .auto_in_sync_0 (1'h0),
    .auto_out_0     (_intsink_2_auto_out_0)
  );
  IntSyncAsyncCrossingSink intsink_3 (
    .clock          (auto_tap_clock_in_clock),
    .auto_in_sync_0 (1'h0),
    .auto_out_0     (_intsink_3_auto_out_0)
  );
  ResetStretcher rs (
    .auto_reset_stretcher_in_clock  (auto_tap_clock_in_clock),
    .auto_reset_stretcher_in_reset  (auto_tap_clock_in_reset),
    .auto_reset_stretcher_out_clock (_rs_auto_reset_stretcher_out_clock),
    .auto_reset_stretcher_out_reset (_rs_auto_reset_stretcher_out_reset)
  );
endmodule

