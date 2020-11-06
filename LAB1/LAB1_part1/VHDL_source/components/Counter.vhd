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
	
	signal count : unsigned(N-1 downto 0);
BEGIN
	incProc: process(clk, COUNT_MAX)
		variable term : std_logic := '0';
		variable cnt : unsigned(N-1 downto 0);
	BEGIN
		if clk'event and clk = '1' then
			if RST = '1' then
				cnt := (others=>'0');
				term := '0';
			elsif CE = '1' and term /= '1' then
				cnt := cnt + 1;
			end if;
		end if;
		if cnt = COUNT_MAX then
			term := '1';
		else
			term := '0';
		end if;
		TC <= term;
	END process;
	
END architecture Behavior;
