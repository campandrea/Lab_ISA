LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY testbench_riscV IS
	PORT
	(
		END_SIM_i : out	std_logic
	);
END ENTITY;


ARCHITECTURE behavior OF testbench_riscV IS
	
	COMPONENT clk_gen
	  port (
		EN_N    : in std_logic;
		CLK     : out std_logic;
		RST_n   : out std_logic);
	end COMPONENT;
	
	
	
	
	COMPONENT Stimuli_generator 
	  generic ( filename  : string);

	  port( clk      : IN  std_logic;
			en       : IN  std_logic;
			data_out : OUT std_logic_vector(31 downto 0);
			eof      : OUT std_logic
		  );
	end COMPONENT;
	
	
	
	COMPONENT Memory 
	generic (	word_size 	: integer := 32;
			    addr_size 	: integer := 32;
				start_addr : integer := 0;
				stop_addr  : integer := 1024
            );
	port (clk	   : in std_logic;
  		  chip_sel : in std_logic;
  		  rd	   : in std_logic;
		  wr_n     : in std_logic;
  		  addr	   : in std_logic_vector(addr_size - 1 downto 0);
  		  data_in  : in std_logic_vector(word_size - 1 downto 0);
  		  data_out : out std_logic_vector(word_size - 1 downto 0)
         );
	end COMPONENT;
	
	
	
	COMPONENT datapath
	port(
		clk : in std_logic;
		rst : in std_logic;
		PCOut : out std_logic_vector (31 downto 0);
		Instruction : in std_logic_vector (31 downto 0);
		DataMemRead : out std_logic;
		DataMemWrite : out std_logic;
		DataMemAddr : out std_logic_vector (31 downto 0);
		DataMemDataIn : out std_logic_vector (31 downto 0);
		DataMemDataOut : in std_logic_vector (31 downto 0)
	);
	end COMPONENT;
	



	signal CLK, END_SIM_reg, RST_n : std_logic ;
	signal Stimuli_en ,Instruction_module_eof : std_logic ;
	signal Instruction_module_wr_n  : std_logic ;
	signal Instruction_memory_addr, Instruction_module_out, Instruction  : std_logic_vector(31 downto 0) ;
	signal rst_DUT : std_logic;
	signal PCout, DUT_DataMemAddr, Data_module_data_out, DUT_DataMemDataIn: std_logic_vector(31 downto 0) ;
	signal DUT_DataMemRead, DUT_DataMemWrite : std_logic;
	signal Data_module_wr_n, Data_module_rd :std_logic;
	signal Data_module_addr, Data_module_data_in : std_logic_vector(31 downto 0);
	
	
	BEGIN


		CLK_module : clk_gen 
		PORT MAP
		(END_SIM_reg, CLK, RST_n);
		
		
		
		
		Read_Instruction_Module	: Stimuli_generator
		GENERIC MAP("../Files/instruction_1.txt")
		PORT MAP
		(CLK, Stimuli_en, Instruction_module_out, Instruction_module_eof);
		
		
		
		
		Instruction_mem_module : Memory
		PORT MAP
		(CLK, '1', '0', Instruction_module_wr_n, 
		Instruction_memory_addr, Instruction_module_out, Instruction);
		
		
		
		
		DUT_module : datapath
		PORT MAP
		(CLK, rst_DUT, PCout, Instruction,
		DUT_DataMemRead, DUT_DataMemWrite, DUT_DataMemAddr,
		DUT_DataMemDataIn, Data_module_data_out);
		
		
		
		
		Data_mem_module : Memory
		PORT MAP
		(CLK, '1', Data_module_rd, Data_module_wr_n, 
		 Data_module_addr, Data_module_data_in, Data_module_data_out);
		
		
		

END behavior;