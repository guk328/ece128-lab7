`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/29/2026 06:16:28 PM
// Design Name: 
// Module Name: top
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


module top(
    input clk, rst,
    output rdy, [6:0] cathode, [3:0] anode
    );
    
    wire clk_out;
    wire [11:0] Q_12bit;
    wire en;
    wire [15:0] BCD_out;
    
    
    clock_divider_fast uut1 (.clock_in(clk), .reset(rst), .clock_out(clk_out));
    
    counter_12bit uut2 (.clk(clk_out), .reset(rst), .Q(Q_12bit), .en(en));
    
    Bin2BCD uut3 (.bin_d_in(Q_12bit), .clk(clk_out), .en(en), .bcd_d_out(BCD_out), .rdy(rdy));

    multi_seg_driver uut4 (.clk(clk_out), .rst(rst), .BCD_in(BCD_out), .cathode(cathode), .anode(anode));
    


    
endmodule
