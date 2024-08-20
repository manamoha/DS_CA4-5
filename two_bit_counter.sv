module two_bit_counter(input clk, rst, en, output logic co);
	logic [2:0] count = 3'b000;

	always @(posedge clk, posedge rst)begin
		if(rst) count <= 3'b000;
		else if (en) count <= count+1;

	end
	assign co = count[2];

endmodule
