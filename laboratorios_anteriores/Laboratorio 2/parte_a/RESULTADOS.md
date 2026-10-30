# Verificacion de la Parte A

Fecha: 22/10/2026. Herramientas: Vivado / XSim 2025.1. FPGA de sintesis: xc7s15ftgb196-1.

## Simulacion funcional

- Analisis VHDL y elaboracion completados.
- Resultado final: `PASS: 4096 casos verificados (Result, Carry, Zero y AR_3V3_EN).`
- 16 opcodes con 256 combinaciones de A y B en cada uno.
- 10 ns entre estimulos; ultimo caso comprobado a los 40960 ns (40,96 us).
- Se usa aritmetica entera en el modelo de referencia, incluyendo calculo bit a bit independiente para AND, OR y XOR.
- Log: `simulacion/simulacion.log`.
- Ondas: `simulacion/alu_parte_a_sim.wdb`.

El registro recursivo de ondas emitio una advertencia de objetos no registrables por tipo o tamano; no afecto las comprobaciones de las salidas ni el resultado PASS. La simulacion se ejecuto por linea de comandos; las capturas del visor de ondas quedan para la revision en la interfaz.

## Sintesis

- Resultado: `PASS_SYNTH: ALU sintetizada sin latches ni registros.`
- 0 errores y 0 advertencias criticas.
- 33 Slice LUTs (conteo ajustado por combinacion de LUTs), 6 MUXF7 y 1 MUXF8.
- 0 registros, 0 latches, 0 BRAM y 0 DSP.
- Reporte: `simulacion/utilizacion_parte_a.rpt`.
- Log: `simulacion/sintesis.log`.

Las advertencias de sintesis corresponden a la salida AR_3V3_EN constante y a criterios de paralelizacion. La salida constante es intencional y se requiere para habilitar el shield. Estos datos corresponden a sintesis, sin XDC, colocacion ni ruteo; no se midieron retardos ni funcionamiento fisico.
