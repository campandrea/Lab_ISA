module Tb_filter_IIR
#(parameter Nb=10)
();
//Input commands
wire CLK;
wire RST_n;
wire [Nb-1] DIN ;
wire VIN;
//Output commands
wire [Nb-1] DOUT;
wire VOUT;

///Net

//input_reader
File_IO		
#(	.filename("../Files/input.txt"),
	.mode(read_mode)
 )
	IN_GEN_OUT_SINK_Module(
		.clk(CLK),
		.en(),		///AGGIUNGERE
		.data_in(DIN),
		.data_out(DOUT),
		.eof()  	///AGGIUNGERE
	);

IIR_filter 
#(10) 
	DUT(
		.CLK(CLK),
		.RST_n(RST_n),
		.DIN(DIN),
		.VIN(VIN),
		///A coefficients
		.a0(512), .a1(-815), .a2(1066), 
		.a3(-785), .a4(445), .a5(-164), 
		.a6(42), .a7(-7), .a8(0),
		///B coefficients
		.b0(1), .b1(9), .b2(32),
		.b3(65), .b4(81), .b5(65), 
		.b6(32), .b7(9), .b8(1),
		///Output
		.DOUT(DOUT),
		.VOUT(VOUT)
			);

//outut_writer
File_IO		
#(	.filename("../Files/output_DUT.txt"),
	.mode(read_mode)
 )
	IN_GEN_OUT_SINK_Module(
		.clk(CLK),
		.en(),		///AGGIUNGERE
		.data_in(DIN),
		.data_out(DOUT),
		.eof()  	///AGGIUNGERE
	);
endmodule

