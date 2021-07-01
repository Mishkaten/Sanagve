module IEU 
(
	input U, //input is unsigned or not
	input [17:0] immediateIN,
	
	output [31:0] immediateOUT
);

//last N bits stays the same as input
assign immediateOUT[17:0] = immediateIN[17:0]; 

//first M-N bits of output are filled with 0 if unsigned, input sign bit if signed
assign immediateOUT[31:18] = U ?  {(14){1'b0}} : {(14){immediateIN[17]}};

endmodule


////////_TB_///////////
module tb ();

reg [17:0]immediateIN;
reg U;
wire [31:0]immediateOUT;

IEU IEU (
	immediateIN, U, immediateOUT, 
	);
	
initial begin

immediateIN = 18'b00000_10000_10000_100;
//U = 1;
#50;

end
    
endmodule
