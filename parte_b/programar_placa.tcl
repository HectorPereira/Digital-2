set base [file normalize [file join [file dirname [info script]] ..]]
open_hw_manager
connect_hw_server
set targets [get_hw_targets]
if {[llength $targets] != 1} {error "Cantidad inesperada de objetivos JTAG"}
open_hw_target [lindex $targets 0]
set devices [get_hw_devices]
if {[llength $devices] != 1} {error "Cantidad inesperada de dispositivos"}
set dev [lindex $devices 0]
if {[get_property PART $dev] ne "xc7s15"} {error "El dispositivo no es XC7S15"}
current_hw_device $dev
set_property PROGRAM.FILE [file join $base evidencias implementacion parte_b top_B.bit] $dev
program_hw_devices $dev
refresh_hw_device $dev
puts "PROGRAMACION_PARTE_B_COMPLETADA"
puts "DONE=[get_property REGISTER.IR.BIT5_DONE $dev]"
close_hw_manager

