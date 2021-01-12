library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity PCInc is
port(
    PC_in  : in std_logic_vector (31 downto 0);
    PC_out : out std_logic_vector (31 downto 0)
);
end PCInc;

architecture behaviour of PCInc is
begin
    process(PC_in)
    variable PC : signed(31 downto 0);
    begin
        PC := signed(PC_in);
        PC := PC + 4;
        PC_out <= std_logic_vector(PC);
    end process;
end behaviour;
