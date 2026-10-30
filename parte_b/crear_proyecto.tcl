set base [file normalize [file join [file dirname [info script]] ..]]
create_project lab3_parte_b [file join $base build vivado_parte_b] -part xc7s15ftgb196-1 -force
set_property target_language VHDL [current_project]
add_files [list [file join $base parte_a src divisor.vhd]]
add_files [glob -directory [file join $base parte_b src] *.vhd]
add_files -fileset sim_1 [list [file join $base parte_b tb tb_parte_B.vhd]]
set_property file_type {VHDL 2008} [get_files *.vhd]
set_property top top_B [get_filesets sources_1]
set_property top tb_parte_B [get_filesets sim_1]
set_property xsim.simulate.runtime {650ns} [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
close_project
