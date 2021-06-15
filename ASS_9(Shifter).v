module Shifter (
    input [1:0]funct,
    input [31:0]a,
	 input [4:0]N,  
    output reg[31:0]R
);
   	
always@(*) begin
	
	case(funct)
		
		2'b00: begin 
			R <= a << N; 
				end
		2'b01: begin 
			R <= a >> N; 
				end 
		2'b11:begin
        if (a[31] == 0)
				
				begin
				
				R <= a >> N;
				
				end 
                
            else 
                
				begin 
				
				R <= (~(~ a >> N));
				
				end	
		end

	default: R = 32'd0;
		
	endcase
	
end
endmodule


/////_TB_/////
module testbench();

reg [1:0]funct;
reg [31:0]a;
reg [4:0]N; 

wire [31:0]R;


Shifter UUT8 (.funct(funct), .a(a), .N(N), .R(R));

initial begin

	funct = 2'b00; 
	a = 32'd35; N = 5'b01010; 
	#100;

	
	funct = 2'b01; 
	a = 32'd36; N = 5'b01011; 
	#100;
	
	
	funct = 2'b11; 
	a = 32'd37 ;N = 5'b01100; 
	#100;


end
endmodule 

//////_Baseline_Code_/////


Shifter Shifter(
	.funct(KEY[1:0]),
	.a(SW[4:0]),
	.N(SW[9:5]),
	.R(LEDR[9:0])
	);



