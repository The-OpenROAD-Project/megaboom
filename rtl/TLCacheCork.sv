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

module TLCacheCork(
  input         clock,
                reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
                auto_in_a_bits_size,
                auto_in_a_bits_source,
  input  [32:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
  output        auto_in_c_ready,
  input         auto_in_c_valid,
  input  [2:0]  auto_in_c_bits_opcode,
                auto_in_c_bits_param,
                auto_in_c_bits_size,
                auto_in_c_bits_source,
  input  [32:0] auto_in_c_bits_address,
  input  [63:0] auto_in_c_bits_data,
  input         auto_in_c_bits_corrupt,
                auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [2:0]  auto_in_d_bits_size,
                auto_in_d_bits_source,
                auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_in_e_valid,
  input  [2:0]  auto_in_e_bits_sink,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
                auto_out_a_bits_param,
                auto_out_a_bits_size,
  output [3:0]  auto_out_a_bits_source,
  output [32:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
                auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [2:0]  auto_out_d_bits_size,
  input  [3:0]  auto_out_d_bits_source,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt
);

  wire [2:0]  _in_d_bits_WIRE_10;
  wire        in_d_valid;
  wire        a_a_ready;
  wire        c_a_ready;
  wire        nodeIn_d_valid;
  wire        _q_1_io_enq_ready;
  wire        _q_1_io_deq_valid;
  wire [2:0]  _q_1_io_deq_bits_opcode;
  wire [1:0]  _q_1_io_deq_bits_param;
  wire [2:0]  _q_1_io_deq_bits_size;
  wire [2:0]  _q_1_io_deq_bits_source;
  wire        _q_1_io_deq_bits_denied;
  wire [63:0] _q_1_io_deq_bits_data;
  wire        _q_1_io_deq_bits_corrupt;
  wire        _q_io_enq_ready;
  wire        _q_io_deq_valid;
  wire [2:0]  _q_io_deq_bits_opcode;
  wire [1:0]  _q_io_deq_bits_param;
  wire [2:0]  _q_io_deq_bits_size;
  wire [2:0]  _q_io_deq_bits_source;
  wire        _q_io_deq_bits_denied;
  wire [63:0] _q_io_deq_bits_data;
  wire        _q_io_deq_bits_corrupt;
  wire        _pool_io_alloc_valid;
  wire [2:0]  _pool_io_alloc_bits;
  wire        _toD_T = auto_in_a_bits_opcode == 3'h6;
  wire        toD = _toD_T & auto_in_a_bits_param == 3'h2 | (&auto_in_a_bits_opcode);
  wire        nodeIn_a_ready = toD ? _q_1_io_enq_ready : a_a_ready;
  wire        a_a_valid = auto_in_a_valid & ~toD;
  wire        _GEN = _toD_T | (&auto_in_a_bits_opcode);
  wire [2:0]  a_a_bits_opcode = _GEN ? 3'h4 : auto_in_a_bits_opcode;
  wire        winner_0 = auto_in_c_valid & (&auto_in_c_bits_opcode);
  wire        _c_a_bits_a_mask_T = auto_in_c_bits_size > 3'h2;
  wire        c_a_bits_a_mask_size = auto_in_c_bits_size[1:0] == 2'h2;
  wire        c_a_bits_a_mask_acc = _c_a_bits_a_mask_T | c_a_bits_a_mask_size & ~(auto_in_c_bits_address[2]);
  wire        c_a_bits_a_mask_acc_1 = _c_a_bits_a_mask_T | c_a_bits_a_mask_size & auto_in_c_bits_address[2];
  wire        c_a_bits_a_mask_size_1 = auto_in_c_bits_size[1:0] == 2'h1;
  wire        c_a_bits_a_mask_eq_2 = ~(auto_in_c_bits_address[2]) & ~(auto_in_c_bits_address[1]);
  wire        c_a_bits_a_mask_acc_2 = c_a_bits_a_mask_acc | c_a_bits_a_mask_size_1 & c_a_bits_a_mask_eq_2;
  wire        c_a_bits_a_mask_eq_3 = ~(auto_in_c_bits_address[2]) & auto_in_c_bits_address[1];
  wire        c_a_bits_a_mask_acc_3 = c_a_bits_a_mask_acc | c_a_bits_a_mask_size_1 & c_a_bits_a_mask_eq_3;
  wire        c_a_bits_a_mask_eq_4 = auto_in_c_bits_address[2] & ~(auto_in_c_bits_address[1]);
  wire        c_a_bits_a_mask_acc_4 = c_a_bits_a_mask_acc_1 | c_a_bits_a_mask_size_1 & c_a_bits_a_mask_eq_4;
  wire        c_a_bits_a_mask_eq_5 = auto_in_c_bits_address[2] & auto_in_c_bits_address[1];
  wire        c_a_bits_a_mask_acc_5 = c_a_bits_a_mask_acc_1 | c_a_bits_a_mask_size_1 & c_a_bits_a_mask_eq_5;
  wire        _nodeIn_c_ready_T = auto_in_c_bits_opcode == 3'h6;
  wire        nodeIn_c_ready = _nodeIn_c_ready_T ? _q_io_enq_ready : c_a_ready;
  reg  [2:0]  d_first_counter;
  wire        d_grant = _in_d_bits_WIRE_10 == 3'h5 | _in_d_bits_WIRE_10 == 3'h4;
  assign nodeIn_d_valid = in_d_valid & (_pool_io_alloc_valid | (|d_first_counter) | ~d_grant);
  wire        in_d_ready = auto_in_d_ready & (_pool_io_alloc_valid | (|d_first_counter) | ~d_grant);
  reg  [2:0]  nodeIn_d_bits_sink_r;
  wire [2:0]  nodeIn_d_bits_sink = (|d_first_counter) ? nodeIn_d_bits_sink_r : _pool_io_alloc_bits;
  wire        _GEN_0 = auto_out_d_bits_opcode == 3'h1 & auto_out_d_bits_source[0];
  wire [2:0]  d_d_bits_opcode = auto_out_d_bits_opcode == 3'h0 & ~(auto_out_d_bits_source[0]) ? 3'h6 : _GEN_0 ? 3'h5 : auto_out_d_bits_opcode;
  reg  [2:0]  beatsLeft;
  wire        idle = beatsLeft == 3'h0;
  wire        winner_1 = ~winner_0 & a_a_valid;
  wire        _nodeOut_a_valid_T = winner_0 | a_a_valid;
  reg         state_0;
  reg         state_1;
  wire        muxState_0 = idle ? winner_0 : state_0;
  wire        muxState_1 = idle ? winner_1 : state_1;
  assign c_a_ready = auto_out_a_ready & (idle | state_0);
  assign a_a_ready = auto_out_a_ready & (idle ? ~winner_0 : state_1);
  wire        nodeOut_a_valid = idle ? _nodeOut_a_valid_T : state_0 & winner_0 | state_1 & a_a_valid;
  reg  [2:0]  beatsLeft_1;
  wire        idle_1 = beatsLeft_1 == 3'h0;
  wire        _GEN_1 = _q_io_deq_valid | auto_out_d_valid;
  wire        winner_1_1 = ~auto_out_d_valid & _q_io_deq_valid;
  wire        winner_1_2 = ~_GEN_1 & _q_1_io_deq_valid;
  wire        _in_d_valid_T = auto_out_d_valid | _q_io_deq_valid;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~(~auto_in_c_valid | _nodeIn_c_ready_T | (&auto_in_c_bits_opcode))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at CacheCork.scala:108 assert (!in.c.valid || in.c.bits.opcode === Release || in.c.bits.opcode === ReleaseData)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~winner_0 | ~winner_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~_nodeOut_a_valid_T | winner_0 | winner_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~((~auto_out_d_valid | ~winner_1_1) & (~(auto_out_d_valid | winner_1_1) | ~winner_1_2))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~(_in_d_valid_T | _q_1_io_deq_valid) | auto_out_d_valid | winner_1_1 | winner_1_2)) begin
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
  wire        muxState_1_0 = idle_1 ? auto_out_d_valid : state_1_0;
  wire        muxState_1_1 = idle_1 ? winner_1_1 : state_1_1;
  wire        muxState_1_2 = idle_1 ? winner_1_2 : state_1_2;
  assign in_d_valid = idle_1 ? _in_d_valid_T | _q_1_io_deq_valid : state_1_0 & auto_out_d_valid | state_1_1 & _q_io_deq_valid | state_1_2 & _q_1_io_deq_valid;
  wire        _in_d_bits_WIRE_1 = muxState_1_0 & auto_out_d_bits_corrupt | muxState_1_1 & _q_io_deq_bits_corrupt | muxState_1_2 & _q_1_io_deq_bits_corrupt;
  wire        _in_d_bits_WIRE_5 = muxState_1_0 & auto_out_d_bits_denied | muxState_1_1 & _q_io_deq_bits_denied | muxState_1_2 & _q_1_io_deq_bits_denied;
  wire [2:0]  _in_d_bits_WIRE_7 = (muxState_1_0 ? auto_out_d_bits_source[3:1] : 3'h0) | (muxState_1_1 ? _q_io_deq_bits_source : 3'h0) | (muxState_1_2 ? _q_1_io_deq_bits_source : 3'h0);
  wire [2:0]  _in_d_bits_WIRE_8 = (muxState_1_0 ? auto_out_d_bits_size : 3'h0) | (muxState_1_1 ? _q_io_deq_bits_size : 3'h0) | (muxState_1_2 ? _q_1_io_deq_bits_size : 3'h0);
  wire [1:0]  _in_d_bits_WIRE_9 = (~muxState_1_0 | _GEN_0 ? 2'h0 : auto_out_d_bits_param) | (muxState_1_1 ? _q_io_deq_bits_param : 2'h0) | (muxState_1_2 ? _q_1_io_deq_bits_param : 2'h0);
  assign _in_d_bits_WIRE_10 = (muxState_1_0 ? d_d_bits_opcode : 3'h0) | (muxState_1_1 ? _q_io_deq_bits_opcode : 3'h0) | (muxState_1_2 ? _q_1_io_deq_bits_opcode : 3'h0);
  wire [12:0] _d_first_beats1_decode_T_1 = 13'h3F << _in_d_bits_WIRE_8;
  wire [12:0] _decode_T_5 = 13'h3F << auto_in_a_bits_size;
  wire [12:0] _decode_T_1 = 13'h3F << auto_in_c_bits_size;
  wire [12:0] _decode_T_9 = 13'h3F << auto_out_d_bits_size;
  wire        _beatsLeft_T_4 = in_d_ready & in_d_valid;
  always @(posedge clock) begin
    if (reset) begin
      d_first_counter <= 3'h0;
      beatsLeft <= 3'h0;
      state_0 <= 1'h0;
      state_1 <= 1'h0;
      beatsLeft_1 <= 3'h0;
      state_1_0 <= 1'h0;
      state_1_1 <= 1'h0;
      state_1_2 <= 1'h0;
    end
    else begin
      if (_beatsLeft_T_4) begin
        if (|d_first_counter)
          d_first_counter <= d_first_counter - 3'h1;
        else
          d_first_counter <= _in_d_bits_WIRE_10[0] ? ~(_d_first_beats1_decode_T_1[5:3]) : 3'h0;
      end
      if (idle & auto_out_a_ready)
        beatsLeft <= (winner_0 ? ~(_decode_T_1[5:3]) : 3'h0) | (winner_1 & ~(a_a_bits_opcode[2]) ? ~(_decode_T_5[5:3]) : 3'h0);
      else
        beatsLeft <= beatsLeft - {2'h0, auto_out_a_ready & nodeOut_a_valid};
      if (idle) begin
        state_0 <= winner_0;
        state_1 <= winner_1;
      end
      if (idle_1 & in_d_ready)
        beatsLeft_1 <= auto_out_d_valid & d_d_bits_opcode[0] ? ~(_decode_T_9[5:3]) : 3'h0;
      else
        beatsLeft_1 <= beatsLeft_1 - {2'h0, _beatsLeft_T_4};
      if (idle_1) begin
        state_1_0 <= auto_out_d_valid;
        state_1_1 <= winner_1_1;
        state_1_2 <= winner_1_2;
      end
    end
    if (~(|d_first_counter))
      nodeIn_d_bits_sink_r <= _pool_io_alloc_bits;
  end // always @(posedge)
  TLMonitor_37 monitor (
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
    .io_in_d_bits_opcode  (_in_d_bits_WIRE_10),
    .io_in_d_bits_param   (_in_d_bits_WIRE_9),
    .io_in_d_bits_size    (_in_d_bits_WIRE_8),
    .io_in_d_bits_source  (_in_d_bits_WIRE_7),
    .io_in_d_bits_sink    (nodeIn_d_bits_sink),
    .io_in_d_bits_denied  (_in_d_bits_WIRE_5),
    .io_in_d_bits_corrupt (_in_d_bits_WIRE_1),
    .io_in_e_valid        (auto_in_e_valid),
    .io_in_e_bits_sink    (auto_in_e_bits_sink)
  );
  IDPool pool (
    .clock          (clock),
    .reset          (reset),
    .io_free_valid  (auto_in_e_valid),
    .io_free_bits   (auto_in_e_bits_sink),
    .io_alloc_ready (auto_in_d_ready & nodeIn_d_valid & ~(|d_first_counter) & d_grant),
    .io_alloc_valid (_pool_io_alloc_valid),
    .io_alloc_bits  (_pool_io_alloc_bits)
  );
  Queue_25 q (
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (_q_io_enq_ready),
    .io_enq_valid        (auto_in_c_valid & _nodeIn_c_ready_T),
    .io_enq_bits_opcode  (3'h6),
    .io_enq_bits_param   (2'h0),
    .io_enq_bits_size    (auto_in_c_bits_size),
    .io_enq_bits_source  (auto_in_c_bits_source),
    .io_enq_bits_sink    (3'h0),
    .io_enq_bits_denied  (1'h0),
    .io_enq_bits_data    (64'h0),
    .io_enq_bits_corrupt (1'h0),
    .io_deq_ready        (in_d_ready & (idle_1 ? ~auto_out_d_valid : state_1_1)),
    .io_deq_valid        (_q_io_deq_valid),
    .io_deq_bits_opcode  (_q_io_deq_bits_opcode),
    .io_deq_bits_param   (_q_io_deq_bits_param),
    .io_deq_bits_size    (_q_io_deq_bits_size),
    .io_deq_bits_source  (_q_io_deq_bits_source),
    .io_deq_bits_sink    (/* unused */),
    .io_deq_bits_denied  (_q_io_deq_bits_denied),
    .io_deq_bits_data    (_q_io_deq_bits_data),
    .io_deq_bits_corrupt (_q_io_deq_bits_corrupt)
  );
  Queue_25 q_1 (
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (_q_1_io_enq_ready),
    .io_enq_valid        (auto_in_a_valid & toD),
    .io_enq_bits_opcode  (3'h4),
    .io_enq_bits_param   (2'h0),
    .io_enq_bits_size    (auto_in_a_bits_size),
    .io_enq_bits_source  (auto_in_a_bits_source),
    .io_enq_bits_sink    (3'h0),
    .io_enq_bits_denied  (1'h0),
    .io_enq_bits_data    (64'h0),
    .io_enq_bits_corrupt (1'h0),
    .io_deq_ready        (in_d_ready & (idle_1 ? ~_GEN_1 : state_1_2)),
    .io_deq_valid        (_q_1_io_deq_valid),
    .io_deq_bits_opcode  (_q_1_io_deq_bits_opcode),
    .io_deq_bits_param   (_q_1_io_deq_bits_param),
    .io_deq_bits_size    (_q_1_io_deq_bits_size),
    .io_deq_bits_source  (_q_1_io_deq_bits_source),
    .io_deq_bits_sink    (/* unused */),
    .io_deq_bits_denied  (_q_1_io_deq_bits_denied),
    .io_deq_bits_data    (_q_1_io_deq_bits_data),
    .io_deq_bits_corrupt (_q_1_io_deq_bits_corrupt)
  );
  assign auto_in_a_ready = nodeIn_a_ready;
  assign auto_in_c_ready = nodeIn_c_ready;
  assign auto_in_d_valid = nodeIn_d_valid;
  assign auto_in_d_bits_opcode = _in_d_bits_WIRE_10;
  assign auto_in_d_bits_param = _in_d_bits_WIRE_9;
  assign auto_in_d_bits_size = _in_d_bits_WIRE_8;
  assign auto_in_d_bits_source = _in_d_bits_WIRE_7;
  assign auto_in_d_bits_sink = nodeIn_d_bits_sink;
  assign auto_in_d_bits_denied = _in_d_bits_WIRE_5;
  assign auto_in_d_bits_data = (muxState_1_0 ? auto_out_d_bits_data : 64'h0) | (muxState_1_1 ? _q_io_deq_bits_data : 64'h0) | (muxState_1_2 ? _q_1_io_deq_bits_data : 64'h0);
  assign auto_in_d_bits_corrupt = _in_d_bits_WIRE_1;
  assign auto_out_a_valid = nodeOut_a_valid;
  assign auto_out_a_bits_opcode = muxState_1 ? a_a_bits_opcode : 3'h0;
  assign auto_out_a_bits_param = ~muxState_1 | _GEN ? 3'h0 : auto_in_a_bits_param;
  assign auto_out_a_bits_size = (muxState_0 ? auto_in_c_bits_size : 3'h0) | (muxState_1 ? auto_in_a_bits_size : 3'h0);
  assign auto_out_a_bits_source = (muxState_0 ? {auto_in_c_bits_source, 1'h0} : 4'h0) | (muxState_1 ? {auto_in_a_bits_source, _GEN | auto_in_a_bits_opcode == 3'h0 | auto_in_a_bits_opcode == 3'h1} : 4'h0);
  assign auto_out_a_bits_address = (muxState_0 ? auto_in_c_bits_address : 33'h0) | (muxState_1 ? auto_in_a_bits_address : 33'h0);
  assign auto_out_a_bits_mask = (muxState_0 ? {c_a_bits_a_mask_acc_5 | c_a_bits_a_mask_eq_5 & auto_in_c_bits_address[0], c_a_bits_a_mask_acc_5 | c_a_bits_a_mask_eq_5 & ~(auto_in_c_bits_address[0]), c_a_bits_a_mask_acc_4 | c_a_bits_a_mask_eq_4 & auto_in_c_bits_address[0], c_a_bits_a_mask_acc_4 | c_a_bits_a_mask_eq_4 & ~(auto_in_c_bits_address[0]), c_a_bits_a_mask_acc_3 | c_a_bits_a_mask_eq_3 & auto_in_c_bits_address[0], c_a_bits_a_mask_acc_3 | c_a_bits_a_mask_eq_3 & ~(auto_in_c_bits_address[0]), c_a_bits_a_mask_acc_2 | c_a_bits_a_mask_eq_2 & auto_in_c_bits_address[0], c_a_bits_a_mask_acc_2 | c_a_bits_a_mask_eq_2 & ~(auto_in_c_bits_address[0])} : 8'h0) | (muxState_1 ? auto_in_a_bits_mask : 8'h0);
  assign auto_out_a_bits_data = (muxState_0 ? auto_in_c_bits_data : 64'h0) | (muxState_1 ? auto_in_a_bits_data : 64'h0);
  assign auto_out_a_bits_corrupt = muxState_0 & auto_in_c_bits_corrupt | muxState_1 & auto_in_a_bits_corrupt;
  assign auto_out_d_ready = in_d_ready & (idle_1 | state_1_0);
endmodule

