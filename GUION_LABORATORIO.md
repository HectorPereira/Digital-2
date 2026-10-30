# Guion de pruebas y grabación — Laboratorio 3

## Llevar preparado
- Placa SEA, shield, cable USB-C y JTAG HS2.
- Vivado 2025.1 y los bitstreams de evidencias/implementacion/parte_a/top_A.bit y parte_b/top_B.bit.
- Tabla constraints/PINES_VERIFICADOS.md y los fuentes VHDL.
- Capturas y simulaciones listas. Hacer un video por parte que incluya simulación y placa.

## Parte A
1. Programar top_A.bit. Mostrar la placa y ubicar el reset D2.
2. Activar reset: todos los LEDs de cuenta deben quedar apagados. Desactivarlo.
3. Grabar al menos 12 segundos continuos desde cero, sin cortes, con LEDs legibles. Narrar algunos valores: 1, 2, 3, 4, 8, 10. LED1 físico representa el bit lógico LED[0].
4. Con una cuenta distinta de cero, activar reset y mostrar que vuelve a cero. Soltarlo y comprobar que vuelve a avanzar.
5. Mostrar la simulación corregida: reloj 10 ns, MAX=4, N=3, enable cada cuatro ciclos, desborde 7 a 0 y reset desde 2.

LED[0] cambia de nivel cada segundo: el ciclo completo encendido/apagado dura dos segundos (0,5 Hz). La cuenta sí avanza a 1 incremento/s. No esperar el desborde físico completo: ocurre cada 1024 incrementos.

## Parte B
1. Programar top_B.bit. Reset D2 = DIP chico 4. A[0..3] en D6..D9 = DIP grande 8,7,6,5. B[0..3] en D10..D13 = DIP grande 4,3,2,1. Para A=5 activar grande 8 y 6; para A=15 activar grande 8,7,6,5. Para B=3 activar grande 4 y 3.
2. Poner A=5 (0101), B=3 (0011). Activar reset y comprobar AND. Soltar y grabar al menos dos vueltas completas (8 segundos; preferible 10).
3. Leer op en LED[9:8]: 00 AND, 01 OR, 10 XOR, 11 ADD. Para A=5 y B=3 los resultados son 1, 7, 6 y 8; carry siempre cero.
4. Poner A=15 (1111), B=3 (0011). Grabar otras dos vueltas completas: resultados 3, 15, 12 y 18. En ADD, LED[4] (LED5 físico) debe encender y LED[3:0] mostrar 0010; op=11.
5. Activar reset desde OR, XOR o ADD: op vuelve a 00 y resultado pasa al AND de A y B. El reset de la FSM no obliga a que el resultado sea cero.
6. Mostrar simulación general y detalle de acarreo; indicar entradas y salidas esperadas.

## Registro para completar el informe
Anotar fecha, equipo utilizado, versión efectiva, valores observados por prueba y si coinciden con los esperados. Registrar dificultades y correcciones reales. Si una prueba falla, conservar evidencia y describir la falla.

## Calidad del video y cierre
Usar iluminación suficiente, cámara fija, foco en LEDs y switches, y explicación pausada. Evitar reflejos, manos tapando LEDs y tomas demasiado cortas. Para la simulación usar captura de pantalla; para hardware encuadrar la placa. Conservar un video final por parte con ambos segmentos. Coordinar con docentes la presentación presencial obligatoria.
