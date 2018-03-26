`timescale 1ns / 1ps

module ALU( 
input [15:0]A,
input [15:0]B,
input [2:0]ALUop,

output reg signed [15:0]ALUout,
output zero
);


assign zero= (A==B)? 0:1;

always@(ALUop, A,B) begin

   case(ALUop)
   
       0: ALUout=0;
       1: ALUout=A+B;
       2: ALUout=A-B;
       3: ALUout=A & B;
       4: ALUout=A | B;
       5: ALUout=(A<B)? 16'hFFFF:16'h0000;
       6: ALUout= A[15:0]<<B[5:0];
       7: ALUout= A[15:0]>>B[5:0];
       default: ALUout= 16'h0000;
   endcase
end
endmodule
