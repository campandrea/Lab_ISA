LIBRARY ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY testbench_riscV IS

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



	COMPONENT Output_Sink
		generic ( filename  : string);
		port( clk      : IN  std_logic;
			en       : IN  std_logic;
			data_in  : IN  std_logic_vector(31 downto 0)
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

  component mux2to1_vec is
      generic(N : natural := 32);
      port(
        data_0_in : in std_logic_vector (N-1 downto 0);
        data_1_in : in std_logic_vector (N-1 downto 0);
        sel : in std_logic;
        data_out : out  std_logic_vector (N-1 downto 0)
      );
  end component;

  component mux2to1_std is
      port(
        data_0_in : in std_logic;
        data_1_in : in std_logic;
        sel : in std_logic;
        data_out : out  std_logic
      );
  end component;



	signal clk : std_logic ;

	signal Stimuli_en ,Stimuli_eof : std_logic ;
  signal Stimuli_data_out : std_logic_vector(31 downto 0);

  signal Instruction_mem_rd, Instruction_mem_wr_n  : std_logic;
	signal Instruction_mem_addr : std_logic_vector(31 downto 0);

  signal Instruction_mem_addr_tb : std_logic_vector(31 downto 0);
  signal Addr_Instruction_mem_mux_sel : std_logic;

	signal rst : std_logic;
	signal PCout, Instruction, DataMemAddr_DUT : std_logic_vector(31 downto 0) ;
  signal DataMemDataIn_DUT, DataMemDataOut_DUT : std_logic_vector(31 downto 0) ;
	signal DataMemRead_DUT, DataMemWrite_DUT : std_logic;

	signal Data_mem_wr_n, Data_mem_rd :std_logic;
	signal Data_mem_addr, Data_mem_data_in, Data_mem_data_out : std_logic_vector(31 downto 0);

  signal Rd_Data_mem_mux_sel, Addr_Data_mem_mux_sel : std_logic;
  signal Data_mem_addr_tb : std_logic_vector(31 downto 0);


  signal Sink_en : std_logic;
  signal Sink_data_in : std_logic_vector(31 downto 0);

  constant start_addr_instruction_mem : integer := 16#00400000#;
  constant stop_addr_instruction_mem : integer := start_addr_instruction_mem + 512;

  constant start_addr_data_mem : integer := 16#10010000#;
  constant stop_addr_data_mem : integer := start_addr_data_mem + 512;




	BEGIN


		CLK_module : clk_gen
		PORT MAP
		(EN_N => '0',
		 CLK => clk,
		 RST_n => open
     );




		Read_Instruction_Module: Stimuli_generator
		GENERIC MAP("../Files/min_search.txt")
		PORT MAP
		(clk => CLK,
     en => Stimuli_en,
     data_out => Stimuli_data_out,
     eof => Stimuli_eof);

		 Addr_Instruction_mem_mux: mux2to1_vec
     port map(
     data_0_in => Instruction_mem_addr_tb,
     data_1_in => PcOut,
     sel => Addr_Instruction_mem_mux_sel,
     data_out => Instruction_mem_addr);

		Instruction_mem_module : Memory
    generic map
    (word_size => 32,
  	 addr_size => 32,
     start_addr => start_addr_instruction_mem,
     stop_addr => stop_addr_instruction_mem)
		PORT MAP
		(clk => clk,
    chip_sel => '1',
    rd => Instruction_mem_rd,
    wr_n => Instruction_mem_wr_n,
    addr => Instruction_mem_addr,
    data_in => Stimuli_data_out,
    data_out => Instruction);




		DUT_module : datapath
		PORT MAP
		(clk => clk,
     rst => rst,
     PcOut => PCout,
     Instruction => Instruction,
     DataMemRead =>DataMemRead_DUT,
     DataMemWrite => DataMemWrite_DUT,
     DataMemAddr => DataMemAddr_DUT,
		 DataMemDataIn => DataMemDataIn_DUT,
     DataMemDataOut => DataMemDataOut_DUT);


     Rd_Data_mem_mux: mux2to1_std
     port map(
     data_0_in => DataMemRead_DUT,
     data_1_in => '1',
     sel => Rd_Data_mem_mux_sel,
     data_out => Data_mem_rd);

     Data_mem_wr_n <= not DataMemWrite_DUT;

     Addr_Data_mem_mux: mux2to1_vec
     port map(
     data_0_in => DataMemAddr_DUT,
     data_1_in => Data_mem_addr_tb,
     sel => Addr_Data_mem_mux_sel,
     data_out => Data_mem_addr);

     Data_mem_data_in <= DataMemDataIn_DUT;

     DataMemDataOut_DUT <= Data_mem_data_out;
     Sink_data_in <= Data_mem_data_out;

		Data_mem_module : Memory
    generic map
    (word_size => 32,
  	 addr_size => 32,
     start_addr => start_addr_data_mem,
     stop_addr => stop_addr_data_mem)
		PORT MAP
		(clk => clk,
     chip_sel => '1',
     rd => Data_mem_rd,
     wr_n => Data_mem_wr_n,
     addr => Data_mem_addr,
     data_in => Data_mem_data_in,
     data_out => Data_mem_data_out);



		Output_sink_module :	Output_Sink
		GENERIC MAP("../Files/data_tb1.txt")
		PORT MAP
		(clk => clk,
     en => Sink_en,
     data_in => Sink_data_in);



    testbench_proc: process
    begin
      Stimuli_en <= '0';
      Instruction_mem_addr_tb <= std_logic_vector(to_unsigned(start_addr_instruction_mem, 32)); --first address
      rst <= '1';
      Data_mem_addr_tb <= std_logic_vector(to_unsigned(start_addr_data_mem, 32));
      wait for 4 ns;

      Stimuli_en <= '1';
      Addr_Instruction_mem_mux_sel <= '0';

      wait for 4 ns;
      Instruction_mem_wr_n <= '0';
      Instruction_mem_rd <= '1';
      while Stimuli_eof = '0' loop
        wait for 4 ns;
        Instruction_mem_addr_tb <= std_logic_vector(unsigned(Instruction_mem_addr_tb) + 4);
      end loop;
      Rd_Data_mem_mux_sel <= '0';
      Addr_Data_mem_mux_sel <= '0';
      Stimuli_en <= '0';
      Addr_Instruction_mem_mux_sel <= '1';
      Instruction_mem_wr_n <= '1';
      rst <= '0';
      --execution
      wait for 500 ns;

      Rd_Data_mem_mux_sel <= '1';
      Addr_Data_mem_mux_sel <= '1';
      Sink_en <= '1';
      for i in 0 to 512 loop
        wait for 4 ns;
        Data_mem_addr_tb <= std_logic_vector(unsigned(Data_mem_addr_tb) + 4);
      end loop;
      wait;
    end process;






END behavior;
