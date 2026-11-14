; nombre: jose david gonzalez beltran
; materia: lenguajes de interfaz
; profesor: jose luis medina jimenez

INCLUDE Irvine32.inc

.data
    msg_Bienvenida BYTE "INICIO DE PROGRAMA ", 0
    msg_Cad        BYTE "ESCRIBE UNA CADENA (TEXTO) : ", 0
    msg_Inv        BYTE "NO EXISTE LA CADENA ", 0
    mag_Val        BYTE "LA CADENA SI EXISTE  ", 0
    palabra        BYTE 20 DUP(0)
    msg_Fin        BYTE "PROGRAMA FINALIZADO ", 0

.code
main PROC
    ; muestra el mensaje de inicio del programa
    mov edx, OFFSET msg_Bienvenida
    call WriteString
    call Crlf

    ; solicita al usuario que ingrese una cadena de texto
    mov edx, OFFSET msg_Cad
    call WriteString
    call Crlf

    ; prepara el buffer y el tamaño maximo permitido para la lectura
    mov edx, OFFSET palabra
    mov ecx, SIZEOF palabra

    ; lee la cadena desde la consola; eax almacena la cantidad de caracteres leidos
    call ReadString
    call Crlf

    ; llama al procedimiento encargado de validar la existencia o longitud de la cadena
    call ValidarCad

    ; muestra el mensaje de finalizacion del programa
    mov edx, OFFSET msg_Fin
    call WriteString
    call Crlf
    
    exit
main ENDP

; procedimiento para validar si la cadena ingresada contiene caracteres (eax > 0)
ValidarCad PROC
    cmp eax, 0              ; compara la longitud de la cadena con cero
    jle invalido            ; si es menor o igual a cero, salta a la etiqueta invalido
    mov edx, OFFSET mag_Val ; carga el mensaje de que la cadena si existe
    jmp mostrar
invalido:
    mov edx, OFFSET msg_Inv ; carga el mensaje de que no existe la cadena
mostrar:
    call WriteString
    call Crlf
    ret
ValidarCad ENDP

END main