library ieee;
use ieee.std_logic_1164.all;

entity ImmGen is
port(
  Instruction : in std_logic_vector (24 downto 0);
  ImmSel      : in std_logic_vector (2 downto 0);
  Immediate   : out std_logic_vector (31 downto 0)
);
end ImmGen;

architecture behaviour of ImmGen is
begin
    -- ImmSel
    -- 000 -> I-type
    -- 001 -> S-type
    -- 010 -> B-type
    -- 011 -> U-type
    -- 100 -> J-type

    process(ImmSel, Instruction)
    begin
        case ImmSel is
            when "000" => -- Sign extension
                Immediate (11 downto 0) <= Instruction (24 downto 13);
                Immediate (31 downto 12) <= (others => Instruction (24));

            when "001" => -- Sign extension
                Immediate (4 downto 0) <= Instruction (4 downto 0);
                Immediate (11 downto 5) <= Instruction (24 downto 18);
                Immediate (31 downto 12) <= (others => Instruction (24));

            when "010" => -- Sign extension and shift 1 bit
                Immediate (0) <= '0';
                Immediate (4 downto 1) <= Instruction (4 downto 1);
                Immediate (10 downto 5) <= Instruction (23 downto 18);
                Immediate (11) <= Instruction (0);
                Immediate (31 downto 12) <= (others => Instruction (24));

            when "011" => -- Upper fill
                Immediate (11 downto 0) <= (others => '0');
                Immediate (31 downto 12) <= Instruction (24 downto 5);

            when "100" => -- Sign extension and shift 1 bit
                Immediate (0) <= '0';
                Immediate (10 downto 1) <= Instruction (23 downto 14);
                Immediate (11) <= Instruction (13);
                Immediate (19 downto 12) <= Instruction (12 downto 5);
                Immediate (31 downto 20) <= (others => Instruction (24));

            when others =>
                Immediate <= (others => '1');
                report "ImmSel not valid" severity warning;
        end case;
    end process;

end behaviour;
