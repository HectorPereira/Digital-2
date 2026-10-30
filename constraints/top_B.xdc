# Laboratorio 3 - Parte B - Spartan Edge Accelerator + shield UTEC
# Correspondencia: LED(0) -> LED1 fisico del shield -> FPGAIO9.
# Reset verificado en el esquema del shield: Arduino D2, pin A10.

# Reloj de 100 MHz
set_property PACKAGE_PIN H4 [get_ports {clk}]
set_property IOSTANDARD LVCMOS33 [get_ports {clk}]
create_clock -name sys_clk -period 10.000 [get_ports {clk}]

# Reset activo alto: D2 del conector Arduino
set_property PACKAGE_PIN A10 [get_ports {rst}]
set_property IOSTANDARD LVCMOS33 [get_ports {rst}]

# Contador de 10 bits: LED(0) = LSB
# FPGAIO9 a FPGAIO0, de LED1 a LED10 fisicos del shield
set_property PACKAGE_PIN E11 [get_ports {LED[0]}]
set_property PACKAGE_PIN P5  [get_ports {LED[1]}]
set_property PACKAGE_PIN D3  [get_ports {LED[2]}]
set_property PACKAGE_PIN B14 [get_ports {LED[3]}]
set_property PACKAGE_PIN M10 [get_ports {LED[4]}]
set_property PACKAGE_PIN N10 [get_ports {LED[5]}]
set_property PACKAGE_PIN B13 [get_ports {LED[6]}]
set_property PACKAGE_PIN C4  [get_ports {LED[7]}]
set_property PACKAGE_PIN M14 [get_ports {LED[8]}]
set_property PACKAGE_PIN N14 [get_ports {LED[9]}]
set_property IOSTANDARD LVCMOS33 [get_ports {LED[*]}]

# Habilita alimentacion 3,3 V del shield, activo bajo
set_property PACKAGE_PIN L13 [get_ports {AR_3V3_EN}]
set_property IOSTANDARD LVCMOS33 [get_ports {AR_3V3_EN}]

# Operand A: bit 0 en D3, bits 1..3 en D4..D6
set_property -dict {PACKAGE_PIN B6 IOSTANDARD LVCMOS33} [get_ports {A[0]}]; # D3
set_property -dict {PACKAGE_PIN A5 IOSTANDARD LVCMOS33} [get_ports {A[1]}]; # D4
set_property -dict {PACKAGE_PIN B5 IOSTANDARD LVCMOS33} [get_ports {A[2]}]; # D5
set_property -dict {PACKAGE_PIN A4 IOSTANDARD LVCMOS33} [get_ports {A[3]}]; # D6
set_property -dict {PACKAGE_PIN A3 IOSTANDARD LVCMOS33} [get_ports {B[0]}]; # D7
set_property -dict {PACKAGE_PIN B3 IOSTANDARD LVCMOS33} [get_ports {B[1]}]; # D8
set_property -dict {PACKAGE_PIN A2 IOSTANDARD LVCMOS33} [get_ports {B[2]}]; # D9
set_property -dict {PACKAGE_PIN B2 IOSTANDARD LVCMOS33} [get_ports {B[3]}]; # D10

# Propiedades de configuracion segun XDC maestro de SEA
set_property CONFIG_VOLTAGE 3.3 [current_design]
set_property CFGBVS VCCO [current_design]
