`timescale 1ns / 1ps

module CPU(
input rst,
input clk,// My one an only love 
input [2:0]inr,// debug
input [15:0]data,//input to the write regi MUX
input [15:0]ins,// input to the control unit

// outputs,

output [15:0]insAddress,// output of the PC
output [15:0]dataAddress,// directly comes from the ALU output
output [15:0]outValue,// debug
output memRead,
output memWrite,
output [15:0]dataOut

    );


//dummy ports to synthesize

(* DONT_TOUCH = "true" *)wire [15:0]w0;
(* DONT_TOUCH = "true" *)wire [15:0]w1;
(* DONT_TOUCH = "true" *)wire [15:0]w2;
(* DONT_TOUCH = "true" *)wire [15:0]w3;
(* DONT_TOUCH = "true" *)wire [15:0]w4;
(* DONT_TOUCH = "true" *)wire [15:0]w5;
(* DONT_TOUCH = "true" *)wire [15:0]w6;

(* DONT_TOUCH = "true" *)wire [2:0]w7;
(* DONT_TOUCH = "true" *)wire [2:0]w8;
(* DONT_TOUCH = "true" *)wire [2:0]w9;
(* DONT_TOUCH = "true" *)wire [15:0]w10;
(* DONT_TOUCH = "true" *)wire [15:0]w11;
(* DONT_TOUCH = "true" *)wire c2;
(* DONT_TOUCH = "true" *)wire c1;


(* DONT_TOUCH = "true" *)wire [15:0]w14;

(* DONT_TOUCH = "true" *)wire link;

(* DONT_TOUCH = "true" *)wire JE_JNE;

(* DONT_TOUCH = "true" *)wire MemToReg;
(* DONT_TOUCH = "true" *)wire stop;
(* DONT_TOUCH = "true" *)wire Branch;
(* DONT_TOUCH = "true" *)wire Jump;
(* DONT_TOUCH = "true" *)wire RegWrite;
(* DONT_TOUCH = "true" *)wire ALUsrc;
(* DONT_TOUCH = "true" *)wire RegDst;
(* DONT_TOUCH = "true" *)wire [2:0]ALUop;

(* DONT_TOUCH = "true" *)wire zero;
(* DONT_TOUCH = "true" *)wire b;

// if it it works in the first time it means you have done something wrong
(* DONT_TOUCH = "true" *)wire [15:0]w2_sp;
(* DONT_TOUCH = "true" *) MUX  mux0 (w0,w1,w2,link);//PC mux// 1'b0 should be link
(* DONT_TOUCH = "true" *) MUX  mux_sp(w2,insAddress,w2_sp,stop);
(* DONT_TOUCH = "true" *) PC pc(clk,rst,w2_sp,insAddress);
(* DONT_TOUCH = "true" *)ADDER alu0(16'h0001,insAddress,w3);
(* DONT_TOUCH = "true" *)ADDER alu1(w3,w4,w5);
(* DONT_TOUCH = "true" *)MUX mux2(w3,w5,w6,c1);//1'b0 should be c1
(* DONT_TOUCH = "true" *)MUX mux1(w6,{w3[15:12],ins[11:0]},w0,Jump);//1'b0 should be Jump// keep an eye on this pal
//controller
(* DONT_TOUCH = "true" *)Cont controller(ins[15:12],link,JE_JNE,memWrite,MemToReg,memRead,Branch,Jump,RegWrite,ALUsrc,RegDst,ALUop,stop);

(* DONT_TOUCH = "true" *)MUX3 mux6(ins[11:9],3'b111,w7,link);
(* DONT_TOUCH = "true" *)MUX3 mux7(ins[8:6],ins[5:3],w8,RegDst);
(* DONT_TOUCH = "true" *)MUX3 mux8(w8,3'b111,w9,c2);
(* DONT_TOUCH = "true" *)MUX mux5(w10,w3,w11,c2);

(* DONT_TOUCH = "true" *)MUX mux4(dataAddress,data,w10,MemToReg);//ALUout is also data address and input ot the mux4
(* DONT_TOUCH = "true" *)MUX mux3(dataOut,w4,w14,ALUsrc);

(* DONT_TOUCH = "true" *)Reg Registers(inr ,clk, w7, ins[8:6], w9,RegWrite, w11, rst, w1, dataOut, outValue);
(* DONT_TOUCH = "true" *)SignExtend SignEXT(ins[5:0],w4);
// call ALU
(* DONT_TOUCH = "true" *)ALU ALU_0(w1,w14,ALUop,dataAddress,zero);
(* DONT_TOUCH = "true" *) xor XOR_0(b,JE_JNE,zero);
(* DONT_TOUCH = "true" *) and AND_0 (c1,b,Branch);
(* DONT_TOUCH = "true" *) and AND_1(c2,Jump,RegDst);






























    
    
endmodule
