library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity multiplier is
    generic(N: natural);
    port(
        A, B: in signed(N-1 downto 0);
        R   : out signed(N-1 downto 0)
    );
end entity multiplier;

architecture Behavior of multiplier is
	signal R_temp : signed (2*N -1 downto 0);
begin
    R_temp <= A*B;
	R <= R_temp(2*N -1 downto N);
end architecture Behavior;