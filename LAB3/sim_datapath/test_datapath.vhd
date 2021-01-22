library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_datapath is

end test_datapath;

architecture behavior of test_datapath is

component datapath is
port(
	clk : in std_logic;
	rst : in std_logic;
	PCOut : out std_logic_vector (31 downto 0);
	Instruction : in std_logic_vector (31 downto 0);
	DataMemRead : out std_logic;
	DataMemWrite : out std_logic;
	DataMemAddr : out std_logic_vector (31 downto 0);
	DataMemDataIn : out std_logic_vector (31 downto 0);
	DataMemDataOut : in std_logic_vector (31 downto 0)
);
end component;

signal clk, rst : std_logic;
signal Instruction_in, DataMemDataOut, PCOut : std_logic_vector (31 downto 0);

begin


  Dut: datapath
  port map(
    clk => clk,
	rst => rst,
	PCOut => PCOut,
	Instruction => Instruction_in,
	DataMemRead => open,
	DataMemWrite => open,
	DataMemAddr => open,
	DataMemDataIn => open,
	DataMemDataOut => DataMemDataOut
  );

  clk_proc : process
	begin
		clk <= 'U';
		wait for 2 ns;
		clk <= 'X';
		wait for 3 ns;
		for i in 0 to 1024 loop
			clk <= '0';
			wait for 2 ns;
			clk <= '1';
			wait for 2 ns;
		end loop;
	end process;




  process
  begin
    wait for 2 ns;
    rst <= '1';
    Instruction_in <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    DataMemDataOut <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    wait for 8 ns;
    rst <= '0';
    Instruction_in (31 downto 7) <= "0000000000010000100000001";
    Instruction_in (6 downto 0) <= "0010011"; -- addi x1, x1, 1
	  DataMemDataOut <= (others => '0');
    wait for 4 ns;
    Instruction_in (31 downto 7) <= "0000000001010000000000100";
    Instruction_in (6 downto 0) <= "0010011"; -- addi x4, x0, 5
    wait for 4 ns;
    Instruction_in (31 downto 7) <= "0000000001110000000000101";
    Instruction_in (6 downto 0) <= "0010011"; -- addi x5, x0, 7
    wait for 4 ns;
    Instruction_in (31 downto 7) <= "0000000001110000000000110";
    Instruction_in (6 downto 0) <= "0010011"; -- addi x6, x0, 7
    wait for 4 ns;
    Instruction_in (31 downto 7) <= "0000001001100010100000110";
    Instruction_in (6 downto 0) <= "1100011"; -- beq x5, x6, 19
    wait for 4 ns;
    Instruction_in (31 downto 7) <= "0000000000010000100000001";
    Instruction_in (6 downto 0) <= "0010011"; -- addi x1, x1, 1
    wait for 4 ns;
    Instruction_in (31 downto 7) <= "0000000000010000100000001";
    Instruction_in (6 downto 0) <= "0010011"; -- addi x1, x1, 1
    wait for 4 ns;
    Instruction_in (31 downto 7) <= "0000000000010000100000001";
    Instruction_in (6 downto 0) <= "0010011"; -- addi x1, x1, 1
    wait for 4 ns;
    Instruction_in (31 downto 7) <= "0000000000010000100000001";
    Instruction_in (6 downto 0) <= "0010011"; -- addi x1, x1, 1
    wait for 4 ns;
    Instruction_in (31 downto 7) <= "0000000000010000001000001";
    Instruction_in (6 downto 0) <= "0100011"; -- sw x0, x1, 1
    wait for 4 ns;
    Instruction_in (31 downto 7) <= "0000000000000000000000000";
    Instruction_in (6 downto 0) <= "0010011"; -- addi x0, x0, 0


  wait;
  end process;
end architecture;
