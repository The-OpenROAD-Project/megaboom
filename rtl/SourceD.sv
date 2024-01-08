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

module SourceD(
  input         clock,
                reset,
  output        io_req_ready,
  input         io_req_valid,
                io_req_bits_prio_0,
                io_req_bits_prio_2,
  input  [2:0]  io_req_bits_opcode,
                io_req_bits_param,
                io_req_bits_size,
  input  [5:0]  io_req_bits_source,
                io_req_bits_offset,
                io_req_bits_put,
  input  [9:0]  io_req_bits_set,
  input  [2:0]  io_req_bits_sink,
                io_req_bits_way,
  input         io_req_bits_bad,
                io_d_ready,
  output        io_d_valid,
  output [2:0]  io_d_bits_opcode,
  output [1:0]  io_d_bits_param,
  output [2:0]  io_d_bits_size,
  output [5:0]  io_d_bits_source,
  output [2:0]  io_d_bits_sink,
  output        io_d_bits_denied,
  output [63:0] io_d_bits_data,
  output        io_d_bits_corrupt,
  input         io_pb_pop_ready,
  output        io_pb_pop_valid,
  output [5:0]  io_pb_pop_bits_index,
  output        io_pb_pop_bits_last,
  input  [63:0] io_pb_beat_data,
  input  [7:0]  io_pb_beat_mask,
  input         io_pb_beat_corrupt,
                io_rel_pop_ready,
  output        io_rel_pop_valid,
  output [5:0]  io_rel_pop_bits_index,
  output        io_rel_pop_bits_last,
  input  [63:0] io_rel_beat_data,
  input         io_rel_beat_corrupt,
                io_bs_radr_ready,
  output        io_bs_radr_valid,
  output [2:0]  io_bs_radr_bits_way,
  output [9:0]  io_bs_radr_bits_set,
  output [2:0]  io_bs_radr_bits_beat,
  output        io_bs_radr_bits_mask,
  input  [63:0] io_bs_rdat_data,
  input         io_bs_wadr_ready,
  output        io_bs_wadr_valid,
  output [2:0]  io_bs_wadr_bits_way,
  output [9:0]  io_bs_wadr_bits_set,
  output [2:0]  io_bs_wadr_bits_beat,
  output        io_bs_wadr_bits_mask,
  output [63:0] io_bs_wdat_data,
  input  [9:0]  io_evict_req_set,
  input  [2:0]  io_evict_req_way,
  output        io_evict_safe,
  input  [9:0]  io_grant_req_set,
  input  [2:0]  io_grant_req_way,
  output        io_grant_safe
);

  wire        s1_x_bypass;
  wire [63:0] s3_bypass_data;
  wire        s4_ready;
  wire        s3_ready;
  wire        s3_valid;
  wire [63:0] _atomics_io_data_out;
  wire        _queue_io_enq_ready;
  wire        _queue_io_deq_valid;
  wire [63:0] _queue_io_deq_bits_data;
  reg         busy;
  reg         s1_block_r;
  reg  [2:0]  s1_counter;
  reg         s1_req_reg_prio_0;
  reg         s1_req_reg_prio_2;
  reg  [2:0]  s1_req_reg_opcode;
  reg  [2:0]  s1_req_reg_param;
  reg  [2:0]  s1_req_reg_size;
  reg  [5:0]  s1_req_reg_source;
  reg  [5:0]  s1_req_reg_offset;
  reg  [5:0]  s1_req_reg_put;
  reg  [9:0]  s1_req_reg_set;
  reg  [2:0]  s1_req_reg_sink;
  reg  [2:0]  s1_req_reg_way;
  reg         s1_req_reg_bad;
  wire        s1_req_prio_0 = busy ? s1_req_reg_prio_0 : io_req_bits_prio_0;
  wire [2:0]  s1_req_opcode = busy ? s1_req_reg_opcode : io_req_bits_opcode;
  wire [2:0]  s1_req_param = busy ? s1_req_reg_param : io_req_bits_param;
  wire [2:0]  s1_req_size = busy ? s1_req_reg_size : io_req_bits_size;
  wire [9:0]  s1_req_set = busy ? s1_req_reg_set : io_req_bits_set;
  wire [2:0]  s1_req_way = busy ? s1_req_reg_way : io_req_bits_way;
  wire        _s1_valid_T = busy | io_req_valid;
  reg         s1_latch_bypass;
  reg         s1_bypass_r;
  wire        s1_bypass = s1_latch_bypass ? s1_x_bypass : s1_bypass_r;
  wire        _s1_single_T_2 = s1_req_opcode == 3'h6;
  wire        s1_grant = _s1_single_T_2 & s1_req_param == 3'h2 | (&s1_req_opcode);
  wire        s1_need_r = ~s1_bypass & s1_req_prio_0 & s1_req_opcode != 3'h5 & ~s1_grant & ((|s1_req_opcode) | s1_req_size < 3'h3);
  wire        _io_bs_radr_valid_output = _s1_valid_T & s1_need_r & ~s1_block_r;
  wire [2:0]  s1_beat = (busy ? s1_req_reg_offset[5:3] : io_req_bits_offset[5:3]) | s1_counter;
  reg         queue_io_enq_valid_REG;
  reg         queue_io_enq_valid_REG_1;
  reg         s2_full;
  reg         s2_valid_pb;
  reg  [2:0]  s2_beat;
  reg         s2_bypass;
  reg         s2_req_prio_0;
  reg         s2_req_prio_2;
  reg  [2:0]  s2_req_opcode;
  reg  [2:0]  s2_req_param;
  reg  [2:0]  s2_req_size;
  reg  [5:0]  s2_req_source;
  reg  [5:0]  s2_req_put;
  reg  [9:0]  s2_req_set;
  reg  [2:0]  s2_req_sink;
  reg  [2:0]  s2_req_way;
  reg         s2_req_bad;
  reg         s2_last;
  reg         s2_need_r;
  reg         s2_need_pb;
  reg         s2_retires;
  reg         s2_need_d;
  reg  [63:0] s2_pdata_r_data;
  reg  [7:0]  s2_pdata_r_mask;
  reg         s2_pdata_r_corrupt;
  wire [63:0] s2_pdata_raw_data = s2_req_prio_0 ? io_pb_beat_data : io_rel_beat_data;
  wire [7:0]  s2_pdata_raw_mask = s2_req_prio_0 ? io_pb_beat_mask : 8'hFF;
  wire        s2_pdata_raw_corrupt = s2_req_prio_0 ? io_pb_beat_corrupt : io_rel_beat_corrupt;
  wire        pb_ready = s2_req_prio_0 ? io_pb_pop_ready : io_rel_pop_ready;
  wire        s2_ready = ~s2_full | s3_ready & (~s2_valid_pb | pb_ready);
  reg         s3_full;
  reg         s3_valid_d;
  reg  [2:0]  s3_beat;
  reg         s3_bypass;
  reg         s3_req_prio_0;
  reg         s3_req_prio_2;
  reg  [2:0]  s3_req_opcode;
  reg  [2:0]  s3_req_param;
  reg  [2:0]  s3_req_size;
  reg  [5:0]  s3_req_source;
  reg  [9:0]  s3_req_set;
  reg  [2:0]  s3_req_sink;
  reg  [2:0]  s3_req_way;
  reg         s3_req_bad;
  reg  [63:0] s3_pdata_data;
  reg  [7:0]  s3_pdata_mask;
  reg         s3_pdata_corrupt;
  reg         s3_need_pb;
  reg         s3_retires;
  reg         s3_need_r;
  wire [63:0] d_bits_data = s3_bypass ? s3_bypass_data : _queue_io_deq_bits_data;
  reg  [2:0]  casez_tmp;
  always @(*) begin
    casez (s3_req_opcode)
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
        casez_tmp = {2'h2, s3_req_param != 3'h2};
      default:
        casez_tmp = 3'h4;
    endcase
  end // always @(*)
  wire [2:0]  d_bits_opcode = s3_req_prio_0 ? casez_tmp : 3'h6;
  wire        _queue_io_deq_ready_T = s3_valid & s4_ready;
  assign s3_valid = s3_full & (~s3_valid_d | io_d_ready);
  assign s3_ready = ~s3_full | s4_ready & (~s3_valid_d | io_d_ready);
  reg         s4_full;
  reg  [2:0]  s4_beat;
  reg         s4_need_bs;
  reg         s4_need_pb;
  reg         s4_req_prio_2;
  reg  [2:0]  s4_req_param;
  reg  [9:0]  s4_req_set;
  reg  [2:0]  s4_req_way;
  reg  [2:0]  s4_adjusted_opcode;
  reg  [63:0] s4_pdata_data;
  reg  [7:0]  s4_pdata_mask;
  reg         s4_pdata_corrupt;
  reg  [63:0] s4_rdata;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~(~queue_io_enq_valid_REG_1 | _queue_io_enq_ready)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at SourceD.scala:123 assert (!queue.io.enq.valid || queue.io.enq.ready)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~s3_full | ~s3_need_r | _queue_io_deq_valid)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at SourceD.scala:232 assert (!s3_full || !s3_need_r || queue.io.deq.valid)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & s4_full & s4_need_pb & s4_pdata_corrupt) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: Data poisoning unsupported\n    at SourceD.scala:277 assert (!(s4_full && s4_need_pb && s4_pdata.corrupt), \"Data poisoning unsupported\")\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  assign s4_ready = ~s3_retires | ~s4_full | io_bs_wadr_ready | ~s4_need_bs;
  reg  [9:0]  s5_req_set;
  reg  [2:0]  s5_req_way;
  reg  [2:0]  s5_beat;
  reg  [63:0] s5_dat;
  reg  [9:0]  s6_req_set;
  reg  [2:0]  s6_req_way;
  reg  [2:0]  s6_beat;
  reg  [63:0] s6_dat;
  reg  [63:0] s7_dat;
  reg         s3_bypass_data_REG;
  reg  [63:0] s3_bypass_data_REG_1;
  assign s3_bypass_data = s3_bypass_data_REG ? _atomics_io_data_out : s3_bypass_data_REG_1;
  assign s1_x_bypass = s2_req_set == s1_req_set & s2_req_way == s1_req_way & s2_beat == s1_beat & s2_full & s2_retires | s3_req_set == s1_req_set & s3_req_way == s1_req_way & s3_beat == s1_beat & s3_full & s3_retires | s4_req_set == s1_req_set & s4_req_way == s1_req_way & s4_beat == s1_beat & s4_full;
  wire        s1_need_pb = s1_req_prio_0 ? ~(s1_req_opcode[2]) : s1_req_opcode[0];
  wire        s1_single = s1_req_prio_0 ? s1_req_opcode == 3'h5 | s1_grant : _s1_single_T_2;
  wire [12:0] _s1_beats1_T_1 = 13'h3F << s1_req_size;
  wire        s1_last = s1_counter == (s1_single ? 3'h0 : ~(_s1_beats1_T_1[5:3]));
  wire        _queue_io_enq_valid_T = io_bs_radr_ready & _io_bs_radr_valid_output;
  wire        s2_latch = _s1_valid_T & (~_io_bs_radr_valid_output | io_bs_radr_ready) & s2_ready;
  wire        s3_latch = s2_full & (~s2_valid_pb | pb_ready) & s3_ready;
  wire        s4_latch = s3_valid & s3_retires & s4_ready;
  wire        retire = s4_full & (io_bs_wadr_ready | ~s4_need_bs);
  wire [9:0]  pre_s3_req_set = s3_latch ? s2_req_set : s3_req_set;
  wire [2:0]  pre_s3_req_way = s3_latch ? s2_req_way : s3_req_way;
  wire [2:0]  pre_s3_beat = s3_latch ? s2_beat : s3_beat;
  always @(posedge clock) begin
    if (reset) begin
      busy <= 1'h0;
      s1_block_r <= 1'h0;
      s1_counter <= 3'h0;
      s2_full <= 1'h0;
      s2_valid_pb <= 1'h0;
      s3_full <= 1'h0;
      s3_valid_d <= 1'h0;
      s4_full <= 1'h0;
    end
    else begin
      busy <= ~(s2_latch & s1_last) & (io_req_valid | busy);
      s1_block_r <= ~s2_latch & (_queue_io_enq_valid_T | s1_block_r);
      if (s2_latch) begin
        if (s1_last)
          s1_counter <= 3'h0;
        else
          s1_counter <= s1_counter + 3'h1;
        s2_valid_pb <= s1_need_pb;
      end
      else
        s2_valid_pb <= ~pb_ready & s2_valid_pb;
      s2_full <= s2_latch | ~s3_latch & s2_full;
      s3_full <= s3_latch | ~_queue_io_deq_ready_T & s3_full;
      if (s3_latch)
        s3_valid_d <= s2_need_d;
      else
        s3_valid_d <= ~io_d_ready & s3_valid_d;
      s4_full <= s4_latch | ~(io_bs_wadr_ready | ~s4_need_bs) & s4_full;
    end
    if (~busy & io_req_valid) begin
      s1_req_reg_prio_0 <= io_req_bits_prio_0;
      s1_req_reg_prio_2 <= io_req_bits_prio_2;
      s1_req_reg_opcode <= io_req_bits_opcode;
      s1_req_reg_param <= io_req_bits_param;
      s1_req_reg_size <= io_req_bits_size;
      s1_req_reg_source <= io_req_bits_source;
      s1_req_reg_offset <= io_req_bits_offset;
      s1_req_reg_put <= io_req_bits_put;
      s1_req_reg_set <= io_req_bits_set;
      s1_req_reg_sink <= io_req_bits_sink;
      s1_req_reg_way <= io_req_bits_way;
      s1_req_reg_bad <= io_req_bits_bad;
    end
    s1_latch_bypass <= ~_s1_valid_T | s2_ready;
    if (s1_latch_bypass)
      s1_bypass_r <= s1_x_bypass;
    queue_io_enq_valid_REG <= _queue_io_enq_valid_T;
    queue_io_enq_valid_REG_1 <= queue_io_enq_valid_REG;
    if (s2_latch) begin
      s2_beat <= s1_beat;
      s2_bypass <= s1_bypass;
      s2_req_prio_0 <= s1_req_prio_0;
      s2_req_prio_2 <= busy ? s1_req_reg_prio_2 : io_req_bits_prio_2;
      s2_req_opcode <= s1_req_opcode;
      s2_req_param <= s1_req_param;
      s2_req_size <= s1_req_size;
      s2_req_source <= busy ? s1_req_reg_source : io_req_bits_source;
      s2_req_put <= busy ? s1_req_reg_put : io_req_bits_put;
      s2_req_set <= s1_req_set;
      s2_req_sink <= busy ? s1_req_reg_sink : io_req_bits_sink;
      s2_req_way <= s1_req_way;
      s2_req_bad <= busy ? s1_req_reg_bad : io_req_bits_bad;
      s2_last <= s1_last;
      s2_need_r <= s1_need_r;
      s2_need_pb <= s1_need_pb;
      s2_retires <= ~s1_single;
      s2_need_d <= ~s1_need_pb | s1_counter == 3'h0;
    end
    if (s2_valid_pb) begin
      s2_pdata_r_data <= s2_pdata_raw_data;
      s2_pdata_r_mask <= s2_pdata_raw_mask;
      s2_pdata_r_corrupt <= s2_pdata_raw_corrupt;
    end
    if (s3_latch) begin
      s3_beat <= s2_beat;
      s3_bypass <= s2_bypass;
      s3_req_prio_0 <= s2_req_prio_0;
      s3_req_prio_2 <= s2_req_prio_2;
      s3_req_opcode <= s2_req_opcode;
      s3_req_param <= s2_req_param;
      s3_req_size <= s2_req_size;
      s3_req_source <= s2_req_source;
      s3_req_set <= s2_req_set;
      s3_req_sink <= s2_req_sink;
      s3_req_way <= s2_req_way;
      s3_req_bad <= s2_req_bad;
      s3_pdata_data <= s2_valid_pb ? s2_pdata_raw_data : s2_pdata_r_data;
      s3_pdata_mask <= s2_valid_pb ? s2_pdata_raw_mask : s2_pdata_r_mask;
      s3_pdata_corrupt <= s2_valid_pb ? s2_pdata_raw_corrupt : s2_pdata_r_corrupt;
      s3_need_pb <= s2_need_pb;
      s3_retires <= s2_retires;
      s3_need_r <= s2_need_r;
    end
    if (s4_latch) begin
      s4_beat <= s3_beat;
      s4_need_bs <= s3_need_pb;
      s4_need_pb <= s3_need_pb;
      s4_req_prio_2 <= s3_req_prio_2;
      s4_req_param <= s3_req_param;
      s4_req_set <= s3_req_set;
      s4_req_way <= s3_req_way;
      s4_adjusted_opcode <= s3_req_bad ? 3'h4 : s3_req_opcode;
      s4_pdata_data <= s3_pdata_data;
      s4_pdata_mask <= s3_pdata_mask;
      s4_pdata_corrupt <= s3_pdata_corrupt;
      s4_rdata <= d_bits_data;
    end
    if (retire) begin
      s5_req_set <= s4_req_set;
      s5_req_way <= s4_req_way;
      s5_beat <= s4_beat;
      s5_dat <= _atomics_io_data_out;
      s6_req_set <= s5_req_set;
      s6_req_way <= s5_req_way;
      s6_beat <= s5_beat;
      s6_dat <= s5_dat;
      s7_dat <= s6_dat;
    end
    s3_bypass_data_REG <= (s4_latch ? s3_req_set : s4_req_set) == pre_s3_req_set & (s4_latch ? s3_req_way : s4_req_way) == pre_s3_req_way & (s4_latch ? s3_beat : s4_beat) == pre_s3_beat & (s4_latch | ~(io_bs_wadr_ready | ~s4_need_bs) & s4_full);
    s3_bypass_data_REG_1 <= (retire ? s4_req_set : s5_req_set) == pre_s3_req_set & (retire ? s4_req_way : s5_req_way) == pre_s3_req_way & (retire ? s4_beat : s5_beat) == pre_s3_beat ? (retire ? _atomics_io_data_out : s5_dat) : (retire ? s5_req_set : s6_req_set) == pre_s3_req_set & (retire ? s5_req_way : s6_req_way) == pre_s3_req_way & (retire ? s5_beat : s6_beat) == pre_s3_beat ? (retire ? s5_dat : s6_dat) : retire ? s6_dat : s7_dat;
  end // always @(posedge)
  Queue_20 queue (
    .clock            (clock),
    .reset            (reset),
    .io_enq_ready     (_queue_io_enq_ready),
    .io_enq_valid     (queue_io_enq_valid_REG_1),
    .io_enq_bits_data (io_bs_rdat_data),
    .io_deq_ready     (_queue_io_deq_ready_T & s3_need_r),
    .io_deq_valid     (_queue_io_deq_valid),
    .io_deq_bits_data (_queue_io_deq_bits_data)
  );
  Atomics atomics (
    .io_write    (s4_req_prio_2),
    .io_a_opcode (s4_adjusted_opcode),
    .io_a_param  (s4_req_param),
    .io_a_mask   (s4_pdata_mask),
    .io_a_data   (s4_pdata_data),
    .io_data_in  (s4_rdata),
    .io_data_out (_atomics_io_data_out)
  );
  assign io_req_ready = ~busy;
  assign io_d_valid = s3_valid_d;
  assign io_d_bits_opcode = d_bits_opcode;
  assign io_d_bits_param = s3_req_prio_0 & (s3_req_opcode == 3'h6 | (&s3_req_opcode)) ? {1'h0, s3_req_param == 3'h0} : 2'h0;
  assign io_d_bits_size = s3_req_size;
  assign io_d_bits_source = s3_req_source;
  assign io_d_bits_sink = s3_req_sink;
  assign io_d_bits_denied = s3_req_bad;
  assign io_d_bits_data = d_bits_data;
  assign io_d_bits_corrupt = s3_req_bad & d_bits_opcode[0];
  assign io_pb_pop_valid = s2_valid_pb & s2_req_prio_0;
  assign io_pb_pop_bits_index = s2_req_put;
  assign io_pb_pop_bits_last = s2_last;
  assign io_rel_pop_valid = s2_valid_pb & ~s2_req_prio_0;
  assign io_rel_pop_bits_index = s2_req_put;
  assign io_rel_pop_bits_last = s2_last;
  assign io_bs_radr_valid = _io_bs_radr_valid_output;
  assign io_bs_radr_bits_way = s1_req_way;
  assign io_bs_radr_bits_set = s1_req_set;
  assign io_bs_radr_bits_beat = s1_beat;
  assign io_bs_radr_bits_mask = ~s1_bypass;
  assign io_bs_wadr_valid = s4_full & s4_need_bs;
  assign io_bs_wadr_bits_way = s4_req_way;
  assign io_bs_wadr_bits_set = s4_req_set;
  assign io_bs_wadr_bits_beat = s4_beat;
  assign io_bs_wadr_bits_mask = |s4_pdata_mask;
  assign io_bs_wdat_data = _atomics_io_data_out;
  assign io_evict_safe = (~busy | io_evict_req_way != s1_req_reg_way | io_evict_req_set != s1_req_reg_set) & (~s2_full | io_evict_req_way != s2_req_way | io_evict_req_set != s2_req_set) & (~s3_full | io_evict_req_way != s3_req_way | io_evict_req_set != s3_req_set) & (~s4_full | io_evict_req_way != s4_req_way | io_evict_req_set != s4_req_set);
  assign io_grant_safe = (~busy | io_grant_req_way != s1_req_reg_way | io_grant_req_set != s1_req_reg_set) & (~s2_full | io_grant_req_way != s2_req_way | io_grant_req_set != s2_req_set) & (~s3_full | io_grant_req_way != s3_req_way | io_grant_req_set != s3_req_set) & (~s4_full | io_grant_req_way != s4_req_way | io_grant_req_set != s4_req_set);
endmodule

