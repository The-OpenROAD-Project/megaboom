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

module JtagStateMachine(
  input        clock,
               reset,
               io_tms,
  output [3:0] io_currState
);

  reg [3:0] currState;
  reg [3:0] casez_tmp;
  always @(*) begin
    casez (currState)
      4'b0000:
        casez_tmp = io_tms ? 4'h5 : 4'h2;
      4'b0001:
        casez_tmp = io_tms ? 4'h5 : 4'h3;
      4'b0010:
        casez_tmp = io_tms ? 4'h1 : 4'h2;
      4'b0011:
        casez_tmp = io_tms ? 4'h0 : 4'h3;
      4'b0100:
        casez_tmp = {3'h7, io_tms};
      4'b0101:
        casez_tmp = io_tms ? 4'h7 : 4'hC;
      4'b0110:
        casez_tmp = io_tms ? 4'h1 : 4'h2;
      4'b0111:
        casez_tmp = {2'h1, ~io_tms, 1'h0};
      4'b1000:
        casez_tmp = io_tms ? 4'hD : 4'hA;
      4'b1001:
        casez_tmp = io_tms ? 4'hD : 4'hB;
      4'b1010:
        casez_tmp = io_tms ? 4'h9 : 4'hA;
      4'b1011:
        casez_tmp = io_tms ? 4'h8 : 4'hB;
      4'b1100:
        casez_tmp = io_tms ? 4'h7 : 4'hC;
      4'b1101:
        casez_tmp = io_tms ? 4'h7 : 4'hC;
      4'b1110:
        casez_tmp = io_tms ? 4'h9 : 4'hA;
      default:
        casez_tmp = io_tms ? 4'hF : 4'hC;
    endcase
  end // always @(*)
  always @(posedge clock or posedge reset) begin
    if (reset)
      currState <= 4'hF;
    else
      currState <= casez_tmp;
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      if (reset)
        currState = 4'hF;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  assign io_currState = currState;
endmodule

