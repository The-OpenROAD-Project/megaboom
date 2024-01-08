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

module TLBusBypassBar(
  input          clock,
                 reset,
  output         auto_in_a_ready,
  input          auto_in_a_valid,
  input  [2:0]   auto_in_a_bits_opcode,
  input  [8:0]   auto_in_a_bits_address,
  input  [31:0]  auto_in_a_bits_data,
  input          auto_in_d_ready,
  output         auto_in_d_valid,
  output [2:0]   auto_in_d_bits_opcode,
  output [1:0]   auto_in_d_bits_param,
                 auto_in_d_bits_size,
  output         auto_in_d_bits_sink,
                 auto_in_d_bits_denied,
  output [31:0]  auto_in_d_bits_data,
  output         auto_in_d_bits_corrupt,
  input          auto_out_1_a_ready,
  output         auto_out_1_a_valid,
  output [2:0]   auto_out_1_a_bits_opcode,
  output [8:0]   auto_out_1_a_bits_address,
  output [31:0]  auto_out_1_a_bits_data,
  output         auto_out_1_d_ready,
  input          auto_out_1_d_valid,
  input  [2:0]   auto_out_1_d_bits_opcode,
  input  [1:0]   auto_out_1_d_bits_param,
                 auto_out_1_d_bits_size,
  input          auto_out_1_d_bits_source,
                 auto_out_1_d_bits_sink,
                 auto_out_1_d_bits_denied,
  input  [31:0]  auto_out_1_d_bits_data,
  input          auto_out_1_d_bits_corrupt,
                 auto_out_0_a_ready,
  output         auto_out_0_a_valid,
  output [2:0]   auto_out_0_a_bits_opcode,
  output [127:0] auto_out_0_a_bits_address,
  output         auto_out_0_d_ready,
  input          auto_out_0_d_valid,
  input  [2:0]   auto_out_0_d_bits_opcode,
  input  [1:0]   auto_out_0_d_bits_size,
  input          auto_out_0_d_bits_denied,
                 auto_out_0_d_bits_corrupt,
                 io_bypass
);

  reg        in_reset;
  reg        bypass_reg;
  wire       bypass = in_reset ? io_bypass : bypass_reg;
  reg  [1:0] flight;
  reg        counter;
  reg        counter_3;
  reg        stall_counter;
  wire       stall = bypass != io_bypass & ~stall_counter;
  wire       nodeIn_a_ready = ~stall & (bypass ? auto_out_0_a_ready : auto_out_1_a_ready);
  wire       nodeIn_d_valid = bypass ? auto_out_0_d_valid : auto_out_1_d_valid;
  wire [2:0] nodeIn_d_bits_opcode = bypass ? auto_out_0_d_bits_opcode : auto_out_1_d_bits_opcode;
  wire [1:0] nodeIn_d_bits_param = bypass ? 2'h0 : auto_out_1_d_bits_param;
  wire [1:0] nodeIn_d_bits_size = bypass ? auto_out_0_d_bits_size : auto_out_1_d_bits_size;
  wire       nodeIn_d_bits_sink = ~bypass & auto_out_1_d_bits_sink;
  wire       nodeIn_d_bits_denied = bypass ? auto_out_0_d_bits_denied : auto_out_1_d_bits_denied;
  wire       nodeIn_d_bits_corrupt = bypass ? auto_out_0_d_bits_corrupt : auto_out_1_d_bits_corrupt;
  wire       done = nodeIn_a_ready & auto_in_a_valid;
  wire       d_dec = auto_in_d_ready & nodeIn_d_valid;
  wire [1:0] _next_flight_T_10 = flight + {1'h0, d_dec & ~counter_3 & nodeIn_d_bits_opcode[2] & ~(nodeIn_d_bits_opcode[1])} + {1'h0, done & ~counter} - {1'h0, d_dec};
  always @(posedge clock) begin
    if (reset) begin
      in_reset <= 1'h1;
      flight <= 2'h0;
      counter <= 1'h0;
      counter_3 <= 1'h0;
      stall_counter <= 1'h0;
    end
    else begin
      in_reset <= 1'h0;
      flight <= _next_flight_T_10;
      counter <= (~done | counter - 1'h1) & counter;
      counter_3 <= (~d_dec | counter_3 - 1'h1) & counter_3;
      stall_counter <= (~done | stall_counter - 1'h1) & stall_counter;
    end
    if (in_reset | _next_flight_T_10 == 2'h0)
      bypass_reg <= io_bypass;
  end // always @(posedge)
  TLMonitor_49 monitor (
    .clock                (clock),
    .reset                (reset),
    .io_in_a_ready        (nodeIn_a_ready),
    .io_in_a_valid        (auto_in_a_valid),
    .io_in_a_bits_opcode  (auto_in_a_bits_opcode),
    .io_in_a_bits_address (auto_in_a_bits_address),
    .io_in_d_ready        (auto_in_d_ready),
    .io_in_d_valid        (nodeIn_d_valid),
    .io_in_d_bits_opcode  (nodeIn_d_bits_opcode),
    .io_in_d_bits_param   (nodeIn_d_bits_param),
    .io_in_d_bits_size    (nodeIn_d_bits_size),
    .io_in_d_bits_source  (~bypass & auto_out_1_d_bits_source),
    .io_in_d_bits_sink    (nodeIn_d_bits_sink),
    .io_in_d_bits_denied  (nodeIn_d_bits_denied),
    .io_in_d_bits_corrupt (nodeIn_d_bits_corrupt)
  );
  assign auto_in_a_ready = nodeIn_a_ready;
  assign auto_in_d_valid = nodeIn_d_valid;
  assign auto_in_d_bits_opcode = nodeIn_d_bits_opcode;
  assign auto_in_d_bits_param = nodeIn_d_bits_param;
  assign auto_in_d_bits_size = nodeIn_d_bits_size;
  assign auto_in_d_bits_sink = nodeIn_d_bits_sink;
  assign auto_in_d_bits_denied = nodeIn_d_bits_denied;
  assign auto_in_d_bits_data = bypass ? 32'h0 : auto_out_1_d_bits_data;
  assign auto_in_d_bits_corrupt = nodeIn_d_bits_corrupt;
  assign auto_out_1_a_valid = ~stall & auto_in_a_valid & ~bypass;
  assign auto_out_1_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_1_a_bits_address = auto_in_a_bits_address;
  assign auto_out_1_a_bits_data = auto_in_a_bits_data;
  assign auto_out_1_d_ready = auto_in_d_ready & ~bypass;
  assign auto_out_0_a_valid = ~stall & auto_in_a_valid & bypass;
  assign auto_out_0_a_bits_opcode = auto_in_a_bits_opcode;
  assign auto_out_0_a_bits_address = {119'h0, auto_in_a_bits_address};
  assign auto_out_0_d_ready = auto_in_d_ready & bypass;
endmodule

