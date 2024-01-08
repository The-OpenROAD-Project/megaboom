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

module TLDebugModuleOuter(
  input         clock,
                reset,
  output        auto_dmi_in_a_ready,
  input         auto_dmi_in_a_valid,
  input  [2:0]  auto_dmi_in_a_bits_opcode,
  input  [6:0]  auto_dmi_in_a_bits_address,
  input  [31:0] auto_dmi_in_a_bits_data,
  input         auto_dmi_in_d_ready,
  output        auto_dmi_in_d_valid,
  output [2:0]  auto_dmi_in_d_bits_opcode,
  output [31:0] auto_dmi_in_d_bits_data,
  output        auto_int_out_0,
                io_ctrl_dmactive,
  input         io_ctrl_dmactiveAck,
                io_innerCtrl_ready,
  output        io_innerCtrl_valid,
                io_innerCtrl_bits_resumereq,
  output [9:0]  io_innerCtrl_bits_hartsel,
  output        io_innerCtrl_bits_ackhavereset,
                io_innerCtrl_bits_hrmask_0,
  input         io_hgDebugInt_0
);

  wire       out_woready_12;
  wire       DMCONTROLWrData_setresethaltreq;
  wire       DMCONTROLWrData_clrresethaltreq;
  reg        DMCONTROLReg_haltreq;
  reg  [9:0] DMCONTROLReg_hartsello;
  reg        DMCONTROLReg_ndmreset;
  reg        DMCONTROLReg_dmactive;
  reg        hrmaskReg_0;
  wire       _GEN = DMCONTROLReg_hartsello == 10'h0;
  wire       hrmaskNxt_0 = ~(~DMCONTROLReg_dmactive | out_woready_12 & DMCONTROLWrData_clrresethaltreq & _GEN) & (out_woready_12 & DMCONTROLWrData_setresethaltreq & _GEN | hrmaskReg_0);
  wire       out_front_bits_read = auto_dmi_in_a_bits_opcode == 3'h4;
  wire       _out_out_bits_data_WIRE_1 = {auto_dmi_in_a_bits_address[4], auto_dmi_in_a_bits_address[2]} == 2'h0;
  assign DMCONTROLWrData_clrresethaltreq = auto_dmi_in_a_bits_data[2];
  assign DMCONTROLWrData_setresethaltreq = auto_dmi_in_a_bits_data[3];
  assign out_woready_12 = auto_dmi_in_a_valid & auto_dmi_in_d_ready & ~out_front_bits_read & ~(auto_dmi_in_a_bits_address[3]) & _out_out_bits_data_WIRE_1;
  wire [2:0] dmiNodeIn_d_bits_opcode = {2'h0, out_front_bits_read};
  reg        debugIntRegs_0;
  reg        innerCtrlValidReg;
  reg        innerCtrlResumeReqReg;
  reg        innerCtrlAckHaveResetReg;
  wire       _io_innerCtrl_valid_output = out_woready_12 | innerCtrlValidReg;
  wire       _io_innerCtrl_bits_resumereq_output = out_woready_12 & auto_dmi_in_a_bits_data[30] | innerCtrlResumeReqReg;
  wire       _io_innerCtrl_bits_ackhavereset_output = out_woready_12 & auto_dmi_in_a_bits_data[28] | innerCtrlAckHaveResetReg;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      DMCONTROLReg_haltreq <= 1'h0;
      DMCONTROLReg_hartsello <= 10'h0;
      DMCONTROLReg_ndmreset <= 1'h0;
      DMCONTROLReg_dmactive <= 1'h0;
      hrmaskReg_0 <= 1'h0;
      debugIntRegs_0 <= 1'h0;
      innerCtrlValidReg <= 1'h0;
      innerCtrlResumeReqReg <= 1'h0;
      innerCtrlAckHaveResetReg <= 1'h0;
    end
    else begin
      DMCONTROLReg_haltreq <= DMCONTROLReg_dmactive & (out_woready_12 ? auto_dmi_in_a_bits_data[31] : DMCONTROLReg_haltreq);
      if (DMCONTROLReg_dmactive) begin
      end
      else
        DMCONTROLReg_hartsello <= 10'h0;
      DMCONTROLReg_ndmreset <= DMCONTROLReg_dmactive & (out_woready_12 ? auto_dmi_in_a_bits_data[1] : DMCONTROLReg_ndmreset);
      if (out_woready_12)
        DMCONTROLReg_dmactive <= auto_dmi_in_a_bits_data[0];
      hrmaskReg_0 <= hrmaskNxt_0;
      debugIntRegs_0 <= DMCONTROLReg_dmactive & (out_woready_12 ? auto_dmi_in_a_bits_data[31] : debugIntRegs_0);
      innerCtrlValidReg <= _io_innerCtrl_valid_output & ~io_innerCtrl_ready;
      innerCtrlResumeReqReg <= _io_innerCtrl_bits_resumereq_output & ~io_innerCtrl_ready;
      innerCtrlAckHaveResetReg <= _io_innerCtrl_bits_ackhavereset_output & ~io_innerCtrl_ready;
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      if (reset) begin
        DMCONTROLReg_haltreq = 1'h0;
        DMCONTROLReg_hartsello = 10'h0;
        DMCONTROLReg_ndmreset = 1'h0;
        DMCONTROLReg_dmactive = 1'h0;
        hrmaskReg_0 = 1'h0;
        debugIntRegs_0 = 1'h0;
        innerCtrlValidReg = 1'h0;
        innerCtrlResumeReqReg = 1'h0;
        innerCtrlAckHaveResetReg = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  TLMonitor_48 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (auto_dmi_in_d_ready),
    .io_in_a_valid        (auto_dmi_in_a_valid),
    .io_in_a_bits_opcode  (auto_dmi_in_a_bits_opcode),
    .io_in_a_bits_address (auto_dmi_in_a_bits_address),
    .io_in_d_ready        (auto_dmi_in_d_ready),
    .io_in_d_valid        (auto_dmi_in_a_valid),
    .io_in_d_bits_opcode  (dmiNodeIn_d_bits_opcode)
  );
  assign auto_dmi_in_a_ready = auto_dmi_in_d_ready;
  assign auto_dmi_in_d_valid = auto_dmi_in_a_valid;
  assign auto_dmi_in_d_bits_opcode = dmiNodeIn_d_bits_opcode;
  assign auto_dmi_in_d_bits_data = _out_out_bits_data_WIRE_1 ? (auto_dmi_in_a_bits_address[3] ? 32'h118380 : {DMCONTROLReg_haltreq, 29'h0, DMCONTROLReg_ndmreset, DMCONTROLReg_dmactive & io_ctrl_dmactiveAck}) : 32'h0;
  assign auto_int_out_0 = debugIntRegs_0 | io_hgDebugInt_0;
  assign io_ctrl_dmactive = DMCONTROLReg_dmactive;
  assign io_innerCtrl_valid = _io_innerCtrl_valid_output;
  assign io_innerCtrl_bits_resumereq = _io_innerCtrl_bits_resumereq_output;
  assign io_innerCtrl_bits_hartsel = DMCONTROLReg_hartsello;
  assign io_innerCtrl_bits_ackhavereset = _io_innerCtrl_bits_ackhavereset_output;
  assign io_innerCtrl_bits_hrmask_0 = hrmaskNxt_0;
endmodule

