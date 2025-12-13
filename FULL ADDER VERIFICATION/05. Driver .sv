class driver;
  virtual inter interf;
  transaction trans;
  mailbox gen_to_drive;
  
  function new (virtual inter interf,mailbox gen_to_drive);
    this.interf = interf;
    this.gen_to_drive = gen_to_drive;
  endfunction
  
  task drive();
    trans = new();
    repeat(5)begin
      #1;
      gen_to_drive.get(trans);
      interf.a = trans.a;
      interf.b = trans.b;
      interf.c_in = trans.c_in;
      trans.display("DRIVER");
      #2;
    end
  endtask
endclass
    
