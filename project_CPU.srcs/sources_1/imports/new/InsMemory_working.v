`timescale 1ns / 1ps
module insMemory (
(* DONT_TOUCH = "true" *)input [6:0]address,// acess 512*2 byte memory
output  [15:0]InsOut
);

//parameter n=128;

reg [15:0]memory[128-1:0];// this is the Instruction (1K) memory
    
initial begin


//registers 
//001=$to
//010=$t1
//011=$S0
//100=$V0
//101=$a0
//110=$a1
//111=$ra




//i-type 
// opcode rs      rt       6 bit immediate

//        memory[0]<=16'b1010_000_001_000101;// ADDI $t0,$0,5
//        memory[1]<=16'b1010_000_010_000111;//ADDI $t1,$0,7
//        memory[2]<=16'b1010_000_011_001011;//ADDI $S0,$0,0xB
//        memory[3]<=16'b1010_000_100_000110;//ADDI $V0,$0,0x6
//        memory[4]<=16'b1010_000_101_000101;//ADDI $a0,$0,0x15
//        memory[5]<=16'b1010_000_110_001011;//ADDI $a1,$0,0xB
//        memory[6]<=16'b1010_000_111_010101;//ADDI $ra,$0,0x15
//                          //op  rs  rt   rd 000
//        memory[7]<=16'b1100_010_011_000001;
        
//        memory[8]<=16'b1011_010_101_000001;                 
//       //memory[7]<=16'b0011_001_010_101_000; //ADD 
//         //memory[8]<=16'b0100_001_010_101_000;// sub
         
//         //memory[9]<=16'b1011_010_101_000101; //LOAD $ working    
////       memory[7'h09]<=16'b0101_001_010_101_000;//and
        
////         memory[10]<=16'b0110_001_010_101000; //or
////         memory[11]<=16'b1001_001_101_000010;//SRL
////         memory[12]<=16'b1000_001_101_000010;//Sll2
////         memory[13]<=16'b0101_001_010_101_000; //And
////         memory[14]<=16'b0111_001_010_101_000; //And

// Jump address verification 
//memory[0]<=16'b1010_000_001_000101;// ADDI $t0,$0,5
//memory[1]<=16'b1010_000_010_000111;//ADDI $t1,$0,7
//memory[2]<=16'b1010_000_011_001011;//ADDI $S0,$0,0xB
//memory[3]<=16'b0001_0000_0110_0100;// jump to addree 100;



//memory[100]<=16'b1011_010_101_000001; //LOAD 



// branch instruction.equal. working
memory[0]<=16'b1010_000_001_000101;// ADDI $t0,$0,5
memory[1]<=16'b1010_000_010_000100;//ADDI $t1,$0,7
memory[2]<=16'b1010_000_011_001011;//ADDI $S0,$0,0xB
memory[3]<=16'b1110_001_010_001000;// j
memory[4]<=16'b1010_000_101_000101;//ADDI $a0,$0,0x15

memory[12]<=16'b1011_010_101_000001;
memory[13]<=16'b0000_000_000_000000;
 //LOAD 

// not branch is not tested but will be 
// call instruction test.


//memory[0]<=16'b1010_000_001_000101;// ADDI $t0,$0,5
//memory[1]<=16'b1010_000_010_000101;//ADDI $t1,$0,7
//memory[2]<=16'b1010_000_011_001011;//ADDI $S0,$0,0xB
//memory[3]<=16'b0010_0000_0110_0100;// call to addree 100;
//memory[4]<=16'b1010_000_101_000101;




//memory[100]<=16'b1011_010_101_000001;
//memory[101]<=16'b1111_000_000_000000;


end 

		// inst gets out;  
 assign InsOut =memory[address];        
        
 
        
endmodule