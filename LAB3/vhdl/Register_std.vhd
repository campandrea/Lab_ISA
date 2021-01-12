library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Register_std is
port(
      data_in  : in std_logic;
      clk      : in std_logic;
      reg_rst  : in std_logic;
      reg_en   : in std_logic;
      data_out : out std_logic
);
end Register_std;

architecture rtl of Register_std is
begin
    proc_reg: process(clk)
    begin
        if rising_edge(clk) then
        	if reg_rst = '1' then
        	    data_out <= (others => '0');
            elsif reg_en = '1' then
                data_out <= data_in;
            end if;
        end if;
    end process;
end architecture;
