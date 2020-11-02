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
			a0, a1, a2 : IN signed (Nb-1 downto 0);
			b0, b1, b2 : IN signed (Nb-1 downto 0);

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
			R   : out signed(2*N -1 downto 0)
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
	signal a0_in, a1_in, a2_in, b0_in, b1_in, b2_in : signed(N_par -1 downto 0);
	
	signal sum_a_in_a, sum_a_in_b, sum_a_out : signed(N_par -1 downto 0);
	signal sum_b_in_a, sum_b_in_b, sum_b_out : signed(N_par -1 downto 0);
	signal sum_b1b2_b1, sum_b1b2_b2, sum_b1b2_out: signed(N_par -1 downto 0);
	
	signal mult_a2_out_2N, mult_b0_out_2N, mult_b1_out_2N, mult_b2_out_2N : signed(2*N_par-1 downto 0);
	signal mult_a2_out, mult_b0_out, mult_b1_out, mult_b2_out : signed(N_par-1 downto 0);
	signal mult_a2_in, mult_b0_in, mult_b1_in, mult_b2_in : signed(N_par -1 downto 0);

	signal rst : std_logic;
	signal count_tc : std_logic;
	signal VIN_samp : std_logic;
	signal DIN_samp : signed(N_par -1 downto 0);
	signal DIN_reg_signed : signed(N_par -1 downto 0);
    signal sat_out : signed(Nb-1 downto 0);

begin

	a0_in <= resize(a0, N_par);
	a1_in <= resize(a1, N_par);
	a2_in <= resize(a2, N_par);

	b0_in <= resize(b0, N_par);
	b1_in <= resize(b1, N_par);
	b2_in <= resize(b2, N_par);

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
		
		
	sum_a_in_a <= DIN_samp;
	
	sum_a : adder
	generic map (N => N_par)
	port map (
		A => sum_a_in_a,
		B => sum_a_in_b,
		R => sum_a_out
	);
	
	sum_b : adder
	generic map (N => N_par)
	port map (
		A => sum_b_in_a,
		B => sum_b_in_b,
		R => sum_b_out
	);
	
	sum_b1b2 : adder
	generic map (N => N_par)
	port map (
		A => sum_b1b2_b1,
		B => sum_b1b2_b2,
		R => sum_b1b2_out
	);

	mult_a2 : multiplier
		generic map (N => N_par)
		port map (
			A => mult_a2_in,
			B => a2_in,
			R => mult_a2_out_2N
		);
	
	mult_b0 : multiplier
		generic map (N => N_par)
		port map (
			A => mult_b0_in,
			B => b0_in,
			R => mult_b0_out_2N
		);
	
	mult_b1 : multiplier
		generic map (N => N_par)
		port map (
			A => mult_b1_in,
			B => b1_in,
			R => mult_b1_out_2N
		);
		
	mult_b2 : multiplier
		generic map (N => N_par)
		port map (
			A => mult_b2_in,
			B => b2_in,
			R => mult_b2_out_2N
		);
	
	-- tolti gli MSB derivanti dalla moltiplicazione e alcuni LSB
	mult_a2_out <= mult_a2_out_2N(N_par +Nb -2 downto Nb -1);
	mult_b0_out <= mult_b0_out_2N(N_par +Nb -2 downto Nb -1);
	mult_b1_out <= mult_b1_out_2N(N_par +Nb -2 downto Nb -1);
	mult_b2_out <= mult_b2_out_2N(N_par +Nb -2 downto Nb -1);
	 
	
	reg_a2_out : RegisterSigned
		generic map (N => N_par)
		port map (
			clk => CLK,
			en => VIN_samp,
			rst => rst,
			D => mult_a2_out,
			Q => sum_a_in_b
		);
		
	reg_mid_1 : RegisterSigned
		generic map (N => N_par)
		port map (
			clk => CLK,
			en => VIN_samp,
			rst => rst,
			D => sum_a_out,
			Q => mult_b1_in
		);
		
	reg_mid_2 : RegisterSigned
		generic map (N => N_par)
		port map (
			clk => CLK,
			en => VIN_samp,
			rst => rst,
			D => mult_b1_in,
			Q => mult_a2_in
		);
		
	reg_b0_in : RegisterSigned
		generic map (N => N_par)
		port map (
			clk => CLK,
			en => VIN_samp,
			rst => rst,
			D => sum_a_out,
			Q => mult_b0_in
	);
		
	reg_b0_out : RegisterSigned
		generic map (N => N_par)
		port map (
			clk => CLK,
			en => VIN_samp,
			rst => rst,
			D => mult_b0_out,
			Q => sum_b_in_a
		);
		
	reg_b1_out : RegisterSigned
		generic map (N => N_par)
		port map (
			clk => CLK,
			en => VIN_samp,
			rst => rst,
			D => mult_b1_out,
			Q => sum_b1b2_b1
		);
		
	reg_b2_in : RegisterSigned
		generic map (N => N_par)
		port map (
			clk => CLK,
			en => VIN_samp,
			rst => rst,
			D => mult_a2_in,
			Q => mult_b2_in
		);
		
	reg_b2_out : RegisterSigned
		generic map (N => N_par)
		port map (
			clk => CLK,
			en => VIN_samp,
			rst => rst,
			D => mult_b2_out,
			Q => sum_b1b2_b2
		);
		
	reg_b1b2_out : RegisterSigned
		generic map (N => N_par)
		port map (
			clk => CLK,
			en => VIN_samp,
			rst => rst,
			D => sum_b1b2_out,
			Q => sum_b_in_b
		);
		
	-- tolti gli MSB derivanti dalla moltiplicazione e gli LSB
	

	count : Counter
		generic map (N => 2)
		port map (
			clk => CLK,
			CE => VIN_samp,
			RST => rst,
			COUNT_MAX => "11",
			TC => count_tc
		);
		
	saturation: Saturator
		generic map ( 
			N_in => N_par,
			N_out => Nb)
		port map(
			NUM_IN => sum_b_out,
			NUM_OUT => sat_out
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



end architecture structure;
