library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Saturator is
    generic(N_in : natural;
            N_out : natural);
    port(NUM_IN : IN signed(N_in-1 downto 0);
         NUM_OUT : OUT signed(N_out-1 downto 0));
end entity Saturator;

architecture Behavior of Counter is
    signal res1, res2: std_logic;
BEGIN
    res1 <= NUM_IN(N_out-1);
    andGen: for i in N_out to N_in -1 generate
        res1 <= res1 and NUM_IN(i);
    END generate andGen;

    res2 <= NUM_IN(N_out-1);
    norGen: for i in N_out to N_in -1 generate
        res2 <= res2 nor NUM_IN(i);
    END generate norGen;

    muxProc: process(res1, res2):
    BEGIN
        if res1 or res2 == '1' then
            NUM_OUT <= NUM_IN(N_out-1 downto 0);
        else
            if NUM_OUT(N_in-1) == '0' then
                NUM_OUT <= '0' & (others => '1');
            else
                NUM_OUT <= '1' & (others => '0');
            end if;
        end if;
    END process;
END architecture Behavior;
