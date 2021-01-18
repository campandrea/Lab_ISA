library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_PCinc is

end entity;

architecture behaviour of test_PCinc is

component PCInc 
port(
    PC_in  : in std_logic_vector (31 downto 0);
    PC_out : out std_logic_vector (31 downto 0)
);
end component;

signal PC_in, PC_out : std_logic_vector (31 downto 0);

begin
	PC_inc : PCInc
	port map(
		PC_in => PC_in,
		PC_out => PC_out
		);
	
	process
	begin
		PC_in <= (others => 'U');
		wait for 5 ns;
		PC_in <= (others => 'X');
		wait for 5 ns;
		PC_in <= (others => '0');
		wait for 5 ns;
		PC_in <= "00000111110000000000000000000000";
		wait;
	end process;

end behaviour;