INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Captura y despliegue de mensaje
; Descripcion: Entender como funciona la captura y despliegue de mensaje en ensamblador

.data
    msgPedir   BYTE "Escribe tu nombre: ", 0
    msgSaludo  BYTE "Hola, ", 0
    nombre     BYTE 30 DUP(0)       ; Espacio en memoria para guardar el texto
 
.code
main PROC
    ; Muestra mensaje
    mov edx, OFFSET msgPedir        
    call WriteString               
 
    ; Se guarda en EDX y la cadena puede ser de hasta 29 caracteres y no 30 por el 0 final y al ultimo se lee lo que escribio el usuario
    mov edx, OFFSET nombre          
    mov ecx, 29                     
    call ReadString                
 
    ; Se muestra el mensaje junto con el nombre
    mov edx, OFFSET msgSaludo
    call WriteString
 
    mov edx, OFFSET nombre
    call WriteString
    call Crlf
 
    exit
main ENDP
 
END main