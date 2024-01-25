module example_tb;
	reg clk1;
    reg reset;
    reg [3:0] a, b, c, d;
    reg [1:0] sel;
    wire [3:0] out;

  mux4to1 mux(
    .reset(reset),
    .a(a),
    .b(b),
    .c(c),
    .d(d),
    .clk1(clk1),
    .sel(sel),
    .out(out));
    
  always begin
    #4 sel[0] = ~sel[0];
    #4 sel[1] = ~sel[1];
  end
  
  always begin
    #1 clk1 = ~clk1;
    
  end
  
  initial #100 $finish;

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(1);
    clk1=1;
    a = 4'b1000;
    b = 4'b1010;
    c = 4'b0001;
    d = 4'b1111;
    sel = 2'b00;
    reset = 1'b1;
    #1
    reset = 1'b0;
    #50
    reset = 1'b1;
     
//     #10
//     a = 4'b1000;
//     b = 4'b1010;
//     c = 4'b0001;
//     d = 4'b1111;
//     reset = 1'b0;
//     sel = 2'b00;
//     #10
//     a = 4'b1000;
//     b = 4'b1010;
//     c = 4'b0001;
//     d = 4'b1111;
//     reset = 1'b0;
//     sel = 2'b01;
//     #10
//     a = 4'b1000;
//     b = 4'b1010;
//     c = 4'b0001;
//     d = 4'b1111;
//     sel = 2'b10;
//     reset = 1'b0;
//     #10
//     a = 4'b1000;
//     b = 4'b1010;
//     c = 4'b0001;
//     d = 4'b1111;
//     sel = 2'b11;
//     reset = 1'b0;
  end
endmodule 