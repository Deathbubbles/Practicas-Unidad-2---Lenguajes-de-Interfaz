INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Comparacion y prueba
; Descripcion: Ver como CMP y TEST modifican las banderas sin tener que cambiar los valores comparados

.code
main PROC
 
    ; CMP: Los valores son iguales (5 - 5 = 0)
    ; Resultado esperado: ZF = 1 porque son iguales
    mov al, 5
    cmp al, 5
    call DumpRegs
 
    ; 2 - CMP: El primer valor es menor (3 - 5 = -2)
    ; Resultado esperado: CF = 1 porque el primer numero es menor, SF = 1 copia el bit mas alto y su signo en este caso 1 es el menos, ZF = 0 
    mov al, 3
    cmp al, 5
    call DumpRegs
 
    ; 3 - CMP: El primer valor es mayor (8 - 5 = 3)
    ; Resultado esperado: CF = 0, SF = 0, ZF = 0
    mov al, 8
    cmp al, 5
    call DumpRegs
 
    ; 4 - TEST: El bit 0 esta en 0 da numero par
    ; Es un AND donde no se guarda el resultado solamente se actualiza la bandera 
    ; Resultado esperado: ZF = 1
    mov al, 00000110b
    test al, 00000001b
    call DumpRegs
 
    ; 5 - TEST: El bit 0 esta en 1 da numero impar
    ; En este caso como es impar ZF se quedara en 0
    ; Resultado esperado: ZF = 0
    mov al, 00000111b
    test al, 00000001b
    call DumpRegs
 
    exit
main ENDP
 
END main