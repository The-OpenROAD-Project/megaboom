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

module TLError(
  input         clock,
                reset,
  output        auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
  input  [3:0]  auto_in_a_bits_size,
  input  [6:0]  auto_in_a_bits_source,
  input  [13:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [3:0]  auto_in_d_bits_size,
  output [6:0]  auto_in_d_bits_source,
  output        auto_in_d_bits_corrupt
);

  reg  [2:0]  casez_tmp;
  wire        _a_q_io_enq_ready;
  wire        _a_q_io_deq_valid;
  wire [2:0]  _a_q_io_deq_bits_opcode;
  wire [3:0]  _a_q_io_deq_bits_size;
  wire [6:0]  _a_q_io_deq_bits_source;
  wire [26:0] _GEN = {23'h0, _a_q_io_deq_bits_size};
  wire [26:0] _a_last_beats1_decode_T_1 = 27'hFFF << _GEN;
  wire [8:0]  a_last_beats1 = _a_q_io_deq_bits_opcode[2] ? 9'h0 : ~(_a_last_beats1_decode_T_1[11:3]);
  reg  [8:0]  a_last_counter;
  wire        a_last = a_last_counter == 9'h1 | a_last_beats1 == 9'h0;
  wire [26:0] _beats1_decode_T_1 = 27'hFFF << _GEN;
  wire [8:0]  beats1 = casez_tmp[0] ? ~(_beats1_decode_T_1[11:3]) : 9'h0;
  reg  [8:0]  counter;
  wire        _q_io_deq_ready_T_3 = auto_in_d_ready & (counter == 9'h1 | beats1 == 9'h0) | ~a_last;
  wire        da_valid = _a_q_io_deq_valid & a_last;
  always @(*) begin
    casez (_a_q_io_deq_bits_opcode)
      3'b000:
        casez_tmp = 3'h0;
      3'b001:
        casez_tmp = 3'h0;
      3'b010:
        casez_tmp = 3'h1;
      3'b011:
        casez_tmp = 3'h1;
      3'b100:
        casez_tmp = 3'h1;
      3'b101:
        casez_tmp = 3'h2;
      3'b110:
        casez_tmp = 3'h4;
      default:
        casez_tmp = 3'h4;
    endcase
  end // always @(*)
  always @(posedge clock) begin
    if (reset) begin
      a_last_counter <= 9'h0;
      counter <= 9'h0;
    end
    else begin
      if (_q_io_deq_ready_T_3 & _a_q_io_deq_valid) begin
        if (a_last_counter == 9'h0)
          a_last_counter <= a_last_beats1;
        else
          a_last_counter <= a_last_counter - 9'h1;
      end
      if (auto_in_d_ready & da_valid) begin
        if (counter == 9'h0)
          counter <= beats1;
        else
          counter <= counter - 9'h1;
      end
    end
  end // always @(posedge)
  TLMonitor_20 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (_a_q_io_enq_ready),
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_opcode  (auto_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_in_a_bits_param),
    .io_in_a_bits_size    (auto_in_a_bits_size),
    .io_in_a_bits_source  (auto_in_a_bits_source),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_a_bits_mask    (auto_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_in_a_bits_corrupt),
    .io_in_d_ready        (auto_in_d_ready),
    .io_in_d_valid        (da_valid),
    .io_in_d_bits_opcode  (casez_tmp),
    .io_in_d_bits_size    (_a_q_io_deq_bits_size),
    .io_in_d_bits_source  (_a_q_io_deq_bits_source),
    .io_in_d_bits_corrupt (casez_tmp[0])
  );
  Queue_10 a_q (
    .clock               (clock),
    .reset               (reset),
    .io_enq_ready        (_a_q_io_enq_ready),
    .io_enq_valid        (auto_in_a_valid),
    .io_enq_bits_opcode  (auto_in_a_bits_opcode),
    .io_enq_bits_param   (auto_in_a_bits_param),
    .io_enq_bits_size    (auto_in_a_bits_size),
    .io_enq_bits_source  (auto_in_a_bits_source),
    .io_enq_bits_address (auto_in_a_bits_address),
    .io_enq_bits_mask    (auto_in_a_bits_mask),
    .io_enq_bits_data    (auto_in_a_bits_data),
    .io_enq_bits_corrupt (auto_in_a_bits_corrupt),
    .io_deq_ready        (_q_io_deq_ready_T_3),
    .io_deq_valid        (_a_q_io_deq_valid),
    .io_deq_bits_opcode  (_a_q_io_deq_bits_opcode),
    .io_deq_bits_size    (_a_q_io_deq_bits_size),
    .io_deq_bits_source  (_a_q_io_deq_bits_source)
  );
  assign auto_in_a_ready = _a_q_io_enq_ready;
  assign auto_in_d_valid = da_valid;
  assign auto_in_d_bits_opcode = casez_tmp;
  assign auto_in_d_bits_size = _a_q_io_deq_bits_size;
  assign auto_in_d_bits_source = _a_q_io_deq_bits_source;
  assign auto_in_d_bits_corrupt = casez_tmp[0];
endmodule

