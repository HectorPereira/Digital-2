set base [file normalize [file dirname [info script]]]
set letra [lindex $argv 0]
set out [file join $base build implementacion_$letra]
file mkdir $out
create_project -in_memory -part xc7s15ftgb196-1
read_vhdl -vhdl2008 [list [file join $base parte_a src divisor.vhd]]
if {$letra eq "A"} {
 read_vhdl -vhdl2008 [list [file join $base parte_a src contador.vhd] [file join $base parte_a src top_A.vhd]]
} else {
 read_vhdl -vhdl2008 [glob -directory [file join $base parte_b src] *.vhd]
}
read_xdc [list [file join $base constraints top_$letra.xdc]]
synth_design -top top_$letra -part xc7s15ftgb196-1
report_utilization -force -file [file join $out utilizacion_sintesis.rpt]
write_checkpoint -force [file join $out sintesis.dcp]
opt_design
place_design
route_design
report_io -force -file [file join $out pines.rpt]
report_drc -force -file [file join $out drc.rpt]
report_timing_summary -report_unconstrained -force -file [file join $out timing.rpt]
report_utilization -force -file [file join $out utilizacion_final.rpt]
write_checkpoint -force [file join $out implementacion.dcp]

