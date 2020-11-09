library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Saturator is
    generic(N_in : integer;
            N_out : integer);
    port(NUM_IN : IN signed(N_in-1 downto 0);
         NUM_OUT : OUT signed(N_out-1 downto 0));
end entity Saturator;

architecture Behavior of Saturator is
    signal res1, res2: std_logic;
	signal res : std_logic;
BEGIN

	negproc: process(NUM_IN)
		variable res : std_logic;
	BEGIN
		res := NUM_IN(N_out-1);
		andFor: for i in N_out to N_in-1 loop
			res := res and NUM_IN(i);
		end loop;
		res1 <= res;
	END process;
	
	posproc: process(NUM_IN)
		variable res : std_logic;
	BEGIN
		res := not NUM_IN(N_out-1);
		for i in N_out to N_in-1 loop
			res := res and not NUM_IN(i);
		end loop;
		res2 <= res;
	END process;
	
	res <= res1 or res2;
	
    muxProc: process(res, NUM_IN)
    	variable output : signed(N_out -1 downto 0);
    BEGIN
        if res = '1' then
            output := NUM_IN(N_out-1 downto 0);
        else
            if NUM_IN(N_in-1) = '0' then
                output(N_out-1) := '0';
                output(N_out-2 downto 0) := (others => '1');
            else
                output(N_out-1) := '1';
				output(N_out-2 downto 0) := (others => '0');
            end if;
        end if;
        NUM_OUT <= output;
    END process;
    
END architecture Behavior;
