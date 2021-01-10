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
			
		Comb_Proc: process(data_in_A ,data_in_B, ALUCtrl)
			variable A_tmp, B_tmp : SIGNED(31 downto 0);
			BEGIN
				A_tmp := SIGNED(data_in_A);
				B_tmp := SIGNED(data_in_B);
				
				CASE ALUCtrl IS
					WHEN "0010" => 	data_out <= std_logic_vector(A_tmp + B_tmp);		--Add
					WHEN "0110" => 	data_out <= std_logic_vector(A_tmp - B_tmp);		--SUB
					WHEN "0001" =>  data_out <= data_in_A XOR data_in_B;				--XOR
					WHEN "0000" =>  data_out <= data_in_A AND data_in_B;				--AND
					
					WHEN "0011" =>	if data_in_A < data_in_B THEN						--COMPARE
										data_out <=	"00000000000000000000000000000001";
									ELSE
										data_out <= "00000000000000000000000000000000";
									END IF;
					WHEN "0100" =>	data_out <= std_logic_vector(shift_right(unsigned(A_tmp), to_integer(B_tmp)));					
					WHEN "0101" =>	data_out <= data_in_A;
					WHEN OTHERS =>  data_out <= (OTHERS => '0');
				END CASE;
		end process Comb_Proc;

		
END structural;
	
	
	
	
	
	