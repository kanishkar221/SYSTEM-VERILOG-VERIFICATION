`include "interface.sv"
`include "test.sv"

module tb;
  parameter W = 8, D = 8;
  inter #(W,D) interf();
  test #(W,D) tst (interf);
  
  synchronous_fifo #(D, W)dut (
    .clk(interf.clk),
    .rst_n(interf.rst_n),
    .w_en(interf.w_en),
    .r_en(interf.r_en),
    .data_in(interf.data_in),
    .data_out(interf.data_out),
    .full(interf.full),
    .empty(interf.empty)
  );
  
  initial begin
    interf.clk = 0;
  end
  
  always #5 interf.clk = ~interf.clk;
  
  initial begin
    interf.rst_n = 0;
    interf.w_en = 0;
    interf.r_en = 0;
    interf.data_in = 0;
    repeat (2) @(posedge interf.clk);
    interf.rst_n = 1;
  end
  
  initial begin
    $dumpfile ("dumpfile.vcd");
    $dumpvars;
    #200;
    $finish;
  end
endmodule
