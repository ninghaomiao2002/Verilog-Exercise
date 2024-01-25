// Testbench
module test;
  reg clk,rst,en,dir;
  reg [15:0] data_in;
  wire [15:0] data_out;
  
  shift_register sr(.clk(clk), 
                 .rst(rst), 
                 .en(en), 
                 .dir(dir), 
                 .data_in(data_in), 
                 .data_out(data_out));
  always begin
        #1 clk = ~clk;
        #1 data_in=data_out;   
    end
  
  initial #100 $finish;
  
  initial begin 
    $dumpfile("shiftregisterdump.vcd");
    $dumpvars(1);
    clk = 0;
    rst=1'b1;
    en=1'b1;
    dir=1'b0;
    #4
    
    rst=1'b0;
    en=1'b1;
    dir=1'b1;
    #4
    
    rst=1'b0;
    en=1'b0;
    dir=1'b1;
    #4
    
    rst=1'b0;
    en=1'b0;
    dir=1'b1;
    #4
    
    rst=1'b0;
    en=1'b0;
    dir=1'b1;
    #4
    
    rst=1'b0;
    en=1'b0;
    dir=1'b1;
    #4;
    
  end 
endmodule 



