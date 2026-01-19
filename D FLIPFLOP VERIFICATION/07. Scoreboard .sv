class scoreboard;
  transaction trans;
  mailbox moni_to_scor;
  event trigger;
  
  function new(mailbox moni_to_scor);
    this.moni_to_scor = moni_to_scor;
  endfunction
  
  task scor();
    trans = new();
    repeat(5) begin
      moni_to_scor.get(trans);
      trans.disp("SCOREBOARD");
      
      if((trans.rst == 1) && (trans.q == 0) || (trans.rst == 0) && (trans.q == trans.d))
        $display("-------PASS------");
      else
        $display("-------FAIL------");
      -> trigger;
    end
  endtask
endclass
