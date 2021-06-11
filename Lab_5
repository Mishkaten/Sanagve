module synch_rom (clock, address, data_out);
    
    input clock; //declaring clock
    input [2:0] address;
    output [7:0] data_out;

    reg[7:0] data_out;

    always @(posedge clock) begin
        case(address)

            3'b000: data_out = 8'b00000001;
            3'b001: data_out = 8'b00000010;
            3'b010: data_out = 8'b00000100;
            3'b011: data_out = 8'b00001000;
            3'b100: data_out = 8'b00010000;
            3'b101: data_out = 8'b00100000;
        default: data_out = 8'b00000000;
        endcase

    end
endmodule 


/////_TestBench_/////
module testbench();
reg clock = 0;
reg [2:0] address;
wire[7:0] data_out;

synch_rom synch_rom (.clock(clock)), (.address(address)), (.data_out(data_out));

always begin 

    clock = ~clock;
    #40; //delay

//Here are some examples
	end 
	
initial begin 
        address = 3'b000;  
        #80;
        address = 3'b001;
        #80;
        address = 3'b010;
        #80;
        address = 3'b011;
        #80;
        address = 3'b100;
        #80;
        address = 3'b110;
        #80;
        address = 3'b111;
        #80;

    end

endmodule

