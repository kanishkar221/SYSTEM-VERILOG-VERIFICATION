`include "interface.sv"
`include "test.sv"

module testbench;
  inter interf();
  test tst(interf);
  
  sync_up_counter dut(
    .clk(interf.clk),
    .reset(interf.reset),
    .enable(interf.enable),
    .count(interf.count)
  );
  
  initial begin
    interf.clk = 0;
  end
  
  always #5 interf.clk = ~interf.clk;
  
  initial begin
    interf.reset = 1;
    #5; interf.reset = 0;
  end
  
  initial begin
    $dumpfile("dumpfile.vcd");
    $dumpvars;
    #100;
    $finish;
  end
endmodule
