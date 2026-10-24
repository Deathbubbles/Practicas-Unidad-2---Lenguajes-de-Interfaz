INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Cadena con decimal
; Descripcion: convertir un numero en una cadena de texto para poder guardarla o mostrarla.
.data
    numero    DWORD 125         ; numero que se va a convertir
    cadena    BYTE 11 DUP(0)    ; espacio donde se guarda el texto
    msgSalida BYTE "La cadena es: ", 0
 
.code
main PROC
 
    mov eax, numero
    mov ebx, 10
    mov ecx, 0
 
    ; Al dividir entre 10, el residuo es el ultimo digito del numero
    ; (125 -> 5, luego 12 -> 2, luego 1 -> 1).
    ; Cada digito se guarda en la pila; ECX cuenta cuantos son.
    ; Se repite hasta que el cociente sea 0.
extraer:
    mov edx, 0                  ; EDX debe estar en 0 antes de dividir
    div ebx
    push edx
    inc ecx
    cmp eax, 0
    jne extraer
 
    ; Los digitos salieron al reves 5, 2, 1, pero la pila los
    ; devuelve en el orden correcto (1, 2, 5).
    ; Cada digito se convierte en caracter sumandole '0' y se
    ; guarda en la cadena. LOOP repite una vez por digito.

    mov esi, OFFSET cadena
construir:
    pop eax
    add al, '0'
    mov [esi], al
    inc esi
    loop construir
 
    ; Un byte 0 marca el final de la cadena
    mov BYTE PTR [esi], 0
 
    ; Ya se muestra el resultado
    mov edx, OFFSET msgSalida
    call WriteString
    mov edx, OFFSET cadena
    call WriteString
    call Crlf
 
    exit
main ENDP
 
END main