library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.math_real.all;

-- TESTBENCH ONLY
-- Generates a clock signal with the provided frequency.
entity ClockGenerator is
  generic(f : real);
  port(clk : out std_logic);
end entity ClockGenerator;

architecture Behavior of ClockGenerator is
BEGIN
  ck_proc: process
    variable semi_period_ns : real := 1.0e9/(2.0 * f);
  BEGIN
    clk <= '1';
    wait for semi_period_ns * 1 ns;
    clk <= '0';
    wait for semi_period_ns * 1 ns;
  END process ck_proc;
END architecture Behavior;
