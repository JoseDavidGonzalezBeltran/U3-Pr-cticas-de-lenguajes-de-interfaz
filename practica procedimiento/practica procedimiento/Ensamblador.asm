INCLUDE Irvine32.inc

.data
    mensajeInicio BYTE "inicio de pograma", 0
    mensajeProcedimiento BYTE "Estoy en el procedimiento", 0
    mensajeFin BYTE "fin del programa", 0

.code
main PROC

    mov edx, OFFSET mensajeInicio
    call WriteString
    call Crlf


    call mensajeAviso

    mov eax, 10

    call mensajeAviso
    mov eax, 20


    mov edx, OFFSET mensajeFin
    call WriteString
    call Crlf

    exit
main ENDP

mensajeAviso PROC
    mov edx, OFFSET mensajeProcedimiento 
    call WriteString
    call Crlf
mensajeAviso ENDP

END main