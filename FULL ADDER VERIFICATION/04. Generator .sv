class generator;
  transaction trans;
  mailbox gen_to_drive;
  
  function new (mailbox gen_to_drive);
    this.gen_to_drive = gen_to_drive;
  endfunction
  
  task gen();
    trans = new();
    repeat(5)begin;
      trans.randomize();
      gen_to_drive.put(trans);
      trans.display("GENERATOR");
      #3;
    end
  endtask
endclass
