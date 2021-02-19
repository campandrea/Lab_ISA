library verilog;
use verilog.vl_types.all;
entity datapath is
    port(
        clk             : in     vl_logic;
        rst             : in     vl_logic;
        PCOut           : out    vl_logic_vector(31 downto 0);
        Instruction     : in     vl_logic_vector(31 downto 0);
        DataMemRead     : out    vl_logic;
        DataMemWrite    : out    vl_logic;
        DataMemAddr     : out    vl_logic_vector(31 downto 0);
        DataMemDataIn   : out    vl_logic_vector(31 downto 0);
        DataMemDataOut  : in     vl_logic_vector(31 downto 0)
    );
end datapath;
