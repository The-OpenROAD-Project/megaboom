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

module BoomWritebackUnit(
  input          clock,
                 reset,
  output         io_req_ready,
  input          io_req_valid,
  input  [20:0]  io_req_bits_tag,
  input  [5:0]   io_req_bits_idx,
  input  [2:0]   io_req_bits_param,
  input  [7:0]   io_req_bits_way_en,
  input          io_req_bits_voluntary,
                 io_meta_read_ready,
  output         io_meta_read_valid,
  output [5:0]   io_meta_read_bits_idx,
  output [20:0]  io_meta_read_bits_tag,
  output         io_resp,
                 io_idx_valid,
  output [5:0]   io_idx_bits,
  input          io_data_req_ready,
  output         io_data_req_valid,
  output [7:0]   io_data_req_bits_way_en,
  output [11:0]  io_data_req_bits_addr,
  input  [127:0] io_data_resp,
  input          io_mem_grant,
                 io_release_ready,
  output         io_release_valid,
  output [2:0]   io_release_bits_opcode,
                 io_release_bits_param,
  output [32:0]  io_release_bits_address,
  output [127:0] io_release_bits_data,
  input          io_lsu_release_ready,
  output         io_lsu_release_valid,
  output [32:0]  io_lsu_release_bits_address
);

  reg  [20:0]  req_tag;
  reg  [5:0]   req_idx;
  reg  [2:0]   req_param;
  reg  [7:0]   req_way_en;
  reg          req_voluntary;
  reg  [2:0]   state;
  reg          r1_data_req_fired;
  reg          r2_data_req_fired;
  reg  [2:0]   r1_data_req_cnt;
  reg  [2:0]   r2_data_req_cnt;
  reg  [2:0]   data_req_cnt;
  reg  [127:0] wb_buffer_0;
  reg  [127:0] wb_buffer_1;
  reg  [127:0] wb_buffer_2;
  reg  [127:0] wb_buffer_3;
  reg          acked;
  wire [32:0]  voluntaryRelease_address = {req_tag, req_idx, 6'h0};
  reg  [127:0] casez_tmp;
  always @(*) begin
    casez (data_req_cnt[1:0])
      2'b00:
        casez_tmp = wb_buffer_0;
      2'b01:
        casez_tmp = wb_buffer_1;
      2'b10:
        casez_tmp = wb_buffer_2;
      default:
        casez_tmp = wb_buffer_3;
    endcase
  end // always @(*)
  wire         _io_req_ready_output = state == 3'h0;
  wire         _GEN = state == 3'h1;
  wire         _io_data_req_valid_output = ~_io_req_ready_output & _GEN & ~(data_req_cnt[2]);
  wire         _GEN_0 = r2_data_req_cnt == 3'h3;
  wire         _GEN_1 = state == 3'h2;
  wire         _io_lsu_release_valid_output = ~(_io_req_ready_output | _GEN) & _GEN_1;
  wire         _GEN_2 = state == 3'h3;
  wire         _GEN_3 = _GEN | _GEN_1;
  wire         _io_release_valid_output = ~(_io_req_ready_output | _GEN_3) & _GEN_2 & ~(data_req_cnt[2]);
  wire         _GEN_4 = io_release_ready & _io_release_valid_output;
  wire         _GEN_5 = state == 3'h4;
  wire         _GEN_6 = _io_req_ready_output & io_req_valid;
  wire         _GEN_7 = _io_req_ready_output | ~_GEN;
  wire         _GEN_8 = io_data_req_ready & _io_data_req_valid_output & io_meta_read_ready;
  always @(posedge clock) begin
    if (_io_req_ready_output & _GEN_6) begin
      req_tag <= io_req_bits_tag;
      req_idx <= io_req_bits_idx;
      req_param <= io_req_bits_param;
      req_way_en <= io_req_bits_way_en;
      req_voluntary <= io_req_bits_voluntary;
    end
    if (_GEN_7) begin
    end
    else begin
      r1_data_req_cnt <= _GEN_8 ? data_req_cnt : 3'h0;
      r2_data_req_cnt <= r1_data_req_cnt;
    end
    if (_io_req_ready_output | ~(_GEN & r2_data_req_fired & r2_data_req_cnt[1:0] == 2'h0)) begin
    end
    else
      wb_buffer_0 <= io_data_resp;
    if (_io_req_ready_output | ~(_GEN & r2_data_req_fired & r2_data_req_cnt[1:0] == 2'h1)) begin
    end
    else
      wb_buffer_1 <= io_data_resp;
    if (_io_req_ready_output | ~(_GEN & r2_data_req_fired & r2_data_req_cnt[1:0] == 2'h2)) begin
    end
    else
      wb_buffer_2 <= io_data_resp;
    if (_io_req_ready_output | ~(_GEN & r2_data_req_fired & (&(r2_data_req_cnt[1:0])))) begin
    end
    else
      wb_buffer_3 <= io_data_resp;
    if (reset) begin
      state <= 3'h0;
      r1_data_req_fired <= 1'h0;
      r2_data_req_fired <= 1'h0;
      data_req_cnt <= 3'h0;
      acked <= 1'h0;
    end
    else begin
      if (_io_req_ready_output) begin
        if (_GEN_6) begin
          state <= 3'h1;
          data_req_cnt <= 3'h0;
        end
        acked <= ~_GEN_6 & acked;
      end
      else begin
        if (_GEN) begin
          if (r2_data_req_fired & _GEN_0) begin
            state <= 3'h2;
            data_req_cnt <= 3'h0;
          end
          else if (_GEN_8)
            data_req_cnt <= data_req_cnt + 3'h1;
        end
        else begin
          if (_GEN_1) begin
            if (io_lsu_release_ready & _io_lsu_release_valid_output)
              state <= 3'h3;
          end
          else if (_GEN_2) begin
            if (data_req_cnt == 3'h3 & _GEN_4)
              state <= {req_voluntary, 2'h0};
          end
          else if (_GEN_5 & acked)
            state <= 3'h0;
          if (_GEN_1 | ~(_GEN_2 & _GEN_4)) begin
          end
          else
            data_req_cnt <= data_req_cnt + 3'h1;
        end
        if (~_GEN_3) begin
          if (_GEN_2)
            acked <= io_mem_grant | acked;
          else
            acked <= _GEN_5 & io_mem_grant | acked;
        end
      end
      if (_GEN_7) begin
      end
      else begin
        r1_data_req_fired <= _GEN_8;
        r2_data_req_fired <= r1_data_req_fired;
      end
    end
  end // always @(posedge)
  assign io_req_ready = _io_req_ready_output;
  assign io_meta_read_valid = _io_data_req_valid_output;
  assign io_meta_read_bits_idx = req_idx;
  assign io_meta_read_bits_tag = req_tag;
  assign io_resp = ~_io_req_ready_output & _GEN & r2_data_req_fired & _GEN_0;
  assign io_idx_valid = |state;
  assign io_idx_bits = req_idx;
  assign io_data_req_valid = _io_data_req_valid_output;
  assign io_data_req_bits_way_en = req_way_en;
  assign io_data_req_bits_addr = {req_idx, data_req_cnt[1:0], 4'h0};
  assign io_release_valid = _io_release_valid_output;
  assign io_release_bits_opcode = {1'h1, req_voluntary, 1'h1};
  assign io_release_bits_param = req_param;
  assign io_release_bits_address = voluntaryRelease_address;
  assign io_release_bits_data = casez_tmp;
  assign io_lsu_release_valid = _io_lsu_release_valid_output;
  assign io_lsu_release_bits_address = voluntaryRelease_address;
endmodule

