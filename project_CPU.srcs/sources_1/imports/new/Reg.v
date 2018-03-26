//Debugging port "inr" and "outvalue" include
`timescale 1ns / 1ps
module Reg(
input [2:0]inr,// for checking the register value
input clk,
input [2:0]ReadReg1,
input [2:0]ReadReg2,
input [2:0]writeReg,
input RegWrite,
input [15:0]RegDataIn,
input rst,

output [15:0]Data1,
output [15:0]Data2,
output [15:0]outvalue// for checking ouput in the top module
);

// register block 

reg [15:0]Reg_stack[7:0];



assign Data1= (ReadReg1==0)? 16'h0000: Reg_stack[ReadReg1]; // zero condition overwrites the internal value of the zero register
assign Data2= (ReadReg2==0)? 16'h0000: Reg_stack[ReadReg2];
assign outvalue= (inr==0)? 16'h0000:Reg_stack[inr];// debug port assignment

always@(posedge clk, negedge rst) begin
//

            if (!rst) begin
            
             
                Reg_stack[0]<=16'h0000;//setting it to zero
                Reg_stack[1]<=16'h0000;
                Reg_stack[2]<=16'h0000;
                Reg_stack[3]<=16'h0000;
                Reg_stack[4]<=16'h0000;
                Reg_stack[5]<=16'h0000;
                Reg_stack[6]<=16'h0000;
                Reg_stack[7]<=16'h0000;
             
            end
            else   begin
            
                    if (RegWrite) begin
                    Reg_stack[writeReg]<=RegDataIn;
                    end
            end

end

endmodule