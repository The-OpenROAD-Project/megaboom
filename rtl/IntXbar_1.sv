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

module IntXbar_1(
  input  auto_int_in_1_0,
         auto_int_in_1_1,
         auto_int_in_0_0,
  output auto_int_out_0,
         auto_int_out_1,
         auto_int_out_2
);

  assign auto_int_out_0 = auto_int_in_0_0;
  assign auto_int_out_1 = auto_int_in_1_0;
  assign auto_int_out_2 = auto_int_in_1_1;
endmodule

