module Tb_filter_IIR
#(parameter Nb=10)
 (output wire END_SIM_i);
//Input commands
wire CLK;
wire RST_n;
wire [Nb-1:0] DIN_IO_GEN_TO_Filter ;
wire VIN;
//Output commands
wire [Nb-1:0] DOUT_Filter_TO_OUT_module;
wire VOUT;
wire EOF;

///A coefficients
wire signed [Nb-1:0] a0 =  -10'd512;
wire signed [Nb-1:0] a1 =  10'd82;


///B coefficients
wire signed [Nb-1:0] b0 =  10'd215;
wire signed [Nb-1:0] b1 =  10'd215;


integer count = 0;

reg END_SIM_reg;

initial begin
	#1 END_SIM_reg <= 0;
end

always @(posedge CLK)
	begin
		if (count == 150) begin
			count <= 0;
			END_SIM_reg <= 1;
		end else begin
			count <= count + 1;
		end			
	end

assign END_SIM_i = END_SIM_reg;

reg prova;
always @(posedge CLK or negedge CLK)
	begin
		if(EOF == 0) begin
			prova <= 1;
		end
		if(prova == 1) begin
			#500 prova <= 0;
			#50 prova <=1;
		end
	end
	


///Net

clk_gen 
	CLK_Module(
		.EN_N(END_SIM_reg),
		.CLK(CLK),
		.RST_n(RST_n)
		);
		
///Read mode module
Stimuli_generator		
#(.filename("../Files/input_DUT.txt"))
	IN_GEN_SINK_Module(
		.clk(CLK),
		.en(RST_n),
		.data_out(DIN_IO_GEN_TO_Filter),
		.eof(EOF)
	);


///Write mode module
Output_Sink		
#(.filename("../Files/output_DUT.txt"))
	IN_GEN_OUT_SINK_Module(
		.clk(CLK),
		.en(VOUT),		///AGGIUNGERE
		.data_in(DOUT_Filter_TO_OUT_module)
	);
	


IIR_filter 
	DUT(
		.CLK(CLK),
		.RST_n(RST_n),
		.DIN(DIN_IO_GEN_TO_Filter),
		.VIN(prova),
		///A coefficients
		.a0(a0), .a1(a1),
		///B coefficients
		.b0(b0), .b1(b1),
		///Output
		.DOUT(DOUT_Filter_TO_OUT_module),
		.VOUT(VOUT)
			);
			

always @ (END_SIM_i) begin
	if (END_SIM_i == 1) begin
		$toggle_stop;
	end
end

endmodule

