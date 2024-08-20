module down_counter(input clk, rst, en, input[6:0] countnum, output logic co);
	logic[6:0] count = 7'b0000000;
	always @(posedge clk, posedge rst)begin
		if (rst) begin
			count<=7'b0000000;
		end
		else begin
 			if(en) count <= (count+1);
		end
	end
	assign co=(count==countnum);
endmodule
