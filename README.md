# Calculadora en Ensamblador MIPS con Interfaz Python

## Archivo: main.asm

### Datos
- `result`: Almacena el resultado de la operación.
- `operand1`, `operand2`: Almacenan los operandos de la operación.
- `operation`: Almacena la operación a realizar.

### Funciones

#### `main`
- Ciclo principal del programa.
- Lee operandos y operación desde la entrada estándar.
- Realiza la operación seleccionada o muestra un mensaje de opción no válida.
- Imprime el resultado y termina el programa si la operación es 0.

#### `add_operation`
- Suma los valores de `operand1` y `operand2`.

#### `sub_operation`
- Resta `operand2` de `operand1`.

#### `mul_operation`
- Multiplica `operand1` por `operand2`.

#### `div_operation`
- Divide `operand1` por `operand2` y almacena el cociente en `result`.

#### `exit_program`
- Imprime el resultado en la salida estándar y termina el programa.

### Datos Adicionales
- `invalid_option_msg`: Mensaje de opción no válida.

## Archivo: main.py

### Funciones

#### `ejecutar_calculadora`
- Bucle principal que solicita operandos y operación al usuario.
- Ejecuta el programa en ensamblador MIPS como un proceso hijo.
- Envia datos de entrada al programa MIPS y muestra el resultado.

### Ejecución
- Llama a `ejecutar_calculadora` si el script es ejecutado directamente.

## Ejecución del Código MIPS en ModelSim

A continuación se presenta una guía básica para ejecutar el código MIPS utilizando ModelSim. Este ejemplo asume que ya has cargado el código en ensamblador (`main.asm`) en tu entorno de ModelSim.

## Pasos

1. **Cargar el Archivo de Ensamblador MIPS:**
   - Asegúrate de tener tu archivo de ensamblador MIPS (`main.asm`) en la carpeta del proyecto de ModelSim.

2. **Simulación y Ejecución:**
   - Abre la consola de ModelSim y navega a la carpeta del proyecto.
   - Ejecuta los siguientes comandos para cargar y compilar el archivo de ensamblador y luego ejecutar la simulación:

     ```tcl
     vlog main.asm      ; Compilar el archivo de ensamblador (Verilog puede ser generado en el proceso)
     vsim work.main     ; Iniciar la simulación para el módulo main
     run -all           ; Ejecutar la simulación hasta el final
     ```

3. **Revisar Resultados:**
   - Después de ejecutar la simulación, puedes revisar los resultados en la consola de ModelSim o utilizar herramientas gráficas de visualización para inspeccionar los registros y la memoria.

4. **Depurar si es Necesario:**
   - Si encuentras algún problema o necesitas depurar el código, puedes utilizar las funciones de depuración de ModelSim, establecer puntos de interrupción y observar el comportamiento del código en cada ciclo de reloj.

## Observaciones

- ModelSim es una herramienta de simulación de hardware, por lo que estás simulando el comportamiento del código en un entorno de simulación en lugar de ejecutarlo en un procesador físico MIPS.

- Asegúrate de ajustar los comandos según las características específicas de tu entorno y proyecto.

Esta guía proporciona pasos generales y puede necesitar adaptaciones según la configuración exacta de tu entorno y proyecto.
