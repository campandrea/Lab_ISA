library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_branchcomp is

end entity;

architecture behaviour of test_branchcomp is

component BranchComp 
port(
  data_in_A : in std_logic_vector (31 downto 0);
  data_in_B : in std_logic_vector (31 downto 0);
  BrEq      : out std_logic

);
end component;

signal data_in_A, data_in_B : std_logic_vector (31 downto 0);
signal BrEq : std_logic;

begin
	DUT : BranchComp
	port map(
		data_in_A => data_in_A,
		data_in_B => data_in_B,
		BrEq => BrEq
	);

	process
	begin
		wait for 2 ns;
		data_in_A <= (others => 'U');
		data_in_B <= (others => 'U');
		wait for 5 ns;
		data_in_A <= (others => 'X');
		data_in_B <= (others => 'X');
		wait for 5 ns;
		data_in_A <= "11100000000000000000000000000000";
		data_in_B <= "11100000000000000000000000000000";
		wait for 5 ns;
		data_in_A <= "11101111111000000000000000000000";
		data_in_B <= "11100000000000000000000000000000";
		wait;
	end process;

end architecture;