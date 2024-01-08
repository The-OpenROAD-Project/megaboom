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

module MaxPeriodFibonacciLFSR_3(
  input  clock,
         reset,
  output io_out_0,
         io_out_1,
         io_out_2,
         io_out_3,
         io_out_4,
         io_out_5
);

  reg state_0;
  reg state_1;
  reg state_2;
  reg state_3;
  reg state_4;
  reg state_5;
  always @(posedge clock) begin
    if (reset) begin
      state_0 <= 1'h1;
      state_1 <= 1'h0;
      state_2 <= 1'h0;
      state_3 <= 1'h0;
      state_4 <= 1'h0;
      state_5 <= 1'h0;
    end
    else begin
      state_0 <= state_5 ^ state_4;
      state_1 <= state_0;
      state_2 <= state_1;
      state_3 <= state_2;
      state_4 <= state_3;
      state_5 <= state_4;
    end
  end // always @(posedge)
  assign io_out_0 = state_0;
  assign io_out_1 = state_1;
  assign io_out_2 = state_2;
  assign io_out_3 = state_3;
  assign io_out_4 = state_4;
  assign io_out_5 = state_5;
endmodule

