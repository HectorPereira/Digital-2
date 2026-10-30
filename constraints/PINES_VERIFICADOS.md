# Pines verificados — Laboratorio 3

Fuentes: documentacion/Shield para FPGA.pdf (esquema del shield) y documentacion/Spartan Edge Accelerator XDC Master.xdc (header a encapsulado). El esquema se revisó visualmente. Los informes anteriores no conservaban un XDC completo; no se afirma haber recuperado una asignación de operandos anterior.

Se mantienen LEDs y reset de Parte A. Los operandos de Parte B usan una asignación nueva, compatible con el mismo shield:

Las posiciones de DIP fueron identificadas en la placa por el usuario. El mapeo actual reúne ambos operandos en el DIP grande; el reset permanece en el chico, posición 4.

| Señal | Header | FPGA | DIP físico |
|---|---|---|---|
| clk | reloj 100 MHz | H4 | — |
| rst | D2 | A10 | Chico 4 |
| A[0] | D9 | A2 | Grande 5 |
| A[1] | D8 | B3 | Grande 6 |
| A[2] | D7 | A3 | Grande 7 |
| A[3] | D6 | A4 | Grande 8 |
| B[0] | D13 | H2 | Grande 1 |
| B[1] | D12 | H1 | Grande 2 |
| B[2] | D11 | B1 | Grande 3 |
| B[3] | D10 | B2 | Grande 4 |
| AR_3V3_EN | alimentación activa baja | L13 | — |

Los DIP chico 1, 2 y 3 quedan sin uso en la Parte B (D5, D4 y D3 respectivamente).

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

## Identificación física aportada por el usuario
D2=chico 4; D3=chico 3; D4=chico 2; D5=chico 1; D6=grande 8; D7=grande 7; D8=grande 6; D9=grande 5; D10=grande 4. Combinada con los ocho contactos del DIP grande y D6..D13, D11..D13 corresponden a grande 3,2,1. La tabla principal refleja el mapeo final: A3 en grande 8 y B3 en grande 4.
