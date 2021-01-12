library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Memory is
	generic (word_size : integer := 8;
			     addr_size : integer := 32;
           line_size : integer := 4 -- number of words to take each time
            );
	port (clk	   : in std_logic;
  		  chip_sel : in std_logic;
  		  rd	   : in std_logic;
        wr_n     : in std_logic;
  		  addr	   : in std_logic_vector(addr_size - 1 downto 0);
  		  data_in  : in std_logic_vector(line_size - 1 downto 0);
  		  data_out : in std_logic_vector(line_size - 1 downto 0)
         );
end Memory;

architecture Behavior of Memory is
  subtype data is std_logic_vector(word_size - 1 downto 0);
  type memory_type is array(0 to (2 ** addr_size) - 1) of data;

	signal memory : memory_type;
begin

	write_proc: process(clk)
    variable int_addr : integer;
	begin
    int_addr := to_integer(unsigned(addr));
		if rising_edge(clk) then
			if chip_sel = '1' then
				if wr_n = '0' then
          for i in 0 to line_size loop
					     memory(int_addr + i) <= data_in(31 - i*wordsize downto 24 - i*wordsize);
          end loop;
				end if;
			end if;
		end if;
	end process;

    read_proc: process(addr, rd)
      variable int_addr : integer;
      variable data_out_var : std_logic_vector(31 downto 0);
    begin
        int_addr := to_integer(unsigned(addr));
        if rd = '1' then
          for i in 0 to line_size loop 
            data_out_var(31 - i*wordsize downto 24 - i*wordsize) := memory(int_addr + i);
          end loop;
        end if;
        data_out <= data_out_var;
    end process;
END architecture Behavior;
