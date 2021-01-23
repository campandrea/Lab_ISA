library ieee;
use ieee.std_logic_1164.all;

ENTITY Mux2_1_6bit IS
	PORT
	(
		In_A, In_B	:	in	std_logic_vector(5 downto 0);
		Cin			:	in	std_logic_vector(1 downto 0);
		Sel			:	in  std_logic;
		Cout		:	out std_logic;
		Z			:	out std_logic_vector(5 downto 0)
 	);
END Mux2_1_6bit;

ARCHITECTURE behavior OF Mux2_1_6bit IS
	BEGIN
	
		Cout <=	Cin(0) WHEN Sel = '0' ELSE
				Cin(1) WHEN Sel = '1' ;
				
		Z	 <=	In_A WHEN Sel = '0' ELSE
				In_B WHEN Sel = '1';
END behavior;