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

module TageBranchPredictorBank(
  input          clock,
                 reset,
                 io_f0_valid,
  input  [39:0]  io_f0_pc,
  input  [63:0]  io_f1_ghist,
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
                 io_update_bits_cfi_mispredicted,
  input  [63:0]  io_update_bits_ghist,
  input  [119:0] io_update_bits_meta
);

  wire         _alloc_lfsr_prng_3_io_out_0;
  wire         _alloc_lfsr_prng_3_io_out_1;
  wire         _alloc_lfsr_prng_3_io_out_2;
  wire         _alloc_lfsr_prng_3_io_out_3;
  wire         _alloc_lfsr_prng_3_io_out_4;
  wire         _alloc_lfsr_prng_3_io_out_5;
  wire         _alloc_lfsr_prng_2_io_out_0;
  wire         _alloc_lfsr_prng_2_io_out_1;
  wire         _alloc_lfsr_prng_2_io_out_2;
  wire         _alloc_lfsr_prng_2_io_out_3;
  wire         _alloc_lfsr_prng_2_io_out_4;
  wire         _alloc_lfsr_prng_2_io_out_5;
  wire         _alloc_lfsr_prng_1_io_out_0;
  wire         _alloc_lfsr_prng_1_io_out_1;
  wire         _alloc_lfsr_prng_1_io_out_2;
  wire         _alloc_lfsr_prng_1_io_out_3;
  wire         _alloc_lfsr_prng_1_io_out_4;
  wire         _alloc_lfsr_prng_1_io_out_5;
  wire         _alloc_lfsr_prng_io_out_0;
  wire         _alloc_lfsr_prng_io_out_1;
  wire         _alloc_lfsr_prng_io_out_2;
  wire         _alloc_lfsr_prng_io_out_3;
  wire         _alloc_lfsr_prng_io_out_4;
  wire         _alloc_lfsr_prng_io_out_5;
  wire         _t_5_io_f3_resp_0_valid;
  wire [2:0]   _t_5_io_f3_resp_0_bits_ctr;
  wire [1:0]   _t_5_io_f3_resp_0_bits_u;
  wire         _t_5_io_f3_resp_1_valid;
  wire [2:0]   _t_5_io_f3_resp_1_bits_ctr;
  wire [1:0]   _t_5_io_f3_resp_1_bits_u;
  wire         _t_5_io_f3_resp_2_valid;
  wire [2:0]   _t_5_io_f3_resp_2_bits_ctr;
  wire [1:0]   _t_5_io_f3_resp_2_bits_u;
  wire         _t_5_io_f3_resp_3_valid;
  wire [2:0]   _t_5_io_f3_resp_3_bits_ctr;
  wire [1:0]   _t_5_io_f3_resp_3_bits_u;
  wire         _t_4_io_f3_resp_0_valid;
  wire [2:0]   _t_4_io_f3_resp_0_bits_ctr;
  wire [1:0]   _t_4_io_f3_resp_0_bits_u;
  wire         _t_4_io_f3_resp_1_valid;
  wire [2:0]   _t_4_io_f3_resp_1_bits_ctr;
  wire [1:0]   _t_4_io_f3_resp_1_bits_u;
  wire         _t_4_io_f3_resp_2_valid;
  wire [2:0]   _t_4_io_f3_resp_2_bits_ctr;
  wire [1:0]   _t_4_io_f3_resp_2_bits_u;
  wire         _t_4_io_f3_resp_3_valid;
  wire [2:0]   _t_4_io_f3_resp_3_bits_ctr;
  wire [1:0]   _t_4_io_f3_resp_3_bits_u;
  wire         _t_3_io_f3_resp_0_valid;
  wire [2:0]   _t_3_io_f3_resp_0_bits_ctr;
  wire [1:0]   _t_3_io_f3_resp_0_bits_u;
  wire         _t_3_io_f3_resp_1_valid;
  wire [2:0]   _t_3_io_f3_resp_1_bits_ctr;
  wire [1:0]   _t_3_io_f3_resp_1_bits_u;
  wire         _t_3_io_f3_resp_2_valid;
  wire [2:0]   _t_3_io_f3_resp_2_bits_ctr;
  wire [1:0]   _t_3_io_f3_resp_2_bits_u;
  wire         _t_3_io_f3_resp_3_valid;
  wire [2:0]   _t_3_io_f3_resp_3_bits_ctr;
  wire [1:0]   _t_3_io_f3_resp_3_bits_u;
  wire         _t_2_io_f3_resp_0_valid;
  wire [2:0]   _t_2_io_f3_resp_0_bits_ctr;
  wire [1:0]   _t_2_io_f3_resp_0_bits_u;
  wire         _t_2_io_f3_resp_1_valid;
  wire [2:0]   _t_2_io_f3_resp_1_bits_ctr;
  wire [1:0]   _t_2_io_f3_resp_1_bits_u;
  wire         _t_2_io_f3_resp_2_valid;
  wire [2:0]   _t_2_io_f3_resp_2_bits_ctr;
  wire [1:0]   _t_2_io_f3_resp_2_bits_u;
  wire         _t_2_io_f3_resp_3_valid;
  wire [2:0]   _t_2_io_f3_resp_3_bits_ctr;
  wire [1:0]   _t_2_io_f3_resp_3_bits_u;
  wire         _t_1_io_f3_resp_0_valid;
  wire [2:0]   _t_1_io_f3_resp_0_bits_ctr;
  wire [1:0]   _t_1_io_f3_resp_0_bits_u;
  wire         _t_1_io_f3_resp_1_valid;
  wire [2:0]   _t_1_io_f3_resp_1_bits_ctr;
  wire [1:0]   _t_1_io_f3_resp_1_bits_u;
  wire         _t_1_io_f3_resp_2_valid;
  wire [2:0]   _t_1_io_f3_resp_2_bits_ctr;
  wire [1:0]   _t_1_io_f3_resp_2_bits_u;
  wire         _t_1_io_f3_resp_3_valid;
  wire [2:0]   _t_1_io_f3_resp_3_bits_ctr;
  wire [1:0]   _t_1_io_f3_resp_3_bits_u;
  wire         _t_io_f3_resp_0_valid;
  wire [2:0]   _t_io_f3_resp_0_bits_ctr;
  wire [1:0]   _t_io_f3_resp_0_bits_u;
  wire         _t_io_f3_resp_1_valid;
  wire [2:0]   _t_io_f3_resp_1_bits_ctr;
  wire [1:0]   _t_io_f3_resp_1_bits_u;
  wire         _t_io_f3_resp_2_valid;
  wire [2:0]   _t_io_f3_resp_2_bits_ctr;
  wire [1:0]   _t_io_f3_resp_2_bits_u;
  wire         _t_io_f3_resp_3_valid;
  wire [2:0]   _t_io_f3_resp_3_bits_ctr;
  wire [1:0]   _t_io_f3_resp_3_bits_u;
  reg          s1_update_valid;
  reg          s1_update_bits_is_mispredict_update;
  reg          s1_update_bits_is_repair_update;
  reg  [3:0]   s1_update_bits_btb_mispredicts;
  reg  [39:0]  s1_update_bits_pc;
  reg  [3:0]   s1_update_bits_br_mask;
  reg          s1_update_bits_cfi_idx_valid;
  reg  [1:0]   s1_update_bits_cfi_idx_bits;
  reg          s1_update_bits_cfi_taken;
  reg          s1_update_bits_cfi_mispredicted;
  reg  [63:0]  s1_update_bits_ghist;
  reg  [119:0] s1_update_bits_meta;
  reg          t_io_f1_req_valid_REG;
  reg  [39:0]  t_io_f1_req_pc_REG;
  reg          t_io_f1_req_valid_REG_1;
  reg  [39:0]  t_io_f1_req_pc_REG_1;
  reg          t_io_f1_req_valid_REG_2;
  reg  [39:0]  t_io_f1_req_pc_REG_2;
  reg          t_io_f1_req_valid_REG_3;
  reg  [39:0]  t_io_f1_req_pc_REG_3;
  reg          t_io_f1_req_valid_REG_4;
  reg  [39:0]  t_io_f1_req_pc_REG_4;
  reg          t_io_f1_req_valid_REG_5;
  reg  [39:0]  t_io_f1_req_pc_REG_5;
  wire         _GEN = _t_io_f3_resp_0_valid ? _t_io_f3_resp_0_bits_ctr[2] : io_resp_in_0_f3_0_taken;
  wire         _GEN_0 = _t_1_io_f3_resp_0_valid ? _t_1_io_f3_resp_0_bits_ctr[2] : _GEN;
  wire         _GEN_1 = _t_2_io_f3_resp_0_valid ? _t_2_io_f3_resp_0_bits_ctr[2] : _GEN_0;
  wire         _GEN_2 = _t_3_io_f3_resp_0_valid ? _t_3_io_f3_resp_0_bits_ctr[2] : _GEN_1;
  wire         _GEN_3 = _t_4_io_f3_resp_0_valid ? _t_4_io_f3_resp_0_bits_ctr[2] : _GEN_2;
  wire         _io_resp_f3_0_taken_output = _t_5_io_f3_resp_0_valid ? (_t_5_io_f3_resp_0_bits_ctr == 3'h3 | _t_5_io_f3_resp_0_bits_ctr == 3'h4 ? _GEN_3 : _t_5_io_f3_resp_0_bits_ctr[2]) : _t_4_io_f3_resp_0_valid ? (_t_4_io_f3_resp_0_bits_ctr == 3'h3 | _t_4_io_f3_resp_0_bits_ctr == 3'h4 ? _GEN_2 : _t_4_io_f3_resp_0_bits_ctr[2]) : _t_3_io_f3_resp_0_valid ? (_t_3_io_f3_resp_0_bits_ctr == 3'h3 | _t_3_io_f3_resp_0_bits_ctr == 3'h4 ? _GEN_1 : _t_3_io_f3_resp_0_bits_ctr[2]) : _t_2_io_f3_resp_0_valid ? (_t_2_io_f3_resp_0_bits_ctr == 3'h3 | _t_2_io_f3_resp_0_bits_ctr == 3'h4 ? _GEN_0 : _t_2_io_f3_resp_0_bits_ctr[2]) : _t_1_io_f3_resp_0_valid ? (_t_1_io_f3_resp_0_bits_ctr == 3'h3 | _t_1_io_f3_resp_0_bits_ctr == 3'h4 ? _GEN : _t_1_io_f3_resp_0_bits_ctr[2]) : ~_t_io_f3_resp_0_valid | _t_io_f3_resp_0_bits_ctr == 3'h3 | _t_io_f3_resp_0_bits_ctr == 3'h4 ? io_resp_in_0_f3_0_taken : _t_io_f3_resp_0_bits_ctr[2];
  wire         f3_meta_provider_0_valid = _t_io_f3_resp_0_valid | _t_1_io_f3_resp_0_valid | _t_2_io_f3_resp_0_valid | _t_3_io_f3_resp_0_valid | _t_4_io_f3_resp_0_valid | _t_5_io_f3_resp_0_valid;
  wire [2:0]   f3_meta_provider_0_bits = _t_5_io_f3_resp_0_valid ? 3'h5 : _t_4_io_f3_resp_0_valid ? 3'h4 : {1'h0, _t_3_io_f3_resp_0_valid ? 2'h3 : _t_2_io_f3_resp_0_valid ? 2'h2 : {1'h0, _t_1_io_f3_resp_0_valid}};
  reg  [2:0]   casez_tmp;
  always @(*) begin
    casez (f3_meta_provider_0_bits)
      3'b000:
        casez_tmp = _t_io_f3_resp_0_bits_ctr;
      3'b001:
        casez_tmp = _t_1_io_f3_resp_0_bits_ctr;
      3'b010:
        casez_tmp = _t_2_io_f3_resp_0_bits_ctr;
      3'b011:
        casez_tmp = _t_3_io_f3_resp_0_bits_ctr;
      3'b100:
        casez_tmp = _t_4_io_f3_resp_0_bits_ctr;
      3'b101:
        casez_tmp = _t_5_io_f3_resp_0_bits_ctr;
      3'b110:
        casez_tmp = _t_io_f3_resp_0_bits_ctr;
      default:
        casez_tmp = _t_io_f3_resp_0_bits_ctr;
    endcase
  end // always @(*)
  reg  [1:0]   casez_tmp_0;
  always @(*) begin
    casez (f3_meta_provider_0_bits)
      3'b000:
        casez_tmp_0 = _t_io_f3_resp_0_bits_u;
      3'b001:
        casez_tmp_0 = _t_1_io_f3_resp_0_bits_u;
      3'b010:
        casez_tmp_0 = _t_2_io_f3_resp_0_bits_u;
      3'b011:
        casez_tmp_0 = _t_3_io_f3_resp_0_bits_u;
      3'b100:
        casez_tmp_0 = _t_4_io_f3_resp_0_bits_u;
      3'b101:
        casez_tmp_0 = _t_5_io_f3_resp_0_bits_u;
      3'b110:
        casez_tmp_0 = _t_io_f3_resp_0_bits_u;
      default:
        casez_tmp_0 = _t_io_f3_resp_0_bits_u;
    endcase
  end // always @(*)
  wire [7:0]   _allocatable_slots_T_20 = 8'h1 << f3_meta_provider_0_bits;
  wire [5:0]   _GEN_4 = _allocatable_slots_T_20[5:0] | _allocatable_slots_T_20[6:1] | _allocatable_slots_T_20[7:2];
  wire [4:0]   _GEN_5 = _GEN_4[4:0] | _allocatable_slots_T_20[7:3];
  wire [3:0]   _GEN_6 = _GEN_5[3:0] | _allocatable_slots_T_20[7:4];
  wire [2:0]   _GEN_7 = _GEN_6[2:0] | _allocatable_slots_T_20[7:5];
  wire [1:0]   _GEN_8 = _GEN_7[1:0] | _allocatable_slots_T_20[7:6];
  wire [5:0]   _GEN_9 = ~({_GEN_4[5], _GEN_5[4], _GEN_6[3], _GEN_7[2], _GEN_8[1], _GEN_8[0] | (&f3_meta_provider_0_bits)} & {6{f3_meta_provider_0_valid}}) & {~_t_5_io_f3_resp_0_valid & _t_5_io_f3_resp_0_bits_u == 2'h0, ~_t_4_io_f3_resp_0_valid & _t_4_io_f3_resp_0_bits_u == 2'h0, ~_t_3_io_f3_resp_0_valid & _t_3_io_f3_resp_0_bits_u == 2'h0, ~_t_2_io_f3_resp_0_valid & _t_2_io_f3_resp_0_bits_u == 2'h0, ~_t_1_io_f3_resp_0_valid & _t_1_io_f3_resp_0_bits_u == 2'h0, ~_t_io_f3_resp_0_valid & _t_io_f3_resp_0_bits_u == 2'h0};
  wire [5:0]   _GEN_10 = _GEN_9 & {_alloc_lfsr_prng_io_out_5, _alloc_lfsr_prng_io_out_4, _alloc_lfsr_prng_io_out_3, _alloc_lfsr_prng_io_out_2, _alloc_lfsr_prng_io_out_1, _alloc_lfsr_prng_io_out_0};
  wire [2:0]   masked_entry = _GEN_10[0] ? 3'h0 : _GEN_10[1] ? 3'h1 : _GEN_10[2] ? 3'h2 : _GEN_10[3] ? 3'h3 : _GEN_10[4] ? 3'h4 : {1'h1, ~(_GEN_10[5]), 1'h1};
  wire [7:0]   _alloc_entry_T = {2'h0, _GEN_9} >> masked_entry;
  wire         _GEN_11 = _t_io_f3_resp_1_valid ? _t_io_f3_resp_1_bits_ctr[2] : io_resp_in_0_f3_1_taken;
  wire         _GEN_12 = _t_1_io_f3_resp_1_valid ? _t_1_io_f3_resp_1_bits_ctr[2] : _GEN_11;
  wire         _GEN_13 = _t_2_io_f3_resp_1_valid ? _t_2_io_f3_resp_1_bits_ctr[2] : _GEN_12;
  wire         _GEN_14 = _t_3_io_f3_resp_1_valid ? _t_3_io_f3_resp_1_bits_ctr[2] : _GEN_13;
  wire         _GEN_15 = _t_4_io_f3_resp_1_valid ? _t_4_io_f3_resp_1_bits_ctr[2] : _GEN_14;
  wire         _io_resp_f3_1_taken_output = _t_5_io_f3_resp_1_valid ? (_t_5_io_f3_resp_1_bits_ctr == 3'h3 | _t_5_io_f3_resp_1_bits_ctr == 3'h4 ? _GEN_15 : _t_5_io_f3_resp_1_bits_ctr[2]) : _t_4_io_f3_resp_1_valid ? (_t_4_io_f3_resp_1_bits_ctr == 3'h3 | _t_4_io_f3_resp_1_bits_ctr == 3'h4 ? _GEN_14 : _t_4_io_f3_resp_1_bits_ctr[2]) : _t_3_io_f3_resp_1_valid ? (_t_3_io_f3_resp_1_bits_ctr == 3'h3 | _t_3_io_f3_resp_1_bits_ctr == 3'h4 ? _GEN_13 : _t_3_io_f3_resp_1_bits_ctr[2]) : _t_2_io_f3_resp_1_valid ? (_t_2_io_f3_resp_1_bits_ctr == 3'h3 | _t_2_io_f3_resp_1_bits_ctr == 3'h4 ? _GEN_12 : _t_2_io_f3_resp_1_bits_ctr[2]) : _t_1_io_f3_resp_1_valid ? (_t_1_io_f3_resp_1_bits_ctr == 3'h3 | _t_1_io_f3_resp_1_bits_ctr == 3'h4 ? _GEN_11 : _t_1_io_f3_resp_1_bits_ctr[2]) : ~_t_io_f3_resp_1_valid | _t_io_f3_resp_1_bits_ctr == 3'h3 | _t_io_f3_resp_1_bits_ctr == 3'h4 ? io_resp_in_0_f3_1_taken : _t_io_f3_resp_1_bits_ctr[2];
  wire         f3_meta_provider_1_valid = _t_io_f3_resp_1_valid | _t_1_io_f3_resp_1_valid | _t_2_io_f3_resp_1_valid | _t_3_io_f3_resp_1_valid | _t_4_io_f3_resp_1_valid | _t_5_io_f3_resp_1_valid;
  wire [2:0]   f3_meta_provider_1_bits = _t_5_io_f3_resp_1_valid ? 3'h5 : _t_4_io_f3_resp_1_valid ? 3'h4 : {1'h0, _t_3_io_f3_resp_1_valid ? 2'h3 : _t_2_io_f3_resp_1_valid ? 2'h2 : {1'h0, _t_1_io_f3_resp_1_valid}};
  reg  [2:0]   casez_tmp_1;
  always @(*) begin
    casez (f3_meta_provider_1_bits)
      3'b000:
        casez_tmp_1 = _t_io_f3_resp_1_bits_ctr;
      3'b001:
        casez_tmp_1 = _t_1_io_f3_resp_1_bits_ctr;
      3'b010:
        casez_tmp_1 = _t_2_io_f3_resp_1_bits_ctr;
      3'b011:
        casez_tmp_1 = _t_3_io_f3_resp_1_bits_ctr;
      3'b100:
        casez_tmp_1 = _t_4_io_f3_resp_1_bits_ctr;
      3'b101:
        casez_tmp_1 = _t_5_io_f3_resp_1_bits_ctr;
      3'b110:
        casez_tmp_1 = _t_io_f3_resp_1_bits_ctr;
      default:
        casez_tmp_1 = _t_io_f3_resp_1_bits_ctr;
    endcase
  end // always @(*)
  reg  [1:0]   casez_tmp_2;
  always @(*) begin
    casez (f3_meta_provider_1_bits)
      3'b000:
        casez_tmp_2 = _t_io_f3_resp_1_bits_u;
      3'b001:
        casez_tmp_2 = _t_1_io_f3_resp_1_bits_u;
      3'b010:
        casez_tmp_2 = _t_2_io_f3_resp_1_bits_u;
      3'b011:
        casez_tmp_2 = _t_3_io_f3_resp_1_bits_u;
      3'b100:
        casez_tmp_2 = _t_4_io_f3_resp_1_bits_u;
      3'b101:
        casez_tmp_2 = _t_5_io_f3_resp_1_bits_u;
      3'b110:
        casez_tmp_2 = _t_io_f3_resp_1_bits_u;
      default:
        casez_tmp_2 = _t_io_f3_resp_1_bits_u;
    endcase
  end // always @(*)
  wire [7:0]   _allocatable_slots_T_59 = 8'h1 << f3_meta_provider_1_bits;
  wire [5:0]   _GEN_16 = _allocatable_slots_T_59[5:0] | _allocatable_slots_T_59[6:1] | _allocatable_slots_T_59[7:2];
  wire [4:0]   _GEN_17 = _GEN_16[4:0] | _allocatable_slots_T_59[7:3];
  wire [3:0]   _GEN_18 = _GEN_17[3:0] | _allocatable_slots_T_59[7:4];
  wire [2:0]   _GEN_19 = _GEN_18[2:0] | _allocatable_slots_T_59[7:5];
  wire [1:0]   _GEN_20 = _GEN_19[1:0] | _allocatable_slots_T_59[7:6];
  wire [5:0]   _GEN_21 = ~({_GEN_16[5], _GEN_17[4], _GEN_18[3], _GEN_19[2], _GEN_20[1], _GEN_20[0] | (&f3_meta_provider_1_bits)} & {6{f3_meta_provider_1_valid}}) & {~_t_5_io_f3_resp_1_valid & _t_5_io_f3_resp_1_bits_u == 2'h0, ~_t_4_io_f3_resp_1_valid & _t_4_io_f3_resp_1_bits_u == 2'h0, ~_t_3_io_f3_resp_1_valid & _t_3_io_f3_resp_1_bits_u == 2'h0, ~_t_2_io_f3_resp_1_valid & _t_2_io_f3_resp_1_bits_u == 2'h0, ~_t_1_io_f3_resp_1_valid & _t_1_io_f3_resp_1_bits_u == 2'h0, ~_t_io_f3_resp_1_valid & _t_io_f3_resp_1_bits_u == 2'h0};
  wire [5:0]   _GEN_22 = _GEN_21 & {_alloc_lfsr_prng_1_io_out_5, _alloc_lfsr_prng_1_io_out_4, _alloc_lfsr_prng_1_io_out_3, _alloc_lfsr_prng_1_io_out_2, _alloc_lfsr_prng_1_io_out_1, _alloc_lfsr_prng_1_io_out_0};
  wire [2:0]   masked_entry_1 = _GEN_22[0] ? 3'h0 : _GEN_22[1] ? 3'h1 : _GEN_22[2] ? 3'h2 : _GEN_22[3] ? 3'h3 : _GEN_22[4] ? 3'h4 : {1'h1, ~(_GEN_22[5]), 1'h1};
  wire [7:0]   _alloc_entry_T_2 = {2'h0, _GEN_21} >> masked_entry_1;
  wire         _GEN_23 = _t_io_f3_resp_2_valid ? _t_io_f3_resp_2_bits_ctr[2] : io_resp_in_0_f3_2_taken;
  wire         _GEN_24 = _t_1_io_f3_resp_2_valid ? _t_1_io_f3_resp_2_bits_ctr[2] : _GEN_23;
  wire         _GEN_25 = _t_2_io_f3_resp_2_valid ? _t_2_io_f3_resp_2_bits_ctr[2] : _GEN_24;
  wire         _GEN_26 = _t_3_io_f3_resp_2_valid ? _t_3_io_f3_resp_2_bits_ctr[2] : _GEN_25;
  wire         _GEN_27 = _t_4_io_f3_resp_2_valid ? _t_4_io_f3_resp_2_bits_ctr[2] : _GEN_26;
  wire         _io_resp_f3_2_taken_output = _t_5_io_f3_resp_2_valid ? (_t_5_io_f3_resp_2_bits_ctr == 3'h3 | _t_5_io_f3_resp_2_bits_ctr == 3'h4 ? _GEN_27 : _t_5_io_f3_resp_2_bits_ctr[2]) : _t_4_io_f3_resp_2_valid ? (_t_4_io_f3_resp_2_bits_ctr == 3'h3 | _t_4_io_f3_resp_2_bits_ctr == 3'h4 ? _GEN_26 : _t_4_io_f3_resp_2_bits_ctr[2]) : _t_3_io_f3_resp_2_valid ? (_t_3_io_f3_resp_2_bits_ctr == 3'h3 | _t_3_io_f3_resp_2_bits_ctr == 3'h4 ? _GEN_25 : _t_3_io_f3_resp_2_bits_ctr[2]) : _t_2_io_f3_resp_2_valid ? (_t_2_io_f3_resp_2_bits_ctr == 3'h3 | _t_2_io_f3_resp_2_bits_ctr == 3'h4 ? _GEN_24 : _t_2_io_f3_resp_2_bits_ctr[2]) : _t_1_io_f3_resp_2_valid ? (_t_1_io_f3_resp_2_bits_ctr == 3'h3 | _t_1_io_f3_resp_2_bits_ctr == 3'h4 ? _GEN_23 : _t_1_io_f3_resp_2_bits_ctr[2]) : ~_t_io_f3_resp_2_valid | _t_io_f3_resp_2_bits_ctr == 3'h3 | _t_io_f3_resp_2_bits_ctr == 3'h4 ? io_resp_in_0_f3_2_taken : _t_io_f3_resp_2_bits_ctr[2];
  wire         f3_meta_provider_2_valid = _t_io_f3_resp_2_valid | _t_1_io_f3_resp_2_valid | _t_2_io_f3_resp_2_valid | _t_3_io_f3_resp_2_valid | _t_4_io_f3_resp_2_valid | _t_5_io_f3_resp_2_valid;
  wire [2:0]   f3_meta_provider_2_bits = _t_5_io_f3_resp_2_valid ? 3'h5 : _t_4_io_f3_resp_2_valid ? 3'h4 : {1'h0, _t_3_io_f3_resp_2_valid ? 2'h3 : _t_2_io_f3_resp_2_valid ? 2'h2 : {1'h0, _t_1_io_f3_resp_2_valid}};
  reg  [2:0]   casez_tmp_3;
  always @(*) begin
    casez (f3_meta_provider_2_bits)
      3'b000:
        casez_tmp_3 = _t_io_f3_resp_2_bits_ctr;
      3'b001:
        casez_tmp_3 = _t_1_io_f3_resp_2_bits_ctr;
      3'b010:
        casez_tmp_3 = _t_2_io_f3_resp_2_bits_ctr;
      3'b011:
        casez_tmp_3 = _t_3_io_f3_resp_2_bits_ctr;
      3'b100:
        casez_tmp_3 = _t_4_io_f3_resp_2_bits_ctr;
      3'b101:
        casez_tmp_3 = _t_5_io_f3_resp_2_bits_ctr;
      3'b110:
        casez_tmp_3 = _t_io_f3_resp_2_bits_ctr;
      default:
        casez_tmp_3 = _t_io_f3_resp_2_bits_ctr;
    endcase
  end // always @(*)
  reg  [1:0]   casez_tmp_4;
  always @(*) begin
    casez (f3_meta_provider_2_bits)
      3'b000:
        casez_tmp_4 = _t_io_f3_resp_2_bits_u;
      3'b001:
        casez_tmp_4 = _t_1_io_f3_resp_2_bits_u;
      3'b010:
        casez_tmp_4 = _t_2_io_f3_resp_2_bits_u;
      3'b011:
        casez_tmp_4 = _t_3_io_f3_resp_2_bits_u;
      3'b100:
        casez_tmp_4 = _t_4_io_f3_resp_2_bits_u;
      3'b101:
        casez_tmp_4 = _t_5_io_f3_resp_2_bits_u;
      3'b110:
        casez_tmp_4 = _t_io_f3_resp_2_bits_u;
      default:
        casez_tmp_4 = _t_io_f3_resp_2_bits_u;
    endcase
  end // always @(*)
  wire [7:0]   _allocatable_slots_T_98 = 8'h1 << f3_meta_provider_2_bits;
  wire [5:0]   _GEN_28 = _allocatable_slots_T_98[5:0] | _allocatable_slots_T_98[6:1] | _allocatable_slots_T_98[7:2];
  wire [4:0]   _GEN_29 = _GEN_28[4:0] | _allocatable_slots_T_98[7:3];
  wire [3:0]   _GEN_30 = _GEN_29[3:0] | _allocatable_slots_T_98[7:4];
  wire [2:0]   _GEN_31 = _GEN_30[2:0] | _allocatable_slots_T_98[7:5];
  wire [1:0]   _GEN_32 = _GEN_31[1:0] | _allocatable_slots_T_98[7:6];
  wire [5:0]   _GEN_33 = ~({_GEN_28[5], _GEN_29[4], _GEN_30[3], _GEN_31[2], _GEN_32[1], _GEN_32[0] | (&f3_meta_provider_2_bits)} & {6{f3_meta_provider_2_valid}}) & {~_t_5_io_f3_resp_2_valid & _t_5_io_f3_resp_2_bits_u == 2'h0, ~_t_4_io_f3_resp_2_valid & _t_4_io_f3_resp_2_bits_u == 2'h0, ~_t_3_io_f3_resp_2_valid & _t_3_io_f3_resp_2_bits_u == 2'h0, ~_t_2_io_f3_resp_2_valid & _t_2_io_f3_resp_2_bits_u == 2'h0, ~_t_1_io_f3_resp_2_valid & _t_1_io_f3_resp_2_bits_u == 2'h0, ~_t_io_f3_resp_2_valid & _t_io_f3_resp_2_bits_u == 2'h0};
  wire [5:0]   _GEN_34 = _GEN_33 & {_alloc_lfsr_prng_2_io_out_5, _alloc_lfsr_prng_2_io_out_4, _alloc_lfsr_prng_2_io_out_3, _alloc_lfsr_prng_2_io_out_2, _alloc_lfsr_prng_2_io_out_1, _alloc_lfsr_prng_2_io_out_0};
  wire [2:0]   masked_entry_2 = _GEN_34[0] ? 3'h0 : _GEN_34[1] ? 3'h1 : _GEN_34[2] ? 3'h2 : _GEN_34[3] ? 3'h3 : _GEN_34[4] ? 3'h4 : {1'h1, ~(_GEN_34[5]), 1'h1};
  wire [7:0]   _alloc_entry_T_4 = {2'h0, _GEN_33} >> masked_entry_2;
  wire         _GEN_35 = _t_io_f3_resp_3_valid ? _t_io_f3_resp_3_bits_ctr[2] : io_resp_in_0_f3_3_taken;
  wire         _GEN_36 = _t_1_io_f3_resp_3_valid ? _t_1_io_f3_resp_3_bits_ctr[2] : _GEN_35;
  wire         _GEN_37 = _t_2_io_f3_resp_3_valid ? _t_2_io_f3_resp_3_bits_ctr[2] : _GEN_36;
  wire         _GEN_38 = _t_3_io_f3_resp_3_valid ? _t_3_io_f3_resp_3_bits_ctr[2] : _GEN_37;
  wire         _GEN_39 = _t_4_io_f3_resp_3_valid ? _t_4_io_f3_resp_3_bits_ctr[2] : _GEN_38;
  wire         _io_resp_f3_3_taken_output = _t_5_io_f3_resp_3_valid ? (_t_5_io_f3_resp_3_bits_ctr == 3'h3 | _t_5_io_f3_resp_3_bits_ctr == 3'h4 ? _GEN_39 : _t_5_io_f3_resp_3_bits_ctr[2]) : _t_4_io_f3_resp_3_valid ? (_t_4_io_f3_resp_3_bits_ctr == 3'h3 | _t_4_io_f3_resp_3_bits_ctr == 3'h4 ? _GEN_38 : _t_4_io_f3_resp_3_bits_ctr[2]) : _t_3_io_f3_resp_3_valid ? (_t_3_io_f3_resp_3_bits_ctr == 3'h3 | _t_3_io_f3_resp_3_bits_ctr == 3'h4 ? _GEN_37 : _t_3_io_f3_resp_3_bits_ctr[2]) : _t_2_io_f3_resp_3_valid ? (_t_2_io_f3_resp_3_bits_ctr == 3'h3 | _t_2_io_f3_resp_3_bits_ctr == 3'h4 ? _GEN_36 : _t_2_io_f3_resp_3_bits_ctr[2]) : _t_1_io_f3_resp_3_valid ? (_t_1_io_f3_resp_3_bits_ctr == 3'h3 | _t_1_io_f3_resp_3_bits_ctr == 3'h4 ? _GEN_35 : _t_1_io_f3_resp_3_bits_ctr[2]) : ~_t_io_f3_resp_3_valid | _t_io_f3_resp_3_bits_ctr == 3'h3 | _t_io_f3_resp_3_bits_ctr == 3'h4 ? io_resp_in_0_f3_3_taken : _t_io_f3_resp_3_bits_ctr[2];
  wire         f3_meta_provider_3_valid = _t_io_f3_resp_3_valid | _t_1_io_f3_resp_3_valid | _t_2_io_f3_resp_3_valid | _t_3_io_f3_resp_3_valid | _t_4_io_f3_resp_3_valid | _t_5_io_f3_resp_3_valid;
  wire [2:0]   f3_meta_provider_3_bits = _t_5_io_f3_resp_3_valid ? 3'h5 : _t_4_io_f3_resp_3_valid ? 3'h4 : {1'h0, _t_3_io_f3_resp_3_valid ? 2'h3 : _t_2_io_f3_resp_3_valid ? 2'h2 : {1'h0, _t_1_io_f3_resp_3_valid}};
  reg  [2:0]   casez_tmp_5;
  always @(*) begin
    casez (f3_meta_provider_3_bits)
      3'b000:
        casez_tmp_5 = _t_io_f3_resp_3_bits_ctr;
      3'b001:
        casez_tmp_5 = _t_1_io_f3_resp_3_bits_ctr;
      3'b010:
        casez_tmp_5 = _t_2_io_f3_resp_3_bits_ctr;
      3'b011:
        casez_tmp_5 = _t_3_io_f3_resp_3_bits_ctr;
      3'b100:
        casez_tmp_5 = _t_4_io_f3_resp_3_bits_ctr;
      3'b101:
        casez_tmp_5 = _t_5_io_f3_resp_3_bits_ctr;
      3'b110:
        casez_tmp_5 = _t_io_f3_resp_3_bits_ctr;
      default:
        casez_tmp_5 = _t_io_f3_resp_3_bits_ctr;
    endcase
  end // always @(*)
  reg  [1:0]   casez_tmp_6;
  always @(*) begin
    casez (f3_meta_provider_3_bits)
      3'b000:
        casez_tmp_6 = _t_io_f3_resp_3_bits_u;
      3'b001:
        casez_tmp_6 = _t_1_io_f3_resp_3_bits_u;
      3'b010:
        casez_tmp_6 = _t_2_io_f3_resp_3_bits_u;
      3'b011:
        casez_tmp_6 = _t_3_io_f3_resp_3_bits_u;
      3'b100:
        casez_tmp_6 = _t_4_io_f3_resp_3_bits_u;
      3'b101:
        casez_tmp_6 = _t_5_io_f3_resp_3_bits_u;
      3'b110:
        casez_tmp_6 = _t_io_f3_resp_3_bits_u;
      default:
        casez_tmp_6 = _t_io_f3_resp_3_bits_u;
    endcase
  end // always @(*)
  wire [7:0]   _allocatable_slots_T_137 = 8'h1 << f3_meta_provider_3_bits;
  wire [5:0]   _GEN_40 = _allocatable_slots_T_137[5:0] | _allocatable_slots_T_137[6:1] | _allocatable_slots_T_137[7:2];
  wire [4:0]   _GEN_41 = _GEN_40[4:0] | _allocatable_slots_T_137[7:3];
  wire [3:0]   _GEN_42 = _GEN_41[3:0] | _allocatable_slots_T_137[7:4];
  wire [2:0]   _GEN_43 = _GEN_42[2:0] | _allocatable_slots_T_137[7:5];
  wire [1:0]   _GEN_44 = _GEN_43[1:0] | _allocatable_slots_T_137[7:6];
  wire [5:0]   _GEN_45 = ~({_GEN_40[5], _GEN_41[4], _GEN_42[3], _GEN_43[2], _GEN_44[1], _GEN_44[0] | (&f3_meta_provider_3_bits)} & {6{f3_meta_provider_3_valid}}) & {~_t_5_io_f3_resp_3_valid & _t_5_io_f3_resp_3_bits_u == 2'h0, ~_t_4_io_f3_resp_3_valid & _t_4_io_f3_resp_3_bits_u == 2'h0, ~_t_3_io_f3_resp_3_valid & _t_3_io_f3_resp_3_bits_u == 2'h0, ~_t_2_io_f3_resp_3_valid & _t_2_io_f3_resp_3_bits_u == 2'h0, ~_t_1_io_f3_resp_3_valid & _t_1_io_f3_resp_3_bits_u == 2'h0, ~_t_io_f3_resp_3_valid & _t_io_f3_resp_3_bits_u == 2'h0};
  wire [5:0]   _GEN_46 = _GEN_45 & {_alloc_lfsr_prng_3_io_out_5, _alloc_lfsr_prng_3_io_out_4, _alloc_lfsr_prng_3_io_out_3, _alloc_lfsr_prng_3_io_out_2, _alloc_lfsr_prng_3_io_out_1, _alloc_lfsr_prng_3_io_out_0};
  wire [2:0]   masked_entry_3 = _GEN_46[0] ? 3'h0 : _GEN_46[1] ? 3'h1 : _GEN_46[2] ? 3'h2 : _GEN_46[3] ? 3'h3 : _GEN_46[4] ? 3'h4 : {1'h1, ~(_GEN_46[5]), 1'h1};
  wire [7:0]   _alloc_entry_T_6 = {2'h0, _GEN_45} >> masked_entry_3;
  reg          casez_tmp_7;
  always @(*) begin
    casez (s1_update_bits_cfi_idx_bits)
      2'b00:
        casez_tmp_7 = s1_update_bits_meta[3];
      2'b01:
        casez_tmp_7 = s1_update_bits_meta[7];
      2'b10:
        casez_tmp_7 = s1_update_bits_meta[11];
      default:
        casez_tmp_7 = s1_update_bits_meta[15];
    endcase
  end // always @(*)
  reg  [2:0]   casez_tmp_8;
  always @(*) begin
    casez (s1_update_bits_cfi_idx_bits)
      2'b00:
        casez_tmp_8 = s1_update_bits_meta[2:0];
      2'b01:
        casez_tmp_8 = s1_update_bits_meta[6:4];
      2'b10:
        casez_tmp_8 = s1_update_bits_meta[10:8];
      default:
        casez_tmp_8 = s1_update_bits_meta[14:12];
    endcase
  end // always @(*)
  reg          casez_tmp_9;
  always @(*) begin
    casez (s1_update_bits_cfi_idx_bits)
      2'b00:
        casez_tmp_9 = s1_update_bits_meta[43];
      2'b01:
        casez_tmp_9 = s1_update_bits_meta[47];
      2'b10:
        casez_tmp_9 = s1_update_bits_meta[51];
      default:
        casez_tmp_9 = s1_update_bits_meta[55];
    endcase
  end // always @(*)
  reg  [2:0]   casez_tmp_10;
  always @(*) begin
    casez (s1_update_bits_cfi_idx_bits)
      2'b00:
        casez_tmp_10 = s1_update_bits_meta[42:40];
      2'b01:
        casez_tmp_10 = s1_update_bits_meta[46:44];
      2'b10:
        casez_tmp_10 = s1_update_bits_meta[50:48];
      default:
        casez_tmp_10 = s1_update_bits_meta[54:52];
    endcase
  end // always @(*)
  reg          t_io_update_mask_0_REG;
  reg          t_io_update_taken_0_REG;
  reg          t_io_update_alloc_0_REG;
  reg  [2:0]   t_io_update_old_ctr_0_REG;
  reg          t_io_update_u_mask_0_REG;
  reg  [1:0]   t_io_update_u_0_REG;
  reg          t_io_update_mask_1_REG;
  reg          t_io_update_taken_1_REG;
  reg          t_io_update_alloc_1_REG;
  reg  [2:0]   t_io_update_old_ctr_1_REG;
  reg          t_io_update_u_mask_1_REG;
  reg  [1:0]   t_io_update_u_1_REG;
  reg          t_io_update_mask_2_REG;
  reg          t_io_update_taken_2_REG;
  reg          t_io_update_alloc_2_REG;
  reg  [2:0]   t_io_update_old_ctr_2_REG;
  reg          t_io_update_u_mask_2_REG;
  reg  [1:0]   t_io_update_u_2_REG;
  reg          t_io_update_mask_3_REG;
  reg          t_io_update_taken_3_REG;
  reg          t_io_update_alloc_3_REG;
  reg  [2:0]   t_io_update_old_ctr_3_REG;
  reg          t_io_update_u_mask_3_REG;
  reg  [1:0]   t_io_update_u_3_REG;
  reg  [39:0]  t_io_update_pc_REG;
  reg  [63:0]  t_io_update_hist_REG;
  reg          t_io_update_mask_0_REG_1;
  reg          t_io_update_taken_0_REG_1;
  reg          t_io_update_alloc_0_REG_1;
  reg  [2:0]   t_io_update_old_ctr_0_REG_1;
  reg          t_io_update_u_mask_0_REG_1;
  reg  [1:0]   t_io_update_u_0_REG_1;
  reg          t_io_update_mask_1_REG_1;
  reg          t_io_update_taken_1_REG_1;
  reg          t_io_update_alloc_1_REG_1;
  reg  [2:0]   t_io_update_old_ctr_1_REG_1;
  reg          t_io_update_u_mask_1_REG_1;
  reg  [1:0]   t_io_update_u_1_REG_1;
  reg          t_io_update_mask_2_REG_1;
  reg          t_io_update_taken_2_REG_1;
  reg          t_io_update_alloc_2_REG_1;
  reg  [2:0]   t_io_update_old_ctr_2_REG_1;
  reg          t_io_update_u_mask_2_REG_1;
  reg  [1:0]   t_io_update_u_2_REG_1;
  reg          t_io_update_mask_3_REG_1;
  reg          t_io_update_taken_3_REG_1;
  reg          t_io_update_alloc_3_REG_1;
  reg  [2:0]   t_io_update_old_ctr_3_REG_1;
  reg          t_io_update_u_mask_3_REG_1;
  reg  [1:0]   t_io_update_u_3_REG_1;
  reg  [39:0]  t_io_update_pc_REG_1;
  reg  [63:0]  t_io_update_hist_REG_1;
  reg          t_io_update_mask_0_REG_2;
  reg          t_io_update_taken_0_REG_2;
  reg          t_io_update_alloc_0_REG_2;
  reg  [2:0]   t_io_update_old_ctr_0_REG_2;
  reg          t_io_update_u_mask_0_REG_2;
  reg  [1:0]   t_io_update_u_0_REG_2;
  reg          t_io_update_mask_1_REG_2;
  reg          t_io_update_taken_1_REG_2;
  reg          t_io_update_alloc_1_REG_2;
  reg  [2:0]   t_io_update_old_ctr_1_REG_2;
  reg          t_io_update_u_mask_1_REG_2;
  reg  [1:0]   t_io_update_u_1_REG_2;
  reg          t_io_update_mask_2_REG_2;
  reg          t_io_update_taken_2_REG_2;
  reg          t_io_update_alloc_2_REG_2;
  reg  [2:0]   t_io_update_old_ctr_2_REG_2;
  reg          t_io_update_u_mask_2_REG_2;
  reg  [1:0]   t_io_update_u_2_REG_2;
  reg          t_io_update_mask_3_REG_2;
  reg          t_io_update_taken_3_REG_2;
  reg          t_io_update_alloc_3_REG_2;
  reg  [2:0]   t_io_update_old_ctr_3_REG_2;
  reg          t_io_update_u_mask_3_REG_2;
  reg  [1:0]   t_io_update_u_3_REG_2;
  reg  [39:0]  t_io_update_pc_REG_2;
  reg  [63:0]  t_io_update_hist_REG_2;
  reg          t_io_update_mask_0_REG_3;
  reg          t_io_update_taken_0_REG_3;
  reg          t_io_update_alloc_0_REG_3;
  reg  [2:0]   t_io_update_old_ctr_0_REG_3;
  reg          t_io_update_u_mask_0_REG_3;
  reg  [1:0]   t_io_update_u_0_REG_3;
  reg          t_io_update_mask_1_REG_3;
  reg          t_io_update_taken_1_REG_3;
  reg          t_io_update_alloc_1_REG_3;
  reg  [2:0]   t_io_update_old_ctr_1_REG_3;
  reg          t_io_update_u_mask_1_REG_3;
  reg  [1:0]   t_io_update_u_1_REG_3;
  reg          t_io_update_mask_2_REG_3;
  reg          t_io_update_taken_2_REG_3;
  reg          t_io_update_alloc_2_REG_3;
  reg  [2:0]   t_io_update_old_ctr_2_REG_3;
  reg          t_io_update_u_mask_2_REG_3;
  reg  [1:0]   t_io_update_u_2_REG_3;
  reg          t_io_update_mask_3_REG_3;
  reg          t_io_update_taken_3_REG_3;
  reg          t_io_update_alloc_3_REG_3;
  reg  [2:0]   t_io_update_old_ctr_3_REG_3;
  reg          t_io_update_u_mask_3_REG_3;
  reg  [1:0]   t_io_update_u_3_REG_3;
  reg  [39:0]  t_io_update_pc_REG_3;
  reg  [63:0]  t_io_update_hist_REG_3;
  reg          t_io_update_mask_0_REG_4;
  reg          t_io_update_taken_0_REG_4;
  reg          t_io_update_alloc_0_REG_4;
  reg  [2:0]   t_io_update_old_ctr_0_REG_4;
  reg          t_io_update_u_mask_0_REG_4;
  reg  [1:0]   t_io_update_u_0_REG_4;
  reg          t_io_update_mask_1_REG_4;
  reg          t_io_update_taken_1_REG_4;
  reg          t_io_update_alloc_1_REG_4;
  reg  [2:0]   t_io_update_old_ctr_1_REG_4;
  reg          t_io_update_u_mask_1_REG_4;
  reg  [1:0]   t_io_update_u_1_REG_4;
  reg          t_io_update_mask_2_REG_4;
  reg          t_io_update_taken_2_REG_4;
  reg          t_io_update_alloc_2_REG_4;
  reg  [2:0]   t_io_update_old_ctr_2_REG_4;
  reg          t_io_update_u_mask_2_REG_4;
  reg  [1:0]   t_io_update_u_2_REG_4;
  reg          t_io_update_mask_3_REG_4;
  reg          t_io_update_taken_3_REG_4;
  reg          t_io_update_alloc_3_REG_4;
  reg  [2:0]   t_io_update_old_ctr_3_REG_4;
  reg          t_io_update_u_mask_3_REG_4;
  reg  [1:0]   t_io_update_u_3_REG_4;
  reg  [39:0]  t_io_update_pc_REG_4;
  reg  [63:0]  t_io_update_hist_REG_4;
  reg          t_io_update_mask_0_REG_5;
  reg          t_io_update_taken_0_REG_5;
  reg          t_io_update_alloc_0_REG_5;
  reg  [2:0]   t_io_update_old_ctr_0_REG_5;
  reg          t_io_update_u_mask_0_REG_5;
  reg  [1:0]   t_io_update_u_0_REG_5;
  reg          t_io_update_mask_1_REG_5;
  reg          t_io_update_taken_1_REG_5;
  reg          t_io_update_alloc_1_REG_5;
  reg  [2:0]   t_io_update_old_ctr_1_REG_5;
  reg          t_io_update_u_mask_1_REG_5;
  reg  [1:0]   t_io_update_u_1_REG_5;
  reg          t_io_update_mask_2_REG_5;
  reg          t_io_update_taken_2_REG_5;
  reg          t_io_update_alloc_2_REG_5;
  reg  [2:0]   t_io_update_old_ctr_2_REG_5;
  reg          t_io_update_u_mask_2_REG_5;
  reg  [1:0]   t_io_update_u_2_REG_5;
  reg          t_io_update_mask_3_REG_5;
  reg          t_io_update_taken_3_REG_5;
  reg          t_io_update_alloc_3_REG_5;
  reg  [2:0]   t_io_update_old_ctr_3_REG_5;
  reg          t_io_update_u_mask_3_REG_5;
  reg  [1:0]   t_io_update_u_3_REG_5;
  reg  [39:0]  t_io_update_pc_REG_5;
  reg  [63:0]  t_io_update_hist_REG_5;
  wire         _GEN_47 = s1_update_bits_is_mispredict_update | s1_update_bits_is_repair_update | (|s1_update_bits_btb_mispredicts);
  wire         _GEN_48 = s1_update_bits_br_mask[0] & s1_update_valid & ~_GEN_47 & s1_update_bits_meta[43];
  wire         _GEN_49 = _GEN_48 & s1_update_bits_meta[42:40] == 3'h0;
  wire         _GEN_50 = _GEN_48 & s1_update_bits_meta[42:40] == 3'h1;
  wire         _GEN_51 = _GEN_48 & s1_update_bits_meta[42:40] == 3'h2;
  wire         _GEN_52 = _GEN_48 & s1_update_bits_meta[42:40] == 3'h3;
  wire         _GEN_53 = _GEN_48 & s1_update_bits_meta[42:40] == 3'h4;
  wire         _GEN_54 = _GEN_48 & s1_update_bits_meta[42:40] == 3'h5;
  wire [1:0]   new_u = s1_update_bits_meta[36] ? (s1_update_bits_cfi_idx_bits == 2'h0 & s1_update_bits_cfi_mispredicted ? (s1_update_bits_meta[29:28] == 2'h0 ? 2'h0 : s1_update_bits_meta[29:28] - 2'h1) : (&(s1_update_bits_meta[29:28])) ? 2'h3 : s1_update_bits_meta[29:28] + 2'h1) : s1_update_bits_meta[29:28];
  wire         _GEN_55 = s1_update_bits_br_mask[1] & s1_update_valid & ~_GEN_47 & s1_update_bits_meta[47];
  wire         _GEN_56 = _GEN_55 & s1_update_bits_meta[46:44] == 3'h0;
  wire         _GEN_57 = _GEN_55 & s1_update_bits_meta[46:44] == 3'h1;
  wire         _GEN_58 = _GEN_55 & s1_update_bits_meta[46:44] == 3'h2;
  wire         _GEN_59 = _GEN_55 & s1_update_bits_meta[46:44] == 3'h3;
  wire         _GEN_60 = _GEN_55 & s1_update_bits_meta[46:44] == 3'h4;
  wire         _GEN_61 = _GEN_55 & s1_update_bits_meta[46:44] == 3'h5;
  wire [1:0]   new_u_1 = s1_update_bits_meta[37] ? (s1_update_bits_cfi_idx_bits == 2'h1 & s1_update_bits_cfi_mispredicted ? (s1_update_bits_meta[31:30] == 2'h0 ? 2'h0 : s1_update_bits_meta[31:30] - 2'h1) : (&(s1_update_bits_meta[31:30])) ? 2'h3 : s1_update_bits_meta[31:30] + 2'h1) : s1_update_bits_meta[31:30];
  wire         _GEN_62 = s1_update_bits_br_mask[2] & s1_update_valid & ~_GEN_47 & s1_update_bits_meta[51];
  wire         _GEN_63 = _GEN_62 & s1_update_bits_meta[50:48] == 3'h0;
  wire         _GEN_64 = _GEN_62 & s1_update_bits_meta[50:48] == 3'h1;
  wire         _GEN_65 = _GEN_62 & s1_update_bits_meta[50:48] == 3'h2;
  wire         _GEN_66 = _GEN_62 & s1_update_bits_meta[50:48] == 3'h3;
  wire         _GEN_67 = _GEN_62 & s1_update_bits_meta[50:48] == 3'h4;
  wire         _GEN_68 = _GEN_62 & s1_update_bits_meta[50:48] == 3'h5;
  wire [1:0]   new_u_2 = s1_update_bits_meta[38] ? (s1_update_bits_cfi_idx_bits == 2'h2 & s1_update_bits_cfi_mispredicted ? (s1_update_bits_meta[33:32] == 2'h0 ? 2'h0 : s1_update_bits_meta[33:32] - 2'h1) : (&(s1_update_bits_meta[33:32])) ? 2'h3 : s1_update_bits_meta[33:32] + 2'h1) : s1_update_bits_meta[33:32];
  wire         _GEN_69 = s1_update_bits_br_mask[3] & s1_update_valid & ~_GEN_47 & s1_update_bits_meta[55];
  wire         _GEN_70 = _GEN_69 & s1_update_bits_meta[54:52] == 3'h0;
  wire         _GEN_71 = _GEN_69 & s1_update_bits_meta[54:52] == 3'h1;
  wire         _GEN_72 = _GEN_69 & s1_update_bits_meta[54:52] == 3'h2;
  wire         _GEN_73 = _GEN_69 & s1_update_bits_meta[54:52] == 3'h3;
  wire         _GEN_74 = _GEN_69 & s1_update_bits_meta[54:52] == 3'h4;
  wire         _GEN_75 = _GEN_69 & s1_update_bits_meta[54:52] == 3'h5;
  wire [1:0]   new_u_3 = s1_update_bits_meta[39] ? ((&s1_update_bits_cfi_idx_bits) & s1_update_bits_cfi_mispredicted ? (s1_update_bits_meta[35:34] == 2'h0 ? 2'h0 : s1_update_bits_meta[35:34] - 2'h1) : (&(s1_update_bits_meta[35:34])) ? 2'h3 : s1_update_bits_meta[35:34] + 2'h1) : s1_update_bits_meta[35:34];
  wire         _GEN_76 = s1_update_valid & ~_GEN_47 & s1_update_bits_cfi_mispredicted & s1_update_bits_cfi_idx_valid;
  wire         _GEN_77 = casez_tmp_8 == 3'h0;
  wire         _GEN_78 = _GEN_77 & ~(|s1_update_bits_cfi_idx_bits);
  wire         _GEN_79 = _GEN_76 & casez_tmp_7 & _GEN_78;
  wire         _GEN_80 = s1_update_bits_cfi_idx_bits == 2'h1;
  wire         _GEN_81 = _GEN_77 & _GEN_80;
  wire         _GEN_82 = _GEN_76 & casez_tmp_7 & _GEN_81;
  wire         _GEN_83 = s1_update_bits_cfi_idx_bits == 2'h2;
  wire         _GEN_84 = _GEN_77 & _GEN_83;
  wire         _GEN_85 = _GEN_76 & casez_tmp_7 & _GEN_84;
  wire         _GEN_86 = _GEN_77 & (&s1_update_bits_cfi_idx_bits);
  wire         _GEN_87 = _GEN_76 & casez_tmp_7 & _GEN_86;
  wire         _GEN_88 = casez_tmp_8 == 3'h1;
  wire         _GEN_89 = _GEN_88 & ~(|s1_update_bits_cfi_idx_bits);
  wire         _GEN_90 = _GEN_76 & casez_tmp_7 & _GEN_89;
  wire         _GEN_91 = _GEN_88 & _GEN_80;
  wire         _GEN_92 = _GEN_76 & casez_tmp_7 & _GEN_91;
  wire         _GEN_93 = _GEN_88 & _GEN_83;
  wire         _GEN_94 = _GEN_76 & casez_tmp_7 & _GEN_93;
  wire         _GEN_95 = _GEN_88 & (&s1_update_bits_cfi_idx_bits);
  wire         _GEN_96 = _GEN_76 & casez_tmp_7 & _GEN_95;
  wire         _GEN_97 = casez_tmp_8 == 3'h2;
  wire         _GEN_98 = _GEN_97 & ~(|s1_update_bits_cfi_idx_bits);
  wire         _GEN_99 = _GEN_76 & casez_tmp_7 & _GEN_98;
  wire         _GEN_100 = _GEN_97 & _GEN_80;
  wire         _GEN_101 = _GEN_76 & casez_tmp_7 & _GEN_100;
  wire         _GEN_102 = _GEN_97 & _GEN_83;
  wire         _GEN_103 = _GEN_76 & casez_tmp_7 & _GEN_102;
  wire         _GEN_104 = _GEN_97 & (&s1_update_bits_cfi_idx_bits);
  wire         _GEN_105 = _GEN_76 & casez_tmp_7 & _GEN_104;
  wire         _GEN_106 = casez_tmp_8 == 3'h3;
  wire         _GEN_107 = _GEN_106 & ~(|s1_update_bits_cfi_idx_bits);
  wire         _GEN_108 = _GEN_76 & casez_tmp_7 & _GEN_107;
  wire         _GEN_109 = _GEN_106 & _GEN_80;
  wire         _GEN_110 = _GEN_76 & casez_tmp_7 & _GEN_109;
  wire         _GEN_111 = _GEN_106 & _GEN_83;
  wire         _GEN_112 = _GEN_76 & casez_tmp_7 & _GEN_111;
  wire         _GEN_113 = _GEN_106 & (&s1_update_bits_cfi_idx_bits);
  wire         _GEN_114 = _GEN_76 & casez_tmp_7 & _GEN_113;
  wire         _GEN_115 = casez_tmp_8 == 3'h4;
  wire         _GEN_116 = _GEN_115 & ~(|s1_update_bits_cfi_idx_bits);
  wire         _GEN_117 = _GEN_76 & casez_tmp_7 & _GEN_116;
  wire         _GEN_118 = _GEN_115 & _GEN_80;
  wire         _GEN_119 = _GEN_76 & casez_tmp_7 & _GEN_118;
  wire         _GEN_120 = _GEN_115 & _GEN_83;
  wire         _GEN_121 = _GEN_76 & casez_tmp_7 & _GEN_120;
  wire         _GEN_122 = _GEN_115 & (&s1_update_bits_cfi_idx_bits);
  wire         _GEN_123 = _GEN_76 & casez_tmp_7 & _GEN_122;
  wire         _GEN_124 = casez_tmp_8 == 3'h5;
  wire         _GEN_125 = _GEN_124 & ~(|s1_update_bits_cfi_idx_bits);
  wire         _GEN_126 = _GEN_76 & casez_tmp_7 & _GEN_125;
  wire         _GEN_127 = _GEN_124 & _GEN_80;
  wire         _GEN_128 = _GEN_76 & casez_tmp_7 & _GEN_127;
  wire         _GEN_129 = _GEN_124 & _GEN_83;
  wire         _GEN_130 = _GEN_76 & casez_tmp_7 & _GEN_129;
  wire         _GEN_131 = _GEN_124 & (&s1_update_bits_cfi_idx_bits);
  wire         _GEN_132 = _GEN_76 & casez_tmp_7 & _GEN_131;
  wire         _GEN_133 = s1_update_bits_cfi_idx_valid & ~(|s1_update_bits_cfi_idx_bits);
  wire         _GEN_134 = s1_update_bits_cfi_idx_valid & s1_update_bits_cfi_idx_bits == 2'h1;
  wire         _GEN_135 = s1_update_bits_cfi_idx_valid & s1_update_bits_cfi_idx_bits == 2'h2;
  wire         _GEN_136 = s1_update_bits_cfi_idx_valid & (&s1_update_bits_cfi_idx_bits);
  wire         _GEN_137 = _GEN_76 & casez_tmp_7 & _GEN_77;
  wire         _GEN_138 = _GEN_76 & casez_tmp_7 & _GEN_88;
  wire         _GEN_139 = _GEN_76 & casez_tmp_7 & _GEN_97;
  wire         _GEN_140 = _GEN_76 & casez_tmp_7 & _GEN_106;
  wire         _GEN_141 = _GEN_76 & casez_tmp_7 & _GEN_115;
  wire         _GEN_142 = _GEN_76 & casez_tmp_7 & _GEN_124;
  wire [7:0]   _decr_mask_T_1 = 8'h1 << casez_tmp_10;
  wire [5:0]   _GEN_143 = _decr_mask_T_1[5:0] | _decr_mask_T_1[6:1] | _decr_mask_T_1[7:2];
  wire [4:0]   _GEN_144 = _GEN_143[4:0] | _decr_mask_T_1[7:3];
  wire [3:0]   _GEN_145 = _GEN_144[3:0] | _decr_mask_T_1[7:4];
  wire [2:0]   _GEN_146 = _GEN_145[2:0] | _decr_mask_T_1[7:5];
  wire [1:0]   _GEN_147 = _GEN_146[1:0] | _decr_mask_T_1[7:6];
  wire [5:0]   decr_mask = casez_tmp_9 ? ~{_GEN_143[5], _GEN_144[4], _GEN_145[3], _GEN_146[2], _GEN_147[1], _GEN_147[0] | (&casez_tmp_10)} : 6'h0;
  wire         _GEN_148 = decr_mask[0] & ~(|s1_update_bits_cfi_idx_bits);
  wire         _GEN_149 = decr_mask[0] & _GEN_80;
  wire         _GEN_150 = decr_mask[0] & _GEN_83;
  wire         _GEN_151 = decr_mask[0] & (&s1_update_bits_cfi_idx_bits);
  wire         _GEN_152 = decr_mask[1] & ~(|s1_update_bits_cfi_idx_bits);
  wire         _GEN_153 = decr_mask[1] & _GEN_80;
  wire         _GEN_154 = decr_mask[1] & _GEN_83;
  wire         _GEN_155 = decr_mask[1] & (&s1_update_bits_cfi_idx_bits);
  wire         _GEN_156 = decr_mask[2] & ~(|s1_update_bits_cfi_idx_bits);
  wire         _GEN_157 = decr_mask[2] & _GEN_80;
  wire         _GEN_158 = decr_mask[2] & _GEN_83;
  wire         _GEN_159 = decr_mask[2] & (&s1_update_bits_cfi_idx_bits);
  wire         _GEN_160 = decr_mask[3] & ~(|s1_update_bits_cfi_idx_bits);
  wire         _GEN_161 = decr_mask[3] & _GEN_80;
  wire         _GEN_162 = decr_mask[3] & _GEN_83;
  wire         _GEN_163 = decr_mask[3] & (&s1_update_bits_cfi_idx_bits);
  wire         _GEN_164 = decr_mask[4] & ~(|s1_update_bits_cfi_idx_bits);
  wire         _GEN_165 = decr_mask[4] & _GEN_80;
  wire         _GEN_166 = decr_mask[4] & _GEN_83;
  wire         _GEN_167 = decr_mask[4] & (&s1_update_bits_cfi_idx_bits);
  wire         _GEN_168 = decr_mask[5] & ~(|s1_update_bits_cfi_idx_bits);
  wire         _GEN_169 = decr_mask[5] & _GEN_80;
  wire         _GEN_170 = decr_mask[5] & _GEN_83;
  wire         _GEN_171 = decr_mask[5] & (&s1_update_bits_cfi_idx_bits);
  always @(posedge clock) begin
    s1_update_valid <= io_update_valid;
    s1_update_bits_is_mispredict_update <= io_update_bits_is_mispredict_update;
    s1_update_bits_is_repair_update <= io_update_bits_is_repair_update;
    s1_update_bits_btb_mispredicts <= io_update_bits_btb_mispredicts;
    s1_update_bits_pc <= io_update_bits_pc;
    s1_update_bits_br_mask <= io_update_bits_br_mask;
    s1_update_bits_cfi_idx_valid <= io_update_bits_cfi_idx_valid;
    s1_update_bits_cfi_idx_bits <= io_update_bits_cfi_idx_bits;
    s1_update_bits_cfi_taken <= io_update_bits_cfi_taken;
    s1_update_bits_cfi_mispredicted <= io_update_bits_cfi_mispredicted;
    s1_update_bits_ghist <= io_update_bits_ghist;
    s1_update_bits_meta <= io_update_bits_meta;
    t_io_f1_req_valid_REG <= io_f0_valid;
    t_io_f1_req_pc_REG <= io_f0_pc;
    t_io_f1_req_valid_REG_1 <= io_f0_valid;
    t_io_f1_req_pc_REG_1 <= io_f0_pc;
    t_io_f1_req_valid_REG_2 <= io_f0_valid;
    t_io_f1_req_pc_REG_2 <= io_f0_pc;
    t_io_f1_req_valid_REG_3 <= io_f0_valid;
    t_io_f1_req_pc_REG_3 <= io_f0_pc;
    t_io_f1_req_valid_REG_4 <= io_f0_valid;
    t_io_f1_req_pc_REG_4 <= io_f0_pc;
    t_io_f1_req_valid_REG_5 <= io_f0_valid;
    t_io_f1_req_pc_REG_5 <= io_f0_pc;
    t_io_update_mask_0_REG <= _GEN_79 | _GEN_49;
    t_io_update_taken_0_REG <= (_GEN_79 | _GEN_133) & s1_update_bits_cfi_taken;
    t_io_update_alloc_0_REG <= _GEN_137 & ~(|s1_update_bits_cfi_idx_bits);
    t_io_update_old_ctr_0_REG <= s1_update_bits_meta[18:16];
    t_io_update_u_mask_0_REG <= _GEN_76 ? (casez_tmp_7 ? _GEN_78 | _GEN_49 : _GEN_148 | _GEN_49) : _GEN_49;
    t_io_update_u_0_REG <= _GEN_76 & (casez_tmp_7 ? _GEN_78 : _GEN_148) ? 2'h0 : new_u;
    t_io_update_mask_1_REG <= _GEN_82 | _GEN_56;
    t_io_update_taken_1_REG <= (_GEN_82 | _GEN_134) & s1_update_bits_cfi_taken;
    t_io_update_alloc_1_REG <= _GEN_137 & _GEN_80;
    t_io_update_old_ctr_1_REG <= s1_update_bits_meta[21:19];
    t_io_update_u_mask_1_REG <= _GEN_76 ? (casez_tmp_7 ? _GEN_81 | _GEN_56 : _GEN_149 | _GEN_56) : _GEN_56;
    t_io_update_u_1_REG <= _GEN_76 & (casez_tmp_7 ? _GEN_81 : _GEN_149) ? 2'h0 : new_u_1;
    t_io_update_mask_2_REG <= _GEN_85 | _GEN_63;
    t_io_update_taken_2_REG <= (_GEN_85 | _GEN_135) & s1_update_bits_cfi_taken;
    t_io_update_alloc_2_REG <= _GEN_137 & _GEN_83;
    t_io_update_old_ctr_2_REG <= s1_update_bits_meta[24:22];
    t_io_update_u_mask_2_REG <= _GEN_76 ? (casez_tmp_7 ? _GEN_84 | _GEN_63 : _GEN_150 | _GEN_63) : _GEN_63;
    t_io_update_u_2_REG <= _GEN_76 & (casez_tmp_7 ? _GEN_84 : _GEN_150) ? 2'h0 : new_u_2;
    t_io_update_mask_3_REG <= _GEN_87 | _GEN_70;
    t_io_update_taken_3_REG <= (_GEN_87 | _GEN_136) & s1_update_bits_cfi_taken;
    t_io_update_alloc_3_REG <= _GEN_137 & (&s1_update_bits_cfi_idx_bits);
    t_io_update_old_ctr_3_REG <= s1_update_bits_meta[27:25];
    t_io_update_u_mask_3_REG <= _GEN_76 ? (casez_tmp_7 ? _GEN_86 | _GEN_70 : _GEN_151 | _GEN_70) : _GEN_70;
    t_io_update_u_3_REG <= _GEN_76 & (casez_tmp_7 ? _GEN_86 : _GEN_151) ? 2'h0 : new_u_3;
    t_io_update_pc_REG <= s1_update_bits_pc;
    t_io_update_hist_REG <= s1_update_bits_ghist;
    t_io_update_mask_0_REG_1 <= _GEN_90 | _GEN_50;
    t_io_update_taken_0_REG_1 <= (_GEN_90 | _GEN_133) & s1_update_bits_cfi_taken;
    t_io_update_alloc_0_REG_1 <= _GEN_138 & ~(|s1_update_bits_cfi_idx_bits);
    t_io_update_old_ctr_0_REG_1 <= s1_update_bits_meta[18:16];
    t_io_update_u_mask_0_REG_1 <= _GEN_76 ? (casez_tmp_7 ? _GEN_89 | _GEN_50 : _GEN_152 | _GEN_50) : _GEN_50;
    t_io_update_u_0_REG_1 <= _GEN_76 & (casez_tmp_7 ? _GEN_89 : _GEN_152) ? 2'h0 : new_u;
    t_io_update_mask_1_REG_1 <= _GEN_92 | _GEN_57;
    t_io_update_taken_1_REG_1 <= (_GEN_92 | _GEN_134) & s1_update_bits_cfi_taken;
    t_io_update_alloc_1_REG_1 <= _GEN_138 & _GEN_80;
    t_io_update_old_ctr_1_REG_1 <= s1_update_bits_meta[21:19];
    t_io_update_u_mask_1_REG_1 <= _GEN_76 ? (casez_tmp_7 ? _GEN_91 | _GEN_57 : _GEN_153 | _GEN_57) : _GEN_57;
    t_io_update_u_1_REG_1 <= _GEN_76 & (casez_tmp_7 ? _GEN_91 : _GEN_153) ? 2'h0 : new_u_1;
    t_io_update_mask_2_REG_1 <= _GEN_94 | _GEN_64;
    t_io_update_taken_2_REG_1 <= (_GEN_94 | _GEN_135) & s1_update_bits_cfi_taken;
    t_io_update_alloc_2_REG_1 <= _GEN_138 & _GEN_83;
    t_io_update_old_ctr_2_REG_1 <= s1_update_bits_meta[24:22];
    t_io_update_u_mask_2_REG_1 <= _GEN_76 ? (casez_tmp_7 ? _GEN_93 | _GEN_64 : _GEN_154 | _GEN_64) : _GEN_64;
    t_io_update_u_2_REG_1 <= _GEN_76 & (casez_tmp_7 ? _GEN_93 : _GEN_154) ? 2'h0 : new_u_2;
    t_io_update_mask_3_REG_1 <= _GEN_96 | _GEN_71;
    t_io_update_taken_3_REG_1 <= (_GEN_96 | _GEN_136) & s1_update_bits_cfi_taken;
    t_io_update_alloc_3_REG_1 <= _GEN_138 & (&s1_update_bits_cfi_idx_bits);
    t_io_update_old_ctr_3_REG_1 <= s1_update_bits_meta[27:25];
    t_io_update_u_mask_3_REG_1 <= _GEN_76 ? (casez_tmp_7 ? _GEN_95 | _GEN_71 : _GEN_155 | _GEN_71) : _GEN_71;
    t_io_update_u_3_REG_1 <= _GEN_76 & (casez_tmp_7 ? _GEN_95 : _GEN_155) ? 2'h0 : new_u_3;
    t_io_update_pc_REG_1 <= s1_update_bits_pc;
    t_io_update_hist_REG_1 <= s1_update_bits_ghist;
    t_io_update_mask_0_REG_2 <= _GEN_99 | _GEN_51;
    t_io_update_taken_0_REG_2 <= (_GEN_99 | _GEN_133) & s1_update_bits_cfi_taken;
    t_io_update_alloc_0_REG_2 <= _GEN_139 & ~(|s1_update_bits_cfi_idx_bits);
    t_io_update_old_ctr_0_REG_2 <= s1_update_bits_meta[18:16];
    t_io_update_u_mask_0_REG_2 <= _GEN_76 ? (casez_tmp_7 ? _GEN_98 | _GEN_51 : _GEN_156 | _GEN_51) : _GEN_51;
    t_io_update_u_0_REG_2 <= _GEN_76 & (casez_tmp_7 ? _GEN_98 : _GEN_156) ? 2'h0 : new_u;
    t_io_update_mask_1_REG_2 <= _GEN_101 | _GEN_58;
    t_io_update_taken_1_REG_2 <= (_GEN_101 | _GEN_134) & s1_update_bits_cfi_taken;
    t_io_update_alloc_1_REG_2 <= _GEN_139 & _GEN_80;
    t_io_update_old_ctr_1_REG_2 <= s1_update_bits_meta[21:19];
    t_io_update_u_mask_1_REG_2 <= _GEN_76 ? (casez_tmp_7 ? _GEN_100 | _GEN_58 : _GEN_157 | _GEN_58) : _GEN_58;
    t_io_update_u_1_REG_2 <= _GEN_76 & (casez_tmp_7 ? _GEN_100 : _GEN_157) ? 2'h0 : new_u_1;
    t_io_update_mask_2_REG_2 <= _GEN_103 | _GEN_65;
    t_io_update_taken_2_REG_2 <= (_GEN_103 | _GEN_135) & s1_update_bits_cfi_taken;
    t_io_update_alloc_2_REG_2 <= _GEN_139 & _GEN_83;
    t_io_update_old_ctr_2_REG_2 <= s1_update_bits_meta[24:22];
    t_io_update_u_mask_2_REG_2 <= _GEN_76 ? (casez_tmp_7 ? _GEN_102 | _GEN_65 : _GEN_158 | _GEN_65) : _GEN_65;
    t_io_update_u_2_REG_2 <= _GEN_76 & (casez_tmp_7 ? _GEN_102 : _GEN_158) ? 2'h0 : new_u_2;
    t_io_update_mask_3_REG_2 <= _GEN_105 | _GEN_72;
    t_io_update_taken_3_REG_2 <= (_GEN_105 | _GEN_136) & s1_update_bits_cfi_taken;
    t_io_update_alloc_3_REG_2 <= _GEN_139 & (&s1_update_bits_cfi_idx_bits);
    t_io_update_old_ctr_3_REG_2 <= s1_update_bits_meta[27:25];
    t_io_update_u_mask_3_REG_2 <= _GEN_76 ? (casez_tmp_7 ? _GEN_104 | _GEN_72 : _GEN_159 | _GEN_72) : _GEN_72;
    t_io_update_u_3_REG_2 <= _GEN_76 & (casez_tmp_7 ? _GEN_104 : _GEN_159) ? 2'h0 : new_u_3;
    t_io_update_pc_REG_2 <= s1_update_bits_pc;
    t_io_update_hist_REG_2 <= s1_update_bits_ghist;
    t_io_update_mask_0_REG_3 <= _GEN_108 | _GEN_52;
    t_io_update_taken_0_REG_3 <= (_GEN_108 | _GEN_133) & s1_update_bits_cfi_taken;
    t_io_update_alloc_0_REG_3 <= _GEN_140 & ~(|s1_update_bits_cfi_idx_bits);
    t_io_update_old_ctr_0_REG_3 <= s1_update_bits_meta[18:16];
    t_io_update_u_mask_0_REG_3 <= _GEN_76 ? (casez_tmp_7 ? _GEN_107 | _GEN_52 : _GEN_160 | _GEN_52) : _GEN_52;
    t_io_update_u_0_REG_3 <= _GEN_76 & (casez_tmp_7 ? _GEN_107 : _GEN_160) ? 2'h0 : new_u;
    t_io_update_mask_1_REG_3 <= _GEN_110 | _GEN_59;
    t_io_update_taken_1_REG_3 <= (_GEN_110 | _GEN_134) & s1_update_bits_cfi_taken;
    t_io_update_alloc_1_REG_3 <= _GEN_140 & _GEN_80;
    t_io_update_old_ctr_1_REG_3 <= s1_update_bits_meta[21:19];
    t_io_update_u_mask_1_REG_3 <= _GEN_76 ? (casez_tmp_7 ? _GEN_109 | _GEN_59 : _GEN_161 | _GEN_59) : _GEN_59;
    t_io_update_u_1_REG_3 <= _GEN_76 & (casez_tmp_7 ? _GEN_109 : _GEN_161) ? 2'h0 : new_u_1;
    t_io_update_mask_2_REG_3 <= _GEN_112 | _GEN_66;
    t_io_update_taken_2_REG_3 <= (_GEN_112 | _GEN_135) & s1_update_bits_cfi_taken;
    t_io_update_alloc_2_REG_3 <= _GEN_140 & _GEN_83;
    t_io_update_old_ctr_2_REG_3 <= s1_update_bits_meta[24:22];
    t_io_update_u_mask_2_REG_3 <= _GEN_76 ? (casez_tmp_7 ? _GEN_111 | _GEN_66 : _GEN_162 | _GEN_66) : _GEN_66;
    t_io_update_u_2_REG_3 <= _GEN_76 & (casez_tmp_7 ? _GEN_111 : _GEN_162) ? 2'h0 : new_u_2;
    t_io_update_mask_3_REG_3 <= _GEN_114 | _GEN_73;
    t_io_update_taken_3_REG_3 <= (_GEN_114 | _GEN_136) & s1_update_bits_cfi_taken;
    t_io_update_alloc_3_REG_3 <= _GEN_140 & (&s1_update_bits_cfi_idx_bits);
    t_io_update_old_ctr_3_REG_3 <= s1_update_bits_meta[27:25];
    t_io_update_u_mask_3_REG_3 <= _GEN_76 ? (casez_tmp_7 ? _GEN_113 | _GEN_73 : _GEN_163 | _GEN_73) : _GEN_73;
    t_io_update_u_3_REG_3 <= _GEN_76 & (casez_tmp_7 ? _GEN_113 : _GEN_163) ? 2'h0 : new_u_3;
    t_io_update_pc_REG_3 <= s1_update_bits_pc;
    t_io_update_hist_REG_3 <= s1_update_bits_ghist;
    t_io_update_mask_0_REG_4 <= _GEN_117 | _GEN_53;
    t_io_update_taken_0_REG_4 <= (_GEN_117 | _GEN_133) & s1_update_bits_cfi_taken;
    t_io_update_alloc_0_REG_4 <= _GEN_141 & ~(|s1_update_bits_cfi_idx_bits);
    t_io_update_old_ctr_0_REG_4 <= s1_update_bits_meta[18:16];
    t_io_update_u_mask_0_REG_4 <= _GEN_76 ? (casez_tmp_7 ? _GEN_116 | _GEN_53 : _GEN_164 | _GEN_53) : _GEN_53;
    t_io_update_u_0_REG_4 <= _GEN_76 & (casez_tmp_7 ? _GEN_116 : _GEN_164) ? 2'h0 : new_u;
    t_io_update_mask_1_REG_4 <= _GEN_119 | _GEN_60;
    t_io_update_taken_1_REG_4 <= (_GEN_119 | _GEN_134) & s1_update_bits_cfi_taken;
    t_io_update_alloc_1_REG_4 <= _GEN_141 & _GEN_80;
    t_io_update_old_ctr_1_REG_4 <= s1_update_bits_meta[21:19];
    t_io_update_u_mask_1_REG_4 <= _GEN_76 ? (casez_tmp_7 ? _GEN_118 | _GEN_60 : _GEN_165 | _GEN_60) : _GEN_60;
    t_io_update_u_1_REG_4 <= _GEN_76 & (casez_tmp_7 ? _GEN_118 : _GEN_165) ? 2'h0 : new_u_1;
    t_io_update_mask_2_REG_4 <= _GEN_121 | _GEN_67;
    t_io_update_taken_2_REG_4 <= (_GEN_121 | _GEN_135) & s1_update_bits_cfi_taken;
    t_io_update_alloc_2_REG_4 <= _GEN_141 & _GEN_83;
    t_io_update_old_ctr_2_REG_4 <= s1_update_bits_meta[24:22];
    t_io_update_u_mask_2_REG_4 <= _GEN_76 ? (casez_tmp_7 ? _GEN_120 | _GEN_67 : _GEN_166 | _GEN_67) : _GEN_67;
    t_io_update_u_2_REG_4 <= _GEN_76 & (casez_tmp_7 ? _GEN_120 : _GEN_166) ? 2'h0 : new_u_2;
    t_io_update_mask_3_REG_4 <= _GEN_123 | _GEN_74;
    t_io_update_taken_3_REG_4 <= (_GEN_123 | _GEN_136) & s1_update_bits_cfi_taken;
    t_io_update_alloc_3_REG_4 <= _GEN_141 & (&s1_update_bits_cfi_idx_bits);
    t_io_update_old_ctr_3_REG_4 <= s1_update_bits_meta[27:25];
    t_io_update_u_mask_3_REG_4 <= _GEN_76 ? (casez_tmp_7 ? _GEN_122 | _GEN_74 : _GEN_167 | _GEN_74) : _GEN_74;
    t_io_update_u_3_REG_4 <= _GEN_76 & (casez_tmp_7 ? _GEN_122 : _GEN_167) ? 2'h0 : new_u_3;
    t_io_update_pc_REG_4 <= s1_update_bits_pc;
    t_io_update_hist_REG_4 <= s1_update_bits_ghist;
    t_io_update_mask_0_REG_5 <= _GEN_126 | _GEN_54;
    t_io_update_taken_0_REG_5 <= (_GEN_126 | _GEN_133) & s1_update_bits_cfi_taken;
    t_io_update_alloc_0_REG_5 <= _GEN_142 & ~(|s1_update_bits_cfi_idx_bits);
    t_io_update_old_ctr_0_REG_5 <= s1_update_bits_meta[18:16];
    t_io_update_u_mask_0_REG_5 <= _GEN_76 ? (casez_tmp_7 ? _GEN_125 | _GEN_54 : _GEN_168 | _GEN_54) : _GEN_54;
    t_io_update_u_0_REG_5 <= _GEN_76 & (casez_tmp_7 ? _GEN_125 : _GEN_168) ? 2'h0 : new_u;
    t_io_update_mask_1_REG_5 <= _GEN_128 | _GEN_61;
    t_io_update_taken_1_REG_5 <= (_GEN_128 | _GEN_134) & s1_update_bits_cfi_taken;
    t_io_update_alloc_1_REG_5 <= _GEN_142 & _GEN_80;
    t_io_update_old_ctr_1_REG_5 <= s1_update_bits_meta[21:19];
    t_io_update_u_mask_1_REG_5 <= _GEN_76 ? (casez_tmp_7 ? _GEN_127 | _GEN_61 : _GEN_169 | _GEN_61) : _GEN_61;
    t_io_update_u_1_REG_5 <= _GEN_76 & (casez_tmp_7 ? _GEN_127 : _GEN_169) ? 2'h0 : new_u_1;
    t_io_update_mask_2_REG_5 <= _GEN_130 | _GEN_68;
    t_io_update_taken_2_REG_5 <= (_GEN_130 | _GEN_135) & s1_update_bits_cfi_taken;
    t_io_update_alloc_2_REG_5 <= _GEN_142 & _GEN_83;
    t_io_update_old_ctr_2_REG_5 <= s1_update_bits_meta[24:22];
    t_io_update_u_mask_2_REG_5 <= _GEN_76 ? (casez_tmp_7 ? _GEN_129 | _GEN_68 : _GEN_170 | _GEN_68) : _GEN_68;
    t_io_update_u_2_REG_5 <= _GEN_76 & (casez_tmp_7 ? _GEN_129 : _GEN_170) ? 2'h0 : new_u_2;
    t_io_update_mask_3_REG_5 <= _GEN_132 | _GEN_75;
    t_io_update_taken_3_REG_5 <= (_GEN_132 | _GEN_136) & s1_update_bits_cfi_taken;
    t_io_update_alloc_3_REG_5 <= _GEN_142 & (&s1_update_bits_cfi_idx_bits);
    t_io_update_old_ctr_3_REG_5 <= s1_update_bits_meta[27:25];
    t_io_update_u_mask_3_REG_5 <= _GEN_76 ? (casez_tmp_7 ? _GEN_131 | _GEN_75 : _GEN_171 | _GEN_75) : _GEN_75;
    t_io_update_u_3_REG_5 <= _GEN_76 & (casez_tmp_7 ? _GEN_131 : _GEN_171) ? 2'h0 : new_u_3;
    t_io_update_pc_REG_5 <= s1_update_bits_pc;
    t_io_update_hist_REG_5 <= s1_update_bits_ghist;
  end // always @(posedge)
  TageTable t (
    .clock                 (clock),
    .reset                 (reset),
    .io_f1_req_valid       (t_io_f1_req_valid_REG),
    .io_f1_req_pc          (t_io_f1_req_pc_REG),
    .io_f1_req_ghist       (io_f1_ghist),
    .io_f3_resp_0_valid    (_t_io_f3_resp_0_valid),
    .io_f3_resp_0_bits_ctr (_t_io_f3_resp_0_bits_ctr),
    .io_f3_resp_0_bits_u   (_t_io_f3_resp_0_bits_u),
    .io_f3_resp_1_valid    (_t_io_f3_resp_1_valid),
    .io_f3_resp_1_bits_ctr (_t_io_f3_resp_1_bits_ctr),
    .io_f3_resp_1_bits_u   (_t_io_f3_resp_1_bits_u),
    .io_f3_resp_2_valid    (_t_io_f3_resp_2_valid),
    .io_f3_resp_2_bits_ctr (_t_io_f3_resp_2_bits_ctr),
    .io_f3_resp_2_bits_u   (_t_io_f3_resp_2_bits_u),
    .io_f3_resp_3_valid    (_t_io_f3_resp_3_valid),
    .io_f3_resp_3_bits_ctr (_t_io_f3_resp_3_bits_ctr),
    .io_f3_resp_3_bits_u   (_t_io_f3_resp_3_bits_u),
    .io_update_mask_0      (t_io_update_mask_0_REG),
    .io_update_mask_1      (t_io_update_mask_1_REG),
    .io_update_mask_2      (t_io_update_mask_2_REG),
    .io_update_mask_3      (t_io_update_mask_3_REG),
    .io_update_taken_0     (t_io_update_taken_0_REG),
    .io_update_taken_1     (t_io_update_taken_1_REG),
    .io_update_taken_2     (t_io_update_taken_2_REG),
    .io_update_taken_3     (t_io_update_taken_3_REG),
    .io_update_alloc_0     (t_io_update_alloc_0_REG),
    .io_update_alloc_1     (t_io_update_alloc_1_REG),
    .io_update_alloc_2     (t_io_update_alloc_2_REG),
    .io_update_alloc_3     (t_io_update_alloc_3_REG),
    .io_update_old_ctr_0   (t_io_update_old_ctr_0_REG),
    .io_update_old_ctr_1   (t_io_update_old_ctr_1_REG),
    .io_update_old_ctr_2   (t_io_update_old_ctr_2_REG),
    .io_update_old_ctr_3   (t_io_update_old_ctr_3_REG),
    .io_update_pc          (t_io_update_pc_REG),
    .io_update_hist        (t_io_update_hist_REG),
    .io_update_u_mask_0    (t_io_update_u_mask_0_REG),
    .io_update_u_mask_1    (t_io_update_u_mask_1_REG),
    .io_update_u_mask_2    (t_io_update_u_mask_2_REG),
    .io_update_u_mask_3    (t_io_update_u_mask_3_REG),
    .io_update_u_0         (t_io_update_u_0_REG),
    .io_update_u_1         (t_io_update_u_1_REG),
    .io_update_u_2         (t_io_update_u_2_REG),
    .io_update_u_3         (t_io_update_u_3_REG)
  );
  TageTable_1 t_1 (
    .clock                 (clock),
    .reset                 (reset),
    .io_f1_req_valid       (t_io_f1_req_valid_REG_1),
    .io_f1_req_pc          (t_io_f1_req_pc_REG_1),
    .io_f1_req_ghist       (io_f1_ghist),
    .io_f3_resp_0_valid    (_t_1_io_f3_resp_0_valid),
    .io_f3_resp_0_bits_ctr (_t_1_io_f3_resp_0_bits_ctr),
    .io_f3_resp_0_bits_u   (_t_1_io_f3_resp_0_bits_u),
    .io_f3_resp_1_valid    (_t_1_io_f3_resp_1_valid),
    .io_f3_resp_1_bits_ctr (_t_1_io_f3_resp_1_bits_ctr),
    .io_f3_resp_1_bits_u   (_t_1_io_f3_resp_1_bits_u),
    .io_f3_resp_2_valid    (_t_1_io_f3_resp_2_valid),
    .io_f3_resp_2_bits_ctr (_t_1_io_f3_resp_2_bits_ctr),
    .io_f3_resp_2_bits_u   (_t_1_io_f3_resp_2_bits_u),
    .io_f3_resp_3_valid    (_t_1_io_f3_resp_3_valid),
    .io_f3_resp_3_bits_ctr (_t_1_io_f3_resp_3_bits_ctr),
    .io_f3_resp_3_bits_u   (_t_1_io_f3_resp_3_bits_u),
    .io_update_mask_0      (t_io_update_mask_0_REG_1),
    .io_update_mask_1      (t_io_update_mask_1_REG_1),
    .io_update_mask_2      (t_io_update_mask_2_REG_1),
    .io_update_mask_3      (t_io_update_mask_3_REG_1),
    .io_update_taken_0     (t_io_update_taken_0_REG_1),
    .io_update_taken_1     (t_io_update_taken_1_REG_1),
    .io_update_taken_2     (t_io_update_taken_2_REG_1),
    .io_update_taken_3     (t_io_update_taken_3_REG_1),
    .io_update_alloc_0     (t_io_update_alloc_0_REG_1),
    .io_update_alloc_1     (t_io_update_alloc_1_REG_1),
    .io_update_alloc_2     (t_io_update_alloc_2_REG_1),
    .io_update_alloc_3     (t_io_update_alloc_3_REG_1),
    .io_update_old_ctr_0   (t_io_update_old_ctr_0_REG_1),
    .io_update_old_ctr_1   (t_io_update_old_ctr_1_REG_1),
    .io_update_old_ctr_2   (t_io_update_old_ctr_2_REG_1),
    .io_update_old_ctr_3   (t_io_update_old_ctr_3_REG_1),
    .io_update_pc          (t_io_update_pc_REG_1),
    .io_update_hist        (t_io_update_hist_REG_1),
    .io_update_u_mask_0    (t_io_update_u_mask_0_REG_1),
    .io_update_u_mask_1    (t_io_update_u_mask_1_REG_1),
    .io_update_u_mask_2    (t_io_update_u_mask_2_REG_1),
    .io_update_u_mask_3    (t_io_update_u_mask_3_REG_1),
    .io_update_u_0         (t_io_update_u_0_REG_1),
    .io_update_u_1         (t_io_update_u_1_REG_1),
    .io_update_u_2         (t_io_update_u_2_REG_1),
    .io_update_u_3         (t_io_update_u_3_REG_1)
  );
  TageTable_2 t_2 (
    .clock                 (clock),
    .reset                 (reset),
    .io_f1_req_valid       (t_io_f1_req_valid_REG_2),
    .io_f1_req_pc          (t_io_f1_req_pc_REG_2),
    .io_f1_req_ghist       (io_f1_ghist),
    .io_f3_resp_0_valid    (_t_2_io_f3_resp_0_valid),
    .io_f3_resp_0_bits_ctr (_t_2_io_f3_resp_0_bits_ctr),
    .io_f3_resp_0_bits_u   (_t_2_io_f3_resp_0_bits_u),
    .io_f3_resp_1_valid    (_t_2_io_f3_resp_1_valid),
    .io_f3_resp_1_bits_ctr (_t_2_io_f3_resp_1_bits_ctr),
    .io_f3_resp_1_bits_u   (_t_2_io_f3_resp_1_bits_u),
    .io_f3_resp_2_valid    (_t_2_io_f3_resp_2_valid),
    .io_f3_resp_2_bits_ctr (_t_2_io_f3_resp_2_bits_ctr),
    .io_f3_resp_2_bits_u   (_t_2_io_f3_resp_2_bits_u),
    .io_f3_resp_3_valid    (_t_2_io_f3_resp_3_valid),
    .io_f3_resp_3_bits_ctr (_t_2_io_f3_resp_3_bits_ctr),
    .io_f3_resp_3_bits_u   (_t_2_io_f3_resp_3_bits_u),
    .io_update_mask_0      (t_io_update_mask_0_REG_2),
    .io_update_mask_1      (t_io_update_mask_1_REG_2),
    .io_update_mask_2      (t_io_update_mask_2_REG_2),
    .io_update_mask_3      (t_io_update_mask_3_REG_2),
    .io_update_taken_0     (t_io_update_taken_0_REG_2),
    .io_update_taken_1     (t_io_update_taken_1_REG_2),
    .io_update_taken_2     (t_io_update_taken_2_REG_2),
    .io_update_taken_3     (t_io_update_taken_3_REG_2),
    .io_update_alloc_0     (t_io_update_alloc_0_REG_2),
    .io_update_alloc_1     (t_io_update_alloc_1_REG_2),
    .io_update_alloc_2     (t_io_update_alloc_2_REG_2),
    .io_update_alloc_3     (t_io_update_alloc_3_REG_2),
    .io_update_old_ctr_0   (t_io_update_old_ctr_0_REG_2),
    .io_update_old_ctr_1   (t_io_update_old_ctr_1_REG_2),
    .io_update_old_ctr_2   (t_io_update_old_ctr_2_REG_2),
    .io_update_old_ctr_3   (t_io_update_old_ctr_3_REG_2),
    .io_update_pc          (t_io_update_pc_REG_2),
    .io_update_hist        (t_io_update_hist_REG_2),
    .io_update_u_mask_0    (t_io_update_u_mask_0_REG_2),
    .io_update_u_mask_1    (t_io_update_u_mask_1_REG_2),
    .io_update_u_mask_2    (t_io_update_u_mask_2_REG_2),
    .io_update_u_mask_3    (t_io_update_u_mask_3_REG_2),
    .io_update_u_0         (t_io_update_u_0_REG_2),
    .io_update_u_1         (t_io_update_u_1_REG_2),
    .io_update_u_2         (t_io_update_u_2_REG_2),
    .io_update_u_3         (t_io_update_u_3_REG_2)
  );
  TageTable_3 t_3 (
    .clock                 (clock),
    .reset                 (reset),
    .io_f1_req_valid       (t_io_f1_req_valid_REG_3),
    .io_f1_req_pc          (t_io_f1_req_pc_REG_3),
    .io_f1_req_ghist       (io_f1_ghist),
    .io_f3_resp_0_valid    (_t_3_io_f3_resp_0_valid),
    .io_f3_resp_0_bits_ctr (_t_3_io_f3_resp_0_bits_ctr),
    .io_f3_resp_0_bits_u   (_t_3_io_f3_resp_0_bits_u),
    .io_f3_resp_1_valid    (_t_3_io_f3_resp_1_valid),
    .io_f3_resp_1_bits_ctr (_t_3_io_f3_resp_1_bits_ctr),
    .io_f3_resp_1_bits_u   (_t_3_io_f3_resp_1_bits_u),
    .io_f3_resp_2_valid    (_t_3_io_f3_resp_2_valid),
    .io_f3_resp_2_bits_ctr (_t_3_io_f3_resp_2_bits_ctr),
    .io_f3_resp_2_bits_u   (_t_3_io_f3_resp_2_bits_u),
    .io_f3_resp_3_valid    (_t_3_io_f3_resp_3_valid),
    .io_f3_resp_3_bits_ctr (_t_3_io_f3_resp_3_bits_ctr),
    .io_f3_resp_3_bits_u   (_t_3_io_f3_resp_3_bits_u),
    .io_update_mask_0      (t_io_update_mask_0_REG_3),
    .io_update_mask_1      (t_io_update_mask_1_REG_3),
    .io_update_mask_2      (t_io_update_mask_2_REG_3),
    .io_update_mask_3      (t_io_update_mask_3_REG_3),
    .io_update_taken_0     (t_io_update_taken_0_REG_3),
    .io_update_taken_1     (t_io_update_taken_1_REG_3),
    .io_update_taken_2     (t_io_update_taken_2_REG_3),
    .io_update_taken_3     (t_io_update_taken_3_REG_3),
    .io_update_alloc_0     (t_io_update_alloc_0_REG_3),
    .io_update_alloc_1     (t_io_update_alloc_1_REG_3),
    .io_update_alloc_2     (t_io_update_alloc_2_REG_3),
    .io_update_alloc_3     (t_io_update_alloc_3_REG_3),
    .io_update_old_ctr_0   (t_io_update_old_ctr_0_REG_3),
    .io_update_old_ctr_1   (t_io_update_old_ctr_1_REG_3),
    .io_update_old_ctr_2   (t_io_update_old_ctr_2_REG_3),
    .io_update_old_ctr_3   (t_io_update_old_ctr_3_REG_3),
    .io_update_pc          (t_io_update_pc_REG_3),
    .io_update_hist        (t_io_update_hist_REG_3),
    .io_update_u_mask_0    (t_io_update_u_mask_0_REG_3),
    .io_update_u_mask_1    (t_io_update_u_mask_1_REG_3),
    .io_update_u_mask_2    (t_io_update_u_mask_2_REG_3),
    .io_update_u_mask_3    (t_io_update_u_mask_3_REG_3),
    .io_update_u_0         (t_io_update_u_0_REG_3),
    .io_update_u_1         (t_io_update_u_1_REG_3),
    .io_update_u_2         (t_io_update_u_2_REG_3),
    .io_update_u_3         (t_io_update_u_3_REG_3)
  );
  TageTable_4 t_4 (
    .clock                 (clock),
    .reset                 (reset),
    .io_f1_req_valid       (t_io_f1_req_valid_REG_4),
    .io_f1_req_pc          (t_io_f1_req_pc_REG_4),
    .io_f1_req_ghist       (io_f1_ghist),
    .io_f3_resp_0_valid    (_t_4_io_f3_resp_0_valid),
    .io_f3_resp_0_bits_ctr (_t_4_io_f3_resp_0_bits_ctr),
    .io_f3_resp_0_bits_u   (_t_4_io_f3_resp_0_bits_u),
    .io_f3_resp_1_valid    (_t_4_io_f3_resp_1_valid),
    .io_f3_resp_1_bits_ctr (_t_4_io_f3_resp_1_bits_ctr),
    .io_f3_resp_1_bits_u   (_t_4_io_f3_resp_1_bits_u),
    .io_f3_resp_2_valid    (_t_4_io_f3_resp_2_valid),
    .io_f3_resp_2_bits_ctr (_t_4_io_f3_resp_2_bits_ctr),
    .io_f3_resp_2_bits_u   (_t_4_io_f3_resp_2_bits_u),
    .io_f3_resp_3_valid    (_t_4_io_f3_resp_3_valid),
    .io_f3_resp_3_bits_ctr (_t_4_io_f3_resp_3_bits_ctr),
    .io_f3_resp_3_bits_u   (_t_4_io_f3_resp_3_bits_u),
    .io_update_mask_0      (t_io_update_mask_0_REG_4),
    .io_update_mask_1      (t_io_update_mask_1_REG_4),
    .io_update_mask_2      (t_io_update_mask_2_REG_4),
    .io_update_mask_3      (t_io_update_mask_3_REG_4),
    .io_update_taken_0     (t_io_update_taken_0_REG_4),
    .io_update_taken_1     (t_io_update_taken_1_REG_4),
    .io_update_taken_2     (t_io_update_taken_2_REG_4),
    .io_update_taken_3     (t_io_update_taken_3_REG_4),
    .io_update_alloc_0     (t_io_update_alloc_0_REG_4),
    .io_update_alloc_1     (t_io_update_alloc_1_REG_4),
    .io_update_alloc_2     (t_io_update_alloc_2_REG_4),
    .io_update_alloc_3     (t_io_update_alloc_3_REG_4),
    .io_update_old_ctr_0   (t_io_update_old_ctr_0_REG_4),
    .io_update_old_ctr_1   (t_io_update_old_ctr_1_REG_4),
    .io_update_old_ctr_2   (t_io_update_old_ctr_2_REG_4),
    .io_update_old_ctr_3   (t_io_update_old_ctr_3_REG_4),
    .io_update_pc          (t_io_update_pc_REG_4),
    .io_update_hist        (t_io_update_hist_REG_4),
    .io_update_u_mask_0    (t_io_update_u_mask_0_REG_4),
    .io_update_u_mask_1    (t_io_update_u_mask_1_REG_4),
    .io_update_u_mask_2    (t_io_update_u_mask_2_REG_4),
    .io_update_u_mask_3    (t_io_update_u_mask_3_REG_4),
    .io_update_u_0         (t_io_update_u_0_REG_4),
    .io_update_u_1         (t_io_update_u_1_REG_4),
    .io_update_u_2         (t_io_update_u_2_REG_4),
    .io_update_u_3         (t_io_update_u_3_REG_4)
  );
  TageTable_5 t_5 (
    .clock                 (clock),
    .reset                 (reset),
    .io_f1_req_valid       (t_io_f1_req_valid_REG_5),
    .io_f1_req_pc          (t_io_f1_req_pc_REG_5),
    .io_f1_req_ghist       (io_f1_ghist),
    .io_f3_resp_0_valid    (_t_5_io_f3_resp_0_valid),
    .io_f3_resp_0_bits_ctr (_t_5_io_f3_resp_0_bits_ctr),
    .io_f3_resp_0_bits_u   (_t_5_io_f3_resp_0_bits_u),
    .io_f3_resp_1_valid    (_t_5_io_f3_resp_1_valid),
    .io_f3_resp_1_bits_ctr (_t_5_io_f3_resp_1_bits_ctr),
    .io_f3_resp_1_bits_u   (_t_5_io_f3_resp_1_bits_u),
    .io_f3_resp_2_valid    (_t_5_io_f3_resp_2_valid),
    .io_f3_resp_2_bits_ctr (_t_5_io_f3_resp_2_bits_ctr),
    .io_f3_resp_2_bits_u   (_t_5_io_f3_resp_2_bits_u),
    .io_f3_resp_3_valid    (_t_5_io_f3_resp_3_valid),
    .io_f3_resp_3_bits_ctr (_t_5_io_f3_resp_3_bits_ctr),
    .io_f3_resp_3_bits_u   (_t_5_io_f3_resp_3_bits_u),
    .io_update_mask_0      (t_io_update_mask_0_REG_5),
    .io_update_mask_1      (t_io_update_mask_1_REG_5),
    .io_update_mask_2      (t_io_update_mask_2_REG_5),
    .io_update_mask_3      (t_io_update_mask_3_REG_5),
    .io_update_taken_0     (t_io_update_taken_0_REG_5),
    .io_update_taken_1     (t_io_update_taken_1_REG_5),
    .io_update_taken_2     (t_io_update_taken_2_REG_5),
    .io_update_taken_3     (t_io_update_taken_3_REG_5),
    .io_update_alloc_0     (t_io_update_alloc_0_REG_5),
    .io_update_alloc_1     (t_io_update_alloc_1_REG_5),
    .io_update_alloc_2     (t_io_update_alloc_2_REG_5),
    .io_update_alloc_3     (t_io_update_alloc_3_REG_5),
    .io_update_old_ctr_0   (t_io_update_old_ctr_0_REG_5),
    .io_update_old_ctr_1   (t_io_update_old_ctr_1_REG_5),
    .io_update_old_ctr_2   (t_io_update_old_ctr_2_REG_5),
    .io_update_old_ctr_3   (t_io_update_old_ctr_3_REG_5),
    .io_update_pc          (t_io_update_pc_REG_5),
    .io_update_hist        (t_io_update_hist_REG_5),
    .io_update_u_mask_0    (t_io_update_u_mask_0_REG_5),
    .io_update_u_mask_1    (t_io_update_u_mask_1_REG_5),
    .io_update_u_mask_2    (t_io_update_u_mask_2_REG_5),
    .io_update_u_mask_3    (t_io_update_u_mask_3_REG_5),
    .io_update_u_0         (t_io_update_u_0_REG_5),
    .io_update_u_1         (t_io_update_u_1_REG_5),
    .io_update_u_2         (t_io_update_u_2_REG_5),
    .io_update_u_3         (t_io_update_u_3_REG_5)
  );
  MaxPeriodFibonacciLFSR_3 alloc_lfsr_prng (
    .clock    (clock),
    .reset    (reset),
    .io_out_0 (_alloc_lfsr_prng_io_out_0),
    .io_out_1 (_alloc_lfsr_prng_io_out_1),
    .io_out_2 (_alloc_lfsr_prng_io_out_2),
    .io_out_3 (_alloc_lfsr_prng_io_out_3),
    .io_out_4 (_alloc_lfsr_prng_io_out_4),
    .io_out_5 (_alloc_lfsr_prng_io_out_5)
  );
  MaxPeriodFibonacciLFSR_3 alloc_lfsr_prng_1 (
    .clock    (clock),
    .reset    (reset),
    .io_out_0 (_alloc_lfsr_prng_1_io_out_0),
    .io_out_1 (_alloc_lfsr_prng_1_io_out_1),
    .io_out_2 (_alloc_lfsr_prng_1_io_out_2),
    .io_out_3 (_alloc_lfsr_prng_1_io_out_3),
    .io_out_4 (_alloc_lfsr_prng_1_io_out_4),
    .io_out_5 (_alloc_lfsr_prng_1_io_out_5)
  );
  MaxPeriodFibonacciLFSR_3 alloc_lfsr_prng_2 (
    .clock    (clock),
    .reset    (reset),
    .io_out_0 (_alloc_lfsr_prng_2_io_out_0),
    .io_out_1 (_alloc_lfsr_prng_2_io_out_1),
    .io_out_2 (_alloc_lfsr_prng_2_io_out_2),
    .io_out_3 (_alloc_lfsr_prng_2_io_out_3),
    .io_out_4 (_alloc_lfsr_prng_2_io_out_4),
    .io_out_5 (_alloc_lfsr_prng_2_io_out_5)
  );
  MaxPeriodFibonacciLFSR_3 alloc_lfsr_prng_3 (
    .clock    (clock),
    .reset    (reset),
    .io_out_0 (_alloc_lfsr_prng_3_io_out_0),
    .io_out_1 (_alloc_lfsr_prng_3_io_out_1),
    .io_out_2 (_alloc_lfsr_prng_3_io_out_2),
    .io_out_3 (_alloc_lfsr_prng_3_io_out_3),
    .io_out_4 (_alloc_lfsr_prng_3_io_out_4),
    .io_out_5 (_alloc_lfsr_prng_3_io_out_5)
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
  assign io_resp_f2_0_taken = io_resp_in_0_f2_0_taken;
  assign io_resp_f2_0_is_br = io_resp_in_0_f2_0_is_br;
  assign io_resp_f2_0_is_jal = io_resp_in_0_f2_0_is_jal;
  assign io_resp_f2_0_predicted_pc_valid = io_resp_in_0_f2_0_predicted_pc_valid;
  assign io_resp_f2_0_predicted_pc_bits = io_resp_in_0_f2_0_predicted_pc_bits;
  assign io_resp_f2_1_taken = io_resp_in_0_f2_1_taken;
  assign io_resp_f2_1_is_br = io_resp_in_0_f2_1_is_br;
  assign io_resp_f2_1_is_jal = io_resp_in_0_f2_1_is_jal;
  assign io_resp_f2_1_predicted_pc_valid = io_resp_in_0_f2_1_predicted_pc_valid;
  assign io_resp_f2_1_predicted_pc_bits = io_resp_in_0_f2_1_predicted_pc_bits;
  assign io_resp_f2_2_taken = io_resp_in_0_f2_2_taken;
  assign io_resp_f2_2_is_br = io_resp_in_0_f2_2_is_br;
  assign io_resp_f2_2_is_jal = io_resp_in_0_f2_2_is_jal;
  assign io_resp_f2_2_predicted_pc_valid = io_resp_in_0_f2_2_predicted_pc_valid;
  assign io_resp_f2_2_predicted_pc_bits = io_resp_in_0_f2_2_predicted_pc_bits;
  assign io_resp_f2_3_taken = io_resp_in_0_f2_3_taken;
  assign io_resp_f2_3_is_br = io_resp_in_0_f2_3_is_br;
  assign io_resp_f2_3_is_jal = io_resp_in_0_f2_3_is_jal;
  assign io_resp_f2_3_predicted_pc_valid = io_resp_in_0_f2_3_predicted_pc_valid;
  assign io_resp_f2_3_predicted_pc_bits = io_resp_in_0_f2_3_predicted_pc_bits;
  assign io_resp_f3_0_taken = _io_resp_f3_0_taken_output;
  assign io_resp_f3_0_is_br = io_resp_in_0_f3_0_is_br;
  assign io_resp_f3_0_is_jal = io_resp_in_0_f3_0_is_jal;
  assign io_resp_f3_0_predicted_pc_valid = io_resp_in_0_f3_0_predicted_pc_valid;
  assign io_resp_f3_0_predicted_pc_bits = io_resp_in_0_f3_0_predicted_pc_bits;
  assign io_resp_f3_1_taken = _io_resp_f3_1_taken_output;
  assign io_resp_f3_1_is_br = io_resp_in_0_f3_1_is_br;
  assign io_resp_f3_1_is_jal = io_resp_in_0_f3_1_is_jal;
  assign io_resp_f3_1_predicted_pc_valid = io_resp_in_0_f3_1_predicted_pc_valid;
  assign io_resp_f3_1_predicted_pc_bits = io_resp_in_0_f3_1_predicted_pc_bits;
  assign io_resp_f3_2_taken = _io_resp_f3_2_taken_output;
  assign io_resp_f3_2_is_br = io_resp_in_0_f3_2_is_br;
  assign io_resp_f3_2_is_jal = io_resp_in_0_f3_2_is_jal;
  assign io_resp_f3_2_predicted_pc_valid = io_resp_in_0_f3_2_predicted_pc_valid;
  assign io_resp_f3_2_predicted_pc_bits = io_resp_in_0_f3_2_predicted_pc_bits;
  assign io_resp_f3_3_taken = _io_resp_f3_3_taken_output;
  assign io_resp_f3_3_is_br = io_resp_in_0_f3_3_is_br;
  assign io_resp_f3_3_is_jal = io_resp_in_0_f3_3_is_jal;
  assign io_resp_f3_3_predicted_pc_valid = io_resp_in_0_f3_3_predicted_pc_valid;
  assign io_resp_f3_3_predicted_pc_bits = io_resp_in_0_f3_3_predicted_pc_bits;
  assign io_f3_meta =
    {64'h0,
     f3_meta_provider_3_valid,
     f3_meta_provider_3_bits,
     f3_meta_provider_2_valid,
     f3_meta_provider_2_bits,
     f3_meta_provider_1_valid,
     f3_meta_provider_1_bits,
     f3_meta_provider_0_valid,
     f3_meta_provider_0_bits,
     (_t_5_io_f3_resp_3_valid ? _GEN_39 : _t_4_io_f3_resp_3_valid ? _GEN_38 : _t_3_io_f3_resp_3_valid ? _GEN_37 : _t_2_io_f3_resp_3_valid ? _GEN_36 : _t_1_io_f3_resp_3_valid & _t_io_f3_resp_3_valid ? _t_io_f3_resp_3_bits_ctr[2] : io_resp_in_0_f3_3_taken) != _io_resp_f3_3_taken_output,
     (_t_5_io_f3_resp_2_valid ? _GEN_27 : _t_4_io_f3_resp_2_valid ? _GEN_26 : _t_3_io_f3_resp_2_valid ? _GEN_25 : _t_2_io_f3_resp_2_valid ? _GEN_24 : _t_1_io_f3_resp_2_valid & _t_io_f3_resp_2_valid ? _t_io_f3_resp_2_bits_ctr[2] : io_resp_in_0_f3_2_taken) != _io_resp_f3_2_taken_output,
     (_t_5_io_f3_resp_1_valid ? _GEN_15 : _t_4_io_f3_resp_1_valid ? _GEN_14 : _t_3_io_f3_resp_1_valid ? _GEN_13 : _t_2_io_f3_resp_1_valid ? _GEN_12 : _t_1_io_f3_resp_1_valid & _t_io_f3_resp_1_valid ? _t_io_f3_resp_1_bits_ctr[2] : io_resp_in_0_f3_1_taken) != _io_resp_f3_1_taken_output,
     (_t_5_io_f3_resp_0_valid ? _GEN_3 : _t_4_io_f3_resp_0_valid ? _GEN_2 : _t_3_io_f3_resp_0_valid ? _GEN_1 : _t_2_io_f3_resp_0_valid ? _GEN_0 : _t_1_io_f3_resp_0_valid & _t_io_f3_resp_0_valid ? _t_io_f3_resp_0_bits_ctr[2] : io_resp_in_0_f3_0_taken) != _io_resp_f3_0_taken_output,
     casez_tmp_6,
     casez_tmp_4,
     casez_tmp_2,
     casez_tmp_0,
     casez_tmp_5,
     casez_tmp_3,
     casez_tmp_1,
     casez_tmp,
     |_GEN_45,
     _alloc_entry_T_6[0] ? masked_entry_3 : _GEN_45[0] ? 3'h0 : _GEN_45[1] ? 3'h1 : _GEN_45[2] ? 3'h2 : _GEN_45[3] ? 3'h3 : _GEN_45[4] ? 3'h4 : {1'h1, ~(_GEN_45[5]), 1'h1},
     |_GEN_33,
     _alloc_entry_T_4[0] ? masked_entry_2 : _GEN_33[0] ? 3'h0 : _GEN_33[1] ? 3'h1 : _GEN_33[2] ? 3'h2 : _GEN_33[3] ? 3'h3 : _GEN_33[4] ? 3'h4 : {1'h1, ~(_GEN_33[5]), 1'h1},
     |_GEN_21,
     _alloc_entry_T_2[0] ? masked_entry_1 : _GEN_21[0] ? 3'h0 : _GEN_21[1] ? 3'h1 : _GEN_21[2] ? 3'h2 : _GEN_21[3] ? 3'h3 : _GEN_21[4] ? 3'h4 : {1'h1, ~(_GEN_21[5]), 1'h1},
     |_GEN_9,
     _alloc_entry_T[0] ? masked_entry : _GEN_9[0] ? 3'h0 : _GEN_9[1] ? 3'h1 : _GEN_9[2] ? 3'h2 : _GEN_9[3] ? 3'h3 : _GEN_9[4] ? 3'h4 : {1'h1, ~(_GEN_9[5]), 1'h1}};
endmodule

