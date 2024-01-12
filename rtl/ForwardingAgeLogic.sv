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

module ForwardingAgeLogic(
  input  [31:0] io_addr_matches,
  input  [4:0]  io_youngest_st_idx,
  output [4:0]  io_forwarding_idx
);

  wire [31:0] _matches_T_1 = io_addr_matches & {1'h0, &io_youngest_st_idx, &(io_youngest_st_idx[4:1]), io_youngest_st_idx > 5'h1C, &(io_youngest_st_idx[4:2]), io_youngest_st_idx > 5'h1A, io_youngest_st_idx > 5'h19, io_youngest_st_idx > 5'h18, &(io_youngest_st_idx[4:3]), io_youngest_st_idx > 5'h16, io_youngest_st_idx > 5'h15, io_youngest_st_idx > 5'h14, io_youngest_st_idx > 5'h13, io_youngest_st_idx > 5'h12, io_youngest_st_idx > 5'h11, io_youngest_st_idx > 5'h10, io_youngest_st_idx[4], io_youngest_st_idx > 5'hE, io_youngest_st_idx > 5'hD, io_youngest_st_idx > 5'hC, io_youngest_st_idx > 5'hB, io_youngest_st_idx > 5'hA, io_youngest_st_idx > 5'h9, io_youngest_st_idx > 5'h8, |(io_youngest_st_idx[4:3]), io_youngest_st_idx > 5'h6, io_youngest_st_idx > 5'h5, io_youngest_st_idx > 5'h4, |(io_youngest_st_idx[4:2]), io_youngest_st_idx > 5'h2, |(io_youngest_st_idx[4:1]), |io_youngest_st_idx};
  assign io_forwarding_idx = _matches_T_1[31] ? 5'h1F : _matches_T_1[30] ? 5'h1E : _matches_T_1[29] ? 5'h1D : _matches_T_1[28] ? 5'h1C : _matches_T_1[27] ? 5'h1B : _matches_T_1[26] ? 5'h1A : _matches_T_1[25] ? 5'h19 : _matches_T_1[24] ? 5'h18 : _matches_T_1[23] ? 5'h17 : _matches_T_1[22] ? 5'h16 : _matches_T_1[21] ? 5'h15 : _matches_T_1[20] ? 5'h14 : _matches_T_1[19] ? 5'h13 : _matches_T_1[18] ? 5'h12 : _matches_T_1[17] ? 5'h11 : _matches_T_1[16] ? 5'h10 : _matches_T_1[15] ? 5'hF : _matches_T_1[14] ? 5'hE : _matches_T_1[13] ? 5'hD : _matches_T_1[12] ? 5'hC : _matches_T_1[11] ? 5'hB : _matches_T_1[10] ? 5'hA : _matches_T_1[9] ? 5'h9 : _matches_T_1[8] ? 5'h8 : _matches_T_1[7] ? 5'h7 : _matches_T_1[6] ? 5'h6 : _matches_T_1[5] ? 5'h5 : _matches_T_1[4] ? 5'h4 : _matches_T_1[3] ? 5'h3 : _matches_T_1[2] ? 5'h2 : _matches_T_1[1] ? 5'h1 : _matches_T_1[0] ? 5'h0 : io_addr_matches[31] ? 5'h1F : io_addr_matches[30] ? 5'h1E : io_addr_matches[29] ? 5'h1D : io_addr_matches[28] ? 5'h1C : io_addr_matches[27] ? 5'h1B : io_addr_matches[26] ? 5'h1A : io_addr_matches[25] ? 5'h19 : io_addr_matches[24] ? 5'h18 : io_addr_matches[23] ? 5'h17 : io_addr_matches[22] ? 5'h16 : io_addr_matches[21] ? 5'h15 : io_addr_matches[20] ? 5'h14 : io_addr_matches[19] ? 5'h13 : io_addr_matches[18] ? 5'h12 : io_addr_matches[17] ? 5'h11 : io_addr_matches[16] ? 5'h10 : io_addr_matches[15] ? 5'hF : io_addr_matches[14] ? 5'hE : io_addr_matches[13] ? 5'hD : io_addr_matches[12] ? 5'hC : io_addr_matches[11] ? 5'hB : io_addr_matches[10] ? 5'hA : io_addr_matches[9] ? 5'h9 : io_addr_matches[8] ? 5'h8 : io_addr_matches[7] ? 5'h7 : io_addr_matches[6] ? 5'h6 : io_addr_matches[5] ? 5'h5 : io_addr_matches[4] ? 5'h4 : io_addr_matches[3] ? 5'h3 : io_addr_matches[2] ? 5'h2 : {4'h0, io_addr_matches[1]};
endmodule

