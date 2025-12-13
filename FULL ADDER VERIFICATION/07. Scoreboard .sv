class scoreboard;
  transaction trans;
  mailbox monit_to_score;
  
  function new(mailbox monit_to_score);
    this.monit_to_score = monit_to_score;
  endfunction
  
  task score();
    trans = new();
    repeat(5)begin
      monit_to_score.get(trans);
      trans.display("SCOREBOARD");
      if((trans.a^trans.b^trans.c_in==trans.sum)&&((trans.a&trans.b)|(trans.b&trans.c_in)|(trans.c_in&trans.a)==trans.c_out))
        $display("=================PASS=================");
      else
        $display("=================FAIL=================");
    end
  endtask
endclass
