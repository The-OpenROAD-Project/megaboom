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

module ClockSinkDomain_3(
  output        auto_uart_0_int_xing_out_sync_0,
                auto_uart_0_control_xing_in_a_ready,
  input         auto_uart_0_control_xing_in_a_valid,
  input  [2:0]  auto_uart_0_control_xing_in_a_bits_opcode,
                auto_uart_0_control_xing_in_a_bits_param,
  input  [1:0]  auto_uart_0_control_xing_in_a_bits_size,
  input  [10:0] auto_uart_0_control_xing_in_a_bits_source,
  input  [28:0] auto_uart_0_control_xing_in_a_bits_address,
  input  [7:0]  auto_uart_0_control_xing_in_a_bits_mask,
  input  [63:0] auto_uart_0_control_xing_in_a_bits_data,
  input         auto_uart_0_control_xing_in_a_bits_corrupt,
                auto_uart_0_control_xing_in_d_ready,
  output        auto_uart_0_control_xing_in_d_valid,
  output [2:0]  auto_uart_0_control_xing_in_d_bits_opcode,
  output [1:0]  auto_uart_0_control_xing_in_d_bits_size,
  output [10:0] auto_uart_0_control_xing_in_d_bits_source,
  output [63:0] auto_uart_0_control_xing_in_d_bits_data,
  output        auto_uart_0_io_out_txd,
  input         auto_uart_0_io_out_rxd,
                auto_clock_in_clock,
                auto_clock_in_reset
);

  TLUART uart_0 (
    .clock                               (auto_clock_in_clock),
    .reset                               (auto_clock_in_reset),
    .auto_int_xing_out_sync_0            (auto_uart_0_int_xing_out_sync_0),
    .auto_control_xing_in_a_ready        (auto_uart_0_control_xing_in_a_ready),
    .auto_control_xing_in_a_valid        (auto_uart_0_control_xing_in_a_valid),
    .auto_control_xing_in_a_bits_opcode  (auto_uart_0_control_xing_in_a_bits_opcode),
    .auto_control_xing_in_a_bits_param   (auto_uart_0_control_xing_in_a_bits_param),
    .auto_control_xing_in_a_bits_size    (auto_uart_0_control_xing_in_a_bits_size),
    .auto_control_xing_in_a_bits_source  (auto_uart_0_control_xing_in_a_bits_source),
    .auto_control_xing_in_a_bits_address (auto_uart_0_control_xing_in_a_bits_address),
    .auto_control_xing_in_a_bits_mask    (auto_uart_0_control_xing_in_a_bits_mask),
    .auto_control_xing_in_a_bits_data    (auto_uart_0_control_xing_in_a_bits_data),
    .auto_control_xing_in_a_bits_corrupt (auto_uart_0_control_xing_in_a_bits_corrupt),
    .auto_control_xing_in_d_ready        (auto_uart_0_control_xing_in_d_ready),
    .auto_control_xing_in_d_valid        (auto_uart_0_control_xing_in_d_valid),
    .auto_control_xing_in_d_bits_opcode  (auto_uart_0_control_xing_in_d_bits_opcode),
    .auto_control_xing_in_d_bits_size    (auto_uart_0_control_xing_in_d_bits_size),
    .auto_control_xing_in_d_bits_source  (auto_uart_0_control_xing_in_d_bits_source),
    .auto_control_xing_in_d_bits_data    (auto_uart_0_control_xing_in_d_bits_data),
    .auto_io_out_txd                     (auto_uart_0_io_out_txd),
    .auto_io_out_rxd                     (auto_uart_0_io_out_rxd)
  );
endmodule

