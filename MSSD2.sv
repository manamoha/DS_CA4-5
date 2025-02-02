module MSSD2(input Clk, reset, onecountEn, twocountEn, tworegEn, fourregEn, downcountEn, outEn, serIn, output onecountCo, TwocountCo, downcountCo, P0, P1, P2, P3, output logic[1:0] portNum);
	
	wire [3:0] byteNum;
	

	one_bit_counter counter1(Clk, reset, onecountEn, onecountCo);
	two_bit_register register1(Clk, reset, serIn, tworegEn, portNum);

	two_bit_counter counter2(Clk, reset, twocountEn, TwocountCo);
	four_bit_register register2(Clk, reset, serIn, fourregEn, byteNum);
	
	logic [6:0] bitNum;
	assign	bitNum = byteNum<<3;
	down_counter downcount(Clk, reset, downcountEn, bitNum, downcountCo);
	DeMultiplexer DeMux(reset, serIn, downcountEn, portNum, P0, P1, P2, P3);
	
endmodule
