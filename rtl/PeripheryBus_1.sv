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

module PeripheryBus_1(
  input         auto_coupler_to_prci_ctrl_fixer_out_a_ready,
  output        auto_coupler_to_prci_ctrl_fixer_out_a_valid,
  output [2:0]  auto_coupler_to_prci_ctrl_fixer_out_a_bits_opcode,
                auto_coupler_to_prci_ctrl_fixer_out_a_bits_param,
                auto_coupler_to_prci_ctrl_fixer_out_a_bits_size,
  output [5:0]  auto_coupler_to_prci_ctrl_fixer_out_a_bits_source,
  output [20:0] auto_coupler_to_prci_ctrl_fixer_out_a_bits_address,
  output [7:0]  auto_coupler_to_prci_ctrl_fixer_out_a_bits_mask,
  output [63:0] auto_coupler_to_prci_ctrl_fixer_out_a_bits_data,
  output        auto_coupler_to_prci_ctrl_fixer_out_a_bits_corrupt,
                auto_coupler_to_prci_ctrl_fixer_out_d_ready,
  input         auto_coupler_to_prci_ctrl_fixer_out_d_valid,
  input  [2:0]  auto_coupler_to_prci_ctrl_fixer_out_d_bits_opcode,
                auto_coupler_to_prci_ctrl_fixer_out_d_bits_size,
  input  [5:0]  auto_coupler_to_prci_ctrl_fixer_out_d_bits_source,
  input  [63:0] auto_coupler_to_prci_ctrl_fixer_out_d_bits_data,
  input         auto_coupler_to_bootrom_fragmenter_out_a_ready,
  output        auto_coupler_to_bootrom_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode,
                auto_coupler_to_bootrom_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_size,
  output [9:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_source,
  output [16:0] auto_coupler_to_bootrom_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_mask,
  output        auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt,
                auto_coupler_to_bootrom_fragmenter_out_d_ready,
  input         auto_coupler_to_bootrom_fragmenter_out_d_valid,
  input  [1:0]  auto_coupler_to_bootrom_fragmenter_out_d_bits_size,
  input  [9:0]  auto_coupler_to_bootrom_fragmenter_out_d_bits_source,
  input  [63:0] auto_coupler_to_bootrom_fragmenter_out_d_bits_data,
  input         auto_coupler_to_debug_fragmenter_out_a_ready,
  output        auto_coupler_to_debug_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_debug_fragmenter_out_a_bits_opcode,
                auto_coupler_to_debug_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_debug_fragmenter_out_a_bits_size,
  output [9:0]  auto_coupler_to_debug_fragmenter_out_a_bits_source,
  output [11:0] auto_coupler_to_debug_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_debug_fragmenter_out_a_bits_mask,
  output [63:0] auto_coupler_to_debug_fragmenter_out_a_bits_data,
  output        auto_coupler_to_debug_fragmenter_out_a_bits_corrupt,
                auto_coupler_to_debug_fragmenter_out_d_ready,
  input         auto_coupler_to_debug_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_debug_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_debug_fragmenter_out_d_bits_size,
  input  [9:0]  auto_coupler_to_debug_fragmenter_out_d_bits_source,
  input  [63:0] auto_coupler_to_debug_fragmenter_out_d_bits_data,
  input         auto_coupler_to_clint_fragmenter_out_a_ready,
  output        auto_coupler_to_clint_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_clint_fragmenter_out_a_bits_opcode,
                auto_coupler_to_clint_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_clint_fragmenter_out_a_bits_size,
  output [9:0]  auto_coupler_to_clint_fragmenter_out_a_bits_source,
  output [25:0] auto_coupler_to_clint_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_clint_fragmenter_out_a_bits_mask,
  output [63:0] auto_coupler_to_clint_fragmenter_out_a_bits_data,
  output        auto_coupler_to_clint_fragmenter_out_a_bits_corrupt,
                auto_coupler_to_clint_fragmenter_out_d_ready,
  input         auto_coupler_to_clint_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_clint_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_clint_fragmenter_out_d_bits_size,
  input  [9:0]  auto_coupler_to_clint_fragmenter_out_d_bits_source,
  input  [63:0] auto_coupler_to_clint_fragmenter_out_d_bits_data,
  input         auto_coupler_to_plic_fragmenter_out_a_ready,
  output        auto_coupler_to_plic_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_plic_fragmenter_out_a_bits_opcode,
                auto_coupler_to_plic_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_plic_fragmenter_out_a_bits_size,
  output [9:0]  auto_coupler_to_plic_fragmenter_out_a_bits_source,
  output [27:0] auto_coupler_to_plic_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_plic_fragmenter_out_a_bits_mask,
  output [63:0] auto_coupler_to_plic_fragmenter_out_a_bits_data,
  output        auto_coupler_to_plic_fragmenter_out_a_bits_corrupt,
                auto_coupler_to_plic_fragmenter_out_d_ready,
  input         auto_coupler_to_plic_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_plic_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_plic_fragmenter_out_d_bits_size,
  input  [9:0]  auto_coupler_to_plic_fragmenter_out_d_bits_source,
  input  [63:0] auto_coupler_to_plic_fragmenter_out_d_bits_data,
  input         auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_ready,
  output        auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid,
  output [2:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_opcode,
                auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_param,
                auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_size,
  output [5:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_source,
  output [12:0] auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_address,
  output [7:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_mask,
  output [63:0] auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_data,
  output        auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_corrupt,
                auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready,
  input         auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_valid,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_param,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_size,
  input  [5:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_source,
  input         auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_sink,
                auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_denied,
  input  [63:0] auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_data,
  input         auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_corrupt,
  output        auto_fixedClockNode_out_4_clock,
                auto_fixedClockNode_out_4_reset,
                auto_fixedClockNode_out_3_clock,
                auto_fixedClockNode_out_3_reset,
                auto_fixedClockNode_out_2_clock,
                auto_fixedClockNode_out_2_reset,
                auto_fixedClockNode_out_0_clock,
                auto_fixedClockNode_out_0_reset,
  input         auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock,
                auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset,
  output        auto_bus_xing_in_a_ready,
  input         auto_bus_xing_in_a_valid,
  input  [2:0]  auto_bus_xing_in_a_bits_opcode,
                auto_bus_xing_in_a_bits_param,
  input  [3:0]  auto_bus_xing_in_a_bits_size,
  input  [5:0]  auto_bus_xing_in_a_bits_source,
  input  [27:0] auto_bus_xing_in_a_bits_address,
  input  [7:0]  auto_bus_xing_in_a_bits_mask,
  input  [63:0] auto_bus_xing_in_a_bits_data,
  input         auto_bus_xing_in_a_bits_corrupt,
                auto_bus_xing_in_d_ready,
  output        auto_bus_xing_in_d_valid,
  output [2:0]  auto_bus_xing_in_d_bits_opcode,
  output [1:0]  auto_bus_xing_in_d_bits_param,
  output [3:0]  auto_bus_xing_in_d_bits_size,
  output [5:0]  auto_bus_xing_in_d_bits_source,
  output        auto_bus_xing_in_d_bits_sink,
                auto_bus_xing_in_d_bits_denied,
  output [63:0] auto_bus_xing_in_d_bits_data,
  output        auto_bus_xing_in_d_bits_corrupt,
                clock,
                reset
);

  wire        _coupler_to_prci_ctrl_auto_tl_in_a_ready;
  wire        _coupler_to_prci_ctrl_auto_tl_in_d_valid;
  wire [2:0]  _coupler_to_prci_ctrl_auto_tl_in_d_bits_opcode;
  wire [1:0]  _coupler_to_prci_ctrl_auto_tl_in_d_bits_param;
  wire [2:0]  _coupler_to_prci_ctrl_auto_tl_in_d_bits_size;
  wire [5:0]  _coupler_to_prci_ctrl_auto_tl_in_d_bits_source;
  wire        _coupler_to_prci_ctrl_auto_tl_in_d_bits_sink;
  wire        _coupler_to_prci_ctrl_auto_tl_in_d_bits_denied;
  wire [63:0] _coupler_to_prci_ctrl_auto_tl_in_d_bits_data;
  wire        _coupler_to_prci_ctrl_auto_tl_in_d_bits_corrupt;
  wire        _coupler_to_bootrom_auto_tl_in_a_ready;
  wire        _coupler_to_bootrom_auto_tl_in_d_valid;
  wire [2:0]  _coupler_to_bootrom_auto_tl_in_d_bits_size;
  wire [5:0]  _coupler_to_bootrom_auto_tl_in_d_bits_source;
  wire [63:0] _coupler_to_bootrom_auto_tl_in_d_bits_data;
  wire        _coupler_to_debug_auto_tl_in_a_ready;
  wire        _coupler_to_debug_auto_tl_in_d_valid;
  wire [2:0]  _coupler_to_debug_auto_tl_in_d_bits_opcode;
  wire [2:0]  _coupler_to_debug_auto_tl_in_d_bits_size;
  wire [5:0]  _coupler_to_debug_auto_tl_in_d_bits_source;
  wire [63:0] _coupler_to_debug_auto_tl_in_d_bits_data;
  wire        _coupler_to_clint_auto_tl_in_a_ready;
  wire        _coupler_to_clint_auto_tl_in_d_valid;
  wire [2:0]  _coupler_to_clint_auto_tl_in_d_bits_opcode;
  wire [2:0]  _coupler_to_clint_auto_tl_in_d_bits_size;
  wire [5:0]  _coupler_to_clint_auto_tl_in_d_bits_source;
  wire [63:0] _coupler_to_clint_auto_tl_in_d_bits_data;
  wire        _coupler_to_plic_auto_tl_in_a_ready;
  wire        _coupler_to_plic_auto_tl_in_d_valid;
  wire [2:0]  _coupler_to_plic_auto_tl_in_d_bits_opcode;
  wire [2:0]  _coupler_to_plic_auto_tl_in_d_bits_size;
  wire [5:0]  _coupler_to_plic_auto_tl_in_d_bits_source;
  wire [63:0] _coupler_to_plic_auto_tl_in_d_bits_data;
  wire        _wrapped_error_device_auto_buffer_in_a_ready;
  wire        _wrapped_error_device_auto_buffer_in_d_valid;
  wire [2:0]  _wrapped_error_device_auto_buffer_in_d_bits_opcode;
  wire [1:0]  _wrapped_error_device_auto_buffer_in_d_bits_param;
  wire [3:0]  _wrapped_error_device_auto_buffer_in_d_bits_size;
  wire [5:0]  _wrapped_error_device_auto_buffer_in_d_bits_source;
  wire        _wrapped_error_device_auto_buffer_in_d_bits_sink;
  wire        _wrapped_error_device_auto_buffer_in_d_bits_denied;
  wire [63:0] _wrapped_error_device_auto_buffer_in_d_bits_data;
  wire        _wrapped_error_device_auto_buffer_in_d_bits_corrupt;
  wire        _atomics_auto_out_a_valid;
  wire [2:0]  _atomics_auto_out_a_bits_opcode;
  wire [2:0]  _atomics_auto_out_a_bits_param;
  wire [3:0]  _atomics_auto_out_a_bits_size;
  wire [5:0]  _atomics_auto_out_a_bits_source;
  wire [27:0] _atomics_auto_out_a_bits_address;
  wire [7:0]  _atomics_auto_out_a_bits_mask;
  wire [63:0] _atomics_auto_out_a_bits_data;
  wire        _atomics_auto_out_a_bits_corrupt;
  wire        _atomics_auto_out_d_ready;
  wire        _buffer_auto_in_a_ready;
  wire        _buffer_auto_in_d_valid;
  wire [2:0]  _buffer_auto_in_d_bits_opcode;
  wire [1:0]  _buffer_auto_in_d_bits_param;
  wire [3:0]  _buffer_auto_in_d_bits_size;
  wire [5:0]  _buffer_auto_in_d_bits_source;
  wire        _buffer_auto_in_d_bits_sink;
  wire        _buffer_auto_in_d_bits_denied;
  wire [63:0] _buffer_auto_in_d_bits_data;
  wire        _buffer_auto_in_d_bits_corrupt;
  wire        _buffer_auto_out_a_valid;
  wire [2:0]  _buffer_auto_out_a_bits_opcode;
  wire [2:0]  _buffer_auto_out_a_bits_param;
  wire [3:0]  _buffer_auto_out_a_bits_size;
  wire [5:0]  _buffer_auto_out_a_bits_source;
  wire [27:0] _buffer_auto_out_a_bits_address;
  wire [7:0]  _buffer_auto_out_a_bits_mask;
  wire [63:0] _buffer_auto_out_a_bits_data;
  wire        _buffer_auto_out_a_bits_corrupt;
  wire        _buffer_auto_out_d_ready;
  wire        _out_xbar_auto_in_a_ready;
  wire        _out_xbar_auto_in_d_valid;
  wire [2:0]  _out_xbar_auto_in_d_bits_opcode;
  wire [1:0]  _out_xbar_auto_in_d_bits_param;
  wire [3:0]  _out_xbar_auto_in_d_bits_size;
  wire [5:0]  _out_xbar_auto_in_d_bits_source;
  wire        _out_xbar_auto_in_d_bits_sink;
  wire        _out_xbar_auto_in_d_bits_denied;
  wire [63:0] _out_xbar_auto_in_d_bits_data;
  wire        _out_xbar_auto_in_d_bits_corrupt;
  wire        _out_xbar_auto_out_6_a_valid;
  wire [2:0]  _out_xbar_auto_out_6_a_bits_opcode;
  wire [2:0]  _out_xbar_auto_out_6_a_bits_param;
  wire [2:0]  _out_xbar_auto_out_6_a_bits_size;
  wire [5:0]  _out_xbar_auto_out_6_a_bits_source;
  wire [20:0] _out_xbar_auto_out_6_a_bits_address;
  wire [7:0]  _out_xbar_auto_out_6_a_bits_mask;
  wire [63:0] _out_xbar_auto_out_6_a_bits_data;
  wire        _out_xbar_auto_out_6_a_bits_corrupt;
  wire        _out_xbar_auto_out_6_d_ready;
  wire        _out_xbar_auto_out_5_a_valid;
  wire [2:0]  _out_xbar_auto_out_5_a_bits_opcode;
  wire [2:0]  _out_xbar_auto_out_5_a_bits_param;
  wire [2:0]  _out_xbar_auto_out_5_a_bits_size;
  wire [5:0]  _out_xbar_auto_out_5_a_bits_source;
  wire [16:0] _out_xbar_auto_out_5_a_bits_address;
  wire [7:0]  _out_xbar_auto_out_5_a_bits_mask;
  wire        _out_xbar_auto_out_5_a_bits_corrupt;
  wire        _out_xbar_auto_out_5_d_ready;
  wire        _out_xbar_auto_out_4_a_valid;
  wire [2:0]  _out_xbar_auto_out_4_a_bits_opcode;
  wire [2:0]  _out_xbar_auto_out_4_a_bits_param;
  wire [2:0]  _out_xbar_auto_out_4_a_bits_size;
  wire [5:0]  _out_xbar_auto_out_4_a_bits_source;
  wire [11:0] _out_xbar_auto_out_4_a_bits_address;
  wire [7:0]  _out_xbar_auto_out_4_a_bits_mask;
  wire [63:0] _out_xbar_auto_out_4_a_bits_data;
  wire        _out_xbar_auto_out_4_a_bits_corrupt;
  wire        _out_xbar_auto_out_4_d_ready;
  wire        _out_xbar_auto_out_3_a_valid;
  wire [2:0]  _out_xbar_auto_out_3_a_bits_opcode;
  wire [2:0]  _out_xbar_auto_out_3_a_bits_param;
  wire [2:0]  _out_xbar_auto_out_3_a_bits_size;
  wire [5:0]  _out_xbar_auto_out_3_a_bits_source;
  wire [25:0] _out_xbar_auto_out_3_a_bits_address;
  wire [7:0]  _out_xbar_auto_out_3_a_bits_mask;
  wire [63:0] _out_xbar_auto_out_3_a_bits_data;
  wire        _out_xbar_auto_out_3_a_bits_corrupt;
  wire        _out_xbar_auto_out_3_d_ready;
  wire        _out_xbar_auto_out_2_a_valid;
  wire [2:0]  _out_xbar_auto_out_2_a_bits_opcode;
  wire [2:0]  _out_xbar_auto_out_2_a_bits_param;
  wire [2:0]  _out_xbar_auto_out_2_a_bits_size;
  wire [5:0]  _out_xbar_auto_out_2_a_bits_source;
  wire [27:0] _out_xbar_auto_out_2_a_bits_address;
  wire [7:0]  _out_xbar_auto_out_2_a_bits_mask;
  wire [63:0] _out_xbar_auto_out_2_a_bits_data;
  wire        _out_xbar_auto_out_2_a_bits_corrupt;
  wire        _out_xbar_auto_out_2_d_ready;
  wire        _out_xbar_auto_out_0_a_valid;
  wire [2:0]  _out_xbar_auto_out_0_a_bits_opcode;
  wire [2:0]  _out_xbar_auto_out_0_a_bits_param;
  wire [3:0]  _out_xbar_auto_out_0_a_bits_size;
  wire [5:0]  _out_xbar_auto_out_0_a_bits_source;
  wire [13:0] _out_xbar_auto_out_0_a_bits_address;
  wire [7:0]  _out_xbar_auto_out_0_a_bits_mask;
  wire [63:0] _out_xbar_auto_out_0_a_bits_data;
  wire        _out_xbar_auto_out_0_a_bits_corrupt;
  wire        _out_xbar_auto_out_0_d_ready;
  wire        _fixer_auto_in_a_ready;
  wire        _fixer_auto_in_d_valid;
  wire [2:0]  _fixer_auto_in_d_bits_opcode;
  wire [1:0]  _fixer_auto_in_d_bits_param;
  wire [3:0]  _fixer_auto_in_d_bits_size;
  wire [5:0]  _fixer_auto_in_d_bits_source;
  wire        _fixer_auto_in_d_bits_sink;
  wire        _fixer_auto_in_d_bits_denied;
  wire [63:0] _fixer_auto_in_d_bits_data;
  wire        _fixer_auto_in_d_bits_corrupt;
  wire        _fixer_auto_out_a_valid;
  wire [2:0]  _fixer_auto_out_a_bits_opcode;
  wire [2:0]  _fixer_auto_out_a_bits_param;
  wire [3:0]  _fixer_auto_out_a_bits_size;
  wire [5:0]  _fixer_auto_out_a_bits_source;
  wire [27:0] _fixer_auto_out_a_bits_address;
  wire [7:0]  _fixer_auto_out_a_bits_mask;
  wire [63:0] _fixer_auto_out_a_bits_data;
  wire        _fixer_auto_out_a_bits_corrupt;
  wire        _fixer_auto_out_d_ready;
  wire        _fixedClockNode_auto_out_0_clock;
  wire        _fixedClockNode_auto_out_0_reset;
  FixedClockBroadcast_3 fixedClockNode (
    .auto_in_clock    (auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock),
    .auto_in_reset    (auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset),
    .auto_out_5_clock (auto_fixedClockNode_out_4_clock),
    .auto_out_5_reset (auto_fixedClockNode_out_4_reset),
    .auto_out_4_clock (auto_fixedClockNode_out_3_clock),
    .auto_out_4_reset (auto_fixedClockNode_out_3_reset),
    .auto_out_3_clock (auto_fixedClockNode_out_2_clock),
    .auto_out_3_reset (auto_fixedClockNode_out_2_reset),
    .auto_out_1_clock (auto_fixedClockNode_out_0_clock),
    .auto_out_1_reset (auto_fixedClockNode_out_0_reset),
    .auto_out_0_clock (_fixedClockNode_auto_out_0_clock),
    .auto_out_0_reset (_fixedClockNode_auto_out_0_reset)
  );
  TLFIFOFixer_2 fixer (
    .clock                   (_fixedClockNode_auto_out_0_clock),
    .reset                   (_fixedClockNode_auto_out_0_reset),
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
    .auto_in_d_bits_param    (_fixer_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_fixer_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_fixer_auto_in_d_bits_source),
    .auto_in_d_bits_sink     (_fixer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied   (_fixer_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_fixer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_fixer_auto_in_d_bits_corrupt),
    .auto_out_a_ready        (_out_xbar_auto_in_a_ready),
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
    .auto_out_d_valid        (_out_xbar_auto_in_d_valid),
    .auto_out_d_bits_opcode  (_out_xbar_auto_in_d_bits_opcode),
    .auto_out_d_bits_param   (_out_xbar_auto_in_d_bits_param),
    .auto_out_d_bits_size    (_out_xbar_auto_in_d_bits_size),
    .auto_out_d_bits_source  (_out_xbar_auto_in_d_bits_source),
    .auto_out_d_bits_sink    (_out_xbar_auto_in_d_bits_sink),
    .auto_out_d_bits_denied  (_out_xbar_auto_in_d_bits_denied),
    .auto_out_d_bits_data    (_out_xbar_auto_in_d_bits_data),
    .auto_out_d_bits_corrupt (_out_xbar_auto_in_d_bits_corrupt)
  );
  TLXbar_5 out_xbar (
    .clock                     (_fixedClockNode_auto_out_0_clock),
    .reset                     (_fixedClockNode_auto_out_0_reset),
    .auto_in_a_ready           (_out_xbar_auto_in_a_ready),
    .auto_in_a_valid           (_fixer_auto_out_a_valid),
    .auto_in_a_bits_opcode     (_fixer_auto_out_a_bits_opcode),
    .auto_in_a_bits_param      (_fixer_auto_out_a_bits_param),
    .auto_in_a_bits_size       (_fixer_auto_out_a_bits_size),
    .auto_in_a_bits_source     (_fixer_auto_out_a_bits_source),
    .auto_in_a_bits_address    (_fixer_auto_out_a_bits_address),
    .auto_in_a_bits_mask       (_fixer_auto_out_a_bits_mask),
    .auto_in_a_bits_data       (_fixer_auto_out_a_bits_data),
    .auto_in_a_bits_corrupt    (_fixer_auto_out_a_bits_corrupt),
    .auto_in_d_ready           (_fixer_auto_out_d_ready),
    .auto_in_d_valid           (_out_xbar_auto_in_d_valid),
    .auto_in_d_bits_opcode     (_out_xbar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param      (_out_xbar_auto_in_d_bits_param),
    .auto_in_d_bits_size       (_out_xbar_auto_in_d_bits_size),
    .auto_in_d_bits_source     (_out_xbar_auto_in_d_bits_source),
    .auto_in_d_bits_sink       (_out_xbar_auto_in_d_bits_sink),
    .auto_in_d_bits_denied     (_out_xbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data       (_out_xbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt    (_out_xbar_auto_in_d_bits_corrupt),
    .auto_out_6_a_ready        (_coupler_to_prci_ctrl_auto_tl_in_a_ready),
    .auto_out_6_a_valid        (_out_xbar_auto_out_6_a_valid),
    .auto_out_6_a_bits_opcode  (_out_xbar_auto_out_6_a_bits_opcode),
    .auto_out_6_a_bits_param   (_out_xbar_auto_out_6_a_bits_param),
    .auto_out_6_a_bits_size    (_out_xbar_auto_out_6_a_bits_size),
    .auto_out_6_a_bits_source  (_out_xbar_auto_out_6_a_bits_source),
    .auto_out_6_a_bits_address (_out_xbar_auto_out_6_a_bits_address),
    .auto_out_6_a_bits_mask    (_out_xbar_auto_out_6_a_bits_mask),
    .auto_out_6_a_bits_data    (_out_xbar_auto_out_6_a_bits_data),
    .auto_out_6_a_bits_corrupt (_out_xbar_auto_out_6_a_bits_corrupt),
    .auto_out_6_d_ready        (_out_xbar_auto_out_6_d_ready),
    .auto_out_6_d_valid        (_coupler_to_prci_ctrl_auto_tl_in_d_valid),
    .auto_out_6_d_bits_opcode  (_coupler_to_prci_ctrl_auto_tl_in_d_bits_opcode),
    .auto_out_6_d_bits_param   (_coupler_to_prci_ctrl_auto_tl_in_d_bits_param),
    .auto_out_6_d_bits_size    (_coupler_to_prci_ctrl_auto_tl_in_d_bits_size),
    .auto_out_6_d_bits_source  (_coupler_to_prci_ctrl_auto_tl_in_d_bits_source),
    .auto_out_6_d_bits_sink    (_coupler_to_prci_ctrl_auto_tl_in_d_bits_sink),
    .auto_out_6_d_bits_denied  (_coupler_to_prci_ctrl_auto_tl_in_d_bits_denied),
    .auto_out_6_d_bits_data    (_coupler_to_prci_ctrl_auto_tl_in_d_bits_data),
    .auto_out_6_d_bits_corrupt (_coupler_to_prci_ctrl_auto_tl_in_d_bits_corrupt),
    .auto_out_5_a_ready        (_coupler_to_bootrom_auto_tl_in_a_ready),
    .auto_out_5_a_valid        (_out_xbar_auto_out_5_a_valid),
    .auto_out_5_a_bits_opcode  (_out_xbar_auto_out_5_a_bits_opcode),
    .auto_out_5_a_bits_param   (_out_xbar_auto_out_5_a_bits_param),
    .auto_out_5_a_bits_size    (_out_xbar_auto_out_5_a_bits_size),
    .auto_out_5_a_bits_source  (_out_xbar_auto_out_5_a_bits_source),
    .auto_out_5_a_bits_address (_out_xbar_auto_out_5_a_bits_address),
    .auto_out_5_a_bits_mask    (_out_xbar_auto_out_5_a_bits_mask),
    .auto_out_5_a_bits_corrupt (_out_xbar_auto_out_5_a_bits_corrupt),
    .auto_out_5_d_ready        (_out_xbar_auto_out_5_d_ready),
    .auto_out_5_d_valid        (_coupler_to_bootrom_auto_tl_in_d_valid),
    .auto_out_5_d_bits_size    (_coupler_to_bootrom_auto_tl_in_d_bits_size),
    .auto_out_5_d_bits_source  (_coupler_to_bootrom_auto_tl_in_d_bits_source),
    .auto_out_5_d_bits_data    (_coupler_to_bootrom_auto_tl_in_d_bits_data),
    .auto_out_4_a_ready        (_coupler_to_debug_auto_tl_in_a_ready),
    .auto_out_4_a_valid        (_out_xbar_auto_out_4_a_valid),
    .auto_out_4_a_bits_opcode  (_out_xbar_auto_out_4_a_bits_opcode),
    .auto_out_4_a_bits_param   (_out_xbar_auto_out_4_a_bits_param),
    .auto_out_4_a_bits_size    (_out_xbar_auto_out_4_a_bits_size),
    .auto_out_4_a_bits_source  (_out_xbar_auto_out_4_a_bits_source),
    .auto_out_4_a_bits_address (_out_xbar_auto_out_4_a_bits_address),
    .auto_out_4_a_bits_mask    (_out_xbar_auto_out_4_a_bits_mask),
    .auto_out_4_a_bits_data    (_out_xbar_auto_out_4_a_bits_data),
    .auto_out_4_a_bits_corrupt (_out_xbar_auto_out_4_a_bits_corrupt),
    .auto_out_4_d_ready        (_out_xbar_auto_out_4_d_ready),
    .auto_out_4_d_valid        (_coupler_to_debug_auto_tl_in_d_valid),
    .auto_out_4_d_bits_opcode  (_coupler_to_debug_auto_tl_in_d_bits_opcode),
    .auto_out_4_d_bits_size    (_coupler_to_debug_auto_tl_in_d_bits_size),
    .auto_out_4_d_bits_source  (_coupler_to_debug_auto_tl_in_d_bits_source),
    .auto_out_4_d_bits_data    (_coupler_to_debug_auto_tl_in_d_bits_data),
    .auto_out_3_a_ready        (_coupler_to_clint_auto_tl_in_a_ready),
    .auto_out_3_a_valid        (_out_xbar_auto_out_3_a_valid),
    .auto_out_3_a_bits_opcode  (_out_xbar_auto_out_3_a_bits_opcode),
    .auto_out_3_a_bits_param   (_out_xbar_auto_out_3_a_bits_param),
    .auto_out_3_a_bits_size    (_out_xbar_auto_out_3_a_bits_size),
    .auto_out_3_a_bits_source  (_out_xbar_auto_out_3_a_bits_source),
    .auto_out_3_a_bits_address (_out_xbar_auto_out_3_a_bits_address),
    .auto_out_3_a_bits_mask    (_out_xbar_auto_out_3_a_bits_mask),
    .auto_out_3_a_bits_data    (_out_xbar_auto_out_3_a_bits_data),
    .auto_out_3_a_bits_corrupt (_out_xbar_auto_out_3_a_bits_corrupt),
    .auto_out_3_d_ready        (_out_xbar_auto_out_3_d_ready),
    .auto_out_3_d_valid        (_coupler_to_clint_auto_tl_in_d_valid),
    .auto_out_3_d_bits_opcode  (_coupler_to_clint_auto_tl_in_d_bits_opcode),
    .auto_out_3_d_bits_size    (_coupler_to_clint_auto_tl_in_d_bits_size),
    .auto_out_3_d_bits_source  (_coupler_to_clint_auto_tl_in_d_bits_source),
    .auto_out_3_d_bits_data    (_coupler_to_clint_auto_tl_in_d_bits_data),
    .auto_out_2_a_ready        (_coupler_to_plic_auto_tl_in_a_ready),
    .auto_out_2_a_valid        (_out_xbar_auto_out_2_a_valid),
    .auto_out_2_a_bits_opcode  (_out_xbar_auto_out_2_a_bits_opcode),
    .auto_out_2_a_bits_param   (_out_xbar_auto_out_2_a_bits_param),
    .auto_out_2_a_bits_size    (_out_xbar_auto_out_2_a_bits_size),
    .auto_out_2_a_bits_source  (_out_xbar_auto_out_2_a_bits_source),
    .auto_out_2_a_bits_address (_out_xbar_auto_out_2_a_bits_address),
    .auto_out_2_a_bits_mask    (_out_xbar_auto_out_2_a_bits_mask),
    .auto_out_2_a_bits_data    (_out_xbar_auto_out_2_a_bits_data),
    .auto_out_2_a_bits_corrupt (_out_xbar_auto_out_2_a_bits_corrupt),
    .auto_out_2_d_ready        (_out_xbar_auto_out_2_d_ready),
    .auto_out_2_d_valid        (_coupler_to_plic_auto_tl_in_d_valid),
    .auto_out_2_d_bits_opcode  (_coupler_to_plic_auto_tl_in_d_bits_opcode),
    .auto_out_2_d_bits_size    (_coupler_to_plic_auto_tl_in_d_bits_size),
    .auto_out_2_d_bits_source  (_coupler_to_plic_auto_tl_in_d_bits_source),
    .auto_out_2_d_bits_data    (_coupler_to_plic_auto_tl_in_d_bits_data),
    .auto_out_1_a_ready        (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_ready),
    .auto_out_1_a_valid        (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid),
    .auto_out_1_a_bits_opcode  (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_opcode),
    .auto_out_1_a_bits_param   (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_param),
    .auto_out_1_a_bits_size    (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_size),
    .auto_out_1_a_bits_source  (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_source),
    .auto_out_1_a_bits_address (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_address),
    .auto_out_1_a_bits_mask    (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_mask),
    .auto_out_1_a_bits_data    (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_data),
    .auto_out_1_a_bits_corrupt (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_corrupt),
    .auto_out_1_d_ready        (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready),
    .auto_out_1_d_valid        (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_valid),
    .auto_out_1_d_bits_opcode  (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_opcode),
    .auto_out_1_d_bits_param   (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_param),
    .auto_out_1_d_bits_size    (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_size),
    .auto_out_1_d_bits_source  (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_source),
    .auto_out_1_d_bits_sink    (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_sink),
    .auto_out_1_d_bits_denied  (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_denied),
    .auto_out_1_d_bits_data    (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_data),
    .auto_out_1_d_bits_corrupt (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_corrupt),
    .auto_out_0_a_ready        (_wrapped_error_device_auto_buffer_in_a_ready),
    .auto_out_0_a_valid        (_out_xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode  (_out_xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param   (_out_xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size    (_out_xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source  (_out_xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address (_out_xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask    (_out_xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data    (_out_xbar_auto_out_0_a_bits_data),
    .auto_out_0_a_bits_corrupt (_out_xbar_auto_out_0_a_bits_corrupt),
    .auto_out_0_d_ready        (_out_xbar_auto_out_0_d_ready),
    .auto_out_0_d_valid        (_wrapped_error_device_auto_buffer_in_d_valid),
    .auto_out_0_d_bits_opcode  (_wrapped_error_device_auto_buffer_in_d_bits_opcode),
    .auto_out_0_d_bits_param   (_wrapped_error_device_auto_buffer_in_d_bits_param),
    .auto_out_0_d_bits_size    (_wrapped_error_device_auto_buffer_in_d_bits_size),
    .auto_out_0_d_bits_source  (_wrapped_error_device_auto_buffer_in_d_bits_source),
    .auto_out_0_d_bits_sink    (_wrapped_error_device_auto_buffer_in_d_bits_sink),
    .auto_out_0_d_bits_denied  (_wrapped_error_device_auto_buffer_in_d_bits_denied),
    .auto_out_0_d_bits_data    (_wrapped_error_device_auto_buffer_in_d_bits_data),
    .auto_out_0_d_bits_corrupt (_wrapped_error_device_auto_buffer_in_d_bits_corrupt)
  );
  TLBuffer_4 buffer (
    .clock                   (_fixedClockNode_auto_out_0_clock),
    .reset                   (_fixedClockNode_auto_out_0_reset),
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
    .auto_out_d_bits_param   (_fixer_auto_in_d_bits_param),
    .auto_out_d_bits_size    (_fixer_auto_in_d_bits_size),
    .auto_out_d_bits_source  (_fixer_auto_in_d_bits_source),
    .auto_out_d_bits_sink    (_fixer_auto_in_d_bits_sink),
    .auto_out_d_bits_denied  (_fixer_auto_in_d_bits_denied),
    .auto_out_d_bits_data    (_fixer_auto_in_d_bits_data),
    .auto_out_d_bits_corrupt (_fixer_auto_in_d_bits_corrupt)
  );
  TLAtomicAutomata_1 atomics (
    .clock                   (_fixedClockNode_auto_out_0_clock),
    .reset                   (_fixedClockNode_auto_out_0_reset),
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
  ErrorDeviceWrapper wrapped_error_device (
    .clock                         (_fixedClockNode_auto_out_0_clock),
    .reset                         (_fixedClockNode_auto_out_0_reset),
    .auto_buffer_in_a_ready        (_wrapped_error_device_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid        (_out_xbar_auto_out_0_a_valid),
    .auto_buffer_in_a_bits_opcode  (_out_xbar_auto_out_0_a_bits_opcode),
    .auto_buffer_in_a_bits_param   (_out_xbar_auto_out_0_a_bits_param),
    .auto_buffer_in_a_bits_size    (_out_xbar_auto_out_0_a_bits_size),
    .auto_buffer_in_a_bits_source  (_out_xbar_auto_out_0_a_bits_source),
    .auto_buffer_in_a_bits_address (_out_xbar_auto_out_0_a_bits_address),
    .auto_buffer_in_a_bits_mask    (_out_xbar_auto_out_0_a_bits_mask),
    .auto_buffer_in_a_bits_data    (_out_xbar_auto_out_0_a_bits_data),
    .auto_buffer_in_a_bits_corrupt (_out_xbar_auto_out_0_a_bits_corrupt),
    .auto_buffer_in_d_ready        (_out_xbar_auto_out_0_d_ready),
    .auto_buffer_in_d_valid        (_wrapped_error_device_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode  (_wrapped_error_device_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_param   (_wrapped_error_device_auto_buffer_in_d_bits_param),
    .auto_buffer_in_d_bits_size    (_wrapped_error_device_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source  (_wrapped_error_device_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_sink    (_wrapped_error_device_auto_buffer_in_d_bits_sink),
    .auto_buffer_in_d_bits_denied  (_wrapped_error_device_auto_buffer_in_d_bits_denied),
    .auto_buffer_in_d_bits_data    (_wrapped_error_device_auto_buffer_in_d_bits_data),
    .auto_buffer_in_d_bits_corrupt (_wrapped_error_device_auto_buffer_in_d_bits_corrupt)
  );
  TLInterconnectCoupler_7 coupler_to_plic (
    .clock                              (_fixedClockNode_auto_out_0_clock),
    .reset                              (_fixedClockNode_auto_out_0_reset),
    .auto_fragmenter_out_a_ready        (auto_coupler_to_plic_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid        (auto_coupler_to_plic_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode  (auto_coupler_to_plic_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param   (auto_coupler_to_plic_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size    (auto_coupler_to_plic_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source  (auto_coupler_to_plic_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address (auto_coupler_to_plic_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask    (auto_coupler_to_plic_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data    (auto_coupler_to_plic_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt (auto_coupler_to_plic_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready        (auto_coupler_to_plic_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid        (auto_coupler_to_plic_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode  (auto_coupler_to_plic_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_size    (auto_coupler_to_plic_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source  (auto_coupler_to_plic_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data    (auto_coupler_to_plic_fragmenter_out_d_bits_data),
    .auto_tl_in_a_ready                 (_coupler_to_plic_auto_tl_in_a_ready),
    .auto_tl_in_a_valid                 (_out_xbar_auto_out_2_a_valid),
    .auto_tl_in_a_bits_opcode           (_out_xbar_auto_out_2_a_bits_opcode),
    .auto_tl_in_a_bits_param            (_out_xbar_auto_out_2_a_bits_param),
    .auto_tl_in_a_bits_size             (_out_xbar_auto_out_2_a_bits_size),
    .auto_tl_in_a_bits_source           (_out_xbar_auto_out_2_a_bits_source),
    .auto_tl_in_a_bits_address          (_out_xbar_auto_out_2_a_bits_address),
    .auto_tl_in_a_bits_mask             (_out_xbar_auto_out_2_a_bits_mask),
    .auto_tl_in_a_bits_data             (_out_xbar_auto_out_2_a_bits_data),
    .auto_tl_in_a_bits_corrupt          (_out_xbar_auto_out_2_a_bits_corrupt),
    .auto_tl_in_d_ready                 (_out_xbar_auto_out_2_d_ready),
    .auto_tl_in_d_valid                 (_coupler_to_plic_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode           (_coupler_to_plic_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size             (_coupler_to_plic_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source           (_coupler_to_plic_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data             (_coupler_to_plic_auto_tl_in_d_bits_data)
  );
  TLInterconnectCoupler_8 coupler_to_clint (
    .clock                              (_fixedClockNode_auto_out_0_clock),
    .reset                              (_fixedClockNode_auto_out_0_reset),
    .auto_fragmenter_out_a_ready        (auto_coupler_to_clint_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid        (auto_coupler_to_clint_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode  (auto_coupler_to_clint_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param   (auto_coupler_to_clint_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size    (auto_coupler_to_clint_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source  (auto_coupler_to_clint_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address (auto_coupler_to_clint_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask    (auto_coupler_to_clint_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data    (auto_coupler_to_clint_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt (auto_coupler_to_clint_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready        (auto_coupler_to_clint_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid        (auto_coupler_to_clint_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode  (auto_coupler_to_clint_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_size    (auto_coupler_to_clint_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source  (auto_coupler_to_clint_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data    (auto_coupler_to_clint_fragmenter_out_d_bits_data),
    .auto_tl_in_a_ready                 (_coupler_to_clint_auto_tl_in_a_ready),
    .auto_tl_in_a_valid                 (_out_xbar_auto_out_3_a_valid),
    .auto_tl_in_a_bits_opcode           (_out_xbar_auto_out_3_a_bits_opcode),
    .auto_tl_in_a_bits_param            (_out_xbar_auto_out_3_a_bits_param),
    .auto_tl_in_a_bits_size             (_out_xbar_auto_out_3_a_bits_size),
    .auto_tl_in_a_bits_source           (_out_xbar_auto_out_3_a_bits_source),
    .auto_tl_in_a_bits_address          (_out_xbar_auto_out_3_a_bits_address),
    .auto_tl_in_a_bits_mask             (_out_xbar_auto_out_3_a_bits_mask),
    .auto_tl_in_a_bits_data             (_out_xbar_auto_out_3_a_bits_data),
    .auto_tl_in_a_bits_corrupt          (_out_xbar_auto_out_3_a_bits_corrupt),
    .auto_tl_in_d_ready                 (_out_xbar_auto_out_3_d_ready),
    .auto_tl_in_d_valid                 (_coupler_to_clint_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode           (_coupler_to_clint_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size             (_coupler_to_clint_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source           (_coupler_to_clint_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data             (_coupler_to_clint_auto_tl_in_d_bits_data)
  );
  TLInterconnectCoupler_10 coupler_to_debug (
    .clock                              (_fixedClockNode_auto_out_0_clock),
    .reset                              (_fixedClockNode_auto_out_0_reset),
    .auto_fragmenter_out_a_ready        (auto_coupler_to_debug_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid        (auto_coupler_to_debug_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode  (auto_coupler_to_debug_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param   (auto_coupler_to_debug_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size    (auto_coupler_to_debug_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source  (auto_coupler_to_debug_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address (auto_coupler_to_debug_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask    (auto_coupler_to_debug_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_data    (auto_coupler_to_debug_fragmenter_out_a_bits_data),
    .auto_fragmenter_out_a_bits_corrupt (auto_coupler_to_debug_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready        (auto_coupler_to_debug_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid        (auto_coupler_to_debug_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_opcode  (auto_coupler_to_debug_fragmenter_out_d_bits_opcode),
    .auto_fragmenter_out_d_bits_size    (auto_coupler_to_debug_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source  (auto_coupler_to_debug_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data    (auto_coupler_to_debug_fragmenter_out_d_bits_data),
    .auto_tl_in_a_ready                 (_coupler_to_debug_auto_tl_in_a_ready),
    .auto_tl_in_a_valid                 (_out_xbar_auto_out_4_a_valid),
    .auto_tl_in_a_bits_opcode           (_out_xbar_auto_out_4_a_bits_opcode),
    .auto_tl_in_a_bits_param            (_out_xbar_auto_out_4_a_bits_param),
    .auto_tl_in_a_bits_size             (_out_xbar_auto_out_4_a_bits_size),
    .auto_tl_in_a_bits_source           (_out_xbar_auto_out_4_a_bits_source),
    .auto_tl_in_a_bits_address          (_out_xbar_auto_out_4_a_bits_address),
    .auto_tl_in_a_bits_mask             (_out_xbar_auto_out_4_a_bits_mask),
    .auto_tl_in_a_bits_data             (_out_xbar_auto_out_4_a_bits_data),
    .auto_tl_in_a_bits_corrupt          (_out_xbar_auto_out_4_a_bits_corrupt),
    .auto_tl_in_d_ready                 (_out_xbar_auto_out_4_d_ready),
    .auto_tl_in_d_valid                 (_coupler_to_debug_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode           (_coupler_to_debug_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size             (_coupler_to_debug_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source           (_coupler_to_debug_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data             (_coupler_to_debug_auto_tl_in_d_bits_data)
  );
  TLInterconnectCoupler_11 coupler_to_bootrom (
    .clock                              (_fixedClockNode_auto_out_0_clock),
    .reset                              (_fixedClockNode_auto_out_0_reset),
    .auto_fragmenter_out_a_ready        (auto_coupler_to_bootrom_fragmenter_out_a_ready),
    .auto_fragmenter_out_a_valid        (auto_coupler_to_bootrom_fragmenter_out_a_valid),
    .auto_fragmenter_out_a_bits_opcode  (auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode),
    .auto_fragmenter_out_a_bits_param   (auto_coupler_to_bootrom_fragmenter_out_a_bits_param),
    .auto_fragmenter_out_a_bits_size    (auto_coupler_to_bootrom_fragmenter_out_a_bits_size),
    .auto_fragmenter_out_a_bits_source  (auto_coupler_to_bootrom_fragmenter_out_a_bits_source),
    .auto_fragmenter_out_a_bits_address (auto_coupler_to_bootrom_fragmenter_out_a_bits_address),
    .auto_fragmenter_out_a_bits_mask    (auto_coupler_to_bootrom_fragmenter_out_a_bits_mask),
    .auto_fragmenter_out_a_bits_corrupt (auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt),
    .auto_fragmenter_out_d_ready        (auto_coupler_to_bootrom_fragmenter_out_d_ready),
    .auto_fragmenter_out_d_valid        (auto_coupler_to_bootrom_fragmenter_out_d_valid),
    .auto_fragmenter_out_d_bits_size    (auto_coupler_to_bootrom_fragmenter_out_d_bits_size),
    .auto_fragmenter_out_d_bits_source  (auto_coupler_to_bootrom_fragmenter_out_d_bits_source),
    .auto_fragmenter_out_d_bits_data    (auto_coupler_to_bootrom_fragmenter_out_d_bits_data),
    .auto_tl_in_a_ready                 (_coupler_to_bootrom_auto_tl_in_a_ready),
    .auto_tl_in_a_valid                 (_out_xbar_auto_out_5_a_valid),
    .auto_tl_in_a_bits_opcode           (_out_xbar_auto_out_5_a_bits_opcode),
    .auto_tl_in_a_bits_param            (_out_xbar_auto_out_5_a_bits_param),
    .auto_tl_in_a_bits_size             (_out_xbar_auto_out_5_a_bits_size),
    .auto_tl_in_a_bits_source           (_out_xbar_auto_out_5_a_bits_source),
    .auto_tl_in_a_bits_address          (_out_xbar_auto_out_5_a_bits_address),
    .auto_tl_in_a_bits_mask             (_out_xbar_auto_out_5_a_bits_mask),
    .auto_tl_in_a_bits_corrupt          (_out_xbar_auto_out_5_a_bits_corrupt),
    .auto_tl_in_d_ready                 (_out_xbar_auto_out_5_d_ready),
    .auto_tl_in_d_valid                 (_coupler_to_bootrom_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_size             (_coupler_to_bootrom_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source           (_coupler_to_bootrom_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data             (_coupler_to_bootrom_auto_tl_in_d_bits_data)
  );
  TLInterconnectCoupler_12 coupler_to_prci_ctrl (
    .clock                         (_fixedClockNode_auto_out_0_clock),
    .reset                         (_fixedClockNode_auto_out_0_reset),
    .auto_fixer_out_a_ready        (auto_coupler_to_prci_ctrl_fixer_out_a_ready),
    .auto_fixer_out_a_valid        (auto_coupler_to_prci_ctrl_fixer_out_a_valid),
    .auto_fixer_out_a_bits_opcode  (auto_coupler_to_prci_ctrl_fixer_out_a_bits_opcode),
    .auto_fixer_out_a_bits_param   (auto_coupler_to_prci_ctrl_fixer_out_a_bits_param),
    .auto_fixer_out_a_bits_size    (auto_coupler_to_prci_ctrl_fixer_out_a_bits_size),
    .auto_fixer_out_a_bits_source  (auto_coupler_to_prci_ctrl_fixer_out_a_bits_source),
    .auto_fixer_out_a_bits_address (auto_coupler_to_prci_ctrl_fixer_out_a_bits_address),
    .auto_fixer_out_a_bits_mask    (auto_coupler_to_prci_ctrl_fixer_out_a_bits_mask),
    .auto_fixer_out_a_bits_data    (auto_coupler_to_prci_ctrl_fixer_out_a_bits_data),
    .auto_fixer_out_a_bits_corrupt (auto_coupler_to_prci_ctrl_fixer_out_a_bits_corrupt),
    .auto_fixer_out_d_ready        (auto_coupler_to_prci_ctrl_fixer_out_d_ready),
    .auto_fixer_out_d_valid        (auto_coupler_to_prci_ctrl_fixer_out_d_valid),
    .auto_fixer_out_d_bits_opcode  (auto_coupler_to_prci_ctrl_fixer_out_d_bits_opcode),
    .auto_fixer_out_d_bits_size    (auto_coupler_to_prci_ctrl_fixer_out_d_bits_size),
    .auto_fixer_out_d_bits_source  (auto_coupler_to_prci_ctrl_fixer_out_d_bits_source),
    .auto_fixer_out_d_bits_data    (auto_coupler_to_prci_ctrl_fixer_out_d_bits_data),
    .auto_tl_in_a_ready            (_coupler_to_prci_ctrl_auto_tl_in_a_ready),
    .auto_tl_in_a_valid            (_out_xbar_auto_out_6_a_valid),
    .auto_tl_in_a_bits_opcode      (_out_xbar_auto_out_6_a_bits_opcode),
    .auto_tl_in_a_bits_param       (_out_xbar_auto_out_6_a_bits_param),
    .auto_tl_in_a_bits_size        (_out_xbar_auto_out_6_a_bits_size),
    .auto_tl_in_a_bits_source      (_out_xbar_auto_out_6_a_bits_source),
    .auto_tl_in_a_bits_address     (_out_xbar_auto_out_6_a_bits_address),
    .auto_tl_in_a_bits_mask        (_out_xbar_auto_out_6_a_bits_mask),
    .auto_tl_in_a_bits_data        (_out_xbar_auto_out_6_a_bits_data),
    .auto_tl_in_a_bits_corrupt     (_out_xbar_auto_out_6_a_bits_corrupt),
    .auto_tl_in_d_ready            (_out_xbar_auto_out_6_d_ready),
    .auto_tl_in_d_valid            (_coupler_to_prci_ctrl_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode      (_coupler_to_prci_ctrl_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_param       (_coupler_to_prci_ctrl_auto_tl_in_d_bits_param),
    .auto_tl_in_d_bits_size        (_coupler_to_prci_ctrl_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source      (_coupler_to_prci_ctrl_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_sink        (_coupler_to_prci_ctrl_auto_tl_in_d_bits_sink),
    .auto_tl_in_d_bits_denied      (_coupler_to_prci_ctrl_auto_tl_in_d_bits_denied),
    .auto_tl_in_d_bits_data        (_coupler_to_prci_ctrl_auto_tl_in_d_bits_data),
    .auto_tl_in_d_bits_corrupt     (_coupler_to_prci_ctrl_auto_tl_in_d_bits_corrupt)
  );
  assign clock = _fixedClockNode_auto_out_0_clock;
  assign reset = _fixedClockNode_auto_out_0_reset;
endmodule

