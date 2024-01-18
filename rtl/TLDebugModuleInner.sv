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
  input  [11:0] auto_tl_in_a_bits_source,
                auto_tl_in_a_bits_address,
  input  [7:0]  auto_tl_in_a_bits_mask,
  input  [63:0] auto_tl_in_a_bits_data,
  input         auto_tl_in_a_bits_corrupt,
                auto_tl_in_d_ready,
  output        auto_tl_in_d_valid,
  output [2:0]  auto_tl_in_d_bits_opcode,
  output [1:0]  auto_tl_in_d_bits_size,
  output [11:0] auto_tl_in_d_bits_source,
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
                io_innerCtrl_bits_hasel,
                io_innerCtrl_bits_hamask_0,
                io_innerCtrl_bits_hamask_1,
                io_innerCtrl_bits_hrmask_0,
                io_innerCtrl_bits_hrmask_1,
  output        io_hgDebugInt_0,
                io_hgDebugInt_1,
  input         io_hartIsInReset_0,
                io_hartIsInReset_1
);

  wire          abstractCommandBusy;
  wire          out_woready_1_121;
  wire          out_woready_1_154;
  wire          out_woready_43;
  wire          out_woready_11;
  wire          out_woready_66;
  wire          out_woready_105;
  wire          out_woready_121;
  wire          out_woready_47;
  wire          out_woready_23;
  wire          out_woready_125;
  wire          out_woready_113;
  wire          out_woready_58;
  wire          out_woready_54;
  wire          out_woready_130;
  wire          out_woready_27;
  wire          out_woready_94;
  wire          out_woready_62;
  wire          out_woready_90;
  wire          out_woready_50;
  wire          out_woready_117;
  wire          out_woready_7;
  wire          out_woready_19;
  wire          out_woready_35;
  wire          out_woready_109;
  wire          out_woready_15;
  wire          out_woready_3;
  wire          out_woready_39;
  wire          _out_wofireMux_T_2;
  wire          out_roready_43;
  wire          out_roready_11;
  wire          out_roready_66;
  wire          out_roready_105;
  wire          out_roready_121;
  wire          out_roready_47;
  wire          out_roready_23;
  wire          out_roready_125;
  wire          out_roready_113;
  wire          out_roready_58;
  wire          out_roready_54;
  wire          out_roready_130;
  wire          out_roready_27;
  wire          out_roready_94;
  wire          out_roready_62;
  wire          out_roready_90;
  wire          out_roready_117;
  wire          out_roready_7;
  wire          out_roready_19;
  wire          out_roready_35;
  wire          out_roready_109;
  wire          out_roready_15;
  wire          out_roready_3;
  wire          out_roready_39;
  wire          out_backSel_23;
  wire          out_backSel_22;
  wire [1:0]    resumeAcks;
  wire          _hartIsInResetSync_1_debug_hartReset_1_io_q;
  wire          _hartIsInResetSync_0_debug_hartReset_0_io_q;
  reg  [1:0]    haltedBitRegs;
  reg  [1:0]    resumeReqRegs;
  reg  [1:0]    haveResetBitRegs;
  reg           selectedHartReg;
  reg           hamaskReg_0;
  reg           hamaskReg_1;
  wire          hamaskFull_0 = ~selectedHartReg | hamaskReg_0;
  wire          hamaskFull_1 = selectedHartReg | hamaskReg_1;
  wire          hamaskWrSel_0 = io_innerCtrl_bits_hartsel == 10'h0 | io_innerCtrl_bits_hasel & io_innerCtrl_bits_hamask_0;
  wire          hamaskWrSel_1 = io_innerCtrl_bits_hartsel == 10'h1 | io_innerCtrl_bits_hasel & io_innerCtrl_bits_hamask_1;
  reg           hrmaskReg_0;
  reg           hrmaskReg_1;
  reg           hrDebugIntReg_0;
  reg           hrDebugIntReg_1;
  wire          resumereq = io_innerCtrl_valid & io_innerCtrl_bits_resumereq;
  reg           hgParticipateHart_0;
  reg           hgParticipateHart_1;
  reg           hgFired_1;
  reg  [2:0]    ABSTRACTCSReg_cmderr;
  reg  [15:0]   ABSTRACTAUTOReg_autoexecprogbuf;
  reg  [11:0]   ABSTRACTAUTOReg_autoexecdata;
  reg  [7:0]    COMMANDReg_cmdtype;
  reg  [23:0]   COMMANDReg_control;
  reg  [7:0]    abstractDataMem_0;
  reg  [7:0]    abstractDataMem_1;
  reg  [7:0]    abstractDataMem_2;
  reg  [7:0]    abstractDataMem_3;
  reg  [7:0]    abstractDataMem_4;
  reg  [7:0]    abstractDataMem_5;
  reg  [7:0]    abstractDataMem_6;
  reg  [7:0]    abstractDataMem_7;
  reg  [7:0]    abstractDataMem_8;
  reg  [7:0]    abstractDataMem_9;
  reg  [7:0]    abstractDataMem_10;
  reg  [7:0]    abstractDataMem_11;
  reg  [7:0]    abstractDataMem_12;
  reg  [7:0]    abstractDataMem_13;
  reg  [7:0]    abstractDataMem_14;
  reg  [7:0]    abstractDataMem_15;
  reg  [7:0]    abstractDataMem_16;
  reg  [7:0]    abstractDataMem_17;
  reg  [7:0]    abstractDataMem_18;
  reg  [7:0]    abstractDataMem_19;
  reg  [7:0]    abstractDataMem_20;
  reg  [7:0]    abstractDataMem_21;
  reg  [7:0]    abstractDataMem_22;
  reg  [7:0]    abstractDataMem_23;
  reg  [7:0]    abstractDataMem_24;
  reg  [7:0]    abstractDataMem_25;
  reg  [7:0]    abstractDataMem_26;
  reg  [7:0]    abstractDataMem_27;
  reg  [7:0]    abstractDataMem_28;
  reg  [7:0]    abstractDataMem_29;
  reg  [7:0]    abstractDataMem_30;
  reg  [7:0]    abstractDataMem_31;
  reg  [7:0]    programBufferMem_0;
  reg  [7:0]    programBufferMem_1;
  reg  [7:0]    programBufferMem_2;
  reg  [7:0]    programBufferMem_3;
  reg  [7:0]    programBufferMem_4;
  reg  [7:0]    programBufferMem_5;
  reg  [7:0]    programBufferMem_6;
  reg  [7:0]    programBufferMem_7;
  reg  [7:0]    programBufferMem_8;
  reg  [7:0]    programBufferMem_9;
  reg  [7:0]    programBufferMem_10;
  reg  [7:0]    programBufferMem_11;
  reg  [7:0]    programBufferMem_12;
  reg  [7:0]    programBufferMem_13;
  reg  [7:0]    programBufferMem_14;
  reg  [7:0]    programBufferMem_15;
  reg  [7:0]    programBufferMem_16;
  reg  [7:0]    programBufferMem_17;
  reg  [7:0]    programBufferMem_18;
  reg  [7:0]    programBufferMem_19;
  reg  [7:0]    programBufferMem_20;
  reg  [7:0]    programBufferMem_21;
  reg  [7:0]    programBufferMem_22;
  reg  [7:0]    programBufferMem_23;
  reg  [7:0]    programBufferMem_24;
  reg  [7:0]    programBufferMem_25;
  reg  [7:0]    programBufferMem_26;
  reg  [7:0]    programBufferMem_27;
  reg  [7:0]    programBufferMem_28;
  reg  [7:0]    programBufferMem_29;
  reg  [7:0]    programBufferMem_30;
  reg  [7:0]    programBufferMem_31;
  reg  [7:0]    programBufferMem_32;
  reg  [7:0]    programBufferMem_33;
  reg  [7:0]    programBufferMem_34;
  reg  [7:0]    programBufferMem_35;
  reg  [7:0]    programBufferMem_36;
  reg  [7:0]    programBufferMem_37;
  reg  [7:0]    programBufferMem_38;
  reg  [7:0]    programBufferMem_39;
  reg  [7:0]    programBufferMem_40;
  reg  [7:0]    programBufferMem_41;
  reg  [7:0]    programBufferMem_42;
  reg  [7:0]    programBufferMem_43;
  reg  [7:0]    programBufferMem_44;
  reg  [7:0]    programBufferMem_45;
  reg  [7:0]    programBufferMem_46;
  reg  [7:0]    programBufferMem_47;
  reg  [7:0]    programBufferMem_48;
  reg  [7:0]    programBufferMem_49;
  reg  [7:0]    programBufferMem_50;
  reg  [7:0]    programBufferMem_51;
  reg  [7:0]    programBufferMem_52;
  reg  [7:0]    programBufferMem_53;
  reg  [7:0]    programBufferMem_54;
  reg  [7:0]    programBufferMem_55;
  reg  [7:0]    programBufferMem_56;
  reg  [7:0]    programBufferMem_57;
  reg  [7:0]    programBufferMem_58;
  reg  [7:0]    programBufferMem_59;
  reg  [7:0]    programBufferMem_60;
  reg  [7:0]    programBufferMem_61;
  reg  [7:0]    programBufferMem_62;
  reg  [7:0]    programBufferMem_63;
  assign resumeAcks = resumereq ? ~resumeReqRegs & ~{hamaskWrSel_1, hamaskWrSel_0} : ~resumeReqRegs;
  wire          out_front_bits_read = auto_dmi_in_a_bits_opcode == 3'h4;
  wire [7:0]    _out_backMask_T_9 = {8{auto_dmi_in_a_bits_mask[2]}};
  wire [7:0]    _out_backMask_T_11 = {8{auto_dmi_in_a_bits_mask[3]}};
  wire          dmiAbstractDataWrEnMaybe_4 = out_woready_3 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataWrEnMaybe_5 = out_woready_3 & auto_dmi_in_a_bits_mask[1];
  wire          dmiAbstractDataWrEnMaybe_6 = out_woready_3 & auto_dmi_in_a_bits_mask[2];
  wire          dmiAbstractDataWrEnMaybe_7 = out_woready_3 & auto_dmi_in_a_bits_mask[3];
  wire          dmiAbstractDataWrEnMaybe_24 = out_woready_7 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataWrEnMaybe_25 = out_woready_7 & auto_dmi_in_a_bits_mask[1];
  wire          dmiAbstractDataWrEnMaybe_26 = out_woready_7 & auto_dmi_in_a_bits_mask[2];
  wire          dmiAbstractDataWrEnMaybe_27 = out_woready_7 & auto_dmi_in_a_bits_mask[3];
  wire          dmiProgramBufferWrEnMaybe_56 = out_woready_11 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_57 = out_woready_11 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_58 = out_woready_11 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_59 = out_woready_11 & auto_dmi_in_a_bits_mask[3];
  wire          dmiAbstractDataWrEnMaybe_8 = out_woready_15 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataWrEnMaybe_9 = out_woready_15 & auto_dmi_in_a_bits_mask[1];
  wire          dmiAbstractDataWrEnMaybe_10 = out_woready_15 & auto_dmi_in_a_bits_mask[2];
  wire          dmiAbstractDataWrEnMaybe_11 = out_woready_15 & auto_dmi_in_a_bits_mask[3];
  wire          dmiAbstractDataWrEnMaybe_20 = out_woready_19 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataWrEnMaybe_21 = out_woready_19 & auto_dmi_in_a_bits_mask[1];
  wire          dmiAbstractDataWrEnMaybe_22 = out_woready_19 & auto_dmi_in_a_bits_mask[2];
  wire          dmiAbstractDataWrEnMaybe_23 = out_woready_19 & auto_dmi_in_a_bits_mask[3];
  wire          dmiProgramBufferWrEnMaybe_36 = out_woready_23 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_37 = out_woready_23 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_38 = out_woready_23 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_39 = out_woready_23 & auto_dmi_in_a_bits_mask[3];
  wire          dmiProgramBufferWrEnMaybe_12 = out_woready_27 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_13 = out_woready_27 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_14 = out_woready_27 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_15 = out_woready_27 & auto_dmi_in_a_bits_mask[3];
  wire          dmiAbstractDataWrEnMaybe_16 = out_woready_35 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataWrEnMaybe_17 = out_woready_35 & auto_dmi_in_a_bits_mask[1];
  wire          dmiAbstractDataWrEnMaybe_18 = out_woready_35 & auto_dmi_in_a_bits_mask[2];
  wire          dmiAbstractDataWrEnMaybe_19 = out_woready_35 & auto_dmi_in_a_bits_mask[3];
  wire          dmiAbstractDataWrEnMaybe_0 = out_woready_39 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataWrEnMaybe_1 = out_woready_39 & auto_dmi_in_a_bits_mask[1];
  wire          dmiAbstractDataWrEnMaybe_2 = out_woready_39 & auto_dmi_in_a_bits_mask[2];
  wire          dmiAbstractDataWrEnMaybe_3 = out_woready_39 & auto_dmi_in_a_bits_mask[3];
  wire          dmiProgramBufferWrEnMaybe_60 = out_woready_43 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_61 = out_woready_43 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_62 = out_woready_43 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_63 = out_woready_43 & auto_dmi_in_a_bits_mask[3];
  wire          dmiProgramBufferWrEnMaybe_40 = out_woready_47 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_41 = out_woready_47 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_42 = out_woready_47 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_43 = out_woready_47 & auto_dmi_in_a_bits_mask[3];
  wire          autoexecdataWrEnMaybe = out_woready_50 & auto_dmi_in_a_bits_mask[0];
  wire          autoexecprogbufWrEnMaybe = out_woready_50 & (&{_out_backMask_T_11, _out_backMask_T_9});
  wire          dmiProgramBufferWrEnMaybe_20 = out_woready_54 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_21 = out_woready_54 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_22 = out_woready_54 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_23 = out_woready_54 & auto_dmi_in_a_bits_mask[3];
  wire          dmiProgramBufferWrEnMaybe_24 = out_woready_58 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_25 = out_woready_58 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_26 = out_woready_58 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_27 = out_woready_58 & auto_dmi_in_a_bits_mask[3];
  wire          dmiProgramBufferWrEnMaybe_4 = out_woready_62 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_5 = out_woready_62 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_6 = out_woready_62 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_7 = out_woready_62 & auto_dmi_in_a_bits_mask[3];
  wire          dmiProgramBufferWrEnMaybe_52 = out_woready_66 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_53 = out_woready_66 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_54 = out_woready_66 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_55 = out_woready_66 & auto_dmi_in_a_bits_mask[3];
  wire          dmiProgramBufferWrEnMaybe_0 = out_woready_90 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_1 = out_woready_90 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_2 = out_woready_90 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_3 = out_woready_90 & auto_dmi_in_a_bits_mask[3];
  wire          dmiProgramBufferWrEnMaybe_8 = out_woready_94 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_9 = out_woready_94 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_10 = out_woready_94 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_11 = out_woready_94 & auto_dmi_in_a_bits_mask[3];
  wire          ABSTRACTCSWrEnMaybe = _out_wofireMux_T_2 & out_backSel_22 & ~(auto_dmi_in_a_bits_address[8]) & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_48 = out_woready_105 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_49 = out_woready_105 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_50 = out_woready_105 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_51 = out_woready_105 & auto_dmi_in_a_bits_mask[3];
  wire          dmiAbstractDataWrEnMaybe_12 = out_woready_109 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataWrEnMaybe_13 = out_woready_109 & auto_dmi_in_a_bits_mask[1];
  wire          dmiAbstractDataWrEnMaybe_14 = out_woready_109 & auto_dmi_in_a_bits_mask[2];
  wire          dmiAbstractDataWrEnMaybe_15 = out_woready_109 & auto_dmi_in_a_bits_mask[3];
  wire          dmiProgramBufferWrEnMaybe_28 = out_woready_113 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_29 = out_woready_113 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_30 = out_woready_113 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_31 = out_woready_113 & auto_dmi_in_a_bits_mask[3];
  wire          dmiAbstractDataWrEnMaybe_28 = out_woready_117 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataWrEnMaybe_29 = out_woready_117 & auto_dmi_in_a_bits_mask[1];
  wire          dmiAbstractDataWrEnMaybe_30 = out_woready_117 & auto_dmi_in_a_bits_mask[2];
  wire          dmiAbstractDataWrEnMaybe_31 = out_woready_117 & auto_dmi_in_a_bits_mask[3];
  wire          dmiProgramBufferWrEnMaybe_44 = out_woready_121 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_45 = out_woready_121 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_46 = out_woready_121 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_47 = out_woready_121 & auto_dmi_in_a_bits_mask[3];
  wire          dmiProgramBufferWrEnMaybe_32 = out_woready_125 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_33 = out_woready_125 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_34 = out_woready_125 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_35 = out_woready_125 & auto_dmi_in_a_bits_mask[3];
  wire          COMMANDWrEnMaybe = _out_wofireMux_T_2 & out_backSel_23 & ~(auto_dmi_in_a_bits_address[8]) & (&{_out_backMask_T_11, _out_backMask_T_9, {8{auto_dmi_in_a_bits_mask[1]}}, {8{auto_dmi_in_a_bits_mask[0]}}});
  wire [31:0]   _COMMANDWrData_WIRE_1 = COMMANDWrEnMaybe ? auto_dmi_in_a_bits_data : 32'h0;
  wire          dmiProgramBufferWrEnMaybe_16 = out_woready_130 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferWrEnMaybe_17 = out_woready_130 & auto_dmi_in_a_bits_mask[1];
  wire          dmiProgramBufferWrEnMaybe_18 = out_woready_130 & auto_dmi_in_a_bits_mask[2];
  wire          dmiProgramBufferWrEnMaybe_19 = out_woready_130 & auto_dmi_in_a_bits_mask[3];
  wire          out_backSel_4 = auto_dmi_in_a_bits_address[7:2] == 6'h4;
  wire          out_backSel_5 = auto_dmi_in_a_bits_address[7:2] == 6'h5;
  wire          out_backSel_6 = auto_dmi_in_a_bits_address[7:2] == 6'h6;
  wire          out_backSel_7 = auto_dmi_in_a_bits_address[7:2] == 6'h7;
  wire          out_backSel_8 = auto_dmi_in_a_bits_address[7:2] == 6'h8;
  wire          out_backSel_9 = auto_dmi_in_a_bits_address[7:2] == 6'h9;
  wire          out_backSel_10 = auto_dmi_in_a_bits_address[7:2] == 6'hA;
  wire          out_backSel_11 = auto_dmi_in_a_bits_address[7:2] == 6'hB;
  assign out_backSel_22 = auto_dmi_in_a_bits_address[7:2] == 6'h16;
  assign out_backSel_23 = auto_dmi_in_a_bits_address[7:2] == 6'h17;
  wire          out_backSel_32 = auto_dmi_in_a_bits_address[7:2] == 6'h20;
  wire          out_backSel_33 = auto_dmi_in_a_bits_address[7:2] == 6'h21;
  wire          out_backSel_34 = auto_dmi_in_a_bits_address[7:2] == 6'h22;
  wire          out_backSel_35 = auto_dmi_in_a_bits_address[7:2] == 6'h23;
  wire          out_backSel_36 = auto_dmi_in_a_bits_address[7:2] == 6'h24;
  wire          out_backSel_37 = auto_dmi_in_a_bits_address[7:2] == 6'h25;
  wire          out_backSel_38 = auto_dmi_in_a_bits_address[7:2] == 6'h26;
  wire          out_backSel_39 = auto_dmi_in_a_bits_address[7:2] == 6'h27;
  wire          out_backSel_40 = auto_dmi_in_a_bits_address[7:2] == 6'h28;
  wire          out_backSel_41 = auto_dmi_in_a_bits_address[7:2] == 6'h29;
  wire          out_backSel_42 = auto_dmi_in_a_bits_address[7:2] == 6'h2A;
  wire          out_backSel_43 = auto_dmi_in_a_bits_address[7:2] == 6'h2B;
  wire          out_backSel_44 = auto_dmi_in_a_bits_address[7:2] == 6'h2C;
  wire          out_backSel_45 = auto_dmi_in_a_bits_address[7:2] == 6'h2D;
  wire          out_backSel_46 = auto_dmi_in_a_bits_address[7:2] == 6'h2E;
  wire          out_backSel_47 = auto_dmi_in_a_bits_address[7:2] == 6'h2F;
  wire          _out_wofireMux_T = auto_dmi_in_a_valid & auto_dmi_in_d_ready;
  wire          _out_rofireMux_T_1 = _out_wofireMux_T & out_front_bits_read;
  assign out_roready_39 = _out_rofireMux_T_1 & out_backSel_4 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_3 = _out_rofireMux_T_1 & out_backSel_5 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_15 = _out_rofireMux_T_1 & out_backSel_6 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_109 = _out_rofireMux_T_1 & out_backSel_7 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_35 = _out_rofireMux_T_1 & out_backSel_8 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_19 = _out_rofireMux_T_1 & out_backSel_9 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_7 = _out_rofireMux_T_1 & out_backSel_10 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_117 = _out_rofireMux_T_1 & out_backSel_11 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_90 = _out_rofireMux_T_1 & out_backSel_32 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_62 = _out_rofireMux_T_1 & out_backSel_33 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_94 = _out_rofireMux_T_1 & out_backSel_34 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_27 = _out_rofireMux_T_1 & out_backSel_35 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_130 = _out_rofireMux_T_1 & out_backSel_36 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_54 = _out_rofireMux_T_1 & out_backSel_37 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_58 = _out_rofireMux_T_1 & out_backSel_38 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_113 = _out_rofireMux_T_1 & out_backSel_39 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_125 = _out_rofireMux_T_1 & out_backSel_40 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_23 = _out_rofireMux_T_1 & out_backSel_41 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_47 = _out_rofireMux_T_1 & out_backSel_42 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_121 = _out_rofireMux_T_1 & out_backSel_43 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_105 = _out_rofireMux_T_1 & out_backSel_44 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_66 = _out_rofireMux_T_1 & out_backSel_45 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_11 = _out_rofireMux_T_1 & out_backSel_46 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_roready_43 = _out_rofireMux_T_1 & out_backSel_47 & ~(auto_dmi_in_a_bits_address[8]);
  assign _out_wofireMux_T_2 = _out_wofireMux_T & ~out_front_bits_read;
  assign out_woready_39 = _out_wofireMux_T_2 & out_backSel_4 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_3 = _out_wofireMux_T_2 & out_backSel_5 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_15 = _out_wofireMux_T_2 & out_backSel_6 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_109 = _out_wofireMux_T_2 & out_backSel_7 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_35 = _out_wofireMux_T_2 & out_backSel_8 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_19 = _out_wofireMux_T_2 & out_backSel_9 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_7 = _out_wofireMux_T_2 & out_backSel_10 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_117 = _out_wofireMux_T_2 & out_backSel_11 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_50 = _out_wofireMux_T_2 & auto_dmi_in_a_bits_address[7:2] == 6'h18 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_90 = _out_wofireMux_T_2 & out_backSel_32 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_62 = _out_wofireMux_T_2 & out_backSel_33 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_94 = _out_wofireMux_T_2 & out_backSel_34 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_27 = _out_wofireMux_T_2 & out_backSel_35 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_130 = _out_wofireMux_T_2 & out_backSel_36 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_54 = _out_wofireMux_T_2 & out_backSel_37 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_58 = _out_wofireMux_T_2 & out_backSel_38 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_113 = _out_wofireMux_T_2 & out_backSel_39 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_125 = _out_wofireMux_T_2 & out_backSel_40 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_23 = _out_wofireMux_T_2 & out_backSel_41 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_47 = _out_wofireMux_T_2 & out_backSel_42 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_121 = _out_wofireMux_T_2 & out_backSel_43 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_105 = _out_wofireMux_T_2 & out_backSel_44 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_66 = _out_wofireMux_T_2 & out_backSel_45 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_11 = _out_wofireMux_T_2 & out_backSel_46 & ~(auto_dmi_in_a_bits_address[8]);
  assign out_woready_43 = _out_wofireMux_T_2 & out_backSel_47 & ~(auto_dmi_in_a_bits_address[8]);
  wire          _out_out_bits_data_T_31 = auto_dmi_in_a_bits_address[7:2] == 6'h0;
  wire [2:0]    dmiNodeIn_d_bits_opcode = {2'h0, out_front_bits_read};
  reg           goReg;
  reg  [31:0]   abstractGeneratedMem_0;
  reg  [31:0]   abstractGeneratedMem_1;
  wire          out_front_1_bits_read = auto_tl_in_a_bits_opcode == 3'h4;
  wire [9:0]    _out_womask_T_285 = {{2{auto_tl_in_a_bits_mask[1]}}, {8{auto_tl_in_a_bits_mask[0]}}};
  wire [9:0]    _out_womask_T_286 = {{2{auto_tl_in_a_bits_mask[5]}}, {8{auto_tl_in_a_bits_mask[4]}}};
  wire          hartExceptionWrEn = out_woready_1_121 & (&_out_womask_T_286);
  wire          hartHaltedWrEn = out_woready_1_154 & (&_out_womask_T_285);
  wire          hartGoingWrEn = out_woready_1_154 & (&_out_womask_T_286);
  wire [7:0]    out_oindex_1 = {auto_tl_in_a_bits_address[11:9], auto_tl_in_a_bits_address[7:3]};
  wire [7:0]    _GEN = {auto_tl_in_a_bits_address[11:9], auto_tl_in_a_bits_address[7:3]};
  wire          _out_wofireMux_T_262 = auto_tl_in_a_valid & auto_tl_in_d_ready & ~out_front_1_bits_read;
  assign out_woready_1_154 = _out_wofireMux_T_262 & _GEN == 8'h0 & auto_tl_in_a_bits_address[8];
  assign out_woready_1_121 = _out_wofireMux_T_262 & _GEN == 8'h1 & auto_tl_in_a_bits_address[8];
  wire          out_woready_1_87 = _out_wofireMux_T_262 & _GEN == 8'h28 & auto_tl_in_a_bits_address[8];
  wire          out_woready_1_148 = _out_wofireMux_T_262 & _GEN == 8'h29 & auto_tl_in_a_bits_address[8];
  wire          out_woready_1_39 = _out_wofireMux_T_262 & _GEN == 8'h2A & auto_tl_in_a_bits_address[8];
  wire          out_woready_1_103 = _out_wofireMux_T_262 & _GEN == 8'h2B & auto_tl_in_a_bits_address[8];
  wire          out_woready_1_172 = _out_wofireMux_T_262 & _GEN == 8'h2C & auto_tl_in_a_bits_address[8];
  wire          out_woready_1_130 = _out_wofireMux_T_262 & _GEN == 8'h2D & auto_tl_in_a_bits_address[8];
  wire          out_woready_1_23 = _out_wofireMux_T_262 & _GEN == 8'h2E & auto_tl_in_a_bits_address[8];
  wire          out_woready_1_111 = _out_wofireMux_T_262 & _GEN == 8'h2F & auto_tl_in_a_bits_address[8];
  wire          out_woready_1_71 = _out_wofireMux_T_262 & _GEN == 8'h30 & auto_tl_in_a_bits_address[8];
  wire          out_woready_1_63 = _out_wofireMux_T_262 & _GEN == 8'h31 & auto_tl_in_a_bits_address[8];
  wire          out_woready_1_188 = _out_wofireMux_T_262 & _GEN == 8'h32 & auto_tl_in_a_bits_address[8];
  wire          out_woready_1_7 = _out_wofireMux_T_262 & _GEN == 8'h33 & auto_tl_in_a_bits_address[8];
  wire          _out_out_bits_data_T_91 = out_oindex_1 == 8'h0;
  wire [2:0]    tlNodeIn_d_bits_opcode = {2'h0, out_front_1_bits_read};
  reg  [1:0]    ctrlStateReg;
  wire [1:0]    _hartHalted_T = haltedBitRegs >> selectedHartReg;
  assign abstractCommandBusy = |ctrlStateReg;
  wire          commandRegIsAccessRegister = COMMANDReg_cmdtype == 8'h0;
  wire          _GEN_0 = ~(COMMANDReg_control[17]) | (|(COMMANDReg_control[15:12])) & COMMANDReg_control[15:0] < 16'h1020 & (COMMANDReg_control[22:20] == 3'h2 | COMMANDReg_control[22:20] == 3'h3);
  wire          commandRegIsUnsupported = ~commandRegIsAccessRegister | ~_GEN_0;
  wire          commandRegBadHaltResume = commandRegIsAccessRegister & _GEN_0 & ~(_hartHalted_T[0]);
  wire          _GEN_1 = ctrlStateReg == 2'h1;
  wire          _GEN_2 = commandRegIsUnsupported | commandRegBadHaltResume;
  wire          goAbstract = (|ctrlStateReg) & _GEN_1 & ~_GEN_2;
  wire          _GEN_3 = ctrlStateReg == 2'h2;
  `ifndef SYNTHESIS
    wire _GEN_4 = (|ctrlStateReg) & ~_GEN_1;
    always @(posedge clock) begin
      if (io_dmactive & ~goAbstract & hartGoingWrEn & ~reset & (|(auto_tl_in_a_bits_data[41:32]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Unexpected 'GOING' hart.\n    at Debug.scala:1499 assert(hartGoingId === 0.U, \"Unexpected 'GOING' hart.\")//Chisel3 #540 %%%%x, expected %%%%x\", hartGoingId, 0.U)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_4 & _GEN_3 & hartExceptionWrEn & ~reset & (|(auto_tl_in_a_bits_data[41:32]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Unexpected 'EXCEPTION' hart\n    at Debug.scala:1820 assert(hartExceptionId === 0.U, \"Unexpected 'EXCEPTION' hart\")//Chisel3 #540, %%%%x, expected %%%%x\", hartExceptionId, 0.U)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (_GEN_4 & ~_GEN_3 & (&ctrlStateReg) & ~reset) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Should not be in custom state unless we need it.\n    at Debug.scala:1825 assert(needCustom.B, \"Should not be in custom state unless we need it.\")\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_dmactive | ~hartExceptionWrEn | _GEN_3)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Unexpected EXCEPTION write: should only get it in Debug Module EXEC state\n    at Debug.scala:1838 assert ((!io.dmactive || !hartExceptionWrEn || ctrlStateReg === CtrlState(Exec)),\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire          dmiAbstractDataAccessVec_0 = dmiAbstractDataWrEnMaybe_0 | out_roready_39 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataAccessVec_4 = dmiAbstractDataWrEnMaybe_4 | out_roready_3 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataAccessVec_8 = dmiAbstractDataWrEnMaybe_8 | out_roready_15 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataAccessVec_12 = dmiAbstractDataWrEnMaybe_12 | out_roready_109 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataAccessVec_16 = dmiAbstractDataWrEnMaybe_16 | out_roready_35 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataAccessVec_20 = dmiAbstractDataWrEnMaybe_20 | out_roready_19 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataAccessVec_24 = dmiAbstractDataWrEnMaybe_24 | out_roready_7 & auto_dmi_in_a_bits_mask[0];
  wire          dmiAbstractDataAccessVec_28 = dmiAbstractDataWrEnMaybe_28 | out_roready_117 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_0 = dmiProgramBufferWrEnMaybe_0 | out_roready_90 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_4 = dmiProgramBufferWrEnMaybe_4 | out_roready_62 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_8 = dmiProgramBufferWrEnMaybe_8 | out_roready_94 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_12 = dmiProgramBufferWrEnMaybe_12 | out_roready_27 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_16 = dmiProgramBufferWrEnMaybe_16 | out_roready_130 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_20 = dmiProgramBufferWrEnMaybe_20 | out_roready_54 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_24 = dmiProgramBufferWrEnMaybe_24 | out_roready_58 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_28 = dmiProgramBufferWrEnMaybe_28 | out_roready_113 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_32 = dmiProgramBufferWrEnMaybe_32 | out_roready_125 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_36 = dmiProgramBufferWrEnMaybe_36 | out_roready_23 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_40 = dmiProgramBufferWrEnMaybe_40 | out_roready_47 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_44 = dmiProgramBufferWrEnMaybe_44 | out_roready_121 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_48 = dmiProgramBufferWrEnMaybe_48 | out_roready_105 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_52 = dmiProgramBufferWrEnMaybe_52 | out_roready_66 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_56 = dmiProgramBufferWrEnMaybe_56 | out_roready_11 & auto_dmi_in_a_bits_mask[0];
  wire          dmiProgramBufferAccessVec_60 = dmiProgramBufferWrEnMaybe_60 | out_roready_43 & auto_dmi_in_a_bits_mask[0];
  wire          autoexec = dmiAbstractDataAccessVec_0 & ABSTRACTAUTOReg_autoexecdata[0] | dmiAbstractDataAccessVec_4 & ABSTRACTAUTOReg_autoexecdata[1] | dmiAbstractDataAccessVec_8 & ABSTRACTAUTOReg_autoexecdata[2] | dmiAbstractDataAccessVec_12 & ABSTRACTAUTOReg_autoexecdata[3] | dmiAbstractDataAccessVec_16 & ABSTRACTAUTOReg_autoexecdata[4] | dmiAbstractDataAccessVec_20 & ABSTRACTAUTOReg_autoexecdata[5] | dmiAbstractDataAccessVec_24 & ABSTRACTAUTOReg_autoexecdata[6] | dmiAbstractDataAccessVec_28 & ABSTRACTAUTOReg_autoexecdata[7] | dmiProgramBufferAccessVec_0 & ABSTRACTAUTOReg_autoexecprogbuf[0] | dmiProgramBufferAccessVec_4 & ABSTRACTAUTOReg_autoexecprogbuf[1] | dmiProgramBufferAccessVec_8 & ABSTRACTAUTOReg_autoexecprogbuf[2] | dmiProgramBufferAccessVec_12 & ABSTRACTAUTOReg_autoexecprogbuf[3] | dmiProgramBufferAccessVec_16 & ABSTRACTAUTOReg_autoexecprogbuf[4] | dmiProgramBufferAccessVec_20 & ABSTRACTAUTOReg_autoexecprogbuf[5] | dmiProgramBufferAccessVec_24 & ABSTRACTAUTOReg_autoexecprogbuf[6] | dmiProgramBufferAccessVec_28 & ABSTRACTAUTOReg_autoexecprogbuf[7] | dmiProgramBufferAccessVec_32 & ABSTRACTAUTOReg_autoexecprogbuf[8] | dmiProgramBufferAccessVec_36 & ABSTRACTAUTOReg_autoexecprogbuf[9] | dmiProgramBufferAccessVec_40 & ABSTRACTAUTOReg_autoexecprogbuf[10] | dmiProgramBufferAccessVec_44 & ABSTRACTAUTOReg_autoexecprogbuf[11] | dmiProgramBufferAccessVec_48 & ABSTRACTAUTOReg_autoexecprogbuf[12] | dmiProgramBufferAccessVec_52 & ABSTRACTAUTOReg_autoexecprogbuf[13] | dmiProgramBufferAccessVec_56 & ABSTRACTAUTOReg_autoexecprogbuf[14] | dmiProgramBufferAccessVec_60 & ABSTRACTAUTOReg_autoexecprogbuf[15];
  wire          COMMANDWrEn = COMMANDWrEnMaybe & ~(|ctrlStateReg);
  wire [1:0]    _resumeReqRegs_T_10 = {_hartIsInResetSync_1_debug_hartReset_1_io_q, _hartIsInResetSync_0_debug_hartReset_0_io_q};
  wire [1023:0] _GEN_5 = {1014'h0, auto_tl_in_a_bits_data[9:0]};
  wire [1023:0] hartResumingIdIndex = 1024'h1 << _GEN_5;
  wire          hartResumingWrEn = out_woready_1_121 & (&_out_womask_T_285);
  wire          _regAccessRegisterCommand_T_1 = ABSTRACTCSReg_cmderr == 3'h0;
  wire          _GEN_6 = COMMANDWrEn & ~(|(_COMMANDWrData_WIRE_1[31:24])) & _regAccessRegisterCommand_T_1 | autoexec & commandRegIsAccessRegister & _regAccessRegisterCommand_T_1;
  wire [1023:0] hartHaltedIdIndex = 1024'h1 << _GEN_5;
  always @(posedge clock) begin
    if (io_dmactive) begin
      if (hartHaltedWrEn)
        haltedBitRegs <= (haltedBitRegs | hartHaltedIdIndex[1:0]) & ~_resumeReqRegs_T_10;
      else if (hartResumingWrEn)
        haltedBitRegs <= ~(hartResumingIdIndex[1:0]) & haltedBitRegs & ~_resumeReqRegs_T_10;
      else
        haltedBitRegs <= haltedBitRegs & ~_resumeReqRegs_T_10;
      if (resumereq)
        resumeReqRegs <= (resumeReqRegs | {hamaskWrSel_1, hamaskWrSel_0}) & ~_resumeReqRegs_T_10;
      else if (hartResumingWrEn)
        resumeReqRegs <= ~(hartResumingIdIndex[1:0]) & resumeReqRegs & ~_resumeReqRegs_T_10;
      else
        resumeReqRegs <= resumeReqRegs & ~_resumeReqRegs_T_10;
      if (io_innerCtrl_valid & io_innerCtrl_bits_ackhavereset)
        haveResetBitRegs <= haveResetBitRegs & ~{hamaskWrSel_1, hamaskWrSel_0} | {_hartIsInResetSync_1_debug_hartReset_1_io_q, _hartIsInResetSync_0_debug_hartReset_0_io_q};
      else
        haveResetBitRegs <= haveResetBitRegs | {_hartIsInResetSync_1_debug_hartReset_1_io_q, _hartIsInResetSync_0_debug_hartReset_0_io_q};
      if (ABSTRACTCSWrEnMaybe & (|ctrlStateReg) | autoexecdataWrEnMaybe & (|ctrlStateReg) | autoexecprogbufWrEnMaybe & (|ctrlStateReg) | COMMANDWrEnMaybe & (|ctrlStateReg)
          | (dmiAbstractDataAccessVec_0 | dmiAbstractDataWrEnMaybe_1 | out_roready_39 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_2 | out_roready_39 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_3 | out_roready_39 & auto_dmi_in_a_bits_mask[3] | dmiAbstractDataAccessVec_4 | dmiAbstractDataWrEnMaybe_5 | out_roready_3 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_6 | out_roready_3 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_7 | out_roready_3 & auto_dmi_in_a_bits_mask[3] | dmiAbstractDataAccessVec_8 | dmiAbstractDataWrEnMaybe_9 | out_roready_15 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_10 | out_roready_15 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_11 | out_roready_15 & auto_dmi_in_a_bits_mask[3] | dmiAbstractDataAccessVec_12 | dmiAbstractDataWrEnMaybe_13 | out_roready_109 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_14 | out_roready_109 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_15 | out_roready_109 & auto_dmi_in_a_bits_mask[3] | dmiAbstractDataAccessVec_16 | dmiAbstractDataWrEnMaybe_17 | out_roready_35 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_18 | out_roready_35 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_19 | out_roready_35 & auto_dmi_in_a_bits_mask[3] | dmiAbstractDataAccessVec_20 | dmiAbstractDataWrEnMaybe_21 | out_roready_19 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_22 | out_roready_19 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_23 | out_roready_19 & auto_dmi_in_a_bits_mask[3] | dmiAbstractDataAccessVec_24 | dmiAbstractDataWrEnMaybe_25 | out_roready_7 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_26 | out_roready_7 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_27 | out_roready_7 & auto_dmi_in_a_bits_mask[3] | dmiAbstractDataAccessVec_28 | dmiAbstractDataWrEnMaybe_29 | out_roready_117 & auto_dmi_in_a_bits_mask[1] | dmiAbstractDataWrEnMaybe_30 | out_roready_117 & auto_dmi_in_a_bits_mask[2] | dmiAbstractDataWrEnMaybe_31 | out_roready_117
             & auto_dmi_in_a_bits_mask[3]) & (|ctrlStateReg)
          | (dmiProgramBufferAccessVec_0 | dmiProgramBufferWrEnMaybe_1 | out_roready_90 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_2 | out_roready_90 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_3 | out_roready_90 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_4 | dmiProgramBufferWrEnMaybe_5 | out_roready_62 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_6 | out_roready_62 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_7 | out_roready_62 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_8 | dmiProgramBufferWrEnMaybe_9 | out_roready_94 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_10 | out_roready_94 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_11 | out_roready_94 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_12 | dmiProgramBufferWrEnMaybe_13 | out_roready_27 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_14 | out_roready_27 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_15 | out_roready_27 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_16 | dmiProgramBufferWrEnMaybe_17 | out_roready_130 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_18 | out_roready_130 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_19 | out_roready_130 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_20 | dmiProgramBufferWrEnMaybe_21 | out_roready_54 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_22 | out_roready_54 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_23 | out_roready_54 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_24 | dmiProgramBufferWrEnMaybe_25 | out_roready_58 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_26 | out_roready_58 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_27 | out_roready_58 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_28 | dmiProgramBufferWrEnMaybe_29 | out_roready_113 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_30 | out_roready_113 & auto_dmi_in_a_bits_mask[2]
             | dmiProgramBufferWrEnMaybe_31 | out_roready_113 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_32 | dmiProgramBufferWrEnMaybe_33 | out_roready_125 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_34 | out_roready_125 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_35 | out_roready_125 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_36 | dmiProgramBufferWrEnMaybe_37 | out_roready_23 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_38 | out_roready_23 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_39 | out_roready_23 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_40 | dmiProgramBufferWrEnMaybe_41 | out_roready_47 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_42 | out_roready_47 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_43 | out_roready_47 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_44 | dmiProgramBufferWrEnMaybe_45 | out_roready_121 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_46 | out_roready_121 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_47 | out_roready_121 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_48 | dmiProgramBufferWrEnMaybe_49 | out_roready_105 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_50 | out_roready_105 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_51 | out_roready_105 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_52 | dmiProgramBufferWrEnMaybe_53 | out_roready_66 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_54 | out_roready_66 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_55 | out_roready_66 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_56 | dmiProgramBufferWrEnMaybe_57 | out_roready_11 & auto_dmi_in_a_bits_mask[1] | dmiProgramBufferWrEnMaybe_58 | out_roready_11 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_59 | out_roready_11 & auto_dmi_in_a_bits_mask[3] | dmiProgramBufferAccessVec_60 | dmiProgramBufferWrEnMaybe_61 | out_roready_43 & auto_dmi_in_a_bits_mask[1]
             | dmiProgramBufferWrEnMaybe_62 | out_roready_43 & auto_dmi_in_a_bits_mask[2] | dmiProgramBufferWrEnMaybe_63 | out_roready_43 & auto_dmi_in_a_bits_mask[3]) & (|ctrlStateReg))
        ABSTRACTCSReg_cmderr <= 3'h1;
      else if (~(~(|ctrlStateReg) | _GEN_1) & _GEN_3 & hartExceptionWrEn)
        ABSTRACTCSReg_cmderr <= 3'h3;
      else if ((|ctrlStateReg) ? _GEN_1 & commandRegIsUnsupported : ~_GEN_6 & (COMMANDWrEn & (|(_COMMANDWrData_WIRE_1[31:24])) | autoexec & commandRegIsUnsupported))
        ABSTRACTCSReg_cmderr <= 3'h2;
      else if ((|ctrlStateReg) & _GEN_1 & ~commandRegIsUnsupported & commandRegBadHaltResume)
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
      if (out_woready_1_71 & auto_tl_in_a_bits_mask[0])
        abstractDataMem_0 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiAbstractDataWrEnMaybe_0 & ~(|ctrlStateReg))
        abstractDataMem_0 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_71 & auto_tl_in_a_bits_mask[1])
        abstractDataMem_1 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiAbstractDataWrEnMaybe_1 & ~(|ctrlStateReg))
        abstractDataMem_1 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_71 & auto_tl_in_a_bits_mask[2])
        abstractDataMem_2 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiAbstractDataWrEnMaybe_2 & ~(|ctrlStateReg))
        abstractDataMem_2 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_71 & auto_tl_in_a_bits_mask[3])
        abstractDataMem_3 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiAbstractDataWrEnMaybe_3 & ~(|ctrlStateReg))
        abstractDataMem_3 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_71 & auto_tl_in_a_bits_mask[4])
        abstractDataMem_4 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiAbstractDataWrEnMaybe_4 & ~(|ctrlStateReg))
        abstractDataMem_4 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_71 & auto_tl_in_a_bits_mask[5])
        abstractDataMem_5 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiAbstractDataWrEnMaybe_5 & ~(|ctrlStateReg))
        abstractDataMem_5 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_71 & auto_tl_in_a_bits_mask[6])
        abstractDataMem_6 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiAbstractDataWrEnMaybe_6 & ~(|ctrlStateReg))
        abstractDataMem_6 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_71 & auto_tl_in_a_bits_mask[7])
        abstractDataMem_7 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiAbstractDataWrEnMaybe_7 & ~(|ctrlStateReg))
        abstractDataMem_7 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_63 & auto_tl_in_a_bits_mask[0])
        abstractDataMem_8 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiAbstractDataWrEnMaybe_8 & ~(|ctrlStateReg))
        abstractDataMem_8 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_63 & auto_tl_in_a_bits_mask[1])
        abstractDataMem_9 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiAbstractDataWrEnMaybe_9 & ~(|ctrlStateReg))
        abstractDataMem_9 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_63 & auto_tl_in_a_bits_mask[2])
        abstractDataMem_10 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiAbstractDataWrEnMaybe_10 & ~(|ctrlStateReg))
        abstractDataMem_10 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_63 & auto_tl_in_a_bits_mask[3])
        abstractDataMem_11 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiAbstractDataWrEnMaybe_11 & ~(|ctrlStateReg))
        abstractDataMem_11 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_63 & auto_tl_in_a_bits_mask[4])
        abstractDataMem_12 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiAbstractDataWrEnMaybe_12 & ~(|ctrlStateReg))
        abstractDataMem_12 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_63 & auto_tl_in_a_bits_mask[5])
        abstractDataMem_13 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiAbstractDataWrEnMaybe_13 & ~(|ctrlStateReg))
        abstractDataMem_13 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_63 & auto_tl_in_a_bits_mask[6])
        abstractDataMem_14 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiAbstractDataWrEnMaybe_14 & ~(|ctrlStateReg))
        abstractDataMem_14 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_63 & auto_tl_in_a_bits_mask[7])
        abstractDataMem_15 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiAbstractDataWrEnMaybe_15 & ~(|ctrlStateReg))
        abstractDataMem_15 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_188 & auto_tl_in_a_bits_mask[0])
        abstractDataMem_16 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiAbstractDataWrEnMaybe_16 & ~(|ctrlStateReg))
        abstractDataMem_16 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_188 & auto_tl_in_a_bits_mask[1])
        abstractDataMem_17 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiAbstractDataWrEnMaybe_17 & ~(|ctrlStateReg))
        abstractDataMem_17 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_188 & auto_tl_in_a_bits_mask[2])
        abstractDataMem_18 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiAbstractDataWrEnMaybe_18 & ~(|ctrlStateReg))
        abstractDataMem_18 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_188 & auto_tl_in_a_bits_mask[3])
        abstractDataMem_19 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiAbstractDataWrEnMaybe_19 & ~(|ctrlStateReg))
        abstractDataMem_19 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_188 & auto_tl_in_a_bits_mask[4])
        abstractDataMem_20 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiAbstractDataWrEnMaybe_20 & ~(|ctrlStateReg))
        abstractDataMem_20 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_188 & auto_tl_in_a_bits_mask[5])
        abstractDataMem_21 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiAbstractDataWrEnMaybe_21 & ~(|ctrlStateReg))
        abstractDataMem_21 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_188 & auto_tl_in_a_bits_mask[6])
        abstractDataMem_22 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiAbstractDataWrEnMaybe_22 & ~(|ctrlStateReg))
        abstractDataMem_22 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_188 & auto_tl_in_a_bits_mask[7])
        abstractDataMem_23 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiAbstractDataWrEnMaybe_23 & ~(|ctrlStateReg))
        abstractDataMem_23 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_7 & auto_tl_in_a_bits_mask[0])
        abstractDataMem_24 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiAbstractDataWrEnMaybe_24 & ~(|ctrlStateReg))
        abstractDataMem_24 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_7 & auto_tl_in_a_bits_mask[1])
        abstractDataMem_25 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiAbstractDataWrEnMaybe_25 & ~(|ctrlStateReg))
        abstractDataMem_25 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_7 & auto_tl_in_a_bits_mask[2])
        abstractDataMem_26 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiAbstractDataWrEnMaybe_26 & ~(|ctrlStateReg))
        abstractDataMem_26 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_7 & auto_tl_in_a_bits_mask[3])
        abstractDataMem_27 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiAbstractDataWrEnMaybe_27 & ~(|ctrlStateReg))
        abstractDataMem_27 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_7 & auto_tl_in_a_bits_mask[4])
        abstractDataMem_28 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiAbstractDataWrEnMaybe_28 & ~(|ctrlStateReg))
        abstractDataMem_28 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_7 & auto_tl_in_a_bits_mask[5])
        abstractDataMem_29 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiAbstractDataWrEnMaybe_29 & ~(|ctrlStateReg))
        abstractDataMem_29 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_7 & auto_tl_in_a_bits_mask[6])
        abstractDataMem_30 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiAbstractDataWrEnMaybe_30 & ~(|ctrlStateReg))
        abstractDataMem_30 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_7 & auto_tl_in_a_bits_mask[7])
        abstractDataMem_31 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiAbstractDataWrEnMaybe_31 & ~(|ctrlStateReg))
        abstractDataMem_31 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_87 & auto_tl_in_a_bits_mask[0])
        programBufferMem_0 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_0 & ~(|ctrlStateReg))
        programBufferMem_0 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_87 & auto_tl_in_a_bits_mask[1])
        programBufferMem_1 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_1 & ~(|ctrlStateReg))
        programBufferMem_1 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_87 & auto_tl_in_a_bits_mask[2])
        programBufferMem_2 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_2 & ~(|ctrlStateReg))
        programBufferMem_2 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_87 & auto_tl_in_a_bits_mask[3])
        programBufferMem_3 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_3 & ~(|ctrlStateReg))
        programBufferMem_3 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_87 & auto_tl_in_a_bits_mask[4])
        programBufferMem_4 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_4 & ~(|ctrlStateReg))
        programBufferMem_4 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_87 & auto_tl_in_a_bits_mask[5])
        programBufferMem_5 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_5 & ~(|ctrlStateReg))
        programBufferMem_5 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_87 & auto_tl_in_a_bits_mask[6])
        programBufferMem_6 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_6 & ~(|ctrlStateReg))
        programBufferMem_6 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_87 & auto_tl_in_a_bits_mask[7])
        programBufferMem_7 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_7 & ~(|ctrlStateReg))
        programBufferMem_7 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_148 & auto_tl_in_a_bits_mask[0])
        programBufferMem_8 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_8 & ~(|ctrlStateReg))
        programBufferMem_8 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_148 & auto_tl_in_a_bits_mask[1])
        programBufferMem_9 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_9 & ~(|ctrlStateReg))
        programBufferMem_9 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_148 & auto_tl_in_a_bits_mask[2])
        programBufferMem_10 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_10 & ~(|ctrlStateReg))
        programBufferMem_10 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_148 & auto_tl_in_a_bits_mask[3])
        programBufferMem_11 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_11 & ~(|ctrlStateReg))
        programBufferMem_11 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_148 & auto_tl_in_a_bits_mask[4])
        programBufferMem_12 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_12 & ~(|ctrlStateReg))
        programBufferMem_12 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_148 & auto_tl_in_a_bits_mask[5])
        programBufferMem_13 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_13 & ~(|ctrlStateReg))
        programBufferMem_13 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_148 & auto_tl_in_a_bits_mask[6])
        programBufferMem_14 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_14 & ~(|ctrlStateReg))
        programBufferMem_14 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_148 & auto_tl_in_a_bits_mask[7])
        programBufferMem_15 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_15 & ~(|ctrlStateReg))
        programBufferMem_15 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[0])
        programBufferMem_16 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_16 & ~(|ctrlStateReg))
        programBufferMem_16 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[1])
        programBufferMem_17 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_17 & ~(|ctrlStateReg))
        programBufferMem_17 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[2])
        programBufferMem_18 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_18 & ~(|ctrlStateReg))
        programBufferMem_18 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[3])
        programBufferMem_19 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_19 & ~(|ctrlStateReg))
        programBufferMem_19 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[4])
        programBufferMem_20 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_20 & ~(|ctrlStateReg))
        programBufferMem_20 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[5])
        programBufferMem_21 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_21 & ~(|ctrlStateReg))
        programBufferMem_21 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[6])
        programBufferMem_22 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_22 & ~(|ctrlStateReg))
        programBufferMem_22 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_39 & auto_tl_in_a_bits_mask[7])
        programBufferMem_23 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_23 & ~(|ctrlStateReg))
        programBufferMem_23 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_103 & auto_tl_in_a_bits_mask[0])
        programBufferMem_24 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_24 & ~(|ctrlStateReg))
        programBufferMem_24 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_103 & auto_tl_in_a_bits_mask[1])
        programBufferMem_25 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_25 & ~(|ctrlStateReg))
        programBufferMem_25 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_103 & auto_tl_in_a_bits_mask[2])
        programBufferMem_26 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_26 & ~(|ctrlStateReg))
        programBufferMem_26 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_103 & auto_tl_in_a_bits_mask[3])
        programBufferMem_27 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_27 & ~(|ctrlStateReg))
        programBufferMem_27 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_103 & auto_tl_in_a_bits_mask[4])
        programBufferMem_28 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_28 & ~(|ctrlStateReg))
        programBufferMem_28 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_103 & auto_tl_in_a_bits_mask[5])
        programBufferMem_29 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_29 & ~(|ctrlStateReg))
        programBufferMem_29 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_103 & auto_tl_in_a_bits_mask[6])
        programBufferMem_30 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_30 & ~(|ctrlStateReg))
        programBufferMem_30 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_103 & auto_tl_in_a_bits_mask[7])
        programBufferMem_31 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_31 & ~(|ctrlStateReg))
        programBufferMem_31 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_172 & auto_tl_in_a_bits_mask[0])
        programBufferMem_32 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_32 & ~(|ctrlStateReg))
        programBufferMem_32 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_172 & auto_tl_in_a_bits_mask[1])
        programBufferMem_33 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_33 & ~(|ctrlStateReg))
        programBufferMem_33 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_172 & auto_tl_in_a_bits_mask[2])
        programBufferMem_34 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_34 & ~(|ctrlStateReg))
        programBufferMem_34 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_172 & auto_tl_in_a_bits_mask[3])
        programBufferMem_35 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_35 & ~(|ctrlStateReg))
        programBufferMem_35 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_172 & auto_tl_in_a_bits_mask[4])
        programBufferMem_36 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_36 & ~(|ctrlStateReg))
        programBufferMem_36 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_172 & auto_tl_in_a_bits_mask[5])
        programBufferMem_37 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_37 & ~(|ctrlStateReg))
        programBufferMem_37 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_172 & auto_tl_in_a_bits_mask[6])
        programBufferMem_38 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_38 & ~(|ctrlStateReg))
        programBufferMem_38 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_172 & auto_tl_in_a_bits_mask[7])
        programBufferMem_39 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_39 & ~(|ctrlStateReg))
        programBufferMem_39 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_130 & auto_tl_in_a_bits_mask[0])
        programBufferMem_40 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_40 & ~(|ctrlStateReg))
        programBufferMem_40 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_130 & auto_tl_in_a_bits_mask[1])
        programBufferMem_41 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_41 & ~(|ctrlStateReg))
        programBufferMem_41 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_130 & auto_tl_in_a_bits_mask[2])
        programBufferMem_42 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_42 & ~(|ctrlStateReg))
        programBufferMem_42 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_130 & auto_tl_in_a_bits_mask[3])
        programBufferMem_43 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_43 & ~(|ctrlStateReg))
        programBufferMem_43 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_130 & auto_tl_in_a_bits_mask[4])
        programBufferMem_44 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_44 & ~(|ctrlStateReg))
        programBufferMem_44 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_130 & auto_tl_in_a_bits_mask[5])
        programBufferMem_45 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_45 & ~(|ctrlStateReg))
        programBufferMem_45 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_130 & auto_tl_in_a_bits_mask[6])
        programBufferMem_46 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_46 & ~(|ctrlStateReg))
        programBufferMem_46 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_130 & auto_tl_in_a_bits_mask[7])
        programBufferMem_47 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_47 & ~(|ctrlStateReg))
        programBufferMem_47 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_23 & auto_tl_in_a_bits_mask[0])
        programBufferMem_48 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_48 & ~(|ctrlStateReg))
        programBufferMem_48 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_23 & auto_tl_in_a_bits_mask[1])
        programBufferMem_49 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_49 & ~(|ctrlStateReg))
        programBufferMem_49 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_23 & auto_tl_in_a_bits_mask[2])
        programBufferMem_50 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_50 & ~(|ctrlStateReg))
        programBufferMem_50 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_23 & auto_tl_in_a_bits_mask[3])
        programBufferMem_51 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_51 & ~(|ctrlStateReg))
        programBufferMem_51 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_23 & auto_tl_in_a_bits_mask[4])
        programBufferMem_52 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_52 & ~(|ctrlStateReg))
        programBufferMem_52 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_23 & auto_tl_in_a_bits_mask[5])
        programBufferMem_53 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_53 & ~(|ctrlStateReg))
        programBufferMem_53 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_23 & auto_tl_in_a_bits_mask[6])
        programBufferMem_54 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_54 & ~(|ctrlStateReg))
        programBufferMem_54 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_23 & auto_tl_in_a_bits_mask[7])
        programBufferMem_55 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_55 & ~(|ctrlStateReg))
        programBufferMem_55 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_111 & auto_tl_in_a_bits_mask[0])
        programBufferMem_56 <= auto_tl_in_a_bits_data[7:0];
      else if (dmiProgramBufferWrEnMaybe_56 & ~(|ctrlStateReg))
        programBufferMem_56 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_111 & auto_tl_in_a_bits_mask[1])
        programBufferMem_57 <= auto_tl_in_a_bits_data[15:8];
      else if (dmiProgramBufferWrEnMaybe_57 & ~(|ctrlStateReg))
        programBufferMem_57 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_111 & auto_tl_in_a_bits_mask[2])
        programBufferMem_58 <= auto_tl_in_a_bits_data[23:16];
      else if (dmiProgramBufferWrEnMaybe_58 & ~(|ctrlStateReg))
        programBufferMem_58 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_111 & auto_tl_in_a_bits_mask[3])
        programBufferMem_59 <= auto_tl_in_a_bits_data[31:24];
      else if (dmiProgramBufferWrEnMaybe_59 & ~(|ctrlStateReg))
        programBufferMem_59 <= auto_dmi_in_a_bits_data[31:24];
      if (out_woready_1_111 & auto_tl_in_a_bits_mask[4])
        programBufferMem_60 <= auto_tl_in_a_bits_data[39:32];
      else if (dmiProgramBufferWrEnMaybe_60 & ~(|ctrlStateReg))
        programBufferMem_60 <= auto_dmi_in_a_bits_data[7:0];
      if (out_woready_1_111 & auto_tl_in_a_bits_mask[5])
        programBufferMem_61 <= auto_tl_in_a_bits_data[47:40];
      else if (dmiProgramBufferWrEnMaybe_61 & ~(|ctrlStateReg))
        programBufferMem_61 <= auto_dmi_in_a_bits_data[15:8];
      if (out_woready_1_111 & auto_tl_in_a_bits_mask[6])
        programBufferMem_62 <= auto_tl_in_a_bits_data[55:48];
      else if (dmiProgramBufferWrEnMaybe_62 & ~(|ctrlStateReg))
        programBufferMem_62 <= auto_dmi_in_a_bits_data[23:16];
      if (out_woready_1_111 & auto_tl_in_a_bits_mask[7])
        programBufferMem_63 <= auto_tl_in_a_bits_data[63:56];
      else if (dmiProgramBufferWrEnMaybe_63 & ~(|ctrlStateReg))
        programBufferMem_63 <= auto_dmi_in_a_bits_data[31:24];
      if (|ctrlStateReg) begin
        if (_GEN_1)
          ctrlStateReg <= {~_GEN_2, 1'h0};
        else if (_GEN_3 & (hartExceptionWrEn | ~goReg & hartHaltedWrEn & auto_tl_in_a_bits_data[9:0] == {9'h0, selectedHartReg}))
          ctrlStateReg <= 2'h0;
      end
      else if (_GEN_6)
        ctrlStateReg <= 2'h1;
    end
    else begin
      haltedBitRegs <= 2'h0;
      resumeReqRegs <= 2'h0;
      haveResetBitRegs <= 2'h0;
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
    selectedHartReg <= io_dmactive & (io_innerCtrl_valid ? io_innerCtrl_bits_hartsel[0] : selectedHartReg);
    hamaskReg_0 <= io_dmactive & (io_innerCtrl_valid ? io_innerCtrl_bits_hasel & io_innerCtrl_bits_hamask_0 : hamaskReg_0);
    hamaskReg_1 <= io_dmactive & (io_innerCtrl_valid ? io_innerCtrl_bits_hasel & io_innerCtrl_bits_hamask_1 : hamaskReg_1);
    goReg <= io_dmactive & (goAbstract | ~hartGoingWrEn & goReg);
    if (goAbstract) begin
      abstractGeneratedMem_0 <= COMMANDReg_control[17] ? (COMMANDReg_control[16] ? {17'h7000, COMMANDReg_control[22:20], COMMANDReg_control[4:0], 7'h3} : {7'h1C, COMMANDReg_control[4:0], 5'h0, COMMANDReg_control[22:20], 12'h23}) : 32'h13;
      abstractGeneratedMem_1 <= COMMANDReg_control[18] ? 32'h13 : 32'h100073;
    end
    if (reset) begin
      hrmaskReg_0 <= 1'h0;
      hrmaskReg_1 <= 1'h0;
    end
    else begin
      hrmaskReg_0 <= io_dmactive & (io_innerCtrl_valid ? io_innerCtrl_bits_hrmask_0 : hrmaskReg_0);
      hrmaskReg_1 <= io_dmactive & (io_innerCtrl_valid ? io_innerCtrl_bits_hrmask_1 : hrmaskReg_1);
    end
  end // always @(posedge)
  wire          _GEN_7 = _out_wofireMux_T_2 & auto_dmi_in_a_bits_address[7:2] == 6'h32 & ~(auto_dmi_in_a_bits_address[8]) & auto_dmi_in_a_bits_mask[0] & auto_dmi_in_a_bits_data[1] & ~(auto_dmi_in_a_bits_data[0]);
  wire          _GEN_8 = auto_dmi_in_a_bits_data[6:2] < 5'h2;
  wire [9:0]    _hgHartFiring_1_T = {8'h0, haltedBitRegs} >> auto_tl_in_a_bits_data[9:0];
  always @(posedge clock or posedge reset) begin
    if (reset) begin
      hrDebugIntReg_0 <= 1'h0;
      hrDebugIntReg_1 <= 1'h0;
      hgParticipateHart_0 <= 1'h0;
      hgParticipateHart_1 <= 1'h0;
      hgFired_1 <= 1'h0;
    end
    else begin
      hrDebugIntReg_0 <= io_dmactive & hrmaskReg_0 & (_hartIsInResetSync_0_debug_hartReset_0_io_q | hrDebugIntReg_0 & ~(haltedBitRegs[0]));
      hrDebugIntReg_1 <= io_dmactive & hrmaskReg_1 & (_hartIsInResetSync_1_debug_hartReset_1_io_q | hrDebugIntReg_1 & ~(haltedBitRegs[1]));
      hgParticipateHart_0 <= io_dmactive & (_GEN_7 & hamaskFull_0 & _GEN_8 ? auto_dmi_in_a_bits_data[2] : hgParticipateHart_0);
      hgParticipateHart_1 <= io_dmactive & (_GEN_7 & hamaskFull_1 & _GEN_8 ? auto_dmi_in_a_bits_data[2] : hgParticipateHart_1);
      hgFired_1 <= io_dmactive & (~hgFired_1 & hartHaltedWrEn & ~(_hgHartFiring_1_T[0]) & (auto_tl_in_a_bits_data[0] ? hgParticipateHart_1 : hgParticipateHart_0) | ~(hgFired_1 & (haltedBitRegs[0] | ~hgParticipateHart_0) & (haltedBitRegs[1] | ~hgParticipateHart_1)) & hgFired_1);
    end
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      if (reset) begin
        hrDebugIntReg_0 = 1'h0;
        hrDebugIntReg_1 = 1'h0;
        hgParticipateHart_0 = 1'h0;
        hgParticipateHart_1 = 1'h0;
        hgFired_1 = 1'h0;
      end
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  TLMonitor_59 monitor (
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
  TLMonitor_60 monitor_1 (
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
  AsyncResetSynchronizerShiftReg_w1_d3_i0_128 hartIsInResetSync_0_debug_hartReset_0 (
    .clock (clock),
    .reset (reset),
    .io_d  (io_hartIsInReset_0),
    .io_q  (_hartIsInResetSync_0_debug_hartReset_0_io_q)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0_128 hartIsInResetSync_1_debug_hartReset_1 (
    .clock (clock),
    .reset (reset),
    .io_d  (io_hartIsInReset_1),
    .io_q  (_hartIsInResetSync_1_debug_hartReset_1_io_q)
  );
  assign auto_tl_in_a_ready = auto_tl_in_d_ready;
  assign auto_tl_in_d_valid = auto_tl_in_a_valid;
  assign auto_tl_in_d_bits_opcode = tlNodeIn_d_bits_opcode;
  assign auto_tl_in_d_bits_size = auto_tl_in_a_bits_size;
  assign auto_tl_in_d_bits_source = auto_tl_in_a_bits_source;
  assign auto_tl_in_d_bits_data =
    ~(_out_out_bits_data_T_91 | out_oindex_1 == 8'h1 | out_oindex_1 == 8'h20 | out_oindex_1 == 8'h27 | out_oindex_1 == 8'h28 | out_oindex_1 == 8'h29 | out_oindex_1 == 8'h2A | out_oindex_1 == 8'h2B | out_oindex_1 == 8'h2C | out_oindex_1 == 8'h2D | out_oindex_1 == 8'h2E | out_oindex_1 == 8'h2F | out_oindex_1 == 8'h30 | out_oindex_1 == 8'h31 | out_oindex_1 == 8'h32 | out_oindex_1 == 8'h33 ? auto_tl_in_a_bits_address[8] : ~(out_oindex_1 == 8'h40 | out_oindex_1 == 8'h80 | out_oindex_1 == 8'h81 | out_oindex_1 == 8'h82 | out_oindex_1 == 8'h83 | out_oindex_1 == 8'h84 | out_oindex_1 == 8'h85 | out_oindex_1 == 8'h86 | out_oindex_1 == 8'h87 | out_oindex_1 == 8'h88 | out_oindex_1 == 8'h89 | out_oindex_1 == 8'h8A) | ~(auto_tl_in_a_bits_address[8])) | _out_out_bits_data_T_91 | out_oindex_1 == 8'h1
      ? 64'h0
      : out_oindex_1 == 8'h20
          ? 64'h380006F
          : out_oindex_1 == 8'h27
              ? {abstractGeneratedMem_1, abstractGeneratedMem_0}
              : out_oindex_1 == 8'h28
                  ? {programBufferMem_7, programBufferMem_6, programBufferMem_5, programBufferMem_4, programBufferMem_3, programBufferMem_2, programBufferMem_1, programBufferMem_0}
                  : out_oindex_1 == 8'h29
                      ? {programBufferMem_15, programBufferMem_14, programBufferMem_13, programBufferMem_12, programBufferMem_11, programBufferMem_10, programBufferMem_9, programBufferMem_8}
                      : out_oindex_1 == 8'h2A
                          ? {programBufferMem_23, programBufferMem_22, programBufferMem_21, programBufferMem_20, programBufferMem_19, programBufferMem_18, programBufferMem_17, programBufferMem_16}
                          : out_oindex_1 == 8'h2B
                              ? {programBufferMem_31, programBufferMem_30, programBufferMem_29, programBufferMem_28, programBufferMem_27, programBufferMem_26, programBufferMem_25, programBufferMem_24}
                              : out_oindex_1 == 8'h2C
                                  ? {programBufferMem_39, programBufferMem_38, programBufferMem_37, programBufferMem_36, programBufferMem_35, programBufferMem_34, programBufferMem_33, programBufferMem_32}
                                  : out_oindex_1 == 8'h2D ? {programBufferMem_47, programBufferMem_46, programBufferMem_45, programBufferMem_44, programBufferMem_43, programBufferMem_42, programBufferMem_41, programBufferMem_40} : out_oindex_1 == 8'h2E ? {programBufferMem_55, programBufferMem_54, programBufferMem_53, programBufferMem_52, programBufferMem_51, programBufferMem_50, programBufferMem_49, programBufferMem_48} : out_oindex_1 == 8'h2F ? {programBufferMem_63, programBufferMem_62, programBufferMem_61, programBufferMem_60, programBufferMem_59, programBufferMem_58, programBufferMem_57, programBufferMem_56} : out_oindex_1 == 8'h30 ? {abstractDataMem_7, abstractDataMem_6, abstractDataMem_5, abstractDataMem_4, abstractDataMem_3, abstractDataMem_2, abstractDataMem_1, abstractDataMem_0} : out_oindex_1 == 8'h31 ? {abstractDataMem_15, abstractDataMem_14, abstractDataMem_13, abstractDataMem_12, abstractDataMem_11, abstractDataMem_10, abstractDataMem_9, abstractDataMem_8} : out_oindex_1 == 8'h32 ? {abstractDataMem_23, abstractDataMem_22, abstractDataMem_21, abstractDataMem_20, abstractDataMem_19, abstractDataMem_18, abstractDataMem_17, abstractDataMem_16} : out_oindex_1 == 8'h33 ? {abstractDataMem_31, abstractDataMem_30, abstractDataMem_29, abstractDataMem_28, abstractDataMem_27, abstractDataMem_26, abstractDataMem_25, abstractDataMem_24} : out_oindex_1 == 8'h40 ? {54'h0, resumeReqRegs[1], selectedHartReg & goReg, 6'h0, resumeReqRegs[0], ~selectedHartReg & goReg} : out_oindex_1 == 8'h80 ? 64'h380006F00C0006F : out_oindex_1 == 8'h81 ? 64'hFF0000F0440006F : out_oindex_1 == 8'h82 ? 64'hF14024737B241073 : out_oindex_1 == 8'h83 ? 64'h4004440310802023 : out_oindex_1 == 8'h84 ? 64'hFE0408E300347413 : out_oindex_1 == 8'h85 ? 64'h4086300147413 : out_oindex_1 == 8'h86 ? 64'h100022237B202473 : out_oindex_1 == 8'h87 ? 64'hF140247330000067 : out_oindex_1 == 8'h88 ? 64'h7B20247310802423 : out_oindex_1 == 8'h89 ? 64'h100026237B200073 : {32'h0, out_oindex_1 == 8'h8A ? 32'h100073 : 32'h0};
  assign auto_dmi_in_a_ready = auto_dmi_in_d_ready;
  assign auto_dmi_in_d_valid = auto_dmi_in_a_valid;
  assign auto_dmi_in_d_bits_opcode = dmiNodeIn_d_bits_opcode;
  assign auto_dmi_in_d_bits_size = auto_dmi_in_a_bits_size;
  assign auto_dmi_in_d_bits_source = auto_dmi_in_a_bits_source;
  assign auto_dmi_in_d_bits_data =
    (_out_out_bits_data_T_31 ? auto_dmi_in_a_bits_address[8] : ~(auto_dmi_in_a_bits_address[7:2] == 6'h4 | auto_dmi_in_a_bits_address[7:2] == 6'h5 | auto_dmi_in_a_bits_address[7:2] == 6'h6 | auto_dmi_in_a_bits_address[7:2] == 6'h7 | auto_dmi_in_a_bits_address[7:2] == 6'h8 | auto_dmi_in_a_bits_address[7:2] == 6'h9 | auto_dmi_in_a_bits_address[7:2] == 6'hA | auto_dmi_in_a_bits_address[7:2] == 6'hB | auto_dmi_in_a_bits_address[7:2] == 6'h11 | auto_dmi_in_a_bits_address[7:2] == 6'h13 | auto_dmi_in_a_bits_address[7:2] == 6'h16 | auto_dmi_in_a_bits_address[7:2] == 6'h17 | auto_dmi_in_a_bits_address[7:2] == 6'h18 | auto_dmi_in_a_bits_address[7:2] == 6'h20 | auto_dmi_in_a_bits_address[7:2] == 6'h21 | auto_dmi_in_a_bits_address[7:2] == 6'h22 | auto_dmi_in_a_bits_address[7:2] == 6'h23 | auto_dmi_in_a_bits_address[7:2] == 6'h24 | auto_dmi_in_a_bits_address[7:2] == 6'h25 | auto_dmi_in_a_bits_address[7:2] == 6'h26 | auto_dmi_in_a_bits_address[7:2] == 6'h27 | auto_dmi_in_a_bits_address[7:2] == 6'h28 | auto_dmi_in_a_bits_address[7:2] == 6'h29 | auto_dmi_in_a_bits_address[7:2] == 6'h2A | auto_dmi_in_a_bits_address[7:2] == 6'h2B | auto_dmi_in_a_bits_address[7:2] == 6'h2C | auto_dmi_in_a_bits_address[7:2] == 6'h2D | auto_dmi_in_a_bits_address[7:2] == 6'h2E | auto_dmi_in_a_bits_address[7:2] == 6'h2F | auto_dmi_in_a_bits_address[7:2] == 6'h32) | ~(auto_dmi_in_a_bits_address[8]))
      ? (_out_out_bits_data_T_31
           ? {30'h0, haltedBitRegs}
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
                                               ? {12'h0, (haveResetBitRegs[0] | ~hamaskFull_0) & (haveResetBitRegs[1] | ~hamaskFull_1), haveResetBitRegs[0] & hamaskFull_0 | haveResetBitRegs[1] & hamaskFull_1, (resumeAcks[0] | ~hamaskFull_0) & (resumeAcks[1] | ~hamaskFull_1), resumeAcks[0] & hamaskFull_0 | resumeAcks[1] & hamaskFull_1, 2'h0, ~hamaskFull_0 & ~hamaskFull_1, 1'h0, (~(haltedBitRegs[0]) | ~hamaskFull_0) & (~(haltedBitRegs[1]) | ~hamaskFull_1), ~(haltedBitRegs[0]) & hamaskFull_0 | ~(haltedBitRegs[1]) & hamaskFull_1, (haltedBitRegs[0] | ~hamaskFull_0) & (haltedBitRegs[1] | ~hamaskFull_1), haltedBitRegs[0] & hamaskFull_0 | haltedBitRegs[1] & hamaskFull_1, 8'hA2}
                                               : auto_dmi_in_a_bits_address[7:2] == 6'h13
                                                   ? {31'h0, |haltedBitRegs}
                                                   : auto_dmi_in_a_bits_address[7:2] == 6'h16
                                                       ? {19'h8000, abstractCommandBusy, 1'h0, ABSTRACTCSReg_cmderr, 8'h8}
                                                       : auto_dmi_in_a_bits_address[7:2] == 6'h17
                                                           ? {COMMANDReg_cmdtype, COMMANDReg_control}
                                                           : auto_dmi_in_a_bits_address[7:2] == 6'h18
                                                               ? {ABSTRACTAUTOReg_autoexecprogbuf, 8'h0, ABSTRACTAUTOReg_autoexecdata[7:0]}
                                                               : auto_dmi_in_a_bits_address[7:2] == 6'h20
                                                                   ? {programBufferMem_3, programBufferMem_2, programBufferMem_1, programBufferMem_0}
                                                                   : auto_dmi_in_a_bits_address[7:2] == 6'h21
                                                                       ? {programBufferMem_7, programBufferMem_6, programBufferMem_5, programBufferMem_4}
                                                                       : auto_dmi_in_a_bits_address[7:2] == 6'h22 ? {programBufferMem_11, programBufferMem_10, programBufferMem_9, programBufferMem_8} : auto_dmi_in_a_bits_address[7:2] == 6'h23 ? {programBufferMem_15, programBufferMem_14, programBufferMem_13, programBufferMem_12} : auto_dmi_in_a_bits_address[7:2] == 6'h24 ? {programBufferMem_19, programBufferMem_18, programBufferMem_17, programBufferMem_16} : auto_dmi_in_a_bits_address[7:2] == 6'h25 ? {programBufferMem_23, programBufferMem_22, programBufferMem_21, programBufferMem_20} : auto_dmi_in_a_bits_address[7:2] == 6'h26 ? {programBufferMem_27, programBufferMem_26, programBufferMem_25, programBufferMem_24} : auto_dmi_in_a_bits_address[7:2] == 6'h27 ? {programBufferMem_31, programBufferMem_30, programBufferMem_29, programBufferMem_28} : auto_dmi_in_a_bits_address[7:2] == 6'h28 ? {programBufferMem_35, programBufferMem_34, programBufferMem_33, programBufferMem_32} : auto_dmi_in_a_bits_address[7:2] == 6'h29 ? {programBufferMem_39, programBufferMem_38, programBufferMem_37, programBufferMem_36} : auto_dmi_in_a_bits_address[7:2] == 6'h2A ? {programBufferMem_43, programBufferMem_42, programBufferMem_41, programBufferMem_40} : auto_dmi_in_a_bits_address[7:2] == 6'h2B ? {programBufferMem_47, programBufferMem_46, programBufferMem_45, programBufferMem_44} : auto_dmi_in_a_bits_address[7:2] == 6'h2C ? {programBufferMem_51, programBufferMem_50, programBufferMem_49, programBufferMem_48} : auto_dmi_in_a_bits_address[7:2] == 6'h2D ? {programBufferMem_55, programBufferMem_54, programBufferMem_53, programBufferMem_52} : auto_dmi_in_a_bits_address[7:2] == 6'h2E ? {programBufferMem_59, programBufferMem_58, programBufferMem_57, programBufferMem_56} : auto_dmi_in_a_bits_address[7:2] == 6'h2F ? {programBufferMem_63, programBufferMem_62, programBufferMem_61, programBufferMem_60} : {21'h0, auto_dmi_in_a_bits_address[7:2] == 6'h32 ? {8'h0, selectedHartReg ? hgParticipateHart_1 : hgParticipateHart_0, 2'h0} : 11'h0})
      : 32'h0;
  assign io_hgDebugInt_0 = hgParticipateHart_0 & hgFired_1 | hrDebugIntReg_0;
  assign io_hgDebugInt_1 = hgParticipateHart_1 & hgFired_1 | hrDebugIntReg_1;
endmodule

