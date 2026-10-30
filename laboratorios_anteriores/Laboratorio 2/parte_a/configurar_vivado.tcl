# Ejecutar con source desde la consola Tcl del proyecto Lab 2 ABIERTO.
# No abre una segunda instancia ni vuelve a guardar el proyecto desde afuera.
if {[llength [get_projects -quiet]] == 0} {
    error "Abri primero el proyecto de Vivado del Laboratorio 2."
}
set source_dir [file dirname [file normalize [info script]]]
set tb_file [file join $source_dir tb_alu.vhd]
if {[llength [get_files -quiet $tb_file]] == 0} {
    add_files -fileset sim_1 -norecurse [list $tb_file]
}
set_property top alu [get_filesets sources_1]
set_property top tb_alu [get_filesets sim_1]
set_property xsim.simulate.runtime 50us [get_filesets sim_1]
update_compile_order -fileset sources_1
update_compile_order -fileset sim_1
puts "Listo: top de diseno alu; top de simulacion tb_alu; duracion 50 us."
