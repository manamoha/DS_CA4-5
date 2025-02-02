module one_bit_counter(input clk, rst, en, output co);
	logic [1:0] count = 2'b00;

	always @(posedge clk, posedge rst)begin
		if(rst) count <= 2'b00;
		else if (en) count <= count+1;

	end
	assign co = count[1];

endmodule
