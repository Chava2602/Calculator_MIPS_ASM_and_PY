.data
result: .word 0
operand1: .word 0
operand2: .word 0
operation: .word 0

.text
main:
    # Ciclo principal
    while_true:
        # Lectura de operandos y operación desde el script de Python
        li $v0, 5       # Código de servicio para leer un entero
        syscall
        sw $v0, operand1

        li $v0, 5
        syscall
        sw $v0, operand2

        li $v0, 5
        syscall
        sw $v0, operation

        # Verificar si el usuario desea salir (operation == 0)
        lw $t0, operation
        beq $t0, 0, exit_program

        # Realizar operación seleccionada
        beq $t0, 1, add_operation
        beq $t0, 2, sub_operation
        beq $t0, 3, mul_operation
        beq $t0, 4, div_operation

        # Mensaje de opción no válida
        invalid_option:
        li $v0, 4       # Código de servicio para imprimir cadena
        la $a0, invalid_option_msg
        syscall
        j while_true

    add_operation:
        lw $t1, operand1
        lw $t2, operand2
        add $t3, $t1, $t2
        sw $t3, result
        j while_true

    sub_operation:
        lw $t1, operand1
        lw $t2, operand2
        sub $t3, $t1, $t2
        sw $t3, result
        j while_true

    mul_operation:
        lw $t1, operand1
        lw $t2, operand2
        mul $t3, $t1, $t2
        sw $t3, result
        j while_true

    div_operation:
        lw $t1, operand1
        lw $t2, operand2
        div $t1, $t1, $t2
        mflo $t3
        sw $t3, result
        j while_true

    exit_program:
        # Imprimir resultado en la salida estándar
        li $v0, 1
        lw $a0, result
        syscall

        # Terminar el programa
        li $v0, 10
        syscall

.data
invalid_option_msg: .asciiz "Opción no válida. Por favor, elija una opción entre 1 y 4, o 0 para salir.\n"
