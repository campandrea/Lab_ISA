library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_hazard is

end entity;

architecture behaviour of test_hazard is

component HazardDetUnit
port(
  Rs1_IF : in std_logic_vector (4 downto 0);
  Rs2_IF : in std_logic_vector (4 downto 0);
  Rd_ID : in std_logic_vector (4 downto 0);
  MemRead_ID : in std_logic;
  BrEq : in std_logic;
  BrInstr_ID : in std_logic;
  IF_RegEn : out std_logic;
  PC_RegEn : out std_logic;
  ID_RegSel : out std_logic;
  IF_RegSel : out std_logic;
  PCSel : out std_logic
);
end component;

signal  Rs1_IF, Rs2_IF, Rd_ID : std_logic_vector (4 downto 0);
signal  MemRead_ID, BrEq, BrInstr_ID : std_logic;
signal  IF_RegEn, PC_RegEn, ID_RegSel, IF_RegSel, PCSel : std_logic;


begin
DUT : HazardDetUnit
port map(
  Rs1_IF => Rs1_IF ,
  Rs2_IF => Rs2_IF,
  Rd_ID => Rd_ID,
  MemRead_ID => MemRead_ID,
  BrEq => BrEq,
  BrInstr_ID => BrInstr_ID,
  IF_RegEn => IF_RegEn,
  PC_RegEn => PC_RegEn,
  ID_RegSel => ID_RegSel,
  IF_RegSel => IF_RegSel,
  PCSel => PCSel
);

process
begin
	Rs1_IF <= (others => 'U');
	Rs2_IF <= (others => 'U');
	Rd_ID <= (others => 'U');
  MemRead_ID <= 'U';
  BrEq <= 'U';
  BrInstr_ID <= 'U';
	wait for 2 ns;
  Rs1_IF <= (others => 'X');
  Rs2_IF <= (others => 'X');
  Rd_ID <= (others => 'X');
  MemRead_ID <= 'X';
  BrEq <= 'X';
  BrInstr_ID <= 'X';
	wait for 2 ns;
  Rs1_IF <= "10011";
  Rd_ID <= "10011";
  MemRead_ID <= '1';
	wait for 2 ns;
  Rs1_IF <= (others => 'X');
  Rd_ID <= (others => 'X');
  MemRead_ID <= 'X';
	wait for 2 ns;
  Rs2_IF <= "10111";
  Rd_ID <= "10111";
  MemRead_ID <= '1';
	wait for 2 ns;
  BrInstr_ID <= '1';
  wait for 2 ns;
  BrEq <= '1';
	wait;
end process;

end behaviour;
