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

module TestHarness(
  input  clock,
         reset,
  output io_success
);

  wire        dtm_success;
  wire        _source_1_clk;
  wire        _source_clk;
  wire        _harnessBinderReset_catcher_io_sync_reset;
  wire [31:0] _plusarg_reader_out;
  wire        _jtag_jtag_TCK;
  wire        _jtag_jtag_TMS;
  wire        _jtag_jtag_TDI;
  wire [31:0] _jtag_exit;
  wire        _tsi_tsi_in_valid;
  wire [31:0] _tsi_tsi_in_bits;
  wire        _tsi_tsi_out_ready;
  wire [31:0] _tsi_exit;
  wire        _ram_io_ser_in_valid;
  wire [3:0]  _ram_io_ser_in_bits;
  wire        _ram_io_ser_out_ready;
  wire        _ram_io_tsi_in_ready;
  wire        _ram_io_tsi_out_valid;
  wire [31:0] _ram_io_tsi_out_bits;
  wire        _chiptop0_serial_tl_0_bits_in_ready;
  wire        _chiptop0_serial_tl_0_bits_out_valid;
  wire [3:0]  _chiptop0_serial_tl_0_bits_out_bits;
  wire        _chiptop0_jtag_TDO;
  assign dtm_success = _jtag_exit == 32'h1;
  `ifndef SYNTHESIS
    always @(posedge _source_1_clk) begin
      if (~_harnessBinderReset_catcher_io_sync_reset & (|(_tsi_exit[31:1]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: *** FAILED *** (exit code = %d)\n\n    at HarnessBinders.scala:235 assert(!error, \"*** FAILED *** (exit code = %%%%d)\\n\", exit >> 1.U)\n", {1'h0, _tsi_exit[31:1]});
        if (`STOP_COND_)
          $fatal;
      end
      if (~_harnessBinderReset_catcher_io_sync_reset & (|(_jtag_exit[31:1]))) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: *** FAILED *** (exit code = %d)\n\n    at Periphery.scala:233 assert(io.exit < 2.U, \"*** FAILED *** (exit code = %%%%d)\\n\", io.exit >> 1.U)\n", {1'h0, _jtag_exit[31:1]});
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  ChipTop chiptop0 (
    .reset_io                   (reset),
    .clock_uncore               (_source_clk),
    .serial_tl_0_clock          (_source_1_clk),
    .serial_tl_0_bits_in_ready  (_chiptop0_serial_tl_0_bits_in_ready),
    .serial_tl_0_bits_in_valid  (_ram_io_ser_in_valid),
    .serial_tl_0_bits_in_bits   (_ram_io_ser_in_bits),
    .serial_tl_0_bits_out_ready (_ram_io_ser_out_ready),
    .serial_tl_0_bits_out_valid (_chiptop0_serial_tl_0_bits_out_valid),
    .serial_tl_0_bits_out_bits  (_chiptop0_serial_tl_0_bits_out_bits),
    .jtag_TCK                   (_jtag_jtag_TCK),
    .jtag_TMS                   (_jtag_jtag_TMS),
    .jtag_TDI                   (_jtag_jtag_TDI),
    .jtag_TDO                   (_chiptop0_jtag_TDO)
  );
  SerialRAM ram (
    .clock            (_source_1_clk),
    .reset            (_harnessBinderReset_catcher_io_sync_reset),
    .io_ser_in_ready  (_chiptop0_serial_tl_0_bits_in_ready),
    .io_ser_in_valid  (_ram_io_ser_in_valid),
    .io_ser_in_bits   (_ram_io_ser_in_bits),
    .io_ser_out_ready (_ram_io_ser_out_ready),
    .io_ser_out_valid (_chiptop0_serial_tl_0_bits_out_valid),
    .io_ser_out_bits  (_chiptop0_serial_tl_0_bits_out_bits),
    .io_tsi_in_ready  (_ram_io_tsi_in_ready),
    .io_tsi_in_valid  (_tsi_tsi_in_valid),
    .io_tsi_in_bits   (_tsi_tsi_in_bits),
    .io_tsi_out_ready (_tsi_tsi_out_ready),
    .io_tsi_out_valid (_ram_io_tsi_out_valid),
    .io_tsi_out_bits  (_ram_io_tsi_out_bits)
  );
  SimTSI tsi (
    .clock         (_source_1_clk),
    .reset         (_harnessBinderReset_catcher_io_sync_reset),
    .tsi_in_ready  (_ram_io_tsi_in_ready),
    .tsi_in_valid  (_tsi_tsi_in_valid),
    .tsi_in_bits   (_tsi_tsi_in_bits),
    .tsi_out_ready (_tsi_tsi_out_ready),
    .tsi_out_valid (_ram_io_tsi_out_valid),
    .tsi_out_bits  (_ram_io_tsi_out_bits),
    .exit          (_tsi_exit)
  );
  SimJTAG #(
    .TICK_DELAY(3)
  ) jtag (
    .clock           (_source_1_clk),
    .reset           (_harnessBinderReset_catcher_io_sync_reset),
    .jtag_TRSTn      (/* unused */),
    .jtag_TCK        (_jtag_jtag_TCK),
    .jtag_TMS        (_jtag_jtag_TMS),
    .jtag_TDI        (_jtag_jtag_TDI),
    .jtag_TDO_data   (_chiptop0_jtag_TDO),
    .jtag_TDO_driven (1'h1),
    .enable          (_plusarg_reader_out[0]),
    .init_done       (~_harnessBinderReset_catcher_io_sync_reset),
    .exit            (_jtag_exit)
  );
  plusarg_reader #(
    .DEFAULT(0),
    .FORMAT("jtag_rbb_enable=%d"),
    .WIDTH(32)
  ) plusarg_reader (
    .out (_plusarg_reader_out)
  );
  ResetCatchAndSync_d3 harnessBinderReset_catcher (
    .clock         (_source_1_clk),
    .reset         (reset),
    .io_sync_reset (_harnessBinderReset_catcher_io_sync_reset)
  );
  ClockSourceAtFreqMHz #(
    .PERIOD(2.000000e+00)
  ) source (
    .power (1'h1),
    .gate  (1'h0),
    .clk   (_source_clk)
  );
  ClockSourceAtFreqMHz #(
    .PERIOD(1.000000e+01)
  ) source_1 (
    .power (1'h1),
    .gate  (1'h0),
    .clk   (_source_1_clk)
  );
  assign io_success = dtm_success | _tsi_exit == 32'h1;
endmodule

