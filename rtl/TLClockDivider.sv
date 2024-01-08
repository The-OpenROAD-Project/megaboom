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

module TLClockDivider(
  input         clock,
                reset,
  output        auto_tl_in_a_ready,
  input         auto_tl_in_a_valid,
  input  [2:0]  auto_tl_in_a_bits_opcode,
                auto_tl_in_a_bits_param,
  input  [1:0]  auto_tl_in_a_bits_size,
  input  [10:0] auto_tl_in_a_bits_source,
  input  [20:0] auto_tl_in_a_bits_address,
  input  [7:0]  auto_tl_in_a_bits_mask,
  input  [63:0] auto_tl_in_a_bits_data,
  input         auto_tl_in_a_bits_corrupt,
                auto_tl_in_d_ready,
  output        auto_tl_in_d_valid,
  output [2:0]  auto_tl_in_d_bits_opcode,
  output [1:0]  auto_tl_in_d_bits_size,
  output [10:0] auto_tl_in_d_bits_source,
  output [63:0] auto_tl_in_d_bits_data,
  input         auto_clock_in_member_allClocks_uncore_clock,
                auto_clock_in_member_allClocks_uncore_reset,
  output        auto_clock_out_member_allClocks_uncore_clock,
                auto_clock_out_member_allClocks_uncore_reset
);

  wire       _out_wofireMux_T_1;
  wire       _divider_io_resetAsync_stretcher_io_reset_out;
  wire [7:0] _regs_0_io_q;
  wire       out_front_bits_read = auto_tl_in_a_bits_opcode == 3'h4;
  wire       _out_out_bits_data_T_1 = auto_tl_in_a_bits_address[11:3] == 9'h0;
  assign _out_wofireMux_T_1 = ~out_front_bits_read;
  wire [2:0] tlNodeIn_d_bits_opcode = {2'h0, out_front_bits_read};
  TLMonitor_64 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (auto_tl_in_d_ready),
    .io_in_a_valid        (auto_tl_in_a_valid),
    .io_in_a_bits_opcode  (auto_tl_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_tl_in_a_bits_param),
    .io_in_a_bits_size    (auto_tl_in_a_bits_size),
    .io_in_a_bits_source  (auto_tl_in_a_bits_source),
    .io_in_a_bits_address (auto_tl_in_a_bits_address),
    .io_in_a_bits_mask    (auto_tl_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_tl_in_a_bits_corrupt),
    .io_in_d_ready        (auto_tl_in_d_ready),
    .io_in_d_valid        (auto_tl_in_a_valid),
    .io_in_d_bits_opcode  (tlNodeIn_d_bits_opcode),
    .io_in_d_bits_size    (auto_tl_in_a_bits_size),
    .io_in_d_bits_source  (auto_tl_in_a_bits_source)
  );
  AsyncResetRegVec_w8_i0 regs_0 (
    .clock (clock),
    .reset (reset),
    .io_d  (auto_tl_in_a_bits_data[7:0]),
    .io_q  (_regs_0_io_q),
    .io_en (auto_tl_in_a_valid & auto_tl_in_d_ready & _out_wofireMux_T_1 & _out_out_bits_data_T_1 & auto_tl_in_a_bits_mask[0])
  );
  ClockDivideOrPass divider (
    .io_clockIn    (auto_clock_in_member_allClocks_uncore_clock),
    .io_divisor    (reset ? 8'h0 : _regs_0_io_q),
    .io_resetAsync (_divider_io_resetAsync_stretcher_io_reset_out),
    .io_clockOut   (auto_clock_out_member_allClocks_uncore_clock)
  );
  ResetStretcher divider_io_resetAsync_stretcher (
    .clock        (auto_clock_in_member_allClocks_uncore_clock),
    .reset        (auto_clock_in_member_allClocks_uncore_reset),
    .io_reset_out (_divider_io_resetAsync_stretcher_io_reset_out)
  );
  ResetStretcher_1 clockNodeOut_member_allClocks_uncore_reset_stretcher (
    .clock        (auto_clock_in_member_allClocks_uncore_clock),
    .reset        (auto_clock_in_member_allClocks_uncore_reset),
    .io_reset_out (auto_clock_out_member_allClocks_uncore_reset)
  );
  assign auto_tl_in_a_ready = auto_tl_in_d_ready;
  assign auto_tl_in_d_valid = auto_tl_in_a_valid;
  assign auto_tl_in_d_bits_opcode = tlNodeIn_d_bits_opcode;
  assign auto_tl_in_d_bits_size = auto_tl_in_a_bits_size;
  assign auto_tl_in_d_bits_source = auto_tl_in_a_bits_source;
  assign auto_tl_in_d_bits_data = {56'h0, _out_out_bits_data_T_1 ? _regs_0_io_q : 8'h0};
endmodule

