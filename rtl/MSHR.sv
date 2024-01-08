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

module MSHR(
  input         clock,
                reset,
                io_allocate_valid,
                io_allocate_bits_prio_0,
                io_allocate_bits_prio_1,
                io_allocate_bits_prio_2,
                io_allocate_bits_control,
  input  [2:0]  io_allocate_bits_opcode,
                io_allocate_bits_param,
                io_allocate_bits_size,
  input  [5:0]  io_allocate_bits_source,
  input  [16:0] io_allocate_bits_tag,
  input  [5:0]  io_allocate_bits_offset,
                io_allocate_bits_put,
  input  [9:0]  io_allocate_bits_set,
  input         io_allocate_bits_repeat,
                io_directory_valid,
                io_directory_bits_dirty,
  input  [1:0]  io_directory_bits_state,
  input         io_directory_bits_clients,
  input  [16:0] io_directory_bits_tag,
  input         io_directory_bits_hit,
  input  [2:0]  io_directory_bits_way,
  output        io_status_valid,
  output [9:0]  io_status_bits_set,
  output [16:0] io_status_bits_tag,
  output [2:0]  io_status_bits_way,
  output        io_status_bits_blockC,
                io_status_bits_nestC,
  input         io_schedule_ready,
  output        io_schedule_valid,
                io_schedule_bits_a_valid,
  output [16:0] io_schedule_bits_a_bits_tag,
  output [9:0]  io_schedule_bits_a_bits_set,
  output [2:0]  io_schedule_bits_a_bits_param,
  output        io_schedule_bits_a_bits_block,
                io_schedule_bits_b_valid,
  output [2:0]  io_schedule_bits_b_bits_param,
  output [16:0] io_schedule_bits_b_bits_tag,
  output [9:0]  io_schedule_bits_b_bits_set,
  output        io_schedule_bits_b_bits_clients,
                io_schedule_bits_c_valid,
  output [2:0]  io_schedule_bits_c_bits_opcode,
                io_schedule_bits_c_bits_param,
  output [16:0] io_schedule_bits_c_bits_tag,
  output [9:0]  io_schedule_bits_c_bits_set,
  output [2:0]  io_schedule_bits_c_bits_way,
  output        io_schedule_bits_c_bits_dirty,
                io_schedule_bits_d_valid,
                io_schedule_bits_d_bits_prio_0,
                io_schedule_bits_d_bits_prio_2,
  output [2:0]  io_schedule_bits_d_bits_opcode,
                io_schedule_bits_d_bits_param,
                io_schedule_bits_d_bits_size,
  output [5:0]  io_schedule_bits_d_bits_source,
                io_schedule_bits_d_bits_offset,
                io_schedule_bits_d_bits_put,
  output [9:0]  io_schedule_bits_d_bits_set,
  output [2:0]  io_schedule_bits_d_bits_way,
  output        io_schedule_bits_d_bits_bad,
                io_schedule_bits_e_valid,
  output [2:0]  io_schedule_bits_e_bits_sink,
  output        io_schedule_bits_x_valid,
                io_schedule_bits_dir_valid,
  output [9:0]  io_schedule_bits_dir_bits_set,
  output [2:0]  io_schedule_bits_dir_bits_way,
  output        io_schedule_bits_dir_bits_data_dirty,
  output [1:0]  io_schedule_bits_dir_bits_data_state,
  output        io_schedule_bits_dir_bits_data_clients,
  output [16:0] io_schedule_bits_dir_bits_data_tag,
  output        io_schedule_bits_reload,
  input         io_sinkc_valid,
                io_sinkc_bits_last,
  input  [16:0] io_sinkc_bits_tag,
  input  [5:0]  io_sinkc_bits_source,
  input  [2:0]  io_sinkc_bits_param,
  input         io_sinkc_bits_data,
                io_sinkd_valid,
                io_sinkd_bits_last,
  input  [2:0]  io_sinkd_bits_opcode,
                io_sinkd_bits_param,
                io_sinkd_bits_sink,
  input         io_sinkd_bits_denied,
                io_sinke_valid,
  input  [9:0]  io_nestedwb_set,
  input  [16:0] io_nestedwb_tag,
  input         io_nestedwb_b_toN,
                io_nestedwb_b_toB,
                io_nestedwb_b_clr_dirty,
                io_nestedwb_c_set_dirty
);

  reg         request_valid;
  reg         request_prio_0;
  reg         request_prio_1;
  reg         request_prio_2;
  reg         request_control;
  reg  [2:0]  request_opcode;
  reg  [2:0]  request_param;
  reg  [2:0]  request_size;
  reg  [5:0]  request_source;
  reg  [16:0] request_tag;
  reg  [5:0]  request_offset;
  reg  [5:0]  request_put;
  reg  [9:0]  request_set;
  reg         meta_valid;
  reg         meta_dirty;
  reg  [1:0]  meta_state;
  reg         evict_c;
  reg  [16:0] meta_tag;
  reg         meta_hit;
  reg  [2:0]  meta_way;
  reg         s_rprobe;
  reg         w_rprobeackfirst;
  reg         w_rprobeacklast;
  reg         s_release;
  reg         w_releaseack;
  reg         s_pprobe;
  reg         s_acquire;
  reg         s_flush;
  reg         w_grantfirst;
  reg         w_grantlast;
  reg         w_grant;
  reg         w_pprobeackfirst;
  reg         w_pprobeacklast;
  reg         w_pprobeack;
  reg         s_grantack;
  reg         s_execute;
  reg         w_grantack;
  reg         s_writeback;
  reg  [2:0]  sink;
  reg         gotT;
  reg         bad_grant;
  reg         probes_done;
  reg         probes_toN;
  wire        _io_status_bits_nestC_output = meta_valid & (~w_rprobeackfirst | ~w_pprobeackfirst | ~w_grantfirst);
  wire        no_wait = w_rprobeacklast & w_releaseack & w_grantlast & w_pprobeacklast & w_grantack;
  wire        _io_schedule_bits_a_valid_output = ~s_acquire & s_release & s_pprobe;
  wire        _io_schedule_bits_b_valid_output = ~s_rprobe | ~s_pprobe;
  wire        _io_schedule_bits_c_valid_output = ~s_release & w_rprobeackfirst;
  wire        _io_schedule_bits_d_valid_output = ~s_execute & w_pprobeack & w_grant;
  wire        _io_schedule_bits_e_valid_output = ~s_grantack & w_grantfirst;
  wire        _io_schedule_bits_x_valid_output = ~s_flush & w_releaseack;
  wire        _io_schedule_bits_dir_valid_output = ~s_release & w_rprobeackfirst | ~s_writeback & no_wait;
  wire        _io_schedule_valid_output = _io_schedule_bits_a_valid_output | _io_schedule_bits_b_valid_output | _io_schedule_bits_c_valid_output | _io_schedule_bits_d_valid_output | _io_schedule_bits_e_valid_output | _io_schedule_bits_x_valid_output | _io_schedule_bits_dir_valid_output;
  wire        req_clientBit = request_source[5:4] == 2'h0 & request_source[3:0] < 4'h9;
  wire        _excluded_client_T_1 = request_opcode == 3'h6;
  wire        req_needT = ~(request_opcode[2]) | request_opcode == 3'h5 & request_param == 3'h1 | (_excluded_client_T_1 | (&request_opcode)) & (|request_param);
  wire        req_acquire = _excluded_client_T_1 | (&request_opcode);
  wire        _final_meta_writeback_state_T_2 = request_param != 3'h3 & meta_state == 2'h2;
  wire        _final_meta_writeback_clients_T_7 = evict_c & ~((request_param == 3'h1 | request_param == 3'h2 | request_param == 3'h5) & req_clientBit);
  wire        _GEN = (~meta_hit | ~probes_toN) & evict_c;
  wire [1:0]  _final_meta_writeback_state_T_6 = {1'h1, ~req_acquire};
  wire [1:0]  _final_meta_writeback_state_T_7 = gotT ? _final_meta_writeback_state_T_6 : 2'h1;
  wire [1:0]  _final_meta_writeback_state_T_9 = {1'h1, ~(~evict_c & req_acquire)};
  wire [1:0]  _final_meta_writeback_state_T_13 = {meta_state == 2'h2, 1'h1};
  wire        _final_meta_writeback_clients_T_14 = meta_hit & evict_c & ~probes_toN | req_acquire & req_clientBit;
  wire        _GEN_0 = request_prio_2 | request_control;
  wire        _GEN_1 = request_prio_2 | ~request_control;
  wire        _io_schedule_bits_dir_bits_data_WIRE_dirty = ~bad_grant & (request_prio_2 ? meta_dirty | request_opcode[0] : request_control ? ~meta_hit & meta_dirty : meta_hit & meta_dirty | ~(request_opcode[2]));
  wire [1:0]  _GEN_2 = {1'h0, meta_hit};
  wire [1:0]  _io_schedule_bits_dir_bits_data_WIRE_state = bad_grant ? _GEN_2 : request_prio_2 ? (_final_meta_writeback_state_T_2 ? 2'h3 : meta_state) : request_control ? (meta_hit ? 2'h0 : meta_state) : req_needT ? _final_meta_writeback_state_T_6 : meta_hit ? ((&meta_state) ? _final_meta_writeback_state_T_9 : _final_meta_writeback_state_T_13) : _final_meta_writeback_state_T_7;
  wire        _GEN_3 = meta_hit & evict_c & ~probes_toN;
  wire        _io_schedule_bits_dir_bits_data_WIRE_clients = bad_grant ? _GEN_3 : request_prio_2 ? _final_meta_writeback_clients_T_7 : request_control ? _GEN : _final_meta_writeback_clients_T_14;
  wire        excluded_client = meta_hit & request_prio_0 & (_excluded_client_T_1 | (&request_opcode) | request_opcode == 3'h4) & req_clientBit;
  wire [3:0]  _GEN_4 = {2'h1, ~evict_c, ~meta_dirty};
  wire [3:0]  _GEN_5 = {3'h1, ~meta_dirty};
  reg  [3:0]  casez_tmp;
  always @(*) begin
    casez (meta_state)
      2'b00:
        casez_tmp = {~(|meta_state), 3'h0};
      2'b01:
        casez_tmp = {3'h0, ~evict_c};
      2'b10:
        casez_tmp = _GEN_5;
      default:
        casez_tmp = _GEN_4;
    endcase
  end // always @(*)
  reg  [3:0]  casez_tmp_0;
  always @(*) begin
    casez (meta_state)
      2'b00:
        casez_tmp_0 = {~(|meta_state), 3'h0};
      2'b01:
        casez_tmp_0 = {3'h0, ~evict_c};
      2'b10:
        casez_tmp_0 = _GEN_5;
      default:
        casez_tmp_0 = _GEN_4;
    endcase
  end // always @(*)
  wire [3:0]  _GEN_6 = {2'h1, ~_io_schedule_bits_dir_bits_data_WIRE_clients, ~_io_schedule_bits_dir_bits_data_WIRE_dirty};
  wire [3:0]  _GEN_7 = {3'h1, ~_io_schedule_bits_dir_bits_data_WIRE_dirty};
  reg  [3:0]  casez_tmp_1;
  always @(*) begin
    casez (_io_schedule_bits_dir_bits_data_WIRE_state)
      2'b00:
        casez_tmp_1 = {~(|_io_schedule_bits_dir_bits_data_WIRE_state), 3'h0};
      2'b01:
        casez_tmp_1 = {3'h0, ~_io_schedule_bits_dir_bits_data_WIRE_clients};
      2'b10:
        casez_tmp_1 = _GEN_7;
      default:
        casez_tmp_1 = _GEN_6;
    endcase
  end // always @(*)
  wire        _new_meta_T = io_allocate_valid & io_allocate_bits_repeat;
  wire        new_meta_hit = _new_meta_T ? (bad_grant ? meta_hit : _GEN_1) : io_directory_bits_hit;
  wire        new_request_prio_2 = io_allocate_valid ? io_allocate_bits_prio_2 : request_prio_2;
  reg  [3:0]  casez_tmp_2;
  always @(*) begin
    casez (_io_schedule_bits_dir_bits_data_WIRE_state)
      2'b00:
        casez_tmp_2 = {~(|_io_schedule_bits_dir_bits_data_WIRE_state), 3'h0};
      2'b01:
        casez_tmp_2 = {3'h0, ~_io_schedule_bits_dir_bits_data_WIRE_clients};
      2'b10:
        casez_tmp_2 = _GEN_7;
      default:
        casez_tmp_2 = _GEN_6;
    endcase
  end // always @(*)
  wire        _GEN_8 = io_directory_valid | _new_meta_T;
  `ifndef SYNTHESIS
    wire       _GEN_9 = meta_valid & ~(|meta_state) & ~reset;
    wire       _GEN_10 = meta_state == 2'h1;
    wire       _GEN_11 = meta_valid & meta_state == 2'h2 & ~reset;
    wire [3:0] evict = meta_hit ? 4'h8 : casez_tmp;
    wire [3:0] before_0 = meta_hit ? casez_tmp_0 : 4'h8;
    wire       _GEN_12 = ~s_release & w_rprobeackfirst & io_schedule_ready & ~reset;
    wire       _GEN_13 = before_0 == 4'h1;
    wire       _GEN_14 = before_0 == 4'h0;
    wire       _GEN_15 = before_0 == 4'h8;
    wire       _GEN_16 = casez_tmp_1 == 4'h1;
    wire       _GEN_17 = ~s_writeback & no_wait & io_schedule_ready & ~reset;
    wire       _GEN_18 = casez_tmp_1 == 4'h0;
    wire       _GEN_19 = casez_tmp_1 == 4'h7;
    wire       _GEN_20 = casez_tmp_1 == 4'h5;
    wire       _GEN_21 = casez_tmp_1 == 4'h4;
    wire       _GEN_22 = casez_tmp_1 == 4'h6;
    wire       _GEN_23 = casez_tmp_1 == 4'h3;
    wire       _GEN_24 = casez_tmp_1 == 4'h2;
    wire       _GEN_25 = casez_tmp_1 == 4'h8;
    wire       _GEN_26 = before_0 == 4'h7;
    wire       _GEN_27 = before_0 == 4'h5;
    wire       _GEN_28 = before_0 == 4'h6;
    wire       _GEN_29 = before_0 == 4'h4;
    wire       _GEN_30 = before_0 == 4'h3;
    wire       _GEN_31 = before_0 == 4'h2;
    wire       _GEN_32 = _new_meta_T & ~reset;
    always @(posedge clock) begin
      if (_GEN_9 & evict_c) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at MSHR.scala:105 assert (!meta.clients.orR)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_9 & meta_dirty) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at MSHR.scala:106 assert (!meta.dirty)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (meta_valid & _GEN_10 & ~reset & meta_dirty) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at MSHR.scala:109 assert (!meta.dirty)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & ~evict_c) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at MSHR.scala:112 assert (meta.clients.orR)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_11 & evict_c & evict_c - 1'h1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at MSHR.scala:113 assert ((meta.clients & (meta.clients - 1.U)) === 0.U) // at most one\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~(meta_valid & w_releaseack & w_rprobeacklast & w_pprobeacklast & ~w_grantfirst) | ~(~meta_valid | (~w_releaseack | ~w_rprobeacklast | ~w_pprobeacklast) & ~w_grantfirst))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at MSHR.scala:179 assert (!io.status.bits.nestB || !io.status.bits.blockB)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~_io_status_bits_nestC_output | meta_valid)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at MSHR.scala:180 assert (!io.status.bits.nestC || !io.status.bits.blockC)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (bad_grant & meta_hit & ~reset & ~(~meta_valid | _GEN_10)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at MSHR.scala:254 assert (!meta_valid || meta.state === BRANCH)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_12 & evict == 4'h1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH to evicted should be impossible (false,true,true,false,true)\n    at MSHR.scala:346 assert(!(evict === from.code), cf\"State transition from ${from} to evicted should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_12 & _GEN_13) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH to flushed should be impossible (false,true,true,false,true)\n    at MSHR.scala:351 assert(!(before === from.code), cf\"State transition from ${from} to flushed should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_12 & evict == 4'h0) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH_C to evicted should be impossible (false,true,true,false,true)\n    at MSHR.scala:346 assert(!(evict === from.code), cf\"State transition from ${from} to evicted should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_12 & _GEN_14) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH_C to flushed should be impossible (false,true,true,false,true)\n    at MSHR.scala:351 assert(!(before === from.code), cf\"State transition from ${from} to flushed should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_15 & _GEN_16) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_INVALID to S_BRANCH should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_15 & _GEN_18) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_INVALID to S_BRANCH_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_15 & _GEN_20) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_INVALID to S_TIP_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_15 & _GEN_21) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_INVALID to S_TIP_CD should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_15 & _GEN_24) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_INVALID to S_TRUNK_CD should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_13 & _GEN_25) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH to S_INVALID should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_13 & _GEN_18) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH to S_BRANCH_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_13 & _GEN_19) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH to S_TIP should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_13 & _GEN_20) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH to S_TIP_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_13 & _GEN_21) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH to S_TIP_CD should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_13 & _GEN_22) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH to S_TIP_D should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_13 & _GEN_23) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH to S_TRUNK_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_13 & _GEN_24) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH to S_TRUNK_CD should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_14 & _GEN_25) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH_C to S_INVALID should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_14 & _GEN_16) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH_C to S_BRANCH should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_14 & _GEN_19) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH_C to S_TIP should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_14 & _GEN_20) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH_C to S_TIP_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_14 & _GEN_22) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH_C to S_TIP_D should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_14 & _GEN_21) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH_C to S_TIP_CD should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_14 & _GEN_23) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH_C to S_TRUNK_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_14 & _GEN_24) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_BRANCH_C to S_TRUNK_CD should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_26 & _GEN_25) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP to S_INVALID should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_26 & _GEN_16) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP to S_BRANCH should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_26 & _GEN_18) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP to S_BRANCH_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_26 & _GEN_20) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP to S_TIP_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_26 & _GEN_21) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP to S_TIP_CD should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_26 & _GEN_24) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP to S_TRUNK_CD should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_27 & _GEN_25) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_C to S_INVALID should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_27 & _GEN_16) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_C to S_BRANCH should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_27 & _GEN_18) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_C to S_BRANCH_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_27 & _GEN_21) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_C to S_TIP_CD should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_27 & _GEN_24) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_C to S_TRUNK_CD should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_28 & _GEN_25) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_D to S_INVALID should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_28 & _GEN_16) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_D to S_BRANCH should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_28 & _GEN_18) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_D to S_BRANCH_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_28 & _GEN_19) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_D to S_TIP should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_28 & _GEN_20) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_D to S_TIP_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_28 & _GEN_21) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_D to S_TIP_CD should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_28 & _GEN_23) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_D to S_TRUNK_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_29 & _GEN_25) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_CD to S_INVALID should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_29 & _GEN_16) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_CD to S_BRANCH should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_29 & _GEN_18) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_CD to S_BRANCH_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_29 & _GEN_19) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_CD to S_TIP should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_29 & _GEN_20) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_CD to S_TIP_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_29 & _GEN_23) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TIP_CD to S_TRUNK_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_30 & _GEN_25) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TRUNK_C to S_INVALID should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_30 & _GEN_16) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TRUNK_C to S_BRANCH should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_30 & _GEN_18) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TRUNK_C to S_BRANCH_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_31 & _GEN_25) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TRUNK_CD to S_INVALID should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_31 & _GEN_16) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TRUNK_CD to S_BRANCH should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_31 & _GEN_18) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TRUNK_CD to S_BRANCH_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_31 & _GEN_19) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TRUNK_CD to S_TIP should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_31 & _GEN_20) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TRUNK_CD to S_TIP_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_17 & _GEN_31 & _GEN_23) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State transition from S_TRUNK_CD to S_TRUNK_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:359 assert(!(before === from.code && after === to.code), cf\"State transition from ${from} to ${to} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_32 & casez_tmp_2 == 4'h1) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State bypass from S_BRANCH should be impossible (false,true,true,false,true)\n    at MSHR.scala:516 assert(!(prior === from.code), cf\"State bypass from ${from} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_32 & casez_tmp_2 == 4'h0) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: State bypass from S_BRANCH_C should be impossible (false,true,true,false,true)\n    at MSHR.scala:516 assert(!(prior === from.code), cf\"State bypass from ${from} should be impossible ${cfg}\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (io_allocate_valid & ~reset & ~(~request_valid | no_wait & io_schedule_ready & _io_schedule_valid_output)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at MSHR.scala:533 assert (!request_valid || (no_wait && io.schedule.fire))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_8 & new_request_prio_2 & ~reset & ~new_meta_hit) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at MSHR.scala:585 assert (new_meta.hit)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        new_meta_dirty = _new_meta_T ? _io_schedule_bits_dir_bits_data_WIRE_dirty : io_directory_bits_dirty;
  wire [1:0]  new_meta_state = _new_meta_T ? _io_schedule_bits_dir_bits_data_WIRE_state : io_directory_bits_state;
  wire        new_meta_clients = _new_meta_T ? _io_schedule_bits_dir_bits_data_WIRE_clients : io_directory_bits_clients;
  wire        new_request_control = io_allocate_valid ? io_allocate_bits_control : request_control;
  wire [2:0]  new_request_opcode = io_allocate_valid ? io_allocate_bits_opcode : request_opcode;
  wire [2:0]  new_request_param = io_allocate_valid ? io_allocate_bits_param : request_param;
  wire [5:0]  new_request_source = io_allocate_valid ? io_allocate_bits_source : request_source;
  wire        _new_skipProbe_T = new_request_opcode == 3'h6;
  wire        new_needT = ~(new_request_opcode[2]) | new_request_opcode == 3'h5 & new_request_param == 3'h1 | (_new_skipProbe_T | (&new_request_opcode)) & (|new_request_param);
  wire        new_clientBit = new_request_source[5:4] == 2'h0 & new_request_source[3:0] < 4'h9;
  wire        _GEN_33 = new_meta_state == 2'h2;
  wire        _GEN_34 = ~new_meta_hit & (|new_meta_state);
  wire        _GEN_35 = new_request_prio_2 | (new_request_control ? ~new_meta_hit : ~_GEN_34);
  wire        _GEN_36 = new_request_prio_2 | (new_request_control ? ~new_meta_hit | ~new_meta_clients : ~_GEN_34 | ~new_meta_clients);
  wire        _GEN_37 = ~new_meta_hit | new_meta_state == 2'h1 & new_needT;
  wire        _GEN_38 = new_request_prio_2 | new_request_control;
  wire        _GEN_39 = _GEN_38 | ~_GEN_37;
  wire        _GEN_40 = new_meta_hit & (new_needT | _GEN_33) & new_meta_clients & ~((_new_skipProbe_T | (&new_request_opcode) | new_request_opcode == 3'h4) & new_clientBit);
  wire        _GEN_41 = _GEN_38 | ~_GEN_40;
  wire        _GEN_42 = _new_skipProbe_T | (&new_request_opcode);
  wire        _GEN_43 = io_schedule_ready & no_wait;
  wire        _GEN_44 = meta_valid & (|meta_state) & io_nestedwb_set == request_set & io_nestedwb_tag == meta_tag;
  wire        probe_bit = io_sinkc_bits_source[5:4] == 2'h0 & io_sinkc_bits_source[3:0] < 4'h9;
  wire        _GEN_45 = io_sinkd_bits_opcode == 3'h4 | io_sinkd_bits_opcode == 3'h5;
  wire        _GEN_46 = io_sinkd_valid & _GEN_45;
  wire        last_probe = (probes_done | probe_bit) == (evict_c & ~excluded_client);
  wire        _GEN_47 = io_sinkc_valid & last_probe;
  wire        _GEN_48 = io_sinkc_valid & last_probe & io_sinkc_bits_last;
  always @(posedge clock) begin
    if (reset) begin
      request_valid <= 1'h0;
      meta_valid <= 1'h0;
      s_rprobe <= 1'h1;
      w_rprobeackfirst <= 1'h1;
      w_rprobeacklast <= 1'h1;
      s_release <= 1'h1;
      w_releaseack <= 1'h1;
      s_pprobe <= 1'h1;
      s_acquire <= 1'h1;
      s_flush <= 1'h1;
      w_grantfirst <= 1'h1;
      w_grantlast <= 1'h1;
      w_grant <= 1'h1;
      w_pprobeackfirst <= 1'h1;
      w_pprobeacklast <= 1'h1;
      w_pprobeack <= 1'h1;
      s_grantack <= 1'h1;
      s_execute <= 1'h1;
      w_grantack <= 1'h1;
      s_writeback <= 1'h1;
    end
    else begin
      request_valid <= io_allocate_valid | ~_GEN_43 & request_valid;
      meta_valid <= _GEN_8 | ~_GEN_43 & meta_valid;
      if (_GEN_8) begin
        s_rprobe <= _GEN_36;
        w_rprobeackfirst <= _GEN_36;
        w_rprobeacklast <= _GEN_36;
        s_release <= _GEN_35;
        w_releaseack <= _GEN_35;
        s_pprobe <= _GEN_41;
        s_acquire <= _GEN_39;
        s_flush <= new_request_prio_2 | ~new_request_control;
        w_grantfirst <= _GEN_39;
        w_grantlast <= _GEN_39;
        w_grant <= _GEN_39;
        w_pprobeackfirst <= _GEN_41;
        w_pprobeacklast <= _GEN_41;
        w_pprobeack <= _GEN_41;
        s_grantack <= _GEN_39;
        s_execute <= ~new_request_prio_2 & new_request_control;
        w_grantack <= _GEN_38 | ~_GEN_42;
        s_writeback <= new_request_prio_2 ? ~((new_request_param == 3'h1 | new_request_param == 3'h2 | new_request_param == 3'h5) & new_meta_clients & new_clientBit | (new_request_param == 3'h0 | new_request_param == 3'h4) & _GEN_33) & ~(new_request_opcode[0] & ~new_meta_dirty) : new_request_control | ~(~(new_request_opcode[2]) & new_meta_hit & ~new_meta_dirty | _GEN_42 | _GEN_40) & ~_GEN_37;
      end
      else begin
        s_rprobe <= io_schedule_ready | s_rprobe;
        w_rprobeackfirst <= _GEN_47 | w_rprobeackfirst;
        w_rprobeacklast <= _GEN_48 | w_rprobeacklast;
        s_release <= io_schedule_ready & w_rprobeackfirst | s_release;
        w_releaseack <= io_sinkd_valid & ~_GEN_45 & io_sinkd_bits_opcode == 3'h6 | w_releaseack;
        s_pprobe <= io_schedule_ready | s_pprobe;
        s_acquire <= io_schedule_ready & s_release & s_pprobe | s_acquire;
        s_flush <= io_schedule_ready & w_releaseack | s_flush;
        w_grantfirst <= _GEN_46 | w_grantfirst;
        if (_GEN_46) begin
          w_grantlast <= io_sinkd_bits_last;
          w_grant <= ~(|request_offset) | io_sinkd_bits_last;
        end
        w_pprobeackfirst <= _GEN_47 | w_pprobeackfirst;
        w_pprobeacklast <= _GEN_48 | w_pprobeacklast;
        w_pprobeack <= io_sinkc_valid & last_probe & (io_sinkc_bits_last | ~(|request_offset)) | w_pprobeack;
        s_grantack <= io_schedule_ready & w_grantfirst | s_grantack;
        s_execute <= io_schedule_ready & w_pprobeack & w_grant | s_execute;
        w_grantack <= io_sinke_valid | w_grantack;
        s_writeback <= _GEN_43 | s_writeback;
      end
    end
    if (io_allocate_valid) begin
      request_prio_0 <= io_allocate_bits_prio_0;
      request_prio_1 <= io_allocate_bits_prio_1;
      request_prio_2 <= io_allocate_bits_prio_2;
      request_control <= io_allocate_bits_control;
      request_opcode <= io_allocate_bits_opcode;
      request_param <= io_allocate_bits_param;
      request_size <= io_allocate_bits_size;
      request_source <= io_allocate_bits_source;
      request_tag <= io_allocate_bits_tag;
      request_offset <= io_allocate_bits_offset;
      request_put <= io_allocate_bits_put;
      request_set <= io_allocate_bits_set;
    end
    if (_GEN_8) begin
      if (_new_meta_T) begin
        meta_dirty <= _io_schedule_bits_dir_bits_data_WIRE_dirty;
        if (bad_grant) begin
          meta_state <= _GEN_2;
          evict_c <= _GEN_3;
        end
        else begin
          if (request_prio_2) begin
            if (_final_meta_writeback_state_T_2)
              meta_state <= 2'h3;
            evict_c <= _final_meta_writeback_clients_T_7;
          end
          else if (request_control) begin
            if (meta_hit)
              meta_state <= 2'h0;
            evict_c <= _GEN;
          end
          else begin
            if (req_needT)
              meta_state <= _final_meta_writeback_state_T_6;
            else if (meta_hit) begin
              if (&meta_state)
                meta_state <= _final_meta_writeback_state_T_9;
              else
                meta_state <= _final_meta_writeback_state_T_13;
            end
            else
              meta_state <= _final_meta_writeback_state_T_7;
            evict_c <= _final_meta_writeback_clients_T_14;
          end
          meta_hit <= _GEN_1;
        end
        if (~_GEN_0)
          meta_tag <= request_tag;
      end
      else begin
        meta_dirty <= io_directory_bits_dirty;
        meta_state <= io_directory_bits_state;
        evict_c <= io_directory_bits_clients;
        meta_tag <= io_directory_bits_tag;
        meta_hit <= io_directory_bits_hit;
      end
    end
    else begin
      meta_dirty <= io_sinkc_valid & (|meta_state) & io_sinkc_bits_tag == meta_tag & io_sinkc_bits_data | (_GEN_44 ? io_nestedwb_c_set_dirty | ~io_nestedwb_b_clr_dirty & meta_dirty : meta_dirty);
      if (_GEN_44 & io_nestedwb_b_toB)
        meta_state <= 2'h1;
      meta_hit <= ~(_GEN_44 & io_nestedwb_b_toN) & meta_hit;
    end
    if (~_GEN_8 | _new_meta_T) begin
    end
    else
      meta_way <= io_directory_bits_way;
    if (_GEN_46)
      sink <= io_sinkd_bits_sink;
    gotT <= ~_GEN_8 & (_GEN_46 ? io_sinkd_bits_param == 3'h0 : gotT);
    bad_grant <= ~_GEN_8 & (_GEN_46 ? io_sinkd_bits_denied : bad_grant);
    probes_done <= ~_GEN_8 & (io_sinkc_valid & probe_bit | probes_done);
    probes_toN <= ~_GEN_8 & (io_sinkc_valid & (io_sinkc_bits_param == 3'h1 | io_sinkc_bits_param == 3'h2 | io_sinkc_bits_param == 3'h5) & probe_bit | probes_toN);
  end // always @(posedge)
  assign io_status_valid = request_valid;
  assign io_status_bits_set = request_set;
  assign io_status_bits_tag = request_tag;
  assign io_status_bits_way = meta_way;
  assign io_status_bits_blockC = ~meta_valid;
  assign io_status_bits_nestC = _io_status_bits_nestC_output;
  assign io_schedule_valid = _io_schedule_valid_output;
  assign io_schedule_bits_a_valid = _io_schedule_bits_a_valid_output;
  assign io_schedule_bits_a_bits_tag = request_tag;
  assign io_schedule_bits_a_bits_set = request_set;
  assign io_schedule_bits_a_bits_param = {1'h0, req_needT ? (meta_hit ? 2'h2 : 2'h1) : 2'h0};
  assign io_schedule_bits_a_bits_block = request_size != 3'h6 | ~(request_opcode == 3'h0 | (&request_opcode));
  assign io_schedule_bits_b_valid = _io_schedule_bits_b_valid_output;
  assign io_schedule_bits_b_bits_param = s_rprobe ? (request_prio_1 ? request_param : {1'h0, req_needT ? 2'h2 : 2'h1}) : 3'h2;
  assign io_schedule_bits_b_bits_tag = s_rprobe ? request_tag : meta_tag;
  assign io_schedule_bits_b_bits_set = request_set;
  assign io_schedule_bits_b_bits_clients = evict_c & ~excluded_client;
  assign io_schedule_bits_c_valid = _io_schedule_bits_c_valid_output;
  assign io_schedule_bits_c_bits_opcode = {2'h3, meta_dirty};
  assign io_schedule_bits_c_bits_param = meta_state == 2'h1 ? 3'h2 : 3'h1;
  assign io_schedule_bits_c_bits_tag = meta_tag;
  assign io_schedule_bits_c_bits_set = request_set;
  assign io_schedule_bits_c_bits_way = meta_way;
  assign io_schedule_bits_c_bits_dirty = meta_dirty;
  assign io_schedule_bits_d_valid = _io_schedule_bits_d_valid_output;
  assign io_schedule_bits_d_bits_prio_0 = request_prio_0;
  assign io_schedule_bits_d_bits_prio_2 = request_prio_2;
  assign io_schedule_bits_d_bits_opcode = request_opcode;
  assign io_schedule_bits_d_bits_param = req_acquire ? (request_param == 3'h1 ? 3'h1 : request_param == 3'h2 ? {1'h0, meta_hit & evict_c & req_clientBit ? 2'h2 : 2'h1} : request_param == 3'h0 ? {2'h0, req_acquire & (meta_hit ? ~evict_c & (&meta_state) : gotT)} : request_param) : request_param;
  assign io_schedule_bits_d_bits_size = request_size;
  assign io_schedule_bits_d_bits_source = request_source;
  assign io_schedule_bits_d_bits_offset = request_offset;
  assign io_schedule_bits_d_bits_put = request_put;
  assign io_schedule_bits_d_bits_set = request_set;
  assign io_schedule_bits_d_bits_way = meta_way;
  assign io_schedule_bits_d_bits_bad = bad_grant;
  assign io_schedule_bits_e_valid = _io_schedule_bits_e_valid_output;
  assign io_schedule_bits_e_bits_sink = sink;
  assign io_schedule_bits_x_valid = _io_schedule_bits_x_valid_output;
  assign io_schedule_bits_dir_valid = _io_schedule_bits_dir_valid_output;
  assign io_schedule_bits_dir_bits_set = request_set;
  assign io_schedule_bits_dir_bits_way = meta_way;
  assign io_schedule_bits_dir_bits_data_dirty = s_release & _io_schedule_bits_dir_bits_data_WIRE_dirty;
  assign io_schedule_bits_dir_bits_data_state = s_release ? _io_schedule_bits_dir_bits_data_WIRE_state : 2'h0;
  assign io_schedule_bits_dir_bits_data_clients = s_release & _io_schedule_bits_dir_bits_data_WIRE_clients;
  assign io_schedule_bits_dir_bits_data_tag = s_release ? (_GEN_0 ? meta_tag : request_tag) : 17'h0;
  assign io_schedule_bits_reload = no_wait;
endmodule

