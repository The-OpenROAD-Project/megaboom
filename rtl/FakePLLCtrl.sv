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

module FakePLLCtrl(
  input         clock,
                reset,
  output        auto_ctrl_out_gate,
                auto_ctrl_out_power,
                auto_tl_in_a_ready,
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
  output [63:0] auto_tl_in_d_bits_data
);

  wire       out_woready_1;
  wire       _power_reg_io_q;
  wire       _gate_reg_io_q;
  wire       out_front_bits_read = auto_tl_in_a_bits_opcode == 3'h4;
  wire       _out_out_bits_data_T_1 = auto_tl_in_a_bits_address[11:3] == 9'h0;
  assign out_woready_1 = auto_tl_in_a_valid & auto_tl_in_d_ready & ~out_front_bits_read & _out_out_bits_data_T_1;
  wire [2:0] tlNodeIn_d_bits_opcode = {2'h0, out_front_bits_read};
  TLMonitor_66 monitor (
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
  AsyncResetRegVec_w1_i0 gate_reg (
    .clock (clock),
    .reset (reset),
    .io_d  (auto_tl_in_a_bits_data[0]),
    .io_q  (_gate_reg_io_q),
    .io_en (out_woready_1 & auto_tl_in_a_bits_mask[0])
  );
  AsyncResetRegVec_w1_i0 power_reg (
    .clock (clock),
    .reset (reset),
    .io_d  (auto_tl_in_a_bits_data[32]),
    .io_q  (_power_reg_io_q),
    .io_en (out_woready_1 & auto_tl_in_a_bits_mask[4])
  );
  assign auto_ctrl_out_gate = _gate_reg_io_q;
  assign auto_ctrl_out_power = _power_reg_io_q;
  assign auto_tl_in_a_ready = auto_tl_in_d_ready;
  assign auto_tl_in_d_valid = auto_tl_in_a_valid;
  assign auto_tl_in_d_bits_opcode = tlNodeIn_d_bits_opcode;
  assign auto_tl_in_d_bits_size = auto_tl_in_a_bits_size;
  assign auto_tl_in_d_bits_source = auto_tl_in_a_bits_source;
  assign auto_tl_in_d_bits_data = {31'h0, _out_out_bits_data_T_1 ? {_power_reg_io_q, 31'h0, _gate_reg_io_q} : 33'h0};
endmodule

