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

module SinkD(
  input         clock,
                reset,
  output        io_resp_valid,
                io_resp_bits_last,
  output [2:0]  io_resp_bits_opcode,
                io_resp_bits_param,
                io_resp_bits_source,
                io_resp_bits_sink,
  output        io_resp_bits_denied,
                io_d_ready,
  input         io_d_valid,
  input  [2:0]  io_d_bits_opcode,
  input  [1:0]  io_d_bits_param,
  input  [2:0]  io_d_bits_size,
                io_d_bits_source,
                io_d_bits_sink,
  input         io_d_bits_denied,
  input  [63:0] io_d_bits_data,
  input         io_d_bits_corrupt,
  output [2:0]  io_source,
  input  [2:0]  io_way,
  input  [9:0]  io_set,
  input         io_bs_adr_ready,
  output        io_bs_adr_valid,
                io_bs_adr_bits_noop,
  output [2:0]  io_bs_adr_bits_way,
  output [9:0]  io_bs_adr_bits_set,
  output [2:0]  io_bs_adr_bits_beat,
  output [63:0] io_bs_dat_data,
  output [9:0]  io_grant_req_set,
  output [2:0]  io_grant_req_way,
  input         io_grant_safe
);

  wire        _q_io_deq_ready_T_2;
  wire        _d_q_io_deq_valid;
  wire [2:0]  _d_q_io_deq_bits_opcode;
  wire [1:0]  _d_q_io_deq_bits_param;
  wire [2:0]  _d_q_io_deq_bits_size;
  wire [2:0]  _d_q_io_deq_bits_source;
  wire        _d_q_io_deq_bits_denied;
  wire        _d_q_io_deq_bits_corrupt;
  wire        _io_resp_valid_T_1 = _q_io_deq_ready_T_2 & _d_q_io_deq_valid;
  wire [12:0] _beats1_decode_T_1 = 13'h3F << _d_q_io_deq_bits_size;
  wire [2:0]  beats1 = _d_q_io_deq_bits_opcode[0] ? ~(_beats1_decode_T_1[5:3]) : 3'h0;
  reg  [2:0]  counter;
  wire [2:0]  _counter1_T = counter - 3'h1;
  wire        last = counter == 3'h1 | beats1 == 3'h0;
  wire [2:0]  beat = beats1 & ~_counter1_T;
  reg  [2:0]  io_source_r;
  assign _q_io_deq_ready_T_2 = io_bs_adr_ready & ((|counter) | io_grant_safe);
  reg  [2:0]  io_bs_adr_bits_beat_r;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & _d_q_io_deq_valid & _d_q_io_deq_bits_corrupt & ~_d_q_io_deq_bits_denied) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Data poisoning unsupported\n    at SinkD.scala:82 assert (!(d.valid && d.bits.corrupt && !d.bits.denied), \"Data poisoning unsupported\")\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  always @(posedge clock) begin
    if (reset)
      counter <= 3'h0;
    else if (_io_resp_valid_T_1) begin
      if (|counter)
        counter <= _counter1_T;
      else
        counter <= beats1;
    end
    if (_d_q_io_deq_valid) begin
      io_source_r <= _d_q_io_deq_bits_source;
      io_bs_adr_bits_beat_r <= beat + {2'h0, io_bs_adr_ready};
    end
  end // always @(posedge)
  Queue_25 d_q (
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (io_d_ready),
    .io_enq_valid        (io_d_valid),
    .io_enq_bits_opcode  (io_d_bits_opcode),
    .io_enq_bits_param   (io_d_bits_param),
    .io_enq_bits_size    (io_d_bits_size),
    .io_enq_bits_source  (io_d_bits_source),
    .io_enq_bits_sink    (io_d_bits_sink),
    .io_enq_bits_denied  (io_d_bits_denied),
    .io_enq_bits_data    (io_d_bits_data),
    .io_enq_bits_corrupt (io_d_bits_corrupt),
    .io_deq_ready        (_q_io_deq_ready_T_2),
    .io_deq_valid        (_d_q_io_deq_valid),
    .io_deq_bits_opcode  (_d_q_io_deq_bits_opcode),
    .io_deq_bits_param   (_d_q_io_deq_bits_param),
    .io_deq_bits_size    (_d_q_io_deq_bits_size),
    .io_deq_bits_source  (_d_q_io_deq_bits_source),
    .io_deq_bits_sink    (io_resp_bits_sink),
    .io_deq_bits_denied  (_d_q_io_deq_bits_denied),
    .io_deq_bits_data    (io_bs_dat_data),
    .io_deq_bits_corrupt (_d_q_io_deq_bits_corrupt)
  );
  assign io_resp_valid = (~(|counter) | last) & _io_resp_valid_T_1;
  assign io_resp_bits_last = last;
  assign io_resp_bits_opcode = _d_q_io_deq_bits_opcode;
  assign io_resp_bits_param = {1'h0, _d_q_io_deq_bits_param};
  assign io_resp_bits_source = _d_q_io_deq_bits_source;
  assign io_resp_bits_denied = _d_q_io_deq_bits_denied;
  assign io_source = _d_q_io_deq_valid ? _d_q_io_deq_bits_source : io_source_r;
  assign io_bs_adr_valid = (|counter) | _d_q_io_deq_valid & io_grant_safe;
  assign io_bs_adr_bits_noop = ~_d_q_io_deq_valid | ~(_d_q_io_deq_bits_opcode[0]);
  assign io_bs_adr_bits_way = io_way;
  assign io_bs_adr_bits_set = io_set;
  assign io_bs_adr_bits_beat = _d_q_io_deq_valid ? beat : io_bs_adr_bits_beat_r;
  assign io_grant_req_set = io_set;
  assign io_grant_req_way = io_way;
endmodule

