module tb_riscV
#(parameter Nb=32)
 (output wire END_SIM_i);

wire CLK;
wire RST_n
reg END_SIM_reg;


initial begin
	#1 END_SIM_reg <= 0;
  //parte il clock e il suo enable
  // parte la lettura del file e la scrittura nell'instruction memory
  // quando finisce dare il reset alla dut e farla partire
  //aspettare un po di tempo
  // mettere end_sim_i a 1
end

//task per controllare a chi dare il comando della data memory
task write_data_memory_handler();
  input END_sim_i;
  output //aggiungere i segnali utili
  begin
    if(END_sim_i == 0)
      begin
      // il comando della data mem deve essere della DUT
      end
    else if(END_sim_i == 1)
      begin
      //il comando deve averlo il dut
      end
endtask

//effettuare sempre il controllo
always write_data_memory_handler();


//Clock generator
//AGGIUSTARE
clk_gen
	CLK_Module(
	.EN_N(END_SIM_reg),
	.CLK(CLK),
	.RST_n(RST_n)
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
//AGGIUSTARE
Memory
#(.word_size(8),
  .addr_size(32),
  .line_size(4)
  )
  Instruction_mem_module(
      .chip_sel(),
      .rd(),
      .wr_n(),
      .addr(),
      .data_in(),
      .data_out()
  );

//DUT riscV processor
//AGGIUSTARE
datapath
    DUT_module(
        .clk(CLK),
        .rst(),
        .PCOut(),
        .Instruction(),
        .DataMemRead(),
        .DataMemWrite(),
        .DataMemAddr(),
        .DataMemDataIn(),
        .DataMemDataOut()
    );

//Data memory
//AGGIUSTARE
Memory
#(.word_size(8),
  .addr_size(32),
  .line_size(4)
  )
  Data_mem_module(
      .chip_sel(),
      .rd(),
      .wr_n(),
      .addr(),
      .data_in(),
      .data_out()
  );

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
    //trascrivere il contenuto della data memory sul file
    // per il segnale di rd che dovrebbe essere dato solo da DUT
    // potrebbero esserci dei conflitti
		$toggle_stop;
	end
end


 endmodule
