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

module TLError_1(
  input          clock,
                 reset,
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [2:0]   auto_in_a_bits_opcode,
  input  [127:0] auto_in_a_bits_address,
  input          auto_in_d_ready,
  output         auto_in_d_valid,
  output [2:0]   auto_in_d_bits_opcode,
  output [1:0]   auto_in_d_bits_size,
  output         auto_in_d_bits_denied,
                 auto_in_d_bits_corrupt
);

  wire       da_ready;
  reg  [2:0] casez_tmp;
  reg        idle;
  reg        counter;
  wire       nodeIn_a_ready = da_ready & idle;
  wire       winner_1 = auto_in_a_valid & idle;
  always @(*) begin
    casez (auto_in_a_bits_opcode)
      3'b000:
        casez_tmp = 3'h0;
      3'b001:
        casez_tmp = 3'h0;
      3'b010:
        casez_tmp = 3'h1;
      3'b011:
        casez_tmp = 3'h1;
      3'b100:
        casez_tmp = 3'h1;
      3'b101:
        casez_tmp = 3'h2;
      3'b110:
        casez_tmp = 3'h4;
      default:
        casez_tmp = 3'h4;
    endcase
  end // always @(*)
  reg        beatsLeft;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~(idle | ~counter)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Error.scala:31 assert (idle || da_first) // we only send Grant, never GrantData => simplified flow control below\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg        state_1;
  wire       _nodeIn_d_bits_WIRE_5 = beatsLeft ? state_1 : winner_1;
  assign da_ready = auto_in_d_ready & (~beatsLeft | state_1);
  wire       nodeIn_d_valid = (~beatsLeft | state_1) & winner_1;
  wire       _nodeIn_d_bits_WIRE_1 = _nodeIn_d_bits_WIRE_5 & casez_tmp[0];
  wire [1:0] _nodeIn_d_bits_WIRE_8 = {_nodeIn_d_bits_WIRE_5, 1'h0};
  wire [2:0] _nodeIn_d_bits_WIRE_10 = _nodeIn_d_bits_WIRE_5 ? casez_tmp : 3'h0;
  wire       done = da_ready & winner_1;
  always @(posedge clock) begin
    if (reset) begin
      idle <= 1'h1;
      counter <= 1'h0;
      beatsLeft <= 1'h0;
      state_1 <= 1'h0;
    end
    else begin
      idle <= ~(done & casez_tmp == 3'h4) & idle;
      counter <= (~done | counter - 1'h1) & counter;
      beatsLeft <= ~(~beatsLeft & auto_in_d_ready) & beatsLeft - (auto_in_d_ready & nodeIn_d_valid);
      if (beatsLeft) begin
      end
      else
        state_1 <= winner_1;
    end
  end // always @(posedge)
  TLMonitor_39 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (nodeIn_a_ready),
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_opcode  (auto_in_a_bits_opcode),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_d_ready        (auto_in_d_ready),
    .io_in_d_valid        (nodeIn_d_valid),
    .io_in_d_bits_opcode  (_nodeIn_d_bits_WIRE_10),
    .io_in_d_bits_size    (_nodeIn_d_bits_WIRE_8),
    .io_in_d_bits_denied  (_nodeIn_d_bits_WIRE_5),
    .io_in_d_bits_corrupt (_nodeIn_d_bits_WIRE_1)
  );
  assign auto_in_a_ready = nodeIn_a_ready;
  assign auto_in_d_valid = nodeIn_d_valid;
  assign auto_in_d_bits_opcode = _nodeIn_d_bits_WIRE_10;
  assign auto_in_d_bits_size = _nodeIn_d_bits_WIRE_8;
  assign auto_in_d_bits_denied = _nodeIn_d_bits_WIRE_5;
  assign auto_in_d_bits_corrupt = _nodeIn_d_bits_WIRE_1;
endmodule

