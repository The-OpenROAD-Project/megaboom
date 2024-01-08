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

module ICache(
  input          clock,
                 reset,
                 auto_master_out_a_ready,
  output         auto_master_out_a_valid,
  output [32:0]  auto_master_out_a_bits_address,
  input          auto_master_out_d_valid,
  input  [2:0]   auto_master_out_d_bits_opcode,
  input  [3:0]   auto_master_out_d_bits_size,
  input  [127:0] auto_master_out_d_bits_data,
  input          io_req_valid,
  input  [38:0]  io_req_bits_addr,
  input  [32:0]  io_s1_paddr,
  input          io_s1_kill,
                 io_s2_kill,
  output         io_resp_valid,
  output [127:0] io_resp_bits_data,
  input          io_invalidate
);

  wire         masterNodeOut_a_valid;
  wire         readEnable;
  wire         readEnable_0;
  wire         writeEnable;
  wire         readEnable_1;
  wire         readEnable_2;
  wire         writeEnable_0;
  wire         readEnable_3;
  wire         readEnable_4;
  wire         writeEnable_1;
  wire         readEnable_5;
  wire         readEnable_6;
  wire         writeEnable_2;
  wire         readEnable_7;
  wire         readEnable_8;
  wire         writeEnable_3;
  wire         readEnable_9;
  wire         readEnable_10;
  wire         writeEnable_4;
  wire         readEnable_11;
  wire         readEnable_12;
  wire         writeEnable_5;
  wire         readEnable_13;
  wire         readEnable_14;
  wire         writeEnable_6;
  wire         tag_array_MPORT_mask_7;
  wire         tag_array_MPORT_mask_6;
  wire         tag_array_MPORT_mask_5;
  wire         tag_array_MPORT_mask_4;
  wire         tag_array_MPORT_mask_3;
  wire         tag_array_MPORT_mask_2;
  wire         tag_array_MPORT_mask_1;
  wire         tag_array_MPORT_mask_0;
  wire         tag_array_tag_rdata_en;
  wire [5:0]   _tag_rdata_T_4;
  wire         _io_req_ready_T;
  wire [63:0]  _dataArrayB1Way_7_ext_RW0_rdata;
  wire [63:0]  _dataArrayB1Way_6_ext_RW0_rdata;
  wire [63:0]  _dataArrayB1Way_5_ext_RW0_rdata;
  wire [63:0]  _dataArrayB1Way_4_ext_RW0_rdata;
  wire [63:0]  _dataArrayB1Way_3_ext_RW0_rdata;
  wire [63:0]  _dataArrayB1Way_2_ext_RW0_rdata;
  wire [63:0]  _dataArrayB1Way_1_ext_RW0_rdata;
  wire [63:0]  _dataArrayB1Way_0_ext_RW0_rdata;
  wire [63:0]  _dataArrayB0Way_7_ext_RW0_rdata;
  wire [63:0]  _dataArrayB0Way_6_ext_RW0_rdata;
  wire [63:0]  _dataArrayB0Way_5_ext_RW0_rdata;
  wire [63:0]  _dataArrayB0Way_4_ext_RW0_rdata;
  wire [63:0]  _dataArrayB0Way_3_ext_RW0_rdata;
  wire [63:0]  _dataArrayB0Way_2_ext_RW0_rdata;
  wire [63:0]  _dataArrayB0Way_1_ext_RW0_rdata;
  wire [63:0]  _dataArrayB0Way_0_ext_RW0_rdata;
  wire [167:0] _tag_array_ext_RW0_rdata;
  wire         _repl_way_prng_io_out_0;
  wire         _repl_way_prng_io_out_1;
  wire         _repl_way_prng_io_out_2;
  wire         s0_valid = _io_req_ready_T & io_req_valid;
  reg          s1_valid;
  reg          s2_valid;
  reg          s2_hit;
  reg          invalidated;
  reg          refill_valid;
  wire         refill_fire = auto_master_out_a_ready & masterNodeOut_a_valid;
  reg          s2_miss_REG;
  wire         s2_miss = s2_valid & ~s2_hit & ~s2_miss_REG;
  reg  [32:0]  refill_paddr;
  wire         refill_one_beat = auto_master_out_d_valid & auto_master_out_d_bits_opcode[0];
  assign _io_req_ready_T = ~refill_one_beat;
  wire [26:0]  _beats1_decode_T_1 = 27'hFFF << auto_master_out_d_bits_size;
  wire [7:0]   beats1 = auto_master_out_d_bits_opcode[0] ? ~(_beats1_decode_T_1[11:4]) : 8'h0;
  reg  [7:0]   counter;
  wire [7:0]   _counter1_T = counter - 8'h1;
  wire         tag_array_MPORT_en = refill_one_beat & (counter == 8'h1 | beats1 == 8'h0) & auto_master_out_d_valid;
  wire [2:0]   repl_way = {_repl_way_prng_io_out_2, _repl_way_prng_io_out_1, _repl_way_prng_io_out_0};
  assign _tag_rdata_T_4 = io_req_bits_addr[11:6];
  assign tag_array_tag_rdata_en = ~tag_array_MPORT_en & s0_valid;
  assign tag_array_MPORT_mask_0 = ~(|repl_way);
  assign tag_array_MPORT_mask_1 = repl_way == 3'h1;
  assign tag_array_MPORT_mask_2 = repl_way == 3'h2;
  assign tag_array_MPORT_mask_3 = repl_way == 3'h3;
  assign tag_array_MPORT_mask_4 = repl_way == 3'h4;
  assign tag_array_MPORT_mask_5 = repl_way == 3'h5;
  assign tag_array_MPORT_mask_6 = repl_way == 3'h6;
  assign tag_array_MPORT_mask_7 = &repl_way;
  reg  [511:0] vb_array;
  wire [511:0] _s1_vb_T_1 = vb_array >> io_s1_paddr[11:6];
  wire         s1_tag_hit_0 = _s1_vb_T_1[0] & _tag_array_ext_RW0_rdata[20:0] == io_s1_paddr[32:12];
  wire [511:0] _s1_vb_T_3 = vb_array >> {506'h1, io_s1_paddr[11:6]};
  wire         s1_tag_hit_1 = _s1_vb_T_3[0] & _tag_array_ext_RW0_rdata[41:21] == io_s1_paddr[32:12];
  wire [511:0] _s1_vb_T_5 = vb_array >> {506'h2, io_s1_paddr[11:6]};
  wire         s1_tag_hit_2 = _s1_vb_T_5[0] & _tag_array_ext_RW0_rdata[62:42] == io_s1_paddr[32:12];
  wire [511:0] _s1_vb_T_7 = vb_array >> {506'h3, io_s1_paddr[11:6]};
  wire         s1_tag_hit_3 = _s1_vb_T_7[0] & _tag_array_ext_RW0_rdata[83:63] == io_s1_paddr[32:12];
  wire [511:0] _s1_vb_T_9 = vb_array >> {506'h4, io_s1_paddr[11:6]};
  wire         s1_tag_hit_4 = _s1_vb_T_9[0] & _tag_array_ext_RW0_rdata[104:84] == io_s1_paddr[32:12];
  wire [511:0] _s1_vb_T_11 = vb_array >> {506'h5, io_s1_paddr[11:6]};
  wire         s1_tag_hit_5 = _s1_vb_T_11[0] & _tag_array_ext_RW0_rdata[125:105] == io_s1_paddr[32:12];
  wire [511:0] _s1_vb_T_13 = vb_array >> {506'h6, io_s1_paddr[11:6]};
  wire         s1_tag_hit_6 = _s1_vb_T_13[0] & _tag_array_ext_RW0_rdata[146:126] == io_s1_paddr[32:12];
  wire [511:0] _s1_vb_T_15 = vb_array >> {506'h7, io_s1_paddr[11:6]};
  wire         s1_tag_hit_7 = _s1_vb_T_15[0] & _tag_array_ext_RW0_rdata[167:147] == io_s1_paddr[32:12];
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~({1'h0, {1'h0, {1'h0, s1_tag_hit_0} + {1'h0, s1_tag_hit_1}} + {1'h0, {1'h0, s1_tag_hit_2} + {1'h0, s1_tag_hit_3}}} + {1'h0, {1'h0, {1'h0, s1_tag_hit_4} + {1'h0, s1_tag_hit_5}} + {1'h0, {1'h0, s1_tag_hit_6} + {1'h0, s1_tag_hit_7}}} < 4'h2 | ~s1_valid)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at icache.scala:180 assert(PopCount(s1_tag_hit) <= 1.U || !s1_valid)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  reg          s1_bankid_REG;
  assign writeEnable_6 = refill_one_beat & ~invalidated & ~(|repl_way);
  wire [7:0]   _GEN = {refill_paddr[11:6], 2'h0} | beats1 & ~_counter1_T;
  wire [7:0]   _s2_dout_7_T_7 = refill_one_beat ? _GEN : io_req_bits_addr[11:4] + {7'h0, io_req_bits_addr[3]};
  wire [7:0]   _s2_dout_7_T_3 = refill_one_beat ? _GEN : io_req_bits_addr[11:4];
  assign readEnable_14 = ~writeEnable_6 & s0_valid;
  assign readEnable_13 = ~writeEnable_6 & s0_valid;
  reg  [127:0] s2_dout_0_REG;
  assign writeEnable_5 = refill_one_beat & ~invalidated & repl_way == 3'h1;
  assign readEnable_12 = ~writeEnable_5 & s0_valid;
  assign readEnable_11 = ~writeEnable_5 & s0_valid;
  reg  [127:0] s2_dout_1_REG;
  assign writeEnable_4 = refill_one_beat & ~invalidated & repl_way == 3'h2;
  assign readEnable_10 = ~writeEnable_4 & s0_valid;
  assign readEnable_9 = ~writeEnable_4 & s0_valid;
  reg  [127:0] s2_dout_2_REG;
  assign writeEnable_3 = refill_one_beat & ~invalidated & repl_way == 3'h3;
  assign readEnable_8 = ~writeEnable_3 & s0_valid;
  assign readEnable_7 = ~writeEnable_3 & s0_valid;
  reg  [127:0] s2_dout_3_REG;
  assign writeEnable_2 = refill_one_beat & ~invalidated & repl_way == 3'h4;
  assign readEnable_6 = ~writeEnable_2 & s0_valid;
  assign readEnable_5 = ~writeEnable_2 & s0_valid;
  reg  [127:0] s2_dout_4_REG;
  assign writeEnable_1 = refill_one_beat & ~invalidated & repl_way == 3'h5;
  assign readEnable_4 = ~writeEnable_1 & s0_valid;
  assign readEnable_3 = ~writeEnable_1 & s0_valid;
  reg  [127:0] s2_dout_5_REG;
  assign writeEnable_0 = refill_one_beat & ~invalidated & repl_way == 3'h6;
  assign readEnable_2 = ~writeEnable_0 & s0_valid;
  assign readEnable_1 = ~writeEnable_0 & s0_valid;
  reg  [127:0] s2_dout_6_REG;
  assign writeEnable = refill_one_beat & ~invalidated & (&repl_way);
  assign readEnable_0 = ~writeEnable & s0_valid;
  assign readEnable = ~writeEnable & s0_valid;
  reg  [127:0] s2_dout_7_REG;
  reg          s2_tag_hit_0;
  reg          s2_tag_hit_1;
  reg          s2_tag_hit_2;
  reg          s2_tag_hit_3;
  reg          s2_tag_hit_4;
  reg          s2_tag_hit_5;
  reg          s2_tag_hit_6;
  reg          s2_tag_hit_7;
  reg          s2_bankid;
  wire [127:0] s2_way_mux = (s2_tag_hit_0 ? s2_dout_0_REG : 128'h0) | (s2_tag_hit_1 ? s2_dout_1_REG : 128'h0) | (s2_tag_hit_2 ? s2_dout_2_REG : 128'h0) | (s2_tag_hit_3 ? s2_dout_3_REG : 128'h0) | (s2_tag_hit_4 ? s2_dout_4_REG : 128'h0) | (s2_tag_hit_5 ? s2_dout_5_REG : 128'h0) | (s2_tag_hit_6 ? s2_dout_6_REG : 128'h0) | (s2_tag_hit_7 ? s2_dout_7_REG : 128'h0);
  assign masterNodeOut_a_valid = s2_miss & ~refill_valid & ~io_s2_kill;
  wire [511:0] _vb_array_T_3 = 512'h1 << {503'h0, _repl_way_prng_io_out_2, _repl_way_prng_io_out_1, _repl_way_prng_io_out_0, refill_paddr[11:6]};
  always @(posedge clock) begin
    s1_valid <= s0_valid;
    s2_valid <= s1_valid & ~io_s1_kill;
    s2_hit <= s1_tag_hit_0 | s1_tag_hit_1 | s1_tag_hit_2 | s1_tag_hit_3 | s1_tag_hit_4 | s1_tag_hit_5 | s1_tag_hit_6 | s1_tag_hit_7;
    invalidated <= refill_valid & (io_invalidate | invalidated);
    s2_miss_REG <= refill_valid;
    if (s1_valid & ~(refill_valid | s2_miss))
      refill_paddr <= io_s1_paddr;
    s1_bankid_REG <= io_req_bits_addr[3];
    s2_dout_0_REG <= {_dataArrayB1Way_0_ext_RW0_rdata, _dataArrayB0Way_0_ext_RW0_rdata};
    s2_dout_1_REG <= {_dataArrayB1Way_1_ext_RW0_rdata, _dataArrayB0Way_1_ext_RW0_rdata};
    s2_dout_2_REG <= {_dataArrayB1Way_2_ext_RW0_rdata, _dataArrayB0Way_2_ext_RW0_rdata};
    s2_dout_3_REG <= {_dataArrayB1Way_3_ext_RW0_rdata, _dataArrayB0Way_3_ext_RW0_rdata};
    s2_dout_4_REG <= {_dataArrayB1Way_4_ext_RW0_rdata, _dataArrayB0Way_4_ext_RW0_rdata};
    s2_dout_5_REG <= {_dataArrayB1Way_5_ext_RW0_rdata, _dataArrayB0Way_5_ext_RW0_rdata};
    s2_dout_6_REG <= {_dataArrayB1Way_6_ext_RW0_rdata, _dataArrayB0Way_6_ext_RW0_rdata};
    s2_dout_7_REG <= {_dataArrayB1Way_7_ext_RW0_rdata, _dataArrayB0Way_7_ext_RW0_rdata};
    s2_tag_hit_0 <= s1_tag_hit_0;
    s2_tag_hit_1 <= s1_tag_hit_1;
    s2_tag_hit_2 <= s1_tag_hit_2;
    s2_tag_hit_3 <= s1_tag_hit_3;
    s2_tag_hit_4 <= s1_tag_hit_4;
    s2_tag_hit_5 <= s1_tag_hit_5;
    s2_tag_hit_6 <= s1_tag_hit_6;
    s2_tag_hit_7 <= s1_tag_hit_7;
    s2_bankid <= s1_bankid_REG;
    if (reset) begin
      refill_valid <= 1'h0;
      counter <= 8'h0;
      vb_array <= 512'h0;
    end
    else begin
      refill_valid <= ~tag_array_MPORT_en & (refill_fire | refill_valid);
      if (auto_master_out_d_valid) begin
        if (counter == 8'h0)
          counter <= beats1;
        else
          counter <= _counter1_T;
      end
      if (io_invalidate)
        vb_array <= 512'h0;
      else if (refill_one_beat) begin
        if (tag_array_MPORT_en & ~invalidated)
          vb_array <= vb_array | _vb_array_T_3;
        else
          vb_array <= ~(~vb_array | _vb_array_T_3);
      end
    end
  end // always @(posedge)
  MaxPeriodFibonacciLFSR repl_way_prng (
    .clock        (clock),
    .reset        (reset),
    .io_increment (refill_fire),
    .io_out_0     (_repl_way_prng_io_out_0),
    .io_out_1     (_repl_way_prng_io_out_1),
    .io_out_2     (_repl_way_prng_io_out_2),
    .io_out_3     (/* unused */),
    .io_out_4     (/* unused */),
    .io_out_5     (/* unused */),
    .io_out_6     (/* unused */),
    .io_out_7     (/* unused */),
    .io_out_8     (/* unused */),
    .io_out_9     (/* unused */),
    .io_out_10    (/* unused */),
    .io_out_11    (/* unused */),
    .io_out_12    (/* unused */),
    .io_out_13    (/* unused */),
    .io_out_14    (/* unused */),
    .io_out_15    (/* unused */)
  );
  tag_array_64x168 tag_array_ext (
    .RW0_addr  (tag_array_MPORT_en ? refill_paddr[11:6] : _tag_rdata_T_4),
    .RW0_en    (tag_array_tag_rdata_en | tag_array_MPORT_en),
    .RW0_clk   (clock),
    .RW0_wmode (tag_array_MPORT_en),
    .RW0_wdata ({8{refill_paddr[32:12]}}),
    .RW0_rdata (_tag_array_ext_RW0_rdata),
    .RW0_wmask ({tag_array_MPORT_mask_7, tag_array_MPORT_mask_6, tag_array_MPORT_mask_5, tag_array_MPORT_mask_4, tag_array_MPORT_mask_3, tag_array_MPORT_mask_2, tag_array_MPORT_mask_1, tag_array_MPORT_mask_0})
  );
  dataArrayB_256x64 dataArrayB0Way_0_ext (
    .RW0_addr  (_s2_dout_7_T_7),
    .RW0_en    (readEnable_13 | writeEnable_6),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_6),
    .RW0_wdata (auto_master_out_d_bits_data[63:0]),
    .RW0_rdata (_dataArrayB0Way_0_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB0Way_1_ext (
    .RW0_addr  (_s2_dout_7_T_7),
    .RW0_en    (readEnable_11 | writeEnable_5),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_5),
    .RW0_wdata (auto_master_out_d_bits_data[63:0]),
    .RW0_rdata (_dataArrayB0Way_1_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB0Way_2_ext (
    .RW0_addr  (_s2_dout_7_T_7),
    .RW0_en    (readEnable_9 | writeEnable_4),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_4),
    .RW0_wdata (auto_master_out_d_bits_data[63:0]),
    .RW0_rdata (_dataArrayB0Way_2_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB0Way_3_ext (
    .RW0_addr  (_s2_dout_7_T_7),
    .RW0_en    (readEnable_7 | writeEnable_3),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_3),
    .RW0_wdata (auto_master_out_d_bits_data[63:0]),
    .RW0_rdata (_dataArrayB0Way_3_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB0Way_4_ext (
    .RW0_addr  (_s2_dout_7_T_7),
    .RW0_en    (readEnable_5 | writeEnable_2),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_2),
    .RW0_wdata (auto_master_out_d_bits_data[63:0]),
    .RW0_rdata (_dataArrayB0Way_4_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB0Way_5_ext (
    .RW0_addr  (_s2_dout_7_T_7),
    .RW0_en    (readEnable_3 | writeEnable_1),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_1),
    .RW0_wdata (auto_master_out_d_bits_data[63:0]),
    .RW0_rdata (_dataArrayB0Way_5_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB0Way_6_ext (
    .RW0_addr  (_s2_dout_7_T_7),
    .RW0_en    (readEnable_1 | writeEnable_0),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_0),
    .RW0_wdata (auto_master_out_d_bits_data[63:0]),
    .RW0_rdata (_dataArrayB0Way_6_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB0Way_7_ext (
    .RW0_addr  (_s2_dout_7_T_7),
    .RW0_en    (readEnable | writeEnable),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable),
    .RW0_wdata (auto_master_out_d_bits_data[63:0]),
    .RW0_rdata (_dataArrayB0Way_7_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB1Way_0_ext (
    .RW0_addr  (_s2_dout_7_T_3),
    .RW0_en    (readEnable_14 | writeEnable_6),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_6),
    .RW0_wdata (auto_master_out_d_bits_data[127:64]),
    .RW0_rdata (_dataArrayB1Way_0_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB1Way_1_ext (
    .RW0_addr  (_s2_dout_7_T_3),
    .RW0_en    (readEnable_12 | writeEnable_5),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_5),
    .RW0_wdata (auto_master_out_d_bits_data[127:64]),
    .RW0_rdata (_dataArrayB1Way_1_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB1Way_2_ext (
    .RW0_addr  (_s2_dout_7_T_3),
    .RW0_en    (readEnable_10 | writeEnable_4),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_4),
    .RW0_wdata (auto_master_out_d_bits_data[127:64]),
    .RW0_rdata (_dataArrayB1Way_2_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB1Way_3_ext (
    .RW0_addr  (_s2_dout_7_T_3),
    .RW0_en    (readEnable_8 | writeEnable_3),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_3),
    .RW0_wdata (auto_master_out_d_bits_data[127:64]),
    .RW0_rdata (_dataArrayB1Way_3_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB1Way_4_ext (
    .RW0_addr  (_s2_dout_7_T_3),
    .RW0_en    (readEnable_6 | writeEnable_2),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_2),
    .RW0_wdata (auto_master_out_d_bits_data[127:64]),
    .RW0_rdata (_dataArrayB1Way_4_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB1Way_5_ext (
    .RW0_addr  (_s2_dout_7_T_3),
    .RW0_en    (readEnable_4 | writeEnable_1),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_1),
    .RW0_wdata (auto_master_out_d_bits_data[127:64]),
    .RW0_rdata (_dataArrayB1Way_5_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB1Way_6_ext (
    .RW0_addr  (_s2_dout_7_T_3),
    .RW0_en    (readEnable_2 | writeEnable_0),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable_0),
    .RW0_wdata (auto_master_out_d_bits_data[127:64]),
    .RW0_rdata (_dataArrayB1Way_6_ext_RW0_rdata)
  );
  dataArrayB_256x64 dataArrayB1Way_7_ext (
    .RW0_addr  (_s2_dout_7_T_3),
    .RW0_en    (readEnable_0 | writeEnable),
    .RW0_clk   (clock),
    .RW0_wmode (writeEnable),
    .RW0_wdata (auto_master_out_d_bits_data[127:64]),
    .RW0_rdata (_dataArrayB1Way_7_ext_RW0_rdata)
  );
  assign auto_master_out_a_valid = masterNodeOut_a_valid;
  assign auto_master_out_a_bits_address = {refill_paddr[32:6], 6'h0};
  assign io_resp_valid = s2_valid & s2_hit;
  assign io_resp_bits_data = s2_bankid ? {s2_way_mux[63:0], s2_way_mux[127:64]} : s2_way_mux;
endmodule

