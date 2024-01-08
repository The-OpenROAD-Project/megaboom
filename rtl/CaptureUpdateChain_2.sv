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

module CaptureUpdateChain_2(
  input        clock,
               reset,
               io_chainIn_shift,
               io_chainIn_data,
               io_chainIn_capture,
               io_chainIn_update,
  output       io_chainOut_data,
  output [4:0] io_update_bits
);

  reg regs_0;
  reg regs_1;
  reg regs_2;
  reg regs_3;
  reg regs_4;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~(~(io_chainIn_capture & io_chainIn_update) & ~(io_chainIn_capture & io_chainIn_shift) & ~(io_chainIn_update & io_chainIn_shift))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at JtagShifter.scala:183 assert(!(io.chainIn.capture && io.chainIn.update)\n");
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
    end
    else if (io_chainIn_update | ~io_chainIn_shift) begin
    end
    else begin
      regs_0 <= regs_1;
      regs_1 <= regs_2;
      regs_2 <= regs_3;
      regs_3 <= regs_4;
      regs_4 <= io_chainIn_data;
    end
  end // always @(posedge)
  assign io_chainOut_data = regs_0;
  assign io_update_bits = {regs_4, regs_3, regs_2, regs_1, regs_0};
endmodule

