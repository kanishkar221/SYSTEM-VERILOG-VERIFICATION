`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  generator gen;
  driver driv;
  monitor moni;
  scoreboard scor;
  transaction trans;
  
  mailbox gen_to_driv;
  mailbox moni_to_scor;
  
  virtual inter inf;
  event trigger;
  
  function new(virtual inter inf);
    this.inf = inf;
    gen_to_driv = new();
    moni_to_scor = new();
    gen = new(gen_to_driv);
    driv = new(inf, gen_to_driv);
    moni = new(inf, moni_to_scor);
    scor = new(moni_to_scor);
    
    gen.trigger = this.trigger;
    scor.trigger = this.trigger;
  endfunction
  
  task envi();
    fork 
      gen.gen();
      driv.driv();
      moni.moni();
      scor.scor();
    join
  endtask
endclass
