library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-- N bit Counter with terminal count calculation
entity Counter is
	generic(N: natural);
	port(
		clk 	  : IN std_logic;
		CE, RST : IN std_logic;
		COUNT_MAX : IN unsigned(N-1 downto 0);
		TC 	  : OUT std_logic);
end entity Counter;

architecture Behavior of Counter is

	component Comparator is
		generic(
			N: natural);
		port(
			A, B : IN unsigned(N-1 downto 0);
			EQ	  : OUT std_logic);
	end component;
	
	signal count : unsigned(N-1 downto 0);
BEGIN
	incProc: process(clk)
	BEGIN
		if clk'event and clk = '1' then
			if RST = '1' then
				count <= (others=>'0');
			elsif CE = '1' and TC /= 1 then
				count <= count + 1;
			end if;
		end if;
	END process;
	terminal_count_gen: Comparator
		generic map(
			N => N)
		port map(
			A => count,
			B => COUNT_MAX,
			EQ => TC);
END architecture Behavior;
