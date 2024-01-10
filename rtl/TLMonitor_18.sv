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

module TLMonitor_18(
  input        clock,
               reset,
               io_in_a_ready,
               io_in_a_valid,
  input [2:0]  io_in_a_bits_opcode,
               io_in_a_bits_param,
  input [3:0]  io_in_a_bits_size,
  input [6:0]  io_in_a_bits_source,
  input [28:0] io_in_a_bits_address,
  input [7:0]  io_in_a_bits_mask,
  input        io_in_a_bits_corrupt,
               io_in_d_ready,
               io_in_d_valid,
  input [2:0]  io_in_d_bits_opcode,
  input [1:0]  io_in_d_bits_param,
  input [3:0]  io_in_d_bits_size,
  input [6:0]  io_in_d_bits_source,
  input        io_in_d_bits_sink,
               io_in_d_bits_denied,
               io_in_d_bits_corrupt
);

  wire [31:0]   _plusarg_reader_1_out;
  wire [31:0]   _plusarg_reader_out;
  wire [26:0]   _GEN = {23'h0, io_in_a_bits_size};
  wire          _a_first_T_1 = io_in_a_ready & io_in_a_valid;
  reg  [8:0]    a_first_counter;
  reg  [2:0]    opcode;
  reg  [2:0]    param;
  reg  [3:0]    size;
  reg  [6:0]    source;
  reg  [28:0]   address;
  reg  [8:0]    d_first_counter;
  reg  [2:0]    opcode_1;
  reg  [1:0]    param_1;
  reg  [3:0]    size_1;
  reg  [6:0]    source_1;
  reg           sink;
  reg           denied;
  reg  [64:0]   inflight;
  reg  [259:0]  inflight_opcodes;
  reg  [519:0]  inflight_sizes;
  reg  [8:0]    a_first_counter_1;
  wire          a_first_1 = a_first_counter_1 == 9'h0;
  reg  [8:0]    d_first_counter_1;
  wire          d_first_1 = d_first_counter_1 == 9'h0;
  wire [259:0]  _a_opcode_lookup_T_1 = inflight_opcodes >> {251'h0, io_in_d_bits_source, 2'h0};
  wire [127:0]  _GEN_0 = {121'h0, io_in_a_bits_source};
  wire          _GEN_1 = _a_first_T_1 & a_first_1;
  wire          d_release_ack = io_in_d_bits_opcode == 3'h6;
  wire [127:0]  _GEN_2 = {121'h0, io_in_d_bits_source};
  reg  [2:0]    casez_tmp;
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
  reg  [2:0]    casez_tmp_0;
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
  reg  [2:0]    casez_tmp_1;
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
  reg  [2:0]    casez_tmp_2;
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
  reg  [31:0]   watchdog;
  reg  [64:0]   inflight_1;
  reg  [519:0]  inflight_sizes_1;
  reg  [8:0]    d_first_counter_2;
  wire          d_first_2 = d_first_counter_2 == 9'h0;
  reg  [31:0]   watchdog_1;
  `ifndef SYNTHESIS
    wire         _source_ok_WIRE_2 = io_in_a_bits_source == 7'h9;
    wire         _source_ok_WIRE_3 = io_in_a_bits_source == 7'h10;
    wire         _source_ok_WIRE_4 = io_in_a_bits_source == 7'h40;
    wire         source_ok = io_in_a_bits_source[6:4] == 3'h2 | ~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_2 | _source_ok_WIRE_3 | _source_ok_WIRE_4;
    wire [26:0]  _is_aligned_mask_T_1 = 27'hFFF << _GEN;
    wire [11:0]  _GEN_3 = io_in_a_bits_address[11:0] & ~(_is_aligned_mask_T_1[11:0]);
    wire         _mask_T = io_in_a_bits_size > 4'h2;
    wire         mask_size = io_in_a_bits_size[1:0] == 2'h2;
    wire         mask_acc = _mask_T | mask_size & ~(io_in_a_bits_address[2]);
    wire         mask_acc_1 = _mask_T | mask_size & io_in_a_bits_address[2];
    wire         mask_size_1 = io_in_a_bits_size[1:0] == 2'h1;
    wire         mask_eq_2 = ~(io_in_a_bits_address[2]) & ~(io_in_a_bits_address[1]);
    wire         mask_acc_2 = mask_acc | mask_size_1 & mask_eq_2;
    wire         mask_eq_3 = ~(io_in_a_bits_address[2]) & io_in_a_bits_address[1];
    wire         mask_acc_3 = mask_acc | mask_size_1 & mask_eq_3;
    wire         mask_eq_4 = io_in_a_bits_address[2] & ~(io_in_a_bits_address[1]);
    wire         mask_acc_4 = mask_acc_1 | mask_size_1 & mask_eq_4;
    wire         mask_eq_5 = io_in_a_bits_address[2] & io_in_a_bits_address[1];
    wire         mask_acc_5 = mask_acc_1 | mask_size_1 & mask_eq_5;
    wire [7:0]   mask = {mask_acc_5 | mask_eq_5 & io_in_a_bits_address[0], mask_acc_5 | mask_eq_5 & ~(io_in_a_bits_address[0]), mask_acc_4 | mask_eq_4 & io_in_a_bits_address[0], mask_acc_4 | mask_eq_4 & ~(io_in_a_bits_address[0]), mask_acc_3 | mask_eq_3 & io_in_a_bits_address[0], mask_acc_3 | mask_eq_3 & ~(io_in_a_bits_address[0]), mask_acc_2 | mask_eq_2 & io_in_a_bits_address[0], mask_acc_2 | mask_eq_2 & ~(io_in_a_bits_address[0])};
    wire         _GEN_4 = io_in_a_bits_size < 4'hD;
    wire         _GEN_5 = io_in_a_valid & io_in_a_bits_opcode == 3'h6 & ~reset;
    wire         _GEN_6 = io_in_a_bits_size == 4'h6;
    wire         _GEN_7 = io_in_a_bits_address[28:13] == 16'h0;
    wire         _GEN_8 = {io_in_a_bits_address[28:14], ~(io_in_a_bits_address[13:12])} == 17'h0;
    wire         _GEN_9 = {io_in_a_bits_address[28:17], ~(io_in_a_bits_address[16])} == 13'h0;
    wire         _GEN_10 = {io_in_a_bits_address[28:21], io_in_a_bits_address[20:17] ^ 4'h8, io_in_a_bits_address[15:12]} == 16'h0;
    wire         _GEN_11 = {io_in_a_bits_address[28:26], io_in_a_bits_address[25:16] ^ 10'h200} == 13'h0;
    wire         _GEN_12 = {io_in_a_bits_address[28:26], io_in_a_bits_address[25:12] ^ 14'h2010} == 17'h0;
    wire         _GEN_13 = {io_in_a_bits_address[28], ~(io_in_a_bits_address[27:26])} == 3'h0;
    wire         _GEN_14 = io_in_a_bits_address[28:12] == 17'h10020;
    wire         _GEN_15 = _GEN_4 & (_GEN_7 | _GEN_8 | _GEN_9 | _GEN_10 | _GEN_11 | _GEN_12 | _GEN_13 | _GEN_14);
    wire         _GEN_16 = io_in_a_bits_param > 3'h2;
    wire         _GEN_17 = io_in_a_bits_mask != 8'hFF;
    wire         _GEN_18 = io_in_a_valid & (&io_in_a_bits_opcode) & ~reset;
    wire         _GEN_19 = io_in_a_bits_source[6:4] == 3'h2;
    wire         _GEN_20 = io_in_a_valid & io_in_a_bits_opcode == 3'h4 & ~reset;
    wire         _GEN_21 = _GEN_4 & _GEN_8;
    wire         _GEN_22 = io_in_a_bits_size < 4'h7;
    wire         _GEN_23 = io_in_a_bits_mask != mask;
    wire         _GEN_24 = _GEN_21 | _GEN_22 & (_GEN_7 | _GEN_10 | _GEN_11 | _GEN_12 | _GEN_13 | _GEN_14);
    wire         _GEN_25 = io_in_a_valid & io_in_a_bits_opcode == 3'h0 & ~reset;
    wire         _GEN_26 = io_in_a_valid & io_in_a_bits_opcode == 3'h1 & ~reset;
    wire         _GEN_27 = io_in_a_bits_size < 4'h4 & ({io_in_a_bits_address[28:14], ~(io_in_a_bits_address[12])} == 16'h0 | _GEN_14);
    wire         _GEN_28 = io_in_a_valid & io_in_a_bits_opcode == 3'h2 & ~reset;
    wire         _GEN_29 = io_in_a_valid & io_in_a_bits_opcode == 3'h3 & ~reset;
    wire         _GEN_30 = io_in_a_valid & io_in_a_bits_opcode == 3'h5 & ~reset;
    wire         source_ok_1 = io_in_d_bits_source[6:4] == 3'h2 | io_in_d_bits_source[6:4] == 3'h0 & io_in_d_bits_source[3:0] < 4'h9 | io_in_d_bits_source == 7'h9 | io_in_d_bits_source == 7'h10 | io_in_d_bits_source == 7'h40;
    wire         _GEN_31 = io_in_d_valid & io_in_d_bits_opcode == 3'h6 & ~reset;
    wire         _GEN_32 = io_in_d_bits_size < 4'h3;
    wire         _GEN_33 = io_in_d_valid & io_in_d_bits_opcode == 3'h4 & ~reset;
    wire         _GEN_34 = io_in_d_bits_param == 2'h2;
    wire         _GEN_35 = io_in_d_valid & io_in_d_bits_opcode == 3'h5 & ~reset;
    wire         _GEN_36 = ~io_in_d_bits_denied | io_in_d_bits_corrupt;
    wire         _GEN_37 = io_in_d_valid & io_in_d_bits_opcode == 3'h0 & ~reset;
    wire         _GEN_38 = io_in_d_valid & io_in_d_bits_opcode == 3'h1 & ~reset;
    wire         _GEN_39 = io_in_d_valid & io_in_d_bits_opcode == 3'h2 & ~reset;
    wire         _GEN_40 = io_in_a_valid & (|a_first_counter) & ~reset;
    wire         _GEN_41 = io_in_d_valid & (|d_first_counter) & ~reset;
    wire [519:0] _GEN_42 = {510'h0, io_in_d_bits_source, 3'h0};
    wire         _same_cycle_resp_T_1 = io_in_a_valid & a_first_1;
    wire [127:0] _a_set_wo_ready_T = 128'h1 << _GEN_0;
    wire [64:0]  a_set_wo_ready = _same_cycle_resp_T_1 ? _a_set_wo_ready_T[64:0] : 65'h0;
    wire         _GEN_43 = io_in_d_valid & d_first_1;
    wire         _GEN_44 = _GEN_43 & ~d_release_ack;
    wire         same_cycle_resp = _same_cycle_resp_T_1 & io_in_a_bits_source == io_in_d_bits_source;
    wire [64:0]  _GEN_45 = {58'h0, io_in_d_bits_source};
    wire         _GEN_46 = _GEN_44 & same_cycle_resp & ~reset;
    wire         _GEN_47 = _GEN_44 & ~same_cycle_resp & ~reset;
    wire [7:0]   _GEN_48 = {4'h0, io_in_d_bits_size};
    wire         _GEN_49 = io_in_d_valid & d_first_2 & d_release_ack & ~reset;
    wire [64:0]  _GEN_50 = inflight >> io_in_a_bits_source;
    wire [64:0]  _GEN_51 = inflight >> _GEN_45;
    wire [519:0] _a_size_lookup_T_1 = inflight_sizes >> _GEN_42;
    wire [127:0] _d_clr_wo_ready_T = 128'h1 << _GEN_2;
    wire [64:0]  _GEN_52 = inflight_1 >> _GEN_45;
    wire [519:0] _c_size_lookup_T_1 = inflight_sizes_1 >> _GEN_42;
    always @(posedge clock) begin
      if (_GEN_5) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquireBlock type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_5 & ~(~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 & _GEN_6 & _GEN_15)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_5 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_5 & ~_mask_T) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_5 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_5 & _GEN_16) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_5 & _GEN_17) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_5 & io_in_a_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquirePerm type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & ~(~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 & _GEN_6 & _GEN_15)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & ~_mask_T) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & _GEN_16) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & ~(|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & _GEN_17) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & io_in_a_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & ~(_GEN_4 & (_GEN_19 | ~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_2 | _source_ok_WIRE_3 | _source_ok_WIRE_4))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Get type which master claims it can't emit (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & ~(_GEN_21 | _GEN_22 & (_GEN_7 | _GEN_9 | _GEN_10 | _GEN_11 | _GEN_12 | _GEN_13 | _GEN_14))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Get type which slave claims it can't support (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & (|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & _GEN_23) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & io_in_a_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_25 & ~(_GEN_4 & (_GEN_19 | ~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_2 | _source_ok_WIRE_3 | _source_ok_WIRE_4) & _GEN_24)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries PutFull type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_25 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_25 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_25 & (|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_25 & _GEN_23) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_26 & ~(_GEN_4 & (_GEN_19 | ~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_2 | _source_ok_WIRE_3 | _source_ok_WIRE_4) & _GEN_24)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries PutPartial type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_26 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_26 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_26 & (|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_26 & (|(io_in_a_bits_mask & ~mask))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & ~(_GEN_4 & (_GEN_19 | ~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_2 | _source_ok_WIRE_3 | _source_ok_WIRE_4) & _GEN_27)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Arithmetic type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & io_in_a_bits_param > 3'h4) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & _GEN_23) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & ~(_GEN_4 & (_GEN_19 | ~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_2 | _source_ok_WIRE_3 | _source_ok_WIRE_4) & _GEN_27)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Logical type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & io_in_a_bits_param[2]) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical carries invalid opcode param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & _GEN_23) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_30 & ~(_GEN_4 & (_GEN_19 | ~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_2 | _source_ok_WIRE_3 | _source_ok_WIRE_4) & _GEN_21)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Hint type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_30 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_30 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_30 & (|(io_in_a_bits_param[2:1]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint carries invalid opcode param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_30 & _GEN_23) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_30 & io_in_a_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_in_d_valid & ~reset & (&io_in_d_bits_opcode)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel has invalid opcode (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_31 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_31 & _GEN_32) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_31 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_31 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_31 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck is denied (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_33 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_33) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries invalid sink ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_33 & _GEN_32) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant smaller than a beat (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_33 & (&io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries invalid cap param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_33 & _GEN_34) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries toN param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_33 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_35 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_35) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_35 & _GEN_32) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData smaller than a beat (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_35 & (&io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries invalid cap param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_35 & _GEN_34) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries toN param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_35 & ~_GEN_36) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_37 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_37 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_37 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_38 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_38 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_38 & ~_GEN_36) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_39 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_39 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_39 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_40 & io_in_a_bits_opcode != opcode) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel opcode changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_40 & io_in_a_bits_param != param) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel param changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_40 & io_in_a_bits_size != size) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel size changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_40 & io_in_a_bits_source != source) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel source changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_40 & io_in_a_bits_address != address) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel address changed with multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_41 & io_in_d_bits_opcode != opcode_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel opcode changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_41 & io_in_d_bits_param != param_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel param changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_41 & io_in_d_bits_size != size_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel size changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_41 & io_in_d_bits_source != source_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel source changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_41 & io_in_d_bits_sink != sink) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel sink changed with multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_41 & io_in_d_bits_denied != denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel denied changed with multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_1 & ~reset & _GEN_50[0]) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel re-used a source ID (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_44 & ~reset & ~(_GEN_51[0] | same_cycle_resp)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_46 & ~(io_in_d_bits_opcode == casez_tmp | io_in_d_bits_opcode == casez_tmp_0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper opcode response (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_46 & io_in_a_bits_size != io_in_d_bits_size) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_47 & ~(io_in_d_bits_opcode == casez_tmp_1 | io_in_d_bits_opcode == casez_tmp_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper opcode response (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_47 & _GEN_48 != {1'h0, _a_size_lookup_T_1[7:1]}) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_43 & a_first_1 & io_in_a_valid & io_in_a_bits_source == io_in_d_bits_source & ~d_release_ack & ~reset & ~(~io_in_d_ready | io_in_a_ready)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: ready check\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(a_set_wo_ready != (_GEN_44 ? _d_clr_wo_ready_T[64:0] : 65'h0) | a_set_wo_ready == 65'h0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' and 'D' concurrent, despite minlatency 2 (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(inflight == 65'h0 | _plusarg_reader_out == 32'h0 | watchdog < _plusarg_reader_out)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: TileLink timeout expired (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_49 & ~(_GEN_52[0])) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_49 & _GEN_48 != {1'h0, _c_size_lookup_T_1[7:1]}) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(inflight_1 == 65'h0 | _plusarg_reader_1_out == 32'h0 | watchdog_1 < _plusarg_reader_1_out)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: TileLink timeout expired (connected at generators/rocket-chip/src/main/scala/subsystem/PeripheryBus.scala:55:7)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [26:0]   _a_first_beats1_decode_T_1 = 27'hFFF << _GEN;
  wire [26:0]   _a_first_beats1_decode_T_5 = 27'hFFF << _GEN;
  wire [26:0]   _GEN_53 = {23'h0, io_in_d_bits_size};
  wire [26:0]   _d_first_beats1_decode_T_1 = 27'hFFF << _GEN_53;
  wire [26:0]   _d_first_beats1_decode_T_5 = 27'hFFF << _GEN_53;
  wire [26:0]   _d_first_beats1_decode_T_9 = 27'hFFF << _GEN_53;
  wire [1038:0] _GEN_54 = {1029'h0, io_in_d_bits_source, 3'h0};
  wire [127:0]  _d_clr_T = 128'h1 << _GEN_2;
  wire [127:0]  _a_set_T = 128'h1 << _GEN_0;
  wire [1038:0] _d_opcodes_clr_T_5 = 1039'hF << {1030'h0, io_in_d_bits_source, 2'h0};
  wire [1026:0] _a_opcodes_set_T_1 = {1023'h0, _GEN_1 ? {io_in_a_bits_opcode, 1'h1} : 4'h0} << {1018'h0, io_in_a_bits_source, 2'h0};
  wire [1038:0] _d_sizes_clr_T_5 = 1039'hFF << _GEN_54;
  wire [1027:0] _a_sizes_set_T_1 = {1023'h0, _GEN_1 ? {io_in_a_bits_size, 1'h1} : 5'h0} << {1018'h0, io_in_a_bits_source, 3'h0};
  wire [127:0]  _d_clr_T_1 = 128'h1 << _GEN_2;
  wire [1038:0] _d_sizes_clr_T_11 = 1039'hFF << _GEN_54;
  wire          _d_first_T_2 = io_in_d_ready & io_in_d_valid;
  wire          _GEN_55 = _d_first_T_2 & d_first_1 & ~d_release_ack;
  wire          _GEN_56 = _d_first_T_2 & d_first_2 & d_release_ack;
  always @(posedge clock) begin
    if (reset) begin
      a_first_counter <= 9'h0;
      d_first_counter <= 9'h0;
      inflight <= 65'h0;
      inflight_opcodes <= 260'h0;
      inflight_sizes <= 520'h0;
      a_first_counter_1 <= 9'h0;
      d_first_counter_1 <= 9'h0;
      watchdog <= 32'h0;
      inflight_1 <= 65'h0;
      inflight_sizes_1 <= 520'h0;
      d_first_counter_2 <= 9'h0;
      watchdog_1 <= 32'h0;
    end
    else begin
      if (_a_first_T_1) begin
        if (|a_first_counter)
          a_first_counter <= a_first_counter - 9'h1;
        else
          a_first_counter <= io_in_a_bits_opcode[2] ? 9'h0 : ~(_a_first_beats1_decode_T_1[11:3]);
        if (a_first_1)
          a_first_counter_1 <= io_in_a_bits_opcode[2] ? 9'h0 : ~(_a_first_beats1_decode_T_5[11:3]);
        else
          a_first_counter_1 <= a_first_counter_1 - 9'h1;
      end
      if (_d_first_T_2) begin
        if (|d_first_counter)
          d_first_counter <= d_first_counter - 9'h1;
        else
          d_first_counter <= io_in_d_bits_opcode[0] ? ~(_d_first_beats1_decode_T_1[11:3]) : 9'h0;
        if (d_first_1)
          d_first_counter_1 <= io_in_d_bits_opcode[0] ? ~(_d_first_beats1_decode_T_5[11:3]) : 9'h0;
        else
          d_first_counter_1 <= d_first_counter_1 - 9'h1;
        if (d_first_2)
          d_first_counter_2 <= io_in_d_bits_opcode[0] ? ~(_d_first_beats1_decode_T_9[11:3]) : 9'h0;
        else
          d_first_counter_2 <= d_first_counter_2 - 9'h1;
        watchdog_1 <= 32'h0;
      end
      else
        watchdog_1 <= watchdog_1 + 32'h1;
      inflight <= (inflight | (_GEN_1 ? _a_set_T[64:0] : 65'h0)) & ~(_GEN_55 ? _d_clr_T[64:0] : 65'h0);
      inflight_opcodes <= (inflight_opcodes | (_GEN_1 ? _a_opcodes_set_T_1[259:0] : 260'h0)) & ~(_GEN_55 ? _d_opcodes_clr_T_5[259:0] : 260'h0);
      inflight_sizes <= (inflight_sizes | (_GEN_1 ? _a_sizes_set_T_1[519:0] : 520'h0)) & ~(_GEN_55 ? _d_sizes_clr_T_5[519:0] : 520'h0);
      if (_a_first_T_1 | _d_first_T_2)
        watchdog <= 32'h0;
      else
        watchdog <= watchdog + 32'h1;
      inflight_1 <= inflight_1 & ~(_GEN_56 ? _d_clr_T_1[64:0] : 65'h0);
      inflight_sizes_1 <= inflight_sizes_1 & ~(_GEN_56 ? _d_sizes_clr_T_11[519:0] : 520'h0);
    end
    if (_a_first_T_1 & ~(|a_first_counter)) begin
      opcode <= io_in_a_bits_opcode;
      param <= io_in_a_bits_param;
      size <= io_in_a_bits_size;
      source <= io_in_a_bits_source;
      address <= io_in_a_bits_address;
    end
    if (_d_first_T_2 & ~(|d_first_counter)) begin
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

