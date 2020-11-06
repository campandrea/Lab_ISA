library verilog;
use verilog.vl_types.all;
entity tb_fpmul_pipeline is
    generic(
        Nb              : integer := 32
    );
    port(
        END_SIM_i       : out    vl_logic
    );
end tb_fpmul_pipeline;
