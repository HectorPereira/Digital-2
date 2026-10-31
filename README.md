# Laboratorio 3 — Electrónica Digital 2

Abrir `Laboratorio 3.code-workspace` en Visual Studio Code. El documento principal es `main.tex`; los capítulos están en `secciones/`. Con la extensión LaTeX Workshop, ejecutar la receta «PDFLaTeX (dos pasadas)». Los resultados van a `build/`.

## Organización
- `originales/`: copias intactas del avance recibido (PDF y LaTeX).
- `documentacion/`: consigna y rúbrica.
- `secciones/` y `figuras/`: informe editable e imágenes.
- `parte_a/src`, `parte_a/tb`: divisor, contador, top y testbench verificados.
- `parte_b/src`, `parte_b/tb`: FSM, datapath, top y testbenches verificados.
- `constraints/`: archivos XDC con el mapeo final.
- `evidencias/`: capturas de simulación, pruebas en placa y videos.

El informe se organizó por secciones. Los diseños fueron simulados, implementados y programados en placa; las pruebas físicas fueron confirmadas por el equipo. Los videos de placa se enlazaron desde el PDF y las simulaciones se documentaron mediante capturas y testbenches.

El informe se compiló con MiKTeX y se revisaron sus páginas renderizadas. El PDF de trabajo actualizado está en output/Informe_Laboratorio_3_Borrador.pdf. Sigue siendo borrador: completar autores y pruebas físicas antes de entregar.

## Trabajo compartido con Git
Antes de editar, ejecutar `git pull --rebase`. Después de editar: `git add .`, `git commit -m "Describir el cambio"` y `git push`.
Guardar en VS Code no sube los cambios automáticamente. Eviten editar la misma sección al mismo tiempo. Cada integrante debe clonar el repositorio en su propia computadora.

## Informes anteriores

- [Laboratorio 1: PDF](laboratorios_anteriores/Laboratorio%201/main.pdf) y [LaTeX](laboratorios_anteriores/Laboratorio%201/main.tex).
- [Laboratorio 2: PDF](laboratorios_anteriores/Laboratorio%202/main.pdf) y [LaTeX](laboratorios_anteriores/Laboratorio%202/main.tex).

Se incluyen fuentes, imágenes y archivos de apoyo disponibles. Son copias de trabajo del dispositivo; los PDF se conservaron tal como estaban, sin recompilar ni certificar su correspondencia con la última edición LaTeX. Para editar los informes anteriores, usar las carpetas de este repositorio. El informe del laboratorio 3 permanece en la raíz.
