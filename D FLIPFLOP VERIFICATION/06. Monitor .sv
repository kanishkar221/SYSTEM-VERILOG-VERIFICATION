class monitor;
  transaction trans;
  mailbox moni_to_scor;
  virtual inter inf;
  
  function new(virtual inter inf, mailbox moni_to_scor);
    this.inf = inf;
    this.moni_to_scor = moni_to_scor;
  endfunction
  
  task moni();
    trans = new();
    repeat(5) begin
      @(posedge inf.clk);
      trans.rst = inf.rst;
      trans.d = inf.d;
      trans.q = inf.q;
      moni_to_scor.put(trans);
      trans.disp("MONITOR");
    end
  endtask
endclass
