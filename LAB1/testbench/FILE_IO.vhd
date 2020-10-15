library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;

entity File_IO is
  generic ( filename  : string;
            mode      : file_open_kind
          );

  port( clk      : IN  std_logic;
        en       : IN  std_logic;
        data_in  : IN  -- insert the correct type of data
        data_out : OUT -- also here
        eof      : OUT std_logic
      );
end entity File_IO;

architecture Behavior of File_IO is
    file f : text open mode is filename;

BEGIN
    interface_proc: process(clk)
        variable buf : line;
        variable n   : --insert the correct type
        -- variable i   : integer := 0;
        variable eof_var : std_logic := '0';

    BEGIN
        if clk'event and clk = '1' then
            if en = '1' then
                if mode = read_mode then
                    -- Read from file
                        if not endfile(f) then
                            eof <= '0';
                            readline(f, buf);
                            read(buf, n);
                            data_out <= n;
                        else
                            eof <= '1';
                        end if;
                else
                    -- Write on file
                        eof <= '0';
                        n := data_in;
                        write(buf, n);
                        writeline(f, buf);
                end if;
            end if;
        end if;
    END process interface_proc;
END architecture Behavior;
