`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module multi_seg_driver(
    input clk, rst, [15:0] BCD_in,
    output [6:0] cathode, 
    output [3:0] anode
    );
    
    wire [1:0] Q_2bit;
    wire [3:0] mux_out;
    
    counter_2bit dut1 (.clk(clk), .reset(rst), .Q(Q_2bit));
    
    mux_4to1 dut2 (.BCD(BCD_in), .S(Q_2bit), .mux_out(mux_out));
    
    decoder_2to4 dut3 (.S(Q_2bit), .Y(anode));
    BCD_7_Seg dut4 (.bcd(mux_out), .seg(cathode));
    
    
endmodule
