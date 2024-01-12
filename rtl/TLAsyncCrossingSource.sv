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

module TLAsyncCrossingSource(
  input         clock,
                reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
  input  [8:0]  auto_in_a_bits_address,
  input  [31:0] auto_in_a_bits_data,
  input         auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_param,
                auto_in_d_bits_size,
  output        auto_in_d_bits_source,
                auto_in_d_bits_sink,
                auto_in_d_bits_denied,
  output [31:0] auto_in_d_bits_data,
  output        auto_in_d_bits_corrupt,
  output [2:0]  auto_out_a_mem_0_opcode,
  output [8:0]  auto_out_a_mem_0_address,
  output [31:0] auto_out_a_mem_0_data,
  input         auto_out_a_ridx,
  output        auto_out_a_widx,
  input         auto_out_a_safe_ridx_valid,
  output        auto_out_a_safe_widx_valid,
                auto_out_a_safe_source_reset_n,
  input         auto_out_a_safe_sink_reset_n,
  input  [2:0]  auto_out_d_mem_0_opcode,
  input  [1:0]  auto_out_d_mem_0_size,
  input         auto_out_d_mem_0_source,
  input  [31:0] auto_out_d_mem_0_data,
  output        auto_out_d_ridx,
  input         auto_out_d_widx,
  output        auto_out_d_safe_ridx_valid,
  input         auto_out_d_safe_widx_valid,
                auto_out_d_safe_source_reset_n,
  output        auto_out_d_safe_sink_reset_n
);

  wire       _nodeIn_d_sink_io_deq_valid;
  wire [2:0] _nodeIn_d_sink_io_deq_bits_opcode;
  wire [1:0] _nodeIn_d_sink_io_deq_bits_param;
  wire [1:0] _nodeIn_d_sink_io_deq_bits_size;
  wire       _nodeIn_d_sink_io_deq_bits_source;
  wire       _nodeIn_d_sink_io_deq_bits_sink;
  wire       _nodeIn_d_sink_io_deq_bits_denied;
  wire       _nodeIn_d_sink_io_deq_bits_corrupt;
  wire       _nodeOut_a_source_io_enq_ready;
  TLMonitor_40 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (_nodeOut_a_source_io_enq_ready),
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_opcode  (auto_in_a_bits_opcode),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_d_ready        (auto_in_d_ready),
    .io_in_d_valid        (_nodeIn_d_sink_io_deq_valid),
    .io_in_d_bits_opcode  (_nodeIn_d_sink_io_deq_bits_opcode),
    .io_in_d_bits_param   (_nodeIn_d_sink_io_deq_bits_param),
    .io_in_d_bits_size    (_nodeIn_d_sink_io_deq_bits_size),
    .io_in_d_bits_source  (_nodeIn_d_sink_io_deq_bits_source),
    .io_in_d_bits_sink    (_nodeIn_d_sink_io_deq_bits_sink),
    .io_in_d_bits_denied  (_nodeIn_d_sink_io_deq_bits_denied),
    .io_in_d_bits_corrupt (_nodeIn_d_sink_io_deq_bits_corrupt)
  );
  AsyncQueueSource nodeOut_a_source (
    .clock                        (clock),
    .reset                        (reset),
    .io_enq_ready                 (_nodeOut_a_source_io_enq_ready),
    .io_enq_valid                 (auto_in_a_valid),
    .io_enq_bits_opcode           (auto_in_a_bits_opcode),
    .io_enq_bits_address          (auto_in_a_bits_address),
    .io_enq_bits_data             (auto_in_a_bits_data),
    .io_async_mem_0_opcode        (auto_out_a_mem_0_opcode),
    .io_async_mem_0_address       (auto_out_a_mem_0_address),
    .io_async_mem_0_data          (auto_out_a_mem_0_data),
    .io_async_ridx                (auto_out_a_ridx),
    .io_async_widx                (auto_out_a_widx),
    .io_async_safe_ridx_valid     (auto_out_a_safe_ridx_valid),
    .io_async_safe_widx_valid     (auto_out_a_safe_widx_valid),
    .io_async_safe_source_reset_n (auto_out_a_safe_source_reset_n),
    .io_async_safe_sink_reset_n   (auto_out_a_safe_sink_reset_n)
  );
  AsyncQueueSink nodeIn_d_sink (
    .clock                        (clock),
    .reset                        (reset),
    .io_deq_ready                 (auto_in_d_ready),
    .io_deq_valid                 (_nodeIn_d_sink_io_deq_valid),
    .io_deq_bits_opcode           (_nodeIn_d_sink_io_deq_bits_opcode),
    .io_deq_bits_param            (_nodeIn_d_sink_io_deq_bits_param),
    .io_deq_bits_size             (_nodeIn_d_sink_io_deq_bits_size),
    .io_deq_bits_source           (_nodeIn_d_sink_io_deq_bits_source),
    .io_deq_bits_sink             (_nodeIn_d_sink_io_deq_bits_sink),
    .io_deq_bits_denied           (_nodeIn_d_sink_io_deq_bits_denied),
    .io_deq_bits_data             (auto_in_d_bits_data),
    .io_deq_bits_corrupt          (_nodeIn_d_sink_io_deq_bits_corrupt),
    .io_async_mem_0_opcode        (auto_out_d_mem_0_opcode),
    .io_async_mem_0_size          (auto_out_d_mem_0_size),
    .io_async_mem_0_source        (auto_out_d_mem_0_source),
    .io_async_mem_0_data          (auto_out_d_mem_0_data),
    .io_async_ridx                (auto_out_d_ridx),
    .io_async_widx                (auto_out_d_widx),
    .io_async_safe_ridx_valid     (auto_out_d_safe_ridx_valid),
    .io_async_safe_widx_valid     (auto_out_d_safe_widx_valid),
    .io_async_safe_source_reset_n (auto_out_d_safe_source_reset_n),
    .io_async_safe_sink_reset_n   (auto_out_d_safe_sink_reset_n)
  );
  assign auto_in_a_ready = _nodeOut_a_source_io_enq_ready;
  assign auto_in_d_valid = _nodeIn_d_sink_io_deq_valid;
  assign auto_in_d_bits_opcode = _nodeIn_d_sink_io_deq_bits_opcode;
  assign auto_in_d_bits_param = _nodeIn_d_sink_io_deq_bits_param;
  assign auto_in_d_bits_size = _nodeIn_d_sink_io_deq_bits_size;
  assign auto_in_d_bits_source = _nodeIn_d_sink_io_deq_bits_source;
  assign auto_in_d_bits_sink = _nodeIn_d_sink_io_deq_bits_sink;
  assign auto_in_d_bits_denied = _nodeIn_d_sink_io_deq_bits_denied;
  assign auto_in_d_bits_corrupt = _nodeIn_d_sink_io_deq_bits_corrupt;
endmodule

