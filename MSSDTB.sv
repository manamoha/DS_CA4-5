`timescale 1ns/1ns
module MSSDTB();
	logic Clk, reset, serIn=1, P1=0, P2=0, P3=0, P4=0;
	logic outValid, error;
	logic [1:0] d;
	initial begin
		Clk = 1;
		reset = 1;
		#10;
		reset = 0;
		Clk = 0;
		forever begin
			#5;
			Clk=~Clk;
			
			#5;
			Clk=~Clk;
			serIn = $random;
		end
	end
	MSSD MyMSSD(Clk, reset, serIn , P1, P2, P3, P4, outValid, error, d);
endmodule
