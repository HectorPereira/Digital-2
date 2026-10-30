set base [file normalize [file dirname [info script]]]
foreach letra {A B} {
 set out [file join $base build implementacion_$letra]
 open_checkpoint [file join $out implementacion.dcp]
 set_property CONFIG_VOLTAGE 3.3 [current_design]
 set_property CFGBVS VCCO [current_design]
 report_drc -file [file join $out drc.rpt] -force
 write_checkpoint -force [file join $out implementacion.dcp]
 write_bitstream -force [file join $out top_$letra.bit]
 close_design
}
