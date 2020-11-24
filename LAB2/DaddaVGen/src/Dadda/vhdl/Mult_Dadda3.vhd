library ieee;
use ieee.std_logic_1164.all;

entity Mult_Dadda3 is
generic(N : natural := 3);
port(x : in std_logic_vector(N - 1 downto 0);
y: in std_logic_vector(N - 1 downto 0);
z : out std_logic_vector(2*N - 1 downto 0));
end entity Mult_Dadda3;
architecture arch of Mult_Dadda3 is
component full_adder is
port(
a : in std_logic;
b : in std_logic;
cin : in  std_logic;
s : out std_logic;
cout : out std_logic);
end component;
component half_adder is
port(
a : in std_logic;
b : in std_logic;
s : out std_logic;
cout : out std_logic);
end component;

component mbe_ppg is
generic(n : natural := 32);
port(three_digits : in std_logic_vector(2 downto 0);--sign bit representation
a : in std_logic_vector(N-1 downto 0);
pp : out std_logic_vector(N downto 0);
neg : out std_logic);
end component;

type p_t is array (N/2 downto 0) of std_logic_vector(N downto 0);
signal p : p_t;
signal neg, n_neg : std_logic_vector(N/2 downto 0);
subtype s_t is std_logic_vector(10 downto 0);
signal S : s_t;
subtype cout_t is std_logic_vector(10 downto 0);
signal Cout : cout_t;
signal ppg0_three_digits, ppglast_three_digits : std_logic_vector(2 downto 0);
begin
ppg0_three_digits <= x(1 downto 0)&'0';
ppg0: mbe_ppg generic map(N) port map(ppg0_three_digits, y, P(0), neg(0));
F0: for i in 1 to n/2-1 generate
ppgi: mbe_ppg generic map(N) port map(x(2*i + 1 downto 2*i - 1), y, P(i), neg(i));
end generate;
ppglast_three_digits(n - 2*(n/2) downto 0) <= x(n - 1 downto 2*(n/2) -1);ppglast_three_digits(2 downto n - 2*(n/2) + 1) <= (others => '0');
ppglast: mbe_ppg generic map(N) port map(ppglast_three_digits, y, P(n/2), neg(n/2));
HA1 : half_adder port map(P(0)(2), P(1)(0), S(0), Cout(0));
HA2 : half_adder port map(P(0)(3), P(1)(1), S(1), Cout(1));
FA1 : full_adder port map('1', n_neg(0), P(1)(2), S(2), Cout(2));
HA3 : half_adder port map('1', P(1)(3), S(3), Cout(3));
HA4 : half_adder port map(P(0)(0), neg(0), S(4), Cout(4));
HA5 : half_adder port map(P(0)(1), Cout(4), S(5), Cout(5));
FA2 : full_adder port map(neg(1), S(0), Cout(5), S(6), Cout(6));
FA3 : full_adder port map(Cout(0), S(1), Cout(6), S(7), Cout(7));
FA4 : full_adder port map(Cout(1), S(2), Cout(7), S(8), Cout(8));
FA5 : full_adder port map(Cout(2), S(3), Cout(8), S(9), Cout(9));
FA6 : full_adder port map(n_neg(1), Cout(3), Cout(9), S(10), Cout(10));
F1: for i in 0 to neg'length-1 generate
n_neg(i) <= not neg(i);
end generate;
z(0) <= S(4);
z(1) <= S(5);
z(2) <= S(6);
z(3) <= S(7);
z(4) <= S(8);
z(5) <= S(9);

end architecture;