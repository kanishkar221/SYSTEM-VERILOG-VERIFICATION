module sync_up_counter (
  input  logic clk,
  input  logic reset,
  input  logic enable,
  output logic [3:0] count
);

  always_ff @(posedge clk or posedge reset) begin
    if (reset)
      count <= 4'b0000;
    else if (enable)
      count <= count + 1'b1;
  end

endmodule
