LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY RegisterFile IS
	PORT
	(
		clk         : in std_logic;
		data_in     : in std_logic_vector (31 downto 0);
		write_addr  : in std_logic_vector (4 downto 0);
		data_out_A  : out std_logic_vector (31 downto 0);
		data_out_B  : out std_logic_vector (31 downto 0);
		read_A_addr : in std_logic_vector (4 downto 0);
		read_B_addr : in std_logic_vector (4 downto 0);
		write_en    : in std_logic
	);
END ENTITY;

ARCHITECTURE behavior OF RegisterFile IS
	
	TYPE Register_file IS ARRAY (0 TO 31) OF std_logic_vector(31 downto 0);
	signal reg_file : Register_file := (OTHERS =>(OTHERS => '0'));
	BEGIN
		CLK_proc : process(clk)
			BEGIN
				IF Rising_Edge(clk) THEN
					IF write_en = '0' THEN
						data_out_A <= reg_file(to_integer(unsigned(read_A_addr)));
						data_out_B <= reg_file(to_integer(unsigned(read_B_addr)));
					ELSE 
						reg_file(to_integer(unsigned(write_addr))) <= data_in;
					END IF;
				END IF;
		END process CLK_proc;
END behavior;
