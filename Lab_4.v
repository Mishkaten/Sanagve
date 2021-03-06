module mux(  
			  input [7:0]C,  [1:0]SL,
			  input New_Sl, // 4 inputs & 2 selection lines
			  output [13:0]tempVal,  [2:0]res); // 6 temp valiues for equation and result
				
assign 
// 1st OR gate
 tempVal[0]=C[0]|~SL[0]|~SL[1],
// 2nd OR gate
 tempVal[1]=C[1]|~SL[0]|SL[1],
// 3rd OR gate
 tempVal[2]=C[2]|SL[0]|~SL[1],
// 4th OR gate
 tempVal[3]=C[3]|SL[0]|SL[1],

//1st temporary equation
 tempVal[4]=(tempVal[0])|(tempVal[1]),
//2nd temporary equation
 tempVal[5]=(tempVal[2])|(tempVal[3]),
 
 //Finalizing the result
 res[1]=(tempVal[4])&(tempVal[5]),
 
 //   _________________ 8x1  ________________
 
 
 // 
 tempVal[6]=C[4]|~SL[0]|~SL[1],
// 2nd OR gate
 tempVal[7]=C[5]|~SL[0]|SL[1],
// 3rd OR gate
 tempVal[8]=C[6]|SL[0]|~SL[1],
// 4th OR gate
 tempVal[9]=C[7]|SL[0]|SL[1],
 
 tempVal[10]=(tempVal[6])|(tempVal[7]),
 tempVal[11]=(tempVal[8])|(tempVal[9]),
 
 res[2]=(tempVal[10])&(tempVal[11]),
 
 tempVal[12] = res[1] & New_Sl,
 tempVal[13] = res[2] & New_Sl,
 
 res[3] = tempVal[12]|tempVal[13];
 
 
endmodule

//////_TestBench_//////
module testbench(); //test bench
	
	reg In_line, Sel_Line , New_Sl;//input and selection line
	wire Output ; //  output

mux mux (
	.C(In_line), .SL(Sel_Line), .res(Output), .New_Sl(New_Sl) // linking 
);

initial begin //tring all possible case occurances

	Sel_Line = 1'b0; Sel_Line = 1'b0; In_line=1'b0;
   #25;
	Sel_Line = 1'b0; Sel_Line = 1'b0; In_line=1'b1;
   #25;
	Sel_Line = 1'b0; Sel_Line = 1'b1; In_line=1'b0;
   #25;
	Sel_Line = 1'b0; Sel_Line = 1'b1; In_line=1'b1;
   #25;
	Sel_Line = 1'b1; Sel_Line = 1'b0; In_line=1'b0;
   #25;
	Sel_Line = 1'b1; Sel_Line = 1'b0; In_line=1'b1;
   #25;
	Sel_Line = 1'b1; Sel_Line = 1'b1; In_line=1'b0;
   #25;
	Sel_Line = 1'b1; Sel_Line = 1'b1; In_line=1'b1;
   #25;
	Sel_Line = 1'b0; Sel_Line = 1'b0; In_line=1'b0;
   #25;
	Sel_Line = 1'b0; Sel_Line = 1'b0; In_line=1'b1;
   #25;
	Sel_Line = 1'b0; Sel_Line = 1'b1; In_line=1'b0;
   #25;
	Sel_Line = 1'b0; Sel_Line = 1'b1; In_line=1'b1;
   #25;
	Sel_Line = 1'b1; Sel_Line = 1'b0; In_line=1'b0;
   #25;
	Sel_Line = 1'b1; Sel_Line = 1'b0; In_line=1'b1;
   #25;
	Sel_Line = 1'b1; Sel_Line = 1'b1; In_line=1'b0;
   #25;
	Sel_Line = 1'b1; Sel_Line = 1'b1; In_line=1'b1;
   #25;
	
	New_Sl = 1'b0;
	#25;
	New_Sl = 1'b1;
	#25;
  
  end
	
endmodule
	
