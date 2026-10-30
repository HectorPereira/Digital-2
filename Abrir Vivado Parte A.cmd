@echo off
cd /d "%~dp0"
if not exist "build\vivado_parte_a\lab3_parte_a.xpr" (
 call "C:\Xilinx\2025.1\Vivado\bin\vivado.bat" -mode batch -source "parte_a\crear_proyecto.tcl" -log "build\crear_proyecto.log" -journal "build\crear_proyecto.jou"
 if errorlevel 1 exit /b 1
)
start "" /b "C:\Xilinx\2025.1\Vivado\bin\vivado.bat" "build\vivado_parte_a\lab3_parte_a.xpr"
