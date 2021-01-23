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
		Mux_proc : process(In_A, In_B, Sel, Cin)
			BEGIN
			IF (Sel = '0') THEN
				Cout <= Cin(0);
				Z <= In_A;
			END IF;
			IF (Sel = '1') THEN
				Cout <= Cin(1);
				Z <= In_B;
			END IF;
		END process Mux_proc;
END behavior;