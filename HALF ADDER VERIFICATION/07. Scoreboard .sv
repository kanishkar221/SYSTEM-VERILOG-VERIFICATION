class scoreboard;
  transaction trans;
  mailbox monit_to_score;
  
  function new (mailbox monit_to_score);
    this.monit_to_score = monit_to_score;
  endfunction
  
  task score();
    trans = new();
    repeat(5)begin
      monit_to_score.get(trans);
      trans.display("SCOREBOARD");
      if(((trans.a^trans.b)==trans.sum)&&((trans.a&trans.b)==trans.carry))
        $display("PASS");
      else
        $display("FAIL");
    end
  endtask
endclass
