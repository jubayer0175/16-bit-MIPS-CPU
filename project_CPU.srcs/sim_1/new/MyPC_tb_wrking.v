`timescale 1ns / 1ps


module MyPC_tb();
reg [2:0]inr;
reg clk;
reg rst;
wire [15:0] outValue;

MyPC PC0(inr,clk,rst,outValue);

// clock

initial #0 clk<=0;
always #10 clk<=~clk;

initial begin 
#0 rst<=0;
#5 rst<=1;
end



initial #0 inr<=0;
initial begin
#20 inr <=1;
#20 inr <=2;
#20 inr <=3;
#20 inr <=4;
#20 inr <=5;

#20 inr <=5;

end

integer f;

initial f=$fopen("output.txt","w");
initial #380 $fclose(f);
always #20 $fwrite(f,"Register:%h   Value: %h\n",inr, outValue);






























endmodule
