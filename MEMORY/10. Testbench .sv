`include "interface.sv"
`include "test.sv"

module tb;
  inter interf();
  test tst(interf);
  
  ram uut(.clk(interf.clk),
          .wr(interf.wr),
          .d_in(interf.d_in),
          .addr(interf.addr),
          .d_out(interf.d_out)
         );
  
  always #5 interf.clk = ~interf.clk;
  
  initial begin
    interf.clk = 0;
    $dumpfile("dumpfile.vcd");
    $dumpvars;
    #500;
    $finish;
  end
endmodule
