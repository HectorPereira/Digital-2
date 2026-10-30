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
