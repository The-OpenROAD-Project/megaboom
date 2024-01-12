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

module FixedClockBroadcast(
  input  auto_in_clock,
         auto_in_reset,
  output auto_out_2_clock,
         auto_out_2_reset,
         auto_out_0_clock,
         auto_out_0_reset
);

  assign auto_out_2_clock = auto_in_clock;
  assign auto_out_2_reset = auto_in_reset;
  assign auto_out_0_clock = auto_in_clock;
  assign auto_out_0_reset = auto_in_reset;
endmodule

