INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: String Hexadecimal
; Descripcion: convertir un numero en una cadena de texto hexadecimal

.data
    numero    DWORD 3054        ; numero que se va a convertir
    cadena    BYTE 9 DUP(0)     ; espacio donde se guarda el texto
    msgSalida BYTE "El numero en hexadecimal es: ", 0
 
.code
main PROC
 
    mov eax, numero
    mov ebx, 16                 ; ahora se divide entre 16
    mov ecx, 0
 
    ; Al dividir entre 16, el residuo es el ultimo digito hexadecimal
    ; (valor de 0 a 15). Cada digito se guarda en la pila y ECX
    ; cuenta cuantos son. Se repite hasta que el cociente sea 0.
extraer:
    mov edx, 0
    div ebx
    push edx
    inc ecx
    cmp eax, 0
    jne extraer
 
    ; La pila devuelve los digitos en el orden correcto.
    ; Cada digito se convierte en caracter:
    ;   - de 0 a 9   -> se suma '0'      (0 -> '0', 9 -> '9')
    ;   - de 10 a 15 -> se suma 'A' - 10 (10 -> 'A', 15 -> 'F')
    mov esi, OFFSET cadena
construir:
    pop eax
    cmp al, 9
    jbe esNumero                ; si es 9 o menos, es un digito normal
    add al, 'A' - 10            ; si es 10 o mas, es una letra A-F
    jmp guardar
esNumero:
    add al, '0'
guardar:
    mov [esi], al
    inc esi
    loop construir
 
    ; Un byte 0 marca el final de la cadena
    mov BYTE PTR [esi], 0
 
    ; Mostrar resultado
    mov edx, OFFSET msgSalida
    call WriteString
    mov edx, OFFSET cadena
    call WriteString
    call Crlf
 
    exit
main ENDP
 
END main