module halfadder_tb;
  reg a,b,cin,clk,rst;
  wire sum, carry;
  
  fulladder fa(.a(a), 
            .b(b), 
            .cin(cin), 
            .clk(clk), 
            .rst(rst),
            .sum(sum), 
            .carry(carry));
 
  always begin
    #1 clk = ~clk;
   end
  
  initial #100 $finish;
  
  initial begin
    $dumpfile("fulladderdump.vcd");
    $dumpvars(1);
    
    clk = 0;
    cin = 0;
    a = 1'b0;
    b = 1'b0;
    rst = 1'b1;
    #20
    
    rst = 1'b0;
    a = 1'b0;
    b = 1'b0;
    //carry = 0
    //sum = 0
    #10
    
    rst = 1'b0;
    a = 1'b1;
    b = 1'b0;
    //carry = 0
    //sum = 1
    #10
    
    rst = 1'b0;
    a = 1'b0;
    b = 1'b1;
    //carry = 0
    //sum = 1
    #10
    
    rst = 1'b0;
    a = 1'b1;
    b = 1'b1;
    //carry = 1
    //sum = 0
    #10;
    
    rst = 1'b1;
    //a = 1'b1;
    //b = 1'b1;
    //carry = 1
    //sum = 0
    #10;
  end
endmodule