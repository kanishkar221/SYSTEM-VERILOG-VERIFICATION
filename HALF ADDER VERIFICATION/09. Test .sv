`include "environment.sv"
program test (inter interf);
  environment env;
  initial begin
    env = new(interf);
    env.test();
  end
endprogram
