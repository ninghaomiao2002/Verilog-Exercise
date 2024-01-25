//Below is the code for 16-bit Shift Register
module shift_register(input clk, //clock signal
                      input rst, //reset signal can reset the signal to 0
                      input en,  //enable signal to give a start signal
                      input dir, //direction: 1 for shifting right and 0 for shifting left
                      input [15:0] data_in, 
                      output reg [15:0] data_out);

    always @(posedge clk) begin
        if (rst) begin
            data_out <= 16'b0000000000000000;
        end else if (en) begin
            data_out <= 16'b1000111111111111;
        end else if (dir) begin
            data_out <= {data_in[0], data_out[15:1]};
        end else begin
            data_out <= {data_out[14:0], data_in[15]};
        end
    end
endmodule
