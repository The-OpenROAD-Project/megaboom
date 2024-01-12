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

module ClockSinkDomain_2(
  output        auto_serdesser_manager_in_a_ready,
  input         auto_serdesser_manager_in_a_valid,
  input  [2:0]  auto_serdesser_manager_in_a_bits_opcode,
                auto_serdesser_manager_in_a_bits_param,
                auto_serdesser_manager_in_a_bits_size,
  input  [7:0]  auto_serdesser_manager_in_a_bits_source,
  input  [32:0] auto_serdesser_manager_in_a_bits_address,
  input  [7:0]  auto_serdesser_manager_in_a_bits_mask,
  input  [63:0] auto_serdesser_manager_in_a_bits_data,
  input         auto_serdesser_manager_in_d_ready,
  output        auto_serdesser_manager_in_d_valid,
  output [2:0]  auto_serdesser_manager_in_d_bits_opcode,
  output [1:0]  auto_serdesser_manager_in_d_bits_param,
  output [2:0]  auto_serdesser_manager_in_d_bits_size,
  output [7:0]  auto_serdesser_manager_in_d_bits_source,
  output        auto_serdesser_manager_in_d_bits_sink,
                auto_serdesser_manager_in_d_bits_denied,
  output [63:0] auto_serdesser_manager_in_d_bits_data,
  output        auto_serdesser_manager_in_d_bits_corrupt,
  input         auto_serdesser_client_out_a_ready,
  output        auto_serdesser_client_out_a_valid,
  output [2:0]  auto_serdesser_client_out_a_bits_opcode,
                auto_serdesser_client_out_a_bits_param,
  output [3:0]  auto_serdesser_client_out_a_bits_size,
                auto_serdesser_client_out_a_bits_source,
  output [32:0] auto_serdesser_client_out_a_bits_address,
  output [7:0]  auto_serdesser_client_out_a_bits_mask,
  output [63:0] auto_serdesser_client_out_a_bits_data,
  output        auto_serdesser_client_out_a_bits_corrupt,
                auto_serdesser_client_out_d_ready,
  input         auto_serdesser_client_out_d_valid,
  input  [2:0]  auto_serdesser_client_out_d_bits_opcode,
  input  [1:0]  auto_serdesser_client_out_d_bits_param,
  input  [3:0]  auto_serdesser_client_out_d_bits_size,
                auto_serdesser_client_out_d_bits_source,
  input  [1:0]  auto_serdesser_client_out_d_bits_sink,
  input         auto_serdesser_client_out_d_bits_denied,
  input  [63:0] auto_serdesser_client_out_d_bits_data,
  input         auto_serdesser_client_out_d_bits_corrupt,
                auto_clock_in_clock,
                auto_clock_in_reset,
                serial_tl_0_clock,
  output        serial_tl_0_bits_in_ready,
  input         serial_tl_0_bits_in_valid,
  input  [3:0]  serial_tl_0_bits_in_bits,
  input         serial_tl_0_bits_out_ready,
  output        serial_tl_0_bits_out_valid,
  output [3:0]  serial_tl_0_bits_out_bits
);

  wire       _in_async_io_enq_ready;
  wire       _in_async_io_deq_valid;
  wire [3:0] _in_async_io_deq_bits;
  wire       _out_async_io_enq_ready;
  wire       _outer_reset_catcher_io_sync_reset;
  wire       _serdesser_io_ser_in_ready;
  wire       _serdesser_io_ser_out_valid;
  wire [3:0] _serdesser_io_ser_out_bits;
  reg  [1:0] out_async_io_enq_c_value;
  reg        out_async_io_enq_r;
  reg  [1:0] in_async_io_enq_c_value;
  reg        in_async_io_enq_r;
  always @(posedge auto_clock_in_clock) begin
    if (auto_clock_in_reset) begin
      out_async_io_enq_c_value <= 2'h0;
      out_async_io_enq_r <= 1'h0;
      in_async_io_enq_c_value <= 2'h0;
      in_async_io_enq_r <= 1'h0;
    end
    else begin
      out_async_io_enq_c_value <= out_async_io_enq_c_value + 2'h1;
      out_async_io_enq_r <= (&out_async_io_enq_c_value) | out_async_io_enq_r;
      in_async_io_enq_c_value <= in_async_io_enq_c_value + 2'h1;
      in_async_io_enq_r <= (&in_async_io_enq_c_value) | in_async_io_enq_r;
    end
  end // always @(posedge)
  TLSerdesser serdesser (
    .clock                          (auto_clock_in_clock),
    .reset                          (auto_clock_in_reset),
    .auto_manager_in_a_ready        (auto_serdesser_manager_in_a_ready),
    .auto_manager_in_a_valid        (auto_serdesser_manager_in_a_valid),
    .auto_manager_in_a_bits_opcode  (auto_serdesser_manager_in_a_bits_opcode),
    .auto_manager_in_a_bits_param   (auto_serdesser_manager_in_a_bits_param),
    .auto_manager_in_a_bits_size    (auto_serdesser_manager_in_a_bits_size),
    .auto_manager_in_a_bits_source  (auto_serdesser_manager_in_a_bits_source),
    .auto_manager_in_a_bits_address (auto_serdesser_manager_in_a_bits_address),
    .auto_manager_in_a_bits_mask    (auto_serdesser_manager_in_a_bits_mask),
    .auto_manager_in_a_bits_data    (auto_serdesser_manager_in_a_bits_data),
    .auto_manager_in_d_ready        (auto_serdesser_manager_in_d_ready),
    .auto_manager_in_d_valid        (auto_serdesser_manager_in_d_valid),
    .auto_manager_in_d_bits_opcode  (auto_serdesser_manager_in_d_bits_opcode),
    .auto_manager_in_d_bits_param   (auto_serdesser_manager_in_d_bits_param),
    .auto_manager_in_d_bits_size    (auto_serdesser_manager_in_d_bits_size),
    .auto_manager_in_d_bits_source  (auto_serdesser_manager_in_d_bits_source),
    .auto_manager_in_d_bits_sink    (auto_serdesser_manager_in_d_bits_sink),
    .auto_manager_in_d_bits_denied  (auto_serdesser_manager_in_d_bits_denied),
    .auto_manager_in_d_bits_data    (auto_serdesser_manager_in_d_bits_data),
    .auto_manager_in_d_bits_corrupt (auto_serdesser_manager_in_d_bits_corrupt),
    .auto_client_out_a_ready        (auto_serdesser_client_out_a_ready),
    .auto_client_out_a_valid        (auto_serdesser_client_out_a_valid),
    .auto_client_out_a_bits_opcode  (auto_serdesser_client_out_a_bits_opcode),
    .auto_client_out_a_bits_param   (auto_serdesser_client_out_a_bits_param),
    .auto_client_out_a_bits_size    (auto_serdesser_client_out_a_bits_size),
    .auto_client_out_a_bits_source  (auto_serdesser_client_out_a_bits_source),
    .auto_client_out_a_bits_address (auto_serdesser_client_out_a_bits_address),
    .auto_client_out_a_bits_mask    (auto_serdesser_client_out_a_bits_mask),
    .auto_client_out_a_bits_data    (auto_serdesser_client_out_a_bits_data),
    .auto_client_out_a_bits_corrupt (auto_serdesser_client_out_a_bits_corrupt),
    .auto_client_out_d_ready        (auto_serdesser_client_out_d_ready),
    .auto_client_out_d_valid        (auto_serdesser_client_out_d_valid),
    .auto_client_out_d_bits_opcode  (auto_serdesser_client_out_d_bits_opcode),
    .auto_client_out_d_bits_param   (auto_serdesser_client_out_d_bits_param),
    .auto_client_out_d_bits_size    (auto_serdesser_client_out_d_bits_size),
    .auto_client_out_d_bits_source  (auto_serdesser_client_out_d_bits_source),
    .auto_client_out_d_bits_sink    (auto_serdesser_client_out_d_bits_sink),
    .auto_client_out_d_bits_denied  (auto_serdesser_client_out_d_bits_denied),
    .auto_client_out_d_bits_data    (auto_serdesser_client_out_d_bits_data),
    .auto_client_out_d_bits_corrupt (auto_serdesser_client_out_d_bits_corrupt),
    .io_ser_in_ready                (_serdesser_io_ser_in_ready),
    .io_ser_in_valid                (_in_async_io_deq_valid),
    .io_ser_in_bits                 (_in_async_io_deq_bits),
    .io_ser_out_ready               (out_async_io_enq_r & _out_async_io_enq_ready),
    .io_ser_out_valid               (_serdesser_io_ser_out_valid),
    .io_ser_out_bits                (_serdesser_io_ser_out_bits)
  );
  ResetCatchAndSync_d3 outer_reset_catcher (
    .clock         (serial_tl_0_clock),
    .reset         (auto_clock_in_reset),
    .io_sync_reset (_outer_reset_catcher_io_sync_reset)
  );
  AsyncQueue out_async (
    .io_enq_clock (auto_clock_in_clock),
    .io_enq_reset (auto_clock_in_reset),
    .io_enq_ready (_out_async_io_enq_ready),
    .io_enq_valid (out_async_io_enq_r & _serdesser_io_ser_out_valid),
    .io_enq_bits  (_serdesser_io_ser_out_bits),
    .io_deq_clock (serial_tl_0_clock),
    .io_deq_reset (_outer_reset_catcher_io_sync_reset),
    .io_deq_ready (serial_tl_0_bits_out_ready),
    .io_deq_valid (serial_tl_0_bits_out_valid),
    .io_deq_bits  (serial_tl_0_bits_out_bits)
  );
  AsyncQueue in_async (
    .io_enq_clock (serial_tl_0_clock),
    .io_enq_reset (_outer_reset_catcher_io_sync_reset),
    .io_enq_ready (_in_async_io_enq_ready),
    .io_enq_valid (in_async_io_enq_r & serial_tl_0_bits_in_valid),
    .io_enq_bits  (serial_tl_0_bits_in_bits),
    .io_deq_clock (auto_clock_in_clock),
    .io_deq_reset (auto_clock_in_reset),
    .io_deq_ready (_serdesser_io_ser_in_ready),
    .io_deq_valid (_in_async_io_deq_valid),
    .io_deq_bits  (_in_async_io_deq_bits)
  );
  assign serial_tl_0_bits_in_ready = in_async_io_enq_r & _in_async_io_enq_ready;
endmodule

