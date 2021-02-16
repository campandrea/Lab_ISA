library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity ALU_CU is
port(
    ALUOp   : in std_logic_vector (1 downto 0);
    funct3  : in std_logic_vector (2 downto 0);
    ALUCtrl : out std_logic_vector (3 downto 0)
);
end ALU_CU;

architecture behaviour of ALU_CU is
begin
    process(ALUOp, funct3)
    begin
        case ALUOp is

            when "00" => -- ADD
                ALUCtrl <= "0010";

            when "01" => -- SUB
                ALUCtrl <= "0110";

            when "10" => -- R-type
                case funct3 is

                    when "000" => -- ADD
                        ALUCtrl <= "0010";

					when "010" => -- COMPARE
						ALUCtrl <= "0011";

					when "100" => -- XOR
						ALUCtrl <= "0001";

					when "101" => -- R-shift
						ALUCtrl <= "0100";

					when "111" => -- AND
						ALUCtrl <= "0000";
						
					when "011" => -- ABS
						ALUCtrl <= "0111";

					when others => --
						ALUCtrl <= "1111";
                end case;

            when "11" => -- Bypass A
                ALUCtrl <= "0101";

                when others =>
                    ALUCtrl <= "1111";
            end case;
        end process;

end behaviour;
