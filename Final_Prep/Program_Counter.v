module PC(
input E, S, clk, // Enable
input [31:0] Next_PC, data_addr_in, data_in,

output reg [31:0] PC_out,
output reg [31:0]Mout
);



reg [31:0] memory [255:0];

initial begin

	$readmemb ("memory.txt", memory);
end




always @(posedge clk) begin
	
	PC_out[31:0] <= 0;
	
	
	
	if (E == 1) begin //execute
			 Mout[31:0] <= memory[data_addr_in[31:2]][31:0];
			 
			if (S == 1)
				 memory[data_addr_in[31:2]][31:0] = data_in[31:0];
		end
		
		else begin //fetch
			 Mout[31:0] <= memory[Next_PC[31:2]][31:0];
		end
		
	PC_out[31:0] <	= Next_PC[31:0];
	

end


endmodule


////////_TB_////////////
module tb ();

reg E = 0;
reg S = 0;
reg clk = 0; 
reg [31:0] Next_PC, data_addr_in, data_in;

wire [31:0] PC_out;
wire [31:0] Mout;


PC PC (
	E, S,
	Next_PC, data_addr_in, data_in,
	
	PC_out, Mout
);


always begin
	
	clk = #25 ~clk;  
	

end


initial begin

E = 1;
S = 1;
Next_PC =      32'b10101100100001010000000000100010;
data_addr_in = 32'b10000000000000010100110000001110;
data_in =      32'b100111111101010100100000000000001;
#50;


E = 0;
S = 1;
Next_PC =      32'b10101100100001010000000110000010;
data_addr_in = 32'b10000000111110000000000000001110;
data_in =      32'b10000000001111000000000000000001;
#50;


E = 1;
S = 0;
Next_PC =      32'b10101100100001010000011000100010;
data_addr_in = 32'b10000000000011111110000000001110;
data_in =      32'b10111100000000000000000000000001;
#50;

E = 0;
S = 0;
Next_PC =      32'b10101100100001010000010110100010;
data_addr_in = 32'b10000010100000000000010100001110;
data_in =      32'b10000010101010000000000000000001;
#50;





end



endmodule


