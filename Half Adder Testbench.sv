module halfadder_tb;
  reg a,b,clk,rst;
  wire sum, carry;
  
  halfadder ha(.a(a),
            .b(b),
            .clk(clk),
            .rst(rst),
            .sum(sum),
            .carry(carry));
  
  always begin
    #1 clk = ~clk;
   end
  
  initial #100 $finish;
  
  initial begin
    $dumpfile("halfadderdump.vcd");
    $dumpvars(1);
    
    clk = 0;
    
    a = 1'b0;
    b = 1'b0;
    rst = 1'b1;
    #10
    
    rst = 1'b0;
    a = 1'b0;
    b = 1'b0;
    #10
    
    rst = 1'b0;
    a = 1'b1;
    b = 1'b0;
    #10
    
    rst = 1'b0;
    a = 1'b0;
    b = 1'b1;
    #10
    
    rst = 1'b0;
    a = 1'b1;
    b = 1'b1;
    #10;
    
    rst = 1'b1;
  end
  
endmodule