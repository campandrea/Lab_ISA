library IEEE;
use IEEE.std_logic_1164.all;

entity tb_clock is
end entity tb_clock;

architecture beh of tb_clock is

component clk_gen is
  port (
    EN_N    : in std_logic;
    CLK     : out std_logic;
    RST_n   : out std_logic);
end component;

signal EN_N, CLK, RST_n : std_logic;

begin
	
	clk_comp: clk_gen
		port map( EN_N => EN_N,
				  CLK => CLK,
				  RST_n => RST_n);
	tb_proc: process
	begin
		EN_N <= '1';
		wait for 100 ns;
		EN_N <= '0';
		wait for 500 ns;
		EN_N <= '1';
		wait;
	end process;
	
end architecture beh;
