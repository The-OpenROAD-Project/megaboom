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

module TLMonitor_77(
  input        clock,
               reset,
               io_in_a_ready,
               io_in_a_valid,
  input [2:0]  io_in_a_bits_opcode,
               io_in_a_bits_param,
  input [1:0]  io_in_a_bits_size,
  input [9:0]  io_in_a_bits_source,
  input [32:0] io_in_a_bits_address,
  input [7:0]  io_in_a_bits_mask,
  input        io_in_d_ready,
               io_in_d_valid,
  input [2:0]  io_in_d_bits_opcode,
  input [1:0]  io_in_d_bits_param,
               io_in_d_bits_size,
  input [9:0]  io_in_d_bits_source,
  input        io_in_d_bits_sink,
               io_in_d_bits_denied,
               io_in_d_bits_corrupt
);

  wire [31:0]   _plusarg_reader_1_out;
  wire [31:0]   _plusarg_reader_out;
  wire          a_first_done = io_in_a_ready & io_in_a_valid;
  reg           a_first_counter;
  reg  [2:0]    opcode;
  reg  [2:0]    param;
  reg  [1:0]    size;
  reg  [9:0]    source;
  reg  [32:0]   address;
  reg           d_first_counter;
  reg  [2:0]    opcode_1;
  reg  [1:0]    param_1;
  reg  [1:0]    size_1;
  reg  [9:0]    source_1;
  reg           sink;
  reg           denied;
  reg  [1023:0] inflight;
  reg  [4095:0] inflight_opcodes;
  reg  [4095:0] inflight_sizes;
  reg           a_first_counter_1;
  reg           d_first_counter_1;
  wire [4095:0] _GEN = {4084'h0, io_in_d_bits_source, 2'h0};
  wire [4095:0] _a_opcode_lookup_T_1 = inflight_opcodes >> _GEN;
  wire [1023:0] _GEN_0 = {1014'h0, io_in_a_bits_source};
  wire          _GEN_1 = a_first_done & ~a_first_counter_1;
  wire          d_release_ack = io_in_d_bits_opcode == 3'h6;
  wire [1023:0] _GEN_2 = {1014'h0, io_in_d_bits_source};
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
  reg  [1023:0] inflight_1;
  reg  [4095:0] inflight_sizes_1;
  reg           d_first_counter_2;
  reg  [31:0]   watchdog_1;
  `ifndef SYNTHESIS
    wire [5:0]    _is_aligned_mask_T_1 = 6'h7 << io_in_a_bits_size;
    wire [2:0]    _GEN_3 = io_in_a_bits_address[2:0] & ~(_is_aligned_mask_T_1[2:0]);
    wire          mask_size = io_in_a_bits_size == 2'h2;
    wire          mask_acc = (&io_in_a_bits_size) | mask_size & ~(io_in_a_bits_address[2]);
    wire          mask_acc_1 = (&io_in_a_bits_size) | mask_size & io_in_a_bits_address[2];
    wire          mask_size_1 = io_in_a_bits_size == 2'h1;
    wire          mask_eq_2 = ~(io_in_a_bits_address[2]) & ~(io_in_a_bits_address[1]);
    wire          mask_acc_2 = mask_acc | mask_size_1 & mask_eq_2;
    wire          mask_eq_3 = ~(io_in_a_bits_address[2]) & io_in_a_bits_address[1];
    wire          mask_acc_3 = mask_acc | mask_size_1 & mask_eq_3;
    wire          mask_eq_4 = io_in_a_bits_address[2] & ~(io_in_a_bits_address[1]);
    wire          mask_acc_4 = mask_acc_1 | mask_size_1 & mask_eq_4;
    wire          mask_eq_5 = io_in_a_bits_address[2] & io_in_a_bits_address[1];
    wire          mask_acc_5 = mask_acc_1 | mask_size_1 & mask_eq_5;
    wire [7:0]    mask = {mask_acc_5 | mask_eq_5 & io_in_a_bits_address[0], mask_acc_5 | mask_eq_5 & ~(io_in_a_bits_address[0]), mask_acc_4 | mask_eq_4 & io_in_a_bits_address[0], mask_acc_4 | mask_eq_4 & ~(io_in_a_bits_address[0]), mask_acc_3 | mask_eq_3 & io_in_a_bits_address[0], mask_acc_3 | mask_eq_3 & ~(io_in_a_bits_address[0]), mask_acc_2 | mask_eq_2 & io_in_a_bits_address[0], mask_acc_2 | mask_eq_2 & ~(io_in_a_bits_address[0])};
    wire          _GEN_4 = io_in_a_valid & io_in_a_bits_opcode == 3'h6 & ~reset;
    wire          _GEN_5 = io_in_a_bits_param > 3'h2;
    wire          _GEN_6 = io_in_a_bits_mask != 8'hFF;
    wire          _GEN_7 = io_in_a_valid & (&io_in_a_bits_opcode) & ~reset;
    wire          _GEN_8 = io_in_a_bits_address[32:31] != 2'h2;
    wire          _GEN_9 = io_in_a_valid & io_in_a_bits_opcode == 3'h4 & ~reset;
    wire          _GEN_10 = io_in_a_bits_mask != mask;
    wire          _GEN_11 = io_in_a_valid & io_in_a_bits_opcode == 3'h0 & ~reset;
    wire          _GEN_12 = io_in_a_valid & io_in_a_bits_opcode == 3'h1 & ~reset;
    wire          _GEN_13 = io_in_a_valid & io_in_a_bits_opcode == 3'h2 & ~reset;
    wire          _GEN_14 = io_in_a_valid & io_in_a_bits_opcode == 3'h3 & ~reset;
    wire          _GEN_15 = io_in_a_valid & io_in_a_bits_opcode == 3'h5 & ~reset;
    wire          _GEN_16 = io_in_d_valid & io_in_d_bits_opcode == 3'h6 & ~reset;
    wire          _GEN_17 = io_in_d_bits_size != 2'h3;
    wire          _GEN_18 = io_in_d_valid & io_in_d_bits_opcode == 3'h4 & ~reset;
    wire          _GEN_19 = io_in_d_bits_param == 2'h2;
    wire          _GEN_20 = io_in_d_valid & io_in_d_bits_opcode == 3'h5 & ~reset;
    wire          _GEN_21 = ~io_in_d_bits_denied | io_in_d_bits_corrupt;
    wire          _GEN_22 = io_in_d_valid & io_in_d_bits_opcode == 3'h0 & ~reset;
    wire          _GEN_23 = io_in_d_valid & io_in_d_bits_opcode == 3'h1 & ~reset;
    wire          _GEN_24 = io_in_d_valid & io_in_d_bits_opcode == 3'h2 & ~reset;
    wire          _GEN_25 = io_in_a_valid & a_first_counter & ~reset;
    wire          _GEN_26 = io_in_d_valid & d_first_counter & ~reset;
    wire          _same_cycle_resp_T_1 = io_in_a_valid & ~a_first_counter_1;
    wire [1023:0] a_set_wo_ready = _same_cycle_resp_T_1 ? 1024'h1 << _GEN_0 : 1024'h0;
    wire          _GEN_27 = io_in_d_valid & ~d_first_counter_1;
    wire          _GEN_28 = _GEN_27 & ~d_release_ack;
    wire          same_cycle_resp = _same_cycle_resp_T_1 & io_in_a_bits_source == io_in_d_bits_source;
    wire          _GEN_29 = _GEN_28 & same_cycle_resp & ~reset;
    wire          _GEN_30 = _GEN_28 & ~same_cycle_resp & ~reset;
    wire [3:0]    _GEN_31 = {2'h0, io_in_d_bits_size};
    wire          _GEN_32 = io_in_d_valid & ~d_first_counter_2 & d_release_ack & ~reset;
    wire [1023:0] _GEN_33 = inflight >> _GEN_0;
    wire [1023:0] _GEN_34 = inflight >> _GEN_2;
    wire [4095:0] _a_size_lookup_T_1 = inflight_sizes >> _GEN;
    wire [1023:0] _GEN_35 = inflight_1 >> _GEN_2;
    wire [4095:0] _c_size_lookup_T_1 = inflight_sizes_1 >> _GEN;
    always @(posedge clock) begin
      if (_GEN_4) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquireBlock type which is unexpected using diplomatic parameters (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_4 & ~(&io_in_a_bits_size)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_4 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_4 & _GEN_5) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_4 & _GEN_6) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_7) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquirePerm type which is unexpected using diplomatic parameters (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_7 & ~(&io_in_a_bits_size)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_7 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_7 & _GEN_5) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_7 & ~(|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_7 & _GEN_6) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_9 & _GEN_8) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Get type which slave claims it can't support (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_9 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get address not aligned to size (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_9 & (|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get carries invalid param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_9 & _GEN_10) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get contains invalid mask (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & _GEN_8) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries PutFull type which is unexpected using diplomatic parameters (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull address not aligned to size (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & (|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull carries invalid param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & _GEN_10) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull contains invalid mask (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_12 & _GEN_8) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries PutPartial type which is unexpected using diplomatic parameters (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_12 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial address not aligned to size (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_12 & (|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial carries invalid param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_12 & (|(io_in_a_bits_mask & ~mask))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial contains invalid mask (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Arithmetic type which is unexpected using diplomatic parameters (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & io_in_a_bits_param > 3'h4) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_13 & _GEN_10) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_14) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Logical type which is unexpected using diplomatic parameters (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_14 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical address not aligned to size (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_14 & io_in_a_bits_param[2]) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical carries invalid opcode param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_14 & _GEN_10) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical contains invalid mask (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Hint type which is unexpected using diplomatic parameters (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15 & (|_GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint address not aligned to size (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15 & (|(io_in_a_bits_param[2:1]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint carries invalid opcode param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_15 & _GEN_10) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint contains invalid mask (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_in_d_valid & ~reset & (&io_in_d_bits_opcode)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel has invalid opcode (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & _GEN_17) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck is corrupt (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck is denied (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries invalid sink ID (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & _GEN_17) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant smaller than a beat (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & (&io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries invalid cap param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & _GEN_19) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries toN param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant is corrupt (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_18 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant is denied (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries invalid sink ID (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & _GEN_17) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData smaller than a beat (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & (&io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries invalid cap param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & _GEN_19) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries toN param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & ~_GEN_21) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_20 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData is denied (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_22 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck carries invalid param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_22 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck is corrupt (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_22 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck is denied (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_23 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData carries invalid param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_23 & ~_GEN_21) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_23 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData is denied (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_24 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck carries invalid param (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_24 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck is corrupt (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_24 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck is denied (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_25 & io_in_a_bits_opcode != opcode) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel opcode changed within multibeat operation (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_25 & io_in_a_bits_param != param) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel param changed within multibeat operation (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_25 & io_in_a_bits_size != size) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel size changed within multibeat operation (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_25 & io_in_a_bits_source != source) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel source changed within multibeat operation (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_25 & io_in_a_bits_address != address) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel address changed with multibeat operation (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_26 & io_in_d_bits_opcode != opcode_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel opcode changed within multibeat operation (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_26 & io_in_d_bits_param != param_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel param changed within multibeat operation (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_26 & io_in_d_bits_size != size_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel size changed within multibeat operation (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_26 & io_in_d_bits_source != source_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel source changed within multibeat operation (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_26 & io_in_d_bits_sink != sink) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel sink changed with multibeat operation (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_26 & io_in_d_bits_denied != denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel denied changed with multibeat operation (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_1 & ~reset & _GEN_33[0]) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel re-used a source ID (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & ~reset & ~(_GEN_34[0] | same_cycle_resp)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & ~(io_in_d_bits_opcode == casez_tmp | io_in_d_bits_opcode == casez_tmp_0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper opcode response (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & io_in_a_bits_size != io_in_d_bits_size) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_30 & ~(io_in_d_bits_opcode == casez_tmp_1 | io_in_d_bits_opcode == casez_tmp_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper opcode response (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_30 & _GEN_31 != {1'h0, _a_size_lookup_T_1[3:1]}) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_27 & ~a_first_counter_1 & io_in_a_valid & io_in_a_bits_source == io_in_d_bits_source & ~d_release_ack & ~reset & ~(~io_in_d_ready | io_in_a_ready)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: ready check\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(a_set_wo_ready != (_GEN_28 ? 1024'h1 << _GEN_2 : 1024'h0) | a_set_wo_ready == 1024'h0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' and 'D' concurrent, despite minlatency 3 (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(inflight == 1024'h0 | _plusarg_reader_out == 32'h0 | watchdog < _plusarg_reader_out)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: TileLink timeout expired (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_32 & ~(_GEN_35[0])) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_32 & _GEN_31 != {1'h0, _c_size_lookup_T_1[3:1]}) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(inflight_1 == 1024'h0 | _plusarg_reader_1_out == 32'h0 | watchdog_1 < _plusarg_reader_1_out)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: TileLink timeout expired (connected at generators/testchipip/src/main/scala/tsi/TSIHarness.scala:94:47)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [8206:0] _GEN_36 = {8195'h0, io_in_d_bits_source, 2'h0};
  wire [8206:0] _d_opcodes_clr_T_5 = 8207'hF << _GEN_36;
  wire [8194:0] _a_opcodes_set_T_1 = {8191'h0, _GEN_1 ? {io_in_a_bits_opcode, 1'h1} : 4'h0} << {8183'h0, io_in_a_bits_source, 2'h0};
  wire [8206:0] _d_sizes_clr_T_5 = 8207'hF << _GEN_36;
  wire [8193:0] _a_sizes_set_T_1 = {8191'h0, _GEN_1 ? {io_in_a_bits_size, 1'h1} : 3'h0} << {8182'h0, io_in_a_bits_source, 2'h0};
  wire [8206:0] _d_sizes_clr_T_11 = 8207'hF << _GEN_36;
  wire          d_first_done = io_in_d_ready & io_in_d_valid;
  wire          _GEN_37 = d_first_done & ~d_first_counter_1 & ~d_release_ack;
  wire          _GEN_38 = d_first_done & ~d_first_counter_2 & d_release_ack;
  always @(posedge clock) begin
    if (reset) begin
      a_first_counter <= 1'h0;
      d_first_counter <= 1'h0;
      inflight <= 1024'h0;
      inflight_opcodes <= 4096'h0;
      inflight_sizes <= 4096'h0;
      a_first_counter_1 <= 1'h0;
      d_first_counter_1 <= 1'h0;
      watchdog <= 32'h0;
      inflight_1 <= 1024'h0;
      inflight_sizes_1 <= 4096'h0;
      d_first_counter_2 <= 1'h0;
      watchdog_1 <= 32'h0;
    end
    else begin
      a_first_counter <= (~a_first_done | a_first_counter - 1'h1) & a_first_counter;
      d_first_counter <= (~d_first_done | d_first_counter - 1'h1) & d_first_counter;
      inflight <= (inflight | (_GEN_1 ? 1024'h1 << _GEN_0 : 1024'h0)) & ~(_GEN_37 ? 1024'h1 << _GEN_2 : 1024'h0);
      inflight_opcodes <= (inflight_opcodes | (_GEN_1 ? _a_opcodes_set_T_1[4095:0] : 4096'h0)) & ~(_GEN_37 ? _d_opcodes_clr_T_5[4095:0] : 4096'h0);
      inflight_sizes <= (inflight_sizes | (_GEN_1 ? _a_sizes_set_T_1[4095:0] : 4096'h0)) & ~(_GEN_37 ? _d_sizes_clr_T_5[4095:0] : 4096'h0);
      a_first_counter_1 <= (~a_first_done | a_first_counter_1 - 1'h1) & a_first_counter_1;
      d_first_counter_1 <= (~d_first_done | d_first_counter_1 - 1'h1) & d_first_counter_1;
      if (a_first_done | d_first_done)
        watchdog <= 32'h0;
      else
        watchdog <= watchdog + 32'h1;
      inflight_1 <= inflight_1 & ~(_GEN_38 ? 1024'h1 << _GEN_2 : 1024'h0);
      inflight_sizes_1 <= inflight_sizes_1 & ~(_GEN_38 ? _d_sizes_clr_T_11[4095:0] : 4096'h0);
      d_first_counter_2 <= (~d_first_done | d_first_counter_2 - 1'h1) & d_first_counter_2;
      if (d_first_done)
        watchdog_1 <= 32'h0;
      else
        watchdog_1 <= watchdog_1 + 32'h1;
    end
    if (a_first_done & ~a_first_counter) begin
      opcode <= io_in_a_bits_opcode;
      param <= io_in_a_bits_param;
      size <= io_in_a_bits_size;
      source <= io_in_a_bits_source;
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

