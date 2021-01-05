library ieee;
use ieee.std_logic_1164.all;

entity PCInc is
port(
  PC_in : in std_logic_vector (31 downto 0);
  PC_out : out std_logic_vector (31 downto 0)
);
end PCInc;

architecture behaviour of PCInc is
begin
  process(PC_in)
  begin
    PC_out <= PC_in + 4;
  end process;
end behaviour;