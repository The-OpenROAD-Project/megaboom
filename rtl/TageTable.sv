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

module TageTable(
  input         clock,
                reset,
                io_f1_req_valid,
  input  [39:0] io_f1_req_pc,
  input  [63:0] io_f1_req_ghist,
  output        io_f3_resp_0_valid,
  output [2:0]  io_f3_resp_0_bits_ctr,
  output [1:0]  io_f3_resp_0_bits_u,
  output        io_f3_resp_1_valid,
  output [2:0]  io_f3_resp_1_bits_ctr,
  output [1:0]  io_f3_resp_1_bits_u,
  output        io_f3_resp_2_valid,
  output [2:0]  io_f3_resp_2_bits_ctr,
  output [1:0]  io_f3_resp_2_bits_u,
  output        io_f3_resp_3_valid,
  output [2:0]  io_f3_resp_3_bits_ctr,
  output [1:0]  io_f3_resp_3_bits_u,
  input         io_update_mask_0,
                io_update_mask_1,
                io_update_mask_2,
                io_update_mask_3,
                io_update_taken_0,
                io_update_taken_1,
                io_update_taken_2,
                io_update_taken_3,
                io_update_alloc_0,
                io_update_alloc_1,
                io_update_alloc_2,
                io_update_alloc_3,
  input  [2:0]  io_update_old_ctr_0,
                io_update_old_ctr_1,
                io_update_old_ctr_2,
                io_update_old_ctr_3,
  input  [39:0] io_update_pc,
  input  [63:0] io_update_hist,
  input         io_update_u_mask_0,
                io_update_u_mask_1,
                io_update_u_mask_2,
                io_update_u_mask_3,
  input  [1:0]  io_update_u_0,
                io_update_u_1,
                io_update_u_2,
                io_update_u_3
);

  wire        update_lo_wdata_3;
  wire        update_hi_wdata_3;
  wire [2:0]  update_wdata_3_ctr;
  wire        update_lo_wdata_2;
  wire        update_hi_wdata_2;
  wire [2:0]  update_wdata_2_ctr;
  wire        update_lo_wdata_1;
  wire        update_hi_wdata_1;
  wire [2:0]  update_wdata_1_ctr;
  wire        update_lo_wdata_0;
  wire        update_hi_wdata_0;
  wire [2:0]  update_wdata_0_ctr;
  wire        lo_us_MPORT_2_data_3;
  wire        lo_us_MPORT_2_data_2;
  wire        lo_us_MPORT_2_data_1;
  wire        lo_us_MPORT_2_data_0;
  wire        hi_us_MPORT_1_data_3;
  wire        hi_us_MPORT_1_data_2;
  wire        hi_us_MPORT_1_data_1;
  wire        hi_us_MPORT_1_data_0;
  wire [10:0] table_MPORT_data_3;
  wire [10:0] table_MPORT_data_2;
  wire [10:0] table_MPORT_data_1;
  wire [10:0] table_MPORT_data_0;
  wire [43:0] _table_ext_R0_data;
  wire [3:0]  _lo_us_ext_R0_data;
  wire [3:0]  _hi_us_ext_R0_data;
  reg         doing_reset;
  reg  [6:0]  reset_idx;
  wire [6:0]  _s2_req_rlous_T_1 = {io_f1_req_pc[10:6], io_f1_req_pc[5:4] ^ io_f1_req_ghist[1:0]};
  reg  [6:0]  s2_tag;
  reg         io_f3_resp_0_valid_REG;
  reg  [1:0]  io_f3_resp_0_bits_u_REG;
  reg  [2:0]  io_f3_resp_0_bits_ctr_REG;
  reg         io_f3_resp_1_valid_REG;
  reg  [1:0]  io_f3_resp_1_bits_u_REG;
  reg  [2:0]  io_f3_resp_1_bits_ctr_REG;
  reg         io_f3_resp_2_valid_REG;
  reg  [1:0]  io_f3_resp_2_bits_u_REG;
  reg  [2:0]  io_f3_resp_2_bits_ctr_REG;
  reg         io_f3_resp_3_valid_REG;
  reg  [1:0]  io_f3_resp_3_bits_u_REG;
  reg  [2:0]  io_f3_resp_3_bits_ctr_REG;
  reg  [18:0] clear_u_ctr;
  wire        doing_clear_u = clear_u_ctr[10:0] == 11'h0;
  wire        doing_clear_u_hi = doing_clear_u & clear_u_ctr[18];
  wire        doing_clear_u_lo = doing_clear_u & ~(clear_u_ctr[18]);
  wire [1:0]  _GEN = io_update_pc[5:4] ^ io_update_hist[1:0];
  wire [6:0]  update_idx = {io_update_pc[10:6], _GEN};
  wire [1:0]  _GEN_0 = io_update_pc[12:11] ^ io_update_hist[1:0];
  wire [6:0]  update_wdata_3_tag = {io_update_pc[17:13], _GEN_0};
  assign table_MPORT_data_0 = doing_reset ? 11'h0 : {1'h1, io_update_pc[17:13], _GEN_0, update_wdata_0_ctr};
  assign table_MPORT_data_1 = doing_reset ? 11'h0 : {1'h1, io_update_pc[17:13], _GEN_0, update_wdata_1_ctr};
  assign table_MPORT_data_2 = doing_reset ? 11'h0 : {1'h1, io_update_pc[17:13], _GEN_0, update_wdata_2_ctr};
  assign table_MPORT_data_3 = doing_reset ? 11'h0 : {1'h1, io_update_pc[17:13], _GEN_0, update_wdata_3_ctr};
  wire [6:0]  _GEN_1 = {io_update_pc[10:6], _GEN};
  wire        _GEN_2 = doing_reset | doing_clear_u_hi;
  assign hi_us_MPORT_1_data_0 = ~_GEN_2 & update_hi_wdata_0;
  assign hi_us_MPORT_1_data_1 = ~_GEN_2 & update_hi_wdata_1;
  assign hi_us_MPORT_1_data_2 = ~_GEN_2 & update_hi_wdata_2;
  assign hi_us_MPORT_1_data_3 = ~_GEN_2 & update_hi_wdata_3;
  wire [3:0]  _GEN_3 = {io_update_u_mask_3, io_update_u_mask_2, io_update_u_mask_1, io_update_u_mask_0};
  wire        _GEN_4 = doing_reset | doing_clear_u_lo;
  assign lo_us_MPORT_2_data_0 = ~_GEN_4 & update_lo_wdata_0;
  assign lo_us_MPORT_2_data_1 = ~_GEN_4 & update_lo_wdata_1;
  assign lo_us_MPORT_2_data_2 = ~_GEN_4 & update_lo_wdata_2;
  assign lo_us_MPORT_2_data_3 = ~_GEN_4 & update_lo_wdata_3;
  reg  [6:0]  wrbypass_tags_0;
  reg  [6:0]  wrbypass_tags_1;
  reg  [6:0]  wrbypass_idxs_0;
  reg  [6:0]  wrbypass_idxs_1;
  reg  [2:0]  wrbypass_0_0;
  reg  [2:0]  wrbypass_0_1;
  reg  [2:0]  wrbypass_0_2;
  reg  [2:0]  wrbypass_0_3;
  reg  [2:0]  wrbypass_1_0;
  reg  [2:0]  wrbypass_1_1;
  reg  [2:0]  wrbypass_1_2;
  reg  [2:0]  wrbypass_1_3;
  reg         wrbypass_enq_idx;
  wire        wrbypass_hits_0 = ~doing_reset & wrbypass_tags_0 == update_wdata_3_tag & wrbypass_idxs_0 == update_idx;
  wire        wrbypass_hit = wrbypass_hits_0 | ~doing_reset & wrbypass_tags_1 == update_wdata_3_tag & wrbypass_idxs_1 == update_idx;
  wire [2:0]  _update_wdata_0_ctr_T = io_update_taken_0 ? 3'h4 : 3'h3;
  wire [2:0]  _GEN_5 = wrbypass_hits_0 ? wrbypass_0_0 : wrbypass_1_0;
  wire [2:0]  _GEN_6 = wrbypass_hits_0 ? wrbypass_0_1 : wrbypass_1_1;
  wire [2:0]  _GEN_7 = wrbypass_hits_0 ? wrbypass_0_2 : wrbypass_1_2;
  wire [2:0]  _GEN_8 = wrbypass_hits_0 ? wrbypass_0_3 : wrbypass_1_3;
  wire        _update_wdata_0_ctr_T_2 = _GEN_5 == 3'h0;
  wire [2:0]  _update_wdata_0_ctr_T_3 = _GEN_5 - 3'h1;
  wire [2:0]  _update_wdata_0_ctr_T_7 = _GEN_5 + 3'h1;
  wire [2:0]  _update_wdata_0_ctr_T_20 = io_update_taken_0 ? ((&io_update_old_ctr_0) ? 3'h7 : io_update_old_ctr_0 + 3'h1) : io_update_old_ctr_0 == 3'h0 ? 3'h0 : io_update_old_ctr_0 - 3'h1;
  assign update_wdata_0_ctr = io_update_alloc_0 ? _update_wdata_0_ctr_T : wrbypass_hit ? (io_update_taken_0 ? ((&_GEN_5) ? 3'h7 : _update_wdata_0_ctr_T_7) : _update_wdata_0_ctr_T_2 ? 3'h0 : _update_wdata_0_ctr_T_3) : _update_wdata_0_ctr_T_20;
  assign update_hi_wdata_0 = io_update_u_0[1];
  assign update_lo_wdata_0 = io_update_u_0[0];
  wire [2:0]  _update_wdata_1_ctr_T = io_update_taken_1 ? 3'h4 : 3'h3;
  wire        _update_wdata_1_ctr_T_2 = _GEN_6 == 3'h0;
  wire [2:0]  _update_wdata_1_ctr_T_3 = _GEN_6 - 3'h1;
  wire [2:0]  _update_wdata_1_ctr_T_7 = _GEN_6 + 3'h1;
  wire [2:0]  _update_wdata_1_ctr_T_20 = io_update_taken_1 ? ((&io_update_old_ctr_1) ? 3'h7 : io_update_old_ctr_1 + 3'h1) : io_update_old_ctr_1 == 3'h0 ? 3'h0 : io_update_old_ctr_1 - 3'h1;
  assign update_wdata_1_ctr = io_update_alloc_1 ? _update_wdata_1_ctr_T : wrbypass_hit ? (io_update_taken_1 ? ((&_GEN_6) ? 3'h7 : _update_wdata_1_ctr_T_7) : _update_wdata_1_ctr_T_2 ? 3'h0 : _update_wdata_1_ctr_T_3) : _update_wdata_1_ctr_T_20;
  assign update_hi_wdata_1 = io_update_u_1[1];
  assign update_lo_wdata_1 = io_update_u_1[0];
  wire [2:0]  _update_wdata_2_ctr_T = io_update_taken_2 ? 3'h4 : 3'h3;
  wire        _update_wdata_2_ctr_T_2 = _GEN_7 == 3'h0;
  wire [2:0]  _update_wdata_2_ctr_T_3 = _GEN_7 - 3'h1;
  wire [2:0]  _update_wdata_2_ctr_T_7 = _GEN_7 + 3'h1;
  wire [2:0]  _update_wdata_2_ctr_T_20 = io_update_taken_2 ? ((&io_update_old_ctr_2) ? 3'h7 : io_update_old_ctr_2 + 3'h1) : io_update_old_ctr_2 == 3'h0 ? 3'h0 : io_update_old_ctr_2 - 3'h1;
  assign update_wdata_2_ctr = io_update_alloc_2 ? _update_wdata_2_ctr_T : wrbypass_hit ? (io_update_taken_2 ? ((&_GEN_7) ? 3'h7 : _update_wdata_2_ctr_T_7) : _update_wdata_2_ctr_T_2 ? 3'h0 : _update_wdata_2_ctr_T_3) : _update_wdata_2_ctr_T_20;
  assign update_hi_wdata_2 = io_update_u_2[1];
  assign update_lo_wdata_2 = io_update_u_2[0];
  wire [2:0]  _update_wdata_3_ctr_T = io_update_taken_3 ? 3'h4 : 3'h3;
  wire        _update_wdata_3_ctr_T_2 = _GEN_8 == 3'h0;
  wire [2:0]  _update_wdata_3_ctr_T_3 = _GEN_8 - 3'h1;
  wire [2:0]  _update_wdata_3_ctr_T_7 = _GEN_8 + 3'h1;
  wire [2:0]  _update_wdata_3_ctr_T_20 = io_update_taken_3 ? ((&io_update_old_ctr_3) ? 3'h7 : io_update_old_ctr_3 + 3'h1) : io_update_old_ctr_3 == 3'h0 ? 3'h0 : io_update_old_ctr_3 - 3'h1;
  assign update_wdata_3_ctr = io_update_alloc_3 ? _update_wdata_3_ctr_T : wrbypass_hit ? (io_update_taken_3 ? ((&_GEN_8) ? 3'h7 : _update_wdata_3_ctr_T_7) : _update_wdata_3_ctr_T_2 ? 3'h0 : _update_wdata_3_ctr_T_3) : _update_wdata_3_ctr_T_20;
  assign update_hi_wdata_3 = io_update_u_3[1];
  assign update_lo_wdata_3 = io_update_u_3[0];
  wire        _GEN_9 = io_update_mask_0 | io_update_mask_1 | io_update_mask_2 | io_update_mask_3;
  wire        _GEN_10 = ~_GEN_9 | wrbypass_hit | wrbypass_enq_idx;
  wire        _GEN_11 = ~_GEN_9 | wrbypass_hit | ~wrbypass_enq_idx;
  always @(posedge clock) begin
    if (reset) begin
      doing_reset <= 1'h1;
      reset_idx <= 7'h0;
      clear_u_ctr <= 19'h0;
      wrbypass_enq_idx <= 1'h0;
    end
    else begin
      doing_reset <= reset_idx != 7'h7F & doing_reset;
      reset_idx <= reset_idx + {6'h0, doing_reset};
      if (doing_reset)
        clear_u_ctr <= 19'h1;
      else
        clear_u_ctr <= clear_u_ctr + 19'h1;
      if (~_GEN_9 | wrbypass_hit) begin
      end
      else
        wrbypass_enq_idx <= wrbypass_enq_idx - 1'h1;
    end
    s2_tag <= {io_f1_req_pc[17:13], io_f1_req_pc[12:11] ^ io_f1_req_ghist[1:0]};
    io_f3_resp_0_valid_REG <= _table_ext_R0_data[10] & _table_ext_R0_data[9:3] == s2_tag & ~doing_reset;
    io_f3_resp_0_bits_u_REG <= {_hi_us_ext_R0_data[0], _lo_us_ext_R0_data[0]};
    io_f3_resp_0_bits_ctr_REG <= _table_ext_R0_data[2:0];
    io_f3_resp_1_valid_REG <= _table_ext_R0_data[21] & _table_ext_R0_data[20:14] == s2_tag & ~doing_reset;
    io_f3_resp_1_bits_u_REG <= {_hi_us_ext_R0_data[1], _lo_us_ext_R0_data[1]};
    io_f3_resp_1_bits_ctr_REG <= _table_ext_R0_data[13:11];
    io_f3_resp_2_valid_REG <= _table_ext_R0_data[32] & _table_ext_R0_data[31:25] == s2_tag & ~doing_reset;
    io_f3_resp_2_bits_u_REG <= {_hi_us_ext_R0_data[2], _lo_us_ext_R0_data[2]};
    io_f3_resp_2_bits_ctr_REG <= _table_ext_R0_data[24:22];
    io_f3_resp_3_valid_REG <= _table_ext_R0_data[43] & _table_ext_R0_data[42:36] == s2_tag & ~doing_reset;
    io_f3_resp_3_bits_u_REG <= {_hi_us_ext_R0_data[3], _lo_us_ext_R0_data[3]};
    io_f3_resp_3_bits_ctr_REG <= _table_ext_R0_data[35:33];
    if (_GEN_10) begin
    end
    else
      wrbypass_tags_0 <= update_wdata_3_tag;
    if (_GEN_11) begin
    end
    else
      wrbypass_tags_1 <= update_wdata_3_tag;
    if (_GEN_10) begin
    end
    else
      wrbypass_idxs_0 <= update_idx;
    if (_GEN_11) begin
    end
    else
      wrbypass_idxs_1 <= update_idx;
    if (_GEN_9) begin
      if (wrbypass_hit) begin
        if (wrbypass_hits_0) begin
          if (io_update_alloc_0)
            wrbypass_0_0 <= _update_wdata_0_ctr_T;
          else if (wrbypass_hit) begin
            if (io_update_taken_0) begin
              if (&_GEN_5)
                wrbypass_0_0 <= 3'h7;
              else
                wrbypass_0_0 <= _update_wdata_0_ctr_T_7;
            end
            else if (_update_wdata_0_ctr_T_2)
              wrbypass_0_0 <= 3'h0;
            else
              wrbypass_0_0 <= _update_wdata_0_ctr_T_3;
          end
          else
            wrbypass_0_0 <= _update_wdata_0_ctr_T_20;
          if (io_update_alloc_1)
            wrbypass_0_1 <= _update_wdata_1_ctr_T;
          else if (wrbypass_hit) begin
            if (io_update_taken_1) begin
              if (&_GEN_6)
                wrbypass_0_1 <= 3'h7;
              else
                wrbypass_0_1 <= _update_wdata_1_ctr_T_7;
            end
            else if (_update_wdata_1_ctr_T_2)
              wrbypass_0_1 <= 3'h0;
            else
              wrbypass_0_1 <= _update_wdata_1_ctr_T_3;
          end
          else
            wrbypass_0_1 <= _update_wdata_1_ctr_T_20;
          if (io_update_alloc_2)
            wrbypass_0_2 <= _update_wdata_2_ctr_T;
          else if (wrbypass_hit) begin
            if (io_update_taken_2) begin
              if (&_GEN_7)
                wrbypass_0_2 <= 3'h7;
              else
                wrbypass_0_2 <= _update_wdata_2_ctr_T_7;
            end
            else if (_update_wdata_2_ctr_T_2)
              wrbypass_0_2 <= 3'h0;
            else
              wrbypass_0_2 <= _update_wdata_2_ctr_T_3;
          end
          else
            wrbypass_0_2 <= _update_wdata_2_ctr_T_20;
          if (io_update_alloc_3)
            wrbypass_0_3 <= _update_wdata_3_ctr_T;
          else if (wrbypass_hit) begin
            if (io_update_taken_3) begin
              if (&_GEN_8)
                wrbypass_0_3 <= 3'h7;
              else
                wrbypass_0_3 <= _update_wdata_3_ctr_T_7;
            end
            else if (_update_wdata_3_ctr_T_2)
              wrbypass_0_3 <= 3'h0;
            else
              wrbypass_0_3 <= _update_wdata_3_ctr_T_3;
          end
          else
            wrbypass_0_3 <= _update_wdata_3_ctr_T_20;
        end
        else begin
          if (io_update_alloc_0)
            wrbypass_1_0 <= _update_wdata_0_ctr_T;
          else if (wrbypass_hit) begin
            if (io_update_taken_0) begin
              if (&_GEN_5)
                wrbypass_1_0 <= 3'h7;
              else
                wrbypass_1_0 <= _update_wdata_0_ctr_T_7;
            end
            else if (_update_wdata_0_ctr_T_2)
              wrbypass_1_0 <= 3'h0;
            else
              wrbypass_1_0 <= _update_wdata_0_ctr_T_3;
          end
          else
            wrbypass_1_0 <= _update_wdata_0_ctr_T_20;
          if (io_update_alloc_1)
            wrbypass_1_1 <= _update_wdata_1_ctr_T;
          else if (wrbypass_hit) begin
            if (io_update_taken_1) begin
              if (&_GEN_6)
                wrbypass_1_1 <= 3'h7;
              else
                wrbypass_1_1 <= _update_wdata_1_ctr_T_7;
            end
            else if (_update_wdata_1_ctr_T_2)
              wrbypass_1_1 <= 3'h0;
            else
              wrbypass_1_1 <= _update_wdata_1_ctr_T_3;
          end
          else
            wrbypass_1_1 <= _update_wdata_1_ctr_T_20;
          if (io_update_alloc_2)
            wrbypass_1_2 <= _update_wdata_2_ctr_T;
          else if (wrbypass_hit) begin
            if (io_update_taken_2) begin
              if (&_GEN_7)
                wrbypass_1_2 <= 3'h7;
              else
                wrbypass_1_2 <= _update_wdata_2_ctr_T_7;
            end
            else if (_update_wdata_2_ctr_T_2)
              wrbypass_1_2 <= 3'h0;
            else
              wrbypass_1_2 <= _update_wdata_2_ctr_T_3;
          end
          else
            wrbypass_1_2 <= _update_wdata_2_ctr_T_20;
          if (io_update_alloc_3)
            wrbypass_1_3 <= _update_wdata_3_ctr_T;
          else if (wrbypass_hit) begin
            if (io_update_taken_3) begin
              if (&_GEN_8)
                wrbypass_1_3 <= 3'h7;
              else
                wrbypass_1_3 <= _update_wdata_3_ctr_T_7;
            end
            else if (_update_wdata_3_ctr_T_2)
              wrbypass_1_3 <= 3'h0;
            else
              wrbypass_1_3 <= _update_wdata_3_ctr_T_3;
          end
          else
            wrbypass_1_3 <= _update_wdata_3_ctr_T_20;
        end
      end
      else if (wrbypass_enq_idx) begin
        if (io_update_alloc_0)
          wrbypass_1_0 <= _update_wdata_0_ctr_T;
        else if (wrbypass_hit) begin
          if (io_update_taken_0) begin
            if (&_GEN_5)
              wrbypass_1_0 <= 3'h7;
            else
              wrbypass_1_0 <= _update_wdata_0_ctr_T_7;
          end
          else if (_update_wdata_0_ctr_T_2)
            wrbypass_1_0 <= 3'h0;
          else
            wrbypass_1_0 <= _update_wdata_0_ctr_T_3;
        end
        else
          wrbypass_1_0 <= _update_wdata_0_ctr_T_20;
        if (io_update_alloc_1)
          wrbypass_1_1 <= _update_wdata_1_ctr_T;
        else if (wrbypass_hit) begin
          if (io_update_taken_1) begin
            if (&_GEN_6)
              wrbypass_1_1 <= 3'h7;
            else
              wrbypass_1_1 <= _update_wdata_1_ctr_T_7;
          end
          else if (_update_wdata_1_ctr_T_2)
            wrbypass_1_1 <= 3'h0;
          else
            wrbypass_1_1 <= _update_wdata_1_ctr_T_3;
        end
        else
          wrbypass_1_1 <= _update_wdata_1_ctr_T_20;
        if (io_update_alloc_2)
          wrbypass_1_2 <= _update_wdata_2_ctr_T;
        else if (wrbypass_hit) begin
          if (io_update_taken_2) begin
            if (&_GEN_7)
              wrbypass_1_2 <= 3'h7;
            else
              wrbypass_1_2 <= _update_wdata_2_ctr_T_7;
          end
          else if (_update_wdata_2_ctr_T_2)
            wrbypass_1_2 <= 3'h0;
          else
            wrbypass_1_2 <= _update_wdata_2_ctr_T_3;
        end
        else
          wrbypass_1_2 <= _update_wdata_2_ctr_T_20;
        if (io_update_alloc_3)
          wrbypass_1_3 <= _update_wdata_3_ctr_T;
        else if (wrbypass_hit) begin
          if (io_update_taken_3) begin
            if (&_GEN_8)
              wrbypass_1_3 <= 3'h7;
            else
              wrbypass_1_3 <= _update_wdata_3_ctr_T_7;
          end
          else if (_update_wdata_3_ctr_T_2)
            wrbypass_1_3 <= 3'h0;
          else
            wrbypass_1_3 <= _update_wdata_3_ctr_T_3;
        end
        else
          wrbypass_1_3 <= _update_wdata_3_ctr_T_20;
      end
      else begin
        if (io_update_alloc_0)
          wrbypass_0_0 <= _update_wdata_0_ctr_T;
        else if (wrbypass_hit) begin
          if (io_update_taken_0) begin
            if (&_GEN_5)
              wrbypass_0_0 <= 3'h7;
            else
              wrbypass_0_0 <= _update_wdata_0_ctr_T_7;
          end
          else if (_update_wdata_0_ctr_T_2)
            wrbypass_0_0 <= 3'h0;
          else
            wrbypass_0_0 <= _update_wdata_0_ctr_T_3;
        end
        else
          wrbypass_0_0 <= _update_wdata_0_ctr_T_20;
        if (io_update_alloc_1)
          wrbypass_0_1 <= _update_wdata_1_ctr_T;
        else if (wrbypass_hit) begin
          if (io_update_taken_1) begin
            if (&_GEN_6)
              wrbypass_0_1 <= 3'h7;
            else
              wrbypass_0_1 <= _update_wdata_1_ctr_T_7;
          end
          else if (_update_wdata_1_ctr_T_2)
            wrbypass_0_1 <= 3'h0;
          else
            wrbypass_0_1 <= _update_wdata_1_ctr_T_3;
        end
        else
          wrbypass_0_1 <= _update_wdata_1_ctr_T_20;
        if (io_update_alloc_2)
          wrbypass_0_2 <= _update_wdata_2_ctr_T;
        else if (wrbypass_hit) begin
          if (io_update_taken_2) begin
            if (&_GEN_7)
              wrbypass_0_2 <= 3'h7;
            else
              wrbypass_0_2 <= _update_wdata_2_ctr_T_7;
          end
          else if (_update_wdata_2_ctr_T_2)
            wrbypass_0_2 <= 3'h0;
          else
            wrbypass_0_2 <= _update_wdata_2_ctr_T_3;
        end
        else
          wrbypass_0_2 <= _update_wdata_2_ctr_T_20;
        if (io_update_alloc_3)
          wrbypass_0_3 <= _update_wdata_3_ctr_T;
        else if (wrbypass_hit) begin
          if (io_update_taken_3) begin
            if (&_GEN_8)
              wrbypass_0_3 <= 3'h7;
            else
              wrbypass_0_3 <= _update_wdata_3_ctr_T_7;
          end
          else if (_update_wdata_3_ctr_T_2)
            wrbypass_0_3 <= 3'h0;
          else
            wrbypass_0_3 <= _update_wdata_3_ctr_T_3;
        end
        else
          wrbypass_0_3 <= _update_wdata_3_ctr_T_20;
      end
    end
  end // always @(posedge)
  mem_128x4 hi_us_ext (
    .R0_addr (_s2_req_rlous_T_1),
    .R0_en   (io_f1_req_valid),
    .R0_clk  (clock),
    .R0_data (_hi_us_ext_R0_data),
    .W0_addr (doing_reset ? reset_idx : doing_clear_u_hi ? clear_u_ctr[17:11] : _GEN_1),
    .W0_en   (1'h1),
    .W0_clk  (clock),
    .W0_data ({hi_us_MPORT_1_data_3, hi_us_MPORT_1_data_2, hi_us_MPORT_1_data_1, hi_us_MPORT_1_data_0}),
    .W0_mask (_GEN_2 ? 4'hF : _GEN_3)
  );
  mem_128x4 lo_us_ext (
    .R0_addr (_s2_req_rlous_T_1),
    .R0_en   (io_f1_req_valid),
    .R0_clk  (clock),
    .R0_data (_lo_us_ext_R0_data),
    .W0_addr (doing_reset ? reset_idx : doing_clear_u_lo ? clear_u_ctr[17:11] : _GEN_1),
    .W0_en   (1'h1),
    .W0_clk  (clock),
    .W0_data ({lo_us_MPORT_2_data_3, lo_us_MPORT_2_data_2, lo_us_MPORT_2_data_1, lo_us_MPORT_2_data_0}),
    .W0_mask (_GEN_4 ? 4'hF : _GEN_3)
  );
  table_128x44 table_ext (
    .R0_addr (_s2_req_rlous_T_1),
    .R0_en   (io_f1_req_valid),
    .R0_clk  (clock),
    .R0_data (_table_ext_R0_data),
    .W0_addr (doing_reset ? reset_idx : update_idx),
    .W0_en   (1'h1),
    .W0_clk  (clock),
    .W0_data ({table_MPORT_data_3, table_MPORT_data_2, table_MPORT_data_1, table_MPORT_data_0}),
    .W0_mask (doing_reset ? 4'hF : {io_update_mask_3, io_update_mask_2, io_update_mask_1, io_update_mask_0})
  );
  assign io_f3_resp_0_valid = io_f3_resp_0_valid_REG;
  assign io_f3_resp_0_bits_ctr = io_f3_resp_0_bits_ctr_REG;
  assign io_f3_resp_0_bits_u = io_f3_resp_0_bits_u_REG;
  assign io_f3_resp_1_valid = io_f3_resp_1_valid_REG;
  assign io_f3_resp_1_bits_ctr = io_f3_resp_1_bits_ctr_REG;
  assign io_f3_resp_1_bits_u = io_f3_resp_1_bits_u_REG;
  assign io_f3_resp_2_valid = io_f3_resp_2_valid_REG;
  assign io_f3_resp_2_bits_ctr = io_f3_resp_2_bits_ctr_REG;
  assign io_f3_resp_2_bits_u = io_f3_resp_2_bits_u_REG;
  assign io_f3_resp_3_valid = io_f3_resp_3_valid_REG;
  assign io_f3_resp_3_bits_ctr = io_f3_resp_3_bits_ctr_REG;
  assign io_f3_resp_3_bits_u = io_f3_resp_3_bits_u_REG;
endmodule

