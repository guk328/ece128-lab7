`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Madeline and Guranaad
// 
// Create Date: 09/18/2026 01:32:10 PM
// Design Name: 
// Module Name: BCD_7_Seg
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


module BCD_7_Seg(
    input [3:0] bcd,
    output reg [6:0] seg
    );
    // Code from lab 3
    always @(bcd) //remember 7 seg is active low so all logic is flipped
        begin 
            case (bcd)
                4'd0: seg= 7'b0000001;
                4'd1: seg= 7'b1001111;
                4'd2: seg= 7'b0010010;
                4'd3: seg= 7'b0000110;
                4'd4: seg= 7'b1001100;
                4'd5: seg= 7'b0100100;
                4'd6: seg= 7'b0100000;
                4'd7: seg= 7'b0001111;
                4'd8: seg= 7'b0000000;
                4'd9: seg= 7'b0000100;
                
                default: seg= 7'b1111111;
            endcase
        end
        
        
    
endmodule