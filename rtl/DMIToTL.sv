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

module DMIToTL(
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
  output [8:0]  auto_out_a_bits_address,
  output [31:0] auto_out_a_bits_data,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
                auto_out_d_bits_denied,
  input  [31:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt,
  output        io_dmi_req_ready,
  input         io_dmi_req_valid,
  input  [6:0]  io_dmi_req_bits_addr,
  input  [31:0] io_dmi_req_bits_data,
  input  [1:0]  io_dmi_req_bits_op,
  input         io_dmi_resp_ready,
  output        io_dmi_resp_valid,
  output [31:0] io_dmi_resp_bits_data,
  output [1:0]  io_dmi_resp_bits_resp
);

  wire _GEN = io_dmi_req_bits_op == 2'h2;
  wire _GEN_0 = io_dmi_req_bits_op == 2'h1;
  assign auto_out_a_valid = io_dmi_req_valid;
  assign auto_out_a_bits_opcode = _GEN ? 3'h0 : {_GEN_0, 2'h0};
  assign auto_out_a_bits_address = _GEN | _GEN_0 ? {io_dmi_req_bits_addr, 2'h0} : 9'h48;
  assign auto_out_a_bits_data = _GEN ? io_dmi_req_bits_data : 32'h0;
  assign auto_out_d_ready = io_dmi_resp_ready;
  assign io_dmi_req_ready = auto_out_a_ready;
  assign io_dmi_resp_valid = auto_out_d_valid;
  assign io_dmi_resp_bits_data = auto_out_d_bits_data;
  assign io_dmi_resp_bits_resp = {1'h0, auto_out_d_bits_corrupt | auto_out_d_bits_denied};
endmodule

