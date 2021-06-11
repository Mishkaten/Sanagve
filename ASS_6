module Devider (  
		input clk, 
		input rst, //input intialization 
		output reg clk_out ); //output intialization 

		reg [3:0] counter = 0; //Counter initialization

always @ (posedge clk or negedge rst) //if clk becomes 1 or rst becomes 0 code runs																		 
   begin  //loop start
 	if(~rst) 
		counter <= 0; // counter gets the value of 0	
	else 
	counter <= (counter==8) ? 0:(counter + 1); // if counter is 8, counter get the value 
   end	//loopend				                    // of 0 or is being added by 1       

always @ (posedge clk or negedge rst) //if clk becomes 1 or rst becomes 0 code runs				
   begin                              

	if(~rst)//clock gets the value of 0
		clk_out <= 0;

//	else 
//	clk_out <= 0; //clock has initial value of 0

	else if (counter >= 2) 
	clk_out <= 1; //clock gets the value 1
    
    end //loopend

endmodule // termination


////_baseline code_/////

Devider Devider(.clk(SW[0]), .rst(SW[1]), .clk_out(LEDG[0]));
