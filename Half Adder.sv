// half adder
module halfadder(input a,b,clk,rst,
                 output reg sum, 
                 output reg carry)
  
  always @* begin
  //for synchronize us always @(posedge clk) begin  
    if (rst) begin
      sum <= 1'b0;
      carry <= 1'b0;
    end else begin
      sum <= a ^ b;
      carry <= a & b;
    end
  end
endmodule