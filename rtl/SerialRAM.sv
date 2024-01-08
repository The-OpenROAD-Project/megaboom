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

module SerialRAM(
  input         clock,
                reset,
                io_ser_in_ready,
  output        io_ser_in_valid,
  output [3:0]  io_ser_in_bits,
  output        io_ser_out_ready,
  input         io_ser_out_valid,
  input  [3:0]  io_ser_out_bits,
  output        io_tsi_in_ready,
  input         io_tsi_in_valid,
  input  [31:0] io_tsi_in_bits,
  input         io_tsi_out_ready,
  output        io_tsi_out_valid,
  output [31:0] io_tsi_out_bits
);

  wire        _broadcast_auto_in_a_ready;
  wire        _broadcast_auto_in_d_valid;
  wire [2:0]  _broadcast_auto_in_d_bits_opcode;
  wire [1:0]  _broadcast_auto_in_d_bits_param;
  wire [2:0]  _broadcast_auto_in_d_bits_size;
  wire [3:0]  _broadcast_auto_in_d_bits_source;
  wire [1:0]  _broadcast_auto_in_d_bits_sink;
  wire        _broadcast_auto_in_d_bits_denied;
  wire [63:0] _broadcast_auto_in_d_bits_data;
  wire        _broadcast_auto_in_d_bits_corrupt;
  wire        _broadcast_auto_out_a_valid;
  wire [2:0]  _broadcast_auto_out_a_bits_opcode;
  wire [2:0]  _broadcast_auto_out_a_bits_param;
  wire [2:0]  _broadcast_auto_out_a_bits_size;
  wire [5:0]  _broadcast_auto_out_a_bits_source;
  wire [32:0] _broadcast_auto_out_a_bits_address;
  wire [7:0]  _broadcast_auto_out_a_bits_mask;
  wire [63:0] _broadcast_auto_out_a_bits_data;
  wire        _broadcast_auto_out_d_ready;
  wire        _fragmenter_1_auto_in_a_ready;
  wire        _fragmenter_1_auto_in_d_valid;
  wire [2:0]  _fragmenter_1_auto_in_d_bits_opcode;
  wire [1:0]  _fragmenter_1_auto_in_d_bits_param;
  wire [2:0]  _fragmenter_1_auto_in_d_bits_size;
  wire [5:0]  _fragmenter_1_auto_in_d_bits_source;
  wire        _fragmenter_1_auto_in_d_bits_sink;
  wire        _fragmenter_1_auto_in_d_bits_denied;
  wire [63:0] _fragmenter_1_auto_in_d_bits_data;
  wire        _fragmenter_1_auto_in_d_bits_corrupt;
  wire        _fragmenter_1_auto_out_a_valid;
  wire [2:0]  _fragmenter_1_auto_out_a_bits_opcode;
  wire [2:0]  _fragmenter_1_auto_out_a_bits_param;
  wire [1:0]  _fragmenter_1_auto_out_a_bits_size;
  wire [9:0]  _fragmenter_1_auto_out_a_bits_source;
  wire [32:0] _fragmenter_1_auto_out_a_bits_address;
  wire [7:0]  _fragmenter_1_auto_out_a_bits_mask;
  wire [63:0] _fragmenter_1_auto_out_a_bits_data;
  wire        _fragmenter_1_auto_out_d_ready;
  wire        _buffer_2_auto_in_a_ready;
  wire        _buffer_2_auto_in_d_valid;
  wire [2:0]  _buffer_2_auto_in_d_bits_opcode;
  wire [1:0]  _buffer_2_auto_in_d_bits_param;
  wire [1:0]  _buffer_2_auto_in_d_bits_size;
  wire [9:0]  _buffer_2_auto_in_d_bits_source;
  wire        _buffer_2_auto_in_d_bits_sink;
  wire        _buffer_2_auto_in_d_bits_denied;
  wire [63:0] _buffer_2_auto_in_d_bits_data;
  wire        _buffer_2_auto_in_d_bits_corrupt;
  wire        _buffer_2_auto_out_a_valid;
  wire [2:0]  _buffer_2_auto_out_a_bits_opcode;
  wire [2:0]  _buffer_2_auto_out_a_bits_param;
  wire [1:0]  _buffer_2_auto_out_a_bits_size;
  wire [9:0]  _buffer_2_auto_out_a_bits_source;
  wire [32:0] _buffer_2_auto_out_a_bits_address;
  wire [7:0]  _buffer_2_auto_out_a_bits_mask;
  wire [63:0] _buffer_2_auto_out_a_bits_data;
  wire        _buffer_2_auto_out_a_bits_corrupt;
  wire        _buffer_2_auto_out_d_ready;
  wire        _fragmenter_auto_in_a_ready;
  wire        _fragmenter_auto_in_d_valid;
  wire [2:0]  _fragmenter_auto_in_d_bits_opcode;
  wire [1:0]  _fragmenter_auto_in_d_bits_param;
  wire [2:0]  _fragmenter_auto_in_d_bits_size;
  wire [5:0]  _fragmenter_auto_in_d_bits_source;
  wire        _fragmenter_auto_in_d_bits_sink;
  wire        _fragmenter_auto_in_d_bits_denied;
  wire [63:0] _fragmenter_auto_in_d_bits_data;
  wire        _fragmenter_auto_in_d_bits_corrupt;
  wire        _fragmenter_auto_out_a_valid;
  wire [2:0]  _fragmenter_auto_out_a_bits_opcode;
  wire [2:0]  _fragmenter_auto_out_a_bits_param;
  wire [1:0]  _fragmenter_auto_out_a_bits_size;
  wire [9:0]  _fragmenter_auto_out_a_bits_source;
  wire [31:0] _fragmenter_auto_out_a_bits_address;
  wire [7:0]  _fragmenter_auto_out_a_bits_mask;
  wire [63:0] _fragmenter_auto_out_a_bits_data;
  wire        _fragmenter_auto_out_d_ready;
  wire        _buffer_1_auto_in_a_ready;
  wire        _buffer_1_auto_in_d_valid;
  wire [2:0]  _buffer_1_auto_in_d_bits_opcode;
  wire [1:0]  _buffer_1_auto_in_d_bits_param;
  wire [1:0]  _buffer_1_auto_in_d_bits_size;
  wire [9:0]  _buffer_1_auto_in_d_bits_source;
  wire        _buffer_1_auto_in_d_bits_sink;
  wire        _buffer_1_auto_in_d_bits_denied;
  wire [63:0] _buffer_1_auto_in_d_bits_data;
  wire        _buffer_1_auto_in_d_bits_corrupt;
  wire        _buffer_1_auto_out_a_valid;
  wire [2:0]  _buffer_1_auto_out_a_bits_opcode;
  wire [2:0]  _buffer_1_auto_out_a_bits_param;
  wire [1:0]  _buffer_1_auto_out_a_bits_size;
  wire [9:0]  _buffer_1_auto_out_a_bits_source;
  wire [31:0] _buffer_1_auto_out_a_bits_address;
  wire [7:0]  _buffer_1_auto_out_a_bits_mask;
  wire [63:0] _buffer_1_auto_out_a_bits_data;
  wire        _buffer_1_auto_out_a_bits_corrupt;
  wire        _buffer_1_auto_out_d_ready;
  wire        _srams_1_auto_in_a_ready;
  wire        _srams_1_auto_in_d_valid;
  wire [2:0]  _srams_1_auto_in_d_bits_opcode;
  wire [1:0]  _srams_1_auto_in_d_bits_size;
  wire [9:0]  _srams_1_auto_in_d_bits_source;
  wire [63:0] _srams_1_auto_in_d_bits_data;
  wire        _srams_auto_in_a_ready;
  wire        _srams_auto_in_d_valid;
  wire [2:0]  _srams_auto_in_d_bits_opcode;
  wire [1:0]  _srams_auto_in_d_bits_size;
  wire [9:0]  _srams_auto_in_d_bits_source;
  wire [63:0] _srams_auto_in_d_bits_data;
  wire        _xbar_auto_in_a_ready;
  wire        _xbar_auto_in_d_valid;
  wire [2:0]  _xbar_auto_in_d_bits_opcode;
  wire [1:0]  _xbar_auto_in_d_bits_param;
  wire [2:0]  _xbar_auto_in_d_bits_size;
  wire [5:0]  _xbar_auto_in_d_bits_source;
  wire        _xbar_auto_in_d_bits_denied;
  wire [63:0] _xbar_auto_in_d_bits_data;
  wire        _xbar_auto_in_d_bits_corrupt;
  wire        _xbar_auto_out_1_a_valid;
  wire [2:0]  _xbar_auto_out_1_a_bits_opcode;
  wire [2:0]  _xbar_auto_out_1_a_bits_param;
  wire [2:0]  _xbar_auto_out_1_a_bits_size;
  wire [5:0]  _xbar_auto_out_1_a_bits_source;
  wire [32:0] _xbar_auto_out_1_a_bits_address;
  wire [7:0]  _xbar_auto_out_1_a_bits_mask;
  wire [63:0] _xbar_auto_out_1_a_bits_data;
  wire        _xbar_auto_out_1_d_ready;
  wire        _xbar_auto_out_0_a_valid;
  wire [2:0]  _xbar_auto_out_0_a_bits_opcode;
  wire [2:0]  _xbar_auto_out_0_a_bits_param;
  wire [2:0]  _xbar_auto_out_0_a_bits_size;
  wire [5:0]  _xbar_auto_out_0_a_bits_source;
  wire [31:0] _xbar_auto_out_0_a_bits_address;
  wire [7:0]  _xbar_auto_out_0_a_bits_mask;
  wire [63:0] _xbar_auto_out_0_a_bits_data;
  wire        _xbar_auto_out_0_d_ready;
  wire        _buffer_auto_in_a_ready;
  wire        _buffer_auto_in_d_valid;
  wire [63:0] _buffer_auto_in_d_bits_data;
  wire        _buffer_auto_out_a_valid;
  wire [2:0]  _buffer_auto_out_a_bits_opcode;
  wire [2:0]  _buffer_auto_out_a_bits_param;
  wire [3:0]  _buffer_auto_out_a_bits_size;
  wire        _buffer_auto_out_a_bits_source;
  wire [32:0] _buffer_auto_out_a_bits_address;
  wire [7:0]  _buffer_auto_out_a_bits_mask;
  wire [63:0] _buffer_auto_out_a_bits_data;
  wire        _buffer_auto_out_a_bits_corrupt;
  wire        _buffer_auto_out_d_ready;
  wire        _tsi2tl_auto_out_a_valid;
  wire [2:0]  _tsi2tl_auto_out_a_bits_opcode;
  wire [3:0]  _tsi2tl_auto_out_a_bits_size;
  wire [32:0] _tsi2tl_auto_out_a_bits_address;
  wire [7:0]  _tsi2tl_auto_out_a_bits_mask;
  wire [63:0] _tsi2tl_auto_out_a_bits_data;
  wire        _tsi2tl_auto_out_d_ready;
  wire        _serdesser_auto_manager_in_a_ready;
  wire        _serdesser_auto_manager_in_d_valid;
  wire [2:0]  _serdesser_auto_manager_in_d_bits_opcode;
  wire [1:0]  _serdesser_auto_manager_in_d_bits_param;
  wire [3:0]  _serdesser_auto_manager_in_d_bits_size;
  wire        _serdesser_auto_manager_in_d_bits_source;
  wire [2:0]  _serdesser_auto_manager_in_d_bits_sink;
  wire        _serdesser_auto_manager_in_d_bits_denied;
  wire [63:0] _serdesser_auto_manager_in_d_bits_data;
  wire        _serdesser_auto_manager_in_d_bits_corrupt;
  wire        _serdesser_auto_client_out_a_valid;
  wire [2:0]  _serdesser_auto_client_out_a_bits_opcode;
  wire [2:0]  _serdesser_auto_client_out_a_bits_param;
  wire [2:0]  _serdesser_auto_client_out_a_bits_size;
  wire [3:0]  _serdesser_auto_client_out_a_bits_source;
  wire [32:0] _serdesser_auto_client_out_a_bits_address;
  wire [7:0]  _serdesser_auto_client_out_a_bits_mask;
  wire [63:0] _serdesser_auto_client_out_a_bits_data;
  wire        _serdesser_auto_client_out_a_bits_corrupt;
  wire        _serdesser_auto_client_out_d_ready;
  TLSerdesser_1 serdesser (
    .clock                          (clock),
    .reset                          (reset),
    .auto_manager_in_a_ready        (_serdesser_auto_manager_in_a_ready),
    .auto_manager_in_a_valid        (_buffer_auto_out_a_valid),
    .auto_manager_in_a_bits_opcode  (_buffer_auto_out_a_bits_opcode),
    .auto_manager_in_a_bits_param   (_buffer_auto_out_a_bits_param),
    .auto_manager_in_a_bits_size    (_buffer_auto_out_a_bits_size),
    .auto_manager_in_a_bits_source  (_buffer_auto_out_a_bits_source),
    .auto_manager_in_a_bits_address (_buffer_auto_out_a_bits_address),
    .auto_manager_in_a_bits_mask    (_buffer_auto_out_a_bits_mask),
    .auto_manager_in_a_bits_data    (_buffer_auto_out_a_bits_data),
    .auto_manager_in_a_bits_corrupt (_buffer_auto_out_a_bits_corrupt),
    .auto_manager_in_d_ready        (_buffer_auto_out_d_ready),
    .auto_manager_in_d_valid        (_serdesser_auto_manager_in_d_valid),
    .auto_manager_in_d_bits_opcode  (_serdesser_auto_manager_in_d_bits_opcode),
    .auto_manager_in_d_bits_param   (_serdesser_auto_manager_in_d_bits_param),
    .auto_manager_in_d_bits_size    (_serdesser_auto_manager_in_d_bits_size),
    .auto_manager_in_d_bits_source  (_serdesser_auto_manager_in_d_bits_source),
    .auto_manager_in_d_bits_sink    (_serdesser_auto_manager_in_d_bits_sink),
    .auto_manager_in_d_bits_denied  (_serdesser_auto_manager_in_d_bits_denied),
    .auto_manager_in_d_bits_data    (_serdesser_auto_manager_in_d_bits_data),
    .auto_manager_in_d_bits_corrupt (_serdesser_auto_manager_in_d_bits_corrupt),
    .auto_client_out_a_ready        (_broadcast_auto_in_a_ready),
    .auto_client_out_a_valid        (_serdesser_auto_client_out_a_valid),
    .auto_client_out_a_bits_opcode  (_serdesser_auto_client_out_a_bits_opcode),
    .auto_client_out_a_bits_param   (_serdesser_auto_client_out_a_bits_param),
    .auto_client_out_a_bits_size    (_serdesser_auto_client_out_a_bits_size),
    .auto_client_out_a_bits_source  (_serdesser_auto_client_out_a_bits_source),
    .auto_client_out_a_bits_address (_serdesser_auto_client_out_a_bits_address),
    .auto_client_out_a_bits_mask    (_serdesser_auto_client_out_a_bits_mask),
    .auto_client_out_a_bits_data    (_serdesser_auto_client_out_a_bits_data),
    .auto_client_out_a_bits_corrupt (_serdesser_auto_client_out_a_bits_corrupt),
    .auto_client_out_d_ready        (_serdesser_auto_client_out_d_ready),
    .auto_client_out_d_valid        (_broadcast_auto_in_d_valid),
    .auto_client_out_d_bits_opcode  (_broadcast_auto_in_d_bits_opcode),
    .auto_client_out_d_bits_param   (_broadcast_auto_in_d_bits_param),
    .auto_client_out_d_bits_size    (_broadcast_auto_in_d_bits_size),
    .auto_client_out_d_bits_source  (_broadcast_auto_in_d_bits_source),
    .auto_client_out_d_bits_sink    (_broadcast_auto_in_d_bits_sink),
    .auto_client_out_d_bits_denied  (_broadcast_auto_in_d_bits_denied),
    .auto_client_out_d_bits_data    (_broadcast_auto_in_d_bits_data),
    .auto_client_out_d_bits_corrupt (_broadcast_auto_in_d_bits_corrupt),
    .io_ser_in_ready                (io_ser_out_ready),
    .io_ser_in_valid                (io_ser_out_valid),
    .io_ser_in_bits                 (io_ser_out_bits),
    .io_ser_out_ready               (io_ser_in_ready),
    .io_ser_out_valid               (io_ser_in_valid),
    .io_ser_out_bits                (io_ser_in_bits)
  );
  TSIToTileLink tsi2tl (
    .clock                   (clock),
    .reset                   (reset),
    .auto_out_a_ready        (_buffer_auto_in_a_ready),
    .auto_out_a_valid        (_tsi2tl_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_tsi2tl_auto_out_a_bits_opcode),
    .auto_out_a_bits_size    (_tsi2tl_auto_out_a_bits_size),
    .auto_out_a_bits_address (_tsi2tl_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_tsi2tl_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_tsi2tl_auto_out_a_bits_data),
    .auto_out_d_ready        (_tsi2tl_auto_out_d_ready),
    .auto_out_d_valid        (_buffer_auto_in_d_valid),
    .auto_out_d_bits_data    (_buffer_auto_in_d_bits_data),
    .io_tsi_in_ready         (io_tsi_in_ready),
    .io_tsi_in_valid         (io_tsi_in_valid),
    .io_tsi_in_bits          (io_tsi_in_bits),
    .io_tsi_out_ready        (io_tsi_out_ready),
    .io_tsi_out_valid        (io_tsi_out_valid),
    .io_tsi_out_bits         (io_tsi_out_bits)
  );
  TLBuffer_20 buffer (
    .clock                   (clock),
    .reset                   (reset),
    .auto_in_a_ready         (_buffer_auto_in_a_ready),
    .auto_in_a_valid         (_tsi2tl_auto_out_a_valid),
    .auto_in_a_bits_opcode   (_tsi2tl_auto_out_a_bits_opcode),
    .auto_in_a_bits_size     (_tsi2tl_auto_out_a_bits_size),
    .auto_in_a_bits_address  (_tsi2tl_auto_out_a_bits_address),
    .auto_in_a_bits_mask     (_tsi2tl_auto_out_a_bits_mask),
    .auto_in_a_bits_data     (_tsi2tl_auto_out_a_bits_data),
    .auto_in_d_ready         (_tsi2tl_auto_out_d_ready),
    .auto_in_d_valid         (_buffer_auto_in_d_valid),
    .auto_in_d_bits_data     (_buffer_auto_in_d_bits_data),
    .auto_out_a_ready        (_serdesser_auto_manager_in_a_ready),
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
    .auto_out_d_valid        (_serdesser_auto_manager_in_d_valid),
    .auto_out_d_bits_opcode  (_serdesser_auto_manager_in_d_bits_opcode),
    .auto_out_d_bits_param   (_serdesser_auto_manager_in_d_bits_param),
    .auto_out_d_bits_size    (_serdesser_auto_manager_in_d_bits_size),
    .auto_out_d_bits_source  (_serdesser_auto_manager_in_d_bits_source),
    .auto_out_d_bits_sink    (_serdesser_auto_manager_in_d_bits_sink),
    .auto_out_d_bits_denied  (_serdesser_auto_manager_in_d_bits_denied),
    .auto_out_d_bits_data    (_serdesser_auto_manager_in_d_bits_data),
    .auto_out_d_bits_corrupt (_serdesser_auto_manager_in_d_bits_corrupt)
  );
  TLXbar_13 xbar (
    .clock                     (clock),
    .reset                     (reset),
    .auto_in_a_ready           (_xbar_auto_in_a_ready),
    .auto_in_a_valid           (_broadcast_auto_out_a_valid),
    .auto_in_a_bits_opcode     (_broadcast_auto_out_a_bits_opcode),
    .auto_in_a_bits_param      (_broadcast_auto_out_a_bits_param),
    .auto_in_a_bits_size       (_broadcast_auto_out_a_bits_size),
    .auto_in_a_bits_source     (_broadcast_auto_out_a_bits_source),
    .auto_in_a_bits_address    (_broadcast_auto_out_a_bits_address),
    .auto_in_a_bits_mask       (_broadcast_auto_out_a_bits_mask),
    .auto_in_a_bits_data       (_broadcast_auto_out_a_bits_data),
    .auto_in_d_ready           (_broadcast_auto_out_d_ready),
    .auto_in_d_valid           (_xbar_auto_in_d_valid),
    .auto_in_d_bits_opcode     (_xbar_auto_in_d_bits_opcode),
    .auto_in_d_bits_param      (_xbar_auto_in_d_bits_param),
    .auto_in_d_bits_size       (_xbar_auto_in_d_bits_size),
    .auto_in_d_bits_source     (_xbar_auto_in_d_bits_source),
    .auto_in_d_bits_denied     (_xbar_auto_in_d_bits_denied),
    .auto_in_d_bits_data       (_xbar_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt    (_xbar_auto_in_d_bits_corrupt),
    .auto_out_1_a_ready        (_fragmenter_1_auto_in_a_ready),
    .auto_out_1_a_valid        (_xbar_auto_out_1_a_valid),
    .auto_out_1_a_bits_opcode  (_xbar_auto_out_1_a_bits_opcode),
    .auto_out_1_a_bits_param   (_xbar_auto_out_1_a_bits_param),
    .auto_out_1_a_bits_size    (_xbar_auto_out_1_a_bits_size),
    .auto_out_1_a_bits_source  (_xbar_auto_out_1_a_bits_source),
    .auto_out_1_a_bits_address (_xbar_auto_out_1_a_bits_address),
    .auto_out_1_a_bits_mask    (_xbar_auto_out_1_a_bits_mask),
    .auto_out_1_a_bits_data    (_xbar_auto_out_1_a_bits_data),
    .auto_out_1_d_ready        (_xbar_auto_out_1_d_ready),
    .auto_out_1_d_valid        (_fragmenter_1_auto_in_d_valid),
    .auto_out_1_d_bits_opcode  (_fragmenter_1_auto_in_d_bits_opcode),
    .auto_out_1_d_bits_param   (_fragmenter_1_auto_in_d_bits_param),
    .auto_out_1_d_bits_size    (_fragmenter_1_auto_in_d_bits_size),
    .auto_out_1_d_bits_source  (_fragmenter_1_auto_in_d_bits_source),
    .auto_out_1_d_bits_sink    (_fragmenter_1_auto_in_d_bits_sink),
    .auto_out_1_d_bits_denied  (_fragmenter_1_auto_in_d_bits_denied),
    .auto_out_1_d_bits_data    (_fragmenter_1_auto_in_d_bits_data),
    .auto_out_1_d_bits_corrupt (_fragmenter_1_auto_in_d_bits_corrupt),
    .auto_out_0_a_ready        (_fragmenter_auto_in_a_ready),
    .auto_out_0_a_valid        (_xbar_auto_out_0_a_valid),
    .auto_out_0_a_bits_opcode  (_xbar_auto_out_0_a_bits_opcode),
    .auto_out_0_a_bits_param   (_xbar_auto_out_0_a_bits_param),
    .auto_out_0_a_bits_size    (_xbar_auto_out_0_a_bits_size),
    .auto_out_0_a_bits_source  (_xbar_auto_out_0_a_bits_source),
    .auto_out_0_a_bits_address (_xbar_auto_out_0_a_bits_address),
    .auto_out_0_a_bits_mask    (_xbar_auto_out_0_a_bits_mask),
    .auto_out_0_a_bits_data    (_xbar_auto_out_0_a_bits_data),
    .auto_out_0_d_ready        (_xbar_auto_out_0_d_ready),
    .auto_out_0_d_valid        (_fragmenter_auto_in_d_valid),
    .auto_out_0_d_bits_opcode  (_fragmenter_auto_in_d_bits_opcode),
    .auto_out_0_d_bits_param   (_fragmenter_auto_in_d_bits_param),
    .auto_out_0_d_bits_size    (_fragmenter_auto_in_d_bits_size),
    .auto_out_0_d_bits_source  (_fragmenter_auto_in_d_bits_source),
    .auto_out_0_d_bits_sink    (_fragmenter_auto_in_d_bits_sink),
    .auto_out_0_d_bits_denied  (_fragmenter_auto_in_d_bits_denied),
    .auto_out_0_d_bits_data    (_fragmenter_auto_in_d_bits_data),
    .auto_out_0_d_bits_corrupt (_fragmenter_auto_in_d_bits_corrupt)
  );
  TLRAM_1 srams (
    .clock                  (clock),
    .reset                  (reset),
    .auto_in_a_ready        (_srams_auto_in_a_ready),
    .auto_in_a_valid        (_buffer_1_auto_out_a_valid),
    .auto_in_a_bits_opcode  (_buffer_1_auto_out_a_bits_opcode),
    .auto_in_a_bits_param   (_buffer_1_auto_out_a_bits_param),
    .auto_in_a_bits_size    (_buffer_1_auto_out_a_bits_size),
    .auto_in_a_bits_source  (_buffer_1_auto_out_a_bits_source),
    .auto_in_a_bits_address (_buffer_1_auto_out_a_bits_address),
    .auto_in_a_bits_mask    (_buffer_1_auto_out_a_bits_mask),
    .auto_in_a_bits_data    (_buffer_1_auto_out_a_bits_data),
    .auto_in_a_bits_corrupt (_buffer_1_auto_out_a_bits_corrupt),
    .auto_in_d_ready        (_buffer_1_auto_out_d_ready),
    .auto_in_d_valid        (_srams_auto_in_d_valid),
    .auto_in_d_bits_opcode  (_srams_auto_in_d_bits_opcode),
    .auto_in_d_bits_size    (_srams_auto_in_d_bits_size),
    .auto_in_d_bits_source  (_srams_auto_in_d_bits_source),
    .auto_in_d_bits_data    (_srams_auto_in_d_bits_data)
  );
  TLRAM_2 srams_1 (
    .clock                  (clock),
    .reset                  (reset),
    .auto_in_a_ready        (_srams_1_auto_in_a_ready),
    .auto_in_a_valid        (_buffer_2_auto_out_a_valid),
    .auto_in_a_bits_opcode  (_buffer_2_auto_out_a_bits_opcode),
    .auto_in_a_bits_param   (_buffer_2_auto_out_a_bits_param),
    .auto_in_a_bits_size    (_buffer_2_auto_out_a_bits_size),
    .auto_in_a_bits_source  (_buffer_2_auto_out_a_bits_source),
    .auto_in_a_bits_address (_buffer_2_auto_out_a_bits_address),
    .auto_in_a_bits_mask    (_buffer_2_auto_out_a_bits_mask),
    .auto_in_a_bits_data    (_buffer_2_auto_out_a_bits_data),
    .auto_in_a_bits_corrupt (_buffer_2_auto_out_a_bits_corrupt),
    .auto_in_d_ready        (_buffer_2_auto_out_d_ready),
    .auto_in_d_valid        (_srams_1_auto_in_d_valid),
    .auto_in_d_bits_opcode  (_srams_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_size    (_srams_1_auto_in_d_bits_size),
    .auto_in_d_bits_source  (_srams_1_auto_in_d_bits_source),
    .auto_in_d_bits_data    (_srams_1_auto_in_d_bits_data)
  );
  TLBuffer_21 buffer_1 (
    .clock                   (clock),
    .reset                   (reset),
    .auto_in_a_ready         (_buffer_1_auto_in_a_ready),
    .auto_in_a_valid         (_fragmenter_auto_out_a_valid),
    .auto_in_a_bits_opcode   (_fragmenter_auto_out_a_bits_opcode),
    .auto_in_a_bits_param    (_fragmenter_auto_out_a_bits_param),
    .auto_in_a_bits_size     (_fragmenter_auto_out_a_bits_size),
    .auto_in_a_bits_source   (_fragmenter_auto_out_a_bits_source),
    .auto_in_a_bits_address  (_fragmenter_auto_out_a_bits_address),
    .auto_in_a_bits_mask     (_fragmenter_auto_out_a_bits_mask),
    .auto_in_a_bits_data     (_fragmenter_auto_out_a_bits_data),
    .auto_in_d_ready         (_fragmenter_auto_out_d_ready),
    .auto_in_d_valid         (_buffer_1_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_buffer_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_buffer_1_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_buffer_1_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_buffer_1_auto_in_d_bits_source),
    .auto_in_d_bits_sink     (_buffer_1_auto_in_d_bits_sink),
    .auto_in_d_bits_denied   (_buffer_1_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_buffer_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_buffer_1_auto_in_d_bits_corrupt),
    .auto_out_a_ready        (_srams_auto_in_a_ready),
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
    .auto_out_d_valid        (_srams_auto_in_d_valid),
    .auto_out_d_bits_opcode  (_srams_auto_in_d_bits_opcode),
    .auto_out_d_bits_size    (_srams_auto_in_d_bits_size),
    .auto_out_d_bits_source  (_srams_auto_in_d_bits_source),
    .auto_out_d_bits_data    (_srams_auto_in_d_bits_data)
  );
  TLFragmenter_13 fragmenter (
    .clock                   (clock),
    .reset                   (reset),
    .auto_in_a_ready         (_fragmenter_auto_in_a_ready),
    .auto_in_a_valid         (_xbar_auto_out_0_a_valid),
    .auto_in_a_bits_opcode   (_xbar_auto_out_0_a_bits_opcode),
    .auto_in_a_bits_param    (_xbar_auto_out_0_a_bits_param),
    .auto_in_a_bits_size     (_xbar_auto_out_0_a_bits_size),
    .auto_in_a_bits_source   (_xbar_auto_out_0_a_bits_source),
    .auto_in_a_bits_address  (_xbar_auto_out_0_a_bits_address),
    .auto_in_a_bits_mask     (_xbar_auto_out_0_a_bits_mask),
    .auto_in_a_bits_data     (_xbar_auto_out_0_a_bits_data),
    .auto_in_d_ready         (_xbar_auto_out_0_d_ready),
    .auto_in_d_valid         (_fragmenter_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_fragmenter_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_fragmenter_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_fragmenter_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_fragmenter_auto_in_d_bits_source),
    .auto_in_d_bits_sink     (_fragmenter_auto_in_d_bits_sink),
    .auto_in_d_bits_denied   (_fragmenter_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_fragmenter_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_fragmenter_auto_in_d_bits_corrupt),
    .auto_out_a_ready        (_buffer_1_auto_in_a_ready),
    .auto_out_a_valid        (_fragmenter_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_fragmenter_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_fragmenter_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_fragmenter_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_fragmenter_auto_out_a_bits_source),
    .auto_out_a_bits_address (_fragmenter_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_fragmenter_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_fragmenter_auto_out_a_bits_data),
    .auto_out_d_ready        (_fragmenter_auto_out_d_ready),
    .auto_out_d_valid        (_buffer_1_auto_in_d_valid),
    .auto_out_d_bits_opcode  (_buffer_1_auto_in_d_bits_opcode),
    .auto_out_d_bits_param   (_buffer_1_auto_in_d_bits_param),
    .auto_out_d_bits_size    (_buffer_1_auto_in_d_bits_size),
    .auto_out_d_bits_source  (_buffer_1_auto_in_d_bits_source),
    .auto_out_d_bits_sink    (_buffer_1_auto_in_d_bits_sink),
    .auto_out_d_bits_denied  (_buffer_1_auto_in_d_bits_denied),
    .auto_out_d_bits_data    (_buffer_1_auto_in_d_bits_data),
    .auto_out_d_bits_corrupt (_buffer_1_auto_in_d_bits_corrupt)
  );
  TLBuffer_22 buffer_2 (
    .clock                   (clock),
    .reset                   (reset),
    .auto_in_a_ready         (_buffer_2_auto_in_a_ready),
    .auto_in_a_valid         (_fragmenter_1_auto_out_a_valid),
    .auto_in_a_bits_opcode   (_fragmenter_1_auto_out_a_bits_opcode),
    .auto_in_a_bits_param    (_fragmenter_1_auto_out_a_bits_param),
    .auto_in_a_bits_size     (_fragmenter_1_auto_out_a_bits_size),
    .auto_in_a_bits_source   (_fragmenter_1_auto_out_a_bits_source),
    .auto_in_a_bits_address  (_fragmenter_1_auto_out_a_bits_address),
    .auto_in_a_bits_mask     (_fragmenter_1_auto_out_a_bits_mask),
    .auto_in_a_bits_data     (_fragmenter_1_auto_out_a_bits_data),
    .auto_in_d_ready         (_fragmenter_1_auto_out_d_ready),
    .auto_in_d_valid         (_buffer_2_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_buffer_2_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_buffer_2_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_buffer_2_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_buffer_2_auto_in_d_bits_source),
    .auto_in_d_bits_sink     (_buffer_2_auto_in_d_bits_sink),
    .auto_in_d_bits_denied   (_buffer_2_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_buffer_2_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_buffer_2_auto_in_d_bits_corrupt),
    .auto_out_a_ready        (_srams_1_auto_in_a_ready),
    .auto_out_a_valid        (_buffer_2_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_buffer_2_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_buffer_2_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_buffer_2_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_buffer_2_auto_out_a_bits_source),
    .auto_out_a_bits_address (_buffer_2_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_buffer_2_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_buffer_2_auto_out_a_bits_data),
    .auto_out_a_bits_corrupt (_buffer_2_auto_out_a_bits_corrupt),
    .auto_out_d_ready        (_buffer_2_auto_out_d_ready),
    .auto_out_d_valid        (_srams_1_auto_in_d_valid),
    .auto_out_d_bits_opcode  (_srams_1_auto_in_d_bits_opcode),
    .auto_out_d_bits_size    (_srams_1_auto_in_d_bits_size),
    .auto_out_d_bits_source  (_srams_1_auto_in_d_bits_source),
    .auto_out_d_bits_data    (_srams_1_auto_in_d_bits_data)
  );
  TLFragmenter_14 fragmenter_1 (
    .clock                   (clock),
    .reset                   (reset),
    .auto_in_a_ready         (_fragmenter_1_auto_in_a_ready),
    .auto_in_a_valid         (_xbar_auto_out_1_a_valid),
    .auto_in_a_bits_opcode   (_xbar_auto_out_1_a_bits_opcode),
    .auto_in_a_bits_param    (_xbar_auto_out_1_a_bits_param),
    .auto_in_a_bits_size     (_xbar_auto_out_1_a_bits_size),
    .auto_in_a_bits_source   (_xbar_auto_out_1_a_bits_source),
    .auto_in_a_bits_address  (_xbar_auto_out_1_a_bits_address),
    .auto_in_a_bits_mask     (_xbar_auto_out_1_a_bits_mask),
    .auto_in_a_bits_data     (_xbar_auto_out_1_a_bits_data),
    .auto_in_d_ready         (_xbar_auto_out_1_d_ready),
    .auto_in_d_valid         (_fragmenter_1_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_fragmenter_1_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_fragmenter_1_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_fragmenter_1_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_fragmenter_1_auto_in_d_bits_source),
    .auto_in_d_bits_sink     (_fragmenter_1_auto_in_d_bits_sink),
    .auto_in_d_bits_denied   (_fragmenter_1_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_fragmenter_1_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_fragmenter_1_auto_in_d_bits_corrupt),
    .auto_out_a_ready        (_buffer_2_auto_in_a_ready),
    .auto_out_a_valid        (_fragmenter_1_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_fragmenter_1_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_fragmenter_1_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_fragmenter_1_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_fragmenter_1_auto_out_a_bits_source),
    .auto_out_a_bits_address (_fragmenter_1_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_fragmenter_1_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_fragmenter_1_auto_out_a_bits_data),
    .auto_out_d_ready        (_fragmenter_1_auto_out_d_ready),
    .auto_out_d_valid        (_buffer_2_auto_in_d_valid),
    .auto_out_d_bits_opcode  (_buffer_2_auto_in_d_bits_opcode),
    .auto_out_d_bits_param   (_buffer_2_auto_in_d_bits_param),
    .auto_out_d_bits_size    (_buffer_2_auto_in_d_bits_size),
    .auto_out_d_bits_source  (_buffer_2_auto_in_d_bits_source),
    .auto_out_d_bits_sink    (_buffer_2_auto_in_d_bits_sink),
    .auto_out_d_bits_denied  (_buffer_2_auto_in_d_bits_denied),
    .auto_out_d_bits_data    (_buffer_2_auto_in_d_bits_data),
    .auto_out_d_bits_corrupt (_buffer_2_auto_in_d_bits_corrupt)
  );
  TLBroadcast broadcast (
    .clock                   (clock),
    .reset                   (reset),
    .auto_in_a_ready         (_broadcast_auto_in_a_ready),
    .auto_in_a_valid         (_serdesser_auto_client_out_a_valid),
    .auto_in_a_bits_opcode   (_serdesser_auto_client_out_a_bits_opcode),
    .auto_in_a_bits_param    (_serdesser_auto_client_out_a_bits_param),
    .auto_in_a_bits_size     (_serdesser_auto_client_out_a_bits_size),
    .auto_in_a_bits_source   (_serdesser_auto_client_out_a_bits_source),
    .auto_in_a_bits_address  (_serdesser_auto_client_out_a_bits_address),
    .auto_in_a_bits_mask     (_serdesser_auto_client_out_a_bits_mask),
    .auto_in_a_bits_data     (_serdesser_auto_client_out_a_bits_data),
    .auto_in_a_bits_corrupt  (_serdesser_auto_client_out_a_bits_corrupt),
    .auto_in_d_ready         (_serdesser_auto_client_out_d_ready),
    .auto_in_d_valid         (_broadcast_auto_in_d_valid),
    .auto_in_d_bits_opcode   (_broadcast_auto_in_d_bits_opcode),
    .auto_in_d_bits_param    (_broadcast_auto_in_d_bits_param),
    .auto_in_d_bits_size     (_broadcast_auto_in_d_bits_size),
    .auto_in_d_bits_source   (_broadcast_auto_in_d_bits_source),
    .auto_in_d_bits_sink     (_broadcast_auto_in_d_bits_sink),
    .auto_in_d_bits_denied   (_broadcast_auto_in_d_bits_denied),
    .auto_in_d_bits_data     (_broadcast_auto_in_d_bits_data),
    .auto_in_d_bits_corrupt  (_broadcast_auto_in_d_bits_corrupt),
    .auto_out_a_ready        (_xbar_auto_in_a_ready),
    .auto_out_a_valid        (_broadcast_auto_out_a_valid),
    .auto_out_a_bits_opcode  (_broadcast_auto_out_a_bits_opcode),
    .auto_out_a_bits_param   (_broadcast_auto_out_a_bits_param),
    .auto_out_a_bits_size    (_broadcast_auto_out_a_bits_size),
    .auto_out_a_bits_source  (_broadcast_auto_out_a_bits_source),
    .auto_out_a_bits_address (_broadcast_auto_out_a_bits_address),
    .auto_out_a_bits_mask    (_broadcast_auto_out_a_bits_mask),
    .auto_out_a_bits_data    (_broadcast_auto_out_a_bits_data),
    .auto_out_d_ready        (_broadcast_auto_out_d_ready),
    .auto_out_d_valid        (_xbar_auto_in_d_valid),
    .auto_out_d_bits_opcode  (_xbar_auto_in_d_bits_opcode),
    .auto_out_d_bits_param   (_xbar_auto_in_d_bits_param),
    .auto_out_d_bits_size    (_xbar_auto_in_d_bits_size),
    .auto_out_d_bits_source  (_xbar_auto_in_d_bits_source),
    .auto_out_d_bits_denied  (_xbar_auto_in_d_bits_denied),
    .auto_out_d_bits_data    (_xbar_auto_in_d_bits_data),
    .auto_out_d_bits_corrupt (_xbar_auto_in_d_bits_corrupt)
  );
endmodule

