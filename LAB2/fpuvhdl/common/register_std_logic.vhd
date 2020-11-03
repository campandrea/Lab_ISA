library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity register_std_logic is
    generic (
        N : natural
    );
    port (
        clk : in std_logic;
        en  : in std_logic;
        rst : in std_logic;
        D   : in std_logic_vector(N-1 downto 0);
        Q   : out std_logic_vector(N-1 downto 0)
);
end entity register_std_logic;


architecture rtl of register_std_logic is
begin
    proc_reg: process(clk)
    begin
        if rising_edge(clk) then
        	if rst = '1' then
        	    Q <= (others => '0');
            elsif en = '1' then
                Q <= D;
            end if;
        end if;
    end process;
end architecture;
