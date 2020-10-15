library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity RegisterSigned is
    generic (
        N : natural
    );
    port (
        clk : in std_logic;
        en  : in std_logic;
        rst : in std_logic;
        D   : in signed(N-1 downto 0);
        Q   : out signed(N-1 downto 0)
);
end entity RegisterSigned;


architecture rtl of RegisterSigned is
begin
    proc_reg: process(clk)
    begin
        if rising_edge(clk) then
            if en = '1' then
                if rst = '1' then
                    Q <= (others => '0');
                else
                    Q <= D;
                end if;
            end if;
        end if;
    end process;
end architecture;
