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

module OptimizationBarrier_14(
  input  [20:0] io_x_ppn,
  input         io_x_u,
                io_x_ae,
                io_x_sw,
                io_x_sx,
                io_x_sr,
                io_x_pw,
                io_x_pr,
                io_x_pal,
                io_x_paa,
                io_x_eff,
                io_x_c,
  output [20:0] io_y_ppn,
  output        io_y_u,
                io_y_ae,
                io_y_sw,
                io_y_sx,
                io_y_sr,
                io_y_pw,
                io_y_pr,
                io_y_pal,
                io_y_paa,
                io_y_eff,
                io_y_c
);

  assign io_y_ppn = io_x_ppn;
  assign io_y_u = io_x_u;
  assign io_y_ae = io_x_ae;
  assign io_y_sw = io_x_sw;
  assign io_y_sx = io_x_sx;
  assign io_y_sr = io_x_sr;
  assign io_y_pw = io_x_pw;
  assign io_y_pr = io_x_pr;
  assign io_y_pal = io_x_pal;
  assign io_y_paa = io_x_paa;
  assign io_y_eff = io_x_eff;
  assign io_y_c = io_x_c;
endmodule

