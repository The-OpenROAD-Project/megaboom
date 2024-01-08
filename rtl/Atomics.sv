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

module Atomics(
  input         io_write,
  input  [2:0]  io_a_opcode,
                io_a_param,
  input  [7:0]  io_a_mask,
  input  [63:0] io_a_data,
                io_data_in,
  output [63:0] io_data_out
);

  wire [63:0] _sum_T_26 = ({{8{io_a_mask[7]}}, {8{io_a_mask[6]}}, {8{io_a_mask[5]}}, {8{io_a_mask[4]}}, {8{io_a_mask[3]}}, {8{io_a_mask[2]}}, {8{io_a_mask[1]}}, {8{io_a_mask[0]}}} & io_a_data) + ({64{~(io_a_param[2])}} ^ io_data_in);
  reg  [3:0]  casez_tmp;
  always @(*) begin
    casez (io_a_param[1:0])
      2'b00:
        casez_tmp = 4'h6;
      2'b01:
        casez_tmp = 4'hE;
      2'b10:
        casez_tmp = 4'h8;
      default:
        casez_tmp = 4'hC;
    endcase
  end // always @(*)
  reg  [1:0]  casez_tmp_0;
  wire [7:0]  signBit = io_a_mask & {1'h1, ~(io_a_mask[7:1])};
  wire [7:0]  _sign_a_T_65 = {io_a_data[63], io_a_data[55], io_a_data[47], io_a_data[39], io_a_data[31], io_a_data[23], io_a_data[15], io_a_data[7]} & signBit;
  always @(*) begin
    casez (io_a_opcode)
      3'b000:
        casez_tmp_0 = 2'h1;
      3'b001:
        casez_tmp_0 = 2'h1;
      3'b010:
        casez_tmp_0 = io_a_param[2] ? 2'h2 : {1'h0, io_a_param[0] == ((|_sign_a_T_65) == (|({io_data_in[63], io_data_in[55], io_data_in[47], io_data_in[39], io_data_in[31], io_data_in[23], io_data_in[15], io_data_in[7]} & signBit)) ? ({_sum_T_26[63], _sum_T_26[55], _sum_T_26[47], _sum_T_26[39], _sum_T_26[31], _sum_T_26[23], _sum_T_26[15], _sum_T_26[7]} & signBit) == 8'h0 : io_a_param[1] == (|_sign_a_T_65))};
      3'b011:
        casez_tmp_0 = 2'h3;
      3'b100:
        casez_tmp_0 = 2'h0;
      3'b101:
        casez_tmp_0 = 2'h0;
      3'b110:
        casez_tmp_0 = 2'h0;
      default:
        casez_tmp_0 = 2'h0;
    endcase
  end // always @(*)
  wire [1:0]  select = io_write ? 2'h1 : casez_tmp_0;
  reg  [7:0]  casez_tmp_1;
  wire [3:0]  _logical_T_174 = casez_tmp >> {2'h0, io_a_data[15], io_data_in[15]};
  wire [3:0]  _logical_T_171 = casez_tmp >> {2'h0, io_a_data[14], io_data_in[14]};
  wire [3:0]  _logical_T_168 = casez_tmp >> {2'h0, io_a_data[13], io_data_in[13]};
  wire [3:0]  _logical_T_165 = casez_tmp >> {2'h0, io_a_data[12], io_data_in[12]};
  wire [3:0]  _logical_T_162 = casez_tmp >> {2'h0, io_a_data[11], io_data_in[11]};
  wire [3:0]  _logical_T_159 = casez_tmp >> {2'h0, io_a_data[10], io_data_in[10]};
  wire [3:0]  _logical_T_156 = casez_tmp >> {2'h0, io_a_data[9], io_data_in[9]};
  wire [3:0]  _logical_T_153 = casez_tmp >> {2'h0, io_a_data[8], io_data_in[8]};
  always @(*) begin
    casez (io_a_mask[1] ? select : 2'h0)
      2'b00:
        casez_tmp_1 = io_data_in[15:8];
      2'b01:
        casez_tmp_1 = io_a_data[15:8];
      2'b10:
        casez_tmp_1 = _sum_T_26[15:8];
      default:
        casez_tmp_1 = {_logical_T_174[0], _logical_T_171[0], _logical_T_168[0], _logical_T_165[0], _logical_T_162[0], _logical_T_159[0], _logical_T_156[0], _logical_T_153[0]};
    endcase
  end // always @(*)
  reg  [7:0]  casez_tmp_2;
  wire [3:0]  _logical_T_150 = casez_tmp >> {2'h0, io_a_data[7], io_data_in[7]};
  wire [3:0]  _logical_T_147 = casez_tmp >> {2'h0, io_a_data[6], io_data_in[6]};
  wire [3:0]  _logical_T_144 = casez_tmp >> {2'h0, io_a_data[5], io_data_in[5]};
  wire [3:0]  _logical_T_141 = casez_tmp >> {2'h0, io_a_data[4], io_data_in[4]};
  wire [3:0]  _logical_T_138 = casez_tmp >> {2'h0, io_a_data[3], io_data_in[3]};
  wire [3:0]  _logical_T_135 = casez_tmp >> {2'h0, io_a_data[2], io_data_in[2]};
  wire [3:0]  _logical_T_132 = casez_tmp >> {2'h0, io_a_data[1], io_data_in[1]};
  wire [3:0]  _logical_T_129 = casez_tmp >> {2'h0, io_a_data[0], io_data_in[0]};
  always @(*) begin
    casez (io_a_mask[0] ? select : 2'h0)
      2'b00:
        casez_tmp_2 = io_data_in[7:0];
      2'b01:
        casez_tmp_2 = io_a_data[7:0];
      2'b10:
        casez_tmp_2 = _sum_T_26[7:0];
      default:
        casez_tmp_2 = {_logical_T_150[0], _logical_T_147[0], _logical_T_144[0], _logical_T_141[0], _logical_T_138[0], _logical_T_135[0], _logical_T_132[0], _logical_T_129[0]};
    endcase
  end // always @(*)
  reg  [7:0]  casez_tmp_3;
  wire [3:0]  _logical_T_222 = casez_tmp >> {2'h0, io_a_data[31], io_data_in[31]};
  wire [3:0]  _logical_T_219 = casez_tmp >> {2'h0, io_a_data[30], io_data_in[30]};
  wire [3:0]  _logical_T_216 = casez_tmp >> {2'h0, io_a_data[29], io_data_in[29]};
  wire [3:0]  _logical_T_213 = casez_tmp >> {2'h0, io_a_data[28], io_data_in[28]};
  wire [3:0]  _logical_T_210 = casez_tmp >> {2'h0, io_a_data[27], io_data_in[27]};
  wire [3:0]  _logical_T_207 = casez_tmp >> {2'h0, io_a_data[26], io_data_in[26]};
  wire [3:0]  _logical_T_204 = casez_tmp >> {2'h0, io_a_data[25], io_data_in[25]};
  wire [3:0]  _logical_T_201 = casez_tmp >> {2'h0, io_a_data[24], io_data_in[24]};
  always @(*) begin
    casez (io_a_mask[3] ? select : 2'h0)
      2'b00:
        casez_tmp_3 = io_data_in[31:24];
      2'b01:
        casez_tmp_3 = io_a_data[31:24];
      2'b10:
        casez_tmp_3 = _sum_T_26[31:24];
      default:
        casez_tmp_3 = {_logical_T_222[0], _logical_T_219[0], _logical_T_216[0], _logical_T_213[0], _logical_T_210[0], _logical_T_207[0], _logical_T_204[0], _logical_T_201[0]};
    endcase
  end // always @(*)
  reg  [7:0]  casez_tmp_4;
  wire [3:0]  _logical_T_198 = casez_tmp >> {2'h0, io_a_data[23], io_data_in[23]};
  wire [3:0]  _logical_T_195 = casez_tmp >> {2'h0, io_a_data[22], io_data_in[22]};
  wire [3:0]  _logical_T_192 = casez_tmp >> {2'h0, io_a_data[21], io_data_in[21]};
  wire [3:0]  _logical_T_189 = casez_tmp >> {2'h0, io_a_data[20], io_data_in[20]};
  wire [3:0]  _logical_T_186 = casez_tmp >> {2'h0, io_a_data[19], io_data_in[19]};
  wire [3:0]  _logical_T_183 = casez_tmp >> {2'h0, io_a_data[18], io_data_in[18]};
  wire [3:0]  _logical_T_180 = casez_tmp >> {2'h0, io_a_data[17], io_data_in[17]};
  wire [3:0]  _logical_T_177 = casez_tmp >> {2'h0, io_a_data[16], io_data_in[16]};
  always @(*) begin
    casez (io_a_mask[2] ? select : 2'h0)
      2'b00:
        casez_tmp_4 = io_data_in[23:16];
      2'b01:
        casez_tmp_4 = io_a_data[23:16];
      2'b10:
        casez_tmp_4 = _sum_T_26[23:16];
      default:
        casez_tmp_4 = {_logical_T_198[0], _logical_T_195[0], _logical_T_192[0], _logical_T_189[0], _logical_T_186[0], _logical_T_183[0], _logical_T_180[0], _logical_T_177[0]};
    endcase
  end // always @(*)
  reg  [7:0]  casez_tmp_5;
  wire [3:0]  _logical_T_270 = casez_tmp >> {2'h0, io_a_data[47], io_data_in[47]};
  wire [3:0]  _logical_T_267 = casez_tmp >> {2'h0, io_a_data[46], io_data_in[46]};
  wire [3:0]  _logical_T_264 = casez_tmp >> {2'h0, io_a_data[45], io_data_in[45]};
  wire [3:0]  _logical_T_261 = casez_tmp >> {2'h0, io_a_data[44], io_data_in[44]};
  wire [3:0]  _logical_T_258 = casez_tmp >> {2'h0, io_a_data[43], io_data_in[43]};
  wire [3:0]  _logical_T_255 = casez_tmp >> {2'h0, io_a_data[42], io_data_in[42]};
  wire [3:0]  _logical_T_252 = casez_tmp >> {2'h0, io_a_data[41], io_data_in[41]};
  wire [3:0]  _logical_T_249 = casez_tmp >> {2'h0, io_a_data[40], io_data_in[40]};
  always @(*) begin
    casez (io_a_mask[5] ? select : 2'h0)
      2'b00:
        casez_tmp_5 = io_data_in[47:40];
      2'b01:
        casez_tmp_5 = io_a_data[47:40];
      2'b10:
        casez_tmp_5 = _sum_T_26[47:40];
      default:
        casez_tmp_5 = {_logical_T_270[0], _logical_T_267[0], _logical_T_264[0], _logical_T_261[0], _logical_T_258[0], _logical_T_255[0], _logical_T_252[0], _logical_T_249[0]};
    endcase
  end // always @(*)
  reg  [7:0]  casez_tmp_6;
  wire [3:0]  _logical_T_246 = casez_tmp >> {2'h0, io_a_data[39], io_data_in[39]};
  wire [3:0]  _logical_T_243 = casez_tmp >> {2'h0, io_a_data[38], io_data_in[38]};
  wire [3:0]  _logical_T_240 = casez_tmp >> {2'h0, io_a_data[37], io_data_in[37]};
  wire [3:0]  _logical_T_237 = casez_tmp >> {2'h0, io_a_data[36], io_data_in[36]};
  wire [3:0]  _logical_T_234 = casez_tmp >> {2'h0, io_a_data[35], io_data_in[35]};
  wire [3:0]  _logical_T_231 = casez_tmp >> {2'h0, io_a_data[34], io_data_in[34]};
  wire [3:0]  _logical_T_228 = casez_tmp >> {2'h0, io_a_data[33], io_data_in[33]};
  wire [3:0]  _logical_T_225 = casez_tmp >> {2'h0, io_a_data[32], io_data_in[32]};
  always @(*) begin
    casez (io_a_mask[4] ? select : 2'h0)
      2'b00:
        casez_tmp_6 = io_data_in[39:32];
      2'b01:
        casez_tmp_6 = io_a_data[39:32];
      2'b10:
        casez_tmp_6 = _sum_T_26[39:32];
      default:
        casez_tmp_6 = {_logical_T_246[0], _logical_T_243[0], _logical_T_240[0], _logical_T_237[0], _logical_T_234[0], _logical_T_231[0], _logical_T_228[0], _logical_T_225[0]};
    endcase
  end // always @(*)
  reg  [7:0]  casez_tmp_7;
  wire [3:0]  _logical_T_318 = casez_tmp >> {2'h0, io_a_data[63], io_data_in[63]};
  wire [3:0]  _logical_T_315 = casez_tmp >> {2'h0, io_a_data[62], io_data_in[62]};
  wire [3:0]  _logical_T_312 = casez_tmp >> {2'h0, io_a_data[61], io_data_in[61]};
  wire [3:0]  _logical_T_309 = casez_tmp >> {2'h0, io_a_data[60], io_data_in[60]};
  wire [3:0]  _logical_T_306 = casez_tmp >> {2'h0, io_a_data[59], io_data_in[59]};
  wire [3:0]  _logical_T_303 = casez_tmp >> {2'h0, io_a_data[58], io_data_in[58]};
  wire [3:0]  _logical_T_300 = casez_tmp >> {2'h0, io_a_data[57], io_data_in[57]};
  wire [3:0]  _logical_T_297 = casez_tmp >> {2'h0, io_a_data[56], io_data_in[56]};
  always @(*) begin
    casez (io_a_mask[7] ? select : 2'h0)
      2'b00:
        casez_tmp_7 = io_data_in[63:56];
      2'b01:
        casez_tmp_7 = io_a_data[63:56];
      2'b10:
        casez_tmp_7 = _sum_T_26[63:56];
      default:
        casez_tmp_7 = {_logical_T_318[0], _logical_T_315[0], _logical_T_312[0], _logical_T_309[0], _logical_T_306[0], _logical_T_303[0], _logical_T_300[0], _logical_T_297[0]};
    endcase
  end // always @(*)
  reg  [7:0]  casez_tmp_8;
  wire [3:0]  _logical_T_294 = casez_tmp >> {2'h0, io_a_data[55], io_data_in[55]};
  wire [3:0]  _logical_T_291 = casez_tmp >> {2'h0, io_a_data[54], io_data_in[54]};
  wire [3:0]  _logical_T_288 = casez_tmp >> {2'h0, io_a_data[53], io_data_in[53]};
  wire [3:0]  _logical_T_285 = casez_tmp >> {2'h0, io_a_data[52], io_data_in[52]};
  wire [3:0]  _logical_T_282 = casez_tmp >> {2'h0, io_a_data[51], io_data_in[51]};
  wire [3:0]  _logical_T_279 = casez_tmp >> {2'h0, io_a_data[50], io_data_in[50]};
  wire [3:0]  _logical_T_276 = casez_tmp >> {2'h0, io_a_data[49], io_data_in[49]};
  wire [3:0]  _logical_T_273 = casez_tmp >> {2'h0, io_a_data[48], io_data_in[48]};
  always @(*) begin
    casez (io_a_mask[6] ? select : 2'h0)
      2'b00:
        casez_tmp_8 = io_data_in[55:48];
      2'b01:
        casez_tmp_8 = io_a_data[55:48];
      2'b10:
        casez_tmp_8 = _sum_T_26[55:48];
      default:
        casez_tmp_8 = {_logical_T_294[0], _logical_T_291[0], _logical_T_288[0], _logical_T_285[0], _logical_T_282[0], _logical_T_279[0], _logical_T_276[0], _logical_T_273[0]};
    endcase
  end // always @(*)
  assign io_data_out = {casez_tmp_7, casez_tmp_8, casez_tmp_5, casez_tmp_6, casez_tmp_3, casez_tmp_4, casez_tmp_1, casez_tmp_2};
endmodule

