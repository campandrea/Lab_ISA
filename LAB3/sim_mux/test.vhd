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

signal data_0_in, data_1_in, sel, data_out : std_logic;
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

  process
  begin
    wait for 2 ns;
    sel <= '0';
    wait for 7 ns;
    sel <= '1';
  end process;
end architecture;
