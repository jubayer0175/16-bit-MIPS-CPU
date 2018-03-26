`timescale 1ns / 1ps

module MUX(
input [15:0]D0,
input [15:0]D1,
output [15:0]DataOut,
input select
    );
    assign DataOut= select? D1:D0; 
    
endmodule
