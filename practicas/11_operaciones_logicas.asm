INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Operaciones Logicas
; Descripcion: Uso de operaciones logicas para activar, desactivar, invertir y evaluar estados individuales almacenados en los bits de un registro.

.data
    msgAlarmaSi BYTE "Resultado del TEST: la alarma esta ENCENDIDA", 0
    msgAlarmaNo BYTE "Resultado del TEST: la alarma esta APAGADA", 0
 
.code
main PROC
    ; Bits de estado:
    ; 0 - Encendido
    ; 1 - Alarma
    ; 2 - Conectado
    ; Estado inicial: 00000101  (encendido y conectado)
 
 
    ; 1 - AND: EXTRAER EL ESTADO DE ENCENDIDO
    ; AND con una mascara deja solo el bit que interesa (bit 0).
    mov eax, 0
    mov ebx, 0
    mov al, 00000101b
    mov bl, al
    and bl, 00000001b
 
    call dumpRegs
    nop
 
    ; 2 - OR: ENCENDER ALARMA
    ; OR enciende el bit de la mascara sin tocar los demas (bit 1).
    mov al, 00000101b
    or al, 00000010b
 
    call dumpRegs
    nop
 
    ; 3 - XOR - DESCONECTAR Y CONECTAR COMPUTADOR
    ; XOR invierte el bit de la mascara (bit 2): si estaba en 1
    ; pasa a 0, y si estaba en 0 pasa a 1.
    xor al, 00000100b
 
    call dumpRegs
    nop
 
    ; Segunda vez: vuelve a conectar -> AL = 00000111
    xor al, 00000100b
 
    call dumpRegs
    nop
 
    ; 4 - NOT - DEVOLVER ESTADOS
    ; NOT invierte TODOS los bits del registro.
    not al
 
    call dumpRegs
    nop
 
    ; Segunda vez: se invierte otra vez y regresan los estados
    not al
 
    call dumpRegs
    nop
 
    ; 5 - TEST - EVALUAR ALARMA Y REALIZAR SALTO
    ; TEST hace un AND con la mascara del bit 1 (alarma) sin cambiar AL.
    ; Si el resultado es 0 (ZF = 1), la alarma esta apagada.
    ; Si no es 0 (ZF = 0), la alarma esta encendida.
    test al, 00000010b
    jnz alarmaEncendida         ; salta si ZF = 0
 
    mov edx, OFFSET msgAlarmaNo
    call WriteString
    call Crlf
    jmp fin
 
alarmaEncendida:
    mov edx, OFFSET msgAlarmaSi
    call WriteString
    call Crlf
 
fin:
    exit
 
main ENDP
 
END main