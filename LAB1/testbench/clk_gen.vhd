library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

entity clk_gen is
  port (
    EN	    : in std_logic;
    CLK     : out std_logic;
    RST_n   : out std_logic);
end clk_gen;

architecture beh of clk_gen is

  constant Ts : time := 10 ns;
  
  signal CLK_i : std_logic;
  
begin  -- beh

  process
  begin  -- process
    if (EN = '1') then
      if (CLK_i = 'U') then
        CLK_i <= '0';
      else
        CLK_i <= not(CLK_i);
      end if;
      wait for Ts/2;
    end if;
  end process;

  CLK <= CLK_i;

  process
  begin  -- process
    if (EN = '1') then
      RST_n <= '0';
      wait for 5*Ts/2;
      RST_n <= '1';
      wait;
    end if;
  end process;

end beh;
