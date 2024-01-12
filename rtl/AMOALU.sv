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

module AMOALU(
  input  [7:0]  io_mask,
  input  [4:0]  io_cmd,
  input  [63:0] io_lhs,
                io_rhs,
  output [63:0] io_out
);

  wire        _logic_xor_T_1 = io_cmd == 5'hA;
  wire        logic_and = _logic_xor_T_1 | io_cmd == 5'hB;
  wire        logic_xor = io_cmd == 5'h9 | _logic_xor_T_1;
  wire [63:0] adder_out_mask = {32'hFFFFFFFF, io_mask[3], 31'h7FFFFFFF};
  wire [63:0] wmask = {{8{io_mask[7]}}, {8{io_mask[6]}}, {8{io_mask[5]}}, {8{io_mask[4]}}, {8{io_mask[3]}}, {8{io_mask[2]}}, {8{io_mask[1]}}, {8{io_mask[0]}}};
  assign io_out = wmask & (io_cmd == 5'h8 ? (io_lhs & adder_out_mask) + (io_rhs & adder_out_mask) : logic_and | logic_xor ? (logic_and ? io_lhs & io_rhs : 64'h0) | (logic_xor ? io_lhs ^ io_rhs : 64'h0) : ((io_mask[4] ? (io_lhs[63] == io_rhs[63] ? io_lhs[63:32] < io_rhs[63:32] | io_lhs[63:32] == io_rhs[63:32] & io_lhs[31:0] < io_rhs[31:0] : io_cmd[1] ? io_rhs[63] : io_lhs[63]) : io_lhs[31] == io_rhs[31] ? io_lhs[31:0] < io_rhs[31:0] : io_cmd[1] ? io_rhs[31] : io_lhs[31]) ? io_cmd == 5'hC | io_cmd == 5'hE : io_cmd == 5'hD | io_cmd == 5'hF) ? io_lhs : io_rhs) | ~wmask & io_lhs;
endmodule

