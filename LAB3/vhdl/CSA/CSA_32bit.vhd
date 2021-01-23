library ieee;
use ieee.std_logic_1164.all;

ENTITY CSA_32bit IS
	PORT
	(
		In_A, In_B	: in 	std_logic_vector(31 downto 0);
		Cin			: in	std_logic;
		Cout		: out	std_logic;
		Sum			: out	std_logic_vector(31 downto 0)
	);
END ENTITY;

ARCHITECTURE behavior OF CSA_32bit IS
	
	COMPONENT CSA_6bit_block
	PORT
	(
		In_A, In_B	:	in	std_logic_vector(5 downto 0);
		Cin_sel		:	in	std_logic;
		Cout		:	out	std_logic;
		Sum			:	out	std_logic_vector(5 downto 0)
	);
	END COMPONENT;
	
	
	COMPONENT Full_A 
	PORT
	(
		In_A, In_B	: in	std_logic;
		Cin			: in	std_logic;
		Cout, S		: out	std_logic
	);
	END COMPONENT;
	
	
	
	signal FA01_cout_tmp	:	std_logic_vector(1 downto 0);
	signal Cout_sel_tmp		:	std_logic_vector(4 downto 0);
	
	
	BEGIN
	
	
	FA_0	:	Full_A
	PORT MAP
	(In_A(0), In_B(0), Cin, FA01_cout_tmp(0),  Sum(0));
	
	FA_1	:	Full_A
	PORT MAP
	(In_A(1), In_B(1), FA01_cout_tmp(0), FA01_cout_tmp(1),  Sum(1));
	
	
	GEN_ADD	:	for i in 0 to 4 generate
		FirstB	:	If (i=0) generate
			CSA_block	:	CSA_6bit_block
			PORT MAP
			(In_A((i*6 + 7) downto (i*6 + 2)), In_B((i*6 + 7) downto (i*6 + 2)), FA01_cout_tmp(1), Cout_sel_tmp(i), Sum((i*6 + 7) downto (i*6 + 2)));
		END generate FirstB ;
		
		
		OtherB	:	IF (i > 0)	generate
			CSA_block	:	CSA_6bit_block
			PORT MAP
			(In_A((i*6 + 7) downto (i*6 + 2)), In_B((i*6 + 7) downto (i*6 + 2)), Cout_sel_tmp(i-1), Cout_sel_tmp(i), Sum((i*6 + 7) downto (i*6 + 2)));
		END generate OtherB ;
		
	END generate GEN_ADD;
	
	
	Cout <= Cout_sel_tmp(4) ;
	
END behavior;