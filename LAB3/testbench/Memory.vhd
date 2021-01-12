library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity Memory is
	generic (word_size 	: integer := 32;
			     addr_size 	: integer := 32
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
	subtype data is std_logic_vector(word_size - 1 downto 0);
	type memory_type is array(0 to (2 ** addr_size) - 1) of data;

	signal memory : memory_type;
begin
	write_proc: process(clk)
	begin
		if rising_edge(clk) then
			if chip_sel = '1' then
				if wr_n = '0' then
					memory(to_integer(unsigned(addr(31 downto 2)))) <= data_in;
				end if;
			end if;
		end if;
	end process;

    read_proc: process(addr)
    begin
        if rd = '1' then
            data_out <= memory(to_integer(unsigned(addr(31 downto 2))));
        end if;
    end process;
END architecture Behavior;
