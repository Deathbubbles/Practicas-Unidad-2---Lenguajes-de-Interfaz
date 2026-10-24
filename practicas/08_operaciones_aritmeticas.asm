INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Operaciones Aritmeticas
; Descripcion: Ver el uso de operaciones aritmeticas

.data
    msgSuma  BYTE "ADD: 10 + 4 = ", 0
    msgResta BYTE "SUB: 10 - 4 = ", 0
    msgMul   BYTE "MUL: 10 * 4 = ", 0
    msgCoc   BYTE "DIV: 17 / 5, cociente = ", 0
    msgRes   BYTE "DIV: 17 / 5, residuo  = ", 0
 
.code
main PROC
 
    ; ADD es simplemente una suma
    mov edx, OFFSET msgSuma
    call WriteString
 
    mov eax, 10
    add eax, 4                  
    call WriteDec
    call Crlf
 
    ; SUB es una resta 
    mov edx, OFFSET msgResta
    call WriteString
 
    mov eax, 10
    sub eax, 4                  
    call WriteDec
    call Crlf
 
    ; MUL es para multiplicar 
    ; El resultado queda en EAX y EDX si es muy grande
    mov edx, OFFSET msgMul
    call WriteString
 
    mov eax, 10
    mov ebx, 4
    mul ebx                     
    call WriteDec
    call Crlf
 
    ; DIV es para dividir
    ; Antes de dividir, EDX debe valer 0 el dividendo es EDX:EAX
    mov eax, 17                 ; dividendo
    mov edx, 0                 
    mov ebx, 5                  ; divisor
    div ebx                   
 
    mov ecx, edx                
                                
 
    mov edx, OFFSET msgCoc
    call WriteString
    call WriteDec               ; muestra el cociente EAX = 3
    call Crlf
 
    mov edx, OFFSET msgRes
    call WriteString
    mov eax, ecx                ; EAX = residuo
    call WriteDec               ; muestra el residuo 2
    call Crlf
 
    exit
main ENDP
 
END main