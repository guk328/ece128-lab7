`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module t_flip_flop ( // Code from lab 4
    input  clk,
    input  reset,
    input  T,
    output reg Q
);

    always @(posedge clk) begin
        if (reset)
            Q <= 1'b0;
        else if (T)
            Q <= ~Q;
        else
            Q <= Q;
    end

endmodule