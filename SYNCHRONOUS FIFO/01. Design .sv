module synchronous_fifo #(parameter DEPTH=8, DATA_WIDTH=8) (
  input logic clk,
  input logic rst_n,
  input logic w_en,
  input logic r_en,
  input logic [DATA_WIDTH-1:0] data_in,
  output logic [DATA_WIDTH-1:0] data_out,
  output logic full,
  output logic empty
);
  
  localparam PTR_WIDTH = $clog2(DEPTH);
  
  logic [PTR_WIDTH-1:0] w_ptr, r_ptr;
  logic [DATA_WIDTH-1:0] fifo [0:DEPTH-1];
  
  always @ (posedge clk) begin
    if(!rst_n) begin
      w_ptr <= 0;
      r_ptr <= 0;
      data_out <= 0;
    end
    else begin
      if (w_en && !full) begin
        fifo[w_ptr] <= data_in;
        w_ptr <= w_ptr + 1'b1;
      end
      
      if (r_en && !empty) begin
        data_out <= fifo[r_ptr];
        r_ptr <= r_ptr + 1'b1;
      end
    end
  end
  
  assign full = ((w_ptr + 1'b1) == r_ptr);
  assign empty = (w_ptr == r_ptr);
endmodule  
