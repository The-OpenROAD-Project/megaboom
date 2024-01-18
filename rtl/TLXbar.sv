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

module TLXbar(
  input         clock,
                reset,
  output        auto_in_2_a_ready,
  input         auto_in_2_a_valid,
  input  [2:0]  auto_in_2_a_bits_opcode,
                auto_in_2_a_bits_param,
  input  [3:0]  auto_in_2_a_bits_size,
  input  [4:0]  auto_in_2_a_bits_source,
  input  [32:0] auto_in_2_a_bits_address,
  input  [7:0]  auto_in_2_a_bits_mask,
  input  [63:0] auto_in_2_a_bits_data,
  input         auto_in_2_a_bits_corrupt,
                auto_in_2_b_ready,
  output        auto_in_2_b_valid,
  output [1:0]  auto_in_2_b_bits_param,
  output [4:0]  auto_in_2_b_bits_source,
  output [32:0] auto_in_2_b_bits_address,
  output        auto_in_2_c_ready,
  input         auto_in_2_c_valid,
  input  [2:0]  auto_in_2_c_bits_opcode,
                auto_in_2_c_bits_param,
  input  [3:0]  auto_in_2_c_bits_size,
  input  [4:0]  auto_in_2_c_bits_source,
  input  [32:0] auto_in_2_c_bits_address,
  input  [63:0] auto_in_2_c_bits_data,
  input         auto_in_2_c_bits_corrupt,
                auto_in_2_d_ready,
  output        auto_in_2_d_valid,
  output [2:0]  auto_in_2_d_bits_opcode,
  output [1:0]  auto_in_2_d_bits_param,
  output [3:0]  auto_in_2_d_bits_size,
  output [4:0]  auto_in_2_d_bits_source,
  output [2:0]  auto_in_2_d_bits_sink,
  output        auto_in_2_d_bits_denied,
  output [63:0] auto_in_2_d_bits_data,
  output        auto_in_2_d_bits_corrupt,
                auto_in_2_e_ready,
  input         auto_in_2_e_valid,
  input  [2:0]  auto_in_2_e_bits_sink,
  output        auto_in_1_a_ready,
  input         auto_in_1_a_valid,
  input  [2:0]  auto_in_1_a_bits_opcode,
                auto_in_1_a_bits_param,
  input  [3:0]  auto_in_1_a_bits_size,
  input  [4:0]  auto_in_1_a_bits_source,
  input  [32:0] auto_in_1_a_bits_address,
  input  [7:0]  auto_in_1_a_bits_mask,
  input  [63:0] auto_in_1_a_bits_data,
  input         auto_in_1_a_bits_corrupt,
                auto_in_1_b_ready,
  output        auto_in_1_b_valid,
  output [1:0]  auto_in_1_b_bits_param,
  output [4:0]  auto_in_1_b_bits_source,
  output [32:0] auto_in_1_b_bits_address,
  output        auto_in_1_c_ready,
  input         auto_in_1_c_valid,
  input  [2:0]  auto_in_1_c_bits_opcode,
                auto_in_1_c_bits_param,
  input  [3:0]  auto_in_1_c_bits_size,
  input  [4:0]  auto_in_1_c_bits_source,
  input  [32:0] auto_in_1_c_bits_address,
  input  [63:0] auto_in_1_c_bits_data,
  input         auto_in_1_c_bits_corrupt,
                auto_in_1_d_ready,
  output        auto_in_1_d_valid,
  output [2:0]  auto_in_1_d_bits_opcode,
  output [1:0]  auto_in_1_d_bits_param,
  output [3:0]  auto_in_1_d_bits_size,
  output [4:0]  auto_in_1_d_bits_source,
  output [2:0]  auto_in_1_d_bits_sink,
  output        auto_in_1_d_bits_denied,
  output [63:0] auto_in_1_d_bits_data,
  output        auto_in_1_d_bits_corrupt,
                auto_in_1_e_ready,
  input         auto_in_1_e_valid,
  input  [2:0]  auto_in_1_e_bits_sink,
  output        auto_in_0_a_ready,
  input         auto_in_0_a_valid,
  input  [2:0]  auto_in_0_a_bits_opcode,
                auto_in_0_a_bits_param,
  input  [3:0]  auto_in_0_a_bits_size,
                auto_in_0_a_bits_source,
  input  [32:0] auto_in_0_a_bits_address,
  input  [7:0]  auto_in_0_a_bits_mask,
  input  [63:0] auto_in_0_a_bits_data,
  input         auto_in_0_a_bits_corrupt,
                auto_in_0_d_ready,
  output        auto_in_0_d_valid,
  output [2:0]  auto_in_0_d_bits_opcode,
  output [1:0]  auto_in_0_d_bits_param,
  output [3:0]  auto_in_0_d_bits_size,
                auto_in_0_d_bits_source,
  output [2:0]  auto_in_0_d_bits_sink,
  output        auto_in_0_d_bits_denied,
  output [63:0] auto_in_0_d_bits_data,
  output        auto_in_0_d_bits_corrupt,
  input         auto_out_1_a_ready,
  output        auto_out_1_a_valid,
  output [2:0]  auto_out_1_a_bits_opcode,
                auto_out_1_a_bits_param,
                auto_out_1_a_bits_size,
  output [6:0]  auto_out_1_a_bits_source,
  output [32:0] auto_out_1_a_bits_address,
  output [7:0]  auto_out_1_a_bits_mask,
  output [63:0] auto_out_1_a_bits_data,
  output        auto_out_1_a_bits_corrupt,
                auto_out_1_b_ready,
  input         auto_out_1_b_valid,
  input  [1:0]  auto_out_1_b_bits_param,
  input  [6:0]  auto_out_1_b_bits_source,
  input  [32:0] auto_out_1_b_bits_address,
  input         auto_out_1_c_ready,
  output        auto_out_1_c_valid,
  output [2:0]  auto_out_1_c_bits_opcode,
                auto_out_1_c_bits_param,
                auto_out_1_c_bits_size,
  output [6:0]  auto_out_1_c_bits_source,
  output [32:0] auto_out_1_c_bits_address,
  output [63:0] auto_out_1_c_bits_data,
  output        auto_out_1_c_bits_corrupt,
                auto_out_1_d_ready,
  input         auto_out_1_d_valid,
  input  [2:0]  auto_out_1_d_bits_opcode,
  input  [1:0]  auto_out_1_d_bits_param,
  input  [2:0]  auto_out_1_d_bits_size,
  input  [6:0]  auto_out_1_d_bits_source,
  input  [2:0]  auto_out_1_d_bits_sink,
  input         auto_out_1_d_bits_denied,
  input  [63:0] auto_out_1_d_bits_data,
  input         auto_out_1_d_bits_corrupt,
  output        auto_out_1_e_valid,
  output [2:0]  auto_out_1_e_bits_sink,
  input         auto_out_0_a_ready,
  output        auto_out_0_a_valid,
  output [2:0]  auto_out_0_a_bits_opcode,
                auto_out_0_a_bits_param,
  output [3:0]  auto_out_0_a_bits_size,
  output [6:0]  auto_out_0_a_bits_source,
  output [27:0] auto_out_0_a_bits_address,
  output [7:0]  auto_out_0_a_bits_mask,
  output [63:0] auto_out_0_a_bits_data,
  output        auto_out_0_a_bits_corrupt,
                auto_out_0_d_ready,
  input         auto_out_0_d_valid,
  input  [2:0]  auto_out_0_d_bits_opcode,
  input  [1:0]  auto_out_0_d_bits_param,
  input  [3:0]  auto_out_0_d_bits_size,
  input  [6:0]  auto_out_0_d_bits_source,
  input         auto_out_0_d_bits_sink,
                auto_out_0_d_bits_denied,
  input  [63:0] auto_out_0_d_bits_data,
  input         auto_out_0_d_bits_corrupt
);

  wire        allowed_6_1;
  wire        allowed_6_0;
  wire        allowed_5_1;
  wire        allowed_5_0;
  wire        allowed_4_1;
  wire        allowed_4_0;
  wire        allowed_1_2;
  wire        allowed_1_1;
  wire        allowed_1_0;
  wire        allowed_2;
  wire        allowed_1;
  wire        allowed_0;
  wire [6:0]  portsAOI_filtered_1_bits_source = {3'h4, auto_in_0_a_bits_source};
  wire [6:0]  portsAOI_filtered_1_1_bits_source = {2'h1, auto_in_1_a_bits_source};
  wire [6:0]  portsAOI_filtered_2_1_bits_source = {2'h0, auto_in_2_a_bits_source};
  wire [2:0]  portsDIO_filtered_2_bits_sink = {2'h0, auto_out_0_d_bits_sink};
  wire [3:0]  portsDIO_filtered_1_2_bits_size = {1'h0, auto_out_1_d_bits_size};
  wire        requestAIO_0_0 = {auto_in_0_a_bits_address[32:31], auto_in_0_a_bits_address[27:26]} == 4'h0 | {auto_in_0_a_bits_address[32:31], auto_in_0_a_bits_address[27:26], ~(auto_in_0_a_bits_address[16]), auto_in_0_a_bits_address[12]} == 6'h0 | {auto_in_0_a_bits_address[32:31], ~(auto_in_0_a_bits_address[27:26])} == 4'h0;
  wire        requestAIO_0_1 = {auto_in_0_a_bits_address[32:31], auto_in_0_a_bits_address[27:26] ^ 2'h2, auto_in_0_a_bits_address[16]} == 5'h0 | {auto_in_0_a_bits_address[32], ~(auto_in_0_a_bits_address[31])} == 2'h0 | auto_in_0_a_bits_address[32:31] == 2'h2;
  wire        requestAIO_1_0 = {auto_in_1_a_bits_address[32:31], auto_in_1_a_bits_address[27:26]} == 4'h0 | {auto_in_1_a_bits_address[32:31], auto_in_1_a_bits_address[27:26], ~(auto_in_1_a_bits_address[16]), auto_in_1_a_bits_address[12]} == 6'h0 | {auto_in_1_a_bits_address[32:31], ~(auto_in_1_a_bits_address[27:26])} == 4'h0;
  wire        requestAIO_1_1 = {auto_in_1_a_bits_address[32:31], auto_in_1_a_bits_address[27:26] ^ 2'h2, auto_in_1_a_bits_address[16]} == 5'h0 | {auto_in_1_a_bits_address[32], ~(auto_in_1_a_bits_address[31])} == 2'h0 | auto_in_1_a_bits_address[32:31] == 2'h2;
  wire        requestAIO_2_0 = {auto_in_2_a_bits_address[32:31], auto_in_2_a_bits_address[27:26]} == 4'h0 | {auto_in_2_a_bits_address[32:31], auto_in_2_a_bits_address[27:26], ~(auto_in_2_a_bits_address[16]), auto_in_2_a_bits_address[12]} == 6'h0 | {auto_in_2_a_bits_address[32:31], ~(auto_in_2_a_bits_address[27:26])} == 4'h0;
  wire        requestAIO_2_1 = {auto_in_2_a_bits_address[32:31], auto_in_2_a_bits_address[27:26] ^ 2'h2, auto_in_2_a_bits_address[16]} == 5'h0 | {auto_in_2_a_bits_address[32], ~(auto_in_2_a_bits_address[31])} == 2'h0 | auto_in_2_a_bits_address[32:31] == 2'h2;
  wire        requestBOI_1_1 = auto_out_1_b_bits_source[6:5] == 2'h1;
  wire        requestBOI_1_2 = auto_out_1_b_bits_source[6:5] == 2'h0;
  wire        requestDOI_0_0 = auto_out_0_d_bits_source[6:4] == 3'h4;
  wire        requestDOI_0_1 = auto_out_0_d_bits_source[6:5] == 2'h1;
  wire        requestDOI_0_2 = auto_out_0_d_bits_source[6:5] == 2'h0;
  wire        requestDOI_1_0 = auto_out_1_d_bits_source[6:4] == 3'h4;
  wire        requestDOI_1_1 = auto_out_1_d_bits_source[6:5] == 2'h1;
  wire        requestDOI_1_2 = auto_out_1_d_bits_source[6:5] == 2'h0;
  wire        portsAOI_filtered_0_valid = auto_in_0_a_valid & requestAIO_0_0;
  wire        portsAOI_filtered_1_valid = auto_in_0_a_valid & requestAIO_0_1;
  wire        _portsAOI_in_0_a_ready_WIRE = requestAIO_0_0 & auto_out_0_a_ready & allowed_0 | requestAIO_0_1 & auto_out_1_a_ready & allowed_1_0;
  wire        portsAOI_filtered_1_0_valid = auto_in_1_a_valid & requestAIO_1_0;
  wire        portsAOI_filtered_1_1_valid = auto_in_1_a_valid & requestAIO_1_1;
  wire        _portsAOI_in_1_a_ready_WIRE = requestAIO_1_0 & auto_out_0_a_ready & allowed_1 | requestAIO_1_1 & auto_out_1_a_ready & allowed_1_1;
  wire        portsAOI_filtered_2_0_valid = auto_in_2_a_valid & requestAIO_2_0;
  wire        portsAOI_filtered_2_1_valid = auto_in_2_a_valid & requestAIO_2_1;
  wire        _portsAOI_in_2_a_ready_WIRE = requestAIO_2_0 & auto_out_0_a_ready & allowed_2 | requestAIO_2_1 & auto_out_1_a_ready & allowed_1_2;
  wire        portsBIO_filtered_1_1_valid = auto_out_1_b_valid & requestBOI_1_1;
  wire        portsBIO_filtered_1_2_valid = auto_out_1_b_valid & requestBOI_1_2;
  wire        portsDIO_filtered_0_valid = auto_out_0_d_valid & requestDOI_0_0;
  wire        portsDIO_filtered_1_valid = auto_out_0_d_valid & requestDOI_0_1;
  wire        portsDIO_filtered_2_valid = auto_out_0_d_valid & requestDOI_0_2;
  wire        portsDIO_filtered_1_0_valid = auto_out_1_d_valid & requestDOI_1_0;
  wire        portsDIO_filtered_1_1_valid = auto_out_1_d_valid & requestDOI_1_1;
  wire        portsDIO_filtered_1_2_valid = auto_out_1_d_valid & requestDOI_1_2;
  reg  [8:0]  beatsLeft;
  wire        idle = beatsLeft == 9'h0;
  wire [2:0]  readys_valid = {portsAOI_filtered_2_0_valid, portsAOI_filtered_1_0_valid, portsAOI_filtered_0_valid};
  reg  [2:0]  readys_mask;
  wire [2:0]  _readys_filter_T_1 = readys_valid & ~readys_mask;
  wire [3:0]  _GEN = {_readys_filter_T_1[1:0], portsAOI_filtered_2_0_valid, portsAOI_filtered_1_0_valid} | {_readys_filter_T_1, portsAOI_filtered_2_0_valid};
  wire [2:0]  readys_readys = ~({readys_mask[2], _readys_filter_T_1[2] | readys_mask[1], _GEN[3] | readys_mask[0]} & (_GEN[2:0] | {_readys_filter_T_1[2], _GEN[3:2]}));
  wire        winner_0 = readys_readys[0] & portsAOI_filtered_0_valid;
  wire        winner_1 = readys_readys[1] & portsAOI_filtered_1_0_valid;
  wire        winner_2 = readys_readys[2] & portsAOI_filtered_2_0_valid;
  wire        _out_0_a_valid_T = portsAOI_filtered_0_valid | portsAOI_filtered_1_0_valid;
  reg         state_0;
  reg         state_1;
  reg         state_2;
  wire        muxState_0 = idle ? winner_0 : state_0;
  wire        muxState_1 = idle ? winner_1 : state_1;
  wire        muxState_2 = idle ? winner_2 : state_2;
  assign allowed_0 = idle ? readys_readys[0] : state_0;
  assign allowed_1 = idle ? readys_readys[1] : state_1;
  assign allowed_2 = idle ? readys_readys[2] : state_2;
  wire        out_0_a_valid = idle ? _out_0_a_valid_T | portsAOI_filtered_2_0_valid : state_0 & portsAOI_filtered_0_valid | state_1 & portsAOI_filtered_1_0_valid | state_2 & portsAOI_filtered_2_0_valid;
  reg  [8:0]  beatsLeft_1;
  wire        idle_1 = beatsLeft_1 == 9'h0;
  wire [2:0]  readys_valid_1 = {portsAOI_filtered_2_1_valid, portsAOI_filtered_1_1_valid, portsAOI_filtered_1_valid};
  reg  [2:0]  readys_mask_1;
  wire [2:0]  _readys_filter_T_3 = readys_valid_1 & ~readys_mask_1;
  wire [3:0]  _GEN_0 = {_readys_filter_T_3[1:0], portsAOI_filtered_2_1_valid, portsAOI_filtered_1_1_valid} | {_readys_filter_T_3, portsAOI_filtered_2_1_valid};
  wire [2:0]  readys_readys_1 = ~({readys_mask_1[2], _readys_filter_T_3[2] | readys_mask_1[1], _GEN_0[3] | readys_mask_1[0]} & (_GEN_0[2:0] | {_readys_filter_T_3[2], _GEN_0[3:2]}));
  wire        winner_1_0 = readys_readys_1[0] & portsAOI_filtered_1_valid;
  wire        winner_1_1 = readys_readys_1[1] & portsAOI_filtered_1_1_valid;
  wire        winner_1_2 = readys_readys_1[2] & portsAOI_filtered_2_1_valid;
  wire        _out_1_a_valid_T = portsAOI_filtered_1_valid | portsAOI_filtered_1_1_valid;
  reg         state_1_0;
  reg         state_1_1;
  reg         state_1_2;
  wire        muxState_1_0 = idle_1 ? winner_1_0 : state_1_0;
  wire        muxState_1_1 = idle_1 ? winner_1_1 : state_1_1;
  wire        muxState_1_2 = idle_1 ? winner_1_2 : state_1_2;
  assign allowed_1_0 = idle_1 ? readys_readys_1[0] : state_1_0;
  assign allowed_1_1 = idle_1 ? readys_readys_1[1] : state_1_1;
  assign allowed_1_2 = idle_1 ? readys_readys_1[2] : state_1_2;
  wire        out_1_a_valid = idle_1 ? _out_1_a_valid_T | portsAOI_filtered_2_1_valid : state_1_0 & portsAOI_filtered_1_valid | state_1_1 & portsAOI_filtered_1_1_valid | state_1_2 & portsAOI_filtered_2_1_valid;
  reg  [8:0]  beatsLeft_2;
  wire        idle_2 = beatsLeft_2 == 9'h0;
  wire [1:0]  readys_valid_2 = {auto_in_2_c_valid, auto_in_1_c_valid};
  reg  [1:0]  readys_mask_2;
  wire [1:0]  _readys_filter_T_5 = readys_valid_2 & ~readys_mask_2;
  wire [1:0]  readys_readys_2 = ~({readys_mask_2[1], _readys_filter_T_5[1] | readys_mask_2[0]} & ({_readys_filter_T_5[0], auto_in_2_c_valid} | _readys_filter_T_5));
  wire        winner_2_0 = readys_readys_2[0] & auto_in_1_c_valid;
  wire        winner_2_1 = readys_readys_2[1] & auto_in_2_c_valid;
  wire        _out_1_c_valid_T = auto_in_1_c_valid | auto_in_2_c_valid;
  reg         state_2_0;
  reg         state_2_1;
  wire        muxState_2_0 = idle_2 ? winner_2_0 : state_2_0;
  wire        muxState_2_1 = idle_2 ? winner_2_1 : state_2_1;
  wire        _portsCOI_in_1_c_ready_WIRE = auto_out_1_c_ready & (idle_2 ? readys_readys_2[0] : state_2_0);
  wire        _portsCOI_in_2_c_ready_WIRE = auto_out_1_c_ready & (idle_2 ? readys_readys_2[1] : state_2_1);
  wire        out_1_c_valid = idle_2 ? _out_1_c_valid_T : state_2_0 & auto_in_1_c_valid | state_2_1 & auto_in_2_c_valid;
  reg         beatsLeft_3;
  wire [1:0]  readys_valid_3 = {auto_in_2_e_valid, auto_in_1_e_valid};
  reg  [1:0]  readys_mask_3;
  wire [1:0]  _readys_filter_T_7 = readys_valid_3 & ~readys_mask_3;
  wire [1:0]  readys_readys_3 = ~({readys_mask_3[1], _readys_filter_T_7[1] | readys_mask_3[0]} & ({_readys_filter_T_7[0], auto_in_2_e_valid} | _readys_filter_T_7));
  wire        winner_3_0 = readys_readys_3[0] & auto_in_1_e_valid;
  wire        winner_3_1 = readys_readys_3[1] & auto_in_2_e_valid;
  wire        _out_1_e_valid_T = auto_in_1_e_valid | auto_in_2_e_valid;
  reg         state_3_0;
  reg         state_3_1;
  wire        _portsEOI_in_1_e_ready_WIRE = beatsLeft_3 ? state_3_0 : readys_readys_3[0];
  wire        _portsEOI_in_2_e_ready_WIRE = beatsLeft_3 ? state_3_1 : readys_readys_3[1];
  wire        out_1_e_valid = beatsLeft_3 ? state_3_0 & auto_in_1_e_valid | state_3_1 & auto_in_2_e_valid : _out_1_e_valid_T;
  reg  [8:0]  beatsLeft_4;
  wire        idle_4 = beatsLeft_4 == 9'h0;
  wire [1:0]  readys_valid_4 = {portsDIO_filtered_1_0_valid, portsDIO_filtered_0_valid};
  reg  [1:0]  readys_mask_4;
  wire [1:0]  _readys_filter_T_9 = readys_valid_4 & ~readys_mask_4;
  wire [1:0]  readys_readys_4 = ~({readys_mask_4[1], _readys_filter_T_9[1] | readys_mask_4[0]} & ({_readys_filter_T_9[0], portsDIO_filtered_1_0_valid} | _readys_filter_T_9));
  wire        winner_4_0 = readys_readys_4[0] & portsDIO_filtered_0_valid;
  wire        winner_4_1 = readys_readys_4[1] & portsDIO_filtered_1_0_valid;
  wire        _in_0_d_valid_T = portsDIO_filtered_0_valid | portsDIO_filtered_1_0_valid;
  reg         state_4_0;
  reg         state_4_1;
  wire        muxState_4_0 = idle_4 ? winner_4_0 : state_4_0;
  wire        muxState_4_1 = idle_4 ? winner_4_1 : state_4_1;
  assign allowed_4_0 = idle_4 ? readys_readys_4[0] : state_4_0;
  assign allowed_4_1 = idle_4 ? readys_readys_4[1] : state_4_1;
  wire        in_0_d_valid = idle_4 ? _in_0_d_valid_T : state_4_0 & portsDIO_filtered_0_valid | state_4_1 & portsDIO_filtered_1_0_valid;
  wire        _in_0_d_bits_WIRE_1 = muxState_4_0 & auto_out_0_d_bits_corrupt | muxState_4_1 & auto_out_1_d_bits_corrupt;
  wire        _in_0_d_bits_WIRE_5 = muxState_4_0 & auto_out_0_d_bits_denied | muxState_4_1 & auto_out_1_d_bits_denied;
  wire [2:0]  _in_0_d_bits_WIRE_6 = (muxState_4_0 ? portsDIO_filtered_2_bits_sink : 3'h0) | (muxState_4_1 ? auto_out_1_d_bits_sink : 3'h0);
  wire [3:0]  _in_0_d_bits_WIRE_7 = (muxState_4_0 ? auto_out_0_d_bits_source[3:0] : 4'h0) | (muxState_4_1 ? auto_out_1_d_bits_source[3:0] : 4'h0);
  wire [3:0]  _in_0_d_bits_WIRE_8 = (muxState_4_0 ? auto_out_0_d_bits_size : 4'h0) | (muxState_4_1 ? portsDIO_filtered_1_2_bits_size : 4'h0);
  wire [1:0]  _in_0_d_bits_WIRE_9 = (muxState_4_0 ? auto_out_0_d_bits_param : 2'h0) | (muxState_4_1 ? auto_out_1_d_bits_param : 2'h0);
  wire [2:0]  _in_0_d_bits_WIRE_10 = (muxState_4_0 ? auto_out_0_d_bits_opcode : 3'h0) | (muxState_4_1 ? auto_out_1_d_bits_opcode : 3'h0);
  reg  [8:0]  beatsLeft_5;
  wire        idle_5 = beatsLeft_5 == 9'h0;
  wire [1:0]  readys_valid_5 = {portsDIO_filtered_1_1_valid, portsDIO_filtered_1_valid};
  reg  [1:0]  readys_mask_5;
  wire [1:0]  _readys_filter_T_11 = readys_valid_5 & ~readys_mask_5;
  wire [1:0]  readys_readys_5 = ~({readys_mask_5[1], _readys_filter_T_11[1] | readys_mask_5[0]} & ({_readys_filter_T_11[0], portsDIO_filtered_1_1_valid} | _readys_filter_T_11));
  wire        winner_5_0 = readys_readys_5[0] & portsDIO_filtered_1_valid;
  wire        winner_5_1 = readys_readys_5[1] & portsDIO_filtered_1_1_valid;
  wire        _in_1_d_valid_T = portsDIO_filtered_1_valid | portsDIO_filtered_1_1_valid;
  reg         state_5_0;
  reg         state_5_1;
  wire        muxState_5_0 = idle_5 ? winner_5_0 : state_5_0;
  wire        muxState_5_1 = idle_5 ? winner_5_1 : state_5_1;
  assign allowed_5_0 = idle_5 ? readys_readys_5[0] : state_5_0;
  assign allowed_5_1 = idle_5 ? readys_readys_5[1] : state_5_1;
  wire        in_1_d_valid = idle_5 ? _in_1_d_valid_T : state_5_0 & portsDIO_filtered_1_valid | state_5_1 & portsDIO_filtered_1_1_valid;
  wire        _in_1_d_bits_WIRE_1 = muxState_5_0 & auto_out_0_d_bits_corrupt | muxState_5_1 & auto_out_1_d_bits_corrupt;
  wire        _in_1_d_bits_WIRE_5 = muxState_5_0 & auto_out_0_d_bits_denied | muxState_5_1 & auto_out_1_d_bits_denied;
  wire [2:0]  _in_1_d_bits_WIRE_6 = (muxState_5_0 ? portsDIO_filtered_2_bits_sink : 3'h0) | (muxState_5_1 ? auto_out_1_d_bits_sink : 3'h0);
  wire [4:0]  _in_1_d_bits_WIRE_7 = (muxState_5_0 ? auto_out_0_d_bits_source[4:0] : 5'h0) | (muxState_5_1 ? auto_out_1_d_bits_source[4:0] : 5'h0);
  wire [3:0]  _in_1_d_bits_WIRE_8 = (muxState_5_0 ? auto_out_0_d_bits_size : 4'h0) | (muxState_5_1 ? portsDIO_filtered_1_2_bits_size : 4'h0);
  wire [1:0]  _in_1_d_bits_WIRE_9 = (muxState_5_0 ? auto_out_0_d_bits_param : 2'h0) | (muxState_5_1 ? auto_out_1_d_bits_param : 2'h0);
  wire [2:0]  _in_1_d_bits_WIRE_10 = (muxState_5_0 ? auto_out_0_d_bits_opcode : 3'h0) | (muxState_5_1 ? auto_out_1_d_bits_opcode : 3'h0);
  reg  [8:0]  beatsLeft_6;
  wire        idle_6 = beatsLeft_6 == 9'h0;
  wire [1:0]  readys_valid_6 = {portsDIO_filtered_1_2_valid, portsDIO_filtered_2_valid};
  reg  [1:0]  readys_mask_6;
  wire [1:0]  _readys_filter_T_13 = readys_valid_6 & ~readys_mask_6;
  wire [1:0]  readys_readys_6 = ~({readys_mask_6[1], _readys_filter_T_13[1] | readys_mask_6[0]} & ({_readys_filter_T_13[0], portsDIO_filtered_1_2_valid} | _readys_filter_T_13));
  wire        winner_6_0 = readys_readys_6[0] & portsDIO_filtered_2_valid;
  wire        winner_6_1 = readys_readys_6[1] & portsDIO_filtered_1_2_valid;
  wire        _in_2_d_valid_T = portsDIO_filtered_2_valid | portsDIO_filtered_1_2_valid;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~((~winner_0 | ~winner_1) & (~(winner_0 | winner_1) | ~winner_2))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~(_out_0_a_valid_T | portsAOI_filtered_2_0_valid) | winner_0 | winner_1 | winner_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~((~winner_1_0 | ~winner_1_1) & (~(winner_1_0 | winner_1_1) | ~winner_1_2))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~(_out_1_a_valid_T | portsAOI_filtered_2_1_valid) | winner_1_0 | winner_1_1 | winner_1_2)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~winner_2_0 | ~winner_2_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~_out_1_c_valid_T | winner_2_0 | winner_2_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~winner_3_0 | ~winner_3_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~_out_1_e_valid_T | winner_3_0 | winner_3_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~winner_4_0 | ~winner_4_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~_in_0_d_valid_T | winner_4_0 | winner_4_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~winner_5_0 | ~winner_5_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~_in_1_d_valid_T | winner_5_0 | winner_5_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~winner_6_0 | ~winner_6_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:77 assert((prefixOR zip winner) map { case (p,w) => !p || !w } reduce {_ && _})\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~_in_2_d_valid_T | winner_6_0 | winner_6_1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Arbiter.scala:79 assert (!valids.reduce(_||_) || winner.reduce(_||_))\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg         state_6_0;
  reg         state_6_1;
  wire        muxState_6_0 = idle_6 ? winner_6_0 : state_6_0;
  wire        muxState_6_1 = idle_6 ? winner_6_1 : state_6_1;
  assign allowed_6_0 = idle_6 ? readys_readys_6[0] : state_6_0;
  assign allowed_6_1 = idle_6 ? readys_readys_6[1] : state_6_1;
  wire        in_2_d_valid = idle_6 ? _in_2_d_valid_T : state_6_0 & portsDIO_filtered_2_valid | state_6_1 & portsDIO_filtered_1_2_valid;
  wire        _in_2_d_bits_WIRE_1 = muxState_6_0 & auto_out_0_d_bits_corrupt | muxState_6_1 & auto_out_1_d_bits_corrupt;
  wire        _in_2_d_bits_WIRE_5 = muxState_6_0 & auto_out_0_d_bits_denied | muxState_6_1 & auto_out_1_d_bits_denied;
  wire [2:0]  _in_2_d_bits_WIRE_6 = (muxState_6_0 ? portsDIO_filtered_2_bits_sink : 3'h0) | (muxState_6_1 ? auto_out_1_d_bits_sink : 3'h0);
  wire [4:0]  _in_2_d_bits_WIRE_7 = (muxState_6_0 ? auto_out_0_d_bits_source[4:0] : 5'h0) | (muxState_6_1 ? auto_out_1_d_bits_source[4:0] : 5'h0);
  wire [3:0]  _in_2_d_bits_WIRE_8 = (muxState_6_0 ? auto_out_0_d_bits_size : 4'h0) | (muxState_6_1 ? portsDIO_filtered_1_2_bits_size : 4'h0);
  wire [1:0]  _in_2_d_bits_WIRE_9 = (muxState_6_0 ? auto_out_0_d_bits_param : 2'h0) | (muxState_6_1 ? auto_out_1_d_bits_param : 2'h0);
  wire [2:0]  _in_2_d_bits_WIRE_10 = (muxState_6_0 ? auto_out_0_d_bits_opcode : 3'h0) | (muxState_6_1 ? auto_out_1_d_bits_opcode : 3'h0);
  wire [2:0]  _readys_mask_T = readys_readys & readys_valid;
  wire [2:0]  _readys_mask_T_3 = _readys_mask_T | {_readys_mask_T[1:0], 1'h0};
  wire [2:0]  _readys_mask_T_8 = readys_readys_1 & readys_valid_1;
  wire [2:0]  _readys_mask_T_11 = _readys_mask_T_8 | {_readys_mask_T_8[1:0], 1'h0};
  wire [26:0] _beatsCI_decode_T_9 = 27'hFFF << auto_in_2_c_bits_size;
  wire [26:0] _beatsCI_decode_T_5 = 27'hFFF << auto_in_1_c_bits_size;
  wire [1:0]  _readys_mask_T_16 = readys_readys_2 & readys_valid_2;
  wire [1:0]  _readys_mask_T_21 = readys_readys_3 & readys_valid_3;
  wire [1:0]  _readys_mask_T_26 = readys_readys_4 & readys_valid_4;
  wire [1:0]  _readys_mask_T_31 = readys_readys_5 & readys_valid_5;
  wire [1:0]  _readys_mask_T_36 = readys_readys_6 & readys_valid_6;
  wire [26:0] _beatsAI_decode_T_1 = 27'hFFF << auto_in_0_a_bits_size;
  wire [26:0] _beatsAI_decode_T_5 = 27'hFFF << auto_in_1_a_bits_size;
  wire [26:0] _beatsAI_decode_T_9 = 27'hFFF << auto_in_2_a_bits_size;
  wire [26:0] _beatsDO_decode_T_1 = 27'hFFF << auto_out_0_d_bits_size;
  wire [20:0] _beatsDO_decode_T_5 = 21'h3F << auto_out_1_d_bits_size;
  wire        latch = idle & auto_out_0_a_ready;
  wire        latch_1 = idle_1 & auto_out_1_a_ready;
  wire        latch_2 = idle_2 & auto_out_1_c_ready;
  wire        latch_4 = idle_4 & auto_in_0_d_ready;
  wire        latch_5 = idle_5 & auto_in_1_d_ready;
  wire        latch_6 = idle_6 & auto_in_2_d_ready;
  wire [8:0]  maskedBeats_0_4 = winner_4_0 & auto_out_0_d_bits_opcode[0] ? ~(_beatsDO_decode_T_1[11:3]) : 9'h0;
  wire [8:0]  maskedBeats_0_5 = winner_5_0 & auto_out_0_d_bits_opcode[0] ? ~(_beatsDO_decode_T_1[11:3]) : 9'h0;
  wire [8:0]  maskedBeats_0_6 = winner_6_0 & auto_out_0_d_bits_opcode[0] ? ~(_beatsDO_decode_T_1[11:3]) : 9'h0;
  always @(posedge clock) begin
    if (reset) begin
      beatsLeft <= 9'h0;
      readys_mask <= 3'h7;
      state_0 <= 1'h0;
      state_1 <= 1'h0;
      state_2 <= 1'h0;
      beatsLeft_1 <= 9'h0;
      readys_mask_1 <= 3'h7;
      state_1_0 <= 1'h0;
      state_1_1 <= 1'h0;
      state_1_2 <= 1'h0;
      beatsLeft_2 <= 9'h0;
      readys_mask_2 <= 2'h3;
      state_2_0 <= 1'h0;
      state_2_1 <= 1'h0;
      beatsLeft_3 <= 1'h0;
      readys_mask_3 <= 2'h3;
      state_3_0 <= 1'h0;
      state_3_1 <= 1'h0;
      beatsLeft_4 <= 9'h0;
      readys_mask_4 <= 2'h3;
      state_4_0 <= 1'h0;
      state_4_1 <= 1'h0;
      beatsLeft_5 <= 9'h0;
      readys_mask_5 <= 2'h3;
      state_5_0 <= 1'h0;
      state_5_1 <= 1'h0;
      beatsLeft_6 <= 9'h0;
      readys_mask_6 <= 2'h3;
      state_6_0 <= 1'h0;
      state_6_1 <= 1'h0;
    end
    else begin
      if (latch)
        beatsLeft <= (winner_0 & ~(auto_in_0_a_bits_opcode[2]) ? ~(_beatsAI_decode_T_1[11:3]) : 9'h0) | (winner_1 & ~(auto_in_1_a_bits_opcode[2]) ? ~(_beatsAI_decode_T_5[11:3]) : 9'h0) | (winner_2 & ~(auto_in_2_a_bits_opcode[2]) ? ~(_beatsAI_decode_T_9[11:3]) : 9'h0);
      else
        beatsLeft <= beatsLeft - {8'h0, auto_out_0_a_ready & out_0_a_valid};
      if (latch & (|readys_valid))
        readys_mask <= _readys_mask_T_3 | {_readys_mask_T_3[0], 2'h0};
      if (idle) begin
        state_0 <= winner_0;
        state_1 <= winner_1;
        state_2 <= winner_2;
      end
      if (latch_1)
        beatsLeft_1 <= (winner_1_0 & ~(auto_in_0_a_bits_opcode[2]) ? ~(_beatsAI_decode_T_1[11:3]) : 9'h0) | (winner_1_1 & ~(auto_in_1_a_bits_opcode[2]) ? ~(_beatsAI_decode_T_5[11:3]) : 9'h0) | (winner_1_2 & ~(auto_in_2_a_bits_opcode[2]) ? ~(_beatsAI_decode_T_9[11:3]) : 9'h0);
      else
        beatsLeft_1 <= beatsLeft_1 - {8'h0, auto_out_1_a_ready & out_1_a_valid};
      if (latch_1 & (|readys_valid_1))
        readys_mask_1 <= _readys_mask_T_11 | {_readys_mask_T_11[0], 2'h0};
      if (idle_1) begin
        state_1_0 <= winner_1_0;
        state_1_1 <= winner_1_1;
        state_1_2 <= winner_1_2;
      end
      if (latch_2)
        beatsLeft_2 <= (winner_2_0 & auto_in_1_c_bits_opcode[0] ? ~(_beatsCI_decode_T_5[11:3]) : 9'h0) | (winner_2_1 & auto_in_2_c_bits_opcode[0] ? ~(_beatsCI_decode_T_9[11:3]) : 9'h0);
      else
        beatsLeft_2 <= beatsLeft_2 - {8'h0, auto_out_1_c_ready & out_1_c_valid};
      if (latch_2 & (|readys_valid_2))
        readys_mask_2 <= _readys_mask_T_16 | {_readys_mask_T_16[0], 1'h0};
      if (idle_2) begin
        state_2_0 <= winner_2_0;
        state_2_1 <= winner_2_1;
      end
      beatsLeft_3 <= beatsLeft_3 & beatsLeft_3 - out_1_e_valid;
      if (~beatsLeft_3 & (|readys_valid_3))
        readys_mask_3 <= _readys_mask_T_21 | {_readys_mask_T_21[0], 1'h0};
      if (beatsLeft_3) begin
      end
      else begin
        state_3_0 <= winner_3_0;
        state_3_1 <= winner_3_1;
      end
      if (latch_4)
        beatsLeft_4 <= {maskedBeats_0_4[8:3], maskedBeats_0_4[2:0] | (winner_4_1 & auto_out_1_d_bits_opcode[0] ? ~(_beatsDO_decode_T_5[5:3]) : 3'h0)};
      else
        beatsLeft_4 <= beatsLeft_4 - {8'h0, auto_in_0_d_ready & in_0_d_valid};
      if (latch_4 & (|readys_valid_4))
        readys_mask_4 <= _readys_mask_T_26 | {_readys_mask_T_26[0], 1'h0};
      if (idle_4) begin
        state_4_0 <= winner_4_0;
        state_4_1 <= winner_4_1;
      end
      if (latch_5)
        beatsLeft_5 <= {maskedBeats_0_5[8:3], maskedBeats_0_5[2:0] | (winner_5_1 & auto_out_1_d_bits_opcode[0] ? ~(_beatsDO_decode_T_5[5:3]) : 3'h0)};
      else
        beatsLeft_5 <= beatsLeft_5 - {8'h0, auto_in_1_d_ready & in_1_d_valid};
      if (latch_5 & (|readys_valid_5))
        readys_mask_5 <= _readys_mask_T_31 | {_readys_mask_T_31[0], 1'h0};
      if (idle_5) begin
        state_5_0 <= winner_5_0;
        state_5_1 <= winner_5_1;
      end
      if (latch_6)
        beatsLeft_6 <= {maskedBeats_0_6[8:3], maskedBeats_0_6[2:0] | (winner_6_1 & auto_out_1_d_bits_opcode[0] ? ~(_beatsDO_decode_T_5[5:3]) : 3'h0)};
      else
        beatsLeft_6 <= beatsLeft_6 - {8'h0, auto_in_2_d_ready & in_2_d_valid};
      if (latch_6 & (|readys_valid_6))
        readys_mask_6 <= _readys_mask_T_36 | {_readys_mask_T_36[0], 1'h0};
      if (idle_6) begin
        state_6_0 <= winner_6_0;
        state_6_1 <= winner_6_1;
      end
    end
  end // always @(posedge)
  TLMonitor monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (_portsAOI_in_0_a_ready_WIRE),
    .io_in_a_valid        (auto_in_0_a_valid),
    .io_in_a_bits_opcode  (auto_in_0_a_bits_opcode),
    .io_in_a_bits_param   (auto_in_0_a_bits_param),
    .io_in_a_bits_size    (auto_in_0_a_bits_size),
    .io_in_a_bits_source  (auto_in_0_a_bits_source),
    .io_in_a_bits_address (auto_in_0_a_bits_address),
    .io_in_a_bits_mask    (auto_in_0_a_bits_mask),
    .io_in_a_bits_corrupt (auto_in_0_a_bits_corrupt),
    .io_in_d_ready        (auto_in_0_d_ready),
    .io_in_d_valid        (in_0_d_valid),
    .io_in_d_bits_opcode  (_in_0_d_bits_WIRE_10),
    .io_in_d_bits_param   (_in_0_d_bits_WIRE_9),
    .io_in_d_bits_size    (_in_0_d_bits_WIRE_8),
    .io_in_d_bits_source  (_in_0_d_bits_WIRE_7),
    .io_in_d_bits_sink    (_in_0_d_bits_WIRE_6),
    .io_in_d_bits_denied  (_in_0_d_bits_WIRE_5),
    .io_in_d_bits_corrupt (_in_0_d_bits_WIRE_1)
  );
  TLMonitor_1 monitor_1 (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (_portsAOI_in_1_a_ready_WIRE),
    .io_in_a_valid        (auto_in_1_a_valid),
    .io_in_a_bits_opcode  (auto_in_1_a_bits_opcode),
    .io_in_a_bits_param   (auto_in_1_a_bits_param),
    .io_in_a_bits_size    (auto_in_1_a_bits_size),
    .io_in_a_bits_source  (auto_in_1_a_bits_source),
    .io_in_a_bits_address (auto_in_1_a_bits_address),
    .io_in_a_bits_mask    (auto_in_1_a_bits_mask),
    .io_in_a_bits_corrupt (auto_in_1_a_bits_corrupt),
    .io_in_b_ready        (auto_in_1_b_ready),
    .io_in_b_valid        (portsBIO_filtered_1_1_valid),
    .io_in_b_bits_param   (auto_out_1_b_bits_param),
    .io_in_b_bits_source  (auto_out_1_b_bits_source[4:0]),
    .io_in_b_bits_address (auto_out_1_b_bits_address),
    .io_in_c_ready        (_portsCOI_in_1_c_ready_WIRE),
    .io_in_c_valid        (auto_in_1_c_valid),
    .io_in_c_bits_opcode  (auto_in_1_c_bits_opcode),
    .io_in_c_bits_param   (auto_in_1_c_bits_param),
    .io_in_c_bits_size    (auto_in_1_c_bits_size),
    .io_in_c_bits_source  (auto_in_1_c_bits_source),
    .io_in_c_bits_address (auto_in_1_c_bits_address),
    .io_in_c_bits_corrupt (auto_in_1_c_bits_corrupt),
    .io_in_d_ready        (auto_in_1_d_ready),
    .io_in_d_valid        (in_1_d_valid),
    .io_in_d_bits_opcode  (_in_1_d_bits_WIRE_10),
    .io_in_d_bits_param   (_in_1_d_bits_WIRE_9),
    .io_in_d_bits_size    (_in_1_d_bits_WIRE_8),
    .io_in_d_bits_source  (_in_1_d_bits_WIRE_7),
    .io_in_d_bits_sink    (_in_1_d_bits_WIRE_6),
    .io_in_d_bits_denied  (_in_1_d_bits_WIRE_5),
    .io_in_d_bits_corrupt (_in_1_d_bits_WIRE_1),
    .io_in_e_ready        (_portsEOI_in_1_e_ready_WIRE),
    .io_in_e_valid        (auto_in_1_e_valid),
    .io_in_e_bits_sink    (auto_in_1_e_bits_sink)
  );
  TLMonitor_1 monitor_2 (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (_portsAOI_in_2_a_ready_WIRE),
    .io_in_a_valid        (auto_in_2_a_valid),
    .io_in_a_bits_opcode  (auto_in_2_a_bits_opcode),
    .io_in_a_bits_param   (auto_in_2_a_bits_param),
    .io_in_a_bits_size    (auto_in_2_a_bits_size),
    .io_in_a_bits_source  (auto_in_2_a_bits_source),
    .io_in_a_bits_address (auto_in_2_a_bits_address),
    .io_in_a_bits_mask    (auto_in_2_a_bits_mask),
    .io_in_a_bits_corrupt (auto_in_2_a_bits_corrupt),
    .io_in_b_ready        (auto_in_2_b_ready),
    .io_in_b_valid        (portsBIO_filtered_1_2_valid),
    .io_in_b_bits_param   (auto_out_1_b_bits_param),
    .io_in_b_bits_source  (auto_out_1_b_bits_source[4:0]),
    .io_in_b_bits_address (auto_out_1_b_bits_address),
    .io_in_c_ready        (_portsCOI_in_2_c_ready_WIRE),
    .io_in_c_valid        (auto_in_2_c_valid),
    .io_in_c_bits_opcode  (auto_in_2_c_bits_opcode),
    .io_in_c_bits_param   (auto_in_2_c_bits_param),
    .io_in_c_bits_size    (auto_in_2_c_bits_size),
    .io_in_c_bits_source  (auto_in_2_c_bits_source),
    .io_in_c_bits_address (auto_in_2_c_bits_address),
    .io_in_c_bits_corrupt (auto_in_2_c_bits_corrupt),
    .io_in_d_ready        (auto_in_2_d_ready),
    .io_in_d_valid        (in_2_d_valid),
    .io_in_d_bits_opcode  (_in_2_d_bits_WIRE_10),
    .io_in_d_bits_param   (_in_2_d_bits_WIRE_9),
    .io_in_d_bits_size    (_in_2_d_bits_WIRE_8),
    .io_in_d_bits_source  (_in_2_d_bits_WIRE_7),
    .io_in_d_bits_sink    (_in_2_d_bits_WIRE_6),
    .io_in_d_bits_denied  (_in_2_d_bits_WIRE_5),
    .io_in_d_bits_corrupt (_in_2_d_bits_WIRE_1),
    .io_in_e_ready        (_portsEOI_in_2_e_ready_WIRE),
    .io_in_e_valid        (auto_in_2_e_valid),
    .io_in_e_bits_sink    (auto_in_2_e_bits_sink)
  );
  assign auto_in_2_a_ready = _portsAOI_in_2_a_ready_WIRE;
  assign auto_in_2_b_valid = portsBIO_filtered_1_2_valid;
  assign auto_in_2_b_bits_param = auto_out_1_b_bits_param;
  assign auto_in_2_b_bits_source = auto_out_1_b_bits_source[4:0];
  assign auto_in_2_b_bits_address = auto_out_1_b_bits_address;
  assign auto_in_2_c_ready = _portsCOI_in_2_c_ready_WIRE;
  assign auto_in_2_d_valid = in_2_d_valid;
  assign auto_in_2_d_bits_opcode = _in_2_d_bits_WIRE_10;
  assign auto_in_2_d_bits_param = _in_2_d_bits_WIRE_9;
  assign auto_in_2_d_bits_size = _in_2_d_bits_WIRE_8;
  assign auto_in_2_d_bits_source = _in_2_d_bits_WIRE_7;
  assign auto_in_2_d_bits_sink = _in_2_d_bits_WIRE_6;
  assign auto_in_2_d_bits_denied = _in_2_d_bits_WIRE_5;
  assign auto_in_2_d_bits_data = (muxState_6_0 ? auto_out_0_d_bits_data : 64'h0) | (muxState_6_1 ? auto_out_1_d_bits_data : 64'h0);
  assign auto_in_2_d_bits_corrupt = _in_2_d_bits_WIRE_1;
  assign auto_in_2_e_ready = _portsEOI_in_2_e_ready_WIRE;
  assign auto_in_1_a_ready = _portsAOI_in_1_a_ready_WIRE;
  assign auto_in_1_b_valid = portsBIO_filtered_1_1_valid;
  assign auto_in_1_b_bits_param = auto_out_1_b_bits_param;
  assign auto_in_1_b_bits_source = auto_out_1_b_bits_source[4:0];
  assign auto_in_1_b_bits_address = auto_out_1_b_bits_address;
  assign auto_in_1_c_ready = _portsCOI_in_1_c_ready_WIRE;
  assign auto_in_1_d_valid = in_1_d_valid;
  assign auto_in_1_d_bits_opcode = _in_1_d_bits_WIRE_10;
  assign auto_in_1_d_bits_param = _in_1_d_bits_WIRE_9;
  assign auto_in_1_d_bits_size = _in_1_d_bits_WIRE_8;
  assign auto_in_1_d_bits_source = _in_1_d_bits_WIRE_7;
  assign auto_in_1_d_bits_sink = _in_1_d_bits_WIRE_6;
  assign auto_in_1_d_bits_denied = _in_1_d_bits_WIRE_5;
  assign auto_in_1_d_bits_data = (muxState_5_0 ? auto_out_0_d_bits_data : 64'h0) | (muxState_5_1 ? auto_out_1_d_bits_data : 64'h0);
  assign auto_in_1_d_bits_corrupt = _in_1_d_bits_WIRE_1;
  assign auto_in_1_e_ready = _portsEOI_in_1_e_ready_WIRE;
  assign auto_in_0_a_ready = _portsAOI_in_0_a_ready_WIRE;
  assign auto_in_0_d_valid = in_0_d_valid;
  assign auto_in_0_d_bits_opcode = _in_0_d_bits_WIRE_10;
  assign auto_in_0_d_bits_param = _in_0_d_bits_WIRE_9;
  assign auto_in_0_d_bits_size = _in_0_d_bits_WIRE_8;
  assign auto_in_0_d_bits_source = _in_0_d_bits_WIRE_7;
  assign auto_in_0_d_bits_sink = _in_0_d_bits_WIRE_6;
  assign auto_in_0_d_bits_denied = _in_0_d_bits_WIRE_5;
  assign auto_in_0_d_bits_data = (muxState_4_0 ? auto_out_0_d_bits_data : 64'h0) | (muxState_4_1 ? auto_out_1_d_bits_data : 64'h0);
  assign auto_in_0_d_bits_corrupt = _in_0_d_bits_WIRE_1;
  assign auto_out_1_a_valid = out_1_a_valid;
  assign auto_out_1_a_bits_opcode = (muxState_1_0 ? auto_in_0_a_bits_opcode : 3'h0) | (muxState_1_1 ? auto_in_1_a_bits_opcode : 3'h0) | (muxState_1_2 ? auto_in_2_a_bits_opcode : 3'h0);
  assign auto_out_1_a_bits_param = (muxState_1_0 ? auto_in_0_a_bits_param : 3'h0) | (muxState_1_1 ? auto_in_1_a_bits_param : 3'h0) | (muxState_1_2 ? auto_in_2_a_bits_param : 3'h0);
  assign auto_out_1_a_bits_size = (muxState_1_0 ? auto_in_0_a_bits_size[2:0] : 3'h0) | (muxState_1_1 ? auto_in_1_a_bits_size[2:0] : 3'h0) | (muxState_1_2 ? auto_in_2_a_bits_size[2:0] : 3'h0);
  assign auto_out_1_a_bits_source = (muxState_1_0 ? portsAOI_filtered_1_bits_source : 7'h0) | (muxState_1_1 ? portsAOI_filtered_1_1_bits_source : 7'h0) | (muxState_1_2 ? portsAOI_filtered_2_1_bits_source : 7'h0);
  assign auto_out_1_a_bits_address = (muxState_1_0 ? auto_in_0_a_bits_address : 33'h0) | (muxState_1_1 ? auto_in_1_a_bits_address : 33'h0) | (muxState_1_2 ? auto_in_2_a_bits_address : 33'h0);
  assign auto_out_1_a_bits_mask = (muxState_1_0 ? auto_in_0_a_bits_mask : 8'h0) | (muxState_1_1 ? auto_in_1_a_bits_mask : 8'h0) | (muxState_1_2 ? auto_in_2_a_bits_mask : 8'h0);
  assign auto_out_1_a_bits_data = (muxState_1_0 ? auto_in_0_a_bits_data : 64'h0) | (muxState_1_1 ? auto_in_1_a_bits_data : 64'h0) | (muxState_1_2 ? auto_in_2_a_bits_data : 64'h0);
  assign auto_out_1_a_bits_corrupt = muxState_1_0 & auto_in_0_a_bits_corrupt | muxState_1_1 & auto_in_1_a_bits_corrupt | muxState_1_2 & auto_in_2_a_bits_corrupt;
  assign auto_out_1_b_ready = requestBOI_1_1 & auto_in_1_b_ready | requestBOI_1_2 & auto_in_2_b_ready;
  assign auto_out_1_c_valid = out_1_c_valid;
  assign auto_out_1_c_bits_opcode = (muxState_2_0 ? auto_in_1_c_bits_opcode : 3'h0) | (muxState_2_1 ? auto_in_2_c_bits_opcode : 3'h0);
  assign auto_out_1_c_bits_param = (muxState_2_0 ? auto_in_1_c_bits_param : 3'h0) | (muxState_2_1 ? auto_in_2_c_bits_param : 3'h0);
  assign auto_out_1_c_bits_size = (muxState_2_0 ? auto_in_1_c_bits_size[2:0] : 3'h0) | (muxState_2_1 ? auto_in_2_c_bits_size[2:0] : 3'h0);
  assign auto_out_1_c_bits_source = (muxState_2_0 ? {2'h1, auto_in_1_c_bits_source} : 7'h0) | (muxState_2_1 ? {2'h0, auto_in_2_c_bits_source} : 7'h0);
  assign auto_out_1_c_bits_address = (muxState_2_0 ? auto_in_1_c_bits_address : 33'h0) | (muxState_2_1 ? auto_in_2_c_bits_address : 33'h0);
  assign auto_out_1_c_bits_data = (muxState_2_0 ? auto_in_1_c_bits_data : 64'h0) | (muxState_2_1 ? auto_in_2_c_bits_data : 64'h0);
  assign auto_out_1_c_bits_corrupt = muxState_2_0 & auto_in_1_c_bits_corrupt | muxState_2_1 & auto_in_2_c_bits_corrupt;
  assign auto_out_1_d_ready = requestDOI_1_0 & auto_in_0_d_ready & allowed_4_1 | requestDOI_1_1 & auto_in_1_d_ready & allowed_5_1 | requestDOI_1_2 & auto_in_2_d_ready & allowed_6_1;
  assign auto_out_1_e_valid = out_1_e_valid;
  assign auto_out_1_e_bits_sink = ((beatsLeft_3 ? state_3_0 : winner_3_0) ? auto_in_1_e_bits_sink : 3'h0) | ((beatsLeft_3 ? state_3_1 : winner_3_1) ? auto_in_2_e_bits_sink : 3'h0);
  assign auto_out_0_a_valid = out_0_a_valid;
  assign auto_out_0_a_bits_opcode = (muxState_0 ? auto_in_0_a_bits_opcode : 3'h0) | (muxState_1 ? auto_in_1_a_bits_opcode : 3'h0) | (muxState_2 ? auto_in_2_a_bits_opcode : 3'h0);
  assign auto_out_0_a_bits_param = (muxState_0 ? auto_in_0_a_bits_param : 3'h0) | (muxState_1 ? auto_in_1_a_bits_param : 3'h0) | (muxState_2 ? auto_in_2_a_bits_param : 3'h0);
  assign auto_out_0_a_bits_size = (muxState_0 ? auto_in_0_a_bits_size : 4'h0) | (muxState_1 ? auto_in_1_a_bits_size : 4'h0) | (muxState_2 ? auto_in_2_a_bits_size : 4'h0);
  assign auto_out_0_a_bits_source = (muxState_0 ? portsAOI_filtered_1_bits_source : 7'h0) | (muxState_1 ? portsAOI_filtered_1_1_bits_source : 7'h0) | (muxState_2 ? portsAOI_filtered_2_1_bits_source : 7'h0);
  assign auto_out_0_a_bits_address = (muxState_0 ? auto_in_0_a_bits_address[27:0] : 28'h0) | (muxState_1 ? auto_in_1_a_bits_address[27:0] : 28'h0) | (muxState_2 ? auto_in_2_a_bits_address[27:0] : 28'h0);
  assign auto_out_0_a_bits_mask = (muxState_0 ? auto_in_0_a_bits_mask : 8'h0) | (muxState_1 ? auto_in_1_a_bits_mask : 8'h0) | (muxState_2 ? auto_in_2_a_bits_mask : 8'h0);
  assign auto_out_0_a_bits_data = (muxState_0 ? auto_in_0_a_bits_data : 64'h0) | (muxState_1 ? auto_in_1_a_bits_data : 64'h0) | (muxState_2 ? auto_in_2_a_bits_data : 64'h0);
  assign auto_out_0_a_bits_corrupt = muxState_0 & auto_in_0_a_bits_corrupt | muxState_1 & auto_in_1_a_bits_corrupt | muxState_2 & auto_in_2_a_bits_corrupt;
  assign auto_out_0_d_ready = requestDOI_0_0 & auto_in_0_d_ready & allowed_4_0 | requestDOI_0_1 & auto_in_1_d_ready & allowed_5_0 | requestDOI_0_2 & auto_in_2_d_ready & allowed_6_0;
endmodule

