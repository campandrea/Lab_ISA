library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.fixed_pkg.all;
use ieee.std_logic_textio.all;

library std;
use std.textio.all;
use WORK.FFT_type_pkg.all;

entity File_IO_FFT is
  generic ( filename  : string;
            mode      : file_open_kind
          );

  port( clk      : IN  std_logic;
        en       : IN  std_logic;
        data_in  : IN  FFT_vect_data(0 to 15);
        data_out : OUT FFT_vect_data(0 to 15);
        eof      : OUT std_logic
      );
end entity File_IO_FFT;

architecture Behavior of File_IO_FFT is
    file f : text open mode is filename;

BEGIN
    interface_proc: process(clk)
        variable buf : line;
        variable n   : sfixed(0 downto -23);
        -- variable i   : integer := 0;
        variable eof_var : std_logic := '0';

    BEGIN
        if clk'event and clk = '1' then
            if en = '1' then
                if mode = read_mode then
                    -- Read from file
                    for i in 0 to 15 loop
                        if not endfile(f) then
                            eof <= '0';
                            readline(f, buf);
                            read(buf, n);
                            data_out(i) <= n;
                        else
                            eof <= '1';
                        end if;
                    end loop;

                    --while i < 16 or eof_var = '1' loop
                    --    if not endfile(f) then
                    --        eof <= '0';
                    --        readline(f, buf);
                    --        read(buf, n);
                    --        data_out(i) <= n;
                    --        i := i + 1;
                    --    else
                    --        eof_var := '1';
                    --        eof <= '1';
                    --    end if;
                    --end loop;
                else
                    -- Write on file
                    for i in 0 to 15 loop
                        eof <= '0';
                        n := data_in(i);
                        write(buf, n);
                        writeline(f, buf);
                    end loop;
                end if;
            end if;
        end if;
    END process interface_proc;
END architecture Behavior;
