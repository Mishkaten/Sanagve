module Alu (
    input [31:0]SrcA,
    input [31:0]SrcB,
    input [3:0]Af,

    output reg [31:0]Alures,
    output reg Zero,
	 output reg Neg,
	 output reg Overflow
);

always@(*) 
begin
case(Af) 
		
        4'b0000: // Add
            begin
				Alures <= SrcA + SrcB; 
            
            //Zero Flag 
            if (Alures == 32'd0) 
				begin
				Zero <= 1;
				end
					 
            //Neg Flag 
            if ((Alures == 32'd0) & (SrcB[31:16] == SrcB[15]))
				begin
					 Neg <= 1;
				end
				
            //Overflow Flag
            if ((Alures > 32'd1) & (SrcB[31:16] == SrcB[15]))
				begin
                Overflow <= 1;
				end	 
			end
			
        4'b0001: begin// Addu
           
            Alures = SrcA + (-SrcB); 
            
           //Zero Flag 
            if (Alures == 32'd0) 
				begin
				Zero <= 1;
				end
					 
            //Neg Flag 
            if ((Alures == 32'd0) & (SrcB[31:16] == SrcB[15]))
				begin
					 Neg <= 1;
				end
				
            //Overflow Flag
            if ((Alures > 32'd1) & (SrcB[31:16] == SrcB[15]))
				begin
                Overflow <= 1;
				end	 
				end

        4'b0010: begin // Sub
            Alures = SrcA - SrcB;
           
           //Zero Flag 
            if (Alures == 32'd0) 
				begin
				Zero <= 1;
				end
					 
            //Neg Flag 
            if ((Alures == 32'd0) & (SrcB[31:16] == SrcB[15]))
				begin
					 Neg <= 1;
				end
				
            //Overflow Flag
            if ((Alures > 32'd1) & (SrcB[31:16] == SrcB[15]))
				begin
                Overflow <= 1;
				end	 
				end

        4'b0011: begin// Sub u
            Alures = SrcA - (-SrcB);
           
            //Zero Flag 
            if (Alures == 32'd0) 
				begin
				Zero <= 1;
				end
					 
            //Neg Flag 
            if ((Alures == 32'd0) & (SrcB[31:16] == SrcB[15]))
				begin
					 Neg <= 1;
				end
				
            //Overflow Flag
            if ((Alures > 32'd1) & (SrcB[31:16] == SrcB[15]))
				begin
                Overflow <= 1;
				end	 
				end

        4'b1010:begin // Set less then  (Slt) 
            Alures = (SrcA < SrcB) ? 32'd1 : 32'd0;

            //Zero Flag 
            if (Alures == 32'd0) 
				begin
				Zero <= 1;
				end
					 
            //Neg Flag 
            if ((Alures == 32'd0) & (SrcB[31:16] == SrcB[15]))
				begin
					 Neg <= 1;
				end
				
            //Overflow Flag
            if ((Alures > 32'd1) & (SrcB[31:16] == SrcB[15]))
				begin
                Overflow <= 1;
				end	 
				end

        4'b1011:begin // Set less then  U (Sltu)
            Alures = (SrcA < (-SrcB)) ? 32'd1 : 32'd0;

            //Zero Flag 
            if (Alures == 32'd0) 
				begin
				Zero <= 1;
				end
					 
            //Neg Flag 
            if ((Alures == 32'd0) & (SrcB[31:16] == SrcB[15]))
				begin
					 Neg <= 1;
				end
				
            //Overflow Flag
            if ((Alures > 32'd1) & (SrcB[31:16] == SrcB[15]))
				begin
                Overflow <= 1;
				end	 
				end


        4'b0100: begin// And Gate
           Alures = SrcA & SrcB;

           //Zero Flag 
            if (Alures == 32'd0) 
				begin
				Zero <= 1;
				end
					 
            //Neg Flag 
            if ((Alures == 32'd0) & (SrcB[31:16] == SrcB[15]))
				begin
					 Neg <= 1;
				end
				
            //Overflow Flag
            if ((Alures > 32'd1) & (SrcB[31:16] == SrcB[15]))
				begin
                Overflow <= 1;
				end	 
				end



        4'b0101: begin// Or Gate
            Alures = SrcA | SrcB;

            //Zero Flag 
            if (Alures == 32'd0) 
				begin
				Zero <= 1;
				end
					 
            //Neg Flag 
            if ((Alures == 32'd0) & (SrcB[31:16] == SrcB[15]))
				begin
					 Neg <= 1;
				end
				
            //Overflow Flag
            if ((Alures > 32'd1) & (SrcB[31:16] == SrcB[15]))
				begin
                Overflow <= 1;
				end	 
				end




         4'b0110: begin// Xor Gate
            Alures = SrcA ^ SrcB;

            //Zero Flag 
            if (Alures == 32'd0) 
				begin
				Zero <= 1;
				end
					 
            //Neg Flag 
            if ((Alures == 32'd0) & (SrcB[31:16] == SrcB[15]))
				begin
					 Neg <= 1;
				end
				
            //Overflow Flag
            if ((Alures > 32'd1) & (SrcB[31:16] == SrcB[15]))
				begin
                Overflow <= 1;
				end	 
				end

        
         4'b0111:begin // Nor Gate
           Alures = ~(SrcA | SrcB);

            //Zero Flag 
            if (Alures == 32'd0) 
				begin
				Zero <= 1;
				end
					 
            //Neg Flag 
            if ((Alures == 32'd0) & (SrcB[31:16] == SrcB[15]))
				begin
					 Neg <= 1;
				end
				
            //Overflow Flag
            if ((Alures > 32'd1) & (SrcB[31:16] == SrcB[15]))
				begin
                Overflow <= 1;
				end	 
				end


         4'b1111:begin // Lui 
           SrcB << 16;
           SrcB [31:16] <= 0;
           Alures = SrcB;

           //Zero Flag 
            if (Alures == 32'd0) 
				begin
				Zero <= 1;
				end
					 
            //Neg Flag 
            if ((Alures == 32'd0) & (SrcB[31:16] == SrcB[15]))
				begin
					 Neg <= 1;
				end
				
            //Overflow Flag
            if ((Alures > 32'd1) & (SrcB[31:16] == SrcB[15]))
				begin
                Overflow <= 1;
				end	 
				end

	default: Alures = 0; 

endcase
end
endmodule

//////_TestBench_//////

module testbench();
    
reg [31:0]SrcA;
reg [31:0]SrcB;
reg [3:0]Af;

wire [31:0]Alures;
wire Zero, Neg, Overflow;

Alu Alu (.SrcA(SrcA), .SrcB(SrcB), .Af(Af), .Alures(Alures), .Zero(Zero), .Neg(Neg), .Overflow(Overflow));


initial begin
    //Add
    Af = 4'b0000; 
    SrcA = 32'b1110000000000000000000010101010;
    SrcB = 32'b0000000000000000000000010101010;
    #50;

    //Addu
    Af = 4'b0001; 
    SrcA = 32'b1110000000000000000000010101010;
    SrcB = 32'b0000000000000000000000010101010;
    #50;

    //Sub
    Af = 4'b0010; 
    SrcA = 32'b1110000000000000000000010101010;
    SrcB = 32'b0000000000000000000000010101010;
    #50;

    //Subu
    Af = 4'b0011; 
    SrcA = 32'b1110000000000000000000010101010;
    SrcB = 32'b0000000000000000000000010101010;
    #50;

    //Slt
    Af = 4'b1010; 
    SrcA = 32'b1110000000000000000000010101010;
    SrcB = 32'b0000000000000000000000010101010;
    #50;

    //Sltu
    Af = 4'b1011; 
    SrcA = 32'b1110000000000000000000010101010;
    SrcB = 32'b0000000000000000000000010101010;
    #50;

    //And Gate
    Af = 4'b0100; 
    SrcA = 32'b1110000000000000000000010101010;
    SrcB = 32'b0000000000000000000000010101010;
    #50;

    //Or Gate 
    Af = 4'b0101; 
    SrcA = 32'b1110000000000000000000010101010;
    SrcB = 32'b0000000000000000000000010101010;
    #50;

    //Xor Gate
    Af = 4'b0110; 
    SrcA = 32'b1110000000000000000000010101010;
    SrcB = 32'b0000000000000000000000010101010;
    #50;

    //Nor Gate
    Af = 4'b0111; 
    SrcA = 32'b1110000000000000000000010101010;
    SrcB = 32'b0000000000000000000000010101010;
    #50;

    //Lui
    Af = 4'b1111; 
    SrcA = 32'b1110000000000000000000010101010;
    SrcB = 32'b0000000000000000000000010101010;
    #50;
    

end
endmodule


//////_BaseLine Code_//////

Alu Alu (.SrcA(SW[4:0]),
			.SrcB(SW[9:5]),
			.Af(KEY[3:0]),
			.Alures(LEDR[9:0]),
			
			.Zero(LEDG[0]),
			.Neg(LEDG[1]),
			.Overflow(LEDG[2])
			);




