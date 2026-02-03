class scoreboard;
  transaction trans;
  mailbox monit_to_score;
  event trigger;
  bit [7:0] mem[15:0];
  
  function new(mailbox monit_to_score);
    this.monit_to_score = monit_to_score;
    this.trans = trans;
  endfunction
  
  task score();
    trans = new();
    repeat(20)begin
      monit_to_score.get(trans);
      trans.display("SCOREBOARD");
      
      if(trans.wr) begin
        mem[trans.addr] = trans.d_in;
        $display("Write Pass: addr=%0d  d_in=%0d", trans.addr, trans.d_in);
      end
      else begin
        if(trans.d_out == mem[trans.addr])
          $display("Read Pass: addr=%0d d_out=%0d", trans.addr, trans.d_out);
        else
          $error("Read Fail: addr=%0d  d_out=%0d", trans.addr, trans.d_out);
      end
      -> trigger;
      $display("------------------------------------------");
    end
  endtask
  
endclass
