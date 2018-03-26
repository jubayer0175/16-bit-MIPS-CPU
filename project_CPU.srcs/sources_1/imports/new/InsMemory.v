`timescale 1ns / 1ps
module insMemory (
(* DONT_TOUCH = "true" *)input [6:0]address,// acess 512*2 byte memory
output  [15:0]InsOut
);


reg [15:0]memory[128-1:0];// this is the Instruction (1K) memory
    
initial begin



        memory[0]<=16'b1010_000_001_000101;// ADDI $t0,$0,5
        memory[1]<=16'b1010_000_010_000111;//ADDI $t1,$0,7
        memory[2]<=16'b1010_000_011_001011;//ADDI $S0,$0,0xB
        memory[3]<=16'b1010_000_100_000110;//ADDI $V0,$0,0x6
        memory[4]<=16'b1010_000_101_000101;//ADDI $a0,$0,0x15
        memory[5]<=16'b1010_000_110_001011;//ADDI $a1,$0,0xB
        memory[6]<=16'b1010_000_111_010101;//ADDI $ra,$0,0x15
                          //op  rs  rt   rd 000
        memory[7]<=16'b0011_001_010_101_000; //ADD 
        memory[8]<=16'b0100_001_010_101_000;// sub
        memory[9]<=16'b0101_001_010_101_000;//and
        memory[10]<=16'b0110_001_010_101_000; //or
        memory[11]<=16'b1001_001_101_000010;//SRL
        memory[12]<=16'b1000_001_101_000010;//Sll2
        memory[13]<=16'b0111_001_011_101_000;//SLT
        memory[14]<=16'b1110_001_010_001011;//brach if not equal PC+1=F+B=1A=26
        memory[15]<=16'b1010_000_101_000101;//ADDI $a0,$0,0x15// not executer JNE taken
        
        
        memory[26]<=16'b1010_000_101_000100;//ADDI $a0,$0,0x15//$5=4 means itshould branch takne
        memory[27]<=16'b1100_010_011_000001;// store no effect on output
        memory[28]<=16'b1011_010_101_000001;// load loada $r3=0X0B
        
        
/*$2=7, therefore address is 8. The data from $3=0x000B is stored in the location 8. This data is again loaded to $5 for verification.*/
        
        memory[29]<=16'b0001_0000_0110_0100;// jump to address 100;
        
        
        memory[100]<=16'b1010_000_101_011111;// test jump ox64=100
        memory[101]<=16'b0010_0000_00110010;// call a subroutine at 50
        memory[102]<=16'b1010_000_101_010011;// Loads after returning     [procedure returns]
        
        //memory[103]<=16'b1010_000_001_00000;;
        memory[103]<=16'b1010_000_010_000101;  //$2=5
        
        memory[104]<=16'b1101_001_010_000100;//104+4+1=109  $2=5 and $1=5 so take branch to ox6D
        
        memory[109]<=16'b1010_000_101_000010;// moves 5                 [$5 last modified=2]
        memory[110]<=16'b0000000000000000;//ADDI $a0,$0,0x15
        
        memory[50]<=16'b1010_000_101_010010;//$5=50 
        memory[51]<=16'b1010_000_100_001010;//set $4=1010=10 //check       [$4 last modification =A]
        memory[52]<=16'b0011_100_000_101_000; //retuns from the subroutine it should go to 102 =OX66
        memory[53]<=16'b1111_000_000_000000;//return to 102 


end 

		// inst gets out;  
 assign InsOut =memory[address];        
        
 
        
endmodule