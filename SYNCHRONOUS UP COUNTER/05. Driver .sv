class driver;
  virtual inter interf;
  transaction trans;
  mailbox gen_to_drive;
  
  function new(virtual inter interf, mailbox gen_to_drive);
    this.interf = interf;
    this.gen_to_drive = gen_to_drive;
  endfunction
  
  task drive();
    trans = new();
    repeat(10)begin
      gen_to_drive.get(trans);
      interf.enable = trans.enable;
      @(negedge interf.clk);
      //@(posedge interf.clk);
      trans.display("DRIVER");
    end
  endtask
  
endclass
