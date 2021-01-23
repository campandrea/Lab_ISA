LIBRARY ieee;
use ieee.std_logic_1164.all;


ENTITY CSA_6bit_block IS
	PORT
	(
		In_A, In_B	:	in	std_logic_vector(5 downto 0);
		Cin_sel		:	in	std_logic;
		Cout		:	out	std_logic;
		Sum			:	out	std_logic_vector(5 downto 0)
	);
END ENTITY;

ARCHITECTURE behavior OF CSA_6bit_block IS
	
	COMPONENT RCA_6bit
	PORT
	(
		In_A, In_B	:	in  std_logic_vector(5 downto 0);
		Cin			:	in  std_logic;
		Cout		:	out std_logic;
		S			:	out std_logic_vector(5 downto 0)
	);
	END COMPONENT;
	
	
	COMPONENT Mux2_1_6bit
	PORT
	(
		In_A, In_B	:	in	std_logic_vector(5 downto 0);
		Cin			:	in	std_logic_vector(1 downto 0);
		Sel			:	in  std_logic;
		Cout		:	out std_logic;
		Z			:	out std_logic_vector(5 downto 0)
 	);
	END COMPONENT;

	signal Cout_tmp		:	std_logic_vector(1 downto 0);
	signal Sum_tmp_0, Sum_tmp_1	:	std_logic_vector(5 downto 0);

	BEGIN
	
	---adder with Cin=0
	RCA_0	:	RCA_6bit
	PORT MAP
	(In_A, In_B, '0', Cout_tmp(0), Sum_tmp_0);
	
	---adder with Cin=1
	RCA_1	:	RCA_6bit
	PORT MAP
	(In_A, In_B, '1', Cout_tmp(1), Sum_tmp_1);
	
	
	Selector : Mux2_1_6bit
	PORT MAP
	(Sum_tmp_0, Sum_tmp_1, Cout_tmp, Cin_sel, Cout, Sum);
	
END behavior;