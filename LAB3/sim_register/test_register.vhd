library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test_register is

end entity;

architecture behaviour of test_register is

  component Register_PC is
  generic( N : natural := 32);
  port(
        data_in  : in std_logic_vector (N-1 downto 0);
        clk      : in std_logic;
        reg_rst  : in std_logic;
        reg_en   : in std_logic;
        data_out : out std_logic_vector (N-1 downto 0)
  );
end component;

component Register_std is
port(
      data_in  : in std_logic;
      clk      : in std_logic;
      reg_rst  : in std_logic;
      reg_en   : in std_logic;
      data_out : out std_logic
);
end component;

component Register_vec is
generic( N : natural := 32);
port(
      data_in  : in std_logic_vector (N-1 downto 0);
      clk      : in std_logic;
      reg_rst  : in std_logic;
      reg_en   : in std_logic;
      data_out : out std_logic_vector (N-1 downto 0)
);
end component;

signal data_in_vec, data_in_pc : std_logic_vector (31 downto 0);
signal data_in_std : std_logic;
signal clk      : std_logic;
signal reg_rst  : std_logic;
signal reg_en   : std_logic;
signal data_out_vec, data_out_pc : std_logic_vector (31 downto 0);
signal data_out_std : std_logic;



begin

DUT1 : Register_PC
port map(
    data_in => data_in_pc,
    clk => clk,
    reg_rst => reg_rst,
    reg_en => reg_en,
    data_out => data_out_pc
);

DUT2 : Register_std
port map(
    data_in => data_in_std,
    clk => clk,
    reg_rst => reg_rst,
    reg_en => reg_en,
    data_out => data_out_std
);

DUT3 : Register_vec
port map(
    data_in => data_in_vec,
    clk => clk,
    reg_rst => reg_rst,
    reg_en => reg_en,
    data_out => data_out_vec
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
	data_in_vec <= (others => 'U');
	data_in_pc <= (others => 'U');
	data_in_std <= 'U';
  reg_rst <= 'U';
  reg_en <= 'U';
	wait for 2 ns;
  data_in_vec <= (others => 'X');
	data_in_pc <= (others => 'X');
	data_in_std <= 'X';
  reg_rst <= 'X';
  reg_en <= 'X';
	wait for 2 ns;
  reg_rst <= '1';
	wait for 2 ns;
  reg_rst <= '0';
  reg_en <= '1';
	wait for 2 ns;
  data_in_vec <= "11010110011110000101010101111010";
	data_in_pc <=  "10111111110000001111111100011110";
	data_in_std <= '1';
	wait for 4 ns;
  reg_en <= '0';
	wait;
end process;

end behaviour;
