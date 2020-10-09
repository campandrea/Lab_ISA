library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.fixed_pkg.all;

package FFT_type_pkg is
        type FFT_vect_data is array(natural range <>) of sfixed (0 downto -23);
        type FFT_mat_data is array(natural range <>, natural range <>) of sfixed(0 downto -23);
        type FFT_mat_bit is array(natural range <>, natural range <>) of std_logic;
end package;
