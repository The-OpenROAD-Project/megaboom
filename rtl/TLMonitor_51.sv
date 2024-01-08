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

module TLMonitor_51(
  input       clock,
              reset,
              io_in_a_ready,
              io_in_a_valid,
  input [2:0] io_in_a_bits_opcode,
  input [8:0] io_in_a_bits_address,
  input       io_in_d_ready,
              io_in_d_valid,
  input [2:0] io_in_d_bits_opcode,
  input [1:0] io_in_d_bits_param,
              io_in_d_bits_size,
  input       io_in_d_bits_source,
              io_in_d_bits_sink,
              io_in_d_bits_denied,
              io_in_d_bits_corrupt
);

  wire [31:0] _plusarg_reader_1_out;
  wire [31:0] _plusarg_reader_out;
  wire        a_first_done = io_in_a_ready & io_in_a_valid;
  reg         a_first_counter;
  reg  [2:0]  opcode;
  reg  [8:0]  address;
  reg         d_first_counter;
  reg  [2:0]  opcode_1;
  reg  [1:0]  param_1;
  reg  [1:0]  size_1;
  reg         source_1;
  reg         sink;
  reg         denied;
  reg         inflight;
  reg  [3:0]  inflight_opcodes;
  reg  [3:0]  inflight_sizes;
  reg         a_first_counter_1;
  reg         d_first_counter_1;
  wire [3:0]  _GEN = {1'h0, io_in_d_bits_source, 2'h0};
  wire [3:0]  _a_opcode_lookup_T_1 = inflight_opcodes >> _GEN;
  wire        a_set = a_first_done & ~a_first_counter_1;
  wire        d_release_ack = io_in_d_bits_opcode == 3'h6;
  reg  [2:0]  casez_tmp;
  always @(*) begin
    casez (io_in_a_bits_opcode)
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
    casez (io_in_a_bits_opcode)
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
  reg  [2:0]  casez_tmp_1;
  always @(*) begin
    casez (_a_opcode_lookup_T_1[3:1])
      3'b000:
        casez_tmp_1 = 3'h0;
      3'b001:
        casez_tmp_1 = 3'h0;
      3'b010:
        casez_tmp_1 = 3'h1;
      3'b011:
        casez_tmp_1 = 3'h1;
      3'b100:
        casez_tmp_1 = 3'h1;
      3'b101:
        casez_tmp_1 = 3'h2;
      3'b110:
        casez_tmp_1 = 3'h4;
      default:
        casez_tmp_1 = 3'h4;
    endcase
  end // always @(*)
  reg  [2:0]  casez_tmp_2;
  always @(*) begin
    casez (_a_opcode_lookup_T_1[3:1])
      3'b000:
        casez_tmp_2 = 3'h0;
      3'b001:
        casez_tmp_2 = 3'h0;
      3'b010:
        casez_tmp_2 = 3'h1;
      3'b011:
        casez_tmp_2 = 3'h1;
      3'b100:
        casez_tmp_2 = 3'h1;
      3'b101:
        casez_tmp_2 = 3'h2;
      3'b110:
        casez_tmp_2 = 3'h5;
      default:
        casez_tmp_2 = 3'h4;
    endcase
  end // always @(*)
  reg  [31:0] watchdog;
  reg         inflight_1;
  reg  [3:0]  inflight_sizes_1;
  reg         d_first_counter_2;
  reg  [31:0] watchdog_1;
  `ifndef SYNTHESIS
    wire       _GEN_0 = io_in_a_valid & io_in_a_bits_opcode == 3'h6 & ~reset;
    wire       _GEN_1 = io_in_a_valid & (&io_in_a_bits_opcode) & ~reset;
    wire [4:0] _GEN_2 = io_in_a_bits_address[6:2] ^ 5'h11;
    wire       _GEN_3 = io_in_a_bits_address[8:6] == 3'h0 | {io_in_a_bits_address[8:7], _GEN_2[4:2], _GEN_2[0]} == 6'h0 | {io_in_a_bits_address[8:7], io_in_a_bits_address[6:3] ^ 4'hB} == 6'h0 | {io_in_a_bits_address[8:7], ~(io_in_a_bits_address[6:5])} == 4'h0 | {io_in_a_bits_address[8], ~(io_in_a_bits_address[7])} == 2'h0 | io_in_a_bits_address[8];
    wire       _GEN_4 = io_in_a_valid & io_in_a_bits_opcode == 3'h4 & ~reset;
    wire       _GEN_5 = io_in_a_valid & io_in_a_bits_opcode == 3'h0 & ~reset;
    wire       _GEN_6 = io_in_a_valid & io_in_a_bits_opcode == 3'h1 & ~reset;
    wire       _GEN_7 = io_in_a_valid & io_in_a_bits_opcode == 3'h2 & ~reset;
    wire       _GEN_8 = io_in_a_valid & io_in_a_bits_opcode == 3'h3 & ~reset;
    wire       _GEN_9 = io_in_a_valid & io_in_a_bits_opcode == 3'h5 & ~reset;
    wire       _GEN_10 = io_in_d_valid & io_in_d_bits_opcode == 3'h6 & ~reset;
    wire       _GEN_11 = io_in_d_valid & io_in_d_bits_opcode == 3'h4 & ~reset;
    wire       _GEN_12 = io_in_d_bits_param == 2'h2;
    wire       _GEN_13 = io_in_d_valid & io_in_d_bits_opcode == 3'h5 & ~reset;
    wire       _GEN_14 = ~io_in_d_bits_denied | io_in_d_bits_corrupt;
    wire       _GEN_15 = io_in_d_valid & io_in_d_bits_opcode == 3'h0 & ~reset;
    wire       _GEN_16 = io_in_d_valid & io_in_d_bits_opcode == 3'h1 & ~reset;
    wire       _GEN_17 = io_in_d_valid & io_in_d_bits_opcode == 3'h2 & ~reset;
    wire       _GEN_18 = io_in_a_valid & a_first_counter & ~reset;
    wire       _GEN_19 = io_in_d_valid & d_first_counter & ~reset;
    wire       a_set_wo_ready = io_in_a_valid & ~a_first_counter_1;
    wire       _GEN_20 = io_in_d_valid & ~d_first_counter_1;
    wire       _GEN_21 = _GEN_20 & ~d_release_ack;
    wire       same_cycle_resp = a_set_wo_ready & ~io_in_d_bits_source;
    wire       _GEN_22 = _GEN_21 & same_cycle_resp & ~reset;
    wire       _GEN_23 = _GEN_21 & ~same_cycle_resp & ~reset;
    wire [3:0] _GEN_24 = {2'h0, io_in_d_bits_size};
    wire       _GEN_25 = io_in_d_valid & ~d_first_counter_2 & d_release_ack & ~reset;
    wire [3:0] _a_size_lookup_T_1 = inflight_sizes >> _GEN;
    wire [3:0] _c_size_lookup_T_1 = inflight_sizes_1 >> _GEN;
    always @(posedge clock) begin
      if (_GEN_0) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquireBlock type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_0 & (|(io_in_a_bits_address[1:0]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquirePerm type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_1 & (|(io_in_a_bits_address[1:0]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_4 & ~_GEN_3) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Get type which slave claims it can't support (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_4 & (|(io_in_a_bits_address[1:0]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get address not aligned to size (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_5 & ~_GEN_3) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries PutFull type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_5 & (|(io_in_a_bits_address[1:0]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull address not aligned to size (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_6) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries PutPartial type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_6 & (|(io_in_a_bits_address[1:0]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial address not aligned to size (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_7) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Arithmetic type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_7 & (|(io_in_a_bits_address[1:0]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_8) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Logical type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_8 & (|(io_in_a_bits_address[1:0]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical address not aligned to size (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_9) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Hint type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_9 & (|(io_in_a_bits_address[1:0]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint address not aligned to size (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_in_d_valid & ~reset & (&io_in_d_bits_opcode)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel has invalid opcode (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_10 & io_in_d_bits_source) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_10 & ~(io_in_d_bits_size[1])) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_10 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_10 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck is corrupt (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_10 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck is denied (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & io_in_d_bits_source) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries invalid source ID (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries invalid sink ID (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & ~(io_in_d_bits_size[1])) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant smaller than a beat (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & (&io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries invalid cap param (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & _GEN_12) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries toN param (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant is corrupt (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant is denied (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & io_in_d_bits_source) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries invalid source ID (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & ~(io_in_d_bits_size[1])) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData smaller than a beat (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & (&io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries invalid cap param (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & _GEN_12) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries toN param (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & ~_GEN_14) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData is denied (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15 & io_in_d_bits_source) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck carries invalid param (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck is corrupt (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck is denied (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & io_in_d_bits_source) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData carries invalid param (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & ~_GEN_14) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData is denied (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & io_in_d_bits_source) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck carries invalid source ID (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck carries invalid param (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck is corrupt (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck is denied (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & io_in_a_bits_opcode != opcode) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel opcode changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & io_in_a_bits_address != address) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel address changed with multibeat operation (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_19 & io_in_d_bits_opcode != opcode_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel opcode changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_19 & io_in_d_bits_param != param_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel param changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_19 & io_in_d_bits_size != size_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel size changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_19 & io_in_d_bits_source != source_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel source changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_19 & io_in_d_bits_sink != sink) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel sink changed with multibeat operation (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_19 & io_in_d_bits_denied != denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel denied changed with multibeat operation (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (a_set & ~reset & inflight) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel re-used a source ID (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_21 & ~reset & ~(inflight >> io_in_d_bits_source | same_cycle_resp)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_22 & ~(io_in_d_bits_opcode == casez_tmp | io_in_d_bits_opcode == casez_tmp_0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper opcode response (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_22 & io_in_d_bits_size != 2'h2) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_23 & ~(io_in_d_bits_opcode == casez_tmp_1 | io_in_d_bits_opcode == casez_tmp_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper opcode response (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_23 & _GEN_24 != {1'h0, _a_size_lookup_T_1[3:1]}) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & ~a_first_counter_1 & io_in_a_valid & ~io_in_d_bits_source & ~d_release_ack & ~reset & ~(~io_in_d_ready | io_in_a_ready)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: ready check\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(a_set_wo_ready != (_GEN_21 & ~io_in_d_bits_source) | ~a_set_wo_ready)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' and 'D' concurrent, despite minlatency 3 (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~inflight | _plusarg_reader_out == 32'h0 | watchdog < _plusarg_reader_out)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: TileLink timeout expired (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_25 & ~(inflight_1 >> io_in_d_bits_source)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_25 & _GEN_24 != {1'h0, _c_size_lookup_T_1[3:1]}) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~inflight_1 | _plusarg_reader_1_out == 32'h0 | watchdog_1 < _plusarg_reader_1_out)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: TileLink timeout expired (connected at generators/rocket-chip/src/main/scala/devices/debug/Debug.scala:699:46)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [30:0] _GEN_26 = {28'h0, io_in_d_bits_source, 2'h0};
  wire [30:0] _d_opcodes_clr_T_5 = 31'hF << _GEN_26;
  wire [30:0] _d_sizes_clr_T_5 = 31'hF << _GEN_26;
  wire [30:0] _d_sizes_clr_T_11 = 31'hF << _GEN_26;
  wire        d_first_done = io_in_d_ready & io_in_d_valid;
  wire        _GEN_27 = d_first_done & ~d_first_counter_1 & ~d_release_ack;
  wire        _GEN_28 = d_first_done & ~d_first_counter_2 & d_release_ack;
  always @(posedge clock) begin
    if (reset) begin
      a_first_counter <= 1'h0;
      d_first_counter <= 1'h0;
      inflight <= 1'h0;
      inflight_opcodes <= 4'h0;
      inflight_sizes <= 4'h0;
      a_first_counter_1 <= 1'h0;
      d_first_counter_1 <= 1'h0;
      watchdog <= 32'h0;
      inflight_1 <= 1'h0;
      inflight_sizes_1 <= 4'h0;
      d_first_counter_2 <= 1'h0;
      watchdog_1 <= 32'h0;
    end
    else begin
      a_first_counter <= (~a_first_done | a_first_counter - 1'h1) & a_first_counter;
      d_first_counter <= (~d_first_done | d_first_counter - 1'h1) & d_first_counter;
      inflight <= (inflight | a_set) & ~(_GEN_27 & ~io_in_d_bits_source);
      inflight_opcodes <= (inflight_opcodes | (a_set ? {io_in_a_bits_opcode, 1'h1} : 4'h0)) & ~(_GEN_27 ? _d_opcodes_clr_T_5[3:0] : 4'h0);
      inflight_sizes <= (inflight_sizes | (a_set ? {1'h0, a_set ? 3'h5 : 3'h0} : 4'h0)) & ~(_GEN_27 ? _d_sizes_clr_T_5[3:0] : 4'h0);
      a_first_counter_1 <= (~a_first_done | a_first_counter_1 - 1'h1) & a_first_counter_1;
      d_first_counter_1 <= (~d_first_done | d_first_counter_1 - 1'h1) & d_first_counter_1;
      if (a_first_done | d_first_done)
        watchdog <= 32'h0;
      else
        watchdog <= watchdog + 32'h1;
      inflight_1 <= inflight_1 & ~(_GEN_28 & ~io_in_d_bits_source);
      inflight_sizes_1 <= inflight_sizes_1 & ~(_GEN_28 ? _d_sizes_clr_T_11[3:0] : 4'h0);
      d_first_counter_2 <= (~d_first_done | d_first_counter_2 - 1'h1) & d_first_counter_2;
      if (d_first_done)
        watchdog_1 <= 32'h0;
      else
        watchdog_1 <= watchdog_1 + 32'h1;
    end
    if (a_first_done & ~a_first_counter) begin
      opcode <= io_in_a_bits_opcode;
      address <= io_in_a_bits_address;
    end
    if (d_first_done & ~d_first_counter) begin
      opcode_1 <= io_in_d_bits_opcode;
      param_1 <= io_in_d_bits_param;
      size_1 <= io_in_d_bits_size;
      source_1 <= io_in_d_bits_source;
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

