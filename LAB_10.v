module I_Decoder (
		//General Input
		input [31:0] Instruction,
		
		//ALU OUT
		output [3:0] Af, // determines what alu should be performed
		output I, // checks if 2nd operand is immidiate
		output ALU_MUX_SEL, // Chooses from IMMIDIATE and GPR
		
		//GPR OUT
		output [4:0]Cad, // determines address for result to be stored
		output GP_WE, // GPR Write Enable
		output [1:0] GP_MUX_SEL, // Chooses from ALU, MEMORY, SHIFTER, PC
		
		//BCE OUT
		output [3:0]Bf, //determines the test condition name
		
		//MEMORY OUT
		output DM_WE, //MEMORY Write Enable
		
		//SHIFTER OUT
		output [2:0]Shift_Type, // specifies the type of shift
		
		//PC OUT
		output [1:0]PC_MUX_Select // Chooses from Jr(jump reg) , Jalr(jump and link reg), J(Jump) and  Jal(jump and link)
		
	);
	
	//instruction fields
	wire [4:0]RS, RT, RD, SA, Fun; 
	wire [15:0]Imm;
	wire [25:0]Iindex;
	wire [5:0]OPC;
	
	assign OPC[5:0] = Instruction[31:26];
//	assign RS[4:0] = Instruction[25:21];
	assign RT[4:0] = Instruction[20:16];
	assign RD[4:0] = Instruction[15:11];
//	assign SA[4:0] = Instruction[10:6];
//	assign Fun[4:0] = Instruction[5:0];
//	assign Imm[15:0] = Instruction[15:0];
//	assign Iindex[25:0] = Instruction[25:0];
	
	//////////////////////////////
	
	//instruction type
	wire R_type, J_type, I_type;
	
	assign R_type = OPC[5:0] == 6'b0_0_0000 || OPC[5:0] == 6'b0_1_0000;
	assign J_type = OPC[5:0] == 6'b0000_1_0 || OPC[5:0] == 6'b0000_1_1;
	assign I_type = ~(R_type || J_type);
	
	/////////////////
	
	
	
	////ALU
	/////////////////////////
	assign I = I_type;
	
	assign Af[3:0] = OPC[3:0];
	
	assign ALU_MUX_SEL = R_type;
	
	
	/////////////////////////
	
	
	///GPR
	/////////////////////////
	assign Cad[4:0] = I ? RT[4:0] : RD[4:0];
	assign GP_WE = ~J_type;
	
	
	/////////////////////////
	
	
	///BCE
	
	
	/////////////////////////
	

endmodule
