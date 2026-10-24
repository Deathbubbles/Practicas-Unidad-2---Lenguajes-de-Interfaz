INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Control de Estacionamiento
; Descripcion: Uso de INC y DEC para llevar la cuenta de los lugares ocupados de un estacionamiento

.data
    capacidad = 5               ; lugares totales del estacionamiento
    ocupados  DWORD 0           ; lugares ocupados actualmente
 
    msgMenu     BYTE "[E] Entra un carro   [S] Sale un carro   [X] Terminar: ", 0
    msgLleno    BYTE "El estacionamiento esta LLENO", 0
    msgVacio    BYTE "El estacionamiento esta VACIO", 0
    msgOcupados BYTE "Lugares ocupados: ", 0
    msgLibres   BYTE "Lugares libres:   ", 0
 
.code
main PROC
 
    ; Se repite hasta que el usuario presione X.
    ; ReadChar lee una tecla y la deja en AL.
menu:
    mov edx, OFFSET msgMenu
    call WriteString
    call ReadChar
    call WriteChar              ; muestra la tecla presionada
    call Crlf
 
    cmp al, 'e'
    je entrada
    cmp al, 'E'
    je entrada
    cmp al, 's'
    je salida
    cmp al, 'S'
    je salida
    cmp al, 'x'
    je fin
    cmp al, 'X'
    je fin
    jmp menu                    ; otra tecla: vuelve a pedir
 

    ; INC suma 1 a los lugares ocupados, pero solo si hay espacio.
entrada:
    cmp ocupados, capacidad
    jae lleno                   ; si ya esta lleno, no suma
    inc ocupados
    jmp mostrar
 

    ; DEC resta 1 a los lugares ocupados, pero solo si hay carros.
salida:
    cmp ocupados, 0
    je vacio                    ; si ya esta vacio, no resta
    dec ocupados
    jmp mostrar
 
lleno:
    mov edx, OFFSET msgLleno
    call WriteString
    call Crlf
    jmp mostrar
 
vacio:
    mov edx, OFFSET msgVacio
    call WriteString
    call Crlf
 
    ; Mostrar el estado 
    ; Libres = capacidad - ocupados
mostrar:
    mov edx, OFFSET msgOcupados
    call WriteString
    mov eax, ocupados
    call WriteDec
    call Crlf
 
    mov edx, OFFSET msgLibres
    call WriteString
    mov eax, capacidad
    sub eax, ocupados
    call WriteDec
    call Crlf
    call Crlf
    jmp menu
 
fin:
    exit
main ENDP
 
END main