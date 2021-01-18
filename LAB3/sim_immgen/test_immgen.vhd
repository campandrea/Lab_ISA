library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_immgen is

end entity;

architecture behavior of test_immgen is

  component ImmGen is
  port(
    Instruction : in std_logic_vector (24 downto 0);
    ImmSel      : in std_logic_vector (2 downto 0);
    Immediate   : out std_logic_vector (31 downto 0)
  );
end component;

signal data_in_A, data_in_B : std_logic_vector (31 downto 0);
signal BrEq     : std_logic;

begin



  process
  begin
    wait for 2 ns;
    data_in_A <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    data_in_B <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    wait for 7 ns;
    data_in_A <= "00000000000000000111010100001100";
    data_in_B <= "00000000000000000111010100001100";
  end process;
end architecture;
