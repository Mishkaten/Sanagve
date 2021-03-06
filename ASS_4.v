module decoder ( 
    input a, //inputs
	 input b, //inputs
	 input c, //inputs
	 input d, //inputs
    output [9:0]C //output
);

// Truth table for 3 to 8 decoder

assign 
		// Base case for C0
		C[0]=~A&~B&~C,
      
		// Base case for C1
		C[1]=~A&~B&C,
		
		// Base case for C2
      C[2]=~A&B&~C,
		
		// Base case for C3
      C[3]=~A&B&C,
		
		// Base case for C4
      C[4]=A&~B&~C,
		
		// Base case for C5
      C[5]=A&~B&C,
		
		// Base case for C6
      C[6]=A&B&~C,
		
		// Base case for C7
      C[7]=A&B&C;

endmodule

///////////_TestBench_///////////
module testbench (); // main 
    reg Inp1, Inp2, Inp3; // Reg Initialization
    wire Out; // Wire Initialization
decoder decoder(
    .a(Inp1), .b(Inp2), .c(Inp3),  // initialization procces
    .C(Out) // initialization procces
);
initial begin //All ocurances 
    Inp1 = 1'b0; 
	 Inp2 = 1'b0; 
	 Inp3 = 1'b0;
    #5;
   
    Inp1 = 1'b0; 
	 Inp2 = 1'b0; 
	 Inp3 = 1'b1;
    #5;
   
    Inp1 = 1'b0; 
	 Inp2 = 1'b1; 
	 Inp3 = 1'b0;
    #5;
   
    Inp1 = 1'b0; 
	 Inp2 = 1'b1; 
	 Inp3 = 1'b1;
    #5;
   
    Inp1 = 1'b1; 
	 Inp2 = 1'b0; 
	 Inp3 = 1'b0;
    #5;
   
    Inp1 = 1'b1; 
	 Inp2 = 1'b0; 
	 Inp3 = 1'b1;
    #5;

    Inp1 = 1'b1; 
	 Inp2 = 1'b1; 
	 Inp3 = 1'b0;
    #5;

    Inp1 = 1'b1; 
	 Inp2 = 1'b1; 
	 Inp3 = 1'b1;
    #5;
end
endmodule //end



