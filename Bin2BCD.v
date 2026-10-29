`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 10/23/2026 03:08:44 PM
// Design Name: 
// Module Name: Bin2BCD
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


module Bin2BCD(input [11:0] bin_d_in,
               input clk,
               input en,
               output reg [15:0] bcd_d_out = 16'd0,
               output reg busy = 1'b0,
               output reg rdy = 1'b0);

    parameter idle = 3'd0,
              setup = 3'd1,
              add = 3'd2,
              shift = 3'd3,
              done = 3'd4;
    reg [2:0] state = idle;
    reg [27:0] bcd_data = 28'd0;
    reg [3:0] sh_counter = 4'd0;
    reg[1:0] add_counter = 0;
    
    always @(posedge clk)
        begin
            case(state)
            idle:begin
            busy <= 1'b0;
            sh_counter <= 0;
            add_counter <= 0;
            if(en)
            state <= setup;
            end

            setup:begin
            busy <= 1'b1;
            rdy <= 1'b0;
            bcd_data <= {16'b0, bin_d_in};
            state <= add;
            end

            add:begin
            
            case(add_counter)
            0:begin
            if(bcd_data[15:12] > 4)
            bcd_data[27:12] <= bcd_data[27:12] + 3;
            add_counter <= add_counter + 1;
            end

            1:begin
            if(bcd_data[19:16] > 4)
            bcd_data[27:16] <= bcd_data[27:16] + 3;
            add_counter <= add_counter + 1;
            end

            2:begin
            if((add_counter == 2) && (bcd_data[23:20] > 4))
            bcd_data[27:20] <= bcd_data[27:20] + 3;
            add_counter <= add_counter + 1;
            end

            3:begin
            if((add_counter == 3) && (bcd_data[27:24] > 4))
            bcd_data[27:24] <= bcd_data[27:24] + 3;
            add_counter <= 0;
            state <= shift;
            end
            endcase
            end

            shift:begin
            sh_counter <= sh_counter + 1;
            bcd_data <= bcd_data << 1;
            if(sh_counter == 11)
            state <= done;
            else
            state <= add;
            end

            done:begin
            bcd_d_out <= bcd_data[27:12];
            rdy <= 1'b1;
            state <= idle;
            end

            default: state <= idle;
            endcase
        end
endmodule
