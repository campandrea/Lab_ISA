library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity HazardDetUnit is
port(
  Rs1_IF : in std_logic_vector (4 downto 0);
  Rs2_IF : in std_logic_vector (4 downto 0);
  Rd_ID : in std_logic_vector (4 downto 0);
  MemRead_ID : in std_logic;
  BrEq : in std_logic;
  BrInstr_ID : in std_logic;
  IF_RegEn : out std_logic;
  PC_RegEn : out std_logic;
  ID_RegSel : out std_logic;
  IF_RegSel : out std_logic;
  PCSel : out std_logic
);
end HazardDetUnit;

architecture behaviour of HazardDetUnit is
begin
  Hazard_proc : process(Rs1_IF, Rs2_IF, Rd_ID, MemRead_ID, BrEq, BrInstr_ID)
  begin
    PC_RegEn <= '1';
    IF_RegEn <= '1';
	 IF_RegSel <= '0';
	 ID_RegSel <= '0';
    PCSel <= '0';
    LoadHazard_if: if (unsigned(Rs1_IF) = unsigned(Rd_ID) or unsigned(Rs2_IF) = unsigned(Rd_ID)) then
      if (MemRead_ID = '1' and unsigned(Rd_ID) /= "00000") then
        ID_RegSel <= '1';
        PC_RegEn <= '0';
        IF_RegEn <= '0';
      end if;
    end if;
	 
	 BranchTaken_if: if (BrInstr_ID = '1' and BrEq = '1') then
      IF_RegSel <= '1';
      PCSel <= '1';
      ID_RegSel <= '1';
    end if;
	 
  end process;


end architecture;
