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

module ChipTop(
  input fake_pll_clk,
  input        clock,
               reset,
               serial_tl_0_clock,
  output       serial_tl_0_bits_in_ready,
  input        serial_tl_0_bits_in_valid,
  input  [3:0] serial_tl_0_bits_in_bits,
  input        serial_tl_0_bits_out_ready,
  output       serial_tl_0_bits_out_valid,
  output [3:0] serial_tl_0_bits_out_bits,
  input        custom_boot,
               jtag_TCK,
               jtag_TMS,
               jtag_TDI,
  output       jtag_TDO,
               uart_0_txd,
  input        uart_0_rxd
);

  wire       _iocell_uart_0_rxd_i;
  wire       _iocell_jtag_TCK_i;
  wire       _iocell_jtag_TMS_i;
  wire       _iocell_jtag_TDI_i;
  wire       _gated_clock_debug_clock_gate_out;
  wire       _dmactiveAck_dmactiveAck_io_q;
  wire       _debug_reset_syncd_debug_reset_sync_io_q;
  wire       _system_debug_systemjtag_reset_catcher_io_sync_reset;
  wire       _iocell_custom_boot_i;
  wire       _iocell_serial_tl_0_clock_i;
  wire       _iocell_serial_tl_0_bits_in_valid_i;
  wire       _iocell_serial_tl_0_bits_in_bits_3_i;
  wire       _iocell_serial_tl_0_bits_in_bits_2_i;
  wire       _iocell_serial_tl_0_bits_in_bits_1_i;
  wire       _iocell_serial_tl_0_bits_in_bits_i;
  wire       _iocell_serial_tl_0_bits_out_ready_i;
  wire       _iocell_serial_tl_0_bits_out_bits_3_pad;
  wire       _iocell_serial_tl_0_bits_out_bits_2_pad;
  wire       _iocell_serial_tl_0_bits_out_bits_1_pad;
  wire       _iocell_serial_tl_0_bits_out_bits_pad;
  wire       _iocell_reset_i;
  wire       _iocell_clock_i;
  wire       _system_auto_implicitClockGrouper_out_clock;
  wire       _system_auto_implicitClockGrouper_out_reset;
  wire       _system_auto_prci_ctrl_domain_pllCtrl_ctrl_out_gate;
  wire       _system_auto_prci_ctrl_domain_pllCtrl_ctrl_out_power;
  wire       _system_auto_subsystem_cbus_fixedClockNode_out_clock;
  wire       _system_auto_subsystem_cbus_fixedClockNode_out_reset;
  wire       _system_debug_systemjtag_jtag_TDO_data;
  wire       _system_debug_dmactive;
  wire       _system_serial_tl_0_bits_in_ready;
  wire       _system_serial_tl_0_bits_out_valid;
  wire [3:0] _system_serial_tl_0_bits_out_bits;
  wire       _system_uart_0_txd;
  wire       debug_reset = ~_debug_reset_syncd_debug_reset_sync_io_q;
  reg        clock_en;
  always @(posedge _system_auto_subsystem_cbus_fixedClockNode_out_clock or posedge debug_reset) begin
    if (debug_reset)
      clock_en <= 1'h1;
    else
      clock_en <= _dmactiveAck_dmactiveAck_io_q;
  end // always @(posedge, posedge)
  `ifdef ENABLE_INITIAL_REG_
    `ifdef FIRRTL_BEFORE_INITIAL
      `FIRRTL_BEFORE_INITIAL
    `endif // FIRRTL_BEFORE_INITIAL
    initial begin
      if (debug_reset)
        clock_en = 1'h1;
    end // initial
    `ifdef FIRRTL_AFTER_INITIAL
      `FIRRTL_AFTER_INITIAL
    `endif // FIRRTL_AFTER_INITIAL
  `endif // ENABLE_INITIAL_REG_
  DigitalTop system (
    .clock                                                (_system_auto_implicitClockGrouper_out_clock),
    .reset                                                (_system_auto_implicitClockGrouper_out_reset),
    .auto_implicitClockGrouper_out_clock                  (_system_auto_implicitClockGrouper_out_clock),
    .auto_implicitClockGrouper_out_reset                  (_system_auto_implicitClockGrouper_out_reset),
    .auto_prci_ctrl_domain_pllCtrl_ctrl_out_gate          (_system_auto_prci_ctrl_domain_pllCtrl_ctrl_out_gate),
    .auto_prci_ctrl_domain_pllCtrl_ctrl_out_power         (_system_auto_prci_ctrl_domain_pllCtrl_ctrl_out_power),
    .auto_prci_ctrl_domain_clockSelector_clock_in_1_clock (fake_pll_clk),
    .auto_prci_ctrl_domain_clockSelector_clock_in_0_clock (_iocell_clock_i),
    .auto_prci_ctrl_domain_clockSelector_clock_in_0_reset (_iocell_reset_i),
    .auto_subsystem_cbus_fixedClockNode_out_clock         (_system_auto_subsystem_cbus_fixedClockNode_out_clock),
    .auto_subsystem_cbus_fixedClockNode_out_reset         (_system_auto_subsystem_cbus_fixedClockNode_out_reset),
    .resetctrl_hartIsInReset_0                            (_system_auto_subsystem_cbus_fixedClockNode_out_reset),
    .debug_clock                                          (_gated_clock_debug_clock_gate_out),
    .debug_reset                                          (debug_reset),
    .debug_systemjtag_jtag_TCK                            (_iocell_jtag_TCK_i),
    .debug_systemjtag_jtag_TMS                            (_iocell_jtag_TMS_i),
    .debug_systemjtag_jtag_TDI                            (_iocell_jtag_TDI_i),
    .debug_systemjtag_jtag_TDO_data                       (_system_debug_systemjtag_jtag_TDO_data),
    .debug_systemjtag_reset                               (_system_debug_systemjtag_reset_catcher_io_sync_reset),
    .debug_dmactive                                       (_system_debug_dmactive),
    .debug_dmactiveAck                                    (_dmactiveAck_dmactiveAck_io_q),
    .custom_boot                                          (_iocell_custom_boot_i),
    .serial_tl_0_clock                                    (_iocell_serial_tl_0_clock_i),
    .serial_tl_0_bits_in_ready                            (_system_serial_tl_0_bits_in_ready),
    .serial_tl_0_bits_in_valid                            (_iocell_serial_tl_0_bits_in_valid_i),
    .serial_tl_0_bits_in_bits                             ({_iocell_serial_tl_0_bits_in_bits_3_i, _iocell_serial_tl_0_bits_in_bits_2_i, _iocell_serial_tl_0_bits_in_bits_1_i, _iocell_serial_tl_0_bits_in_bits_i}),
    .serial_tl_0_bits_out_ready                           (_iocell_serial_tl_0_bits_out_ready_i),
    .serial_tl_0_bits_out_valid                           (_system_serial_tl_0_bits_out_valid),
    .serial_tl_0_bits_out_bits                            (_system_serial_tl_0_bits_out_bits),
    .uart_0_txd                                           (_system_uart_0_txd),
    .uart_0_rxd                                           (_iocell_uart_0_rxd_i)
  );
  GenericDigitalInIOCell iocell_clock (
    .pad (clock),
    .i   (_iocell_clock_i),
    .ie  (1'h1)
  );
  GenericDigitalInIOCell iocell_reset (
    .pad (reset),
    .i   (_iocell_reset_i),
    .ie  (1'h1)
  );
  GenericDigitalOutIOCell iocell_serial_tl_0_bits_out_bits (
    .pad (_iocell_serial_tl_0_bits_out_bits_pad),
    .o   (_system_serial_tl_0_bits_out_bits[0]),
    .oe  (1'h1)
  );
  GenericDigitalOutIOCell iocell_serial_tl_0_bits_out_bits_1 (
    .pad (_iocell_serial_tl_0_bits_out_bits_1_pad),
    .o   (_system_serial_tl_0_bits_out_bits[1]),
    .oe  (1'h1)
  );
  GenericDigitalOutIOCell iocell_serial_tl_0_bits_out_bits_2 (
    .pad (_iocell_serial_tl_0_bits_out_bits_2_pad),
    .o   (_system_serial_tl_0_bits_out_bits[2]),
    .oe  (1'h1)
  );
  GenericDigitalOutIOCell iocell_serial_tl_0_bits_out_bits_3 (
    .pad (_iocell_serial_tl_0_bits_out_bits_3_pad),
    .o   (_system_serial_tl_0_bits_out_bits[3]),
    .oe  (1'h1)
  );
  GenericDigitalOutIOCell iocell_serial_tl_0_bits_out_valid (
    .pad (serial_tl_0_bits_out_valid),
    .o   (_system_serial_tl_0_bits_out_valid),
    .oe  (1'h1)
  );
  GenericDigitalInIOCell iocell_serial_tl_0_bits_out_ready (
    .pad (serial_tl_0_bits_out_ready),
    .i   (_iocell_serial_tl_0_bits_out_ready_i),
    .ie  (1'h1)
  );
  GenericDigitalInIOCell iocell_serial_tl_0_bits_in_bits (
    .pad (serial_tl_0_bits_in_bits[0]),
    .i   (_iocell_serial_tl_0_bits_in_bits_i),
    .ie  (1'h1)
  );
  GenericDigitalInIOCell iocell_serial_tl_0_bits_in_bits_1 (
    .pad (serial_tl_0_bits_in_bits[1]),
    .i   (_iocell_serial_tl_0_bits_in_bits_1_i),
    .ie  (1'h1)
  );
  GenericDigitalInIOCell iocell_serial_tl_0_bits_in_bits_2 (
    .pad (serial_tl_0_bits_in_bits[2]),
    .i   (_iocell_serial_tl_0_bits_in_bits_2_i),
    .ie  (1'h1)
  );
  GenericDigitalInIOCell iocell_serial_tl_0_bits_in_bits_3 (
    .pad (serial_tl_0_bits_in_bits[3]),
    .i   (_iocell_serial_tl_0_bits_in_bits_3_i),
    .ie  (1'h1)
  );
  GenericDigitalInIOCell iocell_serial_tl_0_bits_in_valid (
    .pad (serial_tl_0_bits_in_valid),
    .i   (_iocell_serial_tl_0_bits_in_valid_i),
    .ie  (1'h1)
  );
  GenericDigitalOutIOCell iocell_serial_tl_0_bits_in_ready (
    .pad (serial_tl_0_bits_in_ready),
    .o   (_system_serial_tl_0_bits_in_ready),
    .oe  (1'h1)
  );
  GenericDigitalInIOCell iocell_serial_tl_0_clock (
    .pad (serial_tl_0_clock),
    .i   (_iocell_serial_tl_0_clock_i),
    .ie  (1'h1)
  );
  GenericDigitalInIOCell iocell_custom_boot (
    .pad (custom_boot),
    .i   (_iocell_custom_boot_i),
    .ie  (1'h1)
  );
  ResetCatchAndSync_d3 system_debug_systemjtag_reset_catcher (
    .clock         (_iocell_jtag_TCK_i),
    .reset         (_system_auto_subsystem_cbus_fixedClockNode_out_reset),
    .io_sync_reset (_system_debug_systemjtag_reset_catcher_io_sync_reset)
  );
  AsyncResetSynchronizerShiftReg_w1_d3_i0 debug_reset_syncd_debug_reset_sync (
    .clock (_system_auto_subsystem_cbus_fixedClockNode_out_clock),
    .reset (_system_debug_systemjtag_reset_catcher_io_sync_reset),
    .io_d  (1'h1),
    .io_q  (_debug_reset_syncd_debug_reset_sync_io_q)
  );
  ResetSynchronizerShiftReg_w1_d3_i0 dmactiveAck_dmactiveAck (
    .clock (_system_auto_subsystem_cbus_fixedClockNode_out_clock),
    .reset (debug_reset),
    .io_d  (_system_debug_dmactive),
    .io_q  (_dmactiveAck_dmactiveAck_io_q)
  );
  EICG_wrapper gated_clock_debug_clock_gate (
    .in      (_system_auto_subsystem_cbus_fixedClockNode_out_clock),
    .test_en (1'h0),
    .en      (clock_en),
    .out     (_gated_clock_debug_clock_gate_out)
  );
  GenericDigitalOutIOCell iocell_jtag_TDO (
    .pad (jtag_TDO),
    .o   (_system_debug_systemjtag_jtag_TDO_data),
    .oe  (1'h1)
  );
  GenericDigitalInIOCell iocell_jtag_TDI (
    .pad (jtag_TDI),
    .i   (_iocell_jtag_TDI_i),
    .ie  (1'h1)
  );
  GenericDigitalInIOCell iocell_jtag_TMS (
    .pad (jtag_TMS),
    .i   (_iocell_jtag_TMS_i),
    .ie  (1'h1)
  );
  GenericDigitalInIOCell iocell_jtag_TCK (
    .pad (jtag_TCK),
    .i   (_iocell_jtag_TCK_i),
    .ie  (1'h1)
  );
  GenericDigitalInIOCell iocell_uart_0_rxd (
    .pad (uart_0_rxd),
    .i   (_iocell_uart_0_rxd_i),
    .ie  (1'h1)
  );
  GenericDigitalOutIOCell iocell_uart_0_txd (
    .pad (uart_0_txd),
    .o   (_system_uart_0_txd),
    .oe  (1'h1)
  );
  assign serial_tl_0_bits_out_bits = {_iocell_serial_tl_0_bits_out_bits_3_pad, _iocell_serial_tl_0_bits_out_bits_2_pad, _iocell_serial_tl_0_bits_out_bits_1_pad, _iocell_serial_tl_0_bits_out_bits_pad};
endmodule

