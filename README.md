# Laboratorio 3 — Electrónica Digital 2

Abrir `Laboratorio 3.code-workspace` en Visual Studio Code. El documento principal es `main.tex`; los capítulos están en `secciones/`. Con la extensión LaTeX Workshop, ejecutar la receta «PDFLaTeX (dos pasadas)». Los resultados van a `build/`.

## Organización
- `originales/`: copias intactas del avance recibido (PDF y LaTeX).
- `documentacion/`: consigna y rúbrica.
- `secciones/` y `figuras/`: informe editable e imágenes.
- `parte_a/src`, `parte_a/tb`: divisor, contador, top y testbench pendientes de recibir.
- `parte_b/src`, `parte_b/tb`: FSM, datapath, top y testbench pendientes de recibir.
- `constraints/`: archivos XDC pendientes de recibir.
- `evidencias/`: capturas de simulación, pruebas en placa y videos.

Se preservó el contenido del colega al dividirlo en secciones. Los textos [Completar] siguen pendientes; no representan pruebas ejecutadas. No se ha compilado ni validado el diseño VHDL porque no se recibieron sus fuentes.

La compilación LaTeX no fue ejecutada: la instalación local de MiKTeX requiere revisar su configuración (la herramienta de PDF de esa instalación falló al acceder a su configuración). La receta queda preparada, sin instalar ni modificar software.

## Trabajo compartido con Git
Antes de editar, ejecutar `git pull --rebase`. Después de editar: `git add .`, `git commit -m "Describir el cambio"` y `git push`.
Guardar en VS Code no sube los cambios automáticamente. Eviten editar la misma sección al mismo tiempo. Cada integrante debe clonar el repositorio en su propia computadora.
