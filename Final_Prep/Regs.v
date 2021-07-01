module Main_Memory (
input clk, Reset, S, //store
input [31:0] Next_PC, data_addr_in, data_in,

output reg[31:0] PC_out,//currently executed instruction address
 Iout, //currently executed instruction 
 Mout, //if E - data_out, if ~E - next instruction
output reg E//E - execution, ~E - fetch
);

reg [31:0] memory [255:0];

initial begin
	$readmemb ("values.txt", memory);
end

always @(posedge clk) begin
	if(Reset) begin
		PC_out[31:0] <= 0;
		E <= 0;
	end
	else begin
		
		if (E) begin //execute
			Mout[31:0] <= memory[data_addr_in[31:2]][31:0];
	 		if (S)
				memory[data_addr_in[31:2]][31:0] <= data_in[31:0];
		end
		
		else begin //fetch
			Mout[31:0] <= memory[Next_PC[31:2]][31:0];
		end
	
	Iout[31:0] <= memory[PC_out[31:2]][31:0];
	E <= ~E;
	PC_out[31:0] <= Next_PC[31:0];
	end

	
	
end

endmodule

//////////_TB_///////////////
module tb ();

reg clk = 0;
reg Reset, S; //store
reg [31:0] Next_PC, data_addr_in, data_in;

wire[31:0] PC_out;//currently executed instruction address
wire Iout; //currently executed instruction 
wire Mout; //if E - data_out, if ~E - next instruction
wire E;//E - execution, ~E - fetch

Main_Memory  genady(
	clk,
	Reset,
	S,
	
	Next_PC, 
	data_addr_in, 
	data_in,
	PC_out,
	Iout,
	Mout,
	E
	);
	
always begin
	
	clk = #50 ~clk;
	
end

initial begin
S = 1;
Next_PC = 32'b01000111_11110011_01111001_10000111;
data_addr_in = 32'b01000101_10010100_11001000_00011000;
data_in = 32'b01001101_00101010_01101000_10011001;
#100;

S = 1;
Next_PC = 32'b01011000_11111110_01111001_10000011;
data_addr_in = 32'b01000101_10010100_11001000_00010000;
data_in = 32'b01001001_00101010_00101000_10010001;
#100;


end

    
endmodule
