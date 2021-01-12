module tb_riscV
#(parameter Nb=32)
 (output wire END_SIM_i);

wire CLK;
wire RST_n;
reg END_SIM_reg;
wire[31:0] Instruction_module_out;
wire Instruction_module_eof;
reg[31:0] Instruction_memory_addr;
reg Instruction_module_wr_n;
reg rst_DUT;

wire[31:0] PCout;
wire[31:0] Instruction;
wire DUT_DataMemRead;
wire DUT_DataMemWrite;
wire[31:0] DUT_DataMemAddr;
wire[31:0] DUT_DataMemDataIn;


reg Data_module_rd;
reg Data_module_wr_n;
reg[31:0] Data_module_addr;
reg[31:0] Data_module_data_in;
wire[31:0] Data_module_data_out;

reg Write_Data_Module_en;


integer count;

initial begin
	#1 END_SIM_reg <= 0;
  #1 count <= 0;
  #1 rst_DUT <= 1;
  while (!Instruction_module_eof) begin
    Instruction_module_wr_n <= 1'b0;
    @ (posedge CLK)
    count <= count + 4;
    Instruction_memory_addr <= count;
  end
    Instruction_memory_addr <= PCout;
    rst_DUT <= 0;
  //parte il clock e il suo enable
  // parte la lettura del file e la scrittura nell'instruction memory
  // quando finisce dare il reset alla dut e farla partire
  //aspettare un po di tempo
  // mettere end_sim_i a 1
end

//task per controllare a chi dare il comando della data memory
always @ (END_SIM_i)
  begin
    if(END_SIM_i == 0)
      begin
      // il comando della data mem deve essere della DUT
      Data_module_rd <= DUT_DataMemRead;
      Data_module_wr_n <= ~ DUT_DataMemWrite;
      Data_module_addr <= DUT_DataMemAddr;
      Data_module_data_in <= DUT_DataMemDataIn;
      Write_Data_Module_en <= 0;
      end
    else if(END_SIM_i == 1)
      begin
      //il comando deve averlo il testbench
      count = 268500992;
      while (count < 268500992 + 1024 ) begin
        Data_module_rd <= 1'b0;
        Data_module_wr_n <= 0;
        Data_module_addr <= count;
        Data_module_data_in <= 32'h00000000;
        Write_Data_Module_en <= 1;
        @ (posedge CLK)
        count <= count + 4;
      end
      end
end



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
#(.filename("../Files/instruction1.txt")) //Inserire Instruction file
	Read_Instruction_Module(
		.clk(CLK),
		.en(~ Instruction_module_wr_n),
		.data_out(Instruction_module_out),
		.eof(Instruction_module_eof)
	);

//Instruction memory
//AGGIUSTARE
Memory
#(.word_size(32),
  .addr_size(32)
  )
  Instruction_mem_module(
      .clk(CLK),
      .chip_sel(1'b1),
      .rd(1'b1),
      .wr_n(Instruction_module_wr_n),
      .addr(Instruction_memory_addr),
      .data_in(Instruction_module_out),
      .data_out(Instruction)
  );

//DUT riscV processor
//AGGIUSTARE
datapath
    DUT_module(
        .clk(CLK),
        .rst(rst_DUT),
        .PCOut(PCout),
        .Instruction(Instruction),
        .DataMemRead(DUT_DataMemRead),
        .DataMemWrite(DUT_DataMemWrite),
        .DataMemAddr(DUT_DataMemAddr),
        .DataMemDataIn(DUT_DataMemDataIn),
        .DataMemDataOut(Data_module_data_out)
    );

//Data memory
//AGGIUSTARE
Memory
#(.word_size(32),
  .addr_size(32)
  )
  Data_mem_module(
      .clk(CLK),
      .chip_sel(1'b1),
      .rd(Data_module_rd),
      .wr_n(Data_module_wr_n),
      .addr(Data_module_addr),
      .data_in(Data_module_data_in),
      .data_out(Data_module_data_out)
  );

//Write result data on file
//AGGIUSTARE
Output_Sink
#(.filename("../Files/data_tb1.txt"))
	Write_Data_Module(
		.clk(CLK),
		.en(Write_Data_Module_en),
		.data_in(Data_module_data_out)
	);




always @ (END_SIM_i) begin
	if (END_SIM_i == 1) begin
    //trascrivere il contenuto della data memory sul file
    // per il segnale di rd che dovrebbe essere dato solo da DUT
    // potrebbero esserci dei conflitti
		//$toggle_stop;
	end
end


 endmodule
