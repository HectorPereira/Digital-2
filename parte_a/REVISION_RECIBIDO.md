# Revisión de Parte A recibida

El ZIP contiene únicamente el proyecto .xpr y metadatos de caché/hardware. Las dos copias extraídas del .xpr son idénticas. No se encontraron los fuentes referenciados en Descargas.

Configuración comprobada: Vivado 2025.1, dispositivo xc7s15ftgb196-1 y top_A. El conjunto sim_1 selecciona top_A, sin fuentes de testbench declaradas.

Archivos ausentes:
- divisor.vhd
- contador.vhd
- top_A.vhd
- top_A.xdc
- testbench de la Parte A

Las referencias $PPRDIR/../ apuntan fuera del directorio del proyecto. No se ejecutaron simulación, síntesis ni implementación: no hay fuentes para hacerlo. El .xpr no demuestra que esas etapas se hayan completado.

Pedir al colega: exportar desde Vivado mediante Archive Project incluyendo los archivos fuente (también los externos), o enviar los cuatro archivos anteriores más el testbench, capturas y resultados disponibles. Comprobar que el ZIP incluye realmente .vhd y .xdc antes de compartirlo.

Se incorporó un apartado de alcance de la revisión en secciones/04_resultados_discusion.tex. No se inventaron códigos ni resultados para completar la entrega. El PDF del informe no fue recompilado.
