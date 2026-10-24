INCLUDE Irvine32.inc
; Materia: Lenguajes de Interfaz
; Alumno: Ernie Osuna Soto
; Horario: 8:00 - 9:00
; Docente: Dr. José Luis Medina Jiménez
; Practica: Crear y guardar textos txt
; Descripcion: Comprender la creacion de textos txt

.data
    nombreArchivo BYTE "Inventario.txt", 0
    texto BYTE "125", 0
    archivohandle DWORD ?

    mensajeExito BYTE "Archivo guardado correctamente.", 0
    mensajeError Byte "No se pudo guardar el archivo", 0
.code
main PROC
    ; 1. Crear archivo txt.
    mov edx, OFFSET nombreArchivo
    call CreateOutputFile

    cmp eax, INVALID_HANDLE_VALUE
    je error

    mov archivoHandle, eax

    ; 2. Escribir caracteres en archivo txt.
    mov eax, archivoHandle
    mov edx, OFFSET texto
    mov ecx, SIZEOF texto - 1
    call WriteToFile

    jc errorEscritura

    cmp eax, SIZEOF texto - 1
    jne errorEscritura
    
    ; 3. Cerrar archivo txt
    mov eax, archivoHandle
    call CloseFile

    test eax, eax
    jz error

    mov edx, OFFSET mensajeExito
    call WriteString
    jmp fin

errorEscritura:
    mov eax, archivoHandle
    call CloseFile
error:
    mov edx, OFFSET mensajeError
    call WriteString

fin:
    exit
main ENDP
END main