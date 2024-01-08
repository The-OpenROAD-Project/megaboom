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

module SourceC(
  input         clock,
                reset,
  output        io_req_ready,
  input         io_req_valid,
  input  [2:0]  io_req_bits_opcode,
                io_req_bits_param,
                io_req_bits_source,
  input  [16:0] io_req_bits_tag,
  input  [9:0]  io_req_bits_set,
  input  [2:0]  io_req_bits_way,
  input         io_req_bits_dirty,
                io_c_ready,
  output        io_c_valid,
  output [2:0]  io_c_bits_opcode,
                io_c_bits_param,
                io_c_bits_size,
                io_c_bits_source,
  output [32:0] io_c_bits_address,
  output [63:0] io_c_bits_data,
  output        io_c_bits_corrupt,
  input         io_bs_adr_ready,
  output        io_bs_adr_valid,
  output [2:0]  io_bs_adr_bits_way,
  output [9:0]  io_bs_adr_bits_set,
  output [2:0]  io_bs_adr_bits_beat,
  input  [63:0] io_bs_dat_data,
  output [9:0]  io_evict_req_set,
  output [2:0]  io_evict_req_way,
  input         io_evict_safe
);

  wire        _queue_io_enq_ready;
  wire        _queue_io_deq_valid;
  wire [3:0]  _queue_io_count;
  reg  [3:0]  fill;
  reg         room;
  reg         busy;
  reg  [2:0]  beat;
  reg  [2:0]  req_r_opcode;
  reg  [2:0]  req_r_param;
  reg  [2:0]  req_r_source;
  reg  [16:0] req_r_tag;
  reg  [9:0]  req_r_set;
  reg  [2:0]  req_r_way;
  wire [9:0]  req_set = busy ? req_r_set : io_req_bits_set;
  wire [2:0]  req_way = busy ? req_r_way : io_req_bits_way;
  wire        _want_data_T = io_req_valid & room;
  wire        want_data = busy | _want_data_T & io_req_bits_dirty;
  wire        _io_req_ready_output = ~busy & room;
  wire        _io_bs_adr_valid_output = ((|beat) | io_evict_safe) & want_data;
  reg         s2_valid;
  reg  [2:0]  s2_req_opcode;
  reg  [2:0]  s2_req_param;
  reg  [2:0]  s2_req_source;
  reg  [16:0] s2_req_tag;
  reg  [9:0]  s2_req_set;
  reg         s3_valid;
  reg  [2:0]  s3_req_opcode;
  reg  [2:0]  s3_req_param;
  reg  [2:0]  s3_req_source;
  reg  [16:0] s3_req_tag;
  reg  [9:0]  s3_req_set;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & room != (_queue_io_count < 4'h2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at SourceC.scala:64 assert (room === queue.io.count <= 1.U)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~s3_valid | _queue_io_enq_ready)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at SourceC.scala:119 assert(!c.valid || c.ready)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        _room_T_4 = _queue_io_enq_ready & s3_valid;
  wire        _s2_latch_T = io_bs_adr_ready & _io_bs_adr_valid_output;
  wire        s2_latch = want_data ? _s2_latch_T : _io_req_ready_output & io_req_valid;
  always @(posedge clock) begin
    if (reset) begin
      fill <= 4'h0;
      room <= 1'h1;
      busy <= 1'h0;
      beat <= 3'h0;
    end
    else begin
      if (~(_room_T_4 == (io_c_ready & _queue_io_deq_valid))) begin
        fill <= fill + (_room_T_4 ? 4'h1 : 4'hF);
        room <= fill == 4'h0 | (fill == 4'h1 | fill == 4'h2) & ~_room_T_4;
      end
      busy <= ~(_s2_latch_T & (&beat)) & (_want_data_T & io_req_bits_dirty | busy);
      if (_s2_latch_T) begin
        if (&beat)
          beat <= 3'h0;
        else
          beat <= beat + 3'h1;
      end
    end
    if (~busy & io_req_valid) begin
      req_r_opcode <= io_req_bits_opcode;
      req_r_param <= io_req_bits_param;
      req_r_source <= io_req_bits_source;
      req_r_tag <= io_req_bits_tag;
      req_r_set <= io_req_bits_set;
      req_r_way <= io_req_bits_way;
    end
    s2_valid <= s2_latch;
    if (s2_latch) begin
      s2_req_opcode <= busy ? req_r_opcode : io_req_bits_opcode;
      s2_req_param <= busy ? req_r_param : io_req_bits_param;
      s2_req_source <= busy ? req_r_source : io_req_bits_source;
      s2_req_tag <= busy ? req_r_tag : io_req_bits_tag;
      s2_req_set <= req_set;
    end
    s3_valid <= s2_valid;
    if (s2_valid) begin
      s3_req_opcode <= s2_req_opcode;
      s3_req_param <= s2_req_param;
      s3_req_source <= s2_req_source;
      s3_req_tag <= s2_req_tag;
      s3_req_set <= s2_req_set;
    end
  end // always @(posedge)
  Queue_19 queue (
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (_queue_io_enq_ready),
    .io_enq_valid        (s3_valid),
    .io_enq_bits_opcode  (s3_req_opcode),
    .io_enq_bits_param   (s3_req_param),
    .io_enq_bits_source  (s3_req_source),
    .io_enq_bits_address ({s3_req_tag, s3_req_set, 6'h0}),
    .io_enq_bits_data    (io_bs_dat_data),
    .io_deq_ready        (io_c_ready),
    .io_deq_valid        (_queue_io_deq_valid),
    .io_deq_bits_opcode  (io_c_bits_opcode),
    .io_deq_bits_param   (io_c_bits_param),
    .io_deq_bits_size    (io_c_bits_size),
    .io_deq_bits_source  (io_c_bits_source),
    .io_deq_bits_address (io_c_bits_address),
    .io_deq_bits_data    (io_c_bits_data),
    .io_deq_bits_corrupt (io_c_bits_corrupt),
    .io_count            (_queue_io_count)
  );
  assign io_req_ready = _io_req_ready_output;
  assign io_c_valid = _queue_io_deq_valid;
  assign io_bs_adr_valid = _io_bs_adr_valid_output;
  assign io_bs_adr_bits_way = req_way;
  assign io_bs_adr_bits_set = req_set;
  assign io_bs_adr_bits_beat = beat;
  assign io_evict_req_set = req_set;
  assign io_evict_req_way = req_way;
endmodule

