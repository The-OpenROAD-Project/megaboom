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

module TLWidthWidget_9(
  input          clock,
                 reset,
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [2:0]   auto_in_a_bits_opcode,
                 auto_in_a_bits_param,
  input  [3:0]   auto_in_a_bits_size,
                 auto_in_a_bits_source,
  input  [32:0]  auto_in_a_bits_address,
  input  [15:0]  auto_in_a_bits_mask,
  input  [127:0] auto_in_a_bits_data,
  input          auto_in_b_ready,
  output         auto_in_b_valid,
  output [1:0]   auto_in_b_bits_param,
  output [3:0]   auto_in_b_bits_size,
                 auto_in_b_bits_source,
  output [32:0]  auto_in_b_bits_address,
  output         auto_in_c_ready,
  input          auto_in_c_valid,
  input  [2:0]   auto_in_c_bits_opcode,
                 auto_in_c_bits_param,
  input  [3:0]   auto_in_c_bits_size,
                 auto_in_c_bits_source,
  input  [32:0]  auto_in_c_bits_address,
  input  [127:0] auto_in_c_bits_data,
  input          auto_in_d_ready,
  output         auto_in_d_valid,
  output [2:0]   auto_in_d_bits_opcode,
  output [1:0]   auto_in_d_bits_param,
  output [3:0]   auto_in_d_bits_size,
                 auto_in_d_bits_source,
  output [2:0]   auto_in_d_bits_sink,
  output [127:0] auto_in_d_bits_data,
  output         auto_in_e_ready,
  input          auto_in_e_valid,
  input  [2:0]   auto_in_e_bits_sink,
  input          auto_out_a_ready,
  output         auto_out_a_valid,
  output [2:0]   auto_out_a_bits_opcode,
                 auto_out_a_bits_param,
  output [3:0]   auto_out_a_bits_size,
                 auto_out_a_bits_source,
  output [32:0]  auto_out_a_bits_address,
  output [7:0]   auto_out_a_bits_mask,
  output [63:0]  auto_out_a_bits_data,
  output         auto_out_b_ready,
  input          auto_out_b_valid,
  input  [2:0]   auto_out_b_bits_opcode,
  input  [1:0]   auto_out_b_bits_param,
  input  [3:0]   auto_out_b_bits_size,
                 auto_out_b_bits_source,
  input  [32:0]  auto_out_b_bits_address,
  input          auto_out_b_bits_corrupt,
                 auto_out_c_ready,
  output         auto_out_c_valid,
  output [2:0]   auto_out_c_bits_opcode,
                 auto_out_c_bits_param,
  output [3:0]   auto_out_c_bits_size,
                 auto_out_c_bits_source,
  output [32:0]  auto_out_c_bits_address,
  output [63:0]  auto_out_c_bits_data,
  output         auto_out_d_ready,
  input          auto_out_d_valid,
  input  [2:0]   auto_out_d_bits_opcode,
  input  [1:0]   auto_out_d_bits_param,
  input  [3:0]   auto_out_d_bits_size,
                 auto_out_d_bits_source,
  input  [2:0]   auto_out_d_bits_sink,
  input          auto_out_d_bits_denied,
  input  [63:0]  auto_out_d_bits_data,
  input          auto_out_d_bits_corrupt,
                 auto_out_e_ready,
  output         auto_out_e_valid,
  output [2:0]   auto_out_e_bits_sink
);

  wire         _repeated_repeater_1_io_enq_ready;
  wire         _repeated_repeater_1_io_deq_valid;
  wire [2:0]   _repeated_repeater_1_io_deq_bits_opcode;
  wire [3:0]   _repeated_repeater_1_io_deq_bits_size;
  wire [32:0]  _repeated_repeater_1_io_deq_bits_address;
  wire [127:0] _repeated_repeater_1_io_deq_bits_data;
  wire         _repeated_repeater_io_enq_ready;
  wire         _repeated_repeater_io_deq_valid;
  wire [2:0]   _repeated_repeater_io_deq_bits_opcode;
  wire [3:0]   _repeated_repeater_io_deq_bits_size;
  wire [32:0]  _repeated_repeater_io_deq_bits_address;
  wire [15:0]  _repeated_repeater_io_deq_bits_mask;
  wire [127:0] _repeated_repeater_io_deq_bits_data;
  wire [18:0]  _repeat_limit_T_1 = 19'hF << _repeated_repeater_io_deq_bits_size;
  reg          repeat_count;
  wire         repeat_last = repeat_count == ~(_repeat_limit_T_1[3]) | _repeated_repeater_io_deq_bits_opcode[2];
  wire         repeat_index = _repeated_repeater_io_deq_bits_address[3] | repeat_count;
  wire [18:0]  _limit_T_1 = 19'hF << auto_out_d_bits_size;
  reg          count;
  wire         last = count == ~(_limit_T_1[3]) | ~(auto_out_d_bits_opcode[0]);
  reg          corrupt_reg;
  wire         nodeIn_d_bits_corrupt = auto_out_d_bits_corrupt | corrupt_reg;
  wire         nodeOut_d_ready = auto_in_d_ready | ~last;
  wire         nodeIn_d_valid = auto_out_d_valid & last;
  reg          nodeIn_d_bits_data_rdata_written_once;
  wire         nodeIn_d_bits_data_masked_enable_0 = ~(count & ~(_limit_T_1[3])) | ~nodeIn_d_bits_data_rdata_written_once;
  reg  [63:0]  nodeIn_d_bits_data_rdata_0;
  wire         nodeIn_b_bits_mask_acc = (|(auto_out_b_bits_size[3:2])) | (&(auto_out_b_bits_size[1:0])) & ~(auto_out_b_bits_address[3]);
  wire         nodeIn_b_bits_mask_acc_1 = (|(auto_out_b_bits_size[3:2])) | (&(auto_out_b_bits_size[1:0])) & auto_out_b_bits_address[3];
  wire         nodeIn_b_bits_mask_size_1 = auto_out_b_bits_size[1:0] == 2'h2;
  wire         nodeIn_b_bits_mask_eq_2 = ~(auto_out_b_bits_address[3]) & ~(auto_out_b_bits_address[2]);
  wire         nodeIn_b_bits_mask_acc_2 = nodeIn_b_bits_mask_acc | nodeIn_b_bits_mask_size_1 & nodeIn_b_bits_mask_eq_2;
  wire         nodeIn_b_bits_mask_eq_3 = ~(auto_out_b_bits_address[3]) & auto_out_b_bits_address[2];
  wire         nodeIn_b_bits_mask_acc_3 = nodeIn_b_bits_mask_acc | nodeIn_b_bits_mask_size_1 & nodeIn_b_bits_mask_eq_3;
  wire         nodeIn_b_bits_mask_eq_4 = auto_out_b_bits_address[3] & ~(auto_out_b_bits_address[2]);
  wire         nodeIn_b_bits_mask_acc_4 = nodeIn_b_bits_mask_acc_1 | nodeIn_b_bits_mask_size_1 & nodeIn_b_bits_mask_eq_4;
  wire         nodeIn_b_bits_mask_eq_5 = auto_out_b_bits_address[3] & auto_out_b_bits_address[2];
  wire         nodeIn_b_bits_mask_acc_5 = nodeIn_b_bits_mask_acc_1 | nodeIn_b_bits_mask_size_1 & nodeIn_b_bits_mask_eq_5;
  wire         nodeIn_b_bits_mask_size_2 = auto_out_b_bits_size[1:0] == 2'h1;
  wire         nodeIn_b_bits_mask_eq_6 = nodeIn_b_bits_mask_eq_2 & ~(auto_out_b_bits_address[1]);
  wire         nodeIn_b_bits_mask_acc_6 = nodeIn_b_bits_mask_acc_2 | nodeIn_b_bits_mask_size_2 & nodeIn_b_bits_mask_eq_6;
  wire         nodeIn_b_bits_mask_eq_7 = nodeIn_b_bits_mask_eq_2 & auto_out_b_bits_address[1];
  wire         nodeIn_b_bits_mask_acc_7 = nodeIn_b_bits_mask_acc_2 | nodeIn_b_bits_mask_size_2 & nodeIn_b_bits_mask_eq_7;
  wire         nodeIn_b_bits_mask_eq_8 = nodeIn_b_bits_mask_eq_3 & ~(auto_out_b_bits_address[1]);
  wire         nodeIn_b_bits_mask_acc_8 = nodeIn_b_bits_mask_acc_3 | nodeIn_b_bits_mask_size_2 & nodeIn_b_bits_mask_eq_8;
  wire         nodeIn_b_bits_mask_eq_9 = nodeIn_b_bits_mask_eq_3 & auto_out_b_bits_address[1];
  wire         nodeIn_b_bits_mask_acc_9 = nodeIn_b_bits_mask_acc_3 | nodeIn_b_bits_mask_size_2 & nodeIn_b_bits_mask_eq_9;
  wire         nodeIn_b_bits_mask_eq_10 = nodeIn_b_bits_mask_eq_4 & ~(auto_out_b_bits_address[1]);
  wire         nodeIn_b_bits_mask_acc_10 = nodeIn_b_bits_mask_acc_4 | nodeIn_b_bits_mask_size_2 & nodeIn_b_bits_mask_eq_10;
  wire         nodeIn_b_bits_mask_eq_11 = nodeIn_b_bits_mask_eq_4 & auto_out_b_bits_address[1];
  wire         nodeIn_b_bits_mask_acc_11 = nodeIn_b_bits_mask_acc_4 | nodeIn_b_bits_mask_size_2 & nodeIn_b_bits_mask_eq_11;
  wire         nodeIn_b_bits_mask_eq_12 = nodeIn_b_bits_mask_eq_5 & ~(auto_out_b_bits_address[1]);
  wire         nodeIn_b_bits_mask_acc_12 = nodeIn_b_bits_mask_acc_5 | nodeIn_b_bits_mask_size_2 & nodeIn_b_bits_mask_eq_12;
  wire         nodeIn_b_bits_mask_eq_13 = nodeIn_b_bits_mask_eq_5 & auto_out_b_bits_address[1];
  wire         nodeIn_b_bits_mask_acc_13 = nodeIn_b_bits_mask_acc_5 | nodeIn_b_bits_mask_size_2 & nodeIn_b_bits_mask_eq_13;
  wire [18:0]  _repeat_limit_T_5 = 19'hF << _repeated_repeater_1_io_deq_bits_size;
  reg          repeat_count_1;
  wire         repeat_last_1 = repeat_count_1 == ~(_repeat_limit_T_5[3]) | ~(_repeated_repeater_1_io_deq_bits_opcode[0]);
  wire         _nodeIn_d_bits_data_T = nodeOut_d_ready & auto_out_d_valid;
  wire         _nodeIn_d_bits_data_T_2 = _nodeIn_d_bits_data_T & ~last;
  always @(posedge clock) begin
    if (reset) begin
      repeat_count <= 1'h0;
      count <= 1'h0;
      corrupt_reg <= 1'h0;
      nodeIn_d_bits_data_rdata_written_once <= 1'h0;
      repeat_count_1 <= 1'h0;
    end
    else begin
      if (auto_out_a_ready & _repeated_repeater_io_deq_valid)
        repeat_count <= ~repeat_last & repeat_count - 1'h1;
      if (_nodeIn_d_bits_data_T) begin
        count <= ~last & count - 1'h1;
        corrupt_reg <= ~last & nodeIn_d_bits_corrupt;
      end
      nodeIn_d_bits_data_rdata_written_once <= _nodeIn_d_bits_data_T_2 | nodeIn_d_bits_data_rdata_written_once;
      if (auto_out_c_ready & _repeated_repeater_1_io_deq_valid)
        repeat_count_1 <= ~repeat_last_1 & repeat_count_1 - 1'h1;
    end
    if (_nodeIn_d_bits_data_T_2 & nodeIn_d_bits_data_masked_enable_0)
      nodeIn_d_bits_data_rdata_0 <= auto_out_d_bits_data;
  end // always @(posedge)
  TLMonitor_42 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (_repeated_repeater_io_enq_ready),
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_opcode  (auto_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_in_a_bits_param),
    .io_in_a_bits_size    (auto_in_a_bits_size),
    .io_in_a_bits_source  (auto_in_a_bits_source),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_a_bits_mask    (auto_in_a_bits_mask),
    .io_in_b_ready        (auto_in_b_ready),
    .io_in_b_valid        (auto_out_b_valid),
    .io_in_b_bits_opcode  (auto_out_b_bits_opcode),
    .io_in_b_bits_param   (auto_out_b_bits_param),
    .io_in_b_bits_size    (auto_out_b_bits_size),
    .io_in_b_bits_source  (auto_out_b_bits_source),
    .io_in_b_bits_address (auto_out_b_bits_address),
    .io_in_b_bits_mask    ({nodeIn_b_bits_mask_acc_13 | nodeIn_b_bits_mask_eq_13 & auto_out_b_bits_address[0], nodeIn_b_bits_mask_acc_13 | nodeIn_b_bits_mask_eq_13 & ~(auto_out_b_bits_address[0]), nodeIn_b_bits_mask_acc_12 | nodeIn_b_bits_mask_eq_12 & auto_out_b_bits_address[0], nodeIn_b_bits_mask_acc_12 | nodeIn_b_bits_mask_eq_12 & ~(auto_out_b_bits_address[0]), nodeIn_b_bits_mask_acc_11 | nodeIn_b_bits_mask_eq_11 & auto_out_b_bits_address[0], nodeIn_b_bits_mask_acc_11 | nodeIn_b_bits_mask_eq_11 & ~(auto_out_b_bits_address[0]), nodeIn_b_bits_mask_acc_10 | nodeIn_b_bits_mask_eq_10 & auto_out_b_bits_address[0], nodeIn_b_bits_mask_acc_10 | nodeIn_b_bits_mask_eq_10 & ~(auto_out_b_bits_address[0]), nodeIn_b_bits_mask_acc_9 | nodeIn_b_bits_mask_eq_9 & auto_out_b_bits_address[0], nodeIn_b_bits_mask_acc_9 | nodeIn_b_bits_mask_eq_9 & ~(auto_out_b_bits_address[0]), nodeIn_b_bits_mask_acc_8 | nodeIn_b_bits_mask_eq_8 & auto_out_b_bits_address[0], nodeIn_b_bits_mask_acc_8 | nodeIn_b_bits_mask_eq_8 & ~(auto_out_b_bits_address[0]), nodeIn_b_bits_mask_acc_7 | nodeIn_b_bits_mask_eq_7 & auto_out_b_bits_address[0], nodeIn_b_bits_mask_acc_7 | nodeIn_b_bits_mask_eq_7 & ~(auto_out_b_bits_address[0]), nodeIn_b_bits_mask_acc_6 | nodeIn_b_bits_mask_eq_6 & auto_out_b_bits_address[0], nodeIn_b_bits_mask_acc_6 | nodeIn_b_bits_mask_eq_6 & ~(auto_out_b_bits_address[0])}),
    .io_in_b_bits_corrupt (auto_out_b_bits_corrupt),
    .io_in_c_ready        (_repeated_repeater_1_io_enq_ready),
    .io_in_c_valid        (auto_in_c_valid),
    .io_in_c_bits_opcode  (auto_in_c_bits_opcode),
    .io_in_c_bits_param   (auto_in_c_bits_param),
    .io_in_c_bits_size    (auto_in_c_bits_size),
    .io_in_c_bits_source  (auto_in_c_bits_source),
    .io_in_c_bits_address (auto_in_c_bits_address),
    .io_in_d_ready        (auto_in_d_ready),
    .io_in_d_valid        (nodeIn_d_valid),
    .io_in_d_bits_opcode  (auto_out_d_bits_opcode),
    .io_in_d_bits_param   (auto_out_d_bits_param),
    .io_in_d_bits_size    (auto_out_d_bits_size),
    .io_in_d_bits_source  (auto_out_d_bits_source),
    .io_in_d_bits_sink    (auto_out_d_bits_sink),
    .io_in_d_bits_denied  (auto_out_d_bits_denied),
    .io_in_d_bits_corrupt (nodeIn_d_bits_corrupt),
    .io_in_e_ready        (auto_out_e_ready),
    .io_in_e_valid        (auto_in_e_valid),
    .io_in_e_bits_sink    (auto_in_e_bits_sink)
  );
  Repeater_7 repeated_repeater (
    .clock               (clock),
    .reset               (reset),
    .io_repeat           (~repeat_last),
    .io_enq_ready        (_repeated_repeater_io_enq_ready),
    .io_enq_valid        (auto_in_a_valid),
    .io_enq_bits_opcode  (auto_in_a_bits_opcode),
    .io_enq_bits_param   (auto_in_a_bits_param),
    .io_enq_bits_size    (auto_in_a_bits_size),
    .io_enq_bits_source  (auto_in_a_bits_source),
    .io_enq_bits_address (auto_in_a_bits_address),
    .io_enq_bits_mask    (auto_in_a_bits_mask),
    .io_enq_bits_data    (auto_in_a_bits_data),
    .io_deq_ready        (auto_out_a_ready),
    .io_deq_valid        (_repeated_repeater_io_deq_valid),
    .io_deq_bits_opcode  (_repeated_repeater_io_deq_bits_opcode),
    .io_deq_bits_param   (auto_out_a_bits_param),
    .io_deq_bits_size    (_repeated_repeater_io_deq_bits_size),
    .io_deq_bits_source  (auto_out_a_bits_source),
    .io_deq_bits_address (_repeated_repeater_io_deq_bits_address),
    .io_deq_bits_mask    (_repeated_repeater_io_deq_bits_mask),
    .io_deq_bits_data    (_repeated_repeater_io_deq_bits_data)
  );
  Repeater_8 repeated_repeater_1 (
    .clock               (clock),
    .reset               (reset),
    .io_repeat           (~repeat_last_1),
    .io_enq_ready        (_repeated_repeater_1_io_enq_ready),
    .io_enq_valid        (auto_in_c_valid),
    .io_enq_bits_opcode  (auto_in_c_bits_opcode),
    .io_enq_bits_param   (auto_in_c_bits_param),
    .io_enq_bits_size    (auto_in_c_bits_size),
    .io_enq_bits_source  (auto_in_c_bits_source),
    .io_enq_bits_address (auto_in_c_bits_address),
    .io_enq_bits_data    (auto_in_c_bits_data),
    .io_deq_ready        (auto_out_c_ready),
    .io_deq_valid        (_repeated_repeater_1_io_deq_valid),
    .io_deq_bits_opcode  (_repeated_repeater_1_io_deq_bits_opcode),
    .io_deq_bits_param   (auto_out_c_bits_param),
    .io_deq_bits_size    (_repeated_repeater_1_io_deq_bits_size),
    .io_deq_bits_source  (auto_out_c_bits_source),
    .io_deq_bits_address (_repeated_repeater_1_io_deq_bits_address),
    .io_deq_bits_data    (_repeated_repeater_1_io_deq_bits_data)
  );
  assign auto_in_a_ready = _repeated_repeater_io_enq_ready;
  assign auto_in_b_valid = auto_out_b_valid;
  assign auto_in_b_bits_param = auto_out_b_bits_param;
  assign auto_in_b_bits_size = auto_out_b_bits_size;
  assign auto_in_b_bits_source = auto_out_b_bits_source;
  assign auto_in_b_bits_address = auto_out_b_bits_address;
  assign auto_in_c_ready = _repeated_repeater_1_io_enq_ready;
  assign auto_in_d_valid = nodeIn_d_valid;
  assign auto_in_d_bits_opcode = auto_out_d_bits_opcode;
  assign auto_in_d_bits_param = auto_out_d_bits_param;
  assign auto_in_d_bits_size = auto_out_d_bits_size;
  assign auto_in_d_bits_source = auto_out_d_bits_source;
  assign auto_in_d_bits_sink = auto_out_d_bits_sink;
  assign auto_in_d_bits_data = {auto_out_d_bits_data, nodeIn_d_bits_data_masked_enable_0 ? auto_out_d_bits_data : nodeIn_d_bits_data_rdata_0};
  assign auto_in_e_ready = auto_out_e_ready;
  assign auto_out_a_valid = _repeated_repeater_io_deq_valid;
  assign auto_out_a_bits_opcode = _repeated_repeater_io_deq_bits_opcode;
  assign auto_out_a_bits_size = _repeated_repeater_io_deq_bits_size;
  assign auto_out_a_bits_address = _repeated_repeater_io_deq_bits_address;
  assign auto_out_a_bits_mask = repeat_index ? _repeated_repeater_io_deq_bits_mask[15:8] : _repeated_repeater_io_deq_bits_mask[7:0];
  assign auto_out_a_bits_data = repeat_index ? _repeated_repeater_io_deq_bits_data[127:64] : auto_in_a_bits_data[63:0];
  assign auto_out_b_ready = auto_in_b_ready;
  assign auto_out_c_valid = _repeated_repeater_1_io_deq_valid;
  assign auto_out_c_bits_opcode = _repeated_repeater_1_io_deq_bits_opcode;
  assign auto_out_c_bits_size = _repeated_repeater_1_io_deq_bits_size;
  assign auto_out_c_bits_address = _repeated_repeater_1_io_deq_bits_address;
  assign auto_out_c_bits_data = _repeated_repeater_1_io_deq_bits_address[3] | repeat_count_1 ? _repeated_repeater_1_io_deq_bits_data[127:64] : auto_in_c_bits_data[63:0];
  assign auto_out_d_ready = nodeOut_d_ready;
  assign auto_out_e_valid = auto_in_e_valid;
  assign auto_out_e_bits_sink = auto_in_e_bits_sink;
endmodule

