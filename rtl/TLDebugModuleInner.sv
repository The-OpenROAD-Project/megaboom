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

module TLDebugModuleInner(
  input         clock,
                reset,
  output        auto_tl_in_a_ready,
  input         auto_tl_in_a_valid,
  input  [2:0]  auto_tl_in_a_bits_opcode,
                auto_tl_in_a_bits_param,
  input  [1:0]  auto_tl_in_a_bits_size,
  input  [9:0]  auto_tl_in_a_bits_source,
  input  [11:0] auto_tl_in_a_bits_address,
  input  [7:0]  auto_tl_in_a_bits_mask,
  input  [63:0] auto_tl_in_a_bits_data,
  input         auto_tl_in_a_bits_corrupt,
                auto_tl_in_d_ready,
  output        auto_tl_in_d_valid,
  output [2:0]  auto_tl_in_d_bits_opcode,
  output [1:0]  auto_tl_in_d_bits_size,
  output [9:0]  auto_tl_in_d_bits_source,
  output [63:0] auto_tl_in_d_bits_data,
  output        auto_dmi_in_a_ready,
  input         auto_dmi_in_a_valid,
  input  [2:0]  auto_dmi_in_a_bits_opcode,
                auto_dmi_in_a_bits_param,
  input  [1:0]  auto_dmi_in_a_bits_size,
  input         auto_dmi_in_a_bits_source,
  input  [8:0]  auto_dmi_in_a_bits_address,
  input  [3:0]  auto_dmi_in_a_bits_mask,
  input  [31:0] auto_dmi_in_a_bits_data,
  input         auto_dmi_in_a_bits_corrupt,
                auto_dmi_in_d_ready,
  output        auto_dmi_in_d_valid,
  output [2:0]  auto_dmi_in_d_bits_opcode,
  output [1:0]  auto_dmi_in_d_bits_size,
  output        auto_dmi_in_d_bits_source,
  output [31:0] auto_dmi_in_d_bits_data,
  input         io_dmactive,
                io_innerCtrl_valid,
                io_innerCtrl_bits_resumereq,
  input  [9:0]  io_innerCtrl_bits_hartsel,
  input         io_innerCtrl_bits_ackhavereset,
                io_innerCtrl_bits_hrmask_0,
  output        io_hgDebugInt_0,
  input         io_hartIsInReset_0
);

  wire        abstractCommandBusy;
  wire        out_woready_1_353;
  wire        out_woready_1_536;
  wire        out_woready_39;
  wire        out_woready_11;
  wire        out_woready_62;
  wire        out_woready_101;
  wire        out_woready_117;
  wire        out_woready_43;
  wire        out_woready_23;
  wire        out_woready_121;
  wire        out_woready_109;
  wire        out_woready_54;
  wire        out_woready_50;
  wire        out_woready_126;
  wire        out_woready_27;
  wire        out_woready_90;
  wire        out_woready_58;
  wire        out_woready_86;
  wire        out_woready_46;
  wire        out_woready_113;
  wire        out_woready_7;
  wire        out_woready_19;
  wire        out_woready_31;
  wire        out_woready_105;
  wire        out_woready_15;
  wire        out_woready_3;
  wire        out_woready_35;
  wire        _out_wofireMux_T_2;
  wire        out_roready_39;
  wire        out_roready_11;
  wire        out_roready_62;
  wire        out_roready_101;
  wire        out_roready_117;
  wire        out_roready_43;
  wire        out_roready_23;
  wire        out_roready_121;
  wire        out_roready_109;
  wire        out_roready_54;
  wire        out_roready_50;
  wire        out_roready_126;
  wire        out_roready_27;
  wire        out_roready_90;
  wire        out_roready_58;
  wire        out_roready_86;
  wire        out_roready_113;
  wire        out_roready_7;
  wire        out_roready_19;
  wire        out_roready_31;
  wire        out_roready_105;
  wire        out_roready_15;
  wire        out_roready_3;
  wire        out_roready_35;
  wire        out_backSel_23;
  wire        out_backSel_22;
  wire        _hartIsInResetSync_0_debug_hartReset_0_io_q;
  reg         haltedBitRegs;
  reg         resumeReqRegs;
  reg         haveResetBitRegs;
  wire        hamaskWrSel_0 = io_innerCtrl_bits_hartsel == 10'h0;
  reg         hrmaskReg_0;
  reg         hrDebugIntReg_0;
  wire        resumereq = io_innerCtrl_valid & io_innerCtrl_bits_resumereq;
  reg  [2:0]  ABSTRACTCSReg_cmderr;
  reg  [15:0] ABSTRACTAUTOReg_autoexecprogbuf;
  reg  [11:0] ABSTRACTAUTOReg_autoexecdata;
  reg  [7:0]  COMMANDReg_cmdtype;
  reg  [23:0] COMMANDReg_control;
  reg  [7:0]  abstractDataMem_0;
  reg  [7:0]  abstractDataMem_1;
  reg  [7:0]  abstractDataMem_2;
  reg  [7:0]  abstractDataMem_3;
  reg  [7:0]  abstractDataMem_4;
  reg  [7:0]  abstractDataMem_5;
  reg  [7:0]  abstractDataMem_6;
  reg  [7:0]  abstractDataMem_7;
  reg  [7:0]  abstractDataMem_8;
  reg  [7:0]  abstractDataMem_9;
  reg  [7:0]  abstractDataMem_10;
  reg  [7:0]  abstractDataMem_11;
  reg  [7:0]  abstractDataMem_12;
  reg  [7:0]  abstractDataMem_13;
  reg  [7:0]  abstractDataMem_14;
  reg  [7:0]  abstractDataMem_15;
  reg  [7:0]  abstractDataMem_16;
  reg  [7:0]  abstractDataMem_17;
  reg  [7:0]  abstractDataMem_18;
  reg  [7:0]  abstractDataMem_19;
  reg  [7:0]  abstractDataMem_20;
  reg  [7:0]  abstractDataMem_21;
  reg  [7:0]  abstractDataMem_22;
  reg  [7:0]  abstractDataMem_23;
  reg  [7:0]  abstractDataMem_24;
  reg  [7:0]  abstractDataMem_25;
  reg  [7:0]  abstractDataMem_26;
  reg  [7:0]  abstractDataMem_27;
  reg  [7:0]  abstractDataMem_28;
  reg  [7:0]  abstractDataMem_29;
  reg  [7:0]  abstractDataMem_30;
  reg  [7:0]  abstractDataMem_31;
  reg  [7:0]  programBufferMem_0;
  reg  [7:0]  programBufferMem_1;
  reg  [7:0]  programBufferMem_2;
  reg  [7:0]  programBufferMem_3;
  reg  [7:0]  programBufferMem_4;
  reg  [7:0]  programBufferMem_5;
  reg  [7:0]  programBufferMem_6;
  reg  [7:0]  programBufferMem_7;
  reg  [7:0]  programBufferMem_8;
  reg  [7:0]  programBufferMem_9;
  reg  [7:0]  programBufferMem_10;
  reg  [7:0]  programBufferMem_11;
  reg  [7:0]  programBufferMem_12;
  reg  [7:0]  programBufferMem_13;
  reg  [7:0]  programBufferMem_14;
  reg  [7:0]  programBufferMem_15;
  reg  [7:0]  programBufferMem_16;
  reg  [7:0]  programBufferMem_17;
  reg  [7:0]  programBufferMem_18;
  reg  [7:0]  programBufferMem_19;
  reg  [7:0]  programBufferMem_20;
  reg  [7:0]  programBufferMem_21;
  reg  [7:0]  programBufferMem_22;
  reg  [7:0]  programBufferMem_23;
  reg  [7:0]  programBufferMem_24;
  reg  [7:0]  programBufferMem_25;
  reg  [7:0]  programBufferMem_26;
  reg  [7:0]  programBufferMem_27;
  reg  [7:0]  programBufferMem_28;
  reg  [7:0]  programBufferMem_29;
  reg  [7:0]  programBufferMem_30;
  reg  [7:0]  programBufferMem_31;
  reg  [7:0]  programBufferMem_32;
  reg  [7:0]  programBufferMem_33;
  reg  [7:0]  programBufferMem_34;
  reg  [7:0]  programBufferMem_35;
  reg  [7:0]  programBufferMem_36;
  reg  [7:0]  programBufferMem_37;
  reg  [7:0]  programBufferMem_38;
  reg  [7:0]  programBufferMem_39;
  reg  [7:0]  programBufferMem_40;
  reg  [7:0]  programBufferMem_41;
  reg  [7:0]  programBufferMem_42;
  reg  [7:0]  programBufferMem_43;
  reg  [7:0]  programBufferMem_44;
  reg  [7:0]  programBufferMem_45;
  reg  [7:0]  programBufferMem_46;
  reg  [7:0]  programBufferMem_47;
  reg  [7:0]  programBufferMem_48;
  reg  [7:0]  programBufferMem_49;
  reg  [7:0]  programBufferMem_50;
  reg  [7:0]  programBufferMem_51;
  reg  [7:0]  programBufferMem_52;
  reg  [7:0]  programBufferMem_53;
  reg  [7:0]  programBufferMem_54;
  reg  [7:0]  programBufferMem_55;
  reg  [7:0]  programBufferMem_56;
  reg  [7:0]  programBufferMem_57;
  reg  [7:0]  programBufferMem_58;
  reg  [7:0]  programBufferMem_59;
  reg  [7:0]  programBufferMem_60;
  reg  [7:0]  programBufferMem_61;
  reg  [7:0]  programBufferMem_62;
  reg  [7:0]  programBufferMem_63;
  wire        out_front_bits_read = auto_dmi_in_a_bits_opcode == 3'h4;
  wire [7:0]  _out_backMask_T_9 = {8{auto_dmi_in_a_bits_mask[2]}};
  wire [7:0]  _out_backMask_T_11 = {8{auto_dmi_in_a_bits_mask[3]}};
  wire        dmiAbstractDataWrEnMaybe_4 = out_woready_3 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataWrEnMaybe_5 = out_woready_3 & auto_dmi_in_a_bits_mask[1];
  wire        dmiAbstractDataWrEnMaybe_6 = out_woready_3 & auto_dmi_in_a_bits_mask[2];
  wire        dmiAbstractDataWrEnMaybe_7 = out_woready_3 & auto_dmi_in_a_bits_mask[3];
  wire        dmiAbstractDataWrEnMaybe_24 = out_woready_7 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataWrEnMaybe_25 = out_woready_7 & auto_dmi_in_a_bits_mask[1];
  wire        dmiAbstractDataWrEnMaybe_26 = out_woready_7 & auto_dmi_in_a_bits_mask[2];
  wire        dmiAbstractDataWrEnMaybe_27 = out_woready_7 & auto_dmi_in_a_bits_mask[3];
  wire        dmiProgramBufferWrEnMaybe_56 = out_woready_11 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_57 = out_woready_11 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_58 = out_woready_11 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_59 = out_woready_11 & auto_dmi_in_a_bits_mask[3];
  wire        dmiAbstractDataWrEnMaybe_8 = out_woready_15 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataWrEnMaybe_9 = out_woready_15 & auto_dmi_in_a_bits_mask[1];
  wire        dmiAbstractDataWrEnMaybe_10 = out_woready_15 & auto_dmi_in_a_bits_mask[2];
  wire        dmiAbstractDataWrEnMaybe_11 = out_woready_15 & auto_dmi_in_a_bits_mask[3];
  wire        dmiAbstractDataWrEnMaybe_20 = out_woready_19 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataWrEnMaybe_21 = out_woready_19 & auto_dmi_in_a_bits_mask[1];
  wire        dmiAbstractDataWrEnMaybe_22 = out_woready_19 & auto_dmi_in_a_bits_mask[2];
  wire        dmiAbstractDataWrEnMaybe_23 = out_woready_19 & auto_dmi_in_a_bits_mask[3];
  wire        dmiProgramBufferWrEnMaybe_36 = out_woready_23 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_37 = out_woready_23 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_38 = out_woready_23 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_39 = out_woready_23 & auto_dmi_in_a_bits_mask[3];
  wire        dmiProgramBufferWrEnMaybe_12 = out_woready_27 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_13 = out_woready_27 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_14 = out_woready_27 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_15 = out_woready_27 & auto_dmi_in_a_bits_mask[3];
  wire        dmiAbstractDataWrEnMaybe_16 = out_woready_31 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataWrEnMaybe_17 = out_woready_31 & auto_dmi_in_a_bits_mask[1];
  wire        dmiAbstractDataWrEnMaybe_18 = out_woready_31 & auto_dmi_in_a_bits_mask[2];
  wire        dmiAbstractDataWrEnMaybe_19 = out_woready_31 & auto_dmi_in_a_bits_mask[3];
  wire        dmiAbstractDataWrEnMaybe_0 = out_woready_35 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataWrEnMaybe_1 = out_woready_35 & auto_dmi_in_a_bits_mask[1];
  wire        dmiAbstractDataWrEnMaybe_2 = out_woready_35 & auto_dmi_in_a_bits_mask[2];
  wire        dmiAbstractDataWrEnMaybe_3 = out_woready_35 & auto_dmi_in_a_bits_mask[3];
  wire        dmiProgramBufferWrEnMaybe_60 = out_woready_39 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_61 = out_woready_39 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_62 = out_woready_39 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_63 = out_woready_39 & auto_dmi_in_a_bits_mask[3];
  wire        dmiProgramBufferWrEnMaybe_40 = out_woready_43 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_41 = out_woready_43 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_42 = out_woready_43 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_43 = out_woready_43 & auto_dmi_in_a_bits_mask[3];
  wire        autoexecdataWrEnMaybe = out_woready_46 & auto_dmi_in_a_bits_mask[0];
  wire        autoexecprogbufWrEnMaybe = out_woready_46 & (&{_out_backMask_T_11, _out_backMask_T_9});
  wire        dmiProgramBufferWrEnMaybe_20 = out_woready_50 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_21 = out_woready_50 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_22 = out_woready_50 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_23 = out_woready_50 & auto_dmi_in_a_bits_mask[3];
  wire        dmiProgramBufferWrEnMaybe_24 = out_woready_54 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_25 = out_woready_54 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_26 = out_woready_54 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_27 = out_woready_54 & auto_dmi_in_a_bits_mask[3];
  wire        dmiProgramBufferWrEnMaybe_4 = out_woready_58 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_5 = out_woready_58 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_6 = out_woready_58 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_7 = out_woready_58 & auto_dmi_in_a_bits_mask[3];
  wire        dmiProgramBufferWrEnMaybe_52 = out_woready_62 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_53 = out_woready_62 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_54 = out_woready_62 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_55 = out_woready_62 & auto_dmi_in_a_bits_mask[3];
  wire        dmiProgramBufferWrEnMaybe_0 = out_woready_86 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_1 = out_woready_86 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_2 = out_woready_86 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_3 = out_woready_86 & auto_dmi_in_a_bits_mask[3];
  wire        dmiProgramBufferWrEnMaybe_8 = out_woready_90 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_9 = out_woready_90 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_10 = out_woready_90 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_11 = out_woready_90 & auto_dmi_in_a_bits_mask[3];
  wire        ABSTRACTCSWrEnMaybe = _out_wofireMux_T_2 & out_backSel_22 & ~(auto_dmi_in_a_bits_address[8]) & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_48 = out_woready_101 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_49 = out_woready_101 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_50 = out_woready_101 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_51 = out_woready_101 & auto_dmi_in_a_bits_mask[3];
  wire        dmiAbstractDataWrEnMaybe_12 = out_woready_105 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataWrEnMaybe_13 = out_woready_105 & auto_dmi_in_a_bits_mask[1];
  wire        dmiAbstractDataWrEnMaybe_14 = out_woready_105 & auto_dmi_in_a_bits_mask[2];
  wire        dmiAbstractDataWrEnMaybe_15 = out_woready_105 & auto_dmi_in_a_bits_mask[3];
  wire        dmiProgramBufferWrEnMaybe_28 = out_woready_109 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_29 = out_woready_109 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_30 = out_woready_109 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_31 = out_woready_109 & auto_dmi_in_a_bits_mask[3];
  wire        dmiAbstractDataWrEnMaybe_28 = out_woready_113 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataWrEnMaybe_29 = out_woready_113 & auto_dmi_in_a_bits_mask[1];
  wire        dmiAbstractDataWrEnMaybe_30 = out_woready_113 & auto_dmi_in_a_bits_mask[2];
  wire        dmiAbstractDataWrEnMaybe_31 = out_woready_113 & auto_dmi_in_a_bits_mask[3];
  wire        dmiProgramBufferWrEnMaybe_44 = out_woready_117 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_45 = out_woready_117 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_46 = out_woready_117 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_47 = out_woready_117 & auto_dmi_in_a_bits_mask[3];
  wire        dmiProgramBufferWrEnMaybe_32 = out_woready_121 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_33 = out_woready_121 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_34 = out_woready_121 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_35 = out_woready_121 & auto_dmi_in_a_bits_mask[3];
  wire        COMMANDWrEnMaybe = _out_wofireMux_T_2 & out_backSel_23 & ~(auto_dmi_in_a_bits_address[8]) & (&{_out_backMask_T_11, _out_backMask_T_9, {8{auto_dmi_in_a_bits_mask[1]}}, {8{auto_dmi_in_a_bits_mask[0]}}});
  wire [31:0] _COMMANDWrData_WIRE_1 = COMMANDWrEnMaybe ? auto_dmi_in_a_bits_data : 32'h0;
  wire        dmiProgramBufferWrEnMaybe_16 = out_woready_126 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferWrEnMaybe_17 = out_woready_126 & auto_dmi_in_a_bits_mask[1];
  wire        dmiProgramBufferWrEnMaybe_18 = out_woready_126 & auto_dmi_in_a_bits_mask[2];
  wire        dmiProgramBufferWrEnMaybe_19 = out_woready_126 & auto_dmi_in_a_bits_mask[3];
  wire        out_backSel_4 = auto_dmi_in_a_bits_address[7:2] == 6'h4;
  wire        out_backSel_5 = auto_dmi_in_a_bits_address[7:2] == 6'h5;
  wire        out_backSel_6 = auto_dmi_in_a_bits_address[7:2] == 6'h6;
  wire        out_backSel_7 = auto_dmi_in_a_bits_address[7:2] == 6'h7;
  wire        out_backSel_8 = auto_dmi_in_a_bits_address[7:2] == 6'h8;
  wire        out_backSel_9 = auto_dmi_in_a_bits_address[7:2] == 6'h9;
  wire        out_backSel_10 = auto_dmi_in_a_bits_address[7:2] == 6'hA;
  wire        out_backSel_11 = auto_dmi_in_a_bits_address[7:2] == 6'hB;
  assign out_backSel_22 = auto_dmi_in_a_bits_address[7:2] == 6'h16;
  assign out_backSel_23 = auto_dmi_in_a_bits_address[7:2] == 6'h17;
  wire        out_backSel_32 = auto_dmi_in_a_bits_address[7:2] == 6'h20;
  wire        out_backSel_33 = auto_dmi_in_a_bits_address[7:2] == 6'h21;
  wire        out_backSel_34 = auto_dmi_in_a_bits_address[7:2] == 6'h22;
  wire        out_backSel_35 = auto_dmi_in_a_bits_address[7:2] == 6'h23;
  wire        out_backSel_36 = auto_dmi_in_a_bits_address[7:2] == 6'h24;
  wire        out_backSel_37 = auto_dmi_in_a_bits_address[7:2] == 6'h25;
  wire        out_backSel_38 = auto_dmi_in_a_bits_address[7:2] == 6'h26;
  wire        out_backSel_39 = auto_dmi_in_a_bits_address[7:2] == 6'h27;
  wire        out_backSel_40 = auto_dmi_in_a_bits_address[7:2] == 6'h28;
  wire        out_backSel_41 = auto_dmi_in_a_bits_address[7:2] == 6'h29;
  wire        out_backSel_42 = auto_dmi_in_a_bits_address[7:2] == 6'h2A;
  wire        out_backSel_43 = auto_dmi_in_a_bits_address[7:2] == 6'h2B;
  wire        out_backSel_44 = auto_dmi_in_a_bits_address[7:2] == 6'h2C;
  wire        out_backSel_45 = auto_dmi_in_a_bits_address[7:2] == 6'h2D;
  wire        out_backSel_46 = auto_dmi_in_a_bits_address[7:2] == 6'h2E;
  wire        out_backSel_47 = auto_dmi_in_a_bits_address[7:2] == 6'h2F;
  wire        _out_wofireMux_T = auto_dmi_in_a_valid & auto_dmi_in_d_ready;
  wire        _out_rofireMux_T_1 = _out_wofireMux_T & out_front_bits_read;
  assign out_roready_35 = _out_rofireMux_T_1 & out_backSel_4 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_3 = _out_rofireMux_T_1 & out_backSel_5 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_15 = _out_rofireMux_T_1 & out_backSel_6 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_105 = _out_rofireMux_T_1 & out_backSel_7 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_31 = _out_rofireMux_T_1 & out_backSel_8 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_19 = _out_rofireMux_T_1 & out_backSel_9 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_7 = _out_rofireMux_T_1 & out_backSel_10 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_113 = _out_rofireMux_T_1 & out_backSel_11 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_86 = _out_rofireMux_T_1 & out_backSel_32 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_58 = _out_rofireMux_T_1 & out_backSel_33 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_90 = _out_rofireMux_T_1 & out_backSel_34 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_27 = _out_rofireMux_T_1 & out_backSel_35 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_126 = _out_rofireMux_T_1 & out_backSel_36 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_50 = _out_rofireMux_T_1 & out_backSel_37 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_54 = _out_rofireMux_T_1 & out_backSel_38 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_109 = _out_rofireMux_T_1 & out_backSel_39 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_121 = _out_rofireMux_T_1 & out_backSel_40 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_23 = _out_rofireMux_T_1 & out_backSel_41 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_43 = _out_rofireMux_T_1 & out_backSel_42 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_117 = _out_rofireMux_T_1 & out_backSel_43 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_101 = _out_rofireMux_T_1 & out_backSel_44 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_62 = _out_rofireMux_T_1 & out_backSel_45 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_11 = _out_rofireMux_T_1 & out_backSel_46 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_39 = _out_rofireMux_T_1 & out_backSel_47 & ~(auto_dmi_in_a_bits_address[8]);
  assign _out_wofireMux_T_2 = _out_wofireMux_T & ~out_front_bits_read;
  assign out_woready_35 = _out_wofireMux_T_2 & out_backSel_4 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_3 = _out_wofireMux_T_2 & out_backSel_5 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_15 = _out_wofireMux_T_2 & out_backSel_6 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_105 = _out_wofireMux_T_2 & out_backSel_7 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_31 = _out_wofireMux_T_2 & out_backSel_8 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_19 = _out_wofireMux_T_2 & out_backSel_9 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_7 = _out_wofireMux_T_2 & out_backSel_10 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_113 = _out_wofireMux_T_2 & out_backSel_11 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_46 = _out_wofireMux_T_2 & auto_dmi_in_a_bits_address[7:2] == 6'h18 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_86 = _out_wofireMux_T_2 & out_backSel_32 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_58 = _out_wofireMux_T_2 & out_backSel_33 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_90 = _out_wofireMux_T_2 & out_backSel_34 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_27 = _out_wofireMux_T_2 & out_backSel_35 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_126 = _out_wofireMux_T_2 & out_backSel_36 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_50 = _out_wofireMux_T_2 & out_backSel_37 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_54 = _out_wofireMux_T_2 & out_backSel_38 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_109 = _out_wofireMux_T_2 & out_backSel_39 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_121 = _out_wofireMux_T_2 & out_backSel_40 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_23 = _out_wofireMux_T_2 & out_backSel_41 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_43 = _out_wofireMux_T_2 & out_backSel_42 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_117 = _out_wofireMux_T_2 & out_backSel_43 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_101 = _out_wofireMux_T_2 & out_backSel_44 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_62 = _out_wofireMux_T_2 & out_backSel_45 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_11 = _out_wofireMux_T_2 & out_backSel_46 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_39 = _out_wofireMux_T_2 & out_backSel_47 & ~(auto_dmi_in_a_bits_address[8]);
  wire        _out_out_bits_data_T_30 = auto_dmi_in_a_bits_address[7:2] == 6'h0;
  wire [2:0]  dmiNodeIn_d_bits_opcode = {2'h0, out_front_bits_read};
  reg         goReg;
  reg  [31:0] abstractGeneratedMem_0;
  reg  [31:0] abstractGeneratedMem_1;
  wire        out_front_1_bits_read = auto_tl_in_a_bits_opcode == 3'h4;
  wire [9:0]  _out_womask_T_663 = {{2{auto_tl_in_a_bits_mask[1]}}, {8{auto_tl_in_a_bits_mask[0]}}};
  wire        hartResumingWrEn = out_woready_1_353 & (&_out_womask_T_663);
  wire [9:0]  _out_womask_T_664 = {{2{auto_tl_in_a_bits_mask[5]}}, {8{auto_tl_in_a_bits_mask[4]}}};
  wire        hartExceptionWrEn = out_woready_1_353 & (&_out_womask_T_664);
  wire        hartHaltedWrEn = out_woready_1_536 & (&_out_womask_T_663);
  wire        hartGoingWrEn = out_woready_1_536 & (&_out_womask_T_664);
  wire        _out_wofireMux_T_262 = auto_tl_in_a_valid & auto_tl_in_d_ready & ~out_front_1_bits_read;
  assign out_woready_1_536 = _out_wofireMux_T_262 & auto_tl_in_a_bits_address[10:3] == 8'h20 & ~(auto_tl_in_a_bits_address[11]);
  assign out_woready_1_353 = _out_wofireMux_T_262 & auto_tl_in_a_bits_address[10:3] == 8'h21 & ~(auto_tl_in_a_bits_address[11]);
  wire        out_woready_1_938 = _out_wofireMux_T_262 & auto_tl_in_a_bits_address[10:3] == 8'h68 & ~(auto_tl_in_a_bits_address[11]);
  wire        out_woready_1_518 = _out_wofireMux_T_262 & auto_tl_in_a_bits_address[10:3] == 8'h69 & ~(auto_tl_in_a_bits_address[11]);
  wire        out_woready_1_199 = _out_wofireMux_T_262 & auto_tl_in_a_bits_address[10:3] == 8'h6A & ~(auto_tl_in_a_bits_address[11]);
  wire        out_woready_1_1098 = _out_wofireMux_T_262 & auto_tl_in_a_bits_address[10:3] == 8'h6B & ~(auto_tl_in_a_bits_address[11]);
  wire        out_woready_1_738 = _out_wofireMux_T_262 & auto_tl_in_a_bits_address[10:3] == 8'h6C & ~(auto_tl_in_a_bits_address[11]);
  wire        out_woready_1_450 = _out_wofireMux_T_262 & auto_tl_in_a_bits_address[10:3] == 8'h6D & ~(auto_tl_in_a_bits_address[11]);
  wire        out_woready_1_119 = _out_wofireMux_T_262 & auto_tl_in_a_bits_address[10:3] == 8'h6E & ~(auto_tl_in_a_bits_address[11]);
  wire        out_woready_1_1170 = _out_wofireMux_T_262 & auto_tl_in_a_bits_address[10:3] == 8'h6F & ~(auto_tl_in_a_bits_address[11]);
  wire        out_woready_1_834 = _out_wofireMux_T_262 & auto_tl_in_a_bits_address[10:3] == 8'h70 & ~(auto_tl_in_a_bits_address[11]);
  wire        out_woready_1_664 = _out_wofireMux_T_262 & auto_tl_in_a_bits_address[10:3] == 8'h71 & ~(auto_tl_in_a_bits_address[11]);
  wire        out_woready_1_986 = _out_wofireMux_T_262 & auto_tl_in_a_bits_address[10:3] == 8'h72 & ~(auto_tl_in_a_bits_address[11]);
  wire        out_woready_1_39 = _out_wofireMux_T_262 & auto_tl_in_a_bits_address[10:3] == 8'h73 & ~(auto_tl_in_a_bits_address[11]);
  reg         casez_tmp;
  always @(*) begin
    casez (auto_tl_in_a_bits_address[10:3])
      8'b00000000:
        casez_tmp = auto_tl_in_a_bits_address[11];
      8'b00000001:
        casez_tmp = auto_tl_in_a_bits_address[11];
      8'b00000010:
        casez_tmp = auto_tl_in_a_bits_address[11];
      8'b00000011:
        casez_tmp = auto_tl_in_a_bits_address[11];
      8'b00000100:
        casez_tmp = auto_tl_in_a_bits_address[11];
      8'b00000101:
        casez_tmp = auto_tl_in_a_bits_address[11];
      8'b00000110:
        casez_tmp = auto_tl_in_a_bits_address[11];
      8'b00000111:
        casez_tmp = auto_tl_in_a_bits_address[11];
      8'b00001000:
        casez_tmp = auto_tl_in_a_bits_address[11];
      8'b00001001:
        casez_tmp = auto_tl_in_a_bits_address[11];
      8'b00001010:
        casez_tmp = auto_tl_in_a_bits_address[11];
      8'b00001011:
        casez_tmp = 1'h1;
      8'b00001100:
        casez_tmp = 1'h1;
      8'b00001101:
        casez_tmp = 1'h1;
      8'b00001110:
        casez_tmp = 1'h1;
      8'b00001111:
        casez_tmp = 1'h1;
      8'b00010000:
        casez_tmp = 1'h1;
      8'b00010001:
        casez_tmp = 1'h1;
      8'b00010010:
        casez_tmp = 1'h1;
      8'b00010011:
        casez_tmp = 1'h1;
      8'b00010100:
        casez_tmp = 1'h1;
      8'b00010101:
        casez_tmp = 1'h1;
      8'b00010110:
        casez_tmp = 1'h1;
      8'b00010111:
        casez_tmp = 1'h1;
      8'b00011000:
        casez_tmp = 1'h1;
      8'b00011001:
        casez_tmp = 1'h1;
      8'b00011010:
        casez_tmp = 1'h1;
      8'b00011011:
        casez_tmp = 1'h1;
      8'b00011100:
        casez_tmp = 1'h1;
      8'b00011101:
        casez_tmp = 1'h1;
      8'b00011110:
        casez_tmp = 1'h1;
      8'b00011111:
        casez_tmp = 1'h1;
      8'b00100000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b00100001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b00100010:
        casez_tmp = 1'h1;
      8'b00100011:
        casez_tmp = 1'h1;
      8'b00100100:
        casez_tmp = 1'h1;
      8'b00100101:
        casez_tmp = 1'h1;
      8'b00100110:
        casez_tmp = 1'h1;
      8'b00100111:
        casez_tmp = 1'h1;
      8'b00101000:
        casez_tmp = 1'h1;
      8'b00101001:
        casez_tmp = 1'h1;
      8'b00101010:
        casez_tmp = 1'h1;
      8'b00101011:
        casez_tmp = 1'h1;
      8'b00101100:
        casez_tmp = 1'h1;
      8'b00101101:
        casez_tmp = 1'h1;
      8'b00101110:
        casez_tmp = 1'h1;
      8'b00101111:
        casez_tmp = 1'h1;
      8'b00110000:
        casez_tmp = 1'h1;
      8'b00110001:
        casez_tmp = 1'h1;
      8'b00110010:
        casez_tmp = 1'h1;
      8'b00110011:
        casez_tmp = 1'h1;
      8'b00110100:
        casez_tmp = 1'h1;
      8'b00110101:
        casez_tmp = 1'h1;
      8'b00110110:
        casez_tmp = 1'h1;
      8'b00110111:
        casez_tmp = 1'h1;
      8'b00111000:
        casez_tmp = 1'h1;
      8'b00111001:
        casez_tmp = 1'h1;
      8'b00111010:
        casez_tmp = 1'h1;
      8'b00111011:
        casez_tmp = 1'h1;
      8'b00111100:
        casez_tmp = 1'h1;
      8'b00111101:
        casez_tmp = 1'h1;
      8'b00111110:
        casez_tmp = 1'h1;
      8'b00111111:
        casez_tmp = 1'h1;
      8'b01000000:
        casez_tmp = 1'h1;
      8'b01000001:
        casez_tmp = 1'h1;
      8'b01000010:
        casez_tmp = 1'h1;
      8'b01000011:
        casez_tmp = 1'h1;
      8'b01000100:
        casez_tmp = 1'h1;
      8'b01000101:
        casez_tmp = 1'h1;
      8'b01000110:
        casez_tmp = 1'h1;
      8'b01000111:
        casez_tmp = 1'h1;
      8'b01001000:
        casez_tmp = 1'h1;
      8'b01001001:
        casez_tmp = 1'h1;
      8'b01001010:
        casez_tmp = 1'h1;
      8'b01001011:
        casez_tmp = 1'h1;
      8'b01001100:
        casez_tmp = 1'h1;
      8'b01001101:
        casez_tmp = 1'h1;
      8'b01001110:
        casez_tmp = 1'h1;
      8'b01001111:
        casez_tmp = 1'h1;
      8'b01010000:
        casez_tmp = 1'h1;
      8'b01010001:
        casez_tmp = 1'h1;
      8'b01010010:
        casez_tmp = 1'h1;
      8'b01010011:
        casez_tmp = 1'h1;
      8'b01010100:
        casez_tmp = 1'h1;
      8'b01010101:
        casez_tmp = 1'h1;
      8'b01010110:
        casez_tmp = 1'h1;
      8'b01010111:
        casez_tmp = 1'h1;
      8'b01011000:
        casez_tmp = 1'h1;
      8'b01011001:
        casez_tmp = 1'h1;
      8'b01011010:
        casez_tmp = 1'h1;
      8'b01011011:
        casez_tmp = 1'h1;
      8'b01011100:
        casez_tmp = 1'h1;
      8'b01011101:
        casez_tmp = 1'h1;
      8'b01011110:
        casez_tmp = 1'h1;
      8'b01011111:
        casez_tmp = 1'h1;
      8'b01100000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b01100001:
        casez_tmp = 1'h1;
      8'b01100010:
        casez_tmp = 1'h1;
      8'b01100011:
        casez_tmp = 1'h1;
      8'b01100100:
        casez_tmp = 1'h1;
      8'b01100101:
        casez_tmp = 1'h1;
      8'b01100110:
        casez_tmp = 1'h1;
      8'b01100111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b01101000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b01101001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b01101010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b01101011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b01101100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b01101101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b01101110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b01101111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b01110000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b01110001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b01110010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b01110011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b01110100:
        casez_tmp = 1'h1;
      8'b01110101:
        casez_tmp = 1'h1;
      8'b01110110:
        casez_tmp = 1'h1;
      8'b01110111:
        casez_tmp = 1'h1;
      8'b01111000:
        casez_tmp = 1'h1;
      8'b01111001:
        casez_tmp = 1'h1;
      8'b01111010:
        casez_tmp = 1'h1;
      8'b01111011:
        casez_tmp = 1'h1;
      8'b01111100:
        casez_tmp = 1'h1;
      8'b01111101:
        casez_tmp = 1'h1;
      8'b01111110:
        casez_tmp = 1'h1;
      8'b01111111:
        casez_tmp = 1'h1;
      8'b10000000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10000001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10000010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10000011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10000100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10000101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10000110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10000111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10001000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10001001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10001010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10001011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10001100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10001101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10001110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10001111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10010000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10010001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10010010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10010011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10010100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10010101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10010110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10010111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10011000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10011001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10011010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10011011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10011100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10011101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10011110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10011111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10100000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10100001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10100010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10100011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10100100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10100101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10100110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10100111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10101000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10101001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10101010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10101011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10101100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10101101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10101110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10101111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10110000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10110001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10110010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10110011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10110100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10110101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10110110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10110111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10111000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10111001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10111010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10111011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10111100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10111101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10111110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b10111111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11000000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11000001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11000010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11000011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11000100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11000101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11000110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11000111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11001000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11001001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11001010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11001011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11001100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11001101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11001110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11001111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11010000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11010001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11010010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11010011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11010100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11010101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11010110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11010111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11011000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11011001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11011010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11011011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11011100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11011101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11011110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11011111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11100000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11100001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11100010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11100011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11100100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11100101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11100110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11100111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11101000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11101001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11101010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11101011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11101100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11101101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11101110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11101111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11110000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11110001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11110010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11110011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11110100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11110101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11110110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11110111:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11111000:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11111001:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11111010:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11111011:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11111100:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11111101:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      8'b11111110:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
      default:
        casez_tmp = ~(auto_tl_in_a_bits_address[11]);
    endcase
  end // always @(*)
  reg  [63:0] casez_tmp_0;
  always @(*) begin
    casez (auto_tl_in_a_bits_address[10:3])
      8'b00000000:
        casez_tmp_0 = 64'h380006F00C0006F;
      8'b00000001:
        casez_tmp_0 = 64'hFF0000F0440006F;
      8'b00000010:
        casez_tmp_0 = 64'hF14024737B241073;
      8'b00000011:
        casez_tmp_0 = 64'h4004440310802023;
      8'b00000100:
        casez_tmp_0 = 64'hFE0408E300347413;
      8'b00000101:
        casez_tmp_0 = 64'h4086300147413;
      8'b00000110:
        casez_tmp_0 = 64'h100022237B202473;
      8'b00000111:
        casez_tmp_0 = 64'hF140247330000067;
      8'b00001000:
        casez_tmp_0 = 64'h7B20247310802423;
      8'b00001001:
        casez_tmp_0 = 64'h100026237B200073;
      8'b00001010:
        casez_tmp_0 = 64'h100073;
      8'b00001011:
        casez_tmp_0 = 64'h0;
      8'b00001100:
        casez_tmp_0 = 64'h0;
      8'b00001101:
        casez_tmp_0 = 64'h0;
      8'b00001110:
        casez_tmp_0 = 64'h0;
      8'b00001111:
        casez_tmp_0 = 64'h0;
      8'b00010000:
        casez_tmp_0 = 64'h0;
      8'b00010001:
        casez_tmp_0 = 64'h0;
      8'b00010010:
        casez_tmp_0 = 64'h0;
      8'b00010011:
        casez_tmp_0 = 64'h0;
      8'b00010100:
        casez_tmp_0 = 64'h0;
      8'b00010101:
        casez_tmp_0 = 64'h0;
      8'b00010110:
        casez_tmp_0 = 64'h0;
      8'b00010111:
        casez_tmp_0 = 64'h0;
      8'b00011000:
        casez_tmp_0 = 64'h0;
      8'b00011001:
        casez_tmp_0 = 64'h0;
      8'b00011010:
        casez_tmp_0 = 64'h0;
      8'b00011011:
        casez_tmp_0 = 64'h0;
      8'b00011100:
        casez_tmp_0 = 64'h0;
      8'b00011101:
        casez_tmp_0 = 64'h0;
      8'b00011110:
        casez_tmp_0 = 64'h0;
      8'b00011111:
        casez_tmp_0 = 64'h0;
      8'b00100000:
        casez_tmp_0 = 64'h0;
      8'b00100001:
        casez_tmp_0 = 64'h0;
      8'b00100010:
        casez_tmp_0 = 64'h0;
      8'b00100011:
        casez_tmp_0 = 64'h0;
      8'b00100100:
        casez_tmp_0 = 64'h0;
      8'b00100101:
        casez_tmp_0 = 64'h0;
      8'b00100110:
        casez_tmp_0 = 64'h0;
      8'b00100111:
        casez_tmp_0 = 64'h0;
      8'b00101000:
        casez_tmp_0 = 64'h0;
      8'b00101001:
        casez_tmp_0 = 64'h0;
      8'b00101010:
        casez_tmp_0 = 64'h0;
      8'b00101011:
        casez_tmp_0 = 64'h0;
      8'b00101100:
        casez_tmp_0 = 64'h0;
      8'b00101101:
        casez_tmp_0 = 64'h0;
      8'b00101110:
        casez_tmp_0 = 64'h0;
      8'b00101111:
        casez_tmp_0 = 64'h0;
      8'b00110000:
        casez_tmp_0 = 64'h0;
      8'b00110001:
        casez_tmp_0 = 64'h0;
      8'b00110010:
        casez_tmp_0 = 64'h0;
      8'b00110011:
        casez_tmp_0 = 64'h0;
      8'b00110100:
        casez_tmp_0 = 64'h0;
      8'b00110101:
        casez_tmp_0 = 64'h0;
      8'b00110110:
        casez_tmp_0 = 64'h0;
      8'b00110111:
        casez_tmp_0 = 64'h0;
      8'b00111000:
        casez_tmp_0 = 64'h0;
      8'b00111001:
        casez_tmp_0 = 64'h0;
      8'b00111010:
        casez_tmp_0 = 64'h0;
      8'b00111011:
        casez_tmp_0 = 64'h0;
      8'b00111100:
        casez_tmp_0 = 64'h0;
      8'b00111101:
        casez_tmp_0 = 64'h0;
      8'b00111110:
        casez_tmp_0 = 64'h0;
      8'b00111111:
        casez_tmp_0 = 64'h0;
      8'b01000000:
        casez_tmp_0 = 64'h0;
      8'b01000001:
        casez_tmp_0 = 64'h0;
      8'b01000010:
        casez_tmp_0 = 64'h0;
      8'b01000011:
        casez_tmp_0 = 64'h0;
      8'b01000100:
        casez_tmp_0 = 64'h0;
      8'b01000101:
        casez_tmp_0 = 64'h0;
      8'b01000110:
        casez_tmp_0 = 64'h0;
      8'b01000111:
        casez_tmp_0 = 64'h0;
      8'b01001000:
        casez_tmp_0 = 64'h0;
      8'b01001001:
        casez_tmp_0 = 64'h0;
      8'b01001010:
        casez_tmp_0 = 64'h0;
      8'b01001011:
        casez_tmp_0 = 64'h0;
      8'b01001100:
        casez_tmp_0 = 64'h0;
      8'b01001101:
        casez_tmp_0 = 64'h0;
      8'b01001110:
        casez_tmp_0 = 64'h0;
      8'b01001111:
        casez_tmp_0 = 64'h0;
      8'b01010000:
        casez_tmp_0 = 64'h0;
      8'b01010001:
        casez_tmp_0 = 64'h0;
      8'b01010010:
        casez_tmp_0 = 64'h0;
      8'b01010011:
        casez_tmp_0 = 64'h0;
      8'b01010100:
        casez_tmp_0 = 64'h0;
      8'b01010101:
        casez_tmp_0 = 64'h0;
      8'b01010110:
        casez_tmp_0 = 64'h0;
      8'b01010111:
        casez_tmp_0 = 64'h0;
      8'b01011000:
        casez_tmp_0 = 64'h0;
      8'b01011001:
        casez_tmp_0 = 64'h0;
      8'b01011010:
        casez_tmp_0 = 64'h0;
      8'b01011011:
        casez_tmp_0 = 64'h0;
      8'b01011100:
        casez_tmp_0 = 64'h0;
      8'b01011101:
        casez_tmp_0 = 64'h0;
      8'b01011110:
        casez_tmp_0 = 64'h0;
      8'b01011111:
        casez_tmp_0 = 64'h0;
      8'b01100000:
        casez_tmp_0 = 64'h380006F;
      8'b01100001:
        casez_tmp_0 = 64'h0;
      8'b01100010:
        casez_tmp_0 = 64'h0;
      8'b01100011:
        casez_tmp_0 = 64'h0;
      8'b01100100:
        casez_tmp_0 = 64'h0;
      8'b01100101:
        casez_tmp_0 = 64'h0;
      8'b01100110:
        casez_tmp_0 = 64'h0;
      8'b01100111:
        casez_tmp_0 = {abstractGeneratedMem_1, abstractGeneratedMem_0};
      8'b01101000:
        casez_tmp_0 = {programBufferMem_7, programBufferMem_6, programBufferMem_5, programBufferMem_4, programBufferMem_3, programBufferMem_2, programBufferMem_1, programBufferMem_0};
      8'b01101001:
        casez_tmp_0 = {programBufferMem_15, programBufferMem_14, programBufferMem_13, programBufferMem_12, programBufferMem_11, programBufferMem_10, programBufferMem_9, programBufferMem_8};
      8'b01101010:
        casez_tmp_0 = {programBufferMem_23, programBufferMem_22, programBufferMem_21, programBufferMem_20, programBufferMem_19, programBufferMem_18, programBufferMem_17, programBufferMem_16};
      8'b01101011:
        casez_tmp_0 = {programBufferMem_31, programBufferMem_30, programBufferMem_29, programBufferMem_28, programBufferMem_27, programBufferMem_26, programBufferMem_25, programBufferMem_24};
      8'b01101100:
        casez_tmp_0 = {programBufferMem_39, programBufferMem_38, programBufferMem_37, programBufferMem_36, programBufferMem_35, programBufferMem_34, programBufferMem_33, programBufferMem_32};
      8'b01101101:
        casez_tmp_0 = {programBufferMem_47, programBufferMem_46, programBufferMem_45, programBufferMem_44, programBufferMem_43, programBufferMem_42, programBufferMem_41, programBufferMem_40};
      8'b01101110:
        casez_tmp_0 = {programBufferMem_55, programBufferMem_54, programBufferMem_53, programBufferMem_52, programBufferMem_51, programBufferMem_50, programBufferMem_49, programBufferMem_48};
      8'b01101111:
        casez_tmp_0 = {programBufferMem_63, programBufferMem_62, programBufferMem_61, programBufferMem_60, programBufferMem_59, programBufferMem_58, programBufferMem_57, programBufferMem_56};
      8'b01110000:
        casez_tmp_0 = {abstractDataMem_7, abstractDataMem_6, abstractDataMem_5, abstractDataMem_4, abstractDataMem_3, abstractDataMem_2, abstractDataMem_1, abstractDataMem_0};
      8'b01110001:
        casez_tmp_0 = {abstractDataMem_15, abstractDataMem_14, abstractDataMem_13, abstractDataMem_12, abstractDataMem_11, abstractDataMem_10, abstractDataMem_9, abstractDataMem_8};
      8'b01110010:
        casez_tmp_0 = {abstractDataMem_23, abstractDataMem_22, abstractDataMem_21, abstractDataMem_20, abstractDataMem_19, abstractDataMem_18, abstractDataMem_17, abstractDataMem_16};
      8'b01110011:
        casez_tmp_0 = {abstractDataMem_31, abstractDataMem_30, abstractDataMem_29, abstractDataMem_28, abstractDataMem_27, abstractDataMem_26, abstractDataMem_25, abstractDataMem_24};
      8'b01110100:
        casez_tmp_0 = 64'h0;
      8'b01110101:
        casez_tmp_0 = 64'h0;
      8'b01110110:
        casez_tmp_0 = 64'h0;
      8'b01110111:
        casez_tmp_0 = 64'h0;
      8'b01111000:
        casez_tmp_0 = 64'h0;
      8'b01111001:
        casez_tmp_0 = 64'h0;
      8'b01111010:
        casez_tmp_0 = 64'h0;
      8'b01111011:
        casez_tmp_0 = 64'h0;
      8'b01111100:
        casez_tmp_0 = 64'h0;
      8'b01111101:
        casez_tmp_0 = 64'h0;
      8'b01111110:
        casez_tmp_0 = 64'h0;
      8'b01111111:
        casez_tmp_0 = 64'h0;
      8'b10000000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10000001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10000010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10000011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10000100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10000101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10000110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10000111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10001000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10001001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10001010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10001011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10001100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10001101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10001110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10001111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10010000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10010001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10010010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10010011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10010100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10010101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10010110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10010111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10011000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10011001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10011010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10011011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10011100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10011101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10011110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10011111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10100000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10100001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10100010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10100011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10100100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10100101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10100110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10100111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10101000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10101001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10101010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10101011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10101100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10101101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10101110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10101111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10110000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10110001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10110010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10110011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10110100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10110101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10110110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10110111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10111000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10111001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10111010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10111011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10111100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10111101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10111110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b10111111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11000000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11000001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11000010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11000011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11000100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11000101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11000110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11000111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11001000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11001001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11001010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11001011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11001100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11001101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11001110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11001111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11010000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11010001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11010010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11010011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11010100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11010101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11010110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11010111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11011000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11011001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11011010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11011011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11011100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11011101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11011110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11011111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11100000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11100001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11100010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11100011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11100100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11100101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11100110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11100111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11101000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11101001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11101010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11101011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11101100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11101101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11101110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11101111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11110000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11110001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11110010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11110011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11110100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11110101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11110110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11110111:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11111000:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11111001:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11111010:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11111011:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11111100:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11111101:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      8'b11111110:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
      default:
        casez_tmp_0 = {6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg, 6'h0, resumeReqRegs, goReg};
    endcase
  end // always @(*)
  wire [2:0]  tlNodeIn_d_bits_opcode = {2'h0, out_front_1_bits_read};
  reg  [1:0]  ctrlStateReg;
  assign abstractCommandBusy = |ctrlStateReg;
  wire        commandRegIsAccessRegister = COMMANDReg_cmdtype == 8'h0;
  wire        _GEN = ~(COMMANDReg_control[17]) | (|(COMMANDReg_control[15:12])) & COMMANDReg_control[15:0] < 16'h1020 & (COMMANDReg_control[22:20] == 3'h2 | COMMANDReg_control[22:20] == 3'h3);
  wire        commandRegIsUnsupported = ~commandRegIsAccessRegister | ~_GEN;
  wire        commandRegBadHaltResume = commandRegIsAccessRegister & _GEN & ~haltedBitRegs;
  wire        _GEN_0 = ctrlStateReg == 2'h1;
  wire        _GEN_1 = commandRegIsUnsupported | commandRegBadHaltResume;
  wire        goAbstract = (|ctrlStateReg) & _GEN_0 & ~_GEN_1;
  wire        _GEN_2 = ctrlStateReg == 2'h2;
  `ifndef SYNTHESIS
    wire _GEN_3 = (|ctrlStateReg) & ~_GEN_0;
    always @(posedge clock) begin
      if (io_dmactive & ~goAbstract & hartGoingWrEn & ~reset & (|(auto_tl_in_a_bits_data[41:32]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Unexpected 'GOING' hart.\n    at Debug.scala:1499 assert(hartGoingId === 0.U, \"Unexpected 'GOING' hart.\")//Chisel3 #540 %%%%x, expected %%%%x\", hartGoingId, 0.U)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_3 & _GEN_2 & hartExceptionWrEn & ~reset & (|(auto_tl_in_a_bits_data[41:32]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Unexpected 'EXCEPTION' hart\n    at Debug.scala:1820 assert(hartExceptionId === 0.U, \"Unexpected 'EXCEPTION' hart\")//Chisel3 #540, %%%%x, expected %%%%x\", hartExceptionId, 0.U)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_3 & ~_GEN_2 & (&ctrlStateReg) & ~reset) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Should not be in custom state unless we need it.\n    at Debug.scala:1825 assert(needCustom.B, \"Should not be in custom state unless we need it.\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_dmactive | ~hartExceptionWrEn | _GEN_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Unexpected EXCEPTION write: should only get it in Debug Module EXEC state\n    at Debug.scala:1838 assert ((!io.dmactive || !hartExceptionWrEn || ctrlStateReg === CtrlState(Exec)),\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        dmiAbstractDataAccessVec_0 = dmiAbstractDataWrEnMaybe_0 | out_roready_35 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataAccessVec_4 = dmiAbstractDataWrEnMaybe_4 | out_roready_3 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataAccessVec_8 = dmiAbstractDataWrEnMaybe_8 | out_roready_15 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataAccessVec_12 = dmiAbstractDataWrEnMaybe_12 | out_roready_105 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataAccessVec_16 = dmiAbstractDataWrEnMaybe_16 | out_roready_31 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataAccessVec_20 = dmiAbstractDataWrEnMaybe_20 | out_roready_19 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataAccessVec_24 = dmiAbstractDataWrEnMaybe_24 | out_roready_7 & auto_dmi_in_a_bits_mask[0];
  wire        dmiAbstractDataAccessVec_28 = dmiAbstractDataWrEnMaybe_28 | out_roready_113 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_0 = dmiProgramBufferWrEnMaybe_0 | out_roready_86 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_4 = dmiProgramBufferWrEnMaybe_4 | out_roready_58 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_8 = dmiProgramBufferWrEnMaybe_8 | out_roready_90 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_12 = dmiProgramBufferWrEnMaybe_12 | out_roready_27 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_16 = dmiProgramBufferWrEnMaybe_16 | out_roready_126 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_20 = dmiProgramBufferWrEnMaybe_20 | out_roready_50 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_24 = dmiProgramBufferWrEnMaybe_24 | out_roready_54 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_28 = dmiProgramBufferWrEnMaybe_28 | out_roready_109 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_32 = dmiProgramBufferWrEnMaybe_32 | out_roready_121 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_36 = dmiProgramBufferWrEnMaybe_36 | out_roready_23 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_40 = dmiProgramBufferWrEnMaybe_40 | out_roready_43 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_44 = dmiProgramBufferWrEnMaybe_44 | out_roready_117 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_48 = dmiProgramBufferWrEnMaybe_48 | out_roready_101 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_52 = dmiProgramBufferWrEnMaybe_52 | out_roready_62 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_56 = dmiProgramBufferWrEnMaybe_56 | out_roready_11 & auto_dmi_in_a_bits_mask[0];
  wire        dmiProgramBufferAccessVec_60 = dmiProgramBufferWrEnMaybe_60 | out_roready_39 & auto_dmi_in_a_bits_mask[0];
  wire        autoexec = dmiAbstractDataAccessVec_0 & ABSTRACTAUTOReg_autoexecdata[0] | dmiAbstractDataAccessVec_4 & ABSTRACTAUTOReg_autoexecdata[1] | dmiAbstractDataAccessVec_8 & ABSTRACTAUTOReg_autoexecdata[2] | dmiAbstractDataAccessVec_12 & ABSTRACTAUTOReg_autoexecdata[3] | dmiAbstractDataAccessVec_16 & ABSTRACTAUTOReg_autoexecdata[4] | dmiAbstractDataAccessVec_20 & ABSTRACTAUTOReg_autoexecdata[5] | dmiAbstractDataAccessVec_24 & ABSTRACTAUTOReg_autoexecdata[6] | dmiAbstractDataAccessVec_28 & ABSTRACTAUTOReg_autoexecdata[7] | dmiProgramBufferAccessVec_0 & ABSTRACTAUTOReg_autoexecprogbuf[0] | dmiProgramBufferAccessVec_4 & ABSTRACTAUTOReg_autoexecprogbuf[1] | dmiProgramBufferAccessVec_8 & ABSTRACTAUTOReg_autoexecprogbuf[2] | dmiProgramBufferAccessVec_12 & ABSTRACTAUTOReg_autoexecprogbuf[3] | dmiProgramBufferAccessVec_16 & ABSTRACTAUTOReg_autoexecprogbuf[4] | dmiProgramBufferAccessVec_20 & ABSTRACTAUTOReg_autoexecprogbuf[5] | dmiProgramBufferAccessVec_24 & ABSTRACTAUTOReg_autoexecprogbuf[6] | dmiProgramBufferAccessVec_28 & ABSTRACTAUTOReg_autoexecprogbuf[7] | dmiProgramBufferAccessVec_32 & ABSTRACTAUTOReg_autoexecprogbuf[8] | dmiProgramBufferAccessVec_36 & ABSTRACTAUTOReg_autoexecprogbuf[9] | dmiProgramBufferAccessVec_40 & ABSTRACTAUTOReg_autoexecprogbuf[10] | dmiProgramBufferAccessVec_44 & ABSTRACTAUTOReg_autoexecprogbuf[11] | dmiProgramBufferAccessVec_48 & ABSTRACTAUTOReg_autoexecprogbuf[12] | dmiProgramBufferAccessVec_52 & ABSTRACTAUTOReg_autoexecprogbuf[13] | dmiProgramBufferAccessVec_56 & ABSTRACTAUTOReg_autoexecprogbuf[14] | dmiProgramBufferAccessVec_60 & ABSTRACTAUTOReg_autoexecprogbuf[15];
  wire        COMMANDWrEn = COMMANDWrEnMaybe & ~(|ctrlStateReg);
  wire        _regAccessRegisterCommand_T_1 = ABSTRACTCSReg_cmderr == 3'h0;
  wire        _GEN_4 = COMMANDWrEn & ~(|(_COMMANDWrData_WIRE_1[31:24])) & _regAccessRegisterCommand_T_1 | autoexec & commandRegIsAccessRegister & _regAccessRegisterCommand_T_1;
  always @(posedge clock) begin
    haltedBitRegs <= io_dmactive & (hartHaltedWrEn | ~hartResumingWrEn & haltedBitRegs) & ~_hartIsInResetSync_0_debug_hartReset_0_io_q;
    resumeReqRegs <= io_dmactive & (resumereq ? (resumeReqRegs | hamaskWrSel_0) & ~_hartIsInResetSync_0_debug_hartReset_0_io_q : ~hartResumingWrEn & resumeReqRegs & ~_hartIsInResetSync_0_debug_hartReset_0_io_q);
    haveResetBitRegs <= io_dmactive & (io_innerCtrl_valid & io_innerCtrl_bits_ackhavereset ? haveResetBitRegs & ~hamaskWrSel_0 | _hartIsInResetSync_0_debug_hartReset_0_io_q : haveResetBitRegs | _hartIsInResetSync_0_debug_hartReset_0_io_q);
    if (io_dmactive) begin
      if (ABSTRACTCSWrEnMaybe & (|ctrlStateReg) | autoexecdataWrEnMaybe & (|ctrlStateReg) | autoexecprogbufWrEnMaybe & (|ctrlStateReg) | COMMANDWrEnMaybe & (|ctrlStateReg)
          | (dmiAbstractDataAccessVec_0 | dmiAbstractDataWrEnMaybe_1 | out_roready_35 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_2 | out_roready_35 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_3 | out_roready_35 & auto_dmi_in_a_bits_mask[3] | dmiAbstractDataAccessVec_4 | dmiAbstractDataWrEnMaybe_5 | out_roready_3 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_6 | out_roready_3 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_7 | out_roready_3 & auto_dmi_in_a_bits_mask[3] | dmiAbstractDataAccessVec_8 | dmiAbstractDataWrEnMaybe_9 | out_roready_15 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_10 | out_roready_15 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_11 | out_roready_15 & auto_dmi_in_a_bits_mask[3] | dmiAbstractDataAccessVec_12 | dmiAbstractDataWrEnMaybe_13 | out_roready_105 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_14 | out_roready_105 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_15 | out_roready_105 & auto_dmi_in_a_bits_mask[3] | dmiAbstractDataAccessVec_16 | dmiAbstractDataWrEnMaybe_17 | out_roready_31 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_18 | out_roready_31 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_19 | out_roready_31 & auto_dmi_in_a_bits_mask[3] | dmiAbstractDataAccessVec_20 | dmiAbstractDataWrEnMaybe_21 | out_roready_19 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_22 | out_roready_19 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_23 | out_roready_19 & auto_dmi_in_a_bits_mask[3] | dmiAbstractDataAccessVec_24 | dmiAbstractDataWrEnMaybe_25 | out_roready_7 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_26 | out_roready_7 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_27 | out_roready_7 & auto_dmi_in_a_bits_mask[3] | dmiAbstractDataAccessVec_28 | dmiAbstractDataWrEnMaybe_29 | out_roready_113 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_30 | out_roready_113 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_31 | out_roready_113
             & auto_dmi_in_a_bits_mask[3]) & (|ctrlStateReg)
          | (dmiProgramBufferAccessVec_0 | dmiProgramBufferWrEnMaybe_1 | out_roready_86 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_2 | out_roready_86 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_3 | out_roready_86 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_4 | dmiProgramBufferWrEnMaybe_5 | out_roready_58 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_6 | out_roready_58 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_7 | out_roready_58 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_8 | dmiProgramBufferWrEnMaybe_9 | out_roready_90 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_10 | out_roready_90 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_11 | out_roready_90 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_12 | dmiProgramBufferWrEnMaybe_13 | out_roready_27 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_14 | out_roready_27 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_15 | out_roready_27 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_16 | dmiProgramBufferWrEnMaybe_17 | out_roready_126 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_18 | out_roready_126 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_19 | out_roready_126 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_20 | dmiProgramBufferWrEnMaybe_21 | out_roready_50 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_22 | out_roready_50 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_23 | out_roready_50 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_24 | dmiProgramBufferWrEnMaybe_25 | out_roready_54 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_26 | out_roready_54 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_27 | out_roready_54 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_28 | dmiProgramBufferWrEnMaybe_29 | out_roready_109 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_30 | out_roready_109 & auto_dmi_in_a_bits_mask[2]
             | dmiProgramBufferWrEnMaybe_31 | out_roready_109 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_32 | dmiProgramBufferWrEnMaybe_33 | out_roready_121 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_34 | out_roready_121 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_35 | out_roready_121 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_36 | dmiProgramBufferWrEnMaybe_37 | out_roready_23 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_38 | out_roready_23 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_39 | out_roready_23 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_40 | dmiProgramBufferWrEnMaybe_41 | out_roready_43 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_42 | out_roready_43 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_43 | out_roready_43 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_44 | dmiProgramBufferWrEnMaybe_45 | out_roready_117 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_46 | out_roready_117 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_47 | out_roready_117 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_48 | dmiProgramBufferWrEnMaybe_49 | out_roready_101 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_50 | out_roready_101 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_51 | out_roready_101 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_52 | dmiProgramBufferWrEnMaybe_53 | out_roready_62 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_54 | out_roready_62 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_55 | out_roready_62 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_56 | dmiProgramBufferWrEnMaybe_57 | out_roready_11 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_58 | out_roready_11 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_59 | out_roready_11 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_60 | dmiProgramBufferWrEnMaybe_61 | out_roready_39 & auto_dmi_in_a_bits_mask[1]
             | dmiProgramBufferWrEnMaybe_62 | out_roready_39 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_63 | out_roready_39 & auto_dmi_in_a_bits_mask[3]) & (|ctrlStateReg))
        ABSTRACTCSReg_cmderr <= 3'h1;
      else if (~(~(|ctrlStateReg) | _GEN_0) & _GEN_2 & hartExceptionWrEn)
        ABSTRACTCSReg_cmderr <= 3'h3;
      else if ((|ctrlStateReg) ? _GEN_0 & commandRegIsUnsupported : ~_GEN_4 & (COMMANDWrEn & (|(_COMMANDWrData_WIRE_1[31:24])) | autoexec & commandRegIsUnsupported))
        ABSTRACTCSReg_cmderr <= 3'h2;
      else if ((|ctrlStateReg) & _GEN_0 & ~commandRegIsUnsupported & commandRegBadHaltResume)
        ABSTRACTCSReg_cmderr <= 3'h4;
      else
        ABSTRACTCSReg_cmderr <= ({3{~(ABSTRACTCSWrEnMaybe & ~(|ctrlStateReg))}} | ~(auto_dmi_in_a_bits_data[10:8])) & ABSTRACTCSReg_cmderr;
      if (autoexecprogbufWrEnMaybe & ~(|ctrlStateReg))
        ABSTRACTAUTOReg_autoexecprogbuf <= auto_dmi_in_a_bits_data[31:16];
      if (autoexecdataWrEnMaybe & ~(|ctrlStateReg))
        ABSTRACTAUTOReg_autoexecdata <= {4'h0, auto_dmi_in_a_bits_data[7:0]};
      if (COMMANDWrEn) begin
        COMMANDReg_cmdtype <= _COMMANDWrData_WIRE_1[31:24];
        COMMANDReg_control <= _COMMANDWrData_WIRE_1[23:0];
      end
      if (out_woready_1_834 & auto_tl_in_a_bits_mask[0])
        abstractDataMem_0 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiAbstractDataWrEnMaybe_0 & ~(|ctrlStateReg))
        abstractDataMem_0 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_834 & auto_tl_in_a_bits_mask[1])
        abstractDataMem_1 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiAbstractDataWrEnMaybe_1 & ~(|ctrlStateReg))
        abstractDataMem_1 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_834 & auto_tl_in_a_bits_mask[2])
        abstractDataMem_2 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiAbstractDataWrEnMaybe_2 & ~(|ctrlStateReg))
        abstractDataMem_2 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_834 & auto_tl_in_a_bits_mask[3])
        abstractDataMem_3 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiAbstractDataWrEnMaybe_3 & ~(|ctrlStateReg))
        abstractDataMem_3 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_834 & auto_tl_in_a_bits_mask[4])
        abstractDataMem_4 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiAbstractDataWrEnMaybe_4 & ~(|ctrlStateReg))
        abstractDataMem_4 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_834 & auto_tl_in_a_bits_mask[5])
        abstractDataMem_5 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiAbstractDataWrEnMaybe_5 & ~(|ctrlStateReg))
        abstractDataMem_5 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_834 & auto_tl_in_a_bits_mask[6])
        abstractDataMem_6 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiAbstractDataWrEnMaybe_6 & ~(|ctrlStateReg))
        abstractDataMem_6 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_834 & auto_tl_in_a_bits_mask[7])
        abstractDataMem_7 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiAbstractDataWrEnMaybe_7 & ~(|ctrlStateReg))
        abstractDataMem_7 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_664 & auto_tl_in_a_bits_mask[0])
        abstractDataMem_8 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiAbstractDataWrEnMaybe_8 & ~(|ctrlStateReg))
        abstractDataMem_8 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_664 & auto_tl_in_a_bits_mask[1])
        abstractDataMem_9 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiAbstractDataWrEnMaybe_9 & ~(|ctrlStateReg))
        abstractDataMem_9 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_664 & auto_tl_in_a_bits_mask[2])
        abstractDataMem_10 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiAbstractDataWrEnMaybe_10 & ~(|ctrlStateReg))
        abstractDataMem_10 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_664 & auto_tl_in_a_bits_mask[3])
        abstractDataMem_11 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiAbstractDataWrEnMaybe_11 & ~(|ctrlStateReg))
        abstractDataMem_11 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_664 & auto_tl_in_a_bits_mask[4])
        abstractDataMem_12 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiAbstractDataWrEnMaybe_12 & ~(|ctrlStateReg))
        abstractDataMem_12 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_664 & auto_tl_in_a_bits_mask[5])
        abstractDataMem_13 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiAbstractDataWrEnMaybe_13 & ~(|ctrlStateReg))
        abstractDataMem_13 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_664 & auto_tl_in_a_bits_mask[6])
        abstractDataMem_14 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiAbstractDataWrEnMaybe_14 & ~(|ctrlStateReg))
        abstractDataMem_14 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_664 & auto_tl_in_a_bits_mask[7])
        abstractDataMem_15 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiAbstractDataWrEnMaybe_15 & ~(|ctrlStateReg))
        abstractDataMem_15 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_986 & auto_tl_in_a_bits_mask[0])
        abstractDataMem_16 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiAbstractDataWrEnMaybe_16 & ~(|ctrlStateReg))
        abstractDataMem_16 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_986 & auto_tl_in_a_bits_mask[1])
        abstractDataMem_17 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiAbstractDataWrEnMaybe_17 & ~(|ctrlStateReg))
        abstractDataMem_17 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_986 & auto_tl_in_a_bits_mask[2])
        abstractDataMem_18 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiAbstractDataWrEnMaybe_18 & ~(|ctrlStateReg))
        abstractDataMem_18 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_986 & auto_tl_in_a_bits_mask[3])
        abstractDataMem_19 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiAbstractDataWrEnMaybe_19 & ~(|ctrlStateReg))
        abstractDataMem_19 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_986 & auto_tl_in_a_bits_mask[4])
        abstractDataMem_20 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiAbstractDataWrEnMaybe_20 & ~(|ctrlStateReg))
        abstractDataMem_20 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_986 & auto_tl_in_a_bits_mask[5])
        abstractDataMem_21 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiAbstractDataWrEnMaybe_21 & ~(|ctrlStateReg))
        abstractDataMem_21 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_986 & auto_tl_in_a_bits_mask[6])
        abstractDataMem_22 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiAbstractDataWrEnMaybe_22 & ~(|ctrlStateReg))
        abstractDataMem_22 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_986 & auto_tl_in_a_bits_mask[7])
        abstractDataMem_23 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiAbstractDataWrEnMaybe_23 & ~(|ctrlStateReg))
        abstractDataMem_23 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[0])
        abstractDataMem_24 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiAbstractDataWrEnMaybe_24 & ~(|ctrlStateReg))
        abstractDataMem_24 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[1])
        abstractDataMem_25 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiAbstractDataWrEnMaybe_25 & ~(|ctrlStateReg))
        abstractDataMem_25 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[2])
        abstractDataMem_26 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiAbstractDataWrEnMaybe_26 & ~(|ctrlStateReg))
        abstractDataMem_26 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[3])
        abstractDataMem_27 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiAbstractDataWrEnMaybe_27 & ~(|ctrlStateReg))
        abstractDataMem_27 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[4])
        abstractDataMem_28 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiAbstractDataWrEnMaybe_28 & ~(|ctrlStateReg))
        abstractDataMem_28 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[5])
        abstractDataMem_29 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiAbstractDataWrEnMaybe_29 & ~(|ctrlStateReg))
        abstractDataMem_29 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[6])
        abstractDataMem_30 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiAbstractDataWrEnMaybe_30 & ~(|ctrlStateReg))
        abstractDataMem_30 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[7])
        abstractDataMem_31 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiAbstractDataWrEnMaybe_31 & ~(|ctrlStateReg))
        abstractDataMem_31 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_938 & auto_tl_in_a_bits_mask[0])
        programBufferMem_0 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_0 & ~(|ctrlStateReg))
        programBufferMem_0 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_938 & auto_tl_in_a_bits_mask[1])
        programBufferMem_1 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_1 & ~(|ctrlStateReg))
        programBufferMem_1 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_938 & auto_tl_in_a_bits_mask[2])
        programBufferMem_2 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_2 & ~(|ctrlStateReg))
        programBufferMem_2 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_938 & auto_tl_in_a_bits_mask[3])
        programBufferMem_3 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_3 & ~(|ctrlStateReg))
        programBufferMem_3 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_938 & auto_tl_in_a_bits_mask[4])
        programBufferMem_4 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_4 & ~(|ctrlStateReg))
        programBufferMem_4 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_938 & auto_tl_in_a_bits_mask[5])
        programBufferMem_5 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_5 & ~(|ctrlStateReg))
        programBufferMem_5 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_938 & auto_tl_in_a_bits_mask[6])
        programBufferMem_6 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_6 & ~(|ctrlStateReg))
        programBufferMem_6 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_938 & auto_tl_in_a_bits_mask[7])
        programBufferMem_7 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_7 & ~(|ctrlStateReg))
        programBufferMem_7 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_518 & auto_tl_in_a_bits_mask[0])
        programBufferMem_8 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_8 & ~(|ctrlStateReg))
        programBufferMem_8 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_518 & auto_tl_in_a_bits_mask[1])
        programBufferMem_9 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_9 & ~(|ctrlStateReg))
        programBufferMem_9 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_518 & auto_tl_in_a_bits_mask[2])
        programBufferMem_10 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_10 & ~(|ctrlStateReg))
        programBufferMem_10 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_518 & auto_tl_in_a_bits_mask[3])
        programBufferMem_11 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_11 & ~(|ctrlStateReg))
        programBufferMem_11 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_518 & auto_tl_in_a_bits_mask[4])
        programBufferMem_12 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_12 & ~(|ctrlStateReg))
        programBufferMem_12 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_518 & auto_tl_in_a_bits_mask[5])
        programBufferMem_13 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_13 & ~(|ctrlStateReg))
        programBufferMem_13 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_518 & auto_tl_in_a_bits_mask[6])
        programBufferMem_14 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_14 & ~(|ctrlStateReg))
        programBufferMem_14 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_518 & auto_tl_in_a_bits_mask[7])
        programBufferMem_15 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_15 & ~(|ctrlStateReg))
        programBufferMem_15 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_199 & auto_tl_in_a_bits_mask[0])
        programBufferMem_16 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_16 & ~(|ctrlStateReg))
        programBufferMem_16 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_199 & auto_tl_in_a_bits_mask[1])
        programBufferMem_17 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_17 & ~(|ctrlStateReg))
        programBufferMem_17 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_199 & auto_tl_in_a_bits_mask[2])
        programBufferMem_18 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_18 & ~(|ctrlStateReg))
        programBufferMem_18 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_199 & auto_tl_in_a_bits_mask[3])
        programBufferMem_19 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_19 & ~(|ctrlStateReg))
        programBufferMem_19 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_199 & auto_tl_in_a_bits_mask[4])
        programBufferMem_20 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_20 & ~(|ctrlStateReg))
        programBufferMem_20 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_199 & auto_tl_in_a_bits_mask[5])
        programBufferMem_21 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_21 & ~(|ctrlStateReg))
        programBufferMem_21 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_199 & auto_tl_in_a_bits_mask[6])
        programBufferMem_22 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_22 & ~(|ctrlStateReg))
        programBufferMem_22 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_199 & auto_tl_in_a_bits_mask[7])
        programBufferMem_23 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_23 & ~(|ctrlStateReg))
        programBufferMem_23 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_1098 & auto_tl_in_a_bits_mask[0])
        programBufferMem_24 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_24 & ~(|ctrlStateReg))
        programBufferMem_24 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_1098 & auto_tl_in_a_bits_mask[1])
        programBufferMem_25 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_25 & ~(|ctrlStateReg))
        programBufferMem_25 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_1098 & auto_tl_in_a_bits_mask[2])
        programBufferMem_26 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_26 & ~(|ctrlStateReg))
        programBufferMem_26 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_1098 & auto_tl_in_a_bits_mask[3])
        programBufferMem_27 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_27 & ~(|ctrlStateReg))
        programBufferMem_27 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_1098 & auto_tl_in_a_bits_mask[4])
        programBufferMem_28 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_28 & ~(|ctrlStateReg))
        programBufferMem_28 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_1098 & auto_tl_in_a_bits_mask[5])
        programBufferMem_29 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_29 & ~(|ctrlStateReg))
        programBufferMem_29 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_1098 & auto_tl_in_a_bits_mask[6])
        programBufferMem_30 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_30 & ~(|ctrlStateReg))
        programBufferMem_30 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_1098 & auto_tl_in_a_bits_mask[7])
        programBufferMem_31 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_31 & ~(|ctrlStateReg))
        programBufferMem_31 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_738 & auto_tl_in_a_bits_mask[0])
        programBufferMem_32 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_32 & ~(|ctrlStateReg))
        programBufferMem_32 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_738 & auto_tl_in_a_bits_mask[1])
        programBufferMem_33 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_33 & ~(|ctrlStateReg))
        programBufferMem_33 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_738 & auto_tl_in_a_bits_mask[2])
        programBufferMem_34 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_34 & ~(|ctrlStateReg))
        programBufferMem_34 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_738 & auto_tl_in_a_bits_mask[3])
        programBufferMem_35 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_35 & ~(|ctrlStateReg))
        programBufferMem_35 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_738 & auto_tl_in_a_bits_mask[4])
        programBufferMem_36 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_36 & ~(|ctrlStateReg))
        programBufferMem_36 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_738 & auto_tl_in_a_bits_mask[5])
        programBufferMem_37 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_37 & ~(|ctrlStateReg))
        programBufferMem_37 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_738 & auto_tl_in_a_bits_mask[6])
        programBufferMem_38 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_38 & ~(|ctrlStateReg))
        programBufferMem_38 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_738 & auto_tl_in_a_bits_mask[7])
        programBufferMem_39 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_39 & ~(|ctrlStateReg))
        programBufferMem_39 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_450 & auto_tl_in_a_bits_mask[0])
        programBufferMem_40 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_40 & ~(|ctrlStateReg))
        programBufferMem_40 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_450 & auto_tl_in_a_bits_mask[1])
        programBufferMem_41 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_41 & ~(|ctrlStateReg))
        programBufferMem_41 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_450 & auto_tl_in_a_bits_mask[2])
        programBufferMem_42 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_42 & ~(|ctrlStateReg))
        programBufferMem_42 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_450 & auto_tl_in_a_bits_mask[3])
        programBufferMem_43 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_43 & ~(|ctrlStateReg))
        programBufferMem_43 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_450 & auto_tl_in_a_bits_mask[4])
        programBufferMem_44 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_44 & ~(|ctrlStateReg))
        programBufferMem_44 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_450 & auto_tl_in_a_bits_mask[5])
        programBufferMem_45 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_45 & ~(|ctrlStateReg))
        programBufferMem_45 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_450 & auto_tl_in_a_bits_mask[6])
        programBufferMem_46 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_46 & ~(|ctrlStateReg))
        programBufferMem_46 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_450 & auto_tl_in_a_bits_mask[7])
        programBufferMem_47 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_47 & ~(|ctrlStateReg))
        programBufferMem_47 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_119 & auto_tl_in_a_bits_mask[0])
        programBufferMem_48 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_48 & ~(|ctrlStateReg))
        programBufferMem_48 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_119 & auto_tl_in_a_bits_mask[1])
        programBufferMem_49 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_49 & ~(|ctrlStateReg))
        programBufferMem_49 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_119 & auto_tl_in_a_bits_mask[2])
        programBufferMem_50 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_50 & ~(|ctrlStateReg))
        programBufferMem_50 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_119 & auto_tl_in_a_bits_mask[3])
        programBufferMem_51 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_51 & ~(|ctrlStateReg))
        programBufferMem_51 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_119 & auto_tl_in_a_bits_mask[4])
        programBufferMem_52 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_52 & ~(|ctrlStateReg))
        programBufferMem_52 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_119 & auto_tl_in_a_bits_mask[5])
        programBufferMem_53 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_53 & ~(|ctrlStateReg))
        programBufferMem_53 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_119 & auto_tl_in_a_bits_mask[6])
        programBufferMem_54 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_54 & ~(|ctrlStateReg))
        programBufferMem_54 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_119 & auto_tl_in_a_bits_mask[7])
        programBufferMem_55 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_55 & ~(|ctrlStateReg))
        programBufferMem_55 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_1170 & auto_tl_in_a_bits_mask[0])
        programBufferMem_56 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_56 & ~(|ctrlStateReg))
        programBufferMem_56 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_1170 & auto_tl_in_a_bits_mask[1])
        programBufferMem_57 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_57 & ~(|ctrlStateReg))
        programBufferMem_57 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_1170 & auto_tl_in_a_bits_mask[2])
        programBufferMem_58 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_58 & ~(|ctrlStateReg))
        programBufferMem_58 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_1170 & auto_tl_in_a_bits_mask[3])
        programBufferMem_59 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_59 & ~(|ctrlStateReg))
        programBufferMem_59 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_1170 & auto_tl_in_a_bits_mask[4])
        programBufferMem_60 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_60 & ~(|ctrlStateReg))
        programBufferMem_60 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_1170 & auto_tl_in_a_bits_mask[5])
        programBufferMem_61 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_61 & ~(|ctrlStateReg))
        programBufferMem_61 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_1170 & auto_tl_in_a_bits_mask[6])
        programBufferMem_62 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_62 & ~(|ctrlStateReg))
        programBufferMem_62 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_1170 & auto_tl_in_a_bits_mask[7])
        programBufferMem_63 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_63 & ~(|ctrlStateReg))
        programBufferMem_63 <= auto_dmi_in_a_bits_data[31:24];
      if (|ctrlStateReg) begin
        if (_GEN_0)
          ctrlStateReg <= {~_GEN_1, 1'h0};
        else if (_GEN_2 & (hartExceptionWrEn | ~goReg & hartHaltedWrEn))
          ctrlStateReg <= 2'h0;
      end
      else if (_GEN_4)
        ctrlStateReg <= 2'h1;
    end
    else begin
      ABSTRACTCSReg_cmderr <= 3'h0;
      ABSTRACTAUTOReg_autoexecprogbuf <= 16'h0;
      ABSTRACTAUTOReg_autoexecdata <= 12'h0;
      COMMANDReg_cmdtype <= 8'h0;
      COMMANDReg_control <= 24'h0;
      abstractDataMem_0 <= 8'h0;
      abstractDataMem_1 <= 8'h0;
      abstractDataMem_2 <= 8'h0;
      abstractDataMem_3 <= 8'h0;
      abstractDataMem_4 <= 8'h0;
      abstractDataMem_5 <= 8'h0;
      abstractDataMem_6 <= 8'h0;
      abstractDataMem_7 <= 8'h0;
      abstractDataMem_8 <= 8'h0;
      abstractDataMem_9 <= 8'h0;
      abstractDataMem_10 <= 8'h0;
      abstractDataMem_11 <= 8'h0;
      abstractDataMem_12 <= 8'h0;
      abstractDataMem_13 <= 8'h0;
      abstractDataMem_14 <= 8'h0;
      abstractDataMem_15 <= 8'h0;
      abstractDataMem_16 <= 8'h0;
      abstractDataMem_17 <= 8'h0;
      abstractDataMem_18 <= 8'h0;
      abstractDataMem_19 <= 8'h0;
      abstractDataMem_20 <= 8'h0;
      abstractDataMem_21 <= 8'h0;
      abstractDataMem_22 <= 8'h0;
      abstractDataMem_23 <= 8'h0;
      abstractDataMem_24 <= 8'h0;
      abstractDataMem_25 <= 8'h0;
      abstractDataMem_26 <= 8'h0;
      abstractDataMem_27 <= 8'h0;
      abstractDataMem_28 <= 8'h0;
      abstractDataMem_29 <= 8'h0;
      abstractDataMem_30 <= 8'h0;
      abstractDataMem_31 <= 8'h0;
      programBufferMem_0 <= 8'h0;
      programBufferMem_1 <= 8'h0;
      programBufferMem_2 <= 8'h0;
      programBufferMem_3 <= 8'h0;
      programBufferMem_4 <= 8'h0;
      programBufferMem_5 <= 8'h0;
      programBufferMem_6 <= 8'h0;
      programBufferMem_7 <= 8'h0;
      programBufferMem_8 <= 8'h0;
      programBufferMem_9 <= 8'h0;
      programBufferMem_10 <= 8'h0;
      programBufferMem_11 <= 8'h0;
      programBufferMem_12 <= 8'h0;
      programBufferMem_13 <= 8'h0;
      programBufferMem_14 <= 8'h0;
      programBufferMem_15 <= 8'h0;
      programBufferMem_16 <= 8'h0;
      programBufferMem_17 <= 8'h0;
      programBufferMem_18 <= 8'h0;
      programBufferMem_19 <= 8'h0;
      programBufferMem_20 <= 8'h0;
      programBufferMem_21 <= 8'h0;
      programBufferMem_22 <= 8'h0;
      programBufferMem_23 <= 8'h0;
      programBufferMem_24 <= 8'h0;
      programBufferMem_25 <= 8'h0;
      programBufferMem_26 <= 8'h0;
      programBufferMem_27 <= 8'h0;
      programBufferMem_28 <= 8'h0;
      programBufferMem_29 <= 8'h0;
      programBufferMem_30 <= 8'h0;
      programBufferMem_31 <= 8'h0;
      programBufferMem_32 <= 8'h0;
      programBufferMem_33 <= 8'h0;
      programBufferMem_34 <= 8'h0;
      programBufferMem_35 <= 8'h0;
      programBufferMem_36 <= 8'h0;
      programBufferMem_37 <= 8'h0;
      programBufferMem_38 <= 8'h0;
      programBufferMem_39 <= 8'h0;
      programBufferMem_40 <= 8'h0;
      programBufferMem_41 <= 8'h0;
      programBufferMem_42 <= 8'h0;
      programBufferMem_43 <= 8'h0;
      programBufferMem_44 <= 8'h0;
      programBufferMem_45 <= 8'h0;
      programBufferMem_46 <= 8'h0;
      programBufferMem_47 <= 8'h0;
      programBufferMem_48 <= 8'h0;
      programBufferMem_49 <= 8'h0;
      programBufferMem_50 <= 8'h0;
      programBufferMem_51 <= 8'h0;
      programBufferMem_52 <= 8'h0;
      programBufferMem_53 <= 8'h0;
      programBufferMem_54 <= 8'h0;
      programBufferMem_55 <= 8'h0;
      programBufferMem_56 <= 8'h0;
      programBufferMem_57 <= 8'h0;
      programBufferMem_58 <= 8'h0;
      programBufferMem_59 <= 8'h0;
      programBufferMem_60 <= 8'h0;
      programBufferMem_61 <= 8'h0;
      programBufferMem_62 <= 8'h0;
      programBufferMem_63 <= 8'h0;
      ctrlStateReg <= 2'h0;
    end
    goReg <= io_dmactive & (goAbstract | ~hartGoingWrEn & goReg);
    if (goAbstract) begin
      abstractGeneratedMem_0 <= COMMANDReg_control[17] ? (COMMANDReg_control[16] ? {17'h7000, COMMANDReg_control[22:20], COMMANDReg_control[4:0], 7'h3} : {7'h1C, COMMANDReg_control[4:0], 5'h0, COMMANDReg_control[22:20], 12'h23}) : 32'h13;
      abstractGeneratedMem_1 <= COMMANDReg_control[18] ? 32'h13 : 32'h100073;
    end
    if (reset)
      hrmaskReg_0 <= 1'h0;
    else
      hrmaskReg_0 <= io_dmactive & (io_innerCtrl_valid ? io_innerCtrl_bits_hrmask_0 : hrmaskReg_0);
  end // always @(posedge)
  always @(posedge clock or posedge reset) begin
    if (reset)
      hrDebugIntReg_0 <= 1'h0;
    else
      hrDebugIntReg_0 <= io_dmactive & hrmaskReg_0 & (_hartIsInResetSync_0_debug_hartReset_0_io_q | hrDebugIntReg_0 & ~haltedBitRegs);
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      if (reset)
        hrDebugIntReg_0 = 1'h0;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  TLMonitor_41 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (auto_dmi_in_d_ready),
    .io_in_a_valid        (auto_dmi_in_a_valid),
    .io_in_a_bits_opcode  (auto_dmi_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_dmi_in_a_bits_param),
    .io_in_a_bits_size    (auto_dmi_in_a_bits_size),
    .io_in_a_bits_source  (auto_dmi_in_a_bits_source),
    .io_in_a_bits_address (auto_dmi_in_a_bits_address),
    .io_in_a_bits_mask    (auto_dmi_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_dmi_in_a_bits_corrupt),
    .io_in_d_ready        (auto_dmi_in_d_ready),
    .io_in_d_valid        (auto_dmi_in_a_valid),
    .io_in_d_bits_opcode  (dmiNodeIn_d_bits_opcode),
    .io_in_d_bits_size    (auto_dmi_in_a_bits_size),
    .io_in_d_bits_source  (auto_dmi_in_a_bits_source)
  );
  TLMonitor_42 monitor_1 (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (auto_tl_in_d_ready),
    .io_in_a_valid        (auto_tl_in_a_valid),
    .io_in_a_bits_opcode  (auto_tl_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_tl_in_a_bits_param),
    .io_in_a_bits_size    (auto_tl_in_a_bits_size),
    .io_in_a_bits_source  (auto_tl_in_a_bits_source),
    .io_in_a_bits_address (auto_tl_in_a_bits_address),
    .io_in_a_bits_mask    (auto_tl_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_tl_in_a_bits_corrupt),
    .io_in_d_ready        (auto_tl_in_d_ready),
    .io_in_d_valid        (auto_tl_in_a_valid),
    .io_in_d_bits_opcode  (tlNodeIn_d_bits_opcode),
    .io_in_d_bits_size    (auto_tl_in_a_bits_size),
    .io_in_d_bits_source  (auto_tl_in_a_bits_source)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0 hartIsInResetSync_0_debug_hartReset_0 (
    .clock (clock),
    .reset (reset),
    .io_d  (io_hartIsInReset_0),
    .io_q  (_hartIsInResetSync_0_debug_hartReset_0_io_q)
  );
  assign auto_tl_in_a_ready = auto_tl_in_d_ready;
  assign auto_tl_in_d_valid = auto_tl_in_a_valid;
  assign auto_tl_in_d_bits_opcode = tlNodeIn_d_bits_opcode;
  assign auto_tl_in_d_bits_size = auto_tl_in_a_bits_size;
  assign auto_tl_in_d_bits_source = auto_tl_in_a_bits_source;
  assign auto_tl_in_d_bits_data = casez_tmp ? casez_tmp_0 : 64'h0;
  assign auto_dmi_in_a_ready = auto_dmi_in_d_ready;
  assign auto_dmi_in_d_valid = auto_dmi_in_a_valid;
  assign auto_dmi_in_d_bits_opcode = dmiNodeIn_d_bits_opcode;
  assign auto_dmi_in_d_bits_size = auto_dmi_in_a_bits_size;
  assign auto_dmi_in_d_bits_source = auto_dmi_in_a_bits_source;
  assign auto_dmi_in_d_bits_data =
    (_out_out_bits_data_T_30 ? auto_dmi_in_a_bits_address[8] : ~(auto_dmi_in_a_bits_address[7:2] == 6'h4 | auto_dmi_in_a_bits_address[7:2] == 6'h5 | auto_dmi_in_a_bits_address[7:2] == 6'h6 | auto_dmi_in_a_bits_address[7:2] == 6'h7 | auto_dmi_in_a_bits_address[7:2] == 6'h8 | auto_dmi_in_a_bits_address[7:2] == 6'h9 | auto_dmi_in_a_bits_address[7:2] == 6'hA | auto_dmi_in_a_bits_address[7:2] == 6'hB | auto_dmi_in_a_bits_address[7:2] == 6'h11 | auto_dmi_in_a_bits_address[7:2] == 6'h13 | auto_dmi_in_a_bits_address[7:2] == 6'h16 | auto_dmi_in_a_bits_address[7:2] == 6'h17 | auto_dmi_in_a_bits_address[7:2] == 6'h18 | auto_dmi_in_a_bits_address[7:2] == 6'h20 | auto_dmi_in_a_bits_address[7:2] == 6'h21 | auto_dmi_in_a_bits_address[7:2] == 6'h22 | auto_dmi_in_a_bits_address[7:2] == 6'h23 | auto_dmi_in_a_bits_address[7:2] == 6'h24 | auto_dmi_in_a_bits_address[7:2] == 6'h25 | auto_dmi_in_a_bits_address[7:2] == 6'h26 | auto_dmi_in_a_bits_address[7:2] == 6'h27 | auto_dmi_in_a_bits_address[7:2] == 6'h28 | auto_dmi_in_a_bits_address[7:2] == 6'h29 | auto_dmi_in_a_bits_address[7:2] == 6'h2A | auto_dmi_in_a_bits_address[7:2] == 6'h2B | auto_dmi_in_a_bits_address[7:2] == 6'h2C | auto_dmi_in_a_bits_address[7:2] == 6'h2D | auto_dmi_in_a_bits_address[7:2] == 6'h2E | auto_dmi_in_a_bits_address[7:2] == 6'h2F) | ~(auto_dmi_in_a_bits_address[8]))
      ? (_out_out_bits_data_T_30
           ? {31'h0, haltedBitRegs}
           : auto_dmi_in_a_bits_address[7:2] == 6'h4
               ? {abstractDataMem_3, abstractDataMem_2, abstractDataMem_1, abstractDataMem_0}
               : auto_dmi_in_a_bits_address[7:2] == 6'h5
                   ? {abstractDataMem_7, abstractDataMem_6, abstractDataMem_5, abstractDataMem_4}
                   : auto_dmi_in_a_bits_address[7:2] == 6'h6
                       ? {abstractDataMem_11, abstractDataMem_10, abstractDataMem_9, abstractDataMem_8}
                       : auto_dmi_in_a_bits_address[7:2] == 6'h7
                           ? {abstractDataMem_15, abstractDataMem_14, abstractDataMem_13, abstractDataMem_12}
                           : auto_dmi_in_a_bits_address[7:2] == 6'h8
                               ? {abstractDataMem_19, abstractDataMem_18, abstractDataMem_17, abstractDataMem_16}
                               : auto_dmi_in_a_bits_address[7:2] == 6'h9
                                   ? {abstractDataMem_23, abstractDataMem_22, abstractDataMem_21, abstractDataMem_20}
                                   : auto_dmi_in_a_bits_address[7:2] == 6'hA
                                       ? {abstractDataMem_27, abstractDataMem_26, abstractDataMem_25, abstractDataMem_24}
                                       : auto_dmi_in_a_bits_address[7:2] == 6'hB
                                           ? {abstractDataMem_31, abstractDataMem_30, abstractDataMem_29, abstractDataMem_28}
                                           : auto_dmi_in_a_bits_address[7:2] == 6'h11
                                               ? {12'h0, {2{haveResetBitRegs}}, {2{resumereq ? ~resumeReqRegs & ~hamaskWrSel_0 : ~resumeReqRegs}}, 4'h0, ~haltedBitRegs, ~haltedBitRegs, {2{haltedBitRegs}}, 8'hA2}
                                               : auto_dmi_in_a_bits_address[7:2] == 6'h13
                                                   ? {31'h0, haltedBitRegs}
                                                   : auto_dmi_in_a_bits_address[7:2] == 6'h16
                                                       ? {19'h8000, abstractCommandBusy, 1'h0, ABSTRACTCSReg_cmderr, 8'h8}
                                                       : auto_dmi_in_a_bits_address[7:2] == 6'h17
                                                           ? {COMMANDReg_cmdtype, COMMANDReg_control}
                                                           : auto_dmi_in_a_bits_address[7:2] == 6'h18
                                                               ? {ABSTRACTAUTOReg_autoexecprogbuf, 8'h0, ABSTRACTAUTOReg_autoexecdata[7:0]}
                                                               : auto_dmi_in_a_bits_address[7:2] == 6'h20
                                                                   ? {programBufferMem_3, programBufferMem_2, programBufferMem_1, programBufferMem_0}
                                                                   : auto_dmi_in_a_bits_address[7:2] == 6'h21 ? {programBufferMem_7, programBufferMem_6, programBufferMem_5, programBufferMem_4} : auto_dmi_in_a_bits_address[7:2] == 6'h22 ? {programBufferMem_11, programBufferMem_10, programBufferMem_9, programBufferMem_8} : auto_dmi_in_a_bits_address[7:2] == 6'h23 ? {programBufferMem_15, programBufferMem_14, programBufferMem_13, programBufferMem_12} : auto_dmi_in_a_bits_address[7:2] == 6'h24 ? {programBufferMem_19, programBufferMem_18, programBufferMem_17, programBufferMem_16} : auto_dmi_in_a_bits_address[7:2] == 6'h25 ? {programBufferMem_23, programBufferMem_22, programBufferMem_21, programBufferMem_20} : auto_dmi_in_a_bits_address[7:2] == 6'h26 ? {programBufferMem_27, programBufferMem_26, programBufferMem_25, programBufferMem_24} : auto_dmi_in_a_bits_address[7:2] == 6'h27 ? {programBufferMem_31, programBufferMem_30, programBufferMem_29, programBufferMem_28} : auto_dmi_in_a_bits_address[7:2] == 6'h28 ? {programBufferMem_35, programBufferMem_34, programBufferMem_33, programBufferMem_32} : auto_dmi_in_a_bits_address[7:2] == 6'h29 ? {programBufferMem_39, programBufferMem_38, programBufferMem_37, programBufferMem_36} : auto_dmi_in_a_bits_address[7:2] == 6'h2A ? {programBufferMem_43, programBufferMem_42, programBufferMem_41, programBufferMem_40} : auto_dmi_in_a_bits_address[7:2] == 6'h2B ? {programBufferMem_47, programBufferMem_46, programBufferMem_45, programBufferMem_44} : auto_dmi_in_a_bits_address[7:2] == 6'h2C ? {programBufferMem_51, programBufferMem_50, programBufferMem_49, programBufferMem_48} : auto_dmi_in_a_bits_address[7:2] == 6'h2D ? {programBufferMem_55, programBufferMem_54, programBufferMem_53, programBufferMem_52} : auto_dmi_in_a_bits_address[7:2] == 6'h2E ? {programBufferMem_59, programBufferMem_58, programBufferMem_57, programBufferMem_56} : auto_dmi_in_a_bits_address[7:2] == 6'h2F ? {programBufferMem_63, programBufferMem_62, programBufferMem_61, programBufferMem_60} : 32'h0)
      : 32'h0;
  assign io_hgDebugInt_0 = hrDebugIntReg_0;
endmodule

