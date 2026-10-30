# Pines verificados — Laboratorio 3

Fuentes: documentacion/Shield para FPGA.pdf (esquema del shield) y documentacion/Spartan Edge Accelerator XDC Master.xdc (header a encapsulado). El esquema se revisó visualmente. Los informes anteriores no conservaban un XDC completo; no se afirma haber recuperado una asignación de operandos anterior.

Se mantienen LEDs y reset de Parte A. Los operandos de Parte B usan una asignación nueva, compatible con el mismo shield:

| Señal | Header | FPGA |
|---|---|---|
| clk | reloj 100 MHz | H4 |
| rst | D2 | A10 |
| A[0] | D3 | B6 |
| A[1] | D4 | A5 |
| A[2] | D5 | B5 |
| A[3] | D6 | A4 |
| B[0] | D7 | A3 |
| B[1] | D8 | B3 |
| B[2] | D9 | A2 |
| B[3] | D10 | B2 |
| AR_3V3_EN | alimentación activa baja | L13 |

| Bit lógico | LED físico | Header | FPGA |
|---|---|---|---|
| LED[0] | LED1 | FPGAIO9 | E11 |
| LED[1] | LED2 | FPGAIO8 | P5 |
| LED[2] | LED3 | FPGAIO7 | D3 |
| LED[3] | LED4 | FPGAIO6 | B14 |
| LED[4] | LED5 | FPGAIO5 | M10 |
| LED[5] | LED6 | FPGAIO4 | N10 |
| LED[6] | LED7 | FPGAIO3 | B13 |
| LED[7] | LED8 | FPGAIO2 | C4 |
| LED[8] | LED9 | FPGAIO1 | M14 |
| LED[9] | LED10 | FPGAIO0 | N14 |

LED[0] es el bit menos significativo, pero el shield lo rotula LED1. En Parte B LED[4] (LED5 físico) muestra carry; LED[9:8] (LED10 y LED9 físicos) muestra op. Todos los puertos usan LVCMOS33. En ambas partes AR_3V3_EN se fuerza a cero en VHDL.
