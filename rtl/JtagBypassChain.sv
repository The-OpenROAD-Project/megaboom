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

module JtagBypassChain(
  input  clock,
         reset,
         io_chainIn_shift,
         io_chainIn_data,
         io_chainIn_capture,
         io_chainIn_update,
  output io_chainOut_data
);

  reg reg_0;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~(~(io_chainIn_capture & io_chainIn_update) & ~(io_chainIn_capture & io_chainIn_shift) & ~(io_chainIn_update & io_chainIn_shift))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at JtagShifter.scala:72 assert(!(io.chainIn.capture && io.chainIn.update)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  always @(posedge clock) begin
    if (io_chainIn_capture)
      reg_0 <= 1'h0;
    else if (io_chainIn_shift)
      reg_0 <= io_chainIn_data;
  end // always @(posedge)
  assign io_chainOut_data = reg_0;
endmodule

