class monitor;
  transaction trans;
  virtual inter interf;
  mailbox monit_to_score;
  
  function new(virtual inter interf, mailbox monit_to_score);
    this.interf = interf;
    this.monit_to_score = monit_to_score;
  endfunction
  
  task monitor();
    trans = new();
    repeat(10)begin
      @(posedge interf.clk);
      trans.reset = interf.reset;
      trans.enable = interf.enable;
      trans.count = interf.count;
      monit_to_score.put(trans);
      trans.display("MONITOR");
    end
  endtask
  
endclass
