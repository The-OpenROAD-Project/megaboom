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

module NLPrefetcher(
  input         clock,
                reset,
                io_mshr_avail,
                io_req_val,
  input  [39:0] io_req_addr,
  input  [1:0]  io_req_coh_state,
  input         io_prefetch_ready,
  output        io_prefetch_valid,
  output [4:0]  io_prefetch_bits_uop_mem_cmd,
  output [39:0] io_prefetch_bits_addr
);

  reg         req_valid;
  reg  [39:0] req_addr;
  reg  [4:0]  req_cmd;
  wire        _io_prefetch_valid_output = req_valid & io_mshr_avail;
  wire [39:0] _mshr_req_addr_T = io_req_addr + 40'h40;
  wire        _GEN = io_req_val & ({_mshr_req_addr_T[39:32], ~(_mshr_req_addr_T[31])} == 9'h0 | {_mshr_req_addr_T[39:33], _mshr_req_addr_T[32:31] ^ 2'h2} == 9'h0);
  always @(posedge clock) begin
    if (reset)
      req_valid <= 1'h0;
    else
      req_valid <= _GEN | ~(io_prefetch_ready & _io_prefetch_valid_output) & req_valid;
    if (_GEN) begin
      req_addr <= _mshr_req_addr_T;
      req_cmd <= {4'h1, io_req_coh_state[1]};
    end
  end // always @(posedge)
  assign io_prefetch_valid = _io_prefetch_valid_output;
  assign io_prefetch_bits_uop_mem_cmd = req_cmd;
  assign io_prefetch_bits_addr = req_addr;
endmodule

