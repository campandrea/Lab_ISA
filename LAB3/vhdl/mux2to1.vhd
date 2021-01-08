LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux2to1 is
    generic(N : natural := 32);
    port(
      data_0_in : in std_logic_vector (N-1 downto 0);
      data_1_in : in std_logic_vector (N-1 downto 0);
      sel : in std_logic;
      data_out : out  std_logic_vector (N-1 downto 0)
    );
end mux2to1;

architecture behavior of mux2to1 is
begin
	process(sel, data_0_in, data_1_in)
    begin
        case sel is
            when "0" =>
                data_out <= data_0_in;
            when "1" =>
                data_out <= data_1_in;
            when others =>
                data_out <= (others => '1');
                report "sel not valid" severity warning;
        end case;
    end process;
end behavior;
