`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Madeline Grassi, Guranaad Kaur
// 
// Create Date: 10/23/2026 02:35:40 PM
// Design Name: 
// Module Name: decoder_2to4
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


module decoder_2to4(input[1:0] S,
                    output[3:0] Y);
    // active low
    not(NS0, S[0]);
    not(NS1, S[1]);
    nand N1(Y[0], NS1, NS0); //00 is ones
    nand N2(Y[1], NS1, S[0]); //01 is tens
    nand N3(Y[2], S[1], NS0); //10 is hundreds
    nand N4(Y[3], S[1], S[0]); //11 is thousands
endmodule
