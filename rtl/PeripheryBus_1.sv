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
  output [7:0]  auto_coupler_to_prci_ctrl_fixer_out_a_bits_source,
  output [20:0] auto_coupler_to_prci_ctrl_fixer_out_a_bits_address,
  output [7:0]  auto_coupler_to_prci_ctrl_fixer_out_a_bits_mask,
  output [63:0] auto_coupler_to_prci_ctrl_fixer_out_a_bits_data,
  output        auto_coupler_to_prci_ctrl_fixer_out_a_bits_corrupt,
                auto_coupler_to_prci_ctrl_fixer_out_d_ready,
  input         auto_coupler_to_prci_ctrl_fixer_out_d_valid,
  input  [2:0]  auto_coupler_to_prci_ctrl_fixer_out_d_bits_opcode,
                auto_coupler_to_prci_ctrl_fixer_out_d_bits_size,
  input  [7:0]  auto_coupler_to_prci_ctrl_fixer_out_d_bits_source,
  input  [63:0] auto_coupler_to_prci_ctrl_fixer_out_d_bits_data,
  input         auto_coupler_to_bootrom_fragmenter_out_a_ready,
  output        auto_coupler_to_bootrom_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode,
                auto_coupler_to_bootrom_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_size,
  output [11:0] auto_coupler_to_bootrom_fragmenter_out_a_bits_source,
  output [16:0] auto_coupler_to_bootrom_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_bootrom_fragmenter_out_a_bits_mask,
  output        auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt,
                auto_coupler_to_bootrom_fragmenter_out_d_ready,
  input         auto_coupler_to_bootrom_fragmenter_out_d_valid,
  input  [1:0]  auto_coupler_to_bootrom_fragmenter_out_d_bits_size,
  input  [11:0] auto_coupler_to_bootrom_fragmenter_out_d_bits_source,
  input  [63:0] auto_coupler_to_bootrom_fragmenter_out_d_bits_data,
  input         auto_coupler_to_debug_fragmenter_out_a_ready,
  output        auto_coupler_to_debug_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_debug_fragmenter_out_a_bits_opcode,
                auto_coupler_to_debug_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_debug_fragmenter_out_a_bits_size,
  output [11:0] auto_coupler_to_debug_fragmenter_out_a_bits_source,
                auto_coupler_to_debug_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_debug_fragmenter_out_a_bits_mask,
  output [63:0] auto_coupler_to_debug_fragmenter_out_a_bits_data,
  output        auto_coupler_to_debug_fragmenter_out_a_bits_corrupt,
                auto_coupler_to_debug_fragmenter_out_d_ready,
  input         auto_coupler_to_debug_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_debug_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_debug_fragmenter_out_d_bits_size,
  input  [11:0] auto_coupler_to_debug_fragmenter_out_d_bits_source,
  input  [63:0] auto_coupler_to_debug_fragmenter_out_d_bits_data,
  input         auto_coupler_to_clint_fragmenter_out_a_ready,
  output        auto_coupler_to_clint_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_clint_fragmenter_out_a_bits_opcode,
                auto_coupler_to_clint_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_clint_fragmenter_out_a_bits_size,
  output [11:0] auto_coupler_to_clint_fragmenter_out_a_bits_source,
  output [25:0] auto_coupler_to_clint_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_clint_fragmenter_out_a_bits_mask,
  output [63:0] auto_coupler_to_clint_fragmenter_out_a_bits_data,
  output        auto_coupler_to_clint_fragmenter_out_a_bits_corrupt,
                auto_coupler_to_clint_fragmenter_out_d_ready,
  input         auto_coupler_to_clint_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_clint_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_clint_fragmenter_out_d_bits_size,
  input  [11:0] auto_coupler_to_clint_fragmenter_out_d_bits_source,
  input  [63:0] auto_coupler_to_clint_fragmenter_out_d_bits_data,
  input         auto_coupler_to_plic_fragmenter_out_a_ready,
  output        auto_coupler_to_plic_fragmenter_out_a_valid,
  output [2:0]  auto_coupler_to_plic_fragmenter_out_a_bits_opcode,
                auto_coupler_to_plic_fragmenter_out_a_bits_param,
  output [1:0]  auto_coupler_to_plic_fragmenter_out_a_bits_size,
  output [11:0] auto_coupler_to_plic_fragmenter_out_a_bits_source,
  output [27:0] auto_coupler_to_plic_fragmenter_out_a_bits_address,
  output [7:0]  auto_coupler_to_plic_fragmenter_out_a_bits_mask,
  output [63:0] auto_coupler_to_plic_fragmenter_out_a_bits_data,
  output        auto_coupler_to_plic_fragmenter_out_a_bits_corrupt,
                auto_coupler_to_plic_fragmenter_out_d_ready,
  input         auto_coupler_to_plic_fragmenter_out_d_valid,
  input  [2:0]  auto_coupler_to_plic_fragmenter_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_plic_fragmenter_out_d_bits_size,
  input  [11:0] auto_coupler_to_plic_fragmenter_out_d_bits_source,
  input         auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_ready,
  output        auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid,
  output [2:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_opcode,
                auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_param,
                auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_size,
  output [7:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_source,
  output [12:0] auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_address,
  output [7:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_mask,
  output [63:0] auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_data,
  output        auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_corrupt,
                auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready,
  input         auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_valid,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_param,
  input  [2:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_size,
  input  [7:0]  auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_source,
  input         auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_sink,
                auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_denied,
  input  [63:0] auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_data,
  input         auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_corrupt,
                auto_coupler_to_l2_ctrl_buffer_out_a_ready,
  output        auto_coupler_to_l2_ctrl_buffer_out_a_valid,
  output [2:0]  auto_coupler_to_l2_ctrl_buffer_out_a_bits_opcode,
                auto_coupler_to_l2_ctrl_buffer_out_a_bits_param,
  output [1:0]  auto_coupler_to_l2_ctrl_buffer_out_a_bits_size,
  output [11:0] auto_coupler_to_l2_ctrl_buffer_out_a_bits_source,
  output [25:0] auto_coupler_to_l2_ctrl_buffer_out_a_bits_address,
  output [7:0]  auto_coupler_to_l2_ctrl_buffer_out_a_bits_mask,
  output [63:0] auto_coupler_to_l2_ctrl_buffer_out_a_bits_data,
  output        auto_coupler_to_l2_ctrl_buffer_out_a_bits_corrupt,
                auto_coupler_to_l2_ctrl_buffer_out_d_ready,
  input         auto_coupler_to_l2_ctrl_buffer_out_d_valid,
  input  [2:0]  auto_coupler_to_l2_ctrl_buffer_out_d_bits_opcode,
  input  [1:0]  auto_coupler_to_l2_ctrl_buffer_out_d_bits_size,
  input  [11:0] auto_coupler_to_l2_ctrl_buffer_out_d_bits_source,
  input  [63:0] auto_coupler_to_l2_ctrl_buffer_out_d_bits_data,
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
  input  [2:0]  auto_bus_xing_in_a_mem_0_opcode,
                auto_bus_xing_in_a_mem_0_param,
  input  [3:0]  auto_bus_xing_in_a_mem_0_size,
  input  [6:0]  auto_bus_xing_in_a_mem_0_source,
  input  [27:0] auto_bus_xing_in_a_mem_0_address,
  input  [7:0]  auto_bus_xing_in_a_mem_0_mask,
  input  [63:0] auto_bus_xing_in_a_mem_0_data,
  input         auto_bus_xing_in_a_mem_0_corrupt,
  input  [2:0]  auto_bus_xing_in_a_mem_1_opcode,
                auto_bus_xing_in_a_mem_1_param,
  input  [3:0]  auto_bus_xing_in_a_mem_1_size,
  input  [6:0]  auto_bus_xing_in_a_mem_1_source,
  input  [27:0] auto_bus_xing_in_a_mem_1_address,
  input  [7:0]  auto_bus_xing_in_a_mem_1_mask,
  input  [63:0] auto_bus_xing_in_a_mem_1_data,
  input         auto_bus_xing_in_a_mem_1_corrupt,
  input  [2:0]  auto_bus_xing_in_a_mem_2_opcode,
                auto_bus_xing_in_a_mem_2_param,
  input  [3:0]  auto_bus_xing_in_a_mem_2_size,
  input  [6:0]  auto_bus_xing_in_a_mem_2_source,
  input  [27:0] auto_bus_xing_in_a_mem_2_address,
  input  [7:0]  auto_bus_xing_in_a_mem_2_mask,
  input  [63:0] auto_bus_xing_in_a_mem_2_data,
  input         auto_bus_xing_in_a_mem_2_corrupt,
  input  [2:0]  auto_bus_xing_in_a_mem_3_opcode,
                auto_bus_xing_in_a_mem_3_param,
  input  [3:0]  auto_bus_xing_in_a_mem_3_size,
  input  [6:0]  auto_bus_xing_in_a_mem_3_source,
  input  [27:0] auto_bus_xing_in_a_mem_3_address,
  input  [7:0]  auto_bus_xing_in_a_mem_3_mask,
  input  [63:0] auto_bus_xing_in_a_mem_3_data,
  input         auto_bus_xing_in_a_mem_3_corrupt,
  input  [2:0]  auto_bus_xing_in_a_mem_4_opcode,
                auto_bus_xing_in_a_mem_4_param,
  input  [3:0]  auto_bus_xing_in_a_mem_4_size,
  input  [6:0]  auto_bus_xing_in_a_mem_4_source,
  input  [27:0] auto_bus_xing_in_a_mem_4_address,
  input  [7:0]  auto_bus_xing_in_a_mem_4_mask,
  input  [63:0] auto_bus_xing_in_a_mem_4_data,
  input         auto_bus_xing_in_a_mem_4_corrupt,
  input  [2:0]  auto_bus_xing_in_a_mem_5_opcode,
                auto_bus_xing_in_a_mem_5_param,
  input  [3:0]  auto_bus_xing_in_a_mem_5_size,
  input  [6:0]  auto_bus_xing_in_a_mem_5_source,
  input  [27:0] auto_bus_xing_in_a_mem_5_address,
  input  [7:0]  auto_bus_xing_in_a_mem_5_mask,
  input  [63:0] auto_bus_xing_in_a_mem_5_data,
  input         auto_bus_xing_in_a_mem_5_corrupt,
  input  [2:0]  auto_bus_xing_in_a_mem_6_opcode,
                auto_bus_xing_in_a_mem_6_param,
  input  [3:0]  auto_bus_xing_in_a_mem_6_size,
  input  [6:0]  auto_bus_xing_in_a_mem_6_source,
  input  [27:0] auto_bus_xing_in_a_mem_6_address,
  input  [7:0]  auto_bus_xing_in_a_mem_6_mask,
  input  [63:0] auto_bus_xing_in_a_mem_6_data,
  input         auto_bus_xing_in_a_mem_6_corrupt,
  input  [2:0]  auto_bus_xing_in_a_mem_7_opcode,
                auto_bus_xing_in_a_mem_7_param,
  input  [3:0]  auto_bus_xing_in_a_mem_7_size,
  input  [6:0]  auto_bus_xing_in_a_mem_7_source,
  input  [27:0] auto_bus_xing_in_a_mem_7_address,
  input  [7:0]  auto_bus_xing_in_a_mem_7_mask,
  input  [63:0] auto_bus_xing_in_a_mem_7_data,
  input         auto_bus_xing_in_a_mem_7_corrupt,
  output [3:0]  auto_bus_xing_in_a_ridx,
  input  [3:0]  auto_bus_xing_in_a_widx,
  output        auto_bus_xing_in_a_safe_ridx_valid,
  input         auto_bus_xing_in_a_safe_widx_valid,
                auto_bus_xing_in_a_safe_source_reset_n,
  output        auto_bus_xing_in_a_safe_sink_reset_n,
  output [2:0]  auto_bus_xing_in_d_mem_0_opcode,
  output [1:0]  auto_bus_xing_in_d_mem_0_param,
  output [3:0]  auto_bus_xing_in_d_mem_0_size,
  output [6:0]  auto_bus_xing_in_d_mem_0_source,
  output        auto_bus_xing_in_d_mem_0_sink,
                auto_bus_xing_in_d_mem_0_denied,
  output [63:0] auto_bus_xing_in_d_mem_0_data,
  output        auto_bus_xing_in_d_mem_0_corrupt,
  output [2:0]  auto_bus_xing_in_d_mem_1_opcode,
  output [1:0]  auto_bus_xing_in_d_mem_1_param,
  output [3:0]  auto_bus_xing_in_d_mem_1_size,
  output [6:0]  auto_bus_xing_in_d_mem_1_source,
  output        auto_bus_xing_in_d_mem_1_sink,
                auto_bus_xing_in_d_mem_1_denied,
  output [63:0] auto_bus_xing_in_d_mem_1_data,
  output        auto_bus_xing_in_d_mem_1_corrupt,
  output [2:0]  auto_bus_xing_in_d_mem_2_opcode,
  output [1:0]  auto_bus_xing_in_d_mem_2_param,
  output [3:0]  auto_bus_xing_in_d_mem_2_size,
  output [6:0]  auto_bus_xing_in_d_mem_2_source,
  output        auto_bus_xing_in_d_mem_2_sink,
                auto_bus_xing_in_d_mem_2_denied,
  output [63:0] auto_bus_xing_in_d_mem_2_data,
  output        auto_bus_xing_in_d_mem_2_corrupt,
  output [2:0]  auto_bus_xing_in_d_mem_3_opcode,
  output [1:0]  auto_bus_xing_in_d_mem_3_param,
  output [3:0]  auto_bus_xing_in_d_mem_3_size,
  output [6:0]  auto_bus_xing_in_d_mem_3_source,
  output        auto_bus_xing_in_d_mem_3_sink,
                auto_bus_xing_in_d_mem_3_denied,
  output [63:0] auto_bus_xing_in_d_mem_3_data,
  output        auto_bus_xing_in_d_mem_3_corrupt,
  output [2:0]  auto_bus_xing_in_d_mem_4_opcode,
  output [1:0]  auto_bus_xing_in_d_mem_4_param,
  output [3:0]  auto_bus_xing_in_d_mem_4_size,
  output [6:0]  auto_bus_xing_in_d_mem_4_source,
  output        auto_bus_xing_in_d_mem_4_sink,
                auto_bus_xing_in_d_mem_4_denied,
  output [63:0] auto_bus_xing_in_d_mem_4_data,
  output        auto_bus_xing_in_d_mem_4_corrupt,
  output [2:0]  auto_bus_xing_in_d_mem_5_opcode,
  output [1:0]  auto_bus_xing_in_d_mem_5_param,
  output [3:0]  auto_bus_xing_in_d_mem_5_size,
  output [6:0]  auto_bus_xing_in_d_mem_5_source,
  output        auto_bus_xing_in_d_mem_5_sink,
                auto_bus_xing_in_d_mem_5_denied,
  output [63:0] auto_bus_xing_in_d_mem_5_data,
  output        auto_bus_xing_in_d_mem_5_corrupt,
  output [2:0]  auto_bus_xing_in_d_mem_6_opcode,
  output [1:0]  auto_bus_xing_in_d_mem_6_param,
  output [3:0]  auto_bus_xing_in_d_mem_6_size,
  output [6:0]  auto_bus_xing_in_d_mem_6_source,
  output        auto_bus_xing_in_d_mem_6_sink,
                auto_bus_xing_in_d_mem_6_denied,
  output [63:0] auto_bus_xing_in_d_mem_6_data,
  output        auto_bus_xing_in_d_mem_6_corrupt,
  output [2:0]  auto_bus_xing_in_d_mem_7_opcode,
  output [1:0]  auto_bus_xing_in_d_mem_7_param,
  output [3:0]  auto_bus_xing_in_d_mem_7_size,
  output [6:0]  auto_bus_xing_in_d_mem_7_source,
  output        auto_bus_xing_in_d_mem_7_sink,
                auto_bus_xing_in_d_mem_7_denied,
  output [63:0] auto_bus_xing_in_d_mem_7_data,
  output        auto_bus_xing_in_d_mem_7_corrupt,
  input  [3:0]  auto_bus_xing_in_d_ridx,
  output [3:0]  auto_bus_xing_in_d_widx,
  input         auto_bus_xing_in_d_safe_ridx_valid,
  output        auto_bus_xing_in_d_safe_widx_valid,
                auto_bus_xing_in_d_safe_source_reset_n,
  input         auto_bus_xing_in_d_safe_sink_reset_n,
                custom_boot,
  output        clock,
                reset
);

  wire        _coupler_to_prci_ctrl_auto_tl_in_a_ready;
  wire        _coupler_to_prci_ctrl_auto_tl_in_d_valid;
  wire [2:0]  _coupler_to_prci_ctrl_auto_tl_in_d_bits_opcode;
  wire [1:0]  _coupler_to_prci_ctrl_auto_tl_in_d_bits_param;
  wire [2:0]  _coupler_to_prci_ctrl_auto_tl_in_d_bits_size;
  wire [7:0]  _coupler_to_prci_ctrl_auto_tl_in_d_bits_source;
  wire        _coupler_to_prci_ctrl_auto_tl_in_d_bits_sink;
  wire        _coupler_to_prci_ctrl_auto_tl_in_d_bits_denied;
  wire [63:0] _coupler_to_prci_ctrl_auto_tl_in_d_bits_data;
  wire        _coupler_to_prci_ctrl_auto_tl_in_d_bits_corrupt;
  wire        _coupler_to_bootrom_auto_tl_in_a_ready;
  wire        _coupler_to_bootrom_auto_tl_in_d_valid;
  wire [2:0]  _coupler_to_bootrom_auto_tl_in_d_bits_size;
  wire [7:0]  _coupler_to_bootrom_auto_tl_in_d_bits_source;
  wire [63:0] _coupler_to_bootrom_auto_tl_in_d_bits_data;
  wire        _coupler_to_debug_auto_tl_in_a_ready;
  wire        _coupler_to_debug_auto_tl_in_d_valid;
  wire [2:0]  _coupler_to_debug_auto_tl_in_d_bits_opcode;
  wire [2:0]  _coupler_to_debug_auto_tl_in_d_bits_size;
  wire [7:0]  _coupler_to_debug_auto_tl_in_d_bits_source;
  wire [63:0] _coupler_to_debug_auto_tl_in_d_bits_data;
  wire        _coupler_to_clint_auto_tl_in_a_ready;
  wire        _coupler_to_clint_auto_tl_in_d_valid;
  wire [2:0]  _coupler_to_clint_auto_tl_in_d_bits_opcode;
  wire [2:0]  _coupler_to_clint_auto_tl_in_d_bits_size;
  wire [7:0]  _coupler_to_clint_auto_tl_in_d_bits_source;
  wire [63:0] _coupler_to_clint_auto_tl_in_d_bits_data;
  wire        _coupler_to_plic_auto_tl_in_a_ready;
  wire        _coupler_to_plic_auto_tl_in_d_valid;
  wire [2:0]  _coupler_to_plic_auto_tl_in_d_bits_opcode;
  wire [2:0]  _coupler_to_plic_auto_tl_in_d_bits_size;
  wire [7:0]  _coupler_to_plic_auto_tl_in_d_bits_source;
  wire        _asink_auto_out_a_valid;
  wire [2:0]  _asink_auto_out_a_bits_opcode;
  wire [2:0]  _asink_auto_out_a_bits_param;
  wire [3:0]  _asink_auto_out_a_bits_size;
  wire [6:0]  _asink_auto_out_a_bits_source;
  wire [27:0] _asink_auto_out_a_bits_address;
  wire [7:0]  _asink_auto_out_a_bits_mask;
  wire [63:0] _asink_auto_out_a_bits_data;
  wire        _asink_auto_out_a_bits_corrupt;
  wire        _asink_auto_out_d_ready;
  wire        _coupler_to_l2_ctrl_auto_tl_in_a_ready;
  wire        _coupler_to_l2_ctrl_auto_tl_in_d_valid;
  wire [2:0]  _coupler_to_l2_ctrl_auto_tl_in_d_bits_opcode;
  wire [1:0]  _coupler_to_l2_ctrl_auto_tl_in_d_bits_param;
  wire [2:0]  _coupler_to_l2_ctrl_auto_tl_in_d_bits_size;
  wire [7:0]  _coupler_to_l2_ctrl_auto_tl_in_d_bits_source;
  wire        _coupler_to_l2_ctrl_auto_tl_in_d_bits_sink;
  wire        _coupler_to_l2_ctrl_auto_tl_in_d_bits_denied;
  wire [63:0] _coupler_to_l2_ctrl_auto_tl_in_d_bits_data;
  wire        _coupler_to_l2_ctrl_auto_tl_in_d_bits_corrupt;
  wire        _wrapped_error_device_auto_buffer_in_a_ready;
  wire        _wrapped_error_device_auto_buffer_in_d_valid;
  wire [2:0]  _wrapped_error_device_auto_buffer_in_d_bits_opcode;
  wire [1:0]  _wrapped_error_device_auto_buffer_in_d_bits_param;
  wire [3:0]  _wrapped_error_device_auto_buffer_in_d_bits_size;
  wire [7:0]  _wrapped_error_device_auto_buffer_in_d_bits_source;
  wire        _wrapped_error_device_auto_buffer_in_d_bits_sink;
  wire        _wrapped_error_device_auto_buffer_in_d_bits_denied;
  wire [63:0] _wrapped_error_device_auto_buffer_in_d_bits_data;
  wire        _wrapped_error_device_auto_buffer_in_d_bits_corrupt;
  wire        _atomics_auto_in_a_ready;
  wire        _atomics_auto_in_d_valid;
  wire [2:0]  _atomics_auto_in_d_bits_opcode;
  wire [1:0]  _atomics_auto_in_d_bits_param;
  wire [3:0]  _atomics_auto_in_d_bits_size;
  wire [7:0]  _atomics_auto_in_d_bits_source;
  wire        _atomics_auto_in_d_bits_sink;
  wire        _atomics_auto_in_d_bits_denied;
  wire [63:0] _atomics_auto_in_d_bits_data;
  wire        _atomics_auto_in_d_bits_corrupt;
  wire        _atomics_auto_out_a_valid;
  wire [2:0]  _atomics_auto_out_a_bits_opcode;
  wire [2:0]  _atomics_auto_out_a_bits_param;
  wire [3:0]  _atomics_auto_out_a_bits_size;
  wire [7:0]  _atomics_auto_out_a_bits_source;
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
  wire [7:0]  _buffer_auto_in_d_bits_source;
  wire        _buffer_auto_in_d_bits_sink;
  wire        _buffer_auto_in_d_bits_denied;
  wire [63:0] _buffer_auto_in_d_bits_data;
  wire        _buffer_auto_in_d_bits_corrupt;
  wire        _buffer_auto_out_a_valid;
  wire [2:0]  _buffer_auto_out_a_bits_opcode;
  wire [2:0]  _buffer_auto_out_a_bits_param;
  wire [3:0]  _buffer_auto_out_a_bits_size;
  wire [7:0]  _buffer_auto_out_a_bits_source;
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
  wire [7:0]  _out_xbar_auto_in_d_bits_source;
  wire        _out_xbar_auto_in_d_bits_sink;
  wire        _out_xbar_auto_in_d_bits_denied;
  wire [63:0] _out_xbar_auto_in_d_bits_data;
  wire        _out_xbar_auto_in_d_bits_corrupt;
  wire        _out_xbar_auto_out_7_a_valid;
  wire [2:0]  _out_xbar_auto_out_7_a_bits_opcode;
  wire [2:0]  _out_xbar_auto_out_7_a_bits_param;
  wire [2:0]  _out_xbar_auto_out_7_a_bits_size;
  wire [7:0]  _out_xbar_auto_out_7_a_bits_source;
  wire [20:0] _out_xbar_auto_out_7_a_bits_address;
  wire [7:0]  _out_xbar_auto_out_7_a_bits_mask;
  wire [63:0] _out_xbar_auto_out_7_a_bits_data;
  wire        _out_xbar_auto_out_7_a_bits_corrupt;
  wire        _out_xbar_auto_out_7_d_ready;
  wire        _out_xbar_auto_out_6_a_valid;
  wire [2:0]  _out_xbar_auto_out_6_a_bits_opcode;
  wire [2:0]  _out_xbar_auto_out_6_a_bits_param;
  wire [2:0]  _out_xbar_auto_out_6_a_bits_size;
  wire [7:0]  _out_xbar_auto_out_6_a_bits_source;
  wire [16:0] _out_xbar_auto_out_6_a_bits_address;
  wire [7:0]  _out_xbar_auto_out_6_a_bits_mask;
  wire        _out_xbar_auto_out_6_a_bits_corrupt;
  wire        _out_xbar_auto_out_6_d_ready;
  wire        _out_xbar_auto_out_5_a_valid;
  wire [2:0]  _out_xbar_auto_out_5_a_bits_opcode;
  wire [2:0]  _out_xbar_auto_out_5_a_bits_param;
  wire [2:0]  _out_xbar_auto_out_5_a_bits_size;
  wire [7:0]  _out_xbar_auto_out_5_a_bits_source;
  wire [11:0] _out_xbar_auto_out_5_a_bits_address;
  wire [7:0]  _out_xbar_auto_out_5_a_bits_mask;
  wire [63:0] _out_xbar_auto_out_5_a_bits_data;
  wire        _out_xbar_auto_out_5_a_bits_corrupt;
  wire        _out_xbar_auto_out_5_d_ready;
  wire        _out_xbar_auto_out_4_a_valid;
  wire [2:0]  _out_xbar_auto_out_4_a_bits_opcode;
  wire [2:0]  _out_xbar_auto_out_4_a_bits_param;
  wire [2:0]  _out_xbar_auto_out_4_a_bits_size;
  wire [7:0]  _out_xbar_auto_out_4_a_bits_source;
  wire [25:0] _out_xbar_auto_out_4_a_bits_address;
  wire [7:0]  _out_xbar_auto_out_4_a_bits_mask;
  wire [63:0] _out_xbar_auto_out_4_a_bits_data;
  wire        _out_xbar_auto_out_4_a_bits_corrupt;
  wire        _out_xbar_auto_out_4_d_ready;
  wire        _out_xbar_auto_out_3_a_valid;
  wire [2:0]  _out_xbar_auto_out_3_a_bits_opcode;
  wire [2:0]  _out_xbar_auto_out_3_a_bits_param;
  wire [2:0]  _out_xbar_auto_out_3_a_bits_size;
  wire [7:0]  _out_xbar_auto_out_3_a_bits_source;
  wire [27:0] _out_xbar_auto_out_3_a_bits_address;
  wire [7:0]  _out_xbar_auto_out_3_a_bits_mask;
  wire [63:0] _out_xbar_auto_out_3_a_bits_data;
  wire        _out_xbar_auto_out_3_a_bits_corrupt;
  wire        _out_xbar_auto_out_3_d_ready;
  wire        _out_xbar_auto_out_1_a_valid;
  wire [2:0]  _out_xbar_auto_out_1_a_bits_opcode;
  wire [2:0]  _out_xbar_auto_out_1_a_bits_param;
  wire [2:0]  _out_xbar_auto_out_1_a_bits_size;
  wire [7:0]  _out_xbar_auto_out_1_a_bits_source;
  wire [25:0] _out_xbar_auto_out_1_a_bits_address;
  wire [7:0]  _out_xbar_auto_out_1_a_bits_mask;
  wire [63:0] _out_xbar_auto_out_1_a_bits_data;
  wire        _out_xbar_auto_out_1_a_bits_corrupt;
  wire        _out_xbar_auto_out_1_d_ready;
  wire        _out_xbar_auto_out_0_a_valid;
  wire [2:0]  _out_xbar_auto_out_0_a_bits_opcode;
  wire [2:0]  _out_xbar_auto_out_0_a_bits_param;
  wire [3:0]  _out_xbar_auto_out_0_a_bits_size;
  wire [7:0]  _out_xbar_auto_out_0_a_bits_source;
  wire [13:0] _out_xbar_auto_out_0_a_bits_address;
  wire [7:0]  _out_xbar_auto_out_0_a_bits_mask;
  wire [63:0] _out_xbar_auto_out_0_a_bits_data;
  wire        _out_xbar_auto_out_0_a_bits_corrupt;
  wire        _out_xbar_auto_out_0_d_ready;
  wire        _in_xbar_auto_in_1_a_ready;
  wire        _in_xbar_auto_in_1_d_valid;
  wire        _in_xbar_auto_in_0_a_ready;
  wire        _in_xbar_auto_in_0_d_valid;
  wire [2:0]  _in_xbar_auto_in_0_d_bits_opcode;
  wire [1:0]  _in_xbar_auto_in_0_d_bits_param;
  wire [3:0]  _in_xbar_auto_in_0_d_bits_size;
  wire [6:0]  _in_xbar_auto_in_0_d_bits_source;
  wire        _in_xbar_auto_in_0_d_bits_sink;
  wire        _in_xbar_auto_in_0_d_bits_denied;
  wire [63:0] _in_xbar_auto_in_0_d_bits_data;
  wire        _in_xbar_auto_in_0_d_bits_corrupt;
  wire        _in_xbar_auto_out_a_valid;
  wire [2:0]  _in_xbar_auto_out_a_bits_opcode;
  wire [2:0]  _in_xbar_auto_out_a_bits_param;
  wire [3:0]  _in_xbar_auto_out_a_bits_size;
  wire [7:0]  _in_xbar_auto_out_a_bits_source;
  wire [27:0] _in_xbar_auto_out_a_bits_address;
  wire [7:0]  _in_xbar_auto_out_a_bits_mask;
  wire [63:0] _in_xbar_auto_out_a_bits_data;
  wire        _in_xbar_auto_out_a_bits_corrupt;
  wire        _in_xbar_auto_out_d_ready;
  wire        _fixer_auto_in_a_ready;
  wire        _fixer_auto_in_d_valid;
  wire [2:0]  _fixer_auto_in_d_bits_opcode;
  wire [1:0]  _fixer_auto_in_d_bits_param;
  wire [3:0]  _fixer_auto_in_d_bits_size;
  wire [7:0]  _fixer_auto_in_d_bits_source;
  wire        _fixer_auto_in_d_bits_sink;
  wire        _fixer_auto_in_d_bits_denied;
  wire [63:0] _fixer_auto_in_d_bits_data;
  wire        _fixer_auto_in_d_bits_corrupt;
  wire        _fixer_auto_out_a_valid;
  wire [2:0]  _fixer_auto_out_a_bits_opcode;
  wire [2:0]  _fixer_auto_out_a_bits_param;
  wire [3:0]  _fixer_auto_out_a_bits_size;
  wire [7:0]  _fixer_auto_out_a_bits_source;
  wire [27:0] _fixer_auto_out_a_bits_address;
  wire [7:0]  _fixer_auto_out_a_bits_mask;
  wire [63:0] _fixer_auto_out_a_bits_data;
  wire        _fixer_auto_out_a_bits_corrupt;
  wire        _fixer_auto_out_d_ready;
  wire        _fixedClockNode_auto_out_0_clock;
  wire        _fixedClockNode_auto_out_0_reset;
  reg  [2:0]  state;
  wire        _GEN = state == 3'h1;
  wire        nodeOut_a_valid = (|state) & (_GEN | state != 3'h2 & state == 3'h3);
  reg  [2:0]  casez_tmp;
  wire        _GEN_0 = _in_xbar_auto_in_1_a_ready & nodeOut_a_valid;
  wire [2:0]  _GEN_1 = state == 3'h5 & ~custom_boot ? 3'h0 : state;
  always @(*) begin
    casez (state)
      3'b000:
        casez_tmp = custom_boot ? 3'h1 : state;
      3'b001:
        casez_tmp = _GEN_0 ? 3'h2 : state;
      3'b010:
        casez_tmp = _in_xbar_auto_in_1_d_valid ? 3'h3 : state;
      3'b011:
        casez_tmp = _GEN_0 ? 3'h4 : state;
      3'b100:
        casez_tmp = _in_xbar_auto_in_1_d_valid ? 3'h5 : state;
      3'b101:
        casez_tmp = _GEN_1;
      3'b110:
        casez_tmp = _GEN_1;
      default:
        casez_tmp = _GEN_1;
    endcase
  end // always @(*)
  always @(posedge _fixedClockNode_auto_out_0_clock) begin
    if (_fixedClockNode_auto_out_0_reset)
      state <= 3'h0;
    else
      state <= casez_tmp;
  end // always @(posedge)
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
  TLXbar_4 in_xbar (
    .clock                    (_fixedClockNode_auto_out_0_clock),
    .reset                    (_fixedClockNode_auto_out_0_reset),
    .auto_in_1_a_ready        (_in_xbar_auto_in_1_a_ready),
    .auto_in_1_a_valid        (nodeOut_a_valid),
    .auto_in_1_a_bits_address (_GEN ? 28'h1000 : 28'h2000000),
    .auto_in_1_a_bits_data    (_GEN ? 64'h80000000 : 64'h1),
    .auto_in_1_d_valid        (_in_xbar_auto_in_1_d_valid),
    .auto_in_0_a_ready        (_in_xbar_auto_in_0_a_ready),
    .auto_in_0_a_valid        (_asink_auto_out_a_valid),
    .auto_in_0_a_bits_opcode  (_asink_auto_out_a_bits_opcode),
    .auto_in_0_a_bits_param   (_asink_auto_out_a_bits_param),
    .auto_in_0_a_bits_size    (_asink_auto_out_a_bits_size),
    .auto_in_0_a_bits_source  (_asink_auto_out_a_bits_source),
    .auto_in_0_a_bits_address (_asink_auto_out_a_bits_address),
    .auto_in_0_a_bits_mask    (_asink_auto_out_a_bits_mask),
    .auto_in_0_a_bits_data    (_asink_auto_out_a_bits_data),
    .auto_in_0_a_bits_corrupt (_asink_auto_out_a_bits_corrupt),
    .auto_in_0_d_ready        (_asink_auto_out_d_ready),
    .auto_in_0_d_valid        (_in_xbar_auto_in_0_d_valid),
    .auto_in_0_d_bits_opcode  (_in_xbar_auto_in_0_d_bits_opcode),
    .auto_in_0_d_bits_param   (_in_xbar_auto_in_0_d_bits_param),
    .auto_in_0_d_bits_size    (_in_xbar_auto_in_0_d_bits_size),
    .auto_in_0_d_bits_source  (_in_xbar_auto_in_0_d_bits_source),
    .auto_in_0_d_bits_sink    (_in_xbar_auto_in_0_d_bits_sink),
    .auto_in_0_d_bits_denied  (_in_xbar_auto_in_0_d_bits_denied),
    .auto_in_0_d_bits_data    (_in_xbar_auto_in_0_d_bits_data),
    .auto_in_0_d_bits_corrupt (_in_xbar_auto_in_0_d_bits_corrupt),
    .auto_out_a_ready         (_atomics_auto_in_a_ready),
    .auto_out_a_valid         (_in_xbar_auto_out_a_valid),
    .auto_out_a_bits_opcode   (_in_xbar_auto_out_a_bits_opcode),
    .auto_out_a_bits_param    (_in_xbar_auto_out_a_bits_param),
    .auto_out_a_bits_size     (_in_xbar_auto_out_a_bits_size),
    .auto_out_a_bits_source   (_in_xbar_auto_out_a_bits_source),
    .auto_out_a_bits_address  (_in_xbar_auto_out_a_bits_address),
    .auto_out_a_bits_mask     (_in_xbar_auto_out_a_bits_mask),
    .auto_out_a_bits_data     (_in_xbar_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt  (_in_xbar_auto_out_a_bits_corrupt),
    .auto_out_d_ready         (_in_xbar_auto_out_d_ready),
    .auto_out_d_valid         (_atomics_auto_in_d_valid),
    .auto_out_d_bits_opcode   (_atomics_auto_in_d_bits_opcode),
    .auto_out_d_bits_param    (_atomics_auto_in_d_bits_param),
    .auto_out_d_bits_size     (_atomics_auto_in_d_bits_size),
    .auto_out_d_bits_source   (_atomics_auto_in_d_bits_source),
    .auto_out_d_bits_sink     (_atomics_auto_in_d_bits_sink),
    .auto_out_d_bits_denied   (_atomics_auto_in_d_bits_denied),
    .auto_out_d_bits_data     (_atomics_auto_in_d_bits_data),
    .auto_out_d_bits_corrupt  (_atomics_auto_in_d_bits_corrupt)
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
    .auto_out_7_a_ready        (_coupler_to_prci_ctrl_auto_tl_in_a_ready),
    .auto_out_7_a_valid        (_out_xbar_auto_out_7_a_valid),
    .auto_out_7_a_bits_opcode  (_out_xbar_auto_out_7_a_bits_opcode),
    .auto_out_7_a_bits_param   (_out_xbar_auto_out_7_a_bits_param),
    .auto_out_7_a_bits_size    (_out_xbar_auto_out_7_a_bits_size),
    .auto_out_7_a_bits_source  (_out_xbar_auto_out_7_a_bits_source),
    .auto_out_7_a_bits_address (_out_xbar_auto_out_7_a_bits_address),
    .auto_out_7_a_bits_mask    (_out_xbar_auto_out_7_a_bits_mask),
    .auto_out_7_a_bits_data    (_out_xbar_auto_out_7_a_bits_data),
    .auto_out_7_a_bits_corrupt (_out_xbar_auto_out_7_a_bits_corrupt),
    .auto_out_7_d_ready        (_out_xbar_auto_out_7_d_ready),
    .auto_out_7_d_valid        (_coupler_to_prci_ctrl_auto_tl_in_d_valid),
    .auto_out_7_d_bits_opcode  (_coupler_to_prci_ctrl_auto_tl_in_d_bits_opcode),
    .auto_out_7_d_bits_param   (_coupler_to_prci_ctrl_auto_tl_in_d_bits_param),
    .auto_out_7_d_bits_size    (_coupler_to_prci_ctrl_auto_tl_in_d_bits_size),
    .auto_out_7_d_bits_source  (_coupler_to_prci_ctrl_auto_tl_in_d_bits_source),
    .auto_out_7_d_bits_sink    (_coupler_to_prci_ctrl_auto_tl_in_d_bits_sink),
    .auto_out_7_d_bits_denied  (_coupler_to_prci_ctrl_auto_tl_in_d_bits_denied),
    .auto_out_7_d_bits_data    (_coupler_to_prci_ctrl_auto_tl_in_d_bits_data),
    .auto_out_7_d_bits_corrupt (_coupler_to_prci_ctrl_auto_tl_in_d_bits_corrupt),
    .auto_out_6_a_ready        (_coupler_to_bootrom_auto_tl_in_a_ready),
    .auto_out_6_a_valid        (_out_xbar_auto_out_6_a_valid),
    .auto_out_6_a_bits_opcode  (_out_xbar_auto_out_6_a_bits_opcode),
    .auto_out_6_a_bits_param   (_out_xbar_auto_out_6_a_bits_param),
    .auto_out_6_a_bits_size    (_out_xbar_auto_out_6_a_bits_size),
    .auto_out_6_a_bits_source  (_out_xbar_auto_out_6_a_bits_source),
    .auto_out_6_a_bits_address (_out_xbar_auto_out_6_a_bits_address),
    .auto_out_6_a_bits_mask    (_out_xbar_auto_out_6_a_bits_mask),
    .auto_out_6_a_bits_corrupt (_out_xbar_auto_out_6_a_bits_corrupt),
    .auto_out_6_d_ready        (_out_xbar_auto_out_6_d_ready),
    .auto_out_6_d_valid        (_coupler_to_bootrom_auto_tl_in_d_valid),
    .auto_out_6_d_bits_size    (_coupler_to_bootrom_auto_tl_in_d_bits_size),
    .auto_out_6_d_bits_source  (_coupler_to_bootrom_auto_tl_in_d_bits_source),
    .auto_out_6_d_bits_data    (_coupler_to_bootrom_auto_tl_in_d_bits_data),
    .auto_out_5_a_ready        (_coupler_to_debug_auto_tl_in_a_ready),
    .auto_out_5_a_valid        (_out_xbar_auto_out_5_a_valid),
    .auto_out_5_a_bits_opcode  (_out_xbar_auto_out_5_a_bits_opcode),
    .auto_out_5_a_bits_param   (_out_xbar_auto_out_5_a_bits_param),
    .auto_out_5_a_bits_size    (_out_xbar_auto_out_5_a_bits_size),
    .auto_out_5_a_bits_source  (_out_xbar_auto_out_5_a_bits_source),
    .auto_out_5_a_bits_address (_out_xbar_auto_out_5_a_bits_address),
    .auto_out_5_a_bits_mask    (_out_xbar_auto_out_5_a_bits_mask),
    .auto_out_5_a_bits_data    (_out_xbar_auto_out_5_a_bits_data),
    .auto_out_5_a_bits_corrupt (_out_xbar_auto_out_5_a_bits_corrupt),
    .auto_out_5_d_ready        (_out_xbar_auto_out_5_d_ready),
    .auto_out_5_d_valid        (_coupler_to_debug_auto_tl_in_d_valid),
    .auto_out_5_d_bits_opcode  (_coupler_to_debug_auto_tl_in_d_bits_opcode),
    .auto_out_5_d_bits_size    (_coupler_to_debug_auto_tl_in_d_bits_size),
    .auto_out_5_d_bits_source  (_coupler_to_debug_auto_tl_in_d_bits_source),
    .auto_out_5_d_bits_data    (_coupler_to_debug_auto_tl_in_d_bits_data),
    .auto_out_4_a_ready        (_coupler_to_clint_auto_tl_in_a_ready),
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
    .auto_out_4_d_valid        (_coupler_to_clint_auto_tl_in_d_valid),
    .auto_out_4_d_bits_opcode  (_coupler_to_clint_auto_tl_in_d_bits_opcode),
    .auto_out_4_d_bits_size    (_coupler_to_clint_auto_tl_in_d_bits_size),
    .auto_out_4_d_bits_source  (_coupler_to_clint_auto_tl_in_d_bits_source),
    .auto_out_4_d_bits_data    (_coupler_to_clint_auto_tl_in_d_bits_data),
    .auto_out_3_a_ready        (_coupler_to_plic_auto_tl_in_a_ready),
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
    .auto_out_3_d_valid        (_coupler_to_plic_auto_tl_in_d_valid),
    .auto_out_3_d_bits_opcode  (_coupler_to_plic_auto_tl_in_d_bits_opcode),
    .auto_out_3_d_bits_size    (_coupler_to_plic_auto_tl_in_d_bits_size),
    .auto_out_3_d_bits_source  (_coupler_to_plic_auto_tl_in_d_bits_source),
    .auto_out_2_a_ready        (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_ready),
    .auto_out_2_a_valid        (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid),
    .auto_out_2_a_bits_opcode  (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_opcode),
    .auto_out_2_a_bits_param   (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_param),
    .auto_out_2_a_bits_size    (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_size),
    .auto_out_2_a_bits_source  (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_source),
    .auto_out_2_a_bits_address (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_address),
    .auto_out_2_a_bits_mask    (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_mask),
    .auto_out_2_a_bits_data    (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_data),
    .auto_out_2_a_bits_corrupt (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_corrupt),
    .auto_out_2_d_ready        (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready),
    .auto_out_2_d_valid        (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_valid),
    .auto_out_2_d_bits_opcode  (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_opcode),
    .auto_out_2_d_bits_param   (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_param),
    .auto_out_2_d_bits_size    (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_size),
    .auto_out_2_d_bits_source  (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_source),
    .auto_out_2_d_bits_sink    (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_sink),
    .auto_out_2_d_bits_denied  (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_denied),
    .auto_out_2_d_bits_data    (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_data),
    .auto_out_2_d_bits_corrupt (auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_corrupt),
    .auto_out_1_a_ready        (_coupler_to_l2_ctrl_auto_tl_in_a_ready),
    .auto_out_1_a_valid        (_out_xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode  (_out_xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param   (_out_xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size    (_out_xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source  (_out_xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address (_out_xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask    (_out_xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data    (_out_xbar_auto_out_1_a_bits_data),
    .auto_out_1_a_bits_corrupt (_out_xbar_auto_out_1_a_bits_corrupt),
    .auto_out_1_d_ready        (_out_xbar_auto_out_1_d_ready),
    .auto_out_1_d_valid        (_coupler_to_l2_ctrl_auto_tl_in_d_valid),
    .auto_out_1_d_bits_opcode  (_coupler_to_l2_ctrl_auto_tl_in_d_bits_opcode),
    .auto_out_1_d_bits_param   (_coupler_to_l2_ctrl_auto_tl_in_d_bits_param),
    .auto_out_1_d_bits_size    (_coupler_to_l2_ctrl_auto_tl_in_d_bits_size),
    .auto_out_1_d_bits_source  (_coupler_to_l2_ctrl_auto_tl_in_d_bits_source),
    .auto_out_1_d_bits_sink    (_coupler_to_l2_ctrl_auto_tl_in_d_bits_sink),
    .auto_out_1_d_bits_denied  (_coupler_to_l2_ctrl_auto_tl_in_d_bits_denied),
    .auto_out_1_d_bits_data    (_coupler_to_l2_ctrl_auto_tl_in_d_bits_data),
    .auto_out_1_d_bits_corrupt (_coupler_to_l2_ctrl_auto_tl_in_d_bits_corrupt),
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
  TLBuffer_3 buffer (
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
    .auto_in_a_ready         (_atomics_auto_in_a_ready),
    .auto_in_a_valid         (_in_xbar_auto_out_a_valid),
    .auto_in_a_bits_opcode   (_in_xbar_auto_out_a_bits_opcode),
    .auto_in_a_bits_param    (_in_xbar_auto_out_a_bits_param),
    .auto_in_a_bits_size     (_in_xbar_auto_out_a_bits_size),
    .auto_in_a_bits_source   (_in_xbar_auto_out_a_bits_source),
    .auto_in_a_bits_address  (_in_xbar_auto_out_a_bits_address),
    .auto_in_a_bits_mask     (_in_xbar_auto_out_a_bits_mask),
    .auto_in_a_bits_data     (_in_xbar_auto_out_a_bits_data),
    .auto_in_a_bits_corrupt  (_in_xbar_auto_out_a_bits_corrupt),
    .auto_in_d_ready         (_in_xbar_auto_out_d_ready),
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
  TLInterconnectCoupler_7 coupler_to_l2_ctrl (
    .clock                          (_fixedClockNode_auto_out_0_clock),
    .reset                          (_fixedClockNode_auto_out_0_reset),
    .auto_buffer_out_a_ready        (auto_coupler_to_l2_ctrl_buffer_out_a_ready),
    .auto_buffer_out_a_valid        (auto_coupler_to_l2_ctrl_buffer_out_a_valid),
    .auto_buffer_out_a_bits_opcode  (auto_coupler_to_l2_ctrl_buffer_out_a_bits_opcode),
    .auto_buffer_out_a_bits_param   (auto_coupler_to_l2_ctrl_buffer_out_a_bits_param),
    .auto_buffer_out_a_bits_size    (auto_coupler_to_l2_ctrl_buffer_out_a_bits_size),
    .auto_buffer_out_a_bits_source  (auto_coupler_to_l2_ctrl_buffer_out_a_bits_source),
    .auto_buffer_out_a_bits_address (auto_coupler_to_l2_ctrl_buffer_out_a_bits_address),
    .auto_buffer_out_a_bits_mask    (auto_coupler_to_l2_ctrl_buffer_out_a_bits_mask),
    .auto_buffer_out_a_bits_data    (auto_coupler_to_l2_ctrl_buffer_out_a_bits_data),
    .auto_buffer_out_a_bits_corrupt (auto_coupler_to_l2_ctrl_buffer_out_a_bits_corrupt),
    .auto_buffer_out_d_ready        (auto_coupler_to_l2_ctrl_buffer_out_d_ready),
    .auto_buffer_out_d_valid        (auto_coupler_to_l2_ctrl_buffer_out_d_valid),
    .auto_buffer_out_d_bits_opcode  (auto_coupler_to_l2_ctrl_buffer_out_d_bits_opcode),
    .auto_buffer_out_d_bits_size    (auto_coupler_to_l2_ctrl_buffer_out_d_bits_size),
    .auto_buffer_out_d_bits_source  (auto_coupler_to_l2_ctrl_buffer_out_d_bits_source),
    .auto_buffer_out_d_bits_data    (auto_coupler_to_l2_ctrl_buffer_out_d_bits_data),
    .auto_tl_in_a_ready             (_coupler_to_l2_ctrl_auto_tl_in_a_ready),
    .auto_tl_in_a_valid             (_out_xbar_auto_out_1_a_valid),
    .auto_tl_in_a_bits_opcode       (_out_xbar_auto_out_1_a_bits_opcode),
    .auto_tl_in_a_bits_param        (_out_xbar_auto_out_1_a_bits_param),
    .auto_tl_in_a_bits_size         (_out_xbar_auto_out_1_a_bits_size),
    .auto_tl_in_a_bits_source       (_out_xbar_auto_out_1_a_bits_source),
    .auto_tl_in_a_bits_address      (_out_xbar_auto_out_1_a_bits_address),
    .auto_tl_in_a_bits_mask         (_out_xbar_auto_out_1_a_bits_mask),
    .auto_tl_in_a_bits_data         (_out_xbar_auto_out_1_a_bits_data),
    .auto_tl_in_a_bits_corrupt      (_out_xbar_auto_out_1_a_bits_corrupt),
    .auto_tl_in_d_ready             (_out_xbar_auto_out_1_d_ready),
    .auto_tl_in_d_valid             (_coupler_to_l2_ctrl_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode       (_coupler_to_l2_ctrl_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_param        (_coupler_to_l2_ctrl_auto_tl_in_d_bits_param),
    .auto_tl_in_d_bits_size         (_coupler_to_l2_ctrl_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source       (_coupler_to_l2_ctrl_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_sink         (_coupler_to_l2_ctrl_auto_tl_in_d_bits_sink),
    .auto_tl_in_d_bits_denied       (_coupler_to_l2_ctrl_auto_tl_in_d_bits_denied),
    .auto_tl_in_d_bits_data         (_coupler_to_l2_ctrl_auto_tl_in_d_bits_data),
    .auto_tl_in_d_bits_corrupt      (_coupler_to_l2_ctrl_auto_tl_in_d_bits_corrupt)
  );
  TLAsyncCrossingSink_3 asink (
    .clock                         (_fixedClockNode_auto_out_0_clock),
    .reset                         (_fixedClockNode_auto_out_0_reset),
    .auto_in_a_mem_0_opcode        (auto_bus_xing_in_a_mem_0_opcode),
    .auto_in_a_mem_0_param         (auto_bus_xing_in_a_mem_0_param),
    .auto_in_a_mem_0_size          (auto_bus_xing_in_a_mem_0_size),
    .auto_in_a_mem_0_source        (auto_bus_xing_in_a_mem_0_source),
    .auto_in_a_mem_0_address       (auto_bus_xing_in_a_mem_0_address),
    .auto_in_a_mem_0_mask          (auto_bus_xing_in_a_mem_0_mask),
    .auto_in_a_mem_0_data          (auto_bus_xing_in_a_mem_0_data),
    .auto_in_a_mem_0_corrupt       (auto_bus_xing_in_a_mem_0_corrupt),
    .auto_in_a_mem_1_opcode        (auto_bus_xing_in_a_mem_1_opcode),
    .auto_in_a_mem_1_param         (auto_bus_xing_in_a_mem_1_param),
    .auto_in_a_mem_1_size          (auto_bus_xing_in_a_mem_1_size),
    .auto_in_a_mem_1_source        (auto_bus_xing_in_a_mem_1_source),
    .auto_in_a_mem_1_address       (auto_bus_xing_in_a_mem_1_address),
    .auto_in_a_mem_1_mask          (auto_bus_xing_in_a_mem_1_mask),
    .auto_in_a_mem_1_data          (auto_bus_xing_in_a_mem_1_data),
    .auto_in_a_mem_1_corrupt       (auto_bus_xing_in_a_mem_1_corrupt),
    .auto_in_a_mem_2_opcode        (auto_bus_xing_in_a_mem_2_opcode),
    .auto_in_a_mem_2_param         (auto_bus_xing_in_a_mem_2_param),
    .auto_in_a_mem_2_size          (auto_bus_xing_in_a_mem_2_size),
    .auto_in_a_mem_2_source        (auto_bus_xing_in_a_mem_2_source),
    .auto_in_a_mem_2_address       (auto_bus_xing_in_a_mem_2_address),
    .auto_in_a_mem_2_mask          (auto_bus_xing_in_a_mem_2_mask),
    .auto_in_a_mem_2_data          (auto_bus_xing_in_a_mem_2_data),
    .auto_in_a_mem_2_corrupt       (auto_bus_xing_in_a_mem_2_corrupt),
    .auto_in_a_mem_3_opcode        (auto_bus_xing_in_a_mem_3_opcode),
    .auto_in_a_mem_3_param         (auto_bus_xing_in_a_mem_3_param),
    .auto_in_a_mem_3_size          (auto_bus_xing_in_a_mem_3_size),
    .auto_in_a_mem_3_source        (auto_bus_xing_in_a_mem_3_source),
    .auto_in_a_mem_3_address       (auto_bus_xing_in_a_mem_3_address),
    .auto_in_a_mem_3_mask          (auto_bus_xing_in_a_mem_3_mask),
    .auto_in_a_mem_3_data          (auto_bus_xing_in_a_mem_3_data),
    .auto_in_a_mem_3_corrupt       (auto_bus_xing_in_a_mem_3_corrupt),
    .auto_in_a_mem_4_opcode        (auto_bus_xing_in_a_mem_4_opcode),
    .auto_in_a_mem_4_param         (auto_bus_xing_in_a_mem_4_param),
    .auto_in_a_mem_4_size          (auto_bus_xing_in_a_mem_4_size),
    .auto_in_a_mem_4_source        (auto_bus_xing_in_a_mem_4_source),
    .auto_in_a_mem_4_address       (auto_bus_xing_in_a_mem_4_address),
    .auto_in_a_mem_4_mask          (auto_bus_xing_in_a_mem_4_mask),
    .auto_in_a_mem_4_data          (auto_bus_xing_in_a_mem_4_data),
    .auto_in_a_mem_4_corrupt       (auto_bus_xing_in_a_mem_4_corrupt),
    .auto_in_a_mem_5_opcode        (auto_bus_xing_in_a_mem_5_opcode),
    .auto_in_a_mem_5_param         (auto_bus_xing_in_a_mem_5_param),
    .auto_in_a_mem_5_size          (auto_bus_xing_in_a_mem_5_size),
    .auto_in_a_mem_5_source        (auto_bus_xing_in_a_mem_5_source),
    .auto_in_a_mem_5_address       (auto_bus_xing_in_a_mem_5_address),
    .auto_in_a_mem_5_mask          (auto_bus_xing_in_a_mem_5_mask),
    .auto_in_a_mem_5_data          (auto_bus_xing_in_a_mem_5_data),
    .auto_in_a_mem_5_corrupt       (auto_bus_xing_in_a_mem_5_corrupt),
    .auto_in_a_mem_6_opcode        (auto_bus_xing_in_a_mem_6_opcode),
    .auto_in_a_mem_6_param         (auto_bus_xing_in_a_mem_6_param),
    .auto_in_a_mem_6_size          (auto_bus_xing_in_a_mem_6_size),
    .auto_in_a_mem_6_source        (auto_bus_xing_in_a_mem_6_source),
    .auto_in_a_mem_6_address       (auto_bus_xing_in_a_mem_6_address),
    .auto_in_a_mem_6_mask          (auto_bus_xing_in_a_mem_6_mask),
    .auto_in_a_mem_6_data          (auto_bus_xing_in_a_mem_6_data),
    .auto_in_a_mem_6_corrupt       (auto_bus_xing_in_a_mem_6_corrupt),
    .auto_in_a_mem_7_opcode        (auto_bus_xing_in_a_mem_7_opcode),
    .auto_in_a_mem_7_param         (auto_bus_xing_in_a_mem_7_param),
    .auto_in_a_mem_7_size          (auto_bus_xing_in_a_mem_7_size),
    .auto_in_a_mem_7_source        (auto_bus_xing_in_a_mem_7_source),
    .auto_in_a_mem_7_address       (auto_bus_xing_in_a_mem_7_address),
    .auto_in_a_mem_7_mask          (auto_bus_xing_in_a_mem_7_mask),
    .auto_in_a_mem_7_data          (auto_bus_xing_in_a_mem_7_data),
    .auto_in_a_mem_7_corrupt       (auto_bus_xing_in_a_mem_7_corrupt),
    .auto_in_a_ridx                (auto_bus_xing_in_a_ridx),
    .auto_in_a_widx                (auto_bus_xing_in_a_widx),
    .auto_in_a_safe_ridx_valid     (auto_bus_xing_in_a_safe_ridx_valid),
    .auto_in_a_safe_widx_valid     (auto_bus_xing_in_a_safe_widx_valid),
    .auto_in_a_safe_source_reset_n (auto_bus_xing_in_a_safe_source_reset_n),
    .auto_in_a_safe_sink_reset_n   (auto_bus_xing_in_a_safe_sink_reset_n),
    .auto_in_d_mem_0_opcode        (auto_bus_xing_in_d_mem_0_opcode),
    .auto_in_d_mem_0_param         (auto_bus_xing_in_d_mem_0_param),
    .auto_in_d_mem_0_size          (auto_bus_xing_in_d_mem_0_size),
    .auto_in_d_mem_0_source        (auto_bus_xing_in_d_mem_0_source),
    .auto_in_d_mem_0_sink          (auto_bus_xing_in_d_mem_0_sink),
    .auto_in_d_mem_0_denied        (auto_bus_xing_in_d_mem_0_denied),
    .auto_in_d_mem_0_data          (auto_bus_xing_in_d_mem_0_data),
    .auto_in_d_mem_0_corrupt       (auto_bus_xing_in_d_mem_0_corrupt),
    .auto_in_d_mem_1_opcode        (auto_bus_xing_in_d_mem_1_opcode),
    .auto_in_d_mem_1_param         (auto_bus_xing_in_d_mem_1_param),
    .auto_in_d_mem_1_size          (auto_bus_xing_in_d_mem_1_size),
    .auto_in_d_mem_1_source        (auto_bus_xing_in_d_mem_1_source),
    .auto_in_d_mem_1_sink          (auto_bus_xing_in_d_mem_1_sink),
    .auto_in_d_mem_1_denied        (auto_bus_xing_in_d_mem_1_denied),
    .auto_in_d_mem_1_data          (auto_bus_xing_in_d_mem_1_data),
    .auto_in_d_mem_1_corrupt       (auto_bus_xing_in_d_mem_1_corrupt),
    .auto_in_d_mem_2_opcode        (auto_bus_xing_in_d_mem_2_opcode),
    .auto_in_d_mem_2_param         (auto_bus_xing_in_d_mem_2_param),
    .auto_in_d_mem_2_size          (auto_bus_xing_in_d_mem_2_size),
    .auto_in_d_mem_2_source        (auto_bus_xing_in_d_mem_2_source),
    .auto_in_d_mem_2_sink          (auto_bus_xing_in_d_mem_2_sink),
    .auto_in_d_mem_2_denied        (auto_bus_xing_in_d_mem_2_denied),
    .auto_in_d_mem_2_data          (auto_bus_xing_in_d_mem_2_data),
    .auto_in_d_mem_2_corrupt       (auto_bus_xing_in_d_mem_2_corrupt),
    .auto_in_d_mem_3_opcode        (auto_bus_xing_in_d_mem_3_opcode),
    .auto_in_d_mem_3_param         (auto_bus_xing_in_d_mem_3_param),
    .auto_in_d_mem_3_size          (auto_bus_xing_in_d_mem_3_size),
    .auto_in_d_mem_3_source        (auto_bus_xing_in_d_mem_3_source),
    .auto_in_d_mem_3_sink          (auto_bus_xing_in_d_mem_3_sink),
    .auto_in_d_mem_3_denied        (auto_bus_xing_in_d_mem_3_denied),
    .auto_in_d_mem_3_data          (auto_bus_xing_in_d_mem_3_data),
    .auto_in_d_mem_3_corrupt       (auto_bus_xing_in_d_mem_3_corrupt),
    .auto_in_d_mem_4_opcode        (auto_bus_xing_in_d_mem_4_opcode),
    .auto_in_d_mem_4_param         (auto_bus_xing_in_d_mem_4_param),
    .auto_in_d_mem_4_size          (auto_bus_xing_in_d_mem_4_size),
    .auto_in_d_mem_4_source        (auto_bus_xing_in_d_mem_4_source),
    .auto_in_d_mem_4_sink          (auto_bus_xing_in_d_mem_4_sink),
    .auto_in_d_mem_4_denied        (auto_bus_xing_in_d_mem_4_denied),
    .auto_in_d_mem_4_data          (auto_bus_xing_in_d_mem_4_data),
    .auto_in_d_mem_4_corrupt       (auto_bus_xing_in_d_mem_4_corrupt),
    .auto_in_d_mem_5_opcode        (auto_bus_xing_in_d_mem_5_opcode),
    .auto_in_d_mem_5_param         (auto_bus_xing_in_d_mem_5_param),
    .auto_in_d_mem_5_size          (auto_bus_xing_in_d_mem_5_size),
    .auto_in_d_mem_5_source        (auto_bus_xing_in_d_mem_5_source),
    .auto_in_d_mem_5_sink          (auto_bus_xing_in_d_mem_5_sink),
    .auto_in_d_mem_5_denied        (auto_bus_xing_in_d_mem_5_denied),
    .auto_in_d_mem_5_data          (auto_bus_xing_in_d_mem_5_data),
    .auto_in_d_mem_5_corrupt       (auto_bus_xing_in_d_mem_5_corrupt),
    .auto_in_d_mem_6_opcode        (auto_bus_xing_in_d_mem_6_opcode),
    .auto_in_d_mem_6_param         (auto_bus_xing_in_d_mem_6_param),
    .auto_in_d_mem_6_size          (auto_bus_xing_in_d_mem_6_size),
    .auto_in_d_mem_6_source        (auto_bus_xing_in_d_mem_6_source),
    .auto_in_d_mem_6_sink          (auto_bus_xing_in_d_mem_6_sink),
    .auto_in_d_mem_6_denied        (auto_bus_xing_in_d_mem_6_denied),
    .auto_in_d_mem_6_data          (auto_bus_xing_in_d_mem_6_data),
    .auto_in_d_mem_6_corrupt       (auto_bus_xing_in_d_mem_6_corrupt),
    .auto_in_d_mem_7_opcode        (auto_bus_xing_in_d_mem_7_opcode),
    .auto_in_d_mem_7_param         (auto_bus_xing_in_d_mem_7_param),
    .auto_in_d_mem_7_size          (auto_bus_xing_in_d_mem_7_size),
    .auto_in_d_mem_7_source        (auto_bus_xing_in_d_mem_7_source),
    .auto_in_d_mem_7_sink          (auto_bus_xing_in_d_mem_7_sink),
    .auto_in_d_mem_7_denied        (auto_bus_xing_in_d_mem_7_denied),
    .auto_in_d_mem_7_data          (auto_bus_xing_in_d_mem_7_data),
    .auto_in_d_mem_7_corrupt       (auto_bus_xing_in_d_mem_7_corrupt),
    .auto_in_d_ridx                (auto_bus_xing_in_d_ridx),
    .auto_in_d_widx                (auto_bus_xing_in_d_widx),
    .auto_in_d_safe_ridx_valid     (auto_bus_xing_in_d_safe_ridx_valid),
    .auto_in_d_safe_widx_valid     (auto_bus_xing_in_d_safe_widx_valid),
    .auto_in_d_safe_source_reset_n (auto_bus_xing_in_d_safe_source_reset_n),
    .auto_in_d_safe_sink_reset_n   (auto_bus_xing_in_d_safe_sink_reset_n),
    .auto_out_a_ready              (_in_xbar_auto_in_0_a_ready),
    .auto_out_a_valid              (_asink_auto_out_a_valid),
    .auto_out_a_bits_opcode        (_asink_auto_out_a_bits_opcode),
    .auto_out_a_bits_param         (_asink_auto_out_a_bits_param),
    .auto_out_a_bits_size          (_asink_auto_out_a_bits_size),
    .auto_out_a_bits_source        (_asink_auto_out_a_bits_source),
    .auto_out_a_bits_address       (_asink_auto_out_a_bits_address),
    .auto_out_a_bits_mask          (_asink_auto_out_a_bits_mask),
    .auto_out_a_bits_data          (_asink_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt       (_asink_auto_out_a_bits_corrupt),
    .auto_out_d_ready              (_asink_auto_out_d_ready),
    .auto_out_d_valid              (_in_xbar_auto_in_0_d_valid),
    .auto_out_d_bits_opcode        (_in_xbar_auto_in_0_d_bits_opcode),
    .auto_out_d_bits_param         (_in_xbar_auto_in_0_d_bits_param),
    .auto_out_d_bits_size          (_in_xbar_auto_in_0_d_bits_size),
    .auto_out_d_bits_source        (_in_xbar_auto_in_0_d_bits_source),
    .auto_out_d_bits_sink          (_in_xbar_auto_in_0_d_bits_sink),
    .auto_out_d_bits_denied        (_in_xbar_auto_in_0_d_bits_denied),
    .auto_out_d_bits_data          (_in_xbar_auto_in_0_d_bits_data),
    .auto_out_d_bits_corrupt       (_in_xbar_auto_in_0_d_bits_corrupt)
  );
  TLInterconnectCoupler_9 coupler_to_plic (
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
    .auto_tl_in_a_ready                 (_coupler_to_plic_auto_tl_in_a_ready),
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
    .auto_tl_in_d_valid                 (_coupler_to_plic_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode           (_coupler_to_plic_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size             (_coupler_to_plic_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source           (_coupler_to_plic_auto_tl_in_d_bits_source)
  );
  TLInterconnectCoupler_10 coupler_to_clint (
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
    .auto_tl_in_d_valid                 (_coupler_to_clint_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode           (_coupler_to_clint_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size             (_coupler_to_clint_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source           (_coupler_to_clint_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data             (_coupler_to_clint_auto_tl_in_d_bits_data)
  );
  TLInterconnectCoupler_12 coupler_to_debug (
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
    .auto_tl_in_a_valid                 (_out_xbar_auto_out_5_a_valid),
    .auto_tl_in_a_bits_opcode           (_out_xbar_auto_out_5_a_bits_opcode),
    .auto_tl_in_a_bits_param            (_out_xbar_auto_out_5_a_bits_param),
    .auto_tl_in_a_bits_size             (_out_xbar_auto_out_5_a_bits_size),
    .auto_tl_in_a_bits_source           (_out_xbar_auto_out_5_a_bits_source),
    .auto_tl_in_a_bits_address          (_out_xbar_auto_out_5_a_bits_address),
    .auto_tl_in_a_bits_mask             (_out_xbar_auto_out_5_a_bits_mask),
    .auto_tl_in_a_bits_data             (_out_xbar_auto_out_5_a_bits_data),
    .auto_tl_in_a_bits_corrupt          (_out_xbar_auto_out_5_a_bits_corrupt),
    .auto_tl_in_d_ready                 (_out_xbar_auto_out_5_d_ready),
    .auto_tl_in_d_valid                 (_coupler_to_debug_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_opcode           (_coupler_to_debug_auto_tl_in_d_bits_opcode),
    .auto_tl_in_d_bits_size             (_coupler_to_debug_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source           (_coupler_to_debug_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data             (_coupler_to_debug_auto_tl_in_d_bits_data)
  );
  TLInterconnectCoupler_14 coupler_to_bootrom (
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
    .auto_tl_in_a_valid                 (_out_xbar_auto_out_6_a_valid),
    .auto_tl_in_a_bits_opcode           (_out_xbar_auto_out_6_a_bits_opcode),
    .auto_tl_in_a_bits_param            (_out_xbar_auto_out_6_a_bits_param),
    .auto_tl_in_a_bits_size             (_out_xbar_auto_out_6_a_bits_size),
    .auto_tl_in_a_bits_source           (_out_xbar_auto_out_6_a_bits_source),
    .auto_tl_in_a_bits_address          (_out_xbar_auto_out_6_a_bits_address),
    .auto_tl_in_a_bits_mask             (_out_xbar_auto_out_6_a_bits_mask),
    .auto_tl_in_a_bits_corrupt          (_out_xbar_auto_out_6_a_bits_corrupt),
    .auto_tl_in_d_ready                 (_out_xbar_auto_out_6_d_ready),
    .auto_tl_in_d_valid                 (_coupler_to_bootrom_auto_tl_in_d_valid),
    .auto_tl_in_d_bits_size             (_coupler_to_bootrom_auto_tl_in_d_bits_size),
    .auto_tl_in_d_bits_source           (_coupler_to_bootrom_auto_tl_in_d_bits_source),
    .auto_tl_in_d_bits_data             (_coupler_to_bootrom_auto_tl_in_d_bits_data)
  );
  TLInterconnectCoupler_16 coupler_to_prci_ctrl (
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
    .auto_tl_in_a_valid            (_out_xbar_auto_out_7_a_valid),
    .auto_tl_in_a_bits_opcode      (_out_xbar_auto_out_7_a_bits_opcode),
    .auto_tl_in_a_bits_param       (_out_xbar_auto_out_7_a_bits_param),
    .auto_tl_in_a_bits_size        (_out_xbar_auto_out_7_a_bits_size),
    .auto_tl_in_a_bits_source      (_out_xbar_auto_out_7_a_bits_source),
    .auto_tl_in_a_bits_address     (_out_xbar_auto_out_7_a_bits_address),
    .auto_tl_in_a_bits_mask        (_out_xbar_auto_out_7_a_bits_mask),
    .auto_tl_in_a_bits_data        (_out_xbar_auto_out_7_a_bits_data),
    .auto_tl_in_a_bits_corrupt     (_out_xbar_auto_out_7_a_bits_corrupt),
    .auto_tl_in_d_ready            (_out_xbar_auto_out_7_d_ready),
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

