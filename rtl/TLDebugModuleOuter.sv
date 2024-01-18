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
  output        auto_int_out_1_0,
                auto_int_out_0_0,
                io_ctrl_dmactive,
  input         io_ctrl_dmactiveAck,
                io_innerCtrl_ready,
  output        io_innerCtrl_valid,
                io_innerCtrl_bits_resumereq,
  output [9:0]  io_innerCtrl_bits_hartsel,
  output        io_innerCtrl_bits_ackhavereset,
                io_innerCtrl_bits_hasel,
                io_innerCtrl_bits_hamask_0,
                io_innerCtrl_bits_hamask_1,
                io_innerCtrl_bits_hrmask_0,
                io_innerCtrl_bits_hrmask_1,
  input         io_hgDebugInt_0,
                io_hgDebugInt_1
);

  wire        _io_innerCtrl_bits_hasel_output;
  wire [9:0]  _io_innerCtrl_bits_hartsel_output;
  wire        out_woready_13;
  wire        out_woready_12;
  wire        DMCONTROLWrData_setresethaltreq;
  wire        DMCONTROLWrData_clrresethaltreq;
  reg         DMCONTROLReg_haltreq;
  reg         DMCONTROLReg_hasel;
  reg  [9:0]  DMCONTROLReg_hartsello;
  reg         DMCONTROLReg_ndmreset;
  reg         DMCONTROLReg_dmactive;
  reg  [14:0] HAWINDOWSELReg_hawindowsel;
  reg  [31:0] HAMASKReg_maskdata;
  wire        _GEN = HAWINDOWSELReg_hawindowsel == 15'h0;
  wire        _GEN_0 = out_woready_13 & _GEN;
  wire        hamask_0 = _GEN_0 ? auto_dmi_in_a_bits_data[0] : HAMASKReg_maskdata[0];
  wire        hamask_1 = _GEN_0 ? auto_dmi_in_a_bits_data[1] : HAMASKReg_maskdata[1];
  reg         hrmaskReg_0;
  reg         hrmaskReg_1;
  wire        _GEN_1 = out_woready_12 & DMCONTROLWrData_clrresethaltreq;
  wire        _GEN_2 = _io_innerCtrl_bits_hartsel_output == 10'h0 | _io_innerCtrl_bits_hasel_output & hamask_0;
  wire        _GEN_3 = out_woready_12 & DMCONTROLWrData_setresethaltreq;
  wire        hrmaskNxt_0 = ~(~DMCONTROLReg_dmactive | _GEN_1 & _GEN_2) & (_GEN_3 & _GEN_2 | hrmaskReg_0);
  wire        _GEN_4 = _io_innerCtrl_bits_hartsel_output == 10'h1 | _io_innerCtrl_bits_hasel_output & hamask_1;
  wire        hrmaskNxt_1 = ~(~DMCONTROLReg_dmactive | _GEN_1 & _GEN_4) & (_GEN_3 & _GEN_4 | hrmaskReg_1);
  wire        out_front_bits_read = auto_dmi_in_a_bits_opcode == 3'h4;
  assign DMCONTROLWrData_clrresethaltreq = auto_dmi_in_a_bits_data[2];
  assign DMCONTROLWrData_setresethaltreq = auto_dmi_in_a_bits_data[3];
  wire        _out_wofireMux_T_2 = auto_dmi_in_a_valid & auto_dmi_in_d_ready & ~out_front_bits_read;
  assign out_woready_12 = _out_wofireMux_T_2 & auto_dmi_in_a_bits_address[4:3] == 2'h0 & ~(auto_dmi_in_a_bits_address[2]);
  assign out_woready_13 = _out_wofireMux_T_2 & auto_dmi_in_a_bits_address[4:3] == 2'h2 & auto_dmi_in_a_bits_address[2];
  reg         casez_tmp;
  always @(*) begin
    casez (auto_dmi_in_a_bits_address[4:3])
      2'b00:
        casez_tmp = ~(auto_dmi_in_a_bits_address[2]);
      2'b01:
        casez_tmp = ~(auto_dmi_in_a_bits_address[2]);
      2'b10:
        casez_tmp = auto_dmi_in_a_bits_address[2];
      default:
        casez_tmp = 1'h1;
    endcase
  end // always @(*)
  reg  [31:0] casez_tmp_0;
  always @(*) begin
    casez (auto_dmi_in_a_bits_address[4:3])
      2'b00:
        casez_tmp_0 = {DMCONTROLReg_haltreq, 4'h0, DMCONTROLReg_hasel, 9'h0, DMCONTROLReg_hartsello[0], 14'h0, DMCONTROLReg_ndmreset, DMCONTROLReg_dmactive & io_ctrl_dmactiveAck};
      2'b01:
        casez_tmp_0 = 32'h118380;
      2'b10:
        casez_tmp_0 = {30'h0, _GEN ? HAMASKReg_maskdata[1:0] : 2'h0};
      default:
        casez_tmp_0 = 32'h0;
    endcase
  end // always @(*)
  wire [2:0]  dmiNodeIn_d_bits_opcode = {2'h0, out_front_bits_read};
  reg         debugIntRegs_0;
  reg         debugIntRegs_1;
  reg         innerCtrlValidReg;
  reg         innerCtrlResumeReqReg;
  reg         innerCtrlAckHaveResetReg;
  wire        _io_innerCtrl_valid_output = out_woready_12 | out_woready_13 | innerCtrlValidReg;
  assign _io_innerCtrl_bits_hartsel_output = out_woready_12 ? {9'h0, auto_dmi_in_a_bits_data[16]} : DMCONTROLReg_hartsello;
  wire        _io_innerCtrl_bits_resumereq_output = out_woready_12 & auto_dmi_in_a_bits_data[30] | innerCtrlResumeReqReg;
  wire        _io_innerCtrl_bits_ackhavereset_output = out_woready_12 & auto_dmi_in_a_bits_data[28] | innerCtrlAckHaveResetReg;
  assign _io_innerCtrl_bits_hasel_output = out_woready_12 ? auto_dmi_in_a_bits_data[26] : DMCONTROLReg_hasel;
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      DMCONTROLReg_haltreq <= 1'h0;
      DMCONTROLReg_hasel <= 1'h0;
      DMCONTROLReg_hartsello <= 10'h0;
      DMCONTROLReg_ndmreset <= 1'h0;
      DMCONTROLReg_dmactive <= 1'h0;
      HAWINDOWSELReg_hawindowsel <= 15'h0;
      HAMASKReg_maskdata <= 32'h0;
      hrmaskReg_0 <= 1'h0;
      hrmaskReg_1 <= 1'h0;
      debugIntRegs_0 <= 1'h0;
      debugIntRegs_1 <= 1'h0;
      innerCtrlValidReg <= 1'h0;
      innerCtrlResumeReqReg <= 1'h0;
      innerCtrlAckHaveResetReg <= 1'h0;
    end
    else begin
      DMCONTROLReg_haltreq <= DMCONTROLReg_dmactive & (out_woready_12 ? auto_dmi_in_a_bits_data[31] : DMCONTROLReg_haltreq);
      DMCONTROLReg_hasel <= DMCONTROLReg_dmactive & (out_woready_12 ? auto_dmi_in_a_bits_data[26] : DMCONTROLReg_hasel);
      if (DMCONTROLReg_dmactive) begin
        if (out_woready_12)
          DMCONTROLReg_hartsello <= {9'h0, auto_dmi_in_a_bits_data[16]};
      end
      else
        DMCONTROLReg_hartsello <= 10'h0;
      DMCONTROLReg_ndmreset <= DMCONTROLReg_dmactive & (out_woready_12 ? auto_dmi_in_a_bits_data[1] : DMCONTROLReg_ndmreset);
      if (out_woready_12)
        DMCONTROLReg_dmactive <= auto_dmi_in_a_bits_data[0];
      if (DMCONTROLReg_dmactive) begin
        if (_GEN_0)
          HAMASKReg_maskdata <= {30'h0, auto_dmi_in_a_bits_data[1:0]};
      end
      else begin
        HAWINDOWSELReg_hawindowsel <= 15'h0;
        HAMASKReg_maskdata <= 32'h0;
      end
      hrmaskReg_0 <= hrmaskNxt_0;
      hrmaskReg_1 <= hrmaskNxt_1;
      debugIntRegs_0 <= DMCONTROLReg_dmactive & (out_woready_12 & (~(auto_dmi_in_a_bits_data[16]) | auto_dmi_in_a_bits_data[26] & hamask_0) ? auto_dmi_in_a_bits_data[31] : debugIntRegs_0);
      debugIntRegs_1 <= DMCONTROLReg_dmactive & (out_woready_12 & (auto_dmi_in_a_bits_data[16] | auto_dmi_in_a_bits_data[26] & hamask_1) ? auto_dmi_in_a_bits_data[31] : debugIntRegs_1);
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
        DMCONTROLReg_hasel = 1'h0;
        DMCONTROLReg_hartsello = 10'h0;
        DMCONTROLReg_ndmreset = 1'h0;
        DMCONTROLReg_dmactive = 1'h0;
        HAWINDOWSELReg_hawindowsel = 15'h0;
        HAMASKReg_maskdata = 32'h0;
        hrmaskReg_0 = 1'h0;
        hrmaskReg_1 = 1'h0;
        debugIntRegs_0 = 1'h0;
        debugIntRegs_1 = 1'h0;
        innerCtrlValidReg = 1'h0;
        innerCtrlResumeReqReg = 1'h0;
        innerCtrlAckHaveResetReg = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  TLMonitor_55 monitor (
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
  assign auto_dmi_in_d_bits_data = casez_tmp ? casez_tmp_0 : 32'h0;
  assign auto_int_out_1_0 = debugIntRegs_1 | io_hgDebugInt_1;
  assign auto_int_out_0_0 = debugIntRegs_0 | io_hgDebugInt_0;
  assign io_ctrl_dmactive = DMCONTROLReg_dmactive;
  assign io_innerCtrl_valid = _io_innerCtrl_valid_output;
  assign io_innerCtrl_bits_resumereq = _io_innerCtrl_bits_resumereq_output;
  assign io_innerCtrl_bits_hartsel = _io_innerCtrl_bits_hartsel_output;
  assign io_innerCtrl_bits_ackhavereset = _io_innerCtrl_bits_ackhavereset_output;
  assign io_innerCtrl_bits_hasel = _io_innerCtrl_bits_hasel_output;
  assign io_innerCtrl_bits_hamask_0 = hamask_0;
  assign io_innerCtrl_bits_hamask_1 = hamask_1;
  assign io_innerCtrl_bits_hrmask_0 = hrmaskNxt_0;
  assign io_innerCtrl_bits_hrmask_1 = hrmaskNxt_1;
endmodule

