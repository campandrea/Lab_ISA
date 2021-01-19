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

signal Instruction : std_logic_vector(24 downto 0);
signal ImmSel : std_logic_vector (2 downto 0);
signal Immediate : std_logic_vector(31 downto 0);

begin

  DUT: ImmGen
  port map(
    Instruction => Instruction,
    ImmSel => ImmSel,
    Immediate => Immediate
  );

  process
  begin
    Instruction <= "UUUUUUUUUUUUUUUUUUUUUUUUU";
    ImmSel <= "UUU";
    wait for 3 ns;
    Instruction <= "XXXXXXXXXXXXXXXXXXXXXXXXX";
    ImmSel <= "XXX";
    wait for 3 ns;
    ImmSel <= "000";
    wait for 3 ns;
    Instruction <= "0000000000111010100001100";
    wait for 3 ns;
    ImmSel <= "001";
    wait for 3 ns;
    ImmSel <= "010";
    wait for 3 ns;
    ImmSel <= "011";
    wait for 3 ns;
    ImmSel <= "100";
    wait for 3 ns;
    ImmSel <= "101";
    wait;
  end process;
end architecture;
