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

module TLDebugModuleOuterAsync(
  output [2:0]  auto_asource_out_a_mem_0_opcode,
  output [8:0]  auto_asource_out_a_mem_0_address,
  output [31:0] auto_asource_out_a_mem_0_data,
  input         auto_asource_out_a_ridx,
  output        auto_asource_out_a_widx,
  input         auto_asource_out_a_safe_ridx_valid,
  output        auto_asource_out_a_safe_widx_valid,
                auto_asource_out_a_safe_source_reset_n,
  input         auto_asource_out_a_safe_sink_reset_n,
  input  [2:0]  auto_asource_out_d_mem_0_opcode,
  input  [1:0]  auto_asource_out_d_mem_0_size,
  input         auto_asource_out_d_mem_0_source,
  input  [31:0] auto_asource_out_d_mem_0_data,
  output        auto_asource_out_d_ridx,
  input         auto_asource_out_d_widx,
  output        auto_asource_out_d_safe_ridx_valid,
  input         auto_asource_out_d_safe_widx_valid,
                auto_asource_out_d_safe_source_reset_n,
  output        auto_asource_out_d_safe_sink_reset_n,
                auto_intsource_out_sync_0,
  input         io_dmi_clock,
                io_dmi_reset,
  output        io_dmi_req_ready,
  input         io_dmi_req_valid,
  input  [6:0]  io_dmi_req_bits_addr,
  input  [31:0] io_dmi_req_bits_data,
  input  [1:0]  io_dmi_req_bits_op,
  input         io_dmi_resp_ready,
  output        io_dmi_resp_valid,
  output [31:0] io_dmi_resp_bits_data,
  output [1:0]  io_dmi_resp_bits_resp,
  output        io_ctrl_dmactive,
  input         io_ctrl_dmactiveAck,
  output        io_innerCtrl_mem_0_resumereq,
  output [9:0]  io_innerCtrl_mem_0_hartsel,
  output        io_innerCtrl_mem_0_ackhavereset,
                io_innerCtrl_mem_0_hrmask_0,
  input         io_innerCtrl_ridx,
  output        io_innerCtrl_widx,
  input         io_innerCtrl_safe_ridx_valid,
  output        io_innerCtrl_safe_widx_valid,
                io_innerCtrl_safe_source_reset_n,
  input         io_innerCtrl_safe_sink_reset_n,
                io_hgDebugInt_0
);

  wire        _io_innerCtrl_source_io_enq_ready;
  wire        _dmactiveAck_dmactiveAckSync_io_q;
  wire        _asource_auto_in_a_ready;
  wire        _asource_auto_in_d_valid;
  wire [2:0]  _asource_auto_in_d_bits_opcode;
  wire [1:0]  _asource_auto_in_d_bits_param;
  wire [1:0]  _asource_auto_in_d_bits_size;
  wire        _asource_auto_in_d_bits_source;
  wire        _asource_auto_in_d_bits_sink;
  wire        _asource_auto_in_d_bits_denied;
  wire [31:0] _asource_auto_in_d_bits_data;
  wire        _asource_auto_in_d_bits_corrupt;
  wire        _dmiBypass_auto_node_out_out_a_valid;
  wire [2:0]  _dmiBypass_auto_node_out_out_a_bits_opcode;
  wire [8:0]  _dmiBypass_auto_node_out_out_a_bits_address;
  wire [31:0] _dmiBypass_auto_node_out_out_a_bits_data;
  wire        _dmiBypass_auto_node_out_out_d_ready;
  wire        _dmiBypass_auto_node_in_in_a_ready;
  wire        _dmiBypass_auto_node_in_in_d_valid;
  wire [2:0]  _dmiBypass_auto_node_in_in_d_bits_opcode;
  wire [1:0]  _dmiBypass_auto_node_in_in_d_bits_param;
  wire [1:0]  _dmiBypass_auto_node_in_in_d_bits_size;
  wire        _dmiBypass_auto_node_in_in_d_bits_sink;
  wire        _dmiBypass_auto_node_in_in_d_bits_denied;
  wire [31:0] _dmiBypass_auto_node_in_in_d_bits_data;
  wire        _dmiBypass_auto_node_in_in_d_bits_corrupt;
  wire        _dmOuter_auto_dmi_in_a_ready;
  wire        _dmOuter_auto_dmi_in_d_valid;
  wire [2:0]  _dmOuter_auto_dmi_in_d_bits_opcode;
  wire [31:0] _dmOuter_auto_dmi_in_d_bits_data;
  wire        _dmOuter_auto_int_out_0;
  wire        _dmOuter_io_ctrl_dmactive;
  wire        _dmOuter_io_innerCtrl_valid;
  wire        _dmOuter_io_innerCtrl_bits_resumereq;
  wire [9:0]  _dmOuter_io_innerCtrl_bits_hartsel;
  wire        _dmOuter_io_innerCtrl_bits_ackhavereset;
  wire        _dmOuter_io_innerCtrl_bits_hrmask_0;
  wire        _dmi2tl_auto_out_a_valid;
  wire [2:0]  _dmi2tl_auto_out_a_bits_opcode;
  wire [8:0]  _dmi2tl_auto_out_a_bits_address;
  wire [31:0] _dmi2tl_auto_out_a_bits_data;
  wire        _dmi2tl_auto_out_d_ready;
  wire        _dmiXbar_auto_in_a_ready;
  wire        _dmiXbar_auto_in_d_valid;
  wire        _dmiXbar_auto_in_d_bits_denied;
  wire [31:0] _dmiXbar_auto_in_d_bits_data;
  wire        _dmiXbar_auto_in_d_bits_corrupt;
  wire        _dmiXbar_auto_out_1_a_valid;
  wire [2:0]  _dmiXbar_auto_out_1_a_bits_opcode;
  wire [6:0]  _dmiXbar_auto_out_1_a_bits_address;
  wire [31:0] _dmiXbar_auto_out_1_a_bits_data;
  wire        _dmiXbar_auto_out_1_d_ready;
  wire        _dmiXbar_auto_out_0_a_valid;
  wire [2:0]  _dmiXbar_auto_out_0_a_bits_opcode;
  wire [8:0]  _dmiXbar_auto_out_0_a_bits_address;
  wire [31:0] _dmiXbar_auto_out_0_a_bits_data;
  wire        _dmiXbar_auto_out_0_d_ready;
  TLXbar_10 dmiXbar (
    .clock                     (io_dmi_clock),
    .reset                     (io_dmi_reset),
    .auto_in_a_ready           (_dmiXbar_auto_in_a_ready),
    .auto_in_a_valid           (_dmi2tl_auto_out_a_valid),
    .auto_in_a_bits_opcode     (_dmi2tl_auto_out_a_bits_opcode),
    .auto_in_a_bits_address    (_dmi2tl_auto_out_a_bits_address),
    .auto_in_a_bits_data       (_dmi2tl_auto_out_a_bits_data),
    .auto_in_d_ready           (_dmi2tl_auto_out_d_ready),
    .auto_in_d_valid           (_dmiXbar_auto_in_d_valid),
    .auto_in_d_bits_denied     (_dmiXbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data       (_dmiXbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt    (_dmiXbar_auto_in_d_bits_corrupt),
    .auto_out_1_a_ready        (_dmOuter_auto_dmi_in_a_ready),
    .auto_out_1_a_valid        (_dmiXbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode  (_dmiXbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_address (_dmiXbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_data    (_dmiXbar_auto_out_1_a_bits_data),
    .auto_out_1_d_ready        (_dmiXbar_auto_out_1_d_ready),
    .auto_out_1_d_valid        (_dmOuter_auto_dmi_in_d_valid),
    .auto_out_1_d_bits_opcode  (_dmOuter_auto_dmi_in_d_bits_opcode),
    .auto_out_1_d_bits_data    (_dmOuter_auto_dmi_in_d_bits_data),
    .auto_out_0_a_ready        (_dmiBypass_auto_node_in_in_a_ready),
    .auto_out_0_a_valid        (_dmiXbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode  (_dmiXbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_address (_dmiXbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_data    (_dmiXbar_auto_out_0_a_bits_data),
    .auto_out_0_d_ready        (_dmiXbar_auto_out_0_d_ready),
    .auto_out_0_d_valid        (_dmiBypass_auto_node_in_in_d_valid),
    .auto_out_0_d_bits_opcode  (_dmiBypass_auto_node_in_in_d_bits_opcode),
    .auto_out_0_d_bits_param   (_dmiBypass_auto_node_in_in_d_bits_param),
    .auto_out_0_d_bits_size    (_dmiBypass_auto_node_in_in_d_bits_size),
    .auto_out_0_d_bits_sink    (_dmiBypass_auto_node_in_in_d_bits_sink),
    .auto_out_0_d_bits_denied  (_dmiBypass_auto_node_in_in_d_bits_denied),
    .auto_out_0_d_bits_data    (_dmiBypass_auto_node_in_in_d_bits_data),
    .auto_out_0_d_bits_corrupt (_dmiBypass_auto_node_in_in_d_bits_corrupt)
  );
  DMIToTL dmi2tl (
    .auto_out_a_ready        (_dmiXbar_auto_in_a_ready),
    .auto_out_a_valid        (_dmi2tl_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_dmi2tl_auto_out_a_bits_opcode),
    .auto_out_a_bits_address (_dmi2tl_auto_out_a_bits_address),
    .auto_out_a_bits_data    (_dmi2tl_auto_out_a_bits_data),
    .auto_out_d_ready        (_dmi2tl_auto_out_d_ready),
    .auto_out_d_valid        (_dmiXbar_auto_in_d_valid),
    .auto_out_d_bits_denied  (_dmiXbar_auto_in_d_bits_denied),
    .auto_out_d_bits_data    (_dmiXbar_auto_in_d_bits_data),
    .auto_out_d_bits_corrupt (_dmiXbar_auto_in_d_bits_corrupt),
    .io_dmi_req_ready        (io_dmi_req_ready),
    .io_dmi_req_valid        (io_dmi_req_valid),
    .io_dmi_req_bits_addr    (io_dmi_req_bits_addr),
    .io_dmi_req_bits_data    (io_dmi_req_bits_data),
    .io_dmi_req_bits_op      (io_dmi_req_bits_op),
    .io_dmi_resp_ready       (io_dmi_resp_ready),
    .io_dmi_resp_valid       (io_dmi_resp_valid),
    .io_dmi_resp_bits_data   (io_dmi_resp_bits_data),
    .io_dmi_resp_bits_resp   (io_dmi_resp_bits_resp)
  );
  TLDebugModuleOuter dmOuter (
    .clock                          (io_dmi_clock),
    .reset                          (io_dmi_reset),
    .auto_dmi_in_a_ready            (_dmOuter_auto_dmi_in_a_ready),
    .auto_dmi_in_a_valid            (_dmiXbar_auto_out_1_a_valid),
    .auto_dmi_in_a_bits_opcode      (_dmiXbar_auto_out_1_a_bits_opcode),
    .auto_dmi_in_a_bits_address     (_dmiXbar_auto_out_1_a_bits_address),
    .auto_dmi_in_a_bits_data        (_dmiXbar_auto_out_1_a_bits_data),
    .auto_dmi_in_d_ready            (_dmiXbar_auto_out_1_d_ready),
    .auto_dmi_in_d_valid            (_dmOuter_auto_dmi_in_d_valid),
    .auto_dmi_in_d_bits_opcode      (_dmOuter_auto_dmi_in_d_bits_opcode),
    .auto_dmi_in_d_bits_data        (_dmOuter_auto_dmi_in_d_bits_data),
    .auto_int_out_0                 (_dmOuter_auto_int_out_0),
    .io_ctrl_dmactive               (_dmOuter_io_ctrl_dmactive),
    .io_ctrl_dmactiveAck            (_dmactiveAck_dmactiveAckSync_io_q),
    .io_innerCtrl_ready             (_io_innerCtrl_source_io_enq_ready),
    .io_innerCtrl_valid             (_dmOuter_io_innerCtrl_valid),
    .io_innerCtrl_bits_resumereq    (_dmOuter_io_innerCtrl_bits_resumereq),
    .io_innerCtrl_bits_hartsel      (_dmOuter_io_innerCtrl_bits_hartsel),
    .io_innerCtrl_bits_ackhavereset (_dmOuter_io_innerCtrl_bits_ackhavereset),
    .io_innerCtrl_bits_hrmask_0     (_dmOuter_io_innerCtrl_bits_hrmask_0),
    .io_hgDebugInt_0                (io_hgDebugInt_0)
  );
  IntSyncCrossingSource_4 intsource (
    .auto_in_0       (_dmOuter_auto_int_out_0),
    .auto_out_sync_0 (auto_intsource_out_sync_0)
  );
  TLBusBypass dmiBypass (
    .clock                            (io_dmi_clock),
    .reset                            (io_dmi_reset),
    .auto_node_out_out_a_ready        (_asource_auto_in_a_ready),
    .auto_node_out_out_a_valid        (_dmiBypass_auto_node_out_out_a_valid),
    .auto_node_out_out_a_bits_opcode  (_dmiBypass_auto_node_out_out_a_bits_opcode),
    .auto_node_out_out_a_bits_address (_dmiBypass_auto_node_out_out_a_bits_address),
    .auto_node_out_out_a_bits_data    (_dmiBypass_auto_node_out_out_a_bits_data),
    .auto_node_out_out_d_ready        (_dmiBypass_auto_node_out_out_d_ready),
    .auto_node_out_out_d_valid        (_asource_auto_in_d_valid),
    .auto_node_out_out_d_bits_opcode  (_asource_auto_in_d_bits_opcode),
    .auto_node_out_out_d_bits_param   (_asource_auto_in_d_bits_param),
    .auto_node_out_out_d_bits_size    (_asource_auto_in_d_bits_size),
    .auto_node_out_out_d_bits_source  (_asource_auto_in_d_bits_source),
    .auto_node_out_out_d_bits_sink    (_asource_auto_in_d_bits_sink),
    .auto_node_out_out_d_bits_denied  (_asource_auto_in_d_bits_denied),
    .auto_node_out_out_d_bits_data    (_asource_auto_in_d_bits_data),
    .auto_node_out_out_d_bits_corrupt (_asource_auto_in_d_bits_corrupt),
    .auto_node_in_in_a_ready          (_dmiBypass_auto_node_in_in_a_ready),
    .auto_node_in_in_a_valid          (_dmiXbar_auto_out_0_a_valid),
    .auto_node_in_in_a_bits_opcode    (_dmiXbar_auto_out_0_a_bits_opcode),
    .auto_node_in_in_a_bits_address   (_dmiXbar_auto_out_0_a_bits_address),
    .auto_node_in_in_a_bits_data      (_dmiXbar_auto_out_0_a_bits_data),
    .auto_node_in_in_d_ready          (_dmiXbar_auto_out_0_d_ready),
    .auto_node_in_in_d_valid          (_dmiBypass_auto_node_in_in_d_valid),
    .auto_node_in_in_d_bits_opcode    (_dmiBypass_auto_node_in_in_d_bits_opcode),
    .auto_node_in_in_d_bits_param     (_dmiBypass_auto_node_in_in_d_bits_param),
    .auto_node_in_in_d_bits_size      (_dmiBypass_auto_node_in_in_d_bits_size),
    .auto_node_in_in_d_bits_sink      (_dmiBypass_auto_node_in_in_d_bits_sink),
    .auto_node_in_in_d_bits_denied    (_dmiBypass_auto_node_in_in_d_bits_denied),
    .auto_node_in_in_d_bits_data      (_dmiBypass_auto_node_in_in_d_bits_data),
    .auto_node_in_in_d_bits_corrupt   (_dmiBypass_auto_node_in_in_d_bits_corrupt),
    .io_bypass                        (~_dmOuter_io_ctrl_dmactive | ~_dmactiveAck_dmactiveAckSync_io_q)
  );
  TLAsyncCrossingSource asource (
    .clock                          (io_dmi_clock),
    .reset                          (io_dmi_reset),
    .auto_in_a_ready                (_asource_auto_in_a_ready),
    .auto_in_a_valid                (_dmiBypass_auto_node_out_out_a_valid),
    .auto_in_a_bits_opcode          (_dmiBypass_auto_node_out_out_a_bits_opcode),
    .auto_in_a_bits_address         (_dmiBypass_auto_node_out_out_a_bits_address),
    .auto_in_a_bits_data            (_dmiBypass_auto_node_out_out_a_bits_data),
    .auto_in_d_ready                (_dmiBypass_auto_node_out_out_d_ready),
    .auto_in_d_valid                (_asource_auto_in_d_valid),
    .auto_in_d_bits_opcode          (_asource_auto_in_d_bits_opcode),
    .auto_in_d_bits_param           (_asource_auto_in_d_bits_param),
    .auto_in_d_bits_size            (_asource_auto_in_d_bits_size),
    .auto_in_d_bits_source          (_asource_auto_in_d_bits_source),
    .auto_in_d_bits_sink            (_asource_auto_in_d_bits_sink),
    .auto_in_d_bits_denied          (_asource_auto_in_d_bits_denied),
    .auto_in_d_bits_data            (_asource_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt         (_asource_auto_in_d_bits_corrupt),
    .auto_out_a_mem_0_opcode        (auto_asource_out_a_mem_0_opcode),
    .auto_out_a_mem_0_address       (auto_asource_out_a_mem_0_address),
    .auto_out_a_mem_0_data          (auto_asource_out_a_mem_0_data),
    .auto_out_a_ridx                (auto_asource_out_a_ridx),
    .auto_out_a_widx                (auto_asource_out_a_widx),
    .auto_out_a_safe_ridx_valid     (auto_asource_out_a_safe_ridx_valid),
    .auto_out_a_safe_widx_valid     (auto_asource_out_a_safe_widx_valid),
    .auto_out_a_safe_source_reset_n (auto_asource_out_a_safe_source_reset_n),
    .auto_out_a_safe_sink_reset_n   (auto_asource_out_a_safe_sink_reset_n),
    .auto_out_d_mem_0_opcode        (auto_asource_out_d_mem_0_opcode),
    .auto_out_d_mem_0_size          (auto_asource_out_d_mem_0_size),
    .auto_out_d_mem_0_source        (auto_asource_out_d_mem_0_source),
    .auto_out_d_mem_0_data          (auto_asource_out_d_mem_0_data),
    .auto_out_d_ridx                (auto_asource_out_d_ridx),
    .auto_out_d_widx                (auto_asource_out_d_widx),
    .auto_out_d_safe_ridx_valid     (auto_asource_out_d_safe_ridx_valid),
    .auto_out_d_safe_widx_valid     (auto_asource_out_d_safe_widx_valid),
    .auto_out_d_safe_source_reset_n (auto_asource_out_d_safe_source_reset_n),
    .auto_out_d_safe_sink_reset_n   (auto_asource_out_d_safe_sink_reset_n)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0 dmactiveAck_dmactiveAckSync (
    .clock (io_dmi_clock),
    .reset (io_dmi_reset),
    .io_d  (io_ctrl_dmactiveAck),
    .io_q  (_dmactiveAck_dmactiveAckSync_io_q)
  );
  AsyncQueueSource_1 io_innerCtrl_source (
    .clock                        (io_dmi_clock),
    .reset                        (io_dmi_reset),
    .io_enq_ready                 (_io_innerCtrl_source_io_enq_ready),
    .io_enq_valid                 (_dmOuter_io_innerCtrl_valid),
    .io_enq_bits_resumereq        (_dmOuter_io_innerCtrl_bits_resumereq),
    .io_enq_bits_hartsel          (_dmOuter_io_innerCtrl_bits_hartsel),
    .io_enq_bits_ackhavereset     (_dmOuter_io_innerCtrl_bits_ackhavereset),
    .io_enq_bits_hrmask_0         (_dmOuter_io_innerCtrl_bits_hrmask_0),
    .io_async_mem_0_resumereq     (io_innerCtrl_mem_0_resumereq),
    .io_async_mem_0_hartsel       (io_innerCtrl_mem_0_hartsel),
    .io_async_mem_0_ackhavereset  (io_innerCtrl_mem_0_ackhavereset),
    .io_async_mem_0_hrmask_0      (io_innerCtrl_mem_0_hrmask_0),
    .io_async_ridx                (io_innerCtrl_ridx),
    .io_async_widx                (io_innerCtrl_widx),
    .io_async_safe_ridx_valid     (io_innerCtrl_safe_ridx_valid),
    .io_async_safe_widx_valid     (io_innerCtrl_safe_widx_valid),
    .io_async_safe_source_reset_n (io_innerCtrl_safe_source_reset_n),
    .io_async_safe_sink_reset_n   (io_innerCtrl_safe_sink_reset_n)
  );
  assign io_ctrl_dmactive = _dmOuter_io_ctrl_dmactive;
endmodule

