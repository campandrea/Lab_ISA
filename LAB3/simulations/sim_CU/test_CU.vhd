library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_CU is

end entity;

architecture behavior of test_CU is

  component CU is
    PORT(
      Instruction : IN std_logic_vector (31 downto 0);
      MemRead     : OUT std_logic;
      MemWrite    : OUT std_logic;
      WBSel       : OUT std_logic_vector (1 downto 0);
      ImmSel      : OUT std_logic_vector (2 downto 0);
      ALUOp       : OUT std_logic_vector (1 downto 0);
      ALUSrcA     : OUT std_logic;
      ALUSrcB     : OUT std_logic;
  	  BrInstr		: OUT std_logic;
      RegWrite    : OUT std_logic
    );
  end component;

signal Instruction : std_logic_vector (31 downto 0);
signal MemRead     : std_logic;

begin
  Dut: CU
  port map(
    Instruction => Instruction,
    MemRead => MemRead,
    MemWrite => open,
    WBSel => open,
    ImmSel => open,
    ALUOp => open,
    ALUSrcA => open,
    ALUSrcB => open,
    BrInstr => open,
    RegWrite => open
  );



  process
  begin
    wait for 2 ns;
    Instruction <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    wait for 7 ns;
    Instruction <= "00000011100000101000001011111111";
  end process;
end architecture;
