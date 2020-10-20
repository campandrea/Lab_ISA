library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity IIR_filter is
	generic ( Nb : natural := 10; -- Numero di bit in uscita
			  N_par : natural := 12); --Parallelismo interno
	port (
			CLK : IN std_logic;
			RST_n : IN std_logic;
			DIN : IN signed (Nb-1 downto 0);
			VIN : IN std_logic;
			a0, a1 : IN signed (Nb-1 downto 0);
			b0, b1 : IN signed (Nb-1 downto 0);

			DOUT : OUT signed(Nb-1 downto 0);
			VOUT : OUT std_logic
		);
end entity IIR_filter;

architecture structure of IIR_filter is

	--components
	component RegisterSigned is
		generic ( N : natural );
		port (
			clk : in std_logic;
			en  : in std_logic;
			rst : in std_logic;
			D   : in signed(N-1 downto 0);
			Q   : out signed(N-1 downto 0)
		);
	end component;

	component multiplier is
		generic( N: natural );
		port(
			A, B: in signed(N-1 downto 0);
			R   : out signed(N -1 downto 0)
			);
	end component;

	component adder is
		generic(N: natural);
		port(
			A, B: in signed(N-1 downto 0);
			R   : out signed(N-1 downto 0)
		);
	end component;

	component Counter is
	generic(N: natural);
	port(
		clk 	  : IN std_logic;
		CE, RST : IN std_logic;
		COUNT_MAX : IN unsigned(N-1 downto 0);
		TC 	  : OUT std_logic
		);
	end component;

	component FF is
    port(
        clk : in std_logic;
        en  : in std_logic;
        rst : in std_logic;
        D   : in std_logic;
        Q   : out std_logic
		);
	end component;

    component Saturator is
        generic(N_in : natural;
                N_out : natural);
        port(NUM_IN : IN signed(N_in-1 downto 0);
             NUM_OUT : OUT signed(N_out-1 downto 0));
    end component;

	--signals
	signal a0_in, a1_in, b0_in, b1_in : signed(N_par -1 downto 0);
	
	signal prod_a1 : signed(N_par -1 downto 0); --multiplication results
	signal prod_b0, prod_b1 : signed(N_par -1 downto 0);
	
	signal reg_out : signed(N_par -1 downto 0);
	signal sum_a0, sum_b0 : signed(N_par -1 downto 0); --sum results

	signal rst : std_logic;
	signal count_tc : std_logic;
	signal VIN_samp : std_logic;
	signal DIN_samp : signed(N_par -1 downto 0);
	signal DIN_reg_signed : signed(N_par -1 downto 0);
    signal sat_out : signed(Nb-1 downto 0);

begin

	a0_in <= resize(a0, N_par);
	a1_in <= resize(a1, N_par);

	b0_in <= resize(b0, N_par);
	b1_in <= resize(b1, N_par);

	rst <= not RST_n;

	DIN_reg_signed <= resize(DIN, N_par);
	
	DIN_reg : RegisterSigned
		generic map (N => N_par)
		port map (
			clk => CLK,
			en => '1',
			rst => rst,
			D => DIN_reg_signed,
			Q => DIN_samp
		);

	VIN_reg : FF
		port map (
			clk => CLK,
			en => '1',
			rst => rst,
			D => VIN,
			Q => VIN_samp
		);

	reg0 : RegisterSigned
		generic map (N => N_par)
		port map (
			clk => CLK,
			en => VIN_samp,
			rst => rst,
			D => sum_a0,
			Q => reg_out
		);

	mult_b0 : multiplier
		generic map (N => N_par)
		port map (
			A => sum_a0,
			B => b0_in,
			R => prod_b0
		);
		
	mult_b1 : multiplier
		generic map (N => N_par)
		port map (
			A => reg_out,
			B => b1_in,
			R => prod_b1
		);

	add_b0 : adder
	generic map (N => N_par)
	port map (
		A => prod_b0,
		B => prod_b1,
		R => sum_b0
	);


	mult_a0 : multiplier
	generic map ( N => N_par )
	port map (
		A => reg_out,
		B => a1_in,
		R => prod_a1
	);


	add_a0 : adder
		generic map (N => N_par)
		port map (
			A => DIN_samp,
			B => prod_a1,
			R => sum_a0
		);

	count : Counter
		generic map (N => 4)
		port map (
			clk => CLK,
			CE => VIN_samp,
			RST => rst,
			COUNT_MAX => "1001",
			TC => count_tc
		);

	DOUT_reg : RegisterSigned
		generic map ( N => Nb )
		port map (
			clk => CLK,
			en => VIN_samp,
			rst => rst,
			D => sat_out,
			Q => DOUT
		);

	VOUT_reg : FF
		port map (
			clk => CLK,
			en => '1',
			rst => rst,
			D => count_tc,
			Q => VOUT
		);

    saturation: Saturator
        generic map ( N_in => N_par,
                      N_out => Nb)
        port map(
            NUM_IN => sum_b0,
            NUM_OUT => sat_out
        );

end architecture structure;
