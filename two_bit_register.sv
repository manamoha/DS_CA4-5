module two_bit_register(input clk, rst, serin, en, output logic [1:0] PO);
	always @(posedge clk, posedge rst)begin
		if(rst)
			PO<=2'b00;
		else if(en)
			PO<={PO[0],serin};
	end
endmodule
