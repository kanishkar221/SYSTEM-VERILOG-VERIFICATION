`include "environment.sv"
program test(inter inf);
  environment envi;
  initial begin
    envi = new(inf);
    envi.envi();
  end
endprogram
