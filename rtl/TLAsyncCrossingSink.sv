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

module TLAsyncCrossingSink(
  input         clock,
                reset,
  input  [2:0]  auto_in_a_mem_0_opcode,
  input  [8:0]  auto_in_a_mem_0_address,
  input  [31:0] auto_in_a_mem_0_data,
  output        auto_in_a_ridx,
  input         auto_in_a_widx,
  output        auto_in_a_safe_ridx_valid,
  input         auto_in_a_safe_widx_valid,
                auto_in_a_safe_source_reset_n,
  output        auto_in_a_safe_sink_reset_n,
  output [2:0]  auto_in_d_mem_0_opcode,
  output [1:0]  auto_in_d_mem_0_size,
  output        auto_in_d_mem_0_source,
  output [31:0] auto_in_d_mem_0_data,
  input         auto_in_d_ridx,
  output        auto_in_d_widx,
  input         auto_in_d_safe_ridx_valid,
  output        auto_in_d_safe_widx_valid,
                auto_in_d_safe_source_reset_n,
  input         auto_in_d_safe_sink_reset_n,
                auto_out_a_ready,
  output        auto_out_a_valid,
  output [2:0]  auto_out_a_bits_opcode,
                auto_out_a_bits_param,
  output [1:0]  auto_out_a_bits_size,
  output        auto_out_a_bits_source,
  output [8:0]  auto_out_a_bits_address,
  output [3:0]  auto_out_a_bits_mask,
  output [31:0] auto_out_a_bits_data,
  output        auto_out_a_bits_corrupt,
                auto_out_d_ready,
  input         auto_out_d_valid,
  input  [2:0]  auto_out_d_bits_opcode,
  input  [1:0]  auto_out_d_bits_size,
  input         auto_out_d_bits_source,
  input  [31:0] auto_out_d_bits_data
);

  AsyncQueueSink_1 nodeOut_a_sink (
    .clock                        (clock),
    .reset                        (reset),
    .io_deq_ready                 (auto_out_a_ready),
    .io_deq_valid                 (auto_out_a_valid),
    .io_deq_bits_opcode           (auto_out_a_bits_opcode),
    .io_deq_bits_param            (auto_out_a_bits_param),
    .io_deq_bits_size             (auto_out_a_bits_size),
    .io_deq_bits_source           (auto_out_a_bits_source),
    .io_deq_bits_address          (auto_out_a_bits_address),
    .io_deq_bits_mask             (auto_out_a_bits_mask),
    .io_deq_bits_data             (auto_out_a_bits_data),
    .io_deq_bits_corrupt          (auto_out_a_bits_corrupt),
    .io_async_mem_0_opcode        (auto_in_a_mem_0_opcode),
    .io_async_mem_0_address       (auto_in_a_mem_0_address),
    .io_async_mem_0_data          (auto_in_a_mem_0_data),
    .io_async_ridx                (auto_in_a_ridx),
    .io_async_widx                (auto_in_a_widx),
    .io_async_safe_ridx_valid     (auto_in_a_safe_ridx_valid),
    .io_async_safe_widx_valid     (auto_in_a_safe_widx_valid),
    .io_async_safe_source_reset_n (auto_in_a_safe_source_reset_n),
    .io_async_safe_sink_reset_n   (auto_in_a_safe_sink_reset_n)
  );
  AsyncQueueSource_2 nodeIn_d_source (
    .clock                        (clock),
    .reset                        (reset),
    .io_enq_ready                 (auto_out_d_ready),
    .io_enq_valid                 (auto_out_d_valid),
    .io_enq_bits_opcode           (auto_out_d_bits_opcode),
    .io_enq_bits_size             (auto_out_d_bits_size),
    .io_enq_bits_source           (auto_out_d_bits_source),
    .io_enq_bits_data             (auto_out_d_bits_data),
    .io_async_mem_0_opcode        (auto_in_d_mem_0_opcode),
    .io_async_mem_0_size          (auto_in_d_mem_0_size),
    .io_async_mem_0_source        (auto_in_d_mem_0_source),
    .io_async_mem_0_data          (auto_in_d_mem_0_data),
    .io_async_ridx                (auto_in_d_ridx),
    .io_async_widx                (auto_in_d_widx),
    .io_async_safe_ridx_valid     (auto_in_d_safe_ridx_valid),
    .io_async_safe_widx_valid     (auto_in_d_safe_widx_valid),
    .io_async_safe_source_reset_n (auto_in_d_safe_source_reset_n),
    .io_async_safe_sink_reset_n   (auto_in_d_safe_sink_reset_n)
  );
endmodule

