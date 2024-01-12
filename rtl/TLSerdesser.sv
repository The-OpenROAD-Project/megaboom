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

module TLSerdesser(
  input         clock,
                reset,
  output        auto_manager_in_a_ready,
  input         auto_manager_in_a_valid,
  input  [2:0]  auto_manager_in_a_bits_opcode,
                auto_manager_in_a_bits_param,
                auto_manager_in_a_bits_size,
  input  [7:0]  auto_manager_in_a_bits_source,
  input  [32:0] auto_manager_in_a_bits_address,
  input  [7:0]  auto_manager_in_a_bits_mask,
  input  [63:0] auto_manager_in_a_bits_data,
  input         auto_manager_in_d_ready,
  output        auto_manager_in_d_valid,
  output [2:0]  auto_manager_in_d_bits_opcode,
  output [1:0]  auto_manager_in_d_bits_param,
  output [2:0]  auto_manager_in_d_bits_size,
  output [7:0]  auto_manager_in_d_bits_source,
  output        auto_manager_in_d_bits_sink,
                auto_manager_in_d_bits_denied,
  output [63:0] auto_manager_in_d_bits_data,
  output        auto_manager_in_d_bits_corrupt,
  input         auto_client_out_a_ready,
  output        auto_client_out_a_valid,
  output [2:0]  auto_client_out_a_bits_opcode,
                auto_client_out_a_bits_param,
  output [3:0]  auto_client_out_a_bits_size,
                auto_client_out_a_bits_source,
  output [32:0] auto_client_out_a_bits_address,
  output [7:0]  auto_client_out_a_bits_mask,
  output [63:0] auto_client_out_a_bits_data,
  output        auto_client_out_a_bits_corrupt,
                auto_client_out_d_ready,
  input         auto_client_out_d_valid,
  input  [2:0]  auto_client_out_d_bits_opcode,
  input  [1:0]  auto_client_out_d_bits_param,
  input  [3:0]  auto_client_out_d_bits_size,
                auto_client_out_d_bits_source,
  input  [1:0]  auto_client_out_d_bits_sink,
  input         auto_client_out_d_bits_denied,
  input  [63:0] auto_client_out_d_bits_data,
  input         auto_client_out_d_bits_corrupt,
  output        io_ser_in_ready,
  input         io_ser_in_valid,
  input  [3:0]  io_ser_in_bits,
  input         io_ser_out_ready,
  output        io_ser_out_valid,
  output [3:0]  io_ser_out_bits
);

  wire        _inDes_io_out_valid;
  wire [2:0]  _inDes_io_out_bits_chanId;
  wire [2:0]  _inDes_io_out_bits_opcode;
  wire [2:0]  _inDes_io_out_bits_param;
  wire [7:0]  _inDes_io_out_bits_size;
  wire [7:0]  _inDes_io_out_bits_source;
  wire [63:0] _inDes_io_out_bits_address;
  wire [63:0] _inDes_io_out_bits_data;
  wire        _inDes_io_out_bits_corrupt;
  wire [8:0]  _inDes_io_out_bits_union;
  wire        _outSer_io_in_ready;
  wire        _outArb_io_in_1_ready;
  wire        _outArb_io_in_4_ready;
  wire        _outArb_io_out_valid;
  wire [2:0]  _outArb_io_out_bits_chanId;
  wire [2:0]  _outArb_io_out_bits_opcode;
  wire [2:0]  _outArb_io_out_bits_param;
  wire [7:0]  _outArb_io_out_bits_size;
  wire [7:0]  _outArb_io_out_bits_source;
  wire [63:0] _outArb_io_out_bits_address;
  wire [63:0] _outArb_io_out_bits_data;
  wire        _outArb_io_out_bits_corrupt;
  wire [8:0]  _outArb_io_out_bits_union;
  wire        _outArb_io_out_bits_last;
  wire [26:0] _merged_bits_last_beats1_decode_T_1 = 27'hFFF << auto_client_out_d_bits_size;
  wire [8:0]  merged_bits_last_beats1 = auto_client_out_d_bits_opcode[0] ? ~(_merged_bits_last_beats1_decode_T_1[11:3]) : 9'h0;
  reg  [8:0]  merged_bits_last_counter_1;
  wire [18:0] _merged_bits_last_beats1_decode_T_13 = 19'hFFF << auto_manager_in_a_bits_size;
  wire [8:0]  merged_bits_last_beats1_3 = auto_manager_in_a_bits_opcode[2] ? 9'h0 : ~(_merged_bits_last_beats1_decode_T_13[11:3]);
  reg  [8:0]  merged_bits_last_counter_4;
  wire        managerNodeIn_d_valid = _inDes_io_out_valid & _inDes_io_out_bits_chanId == 3'h3;
  always @(posedge clock) begin
    if (reset) begin
      merged_bits_last_counter_1 <= 9'h0;
      merged_bits_last_counter_4 <= 9'h0;
    end
    else begin
      if (_outArb_io_in_1_ready & auto_client_out_d_valid) begin
        if (merged_bits_last_counter_1 == 9'h0)
          merged_bits_last_counter_1 <= merged_bits_last_beats1;
        else
          merged_bits_last_counter_1 <= merged_bits_last_counter_1 - 9'h1;
      end
      if (_outArb_io_in_4_ready & auto_manager_in_a_valid) begin
        if (merged_bits_last_counter_4 == 9'h0)
          merged_bits_last_counter_4 <= merged_bits_last_beats1_3;
        else
          merged_bits_last_counter_4 <= merged_bits_last_counter_4 - 9'h1;
      end
    end
  end // always @(posedge)
  TLMonitor_44 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (_outArb_io_in_4_ready),
    .io_in_a_valid        (auto_manager_in_a_valid),
    .io_in_a_bits_opcode  (auto_manager_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_manager_in_a_bits_param),
    .io_in_a_bits_size    (auto_manager_in_a_bits_size),
    .io_in_a_bits_source  (auto_manager_in_a_bits_source),
    .io_in_a_bits_address (auto_manager_in_a_bits_address),
    .io_in_a_bits_mask    (auto_manager_in_a_bits_mask),
    .io_in_d_ready        (auto_manager_in_d_ready),
    .io_in_d_valid        (managerNodeIn_d_valid),
    .io_in_d_bits_opcode  (_inDes_io_out_bits_opcode),
    .io_in_d_bits_param   (_inDes_io_out_bits_param[1:0]),
    .io_in_d_bits_size    (_inDes_io_out_bits_size[2:0]),
    .io_in_d_bits_source  (_inDes_io_out_bits_source),
    .io_in_d_bits_sink    (_inDes_io_out_bits_union[1]),
    .io_in_d_bits_denied  (_inDes_io_out_bits_union[0]),
    .io_in_d_bits_corrupt (_inDes_io_out_bits_corrupt)
  );
  HellaPeekingArbiter outArb (
    .clock                (clock),
    .reset                (reset),
    .io_in_1_ready        (_outArb_io_in_1_ready),
    .io_in_1_valid        (auto_client_out_d_valid),
    .io_in_1_bits_opcode  (auto_client_out_d_bits_opcode),
    .io_in_1_bits_param   ({1'h0, auto_client_out_d_bits_param}),
    .io_in_1_bits_size    ({4'h0, auto_client_out_d_bits_size}),
    .io_in_1_bits_source  ({4'h0, auto_client_out_d_bits_source}),
    .io_in_1_bits_data    (auto_client_out_d_bits_data),
    .io_in_1_bits_corrupt (auto_client_out_d_bits_corrupt),
    .io_in_1_bits_union   ({6'h0, auto_client_out_d_bits_sink, auto_client_out_d_bits_denied}),
    .io_in_1_bits_last    (merged_bits_last_counter_1 == 9'h1 | merged_bits_last_beats1 == 9'h0),
    .io_in_4_ready        (_outArb_io_in_4_ready),
    .io_in_4_valid        (auto_manager_in_a_valid),
    .io_in_4_bits_opcode  (auto_manager_in_a_bits_opcode),
    .io_in_4_bits_param   (auto_manager_in_a_bits_param),
    .io_in_4_bits_size    ({5'h0, auto_manager_in_a_bits_size}),
    .io_in_4_bits_source  (auto_manager_in_a_bits_source),
    .io_in_4_bits_address ({31'h0, auto_manager_in_a_bits_address}),
    .io_in_4_bits_data    (auto_manager_in_a_bits_data),
    .io_in_4_bits_corrupt (1'h0),
    .io_in_4_bits_union   ({1'h0, auto_manager_in_a_bits_mask}),
    .io_in_4_bits_last    (merged_bits_last_counter_4 == 9'h1 | merged_bits_last_beats1_3 == 9'h0),
    .io_out_ready         (_outSer_io_in_ready),
    .io_out_valid         (_outArb_io_out_valid),
    .io_out_bits_chanId   (_outArb_io_out_bits_chanId),
    .io_out_bits_opcode   (_outArb_io_out_bits_opcode),
    .io_out_bits_param    (_outArb_io_out_bits_param),
    .io_out_bits_size     (_outArb_io_out_bits_size),
    .io_out_bits_source   (_outArb_io_out_bits_source),
    .io_out_bits_address  (_outArb_io_out_bits_address),
    .io_out_bits_data     (_outArb_io_out_bits_data),
    .io_out_bits_corrupt  (_outArb_io_out_bits_corrupt),
    .io_out_bits_union    (_outArb_io_out_bits_union),
    .io_out_bits_last     (_outArb_io_out_bits_last)
  );
  GenericSerializer outSer (
    .clock              (clock),
    .reset              (reset),
    .io_in_ready        (_outSer_io_in_ready),
    .io_in_valid        (_outArb_io_out_valid),
    .io_in_bits_chanId  (_outArb_io_out_bits_chanId),
    .io_in_bits_opcode  (_outArb_io_out_bits_opcode),
    .io_in_bits_param   (_outArb_io_out_bits_param),
    .io_in_bits_size    (_outArb_io_out_bits_size),
    .io_in_bits_source  (_outArb_io_out_bits_source),
    .io_in_bits_address (_outArb_io_out_bits_address),
    .io_in_bits_data    (_outArb_io_out_bits_data),
    .io_in_bits_corrupt (_outArb_io_out_bits_corrupt),
    .io_in_bits_union   (_outArb_io_out_bits_union),
    .io_in_bits_last    (_outArb_io_out_bits_last),
    .io_out_ready       (io_ser_out_ready),
    .io_out_valid       (io_ser_out_valid),
    .io_out_bits        (io_ser_out_bits)
  );
  GenericDeserializer inDes (
    .clock               (clock),
    .reset               (reset),
    .io_in_ready         (io_ser_in_ready),
    .io_in_valid         (io_ser_in_valid),
    .io_in_bits          (io_ser_in_bits),
    .io_out_ready        (_inDes_io_out_bits_chanId != 3'h4 & (_inDes_io_out_bits_chanId == 3'h3 ? auto_manager_in_d_ready : ~(_inDes_io_out_bits_chanId == 3'h2 | _inDes_io_out_bits_chanId == 3'h1) & ~(|_inDes_io_out_bits_chanId) & auto_client_out_a_ready)),
    .io_out_valid        (_inDes_io_out_valid),
    .io_out_bits_chanId  (_inDes_io_out_bits_chanId),
    .io_out_bits_opcode  (_inDes_io_out_bits_opcode),
    .io_out_bits_param   (_inDes_io_out_bits_param),
    .io_out_bits_size    (_inDes_io_out_bits_size),
    .io_out_bits_source  (_inDes_io_out_bits_source),
    .io_out_bits_address (_inDes_io_out_bits_address),
    .io_out_bits_data    (_inDes_io_out_bits_data),
    .io_out_bits_corrupt (_inDes_io_out_bits_corrupt),
    .io_out_bits_union   (_inDes_io_out_bits_union)
  );
  assign auto_manager_in_a_ready = _outArb_io_in_4_ready;
  assign auto_manager_in_d_valid = managerNodeIn_d_valid;
  assign auto_manager_in_d_bits_opcode = _inDes_io_out_bits_opcode;
  assign auto_manager_in_d_bits_param = _inDes_io_out_bits_param[1:0];
  assign auto_manager_in_d_bits_size = _inDes_io_out_bits_size[2:0];
  assign auto_manager_in_d_bits_source = _inDes_io_out_bits_source;
  assign auto_manager_in_d_bits_sink = _inDes_io_out_bits_union[1];
  assign auto_manager_in_d_bits_denied = _inDes_io_out_bits_union[0];
  assign auto_manager_in_d_bits_data = _inDes_io_out_bits_data;
  assign auto_manager_in_d_bits_corrupt = _inDes_io_out_bits_corrupt;
  assign auto_client_out_a_valid = _inDes_io_out_valid & ~(|_inDes_io_out_bits_chanId);
  assign auto_client_out_a_bits_opcode = _inDes_io_out_bits_opcode;
  assign auto_client_out_a_bits_param = _inDes_io_out_bits_param;
  assign auto_client_out_a_bits_size = _inDes_io_out_bits_size[3:0];
  assign auto_client_out_a_bits_source = _inDes_io_out_bits_source[3:0];
  assign auto_client_out_a_bits_address = _inDes_io_out_bits_address[32:0];
  assign auto_client_out_a_bits_mask = _inDes_io_out_bits_union[7:0];
  assign auto_client_out_a_bits_data = _inDes_io_out_bits_data;
  assign auto_client_out_a_bits_corrupt = _inDes_io_out_bits_corrupt;
  assign auto_client_out_d_ready = _outArb_io_in_1_ready;
endmodule

