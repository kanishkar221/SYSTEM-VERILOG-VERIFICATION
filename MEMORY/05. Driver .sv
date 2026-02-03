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
    repeat(20)begin
      gen_to_drive.get(trans);
      interf.wr <= trans.wr;
      interf.d_in <= trans.d_in;
      interf.addr <= trans.addr;
      trans.display("DRIVER");
      
    end
  endtask
  
endclass
