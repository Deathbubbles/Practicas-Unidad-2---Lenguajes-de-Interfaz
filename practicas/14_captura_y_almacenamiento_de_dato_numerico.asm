INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Captura y Almacenamiento de dato numerico
; Descripcion: Captura cuantas unidades llegaron (1 a 99), la guarda en cantidadRecibida, la suma a la existencia inicial (25) y muestra la existencia actual.

.data
    buffer             BYTE 21 DUP(0)   ; texto que escribe el usuario
    textoNumero        BYTE 11 DUP(0)   ; texto del numero a mostrar
 
    existenciaInicial  DWORD 25
    cantidadRecibida   DWORD 0
    existenciaActual   DWORD 0
 
    msgPedir   BYTE "Unidades de ESP32 recibidas (1 a 99): ", 0
    msgError   BYTE "Entrada invalida. Escribe uno o dos digitos entre 1 y 99.", 0
    msgActual  BYTE "Existencia actual: ", 0
    msgUnidades BYTE " unidades", 0
 
.code
main PROC
 
    ; Si la entrada es invalida, el programa regresa aqui
    ; y vuelve a pedir la cantidad.
pedir:
    mov edx, OFFSET msgPedir
    call WriteString
 
    mov edx, OFFSET buffer
    mov ecx, 20
    call ReadString             
 
    ; Debe tener 1 o 2 caracteres, y todos deben ser digitos.
    ; Asi se rechazan vacios, letras, signos y espacios.
    cmp eax, 1
    jb invalido                 ; vacia
    cmp eax, 2
    ja invalido                 ; mas de dos caracteres
 
    mov ecx, eax                ; ECX = caracteres a revisar
    mov esi, OFFSET buffer
    mov eax, 0                  ; EAX guarda el numero acumulado
 
convertir:
    movzx ebx, BYTE PTR [esi]
    cmp bl, '0'
    jb invalido                 ; no es digito
    cmp bl, '9'
    ja invalido                 ; no es digito
 

    ; Se resta '0' para obtener el valor del digito y se acumula:
    ;     resultado = resultado * 10 + digito
    sub bl, '0'
    imul eax, 10
    add eax, ebx
    inc esi
    loop convertir
 
    ; Con dos digitos el maximo es 99; solo falta rechazar el 0
    cmp eax, 1
    jb invalido
 
    ; Aqui se guarda y se suma
    mov cantidadRecibida, eax
 
    add eax, existenciaInicial  ; existencia = 25 + cantidad recibida
    mov existenciaActual, eax
 
    ; El numero se convierte a texto con convertirDecimal
    ; recibe el numero en EAX y la direccion del buffer en ESI
    mov edx, OFFSET msgActual
    call WriteString
 
    mov eax, existenciaActual
    mov esi, OFFSET textoNumero
    call convertirDecimal
 
    mov edx, OFFSET textoNumero
    call WriteString
 
    mov edx, OFFSET msgUnidades
    call WriteString
    call Crlf
    jmp fin
 
invalido:
    mov edx, OFFSET msgError
    call WriteString
    call Crlf
    jmp pedir
 
fin:
    exit
main ENDP
 
convertirDecimal PROC
    push eax
    push ebx
    push ecx
    push edx
    push esi
 
    mov ebx, 10
    mov ecx, 0                  ; cuenta los digitos
 
extraer:
    mov edx, 0
    div ebx                     ; EDX = digito, EAX = lo que falta
    push edx
    inc ecx
    cmp eax, 0
    jne extraer
 
construir:
    pop eax
    add al, '0'
    mov [esi], al
    inc esi
    loop construir
 
    mov BYTE PTR [esi], 0       ; fin de la cadena
 
    pop esi
    pop edx
    pop ecx
    pop ebx
    pop eax
    ret
convertirDecimal ENDP
 
END main