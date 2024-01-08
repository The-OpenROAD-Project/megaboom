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

module InclusiveCacheControl(
  input         clock,
                reset,
  output        auto_ctrl_in_a_ready,
  input         auto_ctrl_in_a_valid,
  input  [2:0]  auto_ctrl_in_a_bits_opcode,
                auto_ctrl_in_a_bits_param,
  input  [1:0]  auto_ctrl_in_a_bits_size,
  input  [10:0] auto_ctrl_in_a_bits_source,
  input  [25:0] auto_ctrl_in_a_bits_address,
  input  [7:0]  auto_ctrl_in_a_bits_mask,
  input  [63:0] auto_ctrl_in_a_bits_data,
  input         auto_ctrl_in_a_bits_corrupt,
                auto_ctrl_in_d_ready,
  output        auto_ctrl_in_d_valid,
  output [2:0]  auto_ctrl_in_d_bits_opcode,
  output [1:0]  auto_ctrl_in_d_bits_size,
  output [10:0] auto_ctrl_in_d_bits_source,
  output [63:0] auto_ctrl_in_d_bits_data,
  input         io_flush_match,
                io_flush_req_ready,
  output        io_flush_req_valid,
  output [63:0] io_flush_req_bits,
  input         io_flush_resp
);

  wire        _out_wofireMux_T_2;
  wire        out_backSel_3;
  wire        out_backSel_2;
  wire        _out_back_q_io_enq_ready;
  wire        _out_back_q_io_deq_valid;
  wire        _out_back_q_io_deq_bits_read;
  wire [8:0]  _out_back_q_io_deq_bits_index;
  wire [7:0]  _out_back_q_io_deq_bits_mask;
  wire [10:0] _out_back_q_io_deq_bits_extra_tlrr_extra_source;
  wire [1:0]  _out_back_q_io_deq_bits_extra_tlrr_extra_size;
  reg         flushInValid;
  reg  [63:0] flushInAddress;
  reg         flushOutValid;
  wire        out_front_bits_read = auto_ctrl_in_a_bits_opcode == 3'h4;
  wire [6:0]  _GEN = {auto_ctrl_in_a_bits_address[11:10], auto_ctrl_in_a_bits_address[8:7], auto_ctrl_in_a_bits_address[5:3]};
  wire [6:0]  _GEN_0 = {_out_back_q_io_deq_bits_index[8:7], _out_back_q_io_deq_bits_index[5:4], _out_back_q_io_deq_bits_index[2:0]};
  wire [7:0]  _out_frontMask_T_9 = {8{auto_ctrl_in_a_bits_mask[0]}};
  wire [7:0]  _out_frontMask_T_11 = {8{auto_ctrl_in_a_bits_mask[1]}};
  wire [7:0]  _out_frontMask_T_13 = {8{auto_ctrl_in_a_bits_mask[2]}};
  wire [7:0]  _out_frontMask_T_15 = {8{auto_ctrl_in_a_bits_mask[3]}};
  wire [63:0] out_frontMask = {{8{auto_ctrl_in_a_bits_mask[7]}}, {8{auto_ctrl_in_a_bits_mask[6]}}, {8{auto_ctrl_in_a_bits_mask[5]}}, {8{auto_ctrl_in_a_bits_mask[4]}}, _out_frontMask_T_15, _out_frontMask_T_13, _out_frontMask_T_11, _out_frontMask_T_9};
  wire [7:0]  _out_backMask_T_9 = {8{_out_back_q_io_deq_bits_mask[0]}};
  wire [7:0]  _out_backMask_T_11 = {8{_out_back_q_io_deq_bits_mask[1]}};
  wire [7:0]  _out_backMask_T_13 = {8{_out_back_q_io_deq_bits_mask[2]}};
  wire [7:0]  _out_backMask_T_15 = {8{_out_back_q_io_deq_bits_mask[3]}};
  wire [63:0] out_backMask = {{8{_out_back_q_io_deq_bits_mask[7]}}, {8{_out_back_q_io_deq_bits_mask[6]}}, {8{_out_back_q_io_deq_bits_mask[5]}}, {8{_out_back_q_io_deq_bits_mask[4]}}, _out_backMask_T_15, _out_backMask_T_13, _out_backMask_T_11, _out_backMask_T_9};
  wire [31:0] _out_wimask_T_5 = {_out_frontMask_T_15, _out_frontMask_T_13, _out_frontMask_T_11, _out_frontMask_T_9};
  wire [31:0] _out_womask_T_5 = {_out_backMask_T_15, _out_backMask_T_13, _out_backMask_T_11, _out_backMask_T_9};
  wire [1:0]  out_oindex = {_out_back_q_io_deq_bits_index[6], _out_back_q_io_deq_bits_index[3]};
  wire [1:0]  _GEN_1 = {auto_ctrl_in_a_bits_address[9], auto_ctrl_in_a_bits_address[6]};
  wire [1:0]  _GEN_2 = {_out_back_q_io_deq_bits_index[6], _out_back_q_io_deq_bits_index[3]};
  assign out_backSel_2 = _GEN_2 == 2'h2;
  assign out_backSel_3 = &_GEN_2;
  wire        _out_wifireMux_T_2 = auto_ctrl_in_a_valid & _out_back_q_io_enq_ready & ~out_front_bits_read;
  reg         casez_tmp;
  always @(*) begin
    casez ({auto_ctrl_in_a_bits_address[9], auto_ctrl_in_a_bits_address[6]})
      2'b00:
        casez_tmp = 1'h1;
      2'b01:
        casez_tmp = 1'h1;
      2'b10:
        casez_tmp = ~flushInValid | ~(&out_frontMask) | (|_GEN);
      default:
        casez_tmp = ~flushInValid | ~(&_out_wimask_T_5) | (|_GEN);
    endcase
  end // always @(*)
  assign _out_wofireMux_T_2 = _out_back_q_io_deq_valid & auto_ctrl_in_d_ready & ~_out_back_q_io_deq_bits_read;
  reg         casez_tmp_0;
  always @(*) begin
    casez (out_oindex)
      2'b00:
        casez_tmp_0 = 1'h1;
      2'b01:
        casez_tmp_0 = 1'h1;
      2'b10:
        casez_tmp_0 = flushOutValid | ~(&out_backMask) | (|_GEN_0);
      default:
        casez_tmp_0 = flushOutValid | ~(&_out_womask_T_5) | (|_GEN_0);
    endcase
  end // always @(*)
  wire        out_iready = out_front_bits_read | casez_tmp;
  wire        out_oready = _out_back_q_io_deq_bits_read | casez_tmp_0;
  wire        in_ready = _out_back_q_io_enq_ready & out_iready;
  wire        out_valid = _out_back_q_io_deq_valid & out_oready;
  reg         casez_tmp_1;
  always @(*) begin
    casez (out_oindex)
      2'b00:
        casez_tmp_1 = ~(|_GEN_0);
      2'b01:
        casez_tmp_1 = 1'h1;
      2'b10:
        casez_tmp_1 = ~(|_GEN_0);
      default:
        casez_tmp_1 = ~(|_GEN_0);
    endcase
  end // always @(*)
  reg  [63:0] casez_tmp_2;
  always @(*) begin
    casez (out_oindex)
      2'b00:
        casez_tmp_2 = 64'h60A0801;
      2'b01:
        casez_tmp_2 = 64'h0;
      2'b10:
        casez_tmp_2 = 64'h0;
      default:
        casez_tmp_2 = 64'h0;
    endcase
  end // always @(*)
  wire [2:0]  ctrlnodeIn_d_bits_opcode = {2'h0, _out_back_q_io_deq_bits_read};
  wire        _GEN_3 = ~io_flush_match & flushInValid;
  wire        out_f_wivalid_4 = _out_wifireMux_T_2 & _GEN_1 == 2'h2 & ~(|_GEN) & (&out_frontMask);
  wire        out_f_wivalid_5 = _out_wifireMux_T_2 & (&_GEN_1) & ~(|_GEN) & (&_out_wimask_T_5);
  always @(posedge clock) begin
    if (reset) begin
      flushInValid <= 1'h0;
      flushOutValid <= 1'h0;
    end
    else begin
      flushInValid <= out_f_wivalid_5 | out_f_wivalid_4 | ~(_GEN_3 | io_flush_req_ready) & flushInValid;
      flushOutValid <= _GEN_3 | io_flush_resp | ~(_out_wofireMux_T_2 & out_backSel_3 & ~(|_GEN_0) & (&_out_womask_T_5) | _out_wofireMux_T_2 & out_backSel_2 & ~(|_GEN_0) & (&out_backMask)) & flushOutValid;
    end
    if (out_f_wivalid_5 & ~flushInValid)
      flushInAddress <= {28'h0, auto_ctrl_in_a_bits_data[31:0], 4'h0};
    else if (out_f_wivalid_4 & ~flushInValid)
      flushInAddress <= auto_ctrl_in_a_bits_data;
  end // always @(posedge)
  TLMonitor_34 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (in_ready),
    .io_in_a_valid        (auto_ctrl_in_a_valid),
    .io_in_a_bits_opcode  (auto_ctrl_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_ctrl_in_a_bits_param),
    .io_in_a_bits_size    (auto_ctrl_in_a_bits_size),
    .io_in_a_bits_source  (auto_ctrl_in_a_bits_source),
    .io_in_a_bits_address (auto_ctrl_in_a_bits_address),
    .io_in_a_bits_mask    (auto_ctrl_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_ctrl_in_a_bits_corrupt),
    .io_in_d_ready        (auto_ctrl_in_d_ready),
    .io_in_d_valid        (out_valid),
    .io_in_d_bits_opcode  (ctrlnodeIn_d_bits_opcode),
    .io_in_d_bits_size    (_out_back_q_io_deq_bits_extra_tlrr_extra_size),
    .io_in_d_bits_source  (_out_back_q_io_deq_bits_extra_tlrr_extra_source)
  );
  Queue_17 out_back_q (
    .clock                               (clock),
    .reset                               (reset),
    .io_enq_ready                        (_out_back_q_io_enq_ready),
    .io_enq_valid                        (auto_ctrl_in_a_valid & out_iready),
    .io_enq_bits_read                    (out_front_bits_read),
    .io_enq_bits_index                   (auto_ctrl_in_a_bits_address[11:3]),
    .io_enq_bits_data                    (auto_ctrl_in_a_bits_data),
    .io_enq_bits_mask                    (auto_ctrl_in_a_bits_mask),
    .io_enq_bits_extra_tlrr_extra_source (auto_ctrl_in_a_bits_source),
    .io_enq_bits_extra_tlrr_extra_size   (auto_ctrl_in_a_bits_size),
    .io_deq_ready                        (auto_ctrl_in_d_ready & out_oready),
    .io_deq_valid                        (_out_back_q_io_deq_valid),
    .io_deq_bits_read                    (_out_back_q_io_deq_bits_read),
    .io_deq_bits_index                   (_out_back_q_io_deq_bits_index),
    .io_deq_bits_mask                    (_out_back_q_io_deq_bits_mask),
    .io_deq_bits_extra_tlrr_extra_source (_out_back_q_io_deq_bits_extra_tlrr_extra_source),
    .io_deq_bits_extra_tlrr_extra_size   (_out_back_q_io_deq_bits_extra_tlrr_extra_size)
  );
  assign auto_ctrl_in_a_ready = in_ready;
  assign auto_ctrl_in_d_valid = out_valid;
  assign auto_ctrl_in_d_bits_opcode = ctrlnodeIn_d_bits_opcode;
  assign auto_ctrl_in_d_bits_size = _out_back_q_io_deq_bits_extra_tlrr_extra_size;
  assign auto_ctrl_in_d_bits_source = _out_back_q_io_deq_bits_extra_tlrr_extra_source;
  assign auto_ctrl_in_d_bits_data = casez_tmp_1 ? casez_tmp_2 : 64'h0;
  assign io_flush_req_valid = flushInValid;
  assign io_flush_req_bits = flushInAddress;
endmodule

