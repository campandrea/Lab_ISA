library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_ALU_CU is

end entity;

architecture behavior of test_ALU_CU is

  component ALU_CU is
    port(
        ALUOp   : in std_logic_vector (1 downto 0);
        funct3  : in std_logic_vector (2 downto 0);
        ALUCtrl : out std_logic_vector (3 downto 0)
    );
end component;

signal ALUOp : std_logic_vector(1 downto 0);
signal funct3 : std_logic_vector (2 downto 0);
signal ALUCtrl : std_logic_vector(3 downto 0);

begin

  DUT: ALU_CU
  port map(
      ALUOp => ALUOp,
      funct3 => funct3,
      ALUCtrl =>ALUCtrl
      );

  process
  begin
    ALUOp <= "UU";
    funct3 <= "UUU";
    wait for 3 ns;
    ALUOp <= "XX";
    funct3 <= "XXX";
    wait for 3 ns;
    ALUOp <= "00";
    wait for 3 ns;
    ALUOp <= "01";
    wait for 3 ns;
    ALUOp <= "10";
    wait for 3 ns;
    funct3 <= "000";
    wait for 3 ns;
    funct3 <= "010";
    wait for 3 ns;
    funct3 <= "100";
    wait for 3 ns;
    funct3 <= "101";
    wait for 3 ns;
    funct3 <= "111";
    wait for 3 ns;
    funct3 <= "001";
    wait for 3 ns;
    ALUOp <= "11";
    wait;
  end process;
end architecture;
