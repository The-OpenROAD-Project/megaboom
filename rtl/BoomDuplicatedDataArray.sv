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

module BoomDuplicatedDataArray(
  input          clock,
                 io_read_0_valid,
  input  [7:0]   io_read_0_bits_way_en,
  input  [11:0]  io_read_0_bits_addr,
  input          io_read_1_valid,
  input  [7:0]   io_read_1_bits_way_en,
  input  [11:0]  io_read_1_bits_addr,
  input          io_write_valid,
  input  [7:0]   io_write_bits_way_en,
  input  [11:0]  io_write_bits_addr,
  input  [1:0]   io_write_bits_wmask,
  input  [127:0] io_write_bits_data,
  output [127:0] io_resp_0_0,
                 io_resp_0_1,
                 io_resp_0_2,
                 io_resp_0_3,
                 io_resp_0_4,
                 io_resp_0_5,
                 io_resp_0_6,
                 io_resp_0_7,
                 io_resp_1_0,
                 io_resp_1_1,
                 io_resp_1_2,
                 io_resp_1_3,
                 io_resp_1_4,
                 io_resp_1_5,
                 io_resp_1_6,
                 io_resp_1_7
);

  wire [127:0] _array_7_1_ext_R0_data;
  wire [127:0] _array_6_1_ext_R0_data;
  wire [127:0] _array_5_1_ext_R0_data;
  wire [127:0] _array_4_1_ext_R0_data;
  wire [127:0] _array_3_1_ext_R0_data;
  wire [127:0] _array_2_1_ext_R0_data;
  wire [127:0] _array_1_1_ext_R0_data;
  wire [127:0] _array_0_1_ext_R0_data;
  wire [127:0] _array_7_0_ext_R0_data;
  wire [127:0] _array_6_0_ext_R0_data;
  wire [127:0] _array_5_0_ext_R0_data;
  wire [127:0] _array_4_0_ext_R0_data;
  wire [127:0] _array_3_0_ext_R0_data;
  wire [127:0] _array_2_0_ext_R0_data;
  wire [127:0] _array_1_0_ext_R0_data;
  wire [127:0] _array_0_0_ext_R0_data;
  wire         array_0_1_MPORT_8_en = io_write_bits_way_en[0] & io_write_valid;
  reg  [127:0] io_resp_0_0_REG;
  wire         array_1_1_MPORT_9_en = io_write_bits_way_en[1] & io_write_valid;
  reg  [127:0] io_resp_0_1_REG;
  wire         array_2_1_MPORT_10_en = io_write_bits_way_en[2] & io_write_valid;
  reg  [127:0] io_resp_0_2_REG;
  wire         array_3_1_MPORT_11_en = io_write_bits_way_en[3] & io_write_valid;
  reg  [127:0] io_resp_0_3_REG;
  wire         array_4_1_MPORT_12_en = io_write_bits_way_en[4] & io_write_valid;
  reg  [127:0] io_resp_0_4_REG;
  wire         array_5_1_MPORT_13_en = io_write_bits_way_en[5] & io_write_valid;
  reg  [127:0] io_resp_0_5_REG;
  wire         array_6_1_MPORT_14_en = io_write_bits_way_en[6] & io_write_valid;
  reg  [127:0] io_resp_0_6_REG;
  wire         array_7_1_MPORT_15_en = io_write_bits_way_en[7] & io_write_valid;
  reg  [127:0] io_resp_0_7_REG;
  reg  [127:0] io_resp_1_0_REG;
  reg  [127:0] io_resp_1_1_REG;
  reg  [127:0] io_resp_1_2_REG;
  reg  [127:0] io_resp_1_3_REG;
  reg  [127:0] io_resp_1_4_REG;
  reg  [127:0] io_resp_1_5_REG;
  reg  [127:0] io_resp_1_6_REG;
  reg  [127:0] io_resp_1_7_REG;
  always @(posedge clock) begin
    io_resp_0_0_REG <= _array_0_0_ext_R0_data;
    io_resp_0_1_REG <= _array_1_0_ext_R0_data;
    io_resp_0_2_REG <= _array_2_0_ext_R0_data;
    io_resp_0_3_REG <= _array_3_0_ext_R0_data;
    io_resp_0_4_REG <= _array_4_0_ext_R0_data;
    io_resp_0_5_REG <= _array_5_0_ext_R0_data;
    io_resp_0_6_REG <= _array_6_0_ext_R0_data;
    io_resp_0_7_REG <= _array_7_0_ext_R0_data;
    io_resp_1_0_REG <= _array_0_1_ext_R0_data;
    io_resp_1_1_REG <= _array_1_1_ext_R0_data;
    io_resp_1_2_REG <= _array_2_1_ext_R0_data;
    io_resp_1_3_REG <= _array_3_1_ext_R0_data;
    io_resp_1_4_REG <= _array_4_1_ext_R0_data;
    io_resp_1_5_REG <= _array_5_1_ext_R0_data;
    io_resp_1_6_REG <= _array_6_1_ext_R0_data;
    io_resp_1_7_REG <= _array_7_1_ext_R0_data;
  end // always @(posedge)
  array_256x128 array_0_0_ext (
    .R0_addr (io_read_0_bits_addr[11:4]),
    .R0_en   (io_read_0_bits_way_en[0] & io_read_0_valid),
    .R0_clk  (clock),
    .R0_data (_array_0_0_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_0_1_MPORT_8_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_1_0_ext (
    .R0_addr (io_read_0_bits_addr[11:4]),
    .R0_en   (io_read_0_bits_way_en[1] & io_read_0_valid),
    .R0_clk  (clock),
    .R0_data (_array_1_0_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_1_1_MPORT_9_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_2_0_ext (
    .R0_addr (io_read_0_bits_addr[11:4]),
    .R0_en   (io_read_0_bits_way_en[2] & io_read_0_valid),
    .R0_clk  (clock),
    .R0_data (_array_2_0_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_2_1_MPORT_10_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_3_0_ext (
    .R0_addr (io_read_0_bits_addr[11:4]),
    .R0_en   (io_read_0_bits_way_en[3] & io_read_0_valid),
    .R0_clk  (clock),
    .R0_data (_array_3_0_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_3_1_MPORT_11_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_4_0_ext (
    .R0_addr (io_read_0_bits_addr[11:4]),
    .R0_en   (io_read_0_bits_way_en[4] & io_read_0_valid),
    .R0_clk  (clock),
    .R0_data (_array_4_0_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_4_1_MPORT_12_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_5_0_ext (
    .R0_addr (io_read_0_bits_addr[11:4]),
    .R0_en   (io_read_0_bits_way_en[5] & io_read_0_valid),
    .R0_clk  (clock),
    .R0_data (_array_5_0_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_5_1_MPORT_13_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_6_0_ext (
    .R0_addr (io_read_0_bits_addr[11:4]),
    .R0_en   (io_read_0_bits_way_en[6] & io_read_0_valid),
    .R0_clk  (clock),
    .R0_data (_array_6_0_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_6_1_MPORT_14_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_7_0_ext (
    .R0_addr (io_read_0_bits_addr[11:4]),
    .R0_en   (io_read_0_bits_way_en[7] & io_read_0_valid),
    .R0_clk  (clock),
    .R0_data (_array_7_0_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_7_1_MPORT_15_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_0_1_ext (
    .R0_addr (io_read_1_bits_addr[11:4]),
    .R0_en   (io_read_1_bits_way_en[0] & io_read_1_valid),
    .R0_clk  (clock),
    .R0_data (_array_0_1_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_0_1_MPORT_8_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_1_1_ext (
    .R0_addr (io_read_1_bits_addr[11:4]),
    .R0_en   (io_read_1_bits_way_en[1] & io_read_1_valid),
    .R0_clk  (clock),
    .R0_data (_array_1_1_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_1_1_MPORT_9_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_2_1_ext (
    .R0_addr (io_read_1_bits_addr[11:4]),
    .R0_en   (io_read_1_bits_way_en[2] & io_read_1_valid),
    .R0_clk  (clock),
    .R0_data (_array_2_1_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_2_1_MPORT_10_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_3_1_ext (
    .R0_addr (io_read_1_bits_addr[11:4]),
    .R0_en   (io_read_1_bits_way_en[3] & io_read_1_valid),
    .R0_clk  (clock),
    .R0_data (_array_3_1_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_3_1_MPORT_11_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_4_1_ext (
    .R0_addr (io_read_1_bits_addr[11:4]),
    .R0_en   (io_read_1_bits_way_en[4] & io_read_1_valid),
    .R0_clk  (clock),
    .R0_data (_array_4_1_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_4_1_MPORT_12_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_5_1_ext (
    .R0_addr (io_read_1_bits_addr[11:4]),
    .R0_en   (io_read_1_bits_way_en[5] & io_read_1_valid),
    .R0_clk  (clock),
    .R0_data (_array_5_1_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_5_1_MPORT_13_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_6_1_ext (
    .R0_addr (io_read_1_bits_addr[11:4]),
    .R0_en   (io_read_1_bits_way_en[6] & io_read_1_valid),
    .R0_clk  (clock),
    .R0_data (_array_6_1_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_6_1_MPORT_14_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  array_256x128 array_7_1_ext (
    .R0_addr (io_read_1_bits_addr[11:4]),
    .R0_en   (io_read_1_bits_way_en[7] & io_read_1_valid),
    .R0_clk  (clock),
    .R0_data (_array_7_1_ext_R0_data),
    .W0_addr (io_write_bits_addr[11:4]),
    .W0_en   (array_7_1_MPORT_15_en),
    .W0_clk  (clock),
    .W0_data (io_write_bits_data),
    .W0_mask (io_write_bits_wmask)
  );
  assign io_resp_0_0 = io_resp_0_0_REG;
  assign io_resp_0_1 = io_resp_0_1_REG;
  assign io_resp_0_2 = io_resp_0_2_REG;
  assign io_resp_0_3 = io_resp_0_3_REG;
  assign io_resp_0_4 = io_resp_0_4_REG;
  assign io_resp_0_5 = io_resp_0_5_REG;
  assign io_resp_0_6 = io_resp_0_6_REG;
  assign io_resp_0_7 = io_resp_0_7_REG;
  assign io_resp_1_0 = io_resp_1_0_REG;
  assign io_resp_1_1 = io_resp_1_1_REG;
  assign io_resp_1_2 = io_resp_1_2_REG;
  assign io_resp_1_3 = io_resp_1_3_REG;
  assign io_resp_1_4 = io_resp_1_4_REG;
  assign io_resp_1_5 = io_resp_1_5_REG;
  assign io_resp_1_6 = io_resp_1_6_REG;
  assign io_resp_1_7 = io_resp_1_7_REG;
endmodule

