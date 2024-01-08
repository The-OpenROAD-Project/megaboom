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

module ClockMutexMux(
  input  io_clocksIn_0,
         io_clocksIn_1,
  output io_clockOut,
  input  io_resetAsync,
         io_sel
);

  wire _gaters_1_out;
  wire _gaters_0_out;
  wire _syncs_1_io_q;
  wire _syncs_0_io_q;
  wire _andClocks_x_3_clockOut;
  wire _andClocks_x_2_clockOut;
  wire _andClocks_x_1_clockOut;
  wire _andClocks_x_clockOut;
  ClockInverter andClocks_x (
    .clockIn  (io_clocksIn_0),
    .clockOut (_andClocks_x_clockOut)
  );
  ClockSignalNor2 andClocks_x_1 (
    .clockIn  (_andClocks_x_clockOut),
    .signalIn (io_resetAsync),
    .clockOut (_andClocks_x_1_clockOut)
  );
  ClockInverter andClocks_x_2 (
    .clockIn  (io_clocksIn_1),
    .clockOut (_andClocks_x_2_clockOut)
  );
  ClockSignalNor2 andClocks_x_3 (
    .clockIn  (_andClocks_x_2_clockOut),
    .signalIn (io_resetAsync),
    .clockOut (_andClocks_x_3_clockOut)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0_1 syncs_0 (
    .clock (_andClocks_x_1_clockOut),
    .reset (io_resetAsync),
    .io_d  (~io_sel & ~_syncs_1_io_q),
    .io_q  (_syncs_0_io_q)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0_1 syncs_1 (
    .clock (_andClocks_x_3_clockOut),
    .reset (io_resetAsync),
    .io_d  (io_sel & ~_syncs_0_io_q),
    .io_q  (_syncs_1_io_q)
  );
  EICG_wrapper gaters_0 (
    .in      (_andClocks_x_1_clockOut),
    .test_en (1'h0),
    .en      (_syncs_0_io_q),
    .out     (_gaters_0_out)
  );
  EICG_wrapper gaters_1 (
    .in      (_andClocks_x_3_clockOut),
    .test_en (1'h0),
    .en      (_syncs_1_io_q),
    .out     (_gaters_1_out)
  );
  ClockOr2 ClockOr2 (
    .clocksIn_0 (_gaters_0_out),
    .clocksIn_1 (_gaters_1_out),
    .clockOut   (io_clockOut)
  );
endmodule

