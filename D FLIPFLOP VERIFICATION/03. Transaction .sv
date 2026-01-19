class transaction;
  bit rst;
  rand bit d;
  bit q;
  
  function void disp(string message);
    $display("%s", message);
    $display("Time = %0t | rst=%b | d=%b | q=%b",$time,rst,d,q);
  endfunction
endclass
