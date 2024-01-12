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

module TLBroadcast(
  input         clock,
                reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
                auto_in_a_bits_size,
  input  [5:0]  auto_in_a_bits_source,
  input  [32:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_b_ready,
  output        auto_in_b_valid,
  output [1:0]  auto_in_b_bits_param,
  output [32:0] auto_in_b_bits_address,
  output        auto_in_c_ready,
  input         auto_in_c_valid,
  input  [2:0]  auto_in_c_bits_opcode,
                auto_in_c_bits_param,
                auto_in_c_bits_size,
  input  [5:0]  auto_in_c_bits_source,
  input  [32:0] auto_in_c_bits_address,
  input  [63:0] auto_in_c_bits_data,
  input         auto_in_c_bits_corrupt,
                auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [2:0]  auto_in_d_bits_size,
  output [5:0]  auto_in_d_bits_source,
  output [1:0]  auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_in_e_valid,
  input  [1:0]  auto_in_e_bits_sink,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
                auto_out_a_bits_param,
                auto_out_a_bits_size,
  output [7:0]  auto_out_a_bits_source,
  output [32:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [2:0]  auto_out_d_bits_size,
  input  [7:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt
);

  reg  [2:0]  a_first_counter;
  reg         probe_todo;
  wire        putfull_ready;
  wire        d_normal_ready;
  wire        releaseack_ready;
  wire        nodeIn_c_ready;
  wire [2:0]  d_normal_bits_opcode;
  wire [5:0]  d_normal_bits_source;
  wire        d_normal_valid;
  wire        _TLBroadcastTracker_3_io_in_a_ready;
  wire        _TLBroadcastTracker_3_io_out_a_valid;
  wire [2:0]  _TLBroadcastTracker_3_io_out_a_bits_opcode;
  wire [2:0]  _TLBroadcastTracker_3_io_out_a_bits_param;
  wire [2:0]  _TLBroadcastTracker_3_io_out_a_bits_size;
  wire [7:0]  _TLBroadcastTracker_3_io_out_a_bits_source;
  wire [32:0] _TLBroadcastTracker_3_io_out_a_bits_address;
  wire [7:0]  _TLBroadcastTracker_3_io_out_a_bits_mask;
  wire [63:0] _TLBroadcastTracker_3_io_out_a_bits_data;
  wire [5:0]  _TLBroadcastTracker_3_io_source;
  wire [26:0] _TLBroadcastTracker_3_io_line;
  wire        _TLBroadcastTracker_3_io_idle;
  wire        _TLBroadcastTracker_3_io_need_d;
  wire        _TLBroadcastTracker_2_io_in_a_ready;
  wire        _TLBroadcastTracker_2_io_out_a_valid;
  wire [2:0]  _TLBroadcastTracker_2_io_out_a_bits_opcode;
  wire [2:0]  _TLBroadcastTracker_2_io_out_a_bits_param;
  wire [2:0]  _TLBroadcastTracker_2_io_out_a_bits_size;
  wire [7:0]  _TLBroadcastTracker_2_io_out_a_bits_source;
  wire [32:0] _TLBroadcastTracker_2_io_out_a_bits_address;
  wire [7:0]  _TLBroadcastTracker_2_io_out_a_bits_mask;
  wire [63:0] _TLBroadcastTracker_2_io_out_a_bits_data;
  wire [5:0]  _TLBroadcastTracker_2_io_source;
  wire [26:0] _TLBroadcastTracker_2_io_line;
  wire        _TLBroadcastTracker_2_io_idle;
  wire        _TLBroadcastTracker_2_io_need_d;
  wire        _TLBroadcastTracker_1_io_in_a_ready;
  wire        _TLBroadcastTracker_1_io_out_a_valid;
  wire [2:0]  _TLBroadcastTracker_1_io_out_a_bits_opcode;
  wire [2:0]  _TLBroadcastTracker_1_io_out_a_bits_param;
  wire [2:0]  _TLBroadcastTracker_1_io_out_a_bits_size;
  wire [7:0]  _TLBroadcastTracker_1_io_out_a_bits_source;
  wire [32:0] _TLBroadcastTracker_1_io_out_a_bits_address;
  wire [7:0]  _TLBroadcastTracker_1_io_out_a_bits_mask;
  wire [63:0] _TLBroadcastTracker_1_io_out_a_bits_data;
  wire [5:0]  _TLBroadcastTracker_1_io_source;
  wire [26:0] _TLBroadcastTracker_1_io_line;
  wire        _TLBroadcastTracker_1_io_idle;
  wire        _TLBroadcastTracker_1_io_need_d;
  wire        _TLBroadcastTracker_io_in_a_ready;
  wire        _TLBroadcastTracker_io_out_a_valid;
  wire [2:0]  _TLBroadcastTracker_io_out_a_bits_opcode;
  wire [2:0]  _TLBroadcastTracker_io_out_a_bits_param;
  wire [2:0]  _TLBroadcastTracker_io_out_a_bits_size;
  wire [7:0]  _TLBroadcastTracker_io_out_a_bits_source;
  wire [32:0] _TLBroadcastTracker_io_out_a_bits_address;
  wire [7:0]  _TLBroadcastTracker_io_out_a_bits_mask;
  wire [63:0] _TLBroadcastTracker_io_out_a_bits_data;
  wire [5:0]  _TLBroadcastTracker_io_source;
  wire [26:0] _TLBroadcastTracker_io_line;
  wire        _TLBroadcastTracker_io_idle;
  wire        _TLBroadcastTracker_io_need_d;
  wire        _filter_io_request_ready;
  wire        _filter_io_response_valid;
  wire [1:0]  _filter_io_response_bits_mshr;
  wire [32:0] _filter_io_response_bits_address;
  wire        _filter_io_response_bits_allocOH;
  wire        _filter_io_response_bits_needT;
  wire        d_drop = auto_out_d_bits_source[7:6] == 2'h1;
  wire        _GEN = d_normal_ready & d_normal_valid;
  wire [12:0] _GEN_0 = {10'h0, auto_out_d_bits_size};
  wire [12:0] _beats1_decode_T_1 = 13'h3F << _GEN_0;
  wire [2:0]  beats1 = d_normal_bits_opcode[0] ? ~(_beats1_decode_T_1[5:3]) : 3'h0;
  reg  [2:0]  counter;
  wire        d_first = counter == 3'h0;
  wire        d_last = counter == 3'h1 | beats1 == 3'h0;
  wire [3:0]  _d_trackerOH_T_8 = {_TLBroadcastTracker_3_io_need_d & _TLBroadcastTracker_3_io_source == d_normal_bits_source, _TLBroadcastTracker_2_io_need_d & _TLBroadcastTracker_2_io_source == d_normal_bits_source, _TLBroadcastTracker_1_io_need_d & _TLBroadcastTracker_1_io_source == d_normal_bits_source, _TLBroadcastTracker_io_need_d & _TLBroadcastTracker_io_source == d_normal_bits_source};
  reg  [3:0]  d_trackerOH_r;
  wire [3:0]  d_trackerOH = d_first ? _d_trackerOH_T_8 : d_trackerOH_r;
  wire        nodeOut_d_ready = d_normal_ready | d_drop;
  assign d_normal_valid = auto_out_d_valid & ~d_drop;
  assign d_normal_bits_source = auto_out_d_bits_source[5:0];
  assign d_normal_bits_opcode = auto_out_d_bits_source[7] ? (auto_out_d_bits_opcode[0] ? 3'h5 : 3'h6) : auto_out_d_bits_opcode;
  wire        d_response = auto_out_d_bits_opcode[0] | ~(auto_out_d_bits_source[7]);
  wire        _GEN_1 = nodeOut_d_ready & auto_out_d_valid;
  wire        c_probeack = auto_in_c_bits_opcode == 3'h4;
  wire        c_probeackdata = auto_in_c_bits_opcode == 3'h5;
  wire        c_release = auto_in_c_bits_opcode == 3'h6;
  wire        c_trackerOH_0 = _TLBroadcastTracker_io_line == auto_in_c_bits_address[32:6];
  wire        c_trackerOH_1 = _TLBroadcastTracker_1_io_line == auto_in_c_bits_address[32:6];
  wire        c_trackerOH_2 = _TLBroadcastTracker_2_io_line == auto_in_c_bits_address[32:6];
  wire        c_trackerOH_3 = _TLBroadcastTracker_3_io_line == auto_in_c_bits_address[32:6];
  wire        _c_first_T = nodeIn_c_ready & auto_in_c_valid;
  wire        _clearOH_T_1 = c_probeack | c_probeackdata;
  wire        _GEN_2 = _c_first_T & c_probeack;
  wire        _GEN_3 = auto_in_c_bits_param == 3'h0 | auto_in_c_bits_param == 3'h4;
  assign nodeIn_c_ready = c_probeack | (c_release ? releaseack_ready : putfull_ready);
  wire        winner_0 = auto_in_c_valid & c_release;
  wire        winner_1_0 = auto_in_c_valid & (c_probeackdata | (&auto_in_c_bits_opcode));
  wire        _putfull_bits_a_mask_T = auto_in_c_bits_size > 3'h2;
  wire        putfull_bits_a_mask_size = auto_in_c_bits_size[1:0] == 2'h2;
  wire        putfull_bits_a_mask_acc = _putfull_bits_a_mask_T | putfull_bits_a_mask_size & ~(auto_in_c_bits_address[2]);
  wire        putfull_bits_a_mask_acc_1 = _putfull_bits_a_mask_T | putfull_bits_a_mask_size & auto_in_c_bits_address[2];
  wire        putfull_bits_a_mask_size_1 = auto_in_c_bits_size[1:0] == 2'h1;
  wire        putfull_bits_a_mask_eq_2 = ~(auto_in_c_bits_address[2]) & ~(auto_in_c_bits_address[1]);
  wire        putfull_bits_a_mask_acc_2 = putfull_bits_a_mask_acc | putfull_bits_a_mask_size_1 & putfull_bits_a_mask_eq_2;
  wire        putfull_bits_a_mask_eq_3 = ~(auto_in_c_bits_address[2]) & auto_in_c_bits_address[1];
  wire        putfull_bits_a_mask_acc_3 = putfull_bits_a_mask_acc | putfull_bits_a_mask_size_1 & putfull_bits_a_mask_eq_3;
  wire        putfull_bits_a_mask_eq_4 = auto_in_c_bits_address[2] & ~(auto_in_c_bits_address[1]);
  wire        putfull_bits_a_mask_acc_4 = putfull_bits_a_mask_acc_1 | putfull_bits_a_mask_size_1 & putfull_bits_a_mask_eq_4;
  wire        putfull_bits_a_mask_eq_5 = auto_in_c_bits_address[2] & auto_in_c_bits_address[1];
  wire        putfull_bits_a_mask_acc_5 = putfull_bits_a_mask_acc_1 | putfull_bits_a_mask_size_1 & putfull_bits_a_mask_eq_5;
  reg  [2:0]  beatsLeft;
  wire        idle = beatsLeft == 3'h0;
  wire        winner_1 = ~winner_0 & d_normal_valid;
  wire        _nodeIn_d_valid_T = winner_0 | d_normal_valid;
  reg         state_0;
  reg         state_1;
  wire        muxState_0 = idle ? winner_0 : state_0;
  wire        muxState_1 = idle ? winner_1 : state_1;
  assign releaseack_ready = auto_in_d_ready & (idle | state_0);
  assign d_normal_ready = auto_in_d_ready & (idle ? ~winner_0 : state_1);
  wire        nodeIn_d_valid = idle ? _nodeIn_d_valid_T : state_0 & winner_0 | state_1 & d_normal_valid;
  wire        _nodeIn_d_bits_WIRE_1 = muxState_1 & auto_out_d_bits_corrupt;
  wire        _nodeIn_d_bits_WIRE_5 = muxState_1 & auto_out_d_bits_denied;
  wire [1:0]  _nodeIn_d_bits_WIRE_6 = muxState_1 ? {|(d_trackerOH[3:2]), d_trackerOH[3] | d_trackerOH[1]} : 2'h0;
  wire [5:0]  _nodeIn_d_bits_WIRE_7 = (muxState_0 ? auto_in_c_bits_source : 6'h0) | (muxState_1 ? d_normal_bits_source : 6'h0);
  wire [2:0]  _nodeIn_d_bits_WIRE_8 = (muxState_0 ? auto_in_c_bits_size : 3'h0) | (muxState_1 ? auto_out_d_bits_size : 3'h0);
  wire [1:0]  _nodeIn_d_bits_WIRE_9 = muxState_1 ? (auto_out_d_bits_source[7] ? (auto_out_d_bits_opcode[0] ? {1'h0, ~(auto_out_d_bits_source[6])} : 2'h0) : auto_out_d_bits_param) : 2'h0;
  wire [2:0]  _nodeIn_d_bits_WIRE_10 = (muxState_0 ? 3'h6 : 3'h0) | (muxState_1 ? d_normal_bits_opcode : 3'h0);
  reg  [2:0]  beatsLeft_1;
  wire        idle_1 = beatsLeft_1 == 3'h0;
  wire        _GEN_4 = _TLBroadcastTracker_io_out_a_valid | winner_1_0;
  wire        _GEN_5 = _TLBroadcastTracker_2_io_out_a_valid | _TLBroadcastTracker_1_io_out_a_valid | _GEN_4;
  wire        _GEN_6 = _TLBroadcastTracker_1_io_out_a_valid | _TLBroadcastTracker_io_out_a_valid | winner_1_0;
  wire        winner_1_1 = ~winner_1_0 & _TLBroadcastTracker_io_out_a_valid;
  wire        winner_1_2 = ~_GEN_4 & _TLBroadcastTracker_1_io_out_a_valid;
  wire        winner_1_3 = ~_GEN_6 & _TLBroadcastTracker_2_io_out_a_valid;
  wire        winner_1_4 = ~_GEN_5 & _TLBroadcastTracker_3_io_out_a_valid;
  wire        _nodeOut_a_valid_T = winner_1_0 | _TLBroadcastTracker_io_out_a_valid;
  `ifndef SYNTHESIS
    wire prefixOR_2 = winner_1_0 | winner_1_1;
    wire prefixOR_3 = prefixOR_2 | winner_1_2;
    always @(posedge clock) begin
      if (~reset & ~(~auto_out_d_valid | ~d_drop | auto_out_d_bits_opcode == 3'h0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Broadcast.scala:125 assert (!out.d.valid || !d_drop || out.d.bits.opcode === TLMessages.AccessAck)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~d_normal_valid | (|d_trackerOH) | d_normal_bits_opcode == 3'h6)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Broadcast.scala:137 assert (!d_normal.valid || (d_trackerOH.orR || d_normal.bits.opcode === TLMessages.ReleaseAck))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~winner_0 | ~winner_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~_nodeIn_d_valid_T | winner_0 | winner_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~((~winner_1_0 | ~winner_1_1) & (~prefixOR_2 | ~winner_1_2) & (~prefixOR_3 | ~winner_1_3) & (~(prefixOR_3 | winner_1_3) | ~winner_1_4))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~(_nodeOut_a_valid_T | _TLBroadcastTracker_1_io_out_a_valid | _TLBroadcastTracker_2_io_out_a_valid | _TLBroadcastTracker_3_io_out_a_valid) | winner_1_0 | winner_1_1 | winner_1_2 | winner_1_3 | winner_1_4)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg         state_1_0;
  reg         state_1_1;
  reg         state_1_2;
  reg         state_1_3;
  reg         state_1_4;
  wire        muxState_1_0 = idle_1 ? winner_1_0 : state_1_0;
  wire        muxState_1_1 = idle_1 ? winner_1_1 : state_1_1;
  wire        muxState_1_2 = idle_1 ? winner_1_2 : state_1_2;
  wire        muxState_1_3 = idle_1 ? winner_1_3 : state_1_3;
  wire        muxState_1_4 = idle_1 ? winner_1_4 : state_1_4;
  assign putfull_ready = auto_out_a_ready & (idle_1 | state_1_0);
  wire        nodeOut_a_valid = idle_1 ? _nodeOut_a_valid_T | _TLBroadcastTracker_1_io_out_a_valid | _TLBroadcastTracker_2_io_out_a_valid | _TLBroadcastTracker_3_io_out_a_valid : state_1_0 & winner_1_0 | state_1_1 & _TLBroadcastTracker_io_out_a_valid | state_1_2 & _TLBroadcastTracker_1_io_out_a_valid | state_1_3 & _TLBroadcastTracker_2_io_out_a_valid | state_1_4 & _TLBroadcastTracker_3_io_out_a_valid;
  reg  [26:0] probe_line;
  reg  [1:0]  probe_perms;
  wire [32:0] nodeIn_b_bits_b_address = {probe_line, 6'h0};
  wire        _matchTrackers_WIRE_0 = _TLBroadcastTracker_io_line == auto_in_a_bits_address[32:6];
  wire        _matchTrackers_WIRE_1 = _TLBroadcastTracker_1_io_line == auto_in_a_bits_address[32:6];
  wire        _matchTrackers_WIRE_2 = _TLBroadcastTracker_2_io_line == auto_in_a_bits_address[32:6];
  wire        _matchTrackers_WIRE_3 = _TLBroadcastTracker_3_io_line == auto_in_a_bits_address[32:6];
  wire [3:0]  filter_io_request_bits_mshr_lo = (|{_matchTrackers_WIRE_3, _matchTrackers_WIRE_2, _matchTrackers_WIRE_1, _matchTrackers_WIRE_0}) ? {_matchTrackers_WIRE_3, _matchTrackers_WIRE_2, _matchTrackers_WIRE_1, _matchTrackers_WIRE_0} : {~(_TLBroadcastTracker_2_io_idle | _TLBroadcastTracker_1_io_idle | _TLBroadcastTracker_io_idle), ~(_TLBroadcastTracker_1_io_idle | _TLBroadcastTracker_io_idle), ~_TLBroadcastTracker_io_idle, 1'h1} & {_TLBroadcastTracker_3_io_idle, _TLBroadcastTracker_2_io_idle, _TLBroadcastTracker_1_io_idle, _TLBroadcastTracker_io_idle};
  wire [3:0]  _GEN_7 = filter_io_request_bits_mshr_lo & {_TLBroadcastTracker_3_io_in_a_ready, _TLBroadcastTracker_2_io_in_a_ready, _TLBroadcastTracker_1_io_in_a_ready, _TLBroadcastTracker_io_in_a_ready};
  wire        nodeIn_a_ready = ((|a_first_counter) | _filter_io_request_ready) & (|_GEN_7);
  wire        _GEN_8 = (|a_first_counter) | _filter_io_request_ready;
  wire        _sack_T = ~probe_todo & _filter_io_response_valid;
  wire [12:0] _decode_T_5 = 13'h3F << _GEN_0;
  wire [12:0] _decode_T_25 = 13'h3F << _TLBroadcastTracker_3_io_out_a_bits_size;
  wire [12:0] _decode_T_21 = 13'h3F << _TLBroadcastTracker_2_io_out_a_bits_size;
  wire [12:0] _decode_T_17 = 13'h3F << _TLBroadcastTracker_1_io_out_a_bits_size;
  wire [12:0] _decode_T_13 = 13'h3F << _TLBroadcastTracker_io_out_a_bits_size;
  wire [12:0] _decode_T_9 = 13'h3F << auto_in_c_bits_size;
  wire [12:0] _a_first_beats1_decode_T_1 = 13'h3F << auto_in_a_bits_size;
  always @(posedge clock) begin
    if (reset) begin
      counter <= 3'h0;
      beatsLeft <= 3'h0;
      state_0 <= 1'h0;
      state_1 <= 1'h0;
      beatsLeft_1 <= 3'h0;
      state_1_0 <= 1'h0;
      state_1_1 <= 1'h0;
      state_1_2 <= 1'h0;
      state_1_3 <= 1'h0;
      state_1_4 <= 1'h0;
      probe_todo <= 1'h0;
      a_first_counter <= 3'h0;
    end
    else begin
      if (_GEN) begin
        if (d_first)
          counter <= beats1;
        else
          counter <= counter - 3'h1;
      end
      if (idle & auto_in_d_ready)
        beatsLeft <= winner_1 & d_normal_bits_opcode[0] ? ~(_decode_T_5[5:3]) : 3'h0;
      else
        beatsLeft <= beatsLeft - {2'h0, auto_in_d_ready & nodeIn_d_valid};
      if (idle) begin
        state_0 <= winner_0;
        state_1 <= winner_1;
      end
      if (idle_1 & auto_out_a_ready)
        beatsLeft_1 <= (winner_1_0 ? ~(_decode_T_9[5:3]) : 3'h0) | (winner_1_1 & ~(_TLBroadcastTracker_io_out_a_bits_opcode[2]) ? ~(_decode_T_13[5:3]) : 3'h0) | (winner_1_2 & ~(_TLBroadcastTracker_1_io_out_a_bits_opcode[2]) ? ~(_decode_T_17[5:3]) : 3'h0) | (winner_1_3 & ~(_TLBroadcastTracker_2_io_out_a_bits_opcode[2]) ? ~(_decode_T_21[5:3]) : 3'h0) | (winner_1_4 & ~(_TLBroadcastTracker_3_io_out_a_bits_opcode[2]) ? ~(_decode_T_25[5:3]) : 3'h0);
      else
        beatsLeft_1 <= beatsLeft_1 - {2'h0, auto_out_a_ready & nodeOut_a_valid};
      if (idle_1) begin
        state_1_0 <= winner_1_0;
        state_1_1 <= winner_1_1;
        state_1_2 <= winner_1_2;
        state_1_3 <= winner_1_3;
        state_1_4 <= winner_1_4;
      end
      if (_sack_T)
        probe_todo <= ~_filter_io_response_bits_allocOH;
      else
        probe_todo <= ~(auto_in_b_ready & probe_todo) & probe_todo;
      if (nodeIn_a_ready & auto_in_a_valid) begin
        if (|a_first_counter)
          a_first_counter <= a_first_counter - 3'h1;
        else
          a_first_counter <= auto_in_a_bits_opcode[2] ? 3'h0 : ~(_a_first_beats1_decode_T_1[5:3]);
      end
    end
    if (d_first)
      d_trackerOH_r <= _d_trackerOH_T_8;
    if (_sack_T) begin
      probe_line <= _filter_io_response_bits_address[32:6];
      probe_perms <= _filter_io_response_bits_needT ? 2'h2 : 2'h1;
    end
  end // always @(posedge)
  TLMonitor_26 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (nodeIn_a_ready),
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_opcode  (auto_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_in_a_bits_param),
    .io_in_a_bits_size    (auto_in_a_bits_size),
    .io_in_a_bits_source  (auto_in_a_bits_source),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_a_bits_mask    (auto_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_in_a_bits_corrupt),
    .io_in_b_ready        (auto_in_b_ready),
    .io_in_b_valid        (probe_todo),
    .io_in_b_bits_param   (probe_perms),
    .io_in_b_bits_address (nodeIn_b_bits_b_address),
    .io_in_c_ready        (nodeIn_c_ready),
    .io_in_c_valid        (auto_in_c_valid),
    .io_in_c_bits_opcode  (auto_in_c_bits_opcode),
    .io_in_c_bits_param   (auto_in_c_bits_param),
    .io_in_c_bits_size    (auto_in_c_bits_size),
    .io_in_c_bits_source  (auto_in_c_bits_source),
    .io_in_c_bits_address (auto_in_c_bits_address),
    .io_in_c_bits_corrupt (auto_in_c_bits_corrupt),
    .io_in_d_ready        (auto_in_d_ready),
    .io_in_d_valid        (nodeIn_d_valid),
    .io_in_d_bits_opcode  (_nodeIn_d_bits_WIRE_10),
    .io_in_d_bits_param   (_nodeIn_d_bits_WIRE_9),
    .io_in_d_bits_size    (_nodeIn_d_bits_WIRE_8),
    .io_in_d_bits_source  (_nodeIn_d_bits_WIRE_7),
    .io_in_d_bits_sink    (_nodeIn_d_bits_WIRE_6),
    .io_in_d_bits_denied  (_nodeIn_d_bits_WIRE_5),
    .io_in_d_bits_corrupt (_nodeIn_d_bits_WIRE_1),
    .io_in_e_valid        (auto_in_e_valid),
    .io_in_e_bits_sink    (auto_in_e_bits_sink)
  );
  BroadcastFilter filter (
    .io_request_ready         (_filter_io_request_ready),
    .io_request_valid         (auto_in_a_valid & ~(|a_first_counter) & (|_GEN_7)),
    .io_request_bits_mshr     ({|(filter_io_request_bits_mshr_lo[3:2]), filter_io_request_bits_mshr_lo[3] | filter_io_request_bits_mshr_lo[1]}),
    .io_request_bits_address  (auto_in_a_bits_address),
    .io_request_bits_allocOH  (auto_in_a_bits_source[5:4] == 2'h0 & auto_in_a_bits_source[3:0] < 4'h9),
    .io_request_bits_needT    ((&auto_in_a_bits_opcode) | auto_in_a_bits_opcode == 3'h6 ? auto_in_a_bits_param == 3'h2 | auto_in_a_bits_param == 3'h1 : auto_in_a_bits_opcode == 3'h5 ? auto_in_a_bits_param == 3'h1 : auto_in_a_bits_opcode != 3'h4),
    .io_response_ready        (~probe_todo),
    .io_response_valid        (_filter_io_response_valid),
    .io_response_bits_mshr    (_filter_io_response_bits_mshr),
    .io_response_bits_address (_filter_io_response_bits_address),
    .io_response_bits_allocOH (_filter_io_response_bits_allocOH),
    .io_response_bits_needT   (_filter_io_response_bits_needT)
  );
  TLBroadcastTracker TLBroadcastTracker (
    .clock                 (clock),
    .reset                 (reset),
    .io_in_a_first         (~(|a_first_counter)),
    .io_in_a_ready         (_TLBroadcastTracker_io_in_a_ready),
    .io_in_a_valid         (auto_in_a_valid & filter_io_request_bits_mshr_lo[0] & _GEN_8),
    .io_in_a_bits_opcode   (auto_in_a_bits_opcode),
    .io_in_a_bits_param    (auto_in_a_bits_param),
    .io_in_a_bits_size     (auto_in_a_bits_size),
    .io_in_a_bits_source   (auto_in_a_bits_source),
    .io_in_a_bits_address  (auto_in_a_bits_address),
    .io_in_a_bits_mask     (auto_in_a_bits_mask),
    .io_in_a_bits_data     (auto_in_a_bits_data),
    .io_out_a_ready        (auto_out_a_ready & (idle_1 ? ~winner_1_0 : state_1_1)),
    .io_out_a_valid        (_TLBroadcastTracker_io_out_a_valid),
    .io_out_a_bits_opcode  (_TLBroadcastTracker_io_out_a_bits_opcode),
    .io_out_a_bits_param   (_TLBroadcastTracker_io_out_a_bits_param),
    .io_out_a_bits_size    (_TLBroadcastTracker_io_out_a_bits_size),
    .io_out_a_bits_source  (_TLBroadcastTracker_io_out_a_bits_source),
    .io_out_a_bits_address (_TLBroadcastTracker_io_out_a_bits_address),
    .io_out_a_bits_mask    (_TLBroadcastTracker_io_out_a_bits_mask),
    .io_out_a_bits_data    (_TLBroadcastTracker_io_out_a_bits_data),
    .io_probe_valid        (_sack_T & _filter_io_response_bits_mshr == 2'h0),
    .io_probe_bits_count   (~_filter_io_response_bits_allocOH),
    .io_probenack          (_GEN_2 & c_trackerOH_0),
    .io_probedack          (d_trackerOH[0] & _GEN_1 & d_drop),
    .io_probesack          (_c_first_T & c_trackerOH_0 & _clearOH_T_1 & _GEN_3),
    .io_d_last             (d_trackerOH[0] & _GEN & d_response & d_last),
    .io_e_last             (auto_in_e_bits_sink == 2'h0 & auto_in_e_valid),
    .io_source             (_TLBroadcastTracker_io_source),
    .io_line               (_TLBroadcastTracker_io_line),
    .io_idle               (_TLBroadcastTracker_io_idle),
    .io_need_d             (_TLBroadcastTracker_io_need_d)
  );
  TLBroadcastTracker_1 TLBroadcastTracker_1 (
    .clock                 (clock),
    .reset                 (reset),
    .io_in_a_first         (~(|a_first_counter)),
    .io_in_a_ready         (_TLBroadcastTracker_1_io_in_a_ready),
    .io_in_a_valid         (auto_in_a_valid & filter_io_request_bits_mshr_lo[1] & _GEN_8),
    .io_in_a_bits_opcode   (auto_in_a_bits_opcode),
    .io_in_a_bits_param    (auto_in_a_bits_param),
    .io_in_a_bits_size     (auto_in_a_bits_size),
    .io_in_a_bits_source   (auto_in_a_bits_source),
    .io_in_a_bits_address  (auto_in_a_bits_address),
    .io_in_a_bits_mask     (auto_in_a_bits_mask),
    .io_in_a_bits_data     (auto_in_a_bits_data),
    .io_out_a_ready        (auto_out_a_ready & (idle_1 ? ~_GEN_4 : state_1_2)),
    .io_out_a_valid        (_TLBroadcastTracker_1_io_out_a_valid),
    .io_out_a_bits_opcode  (_TLBroadcastTracker_1_io_out_a_bits_opcode),
    .io_out_a_bits_param   (_TLBroadcastTracker_1_io_out_a_bits_param),
    .io_out_a_bits_size    (_TLBroadcastTracker_1_io_out_a_bits_size),
    .io_out_a_bits_source  (_TLBroadcastTracker_1_io_out_a_bits_source),
    .io_out_a_bits_address (_TLBroadcastTracker_1_io_out_a_bits_address),
    .io_out_a_bits_mask    (_TLBroadcastTracker_1_io_out_a_bits_mask),
    .io_out_a_bits_data    (_TLBroadcastTracker_1_io_out_a_bits_data),
    .io_probe_valid        (_sack_T & _filter_io_response_bits_mshr == 2'h1),
    .io_probe_bits_count   (~_filter_io_response_bits_allocOH),
    .io_probenack          (_GEN_2 & c_trackerOH_1),
    .io_probedack          (d_trackerOH[1] & _GEN_1 & d_drop),
    .io_probesack          (_c_first_T & c_trackerOH_1 & _clearOH_T_1 & _GEN_3),
    .io_d_last             (d_trackerOH[1] & _GEN & d_response & d_last),
    .io_e_last             (auto_in_e_bits_sink == 2'h1 & auto_in_e_valid),
    .io_source             (_TLBroadcastTracker_1_io_source),
    .io_line               (_TLBroadcastTracker_1_io_line),
    .io_idle               (_TLBroadcastTracker_1_io_idle),
    .io_need_d             (_TLBroadcastTracker_1_io_need_d)
  );
  TLBroadcastTracker_2 TLBroadcastTracker_2 (
    .clock                 (clock),
    .reset                 (reset),
    .io_in_a_first         (~(|a_first_counter)),
    .io_in_a_ready         (_TLBroadcastTracker_2_io_in_a_ready),
    .io_in_a_valid         (auto_in_a_valid & filter_io_request_bits_mshr_lo[2] & _GEN_8),
    .io_in_a_bits_opcode   (auto_in_a_bits_opcode),
    .io_in_a_bits_param    (auto_in_a_bits_param),
    .io_in_a_bits_size     (auto_in_a_bits_size),
    .io_in_a_bits_source   (auto_in_a_bits_source),
    .io_in_a_bits_address  (auto_in_a_bits_address),
    .io_in_a_bits_mask     (auto_in_a_bits_mask),
    .io_in_a_bits_data     (auto_in_a_bits_data),
    .io_out_a_ready        (auto_out_a_ready & (idle_1 ? ~_GEN_6 : state_1_3)),
    .io_out_a_valid        (_TLBroadcastTracker_2_io_out_a_valid),
    .io_out_a_bits_opcode  (_TLBroadcastTracker_2_io_out_a_bits_opcode),
    .io_out_a_bits_param   (_TLBroadcastTracker_2_io_out_a_bits_param),
    .io_out_a_bits_size    (_TLBroadcastTracker_2_io_out_a_bits_size),
    .io_out_a_bits_source  (_TLBroadcastTracker_2_io_out_a_bits_source),
    .io_out_a_bits_address (_TLBroadcastTracker_2_io_out_a_bits_address),
    .io_out_a_bits_mask    (_TLBroadcastTracker_2_io_out_a_bits_mask),
    .io_out_a_bits_data    (_TLBroadcastTracker_2_io_out_a_bits_data),
    .io_probe_valid        (_sack_T & _filter_io_response_bits_mshr == 2'h2),
    .io_probe_bits_count   (~_filter_io_response_bits_allocOH),
    .io_probenack          (_GEN_2 & c_trackerOH_2),
    .io_probedack          (d_trackerOH[2] & _GEN_1 & d_drop),
    .io_probesack          (_c_first_T & c_trackerOH_2 & _clearOH_T_1 & _GEN_3),
    .io_d_last             (d_trackerOH[2] & _GEN & d_response & d_last),
    .io_e_last             (auto_in_e_bits_sink == 2'h2 & auto_in_e_valid),
    .io_source             (_TLBroadcastTracker_2_io_source),
    .io_line               (_TLBroadcastTracker_2_io_line),
    .io_idle               (_TLBroadcastTracker_2_io_idle),
    .io_need_d             (_TLBroadcastTracker_2_io_need_d)
  );
  TLBroadcastTracker_3 TLBroadcastTracker_3 (
    .clock                 (clock),
    .reset                 (reset),
    .io_in_a_first         (~(|a_first_counter)),
    .io_in_a_ready         (_TLBroadcastTracker_3_io_in_a_ready),
    .io_in_a_valid         (auto_in_a_valid & filter_io_request_bits_mshr_lo[3] & _GEN_8),
    .io_in_a_bits_opcode   (auto_in_a_bits_opcode),
    .io_in_a_bits_param    (auto_in_a_bits_param),
    .io_in_a_bits_size     (auto_in_a_bits_size),
    .io_in_a_bits_source   (auto_in_a_bits_source),
    .io_in_a_bits_address  (auto_in_a_bits_address),
    .io_in_a_bits_mask     (auto_in_a_bits_mask),
    .io_in_a_bits_data     (auto_in_a_bits_data),
    .io_out_a_ready        (auto_out_a_ready & (idle_1 ? ~_GEN_5 : state_1_4)),
    .io_out_a_valid        (_TLBroadcastTracker_3_io_out_a_valid),
    .io_out_a_bits_opcode  (_TLBroadcastTracker_3_io_out_a_bits_opcode),
    .io_out_a_bits_param   (_TLBroadcastTracker_3_io_out_a_bits_param),
    .io_out_a_bits_size    (_TLBroadcastTracker_3_io_out_a_bits_size),
    .io_out_a_bits_source  (_TLBroadcastTracker_3_io_out_a_bits_source),
    .io_out_a_bits_address (_TLBroadcastTracker_3_io_out_a_bits_address),
    .io_out_a_bits_mask    (_TLBroadcastTracker_3_io_out_a_bits_mask),
    .io_out_a_bits_data    (_TLBroadcastTracker_3_io_out_a_bits_data),
    .io_probe_valid        (_sack_T & (&_filter_io_response_bits_mshr)),
    .io_probe_bits_count   (~_filter_io_response_bits_allocOH),
    .io_probenack          (_GEN_2 & c_trackerOH_3),
    .io_probedack          (d_trackerOH[3] & _GEN_1 & d_drop),
    .io_probesack          (_c_first_T & c_trackerOH_3 & _clearOH_T_1 & _GEN_3),
    .io_d_last             (d_trackerOH[3] & _GEN & d_response & d_last),
    .io_e_last             ((&auto_in_e_bits_sink) & auto_in_e_valid),
    .io_source             (_TLBroadcastTracker_3_io_source),
    .io_line               (_TLBroadcastTracker_3_io_line),
    .io_idle               (_TLBroadcastTracker_3_io_idle),
    .io_need_d             (_TLBroadcastTracker_3_io_need_d)
  );
  assign auto_in_a_ready = nodeIn_a_ready;
  assign auto_in_b_valid = probe_todo;
  assign auto_in_b_bits_param = probe_perms;
  assign auto_in_b_bits_address = nodeIn_b_bits_b_address;
  assign auto_in_c_ready = nodeIn_c_ready;
  assign auto_in_d_valid = nodeIn_d_valid;
  assign auto_in_d_bits_opcode = _nodeIn_d_bits_WIRE_10;
  assign auto_in_d_bits_param = _nodeIn_d_bits_WIRE_9;
  assign auto_in_d_bits_size = _nodeIn_d_bits_WIRE_8;
  assign auto_in_d_bits_source = _nodeIn_d_bits_WIRE_7;
  assign auto_in_d_bits_sink = _nodeIn_d_bits_WIRE_6;
  assign auto_in_d_bits_denied = _nodeIn_d_bits_WIRE_5;
  assign auto_in_d_bits_data = muxState_1 ? auto_out_d_bits_data : 64'h0;
  assign auto_in_d_bits_corrupt = _nodeIn_d_bits_WIRE_1;
  assign auto_out_a_valid = nodeOut_a_valid;
  assign auto_out_a_bits_opcode = (muxState_1_1 ? _TLBroadcastTracker_io_out_a_bits_opcode : 3'h0) | (muxState_1_2 ? _TLBroadcastTracker_1_io_out_a_bits_opcode : 3'h0) | (muxState_1_3 ? _TLBroadcastTracker_2_io_out_a_bits_opcode : 3'h0) | (muxState_1_4 ? _TLBroadcastTracker_3_io_out_a_bits_opcode : 3'h0);
  assign auto_out_a_bits_param = (muxState_1_1 ? _TLBroadcastTracker_io_out_a_bits_param : 3'h0) | (muxState_1_2 ? _TLBroadcastTracker_1_io_out_a_bits_param : 3'h0) | (muxState_1_3 ? _TLBroadcastTracker_2_io_out_a_bits_param : 3'h0) | (muxState_1_4 ? _TLBroadcastTracker_3_io_out_a_bits_param : 3'h0);
  assign auto_out_a_bits_size = (muxState_1_0 ? auto_in_c_bits_size : 3'h0) | (muxState_1_1 ? _TLBroadcastTracker_io_out_a_bits_size : 3'h0) | (muxState_1_2 ? _TLBroadcastTracker_1_io_out_a_bits_size : 3'h0) | (muxState_1_3 ? _TLBroadcastTracker_2_io_out_a_bits_size : 3'h0) | (muxState_1_4 ? _TLBroadcastTracker_3_io_out_a_bits_size : 3'h0);
  assign auto_out_a_bits_source = (muxState_1_0 ? {(&auto_in_c_bits_opcode) ? 2'h2 : 2'h1, (&auto_in_c_bits_opcode) ? auto_in_c_bits_source : (c_trackerOH_0 ? _TLBroadcastTracker_io_source : 6'h0) | (c_trackerOH_1 ? _TLBroadcastTracker_1_io_source : 6'h0) | (c_trackerOH_2 ? _TLBroadcastTracker_2_io_source : 6'h0) | (c_trackerOH_3 ? _TLBroadcastTracker_3_io_source : 6'h0)} : 8'h0) | (muxState_1_1 ? _TLBroadcastTracker_io_out_a_bits_source : 8'h0) | (muxState_1_2 ? _TLBroadcastTracker_1_io_out_a_bits_source : 8'h0) | (muxState_1_3 ? _TLBroadcastTracker_2_io_out_a_bits_source : 8'h0) | (muxState_1_4 ? _TLBroadcastTracker_3_io_out_a_bits_source : 8'h0);
  assign auto_out_a_bits_address = (muxState_1_0 ? auto_in_c_bits_address : 33'h0) | (muxState_1_1 ? _TLBroadcastTracker_io_out_a_bits_address : 33'h0) | (muxState_1_2 ? _TLBroadcastTracker_1_io_out_a_bits_address : 33'h0) | (muxState_1_3 ? _TLBroadcastTracker_2_io_out_a_bits_address : 33'h0) | (muxState_1_4 ? _TLBroadcastTracker_3_io_out_a_bits_address : 33'h0);
  assign auto_out_a_bits_mask = (muxState_1_0 ? {putfull_bits_a_mask_acc_5 | putfull_bits_a_mask_eq_5 & auto_in_c_bits_address[0], putfull_bits_a_mask_acc_5 | putfull_bits_a_mask_eq_5 & ~(auto_in_c_bits_address[0]), putfull_bits_a_mask_acc_4 | putfull_bits_a_mask_eq_4 & auto_in_c_bits_address[0], putfull_bits_a_mask_acc_4 | putfull_bits_a_mask_eq_4 & ~(auto_in_c_bits_address[0]), putfull_bits_a_mask_acc_3 | putfull_bits_a_mask_eq_3 & auto_in_c_bits_address[0], putfull_bits_a_mask_acc_3 | putfull_bits_a_mask_eq_3 & ~(auto_in_c_bits_address[0]), putfull_bits_a_mask_acc_2 | putfull_bits_a_mask_eq_2 & auto_in_c_bits_address[0], putfull_bits_a_mask_acc_2 | putfull_bits_a_mask_eq_2 & ~(auto_in_c_bits_address[0])} : 8'h0) | (muxState_1_1 ? _TLBroadcastTracker_io_out_a_bits_mask : 8'h0) | (muxState_1_2 ? _TLBroadcastTracker_1_io_out_a_bits_mask : 8'h0) | (muxState_1_3 ? _TLBroadcastTracker_2_io_out_a_bits_mask : 8'h0) | (muxState_1_4 ? _TLBroadcastTracker_3_io_out_a_bits_mask : 8'h0);
  assign auto_out_a_bits_data = (muxState_1_0 ? auto_in_c_bits_data : 64'h0) | (muxState_1_1 ? _TLBroadcastTracker_io_out_a_bits_data : 64'h0) | (muxState_1_2 ? _TLBroadcastTracker_1_io_out_a_bits_data : 64'h0) | (muxState_1_3 ? _TLBroadcastTracker_2_io_out_a_bits_data : 64'h0) | (muxState_1_4 ? _TLBroadcastTracker_3_io_out_a_bits_data : 64'h0);
  assign auto_out_d_ready = nodeOut_d_ready;
endmodule

