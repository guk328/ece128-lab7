`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Engineer: Madeline and Guranaad
//////////////////////////////////////////////////////////////////////////////////


module t_flip_flop (
    input clk,
    input reset,
    input T,
    output reg Q = 1'b0
);

    always @(posedge clk) begin
        if (reset)
            Q <= 1'b0;
        else if (T)
            Q <= ~Q;
    end

endmodule