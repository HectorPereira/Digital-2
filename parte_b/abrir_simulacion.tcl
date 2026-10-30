set base [file normalize [file join [file dirname [info script]] ..]]
open_project [file join $base build vivado_parte_b lab3_parte_b.xpr]
launch_simulation
log_wave -r /*
restart
remove_wave [get_waves *]
add_wave /tb_parte_B/clk /tb_parte_B/rst
add_wave -radix unsigned /tb_parte_B/A /tb_parte_B/B
add_wave /tb_parte_B/dut/en
add_wave -radix unsigned /tb_parte_B/dut/op /tb_parte_B/dut/resultado
run all
