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

module HellaPeekingArbiter(
  input         clock,
                reset,
  output        io_in_1_ready,
  input         io_in_1_valid,
  input  [2:0]  io_in_1_bits_opcode,
                io_in_1_bits_param,
  input  [7:0]  io_in_1_bits_size,
                io_in_1_bits_source,
  input  [63:0] io_in_1_bits_data,
  input         io_in_1_bits_corrupt,
  input  [8:0]  io_in_1_bits_union,
  input         io_in_1_bits_last,
  output        io_in_4_ready,
  input         io_in_4_valid,
  input  [2:0]  io_in_4_bits_opcode,
                io_in_4_bits_param,
  input  [7:0]  io_in_4_bits_size,
                io_in_4_bits_source,
  input  [63:0] io_in_4_bits_address,
                io_in_4_bits_data,
  input         io_in_4_bits_corrupt,
  input  [8:0]  io_in_4_bits_union,
  input         io_in_4_bits_last,
                io_out_ready,
  output        io_out_valid,
  output [2:0]  io_out_bits_chanId,
                io_out_bits_opcode,
                io_out_bits_param,
  output [7:0]  io_out_bits_size,
                io_out_bits_source,
  output [63:0] io_out_bits_address,
                io_out_bits_data,
  output        io_out_bits_corrupt,
  output [8:0]  io_out_bits_union,
  output        io_out_bits_last
);

  reg  [2:0]  lockIdx;
  reg         locked;
  wire [2:0]  _choice_T_2 = io_in_1_valid ? 3'h1 : 3'h4;
  wire [2:0]  chosen = locked ? lockIdx : _choice_T_2;
  reg         casez_tmp;
  always @(*) begin
    casez (chosen)
      3'b000:
        casez_tmp = 1'h0;
      3'b001:
        casez_tmp = io_in_1_valid;
      3'b010:
        casez_tmp = 1'h0;
      3'b011:
        casez_tmp = 1'h0;
      3'b100:
        casez_tmp = io_in_4_valid;
      3'b101:
        casez_tmp = 1'h0;
      3'b110:
        casez_tmp = 1'h0;
      default:
        casez_tmp = 1'h0;
    endcase
  end // always @(*)
  reg  [2:0]  casez_tmp_0;
  always @(*) begin
    casez (chosen)
      3'b000:
        casez_tmp_0 = 3'h4;
      3'b001:
        casez_tmp_0 = 3'h3;
      3'b010:
        casez_tmp_0 = 3'h2;
      3'b011:
        casez_tmp_0 = 3'h1;
      3'b100:
        casez_tmp_0 = 3'h0;
      3'b101:
        casez_tmp_0 = 3'h4;
      3'b110:
        casez_tmp_0 = 3'h4;
      default:
        casez_tmp_0 = 3'h4;
    endcase
  end // always @(*)
  reg  [2:0]  casez_tmp_1;
  always @(*) begin
    casez (chosen)
      3'b000:
        casez_tmp_1 = 3'h0;
      3'b001:
        casez_tmp_1 = io_in_1_bits_opcode;
      3'b010:
        casez_tmp_1 = 3'h0;
      3'b011:
        casez_tmp_1 = 3'h0;
      3'b100:
        casez_tmp_1 = io_in_4_bits_opcode;
      3'b101:
        casez_tmp_1 = 3'h0;
      3'b110:
        casez_tmp_1 = 3'h0;
      default:
        casez_tmp_1 = 3'h0;
    endcase
  end // always @(*)
  reg  [2:0]  casez_tmp_2;
  always @(*) begin
    casez (chosen)
      3'b000:
        casez_tmp_2 = 3'h0;
      3'b001:
        casez_tmp_2 = io_in_1_bits_param;
      3'b010:
        casez_tmp_2 = 3'h0;
      3'b011:
        casez_tmp_2 = 3'h0;
      3'b100:
        casez_tmp_2 = io_in_4_bits_param;
      3'b101:
        casez_tmp_2 = 3'h0;
      3'b110:
        casez_tmp_2 = 3'h0;
      default:
        casez_tmp_2 = 3'h0;
    endcase
  end // always @(*)
  reg  [7:0]  casez_tmp_3;
  always @(*) begin
    casez (chosen)
      3'b000:
        casez_tmp_3 = 8'h0;
      3'b001:
        casez_tmp_3 = io_in_1_bits_size;
      3'b010:
        casez_tmp_3 = 8'h0;
      3'b011:
        casez_tmp_3 = 8'h0;
      3'b100:
        casez_tmp_3 = io_in_4_bits_size;
      3'b101:
        casez_tmp_3 = 8'h0;
      3'b110:
        casez_tmp_3 = 8'h0;
      default:
        casez_tmp_3 = 8'h0;
    endcase
  end // always @(*)
  reg  [7:0]  casez_tmp_4;
  always @(*) begin
    casez (chosen)
      3'b000:
        casez_tmp_4 = 8'h0;
      3'b001:
        casez_tmp_4 = io_in_1_bits_source;
      3'b010:
        casez_tmp_4 = 8'h0;
      3'b011:
        casez_tmp_4 = 8'h0;
      3'b100:
        casez_tmp_4 = io_in_4_bits_source;
      3'b101:
        casez_tmp_4 = 8'h0;
      3'b110:
        casez_tmp_4 = 8'h0;
      default:
        casez_tmp_4 = 8'h0;
    endcase
  end // always @(*)
  reg  [63:0] casez_tmp_5;
  always @(*) begin
    casez (chosen)
      3'b000:
        casez_tmp_5 = 64'h0;
      3'b001:
        casez_tmp_5 = 64'h0;
      3'b010:
        casez_tmp_5 = 64'h0;
      3'b011:
        casez_tmp_5 = 64'h0;
      3'b100:
        casez_tmp_5 = io_in_4_bits_address;
      3'b101:
        casez_tmp_5 = 64'h0;
      3'b110:
        casez_tmp_5 = 64'h0;
      default:
        casez_tmp_5 = 64'h0;
    endcase
  end // always @(*)
  reg  [63:0] casez_tmp_6;
  always @(*) begin
    casez (chosen)
      3'b000:
        casez_tmp_6 = 64'h0;
      3'b001:
        casez_tmp_6 = io_in_1_bits_data;
      3'b010:
        casez_tmp_6 = 64'h0;
      3'b011:
        casez_tmp_6 = 64'h0;
      3'b100:
        casez_tmp_6 = io_in_4_bits_data;
      3'b101:
        casez_tmp_6 = 64'h0;
      3'b110:
        casez_tmp_6 = 64'h0;
      default:
        casez_tmp_6 = 64'h0;
    endcase
  end // always @(*)
  reg         casez_tmp_7;
  always @(*) begin
    casez (chosen)
      3'b000:
        casez_tmp_7 = 1'h0;
      3'b001:
        casez_tmp_7 = io_in_1_bits_corrupt;
      3'b010:
        casez_tmp_7 = 1'h0;
      3'b011:
        casez_tmp_7 = 1'h0;
      3'b100:
        casez_tmp_7 = io_in_4_bits_corrupt;
      3'b101:
        casez_tmp_7 = 1'h0;
      3'b110:
        casez_tmp_7 = 1'h0;
      default:
        casez_tmp_7 = 1'h0;
    endcase
  end // always @(*)
  reg  [8:0]  casez_tmp_8;
  always @(*) begin
    casez (chosen)
      3'b000:
        casez_tmp_8 = 9'h0;
      3'b001:
        casez_tmp_8 = io_in_1_bits_union;
      3'b010:
        casez_tmp_8 = 9'h0;
      3'b011:
        casez_tmp_8 = 9'h0;
      3'b100:
        casez_tmp_8 = io_in_4_bits_union;
      3'b101:
        casez_tmp_8 = 9'h0;
      3'b110:
        casez_tmp_8 = 9'h0;
      default:
        casez_tmp_8 = 9'h0;
    endcase
  end // always @(*)
  reg         casez_tmp_9;
  always @(*) begin
    casez (chosen)
      3'b000:
        casez_tmp_9 = 1'h1;
      3'b001:
        casez_tmp_9 = io_in_1_bits_last;
      3'b010:
        casez_tmp_9 = 1'h1;
      3'b011:
        casez_tmp_9 = 1'h1;
      3'b100:
        casez_tmp_9 = io_in_4_bits_last;
      3'b101:
        casez_tmp_9 = 1'h1;
      3'b110:
        casez_tmp_9 = 1'h1;
      default:
        casez_tmp_9 = 1'h1;
    endcase
  end // always @(*)
  wire        _GEN = io_out_ready & casez_tmp;
  always @(posedge clock) begin
    if (reset) begin
      lockIdx <= 3'h0;
      locked <= 1'h0;
    end
    else begin
      if (_GEN & ~locked)
        lockIdx <= _choice_T_2;
      if (_GEN)
        locked <= ~casez_tmp_9;
    end
  end // always @(posedge)
  assign io_in_1_ready = io_out_ready & chosen == 3'h1;
  assign io_in_4_ready = io_out_ready & chosen == 3'h4;
  assign io_out_valid = casez_tmp;
  assign io_out_bits_chanId = casez_tmp_0;
  assign io_out_bits_opcode = casez_tmp_1;
  assign io_out_bits_param = casez_tmp_2;
  assign io_out_bits_size = casez_tmp_3;
  assign io_out_bits_source = casez_tmp_4;
  assign io_out_bits_address = casez_tmp_5;
  assign io_out_bits_data = casez_tmp_6;
  assign io_out_bits_corrupt = casez_tmp_7;
  assign io_out_bits_union = casez_tmp_8;
  assign io_out_bits_last = casez_tmp_9;
endmodule

