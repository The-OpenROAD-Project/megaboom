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

module TilePRCIDomain(
  input         auto_intsink_in_sync_0,
                auto_tile_reset_domain_boom_tile_hartid_in,
                auto_int_in_clock_xing_in_2_sync_0,
                auto_int_in_clock_xing_in_1_sync_0,
                auto_int_in_clock_xing_in_0_sync_0,
                auto_int_in_clock_xing_in_0_sync_1,
                auto_tl_master_clock_xing_out_a_ready,
  output        auto_tl_master_clock_xing_out_a_valid,
  output [2:0]  auto_tl_master_clock_xing_out_a_bits_opcode,
                auto_tl_master_clock_xing_out_a_bits_param,
  output [3:0]  auto_tl_master_clock_xing_out_a_bits_size,
  output [4:0]  auto_tl_master_clock_xing_out_a_bits_source,
  output [32:0] auto_tl_master_clock_xing_out_a_bits_address,
  output [7:0]  auto_tl_master_clock_xing_out_a_bits_mask,
  output [63:0] auto_tl_master_clock_xing_out_a_bits_data,
  output        auto_tl_master_clock_xing_out_a_bits_corrupt,
                auto_tl_master_clock_xing_out_b_ready,
  input         auto_tl_master_clock_xing_out_b_valid,
  input  [1:0]  auto_tl_master_clock_xing_out_b_bits_param,
  input  [32:0] auto_tl_master_clock_xing_out_b_bits_address,
  input         auto_tl_master_clock_xing_out_c_ready,
  output        auto_tl_master_clock_xing_out_c_valid,
  output [2:0]  auto_tl_master_clock_xing_out_c_bits_opcode,
                auto_tl_master_clock_xing_out_c_bits_param,
  output [3:0]  auto_tl_master_clock_xing_out_c_bits_size,
  output [4:0]  auto_tl_master_clock_xing_out_c_bits_source,
  output [32:0] auto_tl_master_clock_xing_out_c_bits_address,
  output [63:0] auto_tl_master_clock_xing_out_c_bits_data,
  output        auto_tl_master_clock_xing_out_c_bits_corrupt,
                auto_tl_master_clock_xing_out_d_ready,
  input         auto_tl_master_clock_xing_out_d_valid,
  input  [2:0]  auto_tl_master_clock_xing_out_d_bits_opcode,
  input  [1:0]  auto_tl_master_clock_xing_out_d_bits_param,
  input  [3:0]  auto_tl_master_clock_xing_out_d_bits_size,
  input  [4:0]  auto_tl_master_clock_xing_out_d_bits_source,
  input  [2:0]  auto_tl_master_clock_xing_out_d_bits_sink,
  input         auto_tl_master_clock_xing_out_d_bits_denied,
  input  [63:0] auto_tl_master_clock_xing_out_d_bits_data,
  input         auto_tl_master_clock_xing_out_d_bits_corrupt,
  output        auto_tl_master_clock_xing_out_e_valid,
  output [2:0]  auto_tl_master_clock_xing_out_e_bits_sink,
  input         auto_tap_clock_in_clock,
                auto_tap_clock_in_reset
);

  wire        _intsink_3_auto_out_0;
  wire        _intsink_2_auto_out_0;
  wire        _intsink_1_auto_out_0;
  wire        _intsink_1_auto_out_1;
  wire        _intsink_auto_out_0;
  wire        _buffer_auto_in_a_ready;
  wire        _buffer_auto_in_b_valid;
  wire [2:0]  _buffer_auto_in_b_bits_opcode;
  wire [1:0]  _buffer_auto_in_b_bits_param;
  wire [3:0]  _buffer_auto_in_b_bits_size;
  wire [4:0]  _buffer_auto_in_b_bits_source;
  wire [32:0] _buffer_auto_in_b_bits_address;
  wire [7:0]  _buffer_auto_in_b_bits_mask;
  wire        _buffer_auto_in_b_bits_corrupt;
  wire        _buffer_auto_in_c_ready;
  wire        _buffer_auto_in_d_valid;
  wire [2:0]  _buffer_auto_in_d_bits_opcode;
  wire [1:0]  _buffer_auto_in_d_bits_param;
  wire [3:0]  _buffer_auto_in_d_bits_size;
  wire [4:0]  _buffer_auto_in_d_bits_source;
  wire [2:0]  _buffer_auto_in_d_bits_sink;
  wire        _buffer_auto_in_d_bits_denied;
  wire [63:0] _buffer_auto_in_d_bits_data;
  wire        _buffer_auto_in_d_bits_corrupt;
  wire        _buffer_auto_in_e_ready;
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
  BoomTile tile_reset_domain_boom_tile (
    .clock                          (auto_tap_clock_in_clock),
    .reset                          (auto_tap_clock_in_reset),
    .auto_buffer_out_a_ready        (_buffer_auto_in_a_ready),
    .auto_buffer_out_a_valid        (_tile_reset_domain_boom_tile_auto_buffer_out_a_valid),
    .auto_buffer_out_a_bits_opcode  (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_opcode),
    .auto_buffer_out_a_bits_param   (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_param),
    .auto_buffer_out_a_bits_size    (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_size),
    .auto_buffer_out_a_bits_source  (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_source),
    .auto_buffer_out_a_bits_address (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_address),
    .auto_buffer_out_a_bits_mask    (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_mask),
    .auto_buffer_out_a_bits_data    (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_data),
    .auto_buffer_out_b_ready        (_tile_reset_domain_boom_tile_auto_buffer_out_b_ready),
    .auto_buffer_out_b_valid        (_buffer_auto_in_b_valid),
    .auto_buffer_out_b_bits_opcode  (_buffer_auto_in_b_bits_opcode),
    .auto_buffer_out_b_bits_param   (_buffer_auto_in_b_bits_param),
    .auto_buffer_out_b_bits_size    (_buffer_auto_in_b_bits_size),
    .auto_buffer_out_b_bits_source  (_buffer_auto_in_b_bits_source),
    .auto_buffer_out_b_bits_address (_buffer_auto_in_b_bits_address),
    .auto_buffer_out_b_bits_mask    (_buffer_auto_in_b_bits_mask),
    .auto_buffer_out_b_bits_corrupt (_buffer_auto_in_b_bits_corrupt),
    .auto_buffer_out_c_ready        (_buffer_auto_in_c_ready),
    .auto_buffer_out_c_valid        (_tile_reset_domain_boom_tile_auto_buffer_out_c_valid),
    .auto_buffer_out_c_bits_opcode  (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_opcode),
    .auto_buffer_out_c_bits_param   (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_param),
    .auto_buffer_out_c_bits_size    (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_size),
    .auto_buffer_out_c_bits_source  (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_source),
    .auto_buffer_out_c_bits_address (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_address),
    .auto_buffer_out_c_bits_data    (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_data),
    .auto_buffer_out_d_ready        (_tile_reset_domain_boom_tile_auto_buffer_out_d_ready),
    .auto_buffer_out_d_valid        (_buffer_auto_in_d_valid),
    .auto_buffer_out_d_bits_opcode  (_buffer_auto_in_d_bits_opcode),
    .auto_buffer_out_d_bits_param   (_buffer_auto_in_d_bits_param),
    .auto_buffer_out_d_bits_size    (_buffer_auto_in_d_bits_size),
    .auto_buffer_out_d_bits_source  (_buffer_auto_in_d_bits_source),
    .auto_buffer_out_d_bits_sink    (_buffer_auto_in_d_bits_sink),
    .auto_buffer_out_d_bits_denied  (_buffer_auto_in_d_bits_denied),
    .auto_buffer_out_d_bits_data    (_buffer_auto_in_d_bits_data),
    .auto_buffer_out_d_bits_corrupt (_buffer_auto_in_d_bits_corrupt),
    .auto_buffer_out_e_ready        (_buffer_auto_in_e_ready),
    .auto_buffer_out_e_valid        (_tile_reset_domain_boom_tile_auto_buffer_out_e_valid),
    .auto_buffer_out_e_bits_sink    (_tile_reset_domain_boom_tile_auto_buffer_out_e_bits_sink),
    .auto_int_local_in_3_0          (_intsink_3_auto_out_0),
    .auto_int_local_in_2_0          (_intsink_2_auto_out_0),
    .auto_int_local_in_1_0          (_intsink_1_auto_out_0),
    .auto_int_local_in_1_1          (_intsink_1_auto_out_1),
    .auto_int_local_in_0_0          (_intsink_auto_out_0),
    .auto_hartid_in                 (auto_tile_reset_domain_boom_tile_hartid_in)
  );
  TLBuffer_16 buffer (
    .clock                   (auto_tap_clock_in_clock),
    .reset                   (auto_tap_clock_in_reset),
    .auto_in_a_ready         (_buffer_auto_in_a_ready),
    .auto_in_a_valid         (_tile_reset_domain_boom_tile_auto_buffer_out_a_valid),
    .auto_in_a_bits_opcode   (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_opcode),
    .auto_in_a_bits_param    (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_param),
    .auto_in_a_bits_size     (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_size),
    .auto_in_a_bits_source   (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_source),
    .auto_in_a_bits_address  (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_address),
    .auto_in_a_bits_mask     (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_mask),
    .auto_in_a_bits_data     (_tile_reset_domain_boom_tile_auto_buffer_out_a_bits_data),
    .auto_in_b_ready         (_tile_reset_domain_boom_tile_auto_buffer_out_b_ready),
    .auto_in_b_valid         (_buffer_auto_in_b_valid),
    .auto_in_b_bits_opcode   (_buffer_auto_in_b_bits_opcode),
    .auto_in_b_bits_param    (_buffer_auto_in_b_bits_param),
    .auto_in_b_bits_size     (_buffer_auto_in_b_bits_size),
    .auto_in_b_bits_source   (_buffer_auto_in_b_bits_source),
    .auto_in_b_bits_address  (_buffer_auto_in_b_bits_address),
    .auto_in_b_bits_mask     (_buffer_auto_in_b_bits_mask),
    .auto_in_b_bits_corrupt  (_buffer_auto_in_b_bits_corrupt),
    .auto_in_c_ready         (_buffer_auto_in_c_ready),
    .auto_in_c_valid         (_tile_reset_domain_boom_tile_auto_buffer_out_c_valid),
    .auto_in_c_bits_opcode   (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_opcode),
    .auto_in_c_bits_param    (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_param),
    .auto_in_c_bits_size     (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_size),
    .auto_in_c_bits_source   (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_source),
    .auto_in_c_bits_address  (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_address),
    .auto_in_c_bits_data     (_tile_reset_domain_boom_tile_auto_buffer_out_c_bits_data),
    .auto_in_d_ready         (_tile_reset_domain_boom_tile_auto_buffer_out_d_ready),
    .auto_in_d_valid         (_buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink     (_buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied   (_buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_buffer_auto_in_d_bits_corrupt),
    .auto_in_e_ready         (_buffer_auto_in_e_ready),
    .auto_in_e_valid         (_tile_reset_domain_boom_tile_auto_buffer_out_e_valid),
    .auto_in_e_bits_sink     (_tile_reset_domain_boom_tile_auto_buffer_out_e_bits_sink),
    .auto_out_a_ready        (auto_tl_master_clock_xing_out_a_ready),
    .auto_out_a_valid        (auto_tl_master_clock_xing_out_a_valid),
    .auto_out_a_bits_opcode  (auto_tl_master_clock_xing_out_a_bits_opcode),
    .auto_out_a_bits_param   (auto_tl_master_clock_xing_out_a_bits_param),
    .auto_out_a_bits_size    (auto_tl_master_clock_xing_out_a_bits_size),
    .auto_out_a_bits_source  (auto_tl_master_clock_xing_out_a_bits_source),
    .auto_out_a_bits_address (auto_tl_master_clock_xing_out_a_bits_address),
    .auto_out_a_bits_mask    (auto_tl_master_clock_xing_out_a_bits_mask),
    .auto_out_a_bits_data    (auto_tl_master_clock_xing_out_a_bits_data),
    .auto_out_a_bits_corrupt (auto_tl_master_clock_xing_out_a_bits_corrupt),
    .auto_out_b_ready        (auto_tl_master_clock_xing_out_b_ready),
    .auto_out_b_valid        (auto_tl_master_clock_xing_out_b_valid),
    .auto_out_b_bits_param   (auto_tl_master_clock_xing_out_b_bits_param),
    .auto_out_b_bits_address (auto_tl_master_clock_xing_out_b_bits_address),
    .auto_out_c_ready        (auto_tl_master_clock_xing_out_c_ready),
    .auto_out_c_valid        (auto_tl_master_clock_xing_out_c_valid),
    .auto_out_c_bits_opcode  (auto_tl_master_clock_xing_out_c_bits_opcode),
    .auto_out_c_bits_param   (auto_tl_master_clock_xing_out_c_bits_param),
    .auto_out_c_bits_size    (auto_tl_master_clock_xing_out_c_bits_size),
    .auto_out_c_bits_source  (auto_tl_master_clock_xing_out_c_bits_source),
    .auto_out_c_bits_address (auto_tl_master_clock_xing_out_c_bits_address),
    .auto_out_c_bits_data    (auto_tl_master_clock_xing_out_c_bits_data),
    .auto_out_c_bits_corrupt (auto_tl_master_clock_xing_out_c_bits_corrupt),
    .auto_out_d_ready        (auto_tl_master_clock_xing_out_d_ready),
    .auto_out_d_valid        (auto_tl_master_clock_xing_out_d_valid),
    .auto_out_d_bits_opcode  (auto_tl_master_clock_xing_out_d_bits_opcode),
    .auto_out_d_bits_param   (auto_tl_master_clock_xing_out_d_bits_param),
    .auto_out_d_bits_size    (auto_tl_master_clock_xing_out_d_bits_size),
    .auto_out_d_bits_source  (auto_tl_master_clock_xing_out_d_bits_source),
    .auto_out_d_bits_sink    (auto_tl_master_clock_xing_out_d_bits_sink),
    .auto_out_d_bits_denied  (auto_tl_master_clock_xing_out_d_bits_denied),
    .auto_out_d_bits_data    (auto_tl_master_clock_xing_out_d_bits_data),
    .auto_out_d_bits_corrupt (auto_tl_master_clock_xing_out_d_bits_corrupt),
    .auto_out_e_valid        (auto_tl_master_clock_xing_out_e_valid),
    .auto_out_e_bits_sink    (auto_tl_master_clock_xing_out_e_bits_sink)
  );
  IntSyncAsyncCrossingSink intsink (
    .clock          (auto_tap_clock_in_clock),
    .auto_in_sync_0 (auto_intsink_in_sync_0),
    .auto_out_0     (_intsink_auto_out_0)
  );
  IntSyncSyncCrossingSink intsink_1 (
    .auto_in_sync_0 (auto_int_in_clock_xing_in_0_sync_0),
    .auto_in_sync_1 (auto_int_in_clock_xing_in_0_sync_1),
    .auto_out_0     (_intsink_1_auto_out_0),
    .auto_out_1     (_intsink_1_auto_out_1)
  );
  IntSyncSyncCrossingSink_1 intsink_2 (
    .auto_in_sync_0 (auto_int_in_clock_xing_in_1_sync_0),
    .auto_out_0     (_intsink_2_auto_out_0)
  );
  IntSyncSyncCrossingSink_1 intsink_3 (
    .auto_in_sync_0 (auto_int_in_clock_xing_in_2_sync_0),
    .auto_out_0     (_intsink_3_auto_out_0)
  );
  IntSyncCrossingSource_1 intsource_1 (
    .clock           (auto_tap_clock_in_clock),
    .reset           (auto_tap_clock_in_reset),
    .auto_in_0       (1'h0),
    .auto_out_sync_0 (/* unused */)
  );
  IntSyncCrossingSource_1 intsource_2 (
    .clock           (auto_tap_clock_in_clock),
    .reset           (auto_tap_clock_in_reset),
    .auto_in_0       (1'h0),
    .auto_out_sync_0 (/* unused */)
  );
  IntSyncCrossingSource_1 intsource_3 (
    .clock           (auto_tap_clock_in_clock),
    .reset           (auto_tap_clock_in_reset),
    .auto_in_0       (1'h0),
    .auto_out_sync_0 (/* unused */)
  );
endmodule

