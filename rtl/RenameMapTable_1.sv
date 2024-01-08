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

module RenameMapTable_1(
  input        clock,
               reset,
  input  [5:0] io_map_reqs_0_lrs1,
               io_map_reqs_0_lrs2,
               io_map_reqs_0_lrs3,
               io_map_reqs_0_ldst,
               io_map_reqs_1_lrs1,
               io_map_reqs_1_lrs2,
               io_map_reqs_1_lrs3,
               io_map_reqs_1_ldst,
               io_map_reqs_2_lrs1,
               io_map_reqs_2_lrs2,
               io_map_reqs_2_lrs3,
               io_map_reqs_2_ldst,
               io_map_reqs_3_lrs1,
               io_map_reqs_3_lrs2,
               io_map_reqs_3_lrs3,
               io_map_reqs_3_ldst,
  output [6:0] io_map_resps_0_prs1,
               io_map_resps_0_prs2,
               io_map_resps_0_prs3,
               io_map_resps_0_stale_pdst,
               io_map_resps_1_prs1,
               io_map_resps_1_prs2,
               io_map_resps_1_prs3,
               io_map_resps_1_stale_pdst,
               io_map_resps_2_prs1,
               io_map_resps_2_prs2,
               io_map_resps_2_prs3,
               io_map_resps_2_stale_pdst,
               io_map_resps_3_prs1,
               io_map_resps_3_prs2,
               io_map_resps_3_prs3,
               io_map_resps_3_stale_pdst,
  input  [5:0] io_remap_reqs_0_ldst,
  input  [6:0] io_remap_reqs_0_pdst,
  input        io_remap_reqs_0_valid,
  input  [5:0] io_remap_reqs_1_ldst,
  input  [6:0] io_remap_reqs_1_pdst,
  input        io_remap_reqs_1_valid,
  input  [5:0] io_remap_reqs_2_ldst,
  input  [6:0] io_remap_reqs_2_pdst,
  input        io_remap_reqs_2_valid,
  input  [5:0] io_remap_reqs_3_ldst,
  input  [6:0] io_remap_reqs_3_pdst,
  input        io_remap_reqs_3_valid,
               io_ren_br_tags_0_valid,
  input  [4:0] io_ren_br_tags_0_bits,
  input        io_ren_br_tags_1_valid,
  input  [4:0] io_ren_br_tags_1_bits,
  input        io_ren_br_tags_2_valid,
  input  [4:0] io_ren_br_tags_2_bits,
  input        io_ren_br_tags_3_valid,
  input  [4:0] io_ren_br_tags_3_bits,
               io_brupdate_b2_uop_br_tag,
  input        io_brupdate_b2_mispredict,
               io_rollback
);

  reg  [6:0]  map_table_0;
  reg  [6:0]  map_table_1;
  reg  [6:0]  map_table_2;
  reg  [6:0]  map_table_3;
  reg  [6:0]  map_table_4;
  reg  [6:0]  map_table_5;
  reg  [6:0]  map_table_6;
  reg  [6:0]  map_table_7;
  reg  [6:0]  map_table_8;
  reg  [6:0]  map_table_9;
  reg  [6:0]  map_table_10;
  reg  [6:0]  map_table_11;
  reg  [6:0]  map_table_12;
  reg  [6:0]  map_table_13;
  reg  [6:0]  map_table_14;
  reg  [6:0]  map_table_15;
  reg  [6:0]  map_table_16;
  reg  [6:0]  map_table_17;
  reg  [6:0]  map_table_18;
  reg  [6:0]  map_table_19;
  reg  [6:0]  map_table_20;
  reg  [6:0]  map_table_21;
  reg  [6:0]  map_table_22;
  reg  [6:0]  map_table_23;
  reg  [6:0]  map_table_24;
  reg  [6:0]  map_table_25;
  reg  [6:0]  map_table_26;
  reg  [6:0]  map_table_27;
  reg  [6:0]  map_table_28;
  reg  [6:0]  map_table_29;
  reg  [6:0]  map_table_30;
  reg  [6:0]  map_table_31;
  reg  [6:0]  br_snapshots_0_0;
  reg  [6:0]  br_snapshots_0_1;
  reg  [6:0]  br_snapshots_0_2;
  reg  [6:0]  br_snapshots_0_3;
  reg  [6:0]  br_snapshots_0_4;
  reg  [6:0]  br_snapshots_0_5;
  reg  [6:0]  br_snapshots_0_6;
  reg  [6:0]  br_snapshots_0_7;
  reg  [6:0]  br_snapshots_0_8;
  reg  [6:0]  br_snapshots_0_9;
  reg  [6:0]  br_snapshots_0_10;
  reg  [6:0]  br_snapshots_0_11;
  reg  [6:0]  br_snapshots_0_12;
  reg  [6:0]  br_snapshots_0_13;
  reg  [6:0]  br_snapshots_0_14;
  reg  [6:0]  br_snapshots_0_15;
  reg  [6:0]  br_snapshots_0_16;
  reg  [6:0]  br_snapshots_0_17;
  reg  [6:0]  br_snapshots_0_18;
  reg  [6:0]  br_snapshots_0_19;
  reg  [6:0]  br_snapshots_0_20;
  reg  [6:0]  br_snapshots_0_21;
  reg  [6:0]  br_snapshots_0_22;
  reg  [6:0]  br_snapshots_0_23;
  reg  [6:0]  br_snapshots_0_24;
  reg  [6:0]  br_snapshots_0_25;
  reg  [6:0]  br_snapshots_0_26;
  reg  [6:0]  br_snapshots_0_27;
  reg  [6:0]  br_snapshots_0_28;
  reg  [6:0]  br_snapshots_0_29;
  reg  [6:0]  br_snapshots_0_30;
  reg  [6:0]  br_snapshots_0_31;
  reg  [6:0]  br_snapshots_1_0;
  reg  [6:0]  br_snapshots_1_1;
  reg  [6:0]  br_snapshots_1_2;
  reg  [6:0]  br_snapshots_1_3;
  reg  [6:0]  br_snapshots_1_4;
  reg  [6:0]  br_snapshots_1_5;
  reg  [6:0]  br_snapshots_1_6;
  reg  [6:0]  br_snapshots_1_7;
  reg  [6:0]  br_snapshots_1_8;
  reg  [6:0]  br_snapshots_1_9;
  reg  [6:0]  br_snapshots_1_10;
  reg  [6:0]  br_snapshots_1_11;
  reg  [6:0]  br_snapshots_1_12;
  reg  [6:0]  br_snapshots_1_13;
  reg  [6:0]  br_snapshots_1_14;
  reg  [6:0]  br_snapshots_1_15;
  reg  [6:0]  br_snapshots_1_16;
  reg  [6:0]  br_snapshots_1_17;
  reg  [6:0]  br_snapshots_1_18;
  reg  [6:0]  br_snapshots_1_19;
  reg  [6:0]  br_snapshots_1_20;
  reg  [6:0]  br_snapshots_1_21;
  reg  [6:0]  br_snapshots_1_22;
  reg  [6:0]  br_snapshots_1_23;
  reg  [6:0]  br_snapshots_1_24;
  reg  [6:0]  br_snapshots_1_25;
  reg  [6:0]  br_snapshots_1_26;
  reg  [6:0]  br_snapshots_1_27;
  reg  [6:0]  br_snapshots_1_28;
  reg  [6:0]  br_snapshots_1_29;
  reg  [6:0]  br_snapshots_1_30;
  reg  [6:0]  br_snapshots_1_31;
  reg  [6:0]  br_snapshots_2_0;
  reg  [6:0]  br_snapshots_2_1;
  reg  [6:0]  br_snapshots_2_2;
  reg  [6:0]  br_snapshots_2_3;
  reg  [6:0]  br_snapshots_2_4;
  reg  [6:0]  br_snapshots_2_5;
  reg  [6:0]  br_snapshots_2_6;
  reg  [6:0]  br_snapshots_2_7;
  reg  [6:0]  br_snapshots_2_8;
  reg  [6:0]  br_snapshots_2_9;
  reg  [6:0]  br_snapshots_2_10;
  reg  [6:0]  br_snapshots_2_11;
  reg  [6:0]  br_snapshots_2_12;
  reg  [6:0]  br_snapshots_2_13;
  reg  [6:0]  br_snapshots_2_14;
  reg  [6:0]  br_snapshots_2_15;
  reg  [6:0]  br_snapshots_2_16;
  reg  [6:0]  br_snapshots_2_17;
  reg  [6:0]  br_snapshots_2_18;
  reg  [6:0]  br_snapshots_2_19;
  reg  [6:0]  br_snapshots_2_20;
  reg  [6:0]  br_snapshots_2_21;
  reg  [6:0]  br_snapshots_2_22;
  reg  [6:0]  br_snapshots_2_23;
  reg  [6:0]  br_snapshots_2_24;
  reg  [6:0]  br_snapshots_2_25;
  reg  [6:0]  br_snapshots_2_26;
  reg  [6:0]  br_snapshots_2_27;
  reg  [6:0]  br_snapshots_2_28;
  reg  [6:0]  br_snapshots_2_29;
  reg  [6:0]  br_snapshots_2_30;
  reg  [6:0]  br_snapshots_2_31;
  reg  [6:0]  br_snapshots_3_0;
  reg  [6:0]  br_snapshots_3_1;
  reg  [6:0]  br_snapshots_3_2;
  reg  [6:0]  br_snapshots_3_3;
  reg  [6:0]  br_snapshots_3_4;
  reg  [6:0]  br_snapshots_3_5;
  reg  [6:0]  br_snapshots_3_6;
  reg  [6:0]  br_snapshots_3_7;
  reg  [6:0]  br_snapshots_3_8;
  reg  [6:0]  br_snapshots_3_9;
  reg  [6:0]  br_snapshots_3_10;
  reg  [6:0]  br_snapshots_3_11;
  reg  [6:0]  br_snapshots_3_12;
  reg  [6:0]  br_snapshots_3_13;
  reg  [6:0]  br_snapshots_3_14;
  reg  [6:0]  br_snapshots_3_15;
  reg  [6:0]  br_snapshots_3_16;
  reg  [6:0]  br_snapshots_3_17;
  reg  [6:0]  br_snapshots_3_18;
  reg  [6:0]  br_snapshots_3_19;
  reg  [6:0]  br_snapshots_3_20;
  reg  [6:0]  br_snapshots_3_21;
  reg  [6:0]  br_snapshots_3_22;
  reg  [6:0]  br_snapshots_3_23;
  reg  [6:0]  br_snapshots_3_24;
  reg  [6:0]  br_snapshots_3_25;
  reg  [6:0]  br_snapshots_3_26;
  reg  [6:0]  br_snapshots_3_27;
  reg  [6:0]  br_snapshots_3_28;
  reg  [6:0]  br_snapshots_3_29;
  reg  [6:0]  br_snapshots_3_30;
  reg  [6:0]  br_snapshots_3_31;
  reg  [6:0]  br_snapshots_4_0;
  reg  [6:0]  br_snapshots_4_1;
  reg  [6:0]  br_snapshots_4_2;
  reg  [6:0]  br_snapshots_4_3;
  reg  [6:0]  br_snapshots_4_4;
  reg  [6:0]  br_snapshots_4_5;
  reg  [6:0]  br_snapshots_4_6;
  reg  [6:0]  br_snapshots_4_7;
  reg  [6:0]  br_snapshots_4_8;
  reg  [6:0]  br_snapshots_4_9;
  reg  [6:0]  br_snapshots_4_10;
  reg  [6:0]  br_snapshots_4_11;
  reg  [6:0]  br_snapshots_4_12;
  reg  [6:0]  br_snapshots_4_13;
  reg  [6:0]  br_snapshots_4_14;
  reg  [6:0]  br_snapshots_4_15;
  reg  [6:0]  br_snapshots_4_16;
  reg  [6:0]  br_snapshots_4_17;
  reg  [6:0]  br_snapshots_4_18;
  reg  [6:0]  br_snapshots_4_19;
  reg  [6:0]  br_snapshots_4_20;
  reg  [6:0]  br_snapshots_4_21;
  reg  [6:0]  br_snapshots_4_22;
  reg  [6:0]  br_snapshots_4_23;
  reg  [6:0]  br_snapshots_4_24;
  reg  [6:0]  br_snapshots_4_25;
  reg  [6:0]  br_snapshots_4_26;
  reg  [6:0]  br_snapshots_4_27;
  reg  [6:0]  br_snapshots_4_28;
  reg  [6:0]  br_snapshots_4_29;
  reg  [6:0]  br_snapshots_4_30;
  reg  [6:0]  br_snapshots_4_31;
  reg  [6:0]  br_snapshots_5_0;
  reg  [6:0]  br_snapshots_5_1;
  reg  [6:0]  br_snapshots_5_2;
  reg  [6:0]  br_snapshots_5_3;
  reg  [6:0]  br_snapshots_5_4;
  reg  [6:0]  br_snapshots_5_5;
  reg  [6:0]  br_snapshots_5_6;
  reg  [6:0]  br_snapshots_5_7;
  reg  [6:0]  br_snapshots_5_8;
  reg  [6:0]  br_snapshots_5_9;
  reg  [6:0]  br_snapshots_5_10;
  reg  [6:0]  br_snapshots_5_11;
  reg  [6:0]  br_snapshots_5_12;
  reg  [6:0]  br_snapshots_5_13;
  reg  [6:0]  br_snapshots_5_14;
  reg  [6:0]  br_snapshots_5_15;
  reg  [6:0]  br_snapshots_5_16;
  reg  [6:0]  br_snapshots_5_17;
  reg  [6:0]  br_snapshots_5_18;
  reg  [6:0]  br_snapshots_5_19;
  reg  [6:0]  br_snapshots_5_20;
  reg  [6:0]  br_snapshots_5_21;
  reg  [6:0]  br_snapshots_5_22;
  reg  [6:0]  br_snapshots_5_23;
  reg  [6:0]  br_snapshots_5_24;
  reg  [6:0]  br_snapshots_5_25;
  reg  [6:0]  br_snapshots_5_26;
  reg  [6:0]  br_snapshots_5_27;
  reg  [6:0]  br_snapshots_5_28;
  reg  [6:0]  br_snapshots_5_29;
  reg  [6:0]  br_snapshots_5_30;
  reg  [6:0]  br_snapshots_5_31;
  reg  [6:0]  br_snapshots_6_0;
  reg  [6:0]  br_snapshots_6_1;
  reg  [6:0]  br_snapshots_6_2;
  reg  [6:0]  br_snapshots_6_3;
  reg  [6:0]  br_snapshots_6_4;
  reg  [6:0]  br_snapshots_6_5;
  reg  [6:0]  br_snapshots_6_6;
  reg  [6:0]  br_snapshots_6_7;
  reg  [6:0]  br_snapshots_6_8;
  reg  [6:0]  br_snapshots_6_9;
  reg  [6:0]  br_snapshots_6_10;
  reg  [6:0]  br_snapshots_6_11;
  reg  [6:0]  br_snapshots_6_12;
  reg  [6:0]  br_snapshots_6_13;
  reg  [6:0]  br_snapshots_6_14;
  reg  [6:0]  br_snapshots_6_15;
  reg  [6:0]  br_snapshots_6_16;
  reg  [6:0]  br_snapshots_6_17;
  reg  [6:0]  br_snapshots_6_18;
  reg  [6:0]  br_snapshots_6_19;
  reg  [6:0]  br_snapshots_6_20;
  reg  [6:0]  br_snapshots_6_21;
  reg  [6:0]  br_snapshots_6_22;
  reg  [6:0]  br_snapshots_6_23;
  reg  [6:0]  br_snapshots_6_24;
  reg  [6:0]  br_snapshots_6_25;
  reg  [6:0]  br_snapshots_6_26;
  reg  [6:0]  br_snapshots_6_27;
  reg  [6:0]  br_snapshots_6_28;
  reg  [6:0]  br_snapshots_6_29;
  reg  [6:0]  br_snapshots_6_30;
  reg  [6:0]  br_snapshots_6_31;
  reg  [6:0]  br_snapshots_7_0;
  reg  [6:0]  br_snapshots_7_1;
  reg  [6:0]  br_snapshots_7_2;
  reg  [6:0]  br_snapshots_7_3;
  reg  [6:0]  br_snapshots_7_4;
  reg  [6:0]  br_snapshots_7_5;
  reg  [6:0]  br_snapshots_7_6;
  reg  [6:0]  br_snapshots_7_7;
  reg  [6:0]  br_snapshots_7_8;
  reg  [6:0]  br_snapshots_7_9;
  reg  [6:0]  br_snapshots_7_10;
  reg  [6:0]  br_snapshots_7_11;
  reg  [6:0]  br_snapshots_7_12;
  reg  [6:0]  br_snapshots_7_13;
  reg  [6:0]  br_snapshots_7_14;
  reg  [6:0]  br_snapshots_7_15;
  reg  [6:0]  br_snapshots_7_16;
  reg  [6:0]  br_snapshots_7_17;
  reg  [6:0]  br_snapshots_7_18;
  reg  [6:0]  br_snapshots_7_19;
  reg  [6:0]  br_snapshots_7_20;
  reg  [6:0]  br_snapshots_7_21;
  reg  [6:0]  br_snapshots_7_22;
  reg  [6:0]  br_snapshots_7_23;
  reg  [6:0]  br_snapshots_7_24;
  reg  [6:0]  br_snapshots_7_25;
  reg  [6:0]  br_snapshots_7_26;
  reg  [6:0]  br_snapshots_7_27;
  reg  [6:0]  br_snapshots_7_28;
  reg  [6:0]  br_snapshots_7_29;
  reg  [6:0]  br_snapshots_7_30;
  reg  [6:0]  br_snapshots_7_31;
  reg  [6:0]  br_snapshots_8_0;
  reg  [6:0]  br_snapshots_8_1;
  reg  [6:0]  br_snapshots_8_2;
  reg  [6:0]  br_snapshots_8_3;
  reg  [6:0]  br_snapshots_8_4;
  reg  [6:0]  br_snapshots_8_5;
  reg  [6:0]  br_snapshots_8_6;
  reg  [6:0]  br_snapshots_8_7;
  reg  [6:0]  br_snapshots_8_8;
  reg  [6:0]  br_snapshots_8_9;
  reg  [6:0]  br_snapshots_8_10;
  reg  [6:0]  br_snapshots_8_11;
  reg  [6:0]  br_snapshots_8_12;
  reg  [6:0]  br_snapshots_8_13;
  reg  [6:0]  br_snapshots_8_14;
  reg  [6:0]  br_snapshots_8_15;
  reg  [6:0]  br_snapshots_8_16;
  reg  [6:0]  br_snapshots_8_17;
  reg  [6:0]  br_snapshots_8_18;
  reg  [6:0]  br_snapshots_8_19;
  reg  [6:0]  br_snapshots_8_20;
  reg  [6:0]  br_snapshots_8_21;
  reg  [6:0]  br_snapshots_8_22;
  reg  [6:0]  br_snapshots_8_23;
  reg  [6:0]  br_snapshots_8_24;
  reg  [6:0]  br_snapshots_8_25;
  reg  [6:0]  br_snapshots_8_26;
  reg  [6:0]  br_snapshots_8_27;
  reg  [6:0]  br_snapshots_8_28;
  reg  [6:0]  br_snapshots_8_29;
  reg  [6:0]  br_snapshots_8_30;
  reg  [6:0]  br_snapshots_8_31;
  reg  [6:0]  br_snapshots_9_0;
  reg  [6:0]  br_snapshots_9_1;
  reg  [6:0]  br_snapshots_9_2;
  reg  [6:0]  br_snapshots_9_3;
  reg  [6:0]  br_snapshots_9_4;
  reg  [6:0]  br_snapshots_9_5;
  reg  [6:0]  br_snapshots_9_6;
  reg  [6:0]  br_snapshots_9_7;
  reg  [6:0]  br_snapshots_9_8;
  reg  [6:0]  br_snapshots_9_9;
  reg  [6:0]  br_snapshots_9_10;
  reg  [6:0]  br_snapshots_9_11;
  reg  [6:0]  br_snapshots_9_12;
  reg  [6:0]  br_snapshots_9_13;
  reg  [6:0]  br_snapshots_9_14;
  reg  [6:0]  br_snapshots_9_15;
  reg  [6:0]  br_snapshots_9_16;
  reg  [6:0]  br_snapshots_9_17;
  reg  [6:0]  br_snapshots_9_18;
  reg  [6:0]  br_snapshots_9_19;
  reg  [6:0]  br_snapshots_9_20;
  reg  [6:0]  br_snapshots_9_21;
  reg  [6:0]  br_snapshots_9_22;
  reg  [6:0]  br_snapshots_9_23;
  reg  [6:0]  br_snapshots_9_24;
  reg  [6:0]  br_snapshots_9_25;
  reg  [6:0]  br_snapshots_9_26;
  reg  [6:0]  br_snapshots_9_27;
  reg  [6:0]  br_snapshots_9_28;
  reg  [6:0]  br_snapshots_9_29;
  reg  [6:0]  br_snapshots_9_30;
  reg  [6:0]  br_snapshots_9_31;
  reg  [6:0]  br_snapshots_10_0;
  reg  [6:0]  br_snapshots_10_1;
  reg  [6:0]  br_snapshots_10_2;
  reg  [6:0]  br_snapshots_10_3;
  reg  [6:0]  br_snapshots_10_4;
  reg  [6:0]  br_snapshots_10_5;
  reg  [6:0]  br_snapshots_10_6;
  reg  [6:0]  br_snapshots_10_7;
  reg  [6:0]  br_snapshots_10_8;
  reg  [6:0]  br_snapshots_10_9;
  reg  [6:0]  br_snapshots_10_10;
  reg  [6:0]  br_snapshots_10_11;
  reg  [6:0]  br_snapshots_10_12;
  reg  [6:0]  br_snapshots_10_13;
  reg  [6:0]  br_snapshots_10_14;
  reg  [6:0]  br_snapshots_10_15;
  reg  [6:0]  br_snapshots_10_16;
  reg  [6:0]  br_snapshots_10_17;
  reg  [6:0]  br_snapshots_10_18;
  reg  [6:0]  br_snapshots_10_19;
  reg  [6:0]  br_snapshots_10_20;
  reg  [6:0]  br_snapshots_10_21;
  reg  [6:0]  br_snapshots_10_22;
  reg  [6:0]  br_snapshots_10_23;
  reg  [6:0]  br_snapshots_10_24;
  reg  [6:0]  br_snapshots_10_25;
  reg  [6:0]  br_snapshots_10_26;
  reg  [6:0]  br_snapshots_10_27;
  reg  [6:0]  br_snapshots_10_28;
  reg  [6:0]  br_snapshots_10_29;
  reg  [6:0]  br_snapshots_10_30;
  reg  [6:0]  br_snapshots_10_31;
  reg  [6:0]  br_snapshots_11_0;
  reg  [6:0]  br_snapshots_11_1;
  reg  [6:0]  br_snapshots_11_2;
  reg  [6:0]  br_snapshots_11_3;
  reg  [6:0]  br_snapshots_11_4;
  reg  [6:0]  br_snapshots_11_5;
  reg  [6:0]  br_snapshots_11_6;
  reg  [6:0]  br_snapshots_11_7;
  reg  [6:0]  br_snapshots_11_8;
  reg  [6:0]  br_snapshots_11_9;
  reg  [6:0]  br_snapshots_11_10;
  reg  [6:0]  br_snapshots_11_11;
  reg  [6:0]  br_snapshots_11_12;
  reg  [6:0]  br_snapshots_11_13;
  reg  [6:0]  br_snapshots_11_14;
  reg  [6:0]  br_snapshots_11_15;
  reg  [6:0]  br_snapshots_11_16;
  reg  [6:0]  br_snapshots_11_17;
  reg  [6:0]  br_snapshots_11_18;
  reg  [6:0]  br_snapshots_11_19;
  reg  [6:0]  br_snapshots_11_20;
  reg  [6:0]  br_snapshots_11_21;
  reg  [6:0]  br_snapshots_11_22;
  reg  [6:0]  br_snapshots_11_23;
  reg  [6:0]  br_snapshots_11_24;
  reg  [6:0]  br_snapshots_11_25;
  reg  [6:0]  br_snapshots_11_26;
  reg  [6:0]  br_snapshots_11_27;
  reg  [6:0]  br_snapshots_11_28;
  reg  [6:0]  br_snapshots_11_29;
  reg  [6:0]  br_snapshots_11_30;
  reg  [6:0]  br_snapshots_11_31;
  reg  [6:0]  br_snapshots_12_0;
  reg  [6:0]  br_snapshots_12_1;
  reg  [6:0]  br_snapshots_12_2;
  reg  [6:0]  br_snapshots_12_3;
  reg  [6:0]  br_snapshots_12_4;
  reg  [6:0]  br_snapshots_12_5;
  reg  [6:0]  br_snapshots_12_6;
  reg  [6:0]  br_snapshots_12_7;
  reg  [6:0]  br_snapshots_12_8;
  reg  [6:0]  br_snapshots_12_9;
  reg  [6:0]  br_snapshots_12_10;
  reg  [6:0]  br_snapshots_12_11;
  reg  [6:0]  br_snapshots_12_12;
  reg  [6:0]  br_snapshots_12_13;
  reg  [6:0]  br_snapshots_12_14;
  reg  [6:0]  br_snapshots_12_15;
  reg  [6:0]  br_snapshots_12_16;
  reg  [6:0]  br_snapshots_12_17;
  reg  [6:0]  br_snapshots_12_18;
  reg  [6:0]  br_snapshots_12_19;
  reg  [6:0]  br_snapshots_12_20;
  reg  [6:0]  br_snapshots_12_21;
  reg  [6:0]  br_snapshots_12_22;
  reg  [6:0]  br_snapshots_12_23;
  reg  [6:0]  br_snapshots_12_24;
  reg  [6:0]  br_snapshots_12_25;
  reg  [6:0]  br_snapshots_12_26;
  reg  [6:0]  br_snapshots_12_27;
  reg  [6:0]  br_snapshots_12_28;
  reg  [6:0]  br_snapshots_12_29;
  reg  [6:0]  br_snapshots_12_30;
  reg  [6:0]  br_snapshots_12_31;
  reg  [6:0]  br_snapshots_13_0;
  reg  [6:0]  br_snapshots_13_1;
  reg  [6:0]  br_snapshots_13_2;
  reg  [6:0]  br_snapshots_13_3;
  reg  [6:0]  br_snapshots_13_4;
  reg  [6:0]  br_snapshots_13_5;
  reg  [6:0]  br_snapshots_13_6;
  reg  [6:0]  br_snapshots_13_7;
  reg  [6:0]  br_snapshots_13_8;
  reg  [6:0]  br_snapshots_13_9;
  reg  [6:0]  br_snapshots_13_10;
  reg  [6:0]  br_snapshots_13_11;
  reg  [6:0]  br_snapshots_13_12;
  reg  [6:0]  br_snapshots_13_13;
  reg  [6:0]  br_snapshots_13_14;
  reg  [6:0]  br_snapshots_13_15;
  reg  [6:0]  br_snapshots_13_16;
  reg  [6:0]  br_snapshots_13_17;
  reg  [6:0]  br_snapshots_13_18;
  reg  [6:0]  br_snapshots_13_19;
  reg  [6:0]  br_snapshots_13_20;
  reg  [6:0]  br_snapshots_13_21;
  reg  [6:0]  br_snapshots_13_22;
  reg  [6:0]  br_snapshots_13_23;
  reg  [6:0]  br_snapshots_13_24;
  reg  [6:0]  br_snapshots_13_25;
  reg  [6:0]  br_snapshots_13_26;
  reg  [6:0]  br_snapshots_13_27;
  reg  [6:0]  br_snapshots_13_28;
  reg  [6:0]  br_snapshots_13_29;
  reg  [6:0]  br_snapshots_13_30;
  reg  [6:0]  br_snapshots_13_31;
  reg  [6:0]  br_snapshots_14_0;
  reg  [6:0]  br_snapshots_14_1;
  reg  [6:0]  br_snapshots_14_2;
  reg  [6:0]  br_snapshots_14_3;
  reg  [6:0]  br_snapshots_14_4;
  reg  [6:0]  br_snapshots_14_5;
  reg  [6:0]  br_snapshots_14_6;
  reg  [6:0]  br_snapshots_14_7;
  reg  [6:0]  br_snapshots_14_8;
  reg  [6:0]  br_snapshots_14_9;
  reg  [6:0]  br_snapshots_14_10;
  reg  [6:0]  br_snapshots_14_11;
  reg  [6:0]  br_snapshots_14_12;
  reg  [6:0]  br_snapshots_14_13;
  reg  [6:0]  br_snapshots_14_14;
  reg  [6:0]  br_snapshots_14_15;
  reg  [6:0]  br_snapshots_14_16;
  reg  [6:0]  br_snapshots_14_17;
  reg  [6:0]  br_snapshots_14_18;
  reg  [6:0]  br_snapshots_14_19;
  reg  [6:0]  br_snapshots_14_20;
  reg  [6:0]  br_snapshots_14_21;
  reg  [6:0]  br_snapshots_14_22;
  reg  [6:0]  br_snapshots_14_23;
  reg  [6:0]  br_snapshots_14_24;
  reg  [6:0]  br_snapshots_14_25;
  reg  [6:0]  br_snapshots_14_26;
  reg  [6:0]  br_snapshots_14_27;
  reg  [6:0]  br_snapshots_14_28;
  reg  [6:0]  br_snapshots_14_29;
  reg  [6:0]  br_snapshots_14_30;
  reg  [6:0]  br_snapshots_14_31;
  reg  [6:0]  br_snapshots_15_0;
  reg  [6:0]  br_snapshots_15_1;
  reg  [6:0]  br_snapshots_15_2;
  reg  [6:0]  br_snapshots_15_3;
  reg  [6:0]  br_snapshots_15_4;
  reg  [6:0]  br_snapshots_15_5;
  reg  [6:0]  br_snapshots_15_6;
  reg  [6:0]  br_snapshots_15_7;
  reg  [6:0]  br_snapshots_15_8;
  reg  [6:0]  br_snapshots_15_9;
  reg  [6:0]  br_snapshots_15_10;
  reg  [6:0]  br_snapshots_15_11;
  reg  [6:0]  br_snapshots_15_12;
  reg  [6:0]  br_snapshots_15_13;
  reg  [6:0]  br_snapshots_15_14;
  reg  [6:0]  br_snapshots_15_15;
  reg  [6:0]  br_snapshots_15_16;
  reg  [6:0]  br_snapshots_15_17;
  reg  [6:0]  br_snapshots_15_18;
  reg  [6:0]  br_snapshots_15_19;
  reg  [6:0]  br_snapshots_15_20;
  reg  [6:0]  br_snapshots_15_21;
  reg  [6:0]  br_snapshots_15_22;
  reg  [6:0]  br_snapshots_15_23;
  reg  [6:0]  br_snapshots_15_24;
  reg  [6:0]  br_snapshots_15_25;
  reg  [6:0]  br_snapshots_15_26;
  reg  [6:0]  br_snapshots_15_27;
  reg  [6:0]  br_snapshots_15_28;
  reg  [6:0]  br_snapshots_15_29;
  reg  [6:0]  br_snapshots_15_30;
  reg  [6:0]  br_snapshots_15_31;
  reg  [6:0]  br_snapshots_16_0;
  reg  [6:0]  br_snapshots_16_1;
  reg  [6:0]  br_snapshots_16_2;
  reg  [6:0]  br_snapshots_16_3;
  reg  [6:0]  br_snapshots_16_4;
  reg  [6:0]  br_snapshots_16_5;
  reg  [6:0]  br_snapshots_16_6;
  reg  [6:0]  br_snapshots_16_7;
  reg  [6:0]  br_snapshots_16_8;
  reg  [6:0]  br_snapshots_16_9;
  reg  [6:0]  br_snapshots_16_10;
  reg  [6:0]  br_snapshots_16_11;
  reg  [6:0]  br_snapshots_16_12;
  reg  [6:0]  br_snapshots_16_13;
  reg  [6:0]  br_snapshots_16_14;
  reg  [6:0]  br_snapshots_16_15;
  reg  [6:0]  br_snapshots_16_16;
  reg  [6:0]  br_snapshots_16_17;
  reg  [6:0]  br_snapshots_16_18;
  reg  [6:0]  br_snapshots_16_19;
  reg  [6:0]  br_snapshots_16_20;
  reg  [6:0]  br_snapshots_16_21;
  reg  [6:0]  br_snapshots_16_22;
  reg  [6:0]  br_snapshots_16_23;
  reg  [6:0]  br_snapshots_16_24;
  reg  [6:0]  br_snapshots_16_25;
  reg  [6:0]  br_snapshots_16_26;
  reg  [6:0]  br_snapshots_16_27;
  reg  [6:0]  br_snapshots_16_28;
  reg  [6:0]  br_snapshots_16_29;
  reg  [6:0]  br_snapshots_16_30;
  reg  [6:0]  br_snapshots_16_31;
  reg  [6:0]  br_snapshots_17_0;
  reg  [6:0]  br_snapshots_17_1;
  reg  [6:0]  br_snapshots_17_2;
  reg  [6:0]  br_snapshots_17_3;
  reg  [6:0]  br_snapshots_17_4;
  reg  [6:0]  br_snapshots_17_5;
  reg  [6:0]  br_snapshots_17_6;
  reg  [6:0]  br_snapshots_17_7;
  reg  [6:0]  br_snapshots_17_8;
  reg  [6:0]  br_snapshots_17_9;
  reg  [6:0]  br_snapshots_17_10;
  reg  [6:0]  br_snapshots_17_11;
  reg  [6:0]  br_snapshots_17_12;
  reg  [6:0]  br_snapshots_17_13;
  reg  [6:0]  br_snapshots_17_14;
  reg  [6:0]  br_snapshots_17_15;
  reg  [6:0]  br_snapshots_17_16;
  reg  [6:0]  br_snapshots_17_17;
  reg  [6:0]  br_snapshots_17_18;
  reg  [6:0]  br_snapshots_17_19;
  reg  [6:0]  br_snapshots_17_20;
  reg  [6:0]  br_snapshots_17_21;
  reg  [6:0]  br_snapshots_17_22;
  reg  [6:0]  br_snapshots_17_23;
  reg  [6:0]  br_snapshots_17_24;
  reg  [6:0]  br_snapshots_17_25;
  reg  [6:0]  br_snapshots_17_26;
  reg  [6:0]  br_snapshots_17_27;
  reg  [6:0]  br_snapshots_17_28;
  reg  [6:0]  br_snapshots_17_29;
  reg  [6:0]  br_snapshots_17_30;
  reg  [6:0]  br_snapshots_17_31;
  reg  [6:0]  br_snapshots_18_0;
  reg  [6:0]  br_snapshots_18_1;
  reg  [6:0]  br_snapshots_18_2;
  reg  [6:0]  br_snapshots_18_3;
  reg  [6:0]  br_snapshots_18_4;
  reg  [6:0]  br_snapshots_18_5;
  reg  [6:0]  br_snapshots_18_6;
  reg  [6:0]  br_snapshots_18_7;
  reg  [6:0]  br_snapshots_18_8;
  reg  [6:0]  br_snapshots_18_9;
  reg  [6:0]  br_snapshots_18_10;
  reg  [6:0]  br_snapshots_18_11;
  reg  [6:0]  br_snapshots_18_12;
  reg  [6:0]  br_snapshots_18_13;
  reg  [6:0]  br_snapshots_18_14;
  reg  [6:0]  br_snapshots_18_15;
  reg  [6:0]  br_snapshots_18_16;
  reg  [6:0]  br_snapshots_18_17;
  reg  [6:0]  br_snapshots_18_18;
  reg  [6:0]  br_snapshots_18_19;
  reg  [6:0]  br_snapshots_18_20;
  reg  [6:0]  br_snapshots_18_21;
  reg  [6:0]  br_snapshots_18_22;
  reg  [6:0]  br_snapshots_18_23;
  reg  [6:0]  br_snapshots_18_24;
  reg  [6:0]  br_snapshots_18_25;
  reg  [6:0]  br_snapshots_18_26;
  reg  [6:0]  br_snapshots_18_27;
  reg  [6:0]  br_snapshots_18_28;
  reg  [6:0]  br_snapshots_18_29;
  reg  [6:0]  br_snapshots_18_30;
  reg  [6:0]  br_snapshots_18_31;
  reg  [6:0]  br_snapshots_19_0;
  reg  [6:0]  br_snapshots_19_1;
  reg  [6:0]  br_snapshots_19_2;
  reg  [6:0]  br_snapshots_19_3;
  reg  [6:0]  br_snapshots_19_4;
  reg  [6:0]  br_snapshots_19_5;
  reg  [6:0]  br_snapshots_19_6;
  reg  [6:0]  br_snapshots_19_7;
  reg  [6:0]  br_snapshots_19_8;
  reg  [6:0]  br_snapshots_19_9;
  reg  [6:0]  br_snapshots_19_10;
  reg  [6:0]  br_snapshots_19_11;
  reg  [6:0]  br_snapshots_19_12;
  reg  [6:0]  br_snapshots_19_13;
  reg  [6:0]  br_snapshots_19_14;
  reg  [6:0]  br_snapshots_19_15;
  reg  [6:0]  br_snapshots_19_16;
  reg  [6:0]  br_snapshots_19_17;
  reg  [6:0]  br_snapshots_19_18;
  reg  [6:0]  br_snapshots_19_19;
  reg  [6:0]  br_snapshots_19_20;
  reg  [6:0]  br_snapshots_19_21;
  reg  [6:0]  br_snapshots_19_22;
  reg  [6:0]  br_snapshots_19_23;
  reg  [6:0]  br_snapshots_19_24;
  reg  [6:0]  br_snapshots_19_25;
  reg  [6:0]  br_snapshots_19_26;
  reg  [6:0]  br_snapshots_19_27;
  reg  [6:0]  br_snapshots_19_28;
  reg  [6:0]  br_snapshots_19_29;
  reg  [6:0]  br_snapshots_19_30;
  reg  [6:0]  br_snapshots_19_31;
  reg  [6:0]  casez_tmp;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp = br_snapshots_0_0;
      5'b00001:
        casez_tmp = br_snapshots_1_0;
      5'b00010:
        casez_tmp = br_snapshots_2_0;
      5'b00011:
        casez_tmp = br_snapshots_3_0;
      5'b00100:
        casez_tmp = br_snapshots_4_0;
      5'b00101:
        casez_tmp = br_snapshots_5_0;
      5'b00110:
        casez_tmp = br_snapshots_6_0;
      5'b00111:
        casez_tmp = br_snapshots_7_0;
      5'b01000:
        casez_tmp = br_snapshots_8_0;
      5'b01001:
        casez_tmp = br_snapshots_9_0;
      5'b01010:
        casez_tmp = br_snapshots_10_0;
      5'b01011:
        casez_tmp = br_snapshots_11_0;
      5'b01100:
        casez_tmp = br_snapshots_12_0;
      5'b01101:
        casez_tmp = br_snapshots_13_0;
      5'b01110:
        casez_tmp = br_snapshots_14_0;
      5'b01111:
        casez_tmp = br_snapshots_15_0;
      5'b10000:
        casez_tmp = br_snapshots_16_0;
      5'b10001:
        casez_tmp = br_snapshots_17_0;
      5'b10010:
        casez_tmp = br_snapshots_18_0;
      5'b10011:
        casez_tmp = br_snapshots_19_0;
      5'b10100:
        casez_tmp = br_snapshots_0_0;
      5'b10101:
        casez_tmp = br_snapshots_0_0;
      5'b10110:
        casez_tmp = br_snapshots_0_0;
      5'b10111:
        casez_tmp = br_snapshots_0_0;
      5'b11000:
        casez_tmp = br_snapshots_0_0;
      5'b11001:
        casez_tmp = br_snapshots_0_0;
      5'b11010:
        casez_tmp = br_snapshots_0_0;
      5'b11011:
        casez_tmp = br_snapshots_0_0;
      5'b11100:
        casez_tmp = br_snapshots_0_0;
      5'b11101:
        casez_tmp = br_snapshots_0_0;
      5'b11110:
        casez_tmp = br_snapshots_0_0;
      default:
        casez_tmp = br_snapshots_0_0;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_0;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_0 = br_snapshots_0_1;
      5'b00001:
        casez_tmp_0 = br_snapshots_1_1;
      5'b00010:
        casez_tmp_0 = br_snapshots_2_1;
      5'b00011:
        casez_tmp_0 = br_snapshots_3_1;
      5'b00100:
        casez_tmp_0 = br_snapshots_4_1;
      5'b00101:
        casez_tmp_0 = br_snapshots_5_1;
      5'b00110:
        casez_tmp_0 = br_snapshots_6_1;
      5'b00111:
        casez_tmp_0 = br_snapshots_7_1;
      5'b01000:
        casez_tmp_0 = br_snapshots_8_1;
      5'b01001:
        casez_tmp_0 = br_snapshots_9_1;
      5'b01010:
        casez_tmp_0 = br_snapshots_10_1;
      5'b01011:
        casez_tmp_0 = br_snapshots_11_1;
      5'b01100:
        casez_tmp_0 = br_snapshots_12_1;
      5'b01101:
        casez_tmp_0 = br_snapshots_13_1;
      5'b01110:
        casez_tmp_0 = br_snapshots_14_1;
      5'b01111:
        casez_tmp_0 = br_snapshots_15_1;
      5'b10000:
        casez_tmp_0 = br_snapshots_16_1;
      5'b10001:
        casez_tmp_0 = br_snapshots_17_1;
      5'b10010:
        casez_tmp_0 = br_snapshots_18_1;
      5'b10011:
        casez_tmp_0 = br_snapshots_19_1;
      5'b10100:
        casez_tmp_0 = br_snapshots_0_1;
      5'b10101:
        casez_tmp_0 = br_snapshots_0_1;
      5'b10110:
        casez_tmp_0 = br_snapshots_0_1;
      5'b10111:
        casez_tmp_0 = br_snapshots_0_1;
      5'b11000:
        casez_tmp_0 = br_snapshots_0_1;
      5'b11001:
        casez_tmp_0 = br_snapshots_0_1;
      5'b11010:
        casez_tmp_0 = br_snapshots_0_1;
      5'b11011:
        casez_tmp_0 = br_snapshots_0_1;
      5'b11100:
        casez_tmp_0 = br_snapshots_0_1;
      5'b11101:
        casez_tmp_0 = br_snapshots_0_1;
      5'b11110:
        casez_tmp_0 = br_snapshots_0_1;
      default:
        casez_tmp_0 = br_snapshots_0_1;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_1;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_1 = br_snapshots_0_2;
      5'b00001:
        casez_tmp_1 = br_snapshots_1_2;
      5'b00010:
        casez_tmp_1 = br_snapshots_2_2;
      5'b00011:
        casez_tmp_1 = br_snapshots_3_2;
      5'b00100:
        casez_tmp_1 = br_snapshots_4_2;
      5'b00101:
        casez_tmp_1 = br_snapshots_5_2;
      5'b00110:
        casez_tmp_1 = br_snapshots_6_2;
      5'b00111:
        casez_tmp_1 = br_snapshots_7_2;
      5'b01000:
        casez_tmp_1 = br_snapshots_8_2;
      5'b01001:
        casez_tmp_1 = br_snapshots_9_2;
      5'b01010:
        casez_tmp_1 = br_snapshots_10_2;
      5'b01011:
        casez_tmp_1 = br_snapshots_11_2;
      5'b01100:
        casez_tmp_1 = br_snapshots_12_2;
      5'b01101:
        casez_tmp_1 = br_snapshots_13_2;
      5'b01110:
        casez_tmp_1 = br_snapshots_14_2;
      5'b01111:
        casez_tmp_1 = br_snapshots_15_2;
      5'b10000:
        casez_tmp_1 = br_snapshots_16_2;
      5'b10001:
        casez_tmp_1 = br_snapshots_17_2;
      5'b10010:
        casez_tmp_1 = br_snapshots_18_2;
      5'b10011:
        casez_tmp_1 = br_snapshots_19_2;
      5'b10100:
        casez_tmp_1 = br_snapshots_0_2;
      5'b10101:
        casez_tmp_1 = br_snapshots_0_2;
      5'b10110:
        casez_tmp_1 = br_snapshots_0_2;
      5'b10111:
        casez_tmp_1 = br_snapshots_0_2;
      5'b11000:
        casez_tmp_1 = br_snapshots_0_2;
      5'b11001:
        casez_tmp_1 = br_snapshots_0_2;
      5'b11010:
        casez_tmp_1 = br_snapshots_0_2;
      5'b11011:
        casez_tmp_1 = br_snapshots_0_2;
      5'b11100:
        casez_tmp_1 = br_snapshots_0_2;
      5'b11101:
        casez_tmp_1 = br_snapshots_0_2;
      5'b11110:
        casez_tmp_1 = br_snapshots_0_2;
      default:
        casez_tmp_1 = br_snapshots_0_2;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_2;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_2 = br_snapshots_0_3;
      5'b00001:
        casez_tmp_2 = br_snapshots_1_3;
      5'b00010:
        casez_tmp_2 = br_snapshots_2_3;
      5'b00011:
        casez_tmp_2 = br_snapshots_3_3;
      5'b00100:
        casez_tmp_2 = br_snapshots_4_3;
      5'b00101:
        casez_tmp_2 = br_snapshots_5_3;
      5'b00110:
        casez_tmp_2 = br_snapshots_6_3;
      5'b00111:
        casez_tmp_2 = br_snapshots_7_3;
      5'b01000:
        casez_tmp_2 = br_snapshots_8_3;
      5'b01001:
        casez_tmp_2 = br_snapshots_9_3;
      5'b01010:
        casez_tmp_2 = br_snapshots_10_3;
      5'b01011:
        casez_tmp_2 = br_snapshots_11_3;
      5'b01100:
        casez_tmp_2 = br_snapshots_12_3;
      5'b01101:
        casez_tmp_2 = br_snapshots_13_3;
      5'b01110:
        casez_tmp_2 = br_snapshots_14_3;
      5'b01111:
        casez_tmp_2 = br_snapshots_15_3;
      5'b10000:
        casez_tmp_2 = br_snapshots_16_3;
      5'b10001:
        casez_tmp_2 = br_snapshots_17_3;
      5'b10010:
        casez_tmp_2 = br_snapshots_18_3;
      5'b10011:
        casez_tmp_2 = br_snapshots_19_3;
      5'b10100:
        casez_tmp_2 = br_snapshots_0_3;
      5'b10101:
        casez_tmp_2 = br_snapshots_0_3;
      5'b10110:
        casez_tmp_2 = br_snapshots_0_3;
      5'b10111:
        casez_tmp_2 = br_snapshots_0_3;
      5'b11000:
        casez_tmp_2 = br_snapshots_0_3;
      5'b11001:
        casez_tmp_2 = br_snapshots_0_3;
      5'b11010:
        casez_tmp_2 = br_snapshots_0_3;
      5'b11011:
        casez_tmp_2 = br_snapshots_0_3;
      5'b11100:
        casez_tmp_2 = br_snapshots_0_3;
      5'b11101:
        casez_tmp_2 = br_snapshots_0_3;
      5'b11110:
        casez_tmp_2 = br_snapshots_0_3;
      default:
        casez_tmp_2 = br_snapshots_0_3;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_3;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_3 = br_snapshots_0_4;
      5'b00001:
        casez_tmp_3 = br_snapshots_1_4;
      5'b00010:
        casez_tmp_3 = br_snapshots_2_4;
      5'b00011:
        casez_tmp_3 = br_snapshots_3_4;
      5'b00100:
        casez_tmp_3 = br_snapshots_4_4;
      5'b00101:
        casez_tmp_3 = br_snapshots_5_4;
      5'b00110:
        casez_tmp_3 = br_snapshots_6_4;
      5'b00111:
        casez_tmp_3 = br_snapshots_7_4;
      5'b01000:
        casez_tmp_3 = br_snapshots_8_4;
      5'b01001:
        casez_tmp_3 = br_snapshots_9_4;
      5'b01010:
        casez_tmp_3 = br_snapshots_10_4;
      5'b01011:
        casez_tmp_3 = br_snapshots_11_4;
      5'b01100:
        casez_tmp_3 = br_snapshots_12_4;
      5'b01101:
        casez_tmp_3 = br_snapshots_13_4;
      5'b01110:
        casez_tmp_3 = br_snapshots_14_4;
      5'b01111:
        casez_tmp_3 = br_snapshots_15_4;
      5'b10000:
        casez_tmp_3 = br_snapshots_16_4;
      5'b10001:
        casez_tmp_3 = br_snapshots_17_4;
      5'b10010:
        casez_tmp_3 = br_snapshots_18_4;
      5'b10011:
        casez_tmp_3 = br_snapshots_19_4;
      5'b10100:
        casez_tmp_3 = br_snapshots_0_4;
      5'b10101:
        casez_tmp_3 = br_snapshots_0_4;
      5'b10110:
        casez_tmp_3 = br_snapshots_0_4;
      5'b10111:
        casez_tmp_3 = br_snapshots_0_4;
      5'b11000:
        casez_tmp_3 = br_snapshots_0_4;
      5'b11001:
        casez_tmp_3 = br_snapshots_0_4;
      5'b11010:
        casez_tmp_3 = br_snapshots_0_4;
      5'b11011:
        casez_tmp_3 = br_snapshots_0_4;
      5'b11100:
        casez_tmp_3 = br_snapshots_0_4;
      5'b11101:
        casez_tmp_3 = br_snapshots_0_4;
      5'b11110:
        casez_tmp_3 = br_snapshots_0_4;
      default:
        casez_tmp_3 = br_snapshots_0_4;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_4;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_4 = br_snapshots_0_5;
      5'b00001:
        casez_tmp_4 = br_snapshots_1_5;
      5'b00010:
        casez_tmp_4 = br_snapshots_2_5;
      5'b00011:
        casez_tmp_4 = br_snapshots_3_5;
      5'b00100:
        casez_tmp_4 = br_snapshots_4_5;
      5'b00101:
        casez_tmp_4 = br_snapshots_5_5;
      5'b00110:
        casez_tmp_4 = br_snapshots_6_5;
      5'b00111:
        casez_tmp_4 = br_snapshots_7_5;
      5'b01000:
        casez_tmp_4 = br_snapshots_8_5;
      5'b01001:
        casez_tmp_4 = br_snapshots_9_5;
      5'b01010:
        casez_tmp_4 = br_snapshots_10_5;
      5'b01011:
        casez_tmp_4 = br_snapshots_11_5;
      5'b01100:
        casez_tmp_4 = br_snapshots_12_5;
      5'b01101:
        casez_tmp_4 = br_snapshots_13_5;
      5'b01110:
        casez_tmp_4 = br_snapshots_14_5;
      5'b01111:
        casez_tmp_4 = br_snapshots_15_5;
      5'b10000:
        casez_tmp_4 = br_snapshots_16_5;
      5'b10001:
        casez_tmp_4 = br_snapshots_17_5;
      5'b10010:
        casez_tmp_4 = br_snapshots_18_5;
      5'b10011:
        casez_tmp_4 = br_snapshots_19_5;
      5'b10100:
        casez_tmp_4 = br_snapshots_0_5;
      5'b10101:
        casez_tmp_4 = br_snapshots_0_5;
      5'b10110:
        casez_tmp_4 = br_snapshots_0_5;
      5'b10111:
        casez_tmp_4 = br_snapshots_0_5;
      5'b11000:
        casez_tmp_4 = br_snapshots_0_5;
      5'b11001:
        casez_tmp_4 = br_snapshots_0_5;
      5'b11010:
        casez_tmp_4 = br_snapshots_0_5;
      5'b11011:
        casez_tmp_4 = br_snapshots_0_5;
      5'b11100:
        casez_tmp_4 = br_snapshots_0_5;
      5'b11101:
        casez_tmp_4 = br_snapshots_0_5;
      5'b11110:
        casez_tmp_4 = br_snapshots_0_5;
      default:
        casez_tmp_4 = br_snapshots_0_5;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_5;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_5 = br_snapshots_0_6;
      5'b00001:
        casez_tmp_5 = br_snapshots_1_6;
      5'b00010:
        casez_tmp_5 = br_snapshots_2_6;
      5'b00011:
        casez_tmp_5 = br_snapshots_3_6;
      5'b00100:
        casez_tmp_5 = br_snapshots_4_6;
      5'b00101:
        casez_tmp_5 = br_snapshots_5_6;
      5'b00110:
        casez_tmp_5 = br_snapshots_6_6;
      5'b00111:
        casez_tmp_5 = br_snapshots_7_6;
      5'b01000:
        casez_tmp_5 = br_snapshots_8_6;
      5'b01001:
        casez_tmp_5 = br_snapshots_9_6;
      5'b01010:
        casez_tmp_5 = br_snapshots_10_6;
      5'b01011:
        casez_tmp_5 = br_snapshots_11_6;
      5'b01100:
        casez_tmp_5 = br_snapshots_12_6;
      5'b01101:
        casez_tmp_5 = br_snapshots_13_6;
      5'b01110:
        casez_tmp_5 = br_snapshots_14_6;
      5'b01111:
        casez_tmp_5 = br_snapshots_15_6;
      5'b10000:
        casez_tmp_5 = br_snapshots_16_6;
      5'b10001:
        casez_tmp_5 = br_snapshots_17_6;
      5'b10010:
        casez_tmp_5 = br_snapshots_18_6;
      5'b10011:
        casez_tmp_5 = br_snapshots_19_6;
      5'b10100:
        casez_tmp_5 = br_snapshots_0_6;
      5'b10101:
        casez_tmp_5 = br_snapshots_0_6;
      5'b10110:
        casez_tmp_5 = br_snapshots_0_6;
      5'b10111:
        casez_tmp_5 = br_snapshots_0_6;
      5'b11000:
        casez_tmp_5 = br_snapshots_0_6;
      5'b11001:
        casez_tmp_5 = br_snapshots_0_6;
      5'b11010:
        casez_tmp_5 = br_snapshots_0_6;
      5'b11011:
        casez_tmp_5 = br_snapshots_0_6;
      5'b11100:
        casez_tmp_5 = br_snapshots_0_6;
      5'b11101:
        casez_tmp_5 = br_snapshots_0_6;
      5'b11110:
        casez_tmp_5 = br_snapshots_0_6;
      default:
        casez_tmp_5 = br_snapshots_0_6;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_6;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_6 = br_snapshots_0_7;
      5'b00001:
        casez_tmp_6 = br_snapshots_1_7;
      5'b00010:
        casez_tmp_6 = br_snapshots_2_7;
      5'b00011:
        casez_tmp_6 = br_snapshots_3_7;
      5'b00100:
        casez_tmp_6 = br_snapshots_4_7;
      5'b00101:
        casez_tmp_6 = br_snapshots_5_7;
      5'b00110:
        casez_tmp_6 = br_snapshots_6_7;
      5'b00111:
        casez_tmp_6 = br_snapshots_7_7;
      5'b01000:
        casez_tmp_6 = br_snapshots_8_7;
      5'b01001:
        casez_tmp_6 = br_snapshots_9_7;
      5'b01010:
        casez_tmp_6 = br_snapshots_10_7;
      5'b01011:
        casez_tmp_6 = br_snapshots_11_7;
      5'b01100:
        casez_tmp_6 = br_snapshots_12_7;
      5'b01101:
        casez_tmp_6 = br_snapshots_13_7;
      5'b01110:
        casez_tmp_6 = br_snapshots_14_7;
      5'b01111:
        casez_tmp_6 = br_snapshots_15_7;
      5'b10000:
        casez_tmp_6 = br_snapshots_16_7;
      5'b10001:
        casez_tmp_6 = br_snapshots_17_7;
      5'b10010:
        casez_tmp_6 = br_snapshots_18_7;
      5'b10011:
        casez_tmp_6 = br_snapshots_19_7;
      5'b10100:
        casez_tmp_6 = br_snapshots_0_7;
      5'b10101:
        casez_tmp_6 = br_snapshots_0_7;
      5'b10110:
        casez_tmp_6 = br_snapshots_0_7;
      5'b10111:
        casez_tmp_6 = br_snapshots_0_7;
      5'b11000:
        casez_tmp_6 = br_snapshots_0_7;
      5'b11001:
        casez_tmp_6 = br_snapshots_0_7;
      5'b11010:
        casez_tmp_6 = br_snapshots_0_7;
      5'b11011:
        casez_tmp_6 = br_snapshots_0_7;
      5'b11100:
        casez_tmp_6 = br_snapshots_0_7;
      5'b11101:
        casez_tmp_6 = br_snapshots_0_7;
      5'b11110:
        casez_tmp_6 = br_snapshots_0_7;
      default:
        casez_tmp_6 = br_snapshots_0_7;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_7;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_7 = br_snapshots_0_8;
      5'b00001:
        casez_tmp_7 = br_snapshots_1_8;
      5'b00010:
        casez_tmp_7 = br_snapshots_2_8;
      5'b00011:
        casez_tmp_7 = br_snapshots_3_8;
      5'b00100:
        casez_tmp_7 = br_snapshots_4_8;
      5'b00101:
        casez_tmp_7 = br_snapshots_5_8;
      5'b00110:
        casez_tmp_7 = br_snapshots_6_8;
      5'b00111:
        casez_tmp_7 = br_snapshots_7_8;
      5'b01000:
        casez_tmp_7 = br_snapshots_8_8;
      5'b01001:
        casez_tmp_7 = br_snapshots_9_8;
      5'b01010:
        casez_tmp_7 = br_snapshots_10_8;
      5'b01011:
        casez_tmp_7 = br_snapshots_11_8;
      5'b01100:
        casez_tmp_7 = br_snapshots_12_8;
      5'b01101:
        casez_tmp_7 = br_snapshots_13_8;
      5'b01110:
        casez_tmp_7 = br_snapshots_14_8;
      5'b01111:
        casez_tmp_7 = br_snapshots_15_8;
      5'b10000:
        casez_tmp_7 = br_snapshots_16_8;
      5'b10001:
        casez_tmp_7 = br_snapshots_17_8;
      5'b10010:
        casez_tmp_7 = br_snapshots_18_8;
      5'b10011:
        casez_tmp_7 = br_snapshots_19_8;
      5'b10100:
        casez_tmp_7 = br_snapshots_0_8;
      5'b10101:
        casez_tmp_7 = br_snapshots_0_8;
      5'b10110:
        casez_tmp_7 = br_snapshots_0_8;
      5'b10111:
        casez_tmp_7 = br_snapshots_0_8;
      5'b11000:
        casez_tmp_7 = br_snapshots_0_8;
      5'b11001:
        casez_tmp_7 = br_snapshots_0_8;
      5'b11010:
        casez_tmp_7 = br_snapshots_0_8;
      5'b11011:
        casez_tmp_7 = br_snapshots_0_8;
      5'b11100:
        casez_tmp_7 = br_snapshots_0_8;
      5'b11101:
        casez_tmp_7 = br_snapshots_0_8;
      5'b11110:
        casez_tmp_7 = br_snapshots_0_8;
      default:
        casez_tmp_7 = br_snapshots_0_8;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_8;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_8 = br_snapshots_0_9;
      5'b00001:
        casez_tmp_8 = br_snapshots_1_9;
      5'b00010:
        casez_tmp_8 = br_snapshots_2_9;
      5'b00011:
        casez_tmp_8 = br_snapshots_3_9;
      5'b00100:
        casez_tmp_8 = br_snapshots_4_9;
      5'b00101:
        casez_tmp_8 = br_snapshots_5_9;
      5'b00110:
        casez_tmp_8 = br_snapshots_6_9;
      5'b00111:
        casez_tmp_8 = br_snapshots_7_9;
      5'b01000:
        casez_tmp_8 = br_snapshots_8_9;
      5'b01001:
        casez_tmp_8 = br_snapshots_9_9;
      5'b01010:
        casez_tmp_8 = br_snapshots_10_9;
      5'b01011:
        casez_tmp_8 = br_snapshots_11_9;
      5'b01100:
        casez_tmp_8 = br_snapshots_12_9;
      5'b01101:
        casez_tmp_8 = br_snapshots_13_9;
      5'b01110:
        casez_tmp_8 = br_snapshots_14_9;
      5'b01111:
        casez_tmp_8 = br_snapshots_15_9;
      5'b10000:
        casez_tmp_8 = br_snapshots_16_9;
      5'b10001:
        casez_tmp_8 = br_snapshots_17_9;
      5'b10010:
        casez_tmp_8 = br_snapshots_18_9;
      5'b10011:
        casez_tmp_8 = br_snapshots_19_9;
      5'b10100:
        casez_tmp_8 = br_snapshots_0_9;
      5'b10101:
        casez_tmp_8 = br_snapshots_0_9;
      5'b10110:
        casez_tmp_8 = br_snapshots_0_9;
      5'b10111:
        casez_tmp_8 = br_snapshots_0_9;
      5'b11000:
        casez_tmp_8 = br_snapshots_0_9;
      5'b11001:
        casez_tmp_8 = br_snapshots_0_9;
      5'b11010:
        casez_tmp_8 = br_snapshots_0_9;
      5'b11011:
        casez_tmp_8 = br_snapshots_0_9;
      5'b11100:
        casez_tmp_8 = br_snapshots_0_9;
      5'b11101:
        casez_tmp_8 = br_snapshots_0_9;
      5'b11110:
        casez_tmp_8 = br_snapshots_0_9;
      default:
        casez_tmp_8 = br_snapshots_0_9;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_9;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_9 = br_snapshots_0_10;
      5'b00001:
        casez_tmp_9 = br_snapshots_1_10;
      5'b00010:
        casez_tmp_9 = br_snapshots_2_10;
      5'b00011:
        casez_tmp_9 = br_snapshots_3_10;
      5'b00100:
        casez_tmp_9 = br_snapshots_4_10;
      5'b00101:
        casez_tmp_9 = br_snapshots_5_10;
      5'b00110:
        casez_tmp_9 = br_snapshots_6_10;
      5'b00111:
        casez_tmp_9 = br_snapshots_7_10;
      5'b01000:
        casez_tmp_9 = br_snapshots_8_10;
      5'b01001:
        casez_tmp_9 = br_snapshots_9_10;
      5'b01010:
        casez_tmp_9 = br_snapshots_10_10;
      5'b01011:
        casez_tmp_9 = br_snapshots_11_10;
      5'b01100:
        casez_tmp_9 = br_snapshots_12_10;
      5'b01101:
        casez_tmp_9 = br_snapshots_13_10;
      5'b01110:
        casez_tmp_9 = br_snapshots_14_10;
      5'b01111:
        casez_tmp_9 = br_snapshots_15_10;
      5'b10000:
        casez_tmp_9 = br_snapshots_16_10;
      5'b10001:
        casez_tmp_9 = br_snapshots_17_10;
      5'b10010:
        casez_tmp_9 = br_snapshots_18_10;
      5'b10011:
        casez_tmp_9 = br_snapshots_19_10;
      5'b10100:
        casez_tmp_9 = br_snapshots_0_10;
      5'b10101:
        casez_tmp_9 = br_snapshots_0_10;
      5'b10110:
        casez_tmp_9 = br_snapshots_0_10;
      5'b10111:
        casez_tmp_9 = br_snapshots_0_10;
      5'b11000:
        casez_tmp_9 = br_snapshots_0_10;
      5'b11001:
        casez_tmp_9 = br_snapshots_0_10;
      5'b11010:
        casez_tmp_9 = br_snapshots_0_10;
      5'b11011:
        casez_tmp_9 = br_snapshots_0_10;
      5'b11100:
        casez_tmp_9 = br_snapshots_0_10;
      5'b11101:
        casez_tmp_9 = br_snapshots_0_10;
      5'b11110:
        casez_tmp_9 = br_snapshots_0_10;
      default:
        casez_tmp_9 = br_snapshots_0_10;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_10;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_10 = br_snapshots_0_11;
      5'b00001:
        casez_tmp_10 = br_snapshots_1_11;
      5'b00010:
        casez_tmp_10 = br_snapshots_2_11;
      5'b00011:
        casez_tmp_10 = br_snapshots_3_11;
      5'b00100:
        casez_tmp_10 = br_snapshots_4_11;
      5'b00101:
        casez_tmp_10 = br_snapshots_5_11;
      5'b00110:
        casez_tmp_10 = br_snapshots_6_11;
      5'b00111:
        casez_tmp_10 = br_snapshots_7_11;
      5'b01000:
        casez_tmp_10 = br_snapshots_8_11;
      5'b01001:
        casez_tmp_10 = br_snapshots_9_11;
      5'b01010:
        casez_tmp_10 = br_snapshots_10_11;
      5'b01011:
        casez_tmp_10 = br_snapshots_11_11;
      5'b01100:
        casez_tmp_10 = br_snapshots_12_11;
      5'b01101:
        casez_tmp_10 = br_snapshots_13_11;
      5'b01110:
        casez_tmp_10 = br_snapshots_14_11;
      5'b01111:
        casez_tmp_10 = br_snapshots_15_11;
      5'b10000:
        casez_tmp_10 = br_snapshots_16_11;
      5'b10001:
        casez_tmp_10 = br_snapshots_17_11;
      5'b10010:
        casez_tmp_10 = br_snapshots_18_11;
      5'b10011:
        casez_tmp_10 = br_snapshots_19_11;
      5'b10100:
        casez_tmp_10 = br_snapshots_0_11;
      5'b10101:
        casez_tmp_10 = br_snapshots_0_11;
      5'b10110:
        casez_tmp_10 = br_snapshots_0_11;
      5'b10111:
        casez_tmp_10 = br_snapshots_0_11;
      5'b11000:
        casez_tmp_10 = br_snapshots_0_11;
      5'b11001:
        casez_tmp_10 = br_snapshots_0_11;
      5'b11010:
        casez_tmp_10 = br_snapshots_0_11;
      5'b11011:
        casez_tmp_10 = br_snapshots_0_11;
      5'b11100:
        casez_tmp_10 = br_snapshots_0_11;
      5'b11101:
        casez_tmp_10 = br_snapshots_0_11;
      5'b11110:
        casez_tmp_10 = br_snapshots_0_11;
      default:
        casez_tmp_10 = br_snapshots_0_11;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_11;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_11 = br_snapshots_0_12;
      5'b00001:
        casez_tmp_11 = br_snapshots_1_12;
      5'b00010:
        casez_tmp_11 = br_snapshots_2_12;
      5'b00011:
        casez_tmp_11 = br_snapshots_3_12;
      5'b00100:
        casez_tmp_11 = br_snapshots_4_12;
      5'b00101:
        casez_tmp_11 = br_snapshots_5_12;
      5'b00110:
        casez_tmp_11 = br_snapshots_6_12;
      5'b00111:
        casez_tmp_11 = br_snapshots_7_12;
      5'b01000:
        casez_tmp_11 = br_snapshots_8_12;
      5'b01001:
        casez_tmp_11 = br_snapshots_9_12;
      5'b01010:
        casez_tmp_11 = br_snapshots_10_12;
      5'b01011:
        casez_tmp_11 = br_snapshots_11_12;
      5'b01100:
        casez_tmp_11 = br_snapshots_12_12;
      5'b01101:
        casez_tmp_11 = br_snapshots_13_12;
      5'b01110:
        casez_tmp_11 = br_snapshots_14_12;
      5'b01111:
        casez_tmp_11 = br_snapshots_15_12;
      5'b10000:
        casez_tmp_11 = br_snapshots_16_12;
      5'b10001:
        casez_tmp_11 = br_snapshots_17_12;
      5'b10010:
        casez_tmp_11 = br_snapshots_18_12;
      5'b10011:
        casez_tmp_11 = br_snapshots_19_12;
      5'b10100:
        casez_tmp_11 = br_snapshots_0_12;
      5'b10101:
        casez_tmp_11 = br_snapshots_0_12;
      5'b10110:
        casez_tmp_11 = br_snapshots_0_12;
      5'b10111:
        casez_tmp_11 = br_snapshots_0_12;
      5'b11000:
        casez_tmp_11 = br_snapshots_0_12;
      5'b11001:
        casez_tmp_11 = br_snapshots_0_12;
      5'b11010:
        casez_tmp_11 = br_snapshots_0_12;
      5'b11011:
        casez_tmp_11 = br_snapshots_0_12;
      5'b11100:
        casez_tmp_11 = br_snapshots_0_12;
      5'b11101:
        casez_tmp_11 = br_snapshots_0_12;
      5'b11110:
        casez_tmp_11 = br_snapshots_0_12;
      default:
        casez_tmp_11 = br_snapshots_0_12;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_12;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_12 = br_snapshots_0_13;
      5'b00001:
        casez_tmp_12 = br_snapshots_1_13;
      5'b00010:
        casez_tmp_12 = br_snapshots_2_13;
      5'b00011:
        casez_tmp_12 = br_snapshots_3_13;
      5'b00100:
        casez_tmp_12 = br_snapshots_4_13;
      5'b00101:
        casez_tmp_12 = br_snapshots_5_13;
      5'b00110:
        casez_tmp_12 = br_snapshots_6_13;
      5'b00111:
        casez_tmp_12 = br_snapshots_7_13;
      5'b01000:
        casez_tmp_12 = br_snapshots_8_13;
      5'b01001:
        casez_tmp_12 = br_snapshots_9_13;
      5'b01010:
        casez_tmp_12 = br_snapshots_10_13;
      5'b01011:
        casez_tmp_12 = br_snapshots_11_13;
      5'b01100:
        casez_tmp_12 = br_snapshots_12_13;
      5'b01101:
        casez_tmp_12 = br_snapshots_13_13;
      5'b01110:
        casez_tmp_12 = br_snapshots_14_13;
      5'b01111:
        casez_tmp_12 = br_snapshots_15_13;
      5'b10000:
        casez_tmp_12 = br_snapshots_16_13;
      5'b10001:
        casez_tmp_12 = br_snapshots_17_13;
      5'b10010:
        casez_tmp_12 = br_snapshots_18_13;
      5'b10011:
        casez_tmp_12 = br_snapshots_19_13;
      5'b10100:
        casez_tmp_12 = br_snapshots_0_13;
      5'b10101:
        casez_tmp_12 = br_snapshots_0_13;
      5'b10110:
        casez_tmp_12 = br_snapshots_0_13;
      5'b10111:
        casez_tmp_12 = br_snapshots_0_13;
      5'b11000:
        casez_tmp_12 = br_snapshots_0_13;
      5'b11001:
        casez_tmp_12 = br_snapshots_0_13;
      5'b11010:
        casez_tmp_12 = br_snapshots_0_13;
      5'b11011:
        casez_tmp_12 = br_snapshots_0_13;
      5'b11100:
        casez_tmp_12 = br_snapshots_0_13;
      5'b11101:
        casez_tmp_12 = br_snapshots_0_13;
      5'b11110:
        casez_tmp_12 = br_snapshots_0_13;
      default:
        casez_tmp_12 = br_snapshots_0_13;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_13;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_13 = br_snapshots_0_14;
      5'b00001:
        casez_tmp_13 = br_snapshots_1_14;
      5'b00010:
        casez_tmp_13 = br_snapshots_2_14;
      5'b00011:
        casez_tmp_13 = br_snapshots_3_14;
      5'b00100:
        casez_tmp_13 = br_snapshots_4_14;
      5'b00101:
        casez_tmp_13 = br_snapshots_5_14;
      5'b00110:
        casez_tmp_13 = br_snapshots_6_14;
      5'b00111:
        casez_tmp_13 = br_snapshots_7_14;
      5'b01000:
        casez_tmp_13 = br_snapshots_8_14;
      5'b01001:
        casez_tmp_13 = br_snapshots_9_14;
      5'b01010:
        casez_tmp_13 = br_snapshots_10_14;
      5'b01011:
        casez_tmp_13 = br_snapshots_11_14;
      5'b01100:
        casez_tmp_13 = br_snapshots_12_14;
      5'b01101:
        casez_tmp_13 = br_snapshots_13_14;
      5'b01110:
        casez_tmp_13 = br_snapshots_14_14;
      5'b01111:
        casez_tmp_13 = br_snapshots_15_14;
      5'b10000:
        casez_tmp_13 = br_snapshots_16_14;
      5'b10001:
        casez_tmp_13 = br_snapshots_17_14;
      5'b10010:
        casez_tmp_13 = br_snapshots_18_14;
      5'b10011:
        casez_tmp_13 = br_snapshots_19_14;
      5'b10100:
        casez_tmp_13 = br_snapshots_0_14;
      5'b10101:
        casez_tmp_13 = br_snapshots_0_14;
      5'b10110:
        casez_tmp_13 = br_snapshots_0_14;
      5'b10111:
        casez_tmp_13 = br_snapshots_0_14;
      5'b11000:
        casez_tmp_13 = br_snapshots_0_14;
      5'b11001:
        casez_tmp_13 = br_snapshots_0_14;
      5'b11010:
        casez_tmp_13 = br_snapshots_0_14;
      5'b11011:
        casez_tmp_13 = br_snapshots_0_14;
      5'b11100:
        casez_tmp_13 = br_snapshots_0_14;
      5'b11101:
        casez_tmp_13 = br_snapshots_0_14;
      5'b11110:
        casez_tmp_13 = br_snapshots_0_14;
      default:
        casez_tmp_13 = br_snapshots_0_14;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_14;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_14 = br_snapshots_0_15;
      5'b00001:
        casez_tmp_14 = br_snapshots_1_15;
      5'b00010:
        casez_tmp_14 = br_snapshots_2_15;
      5'b00011:
        casez_tmp_14 = br_snapshots_3_15;
      5'b00100:
        casez_tmp_14 = br_snapshots_4_15;
      5'b00101:
        casez_tmp_14 = br_snapshots_5_15;
      5'b00110:
        casez_tmp_14 = br_snapshots_6_15;
      5'b00111:
        casez_tmp_14 = br_snapshots_7_15;
      5'b01000:
        casez_tmp_14 = br_snapshots_8_15;
      5'b01001:
        casez_tmp_14 = br_snapshots_9_15;
      5'b01010:
        casez_tmp_14 = br_snapshots_10_15;
      5'b01011:
        casez_tmp_14 = br_snapshots_11_15;
      5'b01100:
        casez_tmp_14 = br_snapshots_12_15;
      5'b01101:
        casez_tmp_14 = br_snapshots_13_15;
      5'b01110:
        casez_tmp_14 = br_snapshots_14_15;
      5'b01111:
        casez_tmp_14 = br_snapshots_15_15;
      5'b10000:
        casez_tmp_14 = br_snapshots_16_15;
      5'b10001:
        casez_tmp_14 = br_snapshots_17_15;
      5'b10010:
        casez_tmp_14 = br_snapshots_18_15;
      5'b10011:
        casez_tmp_14 = br_snapshots_19_15;
      5'b10100:
        casez_tmp_14 = br_snapshots_0_15;
      5'b10101:
        casez_tmp_14 = br_snapshots_0_15;
      5'b10110:
        casez_tmp_14 = br_snapshots_0_15;
      5'b10111:
        casez_tmp_14 = br_snapshots_0_15;
      5'b11000:
        casez_tmp_14 = br_snapshots_0_15;
      5'b11001:
        casez_tmp_14 = br_snapshots_0_15;
      5'b11010:
        casez_tmp_14 = br_snapshots_0_15;
      5'b11011:
        casez_tmp_14 = br_snapshots_0_15;
      5'b11100:
        casez_tmp_14 = br_snapshots_0_15;
      5'b11101:
        casez_tmp_14 = br_snapshots_0_15;
      5'b11110:
        casez_tmp_14 = br_snapshots_0_15;
      default:
        casez_tmp_14 = br_snapshots_0_15;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_15;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_15 = br_snapshots_0_16;
      5'b00001:
        casez_tmp_15 = br_snapshots_1_16;
      5'b00010:
        casez_tmp_15 = br_snapshots_2_16;
      5'b00011:
        casez_tmp_15 = br_snapshots_3_16;
      5'b00100:
        casez_tmp_15 = br_snapshots_4_16;
      5'b00101:
        casez_tmp_15 = br_snapshots_5_16;
      5'b00110:
        casez_tmp_15 = br_snapshots_6_16;
      5'b00111:
        casez_tmp_15 = br_snapshots_7_16;
      5'b01000:
        casez_tmp_15 = br_snapshots_8_16;
      5'b01001:
        casez_tmp_15 = br_snapshots_9_16;
      5'b01010:
        casez_tmp_15 = br_snapshots_10_16;
      5'b01011:
        casez_tmp_15 = br_snapshots_11_16;
      5'b01100:
        casez_tmp_15 = br_snapshots_12_16;
      5'b01101:
        casez_tmp_15 = br_snapshots_13_16;
      5'b01110:
        casez_tmp_15 = br_snapshots_14_16;
      5'b01111:
        casez_tmp_15 = br_snapshots_15_16;
      5'b10000:
        casez_tmp_15 = br_snapshots_16_16;
      5'b10001:
        casez_tmp_15 = br_snapshots_17_16;
      5'b10010:
        casez_tmp_15 = br_snapshots_18_16;
      5'b10011:
        casez_tmp_15 = br_snapshots_19_16;
      5'b10100:
        casez_tmp_15 = br_snapshots_0_16;
      5'b10101:
        casez_tmp_15 = br_snapshots_0_16;
      5'b10110:
        casez_tmp_15 = br_snapshots_0_16;
      5'b10111:
        casez_tmp_15 = br_snapshots_0_16;
      5'b11000:
        casez_tmp_15 = br_snapshots_0_16;
      5'b11001:
        casez_tmp_15 = br_snapshots_0_16;
      5'b11010:
        casez_tmp_15 = br_snapshots_0_16;
      5'b11011:
        casez_tmp_15 = br_snapshots_0_16;
      5'b11100:
        casez_tmp_15 = br_snapshots_0_16;
      5'b11101:
        casez_tmp_15 = br_snapshots_0_16;
      5'b11110:
        casez_tmp_15 = br_snapshots_0_16;
      default:
        casez_tmp_15 = br_snapshots_0_16;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_16;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_16 = br_snapshots_0_17;
      5'b00001:
        casez_tmp_16 = br_snapshots_1_17;
      5'b00010:
        casez_tmp_16 = br_snapshots_2_17;
      5'b00011:
        casez_tmp_16 = br_snapshots_3_17;
      5'b00100:
        casez_tmp_16 = br_snapshots_4_17;
      5'b00101:
        casez_tmp_16 = br_snapshots_5_17;
      5'b00110:
        casez_tmp_16 = br_snapshots_6_17;
      5'b00111:
        casez_tmp_16 = br_snapshots_7_17;
      5'b01000:
        casez_tmp_16 = br_snapshots_8_17;
      5'b01001:
        casez_tmp_16 = br_snapshots_9_17;
      5'b01010:
        casez_tmp_16 = br_snapshots_10_17;
      5'b01011:
        casez_tmp_16 = br_snapshots_11_17;
      5'b01100:
        casez_tmp_16 = br_snapshots_12_17;
      5'b01101:
        casez_tmp_16 = br_snapshots_13_17;
      5'b01110:
        casez_tmp_16 = br_snapshots_14_17;
      5'b01111:
        casez_tmp_16 = br_snapshots_15_17;
      5'b10000:
        casez_tmp_16 = br_snapshots_16_17;
      5'b10001:
        casez_tmp_16 = br_snapshots_17_17;
      5'b10010:
        casez_tmp_16 = br_snapshots_18_17;
      5'b10011:
        casez_tmp_16 = br_snapshots_19_17;
      5'b10100:
        casez_tmp_16 = br_snapshots_0_17;
      5'b10101:
        casez_tmp_16 = br_snapshots_0_17;
      5'b10110:
        casez_tmp_16 = br_snapshots_0_17;
      5'b10111:
        casez_tmp_16 = br_snapshots_0_17;
      5'b11000:
        casez_tmp_16 = br_snapshots_0_17;
      5'b11001:
        casez_tmp_16 = br_snapshots_0_17;
      5'b11010:
        casez_tmp_16 = br_snapshots_0_17;
      5'b11011:
        casez_tmp_16 = br_snapshots_0_17;
      5'b11100:
        casez_tmp_16 = br_snapshots_0_17;
      5'b11101:
        casez_tmp_16 = br_snapshots_0_17;
      5'b11110:
        casez_tmp_16 = br_snapshots_0_17;
      default:
        casez_tmp_16 = br_snapshots_0_17;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_17;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_17 = br_snapshots_0_18;
      5'b00001:
        casez_tmp_17 = br_snapshots_1_18;
      5'b00010:
        casez_tmp_17 = br_snapshots_2_18;
      5'b00011:
        casez_tmp_17 = br_snapshots_3_18;
      5'b00100:
        casez_tmp_17 = br_snapshots_4_18;
      5'b00101:
        casez_tmp_17 = br_snapshots_5_18;
      5'b00110:
        casez_tmp_17 = br_snapshots_6_18;
      5'b00111:
        casez_tmp_17 = br_snapshots_7_18;
      5'b01000:
        casez_tmp_17 = br_snapshots_8_18;
      5'b01001:
        casez_tmp_17 = br_snapshots_9_18;
      5'b01010:
        casez_tmp_17 = br_snapshots_10_18;
      5'b01011:
        casez_tmp_17 = br_snapshots_11_18;
      5'b01100:
        casez_tmp_17 = br_snapshots_12_18;
      5'b01101:
        casez_tmp_17 = br_snapshots_13_18;
      5'b01110:
        casez_tmp_17 = br_snapshots_14_18;
      5'b01111:
        casez_tmp_17 = br_snapshots_15_18;
      5'b10000:
        casez_tmp_17 = br_snapshots_16_18;
      5'b10001:
        casez_tmp_17 = br_snapshots_17_18;
      5'b10010:
        casez_tmp_17 = br_snapshots_18_18;
      5'b10011:
        casez_tmp_17 = br_snapshots_19_18;
      5'b10100:
        casez_tmp_17 = br_snapshots_0_18;
      5'b10101:
        casez_tmp_17 = br_snapshots_0_18;
      5'b10110:
        casez_tmp_17 = br_snapshots_0_18;
      5'b10111:
        casez_tmp_17 = br_snapshots_0_18;
      5'b11000:
        casez_tmp_17 = br_snapshots_0_18;
      5'b11001:
        casez_tmp_17 = br_snapshots_0_18;
      5'b11010:
        casez_tmp_17 = br_snapshots_0_18;
      5'b11011:
        casez_tmp_17 = br_snapshots_0_18;
      5'b11100:
        casez_tmp_17 = br_snapshots_0_18;
      5'b11101:
        casez_tmp_17 = br_snapshots_0_18;
      5'b11110:
        casez_tmp_17 = br_snapshots_0_18;
      default:
        casez_tmp_17 = br_snapshots_0_18;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_18;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_18 = br_snapshots_0_19;
      5'b00001:
        casez_tmp_18 = br_snapshots_1_19;
      5'b00010:
        casez_tmp_18 = br_snapshots_2_19;
      5'b00011:
        casez_tmp_18 = br_snapshots_3_19;
      5'b00100:
        casez_tmp_18 = br_snapshots_4_19;
      5'b00101:
        casez_tmp_18 = br_snapshots_5_19;
      5'b00110:
        casez_tmp_18 = br_snapshots_6_19;
      5'b00111:
        casez_tmp_18 = br_snapshots_7_19;
      5'b01000:
        casez_tmp_18 = br_snapshots_8_19;
      5'b01001:
        casez_tmp_18 = br_snapshots_9_19;
      5'b01010:
        casez_tmp_18 = br_snapshots_10_19;
      5'b01011:
        casez_tmp_18 = br_snapshots_11_19;
      5'b01100:
        casez_tmp_18 = br_snapshots_12_19;
      5'b01101:
        casez_tmp_18 = br_snapshots_13_19;
      5'b01110:
        casez_tmp_18 = br_snapshots_14_19;
      5'b01111:
        casez_tmp_18 = br_snapshots_15_19;
      5'b10000:
        casez_tmp_18 = br_snapshots_16_19;
      5'b10001:
        casez_tmp_18 = br_snapshots_17_19;
      5'b10010:
        casez_tmp_18 = br_snapshots_18_19;
      5'b10011:
        casez_tmp_18 = br_snapshots_19_19;
      5'b10100:
        casez_tmp_18 = br_snapshots_0_19;
      5'b10101:
        casez_tmp_18 = br_snapshots_0_19;
      5'b10110:
        casez_tmp_18 = br_snapshots_0_19;
      5'b10111:
        casez_tmp_18 = br_snapshots_0_19;
      5'b11000:
        casez_tmp_18 = br_snapshots_0_19;
      5'b11001:
        casez_tmp_18 = br_snapshots_0_19;
      5'b11010:
        casez_tmp_18 = br_snapshots_0_19;
      5'b11011:
        casez_tmp_18 = br_snapshots_0_19;
      5'b11100:
        casez_tmp_18 = br_snapshots_0_19;
      5'b11101:
        casez_tmp_18 = br_snapshots_0_19;
      5'b11110:
        casez_tmp_18 = br_snapshots_0_19;
      default:
        casez_tmp_18 = br_snapshots_0_19;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_19;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_19 = br_snapshots_0_20;
      5'b00001:
        casez_tmp_19 = br_snapshots_1_20;
      5'b00010:
        casez_tmp_19 = br_snapshots_2_20;
      5'b00011:
        casez_tmp_19 = br_snapshots_3_20;
      5'b00100:
        casez_tmp_19 = br_snapshots_4_20;
      5'b00101:
        casez_tmp_19 = br_snapshots_5_20;
      5'b00110:
        casez_tmp_19 = br_snapshots_6_20;
      5'b00111:
        casez_tmp_19 = br_snapshots_7_20;
      5'b01000:
        casez_tmp_19 = br_snapshots_8_20;
      5'b01001:
        casez_tmp_19 = br_snapshots_9_20;
      5'b01010:
        casez_tmp_19 = br_snapshots_10_20;
      5'b01011:
        casez_tmp_19 = br_snapshots_11_20;
      5'b01100:
        casez_tmp_19 = br_snapshots_12_20;
      5'b01101:
        casez_tmp_19 = br_snapshots_13_20;
      5'b01110:
        casez_tmp_19 = br_snapshots_14_20;
      5'b01111:
        casez_tmp_19 = br_snapshots_15_20;
      5'b10000:
        casez_tmp_19 = br_snapshots_16_20;
      5'b10001:
        casez_tmp_19 = br_snapshots_17_20;
      5'b10010:
        casez_tmp_19 = br_snapshots_18_20;
      5'b10011:
        casez_tmp_19 = br_snapshots_19_20;
      5'b10100:
        casez_tmp_19 = br_snapshots_0_20;
      5'b10101:
        casez_tmp_19 = br_snapshots_0_20;
      5'b10110:
        casez_tmp_19 = br_snapshots_0_20;
      5'b10111:
        casez_tmp_19 = br_snapshots_0_20;
      5'b11000:
        casez_tmp_19 = br_snapshots_0_20;
      5'b11001:
        casez_tmp_19 = br_snapshots_0_20;
      5'b11010:
        casez_tmp_19 = br_snapshots_0_20;
      5'b11011:
        casez_tmp_19 = br_snapshots_0_20;
      5'b11100:
        casez_tmp_19 = br_snapshots_0_20;
      5'b11101:
        casez_tmp_19 = br_snapshots_0_20;
      5'b11110:
        casez_tmp_19 = br_snapshots_0_20;
      default:
        casez_tmp_19 = br_snapshots_0_20;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_20;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_20 = br_snapshots_0_21;
      5'b00001:
        casez_tmp_20 = br_snapshots_1_21;
      5'b00010:
        casez_tmp_20 = br_snapshots_2_21;
      5'b00011:
        casez_tmp_20 = br_snapshots_3_21;
      5'b00100:
        casez_tmp_20 = br_snapshots_4_21;
      5'b00101:
        casez_tmp_20 = br_snapshots_5_21;
      5'b00110:
        casez_tmp_20 = br_snapshots_6_21;
      5'b00111:
        casez_tmp_20 = br_snapshots_7_21;
      5'b01000:
        casez_tmp_20 = br_snapshots_8_21;
      5'b01001:
        casez_tmp_20 = br_snapshots_9_21;
      5'b01010:
        casez_tmp_20 = br_snapshots_10_21;
      5'b01011:
        casez_tmp_20 = br_snapshots_11_21;
      5'b01100:
        casez_tmp_20 = br_snapshots_12_21;
      5'b01101:
        casez_tmp_20 = br_snapshots_13_21;
      5'b01110:
        casez_tmp_20 = br_snapshots_14_21;
      5'b01111:
        casez_tmp_20 = br_snapshots_15_21;
      5'b10000:
        casez_tmp_20 = br_snapshots_16_21;
      5'b10001:
        casez_tmp_20 = br_snapshots_17_21;
      5'b10010:
        casez_tmp_20 = br_snapshots_18_21;
      5'b10011:
        casez_tmp_20 = br_snapshots_19_21;
      5'b10100:
        casez_tmp_20 = br_snapshots_0_21;
      5'b10101:
        casez_tmp_20 = br_snapshots_0_21;
      5'b10110:
        casez_tmp_20 = br_snapshots_0_21;
      5'b10111:
        casez_tmp_20 = br_snapshots_0_21;
      5'b11000:
        casez_tmp_20 = br_snapshots_0_21;
      5'b11001:
        casez_tmp_20 = br_snapshots_0_21;
      5'b11010:
        casez_tmp_20 = br_snapshots_0_21;
      5'b11011:
        casez_tmp_20 = br_snapshots_0_21;
      5'b11100:
        casez_tmp_20 = br_snapshots_0_21;
      5'b11101:
        casez_tmp_20 = br_snapshots_0_21;
      5'b11110:
        casez_tmp_20 = br_snapshots_0_21;
      default:
        casez_tmp_20 = br_snapshots_0_21;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_21;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_21 = br_snapshots_0_22;
      5'b00001:
        casez_tmp_21 = br_snapshots_1_22;
      5'b00010:
        casez_tmp_21 = br_snapshots_2_22;
      5'b00011:
        casez_tmp_21 = br_snapshots_3_22;
      5'b00100:
        casez_tmp_21 = br_snapshots_4_22;
      5'b00101:
        casez_tmp_21 = br_snapshots_5_22;
      5'b00110:
        casez_tmp_21 = br_snapshots_6_22;
      5'b00111:
        casez_tmp_21 = br_snapshots_7_22;
      5'b01000:
        casez_tmp_21 = br_snapshots_8_22;
      5'b01001:
        casez_tmp_21 = br_snapshots_9_22;
      5'b01010:
        casez_tmp_21 = br_snapshots_10_22;
      5'b01011:
        casez_tmp_21 = br_snapshots_11_22;
      5'b01100:
        casez_tmp_21 = br_snapshots_12_22;
      5'b01101:
        casez_tmp_21 = br_snapshots_13_22;
      5'b01110:
        casez_tmp_21 = br_snapshots_14_22;
      5'b01111:
        casez_tmp_21 = br_snapshots_15_22;
      5'b10000:
        casez_tmp_21 = br_snapshots_16_22;
      5'b10001:
        casez_tmp_21 = br_snapshots_17_22;
      5'b10010:
        casez_tmp_21 = br_snapshots_18_22;
      5'b10011:
        casez_tmp_21 = br_snapshots_19_22;
      5'b10100:
        casez_tmp_21 = br_snapshots_0_22;
      5'b10101:
        casez_tmp_21 = br_snapshots_0_22;
      5'b10110:
        casez_tmp_21 = br_snapshots_0_22;
      5'b10111:
        casez_tmp_21 = br_snapshots_0_22;
      5'b11000:
        casez_tmp_21 = br_snapshots_0_22;
      5'b11001:
        casez_tmp_21 = br_snapshots_0_22;
      5'b11010:
        casez_tmp_21 = br_snapshots_0_22;
      5'b11011:
        casez_tmp_21 = br_snapshots_0_22;
      5'b11100:
        casez_tmp_21 = br_snapshots_0_22;
      5'b11101:
        casez_tmp_21 = br_snapshots_0_22;
      5'b11110:
        casez_tmp_21 = br_snapshots_0_22;
      default:
        casez_tmp_21 = br_snapshots_0_22;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_22;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_22 = br_snapshots_0_23;
      5'b00001:
        casez_tmp_22 = br_snapshots_1_23;
      5'b00010:
        casez_tmp_22 = br_snapshots_2_23;
      5'b00011:
        casez_tmp_22 = br_snapshots_3_23;
      5'b00100:
        casez_tmp_22 = br_snapshots_4_23;
      5'b00101:
        casez_tmp_22 = br_snapshots_5_23;
      5'b00110:
        casez_tmp_22 = br_snapshots_6_23;
      5'b00111:
        casez_tmp_22 = br_snapshots_7_23;
      5'b01000:
        casez_tmp_22 = br_snapshots_8_23;
      5'b01001:
        casez_tmp_22 = br_snapshots_9_23;
      5'b01010:
        casez_tmp_22 = br_snapshots_10_23;
      5'b01011:
        casez_tmp_22 = br_snapshots_11_23;
      5'b01100:
        casez_tmp_22 = br_snapshots_12_23;
      5'b01101:
        casez_tmp_22 = br_snapshots_13_23;
      5'b01110:
        casez_tmp_22 = br_snapshots_14_23;
      5'b01111:
        casez_tmp_22 = br_snapshots_15_23;
      5'b10000:
        casez_tmp_22 = br_snapshots_16_23;
      5'b10001:
        casez_tmp_22 = br_snapshots_17_23;
      5'b10010:
        casez_tmp_22 = br_snapshots_18_23;
      5'b10011:
        casez_tmp_22 = br_snapshots_19_23;
      5'b10100:
        casez_tmp_22 = br_snapshots_0_23;
      5'b10101:
        casez_tmp_22 = br_snapshots_0_23;
      5'b10110:
        casez_tmp_22 = br_snapshots_0_23;
      5'b10111:
        casez_tmp_22 = br_snapshots_0_23;
      5'b11000:
        casez_tmp_22 = br_snapshots_0_23;
      5'b11001:
        casez_tmp_22 = br_snapshots_0_23;
      5'b11010:
        casez_tmp_22 = br_snapshots_0_23;
      5'b11011:
        casez_tmp_22 = br_snapshots_0_23;
      5'b11100:
        casez_tmp_22 = br_snapshots_0_23;
      5'b11101:
        casez_tmp_22 = br_snapshots_0_23;
      5'b11110:
        casez_tmp_22 = br_snapshots_0_23;
      default:
        casez_tmp_22 = br_snapshots_0_23;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_23;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_23 = br_snapshots_0_24;
      5'b00001:
        casez_tmp_23 = br_snapshots_1_24;
      5'b00010:
        casez_tmp_23 = br_snapshots_2_24;
      5'b00011:
        casez_tmp_23 = br_snapshots_3_24;
      5'b00100:
        casez_tmp_23 = br_snapshots_4_24;
      5'b00101:
        casez_tmp_23 = br_snapshots_5_24;
      5'b00110:
        casez_tmp_23 = br_snapshots_6_24;
      5'b00111:
        casez_tmp_23 = br_snapshots_7_24;
      5'b01000:
        casez_tmp_23 = br_snapshots_8_24;
      5'b01001:
        casez_tmp_23 = br_snapshots_9_24;
      5'b01010:
        casez_tmp_23 = br_snapshots_10_24;
      5'b01011:
        casez_tmp_23 = br_snapshots_11_24;
      5'b01100:
        casez_tmp_23 = br_snapshots_12_24;
      5'b01101:
        casez_tmp_23 = br_snapshots_13_24;
      5'b01110:
        casez_tmp_23 = br_snapshots_14_24;
      5'b01111:
        casez_tmp_23 = br_snapshots_15_24;
      5'b10000:
        casez_tmp_23 = br_snapshots_16_24;
      5'b10001:
        casez_tmp_23 = br_snapshots_17_24;
      5'b10010:
        casez_tmp_23 = br_snapshots_18_24;
      5'b10011:
        casez_tmp_23 = br_snapshots_19_24;
      5'b10100:
        casez_tmp_23 = br_snapshots_0_24;
      5'b10101:
        casez_tmp_23 = br_snapshots_0_24;
      5'b10110:
        casez_tmp_23 = br_snapshots_0_24;
      5'b10111:
        casez_tmp_23 = br_snapshots_0_24;
      5'b11000:
        casez_tmp_23 = br_snapshots_0_24;
      5'b11001:
        casez_tmp_23 = br_snapshots_0_24;
      5'b11010:
        casez_tmp_23 = br_snapshots_0_24;
      5'b11011:
        casez_tmp_23 = br_snapshots_0_24;
      5'b11100:
        casez_tmp_23 = br_snapshots_0_24;
      5'b11101:
        casez_tmp_23 = br_snapshots_0_24;
      5'b11110:
        casez_tmp_23 = br_snapshots_0_24;
      default:
        casez_tmp_23 = br_snapshots_0_24;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_24;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_24 = br_snapshots_0_25;
      5'b00001:
        casez_tmp_24 = br_snapshots_1_25;
      5'b00010:
        casez_tmp_24 = br_snapshots_2_25;
      5'b00011:
        casez_tmp_24 = br_snapshots_3_25;
      5'b00100:
        casez_tmp_24 = br_snapshots_4_25;
      5'b00101:
        casez_tmp_24 = br_snapshots_5_25;
      5'b00110:
        casez_tmp_24 = br_snapshots_6_25;
      5'b00111:
        casez_tmp_24 = br_snapshots_7_25;
      5'b01000:
        casez_tmp_24 = br_snapshots_8_25;
      5'b01001:
        casez_tmp_24 = br_snapshots_9_25;
      5'b01010:
        casez_tmp_24 = br_snapshots_10_25;
      5'b01011:
        casez_tmp_24 = br_snapshots_11_25;
      5'b01100:
        casez_tmp_24 = br_snapshots_12_25;
      5'b01101:
        casez_tmp_24 = br_snapshots_13_25;
      5'b01110:
        casez_tmp_24 = br_snapshots_14_25;
      5'b01111:
        casez_tmp_24 = br_snapshots_15_25;
      5'b10000:
        casez_tmp_24 = br_snapshots_16_25;
      5'b10001:
        casez_tmp_24 = br_snapshots_17_25;
      5'b10010:
        casez_tmp_24 = br_snapshots_18_25;
      5'b10011:
        casez_tmp_24 = br_snapshots_19_25;
      5'b10100:
        casez_tmp_24 = br_snapshots_0_25;
      5'b10101:
        casez_tmp_24 = br_snapshots_0_25;
      5'b10110:
        casez_tmp_24 = br_snapshots_0_25;
      5'b10111:
        casez_tmp_24 = br_snapshots_0_25;
      5'b11000:
        casez_tmp_24 = br_snapshots_0_25;
      5'b11001:
        casez_tmp_24 = br_snapshots_0_25;
      5'b11010:
        casez_tmp_24 = br_snapshots_0_25;
      5'b11011:
        casez_tmp_24 = br_snapshots_0_25;
      5'b11100:
        casez_tmp_24 = br_snapshots_0_25;
      5'b11101:
        casez_tmp_24 = br_snapshots_0_25;
      5'b11110:
        casez_tmp_24 = br_snapshots_0_25;
      default:
        casez_tmp_24 = br_snapshots_0_25;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_25;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_25 = br_snapshots_0_26;
      5'b00001:
        casez_tmp_25 = br_snapshots_1_26;
      5'b00010:
        casez_tmp_25 = br_snapshots_2_26;
      5'b00011:
        casez_tmp_25 = br_snapshots_3_26;
      5'b00100:
        casez_tmp_25 = br_snapshots_4_26;
      5'b00101:
        casez_tmp_25 = br_snapshots_5_26;
      5'b00110:
        casez_tmp_25 = br_snapshots_6_26;
      5'b00111:
        casez_tmp_25 = br_snapshots_7_26;
      5'b01000:
        casez_tmp_25 = br_snapshots_8_26;
      5'b01001:
        casez_tmp_25 = br_snapshots_9_26;
      5'b01010:
        casez_tmp_25 = br_snapshots_10_26;
      5'b01011:
        casez_tmp_25 = br_snapshots_11_26;
      5'b01100:
        casez_tmp_25 = br_snapshots_12_26;
      5'b01101:
        casez_tmp_25 = br_snapshots_13_26;
      5'b01110:
        casez_tmp_25 = br_snapshots_14_26;
      5'b01111:
        casez_tmp_25 = br_snapshots_15_26;
      5'b10000:
        casez_tmp_25 = br_snapshots_16_26;
      5'b10001:
        casez_tmp_25 = br_snapshots_17_26;
      5'b10010:
        casez_tmp_25 = br_snapshots_18_26;
      5'b10011:
        casez_tmp_25 = br_snapshots_19_26;
      5'b10100:
        casez_tmp_25 = br_snapshots_0_26;
      5'b10101:
        casez_tmp_25 = br_snapshots_0_26;
      5'b10110:
        casez_tmp_25 = br_snapshots_0_26;
      5'b10111:
        casez_tmp_25 = br_snapshots_0_26;
      5'b11000:
        casez_tmp_25 = br_snapshots_0_26;
      5'b11001:
        casez_tmp_25 = br_snapshots_0_26;
      5'b11010:
        casez_tmp_25 = br_snapshots_0_26;
      5'b11011:
        casez_tmp_25 = br_snapshots_0_26;
      5'b11100:
        casez_tmp_25 = br_snapshots_0_26;
      5'b11101:
        casez_tmp_25 = br_snapshots_0_26;
      5'b11110:
        casez_tmp_25 = br_snapshots_0_26;
      default:
        casez_tmp_25 = br_snapshots_0_26;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_26;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_26 = br_snapshots_0_27;
      5'b00001:
        casez_tmp_26 = br_snapshots_1_27;
      5'b00010:
        casez_tmp_26 = br_snapshots_2_27;
      5'b00011:
        casez_tmp_26 = br_snapshots_3_27;
      5'b00100:
        casez_tmp_26 = br_snapshots_4_27;
      5'b00101:
        casez_tmp_26 = br_snapshots_5_27;
      5'b00110:
        casez_tmp_26 = br_snapshots_6_27;
      5'b00111:
        casez_tmp_26 = br_snapshots_7_27;
      5'b01000:
        casez_tmp_26 = br_snapshots_8_27;
      5'b01001:
        casez_tmp_26 = br_snapshots_9_27;
      5'b01010:
        casez_tmp_26 = br_snapshots_10_27;
      5'b01011:
        casez_tmp_26 = br_snapshots_11_27;
      5'b01100:
        casez_tmp_26 = br_snapshots_12_27;
      5'b01101:
        casez_tmp_26 = br_snapshots_13_27;
      5'b01110:
        casez_tmp_26 = br_snapshots_14_27;
      5'b01111:
        casez_tmp_26 = br_snapshots_15_27;
      5'b10000:
        casez_tmp_26 = br_snapshots_16_27;
      5'b10001:
        casez_tmp_26 = br_snapshots_17_27;
      5'b10010:
        casez_tmp_26 = br_snapshots_18_27;
      5'b10011:
        casez_tmp_26 = br_snapshots_19_27;
      5'b10100:
        casez_tmp_26 = br_snapshots_0_27;
      5'b10101:
        casez_tmp_26 = br_snapshots_0_27;
      5'b10110:
        casez_tmp_26 = br_snapshots_0_27;
      5'b10111:
        casez_tmp_26 = br_snapshots_0_27;
      5'b11000:
        casez_tmp_26 = br_snapshots_0_27;
      5'b11001:
        casez_tmp_26 = br_snapshots_0_27;
      5'b11010:
        casez_tmp_26 = br_snapshots_0_27;
      5'b11011:
        casez_tmp_26 = br_snapshots_0_27;
      5'b11100:
        casez_tmp_26 = br_snapshots_0_27;
      5'b11101:
        casez_tmp_26 = br_snapshots_0_27;
      5'b11110:
        casez_tmp_26 = br_snapshots_0_27;
      default:
        casez_tmp_26 = br_snapshots_0_27;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_27;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_27 = br_snapshots_0_28;
      5'b00001:
        casez_tmp_27 = br_snapshots_1_28;
      5'b00010:
        casez_tmp_27 = br_snapshots_2_28;
      5'b00011:
        casez_tmp_27 = br_snapshots_3_28;
      5'b00100:
        casez_tmp_27 = br_snapshots_4_28;
      5'b00101:
        casez_tmp_27 = br_snapshots_5_28;
      5'b00110:
        casez_tmp_27 = br_snapshots_6_28;
      5'b00111:
        casez_tmp_27 = br_snapshots_7_28;
      5'b01000:
        casez_tmp_27 = br_snapshots_8_28;
      5'b01001:
        casez_tmp_27 = br_snapshots_9_28;
      5'b01010:
        casez_tmp_27 = br_snapshots_10_28;
      5'b01011:
        casez_tmp_27 = br_snapshots_11_28;
      5'b01100:
        casez_tmp_27 = br_snapshots_12_28;
      5'b01101:
        casez_tmp_27 = br_snapshots_13_28;
      5'b01110:
        casez_tmp_27 = br_snapshots_14_28;
      5'b01111:
        casez_tmp_27 = br_snapshots_15_28;
      5'b10000:
        casez_tmp_27 = br_snapshots_16_28;
      5'b10001:
        casez_tmp_27 = br_snapshots_17_28;
      5'b10010:
        casez_tmp_27 = br_snapshots_18_28;
      5'b10011:
        casez_tmp_27 = br_snapshots_19_28;
      5'b10100:
        casez_tmp_27 = br_snapshots_0_28;
      5'b10101:
        casez_tmp_27 = br_snapshots_0_28;
      5'b10110:
        casez_tmp_27 = br_snapshots_0_28;
      5'b10111:
        casez_tmp_27 = br_snapshots_0_28;
      5'b11000:
        casez_tmp_27 = br_snapshots_0_28;
      5'b11001:
        casez_tmp_27 = br_snapshots_0_28;
      5'b11010:
        casez_tmp_27 = br_snapshots_0_28;
      5'b11011:
        casez_tmp_27 = br_snapshots_0_28;
      5'b11100:
        casez_tmp_27 = br_snapshots_0_28;
      5'b11101:
        casez_tmp_27 = br_snapshots_0_28;
      5'b11110:
        casez_tmp_27 = br_snapshots_0_28;
      default:
        casez_tmp_27 = br_snapshots_0_28;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_28;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_28 = br_snapshots_0_29;
      5'b00001:
        casez_tmp_28 = br_snapshots_1_29;
      5'b00010:
        casez_tmp_28 = br_snapshots_2_29;
      5'b00011:
        casez_tmp_28 = br_snapshots_3_29;
      5'b00100:
        casez_tmp_28 = br_snapshots_4_29;
      5'b00101:
        casez_tmp_28 = br_snapshots_5_29;
      5'b00110:
        casez_tmp_28 = br_snapshots_6_29;
      5'b00111:
        casez_tmp_28 = br_snapshots_7_29;
      5'b01000:
        casez_tmp_28 = br_snapshots_8_29;
      5'b01001:
        casez_tmp_28 = br_snapshots_9_29;
      5'b01010:
        casez_tmp_28 = br_snapshots_10_29;
      5'b01011:
        casez_tmp_28 = br_snapshots_11_29;
      5'b01100:
        casez_tmp_28 = br_snapshots_12_29;
      5'b01101:
        casez_tmp_28 = br_snapshots_13_29;
      5'b01110:
        casez_tmp_28 = br_snapshots_14_29;
      5'b01111:
        casez_tmp_28 = br_snapshots_15_29;
      5'b10000:
        casez_tmp_28 = br_snapshots_16_29;
      5'b10001:
        casez_tmp_28 = br_snapshots_17_29;
      5'b10010:
        casez_tmp_28 = br_snapshots_18_29;
      5'b10011:
        casez_tmp_28 = br_snapshots_19_29;
      5'b10100:
        casez_tmp_28 = br_snapshots_0_29;
      5'b10101:
        casez_tmp_28 = br_snapshots_0_29;
      5'b10110:
        casez_tmp_28 = br_snapshots_0_29;
      5'b10111:
        casez_tmp_28 = br_snapshots_0_29;
      5'b11000:
        casez_tmp_28 = br_snapshots_0_29;
      5'b11001:
        casez_tmp_28 = br_snapshots_0_29;
      5'b11010:
        casez_tmp_28 = br_snapshots_0_29;
      5'b11011:
        casez_tmp_28 = br_snapshots_0_29;
      5'b11100:
        casez_tmp_28 = br_snapshots_0_29;
      5'b11101:
        casez_tmp_28 = br_snapshots_0_29;
      5'b11110:
        casez_tmp_28 = br_snapshots_0_29;
      default:
        casez_tmp_28 = br_snapshots_0_29;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_29;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_29 = br_snapshots_0_30;
      5'b00001:
        casez_tmp_29 = br_snapshots_1_30;
      5'b00010:
        casez_tmp_29 = br_snapshots_2_30;
      5'b00011:
        casez_tmp_29 = br_snapshots_3_30;
      5'b00100:
        casez_tmp_29 = br_snapshots_4_30;
      5'b00101:
        casez_tmp_29 = br_snapshots_5_30;
      5'b00110:
        casez_tmp_29 = br_snapshots_6_30;
      5'b00111:
        casez_tmp_29 = br_snapshots_7_30;
      5'b01000:
        casez_tmp_29 = br_snapshots_8_30;
      5'b01001:
        casez_tmp_29 = br_snapshots_9_30;
      5'b01010:
        casez_tmp_29 = br_snapshots_10_30;
      5'b01011:
        casez_tmp_29 = br_snapshots_11_30;
      5'b01100:
        casez_tmp_29 = br_snapshots_12_30;
      5'b01101:
        casez_tmp_29 = br_snapshots_13_30;
      5'b01110:
        casez_tmp_29 = br_snapshots_14_30;
      5'b01111:
        casez_tmp_29 = br_snapshots_15_30;
      5'b10000:
        casez_tmp_29 = br_snapshots_16_30;
      5'b10001:
        casez_tmp_29 = br_snapshots_17_30;
      5'b10010:
        casez_tmp_29 = br_snapshots_18_30;
      5'b10011:
        casez_tmp_29 = br_snapshots_19_30;
      5'b10100:
        casez_tmp_29 = br_snapshots_0_30;
      5'b10101:
        casez_tmp_29 = br_snapshots_0_30;
      5'b10110:
        casez_tmp_29 = br_snapshots_0_30;
      5'b10111:
        casez_tmp_29 = br_snapshots_0_30;
      5'b11000:
        casez_tmp_29 = br_snapshots_0_30;
      5'b11001:
        casez_tmp_29 = br_snapshots_0_30;
      5'b11010:
        casez_tmp_29 = br_snapshots_0_30;
      5'b11011:
        casez_tmp_29 = br_snapshots_0_30;
      5'b11100:
        casez_tmp_29 = br_snapshots_0_30;
      5'b11101:
        casez_tmp_29 = br_snapshots_0_30;
      5'b11110:
        casez_tmp_29 = br_snapshots_0_30;
      default:
        casez_tmp_29 = br_snapshots_0_30;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_30;
  always @(*) begin
    casez (io_brupdate_b2_uop_br_tag)
      5'b00000:
        casez_tmp_30 = br_snapshots_0_31;
      5'b00001:
        casez_tmp_30 = br_snapshots_1_31;
      5'b00010:
        casez_tmp_30 = br_snapshots_2_31;
      5'b00011:
        casez_tmp_30 = br_snapshots_3_31;
      5'b00100:
        casez_tmp_30 = br_snapshots_4_31;
      5'b00101:
        casez_tmp_30 = br_snapshots_5_31;
      5'b00110:
        casez_tmp_30 = br_snapshots_6_31;
      5'b00111:
        casez_tmp_30 = br_snapshots_7_31;
      5'b01000:
        casez_tmp_30 = br_snapshots_8_31;
      5'b01001:
        casez_tmp_30 = br_snapshots_9_31;
      5'b01010:
        casez_tmp_30 = br_snapshots_10_31;
      5'b01011:
        casez_tmp_30 = br_snapshots_11_31;
      5'b01100:
        casez_tmp_30 = br_snapshots_12_31;
      5'b01101:
        casez_tmp_30 = br_snapshots_13_31;
      5'b01110:
        casez_tmp_30 = br_snapshots_14_31;
      5'b01111:
        casez_tmp_30 = br_snapshots_15_31;
      5'b10000:
        casez_tmp_30 = br_snapshots_16_31;
      5'b10001:
        casez_tmp_30 = br_snapshots_17_31;
      5'b10010:
        casez_tmp_30 = br_snapshots_18_31;
      5'b10011:
        casez_tmp_30 = br_snapshots_19_31;
      5'b10100:
        casez_tmp_30 = br_snapshots_0_31;
      5'b10101:
        casez_tmp_30 = br_snapshots_0_31;
      5'b10110:
        casez_tmp_30 = br_snapshots_0_31;
      5'b10111:
        casez_tmp_30 = br_snapshots_0_31;
      5'b11000:
        casez_tmp_30 = br_snapshots_0_31;
      5'b11001:
        casez_tmp_30 = br_snapshots_0_31;
      5'b11010:
        casez_tmp_30 = br_snapshots_0_31;
      5'b11011:
        casez_tmp_30 = br_snapshots_0_31;
      5'b11100:
        casez_tmp_30 = br_snapshots_0_31;
      5'b11101:
        casez_tmp_30 = br_snapshots_0_31;
      5'b11110:
        casez_tmp_30 = br_snapshots_0_31;
      default:
        casez_tmp_30 = br_snapshots_0_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_31;
  always @(*) begin
    casez (io_map_reqs_0_lrs1[4:0])
      5'b00000:
        casez_tmp_31 = map_table_0;
      5'b00001:
        casez_tmp_31 = map_table_1;
      5'b00010:
        casez_tmp_31 = map_table_2;
      5'b00011:
        casez_tmp_31 = map_table_3;
      5'b00100:
        casez_tmp_31 = map_table_4;
      5'b00101:
        casez_tmp_31 = map_table_5;
      5'b00110:
        casez_tmp_31 = map_table_6;
      5'b00111:
        casez_tmp_31 = map_table_7;
      5'b01000:
        casez_tmp_31 = map_table_8;
      5'b01001:
        casez_tmp_31 = map_table_9;
      5'b01010:
        casez_tmp_31 = map_table_10;
      5'b01011:
        casez_tmp_31 = map_table_11;
      5'b01100:
        casez_tmp_31 = map_table_12;
      5'b01101:
        casez_tmp_31 = map_table_13;
      5'b01110:
        casez_tmp_31 = map_table_14;
      5'b01111:
        casez_tmp_31 = map_table_15;
      5'b10000:
        casez_tmp_31 = map_table_16;
      5'b10001:
        casez_tmp_31 = map_table_17;
      5'b10010:
        casez_tmp_31 = map_table_18;
      5'b10011:
        casez_tmp_31 = map_table_19;
      5'b10100:
        casez_tmp_31 = map_table_20;
      5'b10101:
        casez_tmp_31 = map_table_21;
      5'b10110:
        casez_tmp_31 = map_table_22;
      5'b10111:
        casez_tmp_31 = map_table_23;
      5'b11000:
        casez_tmp_31 = map_table_24;
      5'b11001:
        casez_tmp_31 = map_table_25;
      5'b11010:
        casez_tmp_31 = map_table_26;
      5'b11011:
        casez_tmp_31 = map_table_27;
      5'b11100:
        casez_tmp_31 = map_table_28;
      5'b11101:
        casez_tmp_31 = map_table_29;
      5'b11110:
        casez_tmp_31 = map_table_30;
      default:
        casez_tmp_31 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_32;
  always @(*) begin
    casez (io_map_reqs_0_lrs2[4:0])
      5'b00000:
        casez_tmp_32 = map_table_0;
      5'b00001:
        casez_tmp_32 = map_table_1;
      5'b00010:
        casez_tmp_32 = map_table_2;
      5'b00011:
        casez_tmp_32 = map_table_3;
      5'b00100:
        casez_tmp_32 = map_table_4;
      5'b00101:
        casez_tmp_32 = map_table_5;
      5'b00110:
        casez_tmp_32 = map_table_6;
      5'b00111:
        casez_tmp_32 = map_table_7;
      5'b01000:
        casez_tmp_32 = map_table_8;
      5'b01001:
        casez_tmp_32 = map_table_9;
      5'b01010:
        casez_tmp_32 = map_table_10;
      5'b01011:
        casez_tmp_32 = map_table_11;
      5'b01100:
        casez_tmp_32 = map_table_12;
      5'b01101:
        casez_tmp_32 = map_table_13;
      5'b01110:
        casez_tmp_32 = map_table_14;
      5'b01111:
        casez_tmp_32 = map_table_15;
      5'b10000:
        casez_tmp_32 = map_table_16;
      5'b10001:
        casez_tmp_32 = map_table_17;
      5'b10010:
        casez_tmp_32 = map_table_18;
      5'b10011:
        casez_tmp_32 = map_table_19;
      5'b10100:
        casez_tmp_32 = map_table_20;
      5'b10101:
        casez_tmp_32 = map_table_21;
      5'b10110:
        casez_tmp_32 = map_table_22;
      5'b10111:
        casez_tmp_32 = map_table_23;
      5'b11000:
        casez_tmp_32 = map_table_24;
      5'b11001:
        casez_tmp_32 = map_table_25;
      5'b11010:
        casez_tmp_32 = map_table_26;
      5'b11011:
        casez_tmp_32 = map_table_27;
      5'b11100:
        casez_tmp_32 = map_table_28;
      5'b11101:
        casez_tmp_32 = map_table_29;
      5'b11110:
        casez_tmp_32 = map_table_30;
      default:
        casez_tmp_32 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_33;
  always @(*) begin
    casez (io_map_reqs_0_lrs3[4:0])
      5'b00000:
        casez_tmp_33 = map_table_0;
      5'b00001:
        casez_tmp_33 = map_table_1;
      5'b00010:
        casez_tmp_33 = map_table_2;
      5'b00011:
        casez_tmp_33 = map_table_3;
      5'b00100:
        casez_tmp_33 = map_table_4;
      5'b00101:
        casez_tmp_33 = map_table_5;
      5'b00110:
        casez_tmp_33 = map_table_6;
      5'b00111:
        casez_tmp_33 = map_table_7;
      5'b01000:
        casez_tmp_33 = map_table_8;
      5'b01001:
        casez_tmp_33 = map_table_9;
      5'b01010:
        casez_tmp_33 = map_table_10;
      5'b01011:
        casez_tmp_33 = map_table_11;
      5'b01100:
        casez_tmp_33 = map_table_12;
      5'b01101:
        casez_tmp_33 = map_table_13;
      5'b01110:
        casez_tmp_33 = map_table_14;
      5'b01111:
        casez_tmp_33 = map_table_15;
      5'b10000:
        casez_tmp_33 = map_table_16;
      5'b10001:
        casez_tmp_33 = map_table_17;
      5'b10010:
        casez_tmp_33 = map_table_18;
      5'b10011:
        casez_tmp_33 = map_table_19;
      5'b10100:
        casez_tmp_33 = map_table_20;
      5'b10101:
        casez_tmp_33 = map_table_21;
      5'b10110:
        casez_tmp_33 = map_table_22;
      5'b10111:
        casez_tmp_33 = map_table_23;
      5'b11000:
        casez_tmp_33 = map_table_24;
      5'b11001:
        casez_tmp_33 = map_table_25;
      5'b11010:
        casez_tmp_33 = map_table_26;
      5'b11011:
        casez_tmp_33 = map_table_27;
      5'b11100:
        casez_tmp_33 = map_table_28;
      5'b11101:
        casez_tmp_33 = map_table_29;
      5'b11110:
        casez_tmp_33 = map_table_30;
      default:
        casez_tmp_33 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_34;
  always @(*) begin
    casez (io_map_reqs_0_ldst[4:0])
      5'b00000:
        casez_tmp_34 = map_table_0;
      5'b00001:
        casez_tmp_34 = map_table_1;
      5'b00010:
        casez_tmp_34 = map_table_2;
      5'b00011:
        casez_tmp_34 = map_table_3;
      5'b00100:
        casez_tmp_34 = map_table_4;
      5'b00101:
        casez_tmp_34 = map_table_5;
      5'b00110:
        casez_tmp_34 = map_table_6;
      5'b00111:
        casez_tmp_34 = map_table_7;
      5'b01000:
        casez_tmp_34 = map_table_8;
      5'b01001:
        casez_tmp_34 = map_table_9;
      5'b01010:
        casez_tmp_34 = map_table_10;
      5'b01011:
        casez_tmp_34 = map_table_11;
      5'b01100:
        casez_tmp_34 = map_table_12;
      5'b01101:
        casez_tmp_34 = map_table_13;
      5'b01110:
        casez_tmp_34 = map_table_14;
      5'b01111:
        casez_tmp_34 = map_table_15;
      5'b10000:
        casez_tmp_34 = map_table_16;
      5'b10001:
        casez_tmp_34 = map_table_17;
      5'b10010:
        casez_tmp_34 = map_table_18;
      5'b10011:
        casez_tmp_34 = map_table_19;
      5'b10100:
        casez_tmp_34 = map_table_20;
      5'b10101:
        casez_tmp_34 = map_table_21;
      5'b10110:
        casez_tmp_34 = map_table_22;
      5'b10111:
        casez_tmp_34 = map_table_23;
      5'b11000:
        casez_tmp_34 = map_table_24;
      5'b11001:
        casez_tmp_34 = map_table_25;
      5'b11010:
        casez_tmp_34 = map_table_26;
      5'b11011:
        casez_tmp_34 = map_table_27;
      5'b11100:
        casez_tmp_34 = map_table_28;
      5'b11101:
        casez_tmp_34 = map_table_29;
      5'b11110:
        casez_tmp_34 = map_table_30;
      default:
        casez_tmp_34 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_35;
  always @(*) begin
    casez (io_map_reqs_1_lrs1[4:0])
      5'b00000:
        casez_tmp_35 = map_table_0;
      5'b00001:
        casez_tmp_35 = map_table_1;
      5'b00010:
        casez_tmp_35 = map_table_2;
      5'b00011:
        casez_tmp_35 = map_table_3;
      5'b00100:
        casez_tmp_35 = map_table_4;
      5'b00101:
        casez_tmp_35 = map_table_5;
      5'b00110:
        casez_tmp_35 = map_table_6;
      5'b00111:
        casez_tmp_35 = map_table_7;
      5'b01000:
        casez_tmp_35 = map_table_8;
      5'b01001:
        casez_tmp_35 = map_table_9;
      5'b01010:
        casez_tmp_35 = map_table_10;
      5'b01011:
        casez_tmp_35 = map_table_11;
      5'b01100:
        casez_tmp_35 = map_table_12;
      5'b01101:
        casez_tmp_35 = map_table_13;
      5'b01110:
        casez_tmp_35 = map_table_14;
      5'b01111:
        casez_tmp_35 = map_table_15;
      5'b10000:
        casez_tmp_35 = map_table_16;
      5'b10001:
        casez_tmp_35 = map_table_17;
      5'b10010:
        casez_tmp_35 = map_table_18;
      5'b10011:
        casez_tmp_35 = map_table_19;
      5'b10100:
        casez_tmp_35 = map_table_20;
      5'b10101:
        casez_tmp_35 = map_table_21;
      5'b10110:
        casez_tmp_35 = map_table_22;
      5'b10111:
        casez_tmp_35 = map_table_23;
      5'b11000:
        casez_tmp_35 = map_table_24;
      5'b11001:
        casez_tmp_35 = map_table_25;
      5'b11010:
        casez_tmp_35 = map_table_26;
      5'b11011:
        casez_tmp_35 = map_table_27;
      5'b11100:
        casez_tmp_35 = map_table_28;
      5'b11101:
        casez_tmp_35 = map_table_29;
      5'b11110:
        casez_tmp_35 = map_table_30;
      default:
        casez_tmp_35 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_36;
  always @(*) begin
    casez (io_map_reqs_1_lrs2[4:0])
      5'b00000:
        casez_tmp_36 = map_table_0;
      5'b00001:
        casez_tmp_36 = map_table_1;
      5'b00010:
        casez_tmp_36 = map_table_2;
      5'b00011:
        casez_tmp_36 = map_table_3;
      5'b00100:
        casez_tmp_36 = map_table_4;
      5'b00101:
        casez_tmp_36 = map_table_5;
      5'b00110:
        casez_tmp_36 = map_table_6;
      5'b00111:
        casez_tmp_36 = map_table_7;
      5'b01000:
        casez_tmp_36 = map_table_8;
      5'b01001:
        casez_tmp_36 = map_table_9;
      5'b01010:
        casez_tmp_36 = map_table_10;
      5'b01011:
        casez_tmp_36 = map_table_11;
      5'b01100:
        casez_tmp_36 = map_table_12;
      5'b01101:
        casez_tmp_36 = map_table_13;
      5'b01110:
        casez_tmp_36 = map_table_14;
      5'b01111:
        casez_tmp_36 = map_table_15;
      5'b10000:
        casez_tmp_36 = map_table_16;
      5'b10001:
        casez_tmp_36 = map_table_17;
      5'b10010:
        casez_tmp_36 = map_table_18;
      5'b10011:
        casez_tmp_36 = map_table_19;
      5'b10100:
        casez_tmp_36 = map_table_20;
      5'b10101:
        casez_tmp_36 = map_table_21;
      5'b10110:
        casez_tmp_36 = map_table_22;
      5'b10111:
        casez_tmp_36 = map_table_23;
      5'b11000:
        casez_tmp_36 = map_table_24;
      5'b11001:
        casez_tmp_36 = map_table_25;
      5'b11010:
        casez_tmp_36 = map_table_26;
      5'b11011:
        casez_tmp_36 = map_table_27;
      5'b11100:
        casez_tmp_36 = map_table_28;
      5'b11101:
        casez_tmp_36 = map_table_29;
      5'b11110:
        casez_tmp_36 = map_table_30;
      default:
        casez_tmp_36 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_37;
  always @(*) begin
    casez (io_map_reqs_1_lrs3[4:0])
      5'b00000:
        casez_tmp_37 = map_table_0;
      5'b00001:
        casez_tmp_37 = map_table_1;
      5'b00010:
        casez_tmp_37 = map_table_2;
      5'b00011:
        casez_tmp_37 = map_table_3;
      5'b00100:
        casez_tmp_37 = map_table_4;
      5'b00101:
        casez_tmp_37 = map_table_5;
      5'b00110:
        casez_tmp_37 = map_table_6;
      5'b00111:
        casez_tmp_37 = map_table_7;
      5'b01000:
        casez_tmp_37 = map_table_8;
      5'b01001:
        casez_tmp_37 = map_table_9;
      5'b01010:
        casez_tmp_37 = map_table_10;
      5'b01011:
        casez_tmp_37 = map_table_11;
      5'b01100:
        casez_tmp_37 = map_table_12;
      5'b01101:
        casez_tmp_37 = map_table_13;
      5'b01110:
        casez_tmp_37 = map_table_14;
      5'b01111:
        casez_tmp_37 = map_table_15;
      5'b10000:
        casez_tmp_37 = map_table_16;
      5'b10001:
        casez_tmp_37 = map_table_17;
      5'b10010:
        casez_tmp_37 = map_table_18;
      5'b10011:
        casez_tmp_37 = map_table_19;
      5'b10100:
        casez_tmp_37 = map_table_20;
      5'b10101:
        casez_tmp_37 = map_table_21;
      5'b10110:
        casez_tmp_37 = map_table_22;
      5'b10111:
        casez_tmp_37 = map_table_23;
      5'b11000:
        casez_tmp_37 = map_table_24;
      5'b11001:
        casez_tmp_37 = map_table_25;
      5'b11010:
        casez_tmp_37 = map_table_26;
      5'b11011:
        casez_tmp_37 = map_table_27;
      5'b11100:
        casez_tmp_37 = map_table_28;
      5'b11101:
        casez_tmp_37 = map_table_29;
      5'b11110:
        casez_tmp_37 = map_table_30;
      default:
        casez_tmp_37 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_38;
  always @(*) begin
    casez (io_map_reqs_1_ldst[4:0])
      5'b00000:
        casez_tmp_38 = map_table_0;
      5'b00001:
        casez_tmp_38 = map_table_1;
      5'b00010:
        casez_tmp_38 = map_table_2;
      5'b00011:
        casez_tmp_38 = map_table_3;
      5'b00100:
        casez_tmp_38 = map_table_4;
      5'b00101:
        casez_tmp_38 = map_table_5;
      5'b00110:
        casez_tmp_38 = map_table_6;
      5'b00111:
        casez_tmp_38 = map_table_7;
      5'b01000:
        casez_tmp_38 = map_table_8;
      5'b01001:
        casez_tmp_38 = map_table_9;
      5'b01010:
        casez_tmp_38 = map_table_10;
      5'b01011:
        casez_tmp_38 = map_table_11;
      5'b01100:
        casez_tmp_38 = map_table_12;
      5'b01101:
        casez_tmp_38 = map_table_13;
      5'b01110:
        casez_tmp_38 = map_table_14;
      5'b01111:
        casez_tmp_38 = map_table_15;
      5'b10000:
        casez_tmp_38 = map_table_16;
      5'b10001:
        casez_tmp_38 = map_table_17;
      5'b10010:
        casez_tmp_38 = map_table_18;
      5'b10011:
        casez_tmp_38 = map_table_19;
      5'b10100:
        casez_tmp_38 = map_table_20;
      5'b10101:
        casez_tmp_38 = map_table_21;
      5'b10110:
        casez_tmp_38 = map_table_22;
      5'b10111:
        casez_tmp_38 = map_table_23;
      5'b11000:
        casez_tmp_38 = map_table_24;
      5'b11001:
        casez_tmp_38 = map_table_25;
      5'b11010:
        casez_tmp_38 = map_table_26;
      5'b11011:
        casez_tmp_38 = map_table_27;
      5'b11100:
        casez_tmp_38 = map_table_28;
      5'b11101:
        casez_tmp_38 = map_table_29;
      5'b11110:
        casez_tmp_38 = map_table_30;
      default:
        casez_tmp_38 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_39;
  always @(*) begin
    casez (io_map_reqs_2_lrs1[4:0])
      5'b00000:
        casez_tmp_39 = map_table_0;
      5'b00001:
        casez_tmp_39 = map_table_1;
      5'b00010:
        casez_tmp_39 = map_table_2;
      5'b00011:
        casez_tmp_39 = map_table_3;
      5'b00100:
        casez_tmp_39 = map_table_4;
      5'b00101:
        casez_tmp_39 = map_table_5;
      5'b00110:
        casez_tmp_39 = map_table_6;
      5'b00111:
        casez_tmp_39 = map_table_7;
      5'b01000:
        casez_tmp_39 = map_table_8;
      5'b01001:
        casez_tmp_39 = map_table_9;
      5'b01010:
        casez_tmp_39 = map_table_10;
      5'b01011:
        casez_tmp_39 = map_table_11;
      5'b01100:
        casez_tmp_39 = map_table_12;
      5'b01101:
        casez_tmp_39 = map_table_13;
      5'b01110:
        casez_tmp_39 = map_table_14;
      5'b01111:
        casez_tmp_39 = map_table_15;
      5'b10000:
        casez_tmp_39 = map_table_16;
      5'b10001:
        casez_tmp_39 = map_table_17;
      5'b10010:
        casez_tmp_39 = map_table_18;
      5'b10011:
        casez_tmp_39 = map_table_19;
      5'b10100:
        casez_tmp_39 = map_table_20;
      5'b10101:
        casez_tmp_39 = map_table_21;
      5'b10110:
        casez_tmp_39 = map_table_22;
      5'b10111:
        casez_tmp_39 = map_table_23;
      5'b11000:
        casez_tmp_39 = map_table_24;
      5'b11001:
        casez_tmp_39 = map_table_25;
      5'b11010:
        casez_tmp_39 = map_table_26;
      5'b11011:
        casez_tmp_39 = map_table_27;
      5'b11100:
        casez_tmp_39 = map_table_28;
      5'b11101:
        casez_tmp_39 = map_table_29;
      5'b11110:
        casez_tmp_39 = map_table_30;
      default:
        casez_tmp_39 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_40;
  always @(*) begin
    casez (io_map_reqs_2_lrs2[4:0])
      5'b00000:
        casez_tmp_40 = map_table_0;
      5'b00001:
        casez_tmp_40 = map_table_1;
      5'b00010:
        casez_tmp_40 = map_table_2;
      5'b00011:
        casez_tmp_40 = map_table_3;
      5'b00100:
        casez_tmp_40 = map_table_4;
      5'b00101:
        casez_tmp_40 = map_table_5;
      5'b00110:
        casez_tmp_40 = map_table_6;
      5'b00111:
        casez_tmp_40 = map_table_7;
      5'b01000:
        casez_tmp_40 = map_table_8;
      5'b01001:
        casez_tmp_40 = map_table_9;
      5'b01010:
        casez_tmp_40 = map_table_10;
      5'b01011:
        casez_tmp_40 = map_table_11;
      5'b01100:
        casez_tmp_40 = map_table_12;
      5'b01101:
        casez_tmp_40 = map_table_13;
      5'b01110:
        casez_tmp_40 = map_table_14;
      5'b01111:
        casez_tmp_40 = map_table_15;
      5'b10000:
        casez_tmp_40 = map_table_16;
      5'b10001:
        casez_tmp_40 = map_table_17;
      5'b10010:
        casez_tmp_40 = map_table_18;
      5'b10011:
        casez_tmp_40 = map_table_19;
      5'b10100:
        casez_tmp_40 = map_table_20;
      5'b10101:
        casez_tmp_40 = map_table_21;
      5'b10110:
        casez_tmp_40 = map_table_22;
      5'b10111:
        casez_tmp_40 = map_table_23;
      5'b11000:
        casez_tmp_40 = map_table_24;
      5'b11001:
        casez_tmp_40 = map_table_25;
      5'b11010:
        casez_tmp_40 = map_table_26;
      5'b11011:
        casez_tmp_40 = map_table_27;
      5'b11100:
        casez_tmp_40 = map_table_28;
      5'b11101:
        casez_tmp_40 = map_table_29;
      5'b11110:
        casez_tmp_40 = map_table_30;
      default:
        casez_tmp_40 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_41;
  always @(*) begin
    casez (io_map_reqs_2_lrs3[4:0])
      5'b00000:
        casez_tmp_41 = map_table_0;
      5'b00001:
        casez_tmp_41 = map_table_1;
      5'b00010:
        casez_tmp_41 = map_table_2;
      5'b00011:
        casez_tmp_41 = map_table_3;
      5'b00100:
        casez_tmp_41 = map_table_4;
      5'b00101:
        casez_tmp_41 = map_table_5;
      5'b00110:
        casez_tmp_41 = map_table_6;
      5'b00111:
        casez_tmp_41 = map_table_7;
      5'b01000:
        casez_tmp_41 = map_table_8;
      5'b01001:
        casez_tmp_41 = map_table_9;
      5'b01010:
        casez_tmp_41 = map_table_10;
      5'b01011:
        casez_tmp_41 = map_table_11;
      5'b01100:
        casez_tmp_41 = map_table_12;
      5'b01101:
        casez_tmp_41 = map_table_13;
      5'b01110:
        casez_tmp_41 = map_table_14;
      5'b01111:
        casez_tmp_41 = map_table_15;
      5'b10000:
        casez_tmp_41 = map_table_16;
      5'b10001:
        casez_tmp_41 = map_table_17;
      5'b10010:
        casez_tmp_41 = map_table_18;
      5'b10011:
        casez_tmp_41 = map_table_19;
      5'b10100:
        casez_tmp_41 = map_table_20;
      5'b10101:
        casez_tmp_41 = map_table_21;
      5'b10110:
        casez_tmp_41 = map_table_22;
      5'b10111:
        casez_tmp_41 = map_table_23;
      5'b11000:
        casez_tmp_41 = map_table_24;
      5'b11001:
        casez_tmp_41 = map_table_25;
      5'b11010:
        casez_tmp_41 = map_table_26;
      5'b11011:
        casez_tmp_41 = map_table_27;
      5'b11100:
        casez_tmp_41 = map_table_28;
      5'b11101:
        casez_tmp_41 = map_table_29;
      5'b11110:
        casez_tmp_41 = map_table_30;
      default:
        casez_tmp_41 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_42;
  always @(*) begin
    casez (io_map_reqs_2_ldst[4:0])
      5'b00000:
        casez_tmp_42 = map_table_0;
      5'b00001:
        casez_tmp_42 = map_table_1;
      5'b00010:
        casez_tmp_42 = map_table_2;
      5'b00011:
        casez_tmp_42 = map_table_3;
      5'b00100:
        casez_tmp_42 = map_table_4;
      5'b00101:
        casez_tmp_42 = map_table_5;
      5'b00110:
        casez_tmp_42 = map_table_6;
      5'b00111:
        casez_tmp_42 = map_table_7;
      5'b01000:
        casez_tmp_42 = map_table_8;
      5'b01001:
        casez_tmp_42 = map_table_9;
      5'b01010:
        casez_tmp_42 = map_table_10;
      5'b01011:
        casez_tmp_42 = map_table_11;
      5'b01100:
        casez_tmp_42 = map_table_12;
      5'b01101:
        casez_tmp_42 = map_table_13;
      5'b01110:
        casez_tmp_42 = map_table_14;
      5'b01111:
        casez_tmp_42 = map_table_15;
      5'b10000:
        casez_tmp_42 = map_table_16;
      5'b10001:
        casez_tmp_42 = map_table_17;
      5'b10010:
        casez_tmp_42 = map_table_18;
      5'b10011:
        casez_tmp_42 = map_table_19;
      5'b10100:
        casez_tmp_42 = map_table_20;
      5'b10101:
        casez_tmp_42 = map_table_21;
      5'b10110:
        casez_tmp_42 = map_table_22;
      5'b10111:
        casez_tmp_42 = map_table_23;
      5'b11000:
        casez_tmp_42 = map_table_24;
      5'b11001:
        casez_tmp_42 = map_table_25;
      5'b11010:
        casez_tmp_42 = map_table_26;
      5'b11011:
        casez_tmp_42 = map_table_27;
      5'b11100:
        casez_tmp_42 = map_table_28;
      5'b11101:
        casez_tmp_42 = map_table_29;
      5'b11110:
        casez_tmp_42 = map_table_30;
      default:
        casez_tmp_42 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_43;
  always @(*) begin
    casez (io_map_reqs_3_lrs1[4:0])
      5'b00000:
        casez_tmp_43 = map_table_0;
      5'b00001:
        casez_tmp_43 = map_table_1;
      5'b00010:
        casez_tmp_43 = map_table_2;
      5'b00011:
        casez_tmp_43 = map_table_3;
      5'b00100:
        casez_tmp_43 = map_table_4;
      5'b00101:
        casez_tmp_43 = map_table_5;
      5'b00110:
        casez_tmp_43 = map_table_6;
      5'b00111:
        casez_tmp_43 = map_table_7;
      5'b01000:
        casez_tmp_43 = map_table_8;
      5'b01001:
        casez_tmp_43 = map_table_9;
      5'b01010:
        casez_tmp_43 = map_table_10;
      5'b01011:
        casez_tmp_43 = map_table_11;
      5'b01100:
        casez_tmp_43 = map_table_12;
      5'b01101:
        casez_tmp_43 = map_table_13;
      5'b01110:
        casez_tmp_43 = map_table_14;
      5'b01111:
        casez_tmp_43 = map_table_15;
      5'b10000:
        casez_tmp_43 = map_table_16;
      5'b10001:
        casez_tmp_43 = map_table_17;
      5'b10010:
        casez_tmp_43 = map_table_18;
      5'b10011:
        casez_tmp_43 = map_table_19;
      5'b10100:
        casez_tmp_43 = map_table_20;
      5'b10101:
        casez_tmp_43 = map_table_21;
      5'b10110:
        casez_tmp_43 = map_table_22;
      5'b10111:
        casez_tmp_43 = map_table_23;
      5'b11000:
        casez_tmp_43 = map_table_24;
      5'b11001:
        casez_tmp_43 = map_table_25;
      5'b11010:
        casez_tmp_43 = map_table_26;
      5'b11011:
        casez_tmp_43 = map_table_27;
      5'b11100:
        casez_tmp_43 = map_table_28;
      5'b11101:
        casez_tmp_43 = map_table_29;
      5'b11110:
        casez_tmp_43 = map_table_30;
      default:
        casez_tmp_43 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_44;
  always @(*) begin
    casez (io_map_reqs_3_lrs2[4:0])
      5'b00000:
        casez_tmp_44 = map_table_0;
      5'b00001:
        casez_tmp_44 = map_table_1;
      5'b00010:
        casez_tmp_44 = map_table_2;
      5'b00011:
        casez_tmp_44 = map_table_3;
      5'b00100:
        casez_tmp_44 = map_table_4;
      5'b00101:
        casez_tmp_44 = map_table_5;
      5'b00110:
        casez_tmp_44 = map_table_6;
      5'b00111:
        casez_tmp_44 = map_table_7;
      5'b01000:
        casez_tmp_44 = map_table_8;
      5'b01001:
        casez_tmp_44 = map_table_9;
      5'b01010:
        casez_tmp_44 = map_table_10;
      5'b01011:
        casez_tmp_44 = map_table_11;
      5'b01100:
        casez_tmp_44 = map_table_12;
      5'b01101:
        casez_tmp_44 = map_table_13;
      5'b01110:
        casez_tmp_44 = map_table_14;
      5'b01111:
        casez_tmp_44 = map_table_15;
      5'b10000:
        casez_tmp_44 = map_table_16;
      5'b10001:
        casez_tmp_44 = map_table_17;
      5'b10010:
        casez_tmp_44 = map_table_18;
      5'b10011:
        casez_tmp_44 = map_table_19;
      5'b10100:
        casez_tmp_44 = map_table_20;
      5'b10101:
        casez_tmp_44 = map_table_21;
      5'b10110:
        casez_tmp_44 = map_table_22;
      5'b10111:
        casez_tmp_44 = map_table_23;
      5'b11000:
        casez_tmp_44 = map_table_24;
      5'b11001:
        casez_tmp_44 = map_table_25;
      5'b11010:
        casez_tmp_44 = map_table_26;
      5'b11011:
        casez_tmp_44 = map_table_27;
      5'b11100:
        casez_tmp_44 = map_table_28;
      5'b11101:
        casez_tmp_44 = map_table_29;
      5'b11110:
        casez_tmp_44 = map_table_30;
      default:
        casez_tmp_44 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_45;
  always @(*) begin
    casez (io_map_reqs_3_lrs3[4:0])
      5'b00000:
        casez_tmp_45 = map_table_0;
      5'b00001:
        casez_tmp_45 = map_table_1;
      5'b00010:
        casez_tmp_45 = map_table_2;
      5'b00011:
        casez_tmp_45 = map_table_3;
      5'b00100:
        casez_tmp_45 = map_table_4;
      5'b00101:
        casez_tmp_45 = map_table_5;
      5'b00110:
        casez_tmp_45 = map_table_6;
      5'b00111:
        casez_tmp_45 = map_table_7;
      5'b01000:
        casez_tmp_45 = map_table_8;
      5'b01001:
        casez_tmp_45 = map_table_9;
      5'b01010:
        casez_tmp_45 = map_table_10;
      5'b01011:
        casez_tmp_45 = map_table_11;
      5'b01100:
        casez_tmp_45 = map_table_12;
      5'b01101:
        casez_tmp_45 = map_table_13;
      5'b01110:
        casez_tmp_45 = map_table_14;
      5'b01111:
        casez_tmp_45 = map_table_15;
      5'b10000:
        casez_tmp_45 = map_table_16;
      5'b10001:
        casez_tmp_45 = map_table_17;
      5'b10010:
        casez_tmp_45 = map_table_18;
      5'b10011:
        casez_tmp_45 = map_table_19;
      5'b10100:
        casez_tmp_45 = map_table_20;
      5'b10101:
        casez_tmp_45 = map_table_21;
      5'b10110:
        casez_tmp_45 = map_table_22;
      5'b10111:
        casez_tmp_45 = map_table_23;
      5'b11000:
        casez_tmp_45 = map_table_24;
      5'b11001:
        casez_tmp_45 = map_table_25;
      5'b11010:
        casez_tmp_45 = map_table_26;
      5'b11011:
        casez_tmp_45 = map_table_27;
      5'b11100:
        casez_tmp_45 = map_table_28;
      5'b11101:
        casez_tmp_45 = map_table_29;
      5'b11110:
        casez_tmp_45 = map_table_30;
      default:
        casez_tmp_45 = map_table_31;
    endcase
  end // always @(*)
  reg  [6:0]  casez_tmp_46;
  always @(*) begin
    casez (io_map_reqs_3_ldst[4:0])
      5'b00000:
        casez_tmp_46 = map_table_0;
      5'b00001:
        casez_tmp_46 = map_table_1;
      5'b00010:
        casez_tmp_46 = map_table_2;
      5'b00011:
        casez_tmp_46 = map_table_3;
      5'b00100:
        casez_tmp_46 = map_table_4;
      5'b00101:
        casez_tmp_46 = map_table_5;
      5'b00110:
        casez_tmp_46 = map_table_6;
      5'b00111:
        casez_tmp_46 = map_table_7;
      5'b01000:
        casez_tmp_46 = map_table_8;
      5'b01001:
        casez_tmp_46 = map_table_9;
      5'b01010:
        casez_tmp_46 = map_table_10;
      5'b01011:
        casez_tmp_46 = map_table_11;
      5'b01100:
        casez_tmp_46 = map_table_12;
      5'b01101:
        casez_tmp_46 = map_table_13;
      5'b01110:
        casez_tmp_46 = map_table_14;
      5'b01111:
        casez_tmp_46 = map_table_15;
      5'b10000:
        casez_tmp_46 = map_table_16;
      5'b10001:
        casez_tmp_46 = map_table_17;
      5'b10010:
        casez_tmp_46 = map_table_18;
      5'b10011:
        casez_tmp_46 = map_table_19;
      5'b10100:
        casez_tmp_46 = map_table_20;
      5'b10101:
        casez_tmp_46 = map_table_21;
      5'b10110:
        casez_tmp_46 = map_table_22;
      5'b10111:
        casez_tmp_46 = map_table_23;
      5'b11000:
        casez_tmp_46 = map_table_24;
      5'b11001:
        casez_tmp_46 = map_table_25;
      5'b11010:
        casez_tmp_46 = map_table_26;
      5'b11011:
        casez_tmp_46 = map_table_27;
      5'b11100:
        casez_tmp_46 = map_table_28;
      5'b11101:
        casez_tmp_46 = map_table_29;
      5'b11110:
        casez_tmp_46 = map_table_30;
      default:
        casez_tmp_46 = map_table_31;
    endcase
  end // always @(*)
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~(~io_remap_reqs_0_valid | ~(map_table_0 == io_remap_reqs_0_pdst | map_table_1 == io_remap_reqs_0_pdst | map_table_2 == io_remap_reqs_0_pdst | map_table_3 == io_remap_reqs_0_pdst | map_table_4 == io_remap_reqs_0_pdst | map_table_5 == io_remap_reqs_0_pdst | map_table_6 == io_remap_reqs_0_pdst | map_table_7 == io_remap_reqs_0_pdst | map_table_8 == io_remap_reqs_0_pdst | map_table_9 == io_remap_reqs_0_pdst | map_table_10 == io_remap_reqs_0_pdst | map_table_11 == io_remap_reqs_0_pdst | map_table_12 == io_remap_reqs_0_pdst | map_table_13 == io_remap_reqs_0_pdst | map_table_14 == io_remap_reqs_0_pdst | map_table_15 == io_remap_reqs_0_pdst | map_table_16 == io_remap_reqs_0_pdst | map_table_17 == io_remap_reqs_0_pdst | map_table_18 == io_remap_reqs_0_pdst | map_table_19 == io_remap_reqs_0_pdst | map_table_20 == io_remap_reqs_0_pdst | map_table_21 == io_remap_reqs_0_pdst | map_table_22 == io_remap_reqs_0_pdst | map_table_23 == io_remap_reqs_0_pdst | map_table_24 == io_remap_reqs_0_pdst | map_table_25 == io_remap_reqs_0_pdst | map_table_26 == io_remap_reqs_0_pdst | map_table_27 == io_remap_reqs_0_pdst | map_table_28 == io_remap_reqs_0_pdst | map_table_29 == io_remap_reqs_0_pdst | map_table_30 == io_remap_reqs_0_pdst | map_table_31 == io_remap_reqs_0_pdst) | io_remap_reqs_0_pdst == 7'h0 & io_rollback)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [maptable] Trying to write a duplicate mapping.\n    at rename-maptable.scala:128 assert (!r || !map_table.contains(p) || p === 0.U && io.rollback, \"[maptable] Trying to write a duplicate mapping.\")}\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_remap_reqs_1_valid | ~(map_table_0 == io_remap_reqs_1_pdst | map_table_1 == io_remap_reqs_1_pdst | map_table_2 == io_remap_reqs_1_pdst | map_table_3 == io_remap_reqs_1_pdst | map_table_4 == io_remap_reqs_1_pdst | map_table_5 == io_remap_reqs_1_pdst | map_table_6 == io_remap_reqs_1_pdst | map_table_7 == io_remap_reqs_1_pdst | map_table_8 == io_remap_reqs_1_pdst | map_table_9 == io_remap_reqs_1_pdst | map_table_10 == io_remap_reqs_1_pdst | map_table_11 == io_remap_reqs_1_pdst | map_table_12 == io_remap_reqs_1_pdst | map_table_13 == io_remap_reqs_1_pdst | map_table_14 == io_remap_reqs_1_pdst | map_table_15 == io_remap_reqs_1_pdst | map_table_16 == io_remap_reqs_1_pdst | map_table_17 == io_remap_reqs_1_pdst | map_table_18 == io_remap_reqs_1_pdst | map_table_19 == io_remap_reqs_1_pdst | map_table_20 == io_remap_reqs_1_pdst | map_table_21 == io_remap_reqs_1_pdst | map_table_22 == io_remap_reqs_1_pdst | map_table_23 == io_remap_reqs_1_pdst | map_table_24 == io_remap_reqs_1_pdst | map_table_25 == io_remap_reqs_1_pdst | map_table_26 == io_remap_reqs_1_pdst | map_table_27 == io_remap_reqs_1_pdst | map_table_28 == io_remap_reqs_1_pdst | map_table_29 == io_remap_reqs_1_pdst | map_table_30 == io_remap_reqs_1_pdst | map_table_31 == io_remap_reqs_1_pdst) | io_remap_reqs_1_pdst == 7'h0 & io_rollback)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [maptable] Trying to write a duplicate mapping.\n    at rename-maptable.scala:128 assert (!r || !map_table.contains(p) || p === 0.U && io.rollback, \"[maptable] Trying to write a duplicate mapping.\")}\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_remap_reqs_2_valid | ~(map_table_0 == io_remap_reqs_2_pdst | map_table_1 == io_remap_reqs_2_pdst | map_table_2 == io_remap_reqs_2_pdst | map_table_3 == io_remap_reqs_2_pdst | map_table_4 == io_remap_reqs_2_pdst | map_table_5 == io_remap_reqs_2_pdst | map_table_6 == io_remap_reqs_2_pdst | map_table_7 == io_remap_reqs_2_pdst | map_table_8 == io_remap_reqs_2_pdst | map_table_9 == io_remap_reqs_2_pdst | map_table_10 == io_remap_reqs_2_pdst | map_table_11 == io_remap_reqs_2_pdst | map_table_12 == io_remap_reqs_2_pdst | map_table_13 == io_remap_reqs_2_pdst | map_table_14 == io_remap_reqs_2_pdst | map_table_15 == io_remap_reqs_2_pdst | map_table_16 == io_remap_reqs_2_pdst | map_table_17 == io_remap_reqs_2_pdst | map_table_18 == io_remap_reqs_2_pdst | map_table_19 == io_remap_reqs_2_pdst | map_table_20 == io_remap_reqs_2_pdst | map_table_21 == io_remap_reqs_2_pdst | map_table_22 == io_remap_reqs_2_pdst | map_table_23 == io_remap_reqs_2_pdst | map_table_24 == io_remap_reqs_2_pdst | map_table_25 == io_remap_reqs_2_pdst | map_table_26 == io_remap_reqs_2_pdst | map_table_27 == io_remap_reqs_2_pdst | map_table_28 == io_remap_reqs_2_pdst | map_table_29 == io_remap_reqs_2_pdst | map_table_30 == io_remap_reqs_2_pdst | map_table_31 == io_remap_reqs_2_pdst) | io_remap_reqs_2_pdst == 7'h0 & io_rollback)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [maptable] Trying to write a duplicate mapping.\n    at rename-maptable.scala:128 assert (!r || !map_table.contains(p) || p === 0.U && io.rollback, \"[maptable] Trying to write a duplicate mapping.\")}\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_remap_reqs_3_valid | ~(map_table_0 == io_remap_reqs_3_pdst | map_table_1 == io_remap_reqs_3_pdst | map_table_2 == io_remap_reqs_3_pdst | map_table_3 == io_remap_reqs_3_pdst | map_table_4 == io_remap_reqs_3_pdst | map_table_5 == io_remap_reqs_3_pdst | map_table_6 == io_remap_reqs_3_pdst | map_table_7 == io_remap_reqs_3_pdst | map_table_8 == io_remap_reqs_3_pdst | map_table_9 == io_remap_reqs_3_pdst | map_table_10 == io_remap_reqs_3_pdst | map_table_11 == io_remap_reqs_3_pdst | map_table_12 == io_remap_reqs_3_pdst | map_table_13 == io_remap_reqs_3_pdst | map_table_14 == io_remap_reqs_3_pdst | map_table_15 == io_remap_reqs_3_pdst | map_table_16 == io_remap_reqs_3_pdst | map_table_17 == io_remap_reqs_3_pdst | map_table_18 == io_remap_reqs_3_pdst | map_table_19 == io_remap_reqs_3_pdst | map_table_20 == io_remap_reqs_3_pdst | map_table_21 == io_remap_reqs_3_pdst | map_table_22 == io_remap_reqs_3_pdst | map_table_23 == io_remap_reqs_3_pdst | map_table_24 == io_remap_reqs_3_pdst | map_table_25 == io_remap_reqs_3_pdst | map_table_26 == io_remap_reqs_3_pdst | map_table_27 == io_remap_reqs_3_pdst | map_table_28 == io_remap_reqs_3_pdst | map_table_29 == io_remap_reqs_3_pdst | map_table_30 == io_remap_reqs_3_pdst | map_table_31 == io_remap_reqs_3_pdst) | io_remap_reqs_3_pdst == 7'h0 & io_rollback)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [maptable] Trying to write a duplicate mapping.\n    at rename-maptable.scala:128 assert (!r || !map_table.contains(p) || p === 0.U && io.rollback, \"[maptable] Trying to write a duplicate mapping.\")}\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [63:0] _remap_ldsts_oh_T = 64'h1 << io_remap_reqs_0_ldst;
  wire [31:0] _GEN = _remap_ldsts_oh_T[31:0] & {32{io_remap_reqs_0_valid}};
  wire [63:0] _remap_ldsts_oh_T_3 = 64'h1 << io_remap_reqs_1_ldst;
  wire [31:0] _GEN_0 = _remap_ldsts_oh_T_3[31:0] & {32{io_remap_reqs_1_valid}};
  wire [63:0] _remap_ldsts_oh_T_6 = 64'h1 << io_remap_reqs_2_ldst;
  wire [31:0] _GEN_1 = _remap_ldsts_oh_T_6[31:0] & {32{io_remap_reqs_2_valid}};
  wire [63:0] _remap_ldsts_oh_T_9 = 64'h1 << io_remap_reqs_3_ldst;
  wire [31:0] _GEN_2 = _remap_ldsts_oh_T_9[31:0] & {32{io_remap_reqs_3_valid}};
  wire [6:0]  remap_table_1_0 = _GEN[0] ? io_remap_reqs_0_pdst : map_table_0;
  wire [6:0]  remap_table_2_0 = _GEN_0[0] ? io_remap_reqs_1_pdst : remap_table_1_0;
  wire [6:0]  remap_table_3_0 = _GEN_1[0] ? io_remap_reqs_2_pdst : remap_table_2_0;
  wire [6:0]  remap_table_4_0 = _GEN_2[0] ? io_remap_reqs_3_pdst : remap_table_3_0;
  wire [6:0]  remap_table_1_1 = _GEN[1] ? io_remap_reqs_0_pdst : map_table_1;
  wire [6:0]  remap_table_2_1 = _GEN_0[1] ? io_remap_reqs_1_pdst : remap_table_1_1;
  wire [6:0]  remap_table_3_1 = _GEN_1[1] ? io_remap_reqs_2_pdst : remap_table_2_1;
  wire [6:0]  remap_table_4_1 = _GEN_2[1] ? io_remap_reqs_3_pdst : remap_table_3_1;
  wire [6:0]  remap_table_1_2 = _GEN[2] ? io_remap_reqs_0_pdst : map_table_2;
  wire [6:0]  remap_table_2_2 = _GEN_0[2] ? io_remap_reqs_1_pdst : remap_table_1_2;
  wire [6:0]  remap_table_3_2 = _GEN_1[2] ? io_remap_reqs_2_pdst : remap_table_2_2;
  wire [6:0]  remap_table_4_2 = _GEN_2[2] ? io_remap_reqs_3_pdst : remap_table_3_2;
  wire [6:0]  remap_table_1_3 = _GEN[3] ? io_remap_reqs_0_pdst : map_table_3;
  wire [6:0]  remap_table_2_3 = _GEN_0[3] ? io_remap_reqs_1_pdst : remap_table_1_3;
  wire [6:0]  remap_table_3_3 = _GEN_1[3] ? io_remap_reqs_2_pdst : remap_table_2_3;
  wire [6:0]  remap_table_4_3 = _GEN_2[3] ? io_remap_reqs_3_pdst : remap_table_3_3;
  wire [6:0]  remap_table_1_4 = _GEN[4] ? io_remap_reqs_0_pdst : map_table_4;
  wire [6:0]  remap_table_2_4 = _GEN_0[4] ? io_remap_reqs_1_pdst : remap_table_1_4;
  wire [6:0]  remap_table_3_4 = _GEN_1[4] ? io_remap_reqs_2_pdst : remap_table_2_4;
  wire [6:0]  remap_table_4_4 = _GEN_2[4] ? io_remap_reqs_3_pdst : remap_table_3_4;
  wire [6:0]  remap_table_1_5 = _GEN[5] ? io_remap_reqs_0_pdst : map_table_5;
  wire [6:0]  remap_table_2_5 = _GEN_0[5] ? io_remap_reqs_1_pdst : remap_table_1_5;
  wire [6:0]  remap_table_3_5 = _GEN_1[5] ? io_remap_reqs_2_pdst : remap_table_2_5;
  wire [6:0]  remap_table_4_5 = _GEN_2[5] ? io_remap_reqs_3_pdst : remap_table_3_5;
  wire [6:0]  remap_table_1_6 = _GEN[6] ? io_remap_reqs_0_pdst : map_table_6;
  wire [6:0]  remap_table_2_6 = _GEN_0[6] ? io_remap_reqs_1_pdst : remap_table_1_6;
  wire [6:0]  remap_table_3_6 = _GEN_1[6] ? io_remap_reqs_2_pdst : remap_table_2_6;
  wire [6:0]  remap_table_4_6 = _GEN_2[6] ? io_remap_reqs_3_pdst : remap_table_3_6;
  wire [6:0]  remap_table_1_7 = _GEN[7] ? io_remap_reqs_0_pdst : map_table_7;
  wire [6:0]  remap_table_2_7 = _GEN_0[7] ? io_remap_reqs_1_pdst : remap_table_1_7;
  wire [6:0]  remap_table_3_7 = _GEN_1[7] ? io_remap_reqs_2_pdst : remap_table_2_7;
  wire [6:0]  remap_table_4_7 = _GEN_2[7] ? io_remap_reqs_3_pdst : remap_table_3_7;
  wire [6:0]  remap_table_1_8 = _GEN[8] ? io_remap_reqs_0_pdst : map_table_8;
  wire [6:0]  remap_table_2_8 = _GEN_0[8] ? io_remap_reqs_1_pdst : remap_table_1_8;
  wire [6:0]  remap_table_3_8 = _GEN_1[8] ? io_remap_reqs_2_pdst : remap_table_2_8;
  wire [6:0]  remap_table_4_8 = _GEN_2[8] ? io_remap_reqs_3_pdst : remap_table_3_8;
  wire [6:0]  remap_table_1_9 = _GEN[9] ? io_remap_reqs_0_pdst : map_table_9;
  wire [6:0]  remap_table_2_9 = _GEN_0[9] ? io_remap_reqs_1_pdst : remap_table_1_9;
  wire [6:0]  remap_table_3_9 = _GEN_1[9] ? io_remap_reqs_2_pdst : remap_table_2_9;
  wire [6:0]  remap_table_4_9 = _GEN_2[9] ? io_remap_reqs_3_pdst : remap_table_3_9;
  wire [6:0]  remap_table_1_10 = _GEN[10] ? io_remap_reqs_0_pdst : map_table_10;
  wire [6:0]  remap_table_2_10 = _GEN_0[10] ? io_remap_reqs_1_pdst : remap_table_1_10;
  wire [6:0]  remap_table_3_10 = _GEN_1[10] ? io_remap_reqs_2_pdst : remap_table_2_10;
  wire [6:0]  remap_table_4_10 = _GEN_2[10] ? io_remap_reqs_3_pdst : remap_table_3_10;
  wire [6:0]  remap_table_1_11 = _GEN[11] ? io_remap_reqs_0_pdst : map_table_11;
  wire [6:0]  remap_table_2_11 = _GEN_0[11] ? io_remap_reqs_1_pdst : remap_table_1_11;
  wire [6:0]  remap_table_3_11 = _GEN_1[11] ? io_remap_reqs_2_pdst : remap_table_2_11;
  wire [6:0]  remap_table_4_11 = _GEN_2[11] ? io_remap_reqs_3_pdst : remap_table_3_11;
  wire [6:0]  remap_table_1_12 = _GEN[12] ? io_remap_reqs_0_pdst : map_table_12;
  wire [6:0]  remap_table_2_12 = _GEN_0[12] ? io_remap_reqs_1_pdst : remap_table_1_12;
  wire [6:0]  remap_table_3_12 = _GEN_1[12] ? io_remap_reqs_2_pdst : remap_table_2_12;
  wire [6:0]  remap_table_4_12 = _GEN_2[12] ? io_remap_reqs_3_pdst : remap_table_3_12;
  wire [6:0]  remap_table_1_13 = _GEN[13] ? io_remap_reqs_0_pdst : map_table_13;
  wire [6:0]  remap_table_2_13 = _GEN_0[13] ? io_remap_reqs_1_pdst : remap_table_1_13;
  wire [6:0]  remap_table_3_13 = _GEN_1[13] ? io_remap_reqs_2_pdst : remap_table_2_13;
  wire [6:0]  remap_table_4_13 = _GEN_2[13] ? io_remap_reqs_3_pdst : remap_table_3_13;
  wire [6:0]  remap_table_1_14 = _GEN[14] ? io_remap_reqs_0_pdst : map_table_14;
  wire [6:0]  remap_table_2_14 = _GEN_0[14] ? io_remap_reqs_1_pdst : remap_table_1_14;
  wire [6:0]  remap_table_3_14 = _GEN_1[14] ? io_remap_reqs_2_pdst : remap_table_2_14;
  wire [6:0]  remap_table_4_14 = _GEN_2[14] ? io_remap_reqs_3_pdst : remap_table_3_14;
  wire [6:0]  remap_table_1_15 = _GEN[15] ? io_remap_reqs_0_pdst : map_table_15;
  wire [6:0]  remap_table_2_15 = _GEN_0[15] ? io_remap_reqs_1_pdst : remap_table_1_15;
  wire [6:0]  remap_table_3_15 = _GEN_1[15] ? io_remap_reqs_2_pdst : remap_table_2_15;
  wire [6:0]  remap_table_4_15 = _GEN_2[15] ? io_remap_reqs_3_pdst : remap_table_3_15;
  wire [6:0]  remap_table_1_16 = _GEN[16] ? io_remap_reqs_0_pdst : map_table_16;
  wire [6:0]  remap_table_2_16 = _GEN_0[16] ? io_remap_reqs_1_pdst : remap_table_1_16;
  wire [6:0]  remap_table_3_16 = _GEN_1[16] ? io_remap_reqs_2_pdst : remap_table_2_16;
  wire [6:0]  remap_table_4_16 = _GEN_2[16] ? io_remap_reqs_3_pdst : remap_table_3_16;
  wire [6:0]  remap_table_1_17 = _GEN[17] ? io_remap_reqs_0_pdst : map_table_17;
  wire [6:0]  remap_table_2_17 = _GEN_0[17] ? io_remap_reqs_1_pdst : remap_table_1_17;
  wire [6:0]  remap_table_3_17 = _GEN_1[17] ? io_remap_reqs_2_pdst : remap_table_2_17;
  wire [6:0]  remap_table_4_17 = _GEN_2[17] ? io_remap_reqs_3_pdst : remap_table_3_17;
  wire [6:0]  remap_table_1_18 = _GEN[18] ? io_remap_reqs_0_pdst : map_table_18;
  wire [6:0]  remap_table_2_18 = _GEN_0[18] ? io_remap_reqs_1_pdst : remap_table_1_18;
  wire [6:0]  remap_table_3_18 = _GEN_1[18] ? io_remap_reqs_2_pdst : remap_table_2_18;
  wire [6:0]  remap_table_4_18 = _GEN_2[18] ? io_remap_reqs_3_pdst : remap_table_3_18;
  wire [6:0]  remap_table_1_19 = _GEN[19] ? io_remap_reqs_0_pdst : map_table_19;
  wire [6:0]  remap_table_2_19 = _GEN_0[19] ? io_remap_reqs_1_pdst : remap_table_1_19;
  wire [6:0]  remap_table_3_19 = _GEN_1[19] ? io_remap_reqs_2_pdst : remap_table_2_19;
  wire [6:0]  remap_table_4_19 = _GEN_2[19] ? io_remap_reqs_3_pdst : remap_table_3_19;
  wire [6:0]  remap_table_1_20 = _GEN[20] ? io_remap_reqs_0_pdst : map_table_20;
  wire [6:0]  remap_table_2_20 = _GEN_0[20] ? io_remap_reqs_1_pdst : remap_table_1_20;
  wire [6:0]  remap_table_3_20 = _GEN_1[20] ? io_remap_reqs_2_pdst : remap_table_2_20;
  wire [6:0]  remap_table_4_20 = _GEN_2[20] ? io_remap_reqs_3_pdst : remap_table_3_20;
  wire [6:0]  remap_table_1_21 = _GEN[21] ? io_remap_reqs_0_pdst : map_table_21;
  wire [6:0]  remap_table_2_21 = _GEN_0[21] ? io_remap_reqs_1_pdst : remap_table_1_21;
  wire [6:0]  remap_table_3_21 = _GEN_1[21] ? io_remap_reqs_2_pdst : remap_table_2_21;
  wire [6:0]  remap_table_4_21 = _GEN_2[21] ? io_remap_reqs_3_pdst : remap_table_3_21;
  wire [6:0]  remap_table_1_22 = _GEN[22] ? io_remap_reqs_0_pdst : map_table_22;
  wire [6:0]  remap_table_2_22 = _GEN_0[22] ? io_remap_reqs_1_pdst : remap_table_1_22;
  wire [6:0]  remap_table_3_22 = _GEN_1[22] ? io_remap_reqs_2_pdst : remap_table_2_22;
  wire [6:0]  remap_table_4_22 = _GEN_2[22] ? io_remap_reqs_3_pdst : remap_table_3_22;
  wire [6:0]  remap_table_1_23 = _GEN[23] ? io_remap_reqs_0_pdst : map_table_23;
  wire [6:0]  remap_table_2_23 = _GEN_0[23] ? io_remap_reqs_1_pdst : remap_table_1_23;
  wire [6:0]  remap_table_3_23 = _GEN_1[23] ? io_remap_reqs_2_pdst : remap_table_2_23;
  wire [6:0]  remap_table_4_23 = _GEN_2[23] ? io_remap_reqs_3_pdst : remap_table_3_23;
  wire [6:0]  remap_table_1_24 = _GEN[24] ? io_remap_reqs_0_pdst : map_table_24;
  wire [6:0]  remap_table_2_24 = _GEN_0[24] ? io_remap_reqs_1_pdst : remap_table_1_24;
  wire [6:0]  remap_table_3_24 = _GEN_1[24] ? io_remap_reqs_2_pdst : remap_table_2_24;
  wire [6:0]  remap_table_4_24 = _GEN_2[24] ? io_remap_reqs_3_pdst : remap_table_3_24;
  wire [6:0]  remap_table_1_25 = _GEN[25] ? io_remap_reqs_0_pdst : map_table_25;
  wire [6:0]  remap_table_2_25 = _GEN_0[25] ? io_remap_reqs_1_pdst : remap_table_1_25;
  wire [6:0]  remap_table_3_25 = _GEN_1[25] ? io_remap_reqs_2_pdst : remap_table_2_25;
  wire [6:0]  remap_table_4_25 = _GEN_2[25] ? io_remap_reqs_3_pdst : remap_table_3_25;
  wire [6:0]  remap_table_1_26 = _GEN[26] ? io_remap_reqs_0_pdst : map_table_26;
  wire [6:0]  remap_table_2_26 = _GEN_0[26] ? io_remap_reqs_1_pdst : remap_table_1_26;
  wire [6:0]  remap_table_3_26 = _GEN_1[26] ? io_remap_reqs_2_pdst : remap_table_2_26;
  wire [6:0]  remap_table_4_26 = _GEN_2[26] ? io_remap_reqs_3_pdst : remap_table_3_26;
  wire [6:0]  remap_table_1_27 = _GEN[27] ? io_remap_reqs_0_pdst : map_table_27;
  wire [6:0]  remap_table_2_27 = _GEN_0[27] ? io_remap_reqs_1_pdst : remap_table_1_27;
  wire [6:0]  remap_table_3_27 = _GEN_1[27] ? io_remap_reqs_2_pdst : remap_table_2_27;
  wire [6:0]  remap_table_4_27 = _GEN_2[27] ? io_remap_reqs_3_pdst : remap_table_3_27;
  wire [6:0]  remap_table_1_28 = _GEN[28] ? io_remap_reqs_0_pdst : map_table_28;
  wire [6:0]  remap_table_2_28 = _GEN_0[28] ? io_remap_reqs_1_pdst : remap_table_1_28;
  wire [6:0]  remap_table_3_28 = _GEN_1[28] ? io_remap_reqs_2_pdst : remap_table_2_28;
  wire [6:0]  remap_table_4_28 = _GEN_2[28] ? io_remap_reqs_3_pdst : remap_table_3_28;
  wire [6:0]  remap_table_1_29 = _GEN[29] ? io_remap_reqs_0_pdst : map_table_29;
  wire [6:0]  remap_table_2_29 = _GEN_0[29] ? io_remap_reqs_1_pdst : remap_table_1_29;
  wire [6:0]  remap_table_3_29 = _GEN_1[29] ? io_remap_reqs_2_pdst : remap_table_2_29;
  wire [6:0]  remap_table_4_29 = _GEN_2[29] ? io_remap_reqs_3_pdst : remap_table_3_29;
  wire [6:0]  remap_table_1_30 = _GEN[30] ? io_remap_reqs_0_pdst : map_table_30;
  wire [6:0]  remap_table_2_30 = _GEN_0[30] ? io_remap_reqs_1_pdst : remap_table_1_30;
  wire [6:0]  remap_table_3_30 = _GEN_1[30] ? io_remap_reqs_2_pdst : remap_table_2_30;
  wire [6:0]  remap_table_4_30 = _GEN_2[30] ? io_remap_reqs_3_pdst : remap_table_3_30;
  wire [6:0]  remap_table_1_31 = _GEN[31] ? io_remap_reqs_0_pdst : map_table_31;
  wire [6:0]  remap_table_2_31 = _GEN_0[31] ? io_remap_reqs_1_pdst : remap_table_1_31;
  wire [6:0]  remap_table_3_31 = _GEN_1[31] ? io_remap_reqs_2_pdst : remap_table_2_31;
  wire [6:0]  remap_table_4_31 = _GEN_2[31] ? io_remap_reqs_3_pdst : remap_table_3_31;
  always @(posedge clock) begin
    if (reset) begin
      map_table_0 <= 7'h0;
      map_table_1 <= 7'h0;
      map_table_2 <= 7'h0;
      map_table_3 <= 7'h0;
      map_table_4 <= 7'h0;
      map_table_5 <= 7'h0;
      map_table_6 <= 7'h0;
      map_table_7 <= 7'h0;
      map_table_8 <= 7'h0;
      map_table_9 <= 7'h0;
      map_table_10 <= 7'h0;
      map_table_11 <= 7'h0;
      map_table_12 <= 7'h0;
      map_table_13 <= 7'h0;
      map_table_14 <= 7'h0;
      map_table_15 <= 7'h0;
      map_table_16 <= 7'h0;
      map_table_17 <= 7'h0;
      map_table_18 <= 7'h0;
      map_table_19 <= 7'h0;
      map_table_20 <= 7'h0;
      map_table_21 <= 7'h0;
      map_table_22 <= 7'h0;
      map_table_23 <= 7'h0;
      map_table_24 <= 7'h0;
      map_table_25 <= 7'h0;
      map_table_26 <= 7'h0;
      map_table_27 <= 7'h0;
      map_table_28 <= 7'h0;
      map_table_29 <= 7'h0;
      map_table_30 <= 7'h0;
      map_table_31 <= 7'h0;
    end
    else if (io_brupdate_b2_mispredict) begin
      map_table_0 <= casez_tmp;
      map_table_1 <= casez_tmp_0;
      map_table_2 <= casez_tmp_1;
      map_table_3 <= casez_tmp_2;
      map_table_4 <= casez_tmp_3;
      map_table_5 <= casez_tmp_4;
      map_table_6 <= casez_tmp_5;
      map_table_7 <= casez_tmp_6;
      map_table_8 <= casez_tmp_7;
      map_table_9 <= casez_tmp_8;
      map_table_10 <= casez_tmp_9;
      map_table_11 <= casez_tmp_10;
      map_table_12 <= casez_tmp_11;
      map_table_13 <= casez_tmp_12;
      map_table_14 <= casez_tmp_13;
      map_table_15 <= casez_tmp_14;
      map_table_16 <= casez_tmp_15;
      map_table_17 <= casez_tmp_16;
      map_table_18 <= casez_tmp_17;
      map_table_19 <= casez_tmp_18;
      map_table_20 <= casez_tmp_19;
      map_table_21 <= casez_tmp_20;
      map_table_22 <= casez_tmp_21;
      map_table_23 <= casez_tmp_22;
      map_table_24 <= casez_tmp_23;
      map_table_25 <= casez_tmp_24;
      map_table_26 <= casez_tmp_25;
      map_table_27 <= casez_tmp_26;
      map_table_28 <= casez_tmp_27;
      map_table_29 <= casez_tmp_28;
      map_table_30 <= casez_tmp_29;
      map_table_31 <= casez_tmp_30;
    end
    else begin
      if (_GEN_2[0])
        map_table_0 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[0])
        map_table_0 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[0])
        map_table_0 <= io_remap_reqs_1_pdst;
      else if (_GEN[0])
        map_table_0 <= io_remap_reqs_0_pdst;
      if (_GEN_2[1])
        map_table_1 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[1])
        map_table_1 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[1])
        map_table_1 <= io_remap_reqs_1_pdst;
      else if (_GEN[1])
        map_table_1 <= io_remap_reqs_0_pdst;
      if (_GEN_2[2])
        map_table_2 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[2])
        map_table_2 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[2])
        map_table_2 <= io_remap_reqs_1_pdst;
      else if (_GEN[2])
        map_table_2 <= io_remap_reqs_0_pdst;
      if (_GEN_2[3])
        map_table_3 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[3])
        map_table_3 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[3])
        map_table_3 <= io_remap_reqs_1_pdst;
      else if (_GEN[3])
        map_table_3 <= io_remap_reqs_0_pdst;
      if (_GEN_2[4])
        map_table_4 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[4])
        map_table_4 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[4])
        map_table_4 <= io_remap_reqs_1_pdst;
      else if (_GEN[4])
        map_table_4 <= io_remap_reqs_0_pdst;
      if (_GEN_2[5])
        map_table_5 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[5])
        map_table_5 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[5])
        map_table_5 <= io_remap_reqs_1_pdst;
      else if (_GEN[5])
        map_table_5 <= io_remap_reqs_0_pdst;
      if (_GEN_2[6])
        map_table_6 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[6])
        map_table_6 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[6])
        map_table_6 <= io_remap_reqs_1_pdst;
      else if (_GEN[6])
        map_table_6 <= io_remap_reqs_0_pdst;
      if (_GEN_2[7])
        map_table_7 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[7])
        map_table_7 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[7])
        map_table_7 <= io_remap_reqs_1_pdst;
      else if (_GEN[7])
        map_table_7 <= io_remap_reqs_0_pdst;
      if (_GEN_2[8])
        map_table_8 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[8])
        map_table_8 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[8])
        map_table_8 <= io_remap_reqs_1_pdst;
      else if (_GEN[8])
        map_table_8 <= io_remap_reqs_0_pdst;
      if (_GEN_2[9])
        map_table_9 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[9])
        map_table_9 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[9])
        map_table_9 <= io_remap_reqs_1_pdst;
      else if (_GEN[9])
        map_table_9 <= io_remap_reqs_0_pdst;
      if (_GEN_2[10])
        map_table_10 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[10])
        map_table_10 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[10])
        map_table_10 <= io_remap_reqs_1_pdst;
      else if (_GEN[10])
        map_table_10 <= io_remap_reqs_0_pdst;
      if (_GEN_2[11])
        map_table_11 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[11])
        map_table_11 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[11])
        map_table_11 <= io_remap_reqs_1_pdst;
      else if (_GEN[11])
        map_table_11 <= io_remap_reqs_0_pdst;
      if (_GEN_2[12])
        map_table_12 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[12])
        map_table_12 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[12])
        map_table_12 <= io_remap_reqs_1_pdst;
      else if (_GEN[12])
        map_table_12 <= io_remap_reqs_0_pdst;
      if (_GEN_2[13])
        map_table_13 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[13])
        map_table_13 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[13])
        map_table_13 <= io_remap_reqs_1_pdst;
      else if (_GEN[13])
        map_table_13 <= io_remap_reqs_0_pdst;
      if (_GEN_2[14])
        map_table_14 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[14])
        map_table_14 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[14])
        map_table_14 <= io_remap_reqs_1_pdst;
      else if (_GEN[14])
        map_table_14 <= io_remap_reqs_0_pdst;
      if (_GEN_2[15])
        map_table_15 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[15])
        map_table_15 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[15])
        map_table_15 <= io_remap_reqs_1_pdst;
      else if (_GEN[15])
        map_table_15 <= io_remap_reqs_0_pdst;
      if (_GEN_2[16])
        map_table_16 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[16])
        map_table_16 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[16])
        map_table_16 <= io_remap_reqs_1_pdst;
      else if (_GEN[16])
        map_table_16 <= io_remap_reqs_0_pdst;
      if (_GEN_2[17])
        map_table_17 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[17])
        map_table_17 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[17])
        map_table_17 <= io_remap_reqs_1_pdst;
      else if (_GEN[17])
        map_table_17 <= io_remap_reqs_0_pdst;
      if (_GEN_2[18])
        map_table_18 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[18])
        map_table_18 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[18])
        map_table_18 <= io_remap_reqs_1_pdst;
      else if (_GEN[18])
        map_table_18 <= io_remap_reqs_0_pdst;
      if (_GEN_2[19])
        map_table_19 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[19])
        map_table_19 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[19])
        map_table_19 <= io_remap_reqs_1_pdst;
      else if (_GEN[19])
        map_table_19 <= io_remap_reqs_0_pdst;
      if (_GEN_2[20])
        map_table_20 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[20])
        map_table_20 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[20])
        map_table_20 <= io_remap_reqs_1_pdst;
      else if (_GEN[20])
        map_table_20 <= io_remap_reqs_0_pdst;
      if (_GEN_2[21])
        map_table_21 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[21])
        map_table_21 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[21])
        map_table_21 <= io_remap_reqs_1_pdst;
      else if (_GEN[21])
        map_table_21 <= io_remap_reqs_0_pdst;
      if (_GEN_2[22])
        map_table_22 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[22])
        map_table_22 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[22])
        map_table_22 <= io_remap_reqs_1_pdst;
      else if (_GEN[22])
        map_table_22 <= io_remap_reqs_0_pdst;
      if (_GEN_2[23])
        map_table_23 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[23])
        map_table_23 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[23])
        map_table_23 <= io_remap_reqs_1_pdst;
      else if (_GEN[23])
        map_table_23 <= io_remap_reqs_0_pdst;
      if (_GEN_2[24])
        map_table_24 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[24])
        map_table_24 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[24])
        map_table_24 <= io_remap_reqs_1_pdst;
      else if (_GEN[24])
        map_table_24 <= io_remap_reqs_0_pdst;
      if (_GEN_2[25])
        map_table_25 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[25])
        map_table_25 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[25])
        map_table_25 <= io_remap_reqs_1_pdst;
      else if (_GEN[25])
        map_table_25 <= io_remap_reqs_0_pdst;
      if (_GEN_2[26])
        map_table_26 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[26])
        map_table_26 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[26])
        map_table_26 <= io_remap_reqs_1_pdst;
      else if (_GEN[26])
        map_table_26 <= io_remap_reqs_0_pdst;
      if (_GEN_2[27])
        map_table_27 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[27])
        map_table_27 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[27])
        map_table_27 <= io_remap_reqs_1_pdst;
      else if (_GEN[27])
        map_table_27 <= io_remap_reqs_0_pdst;
      if (_GEN_2[28])
        map_table_28 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[28])
        map_table_28 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[28])
        map_table_28 <= io_remap_reqs_1_pdst;
      else if (_GEN[28])
        map_table_28 <= io_remap_reqs_0_pdst;
      if (_GEN_2[29])
        map_table_29 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[29])
        map_table_29 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[29])
        map_table_29 <= io_remap_reqs_1_pdst;
      else if (_GEN[29])
        map_table_29 <= io_remap_reqs_0_pdst;
      if (_GEN_2[30])
        map_table_30 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[30])
        map_table_30 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[30])
        map_table_30 <= io_remap_reqs_1_pdst;
      else if (_GEN[30])
        map_table_30 <= io_remap_reqs_0_pdst;
      if (_GEN_2[31])
        map_table_31 <= io_remap_reqs_3_pdst;
      else if (_GEN_1[31])
        map_table_31 <= io_remap_reqs_2_pdst;
      else if (_GEN_0[31])
        map_table_31 <= io_remap_reqs_1_pdst;
      else if (_GEN[31])
        map_table_31 <= io_remap_reqs_0_pdst;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'h0) begin
      br_snapshots_0_0 <= remap_table_4_0;
      br_snapshots_0_1 <= remap_table_4_1;
      br_snapshots_0_2 <= remap_table_4_2;
      br_snapshots_0_3 <= remap_table_4_3;
      br_snapshots_0_4 <= remap_table_4_4;
      br_snapshots_0_5 <= remap_table_4_5;
      br_snapshots_0_6 <= remap_table_4_6;
      br_snapshots_0_7 <= remap_table_4_7;
      br_snapshots_0_8 <= remap_table_4_8;
      br_snapshots_0_9 <= remap_table_4_9;
      br_snapshots_0_10 <= remap_table_4_10;
      br_snapshots_0_11 <= remap_table_4_11;
      br_snapshots_0_12 <= remap_table_4_12;
      br_snapshots_0_13 <= remap_table_4_13;
      br_snapshots_0_14 <= remap_table_4_14;
      br_snapshots_0_15 <= remap_table_4_15;
      br_snapshots_0_16 <= remap_table_4_16;
      br_snapshots_0_17 <= remap_table_4_17;
      br_snapshots_0_18 <= remap_table_4_18;
      br_snapshots_0_19 <= remap_table_4_19;
      br_snapshots_0_20 <= remap_table_4_20;
      br_snapshots_0_21 <= remap_table_4_21;
      br_snapshots_0_22 <= remap_table_4_22;
      br_snapshots_0_23 <= remap_table_4_23;
      br_snapshots_0_24 <= remap_table_4_24;
      br_snapshots_0_25 <= remap_table_4_25;
      br_snapshots_0_26 <= remap_table_4_26;
      br_snapshots_0_27 <= remap_table_4_27;
      br_snapshots_0_28 <= remap_table_4_28;
      br_snapshots_0_29 <= remap_table_4_29;
      br_snapshots_0_30 <= remap_table_4_30;
      br_snapshots_0_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'h0) begin
      br_snapshots_0_0 <= remap_table_3_0;
      br_snapshots_0_1 <= remap_table_3_1;
      br_snapshots_0_2 <= remap_table_3_2;
      br_snapshots_0_3 <= remap_table_3_3;
      br_snapshots_0_4 <= remap_table_3_4;
      br_snapshots_0_5 <= remap_table_3_5;
      br_snapshots_0_6 <= remap_table_3_6;
      br_snapshots_0_7 <= remap_table_3_7;
      br_snapshots_0_8 <= remap_table_3_8;
      br_snapshots_0_9 <= remap_table_3_9;
      br_snapshots_0_10 <= remap_table_3_10;
      br_snapshots_0_11 <= remap_table_3_11;
      br_snapshots_0_12 <= remap_table_3_12;
      br_snapshots_0_13 <= remap_table_3_13;
      br_snapshots_0_14 <= remap_table_3_14;
      br_snapshots_0_15 <= remap_table_3_15;
      br_snapshots_0_16 <= remap_table_3_16;
      br_snapshots_0_17 <= remap_table_3_17;
      br_snapshots_0_18 <= remap_table_3_18;
      br_snapshots_0_19 <= remap_table_3_19;
      br_snapshots_0_20 <= remap_table_3_20;
      br_snapshots_0_21 <= remap_table_3_21;
      br_snapshots_0_22 <= remap_table_3_22;
      br_snapshots_0_23 <= remap_table_3_23;
      br_snapshots_0_24 <= remap_table_3_24;
      br_snapshots_0_25 <= remap_table_3_25;
      br_snapshots_0_26 <= remap_table_3_26;
      br_snapshots_0_27 <= remap_table_3_27;
      br_snapshots_0_28 <= remap_table_3_28;
      br_snapshots_0_29 <= remap_table_3_29;
      br_snapshots_0_30 <= remap_table_3_30;
      br_snapshots_0_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'h0) begin
      br_snapshots_0_0 <= remap_table_2_0;
      br_snapshots_0_1 <= remap_table_2_1;
      br_snapshots_0_2 <= remap_table_2_2;
      br_snapshots_0_3 <= remap_table_2_3;
      br_snapshots_0_4 <= remap_table_2_4;
      br_snapshots_0_5 <= remap_table_2_5;
      br_snapshots_0_6 <= remap_table_2_6;
      br_snapshots_0_7 <= remap_table_2_7;
      br_snapshots_0_8 <= remap_table_2_8;
      br_snapshots_0_9 <= remap_table_2_9;
      br_snapshots_0_10 <= remap_table_2_10;
      br_snapshots_0_11 <= remap_table_2_11;
      br_snapshots_0_12 <= remap_table_2_12;
      br_snapshots_0_13 <= remap_table_2_13;
      br_snapshots_0_14 <= remap_table_2_14;
      br_snapshots_0_15 <= remap_table_2_15;
      br_snapshots_0_16 <= remap_table_2_16;
      br_snapshots_0_17 <= remap_table_2_17;
      br_snapshots_0_18 <= remap_table_2_18;
      br_snapshots_0_19 <= remap_table_2_19;
      br_snapshots_0_20 <= remap_table_2_20;
      br_snapshots_0_21 <= remap_table_2_21;
      br_snapshots_0_22 <= remap_table_2_22;
      br_snapshots_0_23 <= remap_table_2_23;
      br_snapshots_0_24 <= remap_table_2_24;
      br_snapshots_0_25 <= remap_table_2_25;
      br_snapshots_0_26 <= remap_table_2_26;
      br_snapshots_0_27 <= remap_table_2_27;
      br_snapshots_0_28 <= remap_table_2_28;
      br_snapshots_0_29 <= remap_table_2_29;
      br_snapshots_0_30 <= remap_table_2_30;
      br_snapshots_0_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'h0) begin
      br_snapshots_0_0 <= remap_table_1_0;
      br_snapshots_0_1 <= remap_table_1_1;
      br_snapshots_0_2 <= remap_table_1_2;
      br_snapshots_0_3 <= remap_table_1_3;
      br_snapshots_0_4 <= remap_table_1_4;
      br_snapshots_0_5 <= remap_table_1_5;
      br_snapshots_0_6 <= remap_table_1_6;
      br_snapshots_0_7 <= remap_table_1_7;
      br_snapshots_0_8 <= remap_table_1_8;
      br_snapshots_0_9 <= remap_table_1_9;
      br_snapshots_0_10 <= remap_table_1_10;
      br_snapshots_0_11 <= remap_table_1_11;
      br_snapshots_0_12 <= remap_table_1_12;
      br_snapshots_0_13 <= remap_table_1_13;
      br_snapshots_0_14 <= remap_table_1_14;
      br_snapshots_0_15 <= remap_table_1_15;
      br_snapshots_0_16 <= remap_table_1_16;
      br_snapshots_0_17 <= remap_table_1_17;
      br_snapshots_0_18 <= remap_table_1_18;
      br_snapshots_0_19 <= remap_table_1_19;
      br_snapshots_0_20 <= remap_table_1_20;
      br_snapshots_0_21 <= remap_table_1_21;
      br_snapshots_0_22 <= remap_table_1_22;
      br_snapshots_0_23 <= remap_table_1_23;
      br_snapshots_0_24 <= remap_table_1_24;
      br_snapshots_0_25 <= remap_table_1_25;
      br_snapshots_0_26 <= remap_table_1_26;
      br_snapshots_0_27 <= remap_table_1_27;
      br_snapshots_0_28 <= remap_table_1_28;
      br_snapshots_0_29 <= remap_table_1_29;
      br_snapshots_0_30 <= remap_table_1_30;
      br_snapshots_0_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'h1) begin
      br_snapshots_1_0 <= remap_table_4_0;
      br_snapshots_1_1 <= remap_table_4_1;
      br_snapshots_1_2 <= remap_table_4_2;
      br_snapshots_1_3 <= remap_table_4_3;
      br_snapshots_1_4 <= remap_table_4_4;
      br_snapshots_1_5 <= remap_table_4_5;
      br_snapshots_1_6 <= remap_table_4_6;
      br_snapshots_1_7 <= remap_table_4_7;
      br_snapshots_1_8 <= remap_table_4_8;
      br_snapshots_1_9 <= remap_table_4_9;
      br_snapshots_1_10 <= remap_table_4_10;
      br_snapshots_1_11 <= remap_table_4_11;
      br_snapshots_1_12 <= remap_table_4_12;
      br_snapshots_1_13 <= remap_table_4_13;
      br_snapshots_1_14 <= remap_table_4_14;
      br_snapshots_1_15 <= remap_table_4_15;
      br_snapshots_1_16 <= remap_table_4_16;
      br_snapshots_1_17 <= remap_table_4_17;
      br_snapshots_1_18 <= remap_table_4_18;
      br_snapshots_1_19 <= remap_table_4_19;
      br_snapshots_1_20 <= remap_table_4_20;
      br_snapshots_1_21 <= remap_table_4_21;
      br_snapshots_1_22 <= remap_table_4_22;
      br_snapshots_1_23 <= remap_table_4_23;
      br_snapshots_1_24 <= remap_table_4_24;
      br_snapshots_1_25 <= remap_table_4_25;
      br_snapshots_1_26 <= remap_table_4_26;
      br_snapshots_1_27 <= remap_table_4_27;
      br_snapshots_1_28 <= remap_table_4_28;
      br_snapshots_1_29 <= remap_table_4_29;
      br_snapshots_1_30 <= remap_table_4_30;
      br_snapshots_1_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'h1) begin
      br_snapshots_1_0 <= remap_table_3_0;
      br_snapshots_1_1 <= remap_table_3_1;
      br_snapshots_1_2 <= remap_table_3_2;
      br_snapshots_1_3 <= remap_table_3_3;
      br_snapshots_1_4 <= remap_table_3_4;
      br_snapshots_1_5 <= remap_table_3_5;
      br_snapshots_1_6 <= remap_table_3_6;
      br_snapshots_1_7 <= remap_table_3_7;
      br_snapshots_1_8 <= remap_table_3_8;
      br_snapshots_1_9 <= remap_table_3_9;
      br_snapshots_1_10 <= remap_table_3_10;
      br_snapshots_1_11 <= remap_table_3_11;
      br_snapshots_1_12 <= remap_table_3_12;
      br_snapshots_1_13 <= remap_table_3_13;
      br_snapshots_1_14 <= remap_table_3_14;
      br_snapshots_1_15 <= remap_table_3_15;
      br_snapshots_1_16 <= remap_table_3_16;
      br_snapshots_1_17 <= remap_table_3_17;
      br_snapshots_1_18 <= remap_table_3_18;
      br_snapshots_1_19 <= remap_table_3_19;
      br_snapshots_1_20 <= remap_table_3_20;
      br_snapshots_1_21 <= remap_table_3_21;
      br_snapshots_1_22 <= remap_table_3_22;
      br_snapshots_1_23 <= remap_table_3_23;
      br_snapshots_1_24 <= remap_table_3_24;
      br_snapshots_1_25 <= remap_table_3_25;
      br_snapshots_1_26 <= remap_table_3_26;
      br_snapshots_1_27 <= remap_table_3_27;
      br_snapshots_1_28 <= remap_table_3_28;
      br_snapshots_1_29 <= remap_table_3_29;
      br_snapshots_1_30 <= remap_table_3_30;
      br_snapshots_1_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'h1) begin
      br_snapshots_1_0 <= remap_table_2_0;
      br_snapshots_1_1 <= remap_table_2_1;
      br_snapshots_1_2 <= remap_table_2_2;
      br_snapshots_1_3 <= remap_table_2_3;
      br_snapshots_1_4 <= remap_table_2_4;
      br_snapshots_1_5 <= remap_table_2_5;
      br_snapshots_1_6 <= remap_table_2_6;
      br_snapshots_1_7 <= remap_table_2_7;
      br_snapshots_1_8 <= remap_table_2_8;
      br_snapshots_1_9 <= remap_table_2_9;
      br_snapshots_1_10 <= remap_table_2_10;
      br_snapshots_1_11 <= remap_table_2_11;
      br_snapshots_1_12 <= remap_table_2_12;
      br_snapshots_1_13 <= remap_table_2_13;
      br_snapshots_1_14 <= remap_table_2_14;
      br_snapshots_1_15 <= remap_table_2_15;
      br_snapshots_1_16 <= remap_table_2_16;
      br_snapshots_1_17 <= remap_table_2_17;
      br_snapshots_1_18 <= remap_table_2_18;
      br_snapshots_1_19 <= remap_table_2_19;
      br_snapshots_1_20 <= remap_table_2_20;
      br_snapshots_1_21 <= remap_table_2_21;
      br_snapshots_1_22 <= remap_table_2_22;
      br_snapshots_1_23 <= remap_table_2_23;
      br_snapshots_1_24 <= remap_table_2_24;
      br_snapshots_1_25 <= remap_table_2_25;
      br_snapshots_1_26 <= remap_table_2_26;
      br_snapshots_1_27 <= remap_table_2_27;
      br_snapshots_1_28 <= remap_table_2_28;
      br_snapshots_1_29 <= remap_table_2_29;
      br_snapshots_1_30 <= remap_table_2_30;
      br_snapshots_1_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'h1) begin
      br_snapshots_1_0 <= remap_table_1_0;
      br_snapshots_1_1 <= remap_table_1_1;
      br_snapshots_1_2 <= remap_table_1_2;
      br_snapshots_1_3 <= remap_table_1_3;
      br_snapshots_1_4 <= remap_table_1_4;
      br_snapshots_1_5 <= remap_table_1_5;
      br_snapshots_1_6 <= remap_table_1_6;
      br_snapshots_1_7 <= remap_table_1_7;
      br_snapshots_1_8 <= remap_table_1_8;
      br_snapshots_1_9 <= remap_table_1_9;
      br_snapshots_1_10 <= remap_table_1_10;
      br_snapshots_1_11 <= remap_table_1_11;
      br_snapshots_1_12 <= remap_table_1_12;
      br_snapshots_1_13 <= remap_table_1_13;
      br_snapshots_1_14 <= remap_table_1_14;
      br_snapshots_1_15 <= remap_table_1_15;
      br_snapshots_1_16 <= remap_table_1_16;
      br_snapshots_1_17 <= remap_table_1_17;
      br_snapshots_1_18 <= remap_table_1_18;
      br_snapshots_1_19 <= remap_table_1_19;
      br_snapshots_1_20 <= remap_table_1_20;
      br_snapshots_1_21 <= remap_table_1_21;
      br_snapshots_1_22 <= remap_table_1_22;
      br_snapshots_1_23 <= remap_table_1_23;
      br_snapshots_1_24 <= remap_table_1_24;
      br_snapshots_1_25 <= remap_table_1_25;
      br_snapshots_1_26 <= remap_table_1_26;
      br_snapshots_1_27 <= remap_table_1_27;
      br_snapshots_1_28 <= remap_table_1_28;
      br_snapshots_1_29 <= remap_table_1_29;
      br_snapshots_1_30 <= remap_table_1_30;
      br_snapshots_1_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'h2) begin
      br_snapshots_2_0 <= remap_table_4_0;
      br_snapshots_2_1 <= remap_table_4_1;
      br_snapshots_2_2 <= remap_table_4_2;
      br_snapshots_2_3 <= remap_table_4_3;
      br_snapshots_2_4 <= remap_table_4_4;
      br_snapshots_2_5 <= remap_table_4_5;
      br_snapshots_2_6 <= remap_table_4_6;
      br_snapshots_2_7 <= remap_table_4_7;
      br_snapshots_2_8 <= remap_table_4_8;
      br_snapshots_2_9 <= remap_table_4_9;
      br_snapshots_2_10 <= remap_table_4_10;
      br_snapshots_2_11 <= remap_table_4_11;
      br_snapshots_2_12 <= remap_table_4_12;
      br_snapshots_2_13 <= remap_table_4_13;
      br_snapshots_2_14 <= remap_table_4_14;
      br_snapshots_2_15 <= remap_table_4_15;
      br_snapshots_2_16 <= remap_table_4_16;
      br_snapshots_2_17 <= remap_table_4_17;
      br_snapshots_2_18 <= remap_table_4_18;
      br_snapshots_2_19 <= remap_table_4_19;
      br_snapshots_2_20 <= remap_table_4_20;
      br_snapshots_2_21 <= remap_table_4_21;
      br_snapshots_2_22 <= remap_table_4_22;
      br_snapshots_2_23 <= remap_table_4_23;
      br_snapshots_2_24 <= remap_table_4_24;
      br_snapshots_2_25 <= remap_table_4_25;
      br_snapshots_2_26 <= remap_table_4_26;
      br_snapshots_2_27 <= remap_table_4_27;
      br_snapshots_2_28 <= remap_table_4_28;
      br_snapshots_2_29 <= remap_table_4_29;
      br_snapshots_2_30 <= remap_table_4_30;
      br_snapshots_2_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'h2) begin
      br_snapshots_2_0 <= remap_table_3_0;
      br_snapshots_2_1 <= remap_table_3_1;
      br_snapshots_2_2 <= remap_table_3_2;
      br_snapshots_2_3 <= remap_table_3_3;
      br_snapshots_2_4 <= remap_table_3_4;
      br_snapshots_2_5 <= remap_table_3_5;
      br_snapshots_2_6 <= remap_table_3_6;
      br_snapshots_2_7 <= remap_table_3_7;
      br_snapshots_2_8 <= remap_table_3_8;
      br_snapshots_2_9 <= remap_table_3_9;
      br_snapshots_2_10 <= remap_table_3_10;
      br_snapshots_2_11 <= remap_table_3_11;
      br_snapshots_2_12 <= remap_table_3_12;
      br_snapshots_2_13 <= remap_table_3_13;
      br_snapshots_2_14 <= remap_table_3_14;
      br_snapshots_2_15 <= remap_table_3_15;
      br_snapshots_2_16 <= remap_table_3_16;
      br_snapshots_2_17 <= remap_table_3_17;
      br_snapshots_2_18 <= remap_table_3_18;
      br_snapshots_2_19 <= remap_table_3_19;
      br_snapshots_2_20 <= remap_table_3_20;
      br_snapshots_2_21 <= remap_table_3_21;
      br_snapshots_2_22 <= remap_table_3_22;
      br_snapshots_2_23 <= remap_table_3_23;
      br_snapshots_2_24 <= remap_table_3_24;
      br_snapshots_2_25 <= remap_table_3_25;
      br_snapshots_2_26 <= remap_table_3_26;
      br_snapshots_2_27 <= remap_table_3_27;
      br_snapshots_2_28 <= remap_table_3_28;
      br_snapshots_2_29 <= remap_table_3_29;
      br_snapshots_2_30 <= remap_table_3_30;
      br_snapshots_2_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'h2) begin
      br_snapshots_2_0 <= remap_table_2_0;
      br_snapshots_2_1 <= remap_table_2_1;
      br_snapshots_2_2 <= remap_table_2_2;
      br_snapshots_2_3 <= remap_table_2_3;
      br_snapshots_2_4 <= remap_table_2_4;
      br_snapshots_2_5 <= remap_table_2_5;
      br_snapshots_2_6 <= remap_table_2_6;
      br_snapshots_2_7 <= remap_table_2_7;
      br_snapshots_2_8 <= remap_table_2_8;
      br_snapshots_2_9 <= remap_table_2_9;
      br_snapshots_2_10 <= remap_table_2_10;
      br_snapshots_2_11 <= remap_table_2_11;
      br_snapshots_2_12 <= remap_table_2_12;
      br_snapshots_2_13 <= remap_table_2_13;
      br_snapshots_2_14 <= remap_table_2_14;
      br_snapshots_2_15 <= remap_table_2_15;
      br_snapshots_2_16 <= remap_table_2_16;
      br_snapshots_2_17 <= remap_table_2_17;
      br_snapshots_2_18 <= remap_table_2_18;
      br_snapshots_2_19 <= remap_table_2_19;
      br_snapshots_2_20 <= remap_table_2_20;
      br_snapshots_2_21 <= remap_table_2_21;
      br_snapshots_2_22 <= remap_table_2_22;
      br_snapshots_2_23 <= remap_table_2_23;
      br_snapshots_2_24 <= remap_table_2_24;
      br_snapshots_2_25 <= remap_table_2_25;
      br_snapshots_2_26 <= remap_table_2_26;
      br_snapshots_2_27 <= remap_table_2_27;
      br_snapshots_2_28 <= remap_table_2_28;
      br_snapshots_2_29 <= remap_table_2_29;
      br_snapshots_2_30 <= remap_table_2_30;
      br_snapshots_2_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'h2) begin
      br_snapshots_2_0 <= remap_table_1_0;
      br_snapshots_2_1 <= remap_table_1_1;
      br_snapshots_2_2 <= remap_table_1_2;
      br_snapshots_2_3 <= remap_table_1_3;
      br_snapshots_2_4 <= remap_table_1_4;
      br_snapshots_2_5 <= remap_table_1_5;
      br_snapshots_2_6 <= remap_table_1_6;
      br_snapshots_2_7 <= remap_table_1_7;
      br_snapshots_2_8 <= remap_table_1_8;
      br_snapshots_2_9 <= remap_table_1_9;
      br_snapshots_2_10 <= remap_table_1_10;
      br_snapshots_2_11 <= remap_table_1_11;
      br_snapshots_2_12 <= remap_table_1_12;
      br_snapshots_2_13 <= remap_table_1_13;
      br_snapshots_2_14 <= remap_table_1_14;
      br_snapshots_2_15 <= remap_table_1_15;
      br_snapshots_2_16 <= remap_table_1_16;
      br_snapshots_2_17 <= remap_table_1_17;
      br_snapshots_2_18 <= remap_table_1_18;
      br_snapshots_2_19 <= remap_table_1_19;
      br_snapshots_2_20 <= remap_table_1_20;
      br_snapshots_2_21 <= remap_table_1_21;
      br_snapshots_2_22 <= remap_table_1_22;
      br_snapshots_2_23 <= remap_table_1_23;
      br_snapshots_2_24 <= remap_table_1_24;
      br_snapshots_2_25 <= remap_table_1_25;
      br_snapshots_2_26 <= remap_table_1_26;
      br_snapshots_2_27 <= remap_table_1_27;
      br_snapshots_2_28 <= remap_table_1_28;
      br_snapshots_2_29 <= remap_table_1_29;
      br_snapshots_2_30 <= remap_table_1_30;
      br_snapshots_2_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'h3) begin
      br_snapshots_3_0 <= remap_table_4_0;
      br_snapshots_3_1 <= remap_table_4_1;
      br_snapshots_3_2 <= remap_table_4_2;
      br_snapshots_3_3 <= remap_table_4_3;
      br_snapshots_3_4 <= remap_table_4_4;
      br_snapshots_3_5 <= remap_table_4_5;
      br_snapshots_3_6 <= remap_table_4_6;
      br_snapshots_3_7 <= remap_table_4_7;
      br_snapshots_3_8 <= remap_table_4_8;
      br_snapshots_3_9 <= remap_table_4_9;
      br_snapshots_3_10 <= remap_table_4_10;
      br_snapshots_3_11 <= remap_table_4_11;
      br_snapshots_3_12 <= remap_table_4_12;
      br_snapshots_3_13 <= remap_table_4_13;
      br_snapshots_3_14 <= remap_table_4_14;
      br_snapshots_3_15 <= remap_table_4_15;
      br_snapshots_3_16 <= remap_table_4_16;
      br_snapshots_3_17 <= remap_table_4_17;
      br_snapshots_3_18 <= remap_table_4_18;
      br_snapshots_3_19 <= remap_table_4_19;
      br_snapshots_3_20 <= remap_table_4_20;
      br_snapshots_3_21 <= remap_table_4_21;
      br_snapshots_3_22 <= remap_table_4_22;
      br_snapshots_3_23 <= remap_table_4_23;
      br_snapshots_3_24 <= remap_table_4_24;
      br_snapshots_3_25 <= remap_table_4_25;
      br_snapshots_3_26 <= remap_table_4_26;
      br_snapshots_3_27 <= remap_table_4_27;
      br_snapshots_3_28 <= remap_table_4_28;
      br_snapshots_3_29 <= remap_table_4_29;
      br_snapshots_3_30 <= remap_table_4_30;
      br_snapshots_3_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'h3) begin
      br_snapshots_3_0 <= remap_table_3_0;
      br_snapshots_3_1 <= remap_table_3_1;
      br_snapshots_3_2 <= remap_table_3_2;
      br_snapshots_3_3 <= remap_table_3_3;
      br_snapshots_3_4 <= remap_table_3_4;
      br_snapshots_3_5 <= remap_table_3_5;
      br_snapshots_3_6 <= remap_table_3_6;
      br_snapshots_3_7 <= remap_table_3_7;
      br_snapshots_3_8 <= remap_table_3_8;
      br_snapshots_3_9 <= remap_table_3_9;
      br_snapshots_3_10 <= remap_table_3_10;
      br_snapshots_3_11 <= remap_table_3_11;
      br_snapshots_3_12 <= remap_table_3_12;
      br_snapshots_3_13 <= remap_table_3_13;
      br_snapshots_3_14 <= remap_table_3_14;
      br_snapshots_3_15 <= remap_table_3_15;
      br_snapshots_3_16 <= remap_table_3_16;
      br_snapshots_3_17 <= remap_table_3_17;
      br_snapshots_3_18 <= remap_table_3_18;
      br_snapshots_3_19 <= remap_table_3_19;
      br_snapshots_3_20 <= remap_table_3_20;
      br_snapshots_3_21 <= remap_table_3_21;
      br_snapshots_3_22 <= remap_table_3_22;
      br_snapshots_3_23 <= remap_table_3_23;
      br_snapshots_3_24 <= remap_table_3_24;
      br_snapshots_3_25 <= remap_table_3_25;
      br_snapshots_3_26 <= remap_table_3_26;
      br_snapshots_3_27 <= remap_table_3_27;
      br_snapshots_3_28 <= remap_table_3_28;
      br_snapshots_3_29 <= remap_table_3_29;
      br_snapshots_3_30 <= remap_table_3_30;
      br_snapshots_3_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'h3) begin
      br_snapshots_3_0 <= remap_table_2_0;
      br_snapshots_3_1 <= remap_table_2_1;
      br_snapshots_3_2 <= remap_table_2_2;
      br_snapshots_3_3 <= remap_table_2_3;
      br_snapshots_3_4 <= remap_table_2_4;
      br_snapshots_3_5 <= remap_table_2_5;
      br_snapshots_3_6 <= remap_table_2_6;
      br_snapshots_3_7 <= remap_table_2_7;
      br_snapshots_3_8 <= remap_table_2_8;
      br_snapshots_3_9 <= remap_table_2_9;
      br_snapshots_3_10 <= remap_table_2_10;
      br_snapshots_3_11 <= remap_table_2_11;
      br_snapshots_3_12 <= remap_table_2_12;
      br_snapshots_3_13 <= remap_table_2_13;
      br_snapshots_3_14 <= remap_table_2_14;
      br_snapshots_3_15 <= remap_table_2_15;
      br_snapshots_3_16 <= remap_table_2_16;
      br_snapshots_3_17 <= remap_table_2_17;
      br_snapshots_3_18 <= remap_table_2_18;
      br_snapshots_3_19 <= remap_table_2_19;
      br_snapshots_3_20 <= remap_table_2_20;
      br_snapshots_3_21 <= remap_table_2_21;
      br_snapshots_3_22 <= remap_table_2_22;
      br_snapshots_3_23 <= remap_table_2_23;
      br_snapshots_3_24 <= remap_table_2_24;
      br_snapshots_3_25 <= remap_table_2_25;
      br_snapshots_3_26 <= remap_table_2_26;
      br_snapshots_3_27 <= remap_table_2_27;
      br_snapshots_3_28 <= remap_table_2_28;
      br_snapshots_3_29 <= remap_table_2_29;
      br_snapshots_3_30 <= remap_table_2_30;
      br_snapshots_3_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'h3) begin
      br_snapshots_3_0 <= remap_table_1_0;
      br_snapshots_3_1 <= remap_table_1_1;
      br_snapshots_3_2 <= remap_table_1_2;
      br_snapshots_3_3 <= remap_table_1_3;
      br_snapshots_3_4 <= remap_table_1_4;
      br_snapshots_3_5 <= remap_table_1_5;
      br_snapshots_3_6 <= remap_table_1_6;
      br_snapshots_3_7 <= remap_table_1_7;
      br_snapshots_3_8 <= remap_table_1_8;
      br_snapshots_3_9 <= remap_table_1_9;
      br_snapshots_3_10 <= remap_table_1_10;
      br_snapshots_3_11 <= remap_table_1_11;
      br_snapshots_3_12 <= remap_table_1_12;
      br_snapshots_3_13 <= remap_table_1_13;
      br_snapshots_3_14 <= remap_table_1_14;
      br_snapshots_3_15 <= remap_table_1_15;
      br_snapshots_3_16 <= remap_table_1_16;
      br_snapshots_3_17 <= remap_table_1_17;
      br_snapshots_3_18 <= remap_table_1_18;
      br_snapshots_3_19 <= remap_table_1_19;
      br_snapshots_3_20 <= remap_table_1_20;
      br_snapshots_3_21 <= remap_table_1_21;
      br_snapshots_3_22 <= remap_table_1_22;
      br_snapshots_3_23 <= remap_table_1_23;
      br_snapshots_3_24 <= remap_table_1_24;
      br_snapshots_3_25 <= remap_table_1_25;
      br_snapshots_3_26 <= remap_table_1_26;
      br_snapshots_3_27 <= remap_table_1_27;
      br_snapshots_3_28 <= remap_table_1_28;
      br_snapshots_3_29 <= remap_table_1_29;
      br_snapshots_3_30 <= remap_table_1_30;
      br_snapshots_3_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'h4) begin
      br_snapshots_4_0 <= remap_table_4_0;
      br_snapshots_4_1 <= remap_table_4_1;
      br_snapshots_4_2 <= remap_table_4_2;
      br_snapshots_4_3 <= remap_table_4_3;
      br_snapshots_4_4 <= remap_table_4_4;
      br_snapshots_4_5 <= remap_table_4_5;
      br_snapshots_4_6 <= remap_table_4_6;
      br_snapshots_4_7 <= remap_table_4_7;
      br_snapshots_4_8 <= remap_table_4_8;
      br_snapshots_4_9 <= remap_table_4_9;
      br_snapshots_4_10 <= remap_table_4_10;
      br_snapshots_4_11 <= remap_table_4_11;
      br_snapshots_4_12 <= remap_table_4_12;
      br_snapshots_4_13 <= remap_table_4_13;
      br_snapshots_4_14 <= remap_table_4_14;
      br_snapshots_4_15 <= remap_table_4_15;
      br_snapshots_4_16 <= remap_table_4_16;
      br_snapshots_4_17 <= remap_table_4_17;
      br_snapshots_4_18 <= remap_table_4_18;
      br_snapshots_4_19 <= remap_table_4_19;
      br_snapshots_4_20 <= remap_table_4_20;
      br_snapshots_4_21 <= remap_table_4_21;
      br_snapshots_4_22 <= remap_table_4_22;
      br_snapshots_4_23 <= remap_table_4_23;
      br_snapshots_4_24 <= remap_table_4_24;
      br_snapshots_4_25 <= remap_table_4_25;
      br_snapshots_4_26 <= remap_table_4_26;
      br_snapshots_4_27 <= remap_table_4_27;
      br_snapshots_4_28 <= remap_table_4_28;
      br_snapshots_4_29 <= remap_table_4_29;
      br_snapshots_4_30 <= remap_table_4_30;
      br_snapshots_4_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'h4) begin
      br_snapshots_4_0 <= remap_table_3_0;
      br_snapshots_4_1 <= remap_table_3_1;
      br_snapshots_4_2 <= remap_table_3_2;
      br_snapshots_4_3 <= remap_table_3_3;
      br_snapshots_4_4 <= remap_table_3_4;
      br_snapshots_4_5 <= remap_table_3_5;
      br_snapshots_4_6 <= remap_table_3_6;
      br_snapshots_4_7 <= remap_table_3_7;
      br_snapshots_4_8 <= remap_table_3_8;
      br_snapshots_4_9 <= remap_table_3_9;
      br_snapshots_4_10 <= remap_table_3_10;
      br_snapshots_4_11 <= remap_table_3_11;
      br_snapshots_4_12 <= remap_table_3_12;
      br_snapshots_4_13 <= remap_table_3_13;
      br_snapshots_4_14 <= remap_table_3_14;
      br_snapshots_4_15 <= remap_table_3_15;
      br_snapshots_4_16 <= remap_table_3_16;
      br_snapshots_4_17 <= remap_table_3_17;
      br_snapshots_4_18 <= remap_table_3_18;
      br_snapshots_4_19 <= remap_table_3_19;
      br_snapshots_4_20 <= remap_table_3_20;
      br_snapshots_4_21 <= remap_table_3_21;
      br_snapshots_4_22 <= remap_table_3_22;
      br_snapshots_4_23 <= remap_table_3_23;
      br_snapshots_4_24 <= remap_table_3_24;
      br_snapshots_4_25 <= remap_table_3_25;
      br_snapshots_4_26 <= remap_table_3_26;
      br_snapshots_4_27 <= remap_table_3_27;
      br_snapshots_4_28 <= remap_table_3_28;
      br_snapshots_4_29 <= remap_table_3_29;
      br_snapshots_4_30 <= remap_table_3_30;
      br_snapshots_4_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'h4) begin
      br_snapshots_4_0 <= remap_table_2_0;
      br_snapshots_4_1 <= remap_table_2_1;
      br_snapshots_4_2 <= remap_table_2_2;
      br_snapshots_4_3 <= remap_table_2_3;
      br_snapshots_4_4 <= remap_table_2_4;
      br_snapshots_4_5 <= remap_table_2_5;
      br_snapshots_4_6 <= remap_table_2_6;
      br_snapshots_4_7 <= remap_table_2_7;
      br_snapshots_4_8 <= remap_table_2_8;
      br_snapshots_4_9 <= remap_table_2_9;
      br_snapshots_4_10 <= remap_table_2_10;
      br_snapshots_4_11 <= remap_table_2_11;
      br_snapshots_4_12 <= remap_table_2_12;
      br_snapshots_4_13 <= remap_table_2_13;
      br_snapshots_4_14 <= remap_table_2_14;
      br_snapshots_4_15 <= remap_table_2_15;
      br_snapshots_4_16 <= remap_table_2_16;
      br_snapshots_4_17 <= remap_table_2_17;
      br_snapshots_4_18 <= remap_table_2_18;
      br_snapshots_4_19 <= remap_table_2_19;
      br_snapshots_4_20 <= remap_table_2_20;
      br_snapshots_4_21 <= remap_table_2_21;
      br_snapshots_4_22 <= remap_table_2_22;
      br_snapshots_4_23 <= remap_table_2_23;
      br_snapshots_4_24 <= remap_table_2_24;
      br_snapshots_4_25 <= remap_table_2_25;
      br_snapshots_4_26 <= remap_table_2_26;
      br_snapshots_4_27 <= remap_table_2_27;
      br_snapshots_4_28 <= remap_table_2_28;
      br_snapshots_4_29 <= remap_table_2_29;
      br_snapshots_4_30 <= remap_table_2_30;
      br_snapshots_4_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'h4) begin
      br_snapshots_4_0 <= remap_table_1_0;
      br_snapshots_4_1 <= remap_table_1_1;
      br_snapshots_4_2 <= remap_table_1_2;
      br_snapshots_4_3 <= remap_table_1_3;
      br_snapshots_4_4 <= remap_table_1_4;
      br_snapshots_4_5 <= remap_table_1_5;
      br_snapshots_4_6 <= remap_table_1_6;
      br_snapshots_4_7 <= remap_table_1_7;
      br_snapshots_4_8 <= remap_table_1_8;
      br_snapshots_4_9 <= remap_table_1_9;
      br_snapshots_4_10 <= remap_table_1_10;
      br_snapshots_4_11 <= remap_table_1_11;
      br_snapshots_4_12 <= remap_table_1_12;
      br_snapshots_4_13 <= remap_table_1_13;
      br_snapshots_4_14 <= remap_table_1_14;
      br_snapshots_4_15 <= remap_table_1_15;
      br_snapshots_4_16 <= remap_table_1_16;
      br_snapshots_4_17 <= remap_table_1_17;
      br_snapshots_4_18 <= remap_table_1_18;
      br_snapshots_4_19 <= remap_table_1_19;
      br_snapshots_4_20 <= remap_table_1_20;
      br_snapshots_4_21 <= remap_table_1_21;
      br_snapshots_4_22 <= remap_table_1_22;
      br_snapshots_4_23 <= remap_table_1_23;
      br_snapshots_4_24 <= remap_table_1_24;
      br_snapshots_4_25 <= remap_table_1_25;
      br_snapshots_4_26 <= remap_table_1_26;
      br_snapshots_4_27 <= remap_table_1_27;
      br_snapshots_4_28 <= remap_table_1_28;
      br_snapshots_4_29 <= remap_table_1_29;
      br_snapshots_4_30 <= remap_table_1_30;
      br_snapshots_4_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'h5) begin
      br_snapshots_5_0 <= remap_table_4_0;
      br_snapshots_5_1 <= remap_table_4_1;
      br_snapshots_5_2 <= remap_table_4_2;
      br_snapshots_5_3 <= remap_table_4_3;
      br_snapshots_5_4 <= remap_table_4_4;
      br_snapshots_5_5 <= remap_table_4_5;
      br_snapshots_5_6 <= remap_table_4_6;
      br_snapshots_5_7 <= remap_table_4_7;
      br_snapshots_5_8 <= remap_table_4_8;
      br_snapshots_5_9 <= remap_table_4_9;
      br_snapshots_5_10 <= remap_table_4_10;
      br_snapshots_5_11 <= remap_table_4_11;
      br_snapshots_5_12 <= remap_table_4_12;
      br_snapshots_5_13 <= remap_table_4_13;
      br_snapshots_5_14 <= remap_table_4_14;
      br_snapshots_5_15 <= remap_table_4_15;
      br_snapshots_5_16 <= remap_table_4_16;
      br_snapshots_5_17 <= remap_table_4_17;
      br_snapshots_5_18 <= remap_table_4_18;
      br_snapshots_5_19 <= remap_table_4_19;
      br_snapshots_5_20 <= remap_table_4_20;
      br_snapshots_5_21 <= remap_table_4_21;
      br_snapshots_5_22 <= remap_table_4_22;
      br_snapshots_5_23 <= remap_table_4_23;
      br_snapshots_5_24 <= remap_table_4_24;
      br_snapshots_5_25 <= remap_table_4_25;
      br_snapshots_5_26 <= remap_table_4_26;
      br_snapshots_5_27 <= remap_table_4_27;
      br_snapshots_5_28 <= remap_table_4_28;
      br_snapshots_5_29 <= remap_table_4_29;
      br_snapshots_5_30 <= remap_table_4_30;
      br_snapshots_5_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'h5) begin
      br_snapshots_5_0 <= remap_table_3_0;
      br_snapshots_5_1 <= remap_table_3_1;
      br_snapshots_5_2 <= remap_table_3_2;
      br_snapshots_5_3 <= remap_table_3_3;
      br_snapshots_5_4 <= remap_table_3_4;
      br_snapshots_5_5 <= remap_table_3_5;
      br_snapshots_5_6 <= remap_table_3_6;
      br_snapshots_5_7 <= remap_table_3_7;
      br_snapshots_5_8 <= remap_table_3_8;
      br_snapshots_5_9 <= remap_table_3_9;
      br_snapshots_5_10 <= remap_table_3_10;
      br_snapshots_5_11 <= remap_table_3_11;
      br_snapshots_5_12 <= remap_table_3_12;
      br_snapshots_5_13 <= remap_table_3_13;
      br_snapshots_5_14 <= remap_table_3_14;
      br_snapshots_5_15 <= remap_table_3_15;
      br_snapshots_5_16 <= remap_table_3_16;
      br_snapshots_5_17 <= remap_table_3_17;
      br_snapshots_5_18 <= remap_table_3_18;
      br_snapshots_5_19 <= remap_table_3_19;
      br_snapshots_5_20 <= remap_table_3_20;
      br_snapshots_5_21 <= remap_table_3_21;
      br_snapshots_5_22 <= remap_table_3_22;
      br_snapshots_5_23 <= remap_table_3_23;
      br_snapshots_5_24 <= remap_table_3_24;
      br_snapshots_5_25 <= remap_table_3_25;
      br_snapshots_5_26 <= remap_table_3_26;
      br_snapshots_5_27 <= remap_table_3_27;
      br_snapshots_5_28 <= remap_table_3_28;
      br_snapshots_5_29 <= remap_table_3_29;
      br_snapshots_5_30 <= remap_table_3_30;
      br_snapshots_5_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'h5) begin
      br_snapshots_5_0 <= remap_table_2_0;
      br_snapshots_5_1 <= remap_table_2_1;
      br_snapshots_5_2 <= remap_table_2_2;
      br_snapshots_5_3 <= remap_table_2_3;
      br_snapshots_5_4 <= remap_table_2_4;
      br_snapshots_5_5 <= remap_table_2_5;
      br_snapshots_5_6 <= remap_table_2_6;
      br_snapshots_5_7 <= remap_table_2_7;
      br_snapshots_5_8 <= remap_table_2_8;
      br_snapshots_5_9 <= remap_table_2_9;
      br_snapshots_5_10 <= remap_table_2_10;
      br_snapshots_5_11 <= remap_table_2_11;
      br_snapshots_5_12 <= remap_table_2_12;
      br_snapshots_5_13 <= remap_table_2_13;
      br_snapshots_5_14 <= remap_table_2_14;
      br_snapshots_5_15 <= remap_table_2_15;
      br_snapshots_5_16 <= remap_table_2_16;
      br_snapshots_5_17 <= remap_table_2_17;
      br_snapshots_5_18 <= remap_table_2_18;
      br_snapshots_5_19 <= remap_table_2_19;
      br_snapshots_5_20 <= remap_table_2_20;
      br_snapshots_5_21 <= remap_table_2_21;
      br_snapshots_5_22 <= remap_table_2_22;
      br_snapshots_5_23 <= remap_table_2_23;
      br_snapshots_5_24 <= remap_table_2_24;
      br_snapshots_5_25 <= remap_table_2_25;
      br_snapshots_5_26 <= remap_table_2_26;
      br_snapshots_5_27 <= remap_table_2_27;
      br_snapshots_5_28 <= remap_table_2_28;
      br_snapshots_5_29 <= remap_table_2_29;
      br_snapshots_5_30 <= remap_table_2_30;
      br_snapshots_5_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'h5) begin
      br_snapshots_5_0 <= remap_table_1_0;
      br_snapshots_5_1 <= remap_table_1_1;
      br_snapshots_5_2 <= remap_table_1_2;
      br_snapshots_5_3 <= remap_table_1_3;
      br_snapshots_5_4 <= remap_table_1_4;
      br_snapshots_5_5 <= remap_table_1_5;
      br_snapshots_5_6 <= remap_table_1_6;
      br_snapshots_5_7 <= remap_table_1_7;
      br_snapshots_5_8 <= remap_table_1_8;
      br_snapshots_5_9 <= remap_table_1_9;
      br_snapshots_5_10 <= remap_table_1_10;
      br_snapshots_5_11 <= remap_table_1_11;
      br_snapshots_5_12 <= remap_table_1_12;
      br_snapshots_5_13 <= remap_table_1_13;
      br_snapshots_5_14 <= remap_table_1_14;
      br_snapshots_5_15 <= remap_table_1_15;
      br_snapshots_5_16 <= remap_table_1_16;
      br_snapshots_5_17 <= remap_table_1_17;
      br_snapshots_5_18 <= remap_table_1_18;
      br_snapshots_5_19 <= remap_table_1_19;
      br_snapshots_5_20 <= remap_table_1_20;
      br_snapshots_5_21 <= remap_table_1_21;
      br_snapshots_5_22 <= remap_table_1_22;
      br_snapshots_5_23 <= remap_table_1_23;
      br_snapshots_5_24 <= remap_table_1_24;
      br_snapshots_5_25 <= remap_table_1_25;
      br_snapshots_5_26 <= remap_table_1_26;
      br_snapshots_5_27 <= remap_table_1_27;
      br_snapshots_5_28 <= remap_table_1_28;
      br_snapshots_5_29 <= remap_table_1_29;
      br_snapshots_5_30 <= remap_table_1_30;
      br_snapshots_5_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'h6) begin
      br_snapshots_6_0 <= remap_table_4_0;
      br_snapshots_6_1 <= remap_table_4_1;
      br_snapshots_6_2 <= remap_table_4_2;
      br_snapshots_6_3 <= remap_table_4_3;
      br_snapshots_6_4 <= remap_table_4_4;
      br_snapshots_6_5 <= remap_table_4_5;
      br_snapshots_6_6 <= remap_table_4_6;
      br_snapshots_6_7 <= remap_table_4_7;
      br_snapshots_6_8 <= remap_table_4_8;
      br_snapshots_6_9 <= remap_table_4_9;
      br_snapshots_6_10 <= remap_table_4_10;
      br_snapshots_6_11 <= remap_table_4_11;
      br_snapshots_6_12 <= remap_table_4_12;
      br_snapshots_6_13 <= remap_table_4_13;
      br_snapshots_6_14 <= remap_table_4_14;
      br_snapshots_6_15 <= remap_table_4_15;
      br_snapshots_6_16 <= remap_table_4_16;
      br_snapshots_6_17 <= remap_table_4_17;
      br_snapshots_6_18 <= remap_table_4_18;
      br_snapshots_6_19 <= remap_table_4_19;
      br_snapshots_6_20 <= remap_table_4_20;
      br_snapshots_6_21 <= remap_table_4_21;
      br_snapshots_6_22 <= remap_table_4_22;
      br_snapshots_6_23 <= remap_table_4_23;
      br_snapshots_6_24 <= remap_table_4_24;
      br_snapshots_6_25 <= remap_table_4_25;
      br_snapshots_6_26 <= remap_table_4_26;
      br_snapshots_6_27 <= remap_table_4_27;
      br_snapshots_6_28 <= remap_table_4_28;
      br_snapshots_6_29 <= remap_table_4_29;
      br_snapshots_6_30 <= remap_table_4_30;
      br_snapshots_6_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'h6) begin
      br_snapshots_6_0 <= remap_table_3_0;
      br_snapshots_6_1 <= remap_table_3_1;
      br_snapshots_6_2 <= remap_table_3_2;
      br_snapshots_6_3 <= remap_table_3_3;
      br_snapshots_6_4 <= remap_table_3_4;
      br_snapshots_6_5 <= remap_table_3_5;
      br_snapshots_6_6 <= remap_table_3_6;
      br_snapshots_6_7 <= remap_table_3_7;
      br_snapshots_6_8 <= remap_table_3_8;
      br_snapshots_6_9 <= remap_table_3_9;
      br_snapshots_6_10 <= remap_table_3_10;
      br_snapshots_6_11 <= remap_table_3_11;
      br_snapshots_6_12 <= remap_table_3_12;
      br_snapshots_6_13 <= remap_table_3_13;
      br_snapshots_6_14 <= remap_table_3_14;
      br_snapshots_6_15 <= remap_table_3_15;
      br_snapshots_6_16 <= remap_table_3_16;
      br_snapshots_6_17 <= remap_table_3_17;
      br_snapshots_6_18 <= remap_table_3_18;
      br_snapshots_6_19 <= remap_table_3_19;
      br_snapshots_6_20 <= remap_table_3_20;
      br_snapshots_6_21 <= remap_table_3_21;
      br_snapshots_6_22 <= remap_table_3_22;
      br_snapshots_6_23 <= remap_table_3_23;
      br_snapshots_6_24 <= remap_table_3_24;
      br_snapshots_6_25 <= remap_table_3_25;
      br_snapshots_6_26 <= remap_table_3_26;
      br_snapshots_6_27 <= remap_table_3_27;
      br_snapshots_6_28 <= remap_table_3_28;
      br_snapshots_6_29 <= remap_table_3_29;
      br_snapshots_6_30 <= remap_table_3_30;
      br_snapshots_6_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'h6) begin
      br_snapshots_6_0 <= remap_table_2_0;
      br_snapshots_6_1 <= remap_table_2_1;
      br_snapshots_6_2 <= remap_table_2_2;
      br_snapshots_6_3 <= remap_table_2_3;
      br_snapshots_6_4 <= remap_table_2_4;
      br_snapshots_6_5 <= remap_table_2_5;
      br_snapshots_6_6 <= remap_table_2_6;
      br_snapshots_6_7 <= remap_table_2_7;
      br_snapshots_6_8 <= remap_table_2_8;
      br_snapshots_6_9 <= remap_table_2_9;
      br_snapshots_6_10 <= remap_table_2_10;
      br_snapshots_6_11 <= remap_table_2_11;
      br_snapshots_6_12 <= remap_table_2_12;
      br_snapshots_6_13 <= remap_table_2_13;
      br_snapshots_6_14 <= remap_table_2_14;
      br_snapshots_6_15 <= remap_table_2_15;
      br_snapshots_6_16 <= remap_table_2_16;
      br_snapshots_6_17 <= remap_table_2_17;
      br_snapshots_6_18 <= remap_table_2_18;
      br_snapshots_6_19 <= remap_table_2_19;
      br_snapshots_6_20 <= remap_table_2_20;
      br_snapshots_6_21 <= remap_table_2_21;
      br_snapshots_6_22 <= remap_table_2_22;
      br_snapshots_6_23 <= remap_table_2_23;
      br_snapshots_6_24 <= remap_table_2_24;
      br_snapshots_6_25 <= remap_table_2_25;
      br_snapshots_6_26 <= remap_table_2_26;
      br_snapshots_6_27 <= remap_table_2_27;
      br_snapshots_6_28 <= remap_table_2_28;
      br_snapshots_6_29 <= remap_table_2_29;
      br_snapshots_6_30 <= remap_table_2_30;
      br_snapshots_6_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'h6) begin
      br_snapshots_6_0 <= remap_table_1_0;
      br_snapshots_6_1 <= remap_table_1_1;
      br_snapshots_6_2 <= remap_table_1_2;
      br_snapshots_6_3 <= remap_table_1_3;
      br_snapshots_6_4 <= remap_table_1_4;
      br_snapshots_6_5 <= remap_table_1_5;
      br_snapshots_6_6 <= remap_table_1_6;
      br_snapshots_6_7 <= remap_table_1_7;
      br_snapshots_6_8 <= remap_table_1_8;
      br_snapshots_6_9 <= remap_table_1_9;
      br_snapshots_6_10 <= remap_table_1_10;
      br_snapshots_6_11 <= remap_table_1_11;
      br_snapshots_6_12 <= remap_table_1_12;
      br_snapshots_6_13 <= remap_table_1_13;
      br_snapshots_6_14 <= remap_table_1_14;
      br_snapshots_6_15 <= remap_table_1_15;
      br_snapshots_6_16 <= remap_table_1_16;
      br_snapshots_6_17 <= remap_table_1_17;
      br_snapshots_6_18 <= remap_table_1_18;
      br_snapshots_6_19 <= remap_table_1_19;
      br_snapshots_6_20 <= remap_table_1_20;
      br_snapshots_6_21 <= remap_table_1_21;
      br_snapshots_6_22 <= remap_table_1_22;
      br_snapshots_6_23 <= remap_table_1_23;
      br_snapshots_6_24 <= remap_table_1_24;
      br_snapshots_6_25 <= remap_table_1_25;
      br_snapshots_6_26 <= remap_table_1_26;
      br_snapshots_6_27 <= remap_table_1_27;
      br_snapshots_6_28 <= remap_table_1_28;
      br_snapshots_6_29 <= remap_table_1_29;
      br_snapshots_6_30 <= remap_table_1_30;
      br_snapshots_6_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'h7) begin
      br_snapshots_7_0 <= remap_table_4_0;
      br_snapshots_7_1 <= remap_table_4_1;
      br_snapshots_7_2 <= remap_table_4_2;
      br_snapshots_7_3 <= remap_table_4_3;
      br_snapshots_7_4 <= remap_table_4_4;
      br_snapshots_7_5 <= remap_table_4_5;
      br_snapshots_7_6 <= remap_table_4_6;
      br_snapshots_7_7 <= remap_table_4_7;
      br_snapshots_7_8 <= remap_table_4_8;
      br_snapshots_7_9 <= remap_table_4_9;
      br_snapshots_7_10 <= remap_table_4_10;
      br_snapshots_7_11 <= remap_table_4_11;
      br_snapshots_7_12 <= remap_table_4_12;
      br_snapshots_7_13 <= remap_table_4_13;
      br_snapshots_7_14 <= remap_table_4_14;
      br_snapshots_7_15 <= remap_table_4_15;
      br_snapshots_7_16 <= remap_table_4_16;
      br_snapshots_7_17 <= remap_table_4_17;
      br_snapshots_7_18 <= remap_table_4_18;
      br_snapshots_7_19 <= remap_table_4_19;
      br_snapshots_7_20 <= remap_table_4_20;
      br_snapshots_7_21 <= remap_table_4_21;
      br_snapshots_7_22 <= remap_table_4_22;
      br_snapshots_7_23 <= remap_table_4_23;
      br_snapshots_7_24 <= remap_table_4_24;
      br_snapshots_7_25 <= remap_table_4_25;
      br_snapshots_7_26 <= remap_table_4_26;
      br_snapshots_7_27 <= remap_table_4_27;
      br_snapshots_7_28 <= remap_table_4_28;
      br_snapshots_7_29 <= remap_table_4_29;
      br_snapshots_7_30 <= remap_table_4_30;
      br_snapshots_7_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'h7) begin
      br_snapshots_7_0 <= remap_table_3_0;
      br_snapshots_7_1 <= remap_table_3_1;
      br_snapshots_7_2 <= remap_table_3_2;
      br_snapshots_7_3 <= remap_table_3_3;
      br_snapshots_7_4 <= remap_table_3_4;
      br_snapshots_7_5 <= remap_table_3_5;
      br_snapshots_7_6 <= remap_table_3_6;
      br_snapshots_7_7 <= remap_table_3_7;
      br_snapshots_7_8 <= remap_table_3_8;
      br_snapshots_7_9 <= remap_table_3_9;
      br_snapshots_7_10 <= remap_table_3_10;
      br_snapshots_7_11 <= remap_table_3_11;
      br_snapshots_7_12 <= remap_table_3_12;
      br_snapshots_7_13 <= remap_table_3_13;
      br_snapshots_7_14 <= remap_table_3_14;
      br_snapshots_7_15 <= remap_table_3_15;
      br_snapshots_7_16 <= remap_table_3_16;
      br_snapshots_7_17 <= remap_table_3_17;
      br_snapshots_7_18 <= remap_table_3_18;
      br_snapshots_7_19 <= remap_table_3_19;
      br_snapshots_7_20 <= remap_table_3_20;
      br_snapshots_7_21 <= remap_table_3_21;
      br_snapshots_7_22 <= remap_table_3_22;
      br_snapshots_7_23 <= remap_table_3_23;
      br_snapshots_7_24 <= remap_table_3_24;
      br_snapshots_7_25 <= remap_table_3_25;
      br_snapshots_7_26 <= remap_table_3_26;
      br_snapshots_7_27 <= remap_table_3_27;
      br_snapshots_7_28 <= remap_table_3_28;
      br_snapshots_7_29 <= remap_table_3_29;
      br_snapshots_7_30 <= remap_table_3_30;
      br_snapshots_7_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'h7) begin
      br_snapshots_7_0 <= remap_table_2_0;
      br_snapshots_7_1 <= remap_table_2_1;
      br_snapshots_7_2 <= remap_table_2_2;
      br_snapshots_7_3 <= remap_table_2_3;
      br_snapshots_7_4 <= remap_table_2_4;
      br_snapshots_7_5 <= remap_table_2_5;
      br_snapshots_7_6 <= remap_table_2_6;
      br_snapshots_7_7 <= remap_table_2_7;
      br_snapshots_7_8 <= remap_table_2_8;
      br_snapshots_7_9 <= remap_table_2_9;
      br_snapshots_7_10 <= remap_table_2_10;
      br_snapshots_7_11 <= remap_table_2_11;
      br_snapshots_7_12 <= remap_table_2_12;
      br_snapshots_7_13 <= remap_table_2_13;
      br_snapshots_7_14 <= remap_table_2_14;
      br_snapshots_7_15 <= remap_table_2_15;
      br_snapshots_7_16 <= remap_table_2_16;
      br_snapshots_7_17 <= remap_table_2_17;
      br_snapshots_7_18 <= remap_table_2_18;
      br_snapshots_7_19 <= remap_table_2_19;
      br_snapshots_7_20 <= remap_table_2_20;
      br_snapshots_7_21 <= remap_table_2_21;
      br_snapshots_7_22 <= remap_table_2_22;
      br_snapshots_7_23 <= remap_table_2_23;
      br_snapshots_7_24 <= remap_table_2_24;
      br_snapshots_7_25 <= remap_table_2_25;
      br_snapshots_7_26 <= remap_table_2_26;
      br_snapshots_7_27 <= remap_table_2_27;
      br_snapshots_7_28 <= remap_table_2_28;
      br_snapshots_7_29 <= remap_table_2_29;
      br_snapshots_7_30 <= remap_table_2_30;
      br_snapshots_7_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'h7) begin
      br_snapshots_7_0 <= remap_table_1_0;
      br_snapshots_7_1 <= remap_table_1_1;
      br_snapshots_7_2 <= remap_table_1_2;
      br_snapshots_7_3 <= remap_table_1_3;
      br_snapshots_7_4 <= remap_table_1_4;
      br_snapshots_7_5 <= remap_table_1_5;
      br_snapshots_7_6 <= remap_table_1_6;
      br_snapshots_7_7 <= remap_table_1_7;
      br_snapshots_7_8 <= remap_table_1_8;
      br_snapshots_7_9 <= remap_table_1_9;
      br_snapshots_7_10 <= remap_table_1_10;
      br_snapshots_7_11 <= remap_table_1_11;
      br_snapshots_7_12 <= remap_table_1_12;
      br_snapshots_7_13 <= remap_table_1_13;
      br_snapshots_7_14 <= remap_table_1_14;
      br_snapshots_7_15 <= remap_table_1_15;
      br_snapshots_7_16 <= remap_table_1_16;
      br_snapshots_7_17 <= remap_table_1_17;
      br_snapshots_7_18 <= remap_table_1_18;
      br_snapshots_7_19 <= remap_table_1_19;
      br_snapshots_7_20 <= remap_table_1_20;
      br_snapshots_7_21 <= remap_table_1_21;
      br_snapshots_7_22 <= remap_table_1_22;
      br_snapshots_7_23 <= remap_table_1_23;
      br_snapshots_7_24 <= remap_table_1_24;
      br_snapshots_7_25 <= remap_table_1_25;
      br_snapshots_7_26 <= remap_table_1_26;
      br_snapshots_7_27 <= remap_table_1_27;
      br_snapshots_7_28 <= remap_table_1_28;
      br_snapshots_7_29 <= remap_table_1_29;
      br_snapshots_7_30 <= remap_table_1_30;
      br_snapshots_7_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'h8) begin
      br_snapshots_8_0 <= remap_table_4_0;
      br_snapshots_8_1 <= remap_table_4_1;
      br_snapshots_8_2 <= remap_table_4_2;
      br_snapshots_8_3 <= remap_table_4_3;
      br_snapshots_8_4 <= remap_table_4_4;
      br_snapshots_8_5 <= remap_table_4_5;
      br_snapshots_8_6 <= remap_table_4_6;
      br_snapshots_8_7 <= remap_table_4_7;
      br_snapshots_8_8 <= remap_table_4_8;
      br_snapshots_8_9 <= remap_table_4_9;
      br_snapshots_8_10 <= remap_table_4_10;
      br_snapshots_8_11 <= remap_table_4_11;
      br_snapshots_8_12 <= remap_table_4_12;
      br_snapshots_8_13 <= remap_table_4_13;
      br_snapshots_8_14 <= remap_table_4_14;
      br_snapshots_8_15 <= remap_table_4_15;
      br_snapshots_8_16 <= remap_table_4_16;
      br_snapshots_8_17 <= remap_table_4_17;
      br_snapshots_8_18 <= remap_table_4_18;
      br_snapshots_8_19 <= remap_table_4_19;
      br_snapshots_8_20 <= remap_table_4_20;
      br_snapshots_8_21 <= remap_table_4_21;
      br_snapshots_8_22 <= remap_table_4_22;
      br_snapshots_8_23 <= remap_table_4_23;
      br_snapshots_8_24 <= remap_table_4_24;
      br_snapshots_8_25 <= remap_table_4_25;
      br_snapshots_8_26 <= remap_table_4_26;
      br_snapshots_8_27 <= remap_table_4_27;
      br_snapshots_8_28 <= remap_table_4_28;
      br_snapshots_8_29 <= remap_table_4_29;
      br_snapshots_8_30 <= remap_table_4_30;
      br_snapshots_8_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'h8) begin
      br_snapshots_8_0 <= remap_table_3_0;
      br_snapshots_8_1 <= remap_table_3_1;
      br_snapshots_8_2 <= remap_table_3_2;
      br_snapshots_8_3 <= remap_table_3_3;
      br_snapshots_8_4 <= remap_table_3_4;
      br_snapshots_8_5 <= remap_table_3_5;
      br_snapshots_8_6 <= remap_table_3_6;
      br_snapshots_8_7 <= remap_table_3_7;
      br_snapshots_8_8 <= remap_table_3_8;
      br_snapshots_8_9 <= remap_table_3_9;
      br_snapshots_8_10 <= remap_table_3_10;
      br_snapshots_8_11 <= remap_table_3_11;
      br_snapshots_8_12 <= remap_table_3_12;
      br_snapshots_8_13 <= remap_table_3_13;
      br_snapshots_8_14 <= remap_table_3_14;
      br_snapshots_8_15 <= remap_table_3_15;
      br_snapshots_8_16 <= remap_table_3_16;
      br_snapshots_8_17 <= remap_table_3_17;
      br_snapshots_8_18 <= remap_table_3_18;
      br_snapshots_8_19 <= remap_table_3_19;
      br_snapshots_8_20 <= remap_table_3_20;
      br_snapshots_8_21 <= remap_table_3_21;
      br_snapshots_8_22 <= remap_table_3_22;
      br_snapshots_8_23 <= remap_table_3_23;
      br_snapshots_8_24 <= remap_table_3_24;
      br_snapshots_8_25 <= remap_table_3_25;
      br_snapshots_8_26 <= remap_table_3_26;
      br_snapshots_8_27 <= remap_table_3_27;
      br_snapshots_8_28 <= remap_table_3_28;
      br_snapshots_8_29 <= remap_table_3_29;
      br_snapshots_8_30 <= remap_table_3_30;
      br_snapshots_8_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'h8) begin
      br_snapshots_8_0 <= remap_table_2_0;
      br_snapshots_8_1 <= remap_table_2_1;
      br_snapshots_8_2 <= remap_table_2_2;
      br_snapshots_8_3 <= remap_table_2_3;
      br_snapshots_8_4 <= remap_table_2_4;
      br_snapshots_8_5 <= remap_table_2_5;
      br_snapshots_8_6 <= remap_table_2_6;
      br_snapshots_8_7 <= remap_table_2_7;
      br_snapshots_8_8 <= remap_table_2_8;
      br_snapshots_8_9 <= remap_table_2_9;
      br_snapshots_8_10 <= remap_table_2_10;
      br_snapshots_8_11 <= remap_table_2_11;
      br_snapshots_8_12 <= remap_table_2_12;
      br_snapshots_8_13 <= remap_table_2_13;
      br_snapshots_8_14 <= remap_table_2_14;
      br_snapshots_8_15 <= remap_table_2_15;
      br_snapshots_8_16 <= remap_table_2_16;
      br_snapshots_8_17 <= remap_table_2_17;
      br_snapshots_8_18 <= remap_table_2_18;
      br_snapshots_8_19 <= remap_table_2_19;
      br_snapshots_8_20 <= remap_table_2_20;
      br_snapshots_8_21 <= remap_table_2_21;
      br_snapshots_8_22 <= remap_table_2_22;
      br_snapshots_8_23 <= remap_table_2_23;
      br_snapshots_8_24 <= remap_table_2_24;
      br_snapshots_8_25 <= remap_table_2_25;
      br_snapshots_8_26 <= remap_table_2_26;
      br_snapshots_8_27 <= remap_table_2_27;
      br_snapshots_8_28 <= remap_table_2_28;
      br_snapshots_8_29 <= remap_table_2_29;
      br_snapshots_8_30 <= remap_table_2_30;
      br_snapshots_8_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'h8) begin
      br_snapshots_8_0 <= remap_table_1_0;
      br_snapshots_8_1 <= remap_table_1_1;
      br_snapshots_8_2 <= remap_table_1_2;
      br_snapshots_8_3 <= remap_table_1_3;
      br_snapshots_8_4 <= remap_table_1_4;
      br_snapshots_8_5 <= remap_table_1_5;
      br_snapshots_8_6 <= remap_table_1_6;
      br_snapshots_8_7 <= remap_table_1_7;
      br_snapshots_8_8 <= remap_table_1_8;
      br_snapshots_8_9 <= remap_table_1_9;
      br_snapshots_8_10 <= remap_table_1_10;
      br_snapshots_8_11 <= remap_table_1_11;
      br_snapshots_8_12 <= remap_table_1_12;
      br_snapshots_8_13 <= remap_table_1_13;
      br_snapshots_8_14 <= remap_table_1_14;
      br_snapshots_8_15 <= remap_table_1_15;
      br_snapshots_8_16 <= remap_table_1_16;
      br_snapshots_8_17 <= remap_table_1_17;
      br_snapshots_8_18 <= remap_table_1_18;
      br_snapshots_8_19 <= remap_table_1_19;
      br_snapshots_8_20 <= remap_table_1_20;
      br_snapshots_8_21 <= remap_table_1_21;
      br_snapshots_8_22 <= remap_table_1_22;
      br_snapshots_8_23 <= remap_table_1_23;
      br_snapshots_8_24 <= remap_table_1_24;
      br_snapshots_8_25 <= remap_table_1_25;
      br_snapshots_8_26 <= remap_table_1_26;
      br_snapshots_8_27 <= remap_table_1_27;
      br_snapshots_8_28 <= remap_table_1_28;
      br_snapshots_8_29 <= remap_table_1_29;
      br_snapshots_8_30 <= remap_table_1_30;
      br_snapshots_8_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'h9) begin
      br_snapshots_9_0 <= remap_table_4_0;
      br_snapshots_9_1 <= remap_table_4_1;
      br_snapshots_9_2 <= remap_table_4_2;
      br_snapshots_9_3 <= remap_table_4_3;
      br_snapshots_9_4 <= remap_table_4_4;
      br_snapshots_9_5 <= remap_table_4_5;
      br_snapshots_9_6 <= remap_table_4_6;
      br_snapshots_9_7 <= remap_table_4_7;
      br_snapshots_9_8 <= remap_table_4_8;
      br_snapshots_9_9 <= remap_table_4_9;
      br_snapshots_9_10 <= remap_table_4_10;
      br_snapshots_9_11 <= remap_table_4_11;
      br_snapshots_9_12 <= remap_table_4_12;
      br_snapshots_9_13 <= remap_table_4_13;
      br_snapshots_9_14 <= remap_table_4_14;
      br_snapshots_9_15 <= remap_table_4_15;
      br_snapshots_9_16 <= remap_table_4_16;
      br_snapshots_9_17 <= remap_table_4_17;
      br_snapshots_9_18 <= remap_table_4_18;
      br_snapshots_9_19 <= remap_table_4_19;
      br_snapshots_9_20 <= remap_table_4_20;
      br_snapshots_9_21 <= remap_table_4_21;
      br_snapshots_9_22 <= remap_table_4_22;
      br_snapshots_9_23 <= remap_table_4_23;
      br_snapshots_9_24 <= remap_table_4_24;
      br_snapshots_9_25 <= remap_table_4_25;
      br_snapshots_9_26 <= remap_table_4_26;
      br_snapshots_9_27 <= remap_table_4_27;
      br_snapshots_9_28 <= remap_table_4_28;
      br_snapshots_9_29 <= remap_table_4_29;
      br_snapshots_9_30 <= remap_table_4_30;
      br_snapshots_9_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'h9) begin
      br_snapshots_9_0 <= remap_table_3_0;
      br_snapshots_9_1 <= remap_table_3_1;
      br_snapshots_9_2 <= remap_table_3_2;
      br_snapshots_9_3 <= remap_table_3_3;
      br_snapshots_9_4 <= remap_table_3_4;
      br_snapshots_9_5 <= remap_table_3_5;
      br_snapshots_9_6 <= remap_table_3_6;
      br_snapshots_9_7 <= remap_table_3_7;
      br_snapshots_9_8 <= remap_table_3_8;
      br_snapshots_9_9 <= remap_table_3_9;
      br_snapshots_9_10 <= remap_table_3_10;
      br_snapshots_9_11 <= remap_table_3_11;
      br_snapshots_9_12 <= remap_table_3_12;
      br_snapshots_9_13 <= remap_table_3_13;
      br_snapshots_9_14 <= remap_table_3_14;
      br_snapshots_9_15 <= remap_table_3_15;
      br_snapshots_9_16 <= remap_table_3_16;
      br_snapshots_9_17 <= remap_table_3_17;
      br_snapshots_9_18 <= remap_table_3_18;
      br_snapshots_9_19 <= remap_table_3_19;
      br_snapshots_9_20 <= remap_table_3_20;
      br_snapshots_9_21 <= remap_table_3_21;
      br_snapshots_9_22 <= remap_table_3_22;
      br_snapshots_9_23 <= remap_table_3_23;
      br_snapshots_9_24 <= remap_table_3_24;
      br_snapshots_9_25 <= remap_table_3_25;
      br_snapshots_9_26 <= remap_table_3_26;
      br_snapshots_9_27 <= remap_table_3_27;
      br_snapshots_9_28 <= remap_table_3_28;
      br_snapshots_9_29 <= remap_table_3_29;
      br_snapshots_9_30 <= remap_table_3_30;
      br_snapshots_9_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'h9) begin
      br_snapshots_9_0 <= remap_table_2_0;
      br_snapshots_9_1 <= remap_table_2_1;
      br_snapshots_9_2 <= remap_table_2_2;
      br_snapshots_9_3 <= remap_table_2_3;
      br_snapshots_9_4 <= remap_table_2_4;
      br_snapshots_9_5 <= remap_table_2_5;
      br_snapshots_9_6 <= remap_table_2_6;
      br_snapshots_9_7 <= remap_table_2_7;
      br_snapshots_9_8 <= remap_table_2_8;
      br_snapshots_9_9 <= remap_table_2_9;
      br_snapshots_9_10 <= remap_table_2_10;
      br_snapshots_9_11 <= remap_table_2_11;
      br_snapshots_9_12 <= remap_table_2_12;
      br_snapshots_9_13 <= remap_table_2_13;
      br_snapshots_9_14 <= remap_table_2_14;
      br_snapshots_9_15 <= remap_table_2_15;
      br_snapshots_9_16 <= remap_table_2_16;
      br_snapshots_9_17 <= remap_table_2_17;
      br_snapshots_9_18 <= remap_table_2_18;
      br_snapshots_9_19 <= remap_table_2_19;
      br_snapshots_9_20 <= remap_table_2_20;
      br_snapshots_9_21 <= remap_table_2_21;
      br_snapshots_9_22 <= remap_table_2_22;
      br_snapshots_9_23 <= remap_table_2_23;
      br_snapshots_9_24 <= remap_table_2_24;
      br_snapshots_9_25 <= remap_table_2_25;
      br_snapshots_9_26 <= remap_table_2_26;
      br_snapshots_9_27 <= remap_table_2_27;
      br_snapshots_9_28 <= remap_table_2_28;
      br_snapshots_9_29 <= remap_table_2_29;
      br_snapshots_9_30 <= remap_table_2_30;
      br_snapshots_9_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'h9) begin
      br_snapshots_9_0 <= remap_table_1_0;
      br_snapshots_9_1 <= remap_table_1_1;
      br_snapshots_9_2 <= remap_table_1_2;
      br_snapshots_9_3 <= remap_table_1_3;
      br_snapshots_9_4 <= remap_table_1_4;
      br_snapshots_9_5 <= remap_table_1_5;
      br_snapshots_9_6 <= remap_table_1_6;
      br_snapshots_9_7 <= remap_table_1_7;
      br_snapshots_9_8 <= remap_table_1_8;
      br_snapshots_9_9 <= remap_table_1_9;
      br_snapshots_9_10 <= remap_table_1_10;
      br_snapshots_9_11 <= remap_table_1_11;
      br_snapshots_9_12 <= remap_table_1_12;
      br_snapshots_9_13 <= remap_table_1_13;
      br_snapshots_9_14 <= remap_table_1_14;
      br_snapshots_9_15 <= remap_table_1_15;
      br_snapshots_9_16 <= remap_table_1_16;
      br_snapshots_9_17 <= remap_table_1_17;
      br_snapshots_9_18 <= remap_table_1_18;
      br_snapshots_9_19 <= remap_table_1_19;
      br_snapshots_9_20 <= remap_table_1_20;
      br_snapshots_9_21 <= remap_table_1_21;
      br_snapshots_9_22 <= remap_table_1_22;
      br_snapshots_9_23 <= remap_table_1_23;
      br_snapshots_9_24 <= remap_table_1_24;
      br_snapshots_9_25 <= remap_table_1_25;
      br_snapshots_9_26 <= remap_table_1_26;
      br_snapshots_9_27 <= remap_table_1_27;
      br_snapshots_9_28 <= remap_table_1_28;
      br_snapshots_9_29 <= remap_table_1_29;
      br_snapshots_9_30 <= remap_table_1_30;
      br_snapshots_9_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'hA) begin
      br_snapshots_10_0 <= remap_table_4_0;
      br_snapshots_10_1 <= remap_table_4_1;
      br_snapshots_10_2 <= remap_table_4_2;
      br_snapshots_10_3 <= remap_table_4_3;
      br_snapshots_10_4 <= remap_table_4_4;
      br_snapshots_10_5 <= remap_table_4_5;
      br_snapshots_10_6 <= remap_table_4_6;
      br_snapshots_10_7 <= remap_table_4_7;
      br_snapshots_10_8 <= remap_table_4_8;
      br_snapshots_10_9 <= remap_table_4_9;
      br_snapshots_10_10 <= remap_table_4_10;
      br_snapshots_10_11 <= remap_table_4_11;
      br_snapshots_10_12 <= remap_table_4_12;
      br_snapshots_10_13 <= remap_table_4_13;
      br_snapshots_10_14 <= remap_table_4_14;
      br_snapshots_10_15 <= remap_table_4_15;
      br_snapshots_10_16 <= remap_table_4_16;
      br_snapshots_10_17 <= remap_table_4_17;
      br_snapshots_10_18 <= remap_table_4_18;
      br_snapshots_10_19 <= remap_table_4_19;
      br_snapshots_10_20 <= remap_table_4_20;
      br_snapshots_10_21 <= remap_table_4_21;
      br_snapshots_10_22 <= remap_table_4_22;
      br_snapshots_10_23 <= remap_table_4_23;
      br_snapshots_10_24 <= remap_table_4_24;
      br_snapshots_10_25 <= remap_table_4_25;
      br_snapshots_10_26 <= remap_table_4_26;
      br_snapshots_10_27 <= remap_table_4_27;
      br_snapshots_10_28 <= remap_table_4_28;
      br_snapshots_10_29 <= remap_table_4_29;
      br_snapshots_10_30 <= remap_table_4_30;
      br_snapshots_10_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'hA) begin
      br_snapshots_10_0 <= remap_table_3_0;
      br_snapshots_10_1 <= remap_table_3_1;
      br_snapshots_10_2 <= remap_table_3_2;
      br_snapshots_10_3 <= remap_table_3_3;
      br_snapshots_10_4 <= remap_table_3_4;
      br_snapshots_10_5 <= remap_table_3_5;
      br_snapshots_10_6 <= remap_table_3_6;
      br_snapshots_10_7 <= remap_table_3_7;
      br_snapshots_10_8 <= remap_table_3_8;
      br_snapshots_10_9 <= remap_table_3_9;
      br_snapshots_10_10 <= remap_table_3_10;
      br_snapshots_10_11 <= remap_table_3_11;
      br_snapshots_10_12 <= remap_table_3_12;
      br_snapshots_10_13 <= remap_table_3_13;
      br_snapshots_10_14 <= remap_table_3_14;
      br_snapshots_10_15 <= remap_table_3_15;
      br_snapshots_10_16 <= remap_table_3_16;
      br_snapshots_10_17 <= remap_table_3_17;
      br_snapshots_10_18 <= remap_table_3_18;
      br_snapshots_10_19 <= remap_table_3_19;
      br_snapshots_10_20 <= remap_table_3_20;
      br_snapshots_10_21 <= remap_table_3_21;
      br_snapshots_10_22 <= remap_table_3_22;
      br_snapshots_10_23 <= remap_table_3_23;
      br_snapshots_10_24 <= remap_table_3_24;
      br_snapshots_10_25 <= remap_table_3_25;
      br_snapshots_10_26 <= remap_table_3_26;
      br_snapshots_10_27 <= remap_table_3_27;
      br_snapshots_10_28 <= remap_table_3_28;
      br_snapshots_10_29 <= remap_table_3_29;
      br_snapshots_10_30 <= remap_table_3_30;
      br_snapshots_10_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'hA) begin
      br_snapshots_10_0 <= remap_table_2_0;
      br_snapshots_10_1 <= remap_table_2_1;
      br_snapshots_10_2 <= remap_table_2_2;
      br_snapshots_10_3 <= remap_table_2_3;
      br_snapshots_10_4 <= remap_table_2_4;
      br_snapshots_10_5 <= remap_table_2_5;
      br_snapshots_10_6 <= remap_table_2_6;
      br_snapshots_10_7 <= remap_table_2_7;
      br_snapshots_10_8 <= remap_table_2_8;
      br_snapshots_10_9 <= remap_table_2_9;
      br_snapshots_10_10 <= remap_table_2_10;
      br_snapshots_10_11 <= remap_table_2_11;
      br_snapshots_10_12 <= remap_table_2_12;
      br_snapshots_10_13 <= remap_table_2_13;
      br_snapshots_10_14 <= remap_table_2_14;
      br_snapshots_10_15 <= remap_table_2_15;
      br_snapshots_10_16 <= remap_table_2_16;
      br_snapshots_10_17 <= remap_table_2_17;
      br_snapshots_10_18 <= remap_table_2_18;
      br_snapshots_10_19 <= remap_table_2_19;
      br_snapshots_10_20 <= remap_table_2_20;
      br_snapshots_10_21 <= remap_table_2_21;
      br_snapshots_10_22 <= remap_table_2_22;
      br_snapshots_10_23 <= remap_table_2_23;
      br_snapshots_10_24 <= remap_table_2_24;
      br_snapshots_10_25 <= remap_table_2_25;
      br_snapshots_10_26 <= remap_table_2_26;
      br_snapshots_10_27 <= remap_table_2_27;
      br_snapshots_10_28 <= remap_table_2_28;
      br_snapshots_10_29 <= remap_table_2_29;
      br_snapshots_10_30 <= remap_table_2_30;
      br_snapshots_10_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'hA) begin
      br_snapshots_10_0 <= remap_table_1_0;
      br_snapshots_10_1 <= remap_table_1_1;
      br_snapshots_10_2 <= remap_table_1_2;
      br_snapshots_10_3 <= remap_table_1_3;
      br_snapshots_10_4 <= remap_table_1_4;
      br_snapshots_10_5 <= remap_table_1_5;
      br_snapshots_10_6 <= remap_table_1_6;
      br_snapshots_10_7 <= remap_table_1_7;
      br_snapshots_10_8 <= remap_table_1_8;
      br_snapshots_10_9 <= remap_table_1_9;
      br_snapshots_10_10 <= remap_table_1_10;
      br_snapshots_10_11 <= remap_table_1_11;
      br_snapshots_10_12 <= remap_table_1_12;
      br_snapshots_10_13 <= remap_table_1_13;
      br_snapshots_10_14 <= remap_table_1_14;
      br_snapshots_10_15 <= remap_table_1_15;
      br_snapshots_10_16 <= remap_table_1_16;
      br_snapshots_10_17 <= remap_table_1_17;
      br_snapshots_10_18 <= remap_table_1_18;
      br_snapshots_10_19 <= remap_table_1_19;
      br_snapshots_10_20 <= remap_table_1_20;
      br_snapshots_10_21 <= remap_table_1_21;
      br_snapshots_10_22 <= remap_table_1_22;
      br_snapshots_10_23 <= remap_table_1_23;
      br_snapshots_10_24 <= remap_table_1_24;
      br_snapshots_10_25 <= remap_table_1_25;
      br_snapshots_10_26 <= remap_table_1_26;
      br_snapshots_10_27 <= remap_table_1_27;
      br_snapshots_10_28 <= remap_table_1_28;
      br_snapshots_10_29 <= remap_table_1_29;
      br_snapshots_10_30 <= remap_table_1_30;
      br_snapshots_10_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'hB) begin
      br_snapshots_11_0 <= remap_table_4_0;
      br_snapshots_11_1 <= remap_table_4_1;
      br_snapshots_11_2 <= remap_table_4_2;
      br_snapshots_11_3 <= remap_table_4_3;
      br_snapshots_11_4 <= remap_table_4_4;
      br_snapshots_11_5 <= remap_table_4_5;
      br_snapshots_11_6 <= remap_table_4_6;
      br_snapshots_11_7 <= remap_table_4_7;
      br_snapshots_11_8 <= remap_table_4_8;
      br_snapshots_11_9 <= remap_table_4_9;
      br_snapshots_11_10 <= remap_table_4_10;
      br_snapshots_11_11 <= remap_table_4_11;
      br_snapshots_11_12 <= remap_table_4_12;
      br_snapshots_11_13 <= remap_table_4_13;
      br_snapshots_11_14 <= remap_table_4_14;
      br_snapshots_11_15 <= remap_table_4_15;
      br_snapshots_11_16 <= remap_table_4_16;
      br_snapshots_11_17 <= remap_table_4_17;
      br_snapshots_11_18 <= remap_table_4_18;
      br_snapshots_11_19 <= remap_table_4_19;
      br_snapshots_11_20 <= remap_table_4_20;
      br_snapshots_11_21 <= remap_table_4_21;
      br_snapshots_11_22 <= remap_table_4_22;
      br_snapshots_11_23 <= remap_table_4_23;
      br_snapshots_11_24 <= remap_table_4_24;
      br_snapshots_11_25 <= remap_table_4_25;
      br_snapshots_11_26 <= remap_table_4_26;
      br_snapshots_11_27 <= remap_table_4_27;
      br_snapshots_11_28 <= remap_table_4_28;
      br_snapshots_11_29 <= remap_table_4_29;
      br_snapshots_11_30 <= remap_table_4_30;
      br_snapshots_11_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'hB) begin
      br_snapshots_11_0 <= remap_table_3_0;
      br_snapshots_11_1 <= remap_table_3_1;
      br_snapshots_11_2 <= remap_table_3_2;
      br_snapshots_11_3 <= remap_table_3_3;
      br_snapshots_11_4 <= remap_table_3_4;
      br_snapshots_11_5 <= remap_table_3_5;
      br_snapshots_11_6 <= remap_table_3_6;
      br_snapshots_11_7 <= remap_table_3_7;
      br_snapshots_11_8 <= remap_table_3_8;
      br_snapshots_11_9 <= remap_table_3_9;
      br_snapshots_11_10 <= remap_table_3_10;
      br_snapshots_11_11 <= remap_table_3_11;
      br_snapshots_11_12 <= remap_table_3_12;
      br_snapshots_11_13 <= remap_table_3_13;
      br_snapshots_11_14 <= remap_table_3_14;
      br_snapshots_11_15 <= remap_table_3_15;
      br_snapshots_11_16 <= remap_table_3_16;
      br_snapshots_11_17 <= remap_table_3_17;
      br_snapshots_11_18 <= remap_table_3_18;
      br_snapshots_11_19 <= remap_table_3_19;
      br_snapshots_11_20 <= remap_table_3_20;
      br_snapshots_11_21 <= remap_table_3_21;
      br_snapshots_11_22 <= remap_table_3_22;
      br_snapshots_11_23 <= remap_table_3_23;
      br_snapshots_11_24 <= remap_table_3_24;
      br_snapshots_11_25 <= remap_table_3_25;
      br_snapshots_11_26 <= remap_table_3_26;
      br_snapshots_11_27 <= remap_table_3_27;
      br_snapshots_11_28 <= remap_table_3_28;
      br_snapshots_11_29 <= remap_table_3_29;
      br_snapshots_11_30 <= remap_table_3_30;
      br_snapshots_11_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'hB) begin
      br_snapshots_11_0 <= remap_table_2_0;
      br_snapshots_11_1 <= remap_table_2_1;
      br_snapshots_11_2 <= remap_table_2_2;
      br_snapshots_11_3 <= remap_table_2_3;
      br_snapshots_11_4 <= remap_table_2_4;
      br_snapshots_11_5 <= remap_table_2_5;
      br_snapshots_11_6 <= remap_table_2_6;
      br_snapshots_11_7 <= remap_table_2_7;
      br_snapshots_11_8 <= remap_table_2_8;
      br_snapshots_11_9 <= remap_table_2_9;
      br_snapshots_11_10 <= remap_table_2_10;
      br_snapshots_11_11 <= remap_table_2_11;
      br_snapshots_11_12 <= remap_table_2_12;
      br_snapshots_11_13 <= remap_table_2_13;
      br_snapshots_11_14 <= remap_table_2_14;
      br_snapshots_11_15 <= remap_table_2_15;
      br_snapshots_11_16 <= remap_table_2_16;
      br_snapshots_11_17 <= remap_table_2_17;
      br_snapshots_11_18 <= remap_table_2_18;
      br_snapshots_11_19 <= remap_table_2_19;
      br_snapshots_11_20 <= remap_table_2_20;
      br_snapshots_11_21 <= remap_table_2_21;
      br_snapshots_11_22 <= remap_table_2_22;
      br_snapshots_11_23 <= remap_table_2_23;
      br_snapshots_11_24 <= remap_table_2_24;
      br_snapshots_11_25 <= remap_table_2_25;
      br_snapshots_11_26 <= remap_table_2_26;
      br_snapshots_11_27 <= remap_table_2_27;
      br_snapshots_11_28 <= remap_table_2_28;
      br_snapshots_11_29 <= remap_table_2_29;
      br_snapshots_11_30 <= remap_table_2_30;
      br_snapshots_11_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'hB) begin
      br_snapshots_11_0 <= remap_table_1_0;
      br_snapshots_11_1 <= remap_table_1_1;
      br_snapshots_11_2 <= remap_table_1_2;
      br_snapshots_11_3 <= remap_table_1_3;
      br_snapshots_11_4 <= remap_table_1_4;
      br_snapshots_11_5 <= remap_table_1_5;
      br_snapshots_11_6 <= remap_table_1_6;
      br_snapshots_11_7 <= remap_table_1_7;
      br_snapshots_11_8 <= remap_table_1_8;
      br_snapshots_11_9 <= remap_table_1_9;
      br_snapshots_11_10 <= remap_table_1_10;
      br_snapshots_11_11 <= remap_table_1_11;
      br_snapshots_11_12 <= remap_table_1_12;
      br_snapshots_11_13 <= remap_table_1_13;
      br_snapshots_11_14 <= remap_table_1_14;
      br_snapshots_11_15 <= remap_table_1_15;
      br_snapshots_11_16 <= remap_table_1_16;
      br_snapshots_11_17 <= remap_table_1_17;
      br_snapshots_11_18 <= remap_table_1_18;
      br_snapshots_11_19 <= remap_table_1_19;
      br_snapshots_11_20 <= remap_table_1_20;
      br_snapshots_11_21 <= remap_table_1_21;
      br_snapshots_11_22 <= remap_table_1_22;
      br_snapshots_11_23 <= remap_table_1_23;
      br_snapshots_11_24 <= remap_table_1_24;
      br_snapshots_11_25 <= remap_table_1_25;
      br_snapshots_11_26 <= remap_table_1_26;
      br_snapshots_11_27 <= remap_table_1_27;
      br_snapshots_11_28 <= remap_table_1_28;
      br_snapshots_11_29 <= remap_table_1_29;
      br_snapshots_11_30 <= remap_table_1_30;
      br_snapshots_11_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'hC) begin
      br_snapshots_12_0 <= remap_table_4_0;
      br_snapshots_12_1 <= remap_table_4_1;
      br_snapshots_12_2 <= remap_table_4_2;
      br_snapshots_12_3 <= remap_table_4_3;
      br_snapshots_12_4 <= remap_table_4_4;
      br_snapshots_12_5 <= remap_table_4_5;
      br_snapshots_12_6 <= remap_table_4_6;
      br_snapshots_12_7 <= remap_table_4_7;
      br_snapshots_12_8 <= remap_table_4_8;
      br_snapshots_12_9 <= remap_table_4_9;
      br_snapshots_12_10 <= remap_table_4_10;
      br_snapshots_12_11 <= remap_table_4_11;
      br_snapshots_12_12 <= remap_table_4_12;
      br_snapshots_12_13 <= remap_table_4_13;
      br_snapshots_12_14 <= remap_table_4_14;
      br_snapshots_12_15 <= remap_table_4_15;
      br_snapshots_12_16 <= remap_table_4_16;
      br_snapshots_12_17 <= remap_table_4_17;
      br_snapshots_12_18 <= remap_table_4_18;
      br_snapshots_12_19 <= remap_table_4_19;
      br_snapshots_12_20 <= remap_table_4_20;
      br_snapshots_12_21 <= remap_table_4_21;
      br_snapshots_12_22 <= remap_table_4_22;
      br_snapshots_12_23 <= remap_table_4_23;
      br_snapshots_12_24 <= remap_table_4_24;
      br_snapshots_12_25 <= remap_table_4_25;
      br_snapshots_12_26 <= remap_table_4_26;
      br_snapshots_12_27 <= remap_table_4_27;
      br_snapshots_12_28 <= remap_table_4_28;
      br_snapshots_12_29 <= remap_table_4_29;
      br_snapshots_12_30 <= remap_table_4_30;
      br_snapshots_12_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'hC) begin
      br_snapshots_12_0 <= remap_table_3_0;
      br_snapshots_12_1 <= remap_table_3_1;
      br_snapshots_12_2 <= remap_table_3_2;
      br_snapshots_12_3 <= remap_table_3_3;
      br_snapshots_12_4 <= remap_table_3_4;
      br_snapshots_12_5 <= remap_table_3_5;
      br_snapshots_12_6 <= remap_table_3_6;
      br_snapshots_12_7 <= remap_table_3_7;
      br_snapshots_12_8 <= remap_table_3_8;
      br_snapshots_12_9 <= remap_table_3_9;
      br_snapshots_12_10 <= remap_table_3_10;
      br_snapshots_12_11 <= remap_table_3_11;
      br_snapshots_12_12 <= remap_table_3_12;
      br_snapshots_12_13 <= remap_table_3_13;
      br_snapshots_12_14 <= remap_table_3_14;
      br_snapshots_12_15 <= remap_table_3_15;
      br_snapshots_12_16 <= remap_table_3_16;
      br_snapshots_12_17 <= remap_table_3_17;
      br_snapshots_12_18 <= remap_table_3_18;
      br_snapshots_12_19 <= remap_table_3_19;
      br_snapshots_12_20 <= remap_table_3_20;
      br_snapshots_12_21 <= remap_table_3_21;
      br_snapshots_12_22 <= remap_table_3_22;
      br_snapshots_12_23 <= remap_table_3_23;
      br_snapshots_12_24 <= remap_table_3_24;
      br_snapshots_12_25 <= remap_table_3_25;
      br_snapshots_12_26 <= remap_table_3_26;
      br_snapshots_12_27 <= remap_table_3_27;
      br_snapshots_12_28 <= remap_table_3_28;
      br_snapshots_12_29 <= remap_table_3_29;
      br_snapshots_12_30 <= remap_table_3_30;
      br_snapshots_12_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'hC) begin
      br_snapshots_12_0 <= remap_table_2_0;
      br_snapshots_12_1 <= remap_table_2_1;
      br_snapshots_12_2 <= remap_table_2_2;
      br_snapshots_12_3 <= remap_table_2_3;
      br_snapshots_12_4 <= remap_table_2_4;
      br_snapshots_12_5 <= remap_table_2_5;
      br_snapshots_12_6 <= remap_table_2_6;
      br_snapshots_12_7 <= remap_table_2_7;
      br_snapshots_12_8 <= remap_table_2_8;
      br_snapshots_12_9 <= remap_table_2_9;
      br_snapshots_12_10 <= remap_table_2_10;
      br_snapshots_12_11 <= remap_table_2_11;
      br_snapshots_12_12 <= remap_table_2_12;
      br_snapshots_12_13 <= remap_table_2_13;
      br_snapshots_12_14 <= remap_table_2_14;
      br_snapshots_12_15 <= remap_table_2_15;
      br_snapshots_12_16 <= remap_table_2_16;
      br_snapshots_12_17 <= remap_table_2_17;
      br_snapshots_12_18 <= remap_table_2_18;
      br_snapshots_12_19 <= remap_table_2_19;
      br_snapshots_12_20 <= remap_table_2_20;
      br_snapshots_12_21 <= remap_table_2_21;
      br_snapshots_12_22 <= remap_table_2_22;
      br_snapshots_12_23 <= remap_table_2_23;
      br_snapshots_12_24 <= remap_table_2_24;
      br_snapshots_12_25 <= remap_table_2_25;
      br_snapshots_12_26 <= remap_table_2_26;
      br_snapshots_12_27 <= remap_table_2_27;
      br_snapshots_12_28 <= remap_table_2_28;
      br_snapshots_12_29 <= remap_table_2_29;
      br_snapshots_12_30 <= remap_table_2_30;
      br_snapshots_12_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'hC) begin
      br_snapshots_12_0 <= remap_table_1_0;
      br_snapshots_12_1 <= remap_table_1_1;
      br_snapshots_12_2 <= remap_table_1_2;
      br_snapshots_12_3 <= remap_table_1_3;
      br_snapshots_12_4 <= remap_table_1_4;
      br_snapshots_12_5 <= remap_table_1_5;
      br_snapshots_12_6 <= remap_table_1_6;
      br_snapshots_12_7 <= remap_table_1_7;
      br_snapshots_12_8 <= remap_table_1_8;
      br_snapshots_12_9 <= remap_table_1_9;
      br_snapshots_12_10 <= remap_table_1_10;
      br_snapshots_12_11 <= remap_table_1_11;
      br_snapshots_12_12 <= remap_table_1_12;
      br_snapshots_12_13 <= remap_table_1_13;
      br_snapshots_12_14 <= remap_table_1_14;
      br_snapshots_12_15 <= remap_table_1_15;
      br_snapshots_12_16 <= remap_table_1_16;
      br_snapshots_12_17 <= remap_table_1_17;
      br_snapshots_12_18 <= remap_table_1_18;
      br_snapshots_12_19 <= remap_table_1_19;
      br_snapshots_12_20 <= remap_table_1_20;
      br_snapshots_12_21 <= remap_table_1_21;
      br_snapshots_12_22 <= remap_table_1_22;
      br_snapshots_12_23 <= remap_table_1_23;
      br_snapshots_12_24 <= remap_table_1_24;
      br_snapshots_12_25 <= remap_table_1_25;
      br_snapshots_12_26 <= remap_table_1_26;
      br_snapshots_12_27 <= remap_table_1_27;
      br_snapshots_12_28 <= remap_table_1_28;
      br_snapshots_12_29 <= remap_table_1_29;
      br_snapshots_12_30 <= remap_table_1_30;
      br_snapshots_12_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'hD) begin
      br_snapshots_13_0 <= remap_table_4_0;
      br_snapshots_13_1 <= remap_table_4_1;
      br_snapshots_13_2 <= remap_table_4_2;
      br_snapshots_13_3 <= remap_table_4_3;
      br_snapshots_13_4 <= remap_table_4_4;
      br_snapshots_13_5 <= remap_table_4_5;
      br_snapshots_13_6 <= remap_table_4_6;
      br_snapshots_13_7 <= remap_table_4_7;
      br_snapshots_13_8 <= remap_table_4_8;
      br_snapshots_13_9 <= remap_table_4_9;
      br_snapshots_13_10 <= remap_table_4_10;
      br_snapshots_13_11 <= remap_table_4_11;
      br_snapshots_13_12 <= remap_table_4_12;
      br_snapshots_13_13 <= remap_table_4_13;
      br_snapshots_13_14 <= remap_table_4_14;
      br_snapshots_13_15 <= remap_table_4_15;
      br_snapshots_13_16 <= remap_table_4_16;
      br_snapshots_13_17 <= remap_table_4_17;
      br_snapshots_13_18 <= remap_table_4_18;
      br_snapshots_13_19 <= remap_table_4_19;
      br_snapshots_13_20 <= remap_table_4_20;
      br_snapshots_13_21 <= remap_table_4_21;
      br_snapshots_13_22 <= remap_table_4_22;
      br_snapshots_13_23 <= remap_table_4_23;
      br_snapshots_13_24 <= remap_table_4_24;
      br_snapshots_13_25 <= remap_table_4_25;
      br_snapshots_13_26 <= remap_table_4_26;
      br_snapshots_13_27 <= remap_table_4_27;
      br_snapshots_13_28 <= remap_table_4_28;
      br_snapshots_13_29 <= remap_table_4_29;
      br_snapshots_13_30 <= remap_table_4_30;
      br_snapshots_13_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'hD) begin
      br_snapshots_13_0 <= remap_table_3_0;
      br_snapshots_13_1 <= remap_table_3_1;
      br_snapshots_13_2 <= remap_table_3_2;
      br_snapshots_13_3 <= remap_table_3_3;
      br_snapshots_13_4 <= remap_table_3_4;
      br_snapshots_13_5 <= remap_table_3_5;
      br_snapshots_13_6 <= remap_table_3_6;
      br_snapshots_13_7 <= remap_table_3_7;
      br_snapshots_13_8 <= remap_table_3_8;
      br_snapshots_13_9 <= remap_table_3_9;
      br_snapshots_13_10 <= remap_table_3_10;
      br_snapshots_13_11 <= remap_table_3_11;
      br_snapshots_13_12 <= remap_table_3_12;
      br_snapshots_13_13 <= remap_table_3_13;
      br_snapshots_13_14 <= remap_table_3_14;
      br_snapshots_13_15 <= remap_table_3_15;
      br_snapshots_13_16 <= remap_table_3_16;
      br_snapshots_13_17 <= remap_table_3_17;
      br_snapshots_13_18 <= remap_table_3_18;
      br_snapshots_13_19 <= remap_table_3_19;
      br_snapshots_13_20 <= remap_table_3_20;
      br_snapshots_13_21 <= remap_table_3_21;
      br_snapshots_13_22 <= remap_table_3_22;
      br_snapshots_13_23 <= remap_table_3_23;
      br_snapshots_13_24 <= remap_table_3_24;
      br_snapshots_13_25 <= remap_table_3_25;
      br_snapshots_13_26 <= remap_table_3_26;
      br_snapshots_13_27 <= remap_table_3_27;
      br_snapshots_13_28 <= remap_table_3_28;
      br_snapshots_13_29 <= remap_table_3_29;
      br_snapshots_13_30 <= remap_table_3_30;
      br_snapshots_13_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'hD) begin
      br_snapshots_13_0 <= remap_table_2_0;
      br_snapshots_13_1 <= remap_table_2_1;
      br_snapshots_13_2 <= remap_table_2_2;
      br_snapshots_13_3 <= remap_table_2_3;
      br_snapshots_13_4 <= remap_table_2_4;
      br_snapshots_13_5 <= remap_table_2_5;
      br_snapshots_13_6 <= remap_table_2_6;
      br_snapshots_13_7 <= remap_table_2_7;
      br_snapshots_13_8 <= remap_table_2_8;
      br_snapshots_13_9 <= remap_table_2_9;
      br_snapshots_13_10 <= remap_table_2_10;
      br_snapshots_13_11 <= remap_table_2_11;
      br_snapshots_13_12 <= remap_table_2_12;
      br_snapshots_13_13 <= remap_table_2_13;
      br_snapshots_13_14 <= remap_table_2_14;
      br_snapshots_13_15 <= remap_table_2_15;
      br_snapshots_13_16 <= remap_table_2_16;
      br_snapshots_13_17 <= remap_table_2_17;
      br_snapshots_13_18 <= remap_table_2_18;
      br_snapshots_13_19 <= remap_table_2_19;
      br_snapshots_13_20 <= remap_table_2_20;
      br_snapshots_13_21 <= remap_table_2_21;
      br_snapshots_13_22 <= remap_table_2_22;
      br_snapshots_13_23 <= remap_table_2_23;
      br_snapshots_13_24 <= remap_table_2_24;
      br_snapshots_13_25 <= remap_table_2_25;
      br_snapshots_13_26 <= remap_table_2_26;
      br_snapshots_13_27 <= remap_table_2_27;
      br_snapshots_13_28 <= remap_table_2_28;
      br_snapshots_13_29 <= remap_table_2_29;
      br_snapshots_13_30 <= remap_table_2_30;
      br_snapshots_13_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'hD) begin
      br_snapshots_13_0 <= remap_table_1_0;
      br_snapshots_13_1 <= remap_table_1_1;
      br_snapshots_13_2 <= remap_table_1_2;
      br_snapshots_13_3 <= remap_table_1_3;
      br_snapshots_13_4 <= remap_table_1_4;
      br_snapshots_13_5 <= remap_table_1_5;
      br_snapshots_13_6 <= remap_table_1_6;
      br_snapshots_13_7 <= remap_table_1_7;
      br_snapshots_13_8 <= remap_table_1_8;
      br_snapshots_13_9 <= remap_table_1_9;
      br_snapshots_13_10 <= remap_table_1_10;
      br_snapshots_13_11 <= remap_table_1_11;
      br_snapshots_13_12 <= remap_table_1_12;
      br_snapshots_13_13 <= remap_table_1_13;
      br_snapshots_13_14 <= remap_table_1_14;
      br_snapshots_13_15 <= remap_table_1_15;
      br_snapshots_13_16 <= remap_table_1_16;
      br_snapshots_13_17 <= remap_table_1_17;
      br_snapshots_13_18 <= remap_table_1_18;
      br_snapshots_13_19 <= remap_table_1_19;
      br_snapshots_13_20 <= remap_table_1_20;
      br_snapshots_13_21 <= remap_table_1_21;
      br_snapshots_13_22 <= remap_table_1_22;
      br_snapshots_13_23 <= remap_table_1_23;
      br_snapshots_13_24 <= remap_table_1_24;
      br_snapshots_13_25 <= remap_table_1_25;
      br_snapshots_13_26 <= remap_table_1_26;
      br_snapshots_13_27 <= remap_table_1_27;
      br_snapshots_13_28 <= remap_table_1_28;
      br_snapshots_13_29 <= remap_table_1_29;
      br_snapshots_13_30 <= remap_table_1_30;
      br_snapshots_13_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'hE) begin
      br_snapshots_14_0 <= remap_table_4_0;
      br_snapshots_14_1 <= remap_table_4_1;
      br_snapshots_14_2 <= remap_table_4_2;
      br_snapshots_14_3 <= remap_table_4_3;
      br_snapshots_14_4 <= remap_table_4_4;
      br_snapshots_14_5 <= remap_table_4_5;
      br_snapshots_14_6 <= remap_table_4_6;
      br_snapshots_14_7 <= remap_table_4_7;
      br_snapshots_14_8 <= remap_table_4_8;
      br_snapshots_14_9 <= remap_table_4_9;
      br_snapshots_14_10 <= remap_table_4_10;
      br_snapshots_14_11 <= remap_table_4_11;
      br_snapshots_14_12 <= remap_table_4_12;
      br_snapshots_14_13 <= remap_table_4_13;
      br_snapshots_14_14 <= remap_table_4_14;
      br_snapshots_14_15 <= remap_table_4_15;
      br_snapshots_14_16 <= remap_table_4_16;
      br_snapshots_14_17 <= remap_table_4_17;
      br_snapshots_14_18 <= remap_table_4_18;
      br_snapshots_14_19 <= remap_table_4_19;
      br_snapshots_14_20 <= remap_table_4_20;
      br_snapshots_14_21 <= remap_table_4_21;
      br_snapshots_14_22 <= remap_table_4_22;
      br_snapshots_14_23 <= remap_table_4_23;
      br_snapshots_14_24 <= remap_table_4_24;
      br_snapshots_14_25 <= remap_table_4_25;
      br_snapshots_14_26 <= remap_table_4_26;
      br_snapshots_14_27 <= remap_table_4_27;
      br_snapshots_14_28 <= remap_table_4_28;
      br_snapshots_14_29 <= remap_table_4_29;
      br_snapshots_14_30 <= remap_table_4_30;
      br_snapshots_14_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'hE) begin
      br_snapshots_14_0 <= remap_table_3_0;
      br_snapshots_14_1 <= remap_table_3_1;
      br_snapshots_14_2 <= remap_table_3_2;
      br_snapshots_14_3 <= remap_table_3_3;
      br_snapshots_14_4 <= remap_table_3_4;
      br_snapshots_14_5 <= remap_table_3_5;
      br_snapshots_14_6 <= remap_table_3_6;
      br_snapshots_14_7 <= remap_table_3_7;
      br_snapshots_14_8 <= remap_table_3_8;
      br_snapshots_14_9 <= remap_table_3_9;
      br_snapshots_14_10 <= remap_table_3_10;
      br_snapshots_14_11 <= remap_table_3_11;
      br_snapshots_14_12 <= remap_table_3_12;
      br_snapshots_14_13 <= remap_table_3_13;
      br_snapshots_14_14 <= remap_table_3_14;
      br_snapshots_14_15 <= remap_table_3_15;
      br_snapshots_14_16 <= remap_table_3_16;
      br_snapshots_14_17 <= remap_table_3_17;
      br_snapshots_14_18 <= remap_table_3_18;
      br_snapshots_14_19 <= remap_table_3_19;
      br_snapshots_14_20 <= remap_table_3_20;
      br_snapshots_14_21 <= remap_table_3_21;
      br_snapshots_14_22 <= remap_table_3_22;
      br_snapshots_14_23 <= remap_table_3_23;
      br_snapshots_14_24 <= remap_table_3_24;
      br_snapshots_14_25 <= remap_table_3_25;
      br_snapshots_14_26 <= remap_table_3_26;
      br_snapshots_14_27 <= remap_table_3_27;
      br_snapshots_14_28 <= remap_table_3_28;
      br_snapshots_14_29 <= remap_table_3_29;
      br_snapshots_14_30 <= remap_table_3_30;
      br_snapshots_14_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'hE) begin
      br_snapshots_14_0 <= remap_table_2_0;
      br_snapshots_14_1 <= remap_table_2_1;
      br_snapshots_14_2 <= remap_table_2_2;
      br_snapshots_14_3 <= remap_table_2_3;
      br_snapshots_14_4 <= remap_table_2_4;
      br_snapshots_14_5 <= remap_table_2_5;
      br_snapshots_14_6 <= remap_table_2_6;
      br_snapshots_14_7 <= remap_table_2_7;
      br_snapshots_14_8 <= remap_table_2_8;
      br_snapshots_14_9 <= remap_table_2_9;
      br_snapshots_14_10 <= remap_table_2_10;
      br_snapshots_14_11 <= remap_table_2_11;
      br_snapshots_14_12 <= remap_table_2_12;
      br_snapshots_14_13 <= remap_table_2_13;
      br_snapshots_14_14 <= remap_table_2_14;
      br_snapshots_14_15 <= remap_table_2_15;
      br_snapshots_14_16 <= remap_table_2_16;
      br_snapshots_14_17 <= remap_table_2_17;
      br_snapshots_14_18 <= remap_table_2_18;
      br_snapshots_14_19 <= remap_table_2_19;
      br_snapshots_14_20 <= remap_table_2_20;
      br_snapshots_14_21 <= remap_table_2_21;
      br_snapshots_14_22 <= remap_table_2_22;
      br_snapshots_14_23 <= remap_table_2_23;
      br_snapshots_14_24 <= remap_table_2_24;
      br_snapshots_14_25 <= remap_table_2_25;
      br_snapshots_14_26 <= remap_table_2_26;
      br_snapshots_14_27 <= remap_table_2_27;
      br_snapshots_14_28 <= remap_table_2_28;
      br_snapshots_14_29 <= remap_table_2_29;
      br_snapshots_14_30 <= remap_table_2_30;
      br_snapshots_14_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'hE) begin
      br_snapshots_14_0 <= remap_table_1_0;
      br_snapshots_14_1 <= remap_table_1_1;
      br_snapshots_14_2 <= remap_table_1_2;
      br_snapshots_14_3 <= remap_table_1_3;
      br_snapshots_14_4 <= remap_table_1_4;
      br_snapshots_14_5 <= remap_table_1_5;
      br_snapshots_14_6 <= remap_table_1_6;
      br_snapshots_14_7 <= remap_table_1_7;
      br_snapshots_14_8 <= remap_table_1_8;
      br_snapshots_14_9 <= remap_table_1_9;
      br_snapshots_14_10 <= remap_table_1_10;
      br_snapshots_14_11 <= remap_table_1_11;
      br_snapshots_14_12 <= remap_table_1_12;
      br_snapshots_14_13 <= remap_table_1_13;
      br_snapshots_14_14 <= remap_table_1_14;
      br_snapshots_14_15 <= remap_table_1_15;
      br_snapshots_14_16 <= remap_table_1_16;
      br_snapshots_14_17 <= remap_table_1_17;
      br_snapshots_14_18 <= remap_table_1_18;
      br_snapshots_14_19 <= remap_table_1_19;
      br_snapshots_14_20 <= remap_table_1_20;
      br_snapshots_14_21 <= remap_table_1_21;
      br_snapshots_14_22 <= remap_table_1_22;
      br_snapshots_14_23 <= remap_table_1_23;
      br_snapshots_14_24 <= remap_table_1_24;
      br_snapshots_14_25 <= remap_table_1_25;
      br_snapshots_14_26 <= remap_table_1_26;
      br_snapshots_14_27 <= remap_table_1_27;
      br_snapshots_14_28 <= remap_table_1_28;
      br_snapshots_14_29 <= remap_table_1_29;
      br_snapshots_14_30 <= remap_table_1_30;
      br_snapshots_14_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'hF) begin
      br_snapshots_15_0 <= remap_table_4_0;
      br_snapshots_15_1 <= remap_table_4_1;
      br_snapshots_15_2 <= remap_table_4_2;
      br_snapshots_15_3 <= remap_table_4_3;
      br_snapshots_15_4 <= remap_table_4_4;
      br_snapshots_15_5 <= remap_table_4_5;
      br_snapshots_15_6 <= remap_table_4_6;
      br_snapshots_15_7 <= remap_table_4_7;
      br_snapshots_15_8 <= remap_table_4_8;
      br_snapshots_15_9 <= remap_table_4_9;
      br_snapshots_15_10 <= remap_table_4_10;
      br_snapshots_15_11 <= remap_table_4_11;
      br_snapshots_15_12 <= remap_table_4_12;
      br_snapshots_15_13 <= remap_table_4_13;
      br_snapshots_15_14 <= remap_table_4_14;
      br_snapshots_15_15 <= remap_table_4_15;
      br_snapshots_15_16 <= remap_table_4_16;
      br_snapshots_15_17 <= remap_table_4_17;
      br_snapshots_15_18 <= remap_table_4_18;
      br_snapshots_15_19 <= remap_table_4_19;
      br_snapshots_15_20 <= remap_table_4_20;
      br_snapshots_15_21 <= remap_table_4_21;
      br_snapshots_15_22 <= remap_table_4_22;
      br_snapshots_15_23 <= remap_table_4_23;
      br_snapshots_15_24 <= remap_table_4_24;
      br_snapshots_15_25 <= remap_table_4_25;
      br_snapshots_15_26 <= remap_table_4_26;
      br_snapshots_15_27 <= remap_table_4_27;
      br_snapshots_15_28 <= remap_table_4_28;
      br_snapshots_15_29 <= remap_table_4_29;
      br_snapshots_15_30 <= remap_table_4_30;
      br_snapshots_15_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'hF) begin
      br_snapshots_15_0 <= remap_table_3_0;
      br_snapshots_15_1 <= remap_table_3_1;
      br_snapshots_15_2 <= remap_table_3_2;
      br_snapshots_15_3 <= remap_table_3_3;
      br_snapshots_15_4 <= remap_table_3_4;
      br_snapshots_15_5 <= remap_table_3_5;
      br_snapshots_15_6 <= remap_table_3_6;
      br_snapshots_15_7 <= remap_table_3_7;
      br_snapshots_15_8 <= remap_table_3_8;
      br_snapshots_15_9 <= remap_table_3_9;
      br_snapshots_15_10 <= remap_table_3_10;
      br_snapshots_15_11 <= remap_table_3_11;
      br_snapshots_15_12 <= remap_table_3_12;
      br_snapshots_15_13 <= remap_table_3_13;
      br_snapshots_15_14 <= remap_table_3_14;
      br_snapshots_15_15 <= remap_table_3_15;
      br_snapshots_15_16 <= remap_table_3_16;
      br_snapshots_15_17 <= remap_table_3_17;
      br_snapshots_15_18 <= remap_table_3_18;
      br_snapshots_15_19 <= remap_table_3_19;
      br_snapshots_15_20 <= remap_table_3_20;
      br_snapshots_15_21 <= remap_table_3_21;
      br_snapshots_15_22 <= remap_table_3_22;
      br_snapshots_15_23 <= remap_table_3_23;
      br_snapshots_15_24 <= remap_table_3_24;
      br_snapshots_15_25 <= remap_table_3_25;
      br_snapshots_15_26 <= remap_table_3_26;
      br_snapshots_15_27 <= remap_table_3_27;
      br_snapshots_15_28 <= remap_table_3_28;
      br_snapshots_15_29 <= remap_table_3_29;
      br_snapshots_15_30 <= remap_table_3_30;
      br_snapshots_15_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'hF) begin
      br_snapshots_15_0 <= remap_table_2_0;
      br_snapshots_15_1 <= remap_table_2_1;
      br_snapshots_15_2 <= remap_table_2_2;
      br_snapshots_15_3 <= remap_table_2_3;
      br_snapshots_15_4 <= remap_table_2_4;
      br_snapshots_15_5 <= remap_table_2_5;
      br_snapshots_15_6 <= remap_table_2_6;
      br_snapshots_15_7 <= remap_table_2_7;
      br_snapshots_15_8 <= remap_table_2_8;
      br_snapshots_15_9 <= remap_table_2_9;
      br_snapshots_15_10 <= remap_table_2_10;
      br_snapshots_15_11 <= remap_table_2_11;
      br_snapshots_15_12 <= remap_table_2_12;
      br_snapshots_15_13 <= remap_table_2_13;
      br_snapshots_15_14 <= remap_table_2_14;
      br_snapshots_15_15 <= remap_table_2_15;
      br_snapshots_15_16 <= remap_table_2_16;
      br_snapshots_15_17 <= remap_table_2_17;
      br_snapshots_15_18 <= remap_table_2_18;
      br_snapshots_15_19 <= remap_table_2_19;
      br_snapshots_15_20 <= remap_table_2_20;
      br_snapshots_15_21 <= remap_table_2_21;
      br_snapshots_15_22 <= remap_table_2_22;
      br_snapshots_15_23 <= remap_table_2_23;
      br_snapshots_15_24 <= remap_table_2_24;
      br_snapshots_15_25 <= remap_table_2_25;
      br_snapshots_15_26 <= remap_table_2_26;
      br_snapshots_15_27 <= remap_table_2_27;
      br_snapshots_15_28 <= remap_table_2_28;
      br_snapshots_15_29 <= remap_table_2_29;
      br_snapshots_15_30 <= remap_table_2_30;
      br_snapshots_15_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'hF) begin
      br_snapshots_15_0 <= remap_table_1_0;
      br_snapshots_15_1 <= remap_table_1_1;
      br_snapshots_15_2 <= remap_table_1_2;
      br_snapshots_15_3 <= remap_table_1_3;
      br_snapshots_15_4 <= remap_table_1_4;
      br_snapshots_15_5 <= remap_table_1_5;
      br_snapshots_15_6 <= remap_table_1_6;
      br_snapshots_15_7 <= remap_table_1_7;
      br_snapshots_15_8 <= remap_table_1_8;
      br_snapshots_15_9 <= remap_table_1_9;
      br_snapshots_15_10 <= remap_table_1_10;
      br_snapshots_15_11 <= remap_table_1_11;
      br_snapshots_15_12 <= remap_table_1_12;
      br_snapshots_15_13 <= remap_table_1_13;
      br_snapshots_15_14 <= remap_table_1_14;
      br_snapshots_15_15 <= remap_table_1_15;
      br_snapshots_15_16 <= remap_table_1_16;
      br_snapshots_15_17 <= remap_table_1_17;
      br_snapshots_15_18 <= remap_table_1_18;
      br_snapshots_15_19 <= remap_table_1_19;
      br_snapshots_15_20 <= remap_table_1_20;
      br_snapshots_15_21 <= remap_table_1_21;
      br_snapshots_15_22 <= remap_table_1_22;
      br_snapshots_15_23 <= remap_table_1_23;
      br_snapshots_15_24 <= remap_table_1_24;
      br_snapshots_15_25 <= remap_table_1_25;
      br_snapshots_15_26 <= remap_table_1_26;
      br_snapshots_15_27 <= remap_table_1_27;
      br_snapshots_15_28 <= remap_table_1_28;
      br_snapshots_15_29 <= remap_table_1_29;
      br_snapshots_15_30 <= remap_table_1_30;
      br_snapshots_15_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'h10) begin
      br_snapshots_16_0 <= remap_table_4_0;
      br_snapshots_16_1 <= remap_table_4_1;
      br_snapshots_16_2 <= remap_table_4_2;
      br_snapshots_16_3 <= remap_table_4_3;
      br_snapshots_16_4 <= remap_table_4_4;
      br_snapshots_16_5 <= remap_table_4_5;
      br_snapshots_16_6 <= remap_table_4_6;
      br_snapshots_16_7 <= remap_table_4_7;
      br_snapshots_16_8 <= remap_table_4_8;
      br_snapshots_16_9 <= remap_table_4_9;
      br_snapshots_16_10 <= remap_table_4_10;
      br_snapshots_16_11 <= remap_table_4_11;
      br_snapshots_16_12 <= remap_table_4_12;
      br_snapshots_16_13 <= remap_table_4_13;
      br_snapshots_16_14 <= remap_table_4_14;
      br_snapshots_16_15 <= remap_table_4_15;
      br_snapshots_16_16 <= remap_table_4_16;
      br_snapshots_16_17 <= remap_table_4_17;
      br_snapshots_16_18 <= remap_table_4_18;
      br_snapshots_16_19 <= remap_table_4_19;
      br_snapshots_16_20 <= remap_table_4_20;
      br_snapshots_16_21 <= remap_table_4_21;
      br_snapshots_16_22 <= remap_table_4_22;
      br_snapshots_16_23 <= remap_table_4_23;
      br_snapshots_16_24 <= remap_table_4_24;
      br_snapshots_16_25 <= remap_table_4_25;
      br_snapshots_16_26 <= remap_table_4_26;
      br_snapshots_16_27 <= remap_table_4_27;
      br_snapshots_16_28 <= remap_table_4_28;
      br_snapshots_16_29 <= remap_table_4_29;
      br_snapshots_16_30 <= remap_table_4_30;
      br_snapshots_16_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'h10) begin
      br_snapshots_16_0 <= remap_table_3_0;
      br_snapshots_16_1 <= remap_table_3_1;
      br_snapshots_16_2 <= remap_table_3_2;
      br_snapshots_16_3 <= remap_table_3_3;
      br_snapshots_16_4 <= remap_table_3_4;
      br_snapshots_16_5 <= remap_table_3_5;
      br_snapshots_16_6 <= remap_table_3_6;
      br_snapshots_16_7 <= remap_table_3_7;
      br_snapshots_16_8 <= remap_table_3_8;
      br_snapshots_16_9 <= remap_table_3_9;
      br_snapshots_16_10 <= remap_table_3_10;
      br_snapshots_16_11 <= remap_table_3_11;
      br_snapshots_16_12 <= remap_table_3_12;
      br_snapshots_16_13 <= remap_table_3_13;
      br_snapshots_16_14 <= remap_table_3_14;
      br_snapshots_16_15 <= remap_table_3_15;
      br_snapshots_16_16 <= remap_table_3_16;
      br_snapshots_16_17 <= remap_table_3_17;
      br_snapshots_16_18 <= remap_table_3_18;
      br_snapshots_16_19 <= remap_table_3_19;
      br_snapshots_16_20 <= remap_table_3_20;
      br_snapshots_16_21 <= remap_table_3_21;
      br_snapshots_16_22 <= remap_table_3_22;
      br_snapshots_16_23 <= remap_table_3_23;
      br_snapshots_16_24 <= remap_table_3_24;
      br_snapshots_16_25 <= remap_table_3_25;
      br_snapshots_16_26 <= remap_table_3_26;
      br_snapshots_16_27 <= remap_table_3_27;
      br_snapshots_16_28 <= remap_table_3_28;
      br_snapshots_16_29 <= remap_table_3_29;
      br_snapshots_16_30 <= remap_table_3_30;
      br_snapshots_16_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'h10) begin
      br_snapshots_16_0 <= remap_table_2_0;
      br_snapshots_16_1 <= remap_table_2_1;
      br_snapshots_16_2 <= remap_table_2_2;
      br_snapshots_16_3 <= remap_table_2_3;
      br_snapshots_16_4 <= remap_table_2_4;
      br_snapshots_16_5 <= remap_table_2_5;
      br_snapshots_16_6 <= remap_table_2_6;
      br_snapshots_16_7 <= remap_table_2_7;
      br_snapshots_16_8 <= remap_table_2_8;
      br_snapshots_16_9 <= remap_table_2_9;
      br_snapshots_16_10 <= remap_table_2_10;
      br_snapshots_16_11 <= remap_table_2_11;
      br_snapshots_16_12 <= remap_table_2_12;
      br_snapshots_16_13 <= remap_table_2_13;
      br_snapshots_16_14 <= remap_table_2_14;
      br_snapshots_16_15 <= remap_table_2_15;
      br_snapshots_16_16 <= remap_table_2_16;
      br_snapshots_16_17 <= remap_table_2_17;
      br_snapshots_16_18 <= remap_table_2_18;
      br_snapshots_16_19 <= remap_table_2_19;
      br_snapshots_16_20 <= remap_table_2_20;
      br_snapshots_16_21 <= remap_table_2_21;
      br_snapshots_16_22 <= remap_table_2_22;
      br_snapshots_16_23 <= remap_table_2_23;
      br_snapshots_16_24 <= remap_table_2_24;
      br_snapshots_16_25 <= remap_table_2_25;
      br_snapshots_16_26 <= remap_table_2_26;
      br_snapshots_16_27 <= remap_table_2_27;
      br_snapshots_16_28 <= remap_table_2_28;
      br_snapshots_16_29 <= remap_table_2_29;
      br_snapshots_16_30 <= remap_table_2_30;
      br_snapshots_16_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'h10) begin
      br_snapshots_16_0 <= remap_table_1_0;
      br_snapshots_16_1 <= remap_table_1_1;
      br_snapshots_16_2 <= remap_table_1_2;
      br_snapshots_16_3 <= remap_table_1_3;
      br_snapshots_16_4 <= remap_table_1_4;
      br_snapshots_16_5 <= remap_table_1_5;
      br_snapshots_16_6 <= remap_table_1_6;
      br_snapshots_16_7 <= remap_table_1_7;
      br_snapshots_16_8 <= remap_table_1_8;
      br_snapshots_16_9 <= remap_table_1_9;
      br_snapshots_16_10 <= remap_table_1_10;
      br_snapshots_16_11 <= remap_table_1_11;
      br_snapshots_16_12 <= remap_table_1_12;
      br_snapshots_16_13 <= remap_table_1_13;
      br_snapshots_16_14 <= remap_table_1_14;
      br_snapshots_16_15 <= remap_table_1_15;
      br_snapshots_16_16 <= remap_table_1_16;
      br_snapshots_16_17 <= remap_table_1_17;
      br_snapshots_16_18 <= remap_table_1_18;
      br_snapshots_16_19 <= remap_table_1_19;
      br_snapshots_16_20 <= remap_table_1_20;
      br_snapshots_16_21 <= remap_table_1_21;
      br_snapshots_16_22 <= remap_table_1_22;
      br_snapshots_16_23 <= remap_table_1_23;
      br_snapshots_16_24 <= remap_table_1_24;
      br_snapshots_16_25 <= remap_table_1_25;
      br_snapshots_16_26 <= remap_table_1_26;
      br_snapshots_16_27 <= remap_table_1_27;
      br_snapshots_16_28 <= remap_table_1_28;
      br_snapshots_16_29 <= remap_table_1_29;
      br_snapshots_16_30 <= remap_table_1_30;
      br_snapshots_16_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'h11) begin
      br_snapshots_17_0 <= remap_table_4_0;
      br_snapshots_17_1 <= remap_table_4_1;
      br_snapshots_17_2 <= remap_table_4_2;
      br_snapshots_17_3 <= remap_table_4_3;
      br_snapshots_17_4 <= remap_table_4_4;
      br_snapshots_17_5 <= remap_table_4_5;
      br_snapshots_17_6 <= remap_table_4_6;
      br_snapshots_17_7 <= remap_table_4_7;
      br_snapshots_17_8 <= remap_table_4_8;
      br_snapshots_17_9 <= remap_table_4_9;
      br_snapshots_17_10 <= remap_table_4_10;
      br_snapshots_17_11 <= remap_table_4_11;
      br_snapshots_17_12 <= remap_table_4_12;
      br_snapshots_17_13 <= remap_table_4_13;
      br_snapshots_17_14 <= remap_table_4_14;
      br_snapshots_17_15 <= remap_table_4_15;
      br_snapshots_17_16 <= remap_table_4_16;
      br_snapshots_17_17 <= remap_table_4_17;
      br_snapshots_17_18 <= remap_table_4_18;
      br_snapshots_17_19 <= remap_table_4_19;
      br_snapshots_17_20 <= remap_table_4_20;
      br_snapshots_17_21 <= remap_table_4_21;
      br_snapshots_17_22 <= remap_table_4_22;
      br_snapshots_17_23 <= remap_table_4_23;
      br_snapshots_17_24 <= remap_table_4_24;
      br_snapshots_17_25 <= remap_table_4_25;
      br_snapshots_17_26 <= remap_table_4_26;
      br_snapshots_17_27 <= remap_table_4_27;
      br_snapshots_17_28 <= remap_table_4_28;
      br_snapshots_17_29 <= remap_table_4_29;
      br_snapshots_17_30 <= remap_table_4_30;
      br_snapshots_17_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'h11) begin
      br_snapshots_17_0 <= remap_table_3_0;
      br_snapshots_17_1 <= remap_table_3_1;
      br_snapshots_17_2 <= remap_table_3_2;
      br_snapshots_17_3 <= remap_table_3_3;
      br_snapshots_17_4 <= remap_table_3_4;
      br_snapshots_17_5 <= remap_table_3_5;
      br_snapshots_17_6 <= remap_table_3_6;
      br_snapshots_17_7 <= remap_table_3_7;
      br_snapshots_17_8 <= remap_table_3_8;
      br_snapshots_17_9 <= remap_table_3_9;
      br_snapshots_17_10 <= remap_table_3_10;
      br_snapshots_17_11 <= remap_table_3_11;
      br_snapshots_17_12 <= remap_table_3_12;
      br_snapshots_17_13 <= remap_table_3_13;
      br_snapshots_17_14 <= remap_table_3_14;
      br_snapshots_17_15 <= remap_table_3_15;
      br_snapshots_17_16 <= remap_table_3_16;
      br_snapshots_17_17 <= remap_table_3_17;
      br_snapshots_17_18 <= remap_table_3_18;
      br_snapshots_17_19 <= remap_table_3_19;
      br_snapshots_17_20 <= remap_table_3_20;
      br_snapshots_17_21 <= remap_table_3_21;
      br_snapshots_17_22 <= remap_table_3_22;
      br_snapshots_17_23 <= remap_table_3_23;
      br_snapshots_17_24 <= remap_table_3_24;
      br_snapshots_17_25 <= remap_table_3_25;
      br_snapshots_17_26 <= remap_table_3_26;
      br_snapshots_17_27 <= remap_table_3_27;
      br_snapshots_17_28 <= remap_table_3_28;
      br_snapshots_17_29 <= remap_table_3_29;
      br_snapshots_17_30 <= remap_table_3_30;
      br_snapshots_17_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'h11) begin
      br_snapshots_17_0 <= remap_table_2_0;
      br_snapshots_17_1 <= remap_table_2_1;
      br_snapshots_17_2 <= remap_table_2_2;
      br_snapshots_17_3 <= remap_table_2_3;
      br_snapshots_17_4 <= remap_table_2_4;
      br_snapshots_17_5 <= remap_table_2_5;
      br_snapshots_17_6 <= remap_table_2_6;
      br_snapshots_17_7 <= remap_table_2_7;
      br_snapshots_17_8 <= remap_table_2_8;
      br_snapshots_17_9 <= remap_table_2_9;
      br_snapshots_17_10 <= remap_table_2_10;
      br_snapshots_17_11 <= remap_table_2_11;
      br_snapshots_17_12 <= remap_table_2_12;
      br_snapshots_17_13 <= remap_table_2_13;
      br_snapshots_17_14 <= remap_table_2_14;
      br_snapshots_17_15 <= remap_table_2_15;
      br_snapshots_17_16 <= remap_table_2_16;
      br_snapshots_17_17 <= remap_table_2_17;
      br_snapshots_17_18 <= remap_table_2_18;
      br_snapshots_17_19 <= remap_table_2_19;
      br_snapshots_17_20 <= remap_table_2_20;
      br_snapshots_17_21 <= remap_table_2_21;
      br_snapshots_17_22 <= remap_table_2_22;
      br_snapshots_17_23 <= remap_table_2_23;
      br_snapshots_17_24 <= remap_table_2_24;
      br_snapshots_17_25 <= remap_table_2_25;
      br_snapshots_17_26 <= remap_table_2_26;
      br_snapshots_17_27 <= remap_table_2_27;
      br_snapshots_17_28 <= remap_table_2_28;
      br_snapshots_17_29 <= remap_table_2_29;
      br_snapshots_17_30 <= remap_table_2_30;
      br_snapshots_17_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'h11) begin
      br_snapshots_17_0 <= remap_table_1_0;
      br_snapshots_17_1 <= remap_table_1_1;
      br_snapshots_17_2 <= remap_table_1_2;
      br_snapshots_17_3 <= remap_table_1_3;
      br_snapshots_17_4 <= remap_table_1_4;
      br_snapshots_17_5 <= remap_table_1_5;
      br_snapshots_17_6 <= remap_table_1_6;
      br_snapshots_17_7 <= remap_table_1_7;
      br_snapshots_17_8 <= remap_table_1_8;
      br_snapshots_17_9 <= remap_table_1_9;
      br_snapshots_17_10 <= remap_table_1_10;
      br_snapshots_17_11 <= remap_table_1_11;
      br_snapshots_17_12 <= remap_table_1_12;
      br_snapshots_17_13 <= remap_table_1_13;
      br_snapshots_17_14 <= remap_table_1_14;
      br_snapshots_17_15 <= remap_table_1_15;
      br_snapshots_17_16 <= remap_table_1_16;
      br_snapshots_17_17 <= remap_table_1_17;
      br_snapshots_17_18 <= remap_table_1_18;
      br_snapshots_17_19 <= remap_table_1_19;
      br_snapshots_17_20 <= remap_table_1_20;
      br_snapshots_17_21 <= remap_table_1_21;
      br_snapshots_17_22 <= remap_table_1_22;
      br_snapshots_17_23 <= remap_table_1_23;
      br_snapshots_17_24 <= remap_table_1_24;
      br_snapshots_17_25 <= remap_table_1_25;
      br_snapshots_17_26 <= remap_table_1_26;
      br_snapshots_17_27 <= remap_table_1_27;
      br_snapshots_17_28 <= remap_table_1_28;
      br_snapshots_17_29 <= remap_table_1_29;
      br_snapshots_17_30 <= remap_table_1_30;
      br_snapshots_17_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'h12) begin
      br_snapshots_18_0 <= remap_table_4_0;
      br_snapshots_18_1 <= remap_table_4_1;
      br_snapshots_18_2 <= remap_table_4_2;
      br_snapshots_18_3 <= remap_table_4_3;
      br_snapshots_18_4 <= remap_table_4_4;
      br_snapshots_18_5 <= remap_table_4_5;
      br_snapshots_18_6 <= remap_table_4_6;
      br_snapshots_18_7 <= remap_table_4_7;
      br_snapshots_18_8 <= remap_table_4_8;
      br_snapshots_18_9 <= remap_table_4_9;
      br_snapshots_18_10 <= remap_table_4_10;
      br_snapshots_18_11 <= remap_table_4_11;
      br_snapshots_18_12 <= remap_table_4_12;
      br_snapshots_18_13 <= remap_table_4_13;
      br_snapshots_18_14 <= remap_table_4_14;
      br_snapshots_18_15 <= remap_table_4_15;
      br_snapshots_18_16 <= remap_table_4_16;
      br_snapshots_18_17 <= remap_table_4_17;
      br_snapshots_18_18 <= remap_table_4_18;
      br_snapshots_18_19 <= remap_table_4_19;
      br_snapshots_18_20 <= remap_table_4_20;
      br_snapshots_18_21 <= remap_table_4_21;
      br_snapshots_18_22 <= remap_table_4_22;
      br_snapshots_18_23 <= remap_table_4_23;
      br_snapshots_18_24 <= remap_table_4_24;
      br_snapshots_18_25 <= remap_table_4_25;
      br_snapshots_18_26 <= remap_table_4_26;
      br_snapshots_18_27 <= remap_table_4_27;
      br_snapshots_18_28 <= remap_table_4_28;
      br_snapshots_18_29 <= remap_table_4_29;
      br_snapshots_18_30 <= remap_table_4_30;
      br_snapshots_18_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'h12) begin
      br_snapshots_18_0 <= remap_table_3_0;
      br_snapshots_18_1 <= remap_table_3_1;
      br_snapshots_18_2 <= remap_table_3_2;
      br_snapshots_18_3 <= remap_table_3_3;
      br_snapshots_18_4 <= remap_table_3_4;
      br_snapshots_18_5 <= remap_table_3_5;
      br_snapshots_18_6 <= remap_table_3_6;
      br_snapshots_18_7 <= remap_table_3_7;
      br_snapshots_18_8 <= remap_table_3_8;
      br_snapshots_18_9 <= remap_table_3_9;
      br_snapshots_18_10 <= remap_table_3_10;
      br_snapshots_18_11 <= remap_table_3_11;
      br_snapshots_18_12 <= remap_table_3_12;
      br_snapshots_18_13 <= remap_table_3_13;
      br_snapshots_18_14 <= remap_table_3_14;
      br_snapshots_18_15 <= remap_table_3_15;
      br_snapshots_18_16 <= remap_table_3_16;
      br_snapshots_18_17 <= remap_table_3_17;
      br_snapshots_18_18 <= remap_table_3_18;
      br_snapshots_18_19 <= remap_table_3_19;
      br_snapshots_18_20 <= remap_table_3_20;
      br_snapshots_18_21 <= remap_table_3_21;
      br_snapshots_18_22 <= remap_table_3_22;
      br_snapshots_18_23 <= remap_table_3_23;
      br_snapshots_18_24 <= remap_table_3_24;
      br_snapshots_18_25 <= remap_table_3_25;
      br_snapshots_18_26 <= remap_table_3_26;
      br_snapshots_18_27 <= remap_table_3_27;
      br_snapshots_18_28 <= remap_table_3_28;
      br_snapshots_18_29 <= remap_table_3_29;
      br_snapshots_18_30 <= remap_table_3_30;
      br_snapshots_18_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'h12) begin
      br_snapshots_18_0 <= remap_table_2_0;
      br_snapshots_18_1 <= remap_table_2_1;
      br_snapshots_18_2 <= remap_table_2_2;
      br_snapshots_18_3 <= remap_table_2_3;
      br_snapshots_18_4 <= remap_table_2_4;
      br_snapshots_18_5 <= remap_table_2_5;
      br_snapshots_18_6 <= remap_table_2_6;
      br_snapshots_18_7 <= remap_table_2_7;
      br_snapshots_18_8 <= remap_table_2_8;
      br_snapshots_18_9 <= remap_table_2_9;
      br_snapshots_18_10 <= remap_table_2_10;
      br_snapshots_18_11 <= remap_table_2_11;
      br_snapshots_18_12 <= remap_table_2_12;
      br_snapshots_18_13 <= remap_table_2_13;
      br_snapshots_18_14 <= remap_table_2_14;
      br_snapshots_18_15 <= remap_table_2_15;
      br_snapshots_18_16 <= remap_table_2_16;
      br_snapshots_18_17 <= remap_table_2_17;
      br_snapshots_18_18 <= remap_table_2_18;
      br_snapshots_18_19 <= remap_table_2_19;
      br_snapshots_18_20 <= remap_table_2_20;
      br_snapshots_18_21 <= remap_table_2_21;
      br_snapshots_18_22 <= remap_table_2_22;
      br_snapshots_18_23 <= remap_table_2_23;
      br_snapshots_18_24 <= remap_table_2_24;
      br_snapshots_18_25 <= remap_table_2_25;
      br_snapshots_18_26 <= remap_table_2_26;
      br_snapshots_18_27 <= remap_table_2_27;
      br_snapshots_18_28 <= remap_table_2_28;
      br_snapshots_18_29 <= remap_table_2_29;
      br_snapshots_18_30 <= remap_table_2_30;
      br_snapshots_18_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'h12) begin
      br_snapshots_18_0 <= remap_table_1_0;
      br_snapshots_18_1 <= remap_table_1_1;
      br_snapshots_18_2 <= remap_table_1_2;
      br_snapshots_18_3 <= remap_table_1_3;
      br_snapshots_18_4 <= remap_table_1_4;
      br_snapshots_18_5 <= remap_table_1_5;
      br_snapshots_18_6 <= remap_table_1_6;
      br_snapshots_18_7 <= remap_table_1_7;
      br_snapshots_18_8 <= remap_table_1_8;
      br_snapshots_18_9 <= remap_table_1_9;
      br_snapshots_18_10 <= remap_table_1_10;
      br_snapshots_18_11 <= remap_table_1_11;
      br_snapshots_18_12 <= remap_table_1_12;
      br_snapshots_18_13 <= remap_table_1_13;
      br_snapshots_18_14 <= remap_table_1_14;
      br_snapshots_18_15 <= remap_table_1_15;
      br_snapshots_18_16 <= remap_table_1_16;
      br_snapshots_18_17 <= remap_table_1_17;
      br_snapshots_18_18 <= remap_table_1_18;
      br_snapshots_18_19 <= remap_table_1_19;
      br_snapshots_18_20 <= remap_table_1_20;
      br_snapshots_18_21 <= remap_table_1_21;
      br_snapshots_18_22 <= remap_table_1_22;
      br_snapshots_18_23 <= remap_table_1_23;
      br_snapshots_18_24 <= remap_table_1_24;
      br_snapshots_18_25 <= remap_table_1_25;
      br_snapshots_18_26 <= remap_table_1_26;
      br_snapshots_18_27 <= remap_table_1_27;
      br_snapshots_18_28 <= remap_table_1_28;
      br_snapshots_18_29 <= remap_table_1_29;
      br_snapshots_18_30 <= remap_table_1_30;
      br_snapshots_18_31 <= remap_table_1_31;
    end
    if (io_ren_br_tags_3_valid & io_ren_br_tags_3_bits == 5'h13) begin
      br_snapshots_19_0 <= remap_table_4_0;
      br_snapshots_19_1 <= remap_table_4_1;
      br_snapshots_19_2 <= remap_table_4_2;
      br_snapshots_19_3 <= remap_table_4_3;
      br_snapshots_19_4 <= remap_table_4_4;
      br_snapshots_19_5 <= remap_table_4_5;
      br_snapshots_19_6 <= remap_table_4_6;
      br_snapshots_19_7 <= remap_table_4_7;
      br_snapshots_19_8 <= remap_table_4_8;
      br_snapshots_19_9 <= remap_table_4_9;
      br_snapshots_19_10 <= remap_table_4_10;
      br_snapshots_19_11 <= remap_table_4_11;
      br_snapshots_19_12 <= remap_table_4_12;
      br_snapshots_19_13 <= remap_table_4_13;
      br_snapshots_19_14 <= remap_table_4_14;
      br_snapshots_19_15 <= remap_table_4_15;
      br_snapshots_19_16 <= remap_table_4_16;
      br_snapshots_19_17 <= remap_table_4_17;
      br_snapshots_19_18 <= remap_table_4_18;
      br_snapshots_19_19 <= remap_table_4_19;
      br_snapshots_19_20 <= remap_table_4_20;
      br_snapshots_19_21 <= remap_table_4_21;
      br_snapshots_19_22 <= remap_table_4_22;
      br_snapshots_19_23 <= remap_table_4_23;
      br_snapshots_19_24 <= remap_table_4_24;
      br_snapshots_19_25 <= remap_table_4_25;
      br_snapshots_19_26 <= remap_table_4_26;
      br_snapshots_19_27 <= remap_table_4_27;
      br_snapshots_19_28 <= remap_table_4_28;
      br_snapshots_19_29 <= remap_table_4_29;
      br_snapshots_19_30 <= remap_table_4_30;
      br_snapshots_19_31 <= remap_table_4_31;
    end
    else if (io_ren_br_tags_2_valid & io_ren_br_tags_2_bits == 5'h13) begin
      br_snapshots_19_0 <= remap_table_3_0;
      br_snapshots_19_1 <= remap_table_3_1;
      br_snapshots_19_2 <= remap_table_3_2;
      br_snapshots_19_3 <= remap_table_3_3;
      br_snapshots_19_4 <= remap_table_3_4;
      br_snapshots_19_5 <= remap_table_3_5;
      br_snapshots_19_6 <= remap_table_3_6;
      br_snapshots_19_7 <= remap_table_3_7;
      br_snapshots_19_8 <= remap_table_3_8;
      br_snapshots_19_9 <= remap_table_3_9;
      br_snapshots_19_10 <= remap_table_3_10;
      br_snapshots_19_11 <= remap_table_3_11;
      br_snapshots_19_12 <= remap_table_3_12;
      br_snapshots_19_13 <= remap_table_3_13;
      br_snapshots_19_14 <= remap_table_3_14;
      br_snapshots_19_15 <= remap_table_3_15;
      br_snapshots_19_16 <= remap_table_3_16;
      br_snapshots_19_17 <= remap_table_3_17;
      br_snapshots_19_18 <= remap_table_3_18;
      br_snapshots_19_19 <= remap_table_3_19;
      br_snapshots_19_20 <= remap_table_3_20;
      br_snapshots_19_21 <= remap_table_3_21;
      br_snapshots_19_22 <= remap_table_3_22;
      br_snapshots_19_23 <= remap_table_3_23;
      br_snapshots_19_24 <= remap_table_3_24;
      br_snapshots_19_25 <= remap_table_3_25;
      br_snapshots_19_26 <= remap_table_3_26;
      br_snapshots_19_27 <= remap_table_3_27;
      br_snapshots_19_28 <= remap_table_3_28;
      br_snapshots_19_29 <= remap_table_3_29;
      br_snapshots_19_30 <= remap_table_3_30;
      br_snapshots_19_31 <= remap_table_3_31;
    end
    else if (io_ren_br_tags_1_valid & io_ren_br_tags_1_bits == 5'h13) begin
      br_snapshots_19_0 <= remap_table_2_0;
      br_snapshots_19_1 <= remap_table_2_1;
      br_snapshots_19_2 <= remap_table_2_2;
      br_snapshots_19_3 <= remap_table_2_3;
      br_snapshots_19_4 <= remap_table_2_4;
      br_snapshots_19_5 <= remap_table_2_5;
      br_snapshots_19_6 <= remap_table_2_6;
      br_snapshots_19_7 <= remap_table_2_7;
      br_snapshots_19_8 <= remap_table_2_8;
      br_snapshots_19_9 <= remap_table_2_9;
      br_snapshots_19_10 <= remap_table_2_10;
      br_snapshots_19_11 <= remap_table_2_11;
      br_snapshots_19_12 <= remap_table_2_12;
      br_snapshots_19_13 <= remap_table_2_13;
      br_snapshots_19_14 <= remap_table_2_14;
      br_snapshots_19_15 <= remap_table_2_15;
      br_snapshots_19_16 <= remap_table_2_16;
      br_snapshots_19_17 <= remap_table_2_17;
      br_snapshots_19_18 <= remap_table_2_18;
      br_snapshots_19_19 <= remap_table_2_19;
      br_snapshots_19_20 <= remap_table_2_20;
      br_snapshots_19_21 <= remap_table_2_21;
      br_snapshots_19_22 <= remap_table_2_22;
      br_snapshots_19_23 <= remap_table_2_23;
      br_snapshots_19_24 <= remap_table_2_24;
      br_snapshots_19_25 <= remap_table_2_25;
      br_snapshots_19_26 <= remap_table_2_26;
      br_snapshots_19_27 <= remap_table_2_27;
      br_snapshots_19_28 <= remap_table_2_28;
      br_snapshots_19_29 <= remap_table_2_29;
      br_snapshots_19_30 <= remap_table_2_30;
      br_snapshots_19_31 <= remap_table_2_31;
    end
    else if (io_ren_br_tags_0_valid & io_ren_br_tags_0_bits == 5'h13) begin
      br_snapshots_19_0 <= remap_table_1_0;
      br_snapshots_19_1 <= remap_table_1_1;
      br_snapshots_19_2 <= remap_table_1_2;
      br_snapshots_19_3 <= remap_table_1_3;
      br_snapshots_19_4 <= remap_table_1_4;
      br_snapshots_19_5 <= remap_table_1_5;
      br_snapshots_19_6 <= remap_table_1_6;
      br_snapshots_19_7 <= remap_table_1_7;
      br_snapshots_19_8 <= remap_table_1_8;
      br_snapshots_19_9 <= remap_table_1_9;
      br_snapshots_19_10 <= remap_table_1_10;
      br_snapshots_19_11 <= remap_table_1_11;
      br_snapshots_19_12 <= remap_table_1_12;
      br_snapshots_19_13 <= remap_table_1_13;
      br_snapshots_19_14 <= remap_table_1_14;
      br_snapshots_19_15 <= remap_table_1_15;
      br_snapshots_19_16 <= remap_table_1_16;
      br_snapshots_19_17 <= remap_table_1_17;
      br_snapshots_19_18 <= remap_table_1_18;
      br_snapshots_19_19 <= remap_table_1_19;
      br_snapshots_19_20 <= remap_table_1_20;
      br_snapshots_19_21 <= remap_table_1_21;
      br_snapshots_19_22 <= remap_table_1_22;
      br_snapshots_19_23 <= remap_table_1_23;
      br_snapshots_19_24 <= remap_table_1_24;
      br_snapshots_19_25 <= remap_table_1_25;
      br_snapshots_19_26 <= remap_table_1_26;
      br_snapshots_19_27 <= remap_table_1_27;
      br_snapshots_19_28 <= remap_table_1_28;
      br_snapshots_19_29 <= remap_table_1_29;
      br_snapshots_19_30 <= remap_table_1_30;
      br_snapshots_19_31 <= remap_table_1_31;
    end
  end // always @(posedge)
  assign io_map_resps_0_prs1 = casez_tmp_31;
  assign io_map_resps_0_prs2 = casez_tmp_32;
  assign io_map_resps_0_prs3 = casez_tmp_33;
  assign io_map_resps_0_stale_pdst = casez_tmp_34;
  assign io_map_resps_1_prs1 = casez_tmp_35;
  assign io_map_resps_1_prs2 = casez_tmp_36;
  assign io_map_resps_1_prs3 = casez_tmp_37;
  assign io_map_resps_1_stale_pdst = casez_tmp_38;
  assign io_map_resps_2_prs1 = casez_tmp_39;
  assign io_map_resps_2_prs2 = casez_tmp_40;
  assign io_map_resps_2_prs3 = casez_tmp_41;
  assign io_map_resps_2_stale_pdst = casez_tmp_42;
  assign io_map_resps_3_prs1 = casez_tmp_43;
  assign io_map_resps_3_prs2 = casez_tmp_44;
  assign io_map_resps_3_prs3 = casez_tmp_45;
  assign io_map_resps_3_stale_pdst = casez_tmp_46;
endmodule

