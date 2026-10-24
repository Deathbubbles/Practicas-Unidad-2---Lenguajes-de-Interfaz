INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Mayor, Menor o Igual con Entrada del Usuario
; Descripcion: Captura de dos numeros del teclado y uso de CMP con saltos condicionales para indicar si el primero es mayor, menor o igual al segundo.
.data
    msgPrimero BYTE "Escribe el primer numero: ", 0
    msgSegundo BYTE "Escribe el segundo numero: ", 0
    msgMayor   BYTE "El primer numero es MAYOR que el segundo", 0
    msgMenor   BYTE "El primer numero es MENOR que el segundo", 0
    msgIgual   BYTE "Los dos numeros son IGUALES", 0
 
.code
main PROC
 
    ; Pedir los dos numeros
    ; ReadInt lee un numero del teclado y lo deja en EAX.
    ; El primero se guarda en EBX para no perderlo.
    mov edx, OFFSET msgPrimero
    call WriteString
    call ReadInt
    mov ebx, eax                ; EBX = primer numero
 
    mov edx, OFFSET msgSegundo
    call WriteString
    call ReadInt                ; EAX = segundo numero
 

    ; CMP compara EBX con EAX y deja el resultado en las banderas.
    ; Los saltos condicionales leen esas banderas para decidir.
    cmp ebx, eax
    jg mayor                    ; salta si EBX > EAX
    jl menor                    ; salta si EBX < EAX
 
    ; Si no salto, entonces son iguales
    mov edx, OFFSET msgIgual
    jmp mostrar
 
mayor:
    mov edx, OFFSET msgMayor
    jmp mostrar
 
menor:
    mov edx, OFFSET msgMenor
 
    ; Muestra los resultados
mostrar:
    call WriteString
    call Crlf
 
    exit
main ENDP
 
END main
 