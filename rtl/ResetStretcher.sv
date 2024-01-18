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

module ResetStretcher(
  input  auto_reset_stretcher_in_clock,
         auto_reset_stretcher_in_reset,
  output auto_reset_stretcher_out_clock,
         auto_reset_stretcher_out_reset
);

  reg [1:0] reset_stretcherOut_reset_count;
  reg       reset_stretcherOut_reset_resetout;
  always @(posedge auto_reset_stretcher_in_clock) begin
    if (auto_reset_stretcher_in_reset) begin
      reset_stretcherOut_reset_count <= 2'h0;
      reset_stretcherOut_reset_resetout <= 1'h1;
    end
    else if (reset_stretcherOut_reset_resetout) begin
      reset_stretcherOut_reset_count <= reset_stretcherOut_reset_count + 2'h1;
      reset_stretcherOut_reset_resetout <= reset_stretcherOut_reset_count != 2'h3;
    end
  end // always @(posedge)
  assign auto_reset_stretcher_out_clock = auto_reset_stretcher_in_clock;
  assign auto_reset_stretcher_out_reset = reset_stretcherOut_reset_resetout;
endmodule

