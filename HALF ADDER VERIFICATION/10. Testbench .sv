`include "interface.sv"
`include "test.sv"

module testbench;
  inter interf();
  test tst(interf);
  
  half_adder HA(
    .a(interf.a),
    .b(interf.b),
    .sum(interf.sum),
    .carry(interf.carry)
  );
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars;
  end
endmodule
