module counter(CLK, RES, N, OUTPT); //declaring input and output variables


input CLK, RES; // CLK and RES init
input [7:0]N; // Max of 255
output reg OUTPT = 0; // output init

integer C = 0;


always@ (posedge CLK)
begin
C = C + 1;
if (C == N)begin
	OUTPT = OUTPT + 32'd1;
end
end

endmodule // termination


////////_TB_/////////
module tb(); //main Testbench file



reg CLK = 0; // CLK Init
reg RES = 0; // RES Init
reg [7:0]N;
wire OUTPT; // Output Init

counter counter (CLK, RES, N, OUTPT); //connecting to the main file



always begin
	
	N = 32'd8;
	CLK =#50 ~CLK;
  RES = 0;
	
end
endmodule //termination
