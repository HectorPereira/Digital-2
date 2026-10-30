# Parte A — actualización de revisión

El segundo paquete archivos.zip incluye divisor.vhd, contador.vhd, top_A.vhd, tb_parte_A.vhd y top_A.xdc. Los originales se preservan en originales/parte_a_recibida/.

Los cuatro VHDL se analizaron con xvhdl --2008 y el testbench se elaboró y ejecutó con XSim 2025.1. Todas las aserciones pasaron; fin a 385001 ps. Evidencia: evidencias/simulacion/parte_a_xsim.log.

MAX=4, N=3, reloj 10 ns: periodicidad y ancho del enable, cuenta de referencia, retención, desborde y reset inicial/durante cuenta. El bucle genera nueve pulsos pero consume ocho: el comentario del testbench sobre nueve incrementos no es exacto. Sí alcanza a comprobar el desborde. No se modificaron los fuentes recibidos.

El top fija MAX=100000000 y N=10 y habilita AR_3V3_EN a cero. XDC incluye reloj H4, periodo 10 ns, LVCMOS33, alimentación L13 y reset A10; el propio XDC pide confirmar el switch. Pendiente cotejar todos los pines con manual del shield, capturar ondas, validar top de diez bits, síntesis/implementación y placa. El proyecto .xpr anterior aún apunta a archivos externos: no es un proyecto portátil reparado.

El informe LaTeX fue actualizado con resultados reales; no se recompiló el PDF.
