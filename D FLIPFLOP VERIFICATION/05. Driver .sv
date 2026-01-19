class driver;
  mailbox gen_to_driv;
  transaction trans;
  virtual inter inf;
  
  function new(virtual inter inf, mailbox gen_to_driv);
    this.inf = inf;
    this.gen_to_driv= gen_to_driv;
  endfunction
  
  task driv();
    trans = new();
    repeat(5) begin
      gen_to_driv.get(trans);
      @(posedge inf.clk);
      inf.d <= trans.d;
      trans.disp("DRIVER");
      $display("rst = %0b", inf.rst);
    end
  endtask
endclass
