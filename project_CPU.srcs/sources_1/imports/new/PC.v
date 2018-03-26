`timescale 1ns / 1ps
module PC(
input clk,
input rst,
input [15:0]in,
output reg [15:0]out
);

always @(posedge clk,negedge rst)

            begin
        if(!rst)  out<=0;
        else  out<=in;
        
        
    
        
        
            end
endmodule
    
    
    