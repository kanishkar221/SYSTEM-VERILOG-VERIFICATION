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
    repeat(20)begin
      @(posedge interf.clk);
      trans.wr = interf.wr;
      trans.d_in = interf.d_in;
      trans.addr = interf.addr;
      trans.d_out = interf.d_out;
      monit_to_score.put(trans);
      trans.display("MONITOR");
    end
  endtask
  
endclass
