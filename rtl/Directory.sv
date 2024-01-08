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

module Directory(
  input         clock,
                reset,
  output        io_write_ready,
  input         io_write_valid,
  input  [9:0]  io_write_bits_set,
  input  [2:0]  io_write_bits_way,
  input         io_write_bits_data_dirty,
  input  [1:0]  io_write_bits_data_state,
  input         io_write_bits_data_clients,
  input  [16:0] io_write_bits_data_tag,
  input         io_read_valid,
  input  [9:0]  io_read_bits_set,
  input  [16:0] io_read_bits_tag,
  output        io_result_bits_dirty,
  output [1:0]  io_result_bits_state,
  output        io_result_bits_clients,
  output [16:0] io_result_bits_tag,
  output        io_result_bits_hit,
  output [2:0]  io_result_bits_way,
  output        io_ready
);

  wire         cc_dir_MPORT_mask_7;
  wire         cc_dir_MPORT_mask_6;
  wire         cc_dir_MPORT_mask_5;
  wire         cc_dir_MPORT_mask_4;
  wire         cc_dir_MPORT_mask_3;
  wire         cc_dir_MPORT_mask_2;
  wire         cc_dir_MPORT_mask_1;
  wire         cc_dir_MPORT_mask_0;
  wire [20:0]  cc_dir_MPORT_data_7;
  wire [9:0]   cc_dir_MPORT_addr;
  wire         cc_dir_MPORT_en;
  wire         _victimLFSR_prng_io_out_0;
  wire         _victimLFSR_prng_io_out_1;
  wire         _victimLFSR_prng_io_out_2;
  wire         _victimLFSR_prng_io_out_3;
  wire         _victimLFSR_prng_io_out_4;
  wire         _victimLFSR_prng_io_out_5;
  wire         _victimLFSR_prng_io_out_6;
  wire         _victimLFSR_prng_io_out_7;
  wire         _victimLFSR_prng_io_out_8;
  wire         _victimLFSR_prng_io_out_9;
  wire         _write_q_io_deq_valid;
  wire [9:0]   _write_q_io_deq_bits_set;
  wire [2:0]   _write_q_io_deq_bits_way;
  wire         _write_q_io_deq_bits_data_dirty;
  wire [1:0]   _write_q_io_deq_bits_data_state;
  wire         _write_q_io_deq_bits_data_clients;
  wire [16:0]  _write_q_io_deq_bits_data_tag;
  wire [167:0] _cc_dir_ext_RW0_rdata;
  reg  [10:0]  wipeCount;
  reg          wipeOff;
  assign cc_dir_MPORT_en = ~io_read_valid & (~(wipeCount[10]) & ~wipeOff | _write_q_io_deq_valid);
  assign cc_dir_MPORT_addr = wipeCount[10] ? _write_q_io_deq_bits_set : wipeCount[9:0];
  assign cc_dir_MPORT_data_7 = wipeCount[10] ? {_write_q_io_deq_bits_data_dirty, _write_q_io_deq_bits_data_state, _write_q_io_deq_bits_data_clients, _write_q_io_deq_bits_data_tag} : 21'h0;
  assign cc_dir_MPORT_mask_0 = _write_q_io_deq_bits_way == 3'h0 | ~(wipeCount[10]);
  assign cc_dir_MPORT_mask_1 = _write_q_io_deq_bits_way == 3'h1 | ~(wipeCount[10]);
  assign cc_dir_MPORT_mask_2 = _write_q_io_deq_bits_way == 3'h2 | ~(wipeCount[10]);
  assign cc_dir_MPORT_mask_3 = _write_q_io_deq_bits_way == 3'h3 | ~(wipeCount[10]);
  assign cc_dir_MPORT_mask_4 = _write_q_io_deq_bits_way == 3'h4 | ~(wipeCount[10]);
  assign cc_dir_MPORT_mask_5 = _write_q_io_deq_bits_way == 3'h5 | ~(wipeCount[10]);
  assign cc_dir_MPORT_mask_6 = _write_q_io_deq_bits_way == 3'h6 | ~(wipeCount[10]);
  assign cc_dir_MPORT_mask_7 = (&_write_q_io_deq_bits_way) | ~(wipeCount[10]);
  reg          ren1;
  reg  [16:0]  tag;
  reg  [9:0]   set;
  wire [9:0]   victimLFSR = {_victimLFSR_prng_io_out_9, _victimLFSR_prng_io_out_8, _victimLFSR_prng_io_out_7, _victimLFSR_prng_io_out_6, _victimLFSR_prng_io_out_5, _victimLFSR_prng_io_out_4, _victimLFSR_prng_io_out_3, _victimLFSR_prng_io_out_2, _victimLFSR_prng_io_out_1, _victimLFSR_prng_io_out_0};
  wire [2:0]   _GEN = {_victimLFSR_prng_io_out_9, _victimLFSR_prng_io_out_8, _victimLFSR_prng_io_out_7};
  wire [1:0]   _GEN_0 = {_victimLFSR_prng_io_out_9, _victimLFSR_prng_io_out_8};
  wire         _victimLTE_T_3 = victimLFSR > 10'h17F;
  wire         _victimLTE_T_5 = victimLFSR > 10'h27F;
  wire         _victimLTE_T_6 = victimLFSR > 10'h2FF;
  wire         _victimLTE_T_7 = victimLFSR > 10'h37F;
  wire [3:0]   victimWay_hi = {_victimLTE_T_7, _victimLTE_T_6, _victimLTE_T_5, _victimLFSR_prng_io_out_9} & {1'h1, ~_victimLTE_T_7, ~_victimLTE_T_6, ~_victimLTE_T_5};
  wire [2:0]   _victimWay_T_1 = victimWay_hi[3:1] | {_victimLTE_T_3, |_GEN_0, |_GEN} & {~_victimLFSR_prng_io_out_9, ~_victimLTE_T_3, ~(|_GEN_0)};
  wire [2:0]   victimWay = {|victimWay_hi, |(_victimWay_T_1[2:1]), _victimWay_T_1[2] | _victimWay_T_1[0]};
  wire         _view__T_71 = (|_GEN) & ~(|_GEN_0);
  wire         _view__T_72 = (|_GEN_0) & ~_victimLTE_T_3;
  wire         _view__T_73 = _victimLTE_T_3 & ~_victimLFSR_prng_io_out_9;
  wire         _view__T_74 = _victimLFSR_prng_io_out_9 & ~_victimLTE_T_5;
  wire         _view__T_75 = _victimLTE_T_5 & ~_victimLTE_T_6;
  wire         _view__T_76 = _victimLTE_T_6 & ~_victimLTE_T_7;
  `ifndef SYNTHESIS
    always @(posedge clock) begin
      if (~reset & ~(wipeCount[10] | ~io_read_valid)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Directory.scala:86 assert (wipeDone || !io.read.valid)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_read_valid | wipeCount[10])) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Directory.scala:91 assert (!io.read.valid || wipeDone)\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~ren1 | ({~_victimLTE_T_6, ~_victimLTE_T_5, ~_victimLFSR_prng_io_out_9, ~_victimLTE_T_3, ~(|_GEN_0), ~(|_GEN)} & {_victimLTE_T_7, _victimLTE_T_6, _victimLTE_T_5, _victimLFSR_prng_io_out_9, _victimLTE_T_3, |_GEN_0}) == 6'h0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Directory.scala:122 assert (!ren2 || ((victimSimp >> 1) & ~victimSimp) === 0.U) // monotone\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~ren1 | {1'h0, {1'h0, {1'h0, ~(|_GEN)} + {1'h0, _view__T_71}} + {1'h0, {1'h0, _view__T_72} + {1'h0, _view__T_73}}} + {1'h0, {1'h0, {1'h0, _view__T_74} + {1'h0, _view__T_75}} + {1'h0, {1'h0, _view__T_76} + {1'h0, _victimLTE_T_7}}} == 4'h1)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed\n    at Directory.scala:123 assert (!ren2 || PopCount(victimWayOH) === 1.U)\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  wire         setQuash = _write_q_io_deq_valid & _write_q_io_deq_bits_set == set;
  wire         tagMatch = _write_q_io_deq_bits_data_tag == tag;
  wire         _hits_T_6 = _cc_dir_ext_RW0_rdata[16:0] == tag & (|(_cc_dir_ext_RW0_rdata[19:18])) & (~setQuash | (|_write_q_io_deq_bits_way));
  wire         _hits_T_13 = _cc_dir_ext_RW0_rdata[37:21] == tag & (|(_cc_dir_ext_RW0_rdata[40:39])) & (~setQuash | _write_q_io_deq_bits_way != 3'h1);
  wire         _hits_T_20 = _cc_dir_ext_RW0_rdata[58:42] == tag & (|(_cc_dir_ext_RW0_rdata[61:60])) & (~setQuash | _write_q_io_deq_bits_way != 3'h2);
  wire         _hits_T_27 = _cc_dir_ext_RW0_rdata[79:63] == tag & (|(_cc_dir_ext_RW0_rdata[82:81])) & (~setQuash | _write_q_io_deq_bits_way != 3'h3);
  wire         _hits_T_34 = _cc_dir_ext_RW0_rdata[100:84] == tag & (|(_cc_dir_ext_RW0_rdata[103:102])) & (~setQuash | _write_q_io_deq_bits_way != 3'h4);
  wire         _hits_T_41 = _cc_dir_ext_RW0_rdata[121:105] == tag & (|(_cc_dir_ext_RW0_rdata[124:123])) & (~setQuash | _write_q_io_deq_bits_way != 3'h5);
  wire         _hits_T_48 = _cc_dir_ext_RW0_rdata[142:126] == tag & (|(_cc_dir_ext_RW0_rdata[145:144])) & (~setQuash | _write_q_io_deq_bits_way != 3'h6);
  wire         _hits_T_55 = _cc_dir_ext_RW0_rdata[163:147] == tag & (|(_cc_dir_ext_RW0_rdata[166:165])) & (~setQuash | _write_q_io_deq_bits_way != 3'h7);
  wire [7:0]   hits = {_hits_T_55, _hits_T_48, _hits_T_41, _hits_T_34, _hits_T_27, _hits_T_20, _hits_T_13, _hits_T_6};
  wire         _view__T_69 = setQuash & (tagMatch | _write_q_io_deq_bits_way == victimWay);
  wire         _io_result_bits_way_T_7 = setQuash & tagMatch;
  wire [2:0]   _io_result_bits_way_T_1 = {_hits_T_55, _hits_T_48, _hits_T_41} | {_hits_T_27, _hits_T_20, _hits_T_13};
  always @(posedge clock) begin
    if (reset) begin
      wipeCount <= 11'h0;
      wipeOff <= 1'h1;
      ren1 <= 1'h0;
    end
    else begin
      if (wipeCount[10] | wipeOff) begin
      end
      else
        wipeCount <= wipeCount + 11'h1;
      wipeOff <= 1'h0;
      ren1 <= io_read_valid;
    end
    if (io_read_valid) begin
      tag <= io_read_bits_tag;
      set <= io_read_bits_set;
    end
  end // always @(posedge)
  cc_dir_1024x168 cc_dir_ext (
    .RW0_addr  (cc_dir_MPORT_en ? cc_dir_MPORT_addr : io_read_bits_set),
    .RW0_en    (io_read_valid | cc_dir_MPORT_en),
    .RW0_clk   (clock),
    .RW0_wmode (~io_read_valid),
    .RW0_wdata ({8{cc_dir_MPORT_data_7}}),
    .RW0_rdata (_cc_dir_ext_RW0_rdata),
    .RW0_wmask ({cc_dir_MPORT_mask_7, cc_dir_MPORT_mask_6, cc_dir_MPORT_mask_5, cc_dir_MPORT_mask_4, cc_dir_MPORT_mask_3, cc_dir_MPORT_mask_2, cc_dir_MPORT_mask_1, cc_dir_MPORT_mask_0})
  );
  Queue_27 write_q (
    .clock                    (clock),
    .reset                    (reset),
    .io_enq_ready             (io_write_ready),
    .io_enq_valid             (io_write_valid),
    .io_enq_bits_set          (io_write_bits_set),
    .io_enq_bits_way          (io_write_bits_way),
    .io_enq_bits_data_dirty   (io_write_bits_data_dirty),
    .io_enq_bits_data_state   (io_write_bits_data_state),
    .io_enq_bits_data_clients (io_write_bits_data_clients),
    .io_enq_bits_data_tag     (io_write_bits_data_tag),
    .io_deq_ready             (~io_read_valid),
    .io_deq_valid             (_write_q_io_deq_valid),
    .io_deq_bits_set          (_write_q_io_deq_bits_set),
    .io_deq_bits_way          (_write_q_io_deq_bits_way),
    .io_deq_bits_data_dirty   (_write_q_io_deq_bits_data_dirty),
    .io_deq_bits_data_state   (_write_q_io_deq_bits_data_state),
    .io_deq_bits_data_clients (_write_q_io_deq_bits_data_clients),
    .io_deq_bits_data_tag     (_write_q_io_deq_bits_data_tag)
  );
  MaxPeriodFibonacciLFSR victimLFSR_prng (
    .clock        (clock),
    .reset        (reset),
    .io_increment (io_read_valid),
    .io_out_0     (_victimLFSR_prng_io_out_0),
    .io_out_1     (_victimLFSR_prng_io_out_1),
    .io_out_2     (_victimLFSR_prng_io_out_2),
    .io_out_3     (_victimLFSR_prng_io_out_3),
    .io_out_4     (_victimLFSR_prng_io_out_4),
    .io_out_5     (_victimLFSR_prng_io_out_5),
    .io_out_6     (_victimLFSR_prng_io_out_6),
    .io_out_7     (_victimLFSR_prng_io_out_7),
    .io_out_8     (_victimLFSR_prng_io_out_8),
    .io_out_9     (_victimLFSR_prng_io_out_9),
    .io_out_10    (/* unused */),
    .io_out_11    (/* unused */),
    .io_out_12    (/* unused */),
    .io_out_13    (/* unused */),
    .io_out_14    (/* unused */),
    .io_out_15    (/* unused */)
  );
  assign io_result_bits_dirty = (|hits) ? _hits_T_6 & _cc_dir_ext_RW0_rdata[20] | _hits_T_13 & _cc_dir_ext_RW0_rdata[41] | _hits_T_20 & _cc_dir_ext_RW0_rdata[62] | _hits_T_27 & _cc_dir_ext_RW0_rdata[83] | _hits_T_34 & _cc_dir_ext_RW0_rdata[104] | _hits_T_41 & _cc_dir_ext_RW0_rdata[125] | _hits_T_48 & _cc_dir_ext_RW0_rdata[146] | _hits_T_55 & _cc_dir_ext_RW0_rdata[167] : _view__T_69 ? _write_q_io_deq_bits_data_dirty : ~(|_GEN) & _cc_dir_ext_RW0_rdata[20] | _view__T_71 & _cc_dir_ext_RW0_rdata[41] | _view__T_72 & _cc_dir_ext_RW0_rdata[62] | _view__T_73 & _cc_dir_ext_RW0_rdata[83] | _view__T_74 & _cc_dir_ext_RW0_rdata[104] | _view__T_75 & _cc_dir_ext_RW0_rdata[125] | _view__T_76 & _cc_dir_ext_RW0_rdata[146] | _victimLTE_T_7 & _cc_dir_ext_RW0_rdata[167];
  assign io_result_bits_state = (|hits) ? (_hits_T_6 ? _cc_dir_ext_RW0_rdata[19:18] : 2'h0) | (_hits_T_13 ? _cc_dir_ext_RW0_rdata[40:39] : 2'h0) | (_hits_T_20 ? _cc_dir_ext_RW0_rdata[61:60] : 2'h0) | (_hits_T_27 ? _cc_dir_ext_RW0_rdata[82:81] : 2'h0) | (_hits_T_34 ? _cc_dir_ext_RW0_rdata[103:102] : 2'h0) | (_hits_T_41 ? _cc_dir_ext_RW0_rdata[124:123] : 2'h0) | (_hits_T_48 ? _cc_dir_ext_RW0_rdata[145:144] : 2'h0) | (_hits_T_55 ? _cc_dir_ext_RW0_rdata[166:165] : 2'h0) : _view__T_69 ? _write_q_io_deq_bits_data_state : ((|_GEN) ? 2'h0 : _cc_dir_ext_RW0_rdata[19:18]) | (_view__T_71 ? _cc_dir_ext_RW0_rdata[40:39] : 2'h0) | (_view__T_72 ? _cc_dir_ext_RW0_rdata[61:60] : 2'h0) | (_view__T_73 ? _cc_dir_ext_RW0_rdata[82:81] : 2'h0) | (_view__T_74 ? _cc_dir_ext_RW0_rdata[103:102] : 2'h0) | (_view__T_75 ? _cc_dir_ext_RW0_rdata[124:123] : 2'h0) | (_view__T_76 ? _cc_dir_ext_RW0_rdata[145:144] : 2'h0) | (_victimLTE_T_7 ? _cc_dir_ext_RW0_rdata[166:165] : 2'h0);
  assign io_result_bits_clients = (|hits) ? _hits_T_6 & _cc_dir_ext_RW0_rdata[17] | _hits_T_13 & _cc_dir_ext_RW0_rdata[38] | _hits_T_20 & _cc_dir_ext_RW0_rdata[59] | _hits_T_27 & _cc_dir_ext_RW0_rdata[80] | _hits_T_34 & _cc_dir_ext_RW0_rdata[101] | _hits_T_41 & _cc_dir_ext_RW0_rdata[122] | _hits_T_48 & _cc_dir_ext_RW0_rdata[143] | _hits_T_55 & _cc_dir_ext_RW0_rdata[164] : _view__T_69 ? _write_q_io_deq_bits_data_clients : ~(|_GEN) & _cc_dir_ext_RW0_rdata[17] | _view__T_71 & _cc_dir_ext_RW0_rdata[38] | _view__T_72 & _cc_dir_ext_RW0_rdata[59] | _view__T_73 & _cc_dir_ext_RW0_rdata[80] | _view__T_74 & _cc_dir_ext_RW0_rdata[101] | _view__T_75 & _cc_dir_ext_RW0_rdata[122] | _view__T_76 & _cc_dir_ext_RW0_rdata[143] | _victimLTE_T_7 & _cc_dir_ext_RW0_rdata[164];
  assign io_result_bits_tag = (|hits) ? (_hits_T_6 ? _cc_dir_ext_RW0_rdata[16:0] : 17'h0) | (_hits_T_13 ? _cc_dir_ext_RW0_rdata[37:21] : 17'h0) | (_hits_T_20 ? _cc_dir_ext_RW0_rdata[58:42] : 17'h0) | (_hits_T_27 ? _cc_dir_ext_RW0_rdata[79:63] : 17'h0) | (_hits_T_34 ? _cc_dir_ext_RW0_rdata[100:84] : 17'h0) | (_hits_T_41 ? _cc_dir_ext_RW0_rdata[121:105] : 17'h0) | (_hits_T_48 ? _cc_dir_ext_RW0_rdata[142:126] : 17'h0) | (_hits_T_55 ? _cc_dir_ext_RW0_rdata[163:147] : 17'h0) : _view__T_69 ? _write_q_io_deq_bits_data_tag : ((|_GEN) ? 17'h0 : _cc_dir_ext_RW0_rdata[16:0]) | (_view__T_71 ? _cc_dir_ext_RW0_rdata[37:21] : 17'h0) | (_view__T_72 ? _cc_dir_ext_RW0_rdata[58:42] : 17'h0) | (_view__T_73 ? _cc_dir_ext_RW0_rdata[79:63] : 17'h0) | (_view__T_74 ? _cc_dir_ext_RW0_rdata[100:84] : 17'h0) | (_view__T_75 ? _cc_dir_ext_RW0_rdata[121:105] : 17'h0) | (_view__T_76 ? _cc_dir_ext_RW0_rdata[142:126] : 17'h0) | (_victimLTE_T_7 ? _cc_dir_ext_RW0_rdata[163:147] : 17'h0);
  assign io_result_bits_hit = (|hits) | _io_result_bits_way_T_7 & (|_write_q_io_deq_bits_data_state);
  assign io_result_bits_way = (|hits) ? {|{_hits_T_55, _hits_T_48, _hits_T_41, _hits_T_34}, |(_io_result_bits_way_T_1[2:1]), _io_result_bits_way_T_1[2] | _io_result_bits_way_T_1[0]} : _io_result_bits_way_T_7 ? _write_q_io_deq_bits_way : victimWay;
  assign io_ready = wipeCount[10];
endmodule

