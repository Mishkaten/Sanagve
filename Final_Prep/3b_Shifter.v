module shifter (
    input s, 
    input [2:0]inp,
    output [2:0]out
);
assign out[0] = (~s) & inp[0];
assign out[1] = (~s) & inp[1] | (s) & inp[0];
assign out[2] = (~s) & inp[2] | (s) & inp[1];

    
endmodule


/////////////_TB_///////////
module Tb ();

reg s=0;
reg [2:0]inp;
wire [2:0]out;

shifter shifter(
    .s(s),
    .inp(inp),
    .out(out)
);

initial begin
	 s = 1;
    inp= 3'b000; #30;
    inp= 3'b001; #30;
    inp= 3'b010; #30;
    inp= 3'b011; #30;
    inp= 3'b100; #30;
    inp= 3'b101; #30;
    inp= 3'b110; #30;
    inp= 3'b111; #30;

end
endmodule
