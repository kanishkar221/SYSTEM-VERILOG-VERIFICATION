interface inter #(parameter DATA_WIDTH = 8, DEPTH = 8);
  logic clk;
  logic rst_n;
  logic w_en;
  logic r_en;
  logic [DATA_WIDTH-1:0] data_in;
  logic [DATA_WIDTH-1:0] data_out;
  logic full;
  logic empty;
endinterface
