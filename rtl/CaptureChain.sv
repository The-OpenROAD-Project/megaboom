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

module CaptureChain(
  input  clock,
         reset,
         io_chainIn_shift,
         io_chainIn_data,
         io_chainIn_capture,
         io_chainIn_update,
  output io_chainOut_data
);

  reg regs_0;
  reg regs_1;
  reg regs_2;
  reg regs_3;
  reg regs_4;
  reg regs_5;
  reg regs_6;
  reg regs_7;
  reg regs_8;
  reg regs_9;
  reg regs_10;
  reg regs_11;
  reg regs_12;
  reg regs_13;
  reg regs_14;
  reg regs_15;
  reg regs_16;
  reg regs_17;
  reg regs_18;
  reg regs_19;
  reg regs_20;
  reg regs_21;
  reg regs_22;
  reg regs_23;
  reg regs_24;
  reg regs_25;
  reg regs_26;
  reg regs_27;
  reg regs_28;
  reg regs_29;
  reg regs_30;
  reg regs_31;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~(~(io_chainIn_capture & io_chainIn_update) & ~(io_chainIn_capture & io_chainIn_shift) & ~(io_chainIn_update & io_chainIn_shift))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at JtagShifter.scala:117 assert(!(io.chainIn.capture && io.chainIn.update)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  always @(posedge clock) begin
    if (io_chainIn_capture) begin
      regs_0 <= 1'h1;
      regs_1 <= 1'h0;
      regs_2 <= 1'h0;
      regs_3 <= 1'h0;
      regs_4 <= 1'h0;
      regs_5 <= 1'h0;
      regs_6 <= 1'h0;
      regs_7 <= 1'h0;
      regs_8 <= 1'h0;
      regs_9 <= 1'h0;
      regs_10 <= 1'h0;
      regs_11 <= 1'h0;
      regs_12 <= 1'h0;
      regs_13 <= 1'h0;
      regs_14 <= 1'h0;
      regs_15 <= 1'h0;
      regs_16 <= 1'h0;
      regs_17 <= 1'h0;
      regs_18 <= 1'h0;
      regs_19 <= 1'h0;
      regs_20 <= 1'h0;
      regs_21 <= 1'h0;
      regs_22 <= 1'h0;
      regs_23 <= 1'h0;
      regs_24 <= 1'h0;
      regs_25 <= 1'h0;
      regs_26 <= 1'h0;
      regs_27 <= 1'h0;
      regs_28 <= 1'h0;
      regs_29 <= 1'h0;
      regs_30 <= 1'h0;
      regs_31 <= 1'h0;
    end
    else if (io_chainIn_shift) begin
      regs_0 <= regs_1;
      regs_1 <= regs_2;
      regs_2 <= regs_3;
      regs_3 <= regs_4;
      regs_4 <= regs_5;
      regs_5 <= regs_6;
      regs_6 <= regs_7;
      regs_7 <= regs_8;
      regs_8 <= regs_9;
      regs_9 <= regs_10;
      regs_10 <= regs_11;
      regs_11 <= regs_12;
      regs_12 <= regs_13;
      regs_13 <= regs_14;
      regs_14 <= regs_15;
      regs_15 <= regs_16;
      regs_16 <= regs_17;
      regs_17 <= regs_18;
      regs_18 <= regs_19;
      regs_19 <= regs_20;
      regs_20 <= regs_21;
      regs_21 <= regs_22;
      regs_22 <= regs_23;
      regs_23 <= regs_24;
      regs_24 <= regs_25;
      regs_25 <= regs_26;
      regs_26 <= regs_27;
      regs_27 <= regs_28;
      regs_28 <= regs_29;
      regs_29 <= regs_30;
      regs_30 <= regs_31;
      regs_31 <= io_chainIn_data;
    end
  end // always @(posedge)
  assign io_chainOut_data = regs_0;
endmodule

