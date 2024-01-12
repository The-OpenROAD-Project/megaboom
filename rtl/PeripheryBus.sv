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

module PeripheryBus(
  input         auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock,
                auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset,
  output        auto_bus_xing_in_a_ready,
  input         auto_bus_xing_in_a_valid,
  input  [2:0]  auto_bus_xing_in_a_bits_opcode,
                auto_bus_xing_in_a_bits_param,
                auto_bus_xing_in_a_bits_size,
  input  [5:0]  auto_bus_xing_in_a_bits_source,
  input  [12:0] auto_bus_xing_in_a_bits_address,
  input  [7:0]  auto_bus_xing_in_a_bits_mask,
  input  [63:0] auto_bus_xing_in_a_bits_data,
  input         auto_bus_xing_in_a_bits_corrupt,
                auto_bus_xing_in_d_ready,
  output        auto_bus_xing_in_d_valid,
  output [2:0]  auto_bus_xing_in_d_bits_opcode,
  output [1:0]  auto_bus_xing_in_d_bits_param,
  output [2:0]  auto_bus_xing_in_d_bits_size,
  output [5:0]  auto_bus_xing_in_d_bits_source,
  output        auto_bus_xing_in_d_bits_sink,
                auto_bus_xing_in_d_bits_denied,
  output [63:0] auto_bus_xing_in_d_bits_data,
  output        auto_bus_xing_in_d_bits_corrupt,
                clock,
                reset
);

  wire        out_woready_7;
  wire        _coupler_to_bootaddressreg_auto_fragmenter_out_a_valid;
  wire [2:0]  _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_opcode;
  wire [2:0]  _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_param;
  wire [1:0]  _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_size;
  wire [9:0]  _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_source;
  wire [12:0] _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_address;
  wire [7:0]  _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask;
  wire [63:0] _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data;
  wire        _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_corrupt;
  wire        _coupler_to_bootaddressreg_auto_fragmenter_out_d_ready;
  wire        _coupler_to_bootaddressreg_auto_tl_in_a_ready;
  wire        _coupler_to_bootaddressreg_auto_tl_in_d_valid;
  wire [2:0]  _coupler_to_bootaddressreg_auto_tl_in_d_bits_opcode;
  wire [2:0]  _coupler_to_bootaddressreg_auto_tl_in_d_bits_size;
  wire [5:0]  _coupler_to_bootaddressreg_auto_tl_in_d_bits_source;
  wire [63:0] _coupler_to_bootaddressreg_auto_tl_in_d_bits_data;
  wire        _buffer_1_auto_out_a_valid;
  wire [2:0]  _buffer_1_auto_out_a_bits_opcode;
  wire [2:0]  _buffer_1_auto_out_a_bits_param;
  wire [2:0]  _buffer_1_auto_out_a_bits_size;
  wire [5:0]  _buffer_1_auto_out_a_bits_source;
  wire [12:0] _buffer_1_auto_out_a_bits_address;
  wire [7:0]  _buffer_1_auto_out_a_bits_mask;
  wire [63:0] _buffer_1_auto_out_a_bits_data;
  wire        _buffer_1_auto_out_a_bits_corrupt;
  wire        _buffer_1_auto_out_d_ready;
  wire        _atomics_auto_in_a_ready;
  wire        _atomics_auto_in_d_valid;
  wire [2:0]  _atomics_auto_in_d_bits_opcode;
  wire [1:0]  _atomics_auto_in_d_bits_param;
  wire [2:0]  _atomics_auto_in_d_bits_size;
  wire [5:0]  _atomics_auto_in_d_bits_source;
  wire        _atomics_auto_in_d_bits_sink;
  wire        _atomics_auto_in_d_bits_denied;
  wire [63:0] _atomics_auto_in_d_bits_data;
  wire        _atomics_auto_in_d_bits_corrupt;
  wire        _atomics_auto_out_a_valid;
  wire [2:0]  _atomics_auto_out_a_bits_opcode;
  wire [2:0]  _atomics_auto_out_a_bits_param;
  wire [2:0]  _atomics_auto_out_a_bits_size;
  wire [5:0]  _atomics_auto_out_a_bits_source;
  wire [12:0] _atomics_auto_out_a_bits_address;
  wire [7:0]  _atomics_auto_out_a_bits_mask;
  wire [63:0] _atomics_auto_out_a_bits_data;
  wire        _atomics_auto_out_a_bits_corrupt;
  wire        _atomics_auto_out_d_ready;
  wire        _buffer_auto_in_a_ready;
  wire        _buffer_auto_in_d_valid;
  wire [2:0]  _buffer_auto_in_d_bits_opcode;
  wire [1:0]  _buffer_auto_in_d_bits_param;
  wire [2:0]  _buffer_auto_in_d_bits_size;
  wire [5:0]  _buffer_auto_in_d_bits_source;
  wire        _buffer_auto_in_d_bits_sink;
  wire        _buffer_auto_in_d_bits_denied;
  wire [63:0] _buffer_auto_in_d_bits_data;
  wire        _buffer_auto_in_d_bits_corrupt;
  wire        _buffer_auto_out_a_valid;
  wire [2:0]  _buffer_auto_out_a_bits_opcode;
  wire [2:0]  _buffer_auto_out_a_bits_param;
  wire [2:0]  _buffer_auto_out_a_bits_size;
  wire [5:0]  _buffer_auto_out_a_bits_source;
  wire [12:0] _buffer_auto_out_a_bits_address;
  wire [7:0]  _buffer_auto_out_a_bits_mask;
  wire [63:0] _buffer_auto_out_a_bits_data;
  wire        _buffer_auto_out_a_bits_corrupt;
  wire        _buffer_auto_out_d_ready;
  wire        _fixer_auto_in_a_ready;
  wire        _fixer_auto_in_d_valid;
  wire [2:0]  _fixer_auto_in_d_bits_opcode;
  wire [2:0]  _fixer_auto_in_d_bits_size;
  wire [5:0]  _fixer_auto_in_d_bits_source;
  wire [63:0] _fixer_auto_in_d_bits_data;
  wire        _fixer_auto_out_a_valid;
  wire [2:0]  _fixer_auto_out_a_bits_opcode;
  wire [2:0]  _fixer_auto_out_a_bits_param;
  wire [2:0]  _fixer_auto_out_a_bits_size;
  wire [5:0]  _fixer_auto_out_a_bits_source;
  wire [12:0] _fixer_auto_out_a_bits_address;
  wire [7:0]  _fixer_auto_out_a_bits_mask;
  wire [63:0] _fixer_auto_out_a_bits_data;
  wire        _fixer_auto_out_a_bits_corrupt;
  wire        _fixer_auto_out_d_ready;
  reg  [63:0] pad;
  wire        out_front_bits_read = _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_opcode == 3'h4;
  wire        _out_out_bits_data_T_1 = _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_address[11:3] == 9'h0;
  wire        valids_0 = out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[0];
  wire        valids_1 = out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[1];
  wire        valids_2 = out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[2];
  wire        valids_3 = out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[3];
  wire        valids_4 = out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[4];
  wire        valids_5 = out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[5];
  wire        valids_6 = out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[6];
  wire        valids_7 = out_woready_7 & _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask[7];
  assign out_woready_7 = _coupler_to_bootaddressreg_auto_fragmenter_out_a_valid & _coupler_to_bootaddressreg_auto_fragmenter_out_d_ready & ~out_front_bits_read & _out_out_bits_data_T_1;
  wire [2:0]  nodeIn_d_bits_opcode = {2'h0, out_front_bits_read};
  always @(posedge auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock) begin
    if (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset)
      pad <= 64'h80000000;
    else if (valids_0 | valids_1 | valids_2 | valids_3 | valids_4 | valids_5 | valids_6 | valids_7)
      pad <= {valids_7 ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[63:56] : pad[63:56], valids_6 ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[55:48] : pad[55:48], valids_5 ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[47:40] : pad[47:40], valids_4 ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[39:32] : pad[39:32], valids_3 ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[31:24] : pad[31:24], valids_2 ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[23:16] : pad[23:16], valids_1 ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[15:8] : pad[15:8], valids_0 ? _coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data[7:0] : pad[7:0]};
  end // always @(posedge)
  TLFIFOFixer_1 fixer (
    .clock                   (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock),
    .reset                   (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset),
    .auto_in_a_ready         (_fixer_auto_in_a_ready),
    .auto_in_a_valid         (_buffer_auto_out_a_valid),
    .auto_in_a_bits_opcode   (_buffer_auto_out_a_bits_opcode),
    .auto_in_a_bits_param    (_buffer_auto_out_a_bits_param),
    .auto_in_a_bits_size     (_buffer_auto_out_a_bits_size),
    .auto_in_a_bits_source   (_buffer_auto_out_a_bits_source),
    .auto_in_a_bits_address  (_buffer_auto_out_a_bits_address),
    .auto_in_a_bits_mask     (_buffer_auto_out_a_bits_mask),
    .auto_in_a_bits_data     (_buffer_auto_out_a_bits_data),
    .auto_in_a_bits_corrupt  (_buffer_auto_out_a_bits_corrupt),
    .auto_in_d_ready         (_buffer_auto_out_d_ready),
    .auto_in_d_valid         (_fixer_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_fixer_auto_in_d_bits_opcode),
    .auto_in_d_bits_size     (_fixer_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_fixer_auto_in_d_bits_source),
    .auto_in_d_bits_data     (_fixer_auto_in_d_bits_data),
    .auto_out_a_ready        (_coupler_to_bootaddressreg_auto_tl_in_a_ready),
    .auto_out_a_valid        (_fixer_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_fixer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_fixer_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_fixer_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_fixer_auto_out_a_bits_source),
    .auto_out_a_bits_address (_fixer_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_fixer_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_fixer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_fixer_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_fixer_auto_out_d_ready),
    .auto_out_d_valid        (_coupler_to_bootaddressreg_auto_tl_in_d_valid),
    .auto_out_d_bits_opcode  (_coupler_to_bootaddressreg_auto_tl_in_d_bits_opcode),
    .auto_out_d_bits_size    (_coupler_to_bootaddressreg_auto_tl_in_d_bits_size),
    .auto_out_d_bits_source  (_coupler_to_bootaddressreg_auto_tl_in_d_bits_source),
    .auto_out_d_bits_data    (_coupler_to_bootaddressreg_auto_tl_in_d_bits_data)
  );
  TLBuffer buffer (
    .clock                   (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock),
    .reset                   (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset),
    .auto_in_a_ready         (_buffer_auto_in_a_ready),
    .auto_in_a_valid         (_atomics_auto_out_a_valid),
    .auto_in_a_bits_opcode   (_atomics_auto_out_a_bits_opcode),
    .auto_in_a_bits_param    (_atomics_auto_out_a_bits_param),
    .auto_in_a_bits_size     (_atomics_auto_out_a_bits_size),
    .auto_in_a_bits_source   (_atomics_auto_out_a_bits_source),
    .auto_in_a_bits_address  (_atomics_auto_out_a_bits_address),
    .auto_in_a_bits_mask     (_atomics_auto_out_a_bits_mask),
    .auto_in_a_bits_data     (_atomics_auto_out_a_bits_data),
    .auto_in_a_bits_corrupt  (_atomics_auto_out_a_bits_corrupt),
    .auto_in_d_ready         (_atomics_auto_out_d_ready),
    .auto_in_d_valid         (_buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink     (_buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied   (_buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_buffer_auto_in_d_bits_corrupt),
    .auto_out_a_ready        (_fixer_auto_in_a_ready),
    .auto_out_a_valid        (_buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address (_buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_buffer_auto_out_d_ready),
    .auto_out_d_valid        (_fixer_auto_in_d_valid),
    .auto_out_d_bits_opcode  (_fixer_auto_in_d_bits_opcode),
    .auto_out_d_bits_size    (_fixer_auto_in_d_bits_size),
    .auto_out_d_bits_source  (_fixer_auto_in_d_bits_source),
    .auto_out_d_bits_data    (_fixer_auto_in_d_bits_data)
  );
  TLAtomicAutomata atomics (
    .clock                   (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock),
    .reset                   (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset),
    .auto_in_a_ready         (_atomics_auto_in_a_ready),
    .auto_in_a_valid         (_buffer_1_auto_out_a_valid),
    .auto_in_a_bits_opcode   (_buffer_1_auto_out_a_bits_opcode),
    .auto_in_a_bits_param    (_buffer_1_auto_out_a_bits_param),
    .auto_in_a_bits_size     (_buffer_1_auto_out_a_bits_size),
    .auto_in_a_bits_source   (_buffer_1_auto_out_a_bits_source),
    .auto_in_a_bits_address  (_buffer_1_auto_out_a_bits_address),
    .auto_in_a_bits_mask     (_buffer_1_auto_out_a_bits_mask),
    .auto_in_a_bits_data     (_buffer_1_auto_out_a_bits_data),
    .auto_in_a_bits_corrupt  (_buffer_1_auto_out_a_bits_corrupt),
    .auto_in_d_ready         (_buffer_1_auto_out_d_ready),
    .auto_in_d_valid         (_atomics_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_atomics_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_atomics_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_atomics_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_atomics_auto_in_d_bits_source),
    .auto_in_d_bits_sink     (_atomics_auto_in_d_bits_sink),
    .auto_in_d_bits_denied   (_atomics_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_atomics_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_atomics_auto_in_d_bits_corrupt),
    .auto_out_a_ready        (_buffer_auto_in_a_ready),
    .auto_out_a_valid        (_atomics_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_atomics_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_atomics_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_atomics_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_atomics_auto_out_a_bits_source),
    .auto_out_a_bits_address (_atomics_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_atomics_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_atomics_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_atomics_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_atomics_auto_out_d_ready),
    .auto_out_d_valid        (_buffer_auto_in_d_valid),
    .auto_out_d_bits_opcode  (_buffer_auto_in_d_bits_opcode),
    .auto_out_d_bits_param   (_buffer_auto_in_d_bits_param),
    .auto_out_d_bits_size    (_buffer_auto_in_d_bits_size),
    .auto_out_d_bits_source  (_buffer_auto_in_d_bits_source),
    .auto_out_d_bits_sink    (_buffer_auto_in_d_bits_sink),
    .auto_out_d_bits_denied  (_buffer_auto_in_d_bits_denied),
    .auto_out_d_bits_data    (_buffer_auto_in_d_bits_data),
    .auto_out_d_bits_corrupt (_buffer_auto_in_d_bits_corrupt)
  );
  TLBuffer_1 buffer_1 (
    .clock                   (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock),
    .reset                   (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset),
    .auto_in_a_ready         (auto_bus_xing_in_a_ready),
    .auto_in_a_valid         (auto_bus_xing_in_a_valid),
    .auto_in_a_bits_opcode   (auto_bus_xing_in_a_bits_opcode),
    .auto_in_a_bits_param    (auto_bus_xing_in_a_bits_param),
    .auto_in_a_bits_size     (auto_bus_xing_in_a_bits_size),
    .auto_in_a_bits_source   (auto_bus_xing_in_a_bits_source),
    .auto_in_a_bits_address  (auto_bus_xing_in_a_bits_address),
    .auto_in_a_bits_mask     (auto_bus_xing_in_a_bits_mask),
    .auto_in_a_bits_data     (auto_bus_xing_in_a_bits_data),
    .auto_in_a_bits_corrupt  (auto_bus_xing_in_a_bits_corrupt),
    .auto_in_d_ready         (auto_bus_xing_in_d_ready),
    .auto_in_d_valid         (auto_bus_xing_in_d_valid),
    .auto_in_d_bits_opcode   (auto_bus_xing_in_d_bits_opcode),
    .auto_in_d_bits_param    (auto_bus_xing_in_d_bits_param),
    .auto_in_d_bits_size     (auto_bus_xing_in_d_bits_size),
    .auto_in_d_bits_source   (auto_bus_xing_in_d_bits_source),
    .auto_in_d_bits_sink     (auto_bus_xing_in_d_bits_sink),
    .auto_in_d_bits_denied   (auto_bus_xing_in_d_bits_denied),
    .auto_in_d_bits_data     (auto_bus_xing_in_d_bits_data),
    .auto_in_d_bits_corrupt  (auto_bus_xing_in_d_bits_corrupt),
    .auto_out_a_ready        (_atomics_auto_in_a_ready),
    .auto_out_a_valid        (_buffer_1_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_buffer_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_buffer_1_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_buffer_1_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_buffer_1_auto_out_a_bits_source),
    .auto_out_a_bits_address (_buffer_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_buffer_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_buffer_1_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_buffer_1_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_buffer_1_auto_out_d_ready),
    .auto_out_d_valid        (_atomics_auto_in_d_valid),
    .auto_out_d_bits_opcode  (_atomics_auto_in_d_bits_opcode),
    .auto_out_d_bits_param   (_atomics_auto_in_d_bits_param),
    .auto_out_d_bits_size    (_atomics_auto_in_d_bits_size),
    .auto_out_d_bits_source  (_atomics_auto_in_d_bits_source),
    .auto_out_d_bits_sink    (_atomics_auto_in_d_bits_sink),
    .auto_out_d_bits_denied  (_atomics_auto_in_d_bits_denied),
    .auto_out_d_bits_data    (_atomics_auto_in_d_bits_data),
    .auto_out_d_bits_corrupt (_atomics_auto_in_d_bits_corrupt)
  );
  TLInterconnectCoupler_4 coupler_to_bootaddressreg (
    .clock                              (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock),
    .reset                              (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset),
    .auto_fragmenter_out_a_ready        (_coupler_to_bootaddressreg_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_a_valid        (_coupler_to_bootaddressreg_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode  (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param   (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size    (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source  (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask    (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data    (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready        (_coupler_to_bootaddressreg_auto_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid        (_coupler_to_bootaddressreg_auto_fragmenter_out_a_valid),
    .auto_fragmenter_out_d_bits_opcode  (nodeIn_d_bits_opcode),
    .auto_fragmenter_out_d_bits_size    (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_d_bits_source  (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_d_bits_data    (_out_out_bits_data_T_1 ? pad : 64'h0),
    .auto_tl_in_a_ready                 (_coupler_to_bootaddressreg_auto_tl_in_a_ready),
    .auto_tl_in_a_valid                 (_fixer_auto_out_a_valid),
    .auto_tl_in_a_bits_opcode           (_fixer_auto_out_a_bits_opcode),
    .auto_tl_in_a_bits_param            (_fixer_auto_out_a_bits_param),
    .auto_tl_in_a_bits_size             (_fixer_auto_out_a_bits_size),
    .auto_tl_in_a_bits_source           (_fixer_auto_out_a_bits_source),
    .auto_tl_in_a_bits_address          (_fixer_auto_out_a_bits_address),
    .auto_tl_in_a_bits_mask             (_fixer_auto_out_a_bits_mask),
    .auto_tl_in_a_bits_data             (_fixer_auto_out_a_bits_data),
    .auto_tl_in_a_bits_corrupt          (_fixer_auto_out_a_bits_corrupt),
    .auto_tl_in_d_ready                 (_fixer_auto_out_d_ready),
    .auto_tl_in_d_valid                 (_coupler_to_bootaddressreg_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode           (_coupler_to_bootaddressreg_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size             (_coupler_to_bootaddressreg_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source           (_coupler_to_bootaddressreg_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data             (_coupler_to_bootaddressreg_auto_tl_in_d_bits_data)
  );
  TLMonitor_9 monitor (
    .clock                (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock),
    .reset                (auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset),
    .io_in_a_ready        (_coupler_to_bootaddressreg_auto_fragmenter_out_d_ready),
    .io_in_a_valid        (_coupler_to_bootaddressreg_auto_fragmenter_out_a_valid),
    .io_in_a_bits_opcode  (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_opcode),
    .io_in_a_bits_param   (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_param),
    .io_in_a_bits_size    (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_size),
    .io_in_a_bits_source  (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_source),
    .io_in_a_bits_address (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_address),
    .io_in_a_bits_mask    (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_mask),
    .io_in_a_bits_corrupt (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_corrupt),
    .io_in_d_ready        (_coupler_to_bootaddressreg_auto_fragmenter_out_d_ready),
    .io_in_d_valid        (_coupler_to_bootaddressreg_auto_fragmenter_out_a_valid),
    .io_in_d_bits_opcode  (nodeIn_d_bits_opcode),
    .io_in_d_bits_size    (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_size),
    .io_in_d_bits_source  (_coupler_to_bootaddressreg_auto_fragmenter_out_a_bits_source)
  );
  assign clock = auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock;
  assign reset = auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset;
endmodule

