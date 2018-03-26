`timescale 1ns / 1ps




module display(
input clk, rst,
input [15:0]dataIn,
 output a, b, c, d, e, f, g, dp, //the individual LED output for the seven segment along with the digital point
 output [3:0] an   // the 4 bit enable signal
);


localparam N = 18;
 
(* DONT_TOUCH = "true" *)reg [N-1:0]count; //the 18 bit counter which allows us to multiplex at 1000Hz
 
always @ (posedge clk or posedge rst)
 begin
  if (!rst)
   count <= 0;
  else
   count <= count + 1;
 end
 
reg [3:0]sseg; 
reg [3:0]an_temp; 
 
always @ (*)
 begin
  case(count[N-1:N-2]) 
    
   2'b00 :  
    begin
     sseg = dataIn[3:0];
     an_temp = 4'b1110;
    end
    
   2'b01:  
    begin
     sseg = dataIn[7:4];
     an_temp = 4'b1101;
    end
    
   2'b10: 
    begin
     sseg = dataIn[11:8];
     an_temp = 4'b1011;
    end
     
   2'b11: 
    begin
     sseg =dataIn[15:12];
     an_temp = 4'b0111;
    end
  endcase
 end
assign an = an_temp;
 
 
reg [6:0] sseg_temp;
 
always @ (*)
 begin
  case(sseg)
   4'd0 : sseg_temp = 7'b1000000; //to display 0
   4'd1 : sseg_temp = 7'b1111001; //to display 1
   4'd2 : sseg_temp = 7'b0100100; //to display 2
   4'd3 : sseg_temp = 7'b0110000; //to display 3
   4'd4 : sseg_temp = 7'b0011001; //to display 4
   4'd5 : sseg_temp = 7'b0010010; //to display 5
   4'd6 : sseg_temp = 7'b0000010; //to display 6
   4'd7 : sseg_temp = 7'b1111000; //to display 7
   4'd8 : sseg_temp = 7'b0000000; //to display 8
   4'd9 : sseg_temp = 7'b0010000; //to display 9
   4'd10 : sseg_temp = 7'b0001000;
   4'd11 : sseg_temp = 7'b0000000;
   4'd12 : sseg_temp = 7'b0110001;
   4'd13 : sseg_temp = 7'b1000000;
   4'd14 : sseg_temp = 7'b0110000;
   4'd15 : sseg_temp = 7'b0001110;
   
   
   default : sseg_temp = 7'b0111111; //dash
  endcase
 end
assign {g, f, e, d, c, b, a} = sseg_temp; 
assign dp = 1'b1;
 


 




endmodule

