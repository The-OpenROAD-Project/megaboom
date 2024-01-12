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

module AsyncQueue(
  input        io_enq_clock,
               io_enq_reset,
  output       io_enq_ready,
  input        io_enq_valid,
  input  [3:0] io_enq_bits,
  input        io_deq_clock,
               io_deq_reset,
               io_deq_ready,
  output       io_deq_valid,
  output [3:0] io_deq_bits
);

  wire [3:0] _sink_io_async_ridx;
  wire       _sink_io_async_safe_ridx_valid;
  wire       _sink_io_async_safe_sink_reset_n;
  wire [3:0] _source_io_async_mem_0;
  wire [3:0] _source_io_async_mem_1;
  wire [3:0] _source_io_async_mem_2;
  wire [3:0] _source_io_async_mem_3;
  wire [3:0] _source_io_async_mem_4;
  wire [3:0] _source_io_async_mem_5;
  wire [3:0] _source_io_async_mem_6;
  wire [3:0] _source_io_async_mem_7;
  wire [3:0] _source_io_async_widx;
  wire       _source_io_async_safe_widx_valid;
  wire       _source_io_async_safe_source_reset_n;
  AsyncQueueSource_3 source (
    .clock                        (io_enq_clock),
    .reset                        (io_enq_reset),
    .io_enq_ready                 (io_enq_ready),
    .io_enq_valid                 (io_enq_valid),
    .io_enq_bits                  (io_enq_bits),
    .io_async_mem_0               (_source_io_async_mem_0),
    .io_async_mem_1               (_source_io_async_mem_1),
    .io_async_mem_2               (_source_io_async_mem_2),
    .io_async_mem_3               (_source_io_async_mem_3),
    .io_async_mem_4               (_source_io_async_mem_4),
    .io_async_mem_5               (_source_io_async_mem_5),
    .io_async_mem_6               (_source_io_async_mem_6),
    .io_async_mem_7               (_source_io_async_mem_7),
    .io_async_ridx                (_sink_io_async_ridx),
    .io_async_widx                (_source_io_async_widx),
    .io_async_safe_ridx_valid     (_sink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid     (_source_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n (_source_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n   (_sink_io_async_safe_sink_reset_n)
  );
  AsyncQueueSink_3 sink (
    .clock                        (io_deq_clock),
    .reset                        (io_deq_reset),
    .io_deq_ready                 (io_deq_ready),
    .io_deq_valid                 (io_deq_valid),
    .io_deq_bits                  (io_deq_bits),
    .io_async_mem_0               (_source_io_async_mem_0),
    .io_async_mem_1               (_source_io_async_mem_1),
    .io_async_mem_2               (_source_io_async_mem_2),
    .io_async_mem_3               (_source_io_async_mem_3),
    .io_async_mem_4               (_source_io_async_mem_4),
    .io_async_mem_5               (_source_io_async_mem_5),
    .io_async_mem_6               (_source_io_async_mem_6),
    .io_async_mem_7               (_source_io_async_mem_7),
    .io_async_ridx                (_sink_io_async_ridx),
    .io_async_widx                (_source_io_async_widx),
    .io_async_safe_ridx_valid     (_sink_io_async_safe_ridx_valid),
    .io_async_safe_widx_valid     (_source_io_async_safe_widx_valid),
    .io_async_safe_source_reset_n (_source_io_async_safe_source_reset_n),
    .io_async_safe_sink_reset_n   (_sink_io_async_safe_sink_reset_n)
  );
endmodule

