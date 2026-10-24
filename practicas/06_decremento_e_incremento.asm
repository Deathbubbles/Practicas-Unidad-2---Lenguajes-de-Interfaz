INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Decremento e Incremento
; Descripcion: Ver como funciona INC y DEC y la diferencia que tiene con ADD
.data
    msgInc BYTE "1. INC: 5 + 1 = ", 0
    msgDec BYTE "2. DEC: 5 - 1 = ", 0
 
.code
main PROC
 
    ; INC Incrementa EAX en 1 en 1
    mov edx, OFFSET msgInc
    call WriteString
 
    mov eax, 5
    inc eax                     
    call WriteDec
    call Crlf
 
    ; DEC decrementa EAX en 1 en 1 
    mov edx, OFFSET msgDec
    call WriteString
 
    mov eax, 5
    dec eax                     
    call WriteDec
    call Crlf
 
    ; INC no modifica lo que es CF
    ; AL = 255 es el maximo de 8 bits; al sumarle 1 da 0
    clc
    mov al, 255
    inc al
    call DumpRegs
 
    ; Pero cuando se usa ADD CF guarda el 1 que sobra 
    mov al, 255
    add al, 1
    call DumpRegs
 
    exit
main ENDP
 
END main
 