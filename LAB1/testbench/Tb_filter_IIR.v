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

///A coefficients
wire signed [Nb-1:0] a0 =  10'd245;
wire signed [Nb-1:0] a1 =  -10'd391;
wire signed [Nb-1:0] a2 =  10'd511;
wire signed [Nb-1:0] a3 =  -10'd377;
wire signed [Nb-1:0] a4 =  10'd213;
wire signed [Nb-1:0] a5 =  -10'd79;
wire signed [Nb-1:0] a6 =  10'd20;
wire signed [Nb-1:0] a7 =  -10'd4;
wire signed [Nb-1:0] a8 =  10'd0;

///B coefficients
wire signed [Nb-1:0] b0 =  10'd0;
wire signed [Nb-1:0] b1 =  10'd4;
wire signed [Nb-1:0] b2 =  10'd15;
wire signed [Nb-1:0] b3 =  10'd31;
wire signed [Nb-1:0] b4 =  10'd39;
wire signed [Nb-1:0] b5 =  10'd31;
wire signed [Nb-1:0] b6 =  10'd15;
wire signed [Nb-1:0] b7 =  10'd4;
wire signed [Nb-1:0] b8 =  10'd0;


///Net

clk_gen 
	CLK_Module(
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
		.data_in(DOUT_Filter_TO_OUT_module),
		.eof()  	///AGGIUNGERE
	);
	


IIR_filter 
	DUT(
		.CLK(CLK),
		.RST_n(RST_n),
		.DIN(DIN_IO_GEN_TO_Filter),
		.VIN(~EOF),
		///A coefficients
		.a0(a0), .a1(a1), .a2(a2), 
		.a3(a3), .a4(a4), .a5(a5), 
		.a6(a6), .a7(a7), .a8(a8),
		///B coefficients
		.b0(b0), .b1(b1), .b2(b2),
		.b3(b3), .b4(b4), .b5(b5), 
		.b6(b6), .b7(b7), .b8(b8),
		///Output
		.DOUT(DOUT_Filter_TO_OUT_module),
		.VOUT(VOUT)
			);
endmodule

