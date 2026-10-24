INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Validacion de formato
; Descripcion: Ver como se lleva a cabo la validacion de formato

.data
    msgPIN      BYTE "Ingrese el PIN: ",0
    msgIntentos BYTE "Intentos restantes: ",0
    msgError    BYTE "PIN incorrecto.",0
    msgAcceso   BYTE "Acceso permitido",0
    msgBloqueado BYTE "Autodestruccion comenzada...",0
 
    pinCorrecto = 1234
 
.code
main PROC
    mov ebx, 3          ; Numero de intentos para ingresar 
 
intentar:
    ; Aparece el mensaje de ingresar el PIN y despues lo compara en el caso que si brinca a acceso
    ; En el caso de que no este bien te manda mensaje de error y brinca hacia bloqueado cuando los intentos llegan a 0
    ; Se repite hasta que no tengas intentos

    mov edx, OFFSET msgPIN
    call WriteString
    call ReadInt
 
    cmp eax, pinCorrecto
    je acceso
 
    mov edx, OFFSET msgError
    call WriteString
    call Crlf
 
    dec ebx
 
    jz bloqueado
 
    mov edx, OFFSET msgIntentos
    call WriteString
 
    mov eax, ebx
    call WriteDec
    call Crlf
 
    jmp intentar
 
acceso:
    ; Te arroja el mensaje de acceso, brinca a fin y termina la ejecucion

    mov edx, OFFSET msgAcceso
    call WriteString
    call Crlf
    jmp fin
 
bloqueado:
    ; Te manda el mensaje de bloqueado, brinca a fin y termina la ejecucion

    mov edx, OFFSET msgBloqueado
    call WriteString
    call Crlf
    jmp fin
 
fin:
    exit
main ENDP
 
END main