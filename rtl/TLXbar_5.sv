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

module TLXbar_5(
  input         clock,
                reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
  input  [3:0]  auto_in_a_bits_size,
  input  [6:0]  auto_in_a_bits_source,
  input  [28:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [3:0]  auto_in_d_bits_size,
  output [6:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_sink,
                auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_7_a_ready,
  output        auto_out_7_a_valid,
  output [2:0]  auto_out_7_a_bits_opcode,
                auto_out_7_a_bits_param,
                auto_out_7_a_bits_size,
  output [6:0]  auto_out_7_a_bits_source,
  output [20:0] auto_out_7_a_bits_address,
  output [7:0]  auto_out_7_a_bits_mask,
  output [63:0] auto_out_7_a_bits_data,
  output        auto_out_7_a_bits_corrupt,
                auto_out_7_d_ready,
  input         auto_out_7_d_valid,
  input  [2:0]  auto_out_7_d_bits_opcode,
  input  [1:0]  auto_out_7_d_bits_param,
  input  [2:0]  auto_out_7_d_bits_size,
  input  [6:0]  auto_out_7_d_bits_source,
  input         auto_out_7_d_bits_sink,
                auto_out_7_d_bits_denied,
  input  [63:0] auto_out_7_d_bits_data,
  input         auto_out_7_d_bits_corrupt,
                auto_out_6_a_ready,
  output        auto_out_6_a_valid,
  output [2:0]  auto_out_6_a_bits_opcode,
                auto_out_6_a_bits_param,
                auto_out_6_a_bits_size,
  output [6:0]  auto_out_6_a_bits_source,
  output [16:0] auto_out_6_a_bits_address,
  output [7:0]  auto_out_6_a_bits_mask,
  output        auto_out_6_a_bits_corrupt,
                auto_out_6_d_ready,
  input         auto_out_6_d_valid,
  input  [2:0]  auto_out_6_d_bits_size,
  input  [6:0]  auto_out_6_d_bits_source,
  input  [63:0] auto_out_6_d_bits_data,
  input         auto_out_5_a_ready,
  output        auto_out_5_a_valid,
  output [2:0]  auto_out_5_a_bits_opcode,
                auto_out_5_a_bits_param,
                auto_out_5_a_bits_size,
  output [6:0]  auto_out_5_a_bits_source,
  output [11:0] auto_out_5_a_bits_address,
  output [7:0]  auto_out_5_a_bits_mask,
  output [63:0] auto_out_5_a_bits_data,
  output        auto_out_5_a_bits_corrupt,
                auto_out_5_d_ready,
  input         auto_out_5_d_valid,
  input  [2:0]  auto_out_5_d_bits_opcode,
                auto_out_5_d_bits_size,
  input  [6:0]  auto_out_5_d_bits_source,
  input  [63:0] auto_out_5_d_bits_data,
  input         auto_out_4_a_ready,
  output        auto_out_4_a_valid,
  output [2:0]  auto_out_4_a_bits_opcode,
                auto_out_4_a_bits_param,
                auto_out_4_a_bits_size,
  output [6:0]  auto_out_4_a_bits_source,
  output [25:0] auto_out_4_a_bits_address,
  output [7:0]  auto_out_4_a_bits_mask,
  output [63:0] auto_out_4_a_bits_data,
  output        auto_out_4_a_bits_corrupt,
                auto_out_4_d_ready,
  input         auto_out_4_d_valid,
  input  [2:0]  auto_out_4_d_bits_opcode,
                auto_out_4_d_bits_size,
  input  [6:0]  auto_out_4_d_bits_source,
  input  [63:0] auto_out_4_d_bits_data,
  input         auto_out_3_a_ready,
  output        auto_out_3_a_valid,
  output [2:0]  auto_out_3_a_bits_opcode,
                auto_out_3_a_bits_param,
                auto_out_3_a_bits_size,
  output [6:0]  auto_out_3_a_bits_source,
  output [27:0] auto_out_3_a_bits_address,
  output [7:0]  auto_out_3_a_bits_mask,
  output [63:0] auto_out_3_a_bits_data,
  output        auto_out_3_a_bits_corrupt,
                auto_out_3_d_ready,
  input         auto_out_3_d_valid,
  input  [2:0]  auto_out_3_d_bits_opcode,
                auto_out_3_d_bits_size,
  input  [6:0]  auto_out_3_d_bits_source,
  input  [63:0] auto_out_3_d_bits_data,
  input         auto_out_2_a_ready,
  output        auto_out_2_a_valid,
  output [2:0]  auto_out_2_a_bits_opcode,
                auto_out_2_a_bits_param,
                auto_out_2_a_bits_size,
  output [6:0]  auto_out_2_a_bits_source,
  output [28:0] auto_out_2_a_bits_address,
  output [7:0]  auto_out_2_a_bits_mask,
  output [63:0] auto_out_2_a_bits_data,
  output        auto_out_2_a_bits_corrupt,
                auto_out_2_d_ready,
  input         auto_out_2_d_valid,
  input  [2:0]  auto_out_2_d_bits_opcode,
  input  [1:0]  auto_out_2_d_bits_param,
  input  [2:0]  auto_out_2_d_bits_size,
  input  [6:0]  auto_out_2_d_bits_source,
  input         auto_out_2_d_bits_sink,
                auto_out_2_d_bits_denied,
  input  [63:0] auto_out_2_d_bits_data,
  input         auto_out_2_d_bits_corrupt,
                auto_out_1_a_ready,
  output        auto_out_1_a_valid,
  output [2:0]  auto_out_1_a_bits_opcode,
                auto_out_1_a_bits_param,
                auto_out_1_a_bits_size,
  output [6:0]  auto_out_1_a_bits_source,
  output [25:0] auto_out_1_a_bits_address,
  output [7:0]  auto_out_1_a_bits_mask,
  output [63:0] auto_out_1_a_bits_data,
  output        auto_out_1_a_bits_corrupt,
                auto_out_1_d_ready,
  input         auto_out_1_d_valid,
  input  [2:0]  auto_out_1_d_bits_opcode,
  input  [1:0]  auto_out_1_d_bits_param,
  input  [2:0]  auto_out_1_d_bits_size,
  input  [6:0]  auto_out_1_d_bits_source,
  input         auto_out_1_d_bits_sink,
                auto_out_1_d_bits_denied,
  input  [63:0] auto_out_1_d_bits_data,
  input         auto_out_1_d_bits_corrupt,
                auto_out_0_a_ready,
  output        auto_out_0_a_valid,
  output [2:0]  auto_out_0_a_bits_opcode,
                auto_out_0_a_bits_param,
  output [3:0]  auto_out_0_a_bits_size,
  output [6:0]  auto_out_0_a_bits_source,
  output [13:0] auto_out_0_a_bits_address,
  output [7:0]  auto_out_0_a_bits_mask,
  output [63:0] auto_out_0_a_bits_data,
  output        auto_out_0_a_bits_corrupt,
                auto_out_0_d_ready,
  input         auto_out_0_d_valid,
  input  [2:0]  auto_out_0_d_bits_opcode,
  input  [1:0]  auto_out_0_d_bits_param,
  input  [3:0]  auto_out_0_d_bits_size,
  input  [6:0]  auto_out_0_d_bits_source,
  input         auto_out_0_d_bits_sink,
                auto_out_0_d_bits_denied,
  input  [63:0] auto_out_0_d_bits_data,
  input         auto_out_0_d_bits_corrupt
);

  wire        requestAIO_0_0 = {auto_in_a_bits_address[27], auto_in_a_bits_address[25], auto_in_a_bits_address[20], auto_in_a_bits_address[17:16], ~(auto_in_a_bits_address[13:12])} == 7'h0;
  wire [9:0]  _GEN = auto_in_a_bits_address[25:16] ^ 10'h201;
  wire        requestAIO_0_1 = {auto_in_a_bits_address[27], _GEN[9], auto_in_a_bits_address[20], _GEN[1:0], auto_in_a_bits_address[13:12]} == 7'h0;
  wire        requestAIO_0_2 = {auto_in_a_bits_address[27], auto_in_a_bits_address[25], auto_in_a_bits_address[20], auto_in_a_bits_address[17:16], auto_in_a_bits_address[13], ~(auto_in_a_bits_address[12])} == 7'h0 | {auto_in_a_bits_address[27], auto_in_a_bits_address[25], auto_in_a_bits_address[20], auto_in_a_bits_address[17:16] ^ 2'h2, auto_in_a_bits_address[13:12]} == 7'h0;
  wire        requestAIO_0_4 = {auto_in_a_bits_address[27], ~(auto_in_a_bits_address[25]), auto_in_a_bits_address[20], auto_in_a_bits_address[17:16]} == 5'h0;
  wire        requestAIO_0_5 = {auto_in_a_bits_address[27], auto_in_a_bits_address[25], auto_in_a_bits_address[20], auto_in_a_bits_address[17:16], auto_in_a_bits_address[13:12]} == 7'h0;
  wire        requestAIO_0_6 = {auto_in_a_bits_address[27], auto_in_a_bits_address[25], auto_in_a_bits_address[20], auto_in_a_bits_address[17], ~(auto_in_a_bits_address[16])} == 5'h0;
  wire        requestAIO_0_7 = {auto_in_a_bits_address[27], auto_in_a_bits_address[25], ~(auto_in_a_bits_address[20]), auto_in_a_bits_address[13:12]} == 5'h0;
  wire        _portsAOI_in_0_a_ready_WIRE = requestAIO_0_0 & auto_out_0_a_ready | requestAIO_0_1 & auto_out_1_a_ready | requestAIO_0_2 & auto_out_2_a_ready | auto_in_a_bits_address[27] & auto_out_3_a_ready | requestAIO_0_4 & auto_out_4_a_ready | requestAIO_0_5 & auto_out_5_a_ready | requestAIO_0_6 & auto_out_6_a_ready | requestAIO_0_7 & auto_out_7_a_ready;
  reg  [8:0]  beatsLeft;
  wire        idle = beatsLeft == 9'h0;
  wire [7:0]  readys_valid = {auto_out_7_d_valid, auto_out_6_d_valid, auto_out_5_d_valid, auto_out_4_d_valid, auto_out_3_d_valid, auto_out_2_d_valid, auto_out_1_d_valid, auto_out_0_d_valid};
  reg  [7:0]  readys_mask;
  wire [7:0]  _readys_filter_T_1 = readys_valid & ~readys_mask;
  wire [13:0] _GEN_0 = {_readys_filter_T_1[6:0], auto_out_7_d_valid, auto_out_6_d_valid, auto_out_5_d_valid, auto_out_4_d_valid, auto_out_3_d_valid, auto_out_2_d_valid, auto_out_1_d_valid} | {_readys_filter_T_1, auto_out_7_d_valid, auto_out_6_d_valid, auto_out_5_d_valid, auto_out_4_d_valid, auto_out_3_d_valid, auto_out_2_d_valid};
  wire [12:0] _GEN_1 = _GEN_0[12:0] | {_readys_filter_T_1[7], _GEN_0[13:2]};
  wire [10:0] _GEN_2 = _GEN_1[10:0] | {_readys_filter_T_1[7], _GEN_0[13], _GEN_1[12:4]};
  wire [7:0]  readys_readys = ~({readys_mask[7], _readys_filter_T_1[7] | readys_mask[6], _GEN_0[13] | readys_mask[5], _GEN_1[12:11] | readys_mask[4:3], _GEN_2[10:8] | readys_mask[2:0]} & _GEN_2[7:0]);
  wire        winner_0 = readys_readys[0] & auto_out_0_d_valid;
  wire        winner_1 = readys_readys[1] & auto_out_1_d_valid;
  wire        winner_2 = readys_readys[2] & auto_out_2_d_valid;
  wire        winner_3 = readys_readys[3] & auto_out_3_d_valid;
  wire        winner_4 = readys_readys[4] & auto_out_4_d_valid;
  wire        winner_5 = readys_readys[5] & auto_out_5_d_valid;
  wire        winner_6 = readys_readys[6] & auto_out_6_d_valid;
  wire        winner_7 = readys_readys[7] & auto_out_7_d_valid;
  wire        _in_0_d_valid_T = auto_out_0_d_valid | auto_out_1_d_valid;
  `ifndef SYNTHESIS
    wire prefixOR_2 = winner_0 | winner_1;
    wire prefixOR_3 = prefixOR_2 | winner_2;
    wire prefixOR_4 = prefixOR_3 | winner_3;
    wire prefixOR_5 = prefixOR_4 | winner_4;
    wire prefixOR_6 = prefixOR_5 | winner_5;
    always @(posedge clock) begin
      if (~reset & ~((~winner_0 | ~winner_1) & (~prefixOR_2 | ~winner_2) & (~prefixOR_3 | ~winner_3) & (~prefixOR_4 | ~winner_4) & (~prefixOR_5 | ~winner_5) & (~prefixOR_6 | ~winner_6) & (~(prefixOR_6 | winner_6) | ~winner_7))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~(_in_0_d_valid_T | auto_out_2_d_valid | auto_out_3_d_valid | auto_out_4_d_valid | auto_out_5_d_valid | auto_out_6_d_valid | auto_out_7_d_valid) | winner_0 | winner_1 | winner_2 | winner_3 | winner_4 | winner_5 | winner_6 | winner_7)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg         state_0;
  reg         state_1;
  reg         state_2;
  reg         state_3;
  reg         state_4;
  reg         state_5;
  reg         state_6;
  reg         state_7;
  wire        muxState_0 = idle ? winner_0 : state_0;
  wire        muxState_1 = idle ? winner_1 : state_1;
  wire        muxState_2 = idle ? winner_2 : state_2;
  wire        muxState_3 = idle ? winner_3 : state_3;
  wire        muxState_4 = idle ? winner_4 : state_4;
  wire        muxState_5 = idle ? winner_5 : state_5;
  wire        muxState_6 = idle ? winner_6 : state_6;
  wire        muxState_7 = idle ? winner_7 : state_7;
  wire        in_0_d_valid = idle ? _in_0_d_valid_T | auto_out_2_d_valid | auto_out_3_d_valid | auto_out_4_d_valid | auto_out_5_d_valid | auto_out_6_d_valid | auto_out_7_d_valid : state_0 & auto_out_0_d_valid | state_1 & auto_out_1_d_valid | state_2 & auto_out_2_d_valid | state_3 & auto_out_3_d_valid | state_4 & auto_out_4_d_valid | state_5 & auto_out_5_d_valid | state_6 & auto_out_6_d_valid | state_7 & auto_out_7_d_valid;
  wire        _in_0_d_bits_WIRE_1 = muxState_0 & auto_out_0_d_bits_corrupt | muxState_1 & auto_out_1_d_bits_corrupt | muxState_2 & auto_out_2_d_bits_corrupt | muxState_7 & auto_out_7_d_bits_corrupt;
  wire        _in_0_d_bits_WIRE_5 = muxState_0 & auto_out_0_d_bits_denied | muxState_1 & auto_out_1_d_bits_denied | muxState_2 & auto_out_2_d_bits_denied | muxState_7 & auto_out_7_d_bits_denied;
  wire        _in_0_d_bits_WIRE_6 = muxState_0 & auto_out_0_d_bits_sink | muxState_1 & auto_out_1_d_bits_sink | muxState_2 & auto_out_2_d_bits_sink | muxState_7 & auto_out_7_d_bits_sink;
  wire [6:0]  _in_0_d_bits_WIRE_7 = (muxState_0 ? auto_out_0_d_bits_source : 7'h0) | (muxState_1 ? auto_out_1_d_bits_source : 7'h0) | (muxState_2 ? auto_out_2_d_bits_source : 7'h0) | (muxState_3 ? auto_out_3_d_bits_source : 7'h0) | (muxState_4 ? auto_out_4_d_bits_source : 7'h0) | (muxState_5 ? auto_out_5_d_bits_source : 7'h0) | (muxState_6 ? auto_out_6_d_bits_source : 7'h0) | (muxState_7 ? auto_out_7_d_bits_source : 7'h0);
  wire [3:0]  _in_0_d_bits_WIRE_8 = (muxState_0 ? auto_out_0_d_bits_size : 4'h0) | (muxState_1 ? {1'h0, auto_out_1_d_bits_size} : 4'h0) | (muxState_2 ? {1'h0, auto_out_2_d_bits_size} : 4'h0) | (muxState_3 ? {1'h0, auto_out_3_d_bits_size} : 4'h0) | (muxState_4 ? {1'h0, auto_out_4_d_bits_size} : 4'h0) | (muxState_5 ? {1'h0, auto_out_5_d_bits_size} : 4'h0) | (muxState_6 ? {1'h0, auto_out_6_d_bits_size} : 4'h0) | (muxState_7 ? {1'h0, auto_out_7_d_bits_size} : 4'h0);
  wire [1:0]  _in_0_d_bits_WIRE_9 = (muxState_0 ? auto_out_0_d_bits_param : 2'h0) | (muxState_1 ? auto_out_1_d_bits_param : 2'h0) | (muxState_2 ? auto_out_2_d_bits_param : 2'h0) | (muxState_7 ? auto_out_7_d_bits_param : 2'h0);
  wire [2:0]  _in_0_d_bits_WIRE_10 = (muxState_0 ? auto_out_0_d_bits_opcode : 3'h0) | (muxState_1 ? auto_out_1_d_bits_opcode : 3'h0) | (muxState_2 ? auto_out_2_d_bits_opcode : 3'h0) | (muxState_3 ? auto_out_3_d_bits_opcode : 3'h0) | (muxState_4 ? auto_out_4_d_bits_opcode : 3'h0) | (muxState_5 ? auto_out_5_d_bits_opcode : 3'h0) | {2'h0, muxState_6} | (muxState_7 ? auto_out_7_d_bits_opcode : 3'h0);
  wire [26:0] _beatsDO_decode_T_1 = 27'hFFF << auto_out_0_d_bits_size;
  wire [8:0]  maskedBeats_0 = winner_0 & auto_out_0_d_bits_opcode[0] ? ~(_beatsDO_decode_T_1[11:3]) : 9'h0;
  wire [20:0] _beatsDO_decode_T_29 = 21'h3F << auto_out_7_d_bits_size;
  wire [20:0] _beatsDO_decode_T_25 = 21'h3F << auto_out_6_d_bits_size;
  wire [20:0] _beatsDO_decode_T_21 = 21'h3F << auto_out_5_d_bits_size;
  wire [20:0] _beatsDO_decode_T_17 = 21'h3F << auto_out_4_d_bits_size;
  wire [20:0] _beatsDO_decode_T_13 = 21'h3F << auto_out_3_d_bits_size;
  wire [20:0] _beatsDO_decode_T_9 = 21'h3F << auto_out_2_d_bits_size;
  wire [20:0] _beatsDO_decode_T_5 = 21'h3F << auto_out_1_d_bits_size;
  wire [7:0]  _readys_mask_T = readys_readys & readys_valid;
  wire [7:0]  _readys_mask_T_3 = _readys_mask_T | {_readys_mask_T[6:0], 1'h0};
  wire [7:0]  _readys_mask_T_6 = _readys_mask_T_3 | {_readys_mask_T_3[5:0], 2'h0};
  wire        latch = idle & auto_in_d_ready;
  always @(posedge clock) begin
    if (reset) begin
      beatsLeft <= 9'h0;
      readys_mask <= 8'hFF;
      state_0 <= 1'h0;
      state_1 <= 1'h0;
      state_2 <= 1'h0;
      state_3 <= 1'h0;
      state_4 <= 1'h0;
      state_5 <= 1'h0;
      state_6 <= 1'h0;
      state_7 <= 1'h0;
    end
    else begin
      if (latch)
        beatsLeft <= {maskedBeats_0[8:3], maskedBeats_0[2:0] | (winner_1 & auto_out_1_d_bits_opcode[0] ? ~(_beatsDO_decode_T_5[5:3]) : 3'h0) | (winner_2 & auto_out_2_d_bits_opcode[0] ? ~(_beatsDO_decode_T_9[5:3]) : 3'h0) | (winner_3 & auto_out_3_d_bits_opcode[0] ? ~(_beatsDO_decode_T_13[5:3]) : 3'h0) | (winner_4 & auto_out_4_d_bits_opcode[0] ? ~(_beatsDO_decode_T_17[5:3]) : 3'h0) | (winner_5 & auto_out_5_d_bits_opcode[0] ? ~(_beatsDO_decode_T_21[5:3]) : 3'h0) | (winner_6 ? ~(_beatsDO_decode_T_25[5:3]) : 3'h0) | (winner_7 & auto_out_7_d_bits_opcode[0] ? ~(_beatsDO_decode_T_29[5:3]) : 3'h0)};
      else
        beatsLeft <= beatsLeft - {8'h0, auto_in_d_ready & in_0_d_valid};
      if (latch & (|readys_valid))
        readys_mask <= _readys_mask_T_6 | {_readys_mask_T_6[3:0], 4'h0};
      if (idle) begin
        state_0 <= winner_0;
        state_1 <= winner_1;
        state_2 <= winner_2;
        state_3 <= winner_3;
        state_4 <= winner_4;
        state_5 <= winner_5;
        state_6 <= winner_6;
        state_7 <= winner_7;
      end
    end
  end // always @(posedge)
  TLMonitor_17 monitor (
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
    .io_in_d_bits_param   (_in_0_d_bits_WIRE_9),
    .io_in_d_bits_size    (_in_0_d_bits_WIRE_8),
    .io_in_d_bits_source  (_in_0_d_bits_WIRE_7),
    .io_in_d_bits_sink    (_in_0_d_bits_WIRE_6),
    .io_in_d_bits_denied  (_in_0_d_bits_WIRE_5),
    .io_in_d_bits_corrupt (_in_0_d_bits_WIRE_1)
  );
  assign auto_in_a_ready = _portsAOI_in_0_a_ready_WIRE;
  assign auto_in_d_valid = in_0_d_valid;
  assign auto_in_d_bits_opcode = _in_0_d_bits_WIRE_10;
  assign auto_in_d_bits_param = _in_0_d_bits_WIRE_9;
  assign auto_in_d_bits_size = _in_0_d_bits_WIRE_8;
  assign auto_in_d_bits_source = _in_0_d_bits_WIRE_7;
  assign auto_in_d_bits_sink = _in_0_d_bits_WIRE_6;
  assign auto_in_d_bits_denied = _in_0_d_bits_WIRE_5;
  assign auto_in_d_bits_data = (muxState_0 ? auto_out_0_d_bits_data : 64'h0) | (muxState_1 ? auto_out_1_d_bits_data : 64'h0) | (muxState_2 ? auto_out_2_d_bits_data : 64'h0) | (muxState_3 ? auto_out_3_d_bits_data : 64'h0) | (muxState_4 ? auto_out_4_d_bits_data : 64'h0) | (muxState_5 ? auto_out_5_d_bits_data : 64'h0) | (muxState_6 ? auto_out_6_d_bits_data : 64'h0) | (muxState_7 ? auto_out_7_d_bits_data : 64'h0);
  assign auto_in_d_bits_corrupt = _in_0_d_bits_WIRE_1;
  assign auto_out_7_a_valid = auto_in_a_valid & requestAIO_0_7;
  assign auto_out_7_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_7_a_bits_param = auto_in_a_bits_param;
  assign auto_out_7_a_bits_size = auto_in_a_bits_size[2:0];
  assign auto_out_7_a_bits_source = auto_in_a_bits_source;
  assign auto_out_7_a_bits_address = auto_in_a_bits_address[20:0];
  assign auto_out_7_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_7_a_bits_data = auto_in_a_bits_data;
  assign auto_out_7_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_7_d_ready = auto_in_d_ready & (idle ? readys_readys[7] : state_7);
  assign auto_out_6_a_valid = auto_in_a_valid & requestAIO_0_6;
  assign auto_out_6_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_6_a_bits_param = auto_in_a_bits_param;
  assign auto_out_6_a_bits_size = auto_in_a_bits_size[2:0];
  assign auto_out_6_a_bits_source = auto_in_a_bits_source;
  assign auto_out_6_a_bits_address = auto_in_a_bits_address[16:0];
  assign auto_out_6_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_6_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_6_d_ready = auto_in_d_ready & (idle ? readys_readys[6] : state_6);
  assign auto_out_5_a_valid = auto_in_a_valid & requestAIO_0_5;
  assign auto_out_5_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_5_a_bits_param = auto_in_a_bits_param;
  assign auto_out_5_a_bits_size = auto_in_a_bits_size[2:0];
  assign auto_out_5_a_bits_source = auto_in_a_bits_source;
  assign auto_out_5_a_bits_address = auto_in_a_bits_address[11:0];
  assign auto_out_5_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_5_a_bits_data = auto_in_a_bits_data;
  assign auto_out_5_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_5_d_ready = auto_in_d_ready & (idle ? readys_readys[5] : state_5);
  assign auto_out_4_a_valid = auto_in_a_valid & requestAIO_0_4;
  assign auto_out_4_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_4_a_bits_param = auto_in_a_bits_param;
  assign auto_out_4_a_bits_size = auto_in_a_bits_size[2:0];
  assign auto_out_4_a_bits_source = auto_in_a_bits_source;
  assign auto_out_4_a_bits_address = auto_in_a_bits_address[25:0];
  assign auto_out_4_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_4_a_bits_data = auto_in_a_bits_data;
  assign auto_out_4_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_4_d_ready = auto_in_d_ready & (idle ? readys_readys[4] : state_4);
  assign auto_out_3_a_valid = auto_in_a_valid & auto_in_a_bits_address[27];
  assign auto_out_3_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_3_a_bits_param = auto_in_a_bits_param;
  assign auto_out_3_a_bits_size = auto_in_a_bits_size[2:0];
  assign auto_out_3_a_bits_source = auto_in_a_bits_source;
  assign auto_out_3_a_bits_address = auto_in_a_bits_address[27:0];
  assign auto_out_3_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_3_a_bits_data = auto_in_a_bits_data;
  assign auto_out_3_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_3_d_ready = auto_in_d_ready & (idle ? readys_readys[3] : state_3);
  assign auto_out_2_a_valid = auto_in_a_valid & requestAIO_0_2;
  assign auto_out_2_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_2_a_bits_param = auto_in_a_bits_param;
  assign auto_out_2_a_bits_size = auto_in_a_bits_size[2:0];
  assign auto_out_2_a_bits_source = auto_in_a_bits_source;
  assign auto_out_2_a_bits_address = auto_in_a_bits_address;
  assign auto_out_2_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_2_a_bits_data = auto_in_a_bits_data;
  assign auto_out_2_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_2_d_ready = auto_in_d_ready & (idle ? readys_readys[2] : state_2);
  assign auto_out_1_a_valid = auto_in_a_valid & requestAIO_0_1;
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_1_a_bits_param = auto_in_a_bits_param;
  assign auto_out_1_a_bits_size = auto_in_a_bits_size[2:0];
  assign auto_out_1_a_bits_source = auto_in_a_bits_source;
  assign auto_out_1_a_bits_address = auto_in_a_bits_address[25:0];
  assign auto_out_1_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_1_a_bits_data = auto_in_a_bits_data;
  assign auto_out_1_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_1_d_ready = auto_in_d_ready & (idle ? readys_readys[1] : state_1);
  assign auto_out_0_a_valid = auto_in_a_valid & requestAIO_0_0;
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_0_a_bits_param = auto_in_a_bits_param;
  assign auto_out_0_a_bits_size = auto_in_a_bits_size;
  assign auto_out_0_a_bits_source = auto_in_a_bits_source;
  assign auto_out_0_a_bits_address = auto_in_a_bits_address[13:0];
  assign auto_out_0_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_0_a_bits_data = auto_in_a_bits_data;
  assign auto_out_0_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_0_d_ready = auto_in_d_ready & (idle ? readys_readys[0] : state_0);
endmodule

