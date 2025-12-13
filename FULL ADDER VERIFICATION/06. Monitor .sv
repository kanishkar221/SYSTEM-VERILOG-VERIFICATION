class monitor;
  transaction trans;
  virtual inter interf;
  mailbox monit_to_score;
  
  function new(virtual inter interf,mailbox monit_to_score);
    this.interf = interf;
    this.monit_to_score = monit_to_score;
  endfunction
  
  task monitor();
    trans = new();
    repeat(5)begin
      #2;
      trans.a=interf.a;
      trans.b=interf.b;
      trans.c_in=interf.c_in;
      trans.sum=interf.sum;
      trans.c_out=interf.c_out;
      monit_to_score.put(trans);
      trans.display("MONITOR");
      #1;
    end
  endtask
endclass
 
