module four_bit_register(input clk, rst, serin, en, output logic [3:0] PO);
	always @(posedge clk, posedge rst)begin
		if(rst)
			PO<=4'b00;
		else if(en)
			PO<={PO[2:0],serin};
	end
endmodule
