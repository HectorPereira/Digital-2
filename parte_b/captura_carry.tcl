set base [file normalize [file join [file dirname [info script]] ..]]
create_project lab3_carry [file join $base build vivado_carry] -part xc7s15ftgb196-1 -force
set_property target_language VHDL [current_project]
add_files [list [file join $base parte_a src divisor.vhd]]
add_files [glob -directory [file join $base parte_b src] *.vhd]
add_files -fileset sim_1 [list [file join $base parte_b tb tb_carry.vhd]]
set_property file_type {VHDL 2008} [get_files *.vhd]
add_files -fileset constrs_1 [list [file join $base constraints top_B.xdc]]
set_property top top_B [get_filesets sources_1]
set_property top tb_carry [get_filesets sim_1]
set_property xsim.simulate.runtime {650ns} [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
launch_simulation
log_wave -r /*
restart
remove_wave [get_waves *]
add_wave /tb_carry/clk /tb_carry/rst
add_wave -radix unsigned /tb_carry/A /tb_carry/B /tb_carry/dut/op /tb_carry/dut/resultado
add_wave /tb_carry/carry
add_wave -radix bin /tb_carry/resultado
run all

