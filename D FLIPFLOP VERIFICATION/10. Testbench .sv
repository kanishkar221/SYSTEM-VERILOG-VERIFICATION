`include "interface.sv"
`include "test.sv"

module d_ff_tb;
  inter inf();
  test tst(inf);
  
   d_flipflop dff(.clk(inf.clk), .rst(inf.rst), .d(inf.d), .q(inf.q));
  
  initial begin
    inf.clk = 0;
  end
  
  always #5 inf.clk = ~ inf.clk;
  
  initial begin
    inf.rst = 1;
    #30; inf.rst = 0;
  end
  
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars;
    #200;
    $finish;
  end
endmodule
