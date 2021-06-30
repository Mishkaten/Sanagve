module decoder410(

	input [3:0]in,
	input en,
	
	output reg[9:0]out
	);
	
always@(*)
	begin
	
		if(!en)
			begin
			out = 0;
			end
			
		else begin
			case(in)
			
			4'b0000: out = 10'b00000_00001;
			4'b0001: out = 10'b00000_00010;
			4'b0010: out = 10'b00000_00100;
			4'b0011: out = 10'b00000_01000;
			4'b0100: out = 10'b00000_10000;
			
			4'b0101: out = 10'b00001_00000;
			4'b0110: out = 10'b00010_00000;
			4'b0111: out = 10'b00100_00000;
			4'b1000: out = 10'b01000_00000;
			4'b1001: out = 10'b10000_00000;
			
			default:out = 10'bxxxxx_xxxxx;
		
		endcase
	end
end
	
endmodule
	
///////////////_TB_////////////////
module tb();
reg en = 1;
reg [3:0]in;wire [9:0]out;

decoder410 decoder410(
	.en(en),
	.in(in),
	.out(out)
);

initial begin

in = 4'b0000; #50;
in = 4'b0001; #50;
in = 4'b0010; #50;
in = 4'b0011; #50;
in = 4'b0100; #50;

in = 4'b0101; #50;
in = 4'b0110; #50;
in = 4'b0111; #50;
in = 4'b1000; #50;
in = 4'b1001; #50;

en = 0;
in = 6'b001_011;
#50;
end
endmodule
