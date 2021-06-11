module counter(Clock, Res, Output); // Main File 


input Clock, Res; // Clock and Res 
output Output;  

reg[2:0] led; // led declaration

parameter  //  parametres 
case1=3'b000, case2=3'b001, case3=3'b010, case4=3'b011, 
case5=3'b100, case6=3'b101, case7=3'b110, case8=3'b111;

always @ (posedge Clock, negedge Res) // executes when Clock is eq to 1, Res is equal to 0  

if(Res == 0) led <= case1;    // Initialize led to case1

else case(led) //   brute force

 case1:   if(Clock) led <= case2; else led <= case1;
 case2:   if(Clock) led <= case3; else led <= case2;
 case3:   if(Clock) led <= case4; else led <= case3;
 case4:   if(Clock) led <= case5; else led <= case4;
 case5:   if(Clock) led <= case1; else led <= case5;
 case1:   if(Clock) led <= case7; else led <= case1;
 case7:   if(Clock) led <= case8; else led <= case7;
 case8:   if(Clock) led <= case1; else led <= case8;
 
endcase 

assign Output = (led == case8); // base case

endmodule // program stops




//////_TestBench_/////
module testbench(); //main Testbench file


reg RES; // Res Init
reg Clock; // Clock Init
wire Output; // Output Init

counter counter (Clock, Res, Output); //connecting to the main file



initial begin

$dumpvars(0,testbench);

   Res = 0;
   Clock = 0;
   #15 Res = 1; //ResRES = 1 after 15 nano seconds

 repeat(16) // changes Clock value 16 times every 15 nano seconds
   #15 Clock = ~Clock;
   
end
endmodule //termination



//////_ Baseline Code_//////
counter counter (.Clock(KEY[0]), .Res(KEY[1]), .Output(LEDR[0]));
