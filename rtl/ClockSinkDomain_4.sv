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

module ClockSinkDomain_4(
  output        auto_pllCtrl_ctrl_out_gate,
                auto_pllCtrl_ctrl_out_power,
  input         auto_clockSelector_clock_in_1_clock,
                auto_clockSelector_clock_in_0_clock,
                auto_clockSelector_clock_in_0_reset,
  output        auto_resetSynchronizer_out_member_allClocks_uncore_clock,
                auto_resetSynchronizer_out_member_allClocks_uncore_reset,
                auto_xbar_in_a_ready,
  input         auto_xbar_in_a_valid,
  input  [2:0]  auto_xbar_in_a_bits_opcode,
                auto_xbar_in_a_bits_param,
                auto_xbar_in_a_bits_size,
  input  [6:0]  auto_xbar_in_a_bits_source,
  input  [20:0] auto_xbar_in_a_bits_address,
  input  [7:0]  auto_xbar_in_a_bits_mask,
  input  [63:0] auto_xbar_in_a_bits_data,
  input         auto_xbar_in_a_bits_corrupt,
                auto_xbar_in_d_ready,
  output        auto_xbar_in_d_valid,
  output [2:0]  auto_xbar_in_d_bits_opcode,
                auto_xbar_in_d_bits_size,
  output [6:0]  auto_xbar_in_d_bits_source,
  output [63:0] auto_xbar_in_d_bits_data,
  input         auto_clock_in_clock,
                auto_clock_in_reset
);

  wire        _fragmenter_4_auto_in_a_ready;
  wire        _fragmenter_4_auto_in_d_valid;
  wire [2:0]  _fragmenter_4_auto_in_d_bits_opcode;
  wire [2:0]  _fragmenter_4_auto_in_d_bits_size;
  wire [6:0]  _fragmenter_4_auto_in_d_bits_source;
  wire [63:0] _fragmenter_4_auto_in_d_bits_data;
  wire        _fragmenter_4_auto_out_a_valid;
  wire [2:0]  _fragmenter_4_auto_out_a_bits_opcode;
  wire [2:0]  _fragmenter_4_auto_out_a_bits_param;
  wire [1:0]  _fragmenter_4_auto_out_a_bits_size;
  wire [10:0] _fragmenter_4_auto_out_a_bits_source;
  wire [20:0] _fragmenter_4_auto_out_a_bits_address;
  wire [7:0]  _fragmenter_4_auto_out_a_bits_mask;
  wire [63:0] _fragmenter_4_auto_out_a_bits_data;
  wire        _fragmenter_4_auto_out_a_bits_corrupt;
  wire        _fragmenter_4_auto_out_d_ready;
  wire        _fragmenter_3_auto_in_a_ready;
  wire        _fragmenter_3_auto_in_d_valid;
  wire [2:0]  _fragmenter_3_auto_in_d_bits_opcode;
  wire [2:0]  _fragmenter_3_auto_in_d_bits_size;
  wire [6:0]  _fragmenter_3_auto_in_d_bits_source;
  wire [63:0] _fragmenter_3_auto_in_d_bits_data;
  wire        _fragmenter_3_auto_out_a_valid;
  wire [2:0]  _fragmenter_3_auto_out_a_bits_opcode;
  wire [2:0]  _fragmenter_3_auto_out_a_bits_param;
  wire [1:0]  _fragmenter_3_auto_out_a_bits_size;
  wire [10:0] _fragmenter_3_auto_out_a_bits_source;
  wire [20:0] _fragmenter_3_auto_out_a_bits_address;
  wire [7:0]  _fragmenter_3_auto_out_a_bits_mask;
  wire [63:0] _fragmenter_3_auto_out_a_bits_data;
  wire        _fragmenter_3_auto_out_a_bits_corrupt;
  wire        _fragmenter_3_auto_out_d_ready;
  wire        _fragmenter_2_auto_in_a_ready;
  wire        _fragmenter_2_auto_in_d_valid;
  wire [2:0]  _fragmenter_2_auto_in_d_bits_opcode;
  wire [2:0]  _fragmenter_2_auto_in_d_bits_size;
  wire [6:0]  _fragmenter_2_auto_in_d_bits_source;
  wire [63:0] _fragmenter_2_auto_in_d_bits_data;
  wire        _fragmenter_2_auto_out_a_valid;
  wire [2:0]  _fragmenter_2_auto_out_a_bits_opcode;
  wire [2:0]  _fragmenter_2_auto_out_a_bits_param;
  wire [1:0]  _fragmenter_2_auto_out_a_bits_size;
  wire [10:0] _fragmenter_2_auto_out_a_bits_source;
  wire [20:0] _fragmenter_2_auto_out_a_bits_address;
  wire [7:0]  _fragmenter_2_auto_out_a_bits_mask;
  wire [63:0] _fragmenter_2_auto_out_a_bits_data;
  wire        _fragmenter_2_auto_out_a_bits_corrupt;
  wire        _fragmenter_2_auto_out_d_ready;
  wire        _pllCtrl_auto_tl_in_a_ready;
  wire        _pllCtrl_auto_tl_in_d_valid;
  wire [2:0]  _pllCtrl_auto_tl_in_d_bits_opcode;
  wire [1:0]  _pllCtrl_auto_tl_in_d_bits_size;
  wire [10:0] _pllCtrl_auto_tl_in_d_bits_source;
  wire [63:0] _pllCtrl_auto_tl_in_d_bits_data;
  wire        _clockSelector_auto_clock_out_member_allClocks_uncore_clock;
  wire        _clockSelector_auto_clock_out_member_allClocks_uncore_reset;
  wire        _clockSelector_auto_tl_in_a_ready;
  wire        _clockSelector_auto_tl_in_d_valid;
  wire [2:0]  _clockSelector_auto_tl_in_d_bits_opcode;
  wire [1:0]  _clockSelector_auto_tl_in_d_bits_size;
  wire [10:0] _clockSelector_auto_tl_in_d_bits_source;
  wire [63:0] _clockSelector_auto_tl_in_d_bits_data;
  wire        _clockDivider_auto_tl_in_a_ready;
  wire        _clockDivider_auto_tl_in_d_valid;
  wire [2:0]  _clockDivider_auto_tl_in_d_bits_opcode;
  wire [1:0]  _clockDivider_auto_tl_in_d_bits_size;
  wire [10:0] _clockDivider_auto_tl_in_d_bits_source;
  wire [63:0] _clockDivider_auto_tl_in_d_bits_data;
  wire        _clockDivider_auto_clock_out_member_allClocks_uncore_clock;
  wire        _clockDivider_auto_clock_out_member_allClocks_uncore_reset;
  wire        _fragmenter_1_auto_in_a_ready;
  wire        _fragmenter_1_auto_in_d_valid;
  wire [2:0]  _fragmenter_1_auto_in_d_bits_opcode;
  wire [2:0]  _fragmenter_1_auto_in_d_bits_size;
  wire [6:0]  _fragmenter_1_auto_in_d_bits_source;
  wire [63:0] _fragmenter_1_auto_in_d_bits_data;
  wire        _fragmenter_1_auto_out_a_valid;
  wire [2:0]  _fragmenter_1_auto_out_a_bits_opcode;
  wire [2:0]  _fragmenter_1_auto_out_a_bits_param;
  wire [1:0]  _fragmenter_1_auto_out_a_bits_size;
  wire [10:0] _fragmenter_1_auto_out_a_bits_source;
  wire [20:0] _fragmenter_1_auto_out_a_bits_address;
  wire [7:0]  _fragmenter_1_auto_out_a_bits_mask;
  wire [63:0] _fragmenter_1_auto_out_a_bits_data;
  wire        _fragmenter_1_auto_out_a_bits_corrupt;
  wire        _fragmenter_1_auto_out_d_ready;
  wire        _reset_setter_auto_clock_out_member_allClocks_uncore_clock;
  wire        _reset_setter_auto_clock_out_member_allClocks_uncore_reset;
  wire        _reset_setter_auto_tl_in_a_ready;
  wire        _reset_setter_auto_tl_in_d_valid;
  wire [2:0]  _reset_setter_auto_tl_in_d_bits_opcode;
  wire [1:0]  _reset_setter_auto_tl_in_d_bits_size;
  wire [10:0] _reset_setter_auto_tl_in_d_bits_source;
  wire [63:0] _reset_setter_auto_tl_in_d_bits_data;
  wire        _fragmenter_auto_in_a_ready;
  wire        _fragmenter_auto_in_d_valid;
  wire [2:0]  _fragmenter_auto_in_d_bits_opcode;
  wire [2:0]  _fragmenter_auto_in_d_bits_size;
  wire [6:0]  _fragmenter_auto_in_d_bits_source;
  wire [63:0] _fragmenter_auto_in_d_bits_data;
  wire        _fragmenter_auto_out_a_valid;
  wire [2:0]  _fragmenter_auto_out_a_bits_opcode;
  wire [2:0]  _fragmenter_auto_out_a_bits_param;
  wire [1:0]  _fragmenter_auto_out_a_bits_size;
  wire [10:0] _fragmenter_auto_out_a_bits_source;
  wire [20:0] _fragmenter_auto_out_a_bits_address;
  wire [7:0]  _fragmenter_auto_out_a_bits_mask;
  wire [63:0] _fragmenter_auto_out_a_bits_data;
  wire        _fragmenter_auto_out_a_bits_corrupt;
  wire        _fragmenter_auto_out_d_ready;
  wire        _clock_gater_auto_clock_gater_in_1_a_ready;
  wire        _clock_gater_auto_clock_gater_in_1_d_valid;
  wire [2:0]  _clock_gater_auto_clock_gater_in_1_d_bits_opcode;
  wire [1:0]  _clock_gater_auto_clock_gater_in_1_d_bits_size;
  wire [10:0] _clock_gater_auto_clock_gater_in_1_d_bits_source;
  wire [63:0] _clock_gater_auto_clock_gater_in_1_d_bits_data;
  wire        _clock_gater_auto_clock_gater_out_member_allClocks_uncore_clock;
  wire        _clock_gater_auto_clock_gater_out_member_allClocks_uncore_reset;
  wire        _xbar_auto_out_4_a_valid;
  wire [2:0]  _xbar_auto_out_4_a_bits_opcode;
  wire [2:0]  _xbar_auto_out_4_a_bits_param;
  wire [2:0]  _xbar_auto_out_4_a_bits_size;
  wire [6:0]  _xbar_auto_out_4_a_bits_source;
  wire [20:0] _xbar_auto_out_4_a_bits_address;
  wire [7:0]  _xbar_auto_out_4_a_bits_mask;
  wire [63:0] _xbar_auto_out_4_a_bits_data;
  wire        _xbar_auto_out_4_a_bits_corrupt;
  wire        _xbar_auto_out_4_d_ready;
  wire        _xbar_auto_out_3_a_valid;
  wire [2:0]  _xbar_auto_out_3_a_bits_opcode;
  wire [2:0]  _xbar_auto_out_3_a_bits_param;
  wire [2:0]  _xbar_auto_out_3_a_bits_size;
  wire [6:0]  _xbar_auto_out_3_a_bits_source;
  wire [20:0] _xbar_auto_out_3_a_bits_address;
  wire [7:0]  _xbar_auto_out_3_a_bits_mask;
  wire [63:0] _xbar_auto_out_3_a_bits_data;
  wire        _xbar_auto_out_3_a_bits_corrupt;
  wire        _xbar_auto_out_3_d_ready;
  wire        _xbar_auto_out_2_a_valid;
  wire [2:0]  _xbar_auto_out_2_a_bits_opcode;
  wire [2:0]  _xbar_auto_out_2_a_bits_param;
  wire [2:0]  _xbar_auto_out_2_a_bits_size;
  wire [6:0]  _xbar_auto_out_2_a_bits_source;
  wire [20:0] _xbar_auto_out_2_a_bits_address;
  wire [7:0]  _xbar_auto_out_2_a_bits_mask;
  wire [63:0] _xbar_auto_out_2_a_bits_data;
  wire        _xbar_auto_out_2_a_bits_corrupt;
  wire        _xbar_auto_out_2_d_ready;
  wire        _xbar_auto_out_1_a_valid;
  wire [2:0]  _xbar_auto_out_1_a_bits_opcode;
  wire [2:0]  _xbar_auto_out_1_a_bits_param;
  wire [2:0]  _xbar_auto_out_1_a_bits_size;
  wire [6:0]  _xbar_auto_out_1_a_bits_source;
  wire [20:0] _xbar_auto_out_1_a_bits_address;
  wire [7:0]  _xbar_auto_out_1_a_bits_mask;
  wire [63:0] _xbar_auto_out_1_a_bits_data;
  wire        _xbar_auto_out_1_a_bits_corrupt;
  wire        _xbar_auto_out_1_d_ready;
  wire        _xbar_auto_out_0_a_valid;
  wire [2:0]  _xbar_auto_out_0_a_bits_opcode;
  wire [2:0]  _xbar_auto_out_0_a_bits_param;
  wire [2:0]  _xbar_auto_out_0_a_bits_size;
  wire [6:0]  _xbar_auto_out_0_a_bits_source;
  wire [20:0] _xbar_auto_out_0_a_bits_address;
  wire [7:0]  _xbar_auto_out_0_a_bits_mask;
  wire [63:0] _xbar_auto_out_0_a_bits_data;
  wire        _xbar_auto_out_0_a_bits_corrupt;
  wire        _xbar_auto_out_0_d_ready;
  TLXbar_12 xbar (
    .clock                     (auto_clock_in_clock),
    .reset                     (auto_clock_in_reset),
    .auto_in_a_ready           (auto_xbar_in_a_ready),
    .auto_in_a_valid           (auto_xbar_in_a_valid),
    .auto_in_a_bits_opcode     (auto_xbar_in_a_bits_opcode),
    .auto_in_a_bits_param      (auto_xbar_in_a_bits_param),
    .auto_in_a_bits_size       (auto_xbar_in_a_bits_size),
    .auto_in_a_bits_source     (auto_xbar_in_a_bits_source),
    .auto_in_a_bits_address    (auto_xbar_in_a_bits_address),
    .auto_in_a_bits_mask       (auto_xbar_in_a_bits_mask),
    .auto_in_a_bits_data       (auto_xbar_in_a_bits_data),
    .auto_in_a_bits_corrupt    (auto_xbar_in_a_bits_corrupt),
    .auto_in_d_ready           (auto_xbar_in_d_ready),
    .auto_in_d_valid           (auto_xbar_in_d_valid),
    .auto_in_d_bits_opcode     (auto_xbar_in_d_bits_opcode),
    .auto_in_d_bits_size       (auto_xbar_in_d_bits_size),
    .auto_in_d_bits_source     (auto_xbar_in_d_bits_source),
    .auto_in_d_bits_data       (auto_xbar_in_d_bits_data),
    .auto_out_4_a_ready        (_fragmenter_4_auto_in_a_ready),
    .auto_out_4_a_valid        (_xbar_auto_out_4_a_valid),
    .auto_out_4_a_bits_opcode  (_xbar_auto_out_4_a_bits_opcode),
    .auto_out_4_a_bits_param   (_xbar_auto_out_4_a_bits_param),
    .auto_out_4_a_bits_size    (_xbar_auto_out_4_a_bits_size),
    .auto_out_4_a_bits_source  (_xbar_auto_out_4_a_bits_source),
    .auto_out_4_a_bits_address (_xbar_auto_out_4_a_bits_address),
    .auto_out_4_a_bits_mask    (_xbar_auto_out_4_a_bits_mask),
    .auto_out_4_a_bits_data    (_xbar_auto_out_4_a_bits_data),
    .auto_out_4_a_bits_corrupt (_xbar_auto_out_4_a_bits_corrupt),
    .auto_out_4_d_ready        (_xbar_auto_out_4_d_ready),
    .auto_out_4_d_valid        (_fragmenter_4_auto_in_d_valid),
    .auto_out_4_d_bits_opcode  (_fragmenter_4_auto_in_d_bits_opcode),
    .auto_out_4_d_bits_size    (_fragmenter_4_auto_in_d_bits_size),
    .auto_out_4_d_bits_source  (_fragmenter_4_auto_in_d_bits_source),
    .auto_out_4_d_bits_data    (_fragmenter_4_auto_in_d_bits_data),
    .auto_out_3_a_ready        (_fragmenter_3_auto_in_a_ready),
    .auto_out_3_a_valid        (_xbar_auto_out_3_a_valid),
    .auto_out_3_a_bits_opcode  (_xbar_auto_out_3_a_bits_opcode),
    .auto_out_3_a_bits_param   (_xbar_auto_out_3_a_bits_param),
    .auto_out_3_a_bits_size    (_xbar_auto_out_3_a_bits_size),
    .auto_out_3_a_bits_source  (_xbar_auto_out_3_a_bits_source),
    .auto_out_3_a_bits_address (_xbar_auto_out_3_a_bits_address),
    .auto_out_3_a_bits_mask    (_xbar_auto_out_3_a_bits_mask),
    .auto_out_3_a_bits_data    (_xbar_auto_out_3_a_bits_data),
    .auto_out_3_a_bits_corrupt (_xbar_auto_out_3_a_bits_corrupt),
    .auto_out_3_d_ready        (_xbar_auto_out_3_d_ready),
    .auto_out_3_d_valid        (_fragmenter_3_auto_in_d_valid),
    .auto_out_3_d_bits_opcode  (_fragmenter_3_auto_in_d_bits_opcode),
    .auto_out_3_d_bits_size    (_fragmenter_3_auto_in_d_bits_size),
    .auto_out_3_d_bits_source  (_fragmenter_3_auto_in_d_bits_source),
    .auto_out_3_d_bits_data    (_fragmenter_3_auto_in_d_bits_data),
    .auto_out_2_a_ready        (_fragmenter_2_auto_in_a_ready),
    .auto_out_2_a_valid        (_xbar_auto_out_2_a_valid),
    .auto_out_2_a_bits_opcode  (_xbar_auto_out_2_a_bits_opcode),
    .auto_out_2_a_bits_param   (_xbar_auto_out_2_a_bits_param),
    .auto_out_2_a_bits_size    (_xbar_auto_out_2_a_bits_size),
    .auto_out_2_a_bits_source  (_xbar_auto_out_2_a_bits_source),
    .auto_out_2_a_bits_address (_xbar_auto_out_2_a_bits_address),
    .auto_out_2_a_bits_mask    (_xbar_auto_out_2_a_bits_mask),
    .auto_out_2_a_bits_data    (_xbar_auto_out_2_a_bits_data),
    .auto_out_2_a_bits_corrupt (_xbar_auto_out_2_a_bits_corrupt),
    .auto_out_2_d_ready        (_xbar_auto_out_2_d_ready),
    .auto_out_2_d_valid        (_fragmenter_2_auto_in_d_valid),
    .auto_out_2_d_bits_opcode  (_fragmenter_2_auto_in_d_bits_opcode),
    .auto_out_2_d_bits_size    (_fragmenter_2_auto_in_d_bits_size),
    .auto_out_2_d_bits_source  (_fragmenter_2_auto_in_d_bits_source),
    .auto_out_2_d_bits_data    (_fragmenter_2_auto_in_d_bits_data),
    .auto_out_1_a_ready        (_fragmenter_1_auto_in_a_ready),
    .auto_out_1_a_valid        (_xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode  (_xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param   (_xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size    (_xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source  (_xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address (_xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask    (_xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data    (_xbar_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt (_xbar_auto_out_1_a_bits_corrupt),
    .auto_out_1_d_ready        (_xbar_auto_out_1_d_ready),
    .auto_out_1_d_valid        (_fragmenter_1_auto_in_d_valid),
    .auto_out_1_d_bits_opcode  (_fragmenter_1_auto_in_d_bits_opcode),
    .auto_out_1_d_bits_size    (_fragmenter_1_auto_in_d_bits_size),
    .auto_out_1_d_bits_source  (_fragmenter_1_auto_in_d_bits_source),
    .auto_out_1_d_bits_data    (_fragmenter_1_auto_in_d_bits_data),
    .auto_out_0_a_ready        (_fragmenter_auto_in_a_ready),
    .auto_out_0_a_valid        (_xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode  (_xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param   (_xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size    (_xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source  (_xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address (_xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask    (_xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data    (_xbar_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt (_xbar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready        (_xbar_auto_out_0_d_ready),
    .auto_out_0_d_valid        (_fragmenter_auto_in_d_valid),
    .auto_out_0_d_bits_opcode  (_fragmenter_auto_in_d_bits_opcode),
    .auto_out_0_d_bits_size    (_fragmenter_auto_in_d_bits_size),
    .auto_out_0_d_bits_source  (_fragmenter_auto_in_d_bits_source),
    .auto_out_0_d_bits_data    (_fragmenter_auto_in_d_bits_data)
  );
  ClockGroupResetSynchronizer resetSynchronizer (
    .auto_in_member_allClocks_uncore_clock  (_clock_gater_auto_clock_gater_out_member_allClocks_uncore_clock),
    .auto_in_member_allClocks_uncore_reset  (_clock_gater_auto_clock_gater_out_member_allClocks_uncore_reset),
    .auto_out_member_allClocks_uncore_clock (auto_resetSynchronizer_out_member_allClocks_uncore_clock),
    .auto_out_member_allClocks_uncore_reset (auto_resetSynchronizer_out_member_allClocks_uncore_reset)
  );
  TileClockGater clock_gater (
    .clock                                               (auto_clock_in_clock),
    .reset                                               (auto_clock_in_reset),
    .auto_clock_gater_in_1_a_ready                       (_clock_gater_auto_clock_gater_in_1_a_ready),
    .auto_clock_gater_in_1_a_valid                       (_fragmenter_auto_out_a_valid),
    .auto_clock_gater_in_1_a_bits_opcode                 (_fragmenter_auto_out_a_bits_opcode),
    .auto_clock_gater_in_1_a_bits_param                  (_fragmenter_auto_out_a_bits_param),
    .auto_clock_gater_in_1_a_bits_size                   (_fragmenter_auto_out_a_bits_size),
    .auto_clock_gater_in_1_a_bits_source                 (_fragmenter_auto_out_a_bits_source),
    .auto_clock_gater_in_1_a_bits_address                (_fragmenter_auto_out_a_bits_address),
    .auto_clock_gater_in_1_a_bits_mask                   (_fragmenter_auto_out_a_bits_mask),
    .auto_clock_gater_in_1_a_bits_data                   (_fragmenter_auto_out_a_bits_data),
    .auto_clock_gater_in_1_a_bits_corrupt                (_fragmenter_auto_out_a_bits_corrupt),
    .auto_clock_gater_in_1_d_ready                       (_fragmenter_auto_out_d_ready),
    .auto_clock_gater_in_1_d_valid                       (_clock_gater_auto_clock_gater_in_1_d_valid),
    .auto_clock_gater_in_1_d_bits_opcode                 (_clock_gater_auto_clock_gater_in_1_d_bits_opcode),
    .auto_clock_gater_in_1_d_bits_size                   (_clock_gater_auto_clock_gater_in_1_d_bits_size),
    .auto_clock_gater_in_1_d_bits_source                 (_clock_gater_auto_clock_gater_in_1_d_bits_source),
    .auto_clock_gater_in_1_d_bits_data                   (_clock_gater_auto_clock_gater_in_1_d_bits_data),
    .auto_clock_gater_in_0_member_allClocks_uncore_clock (_reset_setter_auto_clock_out_member_allClocks_uncore_clock),
    .auto_clock_gater_in_0_member_allClocks_uncore_reset (_reset_setter_auto_clock_out_member_allClocks_uncore_reset),
    .auto_clock_gater_out_member_allClocks_uncore_clock  (_clock_gater_auto_clock_gater_out_member_allClocks_uncore_clock),
    .auto_clock_gater_out_member_allClocks_uncore_reset  (_clock_gater_auto_clock_gater_out_member_allClocks_uncore_reset)
  );
  TLFragmenter_8 fragmenter (
    .clock                   (auto_clock_in_clock),
    .reset                   (auto_clock_in_reset),
    .auto_in_a_ready         (_fragmenter_auto_in_a_ready),
    .auto_in_a_valid         (_xbar_auto_out_0_a_valid),
    .auto_in_a_bits_opcode   (_xbar_auto_out_0_a_bits_opcode),
    .auto_in_a_bits_param    (_xbar_auto_out_0_a_bits_param),
    .auto_in_a_bits_size     (_xbar_auto_out_0_a_bits_size),
    .auto_in_a_bits_source   (_xbar_auto_out_0_a_bits_source),
    .auto_in_a_bits_address  (_xbar_auto_out_0_a_bits_address),
    .auto_in_a_bits_mask     (_xbar_auto_out_0_a_bits_mask),
    .auto_in_a_bits_data     (_xbar_auto_out_0_a_bits_data),
    .auto_in_a_bits_corrupt  (_xbar_auto_out_0_a_bits_corrupt),
    .auto_in_d_ready         (_xbar_auto_out_0_d_ready),
    .auto_in_d_valid         (_fragmenter_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_fragmenter_auto_in_d_bits_opcode),
    .auto_in_d_bits_size     (_fragmenter_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_fragmenter_auto_in_d_bits_source),
    .auto_in_d_bits_data     (_fragmenter_auto_in_d_bits_data),
    .auto_out_a_ready        (_clock_gater_auto_clock_gater_in_1_a_ready),
    .auto_out_a_valid        (_fragmenter_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_fragmenter_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_fragmenter_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_fragmenter_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_fragmenter_auto_out_a_bits_source),
    .auto_out_a_bits_address (_fragmenter_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_fragmenter_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_fragmenter_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_fragmenter_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_fragmenter_auto_out_d_ready),
    .auto_out_d_valid        (_clock_gater_auto_clock_gater_in_1_d_valid),
    .auto_out_d_bits_opcode  (_clock_gater_auto_clock_gater_in_1_d_bits_opcode),
    .auto_out_d_bits_size    (_clock_gater_auto_clock_gater_in_1_d_bits_size),
    .auto_out_d_bits_source  (_clock_gater_auto_clock_gater_in_1_d_bits_source),
    .auto_out_d_bits_data    (_clock_gater_auto_clock_gater_in_1_d_bits_data)
  );
  TileResetSetter reset_setter (
    .clock                                        (auto_clock_in_clock),
    .reset                                        (auto_clock_in_reset),
    .auto_clock_in_member_allClocks_uncore_clock  (_clockDivider_auto_clock_out_member_allClocks_uncore_clock),
    .auto_clock_in_member_allClocks_uncore_reset  (_clockDivider_auto_clock_out_member_allClocks_uncore_reset),
    .auto_clock_out_member_allClocks_uncore_clock (_reset_setter_auto_clock_out_member_allClocks_uncore_clock),
    .auto_clock_out_member_allClocks_uncore_reset (_reset_setter_auto_clock_out_member_allClocks_uncore_reset),
    .auto_tl_in_a_ready                           (_reset_setter_auto_tl_in_a_ready),
    .auto_tl_in_a_valid                           (_fragmenter_1_auto_out_a_valid),
    .auto_tl_in_a_bits_opcode                     (_fragmenter_1_auto_out_a_bits_opcode),
    .auto_tl_in_a_bits_param                      (_fragmenter_1_auto_out_a_bits_param),
    .auto_tl_in_a_bits_size                       (_fragmenter_1_auto_out_a_bits_size),
    .auto_tl_in_a_bits_source                     (_fragmenter_1_auto_out_a_bits_source),
    .auto_tl_in_a_bits_address                    (_fragmenter_1_auto_out_a_bits_address),
    .auto_tl_in_a_bits_mask                       (_fragmenter_1_auto_out_a_bits_mask),
    .auto_tl_in_a_bits_data                       (_fragmenter_1_auto_out_a_bits_data),
    .auto_tl_in_a_bits_corrupt                    (_fragmenter_1_auto_out_a_bits_corrupt),
    .auto_tl_in_d_ready                           (_fragmenter_1_auto_out_d_ready),
    .auto_tl_in_d_valid                           (_reset_setter_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode                     (_reset_setter_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size                       (_reset_setter_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source                     (_reset_setter_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data                       (_reset_setter_auto_tl_in_d_bits_data)
  );
  TLFragmenter_9 fragmenter_1 (
    .clock                   (auto_clock_in_clock),
    .reset                   (auto_clock_in_reset),
    .auto_in_a_ready         (_fragmenter_1_auto_in_a_ready),
    .auto_in_a_valid         (_xbar_auto_out_1_a_valid),
    .auto_in_a_bits_opcode   (_xbar_auto_out_1_a_bits_opcode),
    .auto_in_a_bits_param    (_xbar_auto_out_1_a_bits_param),
    .auto_in_a_bits_size     (_xbar_auto_out_1_a_bits_size),
    .auto_in_a_bits_source   (_xbar_auto_out_1_a_bits_source),
    .auto_in_a_bits_address  (_xbar_auto_out_1_a_bits_address),
    .auto_in_a_bits_mask     (_xbar_auto_out_1_a_bits_mask),
    .auto_in_a_bits_data     (_xbar_auto_out_1_a_bits_data),
    .auto_in_a_bits_corrupt  (_xbar_auto_out_1_a_bits_corrupt),
    .auto_in_d_ready         (_xbar_auto_out_1_d_ready),
    .auto_in_d_valid         (_fragmenter_1_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_fragmenter_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_size     (_fragmenter_1_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_fragmenter_1_auto_in_d_bits_source),
    .auto_in_d_bits_data     (_fragmenter_1_auto_in_d_bits_data),
    .auto_out_a_ready        (_reset_setter_auto_tl_in_a_ready),
    .auto_out_a_valid        (_fragmenter_1_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_fragmenter_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_fragmenter_1_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_fragmenter_1_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_fragmenter_1_auto_out_a_bits_source),
    .auto_out_a_bits_address (_fragmenter_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_fragmenter_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_fragmenter_1_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_fragmenter_1_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_fragmenter_1_auto_out_d_ready),
    .auto_out_d_valid        (_reset_setter_auto_tl_in_d_valid),
    .auto_out_d_bits_opcode  (_reset_setter_auto_tl_in_d_bits_opcode),
    .auto_out_d_bits_size    (_reset_setter_auto_tl_in_d_bits_size),
    .auto_out_d_bits_source  (_reset_setter_auto_tl_in_d_bits_source),
    .auto_out_d_bits_data    (_reset_setter_auto_tl_in_d_bits_data)
  );
  TLClockDivider clockDivider (
    .clock                                        (auto_clock_in_clock),
    .reset                                        (auto_clock_in_reset),
    .auto_tl_in_a_ready                           (_clockDivider_auto_tl_in_a_ready),
    .auto_tl_in_a_valid                           (_fragmenter_2_auto_out_a_valid),
    .auto_tl_in_a_bits_opcode                     (_fragmenter_2_auto_out_a_bits_opcode),
    .auto_tl_in_a_bits_param                      (_fragmenter_2_auto_out_a_bits_param),
    .auto_tl_in_a_bits_size                       (_fragmenter_2_auto_out_a_bits_size),
    .auto_tl_in_a_bits_source                     (_fragmenter_2_auto_out_a_bits_source),
    .auto_tl_in_a_bits_address                    (_fragmenter_2_auto_out_a_bits_address),
    .auto_tl_in_a_bits_mask                       (_fragmenter_2_auto_out_a_bits_mask),
    .auto_tl_in_a_bits_data                       (_fragmenter_2_auto_out_a_bits_data),
    .auto_tl_in_a_bits_corrupt                    (_fragmenter_2_auto_out_a_bits_corrupt),
    .auto_tl_in_d_ready                           (_fragmenter_2_auto_out_d_ready),
    .auto_tl_in_d_valid                           (_clockDivider_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode                     (_clockDivider_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size                       (_clockDivider_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source                     (_clockDivider_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data                       (_clockDivider_auto_tl_in_d_bits_data),
    .auto_clock_in_member_allClocks_uncore_clock  (_clockSelector_auto_clock_out_member_allClocks_uncore_clock),
    .auto_clock_in_member_allClocks_uncore_reset  (_clockSelector_auto_clock_out_member_allClocks_uncore_reset),
    .auto_clock_out_member_allClocks_uncore_clock (_clockDivider_auto_clock_out_member_allClocks_uncore_clock),
    .auto_clock_out_member_allClocks_uncore_reset (_clockDivider_auto_clock_out_member_allClocks_uncore_reset)
  );
  TLClockSelector clockSelector (
    .clock                                        (auto_clock_in_clock),
    .reset                                        (auto_clock_in_reset),
    .auto_clock_in_1_clock                        (auto_clockSelector_clock_in_1_clock),
    .auto_clock_in_0_clock                        (auto_clockSelector_clock_in_0_clock),
    .auto_clock_in_0_reset                        (auto_clockSelector_clock_in_0_reset),
    .auto_clock_out_member_allClocks_uncore_clock (_clockSelector_auto_clock_out_member_allClocks_uncore_clock),
    .auto_clock_out_member_allClocks_uncore_reset (_clockSelector_auto_clock_out_member_allClocks_uncore_reset),
    .auto_tl_in_a_ready                           (_clockSelector_auto_tl_in_a_ready),
    .auto_tl_in_a_valid                           (_fragmenter_3_auto_out_a_valid),
    .auto_tl_in_a_bits_opcode                     (_fragmenter_3_auto_out_a_bits_opcode),
    .auto_tl_in_a_bits_param                      (_fragmenter_3_auto_out_a_bits_param),
    .auto_tl_in_a_bits_size                       (_fragmenter_3_auto_out_a_bits_size),
    .auto_tl_in_a_bits_source                     (_fragmenter_3_auto_out_a_bits_source),
    .auto_tl_in_a_bits_address                    (_fragmenter_3_auto_out_a_bits_address),
    .auto_tl_in_a_bits_mask                       (_fragmenter_3_auto_out_a_bits_mask),
    .auto_tl_in_a_bits_data                       (_fragmenter_3_auto_out_a_bits_data),
    .auto_tl_in_a_bits_corrupt                    (_fragmenter_3_auto_out_a_bits_corrupt),
    .auto_tl_in_d_ready                           (_fragmenter_3_auto_out_d_ready),
    .auto_tl_in_d_valid                           (_clockSelector_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode                     (_clockSelector_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size                       (_clockSelector_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source                     (_clockSelector_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data                       (_clockSelector_auto_tl_in_d_bits_data)
  );
  FakePLLCtrl pllCtrl (
    .clock                     (auto_clock_in_clock),
    .reset                     (auto_clock_in_reset),
    .auto_ctrl_out_gate        (auto_pllCtrl_ctrl_out_gate),
    .auto_ctrl_out_power       (auto_pllCtrl_ctrl_out_power),
    .auto_tl_in_a_ready        (_pllCtrl_auto_tl_in_a_ready),
    .auto_tl_in_a_valid        (_fragmenter_4_auto_out_a_valid),
    .auto_tl_in_a_bits_opcode  (_fragmenter_4_auto_out_a_bits_opcode),
    .auto_tl_in_a_bits_param   (_fragmenter_4_auto_out_a_bits_param),
    .auto_tl_in_a_bits_size    (_fragmenter_4_auto_out_a_bits_size),
    .auto_tl_in_a_bits_source  (_fragmenter_4_auto_out_a_bits_source),
    .auto_tl_in_a_bits_address (_fragmenter_4_auto_out_a_bits_address),
    .auto_tl_in_a_bits_mask    (_fragmenter_4_auto_out_a_bits_mask),
    .auto_tl_in_a_bits_data    (_fragmenter_4_auto_out_a_bits_data),
    .auto_tl_in_a_bits_corrupt (_fragmenter_4_auto_out_a_bits_corrupt),
    .auto_tl_in_d_ready        (_fragmenter_4_auto_out_d_ready),
    .auto_tl_in_d_valid        (_pllCtrl_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode  (_pllCtrl_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size    (_pllCtrl_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source  (_pllCtrl_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data    (_pllCtrl_auto_tl_in_d_bits_data)
  );
  TLFragmenter_10 fragmenter_2 (
    .clock                   (auto_clock_in_clock),
    .reset                   (auto_clock_in_reset),
    .auto_in_a_ready         (_fragmenter_2_auto_in_a_ready),
    .auto_in_a_valid         (_xbar_auto_out_2_a_valid),
    .auto_in_a_bits_opcode   (_xbar_auto_out_2_a_bits_opcode),
    .auto_in_a_bits_param    (_xbar_auto_out_2_a_bits_param),
    .auto_in_a_bits_size     (_xbar_auto_out_2_a_bits_size),
    .auto_in_a_bits_source   (_xbar_auto_out_2_a_bits_source),
    .auto_in_a_bits_address  (_xbar_auto_out_2_a_bits_address),
    .auto_in_a_bits_mask     (_xbar_auto_out_2_a_bits_mask),
    .auto_in_a_bits_data     (_xbar_auto_out_2_a_bits_data),
    .auto_in_a_bits_corrupt  (_xbar_auto_out_2_a_bits_corrupt),
    .auto_in_d_ready         (_xbar_auto_out_2_d_ready),
    .auto_in_d_valid         (_fragmenter_2_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_fragmenter_2_auto_in_d_bits_opcode),
    .auto_in_d_bits_size     (_fragmenter_2_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_fragmenter_2_auto_in_d_bits_source),
    .auto_in_d_bits_data     (_fragmenter_2_auto_in_d_bits_data),
    .auto_out_a_ready        (_clockDivider_auto_tl_in_a_ready),
    .auto_out_a_valid        (_fragmenter_2_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_fragmenter_2_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_fragmenter_2_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_fragmenter_2_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_fragmenter_2_auto_out_a_bits_source),
    .auto_out_a_bits_address (_fragmenter_2_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_fragmenter_2_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_fragmenter_2_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_fragmenter_2_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_fragmenter_2_auto_out_d_ready),
    .auto_out_d_valid        (_clockDivider_auto_tl_in_d_valid),
    .auto_out_d_bits_opcode  (_clockDivider_auto_tl_in_d_bits_opcode),
    .auto_out_d_bits_size    (_clockDivider_auto_tl_in_d_bits_size),
    .auto_out_d_bits_source  (_clockDivider_auto_tl_in_d_bits_source),
    .auto_out_d_bits_data    (_clockDivider_auto_tl_in_d_bits_data)
  );
  TLFragmenter_11 fragmenter_3 (
    .clock                   (auto_clock_in_clock),
    .reset                   (auto_clock_in_reset),
    .auto_in_a_ready         (_fragmenter_3_auto_in_a_ready),
    .auto_in_a_valid         (_xbar_auto_out_3_a_valid),
    .auto_in_a_bits_opcode   (_xbar_auto_out_3_a_bits_opcode),
    .auto_in_a_bits_param    (_xbar_auto_out_3_a_bits_param),
    .auto_in_a_bits_size     (_xbar_auto_out_3_a_bits_size),
    .auto_in_a_bits_source   (_xbar_auto_out_3_a_bits_source),
    .auto_in_a_bits_address  (_xbar_auto_out_3_a_bits_address),
    .auto_in_a_bits_mask     (_xbar_auto_out_3_a_bits_mask),
    .auto_in_a_bits_data     (_xbar_auto_out_3_a_bits_data),
    .auto_in_a_bits_corrupt  (_xbar_auto_out_3_a_bits_corrupt),
    .auto_in_d_ready         (_xbar_auto_out_3_d_ready),
    .auto_in_d_valid         (_fragmenter_3_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_fragmenter_3_auto_in_d_bits_opcode),
    .auto_in_d_bits_size     (_fragmenter_3_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_fragmenter_3_auto_in_d_bits_source),
    .auto_in_d_bits_data     (_fragmenter_3_auto_in_d_bits_data),
    .auto_out_a_ready        (_clockSelector_auto_tl_in_a_ready),
    .auto_out_a_valid        (_fragmenter_3_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_fragmenter_3_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_fragmenter_3_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_fragmenter_3_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_fragmenter_3_auto_out_a_bits_source),
    .auto_out_a_bits_address (_fragmenter_3_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_fragmenter_3_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_fragmenter_3_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_fragmenter_3_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_fragmenter_3_auto_out_d_ready),
    .auto_out_d_valid        (_clockSelector_auto_tl_in_d_valid),
    .auto_out_d_bits_opcode  (_clockSelector_auto_tl_in_d_bits_opcode),
    .auto_out_d_bits_size    (_clockSelector_auto_tl_in_d_bits_size),
    .auto_out_d_bits_source  (_clockSelector_auto_tl_in_d_bits_source),
    .auto_out_d_bits_data    (_clockSelector_auto_tl_in_d_bits_data)
  );
  TLFragmenter_12 fragmenter_4 (
    .clock                   (auto_clock_in_clock),
    .reset                   (auto_clock_in_reset),
    .auto_in_a_ready         (_fragmenter_4_auto_in_a_ready),
    .auto_in_a_valid         (_xbar_auto_out_4_a_valid),
    .auto_in_a_bits_opcode   (_xbar_auto_out_4_a_bits_opcode),
    .auto_in_a_bits_param    (_xbar_auto_out_4_a_bits_param),
    .auto_in_a_bits_size     (_xbar_auto_out_4_a_bits_size),
    .auto_in_a_bits_source   (_xbar_auto_out_4_a_bits_source),
    .auto_in_a_bits_address  (_xbar_auto_out_4_a_bits_address),
    .auto_in_a_bits_mask     (_xbar_auto_out_4_a_bits_mask),
    .auto_in_a_bits_data     (_xbar_auto_out_4_a_bits_data),
    .auto_in_a_bits_corrupt  (_xbar_auto_out_4_a_bits_corrupt),
    .auto_in_d_ready         (_xbar_auto_out_4_d_ready),
    .auto_in_d_valid         (_fragmenter_4_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_fragmenter_4_auto_in_d_bits_opcode),
    .auto_in_d_bits_size     (_fragmenter_4_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_fragmenter_4_auto_in_d_bits_source),
    .auto_in_d_bits_data     (_fragmenter_4_auto_in_d_bits_data),
    .auto_out_a_ready        (_pllCtrl_auto_tl_in_a_ready),
    .auto_out_a_valid        (_fragmenter_4_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_fragmenter_4_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_fragmenter_4_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_fragmenter_4_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_fragmenter_4_auto_out_a_bits_source),
    .auto_out_a_bits_address (_fragmenter_4_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_fragmenter_4_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_fragmenter_4_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_fragmenter_4_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_fragmenter_4_auto_out_d_ready),
    .auto_out_d_valid        (_pllCtrl_auto_tl_in_d_valid),
    .auto_out_d_bits_opcode  (_pllCtrl_auto_tl_in_d_bits_opcode),
    .auto_out_d_bits_size    (_pllCtrl_auto_tl_in_d_bits_size),
    .auto_out_d_bits_source  (_pllCtrl_auto_tl_in_d_bits_source),
    .auto_out_d_bits_data    (_pllCtrl_auto_tl_in_d_bits_data)
  );
endmodule

