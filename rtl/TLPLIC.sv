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

module TLPLIC(
  input         clock,
                reset,
                auto_int_in_0,
  output        auto_int_out_1_0,
                auto_int_out_0_0,
                auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [10:0] auto_in_a_bits_source,
  input  [27:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_size,
  output [10:0] auto_in_d_bits_source,
  output [63:0] auto_in_d_bits_data
);

  wire        out_woready_6;
  wire        out_woready_9;
  wire        _out_rofireMux_T_1;
  wire        out_backSel_10;
  wire        out_backSel_8;
  wire        completer_0;
  wire        completerDev;
  wire        completer_1;
  wire        _out_back_q_io_enq_ready;
  wire        _out_back_q_io_deq_valid;
  wire        _out_back_q_io_deq_bits_read;
  wire [22:0] _out_back_q_io_deq_bits_index;
  wire [63:0] _out_back_q_io_deq_bits_data;
  wire [7:0]  _out_back_q_io_deq_bits_mask;
  wire [10:0] _out_back_q_io_deq_bits_extra_tlrr_extra_source;
  wire [1:0]  _out_back_q_io_deq_bits_extra_tlrr_extra_size;
  wire        _fanin_1_io_dev;
  wire        _fanin_1_io_max;
  wire        _fanin_io_dev;
  wire        _fanin_io_max;
  wire        _gateways_gateway_io_plic_valid;
  reg         priority_0;
  reg         threshold_0;
  reg         threshold_1;
  reg         pending_0;
  reg         enables_0_0;
  reg         enables_1_0;
  reg         maxDevs_0;
  reg         maxDevs_1;
  reg         intnodeOut_0_REG;
  reg         intnodeOut_0_REG_1;
  wire [1:0]  _GEN = {1'h0, completerDev};
  wire        _out_T_11 = {_out_back_q_io_deq_bits_index[22:19], _out_back_q_io_deq_bits_index[17:11], _out_back_q_io_deq_bits_index[8:5], _out_back_q_io_deq_bits_index[3:0]} == 19'h0;
  wire [31:0] _out_womask_T_9 = {{8{_out_back_q_io_deq_bits_mask[7]}}, {8{_out_back_q_io_deq_bits_mask[6]}}, {8{_out_back_q_io_deq_bits_mask[5]}}, {8{_out_back_q_io_deq_bits_mask[4]}}};
  wire        claimer_1 = _out_rofireMux_T_1 & out_backSel_10 & _out_T_11 & (|_out_womask_T_9);
  wire [1:0]  _out_completer_1_T = {enables_1_0, 1'h0} >> _GEN;
  assign completer_1 = out_woready_6 & (&_out_womask_T_9) & _out_completer_1_T[0];
  wire        claimer_0 = _out_rofireMux_T_1 & out_backSel_8 & _out_T_11 & (|_out_womask_T_9);
  assign completerDev = _out_back_q_io_deq_bits_data[32];
  `ifndef SYNTHESIS
    wire [1:0] _GEN_0 = {claimer_1, claimer_0};
    wire [1:0] _GEN_1 = {completer_1, completer_0};
    always @(posedge clock) begin
      if (~reset & (|(_GEN_0 & _GEN_0 - 2'h1))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Plic.scala:246 assert((claimer.asUInt & (claimer.asUInt - 1.U)) === 0.U) // One-Hot\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & (|(_GEN_1 & _GEN_1 - 2'h1))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Plic.scala:263 assert((completer.asUInt & (completer.asUInt - 1.U)) === 0.U) // One-Hot\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & completerDev != _out_back_q_io_deq_bits_data[32]) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: completerDev should be consistent for all harts\n    at Plic.scala:293 assert(completerDev === data.extract(log2Ceil(nDevices+1)-1, 0),\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire [1:0]  _out_completer_0_T = {enables_0_0, 1'h0} >> _GEN;
  assign completer_0 = out_woready_9 & (&_out_womask_T_9) & _out_completer_0_T[0];
  wire [3:0]  out_oindex = {_out_back_q_io_deq_bits_index[18], _out_back_q_io_deq_bits_index[10:9], _out_back_q_io_deq_bits_index[4]};
  wire [3:0]  _GEN_2 = {_out_back_q_io_deq_bits_index[18], _out_back_q_io_deq_bits_index[10:9], _out_back_q_io_deq_bits_index[4]};
  assign out_backSel_8 = _GEN_2 == 4'h8;
  assign out_backSel_10 = _GEN_2 == 4'hA;
  wire        _out_wofireMux_T = _out_back_q_io_deq_valid & auto_in_d_ready;
  assign _out_rofireMux_T_1 = _out_wofireMux_T & _out_back_q_io_deq_bits_read;
  wire        _out_wofireMux_T_2 = _out_wofireMux_T & ~_out_back_q_io_deq_bits_read;
  assign out_woready_9 = _out_wofireMux_T_2 & out_backSel_8 & _out_T_11;
  assign out_woready_6 = _out_wofireMux_T_2 & out_backSel_10 & _out_T_11;
  wire        _out_out_bits_data_T_6 = out_oindex == 4'h0;
  wire [2:0]  nodeIn_d_bits_opcode = {2'h0, _out_back_q_io_deq_bits_read};
  wire        claimedDevs_1 = claimer_0 & maxDevs_0 | claimer_1 & maxDevs_1;
  always @(posedge clock) begin
    if (_out_wofireMux_T_2 & _GEN_2 == 4'h0 & _out_T_11 & _out_back_q_io_deq_bits_mask[4])
      priority_0 <= _out_back_q_io_deq_bits_data[32];
    if (out_woready_9 & _out_back_q_io_deq_bits_mask[0])
      threshold_0 <= _out_back_q_io_deq_bits_data[0];
    if (out_woready_6 & _out_back_q_io_deq_bits_mask[0])
      threshold_1 <= _out_back_q_io_deq_bits_data[0];
    if (_out_wofireMux_T_2 & _GEN_2 == 4'h4 & _out_T_11 & _out_back_q_io_deq_bits_mask[0])
      enables_0_0 <= _out_back_q_io_deq_bits_data[1];
    if (_out_wofireMux_T_2 & _GEN_2 == 4'h5 & _out_T_11 & _out_back_q_io_deq_bits_mask[0])
      enables_1_0 <= _out_back_q_io_deq_bits_data[1];
    maxDevs_0 <= _fanin_io_dev;
    maxDevs_1 <= _fanin_1_io_dev;
    intnodeOut_0_REG <= _fanin_io_max;
    intnodeOut_0_REG_1 <= _fanin_1_io_max;
    if (reset)
      pending_0 <= 1'h0;
    else if (claimedDevs_1 | _gateways_gateway_io_plic_valid)
      pending_0 <= ~claimedDevs_1;
  end // always @(posedge)
  TLMonitor_45 monitor (
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
  LevelGateway gateways_gateway (
    .clock            (clock),
    .reset            (reset),
    .io_interrupt     (auto_int_in_0),
    .io_plic_valid    (_gateways_gateway_io_plic_valid),
    .io_plic_ready    (~pending_0),
    .io_plic_complete ((completer_0 | completer_1) & completerDev)
  );
  PLICFanIn fanin (
    .io_prio_0 (priority_0),
    .io_ip     (enables_0_0 & pending_0),
    .io_dev    (_fanin_io_dev),
    .io_max    (_fanin_io_max)
  );
  PLICFanIn fanin_1 (
    .io_prio_0 (priority_0),
    .io_ip     (enables_1_0 & pending_0),
    .io_dev    (_fanin_1_io_dev),
    .io_max    (_fanin_1_io_max)
  );
  Queue_41 out_back_q (
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
    .io_deq_bits_data                    (_out_back_q_io_deq_bits_data),
    .io_deq_bits_mask                    (_out_back_q_io_deq_bits_mask),
    .io_deq_bits_extra_tlrr_extra_source (_out_back_q_io_deq_bits_extra_tlrr_extra_source),
    .io_deq_bits_extra_tlrr_extra_size   (_out_back_q_io_deq_bits_extra_tlrr_extra_size)
  );
  assign auto_int_out_1_0 = intnodeOut_0_REG_1 > threshold_1;
  assign auto_int_out_0_0 = intnodeOut_0_REG > threshold_0;
  assign auto_in_a_ready = _out_back_q_io_enq_ready;
  assign auto_in_d_valid = _out_back_q_io_deq_valid;
  assign auto_in_d_bits_opcode = nodeIn_d_bits_opcode;
  assign auto_in_d_bits_size = _out_back_q_io_deq_bits_extra_tlrr_extra_size;
  assign auto_in_d_bits_source = _out_back_q_io_deq_bits_extra_tlrr_extra_source;
  assign auto_in_d_bits_data = ~(_out_out_bits_data_T_6 | out_oindex == 4'h2 | out_oindex == 4'h4 | out_oindex == 4'h5 | out_oindex == 4'h8 | out_oindex == 4'hA) | _out_T_11 ? (_out_out_bits_data_T_6 ? {31'h0, priority_0, 32'h0} : out_oindex == 4'h2 ? {62'h0, pending_0, 1'h0} : out_oindex == 4'h4 ? {62'h0, enables_0_0, 1'h0} : out_oindex == 4'h5 ? {62'h0, enables_1_0, 1'h0} : out_oindex == 4'h8 ? {31'h0, maxDevs_0, 31'h0, threshold_0} : out_oindex == 4'hA ? {31'h0, maxDevs_1, 31'h0, threshold_1} : 64'h0) : 64'h0;
endmodule

