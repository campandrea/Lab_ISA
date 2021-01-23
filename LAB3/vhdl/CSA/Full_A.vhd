LIBRARY ieee;
use ieee.std_logic_1164.all;

ENTITY Full_A IS
	PORT
	(
		In_A, In_B	: in	std_logic;
		Cin			: in	std_logic;
		Cout, S		: out	std_logic
	);
END ENTITY;

ARCHITECTURE behavior OF Full_A	IS
	BEGIN
		Cout	<=	(((In_A XOR In_B) AND Cin) OR (In_A AND In_B));
		S		<=	((In_A XOR In_B) XOR Cin);
END behavior ;