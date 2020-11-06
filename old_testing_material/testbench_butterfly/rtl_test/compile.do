vlib work

vcom ../testbench_butterfly/ClockGenerator.vhd
vcom ../testbench_butterfly/File_IO.vhd
vcom ../../butterfly.vhd
vcom ../testbench_butterfly/rtl_test/testbench_butterfly_one_rtl.vhd
vcom ../testbench_butterfly/rtl_test/testbench_butterfly_pipe_rtl.vhd
vcom ../../CU/components/pupa_seq.vhd
vcom ../../CU/components/larva_seq.vhd
vcom ../../CU/CU.vhd
vcom ../../Datapath/Components/RoundingRom.vhd
vcom ../../Datapath/Butterfly_dp.vhd
vcom ../../../Components/Arithmetic/Adder.vhd
vcom ../../../Components/Memory/Register_SFP.vhd
vcom ../../CU/components/larva_cg.vhd
vcom ../../CU/components/pupa_cg.vhd
vcom ../../Datapath/Components/in_memory.vhd
vcom ../../../Components/Logic/mux2to1.vhd
vcom ../../../Components/Arithmetic/Subtractor.vhd
vcom ../../../Components/Arithmetic/Multiplier_shifter.vhd
vcom ../../../Components/Memory/Reg.vhd
vcom ../../../Components/Arithmetic/Incrementer.vhd


vsim -c work.testbench_butterfly_one_rtl

run 4 us

quit -f
