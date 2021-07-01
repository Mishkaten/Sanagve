module HA (
input A, B,
output Sum, C

);

assign Sum = A ^ B;
assign C = (A&B);


endmodule



/////////_TB_////////
module TB();


reg A, B;
wire Sum, C;

HA HA (
	A, B,
	Sum, C
);


initial begin

A = 0; B = 0; #50;
A = 0; B = 1; #50;
A = 1; B = 0; #50;
A = 1; B = 1; #50;

end 


endmodule

