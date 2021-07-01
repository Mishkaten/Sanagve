module counter(CLK, RES, OUTPT); //declaring input and output variables


input CLK, RES; // CLK and RES init
output OUTPT; // output init

reg[2:0] state; // Declaring state

parameter  // Cases for States
C0=3'b000, C1=3'b001, C2=3'b010, C3=3'b011, C4=3'b100, C5=3'b101, C6=3'b110, C7=3'b111;


always @ (posedge CLK, negedge RES) // executes only when when reset value is 0 or clock is 1
 if(RES == 0) state <= C0;    // Init to state C0
 
 else case(state) // all case ocurances
 
  C0:   if(CLK) state <= C1;
            else state <= C0;

  C1:   if(CLK) state <= C2;
            else state <= C1;

  C2:   if(CLK) state <= C3;
            else state <= C2;

  C3:   if(CLK) state <= C4;
            else state <= C3;

  C4:   if(CLK) state <= C5;
            else state <= C4;

  C5:   if(CLK) state <= C6;
            else state <= C5;

  C6:   if(CLK) state <= C7;
            else state <= C6;

  C7:   if(CLK) state <= C0;
            else state <= C7;
  
 endcase // stop cases

 assign OUTPT = (state == C7); // output asignment
 
endmodule // termination



//////////_TB_///////////
module tb(); //main Testbench file



reg CLK = 0; // CLK Init
reg RES = 0; // RES Init

wire OUTPT; // Output Init

counter counter (CLK, RES, OUTPT); //connecting to the main file



always begin
	
	
	CLK =#50 ~CLK;
   RES = 1;
end
endmodule //termination
