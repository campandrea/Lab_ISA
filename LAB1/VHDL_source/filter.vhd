library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity IIR_filter is
	generic ( Nb : natural ); --Numero di bit
	port (
			CLK : IN std_logic;
			RST_n : IN std_logic;
			DIN : IN signed (Nb-1 downto 0);
			VIN : IN std_logic;
			a0, a1, a2, a3, a4, a5, a6, a7, a8 : IN signed (Nb-1 downto 0);
			b0, b1, b2, b3, b4, b5, b6, b7, b8 : IN signed (Nb-1 downto 0);
			
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
	
	
	
	--signals
	type sign_array_9 is array (8 downto 0) of signed (Nb-1 downto 0);
		all_a, all_b : sign_array_9; --a and b coefficients
		prod_a : sign_array_9; --multiplication results
		
	type sign_array_8 is array (7 downto 0) of signed (Nb-1 downto 0);
		 prod_b : sign_array_8;
		 reg_in, reg_out : sign_array_8;
		 sum_a, sum_b : sign_array_8; --sum results
		 
	signal rst : std_logic;
	signal count_tc : std_logic;
	signal VIN_samp : std_logic;
	signal DIN_samp : signed(Nb-1 downto 0);
		 
begin	
	
	all_a <= a0 & a1 & a2 & a3 & a4 & a5 & a6 & a7 & a8;
	all_b <= b0 & b1 & b2 & b3 & b4 & b5 & b6 & b7 & b8;
	rst <= not RST_n;
	
	DIN_reg : RegisterSigned
		generic map (N => Nb)
		port map (
			clk => CLK,
			en => '1',
			rst => rst,
			D => DIN,
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
	
	reg_gen : for i in 0 to 7 generate
		first_reg : if ( i = 0 ) generate
			reg0 : RegisterSigned
				generic map (N => Nb)
				port map (
					clk => CLK,
					en => VIN_samp,
					rst => rst,
					D => sum_b(0),
					Q => reg_out(0)
				);
		end generate first;
		
		other_reg : if ( i > 0 ) generate			
			reg_x : RegisterSigned 
				generic map (N => Nb)
				port map (
					clk => CLK,
					en => VIN_samp,
					rst => rst,
					D => reg_out(i-1),
					Q => reg_out(i)
				);
		end generate other_reg;
	end generate
	
	mult_b_gen : for i in 0 to 7 generate
		mult_b : multiplier
			generic map (N => Nb)
			port map (
				A => reg_out(i),
				B => all_b(i),
				R => prod_b(i)
			);
	end generate;
	
	add_b_gen : for i in 0 to 7 generate
		first_add_b : if ( i = 0 ) generate
			sum_b0 : adder
			generic map (N => Nb)
			port map (
				A => DIN_samp,
				B => sum_b(1),
				R => sum_b(0)
			);
		end generate first;
		
		mid_add_b : if ( i > 0 and i < 7 ) generate
			sum_bx : adder
			generic map (N => Nb)
			port map (
				A => prod_b(i-1),
				B => sum_b(i+1),
				R => sum_b(i)
			);
		end generate mid_add_b;
		
		last_add_b : if ( i = 7 ) generate
			sum_b7 : adder
			generic map (N => Nb)
			port map (
				A => prod_b(i-1),
				B => prod_b(i),
				R => sum_b(i)
			);
		end generate last_add_b;
	end generate;
	
	mult_a_gen : for i in 0 to 8 generate
		first_mult_a : if ( i = 0 ) generate
			mult_a0 : multiplier
			generic map ( N => Nb )
			port map (
				A => all_a(0),
				B => sum_b(0),
				R => mult_a(0)
			);
		end generate first_mult_a;
		
		other_mult_a : if ( i > 0 ) generate
			mult_ax : multiplier
			generic map ( N => Nb )
			port map (
				A => all_a(i),
				B => sum_b(reg_out(i-1)),
				R => mult_a(i)
			);
		end generate other_mult_a;
	end generate;

	add_a_gen : for i in 0 to 7 generate
		other_add_a : if ( i < 7 ) generate
			addx : adder
				generic map (N => Nb)
				port map (
					A => mult_a(i),
					B => sum_a(i+1),
					R => sum_a(i)
				);
		end generate other_add_a;
		
		last_add_a : if (i = 7) generate
			add_a7 : adder
			generic map (N => Nb)
				port map (
					A => mult_a(i),
					B => mult_a(i+1),
					R => sum_a(i)
				);
		end generate other_add_a;
	end generate;
	
	count : Counter
		generic map (N => 4);
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
			D => sum_a(0),
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