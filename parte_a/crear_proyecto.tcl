set base [file normalize [file join [file dirname [info script]] ..]]
set destino [file join $base build vivado_parte_a]
create_project lab3_parte_a $destino -part xc7s15ftgb196-1 -force
set_property target_language VHDL [current_project]
add_files [list [file join $base parte_a src divisor.vhd] [file join $base parte_a src contador.vhd] [file join $base parte_a src top_A.vhd]]
add_files -fileset constrs_1 [list [file join $base constraints top_A.xdc]]
add_files -fileset sim_1 [list [file join $base parte_a tb tb_parte_A.vhd]]
set_property file_type {VHDL 2008} [get_files *.vhd]
set_property top top_A [get_filesets sources_1]
set_property top tb_parte_A [get_filesets sim_1]
set_property xsim.simulate.runtime {500ns} [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
close_project

