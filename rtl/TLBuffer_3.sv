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

module TLBuffer_3(
  input         clock,
                reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
  input  [3:0]  auto_in_a_bits_size,
                auto_in_a_bits_source,
  input  [32:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
  output [3:0]  auto_in_d_bits_size,
                auto_in_d_bits_source,
  output [2:0]  auto_in_d_bits_sink,
  output        auto_in_d_bits_denied,
  output [63:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  input         auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
                auto_out_a_bits_param,
  output [3:0]  auto_out_a_bits_size,
                auto_out_a_bits_source,
  output [32:0] auto_out_a_bits_address,
  output [7:0]  auto_out_a_bits_mask,
  output [63:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
                auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_param,
  input  [3:0]  auto_out_d_bits_size,
                auto_out_d_bits_source,
  input  [2:0]  auto_out_d_bits_sink,
  input         auto_out_d_bits_denied,
  input  [63:0] auto_out_d_bits_data,
  input         auto_out_d_bits_corrupt
);

  wire       _nodeIn_d_q_io_deq_valid;
  wire [2:0] _nodeIn_d_q_io_deq_bits_opcode;
  wire [1:0] _nodeIn_d_q_io_deq_bits_param;
  wire [3:0] _nodeIn_d_q_io_deq_bits_size;
  wire [3:0] _nodeIn_d_q_io_deq_bits_source;
  wire [2:0] _nodeIn_d_q_io_deq_bits_sink;
  wire       _nodeIn_d_q_io_deq_bits_denied;
  wire       _nodeIn_d_q_io_deq_bits_corrupt;
  wire       _nodeOut_a_q_io_enq_ready;
  TLMonitor_13 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (_nodeOut_a_q_io_enq_ready),
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_opcode  (auto_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_in_a_bits_param),
    .io_in_a_bits_size    (auto_in_a_bits_size),
    .io_in_a_bits_source  (auto_in_a_bits_source),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_a_bits_mask    (auto_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_in_a_bits_corrupt),
    .io_in_d_ready        (auto_in_d_ready),
    .io_in_d_valid        (_nodeIn_d_q_io_deq_valid),
    .io_in_d_bits_opcode  (_nodeIn_d_q_io_deq_bits_opcode),
    .io_in_d_bits_param   (_nodeIn_d_q_io_deq_bits_param),
    .io_in_d_bits_size    (_nodeIn_d_q_io_deq_bits_size),
    .io_in_d_bits_source  (_nodeIn_d_q_io_deq_bits_source),
    .io_in_d_bits_sink    (_nodeIn_d_q_io_deq_bits_sink),
    .io_in_d_bits_denied  (_nodeIn_d_q_io_deq_bits_denied),
    .io_in_d_bits_corrupt (_nodeIn_d_q_io_deq_bits_corrupt)
  );
  Queue_4 nodeOut_a_q (
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (_nodeOut_a_q_io_enq_ready),
    .io_enq_valid        (auto_in_a_valid),
    .io_enq_bits_opcode  (auto_in_a_bits_opcode),
    .io_enq_bits_param   (auto_in_a_bits_param),
    .io_enq_bits_size    (auto_in_a_bits_size),
    .io_enq_bits_source  (auto_in_a_bits_source),
    .io_enq_bits_address (auto_in_a_bits_address),
    .io_enq_bits_mask    (auto_in_a_bits_mask),
    .io_enq_bits_data    (auto_in_a_bits_data),
    .io_enq_bits_corrupt (auto_in_a_bits_corrupt),
    .io_deq_ready        (auto_out_a_ready),
    .io_deq_valid        (auto_out_a_valid),
    .io_deq_bits_opcode  (auto_out_a_bits_opcode),
    .io_deq_bits_param   (auto_out_a_bits_param),
    .io_deq_bits_size    (auto_out_a_bits_size),
    .io_deq_bits_source  (auto_out_a_bits_source),
    .io_deq_bits_address (auto_out_a_bits_address),
    .io_deq_bits_mask    (auto_out_a_bits_mask),
    .io_deq_bits_data    (auto_out_a_bits_data),
    .io_deq_bits_corrupt (auto_out_a_bits_corrupt)
  );
  Queue_5 nodeIn_d_q (
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (auto_out_d_ready),
    .io_enq_valid        (auto_out_d_valid),
    .io_enq_bits_opcode  (auto_out_d_bits_opcode),
    .io_enq_bits_param   (auto_out_d_bits_param),
    .io_enq_bits_size    (auto_out_d_bits_size),
    .io_enq_bits_source  (auto_out_d_bits_source),
    .io_enq_bits_sink    (auto_out_d_bits_sink),
    .io_enq_bits_denied  (auto_out_d_bits_denied),
    .io_enq_bits_data    (auto_out_d_bits_data),
    .io_enq_bits_corrupt (auto_out_d_bits_corrupt),
    .io_deq_ready        (auto_in_d_ready),
    .io_deq_valid        (_nodeIn_d_q_io_deq_valid),
    .io_deq_bits_opcode  (_nodeIn_d_q_io_deq_bits_opcode),
    .io_deq_bits_param   (_nodeIn_d_q_io_deq_bits_param),
    .io_deq_bits_size    (_nodeIn_d_q_io_deq_bits_size),
    .io_deq_bits_source  (_nodeIn_d_q_io_deq_bits_source),
    .io_deq_bits_sink    (_nodeIn_d_q_io_deq_bits_sink),
    .io_deq_bits_denied  (_nodeIn_d_q_io_deq_bits_denied),
    .io_deq_bits_data    (auto_in_d_bits_data),
    .io_deq_bits_corrupt (_nodeIn_d_q_io_deq_bits_corrupt)
  );
  assign auto_in_a_ready = _nodeOut_a_q_io_enq_ready;
  assign auto_in_d_valid = _nodeIn_d_q_io_deq_valid;
  assign auto_in_d_bits_opcode = _nodeIn_d_q_io_deq_bits_opcode;
  assign auto_in_d_bits_param = _nodeIn_d_q_io_deq_bits_param;
  assign auto_in_d_bits_size = _nodeIn_d_q_io_deq_bits_size;
  assign auto_in_d_bits_source = _nodeIn_d_q_io_deq_bits_source;
  assign auto_in_d_bits_sink = _nodeIn_d_q_io_deq_bits_sink;
  assign auto_in_d_bits_denied = _nodeIn_d_q_io_deq_bits_denied;
  assign auto_in_d_bits_corrupt = _nodeIn_d_q_io_deq_bits_corrupt;
endmodule

