module HA (
input A, B,
output Sum, C

);

assign Sum = A ^ B;
assign C = (A&B);


endmodule
