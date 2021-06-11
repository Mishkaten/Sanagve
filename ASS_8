module Param_extender# (parameter Q = 2, R = 25) 
	
	(input [Q-1:0] In, 
	 input Toggle, 
	 output reg[R-1:0] Out);

always 
if (Toggle == 1) 
	begin
    Out[Q-1:0] <= In[Q-1:0];
    Out[R-1:Q] <= 0;
	end
	
else
	 begin
    Out[Q-1:0] <=  In[Q-1:0];
    Out[R-1:Q] <= {R-Q{In[Q-1]}};
	 end
	 
end
endmodule

//////_TestBench_//////

module testbench();

reg Toggle;
reg [1:0] In;
wire [24:0] Out;

Param_extender  #(.Q(2), .R(25)) UUT (
    .Out(Out), .In(In), .Toggle(Toggle)
);

initial begin
    Toggle = 1; In = 2'b01; 
    Toggle = 0; In = 2'b11;
end

endmodule




