library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Register_PC is
generic( N : natural := 32);
port(
      data_in  : in std_logic_vector (N-1 downto 0);
      clk      : in std_logic;
      reg_rst  : in std_logic;
      reg_en   : in std_logic;
      data_out : out std_logic_vector (N-1 downto 0)
);
end Register_PC;

architecture rtl of Register_PC is
begin
    proc_reg: process(clk)
    begin
        if rising_edge(clk) then
        	if reg_rst = '1' then
        	    data_out <= x"00400000"; --starting PC
            elsif reg_en = '1' then
                data_out <= data_in;
            end if;
        end if;
    end process;
end architecture;
