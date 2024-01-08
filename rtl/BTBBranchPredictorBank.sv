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

module BTBBranchPredictorBank(
  input          clock,
                 reset,
                 io_f0_valid,
  input  [39:0]  io_f0_pc,
  input          io_resp_in_0_f1_0_taken,
                 io_resp_in_0_f1_0_is_br,
                 io_resp_in_0_f1_0_is_jal,
                 io_resp_in_0_f1_0_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f1_0_predicted_pc_bits,
  input          io_resp_in_0_f1_1_taken,
                 io_resp_in_0_f1_1_is_br,
                 io_resp_in_0_f1_1_is_jal,
                 io_resp_in_0_f1_1_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f1_1_predicted_pc_bits,
  input          io_resp_in_0_f1_2_taken,
                 io_resp_in_0_f1_2_is_br,
                 io_resp_in_0_f1_2_is_jal,
                 io_resp_in_0_f1_2_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f1_2_predicted_pc_bits,
  input          io_resp_in_0_f1_3_taken,
                 io_resp_in_0_f1_3_is_br,
                 io_resp_in_0_f1_3_is_jal,
                 io_resp_in_0_f1_3_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f1_3_predicted_pc_bits,
  input          io_resp_in_0_f2_0_taken,
                 io_resp_in_0_f2_0_is_br,
                 io_resp_in_0_f2_0_is_jal,
                 io_resp_in_0_f2_0_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f2_0_predicted_pc_bits,
  input          io_resp_in_0_f2_1_taken,
                 io_resp_in_0_f2_1_is_br,
                 io_resp_in_0_f2_1_is_jal,
                 io_resp_in_0_f2_1_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f2_1_predicted_pc_bits,
  input          io_resp_in_0_f2_2_taken,
                 io_resp_in_0_f2_2_is_br,
                 io_resp_in_0_f2_2_is_jal,
                 io_resp_in_0_f2_2_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f2_2_predicted_pc_bits,
  input          io_resp_in_0_f2_3_taken,
                 io_resp_in_0_f2_3_is_br,
                 io_resp_in_0_f2_3_is_jal,
                 io_resp_in_0_f2_3_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f2_3_predicted_pc_bits,
  input          io_resp_in_0_f3_0_taken,
                 io_resp_in_0_f3_0_is_br,
                 io_resp_in_0_f3_0_is_jal,
                 io_resp_in_0_f3_0_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f3_0_predicted_pc_bits,
  input          io_resp_in_0_f3_1_taken,
                 io_resp_in_0_f3_1_is_br,
                 io_resp_in_0_f3_1_is_jal,
                 io_resp_in_0_f3_1_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f3_1_predicted_pc_bits,
  input          io_resp_in_0_f3_2_taken,
                 io_resp_in_0_f3_2_is_br,
                 io_resp_in_0_f3_2_is_jal,
                 io_resp_in_0_f3_2_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f3_2_predicted_pc_bits,
  input          io_resp_in_0_f3_3_taken,
                 io_resp_in_0_f3_3_is_br,
                 io_resp_in_0_f3_3_is_jal,
                 io_resp_in_0_f3_3_predicted_pc_valid,
  input  [39:0]  io_resp_in_0_f3_3_predicted_pc_bits,
  output         io_resp_f1_0_taken,
                 io_resp_f1_0_is_br,
                 io_resp_f1_0_is_jal,
                 io_resp_f1_0_predicted_pc_valid,
  output [39:0]  io_resp_f1_0_predicted_pc_bits,
  output         io_resp_f1_1_taken,
                 io_resp_f1_1_is_br,
                 io_resp_f1_1_is_jal,
                 io_resp_f1_1_predicted_pc_valid,
  output [39:0]  io_resp_f1_1_predicted_pc_bits,
  output         io_resp_f1_2_taken,
                 io_resp_f1_2_is_br,
                 io_resp_f1_2_is_jal,
                 io_resp_f1_2_predicted_pc_valid,
  output [39:0]  io_resp_f1_2_predicted_pc_bits,
  output         io_resp_f1_3_taken,
                 io_resp_f1_3_is_br,
                 io_resp_f1_3_is_jal,
                 io_resp_f1_3_predicted_pc_valid,
  output [39:0]  io_resp_f1_3_predicted_pc_bits,
  output         io_resp_f2_0_taken,
                 io_resp_f2_0_is_br,
                 io_resp_f2_0_is_jal,
                 io_resp_f2_0_predicted_pc_valid,
  output [39:0]  io_resp_f2_0_predicted_pc_bits,
  output         io_resp_f2_1_taken,
                 io_resp_f2_1_is_br,
                 io_resp_f2_1_is_jal,
                 io_resp_f2_1_predicted_pc_valid,
  output [39:0]  io_resp_f2_1_predicted_pc_bits,
  output         io_resp_f2_2_taken,
                 io_resp_f2_2_is_br,
                 io_resp_f2_2_is_jal,
                 io_resp_f2_2_predicted_pc_valid,
  output [39:0]  io_resp_f2_2_predicted_pc_bits,
  output         io_resp_f2_3_taken,
                 io_resp_f2_3_is_br,
                 io_resp_f2_3_is_jal,
                 io_resp_f2_3_predicted_pc_valid,
  output [39:0]  io_resp_f2_3_predicted_pc_bits,
  output         io_resp_f3_0_taken,
                 io_resp_f3_0_is_br,
                 io_resp_f3_0_is_jal,
                 io_resp_f3_0_predicted_pc_valid,
  output [39:0]  io_resp_f3_0_predicted_pc_bits,
  output         io_resp_f3_1_taken,
                 io_resp_f3_1_is_br,
                 io_resp_f3_1_is_jal,
                 io_resp_f3_1_predicted_pc_valid,
  output [39:0]  io_resp_f3_1_predicted_pc_bits,
  output         io_resp_f3_2_taken,
                 io_resp_f3_2_is_br,
                 io_resp_f3_2_is_jal,
                 io_resp_f3_2_predicted_pc_valid,
  output [39:0]  io_resp_f3_2_predicted_pc_bits,
  output         io_resp_f3_3_taken,
                 io_resp_f3_3_is_br,
                 io_resp_f3_3_is_jal,
                 io_resp_f3_3_predicted_pc_valid,
  output [39:0]  io_resp_f3_3_predicted_pc_bits,
  output [119:0] io_f3_meta,
  input          io_update_valid,
                 io_update_bits_is_mispredict_update,
                 io_update_bits_is_repair_update,
  input  [3:0]   io_update_bits_btb_mispredicts,
  input  [39:0]  io_update_bits_pc,
  input  [3:0]   io_update_bits_br_mask,
  input          io_update_bits_cfi_idx_valid,
  input  [1:0]   io_update_bits_cfi_idx_bits,
  input          io_update_bits_cfi_taken,
  input  [39:0]  io_update_bits_target,
  input  [119:0] io_update_bits_meta
);

  wire [29:0]  meta_1_MPORT_3_data_3;
  wire [29:0]  meta_1_MPORT_3_data_2;
  wire [29:0]  meta_1_MPORT_3_data_1;
  wire [29:0]  meta_1_MPORT_3_data_0;
  wire [13:0]  btb_1_MPORT_2_data_3;
  wire [13:0]  btb_1_MPORT_2_data_2;
  wire [13:0]  btb_1_MPORT_2_data_1;
  wire [13:0]  btb_1_MPORT_2_data_0;
  wire [29:0]  meta_0_MPORT_1_data_3;
  wire [29:0]  meta_0_MPORT_1_data_2;
  wire [29:0]  meta_0_MPORT_1_data_1;
  wire [29:0]  meta_0_MPORT_1_data_0;
  wire [13:0]  btb_0_MPORT_data_3;
  wire [13:0]  btb_0_MPORT_data_2;
  wire [13:0]  btb_0_MPORT_data_1;
  wire [13:0]  btb_0_MPORT_data_0;
  wire [39:0]  _ebtb_ext_R0_data;
  wire [55:0]  _btb_1_ext_R0_data;
  wire [55:0]  _btb_0_ext_R0_data;
  wire [119:0] _meta_1_ext_R0_data;
  wire [119:0] _meta_0_ext_R0_data;
  reg  [35:0]  s1_idx;
  reg          s1_valid;
  reg  [39:0]  s1_pc;
  reg          s1_update_valid;
  reg          s1_update_bits_is_mispredict_update;
  reg          s1_update_bits_is_repair_update;
  reg  [3:0]   s1_update_bits_btb_mispredicts;
  reg  [39:0]  s1_update_bits_pc;
  reg  [3:0]   s1_update_bits_br_mask;
  reg          s1_update_bits_cfi_idx_valid;
  reg  [1:0]   s1_update_bits_cfi_idx_bits;
  reg          s1_update_bits_cfi_taken;
  reg  [39:0]  s1_update_bits_target;
  reg  [119:0] s1_update_bits_meta;
  reg  [35:0]  s1_update_idx;
  reg          f3_meta_REG_write_way;
  reg          f3_meta_write_way;
  reg          doing_reset;
  reg  [6:0]   reset_idx;
  reg          REG;
  reg          io_resp_f2_0_predicted_pc_REG_valid;
  reg  [39:0]  io_resp_f2_0_predicted_pc_REG_bits;
  wire         _io_resp_f2_0_predicted_pc_valid_output = REG ? io_resp_f2_0_predicted_pc_REG_valid : io_resp_in_0_f2_0_predicted_pc_valid;
  wire [39:0]  _io_resp_f2_0_predicted_pc_bits_output = REG ? io_resp_f2_0_predicted_pc_REG_bits : io_resp_in_0_f2_0_predicted_pc_bits;
  reg          io_resp_f2_0_is_br_REG;
  wire         _io_resp_f2_0_is_br_output = REG ? io_resp_f2_0_is_br_REG : io_resp_in_0_f2_0_is_br;
  reg          io_resp_f2_0_is_jal_REG;
  wire         _io_resp_f2_0_is_jal_output = REG ? io_resp_f2_0_is_jal_REG : io_resp_in_0_f2_0_is_jal;
  reg          REG_1;
  reg          REG_2;
  reg          REG_3;
  reg          io_resp_f3_0_predicted_pc_REG_valid;
  reg  [39:0]  io_resp_f3_0_predicted_pc_REG_bits;
  reg          io_resp_f3_0_is_br_REG;
  reg          io_resp_f3_0_is_jal_REG;
  reg          REG_4;
  reg          REG_5;
  reg          REG_6;
  reg          io_resp_f2_1_predicted_pc_REG_valid;
  reg  [39:0]  io_resp_f2_1_predicted_pc_REG_bits;
  wire         _io_resp_f2_1_predicted_pc_valid_output = REG_6 ? io_resp_f2_1_predicted_pc_REG_valid : io_resp_in_0_f2_1_predicted_pc_valid;
  wire [39:0]  _io_resp_f2_1_predicted_pc_bits_output = REG_6 ? io_resp_f2_1_predicted_pc_REG_bits : io_resp_in_0_f2_1_predicted_pc_bits;
  reg          io_resp_f2_1_is_br_REG;
  wire         _io_resp_f2_1_is_br_output = REG_6 ? io_resp_f2_1_is_br_REG : io_resp_in_0_f2_1_is_br;
  reg          io_resp_f2_1_is_jal_REG;
  wire         _io_resp_f2_1_is_jal_output = REG_6 ? io_resp_f2_1_is_jal_REG : io_resp_in_0_f2_1_is_jal;
  reg          REG_7;
  reg          REG_8;
  reg          REG_9;
  reg          io_resp_f3_1_predicted_pc_REG_valid;
  reg  [39:0]  io_resp_f3_1_predicted_pc_REG_bits;
  reg          io_resp_f3_1_is_br_REG;
  reg          io_resp_f3_1_is_jal_REG;
  reg          REG_10;
  reg          REG_11;
  reg          REG_12;
  reg          io_resp_f2_2_predicted_pc_REG_valid;
  reg  [39:0]  io_resp_f2_2_predicted_pc_REG_bits;
  wire         _io_resp_f2_2_predicted_pc_valid_output = REG_12 ? io_resp_f2_2_predicted_pc_REG_valid : io_resp_in_0_f2_2_predicted_pc_valid;
  wire [39:0]  _io_resp_f2_2_predicted_pc_bits_output = REG_12 ? io_resp_f2_2_predicted_pc_REG_bits : io_resp_in_0_f2_2_predicted_pc_bits;
  reg          io_resp_f2_2_is_br_REG;
  wire         _io_resp_f2_2_is_br_output = REG_12 ? io_resp_f2_2_is_br_REG : io_resp_in_0_f2_2_is_br;
  reg          io_resp_f2_2_is_jal_REG;
  wire         _io_resp_f2_2_is_jal_output = REG_12 ? io_resp_f2_2_is_jal_REG : io_resp_in_0_f2_2_is_jal;
  reg          REG_13;
  reg          REG_14;
  reg          REG_15;
  reg          io_resp_f3_2_predicted_pc_REG_valid;
  reg  [39:0]  io_resp_f3_2_predicted_pc_REG_bits;
  reg          io_resp_f3_2_is_br_REG;
  reg          io_resp_f3_2_is_jal_REG;
  reg          REG_16;
  reg          REG_17;
  reg          REG_18;
  reg          io_resp_f2_3_predicted_pc_REG_valid;
  reg  [39:0]  io_resp_f2_3_predicted_pc_REG_bits;
  wire         _io_resp_f2_3_predicted_pc_valid_output = REG_18 ? io_resp_f2_3_predicted_pc_REG_valid : io_resp_in_0_f2_3_predicted_pc_valid;
  wire [39:0]  _io_resp_f2_3_predicted_pc_bits_output = REG_18 ? io_resp_f2_3_predicted_pc_REG_bits : io_resp_in_0_f2_3_predicted_pc_bits;
  reg          io_resp_f2_3_is_br_REG;
  wire         _io_resp_f2_3_is_br_output = REG_18 ? io_resp_f2_3_is_br_REG : io_resp_in_0_f2_3_is_br;
  reg          io_resp_f2_3_is_jal_REG;
  wire         _io_resp_f2_3_is_jal_output = REG_18 ? io_resp_f2_3_is_jal_REG : io_resp_in_0_f2_3_is_jal;
  reg          REG_19;
  reg          REG_20;
  reg          REG_21;
  reg          io_resp_f3_3_predicted_pc_REG_valid;
  reg  [39:0]  io_resp_f3_3_predicted_pc_REG_bits;
  reg          io_resp_f3_3_is_br_REG;
  reg          io_resp_f3_3_is_jal_REG;
  reg          REG_22;
  reg          REG_23;
  wire [39:0]  _new_offset_value_T_5 = s1_update_bits_target - (s1_update_bits_pc + {37'h0, s1_update_bits_cfi_idx_bits, 1'h0});
  wire         s1_update_wbtb_data_extended = $signed(_new_offset_value_T_5) > 40'shFFF | $signed(_new_offset_value_T_5) < -40'sh1000;
  wire         _s1_update_wmeta_mask_T_1 = s1_update_bits_is_mispredict_update | s1_update_bits_is_repair_update;
  wire [3:0]   s1_update_wbtb_mask = 4'h1 << s1_update_bits_cfi_idx_bits & {4{s1_update_bits_cfi_idx_valid & s1_update_valid & s1_update_bits_cfi_taken & ~(_s1_update_wmeta_mask_T_1 | (|s1_update_bits_btb_mispredicts))}};
  wire         btb_0_MPORT_en = doing_reset | ~(s1_update_bits_meta[0]);
  wire [6:0]   btb_1_MPORT_2_addr = doing_reset ? reset_idx : s1_update_idx[6:0];
  wire [13:0]  _GEN = {_new_offset_value_T_5[12:0], s1_update_wbtb_data_extended};
  assign btb_0_MPORT_data_0 = doing_reset ? 14'h0 : _GEN;
  assign btb_0_MPORT_data_1 = doing_reset ? 14'h0 : _GEN;
  assign btb_0_MPORT_data_2 = doing_reset ? 14'h0 : _GEN;
  assign btb_0_MPORT_data_3 = doing_reset ? 14'h0 : _GEN;
  wire [3:0]   _GEN_0 = doing_reset ? 4'hF : s1_update_wbtb_mask;
  wire [29:0]  _GEN_1 = {s1_update_bits_br_mask[0], s1_update_bits_btb_mispredicts[0] ? 29'h0 : s1_update_idx[35:7]};
  wire [29:0]  _GEN_2 = {s1_update_bits_br_mask[1], s1_update_bits_btb_mispredicts[1] ? 29'h0 : s1_update_idx[35:7]};
  wire [29:0]  _GEN_3 = {s1_update_bits_br_mask[2], s1_update_bits_btb_mispredicts[2] ? 29'h0 : s1_update_idx[35:7]};
  wire [29:0]  _GEN_4 = {s1_update_bits_br_mask[3], s1_update_bits_btb_mispredicts[3] ? 29'h0 : s1_update_idx[35:7]};
  assign meta_0_MPORT_1_data_0 = doing_reset ? 30'h0 : _GEN_1;
  assign meta_0_MPORT_1_data_1 = doing_reset ? 30'h0 : _GEN_2;
  assign meta_0_MPORT_1_data_2 = doing_reset ? 30'h0 : _GEN_3;
  assign meta_0_MPORT_1_data_3 = doing_reset ? 30'h0 : _GEN_4;
  wire [3:0]   _GEN_5 = doing_reset ? 4'hF : (s1_update_wbtb_mask | s1_update_bits_br_mask) & ({4{s1_update_valid & ~(_s1_update_wmeta_mask_T_1 | (|s1_update_bits_btb_mispredicts))}} | {4{s1_update_valid}} & s1_update_bits_btb_mispredicts);
  wire         btb_1_MPORT_2_en = doing_reset | s1_update_bits_meta[0];
  assign btb_1_MPORT_2_data_0 = doing_reset ? 14'h0 : _GEN;
  assign btb_1_MPORT_2_data_1 = doing_reset ? 14'h0 : _GEN;
  assign btb_1_MPORT_2_data_2 = doing_reset ? 14'h0 : _GEN;
  assign btb_1_MPORT_2_data_3 = doing_reset ? 14'h0 : _GEN;
  assign meta_1_MPORT_3_data_0 = doing_reset ? 30'h0 : _GEN_1;
  assign meta_1_MPORT_3_data_1 = doing_reset ? 30'h0 : _GEN_2;
  assign meta_1_MPORT_3_data_2 = doing_reset ? 30'h0 : _GEN_3;
  assign meta_1_MPORT_3_data_3 = doing_reset ? 30'h0 : _GEN_4;
  wire         s1_hit_ohs_0_0 = _meta_0_ext_R0_data[28:0] == s1_idx[35:7];
  wire         s1_hit_ohs_1_0 = _meta_0_ext_R0_data[58:30] == s1_idx[35:7];
  wire         s1_hit_ohs_2_0 = _meta_0_ext_R0_data[88:60] == s1_idx[35:7];
  wire         s1_hit_ohs_3_0 = _meta_0_ext_R0_data[118:90] == s1_idx[35:7];
  wire         s1_hits_0 = s1_hit_ohs_0_0 | _meta_1_ext_R0_data[28:0] == s1_idx[35:7];
  wire         s1_hits_1 = s1_hit_ohs_1_0 | _meta_1_ext_R0_data[58:30] == s1_idx[35:7];
  wire         s1_hits_2 = s1_hit_ohs_2_0 | _meta_1_ext_R0_data[88:60] == s1_idx[35:7];
  wire         s1_hits_3 = s1_hit_ohs_3_0 | _meta_1_ext_R0_data[118:90] == s1_idx[35:7];
  wire         s1_resp_0_valid = ~doing_reset & s1_valid & s1_hits_0;
  wire [12:0]  _GEN_6 = s1_hit_ohs_0_0 ? _btb_0_ext_R0_data[13:1] : _btb_1_ext_R0_data[13:1];
  wire         _GEN_7 = s1_hit_ohs_0_0 ? _meta_0_ext_R0_data[29] : _meta_1_ext_R0_data[29];
  wire         s1_is_jal_0 = ~doing_reset & s1_resp_0_valid & ~_GEN_7;
  wire         s1_resp_1_valid = ~doing_reset & s1_valid & s1_hits_1;
  wire [12:0]  _GEN_8 = s1_hit_ohs_1_0 ? _btb_0_ext_R0_data[27:15] : _btb_1_ext_R0_data[27:15];
  wire         _GEN_9 = s1_hit_ohs_1_0 ? _meta_0_ext_R0_data[59] : _meta_1_ext_R0_data[59];
  wire         s1_is_jal_1 = ~doing_reset & s1_resp_1_valid & ~_GEN_9;
  wire         s1_resp_2_valid = ~doing_reset & s1_valid & s1_hits_2;
  wire [12:0]  _GEN_10 = s1_hit_ohs_2_0 ? _btb_0_ext_R0_data[41:29] : _btb_1_ext_R0_data[41:29];
  wire         _GEN_11 = s1_hit_ohs_2_0 ? _meta_0_ext_R0_data[89] : _meta_1_ext_R0_data[89];
  wire         s1_is_jal_2 = ~doing_reset & s1_resp_2_valid & ~_GEN_11;
  wire         s1_resp_3_valid = ~doing_reset & s1_valid & s1_hits_3;
  wire [12:0]  _GEN_12 = s1_hit_ohs_3_0 ? _btb_0_ext_R0_data[55:43] : _btb_1_ext_R0_data[55:43];
  wire         _GEN_13 = s1_hit_ohs_3_0 ? _meta_0_ext_R0_data[119] : _meta_1_ext_R0_data[119];
  wire         s1_is_jal_3 = ~doing_reset & s1_resp_3_valid & ~_GEN_13;
  wire         alloc_way =
    s1_idx[7] ^ s1_idx[8] ^ s1_idx[9] ^ s1_idx[10] ^ s1_idx[11] ^ s1_idx[12] ^ s1_idx[13] ^ s1_idx[14] ^ s1_idx[15] ^ s1_idx[16] ^ s1_idx[17] ^ s1_idx[18] ^ s1_idx[19] ^ s1_idx[20] ^ s1_idx[21] ^ s1_idx[22] ^ s1_idx[23] ^ s1_idx[24] ^ s1_idx[25] ^ s1_idx[26] ^ s1_idx[27] ^ s1_idx[28] ^ s1_idx[29] ^ s1_idx[30] ^ s1_idx[31] ^ s1_idx[32] ^ s1_idx[33] ^ s1_idx[34] ^ s1_idx[35] ^ _meta_0_ext_R0_data[0] ^ _meta_0_ext_R0_data[1] ^ _meta_0_ext_R0_data[2] ^ _meta_0_ext_R0_data[3] ^ _meta_0_ext_R0_data[4] ^ _meta_0_ext_R0_data[5] ^ _meta_0_ext_R0_data[6] ^ _meta_0_ext_R0_data[7] ^ _meta_0_ext_R0_data[8] ^ _meta_0_ext_R0_data[9] ^ _meta_0_ext_R0_data[10] ^ _meta_0_ext_R0_data[11] ^ _meta_0_ext_R0_data[12] ^ _meta_0_ext_R0_data[13] ^ _meta_0_ext_R0_data[14] ^ _meta_0_ext_R0_data[15] ^ _meta_0_ext_R0_data[16] ^ _meta_0_ext_R0_data[17] ^ _meta_0_ext_R0_data[18] ^ _meta_0_ext_R0_data[19] ^ _meta_0_ext_R0_data[20] ^ _meta_0_ext_R0_data[21] ^ _meta_0_ext_R0_data[22] ^ _meta_0_ext_R0_data[23] ^ _meta_0_ext_R0_data[24] ^ _meta_0_ext_R0_data[25] ^ _meta_0_ext_R0_data[26] ^ _meta_0_ext_R0_data[27] ^ _meta_0_ext_R0_data[28] ^ _meta_0_ext_R0_data[30] ^ _meta_0_ext_R0_data[31] ^ _meta_0_ext_R0_data[32] ^ _meta_0_ext_R0_data[33] ^ _meta_0_ext_R0_data[34] ^ _meta_0_ext_R0_data[35] ^ _meta_0_ext_R0_data[36] ^ _meta_0_ext_R0_data[37] ^ _meta_0_ext_R0_data[38] ^ _meta_0_ext_R0_data[39] ^ _meta_0_ext_R0_data[40] ^ _meta_0_ext_R0_data[41] ^ _meta_0_ext_R0_data[42] ^ _meta_0_ext_R0_data[43] ^ _meta_0_ext_R0_data[44] ^ _meta_0_ext_R0_data[45] ^ _meta_0_ext_R0_data[46] ^ _meta_0_ext_R0_data[47] ^ _meta_0_ext_R0_data[48] ^ _meta_0_ext_R0_data[49] ^ _meta_0_ext_R0_data[50] ^ _meta_0_ext_R0_data[51] ^ _meta_0_ext_R0_data[52] ^ _meta_0_ext_R0_data[53] ^ _meta_0_ext_R0_data[54] ^ _meta_0_ext_R0_data[55] ^ _meta_0_ext_R0_data[56] ^ _meta_0_ext_R0_data[57] ^ _meta_0_ext_R0_data[58] ^ _meta_0_ext_R0_data[60] ^ _meta_0_ext_R0_data[61] ^ _meta_0_ext_R0_data[62] ^ _meta_0_ext_R0_data[63] ^ _meta_0_ext_R0_data[64] ^ _meta_0_ext_R0_data[65]
    ^ _meta_0_ext_R0_data[66] ^ _meta_0_ext_R0_data[67] ^ _meta_0_ext_R0_data[68] ^ _meta_0_ext_R0_data[69] ^ _meta_0_ext_R0_data[70] ^ _meta_0_ext_R0_data[71] ^ _meta_0_ext_R0_data[72] ^ _meta_0_ext_R0_data[73] ^ _meta_0_ext_R0_data[74] ^ _meta_0_ext_R0_data[75] ^ _meta_0_ext_R0_data[76] ^ _meta_0_ext_R0_data[77] ^ _meta_0_ext_R0_data[78] ^ _meta_0_ext_R0_data[79] ^ _meta_0_ext_R0_data[80] ^ _meta_0_ext_R0_data[81] ^ _meta_0_ext_R0_data[82] ^ _meta_0_ext_R0_data[83] ^ _meta_0_ext_R0_data[84] ^ _meta_0_ext_R0_data[85] ^ _meta_0_ext_R0_data[86] ^ _meta_0_ext_R0_data[87] ^ _meta_0_ext_R0_data[88] ^ _meta_0_ext_R0_data[90] ^ _meta_0_ext_R0_data[91] ^ _meta_0_ext_R0_data[92] ^ _meta_0_ext_R0_data[93] ^ _meta_0_ext_R0_data[94] ^ _meta_0_ext_R0_data[95] ^ _meta_0_ext_R0_data[96] ^ _meta_0_ext_R0_data[97] ^ _meta_0_ext_R0_data[98] ^ _meta_0_ext_R0_data[99] ^ _meta_0_ext_R0_data[100] ^ _meta_0_ext_R0_data[101] ^ _meta_0_ext_R0_data[102] ^ _meta_0_ext_R0_data[103] ^ _meta_0_ext_R0_data[104] ^ _meta_0_ext_R0_data[105] ^ _meta_0_ext_R0_data[106] ^ _meta_0_ext_R0_data[107] ^ _meta_0_ext_R0_data[108] ^ _meta_0_ext_R0_data[109] ^ _meta_0_ext_R0_data[110] ^ _meta_0_ext_R0_data[111] ^ _meta_0_ext_R0_data[112] ^ _meta_0_ext_R0_data[113] ^ _meta_0_ext_R0_data[114] ^ _meta_0_ext_R0_data[115] ^ _meta_0_ext_R0_data[116] ^ _meta_0_ext_R0_data[117] ^ _meta_0_ext_R0_data[118] ^ _meta_1_ext_R0_data[0] ^ _meta_1_ext_R0_data[1] ^ _meta_1_ext_R0_data[2] ^ _meta_1_ext_R0_data[3] ^ _meta_1_ext_R0_data[4] ^ _meta_1_ext_R0_data[5] ^ _meta_1_ext_R0_data[6] ^ _meta_1_ext_R0_data[7] ^ _meta_1_ext_R0_data[8] ^ _meta_1_ext_R0_data[9] ^ _meta_1_ext_R0_data[10] ^ _meta_1_ext_R0_data[11] ^ _meta_1_ext_R0_data[12] ^ _meta_1_ext_R0_data[13] ^ _meta_1_ext_R0_data[14] ^ _meta_1_ext_R0_data[15] ^ _meta_1_ext_R0_data[16] ^ _meta_1_ext_R0_data[17] ^ _meta_1_ext_R0_data[18] ^ _meta_1_ext_R0_data[19] ^ _meta_1_ext_R0_data[20] ^ _meta_1_ext_R0_data[21] ^ _meta_1_ext_R0_data[22] ^ _meta_1_ext_R0_data[23] ^ _meta_1_ext_R0_data[24] ^ _meta_1_ext_R0_data[25]
    ^ _meta_1_ext_R0_data[26] ^ _meta_1_ext_R0_data[27] ^ _meta_1_ext_R0_data[28] ^ _meta_1_ext_R0_data[30] ^ _meta_1_ext_R0_data[31] ^ _meta_1_ext_R0_data[32] ^ _meta_1_ext_R0_data[33] ^ _meta_1_ext_R0_data[34] ^ _meta_1_ext_R0_data[35] ^ _meta_1_ext_R0_data[36] ^ _meta_1_ext_R0_data[37] ^ _meta_1_ext_R0_data[38] ^ _meta_1_ext_R0_data[39] ^ _meta_1_ext_R0_data[40] ^ _meta_1_ext_R0_data[41] ^ _meta_1_ext_R0_data[42] ^ _meta_1_ext_R0_data[43] ^ _meta_1_ext_R0_data[44] ^ _meta_1_ext_R0_data[45] ^ _meta_1_ext_R0_data[46] ^ _meta_1_ext_R0_data[47] ^ _meta_1_ext_R0_data[48] ^ _meta_1_ext_R0_data[49] ^ _meta_1_ext_R0_data[50] ^ _meta_1_ext_R0_data[51] ^ _meta_1_ext_R0_data[52] ^ _meta_1_ext_R0_data[53] ^ _meta_1_ext_R0_data[54] ^ _meta_1_ext_R0_data[55] ^ _meta_1_ext_R0_data[56] ^ _meta_1_ext_R0_data[57] ^ _meta_1_ext_R0_data[58] ^ _meta_1_ext_R0_data[60] ^ _meta_1_ext_R0_data[61] ^ _meta_1_ext_R0_data[62] ^ _meta_1_ext_R0_data[63] ^ _meta_1_ext_R0_data[64] ^ _meta_1_ext_R0_data[65] ^ _meta_1_ext_R0_data[66] ^ _meta_1_ext_R0_data[67] ^ _meta_1_ext_R0_data[68] ^ _meta_1_ext_R0_data[69] ^ _meta_1_ext_R0_data[70] ^ _meta_1_ext_R0_data[71] ^ _meta_1_ext_R0_data[72] ^ _meta_1_ext_R0_data[73] ^ _meta_1_ext_R0_data[74] ^ _meta_1_ext_R0_data[75] ^ _meta_1_ext_R0_data[76] ^ _meta_1_ext_R0_data[77] ^ _meta_1_ext_R0_data[78] ^ _meta_1_ext_R0_data[79] ^ _meta_1_ext_R0_data[80] ^ _meta_1_ext_R0_data[81] ^ _meta_1_ext_R0_data[82] ^ _meta_1_ext_R0_data[83] ^ _meta_1_ext_R0_data[84] ^ _meta_1_ext_R0_data[85] ^ _meta_1_ext_R0_data[86] ^ _meta_1_ext_R0_data[87] ^ _meta_1_ext_R0_data[88] ^ _meta_1_ext_R0_data[90] ^ _meta_1_ext_R0_data[91] ^ _meta_1_ext_R0_data[92] ^ _meta_1_ext_R0_data[93] ^ _meta_1_ext_R0_data[94] ^ _meta_1_ext_R0_data[95] ^ _meta_1_ext_R0_data[96] ^ _meta_1_ext_R0_data[97] ^ _meta_1_ext_R0_data[98] ^ _meta_1_ext_R0_data[99] ^ _meta_1_ext_R0_data[100] ^ _meta_1_ext_R0_data[101] ^ _meta_1_ext_R0_data[102] ^ _meta_1_ext_R0_data[103] ^ _meta_1_ext_R0_data[104] ^ _meta_1_ext_R0_data[105] ^ _meta_1_ext_R0_data[106]
    ^ _meta_1_ext_R0_data[107] ^ _meta_1_ext_R0_data[108] ^ _meta_1_ext_R0_data[109] ^ _meta_1_ext_R0_data[110] ^ _meta_1_ext_R0_data[111] ^ _meta_1_ext_R0_data[112] ^ _meta_1_ext_R0_data[113] ^ _meta_1_ext_R0_data[114] ^ _meta_1_ext_R0_data[115] ^ _meta_1_ext_R0_data[116] ^ _meta_1_ext_R0_data[117] ^ _meta_1_ext_R0_data[118];
  always @(posedge clock) begin
    s1_idx <= io_f0_pc[39:4];
    s1_valid <= io_f0_valid;
    s1_pc <= io_f0_pc;
    s1_update_valid <= io_update_valid;
    s1_update_bits_is_mispredict_update <= io_update_bits_is_mispredict_update;
    s1_update_bits_is_repair_update <= io_update_bits_is_repair_update;
    s1_update_bits_btb_mispredicts <= io_update_bits_btb_mispredicts;
    s1_update_bits_pc <= io_update_bits_pc;
    s1_update_bits_br_mask <= io_update_bits_br_mask;
    s1_update_bits_cfi_idx_valid <= io_update_bits_cfi_idx_valid;
    s1_update_bits_cfi_idx_bits <= io_update_bits_cfi_idx_bits;
    s1_update_bits_cfi_taken <= io_update_bits_cfi_taken;
    s1_update_bits_target <= io_update_bits_target;
    s1_update_bits_meta <= io_update_bits_meta;
    s1_update_idx <= io_update_bits_pc[39:4];
    f3_meta_REG_write_way <= s1_hits_0 | s1_hits_1 | s1_hits_2 | s1_hits_3 ? ~(s1_hit_ohs_0_0 | s1_hit_ohs_1_0 | s1_hit_ohs_2_0 | s1_hit_ohs_3_0) : alloc_way;
    f3_meta_write_way <= f3_meta_REG_write_way;
    REG <= s1_hits_0;
    io_resp_f2_0_predicted_pc_REG_valid <= s1_resp_0_valid;
    io_resp_f2_0_predicted_pc_REG_bits <= (s1_hit_ohs_0_0 ? _btb_0_ext_R0_data[0] : _btb_1_ext_R0_data[0]) ? _ebtb_ext_R0_data : s1_pc + {{27{_GEN_6[12]}}, _GEN_6};
    io_resp_f2_0_is_br_REG <= ~doing_reset & s1_resp_0_valid & _GEN_7;
    io_resp_f2_0_is_jal_REG <= s1_is_jal_0;
    REG_1 <= s1_is_jal_0;
    REG_2 <= s1_hits_0;
    REG_3 <= REG_2;
    io_resp_f3_0_predicted_pc_REG_valid <= _io_resp_f2_0_predicted_pc_valid_output;
    io_resp_f3_0_predicted_pc_REG_bits <= _io_resp_f2_0_predicted_pc_bits_output;
    io_resp_f3_0_is_br_REG <= _io_resp_f2_0_is_br_output;
    io_resp_f3_0_is_jal_REG <= _io_resp_f2_0_is_jal_output;
    REG_4 <= s1_is_jal_0;
    REG_5 <= REG_4;
    REG_6 <= s1_hits_1;
    io_resp_f2_1_predicted_pc_REG_valid <= s1_resp_1_valid;
    io_resp_f2_1_predicted_pc_REG_bits <= (s1_hit_ohs_1_0 ? _btb_0_ext_R0_data[14] : _btb_1_ext_R0_data[14]) ? _ebtb_ext_R0_data : s1_pc + {{27{_GEN_8[12]}}, _GEN_8} + 40'h2;
    io_resp_f2_1_is_br_REG <= ~doing_reset & s1_resp_1_valid & _GEN_9;
    io_resp_f2_1_is_jal_REG <= s1_is_jal_1;
    REG_7 <= s1_is_jal_1;
    REG_8 <= s1_hits_1;
    REG_9 <= REG_8;
    io_resp_f3_1_predicted_pc_REG_valid <= _io_resp_f2_1_predicted_pc_valid_output;
    io_resp_f3_1_predicted_pc_REG_bits <= _io_resp_f2_1_predicted_pc_bits_output;
    io_resp_f3_1_is_br_REG <= _io_resp_f2_1_is_br_output;
    io_resp_f3_1_is_jal_REG <= _io_resp_f2_1_is_jal_output;
    REG_10 <= s1_is_jal_1;
    REG_11 <= REG_10;
    REG_12 <= s1_hits_2;
    io_resp_f2_2_predicted_pc_REG_valid <= s1_resp_2_valid;
    io_resp_f2_2_predicted_pc_REG_bits <= (s1_hit_ohs_2_0 ? _btb_0_ext_R0_data[28] : _btb_1_ext_R0_data[28]) ? _ebtb_ext_R0_data : s1_pc + {{27{_GEN_10[12]}}, _GEN_10} + 40'h4;
    io_resp_f2_2_is_br_REG <= ~doing_reset & s1_resp_2_valid & _GEN_11;
    io_resp_f2_2_is_jal_REG <= s1_is_jal_2;
    REG_13 <= s1_is_jal_2;
    REG_14 <= s1_hits_2;
    REG_15 <= REG_14;
    io_resp_f3_2_predicted_pc_REG_valid <= _io_resp_f2_2_predicted_pc_valid_output;
    io_resp_f3_2_predicted_pc_REG_bits <= _io_resp_f2_2_predicted_pc_bits_output;
    io_resp_f3_2_is_br_REG <= _io_resp_f2_2_is_br_output;
    io_resp_f3_2_is_jal_REG <= _io_resp_f2_2_is_jal_output;
    REG_16 <= s1_is_jal_2;
    REG_17 <= REG_16;
    REG_18 <= s1_hits_3;
    io_resp_f2_3_predicted_pc_REG_valid <= s1_resp_3_valid;
    io_resp_f2_3_predicted_pc_REG_bits <= (s1_hit_ohs_3_0 ? _btb_0_ext_R0_data[42] : _btb_1_ext_R0_data[42]) ? _ebtb_ext_R0_data : s1_pc + {{27{_GEN_12[12]}}, _GEN_12} + 40'h6;
    io_resp_f2_3_is_br_REG <= ~doing_reset & s1_resp_3_valid & _GEN_13;
    io_resp_f2_3_is_jal_REG <= s1_is_jal_3;
    REG_19 <= s1_is_jal_3;
    REG_20 <= s1_hits_3;
    REG_21 <= REG_20;
    io_resp_f3_3_predicted_pc_REG_valid <= _io_resp_f2_3_predicted_pc_valid_output;
    io_resp_f3_3_predicted_pc_REG_bits <= _io_resp_f2_3_predicted_pc_bits_output;
    io_resp_f3_3_is_br_REG <= _io_resp_f2_3_is_br_output;
    io_resp_f3_3_is_jal_REG <= _io_resp_f2_3_is_jal_output;
    REG_22 <= s1_is_jal_3;
    REG_23 <= REG_22;
    if (reset) begin
      doing_reset <= 1'h1;
      reset_idx <= 7'h0;
    end
    else begin
      doing_reset <= reset_idx != 7'h7F & doing_reset;
      reset_idx <= reset_idx + {6'h0, doing_reset};
    end
  end // always @(posedge)
  meta_128x120 meta_0_ext (
    .R0_addr (io_f0_pc[10:4]),
    .R0_en   (io_f0_valid),
    .R0_clk  (clock),
    .R0_data (_meta_0_ext_R0_data),
    .W0_addr (btb_1_MPORT_2_addr),
    .W0_en   (btb_0_MPORT_en),
    .W0_clk  (clock),
    .W0_data ({meta_0_MPORT_1_data_3, meta_0_MPORT_1_data_2, meta_0_MPORT_1_data_1, meta_0_MPORT_1_data_0}),
    .W0_mask (_GEN_5)
  );
  meta_128x120 meta_1_ext (
    .R0_addr (io_f0_pc[10:4]),
    .R0_en   (io_f0_valid),
    .R0_clk  (clock),
    .R0_data (_meta_1_ext_R0_data),
    .W0_addr (btb_1_MPORT_2_addr),
    .W0_en   (btb_1_MPORT_2_en),
    .W0_clk  (clock),
    .W0_data ({meta_1_MPORT_3_data_3, meta_1_MPORT_3_data_2, meta_1_MPORT_3_data_1, meta_1_MPORT_3_data_0}),
    .W0_mask (_GEN_5)
  );
  btb_128x56 btb_0_ext (
    .R0_addr (io_f0_pc[10:4]),
    .R0_en   (io_f0_valid),
    .R0_clk  (clock),
    .R0_data (_btb_0_ext_R0_data),
    .W0_addr (btb_1_MPORT_2_addr),
    .W0_en   (btb_0_MPORT_en),
    .W0_clk  (clock),
    .W0_data ({btb_0_MPORT_data_3, btb_0_MPORT_data_2, btb_0_MPORT_data_1, btb_0_MPORT_data_0}),
    .W0_mask (_GEN_0)
  );
  btb_128x56 btb_1_ext (
    .R0_addr (io_f0_pc[10:4]),
    .R0_en   (io_f0_valid),
    .R0_clk  (clock),
    .R0_data (_btb_1_ext_R0_data),
    .W0_addr (btb_1_MPORT_2_addr),
    .W0_en   (btb_1_MPORT_2_en),
    .W0_clk  (clock),
    .W0_data ({btb_1_MPORT_2_data_3, btb_1_MPORT_2_data_2, btb_1_MPORT_2_data_1, btb_1_MPORT_2_data_0}),
    .W0_mask (_GEN_0)
  );
  ebtb_128x40 ebtb_ext (
    .R0_addr (io_f0_pc[10:4]),
    .R0_en   (io_f0_valid),
    .R0_clk  (clock),
    .R0_data (_ebtb_ext_R0_data),
    .W0_addr (s1_update_idx[6:0]),
    .W0_en   ((|s1_update_wbtb_mask) & s1_update_wbtb_data_extended),
    .W0_clk  (clock),
    .W0_data (s1_update_bits_target)
  );
  assign io_resp_f1_0_taken = io_resp_in_0_f1_0_taken;
  assign io_resp_f1_0_is_br = io_resp_in_0_f1_0_is_br;
  assign io_resp_f1_0_is_jal = io_resp_in_0_f1_0_is_jal;
  assign io_resp_f1_0_predicted_pc_valid = io_resp_in_0_f1_0_predicted_pc_valid;
  assign io_resp_f1_0_predicted_pc_bits = io_resp_in_0_f1_0_predicted_pc_bits;
  assign io_resp_f1_1_taken = io_resp_in_0_f1_1_taken;
  assign io_resp_f1_1_is_br = io_resp_in_0_f1_1_is_br;
  assign io_resp_f1_1_is_jal = io_resp_in_0_f1_1_is_jal;
  assign io_resp_f1_1_predicted_pc_valid = io_resp_in_0_f1_1_predicted_pc_valid;
  assign io_resp_f1_1_predicted_pc_bits = io_resp_in_0_f1_1_predicted_pc_bits;
  assign io_resp_f1_2_taken = io_resp_in_0_f1_2_taken;
  assign io_resp_f1_2_is_br = io_resp_in_0_f1_2_is_br;
  assign io_resp_f1_2_is_jal = io_resp_in_0_f1_2_is_jal;
  assign io_resp_f1_2_predicted_pc_valid = io_resp_in_0_f1_2_predicted_pc_valid;
  assign io_resp_f1_2_predicted_pc_bits = io_resp_in_0_f1_2_predicted_pc_bits;
  assign io_resp_f1_3_taken = io_resp_in_0_f1_3_taken;
  assign io_resp_f1_3_is_br = io_resp_in_0_f1_3_is_br;
  assign io_resp_f1_3_is_jal = io_resp_in_0_f1_3_is_jal;
  assign io_resp_f1_3_predicted_pc_valid = io_resp_in_0_f1_3_predicted_pc_valid;
  assign io_resp_f1_3_predicted_pc_bits = io_resp_in_0_f1_3_predicted_pc_bits;
  assign io_resp_f2_0_taken = REG & REG_1 | io_resp_in_0_f2_0_taken;
  assign io_resp_f2_0_is_br = _io_resp_f2_0_is_br_output;
  assign io_resp_f2_0_is_jal = _io_resp_f2_0_is_jal_output;
  assign io_resp_f2_0_predicted_pc_valid = _io_resp_f2_0_predicted_pc_valid_output;
  assign io_resp_f2_0_predicted_pc_bits = _io_resp_f2_0_predicted_pc_bits_output;
  assign io_resp_f2_1_taken = REG_6 & REG_7 | io_resp_in_0_f2_1_taken;
  assign io_resp_f2_1_is_br = _io_resp_f2_1_is_br_output;
  assign io_resp_f2_1_is_jal = _io_resp_f2_1_is_jal_output;
  assign io_resp_f2_1_predicted_pc_valid = _io_resp_f2_1_predicted_pc_valid_output;
  assign io_resp_f2_1_predicted_pc_bits = _io_resp_f2_1_predicted_pc_bits_output;
  assign io_resp_f2_2_taken = REG_12 & REG_13 | io_resp_in_0_f2_2_taken;
  assign io_resp_f2_2_is_br = _io_resp_f2_2_is_br_output;
  assign io_resp_f2_2_is_jal = _io_resp_f2_2_is_jal_output;
  assign io_resp_f2_2_predicted_pc_valid = _io_resp_f2_2_predicted_pc_valid_output;
  assign io_resp_f2_2_predicted_pc_bits = _io_resp_f2_2_predicted_pc_bits_output;
  assign io_resp_f2_3_taken = REG_18 & REG_19 | io_resp_in_0_f2_3_taken;
  assign io_resp_f2_3_is_br = _io_resp_f2_3_is_br_output;
  assign io_resp_f2_3_is_jal = _io_resp_f2_3_is_jal_output;
  assign io_resp_f2_3_predicted_pc_valid = _io_resp_f2_3_predicted_pc_valid_output;
  assign io_resp_f2_3_predicted_pc_bits = _io_resp_f2_3_predicted_pc_bits_output;
  assign io_resp_f3_0_taken = REG_3 & REG_5 | io_resp_in_0_f3_0_taken;
  assign io_resp_f3_0_is_br = REG_3 ? io_resp_f3_0_is_br_REG : io_resp_in_0_f3_0_is_br;
  assign io_resp_f3_0_is_jal = REG_3 ? io_resp_f3_0_is_jal_REG : io_resp_in_0_f3_0_is_jal;
  assign io_resp_f3_0_predicted_pc_valid = REG_3 ? io_resp_f3_0_predicted_pc_REG_valid : io_resp_in_0_f3_0_predicted_pc_valid;
  assign io_resp_f3_0_predicted_pc_bits = REG_3 ? io_resp_f3_0_predicted_pc_REG_bits : io_resp_in_0_f3_0_predicted_pc_bits;
  assign io_resp_f3_1_taken = REG_9 & REG_11 | io_resp_in_0_f3_1_taken;
  assign io_resp_f3_1_is_br = REG_9 ? io_resp_f3_1_is_br_REG : io_resp_in_0_f3_1_is_br;
  assign io_resp_f3_1_is_jal = REG_9 ? io_resp_f3_1_is_jal_REG : io_resp_in_0_f3_1_is_jal;
  assign io_resp_f3_1_predicted_pc_valid = REG_9 ? io_resp_f3_1_predicted_pc_REG_valid : io_resp_in_0_f3_1_predicted_pc_valid;
  assign io_resp_f3_1_predicted_pc_bits = REG_9 ? io_resp_f3_1_predicted_pc_REG_bits : io_resp_in_0_f3_1_predicted_pc_bits;
  assign io_resp_f3_2_taken = REG_15 & REG_17 | io_resp_in_0_f3_2_taken;
  assign io_resp_f3_2_is_br = REG_15 ? io_resp_f3_2_is_br_REG : io_resp_in_0_f3_2_is_br;
  assign io_resp_f3_2_is_jal = REG_15 ? io_resp_f3_2_is_jal_REG : io_resp_in_0_f3_2_is_jal;
  assign io_resp_f3_2_predicted_pc_valid = REG_15 ? io_resp_f3_2_predicted_pc_REG_valid : io_resp_in_0_f3_2_predicted_pc_valid;
  assign io_resp_f3_2_predicted_pc_bits = REG_15 ? io_resp_f3_2_predicted_pc_REG_bits : io_resp_in_0_f3_2_predicted_pc_bits;
  assign io_resp_f3_3_taken = REG_21 & REG_23 | io_resp_in_0_f3_3_taken;
  assign io_resp_f3_3_is_br = REG_21 ? io_resp_f3_3_is_br_REG : io_resp_in_0_f3_3_is_br;
  assign io_resp_f3_3_is_jal = REG_21 ? io_resp_f3_3_is_jal_REG : io_resp_in_0_f3_3_is_jal;
  assign io_resp_f3_3_predicted_pc_valid = REG_21 ? io_resp_f3_3_predicted_pc_REG_valid : io_resp_in_0_f3_3_predicted_pc_valid;
  assign io_resp_f3_3_predicted_pc_bits = REG_21 ? io_resp_f3_3_predicted_pc_REG_bits : io_resp_in_0_f3_3_predicted_pc_bits;
  assign io_f3_meta = {119'h0, f3_meta_write_way};
endmodule

