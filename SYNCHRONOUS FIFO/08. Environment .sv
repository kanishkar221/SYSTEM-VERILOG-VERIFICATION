`include "transaction.sv"
`include "generator.sv"
`include "driver.sv"
`include "monitor.sv"
`include "scoreboard.sv"

class environment #(parameter DATA_WIDTH = 8, DEPTH = 8);
  transaction #(DATA_WIDTH) trans;
  generator   #(DATA_WIDTH) gen;
  driver      #(DATA_WIDTH, DEPTH) drive;
  monitor     #(DATA_WIDTH, DEPTH) monit;
  scoreboard  #(DATA_WIDTH) score;
  
  mailbox gen_to_drive;
  mailbox monit_to_score;
  
  virtual inter #(DATA_WIDTH, DEPTH) interf;
  
  function new(virtual inter #(DATA_WIDTH, DEPTH) interf);
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
