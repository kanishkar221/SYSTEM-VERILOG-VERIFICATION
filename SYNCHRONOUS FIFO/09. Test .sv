`include "environment.sv"

program test #(parameter DATA_WIDTH=8,DEPTH=8)(inter interf);
  environment #(DATA_WIDTH, DEPTH) env;
  initial begin
    env = new(interf);
    env.test();
  end
endprogram
