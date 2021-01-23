library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity CU is
  PORT(
    Instruction : IN std_logic_vector (31 downto 0);
    MemRead     : OUT std_logic;
    MemWrite    : OUT std_logic;
    WBSel       : OUT std_logic_vector (1 downto 0);
    ImmSel      : OUT std_logic_vector (2 downto 0);
    ALUOp       : OUT std_logic_vector (1 downto 0);
    ALUSrcA     : OUT std_logic;
    ALUSrcB     : OUT std_logic;
	BrInstr	   	: OUT std_logic;
	JmpInstr	: OUT std_logic;
    RegWrite    : OUT std_logic
  );
end CU;

architecture behaviour of CU is
	signal OpCode : std_logic_vector (6 downto 0);
begin
  OpCode <= Instruction(6 downto 0);
	process(OpCode)
	begin
	  MemRead <= '0';
	  MemWrite <= '0';
	  WBSel <= "00";
		-- 00 -> from ALU
		-- 01 -> from MEM
		-- 10 -> PC + 4

	  ImmSel <= "000";
		-- 000 -> I-type
		-- 001 -> S-type
		-- 010 -> B-type
		-- 011 -> U-type
		-- 100 -> J-type
    -- 111 -> R-type (for forwarding unit)

	  ALUOp <= "00";
		-- 00 -> ADD
		-- 01 -> SUB
		-- 10 -> R-type (decode funct3)
		-- 11 -> Bypass A
	  ALUSrcA <= '0';
	  ALUSrcB <= '0';
	  BrInstr <= '0';
	  JmpInstr <= '0';
	  RegWrite <= '0';

	  case OpCode is

		when "0110011" => -- ADD, XOR, SLT (R-type)
      ImmSel <= "111";
		  RegWrite <= '1';
		  ALUOp <= "10";

		when "0010011" => -- ADDI, SRAI, ANDI (I-type)
		  ImmSel <= "000";
		  ALUOp <= "10";
		  ALUSrcB <= '1';
		  RegWrite <= '1';

		when "0010111" => -- AUIPC (U-type) add immediate to PC
		  ImmSel <= "011";
		  ALUSrcA <= '1'; -- prende il PC
		  ALUSrcB <= '1'; -- prende immediate
		  RegWrite <= '1';

		when "0110111" => -- LUI (U-type) load upper immediate
		  ImmSel <= "011";
		  ALUOp <= "11";
		  ALUSrcB <= '1';
		  RegWrite <= '1';

		when "1100011" => -- BEQ (B-type)
		  ALUSrcA <= '1'; -- prende PC
		  ALUSrcB <= '1'; -- prende immediate
		  BrInstr <= '1'; -- avvisa hazard detection unit
		  ImmSel <= "010";
		  ALUOp <= "00"; -- ADD

		when "0000011" => -- LW (I-type)
		  MemRead <= '1';
		  WBSel <= "01";
		  ImmSel <= "000";
		  ALUSrcB <= '1';
		  ALUOp <= "00"; -- ADD
		  RegWrite <= '1';

		when "1101111" => -- JAL (J-type)
		  WBSel <= "10"; -- PC + 4
		  ALUSrcA <= '1'; -- prende PC
		  ALUSrcB <= '1'; -- prende immediate
		  ImmSel <= "100";
		  ALUOp <= "00"; -- ADD
		  RegWrite <= '1';
		  JmpInstr <= '1';

		when "0100011" => -- SW (S-type)
		  MemWrite <= '1';
		  ALUSrcB <= '1';---------------------------------------------------------------------------------------------------
		  ALUOp <= "00"; -- ADD
		  ImmSel <= "001";

		when "0000000" =>
    MemRead <= '0';

    when others =>

	  end case;
	end process;

end behaviour;
