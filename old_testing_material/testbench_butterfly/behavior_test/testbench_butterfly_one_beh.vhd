library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
use IEEE.fixed_pkg.all;

entity testbench_butterfly_one_beh is
end entity testbench_butterfly_one_beh;

architecture Behavior of testbench_butterfly_one_beh is

    component ClockGenerator is
        generic(f : real);
        port(clk : out std_logic);
    end component;

    component File_IO is
      generic ( filename : string;
                mode      : file_open_kind);

      port( clk       : IN  std_logic;
            en        : IN  std_logic;
            data_in   : IN  sfixed (0 downto -23);
            data_out  : OUT sfixed (0 downto -23);
            eof       : OUT std_logic);
    end component;

    component Butterfly is
        port(
    	   clk   : IN  std_logic;
           --inputs
           start : IN std_logic;
           rst   : IN std_logic;
           A_IN  : IN sfixed (0 downto -23);
           B_IN  : IN sfixed (0 downto -23);
           W_RE  : IN sfixed (0 downto -23);
           W_IM  : IN sfixed (0 downto -23);
           -- outputs
           done  : OUT std_logic;
           A_OUT : OUT sfixed (0 downto -23);
           B_OUT : OUT sfixed (0 downto -23)
    	   );
    end component;

    constant clock_freq : real := 25.0e6; -- 25 MHz
    constant clock_period_ms : time := (1000 ms)/clock_freq;
    constant filename_batch : string := "../testbench_butterfly/";
    constant W_RE_const : sfixed (0 downto -23) := "111100000000000000000000";
    constant W_IM_const : sfixed (0 downto -23) := "011110000000000000000000";

    signal start, done, rst, clk: std_logic;
    signal A_IN, B_IN, A_OUT, B_OUT : sfixed (0 downto -23);
    signal eof : std_logic;
    signal read_inputs, write_outputs : std_logic;

BEGIN

    clock: ClockGenerator
        generic map ( f => clock_freq)
        port map( clk => clk);

    input_A: File_IO
        generic map(
                    filename => filename_batch & "Files/Input_A.txt",
                    mode => read_mode
                    )
        port map(
                clk => clk,
                en => read_inputs,
                data_in => (others => '0'),
                data_out => A_IN,
                eof => eof
                    );

    input_B: File_IO
        generic map(
            filename => filename_batch & "Files/Input_B.txt",
            mode => read_mode
                    )
        port map(
            clk => clk,
            en => read_inputs,
            data_in => (others => '0'),
            data_out => B_IN,
            eof => eof
                );


    DUT: entity work.Butterfly(Behavior)
    port map(
            clk => clk,
            start => start,
            rst => rst,
            A_IN => A_IN,
            B_IN => B_IN,
            W_RE => W_RE_const,
            W_IM => W_IM_const,
            done => done,
            A_OUT => A_OUT,
            B_OUT => B_OUT
    );

    output_A: File_IO
    generic map(
                filename => filename_batch & "Files/Output_A_exp.txt",
                mode => write_mode
                )
    port map(
            clk => clk,
            en => write_outputs,
            data_in => A_OUT,
            data_out => open,
            eof => open
    );

    output_B: File_IO
    generic map(
                filename => filename_batch & "Files/Output_B_exp.txt",
                mode => write_mode
                )
    port map(
            clk => clk,
            en => write_outputs,
            data_in => B_OUT,
            data_out => open,
            eof => open
    );

    one_cycle_proc: process
    BEGIN
        -- inizializzo le variabili
        start <= '0';
        rst <= '1';
        read_inputs <= '0';
        write_outputs <= '0';
        wait for 1*clock_period_ms;
        rst <= '0';
        wait for 1*clock_period_ms;
        --inizio una trasmissione
        read_inputs <= '1';
        wait for clock_period_ms/10;
        start <= '1';
        wait for 2*clock_period_ms;
        start <= '0';
        read_inputs <= '0';
        --aspetto che la DUT faccia le operazioni
        wait until (done'event and done = '1');
        --salvo su file i risultati
        write_outputs <= '1';
        wait until (done'event and done = '0');
        write_outputs <= '0';
        wait;
    END process;

END architecture Behavior;
