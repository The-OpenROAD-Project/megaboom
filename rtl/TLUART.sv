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

module TLUART(
  input         clock,
                reset,
  output        auto_int_xing_out_sync_0,
                auto_control_xing_in_a_ready,
  input         auto_control_xing_in_a_valid,
  input  [2:0]  auto_control_xing_in_a_bits_opcode,
                auto_control_xing_in_a_bits_param,
  input  [1:0]  auto_control_xing_in_a_bits_size,
  input  [10:0] auto_control_xing_in_a_bits_source,
  input  [28:0] auto_control_xing_in_a_bits_address,
  input  [7:0]  auto_control_xing_in_a_bits_mask,
  input  [63:0] auto_control_xing_in_a_bits_data,
  input         auto_control_xing_in_a_bits_corrupt,
                auto_control_xing_in_d_ready,
  output        auto_control_xing_in_d_valid,
  output [2:0]  auto_control_xing_in_d_bits_opcode,
  output [1:0]  auto_control_xing_in_d_bits_size,
  output [10:0] auto_control_xing_in_d_bits_source,
  output [63:0] auto_control_xing_in_d_bits_data,
  output        auto_io_out_txd,
  input         auto_io_out_rxd
);

  wire        out_woready_2;
  wire        _out_wofireMux_T;
  wire        out_backSel_0;
  wire        quash;
  wire        _rxq_io_deq_valid;
  wire [7:0]  _rxq_io_deq_bits;
  wire [8:0]  _rxq_io_count;
  wire        _rxm_io_out_valid;
  wire [7:0]  _rxm_io_out_bits;
  wire        _txq_io_enq_ready;
  wire        _txq_io_deq_valid;
  wire [7:0]  _txq_io_deq_bits;
  wire [8:0]  _txq_io_count;
  wire        _txm_io_in_ready;
  reg  [15:0] div;
  reg         txen;
  reg         rxen;
  reg  [8:0]  txwm;
  reg  [8:0]  rxwm;
  reg         nstop;
  reg         ie_rxwm;
  reg         ie_txwm;
  wire        ip_txwm = _txq_io_count < txwm;
  wire        ip_rxwm = _rxq_io_count > rxwm;
  wire        out_front_bits_read = auto_control_xing_in_a_bits_opcode == 3'h4;
  wire        _out_out_bits_data_WIRE_3 = auto_control_xing_in_a_bits_address[11:5] == 7'h0;
  assign quash = out_woready_2 & auto_control_xing_in_a_bits_mask[3] & auto_control_xing_in_a_bits_data[31];
  assign out_backSel_0 = auto_control_xing_in_a_bits_address[4:3] == 2'h0;
  assign _out_wofireMux_T = auto_control_xing_in_a_valid & auto_control_xing_in_d_ready;
  wire        _out_wofireMux_T_2 = _out_wofireMux_T & ~out_front_bits_read;
  assign out_woready_2 = _out_wofireMux_T_2 & out_backSel_0 & _out_out_bits_data_WIRE_3;
  wire        out_woready_10 = _out_wofireMux_T_2 & auto_control_xing_in_a_bits_address[4:3] == 2'h1 & _out_out_bits_data_WIRE_3;
  wire        out_woready_12 = _out_wofireMux_T_2 & auto_control_xing_in_a_bits_address[4:3] == 2'h2 & _out_out_bits_data_WIRE_3;
  reg  [63:0] casez_tmp;
  always @(*) begin
    casez (auto_control_xing_in_a_bits_address[4:3])
      2'b00:
        casez_tmp = {~_rxq_io_deq_valid, 23'h0, _rxq_io_deq_bits, ~_txq_io_enq_ready, 31'h0};
      2'b01:
        casez_tmp = {7'h0, rxwm, 15'h0, rxen, 7'h0, txwm, 14'h0, nstop, txen};
      2'b10:
        casez_tmp = {30'h0, ip_rxwm, ip_txwm, 30'h0, ie_rxwm, ie_txwm};
      default:
        casez_tmp = {48'h0, div};
    endcase
  end // always @(*)
  wire [2:0]  controlXingIn_d_bits_opcode = {2'h0, out_front_bits_read};
  always @(posedge clock) begin
    if (reset) begin
      div <= 16'h10F4;
      txen <= 1'h0;
      rxen <= 1'h0;
      txwm <= 9'h0;
      rxwm <= 9'h0;
      nstop <= 1'h0;
      ie_rxwm <= 1'h0;
      ie_txwm <= 1'h0;
    end
    else begin
      if (_out_wofireMux_T_2 & (&(auto_control_xing_in_a_bits_address[4:3])) & _out_out_bits_data_WIRE_3 & (&{{8{auto_control_xing_in_a_bits_mask[1]}}, {8{auto_control_xing_in_a_bits_mask[0]}}}))
        div <= auto_control_xing_in_a_bits_data[15:0];
      if (out_woready_10 & auto_control_xing_in_a_bits_mask[0])
        txen <= auto_control_xing_in_a_bits_data[0];
      if (out_woready_10 & auto_control_xing_in_a_bits_mask[4])
        rxen <= auto_control_xing_in_a_bits_data[32];
      if (out_woready_10 & (&{auto_control_xing_in_a_bits_mask[3], {8{auto_control_xing_in_a_bits_mask[2]}}}))
        txwm <= auto_control_xing_in_a_bits_data[24:16];
      if (out_woready_10 & (&{auto_control_xing_in_a_bits_mask[7], {8{auto_control_xing_in_a_bits_mask[6]}}}))
        rxwm <= auto_control_xing_in_a_bits_data[56:48];
      if (out_woready_10 & auto_control_xing_in_a_bits_mask[0])
        nstop <= auto_control_xing_in_a_bits_data[1];
      if (out_woready_12 & auto_control_xing_in_a_bits_mask[0])
        ie_rxwm <= auto_control_xing_in_a_bits_data[1];
      if (out_woready_12 & auto_control_xing_in_a_bits_mask[0])
        ie_txwm <= auto_control_xing_in_a_bits_data[0];
    end
  end // always @(posedge)
  IntSyncCrossingSource_1 intsource (
    .clock           (clock),
    .reset           (reset),
    .auto_in_0       (ip_txwm & ie_txwm | ip_rxwm & ie_rxwm),
    .auto_out_sync_0 (auto_int_xing_out_sync_0)
  );
  TLMonitor_58 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (auto_control_xing_in_d_ready),
    .io_in_a_valid        (auto_control_xing_in_a_valid),
    .io_in_a_bits_opcode  (auto_control_xing_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_control_xing_in_a_bits_param),
    .io_in_a_bits_size    (auto_control_xing_in_a_bits_size),
    .io_in_a_bits_source  (auto_control_xing_in_a_bits_source),
    .io_in_a_bits_address (auto_control_xing_in_a_bits_address),
    .io_in_a_bits_mask    (auto_control_xing_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_control_xing_in_a_bits_corrupt),
    .io_in_d_ready        (auto_control_xing_in_d_ready),
    .io_in_d_valid        (auto_control_xing_in_a_valid),
    .io_in_d_bits_opcode  (controlXingIn_d_bits_opcode),
    .io_in_d_bits_size    (auto_control_xing_in_a_bits_size),
    .io_in_d_bits_source  (auto_control_xing_in_a_bits_source)
  );
  UARTTx txm (
    .clock       (clock),
    .reset       (reset),
    .io_en       (txen),
    .io_in_ready (_txm_io_in_ready),
    .io_in_valid (_txq_io_deq_valid),
    .io_in_bits  (_txq_io_deq_bits),
    .io_out      (auto_io_out_txd),
    .io_div      (div),
    .io_nstop    (nstop)
  );
  Queue_42 txq (
    .clock        (clock),
    .reset        (reset),
    .io_enq_ready (_txq_io_enq_ready),
    .io_enq_valid (out_woready_2 & auto_control_xing_in_a_bits_mask[0] & ~quash),
    .io_enq_bits  (auto_control_xing_in_a_bits_data[7:0]),
    .io_deq_ready (_txm_io_in_ready),
    .io_deq_valid (_txq_io_deq_valid),
    .io_deq_bits  (_txq_io_deq_bits),
    .io_count     (_txq_io_count)
  );
  UARTRx rxm (
    .clock        (clock),
    .reset        (reset),
    .io_en        (rxen),
    .io_in        (auto_io_out_rxd),
    .io_out_valid (_rxm_io_out_valid),
    .io_out_bits  (_rxm_io_out_bits),
    .io_div       (div)
  );
  Queue_42 rxq (
    .clock        (clock),
    .reset        (reset),
    .io_enq_ready (/* unused */),
    .io_enq_valid (_rxm_io_out_valid),
    .io_enq_bits  (_rxm_io_out_bits),
    .io_deq_ready (_out_wofireMux_T & out_front_bits_read & out_backSel_0 & _out_out_bits_data_WIRE_3 & auto_control_xing_in_a_bits_mask[4]),
    .io_deq_valid (_rxq_io_deq_valid),
    .io_deq_bits  (_rxq_io_deq_bits),
    .io_count     (_rxq_io_count)
  );
  assign auto_control_xing_in_a_ready = auto_control_xing_in_d_ready;
  assign auto_control_xing_in_d_valid = auto_control_xing_in_a_valid;
  assign auto_control_xing_in_d_bits_opcode = controlXingIn_d_bits_opcode;
  assign auto_control_xing_in_d_bits_size = auto_control_xing_in_a_bits_size;
  assign auto_control_xing_in_d_bits_source = auto_control_xing_in_a_bits_source;
  assign auto_control_xing_in_d_bits_data = _out_out_bits_data_WIRE_3 ? casez_tmp : 64'h0;
endmodule

