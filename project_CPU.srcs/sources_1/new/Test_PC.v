`timescale 1ns / 1ps


module Test_PC(
input clk,
input rst,
input [2:0]inr,

output a, b, c, d, e, f, g, dp,
output [3:0]an
);



(* DONT_TOUCH = "true" *)wire [15:0]outValue;
MyPC PC0(inr,clk,rst,outValue);
display Disp(clk, rst,outValue,a, b, c, d, e, f, g, dp,an);



endmodule
