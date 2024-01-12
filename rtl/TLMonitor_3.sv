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

module TLMonitor_3(
  input        clock,
               reset,
               io_in_a_ready,
               io_in_a_valid,
  input [2:0]  io_in_a_bits_opcode,
               io_in_a_bits_param,
  input [3:0]  io_in_a_bits_size,
  input [4:0]  io_in_a_bits_source,
  input [32:0] io_in_a_bits_address,
  input [7:0]  io_in_a_bits_mask,
  input        io_in_a_bits_corrupt,
               io_in_b_ready,
               io_in_b_valid,
  input [1:0]  io_in_b_bits_param,
  input [32:0] io_in_b_bits_address,
  input        io_in_c_ready,
               io_in_c_valid,
  input [2:0]  io_in_c_bits_opcode,
               io_in_c_bits_param,
  input [3:0]  io_in_c_bits_size,
  input [4:0]  io_in_c_bits_source,
  input [32:0] io_in_c_bits_address,
  input        io_in_c_bits_corrupt,
               io_in_d_ready,
               io_in_d_valid,
  input [2:0]  io_in_d_bits_opcode,
  input [1:0]  io_in_d_bits_param,
  input [3:0]  io_in_d_bits_size,
  input [4:0]  io_in_d_bits_source,
  input [1:0]  io_in_d_bits_sink,
  input        io_in_d_bits_denied,
               io_in_d_bits_corrupt,
               io_in_e_valid,
  input [1:0]  io_in_e_bits_sink
);

  wire [31:0]  _plusarg_reader_1_out;
  wire [31:0]  _plusarg_reader_out;
  wire [26:0]  _GEN = {23'h0, io_in_a_bits_size};
  wire [26:0]  _GEN_0 = {23'h0, io_in_c_bits_size};
  wire         _a_first_T_1 = io_in_a_ready & io_in_a_valid;
  reg  [8:0]   a_first_counter;
  reg  [2:0]   opcode;
  reg  [2:0]   param;
  reg  [3:0]   size;
  reg  [4:0]   source;
  reg  [32:0]  address;
  wire         _d_first_T_3 = io_in_d_ready & io_in_d_valid;
  reg  [8:0]   d_first_counter;
  reg  [2:0]   opcode_1;
  reg  [1:0]   param_1;
  reg  [3:0]   size_1;
  reg  [4:0]   source_1;
  reg  [1:0]   sink;
  reg          denied;
  reg  [8:0]   b_first_counter;
  reg  [1:0]   param_2;
  reg  [32:0]  address_1;
  wire         _c_first_T_1 = io_in_c_ready & io_in_c_valid;
  reg  [8:0]   c_first_counter;
  reg  [2:0]   opcode_3;
  reg  [2:0]   param_3;
  reg  [3:0]   size_3;
  reg  [4:0]   source_3;
  reg  [32:0]  address_2;
  reg  [16:0]  inflight;
  reg  [67:0]  inflight_opcodes;
  reg  [135:0] inflight_sizes;
  reg  [8:0]   a_first_counter_1;
  wire         a_first_1 = a_first_counter_1 == 9'h0;
  reg  [8:0]   d_first_counter_1;
  wire         d_first_1 = d_first_counter_1 == 9'h0;
  wire [67:0]  _a_opcode_lookup_T_1 = inflight_opcodes >> {61'h0, io_in_d_bits_source, 2'h0};
  wire [31:0]  _GEN_1 = {27'h0, io_in_a_bits_source};
  wire         _GEN_2 = _a_first_T_1 & a_first_1;
  wire         d_release_ack = io_in_d_bits_opcode == 3'h6;
  wire [31:0]  _GEN_3 = {27'h0, io_in_d_bits_source};
  reg  [2:0]   casez_tmp;
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
  reg  [2:0]   casez_tmp_0;
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
  reg  [2:0]   casez_tmp_1;
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
  reg  [2:0]   casez_tmp_2;
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
  reg  [31:0]  watchdog;
  reg  [16:0]  inflight_1;
  reg  [135:0] inflight_sizes_1;
  reg  [8:0]   c_first_counter_1;
  wire         c_first_1 = c_first_counter_1 == 9'h0;
  reg  [8:0]   d_first_counter_2;
  wire         d_first_2 = d_first_counter_2 == 9'h0;
  wire         _GEN_4 = io_in_c_bits_opcode[2] & io_in_c_bits_opcode[1];
  wire [31:0]  _GEN_5 = {27'h0, io_in_c_bits_source};
  wire         _GEN_6 = _c_first_T_1 & c_first_1 & _GEN_4;
  reg  [31:0]  watchdog_1;
  reg  [3:0]   inflight_2;
  reg  [8:0]   d_first_counter_3;
  wire         d_first_3 = d_first_counter_3 == 9'h0;
  wire         _GEN_7 = _d_first_T_3 & d_first_3 & io_in_d_bits_opcode[2] & ~(io_in_d_bits_opcode[1]);
  wire [3:0]   _GEN_8 = {2'h0, io_in_d_bits_sink};
  wire [3:0]   d_set = _GEN_7 ? 4'h1 << _GEN_8 : 4'h0;
  wire [3:0]   _GEN_9 = {2'h0, io_in_e_bits_sink};
  `ifndef SYNTHESIS
    wire         _source_ok_WIRE_1 = io_in_a_bits_source == 5'h9;
    wire         _source_ok_WIRE_2 = io_in_a_bits_source == 5'h10;
    wire         source_ok = ~(io_in_a_bits_source[4]) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_1 | _source_ok_WIRE_2;
    wire [26:0]  _is_aligned_mask_T_1 = 27'hFFF << _GEN;
    wire [11:0]  _GEN_10 = io_in_a_bits_address[11:0] & ~(_is_aligned_mask_T_1[11:0]);
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
    wire         _GEN_11 = io_in_a_bits_size < 4'hD;
    wire         _GEN_12 = io_in_a_bits_size < 4'h7;
    wire         _GEN_13 = {io_in_a_bits_address[32], ~(io_in_a_bits_address[31])} == 2'h0;
    wire         _GEN_14 = io_in_a_bits_address[32:31] == 2'h2;
    wire         _GEN_15 = _GEN_12 & (_GEN_13 | _GEN_14);
    wire         _GEN_16 = io_in_a_valid & io_in_a_bits_opcode == 3'h6 & ~reset;
    wire         _GEN_17 = io_in_a_bits_size == 4'h6;
    wire         _GEN_18 = io_in_a_bits_address[32:13] == 20'h0;
    wire         _GEN_19 = {io_in_a_bits_address[32:14], ~(io_in_a_bits_address[13:12])} == 21'h0;
    wire         _GEN_20 = {io_in_a_bits_address[32:17], ~(io_in_a_bits_address[16])} == 17'h0;
    wire         _GEN_21 = {io_in_a_bits_address[32:21], io_in_a_bits_address[20:17] ^ 4'h8, io_in_a_bits_address[15:12]} == 20'h0;
    wire         _GEN_22 = {io_in_a_bits_address[32:26], io_in_a_bits_address[25:16] ^ 10'h200} == 17'h0;
    wire         _GEN_23 = {io_in_a_bits_address[32:28], ~(io_in_a_bits_address[27:26])} == 7'h0;
    wire         _GEN_24 = _GEN_18 | _GEN_19;
    wire         _GEN_25 = _GEN_11 & (_GEN_24 | _GEN_20 | _GEN_21 | _GEN_22 | _GEN_23 | _GEN_13 | _GEN_14);
    wire         _GEN_26 = io_in_a_bits_param > 3'h2;
    wire         _GEN_27 = io_in_a_bits_mask != 8'hFF;
    wire         _GEN_28 = io_in_a_valid & (&io_in_a_bits_opcode) & ~reset;
    wire         _GEN_29 = io_in_a_valid & io_in_a_bits_opcode == 3'h4 & ~reset;
    wire         _GEN_30 = _GEN_11 & _GEN_19;
    wire         _GEN_31 = io_in_a_bits_mask != mask;
    wire         _GEN_32 = _GEN_30 | _GEN_12 & (_GEN_18 | _GEN_21 | _GEN_22 | _GEN_23 | _GEN_13 | _GEN_14);
    wire         _GEN_33 = io_in_a_valid & io_in_a_bits_opcode == 3'h0 & ~reset;
    wire         _GEN_34 = io_in_a_valid & io_in_a_bits_opcode == 3'h1 & ~reset;
    wire         _GEN_35 = io_in_a_bits_size < 4'h4 & (_GEN_24 | _GEN_21 | _GEN_22 | _GEN_23);
    wire         _GEN_36 = io_in_a_valid & io_in_a_bits_opcode == 3'h2 & ~reset;
    wire         _GEN_37 = io_in_a_valid & io_in_a_bits_opcode == 3'h3 & ~reset;
    wire         _GEN_38 = io_in_a_valid & io_in_a_bits_opcode == 3'h5 & ~reset;
    wire         source_ok_1 = ~(io_in_d_bits_source[4]) & io_in_d_bits_source[3:0] < 4'h9 | io_in_d_bits_source == 5'h9 | io_in_d_bits_source == 5'h10;
    wire         _GEN_39 = io_in_d_valid & io_in_d_bits_opcode == 3'h6 & ~reset;
    wire         _GEN_40 = io_in_d_bits_size < 4'h3;
    wire         _GEN_41 = io_in_d_valid & io_in_d_bits_opcode == 3'h4 & ~reset;
    wire         _GEN_42 = io_in_d_bits_param == 2'h2;
    wire         _GEN_43 = io_in_d_valid & io_in_d_bits_opcode == 3'h5 & ~reset;
    wire         _GEN_44 = ~io_in_d_bits_denied | io_in_d_bits_corrupt;
    wire         _GEN_45 = io_in_d_valid & io_in_d_bits_opcode == 3'h0 & ~reset;
    wire         _GEN_46 = io_in_d_valid & io_in_d_bits_opcode == 3'h1 & ~reset;
    wire         _GEN_47 = io_in_d_valid & io_in_d_bits_opcode == 3'h2 & ~reset;
    wire [20:0]  _GEN_48 = {io_in_b_bits_address[32:14], ~(io_in_b_bits_address[13:12])};
    wire [6:0]   _GEN_49 = {io_in_b_bits_address[32:28], ~(io_in_b_bits_address[27:26])};
    wire [16:0]  _GEN_50 = {io_in_b_bits_address[32:26], io_in_b_bits_address[25:16] ^ 10'h200};
    wire [16:0]  _GEN_51 = {io_in_b_bits_address[32:17], ~(io_in_b_bits_address[16])};
    wire [8:0]   _GEN_52 = io_in_b_bits_address[20:12] ^ 9'h100;
    wire [1:0]   _GEN_53 = {io_in_b_bits_address[32], ~(io_in_b_bits_address[31])};
    wire         _GEN_54 = io_in_b_bits_address[32:31] != 2'h2;
    wire         _GEN_55 = io_in_b_valid & ~reset;
    wire         _source_ok_WIRE_2_1 = io_in_c_bits_source == 5'h9;
    wire         _source_ok_WIRE_2_2 = io_in_c_bits_source == 5'h10;
    wire         source_ok_2 = ~(io_in_c_bits_source[4]) & io_in_c_bits_source[3:0] < 4'h9 | _source_ok_WIRE_2_1 | _source_ok_WIRE_2_2;
    wire [26:0]  _is_aligned_mask_T_7 = 27'hFFF << _GEN_0;
    wire [11:0]  _GEN_56 = io_in_c_bits_address[11:0] & ~(_is_aligned_mask_T_7[11:0]);
    wire [20:0]  _GEN_57 = {io_in_c_bits_address[32:14], ~(io_in_c_bits_address[13:12])};
    wire [6:0]   _GEN_58 = {io_in_c_bits_address[32:28], ~(io_in_c_bits_address[27:26])};
    wire [16:0]  _GEN_59 = {io_in_c_bits_address[32:26], io_in_c_bits_address[25:16] ^ 10'h200};
    wire [16:0]  _GEN_60 = {io_in_c_bits_address[32:17], ~(io_in_c_bits_address[16])};
    wire [8:0]   _GEN_61 = io_in_c_bits_address[20:12] ^ 9'h100;
    wire [1:0]   _GEN_62 = {io_in_c_bits_address[32], ~(io_in_c_bits_address[31])};
    wire         _GEN_63 = io_in_c_bits_address[32:31] != 2'h2;
    wire         address_ok_1 = ~(|_GEN_57) | {io_in_c_bits_address[32:13], ~(io_in_c_bits_address[12])} == 21'h0 | ~(|_GEN_58) | ~(|_GEN_59) | io_in_c_bits_address[32:12] == 21'h0 | ~(|_GEN_60) | {io_in_c_bits_address[32:21], _GEN_61} == 21'h0 | {io_in_c_bits_address[32:21], io_in_c_bits_address[20:12] ^ 9'h110} == 21'h0 | ~(|_GEN_62) | ~_GEN_63;
    wire         _GEN_64 = io_in_c_valid & io_in_c_bits_opcode == 3'h4 & ~reset;
    wire         _GEN_65 = io_in_c_bits_size < 4'h3;
    wire         _GEN_66 = io_in_c_valid & io_in_c_bits_opcode == 3'h5 & ~reset;
    wire         _GEN_67 = io_in_c_bits_size < 4'hD;
    wire         _GEN_68 = io_in_c_bits_size < 4'h7 & (~(|_GEN_62) | ~_GEN_63);
    wire         _GEN_69 = io_in_c_valid & io_in_c_bits_opcode == 3'h6 & ~reset;
    wire         _GEN_70 = io_in_c_bits_size == 4'h6;
    wire         _GEN_71 = _GEN_67 & (io_in_c_bits_address[32:13] == 20'h0 | ~(|_GEN_57) | ~(|_GEN_60) | {io_in_c_bits_address[32:21], _GEN_61[8:5], io_in_c_bits_address[15:12]} == 20'h0 | ~(|_GEN_59) | ~(|_GEN_58) | ~(|_GEN_62) | ~_GEN_63);
    wire         _GEN_72 = io_in_c_valid & (&io_in_c_bits_opcode) & ~reset;
    wire         _GEN_73 = io_in_c_valid & io_in_c_bits_opcode == 3'h0 & ~reset;
    wire         _GEN_74 = io_in_c_valid & io_in_c_bits_opcode == 3'h1 & ~reset;
    wire         _GEN_75 = io_in_c_valid & io_in_c_bits_opcode == 3'h2 & ~reset;
    wire         _GEN_76 = io_in_a_valid & (|a_first_counter) & ~reset;
    wire         _GEN_77 = io_in_d_valid & (|d_first_counter) & ~reset;
    wire         _GEN_78 = io_in_b_valid & (|b_first_counter) & ~reset;
    wire         _GEN_79 = io_in_c_valid & (|c_first_counter) & ~reset;
    wire [135:0] _GEN_80 = {128'h0, io_in_d_bits_source, 3'h0};
    wire         _same_cycle_resp_T_1 = io_in_a_valid & a_first_1;
    wire [31:0]  _a_set_wo_ready_T = 32'h1 << _GEN_1;
    wire [16:0]  a_set_wo_ready = _same_cycle_resp_T_1 ? _a_set_wo_ready_T[16:0] : 17'h0;
    wire         _GEN_81 = io_in_d_valid & d_first_1;
    wire         _GEN_82 = _GEN_81 & ~d_release_ack;
    wire         same_cycle_resp = _same_cycle_resp_T_1 & io_in_a_bits_source == io_in_d_bits_source;
    wire [16:0]  _GEN_83 = {12'h0, io_in_d_bits_source};
    wire         _GEN_84 = _GEN_82 & same_cycle_resp & ~reset;
    wire         _GEN_85 = _GEN_82 & ~same_cycle_resp & ~reset;
    wire [7:0]   _GEN_86 = {4'h0, io_in_d_bits_size};
    wire         _same_cycle_resp_T_3 = io_in_c_valid & c_first_1;
    wire [31:0]  _c_set_wo_ready_T = 32'h1 << _GEN_5;
    wire [16:0]  c_set_wo_ready = _same_cycle_resp_T_3 & _GEN_4 ? _c_set_wo_ready_T[16:0] : 17'h0;
    wire         _GEN_87 = io_in_d_valid & d_first_2;
    wire         _GEN_88 = _GEN_87 & d_release_ack;
    wire         same_cycle_resp_1 = _same_cycle_resp_T_3 & io_in_c_bits_opcode[2] & io_in_c_bits_opcode[1] & io_in_c_bits_source == io_in_d_bits_source;
    wire [16:0]  _GEN_89 = inflight >> io_in_a_bits_source;
    wire [16:0]  _GEN_90 = inflight >> _GEN_83;
    wire [135:0] _a_size_lookup_T_1 = inflight_sizes >> _GEN_80;
    wire [31:0]  _d_clr_wo_ready_T = 32'h1 << _GEN_3;
    wire [16:0]  _GEN_91 = inflight_1 >> io_in_c_bits_source;
    wire [16:0]  _GEN_92 = inflight_1 >> _GEN_83;
    wire [135:0] _c_size_lookup_T_1 = inflight_sizes_1 >> _GEN_80;
    wire [31:0]  _d_clr_wo_ready_T_1 = 32'h1 << _GEN_3;
    wire [3:0]   _GEN_93 = inflight_2 >> _GEN_8;
    wire [3:0]   _GEN_94 = (d_set | inflight_2) >> _GEN_9;
    always @(posedge clock) begin
      if (_GEN_16 & ~(_GEN_11 & (~(io_in_a_bits_source[4]) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_1 | _source_ok_WIRE_2) & _GEN_15)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquireBlock type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & ~(~(io_in_a_bits_source[4]) & io_in_a_bits_source[3:0] < 4'h9 & _GEN_17 & _GEN_25)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquireBlock from a client which does not support Probe (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & ~_mask_T) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock smaller than a beat (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & (|_GEN_10)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & _GEN_26) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock carries invalid grow param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & _GEN_27) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_16 & io_in_a_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquireBlock is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & ~(_GEN_11 & (~(io_in_a_bits_source[4]) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_1 | _source_ok_WIRE_2) & _GEN_15)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquirePerm type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & ~(~(io_in_a_bits_source[4]) & io_in_a_bits_source[3:0] < 4'h9 & _GEN_17 & _GEN_25)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries AcquirePerm from a client which does not support Probe (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & ~_mask_T) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm smaller than a beat (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & (|_GEN_10)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & _GEN_26) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm carries invalid grow param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & ~(|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm requests NtoB (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & _GEN_27) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_28 & io_in_a_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel AcquirePerm is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & ~(_GEN_11 & (~(io_in_a_bits_source[4]) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_1 | _source_ok_WIRE_2))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Get type which master claims it can't emit (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & ~(_GEN_30 | _GEN_12 & (_GEN_18 | _GEN_20 | _GEN_21 | _GEN_22 | _GEN_23 | _GEN_13 | _GEN_14))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Get type which slave claims it can't support (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & (|_GEN_10)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & (|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & _GEN_31) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_29 & io_in_a_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Get is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_33 & ~(_GEN_11 & (~(io_in_a_bits_source[4]) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_1 | _source_ok_WIRE_2) & _GEN_32)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries PutFull type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_33 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_33 & (|_GEN_10)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_33 & (|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_33 & _GEN_31) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutFull contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_34 & ~(_GEN_11 & (~(io_in_a_bits_source[4]) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_1 | _source_ok_WIRE_2) & _GEN_32)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries PutPartial type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_34 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_34 & (|_GEN_10)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_34 & (|io_in_a_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_34 & (|(io_in_a_bits_mask & ~mask))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel PutPartial contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_36 & ~(_GEN_11 & (~(io_in_a_bits_source[4]) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_1 | _source_ok_WIRE_2) & _GEN_35)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Arithmetic type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_36 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_36 & (|_GEN_10)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_36 & io_in_a_bits_param > 3'h4) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic carries invalid opcode param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_36 & _GEN_31) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Arithmetic contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_37 & ~(_GEN_11 & (~(io_in_a_bits_source[4]) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_1 | _source_ok_WIRE_2) & _GEN_35)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Logical type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_37 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_37 & (|_GEN_10)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_37 & io_in_a_bits_param[2]) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical carries invalid opcode param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_37 & _GEN_31) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Logical contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_38 & ~(_GEN_11 & (~(io_in_a_bits_source[4]) & io_in_a_bits_source[3:0] < 4'h9 | _source_ok_WIRE_1 | _source_ok_WIRE_2) & _GEN_30)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel carries Hint type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_38 & ~source_ok) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_38 & (|_GEN_10)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_38 & (|(io_in_a_bits_param[2:1]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint carries invalid opcode param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_38 & _GEN_31) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint contains invalid mask (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_38 & io_in_a_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel Hint is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_in_d_valid & ~reset & (&io_in_d_bits_opcode)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel has invalid opcode (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_39 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_39 & _GEN_40) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck smaller than a beat (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_39 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseeAck carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_39 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_39 & io_in_d_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel ReleaseAck is denied (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_41 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_41 & _GEN_40) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant smaller than a beat (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_41 & (&io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries invalid cap param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_41 & _GEN_42) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant carries toN param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_41 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel Grant is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_43 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_43 & _GEN_40) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData smaller than a beat (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_43 & (&io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries invalid cap param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_43 & _GEN_42) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData carries toN param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_43 & ~_GEN_44) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel GrantData is denied but not corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_45 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_45 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_45 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAck is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_46 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_46 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_46 & ~_GEN_44) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel AccessAckData is denied but not corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_47 & ~source_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_47 & (|io_in_d_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_47 & io_in_d_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel HintAck is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_55 & ~(io_in_b_bits_address[32:13] == 20'h0 | ~(|_GEN_48) | ~(|_GEN_51) | {io_in_b_bits_address[32:21], _GEN_52[8:5], io_in_b_bits_address[15:12]} == 20'h0 | ~(|_GEN_50) | ~(|_GEN_49) | ~(|_GEN_53) | ~_GEN_54)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'B' channel carries Probe type which is unexpected using diplomatic parameters (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_55 & ~(~(|_GEN_48) | {io_in_b_bits_address[32:13], ~(io_in_b_bits_address[12])} == 21'h0 | ~(|_GEN_49) | ~(|_GEN_50) | io_in_b_bits_address[32:12] == 21'h0 | ~(|_GEN_51) | {io_in_b_bits_address[32:21], _GEN_52} == 21'h0 | {io_in_b_bits_address[32:21], io_in_b_bits_address[20:12] ^ 9'h110} == 21'h0 | ~(|_GEN_53) | ~_GEN_54)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'B' channel Probe carries unmanaged address (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_55 & (|(io_in_b_bits_address[5:0]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'B' channel Probe address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_55 & (&io_in_b_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'B' channel Probe carries invalid cap param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_64 & ~address_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ProbeAck carries unmanaged address (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_64 & ~source_ok_2) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ProbeAck carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_64 & _GEN_65) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ProbeAck smaller than a beat (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_64 & (|_GEN_56)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ProbeAck address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_64 & (&(io_in_c_bits_param[2:1]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ProbeAck carries invalid report param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_64 & io_in_c_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ProbeAck is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_66 & ~address_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ProbeAckData carries unmanaged address (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_66 & ~source_ok_2) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ProbeAckData carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_66 & _GEN_65) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ProbeAckData smaller than a beat (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_66 & (|_GEN_56)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ProbeAckData address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_66 & (&(io_in_c_bits_param[2:1]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ProbeAckData carries invalid report param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_69 & ~(_GEN_67 & (~(io_in_c_bits_source[4]) & io_in_c_bits_source[3:0] < 4'h9 | _source_ok_WIRE_2_1 | _source_ok_WIRE_2_2) & _GEN_68)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel carries Release type unsupported by manager (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_69 & ~(~(io_in_c_bits_source[4]) & io_in_c_bits_source[3:0] < 4'h9 & _GEN_70 & _GEN_71)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel carries Release from a client which does not support Probe (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_69 & ~source_ok_2) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel Release carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_69 & _GEN_65) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel Release smaller than a beat (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_69 & (|_GEN_56)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel Release address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_69 & (&(io_in_c_bits_param[2:1]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel Release carries invalid report param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_69 & io_in_c_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel Release is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_72 & ~(_GEN_67 & (~(io_in_c_bits_source[4]) & io_in_c_bits_source[3:0] < 4'h9 | _source_ok_WIRE_2_1 | _source_ok_WIRE_2_2) & _GEN_68)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel carries ReleaseData type unsupported by manager (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_72 & ~(~(io_in_c_bits_source[4]) & io_in_c_bits_source[3:0] < 4'h9 & _GEN_70 & _GEN_71)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel carries Release from a client which does not support Probe (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_72 & ~source_ok_2) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ReleaseData carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_72 & _GEN_65) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ReleaseData smaller than a beat (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_72 & (|_GEN_56)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ReleaseData address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_72 & (&(io_in_c_bits_param[2:1]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel ReleaseData carries invalid report param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_73 & ~address_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel AccessAck carries unmanaged address (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_73 & ~source_ok_2) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel AccessAck carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_73 & (|_GEN_56)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel AccessAck address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_73 & (|io_in_c_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel AccessAck carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_73 & io_in_c_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel AccessAck is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_74 & ~address_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel AccessAckData carries unmanaged address (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_74 & ~source_ok_2) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel AccessAckData carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_74 & (|_GEN_56)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel AccessAckData address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_74 & (|io_in_c_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel AccessAckData carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_75 & ~address_ok_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel HintAck carries unmanaged address (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_75 & ~source_ok_2) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel HintAck carries invalid source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_75 & (|_GEN_56)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel HintAck address not aligned to size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_75 & (|io_in_c_bits_param)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel HintAck carries invalid param (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_75 & io_in_c_bits_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel HintAck is corrupt (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_76 & io_in_a_bits_opcode != opcode) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel opcode changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_76 & io_in_a_bits_param != param) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel param changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_76 & io_in_a_bits_size != size) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel size changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_76 & io_in_a_bits_source != source) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel source changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_76 & io_in_a_bits_address != address) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel address changed with multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_77 & io_in_d_bits_opcode != opcode_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel opcode changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_77 & io_in_d_bits_param != param_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel param changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_77 & io_in_d_bits_size != size_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel size changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_77 & io_in_d_bits_source != source_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel source changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_77 & io_in_d_bits_sink != sink) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel sink changed with multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_77 & io_in_d_bits_denied != denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel denied changed with multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_78 & io_in_b_bits_param != param_2) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'B' channel param changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_78 & io_in_b_bits_address != address_1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'B' channel addresss changed with multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_79 & io_in_c_bits_opcode != opcode_3) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel opcode changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_79 & io_in_c_bits_param != param_3) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel param changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_79 & io_in_c_bits_size != size_3) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel size changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_79 & io_in_c_bits_source != source_3) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel source changed within multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_79 & io_in_c_bits_address != address_2) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel address changed with multibeat operation (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_2 & ~reset & _GEN_89[0]) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' channel re-used a source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_82 & ~reset & ~(_GEN_90[0] | same_cycle_resp)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_84 & ~(io_in_d_bits_opcode == casez_tmp | io_in_d_bits_opcode == casez_tmp_0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper opcode response (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_84 & io_in_a_bits_size != io_in_d_bits_size) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_85 & ~(io_in_d_bits_opcode == casez_tmp_1 | io_in_d_bits_opcode == casez_tmp_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper opcode response (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_85 & _GEN_86 != {1'h0, _a_size_lookup_T_1[7:1]}) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_81 & a_first_1 & io_in_a_valid & io_in_a_bits_source == io_in_d_bits_source & ~d_release_ack & ~reset & ~(~io_in_d_ready | io_in_a_ready)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: ready check\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(a_set_wo_ready != (_GEN_82 ? _d_clr_wo_ready_T[16:0] : 17'h0) | a_set_wo_ready == 17'h0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'A' and 'D' concurrent, despite minlatency 1 (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(inflight == 17'h0 | _plusarg_reader_out == 32'h0 | watchdog < _plusarg_reader_out)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: TileLink timeout expired (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_6 & ~reset & _GEN_91[0]) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' channel re-used a source ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_88 & ~reset & ~(_GEN_92[0] | same_cycle_resp_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel acknowledged for nothing inflight (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_88 & same_cycle_resp_1 & ~reset & io_in_d_bits_size != io_in_c_bits_size) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_88 & ~same_cycle_resp_1 & ~reset & _GEN_86 != {1'h0, _c_size_lookup_T_1[7:1]}) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel contains improper response size (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_87 & c_first_1 & io_in_c_valid & io_in_c_bits_source == io_in_d_bits_source & d_release_ack & ~(io_in_c_bits_opcode == 3'h4 | io_in_c_bits_opcode == 3'h5) & ~reset & ~(~io_in_d_ready | io_in_c_ready)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: ready check\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if ((|c_set_wo_ready) & ~reset & c_set_wo_ready == (_GEN_88 ? _d_clr_wo_ready_T_1[16:0] : 17'h0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'C' and 'D' concurrent, despite minlatency 1 (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(inflight_1 == 17'h0 | _plusarg_reader_1_out == 32'h0 | watchdog_1 < _plusarg_reader_1_out)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: TileLink timeout expired (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_7 & ~reset & _GEN_93[0]) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'D' channel re-used a sink ID (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:49 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_in_e_valid & ~reset & ~(_GEN_94[0])) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: 'E' channel acknowledged for nothing inflight (connected at generators/rocket-chip/src/main/scala/subsystem/SystemBus.scala:41:96)\n    at Monitor.scala:42 assert(cond, message)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [26:0]  _a_first_beats1_decode_T_1 = 27'hFFF << _GEN;
  wire [26:0]  _a_first_beats1_decode_T_5 = 27'hFFF << _GEN;
  wire [26:0]  _GEN_95 = {23'h0, io_in_d_bits_size};
  wire [26:0]  _d_first_beats1_decode_T_1 = 27'hFFF << _GEN_95;
  wire [26:0]  _d_first_beats1_decode_T_5 = 27'hFFF << _GEN_95;
  wire [26:0]  _d_first_beats1_decode_T_9 = 27'hFFF << _GEN_95;
  wire [26:0]  _d_first_beats1_decode_T_13 = 27'hFFF << _GEN_95;
  wire [26:0]  _c_first_beats1_decode_T_1 = 27'hFFF << _GEN_0;
  wire [26:0]  _c_first_beats1_decode_T_5 = 27'hFFF << _GEN_0;
  wire         _GEN_96 = _d_first_T_3 & d_first_1 & ~d_release_ack;
  wire [270:0] _GEN_97 = {263'h0, io_in_d_bits_source, 3'h0};
  wire         _GEN_98 = _d_first_T_3 & d_first_2 & d_release_ack;
  wire [31:0]  _d_clr_T = 32'h1 << _GEN_3;
  wire [31:0]  _a_set_T = 32'h1 << _GEN_1;
  wire [270:0] _d_opcodes_clr_T_5 = 271'hF << {264'h0, io_in_d_bits_source, 2'h0};
  wire [258:0] _a_opcodes_set_T_1 = {255'h0, _GEN_2 ? {io_in_a_bits_opcode, 1'h1} : 4'h0} << {252'h0, io_in_a_bits_source, 2'h0};
  wire [270:0] _d_sizes_clr_T_5 = 271'hFF << _GEN_97;
  wire [259:0] _a_sizes_set_T_1 = {255'h0, _GEN_2 ? {io_in_a_bits_size, 1'h1} : 5'h0} << {252'h0, io_in_a_bits_source, 3'h0};
  wire [31:0]  _d_clr_T_1 = 32'h1 << _GEN_3;
  wire [31:0]  _c_set_T = 32'h1 << _GEN_5;
  wire [270:0] _d_sizes_clr_T_11 = 271'hFF << _GEN_97;
  wire [259:0] _c_sizes_set_T_1 = {255'h0, _GEN_6 ? {io_in_c_bits_size, 1'h1} : 5'h0} << {252'h0, io_in_c_bits_source, 3'h0};
  wire         b_first_done = io_in_b_ready & io_in_b_valid;
  always @(posedge clock) begin
    if (reset) begin
      a_first_counter <= 9'h0;
      d_first_counter <= 9'h0;
      b_first_counter <= 9'h0;
      c_first_counter <= 9'h0;
      inflight <= 17'h0;
      inflight_opcodes <= 68'h0;
      inflight_sizes <= 136'h0;
      a_first_counter_1 <= 9'h0;
      d_first_counter_1 <= 9'h0;
      watchdog <= 32'h0;
      inflight_1 <= 17'h0;
      inflight_sizes_1 <= 136'h0;
      c_first_counter_1 <= 9'h0;
      d_first_counter_2 <= 9'h0;
      watchdog_1 <= 32'h0;
      inflight_2 <= 4'h0;
      d_first_counter_3 <= 9'h0;
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
      if (_d_first_T_3) begin
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
        if (d_first_3)
          d_first_counter_3 <= io_in_d_bits_opcode[0] ? ~(_d_first_beats1_decode_T_13[11:3]) : 9'h0;
        else
          d_first_counter_3 <= d_first_counter_3 - 9'h1;
      end
      if (b_first_done) begin
        if (|b_first_counter)
          b_first_counter <= b_first_counter - 9'h1;
        else
          b_first_counter <= 9'h0;
      end
      if (_c_first_T_1) begin
        if (|c_first_counter)
          c_first_counter <= c_first_counter - 9'h1;
        else
          c_first_counter <= io_in_c_bits_opcode[0] ? ~(_c_first_beats1_decode_T_1[11:3]) : 9'h0;
        if (c_first_1)
          c_first_counter_1 <= io_in_c_bits_opcode[0] ? ~(_c_first_beats1_decode_T_5[11:3]) : 9'h0;
        else
          c_first_counter_1 <= c_first_counter_1 - 9'h1;
      end
      inflight <= (inflight | (_GEN_2 ? _a_set_T[16:0] : 17'h0)) & ~(_GEN_96 ? _d_clr_T[16:0] : 17'h0);
      inflight_opcodes <= (inflight_opcodes | (_GEN_2 ? _a_opcodes_set_T_1[67:0] : 68'h0)) & ~(_GEN_96 ? _d_opcodes_clr_T_5[67:0] : 68'h0);
      inflight_sizes <= (inflight_sizes | (_GEN_2 ? _a_sizes_set_T_1[135:0] : 136'h0)) & ~(_GEN_96 ? _d_sizes_clr_T_5[135:0] : 136'h0);
      if (_a_first_T_1 | _d_first_T_3)
        watchdog <= 32'h0;
      else
        watchdog <= watchdog + 32'h1;
      inflight_1 <= (inflight_1 | (_GEN_6 ? _c_set_T[16:0] : 17'h0)) & ~(_GEN_98 ? _d_clr_T_1[16:0] : 17'h0);
      inflight_sizes_1 <= (inflight_sizes_1 | (_GEN_6 ? _c_sizes_set_T_1[135:0] : 136'h0)) & ~(_GEN_98 ? _d_sizes_clr_T_11[135:0] : 136'h0);
      if (_c_first_T_1 | _d_first_T_3)
        watchdog_1 <= 32'h0;
      else
        watchdog_1 <= watchdog_1 + 32'h1;
      inflight_2 <= (inflight_2 | d_set) & ~(io_in_e_valid ? 4'h1 << _GEN_9 : 4'h0);
    end
    if (_a_first_T_1 & ~(|a_first_counter)) begin
      opcode <= io_in_a_bits_opcode;
      param <= io_in_a_bits_param;
      size <= io_in_a_bits_size;
      source <= io_in_a_bits_source;
      address <= io_in_a_bits_address;
    end
    if (_d_first_T_3 & ~(|d_first_counter)) begin
      opcode_1 <= io_in_d_bits_opcode;
      param_1 <= io_in_d_bits_param;
      size_1 <= io_in_d_bits_size;
      source_1 <= io_in_d_bits_source;
      sink <= io_in_d_bits_sink;
      denied <= io_in_d_bits_denied;
    end
    if (b_first_done & ~(|b_first_counter)) begin
      param_2 <= io_in_b_bits_param;
      address_1 <= io_in_b_bits_address;
    end
    if (_c_first_T_1 & ~(|c_first_counter)) begin
      opcode_3 <= io_in_c_bits_opcode;
      param_3 <= io_in_c_bits_param;
      size_3 <= io_in_c_bits_size;
      source_3 <= io_in_c_bits_source;
      address_2 <= io_in_c_bits_address;
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

