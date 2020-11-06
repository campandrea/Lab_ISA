library verilog;
use verilog.vl_types.all;
entity Tb_filter_IIR is
    generic(
        Nb              : integer := 10
    );
    port(
        END_SIM_i       : out    vl_logic
    );
end Tb_filter_IIR;
