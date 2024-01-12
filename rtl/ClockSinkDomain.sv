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

module ClockSinkDomain(
  output        auto_plic_in_a_ready,
  input         auto_plic_in_a_valid,
  input  [2:0]  auto_plic_in_a_bits_opcode,
                auto_plic_in_a_bits_param,
  input  [1:0]  auto_plic_in_a_bits_size,
  input  [9:0]  auto_plic_in_a_bits_source,
  input  [27:0] auto_plic_in_a_bits_address,
  input  [7:0]  auto_plic_in_a_bits_mask,
  input  [63:0] auto_plic_in_a_bits_data,
  input         auto_plic_in_a_bits_corrupt,
                auto_plic_in_d_ready,
  output        auto_plic_in_d_valid,
  output [2:0]  auto_plic_in_d_bits_opcode,
  output [1:0]  auto_plic_in_d_bits_size,
  output [9:0]  auto_plic_in_d_bits_source,
  output [63:0] auto_plic_in_d_bits_data,
  input         auto_clock_in_clock,
                auto_clock_in_reset
);

  TLPLIC plic (
    .clock                  (auto_clock_in_clock),
    .reset                  (auto_clock_in_reset),
    .auto_in_a_ready        (auto_plic_in_a_ready),
    .auto_in_a_valid        (auto_plic_in_a_valid),
    .auto_in_a_bits_opcode  (auto_plic_in_a_bits_opcode),
    .auto_in_a_bits_param   (auto_plic_in_a_bits_param),
    .auto_in_a_bits_size    (auto_plic_in_a_bits_size),
    .auto_in_a_bits_source  (auto_plic_in_a_bits_source),
    .auto_in_a_bits_address (auto_plic_in_a_bits_address),
    .auto_in_a_bits_mask    (auto_plic_in_a_bits_mask),
    .auto_in_a_bits_data    (auto_plic_in_a_bits_data),
    .auto_in_a_bits_corrupt (auto_plic_in_a_bits_corrupt),
    .auto_in_d_ready        (auto_plic_in_d_ready),
    .auto_in_d_valid        (auto_plic_in_d_valid),
    .auto_in_d_bits_opcode  (auto_plic_in_d_bits_opcode),
    .auto_in_d_bits_size    (auto_plic_in_d_bits_size),
    .auto_in_d_bits_source  (auto_plic_in_d_bits_source),
    .auto_in_d_bits_data    (auto_plic_in_d_bits_data)
  );
endmodule

