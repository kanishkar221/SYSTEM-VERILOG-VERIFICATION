class generator;
  transaction trans;
  mailbox gen_to_drive;
  event trigger;
  
  function new(mailbox gen_to_drive);
    this.trans = trans;
    this.gen_to_drive = gen_to_drive;
  endfunction
  
  task gen();
    trans = new();
    repeat(20) begin
      trans.randomize();
      //void'(trans.randomize());
      gen_to_drive.put(trans);
      trans.display("GENERATOR");
      @ trigger;
    end
  endtask
  
endclass
