# Parte A: ALU monolitica

El diseno usa un unico `process` con `case`, variables y condiciones `if`. Las operaciones sobre `unsigned` usan `numeric_std`. En los desplazamientos se unen los bits con `&` y se agrega un cero; en las sumas se antepone un cero para conservar el acarreo en un quinto bit. La estructura sigue el esquema de la consigna.

## Archivos

- `alu.vhd`: entidad `alu`, interfaz de la consigna y las 16 operaciones en un unico proceso combinacional.
- `tb_alu.vhd`: referencia independiente con enteros; 4096 entradas binarias; comprueba Result, Carry, Zero y AR_3V3_EN.
- `configurar_vivado.tcl`: agrega el testbench al proyecto abierto y configura los tops y una simulacion de 50 us.
- `simular.ps1`: repite el analisis, elaboracion y simulacion con las herramientas de Vivado 2025.1.
- `comprobar_sintesis.tcl`: sintesis independiente para la FPGA xc7s15ftgb196-1 y comprobacion de ausencia de latches y registros.
- `simulacion/`: logs, base de ondas WDB y reporte de utilizacion de las pruebas ejecutadas.

La copia de `alu.vhd` del proyecto original de Vivado ya se actualizo en:

`C:/Users/hecto/OneDrive/Documents/UTEC/Digital 2/Laboratorio/Lab 2/project_1.srcs/sources_1/new/alu.vhd`

La plantilla vacia anterior se conserva en `original/alu_vivado_inicial.vhd`.

## Ver la simulacion en el proyecto de Vivado

Con el proyecto `Lab 2/project_1.xpr` abierto, ejecutar en su consola Tcl:

```tcl
source {C:/Users/hecto/OneDrive/Documents/ChatGPT/UTEC/Digital 2/Laboratorio 2/parte_a/configurar_vivado.tcl}
```

Luego elegir **Run Simulation > Run Behavioral Simulation**. El top de simulacion sera `tb_alu`, el top de diseno `alu` y la duracion configurada 50 us, suficiente para que terminen las 4096 pruebas a los 40,96 us. Si ya habia una simulacion abierta antes de agregar el testbench, cerrarla y volver a iniciarla.

Alternativa manual: Add Sources > Add or Create Simulation Sources > Add Files, elegir `tb_alu.vhd`, marcar `tb_alu` como top de simulacion y usar **Run All**. El tiempo predeterminado de 1000 ns no alcanza para completar todos los casos.

En las ondas, las senales internas A, B y opcode estan dentro de `uut`. A y B pueden verse en base decimal sin signo, opcode en binario, Result en binario o hexadecimal y las banderas como bits.

## Convencion aplicada

Carry indica acarreo en suma e incremento, prestamo en resta, decremento y complemento a dos (0-X), o el bit descartado en desplazamientos. Es cero para logica y comparaciones. Zero comprueba si el resultado final de cuatro bits es cero. Son las mismas reglas del informe y los diagramas.

## Alcance de las comprobaciones

La simulacion funcional se ejecuto y paso los 4096 casos. La sintesis tambien se ejecuto, sin registros ni latches. Todavia no se hizo implementacion fisica, asignacion de pines, bitstream ni pruebas en placa para esta Parte A. La sintesis preliminar no utiliza un XDC y no valida retardos fisicos.

El script Tcl de configuracion del proyecto se entrega para ejecutarlo dentro de la sesion de Vivado del usuario; no se modifico el XPR abierto desde una segunda instancia.
