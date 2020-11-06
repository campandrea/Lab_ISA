library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity Stimuli_generator is
  generic ( filename  : string);

  port( clk      : IN  std_logic;
        en       : IN  std_logic;
        data_out : OUT signed(9 downto 0);
        eof      : OUT std_logic
      );
end entity Stimuli_generator;

architecture Behavior of Stimuli_generator is
    file f : text open read_mode is filename;

BEGIN
    interface_proc: process(clk)
        variable buf : line;
        variable n   : std_logic_vector(9 downto 0);
        variable eof_var : std_logic := '0';

    BEGIN
        if clk'event and clk = '1' then
            if en = '1' then
                    -- Read from file
                        if not endfile(f) then
                            eof <= '0';
                            readline(f, buf);
                            read(buf, n);
                            data_out <= signed(n);
                        else
                            eof <= '1';
                        end if;
            end if;
        end if;
    END process interface_proc;
END architecture Behavior;
