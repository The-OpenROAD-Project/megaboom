
module ClockSourceAtFreqFromPlusArgpll_freq_mhz (
    input power,
    input gate,
    output clk);
  timeunit 1ps/1ps;

  reg clk_i;
  real FREQ_MHZ;
  real PERIOD_PS;
  initial begin
    clk_i = 1'b0;
    if (!$value$plusargs("pll_freq_mhz=%d", FREQ_MHZ)) begin
      FREQ_MHZ = 100.0;
    end
    PERIOD_PS = 1000000.0 / FREQ_MHZ;
    forever #(PERIOD_PS/2.0) clk_i = ~clk_i & (power & ~gate);
  end
  assign clk = clk_i;
endmodule
