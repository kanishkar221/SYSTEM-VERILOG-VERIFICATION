class monitor #(parameter DATA_WIDTH = 8, DEPTH = 8);
  transaction #(DATA_WIDTH) trans;
  virtual inter #(DATA_WIDTH, DEPTH) interf;
  mailbox monit_to_score;
  
  function new(virtual inter #(DATA_WIDTH,  DEPTH)interf, mailbox monit_to_score);
    this.interf = interf;
    this.monit_to_score = monit_to_score;
  endfunction
  
  task monitor();
    trans = new();
    repeat(10)begin
      @(posedge interf.clk);
      trans.rst_n = interf.rst_n;
      trans.w_en = interf.w_en;
      trans.r_en = interf.r_en;
      trans.data_in = interf.data_in;
      trans.data_out = interf.data_out;
      trans.full = interf.full;
      trans.empty = interf.empty;
      monit_to_score.put(trans);
      trans.display("MONITOR");
    end
  endtask
  
endclass
