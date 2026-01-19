class generator;
  transaction trans;
  mailbox gen_to_driv;
  event trigger;
  
  function new(mailbox gen_to_driv);
    this.trans = trans;
    this.gen_to_driv = gen_to_driv;
  endfunction
  
  task gen();
    trans = new();
    repeat(5) begin
      void'(trans.randomize());
      gen_to_driv.put(trans);
      trans.disp("GENERATOR");
      @trigger;
    end
  endtask
endclass    
