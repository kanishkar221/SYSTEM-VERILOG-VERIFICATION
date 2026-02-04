class scoreboard;
  transaction trans;
  mailbox monit_to_score;
  //event trigger;
    
  bit [3:0] exp_count;
  
  function new(mailbox monit_to_score);
    this.monit_to_score = monit_to_score;
    exp_count = 0;
  endfunction
  
  task score();
    trans = new();
    repeat(10)begin
      monit_to_score.get(trans);
      trans.display("SOREBOARD");
      
      if(trans.reset)
        exp_count = 0;
      else if (trans.enable)
        exp_count = exp_count + 1'b1;    
      
      if(trans.count == exp_count)
        $display("PASS ----> reset=%0b  enable=%0b  Actual count=%0d  Expected count=%0d", trans.reset, trans.enable,  trans.count, exp_count);
      else
        $display("FAIL ----> reset=%0b  enable=%0b  Actual count=%0d Expected count=%0d", trans.reset, trans.enable, trans.count, exp_count);
      $display("----------------------------------------------------------------");                                
      //-> trigger;
    end
  endtask
  
endclass
