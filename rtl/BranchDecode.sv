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

module BranchDecode(
  input  [31:0] io_inst,
  input  [39:0] io_pc,
  output        io_out_is_ret,
                io_out_is_call,
  output [39:0] io_out_target,
  output [2:0]  io_out_cfi_type,
  output        io_out_sfb_offset_valid,
  output [5:0]  io_out_sfb_offset_bits,
  output        io_out_shadowable
);

  wire [29:0] bpd_csignals_decoded_invInputs = ~(io_inst[31:2]);
  wire [14:0] _bpd_csignals_decoded_T_4 = {io_inst[0], io_inst[1], bpd_csignals_decoded_invInputs[0], io_inst[4], io_inst[5], bpd_csignals_decoded_invInputs[4], bpd_csignals_decoded_invInputs[10], bpd_csignals_decoded_invInputs[11], bpd_csignals_decoded_invInputs[12], bpd_csignals_decoded_invInputs[23], bpd_csignals_decoded_invInputs[24], bpd_csignals_decoded_invInputs[25], bpd_csignals_decoded_invInputs[26], bpd_csignals_decoded_invInputs[27], bpd_csignals_decoded_invInputs[29]};
  wire [13:0] _bpd_csignals_decoded_T_6 = {io_inst[0], io_inst[1], bpd_csignals_decoded_invInputs[0], bpd_csignals_decoded_invInputs[1], io_inst[4], io_inst[5], bpd_csignals_decoded_invInputs[4], bpd_csignals_decoded_invInputs[23], bpd_csignals_decoded_invInputs[24], bpd_csignals_decoded_invInputs[25], bpd_csignals_decoded_invInputs[26], bpd_csignals_decoded_invInputs[27], bpd_csignals_decoded_invInputs[28], bpd_csignals_decoded_invInputs[29]};
  wire [9:0]  _bpd_csignals_decoded_T_14 = {io_inst[0], io_inst[1], io_inst[2], bpd_csignals_decoded_invInputs[1], bpd_csignals_decoded_invInputs[2], io_inst[5], io_inst[6], bpd_csignals_decoded_invInputs[10], bpd_csignals_decoded_invInputs[11], bpd_csignals_decoded_invInputs[12]};
  wire [6:0]  _bpd_csignals_decoded_T_16 = {io_inst[0], io_inst[1], io_inst[2], io_inst[3], bpd_csignals_decoded_invInputs[2], io_inst[5], io_inst[6]};
  wire [14:0] _bpd_csignals_decoded_T_30 = {io_inst[0], io_inst[1], bpd_csignals_decoded_invInputs[0], io_inst[4], io_inst[5], bpd_csignals_decoded_invInputs[4], io_inst[12], bpd_csignals_decoded_invInputs[11], io_inst[14], bpd_csignals_decoded_invInputs[23], bpd_csignals_decoded_invInputs[24], bpd_csignals_decoded_invInputs[25], bpd_csignals_decoded_invInputs[26], bpd_csignals_decoded_invInputs[27], bpd_csignals_decoded_invInputs[29]};
  wire [1:0]  _bpd_csignals_decoded_orMatrixOutputs_T_6 = {&{io_inst[0], io_inst[1], bpd_csignals_decoded_invInputs[0], bpd_csignals_decoded_invInputs[1], bpd_csignals_decoded_invInputs[2], io_inst[5], io_inst[6], bpd_csignals_decoded_invInputs[11]}, &{io_inst[0], io_inst[1], bpd_csignals_decoded_invInputs[0], bpd_csignals_decoded_invInputs[1], bpd_csignals_decoded_invInputs[2], io_inst[5], io_inst[6], io_inst[14]}};
  assign io_out_is_ret = (&_bpd_csignals_decoded_T_14) & {io_inst[19:18], io_inst[16:15]} == 4'h1 & io_inst[11:7] == 5'h0;
  assign io_out_is_call = ((&_bpd_csignals_decoded_T_16) | (&_bpd_csignals_decoded_T_14)) & io_inst[11:7] == 5'h1;
  assign io_out_target = (|_bpd_csignals_decoded_orMatrixOutputs_T_6) ? io_pc + {{28{io_inst[31]}}, io_inst[7], io_inst[30:25], io_inst[11:8], 1'h0} & 40'hFFFFFFFFFE : io_pc + {{20{io_inst[31]}}, io_inst[19:12], io_inst[20], io_inst[30:21], 1'h0} & 40'hFFFFFFFFFE;
  assign io_out_cfi_type = (&_bpd_csignals_decoded_T_14) ? 3'h3 : (&_bpd_csignals_decoded_T_16) ? 3'h2 : {2'h0, |_bpd_csignals_decoded_orMatrixOutputs_T_6};
  assign io_out_sfb_offset_valid = (|_bpd_csignals_decoded_orMatrixOutputs_T_6) & ~(io_inst[31]) & (|{io_inst[7], io_inst[30:25], io_inst[11:8]}) & {io_inst[7], io_inst[30:26]} == 6'h0;
  assign io_out_sfb_offset_bits = {io_inst[25], io_inst[11:8], 1'h0};
  assign io_out_shadowable =
    (|{&{io_inst[0], io_inst[1], bpd_csignals_decoded_invInputs[0], bpd_csignals_decoded_invInputs[1], io_inst[4], bpd_csignals_decoded_invInputs[3], bpd_csignals_decoded_invInputs[4], bpd_csignals_decoded_invInputs[10]},
       &{io_inst[0], io_inst[1], bpd_csignals_decoded_invInputs[0], io_inst[4], bpd_csignals_decoded_invInputs[3], bpd_csignals_decoded_invInputs[4], bpd_csignals_decoded_invInputs[10], bpd_csignals_decoded_invInputs[11], bpd_csignals_decoded_invInputs[12]},
       &_bpd_csignals_decoded_T_4,
       &_bpd_csignals_decoded_T_6,
       &{io_inst[0], io_inst[1], io_inst[2], bpd_csignals_decoded_invInputs[1], io_inst[4], io_inst[5], bpd_csignals_decoded_invInputs[4]},
       &{io_inst[0], io_inst[1], bpd_csignals_decoded_invInputs[0], bpd_csignals_decoded_invInputs[1], io_inst[4], bpd_csignals_decoded_invInputs[3], bpd_csignals_decoded_invInputs[4], io_inst[12], bpd_csignals_decoded_invInputs[11], bpd_csignals_decoded_invInputs[24], bpd_csignals_decoded_invInputs[25], bpd_csignals_decoded_invInputs[26], bpd_csignals_decoded_invInputs[27], bpd_csignals_decoded_invInputs[28], bpd_csignals_decoded_invInputs[29]},
       &{io_inst[0], io_inst[1], bpd_csignals_decoded_invInputs[0], io_inst[3], io_inst[4], bpd_csignals_decoded_invInputs[4], io_inst[12], bpd_csignals_decoded_invInputs[11], bpd_csignals_decoded_invInputs[23], bpd_csignals_decoded_invInputs[24], bpd_csignals_decoded_invInputs[25], bpd_csignals_decoded_invInputs[26], bpd_csignals_decoded_invInputs[27], bpd_csignals_decoded_invInputs[28], bpd_csignals_decoded_invInputs[29]},
       &{io_inst[0], io_inst[1], bpd_csignals_decoded_invInputs[0], bpd_csignals_decoded_invInputs[1], io_inst[4], bpd_csignals_decoded_invInputs[3], bpd_csignals_decoded_invInputs[4], io_inst[13]},
       &{io_inst[0], io_inst[1], bpd_csignals_decoded_invInputs[0], bpd_csignals_decoded_invInputs[1], io_inst[4], bpd_csignals_decoded_invInputs[3], bpd_csignals_decoded_invInputs[4], io_inst[12], bpd_csignals_decoded_invInputs[11], io_inst[14], bpd_csignals_decoded_invInputs[24], bpd_csignals_decoded_invInputs[25], bpd_csignals_decoded_invInputs[26], bpd_csignals_decoded_invInputs[27], bpd_csignals_decoded_invInputs[29]},
       &{io_inst[0], io_inst[1], bpd_csignals_decoded_invInputs[0], io_inst[3], io_inst[4], bpd_csignals_decoded_invInputs[4], io_inst[12], bpd_csignals_decoded_invInputs[11], io_inst[14], bpd_csignals_decoded_invInputs[23], bpd_csignals_decoded_invInputs[24], bpd_csignals_decoded_invInputs[25], bpd_csignals_decoded_invInputs[26], bpd_csignals_decoded_invInputs[27], bpd_csignals_decoded_invInputs[29]},
       &_bpd_csignals_decoded_T_30}) & ({&_bpd_csignals_decoded_T_4, &_bpd_csignals_decoded_T_6, &{io_inst[0], io_inst[1], bpd_csignals_decoded_invInputs[0], io_inst[4], io_inst[5], bpd_csignals_decoded_invInputs[4], bpd_csignals_decoded_invInputs[11], bpd_csignals_decoded_invInputs[12], bpd_csignals_decoded_invInputs[23], bpd_csignals_decoded_invInputs[24], bpd_csignals_decoded_invInputs[25], bpd_csignals_decoded_invInputs[26], bpd_csignals_decoded_invInputs[27], bpd_csignals_decoded_invInputs[28], bpd_csignals_decoded_invInputs[29]}, &_bpd_csignals_decoded_T_30} == 4'h0 | io_inst[19:15] == io_inst[11:7] | {io_inst[31:25], io_inst[14:12], io_inst[6:0]} == 17'h33 & io_inst[19:15] == 5'h0);
endmodule

