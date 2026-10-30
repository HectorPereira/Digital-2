# Diagramas del Laboratorio 2

`Laboratorio 2 ALU.drawio` contiene tres páginas con objetos y conexiones editables:

1. **Parte A — vista general:** separación de SW, ALU monolítica, resultado, banderas y habilitación de 3,3 V.
2. **Parte B — arquitectura:** unidades aritmética, lógica, desplazamiento y comparación; control derivado de opcode; selección del resultado y de Carry; cálculo de Zero.
3. **Unidad aritmética — sumador único:** selección de operandos, una instancia de adder4 y adaptación de la bandera. Las tablas de selección de operandos y de Carry/Zero están en el informe LaTeX, dentro de Metodología; se excluyen del diagrama para mantenerlo compacto.

Abrir el `.drawio` con diagrams.net / draw.io para editar. El `.drawio.html` guarda el mismo diagrama embebido para el visor HTML; las pestañas permiten cambiar de página. El visor necesita cargar el script de diagrams.net, igual que el archivo original.

Los archivos `vista_01.png`, `vista_02.png` y `vista_03.png` corresponden a las últimas exportaciones del usuario, tomadas de Descargas el 22/10/2026 a las 19:54--19:55. Las imágenes del informe en `../imagenes/` usan esas mismas exportaciones. Las vistas SVG anteriores se archivaron en `original/` porque preceden a las modificaciones manuales.

La fuente editable vigente se actualizó desde `Laboratorio 2 ALU.drawio(2).html`. Para cambios posteriores se debe partir de este `.drawio` y volver a exportar desde draw.io; el generador inicial en `tmp/` no contiene las modificaciones manuales del usuario.

Estos diagramas describen la arquitectura propuesta antes de implementar el VHDL. Carry indica acarreo para suma e incrementos, préstamo para resta, decrementos y complemento a dos (interpretado como 0-X), y el bit descartado para desplazamientos. Vale cero en lógica y comparación. La definición completa está en el informe, en «Convención adoptada para las banderas». El formato de comparación utiliza cmp_sel para elegir eq o gt y codifica el booleano como 0001 o 0000.

La copia inicial vacía del HTML se conserva en `original/`. También se actualizó el archivo original de Descargas solicitado por el usuario.
