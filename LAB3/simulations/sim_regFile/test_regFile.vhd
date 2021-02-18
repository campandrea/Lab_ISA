library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_regFile is

end entity;

architecture behaviour of test_regFile is

component RegisterFile
	port
	(
		clk         : in std_logic;
		data_in     : in std_logic_vector (31 downto 0);
		write_addr  : in std_logic_vector (4 downto 0);
		data_out_A  : out std_logic_vector (31 downto 0);
		data_out_B  : out std_logic_vector (31 downto 0);
		read_A_addr : in std_logic_vector (4 downto 0);
		read_B_addr : in std_logic_vector (4 downto 0);
		write_en    : in std_logic
	);
end component;

signal clk, write_en : std_logic;
signal data_in, data_out_A, data_out_B : std_logic_vector (31 downto 0);
signal write_addr, read_A_addr, read_B_addr : std_logic_vector (4 downto 0);

begin

	RegFile : RegisterFile
	port map(
		clk         => clk,
		data_in     => data_in,
		write_addr  => write_addr,
		data_out_A  => data_out_A,
		data_out_B  => data_out_B,
		read_A_addr => read_A_addr,
		read_B_addr => read_B_addr,
		write_en    => write_en
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

	data_proc : process
	begin
		data_in <= (others => 'U');
		write_addr <= (others => 'U');
		read_A_addr <= (others => 'U');
		read_B_addr <= (others => 'U');
		write_en <= 'X';
		wait for 3 ns;
		data_in <= (others => 'X');
		write_addr <= (others => 'X');
		read_A_addr <= (others => 'X');
		read_B_addr <= (others => 'X');
		write_en <= 'X';
		wait for 3 ns;
		data_in <= (others => '1');
		write_addr <= "00001";
		write_en <= '1';
		wait for 4 ns;
		data_in <= (others => '0');
		write_addr <= "00000";
		write_en <= '1';
		read_A_addr <= "00001";
		wait for 4 ns;
		read_B_addr <= "00000";
    write_en <= '0';
		wait;

	end process;
end behaviour;
