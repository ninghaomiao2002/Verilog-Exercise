module mux4to1 (
  input [3:0] a, b, c, d,
  input [1:0] sel,
  input clk1,
  input reset,
  output reg [3:0] out
);
  
  always @(posedge clk1) begin
    if(reset) begin
      out <= 4'b0;
    end else begin 
      case(sel)
        2'b00: out <= a;
        2'b01: out <= b;
        2'b10: out <= c;
        2'b11: out <= d;
      endcase
    end 
  end 
endmodule

