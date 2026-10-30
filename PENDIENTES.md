# Estado y próximos pasos

## Solicitar al colega
Enviar el proyecto de Vivado completo en ZIP (incluyendo fuentes y restricciones), o al menos:
- Parte A: divisor.vhd, contador.vhd, top y testbench.
- Parte B: FSM, datapath, top y testbench.
- Archivos .xdc, versión de Vivado y dispositivo seleccionado.
- Capturas y registros de simulación, y evidencia de pruebas en placa si existen.
- Videos o enlaces y dificultades encontradas.

El LaTeX y los enlaces externos del PDF se revisaron: solo apuntan a documentación AMD UG901, UG900 y UG903. No hay enlace a repositorio, Drive, Overleaf ni archivos del grupo. El apartado Evidencias y archivos contiene una instrucción pendiente para agregarlos.

## Trabajo técnico
- Revisar las fuentes recibidas y ejecutar los testbenches.
- Parte A: pulso cada MAX ciclos, duración de un ciclo, incremento, desborde y reset.
- Parte B: dos ciclos completos, retención sin enable, reset fuera de AND, varios operandos por operación y suma con carry.
- Comprobar XDC: pines del shield, create_clock, LVCMOS33 y AR_3V3_EN a cero.
- Validar ambas partes en placa y coordinar presentación presencial.
- Grabar un video por parte con simulación y hardware.

## Informe
- Completar autores, resumen, resultados observados, capturas, enlaces y conclusiones experimentales.
- Ajustar afirmaciones en pasado a lo realmente realizado.
- Dibujar LED9:8 desde op de la FSM; agregar reset y retención sin enable al diagrama de estados.
- Mantener aclaración: incremento a 1 Hz implica señal de LED0 a 0,5 Hz.
- Confirmar el límite de páginas, mencionado sin cifra en la rúbrica.

## Privacidad del entorno de colaboración
No mencionar ni enlazar el GitHub interno en los informes de entrega. Se quitó la sugerencia genérica de enlazar un repositorio en secciones/07_evidencias.tex. El PDF y LaTeX archivados en originales/ conservan esa sugerencia genérica; no contienen la URL de nuestro GitHub. No usar esos originales como entrega final.

## Paquete Parte A recibido
Proyecto recibido y revisado: faltan los tres VHDL, el XDC y el testbench. Ver parte_a/REVISION_RECIBIDO.md. La revisión de código y la simulación siguen pendientes.

## Actualización: segundo paquete de Parte A
Ya se recibieron VHDL, XDC y testbench. Sustituye el bloqueo anterior por fuentes faltantes. Simulación XSim aprobada; ver parte_a/REVISION_RECIBIDO.md. Pendientes: captura, cotejo de pines, implementación/placa y Parte B.

## Captura de Parte A incorporada
Captura recibida incorporada como figuras/simulacion_parte_a.png. Corregida la descripción de resultados: el reset final ocurre con q=0. Agregar un reset con q distinto de cero y una aserción previa que asegure esa condición. No está validado todavía el borrado de una cuenta no nula.

## Simulación corregida y comienzo de Parte B
Reset de Parte A corregido: q=2 antes del reset, retención hasta flanco y borrado comprobados. Captura nueva incorporada. Prueba/video de placa diferidos hasta laboratorio. Parte B implementada desde consigna y simulación integrada aprobada; faltan captura, XDC de operandos y placa. Los pendientes históricos anteriores quedan sustituidos por este estado.

## Pines e implementación cerrados
Esquema y XDC maestro cotejados, XDC B completo y ambos diseños sintetizados y ruteados. DRC final sin violaciones y bitstreams A/B generados en evidencias/implementacion/. Sustituye pendientes anteriores de XDC y síntesis. Quedan captura ampliada de carry, PDF, guion y validación física.

## Captura de acarreo y PDF revisado
Prueba dedicada tb_carry con A=15, B=3: dos vueltas completas, ADD=18, carry=1 y resultado inferior=0010; aserciones correctas a 415001 ps. Captura incorporada, PDF de cinco páginas compilado y revisado visualmente. Sin menciones ni enlaces al espacio interno de colaboración. Guion de placa/video listo en GUION_LABORATORIO.md. Pendientes: autores, pruebas físicas, videos, resultados observados y conclusiones de esas pruebas.

## Remapeo físico de Parte B
A[0..3] en D6..D9 (grande 8,7,6,5); B[0..3] en D10..D13 (grande 4,3,2,1). Reset permanece D2, chico 4. Bitstream regenerado, DRC limpio y WNS 6.270 ns / WHS 0.275 ns. Repetir las pruebas físicas de B con este mapeo.

## Orden final de bits confirmado
A0..A3 = DIP grande 5,6,7,8; B0..B3 = DIP grande 1,2,3,4. MSB de A en 8 y de B en 4. Reset chico 4. Bitstream regenerado, WNS 5.913 ns y WHS 0.251 ns, DRC sin violaciones. Sustituye el orden anterior.

## Informe completado con resultados físicos confirmados
Autores confirmados: Isaac Martirena y Héctor Pereira. Reset de ambas partes y suma con acarreo confirmados por el usuario. Completados resumen, métodos, tabla observada, discusión, preguntas y conclusiones. Sin marcadores Completar ni referencias internas. Restan edición de videos finales con simulación, enlaces de entrega y presentación presencial si no fue realizada.
