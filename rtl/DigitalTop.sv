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

module DigitalTop(
  input        clock,
               reset,
  output       auto_implicitClockGrouper_out_clock,
               auto_implicitClockGrouper_out_reset,
               auto_prci_ctrl_domain_pllCtrl_ctrl_out_gate,
               auto_prci_ctrl_domain_pllCtrl_ctrl_out_power,
  input        auto_prci_ctrl_domain_clockSelector_clock_in_1_clock,
               auto_prci_ctrl_domain_clockSelector_clock_in_0_clock,
               auto_prci_ctrl_domain_clockSelector_clock_in_0_reset,
  output       auto_subsystem_cbus_fixedClockNode_out_clock,
               auto_subsystem_cbus_fixedClockNode_out_reset,
  input        resetctrl_hartIsInReset_0,
               debug_clock,
               debug_reset,
               debug_systemjtag_jtag_TCK,
               debug_systemjtag_jtag_TMS,
               debug_systemjtag_jtag_TDI,
  output       debug_systemjtag_jtag_TDO_data,
  input        debug_systemjtag_reset,
  output       debug_dmactive,
  input        debug_dmactiveAck,
               custom_boot,
               serial_tl_0_clock,
  output       serial_tl_0_bits_in_ready,
  input        serial_tl_0_bits_in_valid,
  input  [3:0] serial_tl_0_bits_in_bits,
  input        serial_tl_0_bits_out_ready,
  output       serial_tl_0_bits_out_valid,
  output [3:0] serial_tl_0_bits_out_bits,
  output       uart_0_txd,
  input        uart_0_rxd
);

  wire        _dtm_io_dmi_req_valid;
  wire [6:0]  _dtm_io_dmi_req_bits_addr;
  wire [31:0] _dtm_io_dmi_req_bits_data;
  wire [1:0]  _dtm_io_dmi_req_bits_op;
  wire        _dtm_io_dmi_resp_ready;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_implicit_clock_clock;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_implicit_clock_reset;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_cbus_0_clock;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_cbus_0_reset;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_1_clock;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_1_reset;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_0_clock;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_0_reset;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_fbus_0_clock;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_fbus_0_reset;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_pbus_0_clock;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_pbus_0_reset;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_1_clock;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_1_reset;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_0_clock;
  wire        _clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_0_reset;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_implicit_clock_clock;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_implicit_clock_reset;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_cbus_0_clock;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_cbus_0_reset;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_mbus_1_clock;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_mbus_1_reset;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_mbus_0_clock;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_mbus_0_reset;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_fbus_0_clock;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_fbus_0_reset;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_pbus_0_clock;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_pbus_0_reset;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_sbus_1_clock;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_sbus_1_reset;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_sbus_0_clock;
  wire        _frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_sbus_0_reset;
  wire        _clockNamePrefixer_auto_clock_name_prefixer_out_4_member_subsystem_cbus_0_clock;
  wire        _clockNamePrefixer_auto_clock_name_prefixer_out_4_member_subsystem_cbus_0_reset;
  wire        _clockNamePrefixer_auto_clock_name_prefixer_out_3_member_subsystem_mbus_1_clock;
  wire        _clockNamePrefixer_auto_clock_name_prefixer_out_3_member_subsystem_mbus_1_reset;
  wire        _clockNamePrefixer_auto_clock_name_prefixer_out_3_member_subsystem_mbus_0_clock;
  wire        _clockNamePrefixer_auto_clock_name_prefixer_out_3_member_subsystem_mbus_0_reset;
  wire        _clockNamePrefixer_auto_clock_name_prefixer_out_2_member_subsystem_fbus_0_clock;
  wire        _clockNamePrefixer_auto_clock_name_prefixer_out_2_member_subsystem_fbus_0_reset;
  wire        _clockNamePrefixer_auto_clock_name_prefixer_out_1_member_subsystem_pbus_0_clock;
  wire        _clockNamePrefixer_auto_clock_name_prefixer_out_1_member_subsystem_pbus_0_reset;
  wire        _clockNamePrefixer_auto_clock_name_prefixer_out_0_member_subsystem_sbus_1_clock;
  wire        _clockNamePrefixer_auto_clock_name_prefixer_out_0_member_subsystem_sbus_1_reset;
  wire        _clockNamePrefixer_auto_clock_name_prefixer_out_0_member_subsystem_sbus_0_clock;
  wire        _clockNamePrefixer_auto_clock_name_prefixer_out_0_member_subsystem_sbus_0_reset;
  wire        _aggregator_auto_out_4_member_subsystem_cbus_subsystem_cbus_0_clock;
  wire        _aggregator_auto_out_4_member_subsystem_cbus_subsystem_cbus_0_reset;
  wire        _aggregator_auto_out_3_member_subsystem_mbus_subsystem_mbus_1_clock;
  wire        _aggregator_auto_out_3_member_subsystem_mbus_subsystem_mbus_1_reset;
  wire        _aggregator_auto_out_3_member_subsystem_mbus_subsystem_mbus_0_clock;
  wire        _aggregator_auto_out_3_member_subsystem_mbus_subsystem_mbus_0_reset;
  wire        _aggregator_auto_out_2_member_subsystem_fbus_subsystem_fbus_0_clock;
  wire        _aggregator_auto_out_2_member_subsystem_fbus_subsystem_fbus_0_reset;
  wire        _aggregator_auto_out_1_member_subsystem_pbus_subsystem_pbus_0_clock;
  wire        _aggregator_auto_out_1_member_subsystem_pbus_subsystem_pbus_0_reset;
  wire        _aggregator_auto_out_0_member_subsystem_sbus_subsystem_sbus_1_clock;
  wire        _aggregator_auto_out_0_member_subsystem_sbus_subsystem_sbus_1_reset;
  wire        _aggregator_auto_out_0_member_subsystem_sbus_subsystem_sbus_0_clock;
  wire        _aggregator_auto_out_0_member_subsystem_sbus_subsystem_sbus_0_reset;
  wire        _prci_ctrl_domain_auto_resetSynchronizer_out_member_allClocks_uncore_clock;
  wire        _prci_ctrl_domain_auto_resetSynchronizer_out_member_allClocks_uncore_reset;
  wire        _prci_ctrl_domain_auto_xbar_in_a_ready;
  wire        _prci_ctrl_domain_auto_xbar_in_d_valid;
  wire [2:0]  _prci_ctrl_domain_auto_xbar_in_d_bits_opcode;
  wire [2:0]  _prci_ctrl_domain_auto_xbar_in_d_bits_size;
  wire [6:0]  _prci_ctrl_domain_auto_xbar_in_d_bits_source;
  wire [63:0] _prci_ctrl_domain_auto_xbar_in_d_bits_data;
  wire        _intsink_4_auto_out_0;
  wire        _uartClockDomainWrapper_auto_uart_0_int_xing_out_sync_0;
  wire        _uartClockDomainWrapper_auto_uart_0_control_xing_in_a_ready;
  wire        _uartClockDomainWrapper_auto_uart_0_control_xing_in_d_valid;
  wire [2:0]  _uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_opcode;
  wire [1:0]  _uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_size;
  wire [10:0] _uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_source;
  wire [63:0] _uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_data;
  wire        _serial_tl_domain_auto_serdesser_manager_in_a_ready;
  wire        _serial_tl_domain_auto_serdesser_manager_in_d_valid;
  wire [2:0]  _serial_tl_domain_auto_serdesser_manager_in_d_bits_opcode;
  wire [1:0]  _serial_tl_domain_auto_serdesser_manager_in_d_bits_param;
  wire [2:0]  _serial_tl_domain_auto_serdesser_manager_in_d_bits_size;
  wire [3:0]  _serial_tl_domain_auto_serdesser_manager_in_d_bits_source;
  wire        _serial_tl_domain_auto_serdesser_manager_in_d_bits_sink;
  wire        _serial_tl_domain_auto_serdesser_manager_in_d_bits_denied;
  wire [63:0] _serial_tl_domain_auto_serdesser_manager_in_d_bits_data;
  wire        _serial_tl_domain_auto_serdesser_manager_in_d_bits_corrupt;
  wire        _serial_tl_domain_auto_serdesser_client_out_a_valid;
  wire [2:0]  _serial_tl_domain_auto_serdesser_client_out_a_bits_opcode;
  wire [2:0]  _serial_tl_domain_auto_serdesser_client_out_a_bits_param;
  wire [3:0]  _serial_tl_domain_auto_serdesser_client_out_a_bits_size;
  wire [3:0]  _serial_tl_domain_auto_serdesser_client_out_a_bits_source;
  wire [32:0] _serial_tl_domain_auto_serdesser_client_out_a_bits_address;
  wire [7:0]  _serial_tl_domain_auto_serdesser_client_out_a_bits_mask;
  wire [63:0] _serial_tl_domain_auto_serdesser_client_out_a_bits_data;
  wire        _serial_tl_domain_auto_serdesser_client_out_a_bits_corrupt;
  wire        _serial_tl_domain_auto_serdesser_client_out_d_ready;
  wire        _bank_auto_xbar_in_a_ready;
  wire        _bank_auto_xbar_in_d_valid;
  wire [2:0]  _bank_auto_xbar_in_d_bits_opcode;
  wire [2:0]  _bank_auto_xbar_in_d_bits_size;
  wire [3:0]  _bank_auto_xbar_in_d_bits_source;
  wire [63:0] _bank_auto_xbar_in_d_bits_data;
  wire        _bootROMDomainWrapper_auto_bootrom_in_a_ready;
  wire        _bootROMDomainWrapper_auto_bootrom_in_d_valid;
  wire [1:0]  _bootROMDomainWrapper_auto_bootrom_in_d_bits_size;
  wire [10:0] _bootROMDomainWrapper_auto_bootrom_in_d_bits_source;
  wire [63:0] _bootROMDomainWrapper_auto_bootrom_in_d_bits_data;
  wire        _intsource_2_auto_out_sync_0;
  wire        _intsource_1_auto_out_sync_0;
  wire        _intsource_auto_out_sync_0;
  wire        _intsource_auto_out_sync_1;
  wire        _tlDM_auto_dmInner_dmInner_tl_in_a_ready;
  wire        _tlDM_auto_dmInner_dmInner_tl_in_d_valid;
  wire [2:0]  _tlDM_auto_dmInner_dmInner_tl_in_d_bits_opcode;
  wire [1:0]  _tlDM_auto_dmInner_dmInner_tl_in_d_bits_size;
  wire [10:0] _tlDM_auto_dmInner_dmInner_tl_in_d_bits_source;
  wire [63:0] _tlDM_auto_dmInner_dmInner_tl_in_d_bits_data;
  wire        _tlDM_auto_dmOuter_intsource_out_sync_0;
  wire        _tlDM_io_dmi_dmi_req_ready;
  wire        _tlDM_io_dmi_dmi_resp_valid;
  wire [31:0] _tlDM_io_dmi_dmi_resp_bits_data;
  wire [1:0]  _tlDM_io_dmi_dmi_resp_bits_resp;
  wire        _tileHartIdNexusNode_auto_out;
  wire        _clint_auto_int_out_0;
  wire        _clint_auto_int_out_1;
  wire        _clint_auto_in_a_ready;
  wire        _clint_auto_in_d_valid;
  wire [2:0]  _clint_auto_in_d_bits_opcode;
  wire [1:0]  _clint_auto_in_d_bits_size;
  wire [10:0] _clint_auto_in_d_bits_source;
  wire [63:0] _clint_auto_in_d_bits_data;
  wire        _plicDomainWrapper_auto_plic_int_out_1_0;
  wire        _plicDomainWrapper_auto_plic_int_out_0_0;
  wire        _plicDomainWrapper_auto_plic_in_a_ready;
  wire        _plicDomainWrapper_auto_plic_in_d_valid;
  wire [2:0]  _plicDomainWrapper_auto_plic_in_d_bits_opcode;
  wire [1:0]  _plicDomainWrapper_auto_plic_in_d_bits_size;
  wire [10:0] _plicDomainWrapper_auto_plic_in_d_bits_source;
  wire [63:0] _plicDomainWrapper_auto_plic_in_d_bits_data;
  wire        _tile_prci_domain_auto_tl_master_clock_xing_out_a_valid;
  wire [2:0]  _tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_opcode;
  wire [2:0]  _tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_param;
  wire [3:0]  _tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_size;
  wire [4:0]  _tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_source;
  wire [32:0] _tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_address;
  wire [7:0]  _tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_mask;
  wire [63:0] _tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_data;
  wire        _tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_corrupt;
  wire        _tile_prci_domain_auto_tl_master_clock_xing_out_b_ready;
  wire        _tile_prci_domain_auto_tl_master_clock_xing_out_c_valid;
  wire [2:0]  _tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_opcode;
  wire [2:0]  _tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_param;
  wire [3:0]  _tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_size;
  wire [4:0]  _tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_source;
  wire [32:0] _tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_address;
  wire [63:0] _tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_data;
  wire        _tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_corrupt;
  wire        _tile_prci_domain_auto_tl_master_clock_xing_out_d_ready;
  wire        _tile_prci_domain_auto_tl_master_clock_xing_out_e_valid;
  wire [2:0]  _tile_prci_domain_auto_tl_master_clock_xing_out_e_bits_sink;
  wire        _subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_valid;
  wire [2:0]  _subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_opcode;
  wire [2:0]  _subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_param;
  wire [2:0]  _subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_size;
  wire [3:0]  _subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_source;
  wire [32:0] _subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_address;
  wire [7:0]  _subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_mask;
  wire [63:0] _subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_data;
  wire        _subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_corrupt;
  wire        _subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_ready;
  wire        _subsystem_obus_auto_fixer_in_a_ready;
  wire        _subsystem_obus_auto_fixer_in_d_valid;
  wire [2:0]  _subsystem_obus_auto_fixer_in_d_bits_opcode;
  wire [1:0]  _subsystem_obus_auto_fixer_in_d_bits_param;
  wire [2:0]  _subsystem_obus_auto_fixer_in_d_bits_size;
  wire [3:0]  _subsystem_obus_auto_fixer_in_d_bits_source;
  wire        _subsystem_obus_auto_fixer_in_d_bits_sink;
  wire        _subsystem_obus_auto_fixer_in_d_bits_denied;
  wire [63:0] _subsystem_obus_auto_fixer_in_d_bits_data;
  wire        _subsystem_obus_auto_fixer_in_d_bits_corrupt;
  wire        _subsystem_obus_auto_fixedClockNode_out_clock;
  wire        _subsystem_obus_auto_fixedClockNode_out_reset;
  wire        _subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid;
  wire [2:0]  _subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode;
  wire [2:0]  _subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param;
  wire [2:0]  _subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size;
  wire [3:0]  _subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source;
  wire [32:0] _subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address;
  wire [7:0]  _subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask;
  wire [63:0] _subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data;
  wire        _subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_corrupt;
  wire        _subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready;
  wire        _subsystem_l2_wrapper_auto_coherent_jbar_in_a_ready;
  wire        _subsystem_l2_wrapper_auto_coherent_jbar_in_b_valid;
  wire [1:0]  _subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_param;
  wire [32:0] _subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_address;
  wire        _subsystem_l2_wrapper_auto_coherent_jbar_in_c_ready;
  wire        _subsystem_l2_wrapper_auto_coherent_jbar_in_d_valid;
  wire [2:0]  _subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_opcode;
  wire [1:0]  _subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_param;
  wire [2:0]  _subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_size;
  wire [5:0]  _subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_source;
  wire [2:0]  _subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_sink;
  wire        _subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_denied;
  wire [63:0] _subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_data;
  wire        _subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_corrupt;
  wire        _subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_a_ready;
  wire        _subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_valid;
  wire [2:0]  _subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_bits_opcode;
  wire [1:0]  _subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_bits_size;
  wire [10:0] _subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_bits_source;
  wire [63:0] _subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_bits_data;
  wire        _subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_valid;
  wire [2:0]  _subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_opcode;
  wire [2:0]  _subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_param;
  wire [2:0]  _subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_size;
  wire [3:0]  _subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_source;
  wire [27:0] _subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_address;
  wire [7:0]  _subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_mask;
  wire [63:0] _subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_data;
  wire        _subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_corrupt;
  wire        _subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_ready;
  wire        _subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_valid;
  wire [2:0]  _subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_opcode;
  wire [2:0]  _subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_param;
  wire [2:0]  _subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_size;
  wire [3:0]  _subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_source;
  wire [32:0] _subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_address;
  wire [7:0]  _subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_mask;
  wire [63:0] _subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_data;
  wire        _subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_corrupt;
  wire        _subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_d_ready;
  wire        _subsystem_mbus_auto_subsystem_mbus_clock_groups_out_member_subsystem_obus_0_clock;
  wire        _subsystem_mbus_auto_subsystem_mbus_clock_groups_out_member_subsystem_obus_0_reset;
  wire        _subsystem_mbus_auto_bus_xing_in_a_ready;
  wire        _subsystem_mbus_auto_bus_xing_in_d_valid;
  wire [2:0]  _subsystem_mbus_auto_bus_xing_in_d_bits_opcode;
  wire [1:0]  _subsystem_mbus_auto_bus_xing_in_d_bits_param;
  wire [2:0]  _subsystem_mbus_auto_bus_xing_in_d_bits_size;
  wire [3:0]  _subsystem_mbus_auto_bus_xing_in_d_bits_source;
  wire        _subsystem_mbus_auto_bus_xing_in_d_bits_sink;
  wire        _subsystem_mbus_auto_bus_xing_in_d_bits_denied;
  wire [63:0] _subsystem_mbus_auto_bus_xing_in_d_bits_data;
  wire        _subsystem_mbus_auto_bus_xing_in_d_bits_corrupt;
  wire        _subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_valid;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_opcode;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_param;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_size;
  wire [6:0]  _subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_source;
  wire [20:0] _subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_address;
  wire [7:0]  _subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_mask;
  wire [63:0] _subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_data;
  wire        _subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_corrupt;
  wire        _subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_d_ready;
  wire        _subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param;
  wire [1:0]  _subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size;
  wire [10:0] _subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source;
  wire [16:0] _subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address;
  wire [7:0]  _subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask;
  wire        _subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt;
  wire        _subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready;
  wire        _subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_valid;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param;
  wire [1:0]  _subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size;
  wire [10:0] _subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source;
  wire [11:0] _subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address;
  wire [7:0]  _subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask;
  wire [63:0] _subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data;
  wire        _subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt;
  wire        _subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_ready;
  wire        _subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_valid;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param;
  wire [1:0]  _subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size;
  wire [10:0] _subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source;
  wire [25:0] _subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address;
  wire [7:0]  _subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask;
  wire [63:0] _subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data;
  wire        _subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt;
  wire        _subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_ready;
  wire        _subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_valid;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param;
  wire [1:0]  _subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size;
  wire [10:0] _subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source;
  wire [27:0] _subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address;
  wire [7:0]  _subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask;
  wire [63:0] _subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data;
  wire        _subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt;
  wire        _subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_ready;
  wire        _subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_opcode;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_param;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_size;
  wire [6:0]  _subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_source;
  wire [28:0] _subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_address;
  wire [7:0]  _subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_mask;
  wire [63:0] _subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_data;
  wire        _subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_corrupt;
  wire        _subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready;
  wire        _subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_valid;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_opcode;
  wire [2:0]  _subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_param;
  wire [1:0]  _subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_size;
  wire [10:0] _subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_source;
  wire [25:0] _subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_address;
  wire [7:0]  _subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_mask;
  wire [63:0] _subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_data;
  wire        _subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_corrupt;
  wire        _subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_d_ready;
  wire        _subsystem_cbus_auto_fixedClockNode_out_3_clock;
  wire        _subsystem_cbus_auto_fixedClockNode_out_3_reset;
  wire        _subsystem_cbus_auto_fixedClockNode_out_2_clock;
  wire        _subsystem_cbus_auto_fixedClockNode_out_2_reset;
  wire        _subsystem_cbus_auto_fixedClockNode_out_0_clock;
  wire        _subsystem_cbus_auto_fixedClockNode_out_0_reset;
  wire        _subsystem_cbus_auto_bus_xing_in_a_ready;
  wire        _subsystem_cbus_auto_bus_xing_in_d_valid;
  wire [2:0]  _subsystem_cbus_auto_bus_xing_in_d_bits_opcode;
  wire [1:0]  _subsystem_cbus_auto_bus_xing_in_d_bits_param;
  wire [3:0]  _subsystem_cbus_auto_bus_xing_in_d_bits_size;
  wire [5:0]  _subsystem_cbus_auto_bus_xing_in_d_bits_source;
  wire        _subsystem_cbus_auto_bus_xing_in_d_bits_sink;
  wire        _subsystem_cbus_auto_bus_xing_in_d_bits_denied;
  wire [63:0] _subsystem_cbus_auto_bus_xing_in_d_bits_data;
  wire        _subsystem_cbus_auto_bus_xing_in_d_bits_corrupt;
  wire        _subsystem_cbus_clock;
  wire        _subsystem_cbus_reset;
  wire        _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_a_ready;
  wire        _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_valid;
  wire [2:0]  _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_opcode;
  wire [1:0]  _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_param;
  wire [3:0]  _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_size;
  wire [3:0]  _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_source;
  wire [2:0]  _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_sink;
  wire        _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_denied;
  wire [63:0] _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_data;
  wire        _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_corrupt;
  wire        _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_valid;
  wire [2:0]  _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_opcode;
  wire [2:0]  _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_param;
  wire [3:0]  _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_size;
  wire [3:0]  _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_source;
  wire [32:0] _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_address;
  wire [7:0]  _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_mask;
  wire [63:0] _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_data;
  wire        _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_corrupt;
  wire        _subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_d_ready;
  wire        _subsystem_fbus_buffer_auto_in_a_ready;
  wire        _subsystem_fbus_buffer_auto_in_d_valid;
  wire [2:0]  _subsystem_fbus_buffer_auto_in_d_bits_opcode;
  wire [1:0]  _subsystem_fbus_buffer_auto_in_d_bits_param;
  wire [3:0]  _subsystem_fbus_buffer_auto_in_d_bits_size;
  wire [3:0]  _subsystem_fbus_buffer_auto_in_d_bits_source;
  wire [2:0]  _subsystem_fbus_buffer_auto_in_d_bits_sink;
  wire        _subsystem_fbus_buffer_auto_in_d_bits_denied;
  wire [63:0] _subsystem_fbus_buffer_auto_in_d_bits_data;
  wire        _subsystem_fbus_buffer_auto_in_d_bits_corrupt;
  wire        _subsystem_fbus_buffer_auto_out_a_valid;
  wire [2:0]  _subsystem_fbus_buffer_auto_out_a_bits_opcode;
  wire [2:0]  _subsystem_fbus_buffer_auto_out_a_bits_param;
  wire [3:0]  _subsystem_fbus_buffer_auto_out_a_bits_size;
  wire [3:0]  _subsystem_fbus_buffer_auto_out_a_bits_source;
  wire [32:0] _subsystem_fbus_buffer_auto_out_a_bits_address;
  wire [7:0]  _subsystem_fbus_buffer_auto_out_a_bits_mask;
  wire [63:0] _subsystem_fbus_buffer_auto_out_a_bits_data;
  wire        _subsystem_fbus_buffer_auto_out_a_bits_corrupt;
  wire        _subsystem_fbus_buffer_auto_out_d_ready;
  wire        _subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_valid;
  wire [2:0]  _subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_opcode;
  wire [2:0]  _subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_param;
  wire [1:0]  _subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_size;
  wire [10:0] _subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_source;
  wire [28:0] _subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_address;
  wire [7:0]  _subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_mask;
  wire [63:0] _subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_data;
  wire        _subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_corrupt;
  wire        _subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_ready;
  wire        _subsystem_pbus_auto_fixedClockNode_out_clock;
  wire        _subsystem_pbus_auto_fixedClockNode_out_reset;
  wire        _subsystem_pbus_auto_bus_xing_in_a_ready;
  wire        _subsystem_pbus_auto_bus_xing_in_d_valid;
  wire [2:0]  _subsystem_pbus_auto_bus_xing_in_d_bits_opcode;
  wire [1:0]  _subsystem_pbus_auto_bus_xing_in_d_bits_param;
  wire [2:0]  _subsystem_pbus_auto_bus_xing_in_d_bits_size;
  wire [6:0]  _subsystem_pbus_auto_bus_xing_in_d_bits_source;
  wire        _subsystem_pbus_auto_bus_xing_in_d_bits_sink;
  wire        _subsystem_pbus_auto_bus_xing_in_d_bits_denied;
  wire [63:0] _subsystem_pbus_auto_bus_xing_in_d_bits_data;
  wire        _subsystem_pbus_auto_bus_xing_in_d_bits_corrupt;
  wire        _subsystem_pbus_clock;
  wire        _subsystem_pbus_reset;
  wire        _subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_ready;
  wire        _subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_valid;
  wire [1:0]  _subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_param;
  wire [32:0] _subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_address;
  wire        _subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_ready;
  wire        _subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_valid;
  wire [2:0]  _subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_opcode;
  wire [1:0]  _subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_param;
  wire [3:0]  _subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_size;
  wire [4:0]  _subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_source;
  wire [2:0]  _subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_sink;
  wire        _subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_denied;
  wire [63:0] _subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_data;
  wire        _subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_corrupt;
  wire        _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid;
  wire [2:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode;
  wire [2:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param;
  wire [2:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size;
  wire [5:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source;
  wire [32:0] _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address;
  wire [7:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask;
  wire [63:0] _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data;
  wire        _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt;
  wire        _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready;
  wire        _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid;
  wire [2:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode;
  wire [2:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param;
  wire [2:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size;
  wire [5:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source;
  wire [32:0] _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address;
  wire [63:0] _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data;
  wire        _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt;
  wire        _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready;
  wire        _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid;
  wire [2:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink;
  wire        _subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready;
  wire        _subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid;
  wire [2:0]  _subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode;
  wire [1:0]  _subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param;
  wire [3:0]  _subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size;
  wire [3:0]  _subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source;
  wire [2:0]  _subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink;
  wire        _subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied;
  wire [63:0] _subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data;
  wire        _subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt;
  wire        _subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid;
  wire [2:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode;
  wire [2:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param;
  wire [3:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size;
  wire [5:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source;
  wire [28:0] _subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address;
  wire [7:0]  _subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask;
  wire [63:0] _subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data;
  wire        _subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt;
  wire        _subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready;
  wire        _subsystem_sbus_auto_fixedClockNode_out_1_clock;
  wire        _subsystem_sbus_auto_fixedClockNode_out_1_reset;
  wire        _subsystem_sbus_auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_clock;
  wire        _subsystem_sbus_auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_reset;
  wire        _ibus_int_bus_auto_int_out_0;
  reg  [8:0]  int_rtc_tick_c_value;
  wire        int_rtc_tick = int_rtc_tick_c_value == 9'h1F3;
  always @(posedge _subsystem_pbus_clock) begin
    if (_subsystem_pbus_reset)
      int_rtc_tick_c_value <= 9'h0;
    else if (int_rtc_tick)
      int_rtc_tick_c_value <= 9'h0;
    else
      int_rtc_tick_c_value <= int_rtc_tick_c_value + 9'h1;
  end // always @(posedge)
  IntXbar ibus_int_bus (
    .auto_int_in_0  (_intsink_4_auto_out_0),
    .auto_int_out_0 (_ibus_int_bus_auto_int_out_0)
  );
  SystemBus subsystem_sbus (
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_ready           (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_ready),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_valid           (_tile_prci_domain_auto_tl_master_clock_xing_out_a_valid),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_opcode     (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_opcode),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_param      (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_param),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_size       (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_size),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_source     (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_source),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_address    (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_address),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_mask       (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_mask),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_data       (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_data),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_bits_corrupt    (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_corrupt),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_ready           (_tile_prci_domain_auto_tl_master_clock_xing_out_b_ready),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_valid           (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_valid),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_param      (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_param),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_address    (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_address),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_ready           (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_ready),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_valid           (_tile_prci_domain_auto_tl_master_clock_xing_out_c_valid),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_opcode     (_tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_opcode),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_param      (_tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_param),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_size       (_tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_size),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_source     (_tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_source),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_address    (_tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_address),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_data       (_tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_data),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_bits_corrupt    (_tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_corrupt),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_ready           (_tile_prci_domain_auto_tl_master_clock_xing_out_d_ready),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_valid           (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_valid),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_opcode     (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_opcode),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_param      (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_param),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_size       (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_size),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_source     (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_source),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_sink       (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_sink),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_denied     (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_denied),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_data       (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_data),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_corrupt    (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_corrupt),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_valid           (_tile_prci_domain_auto_tl_master_clock_xing_out_e_valid),
    .auto_coupler_from_boom_tile_tl_master_clock_xing_in_e_bits_sink       (_tile_prci_domain_auto_tl_master_clock_xing_out_e_bits_sink),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_ready             (_subsystem_l2_wrapper_auto_coherent_jbar_in_a_ready),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid             (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode       (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param        (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size         (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source       (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address      (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask         (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data         (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt      (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready             (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_valid             (_subsystem_l2_wrapper_auto_coherent_jbar_in_b_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_param        (_subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_param),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_b_bits_address      (_subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_address),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_ready             (_subsystem_l2_wrapper_auto_coherent_jbar_in_c_ready),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid             (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode       (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param        (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size         (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source       (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address      (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data         (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt      (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready             (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_valid             (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_opcode       (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_param        (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_param),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_size         (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_size),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_source       (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_source),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_sink         (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_sink),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_denied       (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_denied),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_data         (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_d_bits_corrupt      (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid             (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid),
    .auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink         (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready        (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_valid        (_subsystem_fbus_buffer_auto_out_a_valid),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_opcode  (_subsystem_fbus_buffer_auto_out_a_bits_opcode),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_param   (_subsystem_fbus_buffer_auto_out_a_bits_param),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_size    (_subsystem_fbus_buffer_auto_out_a_bits_size),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_source  (_subsystem_fbus_buffer_auto_out_a_bits_source),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_address (_subsystem_fbus_buffer_auto_out_a_bits_address),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_mask    (_subsystem_fbus_buffer_auto_out_a_bits_mask),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_data    (_subsystem_fbus_buffer_auto_out_a_bits_data),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_bits_corrupt (_subsystem_fbus_buffer_auto_out_a_bits_corrupt),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_ready        (_subsystem_fbus_buffer_auto_out_d_ready),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid        (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode  (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param   (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size    (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source  (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink    (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied  (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data    (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data),
    .auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_ready         (_subsystem_cbus_auto_bus_xing_in_a_ready),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid         (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode   (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param    (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size     (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source   (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address  (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask     (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data     (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt  (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready         (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_valid         (_subsystem_cbus_auto_bus_xing_in_d_valid),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_opcode   (_subsystem_cbus_auto_bus_xing_in_d_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_param    (_subsystem_cbus_auto_bus_xing_in_d_bits_param),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_size     (_subsystem_cbus_auto_bus_xing_in_d_bits_size),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_source   (_subsystem_cbus_auto_bus_xing_in_d_bits_source),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_sink     (_subsystem_cbus_auto_bus_xing_in_d_bits_sink),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_denied   (_subsystem_cbus_auto_bus_xing_in_d_bits_denied),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_data     (_subsystem_cbus_auto_bus_xing_in_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_bits_corrupt  (_subsystem_cbus_auto_bus_xing_in_d_bits_corrupt),
    .auto_fixedClockNode_out_1_clock                                       (_subsystem_sbus_auto_fixedClockNode_out_1_clock),
    .auto_fixedClockNode_out_1_reset                                       (_subsystem_sbus_auto_fixedClockNode_out_1_reset),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_clock     (_clockNamePrefixer_auto_clock_name_prefixer_out_0_member_subsystem_sbus_1_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_1_reset     (_clockNamePrefixer_auto_clock_name_prefixer_out_0_member_subsystem_sbus_1_reset),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_clock     (_clockNamePrefixer_auto_clock_name_prefixer_out_0_member_subsystem_sbus_0_clock),
    .auto_subsystem_sbus_clock_groups_in_member_subsystem_sbus_0_reset     (_clockNamePrefixer_auto_clock_name_prefixer_out_0_member_subsystem_sbus_0_reset),
    .auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_clock      (_subsystem_sbus_auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_clock),
    .auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_reset      (_subsystem_sbus_auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_reset)
  );
  PeripheryBus subsystem_pbus (
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_ready        (_uartClockDomainWrapper_auto_uart_0_control_xing_in_a_ready),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_valid        (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_valid),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_opcode  (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_opcode),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_param   (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_param),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_size    (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_size),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_source  (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_source),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_address (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_address),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_mask    (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_mask),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_data    (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_data),
    .auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_corrupt (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_corrupt),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_ready        (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_ready),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_valid        (_uartClockDomainWrapper_auto_uart_0_control_xing_in_d_valid),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_opcode  (_uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_opcode),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_size    (_uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_size),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_source  (_uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_source),
    .auto_coupler_to_device_named_uart_0_control_xing_out_d_bits_data    (_uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_data),
    .auto_fixedClockNode_out_clock                                       (_subsystem_pbus_auto_fixedClockNode_out_clock),
    .auto_fixedClockNode_out_reset                                       (_subsystem_pbus_auto_fixedClockNode_out_reset),
    .auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_clock   (_clockNamePrefixer_auto_clock_name_prefixer_out_1_member_subsystem_pbus_0_clock),
    .auto_subsystem_pbus_clock_groups_in_member_subsystem_pbus_0_reset   (_clockNamePrefixer_auto_clock_name_prefixer_out_1_member_subsystem_pbus_0_reset),
    .auto_bus_xing_in_a_ready                                            (_subsystem_pbus_auto_bus_xing_in_a_ready),
    .auto_bus_xing_in_a_valid                                            (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid),
    .auto_bus_xing_in_a_bits_opcode                                      (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_opcode),
    .auto_bus_xing_in_a_bits_param                                       (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_param),
    .auto_bus_xing_in_a_bits_size                                        (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_size),
    .auto_bus_xing_in_a_bits_source                                      (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_source),
    .auto_bus_xing_in_a_bits_address                                     (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_address),
    .auto_bus_xing_in_a_bits_mask                                        (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_mask),
    .auto_bus_xing_in_a_bits_data                                        (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_data),
    .auto_bus_xing_in_a_bits_corrupt                                     (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_corrupt),
    .auto_bus_xing_in_d_ready                                            (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready),
    .auto_bus_xing_in_d_valid                                            (_subsystem_pbus_auto_bus_xing_in_d_valid),
    .auto_bus_xing_in_d_bits_opcode                                      (_subsystem_pbus_auto_bus_xing_in_d_bits_opcode),
    .auto_bus_xing_in_d_bits_param                                       (_subsystem_pbus_auto_bus_xing_in_d_bits_param),
    .auto_bus_xing_in_d_bits_size                                        (_subsystem_pbus_auto_bus_xing_in_d_bits_size),
    .auto_bus_xing_in_d_bits_source                                      (_subsystem_pbus_auto_bus_xing_in_d_bits_source),
    .auto_bus_xing_in_d_bits_sink                                        (_subsystem_pbus_auto_bus_xing_in_d_bits_sink),
    .auto_bus_xing_in_d_bits_denied                                      (_subsystem_pbus_auto_bus_xing_in_d_bits_denied),
    .auto_bus_xing_in_d_bits_data                                        (_subsystem_pbus_auto_bus_xing_in_d_bits_data),
    .auto_bus_xing_in_d_bits_corrupt                                     (_subsystem_pbus_auto_bus_xing_in_d_bits_corrupt),
    .clock                                                               (_subsystem_pbus_clock),
    .reset                                                               (_subsystem_pbus_reset)
  );
  TLBuffer_2 subsystem_fbus_buffer (
    .clock                   (_clockNamePrefixer_auto_clock_name_prefixer_out_2_member_subsystem_fbus_0_clock),
    .reset                   (_clockNamePrefixer_auto_clock_name_prefixer_out_2_member_subsystem_fbus_0_reset),
    .auto_in_a_ready         (_subsystem_fbus_buffer_auto_in_a_ready),
    .auto_in_a_valid         (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_valid),
    .auto_in_a_bits_opcode   (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_opcode),
    .auto_in_a_bits_param    (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_param),
    .auto_in_a_bits_size     (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_size),
    .auto_in_a_bits_source   (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_source),
    .auto_in_a_bits_address  (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_address),
    .auto_in_a_bits_mask     (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_mask),
    .auto_in_a_bits_data     (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_data),
    .auto_in_a_bits_corrupt  (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_corrupt),
    .auto_in_d_ready         (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_d_ready),
    .auto_in_d_valid         (_subsystem_fbus_buffer_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_subsystem_fbus_buffer_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_subsystem_fbus_buffer_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_subsystem_fbus_buffer_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_subsystem_fbus_buffer_auto_in_d_bits_source),
    .auto_in_d_bits_sink     (_subsystem_fbus_buffer_auto_in_d_bits_sink),
    .auto_in_d_bits_denied   (_subsystem_fbus_buffer_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_subsystem_fbus_buffer_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_subsystem_fbus_buffer_auto_in_d_bits_corrupt),
    .auto_out_a_ready        (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_a_ready),
    .auto_out_a_valid        (_subsystem_fbus_buffer_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_subsystem_fbus_buffer_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_subsystem_fbus_buffer_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_subsystem_fbus_buffer_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_subsystem_fbus_buffer_auto_out_a_bits_source),
    .auto_out_a_bits_address (_subsystem_fbus_buffer_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_subsystem_fbus_buffer_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_subsystem_fbus_buffer_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_subsystem_fbus_buffer_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_subsystem_fbus_buffer_auto_out_d_ready),
    .auto_out_d_valid        (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_valid),
    .auto_out_d_bits_opcode  (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_opcode),
    .auto_out_d_bits_param   (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_param),
    .auto_out_d_bits_size    (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_size),
    .auto_out_d_bits_source  (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_source),
    .auto_out_d_bits_sink    (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_sink),
    .auto_out_d_bits_denied  (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_denied),
    .auto_out_d_bits_data    (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_data),
    .auto_out_d_bits_corrupt (_subsystem_sbus_auto_coupler_from_bus_named_subsystem_fbus_bus_xing_in_d_bits_corrupt)
  );
  TLInterconnectCoupler_6 subsystem_fbus_coupler_from_port_named_serial_tl_0_in (
    .clock                         (_clockNamePrefixer_auto_clock_name_prefixer_out_2_member_subsystem_fbus_0_clock),
    .reset                         (_clockNamePrefixer_auto_clock_name_prefixer_out_2_member_subsystem_fbus_0_reset),
    .auto_buffer_in_a_ready        (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_a_ready),
    .auto_buffer_in_a_valid        (_serial_tl_domain_auto_serdesser_client_out_a_valid),
    .auto_buffer_in_a_bits_opcode  (_serial_tl_domain_auto_serdesser_client_out_a_bits_opcode),
    .auto_buffer_in_a_bits_param   (_serial_tl_domain_auto_serdesser_client_out_a_bits_param),
    .auto_buffer_in_a_bits_size    (_serial_tl_domain_auto_serdesser_client_out_a_bits_size),
    .auto_buffer_in_a_bits_source  (_serial_tl_domain_auto_serdesser_client_out_a_bits_source),
    .auto_buffer_in_a_bits_address (_serial_tl_domain_auto_serdesser_client_out_a_bits_address),
    .auto_buffer_in_a_bits_mask    (_serial_tl_domain_auto_serdesser_client_out_a_bits_mask),
    .auto_buffer_in_a_bits_data    (_serial_tl_domain_auto_serdesser_client_out_a_bits_data),
    .auto_buffer_in_a_bits_corrupt (_serial_tl_domain_auto_serdesser_client_out_a_bits_corrupt),
    .auto_buffer_in_d_ready        (_serial_tl_domain_auto_serdesser_client_out_d_ready),
    .auto_buffer_in_d_valid        (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_valid),
    .auto_buffer_in_d_bits_opcode  (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_opcode),
    .auto_buffer_in_d_bits_param   (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_param),
    .auto_buffer_in_d_bits_size    (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_size),
    .auto_buffer_in_d_bits_source  (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_source),
    .auto_buffer_in_d_bits_sink    (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_sink),
    .auto_buffer_in_d_bits_denied  (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_denied),
    .auto_buffer_in_d_bits_data    (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_data),
    .auto_buffer_in_d_bits_corrupt (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_corrupt),
    .auto_tl_out_a_ready           (_subsystem_fbus_buffer_auto_in_a_ready),
    .auto_tl_out_a_valid           (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_valid),
    .auto_tl_out_a_bits_opcode     (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_opcode),
    .auto_tl_out_a_bits_param      (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_param),
    .auto_tl_out_a_bits_size       (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_size),
    .auto_tl_out_a_bits_source     (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_source),
    .auto_tl_out_a_bits_address    (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_address),
    .auto_tl_out_a_bits_mask       (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_mask),
    .auto_tl_out_a_bits_data       (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_data),
    .auto_tl_out_a_bits_corrupt    (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_a_bits_corrupt),
    .auto_tl_out_d_ready           (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_tl_out_d_ready),
    .auto_tl_out_d_valid           (_subsystem_fbus_buffer_auto_in_d_valid),
    .auto_tl_out_d_bits_opcode     (_subsystem_fbus_buffer_auto_in_d_bits_opcode),
    .auto_tl_out_d_bits_param      (_subsystem_fbus_buffer_auto_in_d_bits_param),
    .auto_tl_out_d_bits_size       (_subsystem_fbus_buffer_auto_in_d_bits_size),
    .auto_tl_out_d_bits_source     (_subsystem_fbus_buffer_auto_in_d_bits_source),
    .auto_tl_out_d_bits_sink       (_subsystem_fbus_buffer_auto_in_d_bits_sink),
    .auto_tl_out_d_bits_denied     (_subsystem_fbus_buffer_auto_in_d_bits_denied),
    .auto_tl_out_d_bits_data       (_subsystem_fbus_buffer_auto_in_d_bits_data),
    .auto_tl_out_d_bits_corrupt    (_subsystem_fbus_buffer_auto_in_d_bits_corrupt)
  );
  PeripheryBus_1 subsystem_cbus (
    .auto_coupler_to_prci_ctrl_fixer_out_a_ready                          (_prci_ctrl_domain_auto_xbar_in_a_ready),
    .auto_coupler_to_prci_ctrl_fixer_out_a_valid                          (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_valid),
    .auto_coupler_to_prci_ctrl_fixer_out_a_bits_opcode                    (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_opcode),
    .auto_coupler_to_prci_ctrl_fixer_out_a_bits_param                     (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_param),
    .auto_coupler_to_prci_ctrl_fixer_out_a_bits_size                      (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_size),
    .auto_coupler_to_prci_ctrl_fixer_out_a_bits_source                    (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_source),
    .auto_coupler_to_prci_ctrl_fixer_out_a_bits_address                   (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_address),
    .auto_coupler_to_prci_ctrl_fixer_out_a_bits_mask                      (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_mask),
    .auto_coupler_to_prci_ctrl_fixer_out_a_bits_data                      (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_data),
    .auto_coupler_to_prci_ctrl_fixer_out_a_bits_corrupt                   (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_corrupt),
    .auto_coupler_to_prci_ctrl_fixer_out_d_ready                          (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_d_ready),
    .auto_coupler_to_prci_ctrl_fixer_out_d_valid                          (_prci_ctrl_domain_auto_xbar_in_d_valid),
    .auto_coupler_to_prci_ctrl_fixer_out_d_bits_opcode                    (_prci_ctrl_domain_auto_xbar_in_d_bits_opcode),
    .auto_coupler_to_prci_ctrl_fixer_out_d_bits_size                      (_prci_ctrl_domain_auto_xbar_in_d_bits_size),
    .auto_coupler_to_prci_ctrl_fixer_out_d_bits_source                    (_prci_ctrl_domain_auto_xbar_in_d_bits_source),
    .auto_coupler_to_prci_ctrl_fixer_out_d_bits_data                      (_prci_ctrl_domain_auto_xbar_in_d_bits_data),
    .auto_coupler_to_bootrom_fragmenter_out_a_ready                       (_bootROMDomainWrapper_auto_bootrom_in_a_ready),
    .auto_coupler_to_bootrom_fragmenter_out_a_valid                       (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode                 (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_param                  (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_size                   (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_source                 (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_address                (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_mask                   (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask),
    .auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt                (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_bootrom_fragmenter_out_d_ready                       (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready),
    .auto_coupler_to_bootrom_fragmenter_out_d_valid                       (_bootROMDomainWrapper_auto_bootrom_in_d_valid),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_size                   (_bootROMDomainWrapper_auto_bootrom_in_d_bits_size),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_source                 (_bootROMDomainWrapper_auto_bootrom_in_d_bits_source),
    .auto_coupler_to_bootrom_fragmenter_out_d_bits_data                   (_bootROMDomainWrapper_auto_bootrom_in_d_bits_data),
    .auto_coupler_to_debug_fragmenter_out_a_ready                         (_tlDM_auto_dmInner_dmInner_tl_in_a_ready),
    .auto_coupler_to_debug_fragmenter_out_a_valid                         (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_valid),
    .auto_coupler_to_debug_fragmenter_out_a_bits_opcode                   (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_debug_fragmenter_out_a_bits_param                    (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param),
    .auto_coupler_to_debug_fragmenter_out_a_bits_size                     (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size),
    .auto_coupler_to_debug_fragmenter_out_a_bits_source                   (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source),
    .auto_coupler_to_debug_fragmenter_out_a_bits_address                  (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address),
    .auto_coupler_to_debug_fragmenter_out_a_bits_mask                     (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask),
    .auto_coupler_to_debug_fragmenter_out_a_bits_data                     (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data),
    .auto_coupler_to_debug_fragmenter_out_a_bits_corrupt                  (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_debug_fragmenter_out_d_ready                         (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_ready),
    .auto_coupler_to_debug_fragmenter_out_d_valid                         (_tlDM_auto_dmInner_dmInner_tl_in_d_valid),
    .auto_coupler_to_debug_fragmenter_out_d_bits_opcode                   (_tlDM_auto_dmInner_dmInner_tl_in_d_bits_opcode),
    .auto_coupler_to_debug_fragmenter_out_d_bits_size                     (_tlDM_auto_dmInner_dmInner_tl_in_d_bits_size),
    .auto_coupler_to_debug_fragmenter_out_d_bits_source                   (_tlDM_auto_dmInner_dmInner_tl_in_d_bits_source),
    .auto_coupler_to_debug_fragmenter_out_d_bits_data                     (_tlDM_auto_dmInner_dmInner_tl_in_d_bits_data),
    .auto_coupler_to_clint_fragmenter_out_a_ready                         (_clint_auto_in_a_ready),
    .auto_coupler_to_clint_fragmenter_out_a_valid                         (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_valid),
    .auto_coupler_to_clint_fragmenter_out_a_bits_opcode                   (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_clint_fragmenter_out_a_bits_param                    (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param),
    .auto_coupler_to_clint_fragmenter_out_a_bits_size                     (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size),
    .auto_coupler_to_clint_fragmenter_out_a_bits_source                   (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source),
    .auto_coupler_to_clint_fragmenter_out_a_bits_address                  (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address),
    .auto_coupler_to_clint_fragmenter_out_a_bits_mask                     (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask),
    .auto_coupler_to_clint_fragmenter_out_a_bits_data                     (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data),
    .auto_coupler_to_clint_fragmenter_out_a_bits_corrupt                  (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_clint_fragmenter_out_d_ready                         (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_ready),
    .auto_coupler_to_clint_fragmenter_out_d_valid                         (_clint_auto_in_d_valid),
    .auto_coupler_to_clint_fragmenter_out_d_bits_opcode                   (_clint_auto_in_d_bits_opcode),
    .auto_coupler_to_clint_fragmenter_out_d_bits_size                     (_clint_auto_in_d_bits_size),
    .auto_coupler_to_clint_fragmenter_out_d_bits_source                   (_clint_auto_in_d_bits_source),
    .auto_coupler_to_clint_fragmenter_out_d_bits_data                     (_clint_auto_in_d_bits_data),
    .auto_coupler_to_plic_fragmenter_out_a_ready                          (_plicDomainWrapper_auto_plic_in_a_ready),
    .auto_coupler_to_plic_fragmenter_out_a_valid                          (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_valid),
    .auto_coupler_to_plic_fragmenter_out_a_bits_opcode                    (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode),
    .auto_coupler_to_plic_fragmenter_out_a_bits_param                     (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param),
    .auto_coupler_to_plic_fragmenter_out_a_bits_size                      (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size),
    .auto_coupler_to_plic_fragmenter_out_a_bits_source                    (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source),
    .auto_coupler_to_plic_fragmenter_out_a_bits_address                   (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address),
    .auto_coupler_to_plic_fragmenter_out_a_bits_mask                      (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask),
    .auto_coupler_to_plic_fragmenter_out_a_bits_data                      (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data),
    .auto_coupler_to_plic_fragmenter_out_a_bits_corrupt                   (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt),
    .auto_coupler_to_plic_fragmenter_out_d_ready                          (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_ready),
    .auto_coupler_to_plic_fragmenter_out_d_valid                          (_plicDomainWrapper_auto_plic_in_d_valid),
    .auto_coupler_to_plic_fragmenter_out_d_bits_opcode                    (_plicDomainWrapper_auto_plic_in_d_bits_opcode),
    .auto_coupler_to_plic_fragmenter_out_d_bits_size                      (_plicDomainWrapper_auto_plic_in_d_bits_size),
    .auto_coupler_to_plic_fragmenter_out_d_bits_source                    (_plicDomainWrapper_auto_plic_in_d_bits_source),
    .auto_coupler_to_plic_fragmenter_out_d_bits_data                      (_plicDomainWrapper_auto_plic_in_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_ready        (_subsystem_pbus_auto_bus_xing_in_a_ready),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid        (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_valid),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_opcode  (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_param   (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_param),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_size    (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_size),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_source  (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_source),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_address (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_address),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_mask    (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_mask),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_data    (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_data),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_corrupt (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_a_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready        (_subsystem_cbus_auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_ready),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_valid        (_subsystem_pbus_auto_bus_xing_in_d_valid),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_opcode  (_subsystem_pbus_auto_bus_xing_in_d_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_param   (_subsystem_pbus_auto_bus_xing_in_d_bits_param),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_size    (_subsystem_pbus_auto_bus_xing_in_d_bits_size),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_source  (_subsystem_pbus_auto_bus_xing_in_d_bits_source),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_sink    (_subsystem_pbus_auto_bus_xing_in_d_bits_sink),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_denied  (_subsystem_pbus_auto_bus_xing_in_d_bits_denied),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_data    (_subsystem_pbus_auto_bus_xing_in_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_pbus_bus_xing_out_d_bits_corrupt (_subsystem_pbus_auto_bus_xing_in_d_bits_corrupt),
    .auto_coupler_to_l2_ctrl_buffer_out_a_ready                           (_subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_a_ready),
    .auto_coupler_to_l2_ctrl_buffer_out_a_valid                           (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_valid),
    .auto_coupler_to_l2_ctrl_buffer_out_a_bits_opcode                     (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_opcode),
    .auto_coupler_to_l2_ctrl_buffer_out_a_bits_param                      (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_param),
    .auto_coupler_to_l2_ctrl_buffer_out_a_bits_size                       (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_size),
    .auto_coupler_to_l2_ctrl_buffer_out_a_bits_source                     (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_source),
    .auto_coupler_to_l2_ctrl_buffer_out_a_bits_address                    (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_address),
    .auto_coupler_to_l2_ctrl_buffer_out_a_bits_mask                       (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_mask),
    .auto_coupler_to_l2_ctrl_buffer_out_a_bits_data                       (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_data),
    .auto_coupler_to_l2_ctrl_buffer_out_a_bits_corrupt                    (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_corrupt),
    .auto_coupler_to_l2_ctrl_buffer_out_d_ready                           (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_d_ready),
    .auto_coupler_to_l2_ctrl_buffer_out_d_valid                           (_subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_valid),
    .auto_coupler_to_l2_ctrl_buffer_out_d_bits_opcode                     (_subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_bits_opcode),
    .auto_coupler_to_l2_ctrl_buffer_out_d_bits_size                       (_subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_bits_size),
    .auto_coupler_to_l2_ctrl_buffer_out_d_bits_source                     (_subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_bits_source),
    .auto_coupler_to_l2_ctrl_buffer_out_d_bits_data                       (_subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_bits_data),
    .auto_fixedClockNode_out_4_clock                                      (auto_subsystem_cbus_fixedClockNode_out_clock),
    .auto_fixedClockNode_out_4_reset                                      (auto_subsystem_cbus_fixedClockNode_out_reset),
    .auto_fixedClockNode_out_3_clock                                      (_subsystem_cbus_auto_fixedClockNode_out_3_clock),
    .auto_fixedClockNode_out_3_reset                                      (_subsystem_cbus_auto_fixedClockNode_out_3_reset),
    .auto_fixedClockNode_out_2_clock                                      (_subsystem_cbus_auto_fixedClockNode_out_2_clock),
    .auto_fixedClockNode_out_2_reset                                      (_subsystem_cbus_auto_fixedClockNode_out_2_reset),
    .auto_fixedClockNode_out_0_clock                                      (_subsystem_cbus_auto_fixedClockNode_out_0_clock),
    .auto_fixedClockNode_out_0_reset                                      (_subsystem_cbus_auto_fixedClockNode_out_0_reset),
    .auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_clock    (_clockNamePrefixer_auto_clock_name_prefixer_out_4_member_subsystem_cbus_0_clock),
    .auto_subsystem_cbus_clock_groups_in_member_subsystem_cbus_0_reset    (_clockNamePrefixer_auto_clock_name_prefixer_out_4_member_subsystem_cbus_0_reset),
    .auto_bus_xing_in_a_ready                                             (_subsystem_cbus_auto_bus_xing_in_a_ready),
    .auto_bus_xing_in_a_valid                                             (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_valid),
    .auto_bus_xing_in_a_bits_opcode                                       (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_opcode),
    .auto_bus_xing_in_a_bits_param                                        (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_param),
    .auto_bus_xing_in_a_bits_size                                         (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_size),
    .auto_bus_xing_in_a_bits_source                                       (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_source),
    .auto_bus_xing_in_a_bits_address                                      (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_address),
    .auto_bus_xing_in_a_bits_mask                                         (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_mask),
    .auto_bus_xing_in_a_bits_data                                         (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_data),
    .auto_bus_xing_in_a_bits_corrupt                                      (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_a_bits_corrupt),
    .auto_bus_xing_in_d_ready                                             (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_cbus_bus_xing_out_d_ready),
    .auto_bus_xing_in_d_valid                                             (_subsystem_cbus_auto_bus_xing_in_d_valid),
    .auto_bus_xing_in_d_bits_opcode                                       (_subsystem_cbus_auto_bus_xing_in_d_bits_opcode),
    .auto_bus_xing_in_d_bits_param                                        (_subsystem_cbus_auto_bus_xing_in_d_bits_param),
    .auto_bus_xing_in_d_bits_size                                         (_subsystem_cbus_auto_bus_xing_in_d_bits_size),
    .auto_bus_xing_in_d_bits_source                                       (_subsystem_cbus_auto_bus_xing_in_d_bits_source),
    .auto_bus_xing_in_d_bits_sink                                         (_subsystem_cbus_auto_bus_xing_in_d_bits_sink),
    .auto_bus_xing_in_d_bits_denied                                       (_subsystem_cbus_auto_bus_xing_in_d_bits_denied),
    .auto_bus_xing_in_d_bits_data                                         (_subsystem_cbus_auto_bus_xing_in_d_bits_data),
    .auto_bus_xing_in_d_bits_corrupt                                      (_subsystem_cbus_auto_bus_xing_in_d_bits_corrupt),
    .custom_boot                                                          (custom_boot),
    .clock                                                                (_subsystem_cbus_clock),
    .reset                                                                (_subsystem_cbus_reset)
  );
  MemoryBus subsystem_mbus (
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_ready        (_bank_auto_xbar_in_a_ready),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_valid        (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_valid),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_opcode  (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_opcode),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_param   (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_param),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_size    (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_size),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_source  (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_source),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_address (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_address),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_mask    (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_mask),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_data    (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_data),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_corrupt (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_corrupt),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_ready        (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_ready),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_valid        (_bank_auto_xbar_in_d_valid),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_bits_opcode  (_bank_auto_xbar_in_d_bits_opcode),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_bits_size    (_bank_auto_xbar_in_d_bits_size),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_bits_source  (_bank_auto_xbar_in_d_bits_source),
    .auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_bits_data    (_bank_auto_xbar_in_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_a_ready          (_subsystem_obus_auto_fixer_in_a_ready),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_a_valid          (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_valid),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_opcode    (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_param     (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_param),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_size      (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_size),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_source    (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_source),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_address   (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_address),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_mask      (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_mask),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_data      (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_data),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_corrupt   (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_d_ready          (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_d_ready),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_d_valid          (_subsystem_obus_auto_fixer_in_d_valid),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_opcode    (_subsystem_obus_auto_fixer_in_d_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_param     (_subsystem_obus_auto_fixer_in_d_bits_param),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_size      (_subsystem_obus_auto_fixer_in_d_bits_size),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_source    (_subsystem_obus_auto_fixer_in_d_bits_source),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_sink      (_subsystem_obus_auto_fixer_in_d_bits_sink),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_denied    (_subsystem_obus_auto_fixer_in_d_bits_denied),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_data      (_subsystem_obus_auto_fixer_in_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_obus_widget_out_d_bits_corrupt   (_subsystem_obus_auto_fixer_in_d_bits_corrupt),
    .auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_1_clock    (_clockNamePrefixer_auto_clock_name_prefixer_out_3_member_subsystem_mbus_1_clock),
    .auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_1_reset    (_clockNamePrefixer_auto_clock_name_prefixer_out_3_member_subsystem_mbus_1_reset),
    .auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_clock    (_clockNamePrefixer_auto_clock_name_prefixer_out_3_member_subsystem_mbus_0_clock),
    .auto_subsystem_mbus_clock_groups_in_member_subsystem_mbus_0_reset    (_clockNamePrefixer_auto_clock_name_prefixer_out_3_member_subsystem_mbus_0_reset),
    .auto_subsystem_mbus_clock_groups_out_member_subsystem_obus_0_clock   (_subsystem_mbus_auto_subsystem_mbus_clock_groups_out_member_subsystem_obus_0_clock),
    .auto_subsystem_mbus_clock_groups_out_member_subsystem_obus_0_reset   (_subsystem_mbus_auto_subsystem_mbus_clock_groups_out_member_subsystem_obus_0_reset),
    .auto_bus_xing_in_a_ready                                             (_subsystem_mbus_auto_bus_xing_in_a_ready),
    .auto_bus_xing_in_a_valid                                             (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid),
    .auto_bus_xing_in_a_bits_opcode                                       (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode),
    .auto_bus_xing_in_a_bits_param                                        (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param),
    .auto_bus_xing_in_a_bits_size                                         (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size),
    .auto_bus_xing_in_a_bits_source                                       (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source),
    .auto_bus_xing_in_a_bits_address                                      (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address),
    .auto_bus_xing_in_a_bits_mask                                         (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask),
    .auto_bus_xing_in_a_bits_data                                         (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data),
    .auto_bus_xing_in_a_bits_corrupt                                      (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_corrupt),
    .auto_bus_xing_in_d_ready                                             (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready),
    .auto_bus_xing_in_d_valid                                             (_subsystem_mbus_auto_bus_xing_in_d_valid),
    .auto_bus_xing_in_d_bits_opcode                                       (_subsystem_mbus_auto_bus_xing_in_d_bits_opcode),
    .auto_bus_xing_in_d_bits_param                                        (_subsystem_mbus_auto_bus_xing_in_d_bits_param),
    .auto_bus_xing_in_d_bits_size                                         (_subsystem_mbus_auto_bus_xing_in_d_bits_size),
    .auto_bus_xing_in_d_bits_source                                       (_subsystem_mbus_auto_bus_xing_in_d_bits_source),
    .auto_bus_xing_in_d_bits_sink                                         (_subsystem_mbus_auto_bus_xing_in_d_bits_sink),
    .auto_bus_xing_in_d_bits_denied                                       (_subsystem_mbus_auto_bus_xing_in_d_bits_denied),
    .auto_bus_xing_in_d_bits_data                                         (_subsystem_mbus_auto_bus_xing_in_d_bits_data),
    .auto_bus_xing_in_d_bits_corrupt                                      (_subsystem_mbus_auto_bus_xing_in_d_bits_corrupt)
  );
  CoherenceManagerWrapper subsystem_l2_wrapper (
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_ready        (_subsystem_mbus_auto_bus_xing_in_a_ready),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid        (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_valid),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode  (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param   (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_param),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size    (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_size),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source  (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_source),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_address),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask    (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_mask),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data    (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_data),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_corrupt (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_a_bits_corrupt),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready        (_subsystem_l2_wrapper_auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_ready),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_valid        (_subsystem_mbus_auto_bus_xing_in_d_valid),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_opcode  (_subsystem_mbus_auto_bus_xing_in_d_bits_opcode),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_param   (_subsystem_mbus_auto_bus_xing_in_d_bits_param),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_size    (_subsystem_mbus_auto_bus_xing_in_d_bits_size),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_source  (_subsystem_mbus_auto_bus_xing_in_d_bits_source),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_sink    (_subsystem_mbus_auto_bus_xing_in_d_bits_sink),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_denied  (_subsystem_mbus_auto_bus_xing_in_d_bits_denied),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_data    (_subsystem_mbus_auto_bus_xing_in_d_bits_data),
    .auto_coupler_to_bus_named_subsystem_mbus_bus_xing_out_d_bits_corrupt (_subsystem_mbus_auto_bus_xing_in_d_bits_corrupt),
    .auto_coherent_jbar_in_a_ready                                        (_subsystem_l2_wrapper_auto_coherent_jbar_in_a_ready),
    .auto_coherent_jbar_in_a_valid                                        (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_valid),
    .auto_coherent_jbar_in_a_bits_opcode                                  (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_opcode),
    .auto_coherent_jbar_in_a_bits_param                                   (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_param),
    .auto_coherent_jbar_in_a_bits_size                                    (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_size),
    .auto_coherent_jbar_in_a_bits_source                                  (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_source),
    .auto_coherent_jbar_in_a_bits_address                                 (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_address),
    .auto_coherent_jbar_in_a_bits_mask                                    (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_mask),
    .auto_coherent_jbar_in_a_bits_data                                    (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_data),
    .auto_coherent_jbar_in_a_bits_corrupt                                 (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_a_bits_corrupt),
    .auto_coherent_jbar_in_b_ready                                        (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_b_ready),
    .auto_coherent_jbar_in_b_valid                                        (_subsystem_l2_wrapper_auto_coherent_jbar_in_b_valid),
    .auto_coherent_jbar_in_b_bits_param                                   (_subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_param),
    .auto_coherent_jbar_in_b_bits_address                                 (_subsystem_l2_wrapper_auto_coherent_jbar_in_b_bits_address),
    .auto_coherent_jbar_in_c_ready                                        (_subsystem_l2_wrapper_auto_coherent_jbar_in_c_ready),
    .auto_coherent_jbar_in_c_valid                                        (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_valid),
    .auto_coherent_jbar_in_c_bits_opcode                                  (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_opcode),
    .auto_coherent_jbar_in_c_bits_param                                   (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_param),
    .auto_coherent_jbar_in_c_bits_size                                    (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_size),
    .auto_coherent_jbar_in_c_bits_source                                  (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_source),
    .auto_coherent_jbar_in_c_bits_address                                 (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_address),
    .auto_coherent_jbar_in_c_bits_data                                    (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_data),
    .auto_coherent_jbar_in_c_bits_corrupt                                 (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_c_bits_corrupt),
    .auto_coherent_jbar_in_d_ready                                        (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_d_ready),
    .auto_coherent_jbar_in_d_valid                                        (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_valid),
    .auto_coherent_jbar_in_d_bits_opcode                                  (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_opcode),
    .auto_coherent_jbar_in_d_bits_param                                   (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_param),
    .auto_coherent_jbar_in_d_bits_size                                    (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_size),
    .auto_coherent_jbar_in_d_bits_source                                  (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_source),
    .auto_coherent_jbar_in_d_bits_sink                                    (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_sink),
    .auto_coherent_jbar_in_d_bits_denied                                  (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_denied),
    .auto_coherent_jbar_in_d_bits_data                                    (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_data),
    .auto_coherent_jbar_in_d_bits_corrupt                                 (_subsystem_l2_wrapper_auto_coherent_jbar_in_d_bits_corrupt),
    .auto_coherent_jbar_in_e_valid                                        (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_valid),
    .auto_coherent_jbar_in_e_bits_sink                                    (_subsystem_sbus_auto_coupler_to_bus_named_subsystem_l2_widget_out_e_bits_sink),
    .auto_l2_ctrls_ctrl_in_a_ready                                        (_subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_a_ready),
    .auto_l2_ctrls_ctrl_in_a_valid                                        (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_valid),
    .auto_l2_ctrls_ctrl_in_a_bits_opcode                                  (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_opcode),
    .auto_l2_ctrls_ctrl_in_a_bits_param                                   (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_param),
    .auto_l2_ctrls_ctrl_in_a_bits_size                                    (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_size),
    .auto_l2_ctrls_ctrl_in_a_bits_source                                  (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_source),
    .auto_l2_ctrls_ctrl_in_a_bits_address                                 (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_address),
    .auto_l2_ctrls_ctrl_in_a_bits_mask                                    (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_mask),
    .auto_l2_ctrls_ctrl_in_a_bits_data                                    (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_data),
    .auto_l2_ctrls_ctrl_in_a_bits_corrupt                                 (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_a_bits_corrupt),
    .auto_l2_ctrls_ctrl_in_d_ready                                        (_subsystem_cbus_auto_coupler_to_l2_ctrl_buffer_out_d_ready),
    .auto_l2_ctrls_ctrl_in_d_valid                                        (_subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_valid),
    .auto_l2_ctrls_ctrl_in_d_bits_opcode                                  (_subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_bits_opcode),
    .auto_l2_ctrls_ctrl_in_d_bits_size                                    (_subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_bits_size),
    .auto_l2_ctrls_ctrl_in_d_bits_source                                  (_subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_bits_source),
    .auto_l2_ctrls_ctrl_in_d_bits_data                                    (_subsystem_l2_wrapper_auto_l2_ctrls_ctrl_in_d_bits_data),
    .auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_clock        (_subsystem_sbus_auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_clock),
    .auto_subsystem_l2_clock_groups_in_member_subsystem_l2_0_reset        (_subsystem_sbus_auto_subsystem_sbus_clock_groups_out_member_subsystem_l2_0_reset)
  );
  SystemBus_1 subsystem_obus (
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_ready        (_serial_tl_domain_auto_serdesser_manager_in_a_ready),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_valid        (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_valid),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_opcode  (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_opcode),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_param   (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_param),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_size    (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_size),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_source  (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_source),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_address (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_address),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_mask    (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_mask),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_data    (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_data),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_corrupt (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_corrupt),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_ready        (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_ready),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_valid        (_serial_tl_domain_auto_serdesser_manager_in_d_valid),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_opcode  (_serial_tl_domain_auto_serdesser_manager_in_d_bits_opcode),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_param   (_serial_tl_domain_auto_serdesser_manager_in_d_bits_param),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_size    (_serial_tl_domain_auto_serdesser_manager_in_d_bits_size),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_source  (_serial_tl_domain_auto_serdesser_manager_in_d_bits_source),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_sink    (_serial_tl_domain_auto_serdesser_manager_in_d_bits_sink),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_denied  (_serial_tl_domain_auto_serdesser_manager_in_d_bits_denied),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_data    (_serial_tl_domain_auto_serdesser_manager_in_d_bits_data),
    .auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_bits_corrupt (_serial_tl_domain_auto_serdesser_manager_in_d_bits_corrupt),
    .auto_fixer_in_a_ready                                                  (_subsystem_obus_auto_fixer_in_a_ready),
    .auto_fixer_in_a_valid                                                  (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_valid),
    .auto_fixer_in_a_bits_opcode                                            (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_opcode),
    .auto_fixer_in_a_bits_param                                             (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_param),
    .auto_fixer_in_a_bits_size                                              (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_size),
    .auto_fixer_in_a_bits_source                                            (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_source),
    .auto_fixer_in_a_bits_address                                           (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_address),
    .auto_fixer_in_a_bits_mask                                              (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_mask),
    .auto_fixer_in_a_bits_data                                              (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_data),
    .auto_fixer_in_a_bits_corrupt                                           (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_a_bits_corrupt),
    .auto_fixer_in_d_ready                                                  (_subsystem_mbus_auto_coupler_to_bus_named_subsystem_obus_widget_out_d_ready),
    .auto_fixer_in_d_valid                                                  (_subsystem_obus_auto_fixer_in_d_valid),
    .auto_fixer_in_d_bits_opcode                                            (_subsystem_obus_auto_fixer_in_d_bits_opcode),
    .auto_fixer_in_d_bits_param                                             (_subsystem_obus_auto_fixer_in_d_bits_param),
    .auto_fixer_in_d_bits_size                                              (_subsystem_obus_auto_fixer_in_d_bits_size),
    .auto_fixer_in_d_bits_source                                            (_subsystem_obus_auto_fixer_in_d_bits_source),
    .auto_fixer_in_d_bits_sink                                              (_subsystem_obus_auto_fixer_in_d_bits_sink),
    .auto_fixer_in_d_bits_denied                                            (_subsystem_obus_auto_fixer_in_d_bits_denied),
    .auto_fixer_in_d_bits_data                                              (_subsystem_obus_auto_fixer_in_d_bits_data),
    .auto_fixer_in_d_bits_corrupt                                           (_subsystem_obus_auto_fixer_in_d_bits_corrupt),
    .auto_fixedClockNode_out_clock                                          (_subsystem_obus_auto_fixedClockNode_out_clock),
    .auto_fixedClockNode_out_reset                                          (_subsystem_obus_auto_fixedClockNode_out_reset),
    .auto_subsystem_obus_clock_groups_in_member_subsystem_obus_0_clock      (_subsystem_mbus_auto_subsystem_mbus_clock_groups_out_member_subsystem_obus_0_clock),
    .auto_subsystem_obus_clock_groups_in_member_subsystem_obus_0_reset      (_subsystem_mbus_auto_subsystem_mbus_clock_groups_out_member_subsystem_obus_0_reset)
  );
  TilePRCIDomain tile_prci_domain (
    .auto_intsink_in_sync_0                       (_tlDM_auto_dmOuter_intsource_out_sync_0),
    .auto_tile_reset_domain_boom_tile_hartid_in   (_tileHartIdNexusNode_auto_out),
    .auto_int_in_clock_xing_in_2_sync_0           (_intsource_2_auto_out_sync_0),
    .auto_int_in_clock_xing_in_1_sync_0           (_intsource_1_auto_out_sync_0),
    .auto_int_in_clock_xing_in_0_sync_0           (_intsource_auto_out_sync_0),
    .auto_int_in_clock_xing_in_0_sync_1           (_intsource_auto_out_sync_1),
    .auto_tl_master_clock_xing_out_a_ready        (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_a_ready),
    .auto_tl_master_clock_xing_out_a_valid        (_tile_prci_domain_auto_tl_master_clock_xing_out_a_valid),
    .auto_tl_master_clock_xing_out_a_bits_opcode  (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_opcode),
    .auto_tl_master_clock_xing_out_a_bits_param   (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_param),
    .auto_tl_master_clock_xing_out_a_bits_size    (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_size),
    .auto_tl_master_clock_xing_out_a_bits_source  (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_source),
    .auto_tl_master_clock_xing_out_a_bits_address (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_address),
    .auto_tl_master_clock_xing_out_a_bits_mask    (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_mask),
    .auto_tl_master_clock_xing_out_a_bits_data    (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_data),
    .auto_tl_master_clock_xing_out_a_bits_corrupt (_tile_prci_domain_auto_tl_master_clock_xing_out_a_bits_corrupt),
    .auto_tl_master_clock_xing_out_b_ready        (_tile_prci_domain_auto_tl_master_clock_xing_out_b_ready),
    .auto_tl_master_clock_xing_out_b_valid        (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_valid),
    .auto_tl_master_clock_xing_out_b_bits_param   (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_param),
    .auto_tl_master_clock_xing_out_b_bits_address (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_b_bits_address),
    .auto_tl_master_clock_xing_out_c_ready        (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_c_ready),
    .auto_tl_master_clock_xing_out_c_valid        (_tile_prci_domain_auto_tl_master_clock_xing_out_c_valid),
    .auto_tl_master_clock_xing_out_c_bits_opcode  (_tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_opcode),
    .auto_tl_master_clock_xing_out_c_bits_param   (_tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_param),
    .auto_tl_master_clock_xing_out_c_bits_size    (_tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_size),
    .auto_tl_master_clock_xing_out_c_bits_source  (_tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_source),
    .auto_tl_master_clock_xing_out_c_bits_address (_tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_address),
    .auto_tl_master_clock_xing_out_c_bits_data    (_tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_data),
    .auto_tl_master_clock_xing_out_c_bits_corrupt (_tile_prci_domain_auto_tl_master_clock_xing_out_c_bits_corrupt),
    .auto_tl_master_clock_xing_out_d_ready        (_tile_prci_domain_auto_tl_master_clock_xing_out_d_ready),
    .auto_tl_master_clock_xing_out_d_valid        (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_valid),
    .auto_tl_master_clock_xing_out_d_bits_opcode  (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_opcode),
    .auto_tl_master_clock_xing_out_d_bits_param   (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_param),
    .auto_tl_master_clock_xing_out_d_bits_size    (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_size),
    .auto_tl_master_clock_xing_out_d_bits_source  (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_source),
    .auto_tl_master_clock_xing_out_d_bits_sink    (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_sink),
    .auto_tl_master_clock_xing_out_d_bits_denied  (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_denied),
    .auto_tl_master_clock_xing_out_d_bits_data    (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_data),
    .auto_tl_master_clock_xing_out_d_bits_corrupt (_subsystem_sbus_auto_coupler_from_boom_tile_tl_master_clock_xing_in_d_bits_corrupt),
    .auto_tl_master_clock_xing_out_e_valid        (_tile_prci_domain_auto_tl_master_clock_xing_out_e_valid),
    .auto_tl_master_clock_xing_out_e_bits_sink    (_tile_prci_domain_auto_tl_master_clock_xing_out_e_bits_sink),
    .auto_tap_clock_in_clock                      (_subsystem_sbus_auto_fixedClockNode_out_1_clock),
    .auto_tap_clock_in_reset                      (_subsystem_sbus_auto_fixedClockNode_out_1_reset)
  );
  ClockSinkDomain plicDomainWrapper (
    .auto_plic_int_in_0          (_ibus_int_bus_auto_int_out_0),
    .auto_plic_int_out_1_0       (_plicDomainWrapper_auto_plic_int_out_1_0),
    .auto_plic_int_out_0_0       (_plicDomainWrapper_auto_plic_int_out_0_0),
    .auto_plic_in_a_ready        (_plicDomainWrapper_auto_plic_in_a_ready),
    .auto_plic_in_a_valid        (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_valid),
    .auto_plic_in_a_bits_opcode  (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_opcode),
    .auto_plic_in_a_bits_param   (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_param),
    .auto_plic_in_a_bits_size    (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_size),
    .auto_plic_in_a_bits_source  (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_source),
    .auto_plic_in_a_bits_address (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_address),
    .auto_plic_in_a_bits_mask    (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_mask),
    .auto_plic_in_a_bits_data    (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_data),
    .auto_plic_in_a_bits_corrupt (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_a_bits_corrupt),
    .auto_plic_in_d_ready        (_subsystem_cbus_auto_coupler_to_plic_fragmenter_out_d_ready),
    .auto_plic_in_d_valid        (_plicDomainWrapper_auto_plic_in_d_valid),
    .auto_plic_in_d_bits_opcode  (_plicDomainWrapper_auto_plic_in_d_bits_opcode),
    .auto_plic_in_d_bits_size    (_plicDomainWrapper_auto_plic_in_d_bits_size),
    .auto_plic_in_d_bits_source  (_plicDomainWrapper_auto_plic_in_d_bits_source),
    .auto_plic_in_d_bits_data    (_plicDomainWrapper_auto_plic_in_d_bits_data),
    .auto_clock_in_clock         (_subsystem_cbus_auto_fixedClockNode_out_0_clock),
    .auto_clock_in_reset         (_subsystem_cbus_auto_fixedClockNode_out_0_reset)
  );
  CLINT clint (
    .clock                  (_subsystem_cbus_clock),
    .reset                  (_subsystem_cbus_reset),
    .auto_int_out_0         (_clint_auto_int_out_0),
    .auto_int_out_1         (_clint_auto_int_out_1),
    .auto_in_a_ready        (_clint_auto_in_a_ready),
    .auto_in_a_valid        (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_valid),
    .auto_in_a_bits_opcode  (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_opcode),
    .auto_in_a_bits_param   (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_param),
    .auto_in_a_bits_size    (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_size),
    .auto_in_a_bits_source  (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_source),
    .auto_in_a_bits_address (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_address),
    .auto_in_a_bits_mask    (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_mask),
    .auto_in_a_bits_data    (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_data),
    .auto_in_a_bits_corrupt (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_a_bits_corrupt),
    .auto_in_d_ready        (_subsystem_cbus_auto_coupler_to_clint_fragmenter_out_d_ready),
    .auto_in_d_valid        (_clint_auto_in_d_valid),
    .auto_in_d_bits_opcode  (_clint_auto_in_d_bits_opcode),
    .auto_in_d_bits_size    (_clint_auto_in_d_bits_size),
    .auto_in_d_bits_source  (_clint_auto_in_d_bits_source),
    .auto_in_d_bits_data    (_clint_auto_in_d_bits_data),
    .io_rtcTick             (int_rtc_tick)
  );
  BundleBridgeNexus_16 tileHartIdNexusNode (
    .auto_out (_tileHartIdNexusNode_auto_out)
  );
  TLDebugModule tlDM (
    .auto_dmInner_dmInner_tl_in_a_ready        (_tlDM_auto_dmInner_dmInner_tl_in_a_ready),
    .auto_dmInner_dmInner_tl_in_a_valid        (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_valid),
    .auto_dmInner_dmInner_tl_in_a_bits_opcode  (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_opcode),
    .auto_dmInner_dmInner_tl_in_a_bits_param   (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_param),
    .auto_dmInner_dmInner_tl_in_a_bits_size    (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_size),
    .auto_dmInner_dmInner_tl_in_a_bits_source  (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_source),
    .auto_dmInner_dmInner_tl_in_a_bits_address (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_address),
    .auto_dmInner_dmInner_tl_in_a_bits_mask    (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_mask),
    .auto_dmInner_dmInner_tl_in_a_bits_data    (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_data),
    .auto_dmInner_dmInner_tl_in_a_bits_corrupt (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_a_bits_corrupt),
    .auto_dmInner_dmInner_tl_in_d_ready        (_subsystem_cbus_auto_coupler_to_debug_fragmenter_out_d_ready),
    .auto_dmInner_dmInner_tl_in_d_valid        (_tlDM_auto_dmInner_dmInner_tl_in_d_valid),
    .auto_dmInner_dmInner_tl_in_d_bits_opcode  (_tlDM_auto_dmInner_dmInner_tl_in_d_bits_opcode),
    .auto_dmInner_dmInner_tl_in_d_bits_size    (_tlDM_auto_dmInner_dmInner_tl_in_d_bits_size),
    .auto_dmInner_dmInner_tl_in_d_bits_source  (_tlDM_auto_dmInner_dmInner_tl_in_d_bits_source),
    .auto_dmInner_dmInner_tl_in_d_bits_data    (_tlDM_auto_dmInner_dmInner_tl_in_d_bits_data),
    .auto_dmOuter_intsource_out_sync_0         (_tlDM_auto_dmOuter_intsource_out_sync_0),
    .io_debug_clock                            (debug_clock),
    .io_debug_reset                            (debug_reset),
    .io_ctrl_dmactive                          (debug_dmactive),
    .io_ctrl_dmactiveAck                       (debug_dmactiveAck),
    .io_dmi_dmi_req_ready                      (_tlDM_io_dmi_dmi_req_ready),
    .io_dmi_dmi_req_valid                      (_dtm_io_dmi_req_valid),
    .io_dmi_dmi_req_bits_addr                  (_dtm_io_dmi_req_bits_addr),
    .io_dmi_dmi_req_bits_data                  (_dtm_io_dmi_req_bits_data),
    .io_dmi_dmi_req_bits_op                    (_dtm_io_dmi_req_bits_op),
    .io_dmi_dmi_resp_ready                     (_dtm_io_dmi_resp_ready),
    .io_dmi_dmi_resp_valid                     (_tlDM_io_dmi_dmi_resp_valid),
    .io_dmi_dmi_resp_bits_data                 (_tlDM_io_dmi_dmi_resp_bits_data),
    .io_dmi_dmi_resp_bits_resp                 (_tlDM_io_dmi_dmi_resp_bits_resp),
    .io_dmi_dmiClock                           (debug_systemjtag_jtag_TCK),
    .io_dmi_dmiReset                           (debug_systemjtag_reset),
    .io_hartIsInReset_0                        (resetctrl_hartIsInReset_0)
  );
  IntSyncCrossingSource_5 intsource (
    .clock           (clock),
    .reset           (reset),
    .auto_in_0       (_clint_auto_int_out_0),
    .auto_in_1       (_clint_auto_int_out_1),
    .auto_out_sync_0 (_intsource_auto_out_sync_0),
    .auto_out_sync_1 (_intsource_auto_out_sync_1)
  );
  IntSyncCrossingSource_1 intsource_1 (
    .clock           (clock),
    .reset           (reset),
    .auto_in_0       (_plicDomainWrapper_auto_plic_int_out_0_0),
    .auto_out_sync_0 (_intsource_1_auto_out_sync_0)
  );
  IntSyncCrossingSource_1 intsource_2 (
    .clock           (clock),
    .reset           (reset),
    .auto_in_0       (_plicDomainWrapper_auto_plic_int_out_1_0),
    .auto_out_sync_0 (_intsource_2_auto_out_sync_0)
  );
  ClockSinkDomain_1 bootROMDomainWrapper (
    .auto_bootrom_in_a_ready        (_bootROMDomainWrapper_auto_bootrom_in_a_ready),
    .auto_bootrom_in_a_valid        (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_valid),
    .auto_bootrom_in_a_bits_opcode  (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_opcode),
    .auto_bootrom_in_a_bits_param   (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_param),
    .auto_bootrom_in_a_bits_size    (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_size),
    .auto_bootrom_in_a_bits_source  (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_source),
    .auto_bootrom_in_a_bits_address (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_address),
    .auto_bootrom_in_a_bits_mask    (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_mask),
    .auto_bootrom_in_a_bits_corrupt (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_a_bits_corrupt),
    .auto_bootrom_in_d_ready        (_subsystem_cbus_auto_coupler_to_bootrom_fragmenter_out_d_ready),
    .auto_bootrom_in_d_valid        (_bootROMDomainWrapper_auto_bootrom_in_d_valid),
    .auto_bootrom_in_d_bits_size    (_bootROMDomainWrapper_auto_bootrom_in_d_bits_size),
    .auto_bootrom_in_d_bits_source  (_bootROMDomainWrapper_auto_bootrom_in_d_bits_source),
    .auto_bootrom_in_d_bits_data    (_bootROMDomainWrapper_auto_bootrom_in_d_bits_data),
    .auto_clock_in_clock            (_subsystem_cbus_auto_fixedClockNode_out_2_clock),
    .auto_clock_in_reset            (_subsystem_cbus_auto_fixedClockNode_out_2_reset)
  );
  ScratchpadBank bank (
    .clock                       (clock),
    .reset                       (reset),
    .auto_xbar_in_a_ready        (_bank_auto_xbar_in_a_ready),
    .auto_xbar_in_a_valid        (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_valid),
    .auto_xbar_in_a_bits_opcode  (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_opcode),
    .auto_xbar_in_a_bits_param   (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_param),
    .auto_xbar_in_a_bits_size    (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_size),
    .auto_xbar_in_a_bits_source  (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_source),
    .auto_xbar_in_a_bits_address (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_address),
    .auto_xbar_in_a_bits_mask    (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_mask),
    .auto_xbar_in_a_bits_data    (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_data),
    .auto_xbar_in_a_bits_corrupt (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_a_bits_corrupt),
    .auto_xbar_in_d_ready        (_subsystem_mbus_auto_coupler_to_subsystem_mbusscratchpad00_buffer_out_d_ready),
    .auto_xbar_in_d_valid        (_bank_auto_xbar_in_d_valid),
    .auto_xbar_in_d_bits_opcode  (_bank_auto_xbar_in_d_bits_opcode),
    .auto_xbar_in_d_bits_size    (_bank_auto_xbar_in_d_bits_size),
    .auto_xbar_in_d_bits_source  (_bank_auto_xbar_in_d_bits_source),
    .auto_xbar_in_d_bits_data    (_bank_auto_xbar_in_d_bits_data)
  );
  ClockSinkDomain_2 serial_tl_domain (
    .auto_serdesser_manager_in_a_ready        (_serial_tl_domain_auto_serdesser_manager_in_a_ready),
    .auto_serdesser_manager_in_a_valid        (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_valid),
    .auto_serdesser_manager_in_a_bits_opcode  (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_opcode),
    .auto_serdesser_manager_in_a_bits_param   (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_param),
    .auto_serdesser_manager_in_a_bits_size    (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_size),
    .auto_serdesser_manager_in_a_bits_source  (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_source),
    .auto_serdesser_manager_in_a_bits_address (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_address),
    .auto_serdesser_manager_in_a_bits_mask    (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_mask),
    .auto_serdesser_manager_in_a_bits_data    (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_data),
    .auto_serdesser_manager_in_a_bits_corrupt (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_a_bits_corrupt),
    .auto_serdesser_manager_in_d_ready        (_subsystem_obus_auto_coupler_to_port_named_serial_tl_0_out_shrinker_out_d_ready),
    .auto_serdesser_manager_in_d_valid        (_serial_tl_domain_auto_serdesser_manager_in_d_valid),
    .auto_serdesser_manager_in_d_bits_opcode  (_serial_tl_domain_auto_serdesser_manager_in_d_bits_opcode),
    .auto_serdesser_manager_in_d_bits_param   (_serial_tl_domain_auto_serdesser_manager_in_d_bits_param),
    .auto_serdesser_manager_in_d_bits_size    (_serial_tl_domain_auto_serdesser_manager_in_d_bits_size),
    .auto_serdesser_manager_in_d_bits_source  (_serial_tl_domain_auto_serdesser_manager_in_d_bits_source),
    .auto_serdesser_manager_in_d_bits_sink    (_serial_tl_domain_auto_serdesser_manager_in_d_bits_sink),
    .auto_serdesser_manager_in_d_bits_denied  (_serial_tl_domain_auto_serdesser_manager_in_d_bits_denied),
    .auto_serdesser_manager_in_d_bits_data    (_serial_tl_domain_auto_serdesser_manager_in_d_bits_data),
    .auto_serdesser_manager_in_d_bits_corrupt (_serial_tl_domain_auto_serdesser_manager_in_d_bits_corrupt),
    .auto_serdesser_client_out_a_ready        (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_a_ready),
    .auto_serdesser_client_out_a_valid        (_serial_tl_domain_auto_serdesser_client_out_a_valid),
    .auto_serdesser_client_out_a_bits_opcode  (_serial_tl_domain_auto_serdesser_client_out_a_bits_opcode),
    .auto_serdesser_client_out_a_bits_param   (_serial_tl_domain_auto_serdesser_client_out_a_bits_param),
    .auto_serdesser_client_out_a_bits_size    (_serial_tl_domain_auto_serdesser_client_out_a_bits_size),
    .auto_serdesser_client_out_a_bits_source  (_serial_tl_domain_auto_serdesser_client_out_a_bits_source),
    .auto_serdesser_client_out_a_bits_address (_serial_tl_domain_auto_serdesser_client_out_a_bits_address),
    .auto_serdesser_client_out_a_bits_mask    (_serial_tl_domain_auto_serdesser_client_out_a_bits_mask),
    .auto_serdesser_client_out_a_bits_data    (_serial_tl_domain_auto_serdesser_client_out_a_bits_data),
    .auto_serdesser_client_out_a_bits_corrupt (_serial_tl_domain_auto_serdesser_client_out_a_bits_corrupt),
    .auto_serdesser_client_out_d_ready        (_serial_tl_domain_auto_serdesser_client_out_d_ready),
    .auto_serdesser_client_out_d_valid        (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_valid),
    .auto_serdesser_client_out_d_bits_opcode  (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_opcode),
    .auto_serdesser_client_out_d_bits_param   (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_param),
    .auto_serdesser_client_out_d_bits_size    (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_size),
    .auto_serdesser_client_out_d_bits_source  (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_source),
    .auto_serdesser_client_out_d_bits_sink    (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_sink),
    .auto_serdesser_client_out_d_bits_denied  (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_denied),
    .auto_serdesser_client_out_d_bits_data    (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_data),
    .auto_serdesser_client_out_d_bits_corrupt (_subsystem_fbus_coupler_from_port_named_serial_tl_0_in_auto_buffer_in_d_bits_corrupt),
    .auto_clock_in_clock                      (_subsystem_obus_auto_fixedClockNode_out_clock),
    .auto_clock_in_reset                      (_subsystem_obus_auto_fixedClockNode_out_reset),
    .serial_tl_0_clock                        (serial_tl_0_clock),
    .serial_tl_0_bits_in_ready                (serial_tl_0_bits_in_ready),
    .serial_tl_0_bits_in_valid                (serial_tl_0_bits_in_valid),
    .serial_tl_0_bits_in_bits                 (serial_tl_0_bits_in_bits),
    .serial_tl_0_bits_out_ready               (serial_tl_0_bits_out_ready),
    .serial_tl_0_bits_out_valid               (serial_tl_0_bits_out_valid),
    .serial_tl_0_bits_out_bits                (serial_tl_0_bits_out_bits)
  );
  ClockSinkDomain_3 uartClockDomainWrapper (
    .auto_uart_0_int_xing_out_sync_0            (_uartClockDomainWrapper_auto_uart_0_int_xing_out_sync_0),
    .auto_uart_0_control_xing_in_a_ready        (_uartClockDomainWrapper_auto_uart_0_control_xing_in_a_ready),
    .auto_uart_0_control_xing_in_a_valid        (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_valid),
    .auto_uart_0_control_xing_in_a_bits_opcode  (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_opcode),
    .auto_uart_0_control_xing_in_a_bits_param   (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_param),
    .auto_uart_0_control_xing_in_a_bits_size    (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_size),
    .auto_uart_0_control_xing_in_a_bits_source  (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_source),
    .auto_uart_0_control_xing_in_a_bits_address (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_address),
    .auto_uart_0_control_xing_in_a_bits_mask    (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_mask),
    .auto_uart_0_control_xing_in_a_bits_data    (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_data),
    .auto_uart_0_control_xing_in_a_bits_corrupt (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_a_bits_corrupt),
    .auto_uart_0_control_xing_in_d_ready        (_subsystem_pbus_auto_coupler_to_device_named_uart_0_control_xing_out_d_ready),
    .auto_uart_0_control_xing_in_d_valid        (_uartClockDomainWrapper_auto_uart_0_control_xing_in_d_valid),
    .auto_uart_0_control_xing_in_d_bits_opcode  (_uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_opcode),
    .auto_uart_0_control_xing_in_d_bits_size    (_uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_size),
    .auto_uart_0_control_xing_in_d_bits_source  (_uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_source),
    .auto_uart_0_control_xing_in_d_bits_data    (_uartClockDomainWrapper_auto_uart_0_control_xing_in_d_bits_data),
    .auto_uart_0_io_out_txd                     (uart_0_txd),
    .auto_uart_0_io_out_rxd                     (uart_0_rxd),
    .auto_clock_in_clock                        (_subsystem_pbus_auto_fixedClockNode_out_clock),
    .auto_clock_in_reset                        (_subsystem_pbus_auto_fixedClockNode_out_reset)
  );
  IntSyncSyncCrossingSink_1 intsink_4 (
    .auto_in_sync_0 (_uartClockDomainWrapper_auto_uart_0_int_xing_out_sync_0),
    .auto_out_0     (_intsink_4_auto_out_0)
  );
  ClockSinkDomain_4 prci_ctrl_domain (
    .auto_pllCtrl_ctrl_out_gate                               (auto_prci_ctrl_domain_pllCtrl_ctrl_out_gate),
    .auto_pllCtrl_ctrl_out_power                              (auto_prci_ctrl_domain_pllCtrl_ctrl_out_power),
    .auto_clockSelector_clock_in_1_clock                      (auto_prci_ctrl_domain_clockSelector_clock_in_1_clock),
    .auto_clockSelector_clock_in_0_clock                      (auto_prci_ctrl_domain_clockSelector_clock_in_0_clock),
    .auto_clockSelector_clock_in_0_reset                      (auto_prci_ctrl_domain_clockSelector_clock_in_0_reset),
    .auto_resetSynchronizer_out_member_allClocks_uncore_clock (_prci_ctrl_domain_auto_resetSynchronizer_out_member_allClocks_uncore_clock),
    .auto_resetSynchronizer_out_member_allClocks_uncore_reset (_prci_ctrl_domain_auto_resetSynchronizer_out_member_allClocks_uncore_reset),
    .auto_xbar_in_a_ready                                     (_prci_ctrl_domain_auto_xbar_in_a_ready),
    .auto_xbar_in_a_valid                                     (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_valid),
    .auto_xbar_in_a_bits_opcode                               (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_opcode),
    .auto_xbar_in_a_bits_param                                (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_param),
    .auto_xbar_in_a_bits_size                                 (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_size),
    .auto_xbar_in_a_bits_source                               (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_source),
    .auto_xbar_in_a_bits_address                              (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_address),
    .auto_xbar_in_a_bits_mask                                 (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_mask),
    .auto_xbar_in_a_bits_data                                 (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_data),
    .auto_xbar_in_a_bits_corrupt                              (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_a_bits_corrupt),
    .auto_xbar_in_d_ready                                     (_subsystem_cbus_auto_coupler_to_prci_ctrl_fixer_out_d_ready),
    .auto_xbar_in_d_valid                                     (_prci_ctrl_domain_auto_xbar_in_d_valid),
    .auto_xbar_in_d_bits_opcode                               (_prci_ctrl_domain_auto_xbar_in_d_bits_opcode),
    .auto_xbar_in_d_bits_size                                 (_prci_ctrl_domain_auto_xbar_in_d_bits_size),
    .auto_xbar_in_d_bits_source                               (_prci_ctrl_domain_auto_xbar_in_d_bits_source),
    .auto_xbar_in_d_bits_data                                 (_prci_ctrl_domain_auto_xbar_in_d_bits_data),
    .auto_clock_in_clock                                      (_subsystem_cbus_auto_fixedClockNode_out_3_clock),
    .auto_clock_in_reset                                      (_subsystem_cbus_auto_fixedClockNode_out_3_reset)
  );
  ClockGroupAggregator_7 aggregator (
    .auto_in_member_allClocks_implicit_clock_clock               (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_implicit_clock_clock),
    .auto_in_member_allClocks_implicit_clock_reset               (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_implicit_clock_reset),
    .auto_in_member_allClocks_subsystem_cbus_0_clock             (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_cbus_0_clock),
    .auto_in_member_allClocks_subsystem_cbus_0_reset             (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_cbus_0_reset),
    .auto_in_member_allClocks_subsystem_mbus_1_clock             (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_mbus_1_clock),
    .auto_in_member_allClocks_subsystem_mbus_1_reset             (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_mbus_1_reset),
    .auto_in_member_allClocks_subsystem_mbus_0_clock             (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_mbus_0_clock),
    .auto_in_member_allClocks_subsystem_mbus_0_reset             (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_mbus_0_reset),
    .auto_in_member_allClocks_subsystem_fbus_0_clock             (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_fbus_0_clock),
    .auto_in_member_allClocks_subsystem_fbus_0_reset             (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_fbus_0_reset),
    .auto_in_member_allClocks_subsystem_pbus_0_clock             (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_pbus_0_clock),
    .auto_in_member_allClocks_subsystem_pbus_0_reset             (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_pbus_0_reset),
    .auto_in_member_allClocks_subsystem_sbus_1_clock             (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_sbus_1_clock),
    .auto_in_member_allClocks_subsystem_sbus_1_reset             (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_sbus_1_reset),
    .auto_in_member_allClocks_subsystem_sbus_0_clock             (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_sbus_0_clock),
    .auto_in_member_allClocks_subsystem_sbus_0_reset             (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_sbus_0_reset),
    .auto_out_5_member_implicitClockGrouper_implicit_clock_clock (auto_implicitClockGrouper_out_clock),
    .auto_out_5_member_implicitClockGrouper_implicit_clock_reset (auto_implicitClockGrouper_out_reset),
    .auto_out_4_member_subsystem_cbus_subsystem_cbus_0_clock     (_aggregator_auto_out_4_member_subsystem_cbus_subsystem_cbus_0_clock),
    .auto_out_4_member_subsystem_cbus_subsystem_cbus_0_reset     (_aggregator_auto_out_4_member_subsystem_cbus_subsystem_cbus_0_reset),
    .auto_out_3_member_subsystem_mbus_subsystem_mbus_1_clock     (_aggregator_auto_out_3_member_subsystem_mbus_subsystem_mbus_1_clock),
    .auto_out_3_member_subsystem_mbus_subsystem_mbus_1_reset     (_aggregator_auto_out_3_member_subsystem_mbus_subsystem_mbus_1_reset),
    .auto_out_3_member_subsystem_mbus_subsystem_mbus_0_clock     (_aggregator_auto_out_3_member_subsystem_mbus_subsystem_mbus_0_clock),
    .auto_out_3_member_subsystem_mbus_subsystem_mbus_0_reset     (_aggregator_auto_out_3_member_subsystem_mbus_subsystem_mbus_0_reset),
    .auto_out_2_member_subsystem_fbus_subsystem_fbus_0_clock     (_aggregator_auto_out_2_member_subsystem_fbus_subsystem_fbus_0_clock),
    .auto_out_2_member_subsystem_fbus_subsystem_fbus_0_reset     (_aggregator_auto_out_2_member_subsystem_fbus_subsystem_fbus_0_reset),
    .auto_out_1_member_subsystem_pbus_subsystem_pbus_0_clock     (_aggregator_auto_out_1_member_subsystem_pbus_subsystem_pbus_0_clock),
    .auto_out_1_member_subsystem_pbus_subsystem_pbus_0_reset     (_aggregator_auto_out_1_member_subsystem_pbus_subsystem_pbus_0_reset),
    .auto_out_0_member_subsystem_sbus_subsystem_sbus_1_clock     (_aggregator_auto_out_0_member_subsystem_sbus_subsystem_sbus_1_clock),
    .auto_out_0_member_subsystem_sbus_subsystem_sbus_1_reset     (_aggregator_auto_out_0_member_subsystem_sbus_subsystem_sbus_1_reset),
    .auto_out_0_member_subsystem_sbus_subsystem_sbus_0_clock     (_aggregator_auto_out_0_member_subsystem_sbus_subsystem_sbus_0_clock),
    .auto_out_0_member_subsystem_sbus_subsystem_sbus_0_reset     (_aggregator_auto_out_0_member_subsystem_sbus_subsystem_sbus_0_reset)
  );
  ClockGroupParameterModifier clockNamePrefixer (
    .auto_clock_name_prefixer_in_4_member_subsystem_cbus_subsystem_cbus_0_clock (_aggregator_auto_out_4_member_subsystem_cbus_subsystem_cbus_0_clock),
    .auto_clock_name_prefixer_in_4_member_subsystem_cbus_subsystem_cbus_0_reset (_aggregator_auto_out_4_member_subsystem_cbus_subsystem_cbus_0_reset),
    .auto_clock_name_prefixer_in_3_member_subsystem_mbus_subsystem_mbus_1_clock (_aggregator_auto_out_3_member_subsystem_mbus_subsystem_mbus_1_clock),
    .auto_clock_name_prefixer_in_3_member_subsystem_mbus_subsystem_mbus_1_reset (_aggregator_auto_out_3_member_subsystem_mbus_subsystem_mbus_1_reset),
    .auto_clock_name_prefixer_in_3_member_subsystem_mbus_subsystem_mbus_0_clock (_aggregator_auto_out_3_member_subsystem_mbus_subsystem_mbus_0_clock),
    .auto_clock_name_prefixer_in_3_member_subsystem_mbus_subsystem_mbus_0_reset (_aggregator_auto_out_3_member_subsystem_mbus_subsystem_mbus_0_reset),
    .auto_clock_name_prefixer_in_2_member_subsystem_fbus_subsystem_fbus_0_clock (_aggregator_auto_out_2_member_subsystem_fbus_subsystem_fbus_0_clock),
    .auto_clock_name_prefixer_in_2_member_subsystem_fbus_subsystem_fbus_0_reset (_aggregator_auto_out_2_member_subsystem_fbus_subsystem_fbus_0_reset),
    .auto_clock_name_prefixer_in_1_member_subsystem_pbus_subsystem_pbus_0_clock (_aggregator_auto_out_1_member_subsystem_pbus_subsystem_pbus_0_clock),
    .auto_clock_name_prefixer_in_1_member_subsystem_pbus_subsystem_pbus_0_reset (_aggregator_auto_out_1_member_subsystem_pbus_subsystem_pbus_0_reset),
    .auto_clock_name_prefixer_in_0_member_subsystem_sbus_subsystem_sbus_1_clock (_aggregator_auto_out_0_member_subsystem_sbus_subsystem_sbus_1_clock),
    .auto_clock_name_prefixer_in_0_member_subsystem_sbus_subsystem_sbus_1_reset (_aggregator_auto_out_0_member_subsystem_sbus_subsystem_sbus_1_reset),
    .auto_clock_name_prefixer_in_0_member_subsystem_sbus_subsystem_sbus_0_clock (_aggregator_auto_out_0_member_subsystem_sbus_subsystem_sbus_0_clock),
    .auto_clock_name_prefixer_in_0_member_subsystem_sbus_subsystem_sbus_0_reset (_aggregator_auto_out_0_member_subsystem_sbus_subsystem_sbus_0_reset),
    .auto_clock_name_prefixer_out_4_member_subsystem_cbus_0_clock               (_clockNamePrefixer_auto_clock_name_prefixer_out_4_member_subsystem_cbus_0_clock),
    .auto_clock_name_prefixer_out_4_member_subsystem_cbus_0_reset               (_clockNamePrefixer_auto_clock_name_prefixer_out_4_member_subsystem_cbus_0_reset),
    .auto_clock_name_prefixer_out_3_member_subsystem_mbus_1_clock               (_clockNamePrefixer_auto_clock_name_prefixer_out_3_member_subsystem_mbus_1_clock),
    .auto_clock_name_prefixer_out_3_member_subsystem_mbus_1_reset               (_clockNamePrefixer_auto_clock_name_prefixer_out_3_member_subsystem_mbus_1_reset),
    .auto_clock_name_prefixer_out_3_member_subsystem_mbus_0_clock               (_clockNamePrefixer_auto_clock_name_prefixer_out_3_member_subsystem_mbus_0_clock),
    .auto_clock_name_prefixer_out_3_member_subsystem_mbus_0_reset               (_clockNamePrefixer_auto_clock_name_prefixer_out_3_member_subsystem_mbus_0_reset),
    .auto_clock_name_prefixer_out_2_member_subsystem_fbus_0_clock               (_clockNamePrefixer_auto_clock_name_prefixer_out_2_member_subsystem_fbus_0_clock),
    .auto_clock_name_prefixer_out_2_member_subsystem_fbus_0_reset               (_clockNamePrefixer_auto_clock_name_prefixer_out_2_member_subsystem_fbus_0_reset),
    .auto_clock_name_prefixer_out_1_member_subsystem_pbus_0_clock               (_clockNamePrefixer_auto_clock_name_prefixer_out_1_member_subsystem_pbus_0_clock),
    .auto_clock_name_prefixer_out_1_member_subsystem_pbus_0_reset               (_clockNamePrefixer_auto_clock_name_prefixer_out_1_member_subsystem_pbus_0_reset),
    .auto_clock_name_prefixer_out_0_member_subsystem_sbus_1_clock               (_clockNamePrefixer_auto_clock_name_prefixer_out_0_member_subsystem_sbus_1_clock),
    .auto_clock_name_prefixer_out_0_member_subsystem_sbus_1_reset               (_clockNamePrefixer_auto_clock_name_prefixer_out_0_member_subsystem_sbus_1_reset),
    .auto_clock_name_prefixer_out_0_member_subsystem_sbus_0_clock               (_clockNamePrefixer_auto_clock_name_prefixer_out_0_member_subsystem_sbus_0_clock),
    .auto_clock_name_prefixer_out_0_member_subsystem_sbus_0_reset               (_clockNamePrefixer_auto_clock_name_prefixer_out_0_member_subsystem_sbus_0_reset)
  );
  ClockGroupParameterModifier_1 frequencySpecifier (
    .auto_frequency_specifier_in_member_allClocks_implicit_clock_clock    (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_implicit_clock_clock),
    .auto_frequency_specifier_in_member_allClocks_implicit_clock_reset    (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_implicit_clock_reset),
    .auto_frequency_specifier_in_member_allClocks_subsystem_cbus_0_clock  (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_cbus_0_clock),
    .auto_frequency_specifier_in_member_allClocks_subsystem_cbus_0_reset  (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_cbus_0_reset),
    .auto_frequency_specifier_in_member_allClocks_subsystem_mbus_1_clock  (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_1_clock),
    .auto_frequency_specifier_in_member_allClocks_subsystem_mbus_1_reset  (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_1_reset),
    .auto_frequency_specifier_in_member_allClocks_subsystem_mbus_0_clock  (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_0_clock),
    .auto_frequency_specifier_in_member_allClocks_subsystem_mbus_0_reset  (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_0_reset),
    .auto_frequency_specifier_in_member_allClocks_subsystem_fbus_0_clock  (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_fbus_0_clock),
    .auto_frequency_specifier_in_member_allClocks_subsystem_fbus_0_reset  (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_fbus_0_reset),
    .auto_frequency_specifier_in_member_allClocks_subsystem_pbus_0_clock  (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_pbus_0_clock),
    .auto_frequency_specifier_in_member_allClocks_subsystem_pbus_0_reset  (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_pbus_0_reset),
    .auto_frequency_specifier_in_member_allClocks_subsystem_sbus_1_clock  (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_1_clock),
    .auto_frequency_specifier_in_member_allClocks_subsystem_sbus_1_reset  (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_1_reset),
    .auto_frequency_specifier_in_member_allClocks_subsystem_sbus_0_clock  (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_0_clock),
    .auto_frequency_specifier_in_member_allClocks_subsystem_sbus_0_reset  (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_0_reset),
    .auto_frequency_specifier_out_member_allClocks_implicit_clock_clock   (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_implicit_clock_clock),
    .auto_frequency_specifier_out_member_allClocks_implicit_clock_reset   (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_implicit_clock_reset),
    .auto_frequency_specifier_out_member_allClocks_subsystem_cbus_0_clock (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_cbus_0_clock),
    .auto_frequency_specifier_out_member_allClocks_subsystem_cbus_0_reset (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_cbus_0_reset),
    .auto_frequency_specifier_out_member_allClocks_subsystem_mbus_1_clock (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_mbus_1_clock),
    .auto_frequency_specifier_out_member_allClocks_subsystem_mbus_1_reset (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_mbus_1_reset),
    .auto_frequency_specifier_out_member_allClocks_subsystem_mbus_0_clock (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_mbus_0_clock),
    .auto_frequency_specifier_out_member_allClocks_subsystem_mbus_0_reset (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_mbus_0_reset),
    .auto_frequency_specifier_out_member_allClocks_subsystem_fbus_0_clock (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_fbus_0_clock),
    .auto_frequency_specifier_out_member_allClocks_subsystem_fbus_0_reset (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_fbus_0_reset),
    .auto_frequency_specifier_out_member_allClocks_subsystem_pbus_0_clock (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_pbus_0_clock),
    .auto_frequency_specifier_out_member_allClocks_subsystem_pbus_0_reset (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_pbus_0_reset),
    .auto_frequency_specifier_out_member_allClocks_subsystem_sbus_1_clock (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_sbus_1_clock),
    .auto_frequency_specifier_out_member_allClocks_subsystem_sbus_1_reset (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_sbus_1_reset),
    .auto_frequency_specifier_out_member_allClocks_subsystem_sbus_0_clock (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_sbus_0_clock),
    .auto_frequency_specifier_out_member_allClocks_subsystem_sbus_0_reset (_frequencySpecifier_auto_frequency_specifier_out_member_allClocks_subsystem_sbus_0_reset)
  );
  ClockGroupCombiner clockGroupCombiner (
    .auto_clock_group_combiner_in_member_allClocks_uncore_clock            (_prci_ctrl_domain_auto_resetSynchronizer_out_member_allClocks_uncore_clock),
    .auto_clock_group_combiner_in_member_allClocks_uncore_reset            (_prci_ctrl_domain_auto_resetSynchronizer_out_member_allClocks_uncore_reset),
    .auto_clock_group_combiner_out_member_allClocks_implicit_clock_clock   (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_implicit_clock_clock),
    .auto_clock_group_combiner_out_member_allClocks_implicit_clock_reset   (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_implicit_clock_reset),
    .auto_clock_group_combiner_out_member_allClocks_subsystem_cbus_0_clock (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_cbus_0_clock),
    .auto_clock_group_combiner_out_member_allClocks_subsystem_cbus_0_reset (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_cbus_0_reset),
    .auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_1_clock (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_1_clock),
    .auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_1_reset (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_1_reset),
    .auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_0_clock (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_0_clock),
    .auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_0_reset (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_mbus_0_reset),
    .auto_clock_group_combiner_out_member_allClocks_subsystem_fbus_0_clock (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_fbus_0_clock),
    .auto_clock_group_combiner_out_member_allClocks_subsystem_fbus_0_reset (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_fbus_0_reset),
    .auto_clock_group_combiner_out_member_allClocks_subsystem_pbus_0_clock (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_pbus_0_clock),
    .auto_clock_group_combiner_out_member_allClocks_subsystem_pbus_0_reset (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_pbus_0_reset),
    .auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_1_clock (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_1_clock),
    .auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_1_reset (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_1_reset),
    .auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_0_clock (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_0_clock),
    .auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_0_reset (_clockGroupCombiner_auto_clock_group_combiner_out_member_allClocks_subsystem_sbus_0_reset)
  );
  DebugTransportModuleJTAG dtm (
    .io_jtag_clock         (debug_systemjtag_jtag_TCK),
    .io_jtag_reset         (debug_systemjtag_reset),
    .io_dmi_req_ready      (_tlDM_io_dmi_dmi_req_ready),
    .io_dmi_req_valid      (_dtm_io_dmi_req_valid),
    .io_dmi_req_bits_addr  (_dtm_io_dmi_req_bits_addr),
    .io_dmi_req_bits_data  (_dtm_io_dmi_req_bits_data),
    .io_dmi_req_bits_op    (_dtm_io_dmi_req_bits_op),
    .io_dmi_resp_ready     (_dtm_io_dmi_resp_ready),
    .io_dmi_resp_valid     (_tlDM_io_dmi_dmi_resp_valid),
    .io_dmi_resp_bits_data (_tlDM_io_dmi_dmi_resp_bits_data),
    .io_dmi_resp_bits_resp (_tlDM_io_dmi_dmi_resp_bits_resp),
    .io_jtag_TMS           (debug_systemjtag_jtag_TMS),
    .io_jtag_TDI           (debug_systemjtag_jtag_TDI),
    .io_jtag_TDO_data      (debug_systemjtag_jtag_TDO_data)
  );
endmodule

