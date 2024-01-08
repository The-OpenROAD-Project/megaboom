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

module CLINT(
  input         clock,
                reset,
  output        auto_int_out_0,
                auto_int_out_1,
                auto_in_a_ready,
  input         auto_in_a_valid,
  input  [2:0]  auto_in_a_bits_opcode,
                auto_in_a_bits_param,
  input  [1:0]  auto_in_a_bits_size,
  input  [10:0] auto_in_a_bits_source,
  input  [25:0] auto_in_a_bits_address,
  input  [7:0]  auto_in_a_bits_mask,
  input  [63:0] auto_in_a_bits_data,
  input         auto_in_a_bits_corrupt,
                auto_in_d_ready,
  output        auto_in_d_valid,
  output [2:0]  auto_in_d_bits_opcode,
  output [1:0]  auto_in_d_bits_size,
  output [10:0] auto_in_d_bits_source,
  output [63:0] auto_in_d_bits_data,
  input         io_rtcTick
);

  wire        out_woready_9;
  wire        out_woready_17;
  reg  [63:0] time_0;
  reg  [63:0] pad;
  reg         ipi_0;
  wire        out_front_bits_read = auto_in_a_bits_opcode == 3'h4;
  wire        _out_out_bits_data_WIRE_1 = auto_in_a_bits_address[13:3] == 11'h0;
  wire        valids_1_0 = out_woready_9 & auto_in_a_bits_mask[0];
  wire        valids_1_1 = out_woready_9 & auto_in_a_bits_mask[1];
  wire        valids_1_2 = out_woready_9 & auto_in_a_bits_mask[2];
  wire        valids_1_3 = out_woready_9 & auto_in_a_bits_mask[3];
  wire        valids_1_4 = out_woready_9 & auto_in_a_bits_mask[4];
  wire        valids_1_5 = out_woready_9 & auto_in_a_bits_mask[5];
  wire        valids_1_6 = out_woready_9 & auto_in_a_bits_mask[6];
  wire        valids_1_7 = out_woready_9 & auto_in_a_bits_mask[7];
  wire        valids_0 = out_woready_17 & auto_in_a_bits_mask[0];
  wire        valids_1 = out_woready_17 & auto_in_a_bits_mask[1];
  wire        valids_2 = out_woready_17 & auto_in_a_bits_mask[2];
  wire        valids_3 = out_woready_17 & auto_in_a_bits_mask[3];
  wire        valids_4 = out_woready_17 & auto_in_a_bits_mask[4];
  wire        valids_5 = out_woready_17 & auto_in_a_bits_mask[5];
  wire        valids_6 = out_woready_17 & auto_in_a_bits_mask[6];
  wire        valids_7 = out_woready_17 & auto_in_a_bits_mask[7];
  wire        _out_wofireMux_T_2 = auto_in_a_valid & auto_in_d_ready & ~out_front_bits_read;
  assign out_woready_17 = _out_wofireMux_T_2 & auto_in_a_bits_address[15:14] == 2'h1 & _out_out_bits_data_WIRE_1;
  assign out_woready_9 = _out_wofireMux_T_2 & auto_in_a_bits_address[15:14] == 2'h2 & (&(auto_in_a_bits_address[13:3]));
  reg         casez_tmp;
  always @(*) begin
    casez (auto_in_a_bits_address[15:14])
      2'b00:
        casez_tmp = _out_out_bits_data_WIRE_1;
      2'b01:
        casez_tmp = _out_out_bits_data_WIRE_1;
      2'b10:
        casez_tmp = &(auto_in_a_bits_address[13:3]);
      default:
        casez_tmp = 1'h1;
    endcase
  end // always @(*)
  reg  [63:0] casez_tmp_0;
  always @(*) begin
    casez (auto_in_a_bits_address[15:14])
      2'b00:
        casez_tmp_0 = {63'h0, ipi_0};
      2'b01:
        casez_tmp_0 = pad;
      2'b10:
        casez_tmp_0 = time_0;
      default:
        casez_tmp_0 = 64'h0;
    endcase
  end // always @(*)
  wire [2:0]  nodeIn_d_bits_opcode = {2'h0, out_front_bits_read};
  always @(posedge clock) begin
    if (reset) begin
      time_0 <= 64'h0;
      ipi_0 <= 1'h0;
    end
    else begin
      if (valids_1_0 | valids_1_1 | valids_1_2 | valids_1_3 | valids_1_4 | valids_1_5 | valids_1_6 | valids_1_7)
        time_0 <= {valids_1_7 ? auto_in_a_bits_data[63:56] : time_0[63:56], valids_1_6 ? auto_in_a_bits_data[55:48] : time_0[55:48], valids_1_5 ? auto_in_a_bits_data[47:40] : time_0[47:40], valids_1_4 ? auto_in_a_bits_data[39:32] : time_0[39:32], valids_1_3 ? auto_in_a_bits_data[31:24] : time_0[31:24], valids_1_2 ? auto_in_a_bits_data[23:16] : time_0[23:16], valids_1_1 ? auto_in_a_bits_data[15:8] : time_0[15:8], valids_1_0 ? auto_in_a_bits_data[7:0] : time_0[7:0]};
      else if (io_rtcTick)
        time_0 <= time_0 + 64'h1;
      if (_out_wofireMux_T_2 & auto_in_a_bits_address[15:14] == 2'h0 & _out_out_bits_data_WIRE_1 & auto_in_a_bits_mask[0])
        ipi_0 <= auto_in_a_bits_data[0];
    end
    if (valids_0 | valids_1 | valids_2 | valids_3 | valids_4 | valids_5 | valids_6 | valids_7)
      pad <= {valids_7 ? auto_in_a_bits_data[63:56] : pad[63:56], valids_6 ? auto_in_a_bits_data[55:48] : pad[55:48], valids_5 ? auto_in_a_bits_data[47:40] : pad[47:40], valids_4 ? auto_in_a_bits_data[39:32] : pad[39:32], valids_3 ? auto_in_a_bits_data[31:24] : pad[31:24], valids_2 ? auto_in_a_bits_data[23:16] : pad[23:16], valids_1 ? auto_in_a_bits_data[15:8] : pad[15:8], valids_0 ? auto_in_a_bits_data[7:0] : pad[7:0]};
  end // always @(posedge)
  TLMonitor_46 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (auto_in_d_ready),
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_opcode  (auto_in_a_bits_opcode),
    .io_in_a_bits_param   (auto_in_a_bits_param),
    .io_in_a_bits_size    (auto_in_a_bits_size),
    .io_in_a_bits_source  (auto_in_a_bits_source),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_a_bits_mask    (auto_in_a_bits_mask),
    .io_in_a_bits_corrupt (auto_in_a_bits_corrupt),
    .io_in_d_ready        (auto_in_d_ready),
    .io_in_d_valid        (auto_in_a_valid),
    .io_in_d_bits_opcode  (nodeIn_d_bits_opcode),
    .io_in_d_bits_size    (auto_in_a_bits_size),
    .io_in_d_bits_source  (auto_in_a_bits_source)
  );
  assign auto_int_out_0 = ipi_0;
  assign auto_int_out_1 = time_0 >= pad;
  assign auto_in_a_ready = auto_in_d_ready;
  assign auto_in_d_valid = auto_in_a_valid;
  assign auto_in_d_bits_opcode = nodeIn_d_bits_opcode;
  assign auto_in_d_bits_size = auto_in_a_bits_size;
  assign auto_in_d_bits_source = auto_in_a_bits_source;
  assign auto_in_d_bits_data = casez_tmp ? casez_tmp_0 : 64'h0;
endmodule

