`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/03/2017 05:11:09 PM
// Design Name: 
// Module Name: Cont
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


module Cont(
input [3:0]ctrlIn,
output link,
output JE_JNE,
output MemWrite,
output MemToReg,
output MemRead,
output Branch,
output Jump,
output RegWrite,
output ALUsrc,
output RegDst,
output reg [2:0]ALUop,
output stop
);
    
    
// assignement block
assign stop=~ctrlIn[0]& ~ctrlIn[1] & ~ctrlIn[2] & ~ctrlIn[3];
assign link= ctrlIn[0]& ctrlIn[1] & ctrlIn[2] & ctrlIn[3]; //1111
assign JE_JNE= ctrlIn[2] & ctrlIn[3]& ctrlIn[0] & (~ctrlIn[1]);//1101
assign MemWrite= ctrlIn[2] & ctrlIn[3] & ~ctrlIn[1] & ~ctrlIn[0];//1100
assign MemToReg= (ctrlIn[3] & ~ctrlIn[2] & ctrlIn[1] & ctrlIn[0])|(ctrlIn[3] & ctrlIn[2] & ~ctrlIn[1] & ~ctrlIn[0]);
assign MemRead= (ctrlIn[3] & ~ctrlIn[2]) & (ctrlIn[1] & ctrlIn[0]);//1011
assign Branch = (ctrlIn[3] & ctrlIn[2]) & (ctrlIn[1] ^ ctrlIn[0]); //1101+1110;
assign Jump = (~ctrlIn[3] & ~ctrlIn[2]) & (ctrlIn[1] ^ ctrlIn[0]);
assign RegWrite =  (~ctrlIn[3] & ctrlIn[1]) | (~ctrlIn[3] & ctrlIn[2]) | (ctrlIn[3] & ~ctrlIn[2]); //GENERATE FROM k-MAP   
assign  ALUsrc= (ctrlIn[3] & ~ctrlIn[2]) | (ctrlIn[3] & ~ctrlIn[1] & ~ctrlIn[0]);
assign RegDst=    (~ctrlIn[3] & ctrlIn[1]) | (~ctrlIn[3] & ctrlIn[2]);
//for ALU output
        always @ (ctrlIn)
        begin
        if( (ctrlIn>=3) && (ctrlIn <= 9)) //for control 3 to 9 ALUop is 2 less 
        ALUop= ctrlIn-2;
        else if ((ctrlIn>=10) && (ctrlIn <=12))
        ALUop= 1;
        else if((ctrlIn==13) || (ctrlIn==14) )
        ALUop= 2;
        else 
        ALUop= 0; //default case
        
        
        
        
        
        
        
        end


    
endmodule
