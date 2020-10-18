library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity IIR_filter is
	generic ( Nb : natural := 10 ); --Numero di bit
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
	type sign_array_9 is array (8 downto 0) of signed (Nb downto 0);
	signal	all_a, all_b : sign_array_9; --a and b coefficients
	signal	prod_a : sign_array_9; --multiplication results
	signal mult_a : sign_array_9;
		
	type sign_array_8 is array (7 downto 0) of signed (Nb downto 0);
	signal	 prod_b : sign_array_8;
	signal	 reg_in, reg_out : sign_array_8;
	signal	 sum_a, sum_b : sign_array_8; --sum results
		 
	signal rst : std_logic;
	signal count_tc : std_logic;
	signal VIN_samp : std_logic;
	signal DIN_samp : signed(Nb downto 0);
	signal din_merged : signed (Nb downto 0);
		 
begin	
	
	all_a(0) <= a0(Nb-1) & a0;
	all_a(1) <= a1(Nb-1) & a1;
	all_a(2) <= a2(Nb-1) & a2;
	all_a(3) <= a3(Nb-1) & a3;
	all_a(4) <= a4(Nb-1) & a4;
	all_a(5) <= a5(Nb-1) & a5;
	all_a(6) <= a6(Nb-1) & a6;
	all_a(7) <= a7(Nb-1) & a7;
	all_a(8) <= a8(Nb-1) & a8;
	
	all_b(0) <= b0(Nb-1) & b0;
	all_b(1) <= b1(Nb-1) & b1;
	all_b(2) <= b2(Nb-1) & b2;
	all_b(3) <= b3(Nb-1) & b3;
	all_b(4) <= b4(Nb-1) & b4;
	all_b(5) <= b5(Nb-1) & b5;
	all_b(6) <= b6(Nb-1) & b6;
	all_b(7) <= b7(Nb-1) & b7;
	all_b(8) <= b8(Nb-1) & b8;
	
	rst <= not RST_n;
	din_merged <= DIN(Nb-1) & DIN;
	DIN_reg : RegisterSigned
		generic map (N => Nb+1)
		port map (
			clk => CLK,
			en => '1',
			rst => rst,
			D => din_merged,
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
				generic map (N => Nb+1)
				port map (
					clk => CLK,
					en => VIN_samp,
					rst => rst,
					D => sum_b(0),
					Q => reg_out(0)
				);
		end generate first_reg;
		
		other_reg : if ( i > 0 ) generate			
			reg_x : RegisterSigned 
				generic map (N => Nb+1)
				port map (
					clk => CLK,
					en => VIN_samp,
					rst => rst,
					D => reg_out(i-1),
					Q => reg_out(i)
				);
		end generate other_reg;
	end generate reg_gen;
	
	mult_b_gen : for i in 0 to 7 generate
		mult_b : multiplier
			generic map (N => Nb+1)
			port map (
				A => reg_out(i),
				B => all_b(i),
				R => prod_b(i)
			);
	end generate;
	
	add_b_gen : for i in 0 to 7 generate
		first_add_b : if ( i = 0 ) generate
			sum_b0 : adder
			generic map (N => Nb+1)
			port map (
				A => DIN_samp,
				B => sum_b(1),
				R => sum_b(0)
			);
		end generate first_add_b;
		
		mid_add_b : if ( i > 0 and i < 7 ) generate
			sum_bx : adder
			generic map (N => Nb+1)
			port map (
				A => prod_b(i-1),
				B => sum_b(i+1),
				R => sum_b(i)
			);
		end generate mid_add_b;
		
		last_add_b : if ( i = 7 ) generate
			sum_b7 : adder
			generic map (N => Nb+1)
			port map (
				A => prod_b(i-1),
				B => prod_b(i),
				R => sum_b(i)
			);
		end generate last_add_b;
	end generate add_b_gen;
	
	mult_a_gen : for i in 0 to 8 generate
		first_mult_a : if ( i = 0 ) generate
			mult_a0 : multiplier
			generic map ( N => Nb+1 )
			port map (
				A => all_a(0),
				B => sum_b(0),
				R => mult_a(0)
			);
		end generate first_mult_a;
		
		other_mult_a : if ( i > 0 ) generate
			mult_ax : multiplier
			generic map ( N => Nb+1 )
			port map (
				A => all_a(i),
				B => reg_out(i-1),
				R => mult_a(i)
			);
		end generate other_mult_a;
	end generate;

	add_a_gen : for i in 0 to 7 generate
		other_add_a : if ( i < 7 ) generate
			addx : adder
				generic map (N => Nb+1)
				port map (
					A => mult_a(i),
					B => sum_a(i+1),
					R => sum_a(i)
				);
		end generate other_add_a;
		
		last_add_a : if (i = 7) generate
			add_a7 : adder
			generic map (N => Nb+1)
				port map (
					A => mult_a(i),
					B => mult_a(i+1),
					R => sum_a(i)
				);
		end generate last_add_a;
	end generate add_a_gen;
	
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
			D => sum_a(0)(Nb downto 1),
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
