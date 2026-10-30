`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module mux_4to1(input [15:0] BCD,
                input [1:0] S,
                output reg [3:0] mux_out);
    always @(BCD, S)
        begin
            case(S)
                2'b00: mux_out = BCD[3:0]; //ones
                2'b01: mux_out = BCD[7:4];//tens
                2'b10: mux_out = BCD[11:8]; //hundreds
                2'b11: mux_out = BCD[15:12]; //thousdands
                default: mux_out = 4'b0000;
            endcase
        end
endmodule
