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

module ClockGroupCombiner(
  input  auto_clock_group_combiner_in_member_allClocks_uncore_clock,
         auto_clock_group_combiner_in_member_allClocks_uncore_reset,
  output auto_clock_group_combiner_out_member_allClocks_implicit_clock_clock,
         auto_clock_group_combiner_out_member_allClocks_implicit_clock_reset,
         auto_clock_group_combiner_out_member_allClocks_subsystem_cbus_0_clock,
         auto_clock_group_combiner_out_member_allClocks_subsystem_cbus_0_reset,
         auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_1_clock,
         auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_1_reset,
         auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_0_clock,
         auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_0_reset,
         auto_clock_group_combiner_out_member_allClocks_subsystem_fbus_0_clock,
         auto_clock_group_combiner_out_member_allClocks_subsystem_fbus_0_reset,
         auto_clock_group_combiner_out_member_allClocks_subsystem_pbus_0_clock,
         auto_clock_group_combiner_out_member_allClocks_subsystem_pbus_0_reset,
         auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_1_clock,
         auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_1_reset,
         auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_0_clock,
         auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_0_reset
);

  assign auto_clock_group_combiner_out_member_allClocks_implicit_clock_clock = auto_clock_group_combiner_in_member_allClocks_uncore_clock;
  assign auto_clock_group_combiner_out_member_allClocks_implicit_clock_reset = auto_clock_group_combiner_in_member_allClocks_uncore_reset;
  assign auto_clock_group_combiner_out_member_allClocks_subsystem_cbus_0_clock = auto_clock_group_combiner_in_member_allClocks_uncore_clock;
  assign auto_clock_group_combiner_out_member_allClocks_subsystem_cbus_0_reset = auto_clock_group_combiner_in_member_allClocks_uncore_reset;
  assign auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_1_clock = auto_clock_group_combiner_in_member_allClocks_uncore_clock;
  assign auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_1_reset = auto_clock_group_combiner_in_member_allClocks_uncore_reset;
  assign auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_0_clock = auto_clock_group_combiner_in_member_allClocks_uncore_clock;
  assign auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_0_reset = auto_clock_group_combiner_in_member_allClocks_uncore_reset;
  assign auto_clock_group_combiner_out_member_allClocks_subsystem_fbus_0_clock = auto_clock_group_combiner_in_member_allClocks_uncore_clock;
  assign auto_clock_group_combiner_out_member_allClocks_subsystem_fbus_0_reset = auto_clock_group_combiner_in_member_allClocks_uncore_reset;
  assign auto_clock_group_combiner_out_member_allClocks_subsystem_pbus_0_clock = auto_clock_group_combiner_in_member_allClocks_uncore_clock;
  assign auto_clock_group_combiner_out_member_allClocks_subsystem_pbus_0_reset = auto_clock_group_combiner_in_member_allClocks_uncore_reset;
  assign auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_1_clock = auto_clock_group_combiner_in_member_allClocks_uncore_clock;
  assign auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_1_reset = auto_clock_group_combiner_in_member_allClocks_uncore_reset;
  assign auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_0_clock = auto_clock_group_combiner_in_member_allClocks_uncore_clock;
  assign auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_0_reset = auto_clock_group_combiner_in_member_allClocks_uncore_reset;
endmodule

