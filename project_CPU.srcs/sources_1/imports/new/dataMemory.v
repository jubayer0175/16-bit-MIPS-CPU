`timescale 1ns / 1ps


module dataMemory (
input clk,
input memWrite,
input memRead,
input [9:0]address,// acess 512*2 byte memory
input [15:0]dataIn, 

output  [15:0]dataOut

);

//parameter n=128;

reg [15:0]memory[1024-1:0];
integer i; 
initial begin
for(i=0;i<1024;i=i+1)
 memory[i] <=i+5;
 end 

always @(posedge clk) begin
            
            if (memWrite)
              memory[address]<=dataIn;
            end 
             
 
 
 
assign dataOut =  (memRead==1'b1) ?    memory[address]:16'h0000;        
        
      
endmodule
