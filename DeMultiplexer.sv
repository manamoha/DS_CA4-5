module DeMultiplexer(input rst, serIn, outEn, input [1:0] port, output logic P0, P1, P2, P3);
	assign {P0, P1, P2, P3} = 	(outEn == 0) ? 4'bz:
					(port == 2'b00) ? {serIn, 3'bz} :
					(port == 2'b01) ? {1'bz, serIn , 2'bz}:
					(port == 2'b10) ? {2'bz, serIn , 1'bz}:
					(port == 2'b11) ? {3'bz, serIn} : 4'bz;
endmodule
