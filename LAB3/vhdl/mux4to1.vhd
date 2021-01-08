LIBRARY ieee;
USE ieee.std_logic_1164.all;

entity mux4to1 is
generic(N : natural := 32);
port(
  data_00_in : in std_logic_vector (N-1 downto 0);
  data_01_in : in std_logic_vector (N-1 downto 0);
  data_10_in : in std_logic_vector (N-1 downto 0);
  data_11_in : in std_logic_vector (N-1 downto 0);
  sel : in std_logic_vector (1 downto 0);
  data_out : out  std_logic_vector (N-1 downto 0)
);
end mux4to1;

architecture behavior of mux4to1 is
begin
	process(sel, data_00_in, data_01_in, data_10_in, data_11_in)
    begin
        case sel is
            when "00" =>
                data_out <= data_00_in;
            when "01" =>
                data_out <= data_01_in;
            when "10" =>
                data_out <= data_10_in;
            when "11" =>
                data_out <= data_11_in;
            when others =>
                data_out <= (others => '1');
                report "sel not valid" severity warning;
        end case;
    end process;
end behavior;
