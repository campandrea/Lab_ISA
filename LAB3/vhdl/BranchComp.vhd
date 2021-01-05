library ieee;
use ieee.std_logic_1164.all;

entity BranchComp is
port(
  data_in_A : in std_logic_vector (31 downto 0);
  data_in_B : in std_logic_vector (31 downto 0);
  BrEq      : in std_logic

);
end BranchComp;

architecture behaviour of BranchComp is
begin
    process(data_in_A, data_in_B)
	begin
        if(data_in_A = data_in_B) then
            BrEq <= '1';
        else
            BrEq <= '0';
        end if;
	end process;
end behaviour;
