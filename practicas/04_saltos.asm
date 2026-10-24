INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Saltos
; Descripcion: Comprender como funcionan los saltos de lineas condicionales e incondicionales usando las banderas de CMP

.data
    msgJmp   BYTE "JMP: salto directo a la etiqueta", 0
    msgSaltado BYTE "hola", 0
    msgIgual BYTE "JE: los valores son iguales", 0
    msgDist  BYTE "JNE: los valores son diferentes", 0
    msgMayor BYTE "JG: el primero es mayor", 0
    msgMenor BYTE "JL: el primero es menor", 0
 
.code
main PROC

    ; JMP siempre salta, sin revisar ninguna bandera
    jmp mostrarJmp
 
    mov edx, OFFSET msgSaltado      ; Esta instruccion nunca se muestra
    call WriteString
    call Crlf
 
mostrarJmp:
    mov edx, OFFSET msgJmp
    call WriteString
    call Crlf
 
    ; JE y JNE estan basados en las banderas y para eso se tiene comparar
    ; JE salta si ZF = 1, JNE salta si ZF = 0
    mov eax, 5
    cmp eax, 5
    je iguales                      
 
    mov edx, OFFSET msgDist         ; solo se ejecuta si no eran iguales
    call WriteString
    call Crlf
    jmp parte3
 
iguales:
    mov edx, OFFSET msgIgual
    call WriteString
    call Crlf
 
    ; JG y JL igual se comparan pero aqui si es mayor o menor 
    ; JG salta si el primero es mayor, JL si es menor
parte3:
    mov eax, 8
    cmp eax, 3
    jg esMayor                      
 
    mov edx, OFFSET msgMenor        ; solo se ejecuta si no era mayor
    call WriteString
    call Crlf
    jmp fin
 
esMayor:
    mov edx, OFFSET msgMayor
    call WriteString
    call Crlf
 
fin:
    exit
main ENDP
 
END main