library ieee;
use ieee.std_logic_1164.all;

ENTITY RCA_6bit IS
	PORT
	(
		In_A, In_B	:	in  std_logic_vector(5 downto 0);
		Cin			:	in  std_logic;
		Cout		:	out std_logic;
		S			:	out std_logic_vector(5 downto 0)
	);
END ENTITY;

ARCHITECTURE behavior OF RCA_6bit IS


	COMPONENT Full_A 
	PORT
	(
		In_A, In_B	: in	std_logic;
		Cin			: in	std_logic;
		Cout, S		: out	std_logic
	);
	END COMPONENT;

	signal Cout_tmp	:	std_logic_vector(5 downto 0);

	BEGIN
		
		GEN_FA :	for i in 0 to 5 generate
		
			FirstB	:	IF (i = 0) generate
				full_add_module	:	Full_A
				PORT MAP
				(In_A(i), In_B(i), Cin, Cout_tmp(i), S(i));
			END generate FirstB;
			
			OtherB	:	IF (i > 0)	generate
				full_add_module	:	Full_A
				PORT MAP
				(In_A(i), In_B(i), Cout_tmp(i-1), Cout_tmp(i), S(i));
			END generate OtherB;
			
		end generate GEN_FA;
		
		
		Cout <= Cout_tmp(5);
		
END behavior;