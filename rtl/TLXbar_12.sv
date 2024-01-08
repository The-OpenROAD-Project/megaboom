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

module TLXbar_12(
  input         clock,
                reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
                auto_in_a_bits_size,
  input  [6:0]  auto_in_a_bits_source,
  input  [20:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
                auto_in_d_bits_size,
  output [6:0]  auto_in_d_bits_source,
  output [63:0] auto_in_d_bits_data,
  input         auto_out_4_a_ready,
  output        auto_out_4_a_valid,
  output [2:0]  auto_out_4_a_bits_opcode,
                auto_out_4_a_bits_param,
                auto_out_4_a_bits_size,
  output [6:0]  auto_out_4_a_bits_source,
  output [20:0] auto_out_4_a_bits_address,
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
  output [20:0] auto_out_3_a_bits_address,
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
  output [20:0] auto_out_2_a_bits_address,
  output [7:0]  auto_out_2_a_bits_mask,
  output [63:0] auto_out_2_a_bits_data,
  output        auto_out_2_a_bits_corrupt,
                auto_out_2_d_ready,
  input         auto_out_2_d_valid,
  input  [2:0]  auto_out_2_d_bits_opcode,
                auto_out_2_d_bits_size,
  input  [6:0]  auto_out_2_d_bits_source,
  input  [63:0] auto_out_2_d_bits_data,
  input         auto_out_1_a_ready,
  output        auto_out_1_a_valid,
  output [2:0]  auto_out_1_a_bits_opcode,
                auto_out_1_a_bits_param,
                auto_out_1_a_bits_size,
  output [6:0]  auto_out_1_a_bits_source,
  output [20:0] auto_out_1_a_bits_address,
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
  output [20:0] auto_out_0_a_bits_address,
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

  wire        requestAIO_0_0 = auto_in_a_bits_address[18:16] == 3'h0;
  wire        requestAIO_0_1 = {auto_in_a_bits_address[18:17], ~(auto_in_a_bits_address[16])} == 3'h0;
  wire        requestAIO_0_2 = {auto_in_a_bits_address[18], auto_in_a_bits_address[17:16] ^ 2'h2} == 3'h0;
  wire        requestAIO_0_3 = {auto_in_a_bits_address[18], ~(auto_in_a_bits_address[17:16])} == 3'h0;
  wire        requestAIO_0_4 = auto_in_a_bits_address[18:16] == 3'h4;
  wire        _portsAOI_in_0_a_ready_WIRE = requestAIO_0_0 & auto_out_0_a_ready | requestAIO_0_1 & auto_out_1_a_ready | requestAIO_0_2 & auto_out_2_a_ready | requestAIO_0_3 & auto_out_3_a_ready | requestAIO_0_4 & auto_out_4_a_ready;
  reg  [2:0]  beatsLeft;
  wire        idle = beatsLeft == 3'h0;
  wire [4:0]  readys_valid = {auto_out_4_d_valid, auto_out_3_d_valid, auto_out_2_d_valid, auto_out_1_d_valid, auto_out_0_d_valid};
  reg  [4:0]  readys_mask;
  wire [4:0]  _readys_filter_T_1 = readys_valid & ~readys_mask;
  wire [7:0]  _GEN = {_readys_filter_T_1[3:0], auto_out_4_d_valid, auto_out_3_d_valid, auto_out_2_d_valid, auto_out_1_d_valid} | {_readys_filter_T_1, auto_out_4_d_valid, auto_out_3_d_valid, auto_out_2_d_valid};
  wire [6:0]  _GEN_0 = _GEN[6:0] | {_readys_filter_T_1[4], _GEN[7:2]};
  wire [4:0]  readys_readys = ~({readys_mask[4], _readys_filter_T_1[4] | readys_mask[3], _GEN[7] | readys_mask[2], _GEN_0[6:5] | readys_mask[1:0]} & (_GEN_0[4:0] | {_readys_filter_T_1[4], _GEN[7], _GEN_0[6:4]}));
  wire        winner_0 = readys_readys[0] & auto_out_0_d_valid;
  wire        winner_1 = readys_readys[1] & auto_out_1_d_valid;
  wire        winner_2 = readys_readys[2] & auto_out_2_d_valid;
  wire        winner_3 = readys_readys[3] & auto_out_3_d_valid;
  wire        winner_4 = readys_readys[4] & auto_out_4_d_valid;
  wire        _in_0_d_valid_T = auto_out_0_d_valid | auto_out_1_d_valid;
  `ifndef SYNTHESIS
    wire prefixOR_2 = winner_0 | winner_1;
    wire prefixOR_3 = prefixOR_2 | winner_2;
    always @(posedge clock) begin
      if (~reset & ~((~winner_0 | ~winner_1) & (~prefixOR_2 | ~winner_2) & (~prefixOR_3 | ~winner_3) & (~(prefixOR_3 | winner_3) | ~winner_4))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~(_in_0_d_valid_T | auto_out_2_d_valid | auto_out_3_d_valid | auto_out_4_d_valid) | winner_0 | winner_1 | winner_2 | winner_3 | winner_4)) begin
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
  wire        muxState_0 = idle ? winner_0 : state_0;
  wire        muxState_1 = idle ? winner_1 : state_1;
  wire        muxState_2 = idle ? winner_2 : state_2;
  wire        muxState_3 = idle ? winner_3 : state_3;
  wire        muxState_4 = idle ? winner_4 : state_4;
  wire        in_0_d_valid = idle ? _in_0_d_valid_T | auto_out_2_d_valid | auto_out_3_d_valid | auto_out_4_d_valid : state_0 & auto_out_0_d_valid | state_1 & auto_out_1_d_valid | state_2 & auto_out_2_d_valid | state_3 & auto_out_3_d_valid | state_4 & auto_out_4_d_valid;
  wire [6:0]  _in_0_d_bits_WIRE_7 = (muxState_0 ? auto_out_0_d_bits_source : 7'h0) | (muxState_1 ? auto_out_1_d_bits_source : 7'h0) | (muxState_2 ? auto_out_2_d_bits_source : 7'h0) | (muxState_3 ? auto_out_3_d_bits_source : 7'h0) | (muxState_4 ? auto_out_4_d_bits_source : 7'h0);
  wire [2:0]  _in_0_d_bits_WIRE_8 = (muxState_0 ? auto_out_0_d_bits_size : 3'h0) | (muxState_1 ? auto_out_1_d_bits_size : 3'h0) | (muxState_2 ? auto_out_2_d_bits_size : 3'h0) | (muxState_3 ? auto_out_3_d_bits_size : 3'h0) | (muxState_4 ? auto_out_4_d_bits_size : 3'h0);
  wire [2:0]  _in_0_d_bits_WIRE_10 = (muxState_0 ? auto_out_0_d_bits_opcode : 3'h0) | (muxState_1 ? auto_out_1_d_bits_opcode : 3'h0) | (muxState_2 ? auto_out_2_d_bits_opcode : 3'h0) | (muxState_3 ? auto_out_3_d_bits_opcode : 3'h0) | (muxState_4 ? auto_out_4_d_bits_opcode : 3'h0);
  wire [12:0] _beatsDO_decode_T_17 = 13'h3F << auto_out_4_d_bits_size;
  wire [12:0] _beatsDO_decode_T_13 = 13'h3F << auto_out_3_d_bits_size;
  wire [12:0] _beatsDO_decode_T_9 = 13'h3F << auto_out_2_d_bits_size;
  wire [12:0] _beatsDO_decode_T_5 = 13'h3F << auto_out_1_d_bits_size;
  wire [12:0] _beatsDO_decode_T_1 = 13'h3F << auto_out_0_d_bits_size;
  wire [4:0]  _readys_mask_T = readys_readys & readys_valid;
  wire [4:0]  _readys_mask_T_3 = _readys_mask_T | {_readys_mask_T[3:0], 1'h0};
  wire [4:0]  _readys_mask_T_6 = _readys_mask_T_3 | {_readys_mask_T_3[2:0], 2'h0};
  wire        latch = idle & auto_in_d_ready;
  always @(posedge clock) begin
    if (reset) begin
      beatsLeft <= 3'h0;
      readys_mask <= 5'h1F;
      state_0 <= 1'h0;
      state_1 <= 1'h0;
      state_2 <= 1'h0;
      state_3 <= 1'h0;
      state_4 <= 1'h0;
    end
    else begin
      if (latch)
        beatsLeft <= (winner_0 & auto_out_0_d_bits_opcode[0] ? ~(_beatsDO_decode_T_1[5:3]) : 3'h0) | (winner_1 & auto_out_1_d_bits_opcode[0] ? ~(_beatsDO_decode_T_5[5:3]) : 3'h0) | (winner_2 & auto_out_2_d_bits_opcode[0] ? ~(_beatsDO_decode_T_9[5:3]) : 3'h0) | (winner_3 & auto_out_3_d_bits_opcode[0] ? ~(_beatsDO_decode_T_13[5:3]) : 3'h0) | (winner_4 & auto_out_4_d_bits_opcode[0] ? ~(_beatsDO_decode_T_17[5:3]) : 3'h0);
      else
        beatsLeft <= beatsLeft - {2'h0, auto_in_d_ready & in_0_d_valid};
      if (latch & (|readys_valid))
        readys_mask <= _readys_mask_T_6 | {_readys_mask_T_6[0], 4'h0};
      if (idle) begin
        state_0 <= winner_0;
        state_1 <= winner_1;
        state_2 <= winner_2;
        state_3 <= winner_3;
        state_4 <= winner_4;
      end
    end
  end // always @(posedge)
  TLMonitor_59 monitor (
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
  assign auto_in_d_bits_data = (muxState_0 ? auto_out_0_d_bits_data : 64'h0) | (muxState_1 ? auto_out_1_d_bits_data : 64'h0) | (muxState_2 ? auto_out_2_d_bits_data : 64'h0) | (muxState_3 ? auto_out_3_d_bits_data : 64'h0) | (muxState_4 ? auto_out_4_d_bits_data : 64'h0);
  assign auto_out_4_a_valid = auto_in_a_valid & requestAIO_0_4;
  assign auto_out_4_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_4_a_bits_param = auto_in_a_bits_param;
  assign auto_out_4_a_bits_size = auto_in_a_bits_size;
  assign auto_out_4_a_bits_source = auto_in_a_bits_source;
  assign auto_out_4_a_bits_address = auto_in_a_bits_address;
  assign auto_out_4_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_4_a_bits_data = auto_in_a_bits_data;
  assign auto_out_4_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_4_d_ready = auto_in_d_ready & (idle ? readys_readys[4] : state_4);
  assign auto_out_3_a_valid = auto_in_a_valid & requestAIO_0_3;
  assign auto_out_3_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_3_a_bits_param = auto_in_a_bits_param;
  assign auto_out_3_a_bits_size = auto_in_a_bits_size;
  assign auto_out_3_a_bits_source = auto_in_a_bits_source;
  assign auto_out_3_a_bits_address = auto_in_a_bits_address;
  assign auto_out_3_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_3_a_bits_data = auto_in_a_bits_data;
  assign auto_out_3_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_3_d_ready = auto_in_d_ready & (idle ? readys_readys[3] : state_3);
  assign auto_out_2_a_valid = auto_in_a_valid & requestAIO_0_2;
  assign auto_out_2_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_2_a_bits_param = auto_in_a_bits_param;
  assign auto_out_2_a_bits_size = auto_in_a_bits_size;
  assign auto_out_2_a_bits_source = auto_in_a_bits_source;
  assign auto_out_2_a_bits_address = auto_in_a_bits_address;
  assign auto_out_2_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_2_a_bits_data = auto_in_a_bits_data;
  assign auto_out_2_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_2_d_ready = auto_in_d_ready & (idle ? readys_readys[2] : state_2);
  assign auto_out_1_a_valid = auto_in_a_valid & requestAIO_0_1;
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_1_a_bits_param = auto_in_a_bits_param;
  assign auto_out_1_a_bits_size = auto_in_a_bits_size;
  assign auto_out_1_a_bits_source = auto_in_a_bits_source;
  assign auto_out_1_a_bits_address = auto_in_a_bits_address;
  assign auto_out_1_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_1_a_bits_data = auto_in_a_bits_data;
  assign auto_out_1_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_1_d_ready = auto_in_d_ready & (idle ? readys_readys[1] : state_1);
  assign auto_out_0_a_valid = auto_in_a_valid & requestAIO_0_0;
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_0_a_bits_param = auto_in_a_bits_param;
  assign auto_out_0_a_bits_size = auto_in_a_bits_size;
  assign auto_out_0_a_bits_source = auto_in_a_bits_source;
  assign auto_out_0_a_bits_address = auto_in_a_bits_address;
  assign auto_out_0_a_bits_mask = auto_in_a_bits_mask;
  assign auto_out_0_a_bits_data = auto_in_a_bits_data;
  assign auto_out_0_a_bits_corrupt = auto_in_a_bits_corrupt;
  assign auto_out_0_d_ready = auto_in_d_ready & (idle ? readys_readys[0] : state_0);
endmodule

