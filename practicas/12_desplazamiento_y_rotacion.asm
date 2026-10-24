INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Desplazamiento y Rotacion
; Descripcion: Comprender como funciona el desplazamiento y rotacion de funciones dentro de ensamblador

.code
main PROC
 
    ; 1 - SHL : DESPLAZAR UNA POSICION A LA IZQUIERDA
    mov al, 00001101b
    shl al, 1
 
    call WriteBin
    call DumpRegs
 
 
    ; 2 - SHR : DESPLAZAR UNA POSICION A LA DERECHA
    mov al, 00001101b
    shr al, 1
 
    call WriteBin
    call DumpRegs
 
    ; 3 - SAR: ES COMO SHR PERO COPIA EL BIT DE SIGNO EN LUGAR DE METER UN 0
    mov al, -8
    sar al, 1
 
    call WriteBin
    call DumpRegs
    
    ; 4 - SAR: CON OPERACIONES NO EXACTAS, SAR REDONDEA HACIA ABAJO 
    mov al, -9
    sar al, 1
 
    call WriteBin
    call DumpRegs
 
    ; 5 - CONTEO: DESPLAZAR 2 BITS HACIA LA IZQUIERDA CON CONSTANTE
    mov al, 00001111b
    shl al, 2
 
    call WriteBin
    call DumpRegs
 
    ; 6 - DESPLAZAR 2 BITS HACIA LA DERECHA UTILIZANDO CL
    mov al, 00001111b
    mov cl, 2
    shr al, cl
 
    call WriteBin
    call DumpRegs
 
    ; 7 - ROR, ROL, RCL, RCR
    ; EL ROR MUEVE EL BIT QUE ESTA EN LA DERECHA Y LO MUEVE PARA LA IZQUIERDA
    mov al, 10010110b
    ror al, 1
    call WriteBin
    call DumpRegs

    ; EL ROL ES LO MISMO NOMAS QUE DE IZQUIERDA A DERECHA
    mov al, 10010110b
    rol al, 1
    call WriteBin
    call DumpRegs

    ; EL RCL ES COMO EL ROL PERO AL TOMAR EL VALOR DEL BIT SE PASA AL CF Y EL VALOR QUE TENIA CF ES EL QUE SE INTEGRA DEJANDO EL VALOR QUE TOMO EN CF 
    clc
    mov al, 10010110b
    rcl al, 1
    call WriteBin
    call DumpRegs

    ; EL RCR ES LO MISMO QUE EL RCL NOMAS QUE DE DERECHA A IZQUIERDA
    clc
    mov al, 10010110b
    rcr al, 1
    call WriteBin
    call DumpRegs
 
    exit
 
main ENDP
 
END main