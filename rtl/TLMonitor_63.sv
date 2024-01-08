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

module TLMonitor_63(
  input        clock,
               reset,
               io_in_a_ready,
               io_in_a_valid,
  input [2:0]  io_in_a_bits_opcode,
               io_in_a_bits_param,
               io_in_a_bits_size,
  input [6:0]  io_in_a_bits_source,
  input [20:0] io_in_a_bits_address,
  input [7:0]  io_in_a_bits_mask,
  input        io_in_a_bits_corrupt,
               io_in_d_ready,
               io_in_d_valid,
  input [2:0]  io_in_d_bits_opcode,
               io_in_d_bits_size,
  input [6:0]  io_in_d_bits_source
);

  wire [31:0]   _plusarg_reader_1_out;
  wire [31:0]   _plusarg_reader_out;
  wire [12:0]   _GEN = {10'h0, io_in_a_bits_size};
  wire          _a_first_T_1 = io_in_a_ready & io_in_a_valid;
  reg  [2:0]    a_first_counter;
  reg  [2:0]    opcode;
  reg  [2:0]    param;
  reg  [2:0]    size;
  reg  [6:0]    source;
  reg  [20:0]   address;
  reg  [2:0]    d_first_counter;
  reg  [2:0]    opcode_1;
  reg  [2:0]    size_1;
  reg  [6:0]    source_1;
  reg  [64:0]   inflight;
  reg  [259:0]  inflight_opcodes;
  reg  [259:0]  inflight_sizes;
  reg  [2:0]    a_first_counter_1;
  wire          a_first_1 = a_first_counter_1 == 3'h0;
  reg  [2:0]    d_first_counter_1;
  wire          d_first_1 = d_first_counter_1 == 3'h0;
  wire [259:0]  _GEN_0 = {251'h0, io_in_d_bits_source, 2'h0};
  wire [259:0]  _a_opcode_lookup_T_1 = inflight_opcodes >> _GEN_0;
  wire          _GEN_1 = _a_first_T_1 & a_first_1;
  wire          d_release_ack = io_in_d_bits_opcode == 3'h6;
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
  reg  [259:0]  inflight_sizes_1;
  reg  [2:0]    d_first_counter_2;
  wire          d_first_2 = d_first_counter_2 == 3'h0;
  reg  [31:0]   watchdog_1;
  `ifndef SYNTHESIS
    wire         _source_ok_WIRE_2 = io_in_a_bits_source == 7'h9;
    wire         _source_ok_WIRE_3 = io_in_a_bits_source == 7'h10;
    wire         _source_ok_WIRE_4 = io_in_a_bits_source == 7'h40;
    wire         source_ok = io_in_a_bits_source[6:4] == 3'h2 | ~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_2 | _source_ok_WIRE_3 | _source_ok_WIRE_4;
    wire [12:0]  _is_aligned_mask_T_1 = 13'h3F << _GEN;
    wire [5:0]   _GEN_2 = io_in_a_bits_address[5:0] & ~(_is_aligned_mask_T_1[5:0]);
    wire         _mask_T = io_in_a_bits_size > 3'h2;
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
    wire         _GEN_3 = io_in_a_valid & io_in_a_bits_opcode == 3'h6 & ~reset;
    wire         _GEN_4 = io_in_a_bits_size == 3'h6;
    wire         _GEN_5 = io_in_a_bits_address[20:12] == 9'h110;
    wire         _GEN_6 = io_in_a_bits_param > 3'h2;
    wire         _GEN_7 = io_in_a_bits_mask != 8'hFF;
    wire         _GEN_8 = io_in_a_valid & (&io_in_a_bits_opcode) & ~reset;
    wire         _GEN_9 = io_in_a_bits_source[6:4] == 3'h2;
    wire         _GEN_10 = io_in_a_valid & io_in_a_bits_opcode == 3'h4 & ~reset;
    wire         _GEN_11 = io_in_a_bits_size != 3'h7 & _GEN_5;
    wire         _GEN_12 = io_in_a_bits_mask != mask;
    wire         _GEN_13 = io_in_a_valid & io_in_a_bits_opcode == 3'h0 & ~reset;
    wire         _GEN_14 = io_in_a_valid & io_in_a_bits_opcode == 3'h1 & ~reset;
    wire         _GEN_15 = io_in_a_valid & io_in_a_bits_opcode == 3'h2 & ~reset;
    wire         _GEN_16 = io_in_a_valid & io_in_a_bits_opcode == 3'h3 & ~reset;
    wire         _GEN_17 = io_in_a_valid & io_in_a_bits_opcode == 3'h5 & ~reset;
    wire         source_ok_1 = io_in_d_bits_source[6:4] == 3'h2 | io_in_d_bits_source[6:4] == 3'h0 & io_in_d_bits_source[3:0] < 4'h9 | io_in_d_bits_source == 7'h9 | io_in_d_bits_source == 7'h10 | io_in_d_bits_source == 7'h40;
    wire         _GEN_18 = io_in_d_valid & io_in_d_bits_opcode == 3'h6 & ~reset;
    wire         _GEN_19 = io_in_d_bits_size < 3'h3;
    wire         _GEN_20 = io_in_d_valid & io_in_d_bits_opcode == 3'h4 & ~reset;
    wire         _GEN_21 = io_in_d_valid & io_in_d_bits_opcode == 3'h5 & ~reset;
    wire         _GEN_22 = io_in_a_valid & (|a_first_counter) & ~reset;
    wire         _GEN_23 = io_in_d_valid & (|d_first_counter) & ~reset;
    wire         _GEN_24 = io_in_d_valid & d_first_1;
    wire         _GEN_25 = _GEN_24 & ~d_release_ack;
    wire         same_cycle_resp = io_in_a_valid & a_first_1 & io_in_a_bits_source == io_in_d_bits_source;
    wire [64:0]  _GEN_26 = {58'h0, io_in_d_bits_source};
    wire         _GEN_27 = _GEN_25 & same_cycle_resp & ~reset;
    wire         _GEN_28 = _GEN_25 & ~same_cycle_resp & ~reset;
    wire         _GEN_29 = io_in_d_valid & d_first_2 & d_release_ack & ~reset;
    wire [64:0]  _GEN_30 = inflight >> io_in_a_bits_source;
    wire [64:0]  _GEN_31 = inflight >> _GEN_26;
    wire [259:0] _a_size_lookup_T_1 = inflight_sizes >> _GEN_0;
    wire [64:0]  _GEN_32 = inflight_1 >> _GEN_26;
    wire [259:0] _c_size_lookup_T_1 = inflight_sizes_1 >> _GEN_0;
    always @(posedge clock) begin
      if (_GEN_3) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquireBlock type which is unexpected using diplomatic parameters (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_3 & ~(~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 & _GEN_4 & _GEN_5)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_3 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock carries invalid source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_3 & ~_mask_T) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_3 & (|_GEN_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_3 & _GEN_6) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_3 & _GEN_7) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_3 & io_in_a_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock is corrupt (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_8) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquirePerm type which is unexpected using diplomatic parameters (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_8 & ~(~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 & _GEN_4 & _GEN_5)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_8 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm carries invalid source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_8 & ~_mask_T) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_8 & (|_GEN_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_8 & _GEN_6) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_8 & ~(|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_8 & _GEN_7) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_8 & io_in_a_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm is corrupt (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_10 & ~(_GEN_9 | ~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_2 | _source_ok_WIRE_3 | _source_ok_WIRE_4)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Get type which master claims it can't emit (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_10 & ~_GEN_11) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Get type which slave claims it can't support (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_10 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get carries invalid source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_10 & (|_GEN_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get address not aligned to size (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_10 & (|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get carries invalid param (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_10 & _GEN_12) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get contains invalid mask (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_10 & io_in_a_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get is corrupt (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & ~((_GEN_9 | ~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_2 | _source_ok_WIRE_3 | _source_ok_WIRE_4) & _GEN_11)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries PutFull type which is unexpected using diplomatic parameters (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull carries invalid source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & (|_GEN_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull address not aligned to size (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & (|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull carries invalid param (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & _GEN_12) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull contains invalid mask (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_14 & ~((_GEN_9 | ~(|(io_in_a_bits_source[6:4])) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_2 | _source_ok_WIRE_3 | _source_ok_WIRE_4) & _GEN_11)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries PutPartial type which is unexpected using diplomatic parameters (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_14 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial carries invalid source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_14 & (|_GEN_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial address not aligned to size (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_14 & (|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial carries invalid param (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_14 & (|(io_in_a_bits_mask & ~mask))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial contains invalid mask (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Arithmetic type which is unexpected using diplomatic parameters (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic carries invalid source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15 & (|_GEN_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15 & io_in_a_bits_param > 3'h4) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15 & _GEN_12) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Logical type which is unexpected using diplomatic parameters (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical carries invalid source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & (|_GEN_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical address not aligned to size (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & io_in_a_bits_param[2]) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical carries invalid opcode param (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & _GEN_12) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical contains invalid mask (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Hint type which is unexpected using diplomatic parameters (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint carries invalid source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & (|_GEN_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint address not aligned to size (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & (|(io_in_a_bits_param[2:1]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint carries invalid opcode param (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_12) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint contains invalid mask (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & io_in_a_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint is corrupt (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_in_d_valid & ~reset & (&io_in_d_bits_opcode)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel has invalid opcode (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & _GEN_19) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries invalid source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries invalid sink ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & _GEN_19) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant smaller than a beat (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_21 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries invalid source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_21) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_21 & _GEN_19) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData smaller than a beat (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_in_d_valid & io_in_d_bits_opcode == 3'h0 & ~reset & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_in_d_valid & io_in_d_bits_opcode == 3'h1 & ~reset & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_in_d_valid & io_in_d_bits_opcode == 3'h2 & ~reset & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck carries invalid source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_22 & io_in_a_bits_opcode != opcode) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel opcode changed within multibeat operation (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_22 & io_in_a_bits_param != param) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel param changed within multibeat operation (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_22 & io_in_a_bits_size != size) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel size changed within multibeat operation (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_22 & io_in_a_bits_source != source) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel source changed within multibeat operation (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_22 & io_in_a_bits_address != address) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel address changed with multibeat operation (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_23 & io_in_d_bits_opcode != opcode_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel opcode changed within multibeat operation (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_23 & io_in_d_bits_size != size_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel size changed within multibeat operation (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_23 & io_in_d_bits_source != source_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel source changed within multibeat operation (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_1 & ~reset & _GEN_30[0]) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel re-used a source ID (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_25 & ~reset & ~(_GEN_31[0] | same_cycle_resp)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_27 & ~(io_in_d_bits_opcode == casez_tmp | io_in_d_bits_opcode == casez_tmp_0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper opcode response (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_27 & io_in_a_bits_size != io_in_d_bits_size) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & ~(io_in_d_bits_opcode == casez_tmp_1 | io_in_d_bits_opcode == casez_tmp_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper opcode response (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & io_in_d_bits_size != _a_size_lookup_T_1[3:1]) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_24 & a_first_1 & io_in_a_valid & io_in_a_bits_source == io_in_d_bits_source & ~d_release_ack & ~reset & ~(~io_in_d_ready | io_in_a_ready)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: ready check\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(inflight == 65'h0 | _plusarg_reader_out == 32'h0 | watchdog < _plusarg_reader_out)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: TileLink timeout expired (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & ~(_GEN_32[0])) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & io_in_d_bits_size != _c_size_lookup_T_1[3:1]) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(inflight_1 == 65'h0 | _plusarg_reader_1_out == 32'h0 | watchdog_1 < _plusarg_reader_1_out)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: TileLink timeout expired (connected at generators/chipyard/src/main/scala/clocking/HasChipyardPRCI.scala:96:76)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [12:0]   _a_first_beats1_decode_T_1 = 13'h3F << _GEN;
  wire [12:0]   _a_first_beats1_decode_T_5 = 13'h3F << _GEN;
  wire [12:0]   _GEN_33 = {10'h0, io_in_d_bits_size};
  wire [12:0]   _d_first_beats1_decode_T_1 = 13'h3F << _GEN_33;
  wire [12:0]   _d_first_beats1_decode_T_5 = 13'h3F << _GEN_33;
  wire [12:0]   _d_first_beats1_decode_T_9 = 13'h3F << _GEN_33;
  wire [1026:0] _GEN_34 = {1018'h0, io_in_a_bits_source, 2'h0};
  wire [127:0]  _GEN_35 = {121'h0, io_in_d_bits_source};
  wire [1038:0] _GEN_36 = {1030'h0, io_in_d_bits_source, 2'h0};
  wire [127:0]  _d_clr_T = 128'h1 << _GEN_35;
  wire [127:0]  _a_set_T = 128'h1 << io_in_a_bits_source;
  wire [1038:0] _d_opcodes_clr_T_5 = 1039'hF << _GEN_36;
  wire [1026:0] _a_opcodes_set_T_1 = {1023'h0, _GEN_1 ? {io_in_a_bits_opcode, 1'h1} : 4'h0} << _GEN_34;
  wire [1038:0] _d_sizes_clr_T_5 = 1039'hF << _GEN_36;
  wire [1026:0] _a_sizes_set_T_1 = {1023'h0, _GEN_1 ? {io_in_a_bits_size, 1'h1} : 4'h0} << _GEN_34;
  wire [127:0]  _d_clr_T_1 = 128'h1 << _GEN_35;
  wire [1038:0] _d_sizes_clr_T_11 = 1039'hF << _GEN_36;
  wire          _d_first_T_2 = io_in_d_ready & io_in_d_valid;
  wire          _GEN_37 = _d_first_T_2 & d_first_1 & ~d_release_ack;
  wire          _GEN_38 = _d_first_T_2 & d_first_2 & d_release_ack;
  always @(posedge clock) begin
    if (reset) begin
      a_first_counter <= 3'h0;
      d_first_counter <= 3'h0;
      inflight <= 65'h0;
      inflight_opcodes <= 260'h0;
      inflight_sizes <= 260'h0;
      a_first_counter_1 <= 3'h0;
      d_first_counter_1 <= 3'h0;
      watchdog <= 32'h0;
      inflight_1 <= 65'h0;
      inflight_sizes_1 <= 260'h0;
      d_first_counter_2 <= 3'h0;
      watchdog_1 <= 32'h0;
    end
    else begin
      if (_a_first_T_1) begin
        if (|a_first_counter)
          a_first_counter <= a_first_counter - 3'h1;
        else
          a_first_counter <= io_in_a_bits_opcode[2] ? 3'h0 : ~(_a_first_beats1_decode_T_1[5:3]);
        if (a_first_1)
          a_first_counter_1 <= io_in_a_bits_opcode[2] ? 3'h0 : ~(_a_first_beats1_decode_T_5[5:3]);
        else
          a_first_counter_1 <= a_first_counter_1 - 3'h1;
      end
      if (_d_first_T_2) begin
        if (|d_first_counter)
          d_first_counter <= d_first_counter - 3'h1;
        else
          d_first_counter <= io_in_d_bits_opcode[0] ? ~(_d_first_beats1_decode_T_1[5:3]) : 3'h0;
        if (d_first_1)
          d_first_counter_1 <= io_in_d_bits_opcode[0] ? ~(_d_first_beats1_decode_T_5[5:3]) : 3'h0;
        else
          d_first_counter_1 <= d_first_counter_1 - 3'h1;
        if (d_first_2)
          d_first_counter_2 <= io_in_d_bits_opcode[0] ? ~(_d_first_beats1_decode_T_9[5:3]) : 3'h0;
        else
          d_first_counter_2 <= d_first_counter_2 - 3'h1;
        watchdog_1 <= 32'h0;
      end
      else
        watchdog_1 <= watchdog_1 + 32'h1;
      inflight <= (inflight | (_GEN_1 ? _a_set_T[64:0] : 65'h0)) & ~(_GEN_37 ? _d_clr_T[64:0] : 65'h0);
      inflight_opcodes <= (inflight_opcodes | (_GEN_1 ? _a_opcodes_set_T_1[259:0] : 260'h0)) & ~(_GEN_37 ? _d_opcodes_clr_T_5[259:0] : 260'h0);
      inflight_sizes <= (inflight_sizes | (_GEN_1 ? _a_sizes_set_T_1[259:0] : 260'h0)) & ~(_GEN_37 ? _d_sizes_clr_T_5[259:0] : 260'h0);
      if (_a_first_T_1 | _d_first_T_2)
        watchdog <= 32'h0;
      else
        watchdog <= watchdog + 32'h1;
      inflight_1 <= inflight_1 & ~(_GEN_38 ? _d_clr_T_1[64:0] : 65'h0);
      inflight_sizes_1 <= inflight_sizes_1 & ~(_GEN_38 ? _d_sizes_clr_T_11[259:0] : 260'h0);
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
      size_1 <= io_in_d_bits_size;
      source_1 <= io_in_d_bits_source;
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

