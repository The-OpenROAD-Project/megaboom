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

module FMADecoder(
  input  [6:0] io_uopc,
  output [1:0] io_cmd
);

  wire [5:0] decoder_decoded_invInputs = ~(io_uopc[5:0]);
  assign io_cmd = {|{&{io_uopc[0], io_uopc[1], io_uopc[2], io_uopc[3], io_uopc[4], decoder_decoded_invInputs[5], io_uopc[6]}, &{decoder_decoded_invInputs[0], decoder_decoded_invInputs[1], decoder_decoded_invInputs[3], decoder_decoded_invInputs[4], io_uopc[5], io_uopc[6]}, &{io_uopc[0], io_uopc[1], decoder_decoded_invInputs[2], decoder_decoded_invInputs[3], decoder_decoded_invInputs[4], io_uopc[5], io_uopc[6]}}, |{&{decoder_decoded_invInputs[0], decoder_decoded_invInputs[1], decoder_decoded_invInputs[2], io_uopc[3], io_uopc[4], decoder_decoded_invInputs[5], io_uopc[6]}, &{io_uopc[0], io_uopc[1], io_uopc[3], io_uopc[4], decoder_decoded_invInputs[5], io_uopc[6]}, &{io_uopc[1], io_uopc[2], io_uopc[3], io_uopc[4], decoder_decoded_invInputs[5], io_uopc[6]}, &{io_uopc[1], decoder_decoded_invInputs[2], decoder_decoded_invInputs[3], decoder_decoded_invInputs[4], io_uopc[5], io_uopc[6]}}};
endmodule

