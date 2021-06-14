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
        output wire [1:0] GP_MUX_SEL, // Chooses from ALU, MEMORY, SHIFTER, PC
        
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
    wire [4:0]RS, RT, RD, SA; 
    wire [5:0]Fun;
    wire [15:0]Imm;
    wire [25:0]Iindex;
    wire [5:0]OPC;
    

    assign OPC[5:0] = Instruction[31:26];
    assign RS[4:0] = Instruction[25:21];
    assign RT[4:0] = Instruction[20:16];
    assign RD[4:0] = Instruction[15:11];
    assign SA[4:0] = Instruction[10:6];
    assign Fun[5:0] = Instruction[5:0];
    assign Imm[15:0] = Instruction[15:0];
    assign Iindex[25:0] = Instruction[25:0];
    
    //instruction type
    wire R_type, J_type, I_type;
    
    assign R_type = OPC[5:0] == 6'b0_0_0000 || OPC[5:0] == 6'b0_1_0000;
    assign J_type = OPC[5:0] == 6'b0000_1_0 || OPC[5:0] == 6'b0000_1_1;
    assign I_type = ~(R_type || J_type);

    
    
    ////ALU

    assign I = I_type;
    
    assign Af[3:0] = OPC[3:0];
    
    assign ALU_MUX_SEL = R_type;
    

    
    
    ///GPR

    assign Cad[4:0] = I ? RT[4:0] : RD[4:0];
    assign GP_WE = ~J_type;
    
    
    function [1:0] calculate_mux;
    
        input [5:0] opc;
        //ALU
        if (opc[5:3] == 3'b001)
                calculate_mux = 2'b00;
                
        if (Fun[5:3] == 3'b100)
                calculate_mux = 2'b00;

                
        //Shifter
        else if (Fun [5:0] == 6'b000_010)
                calculate_mux = 2'b10;
                
        
        //PC _ MEMORY
        else if (opc[5:0] == 6'b100_011)
                calculate_mux = 2'b01;
                
        else if (opc[5:0] == 6'b000_001)
                calculate_mux = 2'b01;
                  
        else if (opc[5:2] == 4'b0_001)
                calculate_mux = 2'b01;
        
        else if (Fun[5:3] == 3'b001)
                calculate_mux = 2'b01;
                
                
        //GPR
        else if (opc[5:4] == 2'b01)
                calculate_mux = 2'b11;
        
        

        else  calculate_mux = 2'b00;
        
        
        endfunction
    
    
    assign GP_MUX_SEL[1:0] = calculate_mux(OPC[5:0]);
    
    
    
    ///BCE
    
    assign Bf[3:0] = I_type ? OPC[3:0] : 3'bxxx;
	 
	 //PC _ MEMORY
	 
	 assign DM_WE = Bf[3:0];
	
	 
	 
	 //Shifter
	 
	 assign Shift_Type[2:0] = R_type ? Fun[5:0] : 6'bxxx_xxx;
	 
	 
	 //PC
	 
	 function [1:0] pc_mux;
    
        input [5:0] opc_3;
		  
		  // J
		  if (opc_3[5:0] == 6'b000_010)
				pc_mux = 2'b00;
			
		  // Jal
		  else if (opc_3[5:0] == 6'b000_011)
				pc_mux = 2'b01;
				
		  // Jr
		  else if (Fun[5:0] == 6'b001_000)
				pc_mux = 2'b10;
				
		  // Jalr
		  else if (Fun[5:0] == 6'b001_001)
				pc_mux = 2'b11;
	 endfunction
	 
	 assign PC_MUX_Select[1:0] = pc_mux(OPC[5:0]);
	 

endmodule


//////////////_TB_//////////////

module tb();

reg [31:0]instruction;
wire [3:0] Af, Bf;
wire I, ALU_MUX_SEL, GP_WE, DM_WE;
wire [1:0] GP_MUX_SEL, PC_MUX_Select;
wire [2:0]Shift_Type;

I_Decoder UUT8( .Instruction(instruction), .Af(Af), .Bf(Bf), .I(I), 

                .ALU_MUX_SEL(ALU_MUX_SEL), .GP_WE(GP_WE), .DM_WE(DM_WE), 

                .GP_MUX_SEL(GP_MUX_SEL), .PC_MUX_Select(PC_MUX_Select), 

                .Shift_Type(Shift_Type)
    );

        
initial begin
/////////////////// TEST ITYPE INSTRUCTIONS
instruction = 32'b10001100100001010000000000000100; // LW
#10;
instruction = 32'b10101100100001010000000000000100; // SW
#10;
instruction = 32'b00100000100001010000000000000100; // ADDI
#10;
instruction = 32'b00100100100001010000000000000100; // ADDIU
#10;
instruction = 32'b00101000100001010000000000000100; // SUBI
#10;
instruction = 32'b00101100100001010000000000000100; // SUBIU
#10;
instruction = 32'b00110000100001010000000000000100; // ANDI
#10;
instruction = 32'b00110100100001010000000000000100; // ORI
#10;
instruction = 32'b00111000100001010000000000000100; // XORI
#10;
instruction = 32'b00111100100001010000000000000100; // LUI
#10;
//////BRANCH
instruction = 32'b00000100100000000000000000000100; // bltz
#10;
instruction = 32'b00000100100000010000000000000100; // bGEz
#10;
instruction = 32'b00010000100000010000000000000100; // beq
#10;
instruction = 32'b00010100100000010000000000000100; // bne
#10;
instruction = 32'b00011000100000000000000000000100; // blez
#10;
instruction = 32'b00011100100000000000000000000100; // bgtz
#10;
////////////////// TEST RTYPE
instruction = 32'b00000000100001010010000001000000; // SLL#10;
instruction = 32'b00000000100001010010000001000010; // SRL
#10;
instruction = 32'b00000000100001010010000001000011; // SRA
#10;
instruction = 32'b00000000100001010010000000000100; // SLLV
#10;
instruction = 32'b00000000100001010010000000000110; // SRLV
#10;
instruction = 32'b00000000100001010010000000000111; // SRAV
#10;
instruction = 32'b00000000100001010010000000100000; // ADD
#10;
instruction = 32'b00000000100001010010000000100001; // ADDU
#10;
instruction = 32'b00000000100001010010000000100010; // SUB
#10;
instruction = 32'b00000000100001010010000000100011; // SUBU
#10;
instruction = 32'b00000000100001010010000000100100; // AND
#10;
instruction = 32'b00000000100001010010000000100101; // OR
#10;
instruction = 32'b00000000100001010010000000100110; // XOR
#10;
instruction = 32'b00000000100001010010000000100111; // NOR
#10;
instruction = 32'b00000000100001010010000000101010; // SLT
#10;
instruction = 32'b00000000100001010010000000101011; // SLTU
#10;
instruction = 32'b00000000100001010010000000001000; // JR
#10;
instruction = 32'b00000000100001010010000000001001; // JALR
#10; 
/////////////// JTYPE
instruction = 32'b00001000000000000000000000001001; // J
#10;
instruction = 32'b00001100000000000000000000001001; // JAL
#10;
end

endmodule
