library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_comp is

end entity;

architecture behavior of test_comp is

  component BranchComp is
  port(
    data_in_A : in std_logic_vector (31 downto 0);
    data_in_B : in std_logic_vector (31 downto 0);
    BrEq      : out std_logic

  );
end component;

signal data_in_A, data_in_B : std_logic_vector (31 downto 0);
signal BrEq     : std_logic;

begin

  DUt: BranchComp
  port map(
    data_in_A => data_in_A,
    data_in_B => data_in_B,
    BrEq => BrEq
  );


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
