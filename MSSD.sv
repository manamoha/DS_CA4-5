module MSSD (input Clk, reset, serIn, output P0, P1, P2, P3, outValid, error, output logic[1:0] d);
	logic onecountCo, TwocountCo, downcountCo, onecountEn, tworegEn, twocountEn, fourregEn, downcountEn, outEn, donerst;

	MSSD1 controller(Clk, reset, serIn, onecountCo, TwocountCo, downcountCo, onecountEn, tworegEn, twocountEn, fourregEn, downcountEn, outEn, donerst, outValid, error);
	MSSD2 DataPath(Clk, (donerst | reset), onecountEn, twocountEn, tworegEn, fourregEn, downcountEn, outEn, serIn, onecountCo, TwocountCo, downcountCo, P0, P1, P2, P3, d);

endmodule