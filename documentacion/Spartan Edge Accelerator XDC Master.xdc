## ############################################################################
## XDC MAESTRO - Spartan Edge Accelerator Board (SEA), Seeed v1.0
## FPGA: Xilinx Spartan-7  XC7S15  (parte Vivado: xc7s15ftgb196-1)
##
## Derivado del esquematico oficial de Seeed (no existe un .xdc publicado).
## Convencion (estilo Digilent): TODAS las lineas estan COMENTADAS.
## Para usar una senal: descomentar su linea y cambiar el nombre dentro de
## get_ports { ... } por el puerto de su modulo VHDL.
##
## Todos los bancos de E/S de usuario estan a 3.3 V -> IOSTANDARD LVCMOS33.
## Nota: los pines Arduino (AR_Dx) pasan por un divisor 5V->3.3V en la placa;
##       los pines FPGAIO son E/S directas del FPGA.
## ############################################################################

## ===========================================================================
## RELOJ DEL SISTEMA  (oscilador onboard X2 = 100 MHz, pin H4)
## ===========================================================================
# set_property -dict { PACKAGE_PIN H4 IOSTANDARD LVCMOS33 } [get_ports { CLK }];
# create_clock -name sys_clk -period 10.000 -waveform {0 5.000} [get_ports { CLK }];
##   period 10.000 ns  <-> 100 MHz.  (100 MHz = 10 ns por ciclo)

## ===========================================================================
## HEADER FPGAIO  (E/S directas del FPGA, 3.3 V)  -- los 10 LEDs del shield UTEC
## ===========================================================================
# set_property -dict { PACKAGE_PIN N14 IOSTANDARD LVCMOS33 } [get_ports { FPGAIO0 }];
# set_property -dict { PACKAGE_PIN M14 IOSTANDARD LVCMOS33 } [get_ports { FPGAIO1 }];
# set_property -dict { PACKAGE_PIN C4  IOSTANDARD LVCMOS33 } [get_ports { FPGAIO2 }];
# set_property -dict { PACKAGE_PIN B13 IOSTANDARD LVCMOS33 } [get_ports { FPGAIO3 }];
# set_property -dict { PACKAGE_PIN N10 IOSTANDARD LVCMOS33 } [get_ports { FPGAIO4 }];
# set_property -dict { PACKAGE_PIN M10 IOSTANDARD LVCMOS33 } [get_ports { FPGAIO5 }];
# set_property -dict { PACKAGE_PIN B14 IOSTANDARD LVCMOS33 } [get_ports { FPGAIO6 }];
# set_property -dict { PACKAGE_PIN D3  IOSTANDARD LVCMOS33 } [get_ports { FPGAIO7 }];
# set_property -dict { PACKAGE_PIN P5  IOSTANDARD LVCMOS33 } [get_ports { FPGAIO8 }];
# set_property -dict { PACKAGE_PIN E11 IOSTANDARD LVCMOS33 } [get_ports { FPGAIO9 }];
## Extra (existen en el FPGA, no siempre ruteadas al header de 10):
# set_property -dict { PACKAGE_PIN C3  IOSTANDARD LVCMOS33 } [get_ports { FPGAIO10 }];
# set_property -dict { PACKAGE_PIN M4  IOSTANDARD LVCMOS33 } [get_ports { FPGAIO11 }];
# set_property -dict { PACKAGE_PIN C10 IOSTANDARD LVCMOS33 } [get_ports { FPGAIO12 }];
# set_property -dict { PACKAGE_PIN D10 IOSTANDARD LVCMOS33 } [get_ports { FPGAIO13 }];

## ===========================================================================
## !!! HABILITACION DEL 3.3V DEL HEADER ARDUINO  -- IMPRESCINDIBLE !!!
## El 3.3V del header Arduino esta cortado por defecto (MOSFET-P Q2/Q3 con
## pull-up). Para encenderlo, el diseno DEBE manejar el pin L13 (AR_3V3_EN)
## en BAJO ('0'). Sin esto no hay 3.3V y los dip-switches no funcionan.
## En el VHDL:  AR_3V3_EN <= '0';
## ===========================================================================
# set_property -dict { PACKAGE_PIN L13 IOSTANDARD LVCMOS33 } [get_ports { AR_3V3_EN }];

## ===========================================================================
## HEADER ARDUINO - pines digitales D0..D13  (via divisor 5V<->3.3V)
## Los 14 dip-switches del shield UTEC entran justo aqui (D0..D13).
## ===========================================================================
# set_property -dict { PACKAGE_PIN A12 IOSTANDARD LVCMOS33 } [get_ports { AR_D0 }];  ## D0 / RX
# set_property -dict { PACKAGE_PIN C12 IOSTANDARD LVCMOS33 } [get_ports { AR_D1 }];  ## D1 / TX
# set_property -dict { PACKAGE_PIN A10 IOSTANDARD LVCMOS33 } [get_ports { AR_D2 }];
# set_property -dict { PACKAGE_PIN B6  IOSTANDARD LVCMOS33 } [get_ports { AR_D3 }];
# set_property -dict { PACKAGE_PIN A5  IOSTANDARD LVCMOS33 } [get_ports { AR_D4 }];
# set_property -dict { PACKAGE_PIN B5  IOSTANDARD LVCMOS33 } [get_ports { AR_D5 }];
# set_property -dict { PACKAGE_PIN A4  IOSTANDARD LVCMOS33 } [get_ports { AR_D6 }];
# set_property -dict { PACKAGE_PIN A3  IOSTANDARD LVCMOS33 } [get_ports { AR_D7 }];
# set_property -dict { PACKAGE_PIN B3  IOSTANDARD LVCMOS33 } [get_ports { AR_D8 }];
# set_property -dict { PACKAGE_PIN A2  IOSTANDARD LVCMOS33 } [get_ports { AR_D9 }];
# set_property -dict { PACKAGE_PIN B2  IOSTANDARD LVCMOS33 } [get_ports { AR_D10 }];
# set_property -dict { PACKAGE_PIN B1  IOSTANDARD LVCMOS33 } [get_ports { AR_D11 }];
# set_property -dict { PACKAGE_PIN H1  IOSTANDARD LVCMOS33 } [get_ports { AR_D12 }];
# set_property -dict { PACKAGE_PIN H2  IOSTANDARD LVCMOS33 } [get_ports { AR_D13 }];

## ===========================================================================
## LEDs de usuario onboard
## ===========================================================================
# set_property -dict { PACKAGE_PIN J1  IOSTANDARD LVCMOS33 } [get_ports { LED1 }];
# set_property -dict { PACKAGE_PIN A13 IOSTANDARD LVCMOS33 } [get_ports { LED2 }];

## LED RGB direccionable onboard (una linea de datos)
# set_property -dict { PACKAGE_PIN N11 IOSTANDARD LVCMOS33 } [get_ports { RGB }];

## ===========================================================================
## Teclas / switches onboard  (verificar polaridad al usarlas)
## ===========================================================================
# set_property -dict { PACKAGE_PIN M2  IOSTANDARD LVCMOS33 } [get_ports { KEY1 }];
# set_property -dict { PACKAGE_PIN L2  IOSTANDARD LVCMOS33 } [get_ports { KEY2 }];
# set_property -dict { PACKAGE_PIN L3  IOSTANDARD LVCMOS33 } [get_ports { KEY3 }];
# set_property -dict { PACKAGE_PIN K3  IOSTANDARD LVCMOS33 } [get_ports { KEY4 }];

## Boton de reset del FPGA
# set_property -dict { PACKAGE_PIN D14 IOSTANDARD LVCMOS33 } [get_ports { RST_BTN }];

## ===========================================================================
## Opciones de configuracion utiles (bitstream)
## ===========================================================================
# set_property CONFIG_VOLTAGE 3.3 [current_design]
# set_property CFGBVS VCCO [current_design]
