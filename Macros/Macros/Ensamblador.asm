; nombre: jose david gonzalez beltran
; materia: lenguajes de interfaz
; profesor: jose luis medina jimenez

INCLUDE Irvine32.inc

; macro para mostrar un mensaje en consola 
MostrarMensaje MACRO texto
    mov edx, OFFSET texto
    call WriteString
    call Crlf
ENDM

; macro para calcular el importe multiplicando el precio por la cantidad
CalcularImporte MACRO precio, cantidad
    mov eax, precio
    imul eax, cantidad
ENDM

.data
    MensajeBienvenida BYTE "ola", 0
    MensajeFin BYTE "bai ", 0
    precio DWORD 50
    cantidad DWORD 3
    importe DWORD ?

.code
main PROC
    ;muestra el mensaje de bienvenida en pantalla
    MostrarMensaje MensajeBienvenida

    ;calcula el importe total utilizando la macro
    CalcularImporte precio, cantidad
    mov importe, eax

    ;carga el importe calculado en eax y lo imprime como entero
    mov eax, importe
    call WriteInt
    call Crlf

    ;muestra el mensaje de despedida antes de finalizar el programa
    MostrarMensaje MensajeFin

    exit
main ENDP
END main