library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_forw is

end entity;

architecture behavior of test_forw is

  component ForwardUnit is
  port(
    Rs1_ID : in std_logic_vector (4 downto 0);
    Rs2_ID : in std_logic_vector (4 downto 0);
    Rd_EX : in std_logic_vector (4 downto 0);
    Rd_MEM : in std_logic_vector (4 downto 0);
    RegWrite_EX : in std_logic;
    RegWrite_MEM : in std_logic;
    ForwardA : out std_logic_vector (1 downto 0);
    ForwardB : out std_logic_vector (1 downto 0)
  );
end component;

signal Rs1_ID, Rs2_ID, Rd_EX, Rd_MEM : std_logic_vector (4 downto 0);
signal RegWrite_EX, RegWrite_MEM : std_logic;
signal ForwardA, ForwardB : std_logic_vector (1 downto 0);

begin

  DUt: ForwardUnit
  port map(
  Rs1_ID => Rs1_ID,
  Rs2_ID => Rs2_ID,
  Rd_EX => Rd_EX,
  Rd_MEM => Rd_MEM,
  RegWrite_EX => RegWrite_EX,
  RegWrite_MEM => RegWrite_MEM,
  ForwardA => ForwardA,
  ForwardB => ForwardB
  );

  process
  begin
    wait for 2 ns;
    Rs1_ID <= "XXXXX";
    Rs2_ID <= "XXXXX";
    RegWrite_EX <= 'X';
    Rd_EX <= "XXXXX";
    wait for 7 ns;
    Rs1_ID <= "01000";
    RegWrite_MEM <= '1';
    Rd_EX <= "01010";
    Rd_MEM <= "01000";
  end process;
end architecture;
