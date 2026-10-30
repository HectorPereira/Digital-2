log_wave -r /*
add_wave /tb_parte_A/clk
add_wave /tb_parte_A/rst
add_wave /tb_parte_A/en
add_wave -radix unsigned /tb_parte_A/q
run all
save_wave_config parte_a_corregida.wcfg
