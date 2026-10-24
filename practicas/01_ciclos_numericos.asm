INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Ciclos numericos
; Descripcion: Entender como funcionan los ciclos numericos y como se llevan a cabo en ensamblador

.data
    msgTitulo BYTE "Contando del 1 al 5:", 0
 
.code
main PROC
 
    ; Mostrar un mensaje antes de empezar
    mov edx, OFFSET msgTitulo
    call WriteString
    call Crlf

    mov eax, 1     ; Es el numero con el que va iniciar
    mov ecx, 5     ; Es el contador del ciclo
 
inicio:
    call WriteDec       ; Muestra el numero que hay en EAX
    call Crlf           
    inc eax             ; Incrementa EAX
 
    loop inicio         ; Decrementa ECX hasta llegar a 0 y terminar
 
    exit
main ENDP
 
END main