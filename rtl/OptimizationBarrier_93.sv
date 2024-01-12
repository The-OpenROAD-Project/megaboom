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

module OptimizationBarrier_93(
  input  [43:0] io_x_ppn,
  input         io_x_d,
                io_x_a,
                io_x_g,
                io_x_u,
                io_x_x,
                io_x_w,
                io_x_r,
                io_x_v,
  output [43:0] io_y_ppn,
  output        io_y_d,
                io_y_a,
                io_y_g,
                io_y_u,
                io_y_x,
                io_y_w,
                io_y_r,
                io_y_v
);

  assign io_y_ppn = io_x_ppn;
  assign io_y_d = io_x_d;
  assign io_y_a = io_x_a;
  assign io_y_g = io_x_g;
  assign io_y_u = io_x_u;
  assign io_y_x = io_x_x;
  assign io_y_w = io_x_w;
  assign io_y_r = io_x_r;
  assign io_y_v = io_x_v;
endmodule

