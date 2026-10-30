`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module clock_divider_fast(clock_in, reset, clock_out);
    //Picked 1 kHz clock so digits can refresh quickly enough
    // Math: 100Mhz/1kHz=100,000 cycles, toggled every half period is 50,000
    //So wechose 16 bits since 2^16=65,536 which is big enough
    input clock_in, reset;
    output reg clock_out = 1'b0;

    reg [15:0] counter = 16'd0; //must count to 49,999 so use 2^16=65536 
    always @(posedge clock_in or posedge reset) begin
        if (reset) begin
            counter <= 16'd0;
            clock_out <= 1'b0;
        end
        else if (counter == 16'd49999) begin
            counter <= 16'd0;
            clock_out <= ~clock_out;
        end
        else begin
            counter <= counter + 1'b1;
        end
    end
endmodule