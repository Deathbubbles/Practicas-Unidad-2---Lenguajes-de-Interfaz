INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Condicionales
; Descripcion: Comprender como funcionan los ciclos que dependen de una condicion para que se repitan

.data
    msg1 BYTE "1. Condicion al inicio (mientras EAX <= 3):", 0
    msg2 BYTE "2. Condicion al final (se ejecuta al menos una vez):", 0
 
.code
main PROC
 
    ; Primero se revisa la condicion y despues se ejecuta el bloque.
    ; Si la condicion falla desde el principio, el bloque no se ejecuta.
    mov edx, OFFSET msg1
    call WriteString
    call Crlf
 
    mov eax, 1                  ; valor inicial
 
inicio1:
    cmp eax, 3
    jg fin1                     ; Si EAX > 3, sale del ciclo
 
    call WriteDec               
    call Crlf
    inc eax                     ; Incrementa EAX
    jmp inicio1            
 
fin1:
 
    ; Primero se ejecuta el bloque y despues se revisa la condicion.
    ; El bloque se ejecuta minimo una vez, aunque la condicion sea falsa.
    mov edx, OFFSET msg2
    call WriteString
    call Crlf
 
    mov eax, 10                 ; valor inicial (ya es mayor que 3)
 
inicio2:
    call WriteDec              
    call Crlf
    inc eax                     ; Incrementa EAX 
 
    cmp eax, 3
    jl inicio2                  ; Si EAX < 3, repite pero aqui ya no se cumple
 
    exit
main ENDP
 
END main