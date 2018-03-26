//sign extender
`timescale 1ns / 1ps
module SignExtend(
input [5:0]datain,
output [15:0]dataout
);
assign dataout={{10{datain[5]}},datain[5:0] };
endmodule