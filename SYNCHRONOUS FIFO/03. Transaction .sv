class transaction #(parameter DATA_WIDTH = 8);
  
  bit rst_n;
  rand bit w_en;
  rand bit r_en;
  rand bit [DATA_WIDTH-1:0] data_in;
  bit [DATA_WIDTH-1:0] data_out;
  bit full;
  bit empty;
  
  constraint wr_rd_c {
    !(w_en && r_en);
  }
    
  function void display(string name);
    $display("%s", name);
    $display("Time=%0t  rst_n=%0b  w_en=%0b  r_en=%0b  data_in=%0b  data_out=%0b  full=%0b  empty=%0b", $time, rst_n, w_en, r_en, data_in, data_out, full, empty);
  endfunction
  
endclass 
