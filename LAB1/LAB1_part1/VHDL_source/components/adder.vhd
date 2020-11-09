library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity adder is
    generic(N: natural);
    port(
        A, B: in signed(N-1 downto 0);
        R   : out signed(N-1 downto 0)
    );
end entity adder;

architecture Behavior of adder is
    
begin
    R <= A+B;
	
end architecture Behavior;