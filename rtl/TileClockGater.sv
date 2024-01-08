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

module TileClockGater(
  input         clock,
                reset,
  output        auto_clock_gater_in_1_a_ready,
  input         auto_clock_gater_in_1_a_valid,
  input  [2:0]  auto_clock_gater_in_1_a_bits_opcode,
                auto_clock_gater_in_1_a_bits_param,
  input  [1:0]  auto_clock_gater_in_1_a_bits_size,
  input  [10:0] auto_clock_gater_in_1_a_bits_source,
  input  [20:0] auto_clock_gater_in_1_a_bits_address,
  input  [7:0]  auto_clock_gater_in_1_a_bits_mask,
  input  [63:0] auto_clock_gater_in_1_a_bits_data,
  input         auto_clock_gater_in_1_a_bits_corrupt,
                auto_clock_gater_in_1_d_ready,
  output        auto_clock_gater_in_1_d_valid,
  output [2:0]  auto_clock_gater_in_1_d_bits_opcode,
  output [1:0]  auto_clock_gater_in_1_d_bits_size,
  output [10:0] auto_clock_gater_in_1_d_bits_source,
  output [63:0] auto_clock_gater_in_1_d_bits_data,
  input         auto_clock_gater_in_0_member_allClocks_uncore_clock,
                auto_clock_gater_in_0_member_allClocks_uncore_reset,
  output        auto_clock_gater_out_member_allClocks_uncore_clock,
                auto_clock_gater_out_member_allClocks_uncore_reset
);

  wire       _out_wofireMux_T_1;
  wire       _regs_0_io_q;
  wire       out_front_bits_read = auto_clock_gater_in_1_a_bits_opcode == 3'h4;
  wire       _out_out_bits_data_T_1 = auto_clock_gater_in_1_a_bits_address[11:3] == 9'h0;
  assign _out_wofireMux_T_1 = ~out_front_bits_read;
  wire [2:0] clock_gaterIn_1_d_bits_opcode = {2'h0, out_front_bits_read};
  TLMonitor_60 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (auto_clock_gater_in_1_d_ready),
    .io_in_a_valid        (auto_clock_gater_in_1_a_valid),
    .io_in_a_bits_opcode  (auto_clock_gater_in_1_a_bits_opcode),
    .io_in_a_bits_param   (auto_clock_gater_in_1_a_bits_param),
    .io_in_a_bits_size    (auto_clock_gater_in_1_a_bits_size),
    .io_in_a_bits_source  (auto_clock_gater_in_1_a_bits_source),
    .io_in_a_bits_address (auto_clock_gater_in_1_a_bits_address),
    .io_in_a_bits_mask    (auto_clock_gater_in_1_a_bits_mask),
    .io_in_a_bits_corrupt (auto_clock_gater_in_1_a_bits_corrupt),
    .io_in_d_ready        (auto_clock_gater_in_1_d_ready),
    .io_in_d_valid        (auto_clock_gater_in_1_a_valid),
    .io_in_d_bits_opcode  (clock_gaterIn_1_d_bits_opcode),
    .io_in_d_bits_size    (auto_clock_gater_in_1_a_bits_size),
    .io_in_d_bits_source  (auto_clock_gater_in_1_a_bits_source)
  );
  AsyncResetRegVec_w1_i1 regs_0 (
    .clock (clock),
    .reset (auto_clock_gater_in_0_member_allClocks_uncore_reset),
    .io_d  (auto_clock_gater_in_1_a_bits_data[0]),
    .io_q  (_regs_0_io_q),
    .io_en (auto_clock_gater_in_1_a_valid & auto_clock_gater_in_1_d_ready & _out_wofireMux_T_1 & _out_out_bits_data_T_1 & auto_clock_gater_in_1_a_bits_mask[0])
  );
  assign auto_clock_gater_in_1_a_ready = auto_clock_gater_in_1_d_ready;
  assign auto_clock_gater_in_1_d_valid = auto_clock_gater_in_1_a_valid;
  assign auto_clock_gater_in_1_d_bits_opcode = clock_gaterIn_1_d_bits_opcode;
  assign auto_clock_gater_in_1_d_bits_size = auto_clock_gater_in_1_a_bits_size;
  assign auto_clock_gater_in_1_d_bits_source = auto_clock_gater_in_1_a_bits_source;
  assign auto_clock_gater_in_1_d_bits_data = {63'h0, _out_out_bits_data_T_1 & _regs_0_io_q};
  assign auto_clock_gater_out_member_allClocks_uncore_clock = auto_clock_gater_in_0_member_allClocks_uncore_clock;
  assign auto_clock_gater_out_member_allClocks_uncore_reset = auto_clock_gater_in_0_member_allClocks_uncore_reset;
endmodule

