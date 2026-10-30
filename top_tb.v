`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Names: Madeline Grassi, Guranaad Kaur
//////////////////////////////////////////////////////////////////////////////////

module top_tb;
    reg clk, rst;    wire rdy;
    wire [6:0] cathode; 
    wire [3:0] anode;
    top DUT(.clk(clk), .rst(rst), .rdy(rdy), .cathode(cathode), .anode(anode));
    
    always #5 clk = ~clk;
    initial begin
        $display("rst    |    cathode       anode");
        $monitor("%b    |    %b     %b", rst, cathode, anode);
                clk = 1'b0; rst = 1'b1; #10;  // reset on, starts in s0
        rst = 1'b0;
        #100 $finish;
    end
endmodule

