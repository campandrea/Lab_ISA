onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench_butterfly/DUT/comp_dp/mult_reg/clk
add wave -noupdate /testbench_butterfly/DUT/comp_dp/mult_reg/rst
add wave -noupdate /testbench_butterfly/DUT/comp_dp/mult_reg/en
add wave -noupdate -radix sfixed /testbench_butterfly/DUT/comp_dp/mult_reg/D
add wave -noupdate -radix sfixed /testbench_butterfly/DUT/comp_dp/mult_reg/Q
add wave -noupdate /testbench_butterfly/start
add wave -noupdate /testbench_butterfly/done
add wave -noupdate /testbench_butterfly/rst
add wave -noupdate /testbench_butterfly/clk
add wave -noupdate -radix sfixed /testbench_butterfly/A_IN
add wave -noupdate -radix sfixed /testbench_butterfly/B_IN
add wave -noupdate -radix sfixed /testbench_butterfly/A_OUT
add wave -noupdate -radix sfixed /testbench_butterfly/B_OUT
add wave -noupdate /testbench_butterfly/eof
add wave -noupdate /testbench_butterfly/read_inputs
add wave -noupdate /testbench_butterfly/write_outputs
add wave -noupdate /testbench_butterfly/DUT/comp_dp/multiplier_sh/clk
add wave -noupdate /testbench_butterfly/DUT/comp_dp/multiplier_sh/mult_shN
add wave -noupdate -radix sfixed /testbench_butterfly/DUT/comp_dp/multiplier_sh/A
add wave -noupdate -radix sfixed /testbench_butterfly/DUT/comp_dp/multiplier_sh/B
add wave -noupdate -radix sfixed /testbench_butterfly/DUT/comp_dp/multiplier_sh/M
add wave -noupdate -radix sfixed /testbench_butterfly/DUT/comp_dp/multiplier_sh/SH
add wave -noupdate /testbench_butterfly/DUT/comp_dp/multiplier_sh/in_reg_LE
add wave -noupdate /testbench_butterfly/DUT/comp_dp/multiplier_sh/out_reg_LE
add wave -noupdate -radix sfixed /testbench_butterfly/DUT/comp_dp/multiplier_sh/A_1
add wave -noupdate -radix sfixed /testbench_butterfly/DUT/comp_dp/multiplier_sh/B_1
add wave -noupdate -radix sfixed /testbench_butterfly/DUT/comp_dp/multiplier_sh/A_2
add wave -noupdate -radix sfixed /testbench_butterfly/DUT/comp_dp/multiplier_sh/B_2
add wave -noupdate /testbench_butterfly/DUT/comp_cu/comp_larva_cg/state
add wave -noupdate /testbench_butterfly/DUT/comp_cu/comp_pupa_cg/state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {481286 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 91
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {525 ns}
