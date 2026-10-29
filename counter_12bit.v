`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module counter_12bit (
    //Modified previous counter code to count up to 4095 decimal values
    //2^12=4096 hence 12 bits
    input clk,
    input reset,
    output [11:0] Q
);

    wire T0, T1, T2, T3, T4, T5, T6, T7, T8, T9, T10, T11;

    // T inputs
    assign T0 = 1'b1;
    assign T1 = Q[0];
    assign T2 = Q[0] & Q[1];
    assign T3 = Q[0] & Q[1] & Q[2];
    assign T4 = Q[0] & Q[1] & Q[2] & Q[3];
    assign T5 = Q[0] & Q[1] & Q[2] & Q[3] & Q[4];
    assign T6 = Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5];
    assign T7 = Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6];
    assign T8 = Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6] & Q[7];
    assign T9 = Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6] & Q[7] & Q[8];
    assign T10 = Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6] & Q[7] & Q[8] & Q[9];
    assign T11 = Q[0] & Q[1] & Q[2] & Q[3] & Q[4] & Q[5] & Q[6] & Q[7] & Q[8] & Q[9] & Q[10];

    // 12 T flip-flops
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

    t_flip_flop FF2 (
        .clk(clk),
        .reset(reset),
        .T(T2),
        .Q(Q[2])
    );
    
    t_flip_flop FF3 (
        .clk(clk),
        .reset(reset),
        .T(T3),
        .Q(Q[3])
    );
    
    t_flip_flop FF4 (
        .clk(clk),
        .reset(reset),
        .T(T4),
        .Q(Q[4])
    );
    
    t_flip_flop FF5 (
        .clk(clk),
        .reset(reset),
        .T(T5),
        .Q(Q[5])
    );
    
    t_flip_flop FF6 (
        .clk(clk),
        .reset(reset),
        .T(T6),
        .Q(Q[6])
    );
    
    t_flip_flop FF7 (
        .clk(clk),
        .reset(reset),
        .T(T7),
        .Q(Q[7])
    );
    
    t_flip_flop FF8 (
        .clk(clk),
        .reset(reset),
        .T(T8),
        .Q(Q[8])
    );
    
    t_flip_flop FF9 (
        .clk(clk),
        .reset(reset),
        .T(T9),
        .Q(Q[9])
    );
    
    t_flip_flop FF10 (
        .clk(clk),
        .reset(reset),
        .T(T10),
        .Q(Q[10])
    );
    
    t_flip_flop FF11 (
        .clk(clk),
        .reset(reset),
        .T(T11),
        .Q(Q[11])
    );

endmodule