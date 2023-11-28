import subprocess

def ejecutar_calculadora():
    while True:
        try:
            # Obtener datos de entrada del usuario
            operand1 = int(input("Ingrese el primer operando: "))
            operand2 = int(input("Ingrese el segundo operando: "))
            operation = int(input("Ingrese la operación (1 para suma, 2 para resta, 3 para multiplicación, 4 para división, 0 para salir): "))

            # Verificar si el usuario desea salir
            if operation == 0:
                print("Saliendo de la calculadora.")
                break

            if 1 <= operation <= 4:
                # Ejecutar el programa en ensamblador MIPS como un proceso hijo
                process = subprocess.Popen(['mips_program'], stdin=subprocess.PIPE, stdout=subprocess.PIPE, text=True)

                # Enviar datos de entrada al programa MIPS
                input_data = f"{operand1}\n{operand2}\n{operation}\n"
                stdout, _ = process.communicate(input=input_data)

                # Imprimir resultado obtenido desde el programa MIPS
                print("Resultado desde el programa MIPS:", stdout)
            else:
                print("Opción no válida. Por favor, elija una opción entre 1 y 4, o 0 para salir.")

        except ValueError:
            print("Error: Ingrese números enteros válidos para operandos y la operación.")

if __name__ == "__main__":
    ejecutar_calculadora()
