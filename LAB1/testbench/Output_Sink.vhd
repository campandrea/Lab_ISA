library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity Output_Sink is
  generic ( filename  : string);

  port( clk      : IN  std_logic;
        en       : IN  std_logic;
        data_in  : IN  signed(9 downto 0);
        eof      : OUT std_logic
      );
end entity Output_Sink;

architecture Behavior of Output_Sink is
    file f : text open write_mode is filename;

BEGIN
    interface_proc: process(clk)
        variable buf : line;
        variable n   : signed(9 downto 0);--insert the correct type
        variable i   : integer := 0;
        variable eof_var : std_logic := '0';

    BEGIN
        if clk'event and clk = '1' then
            if en = '1' then
				-- Write on file
				eof <= '0';
                n := data_in;
                i := to_integer(n);
                write(buf, i);
                writeline(f, buf);
            end if;
        end if;
    END process interface_proc;
END architecture Behavior;
