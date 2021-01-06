module tb_riscV
#(parameter Nb=32)
 (output wire END_SIM_i);

wire CLK;
reg END_SIM_reg;

initial begin
	#1 END_SIM_reg <= 0;
end
//Clock generator
//AGGIUSTARE
clk_gen
	CLK_Module(
	.EN_N(END_SIM_reg),
	.CLK(CLK),
	.RST_n()
);

 ///Read instruction from file
 //AGGIUSTARE
Stimuli_generator
#(.filename(""))
	Read_Instruction_Module(
		.clk(CLK),
		.en(),
		.data_out(),
		.eof(EOF)
	);

//Instruction memory
//AGGIUNGERE

//DUT riscV processor
//AGGIUNGERE

//Data memory
//AGGIUNGERE

//Write result data on file
//AGGIUSTARE
Output_Sink
#(.filename(""))
	Write_Data_Module(
		.clk(CLK),
		.en(),
		.data_in()
	);

always @ (END_SIM_i) begin
	if (END_SIM_i == 1) begin
		$toggle_stop;
	end
end


 endmodule
