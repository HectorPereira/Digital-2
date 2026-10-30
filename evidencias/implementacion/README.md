# Implementación verificada

Vivado 2025.1, xc7s15ftgb196-1, MAX=100000000, reloj 100 MHz. Síntesis y place/route completos de ambas partes. DRC final sin violaciones. Bitstreams generados; no se programó hardware.

| Parte | LUT | Registros | WNS ns | WHS ns |
|---|---:|---:|---:|---:|
| A | 15 | 38 | 5.897 | 0.251 |
| B | 16 | 32 | 6.270 | 0.275 |

TNS y THS cero en ambas. Los retardos externos de switches/LED no están especificados; el cierre temporal corresponde a las rutas restringidas internas. No se agregaron retardos ni excepciones ficticias para ocultar esos avisos.

Se corrigió CFGBVS-1 usando CONFIG_VOLTAGE=3.3 y CFGBVS=VCCO del XDC maestro. La repetición de DRC sobre los checkpoints corregidos no registra violaciones. Las salidas constantes de alimentación y LEDs sin uso producen advertencias esperadas de síntesis.

Reproducir desde la raíz mediante Vivado batch con verificar_implementacion.tcl -tclargs A, después B y finalmente finalizar_implementacion.tcl. Los scripts de creación de proyectos GUI también incorporan ambos XDC. La tabla de conexiones está en constraints/PINES_VERIFICADOS.md. Los .bit se encuentran en parte_a/ y parte_b/ de esta carpeta. Ver sha256.json para huellas de fuentes y resultados.
