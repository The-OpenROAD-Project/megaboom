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

module RenameBusyTable(
  input        clock,
               reset,
  input  [6:0] io_ren_uops_0_pdst,
               io_ren_uops_0_prs1,
               io_ren_uops_0_prs2,
               io_ren_uops_1_pdst,
               io_ren_uops_1_prs1,
               io_ren_uops_1_prs2,
               io_ren_uops_2_pdst,
               io_ren_uops_2_prs1,
               io_ren_uops_2_prs2,
               io_ren_uops_3_pdst,
               io_ren_uops_3_prs1,
               io_ren_uops_3_prs2,
  output       io_busy_resps_0_prs1_busy,
               io_busy_resps_0_prs2_busy,
               io_busy_resps_1_prs1_busy,
               io_busy_resps_1_prs2_busy,
               io_busy_resps_2_prs1_busy,
               io_busy_resps_2_prs2_busy,
               io_busy_resps_3_prs1_busy,
               io_busy_resps_3_prs2_busy,
  input        io_rebusy_reqs_0,
               io_rebusy_reqs_1,
               io_rebusy_reqs_2,
               io_rebusy_reqs_3,
  input  [6:0] io_wb_pdsts_0,
               io_wb_pdsts_1,
               io_wb_pdsts_2,
               io_wb_pdsts_3,
               io_wb_pdsts_4,
               io_wb_pdsts_5,
               io_wb_pdsts_6,
               io_wb_pdsts_7,
               io_wb_pdsts_8,
               io_wb_pdsts_9,
  input        io_wb_valids_0,
               io_wb_valids_1,
               io_wb_valids_2,
               io_wb_valids_3,
               io_wb_valids_4,
               io_wb_valids_5,
               io_wb_valids_6,
               io_wb_valids_7,
               io_wb_valids_8,
               io_wb_valids_9
);

  reg  [127:0] busy_table;
  wire [127:0] _io_busy_resps_0_prs1_busy_T = busy_table >> io_ren_uops_0_prs1;
  wire [127:0] _io_busy_resps_0_prs2_busy_T = busy_table >> io_ren_uops_0_prs2;
  wire [127:0] _io_busy_resps_1_prs1_busy_T = busy_table >> io_ren_uops_1_prs1;
  wire [127:0] _io_busy_resps_1_prs2_busy_T = busy_table >> io_ren_uops_1_prs2;
  wire [127:0] _io_busy_resps_2_prs1_busy_T = busy_table >> io_ren_uops_2_prs1;
  wire [127:0] _io_busy_resps_2_prs2_busy_T = busy_table >> io_ren_uops_2_prs2;
  wire [127:0] _io_busy_resps_3_prs1_busy_T = busy_table >> io_ren_uops_3_prs1;
  wire [127:0] _io_busy_resps_3_prs2_busy_T = busy_table >> io_ren_uops_3_prs2;
  always @(posedge clock) begin
    if (reset)
      busy_table <= 128'h0;
    else
      busy_table <= busy_table & ~(128'h1 << io_wb_pdsts_0 & {128{io_wb_valids_0}} | 128'h1 << io_wb_pdsts_1 & {128{io_wb_valids_1}} | 128'h1 << io_wb_pdsts_2 & {128{io_wb_valids_2}} | 128'h1 << io_wb_pdsts_3 & {128{io_wb_valids_3}} | 128'h1 << io_wb_pdsts_4 & {128{io_wb_valids_4}} | 128'h1 << io_wb_pdsts_5 & {128{io_wb_valids_5}} | 128'h1 << io_wb_pdsts_6 & {128{io_wb_valids_6}} | 128'h1 << io_wb_pdsts_7 & {128{io_wb_valids_7}} | 128'h1 << io_wb_pdsts_8 & {128{io_wb_valids_8}} | 128'h1 << io_wb_pdsts_9 & {128{io_wb_valids_9}}) | 128'h1 << io_ren_uops_0_pdst & {128{io_rebusy_reqs_0}} | 128'h1 << io_ren_uops_1_pdst & {128{io_rebusy_reqs_1}} | 128'h1 << io_ren_uops_2_pdst & {128{io_rebusy_reqs_2}} | 128'h1 << io_ren_uops_3_pdst & {128{io_rebusy_reqs_3}};
  end // always @(posedge)
  assign io_busy_resps_0_prs1_busy = _io_busy_resps_0_prs1_busy_T[0];
  assign io_busy_resps_0_prs2_busy = _io_busy_resps_0_prs2_busy_T[0];
  assign io_busy_resps_1_prs1_busy = _io_busy_resps_1_prs1_busy_T[0];
  assign io_busy_resps_1_prs2_busy = _io_busy_resps_1_prs2_busy_T[0];
  assign io_busy_resps_2_prs1_busy = _io_busy_resps_2_prs1_busy_T[0];
  assign io_busy_resps_2_prs2_busy = _io_busy_resps_2_prs2_busy_T[0];
  assign io_busy_resps_3_prs1_busy = _io_busy_resps_3_prs1_busy_T[0];
  assign io_busy_resps_3_prs2_busy = _io_busy_resps_3_prs2_busy_T[0];
endmodule

