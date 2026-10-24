INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Push y Pop
; Descripcion: Comprender el funcionamiento de pilas dentro de ensamblador

.data
    msg1 BYTE "1. Se guardan 10, 20, 30 y salen en orden inverso:", 0
    msg2 BYTE "2. Guardar EAX, cambiarlo y recuperarlo:", 0
 
.code
main PROC
 
    ; Meter los valores a la pila con el push
    mov edx, OFFSET msg1
    call WriteString
    call Crlf
 
    push 10                     
    push 20                     
    push 30                     
 
    pop eax                     ; saca el ultimo que entro: 30
    call WriteDec
    call Crlf
 
    pop eax                     ; saca el siguiente: 20
    call WriteDec
    call Crlf
 
    pop eax                     ; saca el primero que entro: 10
    call WriteDec
    call Crlf
 
    ; Demostracion de como se puede guardar y usarlo despues
    mov edx, OFFSET msg2
    call WriteString
    call Crlf
 
    mov eax, 5
    push eax                  
 
    mov eax, 99                 ; EAX cambia a 99
    call WriteDec               
    call Crlf
 
    pop eax                     ; se recupera el 5 guardado
    call WriteDec              
    call Crlf
 
    exit
main ENDP
 
END main