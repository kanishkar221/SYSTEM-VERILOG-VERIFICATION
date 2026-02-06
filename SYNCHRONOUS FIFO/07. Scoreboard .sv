class scoreboard #(parameter DATA_WIDTH = 8);
  transaction trans;
  mailbox monit_to_score;
  //event trigger;
  
  bit [DATA_WIDTH-1:0] exp_fifo [0:7];
  int exp_w_ptr;
  int exp_r_ptr;
  
  function new(mailbox monit_to_score);
    this.monit_to_score = monit_to_score;
    exp_w_ptr = 0;
    exp_r_ptr = 0;
  endfunction
  
  task score();
    trans = new();
    forever begin
      monit_to_score.get(trans);
      trans.display("SCOREBOARD");
      
      // reset handling
      if(!trans.rst_n) begin
        exp_w_ptr = 0;
        exp_r_ptr = 0;
        $display("RESET : FIFO pointers cleared");
        $display("----------------------------------------------------------------------------------");
      end
      
      // Write Operation
      else begin
        if(trans.w_en && !trans.full) begin
          exp_fifo[exp_w_ptr] = trans.data_in;
          $display("WRITE PASS ----> Data written = %0d at location %0d", trans.data_in, exp_w_ptr);
          exp_w_ptr = exp_w_ptr + 1;
        end
        
        // Read Operation
        if(trans.r_en && !trans.empty) begin
          if(trans.data_out == exp_fifo[exp_r_ptr]) begin
            $display("READ PASS ----> Actual=%0d  Expected=%0d", trans.data_out, exp_fifo[exp_r_ptr]);
          end
          else begin
            $display("READ FAIL ----> Actual=%0d  Expected=%0d", trans.data_out, exp_fifo[exp_r_ptr]);
          end
          exp_r_ptr = exp_r_ptr + 1;
        end
        $display("-------------------------------------------------------------------------------------");
      end
    end
  endtask
  
endclass 
