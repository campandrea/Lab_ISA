library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity test is

end entity;

architecture behavior of test is

  component mux2to1_std is
      generic(N : natural := 32);
      port(
        data_0_in : in std_logic;
        data_1_in : in std_logic;
        sel : in std_logic;
        data_out : out  std_logic
      );
  end component;
  
  component mux2to1_vec
    generic(N : natural := 32);
    port(
      data_0_in : in std_logic_vector (N-1 downto 0);
      data_1_in : in std_logic_vector (N-1 downto 0);
      sel : in std_logic;
      data_out : out  std_logic_vector (N-1 downto 0)
    );
	end component;

component mux4to1
generic(N : natural := 32);
port(
  data_00_in : in std_logic_vector (N-1 downto 0);
  data_01_in : in std_logic_vector (N-1 downto 0);
  data_10_in : in std_logic_vector (N-1 downto 0);
  data_11_in : in std_logic_vector (N-1 downto 0);
  sel : in std_logic_vector (1 downto 0);
  data_out : out  std_logic_vector (N-1 downto 0)
);
end component;

signal data_0_in, data_1_in, sel, data_out, selVec : std_logic;
signal data0vec, data1vec, dataOutvec : std_logic_vector (31 downto 0);

begin



  dut: mux2to1_std
  port map(
    data_0_in => data_0_in,
    data_1_in => data_1_in,
    sel => sel,
	data_out => data_out
  );

  data_0_in <= '0';
  data_1_in <= '1';
  
	dut_2 : mux2to1_vec
	port map(
	  data_0_in => data0vec,
	  data_1_in => data1vec,
	  sel => selVec,
	  data_out => dataOutvec
	);
	

	process
	begin
		data0vec <= (others => 'U');
		data1vec <= (others => 'U');
		selVec <= 'U';
		wait for 2 ns;
		data0vec <= (others => 'X');
		data1vec <= (others => 'X');
		selVec <= 'X';
		sel <= '0';
		wait for 5 ns;
		data0vec <= (others => '0');
		data1vec <= (others => '1');
		selVec <= '0';
		sel <= '1';
		wait for 5 ns;
		selVec <= '1';
		wait;
	end process;
end architecture;
