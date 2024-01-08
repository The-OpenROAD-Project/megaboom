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

module BankedStore(
  input         clock,
  output        io_sinkC_adr_ready,
  input         io_sinkC_adr_valid,
                io_sinkC_adr_bits_noop,
  input  [2:0]  io_sinkC_adr_bits_way,
  input  [9:0]  io_sinkC_adr_bits_set,
  input  [2:0]  io_sinkC_adr_bits_beat,
  input         io_sinkC_adr_bits_mask,
  input  [63:0] io_sinkC_dat_data,
  output        io_sinkD_adr_ready,
  input         io_sinkD_adr_valid,
                io_sinkD_adr_bits_noop,
  input  [2:0]  io_sinkD_adr_bits_way,
  input  [9:0]  io_sinkD_adr_bits_set,
  input  [2:0]  io_sinkD_adr_bits_beat,
  input  [63:0] io_sinkD_dat_data,
  output        io_sourceC_adr_ready,
  input         io_sourceC_adr_valid,
  input  [2:0]  io_sourceC_adr_bits_way,
  input  [9:0]  io_sourceC_adr_bits_set,
  input  [2:0]  io_sourceC_adr_bits_beat,
  output [63:0] io_sourceC_dat_data,
  output        io_sourceD_radr_ready,
  input         io_sourceD_radr_valid,
  input  [2:0]  io_sourceD_radr_bits_way,
  input  [9:0]  io_sourceD_radr_bits_set,
  input  [2:0]  io_sourceD_radr_bits_beat,
  input         io_sourceD_radr_bits_mask,
  output [63:0] io_sourceD_rdat_data,
  output        io_sourceD_wadr_ready,
  input         io_sourceD_wadr_valid,
  input  [2:0]  io_sourceD_wadr_bits_way,
  input  [9:0]  io_sourceD_wadr_bits_set,
  input  [2:0]  io_sourceD_wadr_bits_beat,
  input         io_sourceD_wadr_bits_mask,
  input  [63:0] io_sourceD_wdat_data
);

  wire        readEnable;
  wire        writeEnable;
  wire        readEnable_0;
  wire        writeEnable_0;
  wire        readEnable_1;
  wire        writeEnable_1;
  wire        readEnable_2;
  wire        writeEnable_2;
  wire [3:0]  sourceD_rreq_bankSum;
  wire [3:0]  sourceD_wreq_bankSum;
  wire [3:0]  sinkD_req_bankSum;
  wire [63:0] _cc_banks_3_ext_RW0_rdata;
  wire [63:0] _cc_banks_2_ext_RW0_rdata;
  wire [63:0] _cc_banks_1_ext_RW0_rdata;
  wire [63:0] _cc_banks_0_ext_RW0_rdata;
  wire [3:0]  _GEN = {2'h0, io_sinkC_adr_bits_beat[1:0]};
  wire [3:0]  _sinkC_req_io_sinkC_adr_ready_T_1 = 4'hF >> _GEN;
  wire [13:0] sinkC_req_index = {io_sinkC_adr_bits_way, io_sinkC_adr_bits_set, io_sinkC_adr_bits_beat[2]};
  wire [3:0]  _sinkC_req_out_bankSel_T_7 = 4'h1 << _GEN & {4{io_sinkC_adr_bits_mask}};
  wire [3:0]  sourceC_req_bankSum = io_sinkC_adr_valid ? _sinkC_req_out_bankSel_T_7 : 4'h0;
  wire [3:0]  sinkC_req_bankEn = io_sinkC_adr_bits_noop | ~io_sinkC_adr_valid ? 4'h0 : _sinkC_req_out_bankSel_T_7;
  wire [3:0]  _GEN_0 = {2'h0, io_sinkD_adr_bits_beat[1:0]};
  wire [3:0]  sinkD_req_ready = {~(sinkD_req_bankSum[3]), ~(sinkD_req_bankSum[2]), ~(sinkD_req_bankSum[1]), ~(sinkD_req_bankSum[0])};
  wire [3:0]  _sinkD_req_io_sinkD_adr_ready_T_1 = sinkD_req_ready >> _GEN_0;
  wire [13:0] sinkD_req_index = {io_sinkD_adr_bits_way, io_sinkD_adr_bits_set, io_sinkD_adr_bits_beat[2]};
  wire [3:0]  sinkD_req_bankSel = io_sinkD_adr_valid ? 4'h1 << _GEN_0 : 4'h0;
  wire [3:0]  sinkD_req_bankEn = io_sinkD_adr_bits_noop ? 4'h0 : sinkD_req_bankSel & sinkD_req_ready;
  wire [3:0]  _GEN_1 = {2'h0, io_sourceC_adr_bits_beat[1:0]};
  wire [3:0]  sourceC_req_ready = {~(sourceC_req_bankSum[3]), ~(sourceC_req_bankSum[2]), ~(sourceC_req_bankSum[1]), ~(sourceC_req_bankSum[0])};
  wire [3:0]  _sourceC_req_io_sourceC_adr_ready_T_1 = sourceC_req_ready >> _GEN_1;
  wire [13:0] sourceC_req_index = {io_sourceC_adr_bits_way, io_sourceC_adr_bits_set, io_sourceC_adr_bits_beat[2]};
  wire [3:0]  sourceC_req_bankSel = io_sourceC_adr_valid ? 4'h1 << _GEN_1 : 4'h0;
  wire [3:0]  sourceC_req_bankEn = sourceC_req_bankSel & sourceC_req_ready;
  wire [3:0]  _GEN_2 = {2'h0, io_sourceD_radr_bits_beat[1:0]};
  wire [3:0]  sourceD_rreq_ready = {~(sourceD_rreq_bankSum[3] & io_sourceD_radr_bits_mask), ~(sourceD_rreq_bankSum[2] & io_sourceD_radr_bits_mask), ~(sourceD_rreq_bankSum[1] & io_sourceD_radr_bits_mask), ~(sourceD_rreq_bankSum[0] & io_sourceD_radr_bits_mask)};
  wire [3:0]  _sourceD_rreq_io_sourceD_radr_ready_T_1 = sourceD_rreq_ready >> _GEN_2;
  wire [13:0] sourceD_rreq_index = {io_sourceD_radr_bits_way, io_sourceD_radr_bits_set, io_sourceD_radr_bits_beat[2]};
  wire [3:0]  sourceD_rreq_bankEn = (io_sourceD_radr_valid ? 4'h1 << _GEN_2 & {4{io_sourceD_radr_bits_mask}} : 4'h0) & sourceD_rreq_ready;
  wire [3:0]  _GEN_3 = {2'h0, io_sourceD_wadr_bits_beat[1:0]};
  wire [3:0]  sourceD_wreq_ready = {~(sourceD_wreq_bankSum[3] & io_sourceD_wadr_bits_mask), ~(sourceD_wreq_bankSum[2] & io_sourceD_wadr_bits_mask), ~(sourceD_wreq_bankSum[1] & io_sourceD_wadr_bits_mask), ~(sourceD_wreq_bankSum[0] & io_sourceD_wadr_bits_mask)};
  wire [3:0]  _sourceD_wreq_io_sourceD_wadr_ready_T_1 = sourceD_wreq_ready >> _GEN_3;
  wire [13:0] sourceD_wreq_index = {io_sourceD_wadr_bits_way, io_sourceD_wadr_bits_set, io_sourceD_wadr_bits_beat[2]};
  wire [3:0]  sourceD_wreq_bankSel = io_sourceD_wadr_valid ? 4'h1 << _GEN_3 & {4{io_sourceD_wadr_bits_mask}} : 4'h0;
  wire [3:0]  sourceD_wreq_bankEn = sourceD_wreq_bankSel & sourceD_wreq_ready;
  assign sinkD_req_bankSum = sourceC_req_bankSel | sourceC_req_bankSum;
  assign sourceD_wreq_bankSum = sinkD_req_bankSel | sinkD_req_bankSum;
  assign sourceD_rreq_bankSum = sourceD_wreq_bankSel | sourceD_wreq_bankSum;
  wire        regout_en = sinkC_req_bankEn[0] | sourceC_req_bankEn[0] | sinkD_req_bankEn[0] | sourceD_wreq_bankEn[0] | sourceD_rreq_bankEn[0];
  wire        regout_wen = sourceC_req_bankSum[0] | ~(sourceC_req_bankSel[0]) & (sinkD_req_bankSel[0] | sourceD_wreq_bankSel[0]);
  assign writeEnable_2 = regout_wen & regout_en;
  assign readEnable_2 = ~regout_wen & regout_en;
  reg         regout_REG;
  reg  [63:0] regout_r;
  wire        regout_en_1 = sinkC_req_bankEn[1] | sourceC_req_bankEn[1] | sinkD_req_bankEn[1] | sourceD_wreq_bankEn[1] | sourceD_rreq_bankEn[1];
  wire        regout_wen_1 = sourceC_req_bankSum[1] | ~(sourceC_req_bankSel[1]) & (sinkD_req_bankSel[1] | sourceD_wreq_bankSel[1]);
  assign writeEnable_1 = regout_wen_1 & regout_en_1;
  assign readEnable_1 = ~regout_wen_1 & regout_en_1;
  reg         regout_REG_1;
  reg  [63:0] regout_r_1;
  wire        regout_en_2 = sinkC_req_bankEn[2] | sourceC_req_bankEn[2] | sinkD_req_bankEn[2] | sourceD_wreq_bankEn[2] | sourceD_rreq_bankEn[2];
  wire        regout_wen_2 = sourceC_req_bankSum[2] | ~(sourceC_req_bankSel[2]) & (sinkD_req_bankSel[2] | sourceD_wreq_bankSel[2]);
  assign writeEnable_0 = regout_wen_2 & regout_en_2;
  assign readEnable_0 = ~regout_wen_2 & regout_en_2;
  reg         regout_REG_2;
  reg  [63:0] regout_r_2;
  wire        regout_en_3 = sinkC_req_bankEn[3] | sourceC_req_bankEn[3] | sinkD_req_bankEn[3] | sourceD_wreq_bankEn[3] | sourceD_rreq_bankEn[3];
  wire        regout_wen_3 = sourceC_req_bankSum[3] | ~(sourceC_req_bankSel[3]) & (sinkD_req_bankSel[3] | sourceD_wreq_bankSel[3]);
  assign writeEnable = regout_wen_3 & regout_en_3;
  assign readEnable = ~regout_wen_3 & regout_en_3;
  reg         regout_REG_3;
  reg  [63:0] regout_r_3;
  reg  [3:0]  regsel_sourceC_REG;
  reg  [3:0]  regsel_sourceC;
  reg  [3:0]  regsel_sourceD_REG;
  reg  [3:0]  regsel_sourceD;
  always @(posedge clock) begin
    regout_REG <= ~regout_wen & regout_en;
    if (regout_REG)
      regout_r <= _cc_banks_0_ext_RW0_rdata;
    regout_REG_1 <= ~regout_wen_1 & regout_en_1;
    if (regout_REG_1)
      regout_r_1 <= _cc_banks_1_ext_RW0_rdata;
    regout_REG_2 <= ~regout_wen_2 & regout_en_2;
    if (regout_REG_2)
      regout_r_2 <= _cc_banks_2_ext_RW0_rdata;
    regout_REG_3 <= ~regout_wen_3 & regout_en_3;
    if (regout_REG_3)
      regout_r_3 <= _cc_banks_3_ext_RW0_rdata;
    regsel_sourceC_REG <= sourceC_req_bankEn;
    regsel_sourceC <= regsel_sourceC_REG;
    regsel_sourceD_REG <= sourceD_rreq_bankEn;
    regsel_sourceD <= regsel_sourceD_REG;
  end // always @(posedge)
  cc_banks_16384x64 cc_banks_0_ext (
    .RW0_addr  (sourceC_req_bankSum[0] ? sinkC_req_index : sourceC_req_bankSel[0] ? sourceC_req_index : sinkD_req_bankSel[0] ? sinkD_req_index : sourceD_wreq_bankSel[0] ? sourceD_wreq_index : sourceD_rreq_index),
    .RW0_en    (readEnable_2 | writeEnable_2),
    .RW0_clk   (clock),
    .RW0_wmode (regout_wen),
    .RW0_wdata (sourceC_req_bankSum[0] ? io_sinkC_dat_data : sourceC_req_bankSel[0] ? 64'h0 : sinkD_req_bankSel[0] ? io_sinkD_dat_data : sourceD_wreq_bankSel[0] ? io_sourceD_wdat_data : 64'h0),
    .RW0_rdata (_cc_banks_0_ext_RW0_rdata)
  );
  cc_banks_16384x64 cc_banks_1_ext (
    .RW0_addr  (sourceC_req_bankSum[1] ? sinkC_req_index : sourceC_req_bankSel[1] ? sourceC_req_index : sinkD_req_bankSel[1] ? sinkD_req_index : sourceD_wreq_bankSel[1] ? sourceD_wreq_index : sourceD_rreq_index),
    .RW0_en    (readEnable_1 | writeEnable_1),
    .RW0_clk   (clock),
    .RW0_wmode (regout_wen_1),
    .RW0_wdata (sourceC_req_bankSum[1] ? io_sinkC_dat_data : sourceC_req_bankSel[1] ? 64'h0 : sinkD_req_bankSel[1] ? io_sinkD_dat_data : sourceD_wreq_bankSel[1] ? io_sourceD_wdat_data : 64'h0),
    .RW0_rdata (_cc_banks_1_ext_RW0_rdata)
  );
  cc_banks_16384x64 cc_banks_2_ext (
    .RW0_addr  (sourceC_req_bankSum[2] ? sinkC_req_index : sourceC_req_bankSel[2] ? sourceC_req_index : sinkD_req_bankSel[2] ? sinkD_req_index : sourceD_wreq_bankSel[2] ? sourceD_wreq_index : sourceD_rreq_index),
    .RW0_en    (readEnable_0 | writeEnable_0),
    .RW0_clk   (clock),
    .RW0_wmode (regout_wen_2),
    .RW0_wdata (sourceC_req_bankSum[2] ? io_sinkC_dat_data : sourceC_req_bankSel[2] ? 64'h0 : sinkD_req_bankSel[2] ? io_sinkD_dat_data : sourceD_wreq_bankSel[2] ? io_sourceD_wdat_data : 64'h0),
    .RW0_rdata (_cc_banks_2_ext_RW0_rdata)
  );
  cc_banks_16384x64 cc_banks_3_ext (
    .RW0_addr  (sourceC_req_bankSum[3] ? sinkC_req_index : sourceC_req_bankSel[3] ? sourceC_req_index : sinkD_req_bankSel[3] ? sinkD_req_index : sourceD_wreq_bankSel[3] ? sourceD_wreq_index : sourceD_rreq_index),
    .RW0_en    (readEnable | writeEnable),
    .RW0_clk   (clock),
    .RW0_wmode (regout_wen_3),
    .RW0_wdata (sourceC_req_bankSum[3] ? io_sinkC_dat_data : sourceC_req_bankSel[3] ? 64'h0 : sinkD_req_bankSel[3] ? io_sinkD_dat_data : sourceD_wreq_bankSel[3] ? io_sourceD_wdat_data : 64'h0),
    .RW0_rdata (_cc_banks_3_ext_RW0_rdata)
  );
  assign io_sinkC_adr_ready = _sinkC_req_io_sinkC_adr_ready_T_1[0];
  assign io_sinkD_adr_ready = _sinkD_req_io_sinkD_adr_ready_T_1[0];
  assign io_sourceC_adr_ready = _sourceC_req_io_sourceC_adr_ready_T_1[0];
  assign io_sourceC_dat_data = (regsel_sourceC[0] ? regout_r : 64'h0) | (regsel_sourceC[1] ? regout_r_1 : 64'h0) | (regsel_sourceC[2] ? regout_r_2 : 64'h0) | (regsel_sourceC[3] ? regout_r_3 : 64'h0);
  assign io_sourceD_radr_ready = _sourceD_rreq_io_sourceD_radr_ready_T_1[0];
  assign io_sourceD_rdat_data = (regsel_sourceD[0] ? regout_r : 64'h0) | (regsel_sourceD[1] ? regout_r_1 : 64'h0) | (regsel_sourceD[2] ? regout_r_2 : 64'h0) | (regsel_sourceD[3] ? regout_r_3 : 64'h0);
  assign io_sourceD_wadr_ready = _sourceD_wreq_io_sourceD_wadr_ready_T_1[0];
endmodule

