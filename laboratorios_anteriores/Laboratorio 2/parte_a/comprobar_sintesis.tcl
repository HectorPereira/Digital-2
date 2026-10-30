set_param general.maxThreads 2
set source_dir [file dirname [file normalize [info script]]]
create_project -in_memory -part xc7s15ftgb196-1
read_vhdl [list [file join $source_dir alu.vhd]]
synth_design -top alu -part xc7s15ftgb196-1
set latches [get_cells -hierarchical -quiet -filter {REF_NAME =~ LD*}]
if {[llength $latches] != 0} {
    error "Se detectaron latches: $latches"
}
set registers [get_cells -hierarchical -quiet -filter {REF_NAME =~ FD*}]
if {[llength $registers] != 0} {
    error "Se detectaron registros en una ALU que debe ser combinacional: $registers"
}
report_utilization -file utilizacion_parte_a.rpt
puts "PASS_SYNTH: ALU sintetizada sin latches ni registros."
close_project
exit
