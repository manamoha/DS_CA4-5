module	MSSD1(input Clk, reset, serIn, onecountCo, TwocountCo, downcountCo, output logic onecountEn, tworegEn, twocountEn, fourregEn, downcountEn, outEn, donerst, outValid, error);

	logic [1:0]ns, ps;
	parameter [1:0]NoData = 2'b00, PortNum = 2'b01, ByteNum = 2'b10, Data = 2'b11;
	always @(Clk, ps, onecountCo, TwocountCo, downcountCo)begin
		case(ps)
			NoData : ns <= (serIn | error) ? NoData : PortNum;
			PortNum : ns <= onecountCo ? ByteNum : PortNum;
			ByteNum : ns <= TwocountCo ? Data : ByteNum;
			Data : ns <= downcountCo ? NoData : Data;
			default : ns <= NoData;
		endcase
	end


	always @(ps, ns, onecountCo, TwocountCo, downcountCo)begin
		onecountEn = 1'b0; tworegEn = 1'b0; twocountEn = 1'b0; fourregEn = 1'b0; downcountEn = 1'b0; outEn = 1'b0;
		case(ns)
			NoData : 	begin
					downcountEn = 0;
					outEn = 0;
					onecountEn = 0;
					tworegEn = 0;
					twocountEn = 0;
					fourregEn = 0;
					outValid = 0; 
					end
			PortNum : 	begin 
					onecountEn = 1;
					tworegEn = 1;
					end
			ByteNum : 	begin 
					twocountEn = 1;
					fourregEn = 1; 
					onecountEn = 0;
					tworegEn = 0;
					end
			Data : 		begin 
					downcountEn = 1;
					outEn = 1;
					twocountEn = 0;
					fourregEn = 0;
					outValid = 1; 
					end
		endcase
	end

	always @(negedge Clk, posedge reset)begin
		if(reset) begin
			ps<=NoData;
			error = 0;
		end
		else begin
			if(((ps==Data)&(ns==NoData)) | (error==1)) begin
				error = ~serIn;
			end
			if((ps==Data)&(ns==NoData)) begin
				donerst = 1;
			end
			else donerst=0;
			ps<=ns;
		end
	end



endmodule
