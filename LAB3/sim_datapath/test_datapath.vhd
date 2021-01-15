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
signal Instruction_in, DataMemDataOut : std_logic_vector (31 downto 0);

begin
  Dut: datapath
  port map(
    clk => clk,
	rst => rst,
	PCOut => open,
	Instruction => Instruction_in,
	DataMemRead => open,
	DataMemWrite => open,
	DataMemAddr => open,
	DataMemDataIn => open,
	DataMemDataOut => DataMemDataOut
  );

clk_proc :	process
variable clk_v : std_logic;
begin
	clk_v := clk;
	clk_v := not clk_v;
	wait for 2 ns;
	clk <= clk_v;
end process;




  process
  begin
    wait for 2 ns;
	rst <= '1';
    Instruction_in <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
	DataMemDataOut <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
    wait for 7 ns;
    Instruction_in <= "00000011100000101000001011111111";
	DataMemDataOut <= (others => '0');
  end process;
end architecture;
