class transaction;
  bit clk;
  bit reset;
  rand bit enable;
  bit [3:0] count;
  
  function void display(string name);
    $display("%s", name);
    $display("Time=%0t  reset=%0b  enable=%0b  count=%0d",$time, reset, enable, count);
  endfunction
  
endclass
