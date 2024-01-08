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

module UARTTx(
  input         clock,
                reset,
                io_en,
  output        io_in_ready,
  input         io_in_valid,
  input  [7:0]  io_in_bits,
  output        io_out,
  input  [15:0] io_div,
  input         io_nstop
);

  wire [31:0] _plusarg_reader_1_out;
  wire [31:0] _plusarg_reader_out;
  reg  [15:0] prescaler;
  reg  [3:0]  counter;
  reg  [8:0]  shifter;
  reg         out;
  wire        _io_in_ready_output = io_en & ~(|counter);
  wire        _GEN = _io_in_ready_output & io_in_valid;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if ((`PRINTF_COND_) & _GEN & (|_plusarg_reader_1_out) & ~reset)
        $fwrite(32'h80000002, "UART TX (%x): %c\n", io_in_bits, io_in_bits);
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire        pulse = prescaler == 16'h0;
  wire        _GEN_0 = _GEN & (|_plusarg_reader_out);
  wire        _GEN_1 = pulse & (|counter);
  always @(posedge clock) begin
    if (reset) begin
      prescaler <= 16'h0;
      counter <= 4'h0;
      out <= 1'h1;
    end
    else begin
      if (|counter) begin
        if (pulse)
          prescaler <= io_div;
        else
          prescaler <= prescaler - 16'h1;
      end
      if (_GEN_1) begin
        counter <= counter - 4'h1;
        out <= shifter[0];
      end
      else if (_GEN_0)
        counter <= (io_nstop ? 4'hB : 4'h0) | (io_nstop ? 4'h0 : 4'hA);
    end
    if (_GEN_1)
      shifter <= {1'h1, shifter[8:1]};
    else if (_GEN_0)
      shifter <= {io_in_bits, 1'h0};
  end // always @(posedge)
  plusarg_reader #(
    .DEFAULT(1),
    .FORMAT("uart_tx=%d"),
    .WIDTH(32)
  ) plusarg_reader (
    .out (_plusarg_reader_out)
  );
  plusarg_reader #(
    .DEFAULT(0),
    .FORMAT("uart_tx_printf=%d"),
    .WIDTH(32)
  ) plusarg_reader_1 (
    .out (_plusarg_reader_1_out)
  );
  assign io_in_ready = _io_in_ready_output;
  assign io_out = out;
endmodule

