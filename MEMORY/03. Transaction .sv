class transaction;
  
  rand bit wr;
  rand bit [7:0] d_in;
  rand bit [3:0] addr;
  bit [7:0] d_out;
  
  constraint wr_equal {
    wr dist { 1:=10, 0:=10};}
  
  function void display(string name);
    $display("%s", name);
    $display("Time=%0t  wr=%0d  d_in=%0d  addr=%0d  d_out=%0b",$time, wr, d_in, addr, d_out);
  endfunction
  
endclass
