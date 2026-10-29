`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module counter_2bit (
    input clk,
    input reset,
    output [1:0] Q
);

    wire T0, T1;

    // T inputs
    assign T0 = 1'b1;
    assign T1 = Q[0];

    // 2 T flip-flops
    t_flip_flop FF0 (
        .clk(clk),
        .reset(reset),
        .T(T0),
        .Q(Q[0])
    );

    t_flip_flop FF1 (
        .clk(clk),
        .reset(reset),
        .T(T1),
        .Q(Q[1])
    );
endmodule