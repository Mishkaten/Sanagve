module decoder38(

	input [2:0]in,
	input en,
	
	output reg[7:0]out
	);
	
always@(*)
	begin
	
		if(!en)
			begin
			out = 0;
			end
			
		else begin
			case(in)
			3'b000: out = 8'b0000_0001;
			3'b001: out = 8'b0000_0010;
			3'b010: out = 8'b0000_0100;
			3'b011: out = 8'b0000_1000;
			3'b100: out = 8'b0001_0000;
			3'b101: out = 8'b0010_0000;
			3'b110: out = 8'b0100_0000;
			3'b111: out = 8'b1000_0000;
			default:out = 8'bxxxx_xxxx;
		
		endcase
	end
end
	
endmodule
	

////////////////////////////


module tb();
reg en;
reg [2:0]in;
wire [7:0]out;

decoder38 decoder38(
	.en(en),
	.in(in),
	.out(out)
);

initial begin
en = 1;
in = 3'b001;
#50;

en = 1;
in = 3'b010;
#50;

en = 1;
in = 3'b001;
#50;

en = 1;
in = 3'b011;
#50;

en = 1;
in = 3'b10;
#50;

en = 1;
in = 3'b101;
#50;

en = 1;
in = 3'b110;
#50;

en = 1;
in = 3'b111;
#50;

en = 0;
in = 6'b001_011;
#50;
end
endmodule
