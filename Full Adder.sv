// half adder code
module halfadder(input wire a,b,clk,rst,
                 output reg sum, 
                 output reg carry);
  
  always @* begin//for synchronize always @(posedge clk) begin 
    if (rst == 1) begin
      sum <= 1'b0;
      carry <= 1'b0;
    end else begin
      sum <= a ^ b;
      carry <= a & b;
    end
  end
endmodule

module fulladder(input a, b, cin, clk, rst,
                 output reg sum, 
                 output reg carry);
   wire n_sum, n_carry1, n_carry2, sum1;
   // use half adder to add a and b to n_sum(wire)
   halfadder U1(.a(a), .b(b), .clk(clk),.rst(rst),.sum(n_sum), .carry(n_carry1));
  // use another half adder to add n_sum and cin to sum1(wire)
   halfadder U2(.a(n_sum), .b(cin),.clk(clk),.rst(rst), .sum(sum1), .carry(n_carry2));
  
  always @* begin  
    if (rst) begin
      sum <= 1'b0;
      carry <= 1'b0;
    end else begin
      sum <= sum1;
      carry <= n_carry1 | n_carry2;
    end
  end
endmodule