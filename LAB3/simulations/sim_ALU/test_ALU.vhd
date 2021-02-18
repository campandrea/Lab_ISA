library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_ALU is

end entity;

architecture behaviour of test_ALU is

component ALU
	port
	(
		data_in_A : in std_logic_vector (31 downto 0);
		data_in_B : in std_logic_vector (31 downto 0);
		ALUCtrl   : in std_logic_vector (3 downto 0);
		data_out  : out std_logic_vector (31 downto 0)
	);
end component;

signal data_in_A, data_in_B, data_out : std_logic_vector (31 downto 0);
signal ALUCtrl : std_logic_vector (3 downto 0);

begin
DUT : ALU
port map(
	data_in_A => data_in_A,
	data_in_B => data_in_B,
	ALUCtrl => ALUCtrl,
	data_out => data_out
);

process
begin
	data_in_A <= (others => 'U');
	data_in_B <= (others => 'U');
	ALUCtrl <= (others => 'U');
	wait for 2 ns;
	data_in_A <= (others => 'X');
	data_in_B <= (others => 'X');
	ALUCtrl <= (others => 'X');
	wait for 2 ns;
	ALUCtrl <= "0010";
	data_in_A <= (others => '0');
	data_in_B <= (others => '0');
	wait for 2 ns;
	data_in_B <= "00000000000000000000000000000001";
	data_in_A <= "00000000000000000000000111000000";
	wait for 2 ns;
	ALUCtrl <= "0110";
	wait for 2 ns;
	ALUCtrl <= "0001";
	wait for 2 ns;
	ALUCtrl <= "0000";
	wait for 2 ns;
	ALUCtrl <= "0011";
	wait for 2 ns;
	ALUCtrl <= "0100";
	wait for 2 ns;
	ALUCtrl <= "0101";
	wait for 2 ns;
	ALUCtrl <= "1111";
	wait;	
end process;

end behaviour;