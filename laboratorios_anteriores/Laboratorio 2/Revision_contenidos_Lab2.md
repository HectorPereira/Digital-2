# Laboratorio 2 de Digital 2: revisión de contenidos

Revisión: 22/10/2026. Alcance: consigna de seis páginas, rúbrica de cuatro páginas, apuntes locales de `Digital 2/Moodle scrape` y transcripciones disponibles hasta el 08/10. Esta lista prepara el repaso y los complementos; todavía no es la resolución del laboratorio.

No hay una carpeta local llamada «Contenido». Tomo como material de partida los apuntes y las transcripciones de Digital 2. «Falta» significa que necesitamos un desarrollo específico para este laboratorio, no necesariamente que el concepto nunca se haya mencionado en clase.

## 1. Qué ya tenemos y qué repasar

| Concepto | Evidencia en el material disponible | Qué conviene repasar |
|---|---|---|
| Lógica combinacional y multiplexores | `Logica-Combinacional-en-FPGA.pdf`, especialmente pp. 6–11 y 27–28; `VHDL-Fundamentos-del-Lenguaje.pdf`, pp. 30–37 y 46–47 | Proceso combinacional, lista de sensibilidad, `case`, `when others`, valores por defecto y ausencia de latches. |
| VHDL básico y operaciones | `VHDL-Fundamentos-del-Lenguaje.pdf`, pp. 22–28 y 34–37 | Variables `:=` frente a señales `<=`, concatenación, recortes de buses, operadores lógicos, relacionales y desplazamientos. |
| Tipos numéricos | `Logica-Combinacional-en-FPGA.pdf`, pp. 3–5; `Una-ALU-como-caso-de-estudio-completo.pdf`, pp. 29–41 | `std_logic_vector` como bus, `unsigned` para aritmética, conversiones y resultado limitado al ancho disponible. |
| Diseño jerárquico | `diseñojerarquicoPPT.pdf`, pp. 3–18 y 27–32; `Una-ALU-como-caso-de-estudio-completo.pdf`, pp. 3–4 y 34–35 | Entidad/arquitectura, `component`, `port map`, señales internas, sumador de cuatro bits, selección de salidas y parametrización. |
| Testbench y autoverificación | `VHDL-Fundamentos-del-Lenguaje.pdf`, pp. 42–43; `Una-ALU-como-caso-de-estudio-completo.pdf`, pp. 5, 11–14 y 36–40 | Estímulos, resultados esperados, `assert`, `report`, tiempos de espera y lectura de formas de onda. |
| Complemento a dos y desborde | `Una-ALU-como-caso-de-estudio-completo.pdf`, pp. 15, 36 y 41; transcripción 04/09, alrededor de 6:27 y 25:36 | Interpretación con/sin signo y vuelta al inicio del rango. Falta conectarlo explícitamente con las banderas del laboratorio. |
| Diseño top-down e implementación bottom-up | Transcripción 01/10, 7:54–11:45; aplicada al laboratorio en la del 08/10, 12:11–12:48 | Definir primero bloques e interfaces; implementar y verificar desde los bloques pequeños hacia el sistema completo. Ya está explicado en clase: conviene pasarlo a un apunte breve. |
| Placa, pines e informe | `Shield para FPGA.pdf`, `FPGA Pinout.xlsx`, `Spartan Edge Accelerator XDC Master.xdc`, plantilla IEEE y trabajo del Laboratorio 1 | Recuperar el procedimiento de Vivado/JTAG y revisar el mapeo contra los documentos originales. No inventar pines a partir de la tabla resumida de la consigna. |

## 2. Lista priorizada para agregar a la carpeta de contenido

### Prioridad 1: antes de programar

- [ ] **Aritmética de cuatro bits y banderas.** Rango 0–15, resultado módulo 16, extensión de operandos a cinco bits antes de sumar, Carry de suma, borrow de resta y Zero calculado sobre el resultado final. Diferenciar acarreo sin signo de overflow con signo. Ejemplos: 15+1, 0−1, A=B y A<B.
- [ ] **Contrato completo de las 16 operaciones.** Tabla con opcode, operación, resultado, Carry y casos de borde. Incluir comparaciones con salida `0001`/`0000`, complemento a dos módulo 16 y desplazamientos lógicos con relleno cero. Zero indica si Result es cero: no es una bandera independiente de igualdad entre A y B.
- [ ] **Una sola instancia de sumador para toda la unidad aritmética.** Tabla de selección de operandos y `cin` para A+B, A−B, A±1, B±1 y comp2(A/B). Explicar A−B = A + NOT(B) + 1 y por qué el `cout` de esa suma representa ausencia de préstamo: para exponer borrow se invierte. Separar esta regla de las convenciones aún no definidas para las otras operaciones.
- [ ] **Patrón de implementación combinacional aplicado a esta ALU.** Variables temporales, asignaciones por defecto, lista sensible completa y cálculo de Zero a partir del resultado recién calculado. Evitar leer una señal que todavía conserva el valor anterior dentro del mismo proceso. La ALU no requiere reloj; el reloj de los ejemplos de testbench solo organiza estímulos.

### Prioridad 2: antes de verificar e integrar

- [ ] **Verificación exhaustiva y modelo de referencia independiente.** La ALU tiene 16×16×16 = 4096 entradas binarias posibles. Proponer recorrerlas con bucles y comprobar Result, Carry y Zero; comparar también Parte A contra Parte B, sin usar esa igualdad como única prueba de corrección. El sumador tiene 16×16×2 = 512 combinaciones y la rúbrica pide probarlas todas para Destacado.
- [ ] **Verificación modular y tiempos de simulación.** Un banco para cada módulo y otro para la ALU completa; esperar la propagación de los procesos y ciclos delta antes de comprobar. Incluir diagnóstico con opcode, A, B, esperado y obtenido, y cierre sin errores. Una captura aislada no reemplaza la verificación de todos los casos.
- [ ] **Puente entre la ALU del apunte y la del laboratorio.** El apunte ejemplifica cuatro operaciones y operandos de cinco bits; el laboratorio pide 16 operaciones, operandos de cuatro bits, dos banderas y el bus `SW = opcode & B & A`. La Parte B agrega la reutilización de un único sumador, no un sumador y un restador independientes como en el ejemplo del apunte.
- [ ] **Guía corta de integración en placa.** Separación `A=SW(3 downto 0)`, `B=SW(7 downto 4)`, `opcode=SW(11 downto 8)`; Result y banderas en LEDs; `AR_3V3_EN='0'`, pin L13 y LVCMOS33; revisión de restricciones, síntesis sin latches, bitstream, JTAG y pruebas repetibles.

### Prioridad 3: para responder y documentar

- [ ] **Metodología y comparación de arquitecturas.** Convertir la explicación de las clases del 01/10 y 08/10 en un resumen aplicado al laboratorio: top-down/bottom-up, modularidad, reutilización, localización de fallos y costos de integración. No afirmar mejoras de recursos o velocidad sin medirlas.
- [ ] **Extensión de ALU y paso a procesador.** Propuesta concreta de ALU de ocho bits: anchos, sumador, resultado, banderas, pruebas e interfaz física. Para procesador: registros, contador de programa, memoria de instrucciones, decodificación/control y secuencia buscar–decodificar–ejecutar, con ejemplos de instrucciones. El material de memoria y secuencial sirve de base, pero falta la integración aplicada a esta pregunta.
- [ ] **Evidencias e informe técnico.** Guion de video, tabla de pruebas con resultados esperados, capturas legibles, registro de errores reales y correcciones, respuestas justificadas y conclusiones apoyadas en lo observado. La clase del 08/10, 12:48–13:09, pide documentar también los fallos y cómo se resolvieron.

## 3. Qué agrega la rúbrica a nuestra preparación

Objetivo de referencia: Nivel 4, Destacado. Los pesos son placa 30 %, simulación 20 %, video 10 %, organización del informe 15 %, preguntas 15 % y conclusiones 10 %.

- Ambas versiones deben producir las mismas salidas y resolver correctamente las 16 operaciones, incluidas banderas y bordes. Parte A: proceso con `case` y `when others`, `numeric_std`, sin latches. Parte B: módulos separados, top estructural con `component / port map` y una única instancia de `adder4` reutilizada.
- La rúbrica concreta cinco testbenches de módulos (`adder4`, `arith_unit`, `logic_unit`, `shift_unit`, `compare_unit`) más el de la ALU completa para la Parte B. El de `adder4` debe cubrir las 512 combinaciones. Parte A necesita su testbench completo y autoverificable con referencia independiente.
- Un video por parte, cada uno con simulación y placa: al menos diez operaciones diferentes y tres combinaciones de entradas por operación. Mostrar entradas, salidas, resultado esperado y casos de borde. Preparar al menos treinta demostraciones por parte.
- Un único informe IEEE, con diagrama de jerarquía coincidente con el código, figuras/tablas numeradas y referenciadas, y diez respuestas fundamentadas (cinco de cada parte). Las conclusiones deben comparar ambas experiencias y conectar simulación con placa.
- Conservar código de ambas partes, testbenches, capturas, `.xdc`, videos e informe. La entrega incompleta ubica en Nivel 1 el aspecto correspondiente.
- La demostración presencial es obligatoria: sin ella, el criterio de funcionamiento en placa vale cero. Todos los integrantes deben poder explicar el diseño.

## 4. Decisiones y pendientes antes de fijar resultados esperados

1. **Carry definido por el equipo el 22/10.** Se mantiene acarreo para A+B, borrow para A−B y cero para lógica y comparaciones. Se completa la especificación con acarreo para incrementos (X=15), préstamo para decrementos (X=0), préstamo de 0-X para complemento a dos (X distinto de 0), y el bit descartado A(3) o A(0) para desplazamientos izquierdo o derecho. Con la tabla de operandos del sumador, Carry=cout para suma e incremento y Carry=NOT cout para resta, decremento y comp2. Zero depende siempre del resultado final de cuatro bits. La convención ya figura en el informe y en los diagramas; es una decisión del equipo para los casos no explicitados por la consigna.
2. **Límite de páginas.** La rúbrica exige respetar un máximo, pero no indica el número; la consigna revisada tampoco. Falta localizar la instrucción que lo establece antes de maquetar el informe.
3. **Jerarquía sugerida frente a evaluación.** La consigna y la clase presentan la descomposición como sugerencia; la rúbrica pide explícitamente los cinco módulos y el sumador único para Destacado. Conviene seguir esa organización.

## 5. Orden de trabajo propuesto

1. Repasar los contenidos existentes de la tabla inicial.
2. Agregar el complemento de Prioridad 1 y cerrar las convenciones pendientes.
3. Agregar verificación e integración, y después implementar la Parte A.
4. Reestructurar como Parte B, verificar módulos y equivalencia entre versiones.
5. Ejecutar pruebas reales, conservar evidencias y elaborar el informe con el complemento de Prioridad 3.

No hace falta estudiar punto flotante, `fixed_pkg`, UART, FIFO, PWM ni antirrebote para resolver el núcleo de este laboratorio. Memorias y lógica secuencial se retoman puntualmente para la propuesta de procesador.

Fuentes de requisitos: `Consigna_Laboratorio_2.pdf` (pp. 1–6) y `Rubrica_Laboratorio_2_ED2.pdf` (pp. 1–4), copiadas aquí desde Descargas. Los demás documentos permanecen en `../Moodle scrape` y las clases en `../Transcripts`.
