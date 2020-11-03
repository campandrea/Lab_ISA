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
        data_in  : IN  std_logic_vector(31 downto 0)
      );
end entity Output_Sink;

architecture Behavior of Output_Sink is
    file f : text open write_mode is filename;

BEGIN
    interface_proc: process(clk)
        variable buf : line;
        variable n   : std_logic_vector(31 downto 0);--insert the correct type
        variable eof_var : std_logic := '0';

    BEGIN
        if clk'event and clk = '1' then
            if en = '1' then
				-- Write on file
                n := data_in;
                hwrite(buf, n);
                writeline(f, buf);
            end if;
        end if;
    END process interface_proc;
END architecture Behavior;
