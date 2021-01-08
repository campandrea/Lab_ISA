library ieee;
use ieee.std_logic_1164.all;

entity ForwardUnit is
port(
  Rs1_ID : in std_logic_vector (4 downto 0);
  Rs2_ID : in std_logic_vector (4 downto 0);
  Rd_EX : in std_logic_vector (4 downto 0);
  Rd_MEM : in std_logic_vector (4 downto 0);
  RegWrite_EX : in std_logic;
  RegWrite_MEM : in std_logic;
  ForwardA : out std_logic_vector (1 downto 0);
  ForwardB : out std_logic_vector (1 downto 0)
);
end ForwardUnit;


-- ForwardX 00 -> no Forward
-- ForwardX 10 -> Forward from EX
-- ForwardX 11 -> Forward from MEM

architecture behaviour of ForwardUnit is
begin
  process (Rs1_ID, Rd_EX, RegWrite_EX, Rd_MEM, RegWrite_MEM)
  begin
    ForwardA <= "00";
    if (Rs1_ID = Rd_EX) then
      if (RegWrite_EX = '1' and Rd_EX /= "00000") then
        ForwardA <= "10";
      end if;
    elsif (Rs1_ID = Rd_MEM) then
      if (RegWrite_MEM = '1' and Rd_EX /= "00000") then
        ForwardA <= "11";
      end if;
    end if;
  end process;

  process (Rs2_ID, Rd_EX, RegWrite_EX, Rd_MEM, RegWrite_MEM)
  begin
    ForwardB <= "00";
    if (Rs2_ID = Rd_EX) then
      if (RegWrite_EX = '1' and Rd_EX /= "00000") then
        ForwardB <= "10";
      end if;
    elsif (Rs2_ID = Rd_MEM) then
      if (RegWrite_MEM = '1' and Rd_EX /= "00000") then
        ForwardB <= "11";
      end if;
    end if;
  end process;

end architecture;

-- CASI RISOLTI
--add t0, t1, t2
--sub t5, t0, t4

--add t0
--xxxx
--sub t5, t0

--add t0, 
--add t0,
--add t5, t0, t4

--add t0, .....
--add t1, ....
--add t5, t1, t0 */

/* CASI NON RISOLTI
ld t0, ...
add t5, t0, ...
*/