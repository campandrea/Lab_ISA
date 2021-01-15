LIBRARY ieee;
USE ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY ALU IS
	PORT
	(
		data_in_A : in std_logic_vector (31 downto 0);
		data_in_B : in std_logic_vector (31 downto 0);
		ALUCtrl   : in std_logic_vector (3 downto 0);
		data_out  : out std_logic_vector (31 downto 0)
	);
END ALU;

ARCHITECTURE structural OF ALU IS

	BEGIN

		Comb_Proc: process(ALUCtrl)
			BEGIN
				CASE ALUCtrl IS
					WHEN "0010" => 	data_out <= std_logic_vector(SIGNED(data_in_A) + SIGNED(data_in_B));		--Add
					WHEN "0110" => 	data_out <= std_logic_vector(SIGNED(data_in_A) - SIGNED(data_in_B));		--SUB
					WHEN "0001" =>  data_out <= data_in_A XOR data_in_B;				--XOR
					WHEN "0000" =>  data_out <= data_in_A AND data_in_B;				--AND

					WHEN "0011" =>	if unsigned(data_in_A) < unsigned(data_in_B) THEN						--COMPARE
										data_out <=	"00000000000000000000000000000001";
									ELSE
										data_out <= "00000000000000000000000000000000";
									END IF;
					WHEN "0100" =>	data_out <= std_logic_vector(shift_right(unsigned(data_in_A), to_integer(SIGNED(data_in_B))));
					WHEN "0101" =>	data_out <= data_in_A;
					WHEN OTHERS =>  data_out <= (OTHERS => '0');
				END CASE;
		end process Comb_Proc;


END structural;
