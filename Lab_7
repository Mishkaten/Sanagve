module gpr ( input clk, 
            input write_enable,
            input [4:0] AddrA,
            input [4:0] AddrB,
            input [4:0] AddrC, 
            output [31:0] A_out,        
            output [31:0] B_out,    
            input [31:0] C_in 
); 
// input and output initialization

reg [31:0] gpr [0:31]; // register array creation

initial begin
        $readmemb("values.txt", gpr); //reading from the file
end


always @(posedge clk) // posedge for clock value
begin
   gpr[5'b00000] <= 0; // $0 becomes 0 always 
   if(write_enable && AddrC != 0) 
        begin
            gpr[AddrC] <= C_in; 
        end
end

assign A_out = gpr[AddrA]; 
assign B_out = gpr[AddrB];

endmodule

//////_TestBench_//////

module testbench();

reg clk = 0;
reg write_enable;
reg [4:0]AddrA;
reg [4:0]AddrB;
reg [4:0]AddrC;
reg [31:0] C_in;
wire [31:0]A_out;
wire [31:0]B_out;

gpr gpr (.clk(clk), .AddrA(AddrA), .AddrB(AddrB), 
			.AddrC(AddrC), .C_in(C_in), .A_out(A_out), .B_out(B_out));

always begin 
#5;    clk = ~clk;
    
end
     
initial begin     
     AddrA = 5'b00000;
     AddrB = 5'b00010;
     AddrC = 5'b00010;
     C_in = 32'b00010011001001000000100000000001;

     #10;
     
     AddrA = 5'b01001;
     AddrB = 5'b00010;
     AddrC = 5'b01001;
     C_in = 32'b00010011001001000000100000000001;
     #10;
     
end
     
endmodule

//////_BaseLine Code_//////

gpr gpr ( 
			.write_enable(KEY[0]),
			 
			.AddrA(SW[3:0]), 
			.AddrB(SW[6:4]), 
			.AddrC(SW[9:6]),
			
			.C_in(KEY[1]),
	

			.A_out(LEDR[3:0]), 
			.B_out(LEDG[3:0])	
			
			);



