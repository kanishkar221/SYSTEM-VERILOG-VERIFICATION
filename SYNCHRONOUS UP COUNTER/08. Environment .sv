`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment;
  transaction trans;
  generator gen;
  driver drive;
  monitor monit;
  scoreboard score;
  
  mailbox gen_to_drive;
  mailbox monit_to_score;
  virtual inter interf;
  //event trigger;
    
  function new(virtual inter interf);
    this.interf = interf;
    gen_to_drive = new();
    monit_to_score = new();
    
    gen = new(gen_to_drive);
    drive = new(interf, gen_to_drive);
    monit = new(interf, monit_to_score);
    score = new(monit_to_score);
  endfunction
  
  task test();
    fork
      gen.gen();
      drive.drive();
      monit.monitor();
      score.score();
    join
  endtask
  
endclass  
