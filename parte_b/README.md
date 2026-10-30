# Parte B — primera implementación

Implementación nueva basada en la consigna; no se recibieron fuentes del colega para esta parte. FSM enumerada en tres procesos, datapath separado y top que reutiliza el divisor de Parte A. LED9:8=op, LED4:0=resultado; carry cero en operaciones lógicas.

Testbench integrado con MAX=4 y reloj 10 ns: más de tres vueltas de estados, retención entre pulsos, reset síncrono desde OR y reinicio del divisor. Recorre todos los 256 pares de operandos para cada una de las cuatro operaciones. Pasó en XSim 2025.1, fin a 605001 ps.

Crear el proyecto ejecutando crear_proyecto.tcl desde Vivado. XDC cotejado con esquema y XDC maestro; implementación y bitstream completados. Ver evidencias/implementacion/. No se ha validado hardware.
