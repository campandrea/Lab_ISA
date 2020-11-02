!#etc/bash

source /software/scripts/init_msim6.2g
vcom -93 -work ./work ../testbench/*.vhd
vcom -93 -work ./work ../VHDL_source/components/*.vhd
vcom -93 -work ./work ../VHDL_source/IIR_filter.vhd
vlog -work ./work ../testbench/Tb_filter_IIR.v
vlog -work ./work ../syn/netlist/IIR_filter.v
vsim -L /software/dk/nangate45/verilog/msim6.2g work.Tb_filter_IIR &
vsim -L /software/dk/nangate45/verilog/msim6.2g -sdftyp /Tb_filter_IIR/DUT=../syn/netlist/IIR_filter_period_min.sdf work.Tb_filter_IIR &
vcd file ./vcd/IIR_filter.vcd &
vcd add /TB_filter_IIR/DUT/* &
run 2 us &


