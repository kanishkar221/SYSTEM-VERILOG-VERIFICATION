class transaction;
  rand bit a;
  rand bit b;
       bit sum;
       bit carry;
  
  function void display(string name);
    $display("%s",name);
    $display("Time=%0t a=%b b=%b sum=%b carry=%b",$time,a,b,sum,carry);
  endfunction
endclass
      
