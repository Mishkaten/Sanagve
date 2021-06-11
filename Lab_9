module Regs(
    input Clock,Reset,S,    
    input [31:0]Next_PC,input [31:0]Data_Adr_IN,input [31:0]Data_IN,
    
    output reg [31:0]PC_out,
    output reg [31:0]I_Out,
    output reg [31:0]Mout,
    output reg E,
    output reg [31:2]pc
 );
 
reg S_new;
reg [31:0] Memory [0:31]; // register array creation

initial begin
        $readmemb("Mem.txt", Memory); //reading from the file
end

always@ (posedge Clock) 
begin
S_new = S;


//Reset
if (Reset == 1'b1) 
begin 
PC_out <= 32'd0; 
E <= 32'd0; 
end 


//Store Signal
if (S == 1'b1) 
begin 
    if (Data_Adr_IN == 32'bx); 
    begin 
        S_new = 1'b1; 
    end 
    if (Data_IN == 32'bx);
    begin 
        S_new = 1'b1; 
    end 
end


// I Reg
if (E == 0)
begin
I_Out <= Data_Adr_IN & Data_IN;
end


//PC Out

PC_out[31:2] <= Memory[Data_Adr_IN]; 



//Fetch Mem
Mout = Next_PC;

// E Reg
if (E == 1)
    begin  
    pc <= PC_out;
    end else if (E == 0)
    begin
    pc <= Mout; 
end


end

endmodule



//////_TestBench_//////
module tb();

reg Clock = 0;
reg Reset;
reg S;
	
reg [31:0]Next_PC;
reg [31:0]Data_Adr_IN;
reg [31:0]Data_IN;
	
wire [31:0]PC_out;
wire [31:0]I_Out;
wire [31:0]Mout;
wire E;
wire [31:2]pc;

Regs Regs (.Clock (Clock), 
.Reset (Reset), 
.S(S), 
.Next_PC(Next_PC), 
.Data_Adr_IN(Data_Adr_IN),
.Data_IN(Data_IN),
				.PC_out(PC_out), 
				.I_Out(I_Out), 
				.Mout(Mout), 
				.E(E));


always@(*)
begin Clock = #50 ~Clock; end

initial begin
Next_PC <= 32'd102; 
Data_Adr_IN = 32'd122; 
Data_IN = 32'd2322; 
#60;

Next_PC <= 32'd13215; 
Data_Adr_IN = 32'd14136; 
Data_IN = 32'd15336;
 #60;

Next_PC <= 32'd16647;
 Data_Adr_IN = 32'd16438; 
 Data_IN = 32'd1549; 
 #60;

end
endmodule

//////_BaseLine Code_//////

Regs Regs (
			.Reset(SW[9]), 
			.Clock(SW[8]), 
			.S(SW[7]),
			.Next_PC(SW[3:0]),
			.Data_Adr_IN(SW[6:4]),
			.Data_IN(KEY[3:0]),
			.PC_out(LEDG[1:0]),
			.I_Out(LEDG[3:2]),
			.Mout (LEDG[5:4]),
			.E(LEDG[7:6]),
			.pc(LEDR[3:0]) 
			
			);
