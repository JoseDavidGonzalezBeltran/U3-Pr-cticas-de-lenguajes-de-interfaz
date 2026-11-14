; nombre: jose david gonzalez beltran
; materia: lenguajes de interfaz
; profesor: jose luis medina jimenez

INCLUDE Irvine32.inc

.data
    msg_Bienvenida BYTE "inicio del programa ", 0
    msg_Proc       BYTE "procedimiento ejecutandose", 0
    msg_Fin        BYTE "programa finalizado", 0

.code
main PROC
    ; muestra el mensaje de inicio del programa en la consola
    mov edx, OFFSET msg_Bienvenida
    call WriteString
    call Crlf

    ; primera llamada al procedimiento de aviso
    call MensajeAviso

    ; asigna el valor 10 al registro eax (demostracion de flujo)
    mov eax, 10

    ; segunda llamada al procedimiento de aviso
    call MensajeAviso

    ; asigna el valor 20 al registro eax
    mov eax, 20

    ; muestra el mensaje de finalizacion del programa
    mov edx, OFFSET msg_Fin
    call WriteString
    call Crlf

    exit
main ENDP

; procedimiento auxiliar para imprimir el mensaje de aviso en pantalla
MensajeAviso PROC
    mov edx, OFFSET msg_Proc
    call WriteString
    call Crlf
    ret
MensajeAviso ENDP

END main