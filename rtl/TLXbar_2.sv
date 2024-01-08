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

module TLXbar_2(
  input         clock,
                reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
                auto_in_a_bits_size,
  input  [6:0]  auto_in_a_bits_source,
  input  [28:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
                auto_in_d_bits_size,
  output [6:0]  auto_in_d_bits_source,
  output [63:0] auto_in_d_bits_data,
  input         auto_out_1_a_ready,
  output        auto_out_1_a_valid,
  output [2:0]  auto_out_1_a_bits_opcode,
                auto_out_1_a_bits_param,
                auto_out_1_a_bits_size,
  output [6:0]  auto_out_1_a_bits_source,
  output [28:0] auto_out_1_a_bits_address,
  output [7:0]  auto_out_1_a_bits_mask,
  output [63:0] auto_out_1_a_bits_data,
  output        auto_out_1_a_bits_corrupt,
                auto_out_1_d_ready,
  input         auto_out_1_d_valid,
  input  [2:0]  auto_out_1_d_bits_opcode,
                auto_out_1_d_bits_size,
  input  [6:0]  auto_out_1_d_bits_source,
  input  [63:0] auto_out_1_d_bits_data,
  input         auto_out_0_a_ready,
  output        auto_out_0_a_valid,
  output [2:0]  auto_out_0_a_bits_opcode,
                auto_out_0_a_bits_param,
                auto_out_0_a_bits_size,
  output [6:0]  auto_out_0_a_bits_source,
  output [12:0] auto_out_0_a_bits_address,
  output [7:0]  auto_out_0_a_bits_mask,
  output [63:0] auto_out_0_a_bits_data,
  output        auto_out_0_a_bits_corrupt,
                auto_out_0_d_ready,
  input         auto_out_0_d_valid,
  input  [2:0]  auto_out_0_d_bits_opcode,
                auto_out_0_d_bits_size,
  input  [6:0]  auto_out_0_d_bits_source,
  input  [63:0] auto_out_0_d_bits_data
);

  wire        _portsAOI_in_0_a_ready_WIRE = ~(auto_in_a_bits_address[28]) & auto_out_0_a_ready | auto_in_a_bits_address[28] & auto_out_1_a_ready;
  reg  [2:0]  beatsLeft;
  wire        idle = beatsLeft == 3'h0;
  wire [1:0]  readys_valid = {auto_out_1_d_valid, auto_out_0_d_valid};
  reg  [1:0]  readys_mask;
  wire [1:0]  _readys_filter_T_1 = readys_valid & ~readys_mask;
  wire [1:0]  readys_readys = ~({readys_mask[1], _readys_filter_T_1[1] | readys_mask[0]} & ({_readys_filter_T_1[0], auto_out_1_d_valid} | _readys_filter_T_1));
  wire        winner_0 = readys_readys[0] & auto_out_0_d_valid;
  wire        winner_1 = readys_readys[1] & auto_out_1_d_valid;
  wire        _in_0_d_valid_T = auto_out_0_d_valid | auto_out_1_d_valid;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~(~winner_0 | ~winner_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~_in_0_d_valid_T | winner_0 | winner_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg         state_0;
  reg         state_1;
  wire        muxState_0 = idle ? winner_0 : state_0;
  wire        muxState_1 = idle ? winner_1 : state_1;
  wire        in_0_d_valid = idle ? _in_0_d_valid_T : state_0 & auto_out_0_d_valid | state_1 & auto_out_1_d_valid;
  wire [6:0]  _in_0_d_bits_WIRE_7 = (muxState_0 ? auto_out_0_d_bits_source : 7'h0) | (muxState_1 ? auto_out_1_d_bits_source : 7'h0);
  wire [2:0]  _in_0_d_bits_WIRE_8 = (muxState_0 ? auto_out_0_d_bits_size : 3'h0) | (muxState_1 ? auto_out_1_d_bits_size : 3'h0);
  wire [2:0]  _in_0_d_bits_WIRE_10 = (muxState_0 ? auto_out_0_d_bits_opcode : 3'h0) | (muxState_1 ? auto_out_1_d_bits_opcode : 3'h0);
  wire [12:0] _beatsDO_decode_T_5 = 13'h3F << auto_out_1_d_bits_size;
  wire [12:0] _beatsDO_decode_T_1 = 13'h3F << auto_out_0_d_bits_size;
  wire [1:0]  _readys_mask_T = readys_readys & readys_valid;
  wire        latch = idle & auto_in_d_ready;
  always @(posedge clock) begin
    if (reset) begin
      beatsLeft <= 3'h0;
      readys_mask <= 2'h3;
      state_0 <= 1'h0;
      state_1 <= 1'h0;
    end
    else begin
      if (latch)
        beatsLeft <= (winner_0 & auto_out_0_d_bits_opcode[0] ? ~(_beatsDO_decode_T_1[5:3]) : 3'h0) | (winner_1 & auto_out_1_d_bits_opcode[0] ? ~(_beatsDO_decode_T_5[5:3]) : 3'h0);
      else
        beatsLeft <= beatsLeft - {2'h0, auto_in_d_ready & in_0_d_valid};
      if (latch & (|readys_valid))
        readys_mask <= _readys_mask_T | {_readys_mask_T[0], 1'h0};
      if (idle) begin
        state_0 <= winner_0;
        state_1 <= winner_1;
      end
    end
  end // always @(posedge)
  TLMonitor_5 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (_portsAOI_in_0_a_ready_WIRE),
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_opcode  (auto_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_in_a_bits_param),
    .io_in_a_bits_size    (auto_in_a_bits_size),
    .io_in_a_bits_source  (auto_in_a_bits_source),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_a_bits_mask    (auto_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_in_a_bits_corrupt),
    .io_in_d_ready        (auto_in_d_ready),
    .io_in_d_valid        (in_0_d_valid),
    .io_in_d_bits_opcode  (_in_0_d_bits_WIRE_10),
    .io_in_d_bits_size    (_in_0_d_bits_WIRE_8),
    .io_in_d_bits_source  (_in_0_d_bits_WIRE_7)
  );
  assign auto_in_a_ready = _portsAOI_in_0_a_ready_WIRE;
  assign auto_in_d_valid = in_0_d_valid;
  assign auto_in_d_bits_opcode = _in_0_d_bits_WIRE_10;
  assign auto_in_d_bits_size = _in_0_d_bits_WIRE_8;
  assign auto_in_d_bits_source = _in_0_d_bits_WIRE_7;
  assign auto_in_d_bits_data = (muxState_0 ? auto_out_0_d_bits_data : 64'h0) | (muxState_1 ? auto_out_1_d_bits_data : 64'h0);
  assign auto_out_1_a_valid = auto_in_a_valid & auto_in_a_bits_address[28];
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_1_a_bits_param = auto_in_a_bits_param;
  assign auto_out_1_a_bits_size = auto_in_a_bits_size;
  assign auto_out_1_a_bits_source = auto_in_a_bits_source;
  assign auto_out_1_a_bits_address = auto_in_a_bits_address;
  assign auto_out_1_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_1_a_bits_data = auto_in_a_bits_data;
  assign auto_out_1_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_1_d_ready = auto_in_d_ready & (idle ? readys_readys[1] : state_1);
  assign auto_out_0_a_valid = auto_in_a_valid & ~(auto_in_a_bits_address[28]);
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_0_a_bits_param = auto_in_a_bits_param;
  assign auto_out_0_a_bits_size = auto_in_a_bits_size;
  assign auto_out_0_a_bits_source = auto_in_a_bits_source;
  assign auto_out_0_a_bits_address = auto_in_a_bits_address[12:0];
  assign auto_out_0_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_0_a_bits_data = auto_in_a_bits_data;
  assign auto_out_0_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_0_d_ready = auto_in_d_ready & (idle ? readys_readys[0] : state_0);
endmodule

