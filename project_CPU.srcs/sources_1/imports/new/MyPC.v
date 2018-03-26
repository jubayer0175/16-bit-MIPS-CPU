`timescale 1ns / 1ps

module MyPC(
input [2:0]inr,
input clk,
input rst,
output [15:0] outValue

);

(* DONT_TOUCH = "true" *)wire [15:0]ins;
(* DONT_TOUCH = "true" *)wire [15:0]insAddress;
(* DONT_TOUCH = "true" *)wire memRead;
(* DONT_TOUCH = "true" *)wire memWrite;
(* DONT_TOUCH = "true" *)wire [15:0]dataAddress;
(* DONT_TOUCH = "true" *)wire [15:0]dataOut;
(* DONT_TOUCH = "true" *)wire [15:0]data;

(* DONT_TOUCH = "true" *) CPU CPU0(rst,clk,inr,data,ins,insAddress,dataAddress,outValue,memRead,memWrite,dataOut);


(* DONT_TOUCH = "true" *) insMemory insMemory(insAddress[6:0],ins); // only lower 7 bit used
(* DONT_TOUCH = "true" *) dataMemory Data(clk,memWrite,memRead,dataAddress[9:0],dataOut,data);// lower 10 bit data address used

endmodule



