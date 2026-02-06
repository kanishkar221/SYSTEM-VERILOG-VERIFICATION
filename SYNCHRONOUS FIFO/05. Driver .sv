class driver #(parameter DATA_WIDTH = 8, DEPTH = 8);
  virtual inter #(DATA_WIDTH, DEPTH)interf;
  transaction #(DATA_WIDTH) trans;
  mailbox gen_to_drive;
  
  function new(virtual inter #(DATA_WIDTH, DEPTH) interf, mailbox gen_to_drive);
    this.interf = interf;
    this.gen_to_drive = gen_to_drive;
  endfunction
  
  task drive();
    trans = new();
    repeat(10) begin
      gen_to_drive.get(trans);
      @(negedge interf.clk);
      interf.w_en = trans.w_en;
      interf.r_en = trans.r_en;
      interf.data_in = trans.data_in;
      trans.display("DRIVER");
    end
  endtask
  
endclass
