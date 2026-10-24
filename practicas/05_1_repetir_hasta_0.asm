INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Repetir hasta 0
; Descripcion: Ciclo condicional que pide numeros al usuario y se repite hasta que se ingrese el 0
 
.data
    msgPedir    BYTE "Escribe un numero (0 para terminar): ", 0
    msgNumero   BYTE "Ingresaste: ", 0
    msgTotal    BYTE "Numeros capturados (sin contar el 0): ", 0
 
.code
main PROC
 
    mov ebx, 0                  ; EBX cuenta cuantos numeros se capturaron
 

    ; No se sabe cuantas veces se va a repetir: depende del usuario.
    ; En cada vuelta se pide un numero y se compara con 0.
    ; Si es 0, sale del ciclo; si no, lo muestra y regresa a pedir otro.
pedir:
    mov edx, OFFSET msgPedir
    call WriteString
    call ReadInt                ; EAX = numero escrito
 
    cmp eax, 0
    je fin                      ; si es 0, termina el ciclo
 
    mov edx, OFFSET msgNumero
    call WriteString
    call WriteInt
    call Crlf
 
    inc ebx                     ; un numero mas capturado
    jmp pedir                   ; regresa al inicio del ciclo
 
    ; Mostrar el total
fin:
    mov edx, OFFSET msgTotal
    call WriteString
    mov eax, ebx
    call WriteDec
    call Crlf
 
    exit
main ENDP
 
END main