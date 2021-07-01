module shifter (
    input s, 
    input [1:0]inp,
    output [1:0]out
);
assign out[0] = (~s) & inp[0];
assign out[1] = (~s) & inp[1] | (s) & inp[0];

    
endmodule

//////_TB_//////////
module Tb ();

reg s = 0;
reg [1:0]inp;
wire [1:0]out;

shifter shifter(
    .s(s),
    .inp(inp),
    .out(out)
);

initial begin
	 s = 1;
    inp= 2'b00; #30;
    inp= 2'b01; #30;
    inp= 2'b10; #30;
    inp= 2'b11; #30;
	 
	 s = 0;
	 inp= 2'b11; #30;
	 

end
endmodule
