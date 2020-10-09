vlib work

vcom ../../FFT_type_pkg.vhd
vcom ../../butterfly.vhd
vcom ../../FFT.vhd
vcom ../testbench_FFT/File_IO_fft.vhd
vcom ../testbench_FFT/ClockGenerator.vhd
vcom ../testbench_FFT/testbench_FFT.vhd

vsim -c work.testbench_FFT

run 2 us

quit -f
