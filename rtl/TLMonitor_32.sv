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

module TLMonitor_32(
  input        clock,
               reset,
               io_in_a_ready,
               io_in_a_valid,
  input [32:0] io_in_a_bits_address,
  input        io_in_d_valid,
  input [2:0]  io_in_d_bits_opcode,
  input [1:0]  io_in_d_bits_param,
  input [3:0]  io_in_d_bits_size,
  input [1:0]  io_in_d_bits_sink,
  input        io_in_d_bits_denied,
               io_in_d_bits_corrupt
);

  wire [31:0] _plusarg_reader_1_out;
  wire [31:0] _plusarg_reader_out;
  wire        _a_first_T_1 = io_in_a_ready & io_in_a_valid;
  reg  [7:0]  a_first_counter;
  reg  [32:0] address;
  reg  [7:0]  d_first_counter;
  reg  [2:0]  opcode_1;
  reg  [1:0]  param_1;
  reg  [3:0]  size_1;
  reg  [1:0]  sink;
  reg         denied;
  reg         inflight;
  reg  [3:0]  inflight_opcodes;
  reg  [7:0]  inflight_sizes;
  reg  [7:0]  a_first_counter_1;
  wire        a_first_1 = a_first_counter_1 == 8'h0;
  reg  [7:0]  d_first_counter_1;
  wire        d_first_1 = d_first_counter_1 == 8'h0;
  wire        a_set = _a_first_T_1 & a_first_1;
  wire        d_release_ack = io_in_d_bits_opcode == 3'h6;
  wire        _GEN = io_in_d_valid & d_first_1;
  wire        d_clr_wo_ready = _GEN & ~d_release_ack;
  reg  [2:0]  casez_tmp;
  always @(*) begin
    casez (inflight_opcodes[3:1])
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
  reg  [2:0]  casez_tmp_0;
  always @(*) begin
    casez (inflight_opcodes[3:1])
      3'b000:
        casez_tmp_0 = 3'h0;
      3'b001:
        casez_tmp_0 = 3'h0;
      3'b010:
        casez_tmp_0 = 3'h1;
      3'b011:
        casez_tmp_0 = 3'h1;
      3'b100:
        casez_tmp_0 = 3'h1;
      3'b101:
        casez_tmp_0 = 3'h2;
      3'b110:
        casez_tmp_0 = 3'h5;
      default:
        casez_tmp_0 = 3'h4;
    endcase
  end // always @(*)
  reg  [31:0] watchdog;
  reg         inflight_1;
  reg  [7:0]  inflight_sizes_1;
  reg  [7:0]  d_first_counter_2;
  wire        d_first_2 = d_first_counter_2 == 8'h0;
  wire        d_clr_1 = io_in_d_valid & d_first_2 & d_release_ack;
  reg  [31:0] watchdog_1;
  `ifndef SYNTHESIS
    wire       _GEN_0 = io_in_a_valid & ~reset;
    wire       _GEN_1 = io_in_d_valid & io_in_d_bits_opcode == 3'h6 & ~reset;
    wire       _GEN_2 = io_in_d_bits_size[3:2] == 2'h0;
    wire       _GEN_3 = io_in_d_valid & io_in_d_bits_opcode == 3'h4 & ~reset;
    wire       _GEN_4 = io_in_d_bits_param == 2'h2;
    wire       _GEN_5 = io_in_d_valid & io_in_d_bits_opcode == 3'h5 & ~reset;
    wire       _GEN_6 = ~io_in_d_bits_denied | io_in_d_bits_corrupt;
    wire       _GEN_7 = io_in_d_valid & io_in_d_bits_opcode == 3'h0 & ~reset;
    wire       _GEN_8 = io_in_d_bits_opcode == 3'h1;
    wire       _GEN_9 = io_in_d_valid & _GEN_8 & ~reset;
    wire       _GEN_10 = io_in_d_valid & io_in_d_bits_opcode == 3'h2 & ~reset;
    wire       _GEN_11 = io_in_d_valid & (|d_first_counter) & ~reset;
    wire       a_set_wo_ready = io_in_a_valid & a_first_1;
    wire       _GEN_12 = d_clr_wo_ready & a_set_wo_ready & ~reset;
    wire       _GEN_13 = d_clr_wo_ready & ~a_set_wo_ready & ~reset;
    wire [7:0] _GEN_14 = {4'h0, io_in_d_bits_size};
    wire       _GEN_15 = d_clr_1 & ~reset;
    always @(posedge clock) begin
      if (_GEN_0 & ~({io_in_a_bits_address[32:14], ~(io_in_a_bits_address[13:12])} == 21'h0 | io_in_a_bits_address[32:13] == 20'h0 | {io_in_a_bits_address[32:17], ~(io_in_a_bits_address[16])} == 17'h0 | {io_in_a_bits_address[32:21], io_in_a_bits_address[20:17] ^ 4'h8, io_in_a_bits_address[15:12]} == 20'h0 | {io_in_a_bits_address[32:26], io_in_a_bits_address[25:16] ^ 10'h200} == 17'h0 | {io_in_a_bits_address[32:28], ~(io_in_a_bits_address[27:26])} == 7'h0 | {io_in_a_bits_address[32], ~(io_in_a_bits_address[31])} == 2'h0 | io_in_a_bits_address[32:31] == 2'h2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Get type which slave claims it can't support (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_0 & (|(io_in_a_bits_address[5:0]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get address not aligned to size (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_in_d_valid & ~reset & (&io_in_d_bits_opcode)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel has invalid opcode (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_1 & _GEN_2) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_1 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_1 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck is corrupt (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_1 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck is denied (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_3 & _GEN_2) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant smaller than a beat (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_3 & (&io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries invalid cap param (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_3 & _GEN_4) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries toN param (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_3 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant is corrupt (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_5 & _GEN_2) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData smaller than a beat (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_5 & (&io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries invalid cap param (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_5 & _GEN_4) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries toN param (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_5 & ~_GEN_6) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_7 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck carries invalid param (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_7 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck is corrupt (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_9 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData carries invalid param (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_9 & ~_GEN_6) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_10 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck carries invalid param (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_10 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck is corrupt (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_in_a_valid & (|a_first_counter) & ~reset & io_in_a_bits_address != address) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel address changed with multibeat operation (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & io_in_d_bits_opcode != opcode_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel opcode changed within multibeat operation (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & io_in_d_bits_param != param_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel param changed within multibeat operation (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & io_in_d_bits_size != size_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel size changed within multibeat operation (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & io_in_d_bits_sink != sink) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel sink changed with multibeat operation (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & io_in_d_bits_denied != denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel denied changed with multibeat operation (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (a_set & ~reset & inflight) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel re-used a source ID (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (d_clr_wo_ready & ~reset & ~(inflight | a_set_wo_ready)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_12 & ~_GEN_8) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper opcode response (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_12 & io_in_d_bits_size != 4'h6) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & ~(io_in_d_bits_opcode == casez_tmp | io_in_d_bits_opcode == casez_tmp_0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper opcode response (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & _GEN_14 != {1'h0, inflight_sizes[7:1]}) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN & a_first_1 & io_in_a_valid & ~d_release_ack & ~reset & ~io_in_a_ready) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: ready check\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(a_set_wo_ready != d_clr_wo_ready | ~a_set_wo_ready)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' and 'D' concurrent, despite minlatency 3 (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~inflight | _plusarg_reader_out == 32'h0 | watchdog < _plusarg_reader_out)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: TileLink timeout expired (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15 & ~inflight_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15 & _GEN_14 != {1'h0, inflight_sizes_1[7:1]}) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~inflight_1 | _plusarg_reader_1_out == 32'h0 | watchdog_1 < _plusarg_reader_1_out)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: TileLink timeout expired (connected at generators/boom/src/main/scala/common/tile.scala:138:71)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [26:0] _GEN_16 = {23'h0, io_in_d_bits_size};
  wire [26:0] _d_first_beats1_decode_T_1 = 27'hFFF << _GEN_16;
  wire [26:0] _d_first_beats1_decode_T_5 = 27'hFFF << _GEN_16;
  wire [26:0] _d_first_beats1_decode_T_9 = 27'hFFF << _GEN_16;
  always @(posedge clock) begin
    if (reset) begin
      a_first_counter <= 8'h0;
      d_first_counter <= 8'h0;
      inflight <= 1'h0;
      inflight_opcodes <= 4'h0;
      inflight_sizes <= 8'h0;
      a_first_counter_1 <= 8'h0;
      d_first_counter_1 <= 8'h0;
      watchdog <= 32'h0;
      inflight_1 <= 1'h0;
      inflight_sizes_1 <= 8'h0;
      d_first_counter_2 <= 8'h0;
      watchdog_1 <= 32'h0;
    end
    else begin
      if (_a_first_T_1) begin
        if (|a_first_counter)
          a_first_counter <= a_first_counter - 8'h1;
        else
          a_first_counter <= 8'h0;
        if (a_first_1)
          a_first_counter_1 <= 8'h0;
        else
          a_first_counter_1 <= a_first_counter_1 - 8'h1;
      end
      if (io_in_d_valid) begin
        if (|d_first_counter)
          d_first_counter <= d_first_counter - 8'h1;
        else
          d_first_counter <= io_in_d_bits_opcode[0] ? ~(_d_first_beats1_decode_T_1[11:4]) : 8'h0;
        if (d_first_1)
          d_first_counter_1 <= io_in_d_bits_opcode[0] ? ~(_d_first_beats1_decode_T_5[11:4]) : 8'h0;
        else
          d_first_counter_1 <= d_first_counter_1 - 8'h1;
        if (d_first_2)
          d_first_counter_2 <= io_in_d_bits_opcode[0] ? ~(_d_first_beats1_decode_T_9[11:4]) : 8'h0;
        else
          d_first_counter_2 <= d_first_counter_2 - 8'h1;
        watchdog_1 <= 32'h0;
      end
      else
        watchdog_1 <= watchdog_1 + 32'h1;
      inflight <= (inflight | a_set) & ~d_clr_wo_ready;
      inflight_opcodes <= (inflight_opcodes | (a_set ? 4'h9 : 4'h0)) & ~{4{d_clr_wo_ready}};
      inflight_sizes <= (inflight_sizes | (a_set ? {3'h0, a_set ? 5'hD : 5'h0} : 8'h0)) & ~{8{d_clr_wo_ready}};
      if (_a_first_T_1 | io_in_d_valid)
        watchdog <= 32'h0;
      else
        watchdog <= watchdog + 32'h1;
      inflight_1 <= inflight_1 & ~d_clr_1;
      inflight_sizes_1 <= inflight_sizes_1 & ~{8{d_clr_1}};
    end
    if (_a_first_T_1 & ~(|a_first_counter))
      address <= io_in_a_bits_address;
    if (io_in_d_valid & ~(|d_first_counter)) begin
      opcode_1 <= io_in_d_bits_opcode;
      param_1 <= io_in_d_bits_param;
      size_1 <= io_in_d_bits_size;
      sink <= io_in_d_bits_sink;
      denied <= io_in_d_bits_denied;
    end
  end // always @(posedge)
  plusarg_reader #(
    .DEFAULT(0),
    .FORMAT("tilelink_timeout=%d"),
    .WIDTH(32)
  ) plusarg_reader (
    .out (_plusarg_reader_out)
  );
  plusarg_reader #(
    .DEFAULT(0),
    .FORMAT("tilelink_timeout=%d"),
    .WIDTH(32)
  ) plusarg_reader_1 (
    .out (_plusarg_reader_1_out)
  );
endmodule

