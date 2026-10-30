set base [file normalize [file join [file dirname [info script]] ..]]
open_wave_database [file join $base evidencias waveforms parte_a.wdb]
create_wave_config parte_a
add_wave /tb_parte_A/clk
add_wave /tb_parte_A/rst
add_wave /tb_parte_A/en
add_wave /tb_parte_A/q
save_wave_config [file join $base evidencias waveforms parte_a.wcfg]
open_wave_database [file join $base evidencias waveforms parte_b.wdb]
create_wave_config parte_b
add_wave /tb_parte_B/clk
add_wave /tb_parte_B/rst
add_wave /tb_parte_B/A
add_wave /tb_parte_B/B
add_wave /tb_parte_B/dut/en
add_wave /tb_parte_B/dut/op
add_wave /tb_parte_B/dut/resultado
save_wave_config [file join $base evidencias waveforms parte_b.wcfg]
open_wave_database [file join $base evidencias waveforms carry.wdb]
create_wave_config carry
add_wave /tb_carry/clk
add_wave /tb_carry/rst
add_wave /tb_carry/A
add_wave /tb_carry/B
add_wave /tb_carry/dut/op
add_wave /tb_carry/dut/resultado
add_wave /tb_carry/carry
add_wave /tb_carry/resultado
save_wave_config [file join $base evidencias waveforms carry.wcfg]

