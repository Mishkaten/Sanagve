module Bce(
    input [31:0]a,
    input [31:0]b,
    input [3:0]bf, 
    output reg [1:0]bcres
);

always @(*) 
begin
    
    case (bf)
        
		  4'b0010: 
		  begin 
		  if (a < 0) bcres <= 1;
        else bcres <= 0; end
        
        4'b0011: 
		  begin 
		  if (a >= 0) bcres <=1;
        else bcres <= 0; end

        4'b1000: 
		  begin 
		  if (a == b) bcres <=1;    
        else bcres <= 0; end

        4'b1001: 
		  begin 
		  if (a == b) bcres <=1;  
        else bcres <= 0; end

        4'b1010: 
		  begin 
		  if (a != b) bcres <=1;
        else bcres <= 0; end

        4'b1011: 
		  begin 
		  if (a != b) bcres <=1; 
        else bcres <= 0; end

        4'b1100: 
		  begin 
		  if (a <= b) bcres <=1;   
        else bcres <= 0; end

        4'b1101: 
		  begin 
		  if (a <= b) bcres <=1;    
        else bcres <= 0; end

        4'b1110: 
		  begin 
		  if (a > b) bcres <=1;
        else bcres <= 0; end

        4'b1111: 
		  begin 
		  if (a > b) bcres <=1; 
        else bcres <= 0; end

        default: 
        bcres <= 0;
		  
    endcase
end
endmodule

//////_TestBench_//////

module testbench ();

reg [31:0]a;
reg [31:0]b;
reg [3:0]bf;

wire [1:0]bcres;

Bce Bce (.a(a), .b(b), .bf(bf), .bcres(bcres));

initial begin
    
    bf = 4'b0010; 
	 a = 32'd1; b = 32'd2; 
	 #50;

    bf = 4'b0011; 
	 a = 32'd1; b = 32'd2; 
	 #50;

    bf = 4'b1000; 
	 a = 32'd1; b = 32'd2; 
	 #50;

    bf = 4'b1001; 
	 a = 32'd1; b = 32'd2; 
	 #50;
    
    bf = 4'b1010; 
	 a = 32'd1; b = 32'd2; 
	 #50;

    bf = 4'b1011; 
	 a = 32'd1; b = 32'd2; 
	 #50;

    bf = 4'b1100; 
	 a = 32'd1; b = 32'd2; 
	 #50;

    bf = 4'b1101; 
	 a = 32'd1; b = 32'd2; 
	 #50;

    bf = 4'b1110; 
	 a = 32'd1; b = 32'd2; 
	 #50;

    bf = 4'b1111; 
	 a = 32'd1; b = 32'd2; 
	 #50;
    
end
endmodule

//////_BaseLine Code_//////
Bce Bce (
			.a(SW[4:0]),
			.b(SW[9:5]),
			.bf(KEY[3:0]),
			.bcres(LEDR[1:0])
			
			);
