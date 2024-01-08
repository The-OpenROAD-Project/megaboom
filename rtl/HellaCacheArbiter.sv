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

module HellaCacheArbiter(
  output        io_requestor_0_req_ready,
  input         io_requestor_0_req_valid,
  input  [39:0] io_requestor_0_req_bits_addr,
  input         io_requestor_0_s1_kill,
  output        io_requestor_0_s2_nack,
                io_requestor_0_resp_valid,
  output [63:0] io_requestor_0_resp_bits_data,
  output        io_requestor_0_s2_xcpt_ae_ld,
  input         io_mem_req_ready,
  output        io_mem_req_valid,
  output [39:0] io_mem_req_bits_addr,
  output        io_mem_s1_kill,
  input         io_mem_s2_nack,
                io_mem_resp_valid,
  input  [63:0] io_mem_resp_bits_data,
  input         io_mem_s2_xcpt_ae_ld
);

  assign io_requestor_0_req_ready = io_mem_req_ready;
  assign io_requestor_0_s2_nack = io_mem_s2_nack;
  assign io_requestor_0_resp_valid = io_mem_resp_valid;
  assign io_requestor_0_resp_bits_data = io_mem_resp_bits_data;
  assign io_requestor_0_s2_xcpt_ae_ld = io_mem_s2_xcpt_ae_ld;
  assign io_mem_req_valid = io_requestor_0_req_valid;
  assign io_mem_req_bits_addr = io_requestor_0_req_bits_addr;
  assign io_mem_s1_kill = io_requestor_0_s1_kill;
endmodule

