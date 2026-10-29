`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module clock_divider(clock_in, clock_out);
    // Modified previous clock divider code to get maximum 1 Hz frequency
    input clock_in;
    output reg clock_out = 1'b0;

    reg [25:0] counter = 26'd0; //can count up to 2^26=67108864 
    always @(posedge clock_in) begin
        counter <= counter + 1;
        if (counter == 26'd49999999) begin
            clock_out <= ~clock_out;   // Toggle the output clock
            counter <= 0;
        end
    end
endmodule