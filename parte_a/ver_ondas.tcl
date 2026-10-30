set base [file normalize [file join [file dirname [info script]] ..]]
open_wave_database [file join $base build simulacion_a parte_a_final.wdb]
open_wave_config [file join $base build simulacion_a parte_a_corregida.wcfg]
