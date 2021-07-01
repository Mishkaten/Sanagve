module FA (
input A, B, Cin,
output Sum, Cout

);

assign Sum = Cin ^ (A ^ B);
assign Cout = (A&B) | Cin & (A ^ B);


endmodule


///////_TB_//////////
module tb();


reg A, B, Cin;
wire Sum, Cout;

FA FA (
	A, B,Cin,
	Sum, Cout
);


initial begin

A = 0; B = 0; Cin = 0; #50;
A = 0; B = 0; Cin = 1; #50;
A = 0; B = 1; Cin = 0; #50;
A = 0; B = 1; Cin = 1; #50;
A = 1; B = 0; Cin = 0; #50;
A = 1; B = 0; Cin = 1; #50;
A = 1; B = 1; Cin = 0; #50;
A = 1; B = 1; Cin = 1; #50;

end 


endmodule
