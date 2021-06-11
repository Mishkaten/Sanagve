module flipflop ( D, Clk, Q  ); 

input [2:0]D; 
input Clk; 
output reg [2:0]Q; 

always @(posedge (Clk)) // while true loop
		begin 
		Q = #30 D;  
		           
end 

endmodule 


//////////////_TestBench_//////////
module testbench (); 

reg [2:0]D; //input
reg Clk = 0; //clock
wire [2:0]Q; // output

flipflop UUT8 (D, Clk, Q); // Init

always  begin // loop for posedge 
    clk = ~clk; 
    #15; 
end

initial begin // Test 
    
	 D = 3'b011; #30; 
	 
	 D = 3'b010; #30;
	 
	 D = 3'b001; #30;

    
end // endgame

endmodule 

