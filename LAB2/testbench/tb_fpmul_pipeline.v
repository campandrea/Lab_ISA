module tb_fpmul_pipeline
#(parameter Nb=32)
 (output wire END_SIM_i);
 
wire CLK;
wire VOUT;
wire [Nb-1:0] VIN_A;
wire [Nb-1:0] VOUT_Z;
reg END_SIM_reg;
wire EOF;
 
initial begin
	#1 END_SIM_reg <= 0;
end
 
clk_gen 
	CLK_Module(
	.EN_N(END_SIM_reg),
	.CLK(CLK),
	.RST_n(RST_n)
);
 
 
 
Output_Sink		
#(.filename("../Files/output_DUT.txt"))
	IN_GEN_OUT_SINK_Module(
		.clk(CLK),
		.en(RST_n),	
		.data_in(VOUT_Z)
	);
	
 
 ///Read mode module
Stimuli_generator		
#(.filename("../Files/fp_samples.hex"))
	IN_GEN_SINK_Module(
		.clk(CLK),
		.en(RST_n),
		.data_out(VIN_A),
		.eof(EOF)
	);
	
	
FPmul	
	DUT(
      .FP_A(VIN_A),
      .FP_B(VIN_A),
      .clk(CLK),
      .FP_Z(VOUT_Z)
	);
	
	
	
	
	
	
	
	
	
always @ (END_SIM_i) begin
	if (END_SIM_i == 1) begin
		$toggle_stop;
	end
end
	
 
 endmodule 