library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.math_real.all;

entity Memory is
	generic (word_size 	: integer := 32;
			     addr_size 	: integer := 32;
           start_addr : integer := 0;
           stop_addr  : integer := 1024
            );
	port (clk	   : in std_logic;
  		  chip_sel : in std_logic;
  		  rd	   : in std_logic;
        wr_n     : in std_logic;
  		  addr	   : in std_logic_vector(addr_size - 1 downto 0);
  		  data_in  : in std_logic_vector(word_size - 1 downto 0);
  		  data_out : out std_logic_vector(word_size - 1 downto 0)
         );
end Memory;

architecture Behavior of Memory is
	type memory_type is array(start_addr/4 to stop_addr/4) of std_logic_vector(word_size -1 downto 0);

	signal memory_data : memory_type;
begin
	write_proc: process(clk)
	begin
		if rising_edge(clk) then
			if chip_sel = '1' then
				if wr_n = '0' then
          if (to_integer(unsigned(addr(31 downto 2))) >= start_addr/4
                and to_integer(unsigned(addr(31 downto 2))) <= stop_addr/4) then
					             memory_data(to_integer(unsigned(addr(31 downto 2)))) <= data_in;
          end if;
				end if;
			end if;
		end if;
	end process;

    read_proc: process(rd, addr)
    begin
        if rd = '1' then
          if (to_integer(unsigned(addr(31 downto 2))) >= start_addr/4
                and to_integer(unsigned(addr(31 downto 2))) <= stop_addr/4) then
					             data_out <= memory_data(to_integer(unsigned(addr(31 downto 2))));
          end if;
        end if;
    end process;
END architecture Behavior;
