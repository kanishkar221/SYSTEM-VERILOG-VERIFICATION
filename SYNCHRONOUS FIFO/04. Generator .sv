
class generator #(parameter DATA_WIDTH = 8);
  transaction #(DATA_WIDTH) trans;
  mailbox gen_to_drive;
  
  function new(mailbox gen_to_drive);
    this.gen_to_drive = gen_to_drive;
  endfunction
  
  task gen();
    trans = new();
    repeat(10)begin
      void'(trans.randomize());    
      //trans.randomize();
      gen_to_drive.put(trans);
      trans.display("GENERATOR");
      #10;
    end
  endtask
  
endclass
