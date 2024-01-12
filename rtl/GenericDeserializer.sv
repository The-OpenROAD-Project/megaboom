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

module GenericDeserializer(
  input         clock,
                reset,
  output        io_in_ready,
  input         io_in_valid,
  input  [3:0]  io_in_bits,
  input         io_out_ready,
  output        io_out_valid,
  output [2:0]  io_out_bits_chanId,
                io_out_bits_opcode,
                io_out_bits_param,
  output [7:0]  io_out_bits_size,
                io_out_bits_source,
  output [63:0] io_out_bits_address,
                io_out_bits_data,
  output        io_out_bits_corrupt,
  output [8:0]  io_out_bits_union
);

  reg  [3:0] data_0;
  reg  [3:0] data_1;
  reg  [3:0] data_2;
  reg  [3:0] data_3;
  reg  [3:0] data_4;
  reg  [3:0] data_5;
  reg  [3:0] data_6;
  reg  [3:0] data_7;
  reg  [3:0] data_8;
  reg  [3:0] data_9;
  reg  [3:0] data_10;
  reg  [3:0] data_11;
  reg  [3:0] data_12;
  reg  [3:0] data_13;
  reg  [3:0] data_14;
  reg  [3:0] data_15;
  reg  [3:0] data_16;
  reg  [3:0] data_17;
  reg  [3:0] data_18;
  reg  [3:0] data_19;
  reg  [3:0] data_20;
  reg  [3:0] data_21;
  reg  [3:0] data_22;
  reg  [3:0] data_23;
  reg  [3:0] data_24;
  reg  [3:0] data_25;
  reg  [3:0] data_26;
  reg  [3:0] data_27;
  reg  [3:0] data_28;
  reg  [3:0] data_29;
  reg  [3:0] data_30;
  reg  [3:0] data_31;
  reg  [3:0] data_32;
  reg  [3:0] data_33;
  reg  [3:0] data_34;
  reg  [3:0] data_35;
  reg  [3:0] data_36;
  reg  [3:0] data_37;
  reg  [3:0] data_38;
  reg  [3:0] data_39;
  reg  [3:0] data_40;
  reg        receiving;
  reg  [5:0] recvCount;
  wire       wrap_wrap = recvCount == 6'h28;
  wire       _GEN = receiving & io_in_valid;
  always @(posedge clock) begin
    if (_GEN & recvCount == 6'h0)
      data_0 <= io_in_bits;
    if (_GEN & recvCount == 6'h1)
      data_1 <= io_in_bits;
    if (_GEN & recvCount == 6'h2)
      data_2 <= io_in_bits;
    if (_GEN & recvCount == 6'h3)
      data_3 <= io_in_bits;
    if (_GEN & recvCount == 6'h4)
      data_4 <= io_in_bits;
    if (_GEN & recvCount == 6'h5)
      data_5 <= io_in_bits;
    if (_GEN & recvCount == 6'h6)
      data_6 <= io_in_bits;
    if (_GEN & recvCount == 6'h7)
      data_7 <= io_in_bits;
    if (_GEN & recvCount == 6'h8)
      data_8 <= io_in_bits;
    if (_GEN & recvCount == 6'h9)
      data_9 <= io_in_bits;
    if (_GEN & recvCount == 6'hA)
      data_10 <= io_in_bits;
    if (_GEN & recvCount == 6'hB)
      data_11 <= io_in_bits;
    if (_GEN & recvCount == 6'hC)
      data_12 <= io_in_bits;
    if (_GEN & recvCount == 6'hD)
      data_13 <= io_in_bits;
    if (_GEN & recvCount == 6'hE)
      data_14 <= io_in_bits;
    if (_GEN & recvCount == 6'hF)
      data_15 <= io_in_bits;
    if (_GEN & recvCount == 6'h10)
      data_16 <= io_in_bits;
    if (_GEN & recvCount == 6'h11)
      data_17 <= io_in_bits;
    if (_GEN & recvCount == 6'h12)
      data_18 <= io_in_bits;
    if (_GEN & recvCount == 6'h13)
      data_19 <= io_in_bits;
    if (_GEN & recvCount == 6'h14)
      data_20 <= io_in_bits;
    if (_GEN & recvCount == 6'h15)
      data_21 <= io_in_bits;
    if (_GEN & recvCount == 6'h16)
      data_22 <= io_in_bits;
    if (_GEN & recvCount == 6'h17)
      data_23 <= io_in_bits;
    if (_GEN & recvCount == 6'h18)
      data_24 <= io_in_bits;
    if (_GEN & recvCount == 6'h19)
      data_25 <= io_in_bits;
    if (_GEN & recvCount == 6'h1A)
      data_26 <= io_in_bits;
    if (_GEN & recvCount == 6'h1B)
      data_27 <= io_in_bits;
    if (_GEN & recvCount == 6'h1C)
      data_28 <= io_in_bits;
    if (_GEN & recvCount == 6'h1D)
      data_29 <= io_in_bits;
    if (_GEN & recvCount == 6'h1E)
      data_30 <= io_in_bits;
    if (_GEN & recvCount == 6'h1F)
      data_31 <= io_in_bits;
    if (_GEN & recvCount == 6'h20)
      data_32 <= io_in_bits;
    if (_GEN & recvCount == 6'h21)
      data_33 <= io_in_bits;
    if (_GEN & recvCount == 6'h22)
      data_34 <= io_in_bits;
    if (_GEN & recvCount == 6'h23)
      data_35 <= io_in_bits;
    if (_GEN & recvCount == 6'h24)
      data_36 <= io_in_bits;
    if (_GEN & recvCount == 6'h25)
      data_37 <= io_in_bits;
    if (_GEN & recvCount == 6'h26)
      data_38 <= io_in_bits;
    if (_GEN & recvCount == 6'h27)
      data_39 <= io_in_bits;
    if (_GEN & recvCount == 6'h28)
      data_40 <= io_in_bits;
    if (reset) begin
      receiving <= 1'h1;
      recvCount <= 6'h0;
    end
    else begin
      receiving <= io_out_ready & ~receiving | ~(_GEN & wrap_wrap) & receiving;
      if (_GEN) begin
        if (wrap_wrap)
          recvCount <= 6'h0;
        else
          recvCount <= recvCount + 6'h1;
      end
    end
  end // always @(posedge)
  assign io_in_ready = receiving;
  assign io_out_valid = ~receiving;
  assign io_out_bits_chanId = data_40[3:1];
  assign io_out_bits_opcode = {data_40[0], data_39[3:2]};
  assign io_out_bits_param = {data_39[1:0], data_38[3]};
  assign io_out_bits_size = {data_38[2:0], data_37, data_36[3]};
  assign io_out_bits_source = {data_36[2:0], data_35, data_34[3]};
  assign io_out_bits_address = {data_34[2:0], data_33, data_32, data_31, data_30, data_29, data_28, data_27, data_26, data_25, data_24, data_23, data_22, data_21, data_20, data_19, data_18[3]};
  assign io_out_bits_data = {data_18[2:0], data_17, data_16, data_15, data_14, data_13, data_12, data_11, data_10, data_9, data_8, data_7, data_6, data_5, data_4, data_3, data_2[3]};
  assign io_out_bits_corrupt = data_2[2];
  assign io_out_bits_union = {data_2[1:0], data_1, data_0[3:1]};
endmodule

