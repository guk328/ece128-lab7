`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2026 02:42:01 PM
// Design Name: 
// Module Name: mux_4to1
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module mux_4to1(input [15:0] BCD,
                input [1:0] S,
                output reg [3:0] mux_out);
    always @(BCD, S)
        begin
            case(S)
                2'b00: mux_out = BCD[3:0]; //ones
                2'b01: mux_out = BCD[4:7];//tens
                2'b10: mux_out = BCD[8:11]; //hundreds
                2'b11: mux_out = BCD[12:15]; //thousdands
                default: mux_out = 4'b0000;
            endcase
        end
endmodule
