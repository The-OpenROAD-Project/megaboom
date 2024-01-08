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

module FetchBuffer(
  input         clock,
                reset,
  output        io_enq_ready,
  input         io_enq_valid,
  input  [39:0] io_enq_bits_pc,
  input         io_enq_bits_edge_inst_0,
                io_enq_bits_edge_inst_1,
  input  [31:0] io_enq_bits_insts_0,
                io_enq_bits_insts_1,
                io_enq_bits_insts_2,
                io_enq_bits_insts_3,
                io_enq_bits_insts_4,
                io_enq_bits_insts_5,
                io_enq_bits_insts_6,
                io_enq_bits_insts_7,
                io_enq_bits_exp_insts_0,
                io_enq_bits_exp_insts_1,
                io_enq_bits_exp_insts_2,
                io_enq_bits_exp_insts_3,
                io_enq_bits_exp_insts_4,
                io_enq_bits_exp_insts_5,
                io_enq_bits_exp_insts_6,
                io_enq_bits_exp_insts_7,
  input         io_enq_bits_shadowed_mask_0,
                io_enq_bits_shadowed_mask_1,
                io_enq_bits_shadowed_mask_2,
                io_enq_bits_shadowed_mask_3,
                io_enq_bits_shadowed_mask_4,
                io_enq_bits_shadowed_mask_5,
                io_enq_bits_shadowed_mask_6,
                io_enq_bits_shadowed_mask_7,
                io_enq_bits_cfi_idx_valid,
  input  [2:0]  io_enq_bits_cfi_idx_bits,
  input  [5:0]  io_enq_bits_ftq_idx,
  input  [7:0]  io_enq_bits_mask,
  input         io_enq_bits_xcpt_pf_if,
                io_enq_bits_xcpt_ae_if,
                io_enq_bits_bp_debug_if_oh_0,
                io_enq_bits_bp_debug_if_oh_1,
                io_enq_bits_bp_debug_if_oh_2,
                io_enq_bits_bp_debug_if_oh_3,
                io_enq_bits_bp_debug_if_oh_4,
                io_enq_bits_bp_debug_if_oh_5,
                io_enq_bits_bp_debug_if_oh_6,
                io_enq_bits_bp_debug_if_oh_7,
                io_enq_bits_bp_xcpt_if_oh_0,
                io_enq_bits_bp_xcpt_if_oh_1,
                io_enq_bits_bp_xcpt_if_oh_2,
                io_enq_bits_bp_xcpt_if_oh_3,
                io_enq_bits_bp_xcpt_if_oh_4,
                io_enq_bits_bp_xcpt_if_oh_5,
                io_enq_bits_bp_xcpt_if_oh_6,
                io_enq_bits_bp_xcpt_if_oh_7,
  input  [1:0]  io_enq_bits_fsrc,
  input         io_deq_ready,
  output        io_deq_valid,
                io_deq_bits_uops_0_valid,
  output [31:0] io_deq_bits_uops_0_bits_inst,
                io_deq_bits_uops_0_bits_debug_inst,
  output        io_deq_bits_uops_0_bits_is_rvc,
  output [39:0] io_deq_bits_uops_0_bits_debug_pc,
  output        io_deq_bits_uops_0_bits_is_sfb,
  output [5:0]  io_deq_bits_uops_0_bits_ftq_idx,
  output        io_deq_bits_uops_0_bits_edge_inst,
  output [5:0]  io_deq_bits_uops_0_bits_pc_lob,
  output        io_deq_bits_uops_0_bits_taken,
                io_deq_bits_uops_0_bits_xcpt_pf_if,
                io_deq_bits_uops_0_bits_xcpt_ae_if,
                io_deq_bits_uops_0_bits_bp_debug_if,
                io_deq_bits_uops_0_bits_bp_xcpt_if,
  output [1:0]  io_deq_bits_uops_0_bits_debug_fsrc,
  output        io_deq_bits_uops_1_valid,
  output [31:0] io_deq_bits_uops_1_bits_inst,
                io_deq_bits_uops_1_bits_debug_inst,
  output        io_deq_bits_uops_1_bits_is_rvc,
  output [39:0] io_deq_bits_uops_1_bits_debug_pc,
  output        io_deq_bits_uops_1_bits_is_sfb,
  output [5:0]  io_deq_bits_uops_1_bits_ftq_idx,
  output        io_deq_bits_uops_1_bits_edge_inst,
  output [5:0]  io_deq_bits_uops_1_bits_pc_lob,
  output        io_deq_bits_uops_1_bits_taken,
                io_deq_bits_uops_1_bits_xcpt_pf_if,
                io_deq_bits_uops_1_bits_xcpt_ae_if,
                io_deq_bits_uops_1_bits_bp_debug_if,
                io_deq_bits_uops_1_bits_bp_xcpt_if,
  output [1:0]  io_deq_bits_uops_1_bits_debug_fsrc,
  output        io_deq_bits_uops_2_valid,
  output [31:0] io_deq_bits_uops_2_bits_inst,
                io_deq_bits_uops_2_bits_debug_inst,
  output        io_deq_bits_uops_2_bits_is_rvc,
  output [39:0] io_deq_bits_uops_2_bits_debug_pc,
  output        io_deq_bits_uops_2_bits_is_sfb,
  output [5:0]  io_deq_bits_uops_2_bits_ftq_idx,
  output        io_deq_bits_uops_2_bits_edge_inst,
  output [5:0]  io_deq_bits_uops_2_bits_pc_lob,
  output        io_deq_bits_uops_2_bits_taken,
                io_deq_bits_uops_2_bits_xcpt_pf_if,
                io_deq_bits_uops_2_bits_xcpt_ae_if,
                io_deq_bits_uops_2_bits_bp_debug_if,
                io_deq_bits_uops_2_bits_bp_xcpt_if,
  output [1:0]  io_deq_bits_uops_2_bits_debug_fsrc,
  output        io_deq_bits_uops_3_valid,
  output [31:0] io_deq_bits_uops_3_bits_inst,
                io_deq_bits_uops_3_bits_debug_inst,
  output        io_deq_bits_uops_3_bits_is_rvc,
  output [39:0] io_deq_bits_uops_3_bits_debug_pc,
  output        io_deq_bits_uops_3_bits_is_sfb,
  output [5:0]  io_deq_bits_uops_3_bits_ftq_idx,
  output        io_deq_bits_uops_3_bits_edge_inst,
  output [5:0]  io_deq_bits_uops_3_bits_pc_lob,
  output        io_deq_bits_uops_3_bits_taken,
                io_deq_bits_uops_3_bits_xcpt_pf_if,
                io_deq_bits_uops_3_bits_xcpt_ae_if,
                io_deq_bits_uops_3_bits_bp_debug_if,
                io_deq_bits_uops_3_bits_bp_xcpt_if,
  output [1:0]  io_deq_bits_uops_3_bits_debug_fsrc,
  input         io_clear
);

  reg  [31:0] fb_uop_ram_0_inst;
  reg  [31:0] fb_uop_ram_0_debug_inst;
  reg         fb_uop_ram_0_is_rvc;
  reg  [39:0] fb_uop_ram_0_debug_pc;
  reg         fb_uop_ram_0_is_sfb;
  reg  [5:0]  fb_uop_ram_0_ftq_idx;
  reg         fb_uop_ram_0_edge_inst;
  reg  [5:0]  fb_uop_ram_0_pc_lob;
  reg         fb_uop_ram_0_taken;
  reg         fb_uop_ram_0_xcpt_pf_if;
  reg         fb_uop_ram_0_xcpt_ae_if;
  reg         fb_uop_ram_0_bp_debug_if;
  reg         fb_uop_ram_0_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_0_debug_fsrc;
  reg  [31:0] fb_uop_ram_1_inst;
  reg  [31:0] fb_uop_ram_1_debug_inst;
  reg         fb_uop_ram_1_is_rvc;
  reg  [39:0] fb_uop_ram_1_debug_pc;
  reg         fb_uop_ram_1_is_sfb;
  reg  [5:0]  fb_uop_ram_1_ftq_idx;
  reg         fb_uop_ram_1_edge_inst;
  reg  [5:0]  fb_uop_ram_1_pc_lob;
  reg         fb_uop_ram_1_taken;
  reg         fb_uop_ram_1_xcpt_pf_if;
  reg         fb_uop_ram_1_xcpt_ae_if;
  reg         fb_uop_ram_1_bp_debug_if;
  reg         fb_uop_ram_1_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_1_debug_fsrc;
  reg  [31:0] fb_uop_ram_2_inst;
  reg  [31:0] fb_uop_ram_2_debug_inst;
  reg         fb_uop_ram_2_is_rvc;
  reg  [39:0] fb_uop_ram_2_debug_pc;
  reg         fb_uop_ram_2_is_sfb;
  reg  [5:0]  fb_uop_ram_2_ftq_idx;
  reg         fb_uop_ram_2_edge_inst;
  reg  [5:0]  fb_uop_ram_2_pc_lob;
  reg         fb_uop_ram_2_taken;
  reg         fb_uop_ram_2_xcpt_pf_if;
  reg         fb_uop_ram_2_xcpt_ae_if;
  reg         fb_uop_ram_2_bp_debug_if;
  reg         fb_uop_ram_2_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_2_debug_fsrc;
  reg  [31:0] fb_uop_ram_3_inst;
  reg  [31:0] fb_uop_ram_3_debug_inst;
  reg         fb_uop_ram_3_is_rvc;
  reg  [39:0] fb_uop_ram_3_debug_pc;
  reg         fb_uop_ram_3_is_sfb;
  reg  [5:0]  fb_uop_ram_3_ftq_idx;
  reg         fb_uop_ram_3_edge_inst;
  reg  [5:0]  fb_uop_ram_3_pc_lob;
  reg         fb_uop_ram_3_taken;
  reg         fb_uop_ram_3_xcpt_pf_if;
  reg         fb_uop_ram_3_xcpt_ae_if;
  reg         fb_uop_ram_3_bp_debug_if;
  reg         fb_uop_ram_3_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_3_debug_fsrc;
  reg  [31:0] fb_uop_ram_4_inst;
  reg  [31:0] fb_uop_ram_4_debug_inst;
  reg         fb_uop_ram_4_is_rvc;
  reg  [39:0] fb_uop_ram_4_debug_pc;
  reg         fb_uop_ram_4_is_sfb;
  reg  [5:0]  fb_uop_ram_4_ftq_idx;
  reg         fb_uop_ram_4_edge_inst;
  reg  [5:0]  fb_uop_ram_4_pc_lob;
  reg         fb_uop_ram_4_taken;
  reg         fb_uop_ram_4_xcpt_pf_if;
  reg         fb_uop_ram_4_xcpt_ae_if;
  reg         fb_uop_ram_4_bp_debug_if;
  reg         fb_uop_ram_4_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_4_debug_fsrc;
  reg  [31:0] fb_uop_ram_5_inst;
  reg  [31:0] fb_uop_ram_5_debug_inst;
  reg         fb_uop_ram_5_is_rvc;
  reg  [39:0] fb_uop_ram_5_debug_pc;
  reg         fb_uop_ram_5_is_sfb;
  reg  [5:0]  fb_uop_ram_5_ftq_idx;
  reg         fb_uop_ram_5_edge_inst;
  reg  [5:0]  fb_uop_ram_5_pc_lob;
  reg         fb_uop_ram_5_taken;
  reg         fb_uop_ram_5_xcpt_pf_if;
  reg         fb_uop_ram_5_xcpt_ae_if;
  reg         fb_uop_ram_5_bp_debug_if;
  reg         fb_uop_ram_5_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_5_debug_fsrc;
  reg  [31:0] fb_uop_ram_6_inst;
  reg  [31:0] fb_uop_ram_6_debug_inst;
  reg         fb_uop_ram_6_is_rvc;
  reg  [39:0] fb_uop_ram_6_debug_pc;
  reg         fb_uop_ram_6_is_sfb;
  reg  [5:0]  fb_uop_ram_6_ftq_idx;
  reg         fb_uop_ram_6_edge_inst;
  reg  [5:0]  fb_uop_ram_6_pc_lob;
  reg         fb_uop_ram_6_taken;
  reg         fb_uop_ram_6_xcpt_pf_if;
  reg         fb_uop_ram_6_xcpt_ae_if;
  reg         fb_uop_ram_6_bp_debug_if;
  reg         fb_uop_ram_6_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_6_debug_fsrc;
  reg  [31:0] fb_uop_ram_7_inst;
  reg  [31:0] fb_uop_ram_7_debug_inst;
  reg         fb_uop_ram_7_is_rvc;
  reg  [39:0] fb_uop_ram_7_debug_pc;
  reg         fb_uop_ram_7_is_sfb;
  reg  [5:0]  fb_uop_ram_7_ftq_idx;
  reg         fb_uop_ram_7_edge_inst;
  reg  [5:0]  fb_uop_ram_7_pc_lob;
  reg         fb_uop_ram_7_taken;
  reg         fb_uop_ram_7_xcpt_pf_if;
  reg         fb_uop_ram_7_xcpt_ae_if;
  reg         fb_uop_ram_7_bp_debug_if;
  reg         fb_uop_ram_7_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_7_debug_fsrc;
  reg  [31:0] fb_uop_ram_8_inst;
  reg  [31:0] fb_uop_ram_8_debug_inst;
  reg         fb_uop_ram_8_is_rvc;
  reg  [39:0] fb_uop_ram_8_debug_pc;
  reg         fb_uop_ram_8_is_sfb;
  reg  [5:0]  fb_uop_ram_8_ftq_idx;
  reg         fb_uop_ram_8_edge_inst;
  reg  [5:0]  fb_uop_ram_8_pc_lob;
  reg         fb_uop_ram_8_taken;
  reg         fb_uop_ram_8_xcpt_pf_if;
  reg         fb_uop_ram_8_xcpt_ae_if;
  reg         fb_uop_ram_8_bp_debug_if;
  reg         fb_uop_ram_8_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_8_debug_fsrc;
  reg  [31:0] fb_uop_ram_9_inst;
  reg  [31:0] fb_uop_ram_9_debug_inst;
  reg         fb_uop_ram_9_is_rvc;
  reg  [39:0] fb_uop_ram_9_debug_pc;
  reg         fb_uop_ram_9_is_sfb;
  reg  [5:0]  fb_uop_ram_9_ftq_idx;
  reg         fb_uop_ram_9_edge_inst;
  reg  [5:0]  fb_uop_ram_9_pc_lob;
  reg         fb_uop_ram_9_taken;
  reg         fb_uop_ram_9_xcpt_pf_if;
  reg         fb_uop_ram_9_xcpt_ae_if;
  reg         fb_uop_ram_9_bp_debug_if;
  reg         fb_uop_ram_9_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_9_debug_fsrc;
  reg  [31:0] fb_uop_ram_10_inst;
  reg  [31:0] fb_uop_ram_10_debug_inst;
  reg         fb_uop_ram_10_is_rvc;
  reg  [39:0] fb_uop_ram_10_debug_pc;
  reg         fb_uop_ram_10_is_sfb;
  reg  [5:0]  fb_uop_ram_10_ftq_idx;
  reg         fb_uop_ram_10_edge_inst;
  reg  [5:0]  fb_uop_ram_10_pc_lob;
  reg         fb_uop_ram_10_taken;
  reg         fb_uop_ram_10_xcpt_pf_if;
  reg         fb_uop_ram_10_xcpt_ae_if;
  reg         fb_uop_ram_10_bp_debug_if;
  reg         fb_uop_ram_10_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_10_debug_fsrc;
  reg  [31:0] fb_uop_ram_11_inst;
  reg  [31:0] fb_uop_ram_11_debug_inst;
  reg         fb_uop_ram_11_is_rvc;
  reg  [39:0] fb_uop_ram_11_debug_pc;
  reg         fb_uop_ram_11_is_sfb;
  reg  [5:0]  fb_uop_ram_11_ftq_idx;
  reg         fb_uop_ram_11_edge_inst;
  reg  [5:0]  fb_uop_ram_11_pc_lob;
  reg         fb_uop_ram_11_taken;
  reg         fb_uop_ram_11_xcpt_pf_if;
  reg         fb_uop_ram_11_xcpt_ae_if;
  reg         fb_uop_ram_11_bp_debug_if;
  reg         fb_uop_ram_11_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_11_debug_fsrc;
  reg  [31:0] fb_uop_ram_12_inst;
  reg  [31:0] fb_uop_ram_12_debug_inst;
  reg         fb_uop_ram_12_is_rvc;
  reg  [39:0] fb_uop_ram_12_debug_pc;
  reg         fb_uop_ram_12_is_sfb;
  reg  [5:0]  fb_uop_ram_12_ftq_idx;
  reg         fb_uop_ram_12_edge_inst;
  reg  [5:0]  fb_uop_ram_12_pc_lob;
  reg         fb_uop_ram_12_taken;
  reg         fb_uop_ram_12_xcpt_pf_if;
  reg         fb_uop_ram_12_xcpt_ae_if;
  reg         fb_uop_ram_12_bp_debug_if;
  reg         fb_uop_ram_12_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_12_debug_fsrc;
  reg  [31:0] fb_uop_ram_13_inst;
  reg  [31:0] fb_uop_ram_13_debug_inst;
  reg         fb_uop_ram_13_is_rvc;
  reg  [39:0] fb_uop_ram_13_debug_pc;
  reg         fb_uop_ram_13_is_sfb;
  reg  [5:0]  fb_uop_ram_13_ftq_idx;
  reg         fb_uop_ram_13_edge_inst;
  reg  [5:0]  fb_uop_ram_13_pc_lob;
  reg         fb_uop_ram_13_taken;
  reg         fb_uop_ram_13_xcpt_pf_if;
  reg         fb_uop_ram_13_xcpt_ae_if;
  reg         fb_uop_ram_13_bp_debug_if;
  reg         fb_uop_ram_13_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_13_debug_fsrc;
  reg  [31:0] fb_uop_ram_14_inst;
  reg  [31:0] fb_uop_ram_14_debug_inst;
  reg         fb_uop_ram_14_is_rvc;
  reg  [39:0] fb_uop_ram_14_debug_pc;
  reg         fb_uop_ram_14_is_sfb;
  reg  [5:0]  fb_uop_ram_14_ftq_idx;
  reg         fb_uop_ram_14_edge_inst;
  reg  [5:0]  fb_uop_ram_14_pc_lob;
  reg         fb_uop_ram_14_taken;
  reg         fb_uop_ram_14_xcpt_pf_if;
  reg         fb_uop_ram_14_xcpt_ae_if;
  reg         fb_uop_ram_14_bp_debug_if;
  reg         fb_uop_ram_14_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_14_debug_fsrc;
  reg  [31:0] fb_uop_ram_15_inst;
  reg  [31:0] fb_uop_ram_15_debug_inst;
  reg         fb_uop_ram_15_is_rvc;
  reg  [39:0] fb_uop_ram_15_debug_pc;
  reg         fb_uop_ram_15_is_sfb;
  reg  [5:0]  fb_uop_ram_15_ftq_idx;
  reg         fb_uop_ram_15_edge_inst;
  reg  [5:0]  fb_uop_ram_15_pc_lob;
  reg         fb_uop_ram_15_taken;
  reg         fb_uop_ram_15_xcpt_pf_if;
  reg         fb_uop_ram_15_xcpt_ae_if;
  reg         fb_uop_ram_15_bp_debug_if;
  reg         fb_uop_ram_15_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_15_debug_fsrc;
  reg  [31:0] fb_uop_ram_16_inst;
  reg  [31:0] fb_uop_ram_16_debug_inst;
  reg         fb_uop_ram_16_is_rvc;
  reg  [39:0] fb_uop_ram_16_debug_pc;
  reg         fb_uop_ram_16_is_sfb;
  reg  [5:0]  fb_uop_ram_16_ftq_idx;
  reg         fb_uop_ram_16_edge_inst;
  reg  [5:0]  fb_uop_ram_16_pc_lob;
  reg         fb_uop_ram_16_taken;
  reg         fb_uop_ram_16_xcpt_pf_if;
  reg         fb_uop_ram_16_xcpt_ae_if;
  reg         fb_uop_ram_16_bp_debug_if;
  reg         fb_uop_ram_16_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_16_debug_fsrc;
  reg  [31:0] fb_uop_ram_17_inst;
  reg  [31:0] fb_uop_ram_17_debug_inst;
  reg         fb_uop_ram_17_is_rvc;
  reg  [39:0] fb_uop_ram_17_debug_pc;
  reg         fb_uop_ram_17_is_sfb;
  reg  [5:0]  fb_uop_ram_17_ftq_idx;
  reg         fb_uop_ram_17_edge_inst;
  reg  [5:0]  fb_uop_ram_17_pc_lob;
  reg         fb_uop_ram_17_taken;
  reg         fb_uop_ram_17_xcpt_pf_if;
  reg         fb_uop_ram_17_xcpt_ae_if;
  reg         fb_uop_ram_17_bp_debug_if;
  reg         fb_uop_ram_17_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_17_debug_fsrc;
  reg  [31:0] fb_uop_ram_18_inst;
  reg  [31:0] fb_uop_ram_18_debug_inst;
  reg         fb_uop_ram_18_is_rvc;
  reg  [39:0] fb_uop_ram_18_debug_pc;
  reg         fb_uop_ram_18_is_sfb;
  reg  [5:0]  fb_uop_ram_18_ftq_idx;
  reg         fb_uop_ram_18_edge_inst;
  reg  [5:0]  fb_uop_ram_18_pc_lob;
  reg         fb_uop_ram_18_taken;
  reg         fb_uop_ram_18_xcpt_pf_if;
  reg         fb_uop_ram_18_xcpt_ae_if;
  reg         fb_uop_ram_18_bp_debug_if;
  reg         fb_uop_ram_18_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_18_debug_fsrc;
  reg  [31:0] fb_uop_ram_19_inst;
  reg  [31:0] fb_uop_ram_19_debug_inst;
  reg         fb_uop_ram_19_is_rvc;
  reg  [39:0] fb_uop_ram_19_debug_pc;
  reg         fb_uop_ram_19_is_sfb;
  reg  [5:0]  fb_uop_ram_19_ftq_idx;
  reg         fb_uop_ram_19_edge_inst;
  reg  [5:0]  fb_uop_ram_19_pc_lob;
  reg         fb_uop_ram_19_taken;
  reg         fb_uop_ram_19_xcpt_pf_if;
  reg         fb_uop_ram_19_xcpt_ae_if;
  reg         fb_uop_ram_19_bp_debug_if;
  reg         fb_uop_ram_19_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_19_debug_fsrc;
  reg  [31:0] fb_uop_ram_20_inst;
  reg  [31:0] fb_uop_ram_20_debug_inst;
  reg         fb_uop_ram_20_is_rvc;
  reg  [39:0] fb_uop_ram_20_debug_pc;
  reg         fb_uop_ram_20_is_sfb;
  reg  [5:0]  fb_uop_ram_20_ftq_idx;
  reg         fb_uop_ram_20_edge_inst;
  reg  [5:0]  fb_uop_ram_20_pc_lob;
  reg         fb_uop_ram_20_taken;
  reg         fb_uop_ram_20_xcpt_pf_if;
  reg         fb_uop_ram_20_xcpt_ae_if;
  reg         fb_uop_ram_20_bp_debug_if;
  reg         fb_uop_ram_20_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_20_debug_fsrc;
  reg  [31:0] fb_uop_ram_21_inst;
  reg  [31:0] fb_uop_ram_21_debug_inst;
  reg         fb_uop_ram_21_is_rvc;
  reg  [39:0] fb_uop_ram_21_debug_pc;
  reg         fb_uop_ram_21_is_sfb;
  reg  [5:0]  fb_uop_ram_21_ftq_idx;
  reg         fb_uop_ram_21_edge_inst;
  reg  [5:0]  fb_uop_ram_21_pc_lob;
  reg         fb_uop_ram_21_taken;
  reg         fb_uop_ram_21_xcpt_pf_if;
  reg         fb_uop_ram_21_xcpt_ae_if;
  reg         fb_uop_ram_21_bp_debug_if;
  reg         fb_uop_ram_21_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_21_debug_fsrc;
  reg  [31:0] fb_uop_ram_22_inst;
  reg  [31:0] fb_uop_ram_22_debug_inst;
  reg         fb_uop_ram_22_is_rvc;
  reg  [39:0] fb_uop_ram_22_debug_pc;
  reg         fb_uop_ram_22_is_sfb;
  reg  [5:0]  fb_uop_ram_22_ftq_idx;
  reg         fb_uop_ram_22_edge_inst;
  reg  [5:0]  fb_uop_ram_22_pc_lob;
  reg         fb_uop_ram_22_taken;
  reg         fb_uop_ram_22_xcpt_pf_if;
  reg         fb_uop_ram_22_xcpt_ae_if;
  reg         fb_uop_ram_22_bp_debug_if;
  reg         fb_uop_ram_22_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_22_debug_fsrc;
  reg  [31:0] fb_uop_ram_23_inst;
  reg  [31:0] fb_uop_ram_23_debug_inst;
  reg         fb_uop_ram_23_is_rvc;
  reg  [39:0] fb_uop_ram_23_debug_pc;
  reg         fb_uop_ram_23_is_sfb;
  reg  [5:0]  fb_uop_ram_23_ftq_idx;
  reg         fb_uop_ram_23_edge_inst;
  reg  [5:0]  fb_uop_ram_23_pc_lob;
  reg         fb_uop_ram_23_taken;
  reg         fb_uop_ram_23_xcpt_pf_if;
  reg         fb_uop_ram_23_xcpt_ae_if;
  reg         fb_uop_ram_23_bp_debug_if;
  reg         fb_uop_ram_23_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_23_debug_fsrc;
  reg  [31:0] fb_uop_ram_24_inst;
  reg  [31:0] fb_uop_ram_24_debug_inst;
  reg         fb_uop_ram_24_is_rvc;
  reg  [39:0] fb_uop_ram_24_debug_pc;
  reg         fb_uop_ram_24_is_sfb;
  reg  [5:0]  fb_uop_ram_24_ftq_idx;
  reg         fb_uop_ram_24_edge_inst;
  reg  [5:0]  fb_uop_ram_24_pc_lob;
  reg         fb_uop_ram_24_taken;
  reg         fb_uop_ram_24_xcpt_pf_if;
  reg         fb_uop_ram_24_xcpt_ae_if;
  reg         fb_uop_ram_24_bp_debug_if;
  reg         fb_uop_ram_24_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_24_debug_fsrc;
  reg  [31:0] fb_uop_ram_25_inst;
  reg  [31:0] fb_uop_ram_25_debug_inst;
  reg         fb_uop_ram_25_is_rvc;
  reg  [39:0] fb_uop_ram_25_debug_pc;
  reg         fb_uop_ram_25_is_sfb;
  reg  [5:0]  fb_uop_ram_25_ftq_idx;
  reg         fb_uop_ram_25_edge_inst;
  reg  [5:0]  fb_uop_ram_25_pc_lob;
  reg         fb_uop_ram_25_taken;
  reg         fb_uop_ram_25_xcpt_pf_if;
  reg         fb_uop_ram_25_xcpt_ae_if;
  reg         fb_uop_ram_25_bp_debug_if;
  reg         fb_uop_ram_25_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_25_debug_fsrc;
  reg  [31:0] fb_uop_ram_26_inst;
  reg  [31:0] fb_uop_ram_26_debug_inst;
  reg         fb_uop_ram_26_is_rvc;
  reg  [39:0] fb_uop_ram_26_debug_pc;
  reg         fb_uop_ram_26_is_sfb;
  reg  [5:0]  fb_uop_ram_26_ftq_idx;
  reg         fb_uop_ram_26_edge_inst;
  reg  [5:0]  fb_uop_ram_26_pc_lob;
  reg         fb_uop_ram_26_taken;
  reg         fb_uop_ram_26_xcpt_pf_if;
  reg         fb_uop_ram_26_xcpt_ae_if;
  reg         fb_uop_ram_26_bp_debug_if;
  reg         fb_uop_ram_26_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_26_debug_fsrc;
  reg  [31:0] fb_uop_ram_27_inst;
  reg  [31:0] fb_uop_ram_27_debug_inst;
  reg         fb_uop_ram_27_is_rvc;
  reg  [39:0] fb_uop_ram_27_debug_pc;
  reg         fb_uop_ram_27_is_sfb;
  reg  [5:0]  fb_uop_ram_27_ftq_idx;
  reg         fb_uop_ram_27_edge_inst;
  reg  [5:0]  fb_uop_ram_27_pc_lob;
  reg         fb_uop_ram_27_taken;
  reg         fb_uop_ram_27_xcpt_pf_if;
  reg         fb_uop_ram_27_xcpt_ae_if;
  reg         fb_uop_ram_27_bp_debug_if;
  reg         fb_uop_ram_27_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_27_debug_fsrc;
  reg  [31:0] fb_uop_ram_28_inst;
  reg  [31:0] fb_uop_ram_28_debug_inst;
  reg         fb_uop_ram_28_is_rvc;
  reg  [39:0] fb_uop_ram_28_debug_pc;
  reg         fb_uop_ram_28_is_sfb;
  reg  [5:0]  fb_uop_ram_28_ftq_idx;
  reg         fb_uop_ram_28_edge_inst;
  reg  [5:0]  fb_uop_ram_28_pc_lob;
  reg         fb_uop_ram_28_taken;
  reg         fb_uop_ram_28_xcpt_pf_if;
  reg         fb_uop_ram_28_xcpt_ae_if;
  reg         fb_uop_ram_28_bp_debug_if;
  reg         fb_uop_ram_28_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_28_debug_fsrc;
  reg  [31:0] fb_uop_ram_29_inst;
  reg  [31:0] fb_uop_ram_29_debug_inst;
  reg         fb_uop_ram_29_is_rvc;
  reg  [39:0] fb_uop_ram_29_debug_pc;
  reg         fb_uop_ram_29_is_sfb;
  reg  [5:0]  fb_uop_ram_29_ftq_idx;
  reg         fb_uop_ram_29_edge_inst;
  reg  [5:0]  fb_uop_ram_29_pc_lob;
  reg         fb_uop_ram_29_taken;
  reg         fb_uop_ram_29_xcpt_pf_if;
  reg         fb_uop_ram_29_xcpt_ae_if;
  reg         fb_uop_ram_29_bp_debug_if;
  reg         fb_uop_ram_29_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_29_debug_fsrc;
  reg  [31:0] fb_uop_ram_30_inst;
  reg  [31:0] fb_uop_ram_30_debug_inst;
  reg         fb_uop_ram_30_is_rvc;
  reg  [39:0] fb_uop_ram_30_debug_pc;
  reg         fb_uop_ram_30_is_sfb;
  reg  [5:0]  fb_uop_ram_30_ftq_idx;
  reg         fb_uop_ram_30_edge_inst;
  reg  [5:0]  fb_uop_ram_30_pc_lob;
  reg         fb_uop_ram_30_taken;
  reg         fb_uop_ram_30_xcpt_pf_if;
  reg         fb_uop_ram_30_xcpt_ae_if;
  reg         fb_uop_ram_30_bp_debug_if;
  reg         fb_uop_ram_30_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_30_debug_fsrc;
  reg  [31:0] fb_uop_ram_31_inst;
  reg  [31:0] fb_uop_ram_31_debug_inst;
  reg         fb_uop_ram_31_is_rvc;
  reg  [39:0] fb_uop_ram_31_debug_pc;
  reg         fb_uop_ram_31_is_sfb;
  reg  [5:0]  fb_uop_ram_31_ftq_idx;
  reg         fb_uop_ram_31_edge_inst;
  reg  [5:0]  fb_uop_ram_31_pc_lob;
  reg         fb_uop_ram_31_taken;
  reg         fb_uop_ram_31_xcpt_pf_if;
  reg         fb_uop_ram_31_xcpt_ae_if;
  reg         fb_uop_ram_31_bp_debug_if;
  reg         fb_uop_ram_31_bp_xcpt_if;
  reg  [1:0]  fb_uop_ram_31_debug_fsrc;
  reg  [7:0]  head;
  reg  [31:0] tail;
  reg         maybe_full;
  wire        _do_enq_T_1 = (|({tail[28], tail[24], tail[20], tail[16], tail[12], tail[8], tail[4], tail[0]} & head)) & maybe_full | (|(head & {tail[27], tail[23], tail[19], tail[15], tail[11], tail[7], tail[3], tail[31]} | head & {tail[26], tail[22], tail[18], tail[14], tail[10], tail[6], tail[2], tail[30]} | head & {tail[25], tail[21], tail[17], tail[13], tail[9], tail[5], tail[1], tail[29]} | head & {tail[24], tail[20], tail[16], tail[12], tail[8], tail[4], tail[0], tail[28]} | head & {tail[23], tail[19], tail[15], tail[11], tail[7], tail[3], tail[31], tail[27]} | head & {tail[22], tail[18], tail[14], tail[10], tail[6], tail[2], tail[30], tail[26]} | head & {tail[21], tail[17], tail[13], tail[9], tail[5], tail[1], tail[29], tail[25]}));
  wire [3:0]  slot_will_hit_tail = {{3{head[0]}}, head[0] & ~maybe_full} & tail[3:0] | {{3{head[1]}}, head[1] & ~maybe_full} & tail[7:4] | {{3{head[2]}}, head[2] & ~maybe_full} & tail[11:8] | {{3{head[3]}}, head[3] & ~maybe_full} & tail[15:12] | {{3{head[4]}}, head[4] & ~maybe_full} & tail[19:16] | {{3{head[5]}}, head[5] & ~maybe_full} & tail[23:20] | {{3{head[6]}}, head[6] & ~maybe_full} & tail[27:24] | {{3{head[7]}}, head[7] & ~maybe_full} & tail[31:28];
  wire [1:0]  _GEN = slot_will_hit_tail[2:1] | slot_will_hit_tail[1:0];
  wire [3:0]  _deq_valids_T_10 = slot_will_hit_tail | {_GEN[1] | slot_will_hit_tail[0], _GEN[0], slot_will_hit_tail[0], 1'h0};
  wire [3:0]  _deq_valids_T_11 = ~_deq_valids_T_10;
  wire        do_deq = io_deq_ready & slot_will_hit_tail == 4'h0;
  wire        in_mask_0 = io_enq_valid & io_enq_bits_mask[0];
  wire [39:0] _GEN_0 = {io_enq_bits_pc[39:3], 3'h0};
  wire [39:0] in_uops_0_debug_pc = io_enq_bits_edge_inst_0 ? _GEN_0 - 40'h2 : {io_enq_bits_pc[39:3], 3'h0};
  wire [5:0]  in_uops_0_pc_lob = {io_enq_bits_pc[5:3], 3'h0};
  wire        in_uops_0_is_rvc = io_enq_bits_insts_0[1:0] != 2'h3;
  wire        in_uops_0_taken = io_enq_bits_cfi_idx_bits == 3'h0 & io_enq_bits_cfi_idx_valid;
  wire [39:0] _pc_T_7 = _GEN_0 + 40'h2;
  wire        in_mask_1 = io_enq_valid & io_enq_bits_mask[1];
  wire        in_uops_1_is_rvc = io_enq_bits_insts_1[1:0] != 2'h3;
  wire        in_uops_1_taken = io_enq_bits_cfi_idx_bits == 3'h1 & io_enq_bits_cfi_idx_valid;
  wire [39:0] _pc_T_11 = _GEN_0 + 40'h4;
  wire        in_mask_2 = io_enq_valid & io_enq_bits_mask[2];
  wire        in_uops_2_is_rvc = io_enq_bits_insts_2[1:0] != 2'h3;
  wire        in_uops_2_taken = io_enq_bits_cfi_idx_bits == 3'h2 & io_enq_bits_cfi_idx_valid;
  wire [39:0] _pc_T_15 = _GEN_0 + 40'h6;
  wire        in_mask_3 = io_enq_valid & io_enq_bits_mask[3];
  wire        in_uops_3_is_rvc = io_enq_bits_insts_3[1:0] != 2'h3;
  wire        in_uops_3_taken = io_enq_bits_cfi_idx_bits == 3'h3 & io_enq_bits_cfi_idx_valid;
  wire [39:0] _pc_T_19 = _GEN_0 + 40'h8;
  wire        in_mask_4 = io_enq_valid & io_enq_bits_mask[4];
  wire [39:0] in_uops_4_debug_pc = io_enq_bits_edge_inst_1 ? _GEN_0 + 40'h6 : _pc_T_19;
  wire [5:0]  in_uops_4_pc_lob = io_enq_bits_edge_inst_1 ? {io_enq_bits_pc[5:3], 3'h0} + 6'h8 : _pc_T_19[5:0];
  wire        in_uops_4_is_rvc = io_enq_bits_insts_4[1:0] != 2'h3;
  wire        in_uops_4_taken = io_enq_bits_cfi_idx_bits == 3'h4 & io_enq_bits_cfi_idx_valid;
  wire [39:0] _pc_T_23 = _GEN_0 + 40'hA;
  wire        in_mask_5 = io_enq_valid & io_enq_bits_mask[5];
  wire        in_uops_5_is_rvc = io_enq_bits_insts_5[1:0] != 2'h3;
  wire        in_uops_5_taken = io_enq_bits_cfi_idx_bits == 3'h5 & io_enq_bits_cfi_idx_valid;
  wire [39:0] _pc_T_27 = _GEN_0 + 40'hC;
  wire        in_mask_6 = io_enq_valid & io_enq_bits_mask[6];
  wire        in_uops_6_is_rvc = io_enq_bits_insts_6[1:0] != 2'h3;
  wire        in_uops_6_taken = io_enq_bits_cfi_idx_bits == 3'h6 & io_enq_bits_cfi_idx_valid;
  wire [39:0] _pc_T_31 = _GEN_0 + 40'hE;
  wire        in_mask_7 = io_enq_valid & io_enq_bits_mask[7];
  wire        in_uops_7_is_rvc = io_enq_bits_insts_7[1:0] != 2'h3;
  wire        in_uops_7_taken = (&io_enq_bits_cfi_idx_bits) & io_enq_bits_cfi_idx_valid;
  wire [31:0] _GEN_1 = {tail[30:0], tail[31]};
  wire [31:0] enq_idxs_1 = in_mask_0 ? _GEN_1 : tail;
  wire [31:0] _GEN_2 = {enq_idxs_1[30:0], enq_idxs_1[31]};
  wire [31:0] enq_idxs_2 = in_mask_1 ? _GEN_2 : enq_idxs_1;
  wire [31:0] _GEN_3 = {enq_idxs_2[30:0], enq_idxs_2[31]};
  wire [31:0] enq_idxs_3 = in_mask_2 ? _GEN_3 : enq_idxs_2;
  wire [31:0] _GEN_4 = {enq_idxs_3[30:0], enq_idxs_3[31]};
  wire [31:0] enq_idxs_4 = in_mask_3 ? _GEN_4 : enq_idxs_3;
  wire [31:0] _GEN_5 = {enq_idxs_4[30:0], enq_idxs_4[31]};
  wire [31:0] enq_idxs_5 = in_mask_4 ? _GEN_5 : enq_idxs_4;
  wire [31:0] _GEN_6 = {enq_idxs_5[30:0], enq_idxs_5[31]};
  wire [31:0] enq_idxs_6 = in_mask_5 ? _GEN_6 : enq_idxs_5;
  wire [31:0] _GEN_7 = {enq_idxs_6[30:0], enq_idxs_6[31]};
  wire [31:0] enq_idxs_7 = in_mask_6 ? _GEN_7 : enq_idxs_6;
  wire        _GEN_8 = ~_do_enq_T_1 & in_mask_0;
  wire        _GEN_9 = _GEN_8 & tail[0];
  wire        _GEN_10 = _GEN_8 & tail[1];
  wire        _GEN_11 = _GEN_8 & tail[2];
  wire        _GEN_12 = _GEN_8 & tail[3];
  wire        _GEN_13 = _GEN_8 & tail[4];
  wire        _GEN_14 = _GEN_8 & tail[5];
  wire        _GEN_15 = _GEN_8 & tail[6];
  wire        _GEN_16 = _GEN_8 & tail[7];
  wire        _GEN_17 = _GEN_8 & tail[8];
  wire        _GEN_18 = _GEN_8 & tail[9];
  wire        _GEN_19 = _GEN_8 & tail[10];
  wire        _GEN_20 = _GEN_8 & tail[11];
  wire        _GEN_21 = _GEN_8 & tail[12];
  wire        _GEN_22 = _GEN_8 & tail[13];
  wire        _GEN_23 = _GEN_8 & tail[14];
  wire        _GEN_24 = _GEN_8 & tail[15];
  wire        _GEN_25 = _GEN_8 & tail[16];
  wire        _GEN_26 = _GEN_8 & tail[17];
  wire        _GEN_27 = _GEN_8 & tail[18];
  wire        _GEN_28 = _GEN_8 & tail[19];
  wire        _GEN_29 = _GEN_8 & tail[20];
  wire        _GEN_30 = _GEN_8 & tail[21];
  wire        _GEN_31 = _GEN_8 & tail[22];
  wire        _GEN_32 = _GEN_8 & tail[23];
  wire        _GEN_33 = _GEN_8 & tail[24];
  wire        _GEN_34 = _GEN_8 & tail[25];
  wire        _GEN_35 = _GEN_8 & tail[26];
  wire        _GEN_36 = _GEN_8 & tail[27];
  wire        _GEN_37 = _GEN_8 & tail[28];
  wire        _GEN_38 = _GEN_8 & tail[29];
  wire        _GEN_39 = _GEN_8 & tail[30];
  wire        _GEN_40 = _GEN_8 & tail[31];
  wire        _GEN_41 = ~_do_enq_T_1 & in_mask_1;
  wire        _GEN_42 = _GEN_41 & enq_idxs_1[0];
  wire        _GEN_43 = _GEN_41 & enq_idxs_1[1];
  wire        _GEN_44 = _GEN_41 & enq_idxs_1[2];
  wire        _GEN_45 = _GEN_41 & enq_idxs_1[3];
  wire        _GEN_46 = _GEN_41 & enq_idxs_1[4];
  wire        _GEN_47 = _GEN_41 & enq_idxs_1[5];
  wire        _GEN_48 = _GEN_41 & enq_idxs_1[6];
  wire        _GEN_49 = _GEN_41 & enq_idxs_1[7];
  wire        _GEN_50 = _GEN_41 & enq_idxs_1[8];
  wire        _GEN_51 = _GEN_41 & enq_idxs_1[9];
  wire        _GEN_52 = _GEN_41 & enq_idxs_1[10];
  wire        _GEN_53 = _GEN_41 & enq_idxs_1[11];
  wire        _GEN_54 = _GEN_41 & enq_idxs_1[12];
  wire        _GEN_55 = _GEN_41 & enq_idxs_1[13];
  wire        _GEN_56 = _GEN_41 & enq_idxs_1[14];
  wire        _GEN_57 = _GEN_41 & enq_idxs_1[15];
  wire        _GEN_58 = _GEN_41 & enq_idxs_1[16];
  wire        _GEN_59 = _GEN_41 & enq_idxs_1[17];
  wire        _GEN_60 = _GEN_41 & enq_idxs_1[18];
  wire        _GEN_61 = _GEN_41 & enq_idxs_1[19];
  wire        _GEN_62 = _GEN_41 & enq_idxs_1[20];
  wire        _GEN_63 = _GEN_41 & enq_idxs_1[21];
  wire        _GEN_64 = _GEN_41 & enq_idxs_1[22];
  wire        _GEN_65 = _GEN_41 & enq_idxs_1[23];
  wire        _GEN_66 = _GEN_41 & enq_idxs_1[24];
  wire        _GEN_67 = _GEN_41 & enq_idxs_1[25];
  wire        _GEN_68 = _GEN_41 & enq_idxs_1[26];
  wire        _GEN_69 = _GEN_41 & enq_idxs_1[27];
  wire        _GEN_70 = _GEN_41 & enq_idxs_1[28];
  wire        _GEN_71 = _GEN_41 & enq_idxs_1[29];
  wire        _GEN_72 = _GEN_41 & enq_idxs_1[30];
  wire        _GEN_73 = _GEN_41 & enq_idxs_1[31];
  wire        _GEN_74 = ~_do_enq_T_1 & in_mask_2;
  wire        _GEN_75 = _GEN_74 & enq_idxs_2[0];
  wire        _GEN_76 = _GEN_74 & enq_idxs_2[1];
  wire        _GEN_77 = _GEN_74 & enq_idxs_2[2];
  wire        _GEN_78 = _GEN_74 & enq_idxs_2[3];
  wire        _GEN_79 = _GEN_74 & enq_idxs_2[4];
  wire        _GEN_80 = _GEN_74 & enq_idxs_2[5];
  wire        _GEN_81 = _GEN_74 & enq_idxs_2[6];
  wire        _GEN_82 = _GEN_74 & enq_idxs_2[7];
  wire        _GEN_83 = _GEN_74 & enq_idxs_2[8];
  wire        _GEN_84 = _GEN_74 & enq_idxs_2[9];
  wire        _GEN_85 = _GEN_74 & enq_idxs_2[10];
  wire        _GEN_86 = _GEN_74 & enq_idxs_2[11];
  wire        _GEN_87 = _GEN_74 & enq_idxs_2[12];
  wire        _GEN_88 = _GEN_74 & enq_idxs_2[13];
  wire        _GEN_89 = _GEN_74 & enq_idxs_2[14];
  wire        _GEN_90 = _GEN_74 & enq_idxs_2[15];
  wire        _GEN_91 = _GEN_74 & enq_idxs_2[16];
  wire        _GEN_92 = _GEN_74 & enq_idxs_2[17];
  wire        _GEN_93 = _GEN_74 & enq_idxs_2[18];
  wire        _GEN_94 = _GEN_74 & enq_idxs_2[19];
  wire        _GEN_95 = _GEN_74 & enq_idxs_2[20];
  wire        _GEN_96 = _GEN_74 & enq_idxs_2[21];
  wire        _GEN_97 = _GEN_74 & enq_idxs_2[22];
  wire        _GEN_98 = _GEN_74 & enq_idxs_2[23];
  wire        _GEN_99 = _GEN_74 & enq_idxs_2[24];
  wire        _GEN_100 = _GEN_74 & enq_idxs_2[25];
  wire        _GEN_101 = _GEN_74 & enq_idxs_2[26];
  wire        _GEN_102 = _GEN_74 & enq_idxs_2[27];
  wire        _GEN_103 = _GEN_74 & enq_idxs_2[28];
  wire        _GEN_104 = _GEN_74 & enq_idxs_2[29];
  wire        _GEN_105 = _GEN_74 & enq_idxs_2[30];
  wire        _GEN_106 = _GEN_74 & enq_idxs_2[31];
  wire        _GEN_107 = ~_do_enq_T_1 & in_mask_3;
  wire        _GEN_108 = _GEN_107 & enq_idxs_3[0];
  wire        _GEN_109 = _GEN_107 & enq_idxs_3[1];
  wire        _GEN_110 = _GEN_107 & enq_idxs_3[2];
  wire        _GEN_111 = _GEN_107 & enq_idxs_3[3];
  wire        _GEN_112 = _GEN_107 & enq_idxs_3[4];
  wire        _GEN_113 = _GEN_107 & enq_idxs_3[5];
  wire        _GEN_114 = _GEN_107 & enq_idxs_3[6];
  wire        _GEN_115 = _GEN_107 & enq_idxs_3[7];
  wire        _GEN_116 = _GEN_107 & enq_idxs_3[8];
  wire        _GEN_117 = _GEN_107 & enq_idxs_3[9];
  wire        _GEN_118 = _GEN_107 & enq_idxs_3[10];
  wire        _GEN_119 = _GEN_107 & enq_idxs_3[11];
  wire        _GEN_120 = _GEN_107 & enq_idxs_3[12];
  wire        _GEN_121 = _GEN_107 & enq_idxs_3[13];
  wire        _GEN_122 = _GEN_107 & enq_idxs_3[14];
  wire        _GEN_123 = _GEN_107 & enq_idxs_3[15];
  wire        _GEN_124 = _GEN_107 & enq_idxs_3[16];
  wire        _GEN_125 = _GEN_107 & enq_idxs_3[17];
  wire        _GEN_126 = _GEN_107 & enq_idxs_3[18];
  wire        _GEN_127 = _GEN_107 & enq_idxs_3[19];
  wire        _GEN_128 = _GEN_107 & enq_idxs_3[20];
  wire        _GEN_129 = _GEN_107 & enq_idxs_3[21];
  wire        _GEN_130 = _GEN_107 & enq_idxs_3[22];
  wire        _GEN_131 = _GEN_107 & enq_idxs_3[23];
  wire        _GEN_132 = _GEN_107 & enq_idxs_3[24];
  wire        _GEN_133 = _GEN_107 & enq_idxs_3[25];
  wire        _GEN_134 = _GEN_107 & enq_idxs_3[26];
  wire        _GEN_135 = _GEN_107 & enq_idxs_3[27];
  wire        _GEN_136 = _GEN_107 & enq_idxs_3[28];
  wire        _GEN_137 = _GEN_107 & enq_idxs_3[29];
  wire        _GEN_138 = _GEN_107 & enq_idxs_3[30];
  wire        _GEN_139 = _GEN_107 & enq_idxs_3[31];
  wire        _GEN_140 = ~_do_enq_T_1 & in_mask_4;
  wire        _GEN_141 = _GEN_140 & enq_idxs_4[0];
  wire        _GEN_142 = _GEN_140 & enq_idxs_4[1];
  wire        _GEN_143 = _GEN_140 & enq_idxs_4[2];
  wire        _GEN_144 = _GEN_140 & enq_idxs_4[3];
  wire        _GEN_145 = _GEN_140 & enq_idxs_4[4];
  wire        _GEN_146 = _GEN_140 & enq_idxs_4[5];
  wire        _GEN_147 = _GEN_140 & enq_idxs_4[6];
  wire        _GEN_148 = _GEN_140 & enq_idxs_4[7];
  wire        _GEN_149 = _GEN_140 & enq_idxs_4[8];
  wire        _GEN_150 = _GEN_140 & enq_idxs_4[9];
  wire        _GEN_151 = _GEN_140 & enq_idxs_4[10];
  wire        _GEN_152 = _GEN_140 & enq_idxs_4[11];
  wire        _GEN_153 = _GEN_140 & enq_idxs_4[12];
  wire        _GEN_154 = _GEN_140 & enq_idxs_4[13];
  wire        _GEN_155 = _GEN_140 & enq_idxs_4[14];
  wire        _GEN_156 = _GEN_140 & enq_idxs_4[15];
  wire        _GEN_157 = _GEN_140 & enq_idxs_4[16];
  wire        _GEN_158 = _GEN_140 & enq_idxs_4[17];
  wire        _GEN_159 = _GEN_140 & enq_idxs_4[18];
  wire        _GEN_160 = _GEN_140 & enq_idxs_4[19];
  wire        _GEN_161 = _GEN_140 & enq_idxs_4[20];
  wire        _GEN_162 = _GEN_140 & enq_idxs_4[21];
  wire        _GEN_163 = _GEN_140 & enq_idxs_4[22];
  wire        _GEN_164 = _GEN_140 & enq_idxs_4[23];
  wire        _GEN_165 = _GEN_140 & enq_idxs_4[24];
  wire        _GEN_166 = _GEN_140 & enq_idxs_4[25];
  wire        _GEN_167 = _GEN_140 & enq_idxs_4[26];
  wire        _GEN_168 = _GEN_140 & enq_idxs_4[27];
  wire        _GEN_169 = _GEN_140 & enq_idxs_4[28];
  wire        _GEN_170 = _GEN_140 & enq_idxs_4[29];
  wire        _GEN_171 = _GEN_140 & enq_idxs_4[30];
  wire        _GEN_172 = _GEN_140 & enq_idxs_4[31];
  wire        _GEN_173 = ~_do_enq_T_1 & in_mask_5;
  wire        _GEN_174 = _GEN_173 & enq_idxs_5[0];
  wire        _GEN_175 = _GEN_173 & enq_idxs_5[1];
  wire        _GEN_176 = _GEN_173 & enq_idxs_5[2];
  wire        _GEN_177 = _GEN_173 & enq_idxs_5[3];
  wire        _GEN_178 = _GEN_173 & enq_idxs_5[4];
  wire        _GEN_179 = _GEN_173 & enq_idxs_5[5];
  wire        _GEN_180 = _GEN_173 & enq_idxs_5[6];
  wire        _GEN_181 = _GEN_173 & enq_idxs_5[7];
  wire        _GEN_182 = _GEN_173 & enq_idxs_5[8];
  wire        _GEN_183 = _GEN_173 & enq_idxs_5[9];
  wire        _GEN_184 = _GEN_173 & enq_idxs_5[10];
  wire        _GEN_185 = _GEN_173 & enq_idxs_5[11];
  wire        _GEN_186 = _GEN_173 & enq_idxs_5[12];
  wire        _GEN_187 = _GEN_173 & enq_idxs_5[13];
  wire        _GEN_188 = _GEN_173 & enq_idxs_5[14];
  wire        _GEN_189 = _GEN_173 & enq_idxs_5[15];
  wire        _GEN_190 = _GEN_173 & enq_idxs_5[16];
  wire        _GEN_191 = _GEN_173 & enq_idxs_5[17];
  wire        _GEN_192 = _GEN_173 & enq_idxs_5[18];
  wire        _GEN_193 = _GEN_173 & enq_idxs_5[19];
  wire        _GEN_194 = _GEN_173 & enq_idxs_5[20];
  wire        _GEN_195 = _GEN_173 & enq_idxs_5[21];
  wire        _GEN_196 = _GEN_173 & enq_idxs_5[22];
  wire        _GEN_197 = _GEN_173 & enq_idxs_5[23];
  wire        _GEN_198 = _GEN_173 & enq_idxs_5[24];
  wire        _GEN_199 = _GEN_173 & enq_idxs_5[25];
  wire        _GEN_200 = _GEN_173 & enq_idxs_5[26];
  wire        _GEN_201 = _GEN_173 & enq_idxs_5[27];
  wire        _GEN_202 = _GEN_173 & enq_idxs_5[28];
  wire        _GEN_203 = _GEN_173 & enq_idxs_5[29];
  wire        _GEN_204 = _GEN_173 & enq_idxs_5[30];
  wire        _GEN_205 = _GEN_173 & enq_idxs_5[31];
  wire        _GEN_206 = ~_do_enq_T_1 & in_mask_6;
  wire        _GEN_207 = _GEN_206 & enq_idxs_6[0];
  wire        _GEN_208 = _GEN_206 & enq_idxs_6[1];
  wire        _GEN_209 = _GEN_206 & enq_idxs_6[2];
  wire        _GEN_210 = _GEN_206 & enq_idxs_6[3];
  wire        _GEN_211 = _GEN_206 & enq_idxs_6[4];
  wire        _GEN_212 = _GEN_206 & enq_idxs_6[5];
  wire        _GEN_213 = _GEN_206 & enq_idxs_6[6];
  wire        _GEN_214 = _GEN_206 & enq_idxs_6[7];
  wire        _GEN_215 = _GEN_206 & enq_idxs_6[8];
  wire        _GEN_216 = _GEN_206 & enq_idxs_6[9];
  wire        _GEN_217 = _GEN_206 & enq_idxs_6[10];
  wire        _GEN_218 = _GEN_206 & enq_idxs_6[11];
  wire        _GEN_219 = _GEN_206 & enq_idxs_6[12];
  wire        _GEN_220 = _GEN_206 & enq_idxs_6[13];
  wire        _GEN_221 = _GEN_206 & enq_idxs_6[14];
  wire        _GEN_222 = _GEN_206 & enq_idxs_6[15];
  wire        _GEN_223 = _GEN_206 & enq_idxs_6[16];
  wire        _GEN_224 = _GEN_206 & enq_idxs_6[17];
  wire        _GEN_225 = _GEN_206 & enq_idxs_6[18];
  wire        _GEN_226 = _GEN_206 & enq_idxs_6[19];
  wire        _GEN_227 = _GEN_206 & enq_idxs_6[20];
  wire        _GEN_228 = _GEN_206 & enq_idxs_6[21];
  wire        _GEN_229 = _GEN_206 & enq_idxs_6[22];
  wire        _GEN_230 = _GEN_206 & enq_idxs_6[23];
  wire        _GEN_231 = _GEN_206 & enq_idxs_6[24];
  wire        _GEN_232 = _GEN_206 & enq_idxs_6[25];
  wire        _GEN_233 = _GEN_206 & enq_idxs_6[26];
  wire        _GEN_234 = _GEN_206 & enq_idxs_6[27];
  wire        _GEN_235 = _GEN_206 & enq_idxs_6[28];
  wire        _GEN_236 = _GEN_206 & enq_idxs_6[29];
  wire        _GEN_237 = _GEN_206 & enq_idxs_6[30];
  wire        _GEN_238 = _GEN_206 & enq_idxs_6[31];
  wire        _GEN_239 = ~_do_enq_T_1 & in_mask_7;
  wire        _GEN_240 = _GEN_239 & enq_idxs_7[0];
  wire        _GEN_241 = _GEN_239 & enq_idxs_7[1];
  wire        _GEN_242 = _GEN_239 & enq_idxs_7[2];
  wire        _GEN_243 = _GEN_239 & enq_idxs_7[3];
  wire        _GEN_244 = _GEN_239 & enq_idxs_7[4];
  wire        _GEN_245 = _GEN_239 & enq_idxs_7[5];
  wire        _GEN_246 = _GEN_239 & enq_idxs_7[6];
  wire        _GEN_247 = _GEN_239 & enq_idxs_7[7];
  wire        _GEN_248 = _GEN_239 & enq_idxs_7[8];
  wire        _GEN_249 = _GEN_239 & enq_idxs_7[9];
  wire        _GEN_250 = _GEN_239 & enq_idxs_7[10];
  wire        _GEN_251 = _GEN_239 & enq_idxs_7[11];
  wire        _GEN_252 = _GEN_239 & enq_idxs_7[12];
  wire        _GEN_253 = _GEN_239 & enq_idxs_7[13];
  wire        _GEN_254 = _GEN_239 & enq_idxs_7[14];
  wire        _GEN_255 = _GEN_239 & enq_idxs_7[15];
  wire        _GEN_256 = _GEN_239 & enq_idxs_7[16];
  wire        _GEN_257 = _GEN_239 & enq_idxs_7[17];
  wire        _GEN_258 = _GEN_239 & enq_idxs_7[18];
  wire        _GEN_259 = _GEN_239 & enq_idxs_7[19];
  wire        _GEN_260 = _GEN_239 & enq_idxs_7[20];
  wire        _GEN_261 = _GEN_239 & enq_idxs_7[21];
  wire        _GEN_262 = _GEN_239 & enq_idxs_7[22];
  wire        _GEN_263 = _GEN_239 & enq_idxs_7[23];
  wire        _GEN_264 = _GEN_239 & enq_idxs_7[24];
  wire        _GEN_265 = _GEN_239 & enq_idxs_7[25];
  wire        _GEN_266 = _GEN_239 & enq_idxs_7[26];
  wire        _GEN_267 = _GEN_239 & enq_idxs_7[27];
  wire        _GEN_268 = _GEN_239 & enq_idxs_7[28];
  wire        _GEN_269 = _GEN_239 & enq_idxs_7[29];
  wire        _GEN_270 = _GEN_239 & enq_idxs_7[30];
  wire        _GEN_271 = _GEN_239 & enq_idxs_7[31];
  always @(posedge clock) begin
    if (_GEN_240) begin
      fb_uop_ram_0_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_0_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_0_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_0_debug_pc <= _pc_T_31;
      fb_uop_ram_0_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_0_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_0_taken <= in_uops_7_taken;
      fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_207) begin
      fb_uop_ram_0_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_0_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_0_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_0_debug_pc <= _pc_T_27;
      fb_uop_ram_0_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_0_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_0_taken <= in_uops_6_taken;
      fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_174) begin
      fb_uop_ram_0_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_0_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_0_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_0_debug_pc <= _pc_T_23;
      fb_uop_ram_0_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_0_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_0_taken <= in_uops_5_taken;
      fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_141) begin
      fb_uop_ram_0_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_0_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_0_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_0_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_0_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_0_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_0_taken <= in_uops_4_taken;
      fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_108) begin
      fb_uop_ram_0_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_0_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_0_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_0_debug_pc <= _pc_T_15;
      fb_uop_ram_0_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_0_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_0_taken <= in_uops_3_taken;
      fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_75) begin
      fb_uop_ram_0_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_0_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_0_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_0_debug_pc <= _pc_T_11;
      fb_uop_ram_0_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_0_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_0_taken <= in_uops_2_taken;
      fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_42) begin
      fb_uop_ram_0_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_0_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_0_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_0_debug_pc <= _pc_T_7;
      fb_uop_ram_0_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_0_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_0_taken <= in_uops_1_taken;
      fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_9) begin
      fb_uop_ram_0_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_0_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_0_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_0_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_0_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_0_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_0_taken <= in_uops_0_taken;
      fb_uop_ram_0_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_0_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_240 | _GEN_207 | _GEN_174 | _GEN_141 | _GEN_108 | _GEN_75 | _GEN_42 | _GEN_9) begin
      fb_uop_ram_0_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_0_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_0_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_0_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_0_edge_inst <= ~(_GEN_240 | _GEN_207 | _GEN_174) & (_GEN_141 ? io_enq_bits_edge_inst_1 : ~(_GEN_108 | _GEN_75 | _GEN_42) & (_GEN_9 ? io_enq_bits_edge_inst_0 : fb_uop_ram_0_edge_inst));
    if (_GEN_241) begin
      fb_uop_ram_1_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_1_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_1_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_1_debug_pc <= _pc_T_31;
      fb_uop_ram_1_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_1_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_1_taken <= in_uops_7_taken;
      fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_208) begin
      fb_uop_ram_1_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_1_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_1_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_1_debug_pc <= _pc_T_27;
      fb_uop_ram_1_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_1_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_1_taken <= in_uops_6_taken;
      fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_175) begin
      fb_uop_ram_1_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_1_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_1_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_1_debug_pc <= _pc_T_23;
      fb_uop_ram_1_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_1_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_1_taken <= in_uops_5_taken;
      fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_142) begin
      fb_uop_ram_1_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_1_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_1_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_1_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_1_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_1_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_1_taken <= in_uops_4_taken;
      fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_109) begin
      fb_uop_ram_1_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_1_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_1_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_1_debug_pc <= _pc_T_15;
      fb_uop_ram_1_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_1_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_1_taken <= in_uops_3_taken;
      fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_76) begin
      fb_uop_ram_1_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_1_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_1_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_1_debug_pc <= _pc_T_11;
      fb_uop_ram_1_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_1_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_1_taken <= in_uops_2_taken;
      fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_43) begin
      fb_uop_ram_1_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_1_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_1_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_1_debug_pc <= _pc_T_7;
      fb_uop_ram_1_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_1_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_1_taken <= in_uops_1_taken;
      fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_10) begin
      fb_uop_ram_1_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_1_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_1_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_1_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_1_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_1_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_1_taken <= in_uops_0_taken;
      fb_uop_ram_1_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_1_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_241 | _GEN_208 | _GEN_175 | _GEN_142 | _GEN_109 | _GEN_76 | _GEN_43 | _GEN_10) begin
      fb_uop_ram_1_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_1_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_1_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_1_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_1_edge_inst <= ~(_GEN_241 | _GEN_208 | _GEN_175) & (_GEN_142 ? io_enq_bits_edge_inst_1 : ~(_GEN_109 | _GEN_76 | _GEN_43) & (_GEN_10 ? io_enq_bits_edge_inst_0 : fb_uop_ram_1_edge_inst));
    if (_GEN_242) begin
      fb_uop_ram_2_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_2_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_2_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_2_debug_pc <= _pc_T_31;
      fb_uop_ram_2_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_2_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_2_taken <= in_uops_7_taken;
      fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_209) begin
      fb_uop_ram_2_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_2_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_2_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_2_debug_pc <= _pc_T_27;
      fb_uop_ram_2_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_2_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_2_taken <= in_uops_6_taken;
      fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_176) begin
      fb_uop_ram_2_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_2_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_2_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_2_debug_pc <= _pc_T_23;
      fb_uop_ram_2_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_2_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_2_taken <= in_uops_5_taken;
      fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_143) begin
      fb_uop_ram_2_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_2_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_2_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_2_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_2_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_2_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_2_taken <= in_uops_4_taken;
      fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_110) begin
      fb_uop_ram_2_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_2_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_2_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_2_debug_pc <= _pc_T_15;
      fb_uop_ram_2_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_2_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_2_taken <= in_uops_3_taken;
      fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_77) begin
      fb_uop_ram_2_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_2_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_2_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_2_debug_pc <= _pc_T_11;
      fb_uop_ram_2_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_2_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_2_taken <= in_uops_2_taken;
      fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_44) begin
      fb_uop_ram_2_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_2_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_2_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_2_debug_pc <= _pc_T_7;
      fb_uop_ram_2_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_2_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_2_taken <= in_uops_1_taken;
      fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_11) begin
      fb_uop_ram_2_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_2_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_2_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_2_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_2_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_2_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_2_taken <= in_uops_0_taken;
      fb_uop_ram_2_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_2_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_242 | _GEN_209 | _GEN_176 | _GEN_143 | _GEN_110 | _GEN_77 | _GEN_44 | _GEN_11) begin
      fb_uop_ram_2_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_2_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_2_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_2_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_2_edge_inst <= ~(_GEN_242 | _GEN_209 | _GEN_176) & (_GEN_143 ? io_enq_bits_edge_inst_1 : ~(_GEN_110 | _GEN_77 | _GEN_44) & (_GEN_11 ? io_enq_bits_edge_inst_0 : fb_uop_ram_2_edge_inst));
    if (_GEN_243) begin
      fb_uop_ram_3_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_3_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_3_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_3_debug_pc <= _pc_T_31;
      fb_uop_ram_3_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_3_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_3_taken <= in_uops_7_taken;
      fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_210) begin
      fb_uop_ram_3_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_3_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_3_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_3_debug_pc <= _pc_T_27;
      fb_uop_ram_3_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_3_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_3_taken <= in_uops_6_taken;
      fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_177) begin
      fb_uop_ram_3_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_3_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_3_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_3_debug_pc <= _pc_T_23;
      fb_uop_ram_3_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_3_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_3_taken <= in_uops_5_taken;
      fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_144) begin
      fb_uop_ram_3_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_3_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_3_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_3_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_3_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_3_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_3_taken <= in_uops_4_taken;
      fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_111) begin
      fb_uop_ram_3_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_3_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_3_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_3_debug_pc <= _pc_T_15;
      fb_uop_ram_3_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_3_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_3_taken <= in_uops_3_taken;
      fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_78) begin
      fb_uop_ram_3_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_3_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_3_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_3_debug_pc <= _pc_T_11;
      fb_uop_ram_3_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_3_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_3_taken <= in_uops_2_taken;
      fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_45) begin
      fb_uop_ram_3_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_3_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_3_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_3_debug_pc <= _pc_T_7;
      fb_uop_ram_3_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_3_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_3_taken <= in_uops_1_taken;
      fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_12) begin
      fb_uop_ram_3_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_3_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_3_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_3_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_3_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_3_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_3_taken <= in_uops_0_taken;
      fb_uop_ram_3_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_3_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_243 | _GEN_210 | _GEN_177 | _GEN_144 | _GEN_111 | _GEN_78 | _GEN_45 | _GEN_12) begin
      fb_uop_ram_3_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_3_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_3_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_3_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_3_edge_inst <= ~(_GEN_243 | _GEN_210 | _GEN_177) & (_GEN_144 ? io_enq_bits_edge_inst_1 : ~(_GEN_111 | _GEN_78 | _GEN_45) & (_GEN_12 ? io_enq_bits_edge_inst_0 : fb_uop_ram_3_edge_inst));
    if (_GEN_244) begin
      fb_uop_ram_4_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_4_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_4_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_4_debug_pc <= _pc_T_31;
      fb_uop_ram_4_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_4_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_4_taken <= in_uops_7_taken;
      fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_211) begin
      fb_uop_ram_4_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_4_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_4_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_4_debug_pc <= _pc_T_27;
      fb_uop_ram_4_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_4_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_4_taken <= in_uops_6_taken;
      fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_178) begin
      fb_uop_ram_4_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_4_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_4_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_4_debug_pc <= _pc_T_23;
      fb_uop_ram_4_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_4_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_4_taken <= in_uops_5_taken;
      fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_145) begin
      fb_uop_ram_4_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_4_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_4_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_4_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_4_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_4_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_4_taken <= in_uops_4_taken;
      fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_112) begin
      fb_uop_ram_4_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_4_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_4_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_4_debug_pc <= _pc_T_15;
      fb_uop_ram_4_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_4_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_4_taken <= in_uops_3_taken;
      fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_79) begin
      fb_uop_ram_4_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_4_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_4_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_4_debug_pc <= _pc_T_11;
      fb_uop_ram_4_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_4_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_4_taken <= in_uops_2_taken;
      fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_46) begin
      fb_uop_ram_4_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_4_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_4_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_4_debug_pc <= _pc_T_7;
      fb_uop_ram_4_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_4_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_4_taken <= in_uops_1_taken;
      fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_13) begin
      fb_uop_ram_4_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_4_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_4_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_4_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_4_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_4_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_4_taken <= in_uops_0_taken;
      fb_uop_ram_4_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_4_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_244 | _GEN_211 | _GEN_178 | _GEN_145 | _GEN_112 | _GEN_79 | _GEN_46 | _GEN_13) begin
      fb_uop_ram_4_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_4_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_4_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_4_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_4_edge_inst <= ~(_GEN_244 | _GEN_211 | _GEN_178) & (_GEN_145 ? io_enq_bits_edge_inst_1 : ~(_GEN_112 | _GEN_79 | _GEN_46) & (_GEN_13 ? io_enq_bits_edge_inst_0 : fb_uop_ram_4_edge_inst));
    if (_GEN_245) begin
      fb_uop_ram_5_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_5_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_5_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_5_debug_pc <= _pc_T_31;
      fb_uop_ram_5_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_5_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_5_taken <= in_uops_7_taken;
      fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_212) begin
      fb_uop_ram_5_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_5_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_5_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_5_debug_pc <= _pc_T_27;
      fb_uop_ram_5_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_5_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_5_taken <= in_uops_6_taken;
      fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_179) begin
      fb_uop_ram_5_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_5_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_5_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_5_debug_pc <= _pc_T_23;
      fb_uop_ram_5_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_5_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_5_taken <= in_uops_5_taken;
      fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_146) begin
      fb_uop_ram_5_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_5_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_5_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_5_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_5_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_5_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_5_taken <= in_uops_4_taken;
      fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_113) begin
      fb_uop_ram_5_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_5_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_5_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_5_debug_pc <= _pc_T_15;
      fb_uop_ram_5_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_5_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_5_taken <= in_uops_3_taken;
      fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_80) begin
      fb_uop_ram_5_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_5_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_5_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_5_debug_pc <= _pc_T_11;
      fb_uop_ram_5_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_5_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_5_taken <= in_uops_2_taken;
      fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_47) begin
      fb_uop_ram_5_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_5_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_5_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_5_debug_pc <= _pc_T_7;
      fb_uop_ram_5_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_5_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_5_taken <= in_uops_1_taken;
      fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_14) begin
      fb_uop_ram_5_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_5_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_5_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_5_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_5_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_5_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_5_taken <= in_uops_0_taken;
      fb_uop_ram_5_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_5_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_245 | _GEN_212 | _GEN_179 | _GEN_146 | _GEN_113 | _GEN_80 | _GEN_47 | _GEN_14) begin
      fb_uop_ram_5_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_5_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_5_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_5_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_5_edge_inst <= ~(_GEN_245 | _GEN_212 | _GEN_179) & (_GEN_146 ? io_enq_bits_edge_inst_1 : ~(_GEN_113 | _GEN_80 | _GEN_47) & (_GEN_14 ? io_enq_bits_edge_inst_0 : fb_uop_ram_5_edge_inst));
    if (_GEN_246) begin
      fb_uop_ram_6_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_6_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_6_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_6_debug_pc <= _pc_T_31;
      fb_uop_ram_6_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_6_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_6_taken <= in_uops_7_taken;
      fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_213) begin
      fb_uop_ram_6_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_6_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_6_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_6_debug_pc <= _pc_T_27;
      fb_uop_ram_6_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_6_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_6_taken <= in_uops_6_taken;
      fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_180) begin
      fb_uop_ram_6_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_6_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_6_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_6_debug_pc <= _pc_T_23;
      fb_uop_ram_6_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_6_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_6_taken <= in_uops_5_taken;
      fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_147) begin
      fb_uop_ram_6_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_6_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_6_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_6_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_6_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_6_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_6_taken <= in_uops_4_taken;
      fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_114) begin
      fb_uop_ram_6_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_6_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_6_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_6_debug_pc <= _pc_T_15;
      fb_uop_ram_6_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_6_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_6_taken <= in_uops_3_taken;
      fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_81) begin
      fb_uop_ram_6_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_6_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_6_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_6_debug_pc <= _pc_T_11;
      fb_uop_ram_6_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_6_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_6_taken <= in_uops_2_taken;
      fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_48) begin
      fb_uop_ram_6_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_6_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_6_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_6_debug_pc <= _pc_T_7;
      fb_uop_ram_6_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_6_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_6_taken <= in_uops_1_taken;
      fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_15) begin
      fb_uop_ram_6_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_6_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_6_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_6_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_6_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_6_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_6_taken <= in_uops_0_taken;
      fb_uop_ram_6_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_6_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_246 | _GEN_213 | _GEN_180 | _GEN_147 | _GEN_114 | _GEN_81 | _GEN_48 | _GEN_15) begin
      fb_uop_ram_6_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_6_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_6_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_6_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_6_edge_inst <= ~(_GEN_246 | _GEN_213 | _GEN_180) & (_GEN_147 ? io_enq_bits_edge_inst_1 : ~(_GEN_114 | _GEN_81 | _GEN_48) & (_GEN_15 ? io_enq_bits_edge_inst_0 : fb_uop_ram_6_edge_inst));
    if (_GEN_247) begin
      fb_uop_ram_7_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_7_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_7_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_7_debug_pc <= _pc_T_31;
      fb_uop_ram_7_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_7_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_7_taken <= in_uops_7_taken;
      fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_214) begin
      fb_uop_ram_7_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_7_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_7_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_7_debug_pc <= _pc_T_27;
      fb_uop_ram_7_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_7_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_7_taken <= in_uops_6_taken;
      fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_181) begin
      fb_uop_ram_7_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_7_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_7_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_7_debug_pc <= _pc_T_23;
      fb_uop_ram_7_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_7_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_7_taken <= in_uops_5_taken;
      fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_148) begin
      fb_uop_ram_7_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_7_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_7_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_7_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_7_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_7_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_7_taken <= in_uops_4_taken;
      fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_115) begin
      fb_uop_ram_7_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_7_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_7_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_7_debug_pc <= _pc_T_15;
      fb_uop_ram_7_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_7_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_7_taken <= in_uops_3_taken;
      fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_82) begin
      fb_uop_ram_7_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_7_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_7_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_7_debug_pc <= _pc_T_11;
      fb_uop_ram_7_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_7_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_7_taken <= in_uops_2_taken;
      fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_49) begin
      fb_uop_ram_7_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_7_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_7_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_7_debug_pc <= _pc_T_7;
      fb_uop_ram_7_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_7_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_7_taken <= in_uops_1_taken;
      fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_16) begin
      fb_uop_ram_7_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_7_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_7_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_7_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_7_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_7_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_7_taken <= in_uops_0_taken;
      fb_uop_ram_7_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_7_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_247 | _GEN_214 | _GEN_181 | _GEN_148 | _GEN_115 | _GEN_82 | _GEN_49 | _GEN_16) begin
      fb_uop_ram_7_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_7_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_7_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_7_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_7_edge_inst <= ~(_GEN_247 | _GEN_214 | _GEN_181) & (_GEN_148 ? io_enq_bits_edge_inst_1 : ~(_GEN_115 | _GEN_82 | _GEN_49) & (_GEN_16 ? io_enq_bits_edge_inst_0 : fb_uop_ram_7_edge_inst));
    if (_GEN_248) begin
      fb_uop_ram_8_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_8_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_8_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_8_debug_pc <= _pc_T_31;
      fb_uop_ram_8_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_8_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_8_taken <= in_uops_7_taken;
      fb_uop_ram_8_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_8_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_215) begin
      fb_uop_ram_8_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_8_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_8_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_8_debug_pc <= _pc_T_27;
      fb_uop_ram_8_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_8_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_8_taken <= in_uops_6_taken;
      fb_uop_ram_8_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_8_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_182) begin
      fb_uop_ram_8_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_8_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_8_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_8_debug_pc <= _pc_T_23;
      fb_uop_ram_8_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_8_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_8_taken <= in_uops_5_taken;
      fb_uop_ram_8_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_8_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_149) begin
      fb_uop_ram_8_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_8_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_8_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_8_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_8_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_8_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_8_taken <= in_uops_4_taken;
      fb_uop_ram_8_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_8_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_116) begin
      fb_uop_ram_8_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_8_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_8_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_8_debug_pc <= _pc_T_15;
      fb_uop_ram_8_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_8_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_8_taken <= in_uops_3_taken;
      fb_uop_ram_8_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_8_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_83) begin
      fb_uop_ram_8_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_8_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_8_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_8_debug_pc <= _pc_T_11;
      fb_uop_ram_8_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_8_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_8_taken <= in_uops_2_taken;
      fb_uop_ram_8_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_8_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_50) begin
      fb_uop_ram_8_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_8_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_8_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_8_debug_pc <= _pc_T_7;
      fb_uop_ram_8_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_8_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_8_taken <= in_uops_1_taken;
      fb_uop_ram_8_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_8_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_17) begin
      fb_uop_ram_8_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_8_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_8_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_8_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_8_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_8_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_8_taken <= in_uops_0_taken;
      fb_uop_ram_8_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_8_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_248 | _GEN_215 | _GEN_182 | _GEN_149 | _GEN_116 | _GEN_83 | _GEN_50 | _GEN_17) begin
      fb_uop_ram_8_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_8_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_8_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_8_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_8_edge_inst <= ~(_GEN_248 | _GEN_215 | _GEN_182) & (_GEN_149 ? io_enq_bits_edge_inst_1 : ~(_GEN_116 | _GEN_83 | _GEN_50) & (_GEN_17 ? io_enq_bits_edge_inst_0 : fb_uop_ram_8_edge_inst));
    if (_GEN_249) begin
      fb_uop_ram_9_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_9_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_9_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_9_debug_pc <= _pc_T_31;
      fb_uop_ram_9_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_9_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_9_taken <= in_uops_7_taken;
      fb_uop_ram_9_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_9_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_216) begin
      fb_uop_ram_9_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_9_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_9_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_9_debug_pc <= _pc_T_27;
      fb_uop_ram_9_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_9_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_9_taken <= in_uops_6_taken;
      fb_uop_ram_9_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_9_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_183) begin
      fb_uop_ram_9_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_9_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_9_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_9_debug_pc <= _pc_T_23;
      fb_uop_ram_9_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_9_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_9_taken <= in_uops_5_taken;
      fb_uop_ram_9_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_9_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_150) begin
      fb_uop_ram_9_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_9_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_9_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_9_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_9_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_9_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_9_taken <= in_uops_4_taken;
      fb_uop_ram_9_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_9_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_117) begin
      fb_uop_ram_9_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_9_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_9_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_9_debug_pc <= _pc_T_15;
      fb_uop_ram_9_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_9_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_9_taken <= in_uops_3_taken;
      fb_uop_ram_9_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_9_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_84) begin
      fb_uop_ram_9_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_9_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_9_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_9_debug_pc <= _pc_T_11;
      fb_uop_ram_9_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_9_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_9_taken <= in_uops_2_taken;
      fb_uop_ram_9_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_9_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_51) begin
      fb_uop_ram_9_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_9_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_9_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_9_debug_pc <= _pc_T_7;
      fb_uop_ram_9_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_9_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_9_taken <= in_uops_1_taken;
      fb_uop_ram_9_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_9_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_18) begin
      fb_uop_ram_9_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_9_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_9_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_9_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_9_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_9_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_9_taken <= in_uops_0_taken;
      fb_uop_ram_9_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_9_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_249 | _GEN_216 | _GEN_183 | _GEN_150 | _GEN_117 | _GEN_84 | _GEN_51 | _GEN_18) begin
      fb_uop_ram_9_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_9_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_9_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_9_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_9_edge_inst <= ~(_GEN_249 | _GEN_216 | _GEN_183) & (_GEN_150 ? io_enq_bits_edge_inst_1 : ~(_GEN_117 | _GEN_84 | _GEN_51) & (_GEN_18 ? io_enq_bits_edge_inst_0 : fb_uop_ram_9_edge_inst));
    if (_GEN_250) begin
      fb_uop_ram_10_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_10_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_10_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_10_debug_pc <= _pc_T_31;
      fb_uop_ram_10_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_10_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_10_taken <= in_uops_7_taken;
      fb_uop_ram_10_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_10_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_217) begin
      fb_uop_ram_10_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_10_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_10_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_10_debug_pc <= _pc_T_27;
      fb_uop_ram_10_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_10_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_10_taken <= in_uops_6_taken;
      fb_uop_ram_10_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_10_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_184) begin
      fb_uop_ram_10_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_10_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_10_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_10_debug_pc <= _pc_T_23;
      fb_uop_ram_10_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_10_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_10_taken <= in_uops_5_taken;
      fb_uop_ram_10_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_10_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_151) begin
      fb_uop_ram_10_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_10_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_10_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_10_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_10_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_10_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_10_taken <= in_uops_4_taken;
      fb_uop_ram_10_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_10_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_118) begin
      fb_uop_ram_10_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_10_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_10_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_10_debug_pc <= _pc_T_15;
      fb_uop_ram_10_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_10_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_10_taken <= in_uops_3_taken;
      fb_uop_ram_10_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_10_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_85) begin
      fb_uop_ram_10_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_10_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_10_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_10_debug_pc <= _pc_T_11;
      fb_uop_ram_10_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_10_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_10_taken <= in_uops_2_taken;
      fb_uop_ram_10_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_10_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_52) begin
      fb_uop_ram_10_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_10_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_10_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_10_debug_pc <= _pc_T_7;
      fb_uop_ram_10_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_10_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_10_taken <= in_uops_1_taken;
      fb_uop_ram_10_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_10_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_19) begin
      fb_uop_ram_10_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_10_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_10_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_10_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_10_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_10_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_10_taken <= in_uops_0_taken;
      fb_uop_ram_10_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_10_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_250 | _GEN_217 | _GEN_184 | _GEN_151 | _GEN_118 | _GEN_85 | _GEN_52 | _GEN_19) begin
      fb_uop_ram_10_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_10_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_10_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_10_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_10_edge_inst <= ~(_GEN_250 | _GEN_217 | _GEN_184) & (_GEN_151 ? io_enq_bits_edge_inst_1 : ~(_GEN_118 | _GEN_85 | _GEN_52) & (_GEN_19 ? io_enq_bits_edge_inst_0 : fb_uop_ram_10_edge_inst));
    if (_GEN_251) begin
      fb_uop_ram_11_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_11_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_11_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_11_debug_pc <= _pc_T_31;
      fb_uop_ram_11_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_11_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_11_taken <= in_uops_7_taken;
      fb_uop_ram_11_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_11_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_218) begin
      fb_uop_ram_11_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_11_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_11_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_11_debug_pc <= _pc_T_27;
      fb_uop_ram_11_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_11_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_11_taken <= in_uops_6_taken;
      fb_uop_ram_11_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_11_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_185) begin
      fb_uop_ram_11_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_11_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_11_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_11_debug_pc <= _pc_T_23;
      fb_uop_ram_11_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_11_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_11_taken <= in_uops_5_taken;
      fb_uop_ram_11_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_11_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_152) begin
      fb_uop_ram_11_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_11_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_11_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_11_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_11_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_11_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_11_taken <= in_uops_4_taken;
      fb_uop_ram_11_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_11_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_119) begin
      fb_uop_ram_11_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_11_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_11_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_11_debug_pc <= _pc_T_15;
      fb_uop_ram_11_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_11_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_11_taken <= in_uops_3_taken;
      fb_uop_ram_11_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_11_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_86) begin
      fb_uop_ram_11_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_11_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_11_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_11_debug_pc <= _pc_T_11;
      fb_uop_ram_11_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_11_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_11_taken <= in_uops_2_taken;
      fb_uop_ram_11_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_11_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_53) begin
      fb_uop_ram_11_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_11_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_11_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_11_debug_pc <= _pc_T_7;
      fb_uop_ram_11_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_11_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_11_taken <= in_uops_1_taken;
      fb_uop_ram_11_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_11_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_20) begin
      fb_uop_ram_11_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_11_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_11_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_11_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_11_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_11_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_11_taken <= in_uops_0_taken;
      fb_uop_ram_11_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_11_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_251 | _GEN_218 | _GEN_185 | _GEN_152 | _GEN_119 | _GEN_86 | _GEN_53 | _GEN_20) begin
      fb_uop_ram_11_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_11_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_11_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_11_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_11_edge_inst <= ~(_GEN_251 | _GEN_218 | _GEN_185) & (_GEN_152 ? io_enq_bits_edge_inst_1 : ~(_GEN_119 | _GEN_86 | _GEN_53) & (_GEN_20 ? io_enq_bits_edge_inst_0 : fb_uop_ram_11_edge_inst));
    if (_GEN_252) begin
      fb_uop_ram_12_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_12_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_12_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_12_debug_pc <= _pc_T_31;
      fb_uop_ram_12_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_12_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_12_taken <= in_uops_7_taken;
      fb_uop_ram_12_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_12_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_219) begin
      fb_uop_ram_12_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_12_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_12_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_12_debug_pc <= _pc_T_27;
      fb_uop_ram_12_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_12_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_12_taken <= in_uops_6_taken;
      fb_uop_ram_12_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_12_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_186) begin
      fb_uop_ram_12_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_12_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_12_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_12_debug_pc <= _pc_T_23;
      fb_uop_ram_12_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_12_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_12_taken <= in_uops_5_taken;
      fb_uop_ram_12_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_12_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_153) begin
      fb_uop_ram_12_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_12_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_12_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_12_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_12_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_12_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_12_taken <= in_uops_4_taken;
      fb_uop_ram_12_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_12_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_120) begin
      fb_uop_ram_12_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_12_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_12_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_12_debug_pc <= _pc_T_15;
      fb_uop_ram_12_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_12_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_12_taken <= in_uops_3_taken;
      fb_uop_ram_12_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_12_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_87) begin
      fb_uop_ram_12_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_12_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_12_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_12_debug_pc <= _pc_T_11;
      fb_uop_ram_12_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_12_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_12_taken <= in_uops_2_taken;
      fb_uop_ram_12_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_12_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_54) begin
      fb_uop_ram_12_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_12_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_12_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_12_debug_pc <= _pc_T_7;
      fb_uop_ram_12_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_12_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_12_taken <= in_uops_1_taken;
      fb_uop_ram_12_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_12_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_21) begin
      fb_uop_ram_12_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_12_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_12_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_12_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_12_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_12_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_12_taken <= in_uops_0_taken;
      fb_uop_ram_12_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_12_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_252 | _GEN_219 | _GEN_186 | _GEN_153 | _GEN_120 | _GEN_87 | _GEN_54 | _GEN_21) begin
      fb_uop_ram_12_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_12_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_12_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_12_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_12_edge_inst <= ~(_GEN_252 | _GEN_219 | _GEN_186) & (_GEN_153 ? io_enq_bits_edge_inst_1 : ~(_GEN_120 | _GEN_87 | _GEN_54) & (_GEN_21 ? io_enq_bits_edge_inst_0 : fb_uop_ram_12_edge_inst));
    if (_GEN_253) begin
      fb_uop_ram_13_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_13_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_13_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_13_debug_pc <= _pc_T_31;
      fb_uop_ram_13_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_13_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_13_taken <= in_uops_7_taken;
      fb_uop_ram_13_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_13_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_220) begin
      fb_uop_ram_13_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_13_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_13_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_13_debug_pc <= _pc_T_27;
      fb_uop_ram_13_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_13_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_13_taken <= in_uops_6_taken;
      fb_uop_ram_13_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_13_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_187) begin
      fb_uop_ram_13_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_13_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_13_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_13_debug_pc <= _pc_T_23;
      fb_uop_ram_13_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_13_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_13_taken <= in_uops_5_taken;
      fb_uop_ram_13_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_13_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_154) begin
      fb_uop_ram_13_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_13_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_13_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_13_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_13_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_13_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_13_taken <= in_uops_4_taken;
      fb_uop_ram_13_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_13_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_121) begin
      fb_uop_ram_13_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_13_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_13_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_13_debug_pc <= _pc_T_15;
      fb_uop_ram_13_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_13_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_13_taken <= in_uops_3_taken;
      fb_uop_ram_13_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_13_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_88) begin
      fb_uop_ram_13_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_13_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_13_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_13_debug_pc <= _pc_T_11;
      fb_uop_ram_13_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_13_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_13_taken <= in_uops_2_taken;
      fb_uop_ram_13_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_13_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_55) begin
      fb_uop_ram_13_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_13_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_13_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_13_debug_pc <= _pc_T_7;
      fb_uop_ram_13_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_13_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_13_taken <= in_uops_1_taken;
      fb_uop_ram_13_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_13_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_22) begin
      fb_uop_ram_13_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_13_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_13_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_13_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_13_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_13_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_13_taken <= in_uops_0_taken;
      fb_uop_ram_13_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_13_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_253 | _GEN_220 | _GEN_187 | _GEN_154 | _GEN_121 | _GEN_88 | _GEN_55 | _GEN_22) begin
      fb_uop_ram_13_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_13_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_13_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_13_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_13_edge_inst <= ~(_GEN_253 | _GEN_220 | _GEN_187) & (_GEN_154 ? io_enq_bits_edge_inst_1 : ~(_GEN_121 | _GEN_88 | _GEN_55) & (_GEN_22 ? io_enq_bits_edge_inst_0 : fb_uop_ram_13_edge_inst));
    if (_GEN_254) begin
      fb_uop_ram_14_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_14_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_14_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_14_debug_pc <= _pc_T_31;
      fb_uop_ram_14_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_14_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_14_taken <= in_uops_7_taken;
      fb_uop_ram_14_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_14_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_221) begin
      fb_uop_ram_14_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_14_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_14_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_14_debug_pc <= _pc_T_27;
      fb_uop_ram_14_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_14_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_14_taken <= in_uops_6_taken;
      fb_uop_ram_14_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_14_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_188) begin
      fb_uop_ram_14_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_14_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_14_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_14_debug_pc <= _pc_T_23;
      fb_uop_ram_14_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_14_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_14_taken <= in_uops_5_taken;
      fb_uop_ram_14_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_14_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_155) begin
      fb_uop_ram_14_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_14_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_14_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_14_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_14_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_14_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_14_taken <= in_uops_4_taken;
      fb_uop_ram_14_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_14_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_122) begin
      fb_uop_ram_14_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_14_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_14_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_14_debug_pc <= _pc_T_15;
      fb_uop_ram_14_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_14_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_14_taken <= in_uops_3_taken;
      fb_uop_ram_14_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_14_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_89) begin
      fb_uop_ram_14_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_14_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_14_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_14_debug_pc <= _pc_T_11;
      fb_uop_ram_14_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_14_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_14_taken <= in_uops_2_taken;
      fb_uop_ram_14_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_14_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_56) begin
      fb_uop_ram_14_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_14_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_14_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_14_debug_pc <= _pc_T_7;
      fb_uop_ram_14_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_14_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_14_taken <= in_uops_1_taken;
      fb_uop_ram_14_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_14_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_23) begin
      fb_uop_ram_14_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_14_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_14_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_14_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_14_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_14_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_14_taken <= in_uops_0_taken;
      fb_uop_ram_14_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_14_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_254 | _GEN_221 | _GEN_188 | _GEN_155 | _GEN_122 | _GEN_89 | _GEN_56 | _GEN_23) begin
      fb_uop_ram_14_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_14_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_14_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_14_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_14_edge_inst <= ~(_GEN_254 | _GEN_221 | _GEN_188) & (_GEN_155 ? io_enq_bits_edge_inst_1 : ~(_GEN_122 | _GEN_89 | _GEN_56) & (_GEN_23 ? io_enq_bits_edge_inst_0 : fb_uop_ram_14_edge_inst));
    if (_GEN_255) begin
      fb_uop_ram_15_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_15_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_15_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_15_debug_pc <= _pc_T_31;
      fb_uop_ram_15_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_15_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_15_taken <= in_uops_7_taken;
      fb_uop_ram_15_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_15_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_222) begin
      fb_uop_ram_15_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_15_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_15_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_15_debug_pc <= _pc_T_27;
      fb_uop_ram_15_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_15_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_15_taken <= in_uops_6_taken;
      fb_uop_ram_15_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_15_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_189) begin
      fb_uop_ram_15_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_15_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_15_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_15_debug_pc <= _pc_T_23;
      fb_uop_ram_15_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_15_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_15_taken <= in_uops_5_taken;
      fb_uop_ram_15_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_15_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_156) begin
      fb_uop_ram_15_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_15_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_15_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_15_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_15_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_15_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_15_taken <= in_uops_4_taken;
      fb_uop_ram_15_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_15_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_123) begin
      fb_uop_ram_15_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_15_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_15_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_15_debug_pc <= _pc_T_15;
      fb_uop_ram_15_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_15_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_15_taken <= in_uops_3_taken;
      fb_uop_ram_15_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_15_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_90) begin
      fb_uop_ram_15_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_15_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_15_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_15_debug_pc <= _pc_T_11;
      fb_uop_ram_15_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_15_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_15_taken <= in_uops_2_taken;
      fb_uop_ram_15_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_15_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_57) begin
      fb_uop_ram_15_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_15_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_15_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_15_debug_pc <= _pc_T_7;
      fb_uop_ram_15_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_15_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_15_taken <= in_uops_1_taken;
      fb_uop_ram_15_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_15_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_24) begin
      fb_uop_ram_15_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_15_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_15_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_15_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_15_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_15_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_15_taken <= in_uops_0_taken;
      fb_uop_ram_15_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_15_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_255 | _GEN_222 | _GEN_189 | _GEN_156 | _GEN_123 | _GEN_90 | _GEN_57 | _GEN_24) begin
      fb_uop_ram_15_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_15_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_15_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_15_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_15_edge_inst <= ~(_GEN_255 | _GEN_222 | _GEN_189) & (_GEN_156 ? io_enq_bits_edge_inst_1 : ~(_GEN_123 | _GEN_90 | _GEN_57) & (_GEN_24 ? io_enq_bits_edge_inst_0 : fb_uop_ram_15_edge_inst));
    if (_GEN_256) begin
      fb_uop_ram_16_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_16_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_16_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_16_debug_pc <= _pc_T_31;
      fb_uop_ram_16_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_16_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_16_taken <= in_uops_7_taken;
      fb_uop_ram_16_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_16_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_223) begin
      fb_uop_ram_16_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_16_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_16_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_16_debug_pc <= _pc_T_27;
      fb_uop_ram_16_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_16_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_16_taken <= in_uops_6_taken;
      fb_uop_ram_16_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_16_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_190) begin
      fb_uop_ram_16_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_16_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_16_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_16_debug_pc <= _pc_T_23;
      fb_uop_ram_16_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_16_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_16_taken <= in_uops_5_taken;
      fb_uop_ram_16_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_16_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_157) begin
      fb_uop_ram_16_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_16_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_16_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_16_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_16_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_16_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_16_taken <= in_uops_4_taken;
      fb_uop_ram_16_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_16_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_124) begin
      fb_uop_ram_16_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_16_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_16_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_16_debug_pc <= _pc_T_15;
      fb_uop_ram_16_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_16_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_16_taken <= in_uops_3_taken;
      fb_uop_ram_16_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_16_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_91) begin
      fb_uop_ram_16_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_16_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_16_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_16_debug_pc <= _pc_T_11;
      fb_uop_ram_16_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_16_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_16_taken <= in_uops_2_taken;
      fb_uop_ram_16_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_16_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_58) begin
      fb_uop_ram_16_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_16_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_16_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_16_debug_pc <= _pc_T_7;
      fb_uop_ram_16_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_16_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_16_taken <= in_uops_1_taken;
      fb_uop_ram_16_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_16_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_25) begin
      fb_uop_ram_16_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_16_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_16_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_16_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_16_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_16_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_16_taken <= in_uops_0_taken;
      fb_uop_ram_16_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_16_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_256 | _GEN_223 | _GEN_190 | _GEN_157 | _GEN_124 | _GEN_91 | _GEN_58 | _GEN_25) begin
      fb_uop_ram_16_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_16_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_16_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_16_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_16_edge_inst <= ~(_GEN_256 | _GEN_223 | _GEN_190) & (_GEN_157 ? io_enq_bits_edge_inst_1 : ~(_GEN_124 | _GEN_91 | _GEN_58) & (_GEN_25 ? io_enq_bits_edge_inst_0 : fb_uop_ram_16_edge_inst));
    if (_GEN_257) begin
      fb_uop_ram_17_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_17_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_17_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_17_debug_pc <= _pc_T_31;
      fb_uop_ram_17_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_17_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_17_taken <= in_uops_7_taken;
      fb_uop_ram_17_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_17_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_224) begin
      fb_uop_ram_17_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_17_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_17_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_17_debug_pc <= _pc_T_27;
      fb_uop_ram_17_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_17_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_17_taken <= in_uops_6_taken;
      fb_uop_ram_17_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_17_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_191) begin
      fb_uop_ram_17_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_17_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_17_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_17_debug_pc <= _pc_T_23;
      fb_uop_ram_17_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_17_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_17_taken <= in_uops_5_taken;
      fb_uop_ram_17_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_17_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_158) begin
      fb_uop_ram_17_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_17_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_17_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_17_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_17_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_17_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_17_taken <= in_uops_4_taken;
      fb_uop_ram_17_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_17_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_125) begin
      fb_uop_ram_17_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_17_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_17_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_17_debug_pc <= _pc_T_15;
      fb_uop_ram_17_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_17_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_17_taken <= in_uops_3_taken;
      fb_uop_ram_17_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_17_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_92) begin
      fb_uop_ram_17_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_17_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_17_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_17_debug_pc <= _pc_T_11;
      fb_uop_ram_17_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_17_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_17_taken <= in_uops_2_taken;
      fb_uop_ram_17_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_17_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_59) begin
      fb_uop_ram_17_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_17_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_17_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_17_debug_pc <= _pc_T_7;
      fb_uop_ram_17_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_17_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_17_taken <= in_uops_1_taken;
      fb_uop_ram_17_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_17_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_26) begin
      fb_uop_ram_17_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_17_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_17_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_17_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_17_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_17_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_17_taken <= in_uops_0_taken;
      fb_uop_ram_17_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_17_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_257 | _GEN_224 | _GEN_191 | _GEN_158 | _GEN_125 | _GEN_92 | _GEN_59 | _GEN_26) begin
      fb_uop_ram_17_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_17_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_17_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_17_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_17_edge_inst <= ~(_GEN_257 | _GEN_224 | _GEN_191) & (_GEN_158 ? io_enq_bits_edge_inst_1 : ~(_GEN_125 | _GEN_92 | _GEN_59) & (_GEN_26 ? io_enq_bits_edge_inst_0 : fb_uop_ram_17_edge_inst));
    if (_GEN_258) begin
      fb_uop_ram_18_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_18_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_18_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_18_debug_pc <= _pc_T_31;
      fb_uop_ram_18_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_18_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_18_taken <= in_uops_7_taken;
      fb_uop_ram_18_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_18_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_225) begin
      fb_uop_ram_18_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_18_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_18_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_18_debug_pc <= _pc_T_27;
      fb_uop_ram_18_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_18_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_18_taken <= in_uops_6_taken;
      fb_uop_ram_18_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_18_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_192) begin
      fb_uop_ram_18_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_18_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_18_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_18_debug_pc <= _pc_T_23;
      fb_uop_ram_18_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_18_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_18_taken <= in_uops_5_taken;
      fb_uop_ram_18_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_18_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_159) begin
      fb_uop_ram_18_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_18_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_18_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_18_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_18_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_18_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_18_taken <= in_uops_4_taken;
      fb_uop_ram_18_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_18_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_126) begin
      fb_uop_ram_18_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_18_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_18_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_18_debug_pc <= _pc_T_15;
      fb_uop_ram_18_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_18_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_18_taken <= in_uops_3_taken;
      fb_uop_ram_18_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_18_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_93) begin
      fb_uop_ram_18_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_18_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_18_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_18_debug_pc <= _pc_T_11;
      fb_uop_ram_18_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_18_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_18_taken <= in_uops_2_taken;
      fb_uop_ram_18_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_18_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_60) begin
      fb_uop_ram_18_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_18_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_18_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_18_debug_pc <= _pc_T_7;
      fb_uop_ram_18_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_18_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_18_taken <= in_uops_1_taken;
      fb_uop_ram_18_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_18_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_27) begin
      fb_uop_ram_18_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_18_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_18_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_18_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_18_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_18_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_18_taken <= in_uops_0_taken;
      fb_uop_ram_18_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_18_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_258 | _GEN_225 | _GEN_192 | _GEN_159 | _GEN_126 | _GEN_93 | _GEN_60 | _GEN_27) begin
      fb_uop_ram_18_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_18_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_18_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_18_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_18_edge_inst <= ~(_GEN_258 | _GEN_225 | _GEN_192) & (_GEN_159 ? io_enq_bits_edge_inst_1 : ~(_GEN_126 | _GEN_93 | _GEN_60) & (_GEN_27 ? io_enq_bits_edge_inst_0 : fb_uop_ram_18_edge_inst));
    if (_GEN_259) begin
      fb_uop_ram_19_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_19_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_19_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_19_debug_pc <= _pc_T_31;
      fb_uop_ram_19_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_19_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_19_taken <= in_uops_7_taken;
      fb_uop_ram_19_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_19_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_226) begin
      fb_uop_ram_19_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_19_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_19_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_19_debug_pc <= _pc_T_27;
      fb_uop_ram_19_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_19_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_19_taken <= in_uops_6_taken;
      fb_uop_ram_19_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_19_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_193) begin
      fb_uop_ram_19_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_19_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_19_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_19_debug_pc <= _pc_T_23;
      fb_uop_ram_19_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_19_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_19_taken <= in_uops_5_taken;
      fb_uop_ram_19_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_19_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_160) begin
      fb_uop_ram_19_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_19_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_19_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_19_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_19_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_19_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_19_taken <= in_uops_4_taken;
      fb_uop_ram_19_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_19_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_127) begin
      fb_uop_ram_19_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_19_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_19_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_19_debug_pc <= _pc_T_15;
      fb_uop_ram_19_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_19_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_19_taken <= in_uops_3_taken;
      fb_uop_ram_19_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_19_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_94) begin
      fb_uop_ram_19_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_19_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_19_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_19_debug_pc <= _pc_T_11;
      fb_uop_ram_19_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_19_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_19_taken <= in_uops_2_taken;
      fb_uop_ram_19_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_19_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_61) begin
      fb_uop_ram_19_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_19_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_19_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_19_debug_pc <= _pc_T_7;
      fb_uop_ram_19_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_19_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_19_taken <= in_uops_1_taken;
      fb_uop_ram_19_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_19_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_28) begin
      fb_uop_ram_19_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_19_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_19_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_19_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_19_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_19_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_19_taken <= in_uops_0_taken;
      fb_uop_ram_19_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_19_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_259 | _GEN_226 | _GEN_193 | _GEN_160 | _GEN_127 | _GEN_94 | _GEN_61 | _GEN_28) begin
      fb_uop_ram_19_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_19_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_19_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_19_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_19_edge_inst <= ~(_GEN_259 | _GEN_226 | _GEN_193) & (_GEN_160 ? io_enq_bits_edge_inst_1 : ~(_GEN_127 | _GEN_94 | _GEN_61) & (_GEN_28 ? io_enq_bits_edge_inst_0 : fb_uop_ram_19_edge_inst));
    if (_GEN_260) begin
      fb_uop_ram_20_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_20_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_20_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_20_debug_pc <= _pc_T_31;
      fb_uop_ram_20_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_20_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_20_taken <= in_uops_7_taken;
      fb_uop_ram_20_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_20_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_227) begin
      fb_uop_ram_20_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_20_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_20_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_20_debug_pc <= _pc_T_27;
      fb_uop_ram_20_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_20_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_20_taken <= in_uops_6_taken;
      fb_uop_ram_20_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_20_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_194) begin
      fb_uop_ram_20_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_20_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_20_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_20_debug_pc <= _pc_T_23;
      fb_uop_ram_20_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_20_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_20_taken <= in_uops_5_taken;
      fb_uop_ram_20_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_20_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_161) begin
      fb_uop_ram_20_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_20_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_20_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_20_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_20_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_20_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_20_taken <= in_uops_4_taken;
      fb_uop_ram_20_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_20_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_128) begin
      fb_uop_ram_20_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_20_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_20_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_20_debug_pc <= _pc_T_15;
      fb_uop_ram_20_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_20_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_20_taken <= in_uops_3_taken;
      fb_uop_ram_20_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_20_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_95) begin
      fb_uop_ram_20_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_20_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_20_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_20_debug_pc <= _pc_T_11;
      fb_uop_ram_20_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_20_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_20_taken <= in_uops_2_taken;
      fb_uop_ram_20_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_20_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_62) begin
      fb_uop_ram_20_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_20_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_20_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_20_debug_pc <= _pc_T_7;
      fb_uop_ram_20_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_20_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_20_taken <= in_uops_1_taken;
      fb_uop_ram_20_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_20_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_29) begin
      fb_uop_ram_20_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_20_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_20_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_20_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_20_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_20_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_20_taken <= in_uops_0_taken;
      fb_uop_ram_20_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_20_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_260 | _GEN_227 | _GEN_194 | _GEN_161 | _GEN_128 | _GEN_95 | _GEN_62 | _GEN_29) begin
      fb_uop_ram_20_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_20_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_20_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_20_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_20_edge_inst <= ~(_GEN_260 | _GEN_227 | _GEN_194) & (_GEN_161 ? io_enq_bits_edge_inst_1 : ~(_GEN_128 | _GEN_95 | _GEN_62) & (_GEN_29 ? io_enq_bits_edge_inst_0 : fb_uop_ram_20_edge_inst));
    if (_GEN_261) begin
      fb_uop_ram_21_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_21_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_21_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_21_debug_pc <= _pc_T_31;
      fb_uop_ram_21_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_21_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_21_taken <= in_uops_7_taken;
      fb_uop_ram_21_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_21_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_228) begin
      fb_uop_ram_21_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_21_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_21_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_21_debug_pc <= _pc_T_27;
      fb_uop_ram_21_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_21_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_21_taken <= in_uops_6_taken;
      fb_uop_ram_21_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_21_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_195) begin
      fb_uop_ram_21_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_21_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_21_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_21_debug_pc <= _pc_T_23;
      fb_uop_ram_21_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_21_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_21_taken <= in_uops_5_taken;
      fb_uop_ram_21_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_21_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_162) begin
      fb_uop_ram_21_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_21_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_21_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_21_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_21_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_21_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_21_taken <= in_uops_4_taken;
      fb_uop_ram_21_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_21_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_129) begin
      fb_uop_ram_21_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_21_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_21_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_21_debug_pc <= _pc_T_15;
      fb_uop_ram_21_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_21_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_21_taken <= in_uops_3_taken;
      fb_uop_ram_21_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_21_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_96) begin
      fb_uop_ram_21_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_21_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_21_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_21_debug_pc <= _pc_T_11;
      fb_uop_ram_21_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_21_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_21_taken <= in_uops_2_taken;
      fb_uop_ram_21_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_21_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_63) begin
      fb_uop_ram_21_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_21_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_21_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_21_debug_pc <= _pc_T_7;
      fb_uop_ram_21_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_21_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_21_taken <= in_uops_1_taken;
      fb_uop_ram_21_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_21_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_30) begin
      fb_uop_ram_21_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_21_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_21_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_21_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_21_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_21_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_21_taken <= in_uops_0_taken;
      fb_uop_ram_21_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_21_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_261 | _GEN_228 | _GEN_195 | _GEN_162 | _GEN_129 | _GEN_96 | _GEN_63 | _GEN_30) begin
      fb_uop_ram_21_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_21_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_21_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_21_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_21_edge_inst <= ~(_GEN_261 | _GEN_228 | _GEN_195) & (_GEN_162 ? io_enq_bits_edge_inst_1 : ~(_GEN_129 | _GEN_96 | _GEN_63) & (_GEN_30 ? io_enq_bits_edge_inst_0 : fb_uop_ram_21_edge_inst));
    if (_GEN_262) begin
      fb_uop_ram_22_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_22_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_22_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_22_debug_pc <= _pc_T_31;
      fb_uop_ram_22_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_22_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_22_taken <= in_uops_7_taken;
      fb_uop_ram_22_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_22_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_229) begin
      fb_uop_ram_22_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_22_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_22_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_22_debug_pc <= _pc_T_27;
      fb_uop_ram_22_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_22_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_22_taken <= in_uops_6_taken;
      fb_uop_ram_22_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_22_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_196) begin
      fb_uop_ram_22_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_22_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_22_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_22_debug_pc <= _pc_T_23;
      fb_uop_ram_22_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_22_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_22_taken <= in_uops_5_taken;
      fb_uop_ram_22_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_22_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_163) begin
      fb_uop_ram_22_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_22_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_22_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_22_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_22_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_22_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_22_taken <= in_uops_4_taken;
      fb_uop_ram_22_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_22_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_130) begin
      fb_uop_ram_22_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_22_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_22_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_22_debug_pc <= _pc_T_15;
      fb_uop_ram_22_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_22_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_22_taken <= in_uops_3_taken;
      fb_uop_ram_22_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_22_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_97) begin
      fb_uop_ram_22_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_22_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_22_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_22_debug_pc <= _pc_T_11;
      fb_uop_ram_22_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_22_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_22_taken <= in_uops_2_taken;
      fb_uop_ram_22_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_22_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_64) begin
      fb_uop_ram_22_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_22_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_22_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_22_debug_pc <= _pc_T_7;
      fb_uop_ram_22_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_22_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_22_taken <= in_uops_1_taken;
      fb_uop_ram_22_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_22_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_31) begin
      fb_uop_ram_22_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_22_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_22_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_22_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_22_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_22_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_22_taken <= in_uops_0_taken;
      fb_uop_ram_22_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_22_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_262 | _GEN_229 | _GEN_196 | _GEN_163 | _GEN_130 | _GEN_97 | _GEN_64 | _GEN_31) begin
      fb_uop_ram_22_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_22_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_22_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_22_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_22_edge_inst <= ~(_GEN_262 | _GEN_229 | _GEN_196) & (_GEN_163 ? io_enq_bits_edge_inst_1 : ~(_GEN_130 | _GEN_97 | _GEN_64) & (_GEN_31 ? io_enq_bits_edge_inst_0 : fb_uop_ram_22_edge_inst));
    if (_GEN_263) begin
      fb_uop_ram_23_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_23_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_23_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_23_debug_pc <= _pc_T_31;
      fb_uop_ram_23_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_23_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_23_taken <= in_uops_7_taken;
      fb_uop_ram_23_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_23_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_230) begin
      fb_uop_ram_23_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_23_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_23_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_23_debug_pc <= _pc_T_27;
      fb_uop_ram_23_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_23_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_23_taken <= in_uops_6_taken;
      fb_uop_ram_23_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_23_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_197) begin
      fb_uop_ram_23_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_23_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_23_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_23_debug_pc <= _pc_T_23;
      fb_uop_ram_23_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_23_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_23_taken <= in_uops_5_taken;
      fb_uop_ram_23_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_23_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_164) begin
      fb_uop_ram_23_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_23_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_23_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_23_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_23_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_23_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_23_taken <= in_uops_4_taken;
      fb_uop_ram_23_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_23_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_131) begin
      fb_uop_ram_23_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_23_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_23_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_23_debug_pc <= _pc_T_15;
      fb_uop_ram_23_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_23_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_23_taken <= in_uops_3_taken;
      fb_uop_ram_23_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_23_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_98) begin
      fb_uop_ram_23_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_23_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_23_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_23_debug_pc <= _pc_T_11;
      fb_uop_ram_23_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_23_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_23_taken <= in_uops_2_taken;
      fb_uop_ram_23_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_23_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_65) begin
      fb_uop_ram_23_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_23_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_23_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_23_debug_pc <= _pc_T_7;
      fb_uop_ram_23_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_23_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_23_taken <= in_uops_1_taken;
      fb_uop_ram_23_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_23_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_32) begin
      fb_uop_ram_23_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_23_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_23_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_23_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_23_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_23_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_23_taken <= in_uops_0_taken;
      fb_uop_ram_23_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_23_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_263 | _GEN_230 | _GEN_197 | _GEN_164 | _GEN_131 | _GEN_98 | _GEN_65 | _GEN_32) begin
      fb_uop_ram_23_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_23_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_23_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_23_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_23_edge_inst <= ~(_GEN_263 | _GEN_230 | _GEN_197) & (_GEN_164 ? io_enq_bits_edge_inst_1 : ~(_GEN_131 | _GEN_98 | _GEN_65) & (_GEN_32 ? io_enq_bits_edge_inst_0 : fb_uop_ram_23_edge_inst));
    if (_GEN_264) begin
      fb_uop_ram_24_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_24_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_24_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_24_debug_pc <= _pc_T_31;
      fb_uop_ram_24_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_24_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_24_taken <= in_uops_7_taken;
      fb_uop_ram_24_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_24_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_231) begin
      fb_uop_ram_24_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_24_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_24_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_24_debug_pc <= _pc_T_27;
      fb_uop_ram_24_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_24_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_24_taken <= in_uops_6_taken;
      fb_uop_ram_24_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_24_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_198) begin
      fb_uop_ram_24_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_24_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_24_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_24_debug_pc <= _pc_T_23;
      fb_uop_ram_24_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_24_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_24_taken <= in_uops_5_taken;
      fb_uop_ram_24_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_24_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_165) begin
      fb_uop_ram_24_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_24_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_24_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_24_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_24_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_24_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_24_taken <= in_uops_4_taken;
      fb_uop_ram_24_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_24_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_132) begin
      fb_uop_ram_24_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_24_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_24_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_24_debug_pc <= _pc_T_15;
      fb_uop_ram_24_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_24_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_24_taken <= in_uops_3_taken;
      fb_uop_ram_24_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_24_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_99) begin
      fb_uop_ram_24_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_24_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_24_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_24_debug_pc <= _pc_T_11;
      fb_uop_ram_24_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_24_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_24_taken <= in_uops_2_taken;
      fb_uop_ram_24_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_24_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_66) begin
      fb_uop_ram_24_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_24_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_24_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_24_debug_pc <= _pc_T_7;
      fb_uop_ram_24_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_24_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_24_taken <= in_uops_1_taken;
      fb_uop_ram_24_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_24_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_33) begin
      fb_uop_ram_24_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_24_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_24_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_24_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_24_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_24_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_24_taken <= in_uops_0_taken;
      fb_uop_ram_24_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_24_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_264 | _GEN_231 | _GEN_198 | _GEN_165 | _GEN_132 | _GEN_99 | _GEN_66 | _GEN_33) begin
      fb_uop_ram_24_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_24_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_24_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_24_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_24_edge_inst <= ~(_GEN_264 | _GEN_231 | _GEN_198) & (_GEN_165 ? io_enq_bits_edge_inst_1 : ~(_GEN_132 | _GEN_99 | _GEN_66) & (_GEN_33 ? io_enq_bits_edge_inst_0 : fb_uop_ram_24_edge_inst));
    if (_GEN_265) begin
      fb_uop_ram_25_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_25_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_25_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_25_debug_pc <= _pc_T_31;
      fb_uop_ram_25_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_25_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_25_taken <= in_uops_7_taken;
      fb_uop_ram_25_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_25_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_232) begin
      fb_uop_ram_25_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_25_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_25_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_25_debug_pc <= _pc_T_27;
      fb_uop_ram_25_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_25_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_25_taken <= in_uops_6_taken;
      fb_uop_ram_25_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_25_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_199) begin
      fb_uop_ram_25_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_25_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_25_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_25_debug_pc <= _pc_T_23;
      fb_uop_ram_25_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_25_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_25_taken <= in_uops_5_taken;
      fb_uop_ram_25_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_25_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_166) begin
      fb_uop_ram_25_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_25_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_25_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_25_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_25_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_25_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_25_taken <= in_uops_4_taken;
      fb_uop_ram_25_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_25_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_133) begin
      fb_uop_ram_25_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_25_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_25_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_25_debug_pc <= _pc_T_15;
      fb_uop_ram_25_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_25_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_25_taken <= in_uops_3_taken;
      fb_uop_ram_25_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_25_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_100) begin
      fb_uop_ram_25_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_25_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_25_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_25_debug_pc <= _pc_T_11;
      fb_uop_ram_25_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_25_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_25_taken <= in_uops_2_taken;
      fb_uop_ram_25_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_25_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_67) begin
      fb_uop_ram_25_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_25_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_25_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_25_debug_pc <= _pc_T_7;
      fb_uop_ram_25_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_25_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_25_taken <= in_uops_1_taken;
      fb_uop_ram_25_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_25_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_34) begin
      fb_uop_ram_25_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_25_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_25_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_25_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_25_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_25_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_25_taken <= in_uops_0_taken;
      fb_uop_ram_25_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_25_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_265 | _GEN_232 | _GEN_199 | _GEN_166 | _GEN_133 | _GEN_100 | _GEN_67 | _GEN_34) begin
      fb_uop_ram_25_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_25_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_25_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_25_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_25_edge_inst <= ~(_GEN_265 | _GEN_232 | _GEN_199) & (_GEN_166 ? io_enq_bits_edge_inst_1 : ~(_GEN_133 | _GEN_100 | _GEN_67) & (_GEN_34 ? io_enq_bits_edge_inst_0 : fb_uop_ram_25_edge_inst));
    if (_GEN_266) begin
      fb_uop_ram_26_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_26_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_26_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_26_debug_pc <= _pc_T_31;
      fb_uop_ram_26_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_26_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_26_taken <= in_uops_7_taken;
      fb_uop_ram_26_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_26_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_233) begin
      fb_uop_ram_26_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_26_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_26_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_26_debug_pc <= _pc_T_27;
      fb_uop_ram_26_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_26_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_26_taken <= in_uops_6_taken;
      fb_uop_ram_26_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_26_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_200) begin
      fb_uop_ram_26_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_26_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_26_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_26_debug_pc <= _pc_T_23;
      fb_uop_ram_26_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_26_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_26_taken <= in_uops_5_taken;
      fb_uop_ram_26_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_26_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_167) begin
      fb_uop_ram_26_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_26_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_26_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_26_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_26_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_26_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_26_taken <= in_uops_4_taken;
      fb_uop_ram_26_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_26_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_134) begin
      fb_uop_ram_26_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_26_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_26_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_26_debug_pc <= _pc_T_15;
      fb_uop_ram_26_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_26_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_26_taken <= in_uops_3_taken;
      fb_uop_ram_26_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_26_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_101) begin
      fb_uop_ram_26_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_26_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_26_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_26_debug_pc <= _pc_T_11;
      fb_uop_ram_26_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_26_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_26_taken <= in_uops_2_taken;
      fb_uop_ram_26_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_26_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_68) begin
      fb_uop_ram_26_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_26_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_26_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_26_debug_pc <= _pc_T_7;
      fb_uop_ram_26_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_26_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_26_taken <= in_uops_1_taken;
      fb_uop_ram_26_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_26_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_35) begin
      fb_uop_ram_26_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_26_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_26_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_26_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_26_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_26_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_26_taken <= in_uops_0_taken;
      fb_uop_ram_26_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_26_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_266 | _GEN_233 | _GEN_200 | _GEN_167 | _GEN_134 | _GEN_101 | _GEN_68 | _GEN_35) begin
      fb_uop_ram_26_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_26_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_26_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_26_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_26_edge_inst <= ~(_GEN_266 | _GEN_233 | _GEN_200) & (_GEN_167 ? io_enq_bits_edge_inst_1 : ~(_GEN_134 | _GEN_101 | _GEN_68) & (_GEN_35 ? io_enq_bits_edge_inst_0 : fb_uop_ram_26_edge_inst));
    if (_GEN_267) begin
      fb_uop_ram_27_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_27_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_27_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_27_debug_pc <= _pc_T_31;
      fb_uop_ram_27_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_27_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_27_taken <= in_uops_7_taken;
      fb_uop_ram_27_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_27_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_234) begin
      fb_uop_ram_27_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_27_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_27_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_27_debug_pc <= _pc_T_27;
      fb_uop_ram_27_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_27_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_27_taken <= in_uops_6_taken;
      fb_uop_ram_27_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_27_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_201) begin
      fb_uop_ram_27_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_27_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_27_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_27_debug_pc <= _pc_T_23;
      fb_uop_ram_27_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_27_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_27_taken <= in_uops_5_taken;
      fb_uop_ram_27_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_27_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_168) begin
      fb_uop_ram_27_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_27_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_27_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_27_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_27_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_27_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_27_taken <= in_uops_4_taken;
      fb_uop_ram_27_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_27_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_135) begin
      fb_uop_ram_27_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_27_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_27_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_27_debug_pc <= _pc_T_15;
      fb_uop_ram_27_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_27_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_27_taken <= in_uops_3_taken;
      fb_uop_ram_27_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_27_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_102) begin
      fb_uop_ram_27_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_27_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_27_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_27_debug_pc <= _pc_T_11;
      fb_uop_ram_27_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_27_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_27_taken <= in_uops_2_taken;
      fb_uop_ram_27_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_27_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_69) begin
      fb_uop_ram_27_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_27_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_27_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_27_debug_pc <= _pc_T_7;
      fb_uop_ram_27_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_27_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_27_taken <= in_uops_1_taken;
      fb_uop_ram_27_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_27_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_36) begin
      fb_uop_ram_27_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_27_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_27_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_27_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_27_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_27_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_27_taken <= in_uops_0_taken;
      fb_uop_ram_27_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_27_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_267 | _GEN_234 | _GEN_201 | _GEN_168 | _GEN_135 | _GEN_102 | _GEN_69 | _GEN_36) begin
      fb_uop_ram_27_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_27_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_27_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_27_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_27_edge_inst <= ~(_GEN_267 | _GEN_234 | _GEN_201) & (_GEN_168 ? io_enq_bits_edge_inst_1 : ~(_GEN_135 | _GEN_102 | _GEN_69) & (_GEN_36 ? io_enq_bits_edge_inst_0 : fb_uop_ram_27_edge_inst));
    if (_GEN_268) begin
      fb_uop_ram_28_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_28_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_28_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_28_debug_pc <= _pc_T_31;
      fb_uop_ram_28_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_28_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_28_taken <= in_uops_7_taken;
      fb_uop_ram_28_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_28_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_235) begin
      fb_uop_ram_28_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_28_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_28_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_28_debug_pc <= _pc_T_27;
      fb_uop_ram_28_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_28_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_28_taken <= in_uops_6_taken;
      fb_uop_ram_28_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_28_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_202) begin
      fb_uop_ram_28_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_28_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_28_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_28_debug_pc <= _pc_T_23;
      fb_uop_ram_28_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_28_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_28_taken <= in_uops_5_taken;
      fb_uop_ram_28_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_28_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_169) begin
      fb_uop_ram_28_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_28_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_28_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_28_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_28_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_28_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_28_taken <= in_uops_4_taken;
      fb_uop_ram_28_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_28_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_136) begin
      fb_uop_ram_28_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_28_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_28_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_28_debug_pc <= _pc_T_15;
      fb_uop_ram_28_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_28_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_28_taken <= in_uops_3_taken;
      fb_uop_ram_28_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_28_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_103) begin
      fb_uop_ram_28_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_28_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_28_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_28_debug_pc <= _pc_T_11;
      fb_uop_ram_28_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_28_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_28_taken <= in_uops_2_taken;
      fb_uop_ram_28_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_28_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_70) begin
      fb_uop_ram_28_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_28_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_28_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_28_debug_pc <= _pc_T_7;
      fb_uop_ram_28_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_28_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_28_taken <= in_uops_1_taken;
      fb_uop_ram_28_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_28_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_37) begin
      fb_uop_ram_28_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_28_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_28_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_28_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_28_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_28_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_28_taken <= in_uops_0_taken;
      fb_uop_ram_28_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_28_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_268 | _GEN_235 | _GEN_202 | _GEN_169 | _GEN_136 | _GEN_103 | _GEN_70 | _GEN_37) begin
      fb_uop_ram_28_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_28_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_28_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_28_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_28_edge_inst <= ~(_GEN_268 | _GEN_235 | _GEN_202) & (_GEN_169 ? io_enq_bits_edge_inst_1 : ~(_GEN_136 | _GEN_103 | _GEN_70) & (_GEN_37 ? io_enq_bits_edge_inst_0 : fb_uop_ram_28_edge_inst));
    if (_GEN_269) begin
      fb_uop_ram_29_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_29_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_29_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_29_debug_pc <= _pc_T_31;
      fb_uop_ram_29_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_29_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_29_taken <= in_uops_7_taken;
      fb_uop_ram_29_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_29_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_236) begin
      fb_uop_ram_29_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_29_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_29_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_29_debug_pc <= _pc_T_27;
      fb_uop_ram_29_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_29_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_29_taken <= in_uops_6_taken;
      fb_uop_ram_29_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_29_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_203) begin
      fb_uop_ram_29_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_29_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_29_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_29_debug_pc <= _pc_T_23;
      fb_uop_ram_29_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_29_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_29_taken <= in_uops_5_taken;
      fb_uop_ram_29_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_29_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_170) begin
      fb_uop_ram_29_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_29_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_29_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_29_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_29_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_29_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_29_taken <= in_uops_4_taken;
      fb_uop_ram_29_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_29_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_137) begin
      fb_uop_ram_29_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_29_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_29_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_29_debug_pc <= _pc_T_15;
      fb_uop_ram_29_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_29_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_29_taken <= in_uops_3_taken;
      fb_uop_ram_29_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_29_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_104) begin
      fb_uop_ram_29_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_29_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_29_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_29_debug_pc <= _pc_T_11;
      fb_uop_ram_29_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_29_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_29_taken <= in_uops_2_taken;
      fb_uop_ram_29_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_29_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_71) begin
      fb_uop_ram_29_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_29_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_29_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_29_debug_pc <= _pc_T_7;
      fb_uop_ram_29_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_29_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_29_taken <= in_uops_1_taken;
      fb_uop_ram_29_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_29_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_38) begin
      fb_uop_ram_29_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_29_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_29_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_29_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_29_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_29_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_29_taken <= in_uops_0_taken;
      fb_uop_ram_29_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_29_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_269 | _GEN_236 | _GEN_203 | _GEN_170 | _GEN_137 | _GEN_104 | _GEN_71 | _GEN_38) begin
      fb_uop_ram_29_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_29_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_29_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_29_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_29_edge_inst <= ~(_GEN_269 | _GEN_236 | _GEN_203) & (_GEN_170 ? io_enq_bits_edge_inst_1 : ~(_GEN_137 | _GEN_104 | _GEN_71) & (_GEN_38 ? io_enq_bits_edge_inst_0 : fb_uop_ram_29_edge_inst));
    if (_GEN_270) begin
      fb_uop_ram_30_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_30_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_30_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_30_debug_pc <= _pc_T_31;
      fb_uop_ram_30_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_30_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_30_taken <= in_uops_7_taken;
      fb_uop_ram_30_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_30_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_237) begin
      fb_uop_ram_30_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_30_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_30_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_30_debug_pc <= _pc_T_27;
      fb_uop_ram_30_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_30_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_30_taken <= in_uops_6_taken;
      fb_uop_ram_30_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_30_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_204) begin
      fb_uop_ram_30_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_30_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_30_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_30_debug_pc <= _pc_T_23;
      fb_uop_ram_30_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_30_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_30_taken <= in_uops_5_taken;
      fb_uop_ram_30_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_30_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_171) begin
      fb_uop_ram_30_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_30_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_30_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_30_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_30_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_30_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_30_taken <= in_uops_4_taken;
      fb_uop_ram_30_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_30_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_138) begin
      fb_uop_ram_30_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_30_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_30_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_30_debug_pc <= _pc_T_15;
      fb_uop_ram_30_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_30_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_30_taken <= in_uops_3_taken;
      fb_uop_ram_30_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_30_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_105) begin
      fb_uop_ram_30_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_30_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_30_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_30_debug_pc <= _pc_T_11;
      fb_uop_ram_30_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_30_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_30_taken <= in_uops_2_taken;
      fb_uop_ram_30_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_30_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_72) begin
      fb_uop_ram_30_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_30_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_30_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_30_debug_pc <= _pc_T_7;
      fb_uop_ram_30_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_30_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_30_taken <= in_uops_1_taken;
      fb_uop_ram_30_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_30_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_39) begin
      fb_uop_ram_30_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_30_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_30_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_30_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_30_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_30_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_30_taken <= in_uops_0_taken;
      fb_uop_ram_30_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_30_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_270 | _GEN_237 | _GEN_204 | _GEN_171 | _GEN_138 | _GEN_105 | _GEN_72 | _GEN_39) begin
      fb_uop_ram_30_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_30_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_30_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_30_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_30_edge_inst <= ~(_GEN_270 | _GEN_237 | _GEN_204) & (_GEN_171 ? io_enq_bits_edge_inst_1 : ~(_GEN_138 | _GEN_105 | _GEN_72) & (_GEN_39 ? io_enq_bits_edge_inst_0 : fb_uop_ram_30_edge_inst));
    if (_GEN_271) begin
      fb_uop_ram_31_inst <= io_enq_bits_exp_insts_7;
      fb_uop_ram_31_debug_inst <= io_enq_bits_insts_7;
      fb_uop_ram_31_is_rvc <= in_uops_7_is_rvc;
      fb_uop_ram_31_debug_pc <= _pc_T_31;
      fb_uop_ram_31_is_sfb <= io_enq_bits_shadowed_mask_7;
      fb_uop_ram_31_pc_lob <= _pc_T_31[5:0];
      fb_uop_ram_31_taken <= in_uops_7_taken;
      fb_uop_ram_31_bp_debug_if <= io_enq_bits_bp_debug_if_oh_7;
      fb_uop_ram_31_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_7;
    end
    else if (_GEN_238) begin
      fb_uop_ram_31_inst <= io_enq_bits_exp_insts_6;
      fb_uop_ram_31_debug_inst <= io_enq_bits_insts_6;
      fb_uop_ram_31_is_rvc <= in_uops_6_is_rvc;
      fb_uop_ram_31_debug_pc <= _pc_T_27;
      fb_uop_ram_31_is_sfb <= io_enq_bits_shadowed_mask_6;
      fb_uop_ram_31_pc_lob <= _pc_T_27[5:0];
      fb_uop_ram_31_taken <= in_uops_6_taken;
      fb_uop_ram_31_bp_debug_if <= io_enq_bits_bp_debug_if_oh_6;
      fb_uop_ram_31_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_6;
    end
    else if (_GEN_205) begin
      fb_uop_ram_31_inst <= io_enq_bits_exp_insts_5;
      fb_uop_ram_31_debug_inst <= io_enq_bits_insts_5;
      fb_uop_ram_31_is_rvc <= in_uops_5_is_rvc;
      fb_uop_ram_31_debug_pc <= _pc_T_23;
      fb_uop_ram_31_is_sfb <= io_enq_bits_shadowed_mask_5;
      fb_uop_ram_31_pc_lob <= _pc_T_23[5:0];
      fb_uop_ram_31_taken <= in_uops_5_taken;
      fb_uop_ram_31_bp_debug_if <= io_enq_bits_bp_debug_if_oh_5;
      fb_uop_ram_31_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_5;
    end
    else if (_GEN_172) begin
      fb_uop_ram_31_inst <= io_enq_bits_exp_insts_4;
      fb_uop_ram_31_debug_inst <= io_enq_bits_insts_4;
      fb_uop_ram_31_is_rvc <= in_uops_4_is_rvc;
      fb_uop_ram_31_debug_pc <= in_uops_4_debug_pc;
      fb_uop_ram_31_is_sfb <= io_enq_bits_shadowed_mask_4;
      fb_uop_ram_31_pc_lob <= in_uops_4_pc_lob;
      fb_uop_ram_31_taken <= in_uops_4_taken;
      fb_uop_ram_31_bp_debug_if <= io_enq_bits_bp_debug_if_oh_4;
      fb_uop_ram_31_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_4;
    end
    else if (_GEN_139) begin
      fb_uop_ram_31_inst <= io_enq_bits_exp_insts_3;
      fb_uop_ram_31_debug_inst <= io_enq_bits_insts_3;
      fb_uop_ram_31_is_rvc <= in_uops_3_is_rvc;
      fb_uop_ram_31_debug_pc <= _pc_T_15;
      fb_uop_ram_31_is_sfb <= io_enq_bits_shadowed_mask_3;
      fb_uop_ram_31_pc_lob <= _pc_T_15[5:0];
      fb_uop_ram_31_taken <= in_uops_3_taken;
      fb_uop_ram_31_bp_debug_if <= io_enq_bits_bp_debug_if_oh_3;
      fb_uop_ram_31_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_3;
    end
    else if (_GEN_106) begin
      fb_uop_ram_31_inst <= io_enq_bits_exp_insts_2;
      fb_uop_ram_31_debug_inst <= io_enq_bits_insts_2;
      fb_uop_ram_31_is_rvc <= in_uops_2_is_rvc;
      fb_uop_ram_31_debug_pc <= _pc_T_11;
      fb_uop_ram_31_is_sfb <= io_enq_bits_shadowed_mask_2;
      fb_uop_ram_31_pc_lob <= _pc_T_11[5:0];
      fb_uop_ram_31_taken <= in_uops_2_taken;
      fb_uop_ram_31_bp_debug_if <= io_enq_bits_bp_debug_if_oh_2;
      fb_uop_ram_31_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_2;
    end
    else if (_GEN_73) begin
      fb_uop_ram_31_inst <= io_enq_bits_exp_insts_1;
      fb_uop_ram_31_debug_inst <= io_enq_bits_insts_1;
      fb_uop_ram_31_is_rvc <= in_uops_1_is_rvc;
      fb_uop_ram_31_debug_pc <= _pc_T_7;
      fb_uop_ram_31_is_sfb <= io_enq_bits_shadowed_mask_1;
      fb_uop_ram_31_pc_lob <= _pc_T_7[5:0];
      fb_uop_ram_31_taken <= in_uops_1_taken;
      fb_uop_ram_31_bp_debug_if <= io_enq_bits_bp_debug_if_oh_1;
      fb_uop_ram_31_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_1;
    end
    else if (_GEN_40) begin
      fb_uop_ram_31_inst <= io_enq_bits_exp_insts_0;
      fb_uop_ram_31_debug_inst <= io_enq_bits_insts_0;
      fb_uop_ram_31_is_rvc <= in_uops_0_is_rvc;
      fb_uop_ram_31_debug_pc <= in_uops_0_debug_pc;
      fb_uop_ram_31_is_sfb <= io_enq_bits_shadowed_mask_0;
      fb_uop_ram_31_pc_lob <= in_uops_0_pc_lob;
      fb_uop_ram_31_taken <= in_uops_0_taken;
      fb_uop_ram_31_bp_debug_if <= io_enq_bits_bp_debug_if_oh_0;
      fb_uop_ram_31_bp_xcpt_if <= io_enq_bits_bp_xcpt_if_oh_0;
    end
    if (_GEN_271 | _GEN_238 | _GEN_205 | _GEN_172 | _GEN_139 | _GEN_106 | _GEN_73 | _GEN_40) begin
      fb_uop_ram_31_ftq_idx <= io_enq_bits_ftq_idx;
      fb_uop_ram_31_xcpt_pf_if <= io_enq_bits_xcpt_pf_if;
      fb_uop_ram_31_xcpt_ae_if <= io_enq_bits_xcpt_ae_if;
      fb_uop_ram_31_debug_fsrc <= io_enq_bits_fsrc;
    end
    fb_uop_ram_31_edge_inst <= ~(_GEN_271 | _GEN_238 | _GEN_205) & (_GEN_172 ? io_enq_bits_edge_inst_1 : ~(_GEN_139 | _GEN_106 | _GEN_73) & (_GEN_40 ? io_enq_bits_edge_inst_0 : fb_uop_ram_31_edge_inst));
    if (reset) begin
      head <= 8'h1;
      tail <= 32'h1;
      maybe_full <= 1'h0;
    end
    else begin
      if (io_clear) begin
        head <= 8'h1;
        tail <= 32'h1;
      end
      else begin
        if (do_deq)
          head <= {head[6:0], head[7]};
        if (~_do_enq_T_1) begin
          if (in_mask_7)
            tail <= {enq_idxs_7[30:0], enq_idxs_7[31]};
          else if (in_mask_6)
            tail <= _GEN_7;
          else if (in_mask_5)
            tail <= _GEN_6;
          else if (in_mask_4)
            tail <= _GEN_5;
          else if (in_mask_3)
            tail <= _GEN_4;
          else if (in_mask_2)
            tail <= _GEN_3;
          else if (in_mask_1)
            tail <= _GEN_2;
          else if (in_mask_0)
            tail <= _GEN_1;
        end
      end
      maybe_full <= ~(io_clear | do_deq) & (~_do_enq_T_1 & (in_mask_0 | in_mask_1 | in_mask_2 | in_mask_3 | in_mask_4 | in_mask_5 | in_mask_6 | in_mask_7) | maybe_full);
    end
  end // always @(posedge)
  assign io_enq_ready = ~_do_enq_T_1;
  assign io_deq_valid = _deq_valids_T_10 != 4'hF;
  assign io_deq_bits_uops_0_valid = ~reset & _deq_valids_T_11[0];
  assign io_deq_bits_uops_0_bits_inst = (head[0] ? fb_uop_ram_0_inst : 32'h0) | (head[1] ? fb_uop_ram_4_inst : 32'h0) | (head[2] ? fb_uop_ram_8_inst : 32'h0) | (head[3] ? fb_uop_ram_12_inst : 32'h0) | (head[4] ? fb_uop_ram_16_inst : 32'h0) | (head[5] ? fb_uop_ram_20_inst : 32'h0) | (head[6] ? fb_uop_ram_24_inst : 32'h0) | (head[7] ? fb_uop_ram_28_inst : 32'h0);
  assign io_deq_bits_uops_0_bits_debug_inst = (head[0] ? fb_uop_ram_0_debug_inst : 32'h0) | (head[1] ? fb_uop_ram_4_debug_inst : 32'h0) | (head[2] ? fb_uop_ram_8_debug_inst : 32'h0) | (head[3] ? fb_uop_ram_12_debug_inst : 32'h0) | (head[4] ? fb_uop_ram_16_debug_inst : 32'h0) | (head[5] ? fb_uop_ram_20_debug_inst : 32'h0) | (head[6] ? fb_uop_ram_24_debug_inst : 32'h0) | (head[7] ? fb_uop_ram_28_debug_inst : 32'h0);
  assign io_deq_bits_uops_0_bits_is_rvc = head[0] & fb_uop_ram_0_is_rvc | head[1] & fb_uop_ram_4_is_rvc | head[2] & fb_uop_ram_8_is_rvc | head[3] & fb_uop_ram_12_is_rvc | head[4] & fb_uop_ram_16_is_rvc | head[5] & fb_uop_ram_20_is_rvc | head[6] & fb_uop_ram_24_is_rvc | head[7] & fb_uop_ram_28_is_rvc;
  assign io_deq_bits_uops_0_bits_debug_pc = (head[0] ? fb_uop_ram_0_debug_pc : 40'h0) | (head[1] ? fb_uop_ram_4_debug_pc : 40'h0) | (head[2] ? fb_uop_ram_8_debug_pc : 40'h0) | (head[3] ? fb_uop_ram_12_debug_pc : 40'h0) | (head[4] ? fb_uop_ram_16_debug_pc : 40'h0) | (head[5] ? fb_uop_ram_20_debug_pc : 40'h0) | (head[6] ? fb_uop_ram_24_debug_pc : 40'h0) | (head[7] ? fb_uop_ram_28_debug_pc : 40'h0);
  assign io_deq_bits_uops_0_bits_is_sfb = head[0] & fb_uop_ram_0_is_sfb | head[1] & fb_uop_ram_4_is_sfb | head[2] & fb_uop_ram_8_is_sfb | head[3] & fb_uop_ram_12_is_sfb | head[4] & fb_uop_ram_16_is_sfb | head[5] & fb_uop_ram_20_is_sfb | head[6] & fb_uop_ram_24_is_sfb | head[7] & fb_uop_ram_28_is_sfb;
  assign io_deq_bits_uops_0_bits_ftq_idx = (head[0] ? fb_uop_ram_0_ftq_idx : 6'h0) | (head[1] ? fb_uop_ram_4_ftq_idx : 6'h0) | (head[2] ? fb_uop_ram_8_ftq_idx : 6'h0) | (head[3] ? fb_uop_ram_12_ftq_idx : 6'h0) | (head[4] ? fb_uop_ram_16_ftq_idx : 6'h0) | (head[5] ? fb_uop_ram_20_ftq_idx : 6'h0) | (head[6] ? fb_uop_ram_24_ftq_idx : 6'h0) | (head[7] ? fb_uop_ram_28_ftq_idx : 6'h0);
  assign io_deq_bits_uops_0_bits_edge_inst = head[0] & fb_uop_ram_0_edge_inst | head[1] & fb_uop_ram_4_edge_inst | head[2] & fb_uop_ram_8_edge_inst | head[3] & fb_uop_ram_12_edge_inst | head[4] & fb_uop_ram_16_edge_inst | head[5] & fb_uop_ram_20_edge_inst | head[6] & fb_uop_ram_24_edge_inst | head[7] & fb_uop_ram_28_edge_inst;
  assign io_deq_bits_uops_0_bits_pc_lob = (head[0] ? fb_uop_ram_0_pc_lob : 6'h0) | (head[1] ? fb_uop_ram_4_pc_lob : 6'h0) | (head[2] ? fb_uop_ram_8_pc_lob : 6'h0) | (head[3] ? fb_uop_ram_12_pc_lob : 6'h0) | (head[4] ? fb_uop_ram_16_pc_lob : 6'h0) | (head[5] ? fb_uop_ram_20_pc_lob : 6'h0) | (head[6] ? fb_uop_ram_24_pc_lob : 6'h0) | (head[7] ? fb_uop_ram_28_pc_lob : 6'h0);
  assign io_deq_bits_uops_0_bits_taken = head[0] & fb_uop_ram_0_taken | head[1] & fb_uop_ram_4_taken | head[2] & fb_uop_ram_8_taken | head[3] & fb_uop_ram_12_taken | head[4] & fb_uop_ram_16_taken | head[5] & fb_uop_ram_20_taken | head[6] & fb_uop_ram_24_taken | head[7] & fb_uop_ram_28_taken;
  assign io_deq_bits_uops_0_bits_xcpt_pf_if = head[0] & fb_uop_ram_0_xcpt_pf_if | head[1] & fb_uop_ram_4_xcpt_pf_if | head[2] & fb_uop_ram_8_xcpt_pf_if | head[3] & fb_uop_ram_12_xcpt_pf_if | head[4] & fb_uop_ram_16_xcpt_pf_if | head[5] & fb_uop_ram_20_xcpt_pf_if | head[6] & fb_uop_ram_24_xcpt_pf_if | head[7] & fb_uop_ram_28_xcpt_pf_if;
  assign io_deq_bits_uops_0_bits_xcpt_ae_if = head[0] & fb_uop_ram_0_xcpt_ae_if | head[1] & fb_uop_ram_4_xcpt_ae_if | head[2] & fb_uop_ram_8_xcpt_ae_if | head[3] & fb_uop_ram_12_xcpt_ae_if | head[4] & fb_uop_ram_16_xcpt_ae_if | head[5] & fb_uop_ram_20_xcpt_ae_if | head[6] & fb_uop_ram_24_xcpt_ae_if | head[7] & fb_uop_ram_28_xcpt_ae_if;
  assign io_deq_bits_uops_0_bits_bp_debug_if = head[0] & fb_uop_ram_0_bp_debug_if | head[1] & fb_uop_ram_4_bp_debug_if | head[2] & fb_uop_ram_8_bp_debug_if | head[3] & fb_uop_ram_12_bp_debug_if | head[4] & fb_uop_ram_16_bp_debug_if | head[5] & fb_uop_ram_20_bp_debug_if | head[6] & fb_uop_ram_24_bp_debug_if | head[7] & fb_uop_ram_28_bp_debug_if;
  assign io_deq_bits_uops_0_bits_bp_xcpt_if = head[0] & fb_uop_ram_0_bp_xcpt_if | head[1] & fb_uop_ram_4_bp_xcpt_if | head[2] & fb_uop_ram_8_bp_xcpt_if | head[3] & fb_uop_ram_12_bp_xcpt_if | head[4] & fb_uop_ram_16_bp_xcpt_if | head[5] & fb_uop_ram_20_bp_xcpt_if | head[6] & fb_uop_ram_24_bp_xcpt_if | head[7] & fb_uop_ram_28_bp_xcpt_if;
  assign io_deq_bits_uops_0_bits_debug_fsrc = (head[0] ? fb_uop_ram_0_debug_fsrc : 2'h0) | (head[1] ? fb_uop_ram_4_debug_fsrc : 2'h0) | (head[2] ? fb_uop_ram_8_debug_fsrc : 2'h0) | (head[3] ? fb_uop_ram_12_debug_fsrc : 2'h0) | (head[4] ? fb_uop_ram_16_debug_fsrc : 2'h0) | (head[5] ? fb_uop_ram_20_debug_fsrc : 2'h0) | (head[6] ? fb_uop_ram_24_debug_fsrc : 2'h0) | (head[7] ? fb_uop_ram_28_debug_fsrc : 2'h0);
  assign io_deq_bits_uops_1_valid = ~reset & _deq_valids_T_11[1];
  assign io_deq_bits_uops_1_bits_inst = (head[0] ? fb_uop_ram_1_inst : 32'h0) | (head[1] ? fb_uop_ram_5_inst : 32'h0) | (head[2] ? fb_uop_ram_9_inst : 32'h0) | (head[3] ? fb_uop_ram_13_inst : 32'h0) | (head[4] ? fb_uop_ram_17_inst : 32'h0) | (head[5] ? fb_uop_ram_21_inst : 32'h0) | (head[6] ? fb_uop_ram_25_inst : 32'h0) | (head[7] ? fb_uop_ram_29_inst : 32'h0);
  assign io_deq_bits_uops_1_bits_debug_inst = (head[0] ? fb_uop_ram_1_debug_inst : 32'h0) | (head[1] ? fb_uop_ram_5_debug_inst : 32'h0) | (head[2] ? fb_uop_ram_9_debug_inst : 32'h0) | (head[3] ? fb_uop_ram_13_debug_inst : 32'h0) | (head[4] ? fb_uop_ram_17_debug_inst : 32'h0) | (head[5] ? fb_uop_ram_21_debug_inst : 32'h0) | (head[6] ? fb_uop_ram_25_debug_inst : 32'h0) | (head[7] ? fb_uop_ram_29_debug_inst : 32'h0);
  assign io_deq_bits_uops_1_bits_is_rvc = head[0] & fb_uop_ram_1_is_rvc | head[1] & fb_uop_ram_5_is_rvc | head[2] & fb_uop_ram_9_is_rvc | head[3] & fb_uop_ram_13_is_rvc | head[4] & fb_uop_ram_17_is_rvc | head[5] & fb_uop_ram_21_is_rvc | head[6] & fb_uop_ram_25_is_rvc | head[7] & fb_uop_ram_29_is_rvc;
  assign io_deq_bits_uops_1_bits_debug_pc = (head[0] ? fb_uop_ram_1_debug_pc : 40'h0) | (head[1] ? fb_uop_ram_5_debug_pc : 40'h0) | (head[2] ? fb_uop_ram_9_debug_pc : 40'h0) | (head[3] ? fb_uop_ram_13_debug_pc : 40'h0) | (head[4] ? fb_uop_ram_17_debug_pc : 40'h0) | (head[5] ? fb_uop_ram_21_debug_pc : 40'h0) | (head[6] ? fb_uop_ram_25_debug_pc : 40'h0) | (head[7] ? fb_uop_ram_29_debug_pc : 40'h0);
  assign io_deq_bits_uops_1_bits_is_sfb = head[0] & fb_uop_ram_1_is_sfb | head[1] & fb_uop_ram_5_is_sfb | head[2] & fb_uop_ram_9_is_sfb | head[3] & fb_uop_ram_13_is_sfb | head[4] & fb_uop_ram_17_is_sfb | head[5] & fb_uop_ram_21_is_sfb | head[6] & fb_uop_ram_25_is_sfb | head[7] & fb_uop_ram_29_is_sfb;
  assign io_deq_bits_uops_1_bits_ftq_idx = (head[0] ? fb_uop_ram_1_ftq_idx : 6'h0) | (head[1] ? fb_uop_ram_5_ftq_idx : 6'h0) | (head[2] ? fb_uop_ram_9_ftq_idx : 6'h0) | (head[3] ? fb_uop_ram_13_ftq_idx : 6'h0) | (head[4] ? fb_uop_ram_17_ftq_idx : 6'h0) | (head[5] ? fb_uop_ram_21_ftq_idx : 6'h0) | (head[6] ? fb_uop_ram_25_ftq_idx : 6'h0) | (head[7] ? fb_uop_ram_29_ftq_idx : 6'h0);
  assign io_deq_bits_uops_1_bits_edge_inst = head[0] & fb_uop_ram_1_edge_inst | head[1] & fb_uop_ram_5_edge_inst | head[2] & fb_uop_ram_9_edge_inst | head[3] & fb_uop_ram_13_edge_inst | head[4] & fb_uop_ram_17_edge_inst | head[5] & fb_uop_ram_21_edge_inst | head[6] & fb_uop_ram_25_edge_inst | head[7] & fb_uop_ram_29_edge_inst;
  assign io_deq_bits_uops_1_bits_pc_lob = (head[0] ? fb_uop_ram_1_pc_lob : 6'h0) | (head[1] ? fb_uop_ram_5_pc_lob : 6'h0) | (head[2] ? fb_uop_ram_9_pc_lob : 6'h0) | (head[3] ? fb_uop_ram_13_pc_lob : 6'h0) | (head[4] ? fb_uop_ram_17_pc_lob : 6'h0) | (head[5] ? fb_uop_ram_21_pc_lob : 6'h0) | (head[6] ? fb_uop_ram_25_pc_lob : 6'h0) | (head[7] ? fb_uop_ram_29_pc_lob : 6'h0);
  assign io_deq_bits_uops_1_bits_taken = head[0] & fb_uop_ram_1_taken | head[1] & fb_uop_ram_5_taken | head[2] & fb_uop_ram_9_taken | head[3] & fb_uop_ram_13_taken | head[4] & fb_uop_ram_17_taken | head[5] & fb_uop_ram_21_taken | head[6] & fb_uop_ram_25_taken | head[7] & fb_uop_ram_29_taken;
  assign io_deq_bits_uops_1_bits_xcpt_pf_if = head[0] & fb_uop_ram_1_xcpt_pf_if | head[1] & fb_uop_ram_5_xcpt_pf_if | head[2] & fb_uop_ram_9_xcpt_pf_if | head[3] & fb_uop_ram_13_xcpt_pf_if | head[4] & fb_uop_ram_17_xcpt_pf_if | head[5] & fb_uop_ram_21_xcpt_pf_if | head[6] & fb_uop_ram_25_xcpt_pf_if | head[7] & fb_uop_ram_29_xcpt_pf_if;
  assign io_deq_bits_uops_1_bits_xcpt_ae_if = head[0] & fb_uop_ram_1_xcpt_ae_if | head[1] & fb_uop_ram_5_xcpt_ae_if | head[2] & fb_uop_ram_9_xcpt_ae_if | head[3] & fb_uop_ram_13_xcpt_ae_if | head[4] & fb_uop_ram_17_xcpt_ae_if | head[5] & fb_uop_ram_21_xcpt_ae_if | head[6] & fb_uop_ram_25_xcpt_ae_if | head[7] & fb_uop_ram_29_xcpt_ae_if;
  assign io_deq_bits_uops_1_bits_bp_debug_if = head[0] & fb_uop_ram_1_bp_debug_if | head[1] & fb_uop_ram_5_bp_debug_if | head[2] & fb_uop_ram_9_bp_debug_if | head[3] & fb_uop_ram_13_bp_debug_if | head[4] & fb_uop_ram_17_bp_debug_if | head[5] & fb_uop_ram_21_bp_debug_if | head[6] & fb_uop_ram_25_bp_debug_if | head[7] & fb_uop_ram_29_bp_debug_if;
  assign io_deq_bits_uops_1_bits_bp_xcpt_if = head[0] & fb_uop_ram_1_bp_xcpt_if | head[1] & fb_uop_ram_5_bp_xcpt_if | head[2] & fb_uop_ram_9_bp_xcpt_if | head[3] & fb_uop_ram_13_bp_xcpt_if | head[4] & fb_uop_ram_17_bp_xcpt_if | head[5] & fb_uop_ram_21_bp_xcpt_if | head[6] & fb_uop_ram_25_bp_xcpt_if | head[7] & fb_uop_ram_29_bp_xcpt_if;
  assign io_deq_bits_uops_1_bits_debug_fsrc = (head[0] ? fb_uop_ram_1_debug_fsrc : 2'h0) | (head[1] ? fb_uop_ram_5_debug_fsrc : 2'h0) | (head[2] ? fb_uop_ram_9_debug_fsrc : 2'h0) | (head[3] ? fb_uop_ram_13_debug_fsrc : 2'h0) | (head[4] ? fb_uop_ram_17_debug_fsrc : 2'h0) | (head[5] ? fb_uop_ram_21_debug_fsrc : 2'h0) | (head[6] ? fb_uop_ram_25_debug_fsrc : 2'h0) | (head[7] ? fb_uop_ram_29_debug_fsrc : 2'h0);
  assign io_deq_bits_uops_2_valid = ~reset & _deq_valids_T_11[2];
  assign io_deq_bits_uops_2_bits_inst = (head[0] ? fb_uop_ram_2_inst : 32'h0) | (head[1] ? fb_uop_ram_6_inst : 32'h0) | (head[2] ? fb_uop_ram_10_inst : 32'h0) | (head[3] ? fb_uop_ram_14_inst : 32'h0) | (head[4] ? fb_uop_ram_18_inst : 32'h0) | (head[5] ? fb_uop_ram_22_inst : 32'h0) | (head[6] ? fb_uop_ram_26_inst : 32'h0) | (head[7] ? fb_uop_ram_30_inst : 32'h0);
  assign io_deq_bits_uops_2_bits_debug_inst = (head[0] ? fb_uop_ram_2_debug_inst : 32'h0) | (head[1] ? fb_uop_ram_6_debug_inst : 32'h0) | (head[2] ? fb_uop_ram_10_debug_inst : 32'h0) | (head[3] ? fb_uop_ram_14_debug_inst : 32'h0) | (head[4] ? fb_uop_ram_18_debug_inst : 32'h0) | (head[5] ? fb_uop_ram_22_debug_inst : 32'h0) | (head[6] ? fb_uop_ram_26_debug_inst : 32'h0) | (head[7] ? fb_uop_ram_30_debug_inst : 32'h0);
  assign io_deq_bits_uops_2_bits_is_rvc = head[0] & fb_uop_ram_2_is_rvc | head[1] & fb_uop_ram_6_is_rvc | head[2] & fb_uop_ram_10_is_rvc | head[3] & fb_uop_ram_14_is_rvc | head[4] & fb_uop_ram_18_is_rvc | head[5] & fb_uop_ram_22_is_rvc | head[6] & fb_uop_ram_26_is_rvc | head[7] & fb_uop_ram_30_is_rvc;
  assign io_deq_bits_uops_2_bits_debug_pc = (head[0] ? fb_uop_ram_2_debug_pc : 40'h0) | (head[1] ? fb_uop_ram_6_debug_pc : 40'h0) | (head[2] ? fb_uop_ram_10_debug_pc : 40'h0) | (head[3] ? fb_uop_ram_14_debug_pc : 40'h0) | (head[4] ? fb_uop_ram_18_debug_pc : 40'h0) | (head[5] ? fb_uop_ram_22_debug_pc : 40'h0) | (head[6] ? fb_uop_ram_26_debug_pc : 40'h0) | (head[7] ? fb_uop_ram_30_debug_pc : 40'h0);
  assign io_deq_bits_uops_2_bits_is_sfb = head[0] & fb_uop_ram_2_is_sfb | head[1] & fb_uop_ram_6_is_sfb | head[2] & fb_uop_ram_10_is_sfb | head[3] & fb_uop_ram_14_is_sfb | head[4] & fb_uop_ram_18_is_sfb | head[5] & fb_uop_ram_22_is_sfb | head[6] & fb_uop_ram_26_is_sfb | head[7] & fb_uop_ram_30_is_sfb;
  assign io_deq_bits_uops_2_bits_ftq_idx = (head[0] ? fb_uop_ram_2_ftq_idx : 6'h0) | (head[1] ? fb_uop_ram_6_ftq_idx : 6'h0) | (head[2] ? fb_uop_ram_10_ftq_idx : 6'h0) | (head[3] ? fb_uop_ram_14_ftq_idx : 6'h0) | (head[4] ? fb_uop_ram_18_ftq_idx : 6'h0) | (head[5] ? fb_uop_ram_22_ftq_idx : 6'h0) | (head[6] ? fb_uop_ram_26_ftq_idx : 6'h0) | (head[7] ? fb_uop_ram_30_ftq_idx : 6'h0);
  assign io_deq_bits_uops_2_bits_edge_inst = head[0] & fb_uop_ram_2_edge_inst | head[1] & fb_uop_ram_6_edge_inst | head[2] & fb_uop_ram_10_edge_inst | head[3] & fb_uop_ram_14_edge_inst | head[4] & fb_uop_ram_18_edge_inst | head[5] & fb_uop_ram_22_edge_inst | head[6] & fb_uop_ram_26_edge_inst | head[7] & fb_uop_ram_30_edge_inst;
  assign io_deq_bits_uops_2_bits_pc_lob = (head[0] ? fb_uop_ram_2_pc_lob : 6'h0) | (head[1] ? fb_uop_ram_6_pc_lob : 6'h0) | (head[2] ? fb_uop_ram_10_pc_lob : 6'h0) | (head[3] ? fb_uop_ram_14_pc_lob : 6'h0) | (head[4] ? fb_uop_ram_18_pc_lob : 6'h0) | (head[5] ? fb_uop_ram_22_pc_lob : 6'h0) | (head[6] ? fb_uop_ram_26_pc_lob : 6'h0) | (head[7] ? fb_uop_ram_30_pc_lob : 6'h0);
  assign io_deq_bits_uops_2_bits_taken = head[0] & fb_uop_ram_2_taken | head[1] & fb_uop_ram_6_taken | head[2] & fb_uop_ram_10_taken | head[3] & fb_uop_ram_14_taken | head[4] & fb_uop_ram_18_taken | head[5] & fb_uop_ram_22_taken | head[6] & fb_uop_ram_26_taken | head[7] & fb_uop_ram_30_taken;
  assign io_deq_bits_uops_2_bits_xcpt_pf_if = head[0] & fb_uop_ram_2_xcpt_pf_if | head[1] & fb_uop_ram_6_xcpt_pf_if | head[2] & fb_uop_ram_10_xcpt_pf_if | head[3] & fb_uop_ram_14_xcpt_pf_if | head[4] & fb_uop_ram_18_xcpt_pf_if | head[5] & fb_uop_ram_22_xcpt_pf_if | head[6] & fb_uop_ram_26_xcpt_pf_if | head[7] & fb_uop_ram_30_xcpt_pf_if;
  assign io_deq_bits_uops_2_bits_xcpt_ae_if = head[0] & fb_uop_ram_2_xcpt_ae_if | head[1] & fb_uop_ram_6_xcpt_ae_if | head[2] & fb_uop_ram_10_xcpt_ae_if | head[3] & fb_uop_ram_14_xcpt_ae_if | head[4] & fb_uop_ram_18_xcpt_ae_if | head[5] & fb_uop_ram_22_xcpt_ae_if | head[6] & fb_uop_ram_26_xcpt_ae_if | head[7] & fb_uop_ram_30_xcpt_ae_if;
  assign io_deq_bits_uops_2_bits_bp_debug_if = head[0] & fb_uop_ram_2_bp_debug_if | head[1] & fb_uop_ram_6_bp_debug_if | head[2] & fb_uop_ram_10_bp_debug_if | head[3] & fb_uop_ram_14_bp_debug_if | head[4] & fb_uop_ram_18_bp_debug_if | head[5] & fb_uop_ram_22_bp_debug_if | head[6] & fb_uop_ram_26_bp_debug_if | head[7] & fb_uop_ram_30_bp_debug_if;
  assign io_deq_bits_uops_2_bits_bp_xcpt_if = head[0] & fb_uop_ram_2_bp_xcpt_if | head[1] & fb_uop_ram_6_bp_xcpt_if | head[2] & fb_uop_ram_10_bp_xcpt_if | head[3] & fb_uop_ram_14_bp_xcpt_if | head[4] & fb_uop_ram_18_bp_xcpt_if | head[5] & fb_uop_ram_22_bp_xcpt_if | head[6] & fb_uop_ram_26_bp_xcpt_if | head[7] & fb_uop_ram_30_bp_xcpt_if;
  assign io_deq_bits_uops_2_bits_debug_fsrc = (head[0] ? fb_uop_ram_2_debug_fsrc : 2'h0) | (head[1] ? fb_uop_ram_6_debug_fsrc : 2'h0) | (head[2] ? fb_uop_ram_10_debug_fsrc : 2'h0) | (head[3] ? fb_uop_ram_14_debug_fsrc : 2'h0) | (head[4] ? fb_uop_ram_18_debug_fsrc : 2'h0) | (head[5] ? fb_uop_ram_22_debug_fsrc : 2'h0) | (head[6] ? fb_uop_ram_26_debug_fsrc : 2'h0) | (head[7] ? fb_uop_ram_30_debug_fsrc : 2'h0);
  assign io_deq_bits_uops_3_valid = ~reset & _deq_valids_T_11[3];
  assign io_deq_bits_uops_3_bits_inst = (head[0] ? fb_uop_ram_3_inst : 32'h0) | (head[1] ? fb_uop_ram_7_inst : 32'h0) | (head[2] ? fb_uop_ram_11_inst : 32'h0) | (head[3] ? fb_uop_ram_15_inst : 32'h0) | (head[4] ? fb_uop_ram_19_inst : 32'h0) | (head[5] ? fb_uop_ram_23_inst : 32'h0) | (head[6] ? fb_uop_ram_27_inst : 32'h0) | (head[7] ? fb_uop_ram_31_inst : 32'h0);
  assign io_deq_bits_uops_3_bits_debug_inst = (head[0] ? fb_uop_ram_3_debug_inst : 32'h0) | (head[1] ? fb_uop_ram_7_debug_inst : 32'h0) | (head[2] ? fb_uop_ram_11_debug_inst : 32'h0) | (head[3] ? fb_uop_ram_15_debug_inst : 32'h0) | (head[4] ? fb_uop_ram_19_debug_inst : 32'h0) | (head[5] ? fb_uop_ram_23_debug_inst : 32'h0) | (head[6] ? fb_uop_ram_27_debug_inst : 32'h0) | (head[7] ? fb_uop_ram_31_debug_inst : 32'h0);
  assign io_deq_bits_uops_3_bits_is_rvc = head[0] & fb_uop_ram_3_is_rvc | head[1] & fb_uop_ram_7_is_rvc | head[2] & fb_uop_ram_11_is_rvc | head[3] & fb_uop_ram_15_is_rvc | head[4] & fb_uop_ram_19_is_rvc | head[5] & fb_uop_ram_23_is_rvc | head[6] & fb_uop_ram_27_is_rvc | head[7] & fb_uop_ram_31_is_rvc;
  assign io_deq_bits_uops_3_bits_debug_pc = (head[0] ? fb_uop_ram_3_debug_pc : 40'h0) | (head[1] ? fb_uop_ram_7_debug_pc : 40'h0) | (head[2] ? fb_uop_ram_11_debug_pc : 40'h0) | (head[3] ? fb_uop_ram_15_debug_pc : 40'h0) | (head[4] ? fb_uop_ram_19_debug_pc : 40'h0) | (head[5] ? fb_uop_ram_23_debug_pc : 40'h0) | (head[6] ? fb_uop_ram_27_debug_pc : 40'h0) | (head[7] ? fb_uop_ram_31_debug_pc : 40'h0);
  assign io_deq_bits_uops_3_bits_is_sfb = head[0] & fb_uop_ram_3_is_sfb | head[1] & fb_uop_ram_7_is_sfb | head[2] & fb_uop_ram_11_is_sfb | head[3] & fb_uop_ram_15_is_sfb | head[4] & fb_uop_ram_19_is_sfb | head[5] & fb_uop_ram_23_is_sfb | head[6] & fb_uop_ram_27_is_sfb | head[7] & fb_uop_ram_31_is_sfb;
  assign io_deq_bits_uops_3_bits_ftq_idx = (head[0] ? fb_uop_ram_3_ftq_idx : 6'h0) | (head[1] ? fb_uop_ram_7_ftq_idx : 6'h0) | (head[2] ? fb_uop_ram_11_ftq_idx : 6'h0) | (head[3] ? fb_uop_ram_15_ftq_idx : 6'h0) | (head[4] ? fb_uop_ram_19_ftq_idx : 6'h0) | (head[5] ? fb_uop_ram_23_ftq_idx : 6'h0) | (head[6] ? fb_uop_ram_27_ftq_idx : 6'h0) | (head[7] ? fb_uop_ram_31_ftq_idx : 6'h0);
  assign io_deq_bits_uops_3_bits_edge_inst = head[0] & fb_uop_ram_3_edge_inst | head[1] & fb_uop_ram_7_edge_inst | head[2] & fb_uop_ram_11_edge_inst | head[3] & fb_uop_ram_15_edge_inst | head[4] & fb_uop_ram_19_edge_inst | head[5] & fb_uop_ram_23_edge_inst | head[6] & fb_uop_ram_27_edge_inst | head[7] & fb_uop_ram_31_edge_inst;
  assign io_deq_bits_uops_3_bits_pc_lob = (head[0] ? fb_uop_ram_3_pc_lob : 6'h0) | (head[1] ? fb_uop_ram_7_pc_lob : 6'h0) | (head[2] ? fb_uop_ram_11_pc_lob : 6'h0) | (head[3] ? fb_uop_ram_15_pc_lob : 6'h0) | (head[4] ? fb_uop_ram_19_pc_lob : 6'h0) | (head[5] ? fb_uop_ram_23_pc_lob : 6'h0) | (head[6] ? fb_uop_ram_27_pc_lob : 6'h0) | (head[7] ? fb_uop_ram_31_pc_lob : 6'h0);
  assign io_deq_bits_uops_3_bits_taken = head[0] & fb_uop_ram_3_taken | head[1] & fb_uop_ram_7_taken | head[2] & fb_uop_ram_11_taken | head[3] & fb_uop_ram_15_taken | head[4] & fb_uop_ram_19_taken | head[5] & fb_uop_ram_23_taken | head[6] & fb_uop_ram_27_taken | head[7] & fb_uop_ram_31_taken;
  assign io_deq_bits_uops_3_bits_xcpt_pf_if = head[0] & fb_uop_ram_3_xcpt_pf_if | head[1] & fb_uop_ram_7_xcpt_pf_if | head[2] & fb_uop_ram_11_xcpt_pf_if | head[3] & fb_uop_ram_15_xcpt_pf_if | head[4] & fb_uop_ram_19_xcpt_pf_if | head[5] & fb_uop_ram_23_xcpt_pf_if | head[6] & fb_uop_ram_27_xcpt_pf_if | head[7] & fb_uop_ram_31_xcpt_pf_if;
  assign io_deq_bits_uops_3_bits_xcpt_ae_if = head[0] & fb_uop_ram_3_xcpt_ae_if | head[1] & fb_uop_ram_7_xcpt_ae_if | head[2] & fb_uop_ram_11_xcpt_ae_if | head[3] & fb_uop_ram_15_xcpt_ae_if | head[4] & fb_uop_ram_19_xcpt_ae_if | head[5] & fb_uop_ram_23_xcpt_ae_if | head[6] & fb_uop_ram_27_xcpt_ae_if | head[7] & fb_uop_ram_31_xcpt_ae_if;
  assign io_deq_bits_uops_3_bits_bp_debug_if = head[0] & fb_uop_ram_3_bp_debug_if | head[1] & fb_uop_ram_7_bp_debug_if | head[2] & fb_uop_ram_11_bp_debug_if | head[3] & fb_uop_ram_15_bp_debug_if | head[4] & fb_uop_ram_19_bp_debug_if | head[5] & fb_uop_ram_23_bp_debug_if | head[6] & fb_uop_ram_27_bp_debug_if | head[7] & fb_uop_ram_31_bp_debug_if;
  assign io_deq_bits_uops_3_bits_bp_xcpt_if = head[0] & fb_uop_ram_3_bp_xcpt_if | head[1] & fb_uop_ram_7_bp_xcpt_if | head[2] & fb_uop_ram_11_bp_xcpt_if | head[3] & fb_uop_ram_15_bp_xcpt_if | head[4] & fb_uop_ram_19_bp_xcpt_if | head[5] & fb_uop_ram_23_bp_xcpt_if | head[6] & fb_uop_ram_27_bp_xcpt_if | head[7] & fb_uop_ram_31_bp_xcpt_if;
  assign io_deq_bits_uops_3_bits_debug_fsrc = (head[0] ? fb_uop_ram_3_debug_fsrc : 2'h0) | (head[1] ? fb_uop_ram_7_debug_fsrc : 2'h0) | (head[2] ? fb_uop_ram_11_debug_fsrc : 2'h0) | (head[3] ? fb_uop_ram_15_debug_fsrc : 2'h0) | (head[4] ? fb_uop_ram_19_debug_fsrc : 2'h0) | (head[5] ? fb_uop_ram_23_debug_fsrc : 2'h0) | (head[6] ? fb_uop_ram_27_debug_fsrc : 2'h0) | (head[7] ? fb_uop_ram_31_debug_fsrc : 2'h0);
endmodule

