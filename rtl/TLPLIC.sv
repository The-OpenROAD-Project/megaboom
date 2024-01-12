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

module TLPLIC(
  input         clock,
                reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [9:0]  auto_in_a_bits_source,
  input  [27:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_size,
  output [9:0]  auto_in_d_bits_source,
  output [63:0] auto_in_d_bits_data
);

  wire        _out_rofireMux_T_1;
  wire        out_backSel_6;
  wire        out_backSel_4;
  wire        claimer_0;
  wire        claimer_1;
  wire        _out_back_q_io_enq_ready;
  wire        _out_back_q_io_deq_valid;
  wire        _out_back_q_io_deq_bits_read;
  wire [22:0] _out_back_q_io_deq_bits_index;
  wire [7:0]  _out_back_q_io_deq_bits_mask;
  wire [9:0]  _out_back_q_io_deq_bits_extra_tlrr_extra_source;
  wire [1:0]  _out_back_q_io_deq_bits_extra_tlrr_extra_size;
  `ifndef SYNTHESIS
    wire [1:0] _GEN = {claimer_1, claimer_0};
    always @(posedge clock) begin
      if (~reset & (|(_GEN & _GEN - 2'h1))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Plic.scala:246 assert((claimer.asUInt & (claimer.asUInt - 1.U)) === 0.U) // One-Hot\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        _out_out_bits_data_WIRE_6 = {_out_back_q_io_deq_bits_index[22:19], _out_back_q_io_deq_bits_index[17:10], _out_back_q_io_deq_bits_index[8:5], _out_back_q_io_deq_bits_index[3:0]} == 20'h0;
  wire [31:0] _out_womask_T_7 = {{8{_out_back_q_io_deq_bits_mask[7]}}, {8{_out_back_q_io_deq_bits_mask[6]}}, {8{_out_back_q_io_deq_bits_mask[5]}}, {8{_out_back_q_io_deq_bits_mask[4]}}};
  assign claimer_1 = _out_rofireMux_T_1 & out_backSel_6 & _out_out_bits_data_WIRE_6 & (|_out_womask_T_7);
  assign claimer_0 = _out_rofireMux_T_1 & out_backSel_4 & _out_out_bits_data_WIRE_6 & (|_out_womask_T_7);
  wire [2:0]  _GEN_0 = {_out_back_q_io_deq_bits_index[18], _out_back_q_io_deq_bits_index[9], _out_back_q_io_deq_bits_index[4]};
  assign out_backSel_4 = _GEN_0 == 3'h4;
  assign out_backSel_6 = _GEN_0 == 3'h6;
  assign _out_rofireMux_T_1 = _out_back_q_io_deq_valid & auto_in_d_ready & _out_back_q_io_deq_bits_read;
  wire [2:0]  nodeIn_d_bits_opcode = {2'h0, _out_back_q_io_deq_bits_read};
  TLMonitor_34 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (_out_back_q_io_enq_ready),
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_opcode  (auto_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_in_a_bits_param),
    .io_in_a_bits_size    (auto_in_a_bits_size),
    .io_in_a_bits_source  (auto_in_a_bits_source),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_a_bits_mask    (auto_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_in_a_bits_corrupt),
    .io_in_d_ready        (auto_in_d_ready),
    .io_in_d_valid        (_out_back_q_io_deq_valid),
    .io_in_d_bits_opcode  (nodeIn_d_bits_opcode),
    .io_in_d_bits_size    (_out_back_q_io_deq_bits_extra_tlrr_extra_size),
    .io_in_d_bits_source  (_out_back_q_io_deq_bits_extra_tlrr_extra_source)
  );
  Queue_28 out_back_q (
    .clock                               (clock),
    .reset                               (reset),
    .io_enq_ready                        (_out_back_q_io_enq_ready),
    .io_enq_valid                        (auto_in_a_valid),
    .io_enq_bits_read                    (auto_in_a_bits_opcode == 3'h4),
    .io_enq_bits_index                   (auto_in_a_bits_address[25:3]),
    .io_enq_bits_data                    (auto_in_a_bits_data),
    .io_enq_bits_mask                    (auto_in_a_bits_mask),
    .io_enq_bits_extra_tlrr_extra_source (auto_in_a_bits_source),
    .io_enq_bits_extra_tlrr_extra_size   (auto_in_a_bits_size),
    .io_deq_ready                        (auto_in_d_ready),
    .io_deq_valid                        (_out_back_q_io_deq_valid),
    .io_deq_bits_read                    (_out_back_q_io_deq_bits_read),
    .io_deq_bits_index                   (_out_back_q_io_deq_bits_index),
    .io_deq_bits_mask                    (_out_back_q_io_deq_bits_mask),
    .io_deq_bits_extra_tlrr_extra_source (_out_back_q_io_deq_bits_extra_tlrr_extra_source),
    .io_deq_bits_extra_tlrr_extra_size   (_out_back_q_io_deq_bits_extra_tlrr_extra_size)
  );
  assign auto_in_a_ready = _out_back_q_io_enq_ready;
  assign auto_in_d_valid = _out_back_q_io_deq_valid;
  assign auto_in_d_bits_opcode = nodeIn_d_bits_opcode;
  assign auto_in_d_bits_size = _out_back_q_io_deq_bits_extra_tlrr_extra_size;
  assign auto_in_d_bits_source = _out_back_q_io_deq_bits_extra_tlrr_extra_source;
  assign auto_in_d_bits_data = 64'h0;
endmodule

