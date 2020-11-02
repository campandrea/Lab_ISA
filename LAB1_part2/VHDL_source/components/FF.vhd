library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity FF is
    port(
        clk : in std_logic;
        en  : in std_logic;
        rst : in std_logic;
        D   : in std_logic;
        Q   : out std_logic
    );
end entity;


architecture rtl of FF is
begin
    proc_ff: process(clk)
    begin
        if rising_edge(clk) then
            if en = '1' then
                if rst = '1' then
                    Q <= '0';
                else
                    Q <= D;
                end if;
            end if;
        end if;
    end process;
end architecture;
