LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux2to1_std is
    generic(N : natural := 32);
    port(
      data_0_in : in std_logic;
      data_1_in : in std_logic;
      sel : in std_logic;
      data_out : out  std_logic
    );
end mux2to1_std;

architecture behavior of mux2to1_std is
begin
	process(sel, data_0_in, data_1_in)
    begin
        case sel is
            when '0' =>
                data_out <= data_0_in;
            when '1' =>
                data_out <= data_1_in;
            when others =>
        end case;
    end process;
end behavior;
