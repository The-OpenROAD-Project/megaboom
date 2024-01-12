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

module RegisterFileSynthesizable(
  input         clock,
                reset,
  input  [6:0]  io_read_ports_0_addr,
  output [64:0] io_read_ports_0_data,
  input  [6:0]  io_read_ports_1_addr,
  output [64:0] io_read_ports_1_data,
  input  [6:0]  io_read_ports_2_addr,
  output [64:0] io_read_ports_2_data,
  input  [6:0]  io_read_ports_3_addr,
  output [64:0] io_read_ports_3_data,
  input  [6:0]  io_read_ports_4_addr,
  output [64:0] io_read_ports_4_data,
  input  [6:0]  io_read_ports_5_addr,
  output [64:0] io_read_ports_5_data,
  input         io_write_ports_0_valid,
  input  [6:0]  io_write_ports_0_bits_addr,
  input  [64:0] io_write_ports_0_bits_data,
  input         io_write_ports_1_valid,
  input  [6:0]  io_write_ports_1_bits_addr,
  input  [64:0] io_write_ports_1_bits_data,
  input         io_write_ports_2_valid,
  input  [6:0]  io_write_ports_2_bits_addr,
  input  [64:0] io_write_ports_2_bits_data,
  input         io_write_ports_3_valid,
  input  [6:0]  io_write_ports_3_bits_addr,
  input  [64:0] io_write_ports_3_bits_data
);

  reg [6:0] read_addrs_0;
  reg [6:0] read_addrs_1;
  reg [6:0] read_addrs_2;
  reg [6:0] read_addrs_3;
  reg [6:0] read_addrs_4;
  reg [6:0] read_addrs_5;
  `ifndef SYNTHESIS
    wire _GEN = io_write_ports_0_bits_addr == 7'h0;
    wire _GEN_0 = io_write_ports_1_bits_addr == 7'h0;
    always @(posedge clock) begin
      if (~reset & ~(~io_write_ports_0_valid | ~io_write_ports_1_valid | io_write_ports_0_bits_addr != io_write_ports_1_bits_addr | _GEN)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_0_valid | ~io_write_ports_2_valid | io_write_ports_0_bits_addr != io_write_ports_2_bits_addr | _GEN)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_0_valid | ~io_write_ports_3_valid | io_write_ports_0_bits_addr != io_write_ports_3_bits_addr | _GEN)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_1_valid | ~io_write_ports_2_valid | io_write_ports_1_bits_addr != io_write_ports_2_bits_addr | _GEN_0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_1_valid | ~io_write_ports_3_valid | io_write_ports_1_bits_addr != io_write_ports_3_bits_addr | _GEN_0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
      if (~reset & ~(~io_write_ports_2_valid | ~io_write_ports_3_valid | io_write_ports_2_bits_addr != io_write_ports_3_bits_addr | io_write_ports_2_bits_addr == 7'h0)) begin
        if (`ASSERT_VERBOSE_COND_)
          $error("Assertion failed: [regfile] too many writers a register\n    at regfile.scala:171 assert(!io.write_ports(i).valid ||\n");
        if (`STOP_COND_)
          $fatal;
      end
    end // always @(posedge)
  `endif // not def SYNTHESIS
  always @(posedge clock) begin
    read_addrs_0 <= io_read_ports_0_addr;
    read_addrs_1 <= io_read_ports_1_addr;
    read_addrs_2 <= io_read_ports_2_addr;
    read_addrs_3 <= io_read_ports_3_addr;
    read_addrs_4 <= io_read_ports_4_addr;
    read_addrs_5 <= io_read_ports_5_addr;
  end // always @(posedge)
  regfile_128x65 regfile_ext (
    .R0_addr (read_addrs_5),
    .R0_en   (1'h1),
    .R0_clk  (clock),
    .R0_data (io_read_ports_5_data),
    .R1_addr (read_addrs_4),
    .R1_en   (1'h1),
    .R1_clk  (clock),
    .R1_data (io_read_ports_4_data),
    .R2_addr (read_addrs_3),
    .R2_en   (1'h1),
    .R2_clk  (clock),
    .R2_data (io_read_ports_3_data),
    .R3_addr (read_addrs_2),
    .R3_en   (1'h1),
    .R3_clk  (clock),
    .R3_data (io_read_ports_2_data),
    .R4_addr (read_addrs_1),
    .R4_en   (1'h1),
    .R4_clk  (clock),
    .R4_data (io_read_ports_1_data),
    .R5_addr (read_addrs_0),
    .R5_en   (1'h1),
    .R5_clk  (clock),
    .R5_data (io_read_ports_0_data),
    .W0_addr (io_write_ports_3_bits_addr),
    .W0_en   (io_write_ports_3_valid),
    .W0_clk  (clock),
    .W0_data (io_write_ports_3_bits_data),
    .W1_addr (io_write_ports_2_bits_addr),
    .W1_en   (io_write_ports_2_valid),
    .W1_clk  (clock),
    .W1_data (io_write_ports_2_bits_data),
    .W2_addr (io_write_ports_1_bits_addr),
    .W2_en   (io_write_ports_1_valid),
    .W2_clk  (clock),
    .W2_data (io_write_ports_1_bits_data),
    .W3_addr (io_write_ports_0_bits_addr),
    .W3_en   (io_write_ports_0_valid),
    .W3_clk  (clock),
    .W3_data (io_write_ports_0_bits_data)
  );
endmodule

