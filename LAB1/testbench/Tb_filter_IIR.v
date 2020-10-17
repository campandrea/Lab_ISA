module Tb_filter_IIR
#(parameter Nb=10)
();
//Input commands
wire CLK;
wire RST_n;
wire [Nb-1:0] DIN_IO_GEN_TO_Filter ;
wire VIN;
//Output commands
wire [Nb-1:0] DOUT_Filter_TO_OUT_module;
wire VOUT;
wire EOF;
///Net

clk_gen 
	CLK_Module(
		.END_SIM(EOF),
		.CLK(CLK),
		.RST_n(RST_n)
		);
		
		
///Read mode module
File_IO		
#(	.filename("../Files/input_DUT.txt"),
	.mode("read_mode")
 )
	IN_GEN_SINK_Module(
		.clk(CLK),
		.en(RST_n),		///AGGIUNGERE
		.data_in("0000000000"),
		.data_out(DIN_IO_GEN_TO_Filter),
		.eof(EOF)  	///AGGIUNGERE
	);
	

///Write mode module
File_IO		
#(	.filename("../Files/output_DUT.txt"),
	.mode("write_mode")
 )
	IN_GEN_OUT_SINK_Module(
		.clk(CLK),
		.en(VOUT),		///AGGIUNGERE
		.data_in(DOUT_Filter_TO_OUT_module),
		.data_out(),
		.eof()  	///AGGIUNGERE
	);
	
	

IIR_filter 
#(10) 
	DUT(
		.CLK(CLK),
		.RST_n(RST_n),
		.DIN(DIN_IO_GEN_TO_Filter),
		.VIN(~EOF),
		///A coefficients
		.a0(512), .a1(-815), .a2(1066), 
		.a3(-785), .a4(445), .a5(-164), 
		.a6(42), .a7(-7), .a8(0),
		///B coefficients
		.b0(1), .b1(9), .b2(32),
		.b3(65), .b4(81), .b5(65), 
		.b6(32), .b7(9), .b8(1),
		///Output
		.DOUT(DOUT_Filter_TO_OUT_module),
		.VOUT(VOUT)
			);
endmodule

