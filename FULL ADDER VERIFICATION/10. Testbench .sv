`include "interface.sv"
`include "test.sv"

module testbench;
  inter interf();
  test tst(interf);
  
  full_adder FA(
    .a(interf.a),
    .b(interf.b),
    .c_in(interf.c_in),
    .sum(interf.sum),
    .c_out(interf.c_out)
  );
  initial begin 
    $dumpfile("dump.vcd"); 
    $dumpvars;
  end
endmodule
