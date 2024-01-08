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

module TLWidthWidget_10(
  input          clock,
                 reset,
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [32:0]  auto_in_a_bits_address,
  output         auto_in_d_valid,
  output [2:0]   auto_in_d_bits_opcode,
  output [3:0]   auto_in_d_bits_size,
  output [127:0] auto_in_d_bits_data,
  input          auto_out_a_ready,
  output         auto_out_a_valid,
  output [32:0]  auto_out_a_bits_address,
  input          auto_out_d_valid,
  input  [2:0]   auto_out_d_bits_opcode,
  input  [1:0]   auto_out_d_bits_param,
  input  [3:0]   auto_out_d_bits_size,
  input  [2:0]   auto_out_d_bits_sink,
  input          auto_out_d_bits_denied,
  input  [63:0]  auto_out_d_bits_data,
  input          auto_out_d_bits_corrupt
);

  wire        _repeated_repeater_io_enq_ready;
  wire [18:0] _limit_T_1 = 19'hF << auto_out_d_bits_size;
  reg         count;
  wire        last = count == ~(_limit_T_1[3]) | ~(auto_out_d_bits_opcode[0]);
  reg         corrupt_reg;
  wire        nodeIn_d_bits_corrupt = auto_out_d_bits_corrupt | corrupt_reg;
  wire        nodeIn_d_valid = auto_out_d_valid & last;
  reg         nodeIn_d_bits_data_rdata_written_once;
  wire        nodeIn_d_bits_data_masked_enable_0 = ~(count & ~(_limit_T_1[3])) | ~nodeIn_d_bits_data_rdata_written_once;
  reg  [63:0] nodeIn_d_bits_data_rdata_0;
  wire        _nodeIn_d_bits_data_T_2 = auto_out_d_valid & ~last;
  always @(posedge clock) begin
    if (reset) begin
      count <= 1'h0;
      corrupt_reg <= 1'h0;
      nodeIn_d_bits_data_rdata_written_once <= 1'h0;
    end
    else begin
      if (auto_out_d_valid) begin
        count <= ~last & count - 1'h1;
        corrupt_reg <= ~last & nodeIn_d_bits_corrupt;
      end
      nodeIn_d_bits_data_rdata_written_once <= _nodeIn_d_bits_data_T_2 | nodeIn_d_bits_data_rdata_written_once;
    end
    if (_nodeIn_d_bits_data_T_2 & nodeIn_d_bits_data_masked_enable_0)
      nodeIn_d_bits_data_rdata_0 <= auto_out_d_bits_data;
  end // always @(posedge)
  TLMonitor_43 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (_repeated_repeater_io_enq_ready),
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_d_valid        (nodeIn_d_valid),
    .io_in_d_bits_opcode  (auto_out_d_bits_opcode),
    .io_in_d_bits_param   (auto_out_d_bits_param),
    .io_in_d_bits_size    (auto_out_d_bits_size),
    .io_in_d_bits_sink    (auto_out_d_bits_sink),
    .io_in_d_bits_denied  (auto_out_d_bits_denied),
    .io_in_d_bits_corrupt (nodeIn_d_bits_corrupt)
  );
  Repeater_9 repeated_repeater (
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (_repeated_repeater_io_enq_ready),
    .io_enq_valid        (auto_in_a_valid),
    .io_enq_bits_address (auto_in_a_bits_address),
    .io_deq_ready        (auto_out_a_ready),
    .io_deq_valid        (auto_out_a_valid),
    .io_deq_bits_address (auto_out_a_bits_address)
  );
  assign auto_in_a_ready = _repeated_repeater_io_enq_ready;
  assign auto_in_d_valid = nodeIn_d_valid;
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign auto_in_d_bits_size = auto_out_d_bits_size;
  assign auto_in_d_bits_data = {auto_out_d_bits_data, nodeIn_d_bits_data_masked_enable_0 ? auto_out_d_bits_data : nodeIn_d_bits_data_rdata_0};
endmodule

