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

module ClockGroupParameterModifier(
  input  auto_clock_name_prefixer_in_4_member_subsystem_cbus_subsystem_cbus_0_clock,
         auto_clock_name_prefixer_in_4_member_subsystem_cbus_subsystem_cbus_0_reset,
         auto_clock_name_prefixer_in_3_member_subsystem_mbus_subsystem_mbus_1_clock,
         auto_clock_name_prefixer_in_3_member_subsystem_mbus_subsystem_mbus_1_reset,
         auto_clock_name_prefixer_in_3_member_subsystem_mbus_subsystem_mbus_0_clock,
         auto_clock_name_prefixer_in_3_member_subsystem_mbus_subsystem_mbus_0_reset,
         auto_clock_name_prefixer_in_2_member_subsystem_fbus_subsystem_fbus_0_clock,
         auto_clock_name_prefixer_in_2_member_subsystem_fbus_subsystem_fbus_0_reset,
         auto_clock_name_prefixer_in_1_member_subsystem_pbus_subsystem_pbus_0_clock,
         auto_clock_name_prefixer_in_1_member_subsystem_pbus_subsystem_pbus_0_reset,
         auto_clock_name_prefixer_in_0_member_subsystem_sbus_subsystem_sbus_1_clock,
         auto_clock_name_prefixer_in_0_member_subsystem_sbus_subsystem_sbus_1_reset,
         auto_clock_name_prefixer_in_0_member_subsystem_sbus_subsystem_sbus_0_clock,
         auto_clock_name_prefixer_in_0_member_subsystem_sbus_subsystem_sbus_0_reset,
  output auto_clock_name_prefixer_out_4_member_subsystem_cbus_0_clock,
         auto_clock_name_prefixer_out_4_member_subsystem_cbus_0_reset,
         auto_clock_name_prefixer_out_3_member_subsystem_mbus_1_clock,
         auto_clock_name_prefixer_out_3_member_subsystem_mbus_1_reset,
         auto_clock_name_prefixer_out_3_member_subsystem_mbus_0_clock,
         auto_clock_name_prefixer_out_3_member_subsystem_mbus_0_reset,
         auto_clock_name_prefixer_out_2_member_subsystem_fbus_0_clock,
         auto_clock_name_prefixer_out_2_member_subsystem_fbus_0_reset,
         auto_clock_name_prefixer_out_1_member_subsystem_pbus_0_clock,
         auto_clock_name_prefixer_out_1_member_subsystem_pbus_0_reset,
         auto_clock_name_prefixer_out_0_member_subsystem_sbus_1_clock,
         auto_clock_name_prefixer_out_0_member_subsystem_sbus_1_reset,
         auto_clock_name_prefixer_out_0_member_subsystem_sbus_0_clock,
         auto_clock_name_prefixer_out_0_member_subsystem_sbus_0_reset
);

  assign auto_clock_name_prefixer_out_4_member_subsystem_cbus_0_clock = auto_clock_name_prefixer_in_4_member_subsystem_cbus_subsystem_cbus_0_clock;
  assign auto_clock_name_prefixer_out_4_member_subsystem_cbus_0_reset = auto_clock_name_prefixer_in_4_member_subsystem_cbus_subsystem_cbus_0_reset;
  assign auto_clock_name_prefixer_out_3_member_subsystem_mbus_1_clock = auto_clock_name_prefixer_in_3_member_subsystem_mbus_subsystem_mbus_1_clock;
  assign auto_clock_name_prefixer_out_3_member_subsystem_mbus_1_reset = auto_clock_name_prefixer_in_3_member_subsystem_mbus_subsystem_mbus_1_reset;
  assign auto_clock_name_prefixer_out_3_member_subsystem_mbus_0_clock = auto_clock_name_prefixer_in_3_member_subsystem_mbus_subsystem_mbus_0_clock;
  assign auto_clock_name_prefixer_out_3_member_subsystem_mbus_0_reset = auto_clock_name_prefixer_in_3_member_subsystem_mbus_subsystem_mbus_0_reset;
  assign auto_clock_name_prefixer_out_2_member_subsystem_fbus_0_clock = auto_clock_name_prefixer_in_2_member_subsystem_fbus_subsystem_fbus_0_clock;
  assign auto_clock_name_prefixer_out_2_member_subsystem_fbus_0_reset = auto_clock_name_prefixer_in_2_member_subsystem_fbus_subsystem_fbus_0_reset;
  assign auto_clock_name_prefixer_out_1_member_subsystem_pbus_0_clock = auto_clock_name_prefixer_in_1_member_subsystem_pbus_subsystem_pbus_0_clock;
  assign auto_clock_name_prefixer_out_1_member_subsystem_pbus_0_reset = auto_clock_name_prefixer_in_1_member_subsystem_pbus_subsystem_pbus_0_reset;
  assign auto_clock_name_prefixer_out_0_member_subsystem_sbus_1_clock = auto_clock_name_prefixer_in_0_member_subsystem_sbus_subsystem_sbus_1_clock;
  assign auto_clock_name_prefixer_out_0_member_subsystem_sbus_1_reset = auto_clock_name_prefixer_in_0_member_subsystem_sbus_subsystem_sbus_1_reset;
  assign auto_clock_name_prefixer_out_0_member_subsystem_sbus_0_clock = auto_clock_name_prefixer_in_0_member_subsystem_sbus_subsystem_sbus_0_clock;
  assign auto_clock_name_prefixer_out_0_member_subsystem_sbus_0_reset = auto_clock_name_prefixer_in_0_member_subsystem_sbus_subsystem_sbus_0_reset;
endmodule

